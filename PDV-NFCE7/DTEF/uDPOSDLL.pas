unit uDPOSDLL;


interface

uses SysUtils, Windows, Forms, Dialogs, Classes, Messages, ExtCtrls, Controls;

type
  TDadosAdicionaisCartaoCredito = record
    aTipoOperacao           : array[1..2] of Char;
    aNumeroParcelas         : array[1..2] of Char;
    aValorParcela           : array[1..12] of Char;
    aValorTaxaServico       : array[1..12] of Char;
    aPermiteAlteracao       : array[1..1] of Char;
    aReservado              : array[1..158] of Char;
  end;

  TDadosAdicionaisCartaoDebito = record
    aTipoOperacao           : array[1..2] of Char;
    aNumeroParcelas         : array[1..2] of Char;
    aSequenciaParcela       : array[1..2] of Char;
    aDataDebito             : array[1..8] of Char;
    aValorParcela           : array[1..12] of Char;
    aValorTaxaServico       : array[1..12] of Char;
    aPermiteAlteracao       : array[1..1] of Char;
    aReservado              : array[1..148] of Char;
  end;

  TDadosAdicionaisCartaoVoucher = record
    aReservado              : array[1..187] of Char;
  end;

  TDadosParcelasDebito = record
    aDataParcela   : array[1..8] of Char;
    aValorParcela  : array[1..12] of Char;
  end;

  TInfDadosParcelasAdicionais = record
    NumeroParcelas : Integer;
    DadosParcela   : array[1..99] of TDadosParcelasDebito;
  end;
   //TInfDadosParcelasAdicionais = Array[1..99] of TInfAdicionaisParcelasTransacaoDebito; //ALTERA-EDERSON-0207

  TDadosAdicionaisCheque = record
    aTipoDocumento          : array[1..1] of Char;
    aNumeroDocumento        : array[1..14] of Char;
    aQuantidadeCheques      : array[1..2] of Char;
    aSequenciaCheques       : array[1..2] of Char;
    aCamaraCompensacao      : array[1..3] of Char;
    aNumeroBanco            : array[1..3] of Char;
    aNumeroAgencia          : array[1..4] of Char;
    aNumeroContaCorrente    : array[1..10] of Char;
    aNumeroCheque           : array[1..7] of Char;
    aDataDeposito           : array[1..8] of Char;
    aValorCheque            : array[1..12] of Char;
    aDataNascimentoCliente  : array[1..8] of Char;
    aTelefoneCliente        : array[1..12] of Char;
    aCMC7                   : array[1..50] of Char;
    aPermiteAlteracao       : array[1..1] of Char;
    aReservado              : array[1..51] of Char;
  end;

  TDadosUltimaTransacao = record
    aEmpresa                : array[1..4] of Char;
    aLoja                   : array[1..6] of Char;
    aTipoRegistro           : array[1..3] of Char;
    aData                   : array[1..8] of Char;
    aHora                   : array[1..6] of Char;
    aCodigoTransacao        : array[1..2] of Char;
    aNumeroPDV              : array[1..3] of Char;
    aNumeroFiscalEquipamento: array[1..8] of Char;
    aNumeroCupom            : array[1..6] of Char;

      // CREDITO
    aValor                  : array[1..12] of Char;
    aTipoColeta             : array[1..1] of Char;
    aNumeroAutorizadora     : array[1..2] of Char;
    aNumeroCartao           : array[1..37] of Char;
    aVencimentoCartao       : array[1..4] of Char;

      // DEBITO
    aTipoTransacao          : array[1..1] of Char;
    aCodigoSupervisor       : array[1..8] of Char;

      // GERAL CARTOES
    aTipoOperacao           : array[1..2] of Char;
    aNumeroParcelas         : array[1..2] of Char;
    aSequenciaParcela       : array[1..2] of Char;
    aDataParcela            : array[1..8] of Char;
    aValorParcela           : array[1..12] of Char;
    aValorTaxaServico       : array[1..12] of Char;

      // CHEQUE
    aTipoDocumento          : array[1..1] of Char;
    aNumeroDocumento        : array[1..14] of Char;
    aQuantidadeCheques      : array[1..2] of Char;
    aSequenciaCheque        : array[1..2] of Char;
    aCamaraCompensacao      : array[1..3] of Char;
    aNumeroBanco            : array[1..3] of Char;
    aNumeroAgencia          : array[1..4] of Char;
    aNumeroContaCorrente    : array[1..10] of Char;
    aNumeroCheque           : array[1..7] of Char;
    aDataDeposito           : array[1..8] of Char;
    aValorCheque            : array[1..12] of Char;
    aDataNascimento         : array[1..8] of Char;
    aTelefone               : array[1..12] of Char;
    aCMC7                   : array[1..50] of Char;

      // Resposta
    aCodigoResposta            : array[1..2] of Char;
    aNumeroControleAutorizadora: array[1..9] of Char;
    aNSU                       : array[1..6] of Char;
    aNumeroAutorizacaoRede     : array[1..6] of Char;
    aMensagemErro              : array[1..20] of Char;
  end;

  TTransacaoCheque = function (pValorTransacao, pNumeroCupomVenda, pNumeroControle, pQuantidadeCheques,
    pPeriodicidadeCheques, pDataPrimeiroCheque, pCarenciaPrimeiroCheque: Pchar): Integer; stdcall;
  TTransacaoCartaoCredito = function (pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer; stdcall;
  TConfirmacaoCartaoCredito = function (pNumeroControle: Pchar): Integer; stdcall;

  TTransacaoCartaoDebito = function (pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer; stdcall;
  TConfirmacaoCartaoDebito = function (pNumeroControle: Pchar): Integer; stdcall;

  TTransacaoCartaoVoucher = function (pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer; stdcall;
  TConfirmacaoCartaoVoucher = function (pNumeroControle: Pchar): Integer; stdcall;

  TTransacaoCancelamentoPagamento = function (pNumeroControle: Pchar): Integer; stdcall;
  TTransacaoPreAutorizacaoCartaoCredito = function (pNumeroControle: Pchar): Integer; stdcall;
  TTransacaoConsultaParcelas = function (pNumeroControle: Pchar): Integer; stdcall;
  TTransacaoResumoVendas = function (pNumeroControle: Pchar): Integer; stdcall;
  TTransacaoReimpressaoCupom = function : Integer; stdcall;

  TConfirmacaoCartao = function (pNumeroControle: Pchar): Integer; stdcall;
  TFinalizaTransacao = function : Integer; stdcall;

  TObtemLogUltimaTransacao = procedure (oLogUltimaTransacao: Pchar); stdcall;

  TInicializaDPOS = function : Integer; stdcall;
  TFinalizaDPOS = function : Integer; stdcall;

  // Definicao das funcoes de transacao completa
  TTransacaoCartaoCreditoCompleta = function (
    pValorTransacao,   pNumeroCupomVenda, pNumeroControle,
    pTipoOperacao,     pNumeroParcelas,   pValorParcela,   pValorTaxaServico,
    pPermiteAlteracao, pReservado: Pchar): Integer; stdcall;

  TTransacaoCartaoDebitoCompleta = function (
    pValorTransacao, pNumeroCupomVenda, pNumeroControle,
    pTipoOperacao,   pNumeroParcelas,   pSequenciaParcela, pDataDebito,
    pValorParcela,   pValorTaxaServico, pPermiteAlteracao, pReservado: Pchar): Integer; stdcall;

  TTransacaoCartaoVoucherCompleta = function (
    pValorTransacao, pNumeroCupomVenda, pNumeroControle, pReservado: Pchar): Integer; stdcall;

	 TTransacaoConciliacaoFinanceiraCompleta = function (
   	pValorTransacao: Pchar;	pCodigoEstabelecimento, pData, pHora, pNumeroAutorizadora,
   	pNumeroCartao, pTipoOperacao, pNumeroParcelas, pDataPreDatado, pNumeroControle: Pchar): Integer; stdcall;

var
  hDLL  : THandle;

  fTransacaoCheque                        : TTransacaoCheque;

  fTransacaoCartaoCredito                 : TTransacaoCartaoCredito;
  fConfirmaCartaoCredito                  : TConfirmacaoCartaoCredito;

  fTransacaoCartaoDebito                  : TTransacaoCartaoDebito;
  fConfirmaCartaoDebito                   : TConfirmacaoCartaoDebito;

  fTransacaoCartaoVoucher                 : TTransacaoCartaoVoucher;
  fConfirmaCartaoVoucher                  : TConfirmacaoCartaoVoucher;

  fTransacaoCancelamento                  : TTransacaoCancelamentoPagamento;
  fTransacaoPreAutorizacaoCartaoCredito   : TTransacaoPreAutorizacaoCartaoCredito;
  fTransacaoConsultaParcelas              : TTransacaoConsultaParcelas;
  fTransacaoResumoVendas						: TTransacaoResumoVendas;
  fTransacaoReimpressaoCupom					: TTransacaoReimpressaoCupom;

  fConfirmaCartao                  			: TConfirmacaoCartao;
  fFinalizaTransacao                      : TFinalizaTransacao;

  fLogUltimaTransacao							: TObtemLogUltimaTransacao;

  fInicializaDPOS                         : TInicializaDPOS;
  fFinalizaDPOS                           : TFinalizaDPOS;

  fTransacaoCartaoCreditoCompleta         : TTransacaoCartaoCreditoCompleta;
  fTransacaoCartaoDebitoCompleta          : TTransacaoCartaoDebitoCompleta;
  fTransacaoCartaoVoucherCompleta         : TTransacaoCartaoVoucherCompleta;
  fTransacaoConciliacaoFinanceiraCompleta : TTransacaoConciliacaoFinanceiraCompleta;

procedure memcpy(pDest, pSource: Pchar; nBytes: Integer);

function CarregaModuloDPOS:Boolean;
procedure DescarregaModuloDPOS;

procedure InicializaDPOS;
procedure FinalizaDPOS;

function TransacaoCheque(pValorTransacao, pNumeroCupomVenda, pNumeroControle, pQuantidadeCheques,
  pPeriodicidadeCheques, pDataPrimeiroCheque, pCarenciaPrimeiroCheque: Pchar): Integer;

function TransacaoCartaoCredito(pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer;
function ConfirmaCartaoCredito(pNumeroControle: Pchar): Integer;

function TransacaoCartaoDebito(pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer;
function ConfirmaCartaoDebito(pNumeroControle: Pchar): Integer;

function TransacaoCartaoVoucher(pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer;
function ConfirmaCartaoVoucher(pNumeroControle: Pchar): Integer;

function CancelamentoPagamento(pNumeroControle: Pchar): Integer;
function TransacaoPreAutorizacaoCartaoCredito (pNumeroControle: Pchar):Integer;
function TransacaoConsultaParcelas(pNumeroControle: Pchar): Integer;
function TransacaoResumoVendas(pNumeroControle: Pchar): Integer;
function TransacaoReimpressaoCupom: Integer;

procedure DadosUltimaTransacao(oLogUltimaTransacao: Pchar);

function ConfirmaCartao(pNumeroControle: Pchar): Integer;
function FinalizaTransacao:Integer;

function TransacaoCartaoCreditoCompleta (
  pValorTransacao,   pNumeroCupomVenda, pNumeroControle,
  pTipoOperacao,     pNumeroParcelas,   pValorParcela,   pValorTaxaServico,
  pPermiteAlteracao, pReservado: Pchar): Integer;

function TransacaoCartaoDebitoCompleta(
  pValorTransacao, pNumeroCupomVenda, pNumeroControle,
  pTipoOperacao,   pNumeroParcelas,   pSequenciaParcela, pDataDebito,
  pValorParcela,   pValorTaxaServico, pPermiteAlteracao, pReservado: Pchar): Integer;

function TransacaoCartaoVoucherCompleta(
  pValorTransacao, pNumeroCupomVenda, pNumeroControle, pReservado: Pchar): Integer;

function TransacaoManualPOSCompleta(
  pValorTransacao, pCodigoEstabelecimento, pData, pHora, pNumeroAutorizadora,
  pNumeroCartao, pTipoOperacao, pNumeroParcelas, pDataPreDatado, pNumeroControle: Pchar): Integer;
  
implementation

procedure memcpy(pDest, pSource: Pchar; nBytes: Integer);
var
  i: Integer;
begin
  for i := 0 to nBytes - 1 do
    pDest[i] := pSource[i];
end;

function CarregaModuloDPOS:Boolean;
begin
  Result := false;

  hDLL := LoadLibrary(Pchar('DPOSDRV.DLL'));

  if hDLL < 32 then
    Exit;

  fTransacaoCheque                       := GetProcAddress(hDLL,'TransacaoCheque');

  fTransacaoCartaoCredito                := GetProcAddress(hDLL,'TransacaoCartaoCredito');
  fConfirmaCartaoCredito                 := GetProcAddress(hDLL,'ConfirmaCartaoCredito');

  fTransacaoCartaoDebito                 := GetProcAddress(hDLL,'TransacaoCartaoDebito');
  fConfirmaCartaoDebito                  := GetProcAddress(hDLL,'ConfirmaCartaoDebito');

  fTransacaoCartaoVoucher                := GetProcAddress(hDLL,'TransacaoCartaoVoucher');
  fConfirmaCartaoVoucher                 := GetProcAddress(hDLL,'ConfirmaCartaoVoucher');

  fTransacaoCancelamento                 := GetProcAddress(hDLL,'TransacaoCancelamentoPagamento');
  fTransacaoPreAutorizacaoCartaoCredito  := GetProcAddress(hDLL,'TransacaoPreAutorizacaoCartaoCredito');
  fTransacaoConsultaParcelas             := GetProcAddress(hDLL,'TransacaoConsultaParcelas');
  fTransacaoResumoVendas                 := GetProcAddress(hDLL,'TransacaoResumoVendas');
  fTransacaoReimpressaoCupom					:= GetProcAddress(hDLL,'TransacaoReimpressaoCupom');

  fConfirmaCartao                 			:= GetProcAddress(hDLL,'ConfirmaCartao');
  fFinalizaTransacao                     := GetProcAddress(hDLL,'FinalizaTransacao');

  fLogUltimaTransacao							:= GetProcAddress(hDLL,'ObtemLogUltimaTransacao');

  fInicializaDPOS                        := GetProcAddress(hDLL,'InicializaDPOS');
  fFinalizaDPOS                          := GetProcAddress(hDLL,'FinalizaDPOS');

  fTransacaoCartaoCreditoCompleta        := GetProcAddress(hDLL,'TransacaoCartaoCreditoCompleta');
  fTransacaoCartaoDebitoCompleta         := GetProcAddress(hDLL,'TransacaoCartaoDebitoCompleta');
  fTransacaoCartaoVoucherCompleta        := GetProcAddress(hDLL,'TransacaoCartaoVoucherCompleta');
  fTransacaoConciliacaoFinanceiraCompleta:= GetProcAddress(hDLL,'TransacaoManualPOSCompleta');
   
  Result := true;
end;

procedure DescarregaModuloDPOS;
begin
  fTransacaoCheque                       := nil;

  fTransacaoCartaoCredito                := nil;
  fConfirmaCartaoCredito                 := nil;

  fTransacaoCartaoDebito                 := nil;
  fConfirmaCartaoDebito                  := nil;

  fTransacaoCartaoVoucher                := nil;
  fConfirmaCartaoVoucher                 := nil;

  fTransacaoCancelamento                 := nil;
  fTransacaoPreAutorizacaoCartaoCredito  := nil;
  fTransacaoConsultaParcelas             := nil;
  fTransacaoResumoVendas                 := nil;
  fTransacaoReimpressaoCupom					:= nil;

  fConfirmaCartao                        := nil;
  fFinalizaTransacao                     := nil;

  fLogUltimaTransacao							:= nil;

  fInicializaDPOS                        := nil;
  fFinalizaDPOS                          := nil;

  fTransacaoCartaoCreditoCompleta        := nil;
  fTransacaoCartaoDebitoCompleta         := nil;
  fTransacaoCartaoVoucherCompleta        := nil;
  fTransacaoConciliacaoFinanceiraCompleta:= nil;
   
  if hDLL <> 0 then
    FreeLibrary(hDLL);
end;

procedure InicializaDPOS;
var
  Ret : Integer;
begin
	 Ret := 11;
  if Assigned (fInicializaDPOS) then
    Ret := fInicializaDPOS;
end;

procedure FinalizaDPOS;
begin
  if Assigned (fFinalizaDPOS) then
    fFinalizaDPOS;
end;

function TransacaoCheque (pValorTransacao, pNumeroCupomVenda, pNumeroControle, pQuantidadeCheques,
  pPeriodicidadeCheques, pDataPrimeiroCheque, pCarenciaPrimeiroCheque: Pchar): Integer;
var
  aNSU : array[0..99] of Char;
begin
	 Result := 11;
  if Assigned (fTransacaoCheque) then
    Result := fTransacaoCheque(pValorTransacao, pNumeroCupomVenda, aNSU, pQuantidadeCheques,
      pPeriodicidadeCheques, pDataPrimeiroCheque, pCarenciaPrimeiroCheque);

  StrCopy(pNumeroControle,aNSU);
end;

function TransacaoCartaoCredito(pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer;
var
  aNSU : array[0..100] of Char;
begin
	 Result := 11;
  if Assigned (fTransacaoCartaoCredito) then
    Result := fTransacaoCartaoCredito(pValorTransacao, pNumeroCupomVenda, aNSU);
  StrCopy(pNumeroControle,aNSU);
end;

function ConfirmaCartaoCredito(pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fConfirmaCartaoCredito) then
    Result := fConfirmaCartaoCredito(pNumeroControle);
end;

function TransacaoCartaoDebito(pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer;
var
  aNSU : Pchar;
begin
	 Result := 11;
  aNSU := StrAlloc(100);

  if Assigned (fTransacaoCartaoDebito) then
    Result := fTransacaoCartaoDebito(pValorTransacao, pNumeroCupomVenda, aNSU); //aNSU);

  StrCopy(pNumeroControle,aNSU);
  StrDispose(aNSU);
end;

function ConfirmaCartaoDebito(pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fConfirmaCartaoDebito) then
    Result := fConfirmaCartaoDebito(pNumeroControle);
end;

function TransacaoCartaoVoucher(pValorTransacao, pNumeroCupomVenda, pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fTransacaoCartaoVoucher) then
    Result := fTransacaoCartaoVoucher(pValorTransacao, pNumeroCupomVenda, pNumeroControle);
end;

function ConfirmaCartaoVoucher(pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fConfirmaCartaoVoucher) then
    Result := fConfirmaCartaoVoucher(pNumeroControle);
end;

function CancelamentoPagamento(pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fTransacaoCancelamento) then
    Result := fTransacaoCancelamento(pNumeroControle);
end;

function TransacaoPreAutorizacaoCartaoCredito (pNumeroControle: Pchar):Integer;
begin
	 Result := 11;
  if Assigned (fTransacaoPreAutorizacaoCartaoCredito) then
    Result := fTransacaoPreAutorizacaoCartaoCredito(pNumeroControle);
end;

function TransacaoConsultaParcelas (pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fTransacaoConsultaParcelas) then
    Result := fTransacaoConsultaParcelas(pNumeroControle);
end;

function TransacaoResumoVendas(pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fTransacaoResumoVendas) then
    Result := fTransacaoResumoVendas(pNumeroControle);
end;

function TransacaoReimpressaoCupom: Integer;
begin
	 Result := 11;
  if Assigned (fTransacaoReimpressaoCupom) then
    Result := fTransacaoReimpressaoCupom;
end;

function ConfirmaCartao(pNumeroControle: Pchar): Integer;
begin
	 Result := 11;
  if Assigned (fConfirmaCartao) then
    Result := fConfirmaCartao(pNumeroControle);
end;

procedure DadosUltimaTransacao(oLogUltimaTransacao: Pchar);
begin
  if Assigned (fLogUltimaTransacao) then
    fLogUltimaTransacao(oLogUltimaTransacao);
end;

function FinalizaTransacao:Integer;
begin
	 Result := 11;
  if Assigned (fFinalizaTransacao) then
    Result := fFinalizaTransacao;
end;

function TransacaoCartaoCreditoCompleta(
  pValorTransacao,   pNumeroCupomVenda, pNumeroControle,
  pTipoOperacao,     pNumeroParcelas,   pValorParcela,   pValorTaxaServico,
  pPermiteAlteracao, pReservado: Pchar): Integer;
begin
  if Assigned(fTransacaoCartaoCreditoCompleta) then
    Result := fTransacaoCartaoCreditoCompleta(
      pValorTransacao,   pNumeroCupomVenda, pNumeroControle,
      pTipoOperacao,     pNumeroParcelas,   pValorParcela,   pValorTaxaServico,
      pPermiteAlteracao, pReservado);

end;

function  TransacaoCartaoDebitoCompleta(pValorTransacao, pNumeroCupomVenda, pNumeroControle,
  pTipoOperacao,   pNumeroParcelas,   pSequenciaParcela, pDataDebito,
  pValorParcela,   pValorTaxaServico, pPermiteAlteracao, pReservado: Pchar): Integer;
begin
  if Assigned(fTransacaoCartaoDebitoCompleta) then
    Result := fTransacaoCartaoDebitoCompleta(
      pValorTransacao, pNumeroCupomVenda, pNumeroControle,
      pTipoOperacao,   pNumeroParcelas,   pSequenciaParcela, pDataDebito,
      pValorParcela,   pValorTaxaServico, pPermiteAlteracao, pReservado);
end;

function  TransacaoCartaoVoucherCompleta(pValorTransacao, pNumeroCupomVenda, pNumeroControle, pReservado: Pchar): Integer;
begin
  if Assigned(fTransacaoCartaoVoucherCompleta) then
    Result := fTransacaoCartaoVoucherCompleta(
      pValorTransacao, pNumeroCupomVenda, pNumeroControle, pReservado);
end;

function  TransacaoManualPOSCompleta(pValorTransacao, pCodigoEstabelecimento, pData, pHora,
	 pNumeroAutorizadora, pNumeroCartao, pTipoOperacao, pNumeroParcelas, pDataPreDatado,
  pNumeroControle: Pchar): Integer;
begin
  if Assigned(fTransacaoConciliacaoFinanceiraCompleta) then
    Result := fTransacaoConciliacaoFinanceiraCompleta(
      pValorTransacao, pCodigoEstabelecimento, pData, pHora,
			   pNumeroAutorizadora, pNumeroCartao, pTipoOperacao, pNumeroParcelas, pDataPreDatado,
      pNumeroControle);
end;

end.
