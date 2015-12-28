unit un_PromocoesAVencer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, un_Auxformulario2, Menus, BotaoSair, StdCtrls, Mask, ExtCtrls,
  LabelOO, MaskEditOO;

type
  Tfrm_PromocoesAVencer = class(Tfrm_Auxformulario2)
    Bevel1: TBevel;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    edtDiasAVencer: TMaskEditOO;
    Panel1: TPanel;
    Bevel2: TBevel;
    Image2: TImage;
    Label3: TLabel;
    Label1: TLabel;
    chExibirCorTamanho: TCheckBox;
    procedure edtDiasAVencerEnter(Sender: TObject);
    procedure edtDiasAVencerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_PromocoesAVencer: Tfrm_PromocoesAVencer;

implementation

uses unMensagem, principal, unDialogo, mem_prnt, auxiliar, funcoes1, funcoes2, procura;

{$R *.dfm}

procedure Tfrm_PromocoesAVencer.edtDiasAVencerEnter(Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

procedure Tfrm_PromocoesAVencer.edtDiasAVencerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    N1.click;
end;

procedure Tfrm_PromocoesAVencer.Limparformulrio1Click(Sender: TObject);
begin
  edtDiasAVencer.text:='';
  edtDiasAVencer.setfocus;
end;

procedure Tfrm_PromocoesAVencer.Panel1Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_PromocoesAVencer.N1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  dias_a_vencer: Integer;
  total_promocoes: Integer;
  indGauge,totGauge: Integer;
  prodAnt,sprod: String;
  sTam: String;
begin
  if (edtDiasAVencer.GetValor<>0) then
  begin
    mostra_mensagem ('Buscando dados...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;

    if (not chExibirCorTamanho.checked) then
    begin
              {...}
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('Select DISTINCT PP_GRUP,PP_SUBG,PP_PROD,PP_PRE1,PP_DAT1,PP_DAT2,PR_REFI                                                       ');
      clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                                                                    ');
      clAux.AddParam ('LEFT JOIN PRODUTOS ON (PR_GRUP = PP_GRUP AND PR_SUBG = PP_SUBG AND PR_CODI = PP_PROD)                                         ');                                       
      clAux.AddParam ('Where (PP_LOJA='+floattostr(frm_principal.x_loja)+') AND                                                                      ');
      clAux.AddParam ('      ((PP_DAT2 - '+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+')<='+trim(edtDiasAVencer.text)+') AND   '); {*}
      clAux.AddParam ('      (PP_DAT2>'+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+')                                          ');
      clAux.AddParam ('Order by PP_GRUP,PP_SUBG,PP_PROD,PP_DAT2                                                                                      ');
      if (not clAux.Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Listagem de vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
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
          frm_principal.x_arq_impressao := 'promocoesavencer.rel';
          frm_principal.x_tam_fonte     := 8;
          Title:= 'PROMOCOES A VENCER';
        end;

        frm_mem_print.AddLine (form_tc2('-',132,'-'));
        frm_mem_print.AddLine ('                                                             |        |           |          |Dias a');
        frm_mem_print.AddLine ('Ref.    |Nome do produto                                     |Preco $ | Inicio    |Vigencia  |Vencer');
        frm_mem_print.AddLine (form_tc2('-',132,'-'));

        mostra_mensagem ('Preparando relatório... Aguarde!');
        frm_mensagem.painel.visible:=true;
        frm_mensagem.gauge1.progress:=0;

                  {...}
        clAux.first;
        total_promocoes := 0;
        indGauge:=0;
        totGauge:=clAux.reccount;
        while (not clAux.eof) do
        begin
          dias_a_vencer := clAux.result('PP_DAT2') - frm_principal.x_data_trabalho;
          frm_mem_print.AddLine (form_t(clAux.result('PR_REFI'),8)+' '+
            form_t(ProcuraNomeProdutos_1 (clAux.result('PP_GRUP'),
            clAux.result('PP_SUBG'),
            clAux.result('PP_PROD'),
            self),50) + ' ' +
            form_nc   (clAux.result('PP_PRE1'),10)        + ' ' +
            form_data (clAux.result('PP_DAT1'))           + ' ' +
            form_data (clAux.result('PP_DAT2'))           + ' ' +
            form_n    (dias_a_vencer,5)+' dia(s)');

                       {--->}
          total_promocoes := total_promocoes + 1;
          clAux.next;
          indGauge:=indGauge+1;
          frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
          frm_mensagem.gauge1.refresh;
        end;
        frm_mem_print.AddLine (form_tc2('-',132,'-'));
        frm_mem_print.AddLine ('Qtde. de produtos em promoção ... : '+form_n(total_promocoes,8));

                  {salto de pagina}
        if (frm_principal.x_salto) then
          frm_mem_print.AddLine(chr(18)+chr(12))
        else
          frm_mem_print.AddLine(chr(18));

        frm_mem_print.windowstate:=wsMaximized;
        esconde_mensagem;
        frm_mem_print.showmodal;
      end;
      clAux.desconect;
      clAux.Free;
    end

          //EXIBINDO COR / TAMANHO DE CADA PRODUTO
    else
    begin
              {...}
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('Select PP_GRUP,PP_SUBG,PP_PROD,PP_CORE,PP_TAMA,PP_PRE1,PP_DAT1,PP_DAT2,PR_REFI                                                ');
      clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                                                                    ');
      clAux.AddParam ('LEFT JOIN PRODUTOS ON (PR_GRUP = PP_GRUP AND PR_SUBG = PP_SUBG AND PR_CODI = PP_PROD)                                         ');
      clAux.AddParam ('Where (PP_LOJA='+floattostr(frm_principal.x_loja)+') AND                                                                      ');
      clAux.AddParam ('      ((PP_DAT2 - '+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+')<='+trim(edtDiasAVencer.text)+') AND   '); {*}
      clAux.AddParam ('      (PP_DAT2>'+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+')                                          ');
      clAux.AddParam ('Order by PP_GRUP,PP_SUBG,PP_PROD,PP_CORE,PP_TAMA,PP_DAT2                                                                      ');
      if (not clAux.Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Listagem de vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
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
          frm_principal.x_arq_impressao := 'promocoesavencer.rel';
          frm_principal.x_tam_fonte     := 8;
          Title:= 'PROMOCOES A VENCER';
        end;

        frm_mem_print.AddLine (form_tc2('-',132,'-'));
        frm_mem_print.AddLine ('                                                              |        |           |          |Dias a');
        frm_mem_print.AddLine ('Ref.    |Nome do produto                                      |Preco $ | Inicio    |Vigencia  |Vencer');
        frm_mem_print.AddLine (form_tc2('-',132,'-'));

        mostra_mensagem ('Preparando relatório... Aguarde!');
        frm_mensagem.painel.visible:=true;
        frm_mensagem.gauge1.progress:=0;

                  {...}
        clAux.first;
        total_promocoes := 0;
        prodAnt  := '-1';
        indGauge := 0;
        totGauge := clAux.reccount;
        while (not clAux.eof) do
        begin
          sprod := form_nz(clAux.result('PP_GRUP'),2)+form_nz(clAux.result('PP_SUBG'),2)+form_nz(clAux.result('PP_PROD'),4);
          if (prodAnt<>sprod) then
          begin
            prodAnt:=sprod;
            if (prodAnt<>'-1') then
              frm_mem_print.AddLine ('');
            total_promocoes := total_promocoes + 1;
            frm_mem_print.AddLine (form_t(clAux.result('PR_REFI'),8)+' '+ form_t(ProcuraNomeProdutos_1 (clAux.result('PP_GRUP'),
              clAux.result('PP_SUBG'),
              clAux.result('PP_PROD'),
              self),40));
          end;

          dias_a_vencer := clAux.result('PP_DAT2') - frm_principal.x_data_trabalho;
          if (clAux.result('PP_TAMA')='0') then
            sTam := 'UNICO'
          else
            sTam := clAux.result('PP_TAMA');
          frm_mem_print.AddLine (' ' + form_t(' ',38) + ' - ' +
            form_t    (ProcuraNomeCor(clAux.result('PP_CORE'),self),10) + ' / ' +
            form_t    (sTam,5)                            + ' ' +
            form_nc   (clAux.result('PP_PRE1'),10)        + ' ' +
            form_data (clAux.result('PP_DAT1'))           + ' ' +
            form_data (clAux.result('PP_DAT2'))           + ' ' +
            form_n    (dias_a_vencer,5)+' dia(s)');

                       {--->}
          clAux.next;
          indGauge:=indGauge+1;
          frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
          frm_mensagem.gauge1.refresh;
        end;
        frm_mem_print.AddLine (form_tc2('-',132,'-'));
        frm_mem_print.AddLine ('Qtde. de produtos em promoção ... : '+form_n(total_promocoes,8));

                  {salto de pagina}
        if (frm_principal.x_salto) then
          frm_mem_print.AddLine(chr(18)+chr(12))
        else
          frm_mem_print.AddLine(chr(18));

        frm_mem_print.windowstate:=wsMaximized;
        esconde_mensagem;
        frm_mem_print.showmodal;
      end;
      clAux.desconect;
      clAux.Free;
    end;
  end;
end;

procedure Tfrm_PromocoesAVencer.FormActivate(Sender: TObject);
begin
  inherited;
  edtDiasAVencer.setfocus;
end;

procedure Tfrm_PromocoesAVencer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//     frm_principal.x_memoria_solicitacao_dias_a_vencer_promocao                := edtDiasAVencer.GetValor;
  frm_principal.x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho := chExibirCorTamanho.checked;
end;

end.
