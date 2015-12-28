object frm_edtTamanho: Tfrm_edtTamanho
  Left = 70
  Top = 2
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 510
  ClientWidth = 600
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
    Left = 2
    Top = 1
    Width = 375
    Height = 296
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 17
    Top = 23
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
    Top = 23
    Width = 128
    Height = 13
    Caption = 'Descrição do tamanho'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCodigo: TMaskEdit
    Left = 17
    Top = 39
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
    TabOrder = 0
    Text = '  '
    OnDblClick = edtCodigoDblClick
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
    OnKeyDown = edtCodigoKeyDown
  end
  object edtDesc: TMaskEdit
    Left = 84
    Top = 39
    Width = 273
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 30
    ParentFont = False
    TabOrder = 1
    OnEnter = edtDescEnter
    OnExit = edtDescExit
    OnKeyDown = edtDescKeyDown
  end
  object Panel3: TPanel
    Left = 0
    Top = 403
    Width = 600
    Height = 107
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 2
    object Bevel1: TBevel
      Left = 9
      Top = 10
      Width = 248
      Height = 42
      Shape = bsFrame
    end
    object Bevel8: TBevel
      Left = 310
      Top = 10
      Width = 192
      Height = 43
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 264
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
      Left = 341
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
      Left = 333
      Top = 16
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
      Left = 519
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
      Left = 553
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
      Left = 382
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
      Left = 396
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
    object Label16: TLabel
      Left = 406
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
      Left = 342
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
      Left = 332
      Top = 33
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
      Width = 596
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
        Hint = 'Incluir novo plano'
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
        Hint = 'Excluir plano'
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
        Hint = 'Salvar cadastro do plano'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSalvarClick
      end
      object btnImprimir: TSpeedButton
        Left = 207
        Top = 5
        Width = 91
        Height = 40
        Cursor = crHandPoint
        Hint = 'Imprimir planos '
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object btnCancelainclusao: TSpeedButton
        Left = 57
        Top = 5
        Width = 50
        Height = 40
        Cursor = crHandPoint
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
  object Panel1: TPanel
    Left = 16
    Top = 64
    Width = 344
    Height = 221
    TabOrder = 3
    object Label3: TLabel
      Left = 56
      Top = 42
      Width = 101
      Height = 13
      Caption = 'Faixa de tamanho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnIncluirFaixa: TSpeedButton
      Left = 114
      Top = 59
      Width = 111
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
      OnClick = btnIncluirFaixaClick
    end
    object btnExcluirFaixa: TSpeedButton
      Left = 114
      Top = 82
      Width = 111
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
      OnClick = btnExcluirFaixaClick
    end
    object grade: TDBGrid
      Left = 224
      Top = 4
      Width = 113
      Height = 212
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
          FieldName = 'TF_TAMA'
          Title.Caption = 'Faixas'
          Width = 82
          Visible = True
        end>
    end
    object edtFaixa: TMaskEdit
      Left = 162
      Top = 34
      Width = 61
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      OnEnter = edtFaixaEnter
      OnKeyDown = edtFaixaKeyDown
    end
  end
  object MainMenu1: TMainMenu
    Left = 385
    Top = 2
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Incluirplano1: TMenuItem
        Caption = 'Incluir tamanho'
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
        Caption = 'Excluir tamanho'
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
        Caption = 'Imprimir tamanhos cadastrados'
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
  end
  object qFaixas: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT *'
      'FROM TAMANHOS_FAIXAS'
      'WHERE (TF_CODI=:codigo)')
    Left = 278
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qFaixasTF_CODI: TFloatField
      FieldName = 'TF_CODI'
      Origin = 'ESTOQUE.TAMANHOS_FAIXAS.TF_CODI'
    end
    object qFaixasTF_TAMA: TStringField
      FieldName = 'TF_TAMA'
      Origin = 'ESTOQUE.TAMANHOS_FAIXAS.TF_TAMA'
      Size = 5
    end
  end
  object ds: TDataSource
    DataSet = qFaixas
    Left = 248
    Top = 248
  end
end
