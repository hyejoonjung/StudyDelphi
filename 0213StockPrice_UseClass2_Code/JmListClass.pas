unit JmListClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  PwrGrid;

type
  PJmList = ^TJmList;
  TjmList = class(TList)
  private
    fJmGrid : TPowerStrGrid;
  protected
    function Get(Index : Integer) : PJmList;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function Add(const aCode : String; aPrice1, aPrice2 : Integer) : PJmList;
    procedure Clear; override;
    function IndexOf(const acode : String) : PJmList;
    procedure WriteGrid(const aCode : String; aJmGrid : TPowerStrGrid);
  end;

const
  GC_JM    = 0;
  GC_MS    = 2;
  GC_MD    = 3;

implementation

{ TjmList }

constructor TjmList.Create;
begin
  inherited Create;

end;

destructor TjmList.Destroy;
begin
  Clear;

  inherited;
end;

function TjmList.Get(Index : Integer) : PJmList;
begin
  Result := PJmList(inherited Get(Index));
end;

function TjmList.Add(const aCode : String; aPrice1, aPrice2 : Integer) : PJmInfo;
begin
  Result := IndexOf(aCode);
  if Result = nil then begin
    New(Result);
    ZeroMemory(Result, SizeOf(TJmList));
    Result.iCode := aCode;

    inherited Add(Result);
  end;
  if aPrice2 < 0 then begin
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

procedure TjmList.WriteGrid(aList : TjmList; aJmGrid : TPowerStrGrid);
var
  i : Integer;
begin

end;

end.
