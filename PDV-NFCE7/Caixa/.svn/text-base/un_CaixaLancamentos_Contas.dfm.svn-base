object frm_CaixaLancamentos_Contas: Tfrm_CaixaLancamentos_Contas
  Left = 127
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Contas dispon'#237'veis'
  ClientHeight = 384
  ClientWidth = 561
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Image2: TImage
    Left = 4
    Top = 3
    Width = 554
    Height = 35
  end
  object lbltitulo_sombra: TLabel
    Left = 19
    Top = 11
    Width = 154
    Height = 18
    Caption = '[Contas dispon'#237'veis]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label22: TLabel
    Left = 399
    Top = 353
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
    Left = 438
    Top = 353
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
  object lbltitulo: TLabel
    Left = 18
    Top = 9
    Width = 154
    Height = 18
    Caption = '[Contas dispon'#237'veis]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 561
    Height = 384
    Align = alClient
    Shape = bsFrame
  end
  object BotaoSair1: TBotaoSair
    Left = 471
    Top = 347
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
    Left = 2
    Top = 93
    Width = 551
    Height = 242
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
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'CO_CODI'
        Title.Caption = 'C'#243'digo'
        Title.Color = clTeal
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_DESC'
        Title.Caption = 'Descri'#231#227'o da conta'
        Title.Color = clTeal
        Width = 437
        Visible = True
      end>
  end
  object rdNatu: TRadioGroup
    Left = 9
    Top = 46
    Width = 296
    Height = 39
    Cursor = crHandPoint
    Caption = 'Contas de:'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'D'#233'bito'
      'Cr'#233'dito')
    ParentFont = False
    TabOrder = 2
    OnClick = rdNatuClick
    OnExit = rdNatuExit
  end
  object ds: TDataSource
    DataSet = qContas
    Left = 7
    Top = 133
  end
  object qContas: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'SELECT *'
      'FROM CONTAS'
      'WHERE (CO_NATU=:co_natu)'
      'ORDER BY CO_DESC')
    Left = 37
    Top = 133
    ParamData = <
      item
        DataType = ftString
        Name = 'co_natu'
        ParamType = ptUnknown
      end>
    object qContasCO_CODI: TFloatField
      FieldName = 'CO_CODI'
      Origin = 'VENDAS.CONTAS.CO_CODI'
    end
    object qContasCO_DESC: TStringField
      FieldName = 'CO_DESC'
      Origin = 'VENDAS.CONTAS.CO_DESC'
      Size = 30
    end
  end
end
