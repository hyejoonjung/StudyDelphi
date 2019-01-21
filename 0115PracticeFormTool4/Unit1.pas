unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, StdCtrls, Menus, ExtCtrls, Gauges;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ImageList1: TImageList;
    Button2: TButton;
    MainMenu1: TMainMenu;
    RichEdit1: TRichEdit;
    fdf1: TMenuItem;
    Edit1: TMenuItem;
    Search1: TMenuItem;
    ProgressBar1: TProgressBar;
    UpDown1: TUpDown;
    Timer1: TTimer;
    Button1: TButton;
    Button3: TButton;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Trackbar1: Ttrackbar;
    Edit2: TEdit;
    HotKeys: TTimer;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    HotKey1: THotKey;
    DateTimePicker1: TDateTimePicker;
    HeaderControl1: THeaderControl;
    StatusBar1: TStatusBar;
    Header1: THeader;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ImageList2: TImageList;
    PopupMenu1: TPopupMenu;
    y1: TMenuItem;
    yyyyy1: TMenuItem;
    New1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure HotKeysTimer(Sender: TObject);
    procedure HeaderControl1SectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure HeaderControl1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fButton : TButton;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Smoll;
begin
  ShowMessage('Smoll');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Timer1.Enabled = False then
    Timer1.Enabled := True
  else
    Timer1.Enabled := False;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  Gauge1.Progress := StrToInt(Edit2.Text);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fButton := TButton.Create(Self);
  with fButton do begin
    Parent := Self;
    Left := 500;
    Top := 200;
    Caption := '버튼';

    OnClick := New1Click;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if fButton <> nil then begin
    fButton.Free;
    fButton := nil;
  end;
end;

procedure TForm1.HeaderControl1ContextPopup(Sender: TObject; MousePos: TPoint; var Handled : Boolean);
begin
  Handled := True;
end;

procedure TForm1.HeaderControl1SectionResize(HeaderControl: THeaderControl; Section: THeaderSection);
begin
  if HeaderControl1.Sections.Count > 2 then begin
    ListBox3.Width := HeaderControl1.Sections[0].Width;
    ListBox2.Width := HeaderControl1.Sections[1].Width;
    ListBox1.Width := HeaderControl1.Sections[2].Width;
  end;
end;

procedure TForm1.HotKeysTimer(Sender: TObject);
begin
  if GetAsyncKeyState(VK_F1) < 0 then begin
    if CheckBox1.Checked then
      CheckBox1.Checked := False
    else
      CheckBox1.Checked := True;
  end;
  if GetAsyncKeyState(VK_F2) < 0 then
    Smoll;
  if GetAsyncKeyState(VK_F3) < 0 then
    Label1.Caption := 'F3 이 눌렸네요';
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Position := ProgressBar1.Position+10;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  HeaderControl1SectionResize(nil, nil);
  Gauge2.Progress := TrackBar1.Position;
  Gauge3.Progress := TrackBar1.Position;
end;

end.
