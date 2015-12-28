unit un_edtEstoqueLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Mask, Grids, DBGrids, Db, DBTables;

type
  Tfrm_edtEstoqueLoja = class(TForm)
    gbLoja: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    edtCor: TMaskEdit;
    pnCor: TPanel;
    edtFaixaTam: TMaskEdit;
    Panel3: TPanel;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    pnProduto: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparcadastro1: TMenuItem;
    Imprimirplanos1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Outrasconsultas1: TMenuItem;
    grade: TDBGrid;
    ds1: TDataSource;
    qEstoque: TQuery;
    qEstoqueloja: TStringField;
    qEstoquecor: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    N1: TMenuItem;
    Excluiritem1: TMenuItem;
    Inseriritemdeestoque1: TMenuItem;
    N3: TMenuItem;
    Alterardadosdeumitemdeestoque1: TMenuItem;
    N4: TMenuItem;
    Revisarsaldodoitem1: TMenuItem;
    Todosositens1: TMenuItem;
    Itemselecionado1: TMenuItem;
    Extratodemovimentodoitem1: TMenuItem;
    SpeedButton1: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btnLocalizar: TSpeedButton;
    Veritemdeestoque1: TMenuItem;
    qEstoquecTam: TStringField;
    Bevel3: TBevel;
    btnEntrada: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Lanarentrada1: TMenuItem;
    Lanarsada1: TMenuItem;
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
    qEstoquepvenda2: TStringField;
    qEstoquepcusto2: TStringField;
    Panel1: TPanel;
    Label33: TLabel;
    edtLoja: TMaskEdit;
    pnLoja: TPanel;
    Label8: TLabel;
    Label9: TLabel;
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
    Label3: TLabel;
    pnUnidade: TPanel;
    N5: TMenuItem;
    Editarmovimentodoitem1: TMenuItem;
    btnEditarMovimento: TSpeedButton;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtLojaDblClick(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure qEstoqueCalcFields(DataSet: TDataSet);
    procedure Excluiritem1Click(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure Outrasconsultas1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Inseriritemdeestoque1Click(Sender: TObject);
    procedure Alterardadosdeumitemdeestoque1Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Extratodemovimentodoitem1Click(Sender: TObject);
    procedure Todosositens1Click(Sender: TObject);
    procedure Itemselecionado1Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Veritemdeestoque1Click(Sender: TObject);
    procedure edtLojaChange(Sender: TObject);
    procedure edtCorChange(Sender: TObject);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnEntradaClick(Sender: TObject);
    procedure Lanarentrada1Click(Sender: TObject);
    procedure Lanarsada1Click(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Editarmovimentodoitem1Click(Sender: TObject);
    procedure btnEditarMovimentoClick(Sender: TObject);
  private
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}
    tipz: String;           {indica se estou controlando o dentro/fora}

    {...}
    Modo: Integer;          {0-> modo consulta (para um produto), 1-> uso geral}

    {...}
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure MudaFocoCodigo;
    procedure AjustaGrade;
  end;

var
  frm_edtEstoqueLoja: Tfrm_edtEstoqueLoja;

implementation

uses un_LancarItem, principal, funcoes1, funcoes2, procura, auxiliar,
  unDialogo, un_VerEstoque, un_OutrasSaidas, un_OutrasEntradas,
  un_LancarItemLoja, un_VerEstoqueLoja, un_edtEstoque, produtos,
  un_ListaMovDia, unMensagem, mem_prnt, un_VerMovimentoItemLoja;

{$R *.DFM}

procedure Tfrm_edtEstoqueLoja.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtEstoqueLoja.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtEstoqueLoja.FormActivate(Sender: TObject);
begin
  edtLoja.setfocus;   
end;

procedure Tfrm_edtEstoqueLoja.FocusControle(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  gbLoja.GetTabOrderList(Lista);
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

procedure Tfrm_edtEstoqueLoja.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocaCodigoLocal1;
  if (key=K_ESC) then
    close;
  if (key=K_F8) then
    ChamandoF8Lojas(edtLoja,true);
  if (key=K_F2) then
    if (qEstoque.active) then
      grade.setfocus;
end;

procedure Tfrm_edtEstoqueLoja.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (key=13) then
      btnLocalizar.click;
  if (key=K_ESC) then
    close;
  if (key=38) then
    if (pnLocal1.visible) then
      edtCodigo.setfocus
    else
    if (pnLocal2.visible) then
      edtRefInt.setfocus;
  if (key=K_F8) then
    ChamandoF8Cores(edtCor,true);
  if (key=K_F2) then
    if (qEstoque.active) then
      grade.setfocus;
end;

procedure Tfrm_edtEstoqueLoja.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnLocalizar.click;
  if (key=38) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F2) then
    if (qEstoque.active) then
      grade.setfocus;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtEstoqueLoja.edtLojaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoqueLoja.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoqueLoja.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe faixas de tamanho cadastradas para o produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoqueLoja.edtLojaDblClick(Sender: TObject);
begin
  ChamandoF8Lojas(edtLoja,true);
end;

procedure Tfrm_edtEstoqueLoja.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8Cores(edtCor,true);
end;

{Botao de filtro ****}
procedure Tfrm_edtEstoqueLoja.qEstoqueCalcFields(DataSet: TDataSet);
begin
  with (qEstoque) do
  begin
    if (fieldbyname('loja').IsNull) then
      fieldbyname('loja').AsString:=ProcuraNomeLoja(
        fieldbyname('EL_LOJA').AsFloat,self);
    if (fieldbyname('cor').IsNull) then
      if (fieldbyname('EL_CORE').AsString='0') then
        fieldbyname('cor').AsString:='ÚNICA'
      else
        fieldbyname('cor').AsString:=ProcuraAbrevCor(
          fieldbyname('EL_CORE').AsFloat,self);
    if (fieldbyname('pvenda1').IsNull) then
      fieldbyname('pvenda1').AsString:=form_nc(
        fieldbyname('EL_PVE1').AsFloat,15);
    if (fieldbyname('pcusto1').IsNull) then
      fieldbyname('pcusto1').AsString:=form_nc(
        fieldbyname('EL_PCU1').AsFloat,15);
    if (fieldbyname('pvenda2').IsNull) then
      fieldbyname('pvenda2').AsString:=form_nc(
        fieldbyname('EL_PVE2').AsFloat,15);
    if (fieldbyname('pcusto2').IsNull) then
      fieldbyname('pcusto2').AsString:=form_nc(
        fieldbyname('EL_PCU2').AsFloat,15);
    if (fieldbyname('cTam').IsNull) then
      if (fieldbyname('EL_TAMA').AsString='0') then
        fieldbyname('cTam').AsString:='ÚNICO'
      else
        fieldbyname('cTam').AsString:=fieldbyname('EL_TAMA').AsString;
    if (fieldbyname('cDesc').IsNull) then
      fieldbyname('cDesc').AsString:=
        ProcuraNomeItemEstoque (fieldbyname('EL_GRUP').AsFloat,
        fieldbyname('EL_SUBG').AsFloat,
        fieldbyname('EL_PROD').AsFloat,
        fieldbyname('EL_CORE').AsFloat,
        fieldbyname('EL_TAMA').AsString,self);
  end;
end;

procedure Tfrm_edtEstoqueLoja.Excluiritem1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {CRITICA A EXCLUSAO - ??? - Com relacao à movimentacao do item}
     {Se tem movimento ou nao}
  if (qEstoque.active) then
    if (frmDialogo.ExibirMensagem ('Excluir item da lista?'
      ,'Estoque',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
      clAux:=TClassAuxiliar.Create;
      clAux.conect ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Delete from ESTOQUE_LOJA ');
      clAux.AddParam ('Where (EL_GRUP='+qEstoque.fieldbyname('EL_GRUP').AsString+') AND ');
      clAux.AddParam ('      (EL_SUBG='+qEstoque.fieldbyname('EL_SUBG').AsString+') AND ');
      clAux.AddParam ('      (EL_PROD='+qEstoque.fieldbyname('EL_PROD').AsString+') AND ');
      clAux.AddParam ('      (EL_LOJA='+qEstoque.fieldbyname('EL_LOJA').AsString+') AND ');
      clAux.AddParam ('      (EL_CORE='+qEstoque.fieldbyname('EL_CORE').AsString+') AND ');
      clAux.AddParam ('      (EL_TAMA='+chr(39)+qEstoque.fieldbyname('EL_TAMA').AsString+chr(39)+')     ');
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
      btnLocalizar.click;
    end;
end;

procedure Tfrm_edtEstoqueLoja.Imprimirplanos1Click(Sender: TObject);
var
  clAux2:  TClassAuxiliar;
  indGauge,totGauge: Integer;
  total_itens: Integer;
  totgeral_totalcusto,totgeral_totalvenda: Real;
  grupo,subgrupo,produto,cor: Real;
  tamanho,tam: String;
  saldo,preco_custo,preco_venda: Real;
  total_custo,total_venda,dif,margem: Real;
begin
   {iniciando o processamento do relatorio}
  mostra_mensagem ('Preparando relatório...Aguarde!');
  frm_mensagem.painel.visible:=true;
  frm_mensagem.gauge1.progress:=0;

   {...}
  with (frm_mem_print) do
  begin
       {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_comando       := '15c';
    frm_principal.x_arq_impressao := 's02.rel';
    frm_principal.x_tam_fonte     := 8;
    Title:= 'LISTAGEM DE CONSULTA AO ESTOQUE';

    AddLine (form_tc2('-',132,'-'));
    AddLine ('            |                                |     |     | Saldo      |    |Pr. Custo|Total         |Pr. Venda |Total         |Marg ');
    AddLine ('Cod         |Descricao                       |Cor  |Tama |do Item     |Unid|Medio   $|Custo        $|Atual    $|Venda        $| (%) ');
    AddLine (form_tc2('-',132,'-'));
    indGauge:=0;
    totGauge:=qEstoque.recordCount;
    qEstoque.disablecontrols;
    qEstoque.first;
    total_itens         := 0;
    totgeral_totalcusto := 0.00;
    totgeral_totalvenda := 0.00;
    while (not qEstoque.eof) do
    begin
      grupo    := qEstoque.fieldbyname('EL_GRUP').AsFloat;
      subgrupo := qEstoque.fieldbyname('EL_SUBG').AsFloat;
      produto  := qEstoque.fieldbyname('EL_PROD').AsFloat;
      clAux2   := TClassAuxiliar.Create;
      clAux2.conect   ('ESTOQUE',self);
      clAux2.ClearSql;
      clAux2.AddParam ('Select PR_UNID ');
      clAux2.AddParam ('From   PRODUTOS ');
      clAux2.AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND ');
      clAux2.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND ');
      clAux2.AddParam ('      (PR_CODI='+floattostr(produto)+')');
      clAux2.Execute;
      cor         := qEstoque.fieldbyname('EL_CORE').AsFloat;
      tam         := qEstoque.fieldbyname('EL_TAMA').AsString;
      if (tam='0') then
        tamanho:='UNICO'
      else
        tamanho:=tam;
      if (tipz='1') then
      begin
        saldo       := qEstoque.fieldbyname('EL_QTD1').AsFloat;
        preco_custo := qEstoque.fieldbyname('EL_PCU1').AsFloat;
        preco_venda := qEstoque.fieldbyname('EL_PVE1').AsFloat;
      end
      else
      if (tipz='2') then
      begin
        saldo       := qEstoque.fieldbyname('EL_QTD2').AsFloat;
        preco_custo := qEstoque.fieldbyname('EL_PCU2').AsFloat;
        preco_venda := qEstoque.fieldbyname('EL_PVE2').AsFloat;
      end;
      total_custo := (saldo*preco_custo);
      total_venda := (saldo*preco_venda);
      if (total_custo<>0) then
      begin
        if (total_venda>=total_custo) then
        begin
          dif:=total_venda - total_custo;
          margem:=((dif/total_custo)*100);
        end
        else
          margem:=0.00;
      end
      else
        margem:=0.00;
      AddLine (form_nz  (grupo,3)    +
        form_nz  (subgrupo,3) +
        form_nz  (produto,6)  +' '+
        form_t   (ProcuraNomeItemEstoque(grupo,subgrupo,produto,cor,tam,self),32)+' '+
        form_t   (ProcuraAbrevCor(cor,self),5)+' '+
        form_t   (tamanho,5)  +' '+
        form_nc2 (saldo,12,2) +' '+
        form_t   (clAux2.result('PR_UNID'),3)+' '+
        form_nc2 (preco_custo,10,3)+' '+
        form_nc  (total_custo,14)+' '+
        form_nc  (preco_venda,10)+' '+
        form_nc  (total_venda,14)+' '+
        form_nc  (margem,5));
      clAux2.Desconect;
      clAux2.Free;

            {prox titulo -->}
      totgeral_totalcusto := totgeral_totalcusto + total_custo;
      totgeral_totalvenda := totgeral_totalvenda + total_venda;
      qEstoque.next;
      total_itens      := total_itens + 1;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine (form_tc2('-',132,'-'));
    if (totgeral_totalcusto<>0) then
    begin
      if (totgeral_totalvenda>=totgeral_totalcusto) then
      begin
        dif:=totgeral_totalvenda - totgeral_totalcusto;
        margem:=((dif/totgeral_totalcusto)*100);
      end
      else
        margem:=0.00;
    end
    else
      margem:=0.00;
    AddLine ('Total...........: '+form_n(total_itens,11)+
      form_tc2(' ',51,' ')+form_nc(totgeral_totalcusto,20)+'  '+
      form_nc(totgeral_totalvenda,23)+' '+
      form_nc(margem,6));
    AddLine ('');

       {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  frm_mem_print.showmodal;
  qEstoque.enablecontrols;
end;

procedure Tfrm_edtEstoqueLoja.Outrasconsultas1Click(Sender: TObject);
begin
  showmessage('Ainda nao disponivel');
end;

procedure Tfrm_edtEstoqueLoja.Limparcadastro1Click(Sender: TObject);
begin
  qEstoque.close;
  habilitaEdit(edtCor);
  habilitaEdit(edtFaixaTam);
  LimparEdits;
  edtLoja.setfocus;
end;

procedure Tfrm_edtEstoqueLoja.LimparEdits;
begin
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtCodigo.text:='';
  edtRefInt.text:='';
  if (edtCor.enabled) then
  begin
    edtCor.text:='';
    pnCor.caption:='';
  end;
  if (edtFaixaTam.enabled) then
    edtFaixaTam.text:='';
  pnProduto.caption:='';
  pnUnidade.caption:='';
  n_grupo    := 0;
  n_subgrupo := 0;
  n_produto  := 0;
end;

procedure Tfrm_edtEstoqueLoja.Inseriritemdeestoque1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_LancarItemLoja,frm_LancarItemLoja);
  frm_LancarItemLoja.jaCriou:=false;
  frm_LancarItemLoja.Modo:=0;
  frm_LancarItemLoja.showmodal;
  frm_LancarItemLoja.Free;
  btnLocalizar.click;
  if (qEstoque.active) then
    grade.setfocus
  else
    FocaCodigoLocal1;
end;

procedure Tfrm_edtEstoqueLoja.Alterardadosdeumitemdeestoque1Click(
  Sender: TObject);
begin
  if (qEstoque.active) then
  begin
    Application.CreateForm(Tfrm_LancarItemLoja,frm_LancarItemLoja);
    frm_LancarItemLoja.n_grupo    := qEstoque.fieldbyname('EL_GRUP').AsFloat;
    frm_LancarItemLoja.n_subgrupo := qEstoque.fieldbyname('EL_SUBG').AsFloat;
    frm_LancarItemLoja.n_produto  := qEstoque.fieldbyname('EL_PROD').AsFloat;
    frm_LancarItemLoja.n_loja     := qEstoque.fieldbyname('EL_LOJA').AsFloat;
    frm_LancarItemLoja.n_cor      := qEstoque.fieldbyname('EL_CORE').AsFloat;
    frm_LancarItemLoja.n_tam      := qEstoque.fieldbyname('EL_TAMA').AsString;
    frm_LancarItemLoja.jaCriou:=false;
    frm_LancarItemLoja.Modo:=1;
    frm_LancarItemLoja.showmodal;
    frm_LancarItemLoja.Free;
    btnLocalizar.click;
    grade.setfocus;
  end;
end;

procedure Tfrm_edtEstoqueLoja.btnLocalizarClick(Sender: TObject);
var
  porcao_grupo,porcao_subgrupo,porcao_produto: String;
  codigo,loja,cor,faixa: String;
begin
     {Filtros aplicaveis}
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
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja<>'') and (cor<>'-1') and (faixa<>'-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (EL_LOJA='+loja+') AND ');
    qEstoque.sql.Add ('      (EL_CORE='+cor+') AND ');
    qEstoque.sql.Add ('      (EL_TAMA='+chr(39)+faixa+chr(39)+')  ');
    qEstoque.open
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja<>'') and (cor<>'-1') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (EL_LOJA='+loja+') AND ');
    qEstoque.sql.Add ('      (EL_CORE='+cor+')  ');
    qEstoque.open;
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja<>'') and (cor='-1') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (EL_LOJA='+loja+')  ');
    qEstoque.open;
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja='') and (cor='-1') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+')  ');
    qEstoque.open;
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja='') and (cor='0') and (faixa='0') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+')  ');
    qEstoque.open
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja='') and (cor='0') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (EL_CORE='+cor+') ');
    qEstoque.open
  end
  else
  if (porcao_grupo='0') and (porcao_subgrupo='0') and (porcao_produto='0') and
    (loja<>'') and (cor='-1') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where  (EL_LOJA='+loja+') ');
    qEstoque.open
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja<>'') and (cor='-1') and (faixa='0') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (EL_LOJA='+loja+') AND ');
    qEstoque.sql.Add ('      (EL_TAMA='+chr(39)+faixa+chr(39)+')  ');
    qEstoque.open
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (loja='') and (cor='-1') and (faixa='0') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE_LOJA ');
    qEstoque.sql.Add ('Where (EL_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (EL_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (EL_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (EL_TAMA='+chr(39)+faixa+chr(39)+')  ');
    qEstoque.open
  end
  else
  if (edtFaixaTam.enabled) then
    edtFaixaTam.setfocus
  else
  if (edtCor.enabled) then
    edtCor.setfocus
  else
    edtLoja.setfocus;
  AjustaGrade;
  grade.setfocus;
