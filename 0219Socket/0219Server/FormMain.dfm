object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 309
  ClientWidth = 496
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
    Left = 8
    Top = 57
    Width = 121
    Height = 21
    TabOrder = 3
    OnKeyPress = SvrKeyPress
  end
  object SvrMemo: TMemo
    Tag = 8
    Left = 272
    Top = 119
    Width = 147
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 11
    OnKeyPress = SvrKeyPress
  end
  object SvrComboBox: TComboBox
    Tag = 6
    Left = 272
    Top = 57
    Width = 147
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = #49440#53469
    OnChange = CompClick
    Items.Strings = (
      'Circle'
      'TriAngle'
      'Rectangle')
  end
  object SvrCheckBox1: TCheckBox
    Tag = 4
    Left = 153
    Top = 147
    Width = 97
    Height = 17
    Caption = 'SvrCheckBox1'
    TabOrder = 7
    OnClick = CompClick
  end
  object SvrCheckBox2: TCheckBox
    Tag = 5
    Left = 153
    Top = 170
    Width = 97
    Height = 17
    Caption = 'SvrCheckBox2'
    TabOrder = 8
    OnClick = CompClick
  end
  object SvrRadioBtn1: TRadioButton
    Tag = 2
    Left = 153
    Top = 84
    Width = 113
    Height = 17
    Caption = 'SvrRadioBtn1'
    TabOrder = 5
    OnClick = CompClick
  end
  object SvrRadioBtn2: TRadioButton
    Tag = 3
    Left = 153
    Top = 107
    Width = 113
    Height = 17
    Caption = 'SvrRadioBtn2'
    TabOrder = 6
    OnClick = CompClick
  end
  object SvrListBox: TListBox
    Tag = 1
    Left = 8
    Top = 90
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 4
    OnClick = CompClick
  end
  object SvrScrollBar: TScrollBar
    Tag = 7
    Left = 272
    Top = 96
    Width = 147
    Height = 17
    PageSize = 0
    TabOrder = 10
    OnChange = CompClick
  end
end
