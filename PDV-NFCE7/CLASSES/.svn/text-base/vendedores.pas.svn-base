{*** classe geral de acesso a entidade plano de pagamento}
unit vendedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassVend = class(TObject)
  private
    consulta: TQuery;
    procedure Erro              (nivel: Integer);
  public
    inVD_CODI: Real;
    inVD_NOME: String;
    inVD_CPF: String;
    inVD_IDEN: String;
    inVD_OEXP: String;
    inVD_DTNA: TDateTime;
    inVD_ENDE: String;
    inVD_BAIR: String;
    inVD_CIDA: String;
    inVD_ESTA: String;
    inVD_CEP: String;
    inVD_EMAI: String;
    inVD_TELE: String;
    inVD_CELU: String;
    inVD_DCON: TDateTime;
    inVD_CARG: String;
    inVD_NIVE: String;
    inVD_SUPE: String;
    inVD_COTA: Real;
    inVD_COTP: Real;
    inVD_COMA: Real;
    inVD_COMP: Real;
    inVD_LOJA: Real;

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
function TClassVend.Filter (filtro: String):Boolean;
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
procedure TClassVend.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  try
    consulta.databasename := banco;
  except
    Erro (2);
  end;
end;

{Desconexao ao banco}
procedure TClassVend.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassVend.Result (campo: String) :Variant;
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
function TClassVend.ClearSql           :Boolean;
begin
  try
    consulta.sql.clear;
    ClearSql:=true;
  except
    ClearSql:=false;
  end;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassVend.ClearFields:Boolean;