end;

procedure Tfrm_edtEstoqueLoja.edtLojaExit(Sender: TObject);
var
  codigo: String;
begin
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

procedure Tfrm_edtEstoqueLoja.edtCorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),2);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtEstoqueLoja.btnInserirClick(Sender: TObject);
begin
  Inseriritemdeestoque1.click;
end;

procedure Tfrm_edtEstoqueLoja.btnAlterarClick(Sender: TObject);
begin
  Alterardadosdeumitemdeestoque1.click;
end;

procedure Tfrm_edtEstoqueLoja.btnExcluirClick(Sender: TObject);
begin
  Excluiritem1.click;
end;

procedure Tfrm_edtEstoqueLoja.Extratodemovimentodoitem1Click(Sender: TObject);
begin
  if (qEstoque.active) and (qEstoque.recordcount<>0) then
    if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_LISTA_MOVIMENTO, 'U')) then
      frm_principal.ExibirDica ('Acesso não permitido...',5)
    else
    begin
      Application.CreateForm (Tfrm_ListaMovDia,frm_ListaMovDia);
      with (frm_ListaMovDia) do
      begin
        caption := frm_principal.x_sistema+' - Listagem do movimento do produto';
        PosicionaFormLDireito(frm_ListaMovDia);
        frm_ListaMovDia.edtGrupo.text    := qEstoque.fieldbyname('EL_GRUP').AsString;
        frm_ListaMovDia.edtSubGrupo.text := qEstoque.fieldbyname('EL_SUBG').AsString;
        frm_ListaMovDia.edtCodigo.text   := qEstoque.fieldbyname('EL_PROD').AsString;
        frm_ListaMovDia.edtCor.text      := qEstoque.fieldbyname('EL_CORE').AsString;
        frm_ListaMovDia.edtFaixaTam.text := qEstoque.fieldbyname('EL_TAMA').AsString;
        frm_ListaMovDia.edtInicial1.text := edtLoja.text;
        frm_ListaMovDia.edtFinal1.text   := edtLoja.text;
        frm_ListaMovDia.edtInicial2.text := datetostr(date);
        frm_ListaMovDia.edtFinal2.text   := datetostr(date);
        frm_ListaMovDia.tipz             := frm_edtEstoqueLoja.tipz;
        Modo:=1;
        jaChamou:=false;
        showmodal;
        free;
      end;
    end;
