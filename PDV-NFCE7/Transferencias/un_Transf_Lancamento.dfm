object frm_Transf_Lancamento: Tfrm_Transf_Lancamento
  Left = -4
  Top = -4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de itens para transfer'#234'ncia'
  ClientHeight = 574
  ClientWidth = 800
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object gbItem_CBarra: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 73
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 3
    object Label16: TLabel
      Left = 39
      Top = 8
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
      Left = 193
      Top = 25
      Width = 65
      Height = 13
      Caption = ':leitura direta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 193
      Top = 9
      Width = 111
      Height = 13
      Caption = '(F6-> altera forma)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO1: TLabelOO
      Left = 515
      Top = 25
      Width = 231
      Height = 13
      Caption = 'CTRL+F7 -> Mudar forma de localiza'#231#227'o do item'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCBarra: TMaskEdit
      Left = 39
      Top = 21
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
      Top = 44
      Width = 708
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
  object gbItem_ProdCorTam: TPanel
    Left = -1
    Top = -2
    Width = 795
    Height = 87
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
      Left = 40
      Top = 46
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
      Left = 323
      Top = 46
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
    object LabelOO3: TLabelOO
      Left = 515
      Top = 45
      Width = 231
      Height = 13
      Caption = 'CTRL+F7 -> Mudar forma de localiza'#231#227'o do item'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCor: TMaskEdit
      Left = 39
      Top = 59
      Width = 59
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
      Left = 101
      Top = 59
      Width = 218
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
      Left = 324
      Top = 59
      Width = 58
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
      Left = 231
      Top = 20
      Width = 517
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
      TabOrder = 2
    end
    object pnLocal1: TPanel
      Left = 36
      Top = 4
      Width = 193
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
        Width = 87
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
      Top = 4
      Width = 193
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
        Width = 189
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
      Left = 444
      Top = 4
      Width = 194
      Height = 42
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 6
      Visible = False
      object Label22: TLabel
        Left = 79
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
        Left = 5
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
        Left = 79
        Top = 17
        Width = 113
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
        Left = 3
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
  object Panel3: TPanel
    Left = 0
    Top = 514
    Width = 800
    Height = 60
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
      Left = 520
      Top = 7
      Width = 161
      Height = 43
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 494
      Top = 23
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
      Left = 541
      Top = 14
      Width = 33
      Height = 13
      Caption = 'impar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label56: TLabel
      Left = 533
      Top = 13
      Width = 6
      Height = 13
      Caption = '&L'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 704
      Top = 8
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
      Left = 741
      Top = 8
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
      Top = 26
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
      Top = 26
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
      Left = 229
      Top = 9
      Width = 224
      Height = 13
      Caption = 'Alternar filtro de localiza'#231#227'o do produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 200
      Top = 9
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
    object Label9: TLabel
      Left = 62
      Top = 9
      Width = 115
      Height = 13
      Caption = 'Salvar transfer'#234'ncia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 13
      Top = 9
      Width = 46
      Height = 13
      Caption = 'F5/F9->'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMensDel: TLabel
      Left = 237
      Top = 26
      Width = 109
      Height = 13
      Caption = 'Excluir item do lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblDel: TLabel
      Left = 200
      Top = 26
      Width = 34
      Height = 13
      Caption = 'DEL->'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 532
      Top = 30
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
      Left = 557
      Top = 31
      Width = 76
      Height = 13
      Caption = 'novo produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object botao_sair: TPanel
      Left = 700
      Top = 29
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
  object grade: TDBGrid
    Left = 0
    Top = 137
    Width = 800
    Height = 289
    Cursor = crHandPoint
    Align = alBottom
    Color = clWhite
    DataSource = ds1
    DefaultDrawing = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = gradeDrawColumnCell
    OnEnter = gradeEnter
    OnExit = gradeExit
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cGrupo'
        Title.Caption = 'Grupo'
        Title.Color = clTeal
        Width = 17
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cSubgrupo'
        Title.Caption = 'Sg'
        Title.Color = clTeal
        Width = 18
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cCodigo'
        Title.Caption = 'C'#243'digo'
        Title.Color = clTeal
        Width = 44
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'CBARRA1'
        Title.Caption = 'C'#243'digo de Barra'
        Title.Color = clTeal
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cREFF'
        Title.Caption = 'Ref/Fabric.'
        Title.Color = clTeal
        Width = 78
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cDescricao'
        Title.Caption = 'Descri'#231#227'o do produto'
        Title.Color = clTeal
        Width = 403
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cCor'
        Title.Caption = 'Cor'
        Title.Color = clTeal
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cTam'
        Title.Caption = 'Tamanho'
        Title.Color = clTeal
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Title.Color = clTeal
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Title.Caption = 'Qtde'
        Title.Color = clTeal
        Width = 37
        Visible = True
      end>
  end
  object Panel5: TPanel
    Left = 0
    Top = 117
    Width = 800
    Height = 20
    Align = alBottom
    Caption = 'Lote de produtos lan'#231'ados '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 81
    Width = 800
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 5
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
      Top = 11
      Width = 59
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
      Left = 100
      Top = 11
      Width = 221
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
  object Panel2: TPanel
    Left = 0
    Top = 426
    Width = 800
    Height = 88
    Align = alBottom
    Color = clTeal
    TabOrder = 6
    object LabelOO2: TLabelOO
      Left = 570
      Top = 22
      Width = 78
      Height = 16
      Caption = 'TOTAL >>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnExcluir: TSpeedButton
      Left = 77
      Top = 57
      Width = 229
      Height = 29
      Cursor = crHandPoint
      Hint = 'Exclui a refer'#234'ncia selecionada do lote'
      Caption = 'Excluir refer'#234'ncia - [DEL]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        5E080000424D5E080000000000003600000028000000170000001D0000000100
        18000000000028080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000
        FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExcluirClick
    end
    object btnExcluirTodos: TSpeedButton
      Left = 309
      Top = 57
      Width = 217
      Height = 29
      Cursor = crHandPoint
      Hint = 'Exclui todas as refer'#234'ncias do lote'
      Caption = 'Excluir tudo - [CTRL+DEL]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        5E080000424D5E080000000000003600000028000000170000001D0000000100
        18000000000028080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFF000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FF0000FF0000FF000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0000FF0000FF0000FF000080000080000080000080000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF00008000008000008000008000
        0080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000800000800000
        80000080000080000080000080000080000080FFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF000080
        000080000080000080000080000080000080000080000080000080FFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF00
        00FF0000FF000080000080000080000080000080000080000080000080000080
        000080000080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00008000008000008000008000
        0080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000800000
        800000800000800000800000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
        0000FF000080000080000080000080000080000080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00FF0000FF0000FF0000FF000080000080000080000080000080000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF00008000008000008000008000
        0080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000800000
        80000080000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
        0000FF000080000080000080000080000080000080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00FF0000FF0000FF0000FF000080000080000080000080000080000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExcluirTodosClick
    end
    object btnAumentaQtde: TSpeedButton
      Left = 77
      Top = 7
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Aumenta a Qtde. informada na refer'#234'ncia selecionada'
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAumentaQtdeClick
    end
    object btnDiminuiQtde: TSpeedButton
      Left = 77
      Top = 32
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Diminui a Qtde. informada na refer'#234'ncia selecionada'
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDiminuiQtdeClick
    end
    object btnSalvar: TSpeedButton
      Left = 529
      Top = 57
      Width = 217
      Height = 29
      Cursor = crHandPoint
      Hint = 'Salva a transfer'#234'ncia em quest'#227'o'
      Caption = 'Salvar transfer'#234'ncia - [F5]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalvarClick
    end
    object Label5: TLabel
      Left = 105
      Top = 11
      Width = 294
      Height = 16
      Caption = 'Adicionar quantidade ao item selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 105
      Top = 35
      Width = 291
      Height = 16
      Caption = 'Remover quantidade do item selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnQtdeTotal: TPanel
      Left = 656
      Top = 16
      Width = 88
      Height = 27
      BevelInner = bvLowered
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 728
    Top = 206
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
      object N1: TMenuItem
        Caption = '-'
      end
      object Processarentradas1: TMenuItem
        Caption = 'Salvar transfer'#234'ncia'
        ShortCut = 116
        OnClick = Processarentradas1Click
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
  object ds1: TDataSource
    DataSet = tblTransf
    Left = 668
    Top = 206
  end
  object tblTransf: TTable
    AfterOpen = tblTransfAfterOpen
    AfterClose = tblTransfAfterClose
    OnCalcFields = tblTransfCalcFields
    DatabaseName = 'C:\NATIVA\VENDAS'
    Filtered = True
    TableName = 'TEMP_TRANSF'
    TableType = ttDBase
    Left = 698
    Top = 206
    object tblTransfcTam: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTam'
      Size = 10
      Calculated = True
    end
    object tblTransfcCor: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCor'
      Size = 10
      Calculated = True
    end
    object tblTransfcREFI: TStringField
      FieldKind = fkCalculated
      FieldName = 'cREFI'
      Calculated = True
    end
    object tblTransfcDescricao: TStringField
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'cDescricao'
      Size = 40
      Calculated = True
    end
    object tblTransfcGrupo: TStringField
      FieldKind = fkCalculated
      FieldName = 'cGrupo'
      Calculated = True
    end
    object tblTransfcSubgrupo: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSubgrupo'
      Calculated = True
    end
    object tblTransfcCodigo: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCodigo'
      Calculated = True
    end
    object tblTransfcREFF: TStringField
      FieldKind = fkCalculated
      FieldName = 'cREFF'
      Calculated = True
    end
    object tblTransfGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object tblTransfSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
    end
    object tblTransfPRODUTO: TFloatField
      FieldName = 'PRODUTO'
    end
    object tblTransfLOJA: TIntegerField
      FieldName = 'LOJA'
    end
    object tblTransfCOR: TIntegerField
      FieldName = 'COR'
    end
    object tblTransfTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 5
    end
    object tblTransfQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object tblTransfDATA: TDateField
      FieldName = 'DATA'
    end
    object tblTransfMODE: TStringField
      FieldName = 'MODE'
      Size = 1
    end
    object tblTransfTIPZ: TStringField
      FieldName = 'TIPZ'
      Size = 1
    end
    object tblTransfSALDOANT: TIntegerField
      FieldName = 'SALDOANT'
    end
    object tblTransfcSaldo1: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSaldo1'
      Size = 10
      Calculated = True
    end
    object tblTransfSEQ: TIntegerField
      FieldName = 'SEQ'
    end
    object tblTransfCBARRA1: TStringField
      FieldName = 'CBARRA1'
      Size = 14
    end
  end
  object qTransf: TQuery
    DatabaseName = 'C:\NATIVA\VENDAS'
    Left = 758
    Top = 206
  end
end