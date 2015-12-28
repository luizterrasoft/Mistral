{*** classe geral de acesso a entidade portador}
unit contratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassContrato = class(TObject)
  private
    consulta: TQuery;
    procedure AtualizaValidaContrato;
  public
    inCR_CLIE: Real;
    inCR_CODI: Real; {supercharve primaria - CLIENTE + CONTRATO}
    inCR_LOJA: Real;
    inCR_NOTA: String;
    inCR_SERI: String;
    inCR_DNOT: TDateTime;
    inCR_DTRA: TDateTime; {data da transferencia do portador da cobranca}
    inCR_QBOL: String;   {Quantidade de boletas do contrato}
    inCR_AVAL: Real;
    inCR_PORT: Real;
    inCR_TOTA: Real; {total de financiamento}
    inCR_VENT: Real;
    inCR_PLAN: Real;
    inCR_FATO: Real;
    inCR_QPRE: Real;
    inCR_PDEV: Real; {dados nao exibiveis}
    inCR_VDEV: Real;
    inCR_CARN: String; {flag para imp. do carnet}
    inCR_FICH: String; {flag para ficha de contrato}
    inCR_BOLE: String; {flag para ficha de boleto}
    inCR_TOT2: Real; {total real da soma das prestacoes}
    inCR_OBSE: String; {observacao no lancamento do contrato}
    inCR_VENDA: Real; {observacao no lancamento do contrato}
    inCR_CAIXA: Real; {observacao no lancamento do contrato}
    inCR_TIME: TDateTime;

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
function TClassContrato.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassContrato.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassContrato.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassContrato.Result (campo: String) :Variant;
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
function TClassContrato.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassContrato.ClearFields:Boolean;
begin
  inCR_CODI :=0;
  inCR_CLIE :=0;
  inCR_LOJA :=0;
  inCR_NOTA :='';
  inCR_SERI :='';
  inCR_DNOT :=StrToDate('01/01/1900');
  inCR_DTRA :=StrToDate('01/01/1900');
  inCR_QBOL := '';
  inCR_AVAL :=0;
  inCR_PORT :=0;
  inCR_TOTA :=0.00;
  inCR_VENT :=0.00;
  inCR_PLAN :=0;
  inCR_QPRE :=0;
  inCR_PDEV :=0;
  inCR_VDEV :=0.00;
  inCR_FATO :=0.00;
  inCR_CARN :='0';
  inCR_FICH :='0';
  inCR_BOLE :='0';
  inCR_TOT2 :=0.00;
  inCR_OBSE :='';
  inCR_TIME :=StrToDate('01/01/1900');
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassContrato.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassContrato.Execute:Boolean;
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
function TClassContrato.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('CRECTABR (CR_CODI,CR_CLIE,CR_LOJA,CR_NOTA,CR_SERI,CR_DNOT,  ');
  consulta.Sql.Add     ('          CR_AVAL,CR_PORT,CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,  ');
  consulta.Sql.Add     ('          CR_PDEV,CR_FATO,CR_CARN,CR_FICH,CR_VDEV,CR_DTRA,  ');
  consulta.Sql.Add     ('          CR_TOT2,CR_BOLE,CR_TIME,CR_OBSE,CR_QBOL)   ');
  consulta.Sql.Add     ('Values   (:cr_codi,:cr_clie,:cr_loja,:cr_nota,:cr_seri,:cr_dnot, ');
  consulta.Sql.Add     ('         :cr_aval,:cr_port,:cr_tota,:cr_vent,:cr_plan,:cr_qpre,  ');
  consulta.Sql.Add     ('         :cr_pdev,:cr_fato,:cr_carn,:cr_fich,:cr_vdev,:cr_dtra,  ');
  consulta.Sql.Add     ('         :cr_tot2,:cr_bole,:cr_time,:cr_obse,:cr_qbol)   ');
  consulta.ParamByName ('cr_codi').AsFloat  := inCR_CODI;
  consulta.ParamByName ('cr_clie').AsFloat  := inCR_CLIE;
  consulta.ParamByName ('cr_loja').AsFloat  := inCR_LOJA;
  consulta.ParamByName ('cr_nota').AsString := inCR_NOTA;
  consulta.ParamByName ('cr_seri').AsString := inCR_SERI;
  consulta.ParamByName ('cr_dnot').AsDateTime := inCR_DNOT;
  consulta.ParamByName ('cr_dtra').AsDateTime := inCR_DTRA;
  consulta.ParamByName ('cr_aval').AsFloat := inCR_AVAL;
  consulta.ParamByName ('cr_port').AsFloat := inCR_PORT;
  consulta.ParamByName ('cr_tota').AsFloat := inCR_TOTA;
  consulta.ParamByName ('cr_vent').AsFloat := inCR_VENT;
  consulta.ParamByName ('cr_plan').AsFloat := inCR_PLAN;
  consulta.ParamByName ('cr_qpre').AsFloat := inCR_QPRE;
  consulta.ParamByName ('cr_pdev').AsFloat := inCR_PDEV;
  consulta.ParamByName ('cr_vdev').AsFloat := inCR_VDEV;
  consulta.ParamByName ('cr_fato').AsFloat := inCR_FATO;
  consulta.ParamByName ('cr_carn').AsString := inCR_CARN;
  consulta.ParamByName ('cr_fich').AsString := inCR_FICH;
  consulta.ParamByName ('cr_bole').AsString := inCR_BOLE;
  consulta.ParamByName ('cr_tot2').AsFloat := inCR_TOT2;
  consulta.ParamByName ('cr_time').AsDateTime := inCR_TIME;
  consulta.ParamByName ('cr_obse').AsString := inCR_OBSE;
  consulta.ParamByName('cr_qbol').AsString := inCR_QBOL;
  consulta.ExecSql;
  try
    AtualizaValidaContrato
  except
  end;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassContrato.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update  CRECTABR                                             ');
  consulta.Sql.Add     ('Set     CR_CODI=:cr_codi,CR_CLIE =:cr_clie,CR_LOJA=:cr_loja, ');
  consulta.Sql.Add     ('        CR_NOTA=:cr_nota,CR_SERI=:cr_seri,CR_DNOT=:cr_dnot,  ');
  consulta.Sql.Add     ('        CR_AVAL=:cr_aval,CR_PORT=:cr_port ,CR_TOTA=:cr_tota, ');
  consulta.Sql.Add     ('        CR_VENT=:cr_vent,CR_PLAN=:cr_plan ,CR_QPRE=:cr_qpre, ');
  consulta.Sql.Add     ('        CR_PDEV=:cr_pdev,CR_FATO=:cr_fato ,CR_CARN=:cr_carn, ');
  consulta.Sql.Add     ('        CR_FICH=:cr_fich,CR_DTRA=:cr_dtra ,CR_VDEV=:cr_vdev, ');
  consulta.Sql.Add     ('        CR_TOT2=:cr_tot2,CR_BOLE=:cr_bole ,CR_TIME=:cr_time, ');
  consulta.Sql.Add     ('        CR_OBSE=:cr_obse,CR_QBOL=:cr_qbol                    ');
  consulta.Sql.Add     ('Where  (CR_CODI=:cr_codi) AND (CR_CLIE=:cr_clie)             ');
  consulta.ParamByName ('cr_codi').AsFloat  := inCR_CODI;
  consulta.ParamByName ('cr_clie').AsFloat  := inCR_CLIE;
  consulta.ParamByName ('cr_loja').AsFloat  := inCR_LOJA;
  consulta.ParamByName ('cr_nota').AsString := inCR_NOTA;
  consulta.ParamByName ('cr_seri').AsString := inCR_SERI;
  consulta.ParamByName ('cr_dnot').AsDateTime := inCR_DNOT;
  consulta.ParamByName ('cr_dtra').AsDateTime := inCR_DTRA;
  consulta.ParamByName ('cr_aval').AsFloat := inCR_AVAL;
  consulta.ParamByName ('cr_port').AsFloat := inCR_PORT;
  consulta.ParamByName ('cr_tota').AsFloat := inCR_TOTA;
  consulta.ParamByName ('cr_vent').AsFloat := inCR_VENT;
  consulta.ParamByName ('cr_plan').AsFloat := inCR_PLAN;
  consulta.ParamByName ('cr_qpre').AsFloat := inCR_QPRE;
  consulta.ParamByName ('cr_pdev').AsFloat := inCR_PDEV;
  consulta.ParamByName ('cr_vdev').AsFloat := inCR_VDEV;
  consulta.ParamByName ('cr_fato').AsFloat := inCR_FATO;
  consulta.ParamByName ('cr_carn').AsString := inCR_CARN;
  consulta.ParamByName ('cr_fich').AsString := inCR_FICH;
  consulta.ParamByName ('cr_bole').AsString := inCR_BOLE;
  consulta.ParamByName ('cr_tot2').AsFloat := inCR_TOT2;
  consulta.ParamByName ('cr_time').AsDateTime := inCR_TIME;
  consulta.ParamByName ('cr_obse').AsString := inCR_OBSE;
  consulta.ParamByName ('cr_qbol').AsString := inCR_QBOL;
  consulta.ExecSql;
  try
    AtualizaValidaContrato
  except
  end;

  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassContrato.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassContrato.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassContrato.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassContrato.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassContrato.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassContrato.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassContrato.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

procedure TClassContrato.AtualizaValidaContrato;
var
  FQuery:TQuery;
  FDias:Real;
begin
  FQuery := TQuery.Create(Application);
  with FQuery do
    try
      DataBaseName := Consulta.DataBaseName;
      Sql.Clear;
      Sql.Add('Select DiasValidadeCli from conf');
      open;
      FDias := FieldByName('DiasValidadeCli').AsFloat;

      Sql.Clear;
      Sql.Add     ('Update  CRECLI Set CL_VALI =:CL_VALI');
      Sql.Add     ('Where   CL_CODI=:cr_clie And (Cl_Vali < =:CL_VALI or Cl_Vali is Null)');
      ParamByName ('cr_clie').AsFloat     := inCR_CLIE;
      ParamByName ('cl_vali').AsDateTime  := inCR_DNOT + FDias;
      ExecSql;
    finally
      destroy;
    end; 
end;

end.
