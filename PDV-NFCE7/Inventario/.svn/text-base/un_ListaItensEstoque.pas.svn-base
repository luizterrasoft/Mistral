unit un_ListaItensEstoque;

interface
        
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Menus, CheckBoxOO, LabelOO;

type
  Tfrm_ListaItensEstoque = class(TForm)
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
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmarttulo1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    rdIdent: TRadioGroup;
    lbtipz: TLabel;
    chSaldo: TCheckBox;
    edtInicial2: TMaskEdit;
    edtFinal2: TMaskEdit;
    pnGrupo2: TPanel;
    pnGrupo1: TPanel;
    ch2: TCheckBox;
    edtInicial3: TMaskEdit;
    edtFinal3: TMaskEdit;
    ch3: TCheckBox;
    edtInicial4: TMaskEdit;
    edtFinal4: TMaskEdit;
    ch4: TCheckBox;
    edtForn1: TMaskEdit;
    edtForn2: TMaskEdit;
    pnForn2: TPanel;
    pnForn1: TPanel;
    chForn: TCheckBox;
    LabelOO2: TLabelOO;
    LabelOO3: TLabelOO;
    LabelOO4: TLabelOO;
    LabelOO5: TLabelOO;
    LabelOO6: TLabelOO;
    LabelOO7: TLabelOO;
    botao1: TPanel;
    chImprimeSaldo: TCheckBox;
    Bevel1: TBevel;
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch3Click(Sender: TObject);
    procedure ch3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtInicial3Enter(Sender: TObject);
    procedure edtFinal3Enter(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure Confirmarttulo1Click(Sender: TObject);
    procedure edtInicial2DblClick(Sender: TObject);
    procedure edtFinal2DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtInicial4Enter(Sender: TObject);
    procedure edtFinal4Enter(Sender: TObject);
    procedure edtInicial4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch4Click(Sender: TObject);
    procedure ch4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtForn1DblClick(Sender: TObject);
    procedure edtForn2DblClick(Sender: TObject);
    procedure edtForn1Enter(Sender: TObject);
    procedure edtForn2Enter(Sender: TObject);
    procedure edtForn1Exit(Sender: TObject);
    procedure edtForn2Exit(Sender: TObject);
    procedure edtForn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtForn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chFornClick(Sender: TObject);
    procedure chFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial3DblClick(Sender: TObject);
    procedure edtFinal3DblClick(Sender: TObject);
    procedure botao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipz: String;
    procedure LimparEdits;
  end;

var
  frm_ListaItensEstoque: Tfrm_ListaItensEstoque;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, unMensagem, mem_prnt, auxiliar, procura, venda,
  unDialogo, F8Lojas;

procedure Tfrm_ListaItensEstoque.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ListaItensEstoque.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtInicial2.enabled:=true;
  edtInicial2.setfocus;
  LimparEdits;
end;

procedure Tfrm_ListaItensEstoque.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ListaItensEstoque.FormActivate(Sender: TObject);
begin
  if (edtInicial2.enabled) then
    edtInicial2.setfocus;
end;

procedure Tfrm_ListaItensEstoque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lbtipz.visible:=true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='1';
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
end;

procedure Tfrm_ListaItensEstoque.LimparEdits;
begin
  edtInicial2.text:='';
  edtInicial3.text:='';
  edtInicial4.text:='';
  edtFinal2.text:='';
  edtFinal3.text:='';
  edtFinal4.text:='';
  pnGrupo1.caption:='';
  pnGrupo2.caption:='';
  ch2.checked:=false;
  ch3.checked:=false;
  ch4.checked:=false;
  chForn.checked:=false;
  edtForn1.text:='';
  edtForn2.text:='';
  pnForn1.caption:='';
  pnForn2.caption:='';
  habilitaeditVerde(edtInicial2);
  habilitaeditVerde(edtFinal2);
  habilitaeditVerde(edtInicial3);
  habilitaeditVerde(edtFinal3);
  habilitaeditVerde(edtInicial4);
  habilitaeditVerde(edtFinal4);
  habilitaeditVerde(edtForn1);
  habilitaeditVerde(edtForn2);
end;

procedure Tfrm_ListaItensEstoque.ch2Click(Sender: TObject);
begin
  if (not ch2.checked) then
  begin
    habilitaeditVerde(edtInicial2);
    habilitaeditVerde(edtFinal2);
    edtInicial2.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial2);
    desabilitaeditVerde(edtFinal2);
    edtInicial3.setfocus;
  end;
