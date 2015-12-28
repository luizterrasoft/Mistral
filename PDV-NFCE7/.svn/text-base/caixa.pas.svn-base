{... - Funcoes relacionadas com os CREDITOS do 'CAIXA' no banco do CONTAS A PAGAR}
unit caixa;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  DBTables, DB, DBCtrls, Forms, Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls,
  Printers, Mask, FileCtrl, gauges, auxiliar,funcoesglobais;

procedure GeraLancamentos_Dinheiro (loja,terminal,codigovenda: Real; data: TDateTime; opcaixa: Real;
  valor: Real; tipz: String);
procedure RemoveLancamentos_Dinheiro (loja,terminal,codigovenda: Real);
procedure GeraLancamentos_Crediario (cliente,contrato,prestacao,loja,plano: Real; valor: Real;
  data: TDateTime; tipz: String;fpgto:Real=0);
procedure RemoveLancamentos_Crediario (cliente,contrato,prestacao: Real);
procedure GeraLancamentos_Diverso (loja: Real; tipo: Integer; contadiversa,valor: Real; data: TDateTime;
  descricao,tipodesc,tipz: String; seq_diverso: Real);
procedure RemoveLancamentos_Diverso (seq_diverso: Real);

{...}
function GeraLancamentoCaixa (centrodecusto,codigocontacaixa: Real; valor: Real; data: TDateTime; descricao,tipo,tipz: String;doc:String=''):Real;
procedure RemoveLancamentoCaixa (sequencial: Real);
function GeraLancamentoCredito (centrodecusto,codigocontareceber: Real; valor: Real; data: TDateTime; descricao,tipo,tipz: String;doc:String=''):Real;
procedure RemoveLancamentoCredito (sequencial: Real);

{...}
function DevolveSaldoAtualDoUltimoLancamento(conta,centro: Real; data: TDateTime):Real;
function DevolveSaldoAtualTipzDoUltimoLancamento(conta,centro: Real; tipz: String; data: TDateTime):Real;
procedure RecalcularSaldosConta (conta,centro: Real; data: TDateTime);
procedure RecalcularSaldosContaTipz (conta,centro: Real; tipz: String; data: TDateTime);
function UltimoSaldo (conta,centro: Real; data: TDateTime):Real;
function UltimoSaldoTipz (conta,centro: Real; tipz: String; data: TDateTime):Real;

{...}
procedure GeraAmarracaoDinheiroCaixaCredito (loja,terminal,codigovenda: Real; data: TDateTime; opcaixa: Real;
  tipz: String; seq_caixa,seq_credito: Real);
procedure RemoveAmarracaoDinheiroCaixaCredito (loja,terminal,codigovenda: Real);
procedure GeraAmarracaoCrediarioCaixaCredito (cliente,contrato,prestacao: Real; seq_caixa,seq_credito: Real);
procedure RemoveAmarracaoCrediarioCaixaCredito (cliente,contrato,prestacao: Real);
procedure GeraAmarracaoDiversoCaixa (seq_diverso,seq_caixa: Real);
procedure RemoveAmarracaoDiversoCaixa (seq_diverso: Real);
procedure GeraLancamentosOutros (loja,terminal,codigovenda: Real; data: TDateTime; opcaixa: Real;
  valor: Real; tipz: String;FP,op:Real;sangria:Boolean=false;chequesg:String='';oldloja:Real=0;supr:Boolean=false;obs:String='';
  Motivoconta:Boolean=false;FQryMotvConta:TClassAuxiliar=nil);

implementation

uses principal, DM4, funcoes1, funcoes2, procura, DM16, DM20;

function GeraLancamentoCaixa (centrodecusto,codigocontacaixa: Real; valor: Real;
  data: TDateTime; descricao,tipo,tipz: String;doc:String=''):Real;
var
  clAux: TClassAuxiliar;
  sequencial_lancamento_conta_caixa: Real;
  saldo_anterior,saldo_anterior2: Real;
begin
  sequencial_lancamento_conta_caixa := Round(MaxiCod_contaspagar ('LANCAMENTOS_CONTA_CAIXA',frm_principal.barraDicas));

  saldo_anterior  := DevolveSaldoAtualDoUltimoLancamento (codigocontacaixa,centrodecusto,data); {*}
  saldo_anterior2 := DevolveSaldoAtualTipzDoUltimoLancamento (codigocontacaixa,centrodecusto,tipz,data); {*}

     {...}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CONTASPAGAR',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO LANCAMENTOS_CONTA_CAIXA (LA_SEQ,LA_CONT,LA_DATA,LA_VALO,LA_NATU,LA_CUST,LA_TIPZ,LA_SALD,LA_SAL2,LA_SALA,LA_SAA2,LA_DESC,LA_TIPO,LA_TIME,LA_DOC) ');
  clAux.AddParam ('VALUES (:LA_SEQ,:LA_CONT,:LA_DATA,:LA_VALO,:LA_NATU,:LA_CUST,:LA_TIPZ,:LA_SALD,:LA_SAL2,:LA_SALA,:LA_SAA2,:LA_DESC,:LA_TIPO,:LA_TIME,:LA_DOC)                ');
  clAux.consulta.parambyname('LA_SEQ').AsFloat     := sequencial_lancamento_conta_caixa;
  clAux.consulta.parambyname('LA_CONT').AsFloat    := codigocontacaixa;
  clAux.consulta.parambyname('LA_DATA').AsDateTime := data;
  if (valor<0.00) then //caso de TROCA / DEVOLUCAO
    clAux.consulta.parambyname('LA_NATU').AsString   := 'D'
  else
    clAux.consulta.parambyname('LA_NATU').AsString   := 'C';
  clAux.consulta.parambyname('LA_CUST').AsFloat    := centrodecusto;
  clAux.consulta.parambyname('LA_TIPZ').AsString   := tipz;
  clAux.consulta.parambyname('LA_SALD').AsFloat    := saldo_anterior + valor;
  clAux.consulta.parambyname('LA_SAL2').AsFloat    := saldo_anterior2 + valor;
  clAux.consulta.parambyname('LA_SALA').AsFloat    := saldo_anterior;
  clAux.consulta.parambyname('LA_SAA2').AsFloat    := saldo_anterior2;
  clAux.consulta.parambyname('LA_DESC').AsString   := descricao;
  clAux.consulta.parambyname('LA_TIPO').AsString   := tipo;
  clAux.consulta.parambyname('LA_TIME').AsDateTime := frm_principal.x_data_trabalho;
  if (valor<0.00) then //caso de TROCA / DEVOLUCAO
    clAux.consulta.parambyname('LA_VALO').AsFloat    := (-1)*valor
  else
    clAux.consulta.parambyname('LA_VALO').AsFloat    := valor;

  clAux.consulta.parambyname('LA_DOC').AsString := doc;

  clAux.Execute; {*}

     {... - RECALCULANDO OS SALDOS}
  RecalcularSaldosConta     (centrodecusto,codigocontacaixa,data);
  RecalcularSaldosContaTipz (centrodecusto,codigocontacaixa,tipz,data);

  clAux.desconect;
  clAux.Free;

  result := sequencial_lancamento_conta_caixa;
