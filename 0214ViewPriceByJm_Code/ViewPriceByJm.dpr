program ViewPriceByJm;

uses
  Forms,
  FormMain in 'FormMain.pas' {MainForm},
  StockListClass in 'StockListClass.pas',
  JmViewDlg in 'JmViewDlg.pas' {DlgJmView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  //  Application.CreateForm(TModalForm, ModalForm);
  Application.Run;
end.
