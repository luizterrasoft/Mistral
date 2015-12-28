object DMLancamentos: TDMLancamentos
  OldCreateOrder = False
  Left = 212
  Top = 146
  Height = 269
  Width = 367
  object qAlteraSaldoTipz: TQuery
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'UPDATE LANCAMENTOS_CONTA_CAIXA'
      'SET LA_SAL2=:saldo_atual, LA_SAA2=:saldo_anterior'
      'WHERE (LA_SEQ=:seq)')
    Left = 112
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'saldo_atual'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'saldo_anterior'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'seq'
        ParamType = ptUnknown
      end>
  end
  object qAlteraSaldo: TQuery
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'UPDATE LANCAMENTOS_CONTA_CAIXA'
      'SET LA_SALD=:saldo_atual, LA_SALA=:saldo_anterior'
      'WHERE  (LA_SEQ=:seq)')
    Left = 216
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'saldo_atual'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'saldo_anterior'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'seq'
        ParamType = ptUnknown
      end>
  end
end
