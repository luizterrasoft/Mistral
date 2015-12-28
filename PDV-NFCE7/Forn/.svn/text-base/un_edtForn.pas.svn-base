unit un_edtForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Menus, Mask, Grids, DBGrids, fornecedores,
  LLink, MailTo, Db, DBTables;

type
  Tfrm_edtForn = class(TForm)
    Panel3: TPanel;
    Bevel2: TBevel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Panel4: TPanel;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnCancelainclusao: TSpeedButton;
    botao_sair: TPanel;
    scroll: TScrollBox;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Incluirplano1: TMenuItem;
    Cancelarincluso1: TMenuItem;
    Excluirplano1: TMenuItem;
    Salvar1: TMenuItem;
    Limparcadastro1: TMenuItem;
    Imprimircontratoindividual1: TMenuItem;
    Imprimirplanos1: TMenuItem;
    Outros1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Auxiliares1: TMenuItem;
    Salvar2: TMenuItem;
    Bevel3: TBevel;
    Label3: TLabel;
    edtCodigo: TMaskEdit;
    Label1: TLabel;
    edtRazao: TMaskEdit;
    Label2: TLabel;
    edtNomeFan: TMaskEdit;
    Label4: TLabel;
    edtCpf: TMaskEdit;
    Label5: TLabel;
    edtInsc: TMaskEdit;
    Label19: TLabel;
    edtEnde: TMaskEdit;
    edtBairro: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    edtCida: TMaskEdit;
    cbEsta: TComboBox;
    Label22: TLabel;
    Label25: TLabel;
    edtCep: TMaskEdit;
    Label26: TLabel;
    edtFone1: TMaskEdit;
    Label6: TLabel;
    edtFone2: TMaskEdit;
    Label7: TLabel;
    edtFone3: TMaskEdit;
    Label8: TLabel;
    edtRamal1: TMaskEdit;
    Label9: TLabel;
    edtRamal2: TMaskEdit;
    Label11: TLabel;
    edtRamal3: TMaskEdit;
    Label12: TLabel;
    edtFax: TMaskEdit;
    edtCelular: TMaskEdit;
    Label13: TLabel;
    Label23: TLabel;
    edtEmail: TMaskEdit;
    Label14: TLabel;
    edtSite: TMaskEdit;
    Label15: TLabel;
    edtRespo: TMaskEdit;
    Label16: TLabel;
    edtTelRespo: TMaskEdit;
    edtRamalRespo: TMaskEdit;
    Label17: TLabel;
    Label27: TLabel;
    edtCodigoBarra: TMaskEdit;
    Label18: TLabel;
    edtBanco: TMaskEdit;
    edtAgenc: TMaskEdit;
    Label24: TLabel;
    Label28: TLabel;
    edtConta: TMaskEdit;
    edtForma: TMaskEdit;
    pnForma: TPanel;
    pnEmail: TPanel;
    MailTo1: TMailTo;
    Image1: TImage;
    edtHist: TMaskEdit;
    edtCont: TMaskEdit;
    pnConta: TPanel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Label47: TLabel;
    edtPlanoPgto: TMaskEdit;
    pnPlanoPgto: TPanel;
    N3: TMenuItem;
    pnBanco: TPanel;
    Panel1: TPanel;
    Label46: TLabel;
    Label45: TLabel;
    Label44: TLabel;
    Label48: TLabel;
    Panel2: TPanel;
    Label10: TLabel;
    Label49: TLabel;
    btnIncluirRep: TSpeedButton;
    btnExcluirRep: TSpeedButton;
    grade: TDBGrid;
    edtRepresentante: TMaskEdit;
    qRep: TQuery;
    qRepFO_CODI: TFloatField;
    qRepRE_CODI: TFloatField;
    ds: TDataSource;
    qExclueRep: TQuery;
    qInsereRep: TQuery;
    qRepnome_rep: TStringField;
    procedure SAIR1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtRazaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Excluirplano1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtRazaoEnter(Sender: TObject);
    procedure cbEstaEnter(Sender: TObject);
    procedure cbEstaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEstaExit(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtFormaExit(Sender: TObject);
    procedure edtFormaDblClick(Sender: TObject);
    procedure edtFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmailChange(Sender: TObject);
    procedure edtFormaEnter(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure edtContEnter(Sender: TObject);
    procedure edtContDblClick(Sender: TObject);
    procedure edtContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContExit(Sender: TObject);
    procedure edtHistEnter(Sender: TObject);
    procedure edtHistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPlanoPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPlanoPgtoEnter(Sender: TObject);
    procedure edtPlanoPgtoExit(Sender: TObject);
    procedure edtPlanoPgtoDblClick(Sender: TObject);
    procedure edtBancoDblClick(Sender: TObject);
    procedure edtBancoExit(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtRepresentanteDblClick(Sender: TObject);
    procedure edtRepresentanteEnter(Sender: TObject);
    procedure edtRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirRepClick(Sender: TObject);
    procedure btnExcluirRepClick(Sender: TObject);
    procedure qRepCalcFields(DataSet: TDataSet);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    flagSistema: Integer;
    flagF8: Boolean;
    Modo: Integer;
    CodigoInclusao: Integer;
    antrazao: String;
    auxHistorico: String;
    procedure LimparEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
    procedure PreencheEditsForn(clForn: TClassForn);
    procedure RefrescaTabela;
  end;

var
  frm_edtForn: Tfrm_edtForn;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, unDialogo,
  f8Forn, unMensagem, mem_prnt, auxiliar, un_edtRep;

procedure Tfrm_edtForn.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtForn.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtForn.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtForn.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtForn.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtForn.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtForn.edtCodigoEnter(Sender: TObject);
begin
  Excluirplano1.enabled:=false;
  Salvar1.enabled:=false;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe fornecedores cadastrados';
  lbF8Mens.visible:=true;
  edtCodigo.selectall;
end;

procedure Tfrm_edtForn.FocusControle(controle: TWinControl; direcao: Boolean);
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

procedure Tfrm_edtForn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_PGUP) then
    with (scroll.VertScrollBar) do
      Position := Position - 100;
  if (key=K_PGDOWN) then
    with (scroll.VertScrollBar) do
      Position := Position + 100;
end;

procedure Tfrm_edtForn.FormActivate(Sender: TObject);
begin
  scroll.VertScrollBar.Position:=0;
  edtCodigo.setfocus;
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

procedure Tfrm_edtForn.edtRazaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),flagF8);
  if (key=K_F8) then
    ChamandoF8Bancos(edtBanco,flagF8);
  if (key=K_F1) then
  begin
    if (sender=edtRazao) then
      frm_principal.ExibirDica (' Razão Social do representante: até 40 caracteres',5);
    if (sender=edtNomeFan) then
      frm_principal.ExibirDica (' Nome fantasia do representante: até 30 caracteres',5);
    if (sender=edtCpf) then
      frm_principal.ExibirDica (' CPF/CNPJ do representante: até 14 dígitos',5);
    if (sender=edtInsc) then
      frm_principal.ExibirDica (' Inscrição estadual do representante: até 20 caracteres',5);
    if (sender=edtEnde) then
      frm_principal.ExibirDica (' Endereço do representante: até 50 caracteres',5);
    if (sender=edtBairro) then
      frm_principal.ExibirDica (' Bairro do representante: até 30 caracteres',5);
    if (sender=edtCida) then
      frm_principal.ExibirDica (' Cidade do representante: até 30 caracteres',5);
    if (sender=cbEsta) then
      frm_principal.ExibirDica (' Estado do representante: até 2 caracteres (selecione na lista disponível)',5);
    if (sender=edtCep) then
      frm_principal.ExibirDica (' CEP do representante: até 10 caracteres',5);
    if (sender=edtFone1) then
      frm_principal.ExibirDica (' Fone 01 do representante: até 15 caracteres',5);
    if (sender=edtRamal1) then
      frm_principal.ExibirDica (' Ramal 01 do representante: até 6 caracteres',5);
    if (sender=edtFone2) then
      frm_principal.ExibirDica (' Fone 02 do representante: até 15 caracteres',5);
    if (sender=edtRamal2) then
      frm_principal.ExibirDica (' Ramal 02 do representante: até 6 caracteres',5);
    if (sender=edtFone3) then
      frm_principal.ExibirDica (' Fone 03 do representante: até 15 caracteres',5);
    if (sender=edtRamal3) then
      frm_principal.ExibirDica (' Ramal 03 do representante: até 6 caracteres',5);
    if (sender=edtEmail) then
      frm_principal.ExibirDica (' Email do representante: até 80 caracteres',5);
    if (sender=edtSite) then
      frm_principal.ExibirDica (' Endereço do site do representante: até 80 caracteres',5);
    if (sender=edtRespo) then
      frm_principal.ExibirDica (' Responsável pelo contas a pagar da empresa: até 40 caracteres',5);
    if (sender=edtTelRespo) then
      frm_principal.ExibirDica (' Telefone do responsável pelo contas a pagar da empresa: até 15 caracteres',5);
    if (sender=edtRamalRespo) then
      frm_principal.ExibirDica (' Ramal do responsável pelo contas a pagar da empresa: até 15 caracteres',5);
    if (sender=edtCodigoBarra) then
      frm_principal.ExibirDica (' Código de barras padrão: formato 9999999999 (usado para compôr o código de barras dos produtos)',5);
    if (sender=edtBanco) then
      frm_principal.ExibirDica (' Banco da conta-corrente do fornecedor: formato 999 (até 03 dígitos)',5);
    if (sender=edtAgenc) then
      frm_principal.ExibirDica (' Agência da conta-corrente do fornecedor: até 15 dígitos',5);
  end;
