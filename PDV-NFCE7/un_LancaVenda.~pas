                             {* VERSAO COMPLETA DO SISTEMA DE VENDAS}
{* ATENCAO: --------------------------------------------------------------------------------------------}
unit un_LancaVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, Db, DBTables, Menus, inifiles,
  FileCtrl, jpeg, ExtDlgs, ColorPanelOO, LabelOO,funcoesglobais,auxiliar,variants,dataregis;

type
  Tfrm_LancaVenda = class(TForm)
    barraDicas: TPanel;
    gbItem_ProdCorTam: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    edtCor: TMaskEdit;
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
    timerClock: TTimer;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    Novavenda1: TMenuItem;
    Limparformulrio1: TMenuItem;
    N2: TMenuItem;
    Novoitem1: TMenuItem;
    Salvaritem1: TMenuItem;
    gbItem_CBarra: TPanel;
    Label16: TLabel;
    edtCBarra: TMaskEdit;
    pnDescItem2: TPanel;
    Excluiritem1: TMenuItem;
    FuncoesBaixas1: TMenuItem;
    Concluirvenda1: TMenuItem;
    Salvarvenda1: TMenuItem;
    SangriaReprovisionamento1: TMenuItem;
    botao_sair: TPanel;
    Label2: TLabel;
    edtQtde: TMaskEdit;
    pnUnidade: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    edtPreco: TMaskEdit;
    Panel6: TPanel;
    Label7: TLabel;
    pnQtdeTotal: TPanel;
    Panel3: TPanel;
    pnTotal: TPanel;
    Bevel1: TBevel;
    pnTotalVenda: TPanel;
    Gaveta1: TMenuItem;
    Impressorafiscal1: TMenuItem;
    Label5: TLabel;
    Panel2: TPanel;
    imagemEmpresa: TImage;
    pnSit: TPanel;
    pnCor: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    pnLocal3: TPanel;
    Label6: TLabel;
    edtRefFab: TMaskEdit;
    btnLocalizar: TSpeedButton;
    Image1: TImage;
    pnHora: TPanel;
    Image2: TImage;
    lblModoVenda: TLabel;
    Label1: TLabel;
    pnData: TPanel;
    pnDia: TPanel;
    pnCaixa: TPanel;
    Ajuda1: TMenuItem;
    Alterarmododevenda1: TMenuItem;
    pnExibeItens: TColorPanelOO;
    pnLoja: TPanel;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    pnSetaAbaixo: TPanel;
    Image4: TImage;
    pnSetaAcima: TPanel;
    Image5: TImage;
    pnBotaoMinimizar: TPanel;
    lblStatus: TLabel;
    lblSeq: TLabelOO;
    pnECF: TPanel;
    lbleituracbarra: TLabelOO;
    Mudarformadeleituradocdigodebarras1: TMenuItem;
    Label8: TLabel;
    edtForn: TMaskEdit;
    pnCaixaAtiva: TPanel;
    pnVend: TPanel;
    Trocarvendedor1: TMenuItem;
    Alterarpreodevenda1: TMenuItem;
    Buscaratendimento1: TMenuItem;
    gbItem_CBarra_EAN13: TPanel;
    Label9: TLabel;
    lbleituracbarra_ean13: TLabelOO;
    edtCBarraEAN13: TMaskEdit;
    pnDescItem2EAN13: TPanel;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure timerClockTimer(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Novavenda1Click(Sender: TObject);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtPrecoEnter(Sender: TObject);
    procedure edtTotalEnter(Sender: TObject);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure edtTotalExit(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure edtPrecoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCorChange(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeChange(Sender: TObject);
    procedure edtPrecoChange(Sender: TObject);
    procedure Novoitem1Click(Sender: TObject);
    procedure Salvaritem1Click(Sender: TObject);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCBarraEnter(Sender: TObject);
    procedure edtCBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizarClick(Sender: TObject);
    procedure Excluiritem1Click(Sender: TObject);
    procedure Concluirvenda1Click(Sender: TObject);
    procedure Salvarvenda1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Mudarcaixaparasituaoqualquer1Click(Sender: TObject);
    procedure Encerrarocaixa1Click(Sender: TObject);
    procedure Gaveta1Click(Sender: TObject);
    procedure Impressorafiscal1Click(Sender: TObject);
    procedure imagemEmpresaDblClick(Sender: TObject);
    procedure edtRefFabEnter(Sender: TObject);
    procedure edtRefFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtRefIntExit(Sender: TObject);
    procedure edtRefFabExit(Sender: TObject);
    procedure edtCBarraExit(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure Alterarmododevenda1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure pnBotaoMinimizarClick(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure ComandosECF1Click(Sender: TObject);
    procedure Mudarformadeleituradocdigodebarras1Click(Sender: TObject);
    procedure lblStatusDblClick(Sender: TObject);
    procedure edtFornEnter(Sender: TObject);
    procedure edtFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFornDblClick(Sender: TObject);
    procedure edtFornExit(Sender: TObject);
    procedure Trocarvendedor1Click(Sender: TObject);
    procedure edtPrecoDblClick(Sender: TObject);
    procedure Alterarpreodevenda1Click(Sender: TObject);
    procedure Buscaratendimento1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnVendDblClick(Sender: TObject);
    procedure edtCBarraEAN13Enter(Sender: TObject);
    procedure edtCBarraEAN13Exit(Sender: TObject);
    procedure edtCBarraEAN13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCBarraDblClick(Sender: TObject);
    procedure edtRefIntDblClick(Sender: TObject);
    procedure edtRefFabDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function ImpItemFiscal(FClAux:TClassAuxiliar):Boolean;
    { Private declarations }
  public
    {variaveis que servem para controlar objetos na tela - nao lidos de arquivos .INI}
    MODO: String; {'VENDEDOR' - por vendedor / 'ATENDIMENTO' - por selecao de atendimento}
    bPODE_SAIR: Boolean; {INDICA SE O LANCAMENTO DA VENDA FOI ATE O FIM}

    y_item_inicial: Integer;
    y_qtde_itens: Integer;
    y_qtde_itens_distintos: Integer;
    y_total_venda: Real;
    y_modo_venda: Integer; {0- VENDA NORMAL, 1- DEVOLUCAO, 2-TROCA SIMPLES}
    y_desconto_atendimento: Real; {desconto acumulado do ATENDIMENTO}
    {********************************************************************************************}
    y_LISTA_atendimentos: TStringList;

    Y_ImpVendaItens:String;{1-n 2-r 3-c}
    cupomaberto:Boolean;
    FCupom:String;

    {********************************************************************************************}

    {...}
    jaChamou: Boolean;
    {****************************************************************************}
    n_ordem_ctrf7: Integer;
    n_ordem_f7: Integer;
    n_cor: Real;
    n_tam: String;
    n_grupo,n_subgrupo,n_produto: Real;
    n_cor_unica: Boolean;
    n_tam_unico: Boolean;
    tipz: String;

    FListaProd:TStringList;

    {****************************************************************************}
    {  VARIAVEIS PARA A NFE  }

     lancamentoNfe : Boolean;
    {****************************************************************************}

    {****************************************************************************}
    procedure AcendoBotao (sender: TPanel; flag: Boolean);
    procedure LimparEdits;
    procedure MudaFocoCodigo;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure CalculaTotalItem;
    procedure MudaFocoCodigoItem;
    procedure ExibeItens(item_inicial: Integer);
    procedure AtualizaTotalVenda;
    procedure IniciarNovaVenda;
    procedure CalculaTotalVenda;
    function SalvarVenda:Boolean;
    function RetornaSaldoVenda:Real;
    function ExibeModoVenda(modo: Integer):String;
    function RetornaQtdeSaidas:Real;
    function RetornaQtdeEntradas:Real;
    function JaTeveDevolucao:Boolean; {*}
    function JaTeveVenda:Boolean; {*}
    function JaTeveTroca:Boolean; {*}
    function ProximoSequencialItem:Integer;
    function PodeRealizarVenda:Boolean;
    function UltimaVendaRegistradaNoEstoque:Real;
    function VerificaSeAtendimentoTemDevolucao(terminal,numero: Real):Boolean;
    function JaTeveDescontoNoPrimeiroAtendimento:Boolean;
    function VerificaSeAtendimentoTeveExcesso(terminal,numero: Real):Boolean;
    function DeletaItemVendaCupom(Grupo,SubG,Prod,Cor:Real;Tama:String):Boolean;
    function BuscaUnidadeProduto(grupo, subgrupo, produto: Real): String;
  end;

var
{Variaveis gerais}
  frm_LancaVenda: Tfrm_LancaVenda;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, procura, venda, f8SubGrupos, produtos,
  unDialogo, DM2, f8Vend, un_ConsultaProdutos, un_ExcVenda,
  unImpressoras, cadcli, un_frmConsulta1, unVersoPropostaCredito,
  unPropostaCredito, unLancReceb2, unProbIniciar, un_exibesituacao,
  un_MudarSituacao, un_fecharsessao, un_sangria, un_funcoesGaveta,
  un_funcoesImpressora, un_senhaSupervisor, un_exibeSessao, un_MudarLoja,
  un_MudarOp, unSenha, un_AjudaComandos, un_BotoesOpcoes,
  un_FechamentoVenda, unSobre, un_configLocal, un_ExportaRetaguarda,
  un_ImportaRetaguarda, un_BotoesMovimento, un_BotoesECF, DM1, un_ALERTA,
  DM6, un_ResumoConexoes, principal, un_LancaVenda_InformeVendedor,
  un_LancaVenda_AlteraPreco, un_BuscaAtendimento, caixa,cupomfiscal;

{Inicializacao dos dados do VENDAS ****}
procedure Tfrm_LancaVenda.FormCreate(Sender: TObject);
begin
  FListaProd := TStringList.create;
  CupomAberto     := false;
  Y_ImpVendaItens := 'C';

  jaChamou := false;
  MODO     := 'VENDEDOR';
  bPODE_SAIR:=true; {*}
  y_LISTA_atendimentos   := TStringList.Create;
  y_desconto_atendimento := 0.00;

     {* Configurando a INTERFACE INICIAL}
  frm_principal.windowstate := wsMaximized;
  frm_principal.left        :=0;
  frm_principal.top         :=0;
  frm_principal.width       := 810;
  frm_principal.height      := 610;
  pnExibeItens.ClearAll;

     {* Posicionando a forma de localizacao do produto *}
  gbItem_ProdCorTam.visible   := false;
  gbItem_CBarra.visible       := false;
  gbItem_CBarra_EAN13.visible := false;
  if (frm_principal.x_prevalecer_EAN13) then
  begin
    n_ordem_ctrf7 := 1;
    gbItem_CBarra_EAN13.visible := true;
  end
  else
  if (frm_principal.x_ordem_prod_cor_tam=1) then
  begin
    n_ordem_ctrf7 := 1;
    gbItem_ProdCorTam.visible   := true;
    gbItem_CBarra.visible       := false;
    gbItem_CBarra_EAN13.visible := false;
  end
  else
  if (frm_principal.x_ordem_cbarra=1) then
  begin
    n_ordem_ctrf7 := 1;
    gbItem_ProdCorTam.visible   := false;
    gbItem_CBarra.visible       := true;
    gbItem_CBarra_EAN13.visible := false;
  end;
     {*****************************************************************}
  try
    imagemEmpresa.picture.loadfromfile(frm_principal.x_imagem_logomarca);
  except
  end;

     {* Posicionando a forma de localizacao do produto *}
  pnLocal1.visible := false;
  pnLocal1.left    := 7;
  pnLocal2.visible := false;
  pnLocal2.left    := 7;
  pnLocal3.visible := false;
  pnLocal3.left    := 7;
  n_ordem_f7       :=1;
  if (frm_principal.x_ordem_codigo=1) then
    pnLocal1.visible := true
  else
  if (frm_principal.x_ordem_refinterna=1) then
    pnLocal2.visible := true
  else
  if (frm_principal.x_ordem_reffabric=1) then
    pnLocal3.visible := true;
  edtCor.text      := '';
  edtFaixaTam.text := '';
  n_cor            := -1;
  n_tam            := '-1';
  y_item_inicial   := 1;
     {*****************************************************************}
  CalculaTotalVenda;
     {*****************************************************************}
  lblStatus.caption:=frm_principal.lblStatus.caption;
     {*****************************************************************}
  lblSeq.caption := 'Última Venda: '+floattostr(frm_principal.x_codigo_venda);



end;

procedure Tfrm_LancaVenda.AcendoBotao (sender: TPanel; flag: Boolean);
begin
  if (flag) then
  begin
    sender.color := clBlue;
    sender.font.color := clWhite;
    sender.bevelinner := bvRaised;
    sender.bevelouter := bvRaised;
  end
  else
  begin
    sender.color := clTeal;
    sender.font.color := clWhite;
    sender.bevelinner := bvLowered;
    sender.bevelouter := bvRaised;
  end;
end;

procedure Tfrm_LancaVenda.timerClockTimer(Sender: TObject);
begin
  pnHora.caption := FormatDateTime('hh:nn:ss',time);
  frm_principal.n_data := date;
end;

procedure Tfrm_LancaVenda.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancaVenda.Novavenda1Click(Sender: TObject);
begin
  if (JaTeveVenda) or (JaTeveTroca) or (JaTeveDevolucao) then
    if (frmDialogo.ExibirMensagem ('Abandonar venda atual?'
      ,'Venda',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (frm_principal.x_solicitar_senha_SAIDA_LANCAMENTO_VENDA) then
      begin
        frm_senhaSupervisor.showmodal;
        if (frm_senhaSupervisor.y_flag) then
          IniciarNovaVenda;
        frm_senhaSupervisor.y_flag:=false;
      end
      else
      begin
        if frm_principal.x_ecf_habilita_modo_fiscal and
          frm_principal.x_ImpItemECF and
          CupomAberto then
          try
            frm_BotoesECF := Tfrm_BotoesECF.Create(Application);
            frm_BotoesECF.VeioVenda := true;
            frm_BotoesECF.botao4.onclick(frm_BotoesECF.botao4);
          finally
            frm_BotoesECF.Destroy;
          end;

        IniciarNovaVenda;
      end//***********************************************************************************
//***********************************************************************************
  ;
end;

procedure Tfrm_LancaVenda.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtSubGrupoEnter(Sender: TObject);
begin
  
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtQtdeEnter(Sender: TObject);
var
  clAux,clEstoque: TClassAuxiliar;
begin
     {***********************************************************************************************}
  if (n_grupo=0) or (n_subgrupo=0) or (n_produto=0) then
    if (gbItem_ProdCorTam.visible) then
      FocaCodigoLocal1
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus
    else
    if (gbItem_CBarra_EAN13.visible) then
      edtCBarraEAN13.setfocus;
     {***********************************************************************************************}
  if (Trim(edtQtde.text)='') then
    if (gbItem_CBarra.visible) then
    begin
      if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
        edtQtde.text := '1'
      else
      if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
        edtQtde.text := '';
    end
    else
    if (gbItem_CBarra_EAN13.visible) then
      if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
        edtQtde.text := '1'
      else
      if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
        edtQtde.text := '';
     {***********************************************************************************************}
  edtPreco.text := form_nc(DevolvePrecoItem (frm_principal.x_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),10);
     {***********************************************************************************************}
  pnTotal.alignment := taRightJustify;
  pnTotal.color   := clBlack;
     {***********************************************************************************************}
  if (gbItem_CBarra.visible) then
  begin
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      clEstoque := TClassAuxiliar.Create;
      clEstoque.conect   (databaseprodutos,frm_principal);
      clEstoque.ClearSql;
      clEstoque.AddParam ('Select * From ESTOQUE                                       ');
      clEstoque.AddParam ('Where  (ES_CBAR='+chr(39)+trim(edtCBarra.text)+chr(39)+')   ');
      if (not clEstoque.Execute) then
      begin
        pnTotal.caption := '[ITEM NÃO CADASTRADO]';
        pnTotal.alignment := taCenter;
        pnTotal.color   := clRed;
      end
      else
      if (trim(edtPreco.text)='') or (trim(edtPreco.text)='0,00') or (trim(edtPreco.text)='0') then
        TMaskEdit(sender).selectall
      else
        Salvaritem1.click;
      clEstoque.desconect;
      clEstoque.Free;
    end;
  end
  else
  if (gbItem_CBarra_EAN13.visible) then
  begin
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      clEstoque := TClassAuxiliar.Create;
      clEstoque.conect   (databaseprodutos,frm_principal);
      clEstoque.ClearSql;
      clEstoque.AddParam ('Select * From ESTOQUE                                            ');
      clEstoque.AddParam ('Where  (ES_CEAN='+chr(39)+trim(edtCBarraEAN13.text)+chr(39)+')   ');
      if (not clEstoque.Execute) then
      begin
        pnTotal.caption := '[ITEM NÃO CADASTRADO]';
        pnTotal.alignment := taCenter;
        pnTotal.color   := clRed;
      end
      else
      if (trim(edtPreco.text)='') or (trim(edtPreco.text)='0,00') or (trim(edtPreco.text)='0') then
        TMaskEdit(sender).selectall
      else
        Salvaritem1.click;
      clEstoque.desconect;
      clEstoque.Free;
    end;
  end
  else
    TMaskEdit(sender).selectall;
     {***********************************************************************************************}
end;

procedure Tfrm_LancaVenda.edtPrecoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtTotalEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_principal.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    ind:=ind+1;
  end;
  pnTotal.color      :=clBlack;
  pnTotal.caption    :=' Subtotal R$ ';
  pnTotal.alignment := taRightJustify;
  pnTotal.color   := clBlack;
  pnData.caption       :='';
  pnDia.caption        :='';
  pnSit.caption        :='';
  pnLoja.caption       :='';
  pnCaixa.caption      :='';
  pnVend.caption       :='';
  pnQtdeTotal.caption  :='';
  pnTotalVenda.caption :='';
  pnProduto.caption    :='';
  pnCor.caption        :='';
  pnDescItem2.caption  :='';
  pnUnidade.caption    :='';
end;

procedure Tfrm_LancaVenda.edtQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtPreco.setfocus;
  if (key=K_CIMA) then
    if (gbItem_ProdCorTam.visible) then
    begin
      if (edtFaixaTam.enabled) then
        edtFaixaTam.setfocus
      else
      if (edtCor.enabled) then
        edtCor.setfocus
      else
        FocaCodigoLocal2;
    end
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus
    else
    if (gbItem_CBarra_EAN13.visible) then
      edtCBarraEAN13.setfocus;
end;

procedure Tfrm_LancaVenda.edtPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Salvaritem1.click;
  if (key=K_CIMA) then
    edtQtde.setfocus;
end;

procedure Tfrm_LancaVenda.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_LancaVenda.edtTotalExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancaVenda.edtPrecoExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancaVenda.edtPrecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancaVenda.edtTotalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancaVenda.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_LancaVenda.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_ESC) then
    close;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_LancaVenda.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_LancaVenda.edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  grupo: Real;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodigo.setfocus;
  if (key=K_CIMA) then
    edtGrupo.setfocus;
  if (key=K_F8) then
    if (shift<>[ssCtrl]) then
      if (Trim(edtGrupo.text)<>'') then
      begin
        grupo:=strtofloat(Trim(edtGrupo.text));
        ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
      end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_ESC) then
    close;
end;


procedure Tfrm_LancaVenda.edtCodigoDblClick(Sender: TObject);
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

procedure Tfrm_LancaVenda.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_LancaVenda.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_LancaVenda.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_LancaVenda.edtRefIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  refinterna: String;
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    refinterna := Trim(edtRefInt.text);
    key_refint:=key;
    edtRefIntExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (key_refint=K_ENTER) then
      edtQtde.setfocus;
  end;
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F8) then
    btnLocalizar.click;
end;

procedure Tfrm_LancaVenda.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  grupo,subgrupo,codigo: String;
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    grupo    := Trim(edtGrupo.text);
    subgrupo := Trim(edtSubGrupo.text);
    codigo   := Trim(edtCodigo.text);
    key_codigo:=key;
    edtCodigoExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (key_codigo=K_ENTER) then
      edtQtde.setfocus;
  end;
  if (key=K_CIMA) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    if (shift<>[ssCtrl]) then
      if (Trim(edtGrupo.text)<>'') then
      begin
        grupo:=Trim(edtGrupo.text);
        subgrupo:=Trim(edtSubGrupo.text);
        ChamandoF8Produtos_2(edtCodigo,strtofloat(grupo),strtofloat(subgrupo),true);
      end;
  if (key=K_F7) then
    MudaFocoCodigo;
end;

procedure Tfrm_LancaVenda.MudaFocoCodigo;
begin
  if (gbItem_ProdCorTam.visible) then
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
end;

procedure Tfrm_LancaVenda.FocaCodigoLocal1;
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

procedure Tfrm_LancaVenda.FocaCodigoLocal2;
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

procedure Tfrm_LancaVenda.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_LancaVenda.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_LancaVenda.edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    edtQtde.setfocus;
  if (key=38) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_LancaVenda.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_LancaVenda.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
end;

procedure Tfrm_LancaVenda.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (key=13) then
      edtQtde.setfocus;
  if (key=K_ESC) then
    close;
  if (key=38) then
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
end;

procedure Tfrm_LancaVenda.CalculaTotalItem;
var
  qtde: Real;
  pvenda: Real;
begin
  if (Trim(edtQtde.text)<>'') then
    qtde:=strtofloat(RetiraFormatacaoNumero(Trim(edtQtde.text)))
  else
    qtde:=0.00;
  if (Trim(edtPreco.text)<>'') then
    pvenda:=strtofloat(RetiraFormatacaoNumero(Trim(edtPreco.text)))
  else
    pvenda:=0.00;
  pnTotal.caption:=' Subtotal R$ '+form_nc(qtde*pvenda,10);
end;

procedure Tfrm_LancaVenda.edtQtdeChange(Sender: TObject);
begin
  CalculaTotalItem;
end;

procedure Tfrm_LancaVenda.edtPrecoChange(Sender: TObject);
begin
  CalculaTotalItem;
end;

{Preparacao para insercao de um novo item ***}
procedure Tfrm_LancaVenda.Novoitem1Click(Sender: TObject);
begin
  pnTotal.color      :=clBlack;
  pnTotal.caption    :=' Subtotal R$ ';
  pnTotal.alignment := taRightJustify;
  pnTotal.color   := clBlack;
  if (gbItem_ProdCorTam.visible) then
    FocaCodigoLocal1
  else
  if (gbItem_CBarra.visible) then
    edtCBarra.setfocus
  else
  if (gbItem_CBarra_EAN13.visible) then
    edtCBarraEAN13.setfocus;
  edtGrupo.text      :='';
  edtSubGrupo.text   :='';
  edtCodigo.text     :='';
  edtRefInt.text     :='';
  edtCBarra.text     :='';
  edtCBarraEAN13.text:='';
  edtForn.text       :='';
  edtRefFab.text     :='';
  edtCor.text        :='';
  edtFaixaTam.text   :='';
  pnProduto.caption  :='';
  pnCor.caption      :='';
  pnDescItem2.caption:='';
  pnDescItem2EAN13.caption:='';
  pnUnidade.caption  :='';
  habilitaEditVerde(edtCor);
  habilitaEditVerde(edtFaixaTam);
  edtQtde.text       :='';
  edtPreco.text      :='';
  pnTotal.caption    :=' Subtotal R$ ';
end;

procedure Tfrm_LancaVenda.Salvaritem1Click(Sender: TObject);
var
  preco,qtde,total: Real;
  clAux,clEstoque: TClassAuxiliar;
  continua: Boolean;
begin
     {CRITICA AOS DADOS ***}
  if (MODO='ATENDIMENTO') then
    frmDialogo.ExibirMensagem ('Salvamento de item não permitido em modo ATENDIMENTO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (Trim(edtQtde.text)='') then
  begin
    frmDialogo.ExibirMensagem ('A qtde. do item deve ser informada!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtQtde.setfocus;
  end
  else
  if (Trim(edtPreco.text)='') or (Trim(edtPreco.text)='0,00') then
  begin
    frmDialogo.ExibirMensagem ('O preço de venda do item deve ser informado!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtPreco.setfocus;
  end
  else
  if (frm_principal.x_vendedor=0) then
    frmDialogo.ExibirMensagem ('Vendedor não definido!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (not PodeRealizarVenda) then
     {//nao precisa de mensagem}
  else
  if ((y_modo_venda=0) or (y_modo_venda=2)) and (JaTeveDevolucao) then
  begin
    frmDialogo.ExibirMensagem ('Já houve DEVOLUÇÃO na venda informada!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('VENDA / TROCA não permitida!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Novoitem1.click;
  end
  else
  if (y_modo_venda=1) and ((JaTeveVenda) or (JaTeveTroca)) then
  begin
    frmDialogo.ExibirMensagem ('Já houve VENDA / TROCA na venda informada!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('DEVOLUÇÃO não permitida!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Novoitem1.click;
  end
  else
  if (SalvarVenda) then {... - para ter certeza que salvou}
  begin
    continua := true;

    pnTotal.alignment := taRightJustify;
    pnTotal.color   := clBlack;
    clEstoque := TClassAuxiliar.Create;
    clEstoque.conect   (databaseprodutos,frm_principal);
    clEstoque.ClearSql;
    clEstoque.AddParam ('Select  ES_GRUP                                                      ');
    clEstoque.AddParam ('From    ESTOQUE                                                      ');
    if (gbItem_ProdCorTam.visible) then
    begin
      clEstoque.AddParam ('Where  (ES_GRUP='+floattostr(n_grupo)+') AND                     ');
      clEstoque.AddParam ('       (ES_SUBG='+floattostr(n_subgrupo)+') AND                  ');
      clEstoque.AddParam ('       (ES_PROD='+floattostr(n_produto)+') AND                   ');
      clEstoque.AddParam ('       (ES_CORE='+floattostr(n_cor)+') AND                       ');
      clEstoque.AddParam ('       (ES_TAMA='+chr(39)+n_tam+chr(39)+')                       ');
    end
    else
    if (gbItem_Cbarra.visible) then
      clEstoque.AddParam ('Where  (ES_CBAR='+chr(39)+trim(edtCBarra.text)+chr(39)+')        ')
    else
    if (gbItem_Cbarra_EAN13.visible) then
      clEstoque.AddParam ('Where  (ES_CEAN='+chr(39)+trim(edtCBarraEAN13.text)+chr(39)+')   ');
    if (not clEstoque.Execute) then
    begin
      pnTotal.caption   := '[ITEM NÃO CADASTRADO]';
      pnTotal.color     := clRed;
      continua          := false;
    end;
    clEstoque.desconect;
    clEstoque.Free;

                 {...}
    if (continua) then
    begin
                     {**********************************************************************}
                     {//somente o item de estoque na loja deve ser lancado automaticamente}
      if (frm_principal.x_online) then
        VerificaExistenciaDoRegistroESTOQUE_LOJA(n_grupo,n_subgrupo,n_produto,n_cor,n_tam,
          frm_principal.x_loja);
                     {**********************************************************************}
      qtde  := strtofloat(edtQtde.text); {sempre positivo}
      preco := strtofloat(RetiraFormatacaoNumero(edtPreco.text)); {sempre positivo}
      total := qtde*preco;

                     {//o total é negativo/positivo dependendo do modo de venda}
                     {*******************************************************************}
      if (y_modo_venda=0) then
        total:=total
      else
      if (y_modo_venda=1) then
        total:=(-1)*total
      else
      if (y_modo_venda=2) then
        total:=(-1)*total;

                     {*******************************************************************}
      clAux := TClassAuxiliar.Create;
      clAux.conect   ('VENDAS',self);
      clAux.AddParam ('SELECT *                          '); //simbolico
      clAux.AddParam ('FROM ITENS_VENDAS_LOCAL           ');
      clAux.AddParam ('WHERE (IV_LOJA=:loja) AND         ');
      clAux.AddParam ('      (IV_CAIX=:caixa) AND        ');
      clAux.AddParam ('      (IV_VEND=:codigo_venda) AND ');
      clAux.AddParam ('      (IV_GRUP=:grupo) AND        ');
      clAux.AddParam ('      (IV_SUBG=:subgrupo) AND     ');
      clAux.AddParam ('      (IV_PROD=:produto) AND      ');
      clAux.AddParam ('      (IV_CORE=:cor) AND          ');
      clAux.AddParam ('      (IV_TAMA=:tam) AND          ');
      clAux.AddParam ('      (IV_MODO=:modo)             ');
      clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
      clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
      clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
      clAux.consulta.parambyname('grupo').AsFloat        := n_grupo;
      clAux.consulta.parambyname('subgrupo').AsFloat     := n_subgrupo;
      clAux.consulta.parambyname('produto').AsFloat      := n_produto;
      clAux.consulta.parambyname('cor').AsFloat          := n_cor;
      clAux.consulta.parambyname('tam').AsString         := n_tam;
      clAux.consulta.parambyname('modo').AsInteger       := y_modo_venda;
      if (not clAux.Execute) then
        with (DMCaixa.qInsereItemVenda) do
        begin
          {*******************************************************************}
          parambyname('IV_SEQ').AsInteger   := ProximoSequencialItem;
          parambyname('IV_LOJA').AsFloat    := frm_principal.x_loja;
          parambyname('IV_CAIX').AsFloat    := frm_principal.x_terminal;
          parambyname('IV_VEND').AsFloat    := frm_principal.x_venda;
          parambyname('IV_TIPZ').AsString   := '1';
          parambyname('IV_GRUP').AsFloat    := n_grupo;
          parambyname('IV_SUBG').AsFloat    := n_subgrupo;
          parambyname('IV_PROD').AsFloat    := n_produto;
          parambyname('IV_TAMA').AsString   := n_tam;
          parambyname('IV_OTAM').AsInteger  := InformaOrdemTamanho(n_grupo,n_subgrupo,n_produto,n_tam);
          parambyname('IV_CORE').AsFloat    := n_cor;
          parambyname('IV_QTDE').AsFloat    := qtde;
          parambyname('IV_PVEN').AsFloat    := preco;
          parambyname('IV_TOTA').AsFloat    := total; {+ VENDA - DEVOLUCAO/TROCA}
          parambyname('IV_MODO').AsInteger  := y_modo_venda; {VENDA/DEVOLUCAO/TROCA}
          parambyname('IV_VEDE').AsFloat    := frm_principal.x_vendedor;
          parambyname('IV_DATA').AsDateTime := frm_principal.x_data_trabalho;
          parambyname('IV_PCUS').AsFloat    := 0.00;
          parambyname('IV_PAQU').AsFloat    := 0.00;
          parambyname('IV_UPCU').AsFloat    := 0.00;
          parambyname('IV_DESC').AsFloat    := 0.00;
          parambyname('IV_PDES').AsFloat    := 0.00;
          parambyname('IV_ACRE').AsFloat    := 0.00;
          parambyname('IV_PACR').AsFloat    := 0.00;
          parambyname('IV_STAT').AsString   := '1';
          {*******************************************************************}
          ExecSql;
                      //        Novoitem1.click;
        end
      else
        with (DMCaixa.qAlteraItemVenda) do
        begin
          {*******************************************************************}
          parambyname('IV_LOJA').AsFloat   := frm_principal.x_loja;
          parambyname('IV_CAIX').AsFloat   := frm_principal.x_terminal;
          parambyname('IV_VEND').AsFloat   := frm_principal.x_venda;
          parambyname('IV_GRUP').AsFloat   := n_grupo;
          parambyname('IV_SUBG').AsFloat   := n_subgrupo;
          parambyname('IV_PROD').AsFloat   := n_produto;
          parambyname('IV_TAMA').AsString  := n_tam;
          parambyname('IV_CORE').AsFloat   := n_cor;
          parambyname('IV_QTDE').AsFloat   := qtde;
          parambyname('IV_PVEN').AsFloat   := preco;
          parambyname('IV_TOTA').AsFloat   := total; {+ VENDA - DEVOLUCAO/TROCA}
          ExecSql;
          {*******************************************************************}
          //          Novoitem1.click;
          {*******************************************************************}
        end;

      if frm_principal.x_ecf_habilita_modo_fiscal and
        frm_principal.x_ImpItemECF and
        (y_modo_venda = 0) and
        (Y_ImpVendaItens = 'C') then
      begin

//                           If Not ClAux.Consulta.Eof and ({(ClAux.Result('IV_QTDE') > Qtde) or} (ClAux.Result('IV_PVEN') <> preco)) Then begin
  {                           DeletaItemVendaCupom(N_Grupo,
                                                  N_SubGrupo,
                                                  N_Produto,
                                                  N_Cor,
                                                  N_Tam);
                           end;

                            If (ClAux.Result('IV_QTDE') > Qtde) Then
                             Qtde := ClAux.Result('IV_QTDE') - Qtde;}

        claux.consulta.sql[0] := 'Select Cast('+trocapalavra(FloatToStr(Qtde),',','.')+' '+
          ' as Float) as Iv_Qtde,ITENS_VENDAS_LOCAL.*';
        Claux.Consulta.Close;
        Claux.Consulta.Open;
        if not impitemfiscal(ClAux) then
          exit;
        self.refresh;
      end;

      Novoitem1.click;


      clAux.desconect;
      clAux.Free;
      {*******************************************************************}
      bPODE_SAIR:=false; {*}
      {*******************************************************************}
      ExibeItens(y_item_inicial); {...}
      {*******************************************************************}
      if (y_qtde_itens_distintos>8) then
        if ((y_qtde_itens_distintos - y_item_inicial)>=8) then
        begin
          y_item_inicial := y_item_inicial + 8;
          ExibeItens(y_item_inicial);
        end;
      AtualizaTotalVenda;
      {*******************************************************************}
    end;
  end{**************************************************************}{**************************************************************};
end;

procedure Tfrm_LancaVenda.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Claux:TClassAuxiliar;
begin

  if (key=K_ESC) then
    close;
{     if (shift=[ssShift, ssAlt]) then
     begin
          if (key=K_INSERT) then
          begin
               if (tipz='1') then tipz:='2'
               else if (tipz='2') then tipz:='1';
               Label4.caption:='Qtde '+tipz;
          end;
     end;}
  if frm_principal.x_ecf_habilita_modo_fiscal and
    frm_principal.x_ImpItemECF and
    (shift=[ssShift, ssAlt]) and
    (y_modo_venda<>1) and
    (key=K_INSERT)  then
  begin

    if (Y_ImpVendaItens = 'C') and CupomAberto then
      if not (frmDialogo.ExibirMensagem ('Venda com cupom fiscal Aberto.      Cancela Cupom e Continua?'
        ,'Venda',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        exit
      else
        try
          frm_BotoesECF := Tfrm_BotoesECF.Create(Application);
          frm_BotoesECF.VeioVenda := true;
          frm_BotoesECF.botao4.onclick(frm_BotoesECF.botao4);
        finally
          frm_BotoesECF.Destroy;
        end;




    if (Y_ImpVendaItens <> 'C') then
      Y_ImpVendaItens := 'C'
    else
    if (Frm_fechamentoVenda = nil) or (Frm_fechamentoVenda.lblNDoc2.caption = 'C') then
      Y_ImpVendaItens := 'N'
    else
      Y_ImpVendaItens := Frm_fechamentoVenda.lblNDoc2.caption;

    if Y_ImpVendaItens = 'C' then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   ('VENDAS',self);
      clAux.AddParam ('SELECT *                          '); //simbolico
      clAux.AddParam ('FROM ITENS_VENDAS_LOCAL           ');
      clAux.AddParam ('WHERE (IV_LOJA=:loja) AND         ');
      clAux.AddParam ('      (IV_CAIX=:caixa) AND        ');
      clAux.AddParam ('      (IV_VEND=:codigo_venda) AND ');
      clAux.AddParam ('      (IV_MODO=:modo)             ');
      clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
      clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
      clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
      clAux.consulta.parambyname('modo').AsInteger       := 0;
      claux.consulta.open;
      while not ClAux.Eof do
      begin
        if (FListaProd.IndexOf(formatfloat('0000000000',Claux.result('IV_Grup'))+
          formatfloat('0000000000',Claux.result('IV_SubG'))+
          formatfloat('0000000000',Claux.result('IV_Prod'))+
          formatfloat('0000000000',Claux.result('IV_Core'))+
          Claux.result('IV_Tama')+'*') = -1) and
          not ImpItemFiscal(Claux) then
          exit;
        claux.next;
      end;
//            claux
      pnEcf.caption    := frm_principal.pnEcf.caption+' Cupom '+formatfloat('00000',StrtofloatN(FCupom));
      pnEcf.color      := clblack;
      pnEcf.font.color := clYellow;
    end
    else
    begin
      pnEcf.caption    := frm_principal.pnEcf.caption;
      pnEcf.color      := clteal;
      pnEcf.font.color := clWhite;
    end;

  end;
  if (shift=[ssCtrl]) then
    if (key=K_F7) then
      MudaFocoCodigoItem;
  if (key=K_PGUP) then
    if (y_qtde_itens_distintos<>0) then
      if (y_item_inicial>8) then
      begin
        y_item_inicial:=y_item_inicial-8;
        ExibeItens(y_item_inicial);
      end
      else
      if (y_item_inicial=1) then
      begin
        y_item_inicial:=1;
        ExibeItens(y_item_inicial);
      end;
  if (key=K_PGDOWN) then
    if (y_qtde_itens_distintos<>0) then
      if ((y_qtde_itens_distintos - y_item_inicial)>=8) then
      begin
        y_item_inicial := y_item_inicial + 8;
        ExibeItens(y_item_inicial);
      end;
end;

procedure Tfrm_LancaVenda.MudaFocoCodigoItem;
begin
  gbItem_CBarra_EAN13.visible := false;
  gbItem_CBarra.visible       := false;
  gbItem_ProdCorTam.visible   := false;
  n_ordem_ctrf7 := n_ordem_ctrf7 + 1;
  if (n_ordem_ctrf7=4) then
    n_ordem_ctrf7:=1;
  if (frm_principal.x_ordem_cbarra=n_ordem_ctrf7) then
  begin
    gbItem_CBarra.visible     := true;
    edtCBarra.setfocus;
  end
  else
  if (frm_principal.x_ordem_prod_cor_tam=n_ordem_ctrf7) then
  begin
    gbItem_ProdCorTam.visible := true;
    FocaCodigoLocal1;
  end
  else
  if (frm_principal.x_ordem_cbarra_ean13=n_ordem_ctrf7) then
  begin
    gbItem_CBarra_EAN13.visible := true;
    edtCBarraEAN13.setfocus;
  end;
end;

procedure Tfrm_LancaVenda.edtCBarraEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtCBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clAux: TClassAuxiliar;
  cbarra: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    cbarra := Trim(edtCBarra.text);
    edtCBarraExit(Sender);
    edtQtde.setfocus;
  end;
  if (key=K_CIMA) then;
  if (key=K_F8) then
    btnLocalizar.click;
end;

procedure Tfrm_LancaVenda.btnLocalizarClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
  frm_ConsultaProduto.codigo_loja := frm_principal.x_loja;
  if (pnLocal3.visible) then
    if (trim(edtForn.text)<>'') then
    begin
      frm_ConsultaProduto.codigo_fornecedor := strtofloat(trim(edtForn.text));
      frm_ConsultaProduto.edtForn.text      := trim(edtForn.text);
      frm_ConsultaProduto.edtForn2.text     := trim(edtForn.text);
    end;
  frm_ConsultaProduto.y_RotinaChamadora:=0;
  frm_ConsultaProduto.showmodal;
  if (frm_ConsultaProduto.ultima_tecla_pressionada=K_ENTER) then
    if (frm_ConsultaProduto.y_grupo<>'?') then
    begin
      edtGrupo.text    := frm_ConsultaProduto.y_grupo;
      edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
      edtCodigo.text   := frm_ConsultaProduto.y_produto;
      edtRefInt.text   := frm_ConsultaProduto.y_refint;
      edtRefFab.text   := frm_ConsultaProduto.y_reffab;
      edtCBarra.text   := frm_ConsultaProduto.y_codigo_barra;
      edtCor.text      := frm_ConsultaProduto.y_cor;
      edtFaixaTam.text := frm_ConsultaProduto.y_tam;
      if (frm_principal.x_onlinevpn) then
        if (gbItem_ProdCorTam.visible) then
          FocaCodigoLocal1
        else
        if (gbItem_CBarra.visible) then
          edtCBarra.setfocus
        else
        if (gbItem_CBarra_EAN13.visible) then
          edtCBarraEAN13.setfocus
        else
        begin
          edtCorExit(self);
          edtFaixaTamExit(self);
          edtQtde.setfocus; {***}
        end;   
    end
    else
      Limparformulrio1.click;
  frm_ConsultaProduto.Free;
end;

procedure Tfrm_LancaVenda.ExibeItens(item_inicial: Integer);
var
  itens_exibidos,total_itens_a_serem_exibidos: Integer;
  codigo_barras,tamanho,descricao: String;
  clAux: TClassAuxiliar;
  total: Real;
  cor_item,ind: Integer;
  stModo: String;
  unidade: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.AddParam ('SELECT * FROM ITENS_VENDAS_LOCAL  ');
  clAux.AddParam ('WHERE (IV_LOJA=:loja) AND         ');
  clAux.AddParam ('      (IV_CAIX=:caixa) AND        ');
  clAux.AddParam ('      (IV_VEND=:codigo_venda) AND ');
  clAux.AddParam ('      (IV_SEQ>='+inttostr(item_inicial)+')');
  clAux.AddParam ('ORDER BY IV_SEQ                   ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
  pnExibeItens.ClearAll;
     {pnExibeItens.SetFontConfig('Courier New',12,[fsBold],clWhite);
     pnExibeItens.AddLine ('------------- ITENS DA VENDA ------------',clBlack);
     pnExibeItens.AddLine (' Sq  Cod            Descricao do item    ',clBlack);
     pnExibeItens.AddLine ('         Cor  Tam    Qtde   Preço  Total ',clBlack);
     pnExibeItens.AddLine ('-----------------------------------------',clBlack);}
  pnExibeItens.SetFontConfig('Courier New',10,[fsBold],clWhite);
  pnExibeItens.AddLine ('------------------- ITENS DA VENDA -------------------',clBlack);
  pnExibeItens.AddLine (' Sq  Cod            Descricao do item        Unidade  ',clBlack);
  pnExibeItens.AddLine ('      Cor   Tam       Qtde    Preço      Total        ',clBlack);
  pnExibeItens.AddLine ('------------------------------------------------------',clBlack);
  if (clAux.Execute) then
  begin
    itens_exibidos := 1;
    total_itens_a_serem_exibidos := 8; {* fixo, depende da fonte de exibicao}
    clAux.first;
    while (not clAux.eof) and
      (itens_exibidos<=total_itens_a_serem_exibidos) do
    begin
               {************************************************************}
      descricao     := Trim(ProcuraNomeProdutos_1 (
        clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        self));

      if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO) then
        codigo_barras := form_t(RetornaCodigoDeBarrasDoItem(clAux.result('IV_GRUP'),
          clAux.result('IV_SUBG'),
          clAux.result('IV_PROD'),
          clAux.result('IV_CORE'),
          clAux.result('IV_TAMA')),14)
      else
      if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_EAN13) then
        codigo_barras := form_t(RetornaEAN13DoItem(clAux.result('IV_GRUP'),
          clAux.result('IV_SUBG'),
          clAux.result('IV_PROD'),
          clAux.result('IV_CORE'),
          clAux.result('IV_TAMA')),14);

      total         := clAux.result('IV_TOTA');
      if (Trim(clAux.result('IV_TAMA'))<>'0') then
        tamanho  := clAux.result('IV_TAMA')
      else
        tamanho  := 'UNICO';
               {************************************************************}
      if (clAux.result('IV_MODO')=0) then {VENDA}
      begin
        cor_item := clBlack;
        stModo:='V';
      end
      else
      if (clAux.result('IV_MODO')=1) then
      begin
        cor_item := clRed;
        stModo:='D';
      end {DEVOLUCAO}
      else
      if (clAux.result('IV_MODO')=2) then
      begin
        cor_item := clBlue;
        stModo:='T';
      end; {TROCA}

      unidade := BuscaUnidadeProduto(clAux.Result('IV_GRUP'),clAux.Result('IV_SUBG'),clAux.Result('IV_PROD'));
      {************************************************************}
      ind := clAux.result('IV_SEQ');
               {pnExibeItens.AddLine(' '+
                                    form_nz (ind,2)+'. '+
                                    form_t  (codigo_barras,14)+' '+
                                    form_t  (descricao,25)+' '+
                                    stModo,
                                    cor_item);}
      pnExibeItens.AddLine(' '+
        form_nz (ind,2)+'. '+
        form_t  (codigo_barras,14)+' '+
        form_t  (descricao,23)+'  '+
        form_t  (unidade,5),
        cor_item);
      if (RetornaApelidoEmpresa='PONTO DO AR') or (RetornaApelidoEmpresa='ESTACAO DO AR') then
        pnExibeItens.AddLine('      '+form_t (ProcuraAbrevCor(clAux.result('IV_CORE'),self),5)+' '+
          form_t  (tamanho,5)    +'     '+
          form_t(Trim(form_nc2(clAux.result('IV_QTDE'),8,3)),8)+''+
          form_t(Trim(form_nc (clAux.result('IV_PVEN'),10)),11)+''+
          Trim(form_nc (total,10)),
          cor_item)
      else
        pnExibeItens.AddLine('      '+form_t (ProcuraAbrevCor(clAux.result('IV_CORE'),self),5)+' '+
          form_t  (tamanho,5)    +' '+
          form_n  (clAux.result('IV_QTDE'),4)+' '+
          form_nc (clAux.result('IV_PVEN'),10)+' '+
          form_nc (total,8),
          cor_item);
      {************************************************************}
      itens_exibidos := itens_exibidos + 1;

               {---->}
      clAux.next;
    end;
  end;
  pnExibeItens.AddLine('',clBlack);
  CalculaTotalVenda;
  clAux.desconect;
  clAux.Free;
     {************************************************************}
  if ((y_qtde_itens_distintos - y_item_inicial)>=8) then
    pnSetaAbaixo.visible:=true
  else
    pnSetaAbaixo.visible:=false;
     {************************************************************}
  if (y_item_inicial>8) then
    pnSetaAcima.visible:=true
  else
    pnSetaAcima.visible:=false;
     {************************************************************}
end;

function Tfrm_LancaVenda.SalvarVenda:Boolean;
var
  clAux,clAux2: TClassAuxiliar;
  clAux3: TClassAuxiliar;
  icms: Real;
begin
     {CRITICA AOS DADOS}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux2 := TClassAuxiliar.Create;
  clAux2.conect  ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM VENDAS_LOCAL                     ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                      ');
  clAux.AddParam ('      (VE_CAIX=:caixa) AND                     ');
  clAux.AddParam ('      (VE_CODI=:codigo_venda)                  ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
  if (not clAux.Execute) then
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO VENDAS_LOCAL                 ');
    clAux2.AddParam (' (VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,       ');
    clAux2.AddParam ('  VE_OPER,VE_CLIE,VE_CONT,VE_TOTA,       ');
    clAux2.AddParam ('  VE_QTDE,VE_STAT,VE_QTD1,VE_QTD2,       ');
    clAux2.AddParam ('  VE_TIPZ,VE_CUPO,VE_VEND,VE_ONLI,       ');
    clAux2.AddParam ('  VE_ICMS,VE_ALIQ,VE_ENVI,VE_FUNC,       ');
    clAux2.AddParam ('  VE_CPF,VE_NOME,VE_FONE,VE_ECF,         ');
    clAux2.AddParam ('  VE_SERI,VE_NOTA,VE_DESC,VE_PDES,       ');
    clAux2.AddParam ('  VE_COMI)                               ');
    clAux2.AddParam ('VALUES                                   ');
    clAux2.AddParam (' (:VE_CAIX,:VE_LOJA,:VE_CODI,:VE_DATA,   ');
    clAux2.AddParam ('  :VE_OPER,:VE_CLIE,:VE_CONT,:VE_TOTA,   ');
    clAux2.AddParam ('  :VE_QTDE,:VE_STAT,:VE_QTD1,:VE_QTD2,   ');
    clAux2.AddParam ('  :VE_TIPZ,:VE_CUPO,:VE_VEND,:VE_ONLI,   ');
    clAux2.AddParam ('  :VE_ICMS,:VE_ALIQ,:VE_ENVI,:VE_FUNC,   ');
    clAux2.AddParam ('  :VE_CPF,:VE_NOME,:VE_FONE,:VE_ECF,     ');
    clAux2.AddParam ('  :VE_SERI,:VE_NOTA,:VE_DESC,:VE_PDES,   ');
    clAux2.AddParam ('  :VE_COMI)                              ');
    clAux2.consulta.parambyname('VE_LOJA').AsFloat    := frm_principal.x_loja;
    clAux2.consulta.parambyname('VE_CAIX').AsFloat    := frm_principal.x_terminal;
    clAux2.consulta.parambyname('VE_CODI').AsFloat    := frm_principal.x_venda;
    clAux2.consulta.parambyname('VE_FUNC').AsFloat    := frm_principal.x_caixa_ativo;
    clAux2.consulta.parambyname('VE_DATA').AsDateTime := date;
    clAux2.consulta.parambyname('VE_OPER').AsFloat    := frm_principal.x_caixa_ativo;
    clAux2.consulta.parambyname('VE_CLIE').AsFloat    := 0;
    clAux2.consulta.parambyname('VE_CONT').AsFloat    := 0;
    if (pnTotalVenda.caption<>'') then
      clAux2.consulta.parambyname('VE_TOTA').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnTotalVenda.caption))
    else
      clAux2.consulta.parambyname('VE_TOTA').AsFloat  := 0.00;
    clAux2.consulta.parambyname('VE_COMI').AsFloat       := clAux2.consulta.parambyname('VE_TOTA').AsFloat;
    if (pnQtdeTotal.caption<>'') then
      clAux2.consulta.parambyname('VE_QTDE').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnQtdeTotal.caption))
    else
      clAux2.consulta.parambyname('VE_QTDE').AsFloat  := 0;
    clAux2.consulta.parambyname('VE_QTD1').AsFloat  := 0;
    clAux2.consulta.parambyname('VE_QTD2').AsFloat  := 0;
    clAux2.consulta.parambyname('VE_STAT').AsString := '0';
    clAux2.consulta.parambyname('VE_TIPZ').AsString := '1';
    clAux2.consulta.parambyname('VE_CUPO').AsFloat  := 0;
    clAux2.consulta.parambyname('VE_VEND').AsFloat  := -1; //vendedor ainda nao definido
    clAux2.consulta.parambyname('VE_CPF').AsString  := '';
    clAux2.consulta.parambyname('VE_NOME').AsString := '';
    clAux2.consulta.parambyname('VE_FONE').AsString := '';
    clAux2.consulta.parambyname('VE_SERI').AsString := '';
    clAux2.consulta.parambyname('VE_NOTA').AsString := '';
    if (MODO='ATENDIMENTO') then
      clAux2.consulta.parambyname('VE_DESC').AsFloat  := y_desconto_atendimento
    else
    if (MODO='VENDEDOR') then
      clAux2.consulta.parambyname('VE_DESC').AsFloat  := 0.00; //desconto
    clAux2.consulta.parambyname('VE_PDES').AsFloat  := 0.00;
    if (frm_principal.x_online) then
    begin
      clAux2.consulta.parambyname('VE_ONLI').AsString := '1';
      clAux2.consulta.parambyname('VE_ENVI').AsString := '1';
    end
    else
    begin
      clAux2.consulta.parambyname('VE_ONLI').AsString := '0';
      clAux2.consulta.parambyname('VE_ENVI').AsString := '0';
    end;
    clAux2.consulta.parambyname('VE_ECF').AsInteger := 0;

          {***}
    clAux3 := TClassAuxiliar.Create;
    clAux3.conect   (databaseprodutos,self);
    clAux3.ClearSql;
    clAux3.AddParam ('SELECT *                                  ');
    clAux3.AddParam ('FROM  ALIQUOTAS_PRODUTOS                  ');
    clAux3.AddParam ('WHERE (AP_GRUP=1) AND                     ');
    clAux3.AddParam ('      (AP_SUBG=1) AND                     ');
    clAux3.AddParam ('      (AP_PROD=1) AND                     ');
    clAux3.AddParam ('      (AP_ESTA='+chr(39)+frm_principal.x_uf+chr(39)+')  ');
    if (clAux3.Execute) then
    begin
      icms := clAux3.result('AP_ICMS');
      clAux2.consulta.parambyname('VE_ICMS').AsFloat  := clAux2.consulta.parambyname('VE_TOTA').AsFloat*(icms/100);
      clAux2.consulta.parambyname('VE_ALIQ').AsFloat  := icms;
    end
    else
    begin
      clAux2.consulta.parambyname('VE_ICMS').AsFloat  := 0.00;
      clAux2.consulta.parambyname('VE_ALIQ').AsFloat  := 0.00;
    end;
    clAux3.desconect;
    clAux3.Free;
          {***}
    clAux2.Execute;
  end
  else
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('UPDATE VENDAS_LOCAL                      ');
    clAux2.AddParam ('SET VE_CAIX=:VE_CAIX,VE_LOJA=:VE_LOJA,   ');
    clAux2.AddParam ('    VE_CODI=:VE_CODI,VE_CONT=:VE_CONT,   ');
    clAux2.AddParam ('    VE_OPER=:VE_OPER,VE_CLIE=:VE_CLIE,   ');
    clAux2.AddParam ('    VE_QTDE=:VE_QTDE,VE_STAT=:VE_STAT,   ');
    clAux2.AddParam ('    VE_TIPZ=:VE_TIPZ,VE_CUPO=:VE_CUPO,   ');
    clAux2.AddParam ('    VE_VEND=:VE_VEND,VE_TOTA=:VE_TOTA,   ');
    clAux2.AddParam ('    VE_ALIQ=:VE_ALIQ,VE_ICMS=:VE_ICMS,   ');
    clAux2.AddParam ('    VE_CPF =:VE_CPF ,VE_NOME=:VE_NOME,   ');
    clAux2.AddParam ('    VE_FONE=:VE_FONE,VE_DESC=:VE_DESC,   ');
    clAux2.AddParam ('    VE_SERI=:VE_SERI,VE_NOTA=:VE_NOTA,   ');
    clAux2.AddParam ('    VE_PDES=:VE_PDES,VE_QTD1=:VE_QTD1,   ');
    clAux2.AddParam ('    VE_QTD2=:VE_QTD2,VE_ONLI=:VE_ONLI,   ');
    clAux2.AddParam ('    VE_ENVI=:VE_ENVI,VE_ECF =:VE_ECF,    ');
    clAux2.AddParam ('    VE_FUNC=:VE_FUNC,VE_COMI=:VE_COMI    ');
    clAux2.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND             ');
    clAux2.AddParam ('      (VE_CAIX=:VE_CAIX) AND             ');
    clAux2.AddParam ('      (VE_CODI=:VE_CODI)                 ');
    clAux2.consulta.parambyname('VE_LOJA').AsFloat  := frm_principal.x_loja;
    clAux2.consulta.parambyname('VE_CAIX').AsFloat  := frm_principal.x_terminal;
    clAux2.consulta.parambyname('VE_CODI').AsFloat  := frm_principal.x_venda;
    clAux2.consulta.parambyname('VE_FUNC').AsFloat  := frm_principal.x_caixa_ativo;
    clAux2.consulta.parambyname('VE_OPER').AsFloat  := frm_principal.x_caixa_ativo;
    clAux2.consulta.parambyname('VE_CLIE').AsFloat  := clAux.result('VE_CLIE');
    clAux2.consulta.parambyname('VE_CONT').AsFloat  := clAux.result('VE_CONT');
    if (pnTotalVenda.caption<>'') then
      clAux2.consulta.parambyname('VE_TOTA').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnTotalVenda.caption))
    else
      clAux2.consulta.parambyname('VE_TOTA').AsFloat  := 0.00;
    clAux2.consulta.parambyname('VE_COMI').AsFloat       := clAux2.consulta.parambyname('VE_TOTA').AsFloat;
    if (pnQtdeTotal.caption<>'') then
      clAux2.consulta.parambyname('VE_QTDE').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnQtdeTotal.caption))
    else
      clAux2.consulta.parambyname('VE_QTDE').AsFloat  := 0.00;
    clAux2.consulta.parambyname('VE_QTD1').AsFloat  := 0;
    clAux2.consulta.parambyname('VE_QTD2').AsFloat  := 0;
    clAux2.consulta.parambyname('VE_STAT').AsString := clAux.result('VE_STAT');
    clAux2.consulta.parambyname('VE_TIPZ').AsString := '1';
    clAux2.consulta.parambyname('VE_CUPO').AsFloat  := clAux.result('VE_CUPO');
    clAux2.consulta.parambyname('VE_VEND').AsFloat  := -1;
    clAux2.consulta.parambyname('VE_ICMS').AsFloat  := clAux.result('VE_ICMS');
    clAux2.consulta.parambyname('VE_ALIQ').AsFloat  := clAux.result('VE_ALIQ');
    clAux2.consulta.parambyname('VE_CPF').AsString  := clAux.result('VE_CPF');
    clAux2.consulta.parambyname('VE_NOME').AsString := clAux.result('VE_NOME');
    clAux2.consulta.parambyname('VE_FONE').AsString := clAux.result('VE_FONE');
    clAux2.consulta.parambyname('VE_SERI').AsString := clAux.result('VE_SERI');
    clAux2.consulta.parambyname('VE_NOTA').AsString := clAux.result('VE_NOTA');
    if (MODO='ATENDIMENTO') then
      clAux2.consulta.parambyname('VE_DESC').AsFloat  := clAux.result('VE_DESC') + y_desconto_atendimento
    else
    if (MODO='VENDEDOR') then
      clAux2.consulta.parambyname('VE_DESC').AsFloat  := 0.00; //desconto
    clAux2.consulta.parambyname('VE_PDES').AsFloat  := 0.00;
    clAux2.consulta.parambyname('VE_ENVI').AsString := '0'; //inicia como nao enviado
    if (frm_principal.x_online) then
    begin
      clAux2.consulta.parambyname('VE_ONLI').AsString := '1';
      clAux2.consulta.parambyname('VE_ENVI').AsString := '1';
    end
    else
    begin
      clAux2.consulta.parambyname('VE_ONLI').AsString := '0';
      clAux2.consulta.parambyname('VE_ENVI').AsString := '0';
    end;
    clAux2.consulta.parambyname('VE_ECF').AsInteger := 0;
    clAux2.Execute;
  end;
  clAux.desconect;
  clAux.Free;
  clAux2.desconect;
  clAux2.Free;
  result := true;
end;

procedure Tfrm_LancaVenda.Excluiritem1Click(Sender: TObject);
var
  FGrupo,fsubg,fprod,fcor:Real;
  ftama:String;
begin
  if (MODO='ATENDIMENTO') then
    frmDialogo.ExibirMensagem ('Exclusão de item não permitido em modo ATENDIMENTO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (frm_principal.x_venda=0) then
    frmDialogo.ExibirMensagem ('Informe o código da venda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  begin
    Application.CreateForm(Tfrm_ExcVenda,frm_ExcVenda);
    with (frm_ExcVenda.qItens) do
    begin
      close;
      parambyname('loja').AsFloat         := frm_principal.x_loja;
      parambyname('caixa').AsFloat        := frm_principal.x_terminal;
      parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
      open;
    end;
    if frm_principal.x_ecf_habilita_modo_fiscal and
      frm_principal.x_ImpItemECF and
      (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) and
      (y_modo_venda = 0) and
      (Y_ImpVendaItens = 'C') then
    begin
      frm_excvenda.OnKeyDown := frm_excvenda.Grade.OnKeyDown;
      frm_excvenda.grade.enabled := false;
      frm_excvenda.QItens.First;
      fgrupo := StrtoFloat(copy(FListaProd[FListaProd.Count - 1],1,10));
      fsubg  := StrtoFloatN(copy(FListaProd[FListaProd.Count - 1],11,10));
      fprod  := StrtoFloatN(copy(FListaProd[FListaProd.Count - 1],21,10));
      fcor   := StrtoFloatN(copy(FListaProd[FListaProd.Count - 1],31,10));
      ftama  := copy(FListaProd[FListaProd.Count - 1],41,Pos('*',FListaProd[FListaProd.Count - 1]) - 41);
      while not frm_excvenda.QItens.eof do
      begin
        if (frm_excvenda.QItens.FieldbYName('Iv_Grup').AsFloat = fgrupo) and
          (frm_excvenda.QItens.FieldbYName('Iv_SubG').AsFloat = FSubG) and
          (frm_excvenda.QItens.FieldbYName('Iv_Prod').AsFloat = Fprod) and
          (frm_excvenda.QItens.FieldbYName('Iv_Core').AsFloat = FCor) and
          (frm_excvenda.QItens.FieldbYName('Iv_Tama').AsString = Ftama) then
          break;
        frm_excvenda.QItens.next;
      end;
    end;



    frm_ExcVenda.showmodal;
    frm_ExcVenda.Free;
          {*********************************************************************}
    ExibeItens(y_item_inicial); {...}
    AtualizaTotalVenda;
          {*********************************************************************}
  end;
end;

procedure Tfrm_LancaVenda.AtualizaTotalVenda;
var
  clAux2,clAux3: TClassAuxiliar;
  icms: Real;
begin
  clAux2 := TClassAuxiliar.Create;
  clAux2.conect   ('VENDAS',self);
  clAux2.ClearSql;
  clAux2.AddParam ('UPDATE VENDAS_LOCAL           ');
  clAux2.AddParam ('SET    VE_ALIQ=:VE_ALIQ,      ');
  clAux2.AddParam ('       VE_ICMS=:VE_ICMS,      ');
  clAux2.AddParam ('       VE_TOTA=:VE_TOTA,      ');
  clAux2.AddParam ('       VE_QTDE=:VE_QTDE,      ');
  clAux2.AddParam ('       VE_QTD1=:VE_QTD1,      ');
  clAux2.AddParam ('       VE_QTD2=:VE_QTD2       ');
  clAux2.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND  ');
  clAux2.AddParam ('      (VE_CAIX=:VE_CAIX) AND  ');
  clAux2.AddParam ('      (VE_CODI=:VE_CODI)      ');
  clAux2.consulta.parambyname('VE_LOJA').AsFloat  := frm_principal.x_loja;
  clAux2.consulta.parambyname('VE_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux2.consulta.parambyname('VE_CODI').AsFloat  := frm_principal.x_venda;
  if (pnTotalVenda.caption<>'') then
    clAux2.consulta.parambyname('VE_TOTA').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnTotalVenda.caption))
  else
    clAux2.consulta.parambyname('VE_TOTA').AsFloat  := 0.00;
  if (pnQtdeTotal.caption<>'') then
    clAux2.consulta.parambyname('VE_QTDE').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnQtdeTotal.caption))
  else
    clAux2.consulta.parambyname('VE_QTDE').AsFloat  := 0.00;
  clAux2.consulta.parambyname('VE_QTD1').AsFloat  := RetornaQtdeSaidas; {saidas}
  clAux2.consulta.parambyname('VE_QTD2').AsFloat  := RetornaQtdeEntradas; {entradas}
    {***}
  clAux3 := TClassAuxiliar.Create;
  clAux3.conect   (databaseprodutos,self);
  clAux3.ClearSql;
  clAux3.AddParam ('SELECT *                                  ');
  clAux3.AddParam ('FROM  ALIQUOTAS_PRODUTOS                  ');
  clAux3.AddParam ('WHERE (AP_GRUP=1) AND                     ');
  clAux3.AddParam ('      (AP_SUBG=1) AND                     ');
  clAux3.AddParam ('      (AP_PROD=1) AND                     ');
  clAux3.AddParam ('      (AP_ESTA='+chr(39)+frm_principal.x_uf+chr(39)+')  ');
  if (clAux3.Execute) then
  begin
    icms := clAux3.result('AP_ICMS');
    clAux2.consulta.parambyname('VE_ICMS').AsFloat  := clAux2.consulta.parambyname('VE_TOTA').AsFloat*(icms/100);
    clAux2.consulta.parambyname('VE_ALIQ').AsFloat  := icms;
  end
  else
  begin
    clAux2.consulta.parambyname('VE_ICMS').AsFloat  := 0.00;
    clAux2.consulta.parambyname('VE_ALIQ').AsFloat  := 0.00;
  end;
  clAux3.desconect;
  clAux3.Free;
    {***}
  clAux2.Execute;
  clAux2.desconect;
  clAux2.Free;
end;

procedure Tfrm_LancaVenda.Concluirvenda1Click(Sender: TObject);
var
  flagExisteExcesso: Boolean;
  terminalatendimento: Real;
  codigoatendimento: Real;
  i: Integer;
begin
     {*****************  Tecla F9 **********************************************************************}
if (y_qtde_itens_distintos=0) then
    frmDialogo.ExibirMensagem ('Não foram informados itens para a venda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (JaTeveTroca) and (not JaTeveVenda) then
  begin
    frmDialogo.ExibirMensagem ('Informe o item que será TROCADO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Novoitem1.click;
  end
  else
  begin
          {* com total >0.00}
    Application.CreateForm(Tfrm_FechamentoVenda, frm_FechamentoVenda);
    try
      frm_FechamentoVenda.imagemEmpresa.picture.loadfromfile(frm_principal.x_imagem_logomarca);
    except
    end;
    frm_FechamentoVenda.y_caixa := frm_principal.x_terminal;
    frm_FechamentoVenda.y_loja  := frm_principal.x_loja;
    frm_FechamentoVenda.y_venda := frm_principal.x_venda;
    if (MODO='VENDEDOR') then
    begin
      if (Trim(pnTotalVenda.caption)<>'') then
        frm_FechamentoVenda.y_total_venda := strtofloat(RetiraFormatacaoNumero(Trim(pnTotalVenda.caption)))
      else
        frm_FechamentoVenda.y_total_venda := 0.00;

      {*** PROCEDIMENTO DE ZERAR A VENDA FOI RETIRADO DEVIDO A INCOSISTÊNCIA DE VALORES ***}
      {*** QUE ESTAVAM SENDO GERADOS PARA O RETAGUARDA, GERANDO ASSIM UMA DIFERENÇA EM RELATÓRIOS ***}
      {*** 08/02/2011 ***}
      {if (frm_FechamentoVenda.y_total_venda<0.00) and
        (JaTeveTroca) then //SO PODE PERGUNTAR PARA O CASO DE HAVER 'TROCA'
        if (frmDialogo.ExibirMensagem ('Excesso na Troca,              Deseja ZERAR a VENDA?'
          ,'Troca de mercadoria',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          frm_FechamentoVenda.y_total_venda := 0.00
        else
          frm_FechamentoVenda.y_total_venda := frm_FechamentoVenda.y_total_venda;}
    end
    else
    if (MODO='ATENDIMENTO') then
    begin
      if (Trim(pnTotalVenda.caption)<>'') then
        frm_FechamentoVenda.y_total_venda := strtofloat(RetiraFormatacaoNumero(Trim(pnTotalVenda.caption)))
      else
        frm_FechamentoVenda.y_total_venda := 0.00;
      if (frm_FechamentoVenda.y_total_venda<0.00) then
      begin
        flagExisteExcesso:=false;
        i:=0;
        while (i<frm_LancaVenda.y_LISTA_atendimentos.count) do
        begin
          terminalatendimento := strtofloat(trim(Copy(frm_LancaVenda.y_LISTA_atendimentos[i],1,10))); {*}
          codigoatendimento   := strtofloat(trim(Copy(frm_LancaVenda.y_LISTA_atendimentos[i],12,10))); {*}
          if (ExisteExcessoNoAtendimento(frm_principal.x_loja,terminalatendimento,codigoatendimento)) then
          begin
            flagExisteExcesso:=true;
            break;
          end;
          i:=i+1;
        end;
        if (flagExisteExcesso) then
          frm_FechamentoVenda.y_total_venda := 0.00
        else
          frm_FechamentoVenda.y_total_venda := frm_FechamentoVenda.y_total_venda;
      end;
    end;
    frm_FechamentoVenda.y_novo_total_venda := frm_FechamentoVenda.y_total_venda;
    frm_FechamentoVenda.windowstate := wsMaximized;

    if frm_principal.x_ecf_habilita_modo_fiscal and
      (y_modo_venda<>1) and
      frm_principal.x_ImpItemECF then
      frm_FechamentoVenda.OnActivate(Frm_Lancavenda);

    frm_FechamentoVenda.showmodal;
    botao_sair.visible                := true;
    if (frm_FechamentoVenda.tecla=27) then
    begin
      ExcluePagamentosLocal;
      ExibeItens(y_item_inicial);
    end
    else
    if (frm_FechamentoVenda.tecla=13) then
    begin
      IniciarNovaVenda;
               {***************************************************************************************}
      frm_principal.x_vendedor := 0;
      pnVend.caption           := ' Vend: INDEFINDO';
               {***************************************************************************************}

      if (MODO='VENDEDOR') then
      begin
        frm_LancaVenda_InformeVendedor.resultado := 27;
        frm_LancaVenda_InformeVendedor.showmodal;
        if (frm_LancaVenda_InformeVendedor.resultado=13) then
        begin
          pnVend.caption           := ' Vend: '+form_nz(frm_principal.x_vendedor,6)+'/'+
            form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),10);
          IniciarNovaVenda;
        end
        else
          frm_LancaVenda.close;
      end
      else
        Buscaratendimento1.click;
               {***************************************************************************************}
    end;
    frm_FechamentoVenda.Free;
  end;
     {***************************************************************************************}
end;

procedure Tfrm_LancaVenda.Salvarvenda1Click(Sender: TObject);
begin
     {***************************************************************************************}
  if (PodeRealizarVenda) then
    SalvarVenda;
     {***************************************************************************************}
end;

function Tfrm_LancaVenda.RetornaSaldoVenda:Real;
var
  total_pago: Real;
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(VF_VALO) as TOTAL_PAGO     ');
  clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO         ');
  clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND          ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND          ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)              ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('VF_VEND').AsFloat   := frm_principal.x_venda;
  clAux.Execute;
  total_pago := clAux.result('TOTAL_PAGO');
     {***}
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_VENDAS_LOCAL      ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND)              ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat   := frm_principal.x_venda;
  clAux.Execute;
  if (clAux.reccount=0) then
    result:=1.00
  else
  if (Trim(pnTotalVenda.caption)<>'') then
    result := strtofloat(RetiraFormatacaoNumero(Trim(pnTotalVenda.caption))) - total_pago
  else
    result := 1.00;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaVenda.FormActivate(Sender: TObject);
var
  ultima_venda_lancada_no_estoque: Real;
begin
  if Frm_Principal.x_Habilita_Modo_NFE then
     lancamentoNfe := true;

     {****************************************************************************}
  if (not jaChamou) then
  begin
         {*****************************}
         {Neste ponto, todas as leituras de CONFIGURACAO LOCAIS(Vendas.INI) e GERAIS(CONF) já foram realizadas!}
         {*****************************}
    if (gbItem_ProdCorTam.visible) then
      FocaCodigoLocal1
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus
    else
    if (gbItem_CBarra_EAN13.visible) then
      edtCBarraEAN13.setfocus;
         {********************************************************************************}
    y_modo_venda := 0; //inicia com uma VENDA NORMAL(0)
    lblModoVenda.caption := ExibeModoVenda(y_modo_venda);
         {********************************************************************************}
    LimparEdits;
    ExclueVendaLocal;
         {********************************************************************************}
    Novoitem1.click;
         {********************************************************************************}
    frm_principal.x_venda := -1; {- venda local - usado apenas para gravar no VENDAS_LOCAL(*_LOCAL}
         {********************************************************************************}
    pnSit.caption        := frm_principal.pnSit.caption;
    pnLoja.caption       := frm_principal.pnLoja.caption;
    pnCaixa.caption      := frm_principal.pnCaixa.caption;
    pnEcf.caption        := frm_principal.pnEcf.caption;
    pnData.caption       := frm_principal.pnData.caption;
    pnDia.caption        := frm_principal.pnDia.caption;
    if (frm_principal.x_vendedor=0) then
      frm_LancaVenda.pnVend.caption := ' Vend: INDEFINDO'
    else
      pnVend.caption       := ' Vend: '+form_nz(frm_principal.x_vendedor,6)+'/'+form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),10);
    pnCaixaAtiva.caption := frm_principal.pnCaixaAtiva.caption;
         {********************************************************************************}
    PodeRealizarVenda; //realiza criticas quanto aos dados principais : LOJA/CAIXA...etc...
         {********************************************************************************}
    CalculaTotalVenda;
         {********************************************************************************}
         //C. BARRAS INTERNO
    frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
      lbleituracbarra.caption := '>leitura manual da qtde.'
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
      lbleituracbarra.caption := '>leitura direta';
         {********************************************************************************}
         //C. BARRAS - EAN13
    frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
      lbleituracbarra_ean13.caption := '>leitura manual da qtde.'
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
      lbleituracbarra_ean13.caption := '>leitura direta';
         {********************************************************************************}
    lblSeq.color := clTeal;
    ultima_venda_lancada_no_estoque := UltimaVendaRegistradaNoEstoque;
    if (frm_principal.x_codigo_venda<ultima_venda_lancada_no_estoque) and
      (frm_principal.x_ativar_alerta_sequencial_venda) then
    begin
      frm_ALERTA.Memo1.lines.clear;
      frm_ALERTA.Memo1.lines.Add('Erro: O código da última venda não pode ser menor que ');
      frm_ALERTA.Memo1.lines.Add('      que a última venda lançada: '+trim(form_n(ultima_venda_lancada_no_estoque,15)));
      frm_ALERTA.showmodal;
      lblSeq.color := clRed;
    end;
         {********************************************************************************}
    if (frm_principal.x_ecf_habilita_modo_fiscal) then
      if (frm_principal.x_ecf=0) then
      begin
        frm_ALERTA.Memo1.lines.clear;
        frm_ALERTA.Memo1.lines.Add('Erro: O código da ECF deve ser configurada! ');
        frm_ALERTA.showmodal;
      end;
         {********************************************************************************}
    frmDialogo.posativ:=1;
         {********************************************************************************}
    if (frm_principal.x_vendedor=0) then
      Buscaratendimento1.click;
         {********************************************************************************}
    if (RetornaApelidoEmpresa='CASAS DANTAS') then
    begin
      edtPreco.color := clWhite;
      edtPreco.font.color := clBlack;
      edtPreco.readonly := false;
    end
    else
    begin
      edtPreco.color := clTeal;
      edtPreco.font.color := clWhite;
      edtPreco.readonly := true;
    end;
         {****************************************************************************}
    FlistaProd.Clear;
    CupomAberto := false;
    if frm_principal.x_ecf_habilita_modo_fiscal and
      frm_principal.x_ImpItemECF  and
      (Y_ImpVendaItens = 'C') then
    begin
      if (fcupom = '') then
        FCupom := BuscaProximoCOOCupom;

      if Y_ImpVendaItens = 'C' then
      begin
        pnEcf.caption    := frm_principal.pnEcf.caption+' Cupom '+formatfloat('00000',StrtofloatN(FCupom));
        pnEcf.color      := clblack;
        pnEcf.font.color := clYellow;
      end;
    end;

    jaChamou:=true;
  end;
end;

procedure Tfrm_LancaVenda.Mudarcaixaparasituaoqualquer1Click(
  Sender: TObject);
var
  situacao: String;
begin
  Application.CreateForm(Tfrm_MudarSituacao, frm_MudarSituacao);
  frm_MudarSituacao.showmodal;
  situacao := frm_MudarSituacao.y_situacao;
  frm_MudarSituacao.Free;

     {***}
  if (situacao<>'-1') then
  begin
    pnCaixa.caption := ' N.Terminal: '+form_nz(frm_principal.x_terminal,2)+' '+
      ProcuraNomeSit(situacao,self);
    Application.CreateForm(Tfrm_ExibeSituacao, frm_ExibeSituacao);
    frm_ExibeSituacao.flagFecha := true;
    frm_ExibeSituacao.y_situacao_mensagem := situacao;
    frm_ExibeSituacao.showmodal;
    frm_ExibeSituacao.Free;
  end;
end;

procedure Tfrm_LancaVenda.Encerrarocaixa1Click(Sender: TObject);
var
  situacao: String;
begin
  Application.CreateForm(Tfrm_FecharSessao, frm_FecharSessao);
  frm_FecharSessao.showmodal;
  situacao := frm_FecharSessao.y_situacao;
  frm_FecharSessao.Free;

     {***}
  if (situacao<>'-1') then
  begin
    pnCaixa.caption := ' N.Terminal: '+form_nz(frm_principal.x_terminal,2);
    Application.CreateForm(Tfrm_ExibeSituacao, frm_ExibeSituacao);
    frm_ExibeSituacao.flagFecha := true;
    frm_ExibeSituacao.y_situacao_mensagem := situacao;
    frm_ExibeSituacao.showmodal;
    frm_ExibeSituacao.Free;
  end;
end;

procedure Tfrm_LancaVenda.Gaveta1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_funcoesGaveta, frm_funcoesGaveta);
  frm_funcoesGaveta.showmodal;
  frm_funcoesGaveta.Free;
end;

procedure Tfrm_LancaVenda.Impressorafiscal1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_funcoesImpressora, frm_funcoesImpressora);
  frm_funcoesImpressora.showmodal;
  frm_funcoesImpressora.Free;
end;

procedure Tfrm_LancaVenda.imagemEmpresaDblClick(Sender: TObject);
begin
  if (OpenPictureDialog1.Execute) then
  begin
    frm_principal.x_imagem_logomarca := OpenPictureDialog1.Filename;
    imagemEmpresa.picture.loadfromfile(frm_principal.x_imagem_logomarca);
  end;
end;

procedure Tfrm_LancaVenda.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancaVenda.edtRefFabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  reffabric: String;
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    reffabric := Trim(edtRefFab.text);
    key_reffab:=key;
    edtRefFabExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (key_reffab=K_ENTER) then
      edtQtde.setfocus;
  end;
  if (key=K_CIMA) then
    edtForn.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F8) then
    btnLocalizar.click;
end;

procedure Tfrm_LancaVenda.edtCodigoExit(Sender: TObject);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
  grupo    := Trim(edtGrupo.text);
  subgrupo := Trim(edtSubGrupo.text);
  codigo   := Trim(edtCodigo.text);
  if (grupo<>'') and (subgrupo<>'') and (codigo<>'') then
    with (clProd) do
    begin
      clProd := TClassProdutos.Create;
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_FORN,    ');
      AddParam ('       PR_GRUP,PR_SUBG,PR_CODI,PR_UNID,PR_REFF     ');
      AddParam ('From   PRODUTOS                                    ');
      AddParam ('Where (PR_SUBG='+subgrupo+') AND                   ');
      AddParam ('      (PR_GRUP='+grupo+') AND                      ');
      AddParam ('      (PR_CODI='+codigo+')                         ');
      n_cor_unica:=false;
      n_tam_unico:=false;
      if (Execute) then
      begin
        pnProduto.caption := result('PR_DESC');
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

                {informacoes acerca do produto}
        edtRefInt.text    := Trim(result('PR_REFI'));
        edtForn.text      := form_nz(result('PR_FORN'),6);
        edtRefFab.text    := Trim(result('PR_REFF'));
        pnUnidade.caption := Result('PR_UNID');
      end
      else
      begin
        pnProduto.caption := '<Produto nao encontrado>';
        pnCor.caption     := '';
        edtRefInt.text    := '';
        edtForn.text      := '';
        edtRefFab.text    := '';
      end;
      edtGrupo.text    := form_nz (StrToFloat(grupo),2);
      edtSubGrupo.text := form_nz (StrToFloat(subgrupo),2);
      edtCodigo.text   := form_nz (StrToFloat(codigo),4);
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaedit(edtCor);
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaedit(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_LancaVenda.edtRefIntExit(Sender: TObject);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  refinterna := Trim(edtRefInt.text);
  if (refinterna<>'') then
    with (clProd) do
    begin
      clProd := TClassProdutos.Create;
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_FORN,    ');
      AddParam ('       PR_GRUP,PR_SUBG,PR_CODI,PR_UNID,PR_REFF     ');
      AddParam ('From   PRODUTOS                                    ');
      AddParam ('Where (PR_REFI='+chr(39)+refinterna+chr(39)+')     ');
      n_cor_unica:=false;
      n_tam_unico:=false;
      if (Execute) then
      begin
        n_grupo          := result('PR_GRUP');
        n_subgrupo       := result('PR_SUBG');
        n_produto        := result('PR_CODI');
        pnProduto.caption:= result('PR_DESC');
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
        edtForn.text      := form_nz(result('PR_FORN'),6);
        edtRefFab.text    := Trim(result('PR_REFF'));
        pnUnidade.caption:=Result('PR_UNID');

        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaedit(edtCor);
        end
        else
        begin
          habilitaeditVerde(edtCor);
          habilitaEdit(edtCor);
        end;
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaedit(edtFaixaTam);
        end
        else
        begin
          habilitaeditVerde(edtFaixaTam);
          habilitaEdit(edtFaixaTam);
        end;  
      end
      else
      begin
        pnProduto.caption :='<Produto nao encontrado>';
        pnCor.caption     :='';
      end;
      edtGrupo.text    := form_nz (n_grupo,2);
      edtSubGrupo.text := form_nz (n_subgrupo,2);
      edtCodigo.text   := form_nz (n_produto,4);
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaedit(edtCor);
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaedit(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_LancaVenda.edtRefFabExit(Sender: TObject);
var
  clProd: TClassProdutos;
  forn,reffabric: String;
begin
  forn      := Trim(edtForn.text);
  reffabric := Trim(edtRefFab.text);
  if (reffabric<>'') then
    with (clProd) do
    begin
      clProd := TClassProdutos.Create;
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_FORN,    ');
      AddParam ('       PR_GRUP,PR_SUBG,PR_CODI,PR_UNID,PR_REFF     ');
      AddParam ('From   ESTOQUE,PRODUTOS                            ');
      AddParam ('Where (PR_REFF='+chr(39)+reffabric+chr(39)+')      ');
      if (forn<>'') then
        AddParam ('AND   (PR_FORN='+forn+')                           ');
      n_cor_unica:=false;
      n_tam_unico:=false;
      if (Execute) then
      begin
        n_grupo          := result('PR_GRUP');
        n_subgrupo       := result('PR_SUBG');
        n_produto        := result('PR_CODI');
        pnProduto.caption:= result('PR_DESC');
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
        edtRefInt.text    := Trim(result('PR_REFI'));
        pnUnidade.caption := Trim(Result('PR_UNID'));
      end
      else
      begin
        pnProduto.caption :='<Produto nao encontrado>';
        pnCor.caption     :='';
        edtRefInt.text    :='';
      end;
      edtGrupo.text    := form_nz (n_grupo,2);
      edtSubGrupo.text := form_nz (n_subgrupo,2);
      edtCodigo.text   := form_nz (n_produto,4);
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaedit(edtCor);
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaedit(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_LancaVenda.edtCBarraExit(Sender: TObject);
var
  cbarra: String;
  clAux: TClassAuxiliar;
  a: Integer;
  continua: Boolean;
begin
  cbarra := ReformataCodigoBarras(Trim(edtCBarra.text));
  if (cbarra<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,PR_FORN,  ');
      AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,  ');
      AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC           ');
      AddParam ('From   ESTOQUE,PRODUTOS                          ');
      AddParam ('Where (ES_CBAR='+chr(39)+cbarra+chr(39)+') AND   ');
      AddParam ('      (ES_GRUP=PR_GRUP) AND                      ');
      AddParam ('      (ES_SUBG=PR_SUBG) AND                      ');
      AddParam ('      (ES_PROD=PR_CODI)                          ');
      if not (Execute) then
      begin
        a:= length(edtCBarra.Text);
        cbarra := copy(edtCBarra.Text,1,(a-1));
        ClearSql;
        AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,PR_FORN,  ');
        AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,  ');
        AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC           ');
        AddParam ('From   ESTOQUE,PRODUTOS                          ');
        AddParam ('Where (ES_CBAR='+chr(39)+cbarra+chr(39)+') AND   ');
        AddParam ('      (ES_GRUP=PR_GRUP) AND                      ');
        AddParam ('      (ES_SUBG=PR_SUBG) AND                      ');
        AddParam ('      (ES_PROD=PR_CODI)                          ');
        if (Execute) then
          continua := true
        else
          continua := false;
      end
      else
        continua := true;
      if (continua) then
      begin
        pnProduto.caption   := result('PR_DESC');
        if (result('ES_TAMA')='0') then
          pnCor.caption     := ProcuraNomeCor(result('ES_CORE'),self)+
            ' - TAM UNICO'
        else
          pnCor.caption     := ProcuraNomeCor(result('ES_CORE'),self)+
            ' - TAM '+result('ES_TAMA');
        pnDescItem2.caption := result('ES_DESC');
        n_grupo    := result('ES_GRUP');
        n_subgrupo := result('ES_SUBG');
        n_produto  := result('ES_PROD');
        n_cor      := result('ES_CORE');
        n_tam      := result('ES_TAMA');
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
        edtGrupo.text    := form_nz (n_grupo,2);
        edtSubGrupo.text := form_nz (n_subgrupo,2);
        edtCodigo.text   := form_nz (n_produto,4);
        edtRefInt.text   := Trim(result('PR_REFI'));
        edtForn.text     := form_nz(result('PR_FORN'),6);
        edtRefFab.text   := Trim(result('ES_REFF'));
        edtCor.text      := form_nz (n_cor,4);
        edtFaixaTam.text := n_tam;
        edtCBarra.text   := Trim(result('ES_CBAR'));

                {informacoes acerca do produto}
        pnUnidade.caption := Result('PR_UNID');
      end
      else
      begin
        pnProduto.caption   := '';
        pnCor.caption       := '';
        pnDescItem2.caption := '<Item não encontrado>';
        n_grupo := 0;
        n_subgrupo := 0;
        n_produto := 0;
        n_cor := -1;
        n_tam := '-1';

                {informacoes acerca do produto}
        pnUnidade.caption   := '';
      end;
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaedit(edtCor);
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaedit(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_LancaVenda.edtCorExit(Sender: TObject);
var
  desc_cor,desc_tam: String;
  ClAux : TClassAuxiliar;
begin
  if (n_cor<>-1) then //desc_cor := ProcuraNomeCor(n_cor,self)
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,PR_FORN,  ');
      AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,  ');
      AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC           ');
      AddParam ('From   ESTOQUE,PRODUTOS                          ');
      AddParam ('Where (ES_SUBG='+FloatToStr(n_subgrupo)+') AND   ');
      AddParam ('      (ES_GRUP='+FloatToStr(n_grupo)+') AND      ');
      AddParam ('      (ES_PROD='+FloatToStr(n_produto)+') AND    ');
      AddParam ('      (ES_CORE='+chr(39)+edtcor.text+chr(39)+') ');
      if (not Execute) then
      begin
        frmDialogo.ExibirMensagem ('Cor não existente para este produto!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        desc_cor := '';
        edtCor.SetFocus;
        ClAux.Desconect;
        ClAux.Free;
      end
      else
      begin
        desc_cor := ProcuraNomeCor(n_cor,self);
        ClAux.Desconect;
        ClAux.Free;
      end;
    end;
  if (n_tam<>'-1') then
  begin
    if (n_tam='0') then
      desc_tam := ' - TAM UNICO'
    else
      desc_tam := ' - TAM '+n_tam
  end
  else
    desc_tam := '';
  pnCor.caption := desc_cor + desc_tam;
           {...}
  if (n_tam='0') then
  begin
    edtFaixaTam.text:='0';
    desabilitaedit(edtFaixaTam);
  end
  else
    habilitaEdit(edtFaixaTam);

end;

procedure Tfrm_LancaVenda.edtFaixaTamExit(Sender: TObject);
var
  desc_cor,desc_tam: String;
begin
  if (n_cor<>-1) then
    desc_cor := ProcuraNomeCor(n_cor,self)
  else
    desc_cor := '';
  if (n_tam<>'-1') then
  begin
    if (n_tam='0') then
      desc_tam := ' - TAM UNICO'
    else
      desc_tam := ' - TAM '+n_tam
  end
  else
    desc_tam := '';
  pnCor.caption := desc_cor + desc_tam;
end;

function Tfrm_LancaVenda.ExibeModoVenda(modo: Integer):String;
begin
  if (modo=0) then
    result:='Venda>>>'
  else
  if (modo=1) then
    result:='<<<Devolução'
  else
  if (modo=2) then
    result:='<<<Troca>>>';
end;

procedure Tfrm_LancaVenda.Alterarmododevenda1Click(Sender: TObject);
begin
//  if (y_modo_venda=0) then
//  begin
//          {********************************************************************************}
//    if (frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO) then
//    begin
//      if (not frm_senhaSupervisor.y_flag) then
//        frm_senhaSupervisor.showmodal;
//    end
//    else
//      frm_senhaSupervisor.y_flag := true;
          {********************************************************************************}

          {...}
//    if (frm_senhaSupervisor.y_flag) then
//   begin
//      y_modo_venda:=2;
//      lblModoVenda.font.color:=clBlue;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_troca;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_troca;
//    end
//    else
//    begin
//      y_modo_venda:=0;
//      lblModoVenda.font.color:=clBlack;
//      frm_senhaSupervisor.y_flag:=false;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
//    end;
          {********************************************************************************}
//  end
//  else
//  if (y_modo_venda=2) then
//  begin
          {********************************************************************************}
//    if (frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO) then
//    begin
//      if (not frm_senhaSupervisor.y_flag) then
//        frm_senhaSupervisor.showmodal;
//    end
//    else
//      frm_senhaSupervisor.y_flag := true;
          {********************************************************************************}

          {...}
//    if (frm_senhaSupervisor.y_flag) then
//    begin
//      y_modo_venda:=1;
//      lblModoVenda.font.color:=clRed;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_devolucao;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_devolucao;
//    end
//    else
//    begin
//      y_modo_venda:=0;
//      lblModoVenda.font.color:=clBlack;
//      frm_senhaSupervisor.y_flag:=false;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
//      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
//    end;
          {********************************************************************************}
//  end
//  else
//  if (y_modo_venda=1) then
//  begin
//    y_modo_venda:=0;
//    lblModoVenda.font.color:=clBlack;
//    frm_senhaSupervisor.y_flag:=false;
//    frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
//    frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
//  end;

     //C. BARRAS INTERNO
//  lblModoVenda.caption := ExibeModoVenda(y_modo_venda);
//  if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
//    lbleituracbarra.caption := '>leitura manual da qtde.'
//  else
//  if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
//    lbleituracbarra.caption := '>leitura direta';

     //C. BARRAS EAN13
//  if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
//    lbleituracbarra_ean13.caption := '>leitura manual da qtde.'
//  else
//  if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
//    lbleituracbarra_ean13.caption := '>leitura direta';
end;

function Tfrm_LancaVenda.RetornaQtdeSaidas:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IV_QTDE) as TOTAL_SAIDAS  ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL            ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND         ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND         ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND         ');
  clAux.AddParam ('      (IV_TOTA>0)                    ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := frm_principal.x_venda;
  clAux.Execute;
  result := clAux.result('TOTAL_SAIDAS');
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaVenda.RetornaQtdeEntradas:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IV_QTDE) as TOTAL_ENTRADAS ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL             ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND          ');
  clAux.AddParam ('      (IV_TOTA<0)                     ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := frm_principal.x_venda;
  clAux.Execute;
  result := clAux.result('TOTAL_ENTRADAS');
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaVenda.Limparformulrio1Click(Sender: TObject);
begin
  Novoitem1.click;
end;

procedure Tfrm_LancaVenda.Ajuda1Click(Sender: TObject);
begin
  ListaAtalhosF1.clear;
  ListaAtalhosF1.Add('  [F1]  - Ajuda ');
  ListaAtalhosF1.Add('  [F2]  - Lançar novo item na venda');
  ListaAtalhosF1.Add('  [F3]  - Lançar nova venda');
  ListaAtalhosF1.Add('  [F4]  - Excluir item lançado');
  ListaAtalhosF1.Add('  [F5]  - Salvar item');
  ListaAtalhosF1.Add('  [F6]  - Forma de leitura do c. barras');
  ListaAtalhosF1.Add('  [F7]  - Alterna identificação do produto');
  ListaAtalhosF1.Add('  [F8]  - Buscar códigos');
  ListaAtalhosF1.Add('  [F9]  - Concluir venda');
  if (MODO='ATENDIMENTO') then
    ListaAtalhosF1.Add('  [F12] - Buscar atendimento');
  ListaAtalhosF1.Add('  [PAGE UP] - Sobe lista de itens');
  ListaAtalhosF1.Add('  [PAGE DOWN] - Desce lista de itens');
  ListaAtalhosF1.Add('  [CTRL + F5] - Salvar venda');
  ListaAtalhosF1.Add('  [CTRL + F7] - Alterna entre código');
  ListaAtalhosF1.Add(' de barras e identificação do produto');
  ListaAtalhosF1.Add('  [CTRL + L] - Limpar formulário');
  if (MODO='VENDEDOR') then
    ListaAtalhosF1.Add('  [CTRL + V] - Trocar vendedor');
  ListaAtalhosF1.Add('  [CTRL + A] - Alterar preço de venda');
  ListaAtalhosF1.Add('  [CTRL + F10] - Alterar modo de venda');
  ListaAtalhosF1.Add('    (VENDA, DEVOLUÇÃO, TROCA)');
  Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
  frm_AjudaComandos.showmodal;
  frm_AjudaComandos.Free;
end;

procedure Tfrm_LancaVenda.IniciarNovaVenda;
begin
  frm_senhaSupervisor.y_flag:=false;
  bPODE_SAIR:=true; {*}
     {********************************************************************************}
  y_LISTA_atendimentos.clear;
  y_desconto_atendimento := 0.00;
     {********************************************************************************}
  frm_senhaSupervisor.y_flag:=false;
  y_modo_venda:=0;
  lblModoVenda.font.color:=clBlack;
  lblModoVenda.caption := ExibeModoVenda(y_modo_venda);
     {********************************************************************************}
     //C. BARRAS INTERNO
  frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
  if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    lbleituracbarra.caption := '>leitura manual da qtde.'
  else
  if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    lbleituracbarra.caption := '>leitura direta';
     {********************************************************************************}
     //C. BARRAS - EAN13
  frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
  if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    lbleituracbarra_ean13.caption := '>leitura manual da qtde.'
  else
  if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    lbleituracbarra_ean13.caption := '>leitura direta';  
     {********************************************************************************}
  LimparEdits;
  ExclueVendaLocal; {*}
  pnExibeItens.ClearAll;
  CalculaTotalVenda;
     {********************************************************************************}
  y_item_inicial       := 1;
  pnSetaAcima.visible  := false;
  pnSetaAbaixo.visible := false;
     {********************************************************************************}
  Novoitem1.click;
     {********************************************************************************}
  frm_principal.x_venda := -1; {- venda local - }
     {********************************************************************************}
  pnSit.caption      := frm_principal.pnSit.caption;
  pnLoja.caption     := frm_principal.pnLoja.caption;
  pnCaixa.caption    := frm_principal.pnCaixa.caption;
  pnEcf.caption      := frm_principal.pnEcf.caption;
  pnData.caption     := frm_principal.pnData.caption;
  if (frm_principal.x_vendedor=0) then
    pnVend.caption := ' Vend: INDEFINDO'
  else
    pnVend.caption := ' Vend: '+form_nz(frm_principal.x_vendedor,6)+'/'+form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),10);
  pnDia.caption   := frm_principal.pnDia.caption;
     {********************************************************************************}

  lblSeq.caption := 'Última Venda: '+floattostr(frm_principal.x_codigo_venda);

  FlistaProd.Clear;
  CupomAberto := false;
  if frm_principal.x_ecf_habilita_modo_fiscal and
    frm_principal.x_ImpItemECF and
    (Y_ImpVendaItens = 'C') then
  begin
    if (fcupom = '') then
      FCupom := BuscaProximoCOOCupom;

    if Y_ImpVendaItens = 'C' then
    begin
      pnEcf.caption    := frm_principal.pnEcf.caption+' Cupom '+formatfloat('00000',StrtofloatN(FCupom));
      pnEcf.color      := clblack;
      pnEcf.font.color := clYellow;
    end;
  end;
end;

function Tfrm_LancaVenda.JaTeveDevolucao:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_VENDAS_LOCAL      ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND          ');
  clAux.AddParam ('      (IV_MODO=:IV_MODO)              ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat   := frm_principal.x_venda;
  clAux.consulta.parambyname('IV_MODO').AsInteger := 1;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaVenda.JaTeveVenda:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_VENDAS_LOCAL      ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND          ');
  clAux.AddParam ('      (IV_MODO=:IV_MODO)              ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat   := frm_principal.x_venda;
  clAux.consulta.parambyname('IV_MODO').AsInteger := 0;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaVenda.JaTeveTroca:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_VENDAS_LOCAL      ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND          ');
  clAux.AddParam ('      (IV_MODO=:IV_MODO)              ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat   := frm_principal.x_venda;
  clAux.consulta.parambyname('IV_MODO').AsInteger := 2;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaVenda.ProximoSequencialItem:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(IV_SEQ) as PROXIMO_SEQUENCIAL  ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL                 ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND              ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND              ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND)                  ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := frm_principal.x_venda;
  clAux.Execute;
  result:=clAux.result('PROXIMO_SEQUENCIAL')+1;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaVenda.CalculaTotalVenda;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IV_QTDE) as TOTAL_QTDE,    ');
  clAux.AddParam ('       SUM(IV_TOTA) as TOTAL_VENDA    ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL             ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND          ');
  clAux.AddParam ('      (IV_MODO=0)                     '); {+ VENDA}
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := frm_principal.x_venda;
  clAux.Execute;
  y_qtde_itens  := clAux.Result('TOTAL_QTDE');
  y_total_venda := clAux.Result('TOTAL_VENDA');
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IV_QTDE) as TOTAL_QTDE,    ');
  clAux.AddParam ('       SUM(IV_TOTA) as TOTAL_VENDA    ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL             ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND          ');
  clAux.AddParam ('     ((IV_MODO=1) OR (IV_MODO=2))     '); {+ DEVOLUCAO/TROCA}
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := frm_principal.x_venda;
  clAux.Execute;
  y_qtde_itens  := y_qtde_itens - clAux.Result('TOTAL_QTDE');
  y_total_venda := y_total_venda + clAux.Result('TOTAL_VENDA'); {'TOTAL_VENDA' ja vem negativo}
    {*****************************************************************************}
  clAux.ClearSql;
  clAux.AddParam ('SELECT DISTINCT IV_GRUP,IV_SUBG,IV_PROD,IV_CORE,IV_TAMA    ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL                                  ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND                               ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND                               ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND)                                   ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := frm_principal.x_venda;
  clAux.Execute;
  y_qtde_itens_distintos := clAux.Reccount;
    {****************************************************************************}
  if (RetornaApelidoEmpresa = 'PONTO DO AR') or (RetornaApelidoEmpresa = 'ESTACAO DO AR') then
    pnQtdeTotal.caption  := form_n  (y_qtde_itens_distintos,5)
  else
    pnQtdeTotal.caption  := form_n  (y_qtde_itens,5);
  pnTotalVenda.caption := form_nc (y_total_venda,10);
    {****************************************************************************}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaVenda.pnBotaoMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure Tfrm_LancaVenda.Image3DblClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSobre, frmSobre);
  frmSobre.showmodal;
  frmSobre.Free;
end;

procedure Tfrm_LancaVenda.ComandosECF1Click(Sender: TObject);
begin
     
end;

//Realiza criticas de CONSISTENCIA de dados antes de iniciar uma venda
//Esta rotina nao pode ser muito 'pesada'
function Tfrm_LancaVenda.PodeRealizarVenda:Boolean;
begin
  result := true;
     //Verifica se o codigo da loja é diferente de ZERO
  if (frm_principal.x_loja=0) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: Código da loja não configurado! ');
    frm_ALERTA.Memo1.lines.Add('A não configuração deste código causará erros de inconsistência nas vendas.');
    frm_ALERTA.Memo1.lines.Add(' - Entre em contato com o supervisor de vendas para configurar este terminal -');
    frm_ALERTA.showmodal;
    result := false;
  end
     //Verifica se o codigo do terminal de caixa é diferente de ZERO
  else
  if (frm_principal.x_terminal=0) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: Código do terminal de caixa não configurado! ');
    frm_ALERTA.Memo1.lines.Add('A não configuração deste código causará erros de inconsistência nas vendas.');
    frm_ALERTA.Memo1.lines.Add(' - Entre em contato com o supervisor de vendas para configurar este terminal -');
    frm_ALERTA.showmodal;
    result := false;
  end
     //Verifica se o codigo da ultima venda é menor que a ultima venda lancada
  else
  if (lblSeq.color=clRed) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: O código da última venda não pode ser menor que ');
    frm_ALERTA.Memo1.lines.Add('      que a última venda lançada! ');
    frm_ALERTA.showmodal;
    result:=false;
  end;
end;

function Tfrm_LancaVenda.UltimaVendaRegistradaNoEstoque:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(VE_CODI) as MAXIMO_SEQUENCIAL  ');
  clAux.AddParam ('FROM   VENDAS                             ');
  clAux.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND              ');
  clAux.AddParam ('      (VE_CAIX=:VE_CAIX)                  ');
  clAux.consulta.parambyname('VE_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('VE_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.Execute;
  result := clAux.result('MAXIMO_SEQUENCIAL');
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaVenda.Mudarformadeleituradocdigodebarras1Click(Sender: TObject);
begin
     {********************************************************************************}
  if (gbItem_CBarra.visible) then
  begin
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 1;
      lbleituracbarra.caption := '>leitura direta';
    end
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 0;
      lbleituracbarra.caption := '>leitura manual da qtde.';
    end;
    Limparformulrio1.click;
    edtCBarra.setfocus;
  end
  else
  if (gbItem_CBarra_EAN13.visible) then
  begin
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 1;
      lbleituracbarra_ean13.caption := '>leitura direta';
    end
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 0;
      lbleituracbarra_ean13.caption := '>leitura manual da qtde.';
    end;
    Limparformulrio1.click;
    edtCBarraEAN13.setfocus;
  end;
     {********************************************************************************}
end;

procedure Tfrm_LancaVenda.lblStatusDblClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ResumoConexoes, frm_ResumoConexoes);
  frm_ResumoConexoes.showmodal;
  frm_ResumoConexoes.Free;
end;

procedure Tfrm_LancaVenda.edtFornEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancaVenda.edtFornKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRefFab.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn,false);
end;

procedure Tfrm_LancaVenda.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,false);
end;

procedure Tfrm_LancaVenda.edtFornExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=trim(edtForn.text);
  if (codigo<>'') then
    edtForn.text:=form_nz(strtofloat(codigo),6);
end;

procedure Tfrm_LancaVenda.Trocarvendedor1Click(Sender: TObject);
begin
  if (MODO='VENDEDOR') then
    if (not JaTeveVenda) and (not JaTeveTroca) and (not JaTeveDevolucao) then
    begin
      frm_LancaVenda_InformeVendedor.resultado := 27;
      frm_LancaVenda_InformeVendedor.showmodal;
      if (frm_LancaVenda_InformeVendedor.resultado=13) then
      begin
        if (frm_principal.x_vendedor=0) then
          pnVend.caption := ' Vend: INDEFINDO'
        else
          pnVend.caption       := ' Vend: '+form_nz(frm_principal.x_vendedor,6)+'/'+form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),10);
        IniciarNovaVenda;
      end;
    end;
end;

procedure Tfrm_LancaVenda.edtPrecoDblClick(Sender: TObject);
begin
  Alterarpreodevenda1.click;
end;

procedure Tfrm_LancaVenda.Alterarpreodevenda1Click(Sender: TObject);
begin
  if (RetornaApelidoEmpresa='VARADERO MODAS LTDA') then
    frmDialogo.ExibirMensagem ('Opção não liberada a pedido do cliente!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (trim(edtPreco.text)<>'') then
    if (frm_principal.x_solicitar_senha_ALTERACAO_PRECO_VENDA) then
    begin
      if (not frm_senhaSupervisor.y_flag) then
        frm_senhaSupervisor.showmodal;
      if (frm_senhaSupervisor.y_flag) then
      begin
        Application.CreateForm(Tfrm_LancaVenda_AlteraPreco, frm_LancaVenda_AlteraPreco);
        frm_LancaVenda_AlteraPreco.edtPrecoSugerido.text := edtPreco.text;
        frm_LancaVenda_AlteraPreco.showmodal;
        if (frm_LancaVenda_AlteraPreco.tecla=13) then
        begin
          edtPreco.text := trim(form_nc(frm_LancaVenda_AlteraPreco.edtNovoPreco.GetValor,10));
          edtPreco.setfocus;
        end;
        frm_LancaVenda_AlteraPreco.Free;
        if (y_modo_venda=0) then
          frm_senhaSupervisor.y_flag:=false
        else
          frm_senhaSupervisor.y_flag:=true;
      end;
    end
    else
    begin
      Application.CreateForm(Tfrm_LancaVenda_AlteraPreco, frm_LancaVenda_AlteraPreco);
      frm_LancaVenda_AlteraPreco.edtPrecoSugerido.text := edtPreco.text;
      frm_LancaVenda_AlteraPreco.showmodal;
      if (frm_LancaVenda_AlteraPreco.tecla=13) then
      begin
        edtPreco.text := trim(form_nc(frm_LancaVenda_AlteraPreco.edtNovoPreco.GetValor,10));
        edtPreco.setfocus;
      end;
      frm_LancaVenda_AlteraPreco.Free;
    end;
end;

procedure Tfrm_LancaVenda.Buscaratendimento1Click(Sender: TObject);
var
  terminal_atendimento,numero_atendimento: Real;
  vendedor_atendimento: Real;
  total_da_venda_ate_o_momento: Real;
  sequencial: Integer;
  clAux,CLITEM: TClassAuxiliar;
begin
  if (MODO='ATENDIMENTO') then
  begin
    Application.CreateForm(Tfrm_BuscaAtendimento, frm_BuscaAtendimento);
    frm_BuscaAtendimento.Modo := 'BUSCA';
    frm_BuscaAtendimento.showmodal;
    if (frm_BuscaAtendimento.tecla=13) then
    begin
               //***********************************************************
      terminal_atendimento   := frm_BuscaAtendimento.qAtendimentos.fieldbyname('AT_CAIX').AsFloat;
      numero_atendimento     := frm_BuscaAtendimento.qAtendimentos.fieldbyname('AT_CODI').AsFloat;
      vendedor_atendimento   := frm_BuscaAtendimento.qAtendimentos.fieldbyname('AT_VEND').AsFloat;
      y_desconto_atendimento := frm_BuscaAtendimento.qAtendimentos.fieldbyname('AT_DESC').AsFloat; //caso exista DESCONTO NO ATENDIMENTO
               //***********************************************************
      if (trim(pnTotalVenda.caption)<>'') then
        total_da_venda_ate_o_momento:=strtofloat(RetiraFormatacaoNumero(trim(trim(pnTotalVenda.caption))))
      else
        total_da_venda_ate_o_momento:=0.00;

               {CRITICA}
      if (y_LISTA_atendimentos.IndexOf(form_n  (terminal_atendimento,10) +'/'+
        form_n  (numero_atendimento,10))<>-1) then
        frmDialogo.ExibirMensagem ('O atendimento selecionado já se encontra incluído na VENDA!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (VerificaSeAtendimentoTemDevolucao(terminal_atendimento,numero_atendimento)) and
        ((JaTeveDevolucao) or (JaTeveVenda) or (JaTeveTroca)) then
      begin
        frmDialogo.ExibirMensagem ('O Atendimento selecionado possui      DEVOLUÇÃO!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        frmDialogo.ExibirMensagem ('Atendimento com DEVOLUÇÃO deve estar sozinho em uma venda!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      end
      else
      if (JaTeveDevolucao) then
        frmDialogo.ExibirMensagem ('Atendimento com DEVOLUÇÃO deve estar sozinho em uma venda!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (JaTeveDescontoNoPrimeiroAtendimento) and
        (y_desconto_atendimento<>0.00) then
        frmDialogo.ExibirMensagem ('Somente um Atendimento pode possuir desconto numa mesma venda!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (VerificaSeAtendimentoTeveExcesso(terminal_atendimento,numero_atendimento)) and
        (total_da_venda_ate_o_momento<>0.00) then
      begin
        frmDialogo.ExibirMensagem ('O Atendimento selecionado possui      TROCA EM EXCESSO!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        frmDialogo.ExibirMensagem ('Atendimento com TROCA EM EXCESSO deve estar sozinho em uma venda!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      end
      else
      if (total_da_venda_ate_o_momento<0.00) then
        frmDialogo.ExibirMensagem ('Atendimento com TROCA EM EXCESSO deve estar sozinho em uma venda!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
                   //***********************************************************
        pnVend.caption  := ' Vend: DIVERSOS';

                   //***********************************************************
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT IA_GRUP,IA_SUBG,IA_PROD,    ');
        clAux.AddParam ('       IA_CORE,IA_TAMA,IA_OTAM,    ');
        clAux.AddParam ('       IA_QTDE,IA_PVEN,IA_TOTA,    ');
        clAux.AddParam ('       IA_MODO                     ');
        clAux.AddParam ('FROM   ITENS_ATENDIMENTOS          ');
        clAux.AddParam ('WHERE (IA_LOJA=:loja) AND          ');
        clAux.AddParam ('      (IA_CAIX=:terminal) AND      ');
        clAux.AddParam ('      (IA_VEND=:atendimento)       ');
        clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
        clAux.consulta.parambyname('terminal').AsFloat    := terminal_atendimento;
        clAux.consulta.parambyname('atendimento').AsFloat := numero_atendimento;
        clAux.Execute;
        clAux.first;

        sequencial := ProximoSequencialItem;
        while (not clAux.eof) do
        begin
                       //......................................................
          with (DMCaixa.qInsereItemVenda) do
          begin
                            {*******************************************************************}
            parambyname('IV_SEQ').AsInteger   := sequencial;
            parambyname('IV_LOJA').AsFloat    := frm_principal.x_loja;
            parambyname('IV_CAIX').AsFloat    := frm_principal.x_terminal;
            parambyname('IV_VEND').AsFloat    := frm_principal.x_venda;
            parambyname('IV_TIPZ').AsString   := '1';
            parambyname('IV_GRUP').AsFloat    := clAux.result('IA_GRUP');
            parambyname('IV_SUBG').AsFloat    := clAux.result('IA_SUBG');
            parambyname('IV_PROD').AsFloat    := clAux.result('IA_PROD');
            parambyname('IV_CORE').AsFloat    := clAux.result('IA_CORE');
            parambyname('IV_TAMA').AsString   := clAux.result('IA_TAMA');
            parambyname('IV_OTAM').AsInteger  := clAux.result('IA_OTAM');
            parambyname('IV_QTDE').AsFloat    := clAux.result('IA_QTDE');
            parambyname('IV_PVEN').AsFloat    := clAux.result('IA_PVEN');
            parambyname('IV_TOTA').AsFloat    := clAux.result('IA_TOTA');
            parambyname('IV_MODO').AsInteger  := clAux.result('IA_MODO');
            parambyname('IV_VEDE').AsFloat    := vendedor_atendimento;
            parambyname('IV_DATA').AsDateTime := frm_principal.x_data_trabalho;
            parambyname('IV_PCUS').AsFloat    := 0.00;
            parambyname('IV_PAQU').AsFloat    := 0.00;
            parambyname('IV_UPCU').AsFloat    := 0.00;
            parambyname('IV_DESC').AsFloat    := 0.00;
            parambyname('IV_PDES').AsFloat    := 0.00;
            parambyname('IV_ACRE').AsFloat    := 0.00;
            parambyname('IV_PACR').AsFloat    := 0.00;
            parambyname('IV_STAT').AsString   := '1';
                            {*******************************************************************}
            ExecSql;

            if frm_principal.x_ecf_habilita_modo_fiscal and
              frm_principal.x_ImpItemECF and
              (clAux.result('IA_MODO') = 0) and
              (Y_ImpVendaItens = 'C') then
            begin
              if (fcupom = '') then
                FCupom := BuscaProximoCOOCupom;

              clItem := TClassAuxiliar.Create;
              clItem.conect   ('VENDAS',self);
              with ClItem do
                try
                  AddParam ('SELECT *                          '); //simbolico
                  AddParam ('FROM ITENS_VENDAS_LOCAL           ');
                  AddParam ('WHERE (IV_LOJA=:loja) AND         ');
                  AddParam ('      (IV_CAIX=:caixa) AND        ');
                  AddParam ('      (IV_VEND=:codigo_venda) AND ');
                  AddParam ('      (IV_GRUP=:grupo) AND        ');
                  AddParam ('      (IV_SUBG=:subgrupo) AND     ');
                  AddParam ('      (IV_PROD=:produto) AND      ');
                  AddParam ('      (IV_CORE=:cor) AND          ');
                  AddParam ('      (IV_TAMA=:tam) AND          ');
                  AddParam ('      (IV_MODO=:modo)             ');
                  consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
                  consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
                  consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
                  consulta.parambyname('grupo').AsFloat        := clAux.result('IA_GRUP');
                  consulta.parambyname('subgrupo').AsFloat     := clAux.result('IA_SUBG');
                  consulta.parambyname('produto').AsFloat      := clAux.result('IA_PROD');
                  consulta.parambyname('cor').AsFloat          := clAux.result('IA_CORE');
                  consulta.parambyname('tam').AsString         := clAux.result('IA_TAMA');
                  consulta.parambyname('modo').AsInteger       := 0;
                  consulta.open;
                  impitemfiscal(ClItem);
                  self.refresh;
                finally
                  Desconect;
                  destroy;
                end;
            end;


            Novoitem1.click;
          end;
                        //......................................................

                       {---->}
          sequencial := sequencial + 1;
          clAux.next;
        end;
        clAux.desconect;
        clAux.Free;
                   //***********************************************************
        y_LISTA_atendimentos.Add (form_n  (terminal_atendimento,10)+'/'+
          form_n  (numero_atendimento,10));
                   {*******************************************************************}
        ExibeItens(y_item_inicial); {...}
                   {*******************************************************************}
        bPODE_SAIR:=false; {*}
                   {*******************************************************************}
        if (y_qtde_itens_distintos>8) then
          if ((y_qtde_itens_distintos - y_item_inicial)>=8) then
          begin
            y_item_inicial := y_item_inicial + 8;
            ExibeItens(y_item_inicial);
          end;
        AtualizaTotalVenda;
                   {*******************************************************************}
        SalvarVenda;
                   {*******************************************************************}
      end;
    end
    else
    if (frm_BuscaAtendimento.tecla=27) then
      if (frm_principal.x_vendedor=0) then
        Trocarvendedor1.click;
    frm_BuscaAtendimento.Free;
  end;
end;

procedure Tfrm_LancaVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //***********************************************************************************************

  if (frm_principal.x_solicitar_senha_SAIDA_LANCAMENTO_VENDA) then
  begin
    if (not bPODE_SAIR) then
    begin
      frm_senhaSupervisor.showmodal;
      if (not frm_senhaSupervisor.y_flag) then
        action := caNone;
      frm_senhaSupervisor.y_flag:=false;
    end
    else
      y_LISTA_atendimentos.Free;
  end
  else
    y_LISTA_atendimentos.Free;

  if  (action <> caNone) and
    frm_principal.x_ecf_habilita_modo_fiscal and
    frm_principal.x_ImpItemECF and
    CupomAberto then
    try
      frm_BotoesECF := Tfrm_BotoesECF.Create(Application);
      frm_BotoesECF.VeioVenda := true;
      frm_BotoesECF.botao4.onclick(frm_BotoesECF.botao4);
    finally
      frm_BotoesECF.Destroy;
    end;
     //***********************************************************************************************
end;

function Tfrm_LancaVenda.VerificaSeAtendimentoTemDevolucao(terminal,numero: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT IA_MODO FROM ITENS_ATENDIMENTOS    ');
  clAux.AddParam ('WHERE (IA_LOJA=:loja) AND                 ');
  clAux.AddParam ('      (IA_CAIX=:terminal) AND             ');
  clAux.AddParam ('      (IA_VEND=:numero) AND               ');
  clAux.AddParam ('      (IA_MODO=1)                         '); //DEVOLUCAO
  clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat  := terminal;
  clAux.consulta.parambyname('numero').AsFloat    := numero;
  result := clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaVenda.pnVendDblClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  linha: String;
begin
  if (Modo='ATENDIMENTO') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT DISTINCT IV_VEDE                              ');
    clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL                            ');
    clAux.AddParam ('WHERE (IV_LOJA=:loja) AND                            ');
    clAux.AddParam ('      (IV_CAIX=:terminal) AND                        ');
    clAux.AddParam ('      (IV_VEND=:venda)                               ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
    clAux.consulta.parambyname('venda').AsFloat    := frm_principal.x_venda;
    clAux.Execute;
    clAux.first;
    linha := 'Vendedor(es) participante(s) da venda: '#13#10;
    while (not clAux.eof) do
    begin
      linha := linha +
        form_nz(clAux.result('IV_VEDE'),6) + '-' +
        ProcuraNomeVend(frm_principal.x_loja,clAux.result('IV_VEDE'),self) + #13#10;
      clAux.next;
    end;
    if (clAux.reccount=0) then
      linha := '';
    clAux.desconect;
    clAux.Free;
  end
  else
  if (Modo='VENDEDOR') then
  begin
    linha := 'Vendedor participante da venda: '#13#10;
    linha := linha +
      form_nz(frm_principal.x_vendedor,6) + '-' +
      ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self) + #13#10;
  end;
  if (trim(linha)<>'') then
    showmessage (linha)
  else
    showmessage ('Sem vendedores definidos.');
end;

function Tfrm_LancaVenda.JaTeveDescontoNoPrimeiroAtendimento:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VE_DESC FROM VENDAS_LOCAL          ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                 ');
  clAux.AddParam ('      (VE_CAIX=:terminal) AND             ');
  clAux.AddParam ('      (VE_VEND=:numero)                   ');
  clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('numero').AsFloat    := frm_principal.x_venda;
  if (clAux.Execute) then
  begin
    if (clAux.result('VE_DESC')<>0.00) then
      result := true
    else
      result := false;
  end
  else
    result := false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaVenda.VerificaSeAtendimentoTeveExcesso(terminal,numero: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT AE_VALO FROM ATENDIMENTOS_EXCESSO  ');
  clAux.AddParam ('WHERE (AE_LOJA=:loja) AND                 ');
  clAux.AddParam ('      (AE_CAIX=:terminal) AND             ');
  clAux.AddParam ('      (AE_VEND=:numero)                   ');
  clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat  := terminal;
  clAux.consulta.parambyname('numero').AsFloat    := numero;
  result := clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaVenda.edtCBarraEAN13Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaVenda.edtCBarraEAN13Exit(Sender: TObject);
var
  cbarraEAN13: String;
  clAux: TClassAuxiliar;
begin
  cbarraEAN13 := Trim(edtCBarraEAN13.text);
  if (cbarraEAN13<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,PR_FORN,           ');
      AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,           ');
      AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC                    ');
      AddParam ('From   ESTOQUE,PRODUTOS                                   ');
      AddParam ('Where (ES_CEAN='+chr(39)+cbarraEAN13+chr(39)+') AND       ');
      AddParam ('      (ES_GRUP=PR_GRUP) AND                               ');
      AddParam ('      (ES_SUBG=PR_SUBG) AND                               ');
      AddParam ('      (ES_PROD=PR_CODI)                                   ');
      if (Execute) then
      begin
        pnProduto.caption   := result('PR_DESC');
        if (result('ES_TAMA')='0') then
          pnCor.caption     := ProcuraNomeCor(result('ES_CORE'),self)+
            ' - TAM UNICO'
        else
          pnCor.caption     := ProcuraNomeCor(result('ES_CORE'),self)+
            ' - TAM '+result('ES_TAMA');
        pnDescItem2EAN13.caption := result('ES_DESC');
        n_grupo    := result('ES_GRUP');
        n_subgrupo := result('ES_SUBG');
        n_produto  := result('ES_PROD');
        n_cor      := result('ES_CORE');
        n_tam      := result('ES_TAMA');
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
        edtGrupo.text    := form_nz (n_grupo,2);
        edtSubGrupo.text := form_nz (n_subgrupo,2);
        edtCodigo.text   := form_nz (n_produto,4);
        edtRefInt.text   := Trim(result('PR_REFI'));
        edtForn.text     := form_nz(result('PR_FORN'),6);
        edtRefFab.text   := Trim(result('ES_REFF'));
        edtCor.text      := form_nz (n_cor,4);
        edtFaixaTam.text := n_tam;
        edtCBarra.text   := Trim(result('ES_CBAR'));

                {informacoes acerca do produto}
        pnUnidade.caption := Result('PR_UNID');
      end
      else
      begin
        pnProduto.caption   := '';
        pnCor.caption       := '';
        pnDescItem2EAN13.caption := '<Item não encontrado>';
        n_grupo := 0;
        n_subgrupo := 0;
        n_produto := 0;
        n_cor := -1;
        n_tam := '-1';

                {informacoes acerca do produto}
        pnUnidade.caption   := '';
      end;
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaedit(edtCor);
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaedit(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_LancaVenda.edtCBarraEAN13KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clAux: TClassAuxiliar;
  cbarraEAN13: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    cbarraEAN13 := Trim(edtCBarra.text);
    edtCBarraEAN13Exit(Sender);
    edtQtde.setfocus;
  end;
  if (key=K_CIMA) then;
end;

procedure Tfrm_LancaVenda.edtCBarraDblClick(Sender: TObject);
begin
  btnLocalizar.click;
end;

procedure Tfrm_LancaVenda.edtRefIntDblClick(Sender: TObject);
begin
  btnLocalizar.click;
end;

procedure Tfrm_LancaVenda.edtRefFabDblClick(Sender: TObject);
begin
  btnLocalizar.click;
end;

procedure Tfrm_LancaVenda.FormDestroy(Sender: TObject);
begin
  FListaProd.Destroy;
  frm_LancaVenda := nil;
end;

function Tfrm_LancaVenda.ImpItemFiscal(FClAux: TClassAuxiliar):Boolean;
begin
  Result := true;
  if not CupomAberto then
    if not AbreCupom(FCupom) then
    begin
      Result := false;
      frmDialogo.ExibirMensagem ('Não foi possível abrir o cupom fiscal'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      exit;
    end//                             FCupom := BuscaProximoCOOCupom;
  ;

  CupomAberto := true;

  try
    if not CupomFiscal.LancaItemCupom(FClAux,'')  then
    begin
      Result := false;
      frmDialogo.ExibirMensagem ('Não foi possível imprimir esse item na impressora fiscal'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      exit;
    end;

    FListaProd.Add(formatfloat('0000000000',FClaux.result('IV_Grup'))+
      formatfloat('0000000000',FClaux.result('IV_SubG'))+
      formatfloat('0000000000',FClaux.result('IV_Prod'))+
      formatfloat('0000000000',FClaux.result('IV_Core'))+
      FClaux.result('IV_Tama')+'*');

    if FDadosItemDataRegis.CodigoDescricao <> '' then
      FListaProd[FlistaProd.Count - 1] := FListaProd[FlistaProd.Count - 1]+
        FDadosItemDataRegis.CodigoDescricao+
        FDadosItemDataRegis.Indice+
        FDadosItemDataRegis.Qtde+
        FDadosItemDataRegis.valor+
        FDadosItemDataRegis.PercDesconto;

  finally
    CupomAberto := CupomAberto or result;
    FDadosItemDataRegis.CodigoDescricao := '';
  end;
end;

function Tfrm_LancaVenda.DeletaItemVendaCupom(Grupo, SubG, Prod,
  Cor: Real; Tama: String): Boolean;
var
  i:Integer;
begin
  Result := false;
  for i:=FListaProd.Count - 1 downto 0  do
    if Pos(UpperCase(formatfloat('0000000000',Grupo)+
      formatfloat('0000000000',SubG)+
      formatfloat('0000000000',Prod)+
      formatfloat('0000000000',Cor)+
      Tama+'*'),UpperCase(FListaProd[i])) = 1 then
      if deletaitemecf(I + 1) then
        FListaProd.Delete(I);
  Result := true;
end;

Function Tfrm_LancaVenda.BuscaUnidadeProduto(grupo, subgrupo, produto: Real) : String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;
  clAux.AddParam('SELECT PR_UNID                               ');
  clAux.AddParam('FROM PRODUTOS                                ');
  clAux.AddParam('WHERE (PR_GRUP='+floattostr(grupo)+') AND    ');
  clAux.AddParam('      (PR_SUBG='+floattostr(subgrupo)+') AND ');
  clAux.AddParam('      (PR_CODI='+floattostr(produto)+')      ');
  if (clAux.Execute) then
    result := clAux.Result('PR_UNID')
  else
    result := '';
  clAux.Desconect;
  clAux.Free;
end;

end.
