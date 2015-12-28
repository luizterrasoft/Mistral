unit unLancReceb2OffLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Menus, ComCtrls;

type
  Tfrm_LancReceb2OffLine = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Label2: TLabel;
    pnContrato: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtCodLoja: TMaskEdit;
    edtCodCli: TMaskEdit;
    edtCodCont: TMaskEdit;
    edtNPre: TMaskEdit;
    edtDV: TMaskEdit;
    Label16: TLabel;
    Bevel3: TBevel;
    Label3: TLabel;
    edtDatPgto: TMaskEdit;
    edtValorPago: TMaskEdit;
    Label6: TLabel;
    pnDif: TPanel;
    Label7: TLabel;
    Label4: TLabel;
    pnCorrigido: TPanel;
    Label5: TLabel;
    pnMulta: TPanel;
    Label8: TLabel;
    pnJuros: TPanel;
    lblFormaPgto: TLabel;
    edtFormaPgto: TMaskEdit;
    pnFormaPgto: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    lbF8: TLabel;
    lbF8mens: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    btnConfere: TPanel;
    Bevel2: TBevel;
    botao_sair: TPanel;
    Label1: TLabel;
    edtVenc: TMaskEdit;
    edtValorPrestacao: TMaskEdit;
    Label9: TLabel;
    StatusBar1: TStatusBar;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtCodLojaChange(Sender: TObject);
    procedure edtCodLojaEnter(Sender: TObject);
    procedure edtCodLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodCliChange(Sender: TObject);
    procedure edtCodCliEnter(Sender: TObject);
    procedure edtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodContChange(Sender: TObject);
    procedure edtCodContEnter(Sender: TObject);
    procedure edtCodContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNPreEnter(Sender: TObject);
    procedure edtNPreExit(Sender: TObject);
    procedure edtNPreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure edtDVEnter(Sender: TObject);
    procedure edtDVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDatPgtoEnter(Sender: TObject);
    procedure edtDatPgtoExit(Sender: TObject);
    procedure edtDatPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorPagoEnter(Sender: TObject);
    procedure edtValorPagoExit(Sender: TObject);
    procedure edtValorPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorPagoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtFormaPgtoEnter(Sender: TObject);
    procedure edtFormaPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFormaPgtoDblClick(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure edtVencEnter(Sender: TObject);
    procedure edtValorPrestacaoEnter(Sender: TObject);
    procedure edtValorPrestacaoExit(Sender: TObject);
    procedure edtVencExit(Sender: TObject);
    procedure edtVencKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorPrestacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorPrestacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Exibiu: Boolean;
    flagDV: Boolean;
    procedure LimparEdits;
    procedure SalvarQuitacaoPrestacao(codigocliente,codigocontrato,numeroprestacao,valor: Real;
      datavencimento,datapagamento: TDateTime; codigoloja,valorpago: Real);
    procedure LancaFormaPgtoPrestacao(codcli,codcont,prestacao: Real; forma_pgto: Real);
  end;

var
  frm_LancReceb2OffLine: Tfrm_LancReceb2OffLine;

implementation

uses principal, F8Lojas, loja, funcoes1, funcoes2, cadcli, unDialogo, prestcontrato, cliente,
  DM5, prestcontratolote, unAux1LancReceb, procura, credito, contratos,
  un_Autentica, auxiliar;

{$R *.DFM}

procedure Tfrm_LancReceb2OffLine.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_LancReceb2OffLine.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancReceb2OffLine.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtCodLoja.text        :='';
  edtCodCli.text         :='';
  edtCodCont.text        :='';
  edtFormaPgto.text      :='';
  pnFormaPgto.caption    :='';
  edtNPre.text           :='';
  edtVenc.text           :='';
  edtValorPrestacao.text :='';
  Registrarbaixadodocumento1.enabled:=false;
  edtCodLoja.setfocus;
end;

procedure Tfrm_LancReceb2OffLine.edtCodLojaChange(Sender: TObject);
begin
  if (Length(Trim(edtCodLoja.text))=2) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtCodLojaEnter(Sender: TObject);
begin
  edtCodLoja.selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtCodLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
  if (key=K_DIR) then
    if (edtCodLoja.selstart=1) then
      edtCodCli.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número do documento: Formato: 99.999999.999999.99',10);
end;

procedure Tfrm_LancReceb2OffLine.edtCodCliChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCli.text))=6) then
  begin
    if (Trim(edtCodCli.text)<>'') then
      edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
    edtCodCont.setfocus;
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtCodCliEnter(Sender: TObject);
begin
  edtCodCli.selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodCli.text)<>'') then
      edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
    edtCodCont.setfocus;
  end;
  if (key=K_CIMA) then
    edtCodLoja.setfocus;
  if (key=K_ESQ) and (edtCodCli.selstart=0) then
    edtCodLoja.setfocus;
  if (key=K_DIR) then
    if (edtCodCli.selstart=5) then
      edtCodCont.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do cliente: Formato 999999',10);
