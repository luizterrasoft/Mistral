object frm_VisaoPrecosPraticados: Tfrm_VisaoPrecosPraticados
  Left = 128
  Top = 14
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vis'#227'o Geral de pre'#231'os praticados'
  ClientHeight = 503
  ClientWidth = 529
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 529
    Height = 503
    Align = alClient
    Shape = bsFrame
  end
  object LabelOO1: TLabelOO
    Left = 17
    Top = 19
    Width = 210
    Height = 16
    Caption = 'Descri'#231#227'o do item de produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescricao1: TLabelOO
    Left = 23
    Top = 37
    Width = 327
    Height = 16
    Caption = 'SAPATO NIKE AIR JORDAN VERAO PRETO 42'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO3: TLabelOO
    Left = 185
    Top = 217
    Width = 168
    Height = 16
    Caption = 'Hist'#243'rico de Promo'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO4: TLabelOO
    Left = 17
    Top = 101
    Width = 162
    Height = 16
    Caption = 'Pre'#231'o principal (atual): '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO5: TLabelOO
    Left = 17
    Top = 150
    Width = 237
    Height = 16
    Caption = 'Pre'#231'o diferenciado para esta loja:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO6: TLabelOO
    Left = 17
    Top = 174
    Width = 180
    Height = 16
    Caption = 'Pre'#231'o promocional (hoje):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrecoPrincipal: TLabelOO
    Left = 265
    Top = 98
    Width = 40
    Height = 19
    Caption = '10,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrecoDiferenciado: TLabelOO
    Left = 265
    Top = 147
    Width = 40
    Height = 19
    Caption = '12,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrecoPromocional: TLabelOO
    Left = 262
    Top = 173
    Width = 49
    Height = 22
    Caption = '10,00'
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 15
    Top = 83
    Width = 505
    Height = 9
  end
  object Bevel3: TBevel
    Left = 15
    Top = 208
    Width = 505
    Height = 9
  end
  object LabelOO2: TLabelOO
    Left = 348
    Top = 471
    Width = 76
    Height = 16
    Caption = 'ESC-> Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescricao2: TLabelOO
    Left = 23
    Top = 53
    Width = 327
    Height = 16
    Caption = 'SAPATO NIKE AIR JORDAN VERAO PRETO 42'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO7: TLabelOO
    Left = 17
    Top = 124
    Width = 171
    Height = 16
    Caption = 'Pre'#231'o principal anterior: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrecoPrincipalant: TLabelOO
    Left = 265
    Top = 121
    Width = 40
    Height = 19
    Caption = '10,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BotaoSair1: TBotaoSair
    Left = 432
    Top = 466
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fecha o formul'#225'rio'
    Caption = 'SAIR'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = BotaoSair1Click
  end
  object Memo1: TGridSql
    Left = 16
    Top = 241
    Width = 497
    Height = 217
    Color = clInfoBk
    ColCount = 3
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine]
    ParentFont = False
    TabOrder = 1
    OnGetCellColor = Memo1GetCellColor
    PosicionaLinha = 0
    PosicionarLinha = False
    MovMouseLinha = False
    AndaProLado = False
    ColunaMarcada = 0
    F3Editor = False
    ColWidths = (
      482
      64
      64)
  end
end
