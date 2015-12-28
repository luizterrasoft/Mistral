object frm_ConfigFuncionamentoDoSistema: Tfrm_ConfigFuncionamentoDoSistema
  Left = 217
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 188
  ClientWidth = 350
  Color = clTeal
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
  object Label3: TLabel
    Left = 17
    Top = 17
    Width = 230
    Height = 16
    Caption = 'Modo de funcionamento do sistema:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 350
    Height = 147
    Align = alClient
    Shape = bsFrame
  end
  object Panel5: TPanel
    Left = 0
    Top = 147
    Width = 350
    Height = 41
    Align = alBottom
    Color = clTeal
    TabOrder = 0
    object botao_sair: TPanel
      Left = 198
      Top = 10
      Width = 108
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
      TabOrder = 0
      OnClick = botao_sairClick
    end
    object botao1: TPanel
      Left = 51
      Top = 10
      Width = 145
      Height = 23
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Salvar [F5]'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = botao1Click
    end
  end
  object rdTipoFunc: TRadioGroup
    Left = 16
    Top = 35
    Width = 321
    Height = 81
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'ILHA DE ATENDIMENTO'
      'CAIXA')
    ParentFont = False
    TabOrder = 1
  end
end
