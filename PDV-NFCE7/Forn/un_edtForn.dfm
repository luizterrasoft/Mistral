object frm_edtForn: Tfrm_edtForn
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 512
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object scroll: TScrollBox
    Left = 0
    Top = 0
    Width = 792
    Height = 405
    VertScrollBar.Position = 455
    Align = alClient
    TabOrder = 1
    object Bevel3: TBevel
      Left = 4
      Top = -450
      Width = 761
      Height = 851
      Shape = bsFrame
    end
    object Bevel4: TBevel
      Left = 16
      Top = 132
      Width = 721
      Height = 52
      Shape = bsFrame
    end
    object Bevel1: TBevel
      Left = 16
      Top = -50
      Width = 721
      Height = 173
      Shape = bsFrame
    end
    object Label3: TLabel
      Left = 25
      Top = -423
      Width = 40
      Height = 13
      Caption = 'C�digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 100
      Top = -423
      Width = 74
      Height = 13
      Caption = 'Raz�o social'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = -381
      Width = 82
      Height = 13
      Caption = 'Nome fantasia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 408
      Top = -381
      Width = 61
      Height = 13
      Caption = 'CPF/CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 560
      Top = -381
      Width = 82
      Height = 13
      Caption = 'Insc. Estadual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 23
      Top = -338
      Width = 55
      Height = 13
      Caption = 'Endere�o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 526
      Top = -338
      Width = 34
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 24
      Top = -297
      Width = 40
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 263
      Top = -297
      Width = 17
      Height = 13
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 312
      Top = -297
      Width = 25
      Height = 13
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 24
      Top = -254
      Width = 69
      Height = 13
      Caption = 'Telefone 01'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 193
      Top = -254
      Width = 69
      Height = 13
      Caption = 'Telefone 02'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 360
      Top = -254
      Width = 69
      Height = 13
      Caption = 'Telefone 03'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 128
      Top = -254
      Width = 54
      Height = 13
      Caption = 'Ramal 01'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 296
      Top = -254
      Width = 54
      Height = 13
      Caption = 'Ramal 02'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 464
      Top = -254
      Width = 54
      Height = 13
      Caption = 'Ramal 03'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 528
      Top = -254
      Width = 24
      Height = 13
      Caption = 'FAX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 632
      Top = -254
      Width = 40
      Height = 13
      Caption = 'Celular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 24
      Top = -212
      Width = 111
      Height = 13
      Caption = 'Endere�o de E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 24
      Top = -172
      Width = 97
      Height = 13
      Caption = 'Endere�o do site'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 24
      Top = -131
      Width = 192
      Height = 13
      Caption = 'Respons�vel pelo Contas a pagar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 408
      Top = -131
      Width = 51
      Height = 13
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 512
      Top = -131
      Width = 40
      Height = 13
      Caption = 'Ramal '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 24
      Top = -91
      Width = 115
      Height = 13
      Caption = 'C�digo de barra raiz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 23
      Top = 142
      Width = 37
      Height = 13
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 405
      Top = 143
      Width = 47
      Height = 13
      Caption = 'Ag�ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 510
      Top = 143
      Width = 85
      Height = 13
      Caption = 'Conta corrente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label47: TLabel
      Left = 23
      Top = 125
      Width = 165
      Height = 13
      Caption = 'Dados para cr�dito em conta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 16
      Top = -48
      Width = 717
      Height = 169
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 36
      object Label46: TLabel
        Left = 12
        Top = 8
        Width = 258
        Height = 13
        Caption = 'Conta a pagar padr�o usada p/ o Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 9
        Top = 45
        Width = 408
        Height = 13
        Caption = 
          'Hist�rico padr�o usado nos lan�amentos de t�tulos/caixa do forne' +
          'cedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 8
        Top = 85
        Width = 178
        Height = 13
        Caption = 'Forma de pagamento prefer�vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 8
        Top = 125
        Width = 176
        Height = 13
        Caption = 'Plano de pagamento prefer�vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object edtCodigo: TMaskEdit
      Left = 25
      Top = -407
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      Text = '      '
      OnDblClick = edtCodigoDblClick
      OnEnter = edtCodigoEnter
      OnExit = edtCodigoExit
      OnKeyDown = edtCodigoKeyDown
    end
    object edtRazao: TMaskEdit
      Left = 100
      Top = -407
      Width = 384
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 40
      ParentFont = False
      TabOrder = 1
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtNomeFan: TMaskEdit
      Left = 24
      Top = -365
      Width = 384
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtCpf: TMaskEdit
      Left = 409
      Top = -365
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99999999999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentFont = False
      TabOrder = 3
      Text = '              '
      OnEnter = edtRazaoEnter
      OnExit = edtCpfExit
      OnKeyDown = edtRazaoKeyDown
    end
    object edtInsc: TMaskEdit
      Left = 562
      Top = -365
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 20
      ParentFont = False
      TabOrder = 4
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtEnde: TMaskEdit
      Left = 24
      Top = -322
      Width = 498
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 50
      ParentFont = False
      TabOrder = 5
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtBairro: TMaskEdit
      Left = 523
      Top = -322
      Width = 229
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      TabOrder = 6
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtCida: TMaskEdit
      Left = 25
      Top = -282
      Width = 240
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      TabOrder = 7
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object cbEsta: TComboBox
      Left = 265
      Top = -282
      Width = 49
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      MaxLength = 2
      ParentFont = False
      TabOrder = 8
      OnEnter = cbEstaEnter
      OnExit = cbEstaExit
      OnKeyDown = cbEstaKeyDown
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'BA'
        'CE'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RO'
        'RJ'
        'RN'
        'RR'
        'RS'
        'SE'
        'SC'
        'SP'
        'TO')
    end
    object edtCep: TMaskEdit
      Left = 313
      Top = -282
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99999\-999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 9
      ParentFont = False
      TabOrder = 9
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtFone1: TMaskEdit
      Left = 25
      Top = -240
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!ccccccccccccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 10
      Text = '               '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtFone2: TMaskEdit
      Left = 194
      Top = -240
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!ccccccccccccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 12
      Text = '               '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtFone3: TMaskEdit
      Left = 361
      Top = -240
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!ccccccccccccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 14
      Text = '               '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtRamal1: TMaskEdit
      Left = 129
      Top = -240
      Width = 56
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!cccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 11
      Text = '      '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtRamal2: TMaskEdit
      Left = 297
      Top = -240
      Width = 56
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!cccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 13
      Text = '      '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtRamal3: TMaskEdit
      Left = 465
      Top = -240
      Width = 56
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!cccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 15
      Text = '      '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtFax: TMaskEdit
      Left = 529
      Top = -240
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!ccccccccccccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 16
      Text = '               '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtCelular: TMaskEdit
      Left = 633
      Top = -240
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!ccccccccccccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 17
      Text = '               '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtEmail: TMaskEdit
      Left = 25
      Top = -197
      Width = 520
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 80
      ParentFont = False
      TabOrder = 18
      OnChange = edtEmailChange
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtSite: TMaskEdit
      Left = 25
      Top = -157
      Width = 520
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 80
      ParentFont = False
      TabOrder = 19
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtRespo: TMaskEdit
      Left = 24
      Top = -117
      Width = 384
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 40
      ParentFont = False
      TabOrder = 20
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtTelRespo: TMaskEdit
      Left = 409
      Top = -117
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!ccccccccccccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 21
      Text = '               '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtRamalRespo: TMaskEdit
      Left = 513
      Top = -117
      Width = 56
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!cccccc;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 22
      Text = '      '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtCodigoBarra: TMaskEdit
      Left = 25
      Top = -77
      Width = 176
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!9999999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 23
      Text = '          '
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtBanco: TMaskEdit
      Left = 24
      Top = 156
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 28
      Text = '   '
      OnDblClick = edtBancoDblClick
      OnEnter = edtRazaoEnter
      OnExit = edtBancoExit
      OnKeyDown = edtRazaoKeyDown
    end
    object edtAgenc: TMaskEdit
      Left = 406
      Top = 157
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 29
      OnEnter = edtRazaoEnter
      OnKeyDown = edtRazaoKeyDown
    end
    object edtConta: TMaskEdit
      Left = 511
      Top = 157
      Width = 184
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 20
      ParentFont = False
      TabOrder = 30
      OnEnter = edtRazaoEnter
      OnKeyDown = edtContaKeyDown
    end
    object edtForma: TMaskEdit
      Left = 24
      Top = 50
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 26
      Text = '   '
      OnDblClick = edtFormaDblClick
      OnEnter = edtFormaEnter
      OnExit = edtFormaExit
      OnKeyDown = edtFormaKeyDown
    end
    object pnForma: TPanel
      Left = 90
      Top = 50
      Width = 431
      Height = 22
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 31
    end
    object pnEmail: TPanel
      Left = 548
      Top = -197
      Width = 101
      Height = 22
      BevelInner = bvSpace
      TabOrder = 32
      object MailTo1: TMailTo
        Left = 8
        Top = 5
        Width = 48
        Height = 14
        Cursor = crHandPoint
        ColorEnter = clBlue
        ColorLeave = clBlack
        FocusUnderline = True
        Caption = 'E-mail >>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Image1: TImage
        Left = 62
        Top = 4
        Width = 30
        Height = 15
        Picture.Data = {
          07544269746D6170F6050000424DF60500000000000036000000280000001E00
          0000100000000100180000000000C0050000C30E0000C30E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFCFCFCFFFFFFFFFFFFFEFEFE
          FFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFFFFFFFFFFFFFFFFFF00000303
          0300000003030300000003030300000003030301010102020200000002020200
          0000000000000000020202010101000000000000000000000000000000000000
          0000000000000202020000000000000202020000000101010000FFFFFFFFFFFF
          FDFDFDFFFFFFFDFDFDFFFFFFFFFFFFFEFEFEFCFCFCFFFFFFFDFDFDFFFFFFFBFB
          FBFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFCFCFFFFFFFFFFFFFDFDFDFFFFFF0000000000FCFCFCFEFEFEFEFEFEFF
          FFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFDFDFD
          FFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFCFCFCFFFFFFFFFFFFFFFFFF0000000000FFFFFFFFFFFFFFFFFFFEFEFEFFFF
          FFFFFFFFFAFAFAFFFFFFFEFEFEFEFEFEFFFFFFFDFDFDFDFDFDFFFFFFFCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
          FFFFFFFEFEFEFFFFFF0000000000FEFEFEFFFFFF000000000000000000000000
          040404FDFDFDFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF
          FFFFFDFDFD0101010000FEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF
          FFFFFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFCFCFCFFFFFFFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFFFF
          FF0000000000FFFFFFFDFDFDFFFFFFFBFBFBFFFFFFFFFFFFFEFEFEFEFEFEFFFF
          FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFCFCFC010101
          0000FEFEFEFEFEFEFFFFFFFFFFFFFBFBFBFEFEFEFEFEFEFFFFFFFEFEFEFFFFFF
          FFFFFFFEFEFE000000000000FEFEFEFFFFFF010101000000FFFFFFFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFCFCFCFFFFFF0000000000FFFF
          FFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFEFEFE00000003
          0303FFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF000000000000FFFFFFFFFFFF
          FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD0000000000FEFEFEFCFCFC
          FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFF000000020202FDFDFDFDFDFDFFFF
          FFFCFCFCFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFF000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFFFF0101010000FEFEFEFFFFFFFDFDFDFE
          FEFEFFFFFFFFFFFF030303000000FFFFFFFDFDFDFFFFFFFCFCFCFFFFFFFDFDFD
          FEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB020202000000FDFD
          FDFCFCFCFFFFFFFEFEFEFFFFFF0000000000FFFFFFFFFFFFFFFFFFFEFEFE0000
          00010101FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFFFFFFFE
          FEFEFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFDFDFDFFFFFF010101010101
          FDFDFDFFFFFFFCFCFC0404040000FFFFFFFFFFFF000000010101FFFFFFFCFCFC
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFCFCFCFEFEFEFEFEFEFFFFFFFCFCFCFFFFFF04040400
          0000FFFFFF0000000000FCFCFC040404FFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFC
          FCFCFFFFFFFEFEFEFFFFFFFFFFFFFAFAFAFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFCFCFCFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF0202
          020000000000FFFFFFFFFFFFFCFCFCFFFFFFFDFDFDFFFFFFFCFCFCFFFFFFFFFF
          FFFFFFFFFFFFFFFCFCFCFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFCFCFCFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFEFEFE010101
          0000}
        Stretch = True
      end
    end
    object edtHist: TMaskEdit
      Left = 24
      Top = 10
      Width = 497
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 50
      ParentFont = False
      TabOrder = 25
      OnEnter = edtHistEnter
      OnKeyDown = edtHistKeyDown
    end
    object edtCont: TMaskEdit
      Left = 25
      Top = -28
      Width = 96
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!9999999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 24
      Text = '          '
      OnDblClick = edtContDblClick
      OnEnter = edtContEnter
      OnExit = edtContExit
      OnKeyDown = edtContKeyDown
    end
    object pnConta: TPanel
      Left = 123
      Top = -28
      Width = 398
      Height = 22
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 33
    end
    object edtPlanoPgto: TMaskEdit
      Left = 24
      Top = 90
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 27
      Text = '  '
      OnDblClick = edtPlanoPgtoDblClick
      OnEnter = edtPlanoPgtoEnter
      OnExit = edtPlanoPgtoExit
      OnKeyDown = edtPlanoPgtoKeyDown
    end
    object pnPlanoPgto: TPanel
      Left = 90
      Top = 90
      Width = 431
      Height = 22
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 34
    end
    object pnBanco: TPanel
      Left = 82
      Top = 156
      Width = 323
      Height = 22
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 35
    end
    object Panel2: TPanel
      Left = 16
      Top = 192
      Width = 545
      Height = 193
      Color = clNavy
      TabOrder = 37
      object Label10: TLabel
        Left = 152
        Top = 12
        Width = 94
        Height = 13
        Caption = 'Representantes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label49: TLabel
        Left = 48
        Top = 76
        Width = 40
        Height = 13
        Caption = 'C�digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnIncluirRep: TSpeedButton
        Left = 15
        Top = 92
        Width = 137
        Height = 22
        Cursor = crHandPoint
        Caption = 'Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnIncluirRepClick
      end
      object btnExcluirRep: TSpeedButton
        Left = 15
        Top = 116
        Width = 137
        Height = 22
        Cursor = crHandPoint
        Caption = 'Excluir '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnExcluirRepClick
      end
      object grade: TDBGrid
        Left = 152
        Top = 26
        Width = 383
        Height = 151
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnKeyDown = gradeKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'RE_CODI'
            Title.Caption = 'C�digo'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_rep'
            Title.Caption = 'Representante'
            Width = 295
            Visible = True
          end>
      end
      object edtRepresentante: TMaskEdit
        Left = 90
        Top = 68
        Width = 61
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        TabOrder = 1
        Text = '      '
        OnDblClick = edtRepresentanteDblClick
        OnEnter = edtRepresentanteEnter
        OnKeyDown = edtRepresentanteKeyDown
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 405
    Width = 792
    Height = 107
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 0
    object Bevel2: TBevel
      Left = 9
      Top = 10
      Width = 248
      Height = 42
      Shape = bsFrame
    end
    object Bevel8: TBevel
      Left = 321
      Top = 10
      Width = 392
      Height = 41
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 275
      Top = 17
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
    object Label55: TLabel
      Left = 352
      Top = 17
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
    object Label56: TLabel
      Left = 343
      Top = 17
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
    object Label29: TLabel
      Left = 23
      Top = 17
      Width = 26
      Height = 13
      Caption = 'F3->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 47
      Top = 17
      Width = 36
      Height = 13
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 121
      Top = 17
      Width = 39
      Height = 13
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 95
      Top = 17
      Width = 26
      Height = 13
      Caption = 'F4->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 201
      Top = 17
      Width = 37
      Height = 13
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 175
      Top = 17
      Width = 26
      Height = 13
      Caption = 'F5->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 719
      Top = 17
      Width = 36
      Height = 13
      Caption = 'ESC->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 754
      Top = 17
      Width = 23
      Height = 13
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label37: TLabel
      Left = 393
      Top = 17
      Width = 14
      Height = 13
      Caption = 'Im'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 407
      Top = 17
      Width = 9
      Height = 13
      Caption = '&P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 417
      Top = 17
      Width = 24
      Height = 13
      Caption = 'rimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label40: TLabel
      Left = 457
      Top = 17
      Width = 90
      Height = 13
      Caption = 'ancela inclus�o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label41: TLabel
      Left = 448
      Top = 17
      Width = 9
      Height = 13
      Caption = '&C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbF8: TLabel
      Left = 23
      Top = 33
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
      Left = 49
      Top = 33
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
    object Label42: TLabel
      Left = 343
      Top = 33
      Width = 10
      Height = 13
      Caption = '&O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label43: TLabel
      Left = 354
      Top = 33
      Width = 85
      Height = 13
      Caption = 'utros relat�rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 2
      Top = 56
      Width = 788
      Height = 49
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object btnIncluir: TSpeedButton
        Left = 7
        Top = 5
        Width = 50
        Height = 40
        Cursor = crHandPoint
        Hint = 'Incluir novo contrato'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnIncluirClick
      end
      object btnExcluir: TSpeedButton
        Left = 107
        Top = 5
        Width = 50
        Height = 40
        Cursor = crHandPoint
        Hint = 'Excluir contrato'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnExcluirClick
      end
      object btnSalvar: TSpeedButton
        Left = 157
        Top = 5
        Width = 50
        Height = 40
        Cursor = crHandPoint
        Hint = 'Salvar cadastro do contrato'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSalvarClick
      end
      object btnImprimir: TSpeedButton
        Left = 207
        Top = 5
        Width = 84
        Height = 40
        Cursor = crHandPoint
        Hint = 'Imprimir todos os contratos'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnImprimirClick
      end
      object btnCancelainclusao: TSpeedButton
        Left = 57
        Top = 5
        Width = 50
        Height = 40
        Cursor = crHandPoint
        Hint = 'Cancela inclus�o'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCancelainclusaoClick
      end
      object botao_sair: TPanel
        Left = 687
        Top = 13
        Width = 76
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
  end
  object MainMenu1: TMainMenu
    Left = 715
    Top = 42
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Incluirplano1: TMenuItem
        Caption = 'Incluir fornecedor'
        ShortCut = 114
        OnClick = Incluirplano1Click
      end
      object Cancelarincluso1: TMenuItem
        Caption = 'Cancelar inclus�o'
        Enabled = False
        ShortCut = 16451
        OnClick = Cancelarincluso1Click
      end
      object Excluirplano1: TMenuItem
        Caption = 'Excluir fornecedor'
        Enabled = False
        ShortCut = 115
        OnClick = Excluirplano1Click
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        Enabled = False
        ShortCut = 116
        OnClick = Salvar1Click
      end
      object Limparcadastro1: TMenuItem
        Caption = 'Limpar cadastro'
        ShortCut = 16460
        OnClick = Limparcadastro1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Imprimircontratoindividual1: TMenuItem
        Caption = 'Imprimir fornecedor individual'
      end
      object Imprimirplanos1: TMenuItem
        Caption = 'Imprimir fornecedores cadastrados'
        ShortCut = 16464
        OnClick = Imprimirplanos1Click
      end
      object Outros1: TMenuItem
        Caption = 'Outros'
        ShortCut = 16463
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
    object Auxiliares1: TMenuItem
      Caption = 'Auxiliares'
      Visible = False
      object Salvar2: TMenuItem
        Caption = 'Salvar'
        ShortCut = 16450
      end
    end
  end
  object qRep: TQuery
    OnCalcFields = qRepCalcFields
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'SELECT *'
      'FROM FORN_REP'
      'WHERE (FO_CODI=:fornecedor)')
    Left = 184
    Top = 270
    ParamData = <
      item
        DataType = ftFloat
        Name = 'fornecedor'
        ParamType = ptUnknown
      end>
    object qRepFO_CODI: TFloatField
      FieldName = 'FO_CODI'
      Origin = 'CONTASPAGAR.FORN_REP.FO_CODI'
    end
    object qRepRE_CODI: TFloatField
      FieldName = 'RE_CODI'
      Origin = 'CONTASPAGAR.FORN_REP.RE_CODI'
    end
    object qRepnome_rep: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_rep'
      Calculated = True
    end
  end
  object ds: TDataSource
    DataSet = qRep
    Left = 214
    Top = 270
  end
  object qExclueRep: TQuery
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'DELETE FROM FORN_REP'
      'WHERE (FO_CODI=:fo_codi) AND (RE_CODI=:re_codi)'
      ' ')
    Left = 244
    Top = 270
    ParamData = <
      item
        DataType = ftFloat
        Name = 'fo_codi'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 're_codi'
        ParamType = ptUnknown
      end>
  end
  object qInsereRep: TQuery
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'INSERT INTO FORN_REP (FO_CODI,RE_CODI,FP_TIME)'
      'VALUES (:fo_codi, :re_codi,:fp_time)')
    Left = 275
    Top = 270
    ParamData = <
      item
        DataType = ftFloat
        Name = 'fo_codi'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 're_codi'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'fp_time'
        ParamType = ptUnknown
      end>
  end
end
