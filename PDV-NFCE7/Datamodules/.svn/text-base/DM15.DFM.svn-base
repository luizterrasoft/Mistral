object DMRelatorios: TDMRelatorios
  OldCreateOrder = False
  Left = 85
  Top = 68
  Height = 394
  Width = 593
  object qConfMovDig: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select CR_CODI,CR_CLIE,CR_PLAN,CR_TOTA,CR_VENT,CR_LOJA,CR_DNOT,'
      '       PC_NPRE,PC_DVTO,PC_VALO,CR_TOT2'
      'From   CRECTABR,CREPRABR'
      'Where (CR_PLAN>=:plano1)   AND'
      '      (CR_PLAN<=:plano2)   AND'
      '      (CR_DNOT>=:data1)    AND'
      '      (CR_DNOT<=:data2)    AND'
      '      (CR_LOJA>=:loja1)    AND'
      '      (CR_LOJA<=:loja2)    AND'
      '      (CR_CLIE=PC_CLIE)    AND'
      '      (CR_CODI=PC_CONT)'
      'Order By CR_LOJA,CR_DNOT,CR_CLIE,CR_CODI,PC_NPRE'
      ' '
      ' ')
    Left = 64
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'plano1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'plano2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'data2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja2'
        ParamType = ptUnknown
      end>
  end
  object qListaContratosSemCarnet: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select CR_CODI,CR_CLIE,CR_PLAN,CR_TOTA,CR_VENT,CR_LOJA,CR_DNOT,'
      '       PC_NPRE,PC_DVTO,PC_VALO'
      'From   CRECTABR,CREPRABR,CREDPLANO'
      'Where (CR_PLAN>=:plano1)   AND'
      '      (CR_PLAN<=:plano2)   AND'
      '      (CR_DNOT>=:data1)    AND'
      '      (CR_DNOT<=:data2)    AND'
      '      (CR_LOJA>=:loja1)    AND'
      '      (CR_LOJA<=:loja2)    AND'
      '      (CR_CLIE=PC_CLIE)    AND (CR_CODI=PC_CONT) AND'
      '      (CR_PLAN=PL_CODI)    AND'
      '      (PL_CARN='#39'1'#39')        AND'
      '      (CR_CARN='#39'0'#39')'
      'Order By CR_LOJA,CR_DNOT,CR_CLIE,CR_CODI,PC_NPRE'
      ' '
      ' '
      ' ')
    Left = 64
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'plano1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'plano2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'data2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja2'
        ParamType = ptUnknown
      end>
  end
  object qResumoConfMovDig: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select CR_LOJA,SUM(CR_TOTA + CR_VENT) as TOTCONT,'
      '               SUM(CR_VENT) as TOTENT,'
      '               COUNT(*) as QTDE,'
      '               SUM(CR_TOT2) as TOTFINANC'
      'From   CRECTABR'
      'Where (CR_PLAN>=:plano1)   AND'
      '      (CR_PLAN<=:plano2)   AND'
      '      (CR_DNOT>=:data1)    AND'
      '      (CR_DNOT<=:data2)    AND'
      '      (CR_LOJA>=:loja1)    AND'
      '      (CR_LOJA<=:loja2)'
      'Group By CR_LOJA'
      ' '
      ' '
      ' '
      ' ')
    Left = 184
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'plano1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'plano2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'data2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja2'
        ParamType = ptUnknown
      end>
  end
  object qResumoDiarEmiCont: TQuery
    DatabaseName = 'CREDITO'
    Left = 320
    Top = 32
  end
  object qResumoDiarPrestAVenc: TQuery
    DatabaseName = 'CREDITO'
    Left = 64
    Top = 160
  end
end
