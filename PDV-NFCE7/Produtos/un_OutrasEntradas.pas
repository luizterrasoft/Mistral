unit un_OutrasEntradas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, ExtCtrls, Buttons, Db, DBTables, Grids, DBGrids,
  ComCtrls, Gauges;

type
  Tfrm_OutrasEntradas = class(TForm)
    gbLoja: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    edtCor: TMaskEdit;
    pnCor: TPanel;
    edtFaixaTam: TMaskEdit;
    pnProduto: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparcadastro1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Panel3: TPanel;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    botao_sair: TPanel;
    ds1: TDataSource;
    tblEntradas: TTable;
    Label1: TLabel;
    btnProcessarEntrada: TButton;
    PageControl1: TPageControl;
    pagina1: TTabSheet;
    Processarentradas1: TMenuItem;
    tblEntradasGRUPO: TSmallintField;
    tblEntradasSUBGRUPO: TSmallintField;
    tblEntradasPRODUTO: TFloatField;
    tblEntradasCOR: TSmallintField;
    tblEntradasTAMANHO: TStringField;
    tblEntradasDATA: TDateField;
    N1: TMenuItem;
    Incluiritemnalista1: TMenuItem;
    Excluiritemdalista1: TMenuItem;
    tblEntradascCor: TStringField;
    tblEntradascTam: TStringField;
    pagina2: TTabSheet;
    pagina3: TTabSheet;
    tblEntradasLOJA: TSmallintField;
    tblEntradascPcusto1: TStringField;
    Panel2: TPanel;
    edtLoja: TMaskEdit;
    pnLoja: TPanel;
    Label33: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edtQtde: TMaskEdit;
    edtTotal: TMaskEdit;
    btnIncluir1: TButton;
    edtData: TMaskEdit;
    edtUnidade: TMaskEdit;
    grade: TDBGrid;
    Gauge1: TGauge;
    tblEntradasMODE: TStringField;
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
    tblEntradascTotal1: TStringField;
    tblEntradascTotal2: TStringField;
    Label5: TLabel;
    Label3: TLabel;
    N3: TMenuItem;
    Avanafichrio1: TMenuItem;
    Retrocedefichrio1: TMenuItem;
    Label9: TLabel;
    Label12: TLabel;
    tblEntradasQTDE: TFloatField;
    tblEntradasTIPZ: TStringField;
    N4: TMenuItem;
    tblEntradasPCUSTO: TFloatField;
    tblEntradasTOTAL: TFloatField;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtLojaChange(Sender: TObject);
    procedure edtLojaDblClick(Sender: TObject);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure edtDataEnter(Sender: TObject);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtTotalEnter(Sender: TObject);
    procedure btnIncluir1Click(Sender: TObject);
    procedure edtTotalExit(Sender: TObject);
    procedure edtTotalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excluiritemdalista1Click(Sender: TObject);
    procedure btnProcessarEntradaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Incluiritemnalista1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure tblEntradasCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edtUnidadeEnter(Sender: TObject);
    procedure edtUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeExit(Sender: TObject);
    procedure edtQtdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure Avanafichrio1Click(Sender: TObject);
    procedure Retrocedefichrio1Click(Sender: TObject);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer;          {0-> chamado do menu principal, 1-> chamado da tela de estoque}
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}
    tipz: String;           {indica se a entrada esta sendo dada fora ou nao}
    procedure FocusControle1(controle: TWinControl; direcao: Boolean);
    procedure FocusControle2(controle: TWinControl; direcao: Boolean);
    procedure LimparEdits;
    function EstaNaLista(grupo,subgrupo,produto,loja,
      cor: Real; tam: String):Boolean;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure MudaFocoCodigo;
  end;

var
  frm_OutrasEntradas: Tfrm_OutrasEntradas;

implementation

uses un_LancarItem, principal, funcoes1, funcoes2, procura, auxiliar,
  unDialogo, DM4, estoques, produtos;

{$R *.DFM}

