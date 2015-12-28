{Falta: 1) Testar o caso do SPC
        2) Adicionar totalizadores por loja
        3) Um dos campos esta sem acumulador de totais ***}
unit unPrestRecCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, Mask;

type
  Tfrm_PrestRecCli = class(TForm)
    gContrato: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtInicial2: TMaskEdit;
    edtFinal2: TMaskEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtInicial3: TMaskEdit;
    edtFinal3: TMaskEdit;
    pnLoja1: TPanel;
    pnLoja2: TPanel;
    GroupBox2: TGroupBox;
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
    btnConfere: TButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Label1: TLabel;
    edtValor: TMaskEdit;
    ch2: TCheckBox;
    ch3: TCheckBox;
    gPlano: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtInicial1: TMaskEdit;
    edtFinal1: TMaskEdit;
    pnPlano1: TPanel;
    pnPlano2: TPanel;
    ch1: TCheckBox;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edtInicial4: TMaskEdit;
    edtFinal4: TMaskEdit;
    ch4: TCheckBox;
    chSalto: TCheckBox;
    chResumo: TCheckBox;
    chSoResumo: TCheckBox;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtInicial3Enter(Sender: TObject);
    procedure edtFinal3Enter(Sender: TObject);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3Exit(Sender: TObject);
    procedure edtFinal3DblClick(Sender: TObject);
    procedure edtInicial3Exit(Sender: TObject);
    procedure edtInicial3DblClick(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfereClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch3Click(Sender: TObject);
    procedure ch3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial1DblClick(Sender: TObject);
    procedure edtInicial1Enter(Sender: TObject);
    procedure edtInicial1Exit(Sender: TObject);
    procedure edtInicial1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal1DblClick(Sender: TObject);
    procedure edtFinal1Enter(Sender: TObject);
    procedure edtFinal1Exit(Sender: TObject);
    procedure edtFinal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtInicial4Enter(Sender: TObject);
    procedure edtInicial4Exit(Sender: TObject);
    procedure edtInicial4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal4Enter(Sender: TObject);
    procedure edtFinal4Exit(Sender: TObject);
    procedure edtFinal4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch4Click(Sender: TObject);
    procedure ch4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chSoResumoClick(Sender: TObject);
    procedure chSoResumoExit(Sender: TObject);
    procedure chResumoClick(Sender: TObject);
    procedure chResumoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function TotalPagoContrato(cliente,contrato: Real):Real;
    function ClienteEstaNoSPC(codigo: Real):Boolean;
    procedure LimparEdits;
  end;

var
  frm_PrestRecCli: Tfrm_PrestRecCli;

implementation

uses prestcontrato, unDialogo, principal, F8Lojas, funcoes1, funcoes2, mem_prnt, cliente,
  procura, contratos, loja, unMensagem, f8planos, auxiliar;

{$R *.DFM}

procedure Tfrm_PrestRecCli.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_PrestRecCli.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_PrestRecCli.edtInicial2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PrestRecCli.edtFinal2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PrestRecCli.edtInicial3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PrestRecCli.edtFinal3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PrestRecCli.edtInicial2Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end;
  if (edtInicial2.text='  /  /    ') then
    edtInicial2.text:='01/01/1900';
end;

procedure Tfrm_PrestRecCli.edtFinal2Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end;
  if (edtFinal2.text='  /  /    ') then
    edtFinal2.text:='31/12/5000';
end;

procedure Tfrm_PrestRecCli.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtFinal1.setfocus;   
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data inicial dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_PrestRecCli.edtFinal2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial3.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data final dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_PrestRecCli.edtInicial3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal3.setfocus;
  if (key=K_CIMA) then
    edtFinal2.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtInicial3;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código da loja inicial: Formato 999',10);
end;

procedure Tfrm_PrestRecCli.edtFinal3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial4.setfocus;
  if (key=K_CIMA) then
    edtInicial3.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtFinal3;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código da loja final: Formato 999',10);
end;

procedure Tfrm_PrestRecCli.edtFinal3Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtFinal3.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtFinal3.text));
    pnLoja2.caption:=ProcuraNomeLoja (codigo,self);
    edtFinal3.text:=form_nz(codigo,3);
  end
  else
    edtFinal3.text:='999';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_PrestRecCli.edtFinal3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtFinal3;
    showmodal;
  end;
end;

procedure Tfrm_PrestRecCli.edtInicial3Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtInicial3.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtInicial3.text));
    pnLoja1.caption:=ProcuraNomeLoja (codigo,self);
    edtInicial3.text:=form_nz(codigo,3);
  end
  else
    edtInicial3.text:='000';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_PrestRecCli.edtInicial3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtInicial3;
    showmodal;
  end;
end;

