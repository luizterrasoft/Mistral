unit un_ConsultaProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, Db, dbTables, DBCtrls,
  Menus;

type
  Tfrm_ConsultaProduto = class(TForm)
    Panel3: TPanel;
    botao_sair: TPanel;
    grade: TDBGrid;
    Panel4: TPanel;
    pn_Fornecedor: TPanel;
    Label2: TLabel;
    edtForn: TMaskEdit;
    pnForn: TPanel;
    ds: TDataSource;
    Panel5: TPanel;
    pn_Descricao: TPanel;
    Label1: TLabel;
    pn_referencia: TPanel;
    Label3: TLabel;
    edtRefFab: TMaskEdit;
    Panel6: TPanel;
    Label4: TLabel;
    Panel7: TPanel;
    DBText1: TDBText;
    pnNomeProduto: TPanel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    pn_referencia_interna: TPanel;
    Label6: TLabel;
    edtRefInt: TMaskEdit;
    lblLoja: TLabel;
    Label7: TLabel;
    edtForn2: TMaskEdit;
    btn_procurar: TPanel;
    edtDesc: TMaskEdit;
    lblStatus: TLabel;
    pn_codigo_barras: TPanel;
    Label8: TLabel;
    edtCodBarras: TMaskEdit;
    Ajuda1: TMenuItem;
    Invisiveis1: TMenuItem;
    Visaogeraldosprecospraticadosparaoitem1: TMenuItem;
    Label9: TLabel;
    Label10: TLabel;
    pnEstoque: TPanel;
    chFiltroContem: TCheckBox;
    pn_ReferenciaFab: TPanel;
    Label11: TLabel;
    edtRefFab2: TMaskEdit;
    procedure edtFornEnter(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtFornDblClick(Sender: TObject);
    procedure edtFornExit(Sender: TObject);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtForn2Enter(Sender: TObject);
    procedure edtForn2DblClick(Sender: TObject);
    procedure edtForn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtForn2Exit(Sender: TObject);
    procedure btn_procurarClick(Sender: TObject);
    procedure edtCodBarrasEnter(Sender: TObject);
    procedure edtCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ajuda1Click(Sender: TObject);
    procedure Visaogeraldosprecospraticadosparaoitem1Click(
      Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure edtRefFab2Change(Sender: TObject);
    procedure edtRefFab2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    exibiu: Boolean;
    y_RotinaChamadora: Integer; {0-> tela de lancamento de atendimento, 1-> tela de vale mercadoria, 2-> tela de tranferencia}
    codigo_loja,codigo_fornecedor: Real;
    y_grupo,y_subgrupo,y_produto,y_cor,y_tam: String;
    y_refint: String;
    y_forn: String;
    y_reffab: String;
    y_codigo_barra: String;
    n_f7: Integer;
    ultima_tecla_pressionada: Integer;
    procedure MudaFoco;
    function ConsultaEstoqueProduto: String;
  end;

var
  frm_ConsultaProduto: Tfrm_ConsultaProduto;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar, DM1, un_LancaVenda,
  un_ValeMercadoriaFunc, un_Transf_Lancamento, un_inventario1,
  un_Transf_Entrada_Online_Lancamento, un_AjudaComandos,
  un_VisaoPrecosPraticados, un_LancaAtendimento, un_MenuPrincipal_Opcao1,
  Un_ConsProdutosEstoque, un_senhaSupervisor,venda, unDialogo;

procedure Tfrm_ConsultaProduto.edtFornEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConsultaProduto.botao_sairClick(Sender: TObject);
begin
  y_grupo    := '?';
  y_subgrupo := '?';
  y_produto  := '?';
  y_refint   := '?';
  y_forn     := '?';
  y_reffab   := '?';
  y_codigo_barra := '?';
  y_cor      := '?';
  y_tam      := '?';
  close;
end;

procedure Tfrm_ConsultaProduto.FormActivate(Sender: TObject);
begin
  if (not exibiu) then
  begin
    if not frm_principal.x_ConsEstoqOutras and not frm_principal.x_ConsEstoqLoja then
      Panel5.caption := ' [F1]-> Ajuda';

    lblStatus.caption := frm_principal.lblStatus.caption;
    if (frm_ConsultaProduto.y_RotinaChamadora=0) then
    begin
      if frm_LancaVenda = nil then
        n_f7:=2
      else
      if (frm_principal.x_ordem_cbarra=frm_LancaVenda.n_ordem_ctrf7) then
        n_f7:=2
      else
      if (frm_principal.x_ordem_prod_cor_tam=frm_LancaVenda.n_ordem_ctrf7) then
        if (frm_principal.x_ordem_refinterna=frm_LancaVenda.n_ordem_f7) then
          n_f7:=4
        else
        if (frm_principal.x_ordem_reffabric=frm_LancaVenda.n_ordem_f7) then
          n_f7:=3
        else
          n_f7:=1;
    end
    else
    if (frm_ConsultaProduto.y_RotinaChamadora=1) then
    begin
      if (frm_principal.x_ordem_cbarra=frm_ValeMercadoriaFunc.n_ordem_ctrf7) then
        n_f7:=2
      else
      if (frm_principal.x_ordem_prod_cor_tam=frm_ValeMercadoriaFunc.n_ordem_ctrf7) then
        if (frm_principal.x_ordem_refinterna=frm_ValeMercadoriaFunc.n_ordem_f7) then
          n_f7:=4
        else
        if (frm_principal.x_ordem_reffabric=frm_ValeMercadoriaFunc.n_ordem_f7) then
          n_f7:=3
        else
          n_f7:=1;
    end
    else
    if (frm_ConsultaProduto.y_RotinaChamadora=2) then
    begin
      if (frm_principal.x_ordem_cbarra=frm_Transf_Lancamento.n_ordem_ctrf7) then
        n_f7:=2
      else
      if (frm_principal.x_ordem_prod_cor_tam=frm_Transf_Lancamento.n_ordem_ctrf7) then
        if (frm_principal.x_ordem_refinterna=frm_Transf_Lancamento.n_ordem_f7) then
          n_f7:=4
        else
        if (frm_principal.x_ordem_reffabric=frm_Transf_Lancamento.n_ordem_f7) then
          n_f7:=3
        else
          n_f7:=1;
    end
    else
    if (frm_ConsultaProduto.y_RotinaChamadora=3) then
    begin
      if (frm_principal.x_ordem_cbarra=frm_Inventario1.n_ordem_ctrf7) then
        n_f7:=2
      else
      if (frm_principal.x_ordem_prod_cor_tam=frm_Inventario1.n_ordem_ctrf7) then
        if (frm_principal.x_ordem_refinterna=frm_Inventario1.n_ordem_f7) then
          n_f7:=4
        else
        if (frm_principal.x_ordem_reffabric=frm_Inventario1.n_ordem_f7) then
          n_f7:=3
        else
          n_f7:=1;
    end
    else
    if (frm_ConsultaProduto.y_RotinaChamadora=4) then
    begin
      if (frm_principal.x_ordem_cbarra=frm_Transf_Entrada_Online_Lancamento.n_ordem_ctrf7) then
        n_f7:=2
      else
      if (frm_principal.x_ordem_prod_cor_tam=frm_Transf_Entrada_Online_Lancamento.n_ordem_ctrf7) then
        if (frm_principal.x_ordem_refinterna=frm_Transf_Entrada_Online_Lancamento.n_ordem_f7) then
          n_f7:=4
        else
        if (frm_principal.x_ordem_reffabric=frm_Transf_Entrada_Online_Lancamento.n_ordem_f7) then
          n_f7:=3
        else
          n_f7:=1;
    end
    else
    if (frm_ConsultaProduto.y_RotinaChamadora=5) then
      if (frm_principal.x_ordem_cbarra=frm_LancaAtendimento.n_ordem_ctrf7) then
        n_f7:=2
      else
      if (frm_principal.x_ordem_prod_cor_tam=frm_LancaAtendimento.n_ordem_ctrf7) then
        if (frm_principal.x_ordem_refinterna=frm_LancaAtendimento.n_ordem_f7) then
          n_f7:=4
        else
        if (frm_principal.x_ordem_reffabric=frm_LancaAtendimento.n_ordem_f7) then
          n_f7:=3
        else
          n_f7:=1;
    if (RetornaApelidoEmpresa='VARADERO MODAS LTDA') or (RetornaApelidoEmpresa='VARADERO MODAS LTDA.') then
    begin
      Label4.Visible := false;
      Panel7.Visible := false;
    end
    else
    begin
      Label4.Visible := true;
      Panel7.Visible := true;
    end;
    pn_Fornecedor.visible         := false;
    pn_Descricao.visible          := false;
    pn_Referencia.visible         := false;
    pn_Referencia_interna.visible := false;
    pn_codigo_barras.visible      := false;
    pn_ReferenciaFab.Visible      := false;

    if (RetornaApelidoEmpresa='VARADERO MODAS LTDA') or (RetornaApelidoEmpresa='VARADERO MODAS LTDA.') then
    begin
      if (n_f7=1) then
        n_f7:=2;
      if (n_f7=3) then
        n_f7:=4;
    end;

    if (n_f7=1) then
    begin
      pn_Fornecedor.visible:=true;
      edtForn.setfocus;
    end
    else
    if (n_f7=2) then
    begin
      pn_Descricao.visible:=true;
      edtDesc.setfocus;
    end
    else
    if (n_f7=3) then
    begin
      pn_referencia.visible:=true;
      edtForn2.setfocus;
    end
    else
    if (n_f7=4) then
    begin
      pn_referencia_interna.visible:=true;
      edtRefInt.setfocus;
    end
    else
    if (n_f7=5) then
    begin
      pn_codigo_barras.visible:=true;
      edtCodBarras.setfocus;
    end
    else
    if (n_f7=6) then
    begin
      pn_ReferenciaFab.Visible := true;
      edtRefFab2.SetFocus;
    end;
    lblLoja.caption:='Loja: '+form_nz(codigo_loja,2)+'-'+
      form_t(ProcuraNomeLoja(codigo_loja,self),15);
    frm_ConsultaProduto.windowstate:=wsMaximized;
    exibiu:=true;

    if (frm_principal.x_online) then
    begin
      Label10.Visible   := true;
      pnEstoque.Visible := true;
    end
    else
    begin
      Label10.Visible   := false;
      pnEstoque.Visible := false;
    end;
  end;
end;

procedure Tfrm_ConsultaProduto.edtFornKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Tamanho: Integer;
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_ENTER) then
  begin
    Tamanho := length(Trim(edtDesc.Text));
    if (frm_principal.x_onlinevpn) and ((Tamanho<5) or (Trim(edtDesc.Text)='')) then
    begin
      frmDialogo.posativ:=2;
      if (frmDialogo.ExibirMensagem ('Essa consulta deve demorar um pouco. Deseja continuar?'
        ,'Vendas',[mbYes,mbNo],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        btn_procurarclick(Sender)
      else
        edtDesc.SetFocus;
    end
    else
    if ((frm_principal.x_onlinevpn) and ((Tamanho>5) or (Trim(edtDesc.Text)=''))) or (not frm_principal.x_buscaaltomatica) then
      btn_procurarclick(Sender);



    btn_procurarclick(Sender);
  end;
  if (key=K_ESC) then
    close;
  if (key=K_CIMA) then
    edtForn2.setfocus;
  if (key=K_F8) then
    if (TMaskEdit(Sender).name='edtForn') or
      (TMaskEdit(Sender).name='edtForn2') then
      ChamandoF8Forn(edtForn,false);
end;

procedure Tfrm_ConsultaProduto.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    if (pn_Fornecedor.visible) then
      edtForn.setfocus
    else
    if (pn_Descricao.visible) then
      edtDesc.setfocus
    else
    if (pn_referencia.visible) then
      edtForn2.setfocus
    else
    if (pn_referencia_interna.visible) then
      edtRefInt.setfocus
    else
    if (pn_codigo_barras.visible) then
      edtCodBarras.setfocus
    else
    if (pn_ReferenciaFab.Visible) then
      edtRefFab2.SetFocus;
  if (key=K_ESC) then
  begin
    TQuery(ds.dataset).close;
    y_grupo    := '?';
    y_subgrupo := '?';
    y_produto  := '?';
    y_refint   := '?';
    y_forn     := '?';
    y_reffab   := '?';
    y_cor      := '?';
    y_tam      := '?';
    y_codigo_barra := '?';
    edtForn.text   := '';
    edtDesc.text   := '';
    edtRefInt.text := '';
    edtReffab.text := '';
    if (pn_Fornecedor.visible) then
      edtForn.setfocus
    else
    if (pn_Descricao.visible) then
      edtDesc.setfocus
    else
    if (pn_referencia.visible) then
      edtForn2.setfocus
    else
    if (pn_referencia_interna.visible) then
      edtRefInt.setfocus
  end;
  if (key=K_ENTER) then
  begin
    y_grupo    := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_GRUP').AsString;
    y_subgrupo := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_SUBG').AsString;
    y_produto  := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_CODI').AsString;
    y_refint   := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_REFI').AsString;
    y_forn     := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_FORN').AsString;
    y_reffab   := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_REFF').AsString;
    y_codigo_barra := frm_ConsultaProduto.ds.dataset.fieldbyname('cBarra').AsString;
    y_cor      := frm_ConsultaProduto.ds.dataset.fieldbyname('ES_CORE').AsString;
    y_tam      := frm_ConsultaProduto.ds.dataset.fieldbyname('ES_TAMA').AsString;
    ultima_tecla_pressionada:=K_ENTER;
    if not((y_RotinaChamadora=0) and (frm_lancavenda = nil)) then
      close;
  end;
end;

procedure Tfrm_ConsultaProduto.FormCreate(Sender: TObject);
begin
  exibiu:=false;   
  ultima_tecla_pressionada:=0;
  codigo_loja       := -1;
  codigo_fornecedor := -1;
  TQuery(ds.dataset).close;
  if frm_principal.x_exibe_preco_custo then
    grade.Columns[9].Visible := true
  else
    grade.Columns[9].Visible := false;  
end;

procedure Tfrm_ConsultaProduto.gradeDblClick(Sender: TObject);
begin
  if (ds.dataset.active) then
  begin
    y_grupo    := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_GRUP').AsString;
    y_grupo    := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_GRUP').AsString;
    y_subgrupo := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_SUBG').AsString;
    y_produto  := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_CODI').AsString;
    y_refint   := frm_ConsultaProduto.ds.dataset.fieldbyname('PR_REFI').AsString;
    y_codigo_barra := frm_ConsultaProduto.ds.dataset.fieldbyname('cBarra').AsString;
    y_cor      := frm_ConsultaProduto.ds.dataset.fieldbyname('ES_CORE').AsString;
    y_tam      := frm_ConsultaProduto.ds.dataset.fieldbyname('ES_TAMA').AsString;
    ultima_tecla_pressionada:=K_ENTER;
    close;
  end;
end;

procedure Tfrm_ConsultaProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F7) then
    MudaFoco;
  if (Shift = [ssCtrl]) and (key=69) then
    Panel5.OnClick(Panel5);
end;

procedure Tfrm_ConsultaProduto.Limparformulrio1Click(Sender: TObject);
begin
  TQuery(ds.dataset).close;
  y_grupo    := '?';
  y_subgrupo := '?';
  y_produto  := '?';
  y_refint   := '?';
  y_forn     := '?';
  y_reffab   := '?';
  y_cor      := '?';
  y_tam      := '?';
  y_codigo_barra := '?';
  pnForn.caption := '';
  edtForn.text   := '';
  edtDesc.text   := '';
  edtForn2.text  := '';
  edtReffab.text := '';
  edtRefInt.text := '';
  edtCodBarras.text := '';
  if (pn_Fornecedor.visible) then
    edtForn.setfocus
  else
  if (pn_Descricao.visible) then
    edtDesc.setfocus
  else
  if (pn_referencia.visible) then
    edtForn2.setfocus
  else
  if (pn_referencia_interna.visible) then
    edtRefInt.setfocus
  else
  if (pn_codigo_barras.visible) then
    edtCodBarras.setfocus;
end;

procedure Tfrm_ConsultaProduto.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConsultaProduto.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,false);
end;

procedure Tfrm_ConsultaProduto.edtFornExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtForn.text);
  if (codigo<>'') then
  begin
    pnForn.caption:=ProcuraNomeForn(strtofloat(codigo),self);
    edtForn.text:=form_nz(strtofloat(codigo),6);
  end;