end;

procedure Tfrm_ListaItensEstoque.ch2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not ch2.checked) then
  begin
    habilitaeditVerde(edtInicial2);
    habilitaeditVerde(edtFinal2);
    edtInicial2.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial2);
    desabilitaeditVerde(edtFinal2);
    edtInicial3.setfocus;
  end;
end;

procedure Tfrm_ListaItensEstoque.ch3Click(Sender: TObject);
begin
  if (not ch3.checked) then
  begin
    habilitaeditVerde(edtInicial3);
    habilitaeditVerde(edtFinal3);
    edtInicial3.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial3);
    desabilitaeditVerde(edtFinal3);
    edtInicial4.setfocus;
  end;
end;

procedure Tfrm_ListaItensEstoque.ch3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not ch3.checked) then
  begin
    habilitaeditVerde(edtInicial3);
    habilitaeditVerde(edtFinal3);
    edtInicial3.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial3);
    desabilitaeditVerde(edtFinal3);
    edtInicial4.setfocus;
  end;
end;

procedure Tfrm_ListaItensEstoque.edtInicial2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtFinal2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtInicial3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtFinal3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtInicial2,false);
end;

procedure Tfrm_ListaItensEstoque.edtFinal2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtInicial3.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtFinal2,true);
end;

procedure Tfrm_ListaItensEstoque.edtInicial3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtFinal3.setfocus;
  if (key=K_CIMA) then
    edtFinal2.setfocus;
  if (key=K_F8) then
    ChamandoF8SubGrupos2(edtInicial3,true);
end;

procedure Tfrm_ListaItensEstoque.edtFinal3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial4.setfocus;
  if (key=K_CIMA) then
    edtInicial3.setfocus;
  if (key=K_F8) then
    ChamandoF8SubGrupos2(edtFinal3,true);
end;

procedure Tfrm_ListaItensEstoque.edtInicial2Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtInicial2.text);
  if (codigo<>'') then
  begin
    pnGrupo1.caption:=ProcuraNomeGruposProdutos(strtofloat(codigo),self);
    edtInicial2.text:=form_nz(strtofloat(codigo),2);
  end
  else
    pnGrupo1.caption:='';
end;


procedure Tfrm_ListaItensEstoque.edtFinal2Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtFinal2.text);
  if (codigo<>'') then
  begin
    pnGrupo2.caption:=ProcuraNomeGruposProdutos(strtofloat(codigo),self);
    edtFinal2.text:=form_nz(strtofloat(codigo),2);
  end
  else
    pnGrupo2.caption:='';
end;

{Listagem de itens em estoque ****}
procedure Tfrm_ListaItensEstoque.Confirmarttulo1Click(Sender: TObject);
var
  clAux,clAux2,clAux3: TClassAuxiliar;
  total_itens_loja,total_itens,total_itens_forn: Integer;
  loja1,loja2,grupo1,grupo2,subgrupo1,subgrupo2: String;
  forn1,forn2,descricao,refint,unidade: String;
  produto1,produto2: String;
  totloja_totalcusto,totloja_totalvenda: Real;
  totforn_totalcusto,totforn_totalvenda: Real;
  tot_totalcusto,tot_totalvenda: Real;
  lojaant,fornant: Real;
  total_qtde_loja,total_qtde_forn,total_qtde: Real;
  grupo,subgrupo,produto,cor: Real;
  codigobarras,tamanho,tam: String;
  total_custo,total_venda,dif,margem: Real;
  saldo,preco_custo,preco_venda: Real;
  indGauge,totGauge: Integer;
  total_totalvenda: Real;
  reffabric: String;
