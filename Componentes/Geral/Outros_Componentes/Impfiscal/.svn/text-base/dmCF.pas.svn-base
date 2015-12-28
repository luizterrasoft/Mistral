unit dmCF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  TdmCupom = class(TDataModule)
    Vendedores: TTable;
    Clientes: TTable;
    Tributacao: TTable;
    TributacaoCodProduto: TFloatField;
    TributacaoUF: TStringField;
    TributacaoAliquotaICMS: TFloatField;
    TributacaoReducaoICMS: TFloatField;
    Items: TTable;
    ItemsNumeroNF: TFloatField;
    ItemsNumeroItem: TFloatField;
    ItemsCodProduto: TFloatField;
    ItemsQuantidade: TFloatField;
    ItemsPrecoUnitario: TCurrencyField;
    ItemsBaseICMS: TCurrencyField;
    ItemsBaseICMSS: TCurrencyField;
    ItemsBaseIPI: TCurrencyField;
    ItemsAliquotaICMS: TCurrencyField;
    ItemsValorICMS: TCurrencyField;
    ItemsValorICMSS: TCurrencyField;
    ItemsEmbalagens: TFloatField;
    ItemsTotal: TCurrencyField;
    ItemsControle: TFloatField;
    ItemsSerieNF: TStringField;
    ItemsDesconto: TCurrencyField;
    ItemsProduto: TStringField;
    ItemsUnidade: TStringField;
    ItemsBICMS: TCurrencyField;
    ItemsVICMS: TCurrencyField;
    ItemsAliquota: TFloatField;
    ItemsUnitario: TCurrencyField;
    ItemsQuantos: TFloatField;
    Parametros: TTable;
    ParametrosRazaoSocial: TStringField;
    ParametrosUF: TStringField;
    ParametrosPortaImpressoraFiscal: TIntegerField;
    ItemsSrc: TDataSource;
    Produtos: TTable;
    ProdutosCodProduto: TFloatField;
    ProdutosUnidade: TStringField;
    ProdutosPrecoConsumidor: TCurrencyField;
    NotasSrc: TDataSource;
    ProdutosSrc: TDataSource;
    Controle: TTable;
    ControleProximoControle: TFloatField;
    LastItemQuery: TQuery;
    VendedoresSrc: TDataSource;
    ItemsAliquotaFiscal: TFloatField;
    ItemsTributo: TStringField;
    TributacaoTributo: TStringField;
    ClientesCodCliente: TFloatField;
    ClientesNome: TStringField;
    ClientesEndereco: TStringField;
    ClientesMunicipio: TStringField;
    ClientesUF: TStringField;
    ClientesCNPJ: TStringField;
    ClientesIE: TStringField;
    ClientesSrc: TDataSource;
    ProdutosDescricao: TStringField;
    ParametrosMsgPromocional: TStringField;
    Notas: TTable;
    NotasControle: TFloatField;
    NotasNumeroNF: TFloatField;
    NotasSerie: TStringField;
    NotasCodCliente: TFloatField;
    NotasCodVendedor: TIntegerField;
    NotasCodFiscal: TStringField;
    NotasDataEmissao: TDateField;
    NotasDataSaida: TDateField;
    NotasDataVencimento: TDateField;
    NotasHoraSaida: TStringField;
    NotasTipo: TStringField;
    NotasBaseICMS: TCurrencyField;
    NotasValorICMS: TCurrencyField;
    NotasBaseICMSS: TCurrencyField;
    NotasValorICMSS: TCurrencyField;
    NotasValorIPI: TCurrencyField;
    NotasValorProdutos: TCurrencyField;
    NotasValorNota: TCurrencyField;
    NotasCodTransportador: TStringField;
    NotasContaFrete: TStringField;
    NotasValorFrete: TCurrencyField;
    NotasFreteICMS: TCurrencyField;
    NotasDesconto: TCurrencyField;
    NotasDespesasAcessorias: TCurrencyField;
    NotasVolumes: TFloatField;
    NotasEspecie: TStringField;
    NotasPesoLiquido: TFloatField;
    NotasObs1: TStringField;
    NotasObs2: TStringField;
    NotasObs3: TStringField;
    NotasObs4: TStringField;
    NotasObs5: TStringField;
    NotasObs6: TStringField;
    NotasPedido: TStringField;
    NotasFlag: TStringField;
    ItemsWork: TTable;
    WorkSrc: TDataSource;
    VendedoresCodVendedor: TIntegerField;
    VendedoresNomeVendedor: TStringField;
    VendedoresEndereco: TStringField;
    VendedoresCidade: TStringField;
    VendedoresUF: TStringField;
    VendedoresTelefone: TStringField;
    VendedoresComissao: TFloatField;
    LastItemQueryProximoItem: TFloatField;
    ItemsWorkCodigoProduto: TFloatField;
    ParametrosEndereco: TStringField;
    ParametrosBairro: TStringField;
    ParametrosCidade: TStringField;
    ParametrosCEP: TStringField;
    ParametrosCaixaPostal: TStringField;
    ParametrosCNPJ: TStringField;
    ParametrosIE: TStringField;
    ParametrosFone: TStringField;
    ParametrosFax: TStringField;
    ParametrosLogomarca: TGraphicField;
    procedure dmCupomCreate(Sender: TObject);
    procedure NotasNewRecord(DataSet: TDataSet);
    procedure ItemsNewRecord(DataSet: TDataSet);
    procedure ItemsCalcFields(DataSet: TDataSet);
    procedure ItemsAfterPost(DataSet: TDataSet);
    procedure AtualizaTotais;
    procedure ItemsAfterDelete(DataSet: TDataSet);
    procedure dmCupomDestroy(Sender: TObject);
    procedure ItemsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCupom: TdmCupom;
  DeletingItems: boolean;