end;

procedure Tfrm_LancReceb2OffLine.edtCodContChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCont.text))=6) then
  begin
    if (Trim(edtCodCont.text)<>'') then
      edtCodCont.text:=form_nz(strtofloat(Trim(edtCodCont.text)),6);
    edtNPre.setfocus;
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtCodContEnter(Sender: TObject);
begin
  edtCodCont.selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtCodContKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodCont.text)<>'') then
      edtCodCont.text:=form_nz(strtofloat(Trim(edtCodCont.text)),6);
    edtNPre.setfocus;
  end;
  if (key=K_CIMA) then
    edtCodCli.setfocus;
  if (key=K_ESQ) and (edtCodCont.selstart=0) then
    edtCodCli.setfocus;
  if (key=K_DIR) then
    if (edtCodCont.selstart=5) then
      edtNPre.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do contrato: formato 999999',10);
end;

procedure Tfrm_LancReceb2OffLine.edtNPreEnter(Sender: TObject);
begin
  edtNPre.selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtNPreExit(Sender: TObject);
begin
  if (Trim(edtNPre.text)<>'') then
    edtNPre.text:=form_nz(strtofloat(Trim(edtNPre.text)),2);
end;

procedure Tfrm_LancReceb2OffLine.edtNPreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clPrest: TClassPrestContrat;
  clPrest2: TClassPrestContratLote;
  prestacao,codcli,codcont: String;
  clClie: TClassCliente;
  clLoja: TClassLoja;
  valor1,valor2: Real;
  continua: Boolean;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtVenc.setfocus;
  if (key=K_CIMA) then
    edtCodCont.setfocus;
  if (key=K_ESQ) and (edtNPre.selstart=0) then
    edtCodCont.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   N. da prestação: formato 99',10);
end;

{Opcao de registro da baixa do documento ****}
procedure Tfrm_LancReceb2OffLine.Registrarbaixadodocumento1Click(Sender: TObject);
var
  clContrato: TClassContrato;
  clPrest: TClassPrestContrat;
  DVcerto: Boolean;
  flag1: Boolean;
  codcli,codcont,prestacao,lojapg: Real;
  loja,valorPago,valorPrest: Real;
  codclis,codconts,prestacaos: String;
  vencimento,datapg: TDateTime;
  erro1,erro2,erro3,erro4,erro5: Boolean;