{Opcao de impressao de recebimentos ***}
procedure Tfrm_PrestRecCli.Registrarbaixadodocumento1Click(Sender: TObject);
var
  flagCabecalhoLoja: Boolean;
  clCont: TClassContrato;
  clLoja: TClassLoja;
  vTotal1,vTotal2,vTotal3,vTotal4: array[1..99] of Real;
  clPrestCont: TClassPrestContrat;
  clPrest1,clPrest2,clPrest3,clPrest4: TClassPrestContrat;
  clClient: TClassCliente;
  data1,data2,data3,data4,loja1,loja2: String;
  i,indGauge,totGauge,cliant,lojaant: Integer;
  totgeral,totalpago,dif,totvalor,tot30,tot60,totm60: Real;
  totgeralcli,totvalorcli,tot30cli,tot60cli,totm60cli: Real;
  totgeralloja,totvalorloja,tot30loja,tot60loja,totm60loja: Real;
  plano1,plano2,hoje,codigo,valor,nomeloja,nome: String;
  total1,total2,total3,total4: Real;
  valor1,perc1: Real;
  valor2,perc2: Real;
  valor3,perc3: Real;
  valor4,perc4: Real;
  perc5: Real;
  flagSpc: Boolean;
begin
  {CRITICA AS DATAS}
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFinal2.setfocus;
  end
  else
  if (not IsDate (edtInicial4.text) and (edtInicial4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data dos vencimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtInicial4.setfocus;
  end
  else
  if (not IsDate (edtFinal4.text) and (edtFinal4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data dos vencimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFinal4.setfocus;
  end
  else
  begin
    {FORMATACAO DOS DADOS DE ENTRADA ***}
    if (chSoResumo.checked) then
      chResumo.checked:=true;
    if (Trim(edtInicial1.text)='') and (not ch1.checked) then
      edtInicial1.text:='0000';
    if (Trim(edtFinal1.text)='') and (not ch1.checked) then
      edtFinal1.text:='9999';
    if (edtInicial2.text='  /  /    ') and (not ch2.checked) then
      edtInicial2.text:='01/01/1900';
    if (edtFinal2.text='  /  /    ') and (not ch2.checked) then
      edtFinal2.text:='31/12/5000';
    if (Trim(edtInicial3.text)='') and (not ch3.checked) then
      edtInicial3.text:='000';
    if (Trim(edtFinal3.text)='') and (not ch3.checked) then
      edtFinal3.text:='999';
    if (edtInicial4.text='  /  /    ') and (not ch4.checked) then
      edtInicial4.text:='01/01/1900';
    if (edtFinal4.text='  /  /    ') and (not ch4.checked) then
      edtFinal4.text:='31/12/5000';

    {Perguntas anteriores a execucao**}
    if (frmDialogo.ExibirMensagem ('Listar clientes no SPC?',
      'Diario de Prestações a Vencer',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
      flagSpc:=true
    else
      flagSpc:=false;

    {filtros que serao aplicados às prestacoes}
    if (ch1.checked) then
    begin
      plano1 := '00';
      plano2 := '99999';
    end
    else
    begin
      plano1 := Trim(edtInicial1.text);
      plano2 := Trim(edtFinal1.text);
    end;
    if (ch2.checked) then
    begin
      data1  := FormataData(strtodate('01/01/1900'));
      data2  := FormataData(strtodate('31/12/5000'));
    end
    else
    begin
      data1  := FormataData(strtodate(Trim(edtInicial2.text)));
      data2  := FormataData(strtodate(Trim(edtFinal2.text)));
    end;
    if (ch3.checked) then
    begin
      loja1  := '00';
      loja2  := '999999';
    end
    else
    begin
      loja1  := Trim(edtInicial3.text);
      loja2  := Trim(edtFinal3.text);
    end;
    if (ch4.checked) then
    begin
      data3  := FormataData(strtodate('01/01/1900'));
      data4  := FormataData(strtodate('31/12/5000'));
    end
    else
    begin
      data3  := FormataData(strtodate(Trim(edtInicial4.text)));
      data4  := FormataData(strtodate(Trim(edtFinal4.text)));
    end;
    if (Trim(edtValor.text)<>'') then
      valor  := RetiraFormatacaoNumero(Trim(edtValor.text))
    else
      valor := '0.00';
    with (frm_mem_print) do
    begin
       {configurando o gerador de relatorios}
      PrepareReport;
      frm_principal.x_col_impressao := 132;
      frm_principal.x_arq_impressao := 'g03.rel';
      frm_principal.x_comando       := '15c';
      frm_principal.x_tam_fonte     := 8;
      Title:= 'PRESTAÇÕES A RECEBER POR CLIENTE';
      frm_mem_print.flagPodeImprimir := (not chSoResumo.checked); {*}

       {zerando o vetor}
      for i:=1 to 99 do
      begin
        vTotal1[i]:=0.00;
        vTotal2[i]:=0.00;
        vTotal3[i]:=0.00;
        vTotal4[i]:=0.00;
      end;

       {iniciando o processamento do relatorio}
      mostra_mensagem ('Preparando relatório...Aguarde!');
      frm_mensagem.painel.visible:=true;
      frm_mensagem.gauge1.progress:=0;
      clCont := TClassContrato.Create;
      with (clCont) do
      begin
        conect   ('CREDITO',self);
        ClearSql;
        AddParam ('Select   CR_LOJA,CL_NOME,                                        ');
        AddParam ('         CR_CLIE,CR_CODI,CR_DNOT,CR_TOT2,CR_VDEV,CR_QPRE,        ');
        AddParam ('         CR_PLAN                                                 ');
        AddParam ('From     CRECTABR,CRECLI                                         ');
        AddParam ('Where    (CR_DNOT>='+chr(39)+data1+chr(39)+') AND                ');
        AddParam ('         (CR_DNOT<='+chr(39)+data2+chr(39)+') AND                ');
        AddParam ('         (CR_LOJA>='+loja1+') AND (CR_LOJA<='+loja2+') AND       ');
        AddParam ('         (CR_PDEV>0) AND (CR_PDEV<=CR_QPRE) AND                  ');
        AddParam ('         (CR_VDEV>='+chr(39)+valor+chr(39)+') AND                ');
        AddParam ('         (CR_PLAN>='+plano1+')  AND (CR_PLAN<='+plano2+') AND    ');
        AddParam ('         (CR_CLIE=CL_CODI)                                       ');
        if (not flagSpc) then
          AddParam ('  AND (CL_RSPC='+chr(39)+'N'+chr(39)+')                       ');
        AddParam ('Order by CR_LOJA,CL_NOME                                         ');
        if (Execute) then
        begin
                 {iniciando impressao}
          if (not chSalto.checked) then
          begin
            if (ch1.checked) then
              AddLine('Plano...............: TODOS OS PLANOS')
            else
              AddLine('Plano...............: '+plano1+' a '+plano2);
            if (ch2.checked) then
              AddLine('Data dos contratos..: TODOS OS CONTRATOS')
            else
              AddLine('Data dos contratos..: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
            if (ch3.checked) then
              AddLine('Loja................: TODAS AS LOJAS')
            else
              Addline ('Loja................: '+loja1+' a '+loja2);
            if (ch4.checked) then
              AddLine('Data do vencimento..: TODOS OS CONTRATOS')
            else
              AddLine('Data do vencimento..: '+Trim(edtInicial4.text)+' a '+Trim(edtFinal4.text));
          end;
          clPrestCont := TClassPrestContrat.Create;
          clPrestCont.conect ('CREDITO',self);
          clCont.first;
          cliant       := 0;
          lojaant      := 0;
          totgeralloja := 0.00;
          totvalorloja := 0.00;
          tot30loja    := 0.00;
          tot60loja    := 0.00;
          totm60loja   := 0.00;
          totgeralcli  := 0.00;
          totvalorcli  := 0.00;
          tot30cli     := 0.00;
          tot60cli     := 0.00;
          totm60cli    := 0.00;
          total1       := 0.00;
          total2       := 0.00;
          total3       := 0.00;
          total4       := 0.00;
          indGauge     := 0;
          totGauge     := clCont.reccount;
          flagCabecalhoLoja := false;
          while (not clCont.eof) do
          begin
                      {Ordem: LOJA>>CLIENTE --------->}
                      {encontra loja diferente-}
            nome := form_t(' ',27);
            if (clCont.Result('CR_LOJA')<>lojaant) then
            begin
              if (lojaant<>0) then
              begin
                if (totvalorcli<>0.00) then
                begin
                  AddLine(form_tc('-',132,'-'));
                  AddLine('-------- Total do Cliente.: '+
                    form_n(cliant,6)+form_tc(' ',33,' ')+
                    form_nc(totvalorcli,10)+
                    form_tc(' ',9,' ')+form_nc(tot30cli, 10)+
                    ' '+form_nc(tot60cli, 10)+
                    ' '+form_nc(totm60cli,10)+
                    ' '+form_nc(totgeralcli,10));
                end;
                totgeralcli := 0.00;
                totvalorcli := 0.00;
                tot30cli    := 0.00;
                tot60cli    := 0.00;
                totm60cli   := 0.00;
                cliant      := clCont.Result('CR_CLIE');
                nome        := clCont.Result('CL_NOME');
                if (totvalorloja<>0.00) then
                begin
                  AddLine('-------- Total da Loja....: '+
                    form_n(lojaant,6)+form_tc(' ',33,' ')+
                    form_nc(totvalorloja,10)+
                    form_tc(' ',9,' ')+form_nc(tot30loja, 10)+
                    ' '+form_nc(tot60loja, 10)+
                    ' '+form_nc(totm60loja,10)+
                    ' '+form_nc(totgeralloja,10));
                  vTotal1[lojaant] := totvalorloja;
                  vTotal2[lojaant] := tot30loja;
                  vTotal3[lojaant] := tot60loja;
                  vTotal4[lojaant] := totm60loja;
                  if (chSalto.checked) then
                    AddLine(chr(12)+form_tc(' ',131,' '))
                  else
                    AddLine('');
                end;
              end;
              totgeralloja := 0.00;
              totvalorloja := 0.00;
              tot30loja    := 0.00;
              tot60loja    := 0.00;
              totm60loja   := 0.00;
              lojaant      := clCont.Result('CR_LOJA');
              nomeloja     := ProcuraNomeLoja (lojaant, self);
              flagCabecalhoLoja := true;
            end;

                      {Encontra um cliente diferente ***}
            if (clCont.Result('CR_CLIE')<>cliant) then
            begin
              if (cliant<>0) then
                if (totvalorcli<>0.00) then
                begin
                  AddLine(form_tc('-',132,'-'));
                  AddLine('-------- Total do Cliente.: '+
                    form_n(cliant,6)+form_tc(' ',33,' ')+
                    form_nc(totvalorcli,10)+
                    form_tc(' ',9,' ')+form_nc(tot30cli, 10)+
                    ' '+form_nc(tot60cli, 10)+
                    ' '+form_nc(totm60cli,10)+
                    ' '+form_nc(totgeralcli,10));
                  AddLine('');
                end;
              totgeralcli := 0.00;
              totvalorcli := 0.00;
              tot30cli    := 0.00;
              tot60cli    := 0.00;
              totm60cli   := 0.00;
              cliant      := clCont.Result('CR_CLIE');
              nome        := clCont.Result('CL_NOME');
            end;

                      {imprimindo as linhas ***}
                      {Pesquisando prestacoes do cliente ***}
            clPrestCont.ClearSql;
            clPrestCont.AddParam ('Select PC_LOJA,PC_CONT,PC_CLIE,PC_NPRE,PC_PORT,PC_TPRE,       ');
            clPrestCont.AddParam ('       PC_VALO,PC_DCON,PC_DVTO,PC_FATO,PC_AVAL,PC_PLAN        ');
            clPrestCont.AddParam ('From   CREPRABR                                               ');
            clPrestCont.AddParam ('Where (PC_CLIE='+floattostr(clCont.Result('CR_CLIE'))+') AND  ');
            clPrestCont.AddParam ('      (PC_CONT='+floattostr(clCont.Result('CR_CODI'))+') AND  ');
            clPrestCont.AddParam ('      (PC_STAT='+chr(39)+'0'+chr(39)+')                  AND  ');
            clPrestCont.AddParam ('      (PC_DVTO>='+chr(39)+data3+chr(39)+') AND                ');
            clPrestCont.AddParam ('      (PC_DVTO<='+chr(39)+data4+chr(39)+')                    ');
            clPrestCont.Execute;
            dif:=0;
            totgeral := 0.00;
            totvalor := 0.00;
            tot30    := 0.00;
            tot60    := 0.00;
            totm60   := 0.00;
            clPrestCont.first;
            while (not clPrestCont.eof) do
            begin
              if (clPrestCont.Result('PC_DVTO')<=frm_principal.x_data_trabalho) then
              begin
                               {totalizando prestacoes vencidas... - total sem juros/multa -->}
                               {dif-> maior atraso registrado}
                if (frm_principal.x_data_trabalho-clPrestCont.Result('PC_DVTO')>dif)  then
                  dif:=frm_principal.x_data_trabalho-clPrestCont.Result('PC_DVTO');
                totvalor     := totvalor + clPrestCont.Result('PC_VALO');
                totvalorloja := totvalorloja + clPrestCont.Result('PC_VALO');
                totgeralloja := totgeralloja + clPrestCont.Result('PC_VALO');
                totvalorcli  := totvalorcli + clPrestCont.Result('PC_VALO');
                totgeralcli  := totgeralcli + clPrestCont.Result('PC_VALO');
              end
              else
              begin
                               {totalizando prestacoes a vencer...  -->}
                totgeralloja := totgeralloja + clPrestCont.Result('PC_VALO');
                totgeralcli  := totgeralcli + clPrestCont.Result('PC_VALO');
                dif := clPrestCont.Result('PC_DVTO')-frm_principal.x_data_trabalho;
                if (dif<=30) then {30dias}
                begin
                  tot30      := tot30    + clPrestCont.Result('PC_VALO');
                  tot30loja  := tot30loja + clPrestCont.Result('PC_VALO');
                  tot30cli   := tot30cli + clPrestCont.Result('PC_VALO');
                end
                else
                if ((dif>30) and (dif<=60)) then {30/60 dias}
                begin
                  tot60      := tot60    + clPrestCont.Result('PC_VALO');
                  tot60loja  := tot60loja + clPrestCont.Result('PC_VALO');
                  tot60cli   := tot60cli + clPrestCont.Result('PC_VALO');
                end
                else
                if (dif>60) then {mais de 60 dias}
                begin
                  totm60     := totm60   + clPrestCont.Result('PC_VALO');
                  totm60loja := totm60loja + clPrestCont.Result('PC_VALO');
                  totm60cli  := totm60cli + clPrestCont.Result('PC_VALO');
                end;
              end;
              totgeral := totgeral + clPrestCont.Result('PC_VALO');
              clPrestCont.next;
            end;
            totalpago := clCont.result('CR_TOT2') - clCont.result('CR_VDEV');
            total1    := total1 + totvalor;
            total2    := total2 + tot30;
            total3    := total3 + tot60;
            total4    := total4 + totm60;
            if (totgeral<>0.00) then
            begin
              if (flagCabecalhoLoja) then
              begin
                if (chSalto.checked) then
                begin
                  if (ch1.checked) then
                    AddLine('Plano...............: TODOS OS PLANOS')
                  else
                    AddLine('Plano...............: '+plano1+' a '+plano2);
                  if (ch2.checked) then
                    AddLine('Data dos contratos..: TODOS OS CONTRATOS')
                  else
                    AddLine('Data dos contratos..: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
                  if (ch3.checked) then
                    AddLine('Loja................: TODAS AS LOJAS')
                  else
                    Addline ('Loja................: '+loja1+' a '+loja2);
                  if (ch4.checked) then
                    AddLine('Data do vencimento..: TODOS OS CONTRATOS')
                  else
                    AddLine('Data do vencimento..: '+Trim(edtInicial4.text)+' a '+Trim(edtFinal4.text));
                end;
                AddLine(form_tc('-',132,'-'));
                AddLine (form_nz(lojaant,3)+' - '+nomeloja);
                AddLine(form_tc('-',132,'-'));
                AddLine ('Nome do Cliente             Codigo| - - CONTRATO - -  |   Total  |- - Vencido - - Qt| - - - - - -  A Vencer - - - - - - |  Total    ');
                AddLine ('                                  |Numero|  Data  |PL | Ja  Pago |Total.S/Jr Dias Pc| Ate 30 DD | 31 a 60 DD| + de 60 DD| A Receber ');
                AddLine (form_tc('-',132,'-'));
                flagCabecalhoLoja := false;
              end;

                          {...}
              AddLine(form_t    (nome,27)+' '+
                form_n    (clCont.Result('CR_CLIE'),6) +' '+
                form_nz   (clCont.Result('CR_CODI'),6) +' '+
                form_data (clCont.Result('CR_DNOT'))   +' '+
                form_n    (clCont.Result('CR_PLAN'),2) +' '+
                form_nc   (totalpago,10)+' '+
                form_nc   (totvalor,10)+' '+
                form_n    (dif,4)+' '+
                form_n    (clCont.Result('CR_QPRE'),2) +' '+
                form_nc   (tot30,10) +' '+
                form_nc   (tot60,10) +' '+
                form_nc   (totm60,10)+' '+
                form_nc   (totgeral,10));
            end;
            clCont.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          if (totvalorcli<>0.00) then
          begin
            AddLine(form_tc('-',132,'-'));
            AddLine('-------- Total do Cliente.: '+
              form_n(cliant,6)+form_tc(' ',33,' ')+
              form_nc(totvalorcli,10)+
              form_tc(' ',9,' ')+form_nc(tot30cli, 10)+
              ' '+form_nc(tot60cli, 10)+
              ' '+form_nc(totm60cli,10)+
              ' '+form_nc(totgeralcli,10));
          end;
          if (totvalorloja<>0.00) then
            AddLine('-------- Total da Loja....: '+
              form_n(lojaant,6)+form_tc(' ',33,' ')+
              form_nc(totvalorloja,10)+
              form_tc(' ',9,' ')+form_nc(tot30loja, 10)+
              ' '+form_nc(tot60loja, 10)+
              ' '+form_nc(totm60loja,10)+
              ' '+form_nc(totgeralloja,10));
          AddLine('');
          clPrestCont.desconect;
          clPrestCont.Free;
        end;
      end;

       {2. parte - Resumo geral das prestacoes a receber por loja -------------->}
      frm_mem_print.flagPodeImprimir := true; {*}
      if (chResumo.checked) then
      begin
        frm_mem_print.flagPodeImprimir := (not chSoResumo.checked); {*}
        if (not chSalto.checked) then
          AddLine(chr(12)+form_tc(' ',131,' '))
        else
          AddLine('');
        frm_mem_print.flagPodeImprimir := true; {*}
        hoje := FormataData(frm_principal.x_data_trabalho);
        mostra_mensagem('Montando resumo do relatório...Aguarde!');
        frm_mensagem.painel.visible:=true;
        frm_mensagem.gauge1.progress:=0;
        with (clLoja) do
        begin
          clLoja := TClassLoja.Create;
          conect   ('CREDITO',self);
          AddParam ('Select LO_CODI,LO_NOME  ');
          AddParam ('From CRELOJA            ');
          AddParam ('Order by LO_CODI        ');
          Execute;
        end;
        if (chSalto.checked) then
        begin
          if (ch1.checked) then
            AddLine('Plano...............: TODOS OS PLANOS')
          else
            AddLine('Plano...............: '+plano1+' a '+plano2);
          if (ch2.checked) then
            AddLine('Data dos contratos..: TODOS OS CONTRATOS')
          else
            AddLine('Data dos contratos..: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
          if (ch3.checked) then
            AddLine('Loja................: TODAS AS LOJAS')
          else
            Addline ('Loja................: '+loja1+' a '+loja2);
          if (ch4.checked) then
            AddLine('Data do vencimento..: TODOS OS CONTRATOS')
          else
            AddLine('Data do vencimento..: '+Trim(edtInicial4.text)+' a '+Trim(edtFinal4.text));
        end;
        AddLine ('(Resumo geral)');
        AddLine (form_tc('-',132,'-'));
        AddLine ('Nome da Loja           Codigo |    Total    %   | A Vencer ate    %  |  A Vencer de   %   |  A Vencer      %  |      TOTAL      %  ');
        AddLine ('                              |   Vencido  Part |      30 Dias  Part | 31 a 60 Dias Part. | ac. 60 dias   Part|    A Receber   Part');
        AddLine (form_tc('-',132,'-'));
        valor1:=0.00;
        valor2:=0.00;
        valor3:=0.00;
        valor4:=0.00;
        for i:=1 to 99 do
        begin
          valor1 := valor1 + vTotal1[i];
          valor2 := valor2 + vTotal2[i];
          valor3 := valor3 + vTotal3[i];
          valor4 := valor4 + vTotal4[i];
        end;
        clLoja.first;
        indGauge:=0;
        totGauge:=clLoja.reccount;
        while (not clLoja.eof) do
        begin
            {1a. grade}
          lojaAnt := clLoja.result('LO_CODI');

            {...}
          if (valor1<>0.00) then
            perc1:=(vTotal1[lojaant]/valor1)*100
          else
            perc1:=0.00;
          if (valor2<>0.00) then
            perc2:=(vTotal2[lojaant]/valor2)*100
          else
            perc2:=0.00;
          if (valor3<>0.00) then
            perc3:=(vTotal3[lojaant]/valor3)*100
          else
            perc3:=0.00;
          if (valor4<>0.00) then
            perc4:=(vTotal4[lojaant]/valor4)*100
          else
            perc4:=0.00;
          if ((valor1+valor2+valor3+valor4)<>0.00) then
            perc5:=((vTotal1[lojaant]+vTotal2[lojaant]+vTotal3[lojaant]+vTotal4[lojaant])/(valor1+valor2+valor3+valor4))*100
          else
            perc5:=0.00;
          if (vTotal1[lojaant]<>0) or (vTotal2[lojaant]<>0) or
            (vTotal3[lojaant]<>0) or (vTotal4[lojaant]<>0) then
            AddLine (form_t  (ProcuraNomeLoja(lojaant,self),25)+' '+
              form_nz (lojaant,2)+'   '+
              form_nc (vTotal1[lojaant],10)+' '+form_nc2(perc1,6,2)+'    '+
              form_nc (vTotal2[lojaant],10)+' '+form_nc2(perc2,6,2)+'    '+
              form_nc (vTotal3[lojaant],10)+' '+form_nc2(perc3,6,2)+'   '+
              form_nc (vTotal4[lojaant],10)+' '+form_nc2(perc4,6,2)+' '+
              form_nc (vTotal1[lojaant]+vTotal2[lojaant]+
              vTotal3[lojaant]+vTotal4[lojaant],14)+' '+
              form_nc2(perc5,6,2));
          clLoja.next;
          indGauge:=indGauge+1;
          frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
          frm_mensagem.gauge1.refresh;
        end;
        AddLine (form_tc('-',132,'-'));
        AddLine ('Total da empresa...:      '+
          form_nc(valor1,15)+'      '+
          form_nc(valor2,15)+'      '+
          form_nc(valor3,15)+'     '+
          form_nc(valor4,15)+'       '+
          form_nc(valor1+valor2+valor3+valor4,15));
        clLoja.desconect;
        clLoja.Free;
      end;
      clCont.desconect;
      clCont.Free;

       {salto de pagina}
      if (frm_principal.x_salto) then
        AddLine(chr(18)+chr(12))
      else
        AddLine(chr(18));

      frm_mem_print.windowstate:=wsMaximized;
      esconde_mensagem;
      frm_mem_print.showmodal;
    end;
  end;
end;

procedure Tfrm_PrestRecCli.edtValorEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_PrestRecCli.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfere.click;
  if (key=K_CIMA) then
    edtFinal4.setfocus;
end;

procedure Tfrm_PrestRecCli.edtValorExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtValor);
end;

procedure Tfrm_PrestRecCli.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValor);
end;

procedure Tfrm_PrestRecCli.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_PrestRecCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

{Esta funcao devolve o que foi pago pelo cliente ****}
function Tfrm_PrestRecCli.TotalPagoContrato(cliente,contrato: Real):Real;
var
  clContrato: TClassContrato;
begin
  with (clContrato) do
  begin
    clContrato := TClassContrato.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Select CR_CLIE,CR_CODI,CR_TOTA,CR_VDEV,CR_TOT2  ');
    AddParam ('From   CRECTABR                                 ');
    AddParam ('Where  (CR_CLIE='+floattostr(cliente)+') AND    ');
    AddParam ('       (CR_CODI='+floattostr(contrato)+')       ');
    if (Execute) then
      TotalPagoContrato := Result('CR_TOT2') - Result('CR_VDEV')
    else
      TotalPagoContrato := 0.00;
    desconect;
    Free;
  end;
end;

{Proc. de limpeza do formulario ***}
procedure Tfrm_PrestRecCli.LimparEdits;
begin
  edtInicial1.text := '';
  edtFinal1.text   := '';
  edtInicial2.text := '';
  edtFinal2.text   := '';
  edtInicial3.text := '';
  edtFinal3.text   := '';
  edtInicial4.text := '';
  edtFinal4.text   := '';
  edtValor.text    := '';
  pnPlano1.caption := '';
  pnPlano2.caption := '';
  ch1.checked      := false;
  habilitaEditRelat(edtInicial1);
  habilitaEditRelat(edtFinal1);
  ch2.checked      := false;
  habilitaEditRelat(edtInicial2);
  habilitaEditRelat(edtFinal2);
  ch3.checked      := false;
  habilitaEditRelat(edtInicial3);
  habilitaEditRelat(edtFinal3);
  ch4.checked      := false;
  habilitaEditRelat(edtInicial4);
  habilitaEditRelat(edtFinal4);
end;

{Limpa o formulario ----}
procedure Tfrm_PrestRecCli.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;   
  edtInicial2.enabled:=true;   
  edtInicial2.setfocus;
  LimparEdits;
end;

{navegacao---}
procedure Tfrm_PrestRecCli.ch2Click(Sender: TObject);
begin
  if (ch2.checked) then
  begin
    desabilitaEditRelat(edtInicial2);
    desabilitaEditRelat(edtFinal2);
    edtInicial3.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial2);
    habilitaEditRelat(edtFinal2);
  end;
end;

{navegacao---}
procedure Tfrm_PrestRecCli.ch2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch2.checked) then
  begin
    desabilitaEditRelat(edtInicial2);
    desabilitaEditRelat(edtFinal2);
    edtInicial3.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial2);
    habilitaEditRelat(edtFinal2);
  end;
end;

{navegacao----}
procedure Tfrm_PrestRecCli.ch3Click(Sender: TObject);
begin
  if (ch3.checked) then
  begin
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
    edtInicial4.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
  end;
end;

{navegacao----}
procedure Tfrm_PrestRecCli.ch3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch3.checked) then
  begin
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
    edtInicial4.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
  end;
end;

procedure Tfrm_PrestRecCli.edtInicial1DblClick(Sender: TObject);
begin
  with (frm_f8planos) do
  begin
    left := 287;
    top  := 76;
    edit := edtInicial1;
    btnCadastro.visible:=true;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_PrestRecCli.edtInicial1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PrestRecCli.edtInicial1Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtInicial1.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtInicial1.text));
    pnPlano1.caption:=ProcuraTipoPlano (codigo,self);
    edtInicial1.text:=form_nz(codigo,4);
  end
  else
    edtInicial1.text:='0000';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_PrestRecCli.edtInicial1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal1.setfocus;
  if (key=K_F8) then
    with (frm_f8planos) do
    begin
      left:=287;
      top:=76;
      edit:=edtInicial1;
      btnCadastro.visible:=true;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano de pagto. inicial: Formato 999',10);
end;

procedure Tfrm_PrestRecCli.edtFinal1DblClick(Sender: TObject);
begin
  with (frm_f8planos) do
  begin
    left:=287;
    top:=76;
    edit:=edtFinal1;
    btnCadastro.visible:=true;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_PrestRecCli.edtFinal1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_PrestRecCli.edtFinal1Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtFinal1.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtFinal1.text));
    pnPlano2.caption:=ProcuraTipoPlano (codigo,self);
    edtFinal1.text:=form_nz(codigo,4);
  end
  else
    edtFinal1.text:='9999';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_PrestRecCli.edtFinal1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial2.setfocus;
  if (key=K_CIMA) then
    edtInicial1.setfocus;
  if (key=K_F8) then
    with (frm_f8planos) do
    begin
      left:=287;
      top:=76;
      edit:=edtFinal1;
      btnCadastro.visible:=true;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano de pagto. final: Formato 999',10);
