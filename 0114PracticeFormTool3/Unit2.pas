unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ExtCtrls, ToolWin, 
  MPlayer, OleCtrls, SHDocVw, Grids,  DirOutln, Spin, Gauges, Outline, FileCtrl;

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    new1: TMenuItem;
    RichEdit1: TRichEdit;
    TrackBar1: TTrackBar;
    ProgressBar1: TProgressBar;
    UpDown1: TUpDown;
    HotKey1: THotKey;
    Animate1: TAnimate;
    DateTimePicker1: TDateTimePicker;
    TreeView2: TTreeView;
    ListView1: TListView;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    CoolBar1: TCoolBar;
    PageScroller1: TPageScroller;
    Timer1: TTimer;
    Button2: TButton;
    MediaPlayer1: TMediaPlayer;
    Notebook1: TNotebook;
    MainMenu2: TMainMenu;
    Panel1: TPanel;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    Gauge1: TGauge;
    SpinEdit1: TSpinEdit;
    DirectoryOutline1: TDirectoryOutline;
    WebBrowser1: TWebBrowser;
    Button4: TButton;
    TabSheet3: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Button2.Tag := Button2.Tag + 1;
  Button2.Caption := IntToStr (Button2.Tag);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    ShowMessage(OpenDialog1.FileName);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  WebBrowser1.Navigate('www.daum.net');
end;

end.
