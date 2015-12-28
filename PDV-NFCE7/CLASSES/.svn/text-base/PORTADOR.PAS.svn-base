{*** classe geral de acesso a entidade portador}
unit portador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassPort = class(TObject)
  private
    consulta: TQuery;
  public
    inPO_CODI: Real;
    inPO_NOME,inPO_AGEN,inPO_CCOR,inPO_ENDE,inPO_BAIR: String;
    inPO_CIDA,inPO_ESTA,inPO_CEP,inPO_FONE,inPO_FAX,inPO_CELU: String;
    inPO_TIPO,inPO_EMAI,inPO_CCGC: String;
    inPO_TAXA: Real;
    inPO_EXIB: String;
    inPO_CORE: Integer;
    inPO_CORF: Integer;

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
function TClassPort.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassPort.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassPort.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassPort.Result (campo: String) :Variant;
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
function TClassPort.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassPort.ClearFields:Boolean;
begin
  inPO_CODI   := 0;
  inPO_NOME   := '';
  inPO_AGEN   := '';
  inPO_CCOR   := '';
  inPO_ENDE   := '';
  inPO_BAIR   := '';
  inPO_CIDA   := '';
  inPO_ESTA   := '';
  inPO_CEP    := '';
  inPO_FONE   := '';
  inPO_FAX    := '';
  inPO_CELU   := '';
  inPO_EMAI   := '';
  inPO_CCGC   := '';
  inPO_TAXA   := 0.00;
  inPO_TIPO   := '';
  inPO_EXIB   := '0';
  inPO_CORE   := 0;
  inPO_CORF   := 0;
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassPort.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassPort.Execute:Boolean;
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
      consulta.execsql;
      Execute := true;
    end;
  end;
end;

{** - Funcao de insercao de clientes }
{Falta acrescentar os outros campos *************}
function TClassPort.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('CREPORT (PO_CODI, PO_NOME, PO_AGEN, PO_CCOR, PO_ENDE,'+
    'PO_BAIR, PO_CIDA, PO_ESTA, PO_CEP, PO_FONE, PO_FAX, PO_CELU,'+
    'PO_EMAI, PO_CCGC, PO_TAXA, PO_TIPO)');
  consulta.Sql.Add     ('Values   (:po_codi, :po_nome,  :po_agen, :po_ccor, :po_ende,'+
    ':po_bair, :po_cida, :po_esta, :po_cep, :po_fone, :po_fax,'+
    ':po_celu, :po_emai, :po_ccgc, :po_taxa, :po_tipo)');
  consulta.ParamByName ('po_codi').AsFloat   := inPO_CODI;
  consulta.ParamByName ('po_nome').AsString  := inPO_NOME;
  consulta.ParamByName ('po_agen').AsString  := inPO_AGEN;
  consulta.ParamByName ('po_ccor').AsString  := inPO_CCOR;
  consulta.ParamByName ('po_ende').AsString  := inPO_ENDE;
  consulta.ParamByName ('po_bair').AsString  := inPO_BAIR;
  consulta.ParamByName ('po_cida').AsString  := inPO_CIDA;
  consulta.ParamByName ('po_esta').AsString  := inPO_ESTA;
  consulta.ParamByName ('po_cep').AsString   := inPO_CEP;
  consulta.ParamByName ('po_fone').AsString  := inPO_FONE;
  consulta.ParamByName ('po_fax').AsString   := inPO_FAX;
  consulta.ParamByName ('po_celu').AsString  := inPO_CELU;
  consulta.ParamByName ('po_emai').AsString  := inPO_EMAI;
  consulta.ParamByName ('po_ccgc').AsString  := inPO_CCGC;
  consulta.ParamByName ('po_taxa').AsFloat   := inPO_TAXA;
  consulta.ParamByName ('po_tipo').AsString  := inPO_TIPO;
  consulta.ExecSql;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassPort.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CREPORT ');
  consulta.Sql.Add     ('Set    PO_CODI=:po_codi, PO_NOME=:po_nome, PO_AGEN=:po_agen, ');
  consulta.Sql.Add     ('       PO_CCOR=:po_ccor, PO_ENDE=:po_ende, PO_BAIR=:po_bair, ');
  consulta.Sql.Add     ('       PO_CIDA=:po_cida, PO_ESTA=:po_esta, PO_CEP =:po_cep,  ');
  consulta.Sql.Add     ('       PO_FONE=:po_fone, PO_FAX =:po_fax,  PO_CELU=:po_celu, ');
  consulta.Sql.Add     ('       PO_TIPO=:po_tipo, PO_EMAI=:po_emai, PO_CCGC=:po_ccgc, ');
  consulta.Sql.Add     ('       PO_TAXA=:po_taxa  ');
  consulta.Sql.Add     ('Where (PO_CODI=:po_codi)');
  consulta.ParamByName ('po_codi').AsFloat   := inPO_CODI;
  consulta.ParamByName ('po_nome').AsString  := inPO_NOME;
  consulta.ParamByName ('po_agen').AsString  := inPO_AGEN;
  consulta.ParamByName ('po_ccor').AsString  := inPO_CCOR;
  consulta.ParamByName ('po_ende').AsString  := inPO_ENDE;
  consulta.ParamByName ('po_bair').AsString  := inPO_BAIR;
  consulta.ParamByName ('po_cida').AsString  := inPO_CIDA;
  consulta.ParamByName ('po_esta').AsString  := inPO_ESTA;
  consulta.ParamByName ('po_cep').AsString   := inPO_CEP;
  consulta.ParamByName ('po_fone').AsString  := inPO_FONE;
  consulta.ParamByName ('po_fax').AsString   := inPO_FAX;
  consulta.ParamByName ('po_celu').AsString  := inPO_CELU;
  consulta.ParamByName ('po_emai').AsString  := inPO_EMAI;
  consulta.ParamByName ('po_ccgc').AsString  := inPO_CCGC;
  consulta.ParamByName ('po_taxa').AsFloat   := inPO_TAXA;
  consulta.ParamByName ('po_tipo').AsString  := inPO_TIPO;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassPort.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassPort.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassPort.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassPort.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassPort.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassPort.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassPort.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

end.
