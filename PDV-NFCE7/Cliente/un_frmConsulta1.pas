unit un_frmConsulta1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, StdCtrls, ExtCtrls, Mask, Menus,funcoesglobais;

type
  Tfrm_Consulta1 = class(TForm)
    PageControl1: TPageControl;
    pagina2: TTabSheet;
    pagina1: TTabSheet;
    pagina3: TTabSheet;
    pagina4: TTabSheet;
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    pnCabec: TPanel;
    Memo1: TMemo;
    pn1: TPanel;
    edtCodCli: TMaskEdit;
    btnConsulta: TBitBtn;
    Memo2: TMemo;
    Panel2: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    Panel6: TPanel;
    Label2: TLabel;
    Panel7: TPanel;
    Label3: TLabel;
    Panel8: TPanel;
    Label5: TLabel;
    Panel9: TPanel;
    Label6: TLabel;
    Panel10: TPanel;
    Label7: TLabel;
    Panel11: TPanel;
    Label8: TLabel;
    Panel12: TPanel;
    Label9: TLabel;
    Panel13: TPanel;
    Label12: TLabel;
    Panel14: TPanel;
    Panel15: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Panel16: TPanel;
    Label15: TLabel;
    Panel17: TPanel;
    Label16: TLabel;
    Panel18: TPanel;
    Label17: TLabel;
    Panel19: TPanel;
    Label18: TLabel;
    Panel20: TPanel;
    Label19: TLabel;
    Panel21: TPanel;
    Label20: TLabel;
    Panel22: TPanel;
    Label21: TLabel;
    Panel23: TPanel;
    Label22: TLabel;
    Panel24: TPanel;
    Label23: TLabel;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    pn2: TPanel;
    edtCpf: TMaskEdit;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Desmarcarcliente1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    lbF8Mens: TLabel;
    lbF8: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Panel1: TPanel;
    pnDados1: TPanel;
    Panel27: TPanel;
    Label28: TLabel;
    pnTotCor: TPanel;
    pnTotsemJur: TPanel;
    Label27: TLabel;
    pnHoje: TPanel;
    TimerDia: TTimer;
    btnBaixo1Lin: TSpeedButton;
    btnCima1Lin: TSpeedButton;
    btnPageDown: TSpeedButton;
    btnPageUp: TSpeedButton;
    pnTotab: TPanel;
    Label26: TLabel;
    pnDados2: TPanel;
    pnAlerta: TPanel;
    pagina5: TTabSheet;
    Memo6: TMemo;
    Panel25: TPanel;
    Panel28: TPanel;
    Label31: TLabel;
    Panel29: TPanel;
    Label32: TLabel;
    Panel30: TPanel;
    Label33: TLabel;
    Panel31: TPanel;
    Label34: TLabel;
    Panel32: TPanel;
    Label35: TLabel;
    Panel33: TPanel;
    Label36: TLabel;
    Panel34: TPanel;
    Label37: TLabel;
    Panel35: TPanel;
    Label30: TLabel;
    Panel36: TPanel;
    Panel38: TPanel;
    Label39: TLabel;
    Panel39: TPanel;
    Label40: TLabel;
    Panel40: TPanel;
    Label41: TLabel;
    Panel41: TPanel;
    Label42: TLabel;
    Panel42: TPanel;
    Label43: TLabel;
    Panel43: TPanel;
    Label44: TLabel;
    Panel44: TPanel;
    Label45: TLabel;
    Label38: TLabel;
    btnLanc: TSpeedButton;
    btnBaixa: TSpeedButton;
    pn3: TPanel;
    Bevel1: TBevel;
    pnCli1: TPanel;
    pnCli2: TPanel;
    TimerAlerta: TTimer;
    Panel37: TPanel;
    Label46: TLabel;
    btnDir1lin: TSpeedButton;
    btnEsq1lin: TSpeedButton;
    Auxiliares1: TMenuItem;
    Lancamento1: TMenuItem;
    Baixa1: TMenuItem;
    lbLoja: TLabel;
    btnRenova: TSpeedButton;
    Renovao1: TMenuItem;
    Panel45: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    pnSalario: TPanel;
    pnLimite: TPanel;
    pnDisponiv: TPanel;
    btnProposta: TSpeedButton;
    Proposta1: TMenuItem;
    btn2avia: TSpeedButton;
    N2avia1: TMenuItem;
    Label29: TLabel;
    pnTotab2: TPanel;
    Panel26: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    btnCep: TSpeedButton;
    Label53: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Panel46: TPanel;
    Label59: TLabel;
    btnRenegocia: TSpeedButton;
    Renegocia1: TMenuItem;
    pagina6: TTabSheet;
    Panel47: TPanel;
    Panel48: TPanel;
    lblIdProduto: TLabel;
    Panel49: TPanel;
    Label60: TLabel;
    Panel50: TPanel;
    Label62: TLabel;
    Panel51: TPanel;
    Label63: TLabel;
    Panel52: TPanel;
    Label64: TLabel;
    Panel53: TPanel;
    Label65: TLabel;
    Panel54: TPanel;
    Label66: TLabel;
    Memo7: TMemo;
    pagina7: TTabSheet;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    Memo8: TMemo;
    Panel55: TPanel;
    foto_cliente: TImage;
    pnTel: TPanel;
    edtFone: TMaskEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtCodCliDblClick(Sender: TObject);
    procedure edtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodCliEnter(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtCpfEnter(Sender: TObject);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodCliExit(Sender: TObject);
    procedure TimerDiaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBaixo1LinClick(Sender: TObject);
    procedure btnCima1LinClick(Sender: TObject);
    procedure btnPageDownClick(Sender: TObject);
    procedure btnPageUpClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Memo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLancClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure TimerAlertaTimer(Sender: TObject);
    procedure btnDir1linClick(Sender: TObject);
    procedure btnEsq1linClick(Sender: TObject);
    procedure Lancamento1Click(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure edtCodCliChange(Sender: TObject);
    procedure btnRenovaClick(Sender: TObject);
    procedure Renovao1Click(Sender: TObject);
    procedure edtCpfChange(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure Proposta1Click(Sender: TObject);
    procedure btnPropostaClick(Sender: TObject);
    procedure btn2aviaClick(Sender: TObject);
    procedure N2avia1Click(Sender: TObject);
    procedure btnCepClick(Sender: TObject);
    procedure Memo6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Renegocia1Click(Sender: TObject);
    procedure btnRenegociaClick(Sender: TObject);
    procedure Memo7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure pagina7Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    function BuscaFormasDePagamento(caixa, codigoVenda,
      loja: Real): String;
    function PagouComCrediario(caixa, codigoVenda, loja: Real): Boolean;
  public
    { Public declarations }
    Modo: Integer; {2-> é chamado do cadastro de cliente;  1->é chamado da consulta
                    3-> é chamando do sistema de caixa}
    total_contrato_caixa: String; {de MODO=3 contem o valor do contrato a ser feito}
    total_entrada_caixa: String; {de MODO=3 contem o valor do contrato a ser feito}
    codigo: String; {Código do cliente consultado... - Parametro do formulario}
    loja: Integer; {codigo da loja do cliente *** - Parametro do formulario}
    flag1: Boolean;
    {* variaveis usadas para informar CLIENTE,CONTRATO ao sistema de caixa ***
     valido somente se Modo=3}
    y_codigo_cliente,y_codigo_contrato: Real;

    {var. usadas para movimentacao ***}
    posicao1,posicao2,posicao3,posicao6,posicao7,posicao4: Integer;
    Memo1TotLin,Memo2TotLin,Memo3TotLin,Memo6TotLin,Memo7TotLin,Memo4TotLin: Integer;
    Memo1Espelho,Memo2Espelho,Memo3Espelho,Memo6Espelho,Memo7Espelho,Memo4Espelho: TStringList;
    totalPaginas: Integer;
    ListaContratos_EmAberto: TStringList;
    ListaLojas_EmAberto: TStringList;
    flagExibeObservacao: Boolean;
    motivobloqueio: String;
    ordem_codigo,ordem_refinterna: Integer;
    ordem_reffabric: Integer;
    procedure Memo4_AddLine(linha:String);
    procedure Memo5_AddLine(linha:String);
    procedure LimparEdits;
    function  VerificaDev (codigo,banco,numero: Real; arquivo: String):String;
  end;

var
  frm_Consulta1: Tfrm_Consulta1;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, contratos, cliente, procura, f8Clientes,
  cheques, unEmissCarnet2, unDialogo, credito,
  un_frmConsulta1_Observacao, un_Renegocia, unVersoPropostaCredito,
  unPropostaCredito, auxiliar, mainf, un_Opcoes_2via, unMensagem;

procedure Tfrm_Consulta1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_F7) then
    if (Modo=1) or (Modo=3) then
      if (pn1.visible) then
      begin
        pn1.Visible    := false;
        pn2.Visible    := true;
        pnTel.Visible  := false;
        edtCodCli.Text := '';
        edtCpf.SetFocus;
        Label25.Caption := 'Alterna para Nº do Telefone'
      end
      else if (pn2.visible) then
      begin
        pn1.Visible   := false;
        pn2.Visible   := false;
        pnTel.Visible := true;
        edtCpf.Text := '';
        edtFone.SetFocus;
        Label25.Caption := 'Alterna para Código do Cliente'
      end
      else if (pnTel.visible) then
      begin
        pn1.Visible   := True;
        pn2.Visible   := false;
        pnTel.Visible := false;
        edtFone.Clear;
        edtCodCli.SetFocus;
        Label25.Caption := 'Alterna para CPF/CNPJ'
      end;
     {Para navegacao nas memos ***}
//     IF sELF.ActiveControl = Memo7 Then
//      exit;
  if (key=K_BAIXO)  then
    btnBaixo1Lin.click;
  if (key=K_CIMA)   then
    btnCima1Lin.click;
  if (key=K_PGDOWN) then
    btnPageDown.click;
  if (key=K_PGUP)   then
    btnPageUp.click;
  if (key=K_ESQ) and (not flag1) then
    btnEsq1Lin.click;
  if (key=K_DIR) and (not flag1) then
    btnDir1Lin.click;
  if key = vk_f3 then
    btnlanc.onclick(edtcodcli);
end;

procedure Tfrm_Consulta1.botao_sairClick(Sender: TObject);
begin
  close;
end;

{Configurando a consulta --->}
procedure Tfrm_Consulta1.FormActivate(Sender: TObject);
begin
  PageControl1.ActivePage:=pagina1;
  if (Modo=1) or (Modo=3) then
  begin
    if (frm_principal.x_frente_loja<>0) then
    begin
      frm_Consulta1.loja:=Trunc(frm_principal.x_frente_loja);
      lbLoja.caption := 'Loja: '+form_t(ProcuraNomeLoja(frm_Consulta1.loja,self),15);
    end
    else
      lbLoja.caption :='';
    PageControl1.ActivePage := pagina1;
    if Frm_Principal.codclientecad = '' then
      if (pn1.visible) then
        edtCodCli.setfocus
      else if (pn2.visible) then
        edtCpf.setfocus
      else if (pnTel.visible) then
        edtFone.setfocus;
  end
  else
  if (Modo=2) then
  begin
    lbLoja.caption := '';
    frm_Consulta1.loja:=0;
    pn1.visible:=false;
    btnLanc.visible:=false;
    btnBaixa.visible:=false;
    btnConsulta.visible:=false;
    pn3.visible:=true;
    pn3.caption:='        Código............: '+form_nz(strtofloat(codigo),6);
    flagExibeObservacao := false;
    btnConsulta.click;
  end;
end;

{Opcao principal de execucao da consulta ***}
procedure Tfrm_Consulta1.btnConsultaClick(Sender: TObject);
var
  clCont: TClassContrato;
  clClient: TClassCliente;
  clCheq1,clCheq2: TClassCheque;
  clObs,clCred,clProd,clContr,clAux,clAux2: TClassAuxiliar;
  flagModo,idproduto,cheque,sexo,ldias: String;
  clienteSpc,clienteTpro,clienteFun,linha2,mask,fone: String;
  observacao,flagPrNoSpc,flagChNoSpc,clienteEndDes: String;
  ind,contant: Integer;
  multa,juros,atraso: Real;
  total1,total2,total3,total4: Real;
  totab,totcor,totsemjur: Real;
  tamanho,nascimento,sFormaPgto,flagDev,ecivil,sHora: String;
  data_dadm,data_dtca,data_ultc,cpf,cnpj: String; {cpf: para pesquisa;   cnpj: para exibicao}
  continua: Boolean;
  limite_disponivel: Real;
  implinha:Boolean;
  totGauge,indGauge: Integer;
  contrato,contratoAnt: Real;
begin
 {Escolhendo o cliente ***}
 {Pesquisando por CODIGO ou CNPJ ----->}
  if (Modo=1) or (Modo=3) then
  begin
    if (pn1.visible) then
    begin
      codigo := Trim(edtCodCli.text);
      if (codigo='') then
        continua:=false
      else
      begin
        continua:=true;
        clClient := TClassCliente.Create;
        with (clClient) do
        begin
          conect   ('CREDITO',self);
          ClearSql;
          AddParam ('Select CL_CODI,CL_CPF,CL_LOJA,CL_OBSE  ');
          AddParam ('From   CRECLI                          ');
          AddParam ('Where  (CL_CODI='+codigo+')            ');
          continua:=true;
          if (Execute) then
          begin
            if (Trim(result('CL_CPF'))='') then
              cpf:='?'
            else
            begin
              cpf:=result('CL_CPF');
              CarregaFotoCliente_(Result('CL_CPF'),foto_cliente);
            end;
            observacao:=trim(result('CL_OBSE'));
          end
          else
            cpf:='?';
          desconect;
          Free;
        end;
      end;
    end
    else if (pn2.Visible) then
    begin
      if (Trim(edtCpf.text)<>'') then
      begin
        continua:=true;
        cpf:=Trim(edtCpf.text);
        clClient := TClassCliente.Create;
        with (clClient) do
        begin
          conect   ('CREDITO',self);
          ClearSql;
          AddParam ('Select CL_CODI,CL_CPF,CL_LOJA,CL_OBSE    ');
          AddParam ('From   CRECLI                            ');
          AddParam ('Where  (CL_CPF='+chr(39)+cpf+chr(39)+')  ');
          continua:=true;
          if (Execute) then
          begin
            codigo := floattostr(result('CL_CODI'));
            observacao := trim(result('CL_OBSE'));
            cpf:=result('CL_CPF');
            CarregaFotoCliente_(Result('CL_CPF'),foto_cliente);
          end
          else
            codigo:='-1';
          desconect;
          Free;
        end;
      end
      else
        continua:=false;
    end
    else if (pnTel.visible) then
    begin
      if (Trim(edtFone.text)<>'') then
      begin
        continua:=true;
        fone := Trim(edtFone.text);
        clClient := TClassCliente.Create;
        with (clClient) do
        begin
          conect   ('CREDITO',self);
          ClearSql;
          AddParam ('Select CL_CODI,CL_CPF,CL_LOJA,CL_OBSE,CL_FONE ');
          AddParam ('From   CRECLI                                 ');
          AddParam ('Where  (CL_FONE='+chr(39)+fone+chr(39)+')     ');
          continua:=true;
          if (Execute) then
          begin
            codigo := floattostr(result('CL_CODI'));
            observacao := trim(result('CL_OBSE'));
            if (Trim(result('CL_CPF'))='') then
              cpf:='?'
            else
            begin
              cpf:=result('CL_CPF');
              CarregaFotoCliente_(Result('CL_CPF'),foto_cliente);
            end;
          end
          else
          begin
            ClearSql;
            AddParam ('Select CL_CODI,CL_CPF,CL_LOJA,CL_OBSE,CL_CELU ');
            AddParam ('From   CRECLI                                 ');
            AddParam ('Where  (CL_CELU='+chr(39)+fone+chr(39)+')     ');
            if (Execute) then
            begin
              codigo := floattostr(result('CL_CODI'));
              observacao := trim(result('CL_OBSE'));
              if (Trim(result('CL_CPF'))='') then
                cpf:='?'
              else
              begin
                cpf:=result('CL_CPF');
                CarregaFotoCliente_(Result('CL_CPF'),foto_cliente);
              end;
            end
            else
            begin
              continua := false;
              pnCli1.caption:='<Cliente não encontrado>';
              pnCli2.caption:='';
            end;
          end;
          desconect;
          Free;
        end;
      end
      else
        continua:=false;
    end;
  end
  else
  if (Modo=2) then
    if (codigo<>'') then
      continua:=true
    else
      continua:=false;
  if (continua) then
  begin
    {1o. PASSO - Processamento dos contratos em-aberto ******}
    Memo2Espelho.clear;
    clCont := TClassContrato.Create;
    with (clCont) do
    begin
      totsemjur := 0.00;
      totcor    := 0.00;
      totab     := 0.00;

      conect   ('CREDITO', frm_principal);
      ClearSql;
      AddParam ('Select   CR_LOJA,CR_CODI,CR_DNOT,CR_TOTA,CR_PORT,CR_VENT, ');
      AddParam ('         PC_DVTO,PC_VALO,PC_DTPG,PC_VPAG,PC_NPRE,PC_STAT, ');
      AddParam ('         PC_PORT,CR_PLAN,PC_FPGT,CR_OBSE                  ');
      AddParam ('From     CRECTABR,CREPRABR                                ');
      AddParam ('Where    (CR_CODI=PC_CONT)    AND (CR_CLIE=PC_CLIE) AND   ');
      AddParam ('         (CR_CLIE='+codigo+') AND                         ');
      AddParam ('         (CR_PDEV>0) AND (CR_PDEV<=CR_QPRE)               ');
      AddParam ('Order by CR_DNOT DESC,CR_CODI,PC_NPRE                     ');
      if (not Execute) then
        Memo2Espelho.Add ('Não há contratos em aberto registrados...')
      else
      begin
        clCont.first;
        contant   := 0;
        linha2    := form_tc(' ',31,' ');
        ldias     := '???';
        total1    := 0.00;
        total2    := 0.00;
        total3    := 0.00;
        total4    := 0.00;
        while (not clCont.eof) do
        begin
          {mudanca de contrato ***}
          if (clCont.Result('CR_CODI')<>contant) then
          begin
            if (linha2<>form_tc(' ',31,' ')) then
            begin
              Memo2Espelho.Add (linha2);
              ListaContratos_EmAberto.Add(floattostr(clCont.Result('CR_CODI')));
              ListaLojas_EmAberto.Add(floattostr(clCont.Result('CR_LOJA')));
            end;
            if (contant<>0) then
            begin
              clCont.prior;
              if (trim(clCont.Result('CR_OBSE'))<>'') then
              begin
                Memo2Espelho.Add(' OBS: '+trim(clCont.Result('CR_OBSE')));
                ListaContratos_EmAberto.Add('0');
                ListaLojas_EmAberto.Add('0');
              end;
              clCont.next;
            end;
            if (contant<>0) then
            begin
              Memo2Espelho.Add (form_tc(' ',19,' ')+
                '-----------Totais Devidos>>       '+
                form_nc   (total1,10)+' '+
                form_nc   (total2,10)+' '+
                form_nc   (total3,10)+' '+
                form_nc   (total4,10));
              ListaContratos_EmAberto.Add('0');
              ListaLojas_EmAberto.Add('0');
            end;
            total1   := 0.00;
            total2   := 0.00;
            total3   := 0.00;
            total4   := 0.00;
            contant  := clCont.Result('CR_CODI');

                         {Verificando status das prestacoes--}
            if (clCont.Result('PC_STAT')='0') then
            begin
              if (PrestacaoNoSpc(strtofloat(codigo),
                clCont.Result('CR_CODI'),
                clCont.Result('PC_NPRE'))) then
                flagPrNoSpc:='s'
              else
                flagPrNoSpc:='';
              if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
                atraso := frm_principal.x_data_trabalho - clCont.Result('PC_DVTO')
              else
                atraso := 0;
              totab := totab + clCont.Result ('PC_VALO');
              multa := LerMulta(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
              juros := LerJuros(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
              if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
              begin
                totcor := totcor + (clCont.Result('PC_VALO')+multa+juros);
                totsemjur := totsemjur + (clCont.Result('PC_VALO'));
              end;
              Memo2Espelho.Add(form_tc('-',96,'-'));
              ListaContratos_EmAberto.Add('0');
              ListaLojas_EmAberto.Add('0');
              Memo2Espelho.Add (form_nz   (clCont.Result('CR_LOJA'),2)+'.'+
                form_nz   (contant,6)+' '+
                form_data (clCont.Result('CR_DNOT'))+' '+
                form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'),10)+' '+
                form_nz   (clCont.Result('PC_NPRE'),2)+' '+
                form_data (clCont.Result('PC_DVTO'))+'   '+
                form_n    (atraso,4)+' '+
                form_nc   (clCont.Result('PC_VALO'),10)+' '+
                form_nc   (multa,10)+' '+
                form_nc   (juros,10)+' '+
                form_nc   (multa + juros + clCont.Result('PC_VALO'),10)+
                ''+flagPrNoSpc);
              ListaContratos_EmAberto.Add(floattostr(clCont.Result('CR_CODI')));
              ListaLojas_EmAberto.Add(floattostr(clCont.Result('CR_LOJA')));
            end
            else
            begin
              if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
                ldias:='Em dia'
              else
              if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
                ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),4)+'ant'
              else
                ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),4)+'apo';
              Memo2Espelho.Add(form_tc('-',96,'-'));
              ListaContratos_EmAberto.Add('0');
              ListaLojas_EmAberto.Add('0');
              if (frm_principal.x_requisitar_forma_pgto) then
              begin
                if (clCont.Result('PC_FPGT')<>0) then
                  sFormaPgto := ProcuraNomeFormaPgto(clCont.Result('PC_FPGT'),self)
                else
                  sFormaPgto := '';
              end
              else
                sFormaPgto := '';
              Memo2Espelho.Add (form_nz   (clCont.Result('CR_LOJA'),2)+'.'+
                form_nz   (contant,6)+' '+
                form_data (clCont.Result('CR_DNOT'))+'  '+
                form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'),9)+' '+
                form_nz   (clCont.Result('PC_NPRE'),2)+' '+
                form_data (clCont.Result('PC_DVTO'))+' '+
                form_t    ('Pagou',6)+'  '+
                form_nc   (clCont.Result('PC_VPAG'),9)+' '+
                form_t    ('em '+datetostr(clCont.Result('PC_DTPG')),13)+' '+
                form_t    (ldias,6)+'  '+
                copy(sFormaPgto,1,10));
              ListaContratos_EmAberto.Add(floattostr(clCont.Result('CR_CODI')));
              ListaLojas_EmAberto.Add(floattostr(clCont.Result('CR_LOJA')));
            end;
            linha2  := form_nz (Result('CR_PLAN'),3)+' -'+
              form_t  (ProcuraTipoPlano(Result('CR_PLAN'),
              frm_principal),10)+' Entr.'+
              form_nc (clCont.Result('CR_VENT'),10);
          end
          else
          if (clCont.Result('PC_STAT')='0') then
          begin
            if (PrestacaoNoSpc(strtofloat(codigo),
              clCont.Result('CR_CODI'),
              clCont.Result('PC_NPRE'))) then
              flagPrNoSpc:='s'
            else
              flagPrNoSpc:='';
            if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
              atraso := frm_principal.x_data_trabalho - clCont.Result('PC_DVTO')
            else
              atraso := 0;
            totab := totab + clCont.Result ('PC_VALO');
            multa := LerMulta(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
            juros := LerJuros(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
            if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
            begin
              totcor := totcor + (clCont.Result('PC_VALO')+multa+juros);
              totsemjur := totsemjur + (clCont.Result('PC_VALO'));
            end;
            Memo2Espelho.Add (linha2+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+'   '+
              form_n    (atraso,4)+' '+
              form_nc   (clCont.Result('PC_VALO'),10)+' '+
              form_nc   (multa,10)+' '+
              form_nc   (juros,10)+' '+
              form_nc   (multa + juros + clCont.Result('PC_VALO'),10)+
              ''+flagPrNoSpc);
            ListaContratos_EmAberto.Add(floattostr(clCont.Result('CR_CODI')));
            ListaLojas_EmAberto.Add(floattostr(clCont.Result('CR_LOJA')));
            if (linha2<>form_tc(' ',31,' ')) then
              linha2 := form_tc(' ',31,' ');
          end
          else
          begin
            if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
              ldias:='Em dia'
            else
            if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
              ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),4)+'ant'
            else
              ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),4)+'apo';
            if (frm_principal.x_requisitar_forma_pgto) then
            begin
              if (clCont.Result('PC_FPGT')<>0) then
                sFormaPgto := ProcuraNomeFormaPgto(clCont.Result('PC_FPGT'),self)
              else
                sFormaPgto := '';
            end
            else
              sFormaPgto := '';
            Memo2Espelho.Add (linha2+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+' '+
              form_t    ('Pagou',6)+'  '+
              form_nc   (clCont.Result('PC_VPAG'),9)+' '+
              form_t    ('em '+datetostr(clCont.Result('PC_DTPG')),13)+' '+
              form_t    (ldias,6)+'  '+
              copy(sFormaPgto,1,10));
            ListaContratos_EmAberto.Add(floattostr(clCont.Result('CR_CODI')));
            ListaLojas_EmAberto.Add(floattostr(clCont.Result('CR_LOJA')));
            if (linha2<>form_tc(' ',31,' ')) then
              linha2 := form_tc(' ',31,' ');
          end{impressao das outras prestacoes ***};
          if (clCont.Result('PC_STAT')='0') then
          begin
            total1    := total1 + clCont.Result('PC_VALO');
            total2    := total2 + multa;
            total3    := total3 + juros;
            total4    := total4 + (clCont.Result('PC_VALO')+multa+juros);
          end;
          clCont.next;
        end;
        if (linha2<>form_tc(' ',31,' ')) then
        begin
          Memo2Espelho.Add (linha2);
          ListaContratos_EmAberto.Add(floattostr(clCont.Result('CR_CODI')));
          ListaLojas_EmAberto.Add(floattostr(clCont.Result('CR_LOJA')));
        end;
        if (trim(clCont.Result('CR_OBSE'))<>'') then
        begin
          Memo2Espelho.Add(' OBS: '+trim(clCont.Result('CR_OBSE')));
          ListaContratos_EmAberto.Add('0');
          ListaLojas_EmAberto.Add('0');
        end;
        Memo2Espelho.Add (form_tc(' ',19,' ')+
          '-----------Totais Devidos>>       '+
          form_nc   (total1,10)+' '+
          form_nc   (total2,10)+' '+
          form_nc   (total3,10)+' '+
          form_nc   (total4,10));
        ListaContratos_EmAberto.Add('0');
        ListaLojas_EmAberto.Add('0');
      end;
      desconect;
      Free;

      pnTotab.caption     := form_nc (totab,10);
      pnTotab2.caption    := form_nc (totab,10);
      pnTotsemjur.caption := form_nc(totsemjur,10);
      pnTotcor.caption    := form_nc(totcor,10);
    end;
     {Preenchendo o memo2 -->}
    memo2.lines.clear;
    posicao2 := 0;
    ind      := 0;
    while ((ind<Memo2TotLin) and (ind<memo2Espelho.count)) do
    begin
      memo2.lines.add (memo2Espelho[ind]);
      ind := ind + 1;
    end;

     {2o. PASSO - Processamento dos contratos liquidados ******}
    Memo1Espelho.clear;
    clCont := TClassContrato.Create;
    with (clCont) do
    begin
      conect ('CREDITO', frm_principal);
      ClearSql;
      AddParam ('Select   CR_LOJA,CR_CODI,CR_DNOT,CR_TOTA,CR_PORT,CR_VENT, ');
      AddParam ('         PC_DVTO,PC_VALO,PC_DTPG,PC_VPAG,PC_NPRE,PC_PORT, ');
      AddParam ('         CR_PLAN,CR_PORT,PC_NUME,PC_BANC,CR_OBSE,PC_FPGT, ');
      AddParam ('         PC_HORA                                          ');
      AddParam ('From     CRECTABR,CREPRABR                                ');
      AddParam ('Where    (CR_CODI=PC_CONT)    AND (CR_CLIE=PC_CLIE) AND   ');
      AddParam ('         (CR_CLIE='+codigo+') AND (CR_PDEV=0)             ');
      AddParam ('Order By CR_DNOT,CR_CODI,PC_NPRE                          ');
      if (not Execute) then
        Memo1Espelho.Add ('Não há contratos liquidados registrados...')
      else
      begin
        contant := 0;
        linha2  := form_tc(' ',30,' ');
        ldias   := '???';
        while (not clCont.eof) do
        begin
          if (Trim(clCont.Result('PC_HORA'))<>'') then
            sHora := form_t(clCont.Result('PC_HORA'),5)
          else
            sHora := '        ';
                    {mudanca de contrato ***}
          if (clCont.Result('CR_CODI')<>contant) then
          begin
            if (linha2<>form_tc(' ',30,' ')) then
              Memo1Espelho.Add (linha2);
            if (contant<>0) then
            begin
              clCont.prior;
              if (trim(clCont.Result('CR_OBSE'))<>'') then
                Memo1Espelho.Add(' OBS: '+trim(clCont.Result('CR_OBSE')));
              clCont.next;
            end;
            contant  := clCont.Result('CR_CODI');
            Memo1Espelho.Add (form_tc('-',98,'-'));
            if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
              ldias:='Em dia'
            else
            if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
              ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),4)+'ant'
            else
              ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),4)+'apo';
            if (clCont.Result('PC_NUME')<>0) then
              cheque:=floattostr(clCont.Result('PC_BANC'))+'/'+
                form_n   (clCont.Result('PC_NUME'),7)
            else
              cheque:='';
            if (frm_principal.x_requisitar_forma_pgto) then
            begin
              if (clCont.Result('PC_FPGT')<>0) then
                sFormaPgto := ProcuraNomeFormaPgto(clCont.Result('PC_FPGT'),self)
              else
                sFormaPgto := cheque;
            end
            else
              sFormaPgto := cheque;
            Memo1Espelho.Add (form_nz   (clCont.Result('CR_LOJA'),2)+'.'+
              form_nz   (contant,6)+' '+
              form_data (clCont.Result('CR_DNOT'))+' '+
              form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'),9)+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+' '+
              sHora+' '+
              form_nc   (clCont.Result('PC_VALO'),8)+' '+
              form_nc   (clCont.Result('PC_VPAG'),8)+' '+
              form_data (clCont.Result('PC_DTPG'))+' '+
              form_t    (ldias,6)+'  '+
              copy(sFormaPgto,1,10));
            linha2  := form_nz (Result('CR_PLAN'),4)+'-'+
              form_t  (ProcuraTipoPlano(Result('CR_PLAN'),
              frm_principal),9)+' Entr.'+
              form_nc (clCont.Result('CR_VENT'),10);

          end
          else
          begin
            {impressao das outras prestacoes ***}
            if (clCont.Result('PC_NUME')<>0) then
              cheque:=floattostr(clCont.Result('PC_BANC'))+'/'+
                form_n   (clCont.Result('PC_NUME'),7)
            else
              cheque:='';
            if (frm_principal.x_requisitar_forma_pgto) then
            begin
              if (clCont.Result('PC_FPGT')<>0) then
                sFormaPgto := ProcuraNomeFormaPgto(clCont.Result('PC_FPGT'),self)
              else
                sFormaPgto := cheque;
            end
            else
              sFormaPgto := cheque;
            if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
              ldias:='Em dia'
            else
            if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
              ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),4)+'ant'
            else
              ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),4)+'apo';
            Memo1Espelho.Add (linha2+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+' '+
              sHora+' '+
              form_nc   (clCont.Result('PC_VALO'),8)+' '+
              form_nc   (clCont.Result('PC_VPAG'),8)+' '+
              form_data (clCont.Result('PC_DTPG'))+' '+
              form_t    (ldias,6)+'  '+
              copy(sFormaPgto,1,10));
            if (linha2<>form_tc(' ',30,' ')) then
              linha2 := form_tc(' ',30,' ');
          end;
          clCont.next;
        end;
        if (Trim(linha2)<>'') then
          Memo1Espelho.Add (linha2);
        if (trim(clCont.Result('CR_OBSE'))<>'') then
          Memo1Espelho.Add(' OBS: '+trim(clCont.Result('CR_OBSE')));
      end;
      desconect;
      Free;
    end;
     {Preenchendo o memo1 -->}
    memo1.lines.clear;
    posicao1 := 0;
    ind      := 0;
    while ((ind<Memo1TotLin) and (ind<memo1Espelho.count)) do
    begin
      memo1.lines.add (memo1Espelho[ind]);
      ind := ind + 1;
    end;

     {3o. PASSO - Listar cheques pré-datados do cliente ******}
    Memo3.lines.Clear;
    Memo3Espelho.Clear;
    clCheq1 := TClassCheque.Create;
    with (clCheq1) do
    begin
      Memo3Espelho.Add ('');
      Memo3Espelho.Add ('Cheques pré-datados em aberto ');
      Memo3Espelho.Add (form_tc('-',80,'-'));
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CH_BANC,CH_NUME,CH_LOJA,CH_PORT,         ');
      AddParam ('       CH_DVTO,CH_VALO,CH_AGEN,CH_CLIE,CH_CCGC, ');
      AddParam ('       CH_FONE,CH_NOME,CH_OBS                   ');
      AddParam ('From   CRECHMOV                                 ');
      AddParam ('Where ((CH_CLIE='+codigo+') OR                  ');
      AddParam ('      (CH_CCGC='+chr(39)+cpf+chr(39)+'))        ');
      AddParam ('Order by CH_DVTO                                ');
      if (not Execute) then
        Memo3Espelho.Add ('Não há cheques em aberto registrados...')
      else
      begin
        first;
        while (not eof) do
        begin
          flagDev:=VerificaDev (result('CH_CLIE'),result('CH_BANC'),result('CH_NUME')
            ,'CRECHDEV');
          Memo3Espelho.Add (
            form_n    (result('CH_BANC'),6)  +'   '+
            form_n    (result('CH_NUME'),10) +'     '+
            form_t    (result('CH_AGEN'),10) +' '+
            form_nz   (result('CH_LOJA'),2)  +'    '+
            form_nz   (result('CH_PORT'),4)  +'  '+
            form_data (result('CH_DVTO'))    +' '+
            '           '+
            form_nc   (result('CH_VALO'),10) +'  '+
            form_t    (flagDev,3));
          if (Trim(result('CH_OBS'))<>'') then
            Memo3Espelho.Add (
              form_t    ('OBS: '+result('CH_OBS'),60));
          next;
        end;
        if (codigo='-1') then
        begin
          pnCli1.caption := result('CH_NOME');
          pnCli2.caption := 'Fone: '+result('CH_FONE');
          codigo:='-11';
        end;
      end;
      Memo3Espelho.Add ('');
      Memo3Espelho.Add ('Cheques pré-datados compensados ');
      Memo3Espelho.Add (form_tc('-',80,'-'));
      ClearSql;
      AddParam ('Select CH_BANC,CH_NUME,CH_LOJA,CH_PORT,CH_DTPG,  ');
      AddParam ('       CH_DVTO,CH_VALO,CH_AGEN,CH_CLIE,CH_OBS,   ');
      AddParam ('       CH_NOME,CH_FONE                           ');
      AddParam ('From   CRECHMVPG                                 ');
      AddParam ('Where (CH_CLIE='+codigo+') OR                    ');
      AddParam ('      (CH_CCGC='+chr(39)+cpf+chr(39)+')          ');
      AddParam ('Order by CH_DVTO                                 ');
      if (not Execute) then
      begin
        Memo3Espelho.Add ('Não há cheques compensados...');
        Memo3Espelho.Add ('');
      end
      else
      begin
        first;
        while (not eof) do
        begin
          flagDev:=VerificaDev (result('CH_CLIE'),result('CH_BANC'),result('CH_NUME')
            ,'CRECHDVPG');
          Memo3Espelho.Add (
            form_n    (result('CH_BANC'),6)  +'   '+
            form_n    (result('CH_NUME'),10)  +'     '+
            form_t    (result('CH_AGEN'),10) +' '+
            form_nz   (result('CH_LOJA'),2)  +'    '+
            form_nz   (result('CH_PORT'),4)  +'  '+
            form_data (result('CH_DVTO'))    +' '+
            form_data (result('CH_DTPG'))    +' '+
            form_nc   (result('CH_VALO'),10) +'  '+
            form_t    (flagDev,3));
          if (Trim(result('CH_OBS'))<>'') then
            Memo3Espelho.Add (
              form_t    ('OBS: '+result('CH_OBS'),60));
          next;
        end;
        if (codigo='-1') then
        begin
          pnCli1.caption := result('CH_NOME');
          pnCli2.caption := 'Fone: '+result('CH_FONE');
          codigo:='-11';
        end;
      end;
      desconect;
      Free;
    end;
     {Preenchendo o memo3 -->}
    memo3.lines.clear;
    posicao3 := 0;
    ind      := 0;
    while ((ind<Memo3TotLin) and (ind<memo3Espelho.count)) do
    begin
      memo3.lines.add (memo3Espelho[ind]);
      ind := ind + 1;
    end;

     {4o. PASSO - Listar cheques devolvidos do cliente ******}
    Memo6.lines.Clear;
    Memo6Espelho.Clear;
    clCheq1 := TClassCheque.Create;
    with (clCheq1) do
    begin
      Memo6Espelho.Add ('');
      Memo6Espelho.Add ('Cheques devolvidos ');
      Memo6Espelho.Add (form_tc('-',80,'-'));
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CH_BANC,CH_NUME,CH_LOJA,CH_PORT,  ');
      AddParam ('       CH_DVTO,CH_VALO,CH_AGEN,CH_CLIE,  ');
      AddParam ('       CH_ALIN,CH_OBS,CH_NOME,CH_FONE,   ');
      AddParam ('       CH_CCGC                           ');
      AddParam ('From   CRECHDEV                          ');
      AddParam ('Where (CH_CLIE='+codigo+')  OR           ');
      AddParam ('      (CH_CCGC='+chr(39)+cpf+chr(39)+')  ');
      AddParam ('Order by CH_DVTO                         ');
      if (not Execute) then
        Memo6Espelho.Add ('Não há cheques devolvidos registrados...')
      else
      begin
        first;
        while (not eof) do
        begin
          if (ChequeNoSpc(Result('CH_CCGC'),
            Result('CH_BANC'),
            Result('CH_NUME'))) then
            flagChNoSpc:='s'
          else
            flagChNoSpc:='';
          Memo6Espelho.Add (
            form_n    (result('CH_BANC'),6)  +'  '+
            form_t    (result('CH_AGEN'),10) +'  '+
            form_n    (result('CH_NUME'),10) +'    '+
            form_nz   (result('CH_LOJA'),2)  +'    '+
            form_nz   (result('CH_PORT'),4)  +'    '+
            form_data (result('CH_DVTO'))    +'   '+
            form_nc   (result('CH_VALO'),10) +'      '+
            form_t    (result('CH_ALIN'),4)  +'               '+
            flagChNoSpc);
          if (Trim(result('CH_OBS'))<>'') then
            Memo6Espelho.Add (
              form_t    ('OBS: '+result('CH_OBS'),60));
          next;
        end;
        if (codigo='-1') then
        begin
          pnCli1.caption := result('CH_NOME');
          pnCli2.caption := 'Fone: '+result('CH_FONE');
          codigo:='-11';
        end;
      end;
      Memo6Espelho.Add ('');
      Memo6Espelho.Add ('Cheques devolvidos compensados ');
      Memo6Espelho.Add (form_tc('-',80,'-'));
      ClearSql;
      AddParam ('Select CH_BANC,CH_NUME,CH_LOJA,CH_PORT, ');
      AddParam ('       CH_DVTO,CH_VALO,CH_AGEN,CH_CLIE, ');
      AddParam ('       CH_ALIN,CH_OBS,CH_NOME,CH_FONE,  ');
      AddParam ('       CH_CCGC                          ');
      AddParam ('From   CRECHDVPG                        ');
      AddParam ('Where (CH_CLIE='+codigo+')  OR          ');
      AddParam ('      (CH_CCGC='+chr(39)+cpf+chr(39)+') ');
      AddParam ('Order by CH_DVTO                        ');
      if (not Execute) then
      begin
        Memo6Espelho.Add ('Não há cheques devolvidos compensados...');
        Memo6Espelho.Add ('');
      end
      else
      begin
        first;
        while (not eof) do
        begin
          if (ChequeNoSpc(Result('CH_CCGC'),
            Result('CH_BANC'),
            Result('CH_NUME'))) then
            flagChNoSpc:='s'
          else
            flagChNoSpc:='';
          Memo6Espelho.Add (
            form_n    (result('CH_BANC'),6)  +'  '+
            form_t    (result('CH_AGEN'),10) +'  '+
            form_n    (result('CH_NUME'),10)  +'    '+
            form_nz   (result('CH_LOJA'),2)  +'    '+
            form_nz   (result('CH_PORT'),4)  +'    '+
            form_data (result('CH_DVTO'))    +'   '+
            form_nc   (result('CH_VALO'),10) +'      '+
            form_t    (result('CH_ALIN'),4)  +'               '+
            flagChNoSpc);
          if (Trim(result('CH_OBS'))<>'') then
            Memo6Espelho.Add (
              form_t    ('OBS: '+result('CH_OBS'),60));
          next;
        end;
        if (codigo='-1') then
        begin
          pnCli1.caption := result('CH_NOME');
          pnCli2.caption := 'Fone: '+result('CH_FONE');
          codigo:='-11';
        end;
      end;
      desconect;
      Free;
    end;
     {Preenchendo o memo6 -->}
    posicao6 := 0;
    memo6.lines.clear;
    ind      := 0;
    while ((ind<Memo6TotLin) and (ind<memo6Espelho.count)) do
    begin
      memo6.lines.add (memo6Espelho[ind]);
      ind := ind + 1;
    end;

     {5o. PASSO - Listar dados gerais do cliente ******}
    if (codigo<>'-11') then
    begin
      pnCli1.caption:='<Cliente não encontrado>';
      pnCli2.caption:='';
    end;
    Memo4.lines.clear;
    Memo4Espelho.Clear;
    posicao4 := 0;
    clClient := TClassCliente.Create;
    with (clClient) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CL_CODI,CL_CPF ,CL_NOME,CL_DTNA,CL_CEP,CL_ENDE, CL_BAIR, ');
      AddParam ('       CL_CIDA,CL_ESTA,CL_FONE,CL_CELU,CL_FAX ,CL_EMAI,CL_IDEN, ');
      AddParam ('       CL_OEXP,CL_ECIV,CL_CONJ,CL_NPAI,CL_NMAE,CL_EMPR,CL_REF1, ');
      AddParam ('       CL_REF2,CL_SALA,CL_CPRO,CL_TRF1,CL_TRF2,CL_EEMP,CL_FEMP, ');
      AddParam ('       CL_CARG,CL_LIMC,CL_OBSE,CL_DADM,CL_VALI,CL_RSPC,CL_TPRO, ');
      AddParam ('       CL_CFUN,CL_ULTC,CL_QTDC,CL_DTCA,CL_PDC,CL_SEXO ,CL_REMP, ');
      AddParam ('       CL_DSPC,CL_ALTE                                          ');
      AddParam ('From   CRECLI                                                   ');
      AddParam ('Where (CL_CODI='+codigo+')                                      ');
      if (not Execute) then
      begin
               {DEFINICAO DO ALERTA SUPERIOR DA CONSULTA...}
        TimerAlerta.enabled:=false;
        pnAlerta.color:=clInfoBk;
        pnAlerta.font.color:=clBlack;
        pnAlerta.caption:='Cliente sem ficha';
      end
      else
      begin
                {Formatando CPF/CNPJ ***}
        cnpj := DevolveCpfFormatado(result('CL_CPF'));
        if (Length(cnpj)=11) then
        begin
          cnpj := ExibeCpf (cnpj);
          pnCli1.caption := ' '+form_nz(strtofloat(codigo),6)+
            '-'+Trim(result('CL_NOME'))+'  Cpf: '+cnpj+
            '  RG: '+result('CL_IDEN');
          if (result('CL_DTNA')<>strtodate('01/01/1900')) then
            nascimento := form_data (result('CL_DTNA'))
          else
            nascimento := 'EM BRANCO ';
          pnCli2.caption := ' '+Trim(result('CL_ENDE'))+' - '+Trim(result('CL_BAIR'))+
            '  Nasc..: '+nascimento;
        end
        else
        begin
          cnpj := ExibeCgc (cnpj);
          pnCli1.caption := ' '+form_nz(strtofloat(codigo),6)+
            '-'+Trim(result('CL_NOME'))+'  CNPJ: '+cnpj;
          pnCli2.caption := ' '+Trim(result('CL_ENDE'))+' - '+Trim(result('CL_BAIR'));
        end;

                {Dados salariais}
        pnSalario.caption  := form_nc(result('CL_SALA'),10);
        pnLimite.caption   := form_nc(result('CL_LIMC'),10);
        limite_disponivel  := InformaLimiteCredito(result('CL_CODI'));
        if (limite_disponivel>=0.00) then
        begin
          pnDisponiv.caption := form_nc(limite_disponivel,10);
          pnDisponiv.color   := clBlue;
        end
        else
        begin
          if (Pos('-',form_nc(limite_disponivel,9))>0) then
            pnDisponiv.caption := form_nc(limite_disponivel,9)
          else
            pnDisponiv.caption := '-'+form_nc(limite_disponivel,9);
          pnDisponiv.color   := clRed;
        end;
        if (pn1.visible) then
          edtCpf.text:=result('CL_CPF')
        else
          edtCodCli.text:=form_nz(strtofloat(codigo),6);
        if (result('CL_SEXO')='M') then
          sexo:='Masculino'
        else
          sexo:='Feminino';
        if (result('CL_ECIV')='0') then
          ecivil:='SOLTEIRO'
        else
        if (result('CL_ECIV')='1') then
          ecivil:='CASADO'
        else
        if (result('CL_ECIV')='2') then
          ecivil:='SEPARADO'
        else
        if (result('CL_ECIV')='3') then
          ecivil:='VIUVO'
        else
        if (result('CL_ECIV')='4') then
          ecivil:='OUTROS...';

                {Dados gerais ***}
        Memo4Espelho.Add ('');
        Memo4Espelho.Add (' Código..........: '+form_nz(result('CL_CODI'),6));
        Memo4Espelho.Add (' Validade........: '+form_data(result('CL_VALI')));
        Memo4Espelho.Add (' Nome completo...: '+form_t(result('CL_NOME'),40)+
          '    Sexo..: '+sexo);
        Memo4Espelho.Add (' Bairro..........: '+Trim(result('CL_BAIR'))+
          '  Cidade/UF.: '+Trim(result('CL_CIDA'))+'/'+form_t(result('CL_ESTA'),2)+
          '    Cep.: '+form_t(result('CL_CEP'),10));
        Memo4Espelho.Add (' Telefone........: '+form_t(result('CL_FONE'),15)+
          '    Celular...: '+form_t(result('CL_CELU'),15)+
          '    Fax.......: '+form_t(result('CL_FAX'),15));
        Memo4Espelho.Add (' Identidade......: '+form_t(result('CL_IDEN'),25)+
          '    Orgão emissor...: '+form_t(result('CL_OEXP'),20));
        Memo4Espelho.Add (' Estado civil....: '+ecivil+' Conjuge.........: '+form_t(result('CL_CONJ'),40));
        Memo4Espelho.Add (' Nome do pai.....: '+form_t(result('CL_NPAI'),40));
        Memo4Espelho.Add (' Nome da mãe.....: '+form_t(result('CL_NMAE'),32));
        Memo4Espelho.Add (form_tc('-',97,'-'));

        Memo4Espelho.Add (' Empresa/Trabalho: '+form_t(result('CL_EMPR'),30));
        if (result('CL_DADM')=strtodate('01/01/1900')) then
          data_dadm:=form_tc2(' ',10,' ')
        else
          data_dadm:=form_data(result('CL_DADM'));
        Memo4Espelho.Add (' Cargo ocupado...: '+form_t(result('CL_CARG'),20)+
          '    Data de admissão: '+data_dadm);
        Memo4Espelho.Add (' Endereço........: '+form_t(result('CL_EEMP'),50));
        Memo4Espelho.Add (' Telefone........: '+form_t(result('CL_FEMP'),15)+
          '    Ramal....: '+form_t(result('CL_REMP'),5));
        Memo4Espelho.Add (' Referência 01...: '+form_t(result('CL_REF1'),40)+
          '    Telefone...: '+form_t(result('CL_TRF1'),15));
        Memo4Espelho.Add (' Referência 02...: '+form_t(result('CL_REF2'),40)+
          '    Telefone...: '+form_t(result('CL_TRF2'),15));
        Memo4Espelho.Add (' Observação......: '+form_t(result('CL_OBSE'),50));

                {... - Formatando as datas para a correta exibicao}
        if (result('CL_DTCA')=strtodate('01/01/1900')) then
          data_dtca:=form_tc2(' ',10,' ')
        else
          data_dtca:=form_data(result('CL_DTCA'));
        if (result('CL_ULTC')=strtodate('01/01/1900')) then
          data_ultc:=form_tc2(' ',10,' ')
        else
          data_ultc:=form_data(result('CL_ULTC'));
        Memo4Espelho.Add (' Data de cadastro: '+data_dtca+
          '    PDC..: '+form_t(result('CL_PDC'),4));
        if (result('CL_QTDC')=0) and (Trim(data_ultc)='') then
        begin
          Memo4Espelho.Add (' Última compra...: [SEM COMPRAS ATÉ O MOMENTO]');
          pnDados1.caption:=' Data de cadastro: '+data_dtca+
            '    Última compra..: [SEM COMPRAS ATÉ O MOMENTO]';
        end
        else
        begin
          Memo4Espelho.Add (' Última compra...: '+data_ultc+
            '    Qtde. compras..: '+form_nz(result('CL_QTDC'),5));
          pnDados1.caption:=' Data de cadastro: '+data_dtca+
            '    Última compra..: '+data_ultc+
            '   Qtde. compras..: '+form_nz(result('CL_QTDC'),5);
        end;
     {Preenchendo o memo6 -->}
        posicao4 := 0;
        memo4.lines.clear;
        ind      := 0;
        while ((ind<Memo4TotLin) and (ind<memo4Espelho.count)) do
        begin
          memo4.lines.add (memo4Espelho[ind]);
          ind := ind + 1;
        end;



        Memo5.lines.clear;
                {*** - Verificando com veracidade as informacoes de SPC}
                {E ainda, marcando o cliente vinculado}
        if (ClienteNoSpc(strtofloat(codigo))) then
          clienteSpc:='SIM'
        else
          clienteSpc:='NÃO';
        if (result('CL_CFUN')='S') then
          clienteFun:='SIM'
        else
          clienteFun:='NÃO';
        if (result('CL_TPRO')='S') then
          clienteTpro:='SIM'
        else
          clienteTpro:='NÃO';
        if (result('CL_ALTE')='1') then
          clienteEndDes:='SIM'
        else
          clienteEndDes:='NÃO';
        Memo5_AddLine ('Cliente no SPC...: '+clienteSpc+
          '    Cheque sem fundo..: '+clienteFun+
          '    Título protestado.: '+clienteTPro+
          '    End.Desat..: '+clienteEndDes);

                {DEFINICAO DO ALERTA SUPERIOR DA CONSULTA**********************}
                {SEGUINDO A PRECEDENCIA DA INFORMACAO -------------------------}
        clienteFun:='NÃO';
        motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(result('CL_CODI'));
        if (motivobloqueio<>'-1') then
        begin
          TimerAlerta.enabled:=true;
          pnAlerta.color:=clRed;
          pnAlerta.caption:='Cliente bloqueado';
        end
        else
        if (result('CL_PDC')='1C') and (frm_principal.x_bloqueio_cartao) then {1o}
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

                {...}
        pnDados2.caption:=' Cliente no SPC...: '+clienteSpc+
          '    Cheque sem fundo..: '+clienteFun+
          '    Título protestado.: '+clienteTPro;

                {...}
        if (clienteSpc='SIM') or (clienteFun='SIM') or (clienteTpro='SIM') then
        begin
          Memo5.font.color:=clWhite;
          Memo5.color:=clRed;
          pnDados2.font.color:=clWhite;
          pnDados2.color:=clRed;
        end
        else
        begin
          Memo5.font.color:=clInfoBk;
          Memo5.color:=clTeal;
          pnDados2.font.color:=clInfoBk;
          pnDados2.color:=clTeal;
        end;

                {***************************************************************}
        if (flagExibeObservacao) then
          if (motivobloqueio<>'-1') then
          begin
            Application.CreateForm(Tfrm_consulta1_observacao,frm_consulta1_observacao);
            frm_consulta1_observacao.lblObs.caption := '>>>> CLIENTE BLOQUEADO ';
            frm_consulta1_observacao.memo1.lines.clear;
            frm_consulta1_observacao.memo1.lines.add('Motivo: ');
            frm_consulta1_observacao.memo1.lines.add(motivobloqueio);
            frm_consulta1_observacao.Height      := 180;
            frm_consulta1_observacao.btnOk.Top   := 100;
            frm_consulta1_observacao.Color       := clRed;
            frm_consulta1_observacao.Memo1.Color := clRed;
            frm_consulta1_observacao.ShowModal; {*}
            frm_consulta1_observacao.color       := clNavy;
            frm_consulta1_observacao.Memo1.Color := clNavy;
            frm_consulta1_observacao.Free;
          end
          else
          if (observacao<>'') then
          begin
            Application.CreateForm(Tfrm_consulta1_observacao,frm_consulta1_observacao);
            frm_consulta1_observacao.lblObs.caption := '>>>> '+observacao;
                             {...}
            clObs := TClassAuxiliar.Create;
            clObs.conect   ('CREDITO',self);
            clObs.ClearSql;
            clObs.AddParam ('SELECT OB_CLIE,OB_LIN1,OB_LIN2,OB_LIN3,OB_LIN4,OB_LIN5 ');
            clObs.AddParam ('FROM   CRECLI_OBS                                      ');
            clObs.AddParam ('WHERE  (OB_CLIE=:cliente)                              ');
            clObs.consulta.parambyname('cliente').AsFloat := strtofloat(codigo);
            if (clObs.Execute) then
            begin
              if (trim(clObs.Result('OB_LIN1'))='.') then
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
                frm_consulta1_observacao.memo1.lines.add(clObs.Result('OB_LIN1'));
                frm_consulta1_observacao.memo1.lines.add(clObs.Result('OB_LIN2'));
                frm_consulta1_observacao.memo1.lines.add(clObs.Result('OB_LIN3'));
                frm_consulta1_observacao.memo1.lines.add(clObs.Result('OB_LIN4'));
                frm_consulta1_observacao.memo1.lines.add(clObs.Result('OB_LIN5'));
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
            clObs.desconect;
            clObs.Free;
                             {...}
            frm_consulta1_observacao.showmodal;
            frm_consulta1_observacao.Free;
          end;
                {***************************************************************}
      end;
      desconect;
      Free;
    end;

     {7o. PASSO - Exibicao dos produtos com seus respectivos CONTRATOS ******}
    Memo7Espelho.clear;
    Memo7Espelho.Add('');
    if (databaseprodutos='ESTOQUE') or (databaseprodutos='VENDAS') then {*}
    begin
      clCred := TClassAuxiliar.Create;
      clCred.Conect('CREDITO',self);
      clCred.ClearSql;
      clCred.AddParam('SELECT CL_CPF,CL_CODI FROM CRECLI ');
      clCred.AddParam('WHERE (CL_CODI=:codigo)           ');
      clCred.consulta.ParamByName('codigo').AsFloat := StrToFloat(codigo);
      if (clCred.Execute) then
      begin
        clAux := TClassAuxiliar.Create;
        clAux.Conect(DataBaseProdutos,self);
        clAux.consulta.SQL.Clear;
        clAux.consulta.SQL.Add('SELECT VE.VE_CAIX,VE.VE_LOJA,VE.VE_CODI,VE.VE_DATA,VE.VE_TOTA,      ');
        clAux.consulta.SQL.Add('       VE.VE_CUPO,CAST(COALESCE(CR.CR_CONT,0) as FLOAT) as CONTRATO ');
        clAux.consulta.SQL.Add('FROM ITENS_VENDAS IV                                                ');
        clAux.consulta.SQL.Add('INNER JOIN VENDAS VE ON (IV.IV_VEND=VE.VE_CODI) AND                 ');
        clAux.consulta.SQL.Add('                        (IV.IV_LOJA=VE.VE_LOJA) AND                 ');
        clAux.consulta.SQL.Add('                        (IV.IV_CAIX=VE.VE_CAIX)                     ');
        clAux.consulta.SQL.Add('LEFT JOIN CREDIARIOS CR ON (IV.IV_VEND=CR.CR_VEND) AND              ');
        clAux.consulta.SQL.Add('                           (IV.IV_CAIX=CR.CR_CAIX) AND              ');
        clAux.consulta.SQL.Add('                           (IV.IV_LOJA=CR.CR_LOJA)                  ');
        if (Trim(clCred.Result('CL_CPF')) <> '') then
        begin
          clAux.consulta.SQL.Add('WHERE (VE.VE_CPF='+QuotedStr(clCred.Result('CL_CPF'))+' OR        ');
          clAux.consulta.SQL.Add('       CR.CR_CLIE='+QuotedStr(clCred.Result('CL_CODI'))+') AND    ');
        end
        else
          clAux.consulta.SQL.Add('WHERE (CR.CR_CLIE='+QuotedStr(clCred.Result('CL_CODI'))+') AND    ');
        clAux.consulta.SQL.Add('      (VE_STAT<>'+QuotedStr('2')+')                                 ');
        clAux.consulta.SQL.Add('GROUP BY VE.VE_CAIX,VE.VE_LOJA,VE.VE_CODI,VE.VE_DATA,VE.VE_TOTA,    ');
        clAux.consulta.SQL.Add('         VE.VE_CUPO,CR.CR_CONT                                      ');
        clAux.consulta.SQL.Add('ORDER BY VE.VE_DATA,VE.VE_CODI,VE.VE_CUPO                           ');
        clAux.consulta.Open;
        if (not clAux.consulta.IsEmpty) then
        begin
          clAux.First;
          totGauge := clAux.RecCount;
          indGauge := 0;
          frm_mensagem.pn_mensagem.Font.Size := 12;
          mostra_mensagem ('Carregando histórico de compras do cliente! Aguarde...');
          frm_mensagem.painel.Visible  := true;
          frm_mensagem.gauge1.Progress := 0;
          contrato    := clAux.Result('CONTRATO');
          contratoAnt := 0;
          while (not clAux.Eof) do
          begin
            if (PagouComCrediario(clAux.Result('VE_CAIX'),clAux.Result('VE_CODI'),clAux.Result('VE_LOJA'))) then
            begin
              if (clAux.Result('CONTRATO') <> 0) then
              begin
                if (contratoAnt <> contrato) then
                begin
                  clContr := TClassAuxiliar.Create;
                  clContr.Conect('CREDITO',self);
                  clContr.ClearSql;
                  clContr.AddParam('SELECT CR_DNOT,CR_TOTA,CR_QPRE,CR_PLAN  ');
                  clContr.AddParam('FROM   CRECTABR                         ');
                  clContr.AddParam('WHERE (CR_CLIE=:cliente) AND            ');
                  clContr.AddParam('      (CR_CODI=:contrato)               ');
                  clContr.consulta.parambyname('cliente').AsFloat  := StrToFloat(codigo);
                  clContr.consulta.parambyname('contrato').AsFloat := clAux.Result('CONTRATO');
                  if (clContr.Execute) then
                    Memo7Espelho.Add (' Contrato: ['+form_nz   (clAux.Result('CONTRATO'),6)   +
                                      '  Data: '    +form_data (clContr.result('CR_DNOT'))    +
                                      '   Total: '  +form_nc   (clContr.result('CR_TOTA'),10) +
                                      '  Q.Prest.: '+form_n    (clContr.result('CR_QPRE'),2)  +
                                      '   - '+form_t(ProcuraTipoPlano(clContr.result('CR_PLAN'),self),9)+']')
                  else
                    Memo7Espelho.Add ('Contrato: [NAO ENCONTRADO!!!!]');
                  clContr.Desconect;
                  clContr.Free;
                end;

                clAux2 := TClassAuxiliar.Create;
                clAux2.Conect(DataBaseProdutos,self);
                clAux2.consulta.SQL.Clear;
                clAux2.consulta.SQL.Add('SELECT PR.PR_REFI,PR.PR_REFF,PR.PR_FORN,ES.ES_GRUP,   ');
                clAux2.consulta.SQL.Add('       ES.ES_SUBG,ES.ES_PROD,ES.ES_DESC,IV.IV_CORE,   ');
                clAux2.consulta.SQL.Add('       ES.ES_TAMA,IV.IV_QTDE,IV.IV_TOTA               ');
                clAux2.consulta.SQL.Add('FROM ITENS_VENDAS IV                                  ');
                clAux2.consulta.SQL.Add('LEFT JOIN ESTOQUE ES ON (IV.IV_GRUP=ES.ES_GRUP) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_SUBG=ES.ES_SUBG) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_PROD=ES.ES_PROD) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_CORE=ES.ES_CORE) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_TAMA=ES.ES_TAMA)       ');
                clAux2.consulta.SQL.Add('LEFT JOIN PRODUTOS PR ON (IV.IV_GRUP=PR.PR_GRUP) AND  ');
                clAux2.consulta.SQL.Add('                         (IV.IV_SUBG=PR.PR_SUBG) AND  ');
                clAux2.consulta.SQL.Add('                         (IV.IV_PROD=PR.PR_CODI)      ');
                clAux2.consulta.SQL.Add('WHERE (IV.IV_CAIX=:caixa) AND (IV.IV_VEND=:venda) AND ');
                clAux2.consulta.SQL.Add('      (IV.IV_LOJA=:loja)                              ');
                clAux2.consulta.ParamByName('caixa').AsFloat := clAux.Result('VE_CAIX');
                clAux2.consulta.ParamByName('venda').AsFloat := clAux.Result('VE_CODI');
                clAux2.consulta.ParamByName('loja').AsFloat  := clAux.Result('VE_LOJA');
                clAux2.consulta.Open;
                if (not clAux2.consulta.IsEmpty) then
                begin
                  clAux2.First;
                  while (not clAux2.Eof) do
                  begin
                    if (ordem_codigo=1) then
                      idproduto := form_nz(clAux2.result('ES_GRUP'),2)+form_nz(clAux2.result('ES_SUBG'),2)+form_nz(clAux2.result('ES_PROD'),4)
                    else
                    if (ordem_refinterna=1) then
                      idproduto := form_t(clAux2.result('PR_REFI'),12)
                    else
                    if (ordem_reffabric=1) then
                      idproduto := form_nz(clAux2.result('PR_FORN'),6)+'/'+form_t(clAux2.result('PR_REFF'),12);

                    Memo7Espelho.Add ('    '+idproduto                                            +' '+
                                      form_t  (clAux2.result('ES_DESC'),40)                       +' '+
                                      form_t  (ProcuraAbrevCor(clAux2.result('IV_CORE'),self),10) +' '+
                                      form_t  (clAux2.result('ES_TAMA'),5)                        +' '+
                                      form_n  (clAux2.result('IV_QTDE'),5)                        +' '+
                                      form_nc (clAux2.result('IV_TOTA'),10)                       +' V');
                    clAux2.Next;
                  end;
                end;
                clAux2.Desconect;
                clAux2.Free;
              end
              else
              begin
                Memo7Espelho.Add ('Contrato: [NAO ENCONTRADO!!!!]');
                clAux2 := TClassAuxiliar.Create;
                clAux2.Conect(DataBaseProdutos,self);
                clAux2.consulta.SQL.Clear;
                clAux2.consulta.SQL.Add('SELECT PR.PR_REFI,PR.PR_REFF,PR.PR_FORN,ES.ES_GRUP,   ');
                clAux2.consulta.SQL.Add('       ES.ES_SUBG,ES.ES_PROD,ES.ES_DESC,IV.IV_CORE,   ');
                clAux2.consulta.SQL.Add('       ES.ES_TAMA,IV.IV_QTDE,IV.IV_TOTA               ');
                clAux2.consulta.SQL.Add('FROM ITENS_VENDAS IV                                  ');
                clAux2.consulta.SQL.Add('LEFT JOIN ESTOQUE ES ON (IV.IV_GRUP=ES.ES_GRUP) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_SUBG=ES.ES_SUBG) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_PROD=ES.ES_PROD) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_CORE=ES.ES_CORE) AND   ');
                clAux2.consulta.SQL.Add('                        (IV.IV_TAMA=ES.ES_TAMA)       ');
                clAux2.consulta.SQL.Add('LEFT JOIN PRODUTOS PR ON (IV.IV_GRUP=PR.PR_GRUP) AND  ');
                clAux2.consulta.SQL.Add('                         (IV.IV_SUBG=PR.PR_SUBG) AND  ');
                clAux2.consulta.SQL.Add('                         (IV.IV_PROD=PR.PR_CODI)      ');
                clAux2.consulta.SQL.Add('WHERE (IV.IV_CAIX=:caixa) AND (IV.IV_VEND=:venda) AND ');
                clAux2.consulta.SQL.Add('      (IV.IV_LOJA=:loja)                              ');
                clAux2.consulta.ParamByName('caixa').AsFloat := clAux.Result('VE_CAIX');
                clAux2.consulta.ParamByName('venda').AsFloat := clAux.Result('VE_CODI');
                clAux2.consulta.ParamByName('loja').AsFloat  := clAux.Result('VE_LOJA');
                clAux2.consulta.Open;
                if (not clAux2.consulta.IsEmpty) then
                begin
                  clAux2.First;
                  while (not clAux2.Eof) do
                  begin
                    if (ordem_codigo=1) then
                      idproduto := form_nz(clAux2.result('ES_GRUP'),2)+form_nz(clAux2.result('ES_SUBG'),2)+form_nz(clAux2.result('ES_PROD'),4)
                    else
                    if (ordem_refinterna=1) then
                      idproduto := form_t(clAux2.result('PR_REFI'),12)
                    else
                    if (ordem_reffabric=1) then
                      idproduto := form_nz(clAux2.result('PR_FORN'),6)+'/'+form_t(clAux2.result('PR_REFF'),12);

                    Memo7Espelho.Add ('    '+idproduto                                            +' '+
                                      form_t  (clAux2.result('ES_DESC'),40)                       +' '+
                                      form_t  (ProcuraAbrevCor(clAux2.result('IV_CORE'),self),10) +' '+
                                      form_t  (clAux2.result('ES_TAMA'),5)                        +' '+
                                      form_n  (clAux2.result('IV_QTDE'),5)                        +' '+
                                      form_nc (clAux2.result('IV_TOTA'),10)                       +' V');
                    clAux2.Next;
                  end;
                end;
                clAux2.Desconect;
                clAux2.Free;
              end;
            end
            else
            begin
              Memo7Espelho.Add (' [Venda: '+form_nz   (clAux.Result('VE_CODI'),10)    +
                                '  Data: '    +form_data (clAux.result('VE_DATA'))    +
                                '   Total: '  +form_nc   (clAux.result('VE_TOTA'),10) +
                                '  Forma Pag.: '+BuscaFormasDePagamento(clAux.Result('VE_CAIX'),clAux.Result('VE_CODI'),clAux.Result('VE_LOJA'))+']');

              clAux2 := TClassAuxiliar.Create;
              clAux2.Conect(DataBaseProdutos,self);
              clAux2.consulta.SQL.Clear;
              clAux2.consulta.SQL.Add('SELECT PR.PR_REFI,PR.PR_REFF,PR.PR_FORN,ES.ES_GRUP,   ');
              clAux2.consulta.SQL.Add('       ES.ES_SUBG,ES.ES_PROD,ES.ES_DESC,IV.IV_CORE,   ');
              clAux2.consulta.SQL.Add('       ES.ES_TAMA,IV.IV_QTDE,IV.IV_TOTA               ');
              clAux2.consulta.SQL.Add('FROM ITENS_VENDAS IV                                  ');
              clAux2.consulta.SQL.Add('LEFT JOIN ESTOQUE ES ON (IV.IV_GRUP=ES.ES_GRUP) AND   ');
              clAux2.consulta.SQL.Add('                        (IV.IV_SUBG=ES.ES_SUBG) AND   ');
              clAux2.consulta.SQL.Add('                        (IV.IV_PROD=ES.ES_PROD) AND   ');
              clAux2.consulta.SQL.Add('                        (IV.IV_CORE=ES.ES_CORE) AND   ');
              clAux2.consulta.SQL.Add('                        (IV.IV_TAMA=ES.ES_TAMA)       ');
              clAux2.consulta.SQL.Add('LEFT JOIN PRODUTOS PR ON (IV.IV_GRUP=PR.PR_GRUP) AND  ');
              clAux2.consulta.SQL.Add('                         (IV.IV_SUBG=PR.PR_SUBG) AND  ');
              clAux2.consulta.SQL.Add('                         (IV.IV_PROD=PR.PR_CODI)      ');
              clAux2.consulta.SQL.Add('WHERE (IV.IV_CAIX=:caixa) AND (IV.IV_VEND=:venda) AND ');
              clAux2.consulta.SQL.Add('      (IV.IV_LOJA=:loja)                              ');
              clAux2.consulta.ParamByName('caixa').AsFloat := clAux.Result('VE_CAIX');
              clAux2.consulta.ParamByName('venda').AsFloat := clAux.Result('VE_CODI');
              clAux2.consulta.ParamByName('loja').AsFloat  := clAux.Result('VE_LOJA');
              clAux2.consulta.Open;
              if (not clAux2.consulta.IsEmpty) then
              begin
                clAux2.First;
                while (not clAux2.Eof) do
                begin
                  if (ordem_codigo=1) then
                    idproduto := form_nz(clAux2.result('ES_GRUP'),2)+form_nz(clAux2.result('ES_SUBG'),2)+form_nz(clAux2.result('ES_PROD'),4)
                  else
                  if (ordem_refinterna=1) then
                    idproduto := form_t(clAux2.result('PR_REFI'),12)
                  else
                  if (ordem_reffabric=1) then
                    idproduto := form_nz(clAux2.result('PR_FORN'),6)+'/'+form_t(clAux2.result('PR_REFF'),12);

                  Memo7Espelho.Add ('    '+idproduto                                            +' '+
                                    form_t  (clAux2.result('ES_DESC'),40)                       +' '+
                                    form_t  (ProcuraAbrevCor(clAux2.result('IV_CORE'),self),10) +' '+
                                    form_t  (clAux2.result('ES_TAMA'),5)                        +' '+
                                    form_n  (clAux2.result('IV_QTDE'),5)                        +' '+
                                    form_nc (clAux2.result('IV_TOTA'),10)                       +' V');
                  clAux2.Next;
                end;
              end;
              clAux2.Desconect;
              clAux2.Free;
            end;
            clAux.Next;
            indGauge := indGauge + 1;
            frm_mensagem.gauge1.Progress := Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.Refresh;
            Application.ProcessMessages;
            contratoAnt := contrato;
            contrato    := clAux.Result('CONTRATO');
            if (contratoAnt <> contrato) then
              Memo7Espelho.Add (form_tc('-',97,'-'));
          end;
        end
        else
          Memo7Espelho.Add ('[Não há vendas vinculadas a este cliente.]');
        frm_mensagem.pn_mensagem.Font.Size := 18;
        esconde_mensagem;

        clAux.Desconect;
        clAux.Free;
      end
      else
        Memo7Espelho.Add ('[Não há vendas vinculadas a este cliente.]');
    end
    else
      Memo7Espelho.Add ('[Sem acesso aos dados do ESTOQUE]');

















    {if (databaseprodutos=databaseprodutos)  then
    begin
      clCred := TClassAuxiliar.Create;
      with (clCred) do
      begin
        conect   (databaseprodutos, frm_principal);
        ClearSql;
        AddParam ('Select   VE_LOJA,VE_CAIX,VE_CODI,CR_CODI,Ve_Stat          ');
        AddParam ('From     CREDIARIOS,VENDAS                                ');
        AddParam ('Where    (CR_LOJA=VE_LOJA) AND (CR_CAIX=VE_CAIX) AND      ');
        AddParam ('         (CR_VEND=VE_CODI) AND                            ');
        AddParam ('         (CR_CLIE=:cliente) AND                           ');
//              AddParam ('         (VE_TIPZ=:tipz)   AND                            ');
        AddParam ('         (VE_STAT <> ''2'')                               ');

        AddParam ('Order By VE_DATA DESC,CR_CODI DESC                        ');
        consulta.parambyname('cliente').AsFloat := strtofloat(codigo);
//              consulta.parambyname('tipz').AsString   := '1'; //somente 'OFICIAL'
        if (not Execute) then
          Memo7Espelho.Add ('Não há crediários registrados pelo sistema de VENDAS...')
        else
        begin
          first;
          while (not eof) do
          begin
            if (result('CR_CODI')<>0) then
            begin
                             //contrato...
              clContr := TClassAuxiliar.Create;
              clContr.conect   ('CREDITO',self);
              clContr.ClearSql;
              clContr.AddParam ('SELECT CR_DNOT,CR_TOTA,CR_QPRE,CR_PLAN  ');
              clContr.AddParam ('FROM   CRECTABR                         ');
              clContr.AddParam ('WHERE (CR_CLIE=:cliente) AND            ');
              clContr.AddParam ('      (CR_CODI=:contrato)               ');
              clContr.consulta.parambyname('cliente').AsFloat  := strtofloat(codigo);
              clContr.consulta.parambyname('contrato').AsFloat := result('CR_CODI');
              if (clContr.Execute) then
                Memo7Espelho.Add (' Contrato: ['+form_nz   (result('CR_CODI'),6)  +
                  '  Data: '    +form_data (clContr.result('CR_DNOT'))    +
                  '   Total: '   +form_nc   (clContr.result('CR_TOTA'),10) +
                  '  Q.Prest.: '+form_n    (clContr.result('CR_QPRE'),2)+
                  '   - '+form_t(ProcuraTipoPlano(clContr.result('CR_PLAN'),self),9)+']')
              else
              if clcred.result('VE_STAT') <> '2' then
                Memo7Espelho.Add (iifs(clcred.result('VE_STAT') <> 2,' Contrato: [ Não Encontrado!!!]',' Contrato: ['+form_nz(result('CR_CODI'),6)+' com a Venda Cancelada!!! ]'));
              implinha := clcred.result('VE_STAT') <> '2';

              clContr.desconect;
              clContr.Free;
            end
            else
              Memo7Espelho.Add (' Contrato: [NAO INFORMADO NO SISTEMA DE ESTOQUE!!!!]');

                        //produtos...
            clProd := TClassAuxiliar.Create;
            clProd.conect   (databaseprodutos,self);
            clProd.ClearSql;
            clProd.AddParam ('SELECT IV_GRUP,IV_SUBG,IV_PROD,IV_CORE,IV_TAMA,IV_PVEN,IV_QTDE,IV_MODO,       ');
            clProd.AddParam ('       PR_DESC,PR_REFI,PR_GRUP,PR_SUBG,PR_CODI,PR_FORN,PR_REFF                ');
            clProd.AddParam ('FROM   ITENS_VENDAS');
            clProd.AddParam ('Left Join Produtos on ((IV_GRUP=PR_GRUP) AND (IV_SUBG=PR_SUBG) AND (IV_PROD=PR_CODI))');
            clProd.AddParam ('Left Join Vendas on (Ve_Loja = Iv_Loja and Iv_Caix = Ve_Caix and  Ve_Codi = Iv_Vend)');
            clProd.AddParam ('WHERE (IV_LOJA=:loja) AND (IV_CAIX=:terminal) AND (IV_VEND=:codigovenda) And Ve_Stat <> 2 ');
            clProd.consulta.parambyname('loja').AsFloat        := result('VE_LOJA');
            clProd.consulta.parambyname('terminal').AsFloat    := result('VE_CAIX');
            clProd.consulta.parambyname('codigovenda').AsFloat := result('VE_CODI');
            clProd.Execute;
            clProd.first;
            while (not clProd.eof) do
            begin
              if (ordem_codigo=1) then
                idproduto := form_nz(clProd.result('PR_GRUP'),2)+form_nz(clProd.result('PR_SUBG'),2)+form_nz(clProd.result('PR_CODI'),4)
              else
              if (ordem_refinterna=1) then
                idproduto := form_t(clProd.result('PR_REFI'),12)
              else
              if (ordem_reffabric=1) then
                idproduto := form_nz(clProd.result('PR_FORN'),6)+'/'+form_t(clProd.result('PR_REFF'),12);
              if (clProd.result('IV_MODO')=0) then
                flagModo := 'V'
              else
              if (clProd.result('IV_MODO')=1) then
                flagModo := 'D'
              else
              if (clProd.result('IV_MODO')=2) then
                flagModo := 'T';
              if (clProd.result('IV_TAMA')='0') then
                tamanho := 'UNICO'
              else
                tamanho := clProd.result('IV_TAMA');

              Memo7Espelho.Add ('    '+idproduto                          +' '+
                form_t  (clProd.result('PR_DESC'),40) +' '+
                form_t  (ProcuraAbrevCor(clProd.result('IV_CORE'),self),14) +' '+
                form_t  (tamanho,5)  +' '+
                form_n  (clProd.result('IV_QTDE'),5)  +' '+
                form_nc (clProd.result('IV_QTDE')*clProd.result('IV_PVEN'),8)+' '+
                flagModo);

              clProd.next;
            end;
            if implinha then
              Memo7Espelho.Add (form_tc('-',97,'-'));
            clProd.desconect;
            clProd.Free;
            next;
          end;
        end;
        desconect;
        Free;
      end;
    end
    else
      Memo7Espelho.Add ('[Sem acesso aos dados do ESTOQUE]');}
    {Preenchendo o memo1 -->}
    memo7.lines.clear;
    posicao1 := 0;
    ind      := 0;
    while ((ind<Memo7TotLin) and (ind<memo7Espelho.count)) do
    begin
      memo7.lines.add (memo7Espelho[ind]);
      ind := ind + 1;
    end;

    if (codigo='-11') then
    begin
      if (pnCli1.caption<>'<Cliente não encontrado>') then
      begin
        PageControl1.ActivePageIndex:=2;
        if Frm_Principal.codclientecad = ''then
          Memo3.setfocus
        else
          Self.ActiveControl := Memo3;
      end
      else
      begin
        PageControl1.ActivePageIndex:=0;
        if Frm_Principal.codclientecad = ''then
          Memo2.setfocus
        else
          Self.ActiveControl := Memo2;
      end;
    end
    else
    begin
      PageControl1.ActivePageIndex:=0;
      if Frm_Principal.codclientecad = ''then
        Memo2.setfocus
      else
        Self.ActiveControl := Memo2;
    end;
    if (not frm_principal.x_cli_sem_foto) and (foto_cliente.Picture.Graphic = nil) and (modo=3) then
    begin
      frmDialogo.ExibirMensagem ('Não é possível realizar a venda para clientes sem fotos! Por favor insira a foto do cliente! '
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      PageControl1.ActivePage := pagina7;
    end;
  end;
  flag1:=false;
end;

procedure Tfrm_Consulta1.Memo4_AddLine(linha:String);
begin
  Memo4.lines.Add(linha);
end;

procedure Tfrm_Consulta1.Memo5_AddLine(linha:String);
begin
  Memo5.lines.Add(linha);
end;


procedure Tfrm_Consulta1.edtCodCliDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    edit:=edtCodCli;
    showmodal;
  end;
end;

procedure Tfrm_Consulta1.edtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    if (PageControl1.activepageindex=0) then
      Memo2.setfocus
    else
    if (PageControl1.activepageindex=1) then
      Memo1.setfocus
    else
    if (PageControl1.activepageindex=2) then
      Memo3.setfocus
    else
    if (PageControl1.activepageindex=3) then
      Memo6.setfocus
    else
    if (PageControl1.activepageindex=4) then
      Memo7.setfocus
    else
    if (PageControl1.activepageindex=5) then
      Memo4.setfocus;
  if (key=K_ENTER) then
  begin
    flagExibeObservacao := true;
    btnConsulta.click;
  end;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtCodCli;
      showmodal;
    end;
end;

procedure Tfrm_Consulta1.edtCodCliEnter(Sender: TObject);
begin
  flagExibeObservacao := true;
  flag1:=true;
  TMaskEdit(Sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='Consultar clientes cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_Consulta1.Limparformulrio1Click(Sender: TObject);
begin
  edtCodCli.text:='';
  edtCpf.text:='';
  motivobloqueio:='';
  LimparEdits;
  if (pn1.visible) then
    edtCodCli.setfocus
  else if (pn1.visible) then
    edtCpf.setfocus
  else if (pnTel.visible) then
    edtFone.setfocus;
  pnCli1.caption:='';
  pnCli2.caption:='';
  pnDados1.caption:='';
  pnDados2.caption:='';
  pnDados2.color  :=clInfoBk;
  pnAlerta.caption:='';
  pnAlerta.color  :=clBlue;
end;

procedure Tfrm_Consulta1.edtCpfEnter(Sender: TObject);
begin
  flag1:=true;
  flagExibeObservacao := true;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Consulta1.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
  begin
    flagExibeObservacao := true;
    btnConsulta.click;
  end;
  if (key=K_F2) then
    if (PageControl1.activepageindex=0) then
      Memo2.setfocus
    else
    if (PageControl1.activepageindex=1) then
      Memo1.setfocus
    else
    if (PageControl1.activepageindex=2) then
      Memo3.setfocus
    else
    if (PageControl1.activepageindex=3) then
      Memo6.setfocus
    else
    if (PageControl1.activepageindex=4) then
      Memo7.setfocus
    else
    if (PageControl1.activepageindex=5) then
      Memo4.setfocus;
end;

procedure Tfrm_Consulta1.edtCodCliExit(Sender: TObject);
begin
  flag1:=false;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  if (Trim(edtCodCli.text)<>'') then
    edtCodCli.text:=form_nz(strtofloat(Trim(edtCodCli.text)),6);
end;

procedure Tfrm_Consulta1.TimerDiaTimer(Sender: TObject);
var
  dia: String;
begin
  dia := FormatDateTime('dddd',frm_principal.x_data_trabalho);
  dia := UpperCase(Copy(dia,1,1))+Copy(dia,2,Length(dia)-1);
  pnHoje.caption := dia + FormatDateTime(', dd "de" mmmm "de" yyyy',frm_principal.x_data_trabalho);
end;

procedure Tfrm_Consulta1.FormCreate(Sender: TObject);
var
  clConf: TClassAuxiliar;
begin
  if (databaseprodutos=databaseprodutos) then
  begin
    clConf := TClassAuxiliar.Create;
    clConf.conect   (databaseprodutos,self);
    clConf.ClearSql;
    clConf.AddParam ('SELECT ORDEM_CODIGO,ORDEM_REFINTERNA,ORDEM_REFFABRIC FROM CONF ');
    try
      clConf.Execute;
      ordem_codigo     := clConf.Result('ORDEM_CODIGO');
      ordem_refinterna := clConf.Result('ORDEM_REFINTERNA');
      ordem_reffabric  := clConf.Result('ORDEM_REFFABRIC');
      if (ordem_codigo=1) then
        lblIdProduto.caption := 'Codigos'
      else
      if (ordem_refinterna=1) then
        lblIdProduto.caption := 'Ref.Interna'
      else
      if (ordem_reffabric=1) then
        lblIdProduto.caption := 'Forn/R.Fabric.';
    except
      lblIdProduto.caption := 'Codigos';
    end;
    clConf.desconect;
    clConf.Free;
  end;
  total_contrato_caixa := '';
  total_entrada_caixa  := '';   
  if (frm_principal.x_permite_renegociacao_pela_consulta) then
    btnRenegocia.visible:=true
  else
    btnRenegocia.visible:=false;
  flagExibeObservacao := true;
  y_codigo_cliente  := -1;
  y_codigo_contrato := -1;
  if (frm_principal.x_pesquisa_cep) then
    btnCep.visible:=true
  else
    btnCep.visible:=false;
  Memo2Espelho := TStringList.Create;
  Memo1Espelho := TStringList.Create;
  Memo3Espelho := TStringList.Create;
  Memo6Espelho := TStringList.Create;
  Memo7Espelho := TStringList.Create;
  Memo4Espelho := TStringList.Create;
  ListaContratos_EmAberto := TStringList.Create;
  ListaLojas_EmAberto := TStringList.Create;
  Memo2TotLin:=16;
  Memo1TotLin:=19;
  Memo3TotLin:=19;
  Memo6TotLin:=19;
  Memo7TotLin:=19;
  Memo4TotLin:=19;
  totalPaginas:=PageControl1.PageCount;
  LimparEdits;
  TimerDia.enabled:=true;
end;

procedure Tfrm_Consulta1.FormDestroy(Sender: TObject);
begin
  TimerDia.enabled:=false;
  TimerAlerta.enabled:=false;
  Memo2Espelho.Free;
  Memo1Espelho.Free;
  Memo3Espelho.Free;
  Memo6Espelho.Free;
  Memo7Espelho.Free;
  Memo4Espelho.Free;
  ListaContratos_EmAberto.Free;
  ListaLojas_EmAberto.Free;
end;

procedure Tfrm_Consulta1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TimerDia.enabled:=false;
end;

procedure Tfrm_Consulta1.LimparEdits;
begin
  flag1:=false;
  Memo1.lines.clear;
  Memo2.lines.clear;
  Memo3.lines.clear;
  Memo4.lines.clear;
  Memo5.lines.clear;
  Memo5.color:=clTeal;
  Memo6.lines.clear;
  Memo7.lines.clear;
  pnCli1.caption:='';
  pnCli2.caption:='';
  pnTotab.caption:='0,00';
  pnTotab2.caption:='0,00';
  pnTotcor.caption:='0,00';
  pnTotsemjur.caption:='0,00';
  codigo:='';
  pnDisponiv.caption:='0,00';
  pnDisponiv.color:=clBlue;
  pnSalario.caption:='0,00';
  pnLimite.caption:='0,00';
end;

{Botao de baixar uma linha ***}
procedure Tfrm_Consulta1.btnBaixo1LinClick(Sender: TObject);
var
  memoPrin: TMemo;
  memoEspelho: TStringList;
  totalLinha,ind: Integer;
  cont: Integer;
begin
     {Escolha da pagina ***}
  memoEspelho := TStringList.Create;
  if (PageControl1.ActivePageIndex=0) then
  begin
    memoPrin := memo2;
    memoEspelho.AddStrings(memo2Espelho);
    totalLinha := Memo2TotLin;
    ind := posicao2;
  end
  else
  if (PageControl1.ActivePageIndex=1) then
  begin
    memoPrin := memo1;
    memoEspelho.AddStrings(memo1Espelho);
    totalLinha := Memo1TotLin;
    ind := posicao1;
  end
  else
  if (PageControl1.ActivePageIndex=2) then
  begin
    memoPrin := memo3;
    memoEspelho.AddStrings(memo3Espelho);
    totalLinha := Memo3TotLin;
    ind := posicao3;
  end
  else
  if (PageControl1.ActivePageIndex=3) then
  begin
    memoPrin := memo6;
    memoEspelho.AddStrings(memo6Espelho);
    totalLinha := Memo6TotLin;
    ind := posicao6;
  end
  else
  if (PageControl1.ActivePageIndex=4) then
  begin
    memoPrin := memo7;
    memoEspelho.AddStrings(memo7Espelho);
    totalLinha := Memo7TotLin;
    ind := posicao7;
  end
  else
  if (PageControl1.ActivePageIndex=5) then
  begin
    memoPrin := memo4;
    memoEspelho.AddStrings(memo4Espelho);
    totalLinha := Memo4TotLin;
    ind := posicao4;
  end;



     {...}
  if (PageControl1.ActivePageIndex<>totalPaginas-1) then
    if (memoEspelho.count>totalLinha) then
      if (ind<(memoEspelho.count-totalLinha+1)) then
      begin
        memoPrin.lines.clear;
        cont := 1;
        while (cont<>totalLinha) do
        begin
          memoPrin.lines.add (memoEspelho[ind+1]);
          ind  := ind  + 1;
          cont := cont + 1;
        end;
        if (PageControl1.ActivePageIndex=0) then
          posicao2 := posicao2 + 1;
        if (PageControl1.ActivePageIndex=1) then
          posicao1 := posicao1 + 1;
        if (PageControl1.ActivePageIndex=2) then
          posicao3 := posicao3 + 1;
        if (PageControl1.ActivePageIndex=3) then
          posicao6 := posicao6 + 1;
        if (PageControl1.ActivePageIndex=4) then
          posicao7 := posicao7 + 1;
        if (PageControl1.ActivePageIndex=5) then
          posicao4 := posicao4 + 1;
      end;
  memoEspelho.Free;
end;

{Botao de subir uma linha ***}
procedure Tfrm_Consulta1.btnCima1LinClick(Sender: TObject);
var
  memoPrin: TMemo;
  memoEspelho: TStringList;
  totalLinha,ind: Integer;
  cont: Integer;
begin
     {Escolha da pagina ***}
  memoEspelho := TStringList.Create;
  if (PageControl1.ActivePageIndex=0) then
  begin
    memoPrin := memo2;
    memoEspelho.AddStrings(memo2Espelho);
    totalLinha := Memo2TotLin;
    ind := posicao2 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=1) then
  begin
    memoPrin := memo1;
    memoEspelho.AddStrings(memo1Espelho);
    totalLinha := Memo1TotLin;
    ind := posicao1 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=2) then
  begin
    memoPrin := memo3;
    memoEspelho.AddStrings(memo3Espelho);
    totalLinha := Memo3TotLin;
    ind := posicao3 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=3) then
  begin
    memoPrin := memo6;
    memoEspelho.AddStrings(memo6Espelho);
    totalLinha := Memo6TotLin;
    ind := posicao6 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=4) then
  begin
    memoPrin := memo7;
    memoEspelho.AddStrings(memo7Espelho);
    totalLinha := Memo7TotLin;
    ind := posicao7 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=5) then
  begin
    memoPrin := memo4;
    memoEspelho.AddStrings(memo4Espelho);
    totalLinha := Memo4TotLin;
    ind := posicao4 - 1;
  end;

     {...}
  if (PageControl1.ActivePageIndex<>totalPaginas-1) then
    if (ind>=0) then
    begin
      memoPrin.lines.clear;
      cont := 1;
      while (cont<>totalLinha) do
      begin
        memoPrin.lines.add (memoEspelho[ind]);
        ind  := ind  + 1;
        cont := cont + 1;
      end;
      if (PageControl1.ActivePageIndex=0) then
        posicao2 := posicao2 - 1;
      if (PageControl1.ActivePageIndex=1) then
        posicao1 := posicao1 - 1;
      if (PageControl1.ActivePageIndex=2) then
        posicao3 := posicao3 - 1;
      if (PageControl1.ActivePageIndex=2) then
        posicao6 := posicao6 - 1;
    end;
  memoEspelho.Free;
