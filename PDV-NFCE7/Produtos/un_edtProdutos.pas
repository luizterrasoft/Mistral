unit un_edtProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, StdCtrls, ExtCtrls, Mask, Grids, DBGrids, Db, DBTables,
  produtos;

type
  Tfrm_edtProdutos = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Incluirplano1: TMenuItem;
    Cancelarincluso1: TMenuItem;
    Excluirplano1: TMenuItem;
    Salvar1: TMenuItem;
    Limparcadastro1: TMenuItem;
    N1: TMenuItem;
    Imprimirplanos1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
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
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Panel4: TPanel;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnCancelainclusao: TSpeedButton;
    botao_sair: TPanel;
    scroll: TScrollBox;
    Label2: TLabel;
    edtGrupo: TMaskEdit;
    pnGrupo: TPanel;
    Label1: TLabel;
    edtSubGrupo: TMaskEdit;
    Label3: TLabel;
    edtCodigo: TMaskEdit;
    Label14: TLabel;
    edtForn: TMaskEdit;
    pnForn: TPanel;
    Label15: TLabel;
    edtRefInt: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtUnidade: TMaskEdit;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edtMat2: TMaskEdit;
    edtMat3: TMaskEdit;
    Label28: TLabel;
    edtMin: TMaskEdit;
    edtMax: TMaskEdit;
    Label29: TLabel;
    foto: TPanel;
    Label30: TLabel;
    edtEstoque: TMaskEdit;
    ds: TDataSource;
    qFaixas: TQuery;
    Bevel2: TBevel;
    edtMat1: TMaskEdit;
    edtDesc: TMaskEdit;
    edtLinha: TMaskEdit;
    edtColecao: TMaskEdit;
    gbTamanho: TPanel;
    Label31: TLabel;
    btnIncluirFaixa: TSpeedButton;
    btnExcluirFaixa: TSpeedButton;
    Label32: TLabel;
    grade: TDBGrid;
    edtFaixa: TMaskEdit;
    edtTamanho: TMaskEdit;
    pnTamanho: TPanel;
    grupo1: TGroupBox;
    chCorUnica: TCheckBox;
    chTamUnico: TCheckBox;
    qFaixasPF_GRUP: TFloatField;
    qFaixasPF_SUBG: TFloatField;
    qFaixasPF_PROD: TFloatField;
    qFaixasPF_TAMA: TStringField;
    Label33: TLabel;
    cbParte1: TComboBox;
    cbParte2: TComboBox;
    btnVerEstoque: TSpeedButton;
    Verestoquedoproduto1: TMenuItem;
    btnVerItensProdutos: TSpeedButton;
    N3: TMenuItem;
    Itensdoproduto1: TMenuItem;
    Label17: TLabel;
    Label18: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLinhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtColecaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMat1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMat2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMat3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMinExit(Sender: TObject);
    procedure edtMaxExit(Sender: TObject);
    procedure edtMinKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescEnter(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtRefFabEnter(Sender: TObject);
    procedure edtUnidadeEnter(Sender: TObject);
    procedure edtLinhaEnter(Sender: TObject);
    procedure edtColecaoEnter(Sender: TObject);
    procedure edtMat1Enter(Sender: TObject);
    procedure edtMat2Enter(Sender: TObject);
    procedure edtMat3Enter(Sender: TObject);
    procedure edtMinEnter(Sender: TObject);
    procedure edtMaxEnter(Sender: TObject);
    procedure edtEstoqueEnter(Sender: TObject);
    procedure edtMinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure edtFornExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Salvar1Click(Sender: TObject);
    procedure btnIncluirFaixaClick(Sender: TObject);
    procedure btnExcluirFaixaClick(Sender: TObject);
    procedure edtFornEnter(Sender: TObject);
    procedure edtTamanhoEnter(Sender: TObject);
    procedure edtTamanhoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtFornDblClick(Sender: TObject);
    procedure edtTamanhoExit(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaEnter(Sender: TObject);
    procedure edtFaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbParte1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbParte2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnVerEstoqueClick(Sender: TObject);
    procedure Verestoquedoproduto1Click(Sender: TObject);
    procedure Itensdoproduto1Click(Sender: TObject);
    procedure btnVerItensProdutosClick(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure Incluirplano1Click(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtTamanhoDblClick(Sender: TObject);
    procedure Excluirplano1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer;
    antDesc: String;
    nome_grupo,nome_subgrupo,nome_forn: String; {p/ formacao do nome do produto}
    parte1,parte2,parte3,parte4: Integer; {p/ formacao do nome do produto}
    procedure RefrescaTabela;
    procedure LimparEdits;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
    procedure PreencheEditsProduto(clProd: TClassProdutos);
    procedure FocusControlePagina1(controle: TWinControl; direcao: Boolean);
    procedure FocusControlePagina2(controle: TWinControl; direcao: Boolean);
  end;

var
  frm_edtProdutos: Tfrm_edtProdutos;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, grupos_produtos, subgrupos_produtos,
  unDialogo, produtos_faixas, auxiliar, un_edtEstoque, un_edtEstoqueLoja,
  unMensagem, mem_prnt, f8Produtos, f8Produtos2, un_LancarItem;

procedure Tfrm_edtProdutos.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtProdutos.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtProdutos.LimparEdits;
begin
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtCodigo.text:='';
  pnGrupo.caption:='';
  edtForn.text:='';
  pnForn.caption:='';
  edtDesc.text:='';
  edtRefInt.text:='';
  edtUnidade.text:='';
  edtLinha.text:='';
  edtColecao.text:='';
  edtMat1.text:='';
  edtMat2.text:='';
  edtMat3.text:='';
  edtMin.text:='';
  edtMax.text:='';
  pnTamanho.caption:='';
  chCorUnica.checked:=false;
  chTamUnico.checked:=false;
  edtTamanho.text:='';
  edtEstoque.text:='';
  qFaixas.close;
  nome_grupo:='';
  nome_subgrupo:='';
  nome_forn:='';
  parte1:=-1;
  parte2:=-1;
  parte3:=-1;
  parte4:=-1;
  cbParte1.text:='';
  cbParte2.text:='';
end;

procedure Tfrm_edtProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_PGUP) then
    with (scroll.VertScrollBar) do
      Position := Position - 100;
  if (key=K_PGDOWN) then
    with (scroll.VertScrollBar) do
      Position := Position + 100;
  if (key=K_ESC) then
    if (frmDialogo.ExibirMensagem ('Confirma saída?'
      ,'Cadastro de produtos',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      close;
end;

procedure Tfrm_edtProdutos.edtGrupoEnter(Sender: TObject);
begin
  edtGrupo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtProdutos.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_edtProdutos.edtSubGrupoEnter(Sender: TObject);
begin
  edtSubGrupo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtProdutos.edtSubGrupoKeyDown(Sender: TObject;
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
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
end;

procedure Tfrm_edtProdutos.edtCodigoEnter(Sender: TObject);
var
  clAux: TClassAuxiliar;
  grupo,subg: String;
begin
     {... - Se for inclusao, sugere o prox. codigo de produto}
  if (Trim(edtSubGrupo.text)<>'') and (Trim(edtGrupo.text)<>'') and
    (Trim(edtCodigo.text)='') then
    if (not Incluirplano1.enabled) then
    begin
      grupo:=Trim(edtGrupo.text);
      subg:=Trim(edtSubGrupo.text);
      clAux:=TClassAuxiliar.Create;
      clAux.conect ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Select MAX(PR_CODI) as MAXCOD ');
      clAux.AddParam ('From   PRODUTOS ');
      clAux.AddParam ('Where (PR_GRUP='+grupo+') AND (PR_SUBG='+subg+') ');
      clAux.Execute;
      edtCodigo.text:=form_nz(clAux.result('MAXCOD')+1,6);
      clAux.desconect;
      clAux.Free;
    end;
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtProdutos.edtCodigoExit(Sender: TObject);
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
      conect ('ESTOQUE', self);
      clearSql;
      AddParam ('Select * ');
      AddParam ('From   PRODUTOS ');
      AddParam ('Where (PR_SUBG='+subgrupo+') AND ');
      AddParam ('      (PR_GRUP='+grupo+') AND ');
      AddParam ('      (PR_CODI='+codigo+') ');
      frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
      frm_principal.refresh;
      if (not Execute) then
      begin
        frm_principal.BarraDicas.caption:='';
        if (btnCancelainclusao.enabled) then
          HabilitaMenus (false,true,false,true,true,true)
        else
          HabilitaMenus (true,false,false,true,true,true);
        edtForn.text := '';
        pnForn.caption := '';
        edtDesc.text := '';
        edtRefInt.text := '';
        edtMat1.text := '';
        edtMat2.text := '';
        edtMat3.text := '';
        edtEstoque.text := '';
        antDesc := '';
      end
      else
      begin
        frm_principal.BarraDicas.caption:='';
        HabilitaMenus (true,false,true,true,true,true);
        PreencheEditsProduto(clProd);
        RefrescaTabela;
      end;
      edtGrupo.text    := form_nz (StrToFloat(grupo),3);
      edtSubGrupo.text := form_nz (StrToFloat(subgrupo),3);
      edtCodigo.text   := form_nz(StrToFloat(codigo),6);
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtProdutos.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Descrição do produto: qualquer caractere (até 60 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtRefIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Referência interna: qualquer caractere (até 10 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtRefFabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Referência do fabricante: qualquer caractere (até 15 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código de barra: qualquer valor numérico (até 15 dígitos)',5);
end;

procedure Tfrm_edtProdutos.edtUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Unidade quantitativa do produto: qualquer caractere (até 3 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtLinhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Linha do produto: qualquer caractere (até 15 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtColecaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Coleção do produto: qualquer caractere (até 3 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtMat1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Materiais 01 do produto: qualquer caractere (até 15 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtMat2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Materiais 02 do produto: qualquer caractere (até 15 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtMat3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Materiais 03 do produto: qualquer caractere (até 15 caracteres)',5);
end;

procedure Tfrm_edtProdutos.edtMinExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtProdutos.edtMaxExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtProdutos.edtMinKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtProdutos.edtMaxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtProdutos.edtDescEnter(Sender: TObject);
var
  nome_parte1,nome_parte2,nome_parte3,nome_parte4: String;
begin
  if (Trim(edtDesc.text)='') then
  begin
        {Sugestao da descricao do produto ****}
    if (parte1=0) then
      nome_parte1:=''
    else
    if (parte1=1) then
      nome_parte1:=nome_grupo
    else
    if (parte1=2) then
      nome_parte1:=nome_subgrupo
    else
    if (parte1=3) then
      nome_parte1:=nome_forn;
    if (parte2=0) then
      nome_parte2:=''
    else
    if (parte2=1) then
      nome_parte2:=nome_grupo
    else
    if (parte2=2) then
      nome_parte2:=nome_subgrupo
    else
    if (parte2=3) then
      nome_parte2:=nome_forn;
    if (parte3=0) then
      nome_parte3:=''
    else
    if (parte3=1) then
      nome_parte3:=nome_grupo
    else
    if (parte3=2) then
      nome_parte3:=nome_subgrupo
    else
    if (parte3=3) then
      nome_parte3:=nome_forn;
    if (parte4=0) then
      nome_parte4:=''
    else
    if (parte4=1) then
      nome_parte4:=nome_grupo
    else
    if (parte4=2) then
      nome_parte4:=nome_subgrupo
    else
    if (parte4=3) then
      nome_parte4:=nome_forn;
    edtDesc.text := Trim(nome_parte1)+' '+Trim(nome_parte2)+' '+
      Trim(nome_parte3)+' '+Trim(nome_parte4);
    edtDesc.selstart:=Length(Trim(edtDesc.text));
  end
  else
    TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtRefIntEnter(Sender: TObject);
var
  clAux: TClassAuxiliar;
  grupo,subg: String;
begin
     {... - Se for inclusao, sugere o prox. codigo de produto}
  if (Trim(edtSubGrupo.text)<>'') and (Trim(edtGrupo.text)<>'') and
    (Trim(edtCodigo.text)<>'') and (Trim(edtRefInt.text)='') then
    if (not Incluirplano1.enabled) then
      try
        frm_principal.servidor_estoque.starttransaction;

        grupo:=Trim(edtGrupo.text);
        subg:=Trim(edtSubGrupo.text);
        clAux:=TClassAuxiliar.Create;
        clAux.conect ('ESTOQUE',self);
        clAux.ClearSql;
        clAux.AddParam ('Select SG_REFI ');
        clAux.AddParam ('From   SUBGRUPOS_PRODUTOS ');
        clAux.AddParam ('Where (SG_GRUP='+grupo+') AND (SG_CODI='+subg+') ');
        clAux.Execute;
        if (Trim(clAux.result('SG_REFI'))<>'') then
          edtRefInt.text:=inttostr(strtoint(clAux.result('SG_REFI')))
        else
          edtRefInt.text:='1';
        clAux.ClearSql;
        clAux.AddParam ('Update SUBGRUPOS_PRODUTOS ');
        clAux.AddParam ('Set    SG_REFI=:refi ');
        clAux.AddParam ('Where (SG_GRUP='+grupo+') AND (SG_CODI='+subg+') ');
        clAux.consulta.parambyname('refi').AsString:=inttostr(strtoint(Trim(edtRefInt.text))+1);
        clAux.Execute;
        clAux.desconect;
        clAux.Free;

              {...}
        frm_principal.servidor_estoque.commit;
      except
        frm_principal.servidor_estoque.rollback;
      end{inicio da transacao};
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtUnidadeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtLinhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtColecaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtMat1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtMat2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtMat3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtMinEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtMaxEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtEstoqueEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtMinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Desconto mínimo do produto: formato 99,99',5);
end;

procedure Tfrm_edtProdutos.edtMaxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControlePagina1(TWinControl(sender),true);
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Desconto mínimo do produto: formato 99,99',5);
end;

procedure Tfrm_edtProdutos.edtEstoqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtTamanho.setfocus;
  if (key=38) then
    FocusControlePagina1(TWinControl(sender),false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Quantidade em estoque do produto: formato 9999',5);
end;

procedure Tfrm_edtProdutos.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtProdutos.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtProdutos.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtProdutos.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtProdutos.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

{Rotina de habilitacao de menus}
procedure Tfrm_edtProdutos.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
begin
  if (menu1) then
    Incluirplano1.enabled:=true
  else
    Incluirplano1.enabled:=false;
  if (menu2) then
  begin
    Cancelarincluso1.enabled:=true;
    btnCancelainclusao.enabled:=true;
  end
  else
  begin
    Cancelarincluso1.enabled:=false;
    btnCancelainclusao.enabled:=false;
  end;
  if (menu3) then
    Excluirplano1.enabled:=true
  else
    Excluirplano1.enabled:=false;
  if (menu4) then
    Salvar1.enabled:=true
  else
    Salvar1.enabled:=false;
  if (menu5) then
    Limparcadastro1.enabled:=true
  else
    Limparcadastro1.enabled:=false;
  if (menu6) then
    Imprimirplanos1.enabled:=true
  else
    Imprimirplanos1.enabled:=false;
end;

procedure Tfrm_edtProdutos.edtGrupoExit(Sender: TObject);
var
  clGrupo: TClassGruposProdutos;
  codigo: String;
begin
  codigo := Trim(edtGrupo.text);
  if (codigo<>'') then
  begin
    clGrupo := TClassGruposProdutos.Create;
    with (clGrupo) do
    begin
      Conect ('ESTOQUE',self);
      AddParam ('Select * ');
      AddParam ('From   GRUPOS_PRODUTOS ');
      AddParam ('Where (GR_CODI='+codigo+')  ');
      if (not Execute) then
      begin
        pnGrupo.caption := '<Grupo não cadastrado>';
        nome_grupo := 'Grupo ? ';
      end
      else
      begin
        pnGrupo.caption := Trim(clGrupo.result('GR_DESC'));
        nome_grupo      := Trim(clGrupo.result('GR_DESC'));
        edtGrupo.text   := form_nz(strtofloat(codigo),3);
      end;
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtProdutos.edtSubGrupoExit(Sender: TObject);
var
  clSub: TClassSubGruposProdutos;
  codigo,grupo: String;
begin
  grupo  := Trim(edtGrupo.text);
  codigo := Trim(edtSubGrupo.text);
  if (codigo<>'') then
  begin
    clSub := TClassSubGruposProdutos.Create;
    with (clSub) do
    begin
      Conect ('ESTOQUE',self);
      AddParam ('Select * ');
      AddParam ('From   SUBGRUPOS_PRODUTOS ');
      AddParam ('Where (SG_GRUP='+grupo+') AND (SG_CODI='+codigo+')  ');
      if (not Execute) then
      begin
        pnGrupo.caption := '<Grupo/Subgrupo não cadastrado>';
        nome_subgrupo   := 'Subgrupo ? ';
      end
      else
      begin
        pnGrupo.caption  := nome_grupo +' '+form_t(clSub.result('SG_DESC'),20);
        edtSubGrupo.text := form_nz(strtofloat(codigo),3);
        edtMin.text      := form_nc(clSub.Result ('SG_DMIN'),5);
        edtMax.text      := form_nc(clSub.Result ('SG_DMAX'),5);
        edtUnidade.text  := clSub.result('SG_UNID');
        edtLinha.text    := clSub.result('SG_LINH');
        edtColecao.text  := clSub.result('SG_COLE');
        edtTamanho.text  := form_nz(clSub.result('SG_TTAM'),2);
        pnTamanho.caption := ProcuraNomeTamanho(clSub.result('SG_TTAM'),self);
        if (clSub.result('SG_CUNI')='0') then
          chCorUnica.checked := false
        else
        if (clSub.result('SG_CUNI')='1') then
          chCorUnica.checked := true;
        if (clSub.result('SG_TUNI')='0') then
          chTamUnico.checked := false
        else
        if (clSub.result('SG_TUNI')='1') then
          chTamUnico.checked := true;
        if (clSub.result('SG_PA21')=0) then
          cbParte1.text:='Nada'
        else
        if (clSub.result('SG_PA21')=1) then
          cbParte1.text:='Cor'
        else
        if (clSub.result('SG_PA21')=2) then
          cbParte1.text:='Tamanho';
        if (clSub.result('SG_PA22')=0) then
          cbParte2.text:='Nada'
        else
        if (clSub.result('SG_PA22')=1) then
          cbParte2.text:='Cor'
        else
        if (clSub.result('SG_PA22')=2) then
          cbParte2.text:='Tamanho';

               {... config. do nome do produto}
        nome_subgrupo := form_t(clSub.result('SG_DESC'),20);
        parte1 := clSub.Result('SG_PAR1');
        parte2 := clSub.Result('SG_PAR2');
        parte3 := clSub.Result('SG_PAR3');
        parte4 := clSub.Result('SG_PAR4');
      end;
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtProdutos.Cancelarincluso1Click(Sender: TObject);
begin
  qFaixas.close;
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtGrupo.setfocus;
end;

procedure Tfrm_edtProdutos.Limparcadastro1Click(Sender: TObject);
begin
  qFaixas.close;
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtGrupo.setfocus;
end;

procedure Tfrm_edtProdutos.edtFornExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtForn.text);
  if (codigo<>'') then
  begin
    pnForn.caption := ProcuraNomeForn(strtofloat(codigo),self);
    nome_forn      := Trim(pnForn.caption);
    edtForn.text   := form_nz(strtofloat(codigo),6);
  end;
end;

procedure Tfrm_edtProdutos.PreencheEditsProduto(clProd: TClassProdutos);
var
  clSub: TClassSubGruposProdutos;
  subgrupo,grupo,codigo: String;
begin
  with (clProd) do
  begin
    edtForn.text:=form_nz(result('PR_FORN'),6);
    pnForn.caption:=ProcuraNomeForn(result('PR_FORN'),self);
    edtDesc.text:=form_t(result('PR_DESC'),60);
    edtRefInt.text:=form_t(result('PR_REFI'),10);
    edtUnidade.text:=form_t(result('PR_UNID'),3);
    edtLinha.text:=form_t(result('PR_LINH'),15);
    edtColecao.text:=form_t(result('PR_COLE'),15);
    edtMat1.text:=form_t(result('PR_MAT1'),15);
    edtMat2.text:=form_t(result('PR_MAT2'),15);
    edtMat3.text:=form_t(result('PR_MAT3'),15);
    edtMin.text:=form_nc(result('PR_DMIN'),5);
    edtMax.text:=form_nc(result('PR_DMAX'),5);
    edtTamanho.text:=form_nz(result('PR_TTAM'),2);
    pnTamanho.caption:=ProcuraNomeTamanho(result('PR_TTAM'),self);
    if (result('PR_CUNI')='1') then
      chCorUnica.checked:=true
    else
    if (result('PR_CUNI')='0') then
      chCorUnica.checked:=false;
    if (result('PR_TUNI')='1') then
      chTamUnico.checked:=true
    else
    if (result('PR_TUNI')='0') then
      chTamUnico.checked:=false;
    edtEstoque.text:=form_n(result('PR_QTMI'),4);
    cbParte1.itemindex:=result('PR_PAR1');
    cbParte2.itemindex:=result('PR_PAR2');
    if (result('PR_PAR1')=0) then
      cbParte1.text:='Nada'
    else
    if (result('PR_PAR1')=1) then
      cbParte1.text:='Cor'
    else
    if (result('PR_PAR1')=2) then
      cbParte1.text:='Tamanho';
    if (result('PR_PAR2')=0) then
      cbParte2.text:='Nada'
    else
    if (result('PR_PAR2')=1) then
      cbParte2.text:='Cor'
    else
    if (result('PR_PAR2')=2) then
      cbParte2.text:='Tamanho';
  end;
end;

procedure Tfrm_edtProdutos.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  grupo,subgrupo: Real;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtForn.setfocus;
  if (key=K_CIMA) then
    edtSubGrupo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do produto: Formato: 999999 ',5);
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=strtofloat(Trim(edtGrupo.text));
      subgrupo:=strtofloat(Trim(edtSubGrupo.text));
      ChamandoF8Produtos_2(edtCodigo,grupo,subgrupo,true);
    end;
end;

procedure Tfrm_edtProdutos.edtFornKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDesc.setfocus;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn,true);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do fornecedor do produto: Formato: 999999 (somente digitos) - Tecle <F8/Duplo clique> para selecionar fornecedores cadastrados.',5);
end;

procedure Tfrm_edtProdutos.Salvar1Click(Sender: TObject);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtGrupo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do grupo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtGrupo.setfocus;
  end
  else
  if (Trim(edtSubGrupo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do subgrupo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSubGrupo.setfocus;
  end
  else
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do produto não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  begin
    grupo    := Trim(edtGrupo.text);
    subgrupo := Trim(edtSubGrupo.text);
    codigo   := Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select PR_GRUP,PR_CODI,PR_SUBG ');
        AddParam ('From   PRODUTOS ');
        AddParam ('Where  (PR_GRUP='+grupo+') AND ');
        AddParam ('       (PR_CODI='+codigo+') AND ');
        AddParam ('       (PR_SUBG='+subgrupo+') ');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_PRODUTOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inPR_GRUP:=strtofloat(Trim(grupo));
            inPR_SUBG:=strtofloat(Trim(subgrupo));
            inPR_CODI:=strtofloat(Trim(codigo));
            if (Trim(edtForn.text)<>'') then
              inPR_FORN:=strtofloat(Trim(edtForn.text))
            else
              inPR_FORN:=0;
            inPR_DESC:=Trim(edtDesc.text);
            inPR_REFI:=Trim(edtRefInt.text);
            inPR_UNID:=Trim(edtUnidade.text);
            inPR_LINH:=Trim(edtLinha.text);
            inPR_COLE:=Trim(edtColecao.text);
            inPR_MAT1:=Trim(edtMat1.text);
            inPR_MAT2:=Trim(edtMat2.text);
            inPR_MAT3:=Trim(edtMat3.text);
            if (Trim(edtTamanho.text)<>'') then
              inPR_TTAM:=strtofloat(Trim(edtTamanho.text));
            if (Trim(edtMin.text)<>'') then
              inPR_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)));
            if (Trim(edtMax.text)<>'') then
              inPR_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)));
            if (chCorUnica.checked) then
              inPR_CUNI  := '1'
            else
              inPR_CUNI  := '0';
            if (chTamUnico.checked) then
              inPR_TUNI  := '1'
            else
              inPR_TUNI  := '0';
            if (trim(edtEstoque.text)<>'') then
              inPR_QTMI:=strtoint(Trim(edtEstoque.text));
            if (Trim(cbParte1.text)='Nada') then
              inPR_PAR1:=0
            else
            if (Trim(cbParte1.text)='Cor') then
              inPR_PAR1:=1
            else
            if (Trim(cbParte1.text)='Tamanho') then
              inPR_PAR1:=2;
            if (Trim(cbParte2.text)='Nada') then
              inPR_PAR2:=0
            else
            if (Trim(cbParte2.text)='Cor') then
              inPR_PAR2:=1
            else
            if (Trim(cbParte2.text)='Tamanho') then
              inPR_PAR2:=2;
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inPR_DESC) then
            begin
              with (frm_f8Produtos) do
                ds.dataset.close;
              with (frm_f8Produtos2) do
                ds.dataset.close;
            end;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_PRODUTOS,'A',strtoint(codigo),'','');
            edtGrupo.setfocus;
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SUBGRUPOS, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inPR_GRUP:=strtofloat(Trim(grupo));
          inPR_SUBG:=strtofloat(Trim(subgrupo));
          inPR_CODI:=strtofloat(Trim(codigo));
          if (Trim(edtForn.text)<>'') then
            inPR_FORN:=strtofloat(Trim(edtForn.text))
          else
            inPR_FORN:=0;
          inPR_DESC:=Trim(edtDesc.text);
          inPR_REFI:=Trim(edtRefInt.text);
          inPR_UNID:=Trim(edtUnidade.text);
          inPR_LINH:=Trim(edtLinha.text);
          inPR_COLE:=Trim(edtColecao.text);
          inPR_MAT1:=Trim(edtMat1.text);
          inPR_MAT2:=Trim(edtMat2.text);
          inPR_MAT3:=Trim(edtMat3.text);
          if (Trim(edtTamanho.text)<>'') then
            inPR_TTAM:=strtofloat(Trim(edtTamanho.text));
          if (Trim(edtMin.text)<>'') then
            inPR_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)));
          if (Trim(edtMax.text)<>'') then
            inPR_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)));
          if (chCorUnica.checked) then
            inPR_CUNI  := '1'
          else
            inPR_CUNI  := '0';
          if (chTamUnico.checked) then
            inPR_TUNI  := '1'
          else
            inPR_TUNI  := '0';
          if (trim(edtEstoque.text)<>'') then
            inPR_QTMI:=strtoint(Trim(edtEstoque.text));
          if (Trim(cbParte1.text)='Nada') then
            inPR_PAR1:=0
          else
          if (Trim(cbParte1.text)='Cor') then
            inPR_PAR1:=1
          else
          if (Trim(cbParte1.text)='Tamanho') then
            inPR_PAR1:=2;
          if (Trim(cbParte2.text)='Nada') then
            inPR_PAR2:=0
          else
          if (Trim(cbParte2.text)='Cor') then
            inPR_PAR2:=1
          else
          if (Trim(cbParte2.text)='Tamanho') then
            inPR_PAR2:=2;
          Insert;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8Produtos) do
            ds.dataset.close;
          with (frm_f8Produtos2) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_PRODUTOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtProdutos.FocusControlePagina1(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  scroll.GetTabOrderList(Lista);
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

procedure Tfrm_edtProdutos.FocusControlePagina2(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  gbTamanho.GetTabOrderList(Lista);
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

procedure Tfrm_edtProdutos.RefrescaTabela;
var
  grupo,subgrupo,produto: Real;
begin
  if (Trim(edtGrupo.text)<>'') and (Trim(edtSubGrupo.text)<>'') and
    (Trim(edtCodigo.text)<>'') then
  begin
    grupo    := strtofloat(Trim(edtGrupo.text));
    subgrupo := strtofloat(Trim(edtSubGrupo.text));
    produto  := strtofloat(Trim(edtCodigo.text));
    with (qFaixas) do
    begin
      disablecontrols;
      close;
      parambyname('grupo').AsFloat    := grupo;
      parambyname('subgrupo').AsFloat := subgrupo;
      parambyname('produto').AsFloat  := produto;
      open;
      enablecontrols;
    end;
  end;
end;

procedure Tfrm_edtProdutos.btnIncluirFaixaClick(Sender: TObject);
var
  grupo,subgrupo,produto: Real;
  clSubFaixa: TClassProdutosFaixas;
begin
  if (Trim(edtFaixa.text)<>'') and (Trim(edtGrupo.text)<>'') and
    (Trim(edtSubGrupo.text)<>'') and (Trim(edtCodigo.text)<>'') then
  begin
    grupo      := strtofloat(Trim(edtGrupo.text));
    subgrupo   := strtofloat(Trim(edtSubGrupo.text));
    produto    := strtofloat(Trim(edtCodigo.text));
    clSubFaixa := TClassProdutosFaixas.Create;
    with (clSubFaixa) do
    begin
      conect ('ESTOQUE',self);
      ClearFields;
      inPF_GRUP:=grupo;
      inPF_SUBG:=subgrupo;
      inPF_PROD:=produto;
      inPF_TAMA:=Trim(edtFaixa.text);
      Insert;
      desconect;
      Free;
      edtFaixa.text:='';
      edtFaixa.setfocus;
    end;
    RefrescaTabela;
  end;
end;

procedure Tfrm_edtProdutos.btnExcluirFaixaClick(Sender: TObject);
var
  grupo,subgrupo,produto,faixa: String;
  clSubFaixa: TClassProdutosFaixas;
begin
  if (qFaixas.active) then
  begin
    grupo       := qFaixas.fieldbyname('PF_GRUP').AsString;
    subgrupo    := qFaixas.fieldbyname('PF_SUBG').AsString;
    produto     := qFaixas.fieldbyname('PF_PROD').AsString;
    faixa       := qFaixas.fieldbyname('PF_TAMA').AsString;
    clSubFaixa  := TClassProdutosFaixas.Create;
    with (clSubFaixa) do
    begin
      conect ('ESTOQUE',self);
      ClearSql;
      AddParam ('Delete from PRODUTOS_FAIXAS ');
      AddParam ('Where (PF_GRUP='+grupo+') AND ');
      AddParam ('      (PF_SUBG='+subgrupo+') AND ');
      AddParam ('      (PF_PROD='+produto+') AND ');
      AddParam ('      (PF_TAMA='+chr(39)+faixa+chr(39)+') ');
      Execute;
      desconect;
      Free;
    end;
    RefrescaTabela;
  end;
end;

procedure Tfrm_edtProdutos.edtFornEnter(Sender: TObject);
begin
  edtSubGrupo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe fornecedores cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtProdutos.edtTamanhoEnter(Sender: TObject);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
  TMaskEdit(sender).selectall;

    {CRITICA do cadastro ***}
  if (Trim(edtGrupo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do grupo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtGrupo.setfocus;
  end
  else
  if (Trim(edtSubGrupo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do subgrupo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSubGrupo.setfocus;
  end
  else
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do produto não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  begin
    grupo    := Trim(edtGrupo.text);
    subgrupo := Trim(edtSubGrupo.text);
    codigo   := Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select PR_GRUP,PR_CODI,PR_SUBG ');
        AddParam ('From   PRODUTOS ');
        AddParam ('Where  (PR_GRUP='+grupo+') AND ');
        AddParam ('       (PR_CODI='+codigo+') AND ');
        AddParam ('       (PR_SUBG='+subgrupo+') ');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_PRODUTOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inPR_GRUP:=strtofloat(Trim(grupo));
            inPR_SUBG:=strtofloat(Trim(subgrupo));
            inPR_CODI:=strtofloat(Trim(codigo));
            if (Trim(edtForn.text)<>'') then
              inPR_FORN:=strtofloat(Trim(codigo))
            else
              inPR_FORN:=0;
            inPR_DESC:=Trim(edtDesc.text);
            inPR_REFI:=Trim(edtRefInt.text);
            inPR_UNID:=Trim(edtUnidade.text);
            inPR_LINH:=Trim(edtLinha.text);
            inPR_COLE:=Trim(edtColecao.text);
            inPR_MAT1:=Trim(edtMat1.text);
            inPR_MAT2:=Trim(edtMat2.text);
            inPR_MAT3:=Trim(edtMat3.text);
            if (Trim(edtMin.text)<>'') then
              inPR_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)));
            if (Trim(edtMax.text)<>'') then
              inPR_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)));
            if (chCorUnica.checked) then
              inPR_CUNI  := '1'
            else
              inPR_CUNI  := '0';
            if (chTamUnico.checked) then
              inPR_TUNI  := '1'
            else
              inPR_TUNI  := '0';
            if (trim(edtEstoque.text)<>'') then
              inPR_QTMI:=strtoint(Trim(edtEstoque.text));
            UpdateAll;
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inPR_DESC) then
            begin
              with (frm_f8Produtos) do
                ds.dataset.close;
              with (frm_f8Produtos2) do
                ds.dataset.close;
            end;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_PRODUTOS,'A',strtoint(codigo),'','');
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SUBGRUPOS, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inPR_GRUP:=strtofloat(Trim(grupo));
          inPR_SUBG:=strtofloat(Trim(subgrupo));
          inPR_CODI:=strtofloat(Trim(codigo));
          if (Trim(edtForn.text)<>'') then
            inPR_FORN:=strtofloat(Trim(codigo))
          else
            inPR_FORN:=0;
          inPR_DESC:=Trim(edtDesc.text);
          inPR_REFI:=Trim(edtRefInt.text);
          inPR_UNID:=Trim(edtUnidade.text);
          inPR_LINH:=Trim(edtLinha.text);
          inPR_COLE:=Trim(edtColecao.text);
          inPR_MAT1:=Trim(edtMat1.text);
          inPR_MAT2:=Trim(edtMat2.text);
          inPR_MAT3:=Trim(edtMat3.text);
          if (Trim(edtMin.text)<>'') then
            inPR_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)));
          if (Trim(edtMax.text)<>'') then
            inPR_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)));
          if (chCorUnica.checked) then
            inPR_CUNI  := '1'
          else
            inPR_CUNI  := '0';
          if (chTamUnico.checked) then
            inPR_TUNI  := '1'
          else
            inPR_TUNI  := '0';
          if (trim(edtEstoque.text)<>'') then
            inPR_QTMI:=strtoint(Trim(edtEstoque.text));
          Insert;
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          with (frm_f8Produtos) do
            ds.dataset.close;
          with (frm_f8Produtos2) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_PRODUTOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtProdutos.edtTamanhoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    cbParte1.setfocus;
  if (key=38) then
    edtEstoque.setfocus;
  if (key=K_F8) then
    ChamandoF8Tamanhos(edtTamanho,true);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Tipo de tamanho do produto: formato 99',5);
