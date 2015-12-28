unit unSangria_Motivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,db,dbtables, BotaoSair;

type
  TfrmSangria_Motivos = class(TForm)
    lista: TListBox;
    Label1: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    BotaoSair1: TBotaoSair;
    procedure listaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure listaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure listaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tecla: Integer;
    Clicar: Integer;
  end;

var
  frmSangria_Motivos: TfrmSangria_Motivos;

implementation

uses Principal, funcoes2;

{$R *.dfm}

procedure TfrmSangria_Motivos.listaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    if Clicar=0 then
      ExibeCritica ('Informe o motivo desejado','Vendas',Lista)
    else
    begin
      tecla:=13;
      close;
    end;
end;

procedure TfrmSangria_Motivos.listaDblClick(Sender: TObject);
begin
  tecla:=13;
  close;
end;

procedure TfrmSangria_Motivos.FormCreate(Sender: TObject);
var
  fquery:tquery;
begin
  tecla:=27;
  lista.items.clear;
  fquery := tquery.create(application);
  try
    fquery.databasename := databaseprodutos;
    fquery.sql.add('Select Codigo,Descricao from MTV_SANG');
    fquery.sql.add('Order by Codigo');
    fquery.open;

    while not FQuery.Eof do
    begin
      lista.items.add(FormatFloat('00',FQuery.FieldByName('Codigo').AsFloat)+'.'+FQuery.FieldByName('Descricao').AsString);
      fquery.next;
    end;
  finally
    fquery.destroy;
  end;

end;

procedure TfrmSangria_Motivos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure TfrmSangria_Motivos.FormActivate(Sender: TObject);
begin
  lista.SelectAll;
  Clicar:=0;
end;

procedure TfrmSangria_Motivos.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSangria_Motivos.listaClick(Sender: TObject);
begin
  Clicar:=1;
end;

end.