end;

procedure Tfrm_ConsultaProduto.edtRefIntKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_ENTER) then
    btn_procurarclick(Sender);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ConsultaProduto.MudaFoco;
begin
  pn_Fornecedor.visible         := false;
  pn_Descricao.visible          := false;
  pn_Referencia.visible         := false;
  pn_Referencia_interna.visible := false;
  pn_codigo_barras.visible      := false;
  pn_ReferenciaFab.Visible      := false;
  n_f7 := n_f7 + 1;
  if (n_f7=7) then
    n_f7:=1;

  if (RetornaApelidoEmpresa='VARADERO MODAS LTDA') or (RetornaApelidoEmpresa='VARADERO MODAS LTDA.') then
  begin
    if (n_f7=1) then
      n_f7:=2;
    if (n_f7=3) then
      n_f7:=4;
  end;

  if (n_f7=1) then
  begin
    pn_Fornecedor.visible:=true;
    edtForn.setfocus;
  end
  else
  if (n_f7=2) then
  begin
    pn_referencia_interna.visible:=true;
    edtRefInt.setfocus;
  end
  else
  if (n_f7=3) then
  begin
    pn_referencia.visible:=true;
    edtForn2.setfocus;
  end
  else
  if (n_f7=4) then
  begin
    pn_Descricao.visible:=true;
    edtDesc.setfocus;
  end
  else
  if (n_f7=5) then
  begin
    pn_codigo_barras.visible:=true;
    edtCodBarras.setfocus;
  end
  else
  if (n_f7=6) then
  begin
    pn_ReferenciaFab.Visible := true;
    edtRefFab2.SetFocus;
  end;
