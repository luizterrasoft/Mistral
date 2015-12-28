unit unPropostaCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Buttons, Menus, Db, DBTables, QuickRpt, Qrctrls;

type
  Tfrm_PropostaCredito = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    LerarquivoUNIMED1: TMenuItem;
    N3: TMenuItem;
    SAIR1: TMenuItem;
    listaProposta: TQuickRep;
    Panel1: TPanel;
    Label1: TLabel;
    edtCliente: TMaskEdit;
    edtContrato: TMaskEdit;
    qContrato: TQuery;
    qContratoCR_CLIE: TFloatField;
    qContratoCR_CODI: TFloatField;
    qContratoCR_LOJA: TFloatField;
    qContratoCR_NOTA: TStringField;
    qContratoCR_SERI: TStringField;
    qContratoCR_DNOT: TDateTimeField;
    qContratoCR_AVAL: TFloatField;
    qContratoCR_PORT: TFloatField;
    qContratoCR_TOTA: TFloatField;
    qContratoCR_VENT: TFloatField;
    qContratoCR_PLAN: TFloatField;
    qContratoCR_QPRE: TFloatField;
    qContratoCR_PDEV: TFloatField;
    qContratoCR_FATO: TFloatField;
    qContratoCR_CARN: TStringField;
    qContratoCR_FICH: TStringField;
    qContratoCR_VDEV: TFloatField;
    qContratoCR_DTRA: TDateTimeField;
    qContratoCR_TOT2: TFloatField;
    qContratoCR_BOLE: TStringField;
    qContratocTOT2: TStringField;
    qContratocTOTA: TStringField;
    qContratocLOJA: TStringField;
    qContratocCPF: TStringField;
    qContratoCL_NOME: TStringField;
    qContratoCL_CPF: TStringField;
    qContratoCL_ENDE: TStringField;
    qContratoCL_BAIR: TStringField;
    qContratoCL_CIDA: TStringField;
    qContratoCL_ESTA: TStringField;
    qContratoCL_CEP: TStringField;
    qContratoCL_FONE: TStringField;
    qContratoCL_DTNA: TDateTimeField;
    qContratoCL_IDEN: TStringField;
    qContratoCL_OEXP: TStringField;
    qContratoCL_CONJ: TStringField;
    qContratoCL_NPAI: TStringField;
    qContratoCL_NMAE: TStringField;
    qContratoCL_EMPR: TStringField;
    qContratoCL_CARG: TStringField;
    qContratoCL_EEMP: TStringField;
    qContratoCL_FEMP: TStringField;
    qContratoCL_REMP: TStringField;
    qContratoCL_DADM: TDateTimeField;
    qContratoCL_CPRO: TStringField;
    qContratoCL_SALA: TFloatField;
    qContratoCL_REF1: TStringField;
    qContratoCL_REF2: TStringField;
    qContratoCL_TRF1: TStringField;
    qContratoCL_TRF2: TStringField;
    banda1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlb_caixaSim: TQRLabel;
    QRLabel5: TQRLabel;
    qrlb_caixaNao: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText32: TQRDBText;
    qContratocPlano: TStringField;
    QRLabel84: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRDBText34: TQRDBText;
    qContratocVEnt: TStringField;
    QRLabel88: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    qrlb_venc1: TQRLabel;
    qrlb_venc2: TQRLabel;
    qrlb_venc3: TQRLabel;
    qrlb_venc4: TQRLabel;
    QRLabel95: TQRLabel;
    qrlb_venc5: TQRLabel;
    QRLabel96: TQRLabel;
    qrlb_venc6: TQRLabel;
    QRLabel97: TQRLabel;
    qrlb_venc7: TQRLabel;
    QRLabel98: TQRLabel;
    qrlb_venc8: TQRLabel;
    qContratocSala: TStringField;
    qContratoCL_ECIV: TStringField;
    qContratoCL_QTDC: TFloatField;
    qContratocQpre: TStringField;
    qrlb_valor1: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    qContratocClCodi: TStringField;
    rdFrenteVerso: TRadioGroup;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbF8Mens: TLabel;
    lbF8: TLabel;
    Panel5: TPanel;
    btnImprimir: TSpeedButton;
    Panel6: TPanel;
    qContratoCL_CODI: TFloatField;
    qContratocCR_CODI: TStringField;
    qContratocCL_DTNA: TStringField;
    qContratocCL_DADM: TStringField;
    banda2: TQRSubDetail;
    qCheques: TQuery;
    qChequesPC_NPRE: TFloatField;
    qChequesPC_VALO: TFloatField;
    qChequesPC_FATO: TFloatField;
    qChequesPC_DCON: TDateTimeField;
    qChequesPC_DVTO: TDateTimeField;
    qChequesPC_DTPG: TDateTimeField;
    qChequesPC_LOJA: TFloatField;
    qChequesPC_PORT: TFloatField;
    qChequesPC_AVAL: TFloatField;
    qChequesPC_PLAN: TFloatField;
    qChequesPC_LJPG: TFloatField;
    qChequesPC_VPAG: TFloatField;
    qChequesPC_SALD: TFloatField;
    qChequesPC_STAT: TStringField;
    qChequesPC_CONT: TFloatField;
    qChequesPC_CLIE: TFloatField;
    qChequesPC_CHEQ: TFloatField;
    qChequesPC_TPRE: TFloatField;
    qChequesPC_DTRA: TDateTimeField;
    qChequesPC_CCGC: TStringField;
    qChequesPC_BANC: TFloatField;
    qChequesPC_AGEN: TStringField;
    qChequesPC_NUME: TFloatField;
    qChequesPC_TIME: TDateTimeField;
    qChequesCH_CODI: TFloatField;
    qChequesCH_CCGC: TStringField;
    qChequesCH_BANC: TFloatField;
    qChequesCH_NUME: TFloatField;
    qChequesCH_DTCT: TDateTimeField;
    qChequesCH_NOME: TStringField;
    qChequesCH_FONE: TStringField;
    qChequesCH_LOJA: TFloatField;
    qChequesCH_DVTO: TDateTimeField;
    qChequesCH_PORT: TFloatField;
    qChequesCH_AGEN: TStringField;
    qChequesCH_DTRA: TDateTimeField;
    qChequesCH_TRAN: TSmallintField;
    qChequesCH_VALO: TFloatField;
    qChequesCH_CLIE: TFloatField;
    qChequesCH_STAT: TStringField;
    qChequesCH_OBS: TStringField;
    qChequesCH_TIME: TDateTimeField;
    QRDBText31: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    banda3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    qChequescCh_valo: TStringField;
    QRDBText41: TQRDBText;
    procedure SAIR1Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteDblClick(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtContratoEnter(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtContratoExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure LerarquivoUNIMED1Click(Sender: TObject);
    procedure edtContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure banda1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure rdFrenteVersoClick(Sender: TObject);
    procedure qChequesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer;  {0-> imprime no menu principal ,1-> imprime direto do contrato}
    jaImprimiu: Boolean;
  end;

var
  frm_PropostaCredito: Tfrm_PropostaCredito;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, f8Clientes, unDialogo, auxiliar,
  unVersoPropostaCredito;

procedure Tfrm_PropostaCredito.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_PropostaCredito.Panel6Click(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_PropostaCredito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_PropostaCredito.edtClienteDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    edit:=edtCliente;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_PropostaCredito.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtCliente;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtContrato.setfocus;
end;

procedure Tfrm_PropostaCredito.edtClienteEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PropostaCredito.edtContratoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PropostaCredito.edtClienteExit(Sender: TObject);
begin
  if (trim(edtCliente.text)<>'') then
    edtCliente.text:=form_nz(strtofloat(Trim(edtCliente.text)),6);
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_PropostaCredito.edtContratoExit(Sender: TObject);
begin
  if (trim(edtContrato.text)<>'') then
    edtContrato.text:=form_nz(strtofloat(Trim(edtContrato.text)),6);
end;

procedure Tfrm_PropostaCredito.btnImprimirClick(Sender: TObject);
begin
  LerarquivoUNIMED1.click;
  if (Modo=1) then
    frm_PropostaCredito.close;
end;

procedure Tfrm_PropostaCredito.FormActivate(Sender: TObject);
begin
  if (Modo=0) then
    edtCliente.setfocus
  else
  if (Modo=1) then
    if (not jaImprimiu) then
    begin
      btnImprimir.click;
      jaImprimiu:=true;
    end;
end;

procedure Tfrm_PropostaCredito.Limparformulrio1Click(Sender: TObject);
begin
  edtCliente.text:='';
  edtContrato.text:='';
  edtCliente.setfocus;
end;

procedure Tfrm_PropostaCredito.LerarquivoUNIMED1Click(Sender: TObject);
begin
     {CRITICA}
  if (Trim(edtContrato.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O número do contrato não pode ficar vazio!',
      'Cobrança',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
      250,200);
    edtContrato.setfocus;
  end
  else
  if (Trim(edtCliente.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código do cliente não pode ficar vazio!',
      'Cobrança',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
      250,200);
    edtCliente.setfocus;
  end
  else
  begin
    qContrato.close;
    qContrato.parambyname('cliente').AsFloat  := strtofloat(Trim(edtCliente.text));
    qContrato.parambyname('contrato').AsFloat := strtofloat(Trim(edtContrato.text));
    qContrato.open;
    if (qContrato.recordcount<>0) then
    begin
      if (rdFrenteVerso.itemindex=0) then
        listaProposta.preview
      else
        frm_VersoProposta.listaVersoProposta.preview;
    end
    else
      frmDialogo.ExibirMensagem (' Contrato não encontrado! '
        ,'Proposta de crédito',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end;
end;

procedure Tfrm_PropostaCredito.edtContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtCliente.setfocus;
  if (key=K_ENTER) then
    btnImprimir.click;
end;

procedure Tfrm_PropostaCredito.banda1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  clAux: TClassAuxiliar;
begin
  with (qContrato) do
  begin
    if (fieldbyname('CL_QTDC').AsInteger=1) then
      qrlb_caixaNao.caption:='X'
    else
      qrlb_caixaSim.caption:='X';

          {...}
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('Select PC_NPRE,PC_VALO,PC_DVTO                               ');
    clAux.AddParam ('From CREPRABR                                                ');
    clAux.AddParam ('Where (PC_CLIE='+fieldbyname('CR_CLIE').AsString+') AND      ');
    clAux.AddParam ('      (PC_CONT='+fieldbyname('CR_CODI').AsString+')          ');
    clAux.AddParam ('Order by PC_NPRE                                             ');
    if (clAux.Execute) then
    begin
      clAux.first;
      qrlb_valor1.caption := form_nc(clAux.result('PC_VALO'),10);
      qrlb_venc1.caption  := ' '+form_data(clAux.result('PC_DVTO'));
      clAux.next;
      if (not clAux.eof) then
        qrlb_venc2.caption := ' '+form_data(clAux.result('PC_DVTO'));
      clAux.next;
      if (not clAux.eof) then
        qrlb_venc3.caption := ' '+form_data(clAux.result('PC_DVTO'));
      clAux.next;
      if (not clAux.eof) then
        qrlb_venc4.caption := ' '+form_data(clAux.result('PC_DVTO'));
      clAux.next;
      if (not clAux.eof) then
        qrlb_venc5.caption := ' '+form_data(clAux.result('PC_DVTO'));
      clAux.next;
      if (not clAux.eof) then
        qrlb_venc6.caption := ' '+form_data(clAux.result('PC_DVTO'));
      clAux.next;
      if (not clAux.eof) then
        qrlb_venc7.caption := ' '+form_data(clAux.result('PC_DVTO'));
      clAux.next;
      if (not clAux.eof) then
        qrlb_venc8.caption := ' '+form_data(clAux.result('PC_DVTO'));
    end;
    clAux.desconect;
    clAux.Free;
  end;
  with (qCheques) do
  begin
    close;
    parambyname('cliente').AsFloat  := qContrato.fieldbyname('CR_CLIE').AsFloat;
    parambyname('contrato').AsFloat := qContrato.fieldbyname('CR_CODI').AsFloat;
    open;
  end;
end;

procedure Tfrm_PropostaCredito.qContratoCalcFields(DataSet: TDataSet);
begin
  with (qContrato) do
  begin
    fieldbyname('cPlano').AsString := form_nz(fieldbyname('CR_PLAN').AsFloat,3)+'/'+
      ProcuraTipoPlano(fieldbyname('CR_PLAN').AsFloat,self);
    fieldbyname('cVent').AsString  := form_nc(fieldbyname('CR_VENT').AsFloat,10);
    fieldbyname('cSala').AsString  := form_nc(fieldbyname('CL_SALA').AsFloat,10);
    fieldbyname('cTOT2').AsString  := form_nc(fieldbyname('CR_TOT2').AsFloat,10);
    fieldbyname('cTOTA').AsString  := form_nc(fieldbyname('CR_TOTA').AsFloat,10);
    fieldbyname('cLOJA').AsString  := form_nz(fieldbyname('CR_LOJA').AsFloat,2)+'/'+
      ProcuraNomeLoja(fieldbyname('CR_LOJA').AsFloat,self);
    fieldbyname('cCPF').AsString   := FormataCNPJ(fieldbyname('CL_CPF').AsString);
    fieldbyname('cQpre').AsString  := form_nz(fieldbyname('CR_QPRE').AsInteger,2);
    fieldbyname('cClCodi').AsString := form_nz(fieldbyname('CL_CODI').AsFloat,6);
    fieldbyname('cCR_Codi').AsString := form_nz(fieldbyname('CR_CODI').AsFloat,6);
    if (fieldbyname('CL_DTNA').AsDateTime=strtodate('01/01/1900')) then
      fieldbyname('cCL_DTNA').AsString:=''
    else
      fieldbyname('cCL_DTNA').AsString:=datetostr(fieldbyname('CL_DTNA').AsDateTime);
    if (fieldbyname('CL_DADM').AsDateTime=strtodate('01/01/1900')) then
      fieldbyname('cCL_DADM').AsString:=''
    else
      fieldbyname('cCL_DADM').AsString:=datetostr(fieldbyname('CL_DADM').AsDateTime);
  end;
end;

procedure Tfrm_PropostaCredito.FormCreate(Sender: TObject);
begin
  jaImprimiu:=false;
end;

procedure Tfrm_PropostaCredito.rdFrenteVersoClick(Sender: TObject);
begin
  edtCliente.setfocus;
end;

procedure Tfrm_PropostaCredito.qChequesCalcFields(DataSet: TDataSet);
begin
  qCheques.fieldbyname('cCh_Valo').AsString  :=
    form_nc(qCheques.fieldbyname('CH_VALO').AsFloat,10);
end;

end.
