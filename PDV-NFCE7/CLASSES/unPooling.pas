unit unPooling;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers, DbTables, Db;

{funções de verificação}
function VerificaGravacaoLocal(loja,caixa,seqvenda,vendedor:Real;data:TDateTime): Boolean;
function VerificaGravacaoOnLine: Boolean;
function GravaOnline:Boolean;

implementation

uses principal, un_FechamentoVenda, venda, funcoes1, auxiliar, funcoesglobais;

function VerificaGravacaoLocal(loja,caixa,seqvenda,vendedor:Real;data:TDateTime):Boolean;
var
  clAux: TClassAuxiliar;
  continua: Boolean;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect('VENDAS',frm_principal);
  clAux.ClearSql;
        //*******************************************
  clAux.AddParam('SELECT * ');
  clAux.AddParam('FROM VENDAS');
  clAux.AddParam('WHERE (VE_LOJA='+floattostr(loja)+') AND     ');
  clAux.AddParam('      (VE_CAIX='+floattostr(caixa)+') AND    ');
  clAux.AddParam('      (VE_CODI='+floattostr(seqvenda)+') AND ');
  clAux.AddParam('      (VE_DATA='+floattostr(data)+')         ');
  if (clAux.Execute) then
    continua := true
  else
    continua := false;
  if (continua) then
  begin
    clAux.ClearSql;
    clAux.AddParam('SELECT * ');
    clAux.AddParam('FROM ITENS_VENDAS');
    clAux.AddParam('WHERE (IV_DATA='+floattostr(data)+') AND ');
    clAux.AddParam('      (IV_LOJA='+floattostr(loja)+') AND ');
    clAux.AddParam('      (IV_CAIX='+floattostr(caixa)+') AND ');
  end;
  clAux.Desconect;
  clAux.Free;
end;

function VerificaGravacaoOnLine:Boolean;
begin
end;

function GravaOnline:Boolean;
begin
end;

end.
 