end;

procedure Tfrm_edtForn.edtContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRepresentante.setfocus;
  if (key=38) then
    edtAgenc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Conta-corrente do representante: até 20 caracteres',5);
end;

procedure Tfrm_edtForn.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  scroll.GetTabOrderList(Lista);
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
  auxHistorico:='';
  Lista.Free;
end;

procedure Tfrm_edtForn.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_FORNECEDORES, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    with (scroll.VertScrollBar) do
      Position := 0;
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      if (flagSistema=1) then {CONTAS A PAGAR}
               {CodigoInclusao := Round(MaxiCod2 ('FORNECEDORES',frm_principal.barraDicas))}
      else
      if (flagSistema=2) then {ESTOQUE}
        CodigoInclusao := Round(MaxiCod2 ('FORNECEDORES',frm_principal.barraDicas));
    LimparEdits;
    edtCodigo.text := form_nz (CodigoInclusao,6);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtForn.Cancelarincluso1Click(Sender: TObject);
begin
  with (scroll.VertScrollBar) do
    Position := 0;
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  qRep.close;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtForn.Limparcadastro1Click(Sender: TObject);
begin
  with (scroll.VertScrollBar) do
    Position := 0;   
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  qRep.close;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtForn.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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

procedure Tfrm_edtForn.Excluirplano1Click(Sender: TObject);
var
  clForn: TClassForn;
  codigo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_FORNECEDORES, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') and (Trim(edtRazao.text)<>'') then
      with (clForn) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do fornecedor?'
          ,'Exclusão do fornecedor',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clForn := TClassForn.Create;
          conect ('CONTASPAGAR', self);
          ClearSql;
          AddParam ('Delete from FORNECEDORES ');
          AddParam ('Where (FO_CODI='+codigo+')');
          Execute;
          desconect;
          Free;
          with (frm_f8Forn) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
              MODULE_FORNECEDORES,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Fornecedor excluído com sucesso...',5);
        end
        else
          edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtForn.PreencheEditsForn(clForn: TClassForn);
