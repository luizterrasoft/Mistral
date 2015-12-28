unit un_ListaMaisVend2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, PanelOO, CheckBoxOO,
  MaskEditOO, LabelOO;

type
  Tfrm_ListaMaisVend2 = class(Tfrm_Auxformulario1)
    LabelOO3: TLabelOO;
    edtData1: TMaskEditOO;
    LabelOO2: TLabelOO;
    edtData2: TMaskEditOO;
    chDataPedido: TCheckBoxOO;
    LabelOO4: TLabelOO;
    edtLoja1: TMaskEditOO;
    edtLoja2: TMaskEditOO;
    pnLoja2: TPanelOO;
    pnLoja1: TPanelOO;
    chLoja: TCheckBoxOO;
    LabelOO7: TLabelOO;
    edtGrupo1: TMaskEditOO;
    pnGrupo1: TPanelOO;
    pnGrupo2: TPanelOO;
    chGrupo: TCheckBoxOO;
    LabelOO10: TLabelOO;
    edtSubgrupo1: TMaskEditOO;
    chSubgrupo: TCheckBoxOO;
    LabelOO13: TLabelOO;
    edtForn1: TMaskEditOO;
    pnForn1: TPanelOO;
    pnForn2: TPanelOO;
    chForn: TCheckBoxOO;
    edtColecao1: TMaskEditOO;
    pnColecao1: TPanelOO;
    pnColecao2: TPanelOO;
    LabelOO18: TLabelOO;
    chColecao: TCheckBoxOO;
    edtLinha2: TMaskEditOO;
    edtLinha1: TMaskEditOO;
    pnLinha1: TPanelOO;
    pnLinha2: TPanelOO;
    LabelOO21: TLabelOO;
    chLinha: TCheckBoxOO;
    edtGrupo2: TMaskEditOO;
    edtSubgrupo2: TMaskEditOO;
    edtForn2: TMaskEditOO;
    edtColecao2: TMaskEditOO;
    Label54: TLabel;
    Bevel8: TBevel;
    Label56: TLabel;
    Label55: TLabel;
    lbtipz: TLabel;
    LabelOO22: TLabelOO;
    edtQtde: TMaskEditOO;
    rdOrdem: TRadioGroup;
    LabelOO1: TLabelOO;
    Bevel1: TBevel;
    LabelOO5: TLabelOO;
    edtVend1: TMaskEditOO;
    edtVend2: TMaskEditOO;
    chVend: TCheckBoxOO;
    LabelOO6: TLabelOO;
    procedure botao1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    tipz: String;
    procedure MontandoSqlVendas1(tipz: String);
  end;

var
  frm_ListaMaisVend2: Tfrm_ListaMaisVend2;

implementation

uses unMensagem, principal, funcoes1, funcoes2, procura, auxiliar,
  un_ListaVendas4_Relatorio, un_ListaMaisVend2_Relatorio;

{$R *.DFM}

procedure Tfrm_ListaMaisVend2.botao1Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_ListaMaisVend2.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
  edtData1.setfocus;
end;

