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
    procedure CompClick(Sender: TObject);
    procedure CltKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    fClientSocket : TClientSocket;

    procedure ClientSocketConnect(Sender : TObject; Socket : TCustomWinSocket);
    procedure ClientSocketDisconnet(Sender : TObject; Socket : TCustomWinSocket);
    procedure ClientSocketRead(Sender : TObject; Socket : TCustomWinSocket);
    procedure SendPressedKey(aTag : Integer; const aStr : String; aKey : Char);
    procedure SendTextToSvr(const aStr : String);
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
      OnRead := ClientSocketRead; 
    end;
  end;
  fClientSocket.Address := CltAddrEdit.Text;
  fClientSocket.Port := StrToInt(CltPortEdit.Text);
  fClientSocket.Open;
end;

procedure TMainForm.CltDisConnectBtnClick(Sender: TObject);
begin
  if fClientSocket <> nil then begin
    fClientSocket.Close;
  end;
end;

procedure TMainForm.CompClick(Sender: TObject);
begin
  if Sender = CltListBox then
    SendTextToSvr(IntToStr(CltListBox.Tag) + '0' + IntToStr(CltListBox.ItemIndex))
  else if Sender = CltComboBox then
    SendTextToSvr(IntToStr(CltComboBox.Tag) + '0' + IntToStr(CltComboBox.ItemIndex))
  else if Sender = CltScrollBar then
    SendTextToSvr(IntToStr(CltScrollBar.Tag) + '0' + IntToStr(CltScrollBar.Position))
  else if Sender = CltRadioBtn1 then
    SendTextToSvr(IntToStr(CltRadioBtn1.Tag) + '0')
  else if Sender = CltRadioBtn2 then
    SendTextToSvr(IntToStr(CltRadioBtn2.Tag) + '0')
  else if Sender = CltCheckBox1 then
    SendTextToSvr(IntToStr(CltCheckBox1.Tag) + '1')
  else if Sender = CltCheckBox2 then
    SendTextToSvr(IntToStr(CltCheckBox2.Tag) + '1')
end;

procedure TMainForm.CltKeyPress(Sender: TObject; var Key: Char);
begin
  if Sender = CltEdit then
    SendPressedKey(CltEdit.tag, CltEdit.Text, Key)
  else if Sender = CltMemo then
    SendPressedKey(CltMemo.tag, CltMemo.Text, Key);
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
begin
  CltMemo.Clear;
  if Socket <> nil then begin
    aRecv := Socket.ReceiveText;
    aTag := StrToInt(aRecv[1]);
    aSecondType := StrToInt(aRecv[2]);
    aStrCount := Length(arecv) - 2;
    aRecv := Copy(aRecv, STR_FIRST, aStrCount);
    case aTag of
      EDIT_TAG : begin
          if aSecondType = 1 then
            CltListBoxUpDate
          else
            CltEdit.text := aRecv;
        end;
      MEMO_TAG :
        CltMemo.Lines.add(aRecv);
      RADIOBTN1_TAG :
        CltCheckedUpdate(aTag);
      RADIOBTN2_TAG :
        CltCheckedUpdate(aTag);
      CHECKBOX1_TAG : begin
          CltCheckBox1.OnClick := nil;
          CltCheckedUpdate(aTag);
          CltCheckBox1.OnClick := CompClick;
        end;
      CHECKBOX2_TAG : begin
          CltCheckBox2.OnClick := nil;
          CltCheckedUpdate(aTag);
          CltCheckBox2.OnClick := CompClick;
        end;
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

procedure TMainForm.SendPressedKey(aTag : Integer; const aStr : String; aKey : Char);
begin
  if aKey = #8 then
    SendTextToSvr(IntToStr(aTag) + '0' + aStr)
  else if (aKey = #13) and (aTag = EDIT_TAG) then begin
    SendTextToSvr(IntToStr(aTag) + '1' + aStr + aKey);
    CltListBoxUpDate;
  end else
    SendTextToSvr(IntToStr(aTag) + '0' + aStr + aKey);
end;

procedure TMainForm.SendTextToSvr(const aStr : String);
begin
  if fClientSocket <> nil then begin
    fClientSocket.Socket.SendText(aStr);
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
