object Frm_Cons_ImpExp: TFrm_Cons_ImpExp
  Left = 92
  Top = 66
  Width = 586
  Height = 399
  ActiveControl = DBGridControle1
  Caption = 'Consulta de Importa'#231#245'es e Exporta'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 121
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 38
      Width = 34
      Height = 13
      Caption = 'In'#237'cio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 38
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 20
      Height = 13
      Caption = 'Fim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 120
      Top = 64
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Data'
      FocusControl = Data1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 120
      Top = 8
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 20
      Top = 88
      Width = 25
      Height = 13
      Caption = 'Loja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Inicio1: TMaskEditControle
      Left = 48
      Top = 34
      Width = 60
      Height = 21
      EditMask = '!99/99/99;1; '
      MaxLength = 8
      TabOrder = 2
      Text = '  /  /  '
      Obrigatorio = False
      Encontrou = False
      VerificaData = True
      VerificaHora = False
      DataDoDia = False
      Enter = True
      FormataData = False
      FormatDate = False
    end
    object fim1: TMaskEditControle
      Left = 48
      Top = 60
      Width = 60
      Height = 21
      EditMask = '!99/99/99;1; '
      MaxLength = 8
      TabOrder = 4
      Text = '  /  /  '
      Obrigatorio = False
      Encontrou = False
      VerificaData = True
      VerificaHora = False
      DataDoDia = False
      Enter = True
      FormataData = False
      FormatDate = False
    end
    object Fim2: TMaskEditControle
      Left = 144
      Top = 60
      Width = 60
      Height = 21
      EditMask = '!99/99/99;1; '
      MaxLength = 8
      TabOrder = 5
      Text = '  /  /  '
      Obrigatorio = False
      Encontrou = False
      VerificaData = True
      VerificaHora = False
      DataDoDia = False
      Enter = True
      FormataData = False
      FormatDate = False
    end
    object iNICIO2: TMaskEditControle
      Left = 144
      Top = 34
      Width = 60
      Height = 21
      EditMask = '!99/99/99;1; '
      MaxLength = 8
      TabOrder = 3
      Text = '  /  /  '
      Obrigatorio = False
      Encontrou = False
      VerificaData = True
      VerificaHora = False
      DataDoDia = False
      Enter = True
      FormataData = False
      FormatDate = False
    end
    object Data1: TMaskEditControle
      Left = 48
      Top = 4
      Width = 60
      Height = 21
      EditMask = '!99/99/99;1; '
      MaxLength = 8
      TabOrder = 0
      Text = '  /  /  '
      Obrigatorio = False
      Encontrou = False
      VerificaData = True
      VerificaHora = False
      DataDoDia = False
      Enter = True
      FormataData = False
      FormatDate = False
    end
    object Data2: TMaskEditControle
      Left = 144
      Top = 4
      Width = 60
      Height = 21
      EditMask = '!99/99/99;1; '
      MaxLength = 8
      TabOrder = 1
      Text = '  /  /  '
      Obrigatorio = False
      Encontrou = False
      VerificaData = True
      VerificaHora = False
      DataDoDia = False
      Enter = True
      FormataData = False
      FormatDate = False
    end
    object Loja: TEditControle
      Left = 48
      Top = 86
      Width = 60
      Height = 21
      TabOrder = 6
      OnKeyDown = LojaKeyDown
      Obrigatorio = False
      Posicao = 0
      NextPos = DBGridControle1
      Encontrou = False
    end
    object PanelControle1: TPanelControle
      Left = 144
      Top = 85
      Width = 425
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      TabOrder = 7
    end
    object RdTipo: TRadioGroup
      Left = 240
      Top = 8
      Width = 121
      Height = 65
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        '&Exporta'#231#227'o'
        '&Importa'#231#227'o')
      ParentFont = False
      TabOrder = 8
      OnClick = RdTipoClick
    end
    object btn_procurar: TBitBtn
      Left = 456
      Top = 51
      Width = 113
      Height = 28
      Hint = 'Clique aqui para consultar'
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      TabStop = False
      OnClick = btn_procurarClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF969190736E6EAF7D7EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9792916C6C70174B82326089AF7B7BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8386863A79B11A81FF0D62
        BC3B5F7FB07D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2698FF
        3DB0FF349DFF1C7EF80C62BA395E7FB07B7DFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF2996FF42ADFE349AFF1C7EF80C60B8405F7FB17D7BFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A96FE41AFFE349AFF1C7EF80C
        5FB83E5F7EB07B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A97
        FE41AFFE349AFF1A7BF80B5FB744627FA97A7EFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF2C98FE41ADFE349CFF197BF60C5EB62B587FFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D99FE41ADFE339CFF287FE7
        3D607BFF00FFFF00FFFF00FF996964996964996964996964996964FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D
        9AFE4BB5FF8CBDEDAC9F966C565593665F996964DDCCABFFFFD9FFFFD9FFFFD7
        E9D5B6996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD1ADA5B68775CCAB8CFFFFD3FFFFD3FF
        FFD0FFFFCFFFFFD0FFFFD3FFFFE2D4BAA4996964FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996B65D4AF8FFFEF
        B0FBEDB8FFFFCFFFFFCEFFFFCFFFFFD7FFFFDCFFFFEAFFFFFFD3BBB8996964FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        996964FFEAA6F2C78FFAEBB6FFFFD0FFFFCFFFFFD3FFFFE5FFFFF2FFFFFAFFFF
        FCFFFFFE996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF996964E6C9A0F6CA8BEEBA7FFBE7B4FFFFD0FFFFCFFFFFD7FFFFEB
        FFFFFEFFFFFCFFFFF2FFFFE5D8C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF996964FFEFADF0BC7DEBB075F7DDA7FEFCCBFF
        FFD1FFFFD5FFFFE6FFFFF6FFFFF6FFFFE6FFFFD7FFFFDA996964FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFF0AFEFBA7BE9A5
        6AF2C98FFCEFBCFFFFD1FFFFD3FFFFD9FFFFE1FFFFE2FFFFD9FFFFD3FFFFDA99
        6964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964
        FFF2B2F3C484E99E63EDB57AF4D79FFCF4C2FFFFD1FFFFD3FFFFD3FFFFD3FFFF
        D0FFFFCFFFFFD8996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF996964E6C9A0FCDE9EEFBA7EEEB779EFC284F6DAA1FBF2BFFFFFCF
        FFFFD1FFFFD0FFFFD0FFFFD1D9C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFFEC2FBEBCAF6D7ACF0C186EF
        BF82F3CC95FAE3ADFCF0BCFBF4C1FEF6C4FFFFD4996964FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964D7BB9EFFFF
        FFFEF7EEF6D8ACEDB474E9A76BEDB478F0C48AF6D49CFFF4B6D3B799996964FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF996964CEB6AFFFFFFFFFF4CBF6CF90F0BC7DF2BF81F7CE90FFEDA9D4B1
        93996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF996964996964E1C9A0FFF7B5FFF2AFFFF2B1
        E9CCA4996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99696499
        6964996964996964996964FF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object DBGridControle1: TDBGridControle
    Left = 0
    Top = 121
    Width = 578
    Height = 120
    Align = alTop
    DataSource = Ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridControle1DrawColumnCell
    ScrollBars = ssHorizontal
    DisableDetalhes = False
    AlignEnableDetalhes = alNone
    AlignDisableDetalhes = alNone
    UltColAut = False
  end
  object DBGridControle2: TDBGridControle
    Left = 0
    Top = 241
    Width = 578
    Height = 75
    Align = alClient
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    ScrollBars = ssHorizontal
    DisableDetalhes = False
    AlignEnableDetalhes = alNone
    AlignDisableDetalhes = alNone
    UltColAut = False
  end
  object Panel4: TPanel
    Left = 0
    Top = 316
    Width = 578
    Height = 49
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object botao_sair: TPanel
      Left = 486
      Top = 12
      Width = 76
      Height = 25
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
  object Query1: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'SELECT IX_LOJA,IX_DATA,IX_INICIO,IX_FIM,IX_USUARIO,IX_ERRO'
      'FROM  Imp_exp'
      'Where  ')
    Left = 330
    Top = 104
  end
  object Query2: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      
        'SELECT Cast(Ix_Tabela as VarChar(65)) as TABELA,Ix_REG as Total,' +
        'Ix_REGNEW as Alterados'
      'From Imp_Exp'
      'Where Ix_data =:DataImp'
      'and      ix_LojaOrg =:Loja'
      'and      ix_ImpExp =:Tipo')
    Left = 386
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataImp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Loja'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end>
  end
  object Ds1: TDataSource
    DataSet = Query1
    Left = 312
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 368
    Top = 176
  end
end
