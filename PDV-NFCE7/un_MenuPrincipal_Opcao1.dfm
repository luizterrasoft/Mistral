object frm_MenuPrincipal_Opcao1: Tfrm_MenuPrincipal_Opcao1
  Left = 455
  Top = 239
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 293
  ClientWidth = 303
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 56
    Top = 9
    Width = 146
    Height = 27
    Caption = 'Atendimentos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 58
    Top = 10
    Width = 146
    Height = 27
    Caption = 'Atendimentos'
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
    Width = 303
    Height = 293
    Align = alClient
    Shape = bsFrame
  end
  object botao1: TPanel
    Tag = 1
    Left = 11
    Top = 41
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  1. Lan'#231'amento / Nota Fiscal (NF-e)'
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
  object botao4: TPanel
    Left = 11
    Top = 113
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  4. Emiss'#227'o Avulsa de Vales'
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
  object botao5: TPanel
    Left = 11
    Top = 137
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  5. Consulta de Vendas'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = botao5Click
    OnMouseMove = botao5MouseMove
  end
  object btnFechar: TPanel
    Left = 271
    Top = 6
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
  object botao7: TPanel
    Left = 11
    Top = 233
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  9. Outras Fun'#231#245'es'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = botao7Click
    OnMouseMove = botao7MouseMove
  end
  object botao3: TPanel
    Left = 11
    Top = 89
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  3. Vale Mercadoria Funcion'#225'rio'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = botao3Click
    OnMouseMove = botao3MouseMove
  end
  object botao2: TPanel
    Tag = 2
    Left = 11
    Top = 65
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  2. Lan'#231'amento p/ Cupom Fiscal (NFC-e)'
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
  object botao6: TPanel
    Left = 11
    Top = 209
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  8. Listagens'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = botao6Click
    OnMouseMove = botao6MouseMove
  end
  object Botao8: TPanel
    Left = 11
    Top = 161
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  6. Consulta de Produtos'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Botao8Click
    OnMouseMove = Botao8MouseMove
  end
  object Botao9: TPanel
    Left = 11
    Top = 185
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  7. Consulta de Produtos nas Lojas'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Botao9Click
    OnMouseMove = botao6MouseMove
  end
  object botao10: TPanel
    Left = 11
    Top = 257
    Width = 279
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' 10. Lan'#231'amento p/ SLIP de Atdo.'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = botao10Click
    OnMouseMove = botao2MouseMove
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    Left = 16
    Top = 8
  end
end
