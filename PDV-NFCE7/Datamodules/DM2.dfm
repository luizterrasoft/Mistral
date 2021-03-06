object DMCaixa: TDMCaixa
  OldCreateOrder = False
  Left = 580
  Top = 158
  Height = 305
  Width = 481
  object qInsereItemVenda: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'INSERT INTO'
      'ITENS_VENDAS_LOCAL (IV_LOJA,IV_CAIX,IV_VEND,IV_TIPZ,'
      
        '              IV_GRUP,IV_SUBG,IV_PROD,IV_TAMA,IV_CORE,IV_QTDE,IV' +
        '_PVEN,'
      '              IV_TOTA,IV_OTAM,IV_MODO,IV_SEQ,IV_VEDE,IV_DATA,'
      
        '              IV_PCUS,IV_PAQU,IV_UPCU,IV_DESC,IV_PDES,IV_ACRE,IV' +
        '_PACR,IV_STAT)'
      'VALUES (:IV_LOJA,:IV_CAIX,:IV_VEND,:IV_TIPZ,'
      
        '              :IV_GRUP,:IV_SUBG,:IV_PROD,:IV_TAMA,:IV_CORE,:IV_Q' +
        'TDE,:IV_PVEN,'
      
        '              :IV_TOTA,:IV_OTAM,:IV_MODO,:IV_SEQ,:IV_VEDE,:IV_DA' +
        'TA,'
      
        '              :IV_PCUS,:IV_PAQU,:IV_UPCU,:IV_DESC,:IV_PDES,:IV_A' +
        'CRE,:IV_PACR,:IV_STAT)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 80
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IV_LOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_CAIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_VEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IV_TIPZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_GRUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_SUBG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IV_TAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_CORE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_QTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_TOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IV_OTAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IV_MODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IV_SEQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_VEDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'IV_DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PCUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PAQU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_UPCU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_DESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_PDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_ACRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_PACR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_STAT'
        ParamType = ptUnknown
      end>
  end
  object qAlteraItemVenda: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'UPDATE ITENS_VENDAS_LOCAL'
      'SET    IV_QTDE=IV_QTDE + :IV_QTDE,'
      '       IV_TOTA=IV_TOTA + :IV_TOTA,'
      '       IV_PVEN=:IV_PVEN  '
      'WHERE (IV_LOJA=:IV_LOJA) AND'
      '      (IV_CAIX=:IV_CAIX) AND'
      '      (IV_VEND=:IV_VEND) AND'
      '      (IV_GRUP=:IV_GRUP) AND'
      '      (IV_SUBG=:IV_SUBG) AND'
      '      (IV_PROD=:IV_PROD) AND'
      '      (IV_TAMA=:IV_TAMA) AND'
      '      (IV_CORE=:IV_CORE)'
      ' '
      ' '
      ' '
      ' ')
    Left = 80
    Top = 40
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IV_QTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_TOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_LOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_CAIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_VEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_GRUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_SUBG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IV_TAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_CORE'
        ParamType = ptUnknown
      end>
  end
  object qInsereItemVenda_real: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'INSERT INTO'
      'ITENS_VENDAS (IV_LOJA,IV_CAIX,IV_VEND,IV_TIPZ,'
      
        '              IV_GRUP,IV_SUBG,IV_PROD,IV_TAMA,IV_CORE,IV_QTDE,IV' +
        '_PVEN,'
      '              IV_TOTA,IV_OTAM,IV_MODO,IV_SEQ,IV_VEDE,IV_DATA,'
      
        '              IV_PCUS,IV_PAQU,IV_UPCU,IV_QTDR,IV_HORA,IV_DESC,IV' +
        '_PDES,IV_ACRE,IV_PACR,IV_STAT)'
      'VALUES (:IV_LOJA,:IV_CAIX,:IV_VEND,:IV_TIPZ,'
      
        '              :IV_GRUP,:IV_SUBG,:IV_PROD,:IV_TAMA,:IV_CORE,:IV_Q' +
        'TDE,:IV_PVEN,'
      
        '              :IV_TOTA,:IV_OTAM,:IV_MODO,:IV_SEQ,:IV_VEDE,:IV_DA' +
        'TA,'
      
        '              :IV_PCUS,:IV_PAQU,:IV_UPCU,:IV_QTDR,:IV_HORA,:IV_D' +
        'ESC,:IV_PDES,:IV_ACRE,:IV_PACR,:IV_STAT)'
      ' '
      ' '
      ' '
      ' ')
    Left = 80
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IV_LOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_CAIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_VEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IV_TIPZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_GRUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_SUBG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IV_TAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_CORE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_QTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_TOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IV_OTAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IV_MODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IV_SEQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_VEDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'IV_DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PCUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_PAQU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_UPCU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IV_QTDR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_HORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_DESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_PDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_ACRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_PACR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IV_STAT'
        ParamType = ptUnknown
      end>
  end
  object qInsereMovimento: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      
        'INSERT INTO MOVIMENTO (MO_SEQ,MO_GRUP,MO_SUBG,MO_PROD,MO_LOJA,MO' +
        '_CORE,'
      '                       MO_TAMA,MO_NPED,MO_DATA,MO_PCU1,MO_PVE1,'
      
        '                       MO_TIPO,MO_MODE,MO_ENTR,MO_NOTA,MO_QTD1,M' +
        'O_TIPZ,'
      '                       MO_FORN,MO_OTAM,MO_QTDR,MO_CLIE)'
      'VALUES (:MO_SEQ,:MO_GRUP,:MO_SUBG,:MO_PROD,:MO_LOJA,:MO_CORE,'
      
        '                       :MO_TAMA,:MO_NPED,:MO_DATA,:MO_PCU1,:MO_P' +
        'VE1,'
      
        '                       :MO_TIPO,:MO_MODE,:MO_ENTR,:MO_NOTA,:MO_Q' +
        'TD1,:MO_TIPZ,'
      '                       :MO_FORN,:MO_OTAM,:MO_QTDR,:MO_CLIE)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 208
    Top = 40
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MO_SEQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_GRUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_SUBG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_LOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_CORE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MO_TAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_NPED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'MO_DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_PCU1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_PVE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MO_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_MODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MO_ENTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MO_NOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_QTD1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MO_TIPZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MO_FORN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MO_OTAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MO_QTDR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MO_CLIE'
        ParamType = ptUnknown
      end>
  end
  object qDiminueSaldo: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'UPDATE ESTOQUE_LOJA'
      'SET        EL_QTD1=COALESCE(EL_QTD1,0) - :qtd1,'
      '               EL_QTD2=COALESCE(EL_QTD2,0)- :qtd2,'
      '               EL_TIME=:time'
      'WHERE (EL_GRUP=:grupo) AND'
      '               (EL_SUBG=:subgrupo) AND'
      '               (EL_PROD=:produto) AND'
      '               (EL_LOJA=:loja) AND'
      '               (EL_CORE=:cor) AND'
      '               (EL_TAMA=:tamanho)'
      ''
      ''
      ''
      '              '
      ''
      '               '
      ' ')
    Left = 208
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'qtd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'qtd2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'time'
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
        DataType = ftFloat
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'cor'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tamanho'
        ParamType = ptUnknown
      end>
  end
  object qAumentaSaldo: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'UPDATE ESTOQUE_LOJA'
      'SET        EL_QTD1=COALESCE(EL_QTD1,0)+ :qtd1,'
      '               EL_QTD2=COALESCE(EL_QTD2,0) + :qtd2,'
      '               EL_TIME=:time'
      'WHERE (EL_GRUP=:grupo) AND'
      '               (EL_SUBG=:subgrupo) AND'
      '               (EL_PROD=:produto) AND'
      '               (EL_LOJA=:loja) AND'
      '               (EL_CORE=:cor) AND'
      '               (EL_TAMA=:tamanho) '
      ''
      ''
      '              '
      ''
      '               '
      ' ')
    Left = 208
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'qtd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'qtd2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'time'
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
        DataType = ftFloat
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'cor'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tamanho'
        ParamType = ptUnknown
      end>
  end
  object qInsereItemAtendimento: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'INSERT INTO'
      
        'ITENS_ATDO_LOCAL (IA_LOJA,IA_CAIX,IA_VEND,IA_GRUP,IA_SUBG,IA_PRO' +
        'D,IA_TAMA,IA_CORE,IA_QTDE,IA_PVEN,'
      '              IA_TOTA,IA_OTAM,IA_MODO,IA_SEQ)'
      
        'VALUES (:IA_LOJA,:IA_CAIX,:IA_VEND,:IA_GRUP,:IA_SUBG,:IA_PROD,:I' +
        'A_TAMA,:IA_CORE,:IA_QTDE,:IA_PVEN,'
      '              :IA_TOTA,:IA_OTAM,:IA_MODO,:IA_SEQ)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 360
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IA_LOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_CAIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_VEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_GRUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_SUBG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_TAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_CORE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_QTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_PVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_TOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_OTAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_MODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_SEQ'
        ParamType = ptUnknown
      end>
  end
  object qAlteraItemAtendimento: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'UPDATE ITENS_ATDO_LOCAL'
      'SET    IA_QTDE=IA_QTDE + :IA_QTDE,'
      '       IA_TOTA=IA_TOTA + :IA_TOTA,'
      '       IA_PVEN=:IA_PVEN  '
      'WHERE (IA_LOJA=:IA_LOJA) AND'
      '      (IA_CAIX=:IA_CAIX) AND'
      '      (IA_VEND=:IA_VEND) AND'
      '      (IA_GRUP=:IA_GRUP) AND'
      '      (IA_SUBG=:IA_SUBG) AND'
      '      (IA_PROD=:IA_PROD) AND'
      '      (IA_TAMA=:IA_TAMA) AND'
      '      (IA_CORE=:IA_CORE)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 360
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IA_QTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_TOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_PVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_LOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_CAIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_VEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_GRUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_SUBG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_TAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_CORE'
        ParamType = ptUnknown
      end>
  end
  object qInsereItemAtendimento_real: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'INSERT INTO'
      
        'ITENS_ATENDIMENTO (IA_LOJA,IA_CAIX,IA_VEND,IA_GRUP,IA_SUBG,IA_PR' +
        'OD,IA_TAMA,IA_CORE,IA_QTDE,IA_PVEN,'
      '              IA_TOTA,IA_OTAM,IA_MODO,IA_SEQ)'
      
        'VALUES (:IA_LOJA,:IA_CAIX,:IA_VEND,:IA_GRUP,:IA_SUBG,:IA_PROD,:I' +
        'A_TAMA,:IA_CORE,:IA_QTDE,:IA_PVEN,'
      '              :IA_TOTA,:IA_OTAM,:IA_MODO,:IA_SEQ)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 360
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IA_LOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_CAIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_VEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_GRUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_SUBG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_TAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_CORE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_QTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_PVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_TOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_OTAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_MODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IA_SEQ'
        ParamType = ptUnknown
      end>
  end
end
