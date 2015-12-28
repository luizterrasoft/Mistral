unit Urano1efc;

interface

uses Dialogs, SysUtils,funcoesglobais;

var
  AliquotasUranoEcf1:array of Real;

function URANOEFC_1EFC_Inicializa(sPorta: Pchar):Integer;
function URANOEFC_1EFC_Finaliza:Integer;
function URANOEFC_1EFC_ImprimeCabecalho:Integer;
function URANOEFC_1EFC_VendaItem(Codigo,Descricao,Quantidade,ValorUnitario,Taxa,Unidade,Tipo: Pchar):Integer;
function URANOEFC_1EFC_FormaPagamento(Forma,Descricao: Pchar):Integer;
function URANOEFC_1EFC_Relatorio_XZ  (Operacao: Pchar):Integer;
function URANOEFC_1EFC_FinalizaRelatorio (Operador: Pchar):Integer;
function URANOEFC_1EFC_Pagamento (Forma,Descricao,Valor,Acumular: Pchar):Integer;
function URANOEFC_1EFC_FechaCupom (Operador: Pchar):Integer;
function URANOEFC_1EFC_LinhasLivres (Texto: Pchar):Integer;
function URANOEFC_1EFC_EmiteVinculado (COO,Sequencia: Pchar):Integer;
function URANOEFC_1EFC_CargaAliquota  (Aliquota,Valor: Pchar):Integer;
function URANOEFC_1EFC_EstadoImpressora  :String;
function URANOEFC_1EFC_CodigoEstadoImpressora  :Integer;
function URANOEFC_1EFC_LeRegistrador(NumeroRegistrador: Pchar):String;
function URANOEFC_1EFC_CancelaVenda (Operador: Pchar):Integer;
function URANOEFC_1EFC_CancelaCupom (Autorizacao,Operador: Pchar):Integer;
function URANOEFC_1EFC_DescontoSubtotal (Operacao,Descricao,Valor: Pchar):Integer;
function URANOEFC_1EFC_AvancaLinhas (nLinhas: Pchar):Integer;
function URANOEFC_1EFC_LeituraMF (tipo,inicio,fim,arquivo: Pchar):Integer;
function URANOEFC_1EFC_Propaganda (tipo,texto: Pchar):Integer;
function URANOEFC_1CancelaItem (Descricao,Transacao:Pchar):Integer;
function URANOEFC_1EFC_CarregaAliquota(Valor:Pchar):Integer;

procedure carregaaliquotasUranoEcf1;

implementation

