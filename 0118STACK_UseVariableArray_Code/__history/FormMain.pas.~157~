unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    InEdit: TEdit;
    PopBtn: TButton;
    PushBtn: TButton;
    OutPan: TPanel;
    procedure PushBtnClick(Sender: TObject);
    procedure PopBtnClick(Sender: TObject);
  private
    { Private declarations }
    fInData : array of String;

    procedure ViewOutput(const aVal : String);
    procedure Push(const aVal : String);
    procedure Pop();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure TMainForm.ViewOutput(const aVal : String);
begin
  OutPan.Caption := aVal;
end;

procedure TMainForm.Push(const aVal : String);
begin
  SetLength(fInData, Length(fInData) + 1);
  fInData[Length(fInData) - 1] := aVal;
end;

procedure TMainForm.PopBtnClick(Sender: TObject);
begin
  Pop();
end;

procedure TMainForm.PushBtnClick(Sender: TObject);
begin
  Push(InEdit.Text);
  InEdit.Text := ('');
end;

procedure TMainForm.Pop();
begin
  if Length(fInData) <= 0 then
    ViewOutput('Empty')
  else begin
    ViewOutput(fInData[Length(fInData) - 1]);
    SetLength(fInData, Length(fInData) - 1);
  end;
end;

end.
