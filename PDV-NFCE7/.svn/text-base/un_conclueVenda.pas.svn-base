unit un_conclueVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, Mask, Menus, ComCtrls,
  Gauges;

type
  Tfrm_ConclueVenda = class(TForm)
    ds: TDataSource;
    qFormas: TQuery;
    qFormasVF_CAIX: TFloatField;
    qFormasVF_LOJA: TFloatField;
    qFormasVF_VEND: TFloatField;
    qFormasVF_FPGT: TFloatField;
    qFormasVF_VALO: TFloatField;
    qFormasnomeForma: TStringField;
    qFormasvalorPago: TStringField;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Inserirforma1: TMenuItem;
    qFormasVF_ORDE: TSmallintField;
    qFormasordem: TStringField;
    Limparedits1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    lblForma: TLabel;
    edtCodForma: TMaskEdit;
    pnForma: TPanel;
    Panel4: TPanel;
    grade: TDBGrid;
    Panel5: TPanel;
    botao_sair: TPanel;
    btnProcessar: TButton;
    Label3: TLabel;
    Label4: TLabel;
    pnSaldoAPagar: TPanel;
    pnTotalVenda: TPanel;
    Gauge1: TGauge;
    Label23: TLabel;
    Processarvenda1: TMenuItem;
    Label24: TLabel;
    edtVendedor: TMaskEdit;
    pnVendedor: TPanel;
    edtDesc: TMaskEdit;
    Label25: TLabel;
    Bevel4: TBevel;
    N2: TMenuItem;
    Label14: TLabel;
    Label22: TLabel;
    pnVendaReal: TPanel;
    PageControl1: TPageControl;
    paginaCheque: TTabSheet;
    Panel8: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    edtCodBanco: TMaskEdit;
    edtNomeBanco: TMaskEdit;
    edtCpf: TMaskEdit;
    edtAgencia: TMaskEdit;
    edtConta: TMaskEdit;
    edtNome: TMaskEdit;
    edtNumero: TMaskEdit;
    chFlag: TCheckBox;
    paginaCartao: TTabSheet;
    Panel7: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    edtCodAdm: TMaskEdit;
    pnAdm: TPanel;
    edtCartao: TMaskEdit;
    paginaCrediario: TTabSheet;
    Panel6: TPanel;
    lblCliente: TLabel;
    Label13: TLabel;
    Bevel3: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtCliente: TMaskEdit;
    edtContrato: TMaskEdit;
    edtTotalContrato: TMaskEdit;
    edtValorEntrada: TMaskEdit;
    edtValorFinanciado: TMaskEdit;
    Bevel2: TBevel;
    lblValor: TLabel;
    edtValor: TMaskEdit;
    N3: TMenuItem;
    Inserirformadepagamentovista1: TMenuItem;
    painelTroco: TPanel;
    Label16: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    pnTroco_: TPanel;
    edtRecebido_: TMaskEdit;
    edtValor_: TMaskEdit;
    lblStatus: TLabel;
    timer_lblStatus: TTimer;
    Bevel5: TBevel;
    Label2: TLabel;
    Label15: TLabel;
    edtFone: TMaskEdit;
    edtTotalDesc: TMaskEdit;
    edtCpf_crediario: TMaskEdit;
    Label1: TLabel;
    edtNome_crediario: TMaskEdit;
    qFormasaReceber: TStringField;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodFormaEnter(Sender: TObject);
    procedure edtCodFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qFormasCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure edtCodFormaExit(Sender: TObject);
    procedure edtCodFormaDblClick(Sender: TObject);
    procedure Inserirforma1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Limparedits1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtCodBancoEnter(Sender: TObject);
    procedure edtNomeBancoEnter(Sender: TObject);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtContaEnter(Sender: TObject);
    procedure edtAgenciaEnter(Sender: TObject);
    procedure edtCodBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAdmEnter(Sender: TObject);
    procedure edtCodAdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCartaoEnter(Sender: TObject);
    procedure edtCartaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAdmExit(Sender: TObject);
    procedure edtCodAdmDblClick(Sender: TObject);
    procedure edtContratoEnter(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfEnter(Sender: TObject);
    procedure edtTotalContratoEnter(Sender: TObject);
    procedure edtValorEntradaEnter(Sender: TObject);
    procedure edtValorFinanciadoEnter(Sender: TObject);
    procedure edtTotalContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorFinanciadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalContratoExit(Sender: TObject);
    procedure edtTotalContratoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorEntradaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorFinanciadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorEntradaExit(Sender: TObject);
    procedure edtValorFinanciadoExit(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure Processarvenda1Click(Sender: TObject);
    procedure edtDescEnter(Sender: TObject);
    procedure edtVendedorEnter(Sender: TObject);
    procedure edtVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescExit(Sender: TObject);
    procedure edtDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVendedorExit(Sender: TObject);
    procedure edtVendedorDblClick(Sender: TObject);
    procedure edtClienteDblClick(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorExit(Sender: TObject);
    procedure Inserirformadepagamentovista1Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValor_Enter(Sender: TObject);
    procedure edtValor_Exit(Sender: TObject);
    procedure edtValor_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValor_KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRecebido_Enter(Sender: TObject);
    procedure edtRecebido_Exit(Sender: TObject);
    procedure edtRecebido_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRecebido_KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeDblClick(Sender: TObject);
    procedure timer_lblStatusTimer(Sender: TObject);
    procedure edtFoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfExit(Sender: TObject);
    procedure edtCodBancoExit(Sender: TObject);
    procedure edtCodBancoDblClick(Sender: TObject);
    procedure edtTotalDescEnter(Sender: TObject);
    procedure edtTotalDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalDescExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorChange(Sender: TObject);
    procedure edtTotalContratoChange(Sender: TObject);
    procedure edtCpf_crediarioEnter(Sender: TObject);
    procedure edtCpf_crediarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNome_crediarioEnter(Sender: TObject);
    procedure edtNome_crediarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpf_crediarioExit(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    jaChamou: Boolean;
    tecla: Integer;
    x_caixa,x_loja,x_venda: Real;
    x_total_venda: Real; {armazena o total da venda efetuada}
    x_novo_total_venda: Real; {armazena o total de venda com desconto}
    x_saldo_venda: Real; {armazena o total que falta para ser pago}
    x_tipz: String; {define o 1/2}
    function ProximaOrdem(loja,caixa,venda: Real):Integer;
    function RetornaSaldoVenda:Real;
    function JaLancadoFormaPgto:Boolean;
    function GetValorAVistaReceber:Real;
    function GetEntrada(ordem: Integer):Real;
    function GetOrdemFormaPgto(codigo_forma: Real):Integer;
    function GetFormaPgtoAVista:Real;
    function JaLancouPgtoAVista:Boolean;
    function LancouValorMaiorSaldo:Boolean;
    procedure ExibeFormaPgto(codigo_forma,valor: Real);
    procedure ExclueFormaPgto(codigo_forma: Real);
    procedure RefrescaTabela;
    procedure LimparEditsPainel(painel: TPanel);
    procedure ExibeStatus(valor: Real);
    procedure FocusControleCheque(controle: TWinControl; direcao: Boolean);
  end;

var
  frm_ConclueVenda: Tfrm_ConclueVenda;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,auxiliar, un_F8Adm, f8Vend,
  un_VerDadosPgto, DM8, caixas, unDialogo, f8Clientes, un_frmConsulta1, DM2,
  f8Bancos;

procedure Tfrm_ConclueVenda.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConclueVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (shift=[ssShift]) then
  begin
    if (key=K_F5) then
    begin
      x_tipz:='2';
      Processarvenda1.click;
    end;
  end
  else
  if (shift=[ssCtrl]) then
  begin
          {descontos}
    if (key=Ord('D')) or (key=Ord('d')) then
      if (edtDesc.color=clWhite) then
      begin
        edtDesc.color           := clBlack;
        edtDesc.font.color      := clWhite;
        edtDesc.readonly        := true;
        edtTotalDesc.color      := clWhite;
        edtTotalDesc.font.color := clBlack;
        edtTotalDesc.readonly   := false;
        edtDesc.text            := '0,00';
        edtDescExit(Sender);
        edtTotalDesc.setfocus;
      end
      else
      begin
        edtDesc.color           := clWhite;
        edtDesc.font.color      := clBlack;
        edtDesc.readonly        := false;
        edtTotalDesc.color      := clBlack;
        edtTotalDesc.font.color := clWhite;
        edtTotalDesc.readonly   := true;
        edtTotalDesc.text       := '0,00';
        edtTotalDescExit(Sender);
        edtDesc.setfocus;
      end;
  end
  else
  begin
    if (key=K_ESC) then
      close;
    if (key=K_F5) then
    begin
      x_tipz:='1';
      Processarvenda1.click;
    end;
  end;
end;

procedure Tfrm_ConclueVenda.edtCodFormaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCodFormaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_F8) then
    if (x_saldo_venda>0.00) then
      ChamandoF8FormaPgto (edtCodForma,false)
    else
    if (not JaLancouPgtoAVista) then
      ChamandoF8FormaPgto_AVista (edtCodForma,false);
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (not JaLancouPgtoAVista) then
    begin
      if (Trim(edtCodForma.text)='') then
        btnProcessar.click
      else
      begin
        edtValor.visible:=true;
        lblValor.visible:=true;
        if (x_saldo_venda>0.00) then
          edtValor.setfocus
        else
        if (GetValorAVistaReceber>0.00) then
        begin
          edtValor.visible    := false;
          lblValor.visible    := false;
          painelTroco.visible := true;
          edtValor_.text      := form_nc(GetValorAVistaReceber,18);

                          {*** paginas}
          PageControl1.visible          := false;
          PaginaCrediario.tabvisible    := false;
          PaginaCheque.tabvisible       := false;
          PaginaCartao.tabvisible       := false;

                          {***********************************************}
          if (strtofloat(Trim(edtCodForma.text))=1) then {* Dinheiro}
          begin
            edtRecebido_.color            := clWhite;
            edtRecebido_.font.color       := clBlack;
            edtRecebido_.readonly         := false;
            edtRecebido_.setfocus;
          end
          else
          if (strtofloat(Trim(edtCodForma.text))=2) then {* Cheque a vista}
          begin
            edtRecebido_.color            := clWhite;
            edtRecebido_.font.color       := clBlack;
            edtRecebido_.readonly         := false;
            PageControl1.activepageindex  := 0;
            PageControl1.visible          := true;
            PageControl1.height           := 192;
            LimparEditsPainel(Panel8);
            edtCpf.setfocus;
          end
          else
          if (strtofloat(Trim(edtCodForma.text))=3) then {* Debito automatico}
          begin
            PageControl1.activepageindex  := 1;
            PageControl1.visible          := true;
            PageControl1.height           := 120;
            LimparEditsPainel(Panel7);
            edtRecebido_.text             := edtValor_.text;
            edtRecebido_.color            := clBlack;
            edtRecebido_.font.color       := clWhite;
            edtRecebido_.readonly         := true;
            edtCodAdm.setfocus;
          end;
        end;
      end;
    end
    else
    if (Trim(edtCodForma.text)='') then
      btnProcessar.click
    else
      edtValor.setfocus;
  if (key=K_CIMA) then
    if (edtDesc.color=clWhite) then
      edtDesc.setfocus
    else
      edtTotalDesc.setfocus;
end;

procedure Tfrm_ConclueVenda.qFormasCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (qFormas) do
  begin
    if (fieldbyname('nomeForma').IsNull) then
      fieldbyname('nomeForma').AsString :=
        ProcuraNomeFormaPgto(fieldbyname('VF_FPGT').AsFloat,self);
    if (fieldbyname('valorPago').IsNull) then
      fieldbyname('valorPago').AsString :=
        form_nc(fieldbyname('VF_VALO').AsFloat,8);
    if (fieldbyname('ordem').IsNull) then
      fieldbyname('ordem').AsString :=
        form_nz(fieldbyname('VF_ORDE').AsInteger,2);
    if (fieldbyname('aReceber').IsNull) then
      if (fieldbyname('VF_FPGT').AsFloat=1) then {* a vista}
        fieldbyname('aReceber').AsString :=
          form_nc(fieldbyname('VF_VALO').AsFloat,8)
      else
      if (fieldbyname('VF_FPGT').AsFloat=2) then {* crediario}
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('CAIXA',self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT CR_VENT FROM CREDIARIOS_LOCAL   ');
        clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND           ');
        clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND           ');
        clAux.AddParam ('      (CR_VEND=:CR_VEND) AND           ');
        clAux.AddParam ('      (CR_ORDE=:CR_ORDE)               ');
        clAux.consulta.parambyname('CR_LOJA').AsFloat := x_loja;
        clAux.consulta.parambyname('CR_CAIX').AsFloat := x_caixa;
        clAux.consulta.parambyname('CR_VEND').AsFloat := x_venda;
        clAux.consulta.parambyname('CR_ORDE').AsInteger := fieldbyname('VF_ORDE').AsInteger;
        if (clAux.Execute) then
          fieldbyname('aReceber').AsString :=
            form_nc(clAux.result('CR_VENT'),8)
        else
          fieldbyname('aReceber').AsString :='';
        clAux.desconect;
        clAux.Free;
      end
      else
      if (fieldbyname('VF_FPGT').AsFloat=2) then {* cartao de credito}
        fieldbyname('aReceber').AsString := '';
  end;
end;

procedure Tfrm_ConclueVenda.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (not JaChamou) then
  begin
          {*** Atualizando a venda}
    clAux := TClassAuxiliar.Create;
    clAux.conect ('CAIXA',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VENDAS          ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja) AND     ');
    clAux.AddParam ('      (VE_CAIX=:caixa) AND    ');
    clAux.AddParam ('      (VE_CODI=:codigo_venda) ');
    clAux.consulta.parambyname('loja').AsFloat         := x_loja;
    clAux.consulta.parambyname('caixa').AsFloat        := x_caixa;
    clAux.consulta.parambyname('codigo_venda').AsFloat := x_venda;
    clAux.Execute;
    clAux.desconect;
    clAux.Free;
    jaChamou:=true;
  end;
  if (Trim(pnVendaReal.caption)='') then
    pnVendaReal.caption:=form_nc(x_total_venda,10);
  if (Trim(pnTotalVenda.caption)='') then
    pnTotalVenda.caption:=form_nc(x_novo_total_venda,10);
  if (x_saldo_venda=0.00) then
  begin
    x_saldo_venda := RetornaSaldoVenda;
    ExibeStatus(x_saldo_venda);
    pnSaldoAPagar.caption:=form_nc(x_saldo_venda,10);
  end;
  RefrescaTabela;
  edtVendedor.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCodFormaExit(Sender: TObject);
var
  continua: Boolean;
  codigo: String;
begin
  if (x_saldo_venda>0.00) then
    continua:=true
  else
  if (not JaLancouPgtoAVista) then
    continua:=true
  else
    continua:=false;
  codigo := Trim(edtCodForma.text);
  if (codigo<>'') and (continua) then
  begin
    edtCodForma.text:=form_nz(strtofloat(codigo),2);
    if (x_saldo_venda=0.00) then
      codigo:='1'+floattostr(strtofloat(codigo));
    pnForma.caption:=ProcuraNomeFormaPgto(strtofloat(codigo),self);
  end;
end;

procedure Tfrm_ConclueVenda.edtCodFormaDblClick(Sender: TObject);
begin
  if (x_saldo_venda>0.00) then
    ChamandoF8FormaPgto (edtCodForma,false)
  else
  if (not JaLancouPgtoAVista) then
    ChamandoF8FormaPgto_AVista (edtCodForma,false);
end;

procedure Tfrm_ConclueVenda.Inserirforma1Click(Sender: TObject);
var
  valor_entrada,valor_troco: Real;
  sequencia_ordem: Integer;
  clAux: TClassAuxiliar;
begin
     {CRITICA AOS DADOS}
  if (Trim(edtCodForma.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Informe o código da forma de pgto!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodForma.setfocus;
  end
  else
  if (JaLancadoFormaPgto) then
  begin
    frmDialogo.ExibirMensagem ('Esta forma de pgto. já foi informada!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodForma.setfocus;
  end
  else
  if (Trim(edtValor.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Informe o valor a ser pago!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  if (strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)))=0.00) then
  begin
    frmDialogo.ExibirMensagem ('Informe o valor a ser pago!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  if (LancouValorMaiorSaldo) then
  begin
    frmDialogo.ExibirMensagem ('O valor informado é maior que o saldo a pagar!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  if (Trim(edtCodAdm.text)='') and {** - cartao}
    (Trim(edtCodForma.text)='03') then
  begin
    frmDialogo.ExibirMensagem ('Informe a administradora do cartão!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (Trim(edtCartao.text)='') and {** - cartao}
    (Trim(edtCodForma.text)='03') then
  begin
    frmDialogo.ExibirMensagem ('Informe o número do cartão!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCartao.setfocus;
  end
  else
  if (Trim(edtTotalContrato.text)='') and {** - crediario}
    (Trim(edtCodForma.text)='02') then
  begin
    frmDialogo.ExibirMensagem ('Informe o total do contrato!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtTotalContrato.setfocus;
  end
  else
  begin
          {****** - Lancando a forma de pagamento normal }
    sequencia_ordem := ProximaOrdem(x_loja,x_caixa,x_venda); {****}
    clAux           := TClassAuxiliar.Create;
    clAux.conect   ('CAIXA',self);
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO VENDAS_FORMA_PAGAMENTO_LOCAL       ');
    clAux.AddParam (' (VF_CAIX,VF_LOJA,VF_VEND,VF_FPGT,             ');
    clAux.AddParam ('  VF_ORDE,VF_VALO)                             ');
    clAux.AddParam ('VALUES                                         ');
    clAux.AddParam (' (:VF_CAIX,:VF_LOJA,:VF_VEND,:VF_FPGT,         ');
    clAux.AddParam ('  :VF_ORDE,:VF_VALO)                           ');
    clAux.consulta.parambyname('VF_LOJA').AsFloat   := x_loja;
    clAux.consulta.parambyname('VF_CAIX').AsFloat   := x_caixa;
    clAux.consulta.parambyname('VF_VEND').AsFloat   := x_venda;
    clAux.consulta.parambyname('VF_FPGT').AsFloat   := strtofloat(Trim(edtCodForma.text));
    clAux.consulta.parambyname('VF_ORDE').AsInteger := sequencia_ordem;
    if (Trim(edtCodForma.text)='02') then {Crediario}
    begin
      if (Trim(edtTotalContrato.text)<>'') then
        clAux.consulta.parambyname('VF_VALO').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtTotalContrato.text)))
      else
        clAux.consulta.parambyname('VF_VALO').AsFloat := 0;
    end {A Vista/Cartao}
    else
      clAux.consulta.parambyname('VF_VALO').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
    clAux.Execute;
    clAux.desconect;
    clAux.Free;

          {****** - Cartao de credito *********************************************}
    if (Trim(edtCodForma.text)='03') then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect ('CAIXA',self);
      clAux.ClearSql;
      clAux.AddParam ('INSERT INTO CARTOES_LOCAL                                      ');
      clAux.AddParam (' (CA_CAIX,CA_LOJA,CA_VEND,CA_NUME,CA_ORDE,CA_CADM)       ');
      clAux.AddParam ('VALUES                                                   ');
      clAux.AddParam (' (:CA_CAIX,:CA_LOJA,:CA_VEND,:CA_NUME,:CA_ORDE,:CA_CADM) ');
      clAux.consulta.parambyname('CA_LOJA').AsFloat   := x_loja;
      clAux.consulta.parambyname('CA_CAIX').AsFloat   := x_caixa;
      clAux.consulta.parambyname('CA_VEND').AsFloat   := x_venda;
      if (Trim(edtCodAdm.text)<>'') then
        clAux.consulta.parambyname('CA_CADM').AsInteger  := strtoint(edtCodAdm.text)
      else
        clAux.consulta.parambyname('CA_CADM').AsInteger  := 0;
      clAux.consulta.parambyname('CA_NUME').AsString  := Trim(edtCartao.text);
      clAux.consulta.parambyname('CA_ORDE').AsInteger := sequencia_ordem; {****}
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
    end
    else {****** - A Vista}
    if (Trim(edtCodForma.text)='01') then
          {nao faz nada por enquanto}
    else {****** - Crediario}
    if (Trim(edtCodForma.text)='02') then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect ('CAIXA',self);
      clAux.ClearSql;
      clAux.AddParam ('INSERT INTO CREDIARIOS_LOCAL                           ');
      clAux.AddParam (' (CR_CAIX,CR_LOJA,CR_VEND,CR_ORDE,CR_CLIE,             ');
      clAux.AddParam ('  CR_CODI,CR_TOTA,CR_VENT,CR_FINA,CR_RECE,             ');
      clAux.AddParam ('  CR_CPF,CR_NOME)                                      ');
      clAux.AddParam ('VALUES                                                 ');
      clAux.AddParam (' (:CR_CAIX,:CR_LOJA,:CR_VEND,:CR_ORDE,:CR_CLIE,        ');
      clAux.AddParam ('  :CR_CODI,:CR_TOTA,:CR_VENT,:CR_FINA,:CR_RECE,        ');
      clAux.AddParam ('  :CR_CPF,:CR_NOME)                                    ');
      clAux.consulta.parambyname('CR_LOJA').AsFloat   := x_loja;
      clAux.consulta.parambyname('CR_CAIX').AsFloat   := x_caixa;
      clAux.consulta.parambyname('CR_VEND').AsFloat   := x_venda;
      clAux.consulta.parambyname('CR_ORDE').AsInteger := sequencia_ordem; {***}
      if (Trim(edtCliente.text)<>'') then
        clAux.consulta.parambyname('CR_CLIE').AsFloat := strtofloat(Trim(edtCliente.text))
      else
        clAux.consulta.parambyname('CR_CLIE').AsFloat := 0;
      clAux.consulta.parambyname('CR_CPF').AsString := Trim(edtCpf_crediario.text);
      clAux.consulta.parambyname('CR_NOME').AsString := Trim(edtNome_crediario.text);
      if (Trim(edtContrato.text)<>'') then
        clAux.consulta.parambyname('CR_CODI').AsFloat := strtofloat(Trim(edtContrato.text))
      else
        clAux.consulta.parambyname('CR_CODI').AsFloat := 0;
      if (Trim(edtTotalContrato.text)<>'') then
        clAux.consulta.parambyname('CR_TOTA').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtTotalContrato.text)))
      else
        clAux.consulta.parambyname('CR_TOTA').AsFloat := 0.00;
      if (Trim(edtValorEntrada.text)<>'') then
        clAux.consulta.parambyname('CR_VENT').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtValorEntrada.text)))
      else
        clAux.consulta.parambyname('CR_VENT').AsFloat := 0.00;
      if (Trim(edtValorFinanciado.text)<>'') then
        clAux.consulta.parambyname('CR_FINA').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtValorFinanciado.text)))
      else
        clAux.consulta.parambyname('CR_FINA').AsFloat := 0.00;
      clAux.consulta.parambyname('CR_RECE').AsFloat := 0.00;
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
    end;

          {...}
    RefrescaTabela;
    x_saldo_venda         := RetornaSaldoVenda;
    ExibeStatus(x_saldo_venda);
    pnSaldoAPagar.caption := form_nc(x_saldo_venda,10);
    Limparedits1.click;
  end;
