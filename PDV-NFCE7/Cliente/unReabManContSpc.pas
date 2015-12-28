unit unReabManContSpc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, Mask, prestcontratolote, prestcontrato;

type
  Tfrm_ReabManContSPC = class(TForm)
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
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Label2: TLabel;
    Memo1: TMemo;
    lbF8: TLabel;
    lbF8mens: TLabel;
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
    procedure edtCodLojaExit(Sender: TObject);
    procedure edtCodCliExit(Sender: TObject);
    procedure edtCodContExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCliente,vContrato,vPrestacao,vValor,vLoja: Real;
    vCcgc: String;
    vBanco,vNumero: Real;
    vDataContrato: TDateTime;
    vVencimento: TDateTime;
    procedure LimparEdits;
  end;

var
  frm_ReabManContSPC: Tfrm_ReabManContSPC;

implementation

uses unAux1LancReceb, principal, unDialogo, DM5, funcoes1, funcoes2, procura, credito,
  DM9, auxiliar;

{$R *.DFM}

procedure Tfrm_ReabManContSPC.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ReabManContSPC.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ReabManContSPC.edtCodLojaChange(Sender: TObject);
begin
  if (Length(Trim(edtCodLoja.text))=2) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
end;

procedure Tfrm_ReabManContSPC.edtCodCliChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCli.text))=6) then
  begin
    if (Trim(edtCodCli.text)<>'') then
      edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
    edtCodCont.setfocus;
  end;
end;

procedure Tfrm_ReabManContSPC.edtCodContChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCont.text))=6) then
  begin
    if (Trim(edtCodCont.text)<>'') then
      edtCodCont.text:=form_nz(strtofloat(Trim(edtCodCont.text)),6);
    edtNPre.setfocus;
  end;
end;

