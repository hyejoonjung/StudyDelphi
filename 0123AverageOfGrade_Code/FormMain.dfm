object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #54217#44512#44396#54616#44592
  ClientHeight = 582
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object NameEdit: TEdit
    Left = 106
    Top = 23
    Width = 121
    Height = 21
    TabOrder = 0
    Text = #51221#54812#51456
  end
  object KorEdit: TEdit
    Left = 106
    Top = 50
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object EngEdit: TEdit
    Left = 106
    Top = 77
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object MathEdit: TEdit
    Left = 104
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object StaticText1: TStaticText
    Left = 24
    Top = 28
    Width = 26
    Height = 17
    Caption = #51060#47492
    TabOrder = 4
  end
  object StaticText2: TStaticText
    Left = 24
    Top = 54
    Width = 26
    Height = 17
    Caption = #44397#50612
    TabOrder = 5
  end
  object StaticText3: TStaticText
    Left = 24
    Top = 79
    Width = 26
    Height = 17
    Caption = #50689#50612
    TabOrder = 6
  end
  object StaticText4: TStaticText
    Left = 24
    Top = 108
    Width = 26
    Height = 17
    Caption = #49688#54617
    TabOrder = 7
  end
  object Delbutton: TButton
    Left = 376
    Top = 102
    Width = 75
    Height = 25
    Caption = #49325#51228
    TabOrder = 8
    OnClick = DelbuttonClick
  end
  object AddButton: TButton
    Left = 275
    Top = 102
    Width = 75
    Height = 25
    Caption = #52628#44032
    TabOrder = 9
    OnClick = AddButtonClick
  end
  object StringGrid1: TStringGrid
    Left = 64
    Top = 143
    Width = 425
    Height = 300
    DefaultColWidth = 80
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 10
  end
  object KorPanel: TPanel
    Left = 145
    Top = 449
    Width = 82
    Height = 41
    TabOrder = 11
  end
  object EngPanel: TPanel
    Left = 223
    Top = 449
    Width = 86
    Height = 41
    TabOrder = 12
  end
  object TotalPanel: TPanel
    Left = 392
    Top = 449
    Width = 97
    Height = 41
    TabOrder = 13
  end
  object MathPanel: TPanel
    Left = 308
    Top = 449
    Width = 84
    Height = 41
    TabOrder = 14
  end
end
