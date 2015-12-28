unit UFS345;

interface

{Declaracao da Dll Integradora Daruma32.dll}

//============================================================================\\
  // Funções do Cupom Fiscal
//============================================================================\\
function Daruma_FI_AbreCupom(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VendeItem(sParam1:String; sParam2: String;
  sParam3: String; sParam4: String; sParam5: String; sParam6: Integer;
  sParam7: String; sParam8: String; sParam9: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VendeItemTresDecimais(sParam1:String; sParam2: String;
  sParam3: String; sParam4: String; sParam5: String; sParam6: String;
  sParam7: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VendeItemDepartamento(sParam1: String; sParam2: String;
  sParam3: String; sParam4: String; sParam5: String; sParam6: String;
  sParam7: String; sParam8: String; sParam9: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VendeItem1Lin13Dig(sParam1: String; sParam2: String;
  sParam3: String; sParam4: String; sParam5: String; sParam6: String;
  sParam7: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VendeItem1Lin6Dig(sParam1: String; sParam2: String;
  sParam3: String; sParam4: String; sParam5: String; sParam6: String;
  sParam7: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_CancelaItemAnterior: Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CancelaItemGenerico(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CancelaCupom: Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_EmitirCupomAdicional: Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaCupomResumido(sParam1: String;
  sParam2: String):Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaCupom(sParam1: String; sParam2: String;
  sParam3: String; sParam4: String; sParam5: String; sParam6: String):Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ResetaImpressora: Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaRelatorioXouZ(): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_IniciaFechamentoCupom(sParam1: String; sParam2: String;
  sParam3: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_EfetuaFormaPagamento(sParam1: String;
  sParam2: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_EfetuaFormaPagamentoDescricaoForma(sParam1: String;
  sParam2: String; sParam3: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_TerminaFechamentoCupom( sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_IdentificaConsumidor(sParam1: String; sParam2: String;
  sParam3: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_EstornoFormasPagamento(sParam1: String;
  sParam2: String; sParam3: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_UsaUnidadeMedida(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_AumentaDescricaoItem(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';

//============================================================================\\
//Funcoes de Registry
//============================================================================\\
function Daruma_Registry_Porta(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_Path(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_Status(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_StatusFuncao(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_Retorno(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_ControlePorta(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_ModoGaveta(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_Log(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_NomeLog(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_Separador(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_SeparaMsgPromo(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_Emulador(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_ConfigRede(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_VendeItemUmaLinha(sParam1: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_RetornaValor(sParam1: String; sParam2: String;
  sParam3:String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_Registry_ImprimeValor(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_ZAutomatica(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_XAutomatica(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_Default(): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_ImprimeRegistry(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_TerminalServer(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_AlteraRegistry(sParam1: String; sParam2: String)
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_Registry_ErroExtendidoOk(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_AbrirDiaFiscal(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_Registry_VendaAutomatica(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
//============================================================================\\
//Funcoes de Configuracao da IF
//============================================================================\\
function Daruma_FI_Cfg(icaracter: Integer ;valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgEnviar(): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgFechaAutomaticoCupom(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgRedZAutomatico(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgImpEstGavVendas(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgLeituraXAuto(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgCalcArredondamento(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgHorarioVerao(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgSensorAut(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgCupomAdicional(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgLegProdutos(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgEspacamentoCupons(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgHoraMinReducaoZ(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgLimiarNearEnd(valor: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CfgPermMensPromCNF(valor: String): Integer;
  stdcall; external 'Daruma32.dll';

//============================================================================\\
// Funções de Inicialização
//============================================================================\\
function Daruma_FI_AlteraSimboloMoeda( SimboloMoeda: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ):
  Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaHorarioVerao: Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_NomeiaDepartamento( Indice: Integer; Departamento: String
  ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_NomeiaTotalizadorNaoSujeitoIcms( Indice: Integer;
  Totalizador: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaArredondamento: Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaTruncamento: Integer;
  stdcall; external 'Daruma32.dll' name 'Daruma_FI_ProgramaTruncamento';
function Daruma_FI_LinhasEntreCupons( Linhas: Integer ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_EspacoEntreLinhas( Dots: Integer ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ForcaImpactoAgulhas( ForcaImpacto: Integer ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaFormasPagamento( Formas: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaOperador( Operador: String ): Integer;
  stdcall; external 'Daruma32.dll';

//============================================================================\\
// Funções dos Relatórios Fiscais
//============================================================================\\
function Daruma_FI_LeituraX: Integer; stdcall; external 'Daruma32.dll' ;
function Daruma_FI_ReducaoZ( Data: String; Hora: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_RelatorioGerencial( Texto: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_AbreRelatorioGerencial():Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_EnviarTextoCNF( Texto: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaRelatorioGerencial(): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalData( DataInicial: String;
  DataFinal: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalReducao( ReducaoInicial: String;
  ReducaoFinal: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialData( DataInicial: String;
  DataFinal: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialReducao( ReducaoInicial: String;
  ReducaoFinal: String ): Integer; stdcall; external 'Daruma32.dll';

//============================================================================\\
// Funções das Operações Não Fiscais
//============================================================================\\
function Daruma_FI_RecebimentoNaoFiscal( IndiceTotalizador: String;
  Valor: String; FormaPagamento: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String;
  Valor: String; NumeroCupom: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
  stdcall; external 'Daruma32.dll'
function Daruma_FI_FechaComprovanteNaoFiscalVinculado: Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_Sangria( Valor: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_Suprimento( Valor: String; FormaPagamento: String )
  : Integer; stdcall; external 'Daruma32.dll';

//============================================================================\\
// Funções de Informações da Impressora
//============================================================================\\
function Daruma_FI_StatusCupomFiscal( StatusRel: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_StatusComprovanteNaoFiscalVinculado( StatusRel: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_StatusRelatorioGerencial( StatusRel: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroSerie( NumeroSerie: String ): Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_SubTotal( SubTotal: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroCupom( NumeroCupom: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraXSerial: Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VersaoFirmware( VersaoFirmware: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_CGC_IE( CGC: String; IE: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_GrandeTotal( GrandeTotal: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_Cancelamentos( ValorCancelamentos: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_Descontos( ValorDescontos: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroOperacoesNaoFiscais( NumeroOperacoes: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroCuponsCancelados( NumeroCancelamentos: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroIntervencoes( NumeroIntervencoes: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroReducoes( NumeroReducoes: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroSubstituicoesProprietario(
  NumeroSubstituicoes: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_UltimoItemVendido( NumeroItem: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ClicheProprietario( Cliche: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroCaixa( NumeroCaixa: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroLoja( NumeroLoja: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_SimboloMoeda( SimboloMoeda: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_MinutosLigada( Minutos: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_MinutosImprimindo( Minutos: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaModoOperacao( Modo: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaEpromConectada( Flag: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_FlagsFiscais( var Flag: Integer ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ValorPagoUltimoCupom( ValorCupom: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_DataHoraImpressora( Data: String; Hora: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ContadoresTotalizadoresNaoFiscais( Contadores: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaTotalizadoresNaoFiscais( Totalizadores: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaTotalizadoresNaoFiscaisEx( Totalizadores: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_DataHoraReducao( Data: String; Hora: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_DataMovimento( Data: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaTruncamento( Flag: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_Acrescimos( ValorAcrescimos: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ContadorBilhetePassagem( ContadorPassagem: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaAliquotasIss( Flag: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaFormasPagamento( Formas: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaRecebimentoNaoFiscal( Recebimentos: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaDepartamentos( Departamentos: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaTipoImpressora( var TipoImpressora: Integer )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaTotalizadoresParciais( Totalizadores: String )
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_RetornoAliquotas( Aliquotas: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaEstadoImpressora( var ACK: Integer;
  var ST1: Integer; var ST2: Integer ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_DadosUltimaReducao( DadosReducao: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_MonitoramentoPapel( var Linhas: Integer): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaIndiceAliquotasIss( Flag: String ): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_ValorFormaPagamento( FormaPagamento: String;
  Valor: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_ValorTotalizadorNaoFiscal( Totalizador: String;
  Valor: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_PalavraStatus( Palavra: String)
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_PalavraStatusBinario( Palavra: String)
  : Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LerAliquotasComIndice( Palavra: String)
  : Integer; stdcall; external 'Daruma32.dll';
//============================================================================\\
// Funções de Autenticação e Gaveta de Dinheiro
//============================================================================\\
function Daruma_FI_Autenticacao:Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_AutenticacaoStr(str :String):Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaDocAutenticacao:Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_AcionaGaveta:Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaEstadoGaveta( var EstadoGaveta: Integer )
  : Integer; stdcall; external 'Daruma32.dll';
//============================================================================\\
// Outras Funções
//============================================================================\\
function Daruma_FI_AbrePortaSerial: Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_RetornoImpressora( var ACK: Integer; var ST1: Integer;
  var ST2: Integer ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaPortaSerial: Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_MapaResumo:Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_AberturaDoDia( ValorCompra: String;
  FormaPagamento: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_FechamentoDoDia: Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_ImprimeConfiguracoesImpressora:Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_ImprimeDepartamentos: Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_RelatorioTipo60Analitico: Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_RelatorioTipo60Mestre: Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_VerificaImpressoraLigada: Integer; stdcall;
  external 'Daruma32.dll';
function Daruma_FI_RetornaErroExtendido(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';

//============================================================================\\
// Funções de Facilidades para o TEF
//============================================================================\\

function Daruma_TEF_EsperarArquivo(sParam1: String; sParam2: String;
  sParam3: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_TEF_ImprimirResposta(sParam1: String; sParam2: String;
  sParam3: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_TEF_SetFocus(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
function Daruma_TEF_TravarTeclado(sParam1: String): Integer;
  stdcall; external 'Daruma32.dll';
  //function Daruma_TEF_FechaRelatorio(): Integer;
  //        StdCall; External 'Daruma32.dll';

//============================================================================\\
implementation

end.
