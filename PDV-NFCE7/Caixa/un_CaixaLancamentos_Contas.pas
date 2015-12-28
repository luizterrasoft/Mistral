unit un_CaixaLancamentos_Contas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, Db, DBTables, StdCtrls, Grids, DBGrids;

type
  Tfrm_CaixaLancamentos_Contas = class(TForm)
    BotaoSair1: TBotaoSair;
    ds: TDataSource;
    qContas: TQuery;
    grade: TDBGrid;
    Label22: TLabel;
    Label23: TLabel;
    rdNatu: TRadioGroup;
    qContasCO_CODI: TFloatField;
    qContasCO_DESC: TStringField;
    Bevel1: TBevel;
    lbltitulo: TLabel;
    lbltitulo_sombra: TLabel;
    Image2: TImage;
    procedure BotaoSair1Click(Sender: TObject);
    procedure rdNatuClick(Sender: TObject);
    procedure rdNatuExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefrescaTabela;
  end;

var
  frm_CaixaLancamentos_Contas: Tfrm_CaixaLancamentos_Contas;

implementation

uses principal;

{$R *.DFM}

procedure Tfrm_CaixaLancamentos_Contas.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_CaixaLancamentos_Contas.RefrescaTabela;
begin
  qContas.close;
  if (rdNatu.itemindex=0) then
    qContas.parambyname('co_natu').AsString := '2'
  else
  if (rdNatu.itemindex=1) then
    qContas.parambyname('co_natu').AsString := '1';
  qContas.open;
end;

procedure Tfrm_CaixaLancamentos_Contas.rdNatuClick(Sender: TObject);
begin
  RefrescaTabela;
end;

procedure Tfrm_CaixaLancamentos_Contas.rdNatuExit(Sender: TObject);
begin
  RefrescaTabela;
end;

procedure Tfrm_CaixaLancamentos_Contas.FormActivate(Sender: TObject);
begin
  if (not qContas.active) then
    RefrescaTabela;
end;

procedure Tfrm_CaixaLancamentos_Contas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_CaixaLancamentos_Contas.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;
end;

end.
