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
  MainForm.Canvas.Pen.color := ColorBox1.Selected;
  MainForm.ColorPan.Color := ColorBox1.Selected;
  ModalForm.Close;
end;

end.
