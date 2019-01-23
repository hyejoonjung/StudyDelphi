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
    iColor:Integer;
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

    procedure AddCircle(aX, aY : Integer);
    procedure DrawCircle(aIndex : Integer);
    procedure TimeProcess(aIndex : Integer);
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
  fSize := 0;
  fInterval := 0;
  fColor := 0;
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fColor := panel1.Color;
  AddCircle(X, Y);
end;

procedure TMainForm.Panel1DblClick(Sender: TObject);
begin
  ModalForm.Show;
  panel1.Color := ModalForm.colorBox1.Selected;
end;

procedure TMainForm.SizeSpinChange(Sender: TObject);
begin
  fSize := SizeSpin.Value;
end;

procedure TMainForm.IntervalSpinChange(Sender: TObject);
begin
  fInterval := IntervalSpin.Value;
end;

procedure TMainForm.AddCircle(aX, aY : Integer);
var
  i, aNum: Integer;
  aIndex : Integer;
  aRecord : ^CircleData;
begin
  for i := 0 to Length(fCircleArray) - 1 do begin
    if fCircleArray[i] = nil then
      aNum := i;
      Exit;
    aNum := i;
  end;
  if i< Length(fCircleArray) then
    aIndex := i
  else begin
    SetLength(fCircleArray, Length(fCircleArray) + 1);
    aIndex := Length(fCircleArray) - 1;
  end;
  aRecord.iX := aX;
  aRecord.iY := aY;
  aRecord.iSize := fSize;
  aRecord.iColor := fColor;
  fCircleArray[aIndex] := @aRecord;
  DrawCircle(aindex);
  //타이머 생성하기
  //타이머 생성 메모리....
  //Index는 어떻게 처리할것인지.. interval도 만들어줘야해.
end;

procedure TMainForm.DrawCircle(aIndex : Integer);
var
  aX, aY, aSize : Integer;
begin
  aX := fCircleArray[aIndex].iX;
  aY := fCircleArray[aIndex].iY;
  aSize := fCircleArray[aIndex].iSize;
  with Canvas do begin
  Pen.Mode := pmNotXOR;
  pen.Color := fCircleArray[aIndex].iColor;
  Ellipse(aX - aSize, aY - aSize, aX + aSize, aY + aSize);
  end;
end;

procedure TMainForm.TimeProcess(aIndex : Integer);
begin
  RemoveCircle(aIndex);
//  Timer 메모리 해제.
end;

procedure TMainForm.RemoveCircle(aIndex : Integer);
var
i, anum : Integer;
begin
  DrawCircle(aIndex);
  fCircleArray[aIndex] := nil;
  for i := 0 to Length(fCircleArray) - 1 do begin
    if fCircleArray[i] <> nil then begin
      aNum := i;
      Exit;
    end;
    aNum := i;
  end;
  if Length(fCircleArray) = i then
    SetLength(fCircleArray, 0);
end;
end.
