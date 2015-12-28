unit f8Produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal,
  Menus;

type
  Tfrm_F8Produtos = class(TForm)
    grade: TDBGrid;
    ds: TDataSource;
    pn_procurar: TPanel;
    Label1: TLabel;
    edt_nome: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_procurar: TBitBtn;
    btnCadastro: TBitBtn;
    botao_sair: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_procurarClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCadastroClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_F8Produtos: Tfrm_F8Produtos;

implementation

uses funcoes1, funcoes2, un_edtForn, un_edtProdutos, f8Forn;

{$R *.DFM}

procedure Tfrm_F8Produtos.BitBtn1Click(Sender: TObject);
begin
  close;
end;

{botao de procurar e filtrar a querie, usando o FILTER}
{A consulta tem um boa performance porque é executada localmente}
procedure Tfrm_F8Produtos.btn_procurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_nome.text)<>'') then
    begin
      filter   := 'pr_desc='+chr(39)+Trim(edt_nome.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure Tfrm_F8Produtos.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := form_nz(TQuery(ds.dataset).fieldbyname('PR_GRUP').asfloat,3)+
        form_nz(TQuery(ds.dataset).fieldbyname('PR_SUBG').asfloat,3)+
        form_nz(TQuery(ds.dataset).fieldbyname('PR_CODI').asfloat,6);
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := form_nz(TQuery(ds.dataset).fieldbyname('PR_GRUP').asfloat,3)+
        form_nz(TQuery(ds.dataset).fieldbyname('PR_SUBG').asfloat,3)+
        form_nz(TQuery(ds.dataset).fieldbyname('PR_CODI').asfloat,6);
    frm_F8Produtos.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_F8Produtos.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_nome.setfocus;
end;

procedure Tfrm_F8Produtos.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo produtos...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  grade.setfocus;
  edt_nome.text:='';
end;

procedure Tfrm_F8Produtos.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    btn_procurar.click;
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_F8Produtos.close;
  if (key=K_F2) then
    grade.setfocus;
end;

{Botao de cadastro de lojas ***}
procedure Tfrm_F8Produtos.btnCadastroClick(Sender: TObject);
begin
     {Cadastro dos produtos}
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_PRODUTOS, 'C')) then
    frm_principal.ExibirDica ('Acesso não permitido...',5)
  else
  begin
    Application.CreateForm (Tfrm_edtProdutos, frm_edtProdutos);
    with (frm_edtProdutos) do
    begin
      caption := frm_principal.x_sistema+' - Cadastro de Produtos - Modo: <F8/Browse>';
      LimparEdits;
      Modo:=1;
      showmodal;
      free;
    end;
  end;

     {relendo as lojas cadastradas}
  TQuery(ds.dataset).close;
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).open;
  grade.setfocus;
  edt_nome.text := '';
end;

procedure Tfrm_F8Produtos.botao_sairClick(Sender: TObject);
begin
  close;
end;

{Duplo clique ***}
procedure Tfrm_F8Produtos.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := form_nz(TQuery(ds.dataset).fieldbyname('PR_GRUP').asfloat,3)+
      form_nz(TQuery(ds.dataset).fieldbyname('PR_SUBG').asfloat,3)+
      form_nz(TQuery(ds.dataset).fieldbyname('PR_CODI').asfloat,6);
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := form_nz(TQuery(ds.dataset).fieldbyname('PR_GRUP').asfloat,3)+
      form_nz(TQuery(ds.dataset).fieldbyname('PR_SUBG').asfloat,3)+
      form_nz(TQuery(ds.dataset).fieldbyname('PR_CODI').asfloat,6);
  frm_F8Produtos.close
end;

procedure Tfrm_F8Produtos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key=Ord('C')) or (key=Ord('c'))) and (Shift=[ssCtrl]) then
    if (btnCadastro.visible) then
      btnCadastro.click;
end;

end.
