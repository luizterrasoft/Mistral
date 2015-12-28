unit unRelRecCheqDev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Mask, procura, chequesdvpg;

type
  Tfrm_RelRecCheqDev = class(TForm)
    gPlano: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    edtInicial1: TMaskEdit;
    edtFinal1: TMaskEdit;
    pnPort1: TPanel;
    pnPort2: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
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
    gContrato: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtInicial2: TMaskEdit;
    edtFinal2: TMaskEdit;
    ch1: TCheckBox;
    ch2: TCheckBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtInicial3: TMaskEdit;
    edtFinal3: TMaskEdit;
    pnLoja1: TPanel;
    pnLoja2: TPanel;
    ch3: TCheckBox;
    chSalto: TCheckBox;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtInicial1DblClick(Sender: TObject);
    procedure edtInicial1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial1Enter(Sender: TObject);
    procedure edtInicial1Exit(Sender: TObject);
    procedure edtFinal1DblClick(Sender: TObject);
    procedure edtFinal1Enter(Sender: TObject);
    procedure edtFinal1Exit(Sender: TObject);
    procedure edtFinal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure edtInicial3Enter(Sender: TObject);
    procedure edtInicial3DblClick(Sender: TObject);
    procedure edtInicial3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3DblClick(Sender: TObject);
    procedure edtFinal3Enter(Sender: TObject);
    procedure edtInicial3Exit(Sender: TObject);
    procedure edtFinal3Exit(Sender: TObject);
    procedure ch3Click(Sender: TObject);
    procedure ch3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparEdits;
  end;

var
  frm_RelRecCheqDev: Tfrm_RelRecCheqDev;

implementation

uses f8Port, unDialogo, principal, funcoes1, funcoes2, mem_prnt, unMensagem,
  F8Lojas;

{$R *.DFM}

procedure Tfrm_RelRecCheqDev.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_RelRecCheqDev.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_RelRecCheqDev.edtInicial1DblClick(Sender: TObject);
begin
  with (frm_f8Port) do
  begin
    left:=287;
    top :=76;
    edit:=edtInicial1;
    btnCadastro.visible:=true;
    showmodal;
  end;
end;

procedure Tfrm_RelRecCheqDev.edtInicial1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal1.setfocus;
  if (key=K_F8) then
    with (frm_f8Port) do
    begin
      left:=287;
      top :=76;
      edit:=edtInicial1;
      btnCadastro.visible:=true;
      showmodal;
    end;
end;

procedure Tfrm_RelRecCheqDev.edtInicial1Enter(Sender: TObject);
begin
  edtInicial1.selectall;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF8Mens.caption:='exibe portadores cadastrados';
end;

procedure Tfrm_RelRecCheqDev.edtInicial1Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtInicial1.text);
  if (codigo<>'') then
  begin
    pnPort1.caption := ProcuraNomePortador (strtofloat(codigo),self);
    edtInicial1.text  := form_nz(strtofloat(codigo),4);
  end
  else
    edtInicial1.text:='0000';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_RelRecCheqDev.edtFinal1DblClick(Sender: TObject);
begin
  with (frm_f8port) do
  begin
    left:=287;
    top:=76;
    edit:=edtFinal1;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_RelRecCheqDev.edtFinal1Enter(Sender: TObject);
begin
  edtFinal1.selectall;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF8Mens.caption:='exibe portadores cadastrados';
end;

procedure Tfrm_RelRecCheqDev.edtFinal1Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtFinal1.text);
  if (codigo<>'') then
  begin
    pnPort2.caption := ProcuraNomePortador (strtofloat(codigo),self);
    edtFinal1.text  := form_nz(strtofloat(codigo),4);
  end
  else
    edtFinal1.text:='9999';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_RelRecCheqDev.edtFinal1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial2.setfocus;
  if (key=K_CIMA) then
    edtInicial1.setfocus;
  if (key=K_F8) then
    with (frm_f8port) do
    begin
      left:=287;
      top:=76;
      edit:=edtFinal1;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
end;

procedure Tfrm_RelRecCheqDev.edtInicial2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_RelRecCheqDev.edtFinal2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_RelRecCheqDev.edtInicial2Exit(Sender: TObject);
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

procedure Tfrm_RelRecCheqDev.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtFinal1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data inicial do recebimento dos cheques: Formato 99/99/9999',10);
end;

procedure Tfrm_RelRecCheqDev.edtFinal2Exit(Sender: TObject);
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

procedure Tfrm_RelRecCheqDev.edtFinal2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial3.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data final do recebimento dos cheques: Formato 99/99/9999',10);
end;

