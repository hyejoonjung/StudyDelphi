object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #49345#54408#48324#51333#47785#48324' '#49884#49464#51312#54924
  ClientHeight = 564
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LoadButton: TButton
    Left = 48
    Top = 40
    Width = 89
    Height = 41
    Caption = 'Load'
    TabOrder = 0
    OnClick = LoadButtonClick
  end
  object StringGrid1: TStringGrid
    Left = 48
    Top = 103
    Width = 129
    Height = 417
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
  end
  object StringGrid2: TStringGrid
    Left = 240
    Top = 103
    Width = 257
    Height = 417
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
  end
end
