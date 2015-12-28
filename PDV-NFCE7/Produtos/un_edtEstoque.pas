unit un_edtEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Mask, Grids, DBGrids, Db, DBTables;

type
  Tfrm_edtEstoque = class(TForm)
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
    qEstoqueES_GRUP: TFloatField;
    qEstoqueES_SUBG: TFloatField;
    qEstoqueES_PROD: TFloatField;
    qEstoqueES_CORE: TFloatField;
    qEstoqueES_TAMA: TStringField;
    qEstoquecor: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    N1: TMenuItem;
    Excluiritem1: TMenuItem;
    Inseriritemdeestoque1: TMenuItem;
    Alterardadosdeumitemdeestoque1: TMenuItem;
    N4: TMenuItem;
    SpeedButton1: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnLocalizar: TSpeedButton;
    qEstoqueES_DESC: TStringField;
    qEstoqueES_REFF: TStringField;
    qEstoqueES_CBAR: TStringField;
    Veritemdeestoque1: TMenuItem;
    qEstoquecTam: TStringField;
    Label9: TLabel;
    Label8: TLabel;
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
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCorEnter(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure qEstoqueCalcFields(DataSet: TDataSet);
    procedure Excluiritem1Click(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure Outrasconsultas1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Inseriritemdeestoque1Click(Sender: TObject);
    procedure Alterardadosdeumitemdeestoque1Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure Veritemdeestoque1Click(Sender: TObject);
    procedure edtCorChange(Sender: TObject);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure edtFaixaTamExit(Sender: TObject);
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

    {...}
    Modo: Integer;          {0-> modo consulta (para um produto), 1-> uso geral}

    {...}
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure MudaFocoCodigo;
  end;

var
  frm_edtEstoque: Tfrm_edtEstoque;

implementation

uses un_LancarItem, principal, funcoes1, funcoes2, procura, auxiliar,
  unDialogo, un_VerEstoque, un_OutrasSaidas, un_OutrasEntradas, produtos,
  unMensagem, mem_prnt;

{$R *.DFM}

procedure Tfrm_edtEstoque.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtEstoque.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtEstoque.FormActivate(Sender: TObject);
begin
  FocaCodigoLocal1;   
end;

procedure Tfrm_edtEstoque.FocusControle(controle: TWinControl; direcao: Boolean);
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

procedure Tfrm_edtEstoque.edtCorKeyDown(Sender: TObject; var Key: Word;
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
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Cores(edtCor,true);
  if (key=K_F2) then
    if (qEstoque.active) then
      grade.setfocus;
end;

procedure Tfrm_edtEstoque.edtFaixaTamKeyDown(Sender: TObject;
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

procedure Tfrm_edtEstoque.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoque.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe faixas de tamanho cadastradas para o produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoque.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8Cores(edtCor,true);
end;

{Botao de filtro ****}
procedure Tfrm_edtEstoque.qEstoqueCalcFields(DataSet: TDataSet);
begin
  with (qEstoque) do
  begin
    if (fieldbyname('cor').IsNull) then
      if (fieldbyname('ES_CORE').AsString='0') then
        fieldbyname('cor').AsString:='ÚNICA'
      else
        fieldbyname('cor').AsString:=ProcuraAbrevCor(
          fieldbyname('ES_CORE').AsFloat,self);
    if (fieldbyname('cTam').IsNull) then
      if (fieldbyname('ES_TAMA').AsString='0') then
        fieldbyname('cTam').AsString:='ÚNICO'
      else
        fieldbyname('cTam').AsString:=fieldbyname('ES_TAMA').AsString;
  end;
end;

procedure Tfrm_edtEstoque.Excluiritem1Click(Sender: TObject);
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
      clAux.AddParam ('Delete from ESTOQUE ');
      clAux.AddParam ('Where (ES_GRUP='+qEstoque.fieldbyname('ES_GRUP').AsString+') AND ');
      clAux.AddParam ('      (ES_SUBG='+qEstoque.fieldbyname('ES_SUBG').AsString+') AND ');
      clAux.AddParam ('      (ES_PROD='+qEstoque.fieldbyname('ES_PROD').AsString+') AND ');
      clAux.AddParam ('      (ES_CORE='+qEstoque.fieldbyname('ES_CORE').AsString+') AND ');
      clAux.AddParam ('      (ES_TAMA='+chr(39)+qEstoque.fieldbyname('ES_TAMA').AsString+chr(39)+')     ');
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
      btnLocalizar.click;
    end;
end;

procedure Tfrm_edtEstoque.Imprimirplanos1Click(Sender: TObject);
var
  clAux2: TClassAuxiliar;
  indGauge,totGauge: Integer;
  total_itens: Integer;
  grupo,subgrupo,produto,cor: Real;
  tamanho,tam: String;
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
    frm_principal.x_arq_impressao := 's01.rel';
    frm_principal.x_tam_fonte     := 8;
    Title:= 'LISTAGEM DE CONSULTA DE ITENS';

    AddLine (form_tc2('-',132,'-'));
    AddLine ('            |                                |     |     |    |Ref.       |Codigo     ');
    AddLine ('Cod         |Descricao                       |Cor  |Tama |Unid|Fabricante |de barras  ');
    AddLine (form_tc2('-',132,'-'));
    indGauge:=0;
    totGauge:=qEstoque.recordCount;
    qEstoque.disablecontrols;
    qEstoque.first;
    total_itens         := 0;
    while (not qEstoque.eof) do
    begin
      grupo    := qEstoque.fieldbyname('ES_GRUP').AsFloat;
      subgrupo := qEstoque.fieldbyname('ES_SUBG').AsFloat;
      produto  := qEstoque.fieldbyname('ES_PROD').AsFloat;
      clAux2   := TClassAuxiliar.Create;
      clAux2.conect   ('ESTOQUE',self);
      clAux2.ClearSql;
      clAux2.AddParam ('Select PR_UNID ');
      clAux2.AddParam ('From   PRODUTOS ');
      clAux2.AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND ');
      clAux2.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND ');
      clAux2.AddParam ('      (PR_CODI='+floattostr(produto)+')');
      clAux2.Execute;
      cor         := qEstoque.fieldbyname('ES_CORE').AsFloat;
      tam         := qEstoque.fieldbyname('ES_TAMA').AsString;
      if (tam='0') then
        tamanho:='UNICO'
      else
        tamanho:=tam;
      AddLine (form_nz  (grupo,3)    +
        form_nz  (subgrupo,3) +
        form_nz  (produto,6)  +' '+
        form_t   (qEstoque.fieldbyname('ES_DESC').AsString,32)+' '+
        form_t   (ProcuraAbrevCor(cor,self),5)+' '+
        form_t   (tamanho,5)  +' '+
        form_t   (clAux2.result('PR_UNID'),3)+' '+
        form_t   (qEstoque.fieldbyname('ES_REFF').AsString,12)+' '+
        form_t   (qEstoque.fieldbyname('ES_CBAR').AsString,12));
      clAux2.Desconect;
      clAux2.Free;

            {prox titulo -->}
      qEstoque.next;
      total_itens      := total_itens + 1;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine (form_tc2('-',132,'-'));
    AddLine ('Total...........: '+form_n(total_itens,11));
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

procedure Tfrm_edtEstoque.Outrasconsultas1Click(Sender: TObject);
begin
  showmessage('Ainda nao disponivel');
end;

procedure Tfrm_edtEstoque.Limparcadastro1Click(Sender: TObject);
begin
  habilitaEdit(edtCor);
  habilitaEdit(edtFaixaTam);
  qEstoque.close;
  LimparEdits;
  FocaCodigoLocal1;
end;

procedure Tfrm_edtEstoque.LimparEdits;
begin
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtCodigo.text:='';
  edtRefInt.text:='';
  pnProduto.caption:='';
  pnUnidade.caption:='';
  if (edtCor.enabled) then
  begin
    edtCor.text:='';
    pnCor.caption:='';
  end;
  if (edtFaixaTam.enabled) then
    edtFaixaTam.text:='';
  n_grupo    := 0;
  n_subgrupo := 0;
  n_produto  := 0;
end;

procedure Tfrm_edtEstoque.Inseriritemdeestoque1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_LancarItem,frm_LancarItem);
  frm_LancarItem.jaCriou:=false;
  frm_LancarItem.Modo:=0;
  frm_LancarItem.showmodal;
  frm_LancarItem.Free;
  btnLocalizar.click;
  if (qEstoque.active) then
    grade.setfocus
  else
    FocaCodigoLocal1;
end;

procedure Tfrm_edtEstoque.Alterardadosdeumitemdeestoque1Click(
  Sender: TObject);
begin
  if (qEstoque.active) then
  begin
    Application.CreateForm(Tfrm_LancarItem,frm_LancarItem);
    frm_LancarItem.n_grupo    := qEstoque.fieldbyname('ES_GRUP').AsFloat;
    frm_LancarItem.n_subgrupo := qEstoque.fieldbyname('ES_SUBG').AsFloat;
    frm_LancarItem.n_produto  := qEstoque.fieldbyname('ES_PROD').AsFloat;
    frm_LancarItem.n_cor      := qEstoque.fieldbyname('ES_CORE').AsFloat;
    frm_LancarItem.n_tam      := qEstoque.fieldbyname('ES_TAMA').AsString;
    frm_LancarItem.jaCriou:=false;
    frm_LancarItem.Modo:=1;
    frm_LancarItem.showmodal;
    frm_LancarItem.Free;
    btnLocalizar.click;
    grade.setfocus;
  end;
end;

procedure Tfrm_edtEstoque.btnLocalizarClick(Sender: TObject);
var
  porcao_grupo,porcao_subgrupo,porcao_produto: String;
  cor,faixa: String;
begin
     {Filtros aplicaveis}   
  porcao_grupo    := floattostr(n_grupo);
  porcao_subgrupo := floattostr(n_subgrupo);
  porcao_produto  := floattostr(n_produto);
  cor             := Trim(edtCor.text);
  faixa           := Trim(edtFaixaTam.text);
  if (cor='') then
    cor:='-1';
  if (faixa='') then
    faixa:='-1';

     {...}
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (cor<>'-1') and (faixa<>'-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE ');
    qEstoque.sql.Add ('Where (ES_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (ES_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (ES_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (ES_CORE='+cor+') AND ');
    qEstoque.sql.Add ('      (ES_TAMA='+chr(39)+faixa+chr(39)+')  ');
    qEstoque.open
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (cor<>'-1') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE ');
    qEstoque.sql.Add ('Where (ES_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (ES_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (ES_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (ES_CORE='+cor+')  ');
    qEstoque.open;
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (cor='-1') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE ');
    qEstoque.sql.Add ('Where (ES_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (ES_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (ES_PROD='+porcao_produto+') ');
    qEstoque.open;
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (cor='-1') and (faixa='-1') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE ');
    qEstoque.sql.Add ('Where (ES_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (ES_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (ES_PROD='+porcao_produto+')  ');
    qEstoque.open;
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (cor='0') and (faixa='0') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE ');
    qEstoque.sql.Add ('Where (ES_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (ES_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (ES_PROD='+porcao_produto+')  ');
    qEstoque.open
  end
  else
  if (porcao_grupo<>'0') and (porcao_subgrupo<>'0') and (porcao_produto<>'0') and
    (cor='-1') and (faixa='0') then
  begin
    qEstoque.close;
    qEstoque.sql.clear;
    qEstoque.sql.Add ('Select * ');
    qEstoque.sql.Add ('From   ESTOQUE ');
    qEstoque.sql.Add ('Where (ES_GRUP='+porcao_grupo+') AND ');
    qEstoque.sql.Add ('      (ES_SUBG='+porcao_subgrupo+') AND ');
    qEstoque.sql.Add ('      (ES_PROD='+porcao_produto+') AND ');
    qEstoque.sql.Add ('      (ES_TAMA='+chr(39)+faixa+chr(39)+')  ');
    qEstoque.open
  end
  else
  if (edtFaixaTam.enabled) then
    edtFaixaTam.setfocus
  else
  if (edtCor.enabled) then
    edtCor.setfocus
  else
    FocaCodigoLocal1;
  grade.setfocus;
end;

procedure Tfrm_edtEstoque.edtCorExit(Sender: TObject);
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

procedure Tfrm_edtEstoque.btnInserirClick(Sender: TObject);
begin
  Inseriritemdeestoque1.click;
end;

procedure Tfrm_edtEstoque.btnAlterarClick(Sender: TObject);
begin
  Alterardadosdeumitemdeestoque1.click;
end;

procedure Tfrm_edtEstoque.btnExcluirClick(Sender: TObject);
begin
  Excluiritem1.click;
end;

procedure Tfrm_edtEstoque.gradeKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_edtEstoque.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_edtEstoque.Veritemdeestoque1Click(Sender: TObject);
begin
  if (qEstoque.active) then
  begin
    Application.CreateForm(Tfrm_VerEstoque,frm_VerEstoque);
    frm_VerEstoque.n_grupo    := qEstoque.fieldbyname('ES_GRUP').AsFloat;
    frm_VerEstoque.n_subgrupo := qEstoque.fieldbyname('ES_SUBG').AsFloat;
    frm_VerEstoque.n_produto  := qEstoque.fieldbyname('ES_PROD').AsFloat;
    frm_VerEstoque.n_cor      := qEstoque.fieldbyname('ES_CORE').AsFloat;
    frm_VerEstoque.n_tam      := qEstoque.fieldbyname('ES_TAMA').AsString;
    frm_VerEstoque.showmodal;
    frm_VerEstoque.Free;
  end;
end;

procedure Tfrm_edtEstoque.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_edtEstoque.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_edtEstoque.gradeDblClick(Sender: TObject);
begin
  Veritemdeestoque1.click;
end;

procedure Tfrm_edtEstoque.FormCreate(Sender: TObject);
begin
  n_cor_unica:=false;
  n_tam_unico:=false;

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

procedure Tfrm_edtEstoque.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_edtEstoque.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_edtEstoque.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_edtEstoque.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoque.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoque.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtEstoque.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtEstoque.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtEstoque.edtSubGrupoKeyDown(Sender: TObject;
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

procedure Tfrm_edtEstoque.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure Tfrm_edtEstoque.edtRefIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
end;

procedure Tfrm_edtEstoque.MudaFocoCodigo;
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
procedure Tfrm_edtEstoque.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_edtEstoque.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

procedure Tfrm_edtEstoque.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_edtEstoque.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;


procedure Tfrm_edtEstoque.edtCodigoDblClick(Sender: TObject);
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

procedure Tfrm_edtEstoque.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtEstoque.edtCodigoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtEstoque.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtEstoque.edtFaixaTamExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

end.
