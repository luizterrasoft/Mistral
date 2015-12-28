object frm_BotoesECF_Aliquotas: Tfrm_BotoesECF_Aliquotas
  Left = 228
  Top = 227
  ActiveControl = edtValor
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Progamar Al'#237'quotas'
  ClientHeight = 151
  ClientWidth = 309
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 309
    Height = 151
    Align = alClient
    Shape = bsFrame
  end
  object LabelOO1: TLabelOO
    Left = 101
    Top = 12
    Width = 103
    Height = 13
    Caption = 'Valor Al'#237'quota (%)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValor: TMaskEditOO
    Left = 125
    Top = 30
    Width = 47
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = edtValorEnter
    OnExit = edtValorExit
    OnKeyDown = edtValorKeyDown
    OnKeyUp = edtValorKeyUp
    zFieldTypeOO = ftFloat
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object btnSalvar: TPanel
    Left = 68
    Top = 110
    Width = 140
    Height = 25
    Cursor = crHandPoint
    Caption = 'Salvar Al'#237'quota'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object BotaoSair1: TBotaoSair
    Left = 212
    Top = 110
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
    TabOrder = 2
    OnClick = BotaoSair1Click
  end
  object rdVinculo: TRadioGroup
    Left = 17
    Top = 49
    Width = 275
    Height = 49
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Alterar al'#237'quota de ICMS'
      'Alterar al'#237'quota de ISS')
    ParentFont = False
    TabOrder = 3
  end
end