begin
  with (clForn) do
  begin
    edtCodigo.text:=form_nz(result('FO_CODI'),6);
    edtRazao.text:=form_t(result('FO_RAZA'),40);
    edtNomeFan.text:=form_t(result('FO_NFAN'),30);
    edtCpf.text:=result('FO_CPF');
    edtInsc.text:=form_t(result('FO_INSC'),20);
    edtEnde.text:=form_t(result('FO_ENDE'),50);
    edtBairro.text:=form_t(result('FO_BAIR'),30);
    edtCida.text:=form_t(result('FO_CIDA'),30);
    cbEsta.text:=form_t(result('FO_ESTA'),2);
    edtCep.text:=result('FO_CEP');
    edtfone1.text:=form_t(result('FO_TEL1'),15);
    edtramal1.text:=form_t(result('FO_RAM1'),5);
    edtfone2.text:=form_t(result('FO_TEL2'),15);
    edtramal2.text:=form_t(result('FO_RAM2'),5);
    edtfone3.text:=form_t(result('FO_TEL3'),15);
    edtramal3.text:=form_t(result('FO_RAM3'),5);
    edtfax.text:=form_t(result('FO_FAX'),15);
    edtcelular.text:=form_t(result('FO_CELU'),15);
    edtEmail.text:=form_t(result('FO_EMAI'),80);
    edtSite.text:=form_t(result('FO_SITE'),80);
    edtRespo.text:=form_t(result('FO_RESP'),40);
    edttelrespo.text:=form_t(result('FO_T1RE'),15);
    edtramalrespo.text:=form_t(result('FO_R1RE'),5);
    edtCodigoBarra.text:=form_t(result('FO_CBAR'),10);
    edtBanco.text:=form_nz(result('FO_BANC'),3);
    pnBanco.caption:=ProcuraNomeBanco(result('FO_BANC'),self);
    edtAgenc.text:=form_t(result('FO_AGEN'),15);
    edtConta.text:=form_t(result('FO_CCON'),20);
    edtForma.text:=form_nz(result('FO_FPGT'),3);
    pnForma.caption:=ProcuraNomeFormaPgto(result('FO_FPGT'),self);
    edtCont.text:=form_nz(result('FO_CONT'),10);
    pnConta.caption:=ProcuraNomeConta(result('FO_CONT'),self);
    edtHist.text:=form_t(result('FO_HIST'),50);
    edtPlanoPgto.text:=form_nz(result('FO_PLAN'),2);
    pnPlanoPgto.caption:=ProcuraNomePlanoAPagar(result('FO_PLAN'),self);
  end;
