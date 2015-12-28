object frm_BotoesOpcoes_Atdo_Suspensao: Tfrm_BotoesOpcoes_Atdo_Suspensao
  Left = 454
  Top = 324
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 85
  ClientWidth = 224
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 224
    Height = 85
    Align = alClient
    Shape = bsFrame
  end
  object botao1: TPanel
    Left = 10
    Top = 29
    Width = 204
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  1. Suspender'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = botao1Click
    OnMouseMove = botao1MouseMove
  end
  object botao2: TPanel
    Left = 10
    Top = 53
    Width = 204
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  2. Reabertura'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = botao2Click
    OnMouseMove = botao2MouseMove
  end
  object btnFechar: TPanel
    Left = 189
    Top = 8
    Width = 22
    Height = 16
    Cursor = crHandPoint
    Caption = 'X'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnFecharClick
  end
end
