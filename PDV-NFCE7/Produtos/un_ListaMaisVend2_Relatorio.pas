unit un_ListaMaisVend2_Relatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables;

type
  Tfrm_ListaMaisVend2_Relatorio = class(TForm)
    relatorio: TQuickRep;
    bandaTitulo: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    qrNomeEmpresa: TQRLabel;
    qrHorario: TQRLabel;
    QRLabel7: TQRLabel;
    qrDatas: TQRLabel;
    qrLojas: TQRLabel;
    qrGrupos: TQRLabel;
    qrSubgrupos: TQRLabel;
    qrFornecedores: TQRLabel;
    qrColecoes: TQRLabel;
    qrLinhas: TQRLabel;
    bandaFornColecaoLinha: TQRBand;
    qVendas1: TQuery;
    qVendas1cPRODUTO: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    qrTotalProduto: TQRLabel;
    qrTotalQtdeProduto: TQRLabel;
    qrTotalValorProduto: TQRLabel;
    qrOrdem: TQRLabel;
    qrQtde: TQRLabel;
    qrPos: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qVendas1cPERC1: TFloatField;
    qVendas1cPERC2: TFloatField;
    qVendas1IV_GRUP: TFloatField;
    qVendas1IV_SUBG: TFloatField;
    qVendas1IV_PROD: TFloatField;
    qVendas1TOTAL: TFloatField;
    qVendas1QTDE: TFloatField;
    qrVendedores: TQRLabel;
    procedure bandaTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bandaFornColecaoLinhaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qVendas1CalcFields(DataSet: TDataSet);
    procedure bandaFornColecaoLinhaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    y_forn_ant: Real;
    y_colecao_ant: Real;
    y_contador: Integer;
    y_total_qtdeProduto: Integer;
    y_total_valorProduto: Real;
    y_posicao: Integer;
    y_qtde: Integer;
    y_total: Real;
  end;

var
  frm_ListaMaisVend2_Relatorio: Tfrm_ListaMaisVend2_Relatorio;

implementation

uses principal, un_ListaVendas4, funcoes1, funcoes2, estoques, procura,
  un_ListaMaisVend2;

{$R *.DFM}

procedure Tfrm_ListaMaisVend2_Relatorio.bandaTituloBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     {......................................................}
  y_forn_ant := -1;
  y_colecao_ant := -1;
  y_posicao := 1;
     {......................................................}
  qrHorario.caption     := 'em: '+form_data(frm_principal.x_data_trabalho)+' '+FormatDateTime('hh:nn',time);
  qrNomeEmpresa.caption := frm_principal.x_empresa;
  if (frm_listaMaisVend2.filtros[0]='01/01/1900') and (frm_listaMaisVend2.filtros[1]='12/31/5000') then
    qrDatas.caption := 'Período de vendas......:  TODAS AS VENDAS'
  else
    qrDatas.caption := 'Período de vendas......:  '+InverteStringData(frm_listaMaisVend2.filtros[0])+' a '+
      InverteStringData(frm_listaMaisVend2.filtros[1]);
  if (frm_listaMaisVend2.filtros[2]='0') and (frm_listaMaisVend2.filtros[3]='99') then
    qrLojas.caption := 'Lojas..............................:  TODAS AS LOJAS'
  else
    qrLojas.caption := 'Lojas..............................:  '+frm_listaMaisVend2.filtros[2]+' a '+
      frm_listaMaisVend2.filtros[3];
  if (frm_listaMaisVend2.filtros[4]='0') and (frm_listaMaisVend2.filtros[5]='99') then
    qrGrupos.caption := 'Grupos...........................:  TODOS OS GRUPOS'
  else
    qrGrupos.caption := 'Grupos...........................:  '+frm_listaMaisVend2.filtros[4]+' a '+
      frm_listaMaisVend2.filtros[5];
  if (frm_listaMaisVend2.filtros[6]='0') and (frm_listaMaisVend2.filtros[7]='99') then
    qrSubGrupos.caption := 'Subgrupos....................:  TODOS OS SUBGRUPOS'
  else
    qrSubGrupos.caption := 'Subgrupos....................:  '+frm_listaMaisVend2.filtros[6]+' a '+
      frm_listaMaisVend2.filtros[7];
  if (frm_listaMaisVend2.filtros[8]='0') and (frm_listaMaisVend2.filtros[9]='999999') then
    qrFornecedores.caption := 'Fornecedores...............:  TODOS OS FORNECEDORES'
  else
    qrFornecedores.caption := 'Fornecedores...............:  '+frm_listaMaisVend2.filtros[8]+' a '+
      frm_listaMaisVend2.filtros[9];
  if (frm_listaMaisVend2.filtros[10]='0') and (frm_listaMaisVend2.filtros[11]='9999') then
    qrColecoes.caption := 'Coleções.......................:  TODAS AS COLECOES'
  else
    qrColecoes.caption := 'Coleções.......................:  '+frm_listaMaisVend2.filtros[10]+' a '+
      frm_listaMaisVend2.filtros[11];
  if (frm_listaMaisVend2.filtros[12]='0') and (frm_listaMaisVend2.filtros[13]='9999') then
    qrLinhas.caption := 'Linhas............................:  TODAS AS LINHAS'
  else
    qrLinhas.caption := 'Linhas............................:  '+frm_listaMaisVend2.filtros[12]+' a '+
      frm_listaMaisVend2.filtros[13];
  if (frm_listaMaisVend2.filtros[14]='0') and (frm_listaMaisVend2.filtros[15]='999999') then
    qrVendedores.caption := 'Vendedores.................:  TODOS OS VENDEDORES'
  else
    qrVendedores.caption := 'Vendedores.................:  '+frm_listaMaisVend2.filtros[14]+' a '+
      frm_listaMaisVend2.filtros[15];
  if (frm_listaMaisVend2.rdOrdem.itemindex=0) then
    qrOrdem.caption :=  '---- ORDEM DO RELATORIO:  Qtde Vendida ---'
  else
    qrOrdem.caption :=  '---- ORDEM DO RELATORIO:  Venda líquida ---';
  qrQtde.caption := '---- Os '+inttostr(frm_listaMaisVend2.edtQtde.Getvalor)+' produto(s) mais vendido(s) ---';
     {......................................................}
