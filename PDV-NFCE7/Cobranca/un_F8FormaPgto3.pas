unit un_F8FormaPgto3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_F8formulario1, Db, DBTables, StdCtrls, Buttons, Mask, ExtCtrls, Grids,
  DBGrids;

type
  Tfrm_F8FormaPgto3 = class(Tfrm_F8formulario1)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_F8FormaPgto3: Tfrm_F8FormaPgto3;

implementation

uses principal, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_F8FormaPgto3.FormCreate(Sender: TObject);
begin
  inherited;
  tabela.databasename := databasecredito;
  database            := databasecredito;
  entidade            := 'CREFPGT';
  labelentidade       := 'Formas de pgto.';
  labeldescricao      := 'Descrição';
  camposchaveprimaria     := TStringList.Create;
  camposchaveprimaria.Add ('FP_CODI');

  {*** - definindo os campos}
  atributosentidade[1].nome        := 'FP_CODI';
  atributosentidade[1].labelcampo  := 'Codigo';
  atributosentidade[1].tamanho     := 2;
  atributosentidade[1].tipo        := 'i';
  atributosentidade[1].flagImprime := true;
  atributosentidade[1].tamanhoimpressao := 2;
  {***}
  atributosentidade[2].nome        := 'FP_DESC';
  atributosentidade[2].labelcampo  := 'Descricao da forma de pgto.';
  atributosentidade[2].tamanho     := 40;
  atributosentidade[2].tipo        := 'c';
  atributosentidade[2].flagImprime := true;
  atributosentidade[2].tamanhoimpressao := 40;
  {***}

  {** Métodos do F8formulario1}
  AjustaCaption;
  AjustaGrade;
  AjustaTabela;
end;

procedure Tfrm_F8FormaPgto3.FormDestroy(Sender: TObject);
begin
  inherited;
  camposchaveprimaria.Free;
end;

end.
