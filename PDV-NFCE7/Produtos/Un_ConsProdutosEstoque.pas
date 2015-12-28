unit Un_ConsProdutosEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LabelOO, Buttons, Grids, DBGrids, ComCtrls, Mask,
  ExtCtrls, Menus, DB, DBTables,FuncoesGlobais,auxiliar;

type
  TFrm_ConsProdutosEstoque = class(TForm)
    gbLoja: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCor: TMaskEdit;
    pnCor: TPanel;
    edtFaixaTam: TMaskEdit;
    pnProduto: TPanel;
    pnLocal1: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    edtGrupo: TMaskEdit;
    edtSubGrupo: TMaskEdit;
    edtCodigo: TMaskEdit;
    pnLocal2: TPanel;
    Label18: TLabel;
    edtRefInt: TMaskEdit;
    pnUnidade: TPanel;
    pnLocal3: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    edtRefFab: TMaskEdit;
    edtForn: TMaskEdit;
    btnLocalizar: TPanel;
    Panel1: TPanel;
    Label33: TLabel;
    Label7: TLabel;
    edtLoja: TMaskEdit;
    pnLoja: TPanel;
    PageControl1: TPageControl;
    pagina1: TTabSheet;
    grade: TDBGrid;
    Panel2: TPanel;
    btnMudarProduto: TSpeedButton;
    btnMudarLoja: TSpeedButton;
    btnExibirCodBarras: TSpeedButton;
    btnExibirTodosPrecos: TSpeedButton;
    btnDadosProduto: TSpeedButton;
    LabelOO1: TLabelOO;
    pnForn: TPanel;
    pagina2: TTabSheet;
    grade2: TDBGrid;
    Memo3: TMemo;
    Panel15: TPanel;
    btnMudarProduto2: TSpeedButton;
    btnMudarLoja2: TSpeedButton;
    Panel5: TPanel;
    btnVer1: TSpeedButton;
    btnVer5: TSpeedButton;
    qEstoque: TQuery;
    qEstoqueloja: TStringField;
    qEstoquecor: TStringField;
    qEstoquecTam: TStringField;
    qEstoqueEL_GRUP: TFloatField;
    qEstoqueEL_SUBG: TFloatField;
    qEstoqueEL_PROD: TFloatField;
    qEstoqueEL_CORE: TFloatField;
    qEstoqueEL_TAMA: TStringField;
    qEstoqueEL_LOJA: TFloatField;
    qEstoqueEL_PVE1: TFloatField;
    qEstoqueEL_PVE2: TFloatField;
    qEstoqueEL_PCU1: TFloatField;
    qEstoqueEL_PCU2: TFloatField;
    qEstoqueEL_QTD1: TFloatField;
    qEstoqueEL_QTD2: TFloatField;
    qEstoquecDesc: TStringField;
    qEstoquepvenda1: TStringField;
    qEstoquepcusto1: TStringField;
    qEstoquepcusto2: TStringField;
    qEstoquepvenda2: TStringField;
    qEstoquefEL_QTD3: TFloatField;
    qEstoqueEL_UPC1: TFloatField;
    qEstoqueEL_UPC2: TFloatField;
    qEstoquecRefi: TStringField;
    qEstoquecCodigo: TStringField;
    qEstoquecUnidade: TStringField;
    qEstoquecReffab: TStringField;
    qEstoquepvigente1: TStringField;
    qEstoquepvigente2: TStringField;
    qEstoqueES_CBAR: TStringField;
    qEstoqueES_PVE1: TFloatField;
    qEstoqueES_PVE2: TFloatField;
    qEstoqueppromocional1: TStringField;
    qEstoqueppromocional2: TStringField;
    qEstoquepprinc1: TStringField;
    qEstoquepprinc2: TStringField;
    qEstoqueES_CEAN: TStringField;
    qLojas: TQuery;
    qLojasEL_LOJA: TFloatField;
    qCores: TQuery;
    qCoresEL_CORE: TFloatField;
    qFaixas: TQuery;
    ds1: TDataSource;
    ds2: TDataSource;
    qGrade: TQuery;
    Query1: TQuery;
    SpeedButton1: TSpeedButton;
    qEstoqueEL_UVEN: TDateTimeField;
    qEstoqueEL_UTRF: TDateTimeField;
    qEstoqueEL_UVLM: TDateTimeField;
    qEstoqueFQTD1: TFloatField;
    LbAtualizado: TLabelOO;
    qEstoqueEL_TIME: TDateTimeField;
    Label19: TLabel;
    pnQtdeTotal: TPanel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    lblStatus: TLabel;
    btnEditarMovimento: TSpeedButton;
    lblajuda: TLabelOO;
    botao_sair: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLojaChange(Sender: TObject);
    procedure edtLojaDblClick(Sender: TObject);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefIntChange(Sender: TObject);
    procedure edtRefIntDblClick(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtRefIntExit(Sender: TObject);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFornChange(Sender: TObject);
    procedure edtFornDblClick(Sender: TObject);
    procedure edtFornExit(Sender: TObject);
    procedure edtFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefFabChange(Sender: TObject);
    procedure edtRefFabDblClick(Sender: TObject);
    procedure edtRefFabExit(Sender: TObject);
    procedure edtRefFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCorChange(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure btnMudarLojaClick(Sender: TObject);
    procedure btnMudarProdutoClick(Sender: TObject);
    procedure btnExibirCodBarrasClick(Sender: TObject);
    procedure btnDadosProdutoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qEstoqueCalcFields(DataSet: TDataSet);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeEnter(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExibirTodosPrecosClick(Sender: TObject);
    procedure btnVer1Click(Sender: TObject);
    procedure btnVer5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEditarMovimentoClick(Sender: TObject);
    procedure qEstoqueAfterScroll(DataSet: TDataSet);
  private
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    n_reffab: String;
    n_refi: String;
    n_forn: Real;
    tipz: String;           {indica se estou controlando o dentro/fora}
    n_ordem_f7: Integer;

    //... grade nova
    nome_arquivo_temp: String;
    indArqTemp: Integer;
    indcoltabgrade: Integer;
    clInsLinTabGrade: TClassAuxiliar;

    {...}
    jaClicou: Boolean;
    Modo: Integer; {0-> modo consulta (para um produto),
                    1-> uso geral pelo menu principal,
                    2-> pela consulta de itens}
    BotaoVerClicado: Integer;
    procedure MudaFocoCodigo;
    procedure AjustaLista;
    procedure AjustaGrade;
    procedure consprodutos;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    function  BuscaFornecedor(grupo,subgrupo,produto: Real):Real;
    procedure limpacad;
    procedure LimparEdits;
    procedure CriaTabelaGrade;
    procedure PreencheColunaTabelaGrade(loja, coluna: String);
    procedure InsereLinhaTabelaGrade;
    procedure DestroiTabelaGrade;
    function retornadifestoque(Tabela, CampoQtde, Abrv: String;
      hora: Tdatetime; VQuery: TQuery): Real;
    { Private declarations }
  public
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}
    { Public declarations }
  end;

var
  Frm_ConsProdutosEstoque: TFrm_ConsProdutosEstoque;

implementation

uses principal, un_ConsultaProdutos,funcoes1,funcoes2,procura,un_VerProdutos,
  un_BotoesTransf, unDialogo, venda;

{$R *.dfm}

procedure Tfrm_ConsProdutosEstoque.MudaFocoCodigo;
begin
  pnLocal1.visible:=false;
  pnLocal2.visible:=false;
  pnLocal3.visible:=false;
  n_ordem_f7 := n_ordem_f7 + 1;

  if (n_ordem_f7=4) then
    n_ordem_f7:=1
  else
  if (n_ordem_f7=0) then
    n_ordem_f7:=3;
  if (RetornaApelidoEmpresa='VARADERO MODAS LTDA') or (RetornaApelidoEmpresa='VARADERO MODAS LTDA.') then
    if (n_ordem_f7=2) then
      n_ordem_f7:=3;

  if (frm_principal.x_ordem_codigo=n_ordem_f7) then
  begin
    pnLocal1.visible := true;
    edtGrupo.setfocus;
  end
  else
  if (frm_principal.x_ordem_refinterna=n_ordem_f7) then
  begin
    pnLocal2.visible := true;
    edtRefInt.setfocus;
  end
  else
  if (frm_principal.x_ordem_reffabric=n_ordem_f7) then
  begin
    pnLocal3.visible := true;
    edtForn.setfocus;
  end;
end;



procedure TFrm_ConsProdutosEstoque.FormActivate(Sender: TObject);
begin
  if (not jaClicou) then
  begin

    if not frm_principal.x_ConsEstoqPrc then
    begin
      Grade.Columns[5].Width := Grade.Columns[5].Width + Grade.Columns[12].Width - 35;
      Grade.Columns[8].Color := Grade.Columns[12].Color;
      btnVer5.Visible := false;
    end;

    if not frm_principal.x_ConsEstoqQtd then
    begin
      Grade.Columns[5].Width := Grade.Columns[5].Width + Grade.Columns[12].Width - 5;
      btnVer5.left := btnVer1.left;
      btnVer1.Visible := false;
    end;



    Grade.Columns[8].Visible  := frm_principal.x_ConsEstoqQtd;
    Grade.Columns[12].Visible := frm_principal.x_ConsEstoqPrc;
    pagina2.tabvisible        := frm_principal.x_ConsEstoqOutras;
    SpeedButton1.Visible      := frm_principal.x_ConsEstoqOutras;



    if Sender = self then
      FocaCodigoLocal1;
    PageControl1.activepageindex:=0;

//         grade.setfocus;
    jaClicou:=true;
{         if (frm_principal.x_loja<>0) then
         begin
              edtLoja.text     := form_nz(frm_principal.x_loja,2);
              edtLojaExit(Sender);
         end;}
    if frm_principal.x_ConsEstoqOutras then
    begin
      if Sender = self then
        edtLoja.setfocus;
    end
    else
    begin
      edtLoja.text     := formatfloat('00',frm_principal.x_loja);
      pnLoja.caption   := ProcuraNomeLoja(frm_principal.x_loja,nil);
      edtLoja.readOnly := true;
    end;
    if sender <> self then
      Self.Activecontrol := grade;

  end;
end;

procedure TFrm_ConsProdutosEstoque.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus
  else
  if (pnLocal3.visible) then
    edtForn.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.edtRefIntChange(Sender: TObject);
begin
  if (Trim(edtRefInt.text)<>'') then
    n_refi := Trim(edtRefInt.text)
  else
    n_refi := '0';
end;

procedure TFrm_ConsProdutosEstoque.edtRefIntDblClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
  frm_ConsultaProduto.showmodal;
  if (frm_ConsultaProduto.y_grupo<>'?') then
  begin
    edtGrupo.text    := frm_ConsultaProduto.y_grupo;
    edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
    edtCodigo.text   := frm_ConsultaProduto.y_produto;
    edtRefInt.text   := frm_ConsultaProduto.y_refint;
    edtRefFab.text   := frm_ConsultaProduto.y_reffab;
    FocaCodigoLocal1;
  end;
  frm_ConsultaProduto.Free;
end;

procedure TFrm_ConsProdutosEstoque.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure TFrm_ConsProdutosEstoque.edtRefIntExit(Sender: TObject);
var
  clProd: TClassAuxiliar;
  refinterna: String;
begin
  refinterna := Trim(edtRefInt.text);
  if (refinterna<>'') then
    with (clProd) do
    begin
      clProd := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,           ');
      AddParam ('       PR_SUBG,PR_CODI,PR_UNID,PR_REFF,PR_FORN    ');
      AddParam ('From   PRODUTOS                                   ');
      AddParam ('Where (PR_REFI='+chr(39)+refinterna+chr(39)+')    ');
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

                {*** sugerindo a ref. interna}
        edtRefFab.text    := Trim(Result('PR_REFF'));
        edtForn.text      := form_nz(Result('PR_FORN'),6);
        pnUnidade.caption := Trim(Result('PR_UNID'));
      end
      else
      begin
        edtRefFab.text    := '';
        edtForn.text      := '';
        n_grupo    := 0;
        n_subgrupo := 0;
        n_produto  := 0;
        pnProduto.caption:='<Produto não cadastrado>';
      end;
      frm_principal.BarraDicas.caption:='';
      edtGrupo.text    := form_nz (n_grupo,2);
      edtSubGrupo.text := form_nz (n_subgrupo,2);
      edtCodigo.text   := form_nz (n_produto,4);
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaeditVerde(edtCor);
        pnCor.caption:='Cor única';
      end
      else
      if (Modo=0) or (Modo=1) then
      begin
        edtCor.text:='';
        habilitaeditVerde(edtCor);
      end;
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
      if (Modo=0) or (Modo=1) then
      begin
        edtFaixaTam.text:='';
        habilitaeditVerde(edtFaixaTam);
      end;
      if (n_cor_unica) and (n_tam_unico) then
        btnLocalizarClick(Sender);
    end;
end;

procedure TFrm_ConsProdutosEstoque.edtRefIntKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtRefIntExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus;
  end;
  if (key=K_F8) then
    consprodutos;
  if (key=K_CIMA) then
    edtLoja.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.edtFornChange(Sender: TObject);
begin
  if (Trim(edtForn.text)<>'') then
    n_forn := strtofloat(Trim(edtForn.text))
  else
    n_forn := 0;
end;

procedure TFrm_ConsProdutosEstoque.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,true);
end;

procedure TFrm_ConsProdutosEstoque.edtFornExit(Sender: TObject);
begin
  if (n_forn<>0) then
    edtForn.text := form_nz(n_forn,6);
end;

procedure TFrm_ConsProdutosEstoque.edtFornKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRefFab.setfocus;
  if (key=K_CIMA) then
    edtLoja.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn,true);
  if (key=K_ESC) then
    close;
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.edtRefFabChange(Sender: TObject);
begin
  if (Trim(edtRefFab.text)<>'') then
    n_reffab := Trim(edtRefFab.text)
  else
    n_reffab := '0';
