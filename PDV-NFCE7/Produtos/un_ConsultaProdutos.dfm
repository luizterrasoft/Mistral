object frm_ConsultaProduto: Tfrm_ConsultaProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de produto'
  ClientHeight = 536
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
  object Panel6: TPanel
    Left = 0
    Top = 100
    Width = 792
    Height = 36
    Align = alTop
    Color = clTeal
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 16
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
    object Label10: TLabel
      Left = 624
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Estoque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel7: TPanel
      Left = 77
      Top = 4
      Width = 540
      Height = 29
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 0
      object DBText1: TDBText
        Left = 8
        Top = 5
        Width = 465
        Height = 17
        DataField = 'nomeForn'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnEstoque: TPanel
      Left = 688
      Top = 4
      Width = 80
      Height = 29
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '00'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 491
    Width = 792
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 0
    object lblStatus: TLabel
      Left = 7
      Top = 11
      Width = 203
      Height = 23
      Alignment = taCenter
      Caption = '[On-Line] / [ECF: Urano]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object botao_sair: TPanel
      Left = 694
      Top = 10
      Width = 89
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
    Top = 136
    Width = 792
    Height = 334
    Cursor = crHandPoint
    Align = alClient
    Color = clWhite
    DataSource = ds
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = gradeDblClick
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'nome_produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Descri'#231#227'o do produto'
        Width = 376
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cCor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Cor'
        Width = 234
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cTam'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Tamanho'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cPVenda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Pre'#231'o Venda'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_UNID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Unidade'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_NCM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'NCM'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_IPPT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'IPPT'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_SITR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'ST'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_IAT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'IAT'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cPCusto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'CT'
        Width = 90
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 69
    Align = alTop
    Color = clTeal
    TabOrder = 2
    object Label5: TLabel
      Left = 107
      Top = 5
      Width = 165
      Height = 20
      Caption = '[Filtrar produtos por]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLoja: TLabel
      Left = 560
      Top = 3
      Width = 45
      Height = 20
      Caption = 'Loja: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 108
      Top = 52
      Width = 265
      Height = 13
      Caption = '[F7 - Alternar filtros de localiza'#231#227'o do produto]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pn_codigo_barras: TPanel
      Left = 8
      Top = 27
      Width = 553
      Height = 23
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 5
      Visible = False
      object Label8: TLabel
        Left = 1
        Top = 11
        Width = 96
        Height = 13
        Caption = 'C'#243'd. de barras..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodBarras: TMaskEdit
        Left = 99
        Top = 2
        Width = 143
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 0
        OnEnter = edtCodBarrasEnter
        OnKeyDown = edtCodBarrasKeyDown
      end
    end
    object pn_referencia: TPanel
      Left = 8
      Top = 25
      Width = 553
      Height = 25
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 2
      Visible = False
      object Label3: TLabel
        Left = 182
        Top = 13
        Width = 89
        Height = 13
        Caption = 'Ref.Fabricante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 13
        Width = 81
        Height = 13
        Caption = 'Fornecedor...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRefFab: TMaskEdit
        Left = 271
        Top = 4
        Width = 126
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentFont = False
        TabOrder = 0
        OnEnter = edtFornEnter
        OnKeyDown = edtFornKeyDown
      end
      object edtForn2: TMaskEdit
        Left = 99
        Top = 4
        Width = 68
        Height = 21
        EditMask = '!999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        TabOrder = 1
        Text = '      '
        OnDblClick = edtForn2DblClick
        OnEnter = edtForn2Enter
        OnExit = edtForn2Exit
        OnKeyDown = edtForn2KeyDown
      end
    end
    object pn_referencia_interna: TPanel
      Left = 7
      Top = 25
      Width = 553
      Height = 25
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 3
      Visible = False
      object Label6: TLabel
        Left = 17
        Top = 14
        Width = 81
        Height = 13
        Caption = 'Ref.Interna...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRefInt: TMaskEdit
        Left = 99
        Top = 4
        Width = 118
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        OnEnter = edtRefIntEnter
        OnKeyDown = edtRefIntKeyDown
      end
    end
    object pn_Fornecedor: TPanel
      Left = 9
      Top = 24
      Width = 553
      Height = 26
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 13
        Width = 89
        Height = 13
        Caption = 'Fornecedor.....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtForn: TMaskEdit
        Left = 98
        Top = 4
        Width = 68
        Height = 21
        EditMask = '!999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        TabOrder = 0
        Text = '      '
        OnDblClick = edtFornDblClick
        OnEnter = edtFornEnter
        OnExit = edtFornExit
        OnKeyDown = edtFornKeyDown
      end
      object pnForn: TPanel
        Left = 168
        Top = 4
        Width = 370
        Height = 22
        Alignment = taLeftJustify
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
    object pn_Descricao: TPanel
      Left = 8
      Top = 25
      Width = 553
      Height = 25
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 2
        Top = 13
        Width = 94
        Height = 13
        Caption = 'Descri'#231#227'o........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDesc: TMaskEdit
        Left = 98
        Top = 4
        Width = 441
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 0
        OnChange = edtDescChange
        OnEnter = edtFornEnter
        OnKeyDown = edtFornKeyDown
      end
    end
    object btn_procurar: TPanel
      Left = 562
      Top = 25
      Width = 222
      Height = 27
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Localizar produtos'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_procurarClick
    end
    object chFiltroContem: TCheckBox
      Left = 562
      Top = 52
      Width = 164
      Height = 17
      Caption = 'Aplicar filtro que cont'#233'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object pn_ReferenciaFab: TPanel
      Left = 8
      Top = 25
      Width = 553
      Height = 25
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 7
      Visible = False
      object Label11: TLabel
        Left = 2
        Top = 13
        Width = 93
        Height = 13
        Caption = 'Ref. Fabricante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRefFab2: TMaskEdit
        Left = 98
        Top = 4
        Width = 271
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 0
        OnChange = edtRefFab2Change
        OnKeyDown = edtRefFab2KeyDown
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 470
    Width = 792
    Height = 21
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 
      ' [Ctrl + E] -> Consultar no estoque de outras lojas             ' +
      '                                                                ' +
      '           [F1] -> Ajuda'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Panel5Click
  end
  object pnNomeProduto: TPanel
    Left = 0
    Top = 69
    Width = 792
    Height = 31
    Align = alTop
    Alignment = taLeftJustify
    Caption = ' '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object ds: TDataSource
    DataSet = DMF8.qConsultaProdutos2
    Left = 755
    Top = 149
  end
  object MainMenu1: TMainMenu
    Left = 724
    Top = 149
    object Principal1: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        Visible = False
        OnClick = Limparformulrio1Click
      end
      object Ajuda1: TMenuItem
        Caption = 'Ajuda'
        ShortCut = 112
        OnClick = Ajuda1Click
      end
    end
    object Invisiveis1: TMenuItem
      Caption = 'Invisiveis'
      Visible = False
      object Visaogeraldosprecospraticadosparaoitem1: TMenuItem
        Caption = 'Visao geral dos precos praticados para o item'
        ShortCut = 115
        OnClick = Visaogeraldosprecospraticadosparaoitem1Click
      end
    end
  end
end