end;

procedure Tfrm_edtForn.edtCodigoExit(Sender: TObject);
var
  clForn: TClassforn;
  codigo: String;
begin
  codigo:=Trim(edtCodigo.text);
  if (codigo<>'') then
    with (clForn) do
    begin
      clforn := TClassForn.Create;
      conect ('CONTASPAGAR', self);
      clearSql;
      AddParam ('Select * ');
      AddParam ('From  FORNECEDORES ');
      AddParam ('Where (FO_CODI='+codigo+')');
      frm_principal.BarraDicas.caption:='Buscando fornecedor...Aguarde!';
      frm_principal.refresh;
      if (not Execute) then
      begin
        frm_principal.BarraDicas.caption:='';
        if (btnCancelainclusao.enabled) then
          HabilitaMenus (false,true,false,true,true,true)
        else
          HabilitaMenus (true,false,false,true,true,true);
        LimparEdits;
      end
      else
      begin
        frm_principal.BarraDicas.caption:='';
        HabilitaMenus (true,false,true,true,true,true);
        if (Cancelarincluso1.enabled) then
          CodigoInclusao:=0;
        PreencheEditsForn (clForn);
        RefrescaTabela;
        antrazao := Trim(edtRazao.text);
      end;
      edtCodigo.text:=form_nz(strtoint(codigo),6);
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtForn.edtRazaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtForn.cbEstaEnter(Sender: TObject);
begin
  cbEsta.selectall;
end;

procedure Tfrm_edtForn.cbEstaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    edtCep.setfocus;
end;

procedure Tfrm_edtForn.cbEstaExit(Sender: TObject);
begin
  cbEsta.text:=Uppercase(cbEsta.text);
end;

