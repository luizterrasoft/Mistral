{*** classe geral de acesso a entidade plano de pagamento}
unit prestacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassPrestacoes = class(TObject)
  private
    consulta: TQuery;
  public
    inPR_CODI,inPR_NPRE,inPR_PERI,inPR_FATO: Real;

    procedure Conect             (banco: String; Owner: TComponent);
    procedure Desconect          ;

    function  AddParam           (linha: String):Boolean;
    function  Execute            :Boolean;
    function  Result             (campo: String):Variant;

    function  ClearSql           :Boolean;
    function  ClearFields        :Boolean;
    function  Insert             :Boolean;
    function  UpdateAll          :Boolean;
    function  Filter             (filtro: String):Boolean;

    function  Next               :Boolean;
    function  Prior              :Boolean;
    function  First              :Boolean;
    function  Last               :Boolean;
    function  RecCount           :Integer;
    function  Eof                :Boolean;
    function  Bof                :Boolean;
  end;

implementation

{Classe de realizacao do filtro do cliente, apos a classe estar aberta}
function TClassPrestacoes.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassPrestacoes.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassPrestacoes.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassPrestacoes.Result (campo: String) :Variant;
var
  data: TDateTime;
begin
     {se o campo estiver NULO}
  if (consulta.fieldbyname(campo).isNull) then
  begin
          {devolve ZERO para campos numericos}
    if (consulta.fieldbyname(campo).datatype=ftInteger) or
      (consulta.fieldbyname(campo).datatype=ftWord) or
      (consulta.fieldbyname(campo).datatype=ftSmallint) or
      (consulta.fieldbyname(campo).datatype=ftFloat) or
      (consulta.fieldbyname(campo).datatype=ftCurrency) then
      result := 0
             {devolve STRING NULA para campos string}
    else
    if (consulta.fieldbyname(campo).datatype=ftString) then
      result := ''
             {devolve DATA NULA para campos datetime}
    else
    if (consulta.fieldbyname(campo).datatype=ftDateTime) then
    begin
      data := consulta.fieldbyname(campo).asdatetime;
      Result := data;
    end;
  end
  else
  if (consulta.fieldbyname(campo).datatype=ftDateTime) then
  begin
    data := consulta.fieldbyname(campo).asdatetime;
    Result := data;
  end
  else
    Result := consulta.fieldbyname(campo).value{Para campos DATA é feito um trat. especial};
end;

{Limpeza da propriedade SQL da querie criada para selecao}
function TClassPrestacoes.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassPrestacoes.ClearFields:Boolean;
begin
  inPR_CODI  := 0;
  inPR_NPRE  := 0;
  inPR_PERI  := 0;
  inPR_FATO  := 0;
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassPrestacoes.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassPrestacoes.Execute:Boolean;
var
  trecho: String;
begin
  if (consulta.Sql.count=0) then
    Execute := false
  else
  begin
    trecho:=UpperCase(consulta.sql[0]);
    Execute := false;
    if (Pos('SELECT',trecho)>0) then
    begin
      consulta.open;
      if (RecCount=0) then
        Execute := false
      else
        Execute := true;
    end;
    if ((Pos('DELETE',trecho)>0) or (Pos('UPDATE',trecho)>0)) then
    begin
      Execute := false;
      consulta.execsql;
    end;
  end;
end;

{** - Funcao de insercao de clientes }
{Falta acrescentar os outros campos *************}
function TClassPrestacoes.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('CREDPREST (PR_CODI,PR_NPRE, PR_PERI, PR_FATO) ');
  consulta.Sql.Add     ('Values  (:pr_codi,:pr_npre, :pr_peri, :pr_fato) ');
  consulta.ParamByName ('pr_codi').AsFloat    := inPR_CODI;
  consulta.ParamByName ('pr_npre').AsFloat    := inPR_NPRE;
  consulta.ParamByName ('pr_peri').AsFloat    := inPR_PERI;
  consulta.ParamByName ('pr_fato').AsFloat    := inPR_FATO;
  consulta.ExecSql;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassPrestacoes.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CREDPREST ');
  consulta.Sql.Add     ('Set    PR_CODI=:pr_codi,PR_NPRE=:pr_npre, PR_PERI=:pr_peri, PR_FATO=:pr_fato ');
  consulta.Sql.Add     ('Where (PR_CODI=:pr_codi) AND (PR_NPRE=:pr_npre)');
  consulta.ParamByName ('pr_codi').AsFloat    := inPR_CODI;
  consulta.ParamByName ('pr_npre').AsFloat    := inPR_NPRE;
  consulta.ParamByName ('pr_peri').AsFloat    := inPR_PERI;
  consulta.ParamByName ('pr_fato').AsFloat    := inPR_FATO;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassPrestacoes.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassPrestacoes.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassPrestacoes.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassPrestacoes.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassPrestacoes.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassPrestacoes.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassPrestacoes.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;


end.
