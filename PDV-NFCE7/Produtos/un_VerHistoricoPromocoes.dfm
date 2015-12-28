object frm_VerHistoricoPromocoes: Tfrm_VerHistoricoPromocoes
  Left = 117
  Top = 36
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Vis'#227'o Geral de pre'#231'os praticados'
  ClientHeight = 460
  ClientWidth = 529
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 529
    Height = 460
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
  object lblDescricao: TLabelOO
    Left = 33
    Top = 37
    Width = 472
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
    Top = 171
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
    Top = 80
    Width = 110
    Height = 16
    Caption = 'Pre'#231'o principal '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO5: TLabelOO
    Left = 17
    Top = 104
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
    Top = 128
    Width = 176
    Height = 16
    Caption = 'Pre'#231'o promocional (hoje)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrecoPrincipal: TLabelOO
    Left = 137
    Top = 77
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
    Top = 101
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
    Left = 210
    Top = 127
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
  object Bevel2: TBevel
    Left = 15
    Top = 62
    Width = 505
    Height = 9
  end
  object Bevel3: TBevel
    Left = 15
    Top = 158
    Width = 505
    Height = 9
  end
  object LabelOO2: TLabelOO
    Left = 348
    Top = 425
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
  object BotaoSair1: TBotaoSair
    Left = 432
    Top = 420
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
  end
  object Memo1: TMemo
    Left = 16
    Top = 192
    Width = 497
    Height = 214
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Lines.Strings = (
      ''
      ' 8,00 - Dura'#231#227'o: 01/01/2005 a 31/01/3005'
      ' 9,00 - Dura'#231#227'o: 01/02/2005 a 31/10/3005')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
