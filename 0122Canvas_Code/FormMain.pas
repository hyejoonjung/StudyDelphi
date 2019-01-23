unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  CircleData = record
    iX : Integer;
    iY : Integer;
    iSize : Integer;
    iColor : Integer;
    iTimer : TTimer;
  end;

  TMainForm = class(TForm)
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText1: TStaticText;
    Panel1: TPanel;
    SizeSpin: TSpinEdit;
    IntervalSpin: TSpinEdit;
    procedure Panel1DblClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SizeSpinChange(Sender: TObject);
    procedure IntervalSpinChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fSize : Integer;
    fInterval : Integer;
    fColor : Integer;
    fCircleArray : array of ^CircleData;

    procedure TimerEvent(Sender : TObject);
    procedure AddCircle(aX, aY : Integer);
    procedure DrawCircle(aIndex : Integer);
    procedure RemoveCircle(aIndex : Integer);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses FormModal;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fSize := SizeSpin.Value;
  fInterval := IntervalSpin.Value;
  fColor := panel1.Color;
  SetLength(fCircleArray, 0);  
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  AddCircle(X, Y);
end;

procedure TMainForm.Panel1DblClick(Sender: TObject);
begin
  ModalForm.Show;
  panel1.Color := ModalForm.colorBox1.Selected;
  fColor := panel1.Color;
end;

procedure TMainForm.SizeSpinChange(Sender: TObject);
begin
  fSize := SizeSpin.Value;
end;

procedure TMainForm.IntervalSpinChange(Sender: TObject);
begin
  fInterval := IntervalSpin.Value;
end;

procedure TMainForm.TimerEvent(Sender : TObject);
begin
  if Sender is TTimer then
    RemoveCircle(TTimer(Sender).Tag);
end;

procedure TMainForm.AddCircle(aX, aY : Integer);
var
  i : Integer;
  aIndex : Integer;
begin
  aIndex := -1;
  for i := 0 to Length(fCircleArray) - 1 do begin
    if fCircleArray[i] = nil then begin
      aIndex := i;
      Break;
    end;
  end;
  if aIndex < 0 then begin
    aIndex := Length(fCircleArray);
    SetLength(fCircleArray, aIndex + 1);
  end;
  New(fCircleArray[aIndex]);
  with fCircleArray[aIndex]^ do begin
    iX := aX;
    iY := aY;
    iSize := fSize;
    iColor := fColor;
    iTimer := TTimer.Create(Self);
    with iTimer do begin
      Interval := fInterval * 1000;
      Tag := aIndex;
      OnTimer := TimerEvent;
      Enabled := True;
    end;
  end;
  DrawCircle(aIndex);
end;

procedure TMainForm.DrawCircle(aIndex : Integer);
//var
//  aX, aY, aSize : Integer;
begin
  if fCircleArray[aIndex] = nil then
    Exit;
  with fCircleArray[aIndex]^ do begin
    Canvas.Pen.Mode := pmNotXOR;
    Canvas.Pen.Color := iColor;
    Canvas.Ellipse(iX - iSize, iY - iSize, iX + iSize, iY + iSize);
  end;
//  aX := fCircleArray[aIndex].iX;
//  aY := fCircleArray[aIndex].iY;
//  aSize := fCircleArray[aIndex].iSize;
//  with Canvas do begin
//    Pen.Mode := pmNotXOR;
//    pen.Color := fCircleArray[aIndex].iColor;
//    Ellipse(aX - aSize, aY - aSize, aX + aSize, aY + aSize);
//  end;
end;

procedure TMainForm.RemoveCircle(aIndex : Integer);
var
  i : Integer;
begin
  DrawCircle(aIndex);
  if fCircleArray[aIndex] <> nil then begin
    if fCircleArray[aIndex].iTimer <> nil then
      fCircleArray[aIndex].iTimer.Free;
    Dispose(fCircleArray[aIndex]);
    fCircleArray[aIndex] := nil;
  end;
  for i := 0 to Length(fCircleArray) - 1 do begin
    if fCircleArray[i] <> nil then
      Exit;
  end;
  SetLength(fCircleArray, 0);
end;

end.