procedure Tfrm_ReabManContSPC.edtCodLojaKeyDown(Sender: TObject;
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
    frm_Aux1LancReceb.formAnt:=3;
    frm_Aux1LancReceb.flagStatus:='2';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;
  if (key=K_DIR) then
    if (edtCodLoja.selstart=1) then
      edtCodCli.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número do documento: Formato: 99.999999.999999.99',10);
end;

procedure Tfrm_ReabManContSPC.edtCodLojaEnter(Sender: TObject);
begin
  edtCodLoja.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_ReabManContSPC.edtCodCliKeyDown(Sender: TObject;
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
    frm_Aux1LancReceb.formAnt:=3;
    frm_Aux1LancReceb.flagStatus:='2';
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

procedure Tfrm_ReabManContSPC.edtCodCliEnter(Sender: TObject);
begin
  edtCodCli.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_ReabManContSPC.edtCodContKeyDown(Sender: TObject;
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
    frm_Aux1LancReceb.formAnt:=3;
    frm_Aux1LancReceb.flagStatus:='2';
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

procedure Tfrm_ReabManContSPC.edtCodContEnter(Sender: TObject);
begin
  edtCodCont.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_ReabManContSPC.edtNPreExit(Sender: TObject);
begin
  if (Trim(edtNPre.text)<>'') then
    edtNPre.text:=form_nz(strtofloat(Trim(edtNPre.text)),2);
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_ReabManContSPC.edtNPreEnter(Sender: TObject);
begin
  edtNPre.selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe prestações cadastradas';
  lbF8Mens.visible:=true;
end;

{Puxando os dados ***}
procedure Tfrm_ReabManContSPC.edtNPreKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clPrest: TClassPrestContrat;
  prestacao,codcli,codcont: String;
begin
     {busca pelos dados do contrato ***}
  if (key=K_ENTER) then
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
        AddParam ('       PC_CHEQ,PC_DTPG,PC_VPAG,PC_CCGC,PC_BANC,PC_AGEN, ');                          
        AddParam ('       PC_NUME                                          ');
        AddParam ('From   CREPRABR,CRECTABR                                ');
        AddParam ('Where  (PC_CONT='+codcont+') AND                        ');
        AddParam ('       (PC_CLIE='+codcli+') AND                         ');
        AddParam ('       (PC_NPRE='+prestacao+') AND                      ');
        AddParam ('       (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI)          ');
        AddParam ('Order  by PC_NPRE                                       ');
        frm_principal.BarraDicas.caption:='Procurando documento...';
        frm_principal.refresh;
        if (Execute) then
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

          vCliente   := Result('PC_CLIE');
          vContrato  := Result('PC_CONT');
          vPrestacao := Result('PC_NPRE');
          vValor     := Result('PC_VALO');
          vLoja      := Result('PC_LOJA');
          vDataContrato := Result('PC_DCON');
          vVencimento := Result('PC_DVTO');

                      {.. - Cheque, se existir}
          vCcgc      := Result('PC_CCGC');
          vBanco     := Result('PC_BANC');
          vNumero    := Result('PC_NUME');
          btnBaixar.setfocus;
        end
        else
        begin
                       {erro --->}
          frmDialogo.ExibirMensagem (' Documento não encontrado! '
            ,'Regularização Manual no S.P.C.',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtCodLoja.text :='';
          edtCodCli.text  :='';
          edtCodCont.text :='';
          edtNPre.text    :='';
          vCliente        := 0;
          vContrato       := 0;
          vPrestacao      := 0;
          vValor          := 0.00;
          vLoja           := 0;
          vCcgc           := '';
          vBanco          := 0;
          vNumero         := 0;
          vVencimento     := strtodate('01/01/1900');
          vDatacontrato   := strtodate('01/01/1900');
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
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_Aux1LancReceb,frm_Aux1LancReceb);
    frm_Aux1LancReceb.windowstate:=wsMaximized;
    frm_Aux1LancReceb.formAnt:=3;
    frm_Aux1LancReceb.flagStatus:='2';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;
end;

procedure Tfrm_ReabManContSPC.FormActivate(Sender: TObject);
begin
  edtCodLoja.setfocus;
end;

procedure Tfrm_ReabManContSPC.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtCodLoja.setfocus;
end;

{Limpeza do cadastro ***}
procedure Tfrm_ReabManContSPC.LimparEdits;
begin
  edtCodLoja.text   := '';
  edtCodCli.text    := '';
  edtCodCont.text   := '';
  edtNPre.text      := '';
  vCliente          := 0;
  vContrato         := 0;
  vPrestacao        := 0;
  vValor            := 0.00;
  vLoja             := 0;
  vCcgc             := '';
  vBanco            := 0;
  vNumero           := 0;
  vVencimento       := strtodate('01/01/1900');
  vDatacontrato       := strtodate('01/01/1900');
  Memo1.Lines.Clear;
end;

{Opcao de realizacao da reabertura do documento ***}
{Esta transacao é composta de TRES operacoes - esta encapsulada!!!}
procedure Tfrm_ReabManContSPC.Registrarbaixadodocumento1Click(
  Sender: TObject);
var
  clAux,clCliente: TClassAuxiliar;
  cliente,contrato,prestacao,texto: String;
  flagContinua: Boolean;
begin
     {Unidade transacional ***}
  texto := 'Confirma regularização do documento?';
  if (vCliente<>0) and (vContrato<>0) and (vPrestacao<>0) then
  begin
          {if (frmDialogo.ExibirMensagem (texto,
              'Regularização Manual no S.P.C.',[mbYes,mbNo],
              frm_principal.x_pathimg+'iconequestion.bmp',
              250,200)=mrYes) then
          begin}
    texto := 'Regularizando documento...';
    frm_principal.BarraDicas.caption := texto;
    frm_principal.refresh;

                 {op1 - marca contrato}
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('Select * From CONTRATOS_SPC                      ');
    clAux.AddParam ('Where (CLIENTE='+floattostr(vCliente)+') AND     ');
    clAux.AddParam ('      (CONTRATO='+floattostr(vContrato)+') AND   ');
    clAux.AddParam ('      (PARCELA='+floattostr(vPrestacao)+')       ');
    if (clAux.Execute) then
    begin
      flagContinua:=true;
      if (clAux.result('STATUS')='1') then
      begin
        frmDialogo.ExibirMensagem ('Documento já se encontra regularizado!'
          ,'Regularização Manual no S.P.C.',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        flagContinua:=false;
      end;
      if (flagContinua) then
      begin
        DMRegAutSpc.qAltManContSPC.parambyname('cliente').AsFloat    := vCliente;
        DMRegAutSpc.qAltManContSPC.parambyname('contrato').AsFloat   := vContrato;
        DMRegAutSpc.qAltManContSPC.parambyname('parcela').AsFloat    := vPrestacao;
        DMRegAutSpc.qAltManContSPC.parambyname('valor').AsFloat      := vValor;
        DMRegAutSpc.qAltManContSPC.parambyname('loja').AsFloat       := vLoja;
        DMRegAutSpc.qAltManContSPC.parambyname('data_contrato').AsDateTime := vDataContrato;
        DMRegAutSpc.qAltManContSPC.parambyname('vencimento').AsDateTime := vVencimento;
        DMRegAutSpc.qAltManContSPC.parambyname('dataspc').AsDateTime := clAux.result('DATASPC');
        DMRegAutSpc.qAltManContSPC.parambyname('datareg').AsDateTime := frm_principal.x_data_trabalho;
        DMRegAutSpc.qAltManContSPC.parambyname('status').AsString    := '1';
        DMRegAutSpc.qAltManContSPC.ExecSql;
      end;
    end
    else
    begin
      DMRegAutSpc.qRegManContSPC.parambyname('cliente').AsFloat    := vCliente;
      DMRegAutSpc.qRegManContSPC.parambyname('contrato').AsFloat   := vContrato;
      DMRegAutSpc.qRegManContSPC.parambyname('parcela').AsFloat    := vPrestacao;
      DMRegAutSpc.qRegManContSPC.parambyname('valor').AsFloat      := vValor;
      DMRegAutSpc.qRegManContSPC.parambyname('loja').AsFloat       := vLoja;
      DMRegAutSpc.qRegManContSPC.parambyname('data_contrato').AsDateTime := vDataContrato;
      DMRegAutSpc.qRegManContSPC.parambyname('vencimento').AsDateTime := vVencimento;
      DMRegAutSpc.qRegManContSPC.parambyname('dataspc').AsDateTime := strtodate('01/01/1900');
      DMRegAutSpc.qRegManContSPC.parambyname('datareg').AsDateTime := frm_principal.x_data_trabalho;
      DMRegAutSpc.qRegManContSPC.parambyname('status').AsString    := '1';
      DMRegAutSpc.qRegManContSPC.ExecSql;
    end;

                 {op2 - marca cliente}
    if (flagcontinua) then
    begin
      clCliente := TClassAuxiliar.Create;
      with (clCliente) do
      begin
        conect ('CREDITO',self);
        ClearSql;
        AddParam ('Select * From CONTRATOS_SPC            ');
        AddParam ('Where (CLIENTE=:cliente) AND           ');
        AddParam ('      (STATUS='+chr(39)+'0'+chr(39)+') ');
        consulta.parambyname('cliente').AsFloat := vCliente;
        if (not Execute) then
        begin
          if (frmDialogo.ExibirMensagem ('Regularizar o cadastro do cliente também?',
            'Regularização Manual no S.P.C.',[mbYes,mbNo],
            frm_principal.x_pathimg+'iconequestion.bmp',
            250,200)=mrYes) then
          begin
            ClearSql;
            AddParam ('Update CRECLI                       ');
            AddParam ('Set CL_DSPC=:data,                  ');
            AddParam ('    CL_RSPC=:flag,                  ');
            AddParam ('    CL_TIME='+chr(39)+
              FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
            AddParam ('Where (CL_CODI=:cliente)            ');
            consulta.parambyname('data').AsDateTime := frm_principal.x_data_trabalho;
            consulta.parambyname('flag').AsString   := 'N';
            consulta.parambyname('cliente').AsFloat := vCliente;
            Execute;
          end;
        end
        else
          frmDialogo.ExibirMensagem (' O cadastro do cliente não será regularizado porque ainda existe contrato registrado! '
            ,'Regularização Manual no S.P.C.',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        desconect;
        Free;
      end;
    end;
    clAux.desconect;
    clAux.Free;
    Limparformulrio1.click;
          {end;}
  end;
end;

procedure Tfrm_ReabManContSPC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ReabManContSPC.btnBaixarClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_ReabManContSPC.edtCodLojaExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_ReabManContSPC.edtCodCliExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_ReabManContSPC.edtCodContExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

end.