end;

function Tfrm_ConclueVenda.ProximaOrdem(loja,caixa,venda: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect ('CAIXA',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(VF_ORDE) as MAXIMA_ORDEM  ');
  clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL        ');
  clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND         ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND         ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)             ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat   := x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat   := x_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat   := x_venda;
  clAux.Execute;
  result := clAux.result('MAXIMA_ORDEM') + 1;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_ConclueVenda.RefrescaTabela;
begin
  with (qFormas) do
  begin
    close;
    parambyname('caixa').AsFloat        := x_caixa;
    parambyname('loja').AsFloat         := x_loja;
    parambyname('codigo_venda').AsFloat := x_venda;
    open;
  end;
end;

function Tfrm_ConclueVenda.RetornaSaldoVenda:Real;
var
  dif: Real;
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect ('CAIXA',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(VF_VALO) as TOTAL_PAGO    ');
  clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL        ');
  clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND         ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND         ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)             ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat   := x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat   := x_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat   := x_venda;
  clAux.Execute;
  dif := x_novo_total_venda - clAux.result('TOTAL_PAGO');
  if (dif<0) then
    result:=0.00
  else
    result := dif;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_ConclueVenda.FormCreate(Sender: TObject);
begin
  tecla:=27;
  jaChamou:=false;
  x_tipz                     := '1'; {***}
  x_total_venda              := 0.00;
  x_novo_total_venda         := 0.00;
  x_saldo_venda              := 0.00;
  PageControl1.visible       :=false;
  paginaCheque.tabvisible    :=false;
  paginaCartao.tabvisible    :=false;
  PaginaCrediario.tabvisible :=false;
  lblStatus.visible          :=false;
end;

procedure Tfrm_ConclueVenda.Limparedits1Click(Sender: TObject);
begin
  edtCodForma.text              := '';
  edtValor.text                 := '';
  pnForma.caption               := '';
  PageControl1.visible          := false;
  paginaCheque.tabvisible       := false;
  paginaCartao.tabvisible       := false;
  PaginaCrediario.tabvisible    := false;
  edtValor.visible              := true;
  lblValor.visible              := true;
  if (x_saldo_venda>0.00) then
  begin
    painelTroco.visible      := false;
    edtRecebido_.color       := clWhite;
    edtRecebido_.font.color  := clBlack;
    edtRecebido_.readonly    := false;
  end;
  edtCodForma.setfocus;
end;

procedure Tfrm_ConclueVenda.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ConclueVenda.edtCodBancoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtNomeBancoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtNumeroEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtContaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtAgenciaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCodBancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControleCheque(TWinControl(sender),true);
  if (key=38) then
    FocusControleCheque(TWinControl(sender),false);
  if (key=K_F8) then
    with (frm_f8Bancos) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodBanco;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
end;

procedure Tfrm_ConclueVenda.edtCodAdmEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCodAdmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCartao.setfocus;
  if (key=K_CIMA) then
    edtCodForma.setfocus;
  if (key=K_F8) then
    with (frm_f8Adm) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodAdm;
      showmodal;
    end;
end;

procedure Tfrm_ConclueVenda.edtCartaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCartaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (x_saldo_venda>0.00) then
      Inserirforma1.click
    else
      Inserirformadepagamentovista1.click;
  if (key=K_CIMA) then
    edtCodAdm.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCodAdmExit(Sender: TObject);
var
  codigo: String;
begin
  codigo := Trim(edtCodAdm.text);
  if (codigo<>'') then
  begin
    pnAdm.caption := ProcuraNomeAdm(strtofloat(codigo),self);
    edtCodAdm.text := form_nz(strtofloat(codigo),3);          
  end;
end;

procedure Tfrm_ConclueVenda.edtCodAdmDblClick(Sender: TObject);
begin
  with (frm_f8Adm) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodAdm;
    showmodal;
  end;
end;

procedure Tfrm_ConclueVenda.edtContratoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtContrato.setfocus;
  if (key=K_CIMA) then
    edtValor.setfocus;
  if (key=K_F7) then
  begin
    lblCliente.caption       := 'CPF/CNPJ do cliente';
    edtCpf_crediario.visible := true;
    edtCliente.visible       := false;
    edtCpf_crediario.setfocus;
  end;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtCliente;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
end;

procedure Tfrm_ConclueVenda.edtContratoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clAux: TClassAuxiliar;
begin
  if (key=K_ENTER) then
  begin
          {Buscando a existencia do contrato de crediario ****}
    clAux := TClassAuxiliar.Create;
    clAux.conect ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CRECTABR         ');
    clAux.AddParam ('WHERE (CR_CLIE=:cliente) AND   ');
    clAux.AddParam ('      (CR_CODI=:contrato)      ');
    if (Trim(edtCliente.text)<>'') then
      clAux.consulta.parambyname('cliente').AsFloat := strtofloat(Trim(edtCliente.text))
    else
      clAux.consulta.parambyname('cliente').AsFloat := -1;
    if (Trim(edtContrato.text)<>'') then
      clAux.consulta.parambyname('contrato').AsFloat := strtofloat(Trim(edtContrato.text))
    else
      clAux.consulta.parambyname('contrato').AsFloat := -1;
    if (clAux.Execute) then
    begin
      edtTotalContrato.text   := form_nc(clAux.result('CR_TOTA')+clAux.result('CR_VENT'),10);
      edtValorEntrada.text    := form_nc(clAux.result('CR_VENT'),10);
      edtValorFinanciado.text := form_nc(clAux.result('CR_TOTA'),10);
    end
    else
    begin
      edtTotalContrato.text   := '';
      edtValorEntrada.text    := '';
      edtValorFinanciado.text := '';
    end;
    clAux.desconect;
    clAux.Free;
    edtNome_crediario.setfocus;
  end;
  if (key=K_CIMA) then
    if (edtCliente.visible) then
      edtCliente.setfocus
    else
    if (edtCpf_Crediario.visible) then
      edtCpf_Crediario.setfocus;
end;

procedure Tfrm_ConclueVenda.edtClienteEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(edtCpf.text)='') then
    begin
      if (key=K_ENTER) then
        if (x_saldo_venda>0.00) then
          Inserirforma1.click
        else
          edtRecebido_.setfocus;
    end
    else
      edtCodBanco.setfocus;
  if (key=K_CIMA) then
    edtCodForma.setfocus;
