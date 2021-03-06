{*** classe geral de acesso a entidade cliente}
unit cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassCliente = class(TObject)
  private
    consulta: TQuery;
  public
    inCL_CODI: Real;
    inCL_LOJA: Real;
    inCL_NOME: String;
    inCL_ENDE: String;
    inCL_SEXO: String;
    inCL_BAIR: String;
    inCL_CIDA: String;
    inCL_ESTA: String;
    inCL_CEP:  String;
    inCL_FONE: String;
    inCL_FAX:  String;
    inCL_CELU: String;
    inCL_EMAI: String;
    inCL_DTNA: TDateTime;
    inCL_IDEN: String;
    inCL_OEXP: String;
    inCL_CPF : String;
    inCL_ECIV: String;
    inCL_CONJ: String;
    inCL_NPAI: String;
    inCL_NMAE: String;
    inCL_REF1: String;
    inCL_TRF1: String;
    inCL_REF2: String;
    inCL_TRF2: String;
    inCL_EMPR: String;
    inCL_CARG: String;
    inCL_EEMP: String;
    inCL_FEMP: String;
    inCL_REMP: String;
    inCL_CPRO: String;
    inCL_DADM: TDateTime;
    inCL_SALA: Real;
    inCL_LIMC: Real;
    inCL_CFUN: String;
    inCL_TPRO: String;
    inCL_RSPC: String;
    inCL_DSPC: TDateTime;
    inCL_DREG: TDateTime;
    inCL_VALI: TDateTime;
    inCL_DTCA: TDateTime;
    inCL_ULTC: TDateTime;
    inCL_QTDC: Real;
    inCL_OBSE: String;
    inCL_DULP: TDateTime;
    inCL_PDC:  String;
    inCL_ALTE: String; {flag. que indica que o endereco do cliente esta inalterado}
    inCL_LIVR: String;
    inCL_TIME: TDateTime;
    inCL_TIPO_LOGRADOURO: String;
    inCL_NUMERO: String;
    inCL_COMPLEMENTO: String;
    inCL_IBGE_CIDADE: Integer;
    inCL_IBGE_UF: Integer;
    inCL_PAIS: String;
    inCL_CODIGO_PAIS: String;

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
function TClassCliente.Filter (filtro: String):Boolean;
begin
  consulta.filtered := false;
  consulta.filter   := filtro;
  consulta.filtered := true;
  Filter            := true;
end;

{Construtor padrao da classe - serve para instanciar a query em tempo de execucao}
{Alem de inicializa-la automaticamente de acordo com a conexao utilizada}
procedure TClassCliente.Conect (banco: String; Owner: TComponent);
begin
  consulta := TQuery.Create(Owner);
  consulta.databasename := banco;
end;

{Desconexao ao banco}
procedure TClassCliente.Desconect;
begin
  consulta.Free;
end;

{Eesta funcao vai ficar sob observacao - a COERCAO, conversao de tipos segundo}
{alguns programadores � lenta}
{ATENCAO: A melhor forma de trabalhar com essa funcao � armazenar os valores em}
{variaveis fixas e realizar operacoes nessas variaveis, tornando os processamentos}
{mais rapidos}
function TClassCliente.Result (campo: String) :Variant;
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
    Result := consulta.fieldbyname(campo).value{Para campos DATA � feito um trat. especial};
end;

{Limpeza da propriedade SQL da querie criada para selecao}
function TClassCliente.ClearSql           :Boolean;
begin
  consulta.sql.clear;
  ClearSql:=true;
end;

