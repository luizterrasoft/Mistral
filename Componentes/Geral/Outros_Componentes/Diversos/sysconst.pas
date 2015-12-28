
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{                                                       }
{       Copyright (C) 1995,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit SysConst;

interface

resourcestring
  SUnknown = '<unknown>';
  SInvalidInteger = '''%s'' n�o � um valor inteiro v�lido';
  SInvalidFloat = '''%s'' n�o � um valor de ponto flutuante v�lido';
  SInvalidDate = '''%s'' n�o � uma data v�lida';
  SInvalidTime = '''%s'' n�o � um hor�rio v�lido';
  SInvalidDateTime = '''%s'' n�o s�o um valor de data e hor�rio v�lidos';
  STimeEncodeError = 'Argumento inv�lido na convers�o para tipo hor�rio';
  SDateEncodeError = 'Argumento inv�lido na convers�o para um tipo data';
  SOutOfMemory = 'Mem�ria insuficiente';
  SInOutError = 'Erro de I/O %d';
  SFileNotFound = 'Arquivo n�o encontrado';
  SInvalidFilename = 'Nome de arquivo inv�lido';
  STooManyOpenFiles = 'Muitos arquivos abertos';
  SAccessDenied = 'Acesso ao arquivo negado';
  SEndOfFile = 'Leitura al�m do fim do arquivo';
  SDiskFull = 'Disco cheio';
  SInvalidInput = 'Entrada de valor num�rico inv�lida';
  SDivByZero = 'Tentativa de divis�o por zero';
  SRangeError = 'Erro na verifica��o de intervalo';
  SIntOverflow = 'Excedeu a capacidade do tipo inteiro';
  SInvalidOp = 'Opera��o de ponto flutuante inv�lida';
  SZeroDivide = 'Divis�o de ponto flutuante por zero';
  SOverflow = 'Excedeu a capacidade m�xima do tipo ponto flutuante';
  SUnderflow = 'Excedeu a capacidade m�nima (Underflow) do tipo ponto flutuante';
  SInvalidPointer = 'Opera��o inv�lida com ponteiros';
  SInvalidCast = 'Typecast de classe inv�lido';
  SAccessViolation = 'Viola��o de acesso no endere�o %p. %s do endere�o %p';
  SStackOverflow = 'Excedeu a capacidade (Overflow) da pilha';
  SControlC = 'Control-C pressionado';
  SPrivilege = 'Instru��o Privilegiada';
  SOperationAborted = 'Opera��o abortada';
  SException = 'Exce��o %s no m�dulo %s em %p.'#$0A'%s%s';
  SExceptTitle = 'Erro da Aplica��o';
  SInvalidFormat = 'Formato ''%s'' inv�lido ou incompat�vel com o argumento';
  SArgumentMissing = 'Nenhum argumento para o formato ''%s''';
  SInvalidVarCast = 'Convers�o inv�lida de tipo variant';
  SInvalidVarOp = 'Opera��o com tipo variant inv�lida';
  SDispatchError = 'Chamada a um m�todo de tipo variant n�o suportada';
  SReadAccess = 'Leitura';
  SWriteAccess = 'Grava��o';
  SResultTooLong = 'Resultado do formato maior que 4096 caracteres';
  SFormatTooLong = 'String de formato muito longa';
  SVarArrayCreate = 'Erro criando array do tipo variant';
  SVarNotArray = 'Tipo variant n�o � um array';
  SVarArrayBounds = '�ndice de array do tipo variant fora dos limites';
  SExternalException = 'Exce��o externa %x';
  SAssertionFailed = 'Assertion falhou';
  SIntfCastError = 'Interface n�o suportada';
  SSafecallException = 'Exception in safecall method';
  SAssertError = '%s (%s, linha %d)';
  SAbstractError = 'Erro abstrato';
  SModuleAccessViolation = 'Viola��o de acesso no endere�o %p no m�dulo ''%s''. %s do endere�o %p';
  SCannotReadPackageInfo = 'N�o foi poss�vel o acesso �s informa��es do package ''%s''';
  sErrorLoadingPackage = 'N�o foi poss�vel carregar o package %s.'#13#10'%s';
  SInvalidPackageFile = 'Tamanho de arquivo do package ''%s'' inv�lido';
  SInvalidPackageHandle = 'Handle de package inv�lido';
  SDuplicatePackageUnit = 'N�o foi poss�vel carregar o package ''%s.''. Ele contem a unit ''%s,''' +
                          ';que est� contida no package ''%s''';
  SWin32Error = 'Erro Win32. C�digo: %d.'#10'%s';
  SUnkWin32Error = 'Uma fun��o da API da Win32 falhou';
  SNL = 'Aplica��o n�o est� licenciada para utilizar este recurso';

  SShortMonthNameJan = 'Jan';
  SShortMonthNameFeb = 'Fev';
  SShortMonthNameMar = 'Mar';
  SShortMonthNameApr = 'Abr';
  SShortMonthNameMay = 'Mai';
  SShortMonthNameJun = 'Jun';
  SShortMonthNameJul = 'Jul';
  SShortMonthNameAug = 'Ago';
  SShortMonthNameSep = 'Set';
  SShortMonthNameOct = 'Out';
  SShortMonthNameNov = 'Nov';
  SShortMonthNameDec = 'Dez';

  SLongMonthNameJan = 'Janeiro';
  SLongMonthNameFeb = 'Fevereiro';
  SLongMonthNameMar = 'Mar�o';
  SLongMonthNameApr = 'Abril';
  SLongMonthNameMay = 'Maio';
  SLongMonthNameJun = 'Junho';
  SLongMonthNameJul = 'Julho';
  SLongMonthNameAug = 'Agosto';
  SLongMonthNameSep = 'Setembro';
  SLongMonthNameOct = 'Outubro';
  SLongMonthNameNov = 'Novembro';
  SLongMonthNameDec = 'Dezembro';

  SShortDayNameSun = 'Dom';
  SShortDayNameMon = 'Seg';
  SShortDayNameTue = 'Ter';
  SShortDayNameWed = 'Qua';
  SShortDayNameThu = 'Qui';
  SShortDayNameFri = 'Sex';
  SShortDayNameSat = 'Sab';

  SLongDayNameSun = 'Domingo';
  SLongDayNameMon = 'Segunda';
  SLongDayNameTue = 'Ter�a';
  SLongDayNameWed = 'Quarta';
  SLongDayNameThu = 'Quinta';
  SLongDayNameFri = 'Sexta';
  SLongDayNameSat = 'S�bado';

implementation

end.