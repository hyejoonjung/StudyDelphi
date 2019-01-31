unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type  
  PMainRecord = ^TMainRecord;
  TMainRecord = Record
    iKind : String;
    iCurrSum : Double;
    iCurrCount : Integer;
    iSubList : TList;
  end;

  PSubRecord = ^TSubrecord;
  TSubRecord = Record
    iCode : String;
    iCurrSum : Double;
    iCurrCount : Integer;
    iMsSum : Double;
    iMdSum : Double;
    iMmCount : Integer;
  end;
  
  TMainForm = class(TForm)
    LoadButton: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
  private
    { Private declarations }
    fMainList : TList;

    procedure ReadFile();
    procedure DataParshing(const aLine : String);
    procedure MakeCurr(const aCode , aCurr : String);
    procedure MakeMm(const aCode , aMs, aMd : String);
    procedure Output();
    procedure ClickEvent(const aKind : String);

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fMainList := TList.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if fMainList <> nil then begin
    fMainList.Free;
    fMainList := nil;
  end;
end;

procedure TMainForm.LoadButtonClick(Sender: TObject);
begin
  ReadFile();
end;

procedure TMainForm.ReadFile();
var
  aLine : String;
  aF : TextFile;
begin
  try
    AssignFile(aF, '20120731.FO.log');
    Reset(aF);
    while not EOF(aF) do begin
      Readln(aF, aLine);
      DataParshing(aLine);
    end;
    Output();
  finally
    CloseFile(aF);
  end;
end;

procedure TMainForm.DataParshing(const aLine : String);
var
  aType : String;
begin
  aType := Copy(aLine, 18, 5);
  if aType = 'B6034' then
    MakeMm(Copy(aLine, 23, 12), Copy(aLine, 47, 5), Copy(aLine, 114, 5));
  if aType = 'B6014' then
    MakeMm(Copy(aLine, 23, 12), Copy(aLine, 46, 5), Copy(aLine, 112, 5));
  if aType = 'A3034' then
    MakeCurr(Copy(aLine, 23, 12), Copy(aLine, 38, 5));
  if aType = 'A3014' then
    MakeCurr(Copy(aLine, 23, 12), Copy(aLine, 38, 6));
  if aType = 'G7034' then begin
    MakeCurr(Copy(aLine, 23, 12), Copy(aLine, 38, 5));
    MakeMm(Copy(aLine, 23, 12), Copy(aLine, 108, 5), Copy(aLine, 175, 5));
  end;
  if aType = 'G7014' then begin
    MakeCurr(Copy(aLine, 23, 12), Copy(aLine, 38, 6));
    MakeMm(Copy(aLine, 23, 12), Copy(aLine, 120, 6), Copy(aLine, 156, 6));
  end;
end;

procedure TMainForm.MakeCurr(const aCode , aCurr : String);
var
  aMainRecord : PMainRecord;
  aSubRecord : PSubRecord;
  aRIndex, aSubRIndex, i : Integer;
  aMRecord : PMainRecord;
  aSRecord : PSubRecord;
begin
  aRIndex := -1;
  aSubRIndex := -1;
  for i := 0 to fMainList.Count do begin
//    aRecord := fMainList[i];
    aMRecord := fMainList[i];
    if aMRecord.iKind = aCode[4] then begin
//    if aRecord.iKind = aCode[4] then begin
//    if TMainRecord(fMainList[i]^).iKind = aCode[4] then begin
      aRIndex := i;
      Break;
    end;
  end;
  if aRIndex < 0 then begin
    New(aMainRecord);
    aRIndex := fMainList.Add(aMainRecord);
//    aMainRecord := fMainList[aRIndex];
    aMainRecord.iKind := aCode[4];
    aMainRecord.iSubList := TList.Create;
  end;
  aMainRecord := fMainList[aRIndex];
  aMainRecord.iCurrSum := aMainRecord.iCurrSum + StrToFloat(aCurr);
  aMainRecord.iCurrCount := aMainRecord.iCurrCount + 1;
//  TMainRecord(fMainList[aRIndex]^).iCurrSum := TMainRecord(fMainList[aRIndex]^).iCurrSum + aCurr;
//  TMainRecord(fMainList[aRIndex]^).iCurrCount := TMainRecord(fMainList[aRIndex]^).iCurrCount + 1;
  for i := 0 to aMainRecord.iSubList.Count - 1 do begin
    aSRecord := aMainRecord.iSubList[i];
    if aSRecord.iCode = acode then begin
      aSubRIndex := i;
      Break;
    end;
  end;
  if aSubRIndex < 0 then begin
    New(aSubRecord);
    aSubRIndex := aMainRecord.iSubList.Add(aSubRecord);
    aSubRecord.iCode := aCode;
  end;
  aSubRecord := aMainRecord.iSubList[aSubRindex];
  aSubRecord.iCurrSum := aSubRecord.iCurrSum + StrToFloat(aCurr);
  aSubRecord.iCurrCount := aSubRecord.iCurrCount + 1;
