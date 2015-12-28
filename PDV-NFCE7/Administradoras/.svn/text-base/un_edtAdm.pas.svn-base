unit un_edtAdm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, StdCtrls, ExtCtrls, Mask;

type
  Tfrm_edtAdm = class(TForm)
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
    Label2: TLabel;
    edtCodigo: TMaskEdit;
    edtDesc: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtAbrev: TMaskEdit;
    Bevel2: TBevel;
    edtTaxaDesc: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtPrazoDesc: TMaskEdit;
    Label17: TLabel;
    edtCodBanco: TMaskEdit;
    Label18: TLabel;
    edtAgencia: TMaskEdit;
    Label19: TLabel;
    edtConta: TMaskEdit;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtDescEnter(Sender: TObject);
    procedure edtAbrevEnter(Sender: TObject);
    procedure edtTaxaDescEnter(Sender: TObject);
    procedure edtPrazoDescEnter(Sender: TObject);
    procedure edtCodBancoEnter(Sender: TObject);
    procedure edtAgenciaEnter(Sender: TObject);
    procedure edtContaEnter(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAbrevKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTaxaDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrazoDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAgenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Excluirplano1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTaxaDescExit(Sender: TObject);
    procedure edtTaxaDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrazoDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrazoDescExit(Sender: TObject);
    procedure edtCodBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    antDesc,antAbrev: String;
    Modo: Integer;
    CodigoInclusao: Integer;
    procedure LimparEdits;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
  end;

var
  frm_edtAdm: Tfrm_edtAdm;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,adm, unDialogo, unMensagem,
  mem_prnt, un_F8Adm, auxiliar;

procedure Tfrm_edtAdm.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtAdm.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtAdm.LimparEdits;
begin
  edtDesc.text   :='';
  edtAbrev.text  :='';
  edtTaxaDesc.text :='';
  edtPrazoDesc.text:='';
  edtCodBanco.text:='';
  edtAgencia.text:='';
  edtConta.text:='';
end;

procedure Tfrm_edtAdm.edtCodigoEnter(Sender: TObject);
begin
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtAdm.edtCodigoExit(Sender: TObject);
var
  clAdm: TClassAdm;
  codigo: String;
begin
  codigo := Trim(edtCodigo.text);
  if (codigo<>'') then
    with (clAdm) do
    begin
      clAdm := TClassAdm.Create;
      conect ('ESTOQUE', self);
      clearSql;
      AddParam ('Select *                    ');
      AddParam ('From   ADMINISTRADORAS      ');
      AddParam ('Where (AM_CODI='+codigo+')  ');
      frm_principal.BarraDicas.caption:='Buscando administradoras...Aguarde!';
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
        edtCodigo.text    := form_nz (StrToFloat(codigo),2);
        edtDesc.text      := clAdm.Result ('AM_DESC');
        edtAbrev.text     := clAdm.Result ('AM_ABRV');
        edtTaxaDesc.text  := floattostr(clAdm.Result('AM_TDES'));
        edtPrazoDesc.text := floattostr(clAdm.Result('AM_PDES'));
        edtCodBanco.text  := floattostr(clAdm.Result('AM_BANC'));
        edtAgencia.text   := Trim(clAdm.Result('AM_AGEN'));
        edtConta.text     := Trim(clAdm.Result('AM_CONT'));
        antDesc           := Trim(edtDesc.text);
        antAbrev          := Trim(edtAbrev.text);
      end;
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtAdm.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDesc.setfocus;
  if (key=K_F8) then
    with (frm_f8Adm) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodigo;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código da administradora - Formato: 99; Tecle <F8/Duplo clique> para selecionar administradoras cadastradas.',5);
end;

procedure Tfrm_edtAdm.edtCodigoDblClick(Sender: TObject);
begin
  with (frm_f8Adm) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodigo;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_edtAdm.edtDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtAdm.edtAbrevEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtAdm.edtTaxaDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtAdm.edtPrazoDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtAdm.edtCodBancoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtAdm.edtAgenciaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtAdm.edtContaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtAdm.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtAbrev.setfocus;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
end;

procedure Tfrm_edtAdm.edtAbrevKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtTaxaDesc.setfocus;
  if (key=K_CIMA) then
    edtDesc.setfocus;
end;

procedure Tfrm_edtAdm.edtTaxaDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtPrazoDesc.setfocus;
  if (key=K_CIMA) then
    edtAbrev.setfocus;
end;

procedure Tfrm_edtAdm.edtPrazoDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodBanco.setfocus;
  if (key=K_CIMA) then
    edtTaxaDesc.setfocus;
end;

procedure Tfrm_edtAdm.edtAgenciaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtConta.setfocus;
  if (key=K_CIMA) then
    edtCodBanco.setfocus;
end;

procedure Tfrm_edtAdm.edtContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSalvar.click;
  if (key=K_CIMA) then
    edtAgencia.setfocus;
end;

procedure Tfrm_edtAdm.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario,MODULE_ADMINISTRADORA, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      CodigoInclusao := Round(MaxiCod2 ('ADMINISTRADORAS',frm_principal.barraDicas));
    LimparEdits;
    edtCodigo.text := form_nz (CodigoInclusao,2);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtAdm.Cancelarincluso1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtAdm.Excluirplano1Click(Sender: TObject);
var
  clAdm: TClassAdm;
  codigo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_ADMINISTRADORA, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codigo := Trim(edtCodigo.text);
    if (codigo<>'') and (Trim(edtDesc.text)<>'') then
      with (clAdm) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão da administradora?'
          ,'Exclusão da administradora',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clAdm := TClassAdm.Create;
          conect ('ESTOQUE', self);
          ClearSql;
          AddParam ('Delete from ADMINISTRADORAS ');
          AddParam ('Where (AM_CODI='+codigo+')');
          Execute;
          desconect;
          Free;
          with (frm_f8Adm) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_ADMINISTRADORA,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Administradora excluída com sucesso...',5);
        end
        else
          edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtAdm.Salvar1Click(Sender: TObject);
var
  clAdm: TClassAdm;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código da administradora não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtDesc.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Descrição da administradora não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDesc.setfocus;
  end
  else
  if (Trim(edtAbrev.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Abreviatura da administradora não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtAbrev.setfocus;
  end
  else
  begin
    codigo := Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clAdm) do
      begin
        clAdm := TClassAdm.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select AM_CODI               ');
        AddParam ('From   ADMINISTRADORAS       ');
        AddParam ('Where  (AM_CODI='+codigo+')  ');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_ADMINISTRADORA, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inAM_CODI:=strtofloat(codigo);
            inAM_DESC:=Trim(edtDesc.text);
            inAM_ABRV:=Trim(edtAbrev.text);
            inAM_TDES:=strtofloat(RetiraFormatacaoNumero(Trim(edtTaxaDesc.text)));
            inAM_PDES:=strtofloat(RetiraFormatacaoNumero(Trim(edtPrazoDesc.text)));
            inAM_BANC:=strtofloat(edtCodBanco.text);
            inAM_AGEN:=Trim(edtAgencia.text);
            inAM_CONT:=Trim(edtConta.text);
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inAM_DESC) or (antAbrev<>inAM_ABRV) then
              with (frm_f8Adm) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_ADMINISTRADORA,'A',strtoint(codigo),'','');
            edtCodigo.setfocus;
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_ADMINISTRADORA, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inAM_CODI:=strtofloat(codigo);
          inAM_DESC:=Trim(edtDesc.text);
          inAM_ABRV:=Trim(edtAbrev.text);
          inAM_TDES:=strtofloat(RetiraFormatacaoNumero(Trim(edtTaxaDesc.text)));
          inAM_PDES:=strtofloat(RetiraFormatacaoNumero(Trim(edtPrazoDesc.text)));
          inAM_BANC:=strtofloat(edtCodBanco.text);
          inAM_AGEN:=Trim(edtAgencia.text);
          inAM_CONT:=Trim(edtConta.text);
          Insert;
          if (CodigoInclusao=inAM_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8Adm) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_ADMINISTRADORA,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtAdm.Limparcadastro1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtAdm.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  totadm: Integer;
  indGauge,totGauge: Integer;
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
    AddParam ('Select *                ');
    AddParam ('From   ADMINISTRADORAS  ');
    AddParam ('Order by AM_CODI        ');
    frm_principal.BarraDicas.caption:='Buscando cadastro de administradoras...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'c11.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE ADMINISTRADORAS';

        {cabecalhos}
    AddLine(form_tc('-',80,'-'));
    AddLine('   |                                |              ');
    AddLine('Cod|Descricao                       |Abreviatura   ');
    AddLine(form_tc('-',80,'-'));
    totadm:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      AddLine(form_nz(clAux.Result('AM_CODI'),2)+' '+
        form_t(clAux.Result('AM_DESC'),32)+' '+
        form_t(clAux.Result('AM_ABRV'),10));
      totadm := totadm + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine(form_tc('-',80,'-'));
    AddLine('Total de adms.  ---> '+form_nz (totadm,2));
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

procedure Tfrm_edtAdm.FormActivate(Sender: TObject);
begin
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

procedure Tfrm_edtAdm.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtAdm.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtAdm.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtAdm.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtAdm.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtAdm.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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

procedure Tfrm_edtAdm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtAdm.edtTaxaDescExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtAdm.edtTaxaDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtAdm.edtPrazoDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtAdm.edtPrazoDescExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtAdm.edtCodBancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtAgencia.setfocus;
  if (key=K_CIMA) then
    edtPrazoDesc.setfocus;
end;

end.
