unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fSize : Integer;
  fCount : Integer;
  fBSize : Integer;

implementation

uses Math;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  fBSize := 20;
  fSize := 20;
  fCount := 0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Canvas.Pen.Color := clRed;
  Canvas.Pen.Mode := pmNotXor;
  Canvas.Brush.Style := bsClear;
  if fCount > 0 then
    Canvas.Ellipse(fBSize - 20 , fBsize - 20, fBSize + 20 ,fBSize + 20);
  Canvas.Ellipse(fSize - 20 , fsize - 20, fSize + 20 ,fSize + 20);
  fBSize := fSize;
  fSize := fSize + 1;
  fCount := fCount + 1;


end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //  Canvas.Pen.Mode := pmNotXOR;
  Canvas.Pen.Color := clRed;
  Canvas.Ellipse(20,20, 40 ,40);
end;

end.

