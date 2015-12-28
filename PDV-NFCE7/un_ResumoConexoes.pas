unit un_ResumoConexoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, Grids;

type
  Tfrm_ResumoConexoes = class(TForm)
    BotaoSair1: TBotaoSair;
    grade: TStringGrid;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ResumoConexoes: Tfrm_ResumoConexoes;

implementation

{$R *.DFM}

uses principal;

procedure Tfrm_ResumoConexoes.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ResumoConexoes.FormCreate(Sender: TObject);
begin
     {****************************************************************}
  grade.Cells[0,0] := 'VENDAS';
  if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
    grade.Cells[1,0] := 'OK  - Acessível / SQL Server'
  else
  if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
    grade.Cells[1,0] := 'OK  - Acessível / Interbase';
     {****************************************************************}
  grade.Cells[0,1] := 'ESTOQUE';
  if (databaseprodutos='ESTOQUE') then
  begin
    if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      grade.Cells[1,1] := 'OK  - ON LINE / SQL Server'
    else
    if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      grade.Cells[1,1] := 'OK  - ON LINE / Interbase';
  end
  else
    grade.Cells[1,1] := 'OFF LINE';
     {****************************************************************}
  grade.Cells[0,2] := 'CONTAS A PAGAR';
  if (databasecontas='CONTASPAGAR') then
  begin
    if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      grade.Cells[1,2] := 'OK  - Acessível / SQL Server'
    else
    if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      grade.Cells[1,2] := 'OK  - Acessível / Interbase';
  end
  else
    grade.Cells[1,2] := 'Inacessível!!!';
     {****************************************************************}
  grade.Cells[0,3] := 'CREDIÁRIO';
  if (databasecredito='CREDITO') then
  begin
    if (frm_principal.x_banco_de_dados_crediario=KDB_SQL_SERVER) then
      grade.Cells[1,3] := 'OK  - Acessível / SQL Server'
    else
    if (frm_principal.x_banco_de_dados_crediario=KDB_INTERBASE) then
      grade.Cells[1,3] := 'OK  - Acessível / Interbase';
  end
  else
    grade.Cells[1,3] := 'Inacessível!!!';
     {****************************************************************}
end;

end.
