
//SE PORTA=COM1, USA-SE 'SENDIF.EXE' - SE PORTA=COM2, USA-SE 'SENDIF2.EXE'
unit dataregis;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus, Buttons, ExtCtrls, ComCtrls, Printers,
  Spin, fileCtrl,funcoesglobais,db,dbtables;


type

  TDadosItemDataRegis = record
    CodigoDescricao:String;
    Indice:String;
    Qtde:String;
    Valor:String;
    PercDesconto:String;
  end;

var
  FDadosItemDataRegis:TDadosItemDataRegis;
  AliquotasDataRegis:array of Real;
  fcomando:String;
  FListFpDataReg:TStringList;

//rotinas auxiliares
procedure DATAREGISEFC_EnviaComandoSENDIF(arquivocomando: String); //USANDO O UTILITARIO 'SENDIF.EXE'
function  DATAREGISEFC_RetornaEstadoInterno(Codigo: String):String;
function  DATAREGISEFC_RetornaErro(Codigo: String):String;

//comandos
procedure DATAREGISEFC_LeituraX(Serial,CortaPapel: String);
procedure DATAREGISEFC_ReducaoZ(CortaPapel: String);
procedure DATAREGISEFC_RelatorioGerencial(Descricao: String);
procedure DATAREGISEFC_LeituraMemoriaFiscal(Serial,DataInicial,DataFinal: String);
procedure DATAREGISEFC_LeituraMemoriaFiscalPorReducao(Serial,ReducaoInicial,ReducaoFinal: String);
procedure DATAREGISEFC_CancelaUltimoCupom;
procedure DATAREGISEFC_FinalizaCupom(Descricao,Valor: String;CODIGO:String='');
procedure DATAREGISEFC_ItemVendido(CodigoDescricao,Indice,Qtde,Valor,PercDesconto: String;deletadatareg:Boolean=false);
function  DATAREGISEFC_LeStatus(ParametroRetornado: Integer):String;
function  DATAREGISEFC_RetornaNumeroUltimoCupom(DataInicial,DataFinal: String):String;
function  DATAREGISEFC_CancelaItem(var VList:TStringList;Int:Integer):String;
function  DATAREGISEFC_TributosLe:Boolean;
function  DATAREGISEFC_TributosGrava(Valor:Real):Boolean;
procedure DATAREGISEFC_CancelaCupomAberto;
procedure CarregaAliquotasDataRegis;

implementation

uses principal;

var
  OldTimeDataReg:Cardinal;

{***************************************************************************************}
procedure DATAREGISEFC_EnviaComandoSENDIF(arquivocomando: String);
var
  nomeSendif: String;
  i,result: Integer;
  flista:TStringList;
  fstart:Cardinal;
begin
     {******************************************************************************************}
  if (frm_principal.x_ecf_porta_comunicacao='COM1') then //COM1
    nomeSendif:='SENDIF.EXE'
  else
    nomeSendif:='SENDIF2.EXE';//COM2,COM3,COM4,etc...
     {******************************************************************************************}


{     flista := TStringList.create;
     With FLista do
      try
        loadfromfile(arquivocomando);
        for i:=0 to Count - 1 do
         Frm_Principal.PortaSerial.SendData(PChar(Strings[i]+Chr(13)),Length(PChar(Strings[i]+Chr(13))));
      finally
        destroy;
      end;




     exit;}
  FStart := GetTickCount;
  if (frm_principal.x_tempointervecf > 0) and (oldtimedatareg > 0) and (OldTimeDataReg + frm_principal.x_tempointervecf * 1000 > Fstart) then
    delay(Round(OldTimeDataReg + (frm_principal.x_tempointervecf  * 1000) - FStart ));


  result := WinExec (Pchar(frm_principal.x_pathsystem+'\'+nomeSendif+' '+
    arquivocomando                           +' '+
    'c:\nativa\vendas\RESPIF.TXT'),
    SW_SHOW{SW_SHOWMINIMIZED});
  OldTimeDataReg := GetTickCount;
  if (result=0) then
    showmessage ('O sistema está sem memória! Tente fechar alguns aplicativos...');
  if (result=ERROR_BAD_FORMAT) then
    showmessage ('O arquivo '+nomeSendif+' é inválido!');
  if (result=ERROR_FILE_NOT_FOUND) then
    showmessage('O programa '+nomeSendif+' não foi encontrado!');
  if (result=ERROR_PATH_NOT_FOUND) then
    showmessage('O caminho especificado é inválido!');