end;

{Opcao de baixar uma pagina completa para baixo ***}
procedure Tfrm_Consulta1.btnPageDownClick(Sender: TObject);
var
  memoPrin: TMemo;
  memoEspelho: TStringList;
  totalLinha,ind: Integer;
  cont: Integer;
  posicao: Integer;
begin
     {Escolha da pagina ***}
  memoEspelho := TStringList.Create;
  if (PageControl1.ActivePageIndex=0) then
  begin
    memoPrin := memo2;
    memoEspelho.AddStrings(memo2Espelho);
    totalLinha := Memo2TotLin;
    ind := posicao2 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=1) then
  begin
    memoPrin := memo1;
    memoEspelho.AddStrings(memo1Espelho);
    totalLinha := Memo1TotLin;
    ind := posicao1 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=2) then
  begin
    memoPrin := memo3;
    memoEspelho.AddStrings(memo3Espelho);
    totalLinha := Memo3TotLin;
    ind := posicao3 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=3) then
  begin
    memoPrin := memo6;
    memoEspelho.AddStrings(memo6Espelho);
    totalLinha := Memo6TotLin;
    ind := posicao6 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=4) then
  begin
    memoPrin := memo7;
    memoEspelho.AddStrings(memo7Espelho);
    totalLinha := Memo7TotLin;
    ind := posicao7 - 1;
  end
  else
  if (PageControl1.ActivePageIndex=5) then
  begin
    memoPrin := memo4;
    memoEspelho.AddStrings(memo4Espelho);
    totalLinha := Memo4TotLin;
    ind := posicao4 - 1;
  end;

     {...}
  if (PageControl1.ActivePageIndex<>totalPaginas-1) then
    if (memoEspelho.count>totalLinha) then
    begin
      if (PageControl1.ActivePageIndex=0) then
        ind  := posicao2 + totalLinha;
      if (PageControl1.ActivePageIndex=1) then
        ind  := posicao1 + totalLinha;
      if (PageControl1.ActivePageIndex=2) then
        ind  := posicao3 + totalLinha;
      if (PageControl1.ActivePageIndex=3) then
        ind  := posicao6 + totalLinha;
      if (ind<(memoEspelho.count-totalLinha+1)) then
      begin
                  {a. Page down normal}
        memoPrin.lines.clear;
        cont := 1;
        while ((cont<>totalLinha) and ((ind+1)<memoEspelho.count)) do
        begin
          memoPrin.lines.add (memoEspelho[ind+1]);
          ind  := ind  + 1;
          cont := cont + 1;
        end;
        if (PageControl1.ActivePageIndex=0) then
          posicao2 := posicao2 + totalLinha;
        if (PageControl1.ActivePageIndex=1) then
          posicao1 := posicao1 + totalLinha;
        if (PageControl1.ActivePageIndex=2) then
          posicao3 := posicao3 + totalLinha;
        if (PageControl1.ActivePageIndex=3) then
          posicao6 := posicao6 + totalLinha;
      end
      else
      begin
                  {b. Page Down ate o final}
        ind := memoEspelho.count - totalLinha - 1;
        if (PageControl1.ActivePageIndex=0) then
          posicao := posicao2;
        if (PageControl1.ActivePageIndex=1) then
          posicao := posicao1;
        if (PageControl1.ActivePageIndex=2) then
          posicao := posicao3;
        if (PageControl1.ActivePageIndex=3) then
          posicao := posicao6;
        if (posicao<>(memoEspelho.count-totalLinha+1)) then
        begin
          memoPrin.lines.clear;
          cont := 1;
          ind  := ind + 1;
          while (cont<>totalLinha) do
          begin
            memoPrin.lines.add (memoEspelho[ind+1]);
            ind  := ind  + 1;
            cont := cont + 1;
          end;
          posicao := memoEspelho.count - totalLinha + 1;
          if (PageControl1.ActivePageIndex=0) then
            posicao2 := posicao;
          if (PageControl1.ActivePageIndex=1) then
            posicao1 := posicao;
          if (PageControl1.ActivePageIndex=2) then
            posicao3 := posicao;
          if (PageControl1.ActivePageIndex=3) then
            posicao6 := posicao;
        end;
      end;
    end;
  memoEspelho.Free;
