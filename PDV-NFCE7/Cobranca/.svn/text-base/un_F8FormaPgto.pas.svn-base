unit un_F8FormaPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_F8formulario1, Db, DBTables, StdCtrls, Buttons, Mask, ExtCtrls, Grids,
  DBGrids;

type
  Tfrm_F8FormaPgto = class(Tfrm_F8formulario1)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_F8FormaPgto: Tfrm_F8FormaPgto;

implementation

uses un_edtFormaPgto, principal, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_F8FormaPgto.FormCreate(Sender: TObject);
begin
  inherited;
  database            := 'CREDITO';
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

procedure Tfrm_F8FormaPgto.FormDestroy(Sender: TObject);
begin
  inherited;
  camposchaveprimaria.Free;
end;

procedure Tfrm_F8FormaPgto.btnCadastroClick(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_FORMA_PGTO, 'C')) then
    frm_principal.ExibirDica ('Acesso não permitido...',5)
  else
  begin
    Application.CreateForm (Tfrm_edtFormaPgto, frm_edtFormaPgto);
    with (frm_edtFormaPgto) do
    begin
      CodigoInclusao := CodigoCanceladoFormaPgto;
      caption := frm_principal.x_sistema+' - '+LB_CADASTRO_FORMA_PGTO+' - Modo: <F8/Browse>';
      LimparEdits;
      Modo:=0;
      showmodal;
      CodigoCanceladoFormaPgto := CodigoInclusao;
      free;
    end;
  end;
  inherited;
end;

end.
