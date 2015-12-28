unit un_edtRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, Mask, representantes, LLink, MailTo,
  Grids, DBGrids, Db, DBTables;

type
  Tfrm_edtRep = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Incluirplano1: TMenuItem;
    Cancelarincluso1: TMenuItem;
    Excluirplano1: TMenuItem;
    Salvar1: TMenuItem;
    Limparcadastro1: TMenuItem;
    N1: TMenuItem;
    Imprimircontratoindividual1: TMenuItem;
    Imprimirplanos1: TMenuItem;
    Outros1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Auxiliares1: TMenuItem;
    Salvar2: TMenuItem;
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
    edtSite: TMaskEdit;
    Label14: TLabel;
    edtEmail: TMaskEdit;
    Label23: TLabel;
    edtFone1: TMaskEdit;
    Label26: TLabel;
    Label8: TLabel;
    edtRamal1: TMaskEdit;
    edtFone2: TMaskEdit;
    Label6: TLabel;
    Label9: TLabel;
    edtRamal2: TMaskEdit;
    edtFone3: TMaskEdit;
    Label7: TLabel;
    Label11: TLabel;
    edtRamal3: TMaskEdit;
    edtFax: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtCelular: TMaskEdit;
    pnEmail: TPanel;
    MailTo1: TMailTo;
    Image1: TImage;
    edtCida: TMaskEdit;
    Label21: TLabel;
    Label22: TLabel;
    cbEsta: TComboBox;
    edtCep: TMaskEdit;
    Label25: TLabel;
    Label19: TLabel;
    edtEnde: TMaskEdit;
    edtBairro: TMaskEdit;
    Label20: TLabel;
    edtNomeFan: TMaskEdit;
    Label2: TLabel;
    edtCodigo: TMaskEdit;
    Label3: TLabel;
    Label1: TLabel;
    edtRazao: TMaskEdit;
    edtCpf: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtInsc: TMaskEdit;
    Bevel3: TBevel;
    qForn: TQuery;
    ds: TDataSource;
    qFornFO_CODI: TFloatField;
    qFornRE_CODI: TFloatField;
    qFornnome_forn: TStringField;
    qInsereForn: TQuery;
    qExclueForn: TQuery;
    Panel1: TPanel;
    Label15: TLabel;
    grade: TDBGrid;
    edtFornecedor: TMaskEdit;
    Label16: TLabel;
    btnIncluirForn: TSpeedButton;
    btnExcluirForn: TSpeedButton;
    procedure SAIR1Click(Sender: TObject);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRazaoEnter(Sender: TObject);
    procedure edtRazaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEstaEnter(Sender: TObject);
    procedure cbEstaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excluirplano1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtEmailChange(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure edtSiteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qFornCalcFields(DataSet: TDataSet);
    procedure edtFornecedorEnter(Sender: TObject);
    procedure edtFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirFornClick(Sender: TObject);
    procedure btnExcluirFornClick(Sender: TObject);
    procedure edtFornecedorDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flagSistema: Integer;
    flagF8: Boolean;
    Modo: Integer;
    codigo_fornecedor: Real;
    CodigoInclusao: Integer;
    antrazao: String;
    procedure LimparEdits;
    procedure RefrescaTabela;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
    procedure PreencheEditsRep(clRep: TClassRep);
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
  end;

var
  frm_edtRep: Tfrm_edtRep;

implementation

uses principal, unDialogo, procura, funcoes1, funcoes2, f8Users, unMensagem,
  mem_prnt, auxiliar, f8Rep;

{$R *.DFM}

procedure Tfrm_edtRep.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtRep.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_REPRESENTANTES, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      if (flagSistema=1) then {CONTAS A PAGAR}
               {CodigoInclusao := Round(MaxiCod2 ('REPRESENTANTES',frm_principal.barraDicas))}
      else
      if (flagSistema=2) then {ESTOQUE}
        CodigoInclusao := Round(MaxiCod2 ('REPRESENTANTES',frm_principal.barraDicas));
    LimparEdits;
    edtCodigo.text := form_nz (CodigoInclusao,4);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtRep.Limparcadastro1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  qForn.close;
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtRep.Cancelarincluso1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  qForn.close;
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtRep.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtRep.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtRep.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtRep.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtRep.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtRep.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtRep.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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

procedure Tfrm_edtRep.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_edtRep.GetTabOrderList(Lista);
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
  Lista:=TList.Create;
  frm_edtRep.panel1.GetTabOrderList(Lista);
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

procedure Tfrm_edtRep.FocusControle(controle: TWinControl; direcao: Boolean);
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


procedure Tfrm_edtRep.PreencheEditsRep(clRep: TClassRep);
begin
  with (clRep) do
  begin
    edtCodigo.text:=form_nz(result('RE_CODI'),6);
    edtRazao.text:=form_t(result('RE_RAZA'),40);
    edtNomeFan.text:=form_t(result('RE_NFAN'),30);
    edtCpf.text:=result('RE_CPF');
    edtInsc.text:=form_t(result('RE_INSC'),20);
    edtEnde.text:=form_t(result('RE_ENDE'),50);
    edtBairro.text:=form_t(result('RE_BAIR'),30);
    edtCida.text:=form_t(result('RE_CIDA'),30);
    cbEsta.text:=form_t(result('RE_ESTA'),2);
    edtCep.text:=result('RE_CEP');
    edtfone1.text:=form_t(result('RE_TEL1'),15);
    edtramal1.text:=form_t(result('RE_RAM1'),5);
    edtfone2.text:=form_t(result('RE_TEL1'),15);
    edtramal2.text:=form_t(result('RE_RAM1'),5);
    edtfone3.text:=form_t(result('RE_TEL1'),15);
    edtramal3.text:=form_t(result('RE_RAM1'),5);
    edtfax.text:=form_t(result('RE_FAX'),15);
    edtcelular.text:=form_t(result('RE_CELU'),15);
    edtEmail.text:=form_t(result('RE_EMAI'),80);
    edtSite.text:=form_t(result('RE_SITE'),80);
  end;
end;

procedure Tfrm_edtRep.edtCodigoExit(Sender: TObject);
var
  clRep: TClassRep;
  codigo: String;
begin
  codigo:=Trim(edtCodigo.text);
  if (codigo<>'') then
    with (clRep) do
    begin
      clRep := TClassRep.Create;
      conect ('CONTASPAGAR', self);
      clearSql;
      AddParam ('Select * ');
      AddParam ('From  REPRESENTANTES ');
      AddParam ('Where (RE_CODI='+codigo+')');
      frm_principal.BarraDicas.caption:='Buscando representante...Aguarde!';
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
        PreencheEditsRep (clRep);
        antrazao := Trim(edtRazao.text);
        RefrescaTabela;
      end;
      edtCodigo.text:=form_nz(strtoint(codigo),4);
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtRep.edtCodigoEnter(Sender: TObject);
begin
  Excluirplano1.enabled:=false;
  Salvar1.enabled:=false;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe representantes cadastrados';
  lbF8Mens.visible:=true;
  edtCodigo.selectall;
end;

procedure Tfrm_edtRep.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRazao.setfocus;
  if (key=K_F8) and (Modo=0) then
    ChamandoF8Rep(edtCodigo,false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do representante: Formato: 9999; Tecle <F8/Duplo clique> para selecionar representantes cadastrados.',5);
end;

procedure Tfrm_edtRep.edtRazaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtRep.edtRazaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),flagF8);
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
  end;