end;

{Opcao de subir uma pagina completa para cima ***}
procedure Tfrm_Consulta1.btnPageUpClick(Sender: TObject);
var
  memoPrin: TMemo;
  memoEspelho: TStringList;
  totalLinha,ind: Integer;
  posicao,cont: Integer;
begin
     {Escolha da pagina ***}
  memoEspelho := TStringList.Create;
  if (PageControl1.ActivePageIndex=0) then
  begin
    memoPrin := memo2;
    memoEspelho.AddStrings(memo2Espelho);
    totalLinha := Memo2TotLin;
    ind := posicao2 - Memo2TotLin;
  end
  else
  if (PageControl1.ActivePageIndex=1) then
  begin
    memoPrin := memo1;
    memoEspelho.AddStrings(memo1Espelho);
    totalLinha := Memo1TotLin;
    ind := posicao1 - Memo1TotLin;
  end
  else
  if (PageControl1.ActivePageIndex=2) then
  begin
    memoPrin := memo3;
    memoEspelho.AddStrings(memo3Espelho);
    totalLinha := Memo3TotLin;
    ind := posicao3 - Memo3TotLin;
  end
  else
  if (PageControl1.ActivePageIndex=3) then
  begin
    memoPrin := memo6;
    memoEspelho.AddStrings(memo6Espelho);
    totalLinha := Memo6TotLin;
    ind := posicao6 - Memo6TotLin;
  end
  else
  if (PageControl1.ActivePageIndex=4) then
  begin
    memoPrin := memo7;
    memoEspelho.AddStrings(memo7Espelho);
    totalLinha := Memo7TotLin;
    ind := posicao7 - Memo7TotLin;
  end
  else
  if (PageControl1.ActivePageIndex=5) then
  begin
    memoPrin := memo4;
    memoEspelho.AddStrings(memo4Espelho);
    totalLinha := Memo4TotLin;
    ind := posicao4 - Memo4TotLin;
  end;

     {...}
  if (PageControl1.ActivePageIndex<>totalPaginas-1) then
    if (ind>=0) then
    begin
              {a. Page up normal}
      memoPrin.lines.clear;
      cont := 1;
      while (cont<>totalLinha) do
      begin
        memoPrin.lines.add (memoEspelho[ind]);
        ind  := ind  + 1;
        cont := cont + 1;
      end;
      if (PageControl1.ActivePageIndex=0) then
        posicao2 := posicao2 - Memo2TotLin;
      if (PageControl1.ActivePageIndex=1) then
        posicao1 := posicao1 - Memo1TotLin;
      if (PageControl1.ActivePageIndex=2) then
        posicao3 := posicao3 - Memo3TotLin;
      if (PageControl1.ActivePageIndex=3) then
        posicao6 := posicao6 - Memo3TotLin;
    end
    else
    begin
      if (PageControl1.ActivePageIndex=0) then
        posicao := posicao2;
      if (PageControl1.ActivePageIndex=1) then
        posicao := posicao1;
      if (PageControl1.ActivePageIndex=2) then
        posicao := posicao3;
      if (PageControl1.ActivePageIndex=3) then
        posicao := posicao6;
      if (posicao<>0) then
      begin
                   {b. Page Up ate em cima}
        ind := 0;
        cont := 1;
        memoPrin.lines.clear;
        while ((cont<>totalLinha) and (ind<memoEspelho.count)) do
        begin
          memoPrin.lines.add (memoEspelho[ind]);
          ind  := ind  + 1;
          cont := cont + 1;
        end;
        if (PageControl1.ActivePageIndex=0) then
          posicao2 := 0;
        if (PageControl1.ActivePageIndex=1) then
          posicao1 := 0;
        if (PageControl1.ActivePageIndex=2) then
          posicao3 := 0;
        if (PageControl1.ActivePageIndex=3) then
          posicao6 := 0;
      end;
    end;
  memoEspelho.Free;
