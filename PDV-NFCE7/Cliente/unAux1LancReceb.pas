unit unAux1LancReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Grids, DBGrids, DB, DBTables, Menus,funcoesglobais;

type
  Tfrm_Aux1LancReceb = class(TForm)
    gPlano: TGroupBox;
    lbl: TLabel;
    edtcodigo: TMaskEdit;
    pnCliente: TPanel;
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label22: TLabel;
    lbF8mens: TLabel;
    lbF8: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    btnExecutar: TButton;
    grade: TDBGrid;
    ds: TDataSource;
    qContrato: TQuery;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Desmarcarcliente1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    qContratocTOTAL: TStringField;
    qContratocENTRADA: TStringField;
    qContratocVALOR: TStringField;
    qContratoCR_TOTA: TFloatField;
    qContratoCR_VENT: TFloatField;
    qContratoPC_VALO: TFloatField;
    qContratoCR_CODI: TFloatField;
    qContratoCR_CLIE: TFloatField;
    qContratoCR_NOTA: TStringField;
    qContratoCR_DNOT: TDateTimeField;
    qContratoCR_DTRA: TDateTimeField;
    qContratoPC_DVTO: TDateTimeField;
    qContratoPC_STAT: TStringField;
    qContratoPC_TPRE: TFloatField;
    Panel1: TPanel;
    Label1: TLabel;
    pnEnde: TPanel;
    Label2: TLabel;
    pnBairro: TPanel;
    Label3: TLabel;
    pnCidade: TPanel;
    Label4: TLabel;
    pnUf: TPanel;
    Label5: TLabel;
    pnNasc: TPanel;
    Label6: TLabel;
    pnCpf: TPanel;
    Label7: TLabel;
    pnRg: TPanel;
    qContratoCR_LOJA: TFloatField;
    qContratoPC_LOJA: TFloatField;
    qContratoCR_PDEV: TFloatField;
    qContratoPC_NPRE: TFloatField;
    Panel2: TPanel;
    qContratosituacao: TStringField;
    Label8: TLabel;
    Label9: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutarClick(Sender: TObject);
    procedure Desmarcarcliente1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtcodigoExit(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodigoDblClick(Sender: TObject);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flagStatus: String;   {'0'-> somente prestacoes em aberto; '1'-> somente prestacoes quitadas,
                         '2'-> todas as prestacoes do cliente}
    formAnt: Integer;   {0-> lancamento de recebimentos, 1-> em reabre documento,
                          2-> registro manual no S.P.C, 3-> regularizacao manul no S.P.C.}
  end;

var
  frm_Aux1LancReceb: Tfrm_Aux1LancReceb;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, Principal, unLancReceb, f8Clientes, cliente,
  unReabreDocumento, unRegManContSpc, unReabManContSpc,UnLancReceb2;

procedure Tfrm_Aux1LancReceb.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Aux1LancReceb.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_Aux1LancReceb.edtcodigoEnter(Sender: TObject);
begin
  edtCodigo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe clientes cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_Aux1LancReceb.edtcodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    SAIR1.click;
  if (key=K_ENTER) then
    btnExecutar.click;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      left:=20;
      top :=76;
      edit:=edtCodigo;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do cliente: até 06 digitos - <F8/Duplo clique> Exibe clientes cadastrados ',10);
end;

procedure Tfrm_Aux1LancReceb.btnExecutarClick(Sender: TObject);
begin
  Desmarcarcliente1.click;
end;

procedure Tfrm_Aux1LancReceb.Desmarcarcliente1Click(Sender: TObject);
var
  clCliente: TClassCliente;
  codigo: String;
begin
  codigo:=Trim(edtCodigo.text);
  if (codigo<>'') then
  begin
    clCliente := TClassCliente.Create;
    with (clCliente) do
    begin
      conect('CREDITO',self);
      ClearSql;
      AddParam('Select CL_CODI,CL_NOME,CL_ENDE,CL_CPF,CL_IDEN,');
      AddParam('       CL_CIDA,CL_ESTA,CL_DTNA,CL_BAIR        ');
      AddParam('From   CRECLI                                 ');
      AddParam('Where (CL_CODI='+codigo+')                    ');
      if (Execute) then
      begin
        pnCliente.caption := Result('CL_NOME');
        pnEnde.caption    := Result('CL_ENDE');
        pnBairro.caption  := Result('CL_BAIR');
        pnCidade.caption  := Result('CL_CIDA');
        pnUf.caption      := Result('CL_ESTA');
        pnNasc.caption    := Result('CL_DTNA');
        pnCpf.caption     := Result('CL_CPF');
        pnRg.caption      := Result('CL_IDEN');
      end
      else
      begin
        pnCliente.caption := '';
        pnEnde.caption    := '';
        pnBairro.caption  := '';
        pnCidade.caption  := '';
        pnUf.caption      := '';
        pnNasc.caption    := '';
        pnCpf.caption     := '';
        pnRg.caption      := '';
      end;
      desconect;
      Free;
    end;
    edtCodigo.text:=form_nz(strtofloat(codigo),6);
    with (qContrato) do
    begin
      close;
      parambyname('cliente').AsFloat:=strtofloat(codigo);
      open;
      grade.setfocus;
    end;
  end;
end;

procedure Tfrm_Aux1LancReceb.Limparformulrio1Click(Sender: TObject);
begin
  edtCodigo.text:='';
  pnCliente.caption:='';
  pnEnde.caption:='';
  pnBairro.caption:='';
  pnCidade.caption:='';
  pnUf.caption:='';
  pnNasc.caption:='';
  pnCpf.caption:='';
  pnRg.caption:='';
  qContrato.close;
  edtCodigo.setfocus;
end;

procedure Tfrm_Aux1LancReceb.edtcodigoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_Aux1LancReceb.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (formAnt=0) then
      with (frm_LancReceb) do
      begin
        edtCodLoja.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_LOJA').AsFloat,2);
        edtCodCli.text  := form_nz(strtofloat(frm_Aux1LancReceb.edtCodigo.text),6);
        edtCodCont.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('CR_CODI').AsFloat,6);
        edtNPre.text    := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_NPRE').AsFloat,2);
        edtNPre.setfocus;
        frm_Aux1LancReceb.close;
      end
    else
    if (formAnt=1) then
      with (frm_ReabreDocumento) do
      begin
        edtCodLoja.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_LOJA').AsFloat,2);
        edtCodCli.text  := form_nz(strtofloat(frm_Aux1LancReceb.edtCodigo.text),6);
        edtCodCont.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('CR_CODI').AsFloat,6);
        edtNPre.text    := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_NPRE').AsFloat,2);
        edtNPre.setfocus;
        frm_Aux1LancReceb.close;
      end
    else
    if (formAnt=2) then
      with (frm_RegManContSPC) do
      begin
        edtCodLoja.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_LOJA').AsFloat,2);
        edtCodCli.text  := form_nz(strtofloat(frm_Aux1LancReceb.edtCodigo.text),6);
        edtCodCont.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('CR_CODI').AsFloat,6);
        edtNPre.text    := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_NPRE').AsFloat,2);
        edtNPre.setfocus;
        frm_Aux1LancReceb.close;
      end
    else
    if (formAnt=3) then
      with (frm_ReabManContSPC) do
      begin
        edtCodLoja.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_LOJA').AsFloat,2);
        edtCodCli.text  := form_nz(strtofloat(frm_Aux1LancReceb.edtCodigo.text),6);
        edtCodCont.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('CR_CODI').AsFloat,6);
        edtNPre.text    := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_NPRE').AsFloat,2);
        edtNPre.setfocus;
        frm_Aux1LancReceb.close;
      end
    else
    if (formAnt=4) then
      with (frm_LancReceb2) do
      begin
        edtCodLoja.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_LOJA').AsFloat,2);
        edtCodCli.text  := form_nz(strtofloat(frm_Aux1LancReceb.edtCodigo.text),6);
        edtCodCont.text := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('CR_CODI').AsFloat,6);
        edtNPre.text    := form_nz(frm_Aux1LancReceb.qContrato.fieldbyname('PC_NPRE').AsFloat,2);
        edtNPre.setfocus;
        frm_Aux1LancReceb.close;
      end;
  if (key=K_ESC) then
    SAIR1.click;