end;

procedure Tfrm_edtProdutos.FormActivate(Sender: TObject);
begin
  scroll.VertScrollBar.Position:=0;
  edtGrupo.setfocus;
  if (btnIncluir.Glyph.Empty) then
    btnIncluir.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_incluir.bmp');
  if (btnCancelaInclusao.Glyph.Empty) then
    btnCancelaInclusao.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_cancelincluir.bmp');
  if (btnExcluir.Glyph.Empty) then
    btnExcluir.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_excluir.bmp');
  if (btnSalvar.Glyph.Empty) then
    btnSalvar.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_salvar.bmp');
  if (btnImprimir.Glyph.Empty) then
    btnImprimir.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_imprimir.bmp');
end;

procedure Tfrm_edtProdutos.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,true);
end;

procedure Tfrm_edtProdutos.edtTamanhoExit(Sender: TObject);
var
  clFaixa: TClassProdutosFaixas;
  clAux: TClassAuxiliar;
  produto,grupo,subgrupo,tamanho,codigo: String;
begin
  codigo := Trim(edtTamanho.text);
  if (codigo<>'') then
  begin
    pnTamanho.caption:=ProcuraNomeTamanho(strtofloat(codigo),self);
    edtTamanho.text:=form_nz(strtofloat(codigo),2);
  end;

    {Preenchendo com as faixas de tamanho/tipo de tamanho}
  grupo    := Trim(edtGrupo.text);
  subgrupo := Trim(edtSubGrupo.text);
  produto  := Trim(edtCodigo.text);
  tamanho  := Trim(edtTamanho.text);
  if (grupo<>'') and (subgrupo<>'') and (tamanho<>'') and (produto<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select * ');
      AddParam ('From PRODUTOS_FAIXAS ');
      AddParam ('Where (PF_GRUP='+grupo+') AND ');
      AddParam ('      (PF_SUBG='+subgrupo+') AND ');
      AddParam ('      (PF_PROD='+produto+') ');
      if (not Execute) then
      begin
        ClearSql;
        AddParam ('Select * ');
        AddParam ('From  TAMANHOS_FAIXAS ');
        AddParam ('Where (TF_CODI='+tamanho+')  ');
        Execute;
        first;
        while (not eof) do
        begin
                       {Sugestao de faixa de tamanho->}
          clFaixa:=TClassProdutosFaixas.Create;
          clFaixa.conect('ESTOQUE',self);
          clFaixa.ClearFields;
          clFaixa.inPF_GRUP:=strtofloat(grupo);
          clFaixa.inPF_SUBG:=strtofloat(subgrupo);
          clFaixa.inPF_PROD:=strtofloat(produto);
          clFaixa.inPF_TAMA:=Trim(result('TF_TAMA'));
          clFaixa.Insert;
          clFaixa.desconect;
          clFaixa.Free;
          next;
        end;
        RefrescaTabela;
      end;
      desconect;
      Free;
    end;
end;

procedure Tfrm_edtProdutos.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_INSERT) then
    edtFaixa.setfocus;   
  if (key=K_DELETE) then
    btnExcluirFaixa.click;
