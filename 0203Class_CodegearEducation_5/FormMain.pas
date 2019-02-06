unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TDog = class
    Name : String;
    Age : byte;
    Address : String;

    function GetName : String;
  end;

  TPerson = class(Tobject)//()안하면 Tobject에서 자동계승 c++과는 다르게 mulinary 변수안됨.ㅣ
  //이 한문장이 오브젝트가 가지고있는 모든 상태와 행위를 받아온다.
  //메모리에 올리고 해제하는 기능이 이미 있음.
    Name : String;
    Age : byte;
    Address : String;

    constructor Create; virtual;
    function GetName : String;

  end;

  TEmp = class(TPerson) //Tperson이 가지고 있는것들을 상속..오브젝트이면서 person의 성질
    office : String;

    constructor Create; override;
    function Salary : Integer; virtual; abstract;//나는 이것을 여기서만이 아닌 그 해당하는 인스턴스에 맞게끔 셀러리를 가변적으로 찾아가겠다.
    //선언을 했지만 연산을 줄수없지.. 그때 abstract;
    //virtual로 선언할때 지금은 루틴을 잡을수없고, 밑에서 재정의할경우에는 연산을 쓸수있다. 지금은 바디가 없다는 뜻.
  end;

  TSalary = class(TEmp)
    Rank : STring;


    function Salary : Integer; override; //virtual이나 dynamic으로 정의한것아닌경우네는 override 할수없음.
    constructor create; override;
  end;

  THour = class(TEmp)
    Hrs : Integer;
    Rate : Integer;

    constructor create; override;
    function salary : Integer; override; //virtual로 선언한것에 대해서는 내 하위개체에서는 나에 맞는 셀러리를 정해서 쓰겠다.
        //virtual이나 dynamic펑션을 쓰지않은것은 override를 쓸수없다.
  end;

  TMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  fV : TEmp;// 스테틱으로 이미 결정남.. 임플로이에있는 salary만 찾아...이렇게 static으로하면 각각 따로 해줘야해.
  //클래스가 많아지면...문제...50개면 if문만 50개...말이안돼 그래서 virtual을 써.


implementation

{$R *.dfm}

{ TDog }
function TDog.GetName: String;
begin
  Result := Self.Name;
end;

{ TSalary }
constructor TSalary.create;
begin
  inherited;
  rank := '강사';

end;

function TSalary.Salary: Integer;
begin
  Result := 30000;
end;

{ THour }
constructor THour.create;
begin
  inherited;
  hrs := 10;
  rate := 5000;

end;

function THour.salary: Integer;
begin
  Result := Hrs * Rate;
end;

{ TPerson }

constructor TPerson.Create;
begin
  Name := 'Jung';
  Age := 20;
  Address := 'AnyWhere';
end;

function TPerson.GetName: String;
begin

end;

{ TEmp }

constructor TEmp.Create;
begin
  inherited;

  office := '데브기어';
end;



end.
