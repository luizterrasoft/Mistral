unit un_ListaItensEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Menus;

type
  Tfrm_ListaItensEstoque = class(TForm)
    gbFornecedores: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ch1: TCheckBox;
    edtInicial1: TMaskEdit;
    pnLoja1: TPanel;
    edtFinal1: TMaskEdit;
    pnLoja2: TPanel;
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
    Confirmarttulo1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ch2: TCheckBox;
    edtInicial2: TMaskEdit;
    pnGrupo1: TPanel;
    edtFinal2: TMaskEdit;
    pnGrupo2: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ch3: TCheckBox;
    edtInicial3: TMaskEdit;
    edtFinal3: TMaskEdit;
    chSalto: TCheckBox;
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch3Click(Sender: TObject);
    procedure ch3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure edtFinal1Exit(Sender: TObject);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure Confirmarttulo1Click(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure edtInicial1DblClick(Sender: TObject);
    procedure edtFinal1DblClick(Sender: TObject);
    procedure edtInicial2DblClick(Sender: TObject);
    procedure edtFinal2DblClick(Sender: TObject);
    procedure edtInicial3DblClick(Sender: TObject);
    procedure edtFinal3DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

uses principal, funcoes1, funcoes2, procura, unMensagem, unDialogo,
  mem_prnt, auxiliar;

procedure Tfrm_ListaItensEstoque.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ListaItensEstoque.Limparformulrio1Click(Sender: TObject);
begin
  edtInicial1.enabled:=true;
  edtInicial1.setfocus;
  LimparEdits;
end;

procedure Tfrm_ListaItensEstoque.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ListaItensEstoque.FormActivate(Sender: TObject);
begin
  if (edtInicial1.enabled) then
    edtInicial1.setfocus;
end;

procedure Tfrm_ListaItensEstoque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure Tfrm_ListaItensEstoque.LimparEdits;
begin
  edtInicial1.text:='';
  edtInicial2.text:='';
  edtInicial3.text:='';
  edtFinal1.text:='';
  edtFinal2.text:='';
  edtFinal3.text:='';
  pnLoja1.caption:='';
  pnLoja2.caption:='';
  pnGrupo1.caption:='';
  pnGrupo2.caption:='';
  ch1.checked:=false;
  ch2.checked:=false;
  ch3.checked:=false;
  habilitaeditRelat(edtInicial1);
  habilitaeditRelat(edtFinal1);
  habilitaeditRelat(edtInicial2);
  habilitaeditRelat(edtFinal2);
  habilitaeditRelat(edtInicial3);
  habilitaeditRelat(edtFinal3);
end;

procedure Tfrm_ListaItensEstoque.ch1Click(Sender: TObject);
begin
  if (not ch1.checked) then
  begin
    habilitaeditRelat(edtInicial1);
    habilitaeditRelat(edtFinal1);
  end
  else
  begin
    desabilitaeditRelat(edtInicial1);
    desabilitaeditRelat(edtFinal1);
  end;
end;

procedure Tfrm_ListaItensEstoque.ch1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not ch1.checked) then
  begin
    habilitaeditRelat(edtInicial1);
    habilitaeditRelat(edtFinal1);
  end
  else
  begin
    desabilitaeditRelat(edtInicial1);
    desabilitaeditRelat(edtFinal1);
  end;
end;

procedure Tfrm_ListaItensEstoque.ch2Click(Sender: TObject);
begin
  if (not ch2.checked) then
  begin
    habilitaeditRelat(edtInicial2);
    habilitaeditRelat(edtFinal2);
  end
  else
  begin
    desabilitaeditRelat(edtInicial2);
    desabilitaeditRelat(edtFinal2);
  end;
end;

procedure Tfrm_ListaItensEstoque.ch2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not ch2.checked) then
  begin
    habilitaeditRelat(edtInicial2);
    habilitaeditRelat(edtFinal2);
  end
  else
  begin
    desabilitaeditRelat(edtInicial2);
    desabilitaeditRelat(edtFinal2);
  end;
end;

