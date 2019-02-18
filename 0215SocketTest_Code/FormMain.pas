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
    fServerSocket : TServerSocket; // ������Ĺ���� Ŭ���̾�Ʈ�����ؾ��Ѵٿ���.
    fClientSocket : TClientSocket; //������Ĺ�� 1��, Ŭ���̾�Ʈ�� �������� �ɼ� ����..
//�� ������ Ŭ���̾�Ʈ�� N���� �ȴ�. �����ʰ� �߱� ������
//���� ������ 4������ ������Ĺ�� 65365��
//�� ���� ��Ʈ�� 65365��     2Byte, word�϶� �⺻ ������ ��������� �׷��� �⺻�� @Byte.
//������ 4������ 6�� 5õ�� �̻��� ������.
//2byte 65365�⺻���̽� �� word��.. ���� �ϳ��� ��Ʈ 65365��.�Ѽ����� �ƽø� Ŭ���̾�Ʈ ����. �������� ������ ��Ʈ��...4������...���̻��� 6����.
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
  fServerSocket.Active := False; //���� �ݱ�.
  SvrConnectBtn.Enabled := True;
  SvrDisconnectBtn.Enabled := False;
end;

procedure TMainForm.SvrSendEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : Integer;
begin
  if (Key = VK_RETURN) and (fServerSocket <> nil) then begin
    with fServerSocket.Socket do begin     //�����̱� ������ Ŭ���̾�Ʈ�� ������...
      for i := 0 to ActiveConnections - 1 do //����Ǿ��ִ� Ŀ�ؼǵ�,  �� ���ǿ� �����ش�..
        Connections[i].SendText(SvrSendEdit.Text);//������ִ� Ŭ���̾�Ʈ�� i��°. ���� ������. TExt��.
    end;
  end;
end;

procedure TMainForm.ServerSocketClientRead(Sender : TObject; Socket : TCustomWinSocket);// �̺�Ʈ�̸�...ServerSocKet +(On)ClientRead�̸�...
begin //���� ����, Ŭ���̾�Ʈ���� ���� �̺�Ʈ�� �߻�. �����̶�°� Ŭ���̾�Ʈ�� ��Ĺ �����̴�.
  if fServerSocket <> nil then
    SvrRecvMemo.Lines.Add(Socket.ReceiveText);  //��Ĺ�� ���� �������� ���ο� �ִ´�.
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
//Ŀ��Ʈ �ǰ��ȵǰ��� ��Ƽ��� Ȯ���� �Ѵ�.
//false��
//Ŭ���̾�Ʈ��, send����������... ��Ƽ��Ǿ��ִ��� Ȯ���ϰ� �����°� ����.
//���� Ŭ��-���� ���� ���ִ�. 
end.