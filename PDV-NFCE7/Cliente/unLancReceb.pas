unit unLancReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Mask, Menus;

type
  Tfrm_LancReceb = class(TForm)
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    edtLoja: TMaskEdit;
    pnLoja: TPanel;
    Bevel3: TBevel;
    Label3: TLabel;
    edtDatPgto: TMaskEdit;
    Label6: TLabel;
    edtValor: TMaskEdit;
    Label7: TLabel;
    pnDif: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Limparformulrio1: TMenuItem;
    pnContrato: TPanel;
    edtCodLoja: TMaskEdit;
    edtCodCli: TMaskEdit;
    edtCodCont: TMaskEdit;
    edtNPre: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Registrarbaixadodocumento1: TMenuItem;
    btnBaixar: TButton;
    Panel2: TPanel;
    btnLimpar: TButton;
    lbF8mens: TLabel;
    lbF8: TLabel;
    Label16: TLabel;
    edtDV: TMaskEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Label4: TLabel;
    pnCorrigido: TPanel;
    pnMulta: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    pnJuros: TPanel;
    procedure edtLojaEnter(Sender: TObject);
    procedure edtDatPgtoEnter(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDatPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtLojaDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtCodLojaEnter(Sender: TObject);
    procedure edtCodCliEnter(Sender: TObject);
    procedure edtCodContEnter(Sender: TObject);
    procedure edtNPreEnter(Sender: TObject);
    procedure edtNPreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNPreExit(Sender: TObject);
    procedure edtCodLojaChange(Sender: TObject);
    procedure edtCodCliChange(Sender: TObject);
    procedure edtCodContChange(Sender: TObject);
    procedure edtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBaixarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtDatPgtoExit(Sender: TObject);
    procedure edtDVEnter(Sender: TObject);
    procedure edtDVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodLojaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flagLog,PodeBaixar: Boolean;
    loja,valor: Real;
    datacont,vencimento: TDateTime;
    tpre,port,aval,plano: Real;
    flagDV: Boolean;
    flagLoja: Boolean;
    procedure LimparEdits;
  end;

var
  frm_LancReceb: Tfrm_LancReceb;

implementation

uses principal, F8Lojas, loja, funcoes1, funcoes2, cadcli, unDialogo, prestcontrato, cliente,
  DM5, prestcontratolote, unAux1LancReceb, procura, credito;

{$R *.DFM}

{navegacao-}
procedure Tfrm_LancReceb.edtLojaEnter(Sender: TObject);
begin
  edtLoja.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

{navegacao-}
procedure Tfrm_LancReceb.edtDatPgtoEnter(Sender: TObject);
begin
  edtDatPgto.selectall;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtValorEnter(Sender: TObject);
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
  end;
  edtValor.selectall;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodLoja.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLoja;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código da loja; Formato: 999; Tecle'+
      ' <F8/Duplo clique> para selecionar lojas cadastradas.',10);
end;

{navegacao-}
{navegacao-}
procedure Tfrm_LancReceb.edtDatPgtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValor.setfocus;
  if (key=K_CIMA) then
    edtNPre.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de recebimento: Formato 99/99/9999',10);
end;

{Navegacao-}
procedure Tfrm_LancReceb.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    btnBaixar.click;
  if (key=K_CIMA) then
    edtDatPgto.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor recebido: Formato 999,99',10);
end;

{navegacao-}
procedure Tfrm_LancReceb.SAIR1Click(Sender: TObject);
begin
  close;
end;

{navegacao-}
procedure Tfrm_LancReceb.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_LancReceb.edtLojaDblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja;
    showmodal;
  end;
end;

{Ativacao do formulario}
procedure Tfrm_LancReceb.FormActivate(Sender: TObject);
begin
     {Config.}
  if (flagDV) then
  begin
    edtDV.visible:=true;
    Label16.visible:=true;
  end
  else
  begin
    edtDV.visible:=false;
    Label16.visible:=false;
  end;
  edtLoja.setfocus;
end;

{Busca pela loja ***}
procedure Tfrm_LancReceb.edtLojaExit(Sender: TObject);
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

