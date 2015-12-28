unit unDiarEmiCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, ExtCtrls, dbTables;

type
  Tfrm_DiarEmiCont = class(TForm)
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
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    ch1: TCheckBox;
    ch2: TCheckBox;
    ch3: TCheckBox;
    rdOrdem: TRadioGroup;
    chResumo: TCheckBox;
    chSalto: TCheckBox;
    chSoResumo: TCheckBox;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure edtInicial1Enter(Sender: TObject);
    procedure edtFinal1Enter(Sender: TObject);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtInicial3Enter(Sender: TObject);
    procedure edtFinal3Enter(Sender: TObject);
    procedure edtInicial1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial1Exit(Sender: TObject);
    procedure edtInicial1DblClick(Sender: TObject);
    procedure edtFinal1DblClick(Sender: TObject);
    procedure edtFinal1Exit(Sender: TObject);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtInicial3Exit(Sender: TObject);
    procedure edtFinal3Exit(Sender: TObject);
    procedure edtInicial3DblClick(Sender: TObject);
    procedure edtFinal3DblClick(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chSoResumoClick(Sender: TObject);
    procedure chSoResumoExit(Sender: TObject);
    procedure chResumoClick(Sender: TObject);
    procedure chResumoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparEdits;
  end;

var
  frm_DiarEmiCont: Tfrm_DiarEmiCont;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,contratos, f8planos, F8Lojas, unDialogo,
  mem_prnt, procura, unMensagem, DM15;

procedure Tfrm_DiarEmiCont.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_DiarEmiCont.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_DiarEmiCont.edtInicial1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_DiarEmiCont.edtFinal1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_DiarEmiCont.edtInicial2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_DiarEmiCont.edtFinal2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_DiarEmiCont.edtInicial3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_DiarEmiCont.edtFinal3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_DiarEmiCont.edtInicial1KeyDown(Sender: TObject;
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

procedure Tfrm_DiarEmiCont.edtFinal1KeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_DiarEmiCont.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtFinal1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data inicial dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarEmiCont.edtFinal2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial3.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data final dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarEmiCont.edtInicial3KeyDown(Sender: TObject;
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

procedure Tfrm_DiarEmiCont.edtFinal3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
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
    frm_principal.ExibirDica ('   Código da loja final: Formato 999',10);
end;

procedure Tfrm_DiarEmiCont.edtInicial1Exit(Sender: TObject);
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

procedure Tfrm_DiarEmiCont.edtInicial1DblClick(Sender: TObject);
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

procedure Tfrm_DiarEmiCont.edtFinal1DblClick(Sender: TObject);
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

procedure Tfrm_DiarEmiCont.edtFinal1Exit(Sender: TObject);
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

procedure Tfrm_DiarEmiCont.edtInicial2Exit(Sender: TObject);
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

procedure Tfrm_DiarEmiCont.edtFinal2Exit(Sender: TObject);
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

procedure Tfrm_DiarEmiCont.edtInicial3Exit(Sender: TObject);
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
    edtInicial3.text:='0000';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarEmiCont.edtFinal3Exit(Sender: TObject);
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
    edtFinal3.text:='9999';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarEmiCont.edtInicial3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtInicial3;
    showmodal;
  end;
end;

procedure Tfrm_DiarEmiCont.edtFinal3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtFinal3;
    showmodal;
  end;
end;

procedure Tfrm_DiarEmiCont.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtInicial1.enabled:=true;
  edtInicial1.setfocus;
  LimparEdits;
end;

procedure Tfrm_DiarEmiCont.LimparEdits;
begin
  edtInicial1.text:='';
  edtInicial2.text:='';
  edtInicial3.text:='';
  edtFinal1.text:='';
  edtFinal2.text:='';
  edtFinal3.text:='';
  pnPlano1.caption:='';
  pnPlano2.caption:='';
  pnLoja1.caption:='';
  pnLoja2.caption:='';
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

{Opcao de impressao do relatorio ***}
procedure Tfrm_DiarEmiCont.Registrarbaixadodocumento1Click(
  Sender: TObject);
var
  consulta: TQuery;
  clCont: TClassContrato;
  nomeloja,plano1,plano2,data1,data2,loja1,loja2: String;
  indGauge,totGauge,lojaant: Integer;
  ordemSec,nome: String;
  dataant: TDateTime;
  totcontdata,totvaldata,totventdata,totpagodata,totrecedata: Real;
  totcontloja,totvalloja,totventloja,totpagoloja,totreceloja: Real;
  flagLiq: Boolean;
  perc1,perc2,perc3,perc4,perc5: Real;
  total1,total2,total4,total5: Real;
  qtpre,total3: Integer;
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

    {Perguntas anteriores a execucao**}
    if (frmDialogo.ExibirMensagem ('Imprime contratos liquidados?',
      'Diario de Emissão de Contratos',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
      flagLiq:=true
    else
      flagLiq:=false;

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
    if (rdOrdem.itemindex=0) then
      ordemSec := 'CL_NOME'
    else
    if (rdOrdem.itemindex=1) then
      ordemSec := 'CR_CLIE'
    else
    if (rdOrdem.itemindex=2) then
      ordemSec := 'CR_CODI';

    {iniciando o processamento do relatorio}
    mostra_mensagem ('Preparando relatório...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clCont := TClassContrato.Create;
    with (clCont) do
    begin
      conect   (databasecredito, self);
      ClearSql;
      AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_SERI,CR_DNOT,CR_AVAL,CR_PORT,CR_NOTA,  ');
      AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_CARN,CR_FICH,  ');
      AddParam ('       CR_VDEV                                                           ');
      AddParam ('From   CRECTABR                                                          ');
      if (rdOrdem.itemindex=0) then
        AddParam('     LEFT OUTER JOIN CRECLI ON (CL_CODI=CR_CLIE)                       ');
      AddParam ('Where (CR_PLAN>='+plano1+')  AND (CR_PLAN<='+plano2+')  AND              ');
      AddParam ('      (CR_DNOT>='+chr(39)+data1+chr(39)+') AND                           ');
      AddParam ('      (CR_DNOT<='+chr(39)+data2+chr(39)+') AND                           ');
      AddParam ('      (CR_LOJA>='+loja1+')   AND (CR_LOJA<='+loja2+')                    ');
      if (not flagLiq) then
        AddParam ('AND (CR_PDEV<>0)                                                      ');
      AddParam ('Order By CR_LOJA,CR_DNOT,'+ordemSec+'                                    ');
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Diário de Emissão de Contratos',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      end
      else
      begin
        with (frm_mem_print) do
        begin
                 {configurando o gerador de relatorios}
          PrepareReport;
          frm_principal.x_col_impressao := 132;
          frm_principal.x_comando       := '15c';
          frm_principal.x_arq_impressao := 'g01.rel';
          frm_principal.x_tam_fonte     := 8;
          Title:= 'DIÁRIO DE EMISSÃO DE CONTRATOS';

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
            if (rdOrdem.itemindex=0) then
              AddLine('Ordem da listagem...: NOME DO CLIENTE    ')
            else
            if (rdOrdem.itemindex=1) then
              AddLine('Ordem da listagem...: CÓDIGO DO CLIENTE  ')
            else
            if (rdOrdem.itemindex=2) then
              AddLine('Ordem da listagem...: CÓDIGO DO CONTRATO ');
          end;

                 {...}
          clCont.first;
          lojaant     := -1;
          dataant     := strtodate('01/01/1900');
          totcontdata := 0;
          totvaldata  := 0.00;
          totventdata := 0.00;
          totpagodata := 0.00;
          totrecedata := 0.00;
          totcontloja := 0;
          totvalloja  := 0.00;
          totventloja := 0.00;
          totpagoloja := 0.00;
          totreceloja := 0.00;
          indGauge    := 0;
          totGauge    := clCont.reccount;
          while (not clCont.eof) do
          begin
                      {Ordem: loja>>data}
                      {encontra loja diferente-}
            if (clCont.Result('CR_LOJA')<>lojaant) then
            begin
              if (lojaant<>-1) then
              begin
                AddLine(form_tc('-',132,'-'));
                AddLine('Totais do dia '+datetostr(dataant)+' Contratos abertos '+
                  form_n(totcontdata,10)+'   '+form_nc(totvaldata,13)+
                  ' '+form_nc(totventdata,13)+
                  '                   '+form_nc(totpagodata,13)+
                  ' '+form_nc(totrecedata,13));
                if (clCont.Result('CR_LOJA')=lojaant) then
                  AddLine('');
                totcontdata := 0;
                totvaldata  := 0.00;
                totventdata := 0.00;
                totpagodata := 0.00;
                totrecedata := 0.00;
                dataant := clCont.Result('CR_DNOT');
                AddLine('Totais da loja '+form_n(lojaant,3)+' Contratos abertos..:    '+
                  form_n(totcontloja,10)+'   '+form_nc(totvalloja,13)+
                  ' '+form_nc(totventloja,13)+
                  '                   '+form_nc(totpagoloja,13)+
                  ' '+form_nc(totreceloja,13));
                if (chSalto.checked) then
                  AddLine(chr(12)+form_tc(' ',131,' '))
                else
                  AddLine('');
              end;
              totcontloja := 0;
              totvalloja  := 0.00;
              totventloja := 0.00;
              totpagoloja := 0.00;
              totreceloja := 0.00;
              lojaant  := clCont.Result('CR_LOJA');
              nomeloja := ProcuraNomeLoja (lojaant, self);
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
                if (rdOrdem.itemindex=0) then
                  AddLine('Ordem da listagem...: NOME DO CLIENTE    ')
                else
                if (rdOrdem.itemindex=1) then
                  AddLine('Ordem da listagem...: CÓDIGO DO CLIENTE  ')
                else
                if (rdOrdem.itemindex=2) then
                  AddLine('Ordem da listagem...: CÓDIGO DO CONTRATO ');
              end;
              AddLine(form_tc('-',132,'-'));
              AddLine (form_nz(lojaant,3)+' - '+nomeloja);
              AddLine(form_tc('-',132,'-'));
              AddLine ('CONTRATO NUMERO |                            |  Data  |    Valor    |     Valor     | Parcelamento  do |     Total    |    Total');
              AddLine ('Lj   Cli   Ctr  | Nome do Cliente            |Contrato|  Contrato   |    Entrada    |  Saldo  Devedor  | Pago S/Juros |  A Receber');
              AddLine (form_tc('-',132,'-'));
            end;

                      {data de movimento diferente-}
            if (clCont.Result('CR_DNOT')<>dataant) then
            begin
              if (dataant<>strtodate('01/01/1900')) then
              begin
                AddLine(form_tc('-',132,'-'));
                AddLine('Totais do dia '+datetostr(dataant)+' Contratos abertos '+
                  form_n(totcontdata,10)+'   '+form_nc(totvaldata,13)+
                  ' '+form_nc(totventdata,13)+
                  '                   '+form_nc(totpagodata,13)+
                  ' '+form_nc(totrecedata,13));
              end;
              if (clCont.Result('CR_LOJA')=lojaant) then
                AddLine('');
              totcontdata := 0;
              totvaldata  := 0.00;
              totventdata := 0.00;
              totpagodata := 0.00;
              totrecedata := 0.00;
              dataant := clCont.Result('CR_DNOT');
            end;

                      {imprimindo os registros}
            nome := ProcuraNomeClienteCod (clCont.Result('CR_CLIE'), self);
            if (clCont.Result('CR_QPRE')=0) then
              qtpre:=1
            else
              qtpre:=clCont.Result('CR_QPRE');
            AddLine (form_nz   (clCont.Result('CR_LOJA'),2) +'.'+
              form_nz   (clCont.Result('CR_CLIE'),6) +'.'+
              form_nz   (clCont.Result('CR_CODI'),6) +' '+
              form_t    (nome,28)                    +' '+
              form_data (clCont.Result('CR_DNOT'))   +' '+
              form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'),12) +'  '+
              form_nc   (clCont.Result('CR_VENT'),12)+'  '+
              form_t    (clCont.Result('CR_QPRE'),2) +'x '+
              form_nc   (clCont.Result('CR_TOTA')/qtpre,12)+'  '+
              form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT')-clCont.Result('CR_VDEV'),12)+'  '+
              form_nc   (clCont.Result('CR_VDEV'),12));
            totcontdata := totcontdata + 1;
            totvaldata  := totvaldata  + (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'));
            totventdata := totventdata +  clCont.Result('CR_VENT');
            totpagodata := totpagodata + (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT')-clCont.Result('CR_VDEV'));
            totrecedata := totrecedata +  clCont.Result('CR_VDEV');
            totcontloja := totcontloja + 1;
            totvalloja  := totvalloja  + (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'));
            ;
            totventloja := totventloja + clCont.Result('CR_VENT');
            totpagoloja := totpagoloja + (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT')-clCont.Result('CR_VDEV'));
            totreceloja := totreceloja + clCont.Result('CR_VDEV');
            clCont.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;

                 {total final}
          AddLine(form_tc('-',132,'-'));
          AddLine('Totais do dia '+datetostr(dataant)+' Contratos abertos '+
            form_n(totcontdata,10)+'   '+form_nc(totvaldata,13)+
            ' '+form_nc(totventdata,13)+
            '                   '+form_nc(totpagodata,13)+
            ' '+form_nc(totrecedata,13));
          AddLine('Totais da loja '+form_n(lojaant,3)+' Contratos abertos..:    '+
            form_n(totcontloja,10)+'   '+form_nc(totvalloja,13)+
            ' '+form_nc(totventloja,13)+
            '                   '+form_nc(totpagoloja,13)+
            ' '+form_nc(totreceloja,13));

                 {...}
          consulta := DMRelatorios.qResumoDiarEmiCont;
          if (chResumo.checked) then
          begin
            frm_mem_print.flagPodeImprimir := (not chSoResumo.checked); {*}
            if (chSalto.checked) then
              AddLine(chr(12)+form_tc(' ',131,' '))
            else
              AddLine('');
            frm_mem_print.flagPodeImprimir := true; {*}
            consulta.sql.clear;
            consulta.sql.add('Select CR_LOJA,SUM(CR_TOTA+CR_VENT) as TOTCONT,                          ');
            consulta.sql.add('       SUM(CR_VENT) as TOTENT,                                           ');
            consulta.sql.add('       COUNT(*) as QTDE,                                                 ');
            consulta.sql.add('       SUM(CR_TOTA+CR_VENT-CR_VDEV) as TOTPAGO,                          ');
            consulta.sql.add('       SUM(CR_VDEV) as TOTDEV                                            ');
            consulta.sql.add('From   CRECTABR                                                          ');
            consulta.sql.add('Where (CR_PLAN>='+plano1+')  AND (CR_PLAN<='+plano2+')  AND              ');
            consulta.sql.add('      (CR_DNOT>='+chr(39)+data1+chr(39)+') AND                           ');
            consulta.sql.add('      (CR_DNOT<='+chr(39)+data2+chr(39)+') AND                           ');
            consulta.sql.add('      (CR_LOJA>='+loja1+')   AND (CR_LOJA<='+loja2+')                    ');
            if (not flagLiq) then
              consulta.sql.add(' AND (CR_PDEV<>0)                                  ');
            consulta.sql.add('Group By CR_LOJA                                                         ');
            consulta.open;
            if (consulta.recordcount<>0) then
            begin
                 {totalizando colunas}
              indGauge := 0;
              totGauge:=consulta.recordcount;
              consulta.first;
              total1   :=0.00;
              total2   :=0.00;
              total3   :=0;
              total4   :=0.00;
              total5   :=0.00;
              while (not consulta.eof) do
              begin
                total1 := total1 + consulta.fieldbyname('TOTCONT').AsFloat;
                total2 := total2 + consulta.fieldbyname('TOTENT').AsFloat;
                total3 := total3 + consulta.fieldbyname('QTDE').AsInteger;
                total4 := total4 + consulta.fieldbyname('TOTPAGO').AsFloat;
                total5 := total5 + consulta.fieldbyname('TOTDEV').AsFloat;
                consulta.next;
                indGauge:=indGauge+1;
                frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
                frm_mensagem.gauge1.refresh;
              end;

                 {Exibindo o resumo}
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
                if (rdOrdem.itemindex=0) then
                  AddLine('Ordem da listagem...: NOME DO CLIENTE    ')
                else
                if (rdOrdem.itemindex=1) then
                  AddLine('Ordem da listagem...: CÓDIGO DO CLIENTE  ')
                else
                if (rdOrdem.itemindex=2) then
                  AddLine('Ordem da listagem...: CÓDIGO DO CONTRATO ');
              end;
              AddLine ('(Resumo geral)');
              AddLine (form_tc('-',132,'-'));
              AddLine ('Nome da Loja           Codigo| Qtde  % Part| Tot. Contratos  % Part| Tot. Entradas % Part|   Tot. Pago % Part| Tot. Devido  % Part ');
              AddLine (form_tc('-',132,'-'));
              indGauge  := 0;
              consulta.first;
              while (not consulta.eof) do
              begin
                if (total1<>0.00) then
                  perc1 := Round((consulta.fieldbyname('TOTCONT').AsFloat/total1)*100)
                else
                  perc1:=0.00;
                if (total2<>0.00) then
                  perc2 := Round((consulta.fieldbyname('TOTENT').AsFloat/total2)*100)
                else
                  perc2:=0.00;
                if (total3<>0) then
                  perc3 := Round((consulta.fieldbyname('QTDE').AsInteger/total3)*100)
                else
                  perc3:=0.00;
                if (total4<>0.00) then
                  perc4 := Round((consulta.fieldbyname('TOTPAGO').AsFloat/total4)*100)
                else
                  perc4:=0.00;
                if (total5<>0.00) then
                  perc5 := Round((consulta.fieldbyname('TOTDEV').AsFloat/total5)*100)
                else
                  perc5:=0.00;
                AddLine(form_t  (ProcuraNomeLoja(consulta.fieldbyname('CR_LOJA').AsFloat,self),25)+' '+
                  form_nz (consulta.fieldbyname('CR_LOJA').AsFloat,2)+''+
                  form_n  (consulta.fieldbyname('QTDE').AsInteger,8)+' '+
                  form_nc (perc3,6)  +' '+
                  form_nc (consulta.fieldbyname('TOTCONT').AsFloat,16)+' '+
                  form_nc (perc1,6)  +' '+
                  form_nc (consulta.fieldbyname('TOTENT').AsFloat,14)+' '+
                  form_nc (perc2,6)  +' '+
                  form_nc (consulta.fieldbyname('TOTPAGO').AsFloat,12)+' '+
                  form_nc (perc4,6)  +' '+
                  form_nc (consulta.fieldbyname('TOTDEV').AsFloat,14)+' '+
                  form_nc (perc5,6));
                consulta.next;
              end;
              AddLine(form_tc('-',132,'-'));
              AddLine('Total da empresa...:      '+form_n(total3,10)+' '
                +form_nc(total1,23)+' '+form_nc(total2,21)+' '+form_nc(total4,19)
                +' '+form_nc(total5,21));
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

procedure Tfrm_DiarEmiCont.FormActivate(Sender: TObject);
begin
  edtInicial1.enabled:=true;
  edtInicial1.setfocus;
  edtInicial2.Text := DateTimeToStr(Date);
  edtFinal2.Text := DateTimeToStr(Date);
end;

procedure Tfrm_DiarEmiCont.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_DiarEmiCont.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

{navegacao----}
procedure Tfrm_DiarEmiCont.ch1Click(Sender: TObject);
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

{navegacao---}
procedure Tfrm_DiarEmiCont.ch1KeyDown(Sender: TObject; var Key: Word;
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

{navegacao---}
procedure Tfrm_DiarEmiCont.ch2Click(Sender: TObject);
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

{navegacao---}
procedure Tfrm_DiarEmiCont.ch2KeyDown(Sender: TObject; var Key: Word;
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
    edtInicial2.setfocus;
  end;
end;

{navegacao---}
procedure Tfrm_DiarEmiCont.ch3KeyDown(Sender: TObject; var Key: Word;
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

{navegacao---}
procedure Tfrm_DiarEmiCont.ch3Click(Sender: TObject);
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

procedure Tfrm_DiarEmiCont.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_principal.x_ordem_diario_emissao1 := rdOrdem.itemindex;
end;

procedure Tfrm_DiarEmiCont.FormCreate(Sender: TObject);
begin
  rdOrdem.itemindex := frm_principal.x_ordem_diario_emissao1;
end;

procedure Tfrm_DiarEmiCont.chSoResumoClick(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_DiarEmiCont.chSoResumoExit(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_DiarEmiCont.chResumoClick(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

procedure Tfrm_DiarEmiCont.chResumoExit(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

end.