var
  ERRO_URANO_1EFC_GERAL: array[1..33] of String;
  STATUS_URANO_1EFC: array[1..127] of String;

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
function LinhasLivres      (Texto: Pchar):Integer; stdcall; external 'DLL2EFC3.DLL';
function EmiteVinculado    (COO,Sequencia: Pchar):Integer; stdcall; external 'DLL2EFC3.DLL';
function CargaAliquota     (Aliquota,Valor: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function EstadoImpressora  :Integer; stdcall; external 'DLL1EFC3.DLL';
function LeRegistrador     (NumeroRegistrador,Valor: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function CancelaVenda      (Operador: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function CancelaCupom      (Autorizacao,Operador: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function CancelaItem       (Descricao,Transacao:Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function AvancaLinhas      (nLinhas: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function LeituraMF         (tipo,inicio,fim,arquivo: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';
function Propaganda        (tipo,texto: Pchar):Integer; stdcall; external 'DLL1EFC3.DLL';

function URANOEFC_1EFC_Inicializa(sPorta: Pchar):Integer;
begin
  ERRO_URANO_1EFC_GERAL[01] := 'DLL já inicializada';
  ERRO_URANO_1EFC_GERAL[02] := 'DLL não inicializada';
  ERRO_URANO_1EFC_GERAL[03] := 'Falha no acesso a porta serial';
  ERRO_URANO_1EFC_GERAL[04] := 'Falha na configuração da porta serial';
  ERRO_URANO_1EFC_GERAL[05] := 'Porta serial não inicializada';
  ERRO_URANO_1EFC_GERAL[06] := 'Falha na transmissão: outra transmissão em andamento.';
  ERRO_URANO_1EFC_GERAL[07] := 'Tamanho do comando muito grande para a DLL';
  ERRO_URANO_1EFC_GERAL[08] := 'Impressora fora de linha, desligada ou desconectada.';
  ERRO_URANO_1EFC_GERAL[09] := 'Falha geral na transmissão do comando.';
  ERRO_URANO_1EFC_GERAL[10] := 'Timeout na recepção da resposta da impressora.';
  ERRO_URANO_1EFC_GERAL[11] := 'Falha geral na recepção da resposta.';
  ERRO_URANO_1EFC_GERAL[12] := 'Falha no acesso aos buffers internos da porta serial';
  ERRO_URANO_1EFC_GERAL[13] := 'Erro de frame na comunicação';
  ERRO_URANO_1EFC_GERAL[14] := 'Erro de overrun na comunicação';
  ERRO_URANO_1EFC_GERAL[15] := 'Break detectado na comunicação';
  ERRO_URANO_1EFC_GERAL[16] := 'Erro de acesso a porta serial durante a recepção';
  ERRO_URANO_1EFC_GERAL[17] := 'Tamanho do buffer de recepção da porta serial insuficiente para recepção dos dados.';
  ERRO_URANO_1EFC_GERAL[18] := 'Erro de paridade na comunicação';
  ERRO_URANO_1EFC_GERAL[19] := 'Tamanho do buffer de transmissão da porta serial insuficiente para comunicação.';
  ERRO_URANO_1EFC_GERAL[20] := 'Falha no acesso ao arquivo de configuração de cheques';
  ERRO_URANO_1EFC_GERAL[21] := 'Banco inexistente';
  ERRO_URANO_1EFC_GERAL[22] := 'Coordenada(s) do campo Valor inválida(s).';
  ERRO_URANO_1EFC_GERAL[23] := 'Coordenada(s) do campo Extenso inválida(s).';
  ERRO_URANO_1EFC_GERAL[24] := 'Coordenada(s) do campo Favorecido inválida(s).';
  ERRO_URANO_1EFC_GERAL[25] := 'Coordenada(s) do campo Cidade inválida(s).';
  ERRO_URANO_1EFC_GERAL[26] := 'Coordenada(s) do campo Mensagem inválida(s).';
  ERRO_URANO_1EFC_GERAL[27] := 'Coordenada(s) do campo Data inválida(s).';
  ERRO_URANO_1EFC_GERAL[28] := 'Valor do campo Espaçamento inválido.';
  ERRO_URANO_1EFC_GERAL[29] := 'Erro interno na comunicação com a impressora.';
  ERRO_URANO_1EFC_GERAL[33] := 'Comando executado com sucesso.';

  STATUS_URANO_1EFC[50]     := 'Esperando fechamento do dia.';
  STATUS_URANO_1EFC[117]    := 'Intervenção técnica.';
  STATUS_URANO_1EFC[118]    := 'Em período de venda.';
  STATUS_URANO_1EFC[119]    := 'Em venda de item.';
  STATUS_URANO_1EFC[120]    := 'Em pagamento.';
  STATUS_URANO_1EFC[121]    := 'Em comercial.';
  STATUS_URANO_1EFC[124]    := 'Dia fechado.';
  STATUS_URANO_1EFC[125]    := 'Em não vinculado.';
  STATUS_URANO_1EFC[126]    := 'Em relatório gerencial.';
  STATUS_URANO_1EFC[127]    := 'Em documento vinculado.';
     
  result := InicializaDLL(sPorta);
  if (result=33) or //comando efetuado com sucesso
    (result=1)     //DLL ja inicializada
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO INICIALIZA: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_Finaliza:Integer;
begin
  result := FinalizaDLL;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO FINALIZA: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_ImprimeCabecalho:Integer;
begin
  result := ImprimeCabecalho;
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO IMPRIME CABECALHO: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_VendaItem(Codigo,Descricao,Quantidade,ValorUnitario,Taxa,Unidade,Tipo: Pchar):Integer;
begin
  result := VendaItem(Codigo,Descricao,Quantidade,ValorUnitario,Taxa,Unidade,Tipo);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO VENDA ITEM: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_FormaPagamento(Forma,Descricao: Pchar):Integer;
begin
  result := FormaPagamento(Forma,Descricao);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO CARREGA FORMA PAGAMENTO: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_DescontoSubtotal(Operacao,Descricao,Valor: Pchar):Integer;
begin
  result := DescontoSubtotal(Operacao,Descricao,Valor);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO DESCONTO SUBTOTAL: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_Relatorio_XZ  (Operacao: Pchar):Integer;
begin
  result := Relatorio_XZ(Operacao);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO RELATORIO X ou Z: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_FinalizaRelatorio (Operador: Pchar):Integer;
begin
  result := FinalizaRelatorio(Operador);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO FINALIZA RELATORIO: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_Pagamento (Forma,Descricao,Valor,Acumular: Pchar):Integer;
begin
  result := Pagamento (Forma,Descricao,Valor,Acumular);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO PAGAMENTO: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_FechaCupom (Operador: Pchar):Integer;
begin
  result := FechaCupom(Operador);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO FECHA CUPOM: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_LinhasLivres (Texto: Pchar):Integer;
begin
  result := LinhasLivres(Texto);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO LINHAS LIVRES: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_EmiteVinculado (COO,Sequencia: Pchar):Integer;
begin
  result := EmiteVinculado(COO,Sequencia);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO EMITE VINCULADO: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_CargaAliquota  (Aliquota,Valor: Pchar):Integer;
begin
  result := CargaAliquota(Aliquota,Valor);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: CARGA ALIQUOTA: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_EstadoImpressora  :String;
var
  i: Integer;
begin
  i := EstadoImpressora;
  result := STATUS_URANO_1EFC[i];
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
    showmessage('Erro impressora: COMANDO LE REGISTRADOR: '+#13#10+ERRO_URANO_1EFC_GERAL [i]);
end;

function URANOEFC_1EFC_CancelaVenda (Operador: Pchar):Integer;
begin
  result := CancelaVenda(Operador);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO CANCELA VENDA: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_CancelaCupom (Autorizacao,Operador: Pchar):Integer;
begin
  result := CancelaCupom(Autorizacao,Operador);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO CANCELA CUPOM: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_AvancaLinhas (nLinhas: Pchar):Integer;
begin
  result := AvancaLinhas(nLinhas);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO AVANCA LINHAS: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_LeituraMF (tipo,inicio,fim,arquivo: Pchar):Integer;
begin
  result := LeituraMF (tipo,inicio,fim,arquivo);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO LEITURAMF: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1EFC_Propaganda (tipo,texto: Pchar):Integer;
begin
  result := Propaganda(tipo,texto);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO PROPAGANDA: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

function URANOEFC_1CancelaItem (Descricao,Transacao:Pchar):Integer;
begin
  result := CancelaItem(Descricao,Transacao);
  if (result=33) //comando executado com sucesso
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO CANCELA ITEM: '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

procedure carregaaliquotasUranoEcf1;
var
  i:Integer;
begin
  if length(AliquotasUranoEcf1) > 0 then
    exit;

  SetLength(AliquotasUranoEcf1,13);
  for i:=0 to 12 do
    if I in [0..6] then
      AliquotasUranoEcf1[i] := strtofloatn(URANOEFC_1EFC_LeRegistrador(Pchar(InttoStr(I + 34))))
    else
    if i in [11,12] then
      AliquotasUranoEcf1[i] := strtofloatn(URANOEFC_1EFC_LeRegistrador(Pchar(InttoStr(I - 11 + 94))))
    else
      AliquotasUranoEcf1[I] := 0;
end;

function URANOEFC_1EFC_CarregaAliquota(Valor:Pchar):Integer;
var
  i:Integer;
begin
  result := -1;
  carregaaliquotasUranoEcf1;
  for i:=0 to length(AliquotasUranoEcf1) - 1 do
    if ((i <= 6) or (i >= 11)) and (AliquotasUranoEcf1[i] = 0)  then
    begin
      Result := CargaAliquota(Pchar(formatfloat('00',i)),Valor);
      AliquotasUranoEcf1[i] := StrtoFloatn(Valor);
      Break;
    end;

  if result = -1 then
    showmessage('Todas as aliquotas possiveis foram cadastradas');

  if (result=33)
  then
    result:=0;
  if (result<>0) then
    showmessage('Erro impressora: COMANDO CARREGA ALIQUOTA : '+#13#10+ERRO_URANO_1EFC_GERAL [result]);
end;

end.
