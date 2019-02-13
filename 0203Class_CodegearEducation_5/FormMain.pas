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

  TPerson = class(Tobject)//()���ϸ� Tobject���� �ڵ���� c++���� �ٸ��� mulinary �����ȵ�.��
  //�� �ѹ����� ������Ʈ�� �������ִ� ��� ���¿� ������ �޾ƿ´�.
  //�޸𸮿� �ø��� �����ϴ� ����� �̹� ����.
    Name : String;
    Age : byte;
    Address : String;

    constructor Create; virtual;
    function GetName : String;

  end;

  TEmp = class(TPerson) //Tperson�� ������ �ִ°͵��� ���..������Ʈ�̸鼭 person�� ����
    office : String;

    constructor Create; override;
    function Salary : Integer; virtual; abstract;//���� �̰��� ���⼭���� �ƴ� �� �ش��ϴ� �ν��Ͻ��� �°Բ� �������� ���������� ã�ư��ڴ�.
    //������ ������ ������ �ټ�����.. �׶� abstract;
    //virtual�� �����Ҷ� ������ ��ƾ�� ����������, �ؿ��� �������Ұ�쿡�� ������ �����ִ�. ������ �ٵ� ���ٴ� ��.
  end;

  TSalary = class(TEmp)
    Rank : STring;


    function Salary : Integer; override; //virtual�̳� dynamic���� �����Ѱ;ƴѰ��״� override �Ҽ�����.
    constructor create; override;
  end;

  THour = class(TEmp)
    Hrs : Integer;
    Rate : Integer;

    constructor create; override;
    function salary : Integer; override; //virtual�� �����ѰͿ� ���ؼ��� �� ������ü������ ���� �´� �������� ���ؼ� ���ڴ�.
        //virtual�̳� dynamic����� ������������ override�� ��������.
  end;

  TMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  fV : TEmp;// ����ƽ���� �̹� ������.. ���÷��̿��ִ� salary�� ã��...�̷��� static�����ϸ� ���� ���� �������.
  //Ŭ������ ��������...����...50���� if���� 50��...���̾ȵ� �׷��� virtual�� ��.


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
  rank := '����';

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

  office := '������';
end;



end.