end;

procedure TFrm_ConsProdutosEstoque.edtRefFabDblClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
  frm_ConsultaProduto.showmodal;
  if (frm_ConsultaProduto.y_grupo<>'?') then
  begin
    edtGrupo.text    := frm_ConsultaProduto.y_grupo;
    edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
    edtCodigo.text   := frm_ConsultaProduto.y_produto;
    edtRefInt.text   := frm_ConsultaProduto.y_refint;
    edtRefFab.text   := frm_ConsultaProduto.y_reffab;
    FocaCodigoLocal1;
  end;
  frm_ConsultaProduto.Free;
end;

procedure TFrm_ConsProdutosEstoque.edtRefFabExit(Sender: TObject);
var
  clProd: TClassAuxiliar;
  codigoforn,reffabric: String;
begin
  codigoforn := Trim(edtForn.text);
  reffabric  := Trim(edtRefFab.text);
  if (reffabric<>'') and (codigoforn<>'') then
    with (clProd) do
    begin
      clProd := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,           ');
      AddParam ('       PR_SUBG,PR_CODI,PR_UNID,PR_REFI            ');
      AddParam ('From   PRODUTOS                                   ');
      AddParam ('Where (PR_FORN='+codigoforn+') AND                ');
      AddParam ('      (PR_REFF='+chr(39)+reffabric+chr(39)+')     ');
      frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
      frm_principal.refresh;
      n_cor_unica:=false;
      n_tam_unico:=false;
      if (Execute) then
      begin
        n_grupo    := result('PR_GRUP');
        n_subgrupo := result('PR_SUBG');
        n_produto  := result('PR_CODI');
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

                {*** sugerindo a ref. interna}
        edtRefInt.text    := Trim(Result('PR_REFI'));
        pnUnidade.caption:=Result('PR_UNID');
      end
      else
      begin
        edtRefInt.text    := '';
        n_grupo    := 0;
        n_subgrupo := 0;
        n_produto  := 0;
        n_refi     := '0';
        pnProduto.caption:='<Produto não cadastrado>';
      end;
      frm_principal.BarraDicas.caption:='';
      edtGrupo.text    := form_nz (n_grupo,2);
      edtSubGrupo.text := form_nz (n_subgrupo,2);
      edtCodigo.text   := form_nz (n_produto,4);
      edtFornExit(Sender);
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaeditVerde(edtCor);
        pnCor.caption:='Cor única';
      end
      else
      if (Modo=0) or (Modo=1) then
      begin
        edtCor.text:='';
        habilitaeditVerde(edtCor);
      end;
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
      if (Modo=0) or (Modo=1) then
      begin
        edtFaixaTam.text:='';
        habilitaeditVerde(edtFaixaTam);
      end;
      if (n_cor_unica) and (n_tam_unico) then
        btnLocalizarClick(Sender);
      ;
    end;
end;

procedure TFrm_ConsProdutosEstoque.edtRefFabKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtRefIntExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus;
  end;
  if (key=K_F8) then
    consprodutos{         Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
         frm_ConsultaProduto.showmodal;
         if (frm_ConsultaProduto.y_grupo<>'?') then
         begin
             edtGrupo.text    := frm_ConsultaProduto.y_grupo;
             edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
             edtCodigo.text   := frm_ConsultaProduto.y_produto;
             edtRefInt.text   := frm_ConsultaProduto.y_refint;
             edtRefFab.text   := frm_ConsultaProduto.y_reffab;
             FocaCodigoLocal1;
         end;
         frm_ConsultaProduto.Free;};
  if (key=K_CIMA) then
    edtForn.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. do fabricante do produto: até 15 caracteres',5);
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;

end;

procedure TFrm_ConsProdutosEstoque.edtCorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
  begin
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (key=13) then
      btnLocalizarClick(Sender);
    ;
  end;
  if (key=K_ESC) then
    close;
  if (key=38) then
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure TFrm_ConsProdutosEstoque.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
end;

procedure TFrm_ConsProdutosEstoque.edtCorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),4);
  end
  else
    pnCor.caption:='';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure TFrm_ConsProdutosEstoque.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure TFrm_ConsProdutosEstoque.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure TFrm_ConsProdutosEstoque.edtFaixaTamExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure TFrm_ConsProdutosEstoque.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnLocalizarClick(Sender);
  ;
  if (key=38) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
  if (key=K_ESC) then
    close;
end;

procedure TFrm_ConsProdutosEstoque.btnLocalizarClick(Sender: TObject);
var
  porcao_grupo,porcao_subgrupo,porcao_produto: String;
  codigo,loja,cor,faixa: String;
  ind,i:Integer;