{Funcao de limpeza das variaveis que serao usadas para acessar cada campo da tabela}
function TClassCliente.ClearFields:Boolean;
begin
  inCL_CODI         := 0;
  inCL_NOME         := '';
  inCL_ENDE         := '';
  inCL_LOJA         := 0;
  inCL_SEXO         := '0';
  inCL_BAIR         := '';
  inCL_CIDA         := '';
  inCL_ESTA         := '';
  inCL_CEP          := '';
  inCL_FONE         := '';
  inCL_FAX          := '';
  inCL_CELU         := '';
  inCL_EMAI         := '';
  inCL_DTNA         := strtodate('01/01/1900');
  inCL_IDEN         := '';
  inCL_OEXP         := '';
  inCL_CPF          := '';
  inCL_ECIV         := '?';
  inCL_CONJ         := '';
  inCL_NPAI         := '';
  inCL_NMAE         := '';
  inCL_REF1         := '';
  inCL_TRF1         := '';
  inCL_REF2         := '';
  inCL_TRF2         := '';
  inCL_EMPR         := '';
  inCL_CARG         := '';
  inCL_EEMP         := '';
  inCL_FEMP         := '';
  inCL_REMP         := '';
  inCL_CPRO         := '';
  inCL_SALA         := 0.00;
  inCL_LIMC         := 0.00;
  inCL_CFUN         := '0';
  inCL_TPRO         := '0';
  inCL_RSPC         := '0';
  inCL_DADM         := strtodate ('01/01/1900');
  inCL_DSPC         := strtodate ('01/01/1900');
  inCL_DREG         := strtodate ('01/01/1900');
  inCL_VALI         := strtodate ('01/01/1900');
  inCL_DTCA         := strtodate ('01/01/1900');
  inCL_ULTC         := strtodate ('01/01/1900');
  inCL_QTDC         := 0;
  inCL_OBSE         := '';
  inCL_DULP         := strtodate ('01/01/1900');
  inCL_ALTE         := '0';
  inCL_PDC          := '';
  inCL_LIVR         := ''; 
  inCL_TIME         := strtodate ('01/01/1900');
  ClearFields     := true;
end;

{Esta funcao a cada vez que e chamada, coloca a string determinada no AddParametro
 SQL da querie - para queries criadas em tempo de design}
function TClassCliente.AddParam      (linha: String):Boolean;
begin
  consulta.close;
  consulta.sql.add (linha);
  AddParam := true;
end;

