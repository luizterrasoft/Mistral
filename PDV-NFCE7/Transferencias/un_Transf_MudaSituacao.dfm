object frm_Transf_MudaSituacao: Tfrm_Transf_MudaSituacao
  Left = 38
  Top = 33
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 433
  ClientWidth = 724
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
  object Label1: TLabel
    Left = 647
    Top = 380
    Width = 59
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 383
    Width = 195
    Height = 13
    Caption = 'F5-> Buscar itens da transfer'#234'ncia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 239
    Top = 383
    Width = 158
    Height = 13
    Caption = 'CTRL+L-> limpar formul'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BotaoSair1: TBotaoSair
    Left = 632
    Top = 400
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fecha o formul'#225'rio'
    Caption = 'SAIR'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = BotaoSair1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 51
    Align = alTop
    Color = clTeal
    TabOrder = 1
    object LabelOO1: TLabelOO
      Left = 8
      Top = 8
      Width = 84
      Height = 13
      Caption = 'Loja de origem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO2: TLabelOO
      Left = 8
      Top = 32
      Width = 65
      Height = 13
      Caption = 'Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtLojaOrigem: TMaskEditOO
      Left = 100
      Top = 3
      Width = 47
      Height = 21
      CharCase = ecUpperCase
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
      OnDblClick = edtLojaOrigemDblClick
      OnEnter = edtLojaOrigemEnter
      OnExit = edtLojaOrigemExit
      OnKeyDown = edtLojaOrigemKeyDown
      zFieldTypeOO = ftInteger
      zFieldLengthOO = 2
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object pnLojaOrigem: TPanelOO
      Left = 149
      Top = 4
      Width = 163
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtDocumento: TMaskEditOO
      Left = 100
      Top = 27
      Width = 85
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!9999999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '          '
      OnEnter = edtDocumentoEnter
      OnKeyDown = edtDocumentoKeyDown
      zFieldTypeOO = ftFloat
      zFieldLengthOO = 10
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object botao2: TPanel
      Left = 188
      Top = 26
      Width = 125
      Height = 25
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Buscar - [F5]'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = botao2Click
    end
  end
  object grade: TDBGrid
    Left = 0
    Top = 51
    Width = 724
    Height = 228
    Align = alTop
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cCBARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'C'#243'digo de Barras'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'cDESCITEM'
        Title.Caption = 'Descri'#231#227'o do Item'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 324
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_QTDS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Qtde. Sa'#237'da'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_QTDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Qtde. Entrada'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'cSTATUS'
        Title.Caption = 'Situa'#231#227'o'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 115
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 279
    Width = 724
    Height = 100
    Align = alTop
    Color = clTeal
    TabOrder = 3
    object LabelOO3: TLabelOO
      Left = 568
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Digita'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO4: TLabelOO
      Left = 568
      Top = 36
      Width = 57
      Height = 13
      Caption = 'Embarque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO5: TLabelOO
      Left = 568
      Top = 56
      Width = 49
      Height = 13
      Caption = 'Chegada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 549
      Top = 10
      Width = 9
      Height = 86
      Shape = bsRightLine
    end
    object LabelOO6: TLabelOO
      Left = 8
      Top = 10
      Width = 97
      Height = 13
      Caption = 'Lojda de Destino:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbtipz: TLabel
      Left = 320
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Sr.1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Panel3: TPanel
      Left = 632
      Top = 12
      Width = 89
      Height = 19
      Color = clInfoBk
      TabOrder = 0
      object DBText1: TDBText
        Left = 8
        Top = 2
        Width = 65
        Height = 15
        DataField = 'cDATADIGITACAO'
        DataSource = ds
      end
    end
    object Panel4: TPanel
      Left = 632
      Top = 32
      Width = 89
      Height = 19
      Color = clInfoBk
      TabOrder = 1
      object DBText2: TDBText
        Left = 8
        Top = 2
        Width = 65
        Height = 15
        DataField = 'cDATAEMBARQUE'
        DataSource = ds
      end
    end
    object Panel5: TPanel
      Left = 632
      Top = 52
      Width = 89
      Height = 19
      Color = clInfoBk
      TabOrder = 2
      object DBText3: TDBText
        Left = 8
        Top = 2
        Width = 65
        Height = 15
        DataField = 'cDATACHEGADA'
        DataSource = ds
      end
    end
    object botaoUm: TPanel
      Left = 6
      Top = 39
      Width = 307
      Height = 25
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'um - ?'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = botaoUmClick
    end
    object botaoTodos: TPanel
      Left = 6
      Top = 66
      Width = 307
      Height = 25
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'todos - ?'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = botaoTodosClick
    end
    object edtLojaDestino: TMaskEditOO
      Left = 108
      Top = 5
      Width = 47
      Height = 21
      CharCase = ecUpperCase
      Color = clTeal
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
      OnKeyDown = edtLojaOrigemKeyDown
      zFieldTypeOO = ftInteger
      zFieldLengthOO = 2
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object pnLojaDestino: TPanelOO
      Left = 157
      Top = 6
      Width = 156
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object MainMenu1: TMainMenu
    Left = 35
    Top = 93
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Buscaritensdatransferncia1: TMenuItem
        Caption = 'Buscar itens da transfer'#234'ncia'
        ShortCut = 116
        OnClick = Buscaritensdatransferncia1Click
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
  object ds: TDataSource
    DataSet = qItens
    Left = 5
    Top = 93
  end
  object qItens: TQuery
    OnCalcFields = qItensCalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT *'
      'FROM ITENS_TRANSF_LOJA'
      'WHERE (IT_LOJ1=:lojaorigem) AND'
      '            (IT_TRAN=:documento)')
    Left = 65
    Top = 93
    ParamData = <
      item
        DataType = ftFloat
        Name = 'lojaorigem'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'documento'
        ParamType = ptUnknown
      end>
    object qItensIT_LOJ1: TFloatField
      FieldName = 'IT_LOJ1'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_LOJ1'
    end
    object qItensIT_TRAN: TFloatField
      FieldName = 'IT_TRAN'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TRAN'
    end
    object qItensIT_TIPZ: TStringField
      FieldName = 'IT_TIPZ'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TIPZ'
      Size = 1
    end
    object qItensIT_GRUP: TFloatField
      FieldName = 'IT_GRUP'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_GRUP'
    end
    object qItensIT_SUBG: TFloatField
      FieldName = 'IT_SUBG'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_SUBG'
    end
    object qItensIT_PROD: TFloatField
      FieldName = 'IT_PROD'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_PROD'
    end
    object qItensIT_CORE: TFloatField
      FieldName = 'IT_CORE'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_CORE'
    end
    object qItensIT_OTAM: TIntegerField
      FieldName = 'IT_OTAM'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_OTAM'
    end
    object qItensIT_TAMA: TStringField
      FieldName = 'IT_TAMA'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TAMA'
      Size = 5
    end
    object qItensIT_QTDE: TFloatField
      FieldName = 'IT_QTDE'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_QTDE'
    end
    object qItensIT_MOV1: TFloatField
      FieldName = 'IT_MOV1'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_MOV1'
    end
    object qItensIT_MOV2: TFloatField
      FieldName = 'IT_MOV2'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_MOV2'
    end
    object qItensIT_DIGI: TDateTimeField
      FieldName = 'IT_DIGI'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_DIGI'
    end
    object qItensIT_EMBA: TDateTimeField
      FieldName = 'IT_EMBA'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_EMBA'
    end
    object qItensIT_CHEG: TDateTimeField
      FieldName = 'IT_CHEG'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_CHEG'
    end
    object qItensIT_STAT: TStringField
      FieldName = 'IT_STAT'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_STAT'
      Size = 1
    end
    object qItensIT_QTDS: TFloatField
      FieldName = 'IT_QTDS'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_QTDS'
    end
    object qItenscDESCITEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDESCITEM'
      Size = 60
      Calculated = True
    end
    object qItenscCBARRA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCBARRA'
      Calculated = True
    end
    object qItenscSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSTATUS'
      Calculated = True
    end
    object qItenscDATADIGITACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATADIGITACAO'
      Size = 10
      Calculated = True
    end
    object qItenscDATAEMBARQUE: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATAEMBARQUE'
      Size = 10
      Calculated = True
    end
    object qItenscDATACHEGADA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATACHEGADA'
      Size = 10
      Calculated = True
    end
  end
end
