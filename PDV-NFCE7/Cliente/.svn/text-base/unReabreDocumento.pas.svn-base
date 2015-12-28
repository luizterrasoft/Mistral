unit unReabreDocumento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, Mask, prestcontratolote, prestcontrato;

type
  Tfrm_ReabreDocumento = class(TForm)
    pnContrato: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtCodLoja: TMaskEdit;
    edtCodCli: TMaskEdit;
    edtCodCont: TMaskEdit;
    edtNPre: TMaskEdit;
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
    btnLimpar: TButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Label2: TLabel;
    Memo1: TMemo;
    lbF8mens: TLabel;
    lbF8: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtCodLojaChange(Sender: TObject);
    procedure edtCodCliChange(Sender: TObject);
    procedure edtCodContChange(Sender: TObject);
    procedure edtCodLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodLojaEnter(Sender: TObject);
    procedure edtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodCliEnter(Sender: TObject);
    procedure edtCodContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodContEnter(Sender: TObject);
    procedure edtNPreExit(Sender: TObject);
    procedure edtNPreEnter(Sender: TObject);
    procedure edtNPreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBaixarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtCodLojaExit(Sender: TObject);
    procedure edtCodCliExit(Sender: TObject);
    procedure edtCodContExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCliente,vContrato,vPrestacao,vValor: Real;
    vCcgc: String;
    vBanco,vNumero: Real;
    procedure LimparEdits;
  end;

var
  frm_ReabreDocumento: Tfrm_ReabreDocumento;

implementation

uses unAux1LancReceb, principal, unDialogo, DM5, funcoes1, funcoes2, procura, credito;

{$R *.DFM}

procedure Tfrm_ReabreDocumento.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ReabreDocumento.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ReabreDocumento.edtCodLojaChange(Sender: TObject);
begin
  if (Length(Trim(edtCodLoja.text))=2) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
end;

procedure Tfrm_ReabreDocumento.edtCodCliChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCli.text))=6) then
  begin
    if (Trim(edtCodCli.text)<>'') then
      edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
    edtCodCont.setfocus;
  end;
end;

procedure Tfrm_ReabreDocumento.edtCodContChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCont.text))=6) then
  begin
    if (Trim(edtCodCont.text)<>'') then
      edtCodCont.text:=form_nz(strtofloat(Trim(edtCodCont.text)),6);
    edtNPre.setfocus;
  end;
end;

procedure Tfrm_ReabreDocumento.edtCodLojaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_Aux1LancReceb,frm_Aux1LancReceb);
    frm_Aux1LancReceb.windowstate:=wsMaximized;
    frm_Aux1LancReceb.formAnt:=1;
    frm_Aux1LancReceb.flagStatus:='1';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;
  if (key=K_DIR) then
    if (edtCodLoja.selstart=1) then
      edtCodCli.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número do documento: Formato: 99.999999.999999.99',10);
end;

procedure Tfrm_ReabreDocumento.edtCodLojaEnter(Sender: TObject);
begin
  edtCodLoja.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_ReabreDocumento.edtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodCli.text)<>'') then
      edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
    edtCodCont.setfocus;
  end;
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_Aux1LancReceb,frm_Aux1LancReceb);
    frm_Aux1LancReceb.windowstate:=wsMaximized;
    frm_Aux1LancReceb.formAnt:=1;
    frm_Aux1LancReceb.flagStatus:='1';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;
  if (key=K_CIMA) then
    edtCodLoja.setfocus;
  if (key=K_ESQ) and (edtCodCli.selstart=0) then
    edtCodLoja.setfocus;
  if (key=K_DIR) then
    if (edtCodCli.selstart=5) then
      edtCodCont.setfocus;
end;

