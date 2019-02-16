unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls;

type
  TMainForm = class(TForm)
    SvrPortEdit: TEdit;
    Label5: TLabel;
    SvrConnectBtn: TButton;
    SvrDisConnectBtn: TButton;
    SvrEdit: TEdit;
    SvrMemo: TMemo;
    Label2: TLabel;
    SvrComboBox: TComboBox;
    SvrCheckBox1: TCheckBox;
    SvrCheckBox2: TCheckBox;
    SvrRadioButton1: TRadioButton;
    SvrRadioButton2: TRadioButton;
    SvrListBox: TListBox;
    SvrScrollBar: TScrollBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SvrConnectBtnClick(Sender: TObject);
    procedure SvrDisConnectBtnClick(Sender: TObject);
    procedure SvrEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    fServerSocket : TServerSocket; // 서버소캣생성 클라이언트따로해야한다원래.
    procedure ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fServerSocket := nil;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if fServerSocket <> nil then begin
    fServerSocket.Free;
    fServerSocket := nil;
  end;
end;

procedure TMainForm.SvrConnectBtnClick(Sender: TObject);
begin
  if fServerSocket = nil then begin
    fServerSocket := TServerSocket.Create(Self);
    with fServerSocket do
      OnClientRead := ServerSocketClientRead; // 클라이언트에서 데이터가 올때 발생 클라이언트 connect,disconnect도 있어.
  end;
  fserverSocket.port := StrToInt(SvrPortEdit.Text);       //포트 셋팅.
  fServerSocket.Active := True; //실제로 오픈시키는것. (정상이라면)비정상이면 오류
  SvrConnectBtn.Enabled := False;     //서버 커넥트를 다시 Create하지 않기 위해
  SvrDisConnectBtn.Enabled := True;  //커넥트 눌린상태니까...
end;

procedure TMainForm.SvrDisConnectBtnClick(Sender: TObject);
begin
  if fServerSocket = nil then
    Exit;
  fServerSocket.Active := False; //소켓 닫기.
  SvrConnectBtn.Enabled := True;
  SvrDisconnectBtn.Enabled := False;
end;

procedure TMainForm.SvrEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : Integer;
begin
  if (Key = VK_RETURN) and (fServerSocket <> nil) then begin
    with fServerSocket.Socket do begin     //서버이기 때문에 클라이언트가 여러개...
      for i := 0 to ActiveConnections - 1 do //연결되어있는 커넥션들,  각 세션에 보내준다..
        Connections[i].SendText(IntToStr(SvrEdit.Tag) + '/' + SvrEdit.Text);//연결돼있는 클라이언트중 i번째. 한테 보낸다. TExt를.
    end;
  end;
end;

procedure TMainForm.ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);// 이벤트이름...ServerSocKet +(On)ClientRead이름...
begin //열루 오면, 클라이언트에서 오면 이벤트가 발생. 소켓이라는게 클라이언트의 소캣 정보이다.
  if fServerSocket <> nil then
    SvrMemo.Lines.Add(Socket.ReceiveText);  //소캣을 통해 받은것을 라인에 넣는다.
end;

end.
