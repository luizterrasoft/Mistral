{*** classe geral de acesso a entidade plano de pagamento}
unit plano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassPlano = class(TObject)
  private
    consulta: TQuery;
  public
    inPL_CODI,inPL_QTPR: Real;
    inPL_TIPO,inPL_CARN,inPL_BOLE,inPL_BAIX,inPL_CART,inPL_CHEQ,inPL_LOCA: String;
    inPL_EXIB: String;
    inPL_CORE: Integer;
    inPL_CORF: Integer;

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
function TClassPlano.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassPlano.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassPlano.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassPlano.Result (campo: String) :Variant;
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
function TClassPlano.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassPlano.ClearFields:Boolean;
begin
  inPL_CODI  := 0;
  inPL_QTPR  := 0;
  inPL_TIPO  := '';
  inPL_CARN  := '0';
  inPL_BOLE  := '0';
  inPL_BAIX  := '0';
  inPL_CART  := '0';
  inPL_CHEQ  := '0';
  inPL_LOCA  := '0';
  inPL_EXIB  := '0';
  inPL_CORE  := 0;
  inPL_CORF  := 0;
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassPlano.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassPlano.Execute:Boolean;
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
      Execute := true;
      consulta.execsql;
    end;
  end;
end;

{** - Funcao de insercao de clientes }
{Falta acrescentar os outros campos *************}
function TClassPlano.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('CREDPLANO (PL_CODI,PL_TIPO,PL_QTPR,PL_CARN,PL_BOLE,PL_BAIX,PL_CART,PL_CHEQ,PL_LOCA, ');
  consulta.Sql.Add     ('           PL_EXIB,PL_CORE,PL_CORF) ');
  consulta.Sql.Add     ('Values  (:pl_codi,:pl_tipo,:pl_qtpr,:pl_carn,:pl_bole,:pl_baix,:pl_cart,:pl_cheq,:pl_loca, ');
  consulta.Sql.Add     ('          :pl_exib,:pl_core,:pl_corf) ');
  consulta.ParamByName ('pl_codi').AsFloat    := inPL_CODI;
  consulta.ParamByName ('pl_tipo').AsString   := inPL_TIPO;
  consulta.ParamByName ('pl_qtpr').AsFloat    := inPL_QTPR;
  consulta.ParamByName ('pl_carn').AsString   := inPL_CARN;
  consulta.ParamByName ('pl_bole').AsString   := inPL_BOLE;
  consulta.ParamByName ('pl_baix').AsString   := inPL_BAIX;
  consulta.ParamByName ('pl_cart').AsString   := inPL_CART;
  consulta.ParamByName ('pl_cheq').AsString   := inPL_CHEQ;
  consulta.ParamByName ('pl_loca').AsString   := inPL_LOCA;
  consulta.ParamByName ('pl_exib').AsString := inPL_EXIB;
  consulta.ParamByName ('pl_core').AsInteger:= inPL_CORE;
  consulta.ParamByName ('pl_corf').AsInteger := inPL_CORF;
  consulta.ExecSql;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassPlano.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CREDPLANO ');
  consulta.Sql.Add     ('Set    PL_CODI=:pl_codi, PL_TIPO=:pl_tipo, PL_QTPR=:pl_qtpr, ');
  consulta.Sql.Add     ('       PL_CARN=:pl_carn, PL_BOLE=:pl_bole, PL_BAIX=:pl_baix, ');
  consulta.Sql.Add     ('       PL_CART=:pl_cart, PL_CHEQ=:pl_cheq, PL_LOCA=:pl_loca, ');
  consulta.Sql.Add     ('       PL_EXIB=:pl_exib, PL_CORE=:pl_core, PL_CORF=:pl_corf  ');
  consulta.Sql.Add     ('Where (PL_CODI=:pl_codi)');
  consulta.ParamByName ('pl_codi').AsFloat    := inPL_CODI;
  consulta.ParamByName ('pl_tipo').AsString   := inPL_TIPO;
  consulta.ParamByName ('pl_qtpr').AsFloat    := inPL_QTPR;
  consulta.ParamByName ('pl_carn').AsString   := inPL_CARN;
  consulta.ParamByName ('pl_bole').AsString   := inPL_BOLE;
  consulta.ParamByName ('pl_baix').AsString   := inPL_BAIX;
  consulta.ParamByName ('pl_cart').AsString   := inPL_CART;
  consulta.ParamByName ('pl_cheq').AsString   := inPL_CHEQ;
  consulta.ParamByName ('pl_loca').AsString   := inPL_LOCA;
  consulta.ParamByName ('pl_exib').AsString := inPL_EXIB;
  consulta.ParamByName ('pl_core').AsInteger:= inPL_CORE;
  consulta.ParamByName ('pl_corf').AsInteger := inPL_CORF;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassPlano.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassPlano.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassPlano.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassPlano.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassPlano.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassPlano.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassPlano.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

end.
