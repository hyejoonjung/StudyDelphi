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
    
    procedure SendPressedKey(aTag : Integer; const aStr : String; aKey : Char);
    procedure SendTextToClt(const aStr : String);
    procedure SvrListBoxUpDate;
    procedure ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);
        
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
    SendTextToClt(IntToStr(SvrListBox.Tag) + '0' + IntToStr(SvrListBox.ItemIndex))
  else if Sender = SvrComboBox then
    SendTextToClt(IntToStr(SvrComboBox.Tag) + '0' + IntToStr(SvrComboBox.ItemIndex))
  else if Sender = SvrScrollBar then
    SendTextToClt(IntToStr(SvrScrollBar.Tag) + '0' + IntToStr(SvrScrollBar.Position))
  else if Sender = SvrRadioBtn1 then
    SendTextToClt(IntToStr(SvrRadioBtn1.Tag) + '0')
  else if Sender = SvrRadioBtn2 then
    SendTextToClt(IntToStr(SvrRadioBtn2.Tag) + '0')
  else if Sender = SvrCheckBox1 then
    SendTextToClt(IntToStr(SvrCheckBox1.Tag) + '0')
  else if Sender = SvrCheckBox2 then
    SendTextToClt(IntToStr(SvrCheckBox2.Tag) + '0')  
end;

procedure TMainForm.SvrKeyPress(Sender: TObject; var Key: Char);
begin
  if Sender = SvrEdit then
    SendPressedKey(SvrEdit.tag, SvrEdit.Text, Key)
  else if Sender = SvrMemo then
    SendPressedKey(SvrMemo.tag, SvrMemo.Text, Key);
end;

procedure TMainForm.SendPressedKey(aTag : Integer; const aStr : String; aKey : Char);
begin
    if aKey = #8 then
      SendTextToClt(IntToStr(aTag) + '0' + aStr)
    else if (aKey = #13) and (aTag = EDIT_TAG) then begin
      SendTextToClt(IntToStr(aTag) + '1' + aStr + aKey);
      SvrListBoxUpDate;
    end else
      SendTextToClt(IntToStr(aTag) + '0' + aStr + aKey);
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

procedure TMainForm.SvrListBoxUpdate;
var
  aIndex, i : Integer;
begin
  aIndex := -1;
  for i := 0 to SvrListBox.Count - 1 do begin
    if SvrEdit.Text = SvrListBox.items[i] then begin
      aIndex := i;
      Break;
    end;
  end;                
  if aIndex < 0 then begin
    SvrListBox.Items.Add(SvrEdit.Text);
  end else
    SvrlistBox.Items.Delete(aIndex);
  SvrEdit.Text := '';
end;

procedure TMainForm.ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);
begin
  if fServerSocket <> nil then
    SvrMemo.Lines.Add(Socket.ReceiveText);
end;

end.
