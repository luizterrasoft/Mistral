unit un_edtCores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Menus, Mask;

type
  Tfrm_edtCores = class(TForm)
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
    Bevel2: TBevel;
    edtCodigo: TMaskEdit;
    Label2: TLabel;
    Label1: TLabel;
    edtDesc: TMaskEdit;
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
    Label3: TLabel;
    edtAbrev: TMaskEdit;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure edtDescEnter(Sender: TObject);
    procedure edtAbrevEnter(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure edtAbrevKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excluirplano1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Incluirplano1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoInclusao: Integer;
    antDesc,antAbrev: String;
    procedure LimparEdits;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
  end;

var
  frm_edtCores: Tfrm_edtCores;

implementation

uses un_F8Cores, principal, unDialogo, cores, funcoes1, funcoes2, procura,
  unMensagem, mem_prnt, auxiliar;

{$R *.DFM}

procedure Tfrm_edtCores.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtCores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtCores.Limparcadastro1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtCores.LimparEdits;
begin
  edtDesc.text   :='';
  edtAbrev.text  :='';
end;

procedure Tfrm_edtCores.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtCores.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDesc.setfocus;
  if (key=K_F8) then
    with (frm_f8Cores) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodigo;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código da cor; Formato: 99; Tecle <F8/Duplo clique> para selecionar cores cadastradas.',5);
end;

procedure Tfrm_edtCores.edtCodigoDblClick(Sender: TObject);
begin
  with (frm_f8Cores) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodigo;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_edtCores.edtCodigoExit(Sender: TObject);
var
  clCor: TClassCores;
  codigo: String;
begin
  codigo:=Trim(edtCodigo.text);
  if (codigo<>'') then
    with (clCor) do
    begin
      clCor := TClassCores.Create;
      conect ('ESTOQUE', self);
      clearSql;
      AddParam ('Select CR_CODI,CR_DESC,CR_ABRV ');
      AddParam ('From   CORES ');
      AddParam ('Where (CR_CODI='+codigo+')');
      frm_principal.BarraDicas.caption:='Buscando cores...Aguarde!';
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
        edtCodigo.text := form_nz (StrToFloat(codigo),2);
        edtDesc.text   := clCor.Result ('CR_DESC');
        edtAbrev.text  := clCor.Result ('CR_ABRV');
        antDesc        := Trim(edtDesc.text);
        antAbrev       := Trim(edtAbrev.text);
      end;
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

{Rotina de habilitacao de menus}
procedure Tfrm_edtCores.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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

procedure Tfrm_edtCores.Cancelarincluso1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtCores.edtDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtCores.edtAbrevEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtCores.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtAbrev.setfocus;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Descrição da cor: Qualquer caractere (até 30 caracts).',10);
end;

procedure Tfrm_edtCores.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtCores.edtAbrevKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSalvar.click;
  if (key=K_CIMA) then
    edtDesc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Abreviatura da cor: Qualquer caractere (até 5 caracts).',10);
end;

procedure Tfrm_edtCores.Excluirplano1Click(Sender: TObject);
var
  clCor: TClassCores;
  codigo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CORES, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') and (Trim(edtDesc.text)<>'') then
      with (clCor) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do grupo?'
          ,'Exclusão da cor',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clCor := TClassCores.Create;
          conect ('ESTOQUE', self);
          ClearSql;
          AddParam ('Delete from CORES ');
          AddParam ('Where (CR_CODI='+codigo+')');
          Execute;
          desconect;
          Free;
          with (frm_f8Cores) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_CORES,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Cor excluída com sucesso...',5);
        end
        else
          edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtCores.Salvar1Click(Sender: TObject);
var
  clCor: TClassCores;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código da cor não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtDesc.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Descrição da cor não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDesc.setfocus;
  end
  else
  if (Trim(edtAbrev.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Abreviatura da cor não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtAbrev.setfocus;
  end
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clCor) do
      begin
        clCor := TClassCores.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select CR_CODI ');
        AddParam ('From   CORES ');
        AddParam ('Where  (CR_CODI='+codigo+')');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CORES, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inCR_CODI  := strtofloat(codigo);
            inCR_DESC  := Trim(edtDesc.text);
            inCR_ABRV  := Trim(edtAbrev.text);
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inCR_DESC) or (antAbrev<>inCR_ABRV) then
              with (frm_f8Cores) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_CORES,'A',strtoint(codigo),'','');
            edtCodigo.setfocus;
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CORES, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inCR_CODI  := strtofloat(codigo);
          inCR_DESC  := Trim(edtDesc.text);
          inCR_ABRV  := Trim(edtAbrev.text);
          Insert;
          if (CodigoInclusao=inCR_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8Cores) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_CORES,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtCores.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CORES, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      CodigoInclusao := Round(MaxiCod2 ('CORES',frm_principal.barraDicas));
    LimparEdits;
    edtCodigo.text := form_nz (CodigoInclusao,2);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtCores.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtCores.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtCores.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtCores.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtCores.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtCores.FormActivate(Sender: TObject);
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

procedure Tfrm_edtCores.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  totcores: Integer;
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
    AddParam ('Select * ');
    AddParam ('From   CORES   ');
    AddParam ('Order by CR_CODI ');
    frm_principal.BarraDicas.caption:='Buscando cadastro de cores...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'c01.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE CORES';

        {cabecalhos}
    AddLine(form_tc('-',80,'-'));
    AddLine('   |                                |              ');
    AddLine('Cod|Descricao                       |Abreviatura   ');
    AddLine(form_tc('-',80,'-'));
    totcores:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      AddLine(form_nz(clAux.Result('CR_CODI'),2)+' '+
        form_t(clAux.Result('CR_DESC'),32)+' '+
        form_t(clAux.Result('CR_ABRV'),10));
      totcores := totcores + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine(form_tc('-',80,'-'));
    AddLine('Total de cores  ---> '+form_nz (totcores,3));
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

end.
