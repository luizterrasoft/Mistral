unit DM6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMVendas = class(TDataModule)
    qVendas: TQuery;
    qFormas: TQuery;
    qFormascFORMA: TStringField;
    qFormasVF_FPGT: TFloatField;
    qFormasVF_VALO: TFloatField;
    qFormasVF_ORDE: TSmallintField;
    qVendasVE_CAIX: TFloatField;
    qVendasVE_LOJA: TFloatField;
    qVendasVE_CODI: TFloatField;
    qVendasVE_DATA: TDateTimeField;
    qVendasVE_TOTA: TFloatField;
    qVendasVE_QTDE: TFloatField;
    qVendasVE_STAT: TStringField;
    qVendasVE_TIPZ: TStringField;
    qVendascVE_TOTA: TStringField;
    qFormascVF_VALO: TStringField;
    qVendasVE_DESC: TFloatField;
    qVendascVE_DESC: TStringField;
    qItensVenda: TQuery;
    qItensVendaIV_LOJA: TFloatField;
    qItensVendaIV_CAIX: TFloatField;
    qItensVendaIV_VEND: TFloatField;
    qItensVendaIV_TIPZ: TStringField;
    qItensVendaIV_GRUP: TFloatField;
    qItensVendaIV_SUBG: TFloatField;
    qItensVendaIV_PROD: TFloatField;
    qItensVendaIV_TAMA: TStringField;
    qItensVendaIV_CORE: TFloatField;
    qItensVendaIV_QTDE: TFloatField;
    qItensVendaIV_TOTA: TFloatField;
    qItensVendaIV_PVEN: TFloatField;
    qItensVendacDESC: TStringField;
    qItensVendacIV_PVEN: TStringField;
    qItensVendacIV_TOTA: TStringField;
    qItensVendacIV_TAMA: TStringField;
    qItensVendacIV_CORE: TStringField;
    qVendasVE_PDES: TFloatField;
    qVendascVE_PDES: TStringField;
    qItensVendacREFF: TStringField;
    qItensVendacREFI: TStringField;
    qFormasVF_CAIX: TFloatField;
    qFormasVF_LOJA: TFloatField;
    qFormasVF_VEND: TFloatField;
    qVendasVE_VEND: TFloatField;
    qVendascVEND: TStringField;
    qVendasVE_NOTA: TStringField;
    qVendasVE_QTD1: TFloatField;
    qVendasVE_QTD2: TFloatField;
    qVendasVE_ONLI: TStringField;
    qVendasVE_ENVI: TStringField;
    qVendascONLI: TStringField;
    qVendascENVI: TStringField;
    qVendasVE_CUPO: TFloatField;
    qVendasVE_ECF: TSmallintField;
    qVendascVE_ECF: TStringField;
    qVendascCODIGOVEND: TStringField;
    qVendasVE_FUNC: TFloatField;
    qVendascOPERADORCAIXA: TStringField;
    qVendasVE_HORA: TStringField;
    procedure qFormasCalcFields(DataSet: TDataSet);
    procedure qVendasAfterScroll(DataSet: TDataSet);
    procedure qVendasCalcFields(DataSet: TDataSet);
    procedure qItensVendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVendas: TDMVendas;

implementation

{$R *.DFM}

uses procura, funcoes1, funcoes2, auxiliar, principal;

procedure TDMVendas.qFormasCalcFields(DataSet: TDataSet);
begin
  with (dataset) do
  begin
    if (fieldbyname('cFORMA').IsNull) then
      fieldbyname('cFORMA').AsString := ProcuraNomeEntidade(
        fieldbyname('VF_FPGT').AsFloat,
        databaseprodutos,'FORMAS_PAGAMENTO','Formas de pgto.','FO_CODI','FO_DESC',
        self);
    if (fieldbyname('cVF_VALO').IsNull) then
      fieldbyname('cVF_VALO').AsString :=
        form_nc4(fieldbyname('VF_VALO').AsFloat,10);
  end;
end;

procedure TDMVendas.qVendasAfterScroll(DataSet: TDataSet);
begin
  qFormas.close;
  qItensVenda.close;
  if (not dataset.fieldbyname('VE_CODI').IsNull) and
    (not dataset.fieldbyname('VE_CAIX').IsNull) and
    (not dataset.fieldbyname('VE_LOJA').IsNull) then
  begin
    qFormas.sql.clear;
    qFormas.sql.Add ('SELECT VF_ORDE,VF_FPGT,VF_VALO,VF_CAIX,VF_VEND,VF_LOJA           ');
    qFormas.sql.Add ('FROM VENDAS_FORMA_PAGAMENTO                                      ');
    qFormas.sql.Add ('WHERE (VF_VEND='+dataset.fieldbyname('VE_CODI').AsString+') AND  ');
    qFormas.sql.Add ('      (VF_CAIX='+dataset.fieldbyname('VE_CAIX').AsString+') AND  ');
    qFormas.sql.Add ('      (VF_LOJA='+dataset.fieldbyname('VE_LOJA').AsString+')      ');
    qFormas.sql.Add ('ORDER BY VF_ORDE                                                 ');
    qFormas.open;
    qFormas.first;
         {**************************}
    qItensVenda.sql.clear;
    qItensVenda.sql.Add ('SELECT IV_GRUP,IV_SUBG,IV_PROD,IV_CORE,IV_TAMA,IV_QTDE,           ');
    qItensVenda.sql.Add ('       IV_TOTA,IV_TIPZ,IV_PVEN,IV_LOJA,IV_CAIX,IV_VEND            ');
    qItensVenda.sql.Add ('FROM   ITENS_VENDAS                                               ');
    qItensVenda.sql.Add ('WHERE (IV_VEND='+dataset.fieldbyname('VE_CODI').AsString+') AND   ');
    qItensVenda.sql.Add ('      (IV_CAIX='+dataset.fieldbyname('VE_CAIX').AsString+') AND   ');
    qItensVenda.sql.Add ('      (IV_LOJA='+dataset.fieldbyname('VE_LOJA').AsString+')       ');
    qItensVenda.sql.Add ('ORDER BY IV_GRUP,IV_SUBG,IV_PROD,IV_CORE,IV_OTAM                  ');
    qItensVenda.open;
         {**************************}
  end;
