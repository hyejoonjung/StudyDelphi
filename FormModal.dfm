object ModalForm: TModalForm
  Left = 0
  Top = 0
  Caption = 'FormModal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ColorBox1: TColorBox
    Left = 240
    Top = 104
    Width = 145
    Height = 22
    ItemHeight = 16
    TabOrder = 0
  end
  object Button1: TButton
    Left = 272
    Top = 160
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
