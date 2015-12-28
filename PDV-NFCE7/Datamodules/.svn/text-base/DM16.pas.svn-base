unit DM16;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, extctrls;

function FMaxiCod(NomeTab:String;FDb:String):Real;
function MaxiCod_credito (nometab: String; painel: TPanel):Real;
function MaxiCod_vendas (nometab: String; painel: TPanel):Real;
function MaxiCod_estoque (nometab: String; painel: TPanel):Real;
function MaxiCod_contaspagar (nometab: String; painel: TPanel):Real;

type
  TDMmaxicod = class(TDataModule)
    spMaxiCod_credito_1: TStoredProc;
    spMaxiCod_credito_2: TStoredProc;
    spMaxiCod_vendas_1: TStoredProc;
    spMaxiCod_vendas_2: TStoredProc;
    spMaxiCod_estoque_2: TStoredProc;
    spMaxiCod_estoque_1: TStoredProc;
    spMaxiCod_contaspagar_2: TStoredProc;
    spMaxiCod_contaspagar_1: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMmaxicod: TDMmaxicod;

implementation

uses principal;

{$R *.DFM}

function MaxiCod_credito (nometab: String; painel: TPanel):Real;
var
  numProb: Integer;
  codigo: Real;
begin
  numProb := 1;
  while (true) do
    try
      if (frm_principal.x_banco_de_dados_crediario=KDB_INTERBASE) then
      begin
        DMmaxicod.spMaxiCod_credito_1.parambyname('TABELA').AsString:=nometab;
        DMmaxicod.spMaxiCod_credito_1.ExecProc;
        codigo := DMmaxicod.spMaxiCod_credito_1.parambyname('PROXCOD').AsFloat;
        break;
        painel.caption:='';
      end
      else
      if (frm_principal.x_banco_de_dados_crediario=KDB_SQL_SERVER) then
      begin
{           DMmaxicod.spMaxiCod_credito_2.parambyname('@tabela').AsString:='GEN_'+nometab;
           DMmaxicod.spMaxiCod_credito_2.ExecProc;
           codigo := DMmaxicod.spMaxiCod_credito_2.parambyname('@codigo').AsInteger;}
        Codigo := FMaxiCod(NomeTab,'CREDITO');
        break;
        painel.caption:='';
      end;
    except
      numProb:=numProb+1;
      painel.caption:='N. de tentativas de busca pelo sequencial: '+inttostr(numProb);
      painel.refresh;
    end;
  MaxiCod_credito:=codigo;
end;

function MaxiCod_vendas (nometab: String; painel: TPanel):Real;
var
  numProb: Integer;
  codigo: Real;
begin
  numProb := 1;
  while (true) do
    try
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        DMmaxicod.spMaxiCod_vendas_1.parambyname('TABELA').AsString:=nometab;
        DMmaxicod.spMaxiCod_vendas_1.ExecProc;
        codigo := DMmaxicod.spMaxiCod_vendas_1.parambyname('PROXCOD').AsFloat;
        break;
        painel.caption:='';
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
{           DMmaxicod.spMaxiCod_vendas_2.parambyname('@tabela').AsString:='GEN_'+nometab;
           DMmaxicod.spMaxiCod_vendas_2.ExecProc;
           codigo := DMmaxicod.spMaxiCod_vendas_2.parambyname('@codigo').AsInteger;}
        Codigo := FMaxiCod(NomeTab,'VENDAS');
        break;
        painel.caption:='';
      end;
    except
      numProb:=numProb+1;
      painel.caption:='N. de tentativas de busca pelo sequencial: '+inttostr(numProb);
      painel.refresh;
    end;
  MaxiCod_vendas:=codigo;
end;

function MaxiCod_estoque (nometab: String; painel: TPanel):Real;
var
  numProb: Integer;
  codigo: Real;
  qry:tquery;
begin
  numProb := 1;
  while (true) do
    try
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        DMmaxicod.spMaxiCod_estoque_1.parambyname('TABELA').AsString:=nometab;
        DMmaxicod.spMaxiCod_estoque_1.ExecProc;
        codigo := DMmaxicod.spMaxiCod_estoque_1.parambyname('PROXCOD').AsFloat;
        break;
        painel.caption:='';
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
           {DMmaxicod.spMaxiCod_estoque_2.parambyname('@tabela').AsString:='GEN_'+nometab;
           DMmaxicod.spMaxiCod_estoque_2.ExecProc;
           codigo := DMmaxicod.spMaxiCod_estoque_2.parambyname('@codigo').AsInteger;}
        Codigo := FMaxiCod(NomeTab,'ESTOQUE');
        break;
        painel.caption:='';
      end;
    except
      numProb:=numProb+1;
      painel.caption:='N. de tentativas de busca pelo sequencial: '+inttostr(numProb);
      painel.refresh;
    end;
  MaxiCod_estoque:=codigo;
end;

function MaxiCod_contaspagar (nometab: String; painel: TPanel):Real;
var
  numProb: Integer;
  codigo: Real;
begin
  numProb := 1;
  while (true) do
    try
      if (frm_principal.x_banco_de_dados_contas=KDB_INTERBASE) then
      begin
        DMmaxicod.spMaxiCod_contaspagar_1.parambyname('TABELA').AsString:=nometab;
        DMmaxicod.spMaxiCod_contaspagar_1.ExecProc;
        codigo := DMmaxicod.spMaxiCod_contaspagar_1.parambyname('PROXCOD').AsFloat;
        painel.caption:='';
        break;
      end
      else
      if (frm_principal.x_banco_de_dados_contas=KDB_SQL_SERVER) then
      begin
{           DMmaxicod.spMaxiCod_contaspagar_2.parambyname('@tabela').AsString:='GEN_'+nometab;
           DMmaxicod.spMaxiCod_contaspagar_2.ExecProc;
           codigo := DMmaxicod.spMaxiCod_contaspagar_2.parambyname('@codigo').AsInteger;}
        Codigo := FMaxiCod(NomeTab,'CONTASPAGAR');
        break;
        painel.caption:='';
      end;
    except
      numProb:=numProb+1;
      painel.caption:='N. de tentativas de busca pelo sequencial: '+inttostr(numProb);
      painel.refresh;
    end;
  MaxiCod_contaspagar:=codigo;
end;

function FMaxiCod(NomeTab:String;FDb:String):Real;
var
  Qry:Tquery;
begin
  qry := tquery.create(application);
  with qry do
    try
      try
        databasename := FDb;
        sql.clear;
        sql.add('Select Codigo from Gen_'+NomeTab);
        Open;
        Result := Fieldbyname('Codigo').AsFloat + 1;

        sql.clear;
        sql.add('Update Gen_'+NomeTab+' Set Codigo =:Codigo');
        parambyname('Codigo').AsFloat := Result;
        execsql;
      except
        on E:Exception do
        begin
          showmessage('Erro '+#13+e.message);
        end;
      end;
    finally
      destroy; 
    end;
end;

end.
