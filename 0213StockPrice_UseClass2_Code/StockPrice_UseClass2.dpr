program StockPrice_UseClass2;

uses
  Forms,
  FormMain in 'FormMain.pas' {MainForm},
  StockListClass in 'StockListClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
