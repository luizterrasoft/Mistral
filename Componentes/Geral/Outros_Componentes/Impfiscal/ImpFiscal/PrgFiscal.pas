
{* ========================================================================== *

   TPrgFiscal   Componente para Emissores de Cupom Fiscal   Vers�o.....: 1.28   Modelos de ECF Implementados Atualmente:           Elgin 500 1E           Zanthus IZ10, IZ20, IZ11, IZ21, IZ41, QZ1000           Corisco V3   Modelos de ECF a serem Implementados:           Daruma Sigtron           Urano   --------------------------------------------------------------------------   Inicio................: 06/01/1999
   Criado por............: dos Santos Jr, Linces Marques
   Modificado............: 02/06/2000
   Modificado por........: dos Santos Jr, Linces Marques
   Empresa...............: Ramos da Inform�tica
   Problemas Conhecidos..: N�o encontra DLL no NT 4.0                           Erro de violacao de memoria no Win9x * ========================================================================== *}
unit PrgFiscal;
interface
uses

  SysUtils,WinTypes,WinProcs,Messages,Classes,Controls,Dialogs,IniFiles,//DBTables, DB;  Windows, StdCtrls,ExtCtrls,Graphics, Forms, ComObj;const   {constantes de forma de desconto para uso na funcao de venda de item }
   fdValor = 0;
   fdPercent = 1;

   {constantes usadas na funcao de leitura de memoria fiscal}
   mfData = 0;
   mfRed = 1;

   { mensagens de erro que sao atribuidas ao parametro MsgError do evento OnError,     a fim de serem manipuladas pelo usario final. }
   Mensagens: array[1..20] of string=     (
               'Erro de Comunica��o FISICA com a SERIAL.',
               'Erro no envio dos Par�metros.',
               'Erro na comunica��o com a SERIAL.',
               'Fim de papel!',
               'Pouco Papel!',
               'Erro no RTC',
               'Impressora com problemas!',
               'Comando invalido',
               'Comando inexistente',
               'Cupom fiscal aberto!',
               'Numero de parametros invalido -> Impressora!',
               'Tipo do parametro invalido -> Impressora!',
               'Memoria Fiscal Lotada!',
               'Erro na RAM',
               'Aliquota Nao Programada',
               'Capacidade de aliquotas esgotada',
               'Cancelamento nao permitido',
               'CGC/IE nao programados',
               'Comando nao executado!(NAK)',
               'Erro Desconhecido'        );

    MsgSchalter: array[1..73] of string= (
               '01:Erro de checksum',
               '02:Timeout RX',
               '03:Mem�ria insuficiente',
               '04:Impressora fora de linha ou desligada',
               '10:Erro de sobreposi��o',
               '11:Erro de paridade',
               '12:Erro de sobreposi��o e paridade',
               '13:Erro de formato',
               '14:Erro de sobreposi��o e formato',
               '15:Erro de paridade e sobreposi��o',             //10
               '16:Erro de sobreposi��o, paridade e formato',
               '65:Em venda',
               '66:Limite de cabe�alho alcan�ado',
               '68:Cabe�alho impresso',
               '69:N�o come�ou venda',
               '70:Valor inv�lido',
               '73:Valor a menor',
               '74:Valor a maior',
               '78:N�mero m�ximo de Redu��es Z alcan�ado',
               '79:Erro de comunica��o',                         //20
               '80:Palavra reservada',
               '81:Papel pr�ximo do fim',
               '82:Data n�o localizada',
               '84:Erro de mem�ria fiscal. Necessita INTERVEN��O T�CNICA',
               '85:Perda da RAM. Necessita INTERVEN��O T�CNICA',
               '86:N�o houve pagamento',
               '87:Cupom j� totalizado',
               '88:N�o pode cancelar venda',
               '89:Comando n�o completo',
               '90:Cupom Fiscal aberto',                         //30
               '91:N�o h� cupom a cancelar',
               '92:Tabela de taxa n�o inicializada',
               '94:Sele��o de taxa inv�lida',
               '95:Cancelamento inv�lido',
               '96:Nada a retificar',
               '97:Redu��o n�o localizada',
               '98:Cabe�alho n�o carregado',
               '99:Impressora em interven��o t�cnica',
               '100:Impressora em per�odo de venda',
               '101:Somente com interven��o t�cnica',            //40
               '102:Desconto inv�lido',
               '103:Limite de linhas alcan�ado',
               '104:Somente ap�s o total',
               '105:Dados inv�lidos',
               '106:Altera��o de taxa n�o dispon�vel',
               '107:Comando inv�lido',
               '108:N�o houve o fechamento do dia.Execute REDU��O Z.',
               '109:Erro irrecuper�vel',
               '110:Altera��o inv�lida',
               '111:Data j� alterada',                           //50
               '112:Al�quota n�o carregada',
               '113:Fechamento di�rio n�o realizado.Execute REDU��O Z.',
               '114:Abertura do dia inv�lida',
               '115:Fechamento j� realizado',
               '116:Ajuste somente de +/- 1 hora',
               '117:Acr�scimo inv�lido',
               '118:Pagamento incompleto',
               '121:Erro de grava��o na mem�ria fiscal.Necessita INTERVEN��O T�CNICA',
               '126:Comando fora de seq��ncia',
               '127:Autentica��o sem papel',                     //60
               '132:Queda de energia',
               '133:Data inv�lida',
               '134:Item fora da faixa',
               '135:Item n�o vendido',
               '136:Par�metro errado',
               '137:Limite de valor ultrapassado',
               '606:N�o foi poss�vel setar os par�metros configur�veis da porta serial',
               '707:N�o foi poss�vel programar os par�metros setados referentes � porta serial',
               '808:N�o foi poss�vel limpar a fila de transmiss�o',
               '809:N�o foi poss�vel limpar a fila de recep��o', //70
               '909:Ocorreu um erro na programa��o interna dos timeouts da porta serial',
               '1010:A porta serial requisitada est� bloqueada por outro aplicativo',
               '2323:Ocorreu um problema desconhecido na recep��o de retorno simples da impressora');

    MsgYanco: array[1..42] of string= (
               '09:Total di�rio diferente de Zero',
               '10:Fim de Papel',
               '16:Comando enviado pelo PC inv�lido',
               '17:Falha na inicializa��o',
               '18:Jumper de interven��o aberto',
               '19:Jumper OP1 aberto',
               '20:Pre�o total incorreto',
               '30:Total da opera��o igual a zero',
               '31:Fun��o n�o permitida ap�s totaliza��o',
               '32:Fun��o n�o permitida sem totaliza��o',             //10
               '34:Situa��o tribut�ria Inv�lida',
               '35:Campo num�rico Inv�lido',
               '36:N�meros n�o permitidos neste campo',
               '37:Mensagem Inv�lida',
               '38:Tamanho m�ximo do Valor Inv�lido',
               '39:Campo deve conter no m�nimo, um caractere',
               '40:Fun��o Inexistente',
               '41:Fun��o n�o permitida sem in�cio de Opera��o Fiscal',
               '42:Fun��o n�o permitida sem in�cio de opera��o N�o Fiscal',
               '43:Fun��o n�o permitida durante opera��o Fiscal ou N�o Fiscal',                         //20
               '44:Fun��o n�o permitida sem in�cio do Dia',
               '45:Fun��o n�o permitida sem status de interven��o ou durante opera��o Fiscal ou N�o Fiscal',
               '46:Fun��o n�o permitida com status de interven��o',
               '47:Fun��o n�o permitida ap�s o In�cio do Dia',
               '48:N�o s�o permitidos mais coment�rios',
               '49:N�o � permitido o In�cio do Dia ap�s Redu��o Z',
               '50:Necessita Redu��o Z',
               '51:Hora / Data Inv�lida',
               '52:Data menor que a da Mem�ria Fiscal',
               '53:�ltima fun��o n�o permite a execu��o deste comando',                         //30
               '54:Cupom aberto mas n�o finalizado',
               '55:Fun��o n�o permitida sem abertura de Relat�rio X ou Z',
               '56:� permitido apenas quatro valida��es',
               '57:Tempo esgotado para este comando',
               '62:Mem�ria Fiscal Esgotada',
               '63:Mem�ria Fiscal n�o dispon�vel ou erro de Leitura/Grava��o',
               '64:Equipamento necessita interven��o T�cnica',
               '65:Palavra de uso exclusivo do firmware fiscal',
               '67:Leitura da Mem�ria Fiscal chegou ao fim',
               '68:Mem�ria Fiscal n�o est� esgotada',            //40
               '69:Impressora Fiscal n�o est� pronta',
               '70:Impossivel Cancelar Item');

    MsgElgin: array[1..102] of string= (
               '+03:Abrindo relat�rio gerencial na Leitura X ou Redu��o Z',
               '+02:Cupom finalizado com total nulo. Ser� emitido um cupom de cancelamento automaticamente',
               '+01:Detectado pouco papel',
               '0:Comando executado com sucesso',
               '-01:O cabe�alho cont�m caracteres invalidados',
               '-02:Comando inexistente',
               '-03:Valor n�o num�rico em campo num�rico',
               '-04:Valor fora da faixa entre 20h E 7Fh',
               '-05:Campo deve iniciar com `@�, `&� ou `%�',
               '-06:Campo deve iniciar com `$� , `#� ou `?�',
               '-07:O intervalo � inconsistente. O primeiro valor deve ser menor que o segundo valor( no caso de datas, valores anteriores a 010195 ser�o consideradas como pertencentes ao intervalo de anos 2000-2094.',
               '-09:A string "TOTAL" n�o � aceita',
               '-10:A sintaxe do comando est� errada',
               '-11:Excedeu o n� m�ximo de linhas permitidas pelo comando',
               '-12:O terminador enviado n�o est� obedecendo o protocolo de comunica��o',
               '-13:O checksum enviado est� incorreto',
               '-14:Reservado',
               '-15:A situa��o tribut�ria deve iniciar com `T�, `F�,�I� ou �N�',
               '-16:Data inv�lida',
               '-17:Hora inv�lida',
               '-18:Al�quota n�o programada ou fora do intervalo',
               '-19:O campo de sinal est� incorreto',
               '-20:Comando s� aceito em Interven��o Fiscal',
               '-21:Comando s� aceito em modo Normal',
               '-22:Necess�rio abrir cupom fiscal',
               '-23:Comando n�o aceito durante cupom fiscal',
               '-24:Necess�rio abrir cupom n�o Fiscal',
               '-25:Comando n�o aceito durante Cupom N�o Fiscal',
               '-26:O  rel�gio j� est� em hor�rio de ver�o',
               '-27:O  rel�gio n�o est� em hor�rio de ver�o',
               '-28:Necess�rio realizar Redu��o Z',
               '-29:Fechamento do dia (Redu��o Z ) j� executado',
               '-30:Necess�rio programar legenda',
               '-31:Item inexistente ou j� cancelado',
               '-32:O  cupom anterior n�o pode ser cancelado',
               '-33:Detectado falta de papel',
               '-34:Reservado',
               '-35:Reservado',
               '-36:Necess�rio programar os dados do estabelecimento',
               '-37:Necess�rio realizar Interven��o Fiscal',
               '-38:A mem�ria fiscal n�o permite mais realizar vendas. S� � poss�vel executar Leitura X ou Leitura da Mem�ria Fiscal',
               '-39:A mem�ria fiscal n�o permite mais realizar vendas. S� � poss�vel executar Leitura X ou Leitura da Mem�ria Fiscal correu algum problema na mem�ria NOVRAM. Ser� necess�rio realizar uma Interven��o T�cnica',
               '-40:Necess�rio programar a data do rel�gio',
               '-41:N�mero m�ximo de itens por cupom ultrapassado',
               '-42:J� foi realizado o ajuste de hora di�rio',
               '-43:Comando v�lido ainda em execu��o',
               '-44:Est� em estado de impress�o de cheque',
               '-45:N�o est� em estado de impress�o de cheque',
               '-46:Necess�rio inserir o cheque',
               '-47:Necess�rio inserir nova bobina',
               '-48:Necess�rio executar uma Leitura X',
               '-49:Detectado algum problema na impressora ( paper jam, sobretens�o, etc).',
               '-50:Cupom j� foi totalizado',
               '-51:Necess�rio totalizar cupom antes de fechar',
               '-52:Necess�rio finalizar cupom com comando correto',
               '-53:Ocorreu erro de grava��o na mem�ria fiscal',
               '-54:Excedeu n�mero m�ximo de estabelecimentos',
               '-55:Mem�ria Fiscal n�o inicializada',
               '-56:Ultrapassou valor do pagamento',
               '-57:Registrador n�o programado ou troco j� realizado',
               '-58:Falta completar valor do pagamento',
               '-59:Campo somente de caracteres n�o n�mericos (Alfab�ticos)',
               '-60:Excedeu campo m�ximo de caracteres',
               '-61:Troco n�o realizado',
               '-62:Cmd desabilitado',
               '-63:Reservado',
               '-64:Reservado',
               '-65:Reservado',
               '-66:Reservado',
               '-67:Reservado',
               '-68:Reservado',
               '-69:Reservado',
               '-70:Reservado',
               '-71:Reservado',
               '-72:Reservado',
               '-73:Reservado',
               '-74:Reservado',
               '-75:Reservado',
               '-76:Reservado',
               '-77:Reservado',
               '-78:Reservado',
               '-79:Reservado',
               '-80:Reservado',
               '-81:Reservado',
               '-82:Reservado',
               '-83:Reservado',
               '-84:Falha geral na exeu��o da DLL.',
               '-85:Erro de reconhecimento do comando pelo ECF.',
               '-86:Erro no arquivo de configura��o CIF.INI.',
               '-87:Falha na abertura ou escrita da serial.',
               '-88:Falha na aloca��o de recursos do Windows.',
               '-89:Retorno n�o reconhecido.',
               '-90:Falha na leitura da serial.',
               '-91:Temperatura da Cabe�a Alta.',
               '-92:Detectado Pouco Papel.',
               '-93:Reservado',
               '-94:Erro irrecuper�vel.',
               '-95:Erro Mec�nico.',
               '-96:Detectado Tampa Aberta.',
               '-97:Ainda n�o obteve retorno.',
               '-98:Buffer Overflow. Tamanho da mensagem enviada pelo ECF � maior que o buffer fornecido pela aplica��o.',
               '-99:Impressora esta Desligada.');

        MsgZanthus: array[1..48] of string= (
              '00000:Sucesso.',
              '00001:Comando n�o pode ser executado no presente estado do M�dulo Fiscal.',
              '00002:Argumento de entrada s�o inconsistentes.',
              '00003:Comando n�o executado porque o valor passado � muito elevado.',
              '00004:Configura��o do M�dulo Fiscal n�o permite a execu��o do comando.',
              '00005:Mem�ria Fiscal esgotada.',
              '00006:Mem�ria Fiscal j� inicializada.',
              '00007:Falha ao inicializar Mem�ria Fiscal.',
              '00008:Mem�ria Fiscal j� tem n�mero de fabrica��o.',
              '00009:Mem�ria Fiscal n�o est� inicializada.',
              '00010:Falhar ao gravar Mem�ria Fiscal.',
              '00011:Papel no fim.',
              '00012:Falha na impressora.',
              '00013:Mem�ria do M�dulo Fiscal violada.',
              '00014:Falta Mem�ria Fiscal.',
              '00015:Comando inexistente.',
              '00016:Deve fazer redu��o.',
              '00017:Mem�ria do M�dulo fiscal desprotegida.',
              '00018:Data n�o permite a opera��o.',
              '00019:Fim de tabela ( de CGC/IE, de dias ou de itens no cupom).',
              '00020:Dados fixos do M�dulo Fiscal est�o inconsistentes.',
              '00021:Falha ao configurar dimens�es de cheque para impress�o.',
              '00022:Falha ao imprimir cheque.',
              '00023:Falha ao alterar rel�gio.',
              '00024:Linha n�o pode ser impressa.',
              '00025:Item j� foi cancelado.',
              '00026:Item n�o tem descritivo armazenado, ou falta campo para impress�o de cheque.',
              '00027:Tempo excedido.',
              '00028:M�dulo Fiscal sem forma de pagamento cadastrada.',
              '00029:Vers�o do M�dulo Fiscal difere da gravada na Mem�ria Fiscal (pede interven��o).',
              '00030:N�o pode autenticar documento',
              '00430:ECF n�o consegue ler todos os bytes pedidos.',
              '00431:ECF protocolo - BCC incorreto.',
              '00432:ECF protocolo - muitos argumentos.',
              '00433:ECF protocolo - controle errado.',
              '00434:ECF protocolo - resultado inv�lido.',
              '00435:ECF protocolo - estouro de tentativas.',
              '00436:ECF protocolo - falha de comunica��o.',
              '00437:ECF protocolo - time-out.',
              '00438:ECF protocolo - falha n�o prevista.',
              '00439:ECF protocolo - impressora desligada.',
              '00440:ECF protocolo - falha na porta serial. (paridade ou overrun)',
              '00441:ECF protocolo - falha no protocolo.',
              '00460:ECF pedido de leitura do campo com tamanho n�o previsto.',
              '00461:ECF n�o pode imprimir cheque.',
              '00462:ECF defini��o de cheque inconsistente.',
              '00467:ECF h� algum problema ou inconsist�ncia com a defini��o do Comprovante N�o Fiscal',
              '00468:ECF saldo da Forma de Pagamento no ECF n�o permite a opera��o.');

        MsgCorisco: array[1..34] of string= (
              '00:Sucesso.',
              '01:Caixa Aberto.',
              '02:Cupom Aberto.',
              '03:Caixa Fechado.',
              '04:Cupom Fechado.',
              '05:Fim de Papel.',
              '06:Impressora Off-line.',
              '07:Data atual igual a Data da �ltima abertura.',
              '08:Data atual menor que a Data da �ltima abertura.',
              '09:Cupom sem itens.',
              '10:Forma de pagamento desabilitada.',
              '11:Cupom n�o est� pago.',
              '12:Cupom com apenas 1 item.',
              '13:Rel�gio com problema.',
              '14:Eprom fiscal com problema.',
              '15:CMOS com problema.',
              '16:N�mero seq��ncial com problema.',
              '17:Rolamento de data.',
              '18:N�mero de itens excede limite.',
              '19:N�o h� item especial cadastrado.',
              '20:Cupom fiscal fora da seq��ncia para cupom vinculado.',
              '21:Reservado.',
              '22:Erro de Check-Sum.',
              '23:Flag de troca de papel ligado.',
              '24:Linha n�o pode ser impressa.',
              '25:Item j� foi cancelado.',
              '26:Item n�o tem descritivo armazenado, ou falta campo para impress�o de cheque.',
              '27:Tempo excedido.',
              '28:M�dulo Fiscal sem forma de pagamento cadastrada.',
              '29:Vers�o do M�dulo Fiscal difere da gravada na Mem�ria Fiscal (pede interven��o).',
              '30:N�o pode autenticar documento',
              '31:ECF n�o consegue ler todos os bytes pedidos.',
              '32:ECF protocolo - muitos argumentos.',
              '33:ECF protocolo - controle errado.');


