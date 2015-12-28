unit un_ListaMaisVend2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, PanelOO, CheckBoxOO,
  MaskEditOO, LabelOO,funcoesglobais,db,dbtables;

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
    LabelOO22: TLabelOO;
    edtQtde: TMaskEditOO;
    rdOrdem: TRadioGroup;
    LabelOO5: TLabelOO;
    edtVend1: TMaskEditOO;
    edtVend2: TMaskEditOO;
    chVend: TCheckBoxOO;
    btnConfere: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Image2: TImage;
    PnSubGrupo1: TPanelOO;
    PnSubgrupo2: TPanelOO;
    PnVendedor1: TPanelOO;
    PnVendedor2: TPanelOO;
    Bevel1: TBevel;
    lbtipz: TLabel;
    procedure Limparformulrio1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfereClick(Sender: TObject);
    procedure chDataPedidoClick(Sender: TObject);
    procedure chDataPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chLojaClick(Sender: TObject);
    procedure chLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chGrupoClick(Sender: TObject);
    procedure chGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chSubgrupoClick(Sender: TObject);
    procedure chSubgrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chFornClick(Sender: TObject);
    procedure chFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chColecaoClick(Sender: TObject);
    procedure chColecaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chLinhaClick(Sender: TObject);
    procedure chLinhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chVendClick(Sender: TObject);
    procedure chVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLoja1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLoja2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVend1DblClick(Sender: TObject);
    procedure edtVend2DblClick(Sender: TObject);
    procedure edtVend1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVend2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubgrupo1Exit(Sender: TObject);
    procedure edtSubgrupo2Exit(Sender: TObject);
    procedure edtVend1Exit(Sender: TObject);
    procedure edtVend2Exit(Sender: TObject);
    procedure edtLoja1Exit(Sender: TObject);
    procedure edtSubgrupo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmaskeditformulario1Enter(Sender: TObject);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtLinha2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLinha1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtColecao2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtColecao1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtForn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtForn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grupo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
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

uses unMensagem, principal, funcoes1, funcoes2, procura, auxiliar, un_ListaMaisVend2_Relatorio,
  unDialogo;

{$R *.DFM}

