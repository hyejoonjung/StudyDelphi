unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TCirCleData = record
      iXBegin : Integer;
      iYBegin : Integer;
      iXEnd : Integer;
      iYEnd : Integer;
      iCreateTime : TDateTime;
  end;
  TMainForm = class(TForm)
    ColorPan: TPanel;
    SizeEdit: TSpinEdit;
    IntervalEdit: TSpinEdit;
    SizeText: TStaticText;
    IntervalText: TStaticText;
    ColorText: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure SizeEditChange(Sender: TObject);
    procedure IntervalEditChange(Sender: TObject);
    procedure ColorPanDblClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    fSize, fInterval : Integer;
    CircleArray : array of TCirCleData;

    procedure StoreCirclePosition(aRecord : TCirCleData; aCreateTime : TDateTime);
    procedure RemoveCircleObject(aRecord : TCirCleData);
    procedure TimeProcess(aObject : String; aTime : TDateTime; aInterval : Integer);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;



implementation

uses FormModal;

{$R *.dfm}

procedure TMainForm.ColorPanDblClick(Sender: TObject);
begin
  ModalForm.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fSize:= 10;
  fInterval := 1;
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with Canvas Do begin
    pen.Color := ColorPan.Color;
    Ellipse(X - fSize, Y - fSize, X + fSize, Y + fSize);
  end;
end;

procedure TMainForm.IntervalEditChange(Sender: TObject);
begin
  fInterval := IntervalEdit.Value;
end;

procedure TMainForm.SizeEditChange(Sender: TObject);
begin
  fSize := SizeEdit.Value;
end;

procedure TMainForm.StoreCirclePosition(aRecord : TCirCleData; aCreateTime : TDateTime);
begin

end;

procedure TMainForm.RemoveCircleObject(aRecord : TCirCleData);
var
i : Integer;
aColorTemp : String;
begin
aColorTemp := Canvas.Pen.Color;
Canvas.Pen.Color := clWhite;
i = 0;
if i < Length(CircleArray) then begin
  Ellipse(aRecord.iXBegin, aRecord.iYBegin, aRecord.iXEnd, aRecord.iYEnd);
  SetLength(CircleArray, Length(CircleArray) + 1);
  i = i + 1;
end;
Canvas.Pen.Color := aColor

end;
end;

procedure TMainForm.TimeProcess(aObject : String; aTime : TDateTime; aInterval : Integer);
begin

end;





end.
