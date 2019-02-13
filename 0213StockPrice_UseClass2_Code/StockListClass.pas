unit StockListClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  PwrGrid, JmListClass;

type
  TStockList = class(TList)
  private
    fStockGrid : TPowerStrGrid;
    fJmGrid : TPowerStrGrid;
  protected
    function Get(Index : Integer) : TJmList;
  public
    constructor Create(aStockGrid, aJmGrid : TPowerStrGrid); virtual;
    destructor Destroy; override;

    function Add(const aCode : String; aPrice1, aPrice2 : Integer) : TJmList;
    procedure Clear; override;
    function IndexOf(const aKind : String) :TJmList;
    function KindClick(const aKind : String) : TJmList;

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

function TStockList.Get(Index : Integer) : TJmList;//index�� ������ get
begin
  Result := TJmList(inherited Get(Index));
end;

function TStockList.Add(const aCode : String; aPrice1, aPrice2 : Integer) : TJmList;
var
  aRow : Integer;
begin
  Result := IndexOf(aCode[4]);
  if Result = nil then begin
    Result := TJmList.Create(fJmGrid);
    Result.Kind := aCode[4];
    
    inherited Add(Result);
  end;
  Result.Add(aCode, aPrice1, aPrice2);
  if fStockGrid <> nil then begin
    with fStockGrid do begin
      aRow := Cols[GC_KIND].IndexOf(Result.Kind);
      if aRow < 0 then begin
        aRow := RowCount - 1;
        if Cells[GC_KIND, aRow] <> '' then
          Inc(aRow);
        RowCount := aRow + 1;
        Cells[GC_KIND, aRow] := Result.Kind;
      end;
      if Result.CurrCount > 0 then
        Cells[GC_CURR, aRow] := FormatFloat('0.##', (Result.CurrSum / Result.CurrCount / 100));
    end;
  end;
end;
    
procedure TStockList.Clear;
begin
  while Count > 0 do
    Delete(Count - 1);

  inherited;
end;

function TStockList.IndexOf(const aKind : String) : TJmList;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do begin
    Result := Get(i);
    if (Result <> nil) and (Result.Kind = aKind) then
      Exit;
  end;
  Result := nil;
end;

function TStockList.KindClick(const aKind : String) : TJmList;
begin
  Result := IndexOf(aKind);
  Result.StockListClick;

end;

end.
