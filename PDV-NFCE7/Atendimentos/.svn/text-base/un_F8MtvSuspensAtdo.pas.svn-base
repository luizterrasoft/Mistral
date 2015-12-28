unit un_F8MtvSuspensAtdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_F8formulario1, Db, DBTables, StdCtrls, Buttons, Mask, ExtCtrls, Grids,
  DBGrids;

type
  Tfrm_F8MtvSuspensAtdo = class(Tfrm_F8formulario1)
    Panel4: TPanel;
    Image2: TImage;
    Label12: TLabel;
    Label2: TLabel;
    botaoProcurar: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure edt_DescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botaoProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_F8MtvSuspensAtdo: Tfrm_F8MtvSuspensAtdo;

implementation

uses principal, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_F8MtvSuspensAtdo.FormCreate(Sender: TObject);
begin
  inherited;
  tabela.databasename := databaseprodutos;
  database            := databaseprodutos;
  entidade            := 'MTV_ATDOS';
  labelentidade       := 'Motivo';
  labeldescricao      := 'Descrição';
  camposchaveprimaria     := TStringList.Create;
  camposchaveprimaria.Add ('MA_CODI');

  {*** - definindo os campos}
  atributosentidade[1].nome        := 'MA_CODI';
  atributosentidade[1].labelcampo  := 'Codigo';
  atributosentidade[1].tamanho     := 3;
  atributosentidade[1].tipo        := 'i';
  atributosentidade[1].flagImprime := true;
  atributosentidade[1].tamanhoimpressao := 3;
  {***}
  atributosentidade[2].nome        := 'MA_DESC';
  atributosentidade[2].labelcampo  := 'Descricao do motivo';
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

procedure Tfrm_F8MtvSuspensAtdo.edt_DescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    botaoProcurarClick(Sender);
    grade.setfocus;
  end;
  if (key=K_ESC) then
    close;

     {teclando o F2}
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_F8MtvSuspensAtdo.botaoProcurarClick(Sender: TObject);
begin
  btn_procurarClick(Sender);
end;

end.
