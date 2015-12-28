unit un_ListaMovDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, Mask;

type
  Tfrm_ListaMovDia = class(TForm)
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
    btnConfere: TButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmarttulo1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtInicial2: TMaskEdit;
    edtFinal2: TMaskEdit;
    rdTipo: TRadioGroup;
    rdModo: TRadioGroup;
    gbFornecedores: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ch1: TCheckBox;
    edtInicial1: TMaskEdit;
    pnLoja1: TPanel;
    edtFinal1: TMaskEdit;
    pnLoja2: TPanel;
    Panel1: TPanel;
    pnLocal1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    edtGrupo: TMaskEdit;
    edtSubGrupo: TMaskEdit;
    edtCodigo: TMaskEdit;
    pnLocal2: TPanel;
    Label18: TLabel;
    edtRefInt: TMaskEdit;
    pnProduto: TPanel;
    ch2: TCheckBox;
    Label34: TLabel;
    edtCor: TMaskEdit;
    pnCor: TPanel;
    edtFaixaTam: TMaskEdit;
    Label35: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtInicial1Enter(Sender: TObject);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtInicial1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfereClick(Sender: TObject);
    procedure Confirmarttulo1Click(Sender: TObject);
    procedure edtFinal1Enter(Sender: TObject);
    procedure edtFinal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial1Exit(Sender: TObject);
    procedure edtFinal1Exit(Sender: TObject);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtCorChange(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure edtInicial1DblClick(Sender: TObject);
    procedure edtFinal1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}
    tipz: String;

    {...}
    Modo: Integer;          {0-> chamado de menu principal, 1-> chamada da consulta}
    jaChamou: Boolean;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure MudaFocoCodigo;
  end;

var
  frm_ListaMovDia: Tfrm_ListaMovDia;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar, unMensagem,
  unDialogo, mem_prnt, produtos;

procedure Tfrm_ListaMovDia.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ListaMovDia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
      if (tipz='1') then
        tipz:='2'
      else
      if (tipz='2') then
        tipz:='1';
end;

procedure Tfrm_ListaMovDia.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ListaMovDia.Limparformulrio1Click(Sender: TObject);
begin
  edtInicial1.text:='';
  edtFinal1.text:='';
  pnLoja1.caption:='';
  pnLoja2.caption:='';
  edtInicial2.text:='';
  edtFinal2.text:='';
  habilitaEditRelat(edtInicial1);
  habilitaEditRelat(edtFinal1);
  ch1.checked:=false;
  ch2.checked:=false;
  edtInicial1.setfocus;
  edtGrupo.text:='';
  edtSubGrupo.text:='';
  edtCodigo.text:='';
  edtRefInt.text:='';
  edtCor.text:='';
  edtFaixaTam.text:='';
  habilitaEditRelat(edtGrupo);
  habilitaEditRelat(edtSubGrupo);
  habilitaEditRelat(edtCodigo);
  habilitaEditRelat(edtRefInt);
  habilitaEditRelat(edtCor);
  habilitaEditRelat(edtFaixaTam);
  pnProduto.caption:='';
  pnCor.caption:=''; 
end;

procedure Tfrm_ListaMovDia.edtInicial1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtFinal2Enter(Sender: TObject);
begin
  if (edtFinal2.text='  /  /    ') then
    edtFinal2.text:=edtInicial2.text;   
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtInicial1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal1.setfocus;
  if (key=K_CIMA) then;
  if (key=K_F8) then
    ChamandoF8Lojas (edtInicial1,true);
end;

procedure Tfrm_ListaMovDia.edtFinal2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (not ch2.checked) then
      FocaCodigoLocal1
    else
      btnConfere.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
end;

procedure Tfrm_ListaMovDia.btnConfereClick(Sender: TObject);
begin
  Confirmarttulo1.click;
end;