end;

procedure Tfrm_ConsultaProduto.edtForn2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConsultaProduto.edtForn2DblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn2,false);
end;

procedure Tfrm_ConsultaProduto.edtForn2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRefFab.setfocus;
  if (key=K_ESC) then
    close;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn2,false);
end;

procedure Tfrm_ConsultaProduto.edtForn2Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtForn2.text);
  if (codigo<>'') then
    edtForn2.text:=form_nz(strtofloat(codigo),6);
end;

procedure Tfrm_ConsultaProduto.btn_procurarClick(Sender: TObject);
var
  refint,reffab: String;
  desc,codForn: String;
  desc1,desc2,desc3: String;
  codigo_barras,letra: String;
  i: Integer;
begin
  if (pn_Fornecedor.visible) then
  begin
    codForn := Trim(edtForn.text);
    if (codForn<>'') then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (PR.PR_FORN=:forn) AND (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')     '+
                                 'ORDER BY PR_DESC,ES_CORE,ES_OTAM                                      ');
      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,        ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT  ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE       ');
      TQuery(ds.dataset).sql.Add ('WHERE (PR_FORN=:forn) AND   ');
      TQuery(ds.dataset).sql.Add ('      (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  ');}
      TQuery(ds.dataset).parambyname('forn').AsFloat := strtofloat(codforn);
      TQuery(ds.dataset).open;
      grade.setfocus;
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                            '+
                                 'ORDER BY PR_DESC,ES_CORE,ES_OTAM                                      ');
      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,        ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT  ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE       ');
      TQuery(ds.dataset).sql.Add ('WHERE (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  ');}
      TQuery(ds.dataset).open;
      grade.setfocus;
    end;
  end
  else
  if (pn_Descricao.visible) then
  begin
    desc := Trim(edtDesc.text);
    if (desc<>'') then
    begin
      desc1 := UpperCase(desc);

              {desc2 := LowerCase(desc);
              desc3 := UpperCase(Copy(desc,1,1))+LowerCase(Copy(desc,2,Length(desc)-1));
              i:=1;
              While (i<=length(desc3)) do
              begin
                   if (i>1) then
                   begin
                        if (desc3[i-1]=' ') then
                        begin
                             letra := desc3[i];
                             letra := UpperCase(letra);
                             desc3[i] := letra[1];
                        end;
                   end;
                   i:=i+1;
              end;}

      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM, '+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT  '+
                                 'FROM PRODUTOS PR                                                       '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                    '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                    '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                        '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                          ');
      if (chFiltroContem.Checked) then
        TQuery(ds.dataset).SQL.Add('WHERE (PR.PR_DESC LIKE '+chr(39)+'%'+edtDesc.Text+'%'+chr(39)+') AND ')
      else
        TQuery(ds.dataset).SQL.Add('WHERE (PR.PR_DESC LIKE '+chr(39)+edtDesc.Text+'%'+chr(39)+') AND     ');
      TQuery(ds.dataset).SQL.Add('        (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                           ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('      AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')             ');
      TQuery(ds.dataset).SQL.Add('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                       ');

      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,          ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT    ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE                                                    ');
      if (chFiltroContem.Checked) then
        TQuery(ds.dataset).sql.Add ('WHERE  (PR_DESC LIKE '+chr(39)+'%'+edtDesc.Text+'%'+chr(39)+') AND ')
      else
        TQuery(ds.dataset).sql.Add ('WHERE  (PR_DESC LIKE '+chr(39)+edtDesc.Text+'%'+chr(39)+') AND     ');
      TQuery(ds.dataset).sql.Add ('       (ES_GRUP=PR_GRUP) AND                                             ');
      TQuery(ds.dataset).sql.Add ('       (ES_SUBG=PR_SUBG) AND                                             ');
      TQuery(ds.dataset).sql.Add ('       (ES_PROD=PR_CODI)                                                 ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')                    ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                         '); }
      TQuery(ds.dataset).open;
      grade.setfocus;
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                            ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add('   AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')               ');
      TQuery(ds.DataSet).SQL.Add('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                      ');

      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,       ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE                                                 ');
      TQuery(ds.dataset).sql.Add ('WHERE (ES_GRUP=PR_GRUP) AND                                           ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND                                           ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)                                               ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')                  ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                      ');}
      TQuery(ds.dataset).open;
      grade.setfocus;
    end;
  end
  else
  if (pn_referencia.visible) then
  begin
    codForn := Trim(edtForn2.text);
    reffab := Trim(edtRefFab.text);
    if (codforn<>'') and (reffab<>'') then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (PR.PR_REFF LIKE '+chr(39)+reffab+'%'+chr(39)+') AND            '+
                                 '      (PR.PR_FORN=:forn) AND (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('    AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')              ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                     ');

      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,    ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT     ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE                                              ');
      TQuery(ds.dataset).sql.Add ('WHERE (PR_REFF LIKE '+chr(39)+reffab+'%'+chr(39)+') AND            ');
      TQuery(ds.dataset).sql.Add ('      (PR_FORN=:forn) AND   ');
      TQuery(ds.dataset).sql.Add ('      (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  ');}
      TQuery(ds.dataset).parambyname('forn').AsFloat := strtofloat(codforn);
      TQuery(ds.dataset).open;
      grade.setfocus;
    end
    else
    if (codforn<>'') and (reffab='') then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (PR.PR_FORN=:forn) AND (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('    AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')              ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                     ');

      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,    ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT     ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE       ');
      TQuery(ds.dataset).sql.Add ('WHERE (PR_FORN=:forn) AND   ');
      TQuery(ds.dataset).sql.Add ('      (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  ');}
      TQuery(ds.dataset).parambyname('forn').AsFloat := strtofloat(codforn);
      TQuery(ds.dataset).open;
      grade.setfocus;
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                            ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('    AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')              ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                     ');


      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,    ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT     ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE       ');
      TQuery(ds.dataset).sql.Add ('WHERE (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  '); }
      TQuery(ds.dataset).open;
      grade.setfocus;
    end;
  end
  else
  if (pn_referencia_interna.visible) then
  begin
    refint := Trim(edtRefInt.text);
    if (refint<>'') then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,       '+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (PR.PR_REFI LIKE '+chr(39)+refint+'%'+chr(39)+') AND            '+
                                 '      (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                            ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('    AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')              ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                     ');


     { TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,    ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT     ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE       ');
      TQuery(ds.dataset).sql.Add ('WHERE (PR_REFI LIKE '+chr(39)+refint+'%'+chr(39)+') AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  ');  }
      TQuery(ds.dataset).open;
      grade.setfocus;
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM, '+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                            ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('    AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')              ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                     ');

      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,    ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT     ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE       ');
      TQuery(ds.dataset).sql.Add ('WHERE (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  ');}
      TQuery(ds.dataset).open;
      grade.setfocus;
    end;
  end
  else
  if (pn_codigo_barras.visible) then
  begin
    codigo_barras := Trim(edtCodBarras.text);
    if (codigo_barras<>'') then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (ES.ES_CBAR LIKE '+chr(39)+codigo_barras+'%'+chr(39)+') AND     '+
                                 '      (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                            ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('    AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')              ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                     ');

      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,    ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT     ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE  ');
      TQuery(ds.dataset).sql.Add ('WHERE (ES_CBAR LIKE '+chr(39)+codigo_barras+'%'+chr(39)+') AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  '); }
      TQuery(ds.dataset).open;
      grade.setfocus;
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,'+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT '+
                                 'FROM PRODUTOS PR                                                      '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                   '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                   '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                       '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                         '+
                                 'WHERE (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                            ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).SQL.Add('    AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')              ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                     ');

      {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,    ');
      TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT     ');
      TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE  ');
      TQuery(ds.dataset).sql.Add ('WHERE (ES_GRUP=PR_GRUP) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_SUBG=PR_SUBG) AND ');
      TQuery(ds.dataset).sql.Add ('      (ES_PROD=PR_CODI)     ');
      if (codigo_fornecedor<>-1) then
        TQuery(ds.dataset).sql.Add ('   AND (PR_FORN='+floattostr(codigo_fornecedor)+')     ');
      TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM  ');}
      TQuery(ds.dataset).open;
      grade.setfocus;
    end;
  end
  else
  if (pn_ReferenciaFab.Visible) then
  begin
    TQuery(ds.dataset).close;
    TQuery(ds.dataset).sql.clear;
    TQuery(ds.DataSet).SQL.Add('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,            '+
                                 '       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT    '+
                                 'FROM PRODUTOS PR                                                         '+
                                 'LEFT JOIN ESTOQUE ES ON (ES.ES_GRUP=PR.PR_GRUP) AND                      '+
                                 '                        (ES.ES_SUBG=PR.PR_SUBG) AND                      '+
                                 '                        (ES.ES_PROD=PR.PR_CODI)                          '+
                                 'LEFT JOIN CORES CR ON (CR.CR_CODI=ES.ES_CORE)                            ');
    if (chFiltroContem.Checked) then
      TQuery(ds.dataset).sql.Add ('WHERE (PR.PR_REFF LIKE '+chr(39)+'%'+edtRefFab2.Text+'%'+chr(39)+') AND ')
    else
      TQuery(ds.dataset).sql.Add ('WHERE (PR.PR_REFF LIKE '+chr(39)+edtRefFab2.Text+'%'+chr(39)+') AND     ');
    TQuery(ds.DataSet).SQL.Add('         (CR.CR_ATIV='+chr(39)+'1'+chr(39)+')                              ');
    if (codigo_fornecedor<>-1) then
      TQuery(ds.dataset).SQL.Add('       AND (PR.PR_FORN='+floattostr(codigo_fornecedor)+')                ');
    TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                          ');

    {TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,            ');
    TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT      ');
    TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE                                                      ');
    if (chFiltroContem.Checked) then
      TQuery(ds.dataset).sql.Add ('WHERE (PR_REFF LIKE '+chr(39)+'%'+edtRefFab2.Text+'%'+chr(39)+') AND ')
    else
      TQuery(ds.dataset).sql.Add ('WHERE (PR_REFF LIKE '+chr(39)+edtRefFab2.Text+'%'+chr(39)+') AND     ');
    TQuery(ds.dataset).sql.Add ('       (ES_GRUP=PR_GRUP) AND                                               ');
    TQuery(ds.dataset).sql.Add ('       (ES_SUBG=PR_SUBG) AND                                               ');
    TQuery(ds.dataset).sql.Add ('       (ES_PROD=PR_CODI)                                                   ');
    TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                           ');}
    TQuery(ds.dataset).open;
    grade.setfocus;
  end;
end;

procedure Tfrm_ConsultaProduto.edtCodBarrasEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConsultaProduto.edtCodBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_ENTER) then
    btn_procurarclick(Sender);
  if (key=K_ESC) then
    close;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_ConsultaProduto.Ajuda1Click(Sender: TObject);
begin
  ListaAtalhosF1.clear;
  ListaAtalhosF1.Add('  [ENTER]  - Selecionar produto ');
  ListaAtalhosF1.Add('  [F2]     - Alterar Foco entre');
  ListaAtalhosF1.Add('             grade do produto e filtro');
  ListaAtalhosF1.Add('  [F4]     - Visão dos preços do item');
  ListaAtalhosF1.Add('  [F7]     - Alternar filtros de localização');
  ListaAtalhosF1.Add('             do produto');
  ListaAtalhosF1.Add('  [ESC]    - Sair');
  Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
  frm_AjudaComandos.top := frm_AjudaComandos.top +30;
  frm_AjudaComandos.showmodal;
  frm_AjudaComandos.Free;
end;

procedure Tfrm_ConsultaProduto.Visaogeraldosprecospraticadosparaoitem1Click(
  Sender: TObject);
begin
  Application.CreateForm(Tfrm_VisaoPrecosPraticados, frm_VisaoPrecosPraticados);
  frm_VisaoPrecosPraticados.y_grupo    := ds.dataset.fieldbyname('PR_GRUP').AsFloat;
  frm_VisaoPrecosPraticados.y_subgrupo := ds.dataset.fieldbyname('PR_SUBG').AsFloat;
  frm_VisaoPrecosPraticados.y_produto  := ds.dataset.fieldbyname('PR_CODI').AsFloat;
  frm_VisaoPrecosPraticados.y_cor      := ds.dataset.fieldbyname('ES_CORE').AsFloat;
  frm_VisaoPrecosPraticados.y_tamanho  := ds.dataset.fieldbyname('ES_TAMA').AsString;
  frm_VisaoPrecosPraticados.showmodal;
  frm_VisaoPrecosPraticados.Free;
end;

procedure Tfrm_ConsultaProduto.Panel5Click(Sender: TObject);
var
  a:Boolean;
begin
  if not frm_principal.x_ConsEstoqOutras and not frm_principal.x_ConsEstoqLoja then
    exit;

  if (frm_principal.x_solicitar_senha_Saldo) then
  begin
    frm_senhaSupervisor.showmodal;
    if not frm_senhaSupervisor.y_flag then
      exit;
  end;

  Frm_ConsProdutosEstoque := TFrm_ConsProdutosEstoque.create(Application);
  if TQuery(ds.dataset).Active then
  begin
    Frm_ConsProdutosEstoque.edtGrupo.text     := TQuery(ds.dataset).FieldByName('Pr_Grup').AsString ;
    Frm_ConsProdutosEstoque.edtSubgrupo.text  := TQuery(ds.dataset).FieldByName('Pr_SubG').AsString;
    Frm_ConsProdutosEstoque.edtCodigo.text    := TQuery(ds.dataset).FieldByName('Pr_Codi').AsString;
    ;
    Frm_ConsProdutosEstoque.edtCor.text       := TQuery(ds.dataset).fieldbyname('ES_CORE').AsString;
    Frm_ConsProdutosEstoque.edtFaixaTam.text  := TQuery(ds.dataset).fieldbyname('ES_Tama').AsString;
    Frm_ConsProdutosEstoque.OnActivate(Self);
    Frm_ConsProdutosEstoque.EdtCodigo.OnExit(Sender);
    if not((Frm_ConsProdutosEstoque.n_cor_unica) and (Frm_ConsProdutosEstoque.n_tam_unico)) then
      Frm_ConsProdutosEstoque.btnlocalizar.onclick(Sender);

    Frm_ConsProdutosEstoque.btnEditarMovimento.visible  := false;
    Frm_ConsProdutosEstoque.showmodal;
  end;
  Frm_ConsProdutosEstoque.destroy;

end;

procedure Tfrm_ConsultaProduto.edtDescChange(Sender: TObject);
begin
  if (not frm_principal.x_onlinevpn) {and (frm_principal.x_buscaaltomatica)} then
  begin
    TQuery(ds.dataset).close;
    TQuery(ds.dataset).sql.clear;
    TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,          ');
    TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT    ');
    TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE                                                    ');
    if (chFiltroContem.Checked) then
      TQuery(ds.dataset).sql.Add ('WHERE  (PR_DESC LIKE '+chr(39)+'%'+edtDesc.Text+'%'+chr(39)+') AND ')
    else
      TQuery(ds.dataset).sql.Add ('WHERE  (PR_DESC LIKE '+chr(39)+edtDesc.Text+'%'+chr(39)+') AND     ');
    TQuery(ds.dataset).sql.Add ('    ');
    TQuery(ds.dataset).sql.Add ('       (ES_GRUP=PR_GRUP) AND                                             ');
    TQuery(ds.dataset).sql.Add ('       (ES_SUBG=PR_SUBG) AND                                             ');
    TQuery(ds.dataset).sql.Add ('       (ES_PROD=PR_CODI)                                                 ');
    TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                         ');
    TQuery(ds.dataset).open;
  end;
end;

function Tfrm_ConsultaProduto.ConsultaEstoqueProduto: String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;
  clAux.AddParam('SELECT EL_QTD1 as ESTOQUE     ');
  clAux.AddParam('FROM ESTOQUE_LOJA             ');
  clAux.AddParam('WHERE (EL_GRUP=:GRUPO) AND    ');
  clAux.AddParam('      (EL_SUBG=:SUBGRUPO) AND ');
  clAux.AddParam('      (EL_PROD=:PRODUTO) AND  ');
  clAux.AddParam('      (EL_CORE=:COR) AND      ');
  clAux.AddParam('      (EL_TAMA=:TAMANHO) AND  ');
  clAux.AddParam('      (EL_LOJA=:LOJA)         ');
  clAux.consulta.ParamByName('GRUPO').AsFloat    := ds.dataset.fieldbyname('PR_GRUP').AsFloat;
  clAux.consulta.ParamByName('SUBGRUPO').AsFloat := ds.dataset.fieldbyname('PR_SUBG').AsFloat;
  clAux.consulta.ParamByName('PRODUTO').AsFloat  := ds.dataset.fieldbyname('PR_CODI').AsFloat;
  clAux.consulta.ParamByName('COR').AsFloat      := ds.dataset.fieldbyname('ES_CORE').AsFloat;
  clAux.consulta.ParamByName('TAMANHO').AsString := ds.dataset.fieldbyname('ES_TAMA').AsString;
  clAux.consulta.ParamByName('LOJA').AsFloat     := frm_principal.x_loja;
  if (clAux.Execute) then
    result := clAux.Result('ESTOQUE');
  clAux.Desconect;
  clAux.Free;
end;

procedure Tfrm_ConsultaProduto.edtRefFab2Change(Sender: TObject);
begin
  if (not frm_principal.x_onlinevpn) then
  begin
    TQuery(ds.dataset).close;
    TQuery(ds.dataset).sql.clear;
    TQuery(ds.dataset).sql.Add ('SELECT PR_GRUP,PR_SUBG,PR_FORN,PR_DESC,PR_REFI,PR_REFF,PR_CODI,PR_NCM,        ');
    TQuery(ds.dataset).sql.Add ('       ES_CORE,ES_TAMA,ES_OTAM,ES_CBAR,ES_IPPT,ES_SITR,PR_UNID,ES_IAT  ');
    TQuery(ds.dataset).sql.Add ('FROM PRODUTOS,ESTOQUE                                                  ');
    if (chFiltroContem.Checked) then
      TQuery(ds.dataset).sql.Add ('WHERE (PR_REFF LIKE '+chr(39)+'%'+edtRefFab2.Text+'%'+chr(39)+') AND ')
    else
      TQuery(ds.dataset).sql.Add ('WHERE (PR_REFF LIKE '+chr(39)+edtRefFab2.Text+'%'+chr(39)+') AND     ');
    //*************************************************************************************************
    TQuery(ds.dataset).sql.Add ('       (ES_GRUP=PR_GRUP) AND                                           ');
    TQuery(ds.dataset).sql.Add ('       (ES_SUBG=PR_SUBG) AND                                           ');
    TQuery(ds.dataset).sql.Add ('       (ES_PROD=PR_CODI)                                               ');
    TQuery(ds.dataset).sql.Add ('ORDER BY PR_DESC,ES_CORE,ES_OTAM                                       ');
    //*************************************************************************************************
    TQuery(ds.dataset).open;
  end;
end;

procedure Tfrm_ConsultaProduto.edtRefFab2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) then
    btn_Procurar.OnClick(Sender);
end;

end.