procedure Tfrm_ListaMaisVend2.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
     //... questao de seguranca para as lojas
     //....................................................................
     //....................................................................
  btnConfere.caption := 'Imprimir listagem';
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
    ExibeCritica(edtData1.zNomeOO+' não pode ficar vazia!',edtData1.zNomeOO,edtData1)
  else
  if (edtData2.GetValor=strtodate('01/01/1900')) and (not chDataPedido.checked) then
    ExibeCritica(edtData2.zNomeOO+' não pode ficar vazia!',edtData2.zNomeOO,edtData2)
  else
  if (edtLoja1.GetValor='') and (not chLoja.checked) then
    ExibeCritica(edtLoja1.zNomeOO+' não pode ficar vazio!',edtLoja1.zNomeOO,edtLoja1)
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
  if (frm_principal.x_prazo_vendas<>'01/01/1900') and (edtData1.GetValor)<StrToDateTime(frm_principal.x_prazo_vendas) then
  begin
    frmDialogo.ExibirMensagem ('Data informada não permitida!'
      ,'Produtos mais vendidos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.setfocus;
  end
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
    frm_ListaMaisVend2_Relatorio.qVendas1.databasename := databaseprodutos;
    with (frm_ListaMaisVend2_Relatorio) do
    begin

      if frm_principal.x_ordem_refinterna = 1 then
      begin
        QrDbText6.DataField := 'Referencia';
        QRLabel18.Caption   := 'Referencia';
      end
      else
      if frm_principal.x_ordem_reffabric = 1  then
      begin
        QrDbText6.DataField := 'RefForn';
        QRLabel18.Caption   := 'Forn/Ref.Forn';
      end
      else
      begin
        QrDbText6.DataField := 'RefCodigo';
        QRLabel18.Caption   := 'Grupo/Subg/Cod';
      end;

               {......................................................}
      MontandoSqlVendas1(tipz);
               {......................................................}
      if (rdOrdem.itemindex=0) then
        qVendas1.sql.Add('Order by 5 desc')
      else
      if (rdOrdem.itemindex=1) then
        qVendas1.sql.Add('Order by 4 desc');
               {......................................................}
      qVendas1.close;
      qVendas1.parambyname('data1').AsDateTime  := strtodate (InverteStringDataVendas(filtros[0]));
      qVendas1.parambyname('data2').AsDateTime  := strtodate (InverteStringDataVendas(filtros[1]));
      qVendas1.parambyname('loja1').AsFloat     := frm_principal.x_loja;
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
      mostra_mensagem('Buscando vendas p/ produto... Aguarde!');
      qVendas1.open;
      if (qVendas1.recordcount=0) then
        ExibeCritica('Não há movimento nestas condições!','Produtos mais vendidos',edtData1)
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
     //....................................................................
     //....................................................................
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
  EdtData1.Text := formatdatetime('dd/mm/yyyy',Frm_Principal.x_data_trabalho);
  EdtData2.Text := formatdatetime('dd/mm/yyyy',Frm_Principal.x_data_trabalho);
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
    btnConfereClick(btnConfere);
  if (key=K_CIMA) then
    edtVend2.setfocus;
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
    qVendas1.sql.Add ('SELECT IV_GRUP,IV_SUBG,IV_PROD                                                     ');
    qVendas1.sql.Add ('      ,SUM(IV_TOTA) as TOTAL                                                       ');
    qVendas1.sql.Add ('      ,SUM(IV_QTDR) as QTDE                                                        ');
    qVendas1.sql.Add (',PR_REFI as Referencia');
    qVendas1.sql.Add (',Cast(Pr_Forn as Varchar(25))+''/''+ PR_REFF as RefForn');
    qVendas1.sql.Add (',CAst(IV_GRUP as Varchar(25))+''/''+CAst(IV_SubG as Varchar(25))+''/''+CAst(IV_Prod as Varchar(25)) as RefCodigo');
    qVendas1.sql.Add ('FROM   ITENS_VENDAS,VENDAS,PRODUTOS                                                ');
    qVendas1.sql.Add ('WHERE (IV_LOJA=VE_LOJA) AND (IV_CAIX=VE_CAIX) AND (IV_VEND=VE_CODI) AND            ');
    qVendas1.sql.Add ('      (VE_DATA>=:data1) AND (VE_DATA<=:data2) AND                                  ');
    qVendas1.sql.Add ('      (VE_LOJA =:loja1) AND                                  ');
    qVendas1.sql.Add ('      (PR_GRUP=IV_GRUP) AND (PR_SUBG=IV_SUBG) AND (PR_CODI=IV_PROD) AND            ');
    qVendas1.sql.Add ('      (PR_FORN>=:forn1) AND (PR_FORN<=:forn2) AND                                  ');
    qVendas1.sql.Add ('      (PR_COLE>=:colecao1) AND (PR_COLE<=:colecao2) AND                            ');
    qVendas1.sql.Add ('      (PR_LINH>=:linha1) AND (PR_LINH<=:linha2) AND                                ');
    qVendas1.sql.Add ('      (IV_GRUP>=:grupo1) AND (IV_GRUP<=:grupo2) AND                                ');
    qVendas1.sql.Add ('      (IV_SUBG>=:subgrupo1) AND (IV_SUBG<=:subgrupo2) AND                          ');
    qVendas1.sql.Add ('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND                                        ');
    qVendas1.sql.Add ('      (IV_VEDE>=:vend1) AND (IV_VEDE<=:vend2)                                      ');

    if (tipz<>'3') then
      qVendas1.sql.Add ('  AND (VE_TIPZ=:tipz)                                                              ');

    if not chloja.checked then
    begin
      qvendas1.sql.add(' And  (Pr_refi =:Ref1)');
      qVendas1.parambyname('Ref1').AsString     := edtloja1.Text;
    end;

    qVendas1.sql.Add ('GROUP BY IV_GRUP,IV_SUBG,IV_PROD,Pr_Forn,Pr_Refi,Pr_reff                           ');
  end;
end;

procedure Tfrm_ListaMaisVend2.btnConfereClick(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_ListaMaisVend2.chDataPedidoClick(Sender: TObject);
begin
  if (not chDataPedido.checked) then
  begin
    habilitaeditVerde(edtData1);
    habilitaeditVerde(edtData2);
    edtData1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtData1);
    desabilitaeditVerde(edtData2);
    edtLoja1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chDataPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chDataPedido.checked) then
  begin
    habilitaeditVerde(edtData1);
    habilitaeditVerde(edtData2);
    edtData1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtData1);
    desabilitaeditVerde(edtData2);
    edtLoja1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chLojaClick(Sender: TObject);
begin
  if (not chLoja.checked) then
  begin
    habilitaeditVerde(edtLoja1);
    habilitaeditVerde(edtLoja2);
    edtData1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtLoja1);
    desabilitaeditVerde(edtLoja2);
    edtGrupo1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not chLoja.checked) then
  begin
    habilitaeditVerde(edtLoja1);
    habilitaeditVerde(edtLoja2);
    edtData1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtLoja1);
    desabilitaeditVerde(edtLoja2);
    edtGrupo1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chGrupoClick(Sender: TObject);
