object frm_OutrasEntradas: Tfrm_OutrasEntradas
  Left = 20
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Outras Entradas'
  ClientHeight = 526
  ClientWidth = 737
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
  object Gauge1: TGauge
    Left = 0
    Top = 393
    Width = 737
    Height = 26
    Align = alBottom
    Progress = 0
    Visible = False
  end
  object gbLoja: TPanel
    Left = 0
    Top = 36
    Width = 737
    Height = 70
    Align = alTop
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label34: TLabel
      Left = 13
      Top = 54
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
      Left = 405
      Top = 51
      Width = 53
      Height = 13
      Caption = 'Tamanho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCor: TMaskEdit
      Left = 39
      Top = 46
      Width = 41
      Height = 21
      EditMask = '!99;1; '
      MaxLength = 2
      TabOrder = 0
      Text = '  '
      OnChange = edtCorChange
      OnDblClick = edtCorDblClick
      OnEnter = edtCorEnter
      OnExit = edtCorExit
      OnKeyDown = edtCorKeyDown
    end
    object pnCor: TPanel
      Left = 79
      Top = 46
      Width = 321
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
      TabOrder = 3
    end
    object edtFaixaTam: TMaskEdit
      Left = 460
      Top = 46
      Width = 129
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
      Left = 270
      Top = 22
      Width = 407
      Height = 23
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
      TabOrder = 2
    end
    object pnLocal1: TPanel
      Left = 36
      Top = 3
      Width = 232
      Height = 42
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
        Left = 69
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
        Left = 135
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
        Left = 3
        Top = 17
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
        OnKeyDown = edtGrupoKeyDown
      end
      object edtSubGrupo: TMaskEdit
        Left = 69
        Top = 17
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
        OnKeyDown = edtSubGrupoKeyDown
      end
      object edtCodigo: TMaskEdit
        Left = 135
        Top = 17
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
        OnKeyDown = edtCodigoKeyDown
      end
    end
    object pnLocal2: TPanel
      Left = 270
      Top = 3
      Width = 159
      Height = 42
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 419
    Width = 737
    Height = 107
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 1
    object Bevel1: TBevel
      Left = 9
      Top = 10
      Width = 392
      Height = 42
      Shape = bsFrame
    end
    object Bevel8: TBevel
      Left = 464
      Top = 10
      Width = 161
      Height = 43
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 416
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
      Left = 485
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
      Left = 477
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
    object Label10: TLabel
      Left = 639
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
      Left = 673
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
    object Label2: TLabel
      Left = 209
      Top = 17
      Width = 174
      Height = 13
      Caption = 'Alterna localização do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 56
      Top = 56
      Width = 23
      Height = 22
    end
    object Label1: TLabel
      Left = 183
      Top = 17
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
    object Label5: TLabel
      Left = 485
      Top = 33
      Width = 109
      Height = 13
      Caption = '&Z-> alterna fichario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 477
      Top = 33
      Width = 9
      Height = 13
      Caption = '&X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 50
      Top = 16
      Width = 109
      Height = 13
      Caption = 'processar entradas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 24
      Top = 16
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
    object Panel4: TPanel
      Left = 2
      Top = 56
      Width = 733
      Height = 49
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object botao_sair: TPanel
        Left = 631
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
      object btnProcessarEntrada: TButton
        Left = 16
        Top = 12
        Width = 185
        Height = 25
        Cursor = crHandPoint
        Caption = 'Processar entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnProcessarEntradaClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 106
    Width = 737
    Height = 23
    ActivePage = pagina1
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object pagina1: TTabSheet
      Caption = '&Normal'
    end
    object pagina2: TTabSheet
      Caption = '&Acerto'
      ImageIndex = 1
    end
    object pagina3: TTabSheet
      Caption = '&Transferência'
      ImageIndex = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 36
    Align = alTop
    Caption = 'Panel2'
    Color = clTeal
    TabOrder = 3
    object Label33: TLabel
      Left = 10
      Top = 20
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
      Left = 42
      Top = 12
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
      Left = 82
      Top = 12
      Width = 321
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
  object Panel1: TPanel
    Left = 0
    Top = 129
    Width = 737
    Height = 44
    Align = alTop
    Color = clTeal
    TabOrder = 4
    object Label4: TLabel
      Left = 153
      Top = 7
      Width = 28
      Height = 13
      Caption = 'Qtde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 233
      Top = 7
      Width = 77
      Height = 13
      Caption = 'Custo Total $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
      Top = 7
      Width = 32
      Height = 13
      Caption = 'Data '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 98
      Top = 7
      Width = 31
      Height = 13
      Caption = 'Unid.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtQtde: TMaskEdit
      Left = 152
      Top = 20
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = edtQtdeEnter
      OnExit = edtQtdeExit
      OnKeyDown = edtQtdeKeyDown
      OnKeyUp = edtQtdeKeyUp
    end
    object edtTotal: TMaskEdit
      Left = 232
      Top = 20
      Width = 108
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 3
      OnEnter = edtTotalEnter
      OnExit = edtTotalExit
      OnKeyDown = edtTotalKeyDown
      OnKeyUp = edtTotalKeyUp
    end
    object btnIncluir1: TButton
      Left = 342
      Top = 18
      Width = 144
      Height = 25
      Cursor = crHandPoint
      Caption = 'Incluir na lista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnIncluir1Click
    end
    object edtData: TMaskEdit
      Left = 14
      Top = 20
      Width = 83
      Height = 21
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = edtDataEnter
      OnKeyDown = edtDataKeyDown
    end
    object edtUnidade: TMaskEdit
      Left = 97
      Top = 20
      Width = 55
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnEnter = edtUnidadeEnter
      OnKeyDown = edtUnidadeKeyDown
    end
  end
  object grade: TDBGrid
    Left = 0
    Top = 173
    Width = 737
    Height = 220
    Cursor = crHandPoint
    Align = alClient
    DataSource = ds1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPO'
        Title.Caption = 'Grupo'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBGRUPO'
        Title.Caption = 'Subg'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Title.Caption = 'Prod'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cCor'
        Title.Caption = 'Cor'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cTam'
        Title.Caption = 'Tamanho'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Title.Caption = 'Qtde'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cTotal1'
        Title.Caption = 'Total $'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cPcusto1'
        Title.Caption = 'Custo Unit. $'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODE'
        Title.Caption = 'Modo'
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 67
    Top = 221
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparcadastro1: TMenuItem
        Caption = 'Limpar formulário'
        ShortCut = 16460
        OnClick = Limparcadastro1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Incluiritemnalista1: TMenuItem
        Caption = 'Incluir item na lista'
        OnClick = Incluiritemnalista1Click
      end
      object Excluiritemdalista1: TMenuItem
        Caption = 'Excluir item da lista'
        OnClick = Excluiritemdalista1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Avanafichrio1: TMenuItem
        Caption = 'Avança fichário'
        ShortCut = 16472
        OnClick = Avanafichrio1Click
      end
      object Retrocedefichrio1: TMenuItem
        Caption = 'Retrocede fichário'
        ShortCut = 16474
        OnClick = Retrocedefichrio1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Processarentradas1: TMenuItem
        Caption = 'Processar entradas'
        ShortCut = 116
        OnClick = Processarentradas1Click
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
    DataSet = tblEntradas
    Left = 7
    Top = 221
  end
  object tblEntradas: TTable
    OnCalcFields = tblEntradasCalcFields
    DatabaseName = 'C:\NATIVA\ESTOQUE'
    TableName = 'TEMP_ENTRADAS'
    TableType = ttDBase
    Left = 37
    Top = 221
    object tblEntradasGRUPO: TSmallintField
      FieldName = 'GRUPO'
    end
    object tblEntradasSUBGRUPO: TSmallintField
      FieldName = 'SUBGRUPO'
    end
    object tblEntradasPRODUTO: TFloatField
      FieldName = 'PRODUTO'
    end
    object tblEntradasLOJA: TSmallintField
      FieldName = 'LOJA'
    end
    object tblEntradasCOR: TSmallintField
      FieldName = 'COR'
    end
    object tblEntradasTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 5
    end
    object tblEntradasDATA: TDateField
      FieldName = 'DATA'
    end
    object tblEntradasMODE: TStringField
      FieldName = 'MODE'
      Size = 1
    end
    object tblEntradascTam: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTam'
      Size = 10
      Calculated = True
    end
    object tblEntradascCor: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCor'
      Size = 10
      Calculated = True
    end
    object tblEntradascPcusto1: TStringField
      FieldKind = fkCalculated
      FieldName = 'cPcusto1'
      Calculated = True
    end
    object tblEntradascTotal1: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTotal1'
      Calculated = True
    end
    object tblEntradascTotal2: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTotal2'
      Calculated = True
    end
    object tblEntradasQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object tblEntradasTIPZ: TStringField
      FieldName = 'TIPZ'
      Size = 1
    end
    object tblEntradasPCUSTO: TFloatField
      FieldName = 'PCUSTO'
    end
    object tblEntradasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