end;

procedure TDMVendas.qVendasCalcFields(DataSet: TDataSet);
begin
  with (dataset) do
  begin
    if (fieldbyname('cVE_ECF').IsNull) then
      if (fieldbyname('VE_ECF').AsInteger=0) then
        fieldbyname('cVE_ECF').AsString := ''
      else
        fieldbyname('cVE_ECF').AsString := fieldbyname('VE_ECF').AsString;
    if (fieldbyname('cVE_TOTA').IsNull) then
      fieldbyname('cVE_TOTA').AsString :=
        form_nc4(fieldbyname('VE_TOTA').AsFloat,10);
    if (fieldbyname('cVE_DESC').IsNull) then
      fieldbyname('cVE_DESC').AsString :=
        form_nc4(fieldbyname('VE_DESC').AsFloat,10);
    if (fieldbyname('cVE_PDES').IsNull) then
      fieldbyname('cVE_PDES').AsString :=
        form_nc4(fieldbyname('VE_PDES').AsFloat,6);
    if (fieldbyname('cCODIGOVEND').IsNull) then
      if (fieldbyname('VE_VEND').AsFloat=0) then
        fieldbyname('cCODIGOVEND').AsString := '   -  '
      else
        fieldbyname('cCODIGOVEND').AsString := form_nz(fieldbyname('VE_VEND').AsFloat,6);
    if (fieldbyname('cVEND').IsNull) then
      if (fieldbyname('VE_VEND').AsFloat=0) then
        fieldbyname('cVEND').AsString := '[MAIS DE UM VENDEDOR]'
      else
        fieldbyname('cVEND').AsString := ProcuraNomeVend(fieldbyname('VE_LOJA').AsFloat,
          fieldbyname('VE_VEND').AsFloat,self);
    if (fieldbyname('cOPERADORCAIXA').IsNull) then
      if (fieldbyname('VE_FUNC').AsFloat=0) then
        fieldbyname('cOPERADORCAIXA').AsString := ' - '
      else
        fieldbyname('cOPERADORCAIXA').AsString := ProcuraNomeVendCaixa(fieldbyname('VE_LOJA').AsFloat,
          fieldbyname('VE_FUNC').AsFloat,self);
    if (fieldbyname('cONLI').IsNull) then
      if (fieldbyname('VE_ONLI').AsString='1') then
        fieldbyname('cONLI').AsString := 'S'
      else
        fieldbyname('cONLI').AsString := 'N';
  end;
end;

procedure TDMVendas.qItensVendaCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (dataset) do
  begin
    if (fieldbyname('cDESC').IsNull) then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect  (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam('SELECT PR_DESC,PR_REFF,PR_REFI FROM PRODUTOS             ');
      clAux.AddParam('WHERE (PR_GRUP='+fieldbyname('IV_GRUP').AsString+') AND  ');
      clAux.AddParam('      (PR_SUBG='+fieldbyname('IV_SUBG').AsString+') AND  ');
      clAux.AddParam('      (PR_CODI='+fieldbyname('IV_PROD').AsString+')      ');
      if (clAux.Execute) then
      begin
        fieldbyname('cDESC').AsString := clAux.result('PR_DESC');
        fieldbyname('cREFF').AsString := clAux.result('PR_REFF');
        fieldbyname('cREFI').AsString := clAux.result('PR_REFI');
      end
      else
      begin
        fieldbyname('cDESC').AsString := '<Produto não cadastrado>';
        fieldbyname('cREFF').AsString := '';
        fieldbyname('cREFI').AsString := '';
      end;
      clAux.desconect;
      clAux.Free;
    end;
    if (fieldbyname('cIV_PVEN').IsNull) then
      fieldbyname('cIV_PVEN').AsString :=
        form_nc4(fieldbyname('IV_PVEN').AsFloat,10);
    if (fieldbyname('cIV_TOTA').IsNull) then
      fieldbyname('cIV_TOTA').AsString :=
        form_nc4(fieldbyname('IV_TOTA').AsFloat,10);
    if (fieldbyname('cIV_TAMA').IsNull) then
      if (fieldbyname('IV_TAMA').AsString='0') then
        fieldbyname('cIV_TAMA').AsString := 'UNICO'
      else
        fieldbyname('cIV_TAMA').AsString :=
          fieldbyname('IV_TAMA').AsString;
    if (fieldbyname('cIV_CORE').IsNull) then
      if (fieldbyname('IV_CORE').AsFloat=0) then
        fieldbyname('cIV_CORE').AsString := 'UNICA'
      else
        fieldbyname('cIV_CORE').AsString :=
          ProcuraAbrevCor(fieldbyname('IV_CORE').AsFloat,self);
  end;
end;

end.
