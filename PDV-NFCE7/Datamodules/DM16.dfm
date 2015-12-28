object DMmaxicod: TDMmaxicod
  OldCreateOrder = False
  Left = 152
  Top = 85
  Height = 391
  Width = 323
  object spMaxiCod_credito_1: TStoredProc
    DatabaseName = 'CREDITO'
    StoredProcName = 'MAXI_COD'
    Left = 78
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROXCOD'
        ParamType = ptOutput
        Value = Null
      end>
  end
  object spMaxiCod_credito_2: TStoredProc
    DatabaseName = 'CREDITO'
    StoredProcName = 'MAXI_COD;1'
    Left = 213
    Top = 41
    ParamData = <
      item
        DataType = ftString
        Name = '@tabela'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@codigo'
        ParamType = ptOutput
        Value = 0
      end>
  end
  object spMaxiCod_vendas_1: TStoredProc
    DatabaseName = 'VENDAS'
    StoredProcName = 'MAXI_COD'
    Left = 80
    Top = 111
    ParamData = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROXCOD'
        ParamType = ptOutput
        Value = Null
      end>
  end
  object spMaxiCod_vendas_2: TStoredProc
    DatabaseName = 'VENDAS'
    StoredProcName = 'MAXI_COD;1'
    Left = 216
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = '@tabela'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@codigo'
        ParamType = ptOutput
        Value = 0
      end>
  end
  object spMaxiCod_estoque_2: TStoredProc
    DatabaseName = 'ESTOQUE'
    StoredProcName = 'MAXI_COD;1'
    Left = 214
    Top = 181
    ParamData = <
      item
        DataType = ftString
        Name = '@tabela'
        ParamType = ptInput
      end>
  end
  object spMaxiCod_estoque_1: TStoredProc
    DatabaseName = 'ESTOQUE'
    StoredProcName = 'MAXI_COD'
    Left = 78
    Top = 183
    ParamData = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROXCOD'
        ParamType = ptOutput
        Value = Null
      end>
  end
  object spMaxiCod_contaspagar_2: TStoredProc
    DatabaseName = 'CONTASPAGAR'
    StoredProcName = 'MAXI_COD;1'
    Left = 79
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@tabela'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@codigo'
        ParamType = ptInputOutput
      end>
  end
  object spMaxiCod_contaspagar_1: TStoredProc
    DatabaseName = 'CONTASPAGAR'
    StoredProcName = 'MAXI_COD'
    Left = 215
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROXCOD'
        ParamType = ptOutput
        Value = Null
      end>
  end
end
