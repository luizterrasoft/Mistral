object frm_ExportarContagem: Tfrm_ExportarContagem
  Left = 209
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Exportar Invent'#225'rio para Escrit'#243'rio'
  ClientHeight = 164
  ClientWidth = 426
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 426
    Height = 164
    Align = alClient
    Shape = bsFrame
  end
  object LabelOO2: TLabelOO
    Left = 342
    Top = 110
    Width = 59
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO1: TLabelOO
    Left = 16
    Top = 16
    Width = 188
    Height = 13
    Caption = 'Nome do arquivo a ser exportado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object botao1: TPanel
    Left = 152
    Top = 128
    Width = 175
    Height = 25
    Cursor = crHandPoint
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Iniciar exporta'#231#227'o'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = botao1Click
  end
  object BotaoSair1: TBotaoSair
    Left = 330
    Top = 128
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
    TabOrder = 1
    OnClick = BotaoSair1Click
  end
  object PanelOO1: TPanelOO
    Left = 16
    Top = 31
    Width = 364
    Height = 29
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object pnArquivo: TPanelOO
      Left = 2
      Top = 2
      Width = 360
      Height = 24
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'C:\NATIVA\VENDAS\INVENTARIO\INVLJCX07012005.TXT'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object chEsvaziar: TCheckBoxOO
    Left = 22
    Top = 66
    Width = 257
    Height = 17
    Cursor = crHandPoint
    Caption = 'Esvaziar lote imediatamente ap'#243's a exporta'#231#227'o'
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 3
    Visible = False
  end
  object chAdiciona: TCheckBoxOO
    Left = 22
    Top = 84
    Width = 235
    Height = 17
    Cursor = crHandPoint
    Caption = 'Adicionar registros caso o arquivo j'#225' exista'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
end