end;

procedure Tfrm_Aux1LancReceb.edtcodigoDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    left:=20;
    top :=76;
    edit:=edtCodigo;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_Aux1LancReceb.qContratoCalcFields(DataSet: TDataSet);
begin
  with (qContrato) do
  begin
    fieldbyname('cTOTAL').AsString   := form_nc(fieldbyname('CR_TOTA').AsFloat,15);
    fieldbyname('cENTRADA').AsString := form_nc(fieldbyname('CR_VENT').AsFloat,15);
    fieldbyname('cVALOR').AsString   := form_nc(fieldbyname('PC_VALO').AsFloat,15);
    if (fieldbyname('PC_STAT').AsString='0') then
      fieldbyname('situacao').AsString:='Em aberto'
    else
    if (fieldbyname('PC_STAT').AsString='1') then
      fieldbyname('situacao').AsString:='Quitada ';
  end;
end;

procedure Tfrm_Aux1LancReceb.FormActivate(Sender: TObject);
begin
     {configurando o criterio de busca pelas prestacoes ***}
  if (not qContrato.active) then
    if (flagStatus='0') then
    begin
      Panel2.caption:='[Prestações em aberto do cliente]';
      qContrato.sql.clear;
      qContrato.sql.add('SELECT *                                            ');
      qContrato.sql.add('FROM CRECTABR,CREPRABR                              ');
      qContrato.sql.add('WHERE (CR_CLIE=:cliente) AND                        ');
      qContrato.sql.add('      (CR_CODI=PC_CONT) AND (CR_CLIE=PC_CLIE) AND   ');
      qContrato.sql.add('      (PC_STAT='+chr(39)+'0'+chr(39)+')             ');
      qContrato.sql.add('ORDER BY CR_LOJA,CR_DNOT,CR_CODI,PC_NPRE            ');
    end
    else
    if (flagStatus='1') then
    begin
      Panel2.caption:='[Prestações quitadas do cliente]';
      qContrato.sql.clear;
      qContrato.sql.add('SELECT *                                            ');
      qContrato.sql.add('FROM CRECTABR,CREPRABR                              ');
      qContrato.sql.add('WHERE (CR_CLIE=:cliente) AND                        ');
      qContrato.sql.add('      (CR_CODI=PC_CONT) AND (CR_CLIE=PC_CLIE) AND   ');
      qContrato.sql.add('      (PC_STAT='+chr(39)+'1'+chr(39)+')             ');
      qContrato.sql.add('ORDER BY CR_LOJA,CR_DNOT,CR_CODI,PC_NPRE            ');
    end
    else
    if (flagStatus='2') then
    begin
      Panel2.caption:='[Prestações cliente (em aberto/quitadas)]';
      qContrato.sql.clear;
      qContrato.sql.add('SELECT *                                            ');
      qContrato.sql.add('FROM CRECTABR,CREPRABR                              ');
      qContrato.sql.add('WHERE (CR_CLIE=:cliente) AND                        ');
      qContrato.sql.add('      (CR_CODI=PC_CONT) AND (CR_CLIE=PC_CLIE)       ');
      qContrato.sql.add('ORDER BY CR_LOJA,CR_DNOT,CR_CODI,PC_NPRE            ');
    end     
    else
    if (flagStatus='4') then
    begin
      Panel2.caption:='[Prestações cliente (em aberto)]';
      qContrato.sql.clear;
      qContrato.sql.add('SELECT *                                            ');
      qContrato.sql.add('FROM CRECTABR,CREPRABR                              ');
      qContrato.sql.add('WHERE      (CR_CODI=PC_CONT) AND (CR_CLIE=PC_CLIE)       ');
      if trim(Frm_LancReceb2.EdtCodCli.Text) <> '' then
      begin
        qContrato.sql.add('AND (CR_CLIE=:cliente)');
        QCOntrato.ParamByName('Cliente').AsFloat := StrtoFloatN(Frm_LancReceb2.EdtCodCli.Text);
      end;
      if Frm_LancReceb2.FlagLoja  then
      begin
        qContrato.sql.add('AND (CR_LOJA=:Loja)');
        QCOntrato.ParamByName('LOja').AsFloat := StrtoFloatN(Frm_LancReceb2.EdtLoja.Text);
      end;
      qContrato.sql.add('And PC_STAT <> ''1''  ');
      qContrato.sql.add('ORDER BY CR_LOJA,CR_DNOT,CR_CODI,PC_NPRE            ');
      EdtCodigo.text := Frm_LancReceb2.EdtCodCli.Text;
      Desmarcarcliente1.OnClick(Sender);
      if not QContrato.Eof then
        Grade.SetFocus;
    end;
end;

end.
