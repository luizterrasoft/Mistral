unit unLancReceb2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Menus, ComCtrls,funcoesglobais, LabelOO,
  Buttons, MaskEditOO;

type
  Tfrm_LancReceb2 = class(TForm)
    Bevel2: TBevel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    edtLoja: TMaskEdit;
    Label1: TLabel;
    pnLoja: TPanel;
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
    Memo2: TMemo;
    Label3: TLabel;
    edtDatPgto: TMaskEdit;
    edtValor: TMaskEdit;
    Label6: TLabel;
    pnDif: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    lbF8mens: TLabel;
    lbF8: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    btnBaixar: TButton;
    btnLimpar: TButton;
    Label4: TLabel;
    pnCorrigido: TPanel;
    Label5: TLabel;
    pnMulta: TPanel;
    Label8: TLabel;
    pnJuros: TPanel;
    StatusBar1: TStatusBar;
    lblFormaPgto: TLabel;
    edtFormaPgto: TMaskEdit;
    pnFormaPgto: TPanel;
    LabelOO1: TLabelOO;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtLojaDblClick(Sender: TObject);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodLojaChange(Sender: TObject);
    procedure edtCodLojaEnter(Sender: TObject);
    procedure edtCodLojaExit(Sender: TObject);
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
    procedure edtValor1Enter(Sender: TObject);
    procedure edtValor1Exit(Sender: TObject);
    procedure edtValor1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValor1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLimparClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtFormaPgtoEnter(Sender: TObject);
    procedure edtFormaPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFormaPgtoDblClick(Sender: TObject);
    procedure edtFormaPgtoExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ImprimirComprovante;
  public
    { Public declarations }
    y_cliente: Real;
    y_loja_contrato: Real;
    y_numero_contrato: Real;
    loja,valor: Real;
    datacont,vencimento: TDateTime;
    tpre,port,aval,plano: Real;
    PodeBaixar: Boolean;
    Exibiu: Boolean;
    flagDV: Boolean;
    flagLoja: Boolean;
    //**************************
    numeroComprovantes: Integer;
    numeroVia: Integer;
    //**************************
    procedure LimparEdits;
    procedure SalvarQuitacaoPrestacao(codigocliente,codigocontrato,numeroprestacao,valor: Real;
      datavencimento,datapagamento: TDateTime; codigoloja,valorpago: Real);
    procedure VerificaObservacaoCliente;
  end;

var
  frm_LancReceb2: Tfrm_LancReceb2;

implementation

uses principal, F8Lojas, loja, funcoes1, funcoes2, cadcli, unDialogo, prestcontrato, cliente,
  DM5, prestcontratolote, unAux1LancReceb, procura, credito, contratos,
  un_Autentica, auxiliar, f8Clientes, mem_prnt, DBTables, unConfigLocal2, un_frmConsulta1_Observacao;

{$R *.DFM}

procedure Tfrm_LancReceb2.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_LancReceb2.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancReceb2.Limparformulrio1Click(Sender: TObject);
begin
  PodeBaixar:=false;
  vencimento:=strtodate('01/01/1900');
  datacont:=strtodate('01/01/1900');
  loja  :=0;
  valor :=0.00;
  port  := 0;
  aval  := 0;
  plano := 0;
  tpre  := 0;
  LimparEdits;
  edtCodLoja.text:='';
  edtCodCli.text:='';
  edtCodCont.text:='';
  edtFormaPgto.text:='';
  pnFormaPgto.caption:='';
  edtNPre.text:='';
  Registrarbaixadodocumento1.enabled:=false;
//     edtLoja.setfocus;
  if (y_loja_contrato<>0) then
    edtCodLoja.text := form_nz(y_loja_contrato,2);
  if (y_cliente<>0) then
    edtCodCli.text  := form_nz(y_cliente,6);
  if (y_numero_contrato<>0) then
    edtCodCont.text := form_nz(y_numero_contrato,6);

  if (frm_principal.x_loja<>0) then
  begin
    edtLoja.text   :=form_nz(frm_principal.x_loja,2);
    pnLoja.caption :=ProcuraNomeLoja(frm_principal.x_loja,self);
    if (FlagLoja) then
    begin
      edtLoja.readonly    := true;
      edtcodloja.readonly := true;
      edtcodloja.text     := edtloja.text;
      edtcodcli.setfocus;
    end;
  end;

  if (trim(edtloja.text) = '') then
    edtloja.setfocus
  else
  if not flagloja or (trim(edtCodLoja.text) = '') then
    edtCodLoja.setfocus
  else
  if (trim(edtcodcli.text) = '') then
    edtcodcli.setfocus
  else
  if (trim(edtcodcont.text) = '') then
    edtcodcont.setfocus
  else
    edtNPre.setfocus;

end;

