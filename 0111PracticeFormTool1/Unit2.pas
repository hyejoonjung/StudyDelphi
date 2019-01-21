unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Mask, Buttons, CheckLst, AppEvnts, Tabs,
  DockTabSet;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel1: TPanel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    ListBox1: TListBox;
    ComboBox1: TComboBox;
    Button3: TButton;
    Edit1: TEdit;
    ScrollBar1: TScrollBar;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    MaskEdit1: TMaskEdit;
    StringGrid1: TStringGrid;
    Image1: TImage;
    Shape1: TShape;
    Bevel1: TBevel;
    ScrollBox2: TScrollBox;
    BitBtn2: TBitBtn;
    SpeedButton2: TSpeedButton;
    CheckListBox1: TCheckListBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter1: TSplitter;
    StaticText1: TStaticText;
    ApplicationEvents1: TApplicationEvents;
    ColorBox1: TColorBox;
    ColorListBox1: TColorListBox;
    DockTabSet1: TDockTabSet;
    TabSet1: TTabSet;
    BitBtn3: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.FormCreate(Sender: TObject);
begin
  with StringGrid1 do begin
    Cells[0, 0] := '1';
    Cells[1, 0] := '2';
    Cells[2, 0] := '3';
    Rows[2] := ComboBox1.Items;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  StringGrid1.Cells[1, 4] := 'fsefadasdf'
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
  aStr : String;
  i : Integer;
begin
  aStr := '';
  for i := 0 to CheckListBox1.Items.Count - 1 do begin
    if CheckListBox1.Checked[i] then
      aStr := aStr + CheckListBox1.Items[i];
  end;
  SpeedButton2.Caption := aStr;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  case Form1.ShowModal of
    mrOk : ShowMessage('Ok');
    mrCancel : ShowMessage('Cancel');
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ComboBox1.Items.Add(Edit1.Text);
end;

procedure TForm2.ScrollBar1Change(Sender: TObject);
begin
  Edit1.Text := IntToStr(ScrollBar1.Position);
end;

end.
