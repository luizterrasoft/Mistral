object frm_Transf_Entrada_Online_Lancamento: Tfrm_Transf_Entrada_Online_Lancamento
  Left = 88
  Top = 79
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de itens para ENTRADA de transfer'#234'ncia ON-LINE'
  ClientHeight = 224
  ClientWidth = 615
  Color = clTeal
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
  object gbItem_ProdCorTam: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 106
    Align = alTop
    BevelOuter = bvNone
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label34: TLabel
      Left = 39
      Top = 70
      Width = 20
      Height = 13
      Caption = 'Cor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 316
      Top = 70
      Width = 25
      Height = 13
      Caption = 'Tam'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCor: TMaskEdit
      Left = 39
      Top = 83
      Width = 51
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 0
      Text = '    '
      OnChange = edtCorChange
      OnDblClick = edtCorDblClick
      OnEnter = edtCorEnter
      OnExit = edtCorExit
      OnKeyDown = edtCorKeyDown
    end
    object pnCor: TPanel
      Left = 92
      Top = 83
      Width = 222
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtFaixaTam: TMaskEdit
      Left = 317
      Top = 83
      Width = 60
      Height = 21
      MaxLength = 5
      TabOrder = 1
      OnChange = edtFaixaTamChange
      OnDblClick = edtFaixaTamDblClick
      OnEnter = edtFaixaTamEnter
      OnExit = edtFaixaTamExit
      OnKeyDown = edtFaixaTamKeyDown
    end
    object pnProduto: TPanel
      Left = 40
      Top = 45
      Width = 449
      Height = 22
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnLocal1: TPanel
      Left = 36
      Top = 3
      Width = 196
      Height = 42
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 4
      Visible = False
      object Label14: TLabel
        Left = 3
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
      object Label15: TLabel
        Left = 44
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
      object Label17: TLabel
        Left = 105
        Top = 4
        Width = 75
        Height = 13
        Caption = 'C'#243'd. Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtGrupo: TMaskEdit
        Left = 3
        Top = 17
        Width = 39
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
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
        OnChange = edtGrupoChange
        OnDblClick = edtGrupoDblClick
        OnEnter = edtGrupoEnter
        OnExit = edtGrupoExit
        OnKeyDown = edtGrupoKeyDown
      end
      object edtSubGrupo: TMaskEdit
        Left = 44
        Top = 17
        Width = 59
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        EditMask = '!99;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 1
        Text = '  '
        OnChange = edtSubGrupoChange
        OnDblClick = edtSubGrupoDblClick
        OnEnter = edtSubGrupoEnter
        OnExit = edtSubGrupoExit
        OnKeyDown = edtSubGrupoKeyDown
      end
      object edtCodigo: TMaskEdit
        Left = 105
        Top = 17
        Width = 88
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        TabOrder = 2
        Text = '    '
        OnChange = edtCodigoChange
        OnDblClick = edtCodigoDblClick
        OnEnter = edtCodigoEnter
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
      end
    end
    object pnLocal2: TPanel
      Left = 238
      Top = 3
      Width = 115
      Height = 42
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 5
      Visible = False
      object Label18: TLabel
        Left = 3
        Top = 4
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
        Top = 17
        Width = 110
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
        OnChange = edtRefIntChange
        OnDblClick = edtRefIntDblClick
        OnEnter = edtRefIntEnter
        OnExit = edtRefIntExit
        OnKeyDown = edtRefIntKeyDown
      end
    end
    object pnLocal3: TPanel
      Left = 354
      Top = 3
      Width = 186
      Height = 42
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 6
      Visible = False
      object Label22: TLabel
        Left = 78
        Top = 4
        Width = 104
        Height = 13
        Caption = 'Ref. do fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 4
        Top = 4
        Width = 65
        Height = 13
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRefFab: TMaskEdit
        Left = 78
        Top = 17
        Width = 106
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentFont = False
        TabOrder = 0
        OnChange = edtRefFabChange
        OnDblClick = edtRefFabDblClick
        OnEnter = edtRefFabEnter
        OnExit = edtRefFabExit
        OnKeyDown = edtRefFabKeyDown
      end
      object edtForn: TMaskEdit
        Left = 2
        Top = 17
        Width = 74
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        EditMask = '!999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        TabOrder = 1
        Text = '      '
        OnChange = edtFornChange
        OnDblClick = edtFornDblClick
        OnEnter = edtFornEnter
        OnExit = edtFornExit
        OnKeyDown = edtFornKeyDown
      end
    end
  end
  object gbItem_CBarra: TPanel
    Left = 0
    Top = -1
    Width = 800
    Height = 68
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 2
    object Label16: TLabel
      Left = 39
      Top = 7
      Width = 97
      Height = 13
      Caption = 'C'#243'digo de barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbleituracbarra: TLabelOO
      Left = 195
      Top = 25
      Width = 61
      Height = 13
      Caption = 'leitura direta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCBarra: TMaskEdit
      Left = 39
      Top = 20
      Width = 150
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentFont = False
      TabOrder = 0
      OnDblClick = edtCBarraDblClick
      OnEnter = edtCBarraEnter
      OnExit = edtCBarraExit
      OnKeyDown = edtCBarraKeyDown
    end
    object pnDescItem2: TPanel
      Left = 40
      Top = 43
      Width = 561
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
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
  object Panel3: TPanel
    Left = 0
    Top = 158
    Width = 615
    Height = 66
    Align = alBottom
    BevelInner = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Bevel8: TBevel
      Left = 392
      Top = 6
      Width = 129
      Height = 51
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 363
      Top = 25
      Width = 20
      Height = 13
      Caption = 'Ctrl'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label55: TLabel
      Left = 429
      Top = 13
      Width = 39
      Height = 13
      Caption = 'Limpar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label56: TLabel
      Left = 405
      Top = 12
      Width = 20
      Height = 13
      Caption = '&L->'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 535
      Top = 16
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
      Left = 572
      Top = 16
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
    object lbF8: TLabel
      Left = 13
      Top = 41
      Width = 27
      Height = 13
      Caption = 'F8->'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbF8Mens: TLabel
      Left = 43
      Top = 41
      Width = 54
      Height = 13
      Caption = 'Consultar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 42
      Top = 25
      Width = 230
      Height = 13
      Caption = 'Alternar filtros de localiza'#231#227'o do produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 13
      Top = 24
      Width = 27
      Height = 13
      Caption = 'F7->'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 404
      Top = 29
      Width = 22
      Height = 13
      Caption = '&U->'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 429
      Top = 30
      Width = 76
      Height = 13
      Caption = 'Novo produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 7
      Width = 247
      Height = 13
      Caption = 'F6-> Alterar forma de leitura do c'#243'd. barras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object botao_sair: TPanel
      Left = 531
      Top = 33
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
  object Panel1: TPanel
    Left = 1
    Top = 110
    Width = 615
    Height = 46
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 3
    object Label4: TLabel
      Left = 39
      Top = -3
      Width = 27
      Height = 13
      Caption = 'Qtde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtQtde: TMaskEdit
      Left = 38
      Top = 10
      Width = 51
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = edtQtdeEnter
      OnKeyDown = edtQtdeKeyDown
    end
    object botao2: TPanel
      Left = 91
      Top = 10
      Width = 222
      Height = 23
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Adicionar ao lote'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = botao2Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 528
    Top = 79
    object Principal1: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Novoproduto1: TMenuItem
        Caption = 'Novo produto'
        ShortCut = 16469
        OnClick = Novoproduto1Click
      end
      object Limparcadastro1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparcadastro1Click
      end
      object Mudarformadeleituradocdigodebarras1: TMenuItem
        Caption = 'Mudar forma de leitura do c'#243'digo de barras'
        ShortCut = 117
        Visible = False
        OnClick = Mudarformadeleituradocdigodebarras1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
  object qTransf: TQuery
    DatabaseName = 'C:\NATIVA\VENDAS'
    Left = 559
    Top = 79
  end
end
