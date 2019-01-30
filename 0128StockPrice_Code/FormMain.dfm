object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'StockPrice'
  ClientHeight = 474
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LoadButton: TButton
    Left = 24
    Top = 16
    Width = 105
    Height = 41
    Caption = 'Load'
    TabOrder = 0
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 88
    Width = 137
    Height = 369
    ColCount = 2
    TabOrder = 1
  end
  object StringGrid2: TStringGrid
    Left = 192
    Top = 88
    Width = 273
    Height = 369
    ColCount = 4
    TabOrder = 2
  end
end