end;

procedure Tfrm_ConclueVenda.edtNomeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNumero.setfocus;
  if (key=K_CIMA) then
    edtConta.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCpfEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtTotalContratoEnter(Sender: TObject);
begin
     {if (Trim(edtTotalContrato.text)='') then
         edtTotalContrato.text:=edtValor.text;}
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtValorEntradaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtValorFinanciadoEnter(Sender: TObject);
var
  total_contrato,valor_entrada: Real;
  total_financiado: Real;
begin
  if (Trim(edtTotalContrato.text)<>'') then
    total_contrato := strtofloat(RetiraFormatacaoNumero(Trim(edtTotalContrato.text)))
  else
    total_contrato := 0.00;
  if (Trim(edtValorEntrada.text)<>'') then
    valor_entrada := strtofloat(RetiraFormatacaoNumero(Trim(edtValorEntrada.text)))
  else
    valor_entrada := 0.00;
  total_financiado   := total_contrato - valor_entrada;
  edtValorFinanciado.text := form_nc(total_financiado,12);
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtTotalContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValorEntrada.setfocus;
  if (key=K_CIMA) then
    edtNome_crediario.setfocus;
end;

procedure Tfrm_ConclueVenda.edtValorEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValorFinanciado.setfocus;
  if (key=K_CIMA) then
    edtTotalContrato.setfocus;
end;

procedure Tfrm_ConclueVenda.edtValorFinanciadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (x_saldo_venda>0.00) then
      Inserirforma1.click
    else
      edtRecebido_.setfocus;
  if (key=K_CIMA) then
    edtValorEntrada.setfocus;
end;

procedure Tfrm_ConclueVenda.edtTotalContratoExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtTotalContratoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorEntradaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorFinanciadoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorEntradaExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorFinanciadoExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.btnProcessarClick(Sender: TObject);
begin
  x_tipz:='1';
  Processarvenda1.click;
end;

procedure Tfrm_ConclueVenda.Processarvenda1Click(Sender: TObject);
var
  clItVend,clVend: TClassAuxiliar;
  indGauge,totGauge: Integer;
  total_qtde: Real;
  prodant: String;
  icms: Real;