procedure Tfrm_edtForn.Salvar1Click(Sender: TObject);
var
  clForn: TClassForn;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do fornecedor não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtRazao.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Razão social do fornecedor não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtRazao.setfocus;
  end
  else
  if (Trim(edtCont.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Conta padrão a pagar do fornecedor não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCont.setfocus;
  end
  else
  if (Trim(edtForma.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Forma de pgto. do fornecedor não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtForma.setfocus;
  end
  else
  if (Trim(edtPlanoPgto.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Plano de pgto. de pedidos do fornecedor não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtPlanoPgto.setfocus;
  end
  else
    try
          {inicio da transacao}
      frm_principal.servidor_contaspagar.starttransaction;

      codigo:=Trim(edtCodigo.text);
      if (codigo<>'') then
        with (clForn) do
        begin
          clForn := TClassForn.Create;
          conect ('CONTASPAGAR', self);
          ClearSql;
          AddParam ('Select FO_CODI ');
          AddParam ('From   FORNECEDORES ');
          AddParam ('Where  (FO_CODI='+codigo+')');
          frm_principal.BarraDicas.caption:='Salvando o fornecedor...Aguarde!';
          frm_principal.refresh;
          if (Execute) then
          begin
            if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_FORNECEDORES, 'A')) then
              frm_principal.ExibirDica ('Operação não permitida...',5)
            else
            begin
              ClearSql;
              ClearFields;
              inFO_CODI:=strtofloat(codigo);
              inFO_RAZA:=Trim(edtRazao.text);
              inFO_NFAN:=Trim(edtNomeFan.text);
              inFO_CPF :=Trim(edtCpf.text);
              inFO_INSC:=Trim(edtInsc.text);
              inFO_ENDE:=Trim(edtEnde.text);
              inFO_BAIR:=Trim(edtBairro.text);
              inFO_CIDA:=Trim(edtCida.text);
              inFO_ESTA:=Trim(cbEsta.text);
              inFO_CEP :=Trim(edtCep.text);
              inFO_TEL1:=Trim(edtFone1.text);
              inFO_RAM1:=Trim(edtRamal1.text);
              inFO_TEL2:=Trim(edtFone2.text);
              inFO_RAM2:=Trim(edtRamal2.text);
              inFO_TEL3:=Trim(edtFone3.text);
              inFO_RAM3:=Trim(edtRamal3.text);
              inFO_FAX :=Trim(edtFax.text);
              inFO_CELU:=Trim(edtCelular.text);
              inFO_SITE:=Trim(edtSite.text);
              inFO_EMAI:=Trim(edtEmail.text);
              inFO_RESP:=Trim(edtRespo.text);
              inFO_T1RE:=Trim(edtTelRespo.text);
              inFO_R1RE:=Trim(edtRamalRespo.text);
              inFO_CBAR:=Trim(edtCodigoBarra.text);
              if (Trim(edtBanco.text)<>'') then
                inFO_BANC:=strtofloat(Trim(edtBanco.text));
              inFO_AGEN:=Trim(edtAgenc.text);
              inFO_CCON:=Trim(edtConta.text);
              if (Trim(edtCont.text)<>'') then
                inFO_CONT:=strtofloat(Trim(edtCont.text));
              inFO_HIST:=Trim(edtHist.text);
              if (Trim(edtForma.text)<>'') then
                inFO_FPGT:=strtofloat(Trim(edtForma.text));
              if (Trim(edtPlanoPgto.text)<>'') then
                inFO_PLAN:=strtofloat(Trim(edtPlanoPgto.text));
              inFO_TIME:=frm_principal.x_data_trabalho;
              UpdateAll;
              HabilitaMenus (true,false,true,true,true,true);
              frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
              if (antRazao<>inFO_RAZA) then
                with (frm_f8Forn) do
                  ds.dataset.close;
              with (frm_principal) do
                GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                  MODULE_FORNECEDORES,'A',strtoint(codigo),'','');
              edtCodigo.setfocus;
            end;
          end
          else
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_FORNECEDORES, 'I')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inFO_CODI:=strtofloat(codigo);
            inFO_RAZA:=Trim(edtRazao.text);
            inFO_NFAN:=Trim(edtNomeFan.text);
            inFO_CPF :=Trim(edtCpf.text);
            inFO_INSC:=Trim(edtInsc.text);
            inFO_ENDE:=Trim(edtEnde.text);
            inFO_BAIR:=Trim(edtBairro.text);
            inFO_CIDA:=Trim(edtCida.text);
            inFO_ESTA:=Trim(cbEsta.text);
            inFO_CEP :=Trim(edtCep.text);
            inFO_TEL1:=Trim(edtFone1.text);
            inFO_RAM1:=Trim(edtRamal1.text);
            inFO_TEL2:=Trim(edtFone2.text);
            inFO_RAM2:=Trim(edtRamal2.text);
            inFO_TEL3:=Trim(edtFone3.text);
            inFO_RAM3:=Trim(edtRamal3.text);
            inFO_FAX :=Trim(edtFax.text);
            inFO_CELU:=Trim(edtCelular.text);
            inFO_SITE:=Trim(edtSite.text);
            inFO_EMAI:=Trim(edtEmail.text);
            inFO_RESP:=Trim(edtRespo.text);
            inFO_T1RE:=Trim(edtTelRespo.text);
            inFO_R1RE:=Trim(edtRamalRespo.text);
            inFO_CBAR:=Trim(edtCodigoBarra.text);
            if (Trim(edtBanco.text)<>'') then
              inFO_BANC:=strtofloat(Trim(edtBanco.text));
            inFO_AGEN:=Trim(edtAgenc.text);
            inFO_CCON:=Trim(edtConta.text);
            if (Trim(edtCont.text)<>'') then
              inFO_CONT:=strtofloat(Trim(edtCont.text));
            inFO_HIST:=Trim(edtHist.text);
            if (Trim(edtForma.text)<>'') then
              inFO_FPGT:=strtofloat(Trim(edtForma.text));
            if (Trim(edtPlanoPgto.text)<>'') then
              inFO_PLAN:=strtofloat(Trim(edtPlanoPgto.text));
            inFO_TIME:=frm_principal.x_data_trabalho;
            Insert;
            CodigoInclusao:=0;
            HabilitaMenus (true,false,false,false,true,true);
            frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
            btnIncluir.Click;
            with (frm_f8Forn) do
              ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                MODULE_FORNECEDORES,'I',strtoint(codigo),'','');
          end;
          desconect;
          Free;
        end;

          {final da transacao}
      frm_principal.servidor_contaspagar.commit;
    except
          {tratamento da excecao gerada}
      frm_principal.servidor_contaspagar.rollback;
      frmDialogo.ExibirMensagem ('Ocorreu um erro inesperado na tentativa de salvar o fornecedor!'
        ,'Salvar fornecedor',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    end;
end;

procedure Tfrm_edtForn.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtForn.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRazao.setfocus;
  if (key=K_F8) and (Modo=0) then
    ChamandoF8Forn(edtCodigo,false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do representante: Formato: 999999; Tecle <F8/Duplo clique> para selecionar fornecedores cadastrados.',5);
end;

procedure Tfrm_edtForn.edtCodigoDblClick(Sender: TObject);
begin
  if (Modo=0) then
    ChamandoF8Forn(edtCodigo,false);
end;

procedure Tfrm_edtForn.edtFormaExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtForma.text);
  if (codigo<>'') then
  begin
    pnForma.caption:=ProcuraNomeFormaPgto(strtofloat(codigo),self);
    edtForma.text:=form_nz(strtofloat(codigo),3);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtForn.edtFormaDblClick(Sender: TObject);
begin
  ChamandoF8FormaPgto(edtForma,flagF8);
end;

procedure Tfrm_edtForn.edtFormaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),flagF8);
  if (key=K_F8) then
    ChamandoF8FormaPgto(edtForma,true);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Forma de pagamento usado pelo fornecedor para quitar seus títulos: formato 999 (até 03 dígitos)',5);
