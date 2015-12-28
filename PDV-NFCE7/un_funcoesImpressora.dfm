object frm_funcoesImpressora: Tfrm_funcoesImpressora
  Left = 204
  Top = 101
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Funções da Impressora Fiscal'
  ClientHeight = 345
  ClientWidth = 395
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 42
    Height = 13
    Caption = 'Modelo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 59
    Height = 13
    Caption = 'Comandos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel5: TPanel
    Left = 0
    Top = 304
    Width = 395
    Height = 41
    Align = alBottom
    Color = clSilver
    TabOrder = 0
    object botao_sair: TPanel
      Left = 144
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
  end
  object btnLeituraX: TPanel
    Left = 24
    Top = 142
    Width = 345
    Height = 25
    Cursor = crHandPoint
    Caption = 'Leitura X inicial'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnReducaoZ: TPanel
    Left = 24
    Top = 238
    Width = 345
    Height = 25
    Cursor = crHandPoint
    Caption = 'Redução Z final'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object btnInformaAliq: TPanel
    Left = 24
    Top = 110
    Width = 345
    Height = 25
    Cursor = crHandPoint
    Caption = 'Informa alíquotas ICMS'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object btnProxCupom: TPanel
    Left = 24
    Top = 174
    Width = 345
    Height = 25
    Cursor = crHandPoint
    Caption = 'Próximo N. Cupom Fiscal'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object btnCancelarCupom: TPanel
    Left = 24
    Top = 206
    Width = 345
    Height = 25
    Cursor = crHandPoint
    Caption = 'Cancelar último cupom'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object pnModelo: TPanel
    Left = 16
    Top = 24
    Width = 361
    Height = 25
    Alignment = taLeftJustify
    Caption = ' Modelo BEMATECH'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object btnDefinirModelo: TPanel
    Left = 24
    Top = 79
    Width = 345
    Height = 25
    Cursor = crHandPoint
    Caption = 'Definir modelo'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
end