begin
    {FORMATACAO DOS DADOS DE ENTRADA}
  if (Trim(edtInicial2.text)='') and (not ch2.checked) then
    edtInicial2.text:='00';
  if (Trim(edtFinal2.text)='') and (not ch3.checked) then
    edtFinal2.text:='99';
  if (Trim(edtInicial3.text)='') and (not ch3.checked) then
    edtInicial3.text:='00';
  if (Trim(edtFinal3.text)='') and (not ch3.checked) then
    edtFinal3.text:='99';
  if (Trim(edtInicial4.text)='') and (not ch4.checked) then
    edtInicial4.text:='0000';
  if (Trim(edtFinal4.text)='') and (not ch4.checked) then
    edtFinal4.text:='9999';
  if (Trim(edtForn1.text)='') and (not chForn.checked) then
    edtForn1.text:='000000';
  if (Trim(edtForn2.text)='') and (not chForn.checked) then
    edtForn2.text:='999999';

    {Puxando os filtros}
  if (ch2.checked) then
  begin
    grupo1  := '000';
    grupo2  := '999';
  end
  else
  begin
    grupo1  := Trim(edtInicial2.text);
    grupo2  := Trim(edtFinal2.text);
  end;
  if (ch3.checked) then
  begin
    subgrupo1  := '000';
    subgrupo2  := '999';
  end
  else
  begin
    subgrupo1  := Trim(edtInicial3.text);
    subgrupo2  := Trim(edtFinal3.text);
  end;
  if (ch4.checked) then
  begin
    produto1  := '000';
    produto2  := '999';
  end
  else
  begin
    produto1  := Trim(edtInicial4.text);
    produto2  := Trim(edtFinal4.text);
  end;
  if (chForn.checked) then
  begin
    forn1  := '000';
    forn2  := '999999';
  end
  else
  begin
    forn1  := Trim(edtForn1.text);
    forn2  := Trim(edtForn2.text);
  end;

  if (databaseprodutos='ESTOQUE') then
  begin
        {iniciando o processamento do relatorio}
    mostra_mensagem ('Preparando relatório...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('SELECT  *                                                           ');
      AddParam ('FROM     ESTOQUE_LOJA                                               ');
      AddParam ('LEFT OUTER JOIN PRODUTOS ON ((EL_GRUP=PR_GRUP) AND (EL_SUBG=PR_SUBG) AND (EL_PROD=PR_CODI))');
      AddParam ('WHERE    (EL_LOJA='+floattostr(frm_principal.x_loja)+') AND         ');
      AddParam ('         (EL_GRUP>='+grupo1+') AND (EL_GRUP<='+grupo2+') AND        ');
      AddParam ('         (EL_SUBG>='+subgrupo1+') AND (EL_SUBG<='+subgrupo2+') AND  ');
      AddParam ('         (EL_PROD>='+produto1+') AND (EL_PROD<='+produto2+') AND    ');
      AddParam ('         (PR_FORN>='+forn1+') AND (PR_FORN<='+forn2+')              ');
      if (chSaldo.checked) then
        AddParam ('     AND (EL_QTD'+tipz+'>0)                                     ');
      AddParam ('ORDER BY EL_LOJA,PR_FORN,EL_GRUP,EL_SUBG,EL_PROD,EL_CORE,EL_OTAM    ');
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!'
          ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
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
          Title:= 'LISTAGEM DE CONTAGEM DE INVENTARIO';

                     {cabecalho do modelo}
          AddLine (form_tc2('-',132,'-'));
          if (chImprimeSaldo.checked) then
          begin
            AddLine ('        |Codigo      |                                                     |         |      |Qtde   |      |');
            if (rdIdent.itemindex=0) then
              AddLine ('Cod     |De Barras   |Descricao do produto                                 |Cor      |Tamnho|Estoque|Unid  | Contagem')
            else
            if (rdIdent.itemindex=1) then
              AddLine ('Ref. Int|De Barras   |Descricao do produto                                 |Cor      |Tamnho|Estoque|Unid  |Contagem')
            else
            if (rdIdent.itemindex=2) then
              AddLine ('Ref. Fab|De Barras   |Descricao do produto                                 |Cor      |Tamnho|Estoque|Unid  |Contagem');
          end
          else
          begin
            AddLine ('        |Codigo      |                                                     |         |       |      |');
            if (rdIdent.itemindex=0) then
              AddLine ('Cod     |De Barras   |Descricao do produto                                 |Cor      |Tamanho|Unid  | Contagem')
            else
            if (rdIdent.itemindex=1) then
              AddLine ('Ref. Int|De Barras   |Descricao do produto                                 |Cor      |Tamanho|Unid  |Contagem')
            else
            if (rdIdent.itemindex=2) then
              AddLine ('Ref. Fab|De Barras   |Descricao do produto                                 |Cor      |Tamanho|Unid  |Contagem');
          end;
          AddLine (form_tc2('-',132,'-'));
          indGauge:=0;
          totGauge:=clAux.Reccount;
          clAux.first;
          total_itens:=0;
          total_itens_loja:=0;
          while (not clAux.eof) do
          begin
            grupo    := clAux.result('EL_GRUP');
            subgrupo := clAux.result('EL_SUBG');
            produto  := clAux.result('EL_PROD');
            cor      := clAux.result('EL_CORE');
            tam      := clAux.result('EL_TAMA');
            if (tam='0') then
              tamanho:='UNICO'
            else
              tamanho:=tam;
            if (tipz='1') then
              saldo := clAux.result('EL_QTD1')
            else
            if (tipz='2') then
              saldo := clAux.result('EL_QTD2');
            codigobarras := RetornaCodigoDeBarrasDoItem(grupo,subgrupo,produto,cor,tam);
            if (chImprimeSaldo.checked) then
            begin
              if (rdIdent.itemindex=0) then
                AddLine(form_nz  (grupo,2)+
                  form_nz  (subgrupo,2)+
                  form_nz  (produto,4)+' '+
                  form_t   (codigobarras,13)+' '+
                  form_t   (clAux.result('PR_DESC'),52)+' '+
                  form_nz  (cor,3)+'/'+
                  form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                  form_t   (tamanho,7)  +' '+
                  form_n   (saldo,7)+' '+
                  form_t   (clAux.result('PR_UNID'),5)+' [      ]')
              else
              if (rdIdent.itemindex=1) then
                AddLine(form_t   (clAux.result('PR_REFI'),8)+
                  form_t   (codigobarras,13)+' '+
                  form_t   (clAux.result('PR_DESC'),52)+' '+
                  form_nz  (cor,3)+'/'+
                  form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                  form_t   (tamanho,7)  +' '+
                  form_n   (saldo,7)+' '+
                  form_t   (clAux.result('PR_UNID'),5)+' [      ]')
              else
              if (rdIdent.itemindex=2) then
                AddLine(form_t   (clAux.result('PR_REFF'),8)+
                  form_t   (codigobarras,13)+' '+
                  form_t   (clAux.result('PR_DESC'),52)+' '+
                  form_nz  (cor,3)+'/'+
                  form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                  form_t   (tamanho,7)  +' '+
                  form_n   (saldo,7)+' '+
                  form_t   (clAux.result('PR_UNID'),5)+' [      ]');
            end
            else
            if (rdIdent.itemindex=0) then
              AddLine(form_nz  (grupo,2)+
                form_nz  (subgrupo,2)+
                form_nz  (produto,4)+' '+
                form_t   (codigobarras,13)+' '+
                form_t   (clAux.result('PR_DESC'),52)+' '+
                form_nz  (cor,3)+'/'+
                form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                form_t   (tamanho,7)  +' '+
                form_t   (clAux.result('PR_UNID'),5)+' [      ]')
            else
            if (rdIdent.itemindex=1) then
              AddLine(form_t   (clAux.result('PR_REFI'),8)+
                form_t   (codigobarras,13)+' '+
                form_t   (clAux.result('PR_DESC'),52)+' '+
                form_nz  (cor,3)+'/'+
                form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                form_t   (tamanho,7)  +' '+
                form_t   (clAux.result('PR_UNID'),5)+' [      ]')
            else
            if (rdIdent.itemindex=2) then
              AddLine(form_t   (clAux.result('PR_REFF'),8)+
                form_t   (codigobarras,13)+' '+
                form_t   (clAux.result('PR_DESC'),52)+' '+
                form_nz  (cor,3)+'/'+
                form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                form_t   (tamanho,7)  +' '+
                form_t   (clAux.result('PR_UNID'),5)+' [      ]');
            total_itens_loja := total_itens  + 1;
            total_itens      := total_itens + 1;
            clAux.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          AddLine (form_tc2('-',132,'-'));
          AddLine (form_tc2(' ',76,' ')+' Total....: '+form_n(total_itens,10));

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
  end
  else
  if (databaseprodutos='VENDAS') then
  begin
        {iniciando o processamento do relatorio}
    mostra_mensagem ('Preparando relatório...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('SELECT  *                                                           ');
      AddParam ('FROM     ESTOQUE                                                    ');
      AddParam ('LEFT OUTER JOIN PRODUTOS ON ((ES_GRUP=PR_GRUP) AND (ES_SUBG=PR_SUBG) AND (ES_PROD=PR_CODI))');
      AddParam ('WHERE    (ES_GRUP>='+grupo1+') AND (ES_GRUP<='+grupo2+') AND        ');
      AddParam ('         (ES_SUBG>='+subgrupo1+') AND (ES_SUBG<='+subgrupo2+') AND  ');
      AddParam ('         (ES_PROD>='+produto1+') AND (ES_PROD<='+produto2+') AND    ');
      AddParam ('         (PR_FORN>='+forn1+') AND (PR_FORN<='+forn2+')              ');
      if (chSaldo.checked) then
        AddParam ('     AND (EL_QTD'+tipz+'>0)                                     ');
      AddParam ('ORDER BY PR_FORN,ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_OTAM            ');
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!'
          ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
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
          Title:= 'LISTAGEM DE CONTAGEM DE INVENTARIO';

                     {cabecalho do modelo}
          AddLine (form_tc2('-',132,'-'));
          AddLine ('        |Codigo      |                                                     |         |       |      |');
          if (rdIdent.itemindex=0) then
            AddLine ('Cod     |De Barras   |Descricao do produto                                 |Cor      |Tamanho|Unid  | Contagem')
          else
          if (rdIdent.itemindex=1) then
            AddLine ('Ref. Int|De Barras   |Descricao do produto                                 |Cor      |Tamanho|Unid  |Contagem')
          else
          if (rdIdent.itemindex=2) then
            AddLine ('Ref. Fab|De Barras   |Descricao do produto                                 |Cor      |Tamanho|Unid  |Contagem');
          AddLine (form_tc2('-',132,'-'));

          indGauge:=0;
          totGauge:=clAux.Reccount;
          clAux.first;
          total_itens:=0;
          total_itens_loja:=0;
          while (not clAux.eof) do
          begin
            grupo    := clAux.result('ES_GRUP');
            subgrupo := clAux.result('ES_SUBG');
            produto  := clAux.result('ES_PROD');
            cor      := clAux.result('ES_CORE');
            tam      := clAux.result('ES_TAMA');
            if (tam='0') then
              tamanho:='UNICO'
            else
              tamanho:=tam;
            codigobarras := RetornaCodigoDeBarrasDoItem(grupo,subgrupo,produto,cor,tam);
            if (rdIdent.itemindex=0) then
              AddLine(form_nz  (grupo,2)+
                form_nz  (subgrupo,2)+
                form_nz  (produto,4)+' '+
                form_t   (codigobarras,13)+' '+
                form_t   (clAux.result('PR_DESC'),52)+' '+
                form_nz  (cor,3)+'/'+
                form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                form_t   (tamanho,7)  +' '+
                form_t   (clAux.result('PR_UNID'),5)+' [      ]')
            else
            if (rdIdent.itemindex=1) then
              AddLine(form_t   (clAux.result('PR_REFI'),8)+
                form_t   (codigobarras,13)+' '+
                form_t   (clAux.result('PR_DESC'),52)+' '+
                form_nz  (cor,3)+'/'+
                form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                form_t   (tamanho,7)  +' '+
                form_t   (clAux.result('PR_UNID'),5)+' [      ]')
            else
            if (rdIdent.itemindex=2) then
              AddLine(form_t   (clAux.result('PR_REFF'),8)+
                form_t   (codigobarras,13)+' '+
                form_t   (clAux.result('PR_DESC'),52)+' '+
                form_nz  (cor,3)+'/'+
                form_t   (ProcuraAbrevCor(cor,self),5)+' '+
                form_t   (tamanho,7)  +' '+
                form_t   (clAux.result('PR_UNID'),5)+' [      ]');
            total_itens_loja := total_itens  + 1;
            total_itens      := total_itens + 1;
            clAux.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          AddLine (form_tc2('-',132,'-'));
          AddLine (form_tc2(' ',76,' ')+' Total....: '+form_n(total_itens,10));

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

procedure Tfrm_ListaItensEstoque.edtInicial2DblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtInicial2,true);
end;

procedure Tfrm_ListaItensEstoque.edtFinal2DblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtFinal2,true);
end;