end;

procedure Tfrm_edtForn.edtEmailChange(Sender: TObject);
begin
  with (MailTo1) do
    MailAddress:=Trim(edtEmail.text);
end;

procedure Tfrm_edtForn.edtFormaEnter(Sender: TObject);
begin
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe formas de pagamento cadastradas';
  lbF8Mens.visible:=true;
  edtForma.selectall;
end;

procedure Tfrm_edtForn.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  totforn: Integer;
  indGauge,totGauge: Integer;
begin
     {Inicio da visualizacao da impressao ***}
  Mostra_mensagem('Preparando relatório...');
  frm_mensagem.painel.visible:=true;
  frm_mensagem.gauge1.progress:=0;
  clAux := TClassAuxiliar.Create;
  with (clAux) do
  begin
    conect ('CONTASPAGAR', self);
    clearSql;
    AddParam ('Select FO_CODI,FO_RAZA,FO_NFAN,FO_CPF,FO_INSC,FO_ENDE, ');
    AddParam ('       FO_BAIR,FO_CIDA,FO_ESTA,FO_CEP,FO_TEL1,FO_RAM1,FO_TEL2,   ');
    AddParam ('       FO_RAM2,FO_TEL3,FO_RAM3,FO_FAX,FO_CELU,FO_SITE,FO_EMAI,   ');
    AddParam ('       FO_RESP,FO_T1RE,FO_R1RE,FO_CBAR,FO_BANC,FO_AGEN,FO_CONT,  ');
    AddParam ('       FO_FPGT          ');
    AddParam ('From   FORNECEDORES     ');
    AddParam ('Order by FO_CODI ');
    frm_principal.BarraDicas.caption:='Buscando fornecedores...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'c07.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE FORNECEDORES';

        {cabecalhos}
    AddLine(form_tc('-',132,'-'));
    AddLine('       |                                |              |              |         ');
    AddLine('Codigo | Razao Social                   | CPF/CGC      | Telefone 01  |Cidade/UF');
    AddLine(form_tc('-',132,'-'));
    totforn:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      AddLine(form_nz(clAux.Result('FO_CODI'),6)+' '+
        form_t(clAux.Result('FO_RAZA'),32)+' '+
        form_t(clAux.Result('FO_CPF'),14)+' '+
        form_t(clAux.Result('FO_TEL1'),15)+' '+
        form_t(clAux.Result('FO_CIDA'),20)+'/'+
        form_t(clAux.Result('FO_ESTA'),2));
      totforn := totforn + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total de fornecedores  ---> '+form_nz (totforn,3));
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

