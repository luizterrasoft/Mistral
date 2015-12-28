object frm_CaixaLancamentos_Consulta: Tfrm_CaixaLancamentos_Consulta
  Left = -1
  Top = -2
  ActiveControl = edtData1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Consulta de lan'#231'amentos '
  ClientHeight = 578
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
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 792
    Height = 578
    Align = alClient
    Shape = bsFrame
  end
  object Image2: TImage
    Left = 2
    Top = 2
    Width = 824
    Height = 35
  end
  object lbltitulo_sombra: TLabel
    Left = 27
    Top = 10
    Width = 199
    Height = 18
    Caption = '[Consulta de lan'#231'amentos]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label22: TLabel
    Left = 634
    Top = 566
    Width = 34
    Height = 13
    Caption = 'ESC->'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label23: TLabel
    Left = 673
    Top = 566
    Width = 22
    Height = 13
    Caption = 'Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO1: TLabelOO
    Left = 25
    Top = 99
    Width = 145
    Height = 13
    Caption = 'Per'#237'odo dos lan'#231'amentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO
    Left = 134
    Top = 123
    Width = 19
    Height = 13
    Caption = 'at'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCaixa: TLabelOO
    Left = 25
    Top = 76
    Width = 113
    Height = 13
    Caption = 'Operador de caixa: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTerminal: TLabelOO
    Left = 25
    Top = 61
    Width = 53
    Height = 13
    Caption = 'Terminal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 15
    Top = 94
    Width = 765
    Height = 9
    Shape = bsTopLine
  end
  object lblLoja: TLabelOO
    Left = 25
    Top = 44
    Width = 29
    Height = 13
    Caption = 'Loja:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbtipz: TLabel
    Left = 700
    Top = 101
    Width = 35
    Height = 16
    Caption = 'Sr.: 1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LabelOO3: TLabelOO
    Left = 486
    Top = 476
    Width = 110
    Height = 13
    Caption = 'Total de D'#201'BITOS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO4: TLabelOO
    Left = 478
    Top = 500
    Width = 119
    Height = 13
    Caption = 'Total de CR'#201'DITOS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO5: TLabelOO
    Left = 550
    Top = 524
    Width = 45
    Height = 13
    Caption = 'TOTAL:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO6: TLabelOO
    Left = 696
    Top = 476
    Width = 21
    Height = 13
    Caption = '( - )'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO7: TLabelOO
    Left = 696
    Top = 500
    Width = 24
    Height = 13
    Caption = '( + )'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltitulo: TLabel
    Left = 28
    Top = 12
    Width = 199
    Height = 18
    Caption = '[Consulta de lan'#231'amentos]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object BotaoSair1: TBotaoSair
    Left = 704
    Top = 560
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
  object grade: TDBGrid
    Left = 4
    Top = 155
    Width = 790
    Height = 309
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'LC_DATA'
        Title.Caption = 'Data'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 68
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'LC_SEQ'
        Title.Caption = 'Seq.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_FUNC'
        Title.Caption = 'Op. Cx.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_CONT'
        Title.Caption = 'Conta'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_DESC'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 342
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_NATU'
        Title.Caption = 'Nat'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cVALO'
        Title.Caption = 'Valor $'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cTIPO'
        Title.Caption = 'Tipo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_TIPZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = ' '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = False
      end>
  end
  object edtData1: TMaskEditOO
    Left = 24
    Top = 117
    Width = 104
    Height = 22
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
    OnEnter = edtData1Enter
    OnKeyDown = edtData1KeyDown
    zFieldTypeOO = ftDateTime
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object edtData2: TMaskEditOO
    Left = 157
    Top = 117
    Width = 104
    Height = 22
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
    OnKeyDown = edtData2KeyDown
    zFieldTypeOO = ftDateTime
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object btnOk: TPanel
    Left = 266
    Top = 117
    Width = 113
    Height = 22
    Cursor = crHandPoint
    Caption = 'Consultar'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnOkClick
  end
  object chTodosTerminais: TCheckBoxOO
    Left = 142
    Top = 59
    Width = 148
    Height = 17
    Cursor = crHandPoint
    Caption = 'Verificar todos os terminais'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 5
    OnClick = chTodosTerminaisClick
    OnKeyDown = chTodosTerminaisKeyDown
  end
  object pnTotalDeb: TPanel
    Left = 604
    Top = 469
    Width = 86
    Height = 23
    Alignment = taRightJustify
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object pnTotalCred: TPanel
    Left = 604
    Top = 493
    Width = 86
    Height = 23
    Alignment = taRightJustify
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object pnTotal: TPanel
    Left = 604
    Top = 517
    Width = 86
    Height = 23
    Alignment = taRightJustify
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 10
    Top = 516
    Width = 247
    Height = 25
    Cursor = crHandPoint
    Caption = 'Deletar Lan'#231'amento - [Ctrl + Delete]'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Panel1Click
  end
  object Panel2: TPanel
    Left = 10
    Top = 484
    Width = 247
    Height = 25
    Cursor = crHandPoint
    Caption = 'Alterar Lan'#231'amento - [F5]'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = Panel2Click
  end
  object ds: TDataSource
    DataSet = qLancamentos
    Left = 8
    Top = 166
  end
  object qLancamentos: TQuery
    AfterClose = qLancamentosAfterClose
    OnCalcFields = qLancamentosCalcFields
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'SELECT * FROM '
      'LANCAMENTOS_CAIXA')
    Left = 101
    Top = 246
    object qLancamentosLC_LOJA: TFloatField
      FieldName = 'LC_LOJA'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_LOJA'
    end
    object qLancamentosLC_CAIX: TFloatField
      FieldName = 'LC_CAIX'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_CAIX'
    end
    object qLancamentosLC_DATA: TDateTimeField
      FieldName = 'LC_DATA'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_DATA'
    end
    object qLancamentosLC_FUNC: TFloatField
      FieldName = 'LC_FUNC'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_FUNC'
    end
    object qLancamentosLC_SEQ: TFloatField
      FieldName = 'LC_SEQ'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_SEQ'
    end
    object qLancamentosLC_VALO: TFloatField
      FieldName = 'LC_VALO'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_VALO'
    end
    object qLancamentosLC_NATU: TStringField
      FieldName = 'LC_NATU'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_NATU'
      Size = 1
    end
    object qLancamentosLC_DESC: TStringField
      FieldName = 'LC_DESC'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_DESC'
      Size = 60
    end
    object qLancamentosLC_TIPZ: TStringField
      FieldName = 'LC_TIPZ'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_TIPZ'
      Size = 1
    end
    object qLancamentosLC_CONT: TFloatField
      FieldName = 'LC_CONT'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_CONT'
    end
    object qLancamentosLC_TIPO: TFloatField
      FieldName = 'LC_TIPO'
      Origin = 'VENDAS.LANCAMENTOS_CAIXA.LC_TIPO'
    end
    object qLancamentoscNATUREZA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cNATUREZA'
      Size = 3
      Calculated = True
    end
    object qLancamentoscTIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTIPO'
      Size = 10
      Calculated = True
    end
    object qLancamentoscVALO: TStringField
      FieldKind = fkCalculated
      FieldName = 'cVALO'
      Calculated = True
    end
  end
  object MainMenu1: TMainMenu
    Left = 66
    Top = 166
    object Principal1: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object N1: TMenuItem
        Caption = '-'
        ShortCut = 189
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
end