end;

function GeraLancamentoCredito (centrodecusto,codigocontareceber: Real; valor: Real;
  data: TDateTime; descricao,tipo,tipz: String;doc:String=''):Real;
var
  clAux: TClassAuxiliar;
  sequencial_lancamento: Real;
begin

  sequencial_lancamento := Round(MaxiCod_contaspagar ('LANCAMENTOS',frm_principal.barraDicas));

     {...}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CONTASPAGAR',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO LANCAMENTOS (LA_SEQ,LA_CONT,LA_DATA,LA_VALO,LA_NATU,LA_CUST,LA_TIPZ,LA_SALD,LA_SAL2,LA_SALA,LA_SAA2,LA_DESC,LA_TIPO,LA_TIME,LA_DOC) ');
  clAux.AddParam ('VALUES (:LA_SEQ,:LA_CONT,:LA_DATA,:LA_VALO,:LA_NATU,:LA_CUST,:LA_TIPZ,:LA_SALD,:LA_SAL2,:LA_SALA,:LA_SAA2,:LA_DESC,:LA_TIPO,:LA_TIME,:LA_DOC)                ');
  clAux.consulta.parambyname('LA_SEQ').AsFloat     := sequencial_lancamento;
  clAux.consulta.parambyname('LA_CONT').AsFloat    := codigocontareceber;
  clAux.consulta.parambyname('LA_DATA').AsDateTime := data;
  if (valor<0.00) then //caso de TROCA / DEVOLUCAO
    clAux.consulta.parambyname('LA_NATU').AsString   := 'D'
  else
    clAux.consulta.parambyname('LA_NATU').AsString   := 'C';

  if (valor<0.00) then //caso de TROCA / DEVOLUCAO
    clAux.consulta.parambyname('LA_VALO').AsFloat    := (-1)*valor
  else
    clAux.consulta.parambyname('LA_VALO').AsFloat    := valor;
  clAux.consulta.parambyname('LA_CUST').AsFloat    := centrodecusto;
  clAux.consulta.parambyname('LA_TIPZ').AsString   := tipz;
  clAux.consulta.parambyname('LA_SALD').AsFloat    := 0.00;
  clAux.consulta.parambyname('LA_SAL2').AsFloat    := 0.00;
  clAux.consulta.parambyname('LA_SALA').AsFloat    := 0.00;
  clAux.consulta.parambyname('LA_SAA2').AsFloat    := 0.00;
  clAux.consulta.parambyname('LA_DESC').AsString   := descricao;
  clAux.consulta.parambyname('LA_TIPO').AsString   := tipo;
  clAux.consulta.parambyname('LA_TIME').AsDateTime := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('LA_Doc').AsString    := Doc;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;

  result := sequencial_lancamento;
end;

function DevolveSaldoAtualDoUltimoLancamento(conta,centro: Real; data: TDateTime):Real;
var
  clAux: TClassAuxiliar;
  total: Real;
begin
  if (conta<>0) and (centro<>0) then
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('CONTASPAGAR',frm_principal);
      ClearSql;
      AddParam ('Select LA_SALD                                                 ');
      AddParam ('From   LANCAMENTOS_CONTA_CAIXA                                 ');
      AddParam ('Where (LA_CONT='+floattostr(conta)+') AND                      ');
      AddParam ('      (LA_CUST='+floattostr(centro)+') AND                     ');
      AddParam ('      (LA_DATA<='+chr(39)+FormataData(data)+chr(39)+')         ');
      AddParam ('Order by LA_DATA,LA_SEQ                                        ');
      if (Execute) then
      begin
        last;
        DevolveSaldoAtualDoUltimoLancamento:=Result('LA_SALD');
      end
      else
        DevolveSaldoAtualDoUltimoLancamento:=0.00;
      desconect;
      Free;
    end;
  end;
end;

function DevolveSaldoAtualTipzDoUltimoLancamento(conta,centro: Real; tipz: String; data: TDateTime):Real;
var
  clAux: TClassAuxiliar;
  total: Real;
