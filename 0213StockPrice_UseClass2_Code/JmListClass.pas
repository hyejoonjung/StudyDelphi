unit JmListClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  PwrGrid;

type
  PJmInfo = ^TJmInfo;
  TJmInfo = record
    iCode : String;
    iCurrSum : Double;
    iCurrCount : Integer;
    iMsSum : Double;
    iMdSum : Double;
    iMmCount : Integer;
  end;
  TjmList = class(TList)
  private
    fJmGrid : TPowerStrGrid;
    fKind : String;
    fCurrSum : Double;
    fCurrCount : Integer;

  protected
    function Get(Index : Integer) : PJmInfo;
  public
    constructor Create(aJmGrid : TPowerStrGrid); virtual;
    destructor Destroy; override;

    function Add(const aCode : String; aPrice1, aPrice2 : Integer) : PJmInfo;
    procedure Clear; override;
    function IndexOf(const acode : String) : PJmInfo;
    procedure StockListClick;

    property Kind : String read fKind write fKind;
    property CurrSum : Double Read fCurrSum write fCurrSum;
    property CurrCount : Integer Read fCurrCount write fCurrCount;
  end;

const
  GC___JM = 0;
  GC_CURR = 1;
  GC___MS = 2;
  GC___MD = 3;

implementation

{ TjmList }

constructor TjmList.Create(aJmGrid : TPowerStrGrid);
begin
  inherited Create;

  fJmGrid := aJmGrid;
  fCurrsum := 0;
  fCurrCount := 0;
end;

destructor TjmList.Destroy;
begin
  Clear;

  inherited;
end;

function TjmList.Get(Index : Integer) : PJmInfo;
begin
  Result := PJmInfo(inherited Get(Index));
end;

function TjmList.Add(const aCode : String; aPrice1, aPrice2 : Integer) : PJmInfo;
begin
  Result := IndexOf(aCode);
  if Result = nil then begin
    New(Result);
    ZeroMemory(Result, SizeOf(PJmInfo));
    Result.iCode := aCode;

    inherited Add(Result);
  end;
  if aPrice2 < 0 then begin
    fCurrSum := fCurrSum + aPrice1;
    fCurrCount := fCurrCount + 1;
    Result.iCurrSum := aPrice1;
    Result.iCurrCount := Result.iCurrCount + 1;
  end else
    Result.iMsSum := Result.iMsSum + aPrice1;
    Result.iMdSum := Result.iMdSum + aPrice2;
    Result.iMmCount := Result.iMmCount + 1;
end;

function TjmList.IndexOf(const acode : String) : PJmInfo;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do begin
    Result := Get(i);
    if (Result <> nil) and (Result.iCode = aCode) then
      Exit;
  end;
  Result := nil;
end;

procedure TjmList.Clear;
begin
  while Count > 0 do
    Delete(Count - 1);

  inherited;
end;

procedure TjmList.StockListClick;
var
  i, aRow : Integer;
  aJmInfo : PJmInfo;
begin
  if fJmGrid <> nil then begin
    with fJmGrid do begin
      RowCount := 2;
      Rows[1].Clear;
      for i := 0 to Count - 1 do begin
        aJmInfo := Self[i];
        aRow := Rowcount - 1;
        if Cells[GC___JM, aRow] <> '' then
          Inc(aRow);
        RowCount := aRow + 1;
        Cells[GC___JM, aRow] := aJmInfo.iCode;
        if aJmInfo.iCurrcount <> 0 then
          Cells[GC_CURR, aRow] := FormatFloat('0.##', (aJminfo.iCurrSum / aJmInfo.iCurrCount / 100));
        if aJmInfo.iMmCount <> 0 then begin
          Cells[GC___MS, aRow] := FormatFloat('0.##', (aJminfo.iMsSum / aJmInfo.iMmCount / 100));
          Cells[GC___MD, aRow] := FormatFloat('0.##', (aJminfo.iMDSum / aJmInfo.iMmCount / 100));
        end;
      end;
    end;
  end;
end;

end.
