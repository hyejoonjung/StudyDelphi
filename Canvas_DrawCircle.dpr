program Canvas_DrawCircle;

uses
  Forms,
  FormMain in 'FormMain.pas' {MainForm},
  FormModal in 'FormModal.pas' {ModalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TModalForm, ModalForm);
  Application.Run;
end.