begin
     {CRITICA AOS DADOS DA BAIXA ***}
  if (Trim(edtCodLoja.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O código da loja de origem da prestação não pode ficar vazia!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodLoja.setfocus;
  end
  else
  if (Trim(edtCodCli.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O código do cliente não pode ficar vazio!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodCli.setfocus;
  end
  else
  if (Trim(edtCodCont.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O código do contrato não pode ficar vazio!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodCont.setfocus;
  end
  else
  if (Trim(edtNPre.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O número da prestação não pode ficar vazio!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNPre.setfocus;
  end
  else
  if (Trim(edtVenc.text)='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' A data do vencimento não pode ficar vazia!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtVenc.setfocus;
  end
  else
  if (Trim(edtValorPrestacao.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O valor da prestacao não pode ficar vazio!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValorPrestacao.setfocus;
  end
  else
  if (Trim(edtDatPgto.text)='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' A data de recebimento não pode ficar vazia!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDatPgto.setfocus;
  end
  else
  if (Trim(edtValorPago.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O valor pago não pode ficar vazio!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValorPago.setfocus;
  end
  else
  if ((not frm_principal.x_pode_valor_dif_pago) and (valorPago<>valorPrest)) then
  begin
    frmDialogo.ExibirMensagem (' O valor pago não pode ser diferente do valor da prestação!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValorPago.setfocus;
    edtValorPago.selectall;
  end
  else
  begin
        {.........................................................................................}
    codclis    := Trim(edtCodCli.text);
    codconts   := Trim(edtCodCont.text);
    prestacaos := Trim(edtNPre.text);
    valorPrest := strtofloat(RetiraFormatacaoNumero(Trim(edtValorPrestacao.text)));
    valorPago  := strtofloat(RetiraFormatacaoNumero(Trim(edtValorPago.text)));
        {.........................................................................................}

        {Testando o digito verificador ***}
    DVcerto:=true;
    if (flagDV) then
      if (Trim(edtDV.text)='') then
      begin
        frmDialogo.ExibirMensagem ('Digito verificador exigido!',
          'Baixa',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
          250,200);
        DVcerto:=false;
        edtDV.setfocus;
      end
      else
      if (DigitoVerificador(Trim(edtCodLoja.text)+Trim(edtCodCli.text)+
        Trim(edtCodCont.text)+Trim(edtNPre.text))<>strtofloat(Trim(edtDV.text)))
      then
      begin
        frmDialogo.ExibirMensagem ('Digito verificador incorreto!',
          'Baixa',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
          250,200);
        DVcerto:=false;
        edtDV.setfocus;
      end;

        {So continua a baixa se o digito verificador estiver certo ****}
        {.........................................................................................}
    if (DVcerto) then
    begin
      frm_principal.BarraDicas.caption:='Realizando baixa da prestação...';
      frm_principal.refresh;

             {Quitando a prestacao --->}
             {.........................................................................................}
      codclis    := Trim(edtCodCli.text);
      codconts   := Trim(edtCodCont.text);
      prestacaos := Trim(edtNPre.text);
      codcli     := strtofloat(Trim(edtCodCli.text));
      codcont    := strtofloat(Trim(edtCodCont.text));
      prestacao  := strtofloat(Trim(edtNPre.text));
      loja       := strtofloat(Trim(edtCodLoja.text));
      lojapg     := frm_principal.x_loja;
      vencimento := strtodate(Trim(edtVenc.text));
      datapg     := strtodate(Trim(edtDatPgto.text));
      valorPrest := strtofloat(RetiraFormatacaoNumero(Trim(edtValorPrestacao.text)));
      valorPago  := strtofloat(RetiraFormatacaoNumero(Trim(edtValorPago.text)));
             {.........................................................................................}

             {PROCESSAMENTO DE LIQUIDACAO DA PRESTACAO --->}
             {.........................................................................................}
      SalvarQuitacaoPrestacao(strtofloat(codclis),strtofloat(codconts),
        strtofloat(prestacaoS),valorPrest,
        vencimento,datapg,loja,valorPago);
      if (frm_principal.x_requisitar_forma_pgto) then
        if (trim(edtFormaPgto.text)='') then
          LancaFormaPgtoPrestacao(codcli,codcont,prestacao,0)
        else
          LancaFormaPgtoPrestacao(codcli,codcont,prestacao,strtofloat(trim(edtFormaPgto.text)));
      frm_principal.BarraDicas.caption:='';
      frm_principal.ExibirDica ('Baixa do documento registrada...',5);

             {*** - autenticacao}
             {.........................................................................................}
      if (frm_principal.x_autenticacao_baixa) then
      begin
        Application.CreateForm(Tfrm_Autentica, frm_Autentica);
        frm_Autentica.cliente   := strtofloat (Trim(edtCodCli.text));
        frm_Autentica.contrato  := strtofloat (Trim(edtCodCont.text));
        frm_Autentica.prestacao := strtoint   (Trim(edtNPre.text));
        frm_Autentica.datapgto  := datapg;
        frm_Autentica.valor     := valorPago;
        frm_Autentica.showmodal;
        frm_Autentica.Free;
      end;

             {exibindo o ultimo documento fornecido para baixa ***}
      Limparformulrio1.click;
    end;
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtDVEnter(Sender: TObject);
begin
  edtDV.selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtDVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_CIMA) or (key=K_ENTER) then
  begin
          {CRITICA AO DV.}
    if (Trim(edtDV.text)='') then
      edtDV.text:='0';
    if (DigitoVerificador(Trim(edtCodLoja.text)+Trim(edtCodCli.text)+
      Trim(edtCodCont.text)+Trim(edtNPre.text))<>strtofloat(Trim(edtDV.text))) then
    begin
      frmDialogo.ExibirMensagem ('Digito verificador incorreto!',
        'Baixa',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
        250,200);
      edtDV.selectall;
      edtDV.setfocus;
    end
    else
      edtDatPgto.setfocus;
  end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Dígito verificador: formato 9',10);
end;

procedure Tfrm_LancReceb2OffLine.LimparEdits;
begin
  edtCodLoja.text :='';
  edtCodCli.text  :='';
  edtCodCont.text :='';
  edtNPre.text    :='';
  edtValorPrestacao.text   :='';
  edtValorPago.text        :='';
  pnDif.caption   :='';
  edtDV.text      :='';
  pnCorrigido.caption:='';
  pnMulta.caption :='';
  pnJuros.caption :='';
end;

procedure Tfrm_LancReceb2OffLine.edtDatPgtoEnter(Sender: TObject);
begin
  if (edtDatPgto.text='  /  /    ') then
    edtDatPgto.text:=form_data(frm_principal.x_data_trabalho);
  edtDatPgto.selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtDatPgtoExit(Sender: TObject);
begin
     {Verificando se a data é válida---}
  if (not IsDate (edtDatPgto.text) and (edtDatPgto.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Baixa',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDatPgto.setfocus;
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtDatPgtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValorPago.setfocus;
  if (key=K_CIMA) then
    edtValorPrestacao.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de recebimento: Formato 99/99/9999',10);
end;

procedure Tfrm_LancReceb2OffLine.edtValorPagoEnter(Sender: TObject);
var
  clLoja: TClassLoja;
  valorPrest,atraso: Real;
  data1,data2: TDateTime;
  multa,juros: Real;
begin
     {CRITICA AOS DADOS ANTERIORES ***}
  if (edtVenc.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' Data de vencimento não pode ficar nula!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtVenc.setfocus;
  end
  else
  if (edtDatPgto.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' Data de recebimento não pode ficar nula!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDatPgto.setfocus;
  end
  else
  begin
          {***********************************************************************}
          {... //ESTA BUSCA DEVE CONTINUAR MAS DEVERA ESTAR GUARDADA NO ARQUIVO 'CONF' DO VENDAS!}
    clLoja := TClassLoja.Create;
    with (clLoja) do
    begin
      conect   (databasecredito,self);
      ClearSql;
      AddParam ('Select LO_MULT,LO_DMUL,LO_MORA,LO_DMOR                                  ');
      if (databasecredito='CREDITO') then
        AddParam ('FROM CRELOJA WHERE (LO_CODI='+floattostr(frm_principal.x_loja)+')  ')
      else
        AddParam ('From   CONF                                                        ');
      if (Execute) then
      begin
        pnMulta.caption:=form_nc(result('LO_MULT'),5)+' após '+form_n(result('LO_DMUL'),3)+' dia(s) ';
        pnJuros.caption:=form_nc(result('LO_MORA'),5)+' após '+form_n(result('LO_DMOR'),3)+' dia(s) ';
      end
      else
      begin
        pnMulta.caption:='';
        pnJuros.caption:='';
      end;
      desconect;
      Free;
    end;
          {***********************************************************************}
    data1  := strtodate(edtDatPgto.text);
    data2  := strtodate(edtVenc.text);
    atraso :=  data1 - data2;
    if (atraso<0) then
      atraso:=0;
          {***********************************************************************}
    if (Trim(edtValorPrestacao.text)<>'') then
      valorPrest := strtofloat(RetiraFormatacaoNumero(Trim(edtValorPrestacao.text)))
    else
      valorPrest := 0.00;
    multa  := LerMulta(valorPrest,atraso,frm_principal.x_loja);
    juros  := LerJuros(valorPrest,atraso,frm_principal.x_loja);
          {***********************************************************************}
    pnCorrigido.caption := form_nc(valorPrest+multa+juros,10);
  end;
  edtValorPago.selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtValorPagoExit(Sender: TObject);
var
  valorPrest,valorPago: Real;
begin
  RetiraFormatacaoNumero (edtValorPago.text);
  FormatarZerosDecimais (edtValorPago);

     {calculando a diferenca}
  if (Trim(edtValorPago.text)<>'') and (Trim(edtValorPrestacao.text)<>'') then
  begin
    valorPrest := strtofloat(Trim(edtValorPrestacao.text));
    valorPago := strtofloat(Trim(edtValorPago.text));
    pnDif.caption := form_nc(valorPago-valorPrest,10);
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtValorPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtFormaPgto.visible) then
      edtFormaPgto.setfocus
    else
      btnConfereClick(Sender);
  if (key=K_CIMA) then
    edtDatPgto.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor recebido: Formato 999,99',10);
end;

procedure Tfrm_LancReceb2OffLine.edtValorPagoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValorPago);
end;

procedure Tfrm_LancReceb2OffLine.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_LancReceb2OffLine.FormActivate(Sender: TObject);
begin
  edtCodLoja.setfocus;
  if (edtDatPgto.text='  /  /    ') then
    edtDatPgto.text:=form_data(frm_principal.x_data_trabalho);

     {Config.}
  if (flagDV) then
  begin
    edtDV.visible   :=true;
    Label16.visible :=true;
  end
  else
  begin
    edtDV.visible   :=false;
    Label16.visible :=false;
  end;
  if (frm_principal.x_autenticacao_baixa) then
    StatusBar1.Panels[0].text :='[Autenticação da baixa: ATIVADA]'
  else
    StatusBar1.Panels[0].text :='[Autenticação da baixa: DESATIVADA]';
end;

procedure Tfrm_LancReceb2OffLine.FormCreate(Sender: TObject);
begin
  Exibiu:=false;

     {Pergunta pelo digito --}
  if (frmDialogo.ExibirMensagem ('Requisitar dígito verificador?',
    'Baixa',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
    250,200)=mrYes) then
    flagDV:=true
  else
    flagDV:=false;

     {Config. do formulario---}
  if (frm_principal.x_requisitar_forma_pgto) then
  begin
    lblFormaPgto.visible:=true;
    edtFormaPgto.visible:=true;
    pnFormaPgto.visible:=true;
  end
  else
  begin
    lblFormaPgto.visible:=false;
    edtFormaPgto.visible:=false;
    pnFormaPgto.visible:=false;
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtFormaPgtoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtFormaPgtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtValorPago.setfocus;
  if (key=K_ENTER) then
    btnConfereClick(Sender);
  if (key=K_F8) then
    ChamandoF8FormaPgto(edtFormaPgto,true);
end;

procedure Tfrm_LancReceb2OffLine.edtFormaPgtoDblClick(Sender: TObject);
begin
  ChamandoF8FormaPgto(edtFormaPgto,true);
end;

procedure Tfrm_LancReceb2OffLine.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_LancReceb2OffLine.edtVencEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtValorPrestacaoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancReceb2OffLine.edtValorPrestacaoExit(Sender: TObject);
begin
  RetiraFormatacaoNumero (edtValorPrestacao.text);
  FormatarZerosDecimais (edtValorPrestacao);
end;

procedure Tfrm_LancReceb2OffLine.edtVencExit(Sender: TObject);
begin
     {Verificando se a data é válida---}
  if (not IsDate (edtVenc.text) and (edtVenc.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Baixa',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtVenc.setfocus;
  end;
end;

procedure Tfrm_LancReceb2OffLine.edtVencKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValorPrestacao.setfocus;
  if (key=K_CIMA) then
    edtNPre.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data do vencimento: Formato 99/99/9999',10);
end;

procedure Tfrm_LancReceb2OffLine.edtValorPrestacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (edtValorPrestacao);
end;

procedure Tfrm_LancReceb2OffLine.edtValorPrestacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDatPgto.setfocus;
  if (key=K_CIMA) then
    edtVenc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor da prestação: Formato 999,99',10);
end;

procedure Tfrm_LancReceb2OffLine.SalvarQuitacaoPrestacao(codigocliente,codigocontrato,numeroprestacao,valor: Real;
  datavencimento,datapagamento: TDateTime; codigoloja,valorpago: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecredito,self);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO CREPRABR(PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_DVTO,     ');
  clAux.AddParam ('                     PC_DTPG,PC_DTRA,PC_LOJA,PC_LJPG,             ');
  clAux.AddParam ('                     PC_VPAG,PC_STAT,PC_FUNC,PC_CAIX,             ');
  clAux.AddParam ('                     PC_TIME)                                     ');
  clAux.AddParam ('VALUES (:PC_CLIE,:PC_CONT,:PC_NPRE,:PC_VALO,:PC_DVTO,             ');
  clAux.AddParam ('                     :PC_DTPG,:PC_DTRA,:PC_LOJA,:PC_LJPG,         ');
  clAux.AddParam ('                     :PC_VPAG,:PC_STAT,:PC_FUNC,:PC_CAIX,         ');
  clAux.AddParam ('                     :PC_TIME)                                    ');
  clAux.consulta.parambyname('PC_CLIE').AsFloat    := codigocliente;
  clAux.consulta.parambyname('PC_CONT').AsFloat    := codigocontrato;
  clAux.consulta.parambyname('PC_NPRE').AsFloat    := numeroprestacao;
  clAux.consulta.parambyname('PC_VALO').AsFloat    := valor;
  clAux.consulta.parambyname('PC_DVTO').AsDateTime := datavencimento;
  clAux.consulta.parambyname('PC_DTPG').AsDateTime := datapagamento;
  clAux.consulta.parambyname('PC_DTRA').AsDateTime := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('PC_LOJA').AsFloat    := codigoloja;
  clAux.consulta.parambyname('PC_LJPG').AsFloat    := frm_principal.x_loja;
  clAux.consulta.parambyname('PC_VPAG').AsFloat    := valorpago;
  clAux.consulta.parambyname('PC_STAT').AsString   := '1';
  clAux.consulta.parambyname('PC_FUNC').AsFloat    := frm_principal.x_caixa_ativo;
  clAux.consulta.parambyname('PC_CAIX').AsFloat    := frm_principal.x_terminal;
  clAux.consulta.parambyname('PC_TIME').AsDateTime := frm_principal.x_data_trabalho;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancReceb2OffLine.LancaFormaPgtoPrestacao(codcli,codcont,prestacao: Real; forma_pgto: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecredito,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE CREPRABR SET PC_FPGT=:forma_pgto   ');
  clAux.AddParam ('WHERE (PC_CLIE=:cliente) AND              ');
  clAux.AddParam ('      (PC_CONT=:contrato) AND             ');
  clAux.AddParam ('      (PC_NPRE=:prestacao)                ');
  clAux.consulta.parambyname('cliente').AsFloat    := codcli;
  clAux.consulta.parambyname('contrato').AsFloat   := codcont;
  clAux.consulta.parambyname('prestacao').AsFloat  := prestacao;
  clAux.consulta.parambyname('forma_pgto').AsFloat := forma_pgto;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

end.
