unit FormModal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TModalForm = class(TForm)
    ColorBox1: TColorBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModalForm: TModalForm;

implementation

uses FormMain;

{$R *.dfm}

procedure TModalForm.Button1Click(Sender: TObject);
begin
  MainForm.panel1.Color := ModalForm.colorBox1.Selected;
  Close;
end;

end.

