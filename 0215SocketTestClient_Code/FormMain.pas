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
    CltRadioBtn1: TRadioButton;
    CltRadioBtn2: TRadioButton;
    CltScrollBar: TScrollBar;
    CltListBox: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CltConnectBtnClick(Sender: TObject);
    procedure CltDisConnectBtnClick(Sender: TObject);

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
    procedure CltListBoxUpdate;
    procedure CltCheckedUpdate(aTag : Integer);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const
  STR_FIRST     = 3;
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
  aTag, aSecondType : Integer;
//  aRecv2 : String;
begin
  CltMemo.Clear;
  if Socket <> nil then begin
    aRecv := Socket.ReceiveText;
//    ShowMessage(IntToStr(L
    aTag := StrToInt(aRecv[1]);
    aSecondType := StrToInt(aRecv[2]);
    aStrCount := Length(arecv) - 2;
    aRecv := Copy(aRecv, STR_FIRST, aStrCount);
    case aTag of
      EDIT_TAG : begin
          if aSecondType = 1 then
            CltListBoxUpDate
          else begin
            CltEdit.text := aRecv;
          end;
        end;
      MEMO_TAG :
        CltMemo.Lines.add(aRecv);
      RADIOBTN1_TAG :
        CltCheckedUpdate(aTag);
      RADIOBTN2_TAG :
        CltCheckedUpdate(aTag);
      CHECKBOX1_TAG :
        CltCheckedUpdate(aTag);
      CHECKBOX2_TAG :
        CltCheckedUpdate(aTag);
      COMBOBOX_TAG :
        CltComboBox.ItemIndex := StrToInt(aRecv);
      SCROLLBAR_TAG :
        CltScrollBar.Position := StrToInt(aRecv);
      LISTBOX_TAG :
        CltListBox.ItemIndex := StrToInt(aRecv);
      else
        Exit;
    end;
  end;
end;

procedure TMainForm.CltListBoxUpdate;
var
  aIndex, i : Integer;
begin
  aIndex := -1;
  for i := 0 to CltListBox.Count - 1 do begin
    if CltEdit.Text = CltListBox.items[i] then begin
      aIndex := i;
      Break;
    end;
  end;
  if aIndex < 0 then begin
    CltListBox.Items.Add(CltEdit.Text);
  end else
    CltlistBox.Items.Delete(aIndex);
  CltEdit.Text := '';
end;

procedure TMainForm.CltCheckedUpdate(aTag : Integer);
begin
  if aTag = RADIOBTN1_TAG  then begin
    CltRadioBtn2.Checked := False;
    CltRadioBtn1.Checked := True;
  end else if aTag = RADIOBTN2_TAG  then begin
    CltRadioBtn1.Checked := False;
    CltRadioBtn2.Checked := True;
  end else if aTag = CHECKBOX1_TAG then
    CltCheckBox1.Checked := not(CltCheckBox1.Checked)
  else if aTag = CHECKBOX2_TAG then
    CltCheckBox2.Checked := not(CltCheckBox2.Checked);
end;

end.