begin
  if (conta<>0) and (centro<>0) then
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('CONTASPAGAR',frm_principal);
      ClearSql;
      AddParam ('Select LA_SAL2                                                 ');
      AddParam ('From   LANCAMENTOS_CONTA_CAIXA                                 ');
      AddParam ('Where (LA_CONT='+floattostr(conta)+') AND                      ');
      AddParam ('      (LA_CUST='+floattostr(centro)+') AND                     ');
      AddParam ('      (LA_DATA<='+chr(39)+FormataData(data)+chr(39)+') AND     ');
      AddParam ('      (LA_TIPZ='+chr(39)+tipz+chr(39)+')                       ');
      AddParam ('Order by LA_DATA,LA_SEQ                                        ');
      if (Execute) then
      begin
        last;
        DevolveSaldoAtualTipzDoUltimoLancamento:=Result('LA_SAL2');
      end
      else
        DevolveSaldoAtualTipzDoUltimoLancamento:=0.00;
      desconect;
      Free;
    end;
  end;
end;

procedure RecalcularSaldosConta (conta,centro: Real; data: TDateTime);
var
  clAux,clAux2: TClassAuxiliar;
  saldo,saldo_atual,saldo_anterior: Real;
begin
  if (conta<>0) and (centro<>0) and (data<>strtodate('01/01/1900')) then
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('CONTASPAGAR',frm_principal);
      ClearSql;
      AddParam ('Select LA_SEQ,LA_NATU,LA_VALO                                  ');
      AddParam ('From   LANCAMENTOS_CONTA_CAIXA,CONTAS_CAIXA                    ');
      AddParam ('Where (LA_CONT='+floattostr(conta)+') AND                      ');
      AddParam ('      (LA_CUST='+floattostr(centro)+') AND                     ');
      AddParam ('      (LA_DATA>='+chr(39)+FormataData(data)+chr(39)+') AND     ');
      AddParam ('      (CC_CODI=LA_CONT) AND (CC_CUST=LA_CUST)                  ');
      AddParam ('Order by LA_DATA,LA_SEQ                                        ');
      if (Execute) then
      begin
        clAux.first;
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect ('CONTASPAGAR',frm_principal);
        saldo_atual := UltimoSaldo(conta,centro,data);
        while (not eof) do
        begin
          saldo_anterior := saldo_atual;
          if (clAux.result('LA_NATU')='C') then
            saldo_atual  := saldo_anterior + clAux.result('LA_VALO')
          else
          if (clAux.result('LA_NATU')='D') then
            saldo_atual  := saldo_anterior - clAux.result('LA_VALO');
          with (DMLancamentos.qAlteraSaldo) do
          begin
            parambyname('seq').AsFloat            := clAux.result('LA_SEQ');
            parambyname('saldo_atual').AsFloat    := saldo_atual;
            parambyname('saldo_anterior').AsFloat := saldo_anterior;
            ExecSql;
          end;
          clAux.next;
        end;
        clAux2.desconect;
        clAux2.Free;
      end;
      desconect;
      Free;
    end;
  end;
end;


{Considerando TIPZ 1,2,3...}
procedure RecalcularSaldosContaTipz (conta,centro: Real; tipz: String; data: TDateTime);
var
  clAux,clAux2: TClassAuxiliar;
  saldo,saldo_atual,saldo_anterior: Real;
begin
  if (conta<>0) and (centro<>0) and (tipz<>'') and (data<>strtodate('01/01/1900')) then
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('CONTASPAGAR',frm_principal);
      ClearSql;
      AddParam ('Select LA_SEQ,LA_NATU,LA_VALO                                  ');
      AddParam ('From LANCAMENTOS_CONTA_CAIXA,CONTAS_CAIXA                      ');
      AddParam ('Where (LA_CONT='+floattostr(conta)+') AND                      ');
      AddParam ('      (LA_CUST='+floattostr(centro)+') AND                     ');
      AddParam ('      (LA_DATA>='+chr(39)+FormataData(data)+chr(39)+') AND     ');
      AddParam ('      (LA_TIPZ='+chr(39)+tipz+chr(39)+') AND                   ');
      AddParam ('      (CC_CODI=LA_CONT) AND (CC_CUST=LA_CUST)                  ');
      AddParam ('Order by LA_DATA,LA_SEQ                                        ');
      if (Execute) then
      begin
        clAux.first;
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect ('CONTASPAGAR',frm_principal);
        saldo_atual := UltimoSaldoTipz(conta,centro,tipz,data);
        while (not eof) do
        begin
          saldo_anterior := saldo_atual;
          if (clAux.result('LA_NATU')='C') then
            saldo_atual  := saldo_anterior + clAux.result('LA_VALO')
          else
          if (clAux.result('LA_NATU')='D') then
            saldo_atual  := saldo_anterior - clAux.result('LA_VALO');
          with (DMLancamentos.qAlteraSaldoTipz) do
          begin
            parambyname('seq').AsFloat            := clAux.result('LA_SEQ');
            parambyname('saldo_atual').AsFloat    := saldo_atual;
            parambyname('saldo_anterior').AsFloat := saldo_anterior;
            ExecSql;
          end;
          clAux.next;
        end;
        clAux2.desconect;
        clAux2.Free;
      end;
      desconect;
      Free;
    end;
  end;
end;

function UltimoSaldo (conta,centro: Real; data: TDateTime):Real;
var
  clAux: TClassAuxiliar;