end;

procedure Tfrm_edtEstoqueLoja.Todosositens1Click(Sender: TObject);
begin
  showmessage('Ainda nao disponivel');
end;

procedure Tfrm_edtEstoqueLoja.Itemselecionado1Click(Sender: TObject);
begin
  showmessage('Ainda nao disponivel');
end;

procedure Tfrm_edtEstoqueLoja.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    edtFaixaTam.setfocus;
  if (key=K_ENTER) then
    Veritemdeestoque1.click;
  if (key=K_ESC) then
    Limparcadastro1.click;
  if (key=K_DELETE) then
    btnExcluir.click;
end;

procedure Tfrm_edtEstoqueLoja.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_edtEstoqueLoja.SpeedButton4Click(Sender: TObject);
begin
  Extratodemovimentodoitem1.click;
end;

procedure Tfrm_edtEstoqueLoja.Veritemdeestoque1Click(Sender: TObject);
begin
  if (qEstoque.active) then
  begin
    Application.CreateForm(Tfrm_VerEstoqueLoja,frm_VerEstoqueLoja);
    frm_VerEstoqueLoja.n_grupo    := qEstoque.fieldbyname('EL_GRUP').AsFloat;
    frm_VerEstoqueLoja.n_subgrupo := qEstoque.fieldbyname('EL_SUBG').AsFloat;
    frm_VerEstoqueLoja.n_produto  := qEstoque.fieldbyname('EL_PROD').AsFloat;
    frm_VerEstoqueLoja.n_loja     := qEstoque.fieldbyname('EL_LOJA').AsFloat;
    frm_VerEstoqueLoja.n_cor      := qEstoque.fieldbyname('EL_CORE').AsFloat;
    frm_VerEstoqueLoja.n_tam      := qEstoque.fieldbyname('EL_TAMA').AsString;
    frm_VerEstoqueLoja.tipz       := tipz;
    frm_VerEstoqueLoja.showmodal;
    frm_VerEstoqueLoja.Free;
  end;
