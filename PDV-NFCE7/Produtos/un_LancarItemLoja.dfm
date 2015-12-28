object frm_LancarItemLoja: Tfrm_LancarItemLoja
  Left = 83
  Top = 6
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lançar Item de Estoque de Loja'
  ClientHeight = 500
  ClientWidth = 576
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
  object Bevel3: TBevel
    Left = 0
    Top = 178
    Width = 576
    Height = 103
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 0
    Top = 44
    Width = 576
    Height = 133
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 0
    Top = 282
    Width = 576
    Height = 103
    Shape = bsFrame
  end
  object Label34: TLabel
    Left = 15
    Top = 114
    Width = 20
    Height = 13
    Caption = 'Cor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label35: TLabel
    Left = 15
    Top = 156
    Width = 53
    Height = 13
    Caption = 'Tamanho'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 14
    Top = 292
    Width = 115
    Height = 13
    Caption = 'Saldo do item (qtde)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 289
    Top = 291
    Width = 102
    Height = 13
    Caption = 'Preço de venda $'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 136
    Top = 291
    Width = 110
    Height = 13
    Caption = 'P.médio de custo $'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 16
    Top = 191
    Width = 103
    Height = 13
    Caption = 'Descrição do item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 14
    Top = 229
    Width = 89
    Height = 13
    Caption = 'Ref. Fabricante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label17: TLabel
    Left = 134
    Top = 228
    Width = 91
    Height = 13
    Caption = 'Código de barra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label18: TLabel
    Left = 427
    Top = 75
    Width = 48
    Height = 13
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 393
    Width = 576
    Height = 107
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 7
    object Bevel8: TBevel
      Left = 360
      Top = 9
      Width = 113
      Height = 40
      Shape = bsFrame
    end
    object Label12: TLabel
      Left = 157
      Top = 14
      Width = 164
      Height = 13
      Caption = 'muda localizacao do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 131
      Top = 14
      Width = 26
      Height = 13
      Caption = 'F7->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 524
      Top = 14
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
    object Label15: TLabel
      Left = 487
      Top = 14
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
    object Label19: TLabel
      Left = 16
      Top = 14
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
    object Label20: TLabel
      Left = 42
      Top = 14
      Width = 62
      Height = 13
      Caption = 'salvar item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbF8: TLabel
      Left = 17
      Top = 29
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
      Left = 43
      Top = 29
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
      Left = 336
      Top = 33
      Width = 20
      Height = 13
      Caption = 'Ctrl'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label56: TLabel
      Left = 381
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
    object Label55: TLabel
      Left = 389
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
    object Panel4: TPanel
      Left = 2
      Top = 56
      Width = 572
      Height = 49
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object botao_sair: TPanel
        Left = 481
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
      object btnSalvar: TButton
        Left = 16
        Top = 12
        Width = 153
        Height = 25
        Cursor = crHandPoint
        Caption = 'Salvar (F5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnSalvarClick
      end
    end
  end
  object pnProduto: TPanel
    Left = 17
    Top = 88
    Width = 407
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
    TabOrder = 8
  end
  object pnCor: TPanel
    Left = 56
    Top = 127
    Width = 369
    Height = 21
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object edtCor: TMaskEdit
    Left = 16
    Top = 127
    Width = 41
    Height = 21
    EditMask = '!99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 0
    Text = '  '
    OnChange = edtCorChange
    OnDblClick = edtCorDblClick
    OnEnter = edtCorEnter
    OnExit = edtCorExit
    OnKeyDown = edtCorKeyDown
  end
  object edtFaixaTam: TMaskEdit
    Left = 71
    Top = 149
    Width = 129
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    OnChange = edtFaixaTamChange
    OnDblClick = edtFaixaTamDblClick
    OnEnter = edtFaixaTamEnter
    OnExit = edtFaixaTamExit
    OnKeyDown = edtFaixaTamKeyDown
  end
  object edtQtde1: TMaskEdit
    Left = 14
    Top = 304
    Width = 119
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    OnEnter = edtQtde1Enter
    OnExit = edtQtde1Exit
    OnKeyDown = edtQtde1KeyDown
    OnKeyUp = edtQtde1KeyUp
  end
  object edtPVenda1: TMaskEdit
    Left = 287
    Top = 304
    Width = 152
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 5
    OnEnter = edtPVenda1Enter
    OnExit = edtPVenda1Exit
    OnKeyDown = edtPVenda1KeyDown
    OnKeyUp = edtPVenda1KeyUp
  end
  object edtPcusto1: TMaskEdit
    Left = 134
    Top = 304
    Width = 152
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    OnEnter = edtPcusto1Enter
    OnExit = edtPcusto1Exit
    OnKeyDown = edtPcusto1KeyDown
    OnKeyUp = edtPcusto1KeyUp
  end
  object edtDesc: TMaskEdit
    Left = 15
    Top = 204
    Width = 475
    Height = 21
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 60
    ParentFont = False
    TabOrder = 2
    OnEnter = edtDescEnter
    OnKeyDown = edtDescKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 43
    Align = alTop
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object Label33: TLabel
      Left = 18
      Top = 5
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
    object edtLoja: TMaskEdit
      Left = 17
      Top = 18
      Width = 41
      Height = 21
      EditMask = '!99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '  '
      OnChange = edtLojaChange
      OnDblClick = edtLojaDblClick
      OnEnter = edtLojaEnter
      OnExit = edtLojaExit
      OnKeyDown = edtLojaKeyDown
    end
    object pnLoja: TPanel
      Left = 57
      Top = 18
      Width = 369
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnLocal2: TPanel
    Left = 251
    Top = 46
    Width = 172
    Height = 42
    Color = clTeal
    TabOrder = 10
    Visible = False
    object Label11: TLabel
      Left = 3
      Top = 5
      Width = 69
      Height = 13
      Caption = 'Ref. Interna'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtRefInt: TMaskEdit
      Left = 3
      Top = 18
      Width = 150
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 12
      ParentFont = False
      TabOrder = 0
      OnEnter = edtRefIntEnter
      OnKeyDown = edtRefIntKeyDown
    end
  end
  object pnLocal1: TPanel
    Left = 16
    Top = 46
    Width = 234
    Height = 42
    Color = clTeal
    TabOrder = 11
    object Label2: TLabel
      Left = 5
      Top = 4
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 71
      Top = 4
      Width = 55
      Height = 13
      Caption = 'Subgrupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 137
      Top = 4
      Width = 75
      Height = 13
      Caption = 'Cód. Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtGrupo: TMaskEdit
      Left = 5
      Top = 18
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      EditMask = '!999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      Text = '   '
      OnChange = edtGrupoChange
      OnDblClick = edtGrupoDblClick
      OnEnter = edtGrupoEnter
      OnExit = edtGrupoExit
      OnKeyDown = edtGrupoKeyDown
    end
    object edtSubGrupo: TMaskEdit
      Left = 71
      Top = 18
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      EditMask = '!999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 1
      Text = '   '
      OnChange = edtSubGrupoChange
      OnDblClick = edtSubGrupoDblClick
      OnEnter = edtSubGrupoEnter
      OnExit = edtSubGrupoExit
      OnKeyDown = edtSubGrupoKeyDown
    end
    object edtCodigo: TMaskEdit
      Left = 137
      Top = 18
      Width = 92
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 2
      Text = '      '
      OnChange = edtCodigoChange
      OnDblClick = edtCodigoDblClick
      OnEnter = edtCodigoEnter
      OnExit = edtCodigoExit
      OnKeyDown = edtCodigoKeyDown
    end
  end
  object edtRefFab: TMaskEdit
    Left = 14
    Top = 241
    Width = 119
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 12
    ParentFont = False
    TabOrder = 12
    OnEnter = edtRefFabEnter
    OnKeyDown = edtRefFabKeyDown
  end
  object edtCodigoBarra: TMaskEdit
    Left = 134
    Top = 241
    Width = 119
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 12
    ParentFont = False
    TabOrder = 13
    OnEnter = edtCodigoBarraEnter
    OnKeyDown = edtCodigoBarraKeyDown
  end
  object pnUnidade: TPanel
    Left = 425
    Top = 88
    Width = 76
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
    TabOrder = 14
  end
  object Panel2: TPanel
    Left = 6
    Top = 328
    Width = 553
    Height = 49
    TabOrder = 15
    Visible = False
    object Label5: TLabel
      Left = 8
      Top = 7
      Width = 97
      Height = 13
      Caption = 'Saldo do item (2)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 128
      Top = 7
      Width = 110
      Height = 13
      Caption = 'P.médio de custo $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 281
      Top = 7
      Width = 102
      Height = 13
      Caption = 'Preço de venda $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtQtde2: TMaskEdit
      Left = 8
      Top = 21
      Width = 119
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnEnter = edtQtde2Enter
      OnExit = edtQtde2Exit
      OnKeyDown = edtQtde2KeyDown
      OnKeyUp = edtQtde2KeyUp
    end
    object edtPcusto2: TMaskEdit
      Left = 128
      Top = 21
      Width = 152
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnEnter = edtPcusto2Enter
      OnExit = edtPcusto2Exit
      OnKeyDown = edtPcusto2KeyDown
      OnKeyUp = edtPcusto2KeyUp
    end
    object edtPVenda2: TMaskEdit
      Left = 281
      Top = 21
      Width = 152
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      OnEnter = edtPVenda2Enter
      OnExit = edtPVenda2Exit
      OnKeyDown = edtPVenda2KeyDown
      OnKeyUp = edtPVenda2KeyUp
    end
  end
  object MainMenu1: TMainMenu
    Left = 477
    Top = 48
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formulário'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        ShortCut = 116
        OnClick = Salvar1Click
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
  object qLancaItemLoja: TQuery
    DatabaseName = 'ESTOQUE'
    Left = 507
    Top = 48
  end
  object qLancaItem: TQuery
    DatabaseName = 'ESTOQUE'
    Left = 538
    Top = 48
  end
end
