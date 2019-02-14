program ViewPriceByJm;

uses
  Forms,
  FormMain in 'FormMain.pas' {MainForm},
  StockListClass in 'StockListClass.pas',
  ViewDlg in 'ViewDlg.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
