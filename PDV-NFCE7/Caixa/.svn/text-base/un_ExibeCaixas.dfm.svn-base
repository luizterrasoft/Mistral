object frm_ExibeCaixas: Tfrm_ExibeCaixas
  Left = 48
  Top = 66
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = '[Manuten'#231#227'o de Caixa]'
  ClientHeight = 430
  ClientWidth = 698
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Image2: TImage
    Left = 2
    Top = 3
    Width = 694
    Height = 35
  end
  object lblData: TLabel
    Left = 560
    Top = 44
    Width = 116
    Height = 16
    Caption = 'Data: 18/09/2004'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblLojaTerminal: TLabel
    Left = 8
    Top = 42
    Width = 355
    Height = 20
    Caption = 'Loja: 00/LOJA N'#195'O DEFINIDA  - Terminal: 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 19
    Top = 11
    Width = 172
    Height = 18
    Caption = '[Manuten'#231#227'o de Caixa]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 20
    Top = 9
    Width = 172
    Height = 18
    Caption = '[Manuten'#231#227'o de Caixa]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 698
    Height = 430
    Align = alClient
    Shape = bsFrame
  end
  object BotaoSair1: TBotaoSair
    Left = 610
    Top = 396
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
    Top = 88
    Width = 688
    Height = 249
    Cursor = crHandPoint
    Hint = 'Lista de caixas dispon'#237'veis neste terminal'
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = gradeDrawColumnCell
    OnDblClick = gradeDblClick
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CX_STAT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CX_FUNC'
        Title.Caption = 'C'#243'digo'
        Title.Color = clTeal
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cFUNC'
        Title.Caption = 'Operador(es) de Caixa'
        Title.Color = clTeal
        Width = 287
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CX_VINI'
        Title.Caption = '$ Inicial '
        Title.Color = clTeal
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cSTAT'
        Title.Caption = 'Situa'#231#227'o'
        Title.Color = clTeal
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CX_ABRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Abertura'
        Title.Color = clTeal
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CX_ENCE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Fechamento'
        Title.Color = clTeal
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CX_CAIX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Term'
        Title.Color = clTeal
        Width = 32
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 3
    Top = 65
    Width = 690
    Height = 26
    BorderStyle = bsSingle
    Caption = 'Caixas dispon'#237'veis'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object botao1: TPanel
    Left = 144
    Top = 341
    Width = 137
    Height = 22
    Cursor = crHandPoint
    Hint = 'Ativa o caixa selecionado na lista de caixas'
    BevelInner = bvLowered
    Caption = '  A&Tivar Caixa'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = botao1Click
    OnMouseMove = botao1MouseMove
  end
  object botao2: TPanel
    Left = 5
    Top = 341
    Width = 137
    Height = 48
    Cursor = crHandPoint
    Hint = 'Inicia a abertura de um novo caixa'
    BevelInner = bvLowered
    Caption = '&Abrir Caixa'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = botao2Click
    OnMouseMove = botao2MouseMove
  end
  object botao3: TPanel
    Left = 281
    Top = 341
    Width = 137
    Height = 22
    Cursor = crHandPoint
    Hint = 'Exclui o caixa selecionado na lista'
    BevelInner = bvLowered
    Caption = '&Excluir'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = botao3Click
    OnMouseMove = botao3MouseMove
  end
  object botao5: TPanel
    Left = 555
    Top = 341
    Width = 137
    Height = 22
    Cursor = crHandPoint
    Hint = 'Encerra o caixa impossibilitando sua reabertura'
    BevelInner = bvLowered
    Caption = 'Ence&Rrar'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = botao5Click
    OnMouseMove = botao5MouseMove
  end
  object botao4: TPanel
    Left = 418
    Top = 341
    Width = 137
    Height = 22
    Cursor = crHandPoint
    Hint = 'Suspende o caixa permitindo reabertura'
    BevelInner = bvLowered
    Caption = '&Suspender'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = botao4Click
    OnMouseMove = botao4MouseMove
  end
  object botao6: TPanel
    Left = 144
    Top = 364
    Width = 274
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fecha a janela de manuten'#231#227'o de caixa sem escolher caixa'
    BevelInner = bvLowered
    Caption = '  > Sair sem selecionar um caixa'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = botao6Click
    OnMouseMove = botao6MouseMove
  end
  object botao7: TPanel
    Left = 418
    Top = 364
    Width = 274
    Height = 25
    Cursor = crHandPoint
    Hint = 'Realiza a simples confer'#234'ncia do caixa selecionada na lista'
    BevelInner = bvLowered
    Caption = 'Confer'#234'ncia do Caixa'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = botao7Click
    OnMouseMove = botao7MouseMove
  end
  object qCaixas: TQuery
    AfterScroll = qCaixasAfterScroll
    OnCalcFields = qCaixasCalcFields
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'SELECT *'
      'FROM CAIXAS'
      'WHERE (CX_LOJA=:loja) AND'
      '      (CX_DATA=:data)'
      ' ')
    Left = 8
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'loja'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qCaixasCX_STAT: TStringField
      FieldName = 'CX_STAT'
      Origin = 'VENDAS.CAIXAS.CX_STAT'
      Size = 1
    end
    object qCaixasCX_LOJA: TFloatField
      FieldName = 'CX_LOJA'
      Origin = 'VENDAS.CAIXAS.CX_LOJA'
    end
    object qCaixasCX_CAIX: TFloatField
      DisplayWidth = 5
      FieldName = 'CX_CAIX'
      Origin = 'VENDAS.CAIXAS.CX_CAIX'
      DisplayFormat = '00'
    end
    object qCaixasCX_FUNC: TFloatField
      FieldName = 'CX_FUNC'
      Origin = 'VENDAS.CAIXAS.CX_FUNC'
      DisplayFormat = '000000'
    end
    object qCaixasCX_DATA: TDateTimeField
      FieldName = 'CX_DATA'
      Origin = 'VENDAS.CAIXAS.CX_DATA'
    end
    object qCaixasCX_VINI: TFloatField
      FieldName = 'CX_VINI'
      Origin = 'VENDAS.CAIXAS.CX_LOJA'
      DisplayFormat = '#####0.00'
    end
    object qCaixascFUNC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cFUNC'
      Size = 40
      Calculated = True
    end
    object qCaixascSTAT: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSTAT'
      Size = 15
      Calculated = True
    end
    object qCaixasCX_ABRE: TStringField
      FieldName = 'CX_ABRE'
      Origin = 'VENDAS.CAIXAS.CX_ABRE'
    end
    object qCaixasCX_ENCE: TStringField
      FieldName = 'CX_ENCE'
      Origin = 'VENDAS.CAIXAS.CX_ENCE'
    end
  end
  object ds: TDataSource
    DataSet = qCaixas
    Left = 37
    Top = 128
  end
  object MainMenu1: TMainMenu
    Left = 66
    Top = 128
    object AtalhosInvisiveis1: TMenuItem
      Caption = 'Atalhos Invisiveis'
      Visible = False
      object Ajuda1: TMenuItem
        Caption = 'Ajuda'
        ShortCut = 112
        OnClick = Ajuda1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Ativarcaixa1: TMenuItem
        Caption = 'Ativar caixa'
        ShortCut = 16468
        OnClick = Ativarcaixa1Click
      end
      object Novo1: TMenuItem
        Caption = 'Abrir Caixa'
        ShortCut = 16449
        OnClick = Novo1Click
      end
      object Excluir1: TMenuItem
        Caption = 'Excluir'
        ShortCut = 16453
        OnClick = Excluir1Click
      end
      object Suspender1: TMenuItem
        Caption = 'Suspender / Reabrir'
        ShortCut = 16467
        OnClick = Suspender1Click
      end
      object Encerrar1: TMenuItem
        Caption = 'Encerrar'
        ShortCut = 16466
        OnClick = Encerrar1Click
      end
    end
  end
end
