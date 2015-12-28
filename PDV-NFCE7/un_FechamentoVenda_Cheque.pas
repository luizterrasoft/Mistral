{ - FALTA FAZER AS MARMOTAS DE INTEGRACAO 'MELHOR' COM O CREDIARIO:
  a) Salvar o CPF e atualizar no sistema, alertando se ja tiver CPF e o que esta entrando esta diferente}
unit un_FechamentoVenda_Cheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls, Mask;

type
  Tfrm_FechamentoVenda_Cheque = class(TForm)
    Label18: TLabel;
    edtCpf: TMaskEdit;
    Label8: TLabel;
    edtConta: TMaskEdit;
    Label17: TLabel;
    edtNome: TMaskEdit;
    chFlag: TCheckBox;
    edtFone: TMaskEdit;
    Label15: TLabel;
    edtNomeBanco: TMaskEdit;
    Label6: TLabel;
    edtCodBanco: TMaskEdit;
    Label9: TLabel;
    Label1: TLabel;
    edtNumero: TMaskEdit;
    edtAgencia: TMaskEdit;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Bevel4: TBevel;
    Image2: TImage;
    Label2: TLabel;
    Label12: TLabel;
    Confirmardados1: TMenuItem;
    botao1: TPanel;
    botaoSair: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodCli: TMaskEdit;
    pnAlerta: TPanel;
    TimerAlerta: TTimer;
    Label10: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure edtCpfEnter(Sender: TObject);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodBancoDblClick(Sender: TObject);
    procedure edtCodBancoEnter(Sender: TObject);
    procedure edtCodBancoExit(Sender: TObject);
    procedure edtCodBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfDblClick(Sender: TObject);
    procedure edtCodCliChange(Sender: TObject);
    procedure edtFoneEnter(Sender: TObject);
    procedure TimerAlertaTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    jaChamou: Boolean;
    tecla: Integer;
    motivobloqueio: String;
    procedure LimparEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
  end;

var
  frm_FechamentoVenda_Cheque: Tfrm_FechamentoVenda_Cheque;

implementation

uses f8Bancos, auxiliar, funcoes1, funcoes2, procura, principal, f8Clientes, credito,
  unDialogo, un_frmConsulta1_Observacao;

{$R *.DFM}

procedure Tfrm_FechamentoVenda_Cheque.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Cheque.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  if (not JaChamou) then
  begin
    Limparformulrio1.click;
    JaChamou:=true;
  end;
  edtCpf.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCpfExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  clienteFun,clienteSpc,cpf: String;
  clienteTpro,clienteEndDes: String;
begin
  if (databasecredito='CREDITO') then
  begin
    cpf := Trim(edtCpf.text);
    if (cpf<>'') then
      if (CriticaCNPJ(edtCpf)) then
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databasecredito,self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT CL_CODI,CL_FONE,CL_NOME,CL_CFUN,CL_PDC, ');
        clAux.AddParam ('       CL_TPRO,CL_ALTE                         ');
        clAux.AddParam ('FROM   CRECLI                                  ');
        clAux.AddParam ('WHERE (CL_CPF='+chr(39)+cpf+chr(39)+')         ');
        if (clAux.Execute) then
        begin
          edtNome.text:=clAux.result('CL_NOME');
          edtFone.text:=clAux.result('CL_FONE');

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
            TimerAlerta.enabled:=false;
            pnAlerta.font.color:=clWhite;
            pnAlerta.color:=clBlue;
            pnAlerta.caption:='Cliente OK';
          end;
                      {***************************************************************}
        end
        else
        begin
          edtNome.text:='';
          edtFone.text:='';
          pnAlerta.color:=clInfoBk;
          pnAlerta.font.color:=clBlack;
          pnAlerta.caption:='Cliente sem ficha';
        end;
        clAux.desconect;
        clAux.Free;
      end;
  end;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCpfEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCpfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNome.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    if (databasecredito='CREDITO') then
      with (frm_f8Clientes) do
      begin
        edit:=edtCodCli;
        btnCadastro.visible:=false;
        showmodal;
        btnCadastro.visible:=true;
      end;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCodBancoDblClick(Sender: TObject);
begin
  with (frm_f8Bancos) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodBanco;
    showmodal;
  end;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCodBancoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCodBancoExit(Sender: TObject);
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

procedure Tfrm_FechamentoVenda_Cheque.edtCodBancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),false);
  if (key=K_F8) then
    with (frm_f8Bancos) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodBanco;
      showmodal;
    end;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtNumeroEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Confirmardados1.click;
  if (key=K_CIMA) then
    edtConta.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtFoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),false);
end;

procedure Tfrm_FechamentoVenda_Cheque.FocusControle(controle: TWinControl; direcao: Boolean);
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

procedure Tfrm_FechamentoVenda_Cheque.botao1Click(Sender: TObject);
begin
  Confirmardados1.click;
end;

procedure Tfrm_FechamentoVenda_Cheque.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Cheque.FormCreate(Sender: TObject);
begin
  tecla:=27;
  jaChamou:=false;
end;

procedure Tfrm_FechamentoVenda_Cheque.Confirmardados1Click(
  Sender: TObject);
begin
     //CRITICA AOS DADOS
  if (trim(pnAlerta.caption)='Cliente bloqueado') then
    frmDialogo.ExibirMensagem ('Cliente bloqueado! Pgto. com cheque não permitido!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (Pos(';',trim(edtNome.text))>0) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o nome do emitente!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNome.setfocus;
  end
  else
  if (Pos(';',trim(edtNomeBanco.text))>0) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o nome do banco!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNomeBanco.setfocus;
  end
  else
  if (Pos(';',trim(edtFone.text))>0) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o fone do emitente!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFone.setfocus;
  end
  else
  if (Pos(';',trim(edtConta.text))>0) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o número da conta corrente!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtConta.setfocus;
  end
  else
  begin
    tecla:=13;
    close;
  end;
end;

procedure Tfrm_FechamentoVenda_Cheque.Limparformulrio1Click(
  Sender: TObject);
begin
  motivobloqueio      := '';   
  LimparEdits;
  TimerAlerta.enabled :=false;
  pnAlerta.caption    :='';
  pnAlerta.font.color := clWhite;
  pnAlerta.color      := clTeal;
  edtCpf.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cheque.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_FechamentoVenda_Cheque.GetTabOrderList(Lista);
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
  botaoSair.caption:='SAIR';
end;

procedure Tfrm_FechamentoVenda_Cheque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    botaoSairClick(Sender);
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCpfDblClick(Sender: TObject);
begin
  if (databasecredito='CREDITO') then
    with (frm_f8Clientes) do
    begin
      edit:=edtCodCli;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtCodCliChange(Sender: TObject);
var
  clAux: TClassAuxiliar;
  codigo: String;
begin
  if (trim(edtCodCli.text)<>'') then
    if (databasecredito='CREDITO') then
    begin
             {exibindo dados do cliente}
      codigo := Trim(edtCodCli.text);
      if (codigo<>'') then
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databasecredito,self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT CL_CPF              ');
        clAux.AddParam ('FROM   CRECLI              ');
        clAux.AddParam ('WHERE (CL_CODI='+codigo+') ');
        if (clAux.Execute) then
          edtCpf.text:=clAux.result('CL_CPF')
        else
          edtCpf.text:='00000000000';
        clAux.desconect;
        clAux.Free;
      end;
    end;
end;

procedure Tfrm_FechamentoVenda_Cheque.edtFoneEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cheque.TimerAlertaTimer(Sender: TObject);
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

end.
