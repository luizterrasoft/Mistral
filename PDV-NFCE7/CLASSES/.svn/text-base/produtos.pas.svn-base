{*** classe geral de acesso a entidade plano de pagamento}
unit produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassProdutos = class(TObject)
  private
    consulta: TQuery;
    procedure Erro              (nivel: Integer);
  public
    inPR_GRUP: Real; {...}
    inPR_SUBG: Real; {...}
    inPR_CODI: Real; {...}
    inPR_FORN: Real;
    inPR_DESC: String;
    inPR_REFI: String;
    inPR_UNID: String;
    inPR_LINH: String;
    inPR_COLE: String;
    inPR_MAT1: String;
    inPR_MAT2: String;
    inPR_MAT3: String;
    inPR_DMIN: Real;
    inPR_DMAX: Real;
    inPR_CUNI: String;           {indica se a cor é unica - 0, cor nula é -1}
    inPR_TUNI: String;           {indica se o tamanho é único - '0', tamanho nulo é -1}
    inPR_QTMI: Integer;
    inPR_TTAM: Real;
    inPR_PAR1: Integer;          {assume os valores 1,2 - cor e tamanho}
    inPR_PAR2: Integer;          {" "}
    inPR_REFF: String;           {ref. do fabricante}
    inPR_DCAD: TDateTime;        {data de cadastro}
    inPR_ULC1: TDateTime;        {ultima venda}
    inPR_ULC2: TDateTime;        {ultima venda}

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
function TClassProdutos.Filter (filtro: String):Boolean;
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
procedure TClassProdutos.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  try
    consulta.databasename := banco;
  except
    Erro (2);
  end;
end;

{Desconexao ao banco}
procedure TClassProdutos.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores é lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao é armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassProdutos.Result (campo: String) :Variant;
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
function TClassProdutos.ClearSql           :Boolean;
begin
  try
    consulta.sql.clear;
    ClearSql:=true;
  except
    ClearSql:=false;
  end;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassProdutos.ClearFields:Boolean;
begin
  try
    inPR_GRUP:=0;
    inPR_SUBG:=0;
    inPR_CODI:=0;
    inPR_FORN:=0;
    inPR_DESC:='';
    inPR_REFI:='';
    inPR_UNID:='';
    inPR_LINH:='';
    inPR_COLE:='';
    inPR_MAT1:='';
    inPR_MAT2:='';
    inPR_MAT3:='';
    inPR_DMIN:=0.00;
    inPR_DMAX:=0.00;
    inPR_CUNI:='0';
    inPR_TUNI:='0';
    inPR_QTMI:=0;
    inPR_TTAM:=0;
    inPR_PAR1:=0;
    inPR_PAR2:=0;
    inPR_REFF:='';
    inPR_DCAD:=strtodate('01/01/1900');
    inPR_ULC1:=strtodate('01/01/1900');
    inPR_ULC2:=strtodate('01/01/1900');
    ClearFields     := true;
  except
    ClearFields     := false;
  end;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassProdutos.AddParam      (linha: String):Boolean;
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
function TClassProdutos.Execute:Boolean;
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
function TClassProdutos.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into ');
  consulta.Sql.Add     ('  PRODUTOS(PR_GRUP,PR_SUBG,PR_CODI,PR_FORN,PR_DESC,PR_REFI, ');
  consulta.Sql.Add     ('    PR_UNID,PR_LINH,PR_COLE,PR_MAT1,PR_DCAD, ');
  consulta.Sql.Add     ('    PR_MAT2,PR_MAT3,PR_DMIN,PR_DMAX,PR_CUNI,PR_TUNI, ');
  consulta.Sql.Add     ('    PR_QTMI,PR_TTAM,PR_PAR1,PR_PAR2,PR_REFF,PR_ULC1,PR_ULC2) ');
  consulta.Sql.Add     ('Values (:PR_GRUP,:PR_SUBG,:PR_CODI,:PR_FORN,:PR_DESC,:PR_REFI, ');
  consulta.Sql.Add     ('    :PR_UNID,:PR_LINH,:PR_COLE,:PR_MAT1,:PR_DCAD, ');
  consulta.Sql.Add     ('    :PR_MAT2,:PR_MAT3,:PR_DMIN,:PR_DMAX,:PR_CUNI,:PR_TUNI, ');
  consulta.Sql.Add     ('    :PR_QTMI,:PR_TTAM,:PR_PAR1,:PR_PAR2,:PR_REFF,:PR_ULC1,:PR_ULC2) ');
  consulta.ParamByName ('pr_grup').AsFloat    := inPR_GRUP;
  consulta.ParamByName ('pr_subg').AsFloat    := inPR_SUBG;
  consulta.ParamByName ('pr_codi').AsFloat    := inPR_CODI;
  consulta.ParamByName ('pr_forn').AsFloat    := inPR_FORN;
  consulta.ParamByName ('pr_desc').AsString   := inPR_DESC;
  consulta.ParamByName ('pr_refi').AsString    := inPR_REFI;
  consulta.ParamByName ('pr_unid').AsString    := inPR_UNID;
  consulta.ParamByName ('pr_linh').AsString    := inPR_LINH;
  consulta.ParamByName ('pr_cole').AsString    := inPR_COLE;
  consulta.ParamByName ('pr_mat1').AsString    := inPR_MAT1;
  consulta.ParamByName ('pr_mat2').AsString    := inPR_MAT2;
  consulta.ParamByName ('pr_mat3').AsString    := inPR_MAT3;
  consulta.ParamByName ('pr_dmin').AsFloat    := inPR_DMIN;
  consulta.ParamByName ('pr_dmax').AsFloat    := inPR_DMAX;
  consulta.ParamByName ('pr_cuni').AsString    := inPR_CUNI;
  consulta.ParamByName ('pr_tuni').AsString    := inPR_TUNI;
  consulta.ParamByName ('pr_qtmi').AsInteger  := inPR_QTMI;
  consulta.ParamByName ('pr_ttam').AsFloat  := inPR_TTAM;
  consulta.ParamByName ('pr_par1').AsInteger := inPR_PAR1;
  consulta.ParamByName ('pr_par2').AsInteger := inPR_PAR2;
  consulta.ParamByName ('pr_reff').AsString := inPR_REFF;
  consulta.ParamByName ('pr_dcad').AsDateTime := inPR_DCAD;
  consulta.ParamByName ('pr_ulc1').AsDateTime := inPR_ULC1;
  consulta.ParamByName ('pr_ulc2').AsDateTime := inPR_ULC2;
  try
    consulta.ExecSql;
    Insert:=true;
  except
    Insert:=false;
  end;
