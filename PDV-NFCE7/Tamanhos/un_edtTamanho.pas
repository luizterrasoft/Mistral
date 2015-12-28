unit un_edtTamanho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Mask, Db, DBTables, Grids, DBGrids;

type
  Tfrm_edtTamanho = class(TForm)
    Label2: TLabel;
    edtCodigo: TMaskEdit;
    edtDesc: TMaskEdit;
    Label1: TLabel;
    Bevel2: TBevel;
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
    qFaixas: TQuery;
    ds: TDataSource;
    Panel1: TPanel;
    grade: TDBGrid;
    Label3: TLabel;
    edtFaixa: TMaskEdit;
    btnIncluirFaixa: TSpeedButton;
    btnExcluirFaixa: TSpeedButton;
    qFaixasTF_CODI: TFloatField;
    qFaixasTF_TAMA: TStringField;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescEnter(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaEnter(Sender: TObject);
    procedure edtFaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnIncluirFaixaClick(Sender: TObject);
    procedure btnExcluirFaixaClick(Sender: TObject);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtDescExit(Sender: TObject);
    procedure Excluirplano1Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoInclusao: Integer;
    antDesc: String;
    procedure LimparEdits;
    procedure RefrescaTabela;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
  end;

var
  frm_edtTamanho: Tfrm_edtTamanho;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, tamanhos, tamanhos_faixas,
  unDialogo, unMensagem, mem_prnt, auxiliar, un_F8Tamanhos;

procedure Tfrm_edtTamanho.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtTamanho.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_edtTamanho.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtTamanho.FormActivate(Sender: TObject);
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

procedure Tfrm_edtTamanho.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe tamanhos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_edtTamanho.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDesc.setfocus;
  if (key=K_F8) then
    ChamandoF8Tamanhos(edtCodigo,false);
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do tamanho: Formato: 99; Tecle <F8/Duplo clique> para selecionar tamanhos cadastrados.',5);
end;

procedure Tfrm_edtTamanho.edtDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtTamanho.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFaixa.setfocus;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Descrição do tamanho: Qualquer caractere (até 30 caracts).',10);
end;

procedure Tfrm_edtTamanho.edtFaixaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtTamanho.edtFaixaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnIncluirFaixa.click;
  if (key=K_CIMA) then
    edtDesc.setfocus;
end;

procedure Tfrm_edtTamanho.RefrescaTabela;
var
  codigo: Real;
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtCodigo.text));
    with (qFaixas) do
    begin
      disablecontrols;
      close;
      parambyname('codigo').AsFloat:=codigo;
      open;
      enablecontrols;
    end;
  end;
end;

procedure Tfrm_edtTamanho.edtCodigoExit(Sender: TObject);
var
  clTam: TClassTamanhos;
  codigo: String;
begin
  codigo:=Trim(edtCodigo.text);
  if (codigo<>'') then
    with (clTam) do
    begin
      clTam := TClassTamanhos.Create;
      conect ('ESTOQUE', self);
      clearSql;
      AddParam ('Select TM_CODI,TM_DESC ');
      AddParam ('From   TAMANHOS ');
      AddParam ('Where (TM_CODI='+codigo+') ');
      frm_principal.BarraDicas.caption:='Buscando tamanhos...Aguarde!';
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
        edtDesc.text   := clTam.Result ('TM_DESC');
        antDesc        := Trim(edtDesc.text);
        RefrescaTabela;
      end;
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtTamanho.btnIncluirFaixaClick(Sender: TObject);
var
  codigo: Real;
  clTam: TClassTamanhosFaixas;
begin
  if (Trim(edtFaixa.text)<>'') and (Trim(edtCodigo.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtCodigo.text));
    clTam:=TClassTamanhosFaixas.Create;
    with (clTam) do
    begin
      conect ('ESTOQUE',self);
      ClearFields;
      inTF_CODI:=codigo;
      inTF_TAMA:=Trim(edtFaixa.text);
      Insert;
      desconect;
      Free;
      edtFaixa.text:='';
      edtFaixa.setfocus;
    end;
    RefrescaTabela;
  end;
end;

procedure Tfrm_edtTamanho.btnExcluirFaixaClick(Sender: TObject);
var
  faixa,codigo: String;
  clTam: TClassTamanhosFaixas;
begin
  if (qFaixas.active) then
  begin
    codigo := qFaixas.fieldbyname('TF_CODI').AsString;
    faixa  := qFaixas.fieldbyname('TF_TAMA').AsString;
    clTam  := TClassTamanhosFaixas.Create;
    with (clTam) do
    begin
      conect ('ESTOQUE',self);
      ClearSql;
      AddParam ('Delete from TAMANHOS_FAIXAS ');
      AddParam ('Where (TF_CODI='+codigo+') AND ');
      AddParam ('      (TF_TAMA='+chr(39)+faixa+chr(39)+') ');
      Execute;
      desconect;
      Free;
    end;
    RefrescaTabela;
  end;
end;

{Rotina de habilitacao de menus}
procedure Tfrm_edtTamanho.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
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

procedure Tfrm_edtTamanho.LimparEdits;
begin
  edtDesc.text:='';
  qFaixas.close;   
end;