procedure Tfrm_ReabreDocumento.edtCodCliEnter(Sender: TObject);
begin
  edtCodCli.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_ReabreDocumento.edtCodContKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
  begin
    if (Trim(edtCodCont.text)<>'') then
      edtCodCont.text:=form_nz(strtofloat(Trim(edtCodCont.text)),6);
    edtNPre.setfocus;
  end;
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_Aux1LancReceb,frm_Aux1LancReceb);
    frm_Aux1LancReceb.windowstate:=wsMaximized;
    frm_Aux1LancReceb.formAnt:=1;
    frm_Aux1LancReceb.flagStatus:='1';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;
  if (key=K_CIMA) then
    edtCodCli.setfocus;
  if (key=K_ESQ) and (edtCodCont.selstart=0) then
    edtCodCli.setfocus;
  if (key=K_DIR) then
    if (edtCodCont.selstart=5) then
      edtNPre.setfocus;
end;

procedure Tfrm_ReabreDocumento.edtCodContEnter(Sender: TObject);
begin
  edtCodCont.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_ReabreDocumento.edtNPreExit(Sender: TObject);
begin
  if (Trim(edtNPre.text)<>'') then
    edtNPre.text:=form_nz(strtofloat(Trim(edtNPre.text)),2);
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_ReabreDocumento.edtNPreEnter(Sender: TObject);
begin
  edtNPre.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

{Puxando os dados ***}
procedure Tfrm_ReabreDocumento.edtNPreKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clPrest: TClassPrestContrat;
  prestacao,codcli,codcont: String;
