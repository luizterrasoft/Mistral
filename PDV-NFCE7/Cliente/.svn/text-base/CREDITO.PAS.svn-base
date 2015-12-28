{Ainda ha lugares pesquisando o cheque devolvido so com BANCO/NUMERO ***}
unit credito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers, dbTables, DB,funcoesglobais;

function ClienteNoSpc (codigo: Real):Boolean;
function InformaSaldoDevedor(codcli,loja: Real; flag: Boolean):Real;
function InformaLimiteCredito(codcli: Real):Real;
function ChequeNoSpc (ccgc: String; banco,numero: Real):Boolean;
function ClienteEstaBloqueado_DevolveMotivo(codigocliente: Real):String;
function LerJuros(valor,atraso,loja: Real):Real;
function LerMulta(valor,atraso,loja: Real):Real;
function DigitoVerificador (chave: String):Real;
procedure MarcaCarnetContrato (cliente,contrato: Real);
function InformaQtpreDevedor(codcli,loja: Real; flag: Boolean):Real;
function ClienteComChequeDevolvido (cnpj: String):Boolean;
function ClienteComChequeDevolvidoPago (cnpj: String):Boolean;
function ClienteComChequeDevolvido2 (cnpj: String):Boolean;
function RetornaData (data: TDateTime; dia_x: Word;inc: Integer):TDateTime;
function DiaMaximo(mes,ano: Integer):Word;
function PrestacaoNoSpc (cliente,codigo: Real; prestacao: Integer):Boolean;
function ReabrePrestacao (cliente,contrato,prestacao,valor: Real):Boolean;
procedure DiminueQtdePrestDev (cliente,contrato,valor: Real);
procedure AumentaQtdePrestDev (cliente,contrato,valor: Real);
function ReabreCheqPre (ccgc,banco,numero: String):Boolean;
function IsQuitada (cliente,contrato,prestacao: String):Boolean;
function QuitaPrestacao (cliente, contrato, npre, loja, valpgo: Real; pgto: TDateTime;fpgto:Real=0;imp:Boolean=false;data2:TDateTime=0;valor2:Real=0):Boolean;
procedure AtualizaCliente(cliente: Real; ultpgto: TDateTime);
procedure RedefinirUltimaCompra (cliente: Real);
procedure RedefinirQtCompra (cliente: Real; incremento: Integer);
procedure LancaFormaPgtoPrestacao(codcli,codcont,prestacao: Real; forma_pgto: Real);
procedure CarregaFotoCliente_ (cpfcnpj: String; imagem: TImage);
function QuitaChequeDev (ccgc,banco,numero: String; valor: Real; data: TDateTime; Obs: String; Portador: Real):Boolean;
function QuitaChequePre (ccgc,banco,numero: String):Boolean;
function QuitaChequePre1 (ccgc,banco,numero: String;data: TDateTime;valor:Real):Boolean;
function VerificaRestricaoQtdeMaximaCrediario(codigo_plano: Real):Integer;
function  InformaQtCredAberto(codcli,plano: Real):Real;

{*** Criticas relacionadas as restricoes de venda - IMPORTANTISSIMO!!!!!}
function VerificaRestricaoDeValorMaximoPrestacao(codigo_plano: Real):Real;
function VerificaRestricaoDeCriticaClienteAtraso(codigo_plano: Real):Boolean;
function VerificaRestricaoDePercEntCliAtras(codigo_plano: Real):Real;
function VerificaRestricaoCliAtrasDias(codigo_plano: Real):Integer;
function VerificaRestricaoDePercEntCliNovos(codigo_plano: Real):Real;
function VerificaRestricaoQtdeMaximaPrestacao(codigo_plano: Real):Integer;
function VerificaRestricaoDePercEntCliSemComprar(codigo_plano: Real):Real;
function VerificaRestricaoCliSemComprarDias(codigo_plano: Real):Integer;

procedure ChecaExistenciaArquivo_TEMPCARNETJATODETINTA;

{*** 14/06/2010 *** Rodrigo Cordeiro *** Grava o LOG da operação ***}
procedure AuditaOperacao(codigoocorrencia,codigoUsuario: Real; nomeUsuario,complemento: String);

implementation

uses contratos, principal, funcoes1, funcoes2, loja, cliente, chequesdev, chequesdvpg,
  auxiliar, DM4, prestcontrato, DM5, cheques, chequespg, DM7, DM10, caixa;

{Funcao que retorna o digito verificador dos N. de documentos dos contratos ***}
function DigitoVerificador (chave: String):Real;
var
  resto,quociente,soma: Real;
  i,value: Integer;
begin
  i:=1;
  soma:=0;
  while (i<=16) do
  begin
    value := strtoint(chave[i]);
    soma := soma + (value*i);
    i:=i+1;
  end;
  quociente := Trunc(soma/11);
  resto := soma - (quociente*11);
  if (resto=0) then
    DigitoVerificador:=0
  else
    DigitoVerificador := 10 - resto;
end;

{Procedimento que marca o contrato como tendo o carnet ja impresso ***}
procedure MarcaCarnetContrato (cliente,contrato: Real);
var
  clCont: TClassContrato;
