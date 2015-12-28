object frm_ExibeNumeroAtendimento: Tfrm_ExibeNumeroAtendimento
  Left = 153
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Anote os dados do Atendimento suspenso:'
  ClientHeight = 121
  ClientWidth = 482
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 482
    Height = 121
    Align = alClient
    Shape = bsFrame
  end
  object LabelOO1: TLabelOO
    Left = 24
    Top = 11
    Width = 241
    Height = 29
    Caption = 'N'#250'mero do terminal: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO
    Left = 24
    Top = 43
    Width = 295
    Height = 29
    Caption = 'N'#250'mero do Atendimento: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNumTerminal: TLabelOO
    Left = 346
    Top = 12
    Width = 26
    Height = 29
    Caption = '01'
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNumAtendimento: TLabelOO
    Left = 346
    Top = 44
    Width = 91
    Height = 29
    Caption = '0000020'
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BotaoSair1: TBotaoSair
    Left = 210
    Top = 83
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
end