procedure Tfrm_OutrasEntradas.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_OutrasEntradas.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_OutrasEntradas.edtLojaChange(Sender: TObject);
begin
  if (Trim(edtLoja.text)<>'') then
    n_loja := strtofloat(Trim(edtLoja.text))
  else
    n_loja :=0;
end;

procedure Tfrm_OutrasEntradas.edtLojaDblClick(Sender: TObject);
begin
  ChamandoF8Lojas(edtLoja,true);
end;

procedure Tfrm_OutrasEntradas.edtLojaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtLojaExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtLoja.text);
  if (codigo<>'') then
  begin
    pnLoja.caption:=ProcuraNomeLoja(strtofloat(codigo),self);
    edtLoja.text:=form_nz(strtofloat(codigo),2);
  end;
end;


procedure Tfrm_OutrasEntradas.edtLojaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (gbLoja.visible) then
      FocaCodigoLocal1;
  if (key=K_F8) then
    ChamandoF8Lojas(edtLoja,true);
  if (key=K_F2) then
    if (tblEntradas.active) then
      grade.setfocus;
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_OutrasEntradas.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_OutrasEntradas.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_OutrasEntradas.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtCorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),2);
  end;
end;


procedure Tfrm_OutrasEntradas.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (PageControl1.activepageindex=0) then
      edtData.setfocus;
  if (key=38) or (key=K_ESC) then
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Cores(edtCor,true);
  if (key=K_F2) then
    if (tblEntradas.active) then
      grade.setfocus;
end;