end;

procedure Tfrm_edtEstoqueLoja.edtLojaChange(Sender: TObject);
begin
  if (Trim(edtLoja.text)<>'') then
    n_loja := strtofloat(Trim(edtLoja.text))
  else
    n_loja :=0;
end;

procedure Tfrm_edtEstoqueLoja.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_edtEstoqueLoja.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_edtEstoqueLoja.gradeDblClick(Sender: TObject);
begin
  Veritemdeestoque1.click;
end;

procedure Tfrm_edtEstoqueLoja.FormCreate(Sender: TObject);
begin
  n_cor_unica:=false;
  n_tam_unico:=false;
  tipz:='1';
  AjustaGrade;

     {* Posicionando a forma de localizacao do produto *}
  if (frm_principal.x_ordem_codigo=1) then
  begin
    pnLocal1.visible := true;
    pnLocal1.left    := 37;
    pnLocal2.visible := false;
    pnLocal2.left    := 37;
    pnProduto.left   := 270;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
  begin
    pnLocal1.visible := false;
    pnLocal1.left    := 37;
    pnLocal2.visible := true;
    pnLocal2.left    := 37;
    pnProduto.left   := 198;
  end;
end;

procedure Tfrm_edtEstoqueLoja.SpeedButton2Click(Sender: TObject);
begin
  Lanarsada1.click;
