object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #49457#51201#44288#47532
  ClientHeight = 450
  ClientWidth = 456
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
  object EngLabel: TOTCLabel
    Left = 17
    Top = 80
    Width = 65
    Caption = #50689#50612
    ParentColor = False
  end
  object MathLabel: TOTCLabel
    Left = 17
    Top = 106
    Width = 65
    Caption = #49688#54617
    ParentColor = False
  end
  object NameLabel: TOTCLabel
    Left = 17
    Top = 25
    Width = 65
    Caption = #51060#47492
    ParentColor = False
  end
  object KorLabel: TOTCLabel
    Left = 17
    Top = 53
    Width = 65
    Caption = #44397#50612
    ParentColor = False
  end
  object DelBtn: TButton
    Left = 321
    Top = 104
    Width = 75
    Height = 25
    Caption = #49325#51228
    TabOrder = 6
    OnClick = DelBtnClick
  end
  object AddBtn: TButton
    Left = 240
    Top = 104
    Width = 75
    Height = 25
    Caption = #52628#44032
    TabOrder = 4
    OnClick = AddBtnClick
  end
  object ListGrid: TPowerStrGrid
    Left = 24
    Top = 176
    Width = 380
    Height = 217
    TabStop = False
    Ctl3D = False
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
    ParentCtl3D = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 5
    SortMarkType = smtNone
    SortMarkColor = clBlack
    StripeTempo = 0
    DefPopupLng = dplEng
    MovingLeft = 0
    MovingTop = 0
    ColWidths = (
      75
      75
      75
      75
      75)
    Cells = (
      0
      0
      #51060#47492
      1
      0
      #44397#50612
      2
      0
      #50689#50612
      3
      0
      #49688#54617
      4
      0
      #54217#44512)
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = (
      0
      4
      12632256
      0
      0)
    PropColsInfo = ()
    PropRowsInfo = ()
  end
  object EngEdit: TEdit
    Left = 88
    Top = 79
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object MathEdit: TEdit
    Left = 88
    Top = 106
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object NameEdit: TEdit
    Left = 88
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object KorEdit: TEdit
    Left = 88
    Top = 52
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object KorPanel: TPanel
    Left = 112
    Top = 391
    Width = 73
    Height = 34
    TabOrder = 7
  end
  object EngPanel: TPanel
    Left = 183
    Top = 391
    Width = 82
    Height = 34
    TabOrder = 8
  end
  object MathPanel: TPanel
    Left = 260
    Top = 391
    Width = 73
    Height = 34
    TabOrder = 9
  end
  object TotalPanel: TPanel
    Left = 331
    Top = 391
    Width = 73
    Height = 34
    TabOrder = 10
  end
end
