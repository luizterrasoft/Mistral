unit un_FechamentoVenda_Cred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls, Mask, LabelOO;

type
  Tfrm_FechamentoVenda_Cred = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Image2: TImage;
    Label2: TLabel;
    Label12: TLabel;
    Confirmardados1: TMenuItem;
    botao1: TPanel;
    botaoSair: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    lblCliente: TLabel;
    edtCliente: TMaskEdit;
    edtContrato: TMaskEdit;
    Label13: TLabel;
    Label1: TLabel;
    edtNome_crediario: TMaskEdit;
    edtTotalContrato: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    edtValorEntrada: TMaskEdit;
    edtValorFinanciado: TMaskEdit;
    Label21: TLabel;
    Bevel3: TBevel;
    edtCpf_crediario: TMaskEdit;
    pnAlerta: TPanel;
    TimerAlerta: TTimer;
    Bevel4: TBevel;
    pnValoresJaInformados: TPanel;
    lista: TListBox;
    LabelOO1: TLabelOO;
    edtNumBoleta: TMaskEdit;
    Label5: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteDblClick(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContratoEnter(Sender: TObject);
    procedure edtContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNome_crediarioEnter(Sender: TObject);
    procedure edtNome_crediarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalContratoEnter(Sender: TObject);
    procedure edtTotalContratoExit(Sender: TObject);
    procedure edtTotalContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalContratoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorEntradaEnter(Sender: TObject);
    procedure edtValorEntradaExit(Sender: TObject);
    procedure edtValorEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorEntradaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorFinanciadoEnter(Sender: TObject);
    procedure edtValorFinanciadoExit(Sender: TObject);
    procedure edtValorFinanciadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorFinanciadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpf_crediarioEnter(Sender: TObject);
    procedure edtCpf_crediarioExit(Sender: TObject);
    procedure edtCpf_crediarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerAlertaTimer(Sender: TObject);
    procedure edtValorEntradaChange(Sender: TObject);
    procedure listaDblClick(Sender: TObject);
    procedure listaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContratoExit(Sender: TObject);
    procedure edtNumBoletaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumBoletaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    qtdeBoletas: String;
    y_cliente,y_contrato,y_plano: Real;
    jaChamou: Boolean;
    tecla: Integer;
    motivobloqueio: String;
    y_sequencial_forma_pagamento_entrada: Integer;
    procedure CalculaTotalContrato;
    procedure LimparEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure ExibeDadosDoContrato;
    function  SugereValorEntradaDoCrediarioDaVenda:Real;
    function VerificaBoleta: Boolean;
    function ConfirmaCadastroCrediario(Cliente, Contrato: String): boolean;
    function LiberaVendaZerado: boolean;
    function VerificaFoto(cpf: String): boolean;
  end;

var
  frm_FechamentoVenda_Cred: Tfrm_FechamentoVenda_Cred;

implementation

uses f8Bancos, auxiliar, funcoes1, funcoes2, procura, principal, un_F8Adm,
  f8Clientes, un_FechamentoVenda, credito, unDialogo,
  un_frmConsulta1_Observacao, f8Planos, plano, un_senhaSupervisor,
  USenhaConfirmacao;

{$R *.DFM}

procedure Tfrm_FechamentoVenda_Cred.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Cred.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  if (Trim(edtValorFinanciado.Text) <> '') then
    FormatarZerosDecimais(edtValorFinanciado);
  edtValorEntrada.Text :=  form_nc(frm_FechamentoVenda.totalEntrada,12);
  FormatarZerosDecimais(edtValorEntrada);
  if (not JaChamou) then
  begin
    Limparformulrio1.click;
    JaChamou:=true;
  end;

  edtCliente.setfocus;

  if edtcliente.tag = 1 then
  begin
    edtcliente.onexit(edtcliente);
    edtcontrato.onexit(edtcontrato);
    edtcliente.tag := 2;
  end;
end;

procedure Tfrm_FechamentoVenda_Cred.FocusControle(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
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

procedure Tfrm_FechamentoVenda_Cred.botao1Click(Sender: TObject);
begin
  if (edtNumBoleta.Visible) then
  begin
    if (VerificaBoleta) then
      Confirmardados1.click;
  end
  else
    Confirmardados1.click;
end;

procedure Tfrm_FechamentoVenda_Cred.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Cred.FormCreate(Sender: TObject);
begin
  y_cliente  := -1;
  y_contrato := -1;
  y_sequencial_forma_pagamento_entrada := -1;
  tecla:=27;
  jaChamou:=false;
end;

procedure Tfrm_FechamentoVenda_Cred.Confirmardados1Click(
  Sender: TObject);
var
  lojaOnline: Boolean;
//************************
  clAux,clAux2: TClassAuxiliar;
  plano,cliente,contrato,loja,boleta: Real;
begin
  //CRITICA AOS DADOS
  if (frm_principal.servidor_credito.Connected) then
    lojaOnline := true
  else
    lojaOnline := false;
  if (trim(pnAlerta.caption)='Cliente bloqueado') then
    frmDialogo.ExibirMensagem ('Cliente bloqueado! Crediário não permitido!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (Pos(';',trim(edtNome_crediario.text))>0) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o nome do cliente!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNome_crediario.setfocus;
  end
  else
  if ((Trim(edtCliente.Text) = '') or (Trim(edtContrato.Text) = '')) and (lojaOnline) then
  begin
    if (frm_principal.servidor_credito.Connected) then
    begin
      frmDialogo.ExibirMensagem ('Favor digitar código do cliente/contrato! Os campos não podem ficar em branco'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      if (Trim(edtCliente.Text) = '') then
        edtCliente.SetFocus
      else
      if (Trim(edtContrato.Text) = '') then
        edtContrato.SetFocus;
    end;
  end
  else if (frm_principal.x_senha_usuario_crediario) and (not ConfirmaCadastroCrediario(Trim(edtCliente.Text),Trim(edtContrato.Text))) then
  begin
    frmDialogo.ExibirMensagem ('Não é possível realizar a venda sem confirmar o usuário da operação!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Close;
  end
  else
  begin
    //*** Rodrigo Cordeiro *** 12/11/2009 *******************
    if (edtNumBoleta.Visible) then
    begin
      frm_principal.multiBoleta := true;

      cliente  := strtofloat(Trim(edtCliente.Text));
      contrato := strtofloat(Trim(edtContrato.Text));
      boleta   := strtofloat(Trim(edtNumBoleta.Text));
      loja     := frm_principal.x_loja;

      clAux := TClassAuxiliar.Create;
      clAux.Conect(DataBaseProdutos,self);

      clAux2 := TClassAuxiliar.Create;
      clAux2.Conect('CREDITO',self);

      clAux2.ClearSql;
      clAux2.AddParam('SELECT CR_PLAN               ');
      clAux2.AddParam('FROM CRECTABR                ');
      clAux2.AddParam('WHERE (CR_CLIE=:cliente) AND ');
      clAux2.AddParam('      (CR_LOJA=:loja) AND    ');
      clAux2.AddParam('      (CR_CODI=:contrato)    ');
      clAux2.consulta.ParamByName('cliente').AsFloat  := cliente;
      clAux2.consulta.ParamByName('loja').AsFloat     := loja;
      clAux2.consulta.ParamByName('contrato').AsFloat := contrato;
      if (clAux2.Execute) then
      begin
        clAux.ClearSql;
        clAux.AddParam('UPDATE CREDIARIOS SET CR_PLAN=:plano ');
        clAux.AddParam('WHERE (CR_CLIE=:cliente) AND         ');
        clAux.AddParam('      (CR_LOJA=:loja) AND            ');
        clAux.AddParam('      (CR_CONT=:contrato) AND        ');
        clAux.AddParam('      (CR_CODI=:boleta)              ');
        clAux.consulta.ParamByName('cliente').AsFloat  := cliente;
        clAux.consulta.ParamByName('loja').AsFloat     := loja;
        clAux.consulta.ParamByName('contrato').AsFloat := contrato;
        clAux.consulta.ParamByName('boleta').AsFloat   := boleta;
        clAux.consulta.ParamByName('plano').AsFloat    := clAux2.Result('CR_PLAN');
        clAux.Execute;
      end;
      clAux.Desconect;
      clAux.Free;
      clAux2.Desconect;
      clAux2.Free;
    end;
    //*******************************************************
    with (frm_FechamentoVenda) do
    begin
      codigoCliente := strtofloat(Trim(edtCliente.Text));
      codigoContrato := strtofloat(Trim(edtContrato.Text));
      if (Trim(edtNumBoleta.Text) <> '') then
        codigoBoleta := strtofloat(Trim(edtNumBoleta.Text))
      else
        codigoBoleta := strtofloat(Trim(edtContrato.Text));
     { if (edtNumBoleta.Visible) then
              codigoBoleta := strtofloat(Trim(edtNumBoleta.Text))
      else
              codigoBoleta := strtofloat(Trim(edtContrato.Text)); }
      if (Trim(edtValorFinanciado.Text) <> '') then
        totalFinanciado := strtofloat(RetiraFormatacaoNumero(Trim(edtValorFinanciado.Text)))
      else
        totalFinanciado := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.Text)));
      if (Trim(edtValorEntrada.Text) <> '') then
        totalEntrada := strtofloat(RetiraFormatacaoNumero(Trim(edtValorEntrada.Text)));
      if (Trim(edtTotalContrato.Text) <> '') then
        totalContrato := strtofloat(RetiraFormatacaoNumero(Trim(edtTotalContrato.Text)))
      else
        totalContrato := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.Text))) + totalEntrada;
    end;
    tecla:=13;
    close;
  end;
