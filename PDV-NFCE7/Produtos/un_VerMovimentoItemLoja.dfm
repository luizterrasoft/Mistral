object frm_VerMovimentoItemLoja: Tfrm_VerMovimentoItemLoja
  Left = 50
  Top = 68
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimentos de entrada/saída do item'
  ClientHeight = 407
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 300
    Width = 685
    Height = 107
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 0
    object Label10: TLabel
      Left = 599
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
      Left = 633
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
    object SpeedButton1: TSpeedButton
      Left = 56
      Top = 56
      Width = 23
      Height = 22
    end
    object Label4: TLabel
      Left = 15
      Top = 17
      Width = 36
      Height = 13
      Caption = 'DEL->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 49
      Top = 17
      Width = 298
      Height = 13
      Caption = 'exclue um registro de movimento e recalcula o saldo'
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
      Width = 681
      Height = 49
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object botao_sair: TPanel
        Left = 591
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
    end
  end
  object grade: TDBGrid
    Left = 0
    Top = 79
    Width = 685
    Height = 221
    Align = alClient
    DataSource = ds
    DefaultDrawing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = gradeDrawColumnCell
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'MO_TIPO'
        Title.Caption = 'Tipo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MO_SEQ'
        Title.Caption = 'Seq'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_FORN'
        Title.Caption = 'Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_ENTR'
        Title.Caption = 'Nota fiscal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_NPED'
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_DATA'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_MODE'
        Title.Caption = 'Modo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cQtde'
        Title.Caption = 'Qtde '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_PVE1'
        Title.Caption = 'P. Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_PCU1'
        Title.Caption = 'P.Custo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_TIPZ'
        Title.Caption = 'Sr.'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 685
    Height = 79
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 39
      Top = 15
      Width = 25
      Height = 13
      Caption = 'Loja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 55
      Width = 55
      Height = 13
      Caption = 'Subgrupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 30
      Top = 34
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 387
      Top = 36
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
    object Label6: TLabel
      Left = 386
      Top = 56
      Width = 25
      Height = 13
      Caption = 'Tam'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnLoja: TPanel
      Left = 69
      Top = 12
      Width = 313
      Height = 19
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnSubGrupo: TPanel
      Left = 69
      Top = 52
      Width = 313
      Height = 19
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnGrupo: TPanel
      Left = 69
      Top = 32
      Width = 313
      Height = 19
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnCor: TPanel
      Left = 415
      Top = 32
      Width = 119
      Height = 19
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object pnTamanho: TPanel
      Left = 415
      Top = 52
      Width = 119
      Height = 19
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
  object ds: TDataSource
    DataSet = qMovimento
    Left = 9
    Top = 125
  end
  object qMovimento: TQuery
    OnCalcFields = qMovimentoCalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT *'
      'FROM MOVIMENTO'
      'WHERE (MO_LOJA=:loja) AND'
      '               (MO_PROD=:produto) AND'
      '               (MO_GRUP=:grupo) AND'
      '               (MO_SUBG=:subgrupo) AND'
      '               (MO_TAMA=:faixa) AND'
      '               (MO_CORE=:cor)')
    Left = 39
    Top = 125
    ParamData = <
      item
        DataType = ftFloat
        Name = 'loja'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subgrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'faixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'cor'
        ParamType = ptUnknown
      end>
    object qMovimentoMO_TIPO: TStringField
      FieldName = 'MO_TIPO'
      Origin = 'ESTOQUE.MOVIMENTO.MO_TIPO'
      Size = 1
    end
    object qMovimentoMO_GRUP: TFloatField
      FieldName = 'MO_GRUP'
      Origin = 'ESTOQUE.MOVIMENTO.MO_GRUP'
    end
    object qMovimentoMO_SUBG: TFloatField
      FieldName = 'MO_SUBG'
      Origin = 'ESTOQUE.MOVIMENTO.MO_SUBG'
    end
    object qMovimentoMO_PROD: TFloatField
      FieldName = 'MO_PROD'
      Origin = 'ESTOQUE.MOVIMENTO.MO_PROD'
    end
    object qMovimentoMO_LOJA: TFloatField
      FieldName = 'MO_LOJA'
      Origin = 'ESTOQUE.MOVIMENTO.MO_LOJA'
    end
    object qMovimentoMO_CORE: TFloatField
      FieldName = 'MO_CORE'
      Origin = 'ESTOQUE.MOVIMENTO.MO_CORE'
    end
    object qMovimentoMO_TAMA: TStringField
      FieldName = 'MO_TAMA'
      Origin = 'ESTOQUE.MOVIMENTO.MO_TAMA'
      Size = 5
    end
    object qMovimentoMO_NPED: TFloatField
      FieldName = 'MO_NPED'
      Origin = 'ESTOQUE.MOVIMENTO.MO_NPED'
    end
    object qMovimentoMO_DATA: TDateTimeField
      FieldName = 'MO_DATA'
      Origin = 'ESTOQUE.MOVIMENTO.MO_DATA'
    end
    object qMovimentoMO_MODE: TStringField
      FieldName = 'MO_MODE'
      Origin = 'ESTOQUE.MOVIMENTO.MO_MODE'
      Size = 1
    end
    object qMovimentoMO_QTD1: TFloatField
      FieldName = 'MO_QTD1'
      Origin = 'ESTOQUE.MOVIMENTO.MO_QTD1'
    end
    object qMovimentoMO_PVE1: TFloatField
      FieldName = 'MO_PVE1'
      Origin = 'ESTOQUE.MOVIMENTO.MO_PVE1'
    end
    object qMovimentoMO_PCU1: TFloatField
      FieldName = 'MO_PCU1'
      Origin = 'ESTOQUE.MOVIMENTO.MO_PCU1'
    end
    object qMovimentoMO_TIPZ: TStringField
      FieldName = 'MO_TIPZ'
      Origin = 'ESTOQUE.MOVIMENTO.MO_TIPZ'
      Size = 1
    end
    object qMovimentoMO_NOTA: TStringField
      FieldName = 'MO_NOTA'
      Origin = 'ESTOQUE.MOVIMENTO.MO_NOTA'
    end
    object qMovimentoMO_ENTR: TStringField
      FieldName = 'MO_ENTR'
      Origin = 'ESTOQUE.MOVIMENTO.MO_ENTR'
    end
    object qMovimentoMO_FORN: TFloatField
      FieldName = 'MO_FORN'
      Origin = 'ESTOQUE.MOVIMENTO.MO_FORN'
    end
    object qMovimentoMO_SEQ: TFloatField
      FieldName = 'MO_SEQ'
      Origin = 'ESTOQUE.MOVIMENTO.MO_SEQ'
    end
    object qMovimentocQtde: TStringField
      FieldKind = fkCalculated
      FieldName = 'cQtde'
      Calculated = True
    end
  end
end