begin
  if (not chGrupo.checked) then
  begin
    habilitaeditVerde(edtGrupo1);
    habilitaeditVerde(edtGrupo2);
    edtGrupo1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtGrupo1);
    desabilitaeditVerde(edtGrupo2);
    edtSubGrupo1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chGrupo.checked) then
  begin
    habilitaeditVerde(edtGrupo1);
    habilitaeditVerde(edtGrupo2);
    edtGrupo1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtGrupo1);
    desabilitaeditVerde(edtGrupo2);
    edtSubGrupo1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chSubgrupoClick(Sender: TObject);
begin
  if (not chSubgrupo.checked) then
  begin
    habilitaeditVerde(edtSubgrupo1);
    habilitaeditVerde(edtSubgrupo2);
    edtSubgrupo1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtSubgrupo1);
    desabilitaeditVerde(edtSubgrupo2);
    edtForn1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chSubgrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chSubgrupo.checked) then
  begin
    habilitaeditVerde(edtSubgrupo1);
    habilitaeditVerde(edtSubgrupo2);
    edtSubgrupo1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtSubgrupo1);
    desabilitaeditVerde(edtSubgrupo2);
    edtForn1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chFornClick(Sender: TObject);
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
    edtColecao1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chFornKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
    edtColecao1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chColecaoClick(Sender: TObject);
begin
  if (not chColecao.checked) then
  begin
    habilitaeditVerde(edtColecao1);
    habilitaeditVerde(edtColecao2);
    edtColecao1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtColecao1);
    desabilitaeditVerde(edtColecao2);
    edtLinha1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chColecaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chColecao.checked) then
  begin
    habilitaeditVerde(edtColecao1);
    habilitaeditVerde(edtColecao2);
    edtColecao1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtColecao1);
    desabilitaeditVerde(edtColecao2);
    edtLinha1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chLinhaClick(Sender: TObject);
begin
  if (not chLinha.checked) then
  begin
    habilitaeditVerde(edtLinha1);
    habilitaeditVerde(edtLinha2);
    edtLinha1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtLinha1);
    desabilitaeditVerde(edtLinha2);
    edtVend1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chLinhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not chLinha.checked) then
  begin
    habilitaeditVerde(edtLinha1);
    habilitaeditVerde(edtLinha2);
    edtLinha1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtLinha1);
    desabilitaeditVerde(edtLinha2);
    edtVend1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chVendClick(Sender: TObject);
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
    PnVendedor1.Caption := '';
    edtQtde.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.chVendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
    edtQtde.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.edtLoja1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FQuery:TQuery;
begin
  if (key=K_CIMA) then
    edtData2.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtgrupo1.setfocus;
  if key = vk_f8 then
  begin
    fquery := TQuery.Create(Application);
    FQuery.DataBaseName := DataBaseprodutos;
    FQuery.Sql.Add('Select Pr_Refi,Pr_Desc from Produtos');
    Fquery.Open;

    Fquery.FieldByName('Pr_refi').DisplayLabel := 'Referencia';
    Fquery.FieldByName('Pr_Desc').DisplayLabel := 'Descrição';

    if FGridCons(FQuery,'Procura Referencia do Produto') then
      EdtLoja1.Text := FQuery.FieldByName('Pr_refi').AsString;
    fquery.destroy;
  end;


end;

procedure Tfrm_ListaMaisVend2.edtLoja2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtLoja1.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtGrupo1.setfocus;
end;

procedure Tfrm_ListaMaisVend2.edtVend1DblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtVend1);
end;

procedure Tfrm_ListaMaisVend2.edtVend2DblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtVend2);
end;

procedure Tfrm_ListaMaisVend2.edtVend1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtVend2.setfocus;
  if (key=K_CIMA) then
    edtLinha2.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVend1);
end;

procedure Tfrm_ListaMaisVend2.edtVend2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtQtde.setfocus;
  if (key=K_CIMA) then
    edtVend1.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVend2);
end;

procedure Tfrm_ListaMaisVend2.edtSubgrupo1Exit(Sender: TObject);
begin
  inherited;
  if (StrtoFloatn(EdtGrupo1.Text) <> 0) and (StrtoFloatn(EdtSubGrupo1.Text) <> 0) then
    pnsubgrupo1.caption := ProcuraNomeSubgruposProdutos(StrtoFloatn(EdtGrupo1.Text),StrtoFloatn(EdtSubGrupo1.Text),nil)
  else
    pnsubgrupo1.caption := '';
