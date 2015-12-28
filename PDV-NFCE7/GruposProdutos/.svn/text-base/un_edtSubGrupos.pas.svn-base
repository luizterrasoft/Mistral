unit un_edtSubGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Menus, StdCtrls, Mask, Grids, DBGrids, Db, DBTables;

type
  Tfrm_edtSubGrupos = class(TForm)
    Label2: TLabel;
    edtGrupo: TMaskEdit;
    edtDesc: TMaskEdit;
    Label1: TLabel;
    Bevel2: TBevel;
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
    Label3: TLabel;
    edtSubGrupo: TMaskEdit;
    pnGrupo: TPanel;
    Label14: TLabel;
    edtUnidade: TMaskEdit;
    Label15: TLabel;
    edtRefInicial: TMaskEdit;
    Label17: TLabel;
    edtMin: TMaskEdit;
    edtMax: TMaskEdit;
    Label18: TLabel;
    edtMargem: TMaskEdit;
    Label19: TLabel;
    Bevel3: TBevel;
    Panel1: TPanel;
    Label21: TLabel;
    btnIncluirFaixa: TSpeedButton;
    btnExcluirFaixa: TSpeedButton;
    grade: TDBGrid;
    edtFaixa: TMaskEdit;
    ds: TDataSource;
    qFaixas: TQuery;
    qFaixasSF_TAMA: TStringField;
    qFaixasSF_GRUP: TFloatField;
    Label22: TLabel;
    edtTamanho: TMaskEdit;
    pnTamanho: TPanel;
    Label25: TLabel;
    edtLinha: TMaskEdit;
    Label26: TLabel;
    edtColecao: TMaskEdit;
    grupo1: TGroupBox;
    chCorUnica: TCheckBox;
    chTamUnico: TCheckBox;
    qFaixasSF_SUBG: TFloatField;
    Panel2: TPanel;
    Label20: TLabel;
    cbParte1: TComboBox;
    cbParte2: TComboBox;
    cbParte3: TComboBox;
    cbParte4: TComboBox;
    Label33: TLabel;
    cbParte21: TComboBox;
    cbParte22: TComboBox;
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescEnter(Sender: TObject);
    procedure edtUnidadeEnter(Sender: TObject);
    procedure edtRefInicialEnter(Sender: TObject);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMinEnter(Sender: TObject);
    procedure edtMaxEnter(Sender: TObject);
    procedure edtMargemEnter(Sender: TObject);
    procedure edtMargemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaEnter(Sender: TObject);
    procedure edtFaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirFaixaClick(Sender: TObject);
    procedure btnExcluirFaixaClick(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtMinExit(Sender: TObject);
    procedure edtMaxExit(Sender: TObject);
    procedure edtMargemExit(Sender: TObject);
    procedure edtMinKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMargemKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTamanhoEnter(Sender: TObject);
    procedure edtTamanhoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTamanhoExit(Sender: TObject);
    procedure edtLinhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtColecaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtColecaoEnter(Sender: TObject);
    procedure edtLinhaEnter(Sender: TObject);
    procedure edtMat1Enter(Sender: TObject);
    procedure edtMat2Enter(Sender: TObject);
    procedure edtMat3Enter(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Excluirplano1Click(Sender: TObject);
    procedure cbParte1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbParte2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbParte3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbParte4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Incluirplano1Click(Sender: TObject);
    procedure cbParte21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbParte22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtTamanhoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoInclusao: Integer;
    antDesc: String;
    procedure RefrescaTabela;
    procedure LimparEdits;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
  end;

var
  frm_edtSubGrupos: Tfrm_edtSubGrupos;

implementation

uses principal, funcoes1, funcoes2, procura, subgrupos_produtos_faixas, subgrupos_produtos,
  grupos_produtos, unDialogo, auxiliar, unMensagem, mem_prnt, f8SubGrupos;

{$R *.DFM}

procedure Tfrm_edtSubGrupos.edtGrupoEnter(Sender: TObject);
begin
  edtGrupo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtSubGrupos.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_edtSubGrupos.edtDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtUnidadeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtRefInicialEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo: Real;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDesc.setfocus;
  if (key=K_CIMA) then
    edtGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=strtofloat(Trim(edtGrupo.text));
      ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 999; ',5);
end;

procedure Tfrm_edtSubGrupos.edtSubGrupoEnter(Sender: TObject);
var
  clAux: TClassAuxiliar;
  grupo: String;
begin
     {... - Se for inclusao, sugere o prox. codigo de subgrupo}
  if (Trim(edtSubGrupo.text)='') and (Trim(edtGrupo.text)<>'') then
    if (not Incluirplano1.enabled) then
    begin
      grupo:=Trim(edtGrupo.text);
      clAux:=TClassAuxiliar.Create;
      clAux.conect ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Select MAX(SG_CODI) as MAXCOD ');
      clAux.AddParam ('From SUBGRUPOS_PRODUTOS ');
      clAux.AddParam ('Where (SG_GRUP='+grupo+') ');
      clAux.Execute;
      edtSubGrupo.text:=form_nz(clAux.result('MAXCOD')+1,3);
      clAux.desconect;
      clAux.Free;
    end;
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtUnidade.setfocus;
  if (key=K_CIMA) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Descrição do subgrupo: qualquer caractere (até 20 caracteres); ',5);
end;

procedure Tfrm_edtSubGrupos.edtUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRefInicial.setfocus;
  if (key=K_CIMA) then
    edtDesc.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Unidade do subgrupo: qualquer caractere (até 05 caracteres); ',5);
end;

procedure Tfrm_edtSubGrupos.edtRefInicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtMin.setfocus;
  if (key=K_CIMA) then
    edtUnidade.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. Inicial do subgrupo: qualquer caractere (até 10 caracteres); ',5);
end;

procedure Tfrm_edtSubGrupos.edtMinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtMax.setfocus;
  if (key=K_CIMA) then
    edtRefInicial.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Desconto mínimo do subgrupo: formato 99,99; ',5);
end;

procedure Tfrm_edtSubGrupos.edtMaxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtlinha.setfocus;
  if (key=K_CIMA) then
    edtMin.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Desconto máximo do subgrupo: formato 99,99; ',5);
end;

procedure Tfrm_edtSubGrupos.edtMinEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtMaxEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtMargemEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtMargemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtTamanho.setfocus;
  if (key=K_CIMA) then
    edtColecao.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Margem de contribuição do subgrupo: formato 99,99; ',5);
end;

procedure Tfrm_edtSubGrupos.edtFaixaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtFaixaKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_edtSubGrupos.btnIncluirFaixaClick(Sender: TObject);
var
  grupo,subgrupo: Real;
  clSubFaixa: TClassSubGruposProdutosFaixas;
begin
  if (Trim(edtFaixa.text)<>'') and (Trim(edtGrupo.text)<>'') and
    (Trim(edtSubGrupo.text)<>'') then
  begin
    grupo      := strtofloat(Trim(edtGrupo.text));
    subgrupo   := strtofloat(Trim(edtSubGrupo.text));
    clSubFaixa := TClassSubGruposProdutosFaixas.Create;
    with (clSubFaixa) do
    begin
      conect ('ESTOQUE',self);
      ClearFields;
      inSF_GRUP:=grupo;
      inSF_SUBG:=subgrupo;
      inSF_TAMA:=Trim(edtFaixa.text);
      Insert;
      desconect;
      Free;
      edtFaixa.text:='';
      edtFaixa.setfocus;
    end;
    RefrescaTabela;
  end;
end;

procedure Tfrm_edtSubGrupos.btnExcluirFaixaClick(Sender: TObject);
var
  grupo,subgrupo,faixa: String;
  clSubFaixa: TClassSubGruposProdutosFaixas;
begin
  if (qFaixas.active) then
  begin
    grupo       := qFaixas.fieldbyname('SF_GRUP').AsString;
    subgrupo    := qFaixas.fieldbyname('SF_SUBG').AsString;
    faixa       := qFaixas.fieldbyname('SF_TAMA').AsString;
    clSubFaixa  := TClassSubGruposProdutosFaixas.Create;
    with (clSubFaixa) do
    begin
      conect ('ESTOQUE',self);
      ClearSql;
      AddParam ('Delete from SUBGRUPOS_FAIXAS ');
      AddParam ('Where (SF_GRUP='+grupo+') AND ');
      AddParam ('      (SF_SUBG='+subgrupo+') AND ');
      AddParam ('      (SF_TAMA='+chr(39)+faixa+chr(39)+') ');
      Execute;
      desconect;
      Free;
    end;
    RefrescaTabela;
  end;
end;

procedure Tfrm_edtSubGrupos.RefrescaTabela;
var
  grupo,subgrupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') and (Trim(edtSubGrupo.text)<>'') then
  begin
    grupo    := strtofloat(Trim(edtGrupo.text));
    subgrupo := strtofloat(Trim(edtSubGrupo.text));
    with (qFaixas) do
    begin
      disablecontrols;
      close;
      parambyname('grupo').AsFloat    := grupo;
      parambyname('subgrupo').AsFloat := subgrupo;
      open;
      enablecontrols;
    end;
  end;
end;

procedure Tfrm_edtSubGrupos.edtSubGrupoExit(Sender: TObject);
var
  clSubGrupos: TClassSubGruposProdutos;
  grupo,subgrupo: String;
begin
  grupo:=Trim(edtGrupo.text);
  subgrupo:=Trim(edtSubGrupo.text);
  if (grupo<>'') and (subgrupo<>'') then
    with (clSubGrupos) do
    begin
      clSubGrupos := TClassSubGruposProdutos.Create;
      conect ('ESTOQUE', self);
      clearSql;
      AddParam ('Select * ');
      AddParam ('From   SUBGRUPOS_PRODUTOS ');
      AddParam ('Where (SG_CODI='+subgrupo+') AND ');
      AddParam ('      (SG_GRUP='+grupo+') ');
      frm_principal.BarraDicas.caption:='Buscando subgrupo...Aguarde!';
      frm_principal.refresh;
      if (not Execute) then
      begin
        frm_principal.BarraDicas.caption:='';
        if (btnCancelainclusao.enabled) then
          HabilitaMenus (false,true,false,true,true,true)
        else
          HabilitaMenus (true,false,false,true,true,true);
        edtDesc.text:='';
        edtUnidade.text:='';
        edtRefInicial.text:='';
        cbParte1.text:='';
        cbParte2.text:='';
        cbParte3.text:='';
        cbParte4.text:='';
        cbParte21.text:='';
        cbParte22.text:='';
        edtFaixa.text:='';
        edtLinha.text:='';
        edtColecao.text:='';
      end
      else
      begin
        frm_principal.BarraDicas.caption:='';
        HabilitaMenus (true,false,true,true,true,true);
        if (Cancelarincluso1.enabled) then
          CodigoInclusao:=0;
        edtDesc.text   := clSubGrupos.Result ('SG_DESC');
        edtUnidade.text := clSubGrupos.Result('SG_UNID');
        edtRefInicial.text := clSubGrupos.Result('SG_REFI');
        edtMin.text    := form_nc(clSubGrupos.Result ('SG_DMIN'),5);
        edtMax.text    := form_nc(clSubGrupos.Result ('SG_DMAX'),5);
        edtMargem.text := form_nc(clSubGrupos.Result ('SG_MARG'),5);
        edtLinha.text  := form_t(clSubGrupos.Result ('SG_LINH'),15);
        edtColecao.text:= form_t(clSubGrupos.Result ('SG_COLE'),15);
        if (clSubGrupos.result('SG_CUNI')='0') then
          chCorUnica.checked := false
        else
        if (clSubGrupos.result('SG_CUNI')='1') then
          chCorUnica.checked := true;
        if (clSubGrupos.result('SG_TUNI')='0') then
          chTamUnico.checked := false
        else
        if (clSubGrupos.result('SG_TUNI')='1') then
          chTamUnico.checked := true;
        antDesc        := Trim(edtDesc.text);
        cbParte1.itemindex:=clSubGrupos.result('SG_PAR1');
        cbParte2.itemindex:=clSubGrupos.result('SG_PAR2');
        cbParte3.itemindex:=clSubGrupos.result('SG_PAR3');
        cbParte4.itemindex:=clSubGrupos.result('SG_PAR4');
        cbParte21.itemindex:=clSubGrupos.result('SG_PA21');
        cbParte22.itemindex:=clSubGrupos.result('SG_PA22');
        edtTamanho.text:=form_nz(clSubGrupos.result('SG_TTAM'),2);
        pnTamanho.caption:=ProcuraNomeTamanho(clSubGrupos.result('SG_TTAM'),self);
        if (clSubGrupos.result('SG_PAR1')=0) then
          cbParte1.text:='Nada'
        else
        if (clSubGrupos.result('SG_PAR1')=1) then
          cbParte1.text:='Grupo'
        else
        if (clSubGrupos.result('SG_PAR1')=2) then
          cbParte1.text:='Subgrupo'
        else
        if (clSubGrupos.result('SG_PAR1')=3) then
          cbParte1.text:='Fornecedor';
        if (clSubGrupos.result('SG_PAR2')=0) then
          cbParte2.text:='Nada'
        else
        if (clSubGrupos.result('SG_PAR2')=1) then
          cbParte2.text:='Grupo'
        else
        if (clSubGrupos.result('SG_PAR2')=2) then
          cbParte2.text:='Subgrupo'
        else
        if (clSubGrupos.result('SG_PAR2')=3) then
          cbParte2.text:='Fornecedor';
        if (clSubGrupos.result('SG_PAR3')=0) then
          cbParte3.text:='Nada'
        else
        if (clSubGrupos.result('SG_PAR3')=1) then
          cbParte3.text:='Grupo'
        else
        if (clSubGrupos.result('SG_PAR3')=2) then
          cbParte3.text:='Subgrupo'
        else
        if (clSubGrupos.result('SG_PAR3')=3) then
          cbParte3.text:='Fornecedor';
        if (clSubGrupos.result('SG_PAR4')=0) then
          cbParte4.text:='Nada'
        else
        if (clSubGrupos.result('SG_PAR4')=1) then
          cbParte4.text:='Grupo'
        else
        if (clSubGrupos.result('SG_PAR4')=2) then
          cbParte4.text:='Subgrupo'
        else
        if (clSubGrupos.result('SG_PAR4')=3) then
          cbParte4.text:='Fornecedor';
        if (clSubGrupos.result('SG_PA21')=0) then
          cbParte21.text:='Nada'
        else
        if (clSubGrupos.result('SG_PA21')=1) then
          cbParte21.text:='Cor'
        else
        if (clSubGrupos.result('SG_PA21')=2) then
          cbParte21.text:='Tamanho';
        if (clSubGrupos.result('SG_PA22')=0) then
          cbParte22.text:='Nada'
        else
        if (clSubGrupos.result('SG_PA22')=1) then
          cbParte22.text:='Cor'
        else
        if (clSubGrupos.result('SG_PA22')=2) then
          cbParte22.text:='Tamanho';
        RefrescaTabela;
      end;
      edtGrupo.text := form_nz (StrToFloat(grupo),3);
      edtSubGrupo.text := form_nz (StrToFloat(subgrupo),3);
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtSubGrupos.edtGrupoExit(Sender: TObject);
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
      conect ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select * ');
      AddParam ('From   GRUPOS_PRODUTOS ');
      AddParam ('Where (GR_CODI='+codigo+')  ');
      if (not Execute) then
        pnGrupo.caption := '<Grupo não cadastrado>'
      else
      begin
        pnGrupo.caption := form_t(clGrupo.result('GR_DESC'),20);
        edtGrupo.text   :=form_nz(strtofloat(codigo),3);
        edtMin.text     := form_nc(clGrupo.Result ('GR_DMIN'),5);
        edtMax.text     := form_nc(clGrupo.Result ('GR_DMAX'),5);
        edtMargem.text  := form_nc(clGrupo.Result ('GR_MARG'),5);
        if (clGrupo.result('GR_CUNI')='0') then
          chCorUnica.checked := false
        else
        if (clGrupo.result('GR_CUNI')='1') then
          chCorUnica.checked := true;
        if (clGrupo.result('GR_TUNI')='0') then
          chTamUnico.checked := false
        else
        if (clGrupo.result('GR_TUNI')='1') then
          chTamUnico.checked := true;
      end;
      desconect;
      Free;
    end;
  end;
end;

procedure Tfrm_edtSubGrupos.FormActivate(Sender: TObject);
begin
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

{Rotina de habilitacao de menus}
procedure Tfrm_edtSubGrupos.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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

procedure Tfrm_edtSubGrupos.LimparEdits;
begin

  edtDesc.text:='';
  pnGrupo.caption:='';
  edtUnidade.text:='';
  edtRefInicial.text:='';
  edtMin.text:='';
  edtMax.text:='';
  edtMargem.text:='';
  edtLinha.text:='';
  edtColecao.text:='';
  chCorUnica.checked:=false;
  chTamUnico.checked:=false;
  cbParte1.text:='';
  cbParte2.text:='';
  cbParte3.text:='';
  cbParte4.text:='';
  cbParte21.text:='';
  cbParte22.text:='';
  edtFaixa.text:='';
  edtTamanho.text:='';
  pnTamanho.caption:='';
end;

procedure Tfrm_edtSubGrupos.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtSubGrupos.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtSubGrupos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    if (frmDialogo.ExibirMensagem ('Confirma saída?'
      ,'Cadastro de subgrupos',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      close;
end;

procedure Tfrm_edtSubGrupos.Cancelarincluso1Click(Sender: TObject);
begin
  qFaixas.close;
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtGrupo.setfocus;
end;

procedure Tfrm_edtSubGrupos.Limparcadastro1Click(Sender: TObject);
begin
  qFaixas.close;
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtGrupo.setfocus;
end;

procedure Tfrm_edtSubGrupos.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtSubGrupos.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtSubGrupos.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtSubGrupos.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtSubGrupos.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtSubGrupos.edtMinExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtSubGrupos.edtMaxExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtSubGrupos.edtMargemExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtSubGrupos.edtMinKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtSubGrupos.edtMaxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtSubGrupos.edtMargemKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtSubGrupos.edtTamanhoEnter(Sender: TObject);
var
  clSub: TClassSubGruposProdutos;
  codigo,codgrupo: String;
begin
  TMaskEdit(sender).selectall;

    {Salvando o cabecalho de cima}
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
  begin
    codgrupo := Trim(edtGrupo.text);
    codigo   := Trim(edtSubGrupo.text);
    if (codigo<>'') then
      with (clSub) do
      begin
        clSub := TClassSubGruposProdutos.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select SG_GRUP,SG_CODI ');
        AddParam ('From   SUBGRUPOS_PRODUTOS ');
        AddParam ('Where  (SG_GRUP='+codgrupo+') AND ');
        AddParam ('       (SG_CODI='+codigo+') ');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SUBGRUPOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inSG_GRUP:=strtofloat(Trim(edtGrupo.text));
            inSG_CODI:=strtofloat(Trim(edtSubGrupo.text));
            inSG_DESC:=Trim(edtDesc.text);
            inSG_REFI:=Trim(edtRefInicial.text);
            inSG_UNID:=Trim(edtUnidade.text);
            if (chCorUnica.checked) then
              inSG_CUNI:='1'
            else
              inSG_CUNI:='0';
            if (chTamUnico.checked) then
              inSG_TUNI:='1'
            else
              inSG_TUNI:='0';
            if (Trim(edtMin.text)<>'') then
              inSG_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)))
            else
              inSG_DMIN:=0.00;
            if (Trim(edtMax.text)<>'') then
              inSG_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)))
            else
              inSG_DMAX:=0.00;
            if (Trim(edtMargem.text)<>'') then
              inSG_MARG:=strtofloat(RetiraFormatacaoNumero(Trim(edtMargem.text)))
            else
              inSG_MARG:=0.00;
            if (Trim(cbParte1.text)='Nada') or (Trim(cbParte1.text)='') then
              inSG_PAR1:=0
            else
            if (Trim(cbParte1.text)='Grupo') then
              inSG_PAR1:=1
            else
            if (Trim(cbParte1.text)='Subgrupo') then
              inSG_PAR1:=2
            else
            if (Trim(cbParte1.text)='Fornecedor') then
              inSG_PAR1:=3;
            if (Trim(cbParte2.text)='Nada') or (Trim(cbParte2.text)='') then
              inSG_PAR2:=0
            else
            if (Trim(cbParte2.text)='Grupo') then
              inSG_PAR2:=1
            else
            if (Trim(cbParte2.text)='Subgrupo') then
              inSG_PAR2:=2
            else
            if (Trim(cbParte2.text)='Fornecedor') then
              inSG_PAR2:=3;
            if (Trim(cbParte3.text)='Nada') or (Trim(cbParte3.text)='') then
              inSG_PAR3:=0
            else
            if (Trim(cbParte3.text)='Grupo') then
              inSG_PAR3:=1
            else
            if (Trim(cbParte3.text)='Subgrupo') then
              inSG_PAR3:=2
            else
            if (Trim(cbParte3.text)='Fornecedor') then
              inSG_PAR3:=3;
            if (Trim(cbParte4.text)='Nada') or (Trim(cbParte4.text)='') then
              inSG_PAR4:=0
            else
            if (Trim(cbParte4.text)='Grupo') then
              inSG_PAR4:=1
            else
            if (Trim(cbParte4.text)='Subgrupo') then
              inSG_PAR4:=2
            else
            if (Trim(cbParte4.text)='Fornecedor') then
              inSG_PAR4:=3;
            if (Trim(cbParte21.text)='Nada') or (Trim(cbParte21.text)='') then
              inSG_PA21:=0
            else
            if (Trim(cbParte21.text)='Cor') then
              inSG_PA21:=1
            else
            if (Trim(cbParte21.text)='Tamanho') then
              inSG_PA21:=2;
            if (Trim(cbParte22.text)='Nada') or (Trim(cbParte22.text)='') then
              inSG_PA22:=0
            else
            if (Trim(cbParte22.text)='Cor') then
              inSG_PA22:=1
            else
            if (Trim(cbParte22.text)='Tamanho') then
              inSG_PA22:=2;
            inSG_LINH:=Trim(edtLinha.text);
            inSG_COLE:=Trim(edtColecao.text);
            if (Trim(edtTamanho.text)<>'') then
              inSG_TTAM:=strtofloat(Trim(edtTamanho.text))
            else
              inSG_TTAM:=0;
            UpdateAll;
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inSG_DESC) then
              with (frm_f8SubGrupos) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_SUBGRUPOS,'A',strtoint(codigo),'','');
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SUBGRUPOS, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inSG_GRUP:=strtofloat(Trim(edtGrupo.text));
          inSG_CODI:=strtofloat(Trim(edtSubGrupo.text));
          inSG_DESC:=Trim(edtDesc.text);
          inSG_REFI:=Trim(edtRefInicial.text);
          inSG_UNID:=Trim(edtUnidade.text);
          if (chCorUnica.checked) then
            inSG_CUNI:='1'
          else
            inSG_CUNI:='0';
          if (chTamUnico.checked) then
            inSG_TUNI:='1'
          else
            inSG_TUNI:='0';
          if (Trim(edtMin.text)<>'') then
            inSG_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)))
          else
            inSG_DMIN:=0.00;
          if (Trim(edtMax.text)<>'') then
            inSG_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)))
          else
            inSG_DMAX:=0.00;
          if (Trim(edtMargem.text)<>'') then
            inSG_MARG:=strtofloat(RetiraFormatacaoNumero(Trim(edtMargem.text)))
          else
            inSG_MARG:=0.00;
          if (Trim(cbParte1.text)='Nada') or (Trim(cbParte1.text)='') then
            inSG_PAR1:=0
          else
          if (Trim(cbParte1.text)='Grupo') then
            inSG_PAR1:=1
          else
          if (Trim(cbParte1.text)='Subgrupo') then
            inSG_PAR1:=2
          else
          if (Trim(cbParte1.text)='Fornecedor') then
            inSG_PAR1:=3;
          if (Trim(cbParte2.text)='Nada') or (Trim(cbParte2.text)='') then
            inSG_PAR2:=0
          else
          if (Trim(cbParte2.text)='Grupo') then
            inSG_PAR2:=1
          else
          if (Trim(cbParte2.text)='Subgrupo') then
            inSG_PAR2:=2
          else
          if (Trim(cbParte2.text)='Fornecedor') then
            inSG_PAR2:=3;
          if (Trim(cbParte3.text)='Nada') or (Trim(cbParte3.text)='') then
            inSG_PAR3:=0
          else
          if (Trim(cbParte3.text)='Grupo') then
            inSG_PAR3:=1
          else
          if (Trim(cbParte3.text)='Subgrupo') then
            inSG_PAR3:=2
          else
          if (Trim(cbParte3.text)='Fornecedor') then
            inSG_PAR3:=3;
          if (Trim(cbParte4.text)='Nada') or (Trim(cbParte4.text)='') then
            inSG_PAR4:=0
          else
          if (Trim(cbParte4.text)='Grupo') then
            inSG_PAR4:=1
          else
          if (Trim(cbParte4.text)='Subgrupo') then
            inSG_PAR4:=2
          else
          if (Trim(cbParte4.text)='Fornecedor') then
            inSG_PAR4:=3;
          if (Trim(cbParte21.text)='Nada') or (Trim(cbParte21.text)='') then
            inSG_PA21:=0
          else
          if (Trim(cbParte21.text)='Cor') then
            inSG_PA21:=1
          else
          if (Trim(cbParte21.text)='Tamanho') then
            inSG_PA21:=2;
          if (Trim(cbParte22.text)='Nada') or (Trim(cbParte22.text)='') then
            inSG_PA22:=0
          else
          if (Trim(cbParte22.text)='Cor') then
            inSG_PA22:=1
          else
          if (Trim(cbParte22.text)='Tamanho') then
            inSG_PA22:=2;
          inSG_LINH:=Trim(edtLinha.text);
          inSG_COLE:=Trim(edtColecao.text);
          if (Trim(edtTamanho.text)<>'') then
            inSG_TTAM:=strtofloat(Trim(edtTamanho.text))
          else
            inSG_TTAM:=0;
          Insert;
          if (CodigoInclusao=inSG_CODI) then
            CodigoInclusao:=0;
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          with (frm_f8SubGrupos) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_SUBGRUPOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
     