begin
  if (frmDialogo.ExibirMensagem ('Confirma conclusão da venda?'
    ,'Venda',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    if (form_nc(x_saldo_venda,4)<>'0,00') then
    begin
      frmDialogo.ExibirMensagem ('A venda ainda não foi concluída!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCodForma.setfocus;
    end
    else
    if (not JaLancouPgtoAVista) and (GetValorAVistaReceber>0.00) then
    begin
      frmDialogo.ExibirMensagem ('O pgto. à vista ainda não foi efetuado!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCodForma.setfocus;
    end
    else
    begin
             {*** pegando o proximo codigo ***}
      frm_principal.x_codigo_venda := frm_principal.x_codigo_venda + 1;

             {0o PASSO - Buscando itens}
      clItVend := TClassAuxiliar.Create;
      clItVend.conect ('CAIXA',self);
      clItVend.ClearSql;
      clItVend.AddParam ('Select *                          ');
      clItVend.AddParam ('From ITENS_VENDAS_LOCAL           ');
      clItVend.AddParam ('Where (IV_LOJA=:IV_LOJA) AND      ');
      clItVend.AddParam ('      (IV_CAIX=:IV_CAIX) AND      ');
      clItVend.AddParam ('      (IV_VEND=:IV_VEND)          ');
      clItVend.AddParam ('Order by IV_GRUP,IV_SUBG,IV_PROD  ');
      clItVend.consulta.parambyname('IV_LOJA').AsFloat := x_loja;
      clItVend.consulta.parambyname('IV_CAIX').AsFloat := x_caixa;
      clItVend.consulta.parambyname('IV_VEND').AsFloat := x_venda;
      clItVend.Execute;
      clItVend.first;
      gauge1.visible:=true;
      gauge1.progress:=0;
      indGauge:=0;
      totGauge:=clItVend.reccount;
      label23.visible:=true;
      prodant:='-1';
      total_qtde:=0;
      while (not clItVend.eof) do
      begin
                 {ORDEM: Grupo>Subgrupo>Produto}
        if (prodant<>form_nz(clItVend.Result('IV_GRUP'),2)+
          form_nz(clItVend.Result('IV_SUBG'),2)+
          form_nz(clItVend.Result('IV_PROD'),4)) then
        begin
          AtualizaUltimaVenda_Produto(clItVend.Result('IV_GRUP'),
            clItVend.Result('IV_SUBG'),
            clItVend.Result('IV_PROD'),
            frm_principal.x_data_trabalho,
            x_tipz);
          prodant := form_nz(clItVend.Result('IV_GRUP'),2)+
            form_nz(clItVend.Result('IV_SUBG'),2)+
            form_nz(clItVend.Result('IV_PROD'),4);
        end;

                 {0o PASSO - Insercao real do registro de venda}
        with (DMCaixa.qInsereItemVenda_real) do
        begin
          parambyname('IV_LOJA').AsFloat   := clItVend.Result('IV_LOJA');
          parambyname('IV_CAIX').AsFloat   := clItVend.Result('IV_CAIX');
          parambyname('IV_VEND').AsFloat   := frm_principal.x_codigo_venda;
          parambyname('IV_TIPZ').AsString  := clItVend.Result('IV_TIPZ');
          parambyname('IV_GRUP').AsFloat   := clItVend.Result('IV_GRUP');
          parambyname('IV_SUBG').AsFloat   := clItVend.Result('IV_SUBG');
          parambyname('IV_PROD').AsFloat   := clItVend.Result('IV_PROD');
          parambyname('IV_TAMA').AsString  := clItVend.Result('IV_TAMA');
          parambyname('IV_OTAM').AsInteger := clItVend.Result('IV_OTAM');
          parambyname('IV_CORE').AsFloat   := clItVend.Result('IV_CORE');
          parambyname('IV_QTDE').AsFloat   := clItVend.Result('IV_QTDE');
          parambyname('IV_PVEN').AsFloat   := clItVend.Result('IV_PVEN');
          parambyname('IV_TOTA').AsFloat   := clItVend.Result('IV_TOTA');
          ExecSql;
        end;

                 {1o PASSO - Geracao de registro de movimento de SAIDA}
        DMEstoque.qInsereMovimento.parambyname('MO_SEQ').AsFloat   := Round(MaxiCod3 ('MOVIMENTO',frm_principal.barraDicas));
        DMEstoque.qInsereMovimento.parambyname('MO_GRUP').AsFloat  := clItVend.Result('IV_GRUP');
        DMEstoque.qInsereMovimento.parambyname('MO_SUBG').AsFloat  := clItVend.Result('IV_SUBG');
        DMEstoque.qInsereMovimento.parambyname('MO_PROD').AsFloat  := clItVend.Result('IV_PROD');
        DMEstoque.qInsereMovimento.parambyname('MO_LOJA').AsFloat  := x_loja;
        DMEstoque.qInsereMovimento.parambyname('MO_CORE').AsFloat  := clItVend.Result('IV_CORE');
        DMEstoque.qInsereMovimento.parambyname('MO_TAMA').AsString := clItVend.Result('IV_TAMA');
        DMEstoque.qInsereMovimento.parambyname('MO_OTAM').AsInteger:= clItVend.Result('IV_OTAM');
        DMEstoque.qInsereMovimento.parambyname('MO_NPED').AsFloat  := 0;
        DMEstoque.qInsereMovimento.parambyname('MO_DATA').AsDateTime := date;
        DMEstoque.qInsereMovimento.parambyname('MO_PCU1').AsFloat  := 0.00;
        DMEstoque.qInsereMovimento.parambyname('MO_PVE1').AsFloat  := clItVend.Result('IV_PVEN');
        DMEstoque.qInsereMovimento.parambyname('MO_TIPO').AsString := 'S';
        DMEstoque.qInsereMovimento.parambyname('MO_MODE').AsString := 'N';
        DMEstoque.qInsereMovimento.parambyname('MO_ENTR').AsString := '0';
        if (x_tipz='1') then
        begin
          frm_principal.x_nota_fiscal := frm_principal.x_nota_fiscal + 1;
          DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString := floattostr(frm_principal.x_nota_fiscal);
        end
        else
        if (x_tipz='2') then
        begin
          frm_principal.x_cupom_fiscal := frm_principal.x_cupom_fiscal + 1;
          DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString := floattostr(frm_principal.x_cupom_fiscal);
        end;
        DMEstoque.qInsereMovimento.parambyname('MO_FORN').AsFloat  := 0;
        DMEstoque.qInsereMovimento.parambyname('MO_QTD1').AsFloat  := clItVend.Result('IV_QTDE');
        DMEstoque.qInsereMovimento.parambyname('MO_TIPZ').AsString := x_tipz;
        DMEstoque.qInsereMovimento.ExecSql;

                 {2o PASSO - Dar entrada nos itens de estoque}
        SaidaItemEstoque   (x_loja,
          x_tipz,
          clItVend.Result('IV_GRUP'),
          clItVend.Result('IV_SUBG'),
          clItVend.Result('IV_PROD'),
          clItVend.Result('IV_TAMA'),
          clItVend.Result('IV_CORE'),
          clItVend.Result('IV_QTDE'));

                 {3o PASSO - Atualizando os campos de acumuladores em Estoque,Estoque_loja}
        AtualizaUltimaVenda_Estoque(clItVend.Result('IV_GRUP'),
          clItVend.Result('IV_SUBG'),
          clItVend.Result('IV_PROD'),
          clItVend.Result('IV_TAMA'),
          clItVend.Result('IV_CORE'),
          frm_principal.x_data_trabalho,
          x_tipz);
        AtualizaUltimaVenda_Estoque_Loja(clItVend.Result('IV_GRUP'),
          clItVend.Result('IV_SUBG'),
          clItVend.Result('IV_PROD'),
          clItVend.Result('IV_TAMA'),
          clItVend.Result('IV_CORE'),
          x_loja,
          frm_principal.x_data_trabalho,
          x_tipz);
                 {************************************************************************}

                 {prox. item -->}
        total_qtde := total_qtde + clItVend.Result('IV_QTDE');
        clItVend.next;
        indGauge:=indGauge+1;
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
      gauge1.visible:=false;
      label23.visible:=false;

             {3o PASSO - Inserindo os dados reais de VENDA}
      clVend := TClassAuxiliar.Create;
      clVend.conect   ('CAIXA',self);
      clVend.ClearSql;
      clVend.AddParam ('INSERT INTO VENDAS                       ');
      clVend.AddParam (' (VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,       ');
      clVend.AddParam ('  VE_OPER,VE_CLIE,VE_CONT,VE_TOTA,       ');
      clVend.AddParam ('  VE_QTDE,VE_STAT,                       ');
      clVend.AddParam ('  VE_TIPZ,VE_CUPO,VE_VEND,               ');
      clVend.AddParam ('  VE_ICMS,VE_ALIQ,                       ');
      clVend.AddParam ('  VE_CPF,VE_NOME,VE_FONE,                ');
      clVend.AddParam ('  VE_SERI,VE_NOTA,VE_DESC,VE_PDES)       ');
      clVend.AddParam ('VALUES                                   ');
      clVend.AddParam (' (:VE_CAIX,:VE_LOJA,:VE_CODI,:VE_DATA,   ');
      clVend.AddParam ('  :VE_OPER,:VE_CLIE,:VE_CONT,:VE_TOTA,   ');
      clVend.AddParam ('  :VE_QTDE,:VE_STAT,                     ');
      clVend.AddParam ('  :VE_TIPZ,:VE_CUPO,:VE_VEND,            ');
      clVend.AddParam ('  :VE_ICMS,:VE_ALIQ,                     ');
      clVend.AddParam ('  :VE_CPF,:VE_NOME,:VE_FONE,             ');
      clVend.AddParam ('  :VE_SERI,:VE_NOTA,:VE_DESC,:VE_PDES)   ');
      clVend.consulta.parambyname('VE_LOJA').AsFloat  := frm_principal.x_loja;
      clVend.consulta.parambyname('VE_CAIX').AsFloat  := frm_principal.x_caixa;
      clVend.consulta.parambyname('VE_CODI').AsFloat  := frm_principal.x_codigo_venda;
      clVend.consulta.parambyname('VE_CLIE').AsFloat  := 0;
      clVend.consulta.parambyname('VE_CONT').AsFloat  := 0;
      clVend.consulta.parambyname('VE_CUPO').AsFloat  := 0;
      clVend.consulta.parambyname('VE_CPF').AsString  := '';
      clVend.consulta.parambyname('VE_NOME').AsString := '';
      clVend.consulta.parambyname('VE_FONE').AsString := '';
      clVend.consulta.parambyname('VE_SERI').AsString := '';
      clVend.consulta.parambyname('VE_STAT').AsString := '1';
      clVend.consulta.parambyname('VE_DATA').AsDateTime := frm_principal.x_data_trabalho;
      clVend.consulta.parambyname('VE_OPER').AsFloat  := frm_principal.x_operador;
      clVend.consulta.parambyname('VE_NOTA').AsString := DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString;
      clVend.consulta.parambyname('VE_TIPZ').AsString := x_tipz;
      if (Trim(edtVendedor.text)<>'') then
        clVend.consulta.parambyname('VE_VEND').AsFloat  := strtofloat(Trim(edtVendedor.text))
      else
        clVend.consulta.parambyname('VE_VEND').AsFloat  := 0;
      if (Trim(edtDesc.text)<>'') then
        clVend.consulta.parambyname('VE_PDES').AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtDesc.text)))
      else
        clVend.consulta.parambyname('VE_PDES').AsFloat  := 0.00;
      if (Trim(edtTotalDesc.text)<>'') then
        clVend.consulta.parambyname('VE_DESC').AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.text)))
      else
        clVend.consulta.parambyname('VE_DESC').AsFloat  := 0.00;
      clVend.consulta.parambyname('VE_TOTA').AsFloat  := x_novo_total_venda;
      clVend.consulta.parambyname('VE_QTDE').AsFloat  := total_qtde;
      icms := InformaAliqICMS(frm_principal.x_estado);
      clVend.consulta.parambyname('VE_ICMS').AsFloat  := clVend.consulta.parambyname('VE_TOTA').AsFloat*(icms/100);
      clVend.consulta.parambyname('VE_ALIQ').AsFloat  := icms;
      clVend.Execute;
      clVend.desconect;
      clVend.Free;

             {4o PASSO - Excluindo os itens locais/e a venda local}
      frm_principal.Transfere_VendaLocal_VendaReal;

      tecla:=13; {confirmacao}
      close;
    end{CRITICA AOS DADOS};
