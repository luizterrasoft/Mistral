{*** classe geral de acesso a entidade plano de pagamento}
unit prestcontrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassPrestContrat = class(TObject)
  private
    consulta: TQuery;
  public
    inPC_CLIE: Real; 
    inPC_CONT: Real;
    inPC_NPRE: Real;
    inPC_VALO: Real;
    inPC_FATO: Real;
    inPC_DCON: TDateTime;
    inPC_DVTO: TDateTime;
    inPC_DTPG: TDateTime;
    inPC_DTRA: TDateTime;
    inPC_LOJA: Real;
    inPC_PORT: Real;
    inPC_AVAL: Real;
    inPC_PLAN: Real;
    inPC_LJPG: Real;
    inPC_VPAG: Real;
    inPC_SALD: Real;             {??? - nao usado}
    inPC_TPRE: Real;
    inPC_STAT: String;
    inPC_CHEQ: Real;
    inPC_CCGC: String;
    inPC_BANC: Real;
    inPC_NUME: Real;
    inPC_AGEN: String;
    inPC_FPGT: Real;
    inPC_VENDA: Real; {observacao no lancamento do contrato}
    inPC_CAIXA: Real; {observacao no lancamento do contrato}
    inPC_Func : Real; 
    inPC_TIME: TDateTime;

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
function TClassPrestContrat.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassPrestContrat.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassPrestContrat.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassPrestContrat.Result (campo: String) :Variant;
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
function TClassPrestContrat.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassPrestContrat.ClearFields:Boolean;
begin
  inPC_CLIE:= 0;
  inPC_CONT:= 0;
  inPC_NPRE:= 0;
  inPC_VALO:= 0.00;
  inPC_FATO:= 0.00;
  inPC_DCON:= StrToDate('01/01/1900');
  inPC_DVTO:= StrToDate('01/01/1900');
  inPC_DTPG:= StrToDate('01/01/1900');
  inPC_DTRA:= StrToDate('01/01/1900');
  inPC_LOJA:= 0;
  inPC_PORT:= 0;
  inPC_AVAL:= 0;
  inPC_PLAN:= 0;
  inPC_LJPG:= 0;
  inPC_TPRE:= 0;
  inPC_VPAG:= 0.00;
  inPC_SALD:= 0.00;
  inPC_STAT:= '0';
  inPC_CCGC:= '';
  inPC_BANC:= 0;
  inPC_NUME:= 0;
  inPC_AGEN:= '';
  inPC_CHEQ:= 0;
  inPC_FPGT:= 0; 
  inPC_TIME:= StrToDate('01/01/1900');
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassPrestContrat.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassPrestContrat.Execute:Boolean;
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
function TClassPrestContrat.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into                                                               ');
  consulta.Sql.Add     ('CREPRABR (PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DCON,PC_DVTO,        ');
  consulta.Sql.Add     ('          PC_DTPG,PC_LOJA,PC_PORT,PC_AVAL,PC_PLAN,PC_LJPG,PC_VPAG,        ');
  consulta.Sql.Add     ('          PC_SALD,PC_STAT,PC_TPRE,PC_DTRA,PC_CCGC,PC_BANC,PC_NUME,        ');
  consulta.Sql.Add     ('          PC_AGEN,PC_CHEQ,PC_FPGT,PC_TIME,PC_VENDA,PC_CAIXA,PC_FUNC)                                ');
  consulta.Sql.Add     ('Values  (:pc_clie,:pc_cont,:pc_npre,:pc_valo,:pc_fato,:pc_dcon,:pc_dvto,  ');
  consulta.Sql.Add     ('         :pc_dtpg,:pc_loja,:pc_port,:pc_aval,:pc_plan,:pc_ljpg,:pc_vpag,  ');
  consulta.Sql.Add     ('         :pc_sald,:pc_stat,:pc_tpre,:pc_dtra,:pc_ccgc,:pc_banc,:pc_nume,  ');
  consulta.Sql.Add     ('         :pc_agen,:pc_cheq,:pc_fpgt,:pc_time,:pc_venda,:pc_caixa,:PC_FUNC)                             ');
  consulta.ParamByName ('pc_clie').AsFloat    := inPC_CLIE;
  consulta.ParamByName ('pc_cont').AsFloat    := inPC_CONT;
  consulta.ParamByName ('pc_npre').AsFloat    := inPC_NPRE;
  consulta.ParamByName ('pc_valo').AsFloat    := inPC_VALO;
  consulta.ParamByName ('pc_fato').AsFloat    := inPC_FATO;
  consulta.ParamByName ('pc_dcon').AsDateTime := inPC_DCON;
  consulta.ParamByName ('pc_dvto').AsDateTime := inPC_DVTO;
  consulta.ParamByName ('pc_dtpg').AsDateTime := inPC_DTPG;
  consulta.ParamByName ('pc_dtra').AsDateTime := inPC_DTRA;
  consulta.ParamByName ('pc_loja').AsFloat    := inPC_LOJA;
  consulta.ParamByName ('pc_port').AsFloat    := inPC_PORT;
  consulta.ParamByName ('pc_aval').AsFloat    := inPC_AVAL;
  consulta.ParamByName ('pc_plan').AsFloat    := inPC_PLAN;
  consulta.ParamByName ('pc_ljpg').AsFloat    := inPC_LJPG;
  consulta.ParamByName ('pc_vpag').AsFloat    := inPC_VPAG;
  consulta.ParamByName ('pc_sald').AsFloat    := inPC_SALD;
  consulta.ParamByName ('pc_stat').AsString   := inPC_STAT;
  consulta.ParamByName ('pc_tpre').AsFloat    := inPC_TPRE;
  consulta.ParamByName ('pc_ccgc').AsString   := inPC_CCGC;
  consulta.ParamByName ('pc_banc').AsFloat    := inPC_BANC;
  consulta.ParamByName ('pc_nume').AsFloat    := inPC_NUME;
  consulta.ParamByName ('pc_agen').AsString   := inPC_AGEN;
  consulta.ParamByName ('pc_cheq').AsFloat    := inPC_CHEQ;
  consulta.ParamByName ('pc_fpgt').AsFloat    := inPC_FPGT;
  consulta.ParamByName ('pc_venda').AsFloat   := inPC_venda;
  consulta.ParamByName ('pc_caixa').AsFloat   := inPC_Caixa;
  consulta.ParamByName ('pc_Func').AsFloat    := inPC_Func;
  consulta.ParamByName ('pc_time').AsDateTime := inPC_TIME;
  consulta.ExecSql;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassPrestContrat.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CREPRABR                                                                                  ');
  consulta.Sql.Add     ('Set    PC_CLIE=:pc_clie,PC_CONT=:pc_cont, PC_NPRE=:pc_npre, PC_VALO=:pc_valo, PC_FATO=:pc_fato,  ');
  consulta.Sql.Add     ('       PC_DCON=:pc_dcon,PC_DVTO=:pc_dvto, PC_DTPG=:pc_dtpg, PC_LOJA=:pc_loja, PC_PORT=:pc_port,  ');
  consulta.Sql.Add     ('       PC_AVAL=:pc_aval,PC_PLAN=:pc_plan, PC_LJPG=:pc_ljpg, PC_VPAG=:pc_vpag, PC_SALD=:pc_sald,  ');
  consulta.Sql.Add     ('       PC_STAT=:pc_stat,PC_TPRE=:pc_tpre, PC_DTRA=:pc_dtra, PC_CCGC=:pc_ccgc, PC_BANC=:pc_banc,  ');
  consulta.Sql.Add     ('       PC_NUME=:pc_nume,PC_AGEN=:pc_agen, PC_CHEQ=:pc_cheq, PC_FPGT=:pc_fpgt, PC_TIME=:pc_time   ');
  consulta.Sql.Add     ('Where (PC_CLIE=:pc_clie) AND (PC_CONT=:pc_cont) AND (PC_NPRE=:pc_npre)                           ');
  consulta.ParamByName ('pc_clie').AsFloat    := inPC_CLIE;
  consulta.ParamByName ('pc_cont').AsFloat    := inPC_CONT;
  consulta.ParamByName ('pc_npre').AsFloat    := inPC_NPRE;
  consulta.ParamByName ('pc_valo').AsFloat    := inPC_VALO;
  consulta.ParamByName ('pc_fato').AsFloat    := inPC_FATO;
  consulta.ParamByName ('pc_dcon').AsDateTime := inPC_DCON;
  consulta.ParamByName ('pc_dvto').AsDateTime := inPC_DVTO;
  consulta.ParamByName ('pc_dtpg').AsDateTime := inPC_DTPG;
  consulta.ParamByName ('pc_dtra').AsDateTime := inPC_DTRA;
  consulta.ParamByName ('pc_loja').AsFloat    := inPC_LOJA;
  consulta.ParamByName ('pc_port').AsFloat    := inPC_PORT;
  consulta.ParamByName ('pc_aval').AsFloat    := inPC_AVAL;
  consulta.ParamByName ('pc_plan').AsFloat    := inPC_PLAN;
  consulta.ParamByName ('pc_ljpg').AsFloat    := inPC_LJPG;
  consulta.ParamByName ('pc_vpag').AsFloat    := inPC_VPAG;
  consulta.ParamByName ('pc_sald').AsFloat    := inPC_SALD;
  consulta.ParamByName ('pc_stat').AsString   := inPC_STAT;
  consulta.ParamByName ('pc_tpre').AsFloat    := inPC_TPRE;
  consulta.ParamByName ('pc_ccgc').AsString   := inPC_CCGC;
  consulta.ParamByName ('pc_banc').AsFloat    := inPC_BANC;
  consulta.ParamByName ('pc_nume').AsFloat    := inPC_NUME;
  consulta.ParamByName ('pc_agen').AsString   := inPC_AGEN;
  consulta.ParamByName ('pc_cheq').AsFloat    := inPC_CHEQ;
  consulta.ParamByName ('pc_fpgt').AsFloat    := inPC_FPGT;
  consulta.ParamByName ('pc_time').AsDateTime := inPC_TIME;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassPrestContrat.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassPrestContrat.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassPrestContrat.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassPrestContrat.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassPrestContrat.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassPrestContrat.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassPrestContrat.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

end.