end;

procedure Tfrm_Consulta1.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex=0) then
    Memo2.setfocus;
  if (PageControl1.ActivePageIndex=1) then
    Memo1.setfocus;
  if (PageControl1.ActivePageIndex=2) then
    Memo3.setfocus;
  if (PageControl1.ActivePageIndex=3) then
    Memo6.setfocus;
  if (PageControl1.ActivePageIndex=4) then
    Memo7.setfocus;
  if (PageControl1.ActivePageIndex=5) then
    Memo4.setfocus;
  if (PageControl1.ActivePageIndex=6) then
    Memo8.SetFocus;
end;

procedure Tfrm_Consulta1.Memo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnPageDown.click;
  if (key=K_F2) then
    if (pn1.visible) then
      edtCodCli.setfocus
    else if (pn2.visible) then
      edtCpf.setfocus
    else if (pnTel.visible) then
      edtFone.setfocus;
end;

procedure Tfrm_Consulta1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnPageDown.click;
  if (key=K_F2) then
    if (pn1.visible) then
      edtCodCli.setfocus
    else if (pn2.visible) then
      edtCpf.setfocus
    else if (pnTel.visible) then
      edtFone.setfocus;
end;

procedure Tfrm_Consulta1.Memo3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnPageDown.click;
  if (key=K_F2) then
    if (pn1.visible) then
      edtCodCli.setfocus
    else if (pn2.visible) then
      edtCpf.setfocus
    else if (pnTel.visible) then
      edtFone.setfocus;