end;

procedure Tfrm_ConclueVenda.edtDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtVendedorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtDesc.color=clWhite) then
      edtDesc.setfocus
    else
      edtTotalDesc.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    with (frm_f8Vend) do
    begin
      left:=287;
      top :=76;
      edit:=edtVendedor;
      showmodal;
    end;
end;

procedure Tfrm_ConclueVenda.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodForma.setfocus;
  if (key=K_CIMA) then
    edtVendedor.setfocus;
end;

procedure Tfrm_ConclueVenda.edtDescExit(Sender: TObject);
var
  desc: Real;
begin
  edtTotalDesc.text := '0,00';
  if (Trim(edtDesc.text)<>'') then
  begin
    desc                := strtofloat(RetiraFormatacaoNumero(sem_brancos(edtDesc.text)));
    x_novo_total_venda  := x_total_venda - (x_total_venda*(desc/100));
    edtDesc.text        := form_nc(desc,18);
    edtTotalDesc.text   := form_nc((x_total_venda*(desc/100)),18);
    x_saldo_venda       := RetornaSaldoVenda;
    ExibeStatus(x_saldo_venda);
  end;
  pnTotalVenda.caption     := form_nc(x_novo_total_venda,18);
  pnSaldoAPagar.caption    := form_nc(x_saldo_venda,18);
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtVendedorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtVendedor.text);
  if (codigo<>'') then
  begin
    edtVendedor.text:=form_nz(strtofloat(codigo),6);
    pnVendedor.caption:=ProcuraNomeVend(strtofloat(codigo),self);
  end;
end;

procedure Tfrm_ConclueVenda.edtVendedorDblClick(Sender: TObject);
begin
  with (frm_f8Vend) do
  begin
    left:=287;
    top :=76;
    edit:=edtVendedor;
    showmodal;
  end;
end;

