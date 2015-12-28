{[MOVIMENTO]}
unit un_OutrasSaidas2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, Mask, Db,
  DBTables, Gauges;

type
  Tfrm_OutrasSaidas2 = class(TForm)
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
    tblSaidas: TTable;
    tblSaidasGRUPO: TSmallintField;
    tblSaidasSUBGRUPO: TSmallintField;
    tblSaidasPRODUTO: TFloatField;
    tblSaidasCOR: TSmallintField;
    tblSaidasTAMANHO: TStringField;
    tblSaidasDATA: TDateField;
    tblSaidascCor: TStringField;
    tblSaidascTam: TStringField;
    tblSaidasLOJA: TSmallintField;
    tblSaidascPVenda1: TStringField;
    grade: TDBGrid;
    tblSaidasMODE: TStringField;
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
    tblSaidascTotal1: TStringField;
    Label9: TLabel;
    Label12: TLabel;
    tblSaidasQTDE: TFloatField;
    tblSaidasTIPZ: TStringField;
    tblSaidasPVENDA: TFloatField;
    tblSaidasTOTAL: TFloatField;
    N4: TMenuItem;
    gbItem_CBarra: TPanel;
    Label16: TLabel;
    edtCBarra: TMaskEdit;
    pnDescItem2: TPanel;
    tblSaidascREFI: TStringField;
    tblSaidascDescricao: TStringField;
    tblSaidascGrupo: TStringField;
    tblSaidascSubgrupo: TStringField;
    tblSaidascCodigo: TStringField;
    tblSaidascREFF: TStringField;
    pnLocal3: TPanel;
    Label22: TLabel;
    edtRefFab: TMaskEdit;
    lblMensDel: TLabel;
    lblDel: TLabel;
    edtForn: TMaskEdit;
    Label13: TLabel;
    Panel5: TPanel;
    tblSaidasSALDOANT: TIntegerField;
    tblSaidascSaldo1: TStringField;
    Label8: TLabel;
    Label23: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    edtQtde: TMaskEdit;
    edtPVenda: TMaskEdit;
    botao_sair: TPanel;
    botao1: TPanel;
    botao2: TPanel;
    Novoproduto1: TMenuItem;
    Label3: TLabel;
    edtPercDesc: TMaskEdit;
    Label5: TLabel;
    edtValorDesc: TMaskEdit;
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
    procedure edtPVendaEnter(Sender: TObject);
    procedure edtPVendaExit(Sender: TObject);
    procedure edtPVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPVendaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure tblSaidasCalcFields(DataSet: TDataSet);
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
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure edtCBarraDblClick(Sender: TObject);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtPercDescEnter(Sender: TObject);
    procedure edtValorDescEnter(Sender: TObject);
    procedure edtPercDescExit(Sender: TObject);
    procedure edtValorDescExit(Sender: TObject);
    procedure edtValorDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPercDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPercDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
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
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}
    n_ordem_f7: Integer;

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
  frm_OutrasSaidas2: Tfrm_OutrasSaidas2;

implementation

uses principal, funcoes1, funcoes2, procura, auxiliar,
  unDialogo, DM4, produtos, DM6, unMensagem, venda,
  mem_prnt, un_ConsultaProdutos, DM8, DM2;

{$R *.DFM}

procedure Tfrm_OutrasSaidas2.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_OutrasSaidas2.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_OutrasSaidas2.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_OutrasSaidas2.edtCorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),4);
  end;
  if (not n_cor_unica) and (n_tam_unico) then
    edtPVenda.text := form_nc(DevolvePrecoItem(n_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),8);
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;