end;

procedure Tfrm_edtSubGrupos.edtTamanhoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    cbParte1.setfocus;
  if (key=K_CIMA) then
    edtMargem.setfocus;
  if (key=K_F8) then
    ChamandoF8Tamanhos(edtTamanho,true);
end;

procedure Tfrm_edtSubGrupos.edtTamanhoExit(Sender: TObject);
var
  clFaixa: TClassSubGruposProdutosFaixas;
  clAux: TClassAuxiliar;
  grupo,subgrupo,tamanho,codigo: String;
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
  tamanho  := Trim(edtTamanho.text);
  if (grupo<>'') and (subgrupo<>'') and (tamanho<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select *                       ');
      AddParam ('From SUBGRUPOS_FAIXAS          ');
      AddParam ('Where (SF_GRUP='+grupo+') AND  ');
      AddParam ('      (SF_SUBG='+subgrupo+')   ');
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
          clFaixa:=TClassSubGruposProdutosFaixas.Create;
          clFaixa.conect('ESTOQUE',self);
          clFaixa.ClearFields;
          clFaixa.inSF_GRUP:=strtofloat(grupo);
          clFaixa.inSF_SUBG:=strtofloat(subgrupo);
          clFaixa.inSF_TAMA:=Trim(result('TF_TAMA'));
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

procedure Tfrm_edtSubGrupos.edtLinhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtColecao.setfocus;
  if (key=K_CIMA) then
    edtMax.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Linha qualquer caractere (até 15 caracteres) ',5);
end;

procedure Tfrm_edtSubGrupos.edtColecaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtMargem.setfocus;
  if (key=K_CIMA) then
    edtlinha.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Colecao: qualquer caractere (até 15 caracteres) ',5);
end;

procedure Tfrm_edtSubGrupos.edtColecaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtLinhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtMat1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtMat2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.edtMat3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtSubGrupos.Salvar1Click(Sender: TObject);
var
  clSub: TClassSubGruposProdutos;
  codigo,codgrupo: String;
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
  begin
    codgrupo := Trim(edtGrupo.text);
    codigo   := Trim(edtSubGrupo.text);
    if (codigo<>'') then
      with (clSub) do
      begin
        clSub := TClassSubGruposProdutos.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select SG_GRUP,SG_CODI ');
        AddParam ('From   SUBGRUPOS_PRODUTOS ');
        AddParam ('Where  (SG_GRUP='+codgrupo+') AND ');
        AddParam ('       (SG_CODI='+codigo+') ');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SUBGRUPOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inSG_GRUP:=strtofloat(Trim(edtGrupo.text));
            inSG_CODI:=strtofloat(Trim(edtSubGrupo.text));
            inSG_DESC:=Trim(edtDesc.text);
            inSG_REFI:=Trim(edtRefInicial.text);
            inSG_UNID:=Trim(edtUnidade.text);
            if (chCorUnica.checked) then
              inSG_CUNI:='1'
            else
              inSG_CUNI:='0';
            if (chTamUnico.checked) then
              inSG_TUNI:='1'
            else
              inSG_TUNI:='0';
            if (Trim(edtMin.text)<>'') then
              inSG_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)))
            else
              inSG_DMIN:=0.00;
            if (Trim(edtMax.text)<>'') then
              inSG_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)))
            else
              inSG_DMAX:=0.00;
            if (Trim(edtMargem.text)<>'') then
              inSG_MARG:=strtofloat(RetiraFormatacaoNumero(Trim(edtMargem.text)))
            else
              inSG_MARG:=0.00;
            if (Trim(cbParte1.text)='Nada') or (Trim(cbParte1.text)='') then
              inSG_PAR1:=0
            else
            if (Trim(cbParte1.text)='Grupo') then
              inSG_PAR1:=1
            else
            if (Trim(cbParte1.text)='Subgrupo') then
              inSG_PAR1:=2
            else
            if (Trim(cbParte1.text)='Fornecedor') then
              inSG_PAR1:=3;
            if (Trim(cbParte2.text)='Nada') or (Trim(cbParte2.text)='') then
              inSG_PAR2:=0
            else
            if (Trim(cbParte2.text)='Grupo') then
              inSG_PAR2:=1
            else
            if (Trim(cbParte2.text)='Subgrupo') then
              inSG_PAR2:=2
            else
            if (Trim(cbParte2.text)='Fornecedor') then
              inSG_PAR2:=3;
            if (Trim(cbParte3.text)='Nada') or (Trim(cbParte3.text)='') then
              inSG_PAR3:=0
            else
            if (Trim(cbParte3.text)='Grupo') then
              inSG_PAR3:=1
            else
            if (Trim(cbParte3.text)='Subgrupo') then
              inSG_PAR3:=2
            else
            if (Trim(cbParte3.text)='Fornecedor') then
              inSG_PAR3:=3;
            if (Trim(cbParte4.text)='Nada') or (Trim(cbParte4.text)='') then
              inSG_PAR4:=0
            else
            if (Trim(cbParte4.text)='Grupo') then
              inSG_PAR4:=1
            else
            if (Trim(cbParte4.text)='Subgrupo') then
              inSG_PAR4:=2
            else
            if (Trim(cbParte4.text)='Fornecedor') then
              inSG_PAR4:=3;
            if (Trim(cbParte21.text)='Nada') or (Trim(cbParte21.text)='') then
              inSG_PA21:=0
            else
            if (Trim(cbParte21.text)='Cor') then
              inSG_PA21:=1
            else
            if (Trim(cbParte21.text)='Tamanho') then
              inSG_PA21:=2;
            if (Trim(cbParte22.text)='Nada') or (Trim(cbParte22.text)='') then
              inSG_PA22:=0
            else
            if (Trim(cbParte22.text)='Cor') then
              inSG_PA22:=1
            else
            if (Trim(cbParte22.text)='Tamanho') then
              inSG_PA22:=2;
            inSG_LINH:=Trim(edtLinha.text);
            inSG_COLE:=Trim(edtColecao.text);
            if (Trim(edtTamanho.text)<>'') then
              inSG_TTAM:=strtofloat(Trim(edtTamanho.text))
            else
              inSG_TTAM:=0;
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inSG_DESC) then
              with (frm_f8SubGrupos) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_SUBGRUPOS,'A',strtoint(codigo),'','');
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
          inSG_GRUP:=strtofloat(Trim(edtGrupo.text));
          inSG_CODI:=strtofloat(Trim(edtSubGrupo.text));
          inSG_DESC:=Trim(edtDesc.text);
          inSG_REFI:=Trim(edtRefInicial.text);
          inSG_UNID:=Trim(edtUnidade.text);
          if (chCorUnica.checked) then
            inSG_CUNI:='1'
          else
            inSG_CUNI:='0';
          if (chTamUnico.checked) then
            inSG_TUNI:='1'
          else
            inSG_TUNI:='0';
          if (Trim(edtMin.text)<>'') then
            inSG_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)))
          else
            inSG_DMIN:=0.00;
          if (Trim(edtMax.text)<>'') then
            inSG_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)))
          else
            inSG_DMAX:=0.00;
          if (Trim(edtMargem.text)<>'') then
            inSG_MARG:=strtofloat(RetiraFormatacaoNumero(Trim(edtMargem.text)))
          else
            inSG_MARG:=0.00;
          if (Trim(cbParte1.text)='Nada') or (Trim(cbParte1.text)='') then
            inSG_PAR1:=0
          else
          if (Trim(cbParte1.text)='Grupo') then
            inSG_PAR1:=1
          else
          if (Trim(cbParte1.text)='Subgrupo') then
            inSG_PAR1:=2
          else
          if (Trim(cbParte1.text)='Fornecedor') then
            inSG_PAR1:=3;
          if (Trim(cbParte2.text)='Nada') or (Trim(cbParte2.text)='') then
            inSG_PAR2:=0
          else
          if (Trim(cbParte2.text)='Grupo') then
            inSG_PAR2:=1
          else
          if (Trim(cbParte2.text)='Subgrupo') then
            inSG_PAR2:=2
          else
          if (Trim(cbParte2.text)='Fornecedor') then
            inSG_PAR2:=3;
          if (Trim(cbParte3.text)='Nada') or (Trim(cbParte3.text)='') then
            inSG_PAR3:=0
          else
          if (Trim(cbParte3.text)='Grupo') then
            inSG_PAR3:=1
          else
          if (Trim(cbParte3.text)='Subgrupo') then
            inSG_PAR3:=2
          else
          if (Trim(cbParte3.text)='Fornecedor') then
            inSG_PAR3:=3;
          if (Trim(cbParte4.text)='Nada') or (Trim(cbParte4.text)='') then
            inSG_PAR4:=0
          else
          if (Trim(cbParte4.text)='Grupo') then
            inSG_PAR4:=1
          else
          if (Trim(cbParte4.text)='Subgrupo') then
            inSG_PAR4:=2
          else
          if (Trim(cbParte4.text)='Fornecedor') then
            inSG_PAR4:=3;
          if (Trim(cbParte21.text)='Nada') or (Trim(cbParte21.text)='') then
            inSG_PA21:=0
          else
          if (Trim(cbParte21.text)='Cor') then
            inSG_PA21:=1
          else
          if (Trim(cbParte21.text)='Tamanho') then
            inSG_PA21:=2;
          if (Trim(cbParte22.text)='Nada') or (Trim(cbParte22.text)='') then
            inSG_PA22:=0
          else
          if (Trim(cbParte22.text)='Cor') then
            inSG_PA22:=1
          else
          if (Trim(cbParte22.text)='Tamanho') then
            inSG_PA22:=2;
          inSG_LINH:=Trim(edtLinha.text);
          inSG_COLE:=Trim(edtColecao.text);
          if (Trim(edtTamanho.text)<>'') then
            inSG_TTAM:=strtofloat(Trim(edtTamanho.text))
          else
            inSG_TTAM:=0;
          Insert;
          if (CodigoInclusao=inSG_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8SubGrupos) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_SUBGRUPOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtSubGrupos.Excluirplano1Click(Sender: TObject);