procedure Tfrm_LancReceb2.edtLojaDblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja;
    showmodal;
  end;
end;

procedure Tfrm_LancReceb2.edtLojaEnter(Sender: TObject);
begin
  edtLoja.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_LancReceb2.edtLojaExit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtLoja.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtLoja.text));
    pnLoja.caption:=ProcuraNomeLoja (codigo,self);
    edtLoja.text:=form_nz(codigo,2);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_LancReceb2.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodLoja.setfocus;
     {if (key=K_F8) then
     begin
       with (frm_f8Lojas) do
       begin
         left:=287;
         top :=76;
         edit:=edtLoja;
         showmodal;
       end;
     end;}
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código da loja; Formato: 999; Tecle'+
      ' <F8/Duplo clique> para selecionar lojas cadastradas.',10);
end;

procedure Tfrm_LancReceb2.edtCodLojaChange(Sender: TObject);
begin
  if (Length(Trim(edtCodLoja.text))=2) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
end;

procedure Tfrm_LancReceb2.edtCodLojaEnter(Sender: TObject);
begin
  edtCodLoja.selectall;
end;

procedure Tfrm_LancReceb2.edtCodLojaExit(Sender: TObject);
begin
  if (Trim(edtCodLoja.text)<>'') then
    if (flagLoja) and
      (strtofloat(Trim(edtLoja.text))<>strtofloat(Trim(edtCodLoja.text))) then
    begin
      frmDialogo.ExibirMensagem (' A loja da compra não pode ser diferente da loja do recebimento!'
        ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCodLoja.text:='';
      edtCodLoja.setfocus;
    end;
end;

procedure Tfrm_LancReceb2.edtCodLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=TEdit(Sender);
      y_loja:=StrFToFloat(edtloja.Text);
      showmodal;
    end;

  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
  if (key=K_CIMA) then
    edtLoja.setfocus;
  if (key=K_DIR) then
    if (edtCodLoja.selstart=1) then
      edtCodCli.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número do documento: Formato: 99.999999.999999.99',10);
end;

procedure Tfrm_LancReceb2.edtCodCliChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCli.text))=6) then
  begin
    if (Trim(edtCodCli.text)<>'') then
    begin
      edtCodCli.Text := form_nz(StrToFloat(Trim(edtCodCli.Text)),6);
      VerificaObservacaoCliente;
    end;
    edtCodCont.setfocus;
  end;
end;

procedure Tfrm_LancReceb2.edtCodCliEnter(Sender: TObject);
begin
  edtCodCli.selectall;
end;

procedure Tfrm_LancReceb2.edtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit := edtCodCli;
      showmodal;
    end;

  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodCli.text)<>'') then
    begin
      edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
      VerificaObservacaoCliente;
    end;
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

procedure Tfrm_LancReceb2.edtCodContChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCont.text))=6) then
  begin
    if (Trim(edtCodCont.text)<>'') then
      edtCodCont.text:=form_nz(strtofloat(Trim(edtCodCont.text)),6);
    edtNPre.setfocus;
  end;
end;

procedure Tfrm_LancReceb2.edtCodContEnter(Sender: TObject);
begin
  edtCodCont.selectall;
end;

procedure Tfrm_LancReceb2.edtCodContKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_Aux1LancReceb,frm_Aux1LancReceb);
    frm_Aux1LancReceb.windowstate:=wsMaximized;
    frm_Aux1LancReceb.formAnt:=4;
    frm_Aux1LancReceb.flagStatus:='4';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;

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

procedure Tfrm_LancReceb2.edtNPreEnter(Sender: TObject);
begin
  edtNPre.selectall;
end;

procedure Tfrm_LancReceb2.edtNPreExit(Sender: TObject);
begin
  if (Trim(edtNPre.text)<>'') then
    edtNPre.text:=form_nz(strtofloat(Trim(edtNPre.text)),2);
end;

