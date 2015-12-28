{[MOVIMENTO]}
unit un_Transf_Lancamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, Mask, Db,
  DBTables, Gauges, LabelOO;

type
  Tfrm_Transf_Lancamento = class(TForm)
    gbItem_ProdCorTam: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    edtCor: TMaskEdit;
    pnCor: TPanel;
    edtFaixaTam: TMaskEdit;
    pnProduto: TPanel;
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparcadastro1: TMenuItem;
    Processarentradas1: TMenuItem;
    SAIR1: TMenuItem;
    ds1: TDataSource;
    tblTransf: TTable;
    tblTransfcCor: TStringField;
    tblTransfcTam: TStringField;
    grade: TDBGrid;
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
    Label9: TLabel;
    Label12: TLabel;
    N4: TMenuItem;
    gbItem_CBarra: TPanel;
    Label16: TLabel;
    edtCBarra: TMaskEdit;
    pnDescItem2: TPanel;
    tblTransfcREFI: TStringField;
    tblTransfcDescricao: TStringField;
    tblTransfcGrupo: TStringField;
    tblTransfcSubgrupo: TStringField;
    tblTransfcCodigo: TStringField;
    tblTransfcREFF: TStringField;
    pnLocal3: TPanel;
    Label22: TLabel;
    edtRefFab: TMaskEdit;
    lblMensDel: TLabel;
    lblDel: TLabel;
    edtForn: TMaskEdit;
    Label13: TLabel;
    Panel5: TPanel;
    Label8: TLabel;
    Label23: TLabel;
    botao_sair: TPanel;
    Novoproduto1: TMenuItem;
    tblTransfGRUPO: TIntegerField;
    tblTransfSUBGRUPO: TIntegerField;
    tblTransfPRODUTO: TFloatField;
    tblTransfLOJA: TIntegerField;
    tblTransfCOR: TIntegerField;
    tblTransfTAMANHO: TStringField;
    tblTransfQTDE: TFloatField;
    tblTransfDATA: TDateField;
    tblTransfMODE: TStringField;
    tblTransfTIPZ: TStringField;
    Panel1: TPanel;
    Label4: TLabel;
    edtQtde: TMaskEdit;
    botao2: TPanel;
    tblTransfSALDOANT: TIntegerField;
    tblTransfcSaldo1: TStringField;
    lbleituracbarra: TLabelOO;
    qTransf: TQuery;
    Mudarformadeleituradocdigodebarras1: TMenuItem;
    Label3: TLabel;
    LabelOO1: TLabelOO;
    tblTransfSEQ: TIntegerField;
    Panel2: TPanel;
    LabelOO2: TLabelOO;
    pnQtdeTotal: TPanel;
    btnExcluir: TSpeedButton;
    btnExcluirTodos: TSpeedButton;
    N1: TMenuItem;
    btnAumentaQtde: TSpeedButton;
    btnDiminuiQtde: TSpeedButton;
    btnSalvar: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    tblTransfCBARRA1: TStringField;
    LabelOO3: TLabelOO;
    procedure edtCorChange(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure tblTransfCalcFields(DataSet: TDataSet);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Processarentradas1Click(Sender: TObject);
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
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCBarraEnter(Sender: TObject);
    procedure edtCBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCBarraExit(Sender: TObject);
    procedure edtRefIntDblClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtRefIntExit(Sender: TObject);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtRefIntChange(Sender: TObject);
    procedure edtRefFabChange(Sender: TObject);
    procedure edtRefFabEnter(Sender: TObject);
    procedure edtRefFabExit(Sender: TObject);
    procedure edtRefFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure gradeEnter(Sender: TObject);
    procedure gradeExit(Sender: TObject);
    procedure edtFornChange(Sender: TObject);
    procedure edtFornDblClick(Sender: TObject);
    procedure edtFornEnter(Sender: TObject);
    procedure edtFornExit(Sender: TObject);
    procedure edtFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefFabDblClick(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure edtCBarraDblClick(Sender: TObject);
    procedure edtQtdeEnter(Sender: TObject);
    procedure Novoproduto1Click(Sender: TObject);
    procedure Mudarformadeleituradocdigodebarras1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblTransfAfterOpen(DataSet: TDataSet);
    procedure tblTransfAfterClose(DataSet: TDataSet);
    procedure btnDiminuiQtdeClick(Sender: TObject);
    procedure btnAumentaQtdeClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnExcluirTodosClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoInclusao : Integer;
    exibiu: Boolean;
    n_ordem_ctrf7: Integer;
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    n_refi: String;
    n_reffab: String;
    n_forn: Real;
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor � unica ou n�o}
    n_ordem_f7: Integer;
    n_cbarra: String;
    ModoOperando: String;   {ENTRADAS / SAIDA}

    procedure LocalizarProduto;
    procedure FocusControle1(controle: TWinControl; direcao: Boolean);
    procedure FocusControle2(controle: TWinControl; direcao: Boolean);
    procedure LimparEdits;
    function EstaNaLista(grupo,subgrupo,produto,loja,
      cor: Real; tam: String):Boolean;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure MudaFocoCodigo;
    procedure MudaFocoCodigoItem;
    procedure RefrescaTabela;
    procedure AdicionaObservacao (codigo_movimento: Real; obs: String);
  end;

var
  frm_Transf_Lancamento: Tfrm_Transf_Lancamento;

implementation

uses principal, funcoes1, funcoes2, procura, auxiliar,
  unDialogo, DM4, produtos, DM6, unMensagem, venda, DM16,
  mem_prnt, un_ConsultaProdutos, DM8, DM2, un_ValeMercadoriaFunc_Vale,
  un_Transf_Lancamento_Salvar, Un_ConsProdutosEstoque;

{$R *.DFM}

procedure Tfrm_Transf_Lancamento.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_Transf_Lancamento.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
end;

procedure Tfrm_Transf_Lancamento.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_Transf_Lancamento.edtCorExit(Sender: TObject);
var
  codigo: String;
  Claux : TClassAuxiliar;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
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
        frmDialogo.ExibirMensagem ('Cor n�o existente para este produto!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtCor.SetFocus;
        ClAux.Desconect;
        ClAux.Free;
      end
      else
      begin
        pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
        edtCor.text:=form_nz(strtofloat(codigo),4);
        ClAux.Desconect;
        ClAux.Free;
      end;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;


procedure Tfrm_Transf_Lancamento.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  if (key=38) or (key=K_ESC) then
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
  if (key=K_F2) then
    if (tblTransf.active) then
      grade.setfocus;
end;

procedure Tfrm_Transf_Lancamento.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_Transf_Lancamento.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_Transf_Lancamento.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe faixas de tamanho do produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_Transf_Lancamento.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtQtde.setfocus;
  if (key=38) or (key=K_ESC) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F2) then
    if (tblTransf.active) then
      grade.setfocus;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_Transf_Lancamento.edtQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botao2Click(Sender);
  if (key=38) or (key=K_ESC) then
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

procedure Tfrm_Transf_Lancamento.FocusControle1(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  gbItem_ProdCorTam.GetTabOrderList(Lista);
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


procedure Tfrm_Transf_Lancamento.FocusControle2(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  Panel1.GetTabOrderList(Lista);
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

procedure Tfrm_Transf_Lancamento.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_Transf_Lancamento.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Lancamento.FormActivate(Sender: TObject);
begin
  if (not exibiu) then
  begin
    if (ModoOperando='SAIDA') then
      caption := 'Lan�amento de itens para transfer�ncia - SAIDAS'
    else
    if (ModoOperando='ENTRADA') then
      caption := 'Lan�amento de itens para transfer�ncia - ENTRADAS';
          {********************************************************************************}
    if (not tblTransf.active) then
      tblTransf.active;
    while (not tblTransf.eof) do
      tblTransf.delete;
          {********************************************************************************}
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
      lbleituracbarra.caption := '>leitura manual da qtde.'
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
      lbleituracbarra.caption := '>leitura direta';
          {********************************************************************************}

    exibiu:=true;
  end;
  if (not tblTransf.active) then
    tblTransf.open;
  if (gbItem_ProdCorTam.visible) then
    FocaCodigoLocal1
  else
  if (gbItem_CBarra.visible) then
    edtCBarra.setfocus;

  if (Frm_ConsProdutosEstoque <> nil) and Frm_ConsProdutosEstoque.QEstoque.Active then
  begin
    edtRefInt.text    := Frm_ConsProdutosEstoque.edtRefInt.text;
    edtRefFab.text    := Frm_ConsProdutosEstoque.edtRefFab.text;
    edtForn.text      := Frm_ConsProdutosEstoque.edtForn.text;
    edtGrupo.text     := Frm_ConsProdutosEstoque.edtGrupo.text;
    edtSubgrupo.text  := Frm_ConsProdutosEstoque.edtSubgrupo.text;
    edtCodigo.text    := Frm_ConsProdutosEstoque.edtCodigo.text;
    edtCor.text       := Frm_ConsProdutosEstoque.QEstoque.fieldbyname('EL_CORE').AsString;
    edtFaixaTam.text  := Frm_ConsProdutosEstoque.QEstoque.fieldbyname('EL_TAMA').AsString;
    edtCBarra.text    := Frm_ConsProdutosEstoque.QEstoque.fieldbyname('ES_CBAR').AsString;
  end;


end;

procedure Tfrm_Transf_Lancamento.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    if (gbItem_ProdCorTam.visible) then
    begin
      if (edtFaixaTam.enabled) then
        edtFaixaTam.setfocus
      else
      if (edtCor.enabled) then
        edtCor.setfocus
      else
        FocaCodigoLocal1;
    end
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus;
end;

procedure Tfrm_Transf_Lancamento.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  gbItem_ProdCorTam.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  Panel1.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  gbItem_Cbarra.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  gbItem_ProdCorTam.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  botao_sair.caption := 'SAIR';
  botao2.caption     := 'Adicionar ao lote';
  Lista.Free;
end;

procedure Tfrm_Transf_Lancamento.Limparcadastro1Click(Sender: TObject);
begin
  habilitaeditVerde(edtCor);
  habilitaeditVerde(edtFaixaTam);
  LimparEdits;
  if (gbItem_ProdCorTam.visible) then
    FocaCodigoLocal1
  else
  if (gbItem_CBarra.visible) then
    edtCBarra.setfocus;
end;

procedure Tfrm_Transf_Lancamento.tblTransfCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (tblTransf) do
  begin
    if (fieldbyname('cGrupo').IsNull) then
      fieldbyname('cGrupo').AsString:=
        form_nz(fieldbyname('GRUPO').AsFloat,2);
    if (fieldbyname('cSubGrupo').IsNull) then
      fieldbyname('cSubGrupo').AsString:=
        form_nz(fieldbyname('SUBGRUPO').AsFloat,2);
    if (fieldbyname('cCodigo').IsNull) then
      fieldbyname('cCodigo').AsString:=
        form_nz(fieldbyname('PRODUTO').AsFloat,4);
    if (fieldbyname('cSaldo1').IsNull) then
      fieldbyname('cSaldo1').AsString:=
        form_n(fieldbyname('SALDOANT').AsFloat,5);
    if (fieldbyname('cCor').IsNull) then
      if (fieldbyname('COR').AsFloat=0) then
        fieldbyname('cCor').AsString:='UNICA'
      else
        fieldbyname('cCor').AsString:=
          fieldbyname('COR').AsString+'/'+
          ProcuraAbrevCor(fieldbyname('COR').AsFloat,self);
    if (fieldbyname('cTam').IsNull) then
      if (fieldbyname('TAMANHO').AsString='0') then
        fieldbyname('cTam').AsString:='UNICO'
      else
        fieldbyname('cTam').AsString:=fieldbyname('TAMANHO').AsString;

          {... - Buscando a ref. interna}
    if (fieldbyname('cREFI').IsNull) and (State<>(dsEdit)) and (State<>(dsInsert)) then
    begin
      clAux:=TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('Select PR_REFI,PR_DESC,PR_REFF                           ');
      clAux.AddParam ('From PRODUTOS                                            ');
      clAux.AddParam ('Where (PR_GRUP='+fieldbyname('GRUPO').AsString+') AND    ');
      clAux.AddParam ('      (PR_SUBG='+fieldbyname('SUBGRUPO').AsString+') AND ');
      clAux.AddParam ('      (PR_CODI='+fieldbyname('PRODUTO').AsString+')      ');
      if (clAux.Execute) then
      begin
        fieldbyname('cREFI').AsString := Trim(clAux.result('PR_REFI'));
        fieldbyname('cREFF').AsString := Trim(clAux.result('PR_REFF'));
        fieldbyname('cDescricao').AsString := Trim(clAux.result('PR_DESC'));
      end
      else
      begin
        fieldbyname('cREFI').AsString := '?';
        fieldbyname('cREFF').AsString := '?';
        fieldbyname('cDescricao').AsString := '?';
      end;
      clAux.desconect;
      clAux.Free;
    end;
  end;
end;

procedure Tfrm_Transf_Lancamento.edtFaixaTamExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  faixa: String;
begin
     {Critica dos dados}
  if (Trim(edtFaixaTam.text)<>'') then
    with (clAux) do
    begin
      faixa := Trim(edtFaixaTam.text);
      clAux := TClassAuxiliar.Create;
      conect (databaseprodutos,self);
      ClearSql;
      AddParam ('Select PF_TAMA                                  ');
      AddParam ('From PRODUTOS_FAIXAS                            ');
      AddParam ('Where (PF_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (PF_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (PF_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (PF_TAMA='+chr(39)+faixa+chr(39)+')       ');
      if (not Execute) then
      begin
        if (gbItem_ProdCorTam.visible) then
        begin
          frmDialogo.ExibirMensagem (' Faixa n�o permitida para o produto! '
            ,'Vendas',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtFaixaTam.setfocus;
        end;
      end
      else
        n_cbarra := RetornaCodigoDeBarrasDoItem(n_grupo,n_subgrupo,n_produto,n_cor,n_tam);

      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_Transf_Lancamento.FormCreate(Sender: TObject);
begin
  exibiu:=false;
  n_produto:=0;
  n_loja:=0;
  n_cor:=-1;
  n_tam:='-1';
  Label4.caption:='Qtde ';
  RefrescaTabela;

     {* Posicionado o codigo de barra e outros}
  n_ordem_ctrf7 :=1;
  gbItem_ProdCorTam.visible := false;
  gbItem_CBarra.visible     := false;
  if (frm_principal.x_ordem_cbarra=1) then
    gbItem_CBarra.visible     := true
  else
  if (frm_principal.x_ordem_prod_cor_tam=1) then
    gbItem_ProdCorTam.visible := true;

     {* Posicionando a forma de localizacao do produto *}
  pnLocal1.visible := false;
  pnLocal1.left    := 37;
  pnLocal2.visible := false;
  pnLocal2.left    := 37;
  pnLocal3.visible := false;
  pnLocal3.left    := 37;
  grade.columns[0].visible:=false;
  grade.columns[1].visible:=false;
  grade.columns[2].visible:=false;
  grade.columns[3].visible:=false;
  grade.columns[4].visible:=false;
  n_ordem_f7 :=1;
  if (frm_principal.x_ordem_codigo=1) then
  begin
    pnLocal1.visible := true;
    grade.columns[0].visible:=true;
    grade.columns[1].visible:=true;
    grade.columns[2].visible:=true;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
  begin
    pnLocal2.visible := true;
    grade.columns[3].visible:=true;
  end
  else
  if (frm_principal.x_ordem_reffabric=1) then
  begin
    pnLocal3.visible := true;
    grade.columns[4].visible:=true;
  end;
end;

function Tfrm_Transf_Lancamento.EstaNaLista(grupo,subgrupo,produto,loja,
  cor: Real; tam: String):Boolean;
var
  flag: Boolean;
begin
  tblTransf.disablecontrols;
  tblTransf.first;
  flag:=false;
  while (not tblTransf.eof) do
  begin
    if (tblTransf.fieldbyname('GRUPO').AsFloat=grupo) and
      (tblTransf.fieldbyname('SUBGRUPO').AsFloat=subgrupo) and
      (tblTransf.fieldbyname('PRODUTO').AsFloat=produto) and
      (tblTransf.fieldbyname('LOJA').AsFloat=loja) and
      (tblTransf.fieldbyname('COR').AsFloat=cor) and
      (tblTransf.fieldbyname('TAMANHO').AsString=tam) then
    begin
      flag:=true;
      break;
    end;
    tblTransf.next;
  end;
  tblTransf.enablecontrols;
  EstaNaLista:=flag;
end;

procedure Tfrm_Transf_Lancamento.Processarentradas1Click(Sender: TObject);
var
  clAux,clSeq: TClassAuxiliar;
  indGauge,totGauge: Integer;
  flagObs: Integer;
  codigofornecedor: Real;
  seqmov1,preco_venda,preco_custo: Real;
  ordemtamanho: Integer;
  continua: Boolean;
  obs: String;
begin
  if (tblTransf.active) then
    if (tblTransf.recordcount<>0) then
    begin
      frmDialogo.posativ:=1;
      if (frmDialogo.ExibirMensagem ('Deseja Salvar Transfer�ncia?'
        ,'Vendas',[mbYes,mbNo],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        Application.CreateForm(Tfrm_Transf_Lancamento_Salvar, frm_Transf_Lancamento_Salvar);
        
        frm_Transf_Lancamento_Salvar.ModoOperando := ModoOperando;
        frm_Transf_Lancamento_Salvar.showmodal;
        if (frm_Transf_Lancamento_Salvar.resultado=13) then
        begin
                        {************************************************************}
          tblTransf.disablecontrols;
          mostra_mensagem('Processando transfer�ncia...Aguarde!');
          frm_mensagem.painel.visible:=true;
          frm_mensagem.gauge1.progress:=0;
          indGauge:=0;
          totGauge:=tblTransf.recordcount;

                        {************************************************************}
          tblTransf.first;
          while (not tblTransf.eof) do
          begin
            ordemtamanho := InformaOrdemTamanho(tblTransf.fieldbyname('GRUPO').AsFloat,tblTransf.fieldbyname('SUBGRUPO').AsFloat,tblTransf.fieldbyname('PRODUTO').AsFloat,tblTransf.fieldbyname('TAMANHO').AsString);

                             {************************************************************}
            clAux := TClassAuxiliar.Create;
            clAux.conect   (databaseprodutos,self);
            clAux.ClearSql;
            clAux.AddParam ('INSERT INTO ITENS_TRANSF_LOJA(IT_LOJ1,IT_TRAN,IT_GRUP,IT_SUBG,IT_PROD,IT_CORE,IT_OTAM,IT_TAMA,IT_QTDE,IT_QTDS,IT_MOV1,IT_MOV2,IT_DIGI,IT_EMBA,IT_CHEG,IT_TIPZ,IT_STAT,IT_MOV3,IT_MOV4,IT_QTAE,IT_QTAS,IT_ACER,IT_SEQ,IT_HORA)     ');
            clAux.AddParam ('VALUES(:IT_LOJ1,:IT_TRAN,:IT_GRUP,:IT_SUBG,:IT_PROD,:IT_CORE,:IT_OTAM,:IT_TAMA,:IT_QTDE,:IT_QTDS,:IT_MOV1,:IT_MOV2,:IT_DIGI,:IT_EMBA,:IT_CHEG,:IT_TIPZ,:IT_STAT,:IT_MOV3,:IT_MOV4,:IT_QTAE,:IT_QTAS,:IT_ACER,:IT_SEQ,:IT_HORA)     ');
            clAux.consulta.parambyname('IT_LOJ1').AsFloat   := frm_Transf_Lancamento_Salvar.y_lojaOrigem;
            clAux.consulta.parambyname('IT_TRAN').AsFloat   := frm_Transf_Lancamento_Salvar.y_documento;
            clAux.consulta.parambyname('IT_GRUP').AsFloat   := tblTransf.fieldbyname('GRUPO').AsFloat;
            clAux.consulta.parambyname('IT_SUBG').AsFloat   := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
            clAux.consulta.parambyname('IT_PROD').AsFloat   := tblTransf.fieldbyname('PRODUTO').AsFloat;
            clAux.consulta.parambyname('IT_CORE').AsFloat   := tblTransf.fieldbyname('COR').AsFloat;
            clAux.consulta.parambyname('IT_OTAM').AsInteger := ordemtamanho;
            clAux.consulta.parambyname('IT_TAMA').AsString  := tblTransf.fieldbyname('TAMANHO').AsString;
            if (frm_Transf_Lancamento_Salvar.y_opcao=0) then //SAIDA
            begin
              clAux.consulta.parambyname('IT_QTDE').AsFloat := 0;
              clAux.consulta.parambyname('IT_QTDS').AsFloat := tblTransf.fieldbyname('QTDE').AsFloat;
            end
            else
            if (frm_Transf_Lancamento_Salvar.y_opcao=1) then //ENTRADA
            begin
              clAux.consulta.parambyname('IT_QTDE').AsFloat := tblTransf.fieldbyname('QTDE').AsFloat;
              clAux.consulta.parambyname('IT_QTDS').AsFloat := 0;
            end;
            clAux.consulta.parambyname('IT_DIGI').AsDateTime := frm_principal.x_data_trabalho;
            if (frm_Transf_Lancamento_Salvar.y_opcao=0) then //SAIDA
              clAux.consulta.parambyname('IT_EMBA').AsDateTime := frm_principal.x_data_trabalho
            else
              clAux.consulta.parambyname('IT_EMBA').AsDateTime := strtodate('01/01/1900');
            if (frm_Transf_Lancamento_Salvar.y_opcao=1) then //ENTRADA
              clAux.consulta.parambyname('IT_CHEG').AsDateTime := frm_principal.x_data_trabalho
            else
              clAux.consulta.parambyname('IT_CHEG').AsDateTime := strtodate('01/01/1900');
            if (frm_Transf_Lancamento_Salvar.y_opcao=0) then
              clAux.consulta.parambyname('IT_STAT').AsString   := '1' //embarcado
            else
            if (frm_Transf_Lancamento_Salvar.y_opcao=1) then
              clAux.consulta.parambyname('IT_STAT').AsString   := '2'; //chegado
            clAux.consulta.parambyname('IT_TIPZ').AsString   := '1'; //nao usado
            clAux.consulta.parambyname('IT_QTAE').AsFloat  := 0;
            clAux.consulta.parambyname('IT_QTAS').AsFloat  := 0;
            clAux.consulta.parambyname('IT_MOV3').AsFloat  := 0;
            clAux.consulta.parambyname('IT_MOV4').AsFloat  := 0;
            clAux.consulta.parambyname('IT_ACER').AsString := '0';
            clAux.consulta.parambyname('IT_SEQ').AsInteger := tblTransf.fieldbyname('SEQ').AsInteger;
            clAux.consulta.parambyname('IT_HORA').AsDatetime := Now;
                             {************************************************************}

                             {...}
            if (frm_principal.x_online) then
            begin
              if (ModoOperando='SAIDA') then
              begin
                seqmov1 := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));

                preco_venda      := DevolvePrecoItem(frm_Transf_Lancamento_Salvar.y_lojaOrigem,tblTransf.fieldbyname('GRUPO').AsFloat,tblTransf.fieldbyname('SUBGRUPO').AsFloat,tblTransf.fieldbyname('PRODUTO').AsFloat,tblTransf.fieldbyname('COR').AsFloat,tblTransf.fieldbyname('TAMANHO').AsString,'1');
                preco_custo      := InformaUltimoPrecoCusto(tblTransf.fieldbyname('GRUPO').AsFloat,tblTransf.fieldbyname('SUBGRUPO').AsFloat,tblTransf.fieldbyname('PRODUTO').AsFloat,tblTransf.fieldbyname('COR').AsFloat,tblTransf.fieldbyname('TAMANHO').AsString,'1');
                codigofornecedor := BuscaFornecedor(tblTransf.fieldbyname('GRUPO').AsFloat,tblTransf.fieldbyname('SUBGRUPO').AsFloat,tblTransf.fieldbyname('PRODUTO').AsFloat);

                DMcaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := seqmov1;
                DMcaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := tblTransf.fieldbyname('PRODUTO').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := tblTransf.fieldbyname('COR').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := tblTransf.fieldbyname('TAMANHO').AsString;
                DMcaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := ordemtamanho;
                DMcaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := preco_custo;
                DMcaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := preco_venda;
                DMcaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := frm_Transf_Lancamento_Salvar.y_lojaOrigem;
                DMcaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
                DMcaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
                DMcaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'S'; {saida}
                DMcaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'F'; {transferencia}
                DMcaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
                DMcaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := floattostr(frm_Transf_Lancamento_Salvar.y_documento);
                DMcaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := codigofornecedor;
                DMcaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := tblTransf.fieldbyname('QTDE').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := (-1)*tblTransf.fieldbyname('QTDE').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := '1';
                DMcaixa.qInsereMovimento.parambyname('MO_CLIE').AsString   := '';
                DMcaixa.qInsereMovimento.ExecSql;
                                       //****************************************************************************
                VerificaExistenciaDoRegistroESTOQUE_LOJA(tblTransf.fieldbyname('GRUPO').AsFloat,tblTransf.fieldbyname('SUBGRUPO').AsFloat,tblTransf.fieldbyname('PRODUTO').AsFloat,tblTransf.fieldbyname('COR').AsFloat,tblTransf.fieldbyname('TAMANHO').AsString,frm_Transf_Lancamento_Salvar.y_lojaOrigem);
                                       //****************************************************************************
                SaidaItemEstoque (frm_Transf_Lancamento_Salvar.y_lojaOrigem,'1',
                  tblTransf.fieldbyname('GRUPO').AsFloat,tblTransf.fieldbyname('SUBGRUPO').AsFloat,tblTransf.fieldbyname('PRODUTO').AsFloat,
                  tblTransf.fieldbyname('COR').AsFloat,tblTransf.fieldbyname('TAMANHO').AsString,
                  tblTransf.fieldbyname('QTDE').AsFloat);
                                       //****************************************************************************
                clAux.consulta.parambyname('IT_MOV1').AsFloat    := seqmov1;
                clAux.consulta.parambyname('IT_MOV2').AsFloat    := 0;
              end;
            end
            else
            begin
              clAux.consulta.parambyname('IT_MOV1').AsFloat    := 0;
              clAux.consulta.parambyname('IT_MOV2').AsFloat    := 0;
            end;
            clAux.Execute; {***}
            clAux.desconect;
            clAux.Free;

                             {...}
            tblTransf.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
                        {************************************************************}

                        //... INSERINDO O CABECALHO DA TRANSFERENCIA
          clAux := TClassAuxiliar.Create;
          clAux.conect   (databaseprodutos,self);
          clAux.ClearSql;
          clAux.AddParam ('INSERT INTO TRANSF_LOJA(TR_LOJ1,TR_NUME,TR_LOJ2,TR_DATA,TR_TIPZ,TR_ONLI,TR_ENVI,TR_STAT)    ');
          clAux.AddParam ('VALUES (:TR_LOJ1,:TR_NUME,:TR_LOJ2,:TR_DATA,:TR_TIPZ,:TR_ONLI,:TR_ENVI,:TR_STAT)            ');
          clAux.consulta.parambyname('TR_LOJ1').AsFloat    := frm_Transf_Lancamento_Salvar.y_lojaOrigem;
          clAux.consulta.parambyname('TR_NUME').AsFloat    := frm_Transf_Lancamento_Salvar.y_documento;
          clAux.consulta.parambyname('TR_LOJ2').AsFloat    := frm_Transf_Lancamento_Salvar.y_lojadestino;
          clAux.consulta.parambyname('TR_DATA').AsDateTime := frm_principal.x_data_trabalho;
          clAux.consulta.parambyname('TR_TIPZ').AsString   := frm_Transf_Lancamento_Salvar.tipz;
          if (databaseprodutos='ESTOQUE') then
          begin
            clAux.consulta.parambyname('TR_ONLI').AsString   := '1';
            clAux.consulta.parambyname('TR_ENVI').AsString   := '1';
          end
          else
          begin
            clAux.consulta.parambyname('TR_ONLI').AsString   := '0';
            clAux.consulta.parambyname('TR_ENVI').AsString   := '0';
          end;
          if (frm_Transf_Lancamento_Salvar.y_opcao=0) then
            clAux.consulta.parambyname('TR_STAT').AsString   := '1' //SAIDA
          else
          if (frm_Transf_Lancamento_Salvar.y_opcao=1) then
            clAux.consulta.parambyname('TR_STAT').AsString   := '2'; //ENTRADA
          clAux.Execute;
          clAux.desconect;
          clAux.Free;

                        {************************************************************}
          tblTransf.first;
          while (not tblTransf.eof) do
            tblTransf.delete;
          tblTransf.enablecontrols;

          pnQtdeTotal.tag     := 0;
          pnQtdeTotal.caption := '0';

          esconde_mensagem;

                        {************************************************************}
          if (frm_principal.x_slip_na_tela_TRANSFERENCIA) then
            continua:=true
          else
          if (frmDialogo.ExibirMensagem ('Deseja imprimir SLIP?'
            ,'Transfer�ncias',[mbYes,mbNo]
            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            continua:=true
          else
            continua:=false;
          if (continua) then
            ImprimeSlipTransferencia(frm_Transf_Lancamento_Salvar.y_lojaOrigem,
              frm_Transf_Lancamento_Salvar.y_documento);

                        {************************************************************}
          Limparcadastro1.click;
        end;
        frm_Transf_Lancamento_Salvar.Free;
      end;
    end;
end;

procedure Tfrm_Transf_Lancamento.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_Transf_Lancamento.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_Transf_Lancamento.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_ESC) then
    close;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' C�digo do grupo do produto: Formato: 99; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_Transf_Lancamento.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_Transf_Lancamento.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_Transf_Lancamento.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo: Real;
begin
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodigo.setfocus;
  if (key=K_CIMA) or (key=K_ESC) then
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
    frm_principal.ExibirDica (' C�digo do subgrupo do produto: Formato: 99; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
end;

procedure Tfrm_Transf_Lancamento.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_Transf_Lancamento.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_Transf_Lancamento.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo,subgrupo: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtCodigoExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  end;
  if (key=K_CIMA) or (key=K_ESC) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo    := Trim(edtGrupo.text);
      subgrupo := Trim(edtSubGrupo.text);
      ChamandoF8Produtos_2(edtCodigo,strtofloat(grupo),strtofloat(subgrupo),true);
    end;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' C�digo do produto: Formato: 9999',5);
end;

{Controle de foco do produto ***}
procedure Tfrm_Transf_Lancamento.FocaCodigoLocal2;
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

{Controle de foco do produto ***}
procedure Tfrm_Transf_Lancamento.FocaCodigoLocal1;
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

procedure Tfrm_Transf_Lancamento.MudaFocoCodigo;
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

procedure Tfrm_Transf_Lancamento.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_Lancamento.edtRefIntKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtRefIntExit(Sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  end;
  if (key=K_ESC) then
    close;
  if (key=K_F8) then
    LocalizarProduto;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
  if (key=K_ESC) or (key=38) then
  ;
end;

procedure Tfrm_Transf_Lancamento.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_Transf_Lancamento.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_Transf_Lancamento.edtCodigoDblClick(Sender: TObject);
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


procedure Tfrm_Transf_Lancamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F9) then
    Processarentradas1.click;
  if (shift=[ssCtrl]) then
  begin
    if (key=K_F7) then
      MudaFocoCodigoItem;
    if (key=K_DELETE) then
      if (btnExcluirTodos.enabled) then
        btnExcluirTodos.click;
  end
  else
  if (key=K_DELETE) then
    if (btnExcluir.enabled) then
      btnExcluir.click;
end;

procedure Tfrm_Transf_Lancamento.MudaFocoCodigoItem;
begin
  gbItem_CBarra.visible     := false;
  gbItem_ProdCorTam.visible := false;
  n_ordem_ctrf7 := n_ordem_ctrf7 + 1;
  if (n_ordem_ctrf7=3) then
    n_ordem_ctrf7:=1
  else
  if (n_ordem_ctrf7=0) then
    n_ordem_ctrf7:=2;
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

procedure Tfrm_Transf_Lancamento.edtCBarraEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_Lancamento.edtCBarraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtCBarraExit(Sender);
    edtQtde.setfocus;
  end;
  if (key=K_F8) then
    LocalizarProduto;
  if (key=K_ESC) then
    close;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
end;

procedure Tfrm_Transf_Lancamento.edtCBarraExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cbarra: String;
begin
  cbarra := ReformataCodigoBarras(Trim(edtCBarra.text));
  if (cbarra<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      clearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,               ');
      AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,       ');
      AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_REFF        ');
      AddParam ('From   ESTOQUE,PRODUTOS                               ');
      AddParam ('Where (ES_CBAR='+chr(39)+cbarra+chr(39)+') AND        ');
      AddParam ('      (ES_GRUP=PR_GRUP) AND                           ');
      AddParam ('      (ES_SUBG=PR_SUBG) AND                           ');
      AddParam ('      (ES_PROD=PR_CODI)                               ');
      frm_principal.BarraDicas.caption:='Buscando item de produto...Aguarde!';
      frm_principal.refresh;
      if (Execute) then
      begin
        pnProduto.caption   := result('PR_DESC');
        pnDescItem2.caption := result('ES_DESC');
        n_grupo    := result('ES_GRUP');
        n_subgrupo := result('ES_SUBG');
        n_produto  := result('ES_PROD');
        n_cor      := result('ES_CORE');
        n_tam      := result('ES_TAMA');
        n_cbarra   := result('ES_CBAR');
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
        edtRefInt.text   := Trim(result('PR_REFI'));
        edtReffab.text   := Trim(result('PR_REFF'));
        edtGrupo.text    := form_nz (n_grupo,2);
        edtSubGrupo.text := form_nz (n_subgrupo,2);
        edtCodigo.text   := form_nz (n_produto,4);
        edtCor.text      := form_nz (n_cor,4);
        pnCor.caption    := ProcuraNomeCor(n_cor,self);
        edtFaixaTam.text := n_tam;
        edtCBarra.Text   := n_cbarra;
      end
      else
      begin
        pnProduto.caption   := '<Produto n�o encontrado>';
        pnDescItem2.caption := '<Item de produto n�o encontrado>';
        edtGrupo.text    := '';
        edtSubGrupo.text := '';
        edtCodigo.text   := '';
        edtCor.text      := '';
        pnCor.caption    := '';
        edtFaixaTam.text := '';
        edtRefInt.text   := '';
        edtReffab.text   := '';
      end;
      frm_principal.BarraDicas.caption:='';
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        edtCor.text:='0';
        desabilitaeditVerde(edtCor);
        pnCor.caption:='Cor �nica';
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_Transf_Lancamento.edtRefIntDblClick(Sender: TObject);
begin
  LocalizarProduto;
end;

procedure Tfrm_Transf_Lancamento.edtCodigoExit(Sender: TObject);
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
      conect (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_UNID,       ');
      AddParam ('       PR_REFF,PR_REFI,PR_FORN                ');
      AddParam ('From   PRODUTOS                               ');
      AddParam ('Where (PR_SUBG='+subgrupo+') AND              ');
      AddParam ('      (PR_GRUP='+grupo+') AND                 ');
      AddParam ('      (PR_CODI='+codigo+')                    ');
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

                {*** sugerindo a ref. interna/ref. fabricante}
        edtRefInt.text  := Trim(Result('PR_REFI'));
        edtRefFab.text  := Trim(Result('PR_REFF'));
        edtForn.text    := form_nz(Result('PR_FORN'),6);
      end
      else
      begin
        edtRefInt.text  := '';
        edtRefFab.text  := '';
        edtForn.text    := '';
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
        pnCor.caption:='Cor �nica';
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_Transf_Lancamento.edtRefIntExit(Sender: TObject);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  refinterna := Trim(edtRefInt.text);
  if (refinterna<>'') then
    with (clProd) do
    begin
      clProd := TClassProdutos.Create;
      conect (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,PR_SUBG,    ');
      AddParam ('       PR_CODI,PR_UNID,PR_REFI,PR_REFF,PR_FORN     ');
      AddParam ('From   PRODUTOS                                    ');
      AddParam ('Where (PR_REFI='+chr(39)+refinterna+chr(39)+')     ');
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

                {*** sugerindo a ref. fabricante}
        edtRefFab.text  := Trim(Result('PR_REFF'));
        edtForn.text    := form_nz(Result('PR_FORN'),6);
      end
      else
      begin
        edtRefFab.text  := '';
        edtForn.text    := '';
        pnProduto.caption:='<Produto nao encontrado>';
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
        pnCor.caption:='Cor �nica';
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_Transf_Lancamento.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
    grade.Canvas.font.color:=clNavy;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_Transf_Lancamento.RefrescaTabela;
begin
  tblTransf.close;
  tblTransf.open;
end;

procedure Tfrm_Transf_Lancamento.edtRefIntChange(Sender: TObject);
begin
  if (Trim(edtRefInt.text)<>'') then
    n_refi := Trim(edtRefInt.text)
  else
    n_refi := '0';
end;

procedure Tfrm_Transf_Lancamento.edtRefFabChange(Sender: TObject);
begin
  if (Trim(edtRefFab.text)<>'') then
    n_reffab := Trim(edtRefFab.text)
  else
    n_reffab := '0';
end;

procedure Tfrm_Transf_Lancamento.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_Lancamento.edtRefFabExit(Sender: TObject);
var
  clProd: TClassProdutos;
  codigoforn,reffabric: String;
begin
  codigoforn := Trim(edtForn.text);
  reffabric  := Trim(edtRefFab.text);
  if (reffabric<>'') then
    with (clProd) do
    begin
      clProd := TClassProdutos.Create;
      conect   (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,PR_SUBG,   ');
      AddParam ('       PR_CODI,PR_UNID,PR_REFI,PR_REFF            ');
      AddParam ('From   PRODUTOS                                   ');
      AddParam ('Where (PR_FORN='+codigoforn+') AND                ');
      AddParam ('      (PR_REFF='+chr(39)+reffabric+chr(39)+')     ');
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
        edtRefInt.text  := Trim(Result('PR_REFI'));
      end
      else
      begin
        edtRefInt.text  := '';
        pnProduto.caption:='<Produto nao encontrado>';
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
        pnCor.caption:='Cor �nica';
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_Transf_Lancamento.edtRefFabKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtRefFabExit(sender);
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  end;
  if (key=K_CIMA) then
    edtForn.setfocus;
  if (key=K_F8) then
    LocalizarProduto;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. do fabricante do produto: at� 15 caracteres',5);
  if (key=K_ESC) or (key=38) then
end;

procedure Tfrm_Transf_Lancamento.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_Transf_Lancamento.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_Transf_Lancamento.gradeEnter(Sender: TObject);
begin
  lblDel.visible:=true;
  lblMensDel.visible:=true;
end;

procedure Tfrm_Transf_Lancamento.gradeExit(Sender: TObject);
begin
  lblDel.visible:=false;
  lblMensDel.visible:=false;
end;

procedure Tfrm_Transf_Lancamento.edtFornChange(Sender: TObject);
begin
  if (Trim(edtForn.text)<>'') then
    n_forn := strtofloat(Trim(edtForn.text))
  else
    n_forn := 0;
end;

procedure Tfrm_Transf_Lancamento.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,true);
end;

procedure Tfrm_Transf_Lancamento.edtFornEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_Lancamento.edtFornExit(Sender: TObject);
begin
  if (n_forn<>0) then
    edtForn.text := form_nz(n_forn,6);
end;

procedure Tfrm_Transf_Lancamento.edtFornKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRefFab.setfocus;
  if (key=K_ESC) then
    close;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn,true);
  if (key=K_ESC) or (key=38) then
  ;
end;

procedure Tfrm_Transf_Lancamento.edtRefFabDblClick(Sender: TObject);
begin
  LocalizarProduto;
end;

procedure Tfrm_Transf_Lancamento.AdicionaObservacao (codigo_movimento: Real; obs: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO MOVIMENTO_OBSERVACAO (MB_MOVI,MB_TEXT) ');
  clAux.AddParam ('VALUES (:MB_MOVI,:MB_TEXT) ');
  clAux.consulta.parambyname('MB_MOVI').AsFloat := codigo_movimento;
  clAux.consulta.parambyname('MB_TEXT').AsString := obs;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_Transf_Lancamento.botao2Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  fazpergunta,adicionaqtde,continua: Boolean;
  novaqtde: Real;
begin
  continua:=true;
  if (gbItem_ProdCorTam.visible) then
  begin
    if (n_grupo=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Grupo n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtGrupo.setfocus;
      continua:=false;
    end
    else
    if (n_subgrupo=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Subgrupo n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtSubGrupo.setfocus;
      continua:=false;
    end
    else
    if (n_produto=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' C�digo do produto n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCodigo.setfocus;
      continua:=false;
    end
    else
    if (trim(edtRefInt.text)='')  and (pnLocal2.visible) then
    begin
      frmDialogo.ExibirMensagem (' Ref. Interna n�o pode ficar vazia! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtRefInt.setfocus;
      continua:=false;
    end
    else
    if (trim(edtForn.text)='')  and (pnLocal3.visible) then
    begin
      frmDialogo.ExibirMensagem (' Fornecedor n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtForn.setfocus;
      continua:=false;
    end
    else
    if (trim(edtRefFab.text)='')  and (pnLocal3.visible) then
    begin
      frmDialogo.ExibirMensagem (' Ref. Fabric. n�o pode ficar vazia! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtRefFab.setfocus;
      continua:=false;
    end
    else
    if (n_cor=-1) then
    begin
      frmDialogo.ExibirMensagem (' Cor n�o pode ficar vazia! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCor.setfocus;
      continua:=false;
    end
    else
    if (n_tam='-1') then
    begin
      frmDialogo.ExibirMensagem (' Tamanho n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtFaixaTam.setfocus;
      continua:=false;
    end
    else
    if (edtQtde.text='') then
    begin
      frmDialogo.ExibirMensagem (' Qtde 01 n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtQtde.setfocus;
      continua:=false;
    end;
  end
  else
  if (gbItem_CBarra.visible) then
    if (Trim(edtCBarra.text)='') then
    begin
      frmDialogo.ExibirMensagem (' O c�digo de barras n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCBarra.setfocus;
      continua:=false;
    end
    else
    if (Trim(pnDescItem2.caption)='<Item de produto n�o encontrado>') then
    begin
      frmDialogo.ExibirMensagem (' O item de produto n�o est� cadastrado ou n�o existe! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCBarra.setfocus;
      continua:=false;
    end
    else
    if (edtQtde.text='') then
    begin
      frmDialogo.ExibirMensagem (' Qtde 01 n�o pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtQtde.setfocus;
      continua:=false;
    end;

     {...}
  if (continua) then
  begin
          {************************************************************************}
    clAux := TClassAuxiliar.Create;
    clAux.conect    (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam  ('SELECT ES_CBAR                                  ');
    clAux.AddParam  ('FROM   ESTOQUE                                  ');
    clAux.AddParam  ('WHERE (ES_GRUP='+floattostr(n_grupo)+') AND     ');
    clAux.AddParam  ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND  ');
    clAux.AddParam  ('      (ES_PROD='+floattostr(n_produto)+') AND   ');
    clAux.AddParam  ('      (ES_CORE='+floattostr(n_cor)+') AND       ');
    clAux.AddParam  ('      (ES_TAMA='+chr(39)+n_tam+chr(39)+')       ');
    mostra_mensagem ('Buscando item...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    if (not clAux.Execute) then
    begin
      esconde_mensagem;
      frmDialogo.ExibirMensagem ('Item n�o cadastrado!'
        ,'Vendas',[mbOk],
        frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    end
    else
    begin
      esconde_mensagem;

              {...}
      qTransf.close;
      qTransf.sql.clear;
      qTransf.sql.Add ('SELECT QTDE FROM TEMP_TRANSF.DBF        ');
      qTransf.sql.Add ('WHERE (GRUPO=:grupo) AND                ');
      qTransf.sql.Add ('      (SUBGRUPO=:subgrupo) AND          ');
      qTransf.sql.Add ('      (PRODUTO=:produto) AND            ');
      qTransf.sql.Add ('      (COR=:cor) AND                    ');
      qTransf.sql.Add ('      (TAMANHO=:tamanho)                ');
      qTransf.parambyname('grupo').AsFloat    := n_grupo;
      qTransf.parambyname('subgrupo').AsFloat := n_subgrupo;
      qTransf.parambyname('produto').AsFloat  := n_produto;
      qTransf.parambyname('cor').AsFloat      := n_cor;
      qTransf.parambyname('tamanho').AsString := n_tam;
      qTransf.open;
      if (qTransf.recordcount<>0) then
      begin
                   {*****************************************************************************************************************}
        if (gbItem_CBarra.visible) then
        begin
          if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
            fazpergunta := false
          else
            fazpergunta := true;
        end
        else
          fazpergunta := true;
                   {*****************************************************************************************************************}
        if (fazpergunta) then
        begin
          frmDialogo.posativ:=1;
          if (frmDialogo.ExibirMensagem ('Adicionar ao saldo j� lan�ado?'
            ,'Vendas',[mbYes,mbNo],
            frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            adicionaqtde := true
          else
            adicionaqtde := false;
        end
        else
          adicionaqtde := true;
                   {*****************************************************************************************************************}
        if (adicionaqtde) then
        begin
          novaqtde := qTransf.fieldbyname('QTDE').AsFloat;
          if (Trim(edtQtde.text)<>'') then
          begin
            novaqtde := novaqtde + strtofloat(RetiraFormatacaoNumero(Trim(edtQtde.text)));
            pnQtdeTotal.tag := pnQtdeTotal.tag + strtoint(RetiraFormatacaoNumero(Trim(edtQtde.text)));
          end;
        end
        else
        begin
          if (Trim(edtQtde.text)<>'') then
          begin
            novaqtde := strtofloat(RetiraFormatacaoNumero(Trim(edtQtde.text)));
            pnQtdeTotal.tag := pnQtdeTotal.tag + trunc(novaqtde - qTransf.fieldbyname('QTDE').AsFloat);
          end
          else
            novaqtde := 0;
        end;
                   {*****************************************************************************************************************}
        qTransf.close;
        qTransf.sql.clear;
        qTransf.sql.Add ('UPDATE TEMP_TRANSF.DBF                  ');
        qTransf.sql.Add ('SET    QTDE=:novaqtde                   ');
        qTransf.sql.Add ('WHERE (GRUPO=:grupo) AND                ');
        qTransf.sql.Add ('      (SUBGRUPO=:subgrupo) AND          ');
        qTransf.sql.Add ('      (PRODUTO=:produto) AND            ');
        qTransf.sql.Add ('      (COR=:cor) AND                    ');
        qTransf.sql.Add ('      (TAMANHO=:tamanho)                ');
        qTransf.parambyname('grupo').AsFloat    := n_grupo;
        qTransf.parambyname('subgrupo').AsFloat := n_subgrupo;
        qTransf.parambyname('produto').AsFloat  := n_produto;
        qTransf.parambyname('cor').AsFloat      := n_cor;
        qTransf.parambyname('tamanho').AsString := n_tam;
        qTransf.parambyname('novaqtde').AsFloat := novaqtde;
        qTransf.ExecSql;
                   {*****************************************************************************************************************}
        RefrescaTabela;
        Limparcadastro1.click
      end
      else
      begin
                  {inserindo item na lista}
                  {*****************************************************************************************************************}
        tblTransf.open;
        tblTransf.append;
        tblTransf.fieldbyname('GRUPO').AsFloat     := n_grupo;
        tblTransf.fieldbyname('SUBGRUPO').AsFloat  := n_subgrupo;
        tblTransf.fieldbyname('PRODUTO').AsFloat   := n_produto;
        tblTransf.fieldbyname('LOJA').AsFloat      := n_loja;
        tblTransf.fieldbyname('COR').AsFloat       := n_cor;
        tblTransf.fieldbyname('TAMANHO').AsString  := n_tam;
        if (Trim(edtQtde.text)<>'') then
          tblTransf.fieldbyname('QTDE').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtQtde.text)))
        else
          tblTransf.fieldbyname('QTDE').AsFloat := 0;
        tblTransf.fieldbyname('SALDOANT').AsFloat  := 0.00;
        tblTransf.fieldbyname('DATA').AsDateTime   := frm_principal.x_data_trabalho;
        tblTransf.fieldbyname('MODE').AsString     := 'F'; {transferencia}
        tblTransf.fieldbyname('TIPZ').AsString     := '1';
        tblTransf.fieldbyname('SEQ').AsInteger     := tblTransf.recordcount+1;
        tblTransf.FieldByName('CBARRA1').AsString  := n_cbarra;  //Trim(edtCBarra.Text);
                  {*****************************************************************************************************************}
        pnQtdeTotal.tag := pnQtdeTotal.tag + strtoint(RetiraFormatacaoNumero(Trim(edtQtde.text)));
                  {*****************************************************************************************************************}
        tblTransf.post;
        RefrescaTabela;
        Limparcadastro1.click
      end;

              //exibindo o totalizador
      pnQtdeTotal.caption := inttostr(pnQtdeTotal.tag);
    end;
  end;
end;

procedure Tfrm_Transf_Lancamento.LocalizarProduto;
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
  frm_ConsultaProduto.y_RotinaChamadora:=2;
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
//              edtCorExit(self);
//              edtFaixaTamExit(self);
//      edtCBarra.setfocus; {***}
    end
    else
      Limparcadastro1.click;
  frm_ConsultaProduto.Free;
end;

procedure Tfrm_Transf_Lancamento.edtCBarraDblClick(Sender: TObject);
begin
  LocalizarProduto;
end;

procedure Tfrm_Transf_Lancamento.edtQtdeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
     //************************************************************
  if (gbItem_CBarra.visible) then
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      edtQtde.text := '1';
      if (pnDescItem2.caption<>'<Item de produto n�o encontrado>') then
        botao2Click(botao2);
    end;
     //************************************************************
end;

procedure Tfrm_Transf_Lancamento.Novoproduto1Click(Sender: TObject);
begin
  Limparcadastro1.click;
end;

procedure Tfrm_Transf_Lancamento.Mudarformadeleituradocdigodebarras1Click(
  Sender: TObject);
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
    Novoproduto1.click;
    edtCBarra.setfocus;
  end;
     {********************************************************************************}
end;

procedure Tfrm_Transf_Lancamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (not tblTransf.active) then
    tblTransf.active;
  while (not tblTransf.eof) do
    tblTransf.delete;
end;

procedure Tfrm_Transf_Lancamento.tblTransfAfterOpen(DataSet: TDataSet);
begin
  if (tblTransf.recordcount<>0) then
  begin
    btnExcluir.enabled      := true;
    btnExcluirTodos.enabled := true;
    btnDiminuiQtde.enabled  := true;
    btnAumentaQtde.enabled  := true;
  end
  else
  begin
    btnExcluir.enabled      := false;
    btnExcluirTodos.enabled := false;
    btnDiminuiQtde.enabled  := false;
    btnAumentaQtde.enabled  := false;
  end;
end;

procedure Tfrm_Transf_Lancamento.tblTransfAfterClose(DataSet: TDataSet);
begin
  btnExcluir.enabled      := false;
  btnExcluirTodos.enabled := false;
  btnDiminuiQtde.enabled  := false;
  btnAumentaQtde.enabled  := false;
end;

procedure Tfrm_Transf_Lancamento.btnDiminuiQtdeClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  book: TBookmark;
begin
  if (tblTransf.active) then
    if (tblTransf.recordcount<>0) then
      if (tblTransf.fieldbyname('QTDE').AsFloat>1) then
      begin
        book := tblTransf.GetBookmark;
        tblTransf.disablecontrols;

        clAux := TClassAuxiliar.Create;
        clAux.conect   ('C:\NATIVA\VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('UPDATE TEMP_TRANSF.DBF                  ');
        clAux.AddParam ('SET    QTDE = QTDE - 1                  ');
        clAux.AddParam ('WHERE (GRUPO=:grupo) AND                ');
        clAux.AddParam ('      (SUBGRUPO=:subgrupo) AND          ');
        clAux.AddParam ('      (PRODUTO=:produto) AND            ');
        clAux.AddParam ('      (COR=:cor) AND                    ');
        clAux.AddParam ('      (TAMANHO=:tamanho)                ');
        clAux.consulta.parambyname('grupo').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
        clAux.consulta.parambyname('subgrupo').AsFloat := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
        clAux.consulta.parambyname('produto').AsFloat  := tblTransf.fieldbyname('PRODUTO').AsFloat;
        clAux.consulta.parambyname('cor').AsFloat      := tblTransf.fieldbyname('COR').AsFloat;
        clAux.consulta.parambyname('tamanho').AsString := tblTransf.fieldbyname('TAMANHO').AsString;
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

        if (pnQtdeTotal.tag>0) then
        begin
          pnQtdeTotal.tag := pnQtdeTotal.tag - 1;
          pnQtdeTotal.caption := inttostr(pnQtdeTotal.tag);
        end;

        tblTransf.close;
        tblTransf.open;

        tblTransf.Gotobookmark(book);
        tblTransf.Freebookmark(book);
        tblTransf.enablecontrols;

        grade.setfocus;
      end;
end;

procedure Tfrm_Transf_Lancamento.btnAumentaQtdeClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  book: TBookMark;
begin
  if (tblTransf.active) then
    if (tblTransf.recordcount<>0) then
    begin
      book := tblTransf.GetBookMark;
      tblTransf.disablecontrols;

      clAux := TClassAuxiliar.Create;
      clAux.conect   ('C:\NATIVA\VENDAS',self);
      clAux.ClearSql;
      clAux.AddParam ('UPDATE TEMP_TRANSF.DBF                  ');
      clAux.AddParam ('SET    QTDE = QTDE + 1                  ');
      clAux.AddParam ('WHERE (GRUPO=:grupo) AND                ');
      clAux.AddParam ('      (SUBGRUPO=:subgrupo) AND          ');
      clAux.AddParam ('      (PRODUTO=:produto) AND            ');
      clAux.AddParam ('      (COR=:cor) AND                    ');
      clAux.AddParam ('      (TAMANHO=:tamanho)                ');
      clAux.consulta.parambyname('grupo').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
      clAux.consulta.parambyname('subgrupo').AsFloat := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
      clAux.consulta.parambyname('produto').AsFloat  := tblTransf.fieldbyname('PRODUTO').AsFloat;
      clAux.consulta.parambyname('cor').AsFloat      := tblTransf.fieldbyname('COR').AsFloat;
      clAux.consulta.parambyname('tamanho').AsString := tblTransf.fieldbyname('TAMANHO').AsString;
      clAux.Execute; {*}
      clAux.desconect;
      clAux.Free;

      if (pnQtdeTotal.tag>0) then
      begin
        pnQtdeTotal.tag := pnQtdeTotal.tag + 1;
        pnQtdeTotal.caption := inttostr(pnQtdeTotal.tag);
      end;

      tblTransf.close;
      tblTransf.open;

      tblTransf.Gotobookmark(book);
      tblTransf.Freebookmark(book);
      tblTransf.enablecontrols;

      grade.setfocus;
    end;
end;

procedure Tfrm_Transf_Lancamento.btnExcluirClick(Sender: TObject);
var
  seqAnt: Integer;
  clAux: TClassAuxiliar;
begin
  if (tblTransf.active) then
    if (tblTransf.recordcount<>0) then
    begin
      frmDialogo.posativ:=2;
      if (frmDialogo.ExibirMensagem ('Confirma exclus�o da refer�ncia?'
        ,'Transfer�ncias',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        tblTransf.disablecontrols;
        tblTransf.next;
        if (not tblTransf.eof) then
        begin
          seqAnt := tblTransf.fieldbyname('SEQ').AsInteger;
          tblTransf.prior;
        end
        else
          seqAnt := -1;

        clAux := TClassAuxiliar.Create;
        clAux.conect   ('C:\NATIVA\VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('DELETE FROM TEMP_TRANSF.DBF             ');
        clAux.AddParam ('WHERE (GRUPO=:grupo) AND                ');
        clAux.AddParam ('      (SUBGRUPO=:subgrupo) AND          ');
        clAux.AddParam ('      (PRODUTO=:produto) AND            ');
        clAux.AddParam ('      (COR=:cor) AND                    ');
        clAux.AddParam ('      (TAMANHO=:tamanho)                ');
        clAux.consulta.parambyname('grupo').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
        clAux.consulta.parambyname('subgrupo').AsFloat := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
        clAux.consulta.parambyname('produto').AsFloat  := tblTransf.fieldbyname('PRODUTO').AsFloat;
        clAux.consulta.parambyname('cor').AsFloat      := tblTransf.fieldbyname('COR').AsFloat;
        clAux.consulta.parambyname('tamanho').AsString := tblTransf.fieldbyname('TAMANHO').AsString;
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

        if (pnQtdeTotal.tag>0) then
        begin
          pnQtdeTotal.tag := pnQtdeTotal.tag - trunc(tblTransf.fieldbyname('QTDE').AsFloat);
          pnQtdeTotal.caption := inttostr(pnQtdeTotal.tag);
        end;

        tblTransf.close;
        tblTransf.open;
        tblTransf.first;
        while (not tblTransf.eof) do
        begin
          if (seqAnt=tblTransf.fieldbyname('SEQ').AsInteger) then
            break;
          tblTransf.next;
        end;

        tblTransf.enablecontrols;
        grade.setfocus;
      end;
    end;
end;

procedure Tfrm_Transf_Lancamento.btnExcluirTodosClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (tblTransf.active) then
    if (tblTransf.recordcount<>0) then
    begin
      frmDialogo.posativ:=2;
      if (frmDialogo.ExibirMensagem ('Confirma exclus�o de todo o lote?'
        ,'Transfer�ncias',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('C:\NATIVA\VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('DELETE FROM TEMP_TRANSF.DBF             ');
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

        pnQtdeTotal.tag     := 0;
        pnQtdeTotal.caption := '0';

        tblTransf.close;
        tblTransf.open;
        grade.setfocus;
      end;
    end;
end;

procedure Tfrm_Transf_Lancamento.btnSalvarClick(Sender: TObject);
begin
  Processarentradas1.click;
end;

end.