             {* VERSAO COMPLETA DO SISTEMA DE ATENDIMENTOS / PEDIDOS DE VENDA}
{* ATENCAO: --------------------------------------------------------------------------------------------}
unit un_LancaAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, Db, DBTables, Menus, inifiles,
  FileCtrl, jpeg, ExtDlgs, ColorPanelOO, Cep, LabelOO;

type
  Tfrm_LancaAtendimento = class(TForm)
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
    spMaxiCod1: TStoredProc;
    spMaxiCod2: TStoredProc;
    servidor_vendas: TDatabase;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    Novavenda1: TMenuItem;
    Limparformulrio1: TMenuItem;
    servidor_estoque: TDatabase;
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
    qInsertLog: TQuery;
    TimerDicas: TTimer;
    spMaxiCod3: TStoredProc;
    spMaxiCod4: TStoredProc;
    spMaxiCod5: TStoredProc;
    spMaxiCod6: TStoredProc;
    PopupMenu1: TPopupMenu;
    Mudarcaixaparasituaoqualquer1: TMenuItem;
    Encerrarocaixa1: TMenuItem;
    SangriaReprovisionamento1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
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
    PopupMenu2: TPopupMenu;
    N8: TMenuItem;
    Alterarcordefundo1: TMenuItem;
    A1: TMenuItem;
    N9: TMenuItem;
    qGeraCampo: TQuery;
    OpenPictureDialog1: TOpenPictureDialog;
    pnLocal3: TPanel;
    Label6: TLabel;
    edtRefFab: TMaskEdit;
    btnLocalizar: TSpeedButton;
    edtOpcao: TEdit;
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
    Image3: TImage;
    pnSetaAbaixo: TPanel;
    Image4: TImage;
    pnSetaAcima: TPanel;
    Image5: TImage;
    pnBotaoMinimizar: TPanel;
    lblStatus: TLabel;
    lblSeq: TLabelOO;
    lbleituracbarra: TLabelOO;
    Mudarformadeleituradocdigodebarras1: TMenuItem;
    Label8: TLabel;
    edtForn: TMaskEdit;
    pnVend: TPanel;
    servidor_contaspagar: TDatabase;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    servidor_credito: TDatabase;
    Trocarvendedor1: TMenuItem;
    AlterarpreodeVenda1: TMenuItem;
    ConsultarCdigodeBarras1: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    SuspenderAtendimento1: TMenuItem;
    ReabrirAtendimentoSuspenso1: TMenuItem;
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
    procedure botaoF3Click(Sender: TObject);
    procedure Novoitem1Click(Sender: TObject);
    procedure Salvaritem1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCBarraEnter(Sender: TObject);
    procedure edtCBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizarClick(Sender: TObject);
    procedure Excluiritem1Click(Sender: TObject);
    procedure Concluirvenda1Click(Sender: TObject);
    procedure Salvarvenda1Click(Sender: TObject);
    procedure Impressorafiscal1Click(Sender: TObject);
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
    procedure Mudarformadeleituradocdigodebarras1Click(Sender: TObject);
    procedure edtFornEnter(Sender: TObject);
    procedure edtFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFornDblClick(Sender: TObject);
    procedure edtFornExit(Sender: TObject);
    procedure Trocarvendedor1Click(Sender: TObject);
    procedure AlterarpreodeVenda1Click(Sender: TObject);
    procedure edtCBarraDblClick(Sender: TObject);
    procedure pnVendDblClick(Sender: TObject);
    procedure ConsultarCdigodeBarras1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SuspenderAtendimento1Click(Sender: TObject);
    procedure ReabrirAtendimentoSuspenso1Click(Sender: TObject);
  private
    { Private declarations }
  public
    exibiu: Boolean;
    n_grupo,n_subgrupo,n_produto: Real;
    n_tam: String;
    n_cor: Real;
    n_cor_unica: Boolean;
    n_tam_unico: Boolean;
    n_ordem_f7: Integer;
    n_ordem_ctrf7: Integer;

    y_item_inicial: Integer;
    y_qtde_itens: Integer;
    y_qtde_itens_distintos: Integer;
    y_total_venda: Real;
    y_modo_venda: Integer; {0- VENDA NORMAL, 1- DEVOLUCAO, 2-TROCA SIMPLES}
    y_terminal_atendimento_suspenso: Real;
    y_codigo_atendimento_suspenso: Real;

    procedure AcendoBotao (sender: TPanel; flag: Boolean);
    procedure IniciarNovoAtendimento;
    procedure CalculaTotalAtendimento;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure LimparEdits;
    procedure MudaFocoCodigo;
    procedure CalculaTotalItem;
    procedure MudaFocoCodigoItem;
    procedure ExibeItens(item_inicial: Integer);
    procedure AtualizaTotalAtendimento;
    function PodeRealizarAtendimento:Boolean;
    function SalvarAtendimento:Boolean;
    function RetornaSaldoAtendimento:Real;
    function ExibeModoAtendimento(modo: Integer):String;
    function RetornaQtdeSaidas:Real;
    function RetornaQtdeEntradas:Real;
    function JaTeveDevolucao:Boolean; {*}
    function JaTeveVenda:Boolean; {*}
    function JaTeveTroca:Boolean; {*}
    function ProximoSequencialItem:Integer;
    function UltimoAtendimentoRegistradaNoEstoque:Real;

    function BuscaUnidadeProduto(grupo, subgrupo, produto: Real): String;
  end;

var
  frm_LancaAtendimento: Tfrm_LancaAtendimento;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, procura, venda, unDialogo, principal, auxiliar,
  un_senhaSupervisor, DM2, un_ConsultaProdutos, un_configLocal,
  unImpressoras, un_funcoesImpressora, un_ExcAtendimento,
  un_ConfirmaAtendimento, un_AjudaComandos, unSobre, produtos, unAtualizaBd,
  un_ALERTA, un_MudarLoja, un_MudarTerminal, un_MudarSeqAtdo,
  un_ResumoConexoes, un_BotoesOpcoes, un_LancaVenda_AlteraPreco,
  un_LancaAtdo_InformeVendedor, un_ConsultaCodigoDeBarras, unSenha_Atdo,
  un_AjudaComandos_Atdo, unMensagem, un_ExibeNumeroAtendimento,
  un_ReabrirAtendimentoSuspenso;

{Inicializacao dos dados do CAIXA ****}
procedure Tfrm_LancaAtendimento.AcendoBotao (sender: TPanel; flag: Boolean);
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

procedure Tfrm_LancaAtendimento.timerClockTimer(Sender: TObject);
begin
  pnHora.caption := FormatDateTime('hh:nn:ss',time);
end;

