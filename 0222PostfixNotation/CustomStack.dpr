program CustomStack;

uses
  Forms,
  FormMain in 'FormMain.pas' {MainForm},
  Stack in 'Stack.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