var
  clSub: TClassSubGruposProdutos;
  codigo,codgrupo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SUBGRUPOS, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codgrupo := Trim(edtGrupo.text);
    codigo   := Trim(edtSubGrupo.text);
    if (codigo<>'') and (codgrupo<>'') and (Trim(edtDesc.text)<>'') then
      with (clSub) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do subgrupo?'
          ,'Exclusão do subgrupo',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clSub := TClassSubGruposProdutos.Create;
          conect ('ESTOQUE', self);
          ClearSql;
          AddParam ('Delete from SUBGRUPOS_PRODUTOS ');
          AddParam ('Where  (SG_GRUP='+codgrupo+') AND ');
          AddParam ('       (SG_CODI='+codigo+') ');
          Execute;
          ClearSql;
          AddParam ('Delete from SUBGRUPOS_FAIXAS ');
          AddParam ('Where  (SF_GRUP='+codgrupo+') AND ');
          AddParam ('       (SF_SUBG='+codigo+') ');
          Execute;
          desconect;
          Free;
          with (frm_f8SubGrupos) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtSubGrupo.text:='';
          edtSubGrupo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_SUBGRUPOS,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Subgrupo excluído com sucesso...',5);
        end
        else
          edtGrupo.setfocus;
  end;
end;

procedure Tfrm_edtSubGrupos.cbParte1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    cbParte2.setfocus;
end;

