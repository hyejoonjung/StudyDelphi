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
    fReceiveBuf : String;

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
  HEADER_SIZE   = 3;
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
  fReceiveBuf := '';
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
    SendTextToClt(IntToStr(SvrListBox.Tag) + IntToStr(SvrListBox.ItemIndex))
  else if Sender = SvrComboBox then
    SendTextToClt(IntToStr(SvrComboBox.Tag) + IntToStr(SvrComboBox.ItemIndex))
  else if Sender = SvrScrollBar then
    SendTextToClt(IntToStr(SvrScrollBar.Tag) + IntToStr(SvrScrollBar.Position))
  else if Sender = SvrRadioBtn1 then
    SendTextToClt(IntToStr(SvrRadioBtn1.Tag))
  else if Sender = SvrRadioBtn2 then
    SendTextToClt(IntToStr(SvrRadioBtn2.Tag))
  else if Sender = SvrCheckBox1 then
    SendTextToClt(IntToStr(SvrCheckBox1.Tag) + BoolToStr(SvrCheckBox1.Checked))
  else if Sender = SvrCheckBox2 then
    SendTextToClt(IntToStr(SvrCheckBox2.Tag))
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
  aEtxIndex : Integer;
begin
  if Socket <> nil then begin
    fReceiveBuf := fReceiveBuf + Socket.ReceiveText;
    while True do begin
      aEtxIndex := Pos(#3, fReceiveBuf);
      if aEtxIndex > 0 then begin
        aRecv := Copy(fReceiveBuf, 1, aEtxIndex);
        if Pos(#2, aRecv) <> 0 then
          PacketHandle(aRecv);
        Delete(fReceiveBuf, 1,  aEtxIndex);
      end else
        Exit;
    end;
  end;
end;

procedure TMainForm.SendPressedKey(aTag : Integer; const aStr : String; aKey : Char);
begin
  if aKey = #8 then
    SendTextToClt(IntToStr(aTag) + aStr)
  else
    SendTextToClt(IntToStr(aTag)+ aStr + aKey);
end;

procedure TMainForm.SendTextToClt(const aStr : String);
var
  i : Integer;
//  aPacketSize : Integer;
begin
//  aPacketSize := Length(aStr) + 4;
//  aPacketSize := IntToHex(aPacketSize div 255)
  if fServerSocket <> nil then begin
    with fServerSocket.Socket do begin
      for i := 0 to ActiveConnections - 1 do
//        Connections[i].SendText(#2 + IntToStr(aPacketSize) +  aStr + #3);
        Connections[i].SendText(#2 + aStr + #3);
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
  aStrCount := Length(aPacket) - HEADER_SIZE;
  aRecv := Copy(aPacket, STR_FIRST, aStrCount);
  case aTag of
    EDIT_TAG :
      SvrEdit.Text := aRecv;
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
