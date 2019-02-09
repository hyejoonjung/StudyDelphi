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
  fNameList.OnChange := NameListChange;  //프로시져를 상속받은 TList.onChange에 연결했어.
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
begin //레코드가 들어오면 grid의 인덱스에 iname이 있나 확인, aIsAdd일경우 있으면 나이만,없으면 다 추가, add아니면 삭제.
  if aInfo = nil then
    Exit;
  with ListGrid do begin
    aRow := Cols[GC_NAME].IndexOf(aInfo.iName);//입력받은 record의 name의 칼럼의 Row찾기
    if aIsAdd then begin //추가면,,
      if aRow < 0 then begin  // grid에 이름이 존재하지 않으면
        aRow := RowCount - 1;     //grd맨마지막 인덱스를 aRow에 담아.
        if Cells[GC_NAME, aRow] <> '' then   //마지막인덱스가 빈칸이아니면 aRow++
          Inc(aRow);
        RowCount := aRow + 1; //로우카운트늘려줘
        Cells[GC_NAME, aRow] := aInfo.iName;   //이름셀에 받은이름 넣어줘.
      end;
      Cells[GC__AGE, aRow] := IntToStr(aInfo.iAge);//나이 넣어줘 //업데이트개념
    end else if aRow > 0 then //삭제
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
