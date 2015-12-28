unit Urano2;

interface

uses Dialogs, SysUtils;

function URANOEFC_1EFC_Inicializa(sPorta: Pchar):Integer;
function URANOEFC_1EFC_Finaliza:Integer;
function URANOEFC_1EFC_ImprimeCabecalho:Integer;
function URANOEFC_1EFC_VendaItem(Codigo,Descricao,Quantidade,ValorUnitario,Taxa,Unidade,Tipo: Pchar):Integer;
function URANOEFC_1EFC_FormaPagamento(Forma,Descricao: Pchar):Integer;
function URANOEFC_1EFC_Relatorio_XZ  (Operacao: Pchar):Integer;
function URANOEFC_1EFC_FinalizaRelatorio (Operador: Pchar):Integer;
function URANOEFC_1EFC_Pagamento (Forma,Descricao,Valor,Acumular: Pchar):Integer;
function URANOEFC_1EFC_FechaCupom (Operador: Pchar):Integer;
function URANOEFC_1EFC_CargaAliquota  (Aliquota,Valor: Pchar):Integer;
function URANOEFC_1EFC_EstadoImpressora  :String;
function URANOEFC_1EFC_CodigoEstadoImpressora  :Integer;
function URANOEFC_1EFC_LeRegistrador(NumeroRegistrador: Pchar):String;
function URANOEFC_1EFC_CancelaVenda (Operador: Pchar):Integer;
function URANOEFC_1EFC_DescontoSubtotal (Operacao,Descricao,Valor: Pchar):Integer;
function URANOEFC_1EFC_AvancaLinhas (nLinhas: Pchar):Integer;
function URANEFC_LeituraMF (tipo,inicio,fim,arquivo: Pchar):Integer;

implementation

var
  ERRO_URANO_GERAL: array[1..33] of String;
  STATUS_URANO: array[1..127] of String;

