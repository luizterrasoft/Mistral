unit DM4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TDMcontrato = class(TDataModule)
    qAlteraChequePrestacao: TQuery;
    qApagaCheque: TQuery;
    qMaxiCont: TQuery;
    tbl_tempAviso: TTable;
    tbl_tempAvisocNumero: TStringField;
    tbl_tempAvisocValor: TStringField;
    tbl_tempCarnet: TTable;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    DateField1: TDateField;
    FloatField13: TFloatField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    FloatField14: TFloatField;
    DateField2: TDateField;
    StringField1: TStringField;
    StringField2: TStringField;
    tbl_tempAvisoPC_CLIE: TFloatField;
    tbl_tempAvisoPC_CONT: TFloatField;
    tbl_tempAvisoPC_LOJA: TSmallintField;
    tbl_tempAvisoPC_NPRE: TSmallintField;
    tbl_tempAvisoPC_DVTO: TDateField;
    tbl_tempAvisoPC_VALO: TFloatField;
    qMaxiContMAXIMO: TFloatField;
    qTempAviso: TQuery;
    qTempAvisoPC_CLIE: TFloatField;
    qTempAvisoPC_CONT: TFloatField;
    qTempAvisoPC_LOJA: TSmallintField;
    qTempAvisoPC_NPRE: TSmallintField;
    qTempAvisoPC_DVTO: TDateField;
    qTempAvisoPC_VALO: TFloatField;
    qRenegociaContratosEmAberto: TQuery;
    qRenegociaContratosEmAbertoCR_CLIE: TFloatField;
    qRenegociaContratosEmAbertoCR_CODI: TFloatField;
    qRenegociaContratosEmAbertoCR_LOJA: TFloatField;
    qRenegociaContratosEmAbertoCR_NOTA: TStringField;
    qRenegociaContratosEmAbertoCR_SERI: TStringField;
    qRenegociaContratosEmAbertoCR_DNOT: TDateTimeField;
    qRenegociaContratosEmAbertoCR_AVAL: TFloatField;
    qRenegociaContratosEmAbertoCR_PORT: TFloatField;
    qRenegociaContratosEmAbertoCR_TOTA: TFloatField;
    qRenegociaContratosEmAbertoCR_VENT: TFloatField;
    qRenegociaContratosEmAbertoCR_PLAN: TFloatField;
    qRenegociaContratosEmAbertoCR_QPRE: TFloatField;
    qRenegociaContratosEmAbertoCR_PDEV: TFloatField;
    qRenegociaContratosEmAbertoCR_FATO: TFloatField;
    qRenegociaContratosEmAbertoCR_CARN: TStringField;
    qRenegociaContratosEmAbertoCR_FICH: TStringField;
    qRenegociaContratosEmAbertoCR_VDEV: TFloatField;
    qRenegociaContratosEmAbertoCR_DTRA: TDateTimeField;
    qRenegociaContratosEmAbertoCR_TOT2: TFloatField;
    qRenegociaContratosEmAbertoCR_BOLE: TStringField;
    qRenegociaContratosEmAbertoCR_TIME: TDateTimeField;
    qRenegociaContratosEmAbertocPORT: TStringField;
    qRenegociaContratosEmAbertocPLANO: TStringField;
    qRenegociaContratosEmAbertobFlag: TBooleanField;
    qCliUltimaCompra: TQuery;
    qCliQtdCompra: TQuery;
    tbl_tempCarnetJatoDeTinta: TTable;
    tbl_tempCarnetJatoDeTintaLINHA: TFloatField;
    procedure tbl_tempAvisoCalcFields(DataSet: TDataSet);
    procedure tbl_tempCarnetCalcFields(DataSet: TDataSet);
    procedure qRenegociaContratosEmAbertoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMcontrato: TDMcontrato;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, procura, principal;

procedure TDMcontrato.tbl_tempAvisoCalcFields(DataSet: TDataSet);
begin
  with (tbl_tempAviso) do
  begin
    if (fieldbyname('cNumero').IsNull) then
      fieldbyname('cNumero').AsString :=
        form_nz(fieldbyname('PC_LOJA').AsFloat,2)+'.'+
        form_nz(fieldbyname('PC_CLIE').AsFloat,6)+'.'+
        form_nz(fieldbyname('PC_CONT').AsFloat,6)+'.'+
        form_nz(fieldbyname('PC_NPRE').AsFloat,2);
    if (fieldbyname('cValor').IsNull) then
      fieldbyname('cValor').AsString := form_nc(fieldbyname('PC_VALO').AsFloat,10);
  end;
end;

procedure TDMcontrato.tbl_tempCarnetCalcFields(DataSet: TDataSet);
begin
  with (tbl_tempCarnet) do
  begin
    if (fieldbyname('cNumero').IsNull) then
      fieldbyname('cNumero').AsString :=
        form_nz(fieldbyname('PC_LOJA').AsFloat,2)+'.'+
        form_nz(fieldbyname('PC_CLIE').AsFloat,6)+'.'+
        form_nz(fieldbyname('PC_CONT').AsFloat,6)+'.'+
        form_nz(fieldbyname('PC_NPRE').AsFloat,2);
    if (fieldbyname('cValor').IsNull) then
      fieldbyname('cValor').AsString := form_nc(fieldbyname('PC_VALO').AsFloat,10);
  end;
end;

procedure TDMcontrato.qRenegociaContratosEmAbertoCalcFields(
  DataSet: TDataSet);
begin
  with (dataset) do
  begin
    if (fieldbyname('cPLANO').IsNull) then
      fieldbyname('cPLANO').AsString := Copy(ProcuraTipoPlano(fieldbyname('CR_PLAN').AsFloat,self),1,9);
    if (fieldbyname('cPORT').IsNull) then
      fieldbyname('cPORT').AsString := Copy(ProcuraNomePortador(fieldbyname('CR_PORT').AsFloat,self),1,9);
    if (aListaRenegocia.IndexOf(form_nz(fieldbyname('CR_CLIE').AsFloat,6)+
      form_nz(fieldbyname('CR_CODI').AsFloat,6))=-1) then
      fieldbyname('bFlag').AsBoolean := false
    else
      fieldbyname('bFlag').AsBoolean := true;
  end;
end;

end.
