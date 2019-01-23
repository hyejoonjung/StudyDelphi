unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  TGradeData = record
    Name : String;
    Kor : Integer;
    Eng : Integer;
    Math : Integer;
    Aver : double;
  end;
  TMainForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Delbutton: TButton;
    AddButton: TButton;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    procedure AddButtonClick(Sender: TObject);
    procedure DelbuttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fStudentArray : array of TGradeData;
    fAverageArray : array[0..4] of double;

    procedure AddStudent(aName : String; aKor, aEng, aMath : Integer);
    procedure RemoveStudent(aName : String);
    procedure OperateAverage();
    procedure DoOutput();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0, 0] := '이름';
  StringGrid1.Cells[1, 0] := '국어';
  StringGrid1.Cells[2, 0] := '영어';
  StringGrid1.Cells[3, 0] := '수학';
  StringGrid1.Cells[4, 0] := '평균';
end;

procedure TMainForm.AddButtonClick(Sender: TObject);
begin
  AddStudent(Edit1.Text, StrtoInt(Edit2.Text), StrToInt(Edit3.Text) , StrToInt(Edit4.Text));
end;

procedure TMainForm.AddStudent(aName : String; aKor, aEng, aMath : Integer);
var
aRecord : TGradeData;
i, aIdx : Integer;
begin
  aIdx := 0;
  aRecord.Name := aName;
  aRecord.Kor := aKor;
  aRecord.Eng := aEng;
  aRecord.Math := aMath;
  aRecord.Aver := (aKor + aEng + aMath) / 3;
  if fStudentArray = nil then begin
    SetLength(fStudentArray,1);
    fStudentArray[0] := aRecord;
  end else begin
    for i := 0 to Length(fStudentArray) do begin
      if fStudentArray[i].Name = aName then begin
        aIdx := i;
        Break;
      aIdx := i;
      end;
    end;
    if i < Length(fStudentArray) then
      fStudentArray[aIdx] := aRecord
    else begin
      SetLength(fStudentArray,Length(fStudentArray)+1);
      fStudentArray[Length(fStudentArray)-1] := aRecord;
    end;
  end;
  OperateAverage();
end;

procedure TMainForm.RemoveStudent(aName : String);
var
  i , aNum, aArrayEnd : Integer;
begin
  aNum := 0;
  if Length(fStudentArray) < 1 then
    Exit;
  aArrayEnd := Length(fStudentArray)-1;
  for i := 0 to aArrayEnd do begin
    if fStudentArray[i].Name = aName then
      aNum := i;
      break;
    aNum := i;
  end;
  if aNum < aArrayEnd then
    fStudentArray[i] := fStudentArray[aArrayEnd]
  else if fStudentArray[aArrayEnd].Name <> aName then
    exit;
  SetLength(fStudentArray,aArrayEnd);
  OperateAverage();
end;

procedure TMainForm.OperateAverage();
var
aSumKor, aSumEng, aSumMath, i : Integer;
begin
  aSumKor := 0;
  aSumEng := 0;
  aSumMath := 0;
  if fStudentArray = nil then
    Exit
  else begin
    for i := 0 to Length(fStudentArray) do begin
      aSumKor  := aSumKor + fStudentArray[i].Kor;
      aSumEng  := aSumEng + fStudentArray[i].Eng;
      aSumMath := aSumMath + fStudentArray[i].Math;
    end;
    fAverageArray[0] := aSumKor / Length(fStudentArray);
    fAverageArray[1] := aSumEng / Length(fStudentArray);
    fAverageArray[2] := aSumMath / Length(fStudentArray);
    fAverageArray[3] := (fAverageArray[0] + fAverageArray[1] + fAverageArray[2]) / 3;
    DoOutput();
  end;
end;

procedure TMainForm.DelbuttonClick(Sender: TObject);
begin
  RemoveStudent(Edit1.Text);
end;

procedure TMainForm.DoOutput();
var
  i : Integer;
begin
  StringGrid1.RowCount := Length(fStudentArray)+1;
  if fStudentArray <> nil then begin
    for i := 0 to Length(fStudentArray) do begin
      StringGrid1.Cells[0,i + 1] := fStudentArray[i].Name;
      StringGrid1.Cells[1,i + 1] := IntToStr(fStudentArray[i].Kor);
      StringGrid1.Cells[2,i + 1] := IntToStr(fStudentArray[i].Eng);
      StringGrid1.Cells[3,i + 1] := IntToStr(fStudentArray[i].Math);
      StringGrid1.Cells[4,i + 1] := FloatToStr(fStudentArray[i].Aver);
    end;
    Panel1.Caption := FloatToStr(fAverageArray[0]);
    Panel2.Caption := FloatToStr(fAverageArray[1]);
    Panel3.Caption := FloatToStr(fAverageArray[2]);
    Panel4.Caption := FloatToStr(fAverageArray[3]);
  end;
end;


end.
