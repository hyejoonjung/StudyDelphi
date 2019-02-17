unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls;

type
  TMainForm = class(TForm)
    Label2: TLabel;
    CltAddrEdit: TEdit;
    Label3: TLabel;
    CltPortEdit: TEdit;
    CltConnectBtn: TButton;
    CltDisConnectBtn: TButton;
    CltEdit: TEdit;
    Label1: TLabel;
    CltMemo: TMemo;
    CltComboBox: TComboBox;
    CltCheckBox1: TCheckBox;
    CltCheckBox2: TCheckBox;
    CltRadioButton1: TRadioButton;
    CltRadioButton2: TRadioButton;
    CltScrollBar: TScrollBar;
    SvrListBox: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CltConnectBtnClick(Sender: TObject);
    procedure CltDisConnectBtnClick(Sender: TObject);
    procedure CltEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    fClientSocket : TClientSocket; //서버소캣은 1개, 클라이언트는 여러개가 될수 있음..
//한 서버당 클라이언트는 N개가 된다. 리스너가 뜨기 때문에
//현재 윈도우 4버전은 서버소캣에 65365개
//한 서버 포트에 65365개     2Byte, word일때 기본 포맷이 만들어졌다 그래서 기본이 @Byte.
//윈도우 4버전은 6만 5천개 이상을 못열어.
//2byte 65365기본베이스 한 word형.. 소켓 하나에 포트 65365개.한서버가 맥시멈 클라이언트 갯수. 예전꺼는 못열어 포트를...4버전은...그이상은 6버전.
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

const
  STR_FIRST = 2;
  EDIT_TAG      = 0;
  LISTBOX_TAG   = 1;
  RADIOBTN1_TAG = 2;
  RADIOBTN2_TAG = 3;
  CHECKBOX1_TAG = 4;
  CHECKBOX2_TAG = 5;
  COMBOBOX_TAG  = 6;
  SCROLLBAR_TAG = 7;
  MEMO_TAG      = 8;

  

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fClientSocket := nil;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if fClientSocket <> nil then begin
    fClientSocket.Free;
    fClientSocket := nil;
  end;
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

procedure TMainForm.CltEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (fClientSocket <> nil) then
    fClientSocket.Socket.SendText(CltEdit.Text);
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
var
  aStrCount : Integer;
  aRecv : String;
  aTag : Integer;
//  aRecv2 : String;
begin
  CltMemo.Clear;
  if Socket <> nil then begin
    aRecv := Socket.ReceiveText;
    aTag := StrToInt(aRecv[1]);
    case aTag of
      EDIT_TAG : begin
          aStrCount := Length(aRecv) - 1;
          aRecv := Copy(aRecv, STR_FIRST, aStrCount);
          CltEdit.text := aRecv;
        end;
      MEMO_TAG : begin
          aStrCount := Length(aRecv) - 1;
          aRecv := Copy(aRecv, STR_FIRST, aStrCount);
          CltMemo.Lines.add(aRecv);
        end;
      else
        Exit;
    end;
//    if aTag = EDIT_TAG then begin
//      aStrCount := Length(aRecv) - 1;
//      aRecv := Copy(aRecv, STR_FIRST, aStrCount);
//      CltEdit.text := aRecv;
//      CltMemo.Lines.add(aRecv)
//    end;

  end;
end;
//커넥트 되고안되고는 엑티브로 확인을 한다.
//false면
//클라이언트는, send보내기전에... 엑티브되어있는지 확인하고 보내는게 맞지.
//원래 클라-서버 따로 돼있다. 
end.