procedure Tfrm_LancaAtendimento.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancaAtendimento.Novavenda1Click(Sender: TObject);
begin
  if (JaTeveVenda) or (JaTeveTroca) or (JaTeveDevolucao) then
    if (frmDialogo.ExibirMensagem ('Abandonar atendimento atual?'
      ,'Atendimentos',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      IniciarNovoAtendimento;
  Novoitem1.click;
end;

procedure Tfrm_LancaAtendimento.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtSubGrupoEnter(Sender: TObject);
begin
  
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtQtdeEnter(Sender: TObject);
var
  clAux,clEstoque: TClassAuxiliar;
begin
     {***********************************************************************************************}
  if (n_grupo=0) or (n_subgrupo=0) or (n_produto=0) then
    if (gbItem_ProdCorTam.visible) then
      FocaCodigoLocal1
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus;
     {***********************************************************************************************}
  if (Trim(edtQtde.text)='') then
    if (gbItem_CBarra.visible) then
      if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
        edtQtde.text := '1'
      else
      if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
        edtQtde.text := '';
     {***********************************************************************************************}
  edtPreco.text := form_nc(DevolvePrecoItem (frm_principal.x_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),12);
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
        pnTotal.caption := '[ITEM N�O CADASTRADO]';
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

procedure Tfrm_LancaAtendimento.edtPrecoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtTotalEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.LimparEdits;
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
  pnQtdeTotal.caption  :='';
  pnTotalVenda.caption :='';
  pnProduto.caption    :='';
  pnCor.caption        :='';
  pnDescItem2.caption  :='';
  pnUnidade.caption    :='';
end;

procedure Tfrm_LancaAtendimento.edtQtdeKeyDown(Sender: TObject; var Key: Word;
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
      edtCBarra.setfocus;
end;

procedure Tfrm_LancaAtendimento.edtPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Salvaritem1.click;
  if (key=K_CIMA) then
    edtQtde.setfocus;
end;

procedure Tfrm_LancaAtendimento.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_LancaAtendimento.edtTotalExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancaAtendimento.edtPrecoExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancaAtendimento.edtPrecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancaAtendimento.edtTotalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_LancaAtendimento.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_LancaAtendimento.edtGrupoKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_LancaAtendimento.edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
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


procedure Tfrm_LancaAtendimento.edtCodigoDblClick(Sender: TObject);
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

procedure Tfrm_LancaAtendimento.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_LancaAtendimento.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_LancaAtendimento.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_LancaAtendimento.edtRefIntKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.edtCodigoKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.MudaFocoCodigo;
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

procedure Tfrm_LancaAtendimento.FocaCodigoLocal1;
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

procedure Tfrm_LancaAtendimento.FocaCodigoLocal2;
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

procedure Tfrm_LancaAtendimento.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_LancaAtendimento.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_LancaAtendimento.edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_LancaAtendimento.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
end;

procedure Tfrm_LancaAtendimento.edtCorKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.CalculaTotalItem;
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

procedure Tfrm_LancaAtendimento.edtQtdeChange(Sender: TObject);
begin
  CalculaTotalItem;
end;

procedure Tfrm_LancaAtendimento.edtPrecoChange(Sender: TObject);
begin
  CalculaTotalItem;
end;

procedure Tfrm_LancaAtendimento.botaoF3Click(Sender: TObject);
begin
     
end;

{Preparacao para insercao de um novo item ***}
procedure Tfrm_LancaAtendimento.Novoitem1Click(Sender: TObject);
begin
  frm_senhaSupervisor.y_flag:=false;
  pnTotal.color      :=clBlack;
  pnTotal.caption    :=' Subtotal R$ ';
  pnTotal.alignment := taRightJustify;
  pnTotal.color   := clBlack;
  if (gbItem_ProdCorTam.visible) then
    FocaCodigoLocal1
  else
  if (gbItem_CBarra.visible) then
    edtCBarra.setfocus;
  edtGrupo.text      :='';
  edtSubGrupo.text   :='';
  edtCodigo.text     :='';
  edtRefInt.text     :='';
  edtCBarra.text     :='';
  edtForn.text       :='';
  edtRefFab.text     :='';
  edtCor.text        :='';
  edtFaixaTam.text   :='';
  pnProduto.caption  :='';
  pnCor.caption      :='';
  pnDescItem2.caption:='';
  pnUnidade.caption  :='';
  habilitaEditVerde(edtCor);
  habilitaEditVerde(edtFaixaTam);
  edtQtde.text       :='';
  edtPreco.text      :='';
  pnTotal.caption    :=' Subtotal R$ ';
end;

procedure Tfrm_LancaAtendimento.Salvaritem1Click(Sender: TObject);
var
  preco,qtde,total: Real;
  clAux,clEstoque: TClassAuxiliar;
  continua: Boolean;
begin
     {CRITICA AOS DADOS ***}
  if (frm_principal.x_vendedor=0) then
    frmDialogo.ExibirMensagem ('Vendedor indefinido! Lan�amento do item n�o permitido!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (Trim(edtQtde.text)='') then
  begin
    frmDialogo.ExibirMensagem ('A qtde. do item deve ser informada!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtQtde.setfocus;
  end
  else
  if (Trim(edtPreco.text)='') or (Trim(edtPreco.text)='0,00') then
  begin
    frmDialogo.ExibirMensagem ('O pre�o de venda do item deve ser informado!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtPreco.setfocus;
  end
  else
  if (not PodeRealizarAtendimento) then
     {//nao precisa de mensagem}
  else
  if ((y_modo_venda=0) or (y_modo_venda=2)) and (JaTeveDevolucao) then
  begin
    frmDialogo.ExibirMensagem ('J� houve DEVOLU��O na venda informada!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('VENDA / TROCA n�o permitida!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Novoitem1.click;
  end
  else
  if (y_modo_venda=1) and ((JaTeveVenda) or (JaTeveTroca)) then
  begin
    frmDialogo.ExibirMensagem ('J� houve VENDA / TROCA na venda informada!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('DEVOLU��O n�o permitida!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Novoitem1.click;
  end
  else
  if (SalvarAtendimento) then {... - para ter certeza que salvou}
  begin
    continua := true;
    if (gbItem_ProdCorTam.visible) then
    begin
      pnTotal.alignment := taRightJustify;
      pnTotal.color   := clBlack;
      clEstoque := TClassAuxiliar.Create;
      clEstoque.conect   (databaseprodutos,frm_principal);
      clEstoque.ClearSql;
      clEstoque.AddParam ('Select * From ESTOQUE                            ');
      clEstoque.AddParam ('Where  (ES_GRUP='+floattostr(n_grupo)+') AND     ');
      clEstoque.AddParam ('       (ES_SUBG='+floattostr(n_subgrupo)+') AND  ');
      clEstoque.AddParam ('       (ES_PROD='+floattostr(n_produto)+') AND   ');
      clEstoque.AddParam ('       (ES_CORE='+floattostr(n_cor)+') AND       ');
      clEstoque.AddParam ('       (ES_TAMA='+chr(39)+n_tam+chr(39)+')       ');
      if (not clEstoque.Execute) then
      begin
        pnTotal.caption := '[ITEM N�O CADASTRADO]';
        pnTotal.color   := clRed;
        continua        := false;
      end;
      clEstoque.desconect;
      clEstoque.Free;
    end
    else
    if (gbItem_Cbarra.visible) then
    begin
      pnTotal.alignment := taRightJustify;
      pnTotal.color     := clBlack;
      clEstoque := TClassAuxiliar.Create;
      clEstoque.conect   (databaseprodutos,frm_principal);
      clEstoque.ClearSql;
      clEstoque.AddParam ('Select * From ESTOQUE                                       ');
      clEstoque.AddParam ('Where  (ES_CBAR='+chr(39)+trim(edtCBarra.text)+chr(39)+')   ');
      if (not clEstoque.Execute) then
      begin
        pnTotal.caption := '[ITEM N�O CADASTRADO]';
        pnTotal.color   := clRed;
        continua        := false;
      end;
      clEstoque.desconect;
      clEstoque.Free;
    end;

                 {...}
    if (continua) then
    begin
                     {**********************************************************************}
      qtde  := strtofloat(edtQtde.text); {sempre positivo}
      preco := strtofloat(RetiraFormatacaoNumero(edtPreco.text)); {sempre positivo}
      total := qtde*preco;

                     {//o total � negativo/positivo dependendo do modo de venda}
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
      clAux.AddParam ('SELECT IA_LOJA                    '); //simbolico
      clAux.AddParam ('FROM ITENS_ATDO_LOCAL             ');
      clAux.AddParam ('WHERE (IA_LOJA=:loja) AND         ');
      clAux.AddParam ('      (IA_CAIX=:caixa) AND        ');
      clAux.AddParam ('      (IA_VEND=:codigo_venda) AND ');
      clAux.AddParam ('      (IA_GRUP=:grupo) AND        ');
      clAux.AddParam ('      (IA_SUBG=:subgrupo) AND     ');
      clAux.AddParam ('      (IA_PROD=:produto) AND      ');
      clAux.AddParam ('      (IA_CORE=:cor) AND          ');
      clAux.AddParam ('      (IA_TAMA=:tam) AND          ');
      clAux.AddParam ('      (IA_MODO=:modo)             ');
      clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
      clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
      clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_atendimento;
      clAux.consulta.parambyname('grupo').AsFloat        := n_grupo;
      clAux.consulta.parambyname('subgrupo').AsFloat     := n_subgrupo;
      clAux.consulta.parambyname('produto').AsFloat      := n_produto;
      clAux.consulta.parambyname('cor').AsFloat          := n_cor;
      clAux.consulta.parambyname('tam').AsString         := n_tam;
      clAux.consulta.parambyname('modo').AsInteger       := y_modo_venda;
      if (not clAux.Execute) then
        with (DMCaixa.qInsereItemAtendimento) do
        begin
                              {*******************************************************************}
          parambyname('IA_SEQ').AsInteger  := ProximoSequencialItem;
          parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
          parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
          parambyname('IA_VEND').AsFloat   := frm_principal.x_atendimento;
          parambyname('IA_GRUP').AsFloat   := n_grupo;
          parambyname('IA_SUBG').AsFloat   := n_subgrupo;
          parambyname('IA_PROD').AsFloat   := n_produto;
          parambyname('IA_TAMA').AsString  := n_tam;
          parambyname('IA_OTAM').AsInteger := InformaOrdemTamanho(n_grupo,n_subgrupo,n_produto,n_tam);
          parambyname('IA_CORE').AsFloat   := n_cor;
          parambyname('IA_QTDE').AsFloat   := qtde;
          parambyname('IA_PVEN').AsFloat   := preco;
          parambyname('IA_TOTA').AsFloat   := total; {+ VENDA - DEVOLUCAO/TROCA}
          parambyname('IA_MODO').AsInteger := y_modo_venda; {VENDA/DEVOLUCAO/TROCA}
                              {*******************************************************************}
          ExecSql;
          Novoitem1.click;
        end
      else
        with (DMCaixa.qAlteraItemAtendimento) do
        begin
                              {*******************************************************************}
          parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
          parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
          parambyname('IA_VEND').AsFloat   := frm_principal.x_atendimento;
          parambyname('IA_GRUP').AsFloat   := n_grupo;
          parambyname('IA_SUBG').AsFloat   := n_subgrupo;
          parambyname('IA_PROD').AsFloat   := n_produto;
          parambyname('IA_TAMA').AsString  := n_tam;
          parambyname('IA_CORE').AsFloat   := n_cor;
          parambyname('IA_QTDE').AsFloat   := qtde;
          parambyname('IA_PVEN').AsFloat   := preco;
          parambyname('IA_TOTA').AsFloat   := total; {+ VENDA - DEVOLUCAO/TROCA}
          ExecSql;
                              {*******************************************************************}
          Novoitem1.click;
                              {*******************************************************************}
        end;
      clAux.desconect;
      clAux.Free;
                     {*******************************************************************}
      ExibeItens(y_item_inicial); {...}
      AtualizaTotalAtendimento;
                     {*******************************************************************}
    end;
  end{**************************************************************}{**************************************************************};
end;

procedure Tfrm_LancaAtendimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    close;
  if (shift=[ssCtrl]) then
    if (key=K_F7) then
      MudaFocoCodigoItem;
  if (key=K_PGUP) then
    if (y_qtde_itens_distintos<>0) then
    begin
      if (y_item_inicial>10) then
        y_item_inicial:=y_item_inicial-10
      else
        y_item_inicial:=1;
      ExibeItens(y_item_inicial);
    end;
  if (key=K_PGDOWN) then
    if (y_qtde_itens_distintos<>0) then
      if ((y_qtde_itens_distintos - y_item_inicial)>=10) then
      begin
        y_item_inicial := y_item_inicial + 10;
        ExibeItens(y_item_inicial);
      end;
end;

procedure Tfrm_LancaAtendimento.MudaFocoCodigoItem;
begin
  gbItem_CBarra.visible     := false;
  gbItem_ProdCorTam.visible := false;
  n_ordem_ctrf7 := n_ordem_ctrf7 + 1;
  if (n_ordem_ctrf7=3) then
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
  end;
end;

procedure Tfrm_LancaAtendimento.edtCBarraEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtCBarraKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.btnLocalizarClick(Sender: TObject);
begin
  if (frm_principal.x_vendedor=0) then
    frmDialogo.ExibirMensagem ('Vendedor indefinido! Busca por produto n�o permitida!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
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
    frm_ConsultaProduto.y_RotinaChamadora:=5;
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
        edtCorExit(Sender);
        edtQtde.setfocus; {***}
      end
      else
        Limparformulrio1.click;
    frm_ConsultaProduto.Free;
  end;
end;

procedure Tfrm_LancaAtendimento.ExibeItens(item_inicial: Integer);
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
  clAux.AddParam ('SELECT * FROM ITENS_ATDO_LOCAL                    ');
  clAux.AddParam ('WHERE (IA_LOJA=:loja) AND                         ');
  clAux.AddParam ('      (IA_CAIX=:caixa) AND                        ');
  clAux.AddParam ('      (IA_VEND=:codigo_venda) AND                 ');
  clAux.AddParam ('      (IA_SEQ>='+inttostr(item_inicial)+')        ');
  clAux.AddParam ('ORDER BY IA_SEQ                                   ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_atendimento;
  pnExibeItens.ClearAll;
     {pnExibeItens.SetFontConfig('Courier New',12,[fsBold],clWhite);
     pnExibeItens.AddLine ('------------- ITENS DA VENDA ------------',clBlack);
     pnExibeItens.AddLine (' Sq  Cod            Descricao do item    ',clBlack);
     pnExibeItens.AddLine ('         Cor  Tam    Qtde   Pre�o  Total ',clBlack);
     pnExibeItens.AddLine ('-----------------------------------------',clBlack);}
  pnExibeItens.SetFontConfig('Courier New',10,[fsBold],clWhite);
  pnExibeItens.AddLine ('------------------- ITENS DA VENDA -------------------',clBlack);
  pnExibeItens.AddLine (' Sq  Cod            Descricao do item        Unidade  ',clBlack);
  pnExibeItens.AddLine ('      Cor   Tam       Qtde    Pre�o      Total        ',clBlack);
  pnExibeItens.AddLine ('------------------------------------------------------',clBlack);
  if (clAux.Execute) then
  begin
    itens_exibidos := 1;
    total_itens_a_serem_exibidos := 10; {* fixo, depende da fonte de exibicao}
    clAux.first;
    while (not clAux.eof) and
      (itens_exibidos<=total_itens_a_serem_exibidos) do
    begin
      {************************************************************}
      descricao     := Trim(ProcuraNomeProdutos_1 (
        clAux.result('IA_GRUP'),
        clAux.result('IA_SUBG'),
        clAux.result('IA_PROD'),
        self));
      codigo_barras := form_t(RetornaCodigoDeBarrasDoItem(clAux.result('IA_GRUP'),
        clAux.result('IA_SUBG'),
        clAux.result('IA_PROD'),
        clAux.result('IA_CORE'),
        clAux.result('IA_TAMA')),14);
      total         := clAux.result('IA_TOTA');
      if (Trim(clAux.result('IA_TAMA'))<>'0') then
        tamanho  := clAux.result('IA_TAMA')
      else
        tamanho  := 'UNICO';
      {************************************************************}
      if (clAux.result('IA_MODO')=0) then {VENDA}
      begin
        cor_item := clBlack;
        stModo:='V';
      end
      else
      if (clAux.result('IA_MODO')=1) then
      begin
        cor_item := clRed;
        stModo:='D';
      end {DEVOLUCAO}
      else
      if (clAux.result('IA_MODO')=2) then
      begin
        cor_item := clBlue;
        stModo:='T';
      end; {TROCA}

      unidade := BuscaUnidadeProduto(clAux.Result('IA_GRUP'),clAux.Result('IA_SUBG'),clAux.Result('IA_PROD'));
      {************************************************************}
      ind := clAux.result('IA_SEQ');
      pnExibeItens.AddLine(' '+
        form_nz (ind,2)+'. '+
        form_t  (codigo_barras,14)+' '+
        form_t  (descricao,22)+' '+
        stModo,
        cor_item);
      //if (RetornaApelidoEmpresa='PONTO DO AR') or (RetornaApelidoEmpresa='ESTACAO DO AR') then
                     {pnExibeItens.AddLine('        '+form_t (ProcuraAbrevCor(clAux.result('IA_CORE'),self),5)+' '+
                                    form_t  (tamanho,5)    +' '+
                                    Trim(form_nc2(clAux.result('IA_QTDE'),10,3))+' '+
                                    Trim(form_nc (clAux.result('IA_PVEN'),10))+' '+
                                    Trim(form_nc (total,10)),
                                    cor_item)}
        pnExibeItens.AddLine('      '+form_t (ProcuraAbrevCor(clAux.result('IA_CORE'),self),5)+' '+
          form_t  (tamanho,5)    +'     '+
          form_t(Trim(form_nc2(clAux.result('IA_QTDE'),8,3)),8)+''+
          form_t(Trim(form_nc (clAux.result('IA_PVEN'),10)),11)+''+
          Trim(form_nc (total,10)),
          cor_item);
      //else
        {pnExibeItens.AddLine('        '+form_t (ProcuraAbrevCor(clAux.result('IA_CORE'),self),5)+' '+
          form_t  (tamanho,5)    +' '+
          form_n  (clAux.result('IA_QTDE'),4)+' '+
          Trim(form_nc (clAux.result('IA_PVEN'),10))+' '+
          Trim(form_nc (total,10)),
          cor_item); }
      {************************************************************}
      itens_exibidos := itens_exibidos + 1;

      {---->}
      clAux.next;
    end;
  end;
  pnExibeItens.AddLine('',clBlack);
  CalculaTotalAtendimento;
  clAux.desconect;
  clAux.Free;
     {************************************************************}
  if (y_item_inicial=1) and (y_qtde_itens_distintos>10) then
      pnSetaAbaixo.visible:=true
    else
      pnSetaAbaixo.visible:=false;
    if (y_item_inicial>10) then
      pnSetaAcima.visible:=true
    else
      pnSetaAcima.visible:=false;
    if (y_item_inicial=11) and (y_qtde_itens_distintos>20) then
      pnSetaAbaixo.visible:=true;
    if (y_item_inicial=21) and (y_qtde_itens_distintos>30) then
      pnSetaAbaixo.visible:=true;
     {************************************************************}
end;

function Tfrm_LancaAtendimento.SalvarAtendimento:Boolean;
var
  clAux,clAux2: TClassAuxiliar;
  icms: Real;
begin
     {CRITICA AOS DADOS}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux2 := TClassAuxiliar.Create;
  clAux2.conect  ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ATDO_LOCAL                       ');
  clAux.AddParam ('WHERE (AT_LOJA=:loja) AND                      ');
  clAux.AddParam ('      (AT_CAIX=:caixa) AND                     ');
  clAux.AddParam ('      (AT_CODI=:codigo_venda)                  ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_atendimento;
  if (not clAux.Execute) then
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO ATDO_LOCAL(AT_CAIX,AT_LOJA,AT_CODI,AT_FUNC,AT_DATA,AT_OPER,AT_TOTA,AT_QTDE,AT_QTD1,AT_QTD2,AT_VEND,AT_NOME,AT_ONLI,AT_ENVI,AT_STAT,AT_DESC)  ');
    clAux2.AddParam ('VALUES (:AT_CAIX,:AT_LOJA,:AT_CODI,:AT_FUNC,:AT_DATA,:AT_OPER,:AT_TOTA,:AT_QTDE,:AT_QTD1,:AT_QTD2,:AT_VEND,:AT_NOME,:AT_ONLI,:AT_ENVI,:AT_STAT,:AT_DESC) ');
    clAux2.consulta.parambyname('AT_LOJA').AsFloat    := frm_principal.x_loja;
    clAux2.consulta.parambyname('AT_CAIX').AsFloat    := frm_principal.x_terminal;
    clAux2.consulta.parambyname('AT_CODI').AsFloat    := frm_principal.x_atendimento;
    clAux2.consulta.parambyname('AT_FUNC').AsFloat    := 0;
    clAux2.consulta.parambyname('AT_OPER').AsFloat    := 0;
    clAux2.consulta.parambyname('AT_DATA').AsDateTime := frm_principal.x_data_trabalho;
    clAux2.consulta.parambyname('AT_OPER').AsFloat    := 0;
    if (pnTotalVenda.caption<>'') then
      clAux2.consulta.parambyname('AT_TOTA').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnTotalVenda.caption))
    else
      clAux2.consulta.parambyname('AT_TOTA').AsFloat  := 0.00;
    clAux2.consulta.parambyname('AT_DESC').AsFloat       := 0.00;
    if (pnQtdeTotal.caption<>'') then
      clAux2.consulta.parambyname('AT_QTDE').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnQtdeTotal.caption))
    else
      clAux2.consulta.parambyname('AT_QTDE').AsFloat  := 0;
    clAux2.consulta.parambyname('AT_QTD1').AsFloat  := 0;
    clAux2.consulta.parambyname('AT_QTD2').AsFloat  := 0;
    clAux2.consulta.parambyname('AT_STAT').AsString := '0';
    clAux2.consulta.parambyname('AT_VEND').AsFloat  := frm_principal.x_vendedor;
    clAux2.consulta.parambyname('AT_NOME').AsString := '';
    if (frm_principal.x_online) then
    begin
      clAux2.consulta.parambyname('AT_ONLI').AsString := '1';
      clAux2.consulta.parambyname('AT_ENVI').AsString := '1';
    end
    else
    begin
      clAux2.consulta.parambyname('AT_ONLI').AsString := '0';
      clAux2.consulta.parambyname('AT_ENVI').AsString := '0';
    end;
    clAux2.Execute;
  end
  else
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('UPDATE ATDO_LOCAL                        ');
    clAux2.AddParam ('SET AT_CAIX=:AT_CAIX,AT_LOJA=:AT_LOJA,   ');
    clAux2.AddParam ('    AT_CODI=:AT_CODI,                    ');
    clAux2.AddParam ('    AT_OPER=:AT_OPER,                    ');
    clAux2.AddParam ('    AT_QTDE=:AT_QTDE,AT_STAT=:AT_STAT,   ');
    clAux2.AddParam ('    AT_VEND=:AT_VEND,AT_TOTA=:AT_TOTA,   ');
    clAux2.AddParam ('    AT_NOME=:AT_NOME,AT_QTD1=:AT_QTD1,   ');
    clAux2.AddParam ('    AT_QTD2=:AT_QTD2,AT_ONLI=:AT_ONLI,   ');
    clAux2.AddParam ('    AT_ENVI=:AT_ENVI                     ');
    clAux2.AddParam ('WHERE (AT_LOJA=:AT_LOJA) AND             ');
    clAux2.AddParam ('      (AT_CAIX=:AT_CAIX) AND             ');
    clAux2.AddParam ('      (AT_CODI=:AT_CODI)                 ');
    clAux2.consulta.parambyname('AT_LOJA').AsFloat  := frm_principal.x_loja;
    clAux2.consulta.parambyname('AT_CAIX').AsFloat  := frm_principal.x_terminal;
    clAux2.consulta.parambyname('AT_CODI').AsFloat  := frm_principal.x_atendimento;
    clAux2.consulta.parambyname('AT_OPER').AsFloat  := frm_principal.x_codigousuario;
    if (pnTotalVenda.caption<>'') then
      clAux2.consulta.parambyname('AT_TOTA').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnTotalVenda.caption))
    else
      clAux2.consulta.parambyname('AT_TOTA').AsFloat  := 0.00;
    if (pnQtdeTotal.caption<>'') then
      clAux2.consulta.parambyname('AT_QTDE').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnQtdeTotal.caption))
    else
      clAux2.consulta.parambyname('AT_QTDE').AsFloat  := 0.00;
    clAux2.consulta.parambyname('AT_QTD1').AsFloat  := 0;
    clAux2.consulta.parambyname('AT_QTD2').AsFloat  := 0;
    clAux2.consulta.parambyname('AT_STAT').AsString := clAux.result('AT_STAT');
    clAux2.consulta.parambyname('AT_VEND').AsFloat  := frm_principal.x_vendedor;
    clAux2.consulta.parambyname('AT_NOME').AsString := '';
    clAux2.consulta.parambyname('AT_ENVI').AsString := '0'; //inicia como nao enviado
    if (frm_principal.x_online) then
    begin
      clAux2.consulta.parambyname('AT_ONLI').AsString := '1';
      clAux2.consulta.parambyname('AT_ENVI').AsString := '1';
    end
    else
    begin
      clAux2.consulta.parambyname('AT_ONLI').AsString := '0';
      clAux2.consulta.parambyname('AT_ENVI').AsString := '0';
    end;
    clAux2.Execute;
  end;
  clAux.desconect;
  clAux.Free;
  clAux2.desconect;
  clAux2.Free;
  result := true;
end;

procedure Tfrm_LancaAtendimento.Excluiritem1Click(Sender: TObject);
begin
  if (frm_principal.x_atendimento=0) then
    frmDialogo.ExibirMensagem ('Informe o c�digo da venda!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  begin
    Application.CreateForm(Tfrm_ExcAtendimento,frm_ExcAtendimento);
    with (frm_ExcAtendimento.qItens) do
    begin
      close;
      parambyname('loja').AsFloat         := frm_principal.x_loja;
      parambyname('caixa').AsFloat        := frm_principal.x_terminal;
      parambyname('codigo_venda').AsFloat := frm_principal.x_atendimento;
      open;
    end;
    frm_ExcAtendimento.showmodal;
    frm_ExcAtendimento.Free;
          {*********************************************************************}
    ExibeItens(y_item_inicial); {...}
    AtualizaTotalAtendimento;
          {*********************************************************************}
  end;
end;

procedure Tfrm_LancaAtendimento.AtualizaTotalAtendimento;
var
  clAux2,clAux3: TClassAuxiliar;
  icms: Real;
begin
  clAux2 := TClassAuxiliar.Create;
  clAux2.conect   ('VENDAS',self);
  clAux2.ClearSql;
  clAux2.AddParam ('UPDATE ATDO_LOCAL             ');
  clAux2.AddParam ('SET    AT_TOTA=:AT_TOTA,      ');
  clAux2.AddParam ('       AT_QTDE=:AT_QTDE,      ');
  clAux2.AddParam ('       AT_QTD1=:AT_QTD1,      ');
  clAux2.AddParam ('       AT_QTD2=:AT_QTD2       ');
  clAux2.AddParam ('WHERE (AT_LOJA=:AT_LOJA) AND  ');
  clAux2.AddParam ('      (AT_CAIX=:AT_CAIX) AND  ');
  clAux2.AddParam ('      (AT_CODI=:AT_CODI)      ');
  clAux2.consulta.parambyname('AT_LOJA').AsFloat  := frm_principal.x_loja;
  clAux2.consulta.parambyname('AT_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux2.consulta.parambyname('AT_CODI').AsFloat  := frm_principal.x_atendimento;
  if (pnTotalVenda.caption<>'') then
    clAux2.consulta.parambyname('AT_TOTA').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnTotalVenda.caption))
  else
    clAux2.consulta.parambyname('AT_TOTA').AsFloat  := 0.00;
  if (pnQtdeTotal.caption<>'') then
    clAux2.consulta.parambyname('AT_QTDE').AsFloat  := strtofloat(RetiraFormatacaoNumero(pnQtdeTotal.caption))
  else
    clAux2.consulta.parambyname('AT_QTDE').AsFloat  := 0.00;
  clAux2.consulta.parambyname('AT_QTD1').AsFloat  := RetornaQtdeSaidas; {saidas}
  clAux2.consulta.parambyname('AT_QTD2').AsFloat  := RetornaQtdeEntradas; {entradas}
  clAux2.Execute;
  clAux2.desconect;
  clAux2.Free;
end;

procedure Tfrm_LancaAtendimento.Concluirvenda1Click(Sender: TObject);
begin
  {***************************************************************************************}
  if (y_qtde_itens_distintos=0) then
    frmDialogo.ExibirMensagem ('N�o foram informados itens para     o atendimento!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (JaTeveTroca) and (not JaTeveVenda) then
  begin
    frmDialogo.ExibirMensagem ('Informe o item que ser� TROCADO!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Novoitem1.click;
  end
  else
  begin
    Application.CreateForm(Tfrm_ConfirmaAtendimento, frm_ConfirmaAtendimento);
    frm_ConfirmaAtendimento.y_subtotal := strtofloat(RetiraFormatacaoNumero(trim(pnTotalVenda.caption)));
    frm_ConfirmaAtendimento.tecla      := 27;
    frm_ConfirmaAtendimento.showmodal;
    if (frm_ConfirmaAtendimento.tecla=13) then
    begin
      frm_principal.x_vendedor := 0; //VENDEDOR NAO DEFINIDO
      pnVend.caption           := ' Vend: INDEFINIDO';
      IniciarNovoAtendimento;
      Trocarvendedor1.click;
    end;
    frm_ConfirmaAtendimento.Free;
  end;
  {***************************************************************************************}
end;

procedure Tfrm_LancaAtendimento.Salvarvenda1Click(Sender: TObject);
begin
     {***************************************************************************************}
  if (PodeRealizarAtendimento) then
    SalvarAtendimento;
     {***************************************************************************************}
end;

function Tfrm_LancaAtendimento.RetornaSaldoAtendimento:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_ATDO_LOCAL      ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND          ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND          ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND)              ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat   := frm_principal.x_atendimento;
  clAux.Execute;
  if (clAux.reccount=0) then
    result:=1.00
  else
  if (Trim(pnTotalVenda.caption)<>'') then
    result := strtofloat(RetiraFormatacaoNumero(Trim(pnTotalVenda.caption)))
  else
    result := 1.00;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaAtendimento.Impressorafiscal1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_funcoesImpressora, frm_funcoesImpressora);
  frm_funcoesImpressora.showmodal;
  frm_funcoesImpressora.Free;
end;

procedure Tfrm_LancaAtendimento.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtRefFabKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.edtCodigoExit(Sender: TObject);
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

procedure Tfrm_LancaAtendimento.edtRefIntExit(Sender: TObject);
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

procedure Tfrm_LancaAtendimento.edtRefFabExit(Sender: TObject);
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
      AddParam ('Where (PR_REFF='+chr(39)+reffabric+chr(39)+') AND  ');
      AddParam ('      (PR_FORN='+forn+')                           ');
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

procedure Tfrm_LancaAtendimento.edtCBarraExit(Sender: TObject);
var
  cbarra: String;
  clAux: TClassAuxiliar;
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
      if (Execute) then
      begin
        pnProduto.caption   := result('PR_DESC');
        if (result('ES_TAMA')='0') then
          pnCor.caption     := ProcuraNomeCor(result('ES_CORE'),self)+
            ' - TAM '+result('ES_TAMA')
        else
          pnCor.caption     := ProcuraNomeCor(result('ES_CORE'),self)+
            ' - TAM ';
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
        pnDescItem2.caption := '<Item n�o encontrado>';
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

procedure Tfrm_LancaAtendimento.edtCorExit(Sender: TObject);
var
  desc_cor,desc_tam: String;
begin
  if (n_cor<>-1) then
    desc_cor := ProcuraNomeCor(n_cor,self)
  else
    desc_cor := '';
  if (desc_cor='<Cor n�o cadastrada>') then
  begin
    frmDialogo.ExibirMensagem ('Cor n�o existente para este produto!'
      ,'Atendimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    desc_cor := '';
    edtCor.SetFocus;
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
end;

procedure Tfrm_LancaAtendimento.edtFaixaTamExit(Sender: TObject);
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

function Tfrm_LancaAtendimento.ExibeModoAtendimento(modo: Integer):String;
begin
  if (modo=0) then
    result:='Venda>>>'
  else
  if (modo=1) then
    result:='<<<Devolu��o'
  else
  if (modo=2) then
    result:='<<<Troca>>>';
end;

procedure Tfrm_LancaAtendimento.Alterarmododevenda1Click(Sender: TObject);
begin
  if (y_modo_venda=0) then
  begin
          {********************************************************************************}
    if (frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO_Atdo) then
    begin
      if (not frm_senhaSupervisor.y_flag) then
        frm_senhaSupervisor.showmodal;
    end
    else
      frm_senhaSupervisor.y_flag := true;
          {********************************************************************************}

          {...}
    if (frm_senhaSupervisor.y_flag) then
    begin
      y_modo_venda:=2;
      lblModoVenda.font.color:=clBlue;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_troca;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_troca;
    end
    else
    begin
      y_modo_venda:=0;
      lblModoVenda.font.color:=clBlack;
      frm_senhaSupervisor.y_flag:=false;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
    end;
          {********************************************************************************}
  end
  else
  if (y_modo_venda=2) then
  begin
          {********************************************************************************}
    if (frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO_Atdo) then
    begin
      if (not frm_senhaSupervisor.y_flag) then
        frm_senhaSupervisor.showmodal;
    end
    else
      frm_senhaSupervisor.y_flag := true;
          {********************************************************************************}

          {...}
    if (frm_senhaSupervisor.y_flag) then
    begin
      y_modo_venda:=1;
      lblModoVenda.font.color:=clRed;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_devolucao;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_devolucao;
    end
    else
    begin
      y_modo_venda:=0;
      lblModoVenda.font.color:=clBlack;
      frm_senhaSupervisor.y_flag:=false;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
      frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
    end;
          {********************************************************************************}
  end
  else
  if (y_modo_venda=1) then
  begin
    y_modo_venda:=0;
    lblModoVenda.font.color:=clBlack;
    frm_senhaSupervisor.y_flag:=false;
    frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
    frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
  end;

     //C. BARRAS INTERNO
  lblModoVenda.caption := ExibeModoAtendimento(y_modo_venda);
  if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    lbleituracbarra.caption := '>leitura manual da qtde.'
  else
  if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    lbleituracbarra.caption := '>leitura direta';
end;

function Tfrm_LancaAtendimento.RetornaQtdeSaidas:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IA_QTDE) as TOTAL_SAIDAS  ');
  clAux.AddParam ('FROM   ITENS_ATDO_LOCAL              ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND         ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND         ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND) AND         ');
  clAux.AddParam ('      (IA_TOTA>0)                    ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat  := frm_principal.x_atendimento;
  clAux.Execute;
  result := clAux.result('TOTAL_SAIDAS');
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaAtendimento.RetornaQtdeEntradas:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IA_QTDE) as TOTAL_ENTRADAS  ');
  clAux.AddParam ('FROM   ITENS_ATDO_LOCAL                ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND           ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND           ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND) AND           ');
  clAux.AddParam ('      (IA_TOTA<0)                      ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat  := frm_principal.x_atendimento;
  clAux.Execute;
  result := clAux.result('TOTAL_ENTRADAS');
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaAtendimento.Limparformulrio1Click(Sender: TObject);
begin
  Novoitem1.click;
end;

procedure Tfrm_LancaAtendimento.Ajuda1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_AjudaComandos_Atdo, frm_AjudaComandos_Atdo);
  frm_AjudaComandos_Atdo.showmodal;
  frm_AjudaComandos_Atdo.Free;
end;

procedure Tfrm_LancaAtendimento.IniciarNovoAtendimento;
begin
     {********************************************************************************}
  frm_senhaSupervisor.y_flag:=false;
  y_modo_venda:=0;
  lblModoVenda.font.color:=clBlack;
  lblModoVenda.caption := ExibeModoAtendimento(y_modo_venda);
     {********************************************************************************}
  LimparEdits;
  ExclueAtendimentoLocal;
  pnExibeItens.ClearAll;
  CalculaTotalAtendimento;
  pnSetaAcima.visible := false;
  pnSetaAbaixo.visible := false;
     {********************************************************************************}
  Novoitem1.click;
     {********************************************************************************}
  frm_principal.x_atendimento := -1; {- venda local - }
     {********************************************************************************}
  y_terminal_atendimento_suspenso  := -1;
  y_codigo_atendimento_suspenso    := -1;
  pnData.caption              := ' Data: '+form_data(frm_principal.x_data_trabalho);
  pnDia.caption               := ' Dia: '+UpperCase(FormatDateTime('dddd',frm_principal.x_data_trabalho));
  pnSit.caption               := ' Situa��o: ATDO. ABERTO';
  pnLoja.caption              := ' Loja: '+form_nz(frm_principal.x_loja,2)+'/'+form_t(ProcuraNomeLoja(frm_principal.x_loja,self),20);
  pnCaixa.caption             := ' N� Terminal: '+form_nz(frm_principal.x_terminal,2);
     {********************************************************************************}
  lblSeq.caption              := '�ltimo Atdo.: '+floattostr(frm_principal.x_codigo_atendimento);
end;

function Tfrm_LancaAtendimento.JaTeveDevolucao:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_ATDO_LOCAL        ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND          ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND          ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND) AND          ');
  clAux.AddParam ('      (IA_MODO=:IA_MODO)              ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat   := frm_principal.x_atendimento;
  clAux.consulta.parambyname('IA_MODO').AsInteger := 1;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaAtendimento.JaTeveVenda:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_ATDO_LOCAL        ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND          ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND          ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND) AND          ');
  clAux.AddParam ('      (IA_MODO=:IA_MODO)              ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat   := frm_principal.x_atendimento;
  clAux.consulta.parambyname('IA_MODO').AsInteger := 0;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaAtendimento.JaTeveTroca:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM ITENS_ATDO_LOCAL        ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND          ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND          ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND) AND          ');
  clAux.AddParam ('      (IA_MODO=:IA_MODO)              ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat   := frm_principal.x_atendimento;
  clAux.consulta.parambyname('IA_MODO').AsInteger := 2;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_LancaAtendimento.ProximoSequencialItem:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(IA_SEQ) as PROXIMO_SEQUENCIAL  ');
  clAux.AddParam ('FROM   ITENS_ATDO_LOCAL                   ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND              ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND              ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND)                  ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat  := frm_principal.x_atendimento;
  clAux.Execute;
  result:=clAux.result('PROXIMO_SEQUENCIAL')+1;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaAtendimento.CalculaTotalAtendimento;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IA_QTDE) as TOTAL_QTDE,    ');
  clAux.AddParam ('       SUM(IA_TOTA) as TOTAL_VENDA    ');
  clAux.AddParam ('FROM   ITENS_ATDO_LOCAL               ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND          ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND          ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND) AND          ');
  clAux.AddParam ('      (IA_MODO=0)                     '); {+ VENDA}
  clAux.consulta.parambyname('IA_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat  := frm_principal.x_atendimento;
  clAux.Execute;
  y_qtde_itens  := clAux.Result('TOTAL_QTDE');
  y_total_venda := clAux.Result('TOTAL_VENDA');
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IA_QTDE) as TOTAL_QTDE,    ');
  clAux.AddParam ('       SUM(IA_TOTA) as TOTAL_VENDA    ');
  clAux.AddParam ('FROM   ITENS_ATDO_LOCAL               ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND          ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND          ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND) AND          ');
  clAux.AddParam ('     ((IA_MODO=1) OR (IA_MODO=2))     '); {+ DEVOLUCAO/TROCA}
  clAux.consulta.parambyname('IA_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat  := frm_principal.x_atendimento;
  clAux.Execute;
  y_qtde_itens  := y_qtde_itens - clAux.Result('TOTAL_QTDE');
  y_total_venda := y_total_venda + clAux.Result('TOTAL_VENDA'); {'TOTAL_VENDA' ja vem negativo}
  {****************************************************************************}
  {clAux.ClearSql;
  clAux.AddParam ('SELECT DISTINCT IA_GRUP,IA_SUBG,IA_PROD,IA_CORE,IA_TAMA    ');
  clAux.AddParam ('FROM   ITENS_ATDO_LOCAL                                    ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND                               ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND                               ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND)                                   ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat  := frm_principal.x_atendimento;
  clAux.Execute;}
  clAux.ClearSql;
  clAux.AddParam ('SELECT *                     ');
  clAux.AddParam ('FROM   ITENS_ATDO_LOCAL      ');
  clAux.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND)     ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat  := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat  := frm_principal.x_atendimento;
  clAux.Execute;
  y_qtde_itens_distintos := clAux.RecCount;
  {****************************************************************************}
  //if (RetornaApelidoEmpresa = 'PONTO DO AR') or (RetornaApelidoEmpresa = 'ESTACAO DO AR') then
  pnQtdeTotal.caption  := form_n  (y_qtde_itens_distintos,5);
  //else
    //pnQtdeTotal.caption  := form_n  (y_qtde_itens,5);
  pnTotalVenda.caption := form_nc (y_total_venda,10);
  {****************************************************************************}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaAtendimento.pnBotaoMinimizarClick(Sender: TObject);
begin
  frm_principal.WindowState := wsMinimized;
end;

procedure Tfrm_LancaAtendimento.Image3DblClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSobre, frmSobre);
  frmSobre.showmodal;
  frmSobre.Free;
end;

//Realiza criticas de CONSISTENCIA de dados antes de iniciar uma venda
//Esta rotina nao pode ser muito 'pesada'
function Tfrm_LancaAtendimento.PodeRealizarAtendimento:Boolean;
var
  ultimo_atendimento_lancado_no_estoque: Real;
begin
  result := true;
     //Verifica se o codigo da loja � diferente de ZERO
  if (frm_principal.x_loja=0) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: C�digo da loja n�o configurado! ');
    frm_ALERTA.Memo1.lines.Add('A n�o configura��o deste c�digo causar� erros de inconsist�ncia nos ATENDIMENTOS.');
    frm_ALERTA.Memo1.lines.Add(' - Entre em contato com o GERENTE da LOJA para configurar este terminal -');
    frm_ALERTA.showmodal;

    Application.CreateForm(Tfrm_MudarLoja,frm_MudarLoja);
    frm_MudarLoja.y_loja := frm_principal.x_loja;
    frm_MudarLoja.showmodal;
    if (frm_MudarLoja.y_loja<>frm_principal.x_loja) then
    begin
      frm_principal.x_loja := frm_MudarLoja.y_loja;
      frm_principal.pnLoja.caption := ' Loja: '+form_nz(frm_principal.x_loja,2)+'/'+
        form_t(ProcuraNomeLoja(frm_principal.x_loja,self),9);
      if (frm_principal.x_loja=0) then
        frm_principal.pnLoja.color:=clRed
      else
        frm_principal.pnLoja.color:=clTeal;
    end;
    frm_MudarLoja.Free;

    result := false;
  end;

     //Verifica se o codigo do terminal de caixa � diferente de ZERO
  if (frm_principal.x_terminal=0) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: C�digo do terminal de atdo. n�o configurado! ');
    frm_ALERTA.Memo1.lines.Add('A n�o configura��o deste c�digo causar� erros de inconsist�ncia nos ATENDIMENTOS.');
    frm_ALERTA.Memo1.lines.Add(' - Entre em contato com o GERENTE da LOJA para configurar este terminal -');
    frm_ALERTA.showmodal;

    Application.CreateForm(Tfrm_MudarTerminal,frm_MudarTerminal);
    frm_MudarTerminal.y_terminal := frm_principal.x_terminal;
    frm_MudarTerminal.showmodal;
    if (frm_MudarTerminal.y_terminal<>frm_principal.x_terminal) then
    begin
      frm_principal.x_terminal := frm_MudarTerminal.y_terminal;
      frm_principal.pnCaixa.caption := ' N� Terminal: '+form_nz(frm_principal.x_terminal,2);
      if (frm_principal.x_terminal=0) then
        frm_principal.pnCaixa.color:=clRed
      else
        frm_principal.pnCaixa.color:=clTeal;
    end;
    frm_MudarTerminal.Free;

    result := false;
  end;

     {...}
  lblSeq.color  := clTeal;
  ultimo_atendimento_lancado_no_estoque := UltimoAtendimentoRegistradaNoEstoque;
  if (frm_principal.x_codigo_atendimento<ultimo_atendimento_lancado_no_estoque) and
    (frm_principal.x_ativar_alerta_sequencial_atdo) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: O c�digo do �ltimo atdo. n�o pode ser menor que ');
    frm_ALERTA.Memo1.lines.Add('      que o �ltimo atdo. lan�ado! ');
    frm_ALERTA.showmodal;

    Application.CreateForm(Tfrm_MudarSeqAtdo,frm_MudarSeqAtdo);
    frm_MudarSeqAtdo.showmodal;
    if (frm_MudarSeqAtdo.escolheuSequencialCorreto) then
      frm_principal.lblSeq.color := clTeal
    else
      frm_principal.lblSeq.color := clRed;
    frm_principal.lblSeq.caption := '�ltimo Atdo.: '+floattostr(frm_principal.x_codigo_atendimento);
    frm_MudarSeqAtdo.Free;

    result:=false;
  end;
end;

procedure Tfrm_LancaAtendimento.Mudarformadeleituradocdigodebarras1Click(Sender: TObject);
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
  end;
     {********************************************************************************}
end;

procedure Tfrm_LancaAtendimento.edtFornEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancaAtendimento.edtFornKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancaAtendimento.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,false);
end;

procedure Tfrm_LancaAtendimento.edtFornExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=trim(edtForn.text);
  if (codigo<>'') then
    edtForn.text:=form_nz(strtofloat(codigo),6);
end;

procedure Tfrm_LancaAtendimento.Trocarvendedor1Click(Sender: TObject);
begin
     {***************************************************************************************}
  if (JaTeveTroca) or (JaTeveVenda) or (JaTeveDevolucao) then
    frmDialogo.ExibirMensagem ('O vendedor n�o pode ser trocado enquanto houver atendimento em andamento!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  begin
    Application.CreateForm(Tfrm_LancaAtdo_InformeVendedor, frm_LancaAtdo_InformeVendedor);
    frm_LancaAtdo_InformeVendedor.showmodal;
    if (frm_LancaAtdo_InformeVendedor.resultado=13) then
    begin
      if (frm_principal.x_vendedor=0) then
        pnVend.caption := ' Vend: INDEFINIDO'
      else
        pnVend.caption := ' Vend: '+form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),15);
    end
    else
    if (frm_LancaAtdo_InformeVendedor.resultado=27) then
    begin
      frm_principal.x_vendedor := 0; //VENDEDOR NAO DEFINIDO
      pnVend.caption           := ' Vend: INDEFINIDO';
      IniciarNovoAtendimento;
    end;
    frm_LancaAtdo_InformeVendedor.Free;
  end;
     {***************************************************************************************}
end;

procedure Tfrm_LancaAtendimento.AlterarpreodeVenda1Click(Sender: TObject);
begin
  if (trim(edtPreco.text)<>'') then
  begin
    if frm_principal.x_AltPrecoAtend and(not frm_senhaSupervisor.y_flag) then
      frm_senhaSupervisor.showmodal;              
    if not frm_principal.x_AltPrecoAtend or (frm_senhaSupervisor.y_flag) then
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
  end;
end;

function Tfrm_LancaAtendimento.UltimoAtendimentoRegistradaNoEstoque:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(AT_CODI) as MAXIMO_SEQUENCIAL  ');
  clAux.AddParam ('FROM ATENDIMENTOS                         ');
  clAux.AddParam ('WHERE (AT_LOJA=:loja) AND                 ');
  clAux.AddParam ('      (AT_CAIX=:caixa)                    ');
  clAux.consulta.parambyname('loja').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat := frm_principal.x_terminal;
  clAux.Execute;
  result := clAux.Result('MAXIMO_SEQUENCIAL');
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaAtendimento.edtCBarraDblClick(Sender: TObject);
begin
  btnLocalizar.click;
end;

procedure Tfrm_LancaAtendimento.pnVendDblClick(Sender: TObject);
begin
  Trocarvendedor1.click;
end;

procedure Tfrm_LancaAtendimento.ConsultarCdigodeBarras1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaCodigoDeBarras, frm_ConsultaCodigoDeBarras);
  frm_ConsultaCodigoDeBarras.showmodal;
  frm_ConsultaCodigoDeBarras.Free;
end;

procedure Tfrm_LancaAtendimento.FormCreate(Sender: TObject);
begin
  try
    imagemEmpresa.picture.loadfromfile(frm_principal.x_imagem_logomarca);
  except
  end;

     {* Configurando a INTERFACE INICIAL}
  frm_LancaAtendimento.windowstate := wsMaximized;
  frm_LancaAtendimento.left        :=0;
  frm_LancaAtendimento.top         :=0;
  frm_LancaAtendimento.width       := 810;
  frm_LancaAtendimento.height      := 610;

  y_terminal_atendimento_suspenso  := -1;
  y_codigo_atendimento_suspenso    := -1;

  pnExibeItens.ClearAll;
end;

procedure Tfrm_LancaAtendimento.FormActivate(Sender: TObject);
begin
     {****************************************************************************}
  if (not exibiu) then
  begin
    if (gbItem_ProdCorTam.visible) then
      FocaCodigoLocal1
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus;
         {********************************************************************************}
    y_modo_venda := 0; //inicia com uma VENDA NORMAL(0)
    lblModoVenda.caption := ExibeModoAtendimento(y_modo_venda);
    pnCor.Caption := '';
         {********************************************************************************}
    LimparEdits;
    ExclueAtendimentoLocal;
         {********************************************************************************}
    Novoitem1.click;
         {********************************************************************************}
    pnSit.caption      := ' Situa��o: ATDO. ABERTO';
    pnLoja.caption     := ' Loja: '+form_nz(frm_principal.x_loja,2)+'/'+form_t(ProcuraNomeLoja(frm_principal.x_loja,self),15);
    if (frm_principal.x_loja=0) then
      pnLoja.color:=clRed
    else
      pnLoja.color:=clTeal;
    pnCaixa.caption    := ' N� Terminal: '+form_nz(frm_principal.x_terminal,2);
    if (frm_principal.x_terminal=0) then
      pnCaixa.color:=clRed
    else
      pnCaixa.color:=clTeal;
         {********************************************************************************}
    PodeRealizarAtendimento; //realiza criticas quanto aos dados principais : LOJA/CAIXA...etc...
         {*****************************}
    CalculaTotalAtendimento;
         {********************************************************************************}
    pnData.caption     := ' Data: '+form_data(frm_principal.x_data_trabalho);
    pnDia.caption      := ' Dia: '+UpperCase(FormatDateTime('dddd',frm_principal.x_data_trabalho));
         {********************************************************************************}
    if (frm_principal.x_vendedor=-1) then
      pnVend.caption := ' Vend: ADMIN'
    else
      pnVend.caption := ' Vend: '+form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),15);
         {********************************************************************************}
    frm_principal.x_forma_de_leitura_codigo_barras := frm_principal.x_forma_leitura_cbarra_venda;
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
      lbleituracbarra.caption := '>leitura manual da qtde.'
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
      lbleituracbarra.caption := '>leitura direta';
         {****************************************************************************}
    lblSeq.color := clTeal;
         {********************************************************************************}
    frmDialogo.posativ:=1;
         {****************************************************************************}

         {* Posicionando a forma de localizacao do produto *}
    n_cor            := -1;
    n_tam            := '-1';
    gbItem_ProdCorTam.visible := false;
    gbItem_CBarra.visible     := false;
    if (frm_principal.x_ordem_prod_cor_tam=1) then
    begin
      n_ordem_ctrf7 := 1;
      gbItem_ProdCorTam.visible := true;
      gbItem_CBarra.visible := false;
    end
    else
    if (frm_principal.x_ordem_cbarra=1) then
    begin
      n_ordem_ctrf7 := 1;
      gbItem_ProdCorTam.visible := false;
      gbItem_CBarra.visible := true;
    end;
    pnLocal1.visible := false;
    pnLocal1.left    := 7;
    pnLocal2.visible := false;
    pnLocal2.left    := 7;
    pnLocal3.visible := false;
    pnLocal3.left    := 7;
    n_ordem_f7 :=1;
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

         {****************************************************************************}
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
    CalculaTotalAtendimento; {*}

         //....
    exibiu:=true;
  end;
  if (gbItem_ProdCorTam.visible) then
    FocaCodigoLocal1
  else
  if (gbItem_CBarra.visible) then
  begin
    edtCBarra.setfocus;
    pnCor.Caption := '';
  end; 
