unit unConsCheq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Buttons, Menus, Grids, DBGrids, DB, DBTables;

type
  Tfrm_ConsCheq = class(TForm)
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    Label1: TLabel;
    pnCabec: TPanel;
    Label17: TLabel;
    edtCodigo: TMaskEdit;
    btnExecutar: TSpeedButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Desmarcarcliente1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Imprimirconsulta1: TMenuItem;
    grade: TDBGrid;
    ds: TDataSource;
    qCheques: TQuery;
    SpeedButton2: TSpeedButton;
    pnCliente: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel7: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel8: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel9: TPanel;
    Label9: TLabel;
    Panel10: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    Panel11: TPanel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    qChequesCH_CCGC: TStringField;
    qChequesCH_NUME: TFloatField;
    qChequesCH_DTCT: TDateTimeField;
    qChequesCH_NOME: TStringField;
    qChequesCH_FONE: TStringField;
    qChequesCH_DVTO: TDateTimeField;
    qChequesCH_BANC: TFloatField;
    qChequesCH_AGEN: TStringField;
    qChequesCH_DTRA: TDateTimeField;
    qChequesCH_TRAN: TSmallintField;
    qChequesCH_VALO: TFloatField;
    qChequesCH_OBS: TStringField;
    qChequesCH_CLIE: TFloatField;
    qChequesCH_STAT: TStringField;
    qChequescNOMEPORT: TStringField;
    qPortador: TQuery;
    qPortadorPO_NOME: TStringField;
    qChequescVALOR: TStringField;
    qChequesCH_CODI: TFloatField;
    qChequesCH_LOJA: TFloatField;
    qChequesCH_PORT: TFloatField;
    qPortadorPO_CODI: TFloatField;
    rdSituacao: TRadioGroup;
    lbF8Mens: TLabel;
    lbF8: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoEnter(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure Desmarcarcliente1Click(Sender: TObject);
    procedure qChequesCalcFields(DataSet: TDataSet);
    procedure Imprimirconsulta1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsCheq: Tfrm_ConsCheq;

implementation

uses f8Clientes, principal, funcoes1, funcoes2, cliente, cheques, mem_prnt, procura;

{$R *.DFM}

procedure Tfrm_ConsCheq.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConsCheq.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ConsCheq.SpeedButton2Click(Sender: TObject);
begin
  Imprimirconsulta1.click;
end;

procedure Tfrm_ConsCheq.btnExecutarClick(Sender: TObject);
begin
  Desmarcarcliente1.click;
end;

procedure Tfrm_ConsCheq.edtCodigoDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodigo;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_ConsCheq.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnExecutar.click;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodigo;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do cliente: até 06 digitos - <F8/Duplo clique> Exibe clientes cadastrados ',10);
end;

procedure Tfrm_ConsCheq.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe clientes cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_ConsCheq.Limparformulrio1Click(Sender: TObject);
begin
  edtCodigo.text:='';
  pnCliente.caption:='';
  qCheques.close;
  qPortador.close;
  edtCodigo.setfocus;
end;

procedure Tfrm_ConsCheq.edtCodigoExit(Sender: TObject);
var
  codigo: String;
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    pnCliente.caption := ProcuraNomeClienteCod(strtofloat(Trim(edtCodigo.text)),self);
    codigo:=Trim(edtCodigo.text);
    edtCodigo.text    := form_nz(strtofloat(codigo),6);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

{Opcao de realizacao da consulta ***}
procedure Tfrm_ConsCheq.Desmarcarcliente1Click(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    qCheques.close;
    qCheques.parambyname('cliente').AsFloat:=strtofloat(Trim(edtCodigo.text));
    qCheques.open;
    qCheques.last;
    grade.setfocus;
  end;
end;

procedure Tfrm_ConsCheq.qChequesCalcFields(DataSet: TDataSet);
begin
  with (qCheques) do
  begin
    if (fieldbyname('cNOMEPORT').IsNull) then
    begin
      qPortador.close;
      qPortador.parambyname('codigo').AsFloat:=fieldbyname('CH_PORT').AsFloat;
      qPortador.open;
      if (not qPortador.eof) then
        fieldbyname('cNOMEPORT').AsString:=
          Copy(qPortador.fieldbyname('PO_NOME').AsString,1,16)
      else
        fieldbyname('cNOMEPORT').AsString:='<não encontrado>';
    end;
    fieldbyname('cVALOR').AsString:=form_nc(fieldbyname('CH_VALO').AsFloat,10);
  end;
end;

{Opcao de impressao da consulta ***}
procedure Tfrm_ConsCheq.Imprimirconsulta1Click(Sender: TObject);
var
  totcheq: Integer;
begin
     {Testando o CPF --->}
  if (Trim(edtCodigo.text)<>'') then
  begin
    mostra_mensagem('Preparando relatório...');
    with (frm_mem_print) do
    begin
            {configurando o gerador de relatorios}
      PrepareReport;
      frm_principal.x_col_impressao := 80;
      frm_principal.x_arq_impressao := 's02.rel';
      frm_principal.x_comando       := '12c';
      frm_principal.x_tam_fonte     := 12;
      Title:= 'CONSULTA DE CHEQUES DO CLIENTE';

            {inicializacoes}
      frm_principal.x_empresa := frm_principal.x_empresa;
      totcheq := 0;
      Title:= 'Consulta de cheques';
      qCheques.disablecontrols;
      qCheques.first;

            {cabecalhos}
      AddLine(form_tc('-',80,'-'));
      AddLine('Lj| Num. |  Data  | - - Dados do Cheque - -   |   Valor  | Data    | Portador');
      AddLine('  | Seq. | Emissao| Bco. Agencia    Numero    |          | Vencto  |Cod. Nome');
      AddLine(form_tc('-',80,'-'));
      while (not qCheques.eof) do
      begin
        AddLine(form_n    (qCheques.fieldbyname('CH_LOJA').AsFloat,3)     +' '+
          form_n    (qCheques.fieldbyname('CH_CODI').AsFloat,6)     +' '+
          form_data (qCheques.fieldbyname('CH_DTCT').AsDateTime)    +' '+
          form_nz   (qCheques.fieldbyname('CH_BANC').AsFloat,4)     +' '+
          form_t    (qCheques.fieldbyname('CH_AGEN').AsString,8)    +' '+
          form_t    (qCheques.fieldbyname('CH_NUME').AsString,10)   +' '+
          form_nc   (qCheques.fieldbyname('CH_VALO').AsFloat,10)    +' '+
          form_data (qCheques.fieldbyname('CH_DVTO').AsDateTime)    +' '+
          form_n    (qCheques.fieldbyname('CH_PORT').AsFloat,4)     +' '+
          form_t    (qCheques.fieldbyname('cNOMEPORT').AsString,6));
        totcheq := totcheq + 1;
        qCheques.next;
      end;
      AddLine(form_tc('-',80,'-'));
      AddLine('Total de cheques  ---> '+form_nz (totcheq,4));
      AddLine('');

            {salto de pagina}
      if (frm_principal.x_salto) then
        AddLine(chr(18)+chr(12))
      else
        AddLine(chr(18));
    end;
    frm_mem_print.windowstate:=wsMaximized;
    esconde_mensagem;
    frm_mem_print.showmodal;
    qCheques.enablecontrols;
  end;
end;

procedure Tfrm_ConsCheq.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

end.
