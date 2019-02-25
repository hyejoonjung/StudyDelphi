unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Stack;

type
  TMainForm = class(TForm)
    InEdit: TEdit;
    ParshingEdit: TEdit;
    OutputEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    fStrList : TStringList;
    fStackList : TList;
    fParshingStr : String;
    fStack : TCustomStack;

    procedure DataManager(Const aStr : String; aIndex : Integer);
    procedure Oper(const aStr : String);
  public
    { Public declarations }
    
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fStrList := TStringList.Create;
//  fStacKList := TList.Create;
  fStack := TCustomStack.Create;
  fParshingStr := '';
end;

procedure TMainForm.FormDestroy(Sender: TObject);

begin
  if fStrList <> nil then begin
    fStrList.Free;
    fStrlist := nil;
  end;
  if fStack <> nil then begin
    fStack.Free;
    fStack := nil;
  end;
end;

procedure TMainForm.InEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DataManager(InEdit.Text, 0);    
end;

procedure TMainForm.DataManager(Const aStr : String; aIndex : Integer);
var
  aOp : String;
  aRecv : String;
begin
  aRecv := aStr;
  if aStr = '' then
    Exit;
  fStrList.add('');
  fStackList.Add(TCustomStack.Create);
  while aRecv <> '' do begin
    if aRecv[1] in ['0'..'9'] then
      fStrList[aIndex] := fStrList[aIndex] + aRecv[1]
    else begin  //  연산자일경우
      with fStackList[aIndex] do begin
        if GetLength <= 0 then
          push(aRecv[1])
        else begin
          if (aRecv[1] = '+') or (aRecv[1] = '-') then begin
            while GetLength > 0 do
              fStrList[aIndex] := fStrList[aIndex] + pop;
            push(aRecv[1]);
          end else begin
            aOp := pop;
            if (aOp = '+') or (aOp = '-') then
              push(aOp)
            else
              fStrList[aIndex] := fStrList[aIndex] + aOp;
            push(aRecv[1]);
          end;
        end;
      end;
    end;
    Delete(aRecv, 1, 1);
  end;
  with fStackList[aIndex] do begin
    while GetLength > 0 do
      fStrList[aIndex] := fStrList[aIndex] + pop;
    ParshingEdit.Text := fStrList[aIndex];
    Oper(fStrList[aIndex]);
    fStrList[aIndex] := '';
  end;
end;

procedure TMainForm.Oper(const aStr : String);
var
  aRecv : String;
  aOperand1 : Integer;
  aOperand2 : Integer;
begin
  aRecv := aStr;
  with fStack do begin
    while aRecv <> '' do begin
      if aRecv[1] in ['1'..'9'] then
        Push(aRecv[1])
      else begin
        aOperand1 := StrToInt(Pop);
        aOperand2 := StrToInt(Pop);
        case aRecv[1] of
          '+' : push(IntToStr(aOperand1 + aOperand2));
          '-' : push(IntToStr(aOperand1 - aOperand2));
          '*' : push(IntToStr(aOperand1 * aOperand2));
          '/' : push(FormatFloat('0.##',(aOperand1 / aOperand2)));
        end;
      end;
      Delete(aRecv, 1, 1);
    end;
    OutputEdit.Text := pop;
  end;
end;

end.
