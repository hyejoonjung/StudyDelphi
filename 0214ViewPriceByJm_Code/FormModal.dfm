object ModalForm: TModalForm
  Left = 0
  Top = 0
  Caption = #51333#47785#48324' '#49884#49464
  ClientHeight = 363
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CodeNameLabel: TLabel
    Left = 188
    Top = 14
    Width = 68
    Height = 23
    Caption = #51333#47785#53076#46300
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ViewGrid: TPowerStrGrid
    Left = 24
    Top = 43
    Width = 449
    Height = 286
    TabStop = False
    ColCount = 3
    Ctl3D = False
    RowCount = 11
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    SortMarkType = smtNone
    SortMarkColor = clBlack
    StripeTempo = 0
    DefPopupLng = dplEng
    MovingLeft = 0
    MovingTop = 0
    SelectEditText = False
    ColWidths = (
      150
      150
      150)
    RowHeights = (
      20
      25
      25
      25
      25
      25
      25
      25
      25
      25
      25)
    Cells = (
      0
      0
      #47588#46020#51092#47049
      1
      0
      #54840#44032
      2
      0
      #47588#49688#51092#47049)
    PropCell = (
      0
      0
      1
      2
      0
      0
      6
      26
      True
      0
      0
      7
      26
      True
      0
      0
      8
      26
      True
      0
      0
      9
      26
      True
      0
      1
      0
      1
      2
      0
      2
      0
      1
      2
      0
      2
      2
      1
      2
      0)
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
    PropRowsInfo = (
      5
      1
      0
      7
      1
      0
      8
      1
      0
      9
      1
      0
      10
      1
      0)
  end
  object ViewTimer: TTimer
    Interval = 15
    OnTimer = ViewTimerTimer
    Left = 376
    Top = 8
  end
end