end;

procedure Tfrm_Consulta1.Memo4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnPageDown.click;
  if (key=K_F2) then
    if (pn1.visible) then
      edtCodCli.setfocus
    else if (pn2.visible) then
      edtCpf.setfocus
    else if (pnTel.visible) then
      edtFone.setfocus;
end;

{verificando os cheques devolvidos pagos ***}
{A consulta é feita pelo codigo, somente nestes casos de consulta}
{Cheques sem codigo, significam que foram cadastrados sem ter sido feito o }
{cadastro do cliente ...}
function Tfrm_Consulta1.VerificaDev (codigo,banco,numero: Real; arquivo: String):String;
var
  clCheq: TClassCheque;
begin
  clCheq := TClassCheque.Create;
  with (clCheq) do
  begin
    conect   ('CREDITO', self);
    ClearSql;
    AddParam ('Select   CH_CLIE,CH_BANC,CH_NUME                                   ');
    AddParam ('From     '+arquivo+'                                               ');
    AddParam ('Where    (CH_CLIE='+floattostr(codigo)+') AND  ');
    AddParam ('         (CH_BANC='+floattostr(banco)+') AND  ');
    AddParam ('         (CH_NUME='+floattostr(numero)+')      ');
    if (Execute) then
      VerificaDev:='Sim'
    else
      VerificaDev:='';
    desconect;
    Free;
  end;
