unit itensestoqueloja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassItensEstoqueLoja = class(TObject)
  private
    procedure Erro              (nivel: Integer);
  public
    inEL_GRUP: Real;
    inEL_SUBG: Real;
    inEL_PROD: Real;
    inEL_CORE: Real;
    inEL_TAMA: String;
    inEL_OTAM: Integer;
    inEL_LOJA: Real;
    inEL_QTD1: Real;
    inEL_QTD2: Real;
    inEL_ULC1: TDateTime; {* ultima venda do item}
    inEL_ULC2: TDateTime;
    inEL_TIME: TDateTime;
     {***************}

    consulta: TQuery;            {publica, para ser acessada externamente ***}
    procedure Conect             (banco: String; Owner: TComponent);
    procedure Desconect          ;

    function  AddParam           (linha: String):Boolean;
    function  Execute            :Boolean;
    function  Result             (campo: String):Variant;

    function  ClearSql           :Boolean;
    function  Filter             (filtro: String):Boolean;

    function  ClearFields        :Boolean;
    function  Next               :Boolean;
    function  Insert             :Boolean;
    function  UpdateAll          :Boolean;
    function  Prior              :Boolean;
    function  First              :Boolean;
    function  Last               :Boolean;
    function  RecCount           :Integer;
    function  Eof                :Boolean;
    function  Bof                :Boolean;
  end;

implementation

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassItensEstoqueLoja.ClearFields:Boolean;
begin
  try
    inEL_GRUP:=0;
    inEL_SUBG:=0;
    inEL_PROD:=0;
    inEL_CORE:=0;
    inEL_TAMA:='';
    inEL_OTAM:=0;
    inEL_LOJA:=0;
    inEL_QTD1:=0.00;
    inEL_QTD2:=0.00;
    inEL_ULC1:=strtodate('01/01/1900');
    inEL_ULC2:=strtodate('01/01/1900');
    inEL_TIME:=strtodate('01/01/1900');
    ClearFields     := true;
  except
    ClearFields     := false;
  end;
end;

{Classe de realizacao do filtro do cliente, apos a classe estar aberta}
function TClassItensEstoqueLoja.Filter (filtro: String):Boolean;
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
procedure TClassItensEstoqueLoja.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  try
    consulta.databasename := banco;
  except
    Erro (2);
  end;
end;

{Desconexao ao banco}
procedure TClassItensEstoqueLoja.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassItensEstoqueLoja.Result (campo: String) :Variant;
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
function TClassItensEstoqueLoja.ClearSql           :Boolean;
begin
  try
    consulta.sql.clear;
    ClearSql:=true;
  except
    ClearSql:=false;
  end;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassItensEstoqueLoja.AddParam      (linha: String):Boolean;
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
function TClassItensEstoqueLoja.Execute:Boolean;
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

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassItensEstoqueLoja.Next:Boolean;
begin
  try
    consulta.next;
    Next := true;
  except
    Next := false;
  end;
end;

function TClassItensEstoqueLoja.Prior:Boolean;
begin
  try
    consulta.prior;
    Prior := true;
  except
    Prior := false;
  end;
end;

function TClassItensEstoqueLoja.First:Boolean;
begin
  try
    consulta.first;
    First := true;
  except
    First := false;
  end;
end;

function TClassItensEstoqueLoja.Last:Boolean;
begin
  try
    consulta.last;
    Last := true;
  except
    Last := false;
  end;
end;

function TClassItensEstoqueLoja.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassItensEstoqueLoja.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassItensEstoqueLoja.RecCount:Integer;
begin                                    
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

{Precedimento de exibicao das mensagens de erro internas da classe de acesso}
procedure TClassItensEstoqueLoja.Erro (nivel: Integer);
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

