�
 TDMCUPOM 0�"  TPF0TdmCupomdmCupomOldCreateOrder	OnCreatedmCupomCreate	OnDestroydmCupomDestroyLeft� TopeHeightPWidth TTable
VendedoresActive	DatabaseName	SupFiscal	TableNamevendedores.dbLeft\Top
 TIntegerFieldVendedoresCodVendedor	FieldNameCodVendedor  TStringFieldVendedoresNomeVendedor	FieldNameNomeVendedorSize(  TStringFieldVendedoresEndereco	FieldNameEnderecoSize(  TStringFieldVendedoresCidade	FieldNameCidadeSize(  TStringFieldVendedoresUF	FieldNameUFSize  TStringFieldVendedoresTelefone	FieldNameTelefoneSize  TFloatFieldVendedoresComissaoDisplayWidth
	FieldNameComissao(%)
EditFormat##0.0# %   TTableClientesActive	DatabaseName	SupFiscal	TableNameclientes.DBLeft$Top
 TFloatFieldClientesCodCliente	FieldName
CodCliente  TStringFieldClientesNome	FieldNameNomeSize+  TStringFieldClientesEndereco	FieldNameEnderecoSize2  TStringFieldClientesMunicipio	FieldName	MunicipioSize  TStringField
ClientesUF	FieldNameUFSize  TStringFieldClientesCNPJ	FieldNameCNPJSize  TStringField
ClientesIE	FieldNameIESize   TTable
TributacaoActive	DatabaseName	SupFiscal	TableNametributacao.dbLeftTTop�  TFloatFieldTributacaoCodProduto	FieldName
CodProduto  TStringFieldTributacaoUF	FieldNameUFSize  TFloatFieldTributacaoAliquotaICMS	FieldNameAliquotaICMS  TFloatFieldTributacaoReducaoICMS	FieldNameReducaoICMS  TStringFieldTributacaoTributo	FieldNameTributoSize   TTableItemsActive	
BeforePostItemsBeforePost	AfterPostItemsAfterPostAfterDeleteItemsAfterDeleteOnCalcFieldsItemsCalcFieldsOnNewRecordItemsNewRecordDatabaseName	SupFiscal	IndexNamebyControleNumeroSerieMasterFieldsControle;NumeroNF;SerieMasterSourceNotasSrc	TableNameItems.DBLeft Top@ TFloatFieldItemsNumeroNF	FieldNameNumeroNF  TFloatFieldItemsNumeroItem	FieldName
NumeroItem  TFloatFieldItemsCodProduto	FieldName
CodProduto  TFloatFieldItemsQuantidade	FieldName
Quantidade  TCurrencyFieldItemsPrecoUnitario	FieldNamePrecoUnitario  TCurrencyFieldItemsBaseICMS	FieldNameBaseICMS  TCurrencyFieldItemsBaseICMSSDisplayWidth	FieldName	BaseICMSS
EditFormat###,###,###.##  TCurrencyFieldItemsBaseIPIDisplayWidth	FieldNameBaseIPI
EditFormat###,###,###.##  TCurrencyFieldItemsAliquotaICMSDisplayWidth	FieldNameAliquotaICMS
EditFormat###,###,###.##  TCurrencyFieldItemsValorICMSDisplayWidth	FieldName	ValorICMS
EditFormat###,###,###.##  TCurrencyFieldItemsValorICMSSDisplayWidth	FieldName
ValorICMSS
EditFormat###,###,###.##  TFloatFieldItemsEmbalagens	FieldName
Embalagens  TCurrencyField
ItemsTotalDisplayWidth	FieldKindfkCalculated	FieldNameTotal
EditFormat###,###,###.##
Calculated	  TFloatFieldItemsControle	FieldNameControle  TStringFieldItemsSerieNF	FieldNameSerieNFSize  TCurrencyFieldItemsDescontoDisplayWidth	FieldNameDesconto
EditFormat###,###,###.##  TStringFieldItemsProduto	FieldKindfkCalculated	FieldNameProdutoSize(
Calculated	  TStringFieldItemsUnidade	FieldKindfkCalculated	FieldNameUnidadeSize
Calculated	  TCurrencyField
ItemsBICMSDisplayWidth	FieldKindfkCalculated	FieldNameBICMS
EditFormat###,###,###.##
Calculated	  TCurrencyField
ItemsVICMSDisplayWidth	FieldKindfkCalculated	FieldNameVICMS
EditFormat###,###,###.##
Calculated	  TFloatFieldItemsAliquotaDisplayWidth
	FieldKindfkCalculated	FieldNameAliquota
Calculated	  TCurrencyFieldItemsUnitario	FieldKindfkCalculated	FieldNameUnitario
Calculated	  TFloatFieldItemsQuantos	FieldKindfkCalculated	FieldNameQuantos
Calculated	  TFloatFieldItemsAliquotaFiscal	FieldKindfkCalculated	FieldNameAliquotaFiscal
Calculated	  TStringFieldItemsTributo	FieldKindfkCalculated	FieldNameTributoSize
Calculated	   TTable
ParametrosActive	DatabaseName	SupFiscal	TableNameparametros.dbLeftTop�  TStringFieldParametrosRazaoSocial	FieldNameRazaoSocialSize(  TStringFieldParametrosUF	FieldNameUFSize  TIntegerFieldParametrosPortaImpressoraFiscal	FieldNamePortaImpressoraFiscal  TStringFieldParametrosMsgPromocional	FieldNameMsgPromocionalSize0  TStringFieldParametrosEndereco	FieldNameEnderecoSize(  TStringFieldParametrosBairro	FieldNameBairro  TStringFieldParametrosCidade	FieldNameCidadeSize(  TStringFieldParametrosCEP	FieldNameCEPSize	  TStringFieldParametrosCaixaPostal	FieldNameCaixaPostalSize  TStringFieldParametrosCNPJ	FieldNameCNPJSize  TStringFieldParametrosIE	FieldNameIESize  TStringFieldParametrosFone	FieldNameFoneSize  TStringFieldParametrosFax	FieldNameFaxSize  TGraphicFieldParametrosLogomarca	FieldName	LogomarcaBlobType	ftGraphic   TDataSourceItemsSrcDataSetItemsLeftXTop@  TTableProdutosActive	DatabaseName	SupFiscal	TableNameprodutos.DBLeft� Top TFloatFieldProdutosCodProduto	FieldName
CodProduto  TStringFieldProdutosUnidade	FieldNameUnidadeEditMask99;1;_Size  TCurrencyFieldProdutosPrecoConsumidorDisplayWidth	FieldNamePrecoConsumidorDisplayFormat###,###,###.##
EditFormat###,###,###.##  TStringFieldProdutosDescricao	FieldName	DescricaoSize2   TDataSourceNotasSrcDataSetNotasLeftXTopx  TDataSourceProdutosSrcDataSetProdutosLeft� Top  TTableControleActive	DatabaseName	SupFiscal	TableNamecontrole.dbLeft� TopJ TFloatFieldControleProximoControle	FieldNameProximoControle   TQueryLastItemQueryActive	DatabaseName	SupFiscalSQL.Strings0Select MAX(NumeroItem) as ProximoItem from Items%where items.NumeroNF =  :NumeroNF and"      items.SerieNF =  :Serie  and       items.Controle = :Controle Left� Topz	ParamDataDataTypeftFloatNameNumeroNF	ParamType	ptUnknown DataTypeftStringNameSerie	ParamType	ptUnknown DataTypeftFloatNameControle	ParamType	ptUnknown   TFloatFieldLastItemQueryProximoItem	FieldNameProximoItemOriginSUPFISCAL."Items.DB".NumeroItem   TDataSourceVendedoresSrcDataSet
VendedoresLeft� Top�   TDataSourceClientesSrcDataSetClientesLeft� Top@  TTableNotasActive	OnNewRecordNotasNewRecordDatabaseName	SupFiscalFilterSerie = 'CF'Filtered		TableNamenotas.DBLeft Topx TFloatFieldNotasControle	FieldNameControle  TFloatFieldNotasNumeroNF	FieldNameNumeroNF  TStringField
NotasSerie	FieldNameSerieSize  TFloatFieldNotasCodCliente	FieldName
CodCliente  TIntegerFieldNotasCodVendedor	FieldNameCodVendedor  TStringFieldNotasCodFiscal	FieldName	CodFiscalSize  
TDateFieldNotasDataEmissao	FieldNameDataEmissaoEditMask99/99/99;1;_  
TDateFieldNotasDataSaida	FieldName	DataSaidaEditMask99/99/99;1;_  
TDateFieldNotasDataVencimento	FieldNameDataVencimentoEditMask99/99/99;1;_  TStringFieldNotasHoraSaida	FieldName	HoraSaidaSize  TStringField	NotasTipo	FieldNameTipoSize  TCurrencyFieldNotasBaseICMSDisplayWidth	FieldNameBaseICMS
EditFormat###,###,###.##  TCurrencyFieldNotasValorICMSDisplayWidth	FieldName	ValorICMS
EditFormat###,###,###.##  TCurrencyFieldNotasBaseICMSSDisplayWidth	FieldName	BaseICMSS
EditFormat###,###,###.##  TCurrencyFieldNotasValorICMSSDisplayWidth	FieldName
ValorICMSS
EditFormat###,###,###.##  TCurrencyFieldNotasValorIPIDisplayWidth	FieldNameValorIPI
EditFormat###,###,###.##  TCurrencyFieldNotasValorProdutosDisplayWidth	FieldNameValorProdutos
EditFormat###,###,###.##  TCurrencyFieldNotasValorNotaDisplayWidth	FieldName	ValorNota
EditFormat###,###,###.##  TStringFieldNotasCodTransportador	FieldNameCodTransportadorSize  TStringFieldNotasContaFrete	FieldName
ContaFreteSize  TCurrencyFieldNotasValorFreteDisplayWidth	FieldName
ValorFrete
EditFormat###,###,###.##  TCurrencyFieldNotasFreteICMSDisplayWidth	FieldName	FreteICMS
EditFormat###,###,###.##  TCurrencyFieldNotasDescontoDisplayWidth	FieldNameDesconto
EditFormat###,###,###.##  TCurrencyFieldNotasDespesasAcessoriasDisplayWidth	FieldNameDespesasAcessorias
EditFormat###,###,###.##  TFloatFieldNotasVolumes	FieldNameVolumes  TStringFieldNotasEspecie	FieldNameEspecieSize  TFloatFieldNotasPesoLiquido	FieldNamePesoLiquido  TStringField	NotasObs1	FieldNameObs1Size  TStringField	NotasObs2	FieldNameObs2Size  TStringField	NotasObs3	FieldNameObs3Size  TStringField	NotasObs4	FieldNameObs4Size  TStringField	NotasObs5	FieldNameObs5Size  TStringField	NotasObs6	FieldNameObs6Size  TStringFieldNotasPedido	FieldNamePedidoSize
  TStringField	NotasFlag	FieldNameFlagSize   TTable	ItemsWorkActive	DatabaseName	SupFiscal	TableNameItemsWork.dbLeft� Top�  TFloatFieldItemsWorkCodigoProduto	FieldNameCodigoProduto   TDataSourceWorkSrcDataSet	ItemsWorkLeft� Top�    