unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TMainForm = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with Canvas Do begin
    Pen.Color := clRed;
//    Pen.Style := psDot;
//    Pen.Mode := pmBlack;
//    Beitmap�� bmp���Ϸ� ���.
//      Brush.Style := bsclear;//�̰� ���ϸ� ���ĺ���.
//      polygon ��̷� �־��ָ� ���󰡸鼭 �׷��ִ°� (�ٰ����׸���)
//      polyline�� ���ۺ��� �������� �׷���...��>������ �׷����� �ʾ�
//      TextOut(X, Y, '����');
//      pixels[X, Y] := clRed;
//    Brush.Style := bsHorizontal;
//    Arc(//��ä���� �� �׷����°�..);

    MoveTo(X - 50, Y - 50);
    LineTo(X + 50, y + 50);
//    LineTo(X + 50, Y - 50);
//    LineTo(X - 50, Y - 50);

//    Ellipse(X - 10, Y - 50, X + 50, Y + 50);
//    Rectangle(X - 10, Y - 10, X + 10, Y + 10);
  end;
end;



end.