{Procedimento de limpeza dos edits ***}
procedure Tfrm_LancReceb.LimparEdits;
begin
  edtCodLoja.text:='';
  edtCodCli.text:='';
  edtCodCont.text:='';
  edtNPre.text:='';
  edtValor.text:='';
  pnDif.caption:='';
  edtDV.text:='';
  Memo2.lines.clear;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodLojaEnter(Sender: TObject);
begin
  edtCodLoja.selectall;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodCliEnter(Sender: TObject);
begin
  edtCodCli.selectall;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodContEnter(Sender: TObject);
begin
  edtCodCont.selectall;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtNPreEnter(Sender: TObject);
begin
  edtNPre.selectall;
end;

{Busca pelo contrato ***}
procedure Tfrm_LancReceb.edtNPreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clPrest: TClassPrestContrat;
  clPrest2: TClassPrestContratLote;
  clClie: TClassCliente;
  clLoja: TClassLoja;
  prestacao,codcli,codcont: String;
  valor1,valor2: Real;
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
        AddParam ('       PC_CHEQ,PC_NUME                                   ');
        AddParam ('From   CREPRABR,CRECTABR                                 ');
        AddParam ('Where  (PC_CONT='+codcont+') AND                         ');
        AddParam ('       (PC_CLIE='+codcli+') AND                          ');
        AddParam ('       (PC_NPRE='+prestacao+') AND                       ');
        AddParam ('       (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI)           ');
        AddParam ('Order  by PC_NPRE                                        ');
        frm_principal.BarraDicas.caption:='Procurando o número de contrato...';
        frm_principal.refresh;
        if (Execute) then
        begin
                       {verificando se é prestacao paga com cheque ***}
          if (Result('PC_CHEQ')<>0) then
          begin
            frmDialogo.ExibirMensagem (' Prestação é paga com cheque pré-datado!'
              ,'Recebimentos',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            edtNPre.setfocus;
          end
          else
          begin
                           {buscando nome do cliente ***}
            clClie:=TClassCliente.Create;
            with (clClie) do
            begin
              conect ('CREDITO',self);
              ClearSql;
              AddParam ('Select CL_CODI,CL_NOME ');
              AddParam ('From CRECLI ');
              AddParam ('Where (CL_CODI='+codcli+') ');
              Execute;
              Memo2.Lines.Add (' Cliente.....: '+form_t(result('CL_NOME'),40));
              desconect;
              Free;
            end;

                           {buscando loja onde o contrato foi cadastrado ***}
            clLoja:=TClassLoja.Create;
            with (clLoja) do
            begin
              conect ('CREDITO',self);
              ClearSql;
              AddParam ('Select LO_CODI,LO_NOME ');
              AddParam ('From   CRELOJA ');
              AddParam ('Where (LO_CODI='+floattostr(clPrest.Result('PC_LOJA'))+') ');
              Execute;
              Memo2.Lines.Add (' Loja........: '+form_t(result('LO_NOME'),40));
              desconect;
              Free;
            end;
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
            Memo2.Lines.Add (' Vencimento..: '+form_data(Result('PC_DVTO')));
            Memo2.Lines.Add (' Valor.......: '+form_nc(Result('PC_VALO'),10)+'  '+
              ' Prestação...: '+floattostr(Result('PC_NPRE'))+'/'+floattostr(Result('PC_TPRE')));
            if (edtDatPgto.text='  /  /    ') then
              edtDatPgto.text := datetostr(frm_principal.x_data_trabalho); {sugerindo a data da baixa}
            if (Trim(edtValor.text)='') or (Trim(edtValor.text)='0,00') then
              edtValor.text   := floattostr(Result('PC_VALO'));
            Registrarbaixadodocumento1.enabled:=true;

                           {dados buscados do arquivo de lote ***}
            clPrest2 := TClassPrestContratLote.Create;
            with (clPrest2) do
            begin
              clPrest2.conect ('CREDITO',self);
              ClearSql;
              AddParam ('Select PC_DTPG,PC_VPAG               ');
              AddParam ('From   CREPRABR                      ');
              AddParam ('Where  (PC_CONT='+codcont+') AND     ');
              AddParam ('       (PC_CLIE='+codcli+') AND      ');
              AddParam ('       (PC_NPRE='+prestacao+')       ');
              if (Execute) then
              begin
                if (Result('PC_DTPG')<>strtodate('01/01/1900')) then
                  edtDatPgto.text := datetostr (Result('PC_DTPG'));
                if (Result('PC_VPAG')<>0.00) then
                  edtValor.text   := form_nc   (Result('PC_VPAG'),10);
                if (Trim(edtValor.text)<>'') then
                  valor1 := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)))
                else
                  valor1 := 0.00;
                pnDif.caption   := form_nc   (valor1-valor,10);
              end;
              desconect;
              Free;
            end;
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
          edtCodLoja.text :='';
          edtCodCli.text  :='';
          edtCodCont.text :='';
          edtNPre.text    :='';
          Registrarbaixadodocumento1.enabled:=false;
          edtCodLoja.setfocus;
        end;
        frm_principal.BarraDicas.caption:='';
        desconect;
        Free;
      end;
    end;
  end;
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_Aux1LancReceb,frm_Aux1LancReceb);
    frm_Aux1LancReceb.windowstate:=wsMaximized;
    frm_Aux1LancReceb.formAnt:=0;
    frm_Aux1LancReceb.flagStatus:='0';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;
  if (key=K_CIMA) then
    edtCodCont.setfocus;
  if (key=K_ESQ) and (edtNPre.selstart=0) then
    edtCodCont.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   N. da prestação: formato 99',10);
