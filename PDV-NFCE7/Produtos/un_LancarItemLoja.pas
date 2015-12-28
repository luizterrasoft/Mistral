unit un_LancarItemLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, Mask, Db, DBTables, Buttons;

type
  Tfrm_LancarItemLoja = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    botao_sair: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Salvar1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    pnProduto: TPanel;
    pnCor: TPanel;
    Label34: TLabel;
    edtCor: TMaskEdit;
    Label35: TLabel;
    edtFaixaTam: TMaskEdit;
    Label4: TLabel;
    edtQtde1: TMaskEdit;
    edtPVenda1: TMaskEdit;
    Label6: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnSalvar: TButton;
    qLancaItemLoja: TQuery;
    Label7: TLabel;
    edtPcusto1: TMaskEdit;
    Label8: TLabel;
    edtDesc: TMaskEdit;
    Panel1: TPanel;
    Label33: TLabel;
    edtLoja: TMaskEdit;
    pnLoja: TPanel;
    pnLocal2: TPanel;
    Label11: TLabel;
    edtRefInt: TMaskEdit;
    pnLocal1: TPanel;
    Label2: TLabel;
    edtGrupo: TMaskEdit;
    edtSubGrupo: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtCodigo: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtRefFab: TMaskEdit;
    edtCodigoBarra: TMaskEdit;
    Label17: TLabel;
    Bevel3: TBevel;
    qLancaItem: TQuery;
    Label18: TLabel;
    pnUnidade: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    Bevel8: TBevel;
    Panel2: TPanel;
    Label5: TLabel;
    edtQtde2: TMaskEdit;
    edtPcusto2: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtPVenda2: TMaskEdit;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtde1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtde2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPVenda1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtQtde1Enter(Sender: TObject);
    procedure edtQtde2Enter(Sender: TObject);
    procedure edtPVenda1Enter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPVenda1Exit(Sender: TObject);
    procedure edtPVenda1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure edtLojaChange(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCorChange(Sender: TObject);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPcusto1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPcusto1Enter(Sender: TObject);
    procedure edtPcusto1Exit(Sender: TObject);
    procedure edtPcusto1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaDblClick(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtPcusto2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPVenda2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPcusto2Enter(Sender: TObject);
    procedure edtPVenda2Enter(Sender: TObject);
    procedure edtPcusto2Exit(Sender: TObject);
    procedure edtPVenda2Exit(Sender: TObject);
    procedure edtPcusto2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPVenda2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescEnter(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure edtRefFabEnter(Sender: TObject);
    procedure edtCodigoBarraEnter(Sender: TObject);
    procedure edtRefFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtde1Exit(Sender: TObject);
    procedure edtQtde2Exit(Sender: TObject);
    procedure edtQtde1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtde2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    jaCriou: Boolean;
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}

    {...}
    Modo: Integer;          {0-> inclusao de item, 1-> alteracao de item}

    {...}
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure LimparEdits;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure MudaFocoCodigo;
  end;

var
  frm_LancarItemLoja: Tfrm_LancarItemLoja;

implementation

uses principal, unDialogo, produtos, funcoes1, funcoes2, procura, auxiliar,
  un_LancarItem, estoques;

{$R *.DFM}

procedure Tfrm_LancarItemLoja.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancarItemLoja.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_LancarItemLoja.FocusControle(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_LancarItemLoja.GetTabOrderList(Lista);
  ind:=TWinControl(controle).TabOrder;
  if (direcao) then
  begin
    if (ind<Lista.count) then
      proxcontrole:=Lista.items[ind+1]
    else
      proxcontrole:= Lista.items[0];
  end
  else
  if (ind>0) then
    proxcontrole:=Lista.items[ind-1]
  else
    proxcontrole:=Lista.items[Lista.count-1];
  proxcontrole.setfocus;
  Lista.Free;
end;

procedure Tfrm_LancarItemLoja.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocaCodigoLocal1;
  if (key=38) then
    FocusControle(TWinControl(sender),false);
  if (key=K_F8) then
    ChamandoF8Lojas(edtLoja,true);
end;

procedure Tfrm_LancarItemLoja.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtDesc.setfocus;
  if (key=38) then
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_LancarItemLoja.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_LancarItemLoja.edtQtde1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    if (edtCodigoBarra.enabled) then
      edtCodigoBarra.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtQtde2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPCusto2.setfocus;
  if (key=38) then
    edtPVenda1.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtPVenda1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    if (Panel2.visible) then
      edtQtde2.setfocus
    else
      btnSalvar.click;
  if (key=40) then
    if (Panel2.visible) then
      edtQtde2.setfocus;
  if (key=38) then
    FocusControle(TWinControl(sender),false);
end;

procedure Tfrm_LancarItemLoja.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItemLoja.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItemLoja.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItemLoja.edtLojaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItemLoja.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItemLoja.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe faixas de tamanho cadastradas para o produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItemLoja.edtQtde1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtQtde2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtPVenda1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_CIMA) then
    edtLoja.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_LancarItemLoja.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo: Real;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodigo.setfocus;
  if (key=K_CIMA) then
    edtGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=strtofloat(Trim(edtGrupo.text));
      ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
    end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
end;

procedure Tfrm_LancarItemLoja.edtPVenda1Exit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtPVenda1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.LimparEdits;
begin
  if (Modo=1) then {alteracao}
  begin
    edtQtde1.text:='';
    edtQtde2.text:='';
    edtPCusto1.text:='';
    edtPVenda1.text:='';
    edtPCusto2.text:='';
    edtPVenda2.text:='';
    pnUnidade.caption:='';
  end
  else
  if (Modo=0) then {inclusao}
  begin
    edtGrupo.text:='';
    edtSubGrupo.text:='';
    edtCodigo.text:='';
    pnProduto.caption:='';
    edtDesc.text:='';
    edtReffab.text:='';
    edtCodigoBarra.text:='';
    edtRefInt.text:='';
    if (edtCor.enabled) then
    begin
      edtCor.text:='';
      pnCor.caption:='';
    end;
    if (edtFaixaTam.enabled) then
      edtFaixaTam.text:='';
    edtQtde1.text:='';
    edtQtde2.text:='';
    edtPCusto1.text:='';
    edtPVenda1.text:='';
    edtPCusto2.text:='';
    edtPVenda2.text:='';
    FocaCodigoLocal1;
    pnUnidade.caption:='';
  end;
end;

procedure Tfrm_LancarItemLoja.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (not jaCriou) then
  begin
    if (Modo=0) then
    begin
      LimparEdits;
      habilitaEdit(edtGrupo);
      habilitaEdit(edtSubgrupo);
      habilitaEdit(edtCodigo);
      habilitaEdit(edtLoja);
      habilitaEdit(edtCor);
      habilitaEdit(edtFaixaTam);
      habilitaEdit(edtDesc);
      habilitaEdit(edtReffab);
      habilitaEdit(edtCodigoBarra);
      pnProduto.caption := '';
      pnLoja.caption    := '';
      pnCor.caption     := '';
      edtGrupo.text     := '';
      edtSubGrupo.text  := '';
      edtCodigo.text    := '';
      edtLoja.text      := '';
      edtCor.text       := '';
      edtFaixaTam.text  := '';
      edtDesc.text      := '';
      edtReffab.text    := '';
      edtCodigoBarra.text := '';
      edtQtde1.text     := '';
      edtQtde2.text     := '';
      edtPVenda1.text   := '';
      edtPVenda2.text   := '';
      edtPCusto1.text   := '';
      edtPCusto2.text   := '';
      edtLoja.setfocus;
    end
    else
    if (Modo=1) then
    begin
      clAux:=TClassAuxiliar.Create;
      clAux.conect ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Select * ');
      clAux.AddParam ('From   PRODUTOS ');
      clAux.AddParam ('Where (PR_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('      (PR_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('      (PR_CODI='+floattostr(n_produto)+') ');
      clAux.Execute;
      pnProduto.caption := clAux.result('PR_DESC');
      edtRefInt.text    := form_t (clAux.result('PR_REFI'),12);
      clAux.ClearSql;
      clAux.AddParam ('Select ES_DESC,ES_REFF,ES_CBAR ');
      clAux.AddParam ('From   ESTOQUE ');
      clAux.AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND ');
      clAux.AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
      clAux.AddParam ('      (ES_TAMA='+chr(39)+n_tam+chr(39)+')  ');
      clAux.Execute;
      edtDesc.text := clAux.result('ES_DESC');
      edtReffab.text := clAux.result('ES_REFF');
      edtCodigoBarra.text := clAux.result('ES_CBAR');
      clAux.ClearSql;
      clAux.AddParam ('Select * ');
      clAux.AddParam ('From   ESTOQUE_LOJA ');
      clAux.AddParam ('Where (EL_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('      (EL_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('      (EL_PROD='+floattostr(n_produto)+') AND ');
      clAux.AddParam ('      (EL_LOJA='+floattostr(n_loja)+') AND ');
      clAux.AddParam ('      (EL_CORE='+floattostr(n_cor)+') AND ');
      clAux.AddParam ('      (EL_TAMA='+chr(39)+n_tam+chr(39)+')  ');
      clAux.Execute;
      edtGrupo.text     := form_nz(clAux.result('EL_GRUP'),3);
      edtSubgrupo.text  := form_nz(clAux.result('EL_SUBG'),3);
      edtCodigo.text    := form_nz(clAux.result('EL_PROD'),6);
      edtLoja.text      := form_nz(clAux.result('EL_LOJA'),2);
      pnLoja.caption    := ProcuraNomeLoja(clAux.result('EL_LOJA'),self);
      edtCor.text       := form_nz(clAux.result('EL_CORE'),2);
      pnCor.caption     := ProcuraNomeLoja(clAux.result('EL_CORE'),self);
      edtFaixaTam.text  := form_t(clAux.result('EL_TAMA'),5);
      edtQtde1.text     := inttostr(clAux.result('EL_QTD1'));
      edtQtde2.text     := inttostr(clAux.result('EL_QTD2'));
      edtPVenda1.text   := form_nc(clAux.result('EL_PVE1'),10);
      edtPCusto1.text   := form_nc2(clAux.result('EL_PCU1'),10,3);
      edtPVenda2.text   := form_nc(clAux.result('EL_PVE2'),10);
      edtPCusto2.text   := form_nc(clAux.result('EL_PCU2'),10);
      clAux.desconect;
      clAux.Free;
      desabilitaEdit(edtRefInt);
      desabilitaEdit(edtGrupo);
      desabilitaEdit(edtSubgrupo);
      desabilitaEdit(edtCodigo);
      desabilitaEdit(edtLoja);
      desabilitaEdit(edtCor);
      desabilitaEdit(edtFaixaTam);
      desabilitaEdit(edtDesc);
      desabilitaEdit(edtRefFab);
      desabilitaEdit(edtCodigoBarra);
      edtQtde1.setfocus;
    end;
    jaCriou:=true;
  end;
end;

procedure Tfrm_LancarItemLoja.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    grupo    := Trim(edtGrupo.text);
    subgrupo := Trim(edtSubGrupo.text);
    codigo   := Trim(edtCodigo.text);
    if (grupo<>'') and (subgrupo<>'') and (codigo<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_UNID ');
        AddParam ('From   PRODUTOS ');
        AddParam ('Where (PR_SUBG='+subgrupo+') AND ');
        AddParam ('      (PR_GRUP='+grupo+') AND ');
        AddParam ('      (PR_CODI='+codigo+') ');
        frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
        frm_principal.refresh;
        n_cor_unica:=false;
        n_tam_unico:=false;
        if (Execute) then
        begin
          pnProduto.caption:=result('PR_DESC');
          if (result('PR_CUNI')='1') then
            n_cor_unica:=true
          else
          if (result('PR_CUNI')='0') then
            n_cor_unica:=false;
          if (result('PR_TUNI')='1') then
            n_tam_unico:=true
          else
          if (result('PR_TUNI')='0') then
            n_tam_unico:=false;
          pnUnidade.caption:=Result('PR_UNID');
        end
        else
          pnProduto.caption:='<Produto nao encontrado>';
        frm_principal.BarraDicas.caption:='';
        edtGrupo.text    := form_nz (StrToFloat(grupo),3);
        edtSubGrupo.text := form_nz (StrToFloat(subgrupo),3);
        edtCodigo.text   := form_nz(StrToFloat(codigo),6);
        desconect;
        Free;

               {...}
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaedit(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaedit(edtCor);
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaedit(edtFaixaTam);
        end
        else
          habilitaedit(edtFaixaTam);
      end;
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtDesc.setfocus;
  end;
  if (key=K_CIMA) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=Trim(edtGrupo.text);
      subgrupo:=Trim(edtSubGrupo.text);
      ChamandoF8Produtos_2(edtCodigo,strtofloat(grupo),strtofloat(subgrupo),true);
    end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do produto: Formato: 999999',5);
end;

procedure Tfrm_LancarItemLoja.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_LancarItemLoja.Salvar1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {CRITICA AOS DADOS}
  if (n_grupo=0) then
  begin
    frmDialogo.ExibirMensagem (' Grupo fornecido não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    FocaCodigoLocal1;
  end
  else
  if (n_subgrupo=0) then
  begin
    frmDialogo.ExibirMensagem (' SubGrupo fornecido não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    FocaCodigoLocal1;
  end
  else
  if (n_produto=0) then
  begin
    frmDialogo.ExibirMensagem (' Codigo do produto fornecido não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    FocaCodigoLocal1;
  end
  else
  if (Trim(edtLoja.text)='') then
  begin
    frmDialogo.ExibirMensagem (' Loja fornecida não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtLoja.setfocus;
  end
  else
  if (Trim(edtCor.text)='') then
  begin
    frmDialogo.ExibirMensagem (' Cor fornecida não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtCor.setfocus;
  end
  else
  if (Trim(edtFaixaTam.text)='') then
  begin
    frmDialogo.ExibirMensagem (' Faixa de tamanho fornecida não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFaixaTam.setfocus;
  end
  else
  begin
          {Lancando o item de produto}
    with (qLancaItem) do
    begin
      clAux:=TClassAuxiliar.Create;
      clAux.conect   ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Select ES_DESC ');
      clAux.AddParam ('From   ESTOQUE ');
      clAux.AddParam ('Where  (ES_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('       (ES_PROD='+floattostr(n_produto)+') AND ');
      clAux.AddParam ('       (ES_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('       (ES_CORE='+floattostr(n_cor)+') AND ');
      clAux.AddParam ('       (ES_TAMA='+chr(39)+n_tam+chr(39)+')  ');
      if (not clAux.Execute) then
      begin
        frm_principal.barraDicas.caption:='Lançando um item de produto...';
        frm_principal.refresh;
        sql.clear;
        sql.Add ('Insert into ESTOQUE(ES_GRUP,ES_SUBG,ES_PROD,    ');
        sql.Add ('                    ES_CORE,ES_TAMA,    ');
        sql.Add ('                    ES_CBAR,ES_REFF,ES_DESC)    ');
        sql.Add ('Values             (:ES_GRUP,:ES_SUBG,:ES_PROD, ');
        sql.Add ('                    :ES_CORE,:ES_TAMA, ');
        sql.Add ('                    :ES_CBAR,:ES_REFF,:ES_DESC) ');
        parambyname('ES_GRUP').AsFloat  := n_grupo;
        parambyname('ES_SUBG').AsFloat  := n_subgrupo;
        parambyname('ES_PROD').AsFloat  := n_produto;
        parambyname('ES_CORE').AsFloat  := n_cor;
        parambyname('ES_TAMA').AsString := n_tam;
        parambyname('ES_DESC').AsString := Trim(edtDesc.text);
        parambyname('ES_REFF').AsString := Trim(edtRefFab.text);
        parambyname('ES_CBAR').AsString := Trim(edtCodigoBarra.text);
        ExecSql;
      end
      else
      begin
        frm_principal.barraDicas.caption:='Alterando um item de produto...';
        frm_principal.refresh;
        sql.clear;
        sql.Add ('Update ESTOQUE   ');
        sql.Add ('Set    ES_CBAR=:ES_CBAR,ES_REFF=:ES_REFF,   ');
        sql.Add ('       ES_DESC=:ES_DESC ');
        sql.Add ('Where  (ES_GRUP=:ES_GRUP) AND ');
        sql.Add ('       (ES_SUBG=:ES_SUBG) AND ');
        sql.Add ('       (ES_PROD=:ES_PROD) AND ');
        sql.Add ('       (ES_CORE=:ES_CORE) AND ');
        sql.Add ('       (ES_TAMA=:ES_TAMA)     ');
        parambyname('ES_GRUP').AsFloat  := n_grupo;
        parambyname('ES_SUBG').AsFloat  := n_subgrupo;
        parambyname('ES_PROD').AsFloat  := n_produto;
        parambyname('ES_CORE').AsFloat  := n_cor;
        parambyname('ES_TAMA').AsString := n_tam;
        parambyname('ES_DESC').AsString := Trim(edtDesc.text);
        parambyname('ES_REFF').AsString := Trim(edtRefFab.text);
        parambyname('ES_CBAR').AsString := Trim(edtCodigoBarra.text);
        ExecSql;
      end;
      clAux.desconect;
      clAux.Free;
    end;

          {Lancando o item de estoque}
    with (qLancaItemLoja) do
    begin
      clAux:=TClassAuxiliar.Create;
      clAux.conect ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Select EL_GRUP,EL_SUBG,EL_PROD ');
      clAux.AddParam ('From   ESTOQUE_LOJA ');
      clAux.AddParam ('Where  (EL_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('       (EL_PROD='+floattostr(n_produto)+') AND ');
      clAux.AddParam ('       (EL_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('       (EL_LOJA='+floattostr(n_loja)+') AND ');
      clAux.AddParam ('       (EL_CORE='+floattostr(n_cor)+') AND ');
      clAux.AddParam ('       (EL_TAMA='+chr(39)+n_tam+chr(39)+')  ');
      if (not clAux.Execute) then
      begin
        frm_principal.barraDicas.caption:='Lançando um item de estoque...';
        frm_principal.refresh;
        sql.clear;
        sql.Add ('Insert into ESTOQUE_LOJA(EL_GRUP,EL_SUBG,EL_PROD,    ');
        sql.Add ('                    EL_LOJA,EL_CORE,EL_TAMA,    ');
        sql.Add ('                    EL_QTD1,EL_QTD2,EL_PVE1,    ');
        sql.Add ('                    EL_PCU1,EL_PVE2,EL_PCU2)    ');
        sql.Add ('Values             (:EL_GRUP,:EL_SUBG,:EL_PROD, ');
        sql.Add ('                    :EL_LOJA,:EL_CORE,:EL_TAMA, ');
        sql.Add ('                    :EL_QTD1,:EL_QTD2,:EL_PVE1, ');
        sql.Add ('                    :EL_PCU1,:EL_PVE2,:EL_PCU2) ');
        parambyname('EL_GRUP').AsFloat  := n_grupo;
        parambyname('EL_SUBG').AsFloat  := n_subgrupo;
        parambyname('EL_PROD').AsFloat  := n_produto;
        parambyname('EL_LOJA').AsFloat  := n_loja;
        parambyname('EL_CORE').AsFloat  := n_cor;
        parambyname('EL_TAMA').AsString := n_tam;
        if (Trim(edtQtde1.text)<>'') then
          parambyname('EL_QTD1').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtQtde1.text)))
        else
          parambyname('EL_QTD1').AsFloat := 0;
        if (Trim(edtQtde2.text)<>'') then
          parambyname('EL_QTD2').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtQtde2.text)))
        else
          parambyname('EL_QTD2').AsFloat := 0;
        if (Trim(edtPvenda1.text)<>'') then
          parambyname('EL_PVE1').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtPVenda1.text)))
        else
          parambyname('EL_PVE1').AsFloat   := 0.00;
        if (Trim(edtPCusto1.text)<>'') then
          parambyname('EL_PCU1').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtPcusto1.text)))
        else
          parambyname('EL_PCU1').AsFloat :=0.00;
        if (Trim(edtPvenda2.text)<>'') then
          parambyname('EL_PVE2').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtPVenda2.text)))
        else
          parambyname('EL_PVE2').AsFloat   := 0.00;
        if (Trim(edtPCusto2.text)<>'') then
          parambyname('EL_PCU2').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtPcusto2.text)))
        else
          parambyname('EL_PCU2').AsFloat :=0.00;
        ExecSql;
      end
      else
      begin
        frm_principal.barraDicas.caption:='Alterando um item de estoque...';
        frm_principal.refresh;
        sql.clear;
        sql.Add ('Update ESTOQUE_LOJA   ');
        sql.Add ('Set    EL_QTD1=:EL_QTD1,EL_QTD2=:EL_QTD2,EL_PVE1=:EL_PVE1,   ');
        sql.Add ('       EL_PCU1=:EL_PCU1,EL_PVE2=:EL_PVE2,EL_PCU2=:EL_PCU2    ');
        sql.Add ('Where  (EL_GRUP=:EL_GRUP) AND ');
        sql.Add ('       (EL_SUBG=:EL_SUBG) AND ');
        sql.Add ('       (EL_PROD=:EL_PROD) AND ');
        sql.Add ('       (EL_LOJA=:EL_LOJA) AND ');
        sql.Add ('       (EL_CORE=:EL_CORE) AND ');
        sql.Add ('       (EL_TAMA=:EL_TAMA)     ');
        parambyname('EL_GRUP').AsFloat  := n_grupo;
        parambyname('EL_SUBG').AsFloat  := n_subgrupo;
        parambyname('EL_PROD').AsFloat  := n_produto;
        parambyname('EL_LOJA').AsFloat  := n_loja;
        parambyname('EL_CORE').AsFloat  := n_cor;
        parambyname('EL_TAMA').AsString := n_tam;
        if (Trim(edtQtde1.text)<>'') then
          parambyname('EL_QTD1').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtQtde1.text)))
        else
          parambyname('EL_QTD1').AsFloat := 0;
        if (Trim(edtQtde2.text)<>'') then
          parambyname('EL_QTD2').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtQtde2.text)))
        else
          parambyname('EL_QTD2').AsFloat := 0;
        if (Trim(edtPvenda1.text)<>'') then
          parambyname('EL_PVE1').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtPVenda1.text)))
        else
          parambyname('EL_PVE1').AsFloat   := 0.00;
        if (Trim(edtPCusto1.text)<>'') then
          parambyname('EL_PCU1').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtPcusto1.text)))
        else
          parambyname('EL_PCU1').AsFloat :=0.00;
        if (Trim(edtPvenda2.text)<>'') then
          parambyname('EL_PVE2').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtPVenda2.text)))
        else
          parambyname('EL_PVE2').AsFloat   := 0.00;
        if (Trim(edtPCusto2.text)<>'') then
          parambyname('EL_PCU2').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtPcusto2.text)))
        else
          parambyname('EL_PCU2').AsFloat :=0.00;
        ExecSql;
        if (Modo=1) then
        begin
          frm_principal.barraDicas.caption:='';
          frm_principal.refresh;
          frm_LancarItemLoja.close;
        end;
      end;
      clAux.desconect;
      clAux.Free;
    end;
    frm_principal.barraDicas.caption:='';
    frm_principal.refresh;
    Limparformulrio1.click; {...}
  end;
