{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit mxConsts;

{$R mxconsts.RES}

interface

const
  { DecisionCube Dialog help contexts }
  hcDDecisionCubeEditor = 30170;
  hcDDecisionCubeDimensions = 30171;
  hcDDecisionCubeMemoryControl = 30172;
  hcDDecisionCubeDesignerOptions = 30173;
  hcDDecisionCubeLimits = 30174;
  hcDDecisionQueryEditor = 30180;
  hcDDecisionQueryDimensions = 30181;
  hcDDecisionQuerySQLEditor = 30182;

resourcestring
  sRowError             = 'Erro na linha';
  { Strings used in the Pivot }
  sAllValues            = 'Todos valores';
  sMovetoRow            = 'Vai para a �rea da linha ';
  sMovetoCol            = 'Vai para a �rea da coluna';
  sMakeDimOpen          = 'Abrir dimens�o';
  sDrilled              = 'Perfurado dentro';
  sCouldNotOpen         = 'A informa��o solicitada n�o pode ser carregada. ';
  sNoSumsAvailable      = 'Nenhum sum�rio ativo foi definido';
  sNoSumsCouldBeLoaded  = 'N�o h� endere�os dispon�veis para carregar um sum�rio . ';
  sNoDimsAvailable      = 'Nenhuma dimens�o dispon�vel foi definida';
  sNoDimsCouldBeLoaded  = 'N�o h� espa�o dispon�vel para carregar a dimens�o';

  sTemplatePrefix       = 'Template: ';
  { Strings used in the CrossTabGrid }
  sGridCellError        = '[Erro]';
  sTotalCaption         = 'Soma';
  sActivateLabel        = 'Dimens�es inativas';
  sRowCaption           = 'R';
  sColCaption           = 'C';
  sCaptionMenu1         = 'Exibindo os dados e os subtotais';
  sCaptionMenu2         = 'Exibindo somente os dados';
  sCaptionMenu3         = 'Exibindo somente os subtotais';
  sDrillIn              = 'Perfure dentro deste valor';
  sGridMenu1            = 'Subtotais Lig/Desl';
  sGridMenu2            = 'Decision Cube Editor..';
  sGridMenu3            = 'Decision Query Editor..';
  sGridMenu4            = 'Exibir detalhes dos registros..';

  { Strings used in mxarrays }
  sUnsupportedDataType  = 'Tipo do dado %s n�o suportado';
  sRowOutOfRange        = '�ndice da linha fora do intervalo: %d';
  sColOutOfRange        = '�ndice da coluna fora do intervalo: %d';
  sDupeItem             = '�tem no array duplicado';
  sArrayIndexOutOfRange = '�ndice do array fora do intervalo: %d';
  sLowCapacityError     = 'A capacidade do DecisionCube est� baixa. Por favor, desative as dimens�es ou mude a s�rie de dados';
  sQryNotInitialized    = 'N�o � poss�vel executar a Query. Verifique se a Query, SQL text, e o Database est�o corretos.';
  sSortedListError      = 'Opera��o n�o suportada ao filtrar lista de strings.';
  sDuplicateString      = 'N�o � permitida lista de Strings duplicadas';
  sMaxAllowedSums       = 'Foi excedido o max�mo de sumarios %d permitidos';
  sGeneralArrayError    = 'Erro geral no array';

  {String used in the DecisionSource}
  sDimIndexError        = '�ndice de dimens�o ilegal';

  {String used in the DecisionCube}
  sIllegalValueForBin   = 'Valor inicial n�o � legal para este tipo de agrupamento';
  sIllegalDimMap        = 'Mapa da dimens�o n�o est� com a dimens�o correta';
  sDimMapActiveError    = 'N�o � poss�vel prosseguir com esta a��o em um mapa ativo da dimens�o';
  sNotAvailable         = 'N�o dispon�vel';
  sGetValueCounts       = 'A informa��o necess�ria para fazer o limite m�ximo da pilha n�o � atual. Voc� quer atualiz�-la agora?';
  sDateBinningNotAllowed = 'Dados agrupados n�o s�o permitidos para campos deste tipo';
  sEmptyDataSet         = 'N�o � poss�vel gerar o Decision Cube com a base de dados vazia';

  { Strings use in Query UI}
  sNoDataSet            = 'A s�rie da propriedade n�o foi atribu�da � base de dados';
  sNoAggs               = 'Nenhum sum�rio foi definido';
  sNoDims               = 'Campos de dimens�es n�o foram definidos';
  sUnknownDims          = 'Os tipos da dimens�o para esta s�rie de dados n�o podem ser determinados automaticamente. Voc� deve tra�ar os campos �s dimens�es ou os sum�rios com o editor do decision cube';
  sGroupsMissing        = 'Todos os campos da dimens�o devem ser agrupados';
  sDecisionQueryError   = 'Ou voc� pode necessitar tra�ar seus campos �s dimens�es ativas ou os sum�rios com o editor do decision cube';
  sDataSetError         = 'Os arquivos podem ser definidos incorretamente, ou voc� pode precisar tra�ar seus campos para dimens�es ativas ou resumos com o Editor do Decision Cube';
  sQueryError           = 'A Query pode ser definida incorretamente, ou voc� pode precisar tra�ar seus campos para dimens�es ativas ou resumos com o Editor do Decision Cube';
  sCountStar            = 'COUNTALL';
  sAddAvgWarning        = 'A m�dia que usa soma e resumos de conta para cada campo � calculada. Os resumos necess�rios foram somados.';
  sAddAvgStarWarning    = 'M�dia que usa uma soma de campo e conta � calculada (*). Os resumos necess�rios foram somados.';

  { Query UI Designer strings}
  sQueryLegal           = 'A Query � legal.';
  sAddFieldExists       = ' J� existe em uma query';
  sAggTypeNotAllowed    = ' N�o � um tipo de sum�rio permitido';
  sDimTypeNotAllowed    = ' N�o � um tipo de dimens�o permitida';
  sAverageRequires      = 'Resumos comuns usam Soma e Conta';
  sWantToExit           = 'Voc� ainda quer Sair?';
  sQueryIllegal         = 'A query que voc� criou n�o � legal. Por favor corrija antes de continuar.';
  sQueryEditIllegal     = 'A Query na qual voc� entrou n�o � legal. Por favor corrija antes de continuar';
  sRemoveFieldError     = 'N�o � poss�vel remover este campo';
  sAllFields            = 'Todos Campos';
  sQueryFields          = 'Campos da Query';
  sEditDone             = '&Edi��o final';
  sEditQuery            = '&Editar Query';

  { Used by the query parser}
  sQParseRemovedField   = 'Foram removidos um ou mais campos de um tipo que n�o pode ser tabulado da Query';

  { used by mxstore }
  sCubeLimitsExceeded   = 'Tamanho do Decision Cube excedeu os limites';
  sMaxAllowedDims       = 'Foi excedito o tamanho m�ximo das dimens�es do %d permitidas.';
  sMaxAllowedCells      = 'Contagem total de c�lulas do %d excedeu o m�ximo do %d.';
  sUnsupportedFieldType = 'Campo %s tem um tipo de dados n�o suportado: %s';
  sFetchValues          = 'Scaneando valores de dados fixados...';
  sUserCanceled         = 'Usu�rio cancelou a popula��o do DecisionCube';
  sBinningValues        = 'Agrupando valores...';
  sCreatingIndexes      = 'Criando �ndice de cubo para %s ...';
  sCreateDerivedSummaryError = 'N�o � poss�vel criar sum�rio derivado';
  sTrue                  = 'Verdadeiro';
  sFalse                 = 'Falso';
  sBinTypeMismatch       = 'Tipo de campo n�o confere com o tipo de caixa';
  sFatalCacheError       = 'Ocorreu um erro fatal no cache: c�digo: %d';
  sStringTypeNoSupported = 'Tipo de dados n�o suportados no sum�rio';
  sDataSetTooLarge       = 'Arquivo muito grande';
  sBuildingDataStore     = 'Gerando hist�rico de dados...';

  {String used in MXtables and mxcommon and mxqparse}
  sSumLabel             = 'Soma de %s';
  sCountLabel           = 'Contagem de %s';
  sMaxLabel             = 'M�ximo de %s';
  sMinLabel             = 'M�nimo de %s';
  sAverageLabel         = 'M�dia of %s';
  sVarLabel             = 'Variando de %s';
  sSDLabel              = 'Diverg�ncia de %s';
  sAggLabel             = 'Sum�rio de %s';
  sUnsupportedVarType   = 'Tipo de dado %d n�o suportado';
  sOtherValues          = 'Outros valores';

  sSelectFromError      = 'Query falhando na clausula Select/From';
  sArgumentExpected     = 'Nenhum argumento providenciado para o operador ou resumo';
  sGroupOnExpressionError = 'Uma express�o n�o pode ser usada para um campo de agrupamento';

  sOutofBounds          = 'Fora dos limites';
  sIDAPILangID          = '0009';

implementation

end.