{** - Funcao de insercao}
{Falta acrescentar os outros campos *************}
function TClassItensEstoqueLoja.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('ESTOQUE_LOJA(   ');
  consulta.Sql.Add     ('EL_GRUP,EL_SUBG,EL_PROD,EL_LOJA,EL_CORE, ');
  consulta.Sql.Add     ('EL_TAMA,EL_QTD1,EL_QTD2,EL_OTAM, ');
  consulta.Sql.Add     ('EL_ULC1,EL_ULC2,EL_TIME) ');
  consulta.Sql.Add     ('Values (    ');
  consulta.Sql.Add     (':EL_GRUP,:EL_SUBG,:EL_PROD,:EL_LOJA,:EL_CORE, ');
  consulta.Sql.Add     (':EL_TAMA,:EL_QTD1,:EL_QTD2,:EL_OTAM, ');
  consulta.Sql.Add     (':EL_ULC1,:EL_ULC2,:EL_TIME) ');
  consulta.ParamByName ('EL_GRUP').AsFloat := inEL_GRUP;
  consulta.ParamByName ('EL_SUBG').AsFloat := inEL_SUBG;
  consulta.ParamByName ('EL_PROD').AsFloat := inEL_PROD;
  consulta.ParamByName ('EL_CORE').AsFloat := inEL_CORE;
  consulta.ParamByName ('EL_TAMA').AsString := inEL_TAMA;
  consulta.ParamByName ('EL_OTAM').AsInteger := inEL_OTAM;
  consulta.ParamByName ('EL_LOJA').AsFloat := inEL_LOJA;
  consulta.ParamByName ('EL_QTD1').AsFloat := inEL_QTD1;
  consulta.ParamByName ('EL_QTD2').AsFloat := inEL_QTD2;
  consulta.ParamByName ('EL_ULC1').AsDateTime := inEL_ULC1;
  consulta.ParamByName ('EL_ULC2').AsDateTime := inEL_ULC2;
  consulta.ParamByName ('EL_TIME').AsDateTime := inEL_TIME;
  try
    consulta.ExecSql;
    Insert:=true;
  except
    Insert:=false;
  end;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassItensEstoqueLoja.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update         ');
  consulta.Sql.Add     ('ESTOQUE_LOJA   ');
  consulta.Sql.Add     ('Set            ');
  consulta.Sql.Add     ('EL_GRUP=:EL_GRUP,EL_SUBG=:EL_SUBG,EL_PROD=:EL_PROD, ');
  consulta.Sql.Add     ('EL_LOJA=:EL_LOJA,EL_CORE=:EL_CORE,EL_OTAM=:EL_OTAM, ');
  consulta.Sql.Add     ('EL_TAMA=:EL_TAMA,EL_QTD1=:EL_QTD1,EL_QTD2=:EL_QTD2, ');
  consulta.Sql.Add     ('EL_ULC1=:EL_ULC1,EL_ULC2=:EL_ULC2,EL_TIME=:EL_TIME ');
  consulta.Sql.Add     ('Where ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' EL_GRUP=:EL_GRUP ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' EL_SUBG=:EL_SUBG ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' EL_PROD=:EL_PROD ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' EL_LOJA=:EL_LOJA ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' EL_CORE=:EL_CORE ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' EL_TAMA=:EL_TAMA ');
  consulta.Sql.Add     (') ');
  consulta.ParamByName ('EL_GRUP').AsFloat := inEL_GRUP;
  consulta.ParamByName ('EL_SUBG').AsFloat := inEL_SUBG;
  consulta.ParamByName ('EL_PROD').AsFloat := inEL_PROD;
  consulta.ParamByName ('EL_CORE').AsFloat := inEL_CORE;
  consulta.ParamByName ('EL_TAMA').AsString := inEL_TAMA;
  consulta.ParamByName ('EL_OTAM').AsInteger := inEL_OTAM;
  consulta.ParamByName ('EL_LOJA').AsFloat := inEL_LOJA;
  consulta.ParamByName ('EL_QTD1').AsFloat := inEL_QTD1;
  consulta.ParamByName ('EL_QTD2').AsFloat := inEL_QTD2;
  consulta.ParamByName ('EL_ULC1').AsDateTime := inEL_ULC1;
  consulta.ParamByName ('EL_ULC2').AsDateTime := inEL_ULC2;
  consulta.ParamByName ('EL_TIME').AsDateTime := inEL_TIME;
  try
    consulta.ExecSql;
    UpdateAll:=true;
  except
    UpdateAll:=false;
  end;
end;

end.