end;

{** - Funcao de alteracao dos campos do plano }
function TClassProdutos.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update PRODUTOS                                         ');
  consulta.Sql.Add     ('Set PR_GRUP=:PR_GRUP,PR_SUBG=:PR_SUBG,PR_CODI=:PR_CODI, ');
  consulta.Sql.Add     ('    PR_FORN=:PR_FORN,PR_DESC=:PR_DESC,PR_REFI=:PR_REFI, ');
  consulta.Sql.Add     ('    PR_UNID=:PR_UNID,PR_REFF=:PR_REFF,PR_ULC1=:PR_ULC1, ');
  consulta.Sql.Add     ('    PR_LINH=:PR_LINH,PR_COLE=:PR_COLE,PR_MAT1=:PR_MAT1, ');
  consulta.Sql.Add     ('    PR_MAT2=:PR_MAT2,PR_MAT3=:PR_MAT3,PR_DMIN=:PR_DMIN, ');
  consulta.Sql.Add     ('    PR_DMAX=:PR_DMAX,PR_CUNI=:PR_CUNI,PR_TUNI=:PR_TUNI, ');
  consulta.Sql.Add     ('    PR_QTMI=:PR_QTMI,PR_TTAM=:PR_TTAM,PR_PAR1=:PR_PAR1, ');
  consulta.Sql.Add     ('    PR_PAR2=:PR_PAR2,PR_DCAD=:PR_DCAD,PR_ULC2=:PR_ULC2  ');
  consulta.Sql.Add     ('Where (PR_GRUP=:pr_grup) AND (PR_SUBG=:pr_subg) AND (PR_CODI=:pr_codi) ');
  consulta.ParamByName ('pr_grup').AsFloat    := inPR_GRUP;
  consulta.ParamByName ('pr_subg').AsFloat    := inPR_SUBG;
  consulta.ParamByName ('pr_codi').AsFloat    := inPR_CODI;
  consulta.ParamByName ('pr_forn').AsFloat    := inPR_FORN;
  consulta.ParamByName ('pr_desc').AsString   := inPR_DESC;
  consulta.ParamByName ('pr_refi').AsString    := inPR_REFI;
  consulta.ParamByName ('pr_unid').AsString    := inPR_UNID;
  consulta.ParamByName ('pr_linh').AsString    := inPR_LINH;
  consulta.ParamByName ('pr_cole').AsString    := inPR_COLE;
  consulta.ParamByName ('pr_mat1').AsString    := inPR_MAT1;
  consulta.ParamByName ('pr_mat2').AsString    := inPR_MAT2;
  consulta.ParamByName ('pr_mat3').AsString    := inPR_MAT3;
  consulta.ParamByName ('pr_dmin').AsFloat    := inPR_DMIN;
  consulta.ParamByName ('pr_dmax').AsFloat    := inPR_DMAX;
  consulta.ParamByName ('pr_cuni').AsString    := inPR_CUNI;
  consulta.ParamByName ('pr_tuni').AsString    := inPR_TUNI;
  consulta.ParamByName ('pr_qtmi').AsInteger  := inPR_QTMI;
  consulta.ParamByName ('pr_ttam').AsFloat  := inPR_TTAM;
  consulta.ParamByName ('pr_par1').AsInteger := inPR_PAR1;
  consulta.ParamByName ('pr_par2').AsInteger := inPR_PAR2;
  consulta.ParamByName ('pr_reff').AsString := inPR_REFF;
  consulta.ParamByName ('pr_dcad').AsDateTime := inPR_DCAD;
  consulta.ParamByName ('pr_ulc1').AsDateTime := inPR_ULC1;
  consulta.ParamByName ('pr_ulc2').AsDateTime := inPR_ULC2;
  try
    consulta.ExecSql;
    UpdateAll:=true;
  except
    UpdateAll:=false;
  end;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassProdutos.Next:Boolean;
begin
  try
    consulta.next;
    Next := true;
  except
    Next := false;
  end;
end;

function TClassProdutos.Prior:Boolean;
begin
  try
    consulta.prior;
    Prior := true;
  except
    Prior := false;
  end;
end;

function TClassProdutos.First:Boolean;
begin
  try
    consulta.first;
    First := true;
  except
    First := false;
  end;
end;

function TClassProdutos.Last:Boolean;
begin
  try
    consulta.last;
    Last := true;
  except
    Last := false;
  end;
end;

function TClassProdutos.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassProdutos.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassProdutos.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

{Precedimento de exibicao das mensagens de erro internas da classe de acesso}
procedure TClassProdutos.Erro (nivel: Integer);
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