begin
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
        AddParam ('Select PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_DVTO,PC_LOJA,  ');
        AddParam ('       PC_DCON,PC_STAT,PC_PORT,PC_AVAL,PC_PLAN,PC_TPRE,  ');
        AddParam ('       PC_CHEQ,PC_DTPG,PC_VPAG,PC_CCGC,PC_BANC,PC_AGEN,  ');
        AddParam ('       PC_NUME,PC_LJPG                                   ');
        AddParam ('From   CREPRABR,CRECTABR                                 ');
        AddParam ('Where  (PC_CONT='+codcont+') AND                         ');
        AddParam ('       (PC_CLIE='+codcli+') AND                          ');
        AddParam ('       (PC_NPRE='+prestacao+') AND                       ');
        AddParam ('       (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI)           ');
        AddParam ('Order  by PC_NPRE                                        ');
        frm_principal.BarraDicas.caption:='Procurando documento...';
        frm_principal.refresh;
        if (Execute) then
        begin
                       {Verificando o status --->}
          if (Result('PC_STAT')='0') then
          begin
            frmDialogo.ExibirMensagem (' Documento já está em aberto! '
              ,'Reabertura de documento',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            vCliente   := 0;
            vContrato  := 0;
            vPrestacao := 0;
            vValor     := 0.00;
            vCcgc      := '';
            vBanco     := 0;
            vNumero    := 0;
          end
          else
          begin
                            {buscando dados --->}
            Memo1.Lines.Clear;
            Memo1.Lines.Add ('');
            Memo1.Lines.Add (' Nome do cliente....: '+ProcuraNomeClienteCod (Result('PC_CLIE'),self));
            Memo1.Lines.Add (' Nome da loja.......: '+ProcuraNomeLoja(Result('PC_LOJA'),self));
            Memo1.Lines.Add (' Data de vencimento.: '+form_data(Result('PC_DVTO')));
            Memo1.Lines.Add (' Valor do documento.: '+form_nc(Result('PC_VALO'),10));
            Memo1.Lines.Add (' Prestação..........: '+floattostr(Result('PC_NPRE'))+'/'+
              floattostr(Result('PC_TPRE')));
            if (Result('PC_DTPG')<>strtodate('01/01/1900')) then
              Memo1.Lines.Add (' Data de recebimento: '+form_data (Result('PC_DTPG')));
            if (Result('PC_VPAG')<>0.00) then
              Memo1.Lines.Add (' Valor pago.........: '+form_nc   (Result('PC_VPAG'),10));
            if (Result('PC_LJPG')<>0) then
              Memo1.Lines.Add (' Loja do pagamento..: '+form_nz(Result('PC_LJPG'),2)+'/'+
                ProcuraNomeLoja(Result('PC_LJPG'),self));

            vCliente   := Result('PC_CLIE');
            vContrato  := Result('PC_CONT');
            vPrestacao := Result('PC_NPRE');
            vValor     := Result('PC_VALO');

                            {.. - Cheque, se existir}
            vCcgc      := Result('PC_CCGC');
            vBanco     := Result('PC_BANC');
            vNumero    := Result('PC_NUME');
            btnBaixar.setfocus;
          end;
        end
        else
        begin
                       {erro --->}
          frmDialogo.ExibirMensagem (' Documento não encontrado! '
            ,'Reabertura de documento',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtCodLoja.text :='';
          edtCodCli.text  :='';
          edtCodCont.text :='';
          edtNPre.text    :='';
          vCliente        := 0;
          vContrato       := 0;
          vPrestacao      := 0;
          vValor          := 0.00;
          vCcgc           := '';
          vBanco          := 0;
          vNumero         := 0;
        end;
        frm_principal.BarraDicas.caption:='';
        desconect;
        Free;
      end;
    end;
  end;
  if (key=K_CIMA) then
    edtCodCont.setfocus;
  if (key=K_ESQ) and (edtNPre.selstart=0) then
    edtCodCont.setfocus;
end;

procedure Tfrm_ReabreDocumento.FormActivate(Sender: TObject);
begin
  edtCodLoja.setfocus;
end;

procedure Tfrm_ReabreDocumento.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtCodLoja.setfocus;
end;

{Limpeza do cadastro ***}
procedure Tfrm_ReabreDocumento.LimparEdits;
begin
  edtCodLoja.text   := '';
  edtCodCli.text    := '';
  edtCodCont.text   := '';
  edtNPre.text      := '';
  vCliente          := 0;
  vContrato         := 0;
  vPrestacao        := 0;
  vValor            := 0.00;
  vCcgc             := '';
  vBanco            := 0;
  vNumero           := 0;
  Memo1.Lines.Clear;
end;

{Opcao de realizacao da reabertura do documento ***}
{Esta transacao é composta de TRES operacoes - esta encapsulada!!!}
procedure Tfrm_ReabreDocumento.Registrarbaixadodocumento1Click(
  Sender: TObject);
begin
     {Unidade transacional ***}
  if (vCliente<>0) and (vContrato<>0) and (vPrestacao<>0) then
    if (frmDialogo.ExibirMensagem ('Confirma reabertura do documento?',
      'Reabertura de documento',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
    begin
      frm_principal.BarraDicas.caption:='Reabrindo documento...';
      frm_principal.refresh;

                 {op1 - joga a prestacao para o status de EM ABERTO}
      ReabrePrestacao (vCliente,vContrato,vPrestacao,vValor);

                 {op2 - apaga o registro do arquivo de LOTE, incondicionalmente}
      with (DMAtualizReceb.qApagaLote) do
      begin
        parambyname('cliente').AsFloat   := vCliente;
        parambyname('contrato').AsFloat  := vContrato;
        parambyname('prestacao').AsFloat := vPrestacao;
        ExecSql;
      end;

                 {op4 - reabre o cheque se o usuario pedir}
      if (vCcgc<>'') and (vBanco<>0) and (vNumero<>0) then
        if (frmDialogo.ExibirMensagem ('Reabrir o cheque pré-datado vinculado ('+
          floattostr(vBanco)+'- '+floattostr(vNumero)+')?','Reabertura de documento',[mbYes,mbNo],
          frm_principal.x_pathimg+'iconequestion.bmp',
          250,200)=mrYes) then
          ReabreCheqPre (vCcgc,floattostr(vBanco),floattostr(vNumero));
      Limparformulrio1.click;
    end;
end;

procedure Tfrm_ReabreDocumento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ReabreDocumento.btnBaixarClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_ReabreDocumento.btnLimparClick(Sender: TObject);
begin
  Limparformulrio1.click;
end;

procedure Tfrm_ReabreDocumento.edtCodLojaExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_ReabreDocumento.edtCodCliExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_ReabreDocumento.edtCodContExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

end.
