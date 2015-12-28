object frm_AbreSessao: Tfrm_AbreSessao
  Left = 134
  Top = 62
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Abrir sess'#227'o do caixa'
  ClientHeight = 345
  ClientWidth = 482
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 140
    Width = 158
    Height = 13
    Caption = 'Hora de abertura da sess'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 164
    Width = 105
    Height = 13
    Caption = 'Operador de caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 12
    Top = 207
    Width = 302
    Height = 13
    Caption = 'Valor inicial em dinheiro presente na gaveta do caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 13
    Top = 11
    Width = 25
    Height = 13
    Caption = 'Loja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 13
    Top = 51
    Width = 32
    Height = 13
    Caption = 'Caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 12
    Top = 116
    Width = 158
    Height = 13
    Caption = 'Data de abertura da sess'#227'o'
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
    Width = 482
    Height = 41
    Align = alBottom
    Color = clSilver
    TabOrder = 0
    object botao_sair: TPanel
      Left = 360
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
    object btnAbrirSessao: TButton
      Left = 200
      Top = 10
      Width = 158
      Height = 23
      Cursor = crHandPoint
      Caption = 'Abrir sess'#227'o (F5)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAbrirSessaoClick
    end
    object btnLeituraX: TButton
      Left = 40
      Top = 10
      Width = 158
      Height = 23
      Cursor = crHandPoint
      Caption = 'Leitura X Impressora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnLeituraXClick
    end
  end
  object edtHoraAbertura: TMaskEdit
    Left = 174
    Top = 132
    Width = 91
    Height = 21
    EditMask = '!99\:99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    Text = '  :  '
    OnEnter = edtHoraAberturaEnter
    OnKeyDown = edtHoraAberturaKeyDown
  end
  object edtOperador: TMaskEdit
    Left = 12
    Top = 178
    Width = 57
    Height = 21
    EditMask = '!99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 2
    Text = '  '
    OnEnter = edtOperadorEnter
    OnExit = edtOperadorExit
    OnKeyDown = edtOperadorKeyDown
  end
  object pnOperador: TPanel
    Left = 71
    Top = 178
    Width = 374
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object edtValor: TMaskEdit
    Left = 12
    Top = 220
    Width = 169
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = edtValorEnter
    OnExit = edtValorExit
    OnKeyDown = edtValorKeyDown
    OnKeyUp = edtValorKeyUp
  end
  object edtLoja: TMaskEdit
    Left = 13
    Top = 25
    Width = 57
    Height = 21
    Color = clNavy
    EditMask = '!99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = '  '
  end
  object pnLoja: TPanel
    Left = 72
    Top = 25
    Width = 374
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object edtCaixa: TMaskEdit
    Left = 13
    Top = 65
    Width = 57
    Height = 21
    Color = clNavy
    EditMask = '!99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = '  '
  end
  object pnCaixa: TPanel
    Left = 72
    Top = 65
    Width = 374
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object edtData: TMaskEdit
    Left = 174
    Top = 108
    Width = 91
    Height = 21
    EditMask = '!99/99/9999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 9
    Text = '  /  /    '
    OnEnter = edtDataEnter
    OnExit = edtDataExit
    OnKeyDown = edtDataKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 263
    Width = 482
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 10
    object Bevel8: TBevel
      Left = 263
      Top = 7
      Width = 211
      Height = 28
      Shape = bsFrame
    end
    object lbF8: TLabel
      Left = 15
      Top = 22
      Width = 26
      Height = 13
      Caption = 'F8->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbF8Mens: TLabel
      Left = 41
      Top = 22
      Width = 146
      Height = 13
      Caption = 'exibe grupos cadastrados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label54: TLabel
      Left = 218
      Top = 13
      Width = 41
      Height = 13
      Caption = 'Control'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label56: TLabel
      Left = 279
      Top = 13
      Width = 8
      Height = 13
      Caption = '&L'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label55: TLabel
      Left = 288
      Top = 13
      Width = 31
      Height = 13
      Caption = 'impar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 15
      Top = 7
      Width = 26
      Height = 13
      Caption = 'F5->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 41
      Top = 7
      Width = 69
      Height = 13
      Caption = 'abre sess'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 144
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object EmitirLeituraXdaImpressoraFiscal1: TMenuItem
        Caption = 'Emitir Leitura X da Impressora Fiscal'
        OnClick = EmitirLeituraXdaImpressoraFiscal1Click
      end
      object Abrirsesso1: TMenuItem
        Caption = 'Abrir sess'#227'o'
        ShortCut = 116
        OnClick = Abrirsesso1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
end