{Funcao que implementa um SELECT na tabela dos clientes}
{ATENCAO: Esta funcao aparentemente esta oferecendo um GARGALO na classe}
{Aparentemente, o GARGALO esta no primeiro select logo apos o Conect}
function TClassCliente.Execute:Boolean;
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
function TClassCliente.Insert:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Insert into                                                               ');
  consulta.Sql.Add     ('CRECLI  (CL_CODI,CL_LOJA,CL_NOME,CL_ENDE,CL_SEXO,CL_BAIR,CL_CIDA,         ');
  consulta.Sql.Add     ('         CL_ESTA,CL_CEP ,CL_FONE,CL_FAX ,CL_CELU,CL_EMAI,CL_DTNA,         ');
  consulta.Sql.Add     ('         CL_IDEN,CL_OEXP,CL_CPF,CL_ECIV,CL_CONJ,CL_NPAI,CL_NMAE,          ');
  consulta.Sql.Add     ('         CL_REF1,CL_REF2,CL_EMPR,CL_CARG,CL_EEMP,CL_FEMP,CL_REMP,         ');
  consulta.Sql.Add     ('         CL_CPRO,CL_SALA,CL_LIMC,CL_CFUN,CL_TPRO,CL_RSPC,CL_DSPC,         ');
  consulta.Sql.Add     ('         CL_DREG,CL_VALI,CL_DTCA,CL_ULTC,CL_QTDC,CL_OBSE,CL_DADM,         ');
  consulta.Sql.Add     ('         CL_TRF1,CL_TRF2,CL_DULP,CL_ALTE,CL_PDC,CL_TIME,CL_LIVR,          ');
  consulta.SQL.Add     ('         CL_TIPO_LOGRADOURO,CL_NUMERO,CL_COMPLEMENTO,CL_IBGE_CIDADE,      ');
  consulta.SQL.Add     ('         CL_IBGE_UF,CL_PAIS,CL_CODIGO_PAIS)                               ');
  consulta.Sql.Add     ('Values  (:cl_codi,:cl_loja,:cl_nome,:cl_ende,:cl_sexo,:cl_bair,:cl_cida,  ');
  consulta.Sql.Add     ('         :cl_esta,:cl_cep,:cl_fone,:cl_fax,:cl_celu,:cl_emai,:cl_dtna,    ');
  consulta.Sql.Add     ('         :cl_iden,:CL_OEXP,:CL_CPF,:cl_eciv,:cl_conj,:cl_npai,:cl_nmae,   ');
  consulta.Sql.Add     ('         :cl_ref1,:cl_ref2,:cl_empr,:cl_carg,:cl_eemp,:cl_femp,:cl_remp,  ');
  consulta.Sql.Add     ('         :cl_cpro,:cl_sala,:cl_limc,:cl_cfun,:cl_tpro,:cl_rspc,:cl_dspc,  ');
  consulta.Sql.Add     ('         :cl_dreg,:cl_vali,:cl_dtca,:cl_ultc,:cl_qtdc,:cl_obse,:cl_dadm,  ');
  consulta.Sql.Add     ('         :cl_trf1,:cl_trf2,:cl_dulp,:cl_alte,:cl_pdc,:cl_time,:cl_livr,   ');
  consulta.SQL.Add     ('         :cl_tipo_logradouro,:cl_numero,:cl_complemento,:cl_ibge_cidade,  ');
  consulta.SQL.Add     ('         :cl_ibge_uf,:cl_pais,:cl_codigo_pais)                            ');
  consulta.ParamByName ('cl_codi').AsFloat  := inCL_CODI;
  consulta.ParamByName ('cl_nome').AsString := inCL_NOME;
  consulta.ParamByName ('cl_ende').AsString := inCL_ENDE;
  consulta.ParamByName ('cl_loja').AsFloat  := inCL_LOJA;
  consulta.ParamByName ('cl_sexo').AsString := inCL_SEXO;
  consulta.ParamByName ('cl_bair').AsString := inCL_BAIR;
  consulta.ParamByName ('cl_cida').AsString := inCL_CIDA;
  consulta.ParamByName ('cl_esta').AsString := inCL_ESTA;
  consulta.ParamByName ('cl_cep').AsString  := inCL_CEP;
  consulta.ParamByName ('cl_fone').AsString := inCL_FONE;
  consulta.ParamByName ('cl_fax').AsString  := inCL_FAX;
  consulta.ParamByName ('cl_celu').AsString := inCL_CELU;
  consulta.ParamByName ('cl_emai').AsString := inCL_EMAI;
  consulta.ParamByName ('cl_dtna').AsDateTime := inCL_DTNA;
  consulta.ParamByName ('cl_iden').AsString := inCL_IDEN;
  consulta.ParamByName ('cl_oexp').AsString := inCL_OEXP;
  consulta.ParamByName ('cl_cpf').AsString  := inCL_CPF;
  consulta.ParamByName ('cl_eciv').AsString := inCL_ECIV;
  consulta.ParamByName ('cl_conj').AsString := inCL_CONJ;
  consulta.ParamByName ('cl_npai').AsString := inCL_NPAI;
  consulta.ParamByName ('cl_nmae').AsString := inCL_NMAE;
  consulta.ParamByName ('cl_ref1').AsString := inCL_REF1;
  consulta.ParamByName ('cl_ref2').AsString := inCL_REF2;
  consulta.ParamByName ('cl_empr').AsString := inCL_EMPR;
  consulta.ParamByName ('cl_carg').AsString := inCL_CARG;
  consulta.ParamByName ('cl_eemp').AsString := inCL_EEMP;
  consulta.ParamByName ('cl_femp').AsString := inCL_FEMP;
  consulta.ParamByName ('cl_remp').AsString := inCL_REMP;
  consulta.ParamByName ('cl_cpro').AsString := inCL_CPRO;
  consulta.ParamByName ('cl_sala').AsFloat  := inCL_SALA;
  consulta.ParamByName ('cl_limc').AsFloat  := inCL_LIMC;
  consulta.ParamByName ('cl_cfun').AsString := inCL_CFUN;
  consulta.ParamByName ('cl_tpro').AsString := inCL_TPRO;
  consulta.ParamByName ('cl_rspc').AsString := inCL_RSPC;
  consulta.ParamByName ('cl_dspc').AsDateTime := inCL_DSPC;
  consulta.ParamByName ('cl_dreg').AsDateTime := inCL_DREG;
  consulta.ParamByName ('cl_vali').AsDateTime := inCL_VALI;
  consulta.ParamByName ('cl_dtca').AsDateTime := inCL_DTCA;
  consulta.ParamByName ('cl_ultc').AsDateTime := inCL_ULTC;
  consulta.ParamByName ('cl_qtdc').AsFloat    := inCL_QTDC;
  consulta.ParamByName ('cl_obse').AsString   := inCL_OBSE;
  consulta.ParamByName ('cl_dadm').AsDateTime := inCL_DADM;
  consulta.ParamByName ('cl_trf1').AsString   := inCL_TRF1;
  consulta.ParamByName ('cl_trf2').AsString   := inCL_TRF2;
  consulta.ParamByName ('cl_dulp').AsDateTime := inCL_DULP;
  consulta.ParamByName ('cl_alte').AsString   := inCL_ALTE;
  consulta.ParamByName ('cl_pdc').AsString    := inCL_PDC;
  consulta.ParamByName ('cl_livr').AsString   := inCL_LIVR;
  consulta.ParamByName ('cl_time').AsDateTime := inCL_TIME;
  consulta.ParamByName ('CL_TIPO_LOGRADOURO').AsString := inCL_TIPO_LOGRADOURO;
  consulta.ParamByName ('CL_NUMERO').AsString          := inCL_NUMERO;
  consulta.ParamByName ('CL_COMPLEMENTO').AsString     := inCL_COMPLEMENTO;
  consulta.ParamByName ('CL_IBGE_CIDADE').AsInteger    := inCL_IBGE_CIDADE;
  consulta.ParamByName ('CL_IBGE_UF').AsInteger        := inCL_IBGE_UF;
  consulta.ParamByName ('CL_PAIS').AsString            := inCL_PAIS;
  consulta.ParamByName ('CL_CODIGO_PAIS').AsString     := inCL_CODIGO_PAIS;
  consulta.ExecSql;
  Insert := true;