end;

procedure Tfrm_edtEstoqueLoja.btnEntradaClick(Sender: TObject);
begin
  Lanarentrada1.click;
end;

procedure Tfrm_edtEstoqueLoja.Lanarentrada1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_ENTRADAS, 'U')) then
    frm_principal.ExibirDica ('Acesso não permitido...',5)
  else
  begin
    Application.CreateForm (Tfrm_OutrasEntradas, frm_OutrasEntradas);
    with (frm_OutrasEntradas) do
    begin
      caption := frm_principal.x_sistema+' - Outras Entradas';
          {if (Trim(frm_EdtEstoque.edtProduto.text)<>'') then
             frm_OutrasEntradas.edtProduto.text:=frm_EdtEstoque.edtProduto.text;}
      Modo    := 1;
      showmodal;
      free;
      btnLocalizar.click;
    end;
  end;
end;

procedure Tfrm_edtEstoqueLoja.Lanarsada1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SAIDAS, 'U')) then
    frm_principal.ExibirDica ('Acesso não permitido...',5)
  else
  begin
    Application.CreateForm (Tfrm_OutrasSaidas, frm_OutrasSaidas);
    with (frm_OutrasSaidas) do
    begin
      caption := frm_principal.x_sistema+' - Outras Saidas';
          {if (Trim(frm_EdtEstoque.edtProduto.text)<>'') then
              frm_OutrasSaidas.edtProduto.text:=frm_EdtEstoque.edtProduto.text;}
      Modo    := 1;
      showmodal;
      free;
      btnLocalizar.click;
    end;
  end;