procedure Tfrm_edtForn.edtContEnter(Sender: TObject);
begin
  with (scroll.VertScrollBar) do
    Position := Round(Range/3);
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe contas cadastradas';
  lbF8Mens.visible:=true;
  edtCont.selectall;
end;

procedure Tfrm_edtForn.edtContDblClick(Sender: TObject);
begin
  ChamandoF8Contas(edtCont,flagF8);
end;

procedure Tfrm_edtForn.edtContKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),flagF8);
  if (key=K_F8) then
    ChamandoF8Contas(edtCont,true);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Conta a pagar usada pelos títulos do fornecedor: formato 9999999999 (até 10 dígitos)',5);
end;

procedure Tfrm_edtForn.edtContExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  codigo: String;
begin
  codigo:=Trim(edtCont.text);
  if (codigo<>'') then
  begin
    auxHistorico:='';
    codigo:=form_nz(strtofloat(codigo),10);
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect ('CONTASPAGAR',self);
      ClearSql;
      AddParam ('Select * from CONTAS ');
      AddParam ('Where (CO_CODI='+codigo+') ');
      if (Execute) then
      begin
        if (clAux.result('CO_NATU')='2') then
        begin
          pnConta.caption := clAux.result('CO_DESC');
          auxHistorico    := clAux.result('CO_HIST');
          edtCont.text    := codigo;
        end
        else
        begin
          frmDialogo.ExibirMensagem ('Conta não é a pagar!'
            ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtCont.setfocus;
        end;
      end
      else
        pnConta.caption:='<conta não cadastrada>';
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtForn.edtHistEnter(Sender: TObject);
begin
  if (Trim(edtHist.text)='') then
  begin
    edtHist.text:=auxHistorico;
    edtHist.selstart:=Length(auxHistorico);
  end
  else
    TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtForn.edtHistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),flagF8);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Histórico padrão usado pelos títulos do fornecedor: até 50 caracteres',5);
end;

procedure Tfrm_edtForn.edtPlanoPgtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),flagF8);
  if (key=K_F8) then
    ChamandoF8Planos(edtPlanoPgto,true);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Plano de pagamento usado pelo fornecedor para receber seus pedidos: formato 99 (até 02 dígitos)',5);
end;

procedure Tfrm_edtForn.edtPlanoPgtoEnter(Sender: TObject);
begin
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe planos de pagamento cadastrados';
  lbF8Mens.visible:=true;
  edtPlanoPgto.selectall;
