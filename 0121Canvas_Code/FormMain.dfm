object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Canvas'#50672#49845#54616#44592
  ClientHeight = 416
  ClientWidth = 405
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object ColorPan: TPanel
    Left = 71
    Top = 30
    Width = 43
    Height = 23
    Color = clNone
    ParentBackground = False
    TabOrder = 0
    OnDblClick = ColorPanDblClick
  end
  object SizeEdit: TSpinEdit
    Left = 201
    Top = 32
    Width = 40
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 10
    OnChange = SizeEditChange
  end
  object IntervalEdit: TSpinEdit
    Left = 330
    Top = 33
    Width = 37
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 1
    OnChange = IntervalEditChange
  end
  object SizeText: TStaticText
    Left = 156
    Top = 36
    Width = 23
    Height = 17
    Caption = 'Size'
    TabOrder = 3
  end
  object IntervalText: TStaticText
    Left = 282
    Top = 36
    Width = 42
    Height = 17
    Caption = 'Interval'
    TabOrder = 4
  end
  object ColorText: TStaticText
    Left = 36
    Top = 36
    Width = 29
    Height = 17
    Caption = 'Color'
    TabOrder = 5
  end
end
