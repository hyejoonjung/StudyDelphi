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
    SvrRadioBtn1: TRadioButton;
    SvrRadioBtn2: TRadioButton;
    SvrListBox: TListBox;
    SvrScrollBar: TScrollBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SvrConnectBtnClick(Sender: TObject);
    procedure SvrDisConnectBtnClick(Sender: TObject);
    procedure CompClick(Sender: TObject);
    procedure SvrKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    fServerSocket : TServerSocket;
    fRemainText : String;

    procedure ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);
    procedure SendPressedKey(aTag : Integer; const aStr : String; aKey : Char);
    procedure SendTextToClt(const aStr : String);
    procedure SvrCheckedUpdate(aTag : Integer);
    procedure PacketHandle(const aPacket : String);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const
  TAG_POSITION  = 2;
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
      OnClientRead := ServerSocketClientRead;
    fServerSocket.Port := StrToInt(SvrPortEdit.Text);
    fServerSocket.Active := True;
    SvrConnectBtn.Enabled := False;
    SvrDisConnectBtn.Enabled := True;    
  end;
end;

procedure TMainForm.SvrDisConnectBtnClick(Sender: TObject);
begin
  if fServerSocket = nil then
    Exit;
  fServerSocket.Active := False;
  SvrConnectBtn.Enabled := True;
  SvrDisconnectBtn.Enabled := False;
end;

procedure TMainForm.CompClick(Sender: TObject);
begin
  if Sender = SvrListBox then
    SendTextToClt(#2 + IntToStr(SvrListBox.Tag) + IntToStr(SvrListBox.ItemIndex) + #3)
  else if Sender = SvrComboBox then
    SendTextToClt(#2 + IntToStr(SvrComboBox.Tag) + IntToStr(SvrComboBox.ItemIndex) + #3)
  else if Sender = SvrScrollBar then
    SendTextToClt(#2 + IntToStr(SvrScrollBar.Tag) + IntToStr(SvrScrollBar.Position) + #3)
  else if Sender = SvrRadioBtn1 then
    SendTextToClt(#2 + IntToStr(SvrRadioBtn1.Tag) + #3)
  else if Sender = SvrRadioBtn2 then
    SendTextToClt(#2 + IntToStr(SvrRadioBtn2.Tag) + #3)
  else if Sender = SvrCheckBox1 then
    SendTextToClt(#2 + IntToStr(SvrCheckBox1.Tag) + BoolToStr(SvrCheckBox1.Checked) + #3)
  else if Sender = SvrCheckBox2 then
    SendTextToClt(#2 + IntToStr(SvrCheckBox2.Tag) + #3)
end;

procedure TMainForm.SvrKeyPress(Sender: TObject; var Key: Char);
begin
  if Sender = SvrEdit then
    SendPressedKey(SvrEdit.tag, SvrEdit.Text, Key)
  else if Sender = SvrMemo then
    SendPressedKey(SvrMemo.tag, SvrMemo.Text, Key);
end;

procedure TMainForm.ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);
var
  aRecv : String;
  i : Integer;
  aStxIndex : Integer;
  aEtxIndex : Integer;
begin
  if Socket <> nil then begin
    aRecv := Socket.ReceiveText;
    while True do begin
      aStxIndex := -1;
      aEtxIndex := -1;
      for i := 1 to Length(aRecv) do begin
        if aRecv[i] = #2 then
          aStxIndex := i;
        if aRecv[i] = #3 then begin
          aEtxIndex := i;
          Break;
        end;
      end;
      if aEtxIndex > 0 then begin
        fRemainText := fRemainText + Copy(aRecv, 1, aEtxIndex);
        if Pos(#2, fRemainText) <> 0 then
          PacketHandle(fRemainText);
        fRemainText := '';
        if aEtxIndex < Length(aRecv) then
          aRecv := Copy(aRecv , aEtxIndex + 1, Length(aRecv) - aEtxIndex)
        else
          Exit;
      end else begin
        fRemainText := fRemainText + aRecv;
        if Pos(#2, fRemainText) = 0 then
          fRemainText := '';
        Exit;
      end;
    end;
  end;
end;

procedure TMainForm.SendPressedKey(aTag : Integer; const aStr : String; aKey : Char);
begin
  if aKey = #8 then
    SendTextToClt(#2 + IntToStr(aTag) + aStr + #3)
  else
    SendTextToClt(#2 + IntToStr(aTag)+ aStr + aKey + #3);
end;

procedure TMainForm.SendTextToClt(const aStr : String);
var
  i : Integer;
begin
  if fServerSocket <> nil then begin
    with fServerSocket.Socket do begin
      for i := 0 to ActiveConnections - 1 do
        Connections[i].SendText(aStr);
    end;
  end;
end;

procedure TMainForm.SvrCheckedUpdate;
begin
  if aTag = RADIOBTN1_TAG  then begin
    SvrRadioBtn2.Checked := False;
    SvrRadioBtn1.Checked := True;
  end else if aTag = RADIOBTN2_TAG  then begin
    SvrRadioBtn1.Checked := False;
    SvrRadioBtn2.Checked := True;
  end else if aTag = CHECKBOX1_TAG then
    SvrCheckBox1.Checked := not(SvrCheckBox1.Checked)
  else if aTag = CHECKBOX2_TAG then
    SvrCheckBox2.Checked := not(SvrCheckBox2.Checked);
end;

procedure TMainForm.PacketHandle(const aPacket : String);
var
  aStrCount : Integer;
  aTag : Integer;
  aRecv : String;
begin
  aTag := StrToInt(aPacket[TAG_POSITION]);
  aStrCount := Length(aPacket) - 3;
  aRecv := Copy(aPacket, STR_FIRST, aStrCount);
  case aTag of
    EDIT_TAG :
      SvrEdit.text := aRecv;
    MEMO_TAG :
      SvrMemo.Lines.Text := aRecv;
    RADIOBTN1_TAG :
      SvrCheckedUpdate(aTag);
    RADIOBTN2_TAG :
      SvrCheckedUpdate(aTag);
    CHECKBOX1_TAG : begin
        SvrCheckBox1.OnClick := nil;
        SvrCheckedUpdate(aTag);
        SvrCheckBox1.OnClick := CompClick;
      end;
    CHECKBOX2_TAG : begin
        SvrCheckBox2.OnClick := nil;
        SvrCheckedUpdate(aTag);
        SvrCheckBox2.OnClick := CompClick;
      end;
    COMBOBOX_TAG : SvrComboBox.ItemIndex := StrToInt(aRecv);
    SCROLLBAR_TAG :
      SvrScrollBar.Position := StrToInt(aRecv);
    LISTBOX_TAG :
      SvrListBox.ItemIndex := StrToInt(aRecv);
  end;
end;

end.
