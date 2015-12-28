object frm_MenuPrincipal_OpcaoListaCrediario: Tfrm_MenuPrincipal_OpcaoListaCrediario
  Left = 446
  Top = 289
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Listagens de Credi'#225'rio'
  ClientHeight = 169
  ClientWidth = 271
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 73
    Top = 9
    Width = 112
    Height = 27
    Caption = 'Listagens'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 75
    Top = 10
    Width = 112
    Height = 27
    Caption = 'Listagens'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 271
    Height = 169
    Align = alClient
    Shape = bsFrame
  end
  object btnFechar: TPanel
    Left = 245
    Top = 5
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
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object botao2: TPanel
    Left = 11
    Top = 42
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  1. Di'#225'rio de Emiss'#227'o de Contratos'
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
  object botao3: TPanel
    Left = 11
    Top = 66
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  2. Di'#225'rio de Presta'#231#245'es a Vencer'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = botao3Click
    OnMouseMove = botao2MouseMove
  end
  object botao4: TPanel
    Left = 11
    Top = 90
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  3. Presta'#231#245'es a Receber p/ Cliente'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = botao4Click
    OnMouseMove = botao2MouseMove
  end
  object botao5: TPanel
    Left = 11
    Top = 114
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  4. Di'#225'rio de Recebimentos'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = botao5Click
    OnMouseMove = botao2MouseMove
  end
  object botao9: TPanel
    Left = 11
    Top = 138
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  5. Listagem de Cheques Devolvidos'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = botao9Click
    OnMouseMove = botao2MouseMove
  end
end
