object DMNFE: TDMNFE
  OldCreateOrder = False
  Left = 246
  Top = 124
  Height = 365
  Width = 441
  object qCFOPF8: TQuery
    DatabaseName = 'VENDAS'
    SQL.Strings = (
      'SELECT CFOP, DESCRICAO'
      'FROM CFOP'
      'ORDER BY CFOP')
    Left = 56
    Top = 56
  end
  object qCSOSNF8: TQuery
    DatabaseName = 'VENDAS'
    Left = 56
    Top = 112
  end
  object qCSTPISF8: TQuery
    DatabaseName = 'VENDAS'
    Left = 56
    Top = 176
  end
  object qCSTIPIF8: TQuery
    DatabaseName = 'VENDAS'
    Left = 216
    Top = 56
  end
  object qCSTCOFINSF8: TQuery
    DatabaseName = 'VENDAS'
    Left = 216
    Top = 120
  end
  object Query6: TQuery
    DatabaseName = 'VENDAS'
    Left = 216
    Top = 184
  end
end