end;

procedure Tfrm_edtForn.edtPlanoPgtoExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtPlanoPgto.text);
  if (codigo<>'') then
  begin
    pnPlanoPgto.caption:=ProcuraNomePlanoAPagar(strtofloat(codigo),self);
    edtPlanoPgto.text:=form_nz(strtofloat(codigo),2);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtForn.edtPlanoPgtoDblClick(Sender: TObject);
begin
  ChamandoF8Planos(edtPlanoPgto,flagF8);
end;

procedure Tfrm_edtForn.edtBancoDblClick(Sender: TObject);
begin
  ChamandoF8Bancos(edtBanco,flagF8);
end;

procedure Tfrm_edtForn.edtBancoExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtBanco.text);
  if (codigo<>'') then
  begin
    pnBanco.caption:=ProcuraNomeBanco(strtofloat(codigo),self);
    edtBanco.text:=form_nz(strtofloat(codigo),3);
  end;
end;

procedure Tfrm_edtForn.edtCpfExit(Sender: TObject);
begin
  CriticaCNPJ(edtCpf);
end;

procedure Tfrm_edtForn.FormCreate(Sender: TObject);
begin
  flagSistema := 2;
  if (flagSistema=1) then
    flagF8:=true {CONTAS A PAGAR}
  else
  if (flagSistema=2) then
    flagF8:=false; {ESTOQUE}
end;

procedure Tfrm_edtForn.edtRepresentanteDblClick(Sender: TObject);
begin
  ChamandoF8Rep(edtRepresentante,true);
end;

procedure Tfrm_edtForn.edtRepresentanteEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtForn.edtRepresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_ENTER) then
    if (Trim(edtRepresentante.text)='') then
      btnSalvar.click
    else
      btnIncluirRep.click;
  if (key=38) then
    edtConta.setfocus;
  if (key=K_F8) then
    ChamandoF8Rep(edtRepresentante,true);
end;

procedure Tfrm_edtForn.btnIncluirRepClick(Sender: TObject);
var
  codigo,rep: Real;
begin
  if (Trim(edtCodigo.text)<>'') and (Trim(edtRepresentante.text)<>'') then
  begin
    codigo := strtofloat(Trim(edtCodigo.text));
    rep    := strtofloat(Trim(edtRepresentante.text));
    qInsereRep.parambyname('fo_codi').AsFloat := codigo;
    qInsereRep.parambyname('re_codi').AsFloat := rep;
    qInsereRep.parambyname('fp_time').AsDateTime := frm_principal.x_data_trabalho;
    qInsereRep.ExecSql;
    RefrescaTabela;
    edtRepresentante.text:='';
  end;
end;

procedure Tfrm_edtForn.btnExcluirRepClick(Sender: TObject);
var
  codigo,rep: Real;
begin
  if (Trim(edtCodigo.text)<>'') and (qRep.recordcount<>0) then
  begin
    codigo := qRep.fieldbyname('FO_CODI').AsFloat;
    rep    := qRep.fieldbyname('RE_CODI').AsFloat;
    with (qExclueRep) do
    begin
      parambyname('FO_CODI').AsFloat := codigo;
      parambyname('RE_CODI').AsFloat := rep;
      ExecSql;
    end;
    RefrescaTabela;
  end;
end;

procedure Tfrm_edtForn.RefrescaTabela;
var
  codigo: Real;
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    codigo := strtofloat(Trim(edtCodigo.text));
    with (qRep) do
    begin
      disablecontrols;
      close;
      parambyname('fornecedor').AsFloat    := codigo;
      open;
      enablecontrols;
    end;
  end;
end;

procedure Tfrm_edtForn.qRepCalcFields(DataSet: TDataSet);
begin
  with (qRep) do
    if (fieldbyname('nome_rep').IsNull) then
      fieldbyname('nome_rep').AsString:=
        ProcuraNomeRep(fieldbyname('RE_CODI').AsFloat,self);
end;

procedure Tfrm_edtForn.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_DELETE) then
    btnExcluirRep.click;
  if (key=K_F2) then
    edtRepresentante.setfocus;
end;

end.