end;

procedure Tfrm_LancaAtendimento.SuspenderAtendimento1Click(Sender: TObject);
var
  clAtdo,clAtdoLocal,clItensLocal,clItens,clConf: TClassAuxiliar;
  indGauge,totGauge: Integer;
begin
     {***************************************************************************************}
  if (y_qtde_itens_distintos=0) then
  begin
    frmDialogo.ExibirMensagem ('N�o foram informados itens para     o atendimento!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Suspens�o imposs�vel!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  end
  else
  if (frmDialogo.ExibirMensagem ('Confirma suspens�o do Atendimento?'
    ,'Atendimentos',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
              //****************************************************
    clAtdoLocal := TClassAuxiliar.Create;
    clAtdoLocal.conect   ('VENDAS',self);
    clAtdoLocal.ClearSql;
    clAtdoLocal.AddParam ('SELECT * FROM ATDO_LOCAL         ');
    clAtdoLocal.AddParam ('WHERE (AT_LOJA=:loja) AND        ');
    clAtdoLocal.AddParam ('      (AT_CAIX=:terminal) AND    ');
    clAtdoLocal.AddParam ('      (AT_CODI=:atendimento)     ');
    clAtdoLocal.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    clAtdoLocal.consulta.parambyname('terminal').AsFloat    := frm_principal.x_terminal;
    clAtdoLocal.consulta.parambyname('atendimento').AsFloat := frm_principal.x_atendimento;
    if (clAtdoLocal.Execute) then
    begin
                  {*************************************************************}
      frm_principal.x_codigo_atendimento_suspenso := frm_principal.x_codigo_atendimento_suspenso + 1;
                  {*************************************************************}
      mostra_mensagem ('Suspendendo Atendimento...');
      frm_mensagem.painel.visible:=true;
      frm_mensagem.gauge1.progress:=0;

                  //gravando o atendimento
                  //****************************************************
      clAtdo := TClassAuxiliar.Create;
      clAtdo.conect   ('VENDAS',self);
      clAtdo.ClearSql;
      clAtdo.AddParam ('INSERT INTO ATENDIMENTOS_SUSP(AT_CAIX,AT_LOJA,AT_CODI,AT_FUNC,AT_DATA,AT_OPER,AT_TOTA,AT_QTDE,AT_QTD1,AT_QTD2,AT_VEND,AT_NOME,AT_ONLI,AT_ENVI,AT_STAT,AT_DESC) ');
      clAtdo.AddParam ('VALUES (:AT_CAIX,:AT_LOJA,:AT_CODI,:AT_FUNC,:AT_DATA,:AT_OPER,:AT_TOTA,:AT_QTDE,:AT_QTD1,:AT_QTD2,:AT_VEND,:AT_NOME,:AT_ONLI,:AT_ENVI,:AT_STAT,:AT_DESC)       ');
      clAtdo.consulta.parambyname('AT_LOJA').AsFloat    := frm_principal.x_loja;
      clAtdo.consulta.parambyname('AT_CAIX').AsFloat    := frm_principal.x_terminal;
      clAtdo.consulta.parambyname('AT_CODI').AsFloat    := frm_principal.x_codigo_atendimento_suspenso;
      clAtdo.consulta.parambyname('AT_FUNC').AsFloat    := clAtdoLocal.result('AT_FUNC');
      clAtdo.consulta.parambyname('AT_OPER').AsFloat    := clAtdoLocal.result('AT_OPER');
      clAtdo.consulta.parambyname('AT_DATA').AsDateTime := clAtdoLocal.result('AT_DATA');
      clAtdo.consulta.parambyname('AT_OPER').AsFloat    := clAtdoLocal.result('AT_TOTA');
      clAtdo.consulta.parambyname('AT_TOTA').AsFloat    := clAtdoLocal.result('AT_TOTA');
      clAtdo.consulta.parambyname('AT_DESC').AsFloat    := 0.00;
      clAtdo.consulta.parambyname('AT_QTDE').AsFloat    := clAtdoLocal.result('AT_QTDE');
      clAtdo.consulta.parambyname('AT_QTD1').AsFloat    := clAtdoLocal.result('AT_QTD1');
      clAtdo.consulta.parambyname('AT_QTD2').AsFloat    := clAtdoLocal.result('AT_QTD2');
      clAtdo.consulta.parambyname('AT_STAT').AsString   := '3'; //SUSPENSO
      clAtdo.consulta.parambyname('AT_VEND').AsFloat    := clAtdoLocal.result('AT_VEND');
      clAtdo.consulta.parambyname('AT_NOME').AsString   := '';
      if (frm_principal.x_online) then
      begin
        clAtdo.consulta.parambyname('AT_ONLI').AsString := '1';
        clAtdo.consulta.parambyname('AT_ENVI').AsString := '1';
      end
      else
      begin
        clAtdo.consulta.parambyname('AT_ONLI').AsString := '0';
        clAtdo.consulta.parambyname('AT_ENVI').AsString := '0';
      end;
      clAtdo.Execute;
      clAtdo.desconect;
      clAtdo.Free;

      clAtdoLocal.desconect;
      clAtdoLocal.Free;
                  //****************************************************

                  //****************************************************
      clItensLocal := TClassAuxiliar.Create;
      clItensLocal.conect   ('VENDAS',self);
      clItensLocal.ClearSql;
      clItensLocal.AddParam ('SELECT * FROM ITENS_ATDO_LOCAL    ');
      clItensLocal.AddParam ('WHERE (IA_LOJA=:loja) AND         ');
      clItensLocal.AddParam ('      (IA_CAIX=:terminal) AND     ');
      clItensLocal.AddParam ('      (IA_VEND=:atendimento)      ');
      clItensLocal.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
      clItensLocal.consulta.parambyname('terminal').AsFloat    := frm_principal.x_terminal;
      clItensLocal.consulta.parambyname('atendimento').AsFloat := frm_principal.x_atendimento;
      clItensLocal.Execute; {*}
      clItensLocal.first;
      indGauge:=0;
      totGauge:=clItensLocal.reccount;
      while (not clItensLocal.eof) do
      begin
                       //****************************************************
        clItens := TClassAuxiliar.Create;
        clItens.conect   ('VENDAS',self);
        clItens.ClearSql;
        clItens.AddParam ('INSERT INTO ITENS_ATENDIMENTOS_SUSP(IA_LOJA,IA_CAIX,IA_VEND,IA_GRUP,IA_SUBG,IA_PROD,IA_TAMA,IA_CORE,IA_QTDE,IA_TOTA,IA_PVEN,IA_OTAM,IA_MODO,IA_SEQ)   ');
        clItens.AddParam ('VALUES (:IA_LOJA,:IA_CAIX,:IA_VEND,:IA_GRUP,:IA_SUBG,:IA_PROD,:IA_TAMA,:IA_CORE,:IA_QTDE,:IA_TOTA,:IA_PVEN,:IA_OTAM,:IA_MODO,:IA_SEQ)                 ');
        clItens.consulta.parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
        clItens.consulta.parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
        clItens.consulta.parambyname('IA_VEND').AsFloat   := frm_principal.x_codigo_atendimento_suspenso;
        clItens.consulta.parambyname('IA_GRUP').AsFloat   := clItensLocal.Result('IA_GRUP');
        clItens.consulta.parambyname('IA_SUBG').AsFloat   := clItensLocal.Result('IA_SUBG');
        clItens.consulta.parambyname('IA_PROD').AsFloat   := clItensLocal.Result('IA_PROD');
        clItens.consulta.parambyname('IA_TAMA').AsString  := clItensLocal.Result('IA_TAMA');
        clItens.consulta.parambyname('IA_CORE').AsFloat   := clItensLocal.Result('IA_CORE');
        clItens.consulta.parambyname('IA_QTDE').AsFloat   := clItensLocal.Result('IA_QTDE');
        clItens.consulta.parambyname('IA_TOTA').AsFloat   := clItensLocal.Result('IA_TOTA');
        clItens.consulta.parambyname('IA_PVEN').AsFloat   := clItensLocal.Result('IA_PVEN');
        clItens.consulta.parambyname('IA_OTAM').AsInteger := clItensLocal.Result('IA_OTAM');
        clItens.consulta.parambyname('IA_MODO').AsString  := clItensLocal.Result('IA_MODO');
        clItens.consulta.parambyname('IA_SEQ').AsInteger  := clItensLocal.Result('IA_SEQ');
        clItens.Execute; {*}
        clItens.desconect;
        clItens.Free;

                       {----->}
        clItensLocal.next;
        indGauge:=indGauge+1;
        frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
        frm_mensagem.gauge1.refresh;
      end;
      clItensLocal.desconect;
      clItensLocal.Free;
              
                  //****************************************************
      esconde_mensagem;

                  //****************************************************
      ExclueAtendimentoLocal; {*}

                  //...
      Application.CreateForm(Tfrm_ExibeNumeroAtendimento, frm_ExibeNumeroAtendimento);
      frm_ExibeNumeroAtendimento.lblNumTerminal.caption    := form_nz(frm_principal.x_terminal,2);
      frm_ExibeNumeroAtendimento.lblNumAtendimento.caption := form_nz(frm_principal.x_codigo_atendimento_suspenso,8);
      frm_ExibeNumeroAtendimento.showmodal;
      frm_ExibeNumeroAtendimento.Free;

                  //****************************************************
      clConf := TClassAuxiliar.Create;
      clConf.conect   ('C:\NATIVA',self);
      clConf.ClearSql;
      clConf.AddParam ('UPDATE SEQATDO.DBF SET ULTIMO_ATDO_SUSP=:ultimo_atdo_susp ');
      clConf.consulta.parambyname('ultimo_atdo_susp').AsFloat := frm_principal.x_codigo_atendimento_suspenso;
      clConf.Execute;
      clConf.desconect;
      clConf.Free;

                  //...
      frm_principal.x_vendedor := 0; //VENDEDOR NAO DEFINIDO
      pnVend.caption           := ' Vend: INDEFINIDO';
      IniciarNovoAtendimento;
      Trocarvendedor1.click;
    end;
  end;
     {***************************************************************************************}
end;

procedure Tfrm_LancaAtendimento.ReabrirAtendimentoSuspenso1Click(Sender: TObject);
var
  clAtdo,clAtdoLocal,clItensLocal,clItens: TClassAuxiliar;
begin
     {***************************************************************************************}
  if (y_qtde_itens_distintos<>0) then
  begin
    frmDialogo.ExibirMensagem ('J� existem itens informados neste       Atendimento!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Imposs�vel reabrir outro Atendimento!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end
  else
  begin
    y_terminal_atendimento_suspenso  := -1;
    y_codigo_atendimento_suspenso    := -1;

    Application.CreateForm(Tfrm_ReabrirAtendimentoSuspenso, frm_ReabrirAtendimentoSuspenso);
    frm_ReabrirAtendimentoSuspenso.y_loja     := frm_principal.x_loja;
    frm_ReabrirAtendimentoSuspenso.y_data     := frm_principal.x_data_trabalho;
    frm_ReabrirAtendimentoSuspenso.y_vendedor := frm_principal.x_vendedor;
    frm_ReabrirAtendimentoSuspenso.showmodal;
    if (frm_ReabrirAtendimentoSuspenso.tecla=13) then
      if (frm_ReabrirAtendimentoSuspenso.qAtendimentos.recordcount<>0) then
      begin
                  {...}
        y_terminal_atendimento_suspenso  := frm_ReabrirAtendimentoSuspenso.qAtendimentos.fieldbyname('AT_CAIX').AsFloat;
        y_codigo_atendimento_suspenso    := frm_ReabrirAtendimentoSuspenso.qAtendimentos.fieldbyname('AT_CODI').AsFloat;

        ExclueAtendimentoLocal; {*}

                  //****************************************************
        clAtdo := TClassAuxiliar.Create;
        clAtdo.conect   ('VENDAS',self);
        clAtdo.ClearSql;
        clAtdo.AddParam ('SELECT * FROM ATENDIMENTOS_SUSP   ');
        clAtdo.AddParam ('WHERE (AT_LOJA=:loja) AND         ');
        clAtdo.AddParam ('      (AT_CAIX=:terminal) AND     ');
        clAtdo.AddParam ('      (AT_CODI=:atendimento)      ');
        clAtdo.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
        clAtdo.consulta.parambyname('terminal').AsFloat    := y_terminal_atendimento_suspenso;
        clAtdo.consulta.parambyname('atendimento').AsFloat := y_codigo_atendimento_suspenso;
        if (clAtdo.Execute) then
        begin
                      //gravando o atendimento
                      //****************************************************
          clAtdoLocal := TClassAuxiliar.Create;
          clAtdoLocal.conect   ('VENDAS',self);
          clAtdoLocal.ClearSql;
          clAtdoLocal.AddParam ('INSERT INTO ATDO_LOCAL(AT_CAIX,AT_LOJA,AT_CODI,AT_FUNC,AT_DATA,AT_OPER,AT_TOTA,AT_QTDE,AT_QTD1,AT_QTD2,AT_VEND,AT_NOME,AT_ONLI,AT_ENVI,AT_STAT,AT_DESC)   ');
          clAtdoLocal.AddParam ('VALUES (:AT_CAIX,:AT_LOJA,:AT_CODI,:AT_FUNC,:AT_DATA,:AT_OPER,:AT_TOTA,:AT_QTDE,:AT_QTD1,:AT_QTD2,:AT_VEND,:AT_NOME,:AT_ONLI,:AT_ENVI,:AT_STAT,:AT_DESC)  ');
          clAtdoLocal.consulta.parambyname('AT_LOJA').AsFloat    := frm_principal.x_loja;
          clAtdoLocal.consulta.parambyname('AT_CAIX').AsFloat    := frm_principal.x_terminal;
          clAtdoLocal.consulta.parambyname('AT_CODI').AsFloat    := frm_principal.x_atendimento;
          clAtdoLocal.consulta.parambyname('AT_FUNC').AsFloat    := clAtdo.result('AT_FUNC');
          clAtdoLocal.consulta.parambyname('AT_OPER').AsFloat    := clAtdo.result('AT_OPER');
          clAtdoLocal.consulta.parambyname('AT_DATA').AsDateTime := clAtdo.result('AT_DATA');
          clAtdoLocal.consulta.parambyname('AT_OPER').AsFloat    := clAtdo.result('AT_TOTA');
          clAtdoLocal.consulta.parambyname('AT_TOTA').AsFloat    := clAtdo.result('AT_TOTA');
          clAtdoLocal.consulta.parambyname('AT_DESC').AsFloat    := 0.00;
          clAtdoLocal.consulta.parambyname('AT_QTDE').AsFloat    := clAtdo.result('AT_QTDE');
          clAtdoLocal.consulta.parambyname('AT_QTD1').AsFloat    := clAtdo.result('AT_QTD1');
          clAtdoLocal.consulta.parambyname('AT_QTD2').AsFloat    := clAtdo.result('AT_QTD2');
          clAtdoLocal.consulta.parambyname('AT_STAT').AsString   := '3'; //SUSPENSO
          clAtdoLocal.consulta.parambyname('AT_VEND').AsFloat    := clAtdo.result('AT_VEND');
          clAtdoLocal.consulta.parambyname('AT_NOME').AsString   := '';
          if (frm_principal.x_online) then
          begin
            clAtdoLocal.consulta.parambyname('AT_ONLI').AsString := '1';
            clAtdoLocal.consulta.parambyname('AT_ENVI').AsString := '1';
          end
          else
          begin
            clAtdoLocal.consulta.parambyname('AT_ONLI').AsString := '0';
            clAtdoLocal.consulta.parambyname('AT_ENVI').AsString := '0';
          end;
          clAtdoLocal.Execute;
          clAtdoLocal.desconect;
          clAtdoLocal.Free;

                      //****************************************************
          clItens := TClassAuxiliar.Create;
          clItens.conect   ('VENDAS',self);
          clItens.ClearSql;
          clItens.AddParam ('SELECT * FROM ITENS_ATENDIMENTOS_SUSP  ');
          clItens.AddParam ('WHERE (IA_LOJA=:loja) AND              ');
          clItens.AddParam ('      (IA_CAIX=:terminal) AND          ');
          clItens.AddParam ('      (IA_VEND=:atendimento)           ');
          clItens.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
          clItens.consulta.parambyname('terminal').AsFloat    := y_terminal_atendimento_suspenso;
          clItens.consulta.parambyname('atendimento').AsFloat := y_codigo_atendimento_suspenso;
          clItens.Execute; {*}
          clItens.first;
          while (not clItens.eof) do
          begin
                           //****************************************************
            clItensLocal := TClassAuxiliar.Create;
            clItensLocal.conect   ('VENDAS',self);
            clItensLocal.ClearSql;
            clItensLocal.AddParam ('INSERT INTO ITENS_ATDO_LOCAL(IA_LOJA,IA_CAIX,IA_VEND,IA_GRUP,IA_SUBG,IA_PROD,IA_TAMA,IA_CORE,IA_QTDE,IA_TOTA,IA_PVEN,IA_OTAM,IA_MODO,IA_SEQ) ');
            clItensLocal.AddParam ('VALUES (:IA_LOJA,:IA_CAIX,:IA_VEND,:IA_GRUP,:IA_SUBG,:IA_PROD,:IA_TAMA,:IA_CORE,:IA_QTDE,:IA_TOTA,:IA_PVEN,:IA_OTAM,:IA_MODO,:IA_SEQ)        ');
            clItensLocal.consulta.parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
            clItensLocal.consulta.parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
            clItensLocal.consulta.parambyname('IA_VEND').AsFloat   := frm_principal.x_atendimento;
            clItensLocal.consulta.parambyname('IA_GRUP').AsFloat   := clItens.Result('IA_GRUP');
            clItensLocal.consulta.parambyname('IA_SUBG').AsFloat   := clItens.Result('IA_SUBG');
            clItensLocal.consulta.parambyname('IA_PROD').AsFloat   := clItens.Result('IA_PROD');
            clItensLocal.consulta.parambyname('IA_TAMA').AsString  := clItens.Result('IA_TAMA');
            clItensLocal.consulta.parambyname('IA_CORE').AsFloat   := clItens.Result('IA_CORE');
            clItensLocal.consulta.parambyname('IA_QTDE').AsFloat   := clItens.Result('IA_QTDE');
            clItensLocal.consulta.parambyname('IA_TOTA').AsFloat   := clItens.Result('IA_TOTA');
            clItensLocal.consulta.parambyname('IA_PVEN').AsFloat   := clItens.Result('IA_PVEN');
            clItensLocal.consulta.parambyname('IA_OTAM').AsInteger := clItens.Result('IA_OTAM');
            clItensLocal.consulta.parambyname('IA_MODO').AsString  := clItens.Result('IA_MODO');
            clItensLocal.consulta.parambyname('IA_SEQ').AsInteger  := clItens.Result('IA_SEQ');
            clItensLocal.Execute; {*}
            clItensLocal.desconect;
            clItensLocal.Free;

                           {----->}
            clItens.next;
          end;
          clItens.desconect;
          clItens.Free;

                      {*******************************************************************}
          y_item_inicial := 1;
          ExibeItens(y_item_inicial); {...}
          Novoitem1.click;
        end;
        clAtdo.desconect;
        clAtdo.Free;
      end//SO SE TIVER ITEM
    ;
    frm_ReabrirAtendimentoSuspenso.Free;
  end;
end;

function Tfrm_LancaAtendimento.BuscaUnidadeProduto(grupo, subgrupo, produto: Real): String;
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
