object DMF8: TDMF8
  OldCreateOrder = False
  Height = 570
  Width = 781
  object qGruposProdutosF8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT GR_CODI,GR_DESC'
      'FROM    GRUPOS_PRODUTOS'
      'ORDER BY GR_DESC')
    Left = 56
    Top = 33
    object qGruposProdutosF8GR_CODI: TFloatField
      FieldName = 'GR_CODI'
      Origin = 'ESTOQUE.GRUPOS_PRODUTOS.GR_CODI'
    end
    object qGruposProdutosF8GR_DESC: TStringField
      FieldName = 'GR_DESC'
      Origin = 'ESTOQUE.GRUPOS_PRODUTOS.GR_DESC'
    end
  end
  object qSubGruposF8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT SG_GRUP,SG_CODI,SG_DESC'
      'FROM    SUBGRUPOS_PRODUTOS'
      'ORDER BY SG_DESC')
    Left = 56
    Top = 88
    object qSubGruposF8SG_GRUP: TFloatField
      FieldName = 'SG_GRUP'
      Origin = 'ESTOQUE.SUBGRUPOS_PRODUTOS.SG_GRUP'
    end
    object qSubGruposF8SG_CODI: TFloatField
      FieldName = 'SG_CODI'
      Origin = 'ESTOQUE.SUBGRUPOS_PRODUTOS.SG_CODI'
    end
    object qSubGruposF8SG_DESC: TStringField
      FieldName = 'SG_DESC'
      Origin = 'ESTOQUE.SUBGRUPOS_PRODUTOS.SG_DESC'
    end
  end
  object qProdutos2F8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT PR_GRUP,PR_SUBG,PR_CODI,PR_DESC,PR_REFI,'
      '               PR_TUNI,PR_CUNI'
      'FROM PRODUTOS'
      'WHERE (PR_GRUP=:grupo) AND'
      '               (PR_SUBG=:subgrupo)'
      'ORDER BY PR_DESC')
    Left = 56
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subgrupo'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'PR_GRUP'
      Origin = 'ESTOQUE.PRODUTOS.PR_GRUP'
    end
    object FloatField3: TFloatField
      FieldName = 'PR_SUBG'
      Origin = 'ESTOQUE.PRODUTOS.PR_SUBG'
    end
    object FloatField4: TFloatField
      FieldName = 'PR_CODI'
      Origin = 'ESTOQUE.PRODUTOS.PR_CODI'
    end
    object StringField2: TStringField
      FieldName = 'PR_DESC'
      Origin = 'ESTOQUE.PRODUTOS.PR_DESC'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'PR_REFI'
      Origin = 'ESTOQUE.PRODUTOS.PR_REFI'
      Size = 10
    end
    object StringField4: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTUNI'
      Size = 10
      Calculated = True
    end
    object StringField5: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCUNI'
      Size = 10
      Calculated = True
    end
    object StringField6: TStringField
      FieldName = 'PR_TUNI'
      Origin = 'ESTOQUE.PRODUTOS.PR_TUNI'
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'PR_CUNI'
      Origin = 'ESTOQUE.PRODUTOS.PR_CUNI'
      Size = 1
    end
  end
  object qFaixasF8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'Select   PF_GRUP,PF_SUBG,PF_PROD,PF_TAMA,PF_SEQ'
      'From     PRODUTOS_FAIXAS'
      'Where  (PF_GRUP=:grupo) AND '
      '             (PF_SUBG=:subgrupo) AND'
      '             (PF_PROD=:produto)'
      'Order by PF_ORDE')
    Left = 55
    Top = 208
    ParamData = <
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
      end>
    object qFaixasF8PF_GRUP: TFloatField
      FieldName = 'PF_GRUP'
      Origin = 'ESTOQUE.PRODUTOS_FAIXAS.PF_GRUP'
    end
    object qFaixasF8PF_SUBG: TFloatField
      FieldName = 'PF_SUBG'
      Origin = 'ESTOQUE.PRODUTOS_FAIXAS.PF_SUBG'
    end
    object qFaixasF8PF_PROD: TFloatField
      FieldName = 'PF_PROD'
      Origin = 'ESTOQUE.PRODUTOS_FAIXAS.PF_PROD'
    end
    object qFaixasF8PF_TAMA: TStringField
      FieldName = 'PF_TAMA'
      Origin = 'ESTOQUE.PRODUTOS_FAIXAS.PF_TAMA'
      Size = 5
    end
    object qFaixasF8PF_SEQ: TIntegerField
      FieldName = 'PF_SEQ'
      Origin = 'ESTOQUE.PRODUTOS_FAIXAS.PF_SEQ'
    end
  end
  object qCoresF8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT CR_CODI,CR_DESC'
      'FROM CORES'
      'ORDER BY CR_DESC')
    Left = 280
    Top = 216
    object qCoresF8CR_CODI: TFloatField
      FieldName = 'CR_CODI'
      Origin = 'ESTOQUE.CORES.CR_CODI'
    end
    object qCoresF8CR_DESC: TStringField
      FieldName = 'CR_DESC'
      Origin = 'ESTOQUE.CORES.CR_DESC'
      Size = 30
    end
    object qCoresF8cSORT: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSORT'
      Calculated = True
    end
  end
  object qVendF8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'Select  VD_CODI,VD_NOME,VD_CARG'
      'From     VENDEDORES'
      'Where  (VD_CODI<>-1) AND (VD_CARG='#39'VENDEDOR COMUM'#39')'
      'Order By VD_NOME'
      ' ')
    Left = 151
    Top = 272
    object qVendF8VD_CODI: TFloatField
      FieldName = 'VD_CODI'
      Origin = 'ESTOQUE.VENDEDORES.VD_CODI'
      DisplayFormat = '000000'
    end
    object qVendF8VD_NOME: TStringField
      FieldName = 'VD_NOME'
      Origin = 'ESTOQUE.VENDEDORES.VD_NOME'
      Size = 40
    end
    object qVendF8VD_CARG: TStringField
      FieldName = 'VD_CARG'
      Origin = 'ESTOQUE.VENDEDORES.VD_CARG'
      Size = 30
    end
  end
  object qFornF8: TQuery
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'Select   FO_CODI,FO_RAZA,FO_NFAN'
      'From     FORNECEDORES'
      'Where  (FO_CODI<>-1)'
      'Order By FO_CODI')
    Left = 399
    Top = 368
    object qFornF8FO_CODI: TFloatField
      FieldName = 'FO_CODI'
      Origin = 'CONTASPAGAR.FORNECEDORES.FO_CODI'
    end
    object qFornF8FO_RAZA: TStringField
      FieldName = 'FO_RAZA'
      Origin = 'CONTASPAGAR.FORNECEDORES.FO_RAZA'
      Size = 40
    end
    object qFornF8FO_NFAN: TStringField
      FieldName = 'FO_NFAN'
      Origin = 'CONTASPAGAR.FORNECEDORES.FO_NFAN'
      Size = 30
    end
  end
  object qFormaPgtoF8: TQuery
    OnCalcFields = qFormaPgtoF8CalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT FO_CODI,FO_DESC'
      'FROM FORMAS_PAGAMENTO'
      'WHERE (FO_CODI<=6) OR (FO_CODI=8)'
      'ORDER BY FO_CODI'
      ' ')
    Left = 240
    Top = 336
    object qFormaPgtoF8FO_CODI: TFloatField
      FieldName = 'FO_CODI'
      Origin = 'CAIXA.FORMAS_PAGAMENTO.FO_CODI'
    end
    object qFormaPgtoF8FO_DESC: TStringField
      FieldName = 'FO_DESC'
      Origin = 'CAIXA.FORMAS_PAGAMENTO.FO_DESC'
      Size = 30
    end
    object qFormaPgtoF8cOK: TStringField
      FieldKind = fkCalculated
      FieldName = 'cOK'
      Calculated = True
    end
  end
  object qAdmF8: TQuery
    OnCalcFields = qAdmF8CalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT AM_CODI,AM_DESC,AM_PARC,AM_TIPO,AL_LOJA'
      'FROM ADMINISTRADORAS,ADMINISTRADORAS_LOJAS'
      'WHERE (AM_CODI=AL_CADM) AND (AL_LOJA=:loja) AND (AM_TIPO=:tipo)'
      'ORDER BY AM_CODI'
      ' ')
    Left = 157
    Top = 33
    ParamData = <
      item
        DataType = ftFloat
        Name = 'loja'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptUnknown
      end>
    object qAdmF8AM_CODI: TFloatField
      FieldName = 'AM_CODI'
      Origin = 'ESTOQUE.ADMINISTRADORAS.AM_CODI'
    end
    object qAdmF8AM_DESC: TStringField
      FieldName = 'AM_DESC'
      Origin = 'ESTOQUE.ADMINISTRADORAS.AM_DESC'
      Size = 40
    end
    object qAdmF8AM_PARC: TStringField
      FieldName = 'AM_PARC'
      Origin = 'ESTOQUE.ADMINISTRADORAS.AM_PARC'
      Size = 1
    end
    object qAdmF8cAM_PARC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cAM_PARC'
      Size = 3
      Calculated = True
    end
    object qAdmF8AM_TIPO: TSmallintField
      FieldName = 'AM_TIPO'
      Origin = 'ESTOQUE.ADMINISTRADORAS.AM_TIPO'
    end
    object qAdmF8AL_LOJA: TFloatField
      FieldName = 'AL_LOJA'
      Origin = 'ESTOQUE.ADMINISTRADORAS_LOJAS.AL_LOJA'
    end
  end
  object qPlanoF8: TQuery
    OnCalcFields = qPlanoF8CalcFields
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select *'
      'From CREDPLANO'
      'Where (PL_CODI<>-1)'
      'Order by PL_CODI')
    Left = 504
    Top = 48
    object qPlanoF8PL_CODI: TFloatField
      FieldName = 'PL_CODI'
      Origin = 'CREDITO.CREDPLANO.PL_CODI'
    end
    object qPlanoF8PL_TIPO: TStringField
      FieldName = 'PL_TIPO'
    end
    object qPlanoF8PL_QTPR: TFloatField
      FieldName = 'PL_QTPR'
    end
    object qPlanoF8PL_CARN: TStringField
      FieldName = 'PL_CARN'
      Size = 1
    end
    object qPlanoF8PL_BOLE: TStringField
      FieldName = 'PL_BOLE'
      Size = 1
    end
    object qPlanoF8PL_BAIX: TStringField
      FieldName = 'PL_BAIX'
      Size = 1
    end
    object qPlanoF8PL_CART: TStringField
      FieldName = 'PL_CART'
      Size = 1
    end
    object qPlanoF8PL_CHEQ: TStringField
      FieldName = 'PL_CHEQ'
      Size = 1
    end
    object qPlanoF8PL_LOCA: TStringField
      FieldName = 'PL_LOCA'
      Size = 1
    end
    object qPlanoF8carn: TStringField
      FieldKind = fkCalculated
      FieldName = 'carn'
      Calculated = True
    end
    object qPlanoF8bole: TStringField
      FieldKind = fkCalculated
      FieldName = 'bole'
      Calculated = True
    end
    object qPlanoF8baix: TStringField
      FieldKind = fkCalculated
      FieldName = 'baix'
      Calculated = True
    end
    object qPlanoF8cart: TStringField
      FieldKind = fkCalculated
      FieldName = 'cart'
      Calculated = True
    end
    object qPlanoF8cheq: TStringField
      FieldKind = fkCalculated
      FieldName = 'cheq'
      Calculated = True
    end
    object qPlanoF8loca: TStringField
      FieldKind = fkCalculated
      FieldName = 'loca'
      Calculated = True
    end
  end
  object qLojaF8: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select  LO_CODI,LO_NOME'
      'From    CRELOJA'
      'Where (LO_CODI<>-1) AND (LO_FF8E='#39'1'#39')'
      'Order by LO_CODI')
    Left = 440
    Top = 48
    object qLojaF8LO_CODI: TFloatField
      FieldName = 'LO_CODI'
      Origin = 'CREDITO.CRELOJA.LO_CODI'
    end
    object qLojaF8LO_NOME: TStringField
      FieldName = 'LO_NOME'
      Size = 40
    end
  end
  object qSitF8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT SI_CODI,SI_DESC'
      'FROM SITUACOES_CAIXA'
      'ORDER BY SI_CODI')
    Left = 240
    Top = 32
    object qSitF8SI_CODI: TStringField
      FieldName = 'SI_CODI'
      Origin = 'CAIXA.SITUACOES_CAIXA.SI_CODI'
      Size = 1
    end
    object qSitF8SI_DESC: TStringField
      FieldName = 'SI_DESC'
      Origin = 'CAIXA.SITUACOES_CAIXA.SI_DESC'
      Size = 30
    end
  end
  object qUsersF8: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select USCODE,USNAME'
      'From   USERS'
      'Where (USCODE<>-1)'
      'Order by USCODE')
    Left = 440
    Top = 112
    object qUsersF8USCODE: TFloatField
      FieldName = 'USCODE'
    end
    object qUsersF8USNAME: TStringField
      FieldName = 'USNAME'
      Size = 40
    end
  end
  object qClientesF8: TQuery
    OnCalcFields = qClientesF8CalcFields
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select  CL_CODI,CL_NOME,CL_ENDE,CL_BAIR,CL_CPF,CL_DTNA,'
      '            CL_IDEN'
      'From    CRECLI'
      'Where  (CL_CODI<>-1)'
      'Order by CL_CODI')
    Left = 504
    Top = 112
    object qClientesF8CL_CODI: TFloatField
      FieldName = 'CL_CODI'
    end
    object qClientesF8CL_NOME: TStringField
      FieldName = 'CL_NOME'
      Size = 40
    end
    object qClientesF8CL_ENDE: TStringField
      FieldName = 'CL_ENDE'
      Origin = 'CREDITO.CRECLI.CL_ENDE'
      Size = 50
    end
    object qClientesF8CL_BAIR: TStringField
      FieldName = 'CL_BAIR'
      Origin = 'CREDITO.CRECLI.CL_BAIR'
      Size = 30
    end
    object qClientesF8CL_CPF: TStringField
      FieldName = 'CL_CPF'
      Origin = 'CREDITO.CRECLI.CL_CPF'
      Size = 14
    end
    object qClientesF8CL_DTNA: TDateTimeField
      FieldName = 'CL_DTNA'
      Origin = 'CREDITO.CRECLI.CL_DTNA'
    end
    object qClientesF8CL_IDEN: TStringField
      FieldName = 'CL_IDEN'
      Origin = 'CREDITO.CRECLI.CL_IDEN'
      Size = 25
    end
    object qClientesF8cCL_CPF: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCL_CPF'
      Calculated = True
    end
  end
  object qBancosF8: TQuery
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'Select  BA_CODI,BA_NOME'
      'From     BANCOS'
      'Where  (BA_CODI<>-1)'
      'Order By BA_CODI')
    Left = 401
    Top = 304
    object qBancosF8BA_CODI: TFloatField
      FieldName = 'BA_CODI'
      Origin = 'CONTASPAGAR.BANCOS.BA_CODI'
    end
    object qBancosF8BA_NOME: TStringField
      FieldName = 'BA_NOME'
      Origin = 'CONTASPAGAR.BANCOS.BA_NOME'
      Size = 40
    end
  end
  object qConsultaProdutos2: TQuery
    AfterOpen = qConsultaProdutos2AfterOpen
    AfterClose = qConsultaProdutos2AfterClose
    AfterScroll = qConsultaProdutos2AfterScroll
    OnCalcFields = qConsultaProdutos2CalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,'
      
        '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,E' +
        'S_IAT,PR_NCM'
      'FROM PRODUTOS,ESTOQUE'
      'WHERE (ES_GRUP=PR_GRUP) AND'
      '     (ES_SUBG=PR_SUBG) AND'
      '     (ES_PROD=PR_CODI)'
      'ORDER BY PR_DESC,ES_CORE,ES_OTAM'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 56
    Top = 384
    object StringField12: TStringField
      FieldKind = fkCalculated
      FieldName = 'nomeForn'
      Size = 50
      Calculated = True
    end
    object StringField13: TStringField
      FieldKind = fkCalculated
      FieldName = 'grupo'
      Calculated = True
    end
    object StringField14: TStringField
      FieldKind = fkCalculated
      FieldName = 'subgrupo'
      Calculated = True
    end
    object StringField15: TStringField
      FieldKind = fkCalculated
      FieldName = 'produto'
      Calculated = True
    end
    object StringField18: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCor'
      Calculated = True
    end
    object StringField19: TStringField
      FieldKind = fkCalculated
      FieldName = 'cBarra'
      Calculated = True
    end
    object StringField23: TStringField
      FieldKind = fkCalculated
      FieldName = 'cPCusto'
      Calculated = True
    end
    object StringField20: TStringField
      FieldKind = fkCalculated
      FieldName = 'cPVenda'
      Calculated = True
    end
    object StringField21: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTam'
      Calculated = True
    end
    object StringField22: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_produto'
      Size = 70
      Calculated = True
    end
    object qConsultaProdutos2PR_GRUP: TFloatField
      FieldName = 'PR_GRUP'
      Origin = 'ESTOQUE.PRODUTOS.PR_GRUP'
    end
    object qConsultaProdutos2PR_SUBG: TFloatField
      FieldName = 'PR_SUBG'
      Origin = 'ESTOQUE.PRODUTOS.PR_SUBG'
    end
    object qConsultaProdutos2PR_FORN: TFloatField
      FieldName = 'PR_FORN'
      Origin = 'ESTOQUE.PRODUTOS.PR_FORN'
    end
    object qConsultaProdutos2PR_DESC: TStringField
      FieldName = 'PR_DESC'
      Origin = 'ESTOQUE.PRODUTOS.PR_DESC'
      Size = 60
    end
    object qConsultaProdutos2PR_REFI: TStringField
      FieldName = 'PR_REFI'
      Origin = 'ESTOQUE.PRODUTOS.PR_REFI'
      Size = 12
    end
    object qConsultaProdutos2PR_REFF: TStringField
      FieldName = 'PR_REFF'
      Origin = 'ESTOQUE.PRODUTOS.PR_REFF'
      Size = 15
    end
    object qConsultaProdutos2PR_CODI: TFloatField
      FieldName = 'PR_CODI'
      Origin = 'ESTOQUE.PRODUTOS.PR_CODI'
    end
    object qConsultaProdutos2ES_CORE: TFloatField
      FieldName = 'ES_CORE'
      Origin = 'ESTOQUE.ESTOQUE.ES_CORE'
    end
    object qConsultaProdutos2ES_TAMA: TStringField
      FieldName = 'ES_TAMA'
      Origin = 'ESTOQUE.ESTOQUE.ES_TAMA'
      Size = 5
    end
    object qConsultaProdutos2ES_OTAM: TSmallintField
      FieldName = 'ES_OTAM'
      Origin = 'ESTOQUE.ESTOQUE.ES_OTAM'
    end
    object qConsultaProdutos2ES_CBAR: TStringField
      FieldName = 'ES_CBAR'
      Origin = 'ESTOQUE.ESTOQUE.ES_CBAR'
      Size = 14
    end
    object qConsultaProdutos2ES_IPPT: TStringField
      FieldName = 'ES_IPPT'
    end
    object qConsultaProdutos2ES_SITR: TStringField
      FieldName = 'ES_SITR'
    end
    object qConsultaProdutos2PR_UNID: TStringField
      FieldName = 'PR_UNID'
    end
    object qConsultaProdutos2ES_IAT: TStringField
      FieldName = 'ES_IAT'
    end
    object qConsultaProdutos2PR_NCM: TStringField
      FieldName = 'PR_NCM'
      Origin = 'ESTOQUE.PRODUTOS.PR_NCM'
      Size = 12
    end
  end
  object qCoresProdutosF8: TQuery
    OnCalcFields = qCoresProdutosF8CalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT DISTINCT CR_CODI,CR_DESC,CR_SORT'
      'FROM   CORES,ESTOQUE'
      'WHERE (ES_CORE=CR_CODI) AND'
      '      (ES_GRUP=:grupo) AND'
      '      (ES_SUBG=:subgrupo) AND'
      '      (ES_PROD=:produto)'
      'ORDER BY CR_CODI'
      ' '
      ' ')
    Left = 358
    Top = 217
    ParamData = <
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
      end>
  end
  object qContasF8: TQuery
    DatabaseName = 'CONTASPAGAR'
    SQL.Strings = (
      'Select CO_CODI,CO_DESC,CO_NATU'
      'From   CONTAS'
      'Where (CO_CODI<>-1)'
      'Order by CO_CODI')
    Left = 464
    Top = 368
    object qContasF8CO_CODI: TFloatField
      FieldName = 'CO_CODI'
      Origin = 'CONTASPAGAR.CONTAS.CO_CODI'
    end
    object qContasF8CO_DESC: TStringField
      FieldName = 'CO_DESC'
      Origin = 'CONTASPAGAR.CONTAS.CO_DESC'
      Size = 30
    end
    object qContasF8CO_NATU: TStringField
      FieldName = 'CO_NATU'
      Origin = 'CONTASPAGAR.CONTAS.CO_NATU'
      Size = 1
    end
    object qContasF8cNatureza: TStringField
      FieldKind = fkCalculated
      FieldName = 'cNatureza'
      Calculated = True
    end
  end
  object qFormaPgtoF82: TQuery
    OnCalcFields = qFormaPgtoF8CalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT FO_CODI,FO_DESC'
      'FROM FORMAS_PAGAMENTO'
      'WHERE (FO_CODI=1) OR (FO_CODI=7)'
      'ORDER BY FO_CODI')
    Left = 240
    Top = 400
    object FloatField1: TFloatField
      FieldName = 'FO_CODI'
      Origin = 'CAIXA.FORMAS_PAGAMENTO.FO_CODI'
    end
    object StringField8: TStringField
      FieldName = 'FO_DESC'
      Origin = 'CAIXA.FORMAS_PAGAMENTO.FO_DESC'
      Size = 30
    end
    object StringField9: TStringField
      FieldKind = fkCalculated
      FieldName = 'cOK'
      Calculated = True
    end
  end
  object qCaixaF8: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'Select  VD_CODI,VD_NOME,VD_CARG'
      'From     VENDEDORES'
      'Where  (VD_CODI<>-1) AND (VD_CARG='#39'OPERADOR DE CAIXA'#39')'
      'Order By VD_NOME'
      ' '
      ' ')
    Left = 55
    Top = 273
    object FloatField5: TFloatField
      FieldName = 'VD_CODI'
      Origin = 'ESTOQUE.VENDEDORES.VD_CODI'
      DisplayFormat = '000000'
    end
    object StringField10: TStringField
      FieldName = 'VD_NOME'
      Origin = 'ESTOQUE.VENDEDORES.VD_NOME'
      Size = 40
    end
    object StringField11: TStringField
      FieldName = 'VD_CARG'
      Origin = 'ESTOQUE.VENDEDORES.VD_CARG'
      Size = 30
    end
  end
  object qPortF8: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'Select   PO_CODI,PO_NOME'
      'From     CREPORT'
      'Where  (PO_CODI<>-1)'
      'Order By PO_CODI')
    Left = 159
    Top = 88
    object qPortF8PO_CODI: TFloatField
      FieldName = 'PO_CODI'
      Origin = 'CREDITO.CREPORT.PO_CODI'
    end
    object qPortF8PO_NOME: TStringField
      FieldName = 'PO_NOME'
      Size = 30
    end
  end
  object qCompradoresf8: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'SELECT CC_CLIE,CC_NCO1'
      'FROM CRECLI_COMP'
      'WHERE CC_NCO1<>'#39#39
      'ORDER BY CC_NCO1')
    Left = 488
    Top = 216
    object qCompradoresf8CC_CLIE: TFloatField
      FieldName = 'CC_CLIE'
      Origin = 'CREDITO.CRECLI_COMP.CC_CLIE'
    end
    object qCompradoresf8CC_NCO1: TStringField
      FieldName = 'CC_NCO1'
      Origin = 'CREDITO.CRECLI_COMP.CC_NCO1'
      Size = 50
    end
  end
  object qCidadeF8: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'SELECT *'
      'FROM CIDADE'
      'ORDER BY CIDADE')
    Left = 400
    Top = 464
    object qCidadeF8CIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object qCidadeF8UF: TStringField
      FieldName = 'UF'
    end
    object intgrfldCidadeF8IBGE: TIntegerField
      FieldName = 'IBGE'
    end
    object intgrfldCidadeF8IBGE_UF: TIntegerField
      FieldName = 'IBGE_UF'
    end
  end
  object qPaisF8: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'SELECT *'
      'FROM PAISES')
    Left = 464
    Top = 464
    object qPaisF8ID: TStringField
      FieldName = 'ID'
    end
    object qPaisF8PAIS: TStringField
      FieldName = 'PAIS'
    end
  end
end