type
  { Excecao que acusa uma entrada invalida por parte do usuario.
    Pode ser verificada em tempo de compilacao. }  EInvalidEntry = Class(Exception);

  { Armazena as aliquotas programadas na impressora fiscal }
  TAliquota = array[0..16] of Single;
  TRetornos = String;

  { Retorno dos Totalizadores Parciais Tributados}  TRetTotParc = Record
      TotParcTrib  :Array[1..16] of Currency;
      Isencao      :Currency;
      NaoIncid     :Currency;
      Substituicao :Currency;
      TotParcNTrib :Array[1..9] of Currency;
      Sangria      :Currency;
      Suprimento   :Currency;
      GrandTotal   :Currency;
  end;

  {Para uso na funcao de venda de item}  TItem = Record
      Codigo       : String[13];
      Descricao    : String[190];
      Tributo      : String[2];
      Quantidade   : Currency;
      ValorUnit    : Currency;
      Desconto     : Currency;
      Unidade      : String[2];
      ValorPago    : Currency;
  end;


  {** Tipo para controlar as diversas impressoras implementaveis }  TECFModel = (teNone,teBematech,teBematechII,teSweda,teSchalterSP,teYanco,teElgin,teZanthusIZs_e_Qz,teCorisco,teUrano);

  TECFAutor = (RamosdaInformatica);

  TUserEvent=procedure(ErrorCode:Integer; MsgError:String ) of object;

  TPrgFiscal = class(TComponent)  private
     Buffer,mensage,Tmensage1    : String; { recebe o string a ser enviado ao comando FormataTx }
     MsgError  : String;
     NroRet, tmensage    : Integer; {nro do retorno da impressora schalter}
     BufferElgin    :  integer;
     RelGer : char;
     StrRet    : string;  {string do retorno da impressora schalter e sweda}
     Comando   : array [0..512] of char; // comando para impressora sweda
     Messagem_tam : pchar;
     Messagem: Pchar;

    { TestaTX e um flag que armazena o retorno da funcao FormataTX, seus valores de
      retorno sao:
      0  - sucesso
      1  - erro de comunicacao fisica
      -2 - parametro invalido }     {65534}

     TestaTX    : Integer;
     FExecuted  : Boolean;
     FUserEvent : TUserEvent;
     FECFModel  : TECFModel;     FECFAutor  : TECFAutor;     FNumPorta  : Byte;   {Numero da porta serial a qual a impressora esta conectada}     paridade,            {dados para abertura da porta serial}     databits,     stopbits   : Byte;     velocidade : DWord;{     Table1  : TTable;    {arquivo para sequencia em operacao nao fiscal}{     Source1 : TDataSource;}
     function  GetVarStr(Index:Integer) :String;
     function  GetVarByte(Index:Integer):Byte;
     function  GetVarReal(Index:Integer):Currency;

  protected     function   ImpInError(Buffer: string): Boolean;
     procedure  FormatEntry(var ParamIni:String);

  public     function LeIni(Inifile:String;Secao:String;Chave:String):String;
     procedure GravaIni(Inifile:String;Secao:String;Chave:String;valor:String);
     function StrToPChar(const Str: string): PChar;
     function ReturnVar(Param: Integer):String;
     function IntToBin(Value: LongInt;Size: Integer): String;
     function TrocaEpacoPSustenido(Texto: string): String;
     constructor Create(AOwner: TComponent); override;
     destructor  Destroy; override;

     function   MudaHoraVerao(EntraVerao:string):Boolean; // parametro : S ou N     function   ConfiguraPorta(aPorta:Integer):Boolean;     function   TruncArredonda(vPar:string):Boolean;     function   MudaMoedaCorr(Simbolo: String):Boolean;
     function   CadAliqTribut(Aliquota: Single):Boolean;
     function   CadAliqTributII(Aliquota:Single; ISS:String):Boolean;
     function   ConAliqTribut: TAliquota;
     function   VinculaISS(StringVinc:String):Boolean;     function   NomeiaTotParc(nTot,Nome:String):Boolean;     function   ConsTotalParc: TRetTotParc;
     function   LeitMemFiscal(ParamIni, ParamFinal:String; Option:Byte; Saida:Char): Boolean;
     function   LeitMemFiscArq(ParamIni,ParamFinal,oArquivo:string ;Option:Byte):boolean;
     function   LeitMemFiscArqElgin:boolean;

     function   EmiteReducaoZ:Boolean;
     function   EmiteLeituraX:Boolean;
     function   LeitEstAtual: Boolean;
     function   EmiteCupNFisc(Texto: String):Boolean;
     function   FechaCupNFisc:Boolean;
     function   AbreCuponFisc:Boolean;
     function   VendaItemFisc(Item :TItem; FormaDesconto:Byte; CasasDec:Integer):Boolean;
     function   CancItemAnter(NumItem: Word):Boolean;
     function   CancItemAleat(NumItem: Word):Boolean;
     function   FechCupomFisc(ValorPago,ValorAcrDes: Currency ; TipoAcrDes:Char;
                               MensPromoc: String):Boolean;
     function   FechCupFiscPrzo(ValorPago,ValorAcrDes: Currency ; TipoAcrDes:Char;
                               MensPromoc: String):Boolean;
     function   CanUltCupFisc:Boolean;
     function   CanCupFiscAberto:Boolean;
     function   LeitVlrSTotIt: Currency;
     function   AutentDocMod1:Boolean;
     function   AutentDocMod2(MensAutent: String; TipImpCNE:Char):Boolean;
     function   AcionGavetDin(TempAcion: Byte):Boolean;
     function   SanSupDinhGav(Valor: Currency;TipoAcaoG: String):Boolean;
     function   EstGavetaDinh:Boolean;
     function   NumSeqCupFisc: Word;
     function   IniFechCupfisc(Percentagem: Single; TipoAcao,Toper:Char; ValTot : String ):Boolean;
     function   EfetFormPag(Valor:Currency; DescFormPgto:String;PagtoEm,Troco:String):Boolean;
     function   EfetFormPagII(IndexFP:string; Valor:Currency; DescFormPgto:String):Boolean;
     function   ProgVerFormPagII(DescFormPgto:String):string;
     function   TermFechCupFisc(Msg: String):Boolean;
     function   LeitStatus:Boolean;
     function   LegendaNaoFiscal(reg,legenda:String):Boolean;
     function   AumentaDescrItem(Descricao: String):Boolean;
     function   ConsultaHoraVerao:TRetornos; // parametro : S ou N
     function   IniciaDia(Pr1 : String; Pr2 : String; Pr3 : String):Boolean;
     function   FinalizaDia(Pr1 : String; Pr2 : String; Pr3 : String):Boolean;
     function   Emergencia(Pr1 : String; Pr2 : String):Boolean;

     {ACRESCENTADO PARA SCHALTER}
     function   SchalterErros(NroRet:Integer;StrRet,TipoRet:string):boolean;
     function   CadAliqSchalter(Posicao:Integer;Aliquota:Single):Boolean;
     function   LeitStatusSchalter:string;

     {ACRESCENTADO PARA A YANCO}
     procedure  ExecYanco(aPorta:integer;vLin1:string);
     function   YancoErros:boolean;
     function   Executa(Comando:PChar;Modo:integer;var PI:TProcessInformation):boolean;
     function   DescAcrescSubTotal(ValorAcrDes:Currency;TipoAcrDes:string):boolean;
     function   LancaFinalizadora(ValorPago:Currency;Finalizadora:Integer):boolean;
     function   TrocaOperador(NomeOperador:string):Boolean;
     function   InicioDeDia(Operador:string):boolean;

     {ACRESCENTADO PARA A SWEDA}
     function   SwedaErros(Recebe1:string):boolean;
     function   FechCupomSweda(ValorPago,ValorAcrDes:Currency; aMens:array of String):Boolean;
     function   IniciaSweda(aPorta:integer):boolean;
     function   FinalizaSweda(aPorta:integer):boolean;

     {ACRESCENTADO PARA A ELGIN}
     function   ElginErros(NroRet:Integer;StrRet,TipoRet:string):boolean;

     {ACRESCENTADO PARA A ZANTHUS}
     function ZanthusConfigura:Boolean;
     function ComandoZanthus(vCmdz: Integer; vArgumz : Pchar; Tam_retz : Pchar ):Boolean;
     function ZanthusErros( Codigo : String ) : Boolean;


     {ACRESCENTADO PARA A CORISCO}
     function ComandoCorisco(vCmdc : Integer; Par1 : Pchar; Par2 : Pchar; Par3 : Pchar) : Boolean;
     function CoriscoErros(StrRet : String ) : Boolean;

     {ACRESCENTADO PARA A URANO}
{     function ComandoUrano
     function UranoErros}



  published
     property Executed  : Boolean    read  FExecuted   write FExecuted default True;
     property OnError   : TUserEvent read  FUserEvent  write FUserEvent;
     property ECFModel  : TECFModel  read  FECFModel   write FECFModel default teNone;     property ECFAutor  : TECFAutor  read  FECFAutor   write FECFAutor default RamosdaInformatica;     property NumPorta  : Byte       read  FNumPorta   write FNumporta ;  public    {ACRESCENTADO PARA A ZANTHUS}    ret,cmd:Integer;    A: array [0..40] of Char;
    B: array [0..300] of Char;
    C: array [0..40] of Char;
    D: array [0..300] of Char;
    {result,}argum ,tam_ret,pretorno :PChar;
    Tz : array [0..16] of Char;
    Bufz : PChar;
    Cmdz, retz, lenz, tamz : integer;
    Az: array [0..40] of Char;    Bz: array [0..300] of Char;
    Cz: array [0..40] of Char;
    Dz: array [0..300] of Char;
    resultz, argumz , tam_retz, pretornoz :PChar;
    r1, r3 : Pchar;
    r2 : Integer;
    zret : Boolean;
    Ztret : Boolean; // variavel de retorno as chamadas de comando

    {ACRESCENTADO PARA A CORISCO}
    ctv3 : variant;
    MsgCorisco1, s, t, u: AnsiString;
    cRet : Boolean;

    {ACRESCENTADO PARA A URANO}
    uRet : Boolean;

     {ACRESCENTADO PARA A ELGIN}     ElginRetorno : Integer;
     ElginArqIni  : TIniFile;
     property NumUltItemVend: Byte  index 12   read GetVarByte ;     property VerFirmw:       Byte  index 01   read GetVarByte ;
     property NumContSeq:     Byte  index 06   read GetVarByte ;
     property NumOperNfisc:   Byte  index 07   read GetVarByte ;
     property NumCupCanc:     Byte  index 08   read GetVarByte ;
     property NumReduc:       Byte  index 09   read GetVarByte ;
     property Numcaix:        Byte  index 14   read GetVarByte ;
     property NumLoja:        Byte  index 15   read GetVarByte ;
     property MinutLig:       Byte  index 18   read GetVarByte ;
     property MinutImp:       Byte  index 19   read GetVarByte ;
     property NumSerie:      String index 00   read GetVarStr  ;
     property NumClicheProp: String index 13   read GetVarStr  ;
     property Moeda:         String index 16   read GetVarStr  ;
     property ValorUltCup: Currency   index 22   read GetVarReal ;
     property GrandTot:    Currency   index 03   read GetVarReal ;
     property QuantCanc:   Currency   index 04   read GetVarReal ;
     property QuantDesc:   Currency   index 05   read GetVarReal ;
end;

procedure   Register;
implementation
 // funcoes da impressora Bematech
 //Fun��o da Dll que abre a Porta Serial
// function IniPortaStr(Porta: PChar):integer; stdcall; external 'Mp20fi32.dll' name 'IniPortaStr';
 function IniPortaStr(Porta: String): Integer; stdcall;  external 'MP20FI32.DLL';
 //Fun��o da Dll Para envio de Comando
// function FormataTX(Buffer: PChar):integer; stdcall; external 'Mp20fi32.dll';
 function FormataTX(Buffer: String):  Integer; stdcall;  external 'MP20FI32.DLL';
 //Fun��o da Dll Para Fechar a Porta Serial
// esta funcao        function FechaPorta: integer; stdcall; external 'Mp20fi32.dll' name 'FechaPorta';
 //Fun��o da Dll Para Pegar Retorno da Impressora
 //Deve se Colocar o "VAR" na Frente Pois esta fun��o recebe
 //as Variaveis Por Referencia.
 //Ou Seja, a Dll escreve no endere�o de memoria de sua variavel
// function Status_Mp20FI(var Ret:integer;var ACK:integer;var ST1:integer;var ST2:Integer):integer; stdcall; external 'Mp20fi32.dll';
 //Fun��o Para Ler o Retorno de Variaveis da Impressora
 //Nao Incluir o Var na Declara��o
// function Le_Variaveis(Retorno_var:string):integer; stdcall; external 'Mp20fi32.dll';
// function Retorna_ASCII(Flag:Integer):integer; stdcall; external 'Mp20fi32.dll';


 // funcoes da impressora Sweda function AbrePorta(Numero,Timeout:Integer):Boolean; far; Export; external 'SERSWEDA.DLL' index 1; function EnviaComando(Texto1:PChar):ShortString; far; Export; external 'SERSWEDA.DLL' index 2;
 function FechaPorta(Numero:Integer):Boolean; far; Export; external 'SERSWEDA.DLL' index 3;
 // SchalterSP
 function ecfImpCab (byEst: integer): integer;cdecl; external 'dll32phi.dll'; function ecfVenda_Item (szCodigo,szDescricao,szQInteira,szQFracionada,szValor:string;byTaxa:integer): integer;cdecl; external 'dll32phi.dll';
 function ecfStatusCupom(var general_flag: integer): PChar;cdecl; external 'dll32phi.dll';
 function ecfAcertaData (dia:integer; mes:integer; ano:integer; hor:integer; min:integer; seg:integer ):integer;cdecl; external 'dll32phi.dll';
 function ecfLeituraXSerial: PChar;cdecl; external 'dll32phi.dll';
 function ecfCargaTabAliq (byTaxa:integer; szAliquota:string ):integer; cdecl; external 'dll32phi.dll';
 function ecfLeitMemFisc (byTipo:integer; szDi,szDf:string; wRi:integer; wRf:integer; archive:LPSTR ): integer;cdecl; external 'dll32phi.dll';
 function ecfReducaoZ(operador: string): integer;cdecl; external 'dll32phi.dll';
 function ecfLeituraX(operador: string): integer;cdecl; external 'dll32phi.dll';
 function ecfInicCupomNFiscal (byTipo: integer): integer;cdecl; external 'dll32phi.dll';
 function ecfVendaItem (szDescr,szValor:string; byTaxa: integer): integer;cdecl; external 'dll32phi.dll';
 function ecfDescItem (byTipo:integer; szDescr,szValor:string): integer;cdecl; external 'dll32phi.dll';
 function ecfCancItem (szDescr:string): integer;cdecl; external 'dll32phi.dll';
 function ecfCancItemDef(szItem, szDescr:string): integer;cdecl; external 'dll32phi.dll';
 function ecfPagCancPag (byTipo:integer; szDescr,szValor:string; byMens:integer;byLmens:integer): integer;cdecl; external 'dll32phi.dll';
 function ecfImpLinha (szLinha: string): integer;cdecl; external 'dll32phi.dll';
 function ecfCancVenda(operador: string): integer;cdecl; external 'dll32phi.dll';
 function ecfAutentica (szLinha: string): integer;cdecl; external 'dll32phi.dll';
 function ecfAbreGaveta : integer;cdecl; external 'dll32phi.dll';
 function ecfFimTrans(operador: string): integer;cdecl; external 'dll32phi.dll';
 function ecfStatusImp : PChar;cdecl; external 'dll32phi.dll';
 function ChangePort (choose:integer):Integer; cdecl; external 'dll32phi.dll';
 function ecfLineFeed (byEst:integer; wLin:integer): integer;cdecl; external 'dll32phi.dll';
 function ecfCancAcresDescSubTotal ( byAcres:integer; byTipo:integer; szDescr,szValor:string):integer;cdecl; external 'dll32phi.dll';
 function ecfPrazoCancPrazo (byTipo: integer; szDescr,szValor:string; byMens:integer;byLmens:integer): integer;cdecl; external 'dll32phi.dll';
 function ecfCancDoc(operador:string): integer;cdecl; external 'dll32phi.dll';

 //Elgin
 Const
 ECF32M = 'ECF32M.DLL';
 function    OpenCif : integer;stdcall;external'Ecf32m.dll';
 function    CloseCif : integer;stdcall;external'Ecf32m.dll';
 function    ProgramaHorarioVerao(hv : Char): Integer;stdcall;external'Ecf32m.dll'; function    ProgMoeda(Sim : PChar): Integer;stdcall;external'Ecf32m.dll'; function    ProgAliquotas(Reg : Pchar; Aliq: Pchar): integer;stdcall;external'Ecf32m.dll'; function    LeituraX(RelGer: char): integer;stdcall;external'Ecf32m.dll'; function    ReducaoZ(RelGer: char): integer;stdcall;external'Ecf32m.dll';
 function    AbreCupomFiscal : integer;stdcall;external'Ecf32m.dll'; function    VendaItem(fmt:Byte;qtd,punit,trib:pchar;tdesc:char;valor,unid,cod:pchar;ex:char;descr,legop:pchar):integer;stdcall;external'Ecf32m.dll';
 function    TransTabAliquotas(BitTest : Integer;BufStat : Pchar) : integer;stdcall;external'Ecf32m.dll';
 function    LeMemFiscalData(datai,dataf : Pchar;Res : char) : integer;stdcall;external'Ecf32m.dll';
 function    LeMemFiscalReducao(redi,redf : Pchar;Res : char) : integer;stdcall;external'Ecf32m.dll';
 function    EcfPar(Par : Pchar): integer;stdcall;external'Ecf32m.dll';
 function    ObtemRetorno(buf_ret : Pchar): integer;stdcall;external'Ecf32m.dll';
 function    CancelamentoItem(numitem:string): integer;stdcall;external'Ecf32m.dll';
 function    TotalizarCupomParcial : integer;stdcall;external'Ecf32m.dll';
 function    TotalizarCupom(oper:Byte;toper:char;valor:pchar;legop:pchar): integer;stdcall;external'Ecf32m.dll';
 function    Pagamento(reg,vpgto:pchar;pagto:char): integer;stdcall;external'Ecf32m.dll';
 function    FechaCupomFiscal(tam_msg,msg:pchar): integer;stdcall;external'Ecf32m.dll';
 function    CancelaCupomFiscal : integer;stdcall;external'Ecf32m.dll';
 function    ProgramaLegenda(Reg : Pchar; leg: Pchar): integer;stdcall;external'Ecf32m.dll';

 function DescontoItem(toper:char;valor:pchar;legop:pchar): integer;stdcall;external'Ecf32m.dll';

 // Zanthus
 function ZAPIF (n_com : Integer ; parg , pret : PChar; tam : integer ; result , tamret : PChar) : Integer ; stdcall ; external 'ZAPIF.DLL';
 procedure ZConfECF ; stdcall ; external 'ZAPIF.DLL';

 // Urano




{* ========================================================================== *
   Construtor do objeto
 * ========================================================================== *}

constructor TPrgFiscal.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);

   Velocidade:=9600;   {configura parametros na criacao do componente}
   databits:=8;
   Stopbits:=0;
   Paridade:=0;

end;

{* ========================================================================== *   Destrutor do objeto
 * ========================================================================== *}
destructor TPrgFiscal.Destroy;
begin
   inherited destroy;
end;

{* ========================================================================== *   Registra o componente na paleta de reposit�rio
 * ========================================================================== *}
procedure Register;
begin
  RegisterComponents('Rm-Info',[TPrgFiscal]);
end;

{* ========================================================================== *   Retorna o valor da propriedade solicitada
 * ========================================================================== *}
function TPrgFiscal.GetVarStr(Index:Integer):String;
begin
   Result := ReturnVar(Index);
end;

function TPrgFiscal.GetVarByte(Index:Integer):Byte;begin
   Result := StrToInt(ReturnVar(Index));
end;

function TPrgFiscal.GetVarReal(Index:Integer):Currency;begin
   Result := StrToFloat(ReturnVar(Index))/100;
end;

{* ========================================================================== *
  Procedimento para Configurar Porta de Comunica��o - SCHALTERSP
* ========================================================================== *}
function TPrgFiscal.ConfiguraPorta(aPorta:Integer):Boolean;
begin

   result := False;


   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
   begin
      Raise EInvalidEntry.Create('Comando N�o Dispon�vel na Bematech');      Result := True;   end;
   case ECFModel of
      teSweda:
      begin
         Raise EInvalidEntry.Create('Comando N�o Dispon�vel na Sweda');         Result := True;      end;      teSchalterSP:      begin
         NroRet := ChangePort(aPorta);
         if NroRet <> aPorta then
            Result := false
         else
            Result := true;
      end;      teYanco:      begin
         Raise EInvalidEntry.Create('Comando N�o Dispon�vel na Yanco');         Result := True;      end;      teZanthusIZs_e_Qz:      begin       ZConfECF( );       Result := true;      end;      teCorisco:      begin        Raise EInvalidEntry.Create('Comando N�o Dispon�vel na Corisco');        Result := True;      end;      teNone:      begin         Result := true;      end;  end;end;

function TPrgFiscal.IniciaSweda(aPorta:integer):boolean;
begin
   AbrePorta(aPorta+1,5);
   Result := true;
end;

function TPrgFiscal.FinalizaSweda(aPorta:integer):boolean;
begin
   FechaPorta(aPorta+1);
   Result := true;
end;

{* ========================================================================== *  Procedimento para mudan�a do hor�rio de ver�o.- BEMATECH-SWEDA-SCHALTERSP-YANCO
* ========================================================================== *}
function TPrgFiscal.MudaHoraVerao(EntraVerao:string):Boolean;
var sHora,sData,vLin1,vLin2,recebe,vRes : string;
    dData : TDateTime;
    vDia,vMes,vAno,vHora,vMin,vSeg : integer;
