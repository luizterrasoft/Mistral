unit un_F8Colecoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_F8formulario1, Db, DBTables, StdCtrls, Buttons, Mask, ExtCtrls, Grids,
  DBGrids;

type
  Tfrm_F8Colecoes = class(Tfrm_F8formulario1)
    Label3: TLabel;
    Label2: TLabel;
    Image2: TImage;
    botaoProcurar: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure botaoProcurarClick(Sender: TObject);
    procedure edt_DescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_F8Colecoes: Tfrm_F8Colecoes;

implementation

uses principal, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_F8Colecoes.FormCreate(Sender: TObject);
begin
  inherited;

  tabela.databasename := databaseprodutos;
  database            := databaseprodutos;
  entidade            := 'COLECOES';
  labelentidade       := 'Coleções';
  labeldescricao      := 'Descrição';
  camposchaveprimaria     := TStringList.Create;
  camposchaveprimaria.Add ('CO_CODI');

  {*** - definindo os campos}
  atributosentidade[1].nome        := 'CO_CODI';
  atributosentidade[1].labelcampo  := 'Codigo';
  atributosentidade[1].tamanho     := 4;
  atributosentidade[1].tipo        := 'i';
  atributosentidade[1].flagImprime := true;
  atributosentidade[1].tamanhoimpressao := 4;
  {***}
  atributosentidade[2].nome        := 'CO_DESC';
  atributosentidade[2].labelcampo  := 'Descricao da coleção';
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

procedure Tfrm_F8Colecoes.botaoProcurarClick(Sender: TObject);
begin
  btn_procurar.click;
end;

procedure Tfrm_F8Colecoes.edt_DescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botaoProcurarClick(Sender);
  if key = vk_f2 then
    grade.setfocus;
  if key = vk_escape then
    close;
end;

procedure Tfrm_F8Colecoes.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f2 then
    edt_desc.setfocus
  else
    inherited;
end;

procedure Tfrm_F8Colecoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    close
  else
    inherited;
end;

end.