end;

function  DATAREGISEFC_RetornaErro(Codigo: String):String;
begin
  if (Codigo='K') then
    result:='SEM ERRO'
  else
  if (Codigo='F') then
    result:='ERRO NAS VARIAVEIS FISCAIS - ERRO FISCAL'
  else
  if (Codigo='T') then
    result:='NUMERO/INDICE DE TRIBUTOS ERRADO'
  else
  if (Codigo='M') then
    result:='ERRO NA MEMORIA FISCAL(leitura)'
  else
  if (Codigo='m') then
    result:='ERRO NA MEMORIA FISCAL(gravacao)'
  else
  if (Codigo='f') then
    result:='CUPOM EM FASE DE INICIALIZACAO'
  else
  if (Codigo='C') then
    result:='COMANDO NAO EXECUTADO - COM/SEM TECNICO'
  else
  if (Codigo='N') then
    result:='ESTADO INVALIDO'
  else
  if (Codigo='c') then
    result:='CANCELAMENTO ACIMA DO LIMITE'
  else
  if (Codigo='v') then
    result:='CANCELAMENTO DE VENDA COM VALOR 0'
  else
  if (Codigo='i') then
    result:='DADOS DO COMANDO INVALIDOS'
  else
  if (Codigo='I') then
    result:='COMANDO INVALIDO'
  else
  if (Codigo='A') then
    result:='COMANDO FORA DE SEQUENCIA'
  else
  if (Codigo='B') then
    result:='BUFFER DE IMPRESSAO CHEIO'
  else
  if (Codigo='Z') then
    result:='REDUCAO JA REALIZADA HOJE'
  else
  if (Codigo='R') then
    result:='REDUCAO FORCADA'
  else
  if (Codigo='E') then
    result:='ERRO NA EPROM FISCAL'
  else
  if (Codigo='t') then
    result:='ERRO STRING TOTAL ENCONTRADO';
end;

function DATAREGISEFC_RetornaEstadoInterno(Codigo: String):String;
begin
  if (Codigo='L') then
    result:='LIVRE'
  else
  if (Codigo='V') then
    result:='VENDA'
  else
  if (Codigo='F') then
    result:='FINALIZACAO'
  else
  if (Codigo='N') then
    result:='NOTA FISCAL'
  else
  if (Codigo='R') then
    result:='RELATORIO PERSONALIZADO'
  else
  if (Codigo='S') then
    result:='RELATORIO EM FOLHA SOLTA'
  else
  if (Codigo='O') then
    result:='REDUCAO OBRIGADA';
end;

{***************************************************************************************}

