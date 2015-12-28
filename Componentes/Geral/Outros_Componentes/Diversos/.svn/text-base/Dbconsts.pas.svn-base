
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit DbConsts;

interface

resourcestring
  SInvalidFieldSize = 'Tamanho de campo inválido';
  SInvalidFieldKind = 'FieldKind inválido';
  SInvalidFieldRegistration = 'Registro de campo inválido';
  SUnknownFieldType = 'Campo ''%s'' de tipo desconhecido';
  SFieldNameMissing = 'Nome do campo ausente';
  SDuplicateFieldName = 'Duplicate field name ''%s''';
  SFieldNotFound = 'Campo ''%s'' não encontrado;
  SFieldAccessError = 'Não é possível acessar o campo ''%s'' do tipo %s';
  SFieldValueError = 'Valor inválido para o campo ''%s''';
  SFieldRangeError = '%g Não é um valor válido para o campo ''%s''. A faixa permitida é de %g até %g';
  SInvalidIntegerValue = '''%s'' não é um inteiro válido para o campo ''%s''';
  SInvalidBoolValue = '''%s'' não é uma valor boleano válido para o campo ''%s''';
  SInvalidFloatValue = '''%s'' não é um valor de ponto flutuante válido para o campo ''%s''';
  SFieldTypeMismatch = 'Campo ''%s'' não é do tipo esperado, esperando: %s atual: %s';
  SFieldSizeMismatch = 'Tamanho sem combinação para campo ''%s'', esperando: %d atual: %d';
  SInvalidVarByteArray = 'Tipo ou tamanho da variante inválido para o campo ''%s''';
  SFieldOutOfRange = 'Valor do campo ''%s'' está fora de faixa';
  SBCDOverflow = '(Estouro da capacidade)';
  SFieldRequired = 'Campo ''%s'' deve ter um valor';
  SDataSetMissing = 'Campo ''%s'' não tem arquivo';
  SInvalidCalcType = 'Campo ''%s'' não pode ser um campo calculado ou lookup';
  SFieldReadOnly = 'Campo ''%s'' não pode ser modificado';
  SFieldIndexError = 'Índice de campo fora de faixa';
  SNoFieldIndexes = 'Índice corrente não ativo';
  SNotIndexField = 'Campo ''%s'' não está indexado e não pode ser modificado';
  SIndexFieldMissing = 'Não é possível acessar o índice do campo ''%s''';
  SDuplicateIndexName = 'Nome de índice duplicado ''%s''';
  SNoIndexForFields = 'Não tem índice para os campos ''%s''';
  SIndexNotFound = 'Índice ''%s'' não encontrado';
  SDuplicateName = 'Nome duplicado ''%s'' em %s';
  SCircularDataLink = 'Ligações de dados circulares não são permitidas';
  SLookupInfoError = 'Informação Lookup para o campo ''%s'' está incompleta';
  SDataSourceChange = 'DataSource não pode ser atualizado';
  SNoNestedMasterSource = 'Arquivos aninhados não podem ter uma tabela mestra';
  SDataSetOpen = 'Não é possível realizar esta operação em um arquivo aberto';
  SNotEditing = 'Arquivo não está em modo de edição ou inserção';
  SDataSetClosed = 'Não é possível realizar esta operação em um arquivo fechado';
  SDataSetEmpty = 'Não é possível realizar esta operação em um arquivo vazio';
  SDataSetReadOnly = 'Não é possível modificar um arquivo somente de leitura';
  SNestedDataSetClass = 'Arquivo aninhado têm que herdar de %s';
  SExprTermination = 'Expressão de filtro incorretamente terminada';
  SExprNameError = 'Nome de campo não terminado';
  SExprStringError = 'Constante de string não terminada';
  SExprInvalidChar = 'Caractere inválido na expressão de filtro: ''%s''';
  SExprNoLParen = '''('' esperado mas %s encontrado';
  SExprNoRParen = ''')'' esperado mas %s encontrado';
  SExprNoRParenOrComma = ''')'' ou '','' aguardado mas %s existe';
  SExprExpected = 'Expressão esperada mas %s encontrada';
  SExprBadField = 'Campo ''%s'' não pode ser usado em uma expressão de filtro';
  SExprBadNullTest = 'NULL somente permitido com ''='' e ''<>''';
  SExprRangeError = 'Constante fora de faixa';
  SExprNotBoolean = 'Campo ''%s'' não é do tipo boleano';
  SExprIncorrect = 'Expressão de filtro formada incorretamente';
  SExprNothing = 'Absolutamente';
  SExprTypeMis = 'Tipo de expressão desconhecida';
  SExprBadScope = 'Operação não pode misturar valor agregado com valor registro-variado';
  SExprNoArith = 'Filtro de expressão aritmética não suportada';
  SExprNotAgg = 'Expressão não é uma expressão agregada';
  SExprBadConst = 'Constante corrente não é do tipo %s';
  SExprNoAggFilter = 'Expressões agregadas não permitem filtros';
  SExprEmptyInList = 'Lista de predicados IN pode não estar vazia';
  SInvalidKeywordUse = 'Uso de Keyword inválido';
  STextFalse = 'Falso';
  STextTrue = 'True';
  SParameterNotFound = 'Parametro ''%s'' não encontrado';
  SInvalidVersion = 'Não é possível carregar parâmetros da fita';
  SParamTooBig = 'Parâmetro ''%s'', não é possível salvar dados maiores que %d bytes';
  SBadFieldType = 'Campo ''%s'' é do tipo não suportado';
  SAggActive = 'Esta propriedade não pode ser modificada enquanto o agregado está ativo';
  SProviderSQLNotSupported = 'SQL não suportado: %s';
  SProviderExecuteNotSupported = 'Execute not supported: %s';
  SExprNoAggOnCalcs = 'Field ''%s'' is not the correct type of calculated field to be used in an aggregate, use an internalcalc';
  SRecordChanged = 'Record changed by another user';

  { DBCtrls }
  SFirstRecord = 'Primeiro registro';
  SPriorRecord = 'Registro anterior';
  SNextRecord = 'Próximo registro';
  SLastRecord = 'Último registro';
  SInsertRecord = 'Insere registro';
  SDeleteRecord = 'Deleta registro';
  SEditRecord = 'Edita registro';
  SPostEdit = 'Grava registro';
  SCancelEdit = 'Cancela edição';
  SRefreshRecord = 'Atualiza dados';
  SDeleteRecordQuestion= 'Você tem certeza que deseja deletar este registro?';
  SDeleteMultipleRecordsQuestion='Você tem certeza que deseja deletar todos estes registros selecionados?';
  SRecordNotFound = 'Registro não encontrado';
  SDataSourceFixed = 'Operação não permitida em um DBCtrlGrid';
  SNotReplicatable = 'Controle não pode ser usado em um DBCtrlGrid';
  SPropDefByLookup = 'Propriedade já definida pelo campo lookup';
  STooManyColumns = 'Grid requerido para mostrar mais que 256 colunas';
  
  { DBLogDlg }
  SRemoteLogin = 'Login remoto';

  { DBOleEdt }
  SDataBindings = 'Fita de dados...';

implementation

end.