end;

function Tfrm_FechamentoVenda_Cred.ConfirmaCadastroCrediario(Cliente,
  Contrato: String): boolean;
begin
  Application.CreateForm(TfrmSenhaConfirmacao,frmSenhaConfirmacao);
  frmSenhaConfirmacao.cliente  := Cliente;
  frmSenhaConfirmacao.contrato := Contrato;
  frmSenhaConfirmacao.ShowModal;
  result := frmSenhaConfirmacao.continua;
  frmSenhaConfirmacao.Free;
end;

procedure Tfrm_FechamentoVenda_Cred.Limparformulrio1Click(Sender: TObject);
var
  aux,aux2,aux3,aux4: String;
begin
  aux  := edtValorFinanciado.Text;
  aux2 := edtValorEntrada.Text;
  aux3 := edtTotalContrato.Text;
  aux4 := edtNumBoleta.Text;
  motivobloqueio          := '';
  LimparEdits;
  edtValorFinanciado.Text := aux;
  edtValorEntrada.Text    := aux2;
  edtTotalContrato.Text   := aux3;
  edtNumBoleta.Text       := aux4;
  TimerAlerta.enabled     := false;
  pnAlerta.caption        := '';
  pnAlerta.font.color     := clWhite;
  pnAlerta.color          := clTeal;
  edtCliente.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cred.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_FechamentoVenda_Cred.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    ind:=ind+1;
  end;
  if (y_cliente<>-1) then
    edtCliente.text   := floattostr(y_cliente);
  if (y_contrato<>-1) then
    edtContrato.text := floattostr(y_contrato);
  botaoSair.caption:='SAIR';