procedure Tfrm_LancReceb2.edtNPreKeyDown(Sender: TObject; var Key: Word;
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
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_Aux1LancReceb,frm_Aux1LancReceb);
    frm_Aux1LancReceb.windowstate:=wsMaximized;
    frm_Aux1LancReceb.formAnt:=4;
    frm_Aux1LancReceb.flagStatus:='4';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;

     {busca pelos dados do contrato ***}
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    codcli  := Trim(edtCodCli.text);
    codcont := Trim(edtCodCont.text);
    prestacao := Trim(edtNPre.text);
    if ((codCli<>'') and (codCont<>'') and (prestacao<>'')) then
    begin
             {formatacao dos edits ---}
      edtnPre.text    := form_nz(strtofloat(prestacao),2);
      clPrest := TClassPrestContrat.Create;
      with (clPrest) do
      begin
        conect ('CREDITO',self);
        ClearSql;
        AddParam ('Select PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_DVTO,PC_LOJA, ');
        AddParam ('       PC_DCON,PC_STAT,PC_PORT,PC_AVAL,PC_PLAN,PC_TPRE, ');
        AddParam ('       PC_CHEQ,PC_NUME                                  ');
        AddParam ('From   CREPRABR                                         ');
        AddParam ('Where  (PC_CONT='+codcont+') AND                        ');
        AddParam ('       (PC_CLIE='+codcli+') AND                         ');
        AddParam ('       (PC_NPRE='+prestacao+')                          ');
        AddParam ('Order  by PC_NPRE ');
        frm_principal.BarraDicas.caption:='Procurando o número de contrato...';
        frm_principal.refresh;
        if (Execute) then
        begin
                       {verificando se é prestacao paga com cheque ***}
          continua:=true;
          if (Result('PC_NUME')<>0) then
          begin
            frmDialogo.ExibirMensagem (' Prestação é paga com cheque pré-datado!'
              ,'Recebimentos',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            continua:=false;
            edtNPre.setfocus;
          end;
          if (Result('PC_STAT')='1') then
          begin
            frmDialogo.ExibirMensagem (' Prestação encontra-se quitada!'
              ,'Recebimentos',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            continua:=false;
            edtNPre.setfocus;
          end;
          if (continua) then
          begin
            PodeBaixar := true;
            vencimento := Result('PC_DVTO');
            datacont   := Result('PC_DCON');
            loja       := Result('PC_LOJA');
            valor      := Result('PC_VALO');
            port       := Result('PC_PORT');
            aval       := Result('PC_AVAL');
            plano      := Result('PC_PLAN');
            tpre       := Result('PC_TPRE');

                           {dados buscados do arquivo principal ***}
            Memo2.lines.clear;
            Memo2.Lines.Add (' Cliente.....: '+
              form_t(ProcuraNomeClienteCod(clPrest.Result('PC_CLIE'),self),40));
            Memo2.Lines.Add (' Loja........: '+
              form_t(ProcuraNomeLoja(clPrest.Result('PC_LOJA'),self),40));
            Memo2.Lines.Add (' Vencimento..: '+form_data(Result('PC_DVTO')));
            Memo2.Lines.Add (' Valor.......: '+form_nc(Result('PC_VALO'),10));
            Memo2.Lines.Add (' Prestação...: '+floattostr(Result('PC_NPRE'))+'/'+floattostr(Result('PC_TPRE')));
            if (edtDatPgto.text='  /  /    ') then
              edtDatPgto.text := datetostr(frm_principal.x_data_trabalho); {sugerindo a data da baixa}
            Registrarbaixadodocumento1.enabled:=true;

            if (not edtDV.visible) then
              edtDatPgto.setfocus
            else
              edtDV.setfocus;
          end;
        end
        else
        begin
          frmDialogo.ExibirMensagem (' Contrato não encontrado! '
            ,'Recebimentos',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtNPre.setfocus;
        end;
        frm_principal.BarraDicas.caption:='';
        desconect;
        Free;
      end;
    end;
  end;
  if (key=K_F8) then
  ;
  if (key=K_CIMA) then
    edtCodCont.setfocus;
  if (key=K_ESQ) and (edtNPre.selstart=0) then
    edtCodCont.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nº da prestação: formato 99',10);
end;

{Opcao de registro da baixa do documento ****}
procedure Tfrm_LancReceb2.Registrarbaixadodocumento1Click(Sender: TObject);
var
  clContrato: TClassContrato;
  clPrest: TClassPrestContrat;
  DVcerto: Boolean;
  flag1: Boolean;
  valor1,codcli,codcont,prestacao,lojapg: Real;
  codclis,codconts,prestacaos,horapg: String;
  datapg: TDateTime;
  erro1,erro2,erro3,erro4,erro5: Boolean;
begin
  numeroVia := 1;
     {CRITICA AOS DADOS DA BAIXA ***}
  pnFormaPgto.caption := ProcuraNomeFormaPrestacao(StrtofloatN(edtformapgto.text),Self);
  codclis    := Trim(edtCodCli.text);
  codconts   := Trim(edtCodCont.text);
  prestacaos := Trim(edtNPre.text);
  valor1 := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
  if edtformapgto.canfocus and ((pnformapgto.caption = '<Forma de pgto. não cadastrada>') or (pnformapgto.caption = '')) then
  begin
    frmDialogo.ExibirMensagem (' Forma de Pgto cadastrada Obrigatória !!! '
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFormaPgto.setfocus
  end
  else
  if (Trim(edtLoja.text)='') then
  begin
    frmDialogo.ExibirMensagem (' A loja do recebimento não pode ficar vazia!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtLoja.setfocus;
  end
  else
  if (Trim(edtDatPgto.text)='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' A data de recebimento não pode ficar vazia!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDatPgto.setfocus;
  end
  else
  if (trim(edtValor.Text)='') or (trim(edtValor.Text)='0,00') then
  begin
    frmDialogo.ExibirMensagem (' O valor pago não pode ficar vazio!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  if ((not frm_principal.x_pode_valor_dif_pago) and (valor1<>valor)) then
  begin
    frmDialogo.ExibirMensagem (' O valor pago não pode ser diferente do valor da prestação!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
    edtValor.selectall;
  end
  else
  if ((not frm_principal.x_pode_loja_valor_menor) and (valor1<valor)) then
  begin
    frmDialogo.ExibirMensagem (' O valor pago não pode ser menor que o valor da prestação!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
    edtValor.selectall;
  end
  else
  if (flagLoja) and (strtofloat(Trim(edtLoja.text))<>strtofloat(Trim(edtCodLoja.text))) then
  begin
    frmDialogo.ExibirMensagem (' A loja da compra não pode ser diferente da loja do recebimento!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtLoja.setfocus;
  end
  else
  if (not IsQuitada(codclis,codconts,floattostr(strtofloat(prestacaos)-1))) then
  begin
    frmDialogo.ExibirMensagem (' A prestação anterior não está baixada!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtLoja.setfocus;
  end
  else
  begin
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
    if (DVcerto) then
      if (not PodeBaixar) then
        frmDialogo.ExibirMensagem (' Informe um documento!'
          ,'',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if not (frmDialogo.ExibirMensagem (iifs(edtformapgto.canfocus,'Baixa do documento com a Forma de pgto. '+edtFormaPgto.text+' '+pnFormaPgto.caption+' ?','Confirma Baixa ?')
        ,'Baixa',[mbYes,mbNo],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        exit
      else
      begin
        frm_principal.BarraDicas.caption:='Realizando baixa da prestação...';
        frm_principal.refresh;

               {Quitando a prestacao --->}
        codclis    := Trim(edtCodCli.text);
        codconts   := Trim(edtCodCont.text);
        prestacaos := Trim(edtNPre.text);
        codcli     := strtofloat(Trim(edtCodCli.text));
        codcont    := strtofloat(Trim(edtCodCont.text));
        prestacao  := strtofloat(Trim(edtNPre.text));
        lojapg     := strtofloat(Trim(edtLoja.text));
        datapg     := strtodate(Trim(edtDatPgto.text));
        horapg     := TimeToStr(Time);
        valor1     := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));


        if (not frm_principal.x_autenticacao_baixa) then
        begin
                  {PROCESSAMENTO DE LIQUIDACAO DA PRESTACAO --->}
                  {*************************************************************************************}
          QuitaPrestacao (codcli,codcont,prestacao,lojapg,valor1,datapg,StrtoFloatN(edtformapgto.text));
          SalvarQuitacaoPrestacao(codcli,codcont,prestacao,valor,vencimento,datapg,lojapg,valor1); {*}
                  {*************************************************************************************}
          if (frm_principal.x_requisitar_forma_pgto) then
            if (trim(edtFormaPgto.text)='') then
              LancaFormaPgtoPrestacao(codcli,codcont,prestacao,0)
            else
              LancaFormaPgtoPrestacao(codcli,codcont,prestacao,strtofloat(trim(edtFormaPgto.text)));
          frm_principal.BarraDicas.caption:='';
          frm_principal.ExibirDica ('Baixa do documento registrada...',5);
        end
        else
        if (frm_principal.x_autenticacao_baixa) then
        begin
               {*** - autenticacao}
          Application.CreateForm(Tfrm_Autentica, frm_Autentica);
          frm_Autentica.cliente    := strtofloat (Trim(edtCodCli.text));
          frm_Autentica.contrato   := strtofloat (Trim(edtCodCont.text));
          frm_Autentica.prestacao  := strtoint   (Trim(edtNPre.text));
          frm_Autentica.datapgto   := datapg;
          frm_Autentica.valor      := valor1;
          frm_Autentica.codloja    := lojapg;
          frm_Autentica.formapg    := StrToFloatN(Trim(edtFormaPgto.Text));
          frm_Autentica.vencimento := vencimento;
          frm_Autentica.showmodal;
          frm_Autentica.Free;
        end;
        if (frm_principal.x_comprovante_pagamento) then
        begin
          numeroComprovantes := frm_principal.x_qtde_comprovante_pagamento;
          while (numeroComprovantes>0) do
          begin
            ImprimirComprovante;
            if (numeroComprovantes <> 1) then
              frmDialogo.ExibirMensagem ('Retire o comprovante!',
                '2ª Via',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
                250,200);
            numeroComprovantes := numeroComprovantes - 1;
            numeroVia := numeroVia + 1;
          end;
        end;

        Limparformulrio1.click;
      end{Se nao pode baixar ***};
  end;
end;

procedure Tfrm_LancReceb2.edtDVEnter(Sender: TObject);
begin
  edtDV.selectall;
end;

procedure Tfrm_LancReceb2.edtDVKeyDown(Sender: TObject; var Key: Word;
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

{Procedimento de limpeza dos edits ***}
procedure Tfrm_LancReceb2.LimparEdits;
begin
  edtCodLoja.text:='';
  edtCodCli.text:='';
  edtCodCont.text:='';
  edtNPre.text:='';
  edtValor.text:='';
  pnDif.caption:='';
  edtDV.text:='';
  pnCorrigido.caption:='';
  pnMulta.caption:='';
  pnJuros.caption:='';
  Memo2.lines.clear;
end;

procedure Tfrm_LancReceb2.edtDatPgtoEnter(Sender: TObject);
begin
  edtDatPgto.selectall;
end;

procedure Tfrm_LancReceb2.edtDatPgtoExit(Sender: TObject);
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

procedure Tfrm_LancReceb2.edtDatPgtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValor.setfocus;
  if (key=K_CIMA) then
    edtNPre.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de recebimento: Formato 99/99/9999',10);
end;

procedure Tfrm_LancReceb2.edtValor1Enter(Sender: TObject);
var
  clLoja: TClassLoja;
  atraso: Real;
  multa,juros: Real;
begin
     {CRITICA AOS DADOS ANTERIORES ***}
  if (edtDatPgto.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' Data de recebimento não pode ficar nula!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDatPgto.setfocus;
  end
  else
  begin
          {...}
    clLoja:=TClassLoja.Create;
    with (clLoja) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select LO_CODI,LO_NOME,LO_MULT,LO_DMUL,LO_MORA,LO_DMOR ');
      AddParam ('From   CRELOJA ');
      AddParam ('Where (LO_CODI='+floattostr(loja)+') ');
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
    atraso := strtodate(edtDatPgto.text) - vencimento;
    multa  := LerMulta(valor,atraso,loja);
    juros  := LerJuros(valor,atraso,loja);
    pnCorrigido.caption := form_nc(valor+multa+juros,10);
    if (Trim(edtValor.text)='') or (Trim(edtValor.text)='0,00') then
      if (frm_principal.x_preenche_com_valor_corrigido) then
        edtValor.text   := Trim(form_nc(valor+multa+juros,10))
      else
        edtValor.text   := Trim(form_nc(valor,10));
  end;
  edtValor.selectall;
end;

procedure Tfrm_LancReceb2.edtValorExit(Sender: TObject);
var
  valor1,valor2: Real;
begin
  RetiraFormatacaoNumero (edtValor.text);
  FormatarZerosDecimais (edtValor);

     {calculando a diferenca}
  if (Trim(edtValor.text)<>'') then
  begin
    valor1:=strtofloat(Trim(edtValor.text));
    pnDif.caption:=form_nc(valor1-valor,10);
  end;
end;

procedure Tfrm_LancReceb2.edtValor1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtFormaPgto.visible) then
      edtFormaPgto.setfocus
    else
      btnBaixar.click;
  if (key=K_CIMA) then
    edtDatPgto.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor recebido: Formato 999,99',10);
end;

procedure Tfrm_LancReceb2.edtValor1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValor);
end;

procedure Tfrm_LancReceb2.btnLimparClick(Sender: TObject);
begin
  Limparformulrio1.click;
end;

procedure Tfrm_LancReceb2.btnBaixarClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_LancReceb2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_LancReceb2.FormActivate(Sender: TObject);
begin
  if (not Exibiu) then
  begin
    exibiu := true;
    Limparformulrio1.onclick(sender);
  end;
     
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

procedure Tfrm_LancReceb2.FormCreate(Sender: TObject);

begin
  Exibiu:=false;   
     {Pergunta pelo digito --}
  if (frm_principal.x_reqdigv = 2) or ((frm_principal.x_reqdigv <= 1) and (frmDialogo.ExibirMensagem ('Requisitar dígito verificador?',
    'Baixa',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
    250,200)=mrYes)) then
    flagDV:=true
  else
    flagDV:=false;

     {Pergunta pela loja recebimento = loja da compra --}
  if (frm_principal.x_pode_loja_dif_pago = 2) or ((frm_principal.x_pode_loja_dif_pago <= 1) and (frmDialogo.ExibirMensagem ('Bloquear loja de recebimento diferente da loja da compra?',
    'Baixa',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
    250,200)=mrYes)) then
    flagLoja:=true
  else
    flagLoja:=false;

     {Config. do formulario---}
  PodeBaixar:=false;
  vencimento:=strtodate('01/01/1900');
  datacont:=strtodate('01/01/1900');
  loja:=0;
  valor:=0.00;
  port := 0;
  aval := 0;
  plano := 0;
  tpre := 0;
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

procedure Tfrm_LancReceb2.edtFormaPgtoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancReceb2.edtFormaPgtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtValor.setfocus;
  if (key=K_ENTER) then
    btnBaixar.click;
  if (key=K_F8) then
    ChamandoF8FormaPgto_3(edtFormaPgto,true);
end;

procedure Tfrm_LancReceb2.edtFormaPgtoDblClick(Sender: TObject);
begin
  ChamandoF8FormaPgto_3(edtFormaPgto,true);
end;

procedure Tfrm_LancReceb2.SalvarQuitacaoPrestacao(codigocliente,codigocontrato,numeroprestacao,valor: Real;
  datavencimento,datapagamento: TDateTime; codigoloja,valorpago: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO CREPRABR(PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_DVTO,     ');
  clAux.AddParam ('                     PC_DTPG,PC_DTRA,PC_LOJA,PC_LJPG,             ');
  clAux.AddParam ('                     PC_VPAG,PC_STAT,PC_FUNC,PC_CAIX,             ');
  clAux.AddParam ('                     PC_TIME,PC_FPGT,PC_HORA)                                     ');
  clAux.AddParam ('VALUES (:PC_CLIE,:PC_CONT,:PC_NPRE,:PC_VALO,:PC_DVTO,             ');
  clAux.AddParam ('                     :PC_DTPG,:PC_DTRA,:PC_LOJA,:PC_LJPG,         ');
  clAux.AddParam ('                     :PC_VPAG,:PC_STAT,:PC_FUNC,:PC_CAIX,         ');
  clAux.AddParam ('                     :PC_TIME,:PC_FPGT,:PC_HORA)                                    ');
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
  clAux.consulta.parambyname('PC_FPGT').AsFloat    := strtofloatn(edtFormaPgto.text);
  clAux.consulta.parambyname('PC_HORA').AsString    := timetostr(time);
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancReceb2.edtFormaPgtoExit(Sender: TObject);
begin
  if (trim(edtFormaPgto.text)<>'') then
  begin
    pnFormaPgto.caption:=ProcuraNomeFormaPrestacao(strtofloat(trim(edtFormaPgto.text)),self);
    edtFormaPgto.text:=form_nz(strtofloat(trim(edtFormaPgto.text)),2);
  end
  else
    pnFormaPgto.caption:='';
end;

procedure Tfrm_LancReceb2.edtValorEnter(Sender: TObject);
var
  clLoja: TClassLoja;
  atraso: Real;
  multa,juros: Real;
begin
     {CRITICA AOS DADOS ANTERIORES ***}
  if (edtDatPgto.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem (' Data de recebimento não pode ficar nula!'
      ,'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDatPgto.setfocus;
  end
  else
  begin
          {...}
    clLoja:=TClassLoja.Create;
    with (clLoja) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select LO_CODI,LO_NOME,LO_MULT,LO_DMUL,LO_MORA,LO_DMOR ');
      AddParam ('From   CRELOJA ');
      AddParam ('Where (LO_CODI='+floattostr(loja)+') ');
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
    atraso := strtodate(edtDatPgto.text) - vencimento;
    multa  := LerMulta(valor,atraso,loja);
    juros  := LerJuros(valor,atraso,loja);
    pnCorrigido.caption := form_nc(valor+multa+juros,10);
    if (Trim(edtValor.text)='') or (Trim(edtValor.text)='0,00') then
      if (frm_principal.x_preenche_com_valor_corrigido) then
        edtValor.text   := Trim(form_nc(valor+multa+juros,10))
      else
        edtValor.text   := Trim(form_nc(valor,10));
  end;
  edtValor.selectall;

end;

procedure Tfrm_LancReceb2.edtValor1Exit(Sender: TObject);
var
  valor1,valor2: Real;
begin
  RetiraFormatacaoNumero (edtValor.text);
  FormatarZerosDecimais (edtValor);

     {calculando a diferenca}
  if (Trim(edtValor.text)<>'') then
  begin
    valor1:=strtofloat(Trim(edtValor.text));
    pnDif.caption:=form_nc(valor1-valor,10);
  end;

end;

procedure Tfrm_LancReceb2.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  valor1,valor2: Real;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtFormaPgto.visible) then
      edtFormaPgto.setfocus
    else
    begin
      RetiraFormatacaoNumero (edtValor.text);
      FormatarZerosDecimais (edtValor);
             {calculando a diferenca}
      if (Trim(edtValor.text)<>'') then
      begin
        valor1:=strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
        pnDif.caption:=form_nc(valor1-valor,10);
      end;
      btnBaixar.click;
    end;
  if (key=K_CIMA) then
    edtDatPgto.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor recebido: Formato 999,99',10);
end;

procedure Tfrm_LancReceb2.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValor);
end;

procedure Tfrm_LancReceb2.ImprimirComprovante;
var
  Qry: TQuery;
  descricao, endereco, cidade, uf: String;
  nomeCliente: String;
  valorParcela: Real;
  dataVencimento: String;
  juros: Real;
  valorPago: Real;
  ix: Integer;
begin
  with (frm_mem_print) do
  begin
                {configurando o gerador de relatorios}
    if (frm_principal.x_modelo_impressao_geral=0) then //MATRICIAL
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'sliptran.rel';
      frm_principal.x_comando       := '15c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
    end
    else
    if (frm_principal.x_modelo_impressao_geral=1) then //JATO DE TINTA
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'sliptran.rel';
      frm_principal.x_comando       := '12c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
    end;
    AddLine ('--------------------------------------');
    AddLine ('      COMPROVANTE DE PAGAMENTO        ');
    AddLine ('                '+inttostr(numeroVia)+'-Via                 ');
    AddLine ('--------------------------------------');
                //************************************************************************************
    Qry := TQuery.Create(Application);
    with (Qry) do
      try
        DataBaseName :=  'CONTASPAGAR';
        Sql.Add('Select CC_DESC, CC_ENDE, CC_CIDA, CC_UF                   ');
        Sql.Add('From   CENTROS_DE_CUSTO                                   ');
        Sql.Add('Where CC_CODI='+Trim(edtCodLoja.Text)+'                   ');
        open;
        descricao    := fieldbyname('CC_DESC').AsString;
        endereco     := fieldbyname('CC_ENDE').AsString;
        cidade       := fieldbyname('CC_CIDA').AsString;
        uf           := fieldbyname('CC_UF').AsString;
      finally
        destroy;
      end;
                //************************************************************************************
    AddLine (''+descricao+'');
    AddLine (''+endereco+'');
    AddLine (''+cidade+' - '+uf+'');
    AddLine ('');
    AddLine ('Cliente: '+Trim(edtCodCli.Text)+'');
                //************************************************************************************
    Qry := TQuery.Create(Application);
    with (Qry) do
      try
        DataBaseName := 'CREDITO';
        Sql.Add('Select CL_NOME                         ');
        Sql.Add('From CRECLI                            ');
        Sql.Add('Where CL_CODI='+Trim(edtCodCli.Text)+' ');
        open;
        nomeCliente := fieldbyname('CL_NOME').AsString;
      finally
        destroy;
      end;
                //************************************************************************************
    AddLine (''+nomeCliente+'');
    AddLine ('');
    AddLine ('Contrato     Prest      Valor    Juros');
                //************************************************************************************
    Qry := TQuery.Create(Application);
    with (Qry) do
      try
        DataBaseName := 'CREDITO';
        Sql.Add('Select PC_VALO, PC_DVTO, PC_VPAG              ');
        Sql.Add('From CREPRABR                                 ');
        Sql.Add('Where (PC_CLIE='+Trim(edtCodCli.Text)+')      ');
        Sql.Add('      AND (PC_NPRE='+Trim(edtNPre.Text)+')    ');
        Sql.Add('      AND (PC_CONT='+Trim(edtCodCont.Text)+') ');
        Sql.Add('      AND (PC_LOJA='+Trim(edtCodLoja.Text)+') ');
        open;
        dataVencimento := fieldbyname('PC_DVTO').AsString;
        valorParcela   := fieldbyname('PC_VALO').AsFloat;
        valorPago      := fieldbyname('PC_VPAG').AsFloat;
      finally
        destroy;
      end;
                //************************************************************************************
    juros := strtofloat(Trim(pndif.Caption));
    AddLine ('  '+form_t(Trim(edtCodCont.Text),6)+'       '+form_t(Trim(edtNPre.Text),3)+'   '+form_nc(valorParcela,8)+'   '+form_nc(juros,6));
    AddLine ('');
    AddLine ('Data Vencimento             '+dataVencimento+'');
    AddLine ('Data Pagamento              '+Trim(edtDatPgto.Text)+'');
    AddLine ('Total Pago                  R$'+form_nc(valorPago,8)+'');
    AddLine ('');
    AddLine ('--------------------------------------');
    AddLine ('      OBRIGADO PELA PREFERENCIA       ');
    AddLine ('--------------------------------------');

    ix:=1;
    while (ix<=frm_principal.x_qtde_linhas_entre_SLIPS_TRANSFERENCIA) do
    begin
      frm_mem_print.AddLine('');
      ix:=ix+1;
    end;
    frm_mem_print.windowstate:=wsMaximized;
    esconde_mensagem;
    if (frm_principal.x_slip_na_tela_TRANSFERENCIA) then
      frm_mem_print.showmodal //IMPRESSAO NA TELA
    else
      frm_mem_print.btnImprimiri.click; //IMPRIMINDO DIRETO, SEM PASSAR PELA TELA
  end;
end;

procedure Tfrm_LancReceb2.VerificaObservacaoCliente;
var
  clAux,clOBS: TClassAuxiliar;
  motivoBloqueio,observacao: String;
  obs1,obs2,obs3,obs4,obs5: String;
begin
  motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(StrToFloat(Trim(edtCodCli.Text)));
  if (motivobloqueio<>'-1') then
  begin
    Application.CreateForm(Tfrm_consulta1_observacao,frm_consulta1_observacao);
    frm_Consulta1_Observacao.lblObs.caption := '>>>> CLIENTE BLOQUEADO ';
    frm_Consulta1_Observacao.memo1.lines.clear;
    frm_Consulta1_Observacao.memo1.lines.add('Motivo: ');
    frm_Consulta1_Observacao.memo1.lines.add(motivobloqueio);
    frm_Consulta1_Observacao.Height      := 180;
    frm_Consulta1_Observacao.btnOk.Top   := 100;
    frm_Consulta1_Observacao.Color       := clRed;
    frm_Consulta1_Observacao.Memo1.Color := clRed;
    frm_Consulta1_Observacao.ShowModal;
    frm_Consulta1_Observacao.color       := clNavy;
    frm_Consulta1_Observacao.Memo1.Color := clNavy;
    frm_Consulta1_Observacao.Free;
  end
  else
  begin
    clAux := TClassAuxiliar.Create;
    clAux.Conect('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam('SELECT CL_CODI,CL_OBSE FROM CRECLI '+
                   'WHERE (CL_CODI=:CODIGO)            ');
    clAux.consulta.ParamByName('CODIGO').AsFloat := StrToFloat(Trim(edtCodCli.Text));
    if (clAux.Execute) then
      observacao := clAux.Result('CL_OBSE')
    else
      observacao := '';

    if (observacao <> '') then
    begin
      Application.CreateForm(Tfrm_consulta1_observacao,frm_consulta1_observacao);
      frm_consulta1_observacao.lblObs.caption := '>>>> '+observacao;

      clOBS := TClassAuxiliar.Create;
      clOBS.conect   ('CREDITO',self);
      clOBS.ClearSql;
      clOBS.AddParam ('SELECT OB_CLIE,OB_LIN1,OB_LIN2,OB_LIN3,OB_LIN4,OB_LIN5 ');
      clOBS.AddParam ('FROM   CRECLI_OBS                                      ');
      clOBS.AddParam ('WHERE  (OB_CLIE=:cliente)                              ');
      clOBS.consulta.parambyname('cliente').AsFloat := StrToFloat(Trim(edtCodCli.Text));
      if (clOBS.Execute) then
      begin
        if (trim(clOBS.Result('OB_LIN1'))='.') then
        begin
          frm_consulta1_observacao.height    := 127;
          frm_consulta1_observacao.btnOk.top := 60;
          frm_consulta1_observacao.memo1.lines.clear;
          frm_consulta1_observacao.memo1.lines.add('');
          frm_consulta1_observacao.memo1.lines.add('');
          frm_consulta1_observacao.memo1.lines.add('');
          frm_consulta1_observacao.memo1.lines.add('');
          frm_consulta1_observacao.memo1.lines.add('');
        end
        else
        begin
          frm_consulta1_observacao.height    := 217;
          frm_consulta1_observacao.btnOk.top := 148;
          frm_consulta1_observacao.memo1.lines.clear;
          frm_consulta1_observacao.memo1.lines.add(clOBS.Result('OB_LIN1'));
          frm_consulta1_observacao.memo1.lines.add(clOBS.Result('OB_LIN2'));
          frm_consulta1_observacao.memo1.lines.add(clOBS.Result('OB_LIN3'));
          frm_consulta1_observacao.memo1.lines.add(clOBS.Result('OB_LIN4'));
          frm_consulta1_observacao.memo1.lines.add(clOBS.Result('OB_LIN5'));
        end;
      end
      else
      begin
        frm_consulta1_observacao.height    := 127;
        frm_consulta1_observacao.btnOk.top := 60;
        frm_consulta1_observacao.memo1.lines.clear;
        frm_consulta1_observacao.memo1.lines.add('');
        frm_consulta1_observacao.memo1.lines.add('');
        frm_consulta1_observacao.memo1.lines.add('');
        frm_consulta1_observacao.memo1.lines.add('');
        frm_consulta1_observacao.memo1.lines.add('');
      end;
      clOBS.desconect;
      clOBS.Free;
      frm_Consulta1_Observacao.Color       := clRed;
      frm_Consulta1_Observacao.Memo1.Color := clRed;
      frm_consulta1_observacao.ShowModal;
      frm_Consulta1_Observacao.color       := clNavy;
      frm_Consulta1_Observacao.Memo1.Color := clNavy;
      frm_consulta1_observacao.Free;
    end;
  end;
end;

end.