end;

procedure Tfrm_LancarItemLoja.edtLojaChange(Sender: TObject);
begin
  if (Trim(edtLoja.text)<>'') then
    n_loja := strtofloat(Trim(edtLoja.text))
  else
    n_loja :=0;
end;

procedure Tfrm_LancarItemLoja.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_LancarItemLoja.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_LancarItemLoja.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_LancarItemLoja.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor :=0;
end;

procedure Tfrm_LancarItemLoja.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '';
end;

procedure Tfrm_LancarItemLoja.edtLojaExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtLoja.text);
  if (codigo<>'') then
  begin
    pnLoja.caption:=ProcuraNomeLoja(strtofloat(codigo),self);
    edtLoja.text:=form_nz(strtofloat(codigo),2);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_LancarItemLoja.edtCorExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  faixa,codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),2);
  end;
  if (n_tam_unico) then
  begin
    faixa := '0';
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
            {Pesquisa o item do produto, no cadastro de itens de estoque ***}
      conect   ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC ');
      AddParam ('From   ESTOQUE ');
      AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
      AddParam ('      (ES_TAMA='+chr(39)+faixa+chr(39)+') ');
      if (not Execute) then
      begin
        edtDesc.text :='';
        edtReffab.text := '';
        edtCodigoBarra.text := '';
      end
      else
      begin
        edtDesc.text := Trim(result('ES_DESC'));
        edtReffab.text := Trim(result('ES_REFF'));
        edtCodigoBarra.text := Trim(result('ES_CBAR'));
      end;

            {Pesquisa o item de estoque na loja, no cadastro de itens de estoque ***}
      ClearSql;
      AddParam ('Select EL_QTD1,EL_QTD2,EL_PVE1,EL_PVE2, ');
      AddParam ('       EL_PCU1,EL_PCU2 ');
      AddParam ('From   ESTOQUE_LOJA ');
      AddParam ('Where (EL_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (EL_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (EL_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (EL_LOJA='+floattostr(n_loja)+') AND   ');
      AddParam ('      (EL_CORE='+floattostr(n_cor)+') AND ');
      AddParam ('      (EL_TAMA='+chr(39)+faixa+chr(39)+') ');
      if (Execute) then
      begin
        edtQtde1.text   := form_nc(result('EL_QTD1'),8);
        edtQtde2.text   := form_nc(result('EL_QTD2'),8);
        edtPcusto1.text := form_nc2(result('EL_PCU1'),10,3);
        edtPcusto2.text := form_nc2(result('EL_PCU2'),10,3);
        edtPvenda1.text := form_nc(result('EL_PVE1'),10);
        edtPvenda2.text := form_nc(result('EL_PVE2'),10);
      end
      else
      begin
        edtQtde1.text   := '';
        edtQtde2.text   := '';
        edtPcusto1.text := '';
        edtPcusto2.text := '';
        edtPvenda1.text := '';
        edtPvenda2.text := '';
      end;
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false; 
end;

