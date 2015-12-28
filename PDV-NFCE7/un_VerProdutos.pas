unit un_VerProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls;

type
  Tfrm_VerProdutos = class(TForm)
    Panel1: TPanel;
    Panel8: TPanel;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    procedure Panel8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exibiu: Boolean;
    y_grupo: Real;
    y_subgrupo: Real;
    y_produto: Real;
    y_cor: Real;
    y_tama: String;
    y_loja: Real;
    n_saldoatual: Real;
    n_tipz:String;
    ultvenda,ultcompra: TDateTime;
    function RetornaPrincipalMaterial(codigo_grupo,codigo_subgrupo,codigo_produto: Real):Real;
  end;

var
  frm_VerProdutos: Tfrm_VerProdutos;

implementation

{$R *.DFM}

uses auxiliar, funcoes1, funcoes2, principal, procura,venda;

procedure Tfrm_VerProdutos.Panel8Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_VerProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_VerProdutos.FormCreate(Sender: TObject);
begin
  exibiu:=false;
end;

procedure Tfrm_VerProdutos.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
  codigo_material: Real;
begin
  if (not exibiu) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT Produtos.*,Gr_Desc,Sg_Desc,Md_Desc,Co_Desc,Li_Desc,Tm_Desc FROM PRODUTOS');
    claux.addParam ('Left join Grupos_Produtos on (Gr_Codi = Pr_grup)');
    claux.addParam ('Left join SubGrupos_Produtos on (Sg_grup = Pr_grup and Sg_Codi = Pr_subg)');
    claux.addParam ('Left join Modelos on (Md_Codi = Pr_Mode)');
    claux.addParam ('Left join Colecoes on (Co_Codi = Pr_Cole)');
    claux.addParam ('Left join Linhas on (LI_Codi = pr_Linh)');
    claux.addParam ('Left Join Tamanhos on (Tm_codi = Pr_TTam)');
    clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND     ');
    clAux.AddParam ('      (PR_SUBG=:subgrupo) AND  ');
    clAux.AddParam ('      (PR_CODI=:produto)       ');
    clAux.consulta.parambyname('grupo').AsFloat    := y_grupo;
    clAux.consulta.parambyname('subgrupo').AsFloat := y_subgrupo;
    clAux.consulta.parambyname('produto').AsFloat  := y_produto;
    if (clAux.Execute) then
    begin
      codigo_material := RetornaPrincipalMaterial(y_grupo,y_subgrupo,y_produto);
      if (n_tipz='1') or (n_tipz='2') then
        ultvenda := InformaultimaVenda(y_grupo,y_subgrupo,y_produto,y_cor,y_tama,n_tipz)
      else
      if (n_tipz='3') then
        ultvenda := InformaultimaVenda(y_grupo,y_subgrupo,y_produto,y_cor,y_tama,'1');

      Memo1.lines.clear;
      Memo1.lines.Add ('');
      Memo1.lines.Add (' Código do grupo.......: '+form_nz(clAux.result('PR_GRUP'),2)+'/'+clAux.result('Gr_Desc'));
      Memo1.lines.Add (' Código do subgrupo....: '+form_nz(clAux.result('PR_SUBG'),2)+'/'+clAux.result('Sg_Desc'));
      Memo1.lines.Add (' Código do produto.....: '+form_nz(clAux.result('PR_CODI'),4));
      Memo1.lines.Add (' Referência Interna....: '+form_t(clAux.result('PR_REFI'),8));
      if (clAux.result('PR_FORN')<>0) then
        Memo1.lines.Add (' Fornecedor............: '+form_nz(clAux.result('PR_FORN'),6)+'/'+ProcuraNomeForn(clAux.result('PR_FORN'),self))
      else
        Memo1.lines.Add (' Fornecedor............: ');
      Memo1.lines.Add (' Referência Fabricante.: '+form_t(clAux.result('PR_REFF'),12));
      Memo1.lines.Add (' Descrição do produto..: '+form_t(clAux.result('PR_DESC'),60));
      if (clAux.result('PR_LINH')<>0) then
        Memo1.lines.Add (' Linha do produto......: '+form_nz(clAux.result('PR_LINH'),4)+'/'+clAux.result('Li_Desc'))
      else
        Memo1.lines.Add (' Linha do produto......: ');
      if (clAux.result('PR_COLE')<>0) then
        Memo1.lines.Add (' Coleção do produto....: '+form_nz(clAux.result('PR_COLE'),4)+'/'+clAux.result('co_Desc'))
      else
        Memo1.lines.Add (' Coleção do produto....: ');
      if (clAux.result('PR_MODE')<>0) then
        Memo1.lines.Add (' Modelo do produto.....: '+form_nz(clAux.result('PR_MODE'),6)+'/'+clAux.result('md_Desc'))
      else
        Memo1.lines.Add (' Modelo do produto.....: ');
      if (codigo_material<>0) then
        Memo1.lines.Add (' Principal material....: '+form_nz(codigo_material,4)+'/'+ProcuraNomeEntidade(codigo_material,databaseprodutos,'MATERIAIS','Materiais','MA_CODI','MA_DESC',self))
      else
        Memo1.lines.Add (' Principal material....: ');
      if (clAux.result('PR_DCAD')<>strtodate('01/01/1900')) then
        Memo1.lines.Add (' Data de cadastro......: '+form_data(clAux.result('PR_DCAD')))
      else
        Memo1.lines.Add (' Data de cadastro......: ');
      Memo1.lines.Add (' Unidade de medida.....: '+form_t(clAux.result('PR_UNID'),5));
      Memo1.lines.Add (' Tipo de tamanho.......: '+form_nz(clAux.result('PR_TTAM'),2)+'/'+clAux.result('tm_Desc'));
      if (clAux.result('PR_CUNI')='0') then
        Memo1.lines.Add (' Cor Ùnica.............: NÃO')
      else
      if (clAux.result('PR_CUNI')='1') then
        Memo1.lines.Add (' Cor Ùnica.............: SIM');
      if (clAux.result('PR_TUNI')='0') then
        Memo1.lines.Add (' Tamanho Ùnico.........: NÃO')
      else
      if (clAux.result('PR_TUNI')='1') then
        Memo1.lines.Add (' Tamanho Ùnico.........: SIM');
    end;
    clAux.desconect;
    clAux.Free;

    exibiu:=true;
  end;
