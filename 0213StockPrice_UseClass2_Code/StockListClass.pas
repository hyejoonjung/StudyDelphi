unit StockListClass;

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
    procedure Delete(Index : Integer);
    function IndexOf(const acode : String) : PJmInfo;
    procedure ShowJmGrid;
    procedure SetKind(const aKind : String);

    property Kind : String read fKind write SetKind;
    property CurrSum : Double Read fCurrSum ;
    property CurrCount : Integer Read fCurrCount ;
  end;

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
    procedure Delete(Index : Integer);
    function IndexOf(const aKind : String) :TJmList;
    function KindClick(const aKind : String) : TJmList;
  end;


const
  GC_KIND = 0;
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
  fKind := '';
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

function TjmList.Add(const aCode : String;aPrice1, aPrice2 : Integer) : PJmInfo;
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

procedure TjmList.Clear;
begin
  while Count > 0 do
    Delete(Count - 1);

  inherited;
end;

procedure TjmList.Delete(Index : Integer);
var
  aInfo : PJmInfo;
begin
  if Index < 0 then
    Exit;
  aInfo := Get(Index);
  if aInfo <> nil then begin
    Put(Index, nil);
  end;
  Dispose(aInfo);

  inherited;
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

procedure TjmList.ShowJmGrid;
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

procedure TjmList.SetKind(const aKind : String);
begin
  if fKind = '' then
    fKind := aKind;
end;

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

procedure TStockList.Delete(Index : Integer);
var
  aList : TJmList;
begin
  if Index < 0 then
    Exit;
  aList := Get(Index);
  if aList <> nil then begin
    Put(Index, nil);
  end;
  aList.Free;

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
  Result.ShowJmGrid;
end;

end.