end;

procedure Tfrm_ListaMaisVend2.edtSubgrupo2Exit(Sender: TObject);
begin
  inherited;
  if (StrtoFloatn(EdtGrupo2.Text) <> 0) and (StrtoFloatn(EdtSubGrupo2.Text) <> 0) then
    pnsubgrupo2.caption := ProcuraNomeSubgruposProdutos(StrtoFloatn(EdtGrupo2.Text),StrtoFloatn(EdtSubGrupo2.Text),nil)
  else
    pnsubgrupo2.caption := '';
end;

procedure Tfrm_ListaMaisVend2.edtVend1Exit(Sender: TObject);
begin
  inherited;
  if (Trim(edtVend1.Text) <> '') then
    pnvendedor1.caption := ProcuraNomeVend(frm_principal.x_loja,strtofloatn(edtvend1.Text),nil)
  else
    pnVendedor1.Caption := '';
end;

procedure Tfrm_ListaMaisVend2.edtVend2Exit(Sender: TObject);
begin
  inherited;
  if (Trim(edtVend2.Text) <> '') then
    pnvendedor2.caption := ProcuraNomeVend(frm_principal.x_loja,strtofloatn(edtvend2.Text),nil)
  else
    pnVendedor2.Caption := '';
end;

procedure Tfrm_ListaMaisVend2.edtLoja1Exit(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if trim(edtloja1.Text) = '' then
  begin
    pnloja1.caption :=  '';
    exit;
  end;

  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select PR_DESC                                     ');
  clAux.AddParam ('From PRODUTOS                                      ');
  clAux.AddParam ('Where (PR_REFI='''+edtloja1.Text+''')  ');
  if (clAux.Execute) then
    pnloja1.caption := clAux.result('PR_DESC')
  else
    pnloja1.caption := '<Produto não cadastrado>';
  clAux.desconect;
  clAux.Free;
  inherited;

end;

procedure Tfrm_ListaMaisVend2.edtSubgrupo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_F8 then
    ChamandoF8SubGrupos(TEdit(Sender),StrtoFloatN(EdtGrupo1.Text),false)
  else
  if (Key = Vk_Up) then
    Self.perform(Wm_NextDlgCtl,-1,0)
  else
  if (Key = Vk_Down) or (Key = Vk_return) then
    Self.perform(Wm_NextDlgCtl,0,0);
end;

procedure Tfrm_ListaMaisVend2.edtmaskeditformulario1Enter(Sender: TObject);
begin
  inherited;
  if (edtData2.text='  /  /    ') then
    edtData2.text:=edtData1.text;
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaMaisVend2.edtmaskeditformulario1Exit(Sender: TObject);
begin
  inherited;
  if (not IsDate (edtData1.text) and (edtData1.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data das Vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.setfocus;
  end;
end;

procedure Tfrm_ListaMaisVend2.edtLinha2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtLinha1.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtVend1.SetFocus;
  if (key=K_F8) then
    ChamandoF8Linhas(edtLinha2,false);
end;

procedure Tfrm_ListaMaisVend2.edtLinha1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtColecao2.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLinha2.SetFocus;
  if (key=K_F8) then
    ChamandoF8Linhas(edtLinha1,false);
end;

procedure Tfrm_ListaMaisVend2.edtColecao2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtColecao1.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLinha1.SetFocus;
  if (key=K_F8) then
    ChamandoF8Colecoes(edtColecao2,false);
end;

procedure Tfrm_ListaMaisVend2.edtColecao1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtForn2.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtColecao2.SetFocus;
  if (key=K_F8) then
    ChamandoF8Colecoes(edtColecao1,false);
end;

procedure Tfrm_ListaMaisVend2.edtForn2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtForn1.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtColecao1.SetFocus;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn2,false);
end;

procedure Tfrm_ListaMaisVend2.edtForn1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtSubgrupo2.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtForn2.SetFocus;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn1,false);
end;

procedure Tfrm_ListaMaisVend2.edtGrupo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtGrupo1.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubgrupo1.SetFocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo2,false);
end;

procedure Tfrm_ListaMaisVend2.Grupo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtLoja1.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtGrupo2.SetFocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo1,false);
end;

procedure Tfrm_ListaMaisVend2.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    edtData1.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLoja1.SetFocus;
end;

procedure Tfrm_ListaMaisVend2.edtData1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtData2.SetFocus;
end;

end.
