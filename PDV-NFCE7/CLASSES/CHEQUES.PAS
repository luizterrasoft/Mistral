{*** classe geral de acesso a entidade plano de pagamento}
unit cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassCheque = class(TObject)
  private
    consulta: TQuery;
  public    
    inCH_CCGC: String;
    inCH_BANC: Real;
    inCH_AGEN: String;
    inCH_NUME: Real;
    inCH_DTCT: TDateTime; {data de emissao do cheque}
    inCH_NOME: String;
    inCH_FONE: String;
    inCH_LOJA: Real;
    inCH_DVTO: TDateTime;
    inCH_PORT: Real;
    inCH_DTRA: TDateTime; {data da transferencia}
    inCH_TRAN: Real;  {numero da transferencia}
    inCH_VALO: Real;
    inCH_OBS:  String;
    inCH_CLIE: Real;
    inCH_STAT: String; {nao é usado mais ????}
    inCH_TIME: TDateTime;

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
function TClassCheque.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassCheque.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassCheque.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassCheque.Result (campo: String) :Variant;
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
function TClassCheque.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassCheque.ClearFields:Boolean;
begin
  inCH_CCGC := '';
  inCH_NUME := 0;
  inCH_DTCT := strtodate('01/01/1900');
  inCH_NOME := '';
  inCH_FONE := '';
  inCH_LOJA := 0;
  inCH_DVTO := strtodate('01/01/1900');
  inCH_PORT := 0;
  inCH_BANC := 0;
  inCH_AGEN := '';
  inCH_DTRA := strtodate('01/01/1900');
  inCH_TRAN := 0;
  inCH_VALO := 0;
  inCH_OBS  := '';
  inCH_STAT := '0';
  inCH_TIME := strtodate('01/01/1900');
  inCH_CLIE := 0;
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassCheque.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassCheque.Execute:Boolean;
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
function TClassCheque.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('CRECHMOV (CH_CCGC,CH_NUME,CH_DTCT,CH_NOME,CH_FONE,CH_LOJA, ');
  consulta.Sql.Add     ('          CH_DVTO,CH_PORT,CH_BANC,CH_AGEN,CH_DTRA,CH_TRAN,CH_VALO, ');
  consulta.Sql.Add     ('          CH_OBS, CH_CLIE, CH_STAT,CH_TIME)');
  consulta.Sql.Add     ('Values  (:ch_ccgc, :ch_nume, :ch_dtct, :ch_nome, :ch_fone, :ch_loja, ');
  consulta.Sql.Add     ('         :ch_dvto,:ch_port, :ch_banc, :ch_agen, :ch_dtra, :ch_tran, :ch_valo,  ');
  consulta.Sql.Add     ('         :ch_obs, :ch_clie, :ch_stat, :ch_time) ');
  consulta.ParamByName ('ch_ccgc').AsString   := inCH_CCGC;
  consulta.ParamByName ('ch_nume').AsFloat    := inCH_NUME;
  consulta.ParamByName ('ch_dtct').AsDateTime := inCH_DTCT;
  consulta.ParamByName ('ch_nome').AsString   := inCH_NOME;
  consulta.ParamByName ('ch_fone').AsString   := inCH_FONE;
  consulta.ParamByName ('ch_loja').AsFloat    := inCH_LOJA;
  consulta.ParamByName ('ch_dvto').AsDateTime := inCH_DVTO;
  consulta.ParamByName ('ch_port').AsFloat    := inCH_PORT;
  consulta.ParamByName ('ch_banc').AsFloat    := inCH_BANC;
  consulta.ParamByName ('ch_agen').AsString   := inCH_AGEN;
  consulta.ParamByName ('ch_dtra').AsDateTime := inCH_DTRA;
  consulta.ParamByName ('ch_tran').AsFloat    := inCH_TRAN;
  consulta.ParamByName ('ch_valo').AsFloat    := inCH_VALO;
  consulta.ParamByName ('ch_obs').AsString    := inCH_OBS;
  consulta.ParamByName ('ch_clie').AsFloat    := inCH_CLIE;
  consulta.ParamByName ('ch_stat').AsString   := inCH_STAT;
  consulta.ParamByName ('ch_time').AsDateTime := inCH_TIME;
  consulta.ExecSql;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassCheque.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CRECHMOV ');
  consulta.Sql.Add     ('Set    CH_CLIE=:ch_clie, CH_CCGC=:ch_ccgc, CH_NUME=:ch_nume, ');
  consulta.Sql.Add     ('       CH_DTCT=:ch_dtct, CH_NOME=:ch_nome, CH_FONE=:ch_fone, ');
  consulta.Sql.Add     ('       CH_LOJA=:ch_loja, CH_DVTO=:ch_dvto, CH_PORT=:ch_port, ');
  consulta.Sql.Add     ('       CH_BANC=:ch_banc, CH_AGEN=:ch_agen, CH_DTRA=:ch_dtra, ');
  consulta.Sql.Add     ('       CH_TRAN=:ch_tran, CH_VALO=:ch_valo, CH_OBS =:ch_obs,  ');
  consulta.Sql.Add     ('       CH_STAT=:ch_stat, CH_TIME=:ch_time                    ');
  consulta.Sql.Add     ('Where (CH_CCGC=:ch_ccgc) AND ');
  consulta.Sql.Add     ('      (CH_BANC=:ch_banc) AND ');
  consulta.Sql.Add     ('      (CH_NUME=:ch_nume) ');
  consulta.ParamByName ('ch_ccgc').AsString   := inCH_CCGC;
  consulta.ParamByName ('ch_nume').AsFloat    := inCH_NUME;
  consulta.ParamByName ('ch_dtct').AsDateTime := inCH_DTCT;
  consulta.ParamByName ('ch_nome').AsString   := inCH_NOME;
  consulta.ParamByName ('ch_fone').AsString   := inCH_FONE;
  consulta.ParamByName ('ch_loja').AsFloat    := inCH_LOJA;
  consulta.ParamByName ('ch_dvto').AsDateTime := inCH_DVTO;
  consulta.ParamByName ('ch_port').AsFloat    := inCH_PORT;
  consulta.ParamByName ('ch_banc').AsFloat    := inCH_BANC;
  consulta.ParamByName ('ch_agen').AsString   := inCH_AGEN;
  consulta.ParamByName ('ch_dtra').AsDateTime := inCH_DTRA;
  consulta.ParamByName ('ch_tran').AsFloat    := inCH_TRAN;
  consulta.ParamByName ('ch_valo').AsFloat    := inCH_VALO;
  consulta.ParamByName ('ch_obs').AsString    := inCH_OBS;
  consulta.ParamByName ('ch_clie').AsFloat    := inCH_CLIE;
  consulta.ParamByName ('ch_stat').AsString   := inCH_STAT;
  consulta.ParamByName ('ch_time').AsDateTime := inCH_TIME;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassCheque.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassCheque.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassCheque.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassCheque.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassCheque.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassCheque.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassCheque.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

end.
