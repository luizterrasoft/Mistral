object frm_edtSubGrupos: Tfrm_edtSubGrupos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 509
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 791
    Height = 141
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 17
    Top = 16
    Width = 35
    Height = 13
    Caption = 'Grupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 84
    Top = 57
    Width = 58
    Height = 13
    Caption = 'Descrição'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 17
    Top = 57
    Width = 55
    Height = 13
    Caption = 'Subgrupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 326
    Top = 57
    Width = 48
    Height = 13
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 390
    Top = 57
    Width = 114
    Height = 13
    Caption = 'Ref. Interna (inicial)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label17: TLabel
    Left = 544
    Top = 58
    Width = 68
    Height = 13
    Caption = 'Desc mín %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label18: TLabel
    Left = 628
    Top = 58
    Width = 69
    Height = 13
    Caption = 'Desc máx %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label19: TLabel
    Left = 319
    Top = 97
    Width = 123
    Height = 13
    Caption = 'Margem de contrib. %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 0
    Top = 141
    Width = 791
    Height = 56
    Shape = bsFrame
  end
  object Label25: TLabel
    Left = 18
    Top = 97
    Width = 32
    Height = 13
    Caption = 'Linha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label26: TLabel
    Left = 165
    Top = 97
    Width = 47
    Height = 13
    Caption = 'Coleção'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtGrupo: TMaskEdit
    Left = 17
    Top = 30
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    Color = clInfoBk
    EditMask = '!999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 3
    ParentFont = False
    TabOrder = 0
    Text = '   '
    OnDblClick = edtGrupoDblClick
    OnEnter = edtGrupoEnter
    OnExit = edtGrupoExit
    OnKeyDown = edtGrupoKeyDown
  end
  object edtDesc: TMaskEdit
    Left = 84
    Top = 71
    Width = 241
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
    OnKeyDown = edtDescKeyDown
  end
  object Panel3: TPanel
    Left = 0
    Top = 402
    Width = 792
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
      Left = 332
      Top = 15
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
      Left = 703
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
      Left = 737
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
        OnClick = btnImprimirClick
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
        Left = 695
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
  object edtSubGrupo: TMaskEdit
    Left = 17
    Top = 71
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
    TabOrder = 3
    Text = '   '
    OnDblClick = edtSubGrupoDblClick
    OnEnter = edtSubGrupoEnter
    OnExit = edtSubGrupoExit
    OnKeyDown = edtSubGrupoKeyDown
  end
  object pnGrupo: TPanel
    Left = 84
    Top = 29
    Width = 337
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object edtUnidade: TMaskEdit
    Left = 326
    Top = 71
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 5
    OnEnter = edtUnidadeEnter
    OnKeyDown = edtUnidadeKeyDown
  end
  object edtRefInicial: TMaskEdit
    Left = 390
    Top = 71
    Width = 155
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 6
    OnEnter = edtRefInicialEnter
    OnKeyDown = edtRefInicialKeyDown
  end
  object edtMin: TMaskEdit
    Left = 545
    Top = 71
    Width = 79
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 7
    OnEnter = edtMinEnter
    OnExit = edtMinExit
    OnKeyDown = edtMinKeyDown
    OnKeyUp = edtMinKeyUp
  end
  object edtMax: TMaskEdit
    Left = 626
    Top = 71
    Width = 79
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 8
    OnEnter = edtMaxEnter
    OnExit = edtMaxExit
    OnKeyDown = edtMaxKeyDown
    OnKeyUp = edtMaxKeyUp
  end
  object edtMargem: TMaskEdit
    Left = 319
    Top = 111
    Width = 129
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 9
    OnEnter = edtMargemEnter
    OnExit = edtMargemExit
    OnKeyDown = edtMargemKeyDown
    OnKeyUp = edtMargemKeyUp
  end
  object Panel1: TPanel
    Left = 1
    Top = 139
    Width = 792
    Height = 160
    Color = clTeal
    TabOrder = 10
    object Label21: TLabel
      Left = 512
      Top = 42
      Width = 31
      Height = 13
      Caption = 'Faixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnIncluirFaixa: TSpeedButton
      Left = 488
      Top = 59
      Width = 121
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
      Left = 488
      Top = 81
      Width = 121
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
    object Label22: TLabel
      Left = 14
      Top = 18
      Width = 96
      Height = 13
      Caption = 'Tipo de tamanho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grade: TDBGrid
      Left = 608
      Top = 4
      Width = 145
      Height = 151
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
          FieldName = 'SF_TAMA'
          Title.Caption = 'Faixas de tamanho'
          Width = 113
          Visible = True
        end>
    end
    object edtFaixa: TMaskEdit
      Left = 546
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
    object edtTamanho: TMaskEdit
      Left = 16
      Top = 32
      Width = 71
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
      TabOrder = 2
      Text = '  '
      OnDblClick = edtTamanhoDblClick
      OnEnter = edtTamanhoEnter
      OnExit = edtTamanhoExit
      OnKeyDown = edtTamanhoKeyDown
    end
    object pnTamanho: TPanel
      Left = 89
      Top = 32
      Width = 371
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object grupo1: TGroupBox
      Left = 16
      Top = 55
      Width = 209
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      TabOrder = 4
      object chCorUnica: TCheckBox
        Left = 8
        Top = 17
        Width = 137
        Height = 17
        Caption = 'Cor única'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chTamUnico: TCheckBox
        Left = 8
        Top = 33
        Width = 137
        Height = 17
        Caption = 'Tamanho único'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object edtLinha: TMaskEdit
    Left = 16
    Top = 111
    Width = 150
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 15
    ParentFont = False
    TabOrder = 11
    OnEnter = edtLinhaEnter
    OnKeyDown = edtLinhaKeyDown
  end
  object edtColecao: TMaskEdit
    Left = 168
    Top = 111
    Width = 150
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 15
    ParentFont = False
    TabOrder = 12
    OnEnter = edtColecaoEnter
    OnKeyDown = edtColecaoKeyDown
  end
  object Panel2: TPanel
    Left = 0
    Top = 301
    Width = 790
    Height = 93
    Color = clTeal
    TabOrder = 13
    object Label20: TLabel
      Left = 16
      Top = 8
      Width = 261
      Height = 13
      Caption = 'Sugestão para montagem do nome do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 16
      Top = 50
      Width = 283
      Height = 13
      Caption = 'Sugestão da descrição dos itens de cada produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbParte1: TComboBox
      Left = 16
      Top = 24
      Width = 137
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnKeyDown = cbParte1KeyDown
      Items.Strings = (
        'Nada'
        'Grupo'
        'Subgrupo'
        'Fornecedor')
    end
    object cbParte2: TComboBox
      Left = 152
      Top = 24
      Width = 137
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      OnKeyDown = cbParte2KeyDown
      Items.Strings = (
        'Nada'
        'Grupo'
        'Subgrupo'
        'Fornecedor')
    end
    object cbParte3: TComboBox
      Left = 288
      Top = 24
      Width = 137
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      OnKeyDown = cbParte3KeyDown
      Items.Strings = (
        'Nada'
        'Grupo'
        'Subgrupo'
        'Fornecedor')
    end
    object cbParte4: TComboBox
      Left = 424
      Top = 24
      Width = 137
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      OnKeyDown = cbParte4KeyDown
      Items.Strings = (
        'Nada'
        'Grupo'
        'Subgrupo'
        'Fornecedor')
    end
    object cbParte21: TComboBox
      Left = 16
      Top = 64
      Width = 137
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      OnKeyDown = cbParte21KeyDown
      Items.Strings = (
        'Nada'
        'Cor'
        'Tamanho')
    end
    object cbParte22: TComboBox
      Left = 152
      Top = 64
      Width = 137
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 5
      OnKeyDown = cbParte22KeyDown
      Items.Strings = (
        'Nada'
        'Cor'
        'Tamanho')
    end
  end
  object MainMenu1: TMainMenu
    Left = 425
    Top = 22
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Incluirplano1: TMenuItem
        Caption = 'Incluir subgrupo'
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
        Caption = 'Excluir subgrupo'
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
        Caption = 'Imprimir subgrupos cadastrados'
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
  object ds: TDataSource
    DataSet = qFaixas
    Left = 616
    Top = 181
  end
  object qFaixas: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT *'
      'FROM SUBGRUPOS_FAIXAS'
      'WHERE (SF_GRUP=:grupo) AND (SF_SUBG=:subgrupo)')
    Left = 646
    Top = 181
    ParamData = <
      item
        DataType = ftFloat
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subgrupo'
        ParamType = ptUnknown
      end>
    object qFaixasSF_SUBG: TFloatField
      FieldName = 'SF_SUBG'
      Origin = 'ESTOQUE.SUBGRUPOS_FAIXAS.SF_SUBG'
    end
    object qFaixasSF_TAMA: TStringField
      FieldName = 'SF_TAMA'
      Origin = 'ESTOQUE.SUBGRUPOS_FAIXAS.SF_TAMA'
      Size = 5
    end
    object qFaixasSF_GRUP: TFloatField
      FieldName = 'SF_GRUP'
      Origin = 'ESTOQUE.SUBGRUPOS_FAIXAS.SF_GRUP'
    end
  end
end