implementation

uses uFatur1, uCupom1;

{$R *.DFM}

procedure TdmCupom.dmCupomCreate(Sender: TObject);
begin
  Produtos.Open;
  Tributacao.Open;
  Clientes.Open;
  Items.Open;
  Vendedores.Open;
  Notas.Open;
  Parametros.Open;
  DeletingItems := False;
end;

procedure TdmCupom.NotasNewRecord(DataSet: TDataSet);
begin
  Controle.Open;
  Controle.Edit;
  try
    NotasControle.Value := ControleProximoControle.Value;
    ControleProximoControle.Value := ControleProximoControle.Value + 1;
    Controle.Post;
  finally
    Controle.Cancel;
    Controle.Close;
  end;
  // Numero da Nota é o número do cupom Fiscal
  NotasNumeroNF.Value := FormCupomFiscal.fNumeroCupom;
  // A série indica que é cupom
  NotasSerie.Value := 'CF';
  NotasTipo.Value := 'S';
  NotasDataEmissao.Value := date;
  NotasDataSaida.Value := date;
  NotasCodFiscal.Value := '01';
  NotasCodVendedor.Value := 7;
  NotasHoraSaida.Value := TimeToStr(Time);
 // FormCupomFiscal.QuantidadeEdit.SetFocus;
end;

procedure TdmCupom.ItemsNewRecord(DataSet: TDataSet);
var
  check: double;
begin
  ItemsControle.Value := NotasControle.Value;
  ItemsNumeroNF.Value := NotasNumeroNF.Value;
  ItemsSerieNF.Value := NotasSerie.Value;
//  ItemsQuantidade.Value := FormCupomFiscal.QuantidadeEdit.Value;
end;

procedure TdmCupom.ItemsCalcFields(DataSet: TDataSet);
begin
  Produtos.Open;
  Produtos.FindKey([ItemsCodProduto]);
  ItemsProduto.Value := ProdutosDescricao.Value;
  ItemsUnitario.Value := ProdutosPrecoConsumidor.Value;
  ItemsBICMS.VAlue := (ItemsQuantidade.Value * ProdutosPrecoConsumidor.Value) -
    ItemsDesconto.Value;
  ItemsQuantos.Value := ItemsQuantidade.Value;
  ItemsUnidade.Value := dmCupom.ProdutosUnidade.Value;
  ItemsTotal.Value := (ItemsUnitario.Value * ItemsQuantidade.Value) - ItemsDesconto.Value;

  // Localizar a aliquota e aplicar a redução se ela existir

  if Tributacao.FindKey([ItemsCodProduto, ParametrosUF]) then
  begin
    ItemsBICMS.Value := ItemsBICMS.Value * (TributacaoReducaoICMS.Value) / 100;
    ItemsTributo.Value := TributacaoTributo.Value;
    ItemsAliquota.Value := TributacaoAliquotaICMS.Value;
  // Aplicando a reducao para compatibilizar com o ECF
    if TributacaoReducaoICMS.Value <> 0 then
    begin
      ItemsAliquotaFiscal.Value := (trunc(TributacaoAliquotaICMS.Value *
        TributacaoReducaoICMS.Value) / 100);
    end
    else
    begin
      ItemsAliquotaFiscal.Value := TributacaoAliquotaICMS.Value;
    end;

    ItemsVICMS.Value := ItemsBICMS.Value * (ItemsAliquota.Value) / 100;
  end;
