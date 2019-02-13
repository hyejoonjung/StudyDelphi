unit StockListClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  PwrGrid, JmListClass;

type
  PStockInfo = ^ TStockInfo;
//  TStockInfo = record
//    iKind : String;
//    iCurrSum : Double;
//    iCurrCount : Integer;
//    iJmList : TjmList;
//  end;

  TStockList = class(TList)
  private
    fStockGrid : TPowerStrGrid;
    fJmGrid : TPowerStrGrid;

  protected
    function Get(Index : Integer) : PStockInfo;
  public
    constructor Create(aStockGrid, aJmGrid : TPowerStrGrid); virtual;
    destructor Destroy; override;

    function Add(const aCode : String; aPrice1, aPrice2 : Integer) : PStockInfo;
    procedure Clear; override;
    function IndexOf(const aKind : String) : PStockInfo;
    procedure KindClick(const aKind : String);
  end;

const
  GC_KIND = 0;
  GC_CURR  = 1;

implementation

{ TStockList }

constructor TStockList.Create(aStockGrid, aJmGrid : TPowerStrGrid);
begin
  inherited Create;

  fStockGrid := astockGrid;
  fJmGrid := aJmGrid;
end;

destructor TStockList.Destroy;
begin
  Clear;

  inherited;
end;

function TStockList.Get(Index : Integer) : PStockInfo;//index로 포인터 get
begin
  Result := PStockInfo(inherited Get(Index));
end;

function TStockList.Add(const aCode : String; aPrice1, aPrice2 : Integer) : PStockInfo;
var
  aRow : Integer;
begin
  Result := IndexOf(aCode[4]);
  if Result = nil then begin
    New(Result);
    ZeroMemory(Result, SizeOf(TStockInfo));
    Result.iKind := aCode[4];
    Result.iJmList := TJmList.Create;

    inherited Add(Result);
  end;
  if aPrice2 < 0 then begin
    Result.iCurrSum := Result.iCurrSum + aPrice1;
    Result.iCurrCount := Result.iCurrCount + 1;  //여기 with로 묶을 수 있나?
    Result.iJmList.Add(aCode, aPrice1, -1);
  end else
    Result.iJmList.Add(aCode, aPrice1, aPrice2);
  if fStockGrid <> nil then begin
    with fStockGrid do begin
      aRow := Cols[GC_KIND].IndexOf(Result.iKind);
      if aRow < 0 then begin
        aRow := RowCount - 1;
        if Cells[GC_KIND, aRow] <> '' then
          Inc(aRow);
        RowCount := aRow + 1;
        Cells[GC_KIND, aRow] := Result.iKind;
      end;
      if Result.iCurrCount > 0 then
        Cells[GC_CURR, aRow] := FormatFloat('0.##', (Result.iCurrSum / Result.iCurrCount / 100));
    end;
  end;
end;
    
procedure TStockList.Clear;
begin
  while Count > 0 do
    Delete(Count - 1);

  inherited;
end;

function TStockList.IndexOf(const aKind : String) : PStockInfo;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do begin
    Result := Get(i);
    if (Result <> nil) and (Result.iKind = aKind) then
      Exit;
  end;
  Result := nil;
end;

procedure TStockList.KindClick(const aKind : String; aJmGrid : TPowerStrGrid);
var
  i : Integer;
begin
//  Result := indexOf(aKind);
//  Result.iJmList.WriteGrid(Result.iJmList, aJmGrid);
end;

end.
