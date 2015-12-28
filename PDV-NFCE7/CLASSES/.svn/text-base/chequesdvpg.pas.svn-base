{*** classe geral de acesso a entidade plano de pagamento}
unit chequesdvpg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassChequeDevPg = class(TObject)
  private
    consulta: TQuery;
  public
    inCH_BANC: Real;
    inCH_CCGC: String;
    inCH_NUME: Real;
    inCH_CLIE: Real;
    inCH_DTCT: TDateTime; {data de emissao do cheque, a mesma do contrato}
    inCH_NOME: String;
    inCH_FONE: String;
    inCH_LOJA: Real;
    inCH_DTEM: TDateTime; {data de entrada do cheque como devolvido}
    inCH_DVTO: TDateTime; {data de vencimento do cheque}
    inCH_DTPG: TDateTime; {data da baixa do cheque devolvido}
    inCH_PORT: Real;
    inCH_AGEN: String;
    inCH_VALO: Real;
    inCH_ALIN: String; {alinea}
    inCH_STAT: String;
    inCH_OBS:  String;
    inCH_VAPG: Real; {valor pago, com juros ou nao}
    inCH_POR2: Real;  {portador de pagamento}
    inCH_TIME: TDateTime;
    inCH_DTRA: TDateTime;  {data de transferencia ***}
    inCH_TRAN: Integer;    {n. da transferencia ***}

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
function TClassChequeDevPg.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassChequeDevPg.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassChequeDevPg.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassChequeDevPg.Result (campo: String) :Variant;
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
function TClassChequeDevPg.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassChequeDevPg.ClearFields:Boolean;
begin
  inCH_BANC := 0;
  inCH_NUME := 0;
  inCH_CCGC := '';
  inCH_CLIE := 0;
  inCH_DTCT := strtodate('01/01/1900');
  inCH_LOJA := 0;
  inCH_DTEM := strtodate('01/01/1900');
  inCH_DVTO := strtodate('01/01/1900');
  inCH_PORT := 0;
  inCH_AGEN := '';
  inCH_VALO := 0;
  inCH_ALIN := '';
  inCH_STAT := '0';
  inCH_OBS  := '';
  inCH_VAPG := 0.00;
  inCH_POR2 := 0;
  inCH_NOME := '';
  inCH_TIME := strtodate('01/01/1900');
  inCH_DTRA := strtodate('01/01/1900');
  inCH_TRAN := 0;
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassChequeDevPg.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassChequeDevPg.Execute:Boolean;
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
function TClassChequeDevPg.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into                                                               ');
  consulta.Sql.Add     ('CRECHDVPG (CH_CLIE,CH_CCGC,CH_NUME,CH_DTCT,CH_LOJA,CH_DTEM,               ');
  consulta.Sql.Add     ('           CH_DVTO,CH_PORT,CH_BANC,CH_AGEN,CH_VALO,CH_DTPG,               ');
  consulta.Sql.Add     ('           CH_ALIN,CH_VAPG,CH_OBS,CH_POR2,CH_NOME ,CH_TIME,               ');
  consulta.Sql.Add     ('           CH_DTRA,CH_TRAN)                                               ');
  consulta.Sql.Add     ('Values    (:ch_clie,:ch_ccgc, :ch_nume, :ch_dtct, :ch_loja, :ch_dtem,     ');
  consulta.Sql.Add     ('          :ch_dvto,:ch_port, :ch_banc, :ch_agen, :ch_valo,                ');
  consulta.Sql.Add     ('          :ch_dtpg,:ch_alin,:ch_vapg,:ch_obs,:ch_por2,:ch_nome,:ch_time,  ');
  consulta.Sql.Add     ('          :ch_dtra,:ch_tran)                                              ');
  consulta.ParamByName ('ch_banc').AsFloat    := inCH_BANC;
  consulta.ParamByName ('ch_nume').AsFloat    := inCH_NUME;
  consulta.ParamByName ('ch_ccgc').AsString   := inCH_CCGC;
  consulta.ParamByName ('ch_dtct').AsDateTime := inCH_DTCT;
  consulta.ParamByName ('ch_dtem').AsDateTime := inCH_DTEM;
  consulta.ParamByName ('ch_clie').AsFloat    := inCH_CLIE;
  consulta.ParamByName ('ch_loja').AsFloat    := inCH_LOJA;
  consulta.ParamByName ('ch_dvto').AsDateTime := inCH_DVTO;
  consulta.ParamByName ('ch_dtpg').AsDateTime := inCH_DTPG;
  consulta.ParamByName ('ch_port').AsFloat    := inCH_PORT;
  consulta.ParamByName ('ch_agen').AsString   := inCH_AGEN;
  consulta.ParamByName ('ch_valo').AsFloat    := inCH_VALO;
  consulta.ParamByName ('ch_alin').AsString   := inCH_ALIN;
  consulta.ParamByName ('ch_vapg').AsFloat    := inCH_VAPG;
  consulta.ParamByName ('ch_obs').AsString    := inCH_OBS;
  consulta.ParamByName ('ch_por2').AsFloat    := inCH_POR2;
  consulta.ParamByName ('ch_nome').AsString   := inCH_NOME;
  consulta.ParamByName ('ch_time').AsDateTime := inCH_TIME;
  consulta.ParamByName ('ch_dtra').AsDateTime := inCH_DTRA;
  consulta.ParamByName ('ch_tran').AsInteger  := inCH_TRAN;
  consulta.ExecSql;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassChequeDevPg.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CRECHDVPG                                              ');
  consulta.Sql.Add     ('Set    CH_CCGC=:ch_ccgc, CH_NUME=:ch_nume, CH_DTEM=:ch_dtem,  ');
  consulta.Sql.Add     ('       CH_DTCT=:ch_dtct, CH_CLIE=:ch_clie, CH_DTPG=:ch_dtpg,  ');
  consulta.Sql.Add     ('       CH_LOJA=:ch_loja, CH_DVTO=:ch_dvto, CH_PORT=:ch_port,  ');
  consulta.Sql.Add     ('       CH_BANC=:ch_banc, CH_AGEN=:ch_agen, CH_OBS =:ch_obs,   ');
  consulta.Sql.Add     ('       CH_VALO=:ch_valo, CH_ALIN=:ch_alin, CH_VAPG=:ch_vapg,  ');
  consulta.Sql.Add     ('       CH_POR2=:ch_por2, CH_NOME=:ch_nome, CH_TIME=:ch_time,  ');
  consulta.Sql.Add     ('       CH_DTRA=:ch_dtra, CH_TRAN=:ch_tran                     ');
  consulta.Sql.Add     ('Where (CH_BANC=:ch_banc) AND                                  ');
  consulta.Sql.Add     ('      (CH_NUME=:ch_nume) AND                                  ');
  consulta.Sql.Add     ('      (CH_CCGC=:ch_ccgc)                                      ');
  consulta.ParamByName ('ch_banc').AsFloat    := inCH_BANC;
  consulta.ParamByName ('ch_nume').AsFloat    := inCH_NUME;
  consulta.ParamByName ('ch_ccgc').AsString   := inCH_CCGC;
  consulta.ParamByName ('ch_dtct').AsDateTime := inCH_DTCT;
  consulta.ParamByName ('ch_dtem').AsDateTime := inCH_DTEM;
  consulta.ParamByName ('ch_clie').AsFloat    := inCH_CLIE;
  consulta.ParamByName ('ch_loja').AsFloat    := inCH_LOJA;
  consulta.ParamByName ('ch_dvto').AsDateTime := inCH_DVTO;
  consulta.ParamByName ('ch_dtpg').AsDateTime := inCH_DTPG;
  consulta.ParamByName ('ch_port').AsFloat    := inCH_PORT;
  consulta.ParamByName ('ch_agen').AsString   := inCH_AGEN;
  consulta.ParamByName ('ch_valo').AsFloat    := inCH_VALO;
  consulta.ParamByName ('ch_alin').AsString   := inCH_ALIN;
  consulta.ParamByName ('ch_vapg').AsFloat    := inCH_VAPG;
  consulta.ParamByName ('ch_obs').AsString    := inCH_OBS;
  consulta.ParamByName ('ch_por2').AsFloat    := inCH_POR2;
  consulta.ParamByName ('ch_nome').AsString   := inCH_NOME;
  consulta.ParamByName ('ch_time').AsDateTime := inCH_TIME;
  consulta.ParamByName ('ch_dtra').AsDateTime := inCH_DTRA;
  consulta.ParamByName ('ch_tran').AsInteger  := inCH_TRAN;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassChequeDevPg.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassChequeDevPg.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassChequeDevPg.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassChequeDevPg.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassChequeDevPg.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassChequeDevPg.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassChequeDevPg.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

end.