end;

procedure Tfrm_FechamentoVenda_Cred.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    botaoSairClick(Sender);
end;

procedure Tfrm_FechamentoVenda_Cred.edtClienteDblClick(Sender: TObject);
begin
  if (databasecredito='CREDITO') then
    with (frm_f8Clientes) do
    begin
      edit:=edtCliente;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
end;

procedure Tfrm_FechamentoVenda_Cred.edtClienteEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cred.edtClienteExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  codigo: String;
  clienteFun,clienteSpc,cpf: String;
  clienteTpro,clienteEndDes: String;
begin
  if (databasecredito='CREDITO') then
  begin
    {exibindo dados do cliente}
    codigo := Trim(edtCliente.text);
    if (codigo <> '') then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databasecredito,self);
      clAux.ClearSql;
      clAux.AddParam ('SELECT CL_CODI,CL_FONE,CL_NOME,CL_CFUN,CL_PDC, ');
      clAux.AddParam ('       CL_TPRO,CL_ALTE,CL_CPF                  ');
      clAux.AddParam ('FROM   CRECLI                                  ');
      clAux.AddParam ('WHERE (CL_CODI='+codigo+')                     ');
      if (clAux.Execute) then
      begin
        edtNome_crediario.text := clAux.result('CL_NOME');
        edtCpf_crediario.text  := clAux.result('CL_CPF');
        cpf                    := clAux.result('CL_CPF');

        if (not frm_principal.x_cli_sem_foto) and (not VerificaFoto(cpf)) then
        begin
          frmDialogo.ExibirMensagem ('Não é possível realizar a venda para clientes sem fotos! Por favor insira a foto do cliente! '
                ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          Close;
        end;

        if (frm_principal.x_senha_gerente_cliente_zerado) and (InformaLimiteCredito(StrToFloat(codigo)) <= 0.00) and (not LiberaVendaZerado) then
        begin
          frmDialogo.ExibirMensagem ('Usuário não tem permissão de liberar venda para clientes com saldo zerado ou negativo!',
            'Operação não permitida',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          Close;
        end;

        {*** - Verificando com veracidade as informacoes de SPC}
        {E ainda, marcando o cliente vinculado}
        if (ClienteNoSpc(clAux.result('CL_CODI'))) then
          clienteSpc:='SIM'
        else
          clienteSpc:='NÃO';
        if (clAux.result('CL_CFUN')='S') then
          clienteFun:='SIM'
        else
          clienteFun:='NÃO';
        if (clAux.result('CL_TPRO')='S') then
          clienteTpro:='SIM'
        else
          clienteTpro:='NÃO';
        if (clAux.result('CL_ALTE')='1') then
          clienteEndDes:='SIM'
        else
          clienteEndDes:='NÃO';

        {DEFINICAO DO ALERTA SUPERIOR DA CONSULTA**********************}
        {SEGUINDO A PRECEDENCIA DA INFORMACAO -------------------------}
        clienteFun:='NÃO';
        motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(clAux.result('CL_CODI'));
        if (motivobloqueio<>'-1') then
        begin
          TimerAlerta.enabled:=true;
          pnAlerta.color:=clRed;
          pnAlerta.caption:='Cliente bloqueado';

          //**************************************************************
          Application.CreateForm(Tfrm_consulta1_observacao,frm_consulta1_observacao);
          frm_consulta1_observacao.lblObs.caption := '>>>> CLIENTE BLOQUEADO ';
          frm_consulta1_observacao.memo1.lines.clear;
          frm_consulta1_observacao.memo1.lines.add('Motivo: ');
          frm_consulta1_observacao.memo1.lines.add(motivobloqueio);
          frm_consulta1_observacao.height      := 180;
          frm_consulta1_observacao.btnOk.top   := 100;
          frm_consulta1_observacao.color       := clRed;
          frm_consulta1_observacao.memo1.color := clRed;
          frm_consulta1_observacao.showmodal; {*}
          frm_consulta1_observacao.color       := clNavy;
          frm_consulta1_observacao.memo1.color := clNavy;
          frm_consulta1_observacao.Free;
          //**************************************************************
        end
        else
        if (clAux.result('CL_PDC')='1C') and (frm_principal.x_bloqueio_cartao) then {1o}
        begin
          TimerAlerta.enabled:=true;
          pnAlerta.color:=clRed;
          pnAlerta.caption:='Cartão bloqueado';
        end
        else
        if (clienteSpc='SIM') then {2o}
        begin
          TimerAlerta.enabled:=true;
          pnAlerta.font.color:=clWhite;
          pnAlerta.color:=clRed;
          pnAlerta.caption:='Cliente no SPC';
        end
        else
        if (ClienteComChequeDevolvido(cpf)) then {3o}
        begin
          TimerAlerta.enabled:=true;
          pnAlerta.color:=clRed;
          pnAlerta.caption:='Cheque devolvido';
          clienteFun:='SIM';
        end
        else
        if (ClienteComChequeDevolvidoPago(cpf)) then {4o}
        begin
          TimerAlerta.enabled:=true;
          pnAlerta.font.color:=clWhite;
          pnAlerta.color:=clGreen;
          pnAlerta.caption:='Cheque devolvido pago';
        end
        else
        if (clienteTpro='SIM') then {5o}
        begin
          TimerAlerta.enabled:=true;
          pnAlerta.font.color:=clWhite;
          pnAlerta.color:=clRed;
          pnAlerta.caption:='Cliente c/ Tit. Protestado';
        end
        else
        begin
          TimerAlerta.enabled := false;
          pnAlerta.font.color := clWhite;
          pnAlerta.color      := clBlue;
          pnAlerta.caption    := 'Cliente OK';
        end;
        {***************************************************************}
      end
      else
      begin
        edtNome_crediario.text := '';
        pnAlerta.color:=clInfoBk;
        pnAlerta.font.color:=clBlack;
        pnAlerta.caption:='Cliente sem ficha';
      end;
      clAux.desconect;
      clAux.Free;
    end;
  end;
end;

procedure Tfrm_FechamentoVenda_Cred.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if edtcliente.tag = 0 then
      edtContrato.setfocus
    else
      botao1.onclick(sender);

  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
  begin
    lblCliente.caption       := 'CPF/CNPJ do cliente';
    edtCpf_crediario.visible := true;
    edtCliente.visible       := false;
    edtCpf_crediario.setfocus;
  end;
  if (key=K_F8) then
    if (databasecredito='CREDITO') then
      with (frm_f8Clientes) do
      begin
        edit:=edtCliente;
        btnCadastro.visible:=false;
        showmodal;
        btnCadastro.visible:=true;
      end;
end;

procedure Tfrm_FechamentoVenda_Cred.edtContratoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cred.edtContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clAux, clAux2, clAux3: TClassAuxiliar;
  codCliente, codContrato: String;
  totalCrediario: Real;
begin
  if (key=K_ENTER) then
  begin
    frm_principal.multiBoleta := false;
    codCliente     := Trim(edtCliente.Text);
    codContrato    := Trim(edtContrato.Text);
    clAux2 := TClassAuxiliar.Create;
    clAux2.Conect('CREDITO',self);
    clAux2.ClearSql;
    clAux2.AddParam('SELECT CR_QBOL                     ');
    clAux2.AddParam('FROM CRECTABR                      ');
    clAux2.AddParam('WHERE (CR_CLIE='+codCliente+') AND ');
    clAux2.AddParam('      (CR_CODI='+codContrato+')    ');
    if (clAux2.Execute) then
    begin
      qtdeBoletas := clAux2.Result('CR_QBOL');
      if (qtdeBoletas = '1') then
      begin
        totalCrediario := strtofloat(RetiraFormatacaoNumero(Trim(edtValorFinanciado.Text)));
        clAux := TClassAuxiliar.Create;
        clAux.Conect('CREDITO',self);
        clAux.ClearSql;
        clAux.AddParam('SELECT CR_CLIE,CR_CODI,CR_VENT,CR_TOTA                        ');
        clAux.AddParam('FROM CRECTABR                                                 ');
        clAux.AddParam('WHERE (CR_CLIE='+codCliente+') AND (CR_CODI='+codContrato+')  ');
        if (clAux.Execute) then
        begin
          label5.Visible       := false;
          edtNumBoleta.Visible := false;
          if (clAux.Result('CR_VENT') <> 0) and (frm_FechamentoVenda.totalEntrada = 0) then
          begin
            frmDialogo.ExibirMensagem ('Favor digitar o(s) valor(es) da entrada(s) primeiro!'
              ,'Crediário',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            frm_FechamentoVenda_Cred.Close;
            frm_FechamentoVenda.edtValor.Text      := '';
            frm_FechamentoVenda.edtCodForma.Text   := '';
            frm_FechamentoVenda.edtCodForma.SetFocus;
          end
          else
          if (clAux.Result('CR_VENT') <> frm_FechamentoVenda.totalEntrada) or (clAux.Result('CR_TOTA') <> totalCrediario) then
          begin
            frmDialogo.ExibirMensagem ('O valor lançado não confere com o financiado! Consulte o cliente e verifique o contrato!'
              ,'Crediário',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            frm_FechamentoVenda_Cred.Close;
            frm_FechamentoVenda.edtValor.Text      := '';
            frm_FechamentoVenda.edtCodForma.Text   := '';
            frm_FechamentoVenda.edtCodForma.SetFocus;
          end
          else
            ExibeDadosDoContrato;
          edtNome_Crediario.SetFocus;
        end;
        clAux.Desconect;
        clAux.Free;
      end
      else
      if (qtdeBoletas = '2') or (qtdeBoletas = '3') then
      begin
        frm_principal.multiBoleta := true;
        label5.Visible            := true;
        edtNumBoleta.Visible      := true;
        edtNumBoleta.SetFocus;
      end;
    end
    else
    begin
      clAux2.Desconect;
      clAux2.Conect(DataBaseProdutos,self);
      clAux2.ClearSql;
      clAux2.AddParam('SELECT *                     ');
      clAux2.AddParam('FROM CREDIARIOS              ');
      clAux2.AddParam('WHERE (CR_CLIE=:cliente) AND ');
      clAux2.AddParam('      (CR_CODI=:boleta)      ');
      clAux2.consulta.ParamByName('cliente').AsFloat := strtofloat(codCliente);
      clAux2.consulta.ParamByName('boleta').AsFloat  := strtofloat(codContrato);
      if (clAux2.Execute) then
      begin
        clAux3 := TClassAuxiliar.Create;
        clAux3.Conect('CREDITO',self);
        clAux3.ClearSql;
        clAux3.AddParam('SELECT CR_QBOL               ');
        clAux3.AddParam('FROM CRECTABR                ');
        clAux3.AddParam('WHERE (CR_CLIE=:cliente) AND ');
        clAux3.AddParam('      (CR_CODI=:contrato)    ');
        clAux3.consulta.ParamByName('cliente').AsFloat  := strtofloat(codCliente);
        clAux3.consulta.ParamByName('contrato').AsFloat := clAux2.Result('CR_CONT');
        if (clAux3.Execute) then
          if (clAux3.Result('CR_QBOL') > 1) then
          begin
            frmDialogo.ExibirMensagem ('Esta boleta pertence ao contrato multiboleta de nº '+form_nz(clAux2.Result('CR_CONT'),6)+'! Favor digitar o número do contrato correto!'
              ,'Crediário Multiboleta',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            edtContrato.SetFocus;
            edtContrato.SelectAll;
          end
          else
          begin
            edtNome_Crediario.SetFocus;
            edtValorEntrada.Text  := floattostr(frm_FechamentoVenda.totalEntrada);
            edtTotalContrato.Text := floattostr(strtofloat(RetiraFormatacaoNumero(edtValorFinanciado.Text)) + strtofloat(RetiraFormatacaoNumero(edtValorEntrada.Text)));
            FormatarZerosDecimais(edtValorEntrada);
            FormatarZerosDecimais(edtTotalContrato);
          end;
        clAux3.Desconect;
        clAux3.Free;
      end
      else
      begin
        edtNome_Crediario.SetFocus;
        edtValorEntrada.Text  := floattostr(frm_FechamentoVenda.totalEntrada);
        edtTotalContrato.Text := floattostr(strtofloat(RetiraFormatacaoNumero(edtValorFinanciado.Text)) + strtofloat(RetiraFormatacaoNumero(edtValorEntrada.Text)));
        FormatarZerosDecimais(edtValorEntrada);
        FormatarZerosDecimais(edtTotalContrato);
      end;
    end;
    clAux2.Desconect;
    clAux2.Free;
  end;
  if (key=K_BAIXO) then
    edtNome_Crediario.SetFocus;
  if (key=K_CIMA) then
    if (edtCliente.visible) then
      edtCliente.setfocus
    else
    if (edtCpf_Crediario.visible) then
      edtCpf_Crediario.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cred.edtNome_crediarioEnter(
  Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cred.edtNome_crediarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValorFinanciado.setfocus;
  if (key=K_CIMA) then
    if (edtNumBoleta.Visible) then
      edtNumBoleta.SetFocus
    else
      edtContrato.SetFocus;
end;

procedure Tfrm_FechamentoVenda_Cred.edtTotalContratoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cred.edtTotalContratoExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda_Cred.edtTotalContratoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    BOTAO1CLIcK(botao1);
  if (key=K_CIMA) then
    edtValorEntrada.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cred.edtTotalContratoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorEntradaEnter(Sender: TObject);
var
  valor_entrada: Real;
begin
  if (trim(edtValorEntrada.text)<>'') then
    valor_entrada := strtofloat(trim(RetiraFormatacaoNumero(edtValorEntrada.text)))
  else
    valor_entrada := 0.00;
  if (valor_entrada  =  0.00) then //SUGESTAO DO CREDIARIO
    edtValorEntrada.text := trim(form_nc(SugereValorEntradaDoCrediarioDaVenda,12));
          
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorEntradaExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtTotalContrato.setfocus;
  if (key=K_CIMA) then
    edtValorFinanciado.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorEntradaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorFinanciadoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorFinanciadoExit(
  Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorFinanciadoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValorEntrada.setfocus;
  if (key=K_CIMA) then
    edtNome_Crediario.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorFinanciadoKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda_Cred.edtCpf_crediarioEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cred.edtCpf_crediarioExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cpf: String;
begin
  if (databasecredito='CREDITO') then
  begin
         {exibindo dados do cliente}
    cpf := Trim(edtCpf_crediario.text);
    if (cpf<>'') then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databasecredito,self);
      clAux.ClearSql;
      clAux.AddParam ('SELECT CL_FONE,CL_NOME,CL_CODI FROM CRECLI     ');
      clAux.AddParam ('WHERE (CL_CPF='+chr(39)+cpf+chr(39)+')         ');
      if (clAux.Execute) then
      begin
        edtNome_crediario.text := clAux.result('CL_NOME');
        edtCliente.text        := form_n(clAux.result('CL_CODI'),6);
      end
      else
        edtNome_crediario.text := '';
      clAux.desconect;
      clAux.Free;
    end;
  end;
end;

procedure Tfrm_FechamentoVenda_Cred.edtCpf_crediarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtContrato.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
  begin
    lblCliente.caption       := 'Código do cliente';
    edtCpf_crediario.visible := false;
    edtCliente.visible       := true;
    edtCliente.setfocus;
  end;
end;

procedure Tfrm_FechamentoVenda_Cred.TimerAlertaTimer(Sender: TObject);
begin
  if (pnAlerta.font.color=clWhite) then
  begin
    pnAlerta.font.color:=clRed;
    if (Trim(pnAlerta.caption)='Cheque devolvido pago') then
      pnAlerta.font.color:=clGreen;
  end
  else
    pnAlerta.font.color:=clWhite;
end;

function Tfrm_FechamentoVenda_Cred.SugereValorEntradaDoCrediarioDaVenda:Real;
var
  clAux: TClassAuxiliar;
  total_entrada: Real;
begin
  y_sequencial_forma_pagamento_entrada := 1; //SEM UM, SEM USO POR ENQUANTO

  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT *                               ');
  clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL    ');
  clAux.AddParam ('WHERE (VF_CAIX=:terminal) AND          ');
  clAux.AddParam ('      (VF_LOJA=:loja) AND              ');
  clAux.AddParam ('      (VF_VEND=:codigo_venda)          ');
  clAux.AddParam ('ORDER BY VF_ORDE                       ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat     := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda; //-1
  if (clAux.Execute) then
  begin
    clAux.first;
    total_entrada := 0.00;
    while (not clAux.eof) do
    begin
      total_entrada := total_entrada + clAux.result('VF_VALO');
      clAux.next; {--->}
    end;
  end;
  clAux.desconect;
  clAux.Free;

  result := total_entrada;
end;

procedure Tfrm_FechamentoVenda_Cred.edtValorEntradaChange(Sender: TObject);
begin
  CalculaTotalContrato;
end;

procedure Tfrm_FechamentoVenda_Cred.CalculaTotalContrato;
var
  total_contrato: Real;
  valor_entrada,valor_financiado: Real;
begin
  if (trim(edtValorEntrada.text)<>'') then
    valor_entrada := strtofloat(trim(RetiraFormatacaoNumero(edtValorEntrada.text)))
  else
    valor_entrada := 0.00;
  if (trim(edtValorFinanciado.text)<>'') then
    valor_financiado := strtofloat(trim(RetiraFormatacaoNumero(edtValorFinanciado.text)))
  else
    valor_financiado := 0.00;
  total_contrato :=  valor_entrada + valor_financiado;
     
  edtTotalContrato.text := form_nc(total_contrato,12);
end;

procedure Tfrm_FechamentoVenda_Cred.listaDblClick(Sender: TObject);
var
  valor_entrada,forma_pagamento: Real;
begin
  pnValoresJaInformados.visible        := false;
  valor_entrada                        := strtofloat(Copy(trim(Lista.items[Lista.itemindex]),27,10));
  forma_pagamento                      := strtofloat(Copy(trim(Lista.items[Lista.itemindex]),1,2));
  y_sequencial_forma_pagamento_entrada := Lista.itemindex+1;    
  edtValorEntrada.text                 := form_nc(valor_entrada,12);
  edtValorEntrada.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cred.listaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    listaDblClick(lista);
end;

procedure Tfrm_FechamentoVenda_Cred.ExibeDadosDoContrato;
var
  clAux: TClassAuxiliar;
begin
  if (Trim(edtCliente.text)<>'') and
    (Trim(edtContrato.text)<>'') and (qtdeBoletas = '1') then
  begin
         {Buscando a existencia do contrato de crediario ****}
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecredito,self);
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
      edtValorFinanciado.text := form_nc(clAux.result('CR_TOTA'),10);
      edtValorEntrada.text    := form_nc(clAux.result('CR_VENT'),10);
      edtTotalContrato.text   := form_nc(clAux.result('CR_TOTA')+clAux.result('CR_VENT'),10);
    end;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure Tfrm_FechamentoVenda_Cred.edtContratoExit(Sender: TObject);
begin
  if (databasecredito='CREDITO') then
    ExibeDadosDoContrato;
end;

procedure Tfrm_FechamentoVenda_Cred.edtNumBoletaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) or (key=K_F5) then
    VerificaBoleta;
  if (key=K_CIMA) then
    edtContrato.SetFocus;
end;

function TFrm_FechamentoVenda_Cred.VerificaBoleta: Boolean;
var
  clAux: TClassAuxiliar;
  codCliente,codContrato,codBoleta: String;
  totalBoleta,totalFinanciado: Real;
  entradaBD,financiadoBD,totalBD: Real;
begin
  codCliente      := Trim(edtCliente.Text);
  codContrato     := Trim(edtContrato.Text);
  codBoleta       := Trim(edtNumBoleta.Text);
  totalFinanciado := strtofloat(RetiraFormatacaoNumero(Trim(edtValorFinanciado.Text)));
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;
  clAux.AddParam('SELECT CR_CLIE,CR_CODI,CR_CONT,CR_VENT,CR_TOTA,CR_FINA,CR_VEND,CR_CAIX   ');
  clAux.AddParam('FROM CREDIARIOS                                                          ');
  clAux.AddParam('WHERE (CR_CLIE='+codCliente+') AND (CR_CONT='+codContrato+') AND         ');
  clAux.AddParam('      (CR_CODI='+codBoleta+')                                            ');
  if (clAux.Execute) then
  begin
    clAux.First;
    totalBoleta  := frm_FechamentoVenda.totalEntrada + totalFinanciado;
    entradaBD    := clAux.Result('CR_VENT');
    totalBD      := clAux.Result('CR_TOTA');
    financiadoBD := clAux.Result('CR_FINA');
    if (clAux.Result('CR_VEND') <> 0) and (clAux.Result('CR_CAIX') <> 0) then
    begin
      frmDialogo.ExibirMensagem ('Já houve o lançamento da venda referente a esta boleta!'
        ,'Crediário',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      frm_FechamentoVenda_Cred.Close;
      result := false;
    end
    else
    if (frm_FechamentoVenda.totalEntrada <> entradaBD) then
    begin
      frmDialogo.ExibirMensagem ('O valor da entrada não confere com o lançado! Consulte o cliente e verifique o contrato!'
        ,'Crediário',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      frm_FechamentoVenda_Cred.Close;
      result := false;
    end
    else
    if (totalBoleta <> totalBD) then
    begin
      frmDialogo.ExibirMensagem ('O valor da boleta não confere com o lançado! Consulte o cliente e verifique o contrato!'
        ,'Crediário',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      frm_FechamentoVenda_Cred.Close;
      result := false;
    end
    else
    if (floattostr(totalFinanciado) <> floattostr(financiadoBD)) then
    begin
      frmDialogo.ExibirMensagem ('O valor financiado não confere com o lançado! Consulte o cliente e verifique o contrato!'
        ,'Crediário',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      frm_FechamentoVenda_Cred.Close;
      result := false;
    end
    else
    begin
      edtNome_Crediario.SetFocus;
      result := true;
    end;
  end
  else
  begin
    frmDialogo.ExibirMensagem ('Boleta não pertence ou não foi lançada neste contrato! Consulte o cliente e verifique!'
      ,'Crediário',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta.SetFocus;
    edtNumBoleta.SelectAll;
    result := false;
  end;
  clAux.Desconect;
  clAux.Free;
end;

procedure Tfrm_FechamentoVenda_Cred.edtNumBoletaExit(Sender: TObject);
begin
  VerificaBoleta;
end;

function Tfrm_FechamentoVenda_Cred.LiberaVendaZerado: boolean;
begin
  frm_senhaSupervisor.showmodal;
  result := frm_senhaSupervisor.y_flag;
end;

function Tfrm_FechamentoVenda_Cred.VerificaFoto(cpf: String): boolean;
begin
  if (FileExists('C:\NATIVA\CREDITO\FOTO\'+Trim(cpf)+'.JPG')) then
    result := true
  else if (FileExists('C:\NATIVA\CREDITO\FOTO\'+Trim(cpf)+'.BMP')) then
    result := true
  else if (FileExists('C:\NATIVA\CREDITO\FOTO\'+Trim(cpf)+'.GIF')) then
    result := true
  else if (FileExists(frm_principal.x_path_fotos_clientes+'\'+Trim(cpf)+'.JPG')) then
    result := true
  else if (FileExists(frm_principal.x_path_fotos_clientes+'\'+Trim(cpf)+'.BMP')) then
    result := true
  else if (FileExists(frm_principal.x_path_fotos_clientes+'\'+Trim(cpf)+'.GIF')) then
    result := true
  else
    result := false;
end;

end.