procedure Tfrm_ConclueVenda.edtClienteDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    edit:=edtCliente;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_ConclueVenda.edtValorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (not JaLancouPgtoAVista) then
      if (x_saldo_venda=0.00) then
        frmDialogo.ExibirMensagem ('Não há saldo a pagar para esta venda!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (Trim(edtCodForma.text)='') then
        btnProcessar.click
      else
      begin
                        {*** paginas}
        PageControl1.visible          := false;
        PaginaCrediario.tabvisible    := false;
        PaginaCheque.tabvisible       := false;
        PaginaCartao.tabvisible       := false;

                        {***********************************************}
        if (Trim(edtCodForma.text)='01') then {* A vista}
          Inserirforma1.click
        else
        if (Trim(edtCodForma.text)='02') then {* Crediario}
        begin
          PageControl1.visible         := true;
          PageControl1.activepageindex := 2;
          PageControl1.height          := 192;
          PaginaCrediario.tabvisible   := true;
          LimparEditsPainel(Panel6);
          edtTotalContrato.readonly   := false;
          edtValorEntrada.readonly    := false;
          edtTotalContrato.text        := edtValor.text;
          if (Trim(edtValor.text)='') or (Trim(edtValor.text)='0,00')then
          begin
            frmDialogo.ExibirMensagem ('Valor não pode ficar vazio!'
              ,'Venda',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            edtValor.setfocus;
          end
          else
          begin
            if (frmDialogo.ExibirMensagem ('Deseja lançar o contrato agora?'
              ,'Venda',[mbYes,mbNo]
              ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            begin
              edtTotalContrato.readonly   := true;
              edtValorEntrada.readonly    := true;
              FormatarZerosDecimais (edtValor);
              frm_principal.ChamandoPosFinancCons;
              edtCliente.text  := form_nz(frm_consulta1.y_codigo_cliente,6);
              edtContrato.text := form_nz(frm_consulta1.y_codigo_contrato,6);
            end;
            edtCliente.setfocus;
          end;
        end
        else
        if (Trim(edtCodForma.text)='03') then {* Cartao de credito}
        begin
          PageControl1.activepageindex  := 1;
          PageControl1.visible          := true;
          PageControl1.height           := 120;
          LimparEditsPainel(Panel7);
          edtCodAdm.setfocus;
        end;
      end{CRITICA};
  if (key=K_CIMA) then
    edtCodForma.setfocus;
end;

procedure Tfrm_ConclueVenda.edtValorExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.LimparEditsPainel(painel: TPanel);
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  painel.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  Lista.Free;
end;

procedure Tfrm_ConclueVenda.Inserirformadepagamentovista1Click(
  Sender: TObject);
var
  clAux: TClassAuxiliar;
  sequencia_ordem: Integer;
begin
     {CRITICA AOS DADOS}
  if (Trim(edtCodForma.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Informe o código da forma de pgto!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodForma.setfocus;
  end
  else
  if (JaLancouPgtoAVista) then
  begin
    frmDialogo.ExibirMensagem ('O pagamento à vista já foi recebido!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Limparedits1.click;
    edtCodForma.setfocus;
  end
  else
  if (Trim(edtRecebido_.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Informe o valor à vista  recebido!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtRecebido_.setfocus;
  end
  else
  if (strtofloat(RetiraFormatacaoNumero(Trim(edtRecebido_.text)))=0.00) then
  begin
    frmDialogo.ExibirMensagem ('Informe o valor a ser pago!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtRecebido_.setfocus;
  end
  else
  if (Trim(edtCodAdm.text)='') and {** - cartao}
    (Trim(edtCodForma.text)='03') then
  begin
    frmDialogo.ExibirMensagem ('Informe a administradora do cartão!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (Trim(edtCartao.text)='') and {** - cartao}
    (Trim(edtCodForma.text)='03') then
  begin
    frmDialogo.ExibirMensagem ('Informe o número do cartão!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCartao.setfocus;
  end
  else
  begin
          {****** - Lancando o pagamento a vista}
    clAux           := TClassAuxiliar.Create;
    clAux.conect   ('CAIXA',self);
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO PAGAMENTOS_A_VISTA_LOCAL                               ');
    clAux.AddParam (' (PV_CAIX,PV_LOJA,PV_VEND,PV_FPGT,PV_VALO,PV_TROC)                 ');
    clAux.AddParam ('VALUES                                                             ');
    clAux.AddParam (' (:PV_CAIX,:PV_LOJA,:PV_VEND,:PV_FPGT,:PV_VALO,:PV_TROC)           ');
    clAux.consulta.parambyname('PV_LOJA').AsFloat   := x_loja;
    clAux.consulta.parambyname('PV_CAIX').AsFloat   := x_caixa;
    clAux.consulta.parambyname('PV_VEND').AsFloat   := x_venda;
    clAux.consulta.parambyname('PV_FPGT').AsFloat   := strtofloat('1'+floattostr(strtofloat(Trim(edtCodForma.text))));
    if (Trim(edtValor_.text)<>'') then
      clAux.consulta.parambyname('PV_VALO').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtValor_.text)))
    else
      clAux.consulta.parambyname('PV_VALO').AsFloat := 0.00;
    if (Trim(pnTroco_.caption)<>'') then
      clAux.consulta.parambyname('PV_TROC').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(pnTroco_.caption)))
    else
      clAux.consulta.parambyname('PV_TROC').AsFloat := 0.00;
    clAux.Execute;
    clAux.desconect;
    clAux.Free;

          {****** - Pagamento a vista com dinheiro *********************************************}
    if (Trim(edtCodForma.text)='01') then
          {nao faz nada por enquanto}
          {****** - Pagamento a vista com cheque **********************************************}
    else
    if (Trim(edtCodForma.text)='02') then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   ('CAIXA',self);
      clAux.ClearSql;
      clAux.AddParam ('INSERT INTO CHEQUES_LOCAL                        ');
      clAux.AddParam (' (CH_CAIX,CH_LOJA,CH_VEND,CH_BANC,               ');
      clAux.AddParam ('  CH_NBAN,CH_AGEN,CH_CONT,CH_NUME,CH_ORDE,       ');
      clAux.AddParam ('  CH_FLAG,CH_NOME,CH_CPF,CH_FONE)                ');
      clAux.AddParam ('VALUES                                           ');
      clAux.AddParam (' (:CH_CAIX,:CH_LOJA,:CH_VEND,:CH_BANC,           ');
      clAux.AddParam ('  :CH_NBAN,:CH_AGEN,:CH_CONT,:CH_NUME,:CH_ORDE,  ');
      clAux.AddParam ('  :CH_FLAG,:CH_NOME,:CH_CPF,:CH_FONE)            ');
      clAux.consulta.parambyname('CH_LOJA').AsFloat   := x_loja;
      clAux.consulta.parambyname('CH_CAIX').AsFloat   := x_caixa;
      clAux.consulta.parambyname('CH_VEND').AsFloat   := x_venda;
      if (Trim(edtCodBanco.text)<>'') then
        clAux.consulta.parambyname('CH_BANC').AsInteger  := strtoint(Trim(edtCodBanco.text))
      else
        clAux.consulta.parambyname('CH_BANC').AsInteger  := 0;
      clAux.consulta.parambyname('CH_NBAN').AsString  := Trim(edtNomeBanco.text);
      clAux.consulta.parambyname('CH_AGEN').AsString  := Trim(edtAgencia.text);
      clAux.consulta.parambyname('CH_CONT').AsString  := Trim(edtConta.text);
      if (Trim(edtNumero.text)<>'') then
        clAux.consulta.parambyname('CH_NUME').AsFloat := strtofloat(Trim(edtNumero.text))
      else
        clAux.consulta.parambyname('CH_NUME').AsFloat := 0;
      clAux.consulta.parambyname('CH_ORDE').AsInteger := 0; {*** nao necessita}
      if (chFlag.checked) then
        clAux.consulta.parambyname('CH_FLAG').AsString  := '1'
      else
        clAux.consulta.parambyname('CH_FLAG').AsString  := '0';
      clAux.consulta.parambyname('CH_NOME').AsString := Trim(edtNome.text);
      clAux.consulta.parambyname('CH_FONE').AsString := Trim(edtFone.text);
      clAux.consulta.parambyname('CH_CPF').AsString := Trim(edtCpf.text);
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
    end
          {****** - Pagamento a vista com debito automatico ***********************************}
    else
    if (Trim(edtCodForma.text)='03') then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect ('CAIXA',self);
      clAux.ClearSql;
      clAux.AddParam ('INSERT INTO CARTOES_LOCAL                                      ');
      clAux.AddParam (' (CA_CAIX,CA_LOJA,CA_VEND,CA_NUME,CA_ORDE,CA_CADM)       ');
      clAux.AddParam ('VALUES                                                   ');
      clAux.AddParam (' (:CA_CAIX,:CA_LOJA,:CA_VEND,:CA_NUME,:CA_ORDE,:CA_CADM) ');
      clAux.consulta.parambyname('CA_LOJA').AsFloat   := x_loja;
      clAux.consulta.parambyname('CA_CAIX').AsFloat   := x_caixa;
      clAux.consulta.parambyname('CA_VEND').AsFloat   := x_venda;
      if (Trim(edtCodAdm.text)<>'') then
        clAux.consulta.parambyname('CA_CADM').AsInteger  := strtoint(edtCodAdm.text)
      else
        clAux.consulta.parambyname('CA_CADM').AsInteger  := 0;
      clAux.consulta.parambyname('CA_NUME').AsString  := Trim(edtCartao.text);
      clAux.consulta.parambyname('CA_ORDE').AsInteger := 0; {*** nao necessita}
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
    end;

          {****** - Registrando o pgto. da ENTRADA de crediario/Se existir!!!}
    sequencia_ordem :=  GetOrdemFormaPgto(2);
    if (sequencia_ordem<>0) then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect ('CAIXA',self);
      clAux.ClearSql;
      clAux.AddParam ('UPDATE CREDIARIOS_LOCAL       ');
      clAux.AddParam ('SET    CR_RECE=CR_VENT        ');
      clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND  ');
      clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND  ');
      clAux.AddParam ('      (CR_VEND=:CR_VEND) AND  ');
      clAux.AddParam ('      (CR_ORDE=:CR_ORDE)      ');
      clAux.consulta.parambyname('CR_LOJA').AsFloat := x_loja;
      clAux.consulta.parambyname('CR_CAIX').AsFloat := x_caixa;
      clAux.consulta.parambyname('CR_VEND').AsFloat := x_venda;
      clAux.consulta.parambyname('CR_ORDE').AsInteger := sequencia_ordem;
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
    end;

          {****************}
    Limparedits1.click;
    RefrescaTabela;
    ExibeStatus(x_saldo_venda);
  end;
end;

function Tfrm_ConclueVenda.JaLancadoFormaPgto:Boolean;
var
  codigo_forma: Real;
begin
  if (Trim(edtCodForma.text)<>'') then
  begin
    codigo_forma:=strtofloat(Trim(edtCodForma.text));
    result:=false;
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=codigo_forma) then
      begin
        result:=true;
        break;
      end;
      qFormas.next;
    end;
    qFormas.enablecontrols;
  end;
end;

procedure Tfrm_ConclueVenda.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clAux: TClassAuxiliar;
  forma_pgto_a_vista: Real;
  ordem_pgto_a_vista: Integer;
begin
  if (key=K_F2) then
    edtCodForma.setfocus;
  if (key=K_DELETE) then
    if (frmDialogo.ExibirMensagem ('Confirma exclusão do pagamento?'
      ,'Venda',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      ExclueFormaPgto(qFormas.fieldbyname('VF_FPGT').AsFloat);
  if (key=K_ENTER) then
    ExibeFormaPgto(qFormas.fieldbyname('VF_FPGT').AsFloat,
      qFormas.fieldbyname('VF_VALO').AsFloat);
end;

procedure Tfrm_ConclueVenda.edtValor_Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtValor_Exit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValor_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRecebido_.setfocus;
  if (key=K_CIMA) then
    if (edtCodForma.text='01') then
      edtCodForma.setfocus
    else
    if (edtCodForma.text='02') then
      edtNumero.setfocus
    else
    if (edtCodForma.text='03') then
      edtCartao.setfocus;
end;

procedure Tfrm_ConclueVenda.edtValor_KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtRecebido_Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtRecebido_Exit(Sender: TObject);
var
  valor_recebido: Real;
  valor,troco: Real;
begin
  if (Trim(edtRecebido_.text)='0,00') or
    (Trim(edtRecebido_.text)='') then
    edtRecebido_.text:=edtValor_.text;
  troco:=0.00;
  if (Trim(edtRecebido_.text)<>'') then
  begin
    valor_recebido := strtofloat(RetiraFormatacaoNumero(Trim(edtRecebido_.text)));
    valor          := strtofloat(RetiraFormatacaoNumero(Trim(edtValor_.text)));
    troco          := valor_recebido - valor;
  end;
  pnTroco_.caption := form_nc(troco,10);
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtRecebido_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
  begin
    edtRecebido_Exit(Sender);
    Inserirformadepagamentovista1.click;
  end;
  if (key=K_CIMA) then
    edtValor_.setfocus;
end;

procedure Tfrm_ConclueVenda.edtRecebido_KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

function Tfrm_Concluevenda.GetValorAVistaReceber:Real;
var
  total: Real;
begin
  qFormas.disablecontrols;
  qFormas.first;
  total:=0.00;
  while (not qFormas.eof) do
  begin
    if (qFormas.fieldbyname('VF_FPGT').AsFloat=1) then {A Vista}
      total := total + qFormas.fieldbyname('VF_VALO').AsFloat;
    if (qFormas.fieldbyname('VF_FPGT').AsFloat=2) then {Entrada de crediario}
      total := total + GetEntrada(qFormas.fieldbyname('VF_ORDE').AsInteger);
    qFormas.next;
  end;
  result:=total;
  qFormas.enablecontrols;
end;

function Tfrm_Concluevenda.GetEntrada(ordem: Integer):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CAIXA',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CR_VENT FROM CREDIARIOS_LOCAL   ');
  clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND           ');
  clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND           ');
  clAux.AddParam ('      (CR_VEND=:CR_VEND) AND           ');
  clAux.AddParam ('      (CR_ORDE=:CR_ORDE)               ');
  clAux.consulta.parambyname('CR_LOJA').AsFloat := x_loja;
  clAux.consulta.parambyname('CR_CAIX').AsFloat := x_caixa;
  clAux.consulta.parambyname('CR_VEND').AsFloat := x_venda;
  clAux.consulta.parambyname('CR_ORDE').AsInteger := ordem;
  if (clAux.Execute) then
    result:=clAux.result('CR_VENT')
  else
    result:=0.00;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_Concluevenda.GetOrdemFormaPgto(codigo_forma: Real):Integer;
begin
  qFormas.disablecontrols;
  qFormas.first;
  result:=0;
  while (not qFormas.eof) do
  begin
    if (qFormas.fieldbyname('VF_FPGT').AsFloat=codigo_forma) then
    begin
      result := qFormas.fieldbyname('VF_ORDE').AsInteger;
      break;
    end;
    qFormas.next;
  end;
  qFormas.enablecontrols;
end;

function Tfrm_Concluevenda.JaLancouPgtoAVista:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CAIXA',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PV_VEND FROM PAGAMENTOS_A_VISTA_LOCAL   ');
  clAux.AddParam ('WHERE (PV_LOJA=:PV_LOJA) AND           ');
  clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND           ');
  clAux.AddParam ('      (PV_VEND=:PV_VEND)               ');
  clAux.consulta.parambyname('PV_LOJA').AsFloat   := x_loja;
  clAux.consulta.parambyname('PV_CAIX').AsFloat   := x_caixa;
  clAux.consulta.parambyname('PV_VEND').AsFloat   := x_venda;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_Concluevenda.GetFormaPgtoAVista:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CAIXA',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PV_FPGT FROM PAGAMENTOS_A_VISTA_LOCAL   ');
  clAux.AddParam ('WHERE (PV_LOJA=:PV_LOJA) AND           ');
  clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND           ');
  clAux.AddParam ('      (PV_VEND=:PV_VEND)               ');
  clAux.consulta.parambyname('PV_LOJA').AsFloat   := x_loja;
  clAux.consulta.parambyname('PV_CAIX').AsFloat   := x_caixa;
  clAux.consulta.parambyname('PV_VEND').AsFloat   := x_venda;
  if (clAux.Execute) then
    result:=clAux.result('PV_FPGT')
  else
    result:=0;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_Concluevenda.ExibeFormaPgto(codigo_forma,valor: Real);
var
  clAux: TClassAuxiliar;
  codigo_forma_a_vista: Real;
  ordem: Integer;
begin
  Application.CreateForm(Tfrm_VerDadosPgto,frm_VerDadosPgto);
  clAux := TClassAuxiliar.Create;
  clAux.conect ('CAIXA',self);
  ordem := GetOrdemFormaPgto(codigo_forma);{<<<------}
  if (codigo_forma=1) then {* pagamento a vista}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO FROM VENDAS_FORMA_PAGAMENTO_LOCAL      ');
    clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND  ');
    clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND  ');
    clAux.AddParam ('      (VF_VEND=:VF_VEND) AND  ');
    clAux.AddParam ('      (VF_ORDE=:VF_ORDE)      ');
    clAux.consulta.parambyname('VF_LOJA').AsFloat := x_loja;
    clAux.consulta.parambyname('VF_CAIX').AsFloat := x_caixa;
    clAux.consulta.parambyname('VF_VEND').AsFloat := x_venda;
    clAux.consulta.parambyname('VF_ORDE').AsFloat := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.Add(' --- Pagamento à vista ---------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Forma de pagamento...: '+ProcuraNomeFormaPgto(codigo_forma,self));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor a receber.....$: '+form_nc(clAux.result('VF_VALO'),18));

             {*** verificando os recebimentos a vista}
      clAux.ClearSql;
      clAux.AddParam ('SELECT * FROM PAGAMENTOS_A_VISTA_LOCAL      ');
      clAux.AddParam ('WHERE (PV_LOJA=:PV_LOJA) AND  ');
      clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND  ');
      clAux.AddParam ('      (PV_VEND=:PV_VEND)      ');
      clAux.consulta.parambyname('PV_LOJA').AsFloat := x_loja;
      clAux.consulta.parambyname('PV_CAIX').AsFloat := x_caixa;
      clAux.consulta.parambyname('PV_VEND').AsFloat := x_venda;
      if (clAux.Execute) then
      begin
        frm_VerDadosPgto.Memo1.lines.Add(' --- [Recebimento efetuado]-----------------------------------------');
        frm_VerDadosPgto.Memo1.lines.Add(' Forma do recebimento.: '+ProcuraNomeFormaPgto(clAux.result('PV_FPGT'),self));
        frm_VerDadosPgto.Memo1.lines.Add(' Valor a receber.....$: '+form_nc(clAux.result('PV_VALO'),18));
        frm_VerDadosPgto.Memo1.lines.Add(' Valor recebido......$: '+form_nc(clAux.result('PV_VALO')+clAux.result('PV_TROC'),18));
        frm_VerDadosPgto.Memo1.lines.Add(' Troco...............$: '+form_nc(clAux.result('PV_TROC'),18));

                 {**********************************************}
        codigo_forma_a_vista := clAux.result('PV_FPGT');
        if (codigo_forma_a_vista=12) then {* cheque}
        begin
          clAux.ClearSql;
          clAux.AddParam ('SELECT * FROM CHEQUES_LOCAL         ');
          clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
          clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
          clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
          clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
          clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
          clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
          clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
          clAux.consulta.parambyname('CH_ORDE').AsInteger := 0; {****}
          clAux.Execute;
          frm_VerDadosPgto.Memo1.lines.Add(' --- Dados do Cheque à vista ----------------------------------------');
          frm_VerDadosPgto.Memo1.lines.Add(' Cod/Banco......: '+form_n (clAux.result('CH_BANC'),3));
          frm_VerDadosPgto.Memo1.lines.Add(' Emitente.......: '+form_t (clAux.result('CH_NOME'),40));
          frm_VerDadosPgto.Memo1.lines.Add(' Fone...........: '+form_t (clAux.result('CH_FONE'),15));
          frm_VerDadosPgto.Memo1.lines.Add(' CPF............: '+ExibeCpf(clAux.result('CH_CPF')));
          if (clAux.result('CH_FLAG')='1') then
            frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: PRÓPRIO CLIENTE ')
          else
          if (clAux.result('CH_FLAG')='0') then
            frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: TERCEIROS ');
          frm_VerDadosPgto.Memo1.lines.Add(' Nome banco.....: '+form_t (clAux.result('CH_NBAN'),30));
          frm_VerDadosPgto.Memo1.lines.Add(' Agência........: '+form_t (clAux.result('CH_AGEN'),10));
          frm_VerDadosPgto.Memo1.lines.Add(' Conta/Corrente.: '+form_t (clAux.result('CH_CONT'),20));
          frm_VerDadosPgto.Memo1.lines.Add(' Número cheque..: '+form_n (clAux.result('CH_NUME'),10));
        end
        else
        if (codigo_forma_a_vista=13) then {* debito automatico}
        begin
          clAux.ClearSql;
          clAux.AddParam ('SELECT * FROM CARTOES_LOCAL         ');
          clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
          clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
          clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
          clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
          clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
          clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
          clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
          clAux.consulta.parambyname('CA_ORDE').AsInteger := 0; {****}
          clAux.Execute;
          frm_VerDadosPgto.Memo1.lines.Add(' --- Dados do Debito Automatico ------------------------------------');
          frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
            ProcuraNomeAdm(clAux.result('CA_CADM'),self));
          frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+clAux.result('CA_NUME'));
        end;
      end
      else
        frm_VerDadosPgto.Memo1.lines.Add('>>Recebimento ainda não efetuado');
      frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
  if (codigo_forma=2) then {* crediario}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CREDIARIOS_LOCAL      ');
    clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND  ');
    clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND  ');
    clAux.AddParam ('      (CR_VEND=:CR_VEND) AND  ');
    clAux.AddParam ('      (CR_ORDE=:CR_ORDE)      ');
    clAux.consulta.parambyname('CR_LOJA').AsFloat := x_loja;
    clAux.consulta.parambyname('CR_CAIX').AsFloat := x_caixa;
    clAux.consulta.parambyname('CR_VEND').AsFloat := x_venda;
    clAux.consulta.parambyname('CR_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- Crediário -----------------------------------------------------');
      if (clAux.result('CR_CLIE')<>0) then
        frm_VerDadosPgto.Memo1.lines.Add(' Código/cliente..: '+form_nz(clAux.result('CR_CLIE'),6)+'-'+
          ProcuraNomeClienteCod(clAux.result('CR_CLIE'),self))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Código/cliente..: >>Não informado');
      if (clAux.result('CR_CPF')<>'') then
        frm_VerDadosPgto.Memo1.lines.Add(' CPF/CNPJ........: '+form_t(clAux.result('CR_CPF'),14))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' CPF/CNPJ........: >>Não informado');
      if (clAux.result('CR_NOME')<>'') then
        frm_VerDadosPgto.Memo1.lines.Add(' Nome do cliente.: '+form_t(clAux.result('CR_NOME'),40))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Nome do cliente.: >>Não informado');
      if (clAux.result('CR_CODI')<>0) then
        frm_VerDadosPgto.Memo1.lines.Add(' Contrato........: '+form_nz(clAux.result('CR_CODI'),6))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Contrato........: >>Não informado');
      frm_VerDadosPgto.Memo1.lines.Add(' Total contrato.$: '+form_nc(clAux.result('CR_TOTA'),12));
      frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Entrada........$: '+form_nc(clAux.result('CR_VENT'),12));
      if (clAux.result('CR_RECE')<>0.00) then
        frm_VerDadosPgto.Memo1.lines.Add(' Recebido?......$: SIM')
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Recebido?......$: NAO!!!');
      frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Financiado.....$: '+form_nc(clAux.result('CR_FINA'),12));
      frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');

             {*** verificando os recebimentos a vista}
      clAux.ClearSql;
      clAux.AddParam ('SELECT * FROM PAGAMENTOS_A_VISTA_LOCAL      ');
      clAux.AddParam ('WHERE (PV_LOJA=:PV_LOJA) AND  ');
      clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND  ');
      clAux.AddParam ('      (PV_VEND=:PV_VEND)      ');
      clAux.consulta.parambyname('PV_LOJA').AsFloat := x_loja;
      clAux.consulta.parambyname('PV_CAIX').AsFloat := x_caixa;
      clAux.consulta.parambyname('PV_VEND').AsFloat := x_venda;
      if (clAux.Execute) then
      begin
        frm_VerDadosPgto.Memo1.lines.Add(' --- [Recebimento efetuado]-----------------------------------------');
        frm_VerDadosPgto.Memo1.lines.Add(' Forma do recebimento.: '+ProcuraNomeFormaPgto(clAux.result('PV_FPGT'),self));
        frm_VerDadosPgto.Memo1.lines.Add(' Valor a receber.....$: '+form_nc(clAux.result('PV_VALO'),18));
        frm_VerDadosPgto.Memo1.lines.Add(' Valor recebido......$: '+form_nc(clAux.result('PV_VALO')+clAux.result('PV_TROC'),18));
        frm_VerDadosPgto.Memo1.lines.Add(' Troco...............$: '+form_nc(clAux.result('PV_TROC'),18));

                 {**********************************************}
        codigo_forma_a_vista := clAux.result('PV_FPGT');
        if (codigo_forma_a_vista=12) then {* cheque}
        begin
          clAux.ClearSql;
          clAux.AddParam ('SELECT * FROM CHEQUES_LOCAL         ');
          clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
          clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
          clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
          clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
          clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
          clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
          clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
          clAux.consulta.parambyname('CH_ORDE').AsInteger := 0; {****}
          clAux.Execute;
          frm_VerDadosPgto.Memo1.lines.Add(' --- Dados do Cheque à vista ----------------------------------------');
          frm_VerDadosPgto.Memo1.lines.Add(' Cod/Banco......: '+form_n (clAux.result('CH_BANC'),3));
          frm_VerDadosPgto.Memo1.lines.Add(' Emitente.......: '+form_t (clAux.result('CH_NOME'),40));
          frm_VerDadosPgto.Memo1.lines.Add(' Fone...........: '+form_t (clAux.result('CH_FONE'),15));
          frm_VerDadosPgto.Memo1.lines.Add(' CPF............: '+ExibeCpf(clAux.result('CH_CPF')));
          if (clAux.result('CH_FLAG')='1') then
            frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: PRÓPRIO CLIENTE ')
          else
          if (clAux.result('CH_FLAG')='0') then
            frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: TERCEIROS ');
          frm_VerDadosPgto.Memo1.lines.Add(' Nome banco.....: '+form_t (clAux.result('CH_NBAN'),30));
          frm_VerDadosPgto.Memo1.lines.Add(' Agência........: '+form_t (clAux.result('CH_AGEN'),10));
          frm_VerDadosPgto.Memo1.lines.Add(' Conta/Corrente.: '+form_t (clAux.result('CH_CONT'),20));
          frm_VerDadosPgto.Memo1.lines.Add(' Número cheque..: '+form_n (clAux.result('CH_NUME'),10));
        end
        else
        if (codigo_forma_a_vista=13) then {* debito automatico}
        begin
          clAux.ClearSql;
          clAux.AddParam ('SELECT * FROM CARTOES_LOCAL         ');
          clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
          clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
          clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
          clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
          clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
          clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
          clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
          clAux.consulta.parambyname('CA_ORDE').AsInteger := 0; {****}
          clAux.Execute;
          frm_VerDadosPgto.Memo1.lines.Add(' --- Dados do Debito Automatico ------------------------------------');
          frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
            ProcuraNomeAdm(clAux.result('CA_CADM'),self));
          frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+clAux.result('CA_NUME'));
        end;
      end
      else
        frm_VerDadosPgto.Memo1.lines.Add('>>Recebimento da entrada ainda não efetuado');
      frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
  if (codigo_forma=3) then {* cartao de credito}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CARTOES_LOCAL         ');
    clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
    clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
    clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
    clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
    clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
    clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
    clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
    clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- Cartão de crédito ---------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
        ProcuraNomeAdm(clAux.result('CA_CADM'),self));
      frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+clAux.result('CA_NUME'));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor $........: '+form_nc(valor,10));
      frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end;
  clAux.desconect;
  clAux.Free;
  frm_VerDadosPgto.showmodal;
  frm_VerDadosPgto.Free;
