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
    procedure CltEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    fClientSocket : TClientSocket; //������Ĺ�� 1��, Ŭ���̾�Ʈ�� �������� �ɼ� ����..
//�� ������ Ŭ���̾�Ʈ�� N���� �ȴ�. �����ʰ� �߱� ������
//���� ������ 4������ ������Ĺ�� 65365��
//�� ���� ��Ʈ�� 65365��     2Byte, word�϶� �⺻ ������ ��������� �׷��� �⺻�� @Byte.
//������ 4������ 6�� 5õ�� �̻��� ������.
//2byte 65365�⺻���̽� �� word��.. ���� �ϳ��� ��Ʈ 65365��.�Ѽ����� �ƽø� Ŭ���̾�Ʈ ����. �������� ������ ��Ʈ��...4������...���̻��� 6����.
    procedure ClientSocketConnect(Sender : TObject; Socket : TCustomWinSocket);
    procedure ClientSocketDisconnet(Sender : TObject; Socket : TCustomWinSocket);
    procedure ClientSocketRead(Sender : TObject; Socket : TCustomWinSocket);
    procedure CltListBoxUpdate;
    procedure CltCheckedUpdate(aTag : Integer; const aStr : String);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const
  STR_FIRST = 4;
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
      OnRead := ClientSocketRead; //�������� ���� �������� �̺�Ʈ �߻�. 
    end;
  end;
  fClientSocket.Address := CltAddrEdit.Text;
  fClientSocket.Port := StrToInt(CltPortEdit.Text);
  fClientSocket.Open;//��Ƽ�� : True �ϰų�, open���ָ� �ȴ�. ������ ��������.
end;

procedure TMainForm.CltDisConnectBtnClick(Sender: TObject);
begin
  if fClientSocket <> nil then begin
    fClientSocket.Close; //��Ƽ�� false�� ����. 
  end;
  //��ư �̳��̺� �������. �ֳĸ� Ŀ�ݼ�, ��Ŀ�ؼ��� �̺�Ʈ�� ���ؼ� �ҷ���...
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
          if aRecv[2] = '1' then
            CltListBoxUpDate
          else begin
            aStrCount := Length(aRecv) - 3;
            aRecv := Copy(aRecv, STR_FIRST, aStrCount);
            CltEdit.text := aRecv;
          end;
        end;
      MEMO_TAG : begin
          aStrCount := Length(aRecv) - 3;
          aRecv := Copy(aRecv, STR_FIRST, aStrCount);
          CltMemo.Lines.add(aRecv);
        end;
      RADIOBTN1_TAG  : begin
          aStrCount := Length(aRecv) - 3;
          aRecv := Copy(aRecv, STR_FIRST, aStrCount);
          CltCheckedUpdate(aTag, aRecv);
        end;
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

procedure TMainForm.CltCheckedUpdate(aTag : Integer; const aStr : String);
begin
  if aTag = RADIOBTN1_TAG  then
    CltRadioBtn1.Checked  := StrToBool(aStr);
end;
//Ŀ��Ʈ �ǰ��ȵǰ��� ��Ƽ��� Ȯ���� �Ѵ�.
//false��
//Ŭ���̾�Ʈ��, send����������... ��Ƽ��Ǿ��ִ��� Ȯ���ϰ� �����°� ����.
//���� Ŭ��-���� ���� ���ִ�. 
end.