end;

procedure Tfrm_edtProdutos.edtFaixaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtProdutos.edtFaixaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (Trim(edtFaixa.text)<>'') then
      btnIncluirFaixa.click
    else
      cbParte1.setfocus;
  if (key=K_CIMA) then
    edtTamanho.setfocus;
end;

procedure Tfrm_edtProdutos.cbParte1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    cbParte2.setfocus;
end;

procedure Tfrm_edtProdutos.cbParte2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSalvar.click;
end;

procedure Tfrm_edtProdutos.btnVerEstoqueClick(Sender: TObject);
begin
  Verestoquedoproduto1.click;
end;

procedure Tfrm_edtProdutos.Verestoquedoproduto1Click(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') and (Trim(edtSubGrupo.text)<>'') and
    (Trim(edtCodigo.text)<>'') then
    if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_ESTOQUE, 'C')) then
      frm_principal.ExibirDica ('Acesso não permitido...',5)
    else
    begin
      Application.CreateForm (Tfrm_edtEstoqueLoja, frm_edtEstoqueLoja);
      with (frm_edtEstoqueLoja) do
      begin
        caption := frm_principal.x_sistema+' - Consulta ao Estoque das lojas';
        if (pnLocal1.visible) then
        begin
          edtGrupo.text := Trim(frm_edtProdutos.edtGrupo.text);
          edtSubGrupo.text := Trim(frm_edtProdutos.edtSubGrupo.text);
          edtCodigo.text := Trim(frm_edtProdutos.edtCodigo.text);
        end
        else
          edtRefInt.text := frm_edtProdutos.edtRefInt.text;
        showmodal;
        free;
      end;
    end;
