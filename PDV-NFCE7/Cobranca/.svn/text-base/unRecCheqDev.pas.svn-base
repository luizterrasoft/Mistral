unit unRecCheqDev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Menus;

type
  Tfrm_RecCheqDev = class(TForm)
    Bevel2: TBevel;
    Label1: TLabel;
    edtPort: TMaskEdit;
    pnPort: TPanel;
    Bevel3: TBevel;
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    btnBaixar: TButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    edtBanco: TMaskEdit;
    edtNumero: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtData: TMaskEdit;
    Label5: TLabel;
    pnValor: TPanel;
    Label6: TLabel;
    edtValor: TMaskEdit;
    Label7: TLabel;
    pnDif: TPanel;
    Label8: TLabel;
    edtObs: TMaskEdit;
    Bevel1: TBevel;
    lbF8mens: TLabel;
    lbF8: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lbCCgc: TLabel;
    Label11: TLabel;
    lbBanco: TLabel;
    Label12: TLabel;
    lbPort: TLabel;
    Label13: TLabel;
    lbVencto: TLabel;
    Label16: TLabel;
    lbAlinea: TLabel;
    Label17: TLabel;
    edtCpf: TMaskEdit;
    edtCliente: TMaskEdit;
    chSpc: TCheckBox;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure edtPortEnter(Sender: TObject);
    procedure edtBancoEnter(Sender: TObject);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtDataEnter(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtObsEnter(Sender: TObject);
    procedure edtPortKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtObsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorExit(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure edtPortDblClick(Sender: TObject);
    procedure edtPortExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfEnter(Sender: TObject);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure edtCpfDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flagLog: Boolean;
    procedure GravaChequeDevolvidoParaConferenciaDoCaixa(cpf: String; banco,numero,valor,operadorcaixa: Real; data: TDateTime);
    procedure LimparEdits;
    procedure VerificaPrestacaoChequeDev (ccgc,banco,numero: String);
    procedure RegularizaChequeDevolvido(ccgc: String; banco,numero: Real);
  end;

var
  frm_RecCheqDev: Tfrm_RecCheqDev;

implementation

uses F8Lojas, unDialogo, principal, funcoes1, funcoes2, chequesdev, chequesdvpg,
  cheques, prestcontrato, chequespg, credito, procura, f8Port,
  f8Clientes, cliente, DM9, auxiliar, DM7;

{$R *.DFM}

procedure Tfrm_RecCheqDev.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_RecCheqDev.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_RecCheqDev.btnBaixarClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_RecCheqDev.edtPortEnter(Sender: TObject);
begin
  edtPort.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_RecCheqDev.edtBancoEnter(Sender: TObject);
begin
  edtBanco.selectall;
end;

procedure Tfrm_RecCheqDev.edtNumeroEnter(Sender: TObject);
begin
  edtNumero.selectall;
end;

procedure Tfrm_RecCheqDev.edtDataEnter(Sender: TObject);
begin
  edtData.selectall;     
end;

procedure Tfrm_RecCheqDev.edtValorEnter(Sender: TObject);
begin
  edtValor.selectall;
end;

procedure Tfrm_RecCheqDev.edtObsEnter(Sender: TObject);
begin
  edtObs.selectall;
end;

procedure Tfrm_RecCheqDev.edtPortKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCpf.setfocus;
  if (key=K_F8) then
    with (frm_f8Port) do
    begin
      left:=287;
      top :=76;
      edit:=edtPort;
      btnCadastro.visible:=true;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do portador; Formato: 9999; Tecle'+
      ' <F8/Duplo clique> para selecionar portadores cadastrados.',10);
end;

procedure Tfrm_RecCheqDev.edtBancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNumero.setfocus;
  if (key=38) then
    edtCpf.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número do banco; Formato: 999999999',10);
end;

procedure Tfrm_RecCheqDev.edtNumeroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtData.setfocus;
  if (key=38) then
    edtBanco.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número do cheque no talão: Formato: 9999999999 ',10);
end;

procedure Tfrm_RecCheqDev.edtDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtValor.setfocus;
  if (key=38) then
    edtNumero.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data do recebimento do cheque: Formato: 99/99/9999 ',10);
end;

procedure Tfrm_RecCheqDev.edtObsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnBaixar.click;
  if (key=38) then
    edtValor.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Observação: até 30 caracteres ',10);
end;

procedure Tfrm_RecCheqDev.FormActivate(Sender: TObject);
begin
  edtPort.setfocus;
end;

procedure Tfrm_RecCheqDev.LimparEdits;
begin
  edtCpf.text:='';
  edtBanco.text:='';
  edtNumero.text:='';
  pnValor.caption:='';
  pnDif.caption:='';
  edtData.text:='';
  edtValor.text:='';
  edtObs.text:='';
  lbCCgc.caption:='';
  lbBanco.caption:='';
  lbPort.caption:='';
  lbVencto.caption:='';
  lbAlinea.caption:='';
end;

procedure Tfrm_RecCheqDev.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtCpf.setfocus;
end;

{Busca pelo cheque devolvido ***}
procedure Tfrm_RecCheqDev.edtNumeroExit(Sender: TObject);
var
  clCheq: TClassChequeDev;
  ccgc,cnpj,banco,numero: String;
begin
  ccgc   := Trim(edtCpf.text);
  banco  := Trim(edtBanco.text);
  numero := Trim(edtNumero.text);
  if (banco<>'') and (numero<>'') and (ccgc<>'') then
  begin
    clCheq:=TClassChequeDev.Create;
    with (clCheq) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CH_BANC,CH_NUME,CH_VALO,CH_STAT,                 ');
      AddParam ('       CH_CCGC,CH_PORT,CH_DVTO,CH_ALIN                  ');
      AddParam ('From   CRECHDEV                                         ');
      AddParam ('Where  (CH_BANC='+banco+') AND (CH_NUME='+numero+') AND ');
      AddParam ('       (CH_CCGC='+chr(39)+ccgc+chr(39)+')  ');
      if (not Execute) then
      begin
                    {verificando se o cheque foi cadastrado ---}
        frmDialogo.ExibirMensagem (' Cheque não encontrado! '
          ,'Recebimento de cheque devolvido',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtCpf.setfocus;
      end
      else
      begin
                    {dados do cheque}
        if (edtData.text='  /  /    ') then
          edtData.text:=datetostr(frm_principal.x_data_trabalho);
        if (Length(Result('CH_CCGC'))=14) then
          cnpj := ExibeCgc(Result('CH_CCGC'))
        else
          cnpj := ExibeCpf(Result('CH_CCGC'));
        lbCCgc.caption   := cnpj;
        lbBanco.caption  := form_nz(Result('CH_BANC'),4);
        lbPort.caption   := form_nz(Result('CH_PORT'),4)+'/'+
          ProcuraNomePortador(Result('CH_PORT'),self);
        lbVencto.caption := form_data(Result('CH_DVTO'));
        lbAlinea.caption := form_t(Result('CH_ALIN'),2);
        pnValor.caption  := form_nc(clCheq.Result('CH_VALO'),10);
      end;
      desconect;
      Free;
    end;
  end;
end;

procedure Tfrm_RecCheqDev.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtObs.setfocus;
  if (key=38) then
    edtData.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor do recebimento do cheque: Formato: 9999,99 ',10);
end;

{diferenca calculada}
procedure Tfrm_RecCheqDev.edtValorExit(Sender: TObject);
var
  valor1,valor2: Real;
begin
  RetiraFormatacaoNumero (edtValor.text);
  FormatarZerosDecimais (edtValor);

     {calculando a diferenca}
  if (Trim(edtValor.text)<>'') then
  begin
    valor1:=strtofloat(Trim(edtValor.text));
    if (Trim(pnValor.caption)<>'') then
    begin
      valor2:=strtofloat(RetiraFormatacaoNumero(Trim(pnValor.caption)));
      pnDif.caption:=form_nc(valor1-valor2,10);
    end;
  end;
end;

procedure Tfrm_RecCheqDev.edtDataExit(Sender: TObject);
begin
  if (not IsDate (edtData.text) and (edtData.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data do recebimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData.setfocus;
  end;
end;

procedure Tfrm_RecCheqDev.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValor);
end;

{Opcao de registro da baixa automatica ***}
procedure Tfrm_RecCheqDev.Registrarbaixadodocumento1Click(Sender: TObject);
var
  ccgc,banco,numero: String;
begin
     {CRITICA AOS DADOS DA BAIXA ***}
  if (Trim(edtPort.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O portador do recebimento não pode ficar vazio!'
      ,'Recebimento de cheque devolvido',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtPort.setfocus;
  end
  else
  if (Trim(edtBanco.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O número do banco não foi informado!'
      ,'Recebimento de cheque devolvido',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtBanco.setfocus;
  end
  else
  if (Trim(edtNumero.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O número do cheque não foi informado!'
      ,'Recebimento de cheque devolvido',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumero.setfocus;
  end
  else
  if (edtData.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' A data de recebimento não foi informada!'
      ,'Recebimento de cheque devolvido',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData.setfocus;
  end
  else
  if (Trim(edtValor.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O valor recebido não foi informado!'
      ,'Recebimento de cheque devolvido',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  begin
         {buscando dados do cheque ----}
    ccgc   := Trim(edtCpf.text);
    banco  := Trim(edtBanco.text);
    numero := Trim(edtNumero.text);
    if (banco<>'') and (numero<>'') and (ccgc<>'') then
    begin
              {realizando a quitacao}
      QuitaChequeDev (ccgc,banco,numero,
        strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text))),
        strtodate(Trim(edtData.text)),
        Trim(edtObs.text),
        strtofloat(Trim(edtPort.text)));
      QuitaChequePre1 (ccgc,banco,numero,StrToDateTime(edtData.Text),strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text))));
      VerificaPrestacaoChequeDev (ccgc,banco,numero);
      if (chSpc.checked) then
        RegularizaChequeDevolvido(ccgc,strtofloat(banco),strtofloat(numero));

              {Marcando/desmarcando o flag de cheque do cliente --->}
      ClienteComChequeDevolvido (ccgc);

              //gravando com dados do cheque para conferencia do CAIXA
      GravaChequeDevolvidoParaConferenciaDoCaixa(ccgc,
        strtofloat(banco),
        strtofloat(numero),
        strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text))),
        frm_principal.x_caixa_ativo,
        strtodate(Trim(edtData.text)));

              {exibicao de dados}
      frm_principal.BarraDicas.caption:='';
      frm_principal.ExibirDica ('Recebimento do cheque devolvido registrado...',5);

              {gravacao em log***}
      Limparformulrio1.click;
    end;
  end;
end;

procedure Tfrm_RecCheqDev.edtPortDblClick(Sender: TObject);
begin
  with (frm_f8Port) do
  begin
    left:=287;
    top :=76;
    edit:=edtPort;
    btnCadastro.visible:=true;
    showmodal;
  end;
end;

{Busca pela loja de recebimento ***}
procedure Tfrm_RecCheqDev.edtPortExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtPort.text);
  if (codigo<>'') then
  begin
    pnPort.caption:=ProcuraNomePortador(strtofloat(codigo),self);
    edtPort.text:=form_nz(strtofloat(codigo),4);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

{Verificando se existe alguma prestacao em aberto ***}
procedure Tfrm_RecCheqDev.VerificaPrestacaoChequeDev (ccgc,banco,numero: String);
var
  clPrest: TClassPrestContrat;
  data: TDateTime;
  fpgt,valor: Real;
begin
     {Buscando prestacao ***}
  clPrest := TClassPrestContrat.Create;
  with (clPrest) do
  begin
    conect (databasecredito,self);
    ClearSql;
    addparam('Select min(Fp_Codi) as fp_codi from CREFPGT where fp_tipo = ''BAIXA CHEQUE'' ');
    execute;

    fpgt := result('Fp_Codi');

    ClearSql;
    AddParam ('Select PC_CLIE,PC_CONT,PC_LOJA,PC_NPRE,PC_CHEQ,PC_DVTO,PC_VALO,  ');
    AddParam ('       PC_VPAG,PC_DTPG,PC_FPGT                                   ');
    AddParam ('From   CREPRABR                                                  ');
    AddParam ('Where  (PC_STAT='+chr(39)+'0'+chr(39)+') AND                     ');
    AddParam ('       (PC_BANC='+banco+') AND                                   ');
    AddParam ('       (PC_NUME='+numero+') AND                                  ');
    AddParam ('       (PC_CCGC='+chr(39)+ccgc+chr(39)+')                        ');
    if (Execute) then
    begin
      data  := strtodate(edtData.text);
      valor := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
      if (clPrest.Result('PC_VPAG')=0.00) then
        QuitaPrestacao (clPrest.Result('PC_CLIE'),
          clPrest.Result('PC_CONT'),
          clPrest.Result('PC_NPRE'),
          clPrest.Result('PC_LOJA'),
          valor,
          data,
          Fpgt)
                                 {HOJE = data do recebimento!}
      else
        QuitaPrestacao (clPrest.Result('PC_CLIE'),
          clPrest.Result('PC_CONT'),
          clPrest.Result('PC_NPRE'),
          clPrest.Result('PC_LOJA'),
          clPrest.Result('PC_VPAG'),
          clPrest.Result('PC_DTPG'),
          data,
          false,
          data,
          valor);
    end;
    desconect;
    Free;
  end;
end;

procedure Tfrm_RecCheqDev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_RecCheqDev.edtCpfEnter(Sender: TObject);
begin
  edtCpf.selectall;
end;

procedure Tfrm_RecCheqDev.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codigo: String;
  clClient: TClassCliente;
begin
  if (key=13) or (key=40) then
    edtBanco.setfocus;
  if (key=38) then
    edtPort.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   CPF/CGC do emitente: até 14 dígitos',10);
  if (key=K_F8) then
  begin
    with (frm_f8Clientes) do
    begin
      edit:=edtCliente;
      showmodal;
    end;
    codigo:=Trim(edtCliente.text);
    if (codigo<>'') then
    begin
      clClient := TClassCliente.Create;
      with (clClient) do
      begin
        conect ('CREDITO',self);
        ClearSql;
        AddParam ('Select CL_CODI,CL_CPF ');
        AddParam ('From   CRECLI  ');
        AddParam ('Where  (CL_CODI='+codigo+') ');
        Execute;
        edtCpf.text := Trim(result('CL_CPF'));
        desconect;
        Free;
      end;
    end;
  end;
end;

procedure Tfrm_RecCheqDev.FormCreate(Sender: TObject);
begin
  flagLog:=true;
end;

procedure Tfrm_RecCheqDev.edtCpfExit(Sender: TObject);
begin
  CriticaCNPJ(edtCpf);
end;

procedure Tfrm_RecCheqDev.edtCpfDblClick(Sender: TObject);
var
  codigo: String;
  clClient: TClassCliente;
begin
  with (frm_f8Clientes) do
  begin
    edit:=edtCliente;
    showmodal;
  end;
  codigo:=Trim(edtCliente.text);
  if (codigo<>'') then
  begin
    clClient := TClassCliente.Create;
    with (clClient) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CL_CODI,CL_CPF            ');
      AddParam ('From   CRECLI                    ');
      AddParam ('Where  (CL_CODI='+codigo+')      ');
      Execute;
      edtCpf.text := Trim(result('CL_CPF'));
      desconect;
      Free;
    end;
  end;
end;

procedure Tfrm_RecCheqDev.RegularizaChequeDevolvido(ccgc: String; banco,numero: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('Select * From CHEQUES_DEV_SPC               ');
  clAux.AddParam ('Where (CCGC='+chr(39)+ccgc+chr(39)+') AND   ');
  clAux.AddParam ('      (BANCO='+floattostr(banco)+') AND     ');
  clAux.AddParam ('      (NUMERO='+floattostr(numero)+')       ');
  if (clAux.Execute) then
  begin
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('ccgc').AsString      := clAux.Result('CCGC');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('banco').AsFloat      := clAux.Result('BANCO');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('numero').AsFloat     := clAux.Result('NUMERO');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('valor').AsFloat      := clAux.Result('VALOR');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('loja').AsFloat       := clAux.Result('LOJA');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('data').AsDateTime    := clAux.Result('DATA');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('vencimento').AsDateTime := clAux.Result('VENCIMENTO');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('dataspc').AsDateTime := clAux.result('DATASPC');
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('datareg').AsDateTime := frm_principal.x_data_trabalho;
    DMBaixAutCheq.qAltManContSPCCheqDev.parambyname('status').AsString    := '1';
    DMBaixAutCheq.qAltManContSPCCheqDev.ExecSql;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_RecCheqDev.GravaChequeDevolvidoParaConferenciaDoCaixa
  (cpf: String; banco,numero,valor,operadorcaixa: Real; data: TDateTime);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VALOR FROM CHEQUES_DEVOLVIDOS_RECEBIDOS            ');
  clAux.AddParam ('WHERE (CPF=:cpf) AND (BANCO=:banco) AND (NUMERO=:numero)  ');
  clAux.consulta.parambyname('cpf').AsString    := cpf;
  clAux.consulta.parambyname('banco').AsFloat   := banco;
  clAux.consulta.parambyname('numero').AsFloat  := numero;
  if (not clAux.Execute) then
  begin
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO CHEQUES_DEVOLVIDOS_RECEBIDOS (LOJA,CPF,BANCO,NUMERO,VALOR,CAIXA,DATA) ');
    clAux.AddParam ('VALUES (:LOJA,:CPF,:BANCO,:NUMERO,:VALOR,:CAIXA,:DATA)                             ');
    clAux.consulta.parambyname('LOJA').AsFloat     := frm_principal.x_Loja;
    clAux.consulta.parambyname('CPF').AsString     := cpf;
    clAux.consulta.parambyname('BANCO').AsFloat    := banco;
    clAux.consulta.parambyname('NUMERO').AsFloat   := numero;
    clAux.consulta.parambyname('VALOR').AsFloat    := valor;
    clAux.consulta.parambyname('CAIXA').AsFloat    := operadorcaixa;
    clAux.consulta.parambyname('DATA').AsDateTime  := data;

    clAux.Execute; {*}

    if databaseprodutos = 'ESTOQUE' then
      try
        Claux.Consulta.Databasename := 'ESTOQUE';
        Claux.Execute;
      except
      end;
  end;
  clAux.desconect;
  clAux.Free;
end;

end.