procedure Tfrm_OutrasSaidas2.edtCorKeyDown(Sender: TObject; var Key: Word;
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
    ChamandoF8Cores(edtCor,true);
  if (key=K_F2) then
    if (tblSaidas.active) then
      grade.setfocus;
end;

procedure Tfrm_OutrasSaidas2.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_OutrasSaidas2.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_OutrasSaidas2.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe faixas de tamanho do produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_OutrasSaidas2.edtFaixaTamKeyDown(Sender: TObject;
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
    if (tblSaidas.active) then
      grade.setfocus;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_OutrasSaidas2.edtQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtPVenda.readonly) then
      botao2Click(Sender)
    else
      edtPVenda.setfocus;
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

procedure Tfrm_OutrasSaidas2.edtPVendaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtPVendaExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_OutrasSaidas2.edtPVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    botao2Click(Sender);
  if (key=38) or (key=K_ESC) then
    edtValorDesc.setfocus;
end;

procedure Tfrm_OutrasSaidas2.edtPVendaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_OutrasSaidas2.FocusControle1(controle: TWinControl; direcao: Boolean);
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


procedure Tfrm_OutrasSaidas2.FocusControle2(controle: TWinControl; direcao: Boolean);
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

procedure Tfrm_OutrasSaidas2.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_OutrasSaidas2.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_OutrasSaidas2.FormActivate(Sender: TObject);
begin
  if (not tblSaidas.active) then
    tblSaidas.open;
  if (gbItem_ProdCorTam.visible) then
    FocaCodigoLocal1
  else
  if (gbItem_CBarra.visible) then
    edtCBarra.setfocus;
end;

procedure Tfrm_OutrasSaidas2.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_DELETE) then
  begin
    tblSaidas.delete;
    if (gbItem_ProdCorTam.visible) then
      FocaCodigoLocal1
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus;
  end;
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

procedure Tfrm_OutrasSaidas2.LimparEdits;
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
  botao1.caption     := 'Processar lote de saídas (F5)';
  botao2.caption     := 'Adicionar ao lote';
  Lista.Free;
end;

procedure Tfrm_OutrasSaidas2.Limparcadastro1Click(Sender: TObject);
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

procedure Tfrm_OutrasSaidas2.tblSaidasCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (tblSaidas) do
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
    if (fieldbyname('cPvenda1').IsNull) then
      fieldbyname('cPvenda1').AsString:=
        form_nc2(fieldbyname('PVENDA').AsFloat,15,2);
    if (fieldbyname('cSaldo1').IsNull) then
      fieldbyname('cSaldo1').AsString:=
        form_n(fieldbyname('SALDOANT').AsFloat,5);
    if (fieldbyname('cTotal1').IsNull) then
      fieldbyname('cTotal1').AsString:=
        form_nc(fieldbyname('TOTAL').AsFloat,15);
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
      clAux.conect   ('ESTOQUE',self);
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

