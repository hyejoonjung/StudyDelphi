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
    SvrSendEdit: TEdit;
    Label1: TLabel;
    SvrRecvMemo: TMemo;
    Label2: TLabel;
    CltAddrEdit: TEdit;
    Label3: TLabel;
    CltPortEdit: TEdit;
    CltConnectBtn: TButton;
    CltDisConnectBtn: TButton;
    CltSendEdit: TEdit;
    Label4: TLabel;
    CltRecvMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SvrConnectBtnClick(Sender: TObject);
    procedure SvrDisConnectBtnClick(Sender: TObject);
    procedure SvrSendEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CltConnectBtnClick(Sender: TObject);
    procedure CltDisConnectBtnClick(Sender: TObject);
    procedure CltSendEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    fServerSocket : TServerSocket; // 서버소캣생성 클라이언트따로해야한다원래.
    fClientSocket : TClientSocket; //서버소캣은 1개, 클라이언트는 여러개가 될수 있음..
//한 서버당 클라이언트는 N개가 된다. 리스너가 뜨기 때문에
//현재 윈도우 4버전은 서버소캣에 65365개
//한 서버 포트에 65365개     2Byte, word일때 기본 포맷이 만들어졌다 그래서 기본이 @Byte.
//윈도우 4버전은 6만 5천개 이상을 못열어.
//2byte 65365기본베이스 한 word형.. 소켓 하나에 포트 65365개.한서버가 맥시멈 클라이언트 갯수. 예전꺼는 못열어 포트를...4버전은...그이상은 6버전.
    procedure ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);
    procedure ClientSocketConnect(Sender : TObject; Socket : TCustomWinSocket);
    procedure ClientSocketDisconnet(Sender : TObject; Socket : TCustomWinSocket);
    procedure ClientSocketRead(Sender : TObject; Socket : TCustomWinSocket);
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
  fClientSocket := nil;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if fServerSocket <> nil then begin
    fServerSocket.Free;
    fServerSocket := nil;
  end;

  if fClientSocket <> nil then begin
    fClientSocket.Free;
    fClientSocket := nil;
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

procedure TMainForm.SvrSendEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : Integer;
begin
  if (Key = VK_RETURN) and (fServerSocket <> nil) then begin
    with fServerSocket.Socket do begin     //서버이기 때문에 클라이언트가 여러개...
      for i := 0 to ActiveConnections - 1 do //연결되어있는 커넥션들,  각 세션에 보내준다..
        Connections[i].SendText(SvrSendEdit.Text);//연결돼있는 클라이언트중 i번째. 한테 보낸다. TExt를.
    end;
  end;
end;

procedure TMainForm.ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);// 이벤트이름...ServerSocKet +(On)ClientRead이름...
begin //열루 오면, 클라이언트에서 오면 이벤트가 발생. 소켓이라는게 클라이언트의 소캣 정보이다.
  if fServerSocket <> nil then
    SvrRecvMemo.Lines.Add(Socket.ReceiveText);  //소캣을 통해 받은것을 라인에 넣는다.
end;

procedure TMainForm.CltConnectBtnClick(Sender: TObject);
begin
  if fClientSocket = nil then begin
    fClientSocket := TClientSocket.Create(Self);
    with fClientSocket do begin
      OnConnect := ClientSocketConnect;
      OnDisconnect := ClientSocketDisconnet;
      OnRead := ClientSocketRead; //서버에서 오면 이쪽으로 이벤트 발생. 
    end;
  end;
  fClientSocket.Address := CltAddrEdit.Text;
  fClientSocket.Port := StrToInt(CltPortEdit.Text);
  fClientSocket.Open;//엑티브 : True 하거나, open해주면 된다. 서버도 마찬가지.
end;

procedure TMainForm.CltDisConnectBtnClick(Sender: TObject);
begin
  if fClientSocket <> nil then begin
    fClientSocket.Close; //엑티브 false와 같지. 
  end;
  //버튼 이네이블 안해줬어. 왜냐면 커넷션, 비커넥션은 이벤트에 의해서 할려고...
end;

procedure TMainForm.CltSendEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (fClientSocket <> nil) then 
    fClientSocket.Socket.SendText(CltSendEdit.Text);
end;

procedure TMainForm.ClientSocketConnect(Sender : TObject; Socket : TCustomWinSocket);
begin
  CltConnectBtn.Enabled := False;
  CltDisconnectBtn.Enabled := True;
end;

procedure TMainForm.ClientSocketDisconnet(Sender : TObject; Socket : TCustomWinSocket);
begin
  CltConnectBtn.Enabled := True;
  CltDisconnectBtn.Enabled := False;
end;

procedure TMainForm.ClientSocketRead(Sender : TObject; Socket : TCustomWinSocket);
begin
  if Socket <> nil then
    CltRecvMemo.Lines.Add(Socket.ReceiveText);
end;
//커넥트 되고안되고는 엑티브로 확인을 한다.
//false면
//클라이언트는, send보내기전에... 엑티브되어있는지 확인하고 보내는게 맞지.
//원래 클라-서버 따로 돼있다. 
end.
