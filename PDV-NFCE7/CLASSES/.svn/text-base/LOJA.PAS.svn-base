{*** classe geral de acesso a entidade loja}
unit loja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassLoja = class(TObject)
  private
    consulta: TQuery;
  public
    inLO_CODI,inLO_GRUP: Real;
    inLO_NOME,inLO_ENDE,inLO_BAIR,inLO_CIDA,inLO_ESTA,inLO_CEP: String;
    inLO_FONE,inLO_FILL,inLO_CGC,inLO_INCE,inLO_SECA: String;
    inLO_MULT,inLO_MORA: Real;
    inLO_DMUL: Integer;
    inLO_DMOR: Integer;
    inLO_DESC: Real;
    inLO_EXIB: String;
    inLO_CORE: Integer;
    inLO_CORF: Integer;
    inLO_EMAI: String;

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
function TClassLoja.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassLoja.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassLoja.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassLoja.Result (campo: String) :Variant;
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
function TClassLoja.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassLoja.ClearFields:Boolean;
begin
  inLO_CODI     := 0;
  inLO_NOME     := '';
  inLO_ENDE     := '';
  inLO_BAIR     := '';
  inLO_CIDA     := '';
  inLO_ESTA     := '';
  inLO_CEP      := '';
  inLO_FONE     := '';
  inLO_FILL     := '';
  inLO_MULT     := 0.00;
  inLO_DMUL     := 0;
  inLO_MORA     := 0.00;
  inLO_DMOR     := 0;
  inLO_DESC     := 0;
  inLO_CGC      := '';
  inLO_INCE     := '';
  inLO_SECA     := '';
  inLO_EXIB     := '0';
  inLO_CORE     := 0;
  inLO_CORF     := 0;
  inLO_EMAI     := '';
  ClearFields   := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassLoja.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassLoja.Execute:Boolean;
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
function TClassLoja.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('CRELOJA (LO_CODI,LO_GRUP, LO_NOME, LO_ENDE, LO_BAIR,'+
    'LO_CIDA, LO_ESTA, LO_CEP, LO_FONE, LO_FILL,'+
    'LO_MULT, LO_DMUL, LO_MORA, LO_DMOR, LO_DESC,'+
    'LO_CGC, LO_INCE, LO_SECA,LO_EXIB,LO_CORE,LO_CORF,LO_EMAI)');
  consulta.Sql.Add     ('Values  (:lo_codi,:lo_grup, :lo_nome, :lo_ende, :lo_bair,'+
    ':lo_cida, :lo_esta, :lo_cep, :lo_fone, :lo_fill,'+
    ':lo_mult, :lo_dmul, :lo_mora, :lo_dmor, :lo_desc,'+
    ':lo_cgc, :lo_ince, :lo_seca,:lo_exib,:lo_core,:lo_corf,:lo_emai)');
  consulta.ParamByName ('lo_codi').AsFloat  := inLO_CODI;
  consulta.ParamByName ('lo_grup').AsFloat  := inLO_GRUP;
  consulta.ParamByName ('lo_nome').AsString := inLO_NOME;
  consulta.ParamByName ('lo_ende').AsString := inLO_ENDE;
  consulta.ParamByName ('lo_bair').AsString := inLO_BAIR;
  consulta.ParamByName ('lo_cida').AsString := inLO_CIDA;
  consulta.ParamByName ('lo_esta').AsString := inLO_ESTA;
  consulta.ParamByName ('lo_cep').AsString  := inLO_CEP;
  consulta.ParamByName ('lo_fone').AsString := inLO_FONE;
  consulta.ParamByName ('lo_fill').AsString := inLO_FILL;
  consulta.ParamByName ('lo_mult').AsFloat  := inLO_MULT;
  consulta.ParamByName ('lo_dmul').AsInteger:= inLO_DMUL;
  consulta.ParamByName ('lo_mora').AsFloat  := inLO_MORA;
  consulta.ParamByName ('lo_dmor').AsInteger:= inLO_DMOR;
  consulta.ParamByName ('lo_desc').AsFloat  := inLO_DESC;
  consulta.ParamByName ('lo_cgc').AsString  := inLO_CGC;
  consulta.ParamByName ('lo_ince').AsString := inLO_INCE;
  consulta.ParamByName ('lo_seca').AsString := inLO_SECA;
  consulta.ParamByName ('lo_exib').AsString := inLO_EXIB;
  consulta.ParamByName ('lo_core').AsInteger:= inLO_CORE;
  consulta.ParamByName ('lo_corf').AsInteger := inLO_CORF;
  consulta.ParamByName ('lo_emai').AsString := inLO_EMAI;
  consulta.ExecSql;
  Insert:=true;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassLoja.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CRELOJA ');
  consulta.Sql.Add     ('Set    LO_CODI=:lo_codi, LO_NOME=:lo_nome, LO_GRUP=:lo_grup, ');
  consulta.Sql.Add     ('       LO_ENDE=:lo_ende, LO_BAIR=:lo_bair, LO_CIDA=:lo_cida, ');
  consulta.Sql.Add     ('       LO_ESTA=:lo_esta, LO_CEP =:lo_cep,  LO_FONE=:lo_fone, ');
  consulta.Sql.Add     ('       LO_FILL=:lo_fill, LO_EMAI=:lo_emai,                   ');
  consulta.Sql.Add     ('       LO_CGC =:lo_cgc,  LO_INCE=:lo_ince, LO_SECA=:lo_seca, ');
  consulta.Sql.Add     ('       LO_MULT=:lo_mult, LO_MORA=:lo_mora, LO_DMUL=:lo_dmul, ');
  consulta.Sql.Add     ('       LO_DMOR=:lo_dmor, LO_DESC=:lo_desc, LO_EXIB=:lo_exib, ');
  consulta.Sql.Add     ('       LO_CORE=:lo_core, LO_CORF=:lo_corf                    ');
  consulta.Sql.Add     ('Where (LO_CODI=:lo_codi) ');
  consulta.ParamByName ('lo_codi').AsFloat  := inLO_CODI;
  consulta.ParamByName ('lo_grup').AsFloat  := inLO_GRUP;
  consulta.ParamByName ('lo_nome').AsString := inLO_NOME;
  consulta.ParamByName ('lo_ende').AsString := inLO_ENDE;
  consulta.ParamByName ('lo_bair').AsString := inLO_BAIR;
  consulta.ParamByName ('lo_cida').AsString := inLO_CIDA;
  consulta.ParamByName ('lo_esta').AsString := inLO_ESTA;
  consulta.ParamByName ('lo_cep').AsString  := inLO_CEP;
  consulta.ParamByName ('lo_fone').AsString := inLO_FONE;
  consulta.ParamByName ('lo_fill').AsString := inLO_FILL;
  consulta.ParamByName ('lo_mult').AsFloat  := inLO_MULT;
  consulta.ParamByName ('lo_dmul').AsInteger:= inLO_DMUL;
  consulta.ParamByName ('lo_mora').AsFloat  := inLO_MORA;
  consulta.ParamByName ('lo_dmor').AsInteger:= inLO_DMOR;
  consulta.ParamByName ('lo_desc').AsFloat  := inLO_DESC;
  consulta.ParamByName ('lo_cgc').AsString  := inLO_CGC;
  consulta.ParamByName ('lo_ince').AsString := inLO_INCE;
  consulta.ParamByName ('lo_seca').AsString := inLO_SECA;
  consulta.ParamByName ('lo_exib').AsString := inLO_EXIB;
  consulta.ParamByName ('lo_core').AsInteger:= inLO_CORE;
  consulta.ParamByName ('lo_corf').AsInteger := inLO_CORF;
  consulta.ParamByName ('lo_emai').AsString := inLO_EMAI;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassLoja.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassLoja.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassLoja.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassLoja.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassLoja.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassLoja.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassLoja.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

end.
