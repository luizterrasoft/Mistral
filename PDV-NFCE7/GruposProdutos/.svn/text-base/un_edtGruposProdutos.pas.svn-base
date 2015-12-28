unit un_edtGruposProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Menus, StdCtrls, Mask;

type
  Tfrm_edtGruposProdutos = class(TForm)
    Bevel2: TBevel;
    Label2: TLabel;
    edtCodigo: TMaskEdit;
    edtDesc: TMaskEdit;
    Label1: TLabel;
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
    edtMin: TMaskEdit;
    Label14: TLabel;
    edtMax: TMaskEdit;
    grupo1: TGroupBox;
    chCorUnica: TCheckBox;
    chTamUnico: TCheckBox;
    Label15: TLabel;
    edtMargem: TMaskEdit;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescEnter(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMinEnter(Sender: TObject);
    procedure edtMaxEnter(Sender: TObject);
    procedure edtMinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtMinExit(Sender: TObject);
    procedure edtMaxExit(Sender: TObject);
    procedure edtMinKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMargemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMargemEnter(Sender: TObject);
    procedure edtMargemExit(Sender: TObject);
    procedure edtMargemKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoInclusao: Integer;
    antDesc: String;
    procedure LimparEdits;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
  end;

var
  frm_edtGruposProdutos: Tfrm_edtGruposProdutos;

implementation

uses principal, funcoes1, funcoes2, grupos_produtos, unDialogo, unMensagem,
  mem_prnt, auxiliar, procura, f8GruposProdutos;

{$R *.DFM}

procedure Tfrm_edtGruposProdutos.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtGruposProdutos.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtGruposProdutos.LimparEdits;
begin
  edtDesc.text:='';
  edtMin.text:='';
  edtMax.text:='';
  edtMargem.text:='';
  chCorUnica.checked:=false;
  chTamUnico.checked:=false;
end;

procedure Tfrm_edtGruposProdutos.FormActivate(Sender: TObject);
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

{Rotina de habilitacao de menus}
procedure Tfrm_edtGruposProdutos.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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


procedure Tfrm_edtGruposProdutos.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtGruposProdutos.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDesc.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtCodigo,false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_edtGruposProdutos.edtDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtGruposProdutos.edtDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtMin.setfocus;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Descrição do grupo de produto: Qualquer caractere (até 20 caracts).',10);
end;

procedure Tfrm_edtGruposProdutos.edtMinEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtGruposProdutos.edtMaxEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtGruposProdutos.edtMinKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtMax.setfocus;
  if (key=K_CIMA) then
    edtDesc.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Desconto mínimo permitido: Formato: 99,99%.',5);
end;

procedure Tfrm_edtGruposProdutos.edtMaxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtMargem.setfocus;
  if (key=K_CIMA) then
    edtMin.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Desconto máximo permitido: Formato: 99,99%.',5);
end;

procedure Tfrm_edtGruposProdutos.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtGruposProdutos.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtGruposProdutos.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtGruposProdutos.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtGruposProdutos.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtGruposProdutos.edtMinExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtGruposProdutos.edtMaxExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtGruposProdutos.edtMinKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtGruposProdutos.edtMaxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtGruposProdutos.edtMargemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSalvar.click;
  if (key=K_CIMA) then
    edtMax.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Margem de contribuição: Formato: 99,99%.',5);
end;

procedure Tfrm_edtGruposProdutos.edtMargemEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtGruposProdutos.edtMargemExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_edtGruposProdutos.edtMargemKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_edtGruposProdutos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtGruposProdutos.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_GRUPOS_PRODUTOS, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      CodigoInclusao := Round(MaxiCod2 ('GRUPOS_PRODUTOS',frm_principal.barraDicas));
    LimparEdits;
    edtCodigo.text := form_nz (CodigoInclusao,3);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtGruposProdutos.Limparcadastro1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtGruposProdutos.Cancelarincluso1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtGruposProdutos.edtCodigoExit(Sender: TObject);
var
  clGrupos: TClassGruposProdutos;
  codigo: String;
begin
  codigo:=Trim(edtCodigo.text);
  if (codigo<>'') then
    with (clGrupos) do
    begin
      clGrupos := TClassGruposProdutos.Create;
      conect ('ESTOQUE', self);
      clearSql;
      AddParam ('Select GR_CODI,GR_DESC,GR_DMIN,GR_DMAX,GR_MARG,GR_CUNI,GR_TUNI ');
      AddParam ('From   GRUPOS_PRODUTOS ');
      AddParam ('Where (GR_CODI='+codigo+') ');
      frm_principal.BarraDicas.caption:='Buscando grupos de produtos...Aguarde!';
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
        edtDesc.text   := clGrupos.Result ('GR_DESC');
        edtMin.text    := form_nc(clGrupos.Result ('GR_DMIN'),5);
        edtMax.text    := form_nc(clGrupos.Result ('GR_DMAX'),5);
        edtMargem.text := form_nc(clGrupos.Result ('GR_MARG'),5);
        if (clGrupos.result('GR_CUNI')='0') then
          chCorUnica.checked := false
        else
        if (clGrupos.result('GR_CUNI')='1') then
          chCorUnica.checked := true;
        if (clGrupos.result('GR_TUNI')='0') then
          chTamUnico.checked := false
        else
        if (clGrupos.result('GR_TUNI')='1') then
          chTamUnico.checked := true;
        antDesc        := Trim(edtDesc.text);
      end;
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtGruposProdutos.Salvar1Click(Sender: TObject);
var
  clGrupos: TClassGruposProdutos;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do grupo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtDesc.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Descrição do grupo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDesc.setfocus;
  end
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clGrupos) do
      begin
        clGrupos := TClassGruposProdutos.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select GR_CODI ');
        AddParam ('From   GRUPOS_PRODUTOS ');
        AddParam ('Where  (GR_CODI='+codigo+')');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_GRUPOS_PRODUTOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inGR_CODI  := strtofloat(codigo);
            inGR_DESC  := Trim(edtDesc.text);
            if (chCorUnica.checked) then
              inGR_CUNI  := '1'
            else
              inGR_CUNI  := '0';
            if (chTamUnico.checked) then
              inGR_TUNI  := '1'
            else
              inGR_TUNI  := '0';
            if (Trim(edtMin.text)<>'') then
              inGR_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)))
            else
              inGR_DMIN:=0.00;
            if (Trim(edtMax.text)<>'') then
              inGR_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)))
            else
              inGR_DMAX:=0.00;
            if (Trim(edtMargem.text)<>'') then
              inGR_MARG:=strtofloat(RetiraFormatacaoNumero(Trim(edtMargem.text)))
            else
              inGR_MARG:=0.00;
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inGR_DESC) then
              with (frm_f8GruposProdutos) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_GRUPOS_PRODUTOS,'A',strtoint(codigo),'','');
            edtCodigo.setfocus;
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_TAMANHOS, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inGR_CODI  := strtofloat(codigo);
          inGR_DESC  := Trim(edtDesc.text);
          if (chCorUnica.checked) then
            inGR_CUNI  := '1'
          else
            inGR_CUNI  := '0';
          if (chTamUnico.checked) then
            inGR_TUNI  := '1'
          else
            inGR_TUNI  := '0';
          if (Trim(edtMin.text)<>'') then
            inGR_DMIN:=strtofloat(RetiraFormatacaoNumero(Trim(edtMin.text)))
          else
            inGR_DMIN:=0.00;
          if (Trim(edtMax.text)<>'') then
            inGR_DMAX:=strtofloat(RetiraFormatacaoNumero(Trim(edtMax.text)))
          else
            inGR_DMAX:=0.00;
          if (Trim(edtMargem.text)<>'') then
            inGR_MARG:=strtofloat(RetiraFormatacaoNumero(Trim(edtMargem.text)))
          else
            inGR_MARG:=0.00;
          Insert;
          if (CodigoInclusao=inGR_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8GruposProdutos) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_GRUPOS_PRODUTOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtGruposProdutos.Imprimirplanos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  totgrupos: Integer;
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
    AddParam ('From   GRUPOS_PRODUTOS   ');
    AddParam ('Order by GR_CODI ');
    frm_principal.BarraDicas.caption:='Buscando cadastro de grupos...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'c03.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE GRUPOS DE PRODUTOS';

        {cabecalhos}
    AddLine(form_tc('-',80,'-'));
    AddLine('   |                         |Desc. |Desc. |Margem |Cor  |Tam');
    AddLine('Cod|Descricao                |Min % |Max % |Contrib|Unica|Unico');
    AddLine(form_tc('-',80,'-'));
    totgrupos:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      if (clAux.result('GR_CUNI')='0') then
        flag_cor:='  Nao'
      else
      if (clAux.result('GR_CUNI')='1') then
        flag_cor:='  Sim';
      if (clAux.result('GR_TUNI')='0') then
        flag_tam:='  Nao'
      else
      if (clAux.result('GR_TUNI')='1') then
        flag_tam:='  Sim';
      AddLine(form_nz (clAux.Result('GR_CODI'),2) +' '+
        form_t  (clAux.Result('GR_DESC'),26)+' '+
        form_nc (clAux.Result('GR_DMIN'),6) +' '+
        form_nc (clAux.Result('GR_DMAX'),6) +' '+
        form_nc (clAux.Result('GR_MARG'),7) +' '+
        flag_cor+' '+
        flag_tam);
      totgrupos := totgrupos + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine(form_tc('-',80,'-'));
    AddLine('Total de grupos  ---> '+form_nz (totgrupos,3));
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

procedure Tfrm_edtGruposProdutos.edtCodigoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtCodigo,false);
end;

end.
