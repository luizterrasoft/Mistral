object frm_FechamentoVenda_AjudaComandos: Tfrm_FechamentoVenda_AjudaComandos
  Left = 457
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 261
  ClientWidth = 263
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
    Width = 263
    Height = 261
    Align = alClient
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 8
    Top = 214
    Width = 246
    Height = 9
    Shape = bsTopLine
  end
  object Bevel3: TBevel
    Left = 11
    Top = 29
    Width = 246
    Height = 9
    Shape = bsTopLine
  end
  object pnData: TPanel
    Left = 11
    Top = 38
    Width = 239
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  [F1] - Ajuda '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 9
    Top = 142
    Width = 236
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  [F5] - Concluir venda'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object botao_sair: TPanel
    Left = 93
    Top = 227
    Width = 89
    Height = 23
    Cursor = crHandPoint
    BevelInner = bvRaised
    Caption = 'SAIR'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = botao_sairClick
  end
  object btnFechar: TPanel
    Left = 235
    Top = 9
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
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object Panel2: TPanel
    Left = 9
    Top = 64
    Width = 236
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  [ESC] - Sair do fechamento'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Panel8: TPanel
    Left = 9
    Top = 88
    Width = 239
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  [CTRL + D] - Desconto na venda'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Panel3: TPanel
    Left = 9
    Top = 114
    Width = 236
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  [F8] - Buscar códigos'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object Panel9: TPanel
    Left = 9
    Top = 168
    Width = 239
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  [CTRL + L] - Limpar formulário'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
end