end;

procedure Tfrm_ListaMaisVend2_Relatorio.bandaFornColecaoLinhaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     {......................................................}
  y_total_qtdeProduto  := y_total_qtdeProduto + qVendas1.fieldbyname('QTDE').AsInteger;
  y_total_valorProduto := y_total_valorProduto + qVendas1.fieldbyname('TOTAL').AsFloat;
  qrPos.caption        := inttostr(y_posicao);
  y_posicao := y_posicao + 1;
     {......................................................}
end;

procedure Tfrm_ListaMaisVend2_Relatorio.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     {......................................................}
  qrTotalQtdeProduto.caption := inttostr(y_total_qtdeProduto);
  qrTotalValorProduto.caption := trim(form_nc(y_total_valorProduto,20));
     {......................................................}
end;

procedure Tfrm_ListaMaisVend2_Relatorio.qVendas1CalcFields(
  DataSet: TDataSet);
begin
  with (dataset) do
  begin
    if (fieldbyname('cPRODUTO').IsNull) then
      fieldbyname('cPRODUTO').AsString :=
        ProcuraNomeProdutos_1 (fieldbyname('IV_GRUP').AsFloat,
        fieldbyname('IV_SUBG').AsFloat,
        fieldbyname('IV_PROD').AsFloat,self);
    if (fieldbyname('cPERC1').IsNull) then
      if (y_qtde<>0) then
        fieldbyname('cPERC1').AsFloat := (qVendas1.fieldbyname('QTDE').AsInteger/y_qtde*100)
      else
        fieldbyname('cPERC1').AsFloat := 0.00;
    if (fieldbyname('cPERC2').IsNull) then
      if (y_total<>0) then
        fieldbyname('cPERC2').AsFloat := (qVendas1.fieldbyname('TOTAL').AsFloat/y_total*100)
      else
        fieldbyname('cPERC2').AsFloat := 0.00;
  end;
end;

procedure Tfrm_ListaMaisVend2_Relatorio.bandaFornColecaoLinhaAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     {......................................................}   
  if (y_posicao=frm_ListaMaisVend2.edtQtde.getvalor+1) then
    qVendas1.last;
     {......................................................}
end;

end.