{// Leitura X: Parametros: Serial(S/N) / Corta/Papel: (S/N)}
{***************************************************************************************}
procedure DATAREGISEFC_LeituraX(Serial,CortaPapel: String);
var
  arq: textfile;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    fcomando := 'G'+
      Copy(trim(Serial),1,1)+
      Copy(trim(CortaPapel),1,1);

    Writeln   (arq,'G'+
      Copy(trim(Serial),1,1)+
      Copy(trim(CortaPapel),1,1));
            {.............................................}
    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
  finally
//            CloseFile (arq);
  end;
end;

{***************************************************************************************}

{// Reducao Z: Parametros: Corta/Papel: (S/N)}
{***************************************************************************************}
procedure DATAREGISEFC_ReducaoZ(CortaPapel: String);
var
  arq: textfile;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    Writeln   (arq,'H'+
      Copy(trim(CortaPapel),1,1));
            {.............................................}
    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
  finally
  end;
end;

{***************************************************************************************}

{// Leitura Memoria Fiscal: Parametros: Serial(S/N),DataInicial:ddmmaa,DataFinal:ddmmaa}
{se aa<80, é o ano 20aa, senao 19aa}
{***************************************************************************************}
procedure DATAREGISEFC_LeituraMemoriaFiscal(Serial,DataInicial,DataFinal: String);
var
  arq: textfile;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    Writeln   (arq,'I'+
      Copy(trim(Serial),1,1)+
      Copy(trim(DataInicial),1,6)+
      Copy(trim(DataFinal),1,6));
            {.............................................}
    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
  finally
  end;
end;

{***************************************************************************************}

{// Leitura Memoria Fiscal Por Reducao: Parametros: Serial(S/N),ReducaoInicial:ddmmaa,ReducaoFinal:ddmmaa}
{***************************************************************************************}
procedure DATAREGISEFC_LeituraMemoriaFiscalPorReducao(Serial,ReducaoInicial,ReducaoFinal: String);
var
  arq: textfile;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    Writeln   (arq,'i'+
      Copy(trim(Serial),1,1)+
      Copy(trim(ReducaoInicial),1,4)+
      Copy(trim(ReducaoFinal),1,4));
            {.............................................}
    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
  finally
  end;
end;

{***************************************************************************************}

{// Cancela ultimo campo - SEM parametros}
{***************************************************************************************}
procedure DATAREGISEFC_CancelaUltimoCupom;
var
  arq: textfile;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    Writeln   (arq,'F');
            {.............................................}
    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
  finally
  end;
end;

{***************************************************************************************}

{// Finaliza o CUPOM informando as formas de pagamento - Descricao: tam 20, Valor: tam 14}
{***************************************************************************************}
{- ATENCAO: Falta acertar a sequencia!}
{***************************************************************************************}
procedure DATAREGISEFC_FinalizaCupom(Descricao,Valor: String;Codigo:String='');
var
  arq: textfile;
  ffpag:String;
  i,ind :Integer;

begin
  try

    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            
    if Trim(Frm_principal.X_FormasPagamentoEcf) <> '' then
    begin
      with separastring(Frm_principal.X_FormasPagamentoEcf,';') do
        try
          for i:=0 to Count - 1 do
            with SeparaString(Strings[i]) do
              try
                if StrtoFloatN(Strings[0]) = StrtoFloatN(codigo) then
                begin
                  Writeln   (arq,'D'+
                    formatfloat('00',strtofloatn(Strings[1]))+
                    '00000000000000000000'+
                    Copy(Valor,1,14));
                  Break;
                end;
              finally
                Destroy;
              end;
        finally
          destroy;
        end;
    end
    else
    if (trim(Descricao)='DINHEIRO') then
      Writeln   (arq,'D'+
        '01'+
        '00000000000000000000'+
        Copy(Valor,1,14))
    else
    if (trim(Descricao)='CHEQUE A VISTA') then
      Writeln   (arq,'D'+
        '02'+
        '00000000000000000000'+
        Copy(Valor,1,14))
    else
    if (trim(Descricao)='CARTAO') then
      Writeln   (arq,'D'+
        '03'+
        '00000000000000000000'+
        Copy(Valor,1,14))
    else
    if (trim(Descricao)='DEBITO AUTOMATICO') then
      Writeln   (arq,'D'+
        '01'+
        '00000000000000000000'+
        Copy(Valor,1,14))
    else
    if (trim(Descricao)='CREDIARIO') then
      Writeln   (arq,'D'+
        '01'+
        '00000000000000000000'+
        Copy(Valor,1,14));
            {.............................................}


    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');

          { if FListFpDataReg = nil then
             FListFpDataReg := TStringList.Create;

            FListFpDataReg.LoadFromFile('C:\NATIVA\VENDAS\DATAREGI.TXT');
            if (trim(Descricao)='DINHEIRO') then
            begin
                FListFpDataReg.Add   ('D'+
                               '01'+
                               '00000000000000000000'+
                               Copy(Valor,1,14));
            end
            else if (trim(Descricao)='CHEQUE A VISTA') then
            begin
                FListFpDataReg.Add   ('D'+
                               '02'+
                               '00000000000000000000'+
                               Copy(Valor,1,14));
            end
            else if (trim(Descricao)='CARTAO') then
            begin
                FListFpDataReg.Add   ('D'+
                               '03'+
                               '00000000000000000000'+
                               Copy(Valor,1,14));
            end
            else if (trim(Descricao)='DEBITO AUTOMATICO') then
            begin
                FListFpDataReg.Add   ('D'+
                               '04'+
                               '00000000000000000000'+
                               Copy(Valor,1,14));
            end
            else if (trim(Descricao)='CREDIARIO') then
            begin
                FListFpDataReg.Add   ('D'+
                               '05'+
                               '00000000000000000000'+
                               Copy(Valor,1,14));
            end;
            FListFpDataReg.SavetoFile('C:\NATIVA\VENDAS\DATAREGI.TXT');}
  finally
  end;
end;

{***************************************************************************************}

{//Realiza o lancamento de uma venda: CodigoDescricao: tam 36,Indice: tam 2,}
{Qtde: tam 6, Valor: tam 9, PercDesconto: tam 4}
{***************************************************************************************}
procedure DATAREGISEFC_ItemVendido(CodigoDescricao,Indice,Qtde,Valor,PercDesconto: String;deletadatareg:Boolean=false);
var
  arq: textfile;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    Writeln   (arq,iifs(not DeletaDataReg,'A','b')+
      Copy(CodigoDescricao,1,36)+
      Copy(Indice,1,2)+
      Copy(Qtde,1,6)+
      Copy(Valor,1,9)+
      Copy(PercDesconto,1,4));

    if not deletadatareg then
    begin
      FDadosItemDataRegis.CodigoDescricao := Copy(CodigoDescricao,1,36);
      FDadosItemDataRegis.Indice := Copy(Indice,1,2);
      FDadosItemDataRegis.Qtde := Copy(Qtde,1,6);
      FDadosItemDataRegis.Valor := Copy(Valor,1,9);
      FDadosItemDataRegis.PercDesconto := Copy(PercDesconto,1,4);
    end;

            {.............................................}
    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
  finally
  end;
end;

{***************************************************************************************}

{//Retorna o parametro solicitado na leitura do Status da impressora - ParametroRetornado: 1,2,3,4,5}
{***************************************************************************************}
function  DATAREGISEFC_LeStatus(ParametroRetornado: Integer):String;
var
  arq: textfile;
  linha: String;
  EstadoInterno,ImpressoraPronta: String;
  TemTecnico,GavetaAberta,Erro: String;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    Writeln   (arq,'R');
            {.............................................}
    CloseFile (arq);
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
  finally
  end;
     {...............................}
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\RESPIF.TXT');
    Reset     (arq);
            {.............................................}
    Readln    (arq,linha);
    EstadoInterno    := Copy(linha,1,1);
    ImpressoraPronta := Copy(linha,2,1);
    TemTecnico       := Copy(linha,3,1);
    GavetaAberta     := Copy(linha,4,1);
    Erro             := Copy(linha,5,1);
    if (ParametroRetornado=1) then
      result :=EstadoInterno
    else
    if (ParametroRetornado=2) then
      result :=ImpressoraPronta
    else
    if (ParametroRetornado=3) then
      result :=TemTecnico
    else
    if (ParametroRetornado=4) then
      result :=GavetaAberta
    else
    if (ParametroRetornado=5) then
      result :=Erro;
  finally
    CloseFile (arq);
  end;
     {...............................}
end;

{***************************************************************************************}

{//Retorna o codigo do ultimo COO utilizado pela impressora - para fins de VENDA e gravacao externa}
{***************************************************************************************}
function  DATAREGISEFC_RetornaNumeroUltimoCupom(DataInicial,DataFinal: String):String;
var
  arq: textfile;
  linha,SequencialFinal: String;
begin
  DATAREGISEFC_LeituraMemoriaFiscal('S',DataInicial,DataFinal); //serial
     {...............................}
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\RESPIF.TXT');
    Reset     (arq);
            {.............................................}
    Readln    (arq,linha);
    SequencialFinal := Copy(linha,25,6);
    result := SequencialFinal;
    CloseFile (arq);
  finally
  end;
     {...............................}
end;

{***************************************************************************************}

{//Relatorio Gerencial - Parametro: Descricao (40 caracs.)}
{***************************************************************************************}
procedure DATAREGISEFC_RelatorioGerencial(Descricao: String);
var
  arq: textfile;
begin
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
            {.............................................}
    Writeln   (arq,'j'+
      Copy(Descricao,1,40));
            {.............................................}
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
    CloseFile (arq);
  finally
  end;
end;

{***************************************************************************************}

function  DATAREGISEFC_CancelaItem(var VList:TStringList;Int:Integer):String;
var
  FValue:String;
  ARQ:TEXTFILE;
begin
{     if int - 1 >= VList.Count Then
      exit;


     FValue := Copy(VList[Int - 1],pos('*',VList[Int - 1]) + 1,Length(VList[Int - 1]));


     DATAREGISEFC_ItemVendido(Copy(FValue,1,36)
                              ,Copy(FValue,37,2)
                              ,Copy(FValue,39,6)
                              ,Copy(FValue,45,9)
                              ,Copy(FValue,54,4)
                              ,True);}

     // no momento só da pra cancelar o ultimo item vendido
  Result := '';
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
    Writeln   (arq,'B');
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
    CloseFile (arq);
  finally
  end;

end;


function  DATAREGISEFC_TributosLe:Boolean;
var
  i:Integer;
  arq: textfile;
begin
  Result := true;
  try
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
    Writeln   (arq,'p');
    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
    CloseFile (arq);
  finally
  end;
end;


procedure CarregaAliquotasDataRegis;
var
  FList:TStringList;
  i:Integer;
begin
  if Length(AliquotasDataRegis) > 0 then
    exit;

  DATAREGISEFC_TributosLe;
  FList := TStringList.Create;
  try
    Flist.LoadFromFile('C:\NATIVA\VENDAS\RESPIF.TXT');
    for i:=0 to Flist.Count - 1 do
      if Copy(FList[i],1,1) = 'T' then
      begin
        SetLength(AliquotasDataRegis,Length(AliquotasDataRegis) + 1);
        AliquotasDataRegis[Length(AliquotasDataRegis) - 1] :=
          StrtoFloatN(Copy(FList[i],2,4))/100;
      end;
  finally
    FList.Destroy;
  end;


end;

function  DATAREGISEFC_TributosGrava(Valor:Real):Boolean;
var
  Arq:TextFile;
begin
  Result := true;
  try
    CarregaAliquotasDataRegis;
    AssignFile(arq,'C:\NATIVA\VENDAS\DATAREGI.TXT');
    Rewrite   (arq);
    Writeln   (arq,'Z'+formatfloat('00',Length(AliquotasDataRegis) + 6)+
      'T'+copy(FormatFloat('0000',Valor),1,4)
      );

    SetLength(AliquotasDataRegis,Length(AliquotasDataRegis) + 1);
    AliquotasDataRegis[Length(AliquotasDataRegis) - 1] := Valor;

    DATAREGISEFC_EnviaComandoSENDIF('C:\NATIVA\VENDAS\DATAREGI.TXT');
    CloseFile (arq);
  finally
  end;
end;

procedure DATAREGISEFC_CancelaCupomAberto;
var
  arq: textfile;
  vvalor:Real;
begin
{    With TQuery.Create(Application) do
     try
       databasename := 'VENDAS';
       Sql.Add ('SELECT VE_TOTA FROM VENDAS_LOCAL                     ');
       Sql.Add ('WHERE (VE_LOJA=:loja) AND                      ');
       Sql.Add ('      (VE_CAIX=:caixa) AND                     ');
       Sql.Add ('      (VE_CODI=:codigo_venda)                  ');
       parambyname('loja').AsFloat         := frm_principal.x_loja;
       parambyname('caixa').AsFloat        := frm_principal.x_terminal;
       parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
       open;

       vvalor := iifs(Eof,10000,FieldByName('VE_TOTA').AsFloat);
     finally
      destroy;
     end;}

  DATAREGISEFC_FinalizaCupom(padl('DINHEIRO',20,' '),formatfloat(StringofChar('0',12),0)+'00','1');
  delay(round(frm_principal.x_tempointervecf * 2000));
  DATAREGISEFC_CancelaUltimoCupom;
end;

begin
  FDadosItemDataRegis.CodigoDescricao := '';
  OldTimeDataReg := 0;
end.
