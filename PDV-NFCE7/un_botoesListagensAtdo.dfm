object frm_botoesListagensAtdo: Tfrm_botoesListagensAtdo
  Left = 215
  Top = 265
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 253
  ClientWidth = 285
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 285
    Height = 253
    Align = alClient
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 85
    Top = 10
    Width = 103
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
    Left = 87
    Top = 11
    Width = 103
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
  object botao2: TPanel
    Left = 10
    Top = 65
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  2. Sum'#225'rio das Vendas'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = botao2Click
    OnMouseMove = botao2MouseMove
  end
  object botao3: TPanel
    Left = 10
    Top = 89
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  3. S'#237'ntese das Vendas'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = botao3Click
    OnMouseMove = botao3MouseMove
  end
  object botao4: TPanel
    Left = 10
    Top = 113
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  4. Resumo das Vendas'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = botao4Click
    OnMouseMove = botao4MouseMove
  end
  object botao6: TPanel
    Left = 10
    Top = 161
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  6. Produtos mais Vendidos na Loja'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = botao6Click
    OnMouseMove = botao6MouseMove
  end
  object btnFechar: TPanel
    Left = 255
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
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object botao5: TPanel
    Left = 10
    Top = 137
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  5. Resumo das Vendas por Vendedor'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = botao5Click
    OnMouseMove = botao5MouseMove
  end
  object botao1: TPanel
    Left = 10
    Top = 41
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  1. Atendimentos da Loja'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = botao1Click
    OnMouseMove = botao1MouseMove
  end
  object botao7: TPanel
    Left = 10
    Top = 209
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  8. Relat'#243'rio de  Promo'#231#245'es a Vencer'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = botao7Click
    OnMouseMove = botao7MouseMove
  end
  object Botao8: TPanel
    Left = 9
    Top = 185
    Width = 266
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  7. Consulta de Promo'#231#245'es a Vencer'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Botao8Click
    OnMouseMove = botao7MouseMove
  end
end