//Funcoes da URANO, localizadas na extensão 'DLL1EFC3.DLL'
function InicializaDLL     (sPorta: Pchar): Integer;  stdcall; external 'DLL1EFC3.DLL';
function FinalizaDLL       :Integer; stdcall; external 'DLL1EFC3.DLL';
function ImprimeCabecalho  :Integer; stdcall; external 'DLL1EFC3.DLL';
function VendaItem         (Codigo,Descricao,Quantidade,ValorUnitario,Taxa,Unidade,Tipo: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function FormaPagamento    (Forma,Descricao: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function DescontoSubtotal  (Operacao,Descricao,Valor: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function Relatorio_XZ      (Operacao: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function FinalizaRelatorio (Operador: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function Pagamento         (Forma,Descricao,Valor,Acumular: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function FechaCupom        (Operador: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function CargaAliquota     (Aliquota,Valor: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function EstadoImpressora  :Integer; stdcall; external 'DLL1EFC3.DLL';
function LeRegistrador     (NumeroRegistrador,Valor: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function CancelaVenda      (Operador: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function AvancaLinhas      (nLinhas: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function LeituraMF         (tipo,inicio,fim,arquivo: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';

function URANOEFC_1EFC_Inicializa(sPorta: Pchar):Integer;
begin
  ERRO_URANO_GERAL[01] := 'DLL já inicializada';
  ERRO_URANO_GERAL[02] := 'DLL não inicializada';
  ERRO_URANO_GERAL[03] := 'Falha no acesso a porta serial';
  ERRO_URANO_GERAL[04] := 'Falha na configuração da porta serial';
  ERRO_URANO_GERAL[05] := 'Porta serial não inicializada';
  ERRO_URANO_GERAL[06] := 'Falha na transmissão: outra transmissão em andamento.';
  ERRO_URANO_GERAL[07] := 'Tamanho do comando muito grande para a DLL';
  ERRO_URANO_GERAL[08] := 'Impressora fora de linha, desligada ou desconectada.';
  ERRO_URANO_GERAL[09] := 'Falha geral na transmissão do comando.';
  ERRO_URANO_GERAL[10] := 'Timeout na recepção da resposta da impressora.';
  ERRO_URANO_GERAL[11] := 'Falha geral na recepção da resposta.';
  ERRO_URANO_GERAL[12] := 'Falha no acesso aos buffers internos da porta serial';
  ERRO_URANO_GERAL[13] := 'Erro de frame na comunicação';
  ERRO_URANO_GERAL[14] := 'Erro de overrun na comunicação';
  ERRO_URANO_GERAL[15] := 'Break detectado na comunicação';
  ERRO_URANO_GERAL[16] := 'Erro de acesso a porta serial durante a recepção';
  ERRO_URANO_GERAL[17] := 'Tamanho do buffer de recepção da porta serial insuficiente para recepção dos dados.';
  ERRO_URANO_GERAL[18] := 'Erro de paridade na comunicação';
  ERRO_URANO_GERAL[19] := 'Tamanho do buffer de transmissão da porta serial insuficiente para comunicação.';
  ERRO_URANO_GERAL[20] := 'Falha no acesso ao arquivo de configuração de cheques';
  ERRO_URANO_GERAL[21] := 'Banco inexistente';
  ERRO_URANO_GERAL[22] := 'Coordenada(s) do campo Valor inválida(s).';
  ERRO_URANO_GERAL[23] := 'Coordenada(s) do campo Extenso inválida(s).';
  ERRO_URANO_GERAL[24] := 'Coordenada(s) do campo Favorecido inválida(s).';
  ERRO_URANO_GERAL[25] := 'Coordenada(s) do campo Cidade inválida(s).';
  ERRO_URANO_GERAL[26] := 'Coordenada(s) do campo Mensagem inválida(s).';
  ERRO_URANO_GERAL[27] := 'Coordenada(s) do campo Data inválida(s).';
  ERRO_URANO_GERAL[28] := 'Valor do campo Espaçamento inválido.';
  ERRO_URANO_GERAL[29] := 'Erro interno na comunicação com a impressora.';
  ERRO_URANO_GERAL[33] := 'Comando executado com sucesso.';

  STATUS_URANO[50]     := 'Esperando fechamento do dia.';
  STATUS_URANO[117]    := 'Intervenção técnica.';
  STATUS_URANO[118]    := 'Em período de venda.';
  STATUS_URANO[119]    := 'Em venda de item.';
  STATUS_URANO[120]    := 'Em pagamento.';
  STATUS_URANO[121]    := 'Em comercial.';
  STATUS_URANO[124]    := 'Dia fechado.';
  STATUS_URANO[125]    := 'Em não vinculado.';
  STATUS_URANO[126]    := 'Em relatório gerencial.';
  STATUS_URANO[127]    := 'Em documento vinculado.';
     
  result := InicializaDLL(sPorta);
  if (result=33) or //comando efetuado com sucesso
    (result=1)     //DLL ja inicializada
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_Finaliza:Integer;
begin
  result := FinalizaDLL;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_ImprimeCabecalho:Integer;
begin
  result := ImprimeCabecalho;
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_VendaItem(Codigo,Descricao,Quantidade,ValorUnitario,Taxa,Unidade,Tipo: Pchar):Integer;
begin
  result := VendaItem(Codigo,Descricao,Quantidade,ValorUnitario,Taxa,Unidade,Tipo);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_FormaPagamento(Forma,Descricao: Pchar):Integer;
begin
  result := FormaPagamento(Forma,Descricao);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_DescontoSubtotal(Operacao,Descricao,Valor: Pchar):Integer;
begin
  result := DescontoSubtotal(Operacao,Descricao,Valor);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_Relatorio_XZ  (Operacao: Pchar):Integer;
begin
  result := Relatorio_XZ(Operacao);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_FinalizaRelatorio (Operador: Pchar):Integer;
begin
  result := FinalizaRelatorio(Operador);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_Pagamento (Forma,Descricao,Valor,Acumular: Pchar):Integer;
begin
  result := Pagamento (Forma,Descricao,Valor,Acumular);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_FechaCupom (Operador: Pchar):Integer;
begin
  result := FechaCupom(Operador);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_CargaAliquota  (Aliquota,Valor: Pchar):Integer;
begin
  result := CargaAliquota(Aliquota,Valor);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_EstadoImpressora  :String;
var
  i: Integer;
begin
  i := EstadoImpressora;
  result := STATUS_URANO[i];
end;

function URANOEFC_1EFC_CodigoEstadoImpressora  :Integer;
begin
  result := EstadoImpressora;
end;

function URANOEFC_1EFC_LeRegistrador(NumeroRegistrador: Pchar):String;
var
  ValorRegistrador: array[0..22] of Char; //string PRE-ALOCADA E TERMINADA EM NULO
  i: Integer;
begin
  ValorRegistrador := '                      '#0;
  i := LeRegistrador(NumeroRegistrador,ValorRegistrador);
  result := trim(ValorRegistrador);
  if (i=33) //comando executado com sucesso
  then
    i:=0;
  if (i<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [i]);
end;

function URANOEFC_1EFC_CancelaVenda (Operador: Pchar):Integer;
begin
  result := CancelaVenda(Operador);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANOEFC_1EFC_AvancaLinhas (nLinhas: Pchar):Integer;
begin
  result := AvancaLinhas(nLinhas);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

function URANEFC_LeituraMF (tipo,inicio,fim,arquivo: Pchar):Integer;
begin
  result := LeituraMF (tipo,inicio,fim,arquivo);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: '+ERRO_URANO_GERAL [result]);
end;

end.