procedure Tfrm_OutrasSaidas2.edtFaixaTamExit(Sender: TObject);
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
      conect ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select PF_TAMA                                  ');
      AddParam ('From PRODUTOS_FAIXAS                            ');
      AddParam ('Where (PF_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (PF_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (PF_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (PF_TAMA='+chr(39)+faixa+chr(39)+')       ');
      if (not Execute) then
      begin
        frmDialogo.ExibirMensagem (' Faixa não permitida para o produto! '
          ,'Outras saidas',[mbOK]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
        edtFaixaTam.setfocus;
      end;
      desconect;
      Free;
    end;
  if (not n_tam_unico) then
    edtPVenda.text := form_nc(DevolvePrecoItem(n_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),8);
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_OutrasSaidas2.FormCreate(Sender: TObject);
begin
  ChecaExistenciaArquivo_TEMP_SAIDAS;
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

function Tfrm_OutrasSaidas2.EstaNaLista(grupo,subgrupo,produto,loja,
  cor: Real; tam: String):Boolean;
var
  flag: Boolean;
begin
  tblSaidas.disablecontrols;
  tblSaidas.first;
  flag:=false;
  while (not tblSaidas.eof) do
  begin
    if (tblSaidas.fieldbyname('GRUPO').AsFloat=grupo) and
      (tblSaidas.fieldbyname('SUBGRUPO').AsFloat=subgrupo) and
      (tblSaidas.fieldbyname('PRODUTO').AsFloat=produto) and
      (tblSaidas.fieldbyname('LOJA').AsFloat=loja) and
      (tblSaidas.fieldbyname('COR').AsFloat=cor) and
      (tblSaidas.fieldbyname('TAMANHO').AsString=tam) then
    begin
      flag:=true;
      break;
    end;
    tblSaidas.next;
  end;
  tblSaidas.enablecontrols;
  EstaNaLista:=flag;
end;

procedure Tfrm_OutrasSaidas2.Processarentradas1Click(Sender: TObject);
var
  indGauge,totGauge: Integer;
  flagObs: Integer;
  obs: String;
begin
  if (frmDialogo.ExibirMensagem ('Confirma processamento?'
    ,'Saídas',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
      {************************************************************}
    tblSaidas.disablecontrols;
    mostra_mensagem('Processando movimento...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    indGauge:=0;
    totGauge:=tblSaidas.recordcount;
    tblSaidas.first;
    while (not tblSaidas.eof) do
    begin
           {***********************************************************************}
      DMcaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat   := Round(MaxiCod3 ('MOVIMENTO',frm_principal.barraDicas));
      DMcaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat := tblSaidas.fieldbyname('GRUPO').AsFloat;
      DMcaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat := tblSaidas.fieldbyname('SUBGRUPO').AsFloat;
      DMcaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat := tblSaidas.fieldbyname('PRODUTO').AsFloat;
      DMcaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat := tblSaidas.fieldbyname('LOJA').AsFloat;
      DMcaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat := tblSaidas.fieldbyname('COR').AsFloat;
      DMcaixa.qInsereMovimento.parambyname('MO_TAMA').AsString := tblSaidas.fieldbyname('TAMANHO').AsString;
      DMcaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := InformaOrdemTamanho(tblSaidas.fieldbyname('GRUPO').AsFloat,
        tblSaidas.fieldbyname('SUBGRUPO').AsFloat,
        tblSaidas.fieldbyname('PRODUTO').AsFloat,
        tblSaidas.fieldbyname('TAMANHO').AsString);
      DMcaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat := 0;
      DMcaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := tblSaidas.fieldbyname('DATA').AsDateTime;
      DMcaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat := 0.00;
      DMcaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat := tblSaidas.fieldbyname('PVENDA').AsFloat;
      DMcaixa.qInsereMovimento.parambyname('MO_TIPO').AsString:= 'S';
      DMcaixa.qInsereMovimento.parambyname('MO_MODE').AsString:= tblSaidas.fieldbyname('MODE').AsString;
      DMcaixa.qInsereMovimento.parambyname('MO_ENTR').AsString := '';
      DMcaixa.qInsereMovimento.parambyname('MO_NOTA').AsString := '';
      DMcaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat := 0;
      DMcaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat := tblSaidas.fieldbyname('QTDE').AsFloat;
      DMcaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString := tblSaidas.fieldbyname('TIPZ').AsString;
      DMcaixa.qInsereMovimento.ExecSql;
           {***********************************************************************}
      DMcaixa.qDiminueSaldo.parambyname('grupo').AsFloat    := tblSaidas.fieldbyname('GRUPO').AsFloat;
      DMcaixa.qDiminueSaldo.parambyname('subgrupo').AsFloat := tblSaidas.fieldbyname('SUBGRUPO').AsFloat;
      DMcaixa.qDiminueSaldo.parambyname('produto').AsFloat  := tblSaidas.fieldbyname('PRODUTO').AsFloat;
      DMcaixa.qDiminueSaldo.parambyname('loja').AsFloat     := tblSaidas.fieldbyname('LOJA').AsFloat;
      DMcaixa.qDiminueSaldo.parambyname('cor').AsFloat      := tblSaidas.fieldbyname('COR').AsFloat;
      DMcaixa.qDiminueSaldo.parambyname('tamanho').AsString := tblSaidas.fieldbyname('TAMANHO').AsString;
      DMcaixa.qDiminueSaldo.parambyname('qtd1').AsFloat     := tblSaidas.fieldbyname('QTDE').AsFloat;
      DMcaixa.qDiminueSaldo.parambyname('qtd2').AsFloat     := 0;
      DMcaixa.qDiminueSaldo.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
      DMcaixa.qDiminueSaldo.ExecSql;
           {***********************************************************************}

           {...}
      tblSaidas.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
      {************************************************************}
    tblSaidas.first;
    while (not tblSaidas.eof) do
      tblSaidas.delete;
    tblSaidas.enablecontrols;
    esconde_mensagem;
      {************************************************************}
    Limparcadastro1.click;
  end;
end;

procedure Tfrm_OutrasSaidas2.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_OutrasSaidas2.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_OutrasSaidas2.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_CIMA) or (key=K_ESC) then
  ;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 99; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_OutrasSaidas2.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_OutrasSaidas2.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_OutrasSaidas2.edtSubGrupoKeyDown(Sender: TObject;
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
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 99; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
end;

procedure Tfrm_OutrasSaidas2.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_OutrasSaidas2.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_OutrasSaidas2.edtCodigoKeyDown(Sender: TObject;
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
    frm_principal.ExibirDica (' Código do produto: Formato: 9999',5);
end;

{Controle de foco do produto ***}
procedure Tfrm_OutrasSaidas2.FocaCodigoLocal2;
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
procedure Tfrm_OutrasSaidas2.FocaCodigoLocal1;
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

procedure Tfrm_OutrasSaidas2.MudaFocoCodigo;
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
      edtRefFab.setfocus;
    end;
  end;
end;

procedure Tfrm_OutrasSaidas2.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtRefIntKeyDown(Sender: TObject;
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
  if (key=K_CIMA) or (key=K_ESC) then
  ;
  if (key=K_F8) then
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
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
  if (key=K_ESC) or (key=38) then
  ;
end;

procedure Tfrm_OutrasSaidas2.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_OutrasSaidas2.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_OutrasSaidas2.edtCodigoDblClick(Sender: TObject);
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


procedure Tfrm_OutrasSaidas2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (shift=[ssCtrl]) then
    if (key=K_F7) then
      MudaFocoCodigoItem;
end;

procedure Tfrm_OutrasSaidas2.MudaFocoCodigoItem;
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

procedure Tfrm_OutrasSaidas2.edtCBarraEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtCBarraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtCBarraExit(Sender);
    edtQtde.setfocus;
  end;
  if (key=K_F8) then
    LocalizarProduto;
  if (key=K_CIMA) or (key=K_ESC) then
  ;
  if (key=k_F2) then
    grade.setfocus;
end;

procedure Tfrm_OutrasSaidas2.edtCBarraExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cbarra: String;
begin
  cbarra := ReformataCodigoBarras(Trim(edtCBarra.text));
  if (cbarra<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   ('ESTOQUE', self);
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
      end
      else
      begin
        pnProduto.caption   := '<Produto não encontrado>';
        pnDescItem2.caption := '<Item de produto não encontrado>';
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
        pnCor.caption:='Cor única';
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
  edtPVenda.text := form_nc(DevolvePrecoItem(n_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),8);
end;

procedure Tfrm_OutrasSaidas2.edtRefIntDblClick(Sender: TObject);
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

procedure Tfrm_OutrasSaidas2.edtCodigoExit(Sender: TObject);
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
        pnCor.caption:='Cor única';
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

     {****}
  if (n_cor_unica) and (n_tam_unico) then
    edtPVenda.text := form_nc(DevolvePrecoItem(n_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),8);
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_OutrasSaidas2.edtRefIntExit(Sender: TObject);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  refinterna := Trim(edtRefInt.text);
  if (refinterna<>'') then
    with (clProd) do
    begin
      clProd := TClassProdutos.Create;
      conect ('ESTOQUE', self);
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
        pnCor.caption:='Cor única';
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

     {****}
  if (n_cor_unica) and (n_tam_unico) then
    edtPVenda.text := form_nc(DevolvePrecoItem(n_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),8);
end;

procedure Tfrm_OutrasSaidas2.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (tblSaidas.fieldbyname('TIPZ').AsString='1') then
    grade.Canvas.font.color:=clNavy
  else
  if (tblSaidas.fieldbyname('TIPZ').AsString='2') then
    grade.Canvas.Font.color:=clBlue;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_OutrasSaidas2.RefrescaTabela;
begin
  tblSaidas.close;
  tblSaidas.open;
end;

procedure Tfrm_OutrasSaidas2.edtRefIntChange(Sender: TObject);
begin
  if (Trim(edtRefInt.text)<>'') then
    n_refi := Trim(edtRefInt.text)
  else
    n_refi := '0';
end;

procedure Tfrm_OutrasSaidas2.edtRefFabChange(Sender: TObject);
begin
  if (Trim(edtRefFab.text)<>'') then
    n_reffab := Trim(edtRefFab.text)
  else
    n_reffab := '0';
end;

procedure Tfrm_OutrasSaidas2.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtRefFabExit(Sender: TObject);
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
      conect   ('ESTOQUE', self);
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
        pnCor.caption:='Cor única';
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
     
     {****}
  if (n_cor_unica) and (n_tam_unico) then
    edtPVenda.text := form_nc(DevolvePrecoItem(n_loja,n_grupo,n_subgrupo,n_produto,n_cor,n_tam,'1'),8);
end;

procedure Tfrm_OutrasSaidas2.edtRefFabKeyDown(Sender: TObject;
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
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. do fabricante do produto: até 15 caracteres',5);
  if (key=K_ESC) or (key=38) then
end;

procedure Tfrm_OutrasSaidas2.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_OutrasSaidas2.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_OutrasSaidas2.gradeEnter(Sender: TObject);
begin
  lblDel.visible:=true;
  lblMensDel.visible:=true;
end;

procedure Tfrm_OutrasSaidas2.gradeExit(Sender: TObject);
begin
  lblDel.visible:=false;
  lblMensDel.visible:=false;
end;

procedure Tfrm_OutrasSaidas2.edtFornChange(Sender: TObject);
begin
  if (Trim(edtForn.text)<>'') then
    n_forn := strtofloat(Trim(edtForn.text))
  else
    n_forn := 0;
end;

procedure Tfrm_OutrasSaidas2.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,true);
end;

procedure Tfrm_OutrasSaidas2.edtFornEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtFornExit(Sender: TObject);
begin
  if (n_forn<>0) then
    edtForn.text := form_nz(n_forn,6);
end;

procedure Tfrm_OutrasSaidas2.edtFornKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRefFab.setfocus;
  if (key=K_CIMA) or (key=K_ESC) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn,true);
  if (key=K_ESC) or (key=38) then
  ;
end;

procedure Tfrm_OutrasSaidas2.edtRefFabDblClick(Sender: TObject);
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

procedure Tfrm_OutrasSaidas2.AdicionaObservacao (codigo_movimento: Real; obs: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',self);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO MOVIMENTO_OBSERVACAO (MB_MOVI,MB_TEXT) ');
  clAux.AddParam ('VALUES (:MB_MOVI,:MB_TEXT) ');
  clAux.consulta.parambyname('MB_MOVI').AsFloat := codigo_movimento;
  clAux.consulta.parambyname('MB_TEXT').AsString := obs;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_OutrasSaidas2.botao1Click(Sender: TObject);
begin
  Processarentradas1.click;
end;

procedure Tfrm_OutrasSaidas2.botao2Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  continua: Boolean;
begin
  if (gbItem_ProdCorTam.visible) then
  begin
    if (n_grupo=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Grupo não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtGrupo.setfocus;
      continua:=false;
    end
    else
    if (n_subgrupo=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Subgrupo não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtSubGrupo.setfocus;
      continua:=false;
    end
    else
    if (n_produto=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Código do produto não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtCodigo.setfocus;
      continua:=false;
    end
    else
    if (trim(edtRefInt.text)='')  and (pnLocal2.visible) then
    begin
      frmDialogo.ExibirMensagem (' Ref. Interna não pode ficar vazia! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtRefInt.setfocus;
      continua:=false;
    end
    else
    if (trim(edtForn.text)='')  and (pnLocal3.visible) then
    begin
      frmDialogo.ExibirMensagem (' Fornecedor não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtForn.setfocus;
      continua:=false;
    end
    else
    if (trim(edtRefFab.text)='')  and (pnLocal3.visible) then
    begin
      frmDialogo.ExibirMensagem (' Ref. Fabric. não pode ficar vazia! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtRefFab.setfocus;
      continua:=false;
    end
    else
    if (n_cor=-1) then
    begin
      frmDialogo.ExibirMensagem (' Cor não pode ficar vazia! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtCor.setfocus;
      continua:=false;
    end
    else
    if (n_tam='-1') then
    begin
      frmDialogo.ExibirMensagem (' Tamanho não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtFaixaTam.setfocus;
      continua:=false;
    end
    else
    if (edtQtde.text='') then
    begin
      frmDialogo.ExibirMensagem (' Qtde 01 não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtQtde.setfocus;
      continua:=false;
    end;
  end
  else
  if (gbItem_CBarra.visible) then
    if (Trim(edtCBarra.text)='') then
    begin
      frmDialogo.ExibirMensagem (' O código de barras não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtCBarra.setfocus;
      continua:=false;
    end
    else
    if (Trim(pnDescItem2.caption)='<Item de produto não encontrado>') then
    begin
      frmDialogo.ExibirMensagem (' O item de produto não está cadastrado ou não existe! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtCBarra.setfocus;
      continua:=false;
    end
    else
    if (edtQtde.text='') then
    begin
      frmDialogo.ExibirMensagem (' Qtde 01 não pode ficar vazio! '
        ,'Vendas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtQtde.setfocus;
      continua:=false;
    end;

     {...}
  if (continua) then
  begin
          {************************************************************************}
    clAux := TClassAuxiliar.Create;
    clAux.conect    ('ESTOQUE',self);
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
      frmDialogo.ExibirMensagem ('Item não cadastrado! Deseja cadastrar e lançar no lote automaticamente?'
        ,'Vendas',[mbOk],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    end
    else
    begin
      esconde_mensagem;

              {inserindo item na lista}
              {*****************************************************************************************************************}
      tblSaidas.open;
      tblSaidas.append;
      tblSaidas.fieldbyname('GRUPO').AsFloat    := n_grupo;
      tblSaidas.fieldbyname('SUBGRUPO').AsFloat := n_subgrupo;
      tblSaidas.fieldbyname('PRODUTO').AsFloat  := n_produto;
      tblSaidas.fieldbyname('LOJA').AsFloat     := n_loja;
      tblSaidas.fieldbyname('COR').AsFloat      := n_cor;
      tblSaidas.fieldbyname('TAMANHO').AsString := n_tam;
      if (Trim(edtQtde.text)<>'') then
        tblSaidas.fieldbyname('QTDE').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtQtde.text)))
      else
        tblSaidas.fieldbyname('QTDE').AsFloat := 0;
      tblSaidas.fieldbyname('DATA').AsDateTime := frm_principal.x_data_trabalho;
      if (Trim(edtPVenda.text)<>'') then
        tblSaidas.fieldbyname('PVENDA').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtPVenda.text)))
      else
        tblSaidas.fieldbyname('PVENDA').AsFloat := 0.00;
      tblSaidas.fieldbyname('SALDOANT').AsFloat := 0.00;
      tblSaidas.fieldbyname('TOTAL').AsFloat := tblSaidas.fieldbyname('PVENDA').AsFloat*tblSaidas.fieldbyname('QTDE').AsFloat;
      tblSaidas.fieldbyname('MODE').AsString := 'M'; {vale mercadoria}
      tblSaidas.fieldbyname('TIPZ').AsString := '1';
              {*****************************************************************************************************************}
      tblSaidas.post;
      RefrescaTabela;
      Limparcadastro1.click
    end;
  end;
end;

procedure Tfrm_OutrasSaidas2.LocalizarProduto;
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
  frm_ConsultaProduto.y_RotinaChamadora:=1;
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
      edtCorExit(self);
      edtQtde.setfocus; {***}
    end
    else
      Limparcadastro1.click;
  frm_ConsultaProduto.Free;
end;

procedure Tfrm_OutrasSaidas2.edtCBarraDblClick(Sender: TObject);
begin
  LocalizarProduto;
end;

procedure Tfrm_OutrasSaidas2.edtQtdeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtPercDescEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtValorDescEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_OutrasSaidas2.edtPercDescExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_OutrasSaidas2.edtValorDescExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_OutrasSaidas2.edtValorDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    botao2Click(Sender);
  if (key=38) or (key=K_ESC) then
    edtPercDesc.setfocus;
end;

procedure Tfrm_OutrasSaidas2.edtPercDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtValorDesc.setfocus;
  if (key=38) or (key=K_ESC) then
    edtQtde.setfocus;
end;

procedure Tfrm_OutrasSaidas2.edtValorDescKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_OutrasSaidas2.edtPercDescKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

end.
