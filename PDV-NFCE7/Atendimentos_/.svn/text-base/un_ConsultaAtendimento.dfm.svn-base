object frm_ConsultaAtendimento: Tfrm_ConsultaAtendimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema de Atendimento - NATIVASOFT'
  ClientHeight = 545
  ClientWidth = 792
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object FiltroVendedor: TPanel
    Left = 0
    Top = 96
    Width = 792
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LabelOO1: TLabelOO
      Left = 99
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Vendedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO5: TLabelOO
      Left = 16
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO7: TLabelOO
      Left = 752
      Top = 21
      Width = 25
      Height = 24
      Caption = 'F7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtVendedor: TMaskEditOO
      Left = 98
      Top = 22
      Width = 82
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
      TabOrder = 0
      Text = '      '
      OnDblClick = edtVendedorDblClick
      OnEnter = edtVendedorEnter
      OnExit = edtVendedorExit
      OnKeyDown = edtVendedorKeyDown
      zFieldTypeOO = ftInteger
      zFieldLengthOO = 6
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object pnVend: TPanelOO
      Left = 182
      Top = 22
      Width = 377
      Height = 22
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
    object botao1: TPanel
      Left = 572
      Top = 22
      Width = 165
      Height = 22
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Aplicar filtrar - [F5]'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = botao1Click
    end
    object edtData1: TMaskEditOO
      Left = 15
      Top = 22
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
      OnEnter = edtData1Enter
      OnKeyDown = edtData1KeyDown
      zFieldTypeOO = ftDateTime
      zFieldLengthOO = 10
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 55
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Caption = '    Buscar Atendimentos por...'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      792
      55)
    object rdSit: TRadioGroup
      Left = 224
      Top = 3
      Width = 553
      Height = 36
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akBottom]
      BiDiMode = bdLeftToRight
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Em Andamento...    '
        'Conclu'#237'dos'
        'Cancelados'
        'TODOS')
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = rdSitClick
    end
  end
  object grade: TDBGrid
    Left = 0
    Top = 240
    Width = 792
    Height = 204
    Align = alClient
    DataSource = ds
    DefaultDrawing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = gradeDrawColumnCell
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'AT_STAT'
        Visible = False
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'AT_CAIX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Term.'
        Title.Color = clTeal
        Width = 34
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'AT_CODI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'N'#250'm./Atdo.'
        Title.Color = clTeal
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_TOTA'
        Title.Caption = 'Total $'
        Title.Color = clTeal
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDESC'
        Title.Caption = 'Desconto'
        Title.Color = clTeal
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_QTDE'
        Title.Caption = 'Qtde.'
        Title.Color = clTeal
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_VEND'
        Title.Caption = 'C'#243'd. Vend'
        Title.Color = clTeal
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_NOME'
        Title.Caption = 'Cliente'
        Title.Color = clTeal
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cSTATUS'
        Title.Caption = 'Situa'#231#227'o do Atendimento'
        Title.Color = clTeal
        Width = 155
        Visible = True
      end>
  end
  object FiltroCliente: TPanel
    Left = 0
    Top = 144
    Width = 792
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    object LabelOO2: TLabelOO
      Left = 98
      Top = 8
      Width = 90
      Height = 13
      Caption = 'Nome do cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO6: TLabelOO
      Left = 16
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO8: TLabelOO
      Left = 752
      Top = 21
      Width = 25
      Height = 24
      Caption = 'F7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TMaskEditOO
      Left = 97
      Top = 22
      Width = 463
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 40
      ParentFont = False
      TabOrder = 0
      OnEnter = edtNomeEnter
      OnKeyDown = edtNomeKeyDown
      zFieldTypeOO = ftString
      zFieldLengthOO = 40
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object botao2: TPanel
      Left = 572
      Top = 22
      Width = 165
      Height = 22
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Aplicar filtrar - [F5]'
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
    object edtData2: TMaskEditOO
      Left = 14
      Top = 22
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
      OnEnter = edtData2Enter
      OnKeyDown = edtData2KeyDown
      zFieldTypeOO = ftDateTime
      zFieldLengthOO = 10
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
  end
  object FiltroNumero: TPanel
    Left = 0
    Top = 192
    Width = 792
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    object LabelOO3: TLabelOO
      Left = 75
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Atendimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO4: TLabelOO
      Left = 16
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Terminal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO9: TLabelOO
      Left = 752
      Top = 21
      Width = 25
      Height = 24
      Caption = 'F7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNumero: TMaskEditOO
      Left = 74
      Top = 22
      Width = 82
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
      TabOrder = 0
      Text = '      '
      OnEnter = edtNumeroEnter
      OnKeyDown = edtNumeroKeyDown
      zFieldTypeOO = ftInteger
      zFieldLengthOO = 6
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object botao3: TPanel
      Left = 572
      Top = 22
      Width = 165
      Height = 22
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Aplicar filtrar - [F5]'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = botao3Click
    end
    object edtTerminal: TMaskEditOO
      Left = 14
      Top = 22
      Width = 59
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
      TabOrder = 2
      Text = '  '
      OnEnter = edtTerminalEnter
      OnKeyDown = edtTerminalKeyDown
      zFieldTypeOO = ftInteger
      zFieldLengthOO = 2
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 444
    Width = 792
    Height = 101
    Align = alBottom
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 5
    object Label4: TLabel
      Left = 26
      Top = 12
      Width = 305
      Height = 13
      Caption = 'F5-> Aplicar filtro para busca por atendimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 25
      Top = 46
      Width = 184
      Height = 13
      Caption = 'CTRL+L-> Limpar formul'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 706
      Top = 45
      Width = 69
      Height = 13
      Caption = 'ESC-> Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 26
      Top = 29
      Width = 187
      Height = 13
      Caption = 'F7-> Alternar filtro de busca'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BotaoSair1: TBotaoSair
      Left = 701
      Top = 65
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
    object btnImprimirSlip: TPanel
      Left = 473
      Top = 64
      Width = 221
      Height = 27
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Imprimir SLIP - CTRL+P'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnImprimirSlipClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 6
    object Image2: TImage
      Left = -32
      Top = 1
      Width = 869
      Height = 36
      Stretch = True
    end
    object Label10: TLabel
      Left = 14
      Top = 12
      Width = 207
      Height = 18
      Caption = '[Consulta de Atendimentos]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 15
      Top = 12
      Width = 207
      Height = 18
      Caption = '[Consulta de Atendimentos]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object MainMenu1: TMainMenu
    Left = 66
    Top = 260
    object Principal1: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Aplicarfiltro1: TMenuItem
        Caption = 'Aplicar filtro'
        ShortCut = 116
        OnClick = Aplicarfiltro1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ImprimirSLIP: TMenuItem
        Caption = 'Imprimir SLIP'
        ShortCut = 16464
        OnClick = ImprimirSLIPClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
  object ds: TDataSource
    DataSet = qAtendimentos
    Left = 5
    Top = 260
  end
  object qAtendimentos: TQuery
    OnCalcFields = qAtendimentosCalcFields
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'SELECT *'
      'FROM ATENDIMENTOS')
    Left = 35
    Top = 260
    object qAtendimentosAT_STAT: TStringField
      FieldName = 'AT_STAT'
      Origin = 'VENDAS.ATENDIMENTOS.AT_STAT'
      Size = 1
    end
    object qAtendimentosAT_CAIX: TFloatField
      FieldName = 'AT_CAIX'
      Origin = 'VENDAS.ATENDIMENTOS.AT_CAIX'
      DisplayFormat = '00'
    end
    object qAtendimentosAT_LOJA: TFloatField
      FieldName = 'AT_LOJA'
      Origin = 'VENDAS.ATENDIMENTOS.AT_LOJA'
    end
    object qAtendimentosAT_CODI: TFloatField
      FieldName = 'AT_CODI'
      Origin = 'VENDAS.ATENDIMENTOS.AT_CODI'
    end
    object qAtendimentosAT_FUNC: TFloatField
      FieldName = 'AT_FUNC'
      Origin = 'VENDAS.ATENDIMENTOS.AT_FUNC'
    end
    object qAtendimentosAT_DATA: TDateTimeField
      FieldName = 'AT_DATA'
      Origin = 'VENDAS.ATENDIMENTOS.AT_DATA'
    end
    object qAtendimentosAT_OPER: TFloatField
      FieldName = 'AT_OPER'
      Origin = 'VENDAS.ATENDIMENTOS.AT_OPER'
    end
    object qAtendimentosAT_TOTA: TFloatField
      FieldName = 'AT_TOTA'
      Origin = 'VENDAS.ATENDIMENTOS.AT_TOTA'
      DisplayFormat = '####0.00'
    end
    object qAtendimentosAT_QTDE: TFloatField
      FieldName = 'AT_QTDE'
      Origin = 'VENDAS.ATENDIMENTOS.AT_QTDE'
    end
    object qAtendimentosAT_QTD1: TFloatField
      FieldName = 'AT_QTD1'
      Origin = 'VENDAS.ATENDIMENTOS.AT_QTD1'
    end
    object qAtendimentosAT_QTD2: TFloatField
      FieldName = 'AT_QTD2'
      Origin = 'VENDAS.ATENDIMENTOS.AT_QTD2'
    end
    object qAtendimentosAT_VEND: TFloatField
      FieldName = 'AT_VEND'
      Origin = 'VENDAS.ATENDIMENTOS.AT_VEND'
      DisplayFormat = '000000'
    end
    object qAtendimentosAT_NOME: TStringField
      FieldName = 'AT_NOME'
      Origin = 'VENDAS.ATENDIMENTOS.AT_NOME'
      Size = 40
    end
    object qAtendimentosAT_ONLI: TStringField
      FieldName = 'AT_ONLI'
      Origin = 'VENDAS.ATENDIMENTOS.AT_ONLI'
      Size = 1
    end
    object qAtendimentosAT_ENVI: TStringField
      FieldName = 'AT_ENVI'
      Origin = 'VENDAS.ATENDIMENTOS.AT_ENVI'
      Size = 1
    end
    object qAtendimentoscVENDEDOR: TStringField
      FieldKind = fkCalculated
      FieldName = 'cVENDEDOR'
      Calculated = True
    end
    object qAtendimentoscSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSTATUS'
      Size = 15
      Calculated = True
    end
    object qAtendimentosAT_DESC: TFloatField
      FieldName = 'AT_DESC'
      Origin = 'VENDAS.ATENDIMENTOS.AT_DESC'
      DisplayFormat = '####0.00'
    end
    object qAtendimentoscDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDESC'
      Size = 10
      Calculated = True
    end
  end
end