end;

procedure Tfrm_edtRep.cbEstaEnter(Sender: TObject);
begin
  cbEsta.selectall;
end;

procedure Tfrm_edtRep.cbEstaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    edtCep.setfocus;
end;

procedure Tfrm_edtRep.Excluirplano1Click(Sender: TObject);
var
  clRep: TClassRep;
  codigo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_REPRESENTANTES, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') and (Trim(edtRazao.text)<>'') then
      with (clRep) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do representante?'
          ,'Exclusão do representante',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clRep := TClassRep.Create;
          conect ('CONTASPAGAR', self);
          ClearSql;
          AddParam ('Delete from REPRESENTANTES  ');
          AddParam ('Where (RE_CODI='+codigo+')');
          Execute;
          desconect;
          Free;
          with (frm_f8Rep) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
              MODULE_REPRESENTANTES,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Reprensentante excluído com sucesso...',5);
        end
        else
          edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtRep.Salvar1Click(Sender: TObject);
var
  clRep: TClassRep;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do representante não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtRazao.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Razão social do representante não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtRazao.setfocus;
  end
  else
    try
          {inicio da transacao}
      frm_principal.servidor_contaspagar.starttransaction;

      codigo:=Trim(edtCodigo.text);
      if (codigo<>'') then
        with (clRep) do
        begin
          clRep := TClassRep.Create;
          conect ('CONTASPAGAR', self);
          ClearSql;
          AddParam ('Select RE_CODI ');
          AddParam ('From   REPRESENTANTES ');
          AddParam ('Where  (RE_CODI='+codigo+')');
          frm_principal.BarraDicas.caption:='Salvando o representante...Aguarde!';
          frm_principal.refresh;
          if (Execute) then
          begin
            if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_REPRESENTANTES, 'A')) then
              frm_principal.ExibirDica ('Operação não permitida...',5)
            else
            begin
              ClearSql;
              ClearFields;
              inRE_CODI:=strtofloat(codigo);
              inRE_RAZA:=Trim(edtRazao.text);
              inRE_NFAN:=Trim(edtNomeFan.text);
              inRE_CPF :=Trim(edtCpf.text);
              inRE_INSC:=Trim(edtInsc.text);
              inRE_ENDE:=Trim(edtEnde.text);
              inRE_BAIR:=Trim(edtBairro.text);
              inRE_CIDA:=Trim(edtCida.text);
              inRE_ESTA:=Trim(cbEsta.text);
              inRE_CEP :=Trim(edtCep.text);
              inRE_TEL1:=Trim(edtFone1.text);
              inRE_RAM1:=Trim(edtRamal1.text);
              inRE_TEL2:=Trim(edtFone2.text);
              inRE_RAM2:=Trim(edtRamal2.text);
              inRE_TEL3:=Trim(edtFone3.text);
              inRE_RAM3:=Trim(edtRamal3.text);
              inRE_FAX :=Trim(edtFax.text);
              inRE_CELU:=Trim(edtCelular.text);
              inRE_SITE:=Trim(edtSite.text);
              inRE_EMAI:=Trim(edtEmail.text);
              inRE_TIME:=frm_principal.x_data_trabalho;
              UpdateAll;
              HabilitaMenus (true,false,true,true,true,true);
              frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
              if (antRazao<>inRE_RAZA) then
                with (frm_f8Rep) do
                  ds.dataset.close;
              with (frm_principal) do
                GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                  MODULE_REPRESENTANTES,'A',strtoint(codigo),'','');
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
            inRE_CODI:=strtofloat(codigo);
            inRE_RAZA:=Trim(edtRazao.text);
            inRE_NFAN:=Trim(edtNomeFan.text);
            inRE_CPF :=Trim(edtCpf.text);
            inRE_INSC:=Trim(edtInsc.text);
            inRE_ENDE:=Trim(edtEnde.text);
            inRE_BAIR:=Trim(edtBairro.text);
            inRE_CIDA:=Trim(edtCida.text);
            inRE_ESTA:=Trim(cbEsta.text);
            inRE_CEP :=Trim(edtCep.text);
            inRE_TEL1:=Trim(edtFone1.text);
            inRE_RAM1:=Trim(edtRamal1.text);
            inRE_TEL2:=Trim(edtFone2.text);
            inRE_RAM2:=Trim(edtRamal2.text);
            inRE_TEL3:=Trim(edtFone3.text);
            inRE_RAM3:=Trim(edtRamal3.text);
            inRE_FAX :=Trim(edtFax.text);
            inRE_CELU:=Trim(edtCelular.text);
            inRE_SITE:=Trim(edtSite.text);
            inRE_EMAI:=Trim(edtEmail.text);
            inRE_CODI:=strtofloat(codigo);
            inRE_RAZA:=Trim(edtRazao.text);
            inRE_NFAN:=Trim(edtNomeFan.text);
            inRE_CPF :=Trim(edtCpf.text);
            inRE_INSC:=Trim(edtInsc.text);
            inRE_ENDE:=Trim(edtEnde.text);
            inRE_BAIR:=Trim(edtBairro.text);
            inRE_CIDA:=Trim(edtCida.text);
            inRE_ESTA:=Trim(cbEsta.text);
            inRE_CEP :=Trim(edtCep.text);
            inRE_TEL1:=Trim(edtFone1.text);
            inRE_RAM1:=Trim(edtRamal1.text);
            inRE_TEL2:=Trim(edtFone2.text);
            inRE_RAM2:=Trim(edtRamal2.text);
            inRE_TEL3:=Trim(edtFone3.text);
            inRE_RAM3:=Trim(edtRamal3.text);
            inRE_FAX :=Trim(edtFax.text);
            inRE_CELU:=Trim(edtCelular.text);
            inRE_SITE:=Trim(edtSite.text);
            inRE_EMAI:=Trim(edtEmail.text);
            inRE_TIME:=frm_principal.x_data_trabalho;
            Insert;
            CodigoInclusao:=0;
            HabilitaMenus (true,false,false,false,true,true);
            frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
            btnIncluir.Click;
            with (frm_f8Rep) do
              ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                MODULE_REPRESENTANTES,'I',strtoint(codigo),'','');
          end;
          desconect;
          Free;
        end;

          {final da transacao}
      frm_principal.servidor_contaspagar.commit;
    except
          {tratamento da excecao gerada}
      frm_principal.servidor_contaspagar.rollback;
      frmDialogo.ExibirMensagem ('Ocorreu um erro inesperado na tentativa de salvar o representante!'
        ,'Salvar representante',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    end;
end;

procedure Tfrm_edtRep.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_edtRep.FormActivate(Sender: TObject);
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

procedure Tfrm_edtRep.edtCodigoDblClick(Sender: TObject);
begin
  if (Modo=0) then
    ChamandoF8Rep(edtCodigo,false);
end;

procedure Tfrm_edtRep.edtEmailChange(Sender: TObject);
begin
  with (MailTo1) do
    MailAddress:=Trim(edtEmail.text);
end;

procedure Tfrm_edtRep.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  indGauge,totGauge: Integer;
  totrep: Integer;
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
    AddParam ('Select RE_CODI,RE_RAZA,RE_NFAN,RE_CPF,RE_INSC, ');
    AddParam ('       RE_ENDE,RE_BAIR,RE_CIDA,RE_ESTA,RE_CEP, ');
    AddParam ('       RE_TEL1,RE_RAM1,RE_TEL2,RE_RAM2,RE_TEL3, ');
    AddParam ('       RE_RAM3,RE_FAX,RE_CELU,RE_SITE,RE_EMAI, ');
    AddParam ('       RE_FORN ');
    AddParam ('From   REPRESENTANTES     ');
    AddParam ('Order by RE_CODI ');
    frm_principal.BarraDicas.caption:='Buscando representantes...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'c08.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE REPRESENTANTES';

        {cabecalhos}
    AddLine(form_tc('-',132,'-'));
    AddLine('       |                                |              |              |         ');
    AddLine('Codigo | Razao Social                   | CPF/CGC      | Telefone 01  |Cidade/UF');
    AddLine(form_tc('-',132,'-'));
    totrep:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      AddLine(form_nz(clAux.Result('RE_CODI'),6)+' '+
        form_t(clAux.Result('RE_RAZA'),32)+' '+
        form_t(clAux.Result('RE_CPF'),14)+' '+
        form_t(clAux.Result('RE_TEL1'),15)+' '+
        form_t(clAux.Result('RE_CIDA'),20)+'/'+
        form_t(clAux.Result('RE_ESTA'),2));
      totrep := totrep + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total de representantes  ---> '+form_nz (totrep,3));
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

procedure Tfrm_edtRep.edtSiteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFornecedor.setfocus;
  if (key=38) then
    FocusControle(TWinControl(sender),flagF8);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Endereço do site do representante: até 80 caracteres',5);
end;

procedure Tfrm_edtRep.qFornCalcFields(DataSet: TDataSet);
begin
  with (qForn) do
    if (fieldbyname('nome_forn').IsNull) then
      fieldbyname('nome_forn').AsString:=
        ProcuraNomeForn(fieldbyname('FO_CODI').AsFloat,self);
end;

procedure Tfrm_edtRep.edtFornecedorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtRep.edtFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_ENTER) then
    if (Trim(edtFornecedor.text)='') then
      btnSalvar.click
    else
      btnIncluirForn.click;
  if (key=38) then
    edtSite.setfocus;
  if (key=K_F8) then
    ChamandoF8Forn(edtFornecedor,true);