end;

procedure TMainForm.MakeMm(const aCode , aMs, aMd : String);
var
  aMainRecord : PMainRecord;
  aSubRecord : PSubRecord;
  aRIndex, aSubRIndex, i : Integer;
//  aSubPointer : Pointer;
  aMRecord : PMainRecord;
  aSRecord : PSubRecord;
begin
  aRIndex := -1;
  aSubRIndex := -1;
  for i := 0 to fMainList.Count - 1 do begin
//    aRecord := fMainList[i];
    aMRecord := fMainList[i];
    if aMRecord.iKind = aCode[4] then begin
//    if aRecord.iKind = aCode[4] then begin
//    if TMainRecord(fMainList[i]^).iKind = aCode[4] then begin
      aRIndex := i;
      Break;
    end;
  end;
  if aRIndex < 0 then begin
    New(aMainRecord);
    aRIndex := fMainList.Add(aMainRecord);
//    aMainRecord := fMainList[aRIndex];
    aMainRecord.iKind := aCode[4];
    aMainRecord.iSubList := TList.Create;
  end;
  aMainRecord := fMainList[aRIndex];
//  TMainRecord(fMainList[aRIndex]^).iCurrSum := TMainRecord(fMainList[aRIndex]^).iCurrSum + aCurr;
//  TMainRecord(fMainList[aRIndex]^).iCurrCount := TMainRecord(fMainList[aRIndex]^).iCurrCount + 1;
  for i := 0 to aMainRecord.iSubList.Count - 1 do begin
    aSRecord := aMainRecord.iSubList[i];
    if aSRecord.iCode = aCode then begin
      aSubRIndex := i;
      Break;
    end;
  end;
  if aSubRIndex < 0 then begin
    New(aSubRecord);
    aSubRIndex := aMainRecord.iSubList.Add(aSubRecord);
    aSubRecord.iCode := aCode;
  end;
  aSubRecord := aMainRecord.iSubList[aSubRindex];
  aSubRecord.iMsSum := aSubRecord.iMsSum + StrTofloat(aMs);
  aSubRecord.iMdSum := aSubRecord.iMdSum + StrTofloat(aMd);
  aSubRecord.iMmCount := aSubRecord.iMmCount + 1;
end;
  
procedure TMainForm.Output();
var
  i: Integer;
begin
  StringGrid1.Cells[0, 1] := TMainRecord(fMainList[0]^).iKind;
  StringGrid1.Cells[1, 1] := floatToStr(TMainRecord(fMainList[0]^).iCurrSum / TMainRecord(fMainList[0]^).iCurrCount);
  for i := 1 to fMainList.Count - 1 do begin
    StringGrid1.Cells[0, i + 1] := TMainRecord(fMainList[i]^).iKind;
    if TMainRecord(fMainList[i]^).iCurrCount > 0 then
      StringGrid1.Cells[1, i + 1] := floatToStr(TMainRecord(fMainList[i]^).iCurrSum / TMainRecord(fMainList[i]^).iCurrCount);
  end;
end;

procedure TMainForm.ClickEvent(const aKind : String);
var
  aIndex, i : Integer;
  aMainRecord : PMainRecord;
  aSubRecord : PSubRecord;
begin
  aIndex := 0;
  for i := 0 to fMainList.Count - 1 do begin
    if TMainRecord(fMainList[i]^).iKind = aKind then begin
      aIndex := i;
      Break;
    end;
  end;
  aMainRecord := fMainList[aIndex];
  aSubRecord := aMainRecord.iSubList[0];
  StringGrid2.Cells[0, 1] := aSubRecord.iCode;
  if aSubRecord.iCurrCount > 0 then
    Stringgrid2.Cells[1, 1] := floatToStr(aSubRecord.iCurrSum / aSubRecord.iCurrCount);
  if aSubRecord.iMmCount > 0 then begin
    Stringgrid2.Cells[2, 1] := floatToStr(aSubRecord.iMsSum / aSubRecord.iMmCount);
    Stringgrid2.Cells[3, 1] := floatToStr(aSubRecord.iMdSum / aSubRecord.iMmCount);
  end;
  for i := 1 to aMainRecord.iSubList.Count - 1 do begin
    aSubRecord := aMainRecord.iSubList[i];
    StringGrid2.Cells[0, i + 1] := aSubRecord.iCode;
    if aSubRecord.iCurrCount > 0 then
      StringGrid2.Cells[1, i + 1] := floatToStr(aSubRecord.iCurrSum / aSubRecord.iCurrCount);
    if aSubRecord.iMmCount > 0 then begin
      StringGrid2.Cells[2, i + 1] := floatToStr(aSubRecord.iMsSum / aSubRecord.iMmCount);
      StringGrid2.Cells[3, i + 1] := floatToStr(aSubRecord.iMdSum / aSubRecord.iMmCount);
    end;
  end;
end;

end.
