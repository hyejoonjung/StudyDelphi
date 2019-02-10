object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'DrawAndMoving'
  ClientHeight = 430
  ClientWidth = 766
  Color = clBtnFace
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
  object ColorLabel: TLabel
    Left = 24
    Top = 39
    Width = 50
    Height = 13
    Caption = 'ColorLabel'
  end
  object SizeLabel: TLabel
    Left = 172
    Top = 40
    Width = 19
    Height = 13
    Caption = 'Size'
  end
  object IntervalLabel: TLabel
    Left = 303
    Top = 39
    Width = 38
    Height = 13
    Caption = 'Interval'
  end
  object ShapeLabel: TLabel
    Left = 485
    Top = 40
    Width = 30
    Height = 13
    Caption = 'Shape'
  end
  object ColorPanel: TPanel
    Left = 85
    Top = 30
    Width = 69
    Height = 32
    TabOrder = 0
    OnClick = ColorPanelClick
  end
  object ShapeComboBox: TComboBox
    Left = 521
    Top = 36
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = #49440#53469
    Items.Strings = (
      'Circle'
      'Triangle'
      'Rectangle')
  end
  object SizeSpinEdit: TSpinEdit
    Left = 201
    Top = 36
    Width = 96
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object IntervalSpinEdit: TSpinEdit
    Left = 347
    Top = 36
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object ColorDialog: TColorDialog
    Left = 112
    Top = 80
  end
end