begin
  clCont:=TClassContrato.Create;
  with (clCont) do
  begin
    conect   ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('Update CRECTABR                                ');
    AddParam ('Set    CR_CARN='+chr(39)+'1'+chr(39)+',        ');
    AddParam ('       CR_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+'  ');
    AddParam ('Where  (CR_CLIE='+floattostr(cliente) +') AND  ');
    AddParam ('       (CR_CODI='+floattostr(contrato)+')      ');
    Execute;
    desconect;
    Free;
  end;
end;

function VerificaRestricaoQtdeMaximaCrediario(codigo_plano: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT MAXIMO_CRED,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('MAXIMO_CRED');
  end
  else
    result := 0;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAXIMO_CRED                       ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('MAXIMO_CRED');

  clAux.desconect;
  clAux.Free;
end;

{Funcao que informa qual a qtde. de crediário em aberto, daquele cliente}
function  InformaQtCredAberto(codcli,plano: Real):Real;
var
  clAux: TclassContrato;
  codigo,codplan: String;
begin
  codigo:=floattostr(codcli);
  codplan := FloatToStr(plano);
  clAux := TClassContrato.Create;
  with (clAux) do
  begin
    conect   ('CREDITO', frm_principal);
    ClearSql;
    AddParam ('Select   CR_CODI                                          ');
    AddParam ('From     CRECTABR,CREPRABR                                ');
    AddParam ('Where    (CR_CODI=PC_CONT)    AND (CR_CLIE=PC_CLIE) AND   ');
    AddParam ('         (CR_CLIE='+codigo+') AND                         ');
    AddParam ('         (CR_PLAN='+codplan+')  AND                       ');
    AddParam ('         (CR_PDEV>0) AND (CR_PDEV<=CR_QPRE)               ');
    AddParam ('Group by CR_CODI                                          ');
    if (not Execute) then
      InformaQtCredAberto := 0
    else
      InformaQtCredAberto := RecCount;
  end;
  clAux.Desconect;
  clAux.Free;
end;

{Funcao que retorna o valor da multa por dia de atraso de pgto. ***}
function LerMulta(valor,atraso,loja: Real):Real;
var
  clLoja: TClassLoja;
begin
  if (atraso<>0) and (loja<>0) then
  begin
    clLoja:=TClassLoja.Create;
    with (clLoja) do
    begin
      conect   (databasecredito,frm_principal);
      AddParam ('Select LO_MULT,LO_DMUL                    ');
      if (databasecredito='CREDITO') then
      begin
        AddParam ('From CRELOJA                         ');
        AddParam ('Where (LO_CODI='+floattostr(loja)+') ');
      end
      else
        AddParam ('From CONF                            ');
      if (Execute) then
      begin
        if (atraso>=Result('LO_DMUL')) then
          LerMulta := (Result('LO_MULT')*valor)/100;
      end
      else
        LerMulta := 0.00;
      desconect;
      Free;
    end;
  end;
end;

{Funcao que retorna os juros por dia de atraso ***}
{Formula da calculo do juros: valorfinal = ((taxa*valor)/100)*ndias}
{O juros de mora é diario ***}
function  LerJuros(valor,atraso,loja: Real):Real;
var
  clLoja: TClassLoja;
  juros: Real;
begin
  if (atraso<>0) and (loja<>0) then
  begin
    clLoja:=TClassLoja.Create;
    with (clLoja) do
    begin
      conect   (databasecredito,frm_principal);
      AddParam ('Select LO_MORA,LO_DMOR                   ');
      if (databasecredito='CREDITO') then
      begin
        AddParam ('From CRELOJA                         ');
        AddParam ('Where (LO_CODI='+floattostr(loja)+') ');
      end
      else
        AddParam ('From CONF                            ');
      if (Execute) then
      begin
        if (atraso>=Result('LO_DMOR')) then
        begin
          juros := (Result('LO_MORA')*valor)/100;
          LerJuros := juros*(atraso - Result('LO_DMOR'));
        end
        else
          LerJuros := 0.00;
      end
      else
        LerJuros := 0.00;
      desconect;
      Free;
    end;
  end;
end;

{Funcao que informa o limite de crédito do camarada *** - Todos os debitos independente de datas}
function  InformaLimiteCredito(codcli: Real):Real;
var
  clAux: TclassCliente;
  codigo: String;
begin
  codigo:=floattostr(codcli);
  clAux := TClassCliente.Create;
  with (clAux) do
  begin
    conect   ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('Select CL_LIMC                     ');
    AddParam ('From   CRECLI                      ');
    AddParam ('Where  (CL_CODI='+codigo+')        ');
    if (Execute) then
      InformaLimiteCredito:=result('CL_LIMC') - InformaSaldoDevedor(codcli,-1,false)
    else
      InformaLimiteCredito:=0.00;
    desconect;
    Free;
  end;
end;

{Funcao que informa qual a qtde. de prestacoes em aberto, daquele cliente}
function  InformaQtpreDevedor(codcli,loja: Real; flag: Boolean):Real;
var
  clAux: TclassContrato;
  hoje,codigo: String;
begin
  codigo:=floattostr(codcli);
  clAux := TClassContrato.Create;
  with (clAux) do
  begin
    conect   ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('Select COUNT(*) as TOTAL                           ');
    AddParam ('From   CREPRABR,CRECTABR                           ');
    AddParam ('Where  (PC_CLIE='+codigo+') AND                    ');
    AddParam ('       (PC_STAT='+chr(39)+'0'+chr(39)+') AND       ');
    AddParam ('       (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI)     ');          
    if (flag) then
    begin
      hoje := FormataData(frm_principal.x_data_trabalho);
      AddParam ('AND (PC_DVTO<'+chr(39)+hoje+chr(39)+')  ');
    end;
    if (loja<>-1) then
      AddParam ('AND (PC_LOJA='+floattostr(loja)+') ');
    Execute;
    if (reccount=0) then
      InformaQtpreDevedor:=0
    else
      InformaQtpreDevedor:=result('TOTAL');
    desconect;
    Free;
  end;
end;

{Funcao que informa qual o saldo devedor do camarada *** - Todos os debitos independente de datas}
function  InformaSaldoDevedor(codcli,loja: Real; flag: Boolean):Real;
var
  clAux: TclassContrato;
  hoje,codigo: String;
begin
  codigo:=floattostr(codcli);
  clAux := TClassContrato.Create;
  with (clAux) do
  begin
    conect   ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('Select SUM(PC_VALO) as TOTVALO                  ');
    AddParam ('From   CREPRABR,CRECTABR                        ');
    AddParam ('Where  (PC_CLIE='+codigo+') AND                 ');
    AddParam ('       (PC_STAT='+chr(39)+'0'+chr(39)+') AND    ');
    AddParam ('       (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI)  ');
    if (flag) then
    begin
      hoje := FormataData(frm_principal.x_data_trabalho);
      AddParam ('AND (PC_DVTO<'+chr(39)+hoje+chr(39)+')     ');
    end;
    if (loja<>-1) then
      AddParam ('AND (PC_LOJA='+floattostr(loja)+')         ');
    Execute;
    if (reccount=0) then
      InformaSaldoDevedor:=0.00
    else
      InformaSaldoDevedor:=result('TOTVALO');
    desconect;
    Free;
  end;
end;

{Funcao que indica se o cliente tem cheque devolvido ou nao ***}
{O flag CFUN é preservado}
function ClienteComChequeDevolvido2 (cnpj: String):Boolean;
var
  clCheqDev: TClassChequeDev;
begin
  ClienteComChequeDevolvido2:=false;
  if (Trim(cnpj)<>'') then
  begin
    clCheqDev := TClassChequeDev.Create;
    with (clCheqDev) do
    begin
      conect   ('CREDITO',frm_principal);
      ClearSql;
      AddParam ('Select CH_CCGC,CH_CLIE  ');
      AddParam ('From   CRECHDEV ');
      AddParam ('Where  (CH_CCGC='+chr(39)+cnpj+chr(39)+')  ');
      if (Execute) then
        ClienteComChequeDevolvido2:=true
      else
        ClienteComChequeDevolvido2:=false;
      desconect;
      Free;
    end;
  end
  else
    ClienteComChequeDevolvido2:=false;
end;

{Funcao que indica se o cliente tem cheque devolvido ou nao ***}
function ClienteComChequeDevolvidoPago (cnpj: String):Boolean;
var
  clCheqDev: TClassChequeDev;
  flag: String;
begin
  flag:='N';
  ClienteComChequeDevolvidoPago:=false;
  if (Trim(cnpj)<>'') then
  begin
    clCheqDev := TClassChequeDev.Create;
    with (clCheqDev) do
    begin
      conect   ('CREDITO',frm_principal);
      ClearSql;
      AddParam ('Select CH_CCGC,CH_CLIE   ');
      AddParam ('From   CRECHDVPG ');
      AddParam ('Where  (CH_CCGC='+chr(39)+cnpj+chr(39)+')  ');
      if (Execute) then
        ClienteComChequeDevolvidoPago:=true
      else
        ClienteComChequeDevolvidoPago:=false;
      desconect;
      Free;
    end;
  end
  else
    ClienteComChequeDevolvidoPago:=false;
end;

{30/60/90 ***}
function RetornaData (data: TDateTime; dia_x: Word;inc: Integer):TDateTime;
var
  Year,Month,Day: Word;
  mes: Integer;
  dif: Integer;
begin
  DecodeDate(data, Year, Month, Day);
  mes:=Month;
  dif:=12-mes;
  if (inc>dif) then
  begin
    Year:=Year+1;
    mes:=(0-dif);
  end;
  try
    data:=strtodate(form_nz(dia_x,2)+'/'+form_nz(mes+inc,2)+'/'+Copy(inttostr(Year),3,2));
  except
    data:=strtodate(form_nz(DiaMaximo(mes+inc,Year),2)+'/'+form_nz(mes+inc,2)+'/'+Copy(inttostr(Year),3,2));
  end;
  RetornaData:=data;
end;

{feriado ***}
function DiaMaximo(mes,ano: Integer):Word;
var
  resto: Real;
begin
  if (mes=1) then
    result:=31
  else
  if (mes=2) then
  begin
    resto:= ano mod 4;
    if (resto=0) then
      result:=29
    else
      result:=28;
  end
  else
  if (mes=3) then
    result:=31
  else
  if (mes=4) then
    result:=30
  else
  if (mes=5) then
    result:=31
  else
  if (mes=6) then
    result:=30
  else
  if (mes=7) then
    result:=31
  else
  if (mes=8) then
    result:=31
  else
  if (mes=9) then
    result:=30
  else
  if (mes=10) then
    result:=31
  else
  if (mes=11) then
    result:=30
  else
  if (mes=12) then
    result:=31;
end;

{Reabre a prestacao se estiver quitada ***}
{Obs: o valor usado para diminuir as prestacoes é o valor da parcela - PC_VALO, sempre}
function  ReabrePrestacao (cliente,contrato,prestacao,valor: Real):Boolean;
var
  clAux: TClassPrestContrat;
  clienteS,contratoS,npreS: String;
begin
  try
         //************************************************************************************
    if (databasecontas='CONTASPAGAR') and (databaseprodutos='ESTOQUE') then
      if (IsQuitada (floattostr(cliente),floattostr(contrato),floattostr(prestacao))) then
        RemoveLancamentos_Crediario (cliente,contrato,prestacao);
         //************************************************************************************
    with (DMAtualizReceb.qReabreDoc) do
    begin
      parambyname('cliente').AsFloat   := cliente;
      parambyname('contrato').AsFloat  := contrato;
      parambyname('prestacao').AsFloat := prestacao;
      parambyname('status').AsString   := '0';
      parambyname('time').AsDateTime   := frm_principal.x_data_trabalho;
      ExecSql;
    end;
         //************************************************************************************
    AumentaQtdePrestDev (cliente,contrato,valor);
         //************************************************************************************
    ReabrePrestacao := true;
  except
    ReabrePrestacao := false;
  end;
end;

{Rotina que atualiza a qtde. de prestacoes devidas no contrato ***}
{Obs importante: existe o cuidado de IGUALAR CR_VDEV=CR_TOT2, por motivo
 de arredondamento de adicoes da operacao CR_VDEV = CR_VDEV + :valor}
procedure AumentaQtdePrestDev (cliente,contrato,valor: Real);
var
  clAux: TClassAuxiliar;
  qpre,pdev: Integer;
begin
   {CRITICAS ao aumento ***}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select CR_QPRE                                ');
  clAux.AddParam ('From   CRECTABR                               ');
  clAux.AddParam ('Where (CR_CLIE='+floattostr(cliente)+') AND   ');
  clAux.AddParam ('      (CR_CODI='+floattostr(contrato)+')      ');
  if (clAux.Execute) then
    qpre := clAux.result('CR_QPRE')
  else
    qpre := 0;

  clAux.ClearSql;
  clAux.AddParam ('Select COUNT(*) as PDEV                       ');
  clAux.AddParam ('From   CREPRABR,CRECTABR                      ');
  clAux.AddParam ('Where (PC_CLIE='+floattostr(cliente)+') AND   ');
  clAux.AddParam ('      (PC_CONT='+floattostr(contrato)+') AND  ');
  clAux.AddParam ('      (PC_STAT='+chr(39)+'0'+chr(39)+') AND   ');
  clAux.AddParam ('      (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI) ');

  if (clAux.Execute) then
  begin
    pdev := clAux.Result('PDEV');
    if (pdev<=qpre) then
    begin
      with (DMAtualizReceb.qAumenta) do
      begin
        parambyname('cliente').AsFloat     := cliente;
        parambyname('contrato').AsFloat    := contrato;
        parambyname('prestacao').AsInteger := pdev;
        parambyname('valor').AsFloat       := valor;
        parambyname('time').AsDateTime     := frm_principal.x_data_trabalho;
        ExecSql;
      end;

           {primeira prestacao-->}
      if (pdev=qpre) then
      begin
        clAux.ClearSql;
        clAux.AddParam ('Update CRECTABR                                 ');
        clAux.AddParam ('Set    CR_VDEV=CR_TOT2,                         ');
        clAux.AddParam ('       CR_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
        clAux.AddParam ('Where (CR_CLIE='+floattostr(cliente)+') AND     ');
        clAux.AddParam ('      (CR_CODI='+floattostr(contrato)+')        ');
        clAux.Execute;
      end;
    end;
  end;
  clAux.desconect;
  clAux.Free;
end;

{Funcao que reabre os cheques-pre pelo banco,numero ***}
function ReabreCheqPre (ccgc,banco,numero: String):Boolean;
var
  clCheq: TClassCheque;
  clCheqPg: TClassChequePg;
begin
  try
    clCheqPg := TClassChequePg.Create;
    with (clCheqPg) do
    begin
      conect   ('CREDITO', frm_principal);
      ClearSql;
      AddParam ('Select CH_CODI,CH_CCGC,CH_CLIE,CH_NUME,CH_DTCT,CH_NOME, ');
      AddParam ('       CH_FONE,CH_LOJA,CH_DVTO,CH_PORT,CH_BANC,         ');
      AddParam ('       CH_AGEN,CH_DTRA,CH_TRAN,CH_VALO,CH_OBS           ');
      AddParam ('From   CRECHMVPG                                        ');
      AddParam ('Where  (CH_CCGC='+chr(39)+ccgc+chr(39)+') AND           ');
      AddParam ('       (CH_BANC='+banco+') AND                          ');
      AddParam ('       (CH_NUME='+numero+')                             ');
      if (Execute) then
      begin
        clCheq := TClassCheque.Create;
        with (clCheq) do
        begin
          conect ('CREDITO',frm_principal);
          ClearFields;
          inCH_CLIE := clCheqPg.Result('CH_CLIE');
          inCH_NUME := clCheqPg.Result('CH_NUME');
          inCH_CCGC := clCheqPg.Result('CH_CCGC');
          inCH_NOME := clCheqPg.Result('CH_NOME');
          inCH_DTCT := clCheqPg.Result('CH_DTCT');
          inCH_FONE := clCheqPg.Result('CH_FONE');
          inCH_LOJA := clCheqPg.Result('CH_LOJA');
          inCH_DVTO := clCheqPg.Result('CH_DVTO');
          inCH_PORT := clCheqPg.Result('CH_PORT');
          inCH_BANC := clCheqPg.Result('CH_BANC');
          inCH_AGEN := clCheqPg.Result('CH_AGEN');
          inCH_VALO := clCheqPg.Result('CH_VALO');
          inCH_OBS  := clCheqPg.Result('CH_OBS');
          inCH_TIME := frm_principal.x_data_trabalho;
          inCH_STAT := '0';
          Insert;
          desconect;
          Free;
        end;

                 {Apaga o cheque do arquivo de pagos ***}
        with (DMBaixAutCheq.qReabreDoc) do
        begin
          parambyname('ccgc').AsString   := clCheqPg.Result('CH_CCGC');
          parambyname('banco').AsFloat   := clCheqPg.Result('CH_BANC');
          parambyname('numero').AsFloat  := clCheqPg.Result('CH_NUME');
          ExecSql;
        end;
      end;
      desconect;
      Free;
    end;
    ReabreCheqPre:=true;
  except
    ReabreCheqPre:=false;
  end;
end;

{Verifica se uma prestacao esta quitada}
function  IsQuitada (cliente,contrato,prestacao: String):Boolean;
var
  clAux: TclassContrato;
begin
  cliente:=Trim(cliente);
  contrato:=Trim(contrato);
  prestacao:=Trim(prestacao);
  if (cliente<>'') and (contrato<>'') and (prestacao<>'') then
  begin
    if (strtofloat(prestacao)=0) then
      IsQuitada:=true
    else
    begin
      clAux := TClassContrato.Create;
      with (clAux) do
      begin
        conect   ('CREDITO',frm_principal);
        ClearSql;
        AddParam ('Select PC_STAT                       ');
        AddParam ('From   CREPRABR,CRECTABR             ');
        AddParam ('Where  (PC_CLIE='+cliente+')  AND    ');
        AddParam ('       (PC_CONT='+contrato+') AND    ');
        AddParam ('       (PC_NPRE='+prestacao+') AND   ');
        AddParam ('       (PC_CLIE=CR_CLIE) AND         ');
        AddParam ('       (PC_CONT=CR_CODI)             ');
        if (not Execute) then
          IsQuitada:=false
        else
        if (result('PC_STAT')='1') then
          IsQuitada:=true
        else
          IsQuitada:=false;
        desconect;
        Free;
      end;
    end;
  end
  else
    IsQuitada:=false;
end;

{Registra a forma de pagamento na prestacao ----}
procedure LancaFormaPgtoPrestacao(codcli,codcont,prestacao: Real; forma_pgto: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE CREPRABR SET PC_FPGT=:forma_pgto');
  clAux.AddParam ('WHERE (PC_CLIE=:cliente) AND              ');
  clAux.AddParam ('      (PC_CONT=:contrato) AND             ');
  clAux.AddParam ('      (PC_NPRE=:prestacao)                ');
  clAux.consulta.parambyname('cliente').AsFloat    := codcli;
  clAux.consulta.parambyname('contrato').AsFloat   := codcont;
  clAux.consulta.parambyname('prestacao').AsFloat  := prestacao;
  clAux.consulta.parambyname('forma_pgto').AsFloat := forma_pgto;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure CarregaFotoCliente_ (cpfcnpj: String; imagem: TImage);
var
  nome_arquivo: String;
begin
  imagem.visible := true;
  nome_arquivo   := cpfcnpj;
  if (FileExists(frm_principal.x_path_fotos_clientes+'\'+nome_arquivo+'.JPG')) then
    imagem.picture.loadfromFile(frm_principal.x_path_fotos_clientes+'\'+nome_arquivo+'.JPG')
  else
  if (FileExists(frm_principal.x_path_fotos_clientes+'\'+nome_arquivo+'.GIF')) then
    imagem.picture.loadfromFile(frm_principal.x_path_fotos_clientes+'\'+nome_arquivo+'.GIF')
  else
  if (FileExists(frm_principal.x_path_fotos_clientes+'\'+nome_arquivo+'.BMP')) then
    imagem.picture.loadfromFile(frm_principal.x_path_fotos_clientes+'\'+nome_arquivo+'.BMP')
  else
    imagem.visible := false;
end;


{Funcao que realiza a quitacao de uma prestacao paga com cheque ***}
{Obs: o valor usado para diminuir as prestacoes é o valor da parcela - PC_VALO, sempre}
function QuitaPrestacao (cliente, contrato, npre, loja, valpgo: Real; pgto: TDateTime;fpgto:Real=0;imp:Boolean=false;data2:TDateTime=0;valor2:Real=0):Boolean;
var
  clAux,claux2: TClassPrestContrat;
  clCred: TClassAuxiliar;
  vtipz,clienteS,contratoS,npreS: String;
  oldfpgto,valor_da_prestacao: Real;
begin
  try
    with (clAux) do
    begin
      clienteS  := floattostr(cliente);
      contratoS := floattostr(contrato);
      npreS     := floattostr(npre);
      clAux     := TClassPrestContrat.Create;
      conect   ('CREDITO',frm_principal);
      ClearSql;
      AddParam ('Select PC_VALO,CR_PLAN,PC_STAT,PC_NUME,PC_FPGT');
      AddParam ('From   CREPRABR,CRECTABR           ');
      AddParam ('Where (PC_CLIE='+clienteS+') AND   ');
      AddParam ('      (PC_CONT='+contratoS+') AND  ');
      AddParam ('      (PC_NPRE='+npreS+') AND      ');
      AddParam ('      (PC_CLIE=CR_CLIE) AND        ');
      AddParam ('      (PC_CONT=CR_CODI)            ');
      Execute;
      oldfpgto := clAux.result('PC_FPGT');
      valor_da_prestacao := clAux.result('PC_VALO');
             //************************************************************************************
      if (databasecontas='CONTASPAGAR') and (databaseprodutos='ESTOQUE') then
        if (clAux.Result('PC_STAT')='0') then //SOMENTE SE ESTIVER EM ABERTO
        begin
          clCred := TClassAuxiliar.Create;
          with (clCred) do
            try
              conect   ('ESTOQUE', frm_principal);
              ClearSql; //TABELA QUE LINKA OS CONTRATOS COM O 'ESTOQUE'
              AddParam ('Select   VE_TIPZ                                          ');
              AddParam ('From     CREDIARIOS,VENDAS                                ');
              AddParam ('Where    (CR_LOJA=VE_LOJA) AND (CR_CAIX=VE_CAIX) AND      ');
              AddParam ('         (CR_VEND=VE_CODI) AND                            ');
              AddParam ('         (CR_CLIE=:cliente) AND                           ');
              AddParam ('         (CR_CODI=:contrato)                              ');
              consulta.parambyname('cliente').AsFloat  := cliente;
              consulta.parambyname('contrato').AsFloat := contrato;
              consulta.open;
              vtipz := result('Ve_tipz');
            finally
              desconect;
              Free;
            end;

          if (fpgto = 0) and (claux.Result('PC_NUME') <> 0) then
            try
              clAux2     := TClassPrestContrat.Create;
              claux2.conect   ('CREDITO',frm_principal);
              claux2.clearsql;
              claux2.addparam('Select min(Fp_Codi) as fp_codi from CREFPGT where fp_tipo = ''CHEQUE'' ');
              claux2.execute;
              fpgto := claux2.Result('Fp_Codi');
            finally
              claux2.Desconect;
              claux2.destroy;
            end;

          if valor2 = 0 then
            valor2 := valpgo;

          if data2 = 0 then
            data2  := pgto;

          GeraLancamentos_Crediario (cliente,contrato,npre,loja,
            clAux.Result('CR_PLAN'),
            valor2,
            data2,
            iifs(Vtipz = '','1',vtipz),
            fpgto);
        end;
      desconect;
      Free;
    end;

    if imp then
      exit;

    with (DMAtualizReceb.qBaixaDoc) do
    begin
      parambyname('cliente').AsFloat    := cliente;
      parambyname('contrato').AsFloat   := contrato;
      parambyname('prestacao').AsFloat  := npre;
      parambyname('status').AsString    := '1';
      parambyname('loja').AsFloat       := loja;
      parambyname('valor').AsFloat      := valpgo;
      parambyname('datpgto').AsDateTime := pgto;
      parambyname('Pc_Fpgt').AsFloat    := iifs(fpgto = 0,oldfpgto,fpgto);
      parambyname('time').AsDateTime    := frm_principal.x_data_trabalho;
      parambyname('horapgto').AsString   := TimeToStr(Time);
      ExecSql;
    end;
        //************************************************************************************
    DiminueQtdePrestDev (cliente,contrato,valor_da_prestacao); {...}
        //************************************************************************************
    AtualizaCliente (cliente,pgto);
        //************************************************************************************
    QuitaPrestacao:=true;
  except
    QuitaPrestacao:=false;
  end;
end;

{Rotina que atualiza a qtde. de prestacoes devidas no contrato ***}
{Obs importante: existe o cuidado de ZERAR o valor devido, por motivo
 de arredondamento de subtracoes da operacao CR_VDEV = CR_VDEV - :valor}
procedure DiminueQtdePrestDev (cliente,contrato,valor: Real);
var
  clAux: TClassAuxiliar;
  pdev: Integer;
begin
     {CRITICAS a diminuicao ***}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select COUNT(*) as PDEV                        ');
  clAux.AddParam ('From   CREPRABR,CRECTABR                       ');
  clAux.AddParam ('Where (PC_CLIE='+floattostr(cliente)+') AND    ');
  clAux.AddParam ('      (PC_CONT='+floattostr(contrato)+') AND   ');
  clAux.AddParam ('      (PC_STAT='+chr(39)+'0'+chr(39)+') AND    ');
  clAux.AddParam ('      (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI)  ');
  if (clAux.Execute) then
  begin
    pdev := clAux.Result('PDEV');
    with (DMAtualizReceb.qDiminue) do
    begin
      parambyname('cliente').AsFloat     := cliente;
      parambyname('contrato').AsFloat    := contrato;
      parambyname('prestacao').AsInteger := pdev;
      parambyname('valor').AsFloat       := valor;
      parambyname('time').AsDateTime     := frm_principal.x_data_trabalho;
      ExecSql;
    end;

       {ultima prestacao-->}
    if (pdev=0) then
    begin
      clAux.ClearSql;
      clAux.AddParam ('Update CRECTABR     ');
      clAux.AddParam ('Set    CR_VDEV=0,   ');
      clAux.AddParam ('       CR_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
      clAux.AddParam ('Where (CR_CLIE='+floattostr(cliente)+') AND ');
      clAux.AddParam ('      (CR_CODI='+floattostr(contrato)+') ');
      clAux.Execute;
    end;
  end;
  clAux.desconect;
  clAux.Free;
end;

{Funcao que atualiza certos dados no cliente para fins de acumulador ***}
procedure AtualizaCliente(cliente: Real; ultpgto: TDateTime);
begin
  with (DMAtualizReceb.qAtualizaCliente) do
  begin
    parambyname('cliente').AsFloat    := cliente;
    parambyname('ultpgto').AsDateTime := ultpgto;
    parambyname('time').AsDateTime    := frm_principal.x_data_trabalho;
    ExecSql;
  end;
end;

function ClienteNoSpc (codigo: Real):Boolean;
var
  clClie: TClassAuxiliar;
  flag: String;
begin
  flag:='N';
  ClienteNoSpc:=false;
  clClie := TClassAuxiliar.Create;
  with (clClie) do
  begin
    conect ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('Select CLIENTE,STATUS                   ');
    AddParam ('From   CONTRATOS_SPC                    ');
    AddParam ('Where  (CLIENTE='+floattostr(codigo)+') ');
    if (Execute) then
    begin
      if (result('STATUS')='0') then
      begin
        ClienteNoSpc:=true;
        flag:='S';
      end
      else
        ClienteNoSpc:=false;
    end
    else
      ClienteNoSpc:=false;

        {marcando o cliente}
    ClearSql;
    AddParam ('Update CRECLI                            ');
    AddParam ('Set    CL_RSPC='+chr(39)+flag+chr(39)+', ');
    AddParam ('       CL_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
    AddParam ('Where  (CL_CODI='+floattostr(codigo)+')  ');
    Execute;
    desconect;
    Free;
  end;
end;

{Funcao que indica se o cliente tem cheque devolvido ou nao ***}
{Se o cliente tem cheque devolvido, entao, o flag CFUN é marcado, senao é desmarcado}
function ClienteComChequeDevolvido (cnpj: String):Boolean;
var
  clCheqDev: TClassChequeDev;
  clClient: TClassCliente;
  flag: String;
begin
  flag:='N';
  ClienteComChequeDevolvido:=false;
  if (Trim(cnpj)<>'') then
  begin
    clCheqDev := TClassChequeDev.Create;
    with (clCheqDev) do
    begin
      conect ('CREDITO',frm_principal);
      ClearSql;
      AddParam ('Select CH_CCGC,CH_CLIE  ');
      AddParam ('From   CRECHDEV ');
      AddParam ('Where  (CH_CCGC='+chr(39)+cnpj+chr(39)+')  ');
      if (Execute) then
      begin
        ClienteComChequeDevolvido:=true;
        flag:='S';
      end
      else
        ClienteComChequeDevolvido:=false;
              
              {marcando o cliente}
      clClient := TClassCliente.Create;
      with (clClient) do
      begin
        conect ('CREDITO',frm_principal);
        ClearSql;
        AddParam ('Update CRECLI ');
        AddParam ('Set    CL_CFUN='+chr(39)+flag+chr(39)+', ');
        AddParam ('       CL_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
        AddParam ('Where  CL_CPF='+chr(39)+cnpj+chr(39));
        Execute;
        desconect;
        Free;
      end;
      desconect;
      Free;
    end;
  end
  else
    ClienteComChequeDevolvido:=false;
end;

function PrestacaoNoSpc (cliente,codigo: Real; prestacao: Integer):Boolean;
var
  clPrest: TClassAuxiliar;
begin
  PrestacaoNoSpc:=false;
  clPrest := TClassAuxiliar.Create;
  with (clPrest) do
  begin
    conect   ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('Select CLIENTE,CONTRATO,PARCELA,STATUS           ');
    AddParam ('From   CONTRATOS_SPC                             ');
    AddParam ('Where  (CLIENTE='+floattostr(cliente)+') AND     ');
    AddParam ('       (CONTRATO='+floattostr(codigo)+') AND     ');
    AddParam ('       (PARCELA='+inttostr(prestacao)+') AND     ');
    AddParam ('       (STATUS='+chr(39)+'0'+chr(39)+')          ');
    if (Execute) then
      PrestacaoNoSpc:=true
    else
      PrestacaoNoSpc:=false;
    desconect;
    Free;
  end;
end;

function ChequeNoSpc (ccgc: String; banco,numero: Real):Boolean;
var
  clCheq: TClassAuxiliar;
begin
  ChequeNoSpc:=false;
  clCheq := TClassAuxiliar.Create;
  with (clCheq) do
  begin
    conect   ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('Select CCGC,BANCO,NUMERO,STATUS               ');
    AddParam ('From   CHEQUES_DEV_SPC                        ');
    AddParam ('Where  (CCGC='+chr(39)+ccgc+chr(39)+') AND    ');
    AddParam ('       (BANCO='+floattostr(banco)+') AND      ');
    AddParam ('       (NUMERO='+floattostr(numero)+') AND    ');
    AddParam ('       (STATUS='+chr(39)+'0'+chr(39)+')       ');
    if (Execute) then
      ChequeNoSpc:=true
    else
      ChequeNoSpc:=false;
    desconect;
    Free;
  end;
end;

{Proc. usado para redefinir a ultima compra do cliente ***}
procedure RedefinirUltimaCompra (cliente: Real);
var
  clAux: TClassAuxiliar;
  ultima_compra: TDateTime;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select MAX(CR_DNOT) as ULTIMA_COMPRA,    ');
  clAux.AddParam ('       COUNT(*) as TOTAL_COMPRAS         ');
  clAux.AddParam ('From   CRECTABR                          ');
  clAux.AddParam ('Where (CR_CLIE='+floattostr(cliente)+')  ');
  if (clAux.Execute) then
    ultima_compra := clAux.result('ULTIMA_COMPRA')
  else
    ultima_compra := strtodate('01/01/1900');
  with (DMcontrato.qCliUltimaCompra) do
  begin
    parambyname('cliente').AsFloat := cliente;
    parambyname('data').AsDateTime := ultima_compra;
    parambyname('time').AsDateTime := frm_principal.x_data_trabalho;
    ExecSql;
  end;
  clAux.desconect;
  clAux.Free;
end;

{Proc. usado para redefinir a quantidade de compras do cliente ***}
procedure RedefinirQtCompra (cliente: Real; incremento: Integer);
var
  clAux: TClassAuxiliar;
  qtde_compras: Integer;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select CL_QTDC                           ');
  clAux.AddParam ('From   CRECLI                            ');
  clAux.AddParam ('Where (CL_CODI='+floattostr(cliente)+')  ');
  if (clAux.Execute) then
    qtde_compras := clAux.result('CL_QTDC') + 1
  else
    qtde_compras := 0;
  with (DMcontrato.qCliQtdCompra) do
  begin
    parambyname('cliente').AsFloat      := cliente;
    parambyname('incremento').AsInteger := incremento;
    parambyname('time').AsDateTime := frm_principal.x_data_trabalho;
    ExecSql;
  end;
  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoDeValorMaximoPrestacao(codigo_plano: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT MAXIMO_VALOR,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('MAXIMO_VALOR')
  end
  else
    result := 0.00;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAXIMO_VALOR                      ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('MAXIMO_VALOR');

  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoDeCriticaClienteAtraso(codigo_plano: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT CRITICA_CLIENTE_ATRASO,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    if (clAux.Result('CRITICA_CLIENTE_ATRASO')='0') then
      result := false
    else
    if (clAux.Result('CRITICA_CLIENTE_ATRASO')='1') then
      result := true;
  end
  else
    result := false;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT CRITICA_CLIENTE_ATRASO            ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    if (clAux.Result('CRITICA_CLIENTE_ATRASO')='0') then
      result := false
    else
    if (clAux.Result('CRITICA_CLIENTE_ATRASO')='1') then
      result := true;

  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoDePercEntCliAtras(codigo_plano: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT PERC_ENT_CLI_ATRAS,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('PERC_ENT_CLI_ATRAS');
  end
  else
    result := 0.00;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT PERC_ENT_CLI_ATRAS                ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('PERC_ENT_CLI_ATRAS');

  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoCliAtrasDias(codigo_plano: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT CLI_ATRAS_DIAS,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('CLI_ATRAS_DIAS');
  end
  else
    result := 0;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT CLI_ATRAS_DIAS                    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('CLI_ATRAS_DIAS');

  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoDePercEntCliNovos(codigo_plano: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT PERC_ENT_CLI_NOVOS,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('PERC_ENT_CLI_NOVOS');
  end
  else
    result := 0.00;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT PERC_ENT_CLI_NOVOS                ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('PERC_ENT_CLI_NOVOS');

  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoQtdeMaximaPrestacao(codigo_plano: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT MAXIMA_QTDE,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('MAXIMA_QTDE');
  end
  else
    result := 0;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAXIMA_QTDE                    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('MAXIMA_QTDE');

  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoDePercEntCliSemComprar(codigo_plano: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT PERC_ENT_CLI_SEM_COMPRAR,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('PERC_ENT_CLI_SEM_COMPRAR');
  end
  else
    result := 0.00;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT PERC_ENT_CLI_SEM_COMPRAR                ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('PERC_ENT_CLI_SEM_COMPRAR');

  clAux.desconect;
  clAux.Free;
end;

function VerificaRestricaoCliSemComprarDias(codigo_plano: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
     {1. procurando restricoes por tipo de plano>>>>}
  clAux.AddParam ('SELECT CLI_SEM_COMPRAR_DIAS,CREDPLANO.PL_TIPO    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA,CREDPLANO ');
  clAux.AddParam ('WHERE  (PL_TIPO=TIPO_PLANO) AND          ');
  clAux.AddParam ('       (PL_CODI=:codigo_plano) AND       ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '1';
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.Result('CLI_SEM_COMPRAR_DIAS');
  end
  else
    result := 0;

     {2. procurando restricoes por codigo especifico de plano>>>>}
  clAux.ClearSql;
  clAux.AddParam ('SELECT CLI_SEM_COMPRAR_DIAS                    ');
  clAux.AddParam ('FROM   CONFIG_RESTRICOES_VENDA           ');
  clAux.AddParam ('WHERE  (CODIGO_PLANO=:codigo_plano) AND  ');
  clAux.AddParam ('       (TIPO_CAMPO=:tipo_campo)          ');
  clAux.consulta.parambyname('codigo_plano').AsFloat := codigo_plano;
  clAux.consulta.parambyname('tipo_campo').AsString  := '0';
  if (clAux.Execute) then
    result := clAux.Result('CLI_SEM_COMPRAR_DIAS');

  clAux.desconect;
  clAux.Free;
end;

procedure ChecaExistenciaArquivo_TEMPCARNETJATODETINTA;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\CREDITO\TEMPCARNETJATODETINTA.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('LINHA');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N0');
    CriaTabela('C:\NATIVA\CREDITO','TEMPCARNETJATODETINTA.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,1);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

//SO FUNCIONARA QUANDO O CREDIARIO ESTIVER 'ON-LINE'
function ClienteEstaBloqueado_DevolveMotivo(codigocliente: Real):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  with (clAux) do
  begin
    conect   ('CREDITO',frm_principal);
    ClearSql;
    AddParam ('SELECT STATUS,MOTIVO                           ');
    AddParam ('FROM   CLIENTES_BLOQUEADOS                     ');
    AddParam ('Where (CLIENTE='+floattostr(codigocliente)+')  ');
    if (Execute) then
    begin
      if (result('STATUS')='0') then
        ClienteEstaBloqueado_DevolveMotivo := '-1'
      else
      if (result('STATUS')='1') then
        ClienteEstaBloqueado_DevolveMotivo := result('MOTIVO');
    end
    else
      ClienteEstaBloqueado_DevolveMotivo := '-1';
    desconect;
    Free;
  end;
end;

{Funcao que copia um cheque devolvido em aberto para o arquivo de baixados ***}
function QuitaChequeDev (ccgc,banco,numero: String; valor: Real;
  data: TDateTime; Obs: String; Portador: Real):Boolean;
var
  clCheqDev: TClassChequeDev;
  clCheqDevPg: TClassChequeDevPg;
begin
  try
    clCheqDev := TClassChequeDev.Create;
    with (clCheqDev) do
    begin
      conect   ('CREDITO',frm_principal);
      ClearSql;
      AddParam ('Select CH_CLIE,CH_CCGC,CH_NUME,CH_DTCT,CH_LOJA,CH_DTEM,  ');
      AddParam ('       CH_DVTO,CH_PORT,CH_BANC,CH_AGEN,CH_VALO,CH_ALIN,  ');
      AddParam ('       CH_NOME,CH_DTRA,CH_TRAN                           ');
      AddParam ('From   CRECHDEV                                          ');
      AddParam ('Where  (CH_BANC='+banco+') AND (CH_NUME='+numero+') AND  ');
      AddParam ('       (CH_CCGC='+chr(39)+ccgc+chr(39)+')                ');
      if (Execute) then
      begin
        clCheqDevPg := TClassChequeDevPg.Create;
        with (clCheqDevPg) do
        begin
          conect ('CREDITO',frm_principal);
          inCH_BANC := clCheqDev.Result('CH_BANC');
          inCH_NUME := clCheqDev.Result('CH_NUME');
          inCH_CCGC := clCheqDev.Result('CH_CCGC');
          inCH_CLIE := clCheqDev.Result('CH_CLIE');
          inCH_NOME := clCheqDev.Result('CH_NOME');
          inCH_DTCT := clCheqDev.Result('CH_DTCT');
          inCH_LOJA := clCheqDev.Result('CH_LOJA');
          inCH_DTEM := clCheqDev.Result('CH_DTEM');
          inCH_DVTO := clCheqDev.Result('CH_DVTO');
          inCH_PORT := clCheqDev.Result('CH_PORT');
          inCH_AGEN := clCheqDev.Result('CH_AGEN');
          inCH_VALO := clCheqDev.Result('CH_VALO');
          inCH_ALIN := clCheqDev.Result('CH_ALIN');
          inCH_VAPG := valor;
          inCH_DTPG := data;
          inCH_OBS  := obs;
          inCH_POR2 := portador;
          inCH_TIME := frm_principal.x_data_trabalho;
          inCH_STAT := '1';
          inCH_DTRA := clCheqDev.Result('CH_DTRA');
          inCH_TRAN := clCheqDev.Result('CH_TRAN');
          Insert;
          desconect;
          Free;
        end;

                 {apaga dos em aberto}
        with (DMRecCheqDev.qBaixaCheque) do
        begin
          parambyname('ccgc').AsString   := ccgc;
          parambyname('banco').AsFloat   := strtofloat(banco);
          parambyname('numero').AsFloat  := strtofloat(numero);
          ExecSql;
        end;
      end;
      desconect;
      Free;
    end;
    QuitaChequeDev:=true;
  except
    QuitaChequeDev:=false;
  end;
end;

{Quita um cheque pre-datado pela chave (banco+numero)}
function QuitaChequePre (ccgc,banco,numero: String):Boolean;
var
  clCheq: TClassCheque;
  clCheqPg: TClassChequePg;
begin
  try
    clCheq := TClassCheque.Create;
    with (clCheq) do
    begin
      conect   ('CREDITO', frm_principal);
      ClearSql;
      AddParam ('Select CH_CCGC,CH_CLIE,CH_NUME,CH_DTCT,CH_NOME,          ');
      AddParam ('       CH_FONE,CH_LOJA,CH_DVTO,CH_PORT,CH_BANC,          ');
      AddParam ('       CH_AGEN,CH_DTRA,CH_TRAN,CH_VALO,CH_OBS            ');
      AddParam ('From   CRECHMOV                                          ');
      AddParam ('Where  (CH_BANC='+banco+') AND (CH_NUME='+numero+') AND  ');
      AddParam ('       (CH_CCGC='+chr(39)+ccgc+chr(39)+')                ');
      if (Execute) then
      begin
        clCheqPg := TClassChequePg.Create;
        with (clCheqPg) do
        begin
          conect ('CREDITO',frm_principal);
          ClearFields;
          inCH_CLIE := clCheq.Result('CH_CLIE');
          inCH_NUME := clCheq.Result('CH_NUME');
          inCH_DTCT := clCheq.Result('CH_DTCT');
          inCH_CCGC := clCheq.Result('CH_CCGC');
          inCH_NOME := clCheq.Result('CH_NOME');
          inCH_FONE := clCheq.Result('CH_FONE');
          inCH_LOJA := clCheq.Result('CH_LOJA');
          inCH_DVTO := clCheq.Result('CH_DVTO');
          inCH_DTPG := clCheq.Result('CH_DVTO'); {* no vencimento}
          inCH_PORT := clCheq.Result('CH_PORT');
          inCH_BANC := clCheq.Result('CH_BANC');
          inCH_AGEN := clCheq.Result('CH_AGEN');
          inCH_VALO := clCheq.Result('CH_VALO');
          inCH_OBS  := clCheq.Result('CH_OBS');
          inCH_TIME := frm_principal.x_data_trabalho;
          inCH_STAT := '1';
          inCH_DTRA := clCheq.Result('CH_DTRA');
          inCH_TRAN := clCheq.Result('CH_TRAN');
          Insert;
          desconect;
          Free;
        end;

                 {apagando o cheque dos em aberto}
        with (DMBaixAutCheq.qBaixaCheque) do
        begin
          parambyname('ccgc').AsString   := clCheq.Result('CH_CCGC');
          parambyname('banco').AsFloat   := clCheq.Result('CH_BANC');
          parambyname('numero').AsFloat  := clCheq.Result('CH_NUME');
          ExecSql;
        end;
      end;
      desconect;
      Free;
    end;
    QuitaChequePre:=true;
  except
    QuitaChequePre:=false;
  end;
end;

{Quita um cheque pre-datado pela chave (banco+numero)}
function QuitaChequePre1 (ccgc,banco,numero: String; data: TDateTime;valor:Real):Boolean;
var
  clCheq: TClassCheque;
  clCheqPg: TClassChequePg;
begin
  try
    clCheq := TClassCheque.Create;
    with (clCheq) do
    begin
      conect   ('CREDITO', frm_principal);
      ClearSql;
      AddParam ('Select CH_CCGC,CH_CLIE,CH_NUME,CH_DTCT,CH_NOME,          ');
      AddParam ('       CH_FONE,CH_LOJA,CH_DVTO,CH_PORT,CH_BANC,          ');
      AddParam ('       CH_AGEN,CH_DTRA,CH_TRAN,CH_VALO,CH_OBS            ');
      AddParam ('From   CRECHMOV                                          ');
      AddParam ('Where  (CH_BANC='+banco+') AND (CH_NUME='+numero+') AND  ');
      AddParam ('       (CH_CCGC='+chr(39)+ccgc+chr(39)+')                ');
      if (Execute) then
      begin
        clCheqPg := TClassChequePg.Create;
        with (clCheqPg) do
        begin
          conect ('CREDITO',frm_principal);
          ClearFields;
          inCH_CLIE := clCheq.Result('CH_CLIE');
          inCH_NUME := clCheq.Result('CH_NUME');
          inCH_DTCT := clCheq.Result('CH_DTCT');
          inCH_CCGC := clCheq.Result('CH_CCGC');
          inCH_NOME := clCheq.Result('CH_NOME');
          inCH_FONE := clCheq.Result('CH_FONE');
          inCH_LOJA := clCheq.Result('CH_LOJA');
          inCH_DVTO := clCheq.Result('CH_DVTO');
          inCH_DTPG := data; {* no vencimento}
          inCH_PORT := clCheq.Result('CH_PORT');
          inCH_BANC := clCheq.Result('CH_BANC');
          inCH_AGEN := clCheq.Result('CH_AGEN');
          inCH_VALO := clCheq.Result('CH_VALO');
          inCH_OBS  := clCheq.Result('CH_OBS');
          inCH_TIME := frm_principal.x_data_trabalho;
          inCH_STAT := '1';
          inCH_DTRA := clCheq.Result('CH_DTRA');
          inCH_TRAN := clCheq.Result('CH_TRAN');
          Insert;
          desconect;
          Free;
        end;

                 {apagando o cheque dos em aberto}
        with (DMBaixAutCheq.qBaixaCheque) do
        begin
          parambyname('ccgc').AsString   := clCheq.Result('CH_CCGC');
          parambyname('banco').AsFloat   := clCheq.Result('CH_BANC');
          parambyname('numero').AsFloat  := clCheq.Result('CH_NUME');
          ExecSql;
        end;
      end;
      desconect;
      Free;
    end;
    QuitaChequePre1:=true;
  except
    QuitaChequePre1:=false;
  end;
end;

procedure AuditaOperacao(codigoocorrencia,codigoUsuario: Real; nomeUsuario,complemento: String);
var
  descricao_codigoocorrencia: String;
  clAux: TClassAuxiliar;
  hora : TDateTime;
begin
  if (codigoocorrencia=1) then
    descricao_codigoocorrencia := 'ALT. DE PRECO DE VENDA PRINCIPAL'
  else if (codigoocorrencia=2) then
    descricao_codigoocorrencia := 'ALT. DO ULTIMO PRECO DE CUSTO'
  else if (codigoocorrencia=3) then
    descricao_codigoocorrencia := 'ALT. DO ULTIMO PRECO DE AQUISIC.'
  else if (codigoocorrencia=4) then
    descricao_codigoocorrencia := 'OUTRAS ENTRADAS'
  else if (codigoocorrencia=5) then
    descricao_codigoocorrencia := 'OUTRAS SAIDAS'
  else if (codigoocorrencia=6) then
    descricao_codigoocorrencia := 'ALT. DE PRECO DE VENDA DIFERENCIADO'
  else if (codigoocorrencia=7) then
    descricao_codigoocorrencia := 'EXC. DE REGISTRO DE MOVIMENTO'
  else if (codigoocorrencia=8) then
    descricao_codigoocorrencia := 'EXC. DE PRECO DE VENDA DIFERENCIADO'
  else if (codigoocorrencia=9) then
    descricao_codigoocorrencia := 'EXC. DE PRECO PROMOCIONAL'
  else if (codigoocorrencia=10) then
    descricao_codigoocorrencia := 'REAJUSTE DE PRECOS DE VENDA'
  else if (codigoocorrencia=11) then
    descricao_codigoocorrencia := 'ALT. AUTOM. DE PRECO DIFERENCIADO'
  else if (codigoocorrencia=12) then
    descricao_codigoocorrencia := 'ALT. DE PRODUTOS'
  else if (codigoocorrencia=13) then
    descricao_codigoocorrencia := 'ALT. DE ITENS DE PRODUTOS'
  else if (codigoocorrencia=14) then
    descricao_codigoocorrencia := 'CADASTRO DE CREDIÁRIO'
  else if (codigoocorrencia=15) then
    descricao_codigoocorrencia := 'EXCLUSÃO DE CREDIÁRIO'
  else if (codigoocorrencia=16) then
    descricao_codigoocorrencia := 'ALTERAÇÃO DE CREDIÁRIO'
  else
    descricao_codigoocorrencia := '...OCORRENCIA NAO DEFINIDA';

  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO AUDITORIA_SIMPLES                                                             ');
  clAux.AddParam (' (HORA,DATA,USUARIO,NOMEUSUARIO,CODIGOOCORRENCIA,DESCOCORRENCIA,COMPLEMENTO)              ');
  clAux.AddParam ('VALUES                                                                                    ');
  clAux.AddParam (' (:HORA,:DATA,:USUARIO,:NOMEUSUARIO,:CODIGOOCORRENCIA,:DESCOCORRENCIA,:COMPLEMENTO)       ');

  clAux.consulta.parambyname('HORA').AsString            := FormatDateTime('hhmmss',time);
  clAux.consulta.parambyname('DATA').AsDateTime          := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('USUARIO').AsFloat          := codigoUsuario;
  clAux.consulta.parambyname('NOMEUSUARIO').AsString     := nomeUsuario;   
  clAux.consulta.parambyname('CODIGOOCORRENCIA').AsFloat := codigoocorrencia;
  clAux.consulta.parambyname('DESCOCORRENCIA').AsString  := descricao_codigoocorrencia;
  clAux.consulta.parambyname('COMPLEMENTO').AsString     := complemento;
  clAux.Execute;
  clAux.Desconect;
  clAux.Free;
end;

end.