procedure Tfrm_ListaMovDia.Confirmarttulo1Click(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  data1,data2,loja1,loja2: String;
  lojaant: Real;
  dataant: TDateTime;
  grupo,subgrupo,produto,cor: Real;
  filtro_modo,filtro_tipo,tamanho,tam: String;
  qtde,preco: Real;
  indGauge,totGauge: Integer;
  totlojqent,totlojqsai: Integer;
  totlojvent,totlojvsai: Real;
  totdatqent,totdatqsai: Integer;
  totdatvent,totdatvsai: Real;
begin
    {CRITICA ÀS DATAS}
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFinal2.setfocus;
  end
  else
  if (n_grupo=0) and (not ch2.checked) then
  begin
    frmDialogo.ExibirMensagem (' Código do grupo não pode ficar vazio! '
      ,'Produto',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtGrupo.setfocus;
  end
  else
  if (Trim(edtRefInt.text)='') and (not ch2.checked) and (pnLocal2.visible) then
  begin
    frmDialogo.ExibirMensagem (' A ref. interna não pode ficar vazia! '
      ,'Produto',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtRefInt.setfocus;
  end
  else
  begin
        {FORMATACAO DOS DADOS DE ENTRADA}
    if (edtInicial1.text='') and (not ch1.checked) then
      edtInicial1.text:='00';
    if (Trim(edtFinal1.text)='') and (not ch1.checked) then
      edtFinal1.text:='99';
    if (edtInicial2.text='') then
    begin
      edtInicial2.text:=datetostr(date);
      data1:=FormataData(date);
    end
    else
      data1:=FormataData(strtodate(edtInicial2.text));
    if (Trim(edtFinal2.text)='') then
    begin
      edtFinal2.text:=datetostr(date);
      data2:=FormataData(date);
    end
    else
      data2:=FormataData(strtodate(edtFinal2.text));
    
        {Puxando os filtros}
    if (ch1.checked) then
    begin
      loja1  := '00';
      loja2  := '99';
    end
    else
    begin
      loja1  := Trim(edtInicial1.text);
      loja2  := Trim(edtFinal1.text);
    end;
    if (rdTipo.itemindex=0) then
      filtro_tipo:='E'
    else
    if (rdTipo.itemindex=1) then
      filtro_tipo:='S';
    if (rdModo.itemindex=0) then
      filtro_modo:='N'
    else
    if (rdModo.itemindex=1) then
      filtro_modo:='T'
    else
    if (rdModo.itemindex=2) then
      filtro_modo:='F';

        {iniciando o processamento do relatorio}
    mostra_mensagem ('Preparando relatório...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('ESTOQUE', self);
      ClearSql;
      AddParam ('Select    * ');
      AddParam ('From      MOVIMENTO                                                ');
      AddParam ('Where     (MO_LOJA>='+loja1+') AND (MO_LOJA<='+loja2+') AND        ');
      AddParam ('          (MO_DATA>='+chr(39)+data1+chr(39)+') AND                 ');
      AddParam ('          (MO_DATA<='+chr(39)+data2+chr(39)+') AND                 ');
      AddParam ('          (MO_TIPZ='+chr(39)+tipz+chr(39)+')                       ');
      if (not ch2.checked) then
      begin
        AddParam ('  AND (MO_GRUP='+floattostr(n_grupo)+') ');
        if (n_subgrupo<>0) then
          AddParam ('  AND (MO_SUBG='+floattostr(n_subgrupo)+') ');
        if (n_produto<>0) then
          AddParam ('  AND (MO_PROD='+floattostr(n_produto)+') ');
        if (n_cor<>-1) then
          AddParam ('  AND (MO_CORE='+floattostr(n_cor)+') ');
        if (n_tam<>'-1') then
          AddParam ('  AND (MO_TAMA='+chr(39)+n_tam+chr(39)+') ');
      end;
      if (rdTipo.itemindex<>2) then
        AddParam ('       AND (MO_TIPO='+chr(39)+filtro_tipo+chr(39)+')               ');
      if (rdModo.itemindex<>3) then
        AddParam ('       AND (MO_MODE='+chr(39)+filtro_modo+chr(39)+')               ');
      AddParam ('Order by   MO_LOJA,MO_GRUP,MO_SUBG,MO_PROD,MO_CORE,MO_TAMA         ');
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Listagem de itens de estoque',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
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
          Title:= 'LISTAGEM DE MOVIMENTO';

          if (ch1.checked) then
            AddLine ('Loja................: TODAS AS LOJAS   ')
          else
            AddLine ('Loja................: '+loja1+' a '+loja2);
          AddLine ('Movimento do periodo: '+Trim(edtInicial2.text)+' a '+
            Trim(edtFinal2.text));
          AddLine ('Modelo..: '+tipz);
          indGauge:=0;
          totGauge:=clAux.Reccount;
          clAux.first;
          lojaant:=-1;
          dataant:=strtodate('01/01/1900');
          totlojqent:=0;
          totlojqsai:=0;
          totlojvent:=0.00;
          totlojvsai:=0.00;
          while (not clAux.eof) do
          begin
                          {ORDEM: LOJA>>data}
            if (lojaant<>clAux.Result('MO_LOJA')) then
            begin
              if (lojaant<>-1) then
              begin
                AddLine (form_tc2('-',132,'-'));
                AddLine ('Total '+form_data(dataant)+':  '+
                  'Total de entradas..: '+form_n(totdatqent,10)+' '+
                  form_nc(totdatvent,15)+'   '+
                  'Total de saidas....: '+form_n(totdatqsai,10)+' '+
                  form_nc(totdatvsai,15));
                AddLine ('Total da loja '+form_n(lojaant,2)+':  '+
                  'Total de entradas..: '+form_n(totlojqent,10)+' '+
                  form_nc(totlojvent,15)+'   '+
                  'Total de saidas....: '+form_n(totlojqsai,10)+' '+
                  form_nc(totlojvsai,15));
                AddLine (chr(12)+form_tc2(' ',131,' '));
                AddLine ('');
                totlojqent:=0;
                totlojqsai:=0;
                totlojvent:=0.00;
                totlojvsai:=0.00;
                totdatqent:=0;
                totdatqsai:=0;
                totdatvent:=0.00;
                totdatvsai:=0.00;
              end;
              lojaant:=clAux.Result('MO_LOJA');
              AddLine (form_tc2('-',132,'-'));
              AddLine ('Loja '+form_n(lojaant,2)+' '+ProcuraNomeLoja(lojaant,self));
              AddLine (form_tc2('-',132,'-'));
              AddLine ('          |            |                                      |     |     | | |               |    |              |              |   ');
              AddLine ('Data      |Cod. do Item|Descricao                             |Cor  |Tama |T|M| Qtde do Item  |Unid| Preço       $| Total       $|Sr ');
              AddLine (form_tc2('-',132,'-'));
            end;
            if (dataant<>clAux.Result('MO_DATA')) then
            begin
              if (dataant<>strtodate('01/01/1900')) then
              begin
                AddLine (form_tc2('-',132,'-'));
                AddLine ('Total '+form_data(dataant)+':  '+
                  'Total de entradas..: '+form_n(totdatqent,10)+' '+
                  form_nc(totdatvent,15)+'   '+
                  'Total de saidas....: '+form_n(totdatqsai,10)+' '+
                  form_nc(totdatvsai,15));
                AddLine ('');
                totdatqent:=0;
                totdatqsai:=0;
                totdatvent:=0.00;
                totdatvsai:=0.00;
              end;
              dataant:=clAux.Result('MO_DATA');
            end;

                          {...}
            grupo    := clAux.result('MO_GRUP');
            subgrupo := clAux.result('MO_SUBG');
            produto  := clAux.result('MO_PROD');
            clAux2:=TClassAuxiliar.Create;
            clAux2.conect ('ESTOQUE',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select PR_UNID ');
            clAux2.AddParam ('From   PRODUTOS ');
            clAux2.AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND ');
            clAux2.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND ');
            clAux2.AddParam ('      (PR_CODI='+floattostr(produto)+')');
            clAux2.Execute;
            cor         := clAux.result('MO_CORE');
            tam         := clAux.result('MO_TAMA');
            if (tam='0') then
              tamanho:='UNICO'
            else
              tamanho:=tam;
            qtde       := clAux.result('MO_QTD1');
            if (clAux.result('MO_TIPO')='E') then
              preco := clAux.result('MO_PCU1')
            else
              preco := clAux.result('MO_PVE1');
            AddLine (form_data(clAux.result('MO_DATA'))+' '+
              form_nz  (grupo,3)    +
              form_nz  (subgrupo,3) +
              form_nz  (produto,6)  +' '+
              form_t   (ProcuraNomeItemEstoque(grupo,subgrupo,produto,cor,tam,self),39)+' '+
              form_t   (ProcuraAbrevCor(cor,self),5)+' '+
              form_t   (tamanho,5)  +' '+
              form_t   (clAux.result('MO_TIPO'),1)  +' '+
              form_t   (clAux.result('MO_MODE'),1)  +' '+
              form_nc  (qtde,15)    +' '+
              form_t   (clAux2.result('PR_UNID'),4) +' '+
              form_nc2 (preco,14,3) +' '+
              form_nc  (preco*qtde,14)+' '+
              form_t   (clAux.result('MO_TIPZ'),1));
            clAux2.Desconect;
            clAux2.Free;

                          {prox titulo -->}
            if (clAux.result('MO_TIPO')='E') then
            begin
              totlojqent:=totlojqent+1;
              totdatqent:=totdatqent+1;
              totlojvent:=totlojvent+(preco*qtde);
              totdatvent:=totdatvent+(preco*qtde);
            end
            else
            if (clAux.result('MO_TIPO')='S') then
            begin
              totlojqsai:=totlojqsai+1;
              totdatqsai:=totdatqsai+1;
              totlojvsai:=totlojvsai+(preco*qtde);
              totdatvsai:=totdatvsai+(preco*qtde);
            end;
            clAux.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          AddLine (form_tc2('-',132,'-'));
          AddLine ('Total '+form_data(dataant)+':  '+
            'Total de entradas..: '+form_n(totdatqent,10)+' '+
            form_nc(totdatvent,15)+'   '+
            'Total de saidas....: '+form_n(totdatqsai,10)+' '+
            form_nc(totdatvsai,15));
          AddLine ('Total da loja '+form_n(lojaant,2)+':  '+
            'Total de entradas..: '+form_n(totlojqent,10)+' '+
            form_nc(totlojvent,15)+'   '+
            'Total de saidas....: '+form_n(totlojqsai,10)+' '+
            form_nc(totlojvsai,15));
          AddLine ('');

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

procedure Tfrm_ListaMovDia.edtFinal1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtFinal1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial2.setfocus;
  if (key=K_CIMA) then
    edtInicial1.setfocus;
  if (key=K_F8) then
    ChamandoF8Lojas (edtFinal1,true);
end;

procedure Tfrm_ListaMovDia.edtInicial2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtFinal1.setfocus;
end;

procedure Tfrm_ListaMovDia.FormActivate(Sender: TObject);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
  if (Modo=0) and (edtInicial1.enabled) then
    edtInicial1.setfocus;
  if (Modo=1) and (not jaChamou) then
  begin
    jaChamou:=true;
    edtInicial1.setfocus;
    edtFinal1.setfocus;
    edtInicial2.setfocus;
    edtFinal2.setfocus;
    FocaCodigoLocal2;
    grupo    := Trim(edtGrupo.text);
    subgrupo := Trim(edtSubGrupo.text);
    codigo   := Trim(edtCodigo.text);
    if (grupo<>'') and (subgrupo<>'') and (codigo<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_UNID,PR_REFI ');
        AddParam ('From   PRODUTOS ');
        AddParam ('Where (PR_SUBG='+subgrupo+') AND ');
        AddParam ('      (PR_GRUP='+grupo+') AND ');
        AddParam ('      (PR_CODI='+codigo+') ');
        frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
        frm_principal.refresh;
        n_cor_unica:=false;
        n_tam_unico:=false;
        if (Execute) then
        begin
          pnProduto.caption:=result('PR_DESC');
          if (result('PR_CUNI')='1') then
            n_cor_unica:=true
          else
          if (result('PR_CUNI')='0') then
            n_cor_unica:=false;
          if (result('PR_TUNI')='1') then
            n_tam_unico:=true
          else
          if (result('PR_TUNI')='0') then
            n_tam_unico:=false;
        end
        else
          pnProduto.caption:='<Produto nao encontrado>';
        frm_principal.BarraDicas.caption:='';
        edtRefInt.text   := form_t  (result('PR_REFI'),12);
        edtGrupo.text    := form_nz (StrToFloat(grupo),3);
        edtSubGrupo.text := form_nz (StrToFloat(subgrupo),3);
        edtCodigo.text   := form_nz(StrToFloat(codigo),6);
        desconect;
        Free;

               {...}
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaeditRelat(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaEditRelat(edtCor);
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaeditRelat(edtFaixaTam);
        end
        else
          habilitaEditRelat(edtFaixaTam);
      end;
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      btnConfere.setfocus;
  end;
end;

procedure Tfrm_ListaMovDia.ch1Click(Sender: TObject);
begin
  if (not ch1.checked) then
  begin
    habilitaEditRelat(edtInicial1);
    habilitaEditRelat(edtFinal1);
  end
  else
  begin
    desabilitaeditRelat(edtInicial1);
    desabilitaeditRelat(edtFinal1);
  end;
  edtInicial2.setfocus;
end;

procedure Tfrm_ListaMovDia.ch1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not ch1.checked) then
  begin
    habilitaEditRelat(edtInicial1);
    habilitaEditRelat(edtFinal1);
  end
  else
  begin
    desabilitaeditRelat(edtInicial1);
    desabilitaeditRelat(edtFinal1);
  end;
end;

procedure Tfrm_ListaMovDia.edtInicial1Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtInicial1.text);
  if (codigo<>'') then
  begin
    pnLoja1.caption:=ProcuraNomeLoja(strtofloat(codigo),self);
    edtInicial1.text:=form_nz(strtofloat(codigo),2);
  end;
end;


procedure Tfrm_ListaMovDia.edtFinal1Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtFinal1.text);
  if (codigo<>'') then
  begin
    pnLoja2.caption:=ProcuraNomeLoja(strtofloat(codigo),self);
    edtFinal1.text:=form_nz(strtofloat(codigo),2);
  end;
end;


procedure Tfrm_ListaMovDia.edtInicial2Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_ListaMovDia.edtFinal2Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFinal2.setfocus;
  end;
end;

procedure Tfrm_ListaMovDia.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_ListaMovDia.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_ListaMovDia.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_ListaMovDia.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_CIMA) then
    edtFinal2.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_ListaMovDia.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodigo.setfocus;
  if (key=K_CIMA) then
    edtGrupo.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
end;

procedure Tfrm_ListaMovDia.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    grupo    := Trim(edtGrupo.text);
    subgrupo := Trim(edtSubGrupo.text);
    codigo   := Trim(edtCodigo.text);
    if (grupo<>'') and (subgrupo<>'') and (codigo<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_UNID ');
        AddParam ('From   PRODUTOS ');
        AddParam ('Where (PR_SUBG='+subgrupo+') AND ');
        AddParam ('      (PR_GRUP='+grupo+') AND ');
        AddParam ('      (PR_CODI='+codigo+') ');
        frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
        frm_principal.refresh;
        n_cor_unica:=false;
        n_tam_unico:=false;
        if (Execute) then
        begin
          pnProduto.caption:=result('PR_DESC');
          if (result('PR_CUNI')='1') then
            n_cor_unica:=true
          else
          if (result('PR_CUNI')='0') then
            n_cor_unica:=false;
          if (result('PR_TUNI')='1') then
            n_tam_unico:=true
          else
          if (result('PR_TUNI')='0') then
            n_tam_unico:=false;
        end
        else
          pnProduto.caption:='<Produto nao encontrado>';
        frm_principal.BarraDicas.caption:='';
        edtGrupo.text    := form_nz (StrToFloat(grupo),3);
        edtSubGrupo.text := form_nz (StrToFloat(subgrupo),3);
        edtCodigo.text   := form_nz(StrToFloat(codigo),6);
        desconect;
        Free;

               {...}
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaeditRelat(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaEditRelat(edtCor);
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaeditRelat(edtFaixaTam);
        end
        else
          habilitaEditRelat(edtFaixaTam);
      end;
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      btnConfere.setfocus;
  end;
  if (key=K_CIMA) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do produto: Formato: 999999',5);
end;

procedure Tfrm_ListaMovDia.edtRefIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  if (key=K_CIMA) then
    edtFinal2.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    refinterna := Trim(edtRefInt.text);
    if (refinterna<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,PR_SUBG,PR_CODI,PR_UNID ');
        AddParam ('From   PRODUTOS ');
        AddParam ('Where (PR_REFI='+chr(39)+refinterna+chr(39)+') ');
        frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
        frm_principal.refresh;
        n_cor_unica:=false;
        n_tam_unico:=false;
        if (Execute) then
        begin
          n_grupo := result('PR_GRUP');
          n_subgrupo := result('PR_SUBG');
          n_produto := result('PR_CODI');
          pnProduto.caption:=result('PR_DESC');
          if (result('PR_CUNI')='1') then
            n_cor_unica:=true
          else
          if (result('PR_CUNI')='0') then
            n_cor_unica:=false;
          if (result('PR_TUNI')='1') then
            n_tam_unico:=true
          else
          if (result('PR_TUNI')='0') then
            n_tam_unico:=false;
        end
        else
          pnProduto.caption:='<Produto nao encontrado>';
        frm_principal.BarraDicas.caption:='';
        edtGrupo.text    := form_nz (n_grupo,3);
        edtSubGrupo.text := form_nz (n_subgrupo,3);
        edtCodigo.text   := form_nz (n_produto,6);
        desconect;
        Free;

               {...}
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaeditRelat(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaEditRelat(edtCor);
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaeditRelat(edtFaixaTam);
        end
        else
          habilitaEditRelat(edtFaixaTam);
      end;
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      btnConfere.setfocus;
  end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
end;

procedure Tfrm_ListaMovDia.ch2Click(Sender: TObject);
begin
  if (ch2.checked) then
  begin
    desabilitaeditRelat(edtGrupo);
    desabilitaeditRelat(edtSubGrupo);
    desabilitaeditRelat(edtCodigo);
    desabilitaeditRelat(edtRefInt);
    desabilitaeditRelat(edtCor);
    desabilitaeditRelat(edtFaixaTam);
  end
  else
  begin
    habilitaEditRelat(edtGrupo);
    habilitaEditRelat(edtSubGrupo);
    habilitaEditRelat(edtCodigo);
    habilitaEditRelat(edtRefInt);
    habilitaEditRelat(edtCor);
    habilitaEditRelat(edtFaixaTam);
  end;
end;

procedure Tfrm_ListaMovDia.ch2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch2.checked) then
  begin
    desabilitaeditRelat(edtGrupo);
    desabilitaeditRelat(edtSubGrupo);
    desabilitaeditRelat(edtCodigo);
    desabilitaeditRelat(edtRefInt);
  end
  else
  begin
    habilitaEditRelat(edtGrupo);
    habilitaEditRelat(edtSubGrupo);
    habilitaEditRelat(edtCodigo);
    habilitaEditRelat(edtRefInt);
  end;
end;

procedure Tfrm_ListaMovDia.FormCreate(Sender: TObject);
begin
     {* Posicionando a forma de localizacao do produto *}
  tipz:='1';
  jaChamou:=true;
  if (frm_principal.x_ordem_codigo=1) then
  begin
    pnLocal1.visible := true;
    pnLocal1.left    := 37;
    pnLocal2.visible := false;
    pnLocal2.left    := 37;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
  begin
    pnLocal1.visible := false;
    pnLocal1.left    := 37;
    pnLocal2.visible := true;
    pnLocal2.left    := 37;
  end;
end;

{Controle de foco do produto ***}
procedure Tfrm_ListaMovDia.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_ListaMovDia.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

procedure Tfrm_ListaMovDia.MudaFocoCodigo;
begin
  if (pnLocal1.visible) then
  begin
    pnLocal1.visible:=false;
    pnLocal2.visible:=true;
    edtRefInt.setfocus;
  end
  else
  if (pnLocal2.visible) then
  begin
    pnLocal1.visible:=true;
    pnLocal2.visible:=false;
    edtGrupo.setfocus;
  end;
end;

procedure Tfrm_ListaMovDia.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_ListaMovDia.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_ListaMovDia.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtCorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),2);
  end;
end;


procedure Tfrm_ListaMovDia.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      btnConfere.setfocus;
  if (key=38) then
    FocaCodigoLocal1;
  if (key=K_F8) then
    ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_ListaMovDia.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_ListaMovDia.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMovDia.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    btnConfere.setfocus;
  if (key=38) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_ListaMovDia.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_ListaMovDia.edtInicial1DblClick(Sender: TObject);
begin
  ChamandoF8Lojas (edtInicial1,true);
end;

procedure Tfrm_ListaMovDia.edtFinal1DblClick(Sender: TObject);
begin
  ChamandoF8Lojas (edtFinal1,true);
end;

end.
