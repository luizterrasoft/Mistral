object Frm_MostraDetalhamento: TFrm_MostraDetalhamento
  Left = -4
  Top = -4
  Width = 808
  Height = 608
  ActiveControl = BitBtn4
  Caption = 'Consulta de Detalhamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 166
    Width = 745
    Height = 13
    AutoSize = False
    Caption = 'Cheque '
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 96
    Width = 536
    Height = 12
    AutoSize = False
    Caption = 'Dinheiro'
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = 284
    Width = 745
    Height = 13
    AutoSize = False
    Caption = 'Cartão '
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 1
    Top = 386
    Width = 745
    Height = 12
    AutoSize = False
    Caption = 'Outras Formas/Créditos'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 2
    Top = -1
    Width = 533
    Height = 14
    AutoSize = False
    Caption = 'Documentos Baixados Juntos'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object GridCheque: TGridSql
    Left = 0
    Top = 178
    Width = 745
    Height = 106
    ColCount = 12
    DefaultColWidth = 50
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    ParentFont = False
    TabOrder = 0
    Limite = 0
    OnGetCellAlignment = GridChequeGetCellAlignment
    OnGetCellColor = GridChequeGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = False
    Campos.Strings = (
      'Descricao'
      'Valor'
      'Banco'
      'Agencia'
      'ChequeFinanceiro.Conta as Conta'
      'Talao'
      'Numero'
      'Emissao'
      'Vencimento'
      'Deposito'
      'Compensacao'
      'Cancelamento')
    Tabela = 'ChequeFinanceiro'
    BancodeDados = 'BD'
    Ordernar = 'FormaPg,Banco,Agencia,Conta,Talao,Numero'
    TituloHorizontal.Strings = (
      'FP'
      'Valor'
      'Banco'
      'Agencia'
      'Conta'
      'Talao'
      'Numero'
      'Emissão'
      'Vencimento'
      'Depósito'
      'Compensação'
      'Cancelamento')
    Sql.Strings = (
      'Left Join FormaPg on (FormaPg.Codigo      =  FormaPg)')
    ColunaMarcada = 0
    ColWidths = (
      88
      66
      50
      50
      50
      50
      55
      57
      63
      56
      72
      55)
  end
  object GridCartao: TGridSql
    Left = 0
    Top = 297
    Width = 745
    Height = 89
    ColCount = 13
    DefaultColWidth = 50
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 1
    Limite = 0
    OnGetCellAlignment = GridCartaoGetCellAlignment
    OnGetCellColor = GridChequeGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = False
    Campos.Strings = (
      'FormaPg.Descricao as DescFPag'
      'Valor'
      'ValorOperadora'
      'Valor - ValorOperadora as liguido'
      'Operadora.Descricao as DescOperadora'
      'Numero'
      'Autorizacao'
      'Data'
      'Vencimento'
      'Deposito'
      'Cancelamento'
      'Compensacao'
      'Responsavel')
    Tabela = 'CartaoFinanceiro'
    BancodeDados = 'BD'
    Ordernar = 'FormaPg,Numero,Autorizacao'
    TituloHorizontal.Strings = (
      'FP'
      'Valor'
      'ValorOp.'
      'Líquido'
      'Operadora'
      'Numero'
      'Autorização'
      'Emiss.'
      'Venc.'
      'Deps.'
      'Cancel.'
      'Compensacao'
      'Resp.')
    Sql.Strings = (
      'Left Join FormaPg on (FormaPg.Codigo      =  FormaPg)'
      'Left Join Operadora on (Operadora.Codigo = Operadora)')
    ColunaMarcada = 0
    ColWidths = (
      82
      52
      47
      43
      57
      66
      67
      51
      57
      58
      51
      53
      44)
  end
  object GridDinheiro: TGridSql
    Left = -1
    Top = 108
    Width = 536
    Height = 58
    ColCount = 2
    DefaultColWidth = 50
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 2
    Limite = 0
    OnGetCellAlignment = GridDinheiroGetCellAlignment
    OnGetCellColor = GridChequeGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = False
    Campos.Strings = (
      'Descricao'
      'Valor')
    Tabela = 'OutrosFinanceiro'
    BancodeDados = 'BD'
    Ordernar = 'FormaPg'
    TituloHorizontal.Strings = (
      'FP'
      'Valor')
    Sql.Strings = (
      'Left Join FormaPg on (FormaPg.Codigo      =  FormaPg)')
    ColunaMarcada = 0
    ColWidths = (
      85
      66)
  end
  object GridOutros: TGridSql
    Left = 1
    Top = 399
    Width = 745
    Height = 98
    ColCount = 9
    DefaultColWidth = 50
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 3
    Limite = 0
    OnGetCellAlignment = GridOutrosGetCellAlignment
    OnGetCellColor = GridChequeGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = False
    Campos.Strings = (
      'FormaPg.Descricao as DescFP'
      'Valor'
      'Numero'
      'OutrosFinanceiro.Descricao as Descricao'
      'Emissao'
      'Vencimento'
      'Deposito'
      'Compensacao'
      'Cancelamento')
    Tabela = 'OutrosFinanceiro'
    BancodeDados = 'BD'
    Ordernar = 'FormaPg,Numero'
    TituloHorizontal.Strings = (
      'FP'
      'Valor'
      'Número'
      'Descrição'
      'Emissão'
      'Vencimento'
      'Depósito'
      'Compensação'
      'Cancelamento')
    Sql.Strings = (
      'Left Join FormaPg on (FormaPg.Codigo   =  FormaPg)')
    ColunaMarcada = 0
    ColWidths = (
      81
      66
      66
      72
      60
      60
      57
      75
      74)
  end
  object Panel1: TPanel
    Left = 535
    Top = -1
    Width = 210
    Height = 167
    TabOrder = 4
    object Descricao: TLabel
      Left = 3
      Top = 55
      Width = 40
      Height = 13
      Caption = 'Origem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 3
      Top = 84
      Width = 65
      Height = 13
      Caption = 'Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbOrigem: TLabel
      Left = 5
      Top = 70
      Width = 54
      Height = 13
      Caption = 'LbOrigem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbCliForn: TLabel
      Left = 3
      Top = 29
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NumeroDocumento: TLabel
      Left = 4
      Top = 97
      Width = 108
      Height = 13
      Caption = 'NumeroDocumento'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object NomeCliForn: TLabel
      Left = 46
      Top = 43
      Width = 40
      Height = 13
      Caption = 'CliForn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 3
      Top = 0
      Width = 49
      Height = 13
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbEmpresa: TLabel
      Left = 5
      Top = 14
      Width = 63
      Height = 13
      Caption = 'LbEmpresa'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Codigo: TLabel
      Left = 3
      Top = 42
      Width = 40
      Height = 13
      Caption = 'CliForn'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object BitBtn4: TBitBtn
    Left = 261
    Top = 501
    Width = 156
    Height = 29
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn4Click
    Glyph.Data = {
      66070000424D660700000000000036000000280000001A000000170000000100
      18000000000030070000C30E0000C30E00000000000000000000BEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE9A9A9A7A7A7A2525251D1D1D7F7F
      7F9C9C9CBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE9595956C
      6C6C5858586F6F6FA3A3A37F7F7F4646464242426C6C6C9A9A9ABEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
      BEBEBEBEBEBEAFAFAF494949616161787878B6B6B6B5B5B56969692F2F2F7070
      707676765050504C4C4C494949B6B6B6BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBEBEBEBEBEBE0000BEBEBEB9B9B9B2B2B24D4D4D3A3A3AA1A1A1AEAEAEBB
      BBBB9292929494949494946B6B6B2A2A2A2C2C2C7777777070706B6B6B2C2C2C
      535353B2B2B2BABABABEBEBEBEBEBEBEBEBEBEBEBEBEBEBE0000B5B5B56C6C6C
      3232329B9B9BBDBDBDAFAFAF9F9F9F8F8F8FB5B5B58F8F8FA3A3A37F7F7F7F7F
      7F6D6D6D1F1F1F4343435F5F5F7D7D7D6262622222226C6C6C929292BEBEBEBE
      BEBEBEBEBEBEBEBE0000A5A5A56E6E6EBFBFBFA8A8A8A0A0A09D9D9DAEAEAEBF
      BFBFBBBBBB8F8F8FA3A3A37F7F7F7F7F7F7F7F7F7F7F7F5858583B3B3B424242
      5555557F7F7F5151514040407C7C7CBEBEBEBEBEBEBEBEBE0000B2B2B2878787
      959595A4A4A4ABABABBFBFBFBFBFBFBFBFBFBBBBBB8F8F8FA3A3A37F7F7F7F7F
      7F7F7F7F7F7F7F7F7F7F7F7F7F5555554646462B2B2B646464777777323232BE
      BEBEBEBEBEBEBEBE00008888889B9B9B979797AFAFAFBFBFBFBFBFBFBFBFBFBF
      BFBFBBBBBB909090A6A6A67F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
      7A7A7A6F6F6F3535351A1A1A2D2D2DB4B4B4BEBEBEBEBEBE0000979797E7E7E7
      9B9B9BAFAFAFBFBFBFBFBFBFBFBFBFBFBFBFC9C9C9969696BABABA9191918282
      827F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7979791D1D1D3E
      3E3EAAAAAABEBEBE0000979797E7E7E79B9B9BAFAFAFBFBFBFBFBFBFCFCFCFDF
      DFDFDBDBDB9F9F9F9F9F9F9F9F9F9F9F9F9999997F7F7F7F7F7F7F7F7F7F7F7F
      7F7F7F7F7F7F7F7F7F7F7F7F5F5F5F1E1E1E555555ACACAC0000979797E7E7E7
      9B9B9BAFAFAFC4C4C4EDEDEDDFDFDFD1D1D1C1C1C1BFBFBFB7B7B7ADADAD9696
      96969696ADADAD9393937F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5F5F5F4B
      4B4B7A7A7A3F3F3F0000979797EAEAEA9E9E9ECECECEEBEBEBBDC7BDAACAAA50
      5AD93131EDB7B7B7A4A4A48D8D8DB0B0B0B0B0B0848484969696B1B1B1898989
      8484847F7F7F7F7F7F7F7F7F5F5F5F4F4F4F9898987E7E7E00008F8F8FE0E0E0
      BBBBBB939393A9A9A988BF883BEB3B88BF88A9A9A9939393A6A6A6BFBFBFBFBF
      BF8383836F6F6F757575666666A5A5A5A3A3A39393938585857F7F7F60606042
      4242ADADADBEBEBE0000A0A0A0A1A1A19F9F9FBBBBBBA2A2A29F9F9F9D9D9D88
      8888838383BFBFBFBFBFBF7F7F7F595959878787B4B4B4EEEEEE373737969696
      9F9F9F9D9D9D9F9F9F9E9E9E606060555555BEBEBEBEBEBE0000BEBEBEB8B8B8
      AEAEAE999999969696C0C0C0AFAFAF8E8E8E8080807777772F2F2F898989BFBF
      BFFFDBDBFF3F3FFFABABABABAB414141999999AFAFAF999999919191A6A6A6A3
      A3A3BEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBBBBBBB4B4B48E8E8EA5A5A5B4
      B4B4B8B8B8878787A8A8A8F1F1F1FF5C5CFF5959FFE0E0FFD0D0FCF2F2343434
      7676768D8D8DABABABBABABABEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEAAAAAA979797AAAAAAAEAEAEA5A5A5CFCFCFFFFF
      FFFF9F9FFF8787FF5F5FFFD7D7C7C7C75858589B9B9BBEBEBEBEBEBEBEBEBEBE
      BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEA5A5A5A1A1A1919191A2A2A2F1F1F1FF8F8FFFB9B9FFAEAEFF6F6FFBF2F2
      BDBDBD6161619C9C9CBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBABABAB0B0B0919191C5C5
      C5FFD9D9FF3737FF8888FFC7C7FFFBFBFAFAFAC3C3C34D4D4DABABABBEBEBEBE
      BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBCBCBC969696C8C6C6F8F0F0FFE0E0FFCFCFFF4040
      FF7575FEFEFECFCFCF333333474747BEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BE9C9C9CC3C3C3F5A0A0FF6767FFF5F5F8F8F8DADADAB6B6B69B9B9BA2A2A2BE
      BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB9B9B9A1A1A1C3C3C3F7F7F7DBDBDB
      ACACACA1A1A1A4A4A4BABABABEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBEBEB9B9B99D9D9D949494929292B2B2B2B8B8B8BEBEBEBEBEBEBEBEBEBE
      BEBEBEBEBEBEBEBE0000}
  end
  object BitBtn3: TBitBtn
    Left = 427
    Top = 501
    Width = 156
    Height = 29
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn3Click
    Kind = bkCancel
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 14
    Width = 536
    Height = 82
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'cliforn'
        Title.Caption = 'Cliente'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescCliForn'
        Title.Caption = 'Descrição'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Origem'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Documento'
        Width = 84
        Visible = True
      end>
  end
  object Query1: TQuery
    DatabaseName = 'bd'
    SQL.Strings = (
      'Select distinct'
      'c.cliente as desccliforn'
      ',retclientefornecedor as cliforn'
      ',RETORIGEM as Origem,RETCAIXA as Caixa,RETDOCUMENTO as Documento'
      
        'from RetDocUnidos(:Empresa,:PagRec,:CliForn,:Origem,:caixa,:Doc,' +
        '-1)'
      
        'left join cliente c on (retdocunidos.retclientefornecedor = c.co' +
        'd_cliente)'
      'Order By 1,2,3,4'
      ''
      ''
      ' '
      ' ')
    Left = 672
    Top = 65528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PagRec'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CliForn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Doc'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 648
    Top = 65535
  end
end
