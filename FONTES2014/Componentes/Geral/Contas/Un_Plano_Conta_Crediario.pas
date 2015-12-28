unit Un_Plano_Conta_Crediario;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  DBTables, DB, DBCtrls, Forms, Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls,
  Printers, Mask, FileCtrl, gauges,db,dbtables,funcoesglobais;


function GeraLancamentoContaCred (centrodecusto,codigocontacaixa: real; valor: real;
   data: TDateTime; descricao,tipo,tipz: string):real;

implementation

uses caixa;

function GeraLancamentoCaixa (Tabela:String;centrodecusto,forma,banco,valor: real;data:tdatetime;tipz:string='1'):real;
var
fquery,fquery2: TQuery;

function gravatabelacaixa(tabela:string):real;
var
saldo_anterior,saldo_anterior2: real;
begin

     with fquery do begin
      sql.clear;
      Sql.Add ('INSERT INTO '+Tabela);
      sql.add (' (LA_SEQ,LA_CONT,LA_DATA,LA_VALO,LA_NATU,LA_CUST,LA_TIPZ,LA_SALD,LA_SAL2,LA_SALA,LA_SAA2,LA_DESC,LA_TIPO,LA_TIME) ');
      Sql.Add ('VALUES (:LA_SEQ,:LA_CONT,:LA_DATA,:LA_VALO,:LA_NATU,:LA_CUST,:LA_TIPZ,:LA_SALD,:LA_SAL2,:LA_SALA,:LA_SAA2,:LA_DESC,:LA_TIPO,:LA_TIME)                ');
     end;


     if UpperCase(Tabela) <> 'LANCAMENTOS' THEN begin
       saldo_anterior  := DevolveSaldoAtualDoUltimoLancamento (query2.fieldbyname('Conta').AsFloat,Centrodecusto,data); {*}
       saldo_anterior2 := DevolveSaldoAtualTipzDoUltimoLancamento (query2.fieldbyname('Conta').AsFloat,centrodecusto,data);
     end else begin
       saldo_anterior  := 0;
       saldo_anterior2 := 0; {*}
     end;

     with fquery do begin
       parambyname('LA_SEQ').AsFloat     := Round(MaxiCod_contaspagar (Tabela,frm_principal.barraDicas));
       parambyname('LA_CONT').AsFloat    := Query2.fieldbyname('Conta').AsFloat;
       parambyname('LA_DATA').AsDateTime := data;
       if (valor<0.00) then //caso de TROCA / DEVOLUCAO
        parambyname('LA_NATU').AsString   := 'D'
       else parambyname('LA_NATU').AsString   := 'C';
       parambyname('LA_CUST').AsFloat    := centrodecusto;
       parambyname('LA_TIPZ').AsString   := tipz;
       parambyname('LA_SALD').AsFloat    := saldo_anterior + valor;
       parambyname('LA_SAL2').AsFloat    := saldo_anterior2 + valor;
       parambyname('LA_SALA').AsFloat    := saldo_anterior;
       parambyname('LA_SAA2').AsFloat    := saldo_anterior2;
       parambyname('LA_DESC').AsString   := descricao;
       parambyname('LA_TIPO').AsString   := tipo;
       parambyname('LA_TIME').AsDateTime := frm_principal.x_data_trabalho;
       if (valor<0.00) then //caso de TROCA / DEVOLUCAO
          parambyname('LA_VALO').AsFloat    := (-1)*valor
       else parambyname('LA_VALO').AsFloat    := valor;
       execsql;

       if upercase(tabela = 'LANCAMENTOS') THEN begin
           RecalcularSaldosConta     (centrodecusto,query2.fieldbyname('Conta').AsFloat,data);
           RecalcularSaldosConta     (centrodecusto,query2.fieldbyname('Conta').AsFloat,tipz,data);
       end;
     end;

end;

begin
     result := false;
     fquery := tquery.create(application);
     fquery.databasename := 'CONTASAPAGAR';
     fquery2 := tquery.create(application);
     fquery2.databasename := 'Crediario';
     try
       with fquery2 do begin
        sql.clear;
        sql.add('Select * from Config_Plano_Cred where Fpgto =:Forma');
        parambyname('Forma').AsFloat := Forma;
        sql.add('Order by Banco,Loja');
        open;

        if eof then
         exit;

        Fvar :=  VarArrayCreate([0,1],varInteger);
        Fvar[0] :=  FieldByName('Banco').AsInteger;
        Fvar[1] :=  FieldByName('Loja').AsFloat;
        if Not Locate('Banco,Loja',fvar,[]) then
          if not Locate('Banco',fieldbyname('Banco').AsInteger,[]) then
            if not Locate('Loja',FieldByName('Loja').AsFloat,[]) then
              exit;
        end;



       result := true;

       gravatabela('LANCAMENTOS');
       gravatabela('LANCAMENTOS_CONTA_CAIXA');

      finally
       fquery.destroy;
       fquery2.destroy;
      end;





end;


end.