end;

procedure TdmCupom.ItemsAfterPost(DataSet: TDataSet);
begin
  //chama procedure para atualizar os totais
  AtualizaTotais;
end;

procedure TdmCupom.AtualizaTotais;
var
  BaseICMSTotal: currency;
  ValorICMSTotal: currency;
  ValorProdTotal: currency;
  PrevRecord: TBookmark;
  DescontoTotal: currency;
begin
  if DeletingItems then Exit;
  PrevRecord := dmCupom.Items.GetBookmark;
  try
    dmCupom.Items.DisableControls;
    dmCupom.Items.First;
    BaseICMSTotal := 0;
    ValorICMSTotal := 0;
    ValorProdTotal := 0;
    DescontoTotal := 0;
    while not dmCupom.Items.EOF do
    begin
      BaseICMSTotal := BaseICMSTotal + dmCupom.ItemsBaseICMS.Value;
      ValorICMSTotal := ValorICMSTotal + dmCupom.ItemsValorICMS.Value;
      ValorProdTotal := ValorProdTotal + (dmCupom.ItemsPrecoUnitario.Value *
        dmCupom.ItemsQuantidade.Value);
      DescontoTotal := DescontoTotal + dmCupom.ItemsDesconto.Value;
      dmCupom.Items.Next;
    end;
  finally
    dmCupom.Items.EnableControls;
    if PrevRecord <> nil then
      dmCupom.Items.GotoBookmark(PrevRecord);
    dmCupom.Items.FreeBookmark(PrevRecord);
  end;
  dmCupom.Notas.Edit;
  dmCupom.NotasBaseICMS.Value := BaseICMSTotal;
  dmCupom.NotasValorICMS.Value := ValorICMSTotal;
  dmCupom.NotasValorProdutos.Value := ValorProdTotal;
  dmCupom.NotasDesconto.Value := DescontoTotal;
  dmCupom.NotasValorNota.Value := dmCupom.NotasValorProdutos.Value -
    dmCupom.NotasDesconto.Value;
//  FormCupomFiscal.CurrencyEdit1.Value := dmCupom.NotasValorProdutos.Value -
//    dmCupom.NotasDesconto.Value;
//  FormCupomFiscal.TotalGeral.Value := dmCupom.NotasValorProdutos.Value -
//    dmCupom.NotasDesconto.Value;
end;



procedure TdmCupom.ItemsAfterDelete(DataSet: TDataSet);
begin
  AtualizaTotais;
end;

procedure TdmCupom.dmCupomDestroy(Sender: TObject);
begin
  Produtos.Close;
  Tributacao.Close;
  Clientes.Close;
  Items.Close;
  Vendedores.Close;
  Parametros.Close;
  Notas.Close;
end;

procedure TdmCupom.ItemsBeforePost(DataSet: TDataSet);
begin
 // inicializar o campo NumeroItem
  if Items.State = dsInsert then
  begin
    LastItemQuery.Close;
    LastItemQuery.ParamByName('Controle').AsFloat := NotasControle.Value;
    LastItemQuery.ParamByName('NumeroNF').AsFloat := NotasNumeroNF.Value;
    LastItemQuery.ParamByName('Serie').AsString := NotasSerie.Value;
    LastItemQuery.Open;
    with LastItemQuery.Fields[0] do
      if isNull then ItemsNumeroItem.Value := 1
      else ItemsNumeroItem.Value := AsFloat + 1;
  end;
  // atualizar os demais campos da tabela com os calculados
  showmessage(LastItemQuery.FieldByName('ProximoItem').AsString);
  ItemsBaseICMS.Value := ItemsBICMS.Value;
  ItemsValorICMS.Value := ItemsVICMS.Value;
  ItemsBaseIPI.Value := 0;
  ItemsBaseICMSS.Value := 0;
  ItemsValorICMSS.Value := 0;
  ItemsAliquotaICMS.Value := ItemsAliquota.Value;
  ItemsPrecoUnitario.Value := ItemsUnitario.Value;
end;

end.

