unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  PCustomDraw = ^TCustomDraw;
  TCustomDraw = class
  private
    fCanvas : TCanvas;
    fX : Integer;
    fY : Integer;
    fSize : Integer;
    fTimer : TTimer;
    fUp : Boolean;
    fRight : Boolean;

    procedure DrawTimer(Sender : TObject);
  protected
    procedure Draw; virtual;
  public
    constructor Create(aCanvas : TCanvas; aX, aY, aSize : Integer); virtual;
    destructor Destroy; override;
  end;

  TCircle = class(TCustomDraw)
  protected
    procedure Draw; override;
  end;

  TRactangle = class(TCircle)
  protected
    procedure Draw; override;
  end;

  TTriangle = class(TCustomDraw)
  protected
    procedure Draw; override;
  end;

  TForm2 = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TCustomDraw }

constructor TCustomDraw.Create(aCanvas : TCanvas; aX, aY, aSize : Integer);
begin
  inherited Create;

  fCanvas := aCanvas;
  fX := aX;
  fY := aY;
  fSize := aSize;
  fTimer := TTimer.Create(nil);
  with fTimer do begin
    Interval := 5000;
    OnTimer := DrawTimer;
  end;

  if fCanvas <> nil then begin
    fCanvas.Pen.Mode := pmNotXor;
    fCanvas.Brush.Style := bsClear;
  end;

  Draw;
end;

destructor TCustomDraw.Destroy;
begin
  Draw;
  if fTimer <> nil then begin
    fTimer.Free;
    fTimer := nil;
  end;

  inherited;
end;

procedure TCustomDraw.DrawTimer(Sender : TObject);
begin
  Self.Free;
end;

procedure TCustomDraw.Draw; //�θ�
begin

end;

{ TCircle }

procedure TCircle.Draw;
begin
  if fCanvas <> nil then
    fCanvas.Ellipse(fX - fSize, fY - fSize, fX + fSize, fY + fSize);
end;

{ TRactangle }

procedure TRactangle.Draw;
begin
  if fCanvas <> nil then
    fCanvas.Rectangle(fX - fSize, fY - fSize, fX + fSize, fY + fSize);
  inherited;
end;

{ TTriangle }

procedure TTriangle.Draw;
begin
  if fCanvas <> nil then begin
    fCanvas.MoveTo(fX + fSize, fY + fSize);
    fCanvas.LineTo(fX, fY - fSize);
    fCanvas.LineTo(fX - fSize, fY + fSize);
    fCanvas.LineTo(fX + fSize, fY + fSize);
//    fCanvas.MoveTo(fX - fSize, fY - fSize);
//    fCanvas.LineTo(fX + fSize, fY + fSize);
//    fCanvas.LineTo(fX + fSize, fY - fSize);
//    fCanvas.LineTo(fX - fSize, fY - fSize);
  end;
end;

procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.Canvas.Pen.Color := clRed;
  TCircle.Create(Self.Canvas, X, Y, 50);
end;

end.
