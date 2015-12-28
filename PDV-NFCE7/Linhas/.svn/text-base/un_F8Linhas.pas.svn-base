unit un_F8Linhas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_F8formulario1, Db, DBTables, StdCtrls, Buttons, Mask, ExtCtrls, Grids,
  DBGrids;

type
  Tfrm_F8Linhas = class(Tfrm_F8formulario1)
    botaoProcurar: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  frm_F8Linhas: Tfrm_F8Linhas;

implementation

uses principal, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_F8Linhas.FormCreate(Sender: TObject);
begin
  inherited;


  tabela.databasename := databaseprodutos;
  database            := databaseprodutos;
  entidade            := 'LINHAS';
  labelentidade       := 'Linhas';
  labeldescricao      := 'Descrição';
  camposchaveprimaria     := TStringList.Create;
  camposchaveprimaria.Add ('LI_CODI');

  {*** - definindo os campos}
  atributosentidade[1].nome        := 'LI_CODI';
  atributosentidade[1].labelcampo  := 'Codigo';
  atributosentidade[1].tamanho     := 4;
  atributosentidade[1].tipo        := 'i';
  atributosentidade[1].flagImprime := true;
  atributosentidade[1].tamanhoimpressao := 4;
  {***}
  atributosentidade[2].nome        := 'LI_DESC';
  atributosentidade[2].labelcampo  := 'Descricao da linha';
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

procedure Tfrm_F8Linhas.FormDestroy(Sender: TObject);
begin
  inherited;
  camposchaveprimaria.Free;
end;

procedure Tfrm_F8Linhas.botaoProcurarClick(Sender: TObject);
begin
  btn_procurar.click;
end;

procedure Tfrm_F8Linhas.edt_DescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botaoProcurarClick(Sender);

  if key = vk_f2 then
    grade.setfocus;

  if key = vk_escape then
    close;
end;

procedure Tfrm_F8Linhas.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f2 then
    edt_desc.setfocus
  else
    inherited;
end;

procedure Tfrm_F8Linhas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    close
  else
    inherited;
end;

end.
