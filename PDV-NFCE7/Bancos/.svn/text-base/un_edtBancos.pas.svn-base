unit un_edtBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Menus, Buttons, ExtCtrls;

type
  Tfrm_edtBancos = class(TForm)
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
    Auxiliares1: TMenuItem;
    Salvar2: TMenuItem;
    edtCodigo: TMaskEdit;
    Label2: TLabel;
    Label1: TLabel;
    edtNome: TMaskEdit;
    Bevel2: TBevel;
    Label3: TLabel;
    edtSite: TMaskEdit;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excluirplano1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSiteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtSiteEnter(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer;
    codigoinclusao: Integer;
    antNome: String;
    procedure LimparEdits;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
  end;

var
  frm_edtBancos: Tfrm_edtBancos;

implementation

uses principal, unDialogo, funcoes1, funcoes2, procura, bancos, f8Bancos,
  unMensagem, mem_prnt, auxiliar, DM5;

{$R *.DFM}

procedure Tfrm_edtBancos.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtBancos.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtBancos.FormActivate(Sender: TObject);
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

procedure Tfrm_edtBancos.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_BANCOS, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      CodigoInclusao := Round(MaxiCod_contaspagar ('BANCOS',frm_principal.barraDicas));
    LimparEdits;
    edtCodigo.text := form_nz (CodigoInclusao,3);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtBancos.Cancelarincluso1Click(Sender: TObject);
begin
  botao_sair.caption:='SAIR';
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtBancos.Limparcadastro1Click(Sender: TObject);
begin
  botao_sair.caption:='SAIR';
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtBancos.edtCodigoEnter(Sender: TObject);
begin
  Excluirplano1.enabled:=false;
  Salvar1.enabled:=false;   
  edtCodigo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe bancos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtBancos.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNome.setfocus;
  if (key=k_F8) and (Modo=0) then
    Chamandof8Bancos(edtCodigo,false);
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do banco.: Formato: 999 (Até 03 dígitos) - <F8/Duplo clique> Exibe bancos cadastrados ',10);
end;

procedure Tfrm_edtBancos.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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

procedure Tfrm_edtBancos.LimparEdits;
begin
  edtNome.text:='';
  edtSite.text:='';
end;

procedure Tfrm_edtBancos.Excluirplano1Click(Sender: TObject);
var
  clBanco: TClassBancos;
  codigo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_BANCOS, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') and (Trim(edtNome.text)<>'') then
      with (clBanco) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do banco?'
          ,'Exclusão',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clBanco := TClassBancos.Create;
          conect   ('CONTASPAGAR', self);
          ClearSql;
          AddParam ('Delete from BANCOS ');
          AddParam ('Where (BA_CODI='+codigo+')');
          Execute;
          desconect;
          Free;
          with (frm_f8Bancos) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
              MODULE_BANCOS,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Banco excluída com sucesso...',5);
        end
        else
          edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtBancos.Salvar1Click(Sender: TObject);
var
  clBanco: TClassBancos;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do banco de custo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtNome.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Nome do banco não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNome.setfocus;
  end
  else
  begin
    codigo:=form_nz(strtofloat(Trim(edtCodigo.text)),3);
    if (codigo<>'') then
      with (clBanco) do
      begin
        clBanco := TClassBancos.Create;
        conect('CONTASPAGAR', self);
        ClearSql;
        AddParam ('Select BA_CODI ');
        AddParam ('From   BANCOS ');
        AddParam ('Where  (BA_CODI='+codigo+')');
        frm_principal.BarraDicas.caption:='Salvando o banco...Aguarde!';
        frm_principal.refresh;
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_BANCOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inBA_CODI  := strtofloat(codigo);
            inBA_NOME  := Trim(edtNome.text);
            inBA_SITE  := Trim(edtSite.text);
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antNome<>inBA_NOME) then
              with (frm_f8bancos) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                MODULE_BANCOS,'A',strtoint(codigo),'','');
            edtCodigo.setfocus;
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CENTROS_CUSTO, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inBA_CODI  := strtofloat(codigo);
          inBA_NOME  := Trim(edtNome.text);
          inBA_SITE  := Trim(edtSite.text);
          Insert;
          if (CodigoInclusao=inBA_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8Bancos) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
              MODULE_BANCOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtBancos.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtBancos.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtBancos.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtBancos.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtBancos.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtBancos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtBancos.edtCodigoExit(Sender: TObject);
var
  clBanco: TClassBancos;
  codigo: String;
begin
  codigo := sem_brancos(edtCodigo.text);
  if (codigo<>'') then
    with (clBanco) do
    begin
      clBanco := TClassBancos.Create;
      conect ('CONTASPAGAR', self);
      clearSql;
      AddParam ('Select BA_CODI,BA_NOME,BA_SITE ');
      AddParam ('From   BANCOS ');
      AddParam ('Where (BA_CODI='+codigo+')');
      frm_principal.BarraDicas.caption:='Buscando banco...Aguarde!';
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
        edtNome.text   := clBanco.Result ('BA_NOME');
        edtSite.text   := clBanco.Result ('BA_SITE');
        antNome := Trim(edtNome.text);
      end;
      edtCodigo.text := form_nz (StrToFloat(codigo),4);
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtBancos.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSite.setfocus;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do banco.: atá 40 caracteres ',10);
end;

procedure Tfrm_edtBancos.edtSiteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSalvar.click;
  if (key=K_CIMA) then
    edtNome.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Site do banco.: atá 80 caracteres ',10);
end;

procedure Tfrm_edtBancos.edtNomeEnter(Sender: TObject);
begin
  edtNome.selectall;
end;

procedure Tfrm_edtBancos.edtSiteEnter(Sender: TObject);
begin
  edtSite.selectall;
end;

procedure Tfrm_edtBancos.edtCodigoDblClick(Sender: TObject);
begin
  if (Modo=0) then
    ChamandoF8Bancos(edtCodigo,false);
end;

procedure Tfrm_edtBancos.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  totbancos: Integer;
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
    AddParam ('Select BA_CODI,BA_NOME,BA_SITE      ');
    AddParam ('From   BANCOS    ');
    AddParam ('Order by BA_CODI ');
    frm_principal.BarraDicas.caption:='Buscando bancos...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'c06.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE BANCOS';

        {cabecalhos}
    AddLine(form_tc('-',80,'-'));
    AddLine('     |                              ');
    AddLine('Cod  |Nome do banco                 ');
    AddLine(form_tc('-',80,'-'));
    totbancos:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      AddLine(form_nz   (clAux.Result('BA_CODI'),3) +'  '+
        form_t    (clAux.Result('BA_NOME'),30));
      totbancos := totbancos + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
    end;
    AddLine(form_tc('-',80,'-'));
    AddLine('Total de bancos  ---> '+form_nz (totbancos,3));
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
