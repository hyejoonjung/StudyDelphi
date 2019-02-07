unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UpGrids, PwrGrid, StdCtrls, NameListClass;

type
  TMainForm = class(TForm)
    DelBtn: TButton;
    AddBtn: TButton;
    NameText: TStaticText;
    AgeText: TStaticText;
    NameEdit: TEdit;
    AgeEdit: TEdit;
    ListGrid: TPowerStrGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
  private
    { Private declarations }
    fNameList : TNameList;

    procedure NameListChange(Sender : TObject; aInfo : PNameInfo; aIsAdd : Boolean); 
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const
  GC_NAME = 0;
  GC__AGE = 1;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fNameList := TNameList.Create;
  fNameList.OnChange := NameListChange;
end;


procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if fNameList <> nil then begin
    fNameList.Free;
    fNameList := nil;
  end;
end;

procedure TMainForm.NameListChange(Sender : TObject; aInfo : PNameInfo; aIsAdd : Boolean);
var
  aRow : Integer;
begin
  if aInfo = nil then
    Exit;
  with ListGrid do begin
    aRow := Cols[GC_NAME].IndexOf(aInfo.iName);
    if aIsAdd then begin
      if aRow < 0 then begin
        aRow := RowCount - 1;
        if Cells[GC_NAME, aRow] <> '' then
          Inc(aRow);
        RowCount := aRow + 1;
        Cells[GC_NAME, aRow] := aInfo.iName;
      end;
      Cells[GC__AGE, aRow] := IntToStr(aInfo.iAge);
    end else if aRow > 0 then
      RemoveRow(aRow);
  end;
end;

procedure TMainForm.AddBtnClick(Sender: TObject);
begin
  if fNameList = nil then
    Exit;
  if NameEdit.Text = '' then
    Exit;
  if AgeEdit.Text = '' then
    Exit;
  fNameList.Add(NameEdit.Text, StrToInt(AgeEdit.Text));
end;

procedure TMainForm.DelBtnClick(Sender: TObject);
begin
  if fNameList = nil then
    Exit;
  if NameEdit.Text = '' then
    Exit;
  fNameList.Delete(NameEdit.Text);
end;

end.
