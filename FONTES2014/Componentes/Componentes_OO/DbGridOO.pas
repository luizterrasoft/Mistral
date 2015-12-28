unit DbGridOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBTables, Db;

type
  TDbGridOO = class(TDbGrid)
  private
    { Private declarations }
    tabela: TQuery;
    dssource: TDatasource;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure ConectTable(banco: string); {conecta o objeto a um banco de dados}
    procedure ClearTable; {Limpa a clausula SQL}
    procedure AddTable(linha: string); {adiciona linhas à clausula SQL}
    procedure OpenTable; {Abre a tabela de SQL}
    procedure FormatNumericField(campo,formato: string); {Formato campos numericos}
    procedure OnCalcFields(evento: TDataSetNotifyEvent);
    procedure AddField(campo: TField);
    function  GetFieldTable(campo: string):TField;
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TDbGridOO.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     font.style := [fsBold];
     titlefont.style := [fsBold];
     tabela     := TQuery.Create(self);
     dssource   := TDatasource.Create(self);
     dssource.dataset := tabela;
     datasource := dssource;
     options := [dgTitles,dgIndicator,dgColumnResize,dgRowSelect,dgColLines,dgRowLines,dgTabs];
end;

procedure TDbGridOO.ConectTable(banco: string);
begin
     tabela.databasename := banco;
end;

function TDbGridOO.GetFieldTable(campo: string):TField;
begin
     result := tabela.fieldbyname(campo);
end;

procedure TDbGridOO.AddTable(linha: string);
begin
     tabela.sql.Add(linha);
end;

procedure TDbGridOO.OpenTable;
begin
     tabela.open;
end;

procedure TDbGridOO.ClearTable;
begin
     tabela.sql.clear;
end;

procedure TDbGridOO.FormatNumericField(campo,formato: string);
begin
     (tabela.fieldbyname(campo) as TFloatField).DisplayFormat:=formato;
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TDbGridOO]);
end;

procedure TDbGridOO.OnCalcFields(evento: TDataSetNotifyEvent);
begin
     tabela.OnCalcFields := evento;
end;

procedure TDbGridOO.AddField(campo: TField);
begin
     tabela.Fields.Add(campo);
end;

end.