end;

procedure Tfrm_PrestRecCli.ch1Click(Sender: TObject);
begin
  if (ch1.checked) then
  begin
    desabilitaEditRelat(edtInicial1);
    desabilitaEditRelat(edtFinal1);
    edtInicial2.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial1);
    habilitaEditRelat(edtFinal1);
  end;
end;

procedure Tfrm_PrestRecCli.ch1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch1.checked) then
  begin
    desabilitaEditRelat(edtInicial1);
    desabilitaEditRelat(edtFinal1);
    edtInicial2.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial1);
    habilitaEditRelat(edtFinal1);
  end;
end;

procedure Tfrm_PrestRecCli.FormActivate(Sender: TObject);
begin
  edtInicial1.enabled:=true;
  edtInicial1.setfocus;
end;

procedure Tfrm_PrestRecCli.edtInicial4Enter(Sender: TObject);
begin
  edtInicial4.selectall;
end;

procedure Tfrm_PrestRecCli.edtInicial4Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial4.text) and (edtInicial4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data de vencimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial4.setfocus;
  end;
  if (edtInicial4.text='  /  /    ') then
    edtInicial4.text:='01/01/1900';
end;

procedure Tfrm_PrestRecCli.edtInicial4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal4.setfocus;
  if (key=K_CIMA) then
    edtFinal3.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de vencimento das prestações: Formato 99/99/9999',10);
end;

procedure Tfrm_PrestRecCli.edtFinal4Enter(Sender: TObject);
begin
  edtFinal4.selectall;
end;

procedure Tfrm_PrestRecCli.edtFinal4Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal4.text) and (edtFinal4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data de vencimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal4.setfocus;
  end;
  if (edtFinal4.text='  /  /    ') then
    edtFinal4.text:='31/12/5000';
end;

procedure Tfrm_PrestRecCli.edtFinal4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValor.setfocus;
  if (key=K_CIMA) then
    edtInicial4.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de vencimento das prestações: Formato 99/99/9999',10);
end;

procedure Tfrm_PrestRecCli.ch4Click(Sender: TObject);
begin
  if (ch4.checked) then
  begin
    desabilitaEditRelat(edtInicial4);
    desabilitaEditRelat(edtFinal4);
    edtValor.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial4);
    habilitaEditRelat(edtFinal4);
  end;