procedure Tfrm_RelRecCheqDev.LimparEdits;
begin
  edtInicial1.text :='';
  edtFinal1.text   :='';
  edtInicial2.text :='';
  edtFinal2.text   :='';
  edtInicial3.text :='';
  edtFinal3.text   :='';
  pnPort1.caption  :='';
  pnPort2.caption  :='';
  pnLoja1.caption  :='';
  pnLoja2.caption  :='';
  ch1.checked      := false;
  habilitaEditRelat(edtInicial1);
  habilitaEditRelat(edtFinal1);
  ch2.checked      := false;
  habilitaEditRelat(edtInicial2);
  habilitaEditRelat(edtFinal2);
  ch3.checked      := false;
  habilitaEditRelat(edtInicial3);
  habilitaEditRelat(edtFinal3);
end;

procedure Tfrm_RelRecCheqDev.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtInicial1.enabled:=true;    
  edtInicial1.setfocus;
  LimparEdits;
end;

{Opcao de listagem do relatorio ****}
procedure Tfrm_RelRecCheqDev.Registrarbaixadodocumento1Click(
  Sender: TObject);
var
  clCheqDevPg: TClassChequeDevPg;
  data1,data2,port1,port2,loja1,loja2: String;
  tipoport,nomeclie,cnpj: String;
  indGauge,totGauge: Integer;
  dif,totvaldata1,totvaldata2,totvalport1,totvalport2,portant: Real;
  totvalorgeral1,totvalorgeral2: Real;
  dataant: TDateTime;