procedure Tfrm_ListaItensEstoque.ch3Click(Sender: TObject);
begin
  if (not ch3.checked) then
  begin
    habilitaeditRelat(edtInicial3);
    habilitaeditRelat(edtFinal3);
  end
  else
  begin
    desabilitaeditRelat(edtInicial3);
    desabilitaeditRelat(edtFinal3);
  end;
end;

procedure Tfrm_ListaItensEstoque.ch3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not ch3.checked) then
  begin
    habilitaeditRelat(edtInicial3);
    habilitaeditRelat(edtFinal3);
  end
  else
  begin
    desabilitaeditRelat(edtInicial3);
    desabilitaeditRelat(edtFinal3);
  end;
end;

procedure Tfrm_ListaItensEstoque.edtInicial1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaItensEstoque.edtFinal1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
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

procedure Tfrm_ListaItensEstoque.edtInicial1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtFinal1.setfocus;
  if (key=K_CIMA) then;
  if (key=K_F8) then
    ChamandoF8Lojas (edtInicial1,true);
end;

procedure Tfrm_ListaItensEstoque.edtFinal1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtInicial2.setfocus;
  if (key=K_CIMA) then
    edtInicial1.setfocus;
  if (key=K_F8) then
    ChamandoF8Lojas (edtFinal1,true);
end;

procedure Tfrm_ListaItensEstoque.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtFinal1.setfocus;
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
  if (key=K_ENTER) then
    btnConfere.click;
  if (key=K_CIMA) then
    edtInicial3.setfocus;
  if (key=K_F8) then
    ChamandoF8SubGrupos2(edtFinal3,true);
end;

procedure Tfrm_ListaItensEstoque.edtInicial1Exit(Sender: TObject);
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

procedure Tfrm_ListaItensEstoque.edtFinal1Exit(Sender: TObject);
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

procedure Tfrm_ListaItensEstoque.edtInicial2Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtInicial2.text);
  if (codigo<>'') then
  begin
    pnGrupo1.caption:=ProcuraNomeGruposProdutos(strtofloat(codigo),self);
    edtInicial2.text:=form_nz(strtofloat(codigo),3);
  end;
end;


procedure Tfrm_ListaItensEstoque.edtFinal2Exit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtFinal2.text);
  if (codigo<>'') then
  begin
    pnGrupo2.caption:=ProcuraNomeGruposProdutos(strtofloat(codigo),self);
    edtFinal2.text:=form_nz(strtofloat(codigo),3);
  end;
end;