end;

{navegacao-}
procedure Tfrm_LancReceb.edtNPreExit(Sender: TObject);
begin
  if (Trim(edtNPre.text)<>'') then
    edtNPre.text:=form_nz(strtofloat(Trim(edtNPre.text)),2);
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodLojaChange(Sender: TObject);
begin
  if (Length(Trim(edtCodLoja.text))=2) then
  begin
    if (Trim(edtCodLoja.text)<>'') then
      edtCodLoja.text:=form_nz(strtofloat(Trim(edtCodLoja.text)),2);
    edtCodCli.setfocus;
  end;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodCliChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCli.text))=6) then
  begin
    if (Trim(edtCodCli.text)<>'') then
      edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
    edtCodCont.setfocus;
  end;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodContChange(Sender: TObject);
begin
  if (Length(Trim(edtCodCont.text))=6) then
  begin
    if (Trim(edtCodCont.text)<>'') then
      edtCodCont.text:=form_nz(strtofloat(Trim(edtCodCont.text)),6);
    edtNPre.setfocus;
  end;
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
    frm_Aux1LancReceb.formAnt:=0;
    frm_Aux1LancReceb.flagStatus:='0';
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
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do cliente: Formato 999999',10);
end;

{navegacao-}
procedure Tfrm_LancReceb.edtCodLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
    frm_Aux1LancReceb.formAnt:=0;
    frm_Aux1LancReceb.flagStatus:='0';
    frm_Aux1LancReceb.showmodal;
    frm_Aux1LancReceb.Free;
  end;
  if (key=K_CIMA) then
    edtLoja.setfocus;
  if (key=K_DIR) then
    if (edtCodLoja.selstart=1) then
      edtCodCli.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número do documento: Formato: 99.999999.999999.99',10);
end;

procedure Tfrm_LancReceb.edtCodContKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
    frm_Aux1LancReceb.formAnt:=0;
    frm_Aux1LancReceb.flagStatus:='0';
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
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do contrato: formato 999999',10);
end;

{Botao de registro de baixa ***}
{navegacao-}
procedure Tfrm_LancReceb.Limparformulrio1Click(Sender: TObject);
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
  edtNPre.text:='';
  pnCorrigido.caption:='';
  pnMulta.caption:='';
  pnJuros.caption:='';
  Registrarbaixadodocumento1.enabled:=false;
  edtLoja.setfocus;
end;

{Opcao de registro de baixa do documento ***}
procedure Tfrm_LancReceb.Registrarbaixadodocumento1Click(Sender: TObject);
var
  clPrest: TClassPrestContratLote;
  DVcerto: Boolean;
  valor1: Real;