begin
  if (conta<>0) and (centro<>0) and (data<>strtodate('01/01/1900')) then
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('CONTASPAGAR',frm_principal);
      ClearSql;
      AddParam ('Select LA_SALD                                         ');
      AddParam ('From   LANCAMENTOS_CONTA_CAIXA                         ');
      AddParam ('Where (LA_CONT='+floattostr(conta)+') AND              ');
      AddParam ('      (LA_CUST='+floattostr(centro)+') AND             ');
      AddParam ('      (LA_DATA<'+chr(39)+FormataData(data)+chr(39)+')  ');
      AddParam ('Order by LA_DATA,LA_SEQ                                ');
      if (Execute) then
      begin
        last;
        UltimoSaldo:=result('LA_SALD');
      end
      else
        UltimoSaldo:=0.00;
      desconect;
      Free;
    end;
  end;
end;

function UltimoSaldoTipz (conta,centro: Real; tipz: String; data: TDateTime):Real;
var
  clAux: TClassAuxiliar;
begin
  if (conta<>0) and (centro<>0) and (data<>strtodate('01/01/1900')) then
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('CONTASPAGAR',frm_principal);
      ClearSql;
      AddParam ('Select LA_SAL2                                         ');
      AddParam ('From   LANCAMENTOS_CONTA_CAIXA                         ');
      AddParam ('Where (LA_CONT='+floattostr(conta)+') AND              ');
      AddParam ('      (LA_CUST='+floattostr(centro)+') AND             ');
      AddParam ('      (LA_TIPZ='+chr(39)+tipz+chr(39)+') AND           ');
      AddParam ('      (LA_DATA<'+chr(39)+FormataData(data)+chr(39)+')  ');
      AddParam ('Order by LA_DATA,LA_SEQ                                ');
      if (Execute) then
      begin
        last;
        UltimoSaldoTipz:=result('LA_SAL2');
      end
      else
        UltimoSaldoTipz:=0.00;
      desconect;
      Free;
    end;
  end;
end;

