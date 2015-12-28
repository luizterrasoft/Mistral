object frm_f8Cep: Tfrm_f8Cep
  Left = 6
  Top = 40
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Procurar por um CEP'
  ClientHeight = 473
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 413
    Width = 780
    Height = 15
    Align = alBottom
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 428
    Width = 780
    Height = 45
    Align = alBottom
    TabOrder = 1
    object botao_sair: TPanel
      Left = 687
      Top = 10
      Width = 77
      Height = 25
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
    object btn_procurar: TBitBtn
      Left = 575
      Top = 10
      Width = 113
      Height = 25
      Cursor = crHandPoint
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_procurarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
        00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
        9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
        E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
        FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
        B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
        FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
        DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
        B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
        BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
        D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
        6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object grade: TDBGrid
    Left = 0
    Top = 45
    Width = 780
    Height = 327
    Cursor = crHandPoint
    Align = alClient
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = gradeDblClick
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Color = clNavy
        Expanded = False
        FieldName = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Tipo'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGRADOURO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Endere'#231'o'
        Width = 316
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPLEMENT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Complemento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Cidade'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Bairro'
        Width = 316
        Visible = True
      end>
  end
  object pn_procurar: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 45
    Align = alTop
    TabOrder = 3
    object pnBairro: TPanel
      Left = 16
      Top = 3
      Width = 633
      Height = 37
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      object Label2: TLabel
        Left = 32
        Top = 22
        Width = 34
        Height = 13
        Caption = 'Bairro'
      end
      object edtBairro: TMaskEdit
        Left = 72
        Top = 14
        Width = 361
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 0
        OnEnter = edtBairroEnter
        OnKeyDown = edtBairroKeyDown
      end
    end
    object pnEndereco: TPanel
      Left = 16
      Top = 3
      Width = 633
      Height = 37
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 55
        Height = 13
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtEndereco: TMaskEdit
        Left = 72
        Top = 14
        Width = 545
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 0
        OnEnter = edtEnderecoEnter
        OnKeyDown = edtEnderecoKeyDown
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 372
    Width = 780
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Bevel1: TBevel
      Left = 77
      Top = 8
      Width = 684
      Height = 26
    end
    object lblComplemento: TLabel
      Left = 14
      Top = 14
      Width = 34
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBComplemento: TDBText
      Left = 84
      Top = 14
      Width = 669
      Height = 17
      DataField = 'BAIRRO1'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ds: TDataSource
    DataSet = qCepsF8
    Left = 7
    Top = 89
  end
  object qCepsF8: TQuery
    DatabaseName = 'CEP'
    SQL.Strings = (
      'SELECT *'
      'FROM CEP')
    Left = 37
    Top = 89
    object qCepsF8UF: TStringField
      FieldName = 'UF'
      Origin = 'CREDCEP.CEP.UF'
      Size = 2
    end
    object qCepsF8CEP: TStringField
      FieldName = 'CEP'
      Origin = 'CREDCEP.CEP.CEP'
      Size = 50
    end
    object qCepsF8TIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'CREDCEP.CEP.TIPO'
      Size = 10
    end
    object qCepsF8LOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'CREDCEP.CEP.LOGRADOURO'
      Size = 50
    end
    object qCepsF8COMPLEMENT: TStringField
      FieldName = 'COMPLEMENT'
      Origin = 'CREDCEP.CEP.COMPLEMENT'
      Size = 30
    end
    object qCepsF8BAIRRO1: TStringField
      FieldName = 'BAIRRO1'
      Origin = 'CREDCEP.CEP.BAIRRO1'
    end
    object qCepsF8BAIRRO2: TStringField
      FieldName = 'BAIRRO2'
      Origin = 'CREDCEP.CEP.BAIRRO2'
    end
    object qCepsF8CIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CREDCEP.CEP.CIDADE'
    end
    object qCepsF8TIPOLOCAL: TStringField
      FieldName = 'TIPOLOCAL'
      Origin = 'CREDCEP.CEP.TIPOLOCAL'
      Size = 15
    end
  end
end