procedure Tfrm_edtSubGrupos.cbParte2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    cbParte3.setfocus;
end;

procedure Tfrm_edtSubGrupos.cbParte3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    cbParte4.setfocus;
end;

procedure Tfrm_edtSubGrupos.cbParte4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    cbParte21.setfocus;
end;

procedure Tfrm_edtSubGrupos.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_INSERT) then
    edtFaixa.setfocus;   
  if (key=K_DELETE) then
    btnExcluirFaixa.click;
end;

procedure Tfrm_edtSubGrupos.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_SUBGRUPOS, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    LimparEdits;
    edtGrupo.setfocus;
  end;
end;

procedure Tfrm_edtSubGrupos.cbParte21KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    cbParte22.setfocus;
end;

procedure Tfrm_edtSubGrupos.cbParte22KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSalvar.click;
end;

procedure Tfrm_edtSubGrupos.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  totsubg: Integer;
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
    AddParam ('From   SUBGRUPOS_PRODUTOS  ');
    AddParam ('Order by SG_GRUP,SG_CODI   ');
    frm_principal.BarraDicas.caption:='Buscando cadastro de subgrupos...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_arq_impressao := 'c04.rel';
    frm_principal.x_comando       := '15c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE SUBGRUPOS DE PRODUTOS';

        {cabecalhos}
    AddLine(form_tc('-',132,'-'));
    AddLine('    |   |                         |Desc. |Desc. |Margem |Cor  |Tam  |               |               |Cod');
    AddLine('Grup|Cod|Descricao                |Min % |Max % |Contrib|Unica|Unico|Linha          |Colecao        |Tam');
    AddLine(form_tc('-',132,'-'));
    totsubg:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      if (clAux.result('SG_CUNI')='0') then
        flag_cor:='  Nao'
      else
      if (clAux.result('SG_CUNI')='1') then
        flag_cor:='  Sim';
      if (clAux.result('SG_TUNI')='0') then
        flag_tam:='  Nao'
      else
      if (clAux.result('SG_TUNI')='1') then
        flag_tam:='  Sim';
      AddLine(form_nz (clAux.Result('SG_GRUP'),3) +' '+
        form_nz (clAux.Result('SG_CODI'),3) +' '+
        form_t  (clAux.Result('SG_DESC'),26)+' '+
        form_nc (clAux.Result('SG_DMIN'),6) +' '+
        form_nc (clAux.Result('SG_DMAX'),6) +' '+
        form_nc (clAux.Result('SG_MARG'),7) +' '+
        flag_cor+' '+
        flag_tam+' '+
        form_t  (clAux.Result('SG_LINH'),15)+' '+
        form_t  (clAux.Result('SG_COLE'),15)+' '+
        form_nz (clAux.Result('SG_TTAM'),2));
      totsubg := totsubg + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total de subgrupos  ---> '+form_nz (totsubg,4));
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

procedure Tfrm_edtSubGrupos.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_edtSubGrupos.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_edtSubGrupos.edtTamanhoDblClick(Sender: TObject);
begin
  ChamandoF8Tamanhos(edtTamanho,true);
end;


end.
