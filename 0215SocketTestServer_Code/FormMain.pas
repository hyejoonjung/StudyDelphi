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
    procedure SvrEditKeyPress(Sender: TObject; var Key: Char);
    procedure SvrMemoKeyPress(Sender: TObject; var Key: Char);
    procedure SvrRadioBtn1Click(Sender: TObject);

  private
    { Private declarations }
    fFlag : Boolean;

    fServerSocket : TServerSocket; // ������Ĺ���� Ŭ���̾�Ʈ�����ؾ��Ѵٿ���.

    procedure ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);
    procedure SendTextToClt(const aStr : String);
    procedure SvrListBoxUpDate;
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
  fFlag := True;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if fServerSocket <> nil then begin
    fServerSocket.Free;
    fServerSocket := nil;
  end;
end;
                                      //
procedure TMainForm.SvrConnectBtnClick(Sender: TObject);
begin
  if fServerSocket = nil then begin
    fServerSocket := TServerSocket.Create(Self);
    with fServerSocket do
      OnClientRead := ServerSocketClientRead; // Ŭ���̾�Ʈ���� �����Ͱ� �ö� �߻� Ŭ���̾�Ʈ connect,disconnect�� �־�.
  end;
  fserverSocket.port := StrToInt(SvrPortEdit.Text);       //��Ʈ ����.
  fServerSocket.Active := True; //������ ���½�Ű�°�. (�����̶��)�������̸� ����
  SvrConnectBtn.Enabled := False;     //���� Ŀ��Ʈ�� �ٽ� Create���� �ʱ� ����
  SvrDisConnectBtn.Enabled := True;  //Ŀ��Ʈ �������´ϱ�...
end;

procedure TMainForm.SvrDisConnectBtnClick(Sender: TObject);
begin
  if fServerSocket = nil then
    Exit;
  fServerSocket.Active := False;
  SvrConnectBtn.Enabled := True;
  SvrDisconnectBtn.Enabled := False;
end;

procedure TMainForm.SvrEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    SendTextToClt(IntToStr(SvrEdit.Tag) + '00' + Copy(SvrEdit.Text, 0, Length(SvrEdit.Text) - 1))
  else if Key = #13 then begin
    SendTextToClt(IntToStr(SvrEdit.Tag) + '10' + SvrEdit.Text + Key);
    SvrListBoxUpDate;
  end else
    SendTextToClt(IntToStr(SvrEdit.Tag) + '00' + SvrEdit.Text + Key);
end;

procedure TMainForm.SvrMemoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    SendTextToClt(IntToStr(SvrMemo.Tag) + '00' + Copy(SvrMemo.Text, 0, Length(SvrMemo.Text) - 1))
  else
    SendTextToClt(IntToStr(SvrMemo.Tag) + '00' + SvrMemo.Text + Key);
    //Ŭ�󿡼� �׳�add�ϴ°ɷ� �غ��� �ɵ�.
end;

procedure TMainForm.SvrRadioBtn1Click(Sender: TObject);
begin
  SendTextToClt(IntToStr(SvrRadioBtn1.Tag) + '00' + BoolToStr(SvrRadioBtn1.Checked));
end;

procedure TMainForm.ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);// �̺�Ʈ�̸�...ServerSocKet +(On)ClientRead�̸�...
begin //���� ����, Ŭ���̾�Ʈ���� ���� �̺�Ʈ�� �߻�. �����̶�°� Ŭ���̾�Ʈ�� ��Ĺ �����̴�.
  if fServerSocket <> nil then
    SvrMemo.Lines.Add(Socket.ReceiveText);  //��Ĺ�� ���� �������� ���ο� �ִ´�.
end;

procedure TMainForm.SendTextToClt(const aStr : String);
var
  i : Integer;
begin
  if fServerSocket <> nil then begin
    with fServerSocket.Socket do begin     //�����̱� ������ Ŭ���̾�Ʈ�� ������...
      for i := 0 to ActiveConnections - 1 do //����Ǿ��ִ� Ŀ�ؼǵ�,  �� ���ǿ� �����ش�..
        Connections[i].SendText(aStr);//������ִ� Ŭ���̾�Ʈ�� i��°. ���� ������. TExt��.
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

end.