procedure Tfrm_edtTamanho.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_TAMANHOS, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      CodigoInclusao := Round(MaxiCod2 ('TAMANHOS',frm_principal.barraDicas));
    LimparEdits;
    edtCodigo.text := form_nz (CodigoInclusao,2);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtTamanho.Limparcadastro1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtTamanho.Cancelarincluso1Click(Sender: TObject);
begin
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtTamanho.Salvar1Click(Sender: TObject);
var
  clTam: TClassTamanhos;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do tamanho não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtDesc.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Descrição do tamanho não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDesc.setfocus;
  end
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clTam) do
      begin
        clTam := TClassTamanhos.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select TM_CODI ');
        AddParam ('From   TAMANHOS ');
        AddParam ('Where  (TM_CODI='+codigo+')');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_TAMANHOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inTM_CODI  := strtofloat(codigo);
            inTM_DESC  := Trim(edtDesc.text);
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inTM_DESC) then
              with (frm_f8Tamanhos) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_TAMANHOS,'A',strtoint(codigo),'','');
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
          inTM_CODI  := strtofloat(codigo);
          inTM_DESC  := Trim(edtDesc.text);
          Insert;
          if (CodigoInclusao=inTM_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8Tamanhos) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_TAMANHOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtTamanho.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtTamanho.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtTamanho.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtTamanho.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtTamanho.edtDescExit(Sender: TObject);
var
  clTam: TClassTamanhos;
  codigo: String;
begin
    {salvamento especial ----------->}
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do tamanho não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clTam) do
      begin
        clTam := TClassTamanhos.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select TM_CODI ');
        AddParam ('From   TAMANHOS ');
        AddParam ('Where  (TM_CODI='+codigo+')');
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_TAMANHOS, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inTM_CODI  := strtofloat(codigo);
            inTM_DESC  := Trim(edtDesc.text);
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antDesc<>inTM_DESC) then
              with (frm_f8Tamanhos) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_TAMANHOS,'A',strtoint(codigo),'','');
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_TAMANHOS, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inTM_CODI  := strtofloat(codigo);
          inTM_DESC  := Trim(edtDesc.text);
          Insert;
          if (CodigoInclusao=inTM_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          with (frm_f8Tamanhos) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_TAMANHOS,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

procedure Tfrm_edtTamanho.Excluirplano1Click(Sender: TObject);
var
  clTam: TClassTamanhos;
  codigo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_TAMANHOS, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') and (Trim(edtDesc.text)<>'') then
      with (clTam) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do tipo de tamanho?'
          ,'Exclusão do tamanho',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clTam := TClassTamanhos.Create;
          conect ('ESTOQUE', self);
          ClearSql;
          AddParam ('Delete from TAMANHOS ');
          AddParam ('Where (TM_CODI='+codigo+')');
          Execute;
          ClearSql;
          AddParam ('Delete from TAMANHOS_FAIXAS ');
          AddParam ('Where (TF_CODI='+codigo+') ');
          Execute;
          desconect;
          Free;
          with (frm_f8Tamanhos) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_TAMANHOS,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Tipo de tamanho excluído com sucesso...',5);
        end
        else
          edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtTamanho.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_INSERT) then
    edtFaixa.setfocus;   
  if (key=K_DELETE) then
    btnExcluirFaixa.click; 
end;

procedure Tfrm_edtTamanho.Imprimirplanos1Click(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  tottam: Integer;
  indGauge,totGauge: Integer;
  linha: String;
  ind: Integer;
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
    AddParam ('From   TAMANHOS   ');
    AddParam ('Order by TM_CODI ');
    frm_principal.BarraDicas.caption:='Buscando tipos de tamanhos...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'c02.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE TIPOS DE TAMANHOS';

        {cabecalhos}
    AddLine(form_tc('-',80,'-'));
    AddLine('   |                                ');
    AddLine('Cod|Descricao                       ');
    AddLine(form_tc('-',80,'-'));
    tottam:=0;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.Reccount;
    while (not clAux.eof) do
    begin
      AddLine(form_nz(clAux.Result('TM_CODI'),2)+' '+
        form_t(clAux.Result('TM_DESC'),32));
      clAux2:=TClassAuxiliar.Create;
      clAux2.conect ('ESTOQUE',self);
      clAux2.ClearSql;
      clAux2.AddParam ('Select * From TAMANHOS_FAIXAS ');
      clAux2.AddParam ('Where (TF_CODI='+floattostr(clAux.result('TM_CODI'))+') ');
      clAux2.Execute;
      clAux2.first;
      linha:='';
      ind:=0;
      while (not clAux2.eof) do
      begin
        linha:=linha + form_t(clAux2.Result('TF_TAMA'),6)+',';
        ind:=ind+1;
        if (ind=10) then
        begin
          linha:=Copy(linha,1,Length(linha)-1);
          AddLine(linha);
          ind:=0;
          linha:='';
        end;
        clAux2.next;
      end;
      if (linha<>'') then
      begin
        linha:=Copy(linha,1,Length(linha)-1);
        AddLine(linha);
      end;
      clAux2.desconect;
      clAux2.Free;
      tottam := tottam + 1;
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine(form_tc('-',80,'-'));
    AddLine('Total de tamanhos  ---> '+form_nz (tottam,3));
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

procedure Tfrm_edtTamanho.edtCodigoDblClick(Sender: TObject);
begin
  ChamandoF8Tamanhos(edtCodigo,false);
end;

end.