begin
  porcao_grupo    := floattostr(n_grupo);
  porcao_subgrupo := floattostr(n_subgrupo);
  porcao_produto  := floattostr(n_produto);
  loja   := Trim(edtLoja.text);
  cor    := Trim(edtCor.text);
  faixa  := Trim(edtFaixaTam.text);
  if (cor='') then
    cor:='-1';
  if (faixa='') then
    faixa:='-1';

     {...}
  if ((porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0')) then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select cast(1 as Integer) as Ind');
    qestoque.sql.add(',ESTOQUE_LOJA.*,ES_CBAR,ES_CEAN,ES_PVE1,ES_PVE2');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA,ESTOQUE                        ');
    qEstoque.sql.Add ('Where                                              ');
    qEstoque.sql.Add ('      (EL_GRUP=ES_GRUP) AND (EL_SUBG=ES_SUBG) AND  ');
    qEstoque.sql.Add ('      (EL_PROD=ES_PROD) AND (EL_CORE=ES_CORE) AND  ');
    qEstoque.sql.Add ('      (EL_TAMA=ES_TAMA)                            ');
    if porcao_grupo<>'0' then
      qEstoque.sql.Add ('      AND (EL_GRUP='+porcao_grupo+')               ');
    if porcao_subgrupo<>'0' then
      qEstoque.sql.Add ('       AND (EL_SUBG='+porcao_subgrupo+')            ');
    if porcao_produto<>'0' then
      qEstoque.sql.Add ('       AND (EL_PROD='+porcao_produto+')             ');
    if cor<>'-1' then
      qEstoque.sql.Add ('      AND (EL_CORE='+cor+')                       ');
    if Faixa<>'-1' then
      qEstoque.sql.Add ('      AND (EL_TAMA='''+Faixa+''')');
    ind := qestoque.sql.count - 1;

    if loja<>'' then
      qEstoque.sql.Add ('      AND (EL_LOJA='+loja+')                       ')
    else
    begin
      if not frm_principal.x_consestoqloja then
        qEstoque.sql.Add ('      AND (EL_LOJA<>'+floattostr(frm_principal.x_loja)+')')
      else
      begin
        qEstoque.sql.Add ('      AND (EL_LOJA='+floattostr(frm_principal.x_loja)+')');
        qEstoque.sql.Add (' UNION ALL ');
        qEstoque.sql.Add ('Select cast(2 as Integer) as Ind');
        for i:=1 to ind do
          qEstoque.sql.add(Qestoque.Sql[i]);
        qEstoque.sql.Add ('      AND (EL_LOJA<>'+floattostr(frm_principal.x_loja)+')');
      end; 
    end;
    qEstoque.sql.Add ('Order by 1,EL_LOJA,EL_GRUP,EL_SUBG,EL_PROD,EL_CORE,EL_OTAM ');
    qEstoque.open;
  end
  else
  if (edtFaixaTam.enabled) then
    edtFaixaTam.setfocus
  else
  if (edtCor.enabled) then
    edtCor.setfocus
  else
    edtLoja.setfocus;
  pnForn.caption := ' '+ProcuraNomeForn(BuscaFornecedor(strtofloat(porcao_grupo),strtofloat(porcao_subgrupo),strtofloat(porcao_produto)),self);
  AjustaLista;
  PageControl1.activepageindex:=0;
  if TWinControl(sender).Owner = Self  then
    try
      grade.setfocus;
    except
    end;
end;


procedure TFrm_ConsProdutosEstoque.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo,subgrupo: String;
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtCodigoExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus;
  end;
  if (key=K_CIMA) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    consprodutos{         if (Trim(edtGrupo.text)<>'') then
         begin
              grupo    := Trim(edtGrupo.text);
              subgrupo := Trim(edtSubGrupo.text);
              ChamandoF8Produtos_2(edtCodigo,strtofloat(grupo),strtofloat(subgrupo),true);
         end;};
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do produto: Formato: 9999',5);
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
end;



procedure TFrm_ConsProdutosEstoque.FormCreate(Sender: TObject);
begin
  lblstatus.caption      := iifs(frm_principal.x_online,'[On-Line]','[Off-Line]');
  QEstoque.DataBaseName  := DataBaseProdutos;
  QLojas.DataBaseName    := DataBaseProdutos;
  QCores.DataBaseName    := DataBaseProdutos;
  QFaixas.DataBaseName   := DataBaseProdutos;
  QGrade.DataBaseName    := DataBaseProdutos;
  Query1.DataBaseName    := DataBaseProdutos;


  BotaoVerClicado:=1;
  btnVer1.font.color:=clBlue;
  btnVer5.font.color:=clBlack;
  jaClicou:=false;
  n_loja:=0;
  n_grupo:=0;
  n_subgrupo:=0;
  n_produto:=0;
  n_cor:=-1;
  n_tam:='-1';
  n_cor_unica:=false;
  n_tam_unico:=false;
  tipz:='3';
  indArqTemp:=1;
  AjustaLista;
  nome_arquivo_temp:='';

     {* Posicionando a forma de localizacao do produto *}
  grade.columns[1].visible := false;
  grade.columns[2].visible := false;
  grade.columns[3].visible := false;
  pnLocal1.visible := false;
  pnLocal1.left    := 37;
  pnLocal2.visible := false;
  pnLocal2.left    := 37;
  pnLocal3.visible := false;
  pnLocal3.left    := 37;
  n_ordem_f7 :=1;
  if (frm_principal.x_ordem_codigo=1) then
  begin
    pnLocal1.visible := true;
    grade.columns[1].visible := true;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
  begin
    pnLocal2.visible := true;
    grade.columns[2].visible := true;
  end
  else
  if (RetornaApelidoEmpresa<>'VARADERO') then
    if (frm_principal.x_ordem_reffabric=1) then
    begin
      pnLocal3.visible := true;
      grade.columns[3].visible := true;
    end;
end;

procedure TFrm_ConsProdutosEstoque.edtLojaChange(Sender: TObject);
begin
  if (Trim(edtLoja.text)<>'') then
    n_loja := strtofloat(Trim(edtLoja.text))
  else
    n_loja :=0;
end;

procedure TFrm_ConsProdutosEstoque.edtLojaDblClick(Sender: TObject);
begin
  EdtLoja.Text := ChamandoF8Lojas;
end;

procedure TFrm_ConsProdutosEstoque.edtLojaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8.caption:='F8->';
  lbF8Mens.caption:='exibe lojas cadastradas';
  lbF8Mens.visible:=true;
end;

procedure TFrm_ConsProdutosEstoque.edtLojaExit(Sender: TObject);
var
  codigo:String;
begin

  if not frm_principal.x_consestoqloja and
    (StrtofloatN(EdtLoja.Text) = Frm_Principal.x_loja)then
  begin
    EdtLoja.SetFocus;
    frmDialogo.ExibirMensagem ('Loja configurada para o vendas não pode ser igual a loja informada para faixa'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    exit;
  end;
  codigo:=Trim(edtLoja.text);
  if (codigo<>'') then
  begin
    pnLoja.caption:=ProcuraNomeLoja(strtofloat(codigo),self);
    edtLoja.text:=form_nz(strtofloat(codigo),2);
  end
  else
    pnLoja.caption:='';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure TFrm_ConsProdutosEstoque.edtLojaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocaCodigoLocal1;
  if (key=K_ESC) then
    close;
  if (key=K_F8) then
    EdtLoja.Text := ChamandoF8Lojas;
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure TFrm_ConsProdutosEstoque.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure TFrm_ConsProdutosEstoque.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8.caption:='F8->';
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure TFrm_ConsProdutosEstoque.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure TFrm_ConsProdutosEstoque.edtGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 99; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
  if (key=K_ESC) then
    close;
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure TFrm_ConsProdutosEstoque.edtSubGrupoDblClick(Sender: TObject);
var
  grupo:Double;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure TFrm_ConsProdutosEstoque.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8.caption:='F8->';
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure TFrm_ConsProdutosEstoque.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure TFrm_ConsProdutosEstoque.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo:Double;  
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
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 99; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
  if (key=K_ESC) then
    close;
  if (key=K_F2) then
    if (qEstoque.active) and (PageControl1.activepageindex=0) then
      grade.setfocus
    else
      grade2.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure TFrm_ConsProdutosEstoque.edtCodigoDblClick(Sender: TObject);
var
  grupo:Double;
  subgrupo:Double;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    subgrupo:=strtofloat(Trim(edtSubGrupo.text));
    ChamandoF8Produtos_2(edtCodigo,grupo,subgrupo,true);
  end;
end;

procedure TFrm_ConsProdutosEstoque.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8.caption:='F8->';
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure TFrm_ConsProdutosEstoque.edtCodigoExit(Sender: TObject);
var
  clProd: TClassAuxiliar;
  grupo,subgrupo,codigo: String;
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;

     {...}
  grupo    := Trim(edtGrupo.text);
  subgrupo := Trim(edtSubGrupo.text);
  codigo   := Trim(edtCodigo.text);
  if (grupo<>'') and (subgrupo<>'') and (codigo<>'') then
    with (clProd) do
    begin
      clProd := TClassAuxiliar.Create;
      conect (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_UNID,PR_REFF,PR_REFI,   ');
      AddParam ('       PR_FORN                                            ');
      AddParam ('From   PRODUTOS                                           ');
      AddParam ('Where (PR_SUBG='+subgrupo+') AND                          ');
      AddParam ('      (PR_GRUP='+grupo+') AND                             ');
      AddParam ('      (PR_CODI='+codigo+')                                ');
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

                {*** sugerindo a ref. fabricante}
        edtRefInt.text    := Trim(Result('PR_REFI'));
        edtRefFab.text    := Trim(Result('PR_REFF'));
        edtForn.text      := form_nz(Result('PR_FORN'),6);
        pnUnidade.caption := Trim(Result('PR_UNID'));
      end
      else
      begin
        edtRefInt.text    := '';
        edtRefFab.text    := '';
        edtForn.text      := '';
        pnProduto.caption:='<Produto nao encontrado>';
      end;
      frm_principal.BarraDicas.caption:='';
      edtGrupo.text    := form_nz (StrToFloat(grupo),2);
      edtSubGrupo.text := form_nz (StrToFloat(subgrupo),2);
      edtCodigo.text   := form_nz(StrToFloat(codigo),4);
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaeditVerde(edtCor);
        pnCor.caption:='Cor única';
      end
      else
      if (Modo=0) or (Modo=1) then
      begin
        edtCor.text:='';
        habilitaeditVerde(edtCor);
      end;
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
      if (Modo=0) or (Modo=1) then
      begin
        edtFaixaTam.text:='';
        habilitaeditVerde(edtFaixaTam);
      end;
      if (n_cor_unica) and (n_tam_unico) then
        btnLocalizarClick(Sender);
    end;
end;

procedure Tfrm_ConsProdutosEstoque.AjustaLista;
begin
  if (tipz='1') then
  begin
    grade.Columns[8].Title.Caption := 'Qtde';
    grade.Columns[8].FieldName     := 'FQTD1';
    grade.Columns[9].FieldName     := 'pprinc1';
    grade.Columns[10].FieldName    := 'pdif1';
    grade.Columns[11].FieldName    := 'ppromocional1';
    grade.Columns[12].FieldName    := 'pvigente1';
  end
  else
  if (tipz='2') then
  begin
    grade.Columns[8].Title.Caption := 'Qtde 02';
    grade.Columns[8].FieldName     := 'EL_QTD2';
    grade.Columns[9].FieldName     := 'pprinc2';
    grade.Columns[10].FieldName    := 'pdif2';
    grade.Columns[11].FieldName    := 'ppromocional2';
    grade.Columns[12].FieldName    := 'pvigente2';
  end
  else
  if (tipz='3') then
  begin
    grade.Columns[8].Title.Caption := 'Qtde(+)';
    grade.Columns[8].FieldName     := 'fEL_QTD3';
    grade.Columns[9].FieldName     := 'pprinc1';
    grade.Columns[10].FieldName    := 'pdif1';
    grade.Columns[11].FieldName    := 'ppromocional1';
    grade.Columns[12].FieldName    := 'pvigente1';
  end;
end;

procedure Tfrm_ConsProdutosEstoque.ConsProdutos;
var
  ftit:String;
begin
  query1.sql.clear;
  query1.sql.add('Select Pr_grup as Grupo,Pr_Subg as SubGrupo,Pr_Codi as Codigo,Pr_refi,Pr_Reff');
  Query1.sql.add(',Pr_Desc as Descricao from produtos');
  if ActiveControl = EdtCodigo then
  begin
    query1.Sql.Add('Where Pr_grup = '+FloatToStr(N_Grupo));
    query1.Sql.Add('and   Pr_Subg = '+FloatToStr(n_subgrupo));
  end
  else
  if ActiveControl = EdtRefFab then
    query1.Sql.Add('Where Pr_Forn = '+FloatToStr(N_forn));
  Query1.open;

  Query1.FieldByName('Grupo').DisplayWidth := 2;
  Query1.FieldByName('SubGrupo').DisplayWidth := 2;
  Query1.FieldByName('Codigo').DisplayWidth := 4;
  Query1.FieldByName('Pr_refi').DisplayLabel := 'Ref.Int';
  Query1.FieldByName('Pr_reff').DisplayLabel := 'Ref. Fabric.';
  Query1.FieldByName('Descricao').DisplayLabel := 'Descrição';

  if ActiveControl = EdtCodigo then
  begin
    ftit := 'Procurar Produtos de um Grupo e de um Subgrupo';
    FfocusgradeGridCons := true;
  end
  else
  if ActiveControl = EdtRefFab then
    ftit := 'Procurar Produtos de um Fornecedor'
  else
    ftit := 'Consultar Produtos';

  try
    if Fgridcons(Query1,Ftit,false,-1,true,true,'Descricao,Pr_Refi,Pr_Reff') then
      if ActiveControl = EdtCodigo then
        EdtCodigo.Text := Query1.FieldByname('Codigo').AsString
      else
      if ActiveControl = EdtRefFab then
        EdtRefFab.Text := Query1.FieldByname('Pr_Reff').AsString
      else
      if ActiveControl = EdtRefInt then
        EdtRefint.Text := Query1.FieldByname('Pr_Refi').AsString;
  finally
    FfocusgradeGridCons := false;
  end;
end;


procedure TFrm_ConsProdutosEstoque.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_ConsProdutosEstoque.btnMudarLojaClick(Sender: TObject);
begin
  edtLoja.text   := '';
  pnLoja.caption := '';
  edtLoja.setfocus;
end;

procedure TFrm_ConsProdutosEstoque.btnMudarProdutoClick(Sender: TObject);
begin
  if (Modo=1) then
  begin
    edtGrupo.text:='';
    edtSubGrupo.text:='';
    edtCodigo.text:='';
    edtRefInt.text:='';
    edtRefFab.text:='';
    edtForn.text:='';
    pnProduto.caption:='';
    pnUnidade.caption:='';
  end;
  habilitaeditVerde(edtCor);
  habilitaeditVerde(edtFaixaTam);
  Memo3.lines.clear;
  edtCor.text:='';
  pnCor.caption:='';
  edtFaixaTam.text:='';
  qEstoque.close;
  qGrade.close;
  FocaCodigoLocal1;
end;

procedure TFrm_ConsProdutosEstoque.btnExibirCodBarrasClick(
  Sender: TObject);
begin
  if (grade.columns[4].visible) then
  begin
    if (grade.columns[4].FieldName='ES_CEAN') then
    begin
      grade.columns[4].visible:=false;
      btnExibirCodBarras.caption:='Exibir Cod. Barras >>>>';
    end
    else
    if (grade.columns[4].FieldName='ES_CBAR') then
    begin
      grade.columns[4].title.caption:='EAN13';
      grade.columns[4].FieldName:='ES_CEAN';
      btnExibirCodBarras.caption:='Ocultar EAN13 >>>>';
    end;
  end
  else
  begin
    grade.columns[4].title.caption:='Cod. Barras';
    grade.columns[4].FieldName:='ES_CBAR';
    grade.columns[4].visible:=true;
    btnExibirCodBarras.caption:='Exibir EAN13 >>>>';
  end;
end;

procedure TFrm_ConsProdutosEstoque.btnDadosProdutoClick(Sender: TObject);
begin
  if (n_grupo<>0) and (n_subgrupo<>0) and (n_produto<>0) then
  begin
    Application.CreateForm(Tfrm_VerProdutos, frm_VerProdutos);
    frm_VerProdutos.y_grupo    := n_grupo;
    frm_VerProdutos.y_subgrupo := n_subgrupo;
    frm_VerProdutos.y_produto  := n_produto;
    frm_VerProdutos.showmodal;
    frm_VerProdutos.Free;
  end;
end;

procedure Tfrm_ConsProdutosEstoque.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus
  else
  if (pnLocal3.visible) then
    edtRefFab.setfocus;
end;

function Tfrm_ConsProdutosEstoque.BuscaFornecedor(grupo,subgrupo,produto: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PR_FORN FROM PRODUTOS          ');
  clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND            ');
  clAux.AddParam ('      (PR_SUBG=:subgrupo) AND         ');
  clAux.AddParam ('      (PR_CODI=:produto)              ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  if (clAux.Execute) then
    result := clAux.result('PR_FORN')
  else
    result := 0;
  clAux.desconect;
  clAux.Free;
end;


procedure TFrm_ConsProdutosEstoque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = Vk_Escape) and (Self.Activecontrol <> Grade) then
    close;
  if (shift=[ssCtrl]) then
    if key = 74 then
      edtloja.setfocus
    else
    if key = 85 then
    begin
      if edtcodigo.canfocus then
        edtcodigo.setfocus
      else
      if edtrefint.canfocus then
        edtrefint.setfocus
      else
      if edtreffab.canfocus then
        edtreffab.setfocus
    end
    else
    if key = 67 then
      edtcor.setfocus
    else
    if key = 84 then
      edtfaixatam.setfocus
    else
    if (key = 70) and btnEditarMovimento.enabled and btnEditarMovimento.visible then
      btnEditarMovimento.OnClick(btnEditarMovimento)
    else
    if (key = Vk_F2) and (Self.Activecontrol <> grade) then
      grade.setfocus;


  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
        tipz:='2'
      else
      if (tipz='2') then
        tipz:='3'
      else
      if (tipz='3') then
        tipz:='1';

      mostra_mensagem('Reajustando grade de itens!');
      AjustaLista;
      AjustaGrade;
      esconde_mensagem;
      if (PageControl1.activepageindex=0) then
        grade.setfocus
      else
        grade2.setfocus;
    end;
end;

procedure TFrm_ConsProdutosEstoque.qEstoqueCalcFields(DataSet: TDataSet);
var
  clProd,clTabela: TClassAuxiliar;
begin
  with (qEstoque) do
  begin
    fieldbyname('FQTD1').AsFloat := fieldbyname('EL_QTD1').AsFloat;
    if (databaseprodutos <> 'ESTOQUE') and
      (fieldbyname('EL_LOJA').Asfloat = frm_principal.x_loja) then
    begin

      fieldbyname('FQTD1').AsFloat := fieldbyname('FQTD1').AsFloat -
        retornadifestoque('ITENS_VENDAS','IV_QTDE','IV',fieldbyname('EL_UVEN').AsDateTime,QEstoque);
      fieldbyname('FQTD1').AsFloat := fieldbyname('FQTD1').AsFloat -
        retornadifestoque('ITENS_TRANSF_LOJA','IT_QTDS - IT_QTDE','IT',fieldbyname('EL_UTRF').AsDateTime,QEstoque);
      fieldbyname('FQTD1').AsFloat := fieldbyname('FQTD1').AsFloat -
        retornadifestoque('ITENS_VALES_MERCADORIAS','IV_QTDE','IV',fieldbyname('EL_UVLM').AsDateTime,QEstoque);

    end;



    if (fieldbyname('fEL_QTD3').IsNull) then
      fieldbyname('fEL_QTD3').AsFloat:=
        fieldbyname('FQTD1').AsFloat + fieldbyname('EL_QTD2').AsFloat;
    if (fieldbyname('loja').IsNull) then
      fieldbyname('loja').AsString:=ProcuraNomeLoja(
        fieldbyname('EL_LOJA').AsFloat,self);
    if (fieldbyname('cor').IsNull) then
      if (fieldbyname('EL_CORE').AsString='0') then
        fieldbyname('cor').AsString:='UNICA'
      else
        fieldbyname('cor').AsString:=ProcuraAbrevCor(
          fieldbyname('EL_CORE').AsFloat,self);
          {****************************************************************************}
    if (fieldbyname('pprinc1').IsNull) then
      fieldbyname('pprinc1').AsString := form_nc(fieldbyname('ES_PVE1').AsFloat,10);
    if (fieldbyname('pprinc2').IsNull) then
      fieldbyname('pprinc2').AsString := form_nc(fieldbyname('ES_PVE2').AsFloat,10);
    if (fieldbyname('pdif1').IsNull) or
      (fieldbyname('pdif2').IsNull) then
    begin
      clTabela := TClassAuxiliar.Create;
      clTabela.conect   (DataBaseprodutos,self);
      clTabela.ClearSql;
      clTabela.AddParam ('Select IP_PRE1,IP_PRE2                                                    ');
      clTabela.AddParam ('From   ITENS_TABELAS_PRECOS                                               ');
      clTabela.AddParam ('Where (IP_LOJA='+fieldbyname('EL_LOJA').AsString+') AND                   ');
      clTabela.AddParam ('      (IP_GRUP='+fieldbyname('EL_GRUP').AsString+') AND                   ');
      clTabela.AddParam ('      (IP_SUBG='+fieldbyname('EL_SUBG').AsString+') AND                   ');
      clTabela.AddParam ('      (IP_PROD='+fieldbyname('EL_PROD').AsString+') AND                   ');
      clTabela.AddParam ('      (IP_CORE='+fieldbyname('EL_CORE').AsString+') AND                   ');
      clTabela.AddParam ('      (IP_TAMA='+chr(39)+fieldbyname('EL_TAMA').AsString+chr(39)+') AND   ');
      clTabela.AddParam ('      (IP_TABE=1)                                                         ');
      if (clTabela.Execute) then
      begin
        fieldbyname('pdif1').AsString := iifs(cltabela.result('Ip_Pre1') <= 0,'    -     ',form_nc(clTabela.Result('IP_PRE1'),10));
        fieldbyname('pdif2').AsString := iifs(cltabela.result('Ip_Pre2') <= 0,'    -     ',form_nc(clTabela.Result('IP_PRE2'),10));
      end
      else
      begin
        fieldbyname('pdif1').AsString := '    -     ';
        fieldbyname('pdif2').AsString := '    -     ';
      end;
      clTabela.desconect;
      clTabela.Free;
               {****************************************************************************}
    end;
    if (fieldbyname('ppromocional1').IsNull) or
      (fieldbyname('ppromocional2').IsNull) then
    begin
               {****************************************************************************}
      clTabela := TClassAuxiliar.Create;
      clTabela.conect   (DataBaseprodutos,self);
      clTabela.ClearSql;
      clTabela.AddParam ('Select PP_PRE1,PP_PRE2                                                        ');
      clTabela.AddParam ('From  PRECOS_PROMOCIONAIS                                                             ');
      clTabela.AddParam ('Where (PP_LOJA='+fieldbyname('EL_LOJA').AsString+') AND                               ');
      clTabela.AddParam ('      (PP_GRUP='+fieldbyname('EL_GRUP').AsString+') AND                               ');
      clTabela.AddParam ('      (PP_SUBG='+fieldbyname('EL_SUBG').AsString+') AND                               ');
      clTabela.AddParam ('      (PP_PROD='+fieldbyname('EL_PROD').AsString+') AND                               ');
      clTabela.AddParam ('      (PP_CORE='+fieldbyname('EL_CORE').AsString+') AND                               ');
      clTabela.AddParam ('      (PP_TAMA='+chr(39)+fieldbyname('EL_TAMA').AsString+chr(39)+') AND               ');
      clTabela.AddParam ('      (PP_DAT1<='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+') AND   ');
      clTabela.AddParam ('      (PP_DAT2>='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+')       ');
      clTabela.AddParam ('Order by PP_DAT2                                                                      ');
      if (clTabela.Execute) then
      begin
        clTabela.last; {//pegando a ultima tabela, caso haja mais de uma}
        fieldbyname('ppromocional1').AsString := form_nc(clTabela.Result('PP_PRE1'),10);
        fieldbyname('ppromocional2').AsString := form_nc(clTabela.Result('PP_PRE2'),10);
      end
      else
      begin
        fieldbyname('ppromocional1').AsString := '    -     ';
        fieldbyname('ppromocional2').AsString := '    -     ';
      end;
      clTabela.desconect;
      clTabela.Free;
               {****************************************************************************}
    end;
          {****************************************************************************}
    if (fieldbyname('pvigente1').IsNull) then
      if (trim(fieldbyname('ppromocional1').AsString)<>'-') then
        fieldbyname('pvigente1').AsString := fieldbyname('ppromocional1').AsString
      else
      if (trim(fieldbyname('pdif1').AsString)<>'-') then
        fieldbyname('pvigente1').AsString := fieldbyname('pdif1').AsString
      else
        fieldbyname('pvigente1').AsString := fieldbyname('pprinc1').AsString;
    if (fieldbyname('pvigente2').IsNull) then
      if (trim(fieldbyname('ppromocional2').AsString)<>'-') then
        fieldbyname('pvigente2').AsString := fieldbyname('ppromocional2').AsString
      else
      if (trim(fieldbyname('pdif2').AsString)<>'-') then
        fieldbyname('pvigente2').AsString := fieldbyname('pdif2').AsString
      else
        fieldbyname('pvigente2').AsString := fieldbyname('pprinc2').AsString;
          {****************************************************************************}

    if (fieldbyname('pcusto1').IsNull) then
      fieldbyname('pcusto1').AsString:=form_nc(fieldbyname('EL_PCU1').AsFloat,15);
    if (fieldbyname('pcusto2').IsNull) then
      fieldbyname('pcusto2').AsString:=form_nc(fieldbyname('EL_PCU2').AsFloat,15);
    if (fieldbyname('cTam').IsNull) then
      if (fieldbyname('EL_TAMA').AsString='0') then
        fieldbyname('cTam').AsString:='UNICO'
      else
        fieldbyname('cTam').AsString:=fieldbyname('EL_TAMA').AsString;
    if (fieldbyname('cCodigo').IsNull) then
      fieldbyname('cCodigo').AsString :=
        form_nz(fieldbyname('EL_GRUP').AsFloat,2)+
        form_nz(fieldbyname('EL_SUBG').AsFloat,2)+
        form_nz(fieldbyname('EL_PROD').AsFloat,4);
    if (fieldbyname('cUnidade').IsNull) then
    begin
               {****************************************************************************}
      clProd   := TClassAuxiliar.Create;
      clProd.conect   (DataBaseprodutos,self);
      clProd.ClearSql;
      clProd.AddParam ('Select PR_DESC,PR_REFI,PR_UNID,PR_REFF                      ');
      clProd.AddParam ('From   PRODUTOS                                             ');
      clProd.AddParam ('Where (PR_GRUP='+fieldbyname('EL_GRUP').AsString+') AND     ');
      clProd.AddParam ('      (PR_SUBG='+fieldbyname('EL_SUBG').AsString+') AND     ');
      clProd.AddParam ('      (PR_CODI='+fieldbyname('EL_PROD').AsString+')         ');
      clProd.Execute;
      fieldbyname('cDesc').AsString    := clProd.result('PR_DESC');
      fieldbyname('cRefi').AsString    := clProd.result('PR_REFI');
      fieldbyname('cUnidade').AsString := clProd.result('PR_UNID');
      fieldbyname('cReffab').AsString  := clProd.result('PR_REFF');
      clProd.desconect;
      clProd.Free;
               {****************************************************************************}
    end;
  end;
end;

procedure TFrm_ConsProdutosEstoque.gradeDblClick(Sender: TObject);
begin
  btnDadosProduto.OnClick(Sender);
end;

procedure TFrm_ConsProdutosEstoque.gradeEnter(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8.caption:='';
  lbF8Mens.caption:='ENTER-> ver item';
  lbF8Mens.visible:=false;
end;

procedure TFrm_ConsProdutosEstoque.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_ENTER) then
    btnDadosProduto.OnClick(Sender);
  if (key=K_ESC) then
    Limpacad;
end;

procedure TFrm_ConsProdutosEstoque.limpacad;
begin
  habilitaeditVerde(edtCor);
  habilitaeditVerde(edtFaixaTam);
  qEstoque.close;
  qGrade.close;
  LimparEdits;
  PageControl1.activepageindex:=0;
  edtLoja.setfocus;
end;

procedure Tfrm_ConsProdutosEstoque.LimparEdits;
begin
  if (Modo=1) then
  begin
    edtGrupo.text      :='';
    edtSubGrupo.text   :='';
    edtCodigo.text     :='';
    edtRefInt.text     :='';
    edtForn.text       :='';
    edtRefFab.text     :='';
    pnProduto.caption  :='';
    pnUnidade.caption  :='';
  end;
  if (Modo=0) or (Modo=1) then
  begin
    if (edtCor.enabled) then
    begin
      edtCor.text   :='';
      pnCor.caption :='';
    end;
    if (edtFaixaTam.enabled) then
      edtFaixaTam.text := '';
  end;
  pnForn.caption:='';
  Memo3.lines.clear;
  pnQtdeTotal.caption := '';
end;


procedure TFrm_ConsProdutosEstoque.btnExibirTodosPrecosClick(
  Sender: TObject);
begin
  if (grade.columns[11].visible) then
  begin
    grade.columns[9].visible  := false;
    grade.columns[10].visible := false;
    grade.columns[11].visible := false;
    btnExibirTodosPrecos.caption:='Exibir todos os preços >>>>';
    grade.columns[5].visible  := true;
  end
  else
  begin
    grade.columns[9].visible  := true;
    grade.columns[10].visible := true;
    grade.columns[11].visible := true;
    btnExibirTodosPrecos.caption:='Ocultar todos os preços >>>>';
    grade.columns[5].visible  := false;
  end;
end;

procedure TFrm_ConsProdutosEstoque.AjustaGrade;
var
  clAux,clTabela: TClassAuxiliar;
  vTotal1: array[1..100] of Integer;
  vTotal2: array[1..100] of Integer;
  vTotal3: array[1..100] of Real;
  vTotal4: array[1..100] of Real;
  qtdecampo,tamCol,indFaixa,indCor,total_geral,i: Integer;
  porcao_produto,porcao_loja: String;
  porcao_grupo,porcao_subgrupo: String;
  porcao_cor,porcao_tamanho: String;
  linha: String;
  preco_venda,total_geral2: Real;
  MemoProdutos: TStringList;
  FQtd:Real;
begin
  if (n_grupo<>0) and (n_subgrupo<>0) and (n_produto<>0) then
  begin
         //DESTROINDO TABELA TEMPORARIA, CASO TENHA SIDO CRIADA
    if (indArqTemp<>0) then
    begin
      i:=1;
      while (i<=indArqTemp) do
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   (DataBaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('DROP TABLE TEMP_CONSULTA_ESTOQUE_LOJA_'+inttostr(i));
        try
          clAux.Execute; {*}
        except
          break;
        end;
        clAux.desconect;
        clAux.Free;
        i:=i+1;
      end;
    end;

         {...}
    MemoProdutos := TStringList.Create;
    with (qLojas) do
    begin
      close;
      filtered := false;
      parambyname('grupo').AsFloat    := n_grupo;
      parambyname('subgrupo').AsFloat := n_subgrupo;
      parambyname('produto').AsFloat  := n_produto;
      open;
      if (n_loja<>0) then
      begin
        filter   := '(EL_LOJA='+floattostr(n_loja)+')';
        filtered := true;
      end;
    end;
    with (qCores) do
    begin
      close;
      filtered := false;
      parambyname('grupo').AsFloat    := n_grupo;
      parambyname('subgrupo').AsFloat := n_subgrupo;
      parambyname('produto').AsFloat  := n_produto;
      open;
      if (n_cor<>-1) then
      begin
        filter   := '(EL_CORE='+floattostr(n_cor)+')';
        filtered := true;
      end;
    end;
    porcao_grupo    := floattostr(n_grupo);
    porcao_subgrupo := floattostr(n_subgrupo);
    porcao_produto  := floattostr(n_produto);
    if (porcao_grupo<>'') and (porcao_subgrupo<>'') and (porcao_produto<>'') then
    begin
      qFaixas.close;
      qFaixas.Sql.Clear;
      qFaixas.Sql.Add ('SELECT DISTINCT ES_TAMA as IT_TAMA,ES_OTAM   ');
      qFaixas.Sql.Add ('FROM   ESTOQUE                               ');
      qFaixas.Sql.Add ('WHERE (ES_GRUP=:grupo) AND                   ');
      qFaixas.Sql.Add ('      (ES_SUBG=:subgrupo) AND                ');
      qFaixas.Sql.Add ('      (ES_PROD=:produto)                     ');
      if (n_tam<>'-1') then
      begin
        qFaixas.filter   := '(IT_TAMA='+chr(39)+n_tam+chr(39)+')';
        qFaixas.filtered := true;
      end;
      qFaixas.Sql.Add ('ORDER BY ES_OTAM                             ');
      qFaixas.parambyname('grupo').AsFloat    := strtofloat(porcao_grupo);
      qFaixas.parambyname('subgrupo').AsFloat := strtofloat(porcao_subgrupo);
      qFaixas.parambyname('produto').AsFloat  := strtofloat(porcao_produto);
      qFaixas.open;

              //CRIANDO TABELA TEMPORARIA PARA O ACUMULADO DO DIA
      clAux := TClassAuxiliar.Create;
      clAux.conect   (DataBaseprodutos,self);
      indArqTemp:=1;
      while (true) do
        try
          nome_arquivo_temp := 'TEMP_CONSULTA_ESTOQUE_LOJA_'+inttostr(indArqTemp);

                     //...
          clAux.ClearSql;
          clAux.AddParam ('CREATE TABLE TEMP_CONSULTA_ESTOQUE_LOJA_'+inttostr(indArqTemp)+' (');
          clAux.AddParam ('  TIPO INTEGER,                                                   ');
          clAux.AddParam ('  CORES VARCHAR(20),                                              ');
          clAux.AddParam ('  LOJA VARCHAR(2)                                                 ');
          indcoltabgrade:=1;
          while (indcoltabgrade<=qFaixas.recordcount) do
          begin
            clAux.AddParam ('  ,COLUNA'+form_nz(indcoltabgrade,2)+' VARCHAR(10)  ');
            indcoltabgrade:=indcoltabgrade+1;
          end;
          qtdecampo := indcoltabgrade + 2;
          clAux.AddParam (') ');
          clAux.Execute;
          break;
        except
          indArqTemp := indArqTemp + 1;
        end;
      clAux.desconect;
      clAux.Free;

      CriaTabelaGrade; {*}
      indcoltabgrade := 0;

              {...}
      memoProdutos.clear;
      qFaixas.first;
      linha:='';
      PreencheColunaTabelaGrade('LOJA','    COR / TAM '); {*}
      indFaixa:=1;
      while (not qFaixas.eof) do
      begin
        if (BotaoVerClicado=1) then
        begin
          if (qFaixas.fieldbyname('IT_TAMA').AsString='0') then
          begin
            linha:=linha+form_t('UNICO',5)+'  ';
            PreencheColunaTabelaGrade('LJ',form_t('UNICO',5));
          end
          else
          begin
            linha:=linha+form_t(qFaixas.fieldbyname('IT_TAMA').AsString,5)+'  ';
            PreencheColunaTabelaGrade('LJ',form_t(qFaixas.fieldbyname('IT_TAMA').AsString,5));
          end;
        end
        else
        if (qFaixas.fieldbyname('IT_TAMA').AsString='0') then
        begin
          linha:=linha+form_t('UNICO',6)+'  ';
          PreencheColunaTabelaGrade('LJ',form_t('UNICO',6));
        end
        else
        begin
          linha:=linha+form_t(qFaixas.fieldbyname('IT_TAMA').AsString,6)+'  ';
          PreencheColunaTabelaGrade('LJ',form_t(qFaixas.fieldbyname('IT_TAMA').AsString,6));
        end;
        vTotal1[indFaixa]:=0;
        indFaixa:=indFaixa+1;
        qFaixas.next;
      end;
      if (BotaoVerClicado=1) then
      begin
        tamCol := (7*(indFaixa-1))+24;
        if (tipz='1') then
          memoProdutos.Add (' -- Grade: Qtde')
        else
        if (tipz='2') then
          memoProdutos.Add (' -- Grade de itens do produto -- Qtde 02')
        else
        if (tipz='3') then
          memoProdutos.Add (' -- Grade de itens do produto -- Qtde(+)');
      end
      else
      begin
        tamCol := (8*(indFaixa-1))+24;
        if (tipz='1') then
          memoProdutos.Add (' -- Grade: P.Venda Atual')
        else
        if (tipz='2') then
          memoProdutos.Add (' -- Grade: P.Venda Atual 02')
        else
        if (tipz='3') then
          memoProdutos.Add (' -- Grade: P.Venda Atual (+)');
      end;
      memoProdutos.Add (' '+form_tc2('-',tamCol,'-'));
      if (BotaoVerClicado=1) then
        memoProdutos.Add (' '+' COR       |  '+linha+'  | TOTAL')
      else
        memoProdutos.Add (' '+' COR       |  '+linha+'  | ');
      if (n_loja<>0) then
        memoProdutos.Add (' '+form_tc2('-',tamCol,'-'));

      InsereLinhaTabelaGrade; {*}

              //Laco de exibicao por loja
              //*****************************************************************************
      qLojas.first;
      while (not qLojas.eof) do
      begin
        porcao_loja := qLojas.fieldbyname('EL_LOJA').AsString; {*}
        if (n_loja=0) then
          memoProdutos.Add (' -----------!-'+form_tc2('[Lj '+form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2)+']',tamCol-13,'-'));

                  {...}
        indCor:=1;
        qCores.disablecontrols;
        qCores.first;
        while (not qCores.eof) do
        begin
          if (vTotal2[indCor]=0) then
          begin
            if (qCores.fieldbyname('EL_CORE').AsFloat<>0) then
              PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                form_t(ProcuraAbrevCor(qCores.fieldbyname('EL_CORE').AsFloat,self),10)) {*}
            else
              PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                ' UNICO'); {*}
          end
          else
          if (qCores.fieldbyname('EL_CORE').AsFloat<>0) then
            PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
              form_t(ProcuraAbrevCor(qCores.fieldbyname('EL_CORE').AsFloat,self),10)) {*}
          else
            PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
              ' UNICO'){*};

          qFaixas.first;
          linha    := '';
          indFaixa := 1;
          vTotal2[indCor]:=0;
          while (not qFaixas.eof) do
          begin
            porcao_cor   := qCores.fieldbyname('EL_CORE').AsString;
            if (qFaixas.fieldbyname('IT_TAMA').AsString='UNICO') then
              porcao_tamanho := '0'
            else
              porcao_tamanho := qFaixas.fieldbyname('IT_TAMA').AsString;

                            {...}
            clAux := TClassAuxiliar.Create;
            clAux.conect   (DataBaseprodutos,self);
            clAux.ClearSql;
            clAux.AddParam ('Select EL_QTD1,EL_QTD2,EL_UVEN,EL_UTRF,EL_UVLM,EL_LOJA,EL_GRUP,EL_SUBG');
            clAux.AddParam ('       ,EL_PROD,EL_CORE,EL_TAMA');
            clAux.AddParam ('From   ESTOQUE_LOJA                                ');
            clAux.AddParam ('Where (EL_GRUP='+porcao_grupo+') AND               ');
            clAux.AddParam ('      (EL_SUBG='+porcao_subgrupo+') AND            ');
            clAux.AddParam ('      (EL_PROD='+porcao_produto+') AND             ');
            clAux.AddParam ('      (EL_LOJA='+porcao_loja+') AND                ');
            clAux.AddParam ('      (EL_CORE='+porcao_cor+') AND                 ');
            clAux.AddParam ('      (EL_TAMA='+chr(39)+porcao_tamanho+chr(39)+') ');
            if (clAux.Execute) then
            begin
              if (tipz='1') or (tipz='2') then
              begin
                if (BotaoVerClicado=1) then
                begin
                  FQtd := clAux.result('EL_QTD'+tipz);
                  FQtd := Fqtd -
                    retornadifestoque('ITENS_VENDAS','IV_QTDE','IV',ClAux.Consulta.fieldbyname('EL_UVEN').AsDateTime,ClAux.Consulta);
                  Fqtd := FQtd -
                    retornadifestoque('ITENS_TRANSF_LOJA','IT_QTDS - IT_QTDE','IT',ClAux.Consulta.fieldbyname('EL_UTRF').AsDateTime,ClAux.Consulta);
                  Fqtd := FQtd -
                    retornadifestoque('ITENS_VALES_MERCADORIAS','IV_QTDE','IV',ClAux.Consulta.FieldByName('EL_UVLM').AsDateTime,ClAux.Consulta);                                                                         

                  linha:=linha+form_n(FQtd,5)+'  ';
                  vTotal1[indFaixa] := vTotal1[indFaixa] + round(FQtd);
                  vTotal2[indCor] := vTotal2[indCor] + round(FQtd);
                  PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                    form_n(FQtd,5));
                end
                else
                begin
                  preco_venda := DevolvePrecoItem(qLojas.fieldbyname('EL_LOJA').AsFloat,
                    n_grupo,n_subgrupo,n_produto,
                    strtofloat(porcao_cor),porcao_tamanho,
                    tipz);
                  linha:=linha+form_nc(preco_venda,6)+'  ';
                  PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                    form_nc(preco_venda,6));
                end;
              end
              else
              if (tipz='3') then
                if (BotaoVerClicado=1) then
                begin
                  linha:=linha+form_n(clAux.result('EL_QTD1')+clAux.result('EL_QTD2'),5)+'  ';
                  vTotal1[indFaixa] := vTotal1[indFaixa] + clAux.result('EL_QTD1')+clAux.result('EL_QTD2');
                  vTotal2[indCor]   := vTotal2[indCor] + clAux.result('EL_QTD1')+clAux.result('EL_QTD2');
                  PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                    form_n(clAux.result('EL_QTD1')+clAux.result('EL_QTD2'),5));
                end
                else
                begin
                  preco_venda := DevolvePrecoItem(clAux.result('EL_LOJA'),
                    clAux.result('EL_GRUP'),
                    clAux.result('EL_SUBG'),
                    clAux.result('EL_PROD'),
                    clAux.result('EL_CORE'),
                    clAux.result('EL_TAMA'),
                    '1');
                  linha:=linha+form_nc(preco_venda,6)+'  ';
                  PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                    form_nc(preco_venda,6));
                end;
            end
            else
            if (BotaoVerClicado=1) then
            begin
              linha:=linha+form_t(' ',5)+'  ';
              vTotal1[indFaixa] := vTotal1[indFaixa] + 0;
              vTotal2[indCor]   := vTotal2[indCor] + 0;
              PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                form_t(' ',5));
            end
            else
            begin
              linha:=linha+form_t(' ',6)+'  ';
              PreencheColunaTabelaGrade(form_nz(qLojas.fieldbyname('EL_LOJA').AsFloat,2),
                form_t(' ',6));
            end;
            clAux.first;
            clAux.desconect;
            clAux.Free;

                            {prox tamanho -->}
            indFaixa := indFaixa + 1;
            qFaixas.next;
          end;
          if (vTotal2[indCor]=0) then
          begin
            if (BotaoVerClicado=1) then
            begin
              if (qCores.fieldbyname('EL_CORE').AsFloat<>0) then
                memoProdutos.Add (' '+form_t(ProcuraAbrevCor(qCores.fieldbyname('EL_CORE').AsFloat,self),10)+
                  ' |  '+linha+'  | '+form_t(' ',5))
              else
                memoProdutos.Add (' UNICO      |  '+linha+'  | '+form_t(' ',5));
            end
            else
            begin
              if (qCores.fieldbyname('EL_CORE').AsFloat<>0) then
                memoProdutos.Add (' '+form_t(ProcuraAbrevCor(qCores.fieldbyname('EL_CORE').AsFloat,self),10)+
                  ' |  '+linha+'  | ')
              else
                memoProdutos.Add (' UNICO      |  '+linha+'  | ');
            end;
          end
          else
          if (BotaoVerClicado=1) then
          begin
            if (qCores.fieldbyname('EL_CORE').AsFloat<>0) then
              memoProdutos.Add (' '+form_t(ProcuraAbrevCor(qCores.fieldbyname('EL_CORE').AsFloat,self),10)+
                ' |  '+linha+'  | '+form_n(vTotal2[indCor],5))
            else
              memoProdutos.Add (' UNICO      |  '+linha+'  | '+form_n(vTotal2[indCor],5));
          end
          else
          if (qCores.fieldbyname('EL_CORE').AsFloat<>0) then
            memoProdutos.Add (' '+form_t(ProcuraAbrevCor(qCores.fieldbyname('EL_CORE').AsFloat,self),10)+
              ' |  '+linha+'  | ')
          else
            memoProdutos.Add (' UNICO      |  '+linha+'  | ');

          InsereLinhaTabelaGrade; {*}

                       {prox cor -->}
          indCor := indCor + 1;
          qCores.next;
        end;
        qCores.enablecontrols;

                  {---->}
        qLojas.next;
      end;

              {Totais-->}
      memoProdutos.Add (' '+form_tc2('-',tamCol,'-'));
      qFaixas.first;
      linha:='';
      indFaixa:=1;
      total_geral:=0;
      while (not qFaixas.eof) do
      begin
        if (BotaoVerClicado=1) then
        begin
          if (vTotal1[indFaixa]=0) then
            linha:=linha+form_t(' ',5)+'  '
          else
            linha:=linha+form_n(vTotal1[indFaixa],5)+'  ';
        end
        else
        if (vTotal1[indFaixa]=0) then
          linha:=linha+form_t(' ',6)+'  '
        else
          linha:=linha+form_n(vTotal1[indFaixa],6)+'  ';
        total_geral:=total_geral+vTotal1[indFaixa];
        indFaixa:=indFaixa+1;
        qFaixas.next;
      end;
      if (BotaoVerClicado=1) then
      begin
        memoProdutos.Add (' '+'TOTAL      |  '+linha+'  | '+form_n(total_geral,5));
        pnQtdeTotal.caption := form_n(total_geral,7);
      end
      else
      begin
        memoProdutos.Add (' '+'TOTAL      |  '+linha+'  | ');
        pnQtdeTotal.caption := '';
      end;

              //******************************************************************************
      qGrade.close;
      qGrade.sql.clear;
      qGrade.sql.Add ('SELECT T.*,Cast(0 as Integer) as Ind FROM '+nome_arquivo_temp+' T ');
      qgrade.sql.add ('Where TIPO = ''1''');
      if frm_principal.x_consestoqloja then
      begin
        qGrade.sql.Add ('Union All');
        qGrade.sql.Add ('SELECT T.*,Cast(1 as Integer) as Ind FROM '+nome_arquivo_temp+' T ');
        qgrade.sql.add ('Where Tipo <> ''1'' and Loja = '''+form_nz(Frm_principal.x_loja,2)+'''');
      end;
      if frm_principal.x_ConsEstoqOutras then
      begin
        qGrade.sql.Add ('Union All');
        qgrade.sql.add ('SELECT T.*,Cast(2 as Integer) FROM '+nome_arquivo_temp+' T ');
        qgrade.sql.add ('Where Tipo <> ''1'' and  Loja <> '''+form_nz(Frm_principal.x_loja,2)+'''');
      end;
      qgrade.sql.add ('Order By '+inttostr(qtdecampo + 1));
      qGrade.open;

      if Grade2.columns.count >= 3 then
      begin
        grade2.columns[2].width      := 50;
        grade2.columns[2].color      := clBlue;
        grade2.columns[2].font.color := clWhite;
      end;

      if Grade2.columns.count >= 2 then
      begin
        grade2.columns[1].width      := 100;
        grade2.columns[1].color      := clBtnFace;
        grade2.columns[1].font.color := clBlack;
      end;

      if Grade2.columns.count >= 1 then
      begin
        grade2.columns[0].visible := false;
        grade2.columns[grade2.columns.count - 1].visible := false;
      end;
              //******************************************************************************

      memo3.lines := memoProdutos;
      memoProdutos.Free;
    end;

    DestroiTabelaGrade; {*}
  end
  else
  begin
    Memo3.lines.clear;
    Memo3.lines.Add('[Não foi definido um produto e/ou uma loja]');
  end;
end;


procedure Tfrm_ConsProdutosEstoque.CriaTabelaGrade;
var
  linha1,linha2: String;
  i: Integer;
begin
  clInsLinTabGrade := TClassAuxiliar.Create;
  clInsLinTabGrade.conect   (databaseprodutos,self);
  clInsLinTabGrade.ClearSql;
  i:=1;
  linha1 := '(TIPO,LOJA,CORES';
  linha2 := '(:TIPO,:LOJA,:CORES';
  while (i<=qFaixas.recordcount) do
  begin
    linha1 := linha1 + ',COLUNA'+form_nz(i,2);
    linha2 := linha2 + ',:COLUNA'+form_nz(i,2);
    i:=i+1;
  end;
  clInsLinTabGrade.AddParam ('INSERT INTO '+nome_arquivo_temp+' '+linha1+') ');
  clInsLinTabGrade.AddParam ('VALUES '+linha2+') ');
end;

procedure Tfrm_ConsProdutosEstoque.PreencheColunaTabelaGrade(loja,coluna: String); {*}
begin
  clInsLinTabGrade.consulta.parambyname('LOJA').AsString := loja; //sempre é ATRIBUIDO
  if (indcoltabgrade=0) then
  begin
    clInsLinTabGrade.consulta.parambyname('CORES').AsString  := coluna;
    if (trim(coluna)='COR / TAM') then
      clInsLinTabGrade.consulta.parambyname('TIPO').AsInteger := 1
    else
      clInsLinTabGrade.consulta.parambyname('TIPO').AsInteger := 0;
  end
  else
    clInsLinTabGrade.consulta.parambyname('COLUNA'+form_nz(indcoltabgrade,2)).AsString := coluna;
  indcoltabgrade := indcoltabgrade + 1;
end;

procedure Tfrm_ConsProdutosEstoque.InsereLinhaTabelaGrade;
begin
  clInsLinTabGrade.Execute;
  indcoltabgrade := 0;
end;

procedure TFrm_ConsProdutosEstoque.btnVer1Click(Sender: TObject);
begin
  BotaoVerClicado:=1;
  btnVer1.font.color:=clBlue;
  btnVer5.font.color:=clBlack;
  AjustaGrade;
end;

procedure TFrm_ConsProdutosEstoque.btnVer5Click(Sender: TObject);
begin
  BotaoVerClicado:=2;
  btnVer1.font.color:=clBlack;
  btnVer5.font.color:=clBlue;
  AjustaGrade;
end;

procedure TFrm_ConsProdutosEstoque.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.activepageindex=0) then
    grade.setfocus
  else
  begin
    if not frm_principal.x_ConsEstoqQtd then
      BotaoVerClicado:=2;
    AjustaGrade;
    grade2.setfocus;
  end;
end;

procedure Tfrm_ConsProdutosEstoque.DestroiTabelaGrade;
begin
  clInsLinTabGrade.desconect;
  clInsLinTabGrade.Free;
end;

procedure TFrm_ConsProdutosEstoque.SpeedButton1Click(Sender: TObject);
begin
  if not pagina2.tabvisible then
    exit;
  PageControl1.activepageindex:=1;
  AjustaGrade;
end;

procedure TFrm_ConsProdutosEstoque.FormDestroy(Sender: TObject);
begin
  Frm_ConsProdutosEstoque := nil;
end;

procedure TFrm_ConsProdutosEstoque.btnEditarMovimentoClick(
  Sender: TObject);
begin
  if not btnEditarMovimento.visible then
    exit;
  frm_BotoesTransf := Tfrm_BotoesTransf.create(Application);
  frm_BotoesTransf.Position := poScreenCenter;
  frm_BotoesTransf.botao3.visible := false;
  frm_BotoesTransf.botao4.visible := false;
  frm_BotoesTransf.Height := frm_BotoesTransf.Height - frm_BotoesTransf.Botao3.Height  - frm_BotoesTransf.Botao4.Height;
  frm_BotoesTransf.showmodal;
  frm_BotoesTransf.destroy;
end;

procedure TFrm_ConsProdutosEstoque.qEstoqueAfterScroll(DataSet: TDataSet);
begin
  LbAtualizado.visible := (databaseprodutos <> 'ESTOQUE') and (qestoque.fieldbyname('EL_LOJA').AsFloat <> frm_principal.X_Loja);
  LbAtualizado.caption :=  'Atualizado em '+FormatDateTime('dd/mm/yyyy hh:nn',qestoque.fieldbyname('EL_TIME').AsDateTime);
end;


function TFrm_ConsProdutosEstoque.retornadifestoque(Tabela,CampoQtde,Abrv:String;hora:Tdatetime;VQuery:TQuery):Real;
var
  FQuery:TQuery;
  fsec:tdatetime;
begin
  fsec := StrtodateTime('00:00:01');
  FQuery := TQuery.create(Application);
  with fquery do
    try
      sql.clear;
      databasename := databaseprodutos;
      sql.add('Select SUM('+CampoQtde+') as campo from '+Tabela);
      if UpperCase(Tabela) = 'ITENS_TRANSF_LOJA' then
      begin
        sql.add('Left Join Transf_Loja on (IT_LOJ1 = TR_LOJ1 and TR_NUME = IT_TRAN)');
        sql.add('Where (TR_Loj2 =:Loja or It_Loj1 =:Loja)');
      end
      else
        sql.add('Where '+Abrv+'_Loja =:Loja');
      sql.add('And     '+Abrv+'_Grup =:Grup');
      sql.add('And     '+Abrv+'_SubG =:SubG');
      sql.add('And     '+Abrv+'_Prod =:Prod');
      sql.add('And     '+Abrv+'_Core =:Core');
      sql.add('And     '+Abrv+'_Tama =:Tama');
      sql.add('And     '+Abrv+'_Hora > :Hora');
      parambyname('Loja').AsFloat    := VQuery.FieldByName('El_Loja').AsFloat;
      parambyname('Grup').AsFloat    := VQuery.FieldByName('El_Grup').AsFloat;
      parambyname('SubG').AsFloat    := VQuery.FieldByName('El_SubG').AsFloat;
      parambyname('Prod').AsFloat    := VQuery.FieldByName('El_Prod').AsFloat;
      parambyname('Core').AsFloat    := VQuery.FieldByName('El_Core').AsFloat;
      parambyname('tama').AsString   := VQuery.FieldByName('El_tama').AssTRING;
      parambyname('hora').Asdatetime := hora + fsec;
//     parambyname('hora').Asdatetime := strtodaten(formatdatetime('dd/mm/yyyy hh:nn',hora));
      open;

      result := fieldbyname('campo').asfloat;
    finally
      destroy;
    end;
end;


end.
