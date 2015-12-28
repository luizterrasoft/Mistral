object frm_edtBancos: Tfrm_edtBancos
  Left = 107
  Top = 1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de bancos'
  ClientHeight = 502
  ClientWidth = 602
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 1
    Top = 1
    Width = 577
    Height = 112
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 18
    Top = 20
    Width = 40
    Height = 13
    Caption = 'Código'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 84
    Top = 20
    Width = 90
    Height = 13
    Caption = 'Nome do banco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 17
    Top = 60
    Width = 80
    Height = 13
    Caption = 'Site do banco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 395
    Width = 602
    Height = 107
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 0
    object Bevel1: TBevel
      Left = 9
      Top = 10
      Width = 248
      Height = 42
      Shape = bsFrame
    end
    object Bevel8: TBevel
      Left = 321
      Top = 10
      Width = 192
      Height = 43
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
      Top = 14
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
    object Label4: TLabel
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
    object Label5: TLabel
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
    object Label6: TLabel
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
    object Label7: TLabel
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
    object Label8: TLabel
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
    object Label9: TLabel
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
    object Label10: TLabel
      Left = 527
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
    object Label11: TLabel
      Left = 564
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
    object Label12: TLabel
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
    object Label13: TLabel
      Left = 406
      Top = 15
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
    object Label16: TLabel
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
    object Label23: TLabel
      Left = 353
      Top = 34
      Width = 90
      Height = 13
      Caption = 'ancela inclusão'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 342
      Top = 31
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
    object Panel4: TPanel
      Left = 2
      Top = 56
      Width = 598
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
        Hint = 'Incluir nova forma de pagamento'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnIncluirClick
      end
      object btnExcluir: TSpeedButton
        Left = 107
        Top = 5
        Width = 50
        Height = 40
        Hint = 'Excluir forma de pagamento'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnExcluirClick
      end
      object btnSalvar: TSpeedButton
        Left = 157
        Top = 5
        Width = 50
        Height = 40
        Hint = 'Salvar cadastro da forma de pagamento'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSalvarClick
      end
      object btnImprimir: TSpeedButton
        Left = 207
        Top = 5
        Width = 91
        Height = 40
        Hint = 'Imprimir formas de pagamento'
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
        Hint = 'Cancela inclusão'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCancelainclusaoClick
      end
      object botao_sair: TPanel
        Left = 503
        Top = 13
        Width = 76
        Height = 23
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
  object edtCodigo: TMaskEdit
    Left = 18
    Top = 33
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
    TabOrder = 1
    Text = '   '
    OnDblClick = edtCodigoDblClick
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
    OnKeyDown = edtCodigoKeyDown
  end
  object edtNome: TMaskEdit
    Left = 84
    Top = 33
    Width = 333
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 40
    ParentFont = False
    TabOrder = 2
    OnEnter = edtNomeEnter
    OnKeyDown = edtNomeKeyDown
  end
  object edtSite: TMaskEdit
    Left = 17
    Top = 73
    Width = 536
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 80
    ParentFont = False
    TabOrder = 3
    OnEnter = edtSiteEnter
    OnKeyDown = edtSiteKeyDown
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 122
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Incluirplano1: TMenuItem
        Caption = 'Incluir banco'
        ShortCut = 114
        OnClick = Incluirplano1Click
      end
      object Cancelarincluso1: TMenuItem
        Caption = 'Cancelar inclusão'
        Enabled = False
        ShortCut = 16451
        OnClick = Cancelarincluso1Click
      end
      object Excluirplano1: TMenuItem
        Caption = 'Excluir banco'
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
      object N1: TMenuItem
        Caption = '-'
      end
      object Imprimirplanos1: TMenuItem
        Caption = 'Imprimir bancos cadastrados'
        ShortCut = 16464
        OnClick = Imprimirplanos1Click
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
end
