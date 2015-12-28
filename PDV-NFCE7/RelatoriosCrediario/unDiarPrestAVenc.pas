unit unDiarPrestAVenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Menus, ExtCtrls, dbTables;

type
  Tfrm_DiarPrestAVenc = class(TForm)
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
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtInicial3: TMaskEdit;
    edtFinal3: TMaskEdit;
    pnLoja1: TPanel;
    pnLoja2: TPanel;
    gContrato: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtInicial2: TMaskEdit;
    edtFinal2: TMaskEdit;
    gPlano: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    edtInicial1: TMaskEdit;
    edtFinal1: TMaskEdit;
    pnPlano1: TPanel;
    pnPlano2: TPanel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edtInicial4: TMaskEdit;
    edtFinal4: TMaskEdit;
    ch1: TCheckBox;
    ch2: TCheckBox;
    ch3: TCheckBox;
    ch4: TCheckBox;
    chResumo: TCheckBox;
    chSalto: TCheckBox;
    rdOrdem: TRadioGroup;
    chStat: TCheckBox;
    chSoResumo: TCheckBox;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure edtInicial1Click(Sender: TObject);
    procedure edtInicial1Exit(Sender: TObject);
    procedure edtFinal1Exit(Sender: TObject);
    procedure edtInicial1Enter(Sender: TObject);
    procedure edtFinal1Enter(Sender: TObject);
    procedure edtInicial1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtInicial3DblClick(Sender: TObject);
    procedure edtInicial3Enter(Sender: TObject);
    procedure edtInicial3Exit(Sender: TObject);
    procedure edtInicial3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3DblClick(Sender: TObject);
    procedure edtFinal3Enter(Sender: TObject);
    procedure edtFinal3Exit(Sender: TObject);
    procedure edtFinal3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial4Enter(Sender: TObject);
    procedure edtFinal4Enter(Sender: TObject);
    procedure edtInicial4Exit(Sender: TObject);
    procedure edtFinal4Exit(Sender: TObject);
    procedure edtInicial4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure edtFinal1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch3Click(Sender: TObject);
    procedure ch3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch4Click(Sender: TObject);
    procedure ch4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chSoResumoClick(Sender: TObject);
    procedure chSoResumoExit(Sender: TObject);
    procedure chResumoExit(Sender: TObject);
    procedure chResumoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    plano1,plano2,data1,data2,loja1,loja2,data3,data4: String;
    procedure ImprimeCabecalho;
    procedure LimparEdits;
  end;

var
  frm_DiarPrestAVenc: Tfrm_DiarPrestAVenc;

implementation

{$R *.DFM}

uses prestcontrato, funcoes1, funcoes2, principal, unDialogo, mem_prnt,
  f8planos, F8Lojas, cliente, procura, unMensagem, DM15;

procedure Tfrm_DiarPrestAVenc.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_DiarPrestAVenc.SAIR1Click(Sender: TObject);
begin
  close;
end;

{Opcao de impressao do relatorio ***}
procedure Tfrm_DiarPrestAVenc.Registrarbaixadodocumento1Click(Sender: TObject);
var
  consulta: TQuery;
  clPrestCont: TClassPrestContrat;
  indGauge,totGauge,lojaant: Integer;
  vencant: TDateTime;
  perc1,total1,totvalorloja,totvalor: Real;
  nomeloja,nome,ordemSec: String;
  flagLoja: Boolean;
