unit Stack;

interface

type

  TCustomStack = class
  private
    fInData : array of String;
  protected
    Constructor Create;
    Destructor Destroy; override;
  public
    procedure Push(const aVal : String);
    function Pop : String;
    function GetLength : Integer;
  end;
implementation

{ TStack }
constructor TCustomStack.Create;
begin
  SetLength(fInData, 0);
end;

destructor TCustomStack.Destroy;
var
  i: Integer;
begin
  for i := 0 to high(fInData) - 1 do begin
    Setlength(fIndata[i], 0);
  end;
  Setlength(fInData, 0);
end;

procedure TCustomStack.Push(const aVal : String);
begin
  SetLength(fInData, Length(fInData) + 1);
  fInData[Length(fInData) - 1] := aVal;
end;

function TCustomStack.Pop : String;
begin
  if Length(fInData) > 0 then begin
    Result := fInData[Length(fInData) - 1];
    SetLength(fInData, Length(fInData) - 1);
  end else
    Result := '';
end;

function TCustomStack.GetLength : Integer;
begin
  Result := Length(fInData);
end;

end.
