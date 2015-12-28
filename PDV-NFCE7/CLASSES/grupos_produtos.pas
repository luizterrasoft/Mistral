{*** classe geral de acesso a entidade plano de pagamento}
unit grupos_produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassGruposProdutos = class(TObject)
  private
    consulta: TQuery;
    procedure Erro              (nivel: Integer);
  public
    inGR_CODI: Real;
    inGR_DESC: String;
    inGR_CUNI: String;
    inGR_TUNI: String;
    inGR_DMIN: Real;
    inGR_DMAX: Real;
    inGR_MARG: Real;

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
function TClassGruposProdutos.Filter (filtro: String):Boolean;
begin
  try
    consulta.filtered := false;
    consulta.filter   := filtro;
    consulta.filtered := true;
    Filter            := true;
  except
    Filter            := false;
  end;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassGruposProdutos.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  try
    consulta.databasename := banco;
  except
    Erro (2);
  end;
end;

{Desconexao ao banco}
procedure TClassGruposProdutos.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassGruposProdutos.Result (campo: String) :Variant;
var
  data: TDateTime;
begin
  try
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
  except
    Erro (4);
    Result:=(-1);
  end;
end;

{Limpeza da propriedade SQL da querie criada para selecao}
function TClassGruposProdutos.ClearSql           :Boolean;
begin
  try
    consulta.sql.clear;
    ClearSql:=true;
  except
    ClearSql:=false;
  end;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassGruposProdutos.ClearFields:Boolean;
begin
  try
    inGR_CODI:=0;
    inGR_DESC:='';
    inGR_CUNI:='';
    inGR_TUNI:='';
    inGR_DMIN:=0.00;
    inGR_DMAX:=0.00;
    inGR_MARG:=0.00;
    ClearFields     := true;
  except
    ClearFields     := false;
  end;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassGruposProdutos.AddParam      (linha: String):Boolean;
begin
  try
    consulta.close;
    consulta.sql.add (linha);
    AddParam := true;
  except
    AddParam := false;
  end;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassGruposProdutos.Execute:Boolean;
var
  trecho: String;
begin
  if (consulta.Sql.count=0) then
  begin
    Execute := false;
    Erro (2);
    Application.Terminate;
  end
  else
  begin
    trecho:=UpperCase(consulta.sql[0]);
    try
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
    except
      Execute := false;
      Erro (3);
    end;
  end;
end;

{** - Funcao de insercao de clientes }
{Falta acrescentar os outros campos *************}
function TClassGruposProdutos.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('GRUPOS_PRODUTOS (GR_CODI, GR_DESC,GR_CUNI,GR_TUNI,GR_MARG,GR_DMIN,GR_DMAX) ');
  consulta.Sql.Add     ('Values  (:GR_CODI, :GR_DESC, :GR_CUNI, :GR_TUNI, :GR_MARG, :GR_DMIN,:GR_DMAX) ');
  consulta.ParamByName ('gr_codi').AsFloat    := inGR_CODI;
  consulta.ParamByName ('gr_desc').AsString   := inGR_DESC;
  consulta.ParamByName ('gr_dmin').AsFloat    := inGR_DMIN;
  consulta.ParamByName ('gr_dmax').AsFloat    := inGR_DMAX;
  consulta.ParamByName ('gr_cuni').AsString   := inGR_CUNI;
  consulta.ParamByName ('gr_tuni').AsString   := inGR_TUNI;
  consulta.ParamByName ('gr_marg').AsFloat    := inGR_MARG;
  try
    consulta.ExecSql;
    Insert:=true;
  except
    Insert:=false;
  end;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassGruposProdutos.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update GRUPOS_PRODUTOS ');
  consulta.Sql.Add     ('Set    GR_CODI=:gr_codi, GR_DESC=:gr_desc, GR_CUNI=:gr_cuni, ');
  consulta.Sql.Add     ('       GR_TUNI=:gr_tuni, GR_MARG=:gr_marg, GR_DMIN=:gr_dmin, ');
  consulta.Sql.Add     ('       GR_DMAX=:gr_dmax  ');
  consulta.Sql.Add     ('Where (GR_CODI=:gr_codi)');
  consulta.ParamByName ('gr_codi').AsFloat    := inGR_CODI;
  consulta.ParamByName ('gr_desc').AsString   := inGR_DESC;
  consulta.ParamByName ('gr_dmin').AsFloat    := inGR_DMIN;
  consulta.ParamByName ('gr_dmax').AsFloat    := inGR_DMAX;
  consulta.ParamByName ('gr_cuni').AsString   := inGR_CUNI;
  consulta.ParamByName ('gr_tuni').AsString   := inGR_TUNI;
  consulta.ParamByName ('gr_marg').AsFloat    := inGR_MARG;
  try
    consulta.ExecSql;
    UpdateAll:=true;
  except
    UpdateAll:=false;
  end;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassGruposProdutos.Next:Boolean;
begin
  try
    consulta.next;
    Next := true;
  except
    Next := false;
  end;
end;

function TClassGruposProdutos.Prior:Boolean;
begin
  try
    consulta.prior;
    Prior := true;
  except
    Prior := false;
  end;
end;

function TClassGruposProdutos.First:Boolean;
begin
  try
    consulta.first;
    First := true;
  except
    First := false;
  end;
end;

function TClassGruposProdutos.Last:Boolean;
begin
  try
    consulta.last;
    Last := true;
  except
    Last := false;
  end;
end;

function TClassGruposProdutos.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassGruposProdutos.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassGruposProdutos.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

{Precedimento de exibicao das mensagens de erro internas da classe de acesso}
procedure TClassGruposProdutos.Erro (nivel: Integer);
var
  mensagem: String;
begin
  mensagem:='Erro de classe ('+inttostr(nivel)+'): ';
  if (nivel=1) then
    showmessage (mensagem + 'Conexao ao banco nao existente...');
  if (nivel=2) then
    showmessage (mensagem + 'Sem AddParametros para pesquisa...');
  if (nivel=3) then
    showmessage (mensagem + 'Erro na abertura da tabela...');
  if (nivel=4) then
    showmessage (mensagem + 'Erro na busca do campo de resultado...');
  Application.Terminate;
end;

end.
