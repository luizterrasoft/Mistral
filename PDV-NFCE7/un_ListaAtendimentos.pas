unit un_ListaAtendimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, PanelOO, MaskEditOO,
  LabelOO, CheckBoxOO;

type
  Tfrm_ListaAtendimentos = class(Tfrm_Auxformulario1)
    Vendedores: TLabelOO;
    edtVend1: TMaskEditOO;
    edtVend2: TMaskEditOO;
    LabelOO2: TLabelOO;
    edtData1: TMaskEditOO;
    LabelOO4: TLabelOO;
    edtData2: TMaskEditOO;
    rdSituacao: TRadioGroup;
    Bevel1: TBevel;
    LabelOO3: TLabelOO;
    chVend: TCheckBoxOO;
    Label54: TLabel;
    Label56: TLabel;
    Bevel8: TBevel;
    Label55: TLabel;
    chData: TCheckBoxOO;
    chSalto: TCheckBox;
    LabelOO5: TLabelOO;
    edtMotivo: TMaskEditOO;
    pnMotivo: TPanelOO;
    btnConfere: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Image2: TImage;
    Bevel2: TBevel;
    procedure N1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure edtMotivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMotivoDblClick(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure chVendClick(Sender: TObject);
    procedure chVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chDataClick(Sender: TObject);
    procedure chDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVend1DblClick(Sender: TObject);
    procedure edtVend2DblClick(Sender: TObject);
    procedure edtVend1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVend2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimeCabecalho;
  end;

var
  frm_ListaAtendimentos: Tfrm_ListaAtendimentos;

implementation

uses unMensagem, unDialogo, principal, mem_prnt, auxiliar, funcoes1, funcoes2, procura;

{$R *.DFM}

procedure Tfrm_ListaAtendimentos.N1Click(Sender: TObject);
var
  clAtdo: TClassAuxiliar;
  lojaant: Real;
  indGauge,totGauge: Integer;
  total_desc,total_desc_geral: Real;
  totvalor,totvalorgeral: Real;
  motivosuspensao,situacao: String;
  cDesc: String;
begin
  if (edtVend1.GetValor=0) and (not chVend.checked) then
    ExibeCritica ('Código do vendedor inicial não pode ficar vazio!','Atendimentos',edtVend1)
  else
  if (edtVend2.GetValor=0) and (not chVend.checked) then
    ExibeCritica ('Código do vendedor final não pode ficar vazio!','Atendimentos',edtVend2)
  else
  if (edtData1.GetValor=strtodate('01/01/1900')) and (not chData.checked) then
    ExibeCritica ('Data inicial não pode ficar vazia!','Atendimentos',edtData1)
  else
  if (edtData2.GetValor=strtodate('01/01/1900')) and (not chData.checked) then
    ExibeCritica ('Data final não pode ficar vazia!','Atendimentos',edtData2)
  else
  if (frm_principal.x_prazo_vendas<>'01/01/1900') and (edtData1.GetValor<StrToDateTime(frm_principal.x_prazo_vendas)) then
    ExibeCritica ('Data informada não permitida!','Atendimentos',edtData2)
  else
  begin
    InicializaFiltros;
    PreencheFiltroCheck(edtVend1,chVend,1);
    PreencheFiltroCheck(edtVend2,chVend,2);
    PreencheFiltroCheck(edtData1,chData,1);
    PreencheFiltroCheck(edtData2,chData,2);
    PreencheFiltro(edtMotivo);

          {iniciando o processamento do relatorio}
    mostra_mensagem ('Preparando relatório...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clAtdo := TClassAuxiliar.Create;
    with (clAtdo) do
    begin
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select *                                                                                       ');
      AddParam ('From   ATENDIMENTOS                                                                            ');
      AddParam ('Where (AT_LOJA='+floattostr(frm_principal.x_loja)+')  AND                                      ');
      AddParam ('      (AT_DATA>='+chr(39)+filtros[2]+chr(39)+') AND                                            ');
      AddParam ('      (AT_DATA<='+chr(39)+filtros[3]+chr(39)+') AND                                            ');
      AddParam ('      (AT_VEND>='+filtros[0]+') AND                                                            ');
      AddParam ('      (AT_VEND<='+filtros[1]+')                                                                ');
      if (filtros[4]<>'000') then
        AddParam (' AND (AT_MOTI='+filtros[4]+')                                      ');
      if (rdSituacao.itemindex=0) then
        AddParam ('    AND (AT_STAT='+chr(39)+'0'+chr(39)+')                     ')
      else
      if (rdSituacao.itemindex=1) then
        AddParam ('    AND (AT_STAT='+chr(39)+'1'+chr(39)+')                ')
      else
      if (rdSituacao.itemindex=2) then
        AddParam ('    AND (AT_STAT='+chr(39)+'2'+chr(39)+')                ');
      AddParam ('Order By AT_LOJA,AT_VEND,AT_DATA                                                               ');
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Atendimentos',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      end
      else
      begin
        with (frm_mem_print) do
        begin
                       {configurando o gerador de relatorios}
          PrepareReport;
          frm_principal.x_col_impressao := 132;
          frm_principal.x_arq_impressao := 'v01.rel';
          frm_principal.x_comando       := '15c';
          frm_principal.x_tam_fonte     := 12;
          Title:= 'LISTAGEM DE ATENDIMENTOS';

                       {iniciando impressao}
          if (not chSalto.checked) then
          begin
            ImprimeCabecalho;
            Addline ('');
          end;
          clAtdo.first;
          lojaant       := -1;
          indGauge      := 0;
          totGauge      := clAtdo.reccount;
          totvalor         := 0.00;
          totvalorgeral    := 0.00;
          total_desc       := 0.00;
          total_desc_geral := 0.00;
          while (not clAtdo.eof) do
          begin
                            {ORDEM: separando por data de vencimento ***}
            if (clAtdo.Result('AT_LOJA')<>lojaant) then
            begin
              if (lojaant<>-1) then
              begin
                AddLine(form_tc('-',132,'-'));
                AddLine(form_tc(' ',38,' ')+'Total da loja '+form_nz(lojaant,2)+'.: '+
                  form_nc(totvalor,10)+'  '+
                  'Descontos: '+form_nc(total_desc,10));
                if (chSalto.checked) then
                  AddLine(chr(12)+form_tc2(' ',79,' '))
                else
                  AddLine('');
              end;
              totvalor := 0.00;
              lojaant  := clAtdo.Result('AT_LOJA');
              if (chSalto.checked) then
              begin
                ImprimeCabecalho;  
                AddLine('');
              end;
              AddLine ('Loja...: '+form_nz(lojaant,2)+'/'+ProcuraNomeLoja(lojaant,self));
              AddLine (form_tc('-',132,'-'));
              AddLine ('Data      |    |Numero   |                           |    |         |          |             |Motivo do');
              AddLine ('Atendime. |Term|Atendime.|Vendedor                   |Qtde|  Total $|Desconto  |Sit          |Cancelamento');
              AddLine (form_tc('-',132,'-'));
            end;
            motivosuspensao:='';
            if (clAtdo.Result('AT_STAT')='0') then
              situacao:='Em Andamento'
            else
            if (clAtdo.Result('AT_STAT')='1') then
              situacao:='Concluido   '
            else
            if (clAtdo.Result('AT_STAT')='2') then
            begin
              situacao:='Cancelado   ';
              if (clAtdo.Result('AT_MOTI')<>0) then
                motivosuspensao:=form_nz(clAtdo.Result('AT_MOTI'),2)+'/'+
                  ProcuraNomeMotivoSuspensAtdo(clAtdo.Result('AT_MOTI'),self)
              else
                motivosuspensao:='[SEM MOTIVO INFORMADO]';
            end;
            if (clAtdo.Result('AT_DESC')>0) then
            begin
              cDesc := form_nc(clAtdo.Result('AT_DESC'),9)+'%';
              total_desc := total_desc + ((clAtdo.Result('AT_DESC')/100)*clAtdo.Result('AT_TOTA'));
              total_desc_geral := total_desc_geral + ((clAtdo.Result('AT_DESC')/100)*clAtdo.Result('AT_TOTA'));
            end
            else
            if (clAtdo.Result('AT_DESC')<0) then
            begin
              cDesc := form_nc((-1)*clAtdo.Result('AT_DESC'),10);
              total_desc := total_desc + (-1)*clAtdo.Result('AT_DESC');
              total_desc_geral := total_desc_geral + (-1)*clAtdo.Result('AT_DESC');
            end
            else
            if (clAtdo.Result('AT_DESC')=0.00) then
              cDesc := form_t(' ',10);
            AddLine (form_data (clAtdo.Result('AT_DATA'))    +' '+
              form_nz   (clAtdo.Result('AT_CAIX'),3)  +' '+
              form_n    (clAtdo.Result('AT_CODI'),10) +' '+
              form_nz   (clAtdo.Result('AT_VEND'),6)  +'-'+
              form_t    (ProcuraNomeVend(clAtdo.Result('AT_LOJA'),
              clAtdo.Result('AT_VEND'),self),20)  +' '+
              form_n    (clAtdo.Result('AT_QTDE'),4)  +' '+
              form_nc   (clAtdo.Result('AT_TOTA'),9)  +' '+
              cDesc                                   +' '+
              situacao                                +'  '+
              motivosuspensao);
            totvalor      := totvalor      + clAtdo.result('AT_TOTA');
            totvalorgeral := totvalorgeral + clAtdo.result('AT_TOTA');
            clAtdo.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          AddLine(form_tc('-',132,'-'));
          AddLine(form_tc(' ',38,' ')+'Total da loja '+form_nz(lojaant,2)+'.: '+
            form_nc(totvalor,10)+'  '+
            'Descontos: '+form_nc(total_desc,10));
          AddLine(form_tc(' ',28,' ')+'        Total geral.: '+
            form_nc(totvalorgeral,17)+'  '+
            'Descontos: '+form_nc(total_desc_geral,10));

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
    DestroiFiltros;
  end;
end;

procedure Tfrm_ListaAtendimentos.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
  rdSituacao.itemindex:=3; //Todas...
  edtVend1.setfocus;
end;

procedure Tfrm_ListaAtendimentos.botao1Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_ListaAtendimentos.ImprimeCabecalho;
begin
  if (chVend.checked) then
    frm_mem_print.AddLine('Vendedores...........: TODOS OS VENDEDORES')
  else
    frm_mem_print.AddLine('Vendedores...........: '+filtros[0]+' a '+filtros[1]);
  if (chData.checked) then
    frm_mem_print.AddLine('Data/Atendimentos....: TODOS OS ATENDIMENTOS')
  else
    frm_mem_print.Addline('Data/Atendimentos....:'+InverteStringData(filtros[2])+' a '+
      InverteStringData(filtros[3]));
  if (rdSituacao.itemindex=0) then
    frm_mem_print.AddLine(' - Situacao dos atendimentos: EM ANDAMENTO -')
  else
  if (rdSituacao.itemindex=1) then
    frm_mem_print.AddLine(' - Situacao dos atendimentos: CONCLUIDOS -')
  else
  if (rdSituacao.itemindex=2) then
    frm_mem_print.AddLine(' - Situacao dos atendimentos: CANCELADOS -');
end;

procedure Tfrm_ListaAtendimentos.edtMotivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1Click(Sender)
  else
  if (key=K_F8) then
    ChamandoF8MotivosSuspensAtdo(edtMotivo,false)
  else
    edtmaskeditformulario1KeyDown(Sender,Key,Shift);
end;

procedure Tfrm_ListaAtendimentos.edtMotivoDblClick(Sender: TObject);
begin
  ChamandoF8MotivosSuspensAtdo(edtMotivo,false)
end;

procedure Tfrm_ListaAtendimentos.btnConfereClick(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_ListaAtendimentos.chVendClick(Sender: TObject);
begin
  if (not chVend.checked) then
  begin
    habilitaeditVerde(edtVend1);
    habilitaeditVerde(edtVend2);
    edtVend1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtVend1);
    desabilitaeditVerde(edtVend2);
    edtData1.setfocus;
  end;
end;

procedure Tfrm_ListaAtendimentos.chVendKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chVend.checked) then
  begin
    habilitaeditVerde(edtVend1);
    habilitaeditVerde(edtVend2);
    edtVend1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtVend1);
    desabilitaeditVerde(edtVend2);
    edtMotivo.setfocus;
  end;
end;

procedure Tfrm_ListaAtendimentos.chDataClick(Sender: TObject);
begin
  if (not chData.checked) then
  begin
    habilitaeditVerde(edtData1);
    habilitaeditVerde(edtData2);
    edtData1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtData1);
    desabilitaeditVerde(edtData2);
    edtMotivo.setfocus;
  end;
end;

procedure Tfrm_ListaAtendimentos.chDataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chData.checked) then
  begin
    habilitaeditVerde(edtData1);
    habilitaeditVerde(edtData2);
    edtData1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtData1);
    desabilitaeditVerde(edtData2);
    edtMotivo.setfocus;
  end;
end;

procedure Tfrm_ListaAtendimentos.edtVend1DblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtVend1);
end;

procedure Tfrm_ListaAtendimentos.edtVend2DblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtVend2);
end;

procedure Tfrm_ListaAtendimentos.edtVend1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtVend2.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVend1);
end;

procedure Tfrm_ListaAtendimentos.edtVend2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtData1.setfocus;
  if (key=K_CIMA) then
    edtVend1.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVend2);
end;

end.
