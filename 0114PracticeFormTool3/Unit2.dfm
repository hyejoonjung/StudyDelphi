object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 617
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 227
    Top = 477
    Width = 100
    Height = 29
    Progress = 50
  end
  object TabControl1: TTabControl
    Left = 32
    Top = 63
    Width = 209
    Height = 49
    TabOrder = 0
    Tabs.Strings = (
      '1')
    TabIndex = 0
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 110
    Width = 289
    Height = 118
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Button1: TButton
        Left = 53
        Top = 18
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
  end
  object RichEdit1: TRichEdit
    Left = 77
    Top = 312
    Width = 185
    Height = 89
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 2
  end
  object TrackBar1: TTrackBar
    Left = 12
    Top = 211
    Width = 150
    Height = 45
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 23
    Top = 262
    Width = 257
    Height = 25
    Position = 60
    TabOrder = 4
  end
  object UpDown1: TUpDown
    Left = 24
    Top = 352
    Width = 33
    Height = 41
    TabOrder = 5
  end
  object HotKey1: THotKey
    Left = 24
    Top = 407
    Width = 121
    Height = 19
    HotKey = 32833
    TabOrder = 6
  end
  object Animate1: TAnimate
    Left = 24
    Top = 448
    Width = 100
    Height = 80
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 544
    Width = 186
    Height = 21
    Date = 43479.820513900460000000
    Format = 'MM/dd/yyy'
    Time = 43479.820513900460000000
    TabOrder = 8
  end
  object TreeView2: TTreeView
    Left = 360
    Top = 229
    Width = 121
    Height = 97
    Indent = 19
    TabOrder = 9
    Items.NodeData = {
      01050000001F0000000000000000000000FFFFFFFFFFFFFFFF00000000010000
      000331002D003100190000000000000000000000FFFFFFFFFFFFFFFF00000000
      0100000000190000000000000000000000FFFFFFFFFFFFFFFF00000000010000
      0000190000000000000000000000FFFFFFFFFFFFFFFF00000000010000000019
      0000000000000000000000FFFFFFFFFFFFFFFF00000000010000000019000000
      0000000000000000FFFFFFFFFFFFFFFF00000000010000000019000000000000
      0000000000FFFFFFFFFFFFFFFF00000000010000000019000000000000000000
      0000FFFFFFFFFFFFFFFF000000000100000000190000000000000000000000FF
      FFFFFFFFFFFFFF0000000000000000001B0000000000000000000000FFFFFFFF
      FFFFFFFF00000000000000000132001B0000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000000133001B0000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000134001B0000000000000000000000FFFFFFFFFFFFFF
      FF0000000000000000013500}
  end
  object ListView1: TListView
    Left = 303
    Top = 110
    Width = 297
    Height = 113
    Columns = <
      item
        Caption = #54028#51068#47749
        Width = 100
      end
      item
        Caption = #54028#51068#49324#51060#51592
        Width = 70
      end
      item
        Caption = #54028#51068#45216#51676
      end>
    TabOrder = 10
    ViewStyle = vsReport
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 598
    Width = 831
    Height = 19
    Panels = <
      item
        Text = '50'
        Width = 50
      end
      item
        Text = '50'
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 831
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 12
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 54
      Top = 0
      Caption = 'ToolButton5'
      ImageIndex = 3
    end
    object ToolButton4: TToolButton
      Left = 77
      Top = 0
      Caption = 'ToolButton4'
      ImageIndex = 2
    end
    object ToolButton6: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 108
      Top = 0
      Caption = 'ToolButton7'
      ImageIndex = 4
    end
    object ToolButton8: TToolButton
      Left = 131
      Top = 0
      Caption = 'ToolButton8'
      ImageIndex = 5
    end
    object ToolButton9: TToolButton
      Left = 154
      Top = 0
      Caption = 'ToolButton9'
      ImageIndex = 6
    end
    object PageScroller1: TPageScroller
      Left = 177
      Top = 0
      Width = 150
      Height = 22
      TabOrder = 0
    end
    object ToolButton10: TToolButton
      Left = 327
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 7
      Style = tbsSeparator
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 29
    Width = 831
    Height = 28
    Bands = <
      item
        ImageIndex = -1
        Width = 825
      end
      item
        ImageIndex = -1
        Width = 825
      end>
  end
  object Button2: TButton
    Left = 205
    Top = 234
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 14
    OnClick = Button2Click
  end
  object MediaPlayer1: TMediaPlayer
    Left = 288
    Top = 345
    Width = 253
    Height = 30
    TabOrder = 15
  end
  object Notebook1: TNotebook
    Left = 606
    Top = 122
    Width = 150
    Height = 150
    PageIndex = 2
    TabOrder = 16
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object Panel1: TPanel
        Left = 0
        Top = 57
        Width = 185
        Height = 41
        Caption = 'Panel1'
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '1'
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '2'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '3'
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object FileListBox1: TFileListBox
    Left = 541
    Top = 278
    Width = 145
    Height = 97
    ItemHeight = 13
    TabOrder = 17
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 460
    Top = 381
    Width = 145
    Height = 97
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 18
  end
  object DriveComboBox1: TDriveComboBox
    Left = 606
    Top = 510
    Width = 145
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 19
  end
  object FilterComboBox1: TFilterComboBox
    Left = 606
    Top = 535
    Width = 145
    Height = 21
    TabOrder = 20
  end
  object Button3: TButton
    Left = 327
    Top = 389
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 21
    OnClick = Button3Click
  end
  object SpinEdit1: TSpinEdit
    Left = 333
    Top = 477
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 22
    Value = 0
  end
  object DirectoryOutline1: TDirectoryOutline
    Left = 190
    Top = 512
    Width = 245
    Height = 97
    ItemHeight = 13
    Options = [ooDrawFocusRect]
    PictureLeaf.Data = {
      46030000424D460300000000000036000000280000000E0000000E0000000100
      2000000000001003000000000000000000000000000000000000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008000800080008000800080000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF000000000080008000800080008000800000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000008000
      800080008000800080000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000080008000800080008000
      800000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000008000800080008000800080000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF000000000080008000800080008000800000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000008000
      8000800080008000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000800080008000800080008000
      80008000800000000000FFFFFF0000FFFF00FFFFFF0000FFFF00000000008000
      8000800080008000800080008000800080008000800080008000800080008080
      8000000000000000000000000000000000008080800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      80008000800080008000}
    TabOrder = 23
    Data = {10}
  end
  object WebBrowser1: TWebBrowser
    Left = 611
    Top = 378
    Width = 300
    Height = 150
    TabOrder = 24
    ControlData = {
      4C000000021F0000810F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Button4: TButton
    Left = 692
    Top = 347
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 25
    OnClick = Button4Click
  end
  object ImageList1: TImageList
    Left = 32
    Top = 304
    Bitmap = {
      494C010102000800140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00000000007F7F7F007F7F
      7F00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000007F7F7F007F7F
      7F00FFFFFF00FFFFFF00000000007F7F7F0000000000FFFFFF00000000007F7F
      7F007F7F7F00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF00000000000000
      00007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000000000007F7F7F00FFFFFF007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000007F7F7F00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      00007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF0000000000000000000000
      0000000000007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      0000000000007F7F7F00000000007F7F7F00FFFFFF00FFFFFF00000000000000
      0000000000007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F007F7F7F00FFFFFF00FFFFFF000000
      0000000000007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF0000000000000000007F7F7F007F7F7F007F7F7F00000000007F7F7F00FFFF
      FF00FFFFFF007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF000000000000000000000000007F7F7F0000000000FFFF
      FF00FFFFFF00000000007F7F7F007F7F7F007F7F7F00000000007F7F7F007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000000000000000007F7F7F007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF0000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFC1F00000000F83FF00700000000
      E00FE04300000000CC47C2A1000000008463803100000000A07382F800000000
      31F910780000000038F91A38000000003C791E18000000003C391C0800000000
      3C190C41000000009C0BA441000000008C43900300000000C467C80700000000
      E00FE38F00000000F83FF83F0000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 112
    Top = 224
    object N1: TMenuItem
      Caption = #54028#51068
      object new1: TMenuItem
        Caption = 'new'
        ImageIndex = 0
      end
    end
  end
  object Timer1: TTimer
    Left = 312
    Top = 270
  end
  object MainMenu2: TMainMenu
    Images = ImageList1
    Left = 192
    Top = 136
  end
  object OpenDialog1: TOpenDialog
    Left = 288
    Top = 390
  end
  object SaveDialog1: TSaveDialog
    Left = 416
    Top = 390
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 368
    Top = 438
  end
  object PrintDialog1: TPrintDialog
    Left = 336
    Top = 438
  end
end