end;

procedure Tfrm_edtProdutos.Itensdoproduto1Click(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') and (Trim(edtSubGrupo.text)<>'') and
    (Trim(edtCodigo.text)<>'') then
    if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_ESTOQUE, 'C')) then
      frm_principal.ExibirDica ('Acesso não permitido...',5)
    else
    begin
      Application.CreateForm (Tfrm_edtEstoque, frm_edtEstoque);
      with (frm_edtEstoque) do
      begin
        caption  := frm_principal.x_sistema+' - Consulta ao Estoque';
        if (pnLocal1.visible) then
        begin
          edtGrupo.text    := Trim(frm_edtProdutos.edtGrupo.text);
          edtSubgrupo.text := Trim(frm_edtProdutos.edtSubGrupo.text);
          edtCodigo.text   := Trim(frm_edtProdutos.edtCodigo.text);
        end
        else
          edtRefInt.text  := frm_edtProdutos.edtRefInt.text;
        showmodal;
        free;
      end;
    end;
end;

procedure Tfrm_edtProdutos.btnVerItensProdutosClick(Sender: TObject);
begin
  Itensdoproduto1.click;
end;

procedure Tfrm_edtProdutos.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  totprod: Integer;
  indGauge,totGauge: Integer;
  flag_cor,flag_tam: String;
