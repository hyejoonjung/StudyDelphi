object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 255
  ClientWidth = 444
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
  object Label5: TLabel
    Left = 94
    Top = 11
    Width = 20
    Height = 13
    Caption = 'port'
  end
  object Label2: TLabel
    Left = 14
    Top = 8
    Width = 51
    Height = 18
    Caption = 'Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SvrPortEdit: TEdit
    Left = 120
    Top = 8
    Width = 87
    Height = 21
    TabOrder = 0
    Text = '5000'
  end
  object SvrConnectBtn: TButton
    Left = 248
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = SvrConnectBtnClick
  end
  object SvrDisConnectBtn: TButton
    Left = 339
    Top = 8
    Width = 75
    Height = 25
    Caption = 'DisConnect'
    TabOrder = 2
    OnClick = SvrDisConnectBtnClick
  end
  object SvrEdit: TEdit
    Tag = 5
    Left = 11
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 3
    OnKeyDown = SvrEditKeyDown
  end
  object SvrMemo: TMemo
    Left = 267
    Top = 119
    Width = 147
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object SvrComboBox: TComboBox
    Left = 267
    Top = 57
    Width = 147
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = #49440#53469
    Items.Strings = (
      'Circle'
      'TriAngle'
      'Rectangle')
  end
  object SvrCheckBox1: TCheckBox
    Left = 153
    Top = 147
    Width = 97
    Height = 17
    Caption = 'SvrCheckBox1'
    TabOrder = 6
  end
  object SvrCheckBox2: TCheckBox
    Left = 153
    Top = 170
    Width = 97
    Height = 17
    Caption = 'SvrCheckBox2'
    TabOrder = 7
  end
  object SvrRadioButton1: TRadioButton
    Left = 153
    Top = 84
    Width = 113
    Height = 17
    Caption = 'SvrRadioButton1'
    TabOrder = 8
  end
  object SvrRadioButton2: TRadioButton
    Left = 153
    Top = 107
    Width = 113
    Height = 17
    Caption = 'SvrRadioButton2'
    TabOrder = 9
  end
  object SvrListBox: TListBox
    Left = 11
    Top = 102
    Width = 121
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      #49692#45824#44397
      #49444#47105#53461
      #46024#44620#49828
      #48512#45824#52236#44060)
    TabOrder = 10
  end
  object SvrScrollBar: TScrollBar
    Left = 267
    Top = 96
    Width = 147
    Height = 17
    PageSize = 0
    TabOrder = 11
  end
end