end;

procedure Tfrm_edtEstoqueLoja.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_edtEstoqueLoja.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoqueLoja.edtGrupoKeyDown(Sender: TObject;
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
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtEstoqueLoja.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_edtEstoqueLoja.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoqueLoja.edtSubGrupoKeyDown(Sender: TObject;
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
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtEstoqueLoja.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_edtEstoqueLoja.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoqueLoja.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
  if (key=K_ESC) then
    close;   
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
    if (key=K_ENTER) then
      btnLocalizar.click;
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

procedure Tfrm_edtEstoqueLoja.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtEstoqueLoja.edtRefIntKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    refinterna := Trim(edtRefInt.text);
    if (refinterna<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP, ');
        AddParam ('       PR_SUBG,PR_CODI,PR_UNID          ');
        AddParam ('From   PRODUTOS ');
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
    if (key=K_ENTER) then
      btnLocalizar.click;
  end;
  if (key=K_CIMA) then
    edtLoja.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
end;

procedure Tfrm_edtEstoqueLoja.MudaFocoCodigo;
begin
  if (pnLocal1.visible) then
  begin
    pnLocal1.visible:=false;
    pnLocal2.visible:=true;
    edtRefInt.setfocus;
    pnProduto.left   := 198;
  end
  else
  if (pnLocal2.visible) then
  begin
    pnLocal1.visible:=true;
    pnLocal2.visible:=false;
    edtGrupo.setfocus;
    pnProduto.left   := 270;
  end;
end;

{Controle de foco do produto ***}
procedure Tfrm_edtEstoqueLoja.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_edtEstoqueLoja.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

procedure Tfrm_edtEstoqueLoja.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_edtEstoqueLoja.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;


procedure Tfrm_edtEstoqueLoja.edtCodigoDblClick(Sender: TObject);
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

procedure Tfrm_edtEstoqueLoja.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtEstoqueLoja.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtEstoqueLoja.edtCodigoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtEstoqueLoja.edtFaixaTamExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

{Inverte as quantidades exibidas na grade ****}
procedure Tfrm_edtEstoqueLoja.AjustaGrade;
begin
  if (tipz='1') then
  begin
    grade.Columns[4].Title.Caption   := 'Saldo (qtde)';
    grade.Columns[4].FieldName := 'EL_QTD1';
  end
  else
  if (tipz='2') then
  begin
    grade.Columns[4].Title.Caption   := 'Saldo (2)';
    grade.Columns[4].FieldName := 'EL_QTD2';
  end;
end;

procedure Tfrm_edtEstoqueLoja.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
        tipz:='2'
      else
      if (tipz='2') then
        tipz:='1';
      AjustaGrade;
    end;
end;

procedure Tfrm_edtEstoqueLoja.Editarmovimentodoitem1Click(Sender: TObject);
var
  lojaAnt,corAnt: Real;
  faixaAnt: String;
begin
  if (qEstoque.active) then
  begin
    lojaAnt  := qEstoque.fieldbyname('EL_LOJA').AsFloat;
    corAnt   := qEstoque.fieldbyname('EL_CORE').AsFloat;
    faixaAnt := qEstoque.fieldbyname('EL_TAMA').AsString;
    Application.CreateForm (Tfrm_VerMovimentoItemLoja,frm_VerMovimentoItemLoja);
    frm_VerMovimentoItemLoja.y_loja     := qEstoque.fieldbyname('EL_LOJA').AsFloat;
    frm_VerMovimentoItemLoja.y_grupo    := qEstoque.fieldbyname('EL_GRUP').AsFloat;
    frm_VerMovimentoItemLoja.y_subgrupo := qEstoque.fieldbyname('EL_SUBG').AsFloat;
    frm_VerMovimentoItemLoja.y_produto  := qEstoque.fieldbyname('EL_PROD').AsFloat;
    frm_VerMovimentoItemLoja.y_tamanho  := qEstoque.fieldbyname('EL_TAMA').AsString;
    frm_VerMovimentoItemLoja.y_cor      := qEstoque.fieldbyname('EL_CORE').AsFloat;
    frm_VerMovimentoItemLoja.jaViu      := false;
    frm_VerMovimentoItemLoja.tipz       := frm_edtEstoqueLoja.tipz;
    frm_VerMovimentoItemLoja.AtualizaMovimento;
    frm_VerMovimentoItemLoja.showmodal;
    frm_VerMovimentoItemLoja.Free;
    qEstoque.disablecontrols;
    qEstoque.close;
    qEstoque.open;
    qEstoque.first;
    while (not qEstoque.eof) do
    begin
      if (lojaAnt=qEstoque.fieldbyname('EL_LOJA').AsFloat) and
        (corAnt=qEstoque.fieldbyname('EL_CORE').AsFloat) and
        (faixaAnt=qEstoque.fieldbyname('EL_TAMA').AsString) then
        break;
      qEstoque.next;
    end;
    qEstoque.enablecontrols;
  end;
end;

procedure Tfrm_edtEstoqueLoja.btnEditarMovimentoClick(Sender: TObject);
begin
  Editarmovimentodoitem1.click;
end;

end.