begin
   result := false;

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
   begin
      Buffer := Concat(Chr(27),'|','18','|',Chr(27));
      Result := ImpInError(Buffer);
   end;   case ECFModel of     teSweda:     begin        // primeiro verifica se esta ou nao em horario de verao        StrPCopy(Comando,#27+'.28}');        StrRet:=EnviaCOmando(Comando);        vRes  := Copy(StrRet,54,1);        if EntraVerao = 'S' then
        begin
           if vRes = 'S' then
           begin
              Executed := false; Result := false;
              if Assigned(FUserEvent) then OnError(1,'ECF j� est� em Hor�rio de Ver�o');
              exit;
           end;
        end
        else
        begin
           if vRes = 'N' then
           begin
              Executed := false; Result := false;
              if Assigned(FUserEvent) then OnError(1,'ECF n�o est� em Hor�rio de Ver�o');
              exit;
           end;
        end;
        StrPCopy(Comando,#27+'.36' + EntraVerao + '}');     // entrar ou sair
        StrRet:=EnviaCOmando(Comando);        Result := True;
     end;     teSchalterSP:     begin        NroRet := 0;        StrRet := ecfStatusCupom(NroRet);        if SchalterErros(NroRet,StrRet,'S') then        begin           sData := Copy(StrRet,18,25);           vDia  := StrToInt(Copy(sData,1,2));           vMes  := StrToInt(Copy(sData,4,2));           vAno  := StrToInt(Copy(sData,7,2));           sHora := Copy(StrRet,12,17);           vMin  := StrToInt(Copy(sHora,3,2));           vSeg  := StrToInt(Copy(sHora,5,2));           if EntraVerao = 'S' then           begin              vHora := StrToInt(Copy(sHora,1,2))+1;              if vHora = 13 then              begin                 vHora := 1;                 dData := StrToDate(Copy(sData,1,2)+'/'+Copy(sData,4,2)+'/'+Copy(sData,7,2));                 dData := dData+1;                 sData := DateToStr(dData);                 vDia  := StrToInt(Copy(sData,1,2));                 vMes  := StrToInt(Copy(sData,4,2));                 vAno  := StrToInt(Copy(sData,7,2));              end;           end           else           begin              vHora := StrToInt(Copy(sHora,1,2))-1;              if vHora = 0 then              begin                 vHora := 12;                 dData := StrToDate(Copy(sData,1,2)+'/'+Copy(sData,4,2)+'/'+Copy(sData,7,2));                 vDia  := vDia-1;                 sData := DateToStr(dData);                 vDia  := StrToInt(Copy(sData,1,2));                 vMes  := StrToInt(Copy(sData,4,2));                 vAno  := StrToInt(Copy(sData,7,2));              end;           end;           NroRet := ecfAcertaData(vDia,vMes,vAno,vHora,vMin,vSeg);           StrRet := '';           Result := SchalterErros(NroRet,StrRet,'N');
           if Result then ecfLineFeed(1,6);
        end;
     end;     teYanco:     begin        if EntraVerao = 'S' then           vLin2 := '0'        else           vLin2 := '1';        ExecYanco(NumPorta,'08');        Result := YancoErros;     end;     teZanthusIZs_e_Qz:     begin       if EntraVerao = 'S' then begin         Ztret := ComandoZanthus(90,'\\S\','');
       end
       else if EntraVerao = 'N' then begin
         Ztret := ComandoZanthus(90,'\\N\','');
       end;
        Result := True;
     end;     teNone:     begin       Result := True;     end;   end;end;
 {* ========================================================================== *
   Se PAR trunca os valores, se IMPAR arredonda os valores - BEMATECH
 * ========================================================================== *}
function TPrgFiscal.TruncArredonda(vPar:string):Boolean;
begin
   result := false;

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
   begin
      if (vPar <> '0') and
         (vPar <> '1') then
         Raise EInvalidEntry.Create('Parametro deve ser 0 ou 1');

      Buffer := Concat(Chr(27),'|','39','|',vPar,'|',Chr(27));
      Result := ImpInError(Buffer);
   end;   case ECFModel of
      teSweda:
      begin         Result := true;      end;      teSchalterSP:      begin         Result := true;      end;      teYanco:      begin         Result := true;      end;      teNone:      begin         Result := true;      end;      teZanthusIZs_e_Qz:      begin         Result := true;      end;      teCorisco:      begin         Result := true;      end;    end;end;

{* ========================================================================== *   Procedimento para mudan�a do s�mbolo monet�rio. - BEMATECH
 * ========================================================================== *}
function TPrgFiscal.MudaMoedaCorr(Simbolo: String):Boolean;
begin
   result := false;

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
      begin
         if Length(Simbolo)>2 then           Simbolo  := Copy(Simbolo,1,2);
         Buffer := Concat(Chr(27),'|','01','|',Simbolo,'|',Chr(27));
         Result := ImpInError(Buffer);
      end;   case ECFModel of
      teSweda:
      begin         Raise EInvalidEntry.Create('Este Comando N�o Pode Ser Executado em Modo Fiscal');         Result := True;      end;      teSchalterSP:      begin         Raise EInvalidEntry.Create('Comando N�o Dispon�vel na teSchalterSP');         Result := True;      end;      teYanco:      begin         Raise EInvalidEntry.Create('Somente sob INTERVEN��O T�CNICA');         Result := True;      end;      teNone:      begin         Result := True;      end;   end;end;

{* ========================================================================== *   Procedimento para cadastramento de aliquotas tribut�ria. BEMATECH-SWEDA
 * ========================================================================== *}
function TPrgFiscal.CadAliqTribut(Aliquota: Single ):Boolean;
var  Aliq,recebe,nAliq :String;
     i : integer;
     asAliqs : TAliquota;
     BufReg: pchar;
     BufAliq: pchar;
     GravarReg,GravarAliq: String;
     zret : Boolean;
begin
   result := false;   if Aliquota >=100 then     Raise EInvalidEntry.Create('A Aliquota deve ser inferior a 100%');
   Aliq := Copy(FormatFloat('0000',100*Aliquota),1,4);   if (ECFModel=teBematech) or (ECFModel=teBematechII) then   begin      Buffer := Concat(Chr(27),'|','07','|',Aliq,'|',Chr(27));      Result := ImpInError(Buffer);
   end;   case ECFModel of      teSweda:      begin         // PRIMEIRO CONSULTA AS ALIQUOTAS CADASTRADAS         asAliqs := ConAliqTribut;         for i := 1 to 16 do         begin            if asAliqs[i] = 0 then            begin               nAliq := IntToStr(i); while Length(nAliq)<2 do nAliq := '0'+nAliq;               StrPCopy(Comando,#27+'.33T'+nAliq+'T'+Aliq+Aliq+'0000}');               StrRet:=EnviaCOmando(Comando);               break;            end;         end;         Result := True;      end;      teSchalterSP:      begin         Raise EInvalidEntry.Create('Para Impressora Schalter Utilize Fun��o CadAliqSchalter');         Result := false;      end;      teYanco:      begin         Raise EInvalidEntry.Create('Cadastrar Al�quotas s� sob INTERVEN��O T�CNICA');         Result := false;      end;      teElgin:      begin         // PRIMEIRO CONSULTA AS ALIQUOTAS CADASTRADAS         asAliqs := ConAliqTribut;         for i := 1 to 16 do         begin            if asAliqs[i] = 0 then            begin               nAliq := IntToStr(i);               while Length(nAliq)<2 do nAliq := '0'+nAliq;               BufReg:=StrToPchar(nAliq);               BufAliq:=StrToPchar(Aliq);
               OpenCif;               ElginRetorno := ProgAliquotas(BufReg,BufAliq);
               StrRet := '';
               Result := ElginErros(ElginRetorno,StrRet,'N');               CloseCif;
               GravarReg:='T'+nAliq;
               GravarAliq:=Copy(Aliq,1,2)+','+Copy(Aliq,3,2);
               GravaIni('controls','Aliquotas',GravarReg,GravarAliq);
               ShowMessage('Registrador = '+GravarReg+^M+
                           'Aliquota = '+GravarAliq+^M+                           'Registrador para Arquivo Ini.');               break;
            end;         end;         Result := True;      end;      teZanthusIZs_e_Qz:      begin       asAliqs := ConAliqTribut;       argumz := '\T1\1050\T2\1150\T3\1250\T4\1350\T5\1450\T6\1550\T7\1650\T8\1750\T9\1850\T10\1950\';       zret := ComandoZanthus(91,argumz,'');
       if ( zret = True ) then begin
        Result := True;
       end 
       else if ( zret = False ) then begin
        Result := False;
       end;
      end;      teNone:      begin         Result := True;      end;   end;
end;{* ========================================================================== *   Cadastra al�quota com op��o para vincular ao ISS (1=ISS 0=ICMS)
 * ========================================================================== *}
function TPrgFiscal.CadAliqTributII(Aliquota:Single; ISS:String):Boolean;var  Aliq :String;
     i : integer;
begin
   result := false;   if Aliquota >=100 then     Raise EInvalidEntry.Create('A Aliquota deve ser inferior a 100%');
   Aliq := Copy(FormatFloat('0000',100*Aliquota),1,4);   if (ISS<>'0') and (ISS<>'1') then     Raise EInvalidEntry.Create('Par�metro ISS deve ser 0(ICMS) ou 1(ISS)');   if (ECFModel=teBematechII) then   begin      Buffer := Concat(Chr(27),'|','07','|',Aliq,'|',ISS,'|',Chr(27));      Result := ImpInError(Buffer);
   end;end;{* ========================================================================== *   Procedimento para cadastramento de aliquotas tribut�ria. SCHALTER
 * ========================================================================== *}
function TPrgFiscal.CadAliqSchalter(Posicao:Integer;Aliquota:Single):Boolean;var Aliq : string;begin   result := false;   if Aliquota >=100 then     Raise EInvalidEntry.Create('A Aliquota deve ser inferior a 100%');
   Aliq := Copy(FormatFloat('0000',100*Aliquota),1,4);   StrRet := '';   NroRet := ecfCargaTabAliq(Posicao,Aliq);   Result := SchalterErros(NroRet,StrRet,'N');end;{* ========================================================================== *
   Vincula��o de aliquota ao ISS - BEMATECH
 * ========================================================================== *}
function TPrgFiscal.VinculaISS(StringVinc:String):Boolean;
begin

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       if Length(StringVinc)<16 then
          Raise EInvalidEntry.Create('Parametro precisa conter 16 caracteres');

       Buffer := Concat(Chr(27),'|','38','|',Copy(StringVinc,1,16),'|',Chr(27));
       Result := ImpInError(Buffer);
     end;   case ECFModel of     teSweda:     begin       Raise EInvalidEntry.Create('teSweda n�o necessita deste Comando');       Result := True;     end;     teSchalterSP:     begin       Raise EInvalidEntry.Create('Comando N�o Dispon�vel na teSchalterSP');       Result := True;     end;     teYanco:     begin       Raise EInvalidEntry.Create('Comando N�o Dispon�vel na teYanco');       Result := True;     end;     teNone:     begin       Result := True;     end;   end;end;
{ * ==========================================================================
{ Nomeia Totalizadores Parciais nao sujeitos ao ICMS - BEMATECH
 * ========================================================================== *}
function TPrgFiscal.NomeiaTotParc(nTot,Nome:String):Boolean;
var recebe,recebe1 : string;
    vOK : boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       if (Length(Nome)>19) then
          Nome := Copy(Nome,1,19)
       else
       begin
          While Length(Nome)<19 do Nome := Nome+' ';
       end;
       Buffer := Concat(Chr(27),'|','40','|',nTot,'|',Nome,'|',Chr(27));
       Result := ImpInError(Buffer);
     end;   case ECFModel of     teSweda:     begin        Nome := 'DINHEIRO       VENDA A PRAZO  ';        StrPCopy(Comando,#27+'.39'+Nome+'}');        StrRet:=EnviaCOmando(Comando);        Result := True;     end;
     teSchalterSP:     begin       Raise EInvalidEntry.Create('Comando N�o dispon�vel na teSchalterSP');       Result := True;     end;     teYanco:     begin       Raise EInvalidEntry.Create('Somente com INTERVEN��O T�CNICA');       Result := True;     end;     teNone:     begin       Result := True;     end;   end;end;
{* ========================================================================== *   Fun��o para consulta de aliquotas tribut�rias.
   Retorno da funcao: Numero de aliquotas efetivamente programadas mais 16
   elementos indicando as aliquotas. Sera retornado zero para as aliquotas
   nao programadas.
 * ========================================================================== *}
function TPrgFiscal.ConAliqTribut  : TAliquota ;
var ResultArqMP20FI, Recebe, Recebe1   : String;
    AreaArqMP20FI             : TextFile;
    NumAliquota, Cont         : Byte;
    Aliquota                  : TAliquota;
    i,j,pos : Integer;
    Buff_ret : Array [0..2048]of  char;
begin
   if ( ECFModel = teBematech ) or ( ECFModel = teBematechII ) then begin
       Buffer := ConCat(Chr(27),'|','26','|',Chr(27));       if not ImpInError(Buffer) then
       begin
         AssignFile(AreaArqMP20FI,'MP20FI.RET');
         Reset(AreaArqMP20FI);
         try
            Readln(AreaArqMP20FI,ResultArqMP20FI);
         finally
           CloseFile(AreaArqMP20FI);
         end;
         NumAliquota := StrToInt(Copy(ResultArqMP20FI,01,02));
         Aliquota[0] :=NumAliquota;
         for cont:=1 to NumAliquota do
            Aliquota[Cont] := StrToInt(Copy(ResultArqMP20FI,(4*Cont-1),04))/100;
         for Cont := (NumAliquota+1) to 16 do
           Aliquota[Cont] := 0;
       end;
       Result  := Aliquota;
     end;

   case ECFModel of     teSweda:     begin        StrPCopy(Comando,#27+'.293}');        Recebe:=EnviaCOmando(Comando);        Recebe1 := trim(Copy(Recebe, 49,64));        StrPCopy(Comando,#27+'.294}');        Recebe:=EnviaCOmando(Comando);        Recebe1 := Recebe1+trim(Copy(Recebe, 8,120));        StrPCopy(Comando,#27+'.295}');        Recebe:=EnviaCOmando(Comando);        Recebe1 := Recebe1+trim(Copy(Recebe, 8,64));        if Recebe1 <> '' then           Executed := True        else           Executed := false;        i := 1;
        while Length(Recebe1)>=16 do
        begin
           Aliquota[i] := StrToInt(Copy(Recebe1,9,4))/100;
           Recebe1 := Copy(Recebe1,17,Length(recebe1));
           Inc(i);
        end;
        while i <= 16 do
        begin
           Aliquota[i] := 0;
           Inc(i);
        end;
        Result   := Aliquota;
     end;
     teSchalterSP:     begin       NroRet := 0;       StrRet := ecfLeituraXSerial;       if SchalterErros(NroRet,StrRet,'S') then       begin          Recebe := StrRet;          Aliquota[1]  := StrToFloat(Copy(Recebe,173,5));          Aliquota[2]  := StrToFloat(Copy(Recebe,214,5));          Aliquota[3]  := StrToFloat(Copy(Recebe,255,5));          Aliquota[4]  := StrToFloat(Copy(Recebe,296,5));          Aliquota[5]  := StrToFloat(Copy(Recebe,337,5));          Aliquota[6]  := StrToFloat(Copy(Recebe,378,5));          Aliquota[7]  := StrToFloat(Copy(Recebe,419,5));          Aliquota[8]  := StrToFloat(Copy(Recebe,460,5));          Aliquota[9]  := StrToFloat(Copy(Recebe,501,5));          Aliquota[10] := StrToFloat(Copy(Recebe,542,5));          Aliquota[11] := 0;          Aliquota[12] := 0;          Aliquota[13] := 0;          Aliquota[14] := 0;          Aliquota[15] := 0;          Aliquota[16] := 0;          Result := Aliquota;       end;     end;     teYanco:     begin       ExecYanco(NumPorta,'2E');       if YancoErros then       begin          Aliquota[1]  := StrToFloat(Copy(StrRet,002,2)+','+Copy(StrRet,4,2));          Aliquota[2]  := StrToFloat(Copy(StrRet,007,2)+','+Copy(StrRet,9,2));          Aliquota[3]  := StrToFloat(Copy(StrRet,012,2)+','+Copy(StrRet,14,2));          Aliquota[4]  := StrToFloat(Copy(StrRet,017,2)+','+Copy(StrRet,19,2));          Aliquota[5]  := StrToFloat(Copy(StrRet,022,2)+','+Copy(StrRet,24,2));          Aliquota[6]  := StrToFloat(Copy(StrRet,027,2)+','+Copy(StrRet,29,2));          Aliquota[7]  := StrToFloat(Copy(StrRet,032,2)+','+Copy(StrRet,34,2));          Aliquota[8]  := StrToFloat(Copy(StrRet,037,2)+','+Copy(StrRet,39,2));          Aliquota[9]  := StrToFloat(Copy(StrRet,042,2)+','+Copy(StrRet,44,2));          Aliquota[10] := StrToFloat(Copy(StrRet,047,2)+','+Copy(StrRet,49,2));          Aliquota[11] := StrToFloat(Copy(StrRet,052,2)+','+Copy(StrRet,54,2));          Aliquota[12] := StrToFloat(Copy(StrRet,057,2)+','+Copy(StrRet,59,2));          Aliquota[13] := StrToFloat(Copy(StrRet,062,2)+','+Copy(StrRet,64,2));          Aliquota[14] := StrToFloat(Copy(StrRet,067,2)+','+Copy(StrRet,69,2));          Aliquota[15] := StrToFloat(Copy(StrRet,072,2)+','+Copy(StrRet,74,2));          Aliquota[16] := StrToFloat(Copy(StrRet,077,2)+','+Copy(StrRet,79,2));          Result := Aliquota;       end;     end;     teElgin:     begin        OpenCif();        EcfPar('');
        ElginRetorno:=ObtemRetorno(Buff_ret);
        CloseCif();
        StrRet := '';        ElginErros( ElginRetorno,StrRet,'N');        if ElginErros( ElginRetorno,StrRet,'N') then
        begin
           Aliquota[1]  := StrToFloat(Copy(Buff_ret,20,2)+','+Copy(Buff_ret,22,2));           Aliquota[2]  := StrToFloat(Copy(Buff_ret,24,2)+','+Copy(Buff_ret,26,2));           Aliquota[3]  := StrToFloat(Copy(Buff_ret,28,2)+','+Copy(Buff_ret,30,2));           Aliquota[4]  := StrToFloat(Copy(Buff_ret,32,2)+','+Copy(Buff_ret,34,2));           Aliquota[5]  := StrToFloat(Copy(Buff_ret,36,2)+','+Copy(Buff_ret,38,2));           Aliquota[6]  := StrToFloat(Copy(Buff_ret,40,2)+','+Copy(Buff_ret,42,2));           Aliquota[7]  := StrToFloat(Copy(Buff_ret,44,2)+','+Copy(Buff_ret,46,2));           Aliquota[8]  := StrToFloat(Copy(Buff_ret,48,2)+','+Copy(Buff_ret,50,2));           Aliquota[9]  := StrToFloat(Copy(Buff_ret,52,2)+','+Copy(Buff_ret,54,2));           Aliquota[10] := StrToFloat(Copy(Buff_ret,56,2)+','+Copy(Buff_ret,58,2));           Aliquota[11] := StrToFloat(Copy(Buff_ret,60,2)+','+Copy(Buff_ret,62,2));           Aliquota[12] := StrToFloat(Copy(Buff_ret,64,2)+','+Copy(Buff_ret,66,2));           Aliquota[13] := StrToFloat(Copy(Buff_ret,68,2)+','+Copy(Buff_ret,70,2));           Aliquota[14] := StrToFloat(Copy(Buff_ret,72,2)+','+Copy(Buff_ret,74,2));           Aliquota[15] := StrToFloat(Copy(Buff_ret,76,2)+','+Copy(Buff_ret,78,2));        end;        Result := Aliquota;     end;     teZanthusIZs_e_Qz:     begin      Ztret := ComandoZanthus(49,'','800');    if ( Ztret = True ) then begin      if ( Copy(pretorno,8,4) <> '0' ) and ( Copy(pretorno,8,4) <> '\' ) and ( Copy(pretorno,8,4) <> '' ) then begin
           Aliquota[1]  := StrToFloat(Copy(pretorno,8,4));
      end;
      if ( Copy(pretorno,19,4) <> '0' ) and ( Copy(pretorno,19,4) <> '\' ) and ( Copy(pretorno,19,4) <> '' ) then begin
           Aliquota[2]  := StrToFloat(Copy(pretorno,19,4));
      end;
      if ( Copy(pretorno,30,4) <> '0' ) and ( Copy(pretorno,30,4) <> '\' ) and ( Copy(pretorno,30,4) <> '' ) then begin
           Aliquota[3]  := StrToFloat(Copy(pretorno,30,4));
      end;
      if ( Copy(pretorno,41,4) <> '0' ) and ( Copy(pretorno,41,4) <> '\' ) and ( Copy(pretorno,41,4) <> '' ) then begin
           Aliquota[4]  := StrToFloat(Copy(pretorno,41,4));
      end;
      if ( Copy(pretorno,52,4) <> '0' ) and ( Copy(pretorno,52,4) <> '\' ) and ( Copy(pretorno,52,4) <> '' ) then begin
           Aliquota[5]  := StrToFloat(Copy(pretorno,52,4));
      end;
      if ( Copy(pretorno,63,4) <> '0' ) and ( Copy(pretorno,63,4) <> '\' ) and ( Copy(pretorno,63,4) <> '' ) then begin
           Aliquota[6]  := StrToFloat(Copy(pretorno,63,4));
      end;
      if ( Copy(pretorno,74,4) <> '0' ) and ( Copy(pretorno,74,4) <> '\' ) and ( Copy(pretorno,74,4) <> '' ) then begin
           Aliquota[7]  := StrToFloat(Copy(pretorno,74,4));
      end;
      if ( Copy(pretorno,85,4) <> '0' ) and ( Copy(pretorno,85,4) <> '\' ) and ( Copy(pretorno,85,4) <> '' ) then begin
           Aliquota[8]  := StrToFloat(Copy(pretorno,85,4));
      end;
      if ( Copy(pretorno,96,4) <> '0' ) and ( Copy(pretorno,96,4) <> '\' ) and ( Copy(pretorno,96,4) <> '' ) then begin
           Aliquota[9]  := StrToFloat(Copy(pretorno,96,4));
      end;
      if ( Copy(pretorno,108,4) <> '0' ) and ( Copy(pretorno,108,4) <> '\' ) and ( Copy(pretorno,108,4) <> '' ) then begin
           Aliquota[10]  := StrToFloat(Copy(pretorno,108,4));
      end;
      Aliquota[11] := 0000;
      Aliquota[12] := 0000;      Aliquota[13] := 0000;      Aliquota[14] := 0000;      Aliquota[15] := 0000;      Aliquota[16] := 0000;      Result := Aliquota;      Executed := True;    end    else if ( Ztret = False ) then begin
       ShowMessage('Aliquotas parecem n�o estar cadastradas corretamente');
       Aliquota[1] := 0000;
       Aliquota[2] := 0000;       Aliquota[3] := 0000;       Aliquota[4] := 0000;       Aliquota[5] := 0000;       Aliquota[6] := 0000;       Aliquota[7] := 0000;
       Aliquota[8] := 0000;       Aliquota[9] := 0000;       Aliquota[10] := 0000;       Aliquota[11] := 0000;       Aliquota[12] := 0000;       Aliquota[13] := 0000;
       Aliquota[14] := 0000;       Aliquota[15] := 0000;       Aliquota[16] := 0000;       Result := Aliquota;
    end;
    end;
     teNone:     begin       Result := Aliquota;     end;   end;end;

{* ========================================================================== *   Fun��o para consulta de totalizadores parciais.
   Bematech : Em Vista de no delphi 1.o nao se poder usar o tipo 'Long string', optou-se
   por ler o arquivo de retorno caracter a caracter.
   Observar o tipo TRetTotParc para visualizar o formato de saida dos dados.
   BEMATECH-SWEDA-SCHALTER-YANCO
 * ========================================================================== *}
Function TPrgFiscal.ConsTotalParc: TRetTotParc;
var
  AreaArqMP20FI   : TextFile;
  ResultArqMP20FI,
  Recebe,oValor   :  String;
  RetTotParc      :TRetTotParc;
  resultado       : Currency;
  Count           : Byte;
  vPos,vCont      : Integer;
 Buff_ret : Pchar;begin   if (ECFModel=teBematech) or (ECFModel=teBematechII) then     begin       Count := 1;       Buffer := ConCat(Chr(27),'|','27','|',Chr(27));
       if not ImpInError(Buffer) then begin
         AssignFile(AreaArqMP20FI,'MP20FI.RET');
         Reset(AreaArqMP20FI);
         try
           Readln(AreaArqMP20FI,ResultArqMP20FI);
           while(Count<=30) do begin
             resultado := StrToInt(Copy(ResultArqMP20FI,14*Count-13,14));
             With RetTotParc do begin
                 Case Count of
                     1..16 :TotParcTrib[Count] := resultado/100;
                     17    :Isencao := resultado/100;
                     18    :NaoIncid := resultado/100;
                     19    :Substituicao := resultado/100;
                     20..28:TotParcNTrib[Count-19] := resultado/100;
                     29    :Sangria := resultado/100;
                     30    :Suprimento := resultado/100;
                 end; { case }
               end; { with}
             Inc(Count);
             end;
             resultado := StrToFloat(Copy(ResultArqMP20FI,14*Count-13,18));
             RetTotParc.GrandTotal := resultado/100;
           finally
           CloseFile(AreaArqMP20FI);
         end;
       end;
       Result := RetTotParc;
     end;{bematech}   case ECFModel of     teSweda:     begin       Raise EInvalidEntry.Create('Comando N�o dispon�vel na teSweda');       Result := RetTotParc;     end;{sweda}     teSchalterSP:     begin       NroRet := 0;       StrRet := ecfLeituraXSerial;       if SchalterErros(NroRet,StrRet,'S') then       begin          Recebe := StrRet;          RetTotParc.Substituicao   := StrToFloat(Copy(Recebe,119,18));          RetTotParc.Isencao        := StrToFloat(Copy(Recebe,137,18));          RetTotParc.NaoIncid       := StrToFloat(Copy(Recebe,155,18));
          RetTotParc.Sangria        := 0;
          RetTotParc.Suprimento     := 0;
          RetTotParc.TotParcTrib[1] := StrToFloat(Copy(Recebe,178,18));          RetTotParc.TotParcTrib[2] := StrToFloat(Copy(Recebe,219,18));          RetTotParc.TotParcTrib[3] := StrToFloat(Copy(Recebe,260,18));          RetTotParc.TotParcTrib[4] := StrToFloat(Copy(Recebe,301,18));          RetTotParc.TotParcTrib[5] := StrToFloat(Copy(Recebe,342,18));          RetTotParc.TotParcTrib[6] := StrToFloat(Copy(Recebe,383,18));          RetTotParc.TotParcTrib[7] := StrToFloat(Copy(Recebe,424,18));          RetTotParc.TotParcTrib[8] := StrToFloat(Copy(Recebe,465,18));          RetTotParc.TotParcTrib[9] := StrToFloat(Copy(Recebe,506,18));          RetTotParc.TotParcTrib[10]:= StrToFloat(Copy(Recebe,547,18));          RetTotParc.TotParcTrib[11]:= 0;          RetTotParc.TotParcTrib[12]:= 0;          RetTotParc.TotParcTrib[13]:= 0;          RetTotParc.TotParcTrib[14]:= 0;          RetTotParc.TotParcTrib[15]:= 0;          RetTotParc.TotParcTrib[16]:= 0;          for count := 1 to 9 do          begin             RetTotParc.TotParcNTrib[Count] := 0;          end;          // o Grande Total precisa ser pego com a funcao statuscupom          NroRet := 0;          StrRet := ecfStatusCupom(NroRet);          resultado := StrToFloat(Copy(StrRet,47,21));          RetTotParc.GrandTotal := resultado;          Result := RetTotParc;       end;     end;{schalter}     teYanco:     begin        ExecYanco(NumPorta,'2F');        if YancoErros then        begin           vCont := 0;           while StrRet<>'' do           begin              vPos := Pos('\',StrRet);              if vPos = 0 then              begin                 oValor := StrRet;                 StrRet := '';              end              else              begin                 oValor := Copy(StrRet,1,vPos-1);                 StrRet :=Copy(StrRet,vPos+1,Length(StrRet));              end;              Inc(vCont);              {grande total}              if vCont = 1  then RetTotParc.GrandTotal  := StrToFloat(oValor);              {totais das aliquotas cadastradas + subst/isento/NaoIncidente}              if vCont = 44 then RetTotParc.TotParcTrib[1] := StrToFloat(oValor);              if vCont = 45 then RetTotParc.TotParcTrib[2] := StrToFloat(oValor);              if vCont = 46 then RetTotParc.TotParcTrib[3] := StrToFloat(oValor);              if vCont = 47 then RetTotParc.TotParcTrib[4] := StrToFloat(oValor);              if vCont = 48 then RetTotParc.TotParcTrib[5] := StrToFloat(oValor);              if vCont = 49 then RetTotParc.TotParcTrib[6] := StrToFloat(oValor);              if vCont = 50 then RetTotParc.TotParcTrib[7] := StrToFloat(oValor);              if vCont = 51 then RetTotParc.TotParcTrib[8] := StrToFloat(oValor);              if vCont = 52 then RetTotParc.TotParcTrib[9] := StrToFloat(oValor);              if vCont = 53 then RetTotParc.TotParcTrib[10]:= StrToFloat(oValor);              if vCont = 54 then RetTotParc.TotParcTrib[11]:= StrToFloat(oValor);              if vCont = 55 then RetTotParc.TotParcTrib[12]:= StrToFloat(oValor);              if vCont = 56 then RetTotParc.TotParcTrib[13]:= StrToFloat(oValor);              if vCont = 57 then RetTotParc.Substituicao   := StrToFloat(oValor);              if vCont = 58 then RetTotParc.Isencao        := StrToFloat(oValor);              if vCont = 59 then RetTotParc.NaoIncid       := StrToFloat(oValor);
           end;           RetTotParc.TotParcTrib[14]:= 0;           RetTotParc.TotParcTrib[15]:= 0;           RetTotParc.TotParcTrib[16]:= 0;           RetTotParc.Sangria        := 0;           RetTotParc.Suprimento     := 0;
           for count := 1 to 9 do           begin              RetTotParc.TotParcNTrib[Count] := 0;           end;        end;        result := RetTotParc;     end;     teElgin:     begin        OpenCif;        EcfPar('32');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.Isencao        := StrToInt(Copy(Buff_ret,6,18));        EcfPar('33');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.NaoIncid        := StrToInt(Copy(Buff_ret,6,18));        EcfPar('34');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.Substituicao        := StrToInt(Copy(Buff_ret,6,18));        RetTotParc.Sangria        := 0;
        RetTotParc.Suprimento     := 0;
        for count := 1 to 9 do        begin           RetTotParc.TotParcNTrib[Count] := 0;        end;        EcfPar('0');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[1] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('1');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[2] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('2');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[3] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('3');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[4] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('4');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[5] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('5');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[6] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('6');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[7] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('7');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[8] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('8');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[9] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('9');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[10] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('10');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[11] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('11');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[12] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('12');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[13] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('13');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[14] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('14');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[15] := StrToInt(Copy(Buff_ret,6,18));        EcfPar('15');        ElginRetorno:=ObtemRetorno(Buff_ret);
        StrRet := '';
        ElginErros(ElginRetorno,StrRet,'N');        if ElginErros(ElginRetorno,StrRet,'N') then           RetTotParc.TotParcTrib[16] := StrToInt(Copy(Buff_ret,6,18));        result := RetTotParc;        CloseCif;     end;{Elgin}     teNone:     begin       Result := RetTotParc;     end;   end;end;
{* ========================================================================== *   Fun��o para leitura da mem�ria fiscal, por intervalo de reducao ou data,
   dependendo da constante a ser  enviada a fun��o.
   mfData : Memoria fiscal por data
   mfRed : Memoria fiscal por reducao
   BEMATECH-SWEDA-SCHALTER-YANCO
 * ========================================================================== *}
function TPrgFiscal.LeitMemFiscal(ParamIni,ParamFinal:string ;Option:Byte;
                                Saida:Char): Boolean;
var Cont1,Cont2:Byte;
    NomePorta,DataInicial,DataFinal: String;
    tipo,nPIni,nPFin : integer;
    arquivo : LPSTR;
    pcDtIni,pcDtFin : PChar;
    BufIni,BufFin,Res : Pchar;
begin
    result := false;

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
    begin
      if (Option=mfData) then begin  // memoria fiscal por data
        DataInicial := Copy(ParamIni,1,2)+Copy(ParamIni,4,2)+Copy(ParamIni,9,2);
        DataFinal   := Copy(ParamFinal,1,2)+Copy(ParamFinal,4,2)+Copy(ParamFinal,9,2);        Buffer := ConCat(Chr(27),'|','08','|',DataInicial,'|',DataFinal,'|',Saida ,'|',chr(27))
    end
    else
       if (Option =mfRed) then  {memoria por reducao}
       begin
          if (StrToInt(ParamIni)>9999) or (StrToInt(ParamFinal)> 9999) then
             Raise EInvalidEntry.Create('A Reducao maxima deve ser inferior a  9999');
          ParamIni   := Copy(Format('%.4d',[StrToInt(ParamIni)]),1,4);
          ParamFinal := Copy(Format('%.4d',[StrToInt(ParamFinal)]),1,4);
          Buffer := ConCat(Chr(27),'|','08','|','00',ParamIni,'|','00',
                           ParamFinal,'|',Saida,'|',Chr(27));
       end;

{ ====================================================================================== }{ImpInError}
{* Este trecho de codigo resultou de um erro existente na DLL ou no proprio programa
  em firmware da impressora ; para efetuar a leitura de memoria fiscal , sempre que se
  enviava o comando pela primeira vez a variavel TestaTX nao indicava erro, contudo o
  comando nao era executado, ao se enviar QUALQUER outro comando em seguida, a leitiura
  de memoria era realizada e a variavel TestaTx indicava erro de comunicacao.
*}
        NomePorta:='COM'+IntToStr(NumPorta);
        IniPortaStr(NomePorta);
        TestaTX := FormataTX(Buffer);
        Messagedlg('Porta da Bematech: '+StrToPchar(NomePorta),mtInformation,[mbOk],0);
        if TestaTX=0  then begin
          IniPortaStr(NomePorta);
          TestaTX := FormataTX(Buffer);
        end
        else begin
          MsgError :='Erro de comunicacao FISICA com a Serial';
          TestaTX :=1;
          if Assigned(FUserEvent) then OnError(TestaTX,MsgError);
        end;
        Result := (TestaTX=0);
     end;   case ECFModel of      teSweda:      begin      if (Option=mfData) then begin  // memoria fiscal por data        { FormatEntry formata a entrada de acordo com o esperado pela impressora
          DD/MM/AA. Definida apenas para clareza de codigo e simplicidade.          }
        DataInicial := Copy(ParamIni,1,2)+Copy(ParamIni,4,2)+Copy(ParamIni,9,2);
        DataFinal   := Copy(ParamFinal,1,2)+Copy(ParamFinal,4,2)+Copy(ParamFinal,9,2);
        StrPCopy(Comando,#27+'.16'+DataInicial+DataFinal+'}');
        StrRet:=EnviaCOmando(Comando);      end
      else
        if (Option =mfRed) then  {memoria por reducao}
        begin
          if (StrToInt(ParamIni)>9999) or (StrToInt(ParamFinal)> 9999) then
             Raise EInvalidEntry.Create('A Reducao maxima deve ser inferior a  9999');
          ParamIni   := Copy(Format('%.4d',[StrToInt(ParamIni)]),1,4);
          ParamFinal := Copy(Format('%.4d',[StrToInt(ParamFinal)]),1,4);

          StrPCopy(Comando,#27+'.15'+ParamIni+ParamFinal+'}');
          StrRet:=EnviaCOmando(Comando);        end;
        Result := True;     end;     teSchalterSP:     begin        DataInicial := Copy(ParamIni,1,2)+Copy(ParamIni,4,2)+Copy(ParamIni,9,2);        DataFinal   := Copy(ParamFinal,1,2)+Copy(ParamFinal,4,2)+Copy(ParamFinal,9,2);        nPIni  := StrToInt(DataInicial);        nPFin  := StrToInt(DataFinal);
        arquivo     := '';        if (Option=mfData) then // memoria fiscal por data        begin           Tipo := 1;           NroRet := ecfLeitMemFisc(tipo,DataInicial,DataFinal,nPIni,nPFin,arquivo);           Result := SchalterErros(NroRet,StrRet,'N');           if Result then ecfLineFeed(1,6);        end        else        begin           if (Option =mfRed) then  {memoria por reducao}           begin              Tipo := 2;              NroRet := ecfLeitMemFisc(tipo,DataInicial,DataFinal,nPIni,nPFin,arquivo);              Result := SchalterErros(NroRet,StrRet,'N');              if Result then ecfLineFeed(1,6);           end;        end;     end;     teYanco:     begin        DataInicial := Copy(ParamIni,1,2)+Copy(ParamIni,4,2)+Copy(ParamIni,9,2);        DataFinal   := Copy(ParamFinal,1,2)+Copy(ParamFinal,4,2)+Copy(ParamFinal,9,2);        if (Option=mfData) then // memoria fiscal por data        begin           ExecYanco(NumPorta,'28/'+DataInicial+DataFinal+'000000000');           Result := YancoErros;        end        else        begin           if (Option =mfRed) then  {memoria por reducao}           begin              ParamIni   := Copy(Format('%.4d',[StrToInt(ParamIni)]),1,4);              ParamFinal := Copy(Format('%.4d',[StrToInt(ParamFinal)]),1,4);
              ExecYanco(NumPorta,'28/000000000000'+ParamIni+ParamFinal+'1');              Result := YancoErros;           end;        end;     end;     teElgin:     begin       OpenCif;       if (Option=mfData) then begin  // memoria fiscal por data        DataInicial := Copy(ParamIni,1,2)+Copy(ParamIni,4,2)+Copy(ParamIni,7,2);
        DataFinal   := Copy(ParamFinal,1,2)+Copy(ParamFinal,4,2)+Copy(ParamFinal,7,2);        BufIni:= StrToPchar(DataInicial);
        BufFin:= StrToPchar(DataFinal);
        if MessageDlg('Deseja fazer um Leitura Completa.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           ElginRetorno := LeMemFiscalData(BufIni,BufFin,'0');
        end
        else
           ElginRetorno := LeMemFiscalData(BufIni,BufFin,'1');
     end
     else
        if (Option =mfRed) then  {memoria por reducao}
        begin
           if (StrToInt(ParamIni)>9999) or (StrToInt(ParamFinal)> 9999) then
              Raise EInvalidEntry.Create('A Reducao maxima deve ser inferior a  9999');
           ParamIni   := Copy(Format('%.4d',[StrToInt(ParamIni)]),1,4);
           ParamFinal := Copy(Format('%.4d',[StrToInt(ParamFinal)]),1,4);
           BufIni:= StrToPchar(ParamIni);
           BufFin:= StrToPchar(ParamFinal);
        if MessageDlg('Deseja fazer um Leitura Completa.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           ElginRetorno := LeMemFiscalReducao(BufIni,BufFin,'0');
        end
        else
           ElginRetorno := LeMemFiscalReducao(BufIni,BufFin,'1');
        end;
//        ShowMessage('Inicial ='+BufIni+^M+
//                    'Final = '+BufFin);
        StrRet := '';
        Result := ElginErros(ElginRetorno,StrRet,'N');        CloseCif;     end;
     teNone:     begin       Result := True;     end;   end;end;function TPrgFiscal.LeitMemFiscArq(ParamIni,ParamFinal,oArquivo:string ;Option:Byte):boolean;var ResultArqMP20FI,NomePorta,DataInicial,DataFinal: String;    AreaArqMP20FI,ArqUsuario : TextFile;
    arquivo : LPSTR;
begin
   if (ECFModel = teBematechII) or (ECFModel = teBematech) then
   begin
      if (Option=mfData) then
      begin  // memoria fiscal por data
         DataInicial := Copy(ParamIni,1,2)+Copy(ParamIni,4,2)+Copy(ParamIni,9,2);
         DataFinal   := Copy(ParamFinal,1,2)+Copy(ParamFinal,4,2)+Copy(ParamFinal,9,2);         Buffer := ConCat(Chr(27),'|','08','|',DataInicial,'|',DataFinal,'|','R','|',chr(27))
      end;
      if (Option =mfRed) then  {memoria por reducao}
      begin
         if (StrToInt(ParamIni)>9999) or (StrToInt(ParamFinal)> 9999) then
             Raise EInvalidEntry.Create('A Reducao maxima deve ser inferior a  9999');
         ParamIni   := Copy(Format('%.4d',[StrToInt(ParamIni)]),1,4);
         ParamFinal := Copy(Format('%.4d',[StrToInt(ParamFinal)]),1,4);
         Buffer := ConCat(Chr(27),'|','08','|','00',ParamIni,'|','00',
                          ParamFinal,'|','R','|',Chr(27));
      end;

      NomePorta:='COM'+IntToStr(NumPorta);      IniPortaStr(NomePorta);
      TestaTX := FormataTX(Buffer);
      if TestaTX=0  then
      begin
         IniPortaStr(NomePorta);
         TestaTX := FormataTX(Buffer);
      end
      else
      begin
         MsgError :='Erro de comunicacao FISICA com a Serial';
         TestaTX :=1;
         if Assigned(FUserEvent) then OnError(TestaTX,MsgError);
      end;

      // aqui comeca geracao do arquivo da leitura da memoria fiscal
      Assignfile(ArqUsuario,oArquivo);
      Rewrite(ArqUsuario);

      AssignFile(AreaArqMP20FI,'MP20FI.RET');
      Reset(AreaArqMP20FI);
      try
         while not eof(AreaArqMP20FI) do
         begin
            Readln(AreaArqMP20FI,ResultArqMP20FI);
            WriteLn(ArqUsuario,ResultArqMP20FI);
         end;
      finally
         CloseFile(AreaArqMP20FI);
         CloseFile(ArqUsuario);
      end;
      result := true;
   end;
end;
function TPrgFiscal.LeitMemFiscArqElgin:boolean;begin      WinExec('C:\WINDOWS\Commfisc.exe',SW_SHOWDEFAULT);end;{* ========================================================================== *   Procedimento para emiss�o da redu��o Z. - BEMATECH-SWEDA-SCHALTER-YANCO
 * ========================================================================== *}
function TPrgFiscal.EmiteReducaoZ:Boolean;
var Recebe,vData,sDia,sMes,sAno : string;
    vDia,vMes,vAno : word;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
         Buffer := ConCat(Chr(27),'|','05','|',Chr(27));         Result := ImpInError(Buffer);
     end;

   case ECFModel of
     teSweda:
     begin
         StrPCopy(Comando,#27+'.14}');
         StrRet:=EnviaCOmando(Comando);         if Copy(StrRet,2,1)='-' then
         begin
            DecodeDate(Date,vAno,vMes,vDia);
            sDia := IntToStr(vDia); sMes := IntToStr(vMes); sAno := IntToStr(vAno);
            while Length(sDia)<2 do sDia := '0'+sDia;
            while Length(sMes)<2 do sMes := '0'+sMes;
            sAno := Copy(sAno,3,2);
            vData := sDia+sMes+sAno;
            StrPCopy(Comando,#27+'.14'+vData+'}');
            StrRet:=EnviaCOmando(Comando);         end;
         Result := True;
     end;

     teSchalterSP:
     begin
        StrRet := '';
        NroRet := ecfReducaoZ(' ');
        Result := SchalterErros(NroRet,StrRet,'N');
        if Result then ecfLineFeed(1,6);
     end;

     teYanco:
     begin
        ExecYanco(NumPorta,'22/1');
        Result := YancoErros;     end;

     teElgin:
     begin
        RelGer := '0';        OpenCif;
        ElginRetorno := ReducaoZ(Relger);
        StrRet := '';
        Result := ElginErros(ElginRetorno,StrRet,'N');        CloseCif;
     end;

     teNone:
     begin
         Result := True;
     end;
   end;
end;
{* ========================================================================== *   Procedimento para emiss�o da leitura X. - BEMATECH-SWEDA-SCHALTERSP-YANCO
 * ========================================================================== *}
function TPrgFiscal.EmiteLeituraX:Boolean;
var
   retorno : string;
   zret : Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then     begin
       Buffer := ConCat(Chr(27),'|','06','|',Chr(27));
       Result := ImpInError(Buffer);
     end;

   case ECFModel of
   teSweda:
     begin
       StrPCopy(Comando,#27+'.13}');
       StrRet:=EnviaCOmando(Comando);     end;
   teSchalterSP:
     begin
        StrRet := '';
        NroRet := ecfLeituraX(' ');
        Result := SchalterErros(NroRet,StrRet,'N');
        if Result then ecfLineFeed(1,6);
     end;

   teYanco:
     begin
        ExecYanco(NumPorta,'24/1');
        Result := YancoErros;     end;

   teElgin:
     begin
       RelGer := '0';
       OpenCif;
       ElginRetorno := LeituraX(Relger);
       StrRet := '';
       Result := ElginErros(ElginRetorno,StrRet,'N');       CloseCif;
     end;

   teZanthusIZs_e_Qz:
     begin
      argumz:='\0\'; // sem rel gerencial
      zret:= ComandoZanthus(70,argumz,'');
     end;

   teNone:
     begin
         Result := True;
     end;
   end;
end;
{* ========================================================================== *   Procedimento para leitura do estado atual da Impressora. BEMATECH-SWEDA-SCHALTERSP-YANCO
 * ========================================================================== *}
function TPrgFiscal.LeitEstAtual:Boolean;
var ResultArqMP20FI,recebe1,recebe2,vPapel,vStat,vMsg : String;
    AreaArqMP20FI    : TextFile;

begin   Result := false;   if (ECFModel=teBematech) or (ECFModel=teBematechII) then     Begin
       Result :=False;       Buffer := ConCat(Chr(27),'|','19','|',Chr(27));
       if not ImpInError(Buffer) then
         begin
           Result :=False;
           AssignFile(AreaArqMP20FI,'STATUS.RET');
           Reset(AreaArqMP20FI);
           try
             Readln(AreaArqMP20FI,ResultArqMP20FI);
             ReWrite(AreaArqMP20FI);
             Writeln(AreaArqMP20FI,'');
           finally
             CloseFile(AreaArqMP20FI);
           end;
           if ResultArqMP20FI = '' then
             Result :=True;
         end;
       end;   case ECFModel of     teSweda:       begin         // status da impressora         StrPCopy(Comando,#27+'.23}');         StrRet:=EnviaCOmando(Comando);         Result := SwedaErros(StrRet);       end;
     teSchalterSP:       begin          NroRet := 0;          StrRet := ecfStatusImp();          Result := SchalterErros(NroRet,StrRet,'S');          if Result then          begin             if Copy(StrRet,3,3) = '000' then                Result := true             else                Result := false;          end;       end;     teYanco:     begin        ExecYanco(NumPorta,'25');        if YancoErros then        begin           if (Copy(StrRet,3,1)='3') or              (Copy(StrRet,3,1)='2') then              Result := true           else              Result := false;        end;     end;     teNone:       begin         Result := True;       end;   end;end;
function TPrgFiscal.SwedaErros(Recebe1:string):boolean;
var vStat,vMsg,vOK : string;
begin
   // primeiro testa status da impressora
   vStat  := Copy(recebe1,6,1);
   if      vStat='0' then
   begin
      Executed := true;  Result := true; vMsg := '';
   end
   else if vStat='5' then
        begin
           Executed := true; Result := true; vMsg := 'Sem Papel ou Papel Acabando';
        end
   else if vStat='1' then
        begin
           Executed := false; Result := false; vMsg := 'Impressora off-line';
        end
   else if vStat='2' then
        begin
           Executed := false; Result := false; vMsg := 'Time-out de Transmiss�o';
        end
   else if vStat='6' then
        begin
           Executed := false; Result := false; vMsg := 'Time-out de recep��o do impressor do ECF';
        end
   else
   begin
      Executed := false; Result := false; vMsg := 'Problemas com Impressora. Verifique';
   end;

   if vMsg <> '' then
   begin
      if Assigned(FUserEvent) then OnError(1,vMsg);
   end;
end;

{* ========================================================================== *   Procedimento para emiss�o do cupom N�O FISCAL - BEMATECH-SWEDA-SCHALTERSP-YANCO
 * ========================================================================== *}
function TPrgFiscal.EmiteCupNFisc(Texto: String):Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
      if Length(Texto)> 620 then
        Texto :=Copy(Texto,1,620);
      Buffer := ConCat(Chr(27),'|','20','|',Texto,chr(10),'|',Chr(27));
      Result := ImpInError(Buffer);
     end;   case ECFModel of
     teSweda:
      begin       StrPCopy(Comando,#27+'.19}');       StrRet:=EnviaCOmando(Comando);       Result := True;     end;     teSchalterSP:      begin        StrRet := '';        NroRet := ecfInicCupomNFiscal(1);        Result := SchalterErros(NroRet,StrRet,'N');      end;     teYanco:     begin        ExecYanco(NumPorta,'13/3');        result := YancoErros;     end;     teNone:     begin       Result := True;     end;   end;end;

{* ========================================================================== *   Procedimento para fechamento do cupom n�o fiscal. BEMATECH-SWEDA-YANCO
 * ========================================================================== *}
function TPrgFiscal.FechaCupNFisc:Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       Buffer := ConCat(Chr(27),'|','21','|',Chr(27));
       Result := ImpInError(Buffer);
     end;   case ECFModel of     teSweda:
     begin       StrPCopy(Comando,#27+'.12}');       StrRet:=EnviaCOmando(Comando);       Result := True;     end;     teSchalterSP:      begin         Raise EInvalidEntry.Create('Este Comando N�o Pode Ser Executado em Modo Fiscal');         Result := True;      end;     teYanco:      begin         ExecYanco(NumPorta,'16');         result := true;      end;     teNone:     begin         Result := True;     end;   end;
end;
{* ========================================================================== *   Procedimento para abertura de cupom fiscal.
* ========================================================================== *}
function TPrgFiscal.AbreCuponFisc:Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         Buffer := ConCat(Chr(27),'|','00','|',Chr(27));         Result := ImpInError(Buffer);
       end;

   case ECFModel of
     teSweda:
     begin
        StrPCopy(Comando,#27+'.17}');
        StrRet:=EnviaCOmando(Comando);
//        Result := SwedaErros(StrRet);
        if Copy(StrRet,2,1) = '-' then
        begin
           StrRet := Copy(StrRet,7,27);
           if StrRet = 'ERRO-OPERACAO NAO ENCERRADA' then
           begin
              if Assigned(FUserEvent) then OnError(10,'CUPOM FISCAL ABERTO');
           end
           else
           begin
              if Assigned(FUserEvent) then OnError(1,StrRet);
           end;
           Executed := false;
        end;
     end;

     teSchalterSP:
       begin
          StrRet := '';
          NroRet := ecfImpCab(0);
          Result := SchalterErros(NroRet,StrRet,'N');
       end;
     teYanco:
       begin
          ExecYanco(NumPorta,'13/0');
          result := YancoErros;       end;

     teElgin:
       begin
          OpenCif;
          ElginRetorno := AbreCupomFiscal;
          StrRet := '';
          Result := ElginErros(ElginRetorno,StrRet,'N');          CloseCif;       end;       teZanthusIZs_e_Qz:       begin
          argumz := StrToPchar('\\');
          ztret := ComandoZanthus(10,argumz,'');
          Result := ztret;
       end;       teNone:
       begin
         Result := True;
       end;

   end;{case}
end;

{* ========================================================================== *   Procedimento para venda de item + desconto no item se houver
   A forma de desconto default � a percentual
   fdvalor   :Forma de desconto por Valor
   fdPercent :Forma de desconto por percentagem
 * ========================================================================== *}
function TPrgFiscal.VendaItemFisc(Item :TItem; FormaDesconto:Byte; CasasDec:Integer):Boolean;
var
   BufDesc: pchar;
   BufQtd: pchar;
   BufPunit: pchar;
   BufTrib: pchar;
   BufValorV: pchar;
   BufValorP: pchar;
   BufValorT: pchar;
   BufUnid: pchar;
   BufCod: pchar;
   Desc : char;
   zBufDesc: pchar;
   zBufQtd: pchar;
   zBufPunit: pchar;
   zBufTrib: pchar;
   zBufValorV: pchar;
   zBufValorP: pchar;
   zBufValorT: pchar;
   zBufValorD: pchar;
   zBufUnid: pchar;
   zBufCod: pchar;
   zBufValorDesc : Pchar;
   ValPago, ValorPago1 : String;
   fmt : Byte;
   recebe, Quant, Quant1, Valor, ValorDesc1, sPrTot, sDesc,descont,descontV,descontP,sTrib,Temp: String;
   valordesc, PrTot : Currency;   nTributo,i : integer;   pcDesc,pcValor,pcDescont : PChar;   TmD : char;   Executar,TamanhoElgin,QuantidadeElgin,ValorUElgin,TributoElgin,TipoDElgin,ValorDElgin,UnidadeElgin,CodigoElgin,DescricaoElgin : string;   Tamanhoz,Quantidadez,ValorUz,Tributoz,TipoDz,ValorDz,Unidadez,Codigoz,Descricaoz : string;   codigoC: String[13];   DescriVerificaAnt,DescriVerificaOK : String[190];   TamanhoDescri : Integer;
   TamanhoQuant : Integer;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then     begin
        with Item do        begin
           Codigo := Trim(Codigo);
           While Length(Codigo)<13 do Codigo := '0'+Codigo;
           if Length(Descricao)>29 then Descricao := Copy(Descricao,1,29);
           if Length(Tributo)=1 then insert('0',Tributo,1);
           if Frac(Quantidade)=0 then
              Quant := FormatFloat('0000',Quantidade)
           else
              Quant := FormatFloat('0000000',1000*Quantidade);
           if FormaDesconto=fdValor then { Desconto  por valor}
              Descont := FormatFloat('00000000',100*Desconto)
           else
              if FormaDesconto=fdPercent then  { Desconto Percentual}
                 Descont := FormatFloat('0000',100*Desconto)
              else
                 Raise EInvalidEntry.Create(IntToStr(FormaDesconto)+' Nao e um valor valido '+
                   'para FormaDesconto. Escolha entre fdvalor e fdPercent.');
           if CasasDec = 2 then           begin              Valor:= FormatFloat('00000000',100*ValorUnit);              if Frac(Quantidade)=0 then                 Quant := FormatFloat('0000',Quantidade)
              else
                 Quant := FormatFloat('0000000',1000*Quantidade);
              Buffer := ConCat(Chr(27),'|','09','|',Codigo,'|',Descricao,'|',Tributo,'|',                             Quant,'|',Valor,'|',Descont,'|',Chr(27));
           end
           else
           begin
              Valor:= FormatFloat('00000000',1000*ValorUnit);
              Quant := FormatFloat('0000000',1000*Quantidade);
              Buffer := ConCat(Chr(27),'|','56','|',Codigo,'|',Descricao,'|',Tributo,'|',
                             Quant,'|',Valor,'|',Descont,'|',Chr(27));
           end;
           Result := ImpInError(Buffer);
        end;{bematech}    end;

   case ECFModel of
     teSweda:
     begin
       with Item do
       begin
         Codigo := Trim(Codigo);
         While Length(Codigo)<13 do Codigo := '0'+Codigo;

         // codigo da tributacao
         if      (Tributo = 'II') then
            sTrib := 'I  '
         else if (Tributo = 'FF') then
            sTrib := 'F  '
         else if (Tributo = 'NN') then
            sTrib := 'N  '
         else if (Tributo = 'T0') then
            sTrib := 'T0 '
         else
            sTrib := 'T'+Tributo;
         Quant  := FormatFloat('0000000',   Item.Quantidade*1000);
         Valor  := FormatFloat('000000000', Item.ValorUnit * 100);
         PrTot  := (Item.Quantidade * Item.ValorUnit);         sPrTot := FormatFloat('000000000000',PrTot * 100);
         sDesc  := Copy(Item.Descricao,1,24);         StrPCopy(Comando,#27+'.01'+Codigo+Quant+Valor+sPrTot+sDesc+sTrib+'}');         StrRet := EnviaComando(Comando);         if FormaDesconto=fdValor then { Desconto  por valor}
           Descont := FormatFloat('000000000000',100*Desconto)         else if FormaDesconto=fdPercent then  { Desconto Percentual}           Descont := FormatFloat('000000000000',Desconto*PrTot/100);          if Descont <> '000000000000' then
         begin            StrPCopy(Comando,#27+'.02          '+Descont+'}');            StrRet := EnviaComando(Comando);         end;         Result := True;
       end;     end;{sweda}

     teSchalterSP:
     begin
        with ITem do
        begin
           {primeiramente encontra tipo de tributa�ao}
           nTributo := 0;
           if Tributo = 'II' then nTributo := 13; // isento
           if Tributo = 'FF' then nTributo := 12; // Subst. Tribut�ria
           if Tributo = 'NN' then nTributo := 14; // N�o Incidente
           if (Tributo = '#1') or
              (Tributo = '#2') or
              (Tributo = '#3') or
              (Tributo = '#4') or
              (Tributo = '#5') or
              (Tributo = '#6') or
              (Tributo = '#7') or
              (Tributo = '#8') or
              (Tributo = '#9') then nTributo := 14; // nao incidente
           if nTributo = 0 then // nao se encaixou em nenhuma acima entao � a propria aliquota
              nTributo := StrToInt(Tributo);
           {Schalter S Print s� aceita um item por lan�amento, por isso a descricao conter�
            C�digo,nome produto,quantidade do item}
           Codigo := Trim(Codigo);
           While Length(Codigo)<13 do Codigo := '0'+Codigo;
           PrTot  := Item.Quantidade * Item.ValorUnit;
           if Frac(Quantidade)=0 then
           begin
              Quant := FormatFloat('###0',Quantidade);
//              Quant := FormatFloat('0000',Quantidade);
              Descricao := ' '+Copy(Descricao,1,30) //pus o 30 no lugar do 42
           end
           else
           begin
              Quant := FormatFloat('#,##0.000',Quantidade);
              Descricao := ' '+Copy(Descricao,1,23)  // pus o 25 no lugar do 37
//              Quant := FormatFloat('0000000',1000*Quantidade);
//              Descricao := ' '+Copy(Descricao,1,25)  // pus o 25 no lugar do 37
           end;
           Valor := FormatFloat('##,##0.00',Item.ValorUnit);
           while Length(valor)<9 do Valor := ' '+Valor;
           StrRet := '';
           NroRet := ecfVendaItem(Codigo+Descricao+Quant+' x '+Valor,FormatFloat('000000000',100*PrTot),nTributo);
           Result := SchalterErros(NroRet,StrRet,'N');

           if result then
           begin
              if FormaDesconto=fdValor then { Desconto  por valor}
                 Descont := FormatFloat('000000000',100*Desconto)              else if FormaDesconto=fdPercent then  { Desconto Percentual}                 Descont := FormatFloat('0000',Desconto*PrTot/100)              else
                 Raise EInvalidEntry.Create(IntToStr(FormaDesconto)+' Nao e um valor valido '+
                'para FormaDesconto. Escolha entre fdvalor e fdPercent.');

              if Desconto > 0 then
              begin
                 StrRet := '';
                 NroRet := ecfDescItem (0,'Desconto:',Descont);
                 Result := SchalterErros(NroRet,StrRet,'N');
              end;
           end;
        end;
     end;{schalter}

     teYanco:
     begin
        with Item do
        begin
           Codigo := Trim(Codigo);
           While Length(Codigo)<13 do Codigo := '0'+Codigo;
           Descricao := Trim(Descricao);
           While Length(Descricao)<30 do Descricao := Descricao+' ';
           Valor:= FormatFloat('000000000',1000*ValorUnit);
           Quant := FormatFloat('0000000',1000*Quantidade);
           PrTot  := Item.Quantidade * Item.ValorUnit;
           sPrTot := FormatFloat('000000000000',1000*PrTot);           {primeiramente encontra tipo de tributa�ao}           sTrib := '';           if Tributo = 'II' then sTrib := '15'; // isento
           if Tributo = 'FF' then sTrib := '14'; // Subst. Tribut�ria
           if Tributo = 'NN' then sTrib := '16'; // N�o Incidente
           if (Tributo = '#1') or
              (Tributo = '#2') or
              (Tributo = '#3') or
              (Tributo = '#4') or
              (Tributo = '#5') or
              (Tributo = '#6') or
              (Tributo = '#7') or
              (Tributo = '#8') or
              (Tributo = '#9') then sTrib := '16'; // nao incidente
           if sTrib = '' then // nao se encaixou em nenhuma acima entao � a propria aliquota
           begin
              if Length(Tributo)=1 then insert('0',Tributo,1);
              sTrib := Tributo;
           end;
           if CasasDec = 2 then
              ExecYanco(NumPorta,'14/'+codigo+descricao+valor+quant+sPrTot+sTrib+'0')
           else
              ExecYanco(NumPorta,'14/'+codigo+descricao+valor+quant+sPrTot+sTrib+'1');
           Result := YancoErros;
           if Result then
           begin
              {se tem desconto}
              if Desconto > 0 then
              begin
                 if FormaDesconto=fdValor then { Desconto  por valor}
                 begin
                    Descont := FormatFloat('000000000000',100*Desconto);                    ExecYanco(NumPorta,'18/'+Descont+'/0000/0')                 end                 else                 begin                    if FormaDesconto=fdPercent then  { Desconto Percentual}                    begin                       Descont := FormatFloat('0000',Desconto*PrTot/100);                       ExecYanco(NumPorta,'18/000000000000'+Descont+'/1')                    end                    else
                       Raise EInvalidEntry.Create(IntToStr(FormaDesconto)+' Nao e um valor valido '+
                       'para FormaDesconto. Escolha entre fdvalor e fdPercent.');
                 end;
                 Result := YancoErros;
              end;
           end;
        end;
     end;

     teElgin:
     begin
       with Item do       begin
          desc := 'n';
          Codigo := Trim(Codigo);
          for i:=0 to Length(Codigo) do
             if (Codigo[i] <> '.')or (Codigo[i] <> ',')or(Codigo[i] <> '-')or(Codigo[i] <> '/')or(Codigo[i] <> '*') then
                codigoC[i]:=Codigo[i];
          Codigo := CodigoC;
          While Length(Codigo)<13 do Codigo := '0'+Codigo;
          if Frac(Quantidade)=0 then
            Quant := FormatFloat('000000',Quantidade)
          else
            Quant := FormatFloat('000000',1000*Quantidade);
          if FormaDesconto=fdValor then { Desconto  por valor}
          begin
            descontV := FormatFloat('000000000000000',100*Desconto);
          end
          else
          if FormaDesconto=fdPercent then  { Desconto Percentual}
          begin
             descontP := FormatFloat('0000',100*Desconto);
          end
          else
             Raise EInvalidEntry.Create(IntToStr(FormaDesconto)+' Nao e um valor valido '+
                   'para FormaDesconto. Escolha entre fdvalor e fdPercent.');

          Valor:= FormatFloat('00000000000',100*ValorUnit);          Quant := FormatFloat('000000',1000*Quantidade);          QuantidadeElgin := '';
          QuantidadeElgin := Quant;
          ValorUElgin := '';          ValorUElgin := Valor;          UnidadeElgin := '';          UnidadeElgin := Unidade;
          CodigoElgin := '';          CodigoElgin := Codigo;
          {Verifica o tamanho da descri��o da mercadoria}          DescriVerificaAnt := '';
          DescriVerificaAnt :=Descricao;
          TamanhoDescri := Length(Descricao);
          for i := 1 to TamanhoDescri do
          begin
             if DescriVerificaAnt[i] = '�' then
             DescriVerificaOK[i]:= 'c'
             else
          if DescriVerificaAnt[i] = '�' then
             DescriVerificaOK[i]:= 'C'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'a'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'A'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'e'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'E'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'i'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'I'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'o'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'O'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'u'
          else
          if (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') or (DescriVerificaAnt[i] = '�') then
             DescriVerificaOK[i]:= 'U'
          else
             DescriVerificaOK[i]:= DescriVerificaAnt[i];
          end;
          Descricao :='';
          for i := 1 to TamanhoDescri do
             Descricao :=Descricao+DescriVerificaOK[i];

          DescricaoElgin := '';
          if Length(Descricao)<=20 then
          begin
             While Length(Descricao)<20 do Descricao := Descricao+' ';
             DescricaoElgin := Descricao;
             TmD:='0';             TamanhoElgin :='0';          end
          else
          if (Length(Descricao)>20) and (Length(Descricao)<=38) then
          begin
             While Length(Descricao)<38 do Descricao := Descricao+' ';
             DescricaoElgin := Descricao;
             TmD:='1';             TamanhoElgin :='1';          end
          else
          if (Length(Descricao)>38) and (Length(Descricao)<=76) then
          begin
             While Length(Descricao)<(38*2) do Descricao := Descricao+' ';
             DescricaoElgin := Descricao;
             TmD:='2';             TamanhoElgin:='2';          end
          else
          if (Length(Descricao)>76) and (Length(Descricao)<=114) then
          begin
             While Length(Descricao)<(38*3) do Descricao := Descricao+' ';
             DescricaoElgin := Descricao;
             TmD:='3';             TamanhoElgin:='3';          end
          else
          if (Length(Descricao)>114) and (Length(Descricao)<=152) then
          begin
             While Length(Descricao)<(38*4) do Descricao := Descricao+' ';
             DescricaoElgin := Descricao;
             TmD:='4';             TamanhoElgin:='4';          end
          else
          if (Length(Descricao)>152) and (Length(Descricao)<=190) then
          begin
             While Length(Descricao)<(38*5) do Descricao := Descricao+' ';
             DescricaoElgin := Descricao;
             TmD:='5';             TamanhoElgin:='5';          end;
           {primeiramente encontra tipo de tributa�ao}
           sTrib := '';           if Tributo = 'II' then sTrib := 'I00'; // isento
           if Tributo = 'FF' then sTrib := 'F00'; // Subst. Tribut�ria
           if Tributo = 'NN' then sTrib := 'N00'; // N�o Incidente
           if (Tributo = '#1') or
              (Tributo = '#2') or
              (Tributo = '#3') or
              (Tributo = '#4') or
              (Tributo = '#5') or
              (Tributo = '#6') or
              (Tributo = '#7') or
              (Tributo = '#8') or
              (Tributo = '#9') then sTrib := 'N00'; // nao incidente
           if sTrib = '' then // nao se encaixou em nenhuma acima entao � a propria aliquota
           begin
              if Length(Tributo)=1 then insert('0',Tributo,1);
              sTrib := 'T'+Tributo;
           end;
          TributoElgin := '';          TributoElgin := sTrib;          {Inica a troca de valores}          BufQtd:= StrToPchar(QuantidadeElgin);          BufPunit:= StrToPchar(ValorUElgin);          BufUnid:= StrToPchar(UnidadeElgin);          BufCod:= StrToPchar(CodigoElgin);          BufDesc:= StrToPchar(DescricaoElgin);          BufTrib:= StrToPchar(TributoElgin);          fmt := 0;          {Faz a impress�o dependendo do tipo de parametro}          if desc = '&' then          begin             desc := '&';             ValorDElgin := DescontV;             BufValorP:= StrToPchar(ValorDElgin);             OpenCif;             ElginRetorno := VendaItem(fmt,BufQtd,BufPunit,BufTrib,desc,BufValorV,BufUnid,BufCod,'0',BufDesc,'');             StrRet := '';             Result := ElginErros(ElginRetorno,StrRet,'N');             CloseCif;{             ShowMessage('Venda de Item com desconto por Valor.'+^M+                         'Quantidade = '+Quant+^M+                         'Valor = '+Valor+^M+                         'Tributa��o = '+sTrib+^M+                         'Codigo = '+Codigo+^M+                         'Tamanho da Descri��o = '+TmD+^M+                         'Descri��o = '+Descricao+^M+                         'Valor Desconto '+DescontV);}          end          else          if desc = '%' then          begin             desc := '%';             ValorDElgin := DescontP;             BufValorP:= StrToPchar(ValorDElgin);             OpenCif;             ElginRetorno := VendaItem(fmt,BufQtd,BufPunit,BufTrib,desc,BufValorP,BufUnid,BufCod,'0',BufDesc,'');             StrRet := '';             Result := ElginErros(ElginRetorno,StrRet,'N');             CloseCif;//             ShowMessage('Venda de Item com desconto por Porcentagem.'+^M+//                         'Quantidade = '+Quant+^M+//                         'Valor = '+Valor+^M+//                         'Tributa��o = '+sTrib+^M+//                         'Codigo = '+Codigo+^M+//                         'Tamanho da Descri��o = '+TmD+^M+//                         'Descri��o = '+Descricao+^M+//                         'Valor Desconto '+DescontP);          end          else          if desc = 'n' then          begin             desc := '%';             TipoDElgin := '%';             ValorDElgin := '0000';             BufValorT :=StrToPchar(ValorDElgin);             OpenCif;             ElginRetorno :=VendaItem(fmt,BufQtd,BufPunit,BufTrib,desc,BufValorT,BufUnid,BufCod,TmD,BufDesc,'');             StrRet := '';             Result := ElginErros(ElginRetorno,StrRet,'N');{             ShowMessage('Venda de Item sem desconto depois da Venda.'+^M+                         'Quantidade = '+BufQtd+^M+                         'Valor = '+BufPunit+^M+                         'Tributa��o = '+BufTrib+^M+                         'Codigo = '+BufCod+^M+                         'Tamanho da Descri��o = '+TmD+^M+                         'Descri��o = '+BufDesc+^M+                         'Tipo de Desconto = '+desc+^M+                         'Unidade = '+BufUnid+^M+                         'Valor Desconto = '+BufValorT);}             CloseCif;          end;       end;     end;

     teZanthusIZs_e_Qz:
     begin        with Item do        begin
           Codigo := Trim(Codigo);
           Descricao := Trim(Descricao);
           Quant := Trim(CurrToStr(Quantidade));
           Quant1 := Trim(CurrToStr(Quantidade));
           ValorPago1 := Trim(CurrToStr(Item.ValorPago));
           TamanhoQuant := Length(Quant);
           While Length(Codigo) < 10 do Codigo := '0'+Codigo;
           While Length(Quant) < 4 do Quant := Quant+'0';
           Valor := FormatFloat('##,##0.00',Item.ValorUnit);
           PrTot  := StrToCurr(Quant1) * Item.ValorUnit;
           sPrTot := FormatFloat('0',100*PrTot);           ValPago := FormatFloat( '0',100*Item.ValorPago );           sTrib := 'T1800';           {Inicia a troca de valores}
             zBufQtd := StrToPchar(Quant);             zBufPunit := StrToPchar(Valor);             zBufUnid := StrToPchar(Unidade);             zBufCod := StrToPchar(Codigo);             zBufDesc := StrToPchar(Descricao);             zBufTrib := StrToPchar(sTrib);             zBufValorT := StrToPchar(sPrTot);             zBufValorP := StrToPchar(ValPago);             argumz := '';             argumz := StrToPchar('\'+zBufCod+'\');             ztret := ComandoZanthus(12,argumz,'');
             argumz := '';
             argumz := StrToPchar('\'+zBufDesc+'\');
             ztret := ComandoZanthus(13,argumz,'');
             argumz := '';
             argumz := StrToPchar('\'+zBufPunit+'\'+zBufQtd+'\'+zBufUnid+'\'+zBufValorT+'\'+ zBufTrib+'\\');
             ztret := ComandoZanthus(11,argumz,'');
//              argumz := '';
//              argumz := StrToPchar('\\'+zBufValorT+'\');
//              ztret := ComandoZanthus(17,argumz,'');
//             argumz := '';
//             argumz:= StrToPchar('\1\\'+zBufValorP+'\');
//             ztret := ComandoZanthus(24,argumz,'');
//             argumz := '';
//             argumz :=StrToPchar('\0\----------------------------------------\              VOLTE SEMPRE              \           LOJAS SUPER BARATO           \----------------------------------------\\\\\');
//             ztret := ComandoZanthus(21,argumz,'');
{              ShowMessage('Venda de Item com desconto por Porcentagem.'+^M+
                        'Quantidade = '+Quant+^M+                        'Valor = '+Valor+^M+                        'Tributa��o = '+sTrib+^M+                        'Codigo = '+Codigo+^M+                        'Descri��o = '+Descricao+^M+                        'Valor Total = '+sPrTot+^M+                        'Unidade = '+zBufUnid+^M+                        'Valor Desconto = '+DescontP);}                 Result := True;          end;
                 Result := True;
     end;

     teNone:     begin         Result := True;     end;   end;end;

{* ========================================================================== *   Procedimento para cancelamento de item anterior. - BEMATECH-SWEDA-SCHALTERSP-YANCO
 * ========================================================================== *}
function TPrgFiscal.CancItemAnter(NumItem: Word):Boolean;
var recebe : string;
    Items, NumItemAsStr: String;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       Buffer := ConCat(Chr(27),'|','13','|',Chr(27));
       Result := ImpInError(Buffer);
     end;   case ECFModel of     teSweda:     begin       StrPCopy(Comando,#27+'.04}');       StrRet := EnviaComando(Comando);       if Copy(StrRet,2,1) = '-' then          Result := false
       else
          Result := True;
     end;
     teSchalterSP:     begin         StrRet := '';         NroRet := ecfCancItem ('ITEM CANCELADO');         Result := SchalterErros(NroRet,StrRet,'N');     end;     teYanco:     begin        ExecYanco(NumPorta,'1A');        Result := YancoErros;     end;     teElgin:     begin         Items := IntToStr(NumItem);         while Length(Items) < 3 do Items := '0'+ Items; //acrescenta zero ao numero de itens.

         NumItemAsStr := Items; //Copy(Format('%.3d',[NumItem]),1,3);
         OpenCif;         ElginRetorno := CancelamentoItem(NumItemAsStr);         StrRet := '';         Result := ElginErros(ElginRetorno,StrRet,'N');         CloseCif;     end;     teNone:     begin         Result := True;     end;   end;end;
{* ========================================================================== *   Procedimento para cancelamento de item aleat�rio. BEMATECH-SCHALTERSP
 * ========================================================================== *}
function TPrgFiscal.CancItemAleat(NumItem:Word):Boolean;
var
   NumItemAsStr: String;
   pcNumItem,pcDescCanc : PChar;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       if NumItem >9999 then
         Raise EInvalidEntry.Create('Parametro invalido : '+ IntToStr(NumItem)+
         ' Numero do Item deve ser inferior a 9999');
       NumItemAsStr := Copy(Format('%.4d',[NumItem]),1,4);
       Buffer := ConCat(Chr(27),'|','31','|',NumItemAsStr,'|',Chr(27));
       Result := ImpInError(Buffer);
     end;

   case ECFModel of
     teSweda:
     begin         Raise EInvalidEntry.Create('Este ECF N�o Permite Cancelamento Aleat�rio de Itens');         Result := True;     end;     teSchalterSP:     begin         if NumItem >9999 then            Raise EInvalidEntry.Create('Parametro invalido : '+ IntToStr(NumItem)+
            ' Numero do Item deve ser inferior a 9999');
        NumItemAsStr := Copy(Format('%.4d',[NumItem]),1,4);
        StrPCopy(pcNumItem,Copy(Format('%.4d',[NumItem]),1,4));
        StrPCopy(pcDescCanc,'CANCELADO ITEM '+NumItemAsStr);
        StrRet := '';        NroRet := ecfCancItemDef(pcNumItem,pcDescCanc);        Result := SchalterErros(NroRet,StrRet,'N');     end;     teYanco:     begin         Raise EInvalidEntry.Create('Este ECF N�o Permite Cancelamento Aleat�rio de Itens');         Result := True;     end;     teElgin:     begin         if NumItem >9999 then           Raise EInvalidEntry.Create('Parametro invalido : '+ IntToStr(NumItem)+
           ' Numero do Item deve ser inferior a 9999');
         NumItemAsStr := Copy(Format('%.3d',[NumItem]),1,3);
         OpenCif;         ElginRetorno := CancelamentoItem(NumItemAsStr);         StrRet := '';         Result := ElginErros(ElginRetorno,StrRet,'N');         CloseCif;     end;     teNone:     begin         Result := True;     end;  end;end;
{* ========================================================================== *   Procedimento para fechamento do cupom fiscal sem forma de pagamento.
   Possibilita lancamento de Acrescimo ou Desconto no total da venda
   BEMATECH-SWEDA-SCHALTERSP-YANCO
 * ========================================================================== *}
function TPrgFiscal.FechCupomFisc(ValorPago,ValorAcrDes: Currency ; TipoAcrDes:Char;
                                 MensPromoc: String):Boolean;
var
  retorno, ValorPago1,ValorAcrDes1,MsgSchalter,ValrAcrDesc,PercAcrDesc,Tipo:String;
  i : Integer;
  aMens: array[0..7] of string;
  amensT,menssagem : string;
  Messagem_tam: array [0..3] of char;
  Messagem : array [0..400] of char;
begin
   ValorPago1 := Copy(FormatFloat('00000000000000',ValorPago*100),1,14);
   if Length(MensPromoc)> 496 then
      MensPromoc := Copy(MensPromoc,1,496);

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       if (TipoAcrDes = 'A') or (TipoAcrDes = 'D') then       begin
         ValorAcrDes1 :=Copy(FormatFloat('0000',100*ValorAcrDes),1,4);
         Buffer := ConCat(Chr(27),'|','10','|',ValorAcrDes1,'|',ValorPago1,'|',
                       TipoAcrDes,'|',MensPromoc,'|','\xff','|',Chr(27));       end;
       if (TipoAcrDes = 'a') or (TipoAcrDes = 'd') then
       begin
         ValorAcrDes1 :=Copy(FormatFloat('00000000000000',100*ValorAcrDes),1,14);
         Buffer := ConCat(Chr(27),'|','10','|','xxxx','|',ValorPago1,'|',
                       TipoAcrDes,'|',ValorAcrDes1,'|',Menspromoc,'|','\xff','|',Chr(27));
       end;
       Result := ImpInError(Buffer);
     end;   // teBematech

   case ECFModel of
     teSweda:
     begin
        result := true;
     end; // teSweda

     teSchalterSP:
     begin
        ValorPago1 := Copy(FormatFloat('0000000000',ValorPago*100),1,10);
        StrRet := '';
        {lancamento do desconto se tiver}
        if ValorAcrDes > 0 then
        begin
            ValorAcrDes1 :=Copy(FormatFloat('0000000000',100*ValorAcrDes),1,10);
            StrRet := '';
            NroRet := ecfCancAcresDescSubTotal (0,0,'DESCONTO',ValorAcrDes1);
        end;
        NroRet := ecfPagCancPag (0,'VALOR PAGO',ValorPago1,0,0);
        Result := SchalterErros(NroRet,StrRet,'N');
        if Result then
        begin
           ecfLineFeed(1,1);
           {a Schalter permite menos mensagens que as outras impressoras
            somente oito linhas com 48 caracteres cada }
           for i := 1 to 8 do
           begin
              if MensPromoc <> '' then
              begin
                 if Length(MensPromoc)>48 then
                 begin
                    MsgSchalter := Copy(MensPromoc,1,48);
                    MensPromoc := Copy(MensPromoc,49,Length(MensPromoc));
                 end
                 else
                 begin
                    MsgSchalter := MensPromoc;
                    MensPromoc := '';
                 end;
                 StrRet := '';
                 NroRet := ecfImpLinha(MsgSchalter);
                 Result := SchalterErros(NroRet,StrRet,'N');
              end
              else
                 break;
           end;
           StrRet := '';
           NroRet := ecfFimTrans(' ');           Result := SchalterErros(NroRet,StrRet,'N');
           if Result then ecfLineFeed(1,8);
        end;
     end; // teSchalterSP

     teYanco:
     begin
        while Length(MensPromoc)<168 do MensPromoc := MensPromoc+' ';
        ExecYanco(NumPorta,'16/00'+MensPromoc);
        Result := YancoErros;
     end;// teYanco

     teElgin:
     begin         OpenCif;         ElginRetorno := CloseCif;         StrRet := '';         Result :=ElginErros(ElginRetorno,StrRet,'N');     end;
     teNone:     begin         Result := True;     end;   end;end;

function TPrgFiscal.FechCupomSweda(ValorPago,ValorAcrDes:Currency; aMens:array of String):Boolean;
var
  ValorPago1, ValorAcrDes1:String;
  i : Integer;
  aMensT : string;
begin
   if ValorAcrDes <> 0 then // se h� desconto no cupom
   begin
      ValorAcrDes1 :=Copy(FormatFloat('000000000000',100*ValorAcrDes),1,12);
      StrPCopy(Comando,#27+'.03          ' + ValorAcrDes1 + '}');
      StrRet:=EnviaCOmando(Comando);
   end;
   // totaliza o cupom
   ValorPago1 := Copy(FormatFloat('000000000000',ValorPago*100),1,12);
   if Copy(aMens[0],1,5) = 'Forma' then
   begin
      StrPCopy(Comando,#27+'.1002' + ValorPago1 + '}');           // a prazo
      StrRet:=EnviaCOmando(Comando);
   end
   else
   begin
      StrPCopy(Comando,#27+'.1001' + ValorPago1 + '}');           // a vista
      StrRet:=EnviaCOmando(Comando);
   end;
   // fecha cupom
   for i := 0 to 8 do
   begin
      if Amens[i] = '' then break;
      aMensT := aMensT+'0'+aMens[i];
   end;
   StrPCopy(Comando,#27+'.12'+aMensT+'}');
   StrRet:=EnviaCOmando(Comando);
   Result := True;
end;

{* ========================================================================== *
   Lan�a Acrescimo ou Desconto no Subtotal do Cupom - YANCO
 * ========================================================================== *}
function TPrgFiscal.DescAcrescSubTotal(ValorAcrDes:Currency;TipoAcrDes:string):boolean;
var tipo,ValrAcrDesc,PercAcrDesc : string;
begin
   if ECFModel = teYanco then
   begin
      if ValorAcrDes > 0 then
      begin
         {desconto/acrescimo por percentual}
         if (TipoAcrDes = 'A') or (TipoAcrDes = 'D') then
         begin
            ValrAcrDesc := '0000000000000';
            PercAcrDesc := Copy(FormatFloat('0000',100*ValorAcrDes),1,4);
            if TipoAcrDes = 'A' then Tipo := '03'; // acrescimo
            if TipoAcrDes = 'D' then Tipo := '01'; // desconto
         end;
         {desconto/acrescimo por Valor}
         if (TipoAcrDes = 'a') or (TipoAcrDes = 'd') then
         begin
            ValrAcrDesc := Copy(FormatFloat('000000000000',100*ValorAcrDes),1,12);
            PercAcrDesc := '0000';
            if TipoAcrDes = 'a' then Tipo := '02'; // acrescimo
            if TipoAcrDes = 'd' then Tipo := '00'; // desconto
         end;
         ExecYanco(NumPorta,'1B/'+ValrAcrDesc+PercAcrDesc+Tipo);
         Result := YancoErros;
      end;
   end
   else
   begin
      Raise EInvalidEntry.Create('Comando Dispon�vel somente para Yanco 8000');
         Result := True;   end;
end;

{* ========================================================================== *
   Lan�a nas Finalizadoras - YANCO
 * ========================================================================== *}
function TPrgFiscal.LancaFinalizadora(ValorPago:Currency;Finalizadora:Integer):boolean;
var ValorPago1,vFinalizadora : string;
begin
   vFinalizadora := IntToStr(Finalizadora);
   if ECFModel = teYanco then
   begin
      if (Finalizadora=0) or (Finalizadora>30) then
      begin
         Raise EInvalidEntry.Create('Finalizadora deve ser de 1 a 30');
         Result := false;
      end
      else
      begin
         ValorPago1 := Copy(FormatFloat('000000000000',ValorPago*100),1,12);
         if Length(vFinalizadora)<2 then insert('0',vFinalizadora,1);
         ExecYanco(NumPorta,'15/'+vFinalizadora+ValorPago1);
         result := YancoErros;
      end;
   end
   else
   begin
      Raise EInvalidEntry.Create('Comando Dispon�vel somente para Yanco 8000');
         Result := True;   end;
end;

{* ========================================================================== *
   Lan�a nas Finalizadoras - YANCO
 * ========================================================================== *}
function TPrgFiscal.InicioDeDia(Operador:string):boolean;
begin
   if Length(Operador)>13 then Operador := Copy(Operador,1,13);
   if ECFModel = teYanco then
   begin
      ExecYanco(NumPorta,'12/1'+Operador);
      result := YancoErros;
   end
   else
   begin
      Raise EInvalidEntry.Create('Comando Dispon�vel somente para Yanco 8000');
         Result := True;   end;
end;

{* ========================================================================== *
   Procedimento para Troca de Operador do Caixa - YANCO
 * ========================================================================== *}
function TPrgFiscal.TrocaOperador(NomeOperador:string):Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
      begin
         result := true;
      end;
      //

   case ECFModel of
      teSweda:
      begin
         result := true;
      end;
      //
      teSchalterSP:
      begin
         result := true;
      end;
      //
      teYanco:
      begin
         if Length(NomeOperador)>13 then NomeOperador := Copy(NomeOperador,1,13);
         ExecYanco(NumPorta,'11/'+NomeOperador);
         Result := YancoErros;
      end;
      //
      teNone:
      begin
         result := true;
      end;
   end;
end;


{* ========================================================================== *
   SCHALTER - Procedimento para fechamento do cupom fiscal sem forma de pagamento.
 * ========================================================================== *}
function TPrgFiscal.FechCupFiscPrzo(ValorPago,ValorAcrDes: Currency ; TipoAcrDes:Char;
                                 MensPromoc: String):Boolean;
var
  ValorPago1,ValorAcrDes1,MsgSchalter:String;
  i : Integer;
begin
   if Length(MensPromoc)> 496 then
      MensPromoc := Copy(MensPromoc,1,496);

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       Result := true;
     end;   // teBematech
   case ECFModel of
     teSweda:
     begin
       Result := true;
     end; // teSweda

     teSchalterSP:
     begin
        ValorPago1 := Copy(FormatFloat('0000000000',ValorPago*100),1,10);
        StrRet := '';
        {lancamento do desconto se tiver}
        if ValorAcrDes > 0 then
        begin
            ValorAcrDes1 :=Copy(FormatFloat('0000000000',100*ValorAcrDes),1,10);
            StrRet := '';
            NroRet := ecfCancAcresDescSubTotal (0,0,'DESCONTO',ValorAcrDes1);
        end;
        NroRet := ecfPrazoCancPrazo(0,' ',ValorPago1,0,0);
        Result := SchalterErros(NroRet,StrRet,'N');
        if Result then
        begin
           ecfLineFeed(1,1);
           {a Schalter permite menos mensagens que as outras impressoras
            somente oito linhas com 48 caracteres cada }
           for i := 1 to 8 do
           begin
              if MensPromoc <> '' then
              begin
                 if Length(MensPromoc)>48 then
                 begin
                    MsgSchalter := Copy(MensPromoc,1,48);
                    MensPromoc := Copy(MensPromoc,49,Length(MensPromoc));
                 end
                 else
                 begin
                    MsgSchalter := MensPromoc;
                    MensPromoc := '';
                 end;
                 StrRet := '';
                 NroRet := ecfImpLinha(MsgSchalter);
                 Result := SchalterErros(NroRet,StrRet,'N');
              end
              else
                 break;
           end;
           StrRet := '';
           NroRet := ecfImpLinha('***************FORMAS DE PAGAMENTO**************');
           Result := SchalterErros(NroRet,StrRet,'N');
        end;
     end; // teSchalterSP

     teYanco:
     begin
        Result := true;
     end;

     teNone:     begin         Result := True;     end;   end;end;

{* ========================================================================== *   Procedimento para cancelamento do �ltimo cupom fiscal.
 * ========================================================================== *}
function TPrgFiscal.CanUltCupFisc:Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       Buffer := ConCat(Chr(27),'|','14','|',Chr(27));
       Result := ImpInError(Buffer);
     end;

   case ECFModel of
     teSweda:
     begin
       StrPCopy(Comando,#27+'.05}');
       StrRet := EnviaComando(Comando);     end;

     teSchalterSP:
     begin
        StrRet := '' ;
        NroRet := ecfCancDoc(' ');
        Result := SchalterErros(NroRet,StrRet,'N');
        if Result then ecfLineFeed(1,7);
     end;

     teYanco:
     begin
        ExecYanco(NumPorta,'1E');
        Result := YancoErros;
     end;

     teElgin:
     begin         OpenCif;         ElginRetorno := CancelaCupomFiscal;         StrRet := '';
         Result := ElginErros(ElginRetorno,StrRet,'N');         CloseCif;     end;
     teNone:     begin         Result := True;     end;   end;end;

{* ========================================================================== *
   Fun��o que cancela o cupom atualmente aberto
 * ========================================================================== *}
function TPrgFiscal.CanCupFiscAberto:Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       Result := true;
     end;

   case ECFModel of
     teSweda:
     begin
        StrPCopy(Comando,#27+'.05}');
        StrRet := EnviaComando(Comando);        Result := true;
     end;

     teSchalterSP:
     begin
        StrRet := '' ;
        NroRet := ecfCancVenda(' ');
        Result := SchalterErros(NroRet,StrRet,'N');
     end;

     teYanco:
     begin
        ExecYanco(NumPorta,'1D');
        Result := YancoErros;
     end;

     teNone:     begin         Result := True;     end;   end;end;

{* ========================================================================== *   Fun��o de leitura do valor do sub-total dos itens.
 * ========================================================================== *}
Function TPrgFiscal.LeitVlrSTotIt: Currency;
var ResultArqMP20FI: String;
    AreaArqMP20FI  : TextFile;
begin

   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         Result :=-1;         Buffer := ConCat(Chr(27),'|','29','|',Chr(27));
         if not ImpInError(Buffer) then
         begin
           AssignFile(AreaArqMP20FI,'MP20FI.RET');
           Reset(AreaArqMP20FI);
           try
             Readln(AreaArqMP20FI,ResultArqMP20FI);
             Result := StrToFloat(ResultArqMP20FI)/100.00;
           finally
             CloseFile(AreaArqMP20FI);
           end;
         end;
       end;   case ECFModel of     teSweda:     begin         Result := 0.0;     end;     teSchalterSP:     begin        Result := 0.0;     end;     teYanco:     begin        Result := 0.0;     end;     teNone:     begin         Result := 0.0;     end;   end;end;
{* ========================================================================== *   Procedimento para autentica��o de documentos no modo 1. (Autom�tica)
 * ========================================================================== *}
function TPrgFiscal.AutentDocMod1:Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         Buffer := ConCat(Chr(27),'|','16','|',Chr(27));         Result := ImpInError(Buffer);
       end;   case ECFModel of     teSweda:
       begin          StrPCopy(Comando,#27+'.260Provider}');          StrRet := EnviaComando(Comando);          Result := True;       end;     teSchalterSP:       begin          Raise EInvalidEntry.Create('Este Comando N�o Pode Ser Executado em Modo Fiscal');          Result := True;       end;     teYanco:     begin        ExecYanco(NumPorta,'30');        Result := YancoErros;     end;     teNone:     begin         Result := True;     end;   end;end;

{* ========================================================================== *   Procedimento para autentica��o de documentos no modo 2. (Manual)BEMATECH-SWEDA-SCHALTERSP
 * ========================================================================== *}
function TPrgFiscal.AutentDocMod2(MensAutent: String; TipImpCNE:Char):Boolean;
Var
   MaxTam: Byte;
   Tipo: String;
   pcMensA : PChar;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         MaxTam:=48;
         TipImpCNE:=UpperCase(TipImpCNE)[1];
         Case TipImpCNE of
           'C' : MaxTam:=54;
           'N' : MaxTam:=48;
           'E' : MaxTam:=36;
         end;
         if Length(MensAutent)>MaxTam then
            MensAutent:=Copy(MensAutent,1,Maxtam);

         Buffer := ConCat(Chr(27),'|','24','|',TipImpCNE,'|',MensAutent,'|',Chr(27));
         Result := ImpInError(Buffer);
       end;

   case ECFModel of
     teSweda:
       begin
         MaxTam:=44;
         TipImpCNE:=UpperCase(TipImpCNE)[1];
         Case TipImpCNE of
           'C' : begin
                   MaxTam:=88;
                   Tipo:='0';
                 end;
           'N' : begin
                   MaxTam:=66;
                   Tipo:='1';
                 end;
           'E' : begin
                   MaxTam:=44;
                   Tipo:='2';
                 end;
         end;
         if Length(MensAutent)>MaxTam then
            MensAutent:=Copy(MensAutent,1,Maxtam);

         StrPCopy(Comando,#27+'.26'+Tipo+MensAutent+'}');
         StrRet := EnviaComando(Comando);         Result := True;
       end;

     teSchalterSP:
       begin
          MaxTam := 48;
          if Length(MensAutent)>MaxTam then
             MensAutent:=Copy(MensAutent,1,Maxtam);
          StrPCopy(pcMensA,MensAutent);
          StrRet := '';
          NroRet := ecfAutentica(pcMensA);
          Result := SchalterErros(NroRet,StrRet,'N');
       end;

     teYanco:
       begin
          Result := true;
       end;

     teNone:
       begin
         Result := True;
       end;
   end;
end;

{* ========================================================================== *
   Procedimento para acionamento da gaveta de dinheiro.
 * ========================================================================== *}
function TPrgFiscal.AcionGavetDin(TempAcion: Byte):Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         Buffer := ConCat(Chr(27),'|','22','|',IntToStr(TempAcion),'|',Chr(27));
         if TempAcion > 255  then  begin
           Raise EInvalidEntry.Create('Tempo de Acionamento Inv�lido ') ;
           Result := False;
         end else
           Result := ImpInError(Buffer);
       end;

   case ECFModel of
     teSweda:
       begin
          StrPCopy(Comando,#27+'.21}');
          StrRet := EnviaComando(Comando);          Result := True;
       end;

     teSchalterSP:
     begin
       StrRet := '';
       NroRet := ecfAbreGaveta;
       Schaltererros(NroRet,StrRet,'N');
     end;

     teYanco:
     begin
        ExecYanco(NumPorta,'26');
        Result := YancoErros;
     end;

     teNone:
     begin
        Result := true;
     end;
   end;
end;

{* ========================================================================== *   Procedimento para checagem do estado da gaveta de dinheiro.
 * ========================================================================== *}
function TPrgFiscal.EstGavetaDinh:Boolean;
var   Retorno: String;begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         Buffer := ConCat(Chr(27),'|','23','|',Chr(27));
         Result := ImpInError(Buffer);
       end;

   case ECFModel of
     teSweda:
       begin
          StrPCopy(Comando,#27+'.22}');
          StrRet := EnviaComando(Comando);          Retorno := Copy(StrRet,6,1);
          if Retorno = '1' then
             Result  := False
          else if Retorno = '0' then
             Result  := True;
       end;

     teSchalterSP:
       begin          Raise EInvalidEntry.Create('Comando N�o Dispon�vel para teSchalterSP');          Result := True;       end;
     teYanco:
     begin
        Raise EInvalidEntry.Create('Comando N�o Dispon�vel para teSchalterSP');
        Result := True;     end;

     teNone:
       begin
         Result  := True;
       end;
    end;
end;

{* ========================================================================== *   Procedimento para sangria ou suprimento de dinheiro da gaveta.
 * ========================================================================== *}
function TPrgFiscal.SanSupDinhGav( Valor: Currency; TipoAcaoG: String):Boolean;
Var
   Valor1:String;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         valor1:=Copy(FormatFloat('00000000000000',100*Valor),1,14);
         Buffer := ConCat(Chr(27),'|','25','|',TipoAcaoG,'|',Valor1,'|',Chr(27));
         Result := ImpInError(Buffer);
       end;

   case ECFModel of
     teSweda:
       begin
         Result:=True;
       end;

     teSchalterSP:
       begin          Raise EInvalidEntry.Create('Comando N�o Dispon�vel para teSchalterSP');          Result := True;       end;
     teYanco:
       begin          Raise EInvalidEntry.Create('Comando N�o Dispon�vel para teSchalterSP');          Result := True;       end;
     teNone:
       begin
         Result:=True;
       end;
    end;
end;

{* ========================================================================== *    Fun��o para obter o n�mero sequencial do cupom fiscal.
 * ========================================================================== *}
Function TPrgFiscal.NumSeqCupFisc: Word;
var ResultArqMP20FI, Retorno: String;
    AreaArqMP20FI  : TextFile;
    Buff_ret : Pchar;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then       begin         Buffer := ConCat(Chr(27),'|','30','|',Chr(27));         if not ImpInError(Buffer)then
         begin
           AssignFile(AreaArqMP20FI,'MP20FI.RET');
           Reset(AreaArqMP20FI);
           try
             Readln(AreaArqMP20FI,ResultArqMP20FI);
           finally
             CloseFile(AreaArqMP20FI);
           end;
         end;
         Result:= StrToInt(ResultArqMP20FI);
       end;

   case ECFModel of
     teSweda:
       begin
          StrPCopy(Comando,#27+'.271}');
          StrRet := EnviaComando(Comando);          Retorno := Copy(StrRet,14,4);
          Result  := StrToInt(Retorno);
       end;

     teSchalterSP:
     begin       NroRet := 0;       StrRet := ecfLeituraXSerial;       if SchalterErros(NroRet,StrRet,'S') then       begin          Result := StrToInt(Copy(StrRet,23,6))+1;       end;     end;{schalter}
     teYanco:
     begin
        ExecYanco(NumPorta,'2E');
        if YancoErros then
        begin
           Result := StrToInt(Copy(StrRet,760,4));
        end;
     end;

     teElgin:
     begin
         OpenCif;
         EcfPar('41');         ElginRetorno:=ObtemRetorno(Buff_ret);
         ShowMessage('At� aqui Ok '+Copy(Buff_ret,6,6));
         StrRet := '';
         ElginErros(ElginRetorno,StrRet,'N');         Result := StrToInt(Copy(Buff_ret,6,6));         CloseCif;     end;
     teNone:
       begin
         Result:=0;
       end;
    end;
end;

{* ========================================================================== *   Fun��o para In�cio de Fechamento do Cupom Fiscal. COM FORMA DE PAGAMENTO
 * ========================================================================== *}
function TPrgFiscal.IniFechCupfisc(Percentagem: Single; TipoAcao,Toper:char; ValTot: String ):Boolean;
var percentual:string;
    Acao : Byte;
    Valor, ValorTot0, SubTotal : Pchar;
    zValor, zValorTot, zSubTotal : String;
    Legop : PChar;
    i : Integer;
    Percentagem1: Single;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
   begin
      if (TipoAcao = 'A') or (TipoAcao = 'D') then
      begin
         if percentagem >=100.00 then            Raise EInvalidEntry.Create('A Percentagem deve ser inferior a 100%');
         percentual := Copy(FormatFloat('0000',100*percentagem),1,4);
      end
      else
         percentual := Copy(FormatFloat('00000000000000',100*percentagem),1,14);

      Buffer := ConCat(Chr(27),'|','32','|',TipoAcao,'|',Percentual,'|','\xff',Chr(27));
      Result := ImpInError(Buffer);
   end;   case ECFModel of {Inicio do Case}     teSweda:     begin         Result := True;     end;     teSchalterSP:     begin         Result := True;     end;     teYanco:     begin        Result := true;     end;     teElgin:      begin         if (TipoAcao = 'A') or (TipoAcao = 'D') and (Toper <> 'N') then
         begin
            if Toper ='%' then
            begin
               if percentagem >=100.00 then               begin                  Raise EInvalidEntry.Create('A Percentagem deve ser inferior a 100%');
               end
               else
               begin
                  Percentual := Copy(FormatFloat('0000',100*percentagem),1,4);
               end;
            end
            else
            if Toper ='v' then
            begin
               Percentual := Copy(FormatFloat('000000000000000',100*percentagem),1,15);               Toper := '&';            end;            if TipoAcao = 'A' then
            begin
               Legop := StrToPchar('Acrescimo      ');
               Acao := 64;
               Valor:=StrToPchar(Percentual);
            end
            else
            if TipoAcao = 'D' then
            begin
               Legop := StrToPchar('Desconto      ');
               Acao := 0;
               Valor:=StrToPchar(Percentual);
            end;
            OpenCif;
            ElginRetorno := TotalizarCupom(Acao,toper,Valor,Legop);
            StrRet := '';
            Result := ElginErros(ElginRetorno,StrRet,'N');            CloseCif;
         end
         else
         begin
            OpenCif;            ElginRetorno := TotalizarCupomParcial;            StrRet := '';
            Result := ElginErros(ElginRetorno,StrRet,'N');            CloseCif;         end;      end;      teZanthusIZs_e_Qz:      begin      zValorTot := FormatFloat('0', 100 * StrToCurr(ValTot));         if (TipoAcao = 'A') or (TipoAcao = 'D') and (Toper <> 'N') then         begin
            if Toper ='%' then
            begin
               if percentagem >=100.00 then               begin                  Raise EInvalidEntry.Create('A Percentagem deve ser inferior a 100%');
               end
               else
               begin
                  Percentual := Copy(FormatFloat('0000',100*percentagem),1,4);
               end;
            end
            else
            if Toper ='v' then
            begin
               Percentual := Copy(FormatFloat('000000000000000',100*percentagem),1,15);               Toper := '&';            end;            if TipoAcao = 'A' then
            begin
               Valor:=StrToPchar(Percentual);
//               argumz := '';
//               argumz := StrToPchar('\Acrescimo item ant.\'+Percentual+'\');
//               ztret := ComandoZanthus(23,argumz,'');
            end
            else
            if TipoAcao = 'D' then
            begin
               Valor:=StrToPchar(Percentual);
//               argumz := '';
//               argumz := StrToPchar('\Desconto item ant.\'+Percentual+'\');
//               ztret := ComandoZanthus(16,argumz,'');
            end;
//            argumz := '';
//            argumz := StrToPchar('\Desconto item ant.\'+Percentual+'\');
//            ztret := ComandoZanthus(16,argumz,'');
         end
         else
         begin
            argumz := '';
            argumz := StrToPchar('\\'+zValorTot+'\');
            ztret := ComandoZanthus(17,argumz,'');
         end;
      end;     teNone:     begin         Result := True;     end;   end;end;
{* ========================================================================== *   Fun��o para Efetuar Forma de Pagamento.
* ========================================================================== *}
function TPrgFiscal.EfetFormPag(Valor:Currency; DescFormPgto:String;PagtoEm,Troco:String):Boolean;
var
  Valor1,registrador : String;
  Valor2 : pchar;
  BufReg : Pchar;
  BufTroc :Char;
  zBufVal, zBufDescF, zBufPgtEm, zBufTroco : Pchar;
Begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
     begin
       Valor1:=Copy(FormatFloat('00000000000000',100*Valor),1,14);       Buffer := ConCat(Chr(27),'|','33','|',DescFormPgto,'|',Valor1,'|',Chr(27));
       Result := ImpInError(Buffer);
     end;   case ECFModel of     teSweda:     begin       Valor1:=Copy(FormatFloat('000000000000',100*Valor),1,14);       StrPCopy(Comando,#27+'.1001'+Valor1+'}');       StrRet := EnviaComando(Comando);       Result := True;     end;     teSchalterSP:     begin        StrRet := '';        NroRet := ecfImpLinha(DescFormPgto);        SchalterErros(NroRet,StrRet,'N');     end;     teYanco:     begin        Result := true;     end;     teElgin:     begin        registrador := Copy(PagtoEm,5,2);        BufReg:=StrToPchar(registrador);
        If Troco = 'S' then           BufTroc := '1'        else        If Troco = 'N' then           BufTroc := '0';        Valor1:=Copy(FormatFloat('000000000000000',100*Valor),1,15);        Valor2:=StrToPchar(Valor1);        OpenCif;        ElginRetorno := Pagamento(BufReg,valor2,BufTroc);        StrRet := '';        Result := ElginErros(ElginRetorno,StrRet,'N');        CloseCif;     end;     teZanthusIZs_e_Qz:     begin
       argumz := '';
       argumz := StrToPchar('\1\'+DescFormPgto+'\');
       ztret := ComandoZanthus(92,argumz,'');
       argumz := '';
       zBufVal  :=StrToPchar(FormatFloat('0',100*Valor));
       zBufDescF:=StrToPchar(DescFormPgto);
       zBufPgtEm:=StrToPchar(PagtoEm);
       zBufTroco:=StrToPchar(Troco);
       argumz := StrToPchar('\1\\'+zBufVal+'\');
       ztret := ComandoZanthus(24,argumz,'');
       Result := ztret;
     end;     teNone:     begin        Result := True;     end;   end;end;function TPrgFiscal.EfetFormPagII(IndexFP:string; Valor:Currency; DescFormPgto:String):Boolean;var  Valor1:String;
begin
   if (ECFModel=teBematechII) then
   begin
      if (StrToInt(IndexFP)<=0) or (StrToInt(IndexFP)>50) then
         Raise EInvalidEntry.Create('Indice da Forma de Pagamento Fora de Faixa (01 a 50)');

      if Length(DescFormPgto)>80 then DescFormPgto := Copy(DescFormPgto,1,80);
      Valor1:=Copy(FormatFloat('00000000000000',100*Valor),1,14);

      Buffer := ConCat(Chr(27),'|','72','|',IndexFP,'|',Valor1,'|',DescFormPgto,'|',Chr(27));
      Result := ImpInError(Buffer);
   end;
end;

function TPrgFiscal.ProgVerFormPagII(DescFormPgto:String):string;var ResultArqMP20FI: String;    AreaArqMP20FI  : TextFile;
begin   if ECFModel = teBematechII then
   begin
      if Length(DescFormPgto)>16 then DescFormPgto := Copy(DescFormPgto,1,16);
      Buffer := ConCat(Chr(27),'|','71','|',DescFormPgto,'|',Chr(27));

      Result := '0';
      if not ImpInError(Buffer) then
      begin
         AssignFile(AreaArqMP20FI,'MP20FI.RET');
         Reset(AreaArqMP20FI);
         try
           Readln(AreaArqMP20FI,ResultArqMP20FI);
           Result := ResultArqMP20FI;
         finally
           CloseFile(AreaArqMP20FI);
         end;
      end;
   end;
end;
{* ========================================================================== *   Fun��o para Terminar o Fechamento do cupom fiscal COM FORMA DE PAGAMENTO
 * ========================================================================== *}
function TPrgFiscal.TermFechCupFisc(Msg: String):Boolean;
var
   Mensagem, TMensagem1 :String;
   TMensagem : Integer;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         Buffer := ConCat(Chr(27),'|','34','|',Msg,'|',Chr(27));         Result := ImpInError(Buffer);
       end;   case ECFModel of     teSweda:       begin          StrPCopy(Comando,#27+'.120'+Msg+'}');          StrRet := EnviaComando(Comando);          Result := True;       end;     teSchalterSP:     begin        ecfLineFeed(1,1);        StrRet := '';        NroRet := ecfFimTrans(' ');        Result := SchalterErros(NroRet,StrRet,'N');        if Result then ecfLineFeed(1,8);     end;     teElgin:       begin          Mensagem := msg;          TMensagem:=Length(Mensagem)-1;          TMensagem1 := IntToStr(TMensagem);          While Length(TMensagem1)<3 do TMensagem1 := '0'+TMensagem1;          TMensagem1 := 'S'+TMensagem1;//          Messagem_tam:=StrToPchar(TMensagem1);//          Messagem:=StrToPchar(Mensagem);
//          ShowMessage('Ok 3');
          Messagem_tam:=StrToPchar('S001');
          Messagem:=StrToPchar(' ');
          OpenCif;
          ElginRetorno := FechaCupomFiscal(Messagem_tam,Messagem);          StrRet := '';          Result := ElginErros(ElginRetorno,StrRet,'N');          CloseCif;       end;     teZanthusIZs_e_Qz:     begin      argumz := '';      argumz :=StrToPchar('\0\----------------------------------------\'+msg+'\\----------------------------------------\\\\\');      ztret := ComandoZanthus(21,argumz,'');     end;     teNone:     begin         Result := True;     end;   end;end;
{*============================================================================*
 Leitura do Status Da Impressora*=============================================================================*}function TPrgFiscal.LeitStatus:Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
      begin
         Buffer := ConCat(Chr(27),'|','19','|',Chr(27));         Result := ImpInError(Buffer);
      end;   case ECFModel of
      teSweda:
      begin         Result := True;      end;      teSchalterSP:      begin         Result := true;      end;      teYanco:      begin         ExecYanco(NumPorta,'25');         if YancoErros then         begin            if Copy(StrRet,5,1)='0' then               result := true            else               result := false;         end;      end;      teZanthusIZs_e_Qz:      begin      Ztret := ComandoZanthus(41,'\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\','50');      if ( Ztret = True ) then begin        Result := True;      end
      else if ( Ztret = False ) then begin
        Result := False;
      end;
      end;

      teCorisco:
      begin       ComandoCorisco(1,0,0,0);       if ( cRet = True ) then begin         Result := True;       end       else if ( cRet = False ) then begin
         Result := False;
       end;
      end;

      teNone:      begin         Result := True;      end;   end;end;

function TPrgFiscal.LeitStatusSchalter:string;
begin
   if ECFModel = teSchalterSP then
   begin      NroRet := 0;      StrRet := ecfStatusImp;      Result := StrRet;   end   else      Result := '';end;
{*============================================================================ * * ========================================================================= *
   Fun��o para verifica��o da ocorr�nca de erro durante a execucao do comando.
   como esse trecho de codigo e repetido em todas as demais preocedures/funcoes
   optou-se por torna-lo uma procedure de forma a diminuir o numero de linhas
   de codigo do componente bem como facilitar o entendimento do mesmo.
 * ========================================================================= *
 *===========================================================================* }
function TPrgFiscal.ImpInError(Buffer: string ):Boolean;
var RespArqStatus: String;
    NomePorta    : String;
    AreaArqStatus: TextFile;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
      begin
        Result   := TRUE;
        Executed :=False;
        NomePorta:='COM'+IntToStr(NumPorta);
        if ( IniPortaStr(NomePorta) <> 1 ) then begin
          TestaTx := 3;
          if Assigned(FUserEvent) then OnError(TestaTX,Mensagens[TestaTX]);
            Exit;
        end ;
        TestaTX := FormataTX(StrToPchar(Buffer));
        if((TestaTX=65534 {-2} ) or (TestaTX=1) ) then  begin
          { se houve erro de comunicacao ou no envio dos parametros}
          if Assigned(FUserEvent) then OnError(Abs(TestaTX),Mensagens[TestaTX]);
        end
        else if (TestaTX=0) then  begin  { nao houve erro }
          Result := FALSE;
          Executed:=True;
          AssignFile(AreaArqStatus,'STATUS.RET');
          Reset(AreaArqStatus);
          try
             Readln(AreaArqStatus,RespArqStatus);
             Rewrite(AreaArqStatus);
             Writeln(AreaArqStatus,'');
          finally
             CloseFile(AreaArqStatus);
          end;
          if (RespArqStatus <> '') then begin
              MsgError := RespArqStatus;
              TestaTX :=4;
              while( (CompareText( Mensagens[TestaTX],Copy(RespArqStatus,12,Length(Mensagens[TestaTX]))) <>0) and (TestaTX<21)) do
                   inc(TestaTX);
              if Assigned(FUserEvent) then OnError(TestaTX,MsgError);

{ ========================================================================================== }              {* a pedido da Office, mesmo estando a impressora com pouco papel nao sera acusado erro pelo componente*}
              {* no que tange a propriedade EXECUTED*}
              if (TestaTx=5) then
              begin                 Executed:=True;
                 Result := false;
              end
              else              begin
              {* caso default *}                  Executed := False;
{ ========================================================================================== }
              Result := TRUE;
              end;
            end{ if };          end{ else };
       end;

   case ECFModel of
     teSweda:
     begin         Executed:=True;         Result := True;     end;     teSchalterSP:     begin         Executed:=True;         Result := True;     end;     teNone:     begin         Executed:=True;         Result := True;     end;   end;
end;
{*====================================================================================  De uso interno ao componente, obtem os valores que serao atribuidos as propriedades
  do componente.
 =================================================================================== *}
function TPrgFiscal.ReturnVar(Param :Integer):String;
var  ResultArqMP20FI,Parametro,recebe: String;
     AreaArqMP20FI  : TextFile;
begin
  Result := '';
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
      begin
        Parametro := Copy(Format('%.2d',[Param]),1,2);
        Buffer := ConCat(Chr(27),'|','35','|',Parametro,'|',Chr(27));
        if not ImpInError(Buffer)then
        begin
           AssignFile(AreaArqMP20FI,'MP20FI.RET');
           Reset(AreaArqMP20FI);
           try
             Readln(AreaArqMP20FI,ResultArqMP20FI);
           finally
             CloseFile(AreaArqMP20FI);
           end;
           Result :=ResultArqMP20FI;
         end
        else
         begin
           Result :='-1';
         end;
       end;   case ECFModel of     teSweda:
     begin        Parametro := Copy(Format('%.2d',[Param]),1,2);        if Parametro = '14' then // nro equipamento        begin           StrPCopy(Comando,#27+'.28}');           StrRet := EnviaComando(Comando);           Result := Copy(StrRet,95,3);        end        else           Result := '0';     end;     teSchalterSP:     begin        Parametro := Copy(Format('%.2d',[Param]),1,2);        if Parametro = '14' then // nro equipamento        begin           NroRet := 0;           StrRet := ecfStatusCupom(NroRet);           Result := Copy(StrRet,1,4);        end        else           Result := '0';     end;     teYanco:     begin        Parametro := Copy(Format('%.2d',[Param]),1,2);        if Parametro = '14' then // nro equipamento        begin           ExecYanco(NumPorta,'2E');           if YancoErros then              Result := Copy(StrRet,94,3)           else              Result := '0';        end        else           result := '0';     end;     teNone:     begin        Result := '0';     end;  end;end;

{ =======================================================================================  Formata a data fornecida pelo usuario de forma a sastifazer o formato esperado pela
  impressora.Esta procedure devera nao estar presente nas versoes futuras deste componente
  assim que o Delphi propiciar DE FATO , meios de formatar o modo de apresentacao das
  datas e horas.
  Em sintese, retira-se o caracter separador entre dia mes e ano (no caso a barra) e
  preenche-se com zeros a esquerda para formar uma string de seis caracteres.
  ====================================================================================== *}

procedure TPrgFiscal.FormatEntry(var ParamIni:String);var
  Cont1,Cont2:Byte;
begin
   Cont1:=Pos('/',ParamIni);
   Delete(ParamIni,Cont1,1);
   Cont2:=Pos('/',ParamIni);
   Delete(ParamIni,Cont2,1);
   if Cont1=2 then
   begin
     Insert('0',ParamIni,1);
     Inc(Cont2);
   end;
   if Cont2 =4 then
   begin
      Insert('0',ParamIni,3);
      Inc(Cont2);
   end;
end;

{DAQUI PARA BAIXO FOI ACRESCIDO APOS INSERIR IMPRESSORA SCHALTER}

function TPrgFiscal.SchalterErros(NroRet:Integer;StrRet,TipoRet:string):boolean;
var i,vPos : integer;
begin
   result   := false;
   Executed := false;
   if TipoRet = 'N' then
   begin
      if NroRet = 0 then
      begin
         result := true;
         Executed := true;
      end
      else
      begin
         for i := 1 to 73 do
         begin
            vPos := Pos(':',MsgSchalter[i]);
            if StrToInt(Copy(MsgSchalter[i],1,vPos-1))=NroRet then
            begin
               if Assigned(FUserEvent) then OnError(Abs(i),MsgSchalter[i]);
               break;
            end;
         end;
         result := false;
      end;
   end
   else
   begin
      if Copy(StrRet,1,5)='Erro:' then
      begin
         for i := 1 to 73 do
         begin
            vPos := Pos(':',MsgSchalter[i]);
            if Copy(MsgSchalter[i],1,vPos-1)=Copy(StrRet,6,2) then
            begin
               if Assigned(FUserEvent) then OnError(Abs(i),MsgSchalter[i]);
               break;
            end;
         end;
       Result := false;
      end
      else
      begin
         Executed := true;
         Result := true;
      end;
   end;
end;

{DAQUI PARA BAIXO FOI ACRESCIDO APOS INSERIR IMPRESSORA YANCO}

procedure TPrgFiscal.ExecYanco(aPorta:Integer;vLin1:string);
var F : TextFile;
    oDir,FileTemp,aLinha,vSeqn,CmdLine,vLinCmd : string;
    RetCode,vPos : Integer;
    PI : TProcessInformation;
begin
    GetDir(0,oDir);
    FileTemp := oDir+'\Y8000.CMD';
    vSeqn := '0001';
    if FileExists(FileTemp) then
    begin
       AssignFile(F,FileTemp);
       Reset(F);
       try
          Readln(F,aLinha);
       finally
          CloseFile(F);
       end;
    end;
    if aLinha = '0002' then
       vSeqn := '0001'
    else
       vSeqn := '0002';
    AssignFile(F,FileTemp);
    Reset(F);
    try
       Rewrite(F);
       WriteLn(F,vSeqn);
       while vLin1 <> '' do
       begin
          vPos := Pos('/',vLin1);
          if vPos = 0 then
          begin
             vLinCmd := vLin1; vLin1 := '';
          end
          else
          begin
             vLinCmd := Copy(vLin1,1,vPos-1);
             vLin1 := Copy(vLin1,vPos+1,Length(vLin1));
          end;
          WriteLn(F,vLinCmd);
       end;
    finally
       CloseFile(F);
    end;

    if aPorta = 0 then CmdLine := 'Y8000WIN.EXE 1';
    if aPorta = 1 then CmdLine := 'Y8000WIN.EXE 2';
    if aPorta = 2 then CmdLine := 'Y8000WIN.EXE 3';
    if aPorta = 3 then CmdLine := 'Y8000WIN.EXE 4';

    if Executa(PChar(CmdLine),SW_HIDE,PI) then
       WaitForSingleObject(PI.hProcess,INFINITE)
    else
       Raise EInvalidEntry.Create('Erro ao Executar Comandos');
end;

function TPrgFiscal.YancoErros:boolean;
var FileRet : TextFile;
    aLinha,FileStatus,oDir : string;
    i,vPos,nLin : integer;
begin
   StrRet := '';
   GetDir(0,oDir);
   FileStatus := oDir+'\Y8000.STS';
   Result := true;
   Executed := true;

   AssignFile(FileRet,FileStatus);
   Reset(FileRet);
   nLin := 1;
   while not eoln(FileRet) do
   begin
      Readln(FileRet,aLinha);
      if nLin = 1 then // na primeira linha testa se retornou OK
      begin
         if aLinha <> '00' then
         begin
            result := false;
            break;
         end;
         Inc(nLin);
      end
      else
         StrRet := StrRet+aLinha;
   end;
   CloseFile(FileRet);

   if not result then
      Raise EInvalidEntry.Create('Erro ao Comunicar com a Impressora')
   else
   begin
      if (Length(StrRet)=2) and
         (StrRet <> '00')   then
      begin
         Executed := false;
         for i := 1 to 42 do
         begin
            vPos := Pos(':',MsgYanco[i]);
            if Copy(MsgYanco[i],1,vPos-1) = StrRet then
            begin
               if StrRet = '41' then // cupom fiscal aberto
               begin
                  if Assigned(FUserEvent) then OnError(10,MsgYanco[i]);
               end
               else
               begin
                  if StrRet = '10' then
                  begin
                      if Assigned(FUserEvent) then OnError(11,MsgYanco[i]+'*ALT');
                  end
                  else
                  begin
                      if Assigned(FUserEvent) then OnError(Abs(i),MsgYanco[i]);
                  end;
               end;
               Inc(nLin);
               break;
            end;
         end;
         if nLin = 1 then if Assigned(FUserEvent) then OnError(Abs(i),'Problemas de Comunica��o');
      end;
   end;
end;

function TPrgFiscal.Executa(Comando:PChar;Modo:integer;var PI:TProcessInformation):boolean;
var
   SI:TStartupInfo;
begin
   Fillchar(SI,sizeof(SI),0);
   with SI do
   begin
      cb:=sizeof(SI);
      dwFlags:=STARTF_USESHOWWINDOW;
      wShowWindow:=Modo;
   end;
   Executa:=CreateProcess(nil,comando,nil,nil,false,0,nil,nil,SI,PI);
end;

function TPrgFiscal.ElginErros(NroRet:Integer;StrRet,TipoRet:string):boolean;
var i,vPos : integer;
begin
   result   := false;
   Executed := false;
   if TipoRet = 'N' then
   begin
      if NroRet = 0 then
      begin
         result := true;
         Executed := true;
      end
      else
      begin
         for i := 1 to 102 do
         begin
            vPos := Pos(':',MsgElgin[i]);
            if StrToInt(Copy(MsgElgin[i],1,vPos-1))=NroRet then
            begin
               if Assigned(FUserEvent) then OnError(Abs(i),MsgElgin[i]);
               break;
            end;
         end;
         result := false;
      end;
   end
   else
   begin
      if Copy(StrRet,1,4)='Erro:' then
      begin
         for i := 1 to 102 do
         begin
            vPos := Pos(':',MsgElgin[i]);
            if Copy(MsgElgin[i],1,vPos-1)=Copy(StrRet,6,2) then
            begin
               if Assigned(FUserEvent) then OnError(Abs(i),MsgElgin[i]);
               break;
            end;
         end;
       Result := false;
      end
      else
      begin
         Executed := true;
         Result := true;
      end;
   end;
end;

Function TPrgFiscal.LeIni(Inifile:String;Secao:String;Chave:String):String;
var
Ini: TIniFile;
Begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
    Result := Ini.ReadString(Secao,chave,'');
  finally
    Ini.Free
  end;
end;

function TPrgFiscal.StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
     begin
     Result := @Str[1];
     end
  else
     begin
     Result := StrAlloc(Length(Str)+1);
     RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
     StrPCopy(Result,Str);
     StrDispose(Ring[RingIndex]);
     Ring[RingIndex]:= Result;
     end;
end;

function TPrgFiscal.IntToBin(Value: LongInt;Size: Integer): String;
{Converte uma string em bin�rio}
var
  i: Integer;
begin
Result:='';
for i:=Size downto 0 do
    begin
    if Value and (1 shl i)<>0 then
       begin
       Result:=Result+'1';
       end
    else
       begin
       Result:=Result+'0';
       end;
    end;
end;

function TPrgFiscal.TrocaEpacoPSustenido(Texto: string): String;
var i:integer;
begin
if Texto <> ' ' then
   begin
   for i := 0 to Length(Texto) do
       begin
       if Texto[i]=' ' then
          Texto[i]:='_'
       end;
   end;
   Result := Texto;
end;

procedure TPrgFiscal.GravaIni(Inifile:String;Secao:String;Chave:String;valor:String);
var
Ini: TIniFile;
begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
    Ini.WriteString(Secao,chave,valor);
  finally
    Ini.Free;
  end;
end;

function TPrgFiscal.LegendaNaoFiscal(reg,legenda:String):Boolean;
var  registrador : String;
     BufReg: pchar;
     BufLeg: pchar;
begin
   registrador := Copy(reg,5,2);
   BufReg:=StrToPchar(registrador);
   BufLeg:=StrToPchar(legenda);
   OpenCif;   ElginRetorno := ProgAliquotas(BufReg,BufLeg);
   StrRet := '';
   Result := ElginErros(ElginRetorno,StrRet,'N');   CloseCif;
end;

function TPrgFiscal.ZanthusConfigura():Boolean;
begin
  ZConfECF( );
  Result := True;
end;

{Fun��o para Aumentar a Descricao do Item - Bematech MPFI 20 2}
function TPrgFiscal.AumentaDescrItem(Descricao: String):Boolean;
begin
    if (ECFModel=teBematech) or (ECFModel=teBematechII) then
    begin
      Buffer := ConCat(Chr(27),'|','62','|','52','|',Descricao,'|',Chr(27));
      Result := ImpInError(Buffer);
    end;

    case ECFModel of
    teZanthusIZs_e_Qz:
    begin
        Result := True;
    end;

    teNone:
    begin
        Result := True;
    end;

    end;
end;

function TPrgFiscal.ComandoZanthus(vCmdz: Integer; vArgumz : Pchar; Tam_retz : Pchar ):Boolean;
var
   T:array [0..16] of Char;
   Buf:PChar;
   Cmd,ret,len,tam : integer;
begin
     Buf:=T;
     resultz:=A;
     argum:=B;
     tam_ret:=C;
     pretorno:=D;
     //Pegar os valores;
     // argumentos
     len:=Length(vArgumz);
     if len = 0 then
        argum := NIL
      else
        argum := vArgumz;
     // tamanho do buffer de retorno
     len := Length(Tam_retz);
     if len = 0 then
        tam := 0
     else begin
        tam := StrToInt(Tam_retz);
     end;
     // numero do comando
     len := Length(IntToStr(vCmdz));
     Cmd := vCmdz;
        if len = 0 then
           begin
              ShowMessage ('Comando Inv�lido');
           end
        else
         begin
              D:=''; // limpa buffer pretorno
              C:=''; // limpa buffer tam_ret
              ret:= ZAPIF (Cmd,argum,pretorno,tam,resultz,tam_ret);
              if ret = 0 then
                 begin
                 // Usado em tempo de projeto
{                   MessageDlg('Retorno da variavel Resultz '+resultz,mtInformation,[mbOk],0);
                   MessageDlg('Retorno da variavel Ret '+IntToStr(ret),mtInformation,[mbOk],0);
                   MessageDlg('Retorno da variavel Pretorno  '+pretorno,mtInformation,[mbOk],0);
                   MessageDlg('Retorno da variavel Tam_ret  '+tam_ret,mtInformation,[mbOk],0);  }
                   Result := True;
                 end
              else
                 begin
                    ZanthusErros(resultz);
                 // Usado em tempo de projeto
{                   MessageDlg('Retorno da variavel Resultz no erro '+resultz,mtInformation,[mbOk],0);
                   MessageDlg('Retorno da variavel Ret no erro '+IntToStr(ret),mtInformation,[mbOk],0);
                   MessageDlg('Retorno da variavel Tam_ret no erro '+tam_ret,mtInformation,[mbOk],0);}
                   Result := False;
                  end
          end
end;

function TPrgFiscal.ConsultaHoraVerao:TRetornos; // parametro : S ou N
var
 Retornos : TRetornos;
begin
//   result := false;

{   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
   begin
      Buffer := Concat(Chr(27),'|','18','|',Chr(27));
      Result := ImpInError(Buffer);
   end;   case ECFModel of     teSweda:     begin        // primeiro verifica se esta ou nao em horario de verao        StrPCopy(Comando,#27+'.28');        StrRet:=EnviaCOmando(Comando);        vRes  := Copy(StrRet,54,1);        if EntraVerao = 'S' then
        begin
           if vRes = 'S' then
           begin
              Executed := false; Result := false;
              if Assigned(FUserEvent) then OnError(1,'ECF j� est� em Hor�rio de Ver�o');
              exit;
           end;
        end
        else
        begin
           if vRes = 'N' then
           begin
              Executed := false; Result := false;
              if Assigned(FUserEvent) then OnError(1,'ECF n�o est� em Hor�rio de Ver�o');
              exit;
           end;
        end;}
//        StrPCopy(Comando,#27+'.36' + EntraVerao + '}');
       {        StrRet:=EnviaCOmando(Comando);
        Result := True;
     end;     teSchalterSP:     begin        NroRet := 0;        StrRet := ecfStatusCupom(NroRet);        if SchalterErros(NroRet,StrRet,'S') then        begin           sData := Copy(StrRet,18,25);           vDia  := StrToInt(Copy(sData,1,2));           vMes  := StrToInt(Copy(sData,4,2));           vAno  := StrToInt(Copy(sData,7,2));           sHora := Copy(StrRet,12,17);           vMin  := StrToInt(Copy(sHora,3,2));           vSeg  := StrToInt(Copy(sHora,5,2));           if EntraVerao = 'S' then           begin              vHora := StrToInt(Copy(sHora,1,2))+1;              if vHora = 13 then              begin                 vHora := 1;                 dData := StrToDate(Copy(sData,1,2)+'/'+Copy(sData,4,2)+'/'+Copy(sData,7,2));                 dData := dData+1;                 sData := DateToStr(dData);                 vDia  := StrToInt(Copy(sData,1,2));                 vMes  := StrToInt(Copy(sData,4,2));                 vAno  := StrToInt(Copy(sData,7,2));              end;           end           else           begin              vHora := StrToInt(Copy(sHora,1,2))-1;              if vHora = 0 then              begin                 vHora := 12;                 dData := StrToDate(Copy(sData,1,2)+'/'+Copy(sData,4,2)+'/'+Copy(sData,7,2));                 vDia  := vDia-1;                 sData := DateToStr(dData);                 vDia  := StrToInt(Copy(sData,1,2));                 vMes  := StrToInt(Copy(sData,4,2));                 vAno  := StrToInt(Copy(sData,7,2));              end;           end;           NroRet := ecfAcertaData(vDia,vMes,vAno,vHora,vMin,vSeg);           StrRet := '';           Result := SchalterErros(NroRet,StrRet,'N');
           if Result then ecfLineFeed(1,6);
        end;
     end;     teYanco:     begin        if EntraVerao = 'S' then           vLin2 := '0'        else           vLin2 := '1';        ExecYanco(NumPorta,'08');        Result := YancoErros;     end;}    case ECFModel of     teZanthusIZs_e_Qz :     begin     Ztret := ComandoZanthus(43,'','80');{       if (copy(pretorno,17,1) = 'S' ) then begin        Retornos := 'S';       end
       else if (copy(pretorno,17,1) = 'N' ) then begin
        Retornos := 'N';
       end;}
        Retornos := pretorno;
        Result := Retornos;
     end;     teNone:     begin       Result := Retornos;     end;   end;end;function TPrgFiscal.ComandoCorisco(vCmdc : Integer; Par1 : Pchar; Par2 : Pchar; Par3 : Pchar):Boolean;var Portac : String;begin     Portac := IntToStr(NumPorta+1);     if ( vCmdc = 1 ) then begin        MsgCorisco1 := '';        ctv3 := CreateOleObject('CTV3.PosDLLCorisco');
        s := ctv3.Abrecomunicacao(Portac,'19200,n,8,1','OFF','401',MsgCorisco1);
        if ( MsgCorisco1 = '' ) then begin
         MessageDlg('Executado com sucesso. '+MsgCorisco1,mtInformation,[mbOk],0);  //Comunica��o estabelecida';
         Result := True;
         cRet := True;
         Executed := True;
        end
        else if ( MsgCorisco1 <> '' ) then begin
         MessageDlg('Falha na execu��o. '+MsgCorisco1,mtInformation,[mbOk],0);  //Comunica��o estabelecida';
         CoriscoErros(MsgCorisco1);
         Result := False;
         cRet := False;
         Executed := False;
        end;
     end

     else if ( vCmdc = 2 ) then begin
        MsgCorisco1 := '';
        ctv3 := CreateOleObject('CTV3.PosDLLCorisco');
        s := ctv3.FecharComunicacao(MsgCorisco1);
        if ( MsgCorisco1 = '' ) then begin
         Result := True;
         cRet := True;
        end
        else if ( MsgCorisco1 <> '' ) then begin
         CoriscoErros(MsgCorisco1);
         Result := False;
         cRet := False;
        end;
     end
     else if ( vCmdc = 3 ) then begin        MsgCorisco1 := '';        ctv3 := CreateOleObject('CTV3.PosDLLCorisco');        s := ctv3.AbrirECF(MsgCorisco1);
        if ( MsgCorisco1 = '' ) then begin
         Result := True;
         cRet := True;
        end
        else if ( MsgCorisco1 <> '' ) then begin
         CoriscoErros(MsgCorisco1);
         Result := False;
         cRet := False;
        end;
     end
     else if ( vCmdc = 4 ) then begin        MsgCorisco1 := '';
        ctv3 := CreateOleObject('CTV3.PosDLLCorisco');        s := ctv3.AbrirCupom(MsgCorisco1);
        if ( MsgCorisco1 = '' ) then begin
         Result := True;
         cRet := True;
        end
        else if ( MsgCorisco1 <> '' ) then begin
         CoriscoErros(MsgCorisco1);
         Result := False;
         cRet := False;
        end;
     end
     else if ( vCmdc = 5 ) then begin        MsgCorisco1 := '';
        ctv3 := CreateOleObject('CTV3.PosDLLCorisco');        s := ctv3.AbrirGaveta(MsgCorisco1);
        if ( MsgCorisco1 = '' ) then begin
         Result := True;
         cRet := True;
        end
        else if ( MsgCorisco1 <> '' ) then begin
         CoriscoErros(MsgCorisco1);
         Result := False;
         cRet := False;
        end;
     end
     else if ( vCmdc = 6 ) then begin         Result := true;
     end     else if ( vCmdc = 7 ) then begin         Result := true;
     end     else if ( vCmdc = 8 ) then begin         Result := true;
     end     else if ( vCmdc = 9 ) then begin         Result := true;
     end     else if ( vCmdc = 10 ) then begin         Result := true;
     end     else if ( vCmdc = 11 ) then begin         Result := true;
     end     else if ( vCmdc = 12 ) then begin         Result := true;
     end     else if ( vCmdc = 13 ) then begin         Result := true;
     end     else if ( vCmdc = 14 ) then begin         Result := true;
     end     else if ( vCmdc = 15 ) then begin         Result := true;
     end;end;function TPrgFiscal.CoriscoErros(StrRet:string) : boolean;var i, vPos : integer;begin     if ( StrRet = '' ) then begin       Result := True;
       Executed := True;     end

     else if ( StrRet <> '' ) then begin
       StrRet := MsgCorisco1;
       ctv3 := CreateOleObject('CTV3.PosDLLCorisco');       s := ctv3.ChkStatus(StrRet);
       MessageDlg('Status do erro: '+StrRet,mtInformation,[mbOk],0);

       for i := 1 to 34 do
         begin
            vPos := Pos(':',MsgCorisco[i]);
            if Copy(MsgCorisco[i],1,vPos-1) = Copy(StrRet,1,2) then  begin
               if Assigned(FUserEvent) then OnError(Abs(i),MsgCorisco[i]);
               break;
            end;
       end;

       if Copy(StrRet,1,4)='Erro:' then begin
         for i := 1 to 34 do
         begin
            vPos := Pos(':',MsgCorisco[i]);
               if Assigned(FUserEvent) then OnError(Abs(i),MsgCorisco[i]);
               break;
         end;
        end;

        Result := False;        Executed := False;     end;end;function TPrgFiscal.ZanthusErros(Codigo:string) : boolean;var i, vPos : integer;begin      Result := False;      Executed := False;     if ( Codigo = '\00000\00000\' ) then begin       Result := True;
       Executed := True;     end

     else if ( Codigo <> '\00000\00000\' ) then begin
       Codigo := Copy(Codigo,2,5);
       for i := 1 to 48 do         begin
            vPos := Pos(':',MsgZanthus[i]);
            if Copy(MsgZanthus[i],1,vPos-1) = Codigo then  begin
               if Assigned(FUserEvent) then OnError(Abs(i),MsgZanthus[i]);
               break;
            end;
       end;

        Result := False;
        Executed := False;     end;end;function  TPrgFiscal.IniciaDia(Pr1 : String; Pr2 : String; Pr3 : String):Boolean;begin   if (ECFModel=teBematech) or (ECFModel=teBematechII) then       begin
         Result := True;
       end;
   case ECFModel of
     teSweda:
     begin
         Result := True;
     end;

     teSchalterSP:
       begin
         Result := True;
       end;

     teElgin:
       begin
         Result := True;
       end;
       teZanthusIZs_e_Qz:       begin
          argumz := StrToPchar('\0\');
          ztret := ComandoZanthus(01,argumz,'');
          Result := ztret;
       end;       teNone:
       begin
         Result := True;
       end;

   end;{case}
end;function  TPrgFiscal.FinalizaDia(Pr1 : String; Pr2 : String; Pr3 : String):Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then
       begin
         Result := True;
       end;
   case ECFModel of
     teSweda:
     begin
         Result := True;
     end;

     teSchalterSP:
       begin
         Result := True;
       end;

     teElgin:
       begin
         Result := True;
       end;
       teZanthusIZs_e_Qz:       begin
          argumz := StrToPchar('\0\');
          ztret := ComandoZanthus(09,argumz,'');
          Result := ztret;
       end;       teNone:
       begin
         Result := True;
       end;

   end;{case}
end;

function TPrgFiscal.Emergencia(Pr1 : String; Pr2 : String):Boolean;
begin
   if (ECFModel=teBematech) or (ECFModel=teBematechII) then  begin
       Buffer := ConCat(Chr(27),'|','70','|',Chr(27));       Result := ImpInError(Buffer);   end;end;

end.