begin
  {CRITICA AS DATAS}
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end
  else
  if (not IsDate (edtInicial4.text) and (edtInicial4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data dos vencimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial4.setfocus;
  end
  else
  if (not IsDate (edtFinal4.text) and (edtFinal4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data dos vencimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal4.setfocus;
  end
  else
  begin
    {FORMATACAO DOS DADOS DE ENTRADA}
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
    if (not chSoResumo.checked) then
    begin
      if (frmDialogo.ExibirMensagem ('Separar vencimentos por loja?',
        'Diario de Prestações a Vencer',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
        250,200)=mrYes) then
        flagLoja:=true
      else
        flagLoja:=false;
    end
    else
      flagloja:=false;

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
      loja2  := '99999';
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
    if (rdOrdem.itemindex=0) then
      ordemSec := 'CL_NOME'
    else
    if (rdOrdem.itemindex=1) then
      ordemSec := 'PC_CLIE'
    else
    if (rdOrdem.itemindex=2) then
      ordemSec := 'PC_CONT';

    {iniciando o processamento do relatorio}
    mostra_mensagem ('Preparando relatório...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clPrestCont := TClassPrestContrat.Create;
    with (clPrestCont) do
    begin
      conect   ('CREDITO', self);
      ClearSql;
      AddParam ('Select PC_LOJA,PC_CONT,PC_CLIE,PC_NPRE,PC_PORT,PC_TPRE,       ');
      AddParam ('       PC_VALO,PC_DCON,PC_DVTO,PC_FATO,PC_AVAL,PC_PLAN        ');
      if (rdOrdem.itemindex=0) then
        AddParam ('From   CREPRABR,CRECTABR,CRECLI                          ')
      else
        AddParam ('From   CREPRABR,CRECTABR                                 ');
      AddParam ('Where (PC_PLAN>='+plano1+')  AND (PC_PLAN<='+plano2+')  AND   ');
      AddParam ('      (PC_DCON>='+chr(39)+data1+chr(39)+') AND                ');
      AddParam ('      (PC_DCON<='+chr(39)+data2+chr(39)+') AND                ');
      AddParam ('      (PC_LOJA>='+loja1+')   AND (PC_LOJA<='+loja2+')   AND   ');
      AddParam ('      (PC_DVTO>='+chr(39)+data3+chr(39)+') AND                ');
      AddParam ('      (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI) AND             ');
      AddParam ('      (PC_DVTO<='+chr(39)+data4+chr(39)+')                    ');
      if (rdOrdem.itemindex=0) then
        AddParam ('    AND (CL_CODI=CR_CLIE)                                  ');
      if (chStat.checked) then
        AddParam ('    AND (PC_STAT='+chr(39)+'0'+chr(39)+')                  ');
      if (flagLoja) then
        AddParam ('Order By PC_LOJA,PC_DVTO,'+ordemSec+'                    ')
      else
        AddParam ('Order By PC_DVTO,'+ordemSec+'                            ');
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Diário de Prestações a Vencer',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      end
      else
      begin
        with (frm_mem_print) do
        begin
                 {configurando o gerador de relatorios}
          PrepareReport;
          frm_principal.x_col_impressao := 80;
          frm_principal.x_arq_impressao := 'g02.rel';
          frm_principal.x_comando       := '12c';
          frm_principal.x_tam_fonte     := 12;
          Title:= 'DIÁRIO DE PRESTAÇÕES A VENCER';
          frm_mem_print.flagPodeImprimir := (not chSoResumo.checked); {*}

                 {iniciando impressao}
          if (not chSalto.checked) then
            ImprimeCabecalho
          else
          if (not flagloja) then
            ImprimeCabecalho;
          if (not flagLoja) then
          begin
            AddLine (form_tc('-',80,'-'));
            AddLine ('Data de |Docto.   Numero  | Data do  |                         |No.da|  Valor da');
            AddLine (' Vencto |Lj   Cli   Ctr   | Contrato |Nome do Cliente          |Prest| Prestacao');
            AddLine (form_tc('-',80,'-'));
          end;
          clPrestCont.first;
          vencant      := strtodate('01/01/1900');
          lojaant      := 0;
          totvalor     := 0.00;
          totvalorloja := 0.00;
          indGauge     := 0;
          totGauge     := clPrestCont.reccount;
          while (not clPrestCont.eof) do
          begin
                      {Ordem: LOJA>>data}
                      {encontra loja diferente-}
            if (flagLoja) then
              if (clPrestCont.Result('PC_LOJA')<>lojaant) then
              begin
                if (lojaant<>0) then
                begin
                  AddLine(form_tc('-',80,'-'));
                  AddLine(form_tc(' ',50,' ')
                    +'Total de '+datetostr(vencant)+' '+
                    form_nc(totvalor,10));
                  vencant  := clPrestCont.Result('PC_DVTO');
                  AddLine(form_tc(' ',50,' ')
                    +'Total da loja '+form_n(lojaant,3)+'   '+
                    form_nc(totvalorloja,10));
                  if (chSalto.checked) then
                    AddLine(chr(12)+form_tc(' ',79,' '))
                  else
                    Addline('');
                end;
                totvalor:=0.00;
                totvalorloja:=0.00;
                lojaant  := clPrestCont.Result('PC_LOJA');
                nomeloja := ProcuraNomeLoja (lojaant, self);
                if (chSalto.checked) then
                  ImprimeCabecalho;
                AddLine(form_tc('-',80,'-'));
                AddLine (form_nz(lojaant,3)+' - '+nomeloja);
                AddLine(form_tc('-',80,'-'));
                AddLine ('Data de |Docto.   Numero  | Data do  |                         |No.da|  Valor da');
                AddLine (' Vencto |Lj   Cli   Ctr   | Contrato |Nome do Cliente          |Prest| Prestacao');
                AddLine (form_tc('-',80,'-'));
              end;

                      {separando por data de vencimento ***}
            if (clPrestCont.Result('PC_DVTO')<>vencant) then
            begin
              if (vencant<>strtodate('01/01/1900')) then
              begin
                AddLine(form_tc('-',80,'-'));
                AddLine(form_tc(' ',50,' ')
                  +'Total de '+datetostr(vencant)+' '+
                  form_nc(totvalor,10));
                AddLine('');
              end;
              totvalor := 0.00;
              vencant  := clPrestCont.Result('PC_DVTO');
            end;

                      {impressao das linhas ***}
            nome := ProcuraNomeClienteCod (clPrestCont.Result('PC_CLIE'),self);
            AddLine (form_data (clPrestCont.Result('PC_DVTO'))   +' '+
              form_nz   (clPrestCont.Result('PC_LOJA'),2) +'.'+
              form_nz   (clPrestCont.Result('PC_CLIE'),6) +'.'+
              form_nz   (clPrestCont.Result('PC_CONT'),6) +' '+
              form_data (clPrestCont.Result('PC_DCON'))   +' '+
              form_t    (nome,24)                         +' '+
              form_nz   (clPrestCont.Result('PC_NPRE'),2)+
              '/'+form_nz(clPrestCont.Result('PC_TPRE'),2)+' '+
              form_nc   (clPrestCont.Result('PC_VALO'),10));
            totvalor := totvalor + clPrestCont.Result('PC_VALO');
            totvalorloja := totvalorloja + clPrestCont.Result('PC_VALO');
            clPrestCont.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          AddLine(form_tc('-',80,'-'));
          AddLine(form_tc(' ',50,' ')
            +'Total de '+datetostr(vencant)+' '+
            form_nc(totvalor,10));
          if (flagLoja) then
            AddLine(form_tc(' ',50,' ')
              +'Total da loja '+form_n(lojaant,3)+'   '+
              form_nc(totvalorloja,10));

                 {...}
          frm_mem_print.flagPodeImprimir := true; {*}
          consulta := DMRelatorios.qResumoDiarPrestAVenc;
          if (chResumo.checked) then
          begin
            frm_mem_print.flagPodeImprimir := (not chSoResumo.checked); {*}
            if (chSalto.checked) then
              AddLine(chr(12)+form_tc(' ',79,' '))
            else
              Addline('');
            frm_mem_print.flagPodeImprimir := true; {*}
            consulta.sql.clear;
            consulta.sql.Add ('Select PC_LOJA,SUM(PC_VALO) as TOTVALOR                      ');
            consulta.sql.Add ('From   CREPRABR,CRECTABR                                     ');
            consulta.sql.Add ('Where (PC_PLAN>='+plano1+')  AND (PC_PLAN<='+plano2+')  AND  ');
            consulta.sql.Add ('      (PC_DCON>='+chr(39)+data1+chr(39)+') AND               ');
            consulta.sql.Add ('      (PC_DCON<='+chr(39)+data2+chr(39)+') AND               ');
            consulta.sql.Add ('      (PC_LOJA>='+loja1+')   AND (PC_LOJA<='+loja2+')   AND  ');
            consulta.sql.Add ('      (PC_DVTO>='+chr(39)+data3+chr(39)+') AND               ');
            consulta.sql.Add ('      (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI) AND            ');
            consulta.sql.Add ('      (PC_DVTO<='+chr(39)+data4+chr(39)+')                   ');
            if (chStat.checked) then
              consulta.sql.Add ('  AND (PC_STAT='+chr(39)+'0'+chr(39)+')                   ');
            consulta.sql.Add ('Group By PC_LOJA                                             ');
            mostra_mensagem ('Preparando resumo do relatório...Aguarde!');
            frm_mensagem.painel.visible:=true;
            frm_mensagem.gauge1.progress:=0;
            consulta.open;
            if (consulta.recordcount<>0) then
            begin
                 {totalizando colunas}
              indGauge := 0;
              totGauge:=consulta.recordcount;
              consulta.first;
              total1   :=0.00;
              while (not consulta.eof) do
              begin
                total1 := total1 + consulta.fieldbyname('TOTVALOR').AsFloat;
                consulta.next;
                indGauge:=indGauge+1;
                frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
                frm_mensagem.gauge1.refresh;
              end;

                 {Exibindo o resumo}
              if (chSalto.checked) then
                ImprimeCabecalho;
              AddLine ('(Resumo geral)');
              AddLine (form_tc('-',80,'-'));
              AddLine ('Nome da Loja           Codigo|   Valor total   % Part ');
              AddLine (form_tc('-',80,'-'));
              consulta.first;
              indGauge  := 0;
              totGauge  := consulta.recordcount;
              while (not consulta.eof) do
              begin
                if (total1<>0.00) then
                  perc1 := (consulta.fieldbyname('TOTVALOR').AsFloat/total1)*100
                else
                  perc1 := 0.00;
                AddLine(form_t   (ProcuraNomeLoja(consulta.fieldbyname('PC_LOJA').AsFloat,self),25)+' '+
                  form_nz  (consulta.fieldbyname('PC_LOJA').AsFloat,2)+''+
                  form_nc  (consulta.fieldbyname('TOTVALOR').AsFloat,16)+' '+
                  form_nc2 (perc1,6,2));
                consulta.next;
                indGauge:=indGauge+1;
                frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
                frm_mensagem.gauge1.refresh;
              end;
              AddLine(form_tc('-',80,'-'));
              AddLine('Total da empresa...:      '+form_nc(total1,18));
              AddLine('');
            end;
          end;

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

procedure Tfrm_DiarPrestAVenc.edtInicial1Click(Sender: TObject);
begin
  with (frm_f8planos) do
  begin
    edit := edtInicial1;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_DiarPrestAVenc.edtInicial1Exit(Sender: TObject);
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
  begin
    edtInicial1.text:='0000';
    pnPlano1.caption:='';
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarPrestAVenc.edtFinal1Exit(Sender: TObject);
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
  begin
    edtFinal1.text:='9999';
    pnPlano2.caption:='';
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarPrestAVenc.edtInicial1Enter(Sender: TObject);
begin
  edtInicial1.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe planos cadastrados';
end;

procedure Tfrm_DiarPrestAVenc.edtFinal1Enter(Sender: TObject);
begin
  edtFinal1.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe planos cadastrados';
end;

procedure Tfrm_DiarPrestAVenc.edtInicial1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal1.setfocus;
  if (key=K_F8) then
    with (frm_f8planos) do
    begin
      edit:=edtInicial1;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano de pagto. inicial: Formato 999',10);
end;

procedure Tfrm_DiarPrestAVenc.edtFinal1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial2.setfocus;
  if (key=K_CIMA) then
    edtInicial1.setfocus;
  if (key=K_F8) then
    with (frm_f8planos) do
    begin
      edit:=edtFinal1;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano de pagto. final: Formato 999',10);
end;

procedure Tfrm_DiarPrestAVenc.edtInicial2Enter(Sender: TObject);
begin
  edtInicial2.selectall;
end;

procedure Tfrm_DiarPrestAVenc.edtInicial2Exit(Sender: TObject);
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

procedure Tfrm_DiarPrestAVenc.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtFinal1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data inicial dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarPrestAVenc.edtFinal2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial3.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data final dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarPrestAVenc.edtFinal2Enter(Sender: TObject);
begin
  edtFinal2.selectall;
end;

procedure Tfrm_DiarPrestAVenc.edtFinal2Exit(Sender: TObject);
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

procedure Tfrm_DiarPrestAVenc.edtInicial3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtInicial3;
    showmodal;
  end;
end;

procedure Tfrm_DiarPrestAVenc.edtInicial3Enter(Sender: TObject);
begin
  edtInicial3.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_DiarPrestAVenc.edtInicial3Exit(Sender: TObject);
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
  begin
    edtInicial3.text:='000';
    pnLoja1.caption:='';
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarPrestAVenc.edtInicial3KeyDown(Sender: TObject;
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

procedure Tfrm_DiarPrestAVenc.edtFinal3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtFinal3;
    showmodal;
  end;
end;

procedure Tfrm_DiarPrestAVenc.edtFinal3Enter(Sender: TObject);
begin
  edtFinal3.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_DiarPrestAVenc.edtFinal3Exit(Sender: TObject);
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
  begin
    edtFinal3.text:='999';
    pnLoja2.caption:='';
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarPrestAVenc.edtFinal3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure Tfrm_DiarPrestAVenc.edtInicial4Enter(Sender: TObject);
begin
  edtInicial4.selectall;
end;

procedure Tfrm_DiarPrestAVenc.edtFinal4Enter(Sender: TObject);
begin
  edtFinal4.selectall;
end;

procedure Tfrm_DiarPrestAVenc.edtInicial4Exit(Sender: TObject);
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

procedure Tfrm_DiarPrestAVenc.edtFinal4Exit(Sender: TObject);
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

procedure Tfrm_DiarPrestAVenc.edtInicial4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal4.setfocus;
  if (key=K_CIMA) then
    edtFinal3.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de vencimento das prestações: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarPrestAVenc.edtFinal4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfere.click;
  if (key=K_CIMA) then
    edtInicial4.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de vencimento das prestações: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarPrestAVenc.FormActivate(Sender: TObject);
begin
  edtInicial1.enabled:=true;
  edtInicial1.setfocus;
end;

procedure Tfrm_DiarPrestAVenc.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_DiarPrestAVenc.edtFinal1Click(Sender: TObject);
begin
  with (frm_f8planos) do
  begin
    edit := edtFinal1;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_DiarPrestAVenc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

{Opcao de limpeza do formulario ***}
procedure Tfrm_DiarPrestAVenc.Limparformulrio1Click(Sender: TObject);
begin
  limparEdits;
  edtInicial1.enabled:=true;   
  edtInicial1.setfocus;
  LimparEdits;
end;

procedure Tfrm_DiarPrestAVenc.LimparEdits;
begin
  edtInicial1.text :='';
  edtFinal1.text   :='';
  edtInicial2.text :='';
  edtFinal2.text   :='';
  edtInicial3.text :='';
  edtFinal3.text   :='';
  edtInicial4.text :='';
  edtFinal4.text   :='';
  pnPlano1.caption :='';
  pnPlano2.caption :='';
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
  ch4.checked      := false;
  habilitaEditRelat(edtInicial4);
  habilitaEditRelat(edtFinal4);
end;

{navegacao---}
procedure Tfrm_DiarPrestAVenc.ch1Click(Sender: TObject);
begin
  if (ch1.checked) then
  begin
    edtInicial1.text:='';
    edtFinal1.text:='';
    pnPlano1.caption:='';
    pnPlano2.caption:='';
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
procedure Tfrm_DiarPrestAVenc.ch1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch1.checked) then
  begin
    edtInicial1.text:='';
    edtFinal1.text:='';
    pnPlano1.caption:='';
    pnPlano2.caption:='';
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
procedure Tfrm_DiarPrestAVenc.ch2Click(Sender: TObject);
begin
  if (ch2.checked) then
  begin
    edtInicial2.text:='';
    edtFinal2.text:='';
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

{navegacao---}
procedure Tfrm_DiarPrestAVenc.ch2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch2.checked) then
  begin
    edtInicial2.text:='';
    edtFinal2.text:='';
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
procedure Tfrm_DiarPrestAVenc.ch3Click(Sender: TObject);
begin
  if (ch3.checked) then
  begin
    edtInicial3.text:='';
    edtFinal3.text:='';
    pnLoja1.caption:='';
    pnLoja2.caption:='';
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
    edtInicial4.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
    edtInicial3.setfocus;
  end;
end;

{navegacao----}
procedure Tfrm_DiarPrestAVenc.ch3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch3.checked) then
  begin
    edtInicial3.text:='';
    edtFinal3.text:='';
    pnLoja1.caption:='';
    pnLoja2.caption:='';
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
    edtInicial4.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
    edtInicial3.setfocus;
  end;
end;

{navegacao---}
procedure Tfrm_DiarPrestAVenc.ch4Click(Sender: TObject);
begin
  if (ch4.checked) then
  begin
    edtInicial4.text:='';
    edtFinal4.text:='';
    desabilitaEditRelat(edtInicial4);
    desabilitaEditRelat(edtFinal4);
  end
  else
  begin
    habilitaEditRelat(edtInicial4);
    habilitaEditRelat(edtFinal4);
    edtInicial4.setfocus;
  end;
end;

{navegacao---}
procedure Tfrm_DiarPrestAVenc.ch4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch4.checked) then
  begin
    desabilitaEditRelat(edtInicial4);
    desabilitaEditRelat(edtFinal4);
  end
  else
  begin
    habilitaEditRelat(edtInicial4);
    habilitaEditRelat(edtFinal4);
    edtInicial4.setfocus;
  end;
end;

procedure Tfrm_DiarPrestAVenc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_principal.x_ordem_diario_prest1 := rdOrdem.itemindex;
end;

procedure Tfrm_DiarPrestAVenc.FormCreate(Sender: TObject);
begin
  rdOrdem.itemindex := frm_principal.x_ordem_diario_prest1;
end;

procedure Tfrm_DiarPrestAVenc.chSoResumoClick(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_DiarPrestAVenc.chSoResumoExit(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_DiarPrestAVenc.chResumoExit(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

procedure Tfrm_DiarPrestAVenc.chResumoClick(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

procedure Tfrm_DiarPrestAVenc.ImprimeCabecalho;
begin
  if (ch1.checked) then
    frm_mem_print.AddLine('Plano...............: TODOS OS PLANOS')
  else
    frm_mem_print.AddLine('Plano...............: '+plano1+' a '+plano2);
  if (ch2.checked) then
    frm_mem_print.AddLine('Data dos contratos..: TODOS OS CONTRATOS')
  else
    frm_mem_print.AddLine('Data dos contratos..: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
  if (ch3.checked) then
    frm_mem_print.AddLine('Loja................: TODAS AS LOJAS')
  else
    frm_mem_print.Addline ('Loja................: '+loja1+' a '+loja2);
  if (ch4.checked) then
    frm_mem_print.AddLine('Data do vencimento..: TODOS OS CONTRATOS')
  else
    frm_mem_print.AddLine('Data do vencimento..: '+Trim(edtInicial4.text)+' a '+Trim(edtFinal4.text));
  if (rdOrdem.itemindex=0) then
    frm_mem_print.AddLine('Ordem da listagem...: NOME DO CLIENTE    ')
  else
  if (rdOrdem.itemindex=1) then
    frm_mem_print.AddLine('Ordem da listagem...: CÓDIGO DO CLIENTE  ')
  else
  if (rdOrdem.itemindex=2) then
    frm_mem_print.AddLine('Ordem da listagem...: CÓDIGO DO CONTRATO ');
  if (chStat.checked) then
    frm_mem_print.AddLine('Situacao prestacoes.: SOMENTE PRESTACOES EM ABERTO')
  else
    frm_mem_print.AddLine('Situacao prestacoes.: TODAS AS PRESTACOES');
end;

end.
