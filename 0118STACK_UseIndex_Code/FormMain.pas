unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    InEdit: TEdit;
    PopBtn: TButton;
    PushBtn: TButton;
    OutPan: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PushBtnClick(Sender: TObject);
    procedure PopBtnClick(Sender: TObject);
  private
    { Private declarations }
    fInData : array[1..100] of String;
    i : Integer;

    procedure DoOutput(const aVal : String);
    procedure DoInput(aBVal : Boolean; const aSVal : String);
    procedure MadeInData(const aVal : String);
    procedure ExecPop;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure TMainForm.FormCreate(Sender: TObject);
begin
  i := 0;
end;

procedure TMainForm.DoOutput(const aVal : String);
begin
  OutPan.Caption := aVal;
end;

procedure TMainForm.DoInput(aBVal : Boolean;const aSVal : String);
begin
  if aBVal then
    MadeInData(aSVal)
  else
    ExecPop();
end;

procedure TMainForm.MadeInData(const aVal : String);
begin
  i := i + 1;
  if i < 100 then
    fInData[i] := aVal;
end;

procedure TMainForm.PopBtnClick(Sender: TObject);
begin
  ExecPop();
end;

procedure TMainForm.PushBtnClick(Sender: TObject);
begin
  DoInput(True, InEdit.Text);
  InEdit.Text := ('');
end;

procedure TMainForm.ExecPop();
begin
  if i < 1 then
    DoOutput('Empty')
  else begin
    DoOutput(fInData[i]);
    i := i - 1;
  end;
end;

end.
