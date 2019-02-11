program GradeManage;

uses
  Forms,
  FormMain in 'FormMain.pas' {MainForm},
  StudentListClass in 'StudentListClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
