{Alteracao: 20/05/2001 - Guardar o sequencial do cheque ***}
unit aux2Contrato_demo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Menus;

type
  Tfrm_aux2Contrato_demo = class(TForm)
    Label38: TLabel;
    edtNum: TMaskEdit;
    edtBanco: TMaskEdit;
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    edtAgenc: TMaskEdit;
    Bevel1: TBevel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    painel: TPanel;
    Label3: TLabel;
    edtCpf: TMaskEdit;
    Panel1: TPanel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNumEnter(Sender: TObject);
    procedure edtNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBancoEnter(Sender: TObject);
    procedure edtBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAgencKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAgencEnter(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure edtCpfEnter(Sender: TObject);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    flagSae: Boolean;
    procedure MarcaPrestacaoCheque (cliente,contrato,prestacao: Real;
      ccgc: String; banco,numero: Real; agencia: String);
    procedure ApagaCheque (ccgc: String; banco,numero: Real);
    function JaExisteChequeCadastrado(ccgc,banco,numero: String):Boolean;
  end;

var
  frm_aux2Contrato_demo: Tfrm_aux2Contrato_demo;

implementation

uses principal, funcoes1, funcoes2, cheques, cadcli, prestcontrato, DM4, cliente,
  unDialogo, auxiliar, cadcli2;

{$R *.DFM}

procedure Tfrm_aux2Contrato_demo.btnCancelClick(Sender: TObject);
begin
  Sair1.click;
end;

{Botao de cadastramento dos cheques no caso de planos de pgto do tipo CHEQUE PRE-DATADO ***}
{A operacao de geracao dos cheques engloba operacoes de inclusao nos cheques e de alteracao
 nas prestacoes dos contratos, dessa forma, deve ser encapsulada em uma TRANSACAO UNICA}
procedure Tfrm_aux2Contrato_demo.btnOkClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  clCheq: TClassCheque;
  clPrest: TClassPrestContrat;
  clClie: TClassCliente;
  contrato: String;
  numerocheque: Integer;
  critica1,critica2: Boolean;
begin
     {critica do CPF/CNPJ *** - Verificando se ja existe alguem com o mesmo}
  critica1:=false;
  critica2:=false;
  clAux := TClassAuxiliar.Create;
  clAux.conect ('CREDITO',self);
  if (edtCpf.enabled) then
    if (Trim(edtCpf.text)<>'') then
    begin
      critica2:=true;
      clAux.ClearSql;
      clAux.AddParam ('Select CL_CPF,CL_CODI,CL_NOME ');
      clAux.AddParam ('From   CRECLI ');
      clAux.AddParam ('Where (CL_CPF='+chr(39)+Trim(edtCpf.text)+chr(39)+') ');
      if (clAux.Execute) then
        critica1:=true;
    end;

     {CRITICA A TELA DE CHEQUES ***}
  if (critica1) and (critica2) then
  begin
    frmDialogo.ExibirMensagem (' J� existe cliente cadastrado com este CPF/CNPJ: '+
      'Cliente: '+form_nz(clAux.result('CL_CODI'),6)+'/'+form_t(clAux.result('CL_NOME'),40)
      ,'CPF/CNPJ',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCpf.setfocus;
  end
  else
  if (frm_principal.x_critica_CNPJ) and (Trim(edtCpf.text)='') then
  begin
    frmDialogo.ExibirMensagem ('CPF/CNPJ do cliente n�o pode ficar vazio!'
      ,'Cheques',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCpf.setfocus;
  end
  else
  if (Trim(edtBanco.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O n�mero do banco n�o pode ficar em branco! '
      ,'Cheques',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtBanco.setfocus;
  end
  else
  if (Trim(edtNum.text)='') then
  begin
    frmDialogo.ExibirMensagem (' O n�mero do cheque n�o pode ficar em branco! '
      ,'Cheques',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNum.setfocus;
  end
  else
  if (JaExisteChequeCadastrado(Trim(edtCpf.text),Trim(edtBanco.text),
    Trim(edtNum.text))) then
  begin
    frmDialogo.ExibirMensagem (' Este cheque j� foi usado pelo cliente!Utilize outro cheque!'
      ,'Cheques',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNum.setfocus;
  end
  else
  begin
       {Setando o CPF do cliente}
    if (edtCpf.enabled) then
    begin
      clClie := TClassCliente.Create;
      with (clClie) do
      begin
        conect ('CREDITO',self);
        AddParam ('Update CRECLI ');
        AddParam ('Set    CL_CPF='+chr(39)+Trim(edtCpf.text)+chr(39)+', ');
        AddParam ('       CL_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
        AddParam ('Where (CL_CODI='+inttostr(frm_edtCliente2.cdCliente)+') ');
        Execute;
        desconect;
        Free;
      end;
    end;

       {abrindo acessos ao banco}
    clPrest := TClassPrestContrat.Create;
    clCheq  := TClassCheque.Create;
    clCheq.conect ('CREDITO',self);
    contrato  := Trim(frm_edtCliente2.edtContrato.text);
    if (contrato<>'') then
      with (clPrest) do
      begin
        conect ('CREDITO',self);
        ClearSql;
        AddParam ('Select PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DVTO, ');
        AddParam ('       PC_CCGC,PC_BANC,PC_AGEN,PC_NUME ');
        AddParam ('From   CREPRABR ');
        AddParam ('Where  (PC_CONT='+contrato+') AND ');
        AddParam ('       (PC_CLIE='+inttostr(frm_edtCliente2.cdCliente)+') ');
        AddParam ('Order  by PC_NPRE ');
        frm_principal.BarraDicas.caption:='Buscando presta��es...';
        frm_principal.refresh;
        if (Execute) then
        begin
                    {Buscando dados do cliente ***}
          with (clClie) do
          begin
            clClie := TClassCliente.Create;
            clClie.conect ('CREDITO',self);
            ClearSql;
            AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_FONE ');
            AddParam ('From   CRECLI ');
            AddParam ('Where (CL_CODI='+inttostr(frm_edtCliente2.cdCliente)+') ');
            frm_principal.BarraDicas.caption:='Buscando cliente...';
            Execute;
          end;
          first;
          numerocheque := strtoint(Trim(edtNum.text));
          frm_principal.BarraDicas.caption:='Gravando cheques...';
          while not eof do
          begin
            with (clCheq) do
            begin
              ApagaCheque (clPrest.Result('PC_CCGC'),
                clPrest.Result('PC_BANC'),
                clPrest.Result('PC_NUME'));
              ClearFields;
              inCH_CLIE := frm_edtCliente2.cdCliente;
              inCH_NUME := numerocheque;
              inCH_BANC := strtoFloat(Trim(edtBanco.text));
              inCH_AGEN := Trim(edtAgenc.text);
              inCH_DTCT := frm_edtCliente2.datacontrato;
              inCH_CCGC := clClie.Result('CL_CPF');
              inCH_NOME := clClie.Result('CL_NOME');
              inCH_FONE := clClie.Result('CL_FONE');
              ;
              inCH_LOJA := frm_edtCliente2.cdLoja;
              inCH_DVTO := clPrest.Result('PC_DVTO');
              if (Trim(frm_edtCliente2.edtPortador.text)<>'') then
                inCH_PORT := StrToFloat(Trim(frm_edtCliente2.edtPortador.text));
              inCH_VALO := clPrest.Result('PC_VALO');
              inCH_TIME := frm_principal.x_data_trabalho;
              Insert;
              MarcaPrestacaoCheque (frm_edtCliente2.cdCliente,
                clPrest.Result('PC_CONT'),
                clPrest.Result('PC_NPRE'),
                inCH_CCGC,
                inCH_BANC,
                inCH_NUME,
                inCH_AGEN);
              numerocheque := numerocheque + 1;
            end;
            next;
          end;
          frm_principal.BarraDicas.caption:='';
          clClie.desconect;
          clClie.Free;
        end;
      end;
    clCheq.desconect;
    clCheq.Free;
    frm_edtCliente2.PreencheGradeContrato (clPrest.Result('PC_CLIE'),
      clPrest.Result('PC_CONT'));
    clPrest.desconect;
    clPrest.Free;
    close;
    frm_principal.ExibirDica ('Cheques gerados com sucesso!',5);
    flagSae := true;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_aux2Contrato_demo.FormActivate(Sender: TObject);
var
  clClie: TClassCliente;
begin
     {Chamando o CPF/CGC do cliente ****}
  clClie := TClassCliente.Create;
  with (clClie) do
  begin
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Select CL_CPF ');
    AddParam ('From CRECLI ');
    AddParam ('Where (CL_CODI='+inttostr(frm_edtCliente2.cdCliente)+') ');
    Execute;
    if (Trim(clClie.Result('CL_CPF'))<>'') then
    begin
      edtCpf.text:=Trim(clClie.Result('CL_CPF'));
      desabilitaedit(edtCpf);
      edtBanco.setfocus;
      Label3.caption:='CPF/CNPJ do cliente (dono do cheque)';
    end
    else
    begin
      edtCpf.text:='';
      habilitaedit(edtCpf);
      edtCpf.setfocus;
      Label3.caption:='CNPJ/Entre com o CNPJ do cliente';
    end;
    desconect;
    Free;
  end;
end;

procedure Tfrm_aux2Contrato_demo.edtNumEnter(Sender: TObject);
begin
  edtNum.selectall;
end;

procedure Tfrm_aux2Contrato_demo.edtNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOk.click;
  if (key=K_CIMA) then
    edtAgenc.setfocus;
end;

procedure Tfrm_aux2Contrato_demo.edtBancoEnter(Sender: TObject);
var
  clAux: TClassAuxiliar;
  critica1,critica2: Boolean;
begin
  TMaskEdit(Sender).selectall;

     {critica do CPF/CNPJ *** - Verificando se ja existe alguem com o mesmo}
  if (edtCpf.enabled) then
  begin
    critica1:=false;
    critica2:=false;
    if (Trim(edtCpf.text)<>'') then
    begin
      critica2:=true;
      clAux := TClassAuxiliar.Create;
      clAux.conect ('CREDITO',self);
      clAux.ClearSql;
      clAux.AddParam ('Select CL_CPF,CL_CODI,CL_NOME ');
      clAux.AddParam ('From   CRECLI ');
      clAux.AddParam ('Where (CL_CPF='+chr(39)+Trim(edtCpf.text)+chr(39)+') ');
      if (clAux.Execute) then
        critica1:=true;
      if (critica1) and (critica2) then
      begin
        frmDialogo.ExibirMensagem (' J� existe cliente cadastrado com este CPF/CNPJ: '+
          'Cliente: '+form_nz(clAux.result('CL_CODI'),6)+'/'+form_t(clAux.result('CL_NOME'),40)
          ,'CPF/CNPJ',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtCpf.text;
      end;
      clAux.desconect;
      clAux.Free;
    end;
  end;
end;

procedure Tfrm_aux2Contrato_demo.edtBancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtAgenc.setfocus;
  if (key=K_CIMA) then
    if (edtCpf.enabled) then
      edtCpf.setfocus;
end;

procedure Tfrm_aux2Contrato_demo.edtAgencKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNum.setfocus;
  if (key=K_CIMA) then
    edtBanco.setfocus;
end;

procedure Tfrm_aux2Contrato_demo.edtAgencEnter(Sender: TObject);
begin
  edtAgenc.selectall;
end;

{Procedimento que registra na prestacao o numero do cheque ***}
procedure Tfrm_aux2Contrato_demo.MarcaPrestacaoCheque (cliente,contrato,prestacao: Real;
  ccgc: String; banco,numero: Real; agencia: String);
begin
  with (DMcontrato.qAlteraChequePrestacao) do
  begin
    ParambyName ('cliente').AsFloat := cliente;
    ParambyName ('contrato').AsFloat := contrato;
    ParambyName ('prestacao').AsFloat := prestacao;
    ParambyName ('ccgc').AsString := ccgc;
    ParambyName ('banco').AsFloat  := banco;
    ParambyName ('numero').AsFloat := numero;
    ParambyName ('agencia').AsString := agencia;
    ExecSql;
  end;
end;

{Procedimento que apaga o cheque registrado para cada prestacao do contrato ***}
procedure Tfrm_aux2Contrato_demo.ApagaCheque (ccgc: String; banco,numero: Real);
begin
  with (DMcontrato.qApagaCheque) do
  begin
    ParambyName ('ccgc').AsString  := ccgc;
    ParambyName ('banco').AsFloat  := banco;
    ParambyName ('numero').AsFloat := numero;
    ExecSql;
  end;
end;

procedure Tfrm_aux2Contrato_demo.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_aux2Contrato_demo.edtCpfEnter(Sender: TObject);
begin
  edtCpf.selectall;
end;

procedure Tfrm_aux2Contrato_demo.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtBanco.setfocus;
end;

procedure Tfrm_aux2Contrato_demo.edtCpfExit(Sender: TObject);
begin
  CriticaCNPJ(edtCpf);
end;

function Tfrm_aux2Contrato_demo.JaExisteChequeCadastrado(ccgc,banco,numero: String):Boolean;
var
  clAux: TClassAuxiliar;
  achou1,achou2,achou3,achou4: Boolean;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('Select CH_CCGC                               ');
  clAux.AddParam ('From   CRECHMOV                              ');
  clAux.AddParam ('Where (CH_CCGC='+chr(39)+ccgc+chr(39)+') AND ');
  clAux.AddParam ('      (CH_BANC='+banco+') AND                ');
  clAux.AddParam ('      (CH_NUME='+numero+')                   ');
  if (clAux.Execute) then
    achou1:=true
  else
    achou1:=false;
  clAux.ClearSql;
  clAux.AddParam ('Select CH_CCGC                               ');
  clAux.AddParam ('From   CRECHMVPG                             ');
  clAux.AddParam ('Where (CH_CCGC='+chr(39)+ccgc+chr(39)+') AND ');
  clAux.AddParam ('      (CH_BANC='+banco+') AND                ');
  clAux.AddParam ('      (CH_NUME='+numero+')                   ');
  if (clAux.Execute) then
    achou2:=true
  else
    achou2:=false;
  clAux.ClearSql;
  clAux.AddParam ('Select CH_CCGC                               ');
  clAux.AddParam ('From   CRECHDEV                              ');
  clAux.AddParam ('Where (CH_CCGC='+chr(39)+ccgc+chr(39)+') AND ');
  clAux.AddParam ('      (CH_BANC='+banco+') AND                ');
  clAux.AddParam ('      (CH_NUME='+numero+')                   ');
  if (clAux.Execute) then
    achou3:=true
  else
    achou3:=false;
  clAux.ClearSql;
  clAux.AddParam ('Select CH_CCGC                               ');
  clAux.AddParam ('From   CRECHDVPG                             ');
  clAux.AddParam ('Where (CH_CCGC='+chr(39)+ccgc+chr(39)+') AND ');
  clAux.AddParam ('      (CH_BANC='+banco+') AND                ');
  clAux.AddParam ('      (CH_NUME='+numero+')                   ');
  if (clAux.Execute) then
    achou4:=true
  else
    achou4:=false;
  if (achou1) or (achou2) or (achou3) or (achou4) then
    JaExisteChequeCadastrado:=true
  else
    JaExisteChequeCadastrado:=false;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_aux2Contrato_demo.FormCreate(Sender: TObject);
begin
  flagSae := false;
end;

procedure Tfrm_aux2Contrato_demo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (flagSae) then
    Action := caFree
  else
    Action := caNone;
end;

end.
