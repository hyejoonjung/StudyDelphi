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

    procedure DataManager(const aStr : String);
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
//  if fStackList <> nil then begin
//    with fStackList do begin
//      if Count > 0 then
//        for i := 0 to Count - 1 do begin
//          Delete(i);
//        end;
//      fStackList.Free;
//      fStackList := nil;
//    end;
//  end;
  if fStack <> nil then begin
    fStack.Free;
    fStack := nil;
  end;
end;

procedure TMainForm.InEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DataManager(InEdit.Text);    
end;

procedure TMainForm.DataManager(Const aStr : String);
var
  aOp : String;
  aRecv : String;
begin
  aRecv := aStr;
  if aStr = '' then
    Exit;
  fStrList.add('');
//  fParshingStr := '';
  while aRecv <> '' do begin
//    if aRecv[1] = '(' then begin
//    end;
    if aRecv[1] in ['0'..'9'] then
      fStrList[0] :=fStrList[0] + aRecv[1]
    else begin  //  연산자일경우
      with fStack do begin
        if GetLength <= 0 then
          push(aRecv[1])
        else begin
//          if aRecv[1] = '(' then
//            push(aRecv[1])
//          else if aRecv[1] = ')' then begin
//            aOp := Pop;
//            while aOp <> '(' do begin
//              fStrList[0] := fStrList[0] + aOp;
//              aOp := pop;
//            end;
//            pop;
//          end else
          if (aRecv[1] = '+') or (aRecv[1] = '-') then begin
            while GetLength > 0 do
              fStrList[0] := fStrList[0] + pop;
            push(aRecv[1]);
          end else begin
            aOp := pop;
            if (aOp = '+') or (aOp = '-') then
              push(aOp)
            else
              fStrList[0] := fStrList[0] + aOp;
            push(aRecv[1]);
          end;
        end;
      end;
    end;
    Delete(aRecv, 1, 1);
  end;
  while fStack.GetLength > 0 do
    fStrList[0] := fStrList[0] + fStack.pop;
  ParshingEdit.Text := fStrList[0];
  Oper(fStrList[0]);
  fStrList[0] := '';
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
