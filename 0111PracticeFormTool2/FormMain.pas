unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Menus, Buttons, ActnList, CheckLst;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    New1: TMenuItem;
    Exit1: TMenuItem;
    ActionList1: TActionList;
    CheckListBox1: TCheckListBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    CheckListBox2: TCheckListBox;
    CheckListBox3: TCheckListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
{$R *.dfm}
procedure TForm2.BitBtn1Click(Sender: TObject);
var
  aStr : String;
  i : Integer;
begin
  aStr := '';
  for i := 0 to CheckListBox1.Items.Count - 1 do begin
    if CheckListBox1.Checked[i] then
      aStr := aStr + CheckListBox1.Items[i];
  end;
  SpeedButton1.Caption := aStr;
end;


procedure TForm2.Button1Click(Sender: TObject);
begin
  ShowMessage(Edit1.Text);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ShowMessage(Memo1.Lines.Text);
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  aStr : String;
begin
  aStr := Edit1.Text;
  Memo1.Lines.Add(aStr);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Delete(0);//������ ���� ���پ� �����.
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Memo1.Lines.Delete(Memo1.Lines.count - 1);
end;

procedure TForm2.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ShowMessage('���ݺ��� �ǽ� ����!');
   with StringGrid1 do begin
    Cells[1, 0] := '��';
    Cells[2, 0] := 'ȭ';
    Cells[3, 0] := '��';
    Cells[4, 0] := '��';
    Cells[5, 0] := '��';
    Cells[6, 0] := '��';
    Cells[7, 0] := '��';
    Cells[0, 1] := '1����';
    Cells[0, 2] := '2����';
    Cells[0, 3] := '3����';
    Cells[0, 4] := '4����';
    Cells[0, 5] := '5����';

  end;
end;





procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  aMenu : String;
  aWeek, aDay : Integer;
begin
  aMenu := SpeedButton1.Caption;
  StringGrid1.Cells[3,4] := aMenu;
  StringGrid1.Cells[aWeek,aWeek] := aMenu;
end;

end.