unit NameListClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  PwrGrid;

type
  PNameInfo = ^TNameInfo;
  TNameInfo = record
    iName : String;
    iAge : Integer;
  end;

  TOnChange = procedure(Sender : TObject; aInfo : PNameInfo; aIsAdd : Boolean) of object;
  //TOnChange로 생성된 필드에는 이런 함수가 들어갈꺼야.. 말그대로 정의지. 
  //이벤트핸들러.
  //  object의 프로시저이다..??

  TNameList = class(TList)
  private
    fViewGrid : TPowerStrGrid; //create하지않아.

    //이벤트핸들러를 저장  할 데이터 필드.
    fOnChange : TOnChange;
  protected
    function Get(Index : Integer) : PNameInfo;
    procedure Put(Index : Integer; Item : PNameInfo);
  public
    constructor Create(aViewGrid : TPowerStrGrid); virtual;
    destructor Destroy; override;

    function Add(const aName : String; aAge : Integer) : PNameInfo;
    procedure Clear; override;
    procedure Delete(Index : Integer); overload;
    procedure Delete(const aName : String); overload;
    function IndexOf(const aName : String) : PNameInfo;
    //프로퍼티.. fOnChange 에 접근권한을 설정할수있는...변수. 즉 property
    property OnChange : TOnChange read fOnChange write fOnChange;
  end;

const
  GC_NAME = 0;
  GC__AGE = 1;

implementation

{ TNameList }

constructor TNameList.Create(aViewGrid : TPowerStrGrid);
begin
  inherited Create;//그냥하면안돼

  fViewGrid := aViewGrid;//free는 내가 create한거만
end;

destructor TNameList.Destroy;
begin
  Clear;

  inherited;
end;

function TNameList.Get(Index : Integer) : PNameInfo;
begin
  Result := PNameInfo(inherited Get(Index));
end;

procedure TNameList.Put(Index : Integer; Item : PNameInfo);
begin
  inherited Put(Index, Item);
end;

function TNameList.Add(const aName : String; aAge : Integer) : PNameInfo;
var
  aRow : Integer;
begin
  Result := IndexOf(aName);
  if Result = nil then begin
    New(Result);
    Result.iName := aName;

    inherited Add(Result);
  end;
  Result.iAge := aAge;
  if Assigned(fOnChange) then   //fOnChange가 걸려잇다면..?
    fOnChange(Self, Result, True);
  if fViewGrid <> nil then begin
    with fViewGrid do begin
      aRow := Cols[GC_NAME].IndexOf(Result.iName);//입력받은 record의 name의 칼럼의 Row찾기
      if aRow < 0 then begin  // grid에 이름이 존재하지 않으면
        aRow := RowCount - 1;     //grd맨마지막 인덱스를 aRow에 담아.
        if Cells[GC_NAME, aRow] <> '' then   //마지막인덱스가 빈칸이아니면 aRow++
          Inc(aRow);
        RowCount := aRow + 1; //로우카운트늘려줘
        Cells[GC_NAME, aRow] := Result.iName;   //이름셀에 받은이름 넣어줘.
      end;
      Cells[GC__AGE, aRow] := IntToStr(Result.iAge);//나이 넣어줘 //업데이트개념
    end;  
  end;
end;

procedure TNameList.Clear;
begin
  while Count > 0 do
    Delete(Count - 1);

  inherited;
end;

procedure TNameList.Delete(Index : Integer);
var
  aInfo : PNameInfo;
  aRow : Integer;
begin
  if Index < 0 then
    Exit;
  aInfo := Get(Index);
  if aInfo <> nil then begin
    Put(Index, nil);
    if Assigned(fOnChange) then
      fOnChange(Self, aInfo, False);
    if fViewGrid <> nil then begin
      with fViewGrid do begin
        aRow := Cols[GC_NAME].IndexOf(aInfo.iName);//입력받은 record의 name의 칼럼의 Row찾기
        if aRow > 0 then //삭제
          RemoveRow(aRow);
      end;
    end;
    Dispose(aInfo);
  end;

  inherited;
end;

procedure TNameList.Delete(const aName : String);
var
  aInfo : PNameInfo;
begin
  aInfo := IndexOf(aName);
  if aInfo <> nil then
    Delete(inherited IndexOf(aInfo)); //부모는 포인터, 나는 네임으로.
end;

function TNameList.IndexOf(const aName : String) : PNameInfo;
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
