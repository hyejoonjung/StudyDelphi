unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TCustomDraw = class
  private
    fCanvas : TCanvas;
    fX : Integer;
    fY : Integer;
    fSize : Integer;
    fTimer : TTimer;

    procedure DrawTimer(Sender : TObject);
  protected
    procedure Draw; virtual;
  public
    constructor Create(aCanvas : TCanvas; aX, aY, aSize : Integer); virtual;
    destructor DesTroy; override;
  end;

  Tcircle = class(TCustomDraw)
  protected
    procedure Draw; override;
  end;

  TRactangle = class(TCircle)
    procedure Draw; override;
  end;

  TTriangle = class(TCustomDraw)
  protected
    procedure Draw; override;
  end;

  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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
    Interval := 500;
    OnTimer := DrawTimer;
  end;

  if fCanvas <> nil then begin
    fCanvas.Pen.Mode := pmNotXor;
    fCanvas.Brush.Style := bsClear;
  end;

  Draw;
end;

destructor TCustomDraw.DesTroy;
begin
  Draw;
  if fTimer <> nil then begin
    fTimer.Free;
    fTimer := nil;
  end;

  inherited;
end;

procedure TCustomDraw.Draw; //�θ� 
begin

end;

{ Tcircle }
procedure TCircle.Draw;


{ TRactangle }
procedure TRactangle.Draw;

{ TTriangle }
procedure TTriangle.Draw;

end.