procedure GeraAmarracaoParcelaCaixaCredito (loja,terminal,codigovenda: Real; ordem,parcela: Integer;
  seq_caixa,seq_credito: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO CAIXA_CARTOES_PARCELAS (LOJA,CAIX,VEND,ORDE,NPAR,SEQCAIXA,SEQCREDITO) ');
  clAux.AddParam ('VALUES (:LOJA,:CAIX,:VEND,:ORDE,:NPAR,:SEQCAIXA,:SEQCREDITO)                      ');
  clAux.consulta.parambyname('LOJA').AsFloat         := loja;
  clAux.consulta.parambyname('CAIX').AsFloat         := terminal;
  clAux.consulta.parambyname('VEND').AsFloat         := codigovenda;
  clAux.consulta.parambyname('ORDE').AsInteger       := ordem;
  clAux.consulta.parambyname('NPAR').AsInteger       := parcela;
  clAux.consulta.parambyname('SEQCAIXA').AsFloat     := seq_caixa;
  clAux.consulta.parambyname('SEQCREDITO').AsFloat   := seq_credito;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure RemoveAmarracaoParcelaCaixaCredito (loja,terminal,codigovenda: Real; ordem,parcela: Integer);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CAIXA_CARTOES_PARCELAS        ');
  clAux.AddParam ('WHERE (LOJA=:LOJA) AND                    ');
  clAux.AddParam ('      (CAIX=:CAIX) AND                    ');
  clAux.AddParam ('      (VEND=:VEND) AND                    ');
  clAux.AddParam ('      (ORDE=:ORDE) AND                    ');
  clAux.AddParam ('      (NPAR=:NPAR)                        ');
  clAux.consulta.parambyname('LOJA').AsFloat         := loja;
  clAux.consulta.parambyname('CAIX').AsFloat         := terminal;
  clAux.consulta.parambyname('VEND').AsFloat         := codigovenda;
  clAux.consulta.parambyname('ORDE').AsInteger       := ordem;
  clAux.consulta.parambyname('NPAR').AsInteger       := parcela;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure RemoveLancamentos_Dinheiro (loja,terminal,codigovenda: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SEQCAIXA,SEQCREDITO                   ');
  clAux.AddParam ('FROM   CAIXA_DINHEIRO                        ');
  clAux.AddParam ('WHERE (LOJA       =:LOJA) AND                ');
  clAux.AddParam ('      (TERMINAL   =:TERMINAL) AND            ');
  clAux.AddParam ('      (CODIGOVENDA=:CODIGOVENDA)             ');
  clAux.consulta.parambyname('LOJA').AsFloat        := loja;
  clAux.consulta.parambyname('TERMINAL').AsFloat    := terminal;
  clAux.consulta.parambyname('CODIGOVENDA').AsFloat := codigovenda;
  if (clAux.Execute) then
  begin
    RemoveAmarracaoDinheiroCaixaCredito (loja,terminal,codigovenda);
    RemoveLancamentoCaixa (clAux.result('SEQCAIXA')); {*}
    RemoveLancamentoCredito (clAux.result('SEQCREDITO')); {*}
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure RemoveLancamentoCaixa (sequencial: Real);
var
  clAux: TClassAuxiliar;
  conta,centro: Real;
  data: TDateTime;
  tipz: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CONTASPAGAR',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT LA_CUST,LA_CONT,LA_DATA,LA_TIPZ                    ');
  clAux.AddParam ('FROM LANCAMENTOS_CONTA_CAIXA                              ');
  clAux.AddParam ('WHERE (LA_SEQ=:seq)                                       ');
  clAux.consulta.parambyname('seq').AsFloat := sequencial;
  if (clAux.Execute) then
  begin
    conta  := clAux.result('LA_CONT');
    centro := clAux.result('LA_CUST');
    data   := clAux.result('LA_DATA');
    tipz   := clAux.result('LA_TIPZ');

    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM LANCAMENTOS_CONTA_CAIXA                  ');
    clAux.AddParam ('WHERE (LA_SEQ=:seq)                                  ');
    clAux.consulta.parambyname('seq').AsFloat := sequencial;
    clAux.Execute;

          {..............................................................................}
    RecalcularSaldosConta (conta,centro,data);
    RecalcularSaldosContaTipz (conta,centro,tipz,data);
          {..............................................................................}
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure RemoveLancamentoCredito (sequencial: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CONTASPAGAR',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT LA_CUST,LA_CONT,LA_DATA,LA_TIPZ FROM LANCAMENTOS WHERE (LA_SEQ=:seq) ');
  clAux.consulta.parambyname('seq').AsFloat := sequencial;
  if (clAux.Execute) then
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM LANCAMENTOS WHERE (LA_SEQ=:seq) ');
    clAux.consulta.parambyname('seq').AsFloat := sequencial;
    clAux.Execute;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure GeraLancamentos_Dinheiro (loja,terminal,codigovenda: Real; data: TDateTime; opcaixa: Real;
  valor: Real; tipz: String);
var
  clConf: TClassAuxiliar;
  seq_caixa,seq_credito: Real;
begin
     //************************************************************************************
  clConf := TClassAuxiliar.Create;
  clConf.conect   ('ESTOQUE',frm_principal);
  clConf.ClearSql;
  clConf.AddParam ('SELECT CONTARECEBER,CONTACAIXA FROM CONFIG_CREDITOS_CAIXA           ');
  clConf.AddParam ('WHERE (LOJA='+floattostr(loja)+') AND                               ');
  clConf.AddParam ('      (TIPO=1)                                                      ');
  if (clConf.Execute) then
  begin
    if (clConf.Result('CONTACAIXA')<>0) then
      seq_caixa := GeraLancamentoCaixa (loja,
        clConf.Result('CONTACAIXA'),
        valor,
        data,
        form_t('VENDA EFETUADA NA LOJA - OP:'+floattostr(opcaixa)+'/'+
        ProcuraNomeVendCaixa(loja,opcaixa,frm_principal),60),
        'DINHEIRO',
        tipz);
    if (clConf.Result('CONTARECEBER')<>0) then
      seq_credito := GeraLancamentoCredito (loja,
        clConf.Result('CONTARECEBER'),
        valor,
        data,
        form_t('VENDA EFETUADA NA LOJA - OP:'+floattostr(opcaixa)+'/'+
        ProcuraNomeVendCaixa(loja,opcaixa,frm_principal),60),
        'DINHEIRO',
        tipz);
    GeraAmarracaoDinheiroCaixaCredito (loja,terminal,codigovenda,data,opcaixa,tipz,seq_caixa,seq_credito);
  end;
  clConf.desconect;
  clConf.Free;
end;

procedure GeraAmarracaoDinheiroCaixaCredito (loja,terminal,codigovenda: Real; data: TDateTime;
  opcaixa: Real; tipz: String; seq_caixa,seq_credito: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO CAIXA_DINHEIRO (LOJA,TERMINAL,CODIGOVENDA,DATA,FUNC,TIPZ,SEQCAIXA,SEQCREDITO)     ');
  clAux.AddParam ('VALUES (:LOJA,:TERMINAL,:CODIGOVENDA,:DATA,:FUNC,:TIPZ,:SEQCAIXA,:SEQCREDITO)                 ');
  clAux.consulta.parambyname('LOJA').AsFloat         := loja;
  clAux.consulta.parambyname('DATA').AsDateTime      := data;
  clAux.consulta.parambyname('TERMINAL').AsFloat     := terminal;
  clAux.consulta.parambyname('CODIGOVENDA').AsFloat  := codigovenda;
  clAux.consulta.parambyname('FUNC').AsFloat         := opcaixa;
  clAux.consulta.parambyname('TIPZ').AsString        := tipz;
  clAux.consulta.parambyname('SEQCAIXA').AsFloat     := seq_caixa;
  clAux.consulta.parambyname('SEQCREDITO').AsFloat   := seq_credito;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure RemoveAmarracaoDinheiroCaixaCredito (loja,terminal,codigovenda: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CAIXA_DINHEIRO                   ');
  clAux.AddParam ('WHERE (LOJA        =:LOJA) AND               ');
  clAux.AddParam ('      (TERMINAL    =:TERMINAL) AND           ');
  clAux.AddParam ('      (CODIGOVENDA =:CODIGOVENDA)            ');
  clAux.consulta.parambyname('LOJA').AsFloat        := loja;
  clAux.consulta.parambyname('TERMINAL').AsFloat    := terminal;
  clAux.consulta.parambyname('CODIGOVENDA').AsFloat := codigovenda;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure GeraAmarracaoCrediarioCaixaCredito (cliente,contrato,prestacao: Real; seq_caixa,seq_credito: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO CAIXA_CREDIARIO (CLIENTE,CONTRATO,PRESTACAO,SEQCAIXA,SEQCREDITO)    ');
  clAux.AddParam ('VALUES (:CLIENTE,:CONTRATO,:PRESTACAO,:SEQCAIXA,:SEQCREDITO)                    ');
  clAux.consulta.parambyname('CLIENTE').AsFloat      := cliente;
  clAux.consulta.parambyname('CONTRATO').AsFloat     := contrato;
  clAux.consulta.parambyname('PRESTACAO').AsFloat    := prestacao;
  clAux.consulta.parambyname('SEQCAIXA').AsFloat     := seq_caixa;
  clAux.consulta.parambyname('SEQCREDITO').AsFloat   := seq_credito;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure RemoveAmarracaoCrediarioCaixaCredito (cliente,contrato,prestacao: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CAIXA_CREDIARIO                  ');
  clAux.AddParam ('WHERE (CLIENTE   =:CLIENTE) AND              ');
  clAux.AddParam ('      (CONTRATO  =:CONTRATO) AND             ');
  clAux.AddParam ('      (PRESTACAO =:PRESTACAO)                ');
  clAux.consulta.parambyname('CLIENTE').AsFloat   := cliente;
  clAux.consulta.parambyname('CONTRATO').AsFloat  := contrato;
  clAux.consulta.parambyname('PRESTACAO').AsFloat := prestacao;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure GeraLancamentos_Crediario (cliente,contrato,prestacao,loja,plano: Real; valor: Real;
  data: TDateTime; tipz: String;fpgto:Real=0);
var
  clConf: TClassAuxiliar;
  seq_caixa,seq_credito: Real;
  doc,formadepagamento:String;
begin
  doc := 'CR'+FloatToStr(cliente)+'.'+FloatToStr(contrato)+'.'+FloatToStr(prestacao);

  clConf := TClassAuxiliar.Create;
  clConf.conect   ('CREDITO',frm_principal);
  with clconf.consulta do
  begin
    sql.add('Select CONTA as CONTARECEBER,CONTACAIXA from Config_Plano_Cred where Fpgto =:Forma and (loja = :loja or loja = 0)');
    sql.add('Order by loja desc');
    parambyname('Loja').AsFloat  := Loja;
    parambyname('Forma').AsFloat := Fpgto;
    open;
  end;
     //************************************************************************************

  if clconf.consulta.eof then
  begin
    clConf.ClearSql;
    clconf.consulta.databasename := 'ESTOQUE';
    clConf.AddParam ('SELECT CONTARECEBER,CONTACAIXA FROM CONFIG_CREDITOS_CAIXA           ');
    clConf.AddParam ('WHERE (LOJA='+floattostr(loja)+') AND                               ');
    clConf.AddParam ('      (TIPO=5) AND                                                  ');
    clConf.AddParam ('      (PLANO='+floattostr(plano)+')                                 ');
  end
  else
    formadepagamento := ProcuraNomeFormaPrestacao(fpgto,nil);

  if clconf.consulta.active or clConf.Execute then
  begin
    if (clConf.Result('CONTACAIXA')<>0) then
      seq_caixa := GeraLancamentoCaixa (loja,
        clConf.Result('CONTACAIXA'),
        valor,
        data,
        'CLI:'+form_nz(cliente,6)+' - CTR:'+form_nz(contrato,6)+' - PREST:'+form_nz(prestacao,2)+iifs(formadepagamento <> '',' FORMA: '+Formadepagamento,''),
        iifs(formadepagamento <> '',formadepagamento,'CREDIARIO'),
        tipz,doc);
    if (clConf.Result('CONTARECEBER')<>0) then
      seq_credito := GeraLancamentoCredito (loja,
        clConf.Result('CONTARECEBER'),
        valor,
        data,
        'CLI:'+form_nz(cliente,6)+' - CTR:'+form_nz(contrato,6)+' - PREST:'+form_nz(prestacao,2)+iifs(formadepagamento <> '',' FORMA: '+Formadepagamento,''),
        iifs(formadepagamento <> '',formadepagamento,'CREDIARIO'),
        tipz,doc);
    GeraAmarracaoCrediarioCaixaCredito (cliente,contrato,prestacao,seq_caixa,seq_credito);
  end
  else
  begin
    clConf.ClearSql;
    clConf.AddParam ('SELECT CONTARECEBER,CONTACAIXA FROM CONFIG_CREDITOS_CAIXA           ');
    clConf.AddParam ('WHERE (LOJA='+floattostr(loja)+') AND                               ');
    clConf.AddParam ('      (TIPO=5)                                                      ');
    if (clConf.Execute) then
    begin
      if (clConf.Result('CONTACAIXA')<>0) then
        seq_caixa := GeraLancamentoCaixa (loja,
          clConf.Result('CONTACAIXA'),
          valor,
          data,
          'CLI:'+form_nz(cliente,6)+' - CTR:'+form_nz(contrato,6)+' - PREST:'+form_nz(prestacao,2),
          'CREDIARIO',
          tipz,doc);
      if (clConf.Result('CONTARECEBER')<>0) then
        seq_credito := GeraLancamentoCredito (loja,
          clConf.Result('CONTARECEBER'),
          valor,
          data,
          'CLI:'+form_nz(cliente,6)+' - CTR:'+form_nz(contrato,6)+' - PREST:'+form_nz(prestacao,2),
          'CREDIARIO',
          tipz,doc);
      GeraAmarracaoCrediarioCaixaCredito (cliente,contrato,prestacao,seq_caixa,seq_credito);
    end;
  end;
  clConf.desconect;
  clConf.Free;
end;

procedure RemoveLancamentos_Crediario (cliente,contrato,prestacao: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SEQCAIXA,SEQCREDITO                   ');
  clAux.AddParam ('FROM   CAIXA_CREDIARIO                       ');
  clAux.AddParam ('WHERE (CLIENTE    = :CLIENTE) AND            ');
  clAux.AddParam ('      (CONTRATO   = :CONTRATO) AND           ');
  clAux.AddParam ('      (PRESTACAO  = :PRESTACAO)              ');
  clAux.consulta.parambyname('CLIENTE').AsFloat   := cliente;
  clAux.consulta.parambyname('CONTRATO').AsFloat  := contrato;
  clAux.consulta.parambyname('PRESTACAO').AsFloat := prestacao;
  if (clAux.Execute) then
  begin
    RemoveAmarracaoCrediarioCaixaCredito (cliente,contrato,prestacao);
    RemoveLancamentoCaixa (clAux.result('SEQCAIXA')); {*}
    RemoveLancamentoCredito (clAux.result('SEQCREDITO')); {*}
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure GeraLancamentos_Diverso (loja: Real; tipo: Integer; contadiversa,valor: Real; data: TDateTime;
  descricao,tipodesc,tipz: String; seq_diverso: Real);
var
  clConf: TClassAuxiliar;
  seq_caixa: Real;
begin
     //************************************************************************************
  clConf := TClassAuxiliar.Create;
  clConf.conect   ('ESTOQUE',frm_principal);
  clConf.ClearSql;
  clConf.AddParam ('SELECT CONTACAIXA FROM CONFIG_CAIXA_LANC_DIVERSOS                   ');
  clConf.AddParam ('WHERE (LOJA='+floattostr(loja)+') AND                               ');
  clConf.AddParam ('      (TIPO=:tipo) AND                                              ');
  clConf.AddParam ('      (TODOSOSTIPOS=:todosostipos) AND                              ');
  clConf.AddParam ('      (CONTADIVERSA=:contadiversa) AND                              ');
  clConf.AddParam ('      (TODASCONTASDIVERSAS=:todascontasdiversas)                    ');
  clConf.consulta.parambyname('tipo').AsInteger                := tipo;
  clConf.consulta.parambyname('todosostipos').AsString         := '0';
  clConf.consulta.parambyname('contadiversa').AsFloat          := contadiversa;
  clConf.consulta.parambyname('todascontasdiversas').AsString  := '0';
  if (clConf.Execute) then
  begin
    if (clConf.Result('CONTACAIXA')<>0) then
      seq_caixa := GeraLancamentoCaixa (loja,
        clConf.Result('CONTACAIXA'),
        valor,
        data,
        descricao,
        tipodesc,
        tipz);
    GeraAmarracaoDiversoCaixa (seq_diverso,seq_caixa);
  end
  else
  begin
    clConf.ClearSql;
    clConf.AddParam ('SELECT CONTACAIXA FROM CONFIG_CAIXA_LANC_DIVERSOS                   ');
    clConf.AddParam ('WHERE (LOJA='+floattostr(loja)+') AND                               ');
    clConf.AddParam ('      (TODOSOSTIPOS=:todosostipos) AND                              ');
    clConf.AddParam ('      (CONTADIVERSA=:contadiversa) AND                              ');
    clConf.AddParam ('      (TODASCONTASDIVERSAS=:todascontasdiversas)                    ');
    clConf.consulta.parambyname('todosostipos').AsString         := '1';
    clConf.consulta.parambyname('contadiversa').AsFloat          := contadiversa;
    clConf.consulta.parambyname('todascontasdiversas').AsString  := '0';
    if (clConf.Execute) then
    begin
      if (clConf.Result('CONTACAIXA')<>0) then
        seq_caixa := GeraLancamentoCaixa (loja,
          clConf.Result('CONTACAIXA'),
          valor,
          data,
          descricao,
          tipodesc,
          tipz);
      GeraAmarracaoDiversoCaixa (seq_diverso,seq_caixa);
    end
    else
    begin
      clConf.ClearSql;
      clConf.AddParam ('SELECT CONTACAIXA FROM CONFIG_CAIXA_LANC_DIVERSOS                   ');
      clConf.AddParam ('WHERE (LOJA='+floattostr(loja)+') AND                               ');
      clConf.AddParam ('      (TODOSOSTIPOS=:todosostipos) AND                              ');
      clConf.AddParam ('      (TODASCONTASDIVERSAS=:todascontasdiversas)                    ');
      clConf.consulta.parambyname('todosostipos').AsString         := '1';
      clConf.consulta.parambyname('todascontasdiversas').AsString  := '1';
      if (clConf.Execute) then
      begin
        if (clConf.Result('CONTACAIXA')<>0) then
          seq_caixa := GeraLancamentoCaixa (loja,
            clConf.Result('CONTACAIXA'),
            valor,
            data,
            descricao,
            tipodesc,
            tipz);
        GeraAmarracaoDiversoCaixa (seq_diverso,seq_caixa);
      end;
    end;
  end;
  clConf.desconect;
  clConf.Free;
end;

procedure RemoveLancamentos_Diverso (seq_diverso: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SEQCAIXA                              ');
  clAux.AddParam ('FROM   CAIXA_DIVERSO                         ');
  clAux.AddParam ('WHERE (SEQDIVERSO =:SEQDIVERSO)              ');
  clAux.consulta.parambyname('SEQDIVERSO').AsFloat := seq_diverso;
  if (clAux.Execute) then
  begin
    RemoveAmarracaoDiversoCaixa (seq_diverso);
    RemoveLancamentoCaixa (clAux.result('SEQCAIXA')); {*}
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure GeraAmarracaoDiversoCaixa (seq_diverso,seq_caixa: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO CAIXA_DIVERSO (SEQDIVERSO,SEQCAIXA)     ');
  clAux.AddParam ('VALUES (:SEQDIVERSO,:SEQCAIXA)                      ');
  clAux.consulta.parambyname('SEQDIVERSO').AsFloat   := seq_diverso;
  clAux.consulta.parambyname('SEQCAIXA').AsFloat     := seq_caixa;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure RemoveAmarracaoDiversoCaixa (seq_diverso: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CAIXA_DIVERSO                    ');
  clAux.AddParam ('WHERE (SEQDIVERSO =:SEQDIVERSO)              ');
  clAux.consulta.parambyname('SEQDIVERSO').AsFloat := seq_diverso;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure GeraLancamentosOutros (loja,terminal,codigovenda: Real; data: TDateTime; opcaixa: Real;
  valor: Real; tipz: String;Fp,op:Real;sangria:Boolean=false;chequesg:String='';oldloja:Real=0;supr:Boolean=false;obs:String='';
  Motivoconta:Boolean=false;FQryMotvConta:TClassAuxiliar=nil);
var
  clConf: TClassAuxiliar;
  seq_caixa,seq_credito: Real;
  compCartaoCaix,compCartaoLanc,compChequeCaix,compChequeLanc:Boolean;
begin

     //************************************************************************************

  if motivoconta and (fQryMotvconta <> nil) then
    Clconf := FQryMotvConta
  else
  begin
    clConf := TClassAuxiliar.Create;
    clConf.conect   ('ESTOQUE',frm_principal);

    clConf.ClearSql;
    clConf.AddParam ('SELECT compCartaoCaix,compCartaoLanc,compChequeCaix,compChequeLanc FROM CONF');
    clconf.execute;

    compCartaoLanc := ClConf.Result('compCartaoLanc') = '1';
    compCartaoCaix := ClConf.Result('compCartaoCaix') = '1';

    compChequeLanc := ClConf.Result('compChequeLanc') = '1';
    compChequeCaix := ClConf.Result('compChequeCaix') = '1';

    clConf.ClearSql;
    clConf.AddParam ('SELECT CONTARECEBER,CONTACAIXA,BANCO FROM CONFIG_CREDITOS_CAIXA           ');
    clConf.AddParam ('WHERE (LOJA='+floattostr(loja)+') AND                               ');
    clConf.AddParam ('      (TIPO=:TIPO)                                                     ');
    if fp = 2 then
    begin
      clconf.addparam ('  AND (TODOSBANCOS = 1 or Banco=:Banco or banco is null or banco = 0)');
      clconf.consulta.parambyname('Banco').AsFloat := op;
      clconf.addparam ('  Order by banco '+iifs(op > 0,'desc',''));
    end
    else
    if (fp = 3) or (fp = 4) then
    begin
      clconf.addparam(' And (TodosAdms = 1 or Adm=:Banco or adm = 0 or adm is null)');
      clconf.consulta.parambyname('Banco').AsFloat := op;
      clconf.addparam(' Order by adm '+iifs(op > 0,'desc',''));
    end;
    clconf.consulta.parambyname('Tipo').AsFloat  := fp;
    if not clConf.Execute then
      exit;
  end;


  if (clConf.Result('CONTACAIXA')<>0) and not(((fp = 3) or (fp = 4)) and compCartaoCaix) and
    not((fp = 2) and compChequeCaix) then
    seq_caixa := GeraLancamentoCaixa (loja,
      clConf.Result('CONTACAIXA'),
      valor,
      data,
      form_t(iifs(sangria,iifs(supr,'SUPRIMENTO LOJA ','SANGRIA LOJA ')+iifs(valor > 0,floattostr(oldLoja),'')+' - OP:','VENDA EFETUADA NA LOJA - OP:')+floattostr(opcaixa)+
      iifs(not sangria,'/'+ProcuraNomeVendCaixa(iifs((valor > 0) and sangria,oldLoja,loja),opcaixa,frm_principal)+' '+UpperCase(ProcuraNomeFormaPgto(Fp,nil)),' -'+obs)
      +' '+iifs(chequesg <> '','CHEQUE '+chequesg,''),60),
      UpperCase(ProcuraNomeFormaPgto(Fp,nil)),
      tipz,
      iifs(sangria,'SG.','')+floattostr(iifs((valor > 0) and sangria,oldLoja,loja))+'.'+iifs(Sangria and (chequesg <> ''),chequesg,floattostr(terminal)+'.'+floattostr(codigovenda)));

  if (clConf.Result('CONTARECEBER')<>0) and not(((fp = 3) or (fp = 4)) and compCartaoLanc) and
    not((fp = 2) and compChequeLanc) then
    seq_credito := GeraLancamentoCredito(loja,
      clConf.Result('CONTARECEBER'),
      valor,
      data,
      form_t(iifs(sangria,iifs(supr,'SUPRIMENTO LOJA ','SANGRIA LOJA ')+iifs(valor > 0,floattostr(oldLoja),'')+' - OP:','VENDA EFETUADA NA LOJA - OP:')+floattostr(opcaixa)+
      iifs(not sangria,'/'+ProcuraNomeVendCaixa(iifs((valor > 0) and sangria,oldLoja,loja),opcaixa,frm_principal)+' '+UpperCase(ProcuraNomeFormaPgto(Fp,nil)),' -'+obs)
      +' '+iifs(chequesg <> '','CHEQUE '+chequesg,''),60),
      UpperCase(ProcuraNomeFormaPgto(Fp,nil)),
      tipz,
      iifs(sangria,'SG.','')+floattostr(iifs((valor > 0) and sangria,oldLoja,loja))+'.'+iifs(Sangria and (chequesg <> ''),chequesg,floattostr(terminal)+'.'+floattostr(codigovenda)));

  if not(motivoconta and (fQryMotvconta <> nil)) then
  begin
    clConf.desconect;
    clConf.Free;
  end;  
end;

end.
