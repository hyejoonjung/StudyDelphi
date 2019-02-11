unit StudentListClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

type
  PGradeInfo = ^TGradeInfo;
  TGradeInfo = record
    iName : String;
    iKor : Integer;
    iEng : Integer;
    iMath : Integer;
    iAvg : Double;
  end;

  TOnChange = procedure(Sender : TObject; aInfo : PGradeInfo; aIsAdd : Boolean) of object;

  TStudentList = class(TList)
  private
    fOnChange : TOnChange;
  protected
    function Get(Index : Integer) : PGradeInfo;
    procedure Put(Index : Integer; Item : PGradeInfo);
  public
    destructor Destroy; override;

    function Add(const aName : String; aKor, aEng, aMath : Integer ) : PGradeInfo;
    procedure Clear; override;
    procedure Delete(Index : Integer); overload;
    procedure Delete(const aName : String); overload;
    function IndexOf(const aName : String) : PGradeInfo;
    //프로퍼티.. fOnChange 에 접근권한을 설정할수있는...변수. 즉 property
    property OnChange : TOnChange read fOnChange write fOnChange;
  end;

implementation

{ TNameList }

destructor TStudentList.Destroy;
begin
  Clear;

  inherited;
end;

function TStudentList.Get(Index : Integer) : PGradeInfo;
begin
  Result := PGradeInfo(inherited Get(Index));
end;

procedure TStudentList.Put(Index : Integer; Item : PGradeInfo);
begin
  inherited Put(Index, Item);
end;

function TStudentList.Add(const aName : String; aKor, aEng, aMath : Integer) : PGradeInfo;
begin
  Result := IndexOf(aName);
  if Result = nil then begin
    New(Result);
    Result.iName := aName;

    inherited Add(Result);
  end;
  Result.iKor := aKor;
  Result.iEng := aEng;
  Result.iMath := aMath;
  Result.iAvg := (aKor + aEng + aMath) / 3;
  if Assigned(fOnChange) then  
    fOnChange(Self, Result, True);
end;

procedure TStudentList.Clear;
begin
  while Count > 0 do
    Delete(Count - 1);

  inherited;
end;

procedure TStudentList.Delete(Index : Integer);
var
  aInfo : PGradeInfo;
begin
  if Index < 0 then
    Exit;
  aInfo := Get(Index);
  if aInfo <> nil then begin
    Put(Index, nil);
    if Assigned(fOnChange) then
      fOnChange(Self, aInfo, False);
    Dispose(aInfo);
  end;

  inherited;
end;

procedure TStudentList.Delete(const aName : String);
var
  aInfo : PGradeInfo;
begin
  aInfo := IndexOf(aName);
  if aInfo <> nil then
    Delete(inherited IndexOf(aInfo)); //부모는 포인터, 나는 네임으로.
end;

function TStudentList.IndexOf(const aName : String) : PGradeInfo;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do begin
    Result := Get(i);
    if (Result <> nil) and (Result.iName = aName) then
      Exit;
  end;
  Result := nil;
end;

end.