end;

{** - Funcao de insercao de clientes }
{Falta acrescentar os outros campos *************}
function TClassCliente.UpdateAll:Boolean;
begin
  consulta.Sql.Clear;
  consulta.Sql.Add     ('Update CRECLI                                                 ');
  consulta.Sql.Add     ('Set      CL_CODI=:cl_codi,CL_LOJA=:cl_loja,CL_NOME=:cl_nome,  ');
  consulta.Sql.Add     ('         CL_ENDE=:cl_ende,CL_SEXO=:cl_sexo,CL_BAIR=:cl_bair,  ');
  consulta.Sql.Add     ('         CL_CIDA=:cl_cida,CL_ESTA=:cl_esta,CL_CEP=:cl_cep,    ');
  consulta.Sql.Add     ('         CL_FONE=:cl_fone,CL_FAX=:cl_fax,CL_CELU=:cl_celu,    ');
  consulta.Sql.Add     ('         CL_EMAI=:cl_emai,CL_DTNA=:cl_dtna,CL_IDEN=:cl_iden,  ');
  consulta.Sql.Add     ('         CL_OEXP=:cl_oexp,CL_CPF=:cl_cpf,CL_ECIV=:cl_eciv,    ');
  consulta.Sql.Add     ('         CL_CONJ=:cl_conj,CL_NPAI=:cl_npai,CL_NMAE=:cl_nmae,  ');
  consulta.Sql.Add     ('         CL_REF1=:cl_ref1,CL_REF2=:cl_ref2,CL_EMPR=:cl_empr,  ');
  consulta.Sql.Add     ('         CL_CARG=:cl_carg,CL_EEMP=:cl_eemp,CL_FEMP=:cl_femp,  ');
  consulta.Sql.Add     ('         CL_REMP=:cl_remp,CL_CPRO=:cl_cpro,CL_SALA=:cl_sala,  ');
  consulta.Sql.Add     ('         CL_LIMC=:cl_limc,CL_CFUN=:cl_cfun,CL_TPRO=:cl_tpro,  ');
  consulta.Sql.Add     ('         CL_RSPC=:cl_rspc,CL_DSPC=:cl_dspc,CL_DREG=:cl_dreg,  ');
  consulta.Sql.Add     ('         CL_VALI=:cl_vali,CL_DTCA=:cl_dtca,CL_ULTC=:cl_ultc,  ');
  consulta.Sql.Add     ('         CL_QTDC=:cl_qtdc,CL_OBSE=:cl_obse,CL_DADM=:cl_dadm,  ');
  consulta.Sql.Add     ('         CL_TRF1=:cl_trf1,CL_TRF2=:cl_trf2,CL_DULP=:cl_dulp,  ');
  consulta.Sql.Add     ('         CL_ALTE=:cl_alte,CL_PDC=:cl_pdc  ,CL_TIME=:cl_time,  ');
  consulta.Sql.Add     ('         CL_LIVR=:cl_livr,                                    ');
  consulta.SQL.Add     ('         CL_TIPO_LOGRADOURO=:cl_tipo_logradouro,              ');
  consulta.SQL.Add     ('         CL_NUMERO=:cl_numero,CL_COMPLEMENTO=:cl_complemento, ');
  consulta.SQL.Add     ('         CL_IBGE_CIDADE=:cl_ibge_cidade,CL_IBGE_UF=:cl_ibge_uf, ');
  consulta.SQL.Add     ('         CL_PAIS=:cl_pais,CL_CODIGO_PAIS=:cl_codigo_pais        ');
  consulta.Sql.Add     ('Where    (CL_CODI=:cl_codi)                                   ');
  consulta.ParamByName ('cl_codi').AsFloat  := inCL_CODI;
  consulta.ParamByName ('cl_nome').AsString := inCL_NOME;
  consulta.ParamByName ('cl_ende').AsString := inCL_ENDE;
  consulta.ParamByName ('cl_loja').AsFloat  := inCL_LOJA;
  consulta.ParamByName ('cl_sexo').AsString := inCL_SEXO;
  consulta.ParamByName ('cl_bair').AsString := inCL_BAIR;
  consulta.ParamByName ('cl_cida').AsString := inCL_CIDA;
  consulta.ParamByName ('cl_esta').AsString := inCL_ESTA;
  consulta.ParamByName ('cl_cep').AsString  := inCL_CEP;
  consulta.ParamByName ('cl_fone').AsString := inCL_FONE;
  consulta.ParamByName ('cl_fax').AsString  := inCL_FAX;
  consulta.ParamByName ('cl_celu').AsString := inCL_CELU;
  consulta.ParamByName ('cl_emai').AsString := inCL_EMAI;
  consulta.ParamByName ('cl_dtna').AsDateTime := inCL_DTNA;
  consulta.ParamByName ('cl_iden').AsString := inCL_IDEN;
  consulta.ParamByName ('cl_oexp').AsString := inCL_OEXP;
  consulta.ParamByName ('cl_cpf').AsString  := inCL_CPF;
  consulta.ParamByName ('cl_eciv').AsString := inCL_ECIV;
  consulta.ParamByName ('cl_conj').AsString := inCL_CONJ;
  consulta.ParamByName ('cl_npai').AsString := inCL_NPAI;
  consulta.ParamByName ('cl_nmae').AsString := inCL_NMAE;
  consulta.ParamByName ('cl_ref1').AsString := inCL_REF1;
  consulta.ParamByName ('cl_ref2').AsString := inCL_REF2;
  consulta.ParamByName ('cl_empr').AsString := inCL_EMPR;
  consulta.ParamByName ('cl_carg').AsString := inCL_CARG;
  consulta.ParamByName ('cl_eemp').AsString := inCL_EEMP;
  consulta.ParamByName ('cl_femp').AsString := inCL_FEMP;
  consulta.ParamByName ('cl_remp').AsString := inCL_REMP;
  consulta.ParamByName ('cl_cpro').AsString := inCL_CPRO;
  consulta.ParamByName ('cl_sala').AsFloat  := inCL_SALA;
  consulta.ParamByName ('cl_limc').AsFloat  := inCL_LIMC;
  consulta.ParamByName ('cl_cfun').AsString := inCL_CFUN;
  consulta.ParamByName ('cl_tpro').AsString := inCL_TPRO;
  consulta.ParamByName ('cl_rspc').AsString := inCL_RSPC;
  consulta.ParamByName ('cl_dspc').AsDateTime := inCL_DSPC;
  consulta.ParamByName ('cl_dreg').AsDateTime := inCL_DREG;
  consulta.ParamByName ('cl_vali').AsDateTime := inCL_VALI;
  consulta.ParamByName ('cl_dtca').AsDateTime := inCL_DTCA;
  consulta.ParamByName ('cl_ultc').AsDateTime := inCL_ULTC;
  consulta.ParamByName ('cl_qtdc').AsFloat  := inCL_QTDC;
  consulta.ParamByName ('cl_obse').AsString := inCL_OBSE;
  consulta.ParamByName ('cl_dadm').AsDateTime := inCL_DADM;
  consulta.ParamByName ('cl_trf1').AsString := inCL_TRF1;
  consulta.ParamByName ('cl_trf2').AsString := inCL_TRF2;
  consulta.ParamByName ('cl_dulp').AsDateTime := inCL_DULP;
  consulta.ParamByName ('cl_alte').AsString := inCL_ALTE;
  consulta.ParamByName ('cl_pdc').AsString := inCL_PDC;
  consulta.ParamByName ('cl_livr').AsString := inCL_LIVR;
  consulta.ParamByName ('cl_time').AsDateTime := inCL_TIME;
  consulta.ParamByName ('CL_TIPO_LOGRADOURO').AsString := inCL_TIPO_LOGRADOURO;
  consulta.ParamByName ('CL_NUMERO').AsString          := inCL_NUMERO;
  consulta.ParamByName ('CL_COMPLEMENTO').AsString     := inCL_COMPLEMENTO;
  consulta.ParamByName ('CL_IBGE_CIDADE').AsInteger    := inCL_IBGE_CIDADE;
  consulta.ParamByName ('CL_IBGE_UF').AsInteger        := inCL_IBGE_UF;
  consulta.ParamByName ('CL_PAIS').AsString            := inCL_PAIS;
  consulta.ParamByName ('CL_CODIGO_PAIS').AsString     := inCL_CODIGO_PAIS;
  consulta.ExecSql;
  UpdateAll:=true;
end;

{Funcao que coloca o CURSOR de acesso a tabela na posicao do primeiro registro}
{****** NAVEGACAO na Querie padrao}
function TClassCliente.Next:Boolean;
begin
  consulta.next;
  Next := true;
end;

function TClassCliente.Prior:Boolean;
begin
  consulta.prior;
  Prior := true;
end;

function TClassCliente.First:Boolean;
begin
  consulta.first;
  First := true;
end;

function TClassCliente.Last:Boolean;
begin
  consulta.last;
  Last := true;
end;

function TClassCliente.Eof:Boolean;
begin
  if (consulta.eof) then
    Eof:=true
  else
    Eof:=false;
end;

function TClassCliente.Bof:Boolean;
begin
  if (consulta.eof) then
    Bof:=true
  else
    Bof:=false;
end;

{Funcao que retorna o numero de registros - no caso da querie estiver aberta
 se a querie estiver fechada, ela retorna -1}
function TClassCliente.RecCount:Integer;
begin
  if (not consulta.active) then
    RecCount:=(-1)
  else
    RecCount:=consulta.recordcount;
end;

end.