procedure Tfrm_ListaItensEstoque.FormCreate(Sender: TObject);
begin
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
  if (frm_principal.x_ordem_codigo=1) then
    rdIdent.itemindex:=0
  else
  if (frm_principal.x_ordem_refinterna=1) then
    rdIdent.itemindex:=1
  else
  if (frm_principal.x_ordem_reffabric=1) then
    rdIdent.itemindex:=2;
end;

procedure Tfrm_ListaItensEstoque.edtInicial4Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtFinal4Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtInicial4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal4.setfocus;
  if (key=K_CIMA) then
    edtFinal3.setfocus;
end;

procedure Tfrm_ListaItensEstoque.edtFinal4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=k_BAIXO) then
    edtForn1.setfocus;
  if (key=K_CIMA) then
    edtInicial4.setfocus;
end;

procedure Tfrm_ListaItensEstoque.ch4Click(Sender: TObject);
begin
  if (not ch4.checked) then
  begin
    habilitaeditVerde(edtInicial4);
    habilitaeditVerde(edtFinal4);
    edtInicial4.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial4);
    desabilitaeditVerde(edtFinal4);
    edtForn1.setfocus;
  end;
end;

procedure Tfrm_ListaItensEstoque.ch4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not ch4.checked) then
  begin
    habilitaeditVerde(edtInicial4);
    habilitaeditVerde(edtFinal4);
    edtInicial4.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial4);
    desabilitaeditVerde(edtFinal4);
    edtForn1.setfocus;
  end;