begin
     {Inicio da visualizacao da impressao ***}
  Mostra_mensagem('Preparando relatório...');
  frm_mensagem.painel.visible:=true;
  frm_mensagem.gauge1.progress:=0;
  clAux := TClassAuxiliar.Create;
  with (clAux) do
  begin
    conect   ('ESTOQUE', self);
    clearSql;
    AddParam ('Select * ');
    AddParam ('From   PRODUTOS  ');
    AddParam ('Order by PR_GRUP,PR_SUBG,PR_CODI   ');
    frm_principal.BarraDicas.caption:='Buscando cadastro de produtos...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_arq_impressao := 'c07.rel';
    frm_principal.x_comando       := '15c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE PRODUTOS';

        {cabecalhos}
    AddLine(form_tc('-',132,'-'));
    AddLine('    |    |      |                         |Referencia|Desc. |Desc. |Cor  |Tam  |               |               |Cod|Estoq  ');
    AddLine('Grup|Subg|Cod   |Descricao                |Interna   |Min % |Max % |Unica|Unico|Linha          |Colecao        |Tam|Minimo ');
    AddLine(form_tc('-',132,'-'));
    totprod:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      if (clAux.result('PR_CUNI')='0') then
        flag_cor:='  Nao'
      else
      if (clAux.result('PR_CUNI')='1') then
        flag_cor:='  Sim';
      if (clAux.result('PR_TUNI')='0') then
        flag_tam:='  Nao'
      else
      if (clAux.result('PR_TUNI')='1') then
        flag_tam:='  Sim';
      AddLine(form_nz (clAux.Result('PR_GRUP'),3) +' '+
        form_nz (clAux.Result('PR_SUBG'),3) +' '+
        form_nz (clAux.Result('PR_CODI'),6) +' '+
        form_t  (clAux.Result('PR_DESC'),26)+' '+
        form_t  (clAux.Result('PR_REFI'),10)+' '+
        form_nc (clAux.Result('PR_DMIN'),6) +' '+
        form_nc (clAux.Result('PR_DMAX'),6) +' '+
        flag_cor+' '+
        flag_tam+' '+
        form_t  (clAux.Result('PR_LINH'),15)+' '+
        form_t  (clAux.Result('PR_COLE'),15)+'  '+
        form_nz (clAux.Result('PR_TTAM'),2) +' '+
        form_n  (clAux.Result('PR_QTMI'),5));
      totprod := totprod + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total de produtos  ---> '+form_nz (totprod,4));
    AddLine('');

        {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_principal.BarraDicas.caption:='';
  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  frm_mem_print.showmodal;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_edtProdutos.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_PRODUTOS, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    LimparEdits;
    edtGrupo.setfocus;
  end;
end;

procedure Tfrm_edtProdutos.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_edtProdutos.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_edtProdutos.edtCodigoDblClick(Sender: TObject);
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

procedure Tfrm_edtProdutos.edtTamanhoDblClick(Sender: TObject);
begin
  ChamandoF8Tamanhos(edtTamanho,true);
end;

procedure Tfrm_edtProdutos.Excluirplano1Click(Sender: TObject);
var
  clProd: TClassProdutos;
  codgrupo,codsubgrupo,codproduto: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_PRODUTOS, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codgrupo      := Trim(edtGrupo.text);
    codsubgrupo   := Trim(edtSubGrupo.text);
    codproduto    := Trim(edtCodigo.text);
    if (codproduto<>'') and (codgrupo<>'') and (codsubgrupo<>'')
      and (Trim(edtDesc.text)<>'') then
      with (clProd) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do produto?'
          ,'Exclusão do produto',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clProd := TClassProdutos.Create;
          conect ('ESTOQUE', self);
          ClearSql;
          AddParam ('Delete from PRODUTOS                    ');
          AddParam ('Where  (PR_GRUP='+codgrupo+')      AND  ');
          AddParam ('       (PR_SUBG='+codsubgrupo+')   AND  ');
          AddParam ('       (PR_CODI='+codproduto+')         ');
          Execute;
          ClearSql;
          AddParam ('Delete from PRODUTOS_FAIXAS             ');
          AddParam ('Where  (PF_GRUP='+codgrupo+') AND       ');
          AddParam ('       (PF_SUBG='+codsubgrupo+') AND    ');
          AddParam ('       (PF_PROD='+codproduto+')         ');
          Execute;
          desconect;
          Free;
          with (frm_f8Produtos) do
            ds.dataset.close;
          with (frm_f8Produtos2) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_PRODUTOS,'E',0,'','');
          frm_principal.ExibirDica (' Produto excluído com sucesso...',5);
        end
        else
          edtGrupo.setfocus;
  end;
end;

end.