end;

procedure Tfrm_PrestRecCli.ch4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch4.checked) then
  begin
    desabilitaEditRelat(edtInicial4);
    desabilitaEditRelat(edtFinal4);
    edtValor.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial4);
    habilitaEditRelat(edtFinal4);
  end;
end;

function Tfrm_PrestRecCli.ClienteEstaNoSPC(codigo: Real):Boolean;
var
  clClie: TClassAuxiliar;
begin
  clClie := TClassAuxiliar.Create;
  clClie.conect   ('CREDITO',self);
  clClie.ClearSql;
  clClie.AddParam ('Select CL_CODI,CL_NOME,CL_RSPC         ');
  clClie.AddParam ('From CRECLI                            ');
  clClie.AddParam ('Where (CL_CODI='+floattostr(codigo)+') ');
  if (clClie.Execute) then
  begin
    if (clClie.result('CL_RSPC')='S') then
      ClienteEstaNoSPC := true
    else
      ClienteEstaNoSPC := false;
  end
  else
    ClienteEstaNoSPC := false;
  clClie.desconect;
  clClie.Free;
end;

procedure Tfrm_PrestRecCli.chSoResumoClick(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_PrestRecCli.chSoResumoExit(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_PrestRecCli.chResumoClick(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

procedure Tfrm_PrestRecCli.chResumoExit(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

end.