procedure Tfrm_ListaMaisVend2.N1Click(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  vendant: String;
  indGauge,totGauge: Integer;
  ind: Integer;
begin
     {**** CRITICAS ****}
  if (not edtData1.IsDate) then
    ExibeCritica('Formato incorreto de data',edtData1.zNomeOO,edtData1)
  else
  if (not edtData2.IsDate) then
    ExibeCritica('Formato incorreto de data',edtData2.zNomeOO,edtData2)
  else
  if (edtData1.GetValor=strtodate('01/01/1900')) and (not chDataPedido.checked) then
    ExibeCritica(edtData1.zNomeOO+' não pode ficar vazio!',edtData1.zNomeOO,edtData1)
  else
  if (edtData2.GetValor=strtodate('01/01/1900')) and (not chDataPedido.checked) then
    ExibeCritica(edtData2.zNomeOO+' não pode ficar vazio!',edtData2.zNomeOO,edtData2)
  else
  if (edtLoja1.GetValor=0) and (not chLoja.checked) then
    ExibeCritica(edtLoja1.zNomeOO+' não pode ficar vazio!',edtLoja1.zNomeOO,edtLoja1)
  else
  if (edtLoja2.GetValor=0) and (not chLoja.checked) then
    ExibeCritica(edtLoja2.zNomeOO+' não pode ficar vazio!',edtLoja2.zNomeOO,edtLoja2)
  else
  if (edtLoja1.GetValor>edtLoja2.GetValor) and (not chLoja.checked) then
    ExibeCritica('Valor de(a) '+edtLoja1.zNomeOO+' não pode ser maior que o valor de '
      +edtLoja2.zNomeOO,edtLoja2.zNomeOO,edtLoja2)
  else
  if (edtGrupo1.GetValor=0) and (not chGrupo.checked) then
    ExibeCritica(edtGrupo1.zNomeOO+' não pode ficar vazio!',edtGrupo1.zNomeOO,edtGrupo1)
  else
  if (edtGrupo2.GetValor=0) and (not chGrupo.checked) then
    ExibeCritica(edtGrupo2.zNomeOO+' não pode ficar vazio!',edtGrupo2.zNomeOO,edtGrupo2)
  else
  if (edtGrupo1.GetValor>edtGrupo2.GetValor) and (not chGrupo.checked) then
    ExibeCritica('Valor de(a) '+edtGrupo1.zNomeOO+' não pode ser maior que o valor de '
      +edtGrupo2.zNomeOO,edtGrupo2.zNomeOO,edtGrupo2)
  else
  if (edtSubgrupo1.GetValor=0) and (not chSubGrupo.checked) then
    ExibeCritica(edtSubgrupo1.zNomeOO+' não pode ficar vazio!',edtSubgrupo1.zNomeOO,edtSubgrupo1)
  else
  if (edtSubgrupo2.GetValor=0) and (not chSubGrupo.checked) then
    ExibeCritica(edtSubgrupo2.zNomeOO+' não pode ficar vazio!',edtSubgrupo2.zNomeOO,edtSubgrupo2)
  else
  if (edtSubgrupo1.GetValor>edtSubgrupo2.GetValor) and (not chGrupo.checked) then
    ExibeCritica('Valor de(a) '+edtSubgrupo1.zNomeOO+' não pode ser maior que o valor de '
      +edtSubgrupo2.zNomeOO,edtSubgrupo2.zNomeOO,edtSubgrupo2)
  else
  if (edtForn1.GetValor=0) and (not chForn.checked) then
    ExibeCritica(edtForn1.zNomeOO+' não pode ficar vazio!',edtForn1.zNomeOO,edtForn1)
  else
  if (edtForn2.GetValor=0) and (not chForn.checked) then
    ExibeCritica(edtForn2.zNomeOO+' não pode ficar vazio!',edtForn2.zNomeOO,edtForn2)
  else
  if (edtForn1.GetValor>edtForn2.GetValor) and (not chForn.checked) then
    ExibeCritica('Valor de(a) '+edtForn1.zNomeOO+' não pode ser maior que o valor de '
      +edtForn2.zNomeOO,edtForn2.zNomeOO,edtForn2)
  else
  if (edtColecao1.GetValor=0) and (not chColecao.checked) then
    ExibeCritica(edtColecao1.zNomeOO+' não pode ficar vazio!',edtColecao1.zNomeOO,edtColecao1)
  else
  if (edtColecao2.GetValor=0) and (not chColecao.checked) then
    ExibeCritica(edtColecao2.zNomeOO+' não pode ficar vazio!',edtColecao2.zNomeOO,edtColecao2)
  else
  if (edtColecao1.GetValor>edtForn2.GetValor) and (not chColecao.checked) then
    ExibeCritica('Valor de(a) '+edtColecao1.zNomeOO+' não pode ser maior que o valor de '
      +edtColecao2.zNomeOO,edtColecao2.zNomeOO,edtColecao2)
  else
  if (edtLinha1.GetValor=0) and (not chLinha.checked) then
    ExibeCritica(edtLinha1.zNomeOO+' não pode ficar vazio!',edtLinha1.zNomeOO,edtLinha1)
  else
  if (edtLinha2.GetValor=0) and (not chLinha.checked) then
    ExibeCritica(edtLinha2.zNomeOO+' não pode ficar vazio!',edtLinha2.zNomeOO,edtLinha2)
  else
  if (edtLinha1.GetValor>edtLinha2.GetValor) and (not chLinha.checked) then
    ExibeCritica('Valor de(a) '+edtLinha1.zNomeOO+' não pode ser maior que o valor de '
      +edtLinha2.zNomeOO,edtLinha2.zNomeOO,edtLinha2)
  else
  if (edtVend1.GetValor=0) and (not chVend.checked) then
    ExibeCritica(edtVend1.zNomeOO+' não pode ficar vazio!',edtVend1.zNomeOO,edtVend1)
  else
  if (edtVend2.GetValor=0) and (not chVend.checked) then
    ExibeCritica(edtVend2.zNomeOO+' não pode ficar vazio!',edtVend2.zNomeOO,edtVend2)
  else
  if (edtVend1.GetValor>edtVend2.GetValor) and (not chVend.checked) then
    ExibeCritica('Valor de(a) '+edtVend1.zNomeOO+' não pode ser maior que o valor de '
      +edtVend2.zNomeOO,edtVend2.zNomeOO,edtVend2)
  else
  if (edtQtde.GetValor=0) then
    ExibeCritica(edtQtde.zNomeOO+' não pode ficar vazio!',edtQtde.zNomeOO,edtQtde)
  else
  begin
          {**** FILTROS *****}
    InicializaFiltros;
    PreencheFiltroCheck(edtData1,chDataPedido,1);
    PreencheFiltroCheck(edtData2,chDataPedido,2);
    PreencheFiltroCheck(edtLoja1,chLoja,1);
    PreencheFiltroCheck(edtLoja2,chLoja,2);
    PreencheFiltroCheck(edtGrupo1,chGrupo,1);
    PreencheFiltroCheck(edtGrupo2,chGrupo,2);
    PreencheFiltroCheck(edtSubGrupo1,chSubGrupo,1);
    PreencheFiltroCheck(edtSubGrupo2,chSubGrupo,2);
    PreencheFiltroCheck(edtForn1,chForn,1);
    PreencheFiltroCheck(edtForn2,chForn,2);
    PreencheFiltroCheck(edtColecao1,chColecao,1);
    PreencheFiltroCheck(edtColecao2,chColecao,2);
    PreencheFiltroCheck(edtLinha1,chLinha,1);
    PreencheFiltroCheck(edtLinha2,chLinha,2);
    PreencheFiltroCheck(edtVend1,chVend,1);
    PreencheFiltroCheck(edtVend2,chVend,2);
    PreencheFiltro(edtQtde);
          {******************}

          {...}
    Application.CreateForm(Tfrm_ListaMaisVend2_Relatorio, frm_ListaMaisVend2_Relatorio);
    with (frm_ListaMaisVend2_Relatorio) do
    begin
               {......................................................}
      MontandoSqlVendas1(tipz);
               {......................................................}
      if (rdOrdem.itemindex=0) then
        qVendas1.sql.Add('Order by 4 desc')
      else
      if (rdOrdem.itemindex=1) then
        qVendas1.sql.Add('Order by 5 desc');
               {......................................................}
      qVendas1.close;
      qVendas1.parambyname('data1').AsDateTime  := strtodate (InverteStringData(filtros[0]));
      qVendas1.parambyname('data2').AsDateTime  := strtodate (InverteStringData(filtros[1]));
      qVendas1.parambyname('loja1').AsFloat     := strtofloat(filtros[2]);
      qVendas1.parambyname('loja2').AsFloat     := strtofloat(filtros[3]);
      qVendas1.parambyname('grupo1').AsFloat    := strtofloat(filtros[4]);
      qVendas1.parambyname('grupo2').AsFloat    := strtofloat(filtros[5]);
      qVendas1.parambyname('subgrupo1').AsFloat := strtofloat(filtros[6]);
      qVendas1.parambyname('subgrupo2').AsFloat := strtofloat(filtros[7]);
      qVendas1.parambyname('forn1').AsFloat     := strtofloat(filtros[8]);
      qVendas1.parambyname('forn2').AsFloat     := strtofloat(filtros[9]);
      qVendas1.parambyname('colecao1').AsFloat  := strtofloat(filtros[10]);
      qVendas1.parambyname('colecao2').AsFloat  := strtofloat(filtros[11]);
      qVendas1.parambyname('linha1').AsFloat    := strtofloat(filtros[12]);
      qVendas1.parambyname('linha2').AsFloat    := strtofloat(filtros[13]);
      qVendas1.parambyname('vend1').AsFloat     := strtofloat(filtros[14]);
      qVendas1.parambyname('vend2').AsFloat     := strtofloat(filtros[15]);
      if (tipz<>'3') then
        qVendas1.parambyname('tipz').AsString     := tipz;
               {......................................................}
      mostra_mensagem('Buscando vendas p/ produto...Aguarde!');
      qVendas1.open;
      if (qVendas1.recordcount=0) then
        ExibeCritica('Não há movimento nestas condições!','Vendas',edtData1)
      else
      begin
        esconde_mensagem;
                   {......................................................}
        y_qtde  := 0;
        y_total := 0.00;
        ind     := 0;
        qVendas1.first;
        while (not qVendas1.eof) do
        begin
          y_qtde  := y_qtde + qVendas1.fieldbyname('QTDE').AsInteger;
          y_total := y_total + qVendas1.fieldbyname('TOTAL').Asfloat;
          ind     := ind + 1;
          if (ind=edtQtde.getvalor) then
            break;
          qVendas1.next;
        end;
                   {......................................................}
        qVendas1.first;
        relatorio.preview;
                   {......................................................}
      end;
      esconde_mensagem;
    end;
    frm_ListaMaisVend2_Relatorio.Free;
          {...}
  end;
end;

procedure Tfrm_ListaMaisVend2.FormCreate(Sender: TObject);
begin
  inherited;
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
end;

procedure Tfrm_ListaMaisVend2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
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
        tipz:='3';
        lbtipz.visible:=true;
      end
      else
      if (tipz='3') then
      begin
        tipz:='1';
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
end;

procedure Tfrm_ListaMaisVend2.edtQtdeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1.click;
  if (key=K_CIMA) then
    edtLinha2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica('Qtde de produtos analisados - formato: 9999 ',5);
  if (key=K_F8) then
    ChamandoF8Linhas(TMaskEditOO(Sender),false);
end;

procedure Tfrm_ListaMaisVend2.MontandoSqlVendas1(tipz: String);
begin
  with (frm_ListaMaisVend2_Relatorio) do
  begin
    qVendas1.sql.clear;
    qVendas1.sql.Add ('SELECT IV_GRUP,IV_SUBG,IV_PROD,');
    qVendas1.sql.Add (' SUM(IV_TOTA) as TOTAL,');
    qVendas1.sql.Add (' SUM(IV_QTDE) as QTDE');
    qVendas1.sql.Add ('FROM   ITENS_VENDAS,VENDAS,PRODUTOS');
    qVendas1.sql.Add ('WHERE (IV_LOJA=VE_LOJA) AND (IV_CAIX=VE_CAIX) AND (IV_VEND=VE_CODI) AND');
    qVendas1.sql.Add ('      (VE_DATA>=:data1) AND (VE_DATA<=:data2) AND');
    qVendas1.sql.Add ('      (VE_LOJA>=:loja1) AND (VE_LOJA<=:loja2) AND');
    qVendas1.sql.Add ('      (PR_GRUP=IV_GRUP) AND (PR_SUBG=IV_SUBG) AND (PR_CODI=IV_PROD) AND');
    qVendas1.sql.Add ('      (PR_FORN>=:forn1) AND (PR_FORN<=:forn2) AND');
    qVendas1.sql.Add ('      (PR_COLE>=:colecao1) AND (PR_COLE<=:colecao2) AND');
    qVendas1.sql.Add ('      (PR_LINH>=:linha1) AND (PR_LINH<=:linha2) AND');
    qVendas1.sql.Add ('      (IV_GRUP>=:grupo1) AND (IV_GRUP<=:grupo2) AND');
    qVendas1.sql.Add ('      (IV_SUBG>=:subgrupo1) AND (IV_SUBG<=:subgrupo2) AND');
    qVendas1.sql.Add ('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND ');
    qVendas1.sql.Add ('      (IV_TOTA>0.00) AND ');
    qVendas1.sql.Add ('      (VE_VEND>=:vend1) AND (VE_VEND<=:vend2) ');
    if (tipz<>'3') then
      qVendas1.sql.Add ('  AND (VE_TIPZ=:tipz)');
    qVendas1.sql.Add ('GROUP BY IV_GRUP,IV_SUBG,IV_PROD');
  end;
end;

end.