begin
  try
    inVD_CODI:=0.00;
    inVD_NOME:='';
    inVD_CPF:='';
    inVD_IDEN:='';
    inVD_OEXP:='';
    inVD_DTNA:=strtodate('01/01/1900');
    inVD_ENDE:='';
    inVD_BAIR:='';
    inVD_CIDA:='';
    inVD_ESTA:='';
    inVD_CEP:='';
    inVD_EMAI:='';
    inVD_TELE:='';
    inVD_CELU:='';
    inVD_DCON:= strtodate('01/01/1900');
    inVD_CARG:='';
    inVD_NIVE:='';
    inVD_SUPE:='';
    inVD_COTA:=0.00;
    inVD_COMA:=0.00;
    inVD_COMP:=0.00;
    inVD_LOJA:=0;
    inVD_COTP:=0;
    ClearFields     := true;
  except
    ClearFields     := false;
  end;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassVend.AddParam      (linha: String):Boolean;
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
function TClassVend.Execute:Boolean;
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
function TClassVend.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('VENDEDORES (VD_CODI,VD_NOME,VD_CPF,VD_IDEN,VD_OEXP,VD_DTNA,         ');
  consulta.Sql.Add     ('            VD_ENDE,VD_BAIR,VD_CIDA,VD_ESTA,VD_CEP,VD_EMAI,         ');
  consulta.Sql.Add     ('            VD_TELE,VD_CELU,VD_DCON,VD_CARG,VD_NIVE,VD_SUPE,        ');
  consulta.Sql.Add     ('            VD_COTA,VD_COMA,VD_COMP,VD_COTP,VD_LOJA)                ');
  consulta.Sql.Add     ('Values     (:vd_codi,:vd_nome,:vd_cpf,:vd_iden,:vd_oexp,:vd_dtna,   ');
  consulta.Sql.Add     ('            :vd_ende,:vd_bair,:vd_cida,:vd_esta,:vd_cep,:vd_emai,   ');
  consulta.Sql.Add     ('            :vd_tele,:vd_celu,:vd_dcon,:vd_carg,:vd_nive,:vd_supe,  ');
  consulta.Sql.Add     ('            :vd_cota,:vd_coma,:vd_comp,:vd_cotp,:vd_loja)           ');
  consulta.ParamByName ('vd_codi').AsFloat   := inVD_CODI;
  consulta.ParamByName ('vd_nome').AsString  := inVD_NOME;
  consulta.ParamByName ('vd_cpf').AsString   := inVD_CPF;
  consulta.ParamByName ('vd_iden').AsString  := inVD_IDEN;
  consulta.ParamByName ('vd_oexp').AsString  := inVD_OEXP;
  consulta.ParamByName ('vd_dtna').AsDateTime := inVD_DTNA;
  consulta.ParamByName ('vd_ende').AsString  := inVD_ENDE;
  consulta.ParamByName ('vd_bair').AsString  := inVD_BAIR;
  consulta.ParamByName ('vd_cida').AsString  := inVD_CIDA;
  consulta.ParamByName ('vd_esta').AsString  := inVD_ESTA;
  consulta.ParamByName ('vd_cep').AsString  := inVD_CEP;
  consulta.ParamByName ('vd_emai').AsString  := inVD_EMAI;
  consulta.ParamByName ('vd_tele').AsString  := inVD_TELE;
  consulta.ParamByName ('vd_celu').AsString  := inVD_CELU;
  consulta.ParamByName ('vd_dcon').AsDatetime  := inVD_DCON;
  consulta.ParamByName ('vd_carg').AsString  := inVD_CARG;
  consulta.ParamByName ('vd_nive').AsString  := inVD_NIVE;
  consulta.ParamByName ('vd_supe').AsString  := inVD_SUPE;
  consulta.ParamByName ('vd_cota').AsFloat := inVD_COTA;
  consulta.ParamByName ('vd_coma').AsFloat := inVD_COMA;
  consulta.ParamByName ('vd_comp').AsFloat := inVD_COMP;
  consulta.ParamByName ('vd_cotp').AsFloat := inVD_COTP;
  consulta.ParamByName ('vd_loja').AsFloat := inVD_LOJA;
  try
    consulta.ExecSql;
    Insert:=true;
  except
    Insert:=false;
  end;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassVend.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update VENDEDORES                                           ');
  consulta.Sql.Add     ('Set    VD_CODI=:vd_codi,VD_NOME=:vd_nome,VD_CPF =:vd_cpf,   ');
  consulta.Sql.Add     ('       VD_IDEN=:vd_iden,VD_OEXP=:vd_oexp,VD_DTNA=:vd_dtna,  ');
  consulta.Sql.Add     ('       VD_ENDE=:vd_ende,VD_BAIR=:vd_bair,VD_CIDA=:vd_cida,  ');
  consulta.Sql.Add     ('       VD_ESTA=:vd_esta,VD_CEP =:vd_cep, VD_EMAI=:vd_emai,  ');
  consulta.Sql.Add     ('       VD_TELE=:vd_tele,VD_CELU=:vd_celu,VD_DCON=:vd_dcon,  ');
  consulta.Sql.Add     ('       VD_CARG=:vd_carg,VD_NIVE=:vd_nive,VD_SUPE=:vd_supe,  ');
  consulta.Sql.Add     ('       VD_COTA=:vd_cota,VD_COMA=:vd_coma,VD_COMP=:vd_comp,  ');
  consulta.Sql.Add     ('       VD_COTP=:vd_cotp,VD_LOJA=:vd_loja                    ');
  consulta.Sql.Add     ('Where (vd_codi=:vd_codi)                                    ');
  consulta.ParamByName ('vd_codi').AsFloat   := inVD_CODI;
  consulta.ParamByName ('vd_nome').AsString  := inVD_NOME;
  consulta.ParamByName ('vd_cpf').AsString   := inVD_CPF;
  consulta.ParamByName ('vd_iden').AsString  := inVD_IDEN;
  consulta.ParamByName ('vd_oexp').AsString  := inVD_OEXP;
  consulta.ParamByName ('vd_dtna').AsDateTime := inVD_DTNA;
  consulta.ParamByName ('vd_ende').AsString  := inVD_ENDE;
  consulta.ParamByName ('vd_bair').AsString  := inVD_BAIR;
  consulta.ParamByName ('vd_cida').AsString  := inVD_CIDA;
  consulta.ParamByName ('vd_esta').AsString  := inVD_ESTA;
  consulta.ParamByName ('vd_cep').AsString  := inVD_CEP;
  consulta.ParamByName ('vd_emai').AsString  := inVD_EMAI;
  consulta.ParamByName ('vd_tele').AsString  := inVD_TELE;
  consulta.ParamByName ('vd_celu').AsString  := inVD_CELU;
  consulta.ParamByName ('vd_dcon').AsDatetime  := inVD_DCON;
  consulta.ParamByName ('vd_carg').AsString  := inVD_CARG;
  consulta.ParamByName ('vd_nive').AsString  := inVD_NIVE;
  consulta.ParamByName ('vd_supe').AsString  := inVD_SUPE;
  consulta.ParamByName ('vd_cota').AsFloat := inVD_COTA;
  consulta.ParamByName ('vd_coma').AsFloat := inVD_COMA;
  consulta.ParamByName ('vd_comp').AsFloat := inVD_COMP;
  consulta.ParamByName ('vd_cotp').AsFloat := inVD_COTP;
  consulta.ParamByName ('vd_loja').AsFloat := inVD_LOJA;
  try
    consulta.ExecSql;
    UpdateAll:=true;
  except
    UpdateAll:=false;
  end;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassVend.Next:Boolean;
begin
  try
    consulta.next;
    Next := true;
  except
    Next := false;
  end;
end;

function TClassVend.Prior:Boolean;
begin
  try
    consulta.prior;
    Prior := true;
  except
    Prior := false;
  end;
end;

function TClassVend.First:Boolean;
begin
  try
    consulta.first;
    First := true;
  except
    First := false;
  end;
end;

function TClassVend.Last:Boolean;
begin
  try
    consulta.last;
    Last := true;
  except
    Last := false;
  end;
end;

function TClassVend.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassVend.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassVend.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

{Precedimento de exibicao das mensagens de erro internas da classe de acesso}
procedure TClassVend.Erro (nivel: Integer);
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