procedure Tfrm_OutrasEntradas.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_OutrasEntradas.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_OutrasEntradas.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtData.setfocus;
  if (key=38) or (key=K_ESC) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F2) then
    if (tblEntradas.active) then
      grade.setfocus;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_OutrasEntradas.edtDataEnter(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {CRITICA AO ITEM QUE SE QUER ENTRAR - Estoque Loja}
  if (n_tam<>'-1') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('Select * ');
    clAux.AddParam ('From ESTOQUE_LOJA ');
    clAux.AddParam ('Where (EL_LOJA='+floattostr(n_loja)+') AND ');
    clAux.AddParam ('      (EL_GRUP='+floattostr(n_grupo)+') AND ');
    clAux.AddParam ('      (EL_SUBG='+floattostr(n_subgrupo)+') AND ');
    clAux.AddParam ('      (EL_PROD='+floattostr(n_produto)+') AND ');
    clAux.AddParam ('      (EL_CORE='+floattostr(n_cor)+') AND ');
    clAux.AddParam ('      (EL_TAMA='+chr(39)+n_tam+chr(39)+') ');
    if (not clAux.Execute) then
    begin
      frmDialogo.ExibirMensagem (' Item de estoque da loja não cadastrado! '
        ,'Outras entradas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      frm_principal.ChamandoLancarItemLoja;
      if (gbLoja.visible) then
        if (edtFaixaTam.enabled) then
          edtFaixaTam.setfocus
        else
        if (edtCor.enabled) then
          edtCor.setfocus
        else
          FocaCodigoLocal2;
    end;
    clAux.desconect;
    clAux.Free;
  end;
  if (edtData.text='  /  /    ') then
    edtData.text:=datetostr(date);
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtQtdeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle2(TWinControl(sender),true);
  if (key=38) then
    FocusControle2(TWinControl(sender),false);
end;

procedure Tfrm_OutrasEntradas.edtTotalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    btnIncluir1.click;
  if (key=38) then
    FocusControle2(TWinControl(sender),false);
end;

procedure Tfrm_OutrasEntradas.edtDataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtUnidade.setfocus;
  if (key=38) or (key=K_ESC) then
    if (gbLoja.visible) then
      if (edtFaixaTam.enabled) then
        edtFaixaTam.setfocus
      else
      if (edtCor.enabled) then
        edtCor.setfocus
      else
        FocaCodigoLocal2;
end;

procedure Tfrm_OutrasEntradas.edtQtdeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtTotalEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.FocusControle1(controle: TWinControl; direcao: Boolean);
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


procedure Tfrm_OutrasEntradas.FocusControle2(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  panel1.GetTabOrderList(Lista);
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

procedure Tfrm_OutrasEntradas.btnIncluir1Click(Sender: TObject);
begin
  Incluiritemnalista1.click;
end;

procedure Tfrm_OutrasEntradas.edtTotalExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_OutrasEntradas.edtTotalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_OutrasEntradas.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_DELETE) then
    Excluiritemdalista1.click;
  if (key=K_ESC) then
    edtData.setfocus;
end;

procedure Tfrm_OutrasEntradas.Excluiritemdalista1Click(Sender: TObject);
begin
  tblEntradas.delete;
  grade.setfocus;
end;

procedure Tfrm_OutrasEntradas.btnProcessarEntradaClick(Sender: TObject);
begin
  Processarentradas1.click;
end;

procedure Tfrm_OutrasEntradas.FormActivate(Sender: TObject);
begin
  if (not tblEntradas.active) then
    tblEntradas.open;
  if (Modo=0) then
    edtLoja.setfocus
  else
  if (Modo=1) then
    edtLoja.setfocus;
end;

procedure Tfrm_OutrasEntradas.Incluiritemnalista1Click(Sender: TObject);
begin
     {CRITICA AOS DADOS}
  if (n_grupo=0) then
  begin
    frmDialogo.ExibirMensagem (' Grupo não pode ficar vazio! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtGrupo.setfocus;
  end
  else
  if (n_subgrupo=0) then
  begin
    frmDialogo.ExibirMensagem (' Subgrupo não pode ficar vazio! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtSubGrupo.setfocus;
  end
  else
  if (n_produto=0) then
  begin
    frmDialogo.ExibirMensagem (' Código do produto não pode ficar vazio! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (n_loja=0) then
  begin
    frmDialogo.ExibirMensagem (' Loja não pode ficar vazia! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtLoja.setfocus;
  end
  else
  if (n_cor=-1) then
  begin
    frmDialogo.ExibirMensagem (' Cor não pode ficar vazia! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtCor.setfocus;
  end
  else
  if (n_tam='-1') then
  begin
    frmDialogo.ExibirMensagem (' Tamanho não pode ficar vazio! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFaixaTam.setfocus;
  end
  else
  if (edtData.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' Data não pode ficar vazia! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtData.setfocus;
  end
  else
  if (edtQtde.text='') then
  begin
    frmDialogo.ExibirMensagem (' Qtde 01 não pode ficar vazio! '
      ,'Outras entradas',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtQtde.setfocus;
  end
  else
  begin
          {inserindo item na lista}
    tblEntradas.open;
    tblEntradas.append;
    tblEntradas.fieldbyname('GRUPO').AsFloat    := n_grupo;
    tblEntradas.fieldbyname('SUBGRUPO').AsFloat := n_subgrupo;
    tblEntradas.fieldbyname('PRODUTO').AsFloat  := n_produto;
    tblEntradas.fieldbyname('LOJA').AsFloat     := n_loja;
    tblEntradas.fieldbyname('COR').AsFloat      := n_cor;
    tblEntradas.fieldbyname('TAMANHO').AsString := n_tam;
    if (Trim(edtQtde.text)<>'') then
      tblEntradas.fieldbyname('QTDE').AsFloat:=strtofloat(RetiraFormatacaoNumero(Trim(edtQtde.text)))
    else
      tblEntradas.fieldbyname('QTDE').AsFloat:=0;
    if (edtData.text<>'  /  /    ') then
      tblEntradas.fieldbyname('DATA').AsDateTime:=strtodate(Trim(edtData.text))
    else
      tblEntradas.fieldbyname('DATA').AsDateTime:=strtodate('01/01/1900');
    if (Trim(edtTotal.text)<>'') then
      tblEntradas.fieldbyname('TOTAL').AsFloat:=strtofloat(RetiraFormatacaoNumero(Trim(edtTotal.text)))
    else
      tblEntradas.fieldbyname('TOTAL').AsFloat:=0.00;
    if (tblEntradas.fieldbyname('QTDE').AsFloat<>0) then
      tblEntradas.fieldbyname('PCUSTO').AsFloat:=tblEntradas.fieldbyname('TOTAL').AsFloat/tblEntradas.fieldbyname('QTDE').AsFloat
    else
      tblEntradas.fieldbyname('PCUSTO').AsFloat:=0.00;
    if (PageControl1.activepageindex=0) then
      tblEntradas.fieldbyname('MODE').AsString:='N'
    else
    if (PageControl1.activepageindex=1) then
      tblEntradas.fieldbyname('MODE').AsString:='A'
    else
    if (PageControl1.activepageindex=2) then
      tblEntradas.fieldbyname('MODE').AsString:='T';
    tblEntradas.fieldbyname('TIPZ').AsString:=tipz;
    tblEntradas.post;
    tblEntradas.close;
    tblEntradas.open;
    Limparcadastro1.click;
  end;
end;

procedure Tfrm_OutrasEntradas.Limparcadastro1Click(Sender: TObject);
begin
  habilitaEdit(edtCor);
  habilitaEdit(edtFaixaTam);
  LimparEdits;
  edtLoja.setfocus;
end;

procedure Tfrm_OutrasEntradas.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  gbLoja.GetTabOrderList(Lista);
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
  botao_sair.caption:='SAIR';
  Lista.Free;
end;

procedure Tfrm_OutrasEntradas.edtFaixaTamExit(Sender: TObject);
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
      AddParam ('Select PF_TAMA ');
      AddParam ('From PRODUTOS_FAIXAS ');
      AddParam ('Where (PF_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (PF_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (PF_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (PF_TAMA='+chr(39)+faixa+chr(39)+') ');
      if (not Execute) then
      begin
        frmDialogo.ExibirMensagem (' Faixa não permitida para o produto! '
          ,'Outras entradas',[mbOK]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
        edtFaixaTam.setfocus;
      end;
      desconect;
      Free;
    end;
end;

procedure Tfrm_OutrasEntradas.tblEntradasCalcFields(DataSet: TDataSet);
begin
  with (tblEntradas) do
  begin
    if (fieldbyname('cPcusto1').IsNull) then
      fieldbyname('cPcusto1').AsString:=
        form_nc2(fieldbyname('PCUSTO').AsFloat,15,3);
    if (fieldbyname('cTotal1').IsNull) then
      fieldbyname('cTotal1').AsString:=
        form_nc(fieldbyname('TOTAL').AsFloat,15);
    if (fieldbyname('cCor').IsNull) then
      if (fieldbyname('COR').AsFloat=0) then
        fieldbyname('cCor').AsString:='ÚNICA'
      else
        fieldbyname('cCor').AsString:=fieldbyname('COR').AsString;
    if (fieldbyname('cTam').IsNull) then
      if (fieldbyname('TAMANHO').AsString='0') then
        fieldbyname('cTam').AsString:='ÚNICO'
      else
        fieldbyname('cTam').AsString:=fieldbyname('TAMANHO').AsString;
  end;
end;

procedure Tfrm_OutrasEntradas.FormCreate(Sender: TObject);
begin
  n_produto:=0;
  n_loja:=0;
  n_cor:=-1;
  n_tam:='-1';
  tipz:='1';
  Label4.caption:='Qtde '+tipz;

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

function Tfrm_OutrasEntradas.EstaNaLista(grupo,subgrupo,produto,loja,
  cor: Real; tam: String):Boolean;
var
  flag: Boolean;
begin
  tblEntradas.disablecontrols;
  tblEntradas.first;
  flag:=false;
  while (not tblEntradas.eof) do
  begin
    if (tblEntradas.fieldbyname('GRUPO').AsFloat=grupo) and
      (tblEntradas.fieldbyname('SUBGRUPO').AsFloat=subgrupo) and
      (tblEntradas.fieldbyname('PRODUTO').AsFloat=produto) and
      (tblEntradas.fieldbyname('LOJA').AsFloat=loja) and
      (tblEntradas.fieldbyname('COR').AsFloat=cor) and
      (tblEntradas.fieldbyname('TAMANHO').AsString=tam) then
    begin
      flag:=true;
      break;
    end;
    tblEntradas.next;
  end;
  tblEntradas.enablecontrols;
  EstaNaLista:=flag;
end;

procedure Tfrm_OutrasEntradas.edtUnidadeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle2(TWinControl(sender),true);
  if (key=38) then
    FocusControle2(TWinControl(sender),false);
end;

procedure Tfrm_OutrasEntradas.edtQtdeExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_OutrasEntradas.edtQtdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

{Processamento das entradas ****}
procedure Tfrm_OutrasEntradas.Processarentradas1Click(Sender: TObject);
var
  indGauge,totGauge: Integer;
begin
  if (frmDialogo.ExibirMensagem ('Confirma processamento?'
    ,'Entradas',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    try
      frm_principal.servidor_estoque.starttransaction;

      tblEntradas.disablecontrols;
      gauge1.visible:=true;
      gauge1.progress:=0;
      indGauge:=0;
      totGauge:=tblEntradas.recordcount;
      tblEntradas.first;
      while (not tblEntradas.eof) do
      begin
           {Inserindo registro no movimento ***}
        DMEstoque.qInsereMovimento.parambyname('MO_SEQ').AsFloat   := Round(MaxiCod2 ('MOVIMENTO',frm_principal.barraDicas));
        DMEstoque.qInsereMovimento.parambyname('MO_GRUP').AsFloat  := tblEntradas.fieldbyname('GRUPO').AsFloat;
        DMEstoque.qInsereMovimento.parambyname('MO_SUBG').AsFloat  := tblEntradas.fieldbyname('SUBGRUPO').AsFloat;
        DMEstoque.qInsereMovimento.parambyname('MO_PROD').AsFloat  := tblEntradas.fieldbyname('PRODUTO').AsFloat;
        DMEstoque.qInsereMovimento.parambyname('MO_LOJA').AsFloat  := tblEntradas.fieldbyname('LOJA').AsFloat;
        DMEstoque.qInsereMovimento.parambyname('MO_CORE').AsFloat  := tblEntradas.fieldbyname('COR').AsFloat;
        DMEstoque.qInsereMovimento.parambyname('MO_TAMA').AsString := tblEntradas.fieldbyname('TAMANHO').AsString;
        DMEstoque.qInsereMovimento.parambyname('MO_NPED').AsFloat  := 0;
        DMEstoque.qInsereMovimento.parambyname('MO_DATA').AsDateTime := tblEntradas.fieldbyname('DATA').AsDateTime;
        DMEstoque.qInsereMovimento.parambyname('MO_PCU1').AsFloat := tblEntradas.fieldbyname('PCUSTO').AsFloat;
        DMEstoque.qInsereMovimento.parambyname('MO_PVE1').AsFloat := 0.00;
        DMEstoque.qInsereMovimento.parambyname('MO_TIPO').AsString:= 'E';
        DMEstoque.qInsereMovimento.parambyname('MO_MODE').AsString:= tblEntradas.fieldbyname('MODE').AsString;
        DMEstoque.qInsereMovimento.parambyname('MO_ENTR').AsString := '';
        DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString := '';
        DMEstoque.qInsereMovimento.parambyname('MO_FORN').AsFloat := 0;
        DMEstoque.qInsereMovimento.parambyname('MO_QTD1').AsFloat := tblEntradas.fieldbyname('QTDE').AsFloat;
        DMEstoque.qInsereMovimento.parambyname('MO_TIPZ').AsString := tblEntradas.fieldbyname('TIPZ').AsString;
        DMEstoque.qInsereMovimento.ExecSql;

           {*** Saldo do item no estoque-loja}
        DMEstoque.qAumentaSaldo.parambyname('grupo').AsFloat    := tblEntradas.fieldbyname('GRUPO').AsFloat;
        DMEstoque.qAumentaSaldo.parambyname('subgrupo').AsFloat := tblEntradas.fieldbyname('SUBGRUPO').AsFloat;
        DMEstoque.qAumentaSaldo.parambyname('produto').AsFloat  := tblEntradas.fieldbyname('PRODUTO').AsFloat;
        DMEstoque.qAumentaSaldo.parambyname('loja').AsFloat     := tblEntradas.fieldbyname('LOJA').AsFloat;
        DMEstoque.qAumentaSaldo.parambyname('cor').AsFloat      := tblEntradas.fieldbyname('COR').AsFloat;
        DMEstoque.qAumentaSaldo.parambyname('tamanho').AsString := tblEntradas.fieldbyname('TAMANHO').AsString;
        if (tblEntradas.fieldbyname('TIPZ').AsString='1') then
        begin
          DMEstoque.qAumentaSaldo.parambyname('qtd1').AsFloat := tblEntradas.fieldbyname('QTDE').AsFloat;
          DMEstoque.qAumentaSaldo.parambyname('qtd2').AsFloat := 0;
        end
        else
        if (tblEntradas.fieldbyname('TIPZ').AsString='2') then
        begin
          DMEstoque.qAumentaSaldo.parambyname('qtd1').AsFloat := 0;
          DMEstoque.qAumentaSaldo.parambyname('qtd2').AsFloat := tblEntradas.fieldbyname('QTDE').AsFloat;
        end;
        CalculaPrecoCustoMedio  (tblEntradas.fieldbyname('GRUPO').AsFloat,
          tblEntradas.fieldbyname('SUBGRUPO').AsFloat,
          tblEntradas.fieldbyname('PRODUTO').AsFloat,
          tblEntradas.fieldbyname('LOJA').AsFloat,
          tblEntradas.fieldbyname('COR').AsFloat,
          tblEntradas.fieldbyname('TAMANHO').AsString,
          tblEntradas.fieldbyname('TIPZ').AsString);
        DMEstoque.qAumentaSaldo.ExecSql;

           {...}
        tblEntradas.next;
        indGauge:=indGauge+1;
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
      tblEntradas.first;
      while (not tblEntradas.eof) do
        tblEntradas.delete;
      tblEntradas.enablecontrols;
      gauge1.visible:=false;

      {fim da transacao}
      frm_principal.servidor_estoque.commit;
    except
      frm_principal.servidor_estoque.rollback;
      frmDialogo.ExibirMensagem (' Um erro ocorreu após processar o item '+form_n(indGauge,5)+'!'
        ,'Proc. de entradas',[mbOK]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    end{inicio da transacao};
end;

procedure Tfrm_OutrasEntradas.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_OutrasEntradas.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_CIMA) or (key=K_ESC) then
    edtLoja.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_OutrasEntradas.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_OutrasEntradas.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo: Real;
begin
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
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
end;

procedure Tfrm_OutrasEntradas.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_OutrasEntradas.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
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
          edtUnidade.text:=result('PR_UNID');
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
      edtData.setfocus;
  end;
  if (key=K_CIMA) or (key=K_ESC) then
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

procedure Tfrm_OutrasEntradas.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_OutrasEntradas.edtRefIntKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    refinterna := Trim(edtRefInt.text);
    if (refinterna<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,PR_SUBG,PR_CODI,PR_UNID ');
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
          edtUnidade.text:=result('PR_UNID');
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
      edtData.setfocus;
  end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
  if (key=K_ESC) or (key=38) then
    edtLoja.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_OutrasEntradas.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_OutrasEntradas.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

procedure Tfrm_OutrasEntradas.MudaFocoCodigo;
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

procedure Tfrm_OutrasEntradas.Avanafichrio1Click(Sender: TObject);
begin
  if (Pagecontrol1.activepageindex<Pagecontrol1.Pagecount-1) then
    Pagecontrol1.activepageindex:=Pagecontrol1.activepageindex+1;
end;

procedure Tfrm_OutrasEntradas.Retrocedefichrio1Click(Sender: TObject);
begin
  if (Pagecontrol1.activepageindex>0) then
    Pagecontrol1.activepageindex:=Pagecontrol1.activepageindex-1;
end;

procedure Tfrm_OutrasEntradas.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_OutrasEntradas.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;


procedure Tfrm_OutrasEntradas.edtCodigoDblClick(Sender: TObject);
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

procedure Tfrm_OutrasEntradas.FormKeyDown(Sender: TObject; var Key: Word;
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
      Label4.caption:='Qtde '+tipz;
    end;
end;

end.