end;

{Chamando lancamento de cliente/comntrato ***}
{Na funcao Chamando..., o codigo "4" puxa as configuracoes principais do formulario,}
{como codigo do cliente, data do contrato e codigo da loja.}
procedure Tfrm_Consulta1.btnLancClick(Sender: TObject);
var
  continua: Boolean;
begin
  if (Modo=1) or (Modo=3) then
  begin
    if (trim(codigo)<>'') then
    begin
      motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(strtofloat(codigo));
      if (motivobloqueio<>'-1') then
      begin
        frmDialogo.ExibirMensagem (' Cliente bloqueado! Crediário não permitido! '
          ,'Crediário',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        continua := false;
      end
      else
        continua := true;
    end
    else
      continua := true;

          {...}
    if (continua) then
    begin
      if (codigo='-1') then
        codigo:='';
      frm_principal.clienteaut := sender = edtCodCli;
      frm_principal.ChamandoClienteContrato (4, true);
              {*********************************************************************}
      if (frm_principal.x_imprimir_proposta) then
        if (y_codigo_contrato<>-1) then
          if (frmDialogo.ExibirMensagem ('Deseja emitir proposta de crédito?'
            ,'Venda',[mbYes,mbNo]
            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          begin
            Application.CreateForm(Tfrm_VersoProposta, frm_VersoProposta);
            Application.CreateForm(Tfrm_PropostaCredito, frm_PropostaCredito);
            with (frm_PropostaCredito) do
            begin
              caption := frm_principal.x_sistema+' - Impressão de proposta de crédito';
              Panel1.visible:=true;
              Panel2.visible:=true;
              listaProposta.visible:=false;
              Modo:=0;
              edtCliente.text  := form_nz(y_codigo_cliente,6);
              edtContrato.text := form_nz(y_codigo_contrato,6);
              showmodal;
              Free;
              frm_VersoProposta.Free;
            end;
          end;
              {*********************************************************************}
      if (Modo=3) and (y_codigo_contrato<>-1) then
        frm_consulta1.close
      else
      begin
        flagExibeObservacao := false;
        btnConsulta.click;
      end;
    end;
  end;
end;

{Chamando baixa/direta de documento, sem passar pela Atualizacao de Recebimentos ***}
procedure Tfrm_Consulta1.btnBaixaClick(Sender: TObject);
begin
  if (Modo=1) or (Modo=3) then
  begin
    if (trim(edtcodcli.text)='') then
      frm_principal.ChamandoLancReceb2(0,frm_principal.x_loja,0)
    else
      frm_principal.ChamandoLancReceb2(strtofloat(edtcodcli.text),frm_principal.x_loja,0);
    flagExibeObservacao := false;
    btnConsulta.click;
  end;
end;

{Pisca alerta em vermelho ***}
procedure Tfrm_Consulta1.TimerAlertaTimer(Sender: TObject);
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

{Botao de navegar pela consulta ---> Lado direito ***}
procedure Tfrm_Consulta1.btnDir1linClick(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex<6) then
    PageControl1.ActivePageIndex := PageControl1.ActivePageIndex + 1
  else
    PageControl1.ActivePageIndex := 0;
end;

{Botao de navegar pela consulta ---> Lado esquerdo ***}
procedure Tfrm_Consulta1.btnEsq1linClick(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex>0) then
    PageControl1.ActivePageIndex := PageControl1.ActivePageIndex - 1
  else
    PageControl1.ActivePageIndex := 6;
end;

procedure Tfrm_Consulta1.Lancamento1Click(Sender: TObject);
begin
  btnLanc.click;
end;

procedure Tfrm_Consulta1.Baixa1Click(Sender: TObject);
begin
  BtnBaixa.click;
end;

{Evita que os botoes sejam pressionados ***}
procedure Tfrm_Consulta1.edtCodCliChange(Sender: TObject);
begin
  flag1:=true;
end;

procedure Tfrm_Consulta1.btnRenovaClick(Sender: TObject);
var
  TotalPermitido: Real;
begin
  codigo := Trim(codigo);
  if (Modo=1) or (Modo=3) then
    if (codigo<>'') then
      if (codigo='-1') or
        (pnAlerta.caption='Cliente sem ficha') then
        frmDialogo.ExibirMensagem (' Cliente não definido ou não cadastrado! '
          ,'Consulta',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(strtofloat(codigo));
        if (motivobloqueio<>'-1') then
          frmDialogo.ExibirMensagem (' Cliente bloqueado! Crediário não permitido! '
            ,'Crediário',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        if (frm_principal.x_critica_limite) then
        begin
          TotalPermitido := InformaLimiteCredito(strtofloat(codigo));
          if (TotalPermitido<=0.00) then {limite negativo}
            frmDialogo.ExibirMensagem (' Cliente sem crédito! Compra não permitida!'
              ,'Renovação',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
          else
          begin
            frm_principal.ChamandoClienteContrato (3,true);
                              {*********************************************************************}
            if (y_codigo_contrato<>-1) then
              if (frm_principal.x_imprimir_proposta) then
                if (frmDialogo.ExibirMensagem ('Deseja emitir proposta de crédito?'
                  ,'Venda',[mbYes,mbNo]
                  ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
                begin
                  Application.CreateForm(Tfrm_VersoProposta, frm_VersoProposta);
                  Application.CreateForm(Tfrm_PropostaCredito, frm_PropostaCredito);
                  with (frm_PropostaCredito) do
                  begin
                    caption := frm_principal.x_sistema+' - Impressão de proposta de crédito';
                    Panel1.visible:=true;
                    Panel2.visible:=true;
                    listaProposta.visible:=false;
                    Modo:=0;
                    edtCliente.text  := form_nz(y_codigo_cliente,6);
                    edtContrato.text := form_nz(y_codigo_contrato,6);
                    showmodal;
                    Free;
                    frm_VersoProposta.Free;
                  end;
                end;
                              {*********************************************************************}
            if (Modo=3) and (y_codigo_contrato<>-1) then
              frm_consulta1.close
            else
            begin
              flagExibeObservacao := false;
              btnConsulta.click;
            end;
          end;
        end
        else
        begin
          frm_principal.ChamandoClienteContrato (3,true);
                          {*********************************************************************}
          if (y_codigo_contrato<>-1) then
            if (frm_principal.x_imprimir_proposta) then
              if (frmDialogo.ExibirMensagem ('Deseja emitir proposta de crédito?'
                ,'Venda',[mbYes,mbNo]
                ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
              begin
                Application.CreateForm(Tfrm_VersoProposta, frm_VersoProposta);
                Application.CreateForm(Tfrm_PropostaCredito, frm_PropostaCredito);
                with (frm_PropostaCredito) do
                begin
                  caption := frm_principal.x_sistema+' - Impressão de proposta de crédito';
                  Panel1.visible:=true;
                  Panel2.visible:=true;
                  listaProposta.visible:=false;
                  Modo:=0;
                  edtCliente.text  := form_nz(y_codigo_cliente,6);
                  edtContrato.text := form_nz(y_codigo_contrato,6);
                  showmodal;
                  Free;
                  frm_VersoProposta.Free;
                end;
              end;
                          {*********************************************************************}
          if (Modo=3) and (y_codigo_contrato<>-1) then
            frm_consulta1.close
          else
          begin
            flagExibeObservacao := false;
            btnConsulta.click;
          end;
        end;
      end;
end;

procedure Tfrm_Consulta1.Renovao1Click(Sender: TObject);
begin
  btnRenova.click;
end;

procedure Tfrm_Consulta1.edtCpfChange(Sender: TObject);
begin
  flag1:=true;
end;

procedure Tfrm_Consulta1.edtCpfExit(Sender: TObject);
begin
  flag1:=false;
  CriticaCNPJ(edtCpf);
end;

procedure Tfrm_Consulta1.Proposta1Click(Sender: TObject);
begin
  frm_principal.ChamandoPropostaCredito;
end;

procedure Tfrm_Consulta1.btnPropostaClick(Sender: TObject);
begin
  Proposta1.click;
end;

procedure Tfrm_Consulta1.btn2aviaClick(Sender: TObject);
begin
  if (not frm_principal.x_comprovante_pagamento) then
  begin
    Application.CreateForm(Tfrm_EmisCarnet2, frm_EmisCarnet2);
    with (frm_EmisCarnet2) do
    begin
      caption := frm_principal.x_sistema+' - '+LB_EMIS_CARNET;
      Modo    := 0;
      frm_EmisCarnet2.edtCliente.text := frm_Consulta1.edtCodCli.text;
      showmodal;
      Free;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_Opcoes_2via, frm_Opcoes_2via);
    with (frm_Opcoes_2via) do
    begin
      showmodal;
      free;
    end;
  end;
end;

procedure Tfrm_Consulta1.N2avia1Click(Sender: TObject);
begin
  btn2avia.click;
end;

procedure Tfrm_Consulta1.btnCepClick(Sender: TObject);
begin
  ChamandoF8Cep(nil);
end;

procedure Tfrm_Consulta1.Memo6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnPageDown.click;
  if (key=K_F2) then
    if (pn1.visible) then
      edtCodCli.setfocus
    else if (pn2.visible) then
      edtCpf.setfocus
    else if (pnTel.visible) then
      edtFone.setfocus;
end;

procedure Tfrm_Consulta1.Renegocia1Click(Sender: TObject);
begin
  if (Modo=1) or (Modo=3) then
  begin
    Application.CreateForm(Tfrm_Renegocia, frm_Renegocia);
    with (frm_Renegocia) do
    begin
      caption := frm_principal.x_sistema+' - Renegociação de contrato';
      if (trim(edtCodCli.text)<>'') then
      begin
        motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(strtofloat(frm_consulta1.edtCodCli.text));
        if (motivobloqueio<>'-1') then
          frmDialogo.ExibirMensagem (' Cliente bloqueado! Renegociação não permitida! '
            ,'Crediário',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
          edtCodigo.text:=frm_consulta1.edtCodCli.text;
          aListaRenegocia.Clear;
          RefrescaTabela(edtCodigo.GetValor);
        end;
      end;
      Modo := 1;
      showmodal;
      Free;
      btnConsulta.click;
    end;
  end;
end;

procedure Tfrm_Consulta1.btnRenegociaClick(Sender: TObject);
begin
  Renegocia1.click;
end;

procedure Tfrm_Consulta1.Memo7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnPageDown.Click;
  if (key=K_F2) then
    if (pn1.visible) then
      edtCodCli.setfocus
    else if (pn2.visible) then
      edtCpf.setfocus
    else if (pnTel.visible) then
      edtFone.setfocus;
end;

procedure Tfrm_Consulta1.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if Active then
  begin
    Control.Canvas.Font.Color := clWhite;
    Control.Canvas.Brush.Color := clTeal;
  end
  else
  begin
    Control.Canvas.Font.Color := clBlack;
    Control.Canvas.Brush.Color := clBtnFace;
  end;

  Control.Canvas.FillRect( Rect );
  Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(PageControl1.Pages[TabIndex]).Caption );
end;

procedure Tfrm_Consulta1.BitBtn1Click(Sender: TObject);
begin
  if (trim(edtCodCli.Text)<>'') then
  begin
    Application.CreateForm(TMain, Main);
    with (Main) do
    begin
      showmodal;
      Free;
    end;
  end;
end;

procedure Tfrm_Consulta1.pagina7Enter(Sender: TObject);
begin
  CarregaFotoCliente_(edtCpf.Text,foto_cliente); 
end;

procedure Tfrm_Consulta1.SpeedButton1Click(Sender: TObject);
begin
  if (trim(edtCodCli.Text)<>'') then
  begin
    Application.CreateForm(TMain, Main);
    with (Main) do
    begin
      Main.abril := 1;
      showmodal;
      Free;
    end;
  end;

end;

function Tfrm_Consulta1.BuscaFormasDePagamento(caixa, codigoVenda,
  loja: Real): String;
var
  clAux: TClassAuxiliar;
  descricaoFormas: String;

  function NomeFormaPagamento(codigoForma: Real): String;
  var
    clAux2: TClassAuxiliar;
  begin
    clAux2 := TClassAuxiliar.Create;
    clAux2.Conect(DataBaseProdutos,self);
    clAux2.consulta.SQL.Clear;
    clAux2.consulta.SQL.Add('SELECT FO_DESC FROM FORMAS_PAGAMENTO ');
    clAux2.consulta.SQL.Add('WHERE (FO_CODI=:codigo)              ');
    clAux2.consulta.ParamByName('codigo').AsFloat := codigoForma;
    clAux2.consulta.Open;
    if (not clAux2.consulta.IsEmpty) then
      Result := clAux2.Result('FO_DESC')
    else
      Result := '<Forma de Pagamento não Cadastrada>';
    clAux2.Desconect;
    clAux2.Free;
  end;

begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;
  clAux.AddParam('SELECT * FROM VENDAS_FORMA_PAGAMENTO ');
  clAux.AddParam('WHERE (VF_CAIX=:CAIXA) AND           ');
  clAux.AddParam('      (VF_VEND=:VENDA) AND           ');
  clAux.AddParam('      (VF_LOJA=:LOJA)                ');
  clAux.consulta.ParamByName('CAIXA').AsFloat := caixa;
  clAux.consulta.ParamByName('VENDA').AsFloat := codigoVenda;
  clAux.consulta.ParamByName('LOJA').AsFloat  := loja;
  clAux.consulta.Open;
  if (not clAux.consulta.IsEmpty) then
  begin
    clAux.First;
    descricaoFormas := '';
    while (not clAux.Eof) do
    begin
      descricaoFormas := descricaoFormas + NomeFormaPagamento(clAux.Result('VF_FPGT'));
      clAux.Next;
      if (not clAux.Eof) then
        descricaoFormas := descricaoFormas + ' / ';
    end;
    Result := descricaoFormas;
  end
  else
    Result := '<Forma de Pagamento não Cadastrada>';
  clAux.Desconect;
  clAux.Free;
end;

function Tfrm_Consulta1.PagouComCrediario(caixa, codigoVenda,
  loja: Real): Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;
  clAux.AddParam('SELECT * FROM VENDAS_FORMA_PAGAMENTO                ');
  clAux.AddParam('WHERE (VF_CAIX=:CAIXA) AND (VF_VEND=:VENDA) AND     ');
  clAux.AddParam('      (VF_LOJA=:LOJA) AND (VF_FPGT=:FORMAPAGAMENTO) ');
  clAux.consulta.ParamByName('CAIXA').AsFloat          := caixa;
  clAux.consulta.ParamByName('VENDA').AsFloat          := codigoVenda;
  clAux.consulta.ParamByName('LOJA').AsFloat           := loja;
  clAux.consulta.ParamByName('FORMAPAGAMENTO').AsFloat := 5;
  clAux.consulta.Open;
  Result := (not clAux.consulta.IsEmpty);
  clAux.Desconect;
  clAux.Free;
end;

end.
