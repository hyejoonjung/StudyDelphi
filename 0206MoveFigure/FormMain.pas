unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TMainForm = class(TForm)
    ColorText: TStaticText;
    SizeText: TStaticText;
    IntervalText: TStaticText;
    ShapeText: TStaticText;
    FigureComboBox: TComboBox;
    ColorDialog: TColorDialog;
    ColorPanel: TPanel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    procedure ColorPanelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ColorPanelClick(Sender: TObject);
begin
  ColorDialog.Execute;
  ColorPanel.Color := ColorDialog.Color;
end;

end.