end;

procedure Tfrm_ListaItensEstoque.edtForn1DblClick(Sender: TObject);
begin
  ChamandoF8Forn (edtForn1,true);
end;

procedure Tfrm_ListaItensEstoque.edtForn2DblClick(Sender: TObject);
begin
  ChamandoF8Forn (edtForn2,true);
end;

procedure Tfrm_ListaItensEstoque.edtForn1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtForn2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtForn1Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtForn1.text);
  if (codigo<>'') then
  begin
    pnForn1.caption:=ProcuraNomeForn(strtofloat(codigo),self);
    edtForn1.text:=form_nz(strtofloat(codigo),6);
  end
  else
    pnForn1.caption:='';
end;

procedure Tfrm_ListaItensEstoque.edtForn2Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtForn2.text);
  if (codigo<>'') then
  begin
    pnForn2.caption:=ProcuraNomeForn(strtofloat(codigo),self);
    edtForn2.text:=form_nz(strtofloat(codigo),6);
  end
  else
    pnForn2.caption:='';
end;

procedure Tfrm_ListaItensEstoque.edtForn1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtForn2.setfocus;
  if (key=K_CIMA) then
    edtFinal4.setfocus;
  if (key=K_F8) then
    ChamandoF8Forn (edtForn1,true);
end;

procedure Tfrm_ListaItensEstoque.edtForn2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1Click(Sender);
  if (key=K_CIMA) then
    edtForn1.setfocus;
  if (key=K_F8) then
    ChamandoF8Forn (edtForn2,true);
end;

procedure Tfrm_ListaItensEstoque.chFornClick(Sender: TObject);
begin
  if (not chForn.checked) then
  begin
    habilitaeditVerde(edtForn1);
    habilitaeditVerde(edtForn2);
    edtForn1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtForn1);
    desabilitaeditVerde(edtForn2);
  end;
end;

procedure Tfrm_ListaItensEstoque.chFornKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chForn.checked) then
  begin
    habilitaeditVerde(edtForn1);
    habilitaeditVerde(edtForn2);
    edtForn1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtForn1);
    desabilitaeditVerde(edtForn2);
  end;
end;

procedure Tfrm_ListaItensEstoque.edtInicial3DblClick(Sender: TObject);
begin
  ChamandoF8SubGrupos2(edtInicial3,true);
end;

procedure Tfrm_ListaItensEstoque.edtFinal3DblClick(Sender: TObject);
begin
  ChamandoF8SubGrupos2(edtFinal3,true);
end;

procedure Tfrm_ListaItensEstoque.botao1Click(Sender: TObject);
begin
  Confirmarttulo1.click;
end;

end.