begin
     {CRITICA AOS DADOS DA BAIXA ***}
  valor1 := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
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
  if (Trim(edtValor.text)='') then
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
  end
  else
  if (flagLoja) and (strtofloat(Trim(edtLoja.text))<>strtofloat(Trim(edtCodLoja.text))) then
  begin
    frmDialogo.ExibirMensagem (' A loja da compra não pode ser diferente da loja do recebimento!'
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
      begin
        frm_principal.BarraDicas.caption:='Procurando o número de contrato...';
        frm_principal.refresh;

              {gravando a prestacao no arquivo de lote - inclusive o status ***}
        clPrest := TClassPrestContratLote.Create;
        with (clPrest) do
        begin
          conect   ('CREDITO',self);
          ClearSql;
          AddParam ('Select PC_CLIE,PC_CONT,PC_NPRE                    ');
          AddParam ('From   CREPRABR_LOTE1                             ');
          AddParam ('Where  (PC_CONT='+Trim(edtCodCont.text)+') AND    ');
          AddParam ('       (PC_CLIE='+Trim(edtCodCli.text)+') AND     ');
          AddParam ('       (PC_NPRE='+Trim(edtNPre.text)+')           ');
          ClearFields;

                   {chave primaria - superchave}
          inPC_CONT := strtofloat(Trim(edtCodCont.text));
          inPC_CLIE := strtofloat(Trim(edtCodCli.text));
          inPC_NPRE := strtofloat(Trim(edtNPre.text));

                   {dados gerais}
          inPC_LOJA := loja;
          inPC_VALO := valor;
          inPC_DVTO := vencimento;
          inPC_DCON := datacont;
          inPC_PLAN := plano;
          inPC_AVAL := aval;
          inPC_PORT := port;
          inPC_TPRE := tpre;

                   {dados de baixa}
          inPC_LJPG := strtofloat(Trim(edtLoja.text));
          inPC_VPAG := strtofloat(edtValor.text);
          inPC_DTPG := StrToDate(edtDatPgto.text);
          inPC_STAT := '0'; {o status do registro de lote é que informa}
                                     {a situacao desta baixa nos relatorios ***}
          frm_principal.BarraDicas.caption:='Gravando baixa no arquivo de lote...';
          frm_principal.BarraDicas.refresh;
          if (Execute) then
            UpdateAll
          else
            Insert;
          desconect;
          Free;
        end;
        frm_principal.BarraDicas.caption:='';
        frm_principal.ExibirDica ('Baixa do documento registrada...',5);

              {gravando a impressao no arquivo de log ***}
        if (flagLog) then
          flagLog:=false;

              {exibindo o ultimo documento fornecido para baixa ***}
        Memo1.Lines.Clear;
        Memo1.Lines:=Memo2.Lines;
        Limparformulrio1.click;
      end{Se nao pode baixar ***};
  end;
end;

{formatacao-}
procedure Tfrm_LancReceb.edtValorExit(Sender: TObject);
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

{formatacao-}
procedure Tfrm_LancReceb.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValor);
end;

procedure Tfrm_LancReceb.btnBaixarClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

{Criacao do formulario ***}
procedure Tfrm_LancReceb.FormCreate(Sender: TObject);
begin
     {Pergunta pelo digito --}
  flagLog:=true;
  if (frmDialogo.ExibirMensagem ('Requisitar dígito verificador?',
    'Baixa',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
    250,200)=mrYes) then
    flagDV:=true
  else
    flagDV:=false;

     {Pergunta pela loja recebimento = loja da compra --}
  if (frmDialogo.ExibirMensagem ('Bloquear loja de recebimento diferente da loja da compra?',
    'Baixa',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
    250,200)=mrYes) then
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
end;

procedure Tfrm_LancReceb.btnLimparClick(Sender: TObject);
begin
  Limparformulrio1.click;
end;

procedure Tfrm_LancReceb.edtDatPgtoExit(Sender: TObject);
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

procedure Tfrm_LancReceb.edtDVEnter(Sender: TObject);
begin
  edtDV.selectall;
end;

{Verificando o digito verificador ****--}
procedure Tfrm_LancReceb.edtDVKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_LancReceb.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

{navegacao--->}
procedure Tfrm_LancReceb.edtCodLojaExit(Sender: TObject);
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

end.