end;

procedure Tfrm_ConclueVenda.gradeDblClick(Sender: TObject);
begin
  ExibeFormaPgto(qFormas.fieldbyname('VF_FPGT').AsFloat,
    qFormas.fieldbyname('VF_VALO').AsFloat);
end;

procedure Tfrm_conclueVenda.ExclueFormaPgto(codigo_forma: Real);
var
  clAux: TClassAuxiliar;
  ordem: Integer;
  codigo_forma_a_vista: Real;
  ordem_pgto_a_vista: Integer;
begin
  ordem := GetOrdemFormaPgto(codigo_forma);    
  clAux := TClassAuxiliar.Create;
  clAux.conect ('CAIXA',self);
  if (codigo_forma=1) then {deletando o pagamento a vista}
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM PAGAMENTOS_A_VISTA_LOCAL            ');
    clAux.AddParam ('WHERE (PV_LOJA=:PV_LOJA) AND  ');
    clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND  ');
    clAux.AddParam ('      (PV_VEND=:PV_VEND)      ');
    clAux.consulta.parambyname('PV_LOJA').AsFloat := x_loja;
    clAux.consulta.parambyname('PV_CAIX').AsFloat := x_caixa;
    clAux.consulta.parambyname('PV_VEND').AsFloat := x_venda;
    clAux.Execute;

         {*********** - deletando a subforma - 1,2,3 - ainda nao pronto ????}
    codigo_forma_a_vista := GetFormaPgtoAVista;
    ordem_pgto_a_vista   := GetOrdemFormaPgto(1);
    if (codigo_forma_a_vista=11) then {* dinheiro}
         {por enquanto nao faz nada}
    else
    if (codigo_forma_a_vista=12) then {* cheque a vista}
    begin
      clAux.ClearSql;
      clAux.AddParam ('DELETE FROM CHEQUES_LOCAL            ');
      clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
      clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
      clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
      clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
      clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
      clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
      clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
      clAux.consulta.parambyname('CH_ORDE').AsInteger := ordem_pgto_a_vista;
      clAux.Execute;
    end
    else
    if (codigo_forma_a_vista=13) then {* debito automatico}
    begin
      clAux.ClearSql;
      clAux.AddParam ('DELETE FROM CARTOES_LOCAL            ');
      clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
      clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
      clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
      clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
      clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
      clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
      clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
      clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem_pgto_a_vista;
      clAux.Execute;
    end;
    PainelTroco.visible:=false;
    LimparEditsPainel(PainelTroco);
    edtRecebido_.color       := clWhite;
    edtRecebido_.font.color  := clBlack;
    edtRecebido_.readonly    := false;
  end
  else
  if (codigo_forma=2) then {* excluindo crediario}
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM CREDIARIOS_LOCAL        ');
    clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND  ');
    clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND  ');
    clAux.AddParam ('      (CR_VEND=:CR_VEND) AND  ');
    clAux.AddParam ('      (CR_ORDE=:CR_ORDE)      ');
    clAux.consulta.parambyname('CR_LOJA').AsFloat := x_loja;
    clAux.consulta.parambyname('CR_CAIX').AsFloat := x_caixa;
    clAux.consulta.parambyname('CR_VEND').AsFloat := x_venda;
    clAux.consulta.parambyname('CR_ORDE').AsInteger := ordem;
    clAux.Execute;
         {***** - -- Por que nele esta o pagamento da entrada ------------------}
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM PAGAMENTOS_A_VISTA_LOCAL            ');
    clAux.AddParam ('WHERE (PV_LOJA=:PV_LOJA) AND  ');
    clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND  ');
    clAux.AddParam ('      (PV_VEND=:PV_VEND)      ');
    clAux.consulta.parambyname('PV_LOJA').AsFloat := x_loja;
    clAux.consulta.parambyname('PV_CAIX').AsFloat := x_caixa;
    clAux.consulta.parambyname('PV_VEND').AsFloat := x_venda;
    clAux.Execute;

         {*********** - deletando a subforma - 1,2,3 - ainda nao pronto ????}
    codigo_forma_a_vista := GetFormaPgtoAVista;
    ordem_pgto_a_vista   := GetOrdemFormaPgto(1);
    if (codigo_forma_a_vista=11) then {* dinheiro}
         {por enquanto nao faz nada}
    else
    if (codigo_forma_a_vista=12) then {* cheque a vista}
    begin
      clAux.ClearSql;
      clAux.AddParam ('DELETE FROM CHEQUES_LOCAL            ');
      clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
      clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
      clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
      clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
      clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
      clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
      clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
      clAux.consulta.parambyname('CH_ORDE').AsInteger := ordem_pgto_a_vista;
      clAux.Execute;
    end
    else
    if (codigo_forma_a_vista=13) then {* debito automatico}
    begin
      clAux.ClearSql;
      clAux.AddParam ('DELETE FROM CARTOES_LOCAL            ');
      clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
      clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
      clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
      clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
      clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
      clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
      clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
      clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem_pgto_a_vista;
      clAux.Execute;
    end;
    PainelTroco.visible:=false;
    LimparEditsPainel(PainelTroco);
    edtRecebido_.color       := clWhite;
    edtRecebido_.font.color  := clBlack;
    edtRecebido_.readonly    := false;
  end
  else
  if (codigo_forma=3) then {* deletando cartao de credito}
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM CARTOES_LOCAL           ');
    clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
    clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
    clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
    clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
    clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
    clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
    clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
    clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem;
    clAux.Execute;
  end;

    {*** Excluindo a forma de pagamento *****************************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VENDAS_FORMA_PAGAMENTO_LOCAL  ');
  clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND        ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND        ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND) AND        ');
  clAux.AddParam ('      (VF_ORDE=:VF_ORDE)            ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat := x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat := x_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat := x_venda;
  clAux.consulta.parambyname('VF_ORDE').AsInteger := ordem;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;

    {****************************8}
  RefrescaTabela;
  x_saldo_venda := RetornaSaldoVenda;
  ExibeStatus(x_saldo_venda);
  pnSaldoAPagar.caption := form_nc(x_saldo_venda,10);
end;

procedure Tfrm_conclueVenda.ExibeStatus(valor: Real);
begin
  if (valor>0.00) then
  begin
    lblstatus.visible:=false;
    timer_lblStatus.enabled:=false;
    lblForma.caption:='Forma de pagamento';
  end
  else
  begin
    lblForma.caption:='Forma de recebimento do valor à vista';
    timer_lblStatus.enabled:=true;
    if (JaLancouPgtoAVista) then
    begin
      lblstatus.caption:='>>Recebimento à vista efetuado';
      lblstatus.font.color:=clAqua;
    end
    else
    if (GetValorAVistaReceber>0.00) then
    begin
      lblstatus.caption:='>>Recebimento à vista não efetuado';
      lblstatus.font.color:=clRed;
    end
    else
    begin
      lblstatus.caption:='>>Sem valores a receber';
      lblstatus.font.color:=clAqua;
    end;
  end;
end;

procedure Tfrm_ConclueVenda.timer_lblStatusTimer(Sender: TObject);
begin
  if (lblstatus.visible) then
    lblstatus.visible:=false
  else
    lblstatus.visible:=true;
end;

procedure Tfrm_ConclueVenda.FocusControleCheque(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  Panel8.GetTabOrderList(Lista);
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

procedure Tfrm_ConclueVenda.edtFoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (x_saldo_venda>0.00) then
      Inserirforma1.click
    else
      edtRecebido_.setfocus;
  if (key=K_CIMA) then
    edtNome.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCpfExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cpf: String;
begin
     {exibindo dados do cliente}
  cpf:=Trim(edtCpf.text);
  if (cpf<>'') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam('SELECT CL_FONE,CL_NOME FROM CRECLI     ');
    clAux.AddParam('WHERE (CL_CPF='+chr(39)+cpf+chr(39)+') ');
    if (clAux.Execute) then
    begin
      edtNome.text:=clAux.result('CL_NOME');
      edtFone.text:=clAux.result('CL_FONE');
    end
    else
    begin
      edtNome.text:='';
      edtFone.text:='';
    end;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure Tfrm_ConclueVenda.edtCodBancoExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtCodBanco.text);
  if (codigo<>'') then
  begin
    edtNomeBanco.text := ProcuraNomeBanco (strtofloat(codigo),self);
    edtCodBanco.text := form_nz(strtofloat(codigo),3);
  end;
end;

procedure Tfrm_ConclueVenda.edtCodBancoDblClick(Sender: TObject);
begin
  with (frm_f8Bancos) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodBanco;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_ConclueVenda.edtTotalDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtTotalDescKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtTotalDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodForma.setfocus;
  if (key=K_CIMA) then
    edtVendedor.setfocus;
end;

procedure Tfrm_ConclueVenda.edtTotalDescExit(Sender: TObject);
var
  total_desc: Real;
begin
  edtDesc.text := '0,00';
  if (Trim(edtTotalDesc.text)<>'') then
  begin
    total_desc          := strtofloat(RetiraFormatacaoNumero(sem_brancos(edtTotalDesc.text)));
    x_novo_total_venda  := x_total_venda - total_desc;
    edtDesc.text        := form_nc(((total_desc/x_total_venda)*100),18);
    edtTotalDesc.text   := form_nc(total_desc,18);
    x_saldo_venda       := RetornaSaldoVenda;
    ExibeStatus(x_saldo_venda);
  end;
  pnTotalVenda.caption     := form_nc(x_novo_total_venda,18);
  pnSaldoAPagar.caption    := form_nc(x_saldo_venda,18);
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorChange(Sender: TObject);
var
  codigo_forma: String;
begin
  if (x_saldo_venda>0.00) then
  begin
    codigo_forma:=Trim(edtCodForma.text);
    if (codigo_forma<>'') then
      if (strtofloat(codigo_forma)=2) then {* crediario}
        edtTotalContrato.text:=edtValor.text;
  end;
end;

procedure Tfrm_ConclueVenda.edtTotalContratoChange(Sender: TObject);
begin
  if (edtTotalContrato.text<>'') then
    edtValor.text := edtTotalContrato.text;
end;

procedure Tfrm_ConclueVenda.edtCpf_crediarioEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCpf_crediarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtContrato.setfocus;
  if (key=K_CIMA) then
    edtValor.setfocus;
  if (key=K_F7) then
  begin
    lblCliente.caption       := 'Código do cliente';
    edtCpf_crediario.visible := false;
    edtCliente.visible       := true;
    edtCliente.setfocus;
  end;
end;

procedure Tfrm_ConclueVenda.edtNome_crediarioEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtNome_crediarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtTotalContrato.setfocus;
  if (key=K_CIMA) then
    edtContrato.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCpf_crediarioExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cpf: String;
begin
     {exibindo dados do cliente}
  cpf:=Trim(edtCpf_crediario.text);
  if (cpf<>'') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect  ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam('SELECT CL_FONE,CL_NOME,CL_CODI FROM CRECLI     ');
    clAux.AddParam('WHERE (CL_CPF='+chr(39)+cpf+chr(39)+')         ');
    if (clAux.Execute) then
    begin
      edtNome_crediario.text:=clAux.result('CL_NOME');
      edtCliente.text       :=form_n(clAux.result('CL_CODI'),6);
    end
    else
      edtNome_crediario.text:='';
    clAux.desconect;
    clAux.Free;
  end;
end;

function Tfrm_ConclueVenda.LancouValorMaiorSaldo:Boolean;
var
  saldo_venda: Real;
  valor: Real;
begin
  saldo_venda := (strtofloat(Trim(RetiraFormatacaoNumero(form_nc(x_saldo_venda*100,10)))))/100;
  valor       := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
  valor       := (strtofloat(Trim(RetiraFormatacaoNumero(form_nc(valor*100,10)))))/100;
  if (valor>saldo_venda) then
    result:=true
  else
    result:=false;
end;

procedure Tfrm_ConclueVenda.edtClienteExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  codigo: String;
begin
     {exibindo dados do cliente}
  codigo := Trim(edtCliente.text);
  if (codigo<>'') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect  ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam('SELECT CL_FONE,CL_NOME,CL_CPF FROM CRECLI  ');
    clAux.AddParam('WHERE (CL_CODI='+codigo+')                 ');
    if (clAux.Execute) then
    begin
      edtNome_crediario.text:=clAux.result('CL_NOME');
      edtCpf_crediario.text :=clAux.result('CL_CPF');
    end
    else
      edtNome_crediario.text:='';
    clAux.desconect;
    clAux.Free;
  end;
end;

end.
