unit itensestoque;
                     
interface               
                           
uses                          
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;                                                     

type
  TClassItensEstoque = class(TObject)
  private
    procedure Erro              (nivel: Integer);
  public
    inES_GRUP: Real;
    inES_SUBG: Real;
    inES_PROD: Real;
    inES_CORE: Real;
    inES_TAMA: String;
    inES_OTAM: Integer;
    inES_DESC: String;
    inES_REFF: String;
    inES_CBAR: String;
    inES_ULC1: TDateTime;
    inES_ULC2: TDateTime;

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
function TClassItensEstoque.ClearFields:Boolean;
begin
  try
    inES_GRUP:=0;
    inES_SUBG:=0;
    inES_PROD:=0;
    inES_CORE:=0;
    inES_TAMA:='';
    inES_OTAM:=0;
    inES_DESC:='';
    inES_REFF:='';
    inES_CBAR:='';
    inES_ULC1:=strtodate('01/01/1900');
    inES_ULC2:=strtodate('01/01/1900');
    ClearFields     := true;
  except
    ClearFields     := false;
  end;
end;

{Classe de realizacao do filtro do cliente, apos a classe estar aberta}
function TClassItensEstoque.Filter (filtro: String):Boolean;
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
procedure TClassItensEstoque.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  try
    consulta.databasename := banco;
  except
    Erro (2);
  end;
end;

{Desconexao ao banco}
procedure TClassItensEstoque.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassItensEstoque.Result (campo: String) :Variant;
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
function TClassItensEstoque.ClearSql           :Boolean;
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
function TClassItensEstoque.AddParam      (linha: String):Boolean;
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
function TClassItensEstoque.Execute:Boolean;
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
function TClassItensEstoque.Next:Boolean;
begin
  try
    consulta.next;
    Next := true;
  except
    Next := false;
  end;
end;

function TClassItensEstoque.Prior:Boolean;
begin
  try
    consulta.prior;
    Prior := true;
  except
    Prior := false;
  end;
end;

function TClassItensEstoque.First:Boolean;
begin
  try
    consulta.first;
    First := true;
  except
    First := false;
  end;
end;

function TClassItensEstoque.Last:Boolean;
begin
  try
    consulta.last;
    Last := true;
  except
    Last := false;
  end;
end;

function TClassItensEstoque.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassItensEstoque.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassItensEstoque.RecCount:Integer;
begin                                    
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

{Precedimento de exibicao das mensagens de erro internas da classe de acesso}
procedure TClassItensEstoque.Erro (nivel: Integer);
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
function TClassItensEstoque.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('ESTOQUE(   ');
  consulta.Sql.Add     ('ES_GRUP,ES_SUBG,ES_PROD,ES_CORE, ');
  consulta.Sql.Add     ('ES_TAMA,ES_DESC,ES_REFF,ES_CBAR, ');
  consulta.Sql.Add     ('ES_ULC1,ES_ULC2,ES_OTAM) ');
  consulta.Sql.Add     ('Values (    ');
  consulta.Sql.Add     (':ES_GRUP,:ES_SUBG,:ES_PROD,:ES_CORE, ');
  consulta.Sql.Add     (':ES_TAMA,:ES_DESC,:ES_REFF,:ES_CBAR, ');
  consulta.Sql.Add     (':ES_ULC1,:ES_ULC2,:ES_OTAM) ');
  consulta.ParamByName ('ES_GRUP').AsFloat := inES_GRUP;
  consulta.ParamByName ('ES_SUBG').AsFloat := inES_SUBG;
  consulta.ParamByName ('ES_PROD').AsFloat := inES_PROD;
  consulta.ParamByName ('ES_CORE').AsFloat := inES_CORE;
  consulta.ParamByName ('ES_TAMA').AsString := inES_TAMA;
  consulta.ParamByName ('ES_OTAM').AsInteger := inES_OTAM;
  consulta.ParamByName ('ES_DESC').AsString := inES_DESC;
  consulta.ParamByName ('ES_REFF').AsString := inES_REFF;
  consulta.ParamByName ('ES_CBAR').AsString := inES_CBAR;
  consulta.ParamByName ('ES_ULC1').AsDateTime := inES_ULC1;
  consulta.ParamByName ('ES_ULC2').AsDateTime := inES_ULC2;
  try
    consulta.ExecSql;
    Insert:=true;
  except
    Insert:=false;
  end;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassItensEstoque.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update    ');
  consulta.Sql.Add     ('ESTOQUE   ');
  consulta.Sql.Add     ('Set       ');
  consulta.Sql.Add     ('ES_GRUP=:ES_GRUP,ES_SUBG=:ES_SUBG,ES_PROD=:ES_PROD,    ');
  consulta.Sql.Add     ('ES_CORE=:ES_CORE,ES_ULC1=:ES_ULC1,ES_OTAM=:ES_OTAM,    ');
  consulta.Sql.Add     ('ES_TAMA=:ES_TAMA,ES_ULC2=:ES_ULC2,                     ');
  consulta.Sql.Add     ('ES_DESC=:ES_DESC,ES_REFF=:ES_REFF,ES_CBAR=:ES_CBAR     ');
  consulta.Sql.Add     ('Where     ');
  consulta.Sql.Add     ('(         ');
  consulta.Sql.Add     (' ES_GRUP=:ES_GRUP ');
  consulta.Sql.Add     (') AND     ');
  consulta.Sql.Add     ('(         ');
  consulta.Sql.Add     (' ES_SUBG=:ES_SUBG ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' ES_PROD=:ES_PROD ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' ES_CORE=:ES_CORE ');
  consulta.Sql.Add     (') AND ');
  consulta.Sql.Add     ('( ');
  consulta.Sql.Add     (' ES_TAMA=:ES_TAMA ');
  consulta.Sql.Add     (') ');
  consulta.ParamByName ('ES_GRUP').AsFloat := inES_GRUP;
  consulta.ParamByName ('ES_SUBG').AsFloat := inES_SUBG;
  consulta.ParamByName ('ES_PROD').AsFloat := inES_PROD;
  consulta.ParamByName ('ES_CORE').AsFloat := inES_CORE;
  consulta.ParamByName ('ES_TAMA').AsString := inES_TAMA;
  consulta.ParamByName ('ES_OTAM').AsInteger := inES_OTAM;
  consulta.ParamByName ('ES_DESC').AsString := inES_DESC;
  consulta.ParamByName ('ES_REFF').AsString := inES_REFF;
  consulta.ParamByName ('ES_CBAR').AsString := inES_CBAR;
  consulta.ParamByName ('ES_ULC1').AsDateTime := inES_ULC1;
  consulta.ParamByName ('ES_ULC2').AsDateTime := inES_ULC2;
  try
    consulta.ExecSql;
    UpdateAll:=true;
  except
    UpdateAll:=false;
  end;
end;

end.
