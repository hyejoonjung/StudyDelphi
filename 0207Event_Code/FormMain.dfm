object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #47700#51064#54268
  ClientHeight = 351
  ClientWidth = 560
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
  object DelBtn: TButton
    Left = 329
    Top = 50
    Width = 75
    Height = 25
    Caption = #49325#51228
    TabOrder = 0
    OnClick = DelBtnClick
  end
  object AddBtn: TButton
    Left = 248
    Top = 50
    Width = 75
    Height = 25
    Caption = #52628#44032
    TabOrder = 1
    OnClick = AddBtnClick
  end
  object NameText: TStaticText
    Left = 24
    Top = 29
    Width = 26
    Height = 17
    Caption = #51060#47492
    TabOrder = 2
  end
  object AgeText: TStaticText
    Left = 24
    Top = 56
    Width = 26
    Height = 17
    Caption = #45208#51060
    TabOrder = 3
  end
  object NameEdit: TEdit
    Left = 88
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object AgeEdit: TEdit
    Left = 88
    Top = 52
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object ListGrid: TPowerStrGrid
    Left = 24
    Top = 104
    Width = 337
    Height = 217
    TabStop = False
    ColCount = 2
    Ctl3D = False
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnDblClick = ListGridDblClick
    SortMarkType = smtNone
    SortMarkColor = clBlack
    StripeTempo = 0
    DefPopupLng = dplEng
    MovingLeft = 0
    MovingTop = 0
    ColWidths = (
      100
      100)
    Cells = (
      0
      0
      #51060#47492
      1
      0
      #45208#51060)
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
end