end;

procedure Tfrm_edtRep.btnIncluirFornClick(Sender: TObject);
var
  codigo,forn: Real;
begin
  if (Trim(edtCodigo.text)<>'') and (Trim(edtFornecedor.text)<>'') then
  begin
    codigo := strtofloat(Trim(edtCodigo.text));
    forn   := strtofloat(Trim(edtFornecedor.text));
    qInsereForn.parambyname('fo_codi').AsFloat := forn;
    qInsereForn.parambyname('re_codi').AsFloat := codigo;
    qInsereForn.parambyname('fp_time').AsDateTime := frm_principal.x_data_trabalho;
    qInsereForn.ExecSql;
    RefrescaTabela;
    edtFornecedor.text:='';
  end;
end;

procedure Tfrm_edtRep.RefrescaTabela;
var
  codigo: Real;
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    codigo := strtofloat(Trim(edtCodigo.text));
    with (qForn) do
    begin
      disablecontrols;
      close;
      parambyname('representante').AsFloat    := codigo;
      open;
      enablecontrols;
    end;
  end;
end;

procedure Tfrm_edtRep.btnExcluirFornClick(Sender: TObject);
var
  codigo,fornecedor: Real;
begin
  if (Trim(edtCodigo.text)<>'') and (qForn.recordcount<>0) then
  begin
    codigo := qForn.fieldbyname('RE_CODI').AsFloat;
    fornecedor := qForn.fieldbyname('FO_CODI').AsFloat;
    with (qExclueForn) do
    begin
      parambyname('re_codi').AsFloat := codigo;
      parambyname('fo_codi').AsFloat := fornecedor;
      ExecSql;
    end;
    RefrescaTabela;
  end;
end;

procedure Tfrm_edtRep.edtFornecedorDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtFornecedor,true);
end;

procedure Tfrm_edtRep.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_DELETE) then
    btnExcluirForn.click;
  if (key=K_F2) then
    edtFornecedor.setfocus;
end;

procedure Tfrm_edtRep.FormCreate(Sender: TObject);
begin
  flagSistema := 1;
  if (flagSistema=1) then
    flagF8:=true {CONTAS A PAGAR}
  else
  if (flagSistema=2) then
    flagF8:=false; {ESTOQUE}
end;

end.