procedure Tfrm_LancarItemLoja.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
      if (Panel2.visible) then
      begin
        Panel2.visible:=false;
        edtQtde1.setfocus;
      end
      else
      begin
        Panel2.visible:=true;
        edtQtde2.setfocus;
      end;
end;

procedure Tfrm_LancarItemLoja.edtPcusto1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),false);
end;

procedure Tfrm_LancarItemLoja.edtPcusto1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtPcusto1Exit(Sender: TObject);
begin
  FormatarZerosDecimais3 (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtPcusto1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico3 (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtLojaDblClick(Sender: TObject);
begin
  ChamandoF8Lojas(edtLoja,true);
end;

procedure Tfrm_LancarItemLoja.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_LancarItemLoja.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_LancarItemLoja.Limparformulrio1Click(Sender: TObject);
begin
  if (Modo=0) then
  begin
    habilitaEdit(edtCor);
    habilitaEdit(edtFaixaTam);
    n_cor_unica:=false;
    n_tam_unico:=false;
  end;   
  LimparEdits;
  if (Modo=0) then
    edtLoja.setfocus
  else
  if (Modo=1) then
    edtQtde1.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRefFab.setfocus;
  if (key=38) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
end;

procedure Tfrm_LancarItemLoja.FormCreate(Sender: TObject);
begin
  n_cor_unica:=false;
  n_tam_unico:=false;

     {* Posicionando a forma de localizacao do produto *}
  if (frm_principal.x_ordem_codigo=1) then
  begin
    pnLocal1.visible := true;
    pnLocal1.left    := 16;
    pnLocal2.visible := false;
    pnLocal2.left    := 16;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
  begin
    pnLocal1.visible := false;
    pnLocal1.left    := 16;
    pnLocal2.visible := true;
    pnLocal2.left    := 16;
  end;
end;

procedure Tfrm_LancarItemLoja.edtPcusto2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPVenda2.setfocus;
  if (key=38) then
    edtQtde2.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtPVenda2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnSalvar.click;
  if (key=38) then
    edtPCusto2.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtPcusto2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtPVenda2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtPcusto2Exit(Sender: TObject);
begin
  FormatarZerosDecimais3 (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtPVenda2Exit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtPcusto2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico3 (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtPVenda2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtDescEnter(Sender: TObject);
begin
  if (Trim(edtDesc.text)='') then
    edtDesc.text := ExibeNomeProduto(form_nz(n_grupo,3)+form_nz(n_subgrupo,3)+
      form_nz(n_produto,6), n_cor,n_Tam);
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtRefIntKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    refinterna := Trim(edtRefInt.text);
    if (refinterna<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect   ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,        ');
        AddParam ('       PR_SUBG,PR_CODI,PR_UNID                 ');
        AddParam ('From   PRODUTOS                                ');
        AddParam ('Where (PR_REFI='+chr(39)+refinterna+chr(39)+') ');
        frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
        frm_principal.refresh;
        n_cor_unica:=false;
        n_tam_unico:=false;
        if (Execute) then
        begin
          n_grupo := result('PR_GRUP');
          n_subgrupo := result('PR_SUBG');
          n_produto := result('PR_CODI');
          pnProduto.caption:=result('PR_DESC');
          if (result('PR_CUNI')='1') then
            n_cor_unica:=true
          else
          if (result('PR_CUNI')='0') then
            n_cor_unica:=false;
          if (result('PR_TUNI')='1') then
            n_tam_unico:=true
          else
          if (result('PR_TUNI')='0') then
            n_tam_unico:=false;
          pnUnidade.caption:=Result('PR_UNID');
        end
        else
          pnProduto.caption:='<Produto nao encontrado>';
        frm_principal.BarraDicas.caption:='';
        edtGrupo.text    := form_nz (n_grupo,3);
        edtSubGrupo.text := form_nz (n_subgrupo,3);
        edtCodigo.text   := form_nz (n_produto,6);
        desconect;
        Free;

               {...}
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaedit(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaedit(edtCor);
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaedit(edtFaixaTam);
        end
        else
          habilitaedit(edtFaixaTam);
      end;
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtDesc.setfocus;
  end;
  if (key=K_F8) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do produto: Formato: 999999',5);
end;

procedure Tfrm_LancarItemLoja.MudaFocoCodigo;
begin
  if (pnLocal1.visible) then
  begin
    pnLocal1.visible:=false;
    pnLocal2.visible:=true;
    edtRefInt.setfocus;
  end
  else
  if (pnLocal2.visible) then
  begin
    pnLocal1.visible:=true;
    pnLocal2.visible:=false;
    edtGrupo.setfocus;
  end;
end;

{Controle de foco do produto ***}
procedure Tfrm_LancarItemLoja.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_LancarItemLoja.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtFaixaTamExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  faixa: String;
begin
     {Critica dos dados}
  faixa := Trim(edtFaixaTam.text);
  if (not VerificaFaixasTamProduto(n_grupo,n_subgrupo,n_produto,faixa))
    and (Trim(edtFaixaTam.text)<>'') then
  begin
    frmDialogo.ExibirMensagem (' Faixa não permitida para o produto! '
      ,'Item de produto',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFaixaTam.setfocus;
  end
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
            {Pesquisa o item do produto, no cadastro de itens de estoque ***}
      conect   ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC ');
      AddParam ('From   ESTOQUE ');
      AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
      AddParam ('      (ES_TAMA='+chr(39)+faixa+chr(39)+') ');
      if (not Execute) then
      begin
        edtDesc.text :='';
        edtReffab.text := '';
        edtCodigoBarra.text := '';
      end
      else
      begin
        edtDesc.text := Trim(result('ES_DESC'));
        edtReffab.text := Trim(result('ES_REFF'));
        edtCodigoBarra.text := Trim(result('ES_CBAR'));
      end;

            {Pesquisa o item de estoque na loja, no cadastro de itens de estoque ***}
      ClearSql;
      AddParam ('Select EL_QTD1,EL_QTD2,EL_PVE1,EL_PVE2, ');
      AddParam ('       EL_PCU1,EL_PCU2 ');
      AddParam ('From   ESTOQUE_LOJA ');
      AddParam ('Where (EL_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (EL_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (EL_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (EL_LOJA='+floattostr(n_loja)+') AND   ');
      AddParam ('      (EL_CORE='+floattostr(n_cor)+') AND ');
      AddParam ('      (EL_TAMA='+chr(39)+faixa+chr(39)+') ');
      if (Execute) then
      begin
        edtQtde1.text   := form_nc(result('EL_QTD1'),8);
        edtQtde2.text   := form_nc(result('EL_QTD2'),8);
        edtPcusto1.text := form_nc2(result('EL_PCU1'),10,3);
        edtPcusto2.text := form_nc2(result('EL_PCU2'),10,3);
        edtPvenda1.text := form_nc(result('EL_PVE1'),10);
        edtPvenda2.text := form_nc(result('EL_PVE2'),10);
      end
      else
      begin
        edtQtde1.text   := '';
        edtQtde2.text   := '';
        edtPcusto1.text := '';
        edtPcusto2.text := '';
        edtPvenda1.text := '';
        edtPvenda2.text := '';
      end;
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false; 
end;

procedure Tfrm_LancarItemLoja.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtCodigoBarraEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItemLoja.edtRefFabKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCodigoBarra.setfocus;
  if (key=38) then
    edtDesc.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtCodigoBarraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtQtde1.setfocus;
  if (key=38) then
    edtRefFab.setfocus;
end;

procedure Tfrm_LancarItemLoja.edtQtde1Exit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtQtde2Exit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtQtde1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtQtde2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancarItemLoja.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_LancarItemLoja.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_LancarItemLoja.edtCodigoDblClick(Sender: TObject);
var
  grupo,subgrupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    subgrupo:=strtofloat(Trim(edtSubGrupo.text));
    ChamandoF8Produtos_2(edtCodigo,grupo,subgrupo,true);
  end;
end;

procedure Tfrm_LancarItemLoja.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_LancarItemLoja.edtCodigoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false; 
end;

procedure Tfrm_LancarItemLoja.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

end.