{Listagem de itens em estoque ****}
procedure Tfrm_ListaItensEstoque.Confirmarttulo1Click(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  loja1,loja2,grupo1,grupo2,subgrupo1,subgrupo2: String;
  totgeral_totalcusto,totgeral_totalvenda,lojaant: Real;
  grupo,subgrupo,produto,cor: Real;
  tamanho,tam: String;
  total_custo,total_venda,dif,margem: Real;
  saldo,preco_custo,preco_venda: Real;
  indGauge,totGauge: Integer;
  total_itens_loja,total_itens: Integer;
begin
    {FORMATACAO DOS DADOS DE ENTRADA}
  if (edtInicial1.text='') and (not ch1.checked) then
    edtInicial1.text:='00';
  if (Trim(edtFinal1.text)='') and (not ch1.checked) then
    edtFinal1.text:='99';
  if (Trim(edtInicial2.text)='') and (not ch2.checked) then
    edtInicial2.text:='999';
  if (Trim(edtFinal2.text)='') and (not ch3.checked) then
    edtFinal2.text:='999';
  if (Trim(edtInicial3.text)='') and (not ch3.checked) then
    edtInicial3.text:='000';
  if (Trim(edtFinal3.text)='') and (not ch3.checked) then
    edtFinal3.text:='999';

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

    {iniciando o processamento do relatorio}
  mostra_mensagem ('Preparando relatório...Aguarde!');
  frm_mensagem.painel.visible:=true;
  frm_mensagem.gauge1.progress:=0;
  clAux := TClassAuxiliar.Create;
  with (clAux) do
  begin
    conect ('ESTOQUE', self);
    ClearSql;
    AddParam ('Select  * ');
    AddParam ('From     ESTOQUE_LOJA                                            ');
    AddParam ('Where    (EL_LOJA>='+loja1+') AND (EL_LOJA<='+loja2+') AND        ');
    AddParam ('         (EL_GRUP>='+grupo1+') AND (EL_GRUP<='+grupo2+') AND      ');
    AddParam ('         (EL_SUBG>='+subgrupo1+') AND (EL_SUBG<='+subgrupo2+')    ');
    AddParam ('Order by EL_LOJA,EL_GRUP,EL_SUBG,EL_PROD,EL_CORE,EL_TAMA ');
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
        Title:= 'LISTAGEM DE ITENS DE ESTOQUE';

        if (ch1.checked) then
          AddLine ('Loja................: TODAS AS LOJAS   ')
        else
          AddLine ('Loja................: '+loja1+' a '+loja2);
        if (ch2.checked) then
          AddLine ('Grupos de produtos..: TODOS OS GRUPOS ')
        else
          AddLine ('Grupos de produtos..: '+grupo1+' a '+grupo2);
        if (ch3.checked) then
          AddLine ('Subgrupos...........: TODOS OS SUBGRUPOS    ')
        else
          AddLine ('Subgrupos...........: '+subgrupo1+' a '+subgrupo2);
        AddLine ('Modelo..: '+tipz);
        indGauge:=0;
        totGauge:=clAux.Reccount;
        clAux.first;
        lojaant:=-1;
        total_itens:=0;
        total_itens_loja:=0;
        totgeral_totalcusto := 0.00;
        totgeral_totalvenda := 0.00;
        while (not clAux.eof) do
        begin
                      {ORDEM: LOJA}
          if (lojaant<>clAux.Result('EL_LOJA')) then
          begin
            if (lojaant<>-1) then
            begin
              AddLine (form_tc2('-',132,'-'));
              if (totgeral_totalcusto<>0) then
              begin
                if (totgeral_totalvenda>=totgeral_totalcusto) then
                begin
                  dif:=totgeral_totalvenda - totgeral_totalcusto;
                  margem:=((dif/totgeral_totalcusto)*100);
                end
                else
                  margem:=0.00;
              end
              else
                margem:=0.00;
              AddLine ('Total da loja '+form_n(lojaant,2)+': '+form_n(total_itens_loja,11)+
                form_tc2(' ',51,' ')+form_nc(totgeral_totalcusto,20)+'  '+
                form_nc(totgeral_totalvenda,23)+' '+
                form_nc(margem,6));
              if (chSalto.checked) then
                AddLine (chr(12)+form_tc2(' ',131,' '));
              AddLine ('');
              total_itens_loja:=0;
            end;
            lojaant:=clAux.Result('EL_LOJA');
            AddLine (form_tc2('-',132,'-'));
            AddLine ('Loja '+form_n(lojaant,2)+' '+ProcuraNomeLoja(lojaant,self));
            AddLine (form_tc2('-',132,'-'));
            AddLine ('            |                                |     |     | Saldo      |    |Pr. Custo|Total         |Pr. Venda |Total         |Marg ');
            AddLine ('Cod         |Descricao                       |Cor  |Tama |do Item     |Unid|Medio   $|Custo        $|Atual    $|Venda        $| (%) ');
            AddLine (form_tc2('-',132,'-'));
          end;

                      {...}
          grupo    := clAux.result('EL_GRUP');
          subgrupo := clAux.result('EL_SUBG');
          produto  := clAux.result('EL_PROD');
          clAux2:=TClassAuxiliar.Create;
          clAux2.conect ('ESTOQUE',self);
          clAux2.ClearSql;
          clAux2.AddParam ('Select PR_UNID ');
          clAux2.AddParam ('From   PRODUTOS ');
          clAux2.AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND ');
          clAux2.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND ');
          clAux2.AddParam ('      (PR_CODI='+floattostr(produto)+')');
          clAux2.Execute;
          cor         := clAux.result('EL_CORE');
          tam         := clAux.result('EL_TAMA');
          if (tam='0') then
            tamanho:='UNICO'
          else
            tamanho:=tam;
          if (tipz='1') then
          begin
            saldo       := clAux.result('EL_QTD1');
            preco_custo := clAux.result('EL_PCU1');
            preco_venda := clAux.result('EL_PVE1');
          end
          else
          if (tipz='2') then
          begin
            saldo       := clAux.result('EL_QTD2');
            preco_custo := clAux.result('EL_PCU2');
            preco_venda := clAux.result('EL_PVE2');
          end;
          total_custo := (saldo*preco_custo);
          total_venda := (saldo*preco_venda);
          if (total_custo<>0) then
          begin
            if (total_venda>=total_custo) then
            begin
              dif:=total_venda - total_custo;
              margem:=((dif/total_custo)*100);
            end
            else
              margem:=0.00;
          end
          else
            margem:=0.00;
          AddLine (form_nz  (grupo,3)    +
            form_nz  (subgrupo,3) +
            form_nz  (produto,6)  +' '+
            form_t   (ProcuraNomeItemEstoque(grupo,subgrupo,produto,cor,tam,self),32)+' '+
            form_t   (ProcuraAbrevCor(cor,self),5)+' '+
            form_t   (tamanho,5)  +' '+
            form_nc2 (saldo,12,2) +' '+
            form_t   (clAux2.result('PR_UNID'),3)+' '+
            form_nc2 (preco_custo,10,3)+' '+
            form_nc  (total_custo,14)+' '+
            form_nc  (preco_venda,10)+' '+
            form_nc  (total_venda,14)+' '+
            form_nc  (margem,5));
          clAux2.Desconect;
          clAux2.Free;

                      {prox titulo -->}
          totgeral_totalcusto := totgeral_totalcusto + total_custo;
          totgeral_totalvenda := totgeral_totalvenda + total_venda;
          clAux.next;
          total_itens_loja := total_itens + 1;
          total_itens      := total_itens + 1;
          indGauge:=indGauge+1;
          frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
          frm_mensagem.gauge1.refresh;
        end;
        AddLine (form_tc2('-',132,'-'));
        if (totgeral_totalcusto<>0) then
        begin
          if (totgeral_totalvenda>=totgeral_totalcusto) then
          begin
            dif:=totgeral_totalvenda - totgeral_totalcusto;
            margem:=((dif/totgeral_totalcusto)*100);
          end
          else
            margem:=0.00;
        end
        else
          margem:=0.00;                 
        AddLine ('Total da loja '+form_n(lojaant,2)+': '+form_n(total_itens_loja,11)+
          form_tc2(' ',51,' ')+form_nc(totgeral_totalcusto,20)+'  '+
          form_nc(totgeral_totalvenda,23)+' '+
          form_nc(margem,6));
        AddLine ('Total geral de itens '+form_n(total_itens,8));
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

procedure Tfrm_ListaItensEstoque.btnConfereClick(Sender: TObject);
begin
  Confirmarttulo1.click;
end;

procedure Tfrm_ListaItensEstoque.edtInicial1DblClick(Sender: TObject);
begin
  ChamandoF8Lojas (edtInicial1,true);
end;

procedure Tfrm_ListaItensEstoque.edtFinal1DblClick(Sender: TObject);
begin
  ChamandoF8Lojas (edtFinal1,true);
end;

procedure Tfrm_ListaItensEstoque.edtInicial2DblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtInicial2,true);
end;

procedure Tfrm_ListaItensEstoque.edtFinal2DblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtFinal2,true);
end;

procedure Tfrm_ListaItensEstoque.edtInicial3DblClick(Sender: TObject);
begin
  ChamandoF8SubGrupos2(edtInicial3,true);
end;

procedure Tfrm_ListaItensEstoque.edtFinal3DblClick(Sender: TObject);
begin
  ChamandoF8SubGrupos2(edtFinal3,true);
end;

procedure Tfrm_ListaItensEstoque.FormCreate(Sender: TObject);
begin
  tipz:='1';
end;

end.