begin
  {CRITICA ÀS DATAS}
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data dos recebimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data dos recebimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end
  else
  begin
    {FORMATACAO DE ENTRDAS DOS DADOS ***}
    if (Trim(edtInicial1.text)='') and (not ch1.checked) then
      edtInicial1.text:='0000';
    if (Trim(edtFinal1.text)='') and (not ch1.checked) then
      edtFinal1.text:='9999';
    if (edtInicial2.text='  /  /    ') and (not ch2.checked) then
      edtInicial2.text:='01/01/1900';
    if (edtFinal2.text='  /  /    ') and (not ch2.checked) then
      edtFinal2.text:='31/12/5000';
    if (edtInicial3.text='') and (not ch3.checked) then
      edtInicial3.text:='00';
    if (edtFinal3.text='') and (not ch3.checked) then
      edtFinal3.text:='99';

    {filtros que serao aplicados ao cheques}
    if (ch1.checked) then
    begin
      port1  := '00';
      port2  := '99999';
    end
    else
    begin
      port1  := Trim(edtInicial1.text);
      port2  := Trim(edtFinal1.text);
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
      loja2  := '99';
    end
    else
    begin
      loja1  := Trim(edtInicial3.text);
      loja2  := Trim(edtFinal3.text);
    end;

    {iniciando o processamento do relatorio}
    mostra_mensagem ('Preparando relatório...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clCheqDevPg := TClassChequeDevPg.Create;
    with (clCheqDevPg) do
    begin
      conect ('CREDITO', self);
      ClearSql;
      AddParam ('Select CH_CCGC,CH_DTCT,CH_DVTO,CH_PORT,CH_LOJA,CH_VALO,      ');
      AddParam ('       CH_ALIN,CH_DTEM,CH_NUME,CH_BANC,CH_STAT,CH_CLIE,      ');
      AddParam ('       CH_NOME,CH_DTPG,CH_VAPG,CH_OBS,CH_POR2                ');
      AddParam ('From   CRECHDVPG                                             ');
      AddParam ('Where (CH_DTPG>='+chr(39)+data1+chr(39)+') AND               ');
      AddParam ('      (CH_DTPG<='+chr(39)+data2+chr(39)+') AND               ');
      AddParam ('      (CH_LOJA>='+loja1+') AND (CH_LOJA<='+loja2+') AND      ');
      AddParam ('      (CH_POR2>='+port1+') AND (CH_POR2<='+port2+')          ');
      AddParam ('Order By CH_POR2,CH_DTPG                                     ');
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Cheques devolvidos',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      end
      else
      begin
        with (frm_mem_print) do
        begin
                  {configurando o gerador de relatorios}
          PrepareReport;
          frm_principal.x_col_impressao := 132;
          frm_principal.x_arq_impressao := 'o04.rel';
          frm_principal.x_comando       := '15c';
          frm_principal.x_tam_fonte     := 8;
          Title:= 'RELAÇÃO DE RECEBIMENTO DE CHEQUES DEVOLVIDOS';

                  {iniciando impressao}
          if (not chSalto.checked) then
          begin
            if (ch1.checked) then
              AddLine('Portador............: TODOS OS PORTADORES')
            else
              AddLine('Portador............: '+port1+' a '+port2);
            if (ch2.checked) then
              AddLine('Data recebimento....: TODOS AS PRESTACOES ')
            else
              AddLine('Data recebimento....: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
            if (ch3.checked) then
              AddLine('Loja do cheque......: TODAS AS LOJAS     ')
            else
              AddLine('Loja do cheque......: '+loja1+' a '+loja2);
          end;
          clCheqDevPg.first;
          portant     := -1;
          dataant     := strtodate('01/01/1900');
          totvaldata1 := 0.00;
          totvaldata2 := 0.00;
          totvalport1 := 0.00;
          totvalport2 := 0.00;
          indGauge    := 0;
          totGauge    := clCheqDevPg.reccount;
          while (not clCheqDevPg.eof) do
          begin
                       {ORDEM: Portador/Data}
                       {mudanca de portador ---}
            if (clCheqDevPg.Result('CH_POR2')<>portant) then
            begin
              if (portant<>-1) then
              begin
                                 {subtotal interno da data}
                Addline (form_tc(' ',62,' ')+
                  'Total de '+form_data(dataant)
                  +'.......   '+
                  form_nc (totvaldata1,10)+' '+
                  form_nc (totvaldata2,10));
                dataant  := clCheqDevPg.Result('CH_DTPG');
                totvaldata1 := 0.00;
                totvaldata2 := 0.00;

                                 {subtotal do portador}
                AddLine ('');
                Addline (form_tc(' ',59,' ')+
                  'Total do portador '+form_n(portant,4)
                  +'.......   '+
                  form_nc (totvalport1,10)+' '+
                  form_nc (totvalport2,10));

                totvalport1 := 0.00;
                totvalport2 := 0.00;
                if (chSalto.checked) then
                  AddLine(chr(12)+form_tc(' ',131,' '))
                else
                  AddLine('');
              end;
              portant  := clCheqDevPg.Result('CH_POR2');
              tipoport := ProcuraNomePortador (portant, self);
              if (chSalto.checked) then
              begin
                if (ch1.checked) then
                  AddLine('Portador............: TODOS OS PORTADORES')
                else
                  AddLine('Portador............: '+port1+' a '+port2);
                if (ch2.checked) then
                  AddLine('Data recebimento....: TODOS AS PRESTACOES ')
                else
                  AddLine('Data recebimento....: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
                if (ch3.checked) then
                  AddLine('Loja do cheque......: TODAS AS LOJAS     ')
                else
                  AddLine('Loja do cheque......: '+loja1+' a '+loja2);
              end;
              AddLine (form_tc('-',132,'-'));
              AddLine ('Portador do recebimento: '+form_nz(portant,4)+' - '+tipoport);
              AddLine (form_tc('-',132,'-'));
              AddLine ('Data do   | C H E Q U E   | No. CPF / CGC  |Codigo   Nome do Cliente            | Data    |Valor Total|   Valor do| Valor dos  |%  ');
              AddLine ('Recebto.  | Bco.   Numero |                |                                    |Vencto   |  Recebido |    CHEQUE | Acrescimos |Jm ');
              AddLine (form_tc('-',132,'-'));
            end;

                       {mudanca de data de recebimento ---}
            if (clCheqDevPg.Result('CH_DTPG')<>dataant) then
            begin
              if (dataant<>strtodate('01/01/1900')) then
              begin
                Addline (form_tc(' ',62,' ')+
                  'Total de '+form_data(dataant)
                  +'.......   '+
                  form_nc (totvaldata1,10)+' '+
                  form_nc (totvaldata2,10));
                totvaldata1 := 0.00;
                totvaldata2 := 0.00;
              end;
              dataant  := clCheqDevPg.Result('CH_DTPG');
            end;

                       {imprimindo as linhas ***}
            if (Length(Result('CH_CCGC'))=14) then
              cnpj := ExibeCgc(Result('CH_CCGC'))
            else
              cnpj := ExibeCpf(Result('CH_CCGC'));
            dif := Result('CH_VAPG') - Result('CH_VALO');
            AddLine (form_data (Result('CH_DTPG'))    +' '+
              form_nz   (Result('CH_BANC'),4)  +' '+
              form_n    (Result('CH_NUME'),10) +' '+
              form_t    (cnpj,17)              +' '+
              form_nz   (Result('CH_CLIE'),6)  +' '+
              form_t    (Result('CH_NOME'),27) +' '+
              form_data (Result('CH_DVTO'))    +' '+
              form_nc   (Result('CH_VAPG'),10) +' '+
              form_nc   (Result('CH_VALO'),10) +' '+
              form_nc   (dif,8));
            if (Trim(Result('CH_OBS'))<>'') then
              AddLine (form_tc(' ',44,' ')+' '+Result('CH_OBS'));
            totvaldata1 := totvaldata1 + clCheqDevPg.Result('CH_VAPG');
            totvaldata2 := totvaldata2 + clCheqDevPg.Result('CH_VALO');
            totvalport1 := totvalport1 + clCheqDevPg.Result('CH_VAPG');
            totvalport2 := totvalport2 + clCheqDevPg.Result('CH_VALO');
            totvalorgeral1 := totvalorgeral1 + clCheqDevPg.Result('CH_VALO');
            totvalorgeral2 := totvalorgeral2 + clCheqDevPg.Result('CH_VALO');
            clCheqDevPg.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
                  {totais finais ***}
          Addline (form_tc(' ',62,' ')+
            'Total de '+form_data(dataant)
            +'.......   '+
            form_nc (totvaldata1,10)+' '+
            form_nc (totvaldata2,10));
          AddLine ('');
          Addline (form_tc(' ',59,' ')+
            'Total do portador '+form_n(portant,4)
            +'.......   '+
            form_nc (totvalport1,10)+' '+
            form_nc (totvalport2,10));
          AddLine ('');
          AddLine(form_tc(' ',58,' ')+
            ' Total geral..:                '+form_nc(totvalorgeral1,12)+' '+
            form_nc (totvalorgeral2,10));
          AddLine('');

                  {salto de pagina}
          if (frm_principal.x_salto) then
            AddLine(chr(18)+chr(12))
          else
            AddLine(chr(18));
        end;
        frm_mem_print.windowstate:=wsMaximized;
        esconde_mensagem;
        frm_mem_print.showmodal;
      end;
      desconect;
      Free;
    end;
  end;
end;

procedure Tfrm_RelRecCheqDev.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_RelRecCheqDev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

{navegacao---}
procedure Tfrm_RelRecCheqDev.ch1Click(Sender: TObject);
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
    edtInicial1.setfocus;
  end;
end;

{navegacao----}
procedure Tfrm_RelRecCheqDev.ch1KeyDown(Sender: TObject; var Key: Word;
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
    edtInicial1.setfocus;
  end;
end;

{navegacao----}
procedure Tfrm_RelRecCheqDev.ch2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
    edtInicial2.setfocus;
  end;
end;

{navegacao----}
procedure Tfrm_RelRecCheqDev.ch2Click(Sender: TObject);
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
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_RelRecCheqDev.edtInicial3Enter(Sender: TObject);
begin
  edtInicial3.selectall;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_RelRecCheqDev.edtInicial3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtInicial3;
    showmodal;
  end;
end;

procedure Tfrm_RelRecCheqDev.edtInicial3KeyDown(Sender: TObject;
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
    frm_principal.ExibirDica ('   Loja inicial dos cheques: Formato 99',10);
end;

procedure Tfrm_RelRecCheqDev.edtFinal3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfere.click;
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
    frm_principal.ExibirDica ('   Loja final dos cheques: Formato 99',10);
end;

procedure Tfrm_RelRecCheqDev.edtFinal3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtFinal3;
    showmodal;
  end;
end;

procedure Tfrm_RelRecCheqDev.edtFinal3Enter(Sender: TObject);
begin
  edtFinal3.selectall;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_RelRecCheqDev.edtInicial3Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtInicial3.text);
  if (codigo<>'') then
  begin
    pnLoja1.caption := ProcuraNomeLoja (strtofloat(codigo),self);
    edtInicial3.text  := form_nz(strtofloat(codigo),2);
  end
  else
    edtInicial3.text:='00';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_RelRecCheqDev.edtFinal3Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtFinal3.text);
  if (codigo<>'') then
  begin
    pnLoja2.caption := ProcuraNomeLoja (strtofloat(codigo),self);
    edtFinal3.text  := form_nz(strtofloat(codigo),2);
  end
  else
    edtFinal3.text:='00';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_RelRecCheqDev.ch3Click(Sender: TObject);
begin
  if (ch3.checked) then
  begin
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
    edtInicial3.setfocus;
  end;
end;

procedure Tfrm_RelRecCheqDev.ch3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch3.checked) then
  begin
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
    edtInicial3.setfocus;
  end;
end;

end.