end;

procedure Tfrm_VerProdutos.SAIR1Click(Sender: TObject);
begin
  close;
end;

function Tfrm_VerProdutos.RetornaPrincipalMaterial(codigo_grupo,codigo_subgrupo,codigo_produto: Real):Real;
var
  clAux2: TClassAuxiliar;
begin
  clAux2 := TClassAuxiliar.Create;
  clAux2.conect   (databaseprodutos,frm_principal);
  clAux2.ClearSql;
  clAux2.AddParam ('SELECT PM_MATE FROM PRODUTOS_MATERIAIS   ');
  clAux2.AddParam ('WHERE (PM_GRUP=:PM_GRUP) AND             ');
  clAux2.AddParam ('      (PM_SUBG=:PM_SUBG) AND             ');
  clAux2.AddParam ('      (PM_PROD=:PM_PROD)                 ');
  clAux2.consulta.parambyname('PM_GRUP').AsFloat   := codigo_grupo;
  clAux2.consulta.parambyname('PM_SUBG').AsFloat   := codigo_subgrupo;
  clAux2.consulta.parambyname('PM_PROD').AsFloat   := codigo_produto;
  if (clAux2.Execute) then
  begin
    clAux2.first;
    result := clAux2.result('PM_MATE');
  end;
  clAux2.desconect;
  clAux2.Free;
end;

end.
