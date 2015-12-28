object frm_ALERTA: Tfrm_ALERTA
  Left = 71
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 258
  ClientWidth = 634
  Color = clRed
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -27
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 33
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 634
    Height = 258
    Align = alClient
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 264
    Top = 16
    Width = 140
    Height = 33
    Caption = 'ALERTA !!!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 265
    Top = 17
    Width = 140
    Height = 33
    Caption = 'ALERTA !!!'
    Transparent = True
  end
  object Bevel2: TBevel
    Left = 16
    Top = 56
    Width = 601
    Height = 9
    Shape = bsTopLine
  end
  object Memo1: TMemo
    Left = 20
    Top = 72
    Width = 593
    Height = 129
    Color = clRed
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = Memo1KeyDown
  end
  object botao1: TPanel
    Left = 228
    Top = 218
    Width = 194
    Height = 23
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = 'OK'
    Color = clRed
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = botao1Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 488
    Top = 16
  end
end
