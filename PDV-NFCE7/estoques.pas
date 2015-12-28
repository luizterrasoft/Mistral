{[MOVIMENTO]}
unit estoques;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  DBTables, DB, DBCtrls, Forms, Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls,
  Printers, Mask, FileCtrl, gauges, auxiliar,funcoesglobais;

var
  japerguntouprecoetiq:Boolean;


{... - Funcoes relacionadas com a adm. do cadastro de produtos}
function VerificaExistenciaDoRegistroPRODUTO(grupo,subgrupo,produto: Real):Boolean;
function VerificaExistenciaDoRegistroESTOQUE(grupo,subgrupo,produto,cor: Real; tamanho: String; pcu1,pcu2,upc1,upc2,upa1,upa2,pve1,pve2: Real;tipz:String=''):Boolean;
procedure VerificaExistenciaDoRegistroESTOQUEComPrecosSugeridos(grupo,subgrupo,produto,cor: Real; tamanho: String);
procedure VerificaExistenciaDoRegistroESTOQUE_LOJA(grupo,subgrupo,produto,cor: Real; tamanho: String; loja: Real);
procedure VerificaExistenciaRegistroPRODUTOSFAIXAS(grupo,subgrupo,produto: Real; tamanho: String);
function ExisteProduto(grupo,subgrupo,produto: Real):Boolean;

{... - Funcoes relacionadas com calcula de comissao e cotas do vendedor}
function RetornaTotalCotasLoja(codigo_loja: Real; ano,mes: Word):Real;
function DevolvePercComisVend(loja,vendedor: Real; tipo: String):Real;

{... - Funcoes relacionadas às tabelas temporarias em C:\NATIVA\ESTOQUE - pasta local}
procedure ChecaExistenciaArquivo_TEMP_INVENTARIO;
procedure ChecaExistenciaArquivo_TEMP_ENTRADAS;
procedure ChecaExistenciaArquivo_TEMP_SAIDAS;
procedure ChecaExistenciaArquivo_TEMP_TABELAS_PRECOS;
procedure ChecaExistenciaArquivo_TEMP_TABELAS_PRECOS_CUSTOS;
procedure ChecaExistenciaArquivo_TEMP_TABELAS_PRECOS_AQUISICAO;
procedure ChecaExistenciaArquivo_TEMP_ENTRADAS_AVULSAS_LOTE;

{... - Funcoes relacionadas à formatacao de produtos}
function FormataNomeItemProduto (n_produto: String; n_cor: Real; n_tam: String):String;
function FormataCodigoBarras(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
function ReformataCodigoBarras(codigo_barras: String):String;
function RetornaTamanhoCodigoBarrasConfigurado:Integer;
function RetornaMascaraCodigoBarras(considerapontos: Boolean):String;
function ExibeCodigoBarrasMascarado(codigobarras: String):String;
function RetiraMascaraCodigoBarras(codigobarras: String):String;
function SugerirParteDoCodigoDeBarrasEAN13(grupo,subgrupo,produto: Real):String;

{... - Funcoes relacionadas à faixa de tamanho}
function InformaSeqb(codtam: Real):Integer;
function InformaOrdemTamanho(grupo,subgrupo,produto: Real;tam: String):Integer; {// devolve a ordem da faixa de tamanho}
function DevolveCodTam(grupo,subgrupo,produto: Real; n_tam: String):Integer; {//devolve o sequencial para o codigo de barras}
function DevolveProxSequencialTamanho(codigo_tamanho: Real):Integer;
function DevolveProxSequencialTamanho_Subgrupos(grupo,subgrupo: Real):Integer;
function DevolveProxSequencialTamanho_Produtos(grupo,subgrupo,codigo: Real):Integer;
function VerificaFaixasTamProduto(grupo,subgrupo,produto: Real; faixa: String):Boolean;
function VerificaFaixasTamTipoTamanho(grupo,subgrupo,produto: Real; faixa: String):Boolean;
function RetornaPrimeiraFaixaTamanho(grupo,subgrupo,produto: Real):String;

{... - Funcoes relacionada com o retorno do preco de venda / custo / aquisicao}
function DevolvePrecoItem(loja: Real; grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function InformaPrecoVendaPrincipal(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function InformaPrecoVendaDiferencial(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function InformaPrecoVendaPromocional(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function ItemTemPrecoDiferencial(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Boolean;
function ProdutoTemPrecoDiferencial(loja,grupo,subgrupo,produto: Real):Boolean;
function ItemTemPrecoPromocional(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Boolean;
procedure AtualizaPrecoPrincipal(preco,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String;todos:Boolean=false;verifprec:Boolean=false);
procedure AtualizaPrecoDiferencial(preco,loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String);
procedure AtualizaUltimoPrecoDeCusto(grupo,subgrupo,produto,cor: Real;tamanho: String; preco: Real; tipz: String);
procedure AtualizaUltimoPrecoDeAquisicao(grupo,subgrupo,produto,cor: Real;tamanho: String; preco: Real; tipz: String);
function InformaUltimoPrecoAquisicao(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function InformaUltimoPrecoCusto(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function InformaUltimoPrecoCustoMedio(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
procedure CalculaPrecoCustoMedio(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String);
function ExisteItemParaProduto(grupo,subgrupo,produto: Real):Boolean;
function ExisteMovimento(grupo,subgrupo,produto,cor: Real; tamanho: String; loja: Real; limite: TDateTime):Boolean;
function DevolvePrecoPrincipalMaisPresenteNoProduto(grupo,subgrupo,produto: Real; tipz: String):Real;
function DevolveUltimoPrecoCustoMaisPresenteNoProduto(grupo,subgrupo,produto: Real; tipz: String):Real;
procedure ArmazenaEmHistoricoDePrecos (grupo,subgrupo,produto,cor: Real; tamanho: String; ordemtam: Integer;
  loja,preco,novopreco: Real; tipz,tipo: String; obs: String);

{... - Funcoes/procedimentos de estoque - ???? - [TENHO QUE PADRONIZAR A ORDEM DOS PARAMETROS]}
procedure EntradaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real; cor: Real; faixa: String; qtde: Real);
procedure SaidaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real; cor: Real; faixa: String; qtde: Real);
procedure ReCalculaSaldoItem (grupo,subgrupo,produto,loja,cor: Real; tamanho,tipz: String);
procedure AtualizaUltimaVenda_Estoque(grupo,subgrupo,produto,cor: Real; faixa: String; datavenda: TDateTime; tipz: String);
procedure AtualizaUltimaVenda_Estoque_Loja(grupo,subgrupo,produto,cor: Real; faixa: String; loja: Real; datavenda: TDateTime; tipz: String);
function InformaSaldoAtual(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function InformaSaldoAtualPorCor(loja,grupo,subgrupo,produto,cor: Real; tipz: String):Real;
function InformaSaldoAtualProduto(loja,grupo,subgrupo,produto: Real; tipz: String):Real;
function InformaSaldoDoProduto_PeriodosParaTras_1(data_limite: TDateTime; grupo,subgrupo,produto: Real; loja: Real; tipz: String):Real;
function InformaSaldoDoProduto_PeriodosParaTras_2(data_limite: TDateTime; refint: String; loja: Real; tipz: String):Real;
function InformaSaldoDoItem_PeriodosParaTras_1(data_limite: TDateTime; grupo,subgrupo,produto,cor: Real; tam: String; loja: Real; tipz: String):Real;
function InformaSaldoDoItem_PeriodosParaTras_2(data_limite: TDateTime; codigo_barras: String; loja: Real; tipz: String):Real;
function InformaSaldoDoItemPorCor_PeriodosParaTras_1(data_limite: TDateTime; grupo,subgrupo,produto,cor: Real; loja: Real; tipz: String):Real;
function InformaultimaVenda(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):TDateTime;
function InformaultimaVendaProduto(grupo,subgrupo,produto:Real; tipz: String):TDateTime;
function InformaultimaCompra(grupo,subgrupo,produto,cor: Real; tamanho: String):TDateTime;

      {a) relacionadas com a quantidade atendida.}
function ProcessaPedidoCompra(n_pedido,n_loja: Real; plano: Real; flag_exibe: Boolean; tipz: String; gauge: TGauge):Boolean;
procedure AumentarItemPedidoCompraQAte (pedido: Real; tipz: String; grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde,loja: Real);
procedure BaixarItemPedidoCompraQAte (pedido: Real; tipz: String; grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde,loja: Real);
procedure AlterarItemPedidoCompraQAte (pedido: Real; tipz: String; grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde1,qtde2,loja: Real);
procedure AlterarItemPedidoCompraQAte1 (pedido: Real; tipz: String; grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde1,qtde2,loja: Real);
function CalculaTotalPedidoCompraAte (n_pedido: Real; n_loja: Real; tipz: String; dis1: Real):Real;
      {b) realcionadas com a marcacao de registros.}
procedure ValidaItemEntrada1(forn: Real; nota,tipz: String; grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; valid: String);
procedure ValidaItemEntrada2(forn: Real; nota,tipz: String; grupo,subgrupo,produto: Real; faixa: String; cor: Real; valid: String);
procedure MarcaEntradaMovimento1 (forn: Real; ndoc,tipz: String; grupo,subgrupo,produto: Real; ordem: Integer; tamanho: String; seqmov: Real);
procedure MarcaEntradaMovimento2 (forn: Real; ndoc,tipz: String; grupo,subgrupo,produto,cor: Real; tamanho: String; seqmov: Real);

function VerificaSeExisteACorNoProdutoPedido(pedido,grupo,subgrupo,produto: Real; ordem: Integer):Boolean;
function VerificaSeExisteACorNoProdutoEntrada(forn: Real; doc,tipz: String; loja: Real; grupo,subgrupo,produto: Real; ordem: Integer):Boolean;

{... - Funcoes relacionadas com LOG de exclusão}
procedure CriaRegistroEstoqueExc(grupo,subgrupo,produto,cor: Real; tam: String);
procedure CriaRegistroEstoqueLojaExc(grupo,subgrupo,produto,loja,cor: Real; tam: String);
procedure CriaRegistroProdutosFaixasExc(grupo,subgrupo,produto: Real; tam: String);
procedure CriaRegistroProdutosMateriaisExc(grupo,subgrupo,produto,material: Real);
procedure AtualizaTIMEProduto(grupo,subgrupo,produto: Real);
procedure AtualizaTIMEElementosDoProduto(grupo,subgrupo,produto: Real);
procedure AtualizaTIMEEstoque(grupo,subgrupo,produto,cor: Real; tam: String);
procedure AtualizaTIMEEstoqueLoja(loja,grupo,subgrupo,produto,cor: Real; tam: String);

{... - Funcoes MISCELANEAS(funcoes diversas)}
function RetornaCodigoDeBarrasDoItem(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
function RetornaCodigoDeBarrasDoItemPelaReferencia(referencia: String; cor: Real; tamanho: String):String;
function InformaRefFabric(grupo,subgrupo,produto: Real):String;
function RetornaData (data: TDateTime; dia_x: Word;inc: Integer):TDateTime;
function DiaMaximo(mes,ano: Integer):Word;
function IsCorSortida(codigo_cor: Real):Boolean;
function BuscaFornecedor(grupo,subgrupo,produto: Real):Real;
function BuscaFornecedorPedido(pedido: Real):Real;
function RetornaApelidoEmpresa:String;
function BuscaObservacaoMovimento(codigo_movimento: Real):String;
function BuscaDocumentoTransferencia(codigo_barras,tipo: String; loja: Real; data: TDateTime):String;
function ExisteIndice(nome_indice: String):Boolean;
function InformaAliqICMS(estado: String;fisento:Boolean=false):Real;
procedure CriaIndice(arquivo,nome,campos: String);
procedure ReformularProjetoIndicesESTOQUE;
procedure CancelaVenda(codigo_loja,codigo_caixa,codigo_venda: Real);
procedure CancelaVenda_2(codigo_loja: Real; numero_documento,tipz: String);
function RetornaLojaMestreDosPrecos:Real;
function CalculaMargem(totalcusto,totalvenda: Real):Real;
function DevolvePercentualComissaoConfigurado (loja,vend: Real; data: TDateTime; tipo: String; valor: Real):Real;
procedure AdicionaObservacaoNoMovimento (codigo_movimento: Real; obs: String);
procedure AuditaOperacao(codigoocorrencia: Real; complemento: String);
procedure AltCod (tabela: String; valor: Real);
function DataDoInventarioEstaFixada:Boolean;
function DevolveMax (campo,nomearq,alias: String):Integer;
function DevolveAliquotaIPIPeloSubgrupo(grupo,subgrupo: Real):Real;
function DevolveUFDoFornecedor(codforn: Real):String;
function HoraParaInteiro(hora: String):Integer;
function InteiroParaHora(hora: Integer):String;
function UsuarioIsAdmin(cod: Real):Boolean;
procedure CarregaFotoProduto (grupo,subgrupo,produto: Real; imagem: TImage);
procedure CarregaFotoProduto_ (refint: String; imagem: TImage);
procedure BuscaNomeAvancado (lista: Tlistbox);

{... - Funcoes relacionadas com o calculo do DV}
function CalculaDigitoVerificador(campo: String):Integer;
function CalculaDV_1 (p_campo,p_peso: String; p_modulo,p_tipo: Integer):Integer;

{... - Funcoes relacionadas com INVENTARIO}
function RetornaSaldoAnteriorInventario_1(grupo,subgrupo,produto,cor: Real; tamanho: String;
  loja: Real; datainventario: TDateTime):Real;
function RetornaSaldoAnteriorInventario_2(codigobarras: String; loja: Real; datainventario: TDateTime):Real;

function precoetiquetasempromocao(loja,grup,subg,prod,core:Real;tama:String;var oldpreco:Real):Boolean;

function excluicrediario(loja,terminal,codigovenda: Real):Boolean;

implementation


uses principal, DM4, funcoes1, funcoes2, procura, titulos_a_confirmar, un_InformeEAN13,
  un_VerTitulosConfirmados, DM6, itensestoque, itensestoqueloja, un_InformeCbarra, DM15,
  un_BuscaNomeAvancado,Un_ListAltPrec,unDialogo;


{Esta funcao informa o preco de venda atual, no cadastro ESTOQUE detalhado ***}
function InformaPrecoVendaPrincipal(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select ES_PVE1,ES_PVE2                               ');
    clAux.AddParam ('From   ESTOQUE                                       ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND            ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND         ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND          ');
    clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND              ');
    clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')          ');
    if (clAux.Execute) then
      InformaPrecoVendaPrincipal:=clAux.result('ES_PVE'+tipz)
    else
      InformaPrecoVendaPrincipal:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

function InformaPrecoVendaDiferencial(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and (loja<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select IP_PRE1,IP_PRE2                               ');
    clAux.AddParam ('From   ITENS_TABELAS_PRECOS                          ');
    clAux.AddParam ('Where (IP_GRUP='+floattostr(grupo)+') AND            ');
    clAux.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND         ');
    clAux.AddParam ('      (IP_PROD='+floattostr(produto)+') AND          ');
    clAux.AddParam ('      (IP_CORE='+floattostr(cor)+') AND              ');
    clAux.AddParam ('      (IP_TAMA='+chr(39)+tamanho+chr(39)+') AND      ');
    clAux.AddParam ('      (IP_TABE=1) AND                                ');
    clAux.AddParam ('      (IP_LOJA='+floattostr(loja)+')                 ');
    if (clAux.Execute) then
      InformaPrecoVendaDiferencial:=clAux.result('IP_PRE'+tipz)
    else
      InformaPrecoVendaDiferencial:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Esta funcao informa o preco de venda atual, no cadastro ESTOQUE detalhado ***}
function InformaPrecoVendaPromocional(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and (loja<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select PP_PRE1,PP_PRE2                               ');
    clAux.AddParam ('From   PRECOS_PROMOCIONAIS                           ');
    clAux.AddParam ('Where (PP_GRUP='+floattostr(grupo)+') AND            ');
    clAux.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND         ');
    clAux.AddParam ('      (PP_PROD='+floattostr(produto)+') AND          ');
    clAux.AddParam ('      (PP_CORE='+floattostr(cor)+') AND              ');
    clAux.AddParam ('      (PP_TAMA='+chr(39)+tamanho+chr(39)+') AND      ');
    clAux.AddParam ('      (PP_LOJA='+floattostr(loja)+') AND             ');
    clAux.AddParam ('      (PP_DAT1<='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+') AND   '); {*}
    clAux.AddParam ('      (PP_DAT2>='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+')       '); {*}
    clAux.AddParam ('Order by PP_DAT2                                                                      ');
    if (clAux.Execute) then
    begin
      clAux.last;
      InformaPrecoVendaPromocional:=clAux.result('PP_PRE'+tipz);
    end
    else
      InformaPrecoVendaPromocional:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Esta funcao informa o ultimo preco de custo, no cadastro ESTOQUE detalhado ***}
function InformaUltimoPrecoCustoMedio(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select ES_PCU1,ES_PCU2                                ');
    clAux.AddParam ('From   ESTOQUE                                        ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND               ');
    clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')           ');
    if (clAux.Execute) then
      InformaUltimoPrecoCustoMedio:=clAux.result('ES_PCU'+tipz)
    else
      InformaUltimoPrecoCustoMedio:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Retorna o saldo atual do item de estoque na loja ***}
function InformaSaldoAtual(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and (loja<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select EL_QTD1,EL_QTD2                                ');
    clAux.AddParam ('From   ESTOQUE_LOJA                                   ');
    clAux.AddParam ('Where (EL_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (EL_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (EL_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (EL_LOJA='+floattostr(loja)+') AND              ');
    clAux.AddParam ('      (EL_CORE='+floattostr(cor)+') AND               ');
    clAux.AddParam ('      (EL_TAMA='+chr(39)+tamanho+chr(39)+')           ');
    if (clAux.Execute) then
    begin
      if (tipz='1') or (tipz='2') then
        InformaSaldoAtual:=clAux.result('EL_QTD'+tipz)
      else
      if (tipz='3') then
        InformaSaldoAtual:=clAux.result('EL_QTD1')+clAux.result('EL_QTD2');
    end
    else
      InformaSaldoAtual:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Retorna o saldo atual do item de estoque na loja, Agrupado 'POR COR' ***}
function InformaSaldoAtualPorCor(loja,grupo,subgrupo,produto,cor: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and (loja<>0) and
    (cor<>-1) then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select SUM(EL_QTD1) as TOTAL1,                        ');
    clAux.AddParam ('       SUM(EL_QTD2) as TOTAL2                         ');
    clAux.AddParam ('From   ESTOQUE_LOJA                                   ');
    clAux.AddParam ('Where (EL_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (EL_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (EL_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (EL_LOJA='+floattostr(loja)+') AND              ');
    clAux.AddParam ('      (EL_CORE='+floattostr(cor)+')                   ');
    if (clAux.Execute) then
    begin
      if (tipz='1') or (tipz='2') then
        InformaSaldoAtualPorCor:=clAux.result('TOTAL'+tipz)
      else
      if (tipz='3') then
        InformaSaldoAtualPorCor:=clAux.result('TOTAL1')+clAux.result('TOTAL2');
    end
    else
      InformaSaldoAtualPorCor:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Retorna o saldo atual do item de estoque na loja ***}
function InformaSaldoAtualProduto(loja,grupo,subgrupo,produto: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and (loja<>0) then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select SUM(EL_QTD1) as SALDO1,                        ');
    clAux.AddParam ('       SUM(EL_QTD2) as SALDO2                         ');
    clAux.AddParam ('From   ESTOQUE_LOJA                                   ');
    clAux.AddParam ('Where (EL_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (EL_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (EL_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (EL_LOJA='+floattostr(loja)+')                  ');
    if (clAux.Execute) then
    begin
      if (tipz='1') or (tipz='2') then
        InformaSaldoAtualProduto:=clAux.result('SALDO'+tipz)
      else
      if (tipz='3') then
        InformaSaldoAtualProduto:=clAux.result('SALDO1')+clAux.result('SALDO2');
    end
    else
      InformaSaldoAtualProduto:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Retorna a data da ultima venda ***}
function InformaUltimaVenda(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):TDateTime;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select ES_ULC1,ES_ULC2                                ');
    clAux.AddParam ('From   ESTOQUE                                        ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND               ');
    clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')           ');
    if (clAux.Execute) then
    begin
      if (tipz='1') or (tipz='2') then
        InformaUltimaVenda:=clAux.result('ES_ULC'+tipz)
      else
      if (tipz='3') then
        if (clAux.Result('ES_ULC1')<> StrToDateTime('01/01/1900')) then
          InformaUltimaVenda:=clAux.result('ES_ULC1')
        else
        if (clAux.Result('ES_ULC2')<> StrToDateTime('01/01/1900')) then
          InformaUltimaVenda:=clAux.result('ES_ULC2')
        else
          InformaultimaVenda:= StrToDateTime('01/01/1900');
    end
    else
      InformaultimaVenda:=StrToDateTime('01/01/1900');
    clAux.desconect;
    clAux.Free;
  end;
end;

{Retorna a data da ultima venda Produto***}
function InformaUltimaVendaProduto(grupo,subgrupo,produto: Real; tipz: String):TDateTime;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select ES_ULC1,ES_ULC2                                ');
    clAux.AddParam ('From   ESTOQUE                                        ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+')               ');
    if (clAux.Execute) then
    begin
      clAux.Last;
      if (tipz='1') or (tipz='2') then
        InformaUltimaVendaProduto:=clAux.result('ES_ULC'+tipz)
      else
      if (tipz='3') then
        if (clAux.Result('ES_ULC1')<> StrToDateTime('01/01/1900')) then
          InformaUltimaVendaProduto:=clAux.result('ES_ULC1')
        else
        if (clAux.Result('ES_ULC2')<> StrToDateTime('01/01/1900')) then
          InformaUltimaVendaProduto:=clAux.result('ES_ULC2')
        else
          InformaultimaVendaProduto:= StrToDateTime('01/01/1900');
    end
    else
      InformaultimaVendaProduto:=StrToDateTime('01/01/1900');
    clAux.desconect;
    clAux.Free;
  end;
end;

{Retorna a data da ultima compra ***}
function InformaUltimaCompra(grupo,subgrupo,produto,cor: Real; tamanho: String):TDateTime;
var
  FQUERY:TQUERY;
  ClAux1: TClassAuxiliar;
begin
  FQuery := TQuery.Create(Application);
  FQuery.DataBaseNAme := 'ESTOQUE';
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) then
    with FQUery do
      try
        Close;
        SQL.Clear;
        SQL.Add ('Select IE_NDOC                                        ');
        SQL.Add ('From   ITENS_ENTRADAS                                 ');
        SQL.Add ('Where (IE_GRUP='+floattostr(grupo)+') AND             ');
        SQL.Add ('      (IE_SUBG='+floattostr(subgrupo)+') AND          ');
        SQL.Add ('      (IE_PROD='+floattostr(produto)+') AND           ');
        SQL.Add ('      (IE_CORE='+floattostr(cor)+') AND               ');
        SQL.Add ('      (IE_TAMA='+chr(39)+tamanho+chr(39)+')           ');
        Open;
        if (FQUERY.RecordCount>0) then
        begin
          clAux1:=TClassAuxiliar.Create;
          clAux1.conect   ('ESTOQUE',frm_principal);
          clAux1.ClearSql;
          clAux1.AddParam ('Select EN_DTEN                                        ');
          clAux1.AddParam ('From   ENTRADAS                                       ');
          clAux1.AddParam ('Where (EN_NDOC='+chr(39)+FQUERY.fieldbyname('IE_NDOC').AsString+chr(39)+')');
          ClAux1.AddParam ('Order by EN_DTEN desc ');
          if (clAux1.Execute) then
          begin
            ClAux1.First;
            InformaUltimaCompra:=clAux1.result('EN_DTEN');
          end  
          else
            InformaultimaCompra:=StrToDateTime('01/01/1900');
        end
        else
          InformaultimaCompra:=StrToDateTime('01/01/1900');
      finally
        FQuery.Destroy;
      end;
end;


{Funcao que recalcula o preco de custo medio, do estoque oficial (1) ***}
{E a partir da margem de contribuicao e do preco de custo medio, o preco base de venda
 é recalculado também, se o flag de PRECO DE VENDA CALCULADO estiver marcado na
 configuracao local do sistema -}
{A variavel 'AtVenda' recebe o conteudo da variavel 'frm_principal.x_tipo_pvenda'}
procedure CalculaPrecoCustoMedio (grupo,subgrupo,produto,cor: Real; tamanho,tipz: String);
var
  clAux: TClassAuxiliar;
  valor_custo,total,parcela: Real;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select SUM(MO_PCU1 * MO_QTD1)/SUM(MO_QTD1) As Total   ');
    clAux.AddParam ('From   MOVIMENTO                                      ');
    clAux.AddParam ('Where (MO_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (MO_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (MO_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (MO_CORE='+floattostr(cor)+') AND               ');
    clAux.AddParam ('      (MO_TAMA='+chr(39)+tamanho+chr(39)+') AND       ');
    clAux.AddParam ('      (MO_TIPO='+chr(39)+'E'+chr(39)+') AND           ');
    clAux.AddParam ('      (MO_TIPZ='+chr(39)+tipz+chr(39)+') AND          ');
    clAux.AddParam ('      (MO_MODE='+chr(39)+'N'+chr(39)+') AND           '); //NORMAL / ENTRADAS
    clAux.AddParam ('      (MO_QTD1>0.00)                                  '); //somente valores POSITIVOS, / NEGATIVOS indicam 'saldo' migrado do sistema anterior!!!!
    clAux.Execute;
    clAux.first;
    parcela := 0.00;
{         while (not clAux.eof) do
         begin
              parcela := parcela + (clAux.result('MO_QTD1')*clAux.result('MO_PCU1'));
              total   := total   + clAux.result('MO_QTD1');
              clAux.next;
         end;}
    total := clAux.result('Total');
    if (total<>0.00) then
      valor_custo := parcela/total
    else
      valor_custo := 0.00;
    clAux.ClearSql;
    clAux.AddParam ('Update ESTOQUE                                  ');
    clAux.AddParam ('Set    ES_PCU'+tipz+'=:preco_custo,             ');
    clAux.AddParam ('       ES_TIME=:data                            ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND       ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND    ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND     ');
    clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND         ');
    clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')     ');
    clAux.consulta.parambyname('preco_custo').AsFloat := valor_custo;
    clAux.consulta.parambyname('data').AsDateTime     := frm_principal.x_data_trabalho;
    clAux.consulta.ExecSql;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Funcao que recalcula o SALDO de um item de estoque, com base no seu historico de
 movimento ***}
procedure ReCalculaSaldoItem (grupo,subgrupo,produto,loja,cor: Real; tamanho,tipz: String);
var
  clAux: TClassAuxiliar;
  qtde: Real;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and (loja<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select MO_TIPO,MO_QTD1                                ');
    clAux.AddParam ('From   MOVIMENTO                                      ');
    clAux.AddParam ('Where (MO_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (MO_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (MO_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (MO_CORE='+floattostr(cor)+') AND               ');
    clAux.AddParam ('      (MO_TAMA='+chr(39)+tamanho+chr(39)+') AND       ');
    clAux.AddParam ('      (MO_LOJA='+floattostr(loja)+') AND              ');
    clAux.AddParam ('      (MO_TIPZ='+chr(39)+tipz+chr(39)+')              ');
    clAux.Execute;
    clAux.first;
    qtde:=0.00;
    while (not clAux.eof) do
    begin
      if (clAux.result('MO_TIPO')='E') then
        qtde := qtde + clAux.result('MO_QTD1')
      else
      if (clAux.result('MO_TIPO')='S') then
        qtde := qtde - clAux.result('MO_QTD1');
      clAux.next;
    end;
    clAux.ClearSql;
    clAux.AddParam ('Update ESTOQUE_LOJA                                   ');
    clAux.AddParam ('Set    EL_QTD'+tipz+'=:qtde,                          ');
    clAux.AddParam ('       EL_TIME=:data                                  ');
    clAux.AddParam ('Where (EL_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (EL_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (EL_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (EL_LOJA='+floattostr(loja)+') AND              ');
    clAux.AddParam ('      (EL_CORE='+floattostr(cor)+') AND               ');
    clAux.AddParam ('      (EL_TAMA='+chr(39)+tamanho+chr(39)+')           ');
    clAux.consulta.parambyname('qtde').AsFloat := qtde;
    clAux.consulta.parambyname('data').AsDateTime:=frm_principal.x_data_trabalho;
    clAux.consulta.ExecSql;
    clAux.desconect;
    clAux.Free;
  end;
end;

function VerificaFaixasTamProduto(grupo,subgrupo,produto: Real; faixa: String):Boolean;
var
  clAux,clAux2: TClassAuxiliar;
begin
  with (clAux) do
  begin
    clAux := TClassAuxiliar.Create;
    conect ('ESTOQUE',frm_principal);
    ClearSql;
    AddParam ('Select PF_TAMA                                     ');
    AddParam ('From PRODUTOS_FAIXAS                               ');
    AddParam ('Where (PF_GRUP='+floattostr(grupo)+') AND          ');
    AddParam ('      (PF_SUBG='+floattostr(subgrupo)+') AND       ');
    AddParam ('      (PF_PROD='+floattostr(produto)+') AND        ');
    AddParam ('      (PF_TAMA='+chr(39)+faixa+chr(39)+')          ');
    if (not Execute) then
      VerificaFaixasTamProduto:=false
    else
      VerificaFaixasTamProduto:=true;
    desconect;
    Free;
  end;
end;

function VerificaFaixasTamTipoTamanho(grupo,subgrupo,produto: Real; faixa: String):Boolean;
var
  clAux,clAux2: TClassAuxiliar;
begin
  with (clAux) do
  begin
    clAux := TClassAuxiliar.Create;
    conect   ('ESTOQUE',frm_principal);
    ClearSql;
    AddParam ('Select TF_TAMA                                ');
    AddParam ('From   TAMANHOS_FAIXAS,PRODUTOS               ');
    AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND     ');
    AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND  ');
    AddParam ('      (PR_CODI='+floattostr(produto)+') AND   ');
    AddParam ('      (PR_TTAM=TF_CODI) AND                   ');
    AddParam ('      (TF_TAMA='+chr(39)+faixa+chr(39)+')     ');
    if (not Execute) then
      VerificaFaixasTamTipoTamanho:=false
    else
      VerificaFaixasTamTipoTamanho:=true;
    desconect;
    Free;
  end;
end;

{Este procedimento altera o saldo do item no cadastro ESTOQUE-ITEM-LOJA *****}
{Ele deve sempre estar situado dentro de uma transacao em um procedimento/metodo externo}
{para evitar incosistencia na base de dados...}
procedure EntradaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real;
  cor: Real; faixa: String; qtde: Real);
begin
  if (grupo<>0) and (subgrupo<>0)   and (produto<>0) and
    (cor<>-1)  and (faixa<>'-1') and (tipz<>'')   and
    (loja<>0) then
  begin
         {*** Saldo do item}
    DMEstoque.qAumentaSaldo.parambyname('grupo').AsFloat    := grupo;
    DMEstoque.qAumentaSaldo.parambyname('subgrupo').AsFloat := subgrupo;
    DMEstoque.qAumentaSaldo.parambyname('produto').AsFloat  := produto;
    DMEstoque.qAumentaSaldo.parambyname('cor').AsFloat      := cor;
    DMEstoque.qAumentaSaldo.parambyname('tamanho').AsString := faixa;
    DMEstoque.qAumentaSaldo.parambyname('loja').AsFloat     := loja;
    if (tipz='1') then
    begin
      DMEstoque.qAumentaSaldo.parambyname('qtd1').AsFloat     := qtde;
      DMEstoque.qAumentaSaldo.parambyname('qtd2').AsFloat     := 0;
    end
    else
    if (tipz='2') then
    begin
      DMEstoque.qAumentaSaldo.parambyname('qtd1').AsFloat     := 0;
      DMEstoque.qAumentaSaldo.parambyname('qtd2').AsFloat     := qtde;
    end;
    DMEstoque.qAumentaSaldo.parambyname('time').AsDateTime     := frm_principal.x_data_trabalho;
    DMEstoque.qAumentaSaldo.ExecSql;
  end;
end;

procedure SaidaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real;
  cor: Real; faixa: String; qtde: Real);
begin
  if (grupo<>0) and (subgrupo<>0)   and (produto<>0) and
    (cor<>-1)  and (faixa<>'-1') and (tipz<>'')   and
    (loja<>0) then
  begin
         {*** Saldo do item}
    DMEstoque.qDiminueSaldo.parambyname('grupo').AsFloat    := grupo;
    DMEstoque.qDiminueSaldo.parambyname('subgrupo').AsFloat := subgrupo;
    DMEstoque.qDiminueSaldo.parambyname('produto').AsFloat  := produto;
    DMEstoque.qDiminueSaldo.parambyname('cor').AsFloat      := cor;
    DMEstoque.qDiminueSaldo.parambyname('tamanho').AsString := faixa;
    DMEstoque.qDiminueSaldo.parambyname('loja').AsFloat     := loja;
    if (tipz='1') then
    begin
      DMEstoque.qDiminueSaldo.parambyname('qtd1').AsFloat     := qtde;
      DMEstoque.qDiminueSaldo.parambyname('qtd2').AsFloat     := 0;
    end
    else
    if (tipz='2') then
    begin
      DMEstoque.qDiminueSaldo.parambyname('qtd1').AsFloat     := 0;
      DMEstoque.qDiminueSaldo.parambyname('qtd2').AsFloat     := qtde;
    end;
    DMEstoque.qDiminueSaldo.parambyname('time').AsDateTime   := frm_principal.x_data_trabalho;
    DMEstoque.qDiminueSaldo.ExecSql;
  end;
end;

{Este procedimento altera o saldo do item no cadastro ESTOQUE-ITEM-LOJA *****}
{Ele deve sempre estar situado dentro de uma transacao em um procedimento/metodo externo}
{para evitar incosistencia na base de dados...}
procedure BaixarItemPedidoCompraQAte (pedido: Real; tipz: String;
  grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde,loja: Real);
begin
  if (grupo<>0)  and (subgrupo<>0) and (produto<>0) and
    (ordem<>-1)   and (faixa<>'-1') and
    (pedido<>0) then
    if (tipz='1') then
    begin
      DMEstoque.qDiminueSaldoPedido1.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qDiminueSaldoPedido1.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qDiminueSaldoPedido1.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qDiminueSaldoPedido1.parambyname('produto').AsFloat     := produto;
      DMEstoque.qDiminueSaldoPedido1.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qDiminueSaldoPedido1.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qDiminueSaldoPedido1.parambyname('qtdAtendida').AsFloat := qtde;
      DMEstoque.qDiminueSaldoPedido1.parambyname('loja').AsFloat        := loja;
      DMEstoque.qDiminueSaldoPedido1.ExecSql;
    end
    else
    if (tipz='2') then
    begin
      DMEstoque.qDiminueSaldoPedido2.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qDiminueSaldoPedido2.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qDiminueSaldoPedido2.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qDiminueSaldoPedido2.parambyname('produto').AsFloat     := produto;
      DMEstoque.qDiminueSaldoPedido2.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qDiminueSaldoPedido2.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qDiminueSaldoPedido2.parambyname('qtdAtendida').AsFloat := qtde;
      DMEstoque.qDiminueSaldoPedido2.parambyname('loja').AsFloat        := loja;
      DMEstoque.qDiminueSaldoPedido2.ExecSql;
    end{*** Saldo do item no item de pedido de compra};
end;

procedure AumentarItemPedidoCompraQAte (pedido: Real; tipz: String;
  grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde,loja: Real);
begin
  if (grupo<>0)  and (subgrupo<>0) and (produto<>0) and
    (ordem<>-1)   and (faixa<>'-1') and
    (pedido<>0) then
    if (tipz='1') then
    begin
      DMEstoque.qAumentaSaldoPedido1.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qAumentaSaldoPedido1.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qAumentaSaldoPedido1.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qAumentaSaldoPedido1.parambyname('produto').AsFloat     := produto;
      DMEstoque.qAumentaSaldoPedido1.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qAumentaSaldoPedido1.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qAumentaSaldoPedido1.parambyname('qtdAtendida').AsFloat := qtde;
      DMEstoque.qAumentaSaldoPedido1.parambyname('loja').AsFloat        := loja;
      DMEstoque.qAumentaSaldoPedido1.ExecSql;
    end
    else
    if (tipz='2') then
    begin
      DMEstoque.qAumentaSaldoPedido2.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qAumentaSaldoPedido2.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qAumentaSaldoPedido2.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qAumentaSaldoPedido2.parambyname('produto').AsFloat     := produto;
      DMEstoque.qAumentaSaldoPedido2.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qAumentaSaldoPedido2.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qAumentaSaldoPedido2.parambyname('qtdAtendida').AsFloat := qtde;
      DMEstoque.qAumentaSaldoPedido2.parambyname('loja').AsFloat        := loja;
      DMEstoque.qAumentaSaldoPedido2.ExecSql;
    end{*** Saldo do item no item de pedido de compra};
end;

procedure AlterarItemPedidoCompraQAte (pedido: Real; tipz: String;
  grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde1,qtde2,loja: Real);
begin
  if (grupo<>0)  and (subgrupo<>0) and (produto<>0) and
    (ordem<>-1)   and (faixa<>'-1') and
    (pedido<>0) then
    if (tipz='1') then
    begin
      DMEstoque.qAlteraSaldoPedido1.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qAlteraSaldoPedido1.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qAlteraSaldoPedido1.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qAlteraSaldoPedido1.parambyname('produto').AsFloat     := produto;
      DMEstoque.qAlteraSaldoPedido1.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qAlteraSaldoPedido1.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qAlteraSaldoPedido1.parambyname('qtdAtendida1').AsFloat := qtde1;
      DMEstoque.qAlteraSaldoPedido1.parambyname('qtdAtendida2').AsFloat := qtde2;
      DMEstoque.qAlteraSaldoPedido1.parambyname('loja').AsFloat         := loja;
      DMEstoque.qAlteraSaldoPedido1.ExecSql;
    end
    else
    if (tipz='2') then
    begin
      DMEstoque.qAlteraSaldoPedido2.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qAlteraSaldoPedido2.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qAlteraSaldoPedido2.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qAlteraSaldoPedido2.parambyname('produto').AsFloat     := produto;
      DMEstoque.qAlteraSaldoPedido2.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qAlteraSaldoPedido2.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qAlteraSaldoPedido2.parambyname('qtdAtendida1').AsFloat := qtde1;
      DMEstoque.qAlteraSaldoPedido2.parambyname('qtdAtendida2').AsFloat := qtde2;
      DMEstoque.qAlteraSaldoPedido2.parambyname('loja').AsFloat         := loja;
      DMEstoque.qAlteraSaldoPedido2.ExecSql;
    end{*** Saldo do item no item de pedido de compra};
end;

procedure AlterarItemPedidoCompraQAte1 (pedido: Real; tipz: String;
  grupo,subgrupo,produto: Real; faixa: String; ordem: Integer; qtde1,qtde2,loja: Real);
begin
  if (grupo<>0)  and (subgrupo<>0) and (produto<>0) and
    (ordem<>-1)   and (faixa<>'-1') and
    (pedido<>0) then
    if (tipz='1') then
    begin
      DMEstoque.qAlteraSaldoPedido1.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qAlteraSaldoPedido1.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qAlteraSaldoPedido1.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qAlteraSaldoPedido1.parambyname('produto').AsFloat     := produto;
      DMEstoque.qAlteraSaldoPedido1.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qAlteraSaldoPedido1.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qAlteraSaldoPedido1.parambyname('qtdAtendida1').AsFloat := 0;
      DMEstoque.qAlteraSaldoPedido1.parambyname('qtdAtendida2').AsFloat := 0;
      DMEstoque.qAlteraSaldoPedido1.parambyname('loja').AsFloat         := loja;
      DMEstoque.qAlteraSaldoPedido1.ExecSql;
    end
    else
    if (tipz='2') then
    begin
      DMEstoque.qAlteraSaldoPedido2.parambyname('pedido').AsFloat      := pedido;
      DMEstoque.qAlteraSaldoPedido2.parambyname('grupo').AsFloat       := grupo;
      DMEstoque.qAlteraSaldoPedido2.parambyname('subgrupo').AsFloat    := subgrupo;
      DMEstoque.qAlteraSaldoPedido2.parambyname('produto').AsFloat     := produto;
      DMEstoque.qAlteraSaldoPedido2.parambyname('ordem').AsInteger     := ordem;
      DMEstoque.qAlteraSaldoPedido2.parambyname('tamanho').AsString    := faixa;
      DMEstoque.qAlteraSaldoPedido2.parambyname('qtdAtendida1').AsFloat := 0;
      DMEstoque.qAlteraSaldoPedido2.parambyname('qtdAtendida2').AsFloat := 0;
      DMEstoque.qAlteraSaldoPedido2.parambyname('loja').AsFloat         := loja;
      DMEstoque.qAlteraSaldoPedido2.ExecSql;
    end{*** Saldo do item no item de pedido de compra};
end;

procedure ValidaItemEntrada1(forn: Real; nota,tipz: String; grupo,subgrupo,produto: Real;
  faixa: String; ordem: Integer; valid: String);
begin
  if (forn<>0) and (nota<>'') and (grupo<>0)  and (subgrupo<>0) and (produto<>0) and
    (ordem<>-1)   and (faixa<>'-1') and (tipz<>'')   then
  begin
          {*** Saldo do item no item de pedido de compra}
    DMEstoque.qValidaItemEntrada1.parambyname('forn').AsFloat        := forn;
    DMEstoque.qValidaItemEntrada1.parambyname('nota').AsString       := nota;
    DMEstoque.qValidaItemEntrada1.parambyname('tipz').AsString       := tipz;
    DMEstoque.qValidaItemEntrada1.parambyname('grupo').AsFloat       := grupo;
    DMEstoque.qValidaItemEntrada1.parambyname('subgrupo').AsFloat    := subgrupo;
    DMEstoque.qValidaItemEntrada1.parambyname('produto').AsFloat     := produto;
    DMEstoque.qValidaItemEntrada1.parambyname('ordem').AsInteger     := ordem;
    DMEstoque.qValidaItemEntrada1.parambyname('tamanho').AsString    := faixa;
    DMEstoque.qValidaItemEntrada1.parambyname('validade').AsString   := valid;
    DMEstoque.qValidaItemEntrada1.ExecSql;
  end;
end;

procedure ValidaItemEntrada2(forn: Real; nota,tipz: String; grupo,subgrupo,produto: Real;
  faixa: String; cor: Real; valid: String);
begin
  if (forn<>0) and (nota<>'') and (grupo<>0)  and (subgrupo<>0) and (produto<>0) and
    (cor<>-1)   and (faixa<>'-1') and (tipz<>'') then
  begin
          {*** Saldo do item no item de pedido de compra}
    DMEstoque.qValidaItemEntrada2.parambyname('forn').AsFloat        := forn;
    DMEstoque.qValidaItemEntrada2.parambyname('nota').AsString       := nota;
    DMEstoque.qValidaItemEntrada2.parambyname('tipz').AsString       := tipz;
    DMEstoque.qValidaItemEntrada2.parambyname('grupo').AsFloat       := grupo;
    DMEstoque.qValidaItemEntrada2.parambyname('subgrupo').AsFloat    := subgrupo;
    DMEstoque.qValidaItemEntrada2.parambyname('produto').AsFloat     := produto;
    DMEstoque.qValidaItemEntrada2.parambyname('cor').AsFloat         := cor;
    DMEstoque.qValidaItemEntrada2.parambyname('tamanho').AsString    := faixa;
    DMEstoque.qValidaItemEntrada2.parambyname('validade').AsString   := valid;
    DMEstoque.qValidaItemEntrada2.ExecSql;
  end;
end;

{Funcao que calcula o total de pedido de compra, de acordo com as quantidades atendidas ****}
{Usando as quantidades 3,4 que sao quebradas e nao-reais - so servem para efeito de calculo
 de titulos a confirmar - 1,2 armazenam as quantidades atendidades reais *** }
function CalculaTotalPedidoCompraAte (n_pedido: Real; n_loja: Real; tipz: String; dis1: Real):Real;
var
  clAux: TClassAuxiliar;
  dif1,total: Real;
  qtdePedido,qtdeAtendida: Real;
  parcela: Real;
begin
  total:=0.00;
  if (n_pedido<>0) then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   ('ESTOQUE',frm_principal);
      ClearSql;
      AddParam ('Select IT_QTDE,IT_QAT1,IT_QAT2,IT_PCUS,        ');
      AddParam ('       PC_CODI,PC_DIS1,IT_QAT3,IT_QAT4         ');
      AddParam ('From  ITENS_PEDIDO_COMPRA,PEDIDO_COMPRA        ');
      AddParam ('Where (IT_NPED='+floattostr(n_pedido)+') AND   ');
      AddParam ('      (IT_NPED=PC_CODI) AND                    ');
      AddParam ('      (IT_LOJA='+floattostr(n_loja)+')         ');
      AddParam ('Order by IT_GRUP,IT_SUBG,IT_PROD,IT_LOJA       ');
      Execute;
      first;
      while (not eof) do
      begin
        if (tipz='1') then
        begin
          qtdeAtendida := clAux.result('IT_QAT3');
          qtdePedido   := ((100 - dis1)/100)*clAux.result('IT_QTDE');
        end
        else
        if (tipz='2') then
        begin
          qtdeAtendida := clAux.result('IT_QAT4');
          qtdePedido   := (dis1/100)*clAux.result('IT_QTDE');
        end;
        parcela := strtofloat(floattostr(qtdePedido)) -
          strtofloat(floattostr(qtdeAtendida));
        total   := total      + (parcela*result('IT_PCUS'));
        next;
      end;
      desconect;
      Free;
    end;
  CalculaTotalPedidoCompraAte := total;
end;

{feriado ***}
function DiaMaximo(mes,ano: Integer):Word;
var
  resto: Real;
begin
  if (mes=1) then
    result:=31
  else
  if (mes=2) then
  begin
    resto:= ano mod 4;
    if (resto=0) then
      result:=29
    else
      result:=28;
  end
  else
  if (mes=3) then
    result:=31
  else
  if (mes=4) then
    result:=30
  else
  if (mes=5) then
    result:=31
  else
  if (mes=6) then
    result:=30
  else
  if (mes=7) then
    result:=31
  else
  if (mes=8) then
    result:=31
  else
  if (mes=9) then
    result:=30
  else
  if (mes=10) then
    result:=31
  else
  if (mes=11) then
    result:=30
  else
  if (mes=12) then
    result:=31;
end;

{30/60/90 ***}
function RetornaData (data: TDateTime; dia_x: Word;inc: Integer):TDateTime;
var
  Year,Month,Day: Word;
  mes: Integer;
  dif: Integer;
begin
  DecodeDate(data, Year, Month, Day);
  mes:=Month;
  dif:=12-mes;
  if (inc>dif) then
  begin
    Year:=Year+1;
    mes:=(0-dif);
  end;
  try
    data:=strtodate(form_nz(dia_x,2)+'/'+form_nz(mes+inc,2)+'/'+Copy(inttostr(Year),3,2));
  except
    data:=strtodate(form_nz(DiaMaximo(mes+inc,Year),2)+'/'+form_nz(mes+inc,2)+'/'+Copy(inttostr(Year),3,2));
  end;
  RetornaData:=data;
end;

procedure MarcaEntradaMovimento1 (forn: Real; ndoc,tipz: String;
  grupo,subgrupo,produto: Real; ordem: Integer;
  tamanho: String; seqmov: Real);
begin
  DMEstoque.qEntradaMovimento1.parambyname('forn').AsFloat        := forn;
  DMEstoque.qEntradaMovimento1.parambyname('nota').AsString       := ndoc;
  DMEstoque.qEntradaMovimento1.parambyname('tipz').AsString       := tipz;
  DMEstoque.qEntradaMovimento1.parambyname('grupo').AsFloat       := grupo;
  DMEstoque.qEntradaMovimento1.parambyname('subgrupo').AsFloat    := subgrupo;
  DMEstoque.qEntradaMovimento1.parambyname('produto').AsFloat     := produto;
  DMEstoque.qEntradaMovimento1.parambyname('ordem').AsInteger     := ordem;
  DMEstoque.qEntradaMovimento1.parambyname('tamanho').AsString    := tamanho;
  DMEstoque.qEntradaMovimento1.parambyname('seqmov').AsFloat      := seqmov;
  DMEstoque.qEntradaMovimento1.ExecSql;
end;

procedure MarcaEntradaMovimento2 (forn: Real; ndoc,tipz: String;
  grupo,subgrupo,produto,cor: Real; tamanho: String;
  seqmov: Real);
begin
  DMEstoque.qEntradaMovimento2.parambyname('forn').AsFloat        := forn;
  DMEstoque.qEntradaMovimento2.parambyname('nota').AsString       := ndoc;
  DMEstoque.qEntradaMovimento2.parambyname('tipz').AsString       := tipz;
  DMEstoque.qEntradaMovimento2.parambyname('grupo').AsFloat       := grupo;
  DMEstoque.qEntradaMovimento2.parambyname('subgrupo').AsFloat    := subgrupo;
  DMEstoque.qEntradaMovimento2.parambyname('produto').AsFloat     := produto;
  DMEstoque.qEntradaMovimento2.parambyname('cor').AsFloat         := cor;
  DMEstoque.qEntradaMovimento2.parambyname('tamanho').AsString    := tamanho;
  DMEstoque.qEntradaMovimento2.parambyname('seqmov').AsFloat      := seqmov;
  DMEstoque.qEntradaMovimento2.ExecSql;
end;

{Retorna o codigo do tamanho para geracao dos codigos de barras ***}
{Como os tamanhos sao 'strings' ocorre que os codigos de barras geram um inteiro}
function DevolveCodTam(grupo,subgrupo,produto: Real; n_tam: String):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PF_TAMA,PF_SEQ          ');
  clAux.AddParam ('FROM   PRODUTOS_FAIXAS         ');
  clAux.AddParam ('WHERE (PF_TAMA=:pf_tama) AND   ');
  clAux.AddParam ('      (PF_GRUP=:pf_grupo) AND  ');
  clAux.AddParam ('      (PF_SUBG=:pf_subg) AND   ');
  clAux.AddParam ('      (PF_PROD=:pf_prod)       ');
  clAux.consulta.parambyname('pf_tama').AsString := n_tam;
  clAux.consulta.parambyname('pf_grupo').AsFloat := grupo;
  clAux.consulta.parambyname('pf_subg').AsFloat := subgrupo;
  clAux.consulta.parambyname('pf_prod').AsFloat := produto;
  if (clAux.Execute) then
    result := clAux.result('PF_SEQ')
  else
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT TF_TAMA,TF_SEQ           ');
    clAux.AddParam ('FROM   TAMANHOS_FAIXAS,PRODUTOS ');
    clAux.AddParam ('WHERE (TF_TAMA=:tf_tama) AND    ');
    clAux.AddParam ('      (PR_TTAM=TF_CODI) AND     ');
    clAux.AddParam ('      (PR_GRUP=:pr_grupo) AND   ');
    clAux.AddParam ('      (PR_SUBG=:pr_subg) AND    ');
    clAux.AddParam ('      (PR_CODI=:pr_prod)        ');
    clAux.consulta.parambyname('tf_tama').AsString := n_tam;
    clAux.consulta.parambyname('pr_grupo').AsFloat := grupo;
    clAux.consulta.parambyname('pr_subg').AsFloat  := subgrupo;
    clAux.consulta.parambyname('pr_prod').AsFloat  := produto;
    if (clAux.Execute) then
      result := clAux.result('TF_SEQ')
    else
      result := -1;
  end;
  clAux.desconect;
  clAux.Free;
end;

{Retorna a ref. do fabricante do produto em questao ***}
function InformaRefFabric(grupo,subgrupo,produto: Real):String;
var
  clAux: TClassAuxiliar;
begin
  with (clAux) do
  begin
    clAux := TClassAuxiliar.Create;
    conect   ('ESTOQUE',frm_principal);
    ClearSql;
    AddParam ('Select PR_REFF                                ');
    AddParam ('From   PRODUTOS                               ');
    AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND     ');
    AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND  ');
    AddParam ('      (PR_CODI='+floattostr(produto)+')       ');
    if (Execute) then
      InformaRefFabric:=result('PR_REFF')
    else
      InformaRefFabric:='';
    desconect;
    Free;
  end;
end;

function DevolveProxSequencialTamanho_Produtos(grupo,subgrupo,codigo: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  with (clAux) do
  begin
    clAux := TClassAuxiliar.Create;
    conect ('ESTOQUE',frm_principal);
    ClearSql;
    AddParam ('Select MAX(PF_SEQ) as MAXIMO_SEQUENCIAL  ');
    AddParam ('From  PRODUTOS_FAIXAS                    ');
    AddParam ('Where (PF_GRUP=:grupo) AND               ');
    AddParam ('      (PF_SUBG=:subgrupo) AND            ');
    AddParam ('      (PF_PROD=:produto)                 ');
    consulta.parambyname('grupo').AsFloat := grupo;
    consulta.parambyname('subgrupo').AsFloat := subgrupo;
    consulta.parambyname('produto').AsFloat := codigo;
    if (Execute) then
      DevolveProxSequencialTamanho_Produtos := result('MAXIMO_SEQUENCIAL')+1
    else
      DevolveProxSequencialTamanho_Produtos := -1;
    desconect;
    Free;
  end;
end;

function DevolveProxSequencialTamanho_Subgrupos(grupo,subgrupo: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  with (clAux) do
  begin
    clAux := TClassAuxiliar.Create;
    conect   ('ESTOQUE',frm_principal);
    ClearSql;
    AddParam ('Select MAX(SF_SEQ) as MAXIMO_SEQUENCIAL  ');
    AddParam ('From  SUBGRUPOS_FAIXAS                   ');
    AddParam ('Where (SF_GRUP=:grupo) AND               ');
    AddParam ('      (SF_SUBG=:subgrupo)                ');
    consulta.parambyname('grupo').AsFloat := grupo;
    consulta.parambyname('subgrupo').AsFloat := subgrupo;
    if (Execute) then
      DevolveProxSequencialTamanho_Subgrupos := clAux.result('MAXIMO_SEQUENCIAL')+1
    else
      DevolveProxSequencialTamanho_Subgrupos := -1;
    desconect;
    Free;
  end;
end;

function InformaSeqb(codtam: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  with (clAux) do
  begin
    clAux := TClassAuxiliar.Create;
    conect   ('ESTOQUE',frm_principal);
    ClearSql;
    AddParam ('Select TM_SEQB                         ');
    AddParam ('From  TAMANHOS                         ');
    AddParam ('Where (TM_CODI='+floattostr(codtam)+') ');
    if (Execute) then
      InformaSeqb := result('TM_SEQB')
    else
      InformaSeqb := -1;
    desconect;
    Free;
  end;
end;

{*** - Funcao que tenta processar um pedido de compra, atraves da geracao de titulos
 baseado no calculo da qtde. atendida - USADO NO CONTAS A PAGAR}
function ProcessaPedidoCompra(n_pedido,n_loja: Real; plano: Real; flag_exibe: Boolean;
  tipz: String; gauge: TGauge):Boolean;
var
  clTitulosConf: TClassTitulosConfirmar;
  clPedido: TClassAuxiliar;
  clPrestPlan: TClassAuxiliar;
  clPrest: TClassAuxiliar;
  clAux: TClassAuxiliar;
  clLoja: TClassAuxiliar;
  vencimento,n_data: TDateTime;
  Year, Month, dia_x: Word;
  dist1,total1,total2,valor_parcela1,valor_parcela2: Real;
  inc,peri,numero_da_parcela,total_de_parcelas: Integer;
  n_forn,n_abat: Real;
  conta_fornecedor: Real;
  bloja:Real;
begin
  if (n_pedido<>0) then
  begin
     {a) Apagando titulos a confirmar do pedido}
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('CONTASPAGAR',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Delete from TITULOS_A_CONFIRMAR                ');
    clAux.AddParam ('Where (TI_LINK='+floattostr(n_pedido)+')       ');
    if (n_loja<>-1) then
      clAux.AddParam ('AND (TI_CUST='+floattostr(n_loja)+')       ');
    clAux.Execute;
    clAux.desconect;
    clAux.Free;

     {b) Buscando dados do pedido de compra}
    clPedido := TClassAuxiliar.Create;
    clPedido.conect   ('ESTOQUE',frm_principal);
    clPedido.ClearSql;
    clPedido.AddParam ('Select PC_TOTA,PC_DTP1,PC_DIS1,PC_PLAN,   ');
    clPedido.AddParam ('       PC_FORN,PC_ABAT                    ');
    clPedido.AddParam ('From PEDIDO_COMPRA                        ');
    clPedido.AddParam ('Where (PC_CODI='+floattostr(n_pedido)+')  ');
    if (clPedido.Execute) then
    begin
      n_data        := clPedido.result('PC_DTP1');
      n_abat        := clPedido.result('PC_ABAT');
      dist1         := clPedido.result('PC_DIS1');
      if (plano=-1) then
        plano     := clPedido.result('PC_PLAN');
      n_forn        := clPedido.result('PC_FORN');

       {...Montagem do form. de exibicao dos titulos na tela>>>}
      if (flag_exibe) then
      begin
        Application.CreateForm (Tfrm_VerTitulosConfirmados,frm_VerTitulosConfirmados);
        frm_VerTitulosConfirmados.memo1.lines.clear;
        frm_VerTitulosConfirmados.memo1.lines.Add('');
        frm_VerTitulosConfirmados.memo1.lines.Add(' ---------------------------------------------------------------------------');
        frm_VerTitulosConfirmados.memo1.lines.Add(' Pedido...: '+form_nz(n_pedido,6)+'   Total...: '+form_nc(clPedido.result('PC_TOTA'),10));
        frm_VerTitulosConfirmados.memo1.lines.Add(' ---------------------------------------------------------------------------');
        frm_VerTitulosConfirmados.memo1.lines.Add(' Loja Pc    Documento           Sr Vencimento            Valor           ');
        frm_VerTitulosConfirmados.memo1.lines.Add(' ---------------------------------------------------------------------------');
        frm_VerTitulosConfirmados.top  := 37;
        frm_VerTitulosConfirmados.left := 83;
      end;

       {...}
      with (clPrest) do
      begin
        clPrest := TClassAuxiliar.Create;
        conect   ('CONTASPAGAR',frm_principal);
        ClearSql;
        AddParam ('Select PL_QTDP                          ');
        AddParam ('From   PLANOS_DE_PAGAMENTO              ');
        AddParam ('Where (PL_CODI='+floattostr(plano)+')   ');
        if (Execute) then
        begin
             {b) Procurando o n. da conta do fornecedor do PEDIDO}
          total_de_parcelas := result('PL_QTDP');
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CONTASPAGAR',frm_principal);
          clAux.ClearSql;
          clAux.AddParam ('Select FO_CONT                           ');
          clAux.AddParam ('From   FORNECEDORES                      ');
          clAux.AddParam ('Where (FO_CODI='+floattostr(n_forn)+')   ');
          clAux.Execute;
          conta_fornecedor := clAux.result('FO_CONT');
          clAux.desconect;
          clAux.Free;

             {Serao gerados titulos para cada centro de custo}
          clLoja := TClassAuxiliar.Create;
          clLoja.conect   ('ESTOQUE',frm_principal);
          clLoja.ClearSql;
          clLoja.AddParam ('SELECT DISTINCT IT_LOJA                    ');
          clLoja.AddParam ('FROM ITENS_PEDIDO_COMPRA                   ');
          clLoja.AddParam ('WHERE (IT_NPED='+floattostr(n_pedido)+')   ');
          if (n_loja<>-1) then
            clLoja.AddParam ('AND (IT_LOJA='+floattostr(n_loja)+')   ');
          if (clLoja.Execute) then
          begin
            gauge.progress:=0;
            clLoja.first;
            while (not clLoja.eof) do
            begin
              bloja := clLoja.Result('it_loja');
                 {***********************************************************************}
              total1         := CalculaTotalPedidoCompraAte (n_pedido,clLoja.result('IT_LOJA'),'1',dist1);
              total2         := CalculaTotalPedidoCompraAte (n_pedido,clLoja.result('IT_LOJA'),'2',dist1);
              if (total1>0) and (total_de_parcelas>0) then
                valor_parcela1 := total1/total_de_parcelas
              else
                valor_parcela1:=0;
              if (total2>0) and (total_de_parcelas>0) then
                valor_parcela2 := total2/total_de_parcelas
              else
                valor_parcela2:=0;
                 {***********************************************************************}

                 {...}
              clPrestPlan := TClassAuxiliar.Create;
              clPrestPlan.conect  ('CONTASPAGAR',frm_principal);
              clPrestPlan.ClearSql;
              clPrestPlan.AddParam ('Select PR_PLAN,PR_DIAS                 ');
              clPrestPlan.AddParam ('From   PREST_PLANOS_DE_PAGAMENTO       ');
              clPrestPlan.AddParam ('Where (PR_PLAN='+floattostr(plano)+')  ');
              clPrestPlan.AddParam ('Order by PR_DIAS                       ');
              if (clPrestPlan.Execute) and (total_de_parcelas<>0) then
              begin
                   {c) Geracao dos titulos - LINK COM CONTAS A PAGAR ---->}
                numero_da_parcela := 1;
                peri := clPrestPlan.result('PR_DIAS');
                DecodeDate(n_data, Year, Month, dia_x);
                if ((peri mod 30)=0) then
                begin
                  inc  := Round(Int(peri/30));
                  vencimento := RetornaData(n_data,dia_x,inc);
                end
                else
                  vencimento := n_data + peri;

                   {...}
                clTitulosConf := TClassTitulosConfirmar.Create;
                clTitulosConf.conect ('CONTASPAGAR',frm_principal);
                clPrestPlan.first;
                while (not clPrestPlan.eof) do
                begin
                      {a) titulo dentro -caixa 01->}
                  if (valor_parcela1<>0.00) then
                  begin
                    clTitulosConf.ClearFields;
                    clTitulosConf.inTI_CUST := clLoja.result('IT_LOJA');
                    clTitulosConf.inTI_CONT := conta_fornecedor;
                    clTitulosConf.inTI_FORN := n_forn;
                    clTitulosConf.inTI_DESC := 'Pagamento do pedido Nº '+form_n(n_pedido,6);
                    clTitulosConf.inTI_DCTO := floattostr(n_pedido);
                    clTitulosConf.inTI_DATA := n_data;
                    clTitulosConf.inTI_LINK := n_pedido;
                    clTitulosConf.inTI_DVTO := vencimento;
                    clTitulosConf.inTI_VALO := valor_parcela1;
                    clTitulosConf.inTI_TOTA := total1;
                    clTitulosConf.inTI_PARC := numero_da_parcela;
                    clTitulosConf.inTI_TPAR := total_de_parcelas;
                    clTitulosConf.inTI_DOCA := '';
                    clTitulosConf.inTI_PERI := 'N';
                    clTitulosConf.inTI_TIPO := 'E';
                    clTitulosConf.inTI_ESPE := 'PEDIDO';
                    clTitulosConf.inTI_FORM := 'A';
                    clTitulosConf.inTI_TIPZ := '1';
                    clTitulosConf.inTI_ABAT := n_abat;
                    clTitulosConf.Insert;
                    if (tipz='1') or (tipz='3') then
                      if (flag_exibe) then
                        frm_VerTitulosConfirmados.memo1.lines.Add (' '+
                          form_nz   (clTitulosConf.inTI_CUST,2)+'   '+
                          form_nz   (numero_da_parcela,2)+'    '+
                          form_t    (clTitulosConf.inTI_DCTO,20) +' '+
                          form_t    (clTitulosConf.inTI_TIPZ,1) +'  '+
                          form_data (clTitulosConf.inTI_DVTO) +' '+
                          form_nc   (clTitulosConf.inTI_VALO,15));
                  end;

                      {a) titulo dentro -caixa 02->}
                  if (valor_parcela2<>0.00) then
                  begin
                        {a) titulo forma -caixa 02->}
                    clTitulosConf.ClearFields;
                    clTitulosConf.inTI_CUST := clLoja.result('IT_LOJA');
                    clTitulosConf.inTI_CONT := conta_fornecedor;
                    clTitulosConf.inTI_FORN := n_forn;
                    clTitulosConf.inTI_DESC := 'Pagamento do pedido Nº '+form_n(n_pedido,6);
                    clTitulosConf.inTI_DCTO := floattostr(n_pedido);
                    clTitulosConf.inTI_DATA := n_data;
                    clTitulosConf.inTI_LINK := n_pedido;
                    clTitulosConf.inTI_DVTO := vencimento;
                    clTitulosConf.inTI_VALO := valor_parcela2;
                    clTitulosConf.inTI_TOTA := total2;
                    clTitulosConf.inTI_PARC := numero_da_parcela;
                    clTitulosConf.inTI_TPAR := total_de_parcelas;
                    clTitulosConf.inTI_DOCA := '';
                    clTitulosConf.inTI_PERI := 'N';
                    clTitulosConf.inTI_TIPO := 'E';
                    clTitulosConf.inTI_ESPE := 'PEDIDO';
                    clTitulosConf.inTI_FORM := 'A';
                    clTitulosConf.inTI_TIPZ := '2';
                    clTitulosConf.inTI_ABAT := n_abat;
                    clTitulosConf.Insert;
                    if (tipz='2') or (tipz='3') then
                      if (flag_exibe) then
                        frm_VerTitulosConfirmados.memo1.lines.Add (' '+
                          form_nz   (clTitulosConf.inTI_CUST,2)+'   '+
                          form_nz   (numero_da_parcela,2)+'    '+
                          form_t    (clTitulosConf.inTI_DCTO,20) +' '+
                          form_t    (clTitulosConf.inTI_TIPZ,1) +'  '+
                          form_data (clTitulosConf.inTI_DVTO) +' '+
                          form_nc   (clTitulosConf.inTI_VALO,15));
                  end;

                      {prox. parcela-->}
                  clPrestPlan.next;
                  peri := clPrestPlan.Result('PR_DIAS');
                      {DecodeDate(vencimento, Year, Month, dia_x);}
                  if ((peri mod 30)=0) then
                  begin
                    inc  := Round(Int(peri/30));
                    vencimento := RetornaData(n_data,dia_x,inc);
                  end
                  else
                    vencimento   := n_data + peri;
                  numero_da_parcela := numero_da_parcela + 1;
                  gauge.progress    := Round((numero_da_parcela/total_de_parcelas)*100);
                  gauge.refresh;
                end;
                gauge.progress := 100;
                clTitulosConf.desconect;
                clTitulosConf.Free;
              end
              else
              if (flag_exibe) then
                frm_VerTitulosConfirmados.memo1.lines.Add (' '+
                  ' O plano de pagamento selecionado não possui prestações cadastradas -- ');
              clPrestPlan.desconect;
              clPrestPlan.Free;

                 {proxima loja do pedido---->}
              clLoja.next;
            end;
          end;
          clLoja.desconect;
          clLoja.Free;
        end
        else
        if (flag_exibe) then
          frm_VerTitulosConfirmados.memo1.lines.Add (' '+
            ' Plano de pgto. não encontrado -- ');
        desconect;
        Free;
      end;
    end
    else
    if (flag_exibe) then
      frm_VerTitulosConfirmados.memo1.lines.Add (' '+
        ' Plano de pgto. não encontrado -- ');
    if (flag_exibe) then
    begin
      frm_VerTitulosConfirmados.showmodal;
      frm_VerTitulosConfirmados.Free;
    end;
  end;
end;

{Funcao que retorna o perc. de comissao do vendedor, A vista (AV) ou A Prazo (AP) ***}
function DevolvePercComisVend(loja,vendedor: Real; tipo: String):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.AddParam ('SELECT VD_COMA,VD_COMP FROM VENDEDORES        ');
  clAux.AddParam ('WHERE (VD_CODI='+floattostr(vendedor)+') AND  ');
  clAux.AddParam ('      (VD_LOJA='+floattostr(loja)+')          ');
  if (clAux.Execute) then
  begin
    if (tipo='AV') then
      result:=clAux.result('VD_COMA')
    else
    if (tipo='AP') then
      result:=clAux.result('VD_COMP')
    else
      result:=0.00;
  end
  else
    result:=0.00;
  clAux.desconect;
  clAux.Free;
end;

{Funcao responsavel pela formatacao do codigo de barras dos itens ***}
function FormataCodigoBarras(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
var
  clAux,clAux2: TClassAuxiliar;
  codigo_barras: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM CONFIG_CODIGO_BARRAS');
  if (clAux.Execute) then
  begin
    clAux.first;
    codigo_barras:='';
    while (not clAux.eof) do
    begin
      if (clAux.result('CAMPO')=0) then
        codigo_barras:=codigo_barras + form_nz(grupo,clAux.result('ESPACO'))
      else
      if (clAux.result('CAMPO')=1) then
        codigo_barras:=codigo_barras + form_nz(subgrupo,clAux.result('ESPACO'))
      else
      if (clAux.result('CAMPO')=2) then
        codigo_barras:=codigo_barras + form_nz(produto,clAux.result('ESPACO'))
      else
      if ((clAux.result('CAMPO')=3) or (clAux.result('CAMPO')=4)) then
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   ('ESTOQUE',frm_principal);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT PR_REFI,PR_REFF FROM PRODUTOS  ');
        clAux2.AddParam ('WHERE (PR_GRUP=:grupo) AND            ');
        clAux2.AddParam ('      (PR_SUBG=:subgrupo) AND         ');
        clAux2.AddParam ('      (PR_CODI=:produto)              ');
        clAux2.consulta.parambyname('grupo').AsFloat    := grupo;
        clAux2.consulta.parambyname('subgrupo').AsFloat := subgrupo;
        clAux2.consulta.parambyname('produto').AsFloat  := produto;
        if (clAux2.Execute) then
        begin
          if (clAux.result('CAMPO')=3) then
            codigo_barras:=codigo_barras + form_tz(clAux2.result('PR_REFI'),clAux.result('ESPACO'))
          else
          if (clAux.result('CAMPO')=4) then
            codigo_barras:=codigo_barras + form_tz(clAux2.result('PR_REFF'),clAux.result('ESPACO'));
        end
        else
          codigo_barras:=codigo_barras + form_nz(0,clAux.result('ESPACO'));
        clAux2.desconect;
        clAux2.Free;
      end
      else
      if (clAux.result('CAMPO')=5) then
      begin
        if (frm_principal.x_tipocor) then
        begin
          clAux2 := TClassAuxiliar.Create;
          clAux2.conect   ('ESTOQUE',frm_principal);
          clAux2.ClearSql;
          clAux2.AddParam ('SELECT CR_CODI,CODART FROM CORES      ');
          clAux2.AddParam ('WHERE (CR_CODI=:CR_CODI)              ');
          clAux2.consulta.parambyname('CR_CODI').AsFloat    := cor;
          if (clAux2.Execute) then
            codigo_barras:=codigo_barras + form_tz(clAux2.Result('CODART'),clAux.result('ESPACO'));
          clAux2.Desconect;
          clAux2.Free;
        end
        else
        if (not frm_principal.x_tipocor) then
          codigo_barras:=codigo_barras + form_nz(cor,clAux.result('ESPACO'));
      end
      else
      if (clAux.result('CAMPO')=6) then
        codigo_barras:=codigo_barras + form_nz(DevolveCodTam(grupo,subgrupo,produto,tamanho),clAux.result('ESPACO'));
      clAux.next;
    end;
    if (frm_principal.x_adiciona_dv_codigo_barras) then
      codigo_barras := codigo_barras + inttostr(CalculaDigitoVerificador(codigo_barras));
    result:=codigo_barras;
  end
  else
    result:='?';
  clAux.desconect;
  clAux.Free;
end;

function DevolveProxSequencialTamanho(codigo_tamanho: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select TF_SEQ                 ');
  clAux.AddParam ('From TAMANHOS_FAIXAS          ');
  clAux.AddParam ('Where (TF_CODI=:codigo)       ');
  clAux.AddParam ('Order by TF_SEQ               ');
  clAux.consulta.parambyname('codigo').AsFloat := codigo_tamanho;
  clAux.Execute;
  if (clAux.reccount=0) then
    result := 1
  else
  begin
    clAux.last;
    result := clAux.result('TF_SEQ')+1;
  end;
  clAux.desconect;
  clAux.Free;
end;

{Rotina de cancelamento de venda ***}
{O campo VE_STAT da tabela de vendas assume as seguintes situacoes:
 0-> SEM pagamento concluido,
 1-> COM pagamento concluido,
 2-> cancelado
 ...}
procedure CancelaVenda(codigo_loja,codigo_caixa,codigo_venda: Real);
var
  clAux,clUlt: TClassAuxiliar;
  preco_custo: Real;
  data_ultima_venda: TDateTime;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);

     {cancelando a venda}
  clAux.AddParam ('UPDATE VENDAS SET VE_STAT='+chr(39)+'2'+chr(39)+'  ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                          ');
  clAux.AddParam ('      (VE_CAIX=:caixa) AND                         ');
  clAux.AddParam ('      (VE_CODI=:venda)                             ');
  clAux.consulta.parambyname('loja').AsFloat  := codigo_loja;
  clAux.consulta.parambyname('caixa').AsFloat := codigo_caixa;
  clAux.consulta.parambyname('venda').AsFloat := codigo_venda;
  clAux.Execute;
  clAux.ClearSql;

     {chamando os itens para cancelamento}
  clAux.AddParam ('SELECT *                             ');
  clAux.AddParam ('FROM ITENS_VENDAS,VENDAS             ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND            ');
  clAux.AddParam ('      (VE_CAIX=:caixa) AND           ');
  clAux.AddParam ('      (VE_CODI=:venda) AND           ');
  clAux.AddParam ('      (VE_LOJA=IV_LOJA) AND          ');
  clAux.AddParam ('      (VE_CAIX=IV_CAIX) AND          ');
  clAux.AddParam ('      (VE_CODI=IV_VEND)              ');
  clAux.consulta.parambyname('loja').AsFloat  := codigo_loja;
  clAux.consulta.parambyname('caixa').AsFloat := codigo_caixa;
  clAux.consulta.parambyname('venda').AsFloat := codigo_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
    if (clAux.result('IV_TOTA')>=0.00) then {a venda realizou uma saida de mercadoria}
    begin
      preco_custo := InformaUltimoPrecoCusto(clAux.result('IV_GRUP'),clAux.result('IV_SUBG'),clAux.result('IV_PROD'),clAux.result('IV_CORE'),clAux.result('IV_TAMA'),clAux.result('VE_TIPZ'));

             {Inserindo registro no movimento ***}
      DMEstoque.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
      DMEstoque.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := clAux.result('IV_GRUP');
      DMEstoque.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := clAux.result('IV_SUBG');
      DMEstoque.qInsereMovimento.parambyname('MO_PROD').AsFloat    := clAux.result('IV_PROD');
      DMEstoque.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := clAux.result('IV_LOJA');
      DMEstoque.qInsereMovimento.parambyname('MO_CORE').AsFloat    := clAux.result('IV_CORE');
      DMEstoque.qInsereMovimento.parambyname('MO_TAMA').AsString   := clAux.result('IV_TAMA');
      DMEstoque.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := clAux.result('IV_OTAM');
      DMEstoque.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
      DMEstoque.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
      DMEstoque.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := preco_custo;
      DMEstoque.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := clAux.result('IV_PVEN');
      DMEstoque.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'E'; {entrada}
      DMEstoque.qInsereMovimento.parambyname('MO_MODE').AsString   := 'C'; {cancelamento de venda}
      DMEstoque.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
      DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString   := clAux.result('VE_NOTA');
      DMEstoque.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'));
      DMEstoque.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_TIPZ').AsString   := clAux.result('VE_TIPZ');
      DMEstoque.qInsereMovimento.ExecSql;

             {*** Entrada do item no estoque-loja}
      EntradaItemEstoque (clAux.result('IV_LOJA'),
        clAux.result('VE_TIPZ'),
        clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        clAux.result('IV_QTDE'));

             //Verificando qual foi a ultima venda do ITEM
      clUlt := TClassAuxiliar.Create;
      clUlt.conect   ('ESTOQUE',frm_principal);
      clUlt.ClearSql;
      clUlt.AddParam ('SELECT MAX(VE_DATA) as MAXIMA_DATA   ');
      clUlt.AddParam ('FROM VENDAS,ITENS_VENDAS             ');
      clUlt.AddParam ('WHERE (IV_GRUP=:grupo) AND           ');
      clUlt.AddParam ('      (IV_SUBG=:subgrupo) AND        ');
      clUlt.AddParam ('      (IV_PROD=:produto) AND         ');
      clUlt.AddParam ('      (IV_CORE=:cor) AND             ');
      clUlt.AddParam ('      (IV_TAMA=:tamanho) AND         ');
      clUlt.AddParam ('      (VE_LOJA=IV_LOJA) AND          ');
      clUlt.AddParam ('      (VE_CAIX=IV_CAIX) AND          ');
      clUlt.AddParam ('      (VE_CODI=IV_VEND) AND          ');
      clUlt.AddParam ('      (VE_TIPZ=:tipz) AND            ');
      clUlt.AddParam ('      (VE_STAT=:status)              ');
      clUlt.consulta.parambyname('grupo').AsFloat    := clAux.result('IV_GRUP');
      clUlt.consulta.parambyname('subgrupo').AsFloat := clAux.result('IV_SUBG');
      clUlt.consulta.parambyname('produto').AsFloat  := clAux.result('IV_PROD');
      clUlt.consulta.parambyname('cor').AsFloat      := clAux.result('IV_CORE');
      clUlt.consulta.parambyname('tamanho').AsString := clAux.result('IV_TAMA');
      clUlt.consulta.parambyname('tipz').AsString    := clAux.result('VE_TIPZ');
      clUlt.consulta.parambyname('status').AsString  := '1'; //so vendas 'NORMAIS'
      clUlt.Execute;
      if (clUlt.Result('MAXIMA_DATA')=strtodate('30/12/1899')) or //DATA NULA - 'NULL'
        (clUlt.Result('MAXIMA_DATA')=strtodate('01/01/1900')) then //DATA VAZIA CONSIDERADA PELO SISTEMA
        data_ultima_venda := strtodate('01/01/1900')
      else
        data_ultima_venda := clUlt.Result('MAXIMA_DATA');

             {*********************************************************************************************}
      AtualizaUltimaVenda_Estoque(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        data_ultima_venda,
        clAux.result('VE_TIPZ'));

             {*********************************************************************************************}
      AtualizaUltimaVenda_Estoque_Loja(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        clAux.result('VE_LOJA'),
        data_ultima_venda,
        clAux.result('VE_TIPZ'));

      clUlt.desconect;
      clUlt.Free;
    end
    else
    if (clAux.result('IV_TOTA')<0.00) then {a venda realizou uma entrada de mercadoria}
    begin
      preco_custo := InformaUltimoPrecoCusto(clAux.result('IV_GRUP'),clAux.result('IV_SUBG'),clAux.result('IV_PROD'),clAux.result('IV_CORE'),clAux.result('IV_TAMA'),clAux.result('VE_TIPZ'));

             {Inserindo registro no movimento ***}
      DMEstoque.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
      DMEstoque.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := clAux.result('IV_GRUP');
      DMEstoque.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := clAux.result('IV_SUBG');
      DMEstoque.qInsereMovimento.parambyname('MO_PROD').AsFloat    := clAux.result('IV_PROD');
      DMEstoque.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := clAux.result('IV_LOJA');
      DMEstoque.qInsereMovimento.parambyname('MO_CORE').AsFloat    := clAux.result('IV_CORE');
      DMEstoque.qInsereMovimento.parambyname('MO_TAMA').AsString   := clAux.result('IV_TAMA');
      DMEstoque.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := clAux.result('IV_OTAM');
      DMEstoque.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
      DMEstoque.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
      DMEstoque.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := preco_custo;
      DMEstoque.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := clAux.result('IV_PVEN');
      DMEstoque.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'S'; {entrada}
      DMEstoque.qInsereMovimento.parambyname('MO_MODE').AsString   := 'C'; {cancelamento de venda}
      DMEstoque.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
      DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString   := clAux.result('VE_NOTA');
      DMEstoque.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'));
      DMEstoque.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := (-1)*clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_TIPZ').AsString   := clAux.result('VE_TIPZ');
      DMEstoque.qInsereMovimento.ExecSql;

             {*** Saldo do item no estoque-loja}
      SaidaItemEstoque (clAux.result('IV_LOJA'),
        clAux.result('VE_TIPZ'),
        clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        clAux.result('IV_QTDE'));
    end;

         {prox. item--->}
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure CancelaVenda_2(codigo_loja: Real; numero_documento,tipz: String);
var
  clAux,clUlt: TClassAuxiliar;
  preco_custo: Real;
  data_ultima_venda: TDateTime;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);

     {cancelando a venda}
  clAux.AddParam ('UPDATE VENDAS SET VE_STAT='+chr(39)+'2'+chr(39)+'  ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                          ');
  clAux.AddParam ('      (VE_NOTA=:ndoc) AND                          ');
  clAux.AddParam ('      (VE_TIPZ=:tipz)                              ');
  clAux.consulta.parambyname('loja').AsFloat  := codigo_loja;
  clAux.consulta.parambyname('ndoc').AsString := numero_documento;
  clAux.consulta.parambyname('tipz').AsString := tipz;
  clAux.Execute;
  clAux.ClearSql;

     {*************************** chamando os itens para cancelamento ******************************}
  clAux.AddParam ('SELECT *                             ');
  clAux.AddParam ('FROM   ITENS_VENDAS,VENDAS           ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND            ');
  clAux.AddParam ('      (VE_NOTA=:ndoc) AND            ');
  clAux.AddParam ('      (VE_TIPZ=:tipz) AND            ');
  clAux.AddParam ('      (VE_LOJA=IV_LOJA) AND          ');
  clAux.AddParam ('      (VE_CAIX=IV_CAIX) AND          ');
  clAux.AddParam ('      (VE_CODI=IV_VEND)              ');
  clAux.consulta.parambyname('loja').AsFloat  := codigo_loja;
  clAux.consulta.parambyname('ndoc').AsString := numero_documento;
  clAux.consulta.parambyname('tipz').AsString := tipz;
  clAux.Execute;
  clAux.first;
     {**********************************************************************************************}
  while (not clAux.eof) do
  begin
    if (clAux.result('IV_TOTA')>=0.00) then {(+) A venda realizou uma saida de mercadoria}
    begin
      preco_custo := InformaUltimoPrecoCusto(clAux.result('IV_GRUP'),clAux.result('IV_SUBG'),clAux.result('IV_PROD'),clAux.result('IV_CORE'),clAux.result('IV_TAMA'),clAux.result('VE_TIPZ'));

             {Inserindo registro no movimento ***}
      DMEstoque.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
      DMEstoque.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := clAux.result('IV_GRUP');
      DMEstoque.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := clAux.result('IV_SUBG');
      DMEstoque.qInsereMovimento.parambyname('MO_PROD').AsFloat    := clAux.result('IV_PROD');
      DMEstoque.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := clAux.result('IV_LOJA');
      DMEstoque.qInsereMovimento.parambyname('MO_CORE').AsFloat    := clAux.result('IV_CORE');
      DMEstoque.qInsereMovimento.parambyname('MO_TAMA').AsString   := clAux.result('IV_TAMA');
      DMEstoque.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := clAux.result('IV_OTAM');
      DMEstoque.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0; //pedido
      DMEstoque.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
      DMEstoque.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'E'; {ENTRADA}
      DMEstoque.qInsereMovimento.parambyname('MO_MODE').AsString   := 'C'; {cancelamento de venda}
      DMEstoque.qInsereMovimento.parambyname('MO_ENTR').AsString   := ''; //entrada
      DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString   := clAux.result('VE_NOTA'); //DOCUMENTO
      DMEstoque.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := preco_custo;
      DMEstoque.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := clAux.result('IV_PVEN');
      DMEstoque.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'));
      DMEstoque.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_TIPZ').AsString   := clAux.result('VE_TIPZ');
      DMEstoque.qInsereMovimento.ExecSql;

             {*** Entrada do item no estoque-loja}
      EntradaItemEstoque (clAux.result('IV_LOJA'),
        clAux.result('VE_TIPZ'), //dentro ou fora
        clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        clAux.result('IV_QTDE')); //QTDE

             //Verificando qual foi a ultima venda do ITEM
      clUlt := TClassAuxiliar.Create;
      clUlt.conect   ('ESTOQUE',frm_principal);
      clUlt.ClearSql;
      clUlt.AddParam ('SELECT MAX(VE_DATA) as MAXIMA_DATA   ');
      clUlt.AddParam ('FROM VENDAS,ITENS_VENDAS             ');
      clUlt.AddParam ('WHERE (IV_GRUP=:grupo) AND           ');
      clUlt.AddParam ('      (IV_SUBG=:subgrupo) AND        ');
      clUlt.AddParam ('      (IV_PROD=:produto) AND         ');
      clUlt.AddParam ('      (IV_CORE=:cor) AND             ');
      clUlt.AddParam ('      (IV_TAMA=:tamanho) AND         ');
      clUlt.AddParam ('      (VE_LOJA=IV_LOJA) AND          ');
      clUlt.AddParam ('      (VE_CAIX=IV_CAIX) AND          ');
      clUlt.AddParam ('      (VE_CODI=IV_VEND) AND          ');
      clUlt.AddParam ('      (VE_TIPZ=:tipz) AND            ');
      clUlt.AddParam ('      (VE_STAT=:status)              ');
      clUlt.consulta.parambyname('grupo').AsFloat    := clAux.result('IV_GRUP');
      clUlt.consulta.parambyname('subgrupo').AsFloat := clAux.result('IV_SUBG');
      clUlt.consulta.parambyname('produto').AsFloat  := clAux.result('IV_PROD');
      clUlt.consulta.parambyname('cor').AsFloat      := clAux.result('IV_CORE');
      clUlt.consulta.parambyname('tamanho').AsString := clAux.result('IV_TAMA');
      clUlt.consulta.parambyname('tipz').AsString    := clAux.result('VE_TIPZ');
      clUlt.consulta.parambyname('status').AsString  := '1'; //so vendas 'NORMAIS'
      clUlt.Execute;
      if (clUlt.Result('MAXIMA_DATA')=strtodate('30/12/1899')) or //DATA NULA - 'NULL'
        (clUlt.Result('MAXIMA_DATA')=strtodate('01/01/1900')) then //DATA VAZIA CONSIDERADA PELO SISTEMA
        data_ultima_venda := strtodate('01/01/1900')
      else
        data_ultima_venda := clUlt.Result('MAXIMA_DATA');

             {*********************************************************************************************}
      AtualizaUltimaVenda_Estoque(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        data_ultima_venda,
        clAux.result('VE_TIPZ'));

            {*********************************************************************************************}
      AtualizaUltimaVenda_Estoque_Loja(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        clAux.result('VE_LOJA'),
        data_ultima_venda,
        clAux.result('VE_TIPZ'));

      clUlt.desconect;
      clUlt.Free;
    end
    else
    if (clAux.result('IV_TOTA')<0.00) then {(-) A venda realizou uma entrada (TROCA/DEVOLUCAO) de mercadoria}
    begin
      preco_custo := InformaUltimoPrecoCusto(clAux.result('IV_GRUP'),clAux.result('IV_SUBG'),clAux.result('IV_PROD'),clAux.result('IV_CORE'),clAux.result('IV_TAMA'),clAux.result('VE_TIPZ'));

             {Inserindo registro no movimento ***}
      DMEstoque.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
      DMEstoque.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := clAux.result('IV_GRUP');
      DMEstoque.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := clAux.result('IV_SUBG');
      DMEstoque.qInsereMovimento.parambyname('MO_PROD').AsFloat    := clAux.result('IV_PROD');
      DMEstoque.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := clAux.result('IV_LOJA');
      DMEstoque.qInsereMovimento.parambyname('MO_CORE').AsFloat    := clAux.result('IV_CORE');
      DMEstoque.qInsereMovimento.parambyname('MO_TAMA').AsString   := clAux.result('IV_TAMA');
      DMEstoque.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := clAux.result('IV_OTAM');
      DMEstoque.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0; //pedido
      DMEstoque.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
      DMEstoque.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := preco_custo;
      DMEstoque.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := clAux.result('IV_PVEN');
      DMEstoque.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'S'; {SAIDA}
      DMEstoque.qInsereMovimento.parambyname('MO_MODE').AsString   := 'C'; {cancelamento de troca/devolucao}
      DMEstoque.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
      DMEstoque.qInsereMovimento.parambyname('MO_NOTA').AsString   := clAux.result('VE_NOTA');
      DMEstoque.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'));
      DMEstoque.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := (-1)*clAux.result('IV_QTDE');
      DMEstoque.qInsereMovimento.parambyname('MO_TIPZ').AsString   := clAux.result('VE_TIPZ');
      DMEstoque.qInsereMovimento.ExecSql;

             {*** Saldo do item no estoque-loja}
      SaidaItemEstoque (clAux.result('IV_LOJA'),
        clAux.result('VE_TIPZ'), //dentro/fora
        clAux.result('IV_GRUP'),
        clAux.result('IV_SUBG'),
        clAux.result('IV_PROD'),
        clAux.result('IV_CORE'),
        clAux.result('IV_TAMA'),
        clAux.result('IV_QTDE')); //QTDE
    end;

         {prox. item--->}
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;
end;

{Devolve o codigo do fornecedor daquele produto ***}
function BuscaFornecedor(grupo,subgrupo,produto: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PR_FORN FROM PRODUTOS          ');
  clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND            ');
  clAux.AddParam ('      (PR_SUBG=:subgrupo) AND         ');
  clAux.AddParam ('      (PR_CODI=:produto)              ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  if (clAux.Execute) then
    result := clAux.result('PR_FORN')
  else
    result := 0;
  clAux.desconect;
  clAux.Free;
end;

{Devolve o codigo do fornecedor do pedido ***}
function BuscaFornecedorPedido(pedido: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PC_FORN FROM PEDIDO_COMPRA     ');
  clAux.AddParam ('WHERE (PC_CODI=:codigo_pedido)        ');
  clAux.consulta.parambyname('codigo_pedido').AsFloat := pedido;
  if (clAux.Execute) then
    result := clAux.result('PC_FORN')
  else
    result := 0;
  clAux.desconect;
  clAux.Free;
end;

function VerificaExistenciaDoRegistroPRODUTO(grupo,subgrupo,produto: Real):Boolean;
var
  clProd: TClassAuxiliar;
begin
  clProd := TClassAuxiliar.Create;
  clProd.conect   ('ESTOQUE',frm_principal);
  clProd.clearSql;
  clProd.AddParam ('Select *                       ');
  clProd.AddParam ('From   PRODUTOS                ');
  clProd.AddParam ('Where (PR_SUBG=:subgrupo) AND  ');
  clProd.AddParam ('      (PR_GRUP=:grupo) AND     ');
  clProd.AddParam ('      (PR_CODI=:produto)       ');
  clProd.consulta.parambyname('grupo').AsFloat    := grupo;
  clProd.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clProd.consulta.parambyname('produto').AsFloat  := produto;
  if (not clProd.Execute) then
    result:=false
  else
    result:=true;
  clProd.desconect;
  clProd.Free;
end;

{* Rotina muito usada em PEDIDOS,ENTRADAS,OUTRAS ENTRADAS,OUTRAS SAIDAS,TRANSFERENCIAS,etc...}
function VerificaExistenciaDoRegistroESTOQUE(grupo,subgrupo,produto,cor: Real; tamanho: String;
  pcu1,pcu2,upc1,upc2,upa1,upa2,pve1,pve2: Real;tipz:String=''):Boolean;
var
  clEstoque: TClassItensEstoque;
begin
  clEstoque := TClassItensEstoque.Create;
  clEstoque.conect   ('ESTOQUE',frm_principal);
  clEstoque.ClearSql;
  clEstoque.AddParam ('Select ES_CBAR From ESTOQUE                     ');
  clEstoque.AddParam ('Where  (ES_GRUP='+floattostr(grupo)+') AND      ');
  clEstoque.AddParam ('       (ES_SUBG='+floattostr(subgrupo)+') AND   ');
  clEstoque.AddParam ('       (ES_PROD='+floattostr(produto)+') AND    ');
  clEstoque.AddParam ('       (ES_CORE='+floattostr(cor)+') AND        ');
  clEstoque.AddParam ('       (ES_TAMA='+chr(39)+tamanho+chr(39)+')    ');
  clEstoque.ClearFields;
  clEstoque.inES_GRUP := grupo;
  clEstoque.inES_SUBG := subgrupo;
  clEstoque.inES_PROD := produto;
  clEstoque.inES_CORE := cor;
  clEstoque.inES_TAMA := tamanho;
  result := true;

  if (not clEstoque.Execute) then
  begin
    if (upa1 < 0) and (pcu1 > 0) then
      upa1 := pcu1;

    if (upa2 < 0) and (pcu2 > 0) then
      upa2 := pcu2;

    clEstoque.inES_OTAM := InformaOrdemTamanho(grupo,subgrupo,produto,tamanho);
    clEstoque.inES_DESC := FormataNomeItemProduto(form_nz(grupo,2)+
      form_nz(subgrupo,2)+
      form_nz(produto,4),
      cor,
      tamanho);
    clEstoque.inES_REFF := InformaRefFabric(grupo,subgrupo,produto);
    clEstoque.inES_PVE1 := pve1;
    clEstoque.inES_PVE2 := pve2;
    clEstoque.inES_PCU1 := pcu1;
    clEstoque.inES_PCU2 := pcu2;
    clEstoque.inES_UPA1 := upa1;
    clEstoque.inES_UPA2 := upa2;
    clEstoque.inES_UPC1 := upc1;
    clEstoque.inES_UPC2 := upc2;
    if (frm_principal.x_origem_cbarra_interno=0) then
      clEstoque.inES_CBAR := FormataCodigoBarras(grupo,subgrupo,produto,cor,tamanho)
    else
    begin
      Application.CreateForm(Tfrm_InformeCbarra,frm_InformeCbarra);
      frm_InformeCbarra.pnProduto.caption := clEstoque.inES_DESC;
      frm_InformeCbarra.showmodal;
      if (frm_InformeCBarra.codigo_de_barras<>'-1') then
        clEstoque.inES_CBAR  := frm_InformeCBarra.codigo_de_barras
      else
        clEstoque.inES_CBAR := '';
      frm_InformeCbarra.Free;
    end;
    if (frm_principal.x_solicitar_EAN13_no_cadastro_de_produtos) then
    begin
      Application.CreateForm(Tfrm_InformeEAN13,frm_InformeEAN13);
      frm_InformeEAN13.pnProduto.caption := clEstoque.inES_DESC;
      frm_InformeEAN13.y_grupo    := grupo;
      frm_InformeEAN13.y_subgrupo := subgrupo;
      frm_InformeEAN13.y_produto  := produto;
      frm_InformeEAN13.showmodal;
      if (frm_InformeEAN13.codigo_de_barras<>'-1') then
        clEstoque.inES_CEAN  := frm_InformeEAN13.codigo_de_barras
      else
        clEstoque.inES_CEAN := '';
      frm_InformeEAN13.Free;
    end
    else
      clEstoque.inES_CEAN := '';
    clEstoque.inES_TIME := frm_principal.x_data_trabalho;
    clEstoque.Insert;
          {**********************************************}
    VerificaExistenciaRegistroPRODUTOSFAIXAS(grupo,subgrupo,produto,tamanho);
          {**********************************************}
    result := false; {*}
  end
  else
  begin     
    if (tipz='1') and (upa1 > 0) then
      with (DMEstoque.qLancaUltimoPrecoAquisicao1) do
      begin
        parambyname('grupo').AsFloat    := grupo;
        parambyname('subgrupo').AsFloat := subgrupo;
        parambyname('produto').AsFloat  := produto;
        parambyname('cor').AsFloat      := cor;
        parambyname('tamanho').AsString := tamanho;
        parambyname('preco_aquisicao1').AsFloat := upa1;
        parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
        ExecSql;
      end
    else
    if (tipz='2') and (upa2 > 0)  then
      with (DMEstoque.qLancaUltimoPrecoAquisicao2) do
      begin
        parambyname('grupo').AsFloat    := grupo;
        parambyname('subgrupo').AsFloat := subgrupo;
        parambyname('produto').AsFloat  := produto;
        parambyname('cor').AsFloat      := cor;
        parambyname('tamanho').AsString := tamanho;
        parambyname('preco_aquisicao2').AsFloat := upa2;
        parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
        ExecSql;
      end;


    if (tipz='1') and (pcu1 > 0)  then
    begin
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('grupo').AsFloat        := grupo;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('subgrupo').AsFloat     := subgrupo;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('produto').AsFloat      := produto;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('cor').AsFloat          := cor;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('tamanho').AsString     := tamanho;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('preco_custo1').AsFloat := pcu1;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('time').AsDateTime      := frm_principal.x_data_trabalho;
      DMEstoque.qLancaUltimoPrecoCusto1.ExecSql;
    end
    else
    if (tipz='2') and (pcu2 > 0) then
    begin
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('grupo').AsFloat        := grupo;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('subgrupo').AsFloat     := subgrupo;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('produto').AsFloat      := produto;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('cor').AsFloat          := cor;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('tamanho').AsString     := tamanho;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('preco_custo2').AsFloat := pcu2;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('time').AsDateTime      := frm_principal.x_data_trabalho;
      DMEstoque.qLancaUltimoPrecoCusto2.ExecSql;
    end;
  end;
  clEstoque.desconect;
  clEstoque.Free;
end;

{* Rotina muito usada em PEDIDOS,ENTRADAS,TRANSFERENCIAS,etc...}
procedure VerificaExistenciaDoRegistroESTOQUE_LOJA(grupo,subgrupo,produto,cor: Real; tamanho: String; loja: Real);
var
  clEstoqueLj: TClassItensEstoqueLoja;
begin
  clEstoqueLj := TClassItensEstoqueLoja.Create;
  clEstoqueLj.conect   ('ESTOQUE',frm_principal);
  clEstoqueLj.ClearSql;
  clEstoqueLj.AddParam ('Select  EL_QTD1 From ESTOQUE_LOJA                  ');
  clEstoqueLj.AddParam ('Where  (EL_GRUP='+floattostr(grupo)+') AND         ');
  clEstoqueLj.AddParam ('       (EL_SUBG='+floattostr(subgrupo)+') AND      ');
  clEstoqueLj.AddParam ('       (EL_PROD='+floattostr(produto)+') AND       ');
  clEstoqueLj.AddParam ('       (EL_CORE='+floattostr(cor)+') AND           ');
  clEstoqueLj.AddParam ('       (EL_TAMA='+chr(39)+tamanho+chr(39)+') AND   ');
  clEstoqueLj.AddParam ('       (EL_LOJA='+floattostr(loja)+')              ');
  if (not clEstoqueLj.Execute) then
  begin
    clEstoqueLj.ClearFields;
    clEstoqueLj.inEL_GRUP := grupo;
    clEstoqueLj.inEL_SUBG := subgrupo;
    clEstoqueLj.inEL_PROD := produto;
    clEstoqueLj.inEL_CORE := cor;
    clEstoqueLj.inEL_TAMA := tamanho;
    clEstoqueLj.inEL_OTAM := InformaOrdemTamanho(grupo,subgrupo,produto,tamanho);
    clEstoqueLj.inEL_LOJA := loja;
    clEstoqueLj.inEL_QTD1 := 0; //saldo inicial de zero
    clEstoqueLj.inEL_QTD2 := 0; //saldo inicial de zero
    clEstoqueLj.inEL_TIME := frm_principal.x_data_trabalho;
    clEstoqueLj.Insert;
  end;
  clEstoqueLj.desconect;
  clEstoqueLj.Free;
end;

{Exibe o nome do item de produto de acordo com a configuracao de nome do SUBGRUPO
o qual o produto pertence, e em funcao da configuracao do proprio PRODUTO cadastrado,
adicionando ao nome do produto, a COR e o TAMANHO ***}
function  FormataNomeItemProduto (n_produto: String; n_cor: Real; n_tam: String):String;
var
  clAux: TClassAuxiliar;
  codigo,porcao_grupo: String;
  porcao_subgrupo,porcao_produto: String;
  nome,nome_cor,nome_faixa: String;
  parte1,parte2: Integer;
begin
  codigo:=Trim(n_produto);
  if (codigo<>'') then
  begin
    if (Length(codigo)>7) then
    begin
      porcao_grupo    := Copy(codigo,1,2);
      porcao_subgrupo := Copy(codigo,3,2);
      porcao_produto  := Copy(codigo,5,Length(codigo)-1);
      clAux := TClassAuxiliar.Create;
      clAux.conect ('ESTOQUE',frm_principal);
      clAux.ClearSql;
      clAux.AddParam ('Select PR_DESC,PR_PAR1,PR_PAR2           ');
      clAux.AddParam ('From   PRODUTOS                          ');
      clAux.AddParam ('Where (PR_GRUP='+porcao_grupo+') AND     ');
      clAux.AddParam ('      (PR_SUBG='+porcao_subgrupo+') AND  ');
      clAux.AddParam ('      (PR_CODI='+porcao_produto+')       ');
      parte1:=-1;
      parte2:=-1;
      nome:='';
      if (clAux.Execute) then
      begin
        nome   := clAux.result('PR_DESC');
        parte1 := clAux.result('PR_PAR1');
        parte2 := clAux.result('PR_PAR2');
      end
      else
        nome   := '<produto não encontrado>';

               {...}
      clAux.ClearSql;
      clAux.AddParam ('Select CR_ABRV                         ');
      clAux.AddParam ('From   CORES                           ');
      clAux.AddParam ('Where (CR_CODI='+floattostr(n_cor)+')  ');
      if (clAux.Execute) then
      begin
        if (n_cor=0) then
          nome_cor:= 'COR UNICA'
        else
          nome_cor:=clAux.result('CR_ABRV')
      end
      else
        nome_cor:=' Cor ?';
      if (n_tam<>'0') then
        nome_faixa:=UpperCase(n_tam)
      else
        nome_faixa:='TAM UNICO';

               {... - Montando o nome corretamente}
      if (parte1=1) then
        nome:=nome+' '+nome_cor
      else
      if (parte1=2) then
        nome:=nome+' '+nome_faixa;
      if (parte2=1) then
        nome:=nome+' '+nome_cor
      else
      if (parte2=2) then
        nome:=nome+' '+nome_faixa;
      FormataNomeItemProduto := form_t(nome,80);
      clAux.desconect;
      clAux.Free;
    end
    else
      FormataNomeItemProduto := '';
  end
  else
    FormataNomeItemProduto := '';
end;

{Retorna a ordem da faixa de tamanho dentro de sua familia de faixas, dentro do produto ***}
function InformaOrdemTamanho(grupo,subgrupo,produto: Real;tam: String):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PF_ORDE FROM PRODUTOS_FAIXAS  ');
  clAux.AddParam ('WHERE (PF_GRUP=:grupo) AND           ');
  clAux.AddParam ('      (PF_SUBG=:subgrupo) AND        ');
  clAux.AddParam ('      (PF_PROD=:produto) AND         ');
  clAux.AddParam ('      (PF_TAMA=:tamanho)             ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('tamanho').AsString := tam;
  if (clAux.Execute) then
    result:=clAux.result('PF_ORDE')
  else
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT TF_ORDE                       ');
    clAux.AddParam ('FROM   PRODUTOS,TAMANHOS_FAIXAS      ');
    clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND           ');
    clAux.AddParam ('      (PR_SUBG=:subgrupo) AND        ');
    clAux.AddParam ('      (PR_CODI=:produto) AND         ');
    clAux.AddParam ('      (TF_TAMA=:tamanho) AND         ');
    clAux.AddParam ('      (TF_CODI=PR_TTAM)              ');
    clAux.consulta.parambyname('grupo').AsFloat    := grupo;
    clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
    clAux.consulta.parambyname('produto').AsFloat  := produto;
    clAux.consulta.parambyname('tamanho').AsString := tam;
    if (clAux.Execute) then
      result:=clAux.result('TF_ORDE') 
    else
      result:=-1;
  end;
  clAux.desconect;
  clAux.Free;
end;

{Faz a reformatacao do codigo de barras, para fins de LEITURA ou DIGITACAO do codigo de barras}
{- No momento, ele 'APENAS' suprimi ou nao o DV na leitura}
function ReformataCodigoBarras(codigo_barras: String):String;
var
  tamanhoConfigurado: Integer;
begin
  codigo_barras := trim(codigo_barras);
  tamanhoConfigurado := RetornaTamanhoCodigoBarrasConfigurado;
  if (tamanhoConfigurado<Length(codigo_barras)) then
    if (frm_principal.x_suprimir_dv_cbarra) then
      codigo_barras := Copy(codigo_barras,1,tamanhoConfigurado);
  result:=codigo_barras;
end;

{Retorna o tamanho do campo codigo de barras, de acordo com a configuracao informada}
function RetornaTamanhoCodigoBarrasConfigurado:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(ESPACO) as TAMANHO ');
  clAux.AddParam ('FROM CONFIG_CODIGO_BARRAS     ');
  clAux.Execute;
  result:=clAux.result('TAMANHO');
  clAux.desconect;
  clAux.Free;
end;

procedure ChecaExistenciaArquivo_TEMP_INVENTARIO;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\ESTOQUE\TEMP_INVENTARIO.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('GRUPO');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('SUBGRUPO');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('PRODUTO');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('N0');
    NomeCampos.Add    ('LOJA');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('COR');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('TAMANHO');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('SALDO');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('TIPZ');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('DATA');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('D');
    CriaTabela('C:\NATIVA\ESTOQUE','TEMP_INVENTARIO.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,9);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

procedure ChecaExistenciaArquivo_TEMP_ENTRADAS;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\ESTOQUE\TEMP_ENTRADAS.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('GRUPO');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('SUBGRUPO');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('PRODUTO');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('N0');
    NomeCampos.Add    ('LOJA');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('COR');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('TAMANHO');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('QTDE');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('DATA');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('D');
    NomeCampos.Add    ('PCUSTO');
    TamanhoCampos.Add ('13');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('SALDOANT');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('MODE');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('TOTAL');
    TamanhoCampos.Add ('13');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('TIPZ');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    CriaTabela('C:\NATIVA\ESTOQUE','TEMP_ENTRADAS.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,13);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

procedure ChecaExistenciaArquivo_TEMP_SAIDAS;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\ESTOQUE\TEMP_SAIDAS.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('GRUPO');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('SUBGRUPO');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('PRODUTO');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('N0');
    NomeCampos.Add    ('LOJA');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('COR');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('TAMANHO');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('QTDE');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('DATA');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('D');
    NomeCampos.Add    ('PVENDA');
    TamanhoCampos.Add ('13');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('SALDOANT');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('MODE');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('TOTAL');
    TamanhoCampos.Add ('13');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('TIPZ');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    CriaTabela('C:\NATIVA\ESTOQUE','TEMP_SAIDAS.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,13);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

function RetornaApelidoEmpresa:String;
begin
  if (Pos('KIK',UpperCase(frm_principal.x_empresa))>0) then
    result:='KIK'
  else
  if (Pos('SILHUETA',UpperCase(frm_principal.x_empresa))>0) then
    result:='SILHUETA'
  else
  if (Pos('CALCADOS & CIA',UpperCase(frm_principal.x_empresa))>0) then
    result:='CALCADOS & CIA'
  else
  if (Pos('TEREZINHA',UpperCase(frm_principal.x_empresa))>0) then
    result:='SAPATARIA TEREZINHA'
  else
  if (Pos('EMPRESA TESTE',UpperCase(frm_principal.x_empresa))>0) then
    result:='EMPRESA TESTE'
  else
  if (Pos('CUNHA',UpperCase(frm_principal.x_empresa))>0) then
    result:='CUNHA MODAS'
  else
  if (Pos('GIZA',UpperCase(frm_principal.x_empresa))>0) then
    result:='GIZA CALÇADOS'
  else
  if (Pos('GUTH',UpperCase(frm_principal.x_empresa))>0) then
    result:='GUTH MODAS'
  else
  if (Pos('DANTAS',UpperCase(frm_principal.x_empresa))>0) then
    result:='CASAS DANTAS'
  else
  if (Pos('AGM',UpperCase(frm_principal.x_empresa))>0) then
    result:='AGM'
  else
  if (Pos('CALÇADOS MODELO',UpperCase(frm_principal.x_empresa))>0) or
    (Pos('CALCADOS MODELO',UpperCase(frm_principal.x_empresa))>0) then
    result:='CALÇADOS MODELO';
end;

function RetornaTotalCotasLoja(codigo_loja: Real; ano,mes: Word):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(VC_COTP+VC_COTV) as TOTAL  ');
  clAux.AddParam ('FROM VENDEDORES_COTAS,VENDEDORES      ');
  clAux.AddParam ('WHERE (VC_VEND=VD_CODI) AND           ');
  clAux.AddParam ('      (VD_LOJA=:loja) AND             ');
  clAux.AddParam ('      (VC_MES=:mes) AND               ');
  clAux.AddParam ('      (VC_ANO=:ano)                   ');
  clAux.consulta.parambyname('loja').AsFloat  := codigo_loja;
  clAux.consulta.parambyname('ano').AsInteger := ano;
  clAux.consulta.parambyname('mes').AsInteger := mes;
  clAux.Execute;
  result := clAux.result('TOTAL');
  clAux.desconect;
  clAux.Free;
end;

function IsCorSortida(codigo_cor: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CR_SORT FROM CORES   ');
  clAux.AddParam ('WHERE (CR_CODI=:cor)        ');
  clAux.consulta.parambyname('cor').AsFloat := codigo_cor;
  clAux.Execute;
  if (clAux.result('CR_SORT')='0') then
    result:=false
  else
  if (clAux.result('CR_SORT')='1') then
    result:=true;
  clAux.desconect;
  clAux.Free;
end;

{*** Verifica PRIMEIRO se existe uma tabela de preço, SEGUNDO devolve o preco no cadastro}
{Tanto o '1' o oficial como o '2' o nao-oficial}
function DevolvePrecoItem(loja: Real; grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
  continua: Boolean;
begin
     {1o nivel de procura de preco - TABELAS_PRECOS (2,3,4,...)}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select PP_PRE1,PP_PRE2                                                                ');
  clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                            ');
  clAux.AddParam ('Where (PP_LOJA='+floattostr(loja)+') AND                                              ');
  clAux.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                             ');
  clAux.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                                          ');
  clAux.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                                           ');
  clAux.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                               ');
  clAux.AddParam ('      (PP_TAMA='+chr(39)+tamanho+chr(39)+') AND                                       ');
  clAux.AddParam ('      (PP_DAT1<='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+') AND   '); {*}
  clAux.AddParam ('      (PP_DAT2>='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+')       '); {*}
  clAux.AddParam ('Order by PP_DAT2                                                                      ');
  if (clAux.Execute) then
  begin
    clAux.last; {IMPORTANTE: pega sempre a ultima, caso haja mais de uma tabela}
    if (clAux.result('PP_PRE'+tipz)<>0.00) then
    begin
      result := clAux.result('PP_PRE'+tipz);
      flagDevolvePrecoItem := 2; //flag de preco promocional
      continua := false;
    end
    else
      continua := true;
  end
  else
    continua := true;

     {...}
  if (continua) then
  begin
         {2o nivel de procura de preco - TABELAS PRECOS (1) - PRECO DIFERENCIADO}
    clAux.ClearSql;
    clAux.AddParam ('Select IP_PRE1,IP_PRE2                                   ');
    clAux.AddParam ('From   ITENS_TABELAS_PRECOS                              ');
    clAux.AddParam ('Where (IP_LOJA='+floattostr(loja)+') AND                 ');
    clAux.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND                ');
    clAux.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND             ');
    clAux.AddParam ('      (IP_PROD='+floattostr(produto)+') AND              ');
    clAux.AddParam ('      (IP_CORE='+floattostr(cor)+') AND                  ');
    clAux.AddParam ('      (IP_TAMA='+chr(39)+tamanho+chr(39)+') AND          ');
    clAux.AddParam ('      (IP_TABE=1)                                        ');
    if (clAux.Execute) then
    begin
      if (clAux.result('IP_PRE'+tipz)<>0.00) then
      begin
        result := clAux.result('IP_PRE'+tipz);
        flagDevolvePrecoItem := 1; //flag de preco diferencial
        continua := false;
      end
      else
        continua := true;
    end
    else
      continua := true;

         {...}
    if (continua) then
    begin
             {3o nivel de procura de preco - TABELAS PRECOS (1) - PRECO PRINCIPAL}
      clAux.ClearSql;
      clAux.AddParam ('Select ES_PVE1,ES_PVE2                                   ');
      clAux.AddParam ('From   ESTOQUE                                           ');
      clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND                ');
      clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND             ');
      clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND              ');
      clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND                  ');
      clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')              ');
      if (clAux.Execute) then
      begin
        result := clAux.result('ES_PVE'+tipz);
        flagDevolvePrecoItem := 0; //flag de preco principal
      end
      else
      begin
        result := 0.00;
        flagDevolvePrecoItem := -1; {*}
      end;
    end;
  end;
  clAux.desconect;
  clAux.Free;
end;

function RetornaPrimeiraFaixaTamanho(grupo,subgrupo,produto: Real):String;
var
  clAux: TClassAuxiliar;
begin
  with (clAux) do
  begin
    clAux := TClassAuxiliar.Create;
    conect ('ESTOQUE',frm_principal);
    ClearSql;
    AddParam ('Select PF_TAMA                                     ');
    AddParam ('From PRODUTOS_FAIXAS                               ');
    AddParam ('Where (PF_GRUP='+floattostr(grupo)+') AND          ');
    AddParam ('      (PF_SUBG='+floattostr(subgrupo)+') AND       ');
    AddParam ('      (PF_PROD='+floattostr(produto)+')            ');
    AddParam ('Order by PF_ORDE                                   ');
    if (not Execute) then
      RetornaPrimeiraFaixaTamanho:='?'
    else
    begin
      first;
      RetornaPrimeiraFaixaTamanho:=result('PF_TAMA');
    end;
    desconect;
    Free;
  end;
end;

function BuscaObservacaoMovimento(codigo_movimento: Real):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MB_TEXT FROM MOVIMENTO_OBSERVACAO  ');
  clAux.AddParam ('WHERE (MB_MOVI=:movimento)                ');
  clAux.consulta.parambyname('movimento').AsFloat := codigo_movimento;
  if (clAux.Execute) then
    result:=clAux.result('MB_TEXT')
  else
    result:='';
  clAux.desconect;
  clAux.Free;
end;

{- MANUTENCAO DO PRECO DA TABELA DIFERENCIADA}
procedure AtualizaPrecoPrincipal(preco,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String;todos:Boolean=false;verifprec:Boolean=false);
var
  clAux: TClassAuxiliar;
  preco_atual: Real;
  ordem_tam: Integer;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_PVE'+tipz+',ES_OTAM                        ');
  clAux.AddParam ('FROM   ESTOQUE                                       ');
  clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND            ');
  clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND         ');
  clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND          ');
  clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND              ');
  clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')          ');
  if (clAux.Execute) then
  begin
    preco_atual := clAux.result('ES_PVE'+tipz);
    ordem_tam   := clAux.result('ES_OTAM');

    clAux.ClearSql;
    clAux.AddParam ('UPDATE ESTOQUE                                       ');
    clAux.AddParam ('Set    ES_PVE'+tipz+'=:ES_PVE'+tipz+',               ');
    clAux.AddParam ('       ES_TIME=:ES_TIME                              ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND            ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND         ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+')           ');
    if not todos then
    begin
      clAux.AddParam ('      AND (ES_CORE='+floattostr(cor)+') AND              ');
      clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')          ');
    end
    else
    if (preco_atual > 0) and verifprec then
    begin
      clAux.AddParam (' AND ES_PVE'+tipz+' =:oldpreco');
      claux.consulta.parambyname('OldPreco').AsFloat := preco_atual;
    end;
    clAux.consulta.parambyname('ES_PVE'+tipz).AsFloat := preco;
    clAux.consulta.parambyname('ES_TIME').AsDateTime  := frm_principal.x_data_trabalho;
    clAux.Execute;

          //... historico
    if (preco_atual<>preco) then
      ArmazenaEmHistoricoDePrecos (grupo,subgrupo,produto,cor,tamanho,ordem_tam,
        0,preco_atual,preco,tipz,K_HIST_PRECO_VENDA_PRINC,
        'POR PEDIDO / ENTRADA ');

    if todos then
      try
        Frm_ListAltPrec := TFrm_ListAltPrec.Create(Application);
        Frm_ListAltPrec.Grup := grupo;
        Frm_ListAltPrec.SubG := Subgrupo;
        Frm_ListAltPrec.Prod := Produto;
        Frm_ListAltPrec.ShowModal;              
      finally
        Frm_ListAltPrec.destroy;
      end;            
  end;
  frm_principal.barraDicas.caption := '';
  frm_principal.barraDicas.refresh;
  clAux.desconect;
  clAux.Free;
end;

{- MANUTENCAO DO PRECO DA TABELA DIFERENCIAL}
procedure AtualizaPrecoDiferencial(preco,loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String);
var
  clAux: TClassAuxiliar;
  outro_preco: Real;
  preco_atual: Real;
  ordem_tam: Integer;
begin

  if (preco > 0) and (InformaPrecoVendaPrincipal(grupo,subgrupo,produto,cor,tamanho,'1') = 0) then
    AtualizaPrecoPrincipal(preco,grupo,subgrupo,produto,cor,tamanho,tipz);

  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select IP_PRE1,IP_PRE2,IP_OTAM                       ');
  clAux.AddParam ('From   ITENS_TABELAS_PRECOS                          ');
  clAux.AddParam ('Where (IP_GRUP='+floattostr(grupo)+') AND            ');
  clAux.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND         ');
  clAux.AddParam ('      (IP_PROD='+floattostr(produto)+') AND          ');
  clAux.AddParam ('      (IP_CORE='+floattostr(cor)+') AND              ');
  clAux.AddParam ('      (IP_TAMA='+chr(39)+tamanho+chr(39)+') AND      ');
  clAux.AddParam ('      (IP_TABE=1) AND                                ');
  clAux.AddParam ('      (IP_LOJA='+floattostr(loja)+')                 ');
  if (not clAux.Execute) then
  begin
    clAux.ClearSql;
    clAux.AddParam ('Insert into ITENS_TABELAS_PRECOS                                                                                                            ');
    clAux.AddParam ('(IP_GRUP,IP_SUBG,IP_PROD,IP_CORE,IP_OTAM,IP_TAMA,IP_LOJA,IP_TABE,IP_PRE1,IP_PRE2,IP_REAJ,IP_POR1,IP_POR2,IP_REA1,IP_REA2,IP_TIME)           ');
    clAux.AddParam ('Values                                                                                                                                      ');
    clAux.AddParam ('(:IP_GRUP,:IP_SUBG,:IP_PROD,:IP_CORE,:IP_OTAM,:IP_TAMA,:IP_LOJA,:IP_TABE,:IP_PRE1,:IP_PRE2,:IP_REAJ,:IP_POR1,:IP_POR2,:IP_REA1,:IP_REA2,:IP_TIME)    ');
    clAux.consulta.parambyname('IP_GRUP').AsFloat   := grupo;
    clAux.consulta.parambyname('IP_SUBG').AsFloat   := subgrupo;
    clAux.consulta.parambyname('IP_PROD').AsFloat   := produto;
    clAux.consulta.parambyname('IP_CORE').AsFloat   := cor;
    clAux.consulta.parambyname('IP_OTAM').AsInteger := InformaOrdemTamanho(grupo,subgrupo,produto,tamanho);
    clAux.consulta.parambyname('IP_TAMA').AsString  := tamanho;
    clAux.consulta.parambyname('IP_LOJA').AsFloat   := loja;
    clAux.consulta.parambyname('IP_TABE').AsFloat   := 1; {*}
    if (tipz='1') then
    begin
      clAux.consulta.parambyname('IP_PRE1').AsFloat   := preco;
      clAux.consulta.parambyname('IP_PRE2').AsFloat   := 0.00;
    end
    else
    if (tipz='2') then
    begin
      clAux.consulta.parambyname('IP_PRE1').AsFloat   := 0.00;
      clAux.consulta.parambyname('IP_PRE2').AsFloat   := preco;
    end;
    clAux.consulta.parambyname('IP_POR1').AsFloat   := 0.00;
    clAux.consulta.parambyname('IP_POR2').AsFloat   := 0.00;
    clAux.consulta.parambyname('IP_REA1').AsFloat   := 0.00;
    clAux.consulta.parambyname('IP_REA2').AsFloat   := 0.00;
    clAux.consulta.parambyname('IP_REAJ').AsFloat   := 0.00;
    clAux.consulta.parambyname('IP_TIME').AsDateTime := frm_principal.x_data_trabalho;
    clAux.Execute;
  end
  else
  begin
    ordem_tam := clAux.result('IP_OTAM');

    if (tipz='1') then
    begin
      preco_atual := clAux.result('IP_PRE1');
      outro_preco := clAux.result('IP_PRE2');
    end
    else
    if (tipz='2') then
    begin
      outro_preco := clAux.result('IP_PRE1');
      preco_atual := clAux.result('IP_PRE2');
    end;

    clAux.ClearSql;
    clAux.AddParam ('Update ITENS_TABELAS_PRECOS                ');
    clAux.AddParam ('Set    IP_PRE1=:IP_PRE1,                   ');
    clAux.AddParam ('       IP_PRE2=:IP_PRE2,                   ');
    clAux.AddParam ('       IP_TIME=:IP_TIME                    ');
    clAux.AddParam ('Where (IP_GRUP=:IP_GRUP) AND               ');
    clAux.AddParam ('      (IP_SUBG=:IP_SUBG) AND               ');
    clAux.AddParam ('      (IP_PROD=:IP_PROD) AND               ');
    clAux.AddParam ('      (IP_CORE=:IP_CORE) AND               ');
    clAux.AddParam ('      (IP_TAMA=:IP_TAMA) AND               ');
    clAux.AddParam ('      (IP_TABE=1) AND                      ');
    clAux.AddParam ('      (IP_LOJA=:IP_LOJA)                   ');
    clAux.consulta.parambyname('IP_GRUP').AsFloat   := grupo;
    clAux.consulta.parambyname('IP_SUBG').AsFloat   := subgrupo;
    clAux.consulta.parambyname('IP_PROD').AsFloat   := produto;
    clAux.consulta.parambyname('IP_CORE').AsFloat   := cor;
    clAux.consulta.parambyname('IP_TAMA').AsString  := tamanho;
    clAux.consulta.parambyname('IP_LOJA').AsFloat   := loja;
    if (tipz='1') then
    begin
      clAux.consulta.parambyname('IP_PRE1').AsFloat   := preco;
      clAux.consulta.parambyname('IP_PRE2').AsFloat   := outro_preco; {*}
    end
    else
    if (tipz='2') then
    begin
      clAux.consulta.parambyname('IP_PRE1').AsFloat   := outro_preco; {*}
      clAux.consulta.parambyname('IP_PRE2').AsFloat   := preco;
    end;
    clAux.consulta.parambyname('IP_TIME').AsDateTime := frm_principal.x_data_trabalho;
    clAux.Execute;

         //... historico
    if (preco_atual<>preco) then
      ArmazenaEmHistoricoDePrecos (grupo,subgrupo,produto,cor,tamanho,ordem_tam,
        loja,preco_atual,preco,tipz,K_HIST_PRECO_VENDA_DIF,
        'POR PEDIDO / ENTRADA ');
  end;
    {****************************************************}
  AtualizaTIMEEstoque(grupo,subgrupo,produto,cor,tamanho);
    {****************************************************}
  frm_principal.barraDicas.caption := '';
  frm_principal.barraDicas.refresh;
  clAux.desconect;
  clAux.Free;
end;

{* Esta funcao utiliza um dos algoritimos disponiveis para calculo do DV do codigo de barras dos itens}
function CalculaDigitoVerificador(campo: String):Integer;
begin
  result := CalculaDV_1 (campo,frm_principal.x_dv_peso,frm_principal.x_dv_modulo,frm_principal.x_dv_tipo);
        {// unico algoritimo disponivel até o momento}
end;

{*** Funcao de calculo do DIGITO VERIFICADOR ***}
function CalculaDV_1 (p_campo,p_peso: String; p_modulo,p_tipo: Integer):Integer;
var
  l_cont_campo,l_valor_acumulado,l_tam_campo: Integer;
  l_peso: String;
  l_valor_peso,l_valor_campo: Integer;
  l_tamanho,l_dv: Integer;
  l_produto: Real;
begin
  p_campo := sonumero(p_campo);
  if (trim(p_campo)='') then
    result := -1
  else
  begin
    l_cont_campo      := 1;
    l_valor_acumulado := 0;
    l_peso            := p_peso;
    l_tam_campo       := Length(trim(p_campo));
    while (l_cont_campo<=l_tam_campo) do
    begin
      l_valor_campo := strtoint(Copy(p_campo,l_cont_campo,1));
      l_tamanho     := Pos(',',l_peso) - 1;
      if (l_tamanho<0) then
        l_valor_peso := strtoint(Copy(l_peso,1,1))
      else
      begin
        l_valor_peso := strtoint(Copy(l_peso,1,l_tamanho));
        l_peso       := Copy(l_peso,(l_tamanho+2),Length(trim(l_peso))-1);
      end;
      l_produto := l_valor_campo*l_valor_peso;
      if (p_modulo=10) and (p_tipo<>5) then // Para tipo=5 nao somamos os digitos dos produtos Digito X Peso
        if (l_produto>9) then
        begin
          l_produto := Int(l_produto/10);
          l_produto := l_produto + (Trunc(l_produto) mod 10);
        end;
      l_valor_acumulado := l_valor_acumulado + Trunc(l_produto);
      l_cont_campo      := l_cont_campo + 1;
    end;
    l_dv := (l_valor_acumulado mod p_modulo);
    l_dv := p_modulo - l_dv;
    if (l_dv>9) then
      if (p_tipo=1) then
        l_dv := 0
      else
      if (p_tipo=2) then
        l_dv := 1
      else
      if (p_tipo=4) then
      begin
        if (l_dv=10) then
          l_dv := 1
        else
          l_dv := 0;
      end
      else
      if (p_tipo=5) then // caso da Chocolate
        l_dv := 0;
    result := l_dv;
  end;
end;

procedure ReformularProjetoIndicesESTOQUE;
var
  clAux: TClassAuxiliar;
begin
    {**************************************************************************************}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DROP TABLE INDICES ');
  clAux.Execute;
  clAux.ClearSql;
  clAux.AddParam ('CREATE TABLE INDICES (ARQUIVO VARCHAR(100),NOME VARCHAR(100),CAMPOS VARCHAR(100)) ');
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
    {**************************************************************************************}
  if (not ExisteIndice('PERMS_PRIM')) then
    CriaIndice('PERMS','PERMS_PRIM','PERUSER,PERMODULE,PERTYPE');
  if (not ExisteIndice('ARQLOG_PRIM')) then
    CriaIndice('ARQLOG','ARQLOG_PRIM','USUARIO');
  if (not ExisteIndice('ARQLOG_SEC1')) then
    CriaIndice('ARQLOG','ARQLOG_SEC1','MODULO');
  if (not ExisteIndice('MOVIMENTO_PRIM')) then
    CriaIndice('MOVIMENTO','MOVIMENTO_PRIM','MO_GRUP,MO_SUBG,MO_PROD,MO_LOJA,MO_CORE,MO_TAMA');
  if (not ExisteIndice('MOVIMENTO_SEC1')) then
    CriaIndice('MOVIMENTO','MOVIMENTO_SEC1','MO_LOJA');
  if (not ExisteIndice('MOVIMENTO_SEC2')) then
    CriaIndice('MOVIMENTO','MOVIMENTO_SEC2','MO_DATA');
  if (not ExisteIndice('GRUPO_PERMS_PRIM')) then
    CriaIndice('GRUPO_PERMS','GRUPO_PERMS_PRIM','PGRGRUPO,PGRMODULE,PGRTYPE');
  if (not ExisteIndice('GRUPO_PERMISSAO_PRIM')) then
    CriaIndice('GRUPO_PERMISSAO','GRUPO_PERMISSAO_PRIM','GP_CODI');
  if (not ExisteIndice('VENDEDORES_PRIM')) then
    CriaIndice('VENDEDORES','VENDEDORES_PRIM','VD_LOJA,VD_CODI');
  if (not ExisteIndice('VENDEDORES_COTAS_PRIM')) then
    CriaIndice('VENDEDORES_COTAS','VENDEDORES_COTAS_PRIM','VC_LOJA,VC_VEND');
  if (not ExisteIndice('ADMINISTRADORAS_PRIM')) then
    CriaIndice('ADMINISTRADORAS','ADMINISTRADORAS_PRIM','AM_CODI');
  if (not ExisteIndice('LINHAS_PRIM')) then
    CriaIndice('LINHAS','LINHAS_PRIM','LI_CODI');
  if (not ExisteIndice('COLECOES_PRIM')) then
    CriaIndice('COLECOES','COLECOES_PRIM','CO_CODI');
  if (not ExisteIndice('MATERIAIS_PRIM')) then
    CriaIndice('MATERIAIS','MATERIAIS_PRIM','MA_CODI');
  if (not ExisteIndice('CFOPS_PRIM')) then
    CriaIndice('CFOPS','CFOPS_PRIM','CF_CODI');
  if (not ExisteIndice('CORES_PRIM')) then
    CriaIndice('CORES','CORES_PRIM','CR_CODI');
  if (not ExisteIndice('TAMANHOS_PRIM')) then
    CriaIndice('TAMANHOS','TAMANHOS_PRIM','TM_CODI');
  if (not ExisteIndice('TAMANHOS_FAIXAS_PRIM')) then
    CriaIndice('TAMANHOS_FAIXAS','TAMANHOS_FAIXAS_PRIM','TF_CODI');
  if (not ExisteIndice('GRUPOS_PRODUTOS_PRIM')) then
    CriaIndice('GRUPOS_PRODUTOS','GRUPOS_PRODUTOS_PRIM','GR_CODI');
  if (not ExisteIndice('SUBGRUPOS_PRODUTOS_PRIM')) then
    CriaIndice('SUBGRUPOS_PRODUTOS','SUBGRUPOS_PRODUTOS_PRIM','SG_GRUP,SG_CODI');
  if (not ExisteIndice('MTV_ATDOS_PRIM')) then
    CriaIndice('MTV_ATDOS','MTV_ATDOS_PRIM','MA_CODI');

    {.......................................................................................}
  if (not ExisteIndice('PRODUTOS_PRIM')) then
    CriaIndice('PRODUTOS','PRODUTOS_PRIM','PR_GRUP,PR_SUBG,PR_CODI');
  if (not ExisteIndice('PRODUTOS_SEC1')) then
    CriaIndice('PRODUTOS','PRODUTOS_SEC1','PR_DESC');
  if (not ExisteIndice('PRODUTOS_SEC2')) then
    CriaIndice('PRODUTOS','PRODUTOS_SEC2','PR_REFI');
  if (not ExisteIndice('PRODUTOS_SEC3')) then
    CriaIndice('PRODUTOS','PRODUTOS_SEC3','PR_REFF');
  if (not ExisteIndice('PRODUTOS_SEC4')) then
    CriaIndice('PRODUTOS','PRODUTOS_SEC4','PR_TIME');

    {.......................................................................................}
  if (not ExisteIndice('PRODUTOS_FAIXAS_PRIM')) then
    CriaIndice('PRODUTOS_FAIXAS','PRODUTOS_FAIXAS_PRIM','PF_GRUP,PF_SUBG,PF_PROD');
  if (not ExisteIndice('PRODUTOS_FAIXAS_SEC1')) then
    CriaIndice('PRODUTOS_FAIXAS','PRODUTOS_FAIXAS_SEC1','PF_TIME');
  if (not ExisteIndice('PRODUTOS_MATERIAIS_PRIM')) then
    CriaIndice('PRODUTOS_MATERIAIS','PRODUTOS_MATERIAIS_PRIM','PM_GRUP,PM_SUBG,PM_PROD');
  if (not ExisteIndice('PRODUTOS_MATERIAIS_SEC1')) then
    CriaIndice('PRODUTOS_MATERIAIS','PRODUTOS_MATERIAIS_SEC1','PM_TIME');

    {.......................................................................................}
  if (not ExisteIndice('ESTOQUE_PRIM')) then
    CriaIndice('ESTOQUE','ESTOQUE_PRIM','ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA');
  if (not ExisteIndice('ESTOQUE_SEC1')) then
    CriaIndice('ESTOQUE','ESTOQUE_SEC1','ES_CBAR');
  if (not ExisteIndice('ESTOQUE_SEC2')) then
    CriaIndice('ESTOQUE','ESTOQUE_SEC2','ES_REFF');
  if (not ExisteIndice('ESTOQUE_SEC3')) then
    CriaIndice('ESTOQUE','ESTOQUE_SEC3','ES_TIME');
  if (not ExisteIndice('ESTOQUE_DADOS_MIGRADOS_PRIM')) then
    CriaIndice('ESTOQUE_DADOS_MIGRADOS','ESTOQUE_DADOS_MIGRADOS_PRIM','GRUPO,SUBGRUPO,PRODUTO,COR,TAMANHO');
  if (not ExisteIndice('ESTOQUE_LOJA_PRIM')) then
    CriaIndice('ESTOQUE_LOJA','ESTOQUE_LOJA_PRIM','EL_GRUP,EL_SUBG,EL_PROD,EL_CORE,EL_TAMA');
  if (not ExisteIndice('ESTOQUE_LOJA_SEC1')) then
    CriaIndice('ESTOQUE_LOJA','ESTOQUE_LOJA_SEC1','EL_LOJA');
  if (not ExisteIndice('ESTOQUE_LOJA_SEC2')) then
    CriaIndice('ESTOQUE_LOJA','ESTOQUE_LOJA_SEC2','EL_TIME');

    {.......................................................................................}
  if (not ExisteIndice('PEDIDO_COMPRA_PRIM')) then
    CriaIndice('PEDIDO_COMPRA','PEDIDO_COMPRA_PRIM','PC_CODI');
  if (not ExisteIndice('PEDIDO_COMPRA_SEC1')) then
    CriaIndice('PEDIDO_COMPRA','PEDIDO_COMPRA_SEC1','PC_FORN');
  if (not ExisteIndice('PEDIDO_COMPRA_SEC2')) then
    CriaIndice('PEDIDO_COMPRA','PEDIDO_COMPRA_SEC2','PC_DATA');
  if (not ExisteIndice('ITENS_PEDIDO_COMPRA_PRIM')) then
    CriaIndice('ITENS_PEDIDO_COMPRA','ITENS_PEDIDO_COMPRA_PRIM','IT_NPED,IT_GRUP,IT_SUBG,IT_PROD,IT_LOJA,IT_ORDE,IT_TAMA');
  if (not ExisteIndice('ITENS_PEDIDO_COMPRA_SEC1')) then
    CriaIndice('ITENS_PEDIDO_COMPRA','ITENS_PEDIDO_COMPRA_SEC1','IT_LOJA,IT_GRUP,IT_SUBG,IT_PROD,IT_ORDE,IT_CORE,IT_OTAM');
  if (not ExisteIndice('DESCONTOS_PEDIDO_COMPRA_PRIM')) then
    CriaIndice('DESCONTOS_PEDIDO_COMPRA','DESCONTOS_PEDIDO_COMPRA_PRIM','DP_NPED');
  if (not ExisteIndice('CORES_PEDIDO_COMPRA_PRIM')) then
    CriaIndice('CORES_PEDIDO_COMPRA','CORES_PEDIDO_COMPRA_PRIM','CP_PEDI');

    {.......................................................................................}
  if (not ExisteIndice('ENTRADAS_PRIM')) then
    CriaIndice('ENTRADAS','ENTRADAS_PRIM','EN_FORN,EN_NDOC,EN_TIPZ,EN_LOJA');
  if (not ExisteIndice('ENTRADAS_SEC1')) then
    CriaIndice('ENTRADAS','ENTRADAS_SEC1','EN_FORN,EN_LOJA,EN_DTEM,EN_DTEN,EN_TIPZ,EN_LOJA');
  if (not ExisteIndice('ITENS_ENTRADAS_PRIM')) then
    CriaIndice('ITENS_ENTRADAS','ITENS_ENTRADAS_PRIM','IE_FORN,IE_NDOC,IE_TIPZ,IE_LOJA');
  if (not ExisteIndice('ITENS_ENTRADAS_SEC1')) then
    CriaIndice('ITENS_ENTRADAS','ITENS_ENTRADAS_SEC1','IE_FORN,IE_NDOC,IE_TIPZ,IE_LOJA,IE_GRUP,IE_SUBG,IE_PROD,IE_ORDE,IE_TAMA');
  if (not ExisteIndice('ITENS_ENTRADAS_SEC2')) then
    CriaIndice('ITENS_ENTRADAS','ITENS_ENTRADAS_SEC1','IE_GRUP,IE_SUBG,IE_PROD,IE_CORE,IE_TAMA');
  if (not ExisteIndice('CORES_ENTRADAS_PRIM')) then
    CriaIndice('CORES_ENTRADAS','CORES_ENTRADAS_PRIM','CE_FORN,CE_NDOC,CE_TIPZ,CE_LOJA,CE_ORDE,CE_GRUP,CE_SUBG,CE_PROD');

    {.......................................................................................}
  if (not ExisteIndice('TRANSFERENCIAS_PRIM')) then
    CriaIndice('TRANSFERENCIAS','TRANSFERENCIAS_PRIM','TR_NUME');
  if (not ExisteIndice('TRANSFERENCIAS_SEC1')) then
    CriaIndice('TRANSFERENCIAS','TRANSFERENCIAS_SEC1','TR_DATA');
  if (not ExisteIndice('ITENS_TRANSFERENCIAS_PRIM')) then
    CriaIndice('ITENS_TRANSFERENCIAS','ITENS_TRANSFERENCIAS_PRIM','IT_TRAN');

    {.......................................................................................}
  if (not ExisteIndice('ITENS_TABELAS_PRECOS_PRIM')) then
    CriaIndice('ITENS_TABELAS_PRECOS','ITENS_TABELAS_PRECOS_PRIM','IP_LOJA,IP_TABE');
  if (not ExisteIndice('ITENS_TABELAS_PRECOS_SEC1')) then
    CriaIndice('ITENS_TABELAS_PRECOS','ITENS_TABELAS_PRECOS_SEC1','IP_GRUP,IP_SUBG,IP_PROD,IP_CORE,IP_TAMA');
  if (not ExisteIndice('PRECOS_PROMOCIONAIS_PRIM')) then
    CriaIndice('PRECOS_PROMOCIONAIS','PRECOS_PROMOCIONAIS_PRIM','PP_GRUP,PP_SUBG,PP_PROD,PP_CORE,PP_TAMA');
  if (not ExisteIndice('PRECOS_PROMOCIONAIS_SEC1')) then
    CriaIndice('PRECOS_PROMOCIONAIS','PRECOS_PROMOCIONAIS_SEC1','PP_DAT1,PP_DAT2');
  if (not ExisteIndice('PESQUISA_PRECOS_PRIM')) then
    CriaIndice('PESQUISA_PRECOS','PESQUISA_PRECOS_PRIM','PS_GRUP,PS_SUBG,PS_PROD,PS_CORE,PS_TAMA');

    {.......................................................................................}
  if (not ExisteIndice('VENDAS_PRIM')) then
    CriaIndice('VENDAS','VENDAS_PRIM','VE_LOJA,VE_CAIX,VE_CODI');
  if (not ExisteIndice('VENDAS_SEC1')) then
    CriaIndice('VENDAS','VENDAS_SEC1','VE_DATA,VE_LOJA,VE_CAIX,VE_CODI,VE_STAT,VE_TIPZ');

  if (not ExisteIndice('ITENS_VENDAS_PRIM')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_PRIM','IV_LOJA,IV_CAIX,IV_VEND,IV_GRUP,IV_SUBG,IV_PROD,IV_CORE,IV_TAMA,IV_QTDR,IV_TOTA,IV_MODO');
  if (not ExisteIndice('ITENS_VENDAS_SEC1')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_SEC1','IV_DATA');
  if (not ExisteIndice('ITENS_VENDAS_SEC2')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_SEC2','IV_VEDE');

  if (not ExisteIndice('VENDAS_FORMA_PAGAMENTO_PRIM')) then
    CriaIndice('VENDAS_FORMA_PAGAMENTO','VENDAS_FORMA_PAGAMENTO_PRIM','VF_LOJA,VF_CAIX,VF_VEND');
  if (not ExisteIndice('VENDAS_FORMA_PAGAMENTO_SEC1')) then
    CriaIndice('VENDAS_FORMA_PAGAMENTO','VENDAS_FORMA_PAGAMENTO_SEC1','VF_FPGT');

  if (not ExisteIndice('VENDAS_ATENDIMENTO_PRIM')) then
    CriaIndice('VENDAS_ATENDIMENTO','VENDAS_ATENDIMENTO_PRIM','VA_LOJA,VA_CAIX,VA_VEND');
  if (not ExisteIndice('VENDAS_ATENDIMENTO_SEC1')) then
    CriaIndice('VENDAS_ATENDIMENTO','VENDAS_ATENDIMENTO_SEC1','VA_VEDE');

  if (not ExisteIndice('CARTOES_PRIM')) then
    CriaIndice('CARTOES','CARTOES_PRIM','CA_CAIX,CA_LOJA,CA_VEND');

  if (not ExisteIndice('CREDIARIOS_PRIM')) then
    CriaIndice('CREDIARIOS','CREDIARIOS_PRIM','CR_CAIX,CR_LOJA,CR_VEND');

  if (not ExisteIndice('CHEQUES_PRIM')) then
    CriaIndice('CHEQUES','CHEQUES_PRIM','CH_CAIX,CH_LOJA,CH_VEND');

  if (not ExisteIndice('CARTOES_PARCELAS_PRIM')) then
    CriaIndice('CARTOES_PARCELAS_PRIM','CARTOES_PARCELAS','PC_LOJA,PC_CAIX,PC_VEND');

  if (not ExisteIndice('CARTOES_PARCELAS_LOCAL_PRIM')) then
    CriaIndice('CARTOES_PARCELAS_LOCAL_PRIM','CARTOES_PARCELAS_LOCAL','PC_LOJA,PC_CAIX,PC_VEND');

  if (not ExisteIndice('ATDO_PRIM')) then
    CriaIndice('ATENDIMENTOS','ATDO_PRIM','AT_LOJA,AT_CAIX,AT_CODI');
  if (not ExisteIndice('ATDO_SEC1')) then
    CriaIndice('ATENDIMENTOS','ATDO_SEC1','AT_DATA');

  if (not ExisteIndice('ITENS_ATDO_PRIM')) then
    CriaIndice('ITENS_ATENDIMENTOS','ITENS_ATDO_PRIM','IA_LOJA,IA_CAIX,IA_VEND');
  if (not ExisteIndice('ITENS_ATDO_SEC1')) then
    CriaIndice('ITENS_ATENDIMENTOS','ITENS_ATDO_SEC1','IA_GRUP');
  if (not ExisteIndice('ITENS_ATDO_SEC2')) then
    CriaIndice('ITENS_ATENDIMENTOS','ITENS_ATDO_SEC2','IA_SUBG');
       
  if (not ExisteIndice('VENDAS_TROCADAS_PRIM')) then
    CriaIndice('VENDAS_TROCADAS','VENDAS_TROCADAS_PRIM','LOJA,TERMINAL,VENDA');

    {.......................................................................................}
  if (not ExisteIndice('PRODUTOS_EXC_PRIM')) then
    CriaIndice('PRODUTOS_EXC','PRODUTOS_EXC_PRIM','PR_TIME');
  if (not ExisteIndice('ESTOQUE_EXC_PRIM')) then
    CriaIndice('ESTOQUE_EXC','ESTOQUE_EXC_PRIM','ES_TIME');
  if (not ExisteIndice('ESTOQUE_LOJA_EXC_PRIM')) then
    CriaIndice('ESTOQUE_LOJA_EXC','ESTOQUE_LOJA_EXC_PRIM','EL_TIME');
  if (not ExisteIndice('PRODUTOS_FAIXAS_EXC_PRIM')) then
    CriaIndice('PRODUTOS_FAIXAS','PRODUTOS_FAIXAS_EXC_PRIM','PF_TIME');
  if (not ExisteIndice('PRODUTOS_MATERIAIS_EXC_PRIM')) then
    CriaIndice('PRODUTOS_MATERIAIS','PRODUTOS_MATERIAIS_EXC_PRIM','PM_TIME');

    {.......................................................................................}
  if (not ExisteIndice('TRANSF_LOJA_PRIM')) then
    CriaIndice('TRANSF_LOJA','TRANSF_LOJA_PRIM','TR_LOJ1,TR_NUME');
  if (not ExisteIndice('ITENS_TRANSF_LOJA_PRIM')) then
    CriaIndice('ITENS_TRANSF_LOJA','ITENS_TRANSF_LOJA_PRIM','IT_LOJ1,IT_TRAN');
  if (not ExisteIndice('ITENS_TRANSF_LOJA_SEC1')) then
    CriaIndice('ITENS_TRANSF_LOJA','ITENS_TRANSF_LOJA_SEC1','IT_DIGI');
  if (not ExisteIndice('ITENS_TRANSF_LOJA_SEC2')) then
    CriaIndice('ITENS_TRANSF_LOJA','ITENS_TRANSF_LOJA_SEC2','IT_EMBA');
  if (not ExisteIndice('ITENS_TRANSF_LOJA_SEC3')) then
    CriaIndice('ITENS_TRANSF_LOJA','ITENS_TRANSF_LOJA_SEC3','IT_CHEG');

    {.......................................................................................}
  if (not ExisteIndice('LOTE_INVENT_PRIM')) then
    CriaIndice('LOTE_INVENTARIO','LOTE_INVENT_PRIM','LOJA');
  if (not ExisteIndice('LOTE_INVENT_SEC1')) then
    CriaIndice('LOTE_INVENTARIO','LOTE_INVENT_SEC1','CBARRA');
  if (not ExisteIndice('INVENTARIO_PRIM')) then
    CriaIndice('INVENTARIO','INVENTARIO_PRIM','IR_LOJA');
  if (not ExisteIndice('INVENTARIO_SEC1')) then
    CriaIndice('INVENTARIO','INVENTARIO_SEC1','IR_GRUP,IR_SUBG,IR_PROD,IR_CORE,IR_TAMA');
  if (not ExisteIndice('ARQ_IMPORT_INVENTARIO_PRIM')) then
    CriaIndice('ARQ_IMPORT_INVENTARIO','ARQ_IMPORT_INVENTARIO_PRIM','ARQUIVO');

    {.......................................................................................}
  if (not ExisteIndice('VENDEDORES_COMISSAO_PRIM')) then
    CriaIndice('VENDEDORES_COMISSAO','VENDEDORES_COMISSAO_PRIM','LOJA,VENDEDOR');
end;

function ExisteIndice(nome_indice: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  if (Trim(nome_indice)<>'') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM INDICES                        ');
    clAux.AddParam ('WHERE (NOME='+chr(39)+nome_indice+chr(39)+') ');
    if (clAux.Execute) then
      ExisteIndice:=true
    else
      ExisteIndice:=false;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure CriaIndice(arquivo,nome,campos: String);
var
  clAux: TClassAuxiliar;
begin
  if (Trim(arquivo)<>'') and (Trim(nome)<>'') and (Trim(campos)<>'') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO INDICES(ARQUIVO,NOME,CAMPOS)  ');
    clAux.AddParam ('VALUES (:arquivo,:nome,:campos)           ');
    clAux.consulta.parambyname('arquivo').AsString := arquivo;
    clAux.consulta.parambyname('nome').AsString    := nome;
    clAux.consulta.parambyname('campos').AsString  := campos;
    clAux.Execute;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure VerificaExistenciaRegistroPRODUTOSFAIXAS(grupo,subgrupo,produto: Real; tamanho: String);
var
  clAux,clAux2: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect    ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam  ('SELECT * FROM PRODUTOS_FAIXAS                  ');
  clAux.AddParam  ('WHERE (PF_GRUP='+floattostr(grupo)+') AND      ');
  clAux.AddParam  ('      (PF_SUBG='+floattostr(subgrupo)+') AND   ');
  clAux.AddParam  ('      (PF_PROD='+floattostr(produto)+') AND    ');
  clAux.AddParam  ('      (PF_TAMA='+chr(39)+tamanho+chr(39)+')    ');
  if (not clAux.Execute) then
  begin
    clAux2 := TClassAuxiliar.Create;
    clAux2.Conect   ('ESTOQUE',frm_principal);
    clAux2.ClearSql;
    clAux2.AddParam ('SELECT TF_SEQ,TF_ORDE                           ');
    clAux2.AddParam ('FROM TAMANHOS_FAIXAS,PRODUTOS                   ');
    clAux2.AddParam ('WHERE (PR_GRUP='+floattostr(grupo)+') AND       ');
    clAux2.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND    ');
    clAux2.AddParam ('      (PR_CODI='+floattostr(produto)+') AND     ');
    clAux2.AddParam ('      (TF_TAMA='+chr(39)+tamanho+chr(39)+') AND ');
    clAux2.AddParam ('      (TF_CODI=PR_TTAM)                         ');
    clAux2.Execute;
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO PRODUTOS_FAIXAS(PF_GRUP,PF_SUBG,PF_PROD,PF_TAMA,PF_SEQ,PF_ORDE,PF_TIME)   ');
    clAux.AddParam ('VALUES (:PF_GRUP,:PF_SUBG,:PF_PROD,:PF_TAMA,:PF_SEQ,:PF_ORDE,:PF_TIME) ');
    clAux.consulta.parambyname('PF_GRUP').AsFloat  := grupo;
    clAux.consulta.parambyname('PF_SUBG').AsFloat  := subgrupo;
    clAux.consulta.parambyname('PF_PROD').AsFloat  := produto;
    clAux.consulta.parambyname('PF_TAMA').AsString := tamanho;
    clAux.consulta.parambyname('PF_SEQ').AsFloat   := clAux2.Result('TF_SEQ');
    clAux.consulta.parambyname('PF_ORDE').AsFloat  := clAux2.Result('TF_ORDE');
    clAux.consulta.parambyname('PF_TIME').AsDateTime := frm_principal.x_data_trabalho;
    clAux.Execute;
    clAux2.desconect;
    clAux2.Free;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaUltimaVenda_Estoque(grupo,subgrupo,produto,cor: Real;
  faixa: String; datavenda: TDateTime; tipz: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect  ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam('UPDATE ESTOQUE                                  ');
  if (tipz='1') then
    clAux.AddParam('SET ES_ULC1=:datavenda       ')
  else
  if (tipz='2') then
    clAux.AddParam('SET ES_ULC2=:datavenda  ');
  clAux.AddParam('     ,ES_TIME=:data                             ');
  clAux.AddParam('WHERE (ES_GRUP='+floattostr(grupo)+') AND       ');
  clAux.AddParam('      (ES_SUBG='+floattostr(subgrupo)+') AND    ');
  clAux.AddParam('      (ES_PROD='+floattostr(produto)+') AND     ');
  clAux.AddParam('      (ES_CORE='+floattostr(cor)+') AND         ');
  clAux.AddParam('      (ES_TAMA='+chr(39)+faixa+chr(39)+')       ');
  clAux.consulta.parambyname('datavenda').AsDateTime := datavenda;
  clAux.consulta.parambyname('data').AsDateTime := frm_principal.x_data_trabalho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaUltimaVenda_Estoque_Loja(grupo,subgrupo,produto,cor: Real;
  faixa: String; loja: Real; datavenda: TDateTime; tipz: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect  ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam('UPDATE ESTOQUE_LOJA                             ');
  if (tipz='1') then
    clAux.AddParam('SET EL_ULC1=:datavenda       ')
  else
  if (tipz='2') then
    clAux.AddParam('SET EL_ULC2=:datavenda  ');
  clAux.AddParam('     ,EL_TIME=:data                             ');
  clAux.AddParam('WHERE (EL_GRUP='+floattostr(grupo)+') AND       ');
  clAux.AddParam('      (EL_SUBG='+floattostr(subgrupo)+') AND    ');
  clAux.AddParam('      (EL_PROD='+floattostr(produto)+') AND     ');
  clAux.AddParam('      (EL_CORE='+floattostr(cor)+') AND         ');
  clAux.AddParam('      (EL_TAMA='+chr(39)+faixa+chr(39)+') AND   ');
  clAux.AddParam('      (EL_LOJA='+floattostr(loja)+')            ');
  clAux.consulta.parambyname('datavenda').AsDateTime := datavenda;
  clAux.consulta.parambyname('data').AsDateTime:=frm_principal.x_data_trabalho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

function RetornaCodigoDeBarrasDoItem(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_CBAR FROM ESTOQUE                   ');
  clAux.AddParam ('WHERE (ES_GRUP='+floattostr(grupo)+') AND     ');
  clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND  ');
  clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND   ');
  clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND       ');
  clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')   ');
  if (clAux.Execute) then
    result:=clAux.result('ES_CBAR')
  else
    result:='-1';
  clAux.desconect;
  clAux.Free;
end;

function RetornaCodigoDeBarrasDoItemPelaReferencia(referencia: String; cor: Real; tamanho: String):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_CBAR FROM ESTOQUE,PRODUTOS                      ');
  clAux.AddParam ('WHERE (PR_REFI='+chr(39)+referencia+chr(39)+') AND        ');
  clAux.AddParam ('      (ES_GRUP=PR_GRUP) AND                               ');
  clAux.AddParam ('      (ES_SUBG=PR_SUBG) AND                               ');
  clAux.AddParam ('      (ES_PROD=PR_CODI) AND                               ');
  clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND                   ');
  clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')               ');
  if (clAux.Execute) then
    result:=clAux.result('ES_CBAR')
  else
    result:='-1';
  clAux.desconect;
  clAux.Free;
end;

procedure ChecaExistenciaArquivo_TEMP_TABELAS_PRECOS;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\ESTOQUE\TEMP_TABELAS_PRECOS.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('IP_GRUP');
    TamanhoCampos.Add ('2');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_SUBG');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_PROD');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('N0');
    NomeCampos.Add    ('IP_LOJA');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_CORE');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_TAMA');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('IP_OTAM');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_PRE1');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('IP_PRE2');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('IP_PAT1');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('IP_PAT2');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('PR_FORN');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('PR_REFI');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('C');
    CriaTabela('C:\NATIVA\ESTOQUE','TEMP_TABELAS_PRECOS.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,13);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

procedure ChecaExistenciaArquivo_TEMP_TABELAS_PRECOS_CUSTOS;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\ESTOQUE\TEMP_PRECOS_CUSTOS.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('IP_GRUP');
    TamanhoCampos.Add ('2');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_SUBG');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_PROD');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('N0');
    NomeCampos.Add    ('IP_LOJA');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_CORE');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_TAMA');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('IP_OTAM');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_PCU1');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('IP_PCU2');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('PR_FORN');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('PR_REFI');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('C');
    CriaTabela('C:\NATIVA\ESTOQUE','TEMP_PRECOS_CUSTOS.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,11);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

{Informa a aliquota de ICMS ***}
function InformaAliqICMS(estado: String;fisento:Boolean=false):Real;
var
  aliq,valor_icms: Real;
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT AP_ICMS,AP_ESTA,AP_ISENTOE               ');
  clAux.AddParam ('FROM   ALIQUOTAS_PRODUTOS                       ');
  clAux.AddParam ('WHERE (AP_ESTA='+chr(39)+estado+chr(39)+') AND  ');
  clAux.AddParam ('      (AP_GRUP=0) AND                           ');
  clAux.AddParam ('      (AP_SUBG=0) AND                           ');
  clAux.AddParam ('      (AP_PROD=0)                               ');
  if (clAux.Execute) and (ClAux.Result('AP_ISENTOE') <> 'SIM') then
    result := clAux.result('AP_ICMS')
  else
    result := 0.00;
  clAux.desconect;
  clAux.Free;
end;

procedure CriaRegistroEstoqueExc(grupo,subgrupo,produto,cor: Real; tam: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO ESTOQUE_EXC(ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,ES_TIME) ');
  clAux.AddParam ('VALUES (:grupo,:subgrupo,:produto,:cor,:tamanho,:time) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('cor').AsFloat      := cor;
  clAux.consulta.parambyname('tamanho').AsString := tam;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure CriaRegistroEstoqueLojaExc(grupo,subgrupo,produto,loja,cor: Real; tam: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO ESTOQUE_LOJA_EXC(EL_GRUP,EL_SUBG,EL_PROD,EL_LOJA,EL_CORE,EL_TAMA,EL_TIME) ');
  clAux.AddParam ('VALUES (:grupo,:subgrupo,:produto,:loja,:cor,:tamanho,:time) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('loja').AsFloat     := loja;
  clAux.consulta.parambyname('cor').AsFloat      := cor;
  clAux.consulta.parambyname('tamanho').AsString := tam;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure CriaRegistroProdutosFaixasExc(grupo,subgrupo,produto: Real; tam: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO PRODUTOS_FAIXAS_EXC(PF_GRUP,PF_SUBG,PF_PROD,PF_TAMA,PF_TIME) ');
  clAux.AddParam ('VALUES (:grupo,:subgrupo,:produto,:tamanho,:time) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('tamanho').AsString := tam;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure CriaRegistroProdutosMateriaisExc(grupo,subgrupo,produto,material: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO PRODUTOS_MATERIAIS_EXC(PM_GRUP,PM_SUBG,PM_PROD,PM_MATE,PM_TIME) ');
  clAux.AddParam ('VALUES (:grupo,:subgrupo,:produto,:material,:time) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('material').AsFloat := material;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaTIMEElementosDoProduto(grupo,subgrupo,produto: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE ESTOQUE        ');
  clAux.AddParam ('SET    ES_TIME=:time  ');
  clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND (ES_SUBG=:subgrupo) AND (ES_PROD=:produto) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.ClearSql;
  clAux.AddParam ('UPDATE ESTOQUE_LOJA   ');
  clAux.AddParam ('SET    EL_TIME=:time  ');
  clAux.AddParam ('WHERE (EL_GRUP=:grupo) AND (EL_SUBG=:subgrupo) AND (EL_PROD=:produto) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.ClearSql;
  clAux.AddParam ('UPDATE PRODUTOS_FAIXAS ');
  clAux.AddParam ('SET    PF_TIME=:time   ');
  clAux.AddParam ('WHERE (PF_GRUP=:grupo) AND (PF_SUBG=:subgrupo) AND (PF_PROD=:produto) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.ClearSql;
  clAux.AddParam ('UPDATE PRODUTOS_MATERIAIS ');
  clAux.AddParam ('SET    PM_TIME=:time      ');
  clAux.AddParam ('WHERE (PM_GRUP=:grupo) AND (PM_SUBG=:subgrupo) AND (PM_PROD=:produto) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.ClearSql;
  clAux.AddParam ('UPDATE ITENS_TABELAS_PRECOS ');
  clAux.AddParam ('SET    IP_TIME=:time        ');
  clAux.AddParam ('WHERE (IP_GRUP=:grupo) AND (IP_SUBG=:subgrupo) AND (IP_PROD=:produto) AND (IP_TABE=1) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaTIMEEstoque(grupo,subgrupo,produto,cor: Real; tam: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE ESTOQUE                                                             ');
  clAux.AddParam ('SET    ES_TIME=:time                                                       ');
  clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND (ES_SUBG=:subgrupo) AND (ES_PROD=:produto) AND  ');
  clAux.AddParam ('      (ES_CORE=:cor) AND (ES_TAMA=:tamanho)                                ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('cor').AsFloat      := cor;
  clAux.consulta.parambyname('tamanho').AsString := tam;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaTIMEEstoqueLoja(loja,grupo,subgrupo,produto,cor: Real; tam: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE ESTOQUE_LOJA                                                        ');
  clAux.AddParam ('SET    EL_TIME=:time                                                       ');
  clAux.AddParam ('WHERE (EL_GRUP=:grupo) AND (EL_SUBG=:subgrupo) AND (EL_PROD=:produto) AND  ');
  clAux.AddParam ('      (EL_CORE=:cor) AND (EL_TAMA=:tamanho) AND                            ');
  clAux.AddParam ('      (EL_LOJA=:loja)                                                      ');
  clAux.consulta.parambyname('loja').AsFloat    := loja;
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('cor').AsFloat      := cor;
  clAux.consulta.parambyname('tamanho').AsString := tam;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaTIMEProduto(grupo,subgrupo,produto: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE PRODUTOS                                                            ');
  clAux.AddParam ('SET    PR_TIME=:time                                                       ');
  clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND (PR_SUBG=:subgrupo) AND (PR_CODI=:produto)      ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.Execute;
     {...................................................}
  clAux.desconect;
  clAux.Free;
end;

function RetornaLojaMestreDosPrecos:Real;
var
  clConf: TClassAuxiliar;
begin
  clConf := TClassAuxiliar.Create;
  clConf.conect   ('ESTOQUE',frm_principal);
  clConf.ClearSql;
  clConf.AddParam ('SELECT LOJA_MESTRE_PRECOS FROM CONF ');
  clConf.Execute;
  result := clConf.result('LOJA_MESTRE_PRECOS');
  clConf.desconect;
  clConf.Free;
end;

function ItemTemPrecoDiferencial(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select 1                                                 ');
  clAux.AddParam ('From   ITENS_TABELAS_PRECOS                              ');
  clAux.AddParam ('Where (IP_LOJA='+floattostr(loja)+') AND                 ');
  clAux.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND                ');
  clAux.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND             ');
  clAux.AddParam ('      (IP_PROD='+floattostr(produto)+') AND              ');
  clAux.AddParam ('      (IP_CORE='+floattostr(cor)+') AND                  ');
  clAux.AddParam ('      (IP_TAMA='+chr(39)+tamanho+chr(39)+') AND          ');
  clAux.AddParam ('      (IP_TABE=1)                                        ');
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function ProdutoTemPrecoDiferencial(loja,grupo,subgrupo,produto: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select 1                                                 ');
  clAux.AddParam ('From   ITENS_TABELAS_PRECOS                              ');
  clAux.AddParam ('Where (IP_LOJA='+floattostr(loja)+') AND                 ');
  clAux.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND                ');
  clAux.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND             ');
  clAux.AddParam ('      (IP_PROD='+floattostr(produto)+') AND              ');
  clAux.AddParam ('      (IP_TABE=1)                                        ');
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function ItemTemPrecoPromocional(loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select 1                                                                              ');
  clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                            ');
  clAux.AddParam ('Where (PP_LOJA='+floattostr(loja)+') AND                                              ');
  clAux.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                             ');
  clAux.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                                          ');
  clAux.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                                           ');
  clAux.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                               ');
  clAux.AddParam ('      (PP_TAMA='+chr(39)+tamanho+chr(39)+') AND                                       ');
  clAux.AddParam ('      (PP_DAT1<='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+') AND   '); {*}
  clAux.AddParam ('      (PP_DAT2>='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+')       '); {*}
  clAux.AddParam ('Order by PP_DAT2                                                                      ');
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function InformaUltimoPrecoAquisicao(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select  ES_UPA1 From ESTOQUE                     ');
    clAux.AddParam ('Where  (ES_GRUP='+floattostr(grupo)+') AND       ');
    clAux.AddParam ('       (ES_PROD='+floattostr(produto)+') AND     ');
    clAux.AddParam ('       (ES_SUBG='+floattostr(subgrupo)+') AND    ');
    clAux.AddParam ('       (ES_CORE='+floattostr(cor)+') AND         ');
    clAux.AddParam ('       (ES_TAMA='+chr(39)+tamanho+chr(39)+')     ');
    if (clAux.Execute) then
      result:=clAux.Result('ES_UPA'+tipz)
    else
      result:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Esta funcao informa o ultimo preco de custo, no cadastro ESTOQUE detalhado ***}
function InformaUltimoPrecoCusto(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) and
    (cor<>-1) and (tamanho<>'-1') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select ES_UPC1,ES_UPC2                                ');
    clAux.AddParam ('From   ESTOQUE                                        ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+')    AND          ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+')  AND          ');
    clAux.AddParam ('      (ES_CORE='+floattostr(cor)+')      AND          ');
    clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')           ');
    if (clAux.Execute) then
    begin
      if (tipz='1') or (tipz='2') then
        InformaUltimoPrecoCusto:=clAux.result('ES_UPC'+tipz)
      else
      if (tipz='3') then
        InformaUltimoPrecoCusto:=clAux.result('ES_UPC1');
    end
    else
      InformaUltimoPrecoCusto:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure ChecaExistenciaArquivo_TEMP_TABELAS_PRECOS_AQUISICAO;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\ESTOQUE\TEMP_PRECOS_AQUISICAO.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('IP_GRUP');
    TamanhoCampos.Add ('2');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_SUBG');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_PROD');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('N0');
    NomeCampos.Add    ('IP_LOJA');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_CORE');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_TAMA');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('IP_OTAM');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_UPA1');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('IP_UPA2');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('PR_FORN');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('PR_REFI');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('C');
    CriaTabela('C:\NATIVA\ESTOQUE','TEMP_PRECOS_AQUISICAO.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,11);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

function CalculaMargem(totalcusto,totalvenda: Real):Real;
var
  margem,dif: Real;
begin
  if (totalcusto<>0) then
  begin
    if (totalvenda>=totalcusto) then
    begin
      dif:=totalvenda - totalcusto;
      margem:=((dif/totalcusto)*100);
    end
    else
      margem:=0.00;
  end
  else
    margem:=0.00;
  result:=margem;
end;

function DevolvePercentualComissaoConfigurado (loja,vend: Real; data: TDateTime; tipo: String; valor: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PERCAVISTA,PERCAPRAZO FROM VENDEDORES_COMISSAO         ');
  clAux.AddParam ('WHERE (LOJA=:loja) AND (VENDEDOR=:vend) AND (DATA=:data) AND  ');
  clAux.AddParam ('      (INTERVALO1<=:valor) AND (INTERVALO2>=:valor)           ');
  clAux.consulta.parambyname('loja').AsFloat    := loja;
  clAux.consulta.parambyname('vend').AsFloat    := vend;
  clAux.consulta.parambyname('data').AsDateTime := data;
  clAux.consulta.parambyname('valor').AsFloat   := valor;
  if (clAux.Execute) then
  begin
    if (tipo='A VISTA') then
      result := clAux.result('PERCAVISTA')
    else
    if (tipo='A PRAZO') then
      result := clAux.result('PERCAPRAZO');
  end
  else
  if (tipo='A VISTA') then
    DevolvePercComisVend(loja,vend,'AV')
  else
  if (tipo='A PRAZO') then
    DevolvePercComisVend(loja,vend,'AP');
  clAux.desconect;
  clAux.Free;
end;

function SugerirParteDoCodigoDeBarrasEAN13(grupo,subgrupo,produto: Real):String;
var
  clAux: TClassAuxiliar;
  codigo_fornecedor: Real;
begin
  result := '';

     //primeiro - BUSCAR PELO FORNECEDOR ********************************************************
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PR_FORN                                                        ');
  clAux.AddParam ('FROM   PRODUTOS                                                       ');
  clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND (PR_SUBG=:subgrupo) AND (PR_CODI=:produto) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  if (clAux.Execute) then
  begin
    codigo_fornecedor := clAux.result('PR_FORN'); {*}

          {...}
    clAux.conect   ('CONTASPAGAR',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT FO_CBAR                ');
    clAux.AddParam ('FROM   FORNECEDORES           ');
    clAux.AddParam ('WHERE (FO_CODI=:codigo_forn)  ');
    clAux.consulta.parambyname('codigo_forn').AsFloat := codigo_fornecedor; {*}
    if (clAux.Execute) then
      if (trim(clAux.result('FO_CBAR'))<>'') then
        result := trim(clAux.result('FO_CBAR'));
  end;
  clAux.desconect;
  clAux.Free;

     //segundo - PAIS BRASIL
  if (trim(result)='') then
    result := '789';
end;

function ExisteItemParaProduto(grupo,subgrupo,produto: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_GRUP FROM ESTOQUE                                            ');
  clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND (ES_SUBG=:subgrupo) AND (ES_PROD=:produto)  ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  result := clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure AdicionaObservacaoNoMovimento (codigo_movimento: Real; obs: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO MOVIMENTO_OBSERVACAO (MB_MOVI,MB_TEXT) ');
  clAux.AddParam ('VALUES (:MB_MOVI,:MB_TEXT) ');
  clAux.consulta.parambyname('MB_MOVI').AsFloat := codigo_movimento;
  clAux.consulta.parambyname('MB_TEXT').AsString := obs;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure AuditaOperacao(codigoocorrencia: Real; complemento: String);
var
  descricao_codigoocorrencia: String;
  clAux: TClassAuxiliar;
begin
  if (codigoocorrencia=1) then
    descricao_codigoocorrencia := 'ALT. DE PRECO DE VENDA PRINCIPAL'
  else
  if (codigoocorrencia=2) then
    descricao_codigoocorrencia := 'ALT. DO ULTIMO PRECO DE CUSTO'
  else
  if (codigoocorrencia=3) then
    descricao_codigoocorrencia := 'ALT. DO ULTIMO PRECO DE AQUISIC.'
  else
  if (codigoocorrencia=4) then
    descricao_codigoocorrencia := 'OUTRAS ENTRADAS'
  else
  if (codigoocorrencia=5) then
    descricao_codigoocorrencia := 'OUTRAS SAIDAS'
  else
  if (codigoocorrencia=6) then
    descricao_codigoocorrencia := 'ALT. DE PRECO DE VENDA DIFERENCIADO'
  else
  if (codigoocorrencia=7) then
    descricao_codigoocorrencia := 'EXC. DE REGISTRO DE MOVIMENTO'
  else
  if (codigoocorrencia=8) then
    descricao_codigoocorrencia := 'EXC. DE PRECO DE VENDA DIFERENCIADO'
  else
  if (codigoocorrencia=9) then
    descricao_codigoocorrencia := 'EXC. DE PRECO PROMOCIONAL'
  else
  if (codigoocorrencia=10) then
    descricao_codigoocorrencia := 'REAJUSTE DE PRECOS DE VENDA'
  else
  if (codigoocorrencia=11) then
    descricao_codigoocorrencia := 'ALT. AUTOM. DE PRECO DIFERENCIADO'
  else
    descricao_codigoocorrencia := '...OCORRENCIA NAO DEFINIDA';

     {...}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO AUDITORIA_SIMPLES                                                             ');
  clAux.AddParam (' (HORA,DATA,USUARIO,NOMEUSUARIO,CODIGOOCORRENCIA,DESCOCORRENCIA,COMPLEMENTO)              ');
  clAux.AddParam ('VALUES                                                                                    ');
  clAux.AddParam (' (:HORA,:DATA,:USUARIO,:NOMEUSUARIO,:CODIGOOCORRENCIA,:DESCOCORRENCIA,:COMPLEMENTO)       ');
  clAux.consulta.parambyname('HORA').AsInteger  := strtoint(FormatDateTime('hhnnss',time));
  clAux.consulta.parambyname('DATA').AsDateTime := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('USUARIO').AsFloat := frm_principal.x_codigousuario;
  if (frm_principal.x_codigousuario<>-1) then
    clAux.consulta.parambyname('NOMEUSUARIO').AsString := ProcuraNomeUsuario(frm_principal.x_codigousuario,frm_principal)
  else
    clAux.consulta.parambyname('NOMEUSUARIO').AsString := 'ADMINISTRADOR';
  clAux.consulta.parambyname('CODIGOOCORRENCIA').AsFloat  := codigoocorrencia;
  clAux.consulta.parambyname('DESCOCORRENCIA').AsString   := descricao_codigoocorrencia;
  clAux.consulta.parambyname('COMPLEMENTO').AsString      := complemento;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure ChecaExistenciaArquivo_TEMP_ENTRADAS_AVULSAS_LOTE;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\ESTOQUE\TEMP_ENTRADAS_AVULSAS_LOTE.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('IP_GRUP');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_SUBG');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_PROD');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('N0');
    NomeCampos.Add    ('IP_LOJA');
    TamanhoCampos.Add ('3');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_CORE');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_TAMA');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('IP_OTAM');
    TamanhoCampos.Add ('4');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_QTDE');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('IP_QTDA');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('IP_DATA');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('D');
    NomeCampos.Add    ('IP_PCUS');
    TamanhoCampos.Add ('13');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('IP_PVEN');
    TamanhoCampos.Add ('13');
    TipoCampos.Add    ('N3');
    NomeCampos.Add    ('IP_MODE');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('IP_TIPZ');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('PR_FORN');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('PR_REFI');
    TamanhoCampos.Add ('8');
    TipoCampos.Add    ('C');
    CriaTabela('C:\NATIVA\ESTOQUE','TEMP_ENTRADAS_AVULSAS_LOTE.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,16);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

function InformaSaldoDoProduto_PeriodosParaTras_1(data_limite: TDateTime;
  grupo,subgrupo,produto: Real; loja: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
  saldo_anterior: Real;
  saldo_atual: Real;
  saldo: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MO_TIPO,MO_MODE,MO_QTD1,        ');
  clAux.AddParam ('       MO_CORE,MO_TAMA,MO_DATA         ');
  clAux.AddParam ('FROM   MOVIMENTO                       ');
  clAux.AddParam ('WHERE (MO_GRUP=:grupo) AND             ');
  clAux.AddParam ('      (MO_SUBG=:subgrupo) AND          ');
  clAux.AddParam ('      (MO_PROD=:produto)  AND          ');
  clAux.AddParam ('      (MO_LOJA=:loja) AND              ');
  clAux.AddParam ('      (MO_DATA>=:data1)                ');
  if (tipz='1') or (tipz='2') then
    clAux.AddParam ('      AND (MO_TIPZ=:tipz)              ');
  clAux.consulta.parambyname('data1').AsDateTime  := data_limite;
  clAux.consulta.parambyname('grupo').AsFloat     := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat  := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat   := produto;
  clAux.consulta.parambyname('loja').AsFloat      := loja;
  if (tipz='1') or (tipz='2') then
    clAux.consulta.parambyname('tipz').AsString     := tipz;

  clAux.Execute; {*}
  clAux.first;
  saldo := 0;
  while (not clAux.eof) do
  begin
    if (clAux.result('MO_TIPO')='S') then
      saldo := saldo + clAux.result('MO_QTD1')
    else
    if (clAux.result('MO_TIPO')='E') then
      if (clAux.result('MO_MODE')='I') then //INVENTARIO
      begin
        saldo_anterior := RetornaSaldoAnteriorInventario_1(
          grupo,subgrupo,produto,
          clAux.Result('MO_CORE'),
          clAux.Result('MO_TAMA'),
          loja,
          clAux.result('MO_DATA'));
        saldo := saldo - (clAux.result('MO_QTD1') - saldo_anterior);
      end
      else
        saldo := saldo - clAux.result('MO_QTD1');
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;

      //....
  saldo_atual := InformaSaldoAtualProduto (loja,grupo,subgrupo,produto,tipz);
  result      := saldo_atual + saldo; {*}
end;

function InformaSaldoDoProduto_PeriodosParaTras_2(data_limite: TDateTime;
  refint: String; loja: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
  grupo,subgrupo,produto: Real;
  saldo_anterior: Real;
  saldo_atual: Real;
  saldo: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PR_GRUP,PR_SUBG,PR_CODI FROM PRODUTOS ');
  clAux.AddParam ('WHERE (PR_REFI=:refint)                      ');
  clAux.consulta.parambyname('refint').AsString := refint;
  if (clAux.Execute) then
  begin
    grupo    := clAux.result('PR_GRUP');
    subgrupo := clAux.result('PR_SUBG');
    produto  := clAux.result('PR_CODI');
  end
  else
  begin
    grupo    := 0;
    subgrupo := 0;
    produto  := 0;
  end;
  clAux.desconect;
  clAux.Free;

      {...}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MO_TIPO,MO_MODE,MO_QTD1,        ');
  clAux.AddParam ('       MO_CORE,MO_TAMA,MO_DATA         ');
  clAux.AddParam ('FROM   MOVIMENTO                       ');
  clAux.AddParam ('WHERE (MO_DATA>=:data1) AND            ');
  clAux.AddParam ('      (MO_GRUP=:grupo) AND             ');
  clAux.AddParam ('      (MO_SUBG=:subgrupo) AND          ');
  clAux.AddParam ('      (MO_PROD=:produto) AND           ');
  clAux.AddParam ('      (MO_LOJA=:loja)                  ');
  if (tipz='1') or (tipz='2') then
    clAux.AddParam ('      AND (MO_TIPZ=:tipz)              ');
  clAux.consulta.parambyname('data1').AsDateTime  := data_limite;
  clAux.consulta.parambyname('grupo').AsFloat     := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat  := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat   := produto;
  clAux.consulta.parambyname('loja').AsFloat      := loja;
  if (tipz='1') or (tipz='2') then
    clAux.consulta.parambyname('tipz').AsString     := tipz;

  clAux.Execute; {*}
  clAux.first;
  saldo := 0;
  while (not clAux.eof) do
  begin
    if (clAux.result('MO_TIPO')='S') then
      saldo := saldo + clAux.result('MO_QTD1')
    else
    if (clAux.result('MO_TIPO')='E') then
      if (clAux.result('MO_MODE')='I') then //INVENTARIO
      begin
        saldo_anterior := RetornaSaldoAnteriorInventario_1(
          grupo,subgrupo,produto,
          clAux.result('MO_CORE'),
          clAux.result('MO_TAMA'),
          loja,
          clAux.result('MO_DATA'));
        saldo := saldo - (clAux.result('MO_QTD1') - saldo_anterior);
      end
      else
        saldo := saldo - clAux.result('MO_QTD1');
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;

      //....
  saldo_atual := InformaSaldoAtualProduto (loja,grupo,subgrupo,produto,tipz);
  result      := saldo_atual + saldo; {*}
end;

function InformaSaldoDoItem_PeriodosParaTras_1(data_limite: TDateTime;
  grupo,subgrupo,produto,cor: Real; tam: String; loja: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
  saldo_anterior: Real;
  saldo_atual: Real;
  saldo: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MO_TIPO,MO_MODE,MO_QTD1,MO_DATA  ');
  clAux.AddParam ('FROM   MOVIMENTO                        ');
  clAux.AddParam ('WHERE (MO_DATA>=:data1) AND             ');
  clAux.AddParam ('      (MO_GRUP=:grupo) AND              ');
  clAux.AddParam ('      (MO_SUBG=:subgrupo) AND           ');
  clAux.AddParam ('      (MO_PROD=:produto) AND            ');
  clAux.AddParam ('      (MO_CORE=:cor) AND                ');
  clAux.AddParam ('      (MO_TAMA=:tam) AND                ');
  clAux.AddParam ('      (MO_LOJA=:loja)                   ');
  if (tipz='1') or (tipz='2') then
    clAux.AddParam ('   AND (MO_TIPZ=:tipz)                  ');
  clAux.consulta.parambyname('data1').AsDateTime  := data_limite;
  clAux.consulta.parambyname('grupo').AsFloat     := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat  := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat   := produto;
  clAux.consulta.parambyname('cor').AsFloat       := cor;
  clAux.consulta.parambyname('tam').AsString      := tam;
  clAux.consulta.parambyname('loja').AsFloat      := loja;
  if (tipz='1') or (tipz='2') then
    clAux.consulta.parambyname('tipz').AsString     := tipz;

  clAux.Execute; {*}
  clAux.first;
  saldo := 0;
  while (not clAux.eof) do
  begin
    if (clAux.result('MO_TIPO')='S') then
      saldo := saldo + clAux.result('MO_QTD1')
    else
    if (clAux.result('MO_TIPO')='E') then
      if (clAux.result('MO_MODE')='I') then //INVENTARIO
      begin
        saldo_anterior := RetornaSaldoAnteriorInventario_1(
          grupo,subgrupo,produto,cor,tam,
          loja,
          clAux.result('MO_DATA'));
        saldo := saldo - (clAux.result('MO_QTD1') - saldo_anterior);
      end
      else
        saldo := saldo - clAux.result('MO_QTD1');
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;

      //....
  saldo_atual := InformaSaldoAtual (loja,grupo,subgrupo,produto,cor,tam,tipz);
  result      := saldo_atual + saldo; {*}
end;

function  InformaSaldoDoItem_PeriodosParaTras_2(data_limite: TDateTime;
  codigo_barras: String; loja: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
  grupo,subgrupo,produto,cor: Real;
  saldo_anterior: Real;
  saldo_atual: Real;
  tam: String;
  saldo: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA FROM ESTOQUE  ');
  clAux.AddParam ('WHERE (ES_CBAR=:cbarras)                                     ');
  clAux.consulta.parambyname('cbarras').AsString := codigo_barras;
  if (clAux.Execute) then
  begin
    grupo    := clAux.result('ES_GRUP');
    subgrupo := clAux.result('ES_SUBG');
    produto  := clAux.result('ES_PROD');
    cor      := clAux.result('ES_CORE');
    tam      := clAux.result('ES_TAMA');
  end
  else
  begin
    grupo    := 0;
    subgrupo := 0;
    produto  := 0;
    cor      := 0;
    tam      := '0';
  end;
  clAux.desconect;
  clAux.Free;

      {...}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MO_TIPO,MO_MODE,MO_QTD1,MO_DATA  ');
  clAux.AddParam ('FROM   MOVIMENTO                        ');
  clAux.AddParam ('WHERE (MO_DATA>=:data1) AND             ');
  clAux.AddParam ('      (MO_GRUP=:grupo) AND              ');
  clAux.AddParam ('      (MO_SUBG=:subgrupo) AND           ');
  clAux.AddParam ('      (MO_PROD=:produto) AND            ');
  clAux.AddParam ('      (MO_CORE=:cor) AND                ');
  clAux.AddParam ('      (MO_TAMA=:tam) AND                ');
  clAux.AddParam ('      (MO_LOJA=:loja)                   ');
  if (tipz='1') or (tipz='2') then
    clAux.AddParam ('  AND (MO_TIPZ=:tipz)                   ');
  clAux.consulta.parambyname('data1').AsDateTime  := data_limite;
  clAux.consulta.parambyname('grupo').AsFloat     := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat  := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat   := produto;
  clAux.consulta.parambyname('cor').AsFloat       := cor;
  clAux.consulta.parambyname('tam').AsString      := tam;
  clAux.consulta.parambyname('loja').AsFloat      := loja;
  if (tipz='1') or (tipz='2') then
    clAux.consulta.parambyname('tipz').AsString     := tipz;

  clAux.Execute; {*}
  clAux.first;
  saldo := 0;
  while (not clAux.eof) do
  begin
    if (clAux.result('MO_TIPO')='S') then
      saldo := saldo + clAux.result('MO_QTD1')
    else
    if (clAux.result('MO_TIPO')='E') then
      if (clAux.result('MO_MODE')='I') then //INVENTARIO
      begin
        saldo_anterior := RetornaSaldoAnteriorInventario_1(
          grupo,subgrupo,produto,cor,tam,
          loja,
          clAux.result('MO_DATA'));
        saldo := saldo - (clAux.result('MO_QTD1') - saldo_anterior);
      end
      else
        saldo := saldo - clAux.result('MO_QTD1');
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;

      //....
  saldo_atual := InformaSaldoAtual (loja,grupo,subgrupo,produto,cor,tam,tipz);
  result      := saldo_atual + saldo; {*}
end;

function InformaSaldoDoItemPorCor_PeriodosParaTras_1(data_limite: TDateTime;
  grupo,subgrupo,produto,cor: Real; loja: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
  saldo_anterior: Real;
  saldo_atual: Real;
  saldo: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MO_TIPO,MO_MODE,MO_QTD1,         ');
  clAux.AddParam ('       MO_TAMA,MO_DATA                  ');
  clAux.AddParam ('FROM   MOVIMENTO                        ');
  clAux.AddParam ('WHERE (MO_DATA>=:data1) AND             ');
  clAux.AddParam ('      (MO_GRUP=:grupo) AND              ');
  clAux.AddParam ('      (MO_SUBG=:subgrupo) AND           ');
  clAux.AddParam ('      (MO_PROD=:produto) AND            ');
  clAux.AddParam ('      (MO_CORE=:cor) AND                ');
  clAux.AddParam ('      (MO_LOJA=:loja)                   ');
  if (tipz='1') or (tipz='2') then
    clAux.AddParam ('   AND (MO_TIPZ=:tipz)                  ');
  clAux.consulta.parambyname('data1').AsDateTime  := data_limite;
  clAux.consulta.parambyname('grupo').AsFloat     := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat  := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat   := produto;
  clAux.consulta.parambyname('cor').AsFloat       := cor;
  clAux.consulta.parambyname('loja').AsFloat      := loja;
  if (tipz='1') or (tipz='2') then
    clAux.consulta.parambyname('tipz').AsString     := tipz;

  clAux.Execute; {*}
  clAux.first;
  saldo := 0;
  while (not clAux.eof) do
  begin
    if (clAux.result('MO_TIPO')='S') then
      saldo := saldo + clAux.result('MO_QTD1')
    else
    if (clAux.result('MO_TIPO')='E') then
      if (clAux.result('MO_MODE')='I') then //INVENTARIO
      begin
        saldo_anterior := RetornaSaldoAnteriorInventario_1(
          grupo,subgrupo,produto,cor,
          clAux.result('MO_TAMA'),
          loja,
          clAux.result('MO_DATA'));
        saldo := saldo - (clAux.result('MO_QTD1') - saldo_anterior);
      end
      else
        saldo := saldo - clAux.result('MO_QTD1');
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;

      //....
  saldo_atual := InformaSaldoAtualPorCor (loja,grupo,subgrupo,produto,cor,tipz);
  result      := saldo_atual + saldo; {*}
end;

function VerificaSeExisteACorNoProdutoPedido(pedido,grupo,subgrupo,produto: Real; ordem: Integer):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CP_ORDE FROM CORES_PEDIDO_COMPRA     ');
  clAux.AddParam ('WHERE (CP_PEDI=:pedido) AND                 ');
  clAux.AddParam ('      (CP_GRUP=:grupo)  AND                 ');
  clAux.AddParam ('      (CP_SUBG=:subgrupo) AND               ');
  clAux.AddParam ('      (CP_PROD=:produto) AND                ');
  clAux.AddParam ('      (CP_ORDE=:ordem)                      ');
  clAux.consulta.parambyname('pedido').AsFloat     := pedido;
  clAux.consulta.parambyname('grupo').AsFloat      := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat   := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat    := produto;
  clAux.consulta.parambyname('ordem').AsInteger    := ordem;
  result := clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

function VerificaSeExisteACorNoProdutoEntrada(forn: Real; doc,tipz: String; loja: Real;
  grupo,subgrupo,produto: Real; ordem: Integer):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CE_ORDE FROM CORES_ENTRADAS  ');
  clAux.AddParam ('WHERE (CE_FORN=:forn) AND           ');
  clAux.AddParam ('      (CE_NDOC=:ndoc) AND           ');
  clAux.AddParam ('      (CE_TIPZ=:tipz) AND           ');
  clAux.AddParam ('      (CE_LOJA=:loja) AND           ');
  clAux.AddParam ('      (CE_ORDE=:ordem) AND          ');
  clAux.AddParam ('      (CE_GRUP=:grupo) AND          ');
  clAux.AddParam ('      (CE_SUBG=:subgrupo) AND       ');
  clAux.AddParam ('      (CE_PROD=:produto)            ');
  clAux.consulta.parambyname('forn').AsFloat       := forn;
  clAux.consulta.parambyname('ndoc').AsString      := doc;
  clAux.consulta.parambyname('tipz').AsString      := tipz;
  clAux.consulta.parambyname('loja').AsFloat       := loja;
  clAux.consulta.parambyname('grupo').AsFloat      := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat   := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat    := produto;
  clAux.consulta.parambyname('ordem').AsInteger    := ordem;
  result := clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

function RetornaMascaraCodigoBarras(considerapontos: Boolean):String;
var
  clAux: TClassAuxiliar;
  mascara: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM CONFIG_CODIGO_BARRAS');
  if (clAux.Execute) then
  begin
    clAux.first;
    mascara:='';
    while (not clAux.eof) do
    begin
      mascara:=mascara + form_nz(0,clAux.result('ESPACO'))+'\.';
      clAux.next;
    end;
    mascara:=Copy(mascara,1,Length(mascara)-2);
    if (frm_principal.x_adiciona_dv_codigo_barras) then
      mascara:=mascara+'\.0';
    if (considerapontos) then
      mascara:=mascara+';1;'
    else
      mascara:=mascara+';0;';
    result :=mascara;
  end
  else
    result:='';
  clAux.desconect;
  clAux.Free;
end;

function ExibeCodigoBarrasMascarado(codigobarras: String):String;
var
  clAux: TClassAuxiliar;
  novocodigobarras,porcao: String;
  tam,pos: Integer;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM CONFIG_CODIGO_BARRAS');
  if (clAux.Execute) then
  begin
    clAux.first;
    novocodigobarras:='';
    pos:=1;
    while (not clAux.eof) do
    begin
      tam:=Trunc(clAux.result('ESPACO'));
      porcao:=Copy(codigobarras,pos,tam)+'.';
      pos:=pos+clAux.result('ESPACO');
      novocodigobarras:=novocodigobarras+porcao;
      clAux.next;
    end;
    if (frm_principal.x_adiciona_dv_codigo_barras) then
    begin
      porcao:=Copy(codigobarras,pos,1)+'.';
      novocodigobarras:=novocodigobarras+porcao;
    end;
    novocodigobarras:=Copy(novocodigobarras,1,Length(novocodigobarras)-1);
    result :=novocodigobarras;
  end
  else
    result:='';
  clAux.desconect;
  clAux.Free;
end;

function RetiraMascaraCodigoBarras(codigobarras: String):String;
begin
  while (Pos('.',codigobarras)>0) do
    delete(codigobarras,Pos('.',codigobarras),1);
  result:= codigobarras;
end;

function RetornaSaldoAnteriorInventario_1(grupo,subgrupo,produto,cor: Real; tamanho: String;
  loja: Real; datainventario: TDateTime):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT IR_SALA FROM INVENTARIO  ');
  clAux.AddParam ('WHERE (IR_GRUP=:grupo) AND      ');
  clAux.AddParam ('      (IR_SUBG=:subgrupo) AND   ');
  clAux.AddParam ('      (IR_PROD=:produto) AND    ');
  clAux.AddParam ('      (IR_CORE=:cor) AND        ');
  clAux.AddParam ('      (IR_TAMA=:tamanho) AND    ');
  clAux.AddParam ('      (IR_LOJA=:loja) AND       ');
  clAux.AddParam ('      (IR_DATA=:datainventario) ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  clAux.consulta.parambyname('cor').AsFloat      := cor;
  clAux.consulta.parambyname('tamanho').AsString := tamanho;
  clAux.consulta.parambyname('loja').AsFloat     := loja;
  clAux.consulta.parambyname('datainventario').AsDateTime := datainventario;
  if (clAux.Execute) then
    result := clAux.result('IR_SALA')
  else
    result := 0;
  clAux.desconect;
  clAux.Free;
end;

function RetornaSaldoAnteriorInventario_2(codigobarras: String; loja: Real; datainventario: TDateTime):Real;
var
  clAux,clEst: TClassAuxiliar;
  grupo,subgrupo,produto,cor: Real;
  tamanho: String;
begin
  clEst := TClassAuxiliar.Create;
  clEst.conect   ('ESTOQUE',frm_principal);
  clEst.ClearSql;
  clEst.AddParam ('SELECT ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA FROM ESTOQUE ');
  clEst.AddParam ('WHERE (ES_CBAR=:codigobarras)                               ');
  clEst.consulta.parambyname('codigobarras').AsString := codigobarras;
  if (clEst.Execute) then
  begin
    grupo        := clEst.result('ES_GRUP');
    subgrupo     := clEst.result('ES_SUBG');
    produto      := clEst.result('ES_PROD');
    cor          := clEst.result('ES_CORE');
    tamanho      := clEst.result('ES_TAMA');

    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT IR_SALA FROM INVENTARIO  ');
    clAux.AddParam ('WHERE (IR_GRUP=:grupo) AND      ');
    clAux.AddParam ('      (IR_SUBG=:subgrupo) AND   ');
    clAux.AddParam ('      (IR_PROD=:produto) AND    ');
    clAux.AddParam ('      (IR_CORE=:cor) AND        ');
    clAux.AddParam ('      (IR_TAMA=:tamanho) AND    ');
    clAux.AddParam ('      (IR_LOJA=:loja) AND       ');
    clAux.AddParam ('      (IR_DATA=:datainventario) ');
    clAux.consulta.parambyname('grupo').AsFloat    := grupo;
    clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
    clAux.consulta.parambyname('produto').AsFloat  := produto;
    clAux.consulta.parambyname('cor').AsFloat      := cor;
    clAux.consulta.parambyname('tamanho').AsString := tamanho;
    clAux.consulta.parambyname('loja').AsFloat     := loja;
    clAux.consulta.parambyname('datainventario').AsDateTime := datainventario;
    if (clAux.Execute) then
      result := clAux.result('IR_SALA')
    else
      result := 0;
    clAux.desconect;
    clAux.Free;
  end
  else
    result := 0;
  clEst.desconect;
  clEst.Free;
end;

function BuscaDocumentoTransferencia(codigo_barras,tipo: String; loja: Real; data: TDateTime):String;
var
  clAux: TClassAuxiliar;
  linha: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT TR_NUME                                    '); //SO QUERO O DOCUMENTO
  clAux.AddParam ('FROM   TRANSF_LOJA,ITENS_TRANSF_LOJA,ESTOQUE      ');
  clAux.AddParam ('WHERE (TR_LOJ1=IT_LOJ1) AND                       '); //juncao 1
  clAux.AddParam ('      (TR_NUME=IT_TRAN) AND                       '); //juncao 1
  clAux.AddParam ('      (IT_GRUP=ES_GRUP) AND                       '); //juncao 2
  clAux.AddParam ('      (IT_SUBG=ES_SUBG) AND                       '); //juncao 2
  clAux.AddParam ('      (IT_PROD=ES_PROD) AND                       '); //juncao 2
  clAux.AddParam ('      (IT_CORE=ES_CORE) AND                       '); //juncao 2
  clAux.AddParam ('      (IT_TAMA=ES_TAMA) AND                       '); //juncao 2
  clAux.AddParam ('      (ES_CBAR=:cbarras) AND                      ');
  if (tipo='S') then
  begin
    clAux.AddParam ('  (TR_LOJ1=:loja) AND                        ');
    clAux.AddParam ('  (IT_EMBA=:data)                            ');
  end
  else
  if (tipo='E') then
  begin
    clAux.AddParam ('  (TR_LOJ2=:loja) AND                        ');
    clAux.AddParam ('  (IT_CHEG=:data)                            ');
  end;
  clAux.consulta.parambyname('cbarras').AsString   := codigo_barras;
  clAux.consulta.parambyname('loja').AsFloat       := loja;
  clAux.consulta.parambyname('data').AsDateTime    := data;
  clAux.Execute; {*}
  clAux.first;
  linha := '';
  while (not clAux.eof) do
  begin
    linha := linha + floattostr(clAux.result('TR_NUME'))+',';

          {--->}
    clAux.next;
  end;
  linha  := Copy(linha,1,length(linha)-1);
  if (trim(linha)='') then
    result := 'N/E'
  else
    result := linha;
  clAux.desconect;
  clAux.Free;
end;

function DevolvePrecoPrincipalMaisPresenteNoProduto(grupo,subgrupo,produto: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
     {************************************************************************}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_PVE'+tipz+',COUNT(*)                           ');
  clAux.AddParam ('FROM   ESTOQUE                                           ');
  clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND                               ');
  clAux.AddParam ('      (ES_SUBG=:subgrupo) AND                            ');
  clAux.AddParam ('      (ES_PROD=:produto)                                 ');
  clAux.AddParam ('GROUP BY ES_PVE'+tipz);
  clAux.AddParam ('ORDER BY 2 DESC                                          ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.result('ES_PVE'+tipz);
  end
  else
    result := 0.00;
  clAux.desconect;
  clAux.Free;
     {************************************************************************}
end;

function DevolveUltimoPrecoCustoMaisPresenteNoProduto(grupo,subgrupo,produto: Real; tipz: String):Real;
var
  clAux: TClassAuxiliar;
begin
     {************************************************************************}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_UPC'+tipz+',COUNT(*)                           ');
  clAux.AddParam ('FROM   ESTOQUE                                           ');
  clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND                               ');
  clAux.AddParam ('      (ES_SUBG=:subgrupo) AND                            ');
  clAux.AddParam ('      (ES_PROD=:produto)                                 ');
  clAux.AddParam ('GROUP BY ES_UPC'+tipz);
  clAux.AddParam ('ORDER BY 2 DESC                                          ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  if (clAux.Execute) then
  begin
    clAux.first;
    result := clAux.result('ES_UPC'+tipz);
  end
  else
    result := 0.00;
  clAux.desconect;
  clAux.Free;
     {************************************************************************}
end;

{* Rotina muito usada em PEDIDOS,ENTRADAS,OUTRAS ENTRADAS,OUTRAS SAIDAS,TRANSFERENCIAS,etc...}
procedure VerificaExistenciaDoRegistroESTOQUEComPrecosSugeridos(grupo,subgrupo,produto,cor: Real; tamanho: String);
var
  clAux: TClassAuxiliar; 
  clEstoque: TClassItensEstoque;
  aquis1,aquis2,custo1,custo2,preco1,preco2: Real;
begin
  clEstoque := TClassItensEstoque.Create;
  clEstoque.conect   ('ESTOQUE',frm_principal);
  clEstoque.ClearSql;
  clEstoque.AddParam ('Select ES_CBAR From ESTOQUE                     ');
  clEstoque.AddParam ('Where  (ES_GRUP='+floattostr(grupo)+') AND      ');
  clEstoque.AddParam ('       (ES_SUBG='+floattostr(subgrupo)+') AND   ');
  clEstoque.AddParam ('       (ES_PROD='+floattostr(produto)+') AND    ');
  clEstoque.AddParam ('       (ES_CORE='+floattostr(cor)+') AND        ');
  clEstoque.AddParam ('       (ES_TAMA='+chr(39)+tamanho+chr(39)+')    ');
  clEstoque.ClearFields;
  clEstoque.inES_GRUP := grupo;
  clEstoque.inES_SUBG := subgrupo;
  clEstoque.inES_PROD := produto;
  clEstoque.inES_CORE := cor;
  clEstoque.inES_TAMA := tamanho;
  if (not clEstoque.Execute) then
  begin
          //REALIZANDO A SUGESTAO DE PRECOS PARA O NOVO 'ITEM'  
          {************************************************************************}
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT ES_PVE1,ES_PVE2,ES_UPC1,ES_UPC2,ES_UPA1,ES_UPA2,  ');
    clAux.AddParam ('       COUNT(*)                                          ');
    clAux.AddParam ('FROM   ESTOQUE                                           ');
    clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND                               ');
    clAux.AddParam ('      (ES_SUBG=:subgrupo) AND                            ');
    clAux.AddParam ('      (ES_PROD=:produto)                                 ');
    clAux.AddParam ('GROUP BY ES_PVE1,ES_PVE2,ES_UPC1,ES_UPC2,ES_UPA1,ES_UPA2 ');
    clAux.AddParam ('ORDER BY 7 DESC                                          ');
    clAux.consulta.parambyname('grupo').AsFloat    := grupo;
    clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
    clAux.consulta.parambyname('produto').AsFloat  := produto;
    if (clAux.Execute) then
    begin
      clAux.first;

      preco1 := clAux.result('ES_PVE1');
      preco2 := clAux.result('ES_PVE2');
      custo1 := clAux.result('ES_UPC1');
      custo2 := clAux.result('ES_UPC2');
      aquis1 := clAux.result('ES_UPA1');
      aquis2 := clAux.result('ES_UPA2');
    end
    else
    begin
      preco1 := 0.00;
      preco2 := 0.00;
      custo1 := 0.00;
      custo2 := 0.00;
      aquis1 := 0.00;
      aquis2 := 0.00;
    end;
    clAux.desconect;
    clAux.Free;

    clEstoque.inES_OTAM := InformaOrdemTamanho(grupo,subgrupo,produto,tamanho);
    clEstoque.inES_DESC := FormataNomeItemProduto(form_nz(grupo,2)+
      form_nz(subgrupo,2)+
      form_nz(produto,4),
      cor,
      tamanho);
    clEstoque.inES_REFF := InformaRefFabric(grupo,subgrupo,produto);
    clEstoque.inES_PVE1 := preco1;
    clEstoque.inES_PVE2 := preco2;
    clEstoque.inES_PCU1 := 0.00; //custo medio somente na 'entrada normal'
    clEstoque.inES_PCU2 := 0.00; //custo medio somente na 'entrada normal'
    clEstoque.inES_UPA1 := aquis1;
    clEstoque.inES_UPA2 := aquis2;
    clEstoque.inES_UPC1 := custo1;
    clEstoque.inES_UPC2 := custo2;
    if (frm_principal.x_origem_cbarra_interno=0) then
      clEstoque.inES_CBAR := FormataCodigoBarras(grupo,subgrupo,produto,cor,tamanho)
    else
    begin
      Application.CreateForm(Tfrm_InformeCbarra,frm_InformeCbarra);
      frm_InformeCbarra.pnProduto.caption := clEstoque.inES_DESC;
      frm_InformeCbarra.showmodal;
      if (frm_InformeCBarra.codigo_de_barras<>'-1') then
        clEstoque.inES_CBAR  := frm_InformeCBarra.codigo_de_barras
      else
        clEstoque.inES_CBAR := '';
      frm_InformeCbarra.Free;
    end;
    if (frm_principal.x_solicitar_EAN13_no_cadastro_de_produtos) then
    begin
      Application.CreateForm(Tfrm_InformeEAN13,frm_InformeEAN13);
      frm_InformeEAN13.pnProduto.caption := clEstoque.inES_DESC;
      frm_InformeEAN13.y_grupo    := grupo;
      frm_InformeEAN13.y_subgrupo := subgrupo;
      frm_InformeEAN13.y_produto  := produto;
      frm_InformeEAN13.showmodal;
      if (frm_InformeEAN13.codigo_de_barras<>'-1') then
        clEstoque.inES_CEAN  := frm_InformeEAN13.codigo_de_barras
      else
        clEstoque.inES_CEAN := '';
      frm_InformeEAN13.Free;
    end
    else
      clEstoque.inES_CEAN := '';
    clEstoque.inES_TIME := frm_principal.x_data_trabalho;
    clEstoque.Insert;
          {**********************************************}
    VerificaExistenciaRegistroPRODUTOSFAIXAS(grupo,subgrupo,produto,tamanho);
          {**********************************************}
  end;
  clEstoque.desconect;
  clEstoque.Free;
end;

procedure AltCod (tabela: String; valor: Real);
begin
  if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
    with (DMMaxicod.qAlteraCod) do
    begin
      sql.clear;
      sql.Add ('SET GENERATOR GEN_'+tabela+' TO '+floattostr(valor));
      execsql;
    end
  else
  if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
    with (DMMaxicod.qAlteraCod) do
    begin
      sql.clear;
      sql.Add ('DELETE FROM GEN_'+tabela);
      execsql;
      sql.clear;
      sql.Add ('INSERT INTO GEN_'+tabela+'(CODIGO)   ');
      sql.Add ('VALUES('+floattostr(valor)+')        ');
      execsql;
    end;
end;

function DevolveMax (campo,nomearq,alias: String):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  with (clAux) do
  begin
    conect   (alias,frm_principal);
    ClearSql;
    AddParam ('SELECT MAX('+campo+') as MAXIMO');
    AddParam ('FROM '+nomearq);
    Execute;
    try
      DevolveMax := Result('MAXIMO');
    except
      try
        DevolveMax := strtoint(Result('MAXIMO'));
      except
        DevolveMax := -1;
      end;
    end;
    desconect;
    Free;
  end;
end;

function DataDoInventarioEstaFixada:Boolean;
var
  clConf: TClassAuxiliar;
begin
  clConf := TClassAuxiliar.Create;
  clConf.conect   ('ESTOQUE',frm_principal);
  clConf.ClearSql;
  clConf.AddParam ('SELECT DATA_INVENTARIO_ATUAL FROM CONF ');
  clConf.Execute; {*}
  if (clConf.result('DATA_INVENTARIO_ATUAL')<>strtodate('01/01/1900')) then
    result := true
  else
    result := false;
  clConf.desconect;
  clConf.Free;
end;

function DevolveAliquotaIPIPeloSubgrupo(grupo,subgrupo: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SG_AIPI                                           ');
  clAux.AddParam ('FROM   SUBGRUPOS_PRODUTOS                                ');
  clAux.AddParam ('WHERE (SG_GRUP=:grupo) AND                               ');
  clAux.AddParam ('      (SG_CODI=:subgrupo)                                ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  if (clAux.Execute) then
    result := clAux.result('SG_AIPI')
  else
    result := 0.00;
  clAux.desconect;
  clAux.Free;
end;

function DevolveUFDoFornecedor(codforn: Real):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CONTASPAGAR',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select FO_ESTA                            ');
  clAux.AddParam ('From   FORNECEDORES                       ');
  clAux.AddParam ('Where (FO_CODI='+floattostr(codforn)+')   ');
  if (clAux.Execute) then
    result := clAux.result('FO_ESTA')
  else
    result := '?';
  clAux.desconect;
  clAux.Free;
end;

function HoraParaInteiro(hora: String):Integer;
begin
  result:=strtoint(Copy(hora,1,2)+Copy(hora,4,2));
end;

function InteiroParaHora(hora: Integer):String;
var
  i: String;
begin
  i:=form_nz(hora,4);
  result:=Copy(i,1,2)+':'+Copy(i,3,2);
end;

function ExisteMovimento(grupo,subgrupo,produto,cor: Real; tamanho: String; loja: Real; limite: TDateTime):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select MO_QTD1                                    ');
  clAux.AddParam ('From   MOVIMENTO                                  ');
  clAux.AddParam ('Where (MO_GRUP='+floattostr(grupo)+') AND         ');
  clAux.AddParam ('      (MO_SUBG='+floattostr(subgrupo)+') AND      ');
  clAux.AddParam ('      (MO_PROD='+floattostr(produto)+') AND       ');
  clAux.AddParam ('      (MO_CORE='+floattostr(cor)+') AND           ');
  clAux.AddParam ('      (MO_TAMA='+chr(39)+tamanho+chr(39)+') AND   ');
  clAux.AddParam ('      (MO_LOJA='+floattostr(loja)+') AND          ');
  clAux.AddParam ('      (MO_DATA>:limite)                           ');
  clAux.consulta.parambyname('limite').AsDateTime := limite;
  if (clAux.Execute) then
    result := true
  else
    result := false;
  clAux.desconect;
  clAux.Free;
end;

procedure ArmazenaEmHistoricoDePrecos (grupo,subgrupo,produto,cor: Real; tamanho: String; ordemtam: Integer;
  loja,preco,novopreco: Real; tipz,tipo: String; obs: String);
var
  clAux: TClassAuxiliar;
begin
  if (preco<>0.00) and (preco<>0) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO HISTORICO_PRECOS (GRUPO,SUBGRUPO,PRODUTO,COR,TAMANHO,ORDEMTAM,LOJA,PRECO,NOVOPRECO,TIPZ,TIPO,DATA,HORA,OBS,USUARIO)   ');
    clAux.AddParam ('VALUES (:GRUPO,:SUBGRUPO,:PRODUTO,:COR,:TAMANHO,:ORDEMTAM,:LOJA,:PRECO,:NOVOPRECO,:TIPZ,:TIPO,:DATA,:HORA,:OBS,:USUARIO)          ');
    clAux.consulta.parambyname('GRUPO').AsFloat      := grupo;
    clAux.consulta.parambyname('SUBGRUPO').AsFloat   := subgrupo;
    clAux.consulta.parambyname('PRODUTO').AsFloat    := produto;
    clAux.consulta.parambyname('COR').AsFloat        := cor;
    clAux.consulta.parambyname('TAMANHO').AsString   := tamanho;
    clAux.consulta.parambyname('ORDEMTAM').AsInteger := ordemtam;
    clAux.consulta.parambyname('LOJA').AsFloat       := loja;
    clAux.consulta.parambyname('PRECO').AsFloat      := preco;
    clAux.consulta.parambyname('NOVOPRECO').AsFloat  := novopreco;
    clAux.consulta.parambyname('TIPZ').AsString      := tipz;
    clAux.consulta.parambyname('TIPO').AsString      := tipo;
    clAux.consulta.parambyname('DATA').AsDateTime    := frm_principal.x_data_trabalho;
    clAux.consulta.parambyname('HORA').AsInteger     := strtoint(FormatDateTime('hhnnss',time));
    clAux.consulta.parambyname('OBS').AsString       := obs;
    clAux.consulta.parambyname('USUARIO').AsFloat    := frm_principal.x_codigousuario;
    clAux.Execute; {*}
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure AtualizaUltimoPrecoDeCusto(grupo,subgrupo,produto,cor: Real;tamanho: String; preco: Real; tipz: String);
var
  clAux: TClassAuxiliar;
  preco_atual: Real;
  ordem_tam: Integer;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select ES_UPC1,ES_UPC2,ES_OTAM                        ');
  clAux.AddParam ('From   ESTOQUE                                        ');
  clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND             ');
  clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND          ');
  clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND           ');
  clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND               ');
  clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')           ');
  if (clAux.Execute) then
  begin
    preco_atual := clAux.result('ES_UPC'+tipz);
    ordem_tam   := clAux.result('ES_OTAM');

    if (tipz='1') then
    begin
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('grupo').AsFloat        := grupo;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('subgrupo').AsFloat     := subgrupo;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('produto').AsFloat      := produto;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('cor').AsFloat          := cor;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('tamanho').AsString     := tamanho;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('preco_custo1').AsFloat := preco;
      DMEstoque.qLancaUltimoPrecoCusto1.parambyname('time').AsDateTime      := frm_principal.x_data_trabalho;
      DMEstoque.qLancaUltimoPrecoCusto1.ExecSql;
    end
    else
    if (tipz='2') then
    begin
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('grupo').AsFloat        := grupo;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('subgrupo').AsFloat     := subgrupo;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('produto').AsFloat      := produto;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('cor').AsFloat          := cor;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('tamanho').AsString     := tamanho;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('preco_custo2').AsFloat := preco;
      DMEstoque.qLancaUltimoPrecoCusto2.parambyname('time').AsDateTime      := frm_principal.x_data_trabalho;
      DMEstoque.qLancaUltimoPrecoCusto2.ExecSql;
    end;

         //... historico
    if (preco_atual<>preco) then
      ArmazenaEmHistoricoDePrecos (grupo,subgrupo,produto,cor,tamanho,ordem_tam,
        0,preco_atual,preco,tipz,K_HIST_PRECO_CUSTO,
        'POR ENTRADA ');
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaUltimoPrecoDeAquisicao(grupo,subgrupo,produto,cor: Real;tamanho: String; preco: Real; tipz: String);
var
  clAux: TClassAuxiliar;
  preco_atual: Real;
  ordem_tam: Integer;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select ES_UPA1,ES_UPA2,ES_OTAM                        ');
  clAux.AddParam ('From   ESTOQUE                                        ');
  clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND             ');
  clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND          ');
  clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND           ');
  clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND               ');
  clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')           ');
  if (clAux.Execute) then
  begin
    if (tipz='1') or (tipz='2') then
      preco_atual := clAux.result('ES_UPA'+tipz)
    else
    if (tipz='3') then
      preco_atual := clAux.result('ES_UPA1');
    ordem_tam   := clAux.result('ES_OTAM');

    if (tipz='1') or (tipz='3') then
      with (DMEstoque.qLancaUltimoPrecoAquisicao1) do
      begin
        parambyname('grupo').AsFloat    := grupo;
        parambyname('subgrupo').AsFloat := subgrupo;
        parambyname('produto').AsFloat  := produto;
        parambyname('cor').AsFloat      := cor;
        parambyname('tamanho').AsString := tamanho;
        parambyname('preco_aquisicao1').AsFloat := preco;
        parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
        ExecSql;
      end
    else
    if (tipz='2') then
      with (DMEstoque.qLancaUltimoPrecoAquisicao2) do
      begin
        parambyname('grupo').AsFloat    := grupo;
        parambyname('subgrupo').AsFloat := subgrupo;
        parambyname('produto').AsFloat  := produto;
        parambyname('cor').AsFloat      := cor;
        parambyname('tamanho').AsString := tamanho;
        parambyname('preco_aquisicao2').AsFloat := preco;
        parambyname('time').AsDateTime  := frm_principal.x_data_trabalho;
        ExecSql;
      end;

         //... historico
    if (preco_atual<>preco) then
      ArmazenaEmHistoricoDePrecos (grupo,subgrupo,produto,cor,tamanho,ordem_tam,
        0,preco_atual,preco,tipz,K_HIST_PRECO_AQUISICAO,
        'POR ENTRADA ');
  end;
  clAux.desconect;
  clAux.Free;
end;

function ExisteProduto(grupo,subgrupo,produto: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect    ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam  ('SELECT 1 FROM PRODUTOS                         ');
  clAux.AddParam  ('WHERE (PR_GRUP='+floattostr(grupo)+') AND      ');
  clAux.AddParam  ('      (PR_SUBG='+floattostr(subgrupo)+') AND   ');
  clAux.AddParam  ('      (PR_CODI='+floattostr(produto)+')        ');
  result := clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

//Marcio-----------------------------------------------------
function excluicrediario(loja,terminal,codigovenda: Real):Boolean;
var
  query1:tquery;
  cliente:Real;
begin
  result := true;
  if (databasecredito <> 'CREDITO') then
    exit;

  query1 := tquery.create(Application);
  query1.databasename := 'CREDITO';
  with query1 do
    try

{       Sql.Clear;
       Sql.Add ('Select PC_STAT From CREPRABR                    ');
       Sql.Add ('Where  PC_Loja='+floattostr(loja)+'             ');
       SQL.ADD ('And    PC_CAIXA='+floattostr(terminal)+'        ');
       Sql.Add ('And    PC_VENDA='+floattostr(codigovenda)+'     ');
       sql.add(' And    PC_STAT = ''1'' ');
       Open;

       if not eof then begin
         result := false;
         mensagem('Venda com parcelas quitadas'+#13+'Exclusão Cancelada');
         exit;
       end;           }


      Sql.Clear;
      Sql.Add ('Delete From CONTRATOS_SPC    ');
      Sql.Add ('Where Exists(Select * from CREPRABR       ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'            ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+'     ');
      sQL.Add ('      and    PC_CLIE = contratos_spc.cliente ');
      sQL.Add ('      and    PC_CONT = contratos_spc.contrato ');
      sql.add ('            ) ');
      ExecSql;

      Sql.Clear;
      Sql.Add ('Delete From CRECHMOV                      ');
      Sql.Add ('Where Exists(Select * from CREPRABR       ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'            ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+'     ');
      sQL.Add ('      and    PC_BANC = CRECHMOV.CH_BANC   ');
      sQL.Add ('      and    PC_NUME = CRECHMOV.CH_NUME   ');
      sQL.Add ('      and    PC_CCGC = CRECHMOV.CH_CCGC   ');
      sql.add ('            ) ');
      ExecSql; {*}

      Sql.Clear;
      Sql.Add ('Delete From CRECHMVPG                        ');
      Sql.Add ('Where Exists(Select * from CREPRABR       ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'            ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+'     ');
      sQL.Add ('      and    PC_BANC = CRECHMVPG.CH_BANC   ');
      sQL.Add ('      and    PC_NUME = CRECHMVPG.CH_NUME   ');
      sQL.Add ('      and    PC_CCGC = CRECHMVPG.CH_CCGC   ');
      sql.add ('            ) ');
      ExecSql; {*}

      Sql.Clear;
      Sql.Add ('Delete From CRECHDEV                         ');
      Sql.Add ('Where Exists(Select * from CREPRABR       ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'            ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+'     ');
      sQL.Add ('      and    PC_BANC = CRECHDEV.CH_BANC   ');
      sQL.Add ('      and    PC_NUME = CRECHDEV.CH_NUME   ');
      sQL.Add ('      and    PC_CCGC = CRECHDEV.CH_CCGC   ');
      sql.add ('            ) ');
      ExecSql; {*}

      Sql.Clear;
      Sql.Add ('Delete From CRECHDVPG                        ');
      Sql.Add ('Where Exists(Select * from CREPRABR       ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'            ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+'     ');
      sQL.Add ('      and    PC_BANC = CRECHDVPG.CH_BANC   ');
      sQL.Add ('      and    PC_NUME = CRECHDVPG.CH_NUME   ');
      sQL.Add ('      and    PC_CCGC = CRECHDVPG.CH_CCGC   ');
      sql.add ('            ) ');
      ExecSql; {*}

      Sql.Clear;
      Sql.Add ('Delete From CRECTABR                ');
      Sql.Add ('Where Exists(Select * from CREPRABR       ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'            ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+'     ');
      sQL.Add ('      and    PC_CLIE = CRECTABR.CR_CLIE   ');
      sQL.Add ('      and    PC_CONT = CRECTABR.CR_CODI   ');
      sql.add ('            ) ');
      ExecSql;

      Sql.Clear;
      Sql.Add ('Select PC_CLIE,PC_CONT,PC_NPRE From CREPRABR                    ');
      Sql.Add ('Where  PC_Loja='+floattostr(loja)+'             ');
      SQL.ADD ('And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('And    PC_VENDA='+floattostr(codigovenda)+'     ');
      Open;

      Cliente := fieldbyname('Pc_Clie').AsFloat;

      Sql.Clear;
      Sql.Add ('Delete From CREPRABR                ');
      Sql.Add ('Where  PC_Loja='+floattostr(loja)+'            ');
      SQL.ADD ('And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('And    PC_VENDA='+floattostr(codigovenda)+'     ');
      ExecSql;

//       RedefinirUltimaCompra (cliente);
//       RedefinirQtCompra (cliente,-1);

    finally
      query1.destroy;
    end;
end;
//Marcio-----------------------------------------------------

function UsuarioIsAdmin(cod: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect    ('CREDITO',frm_principal);
  clAux.ClearSql;
  clAux.AddParam  ('SELECT USTYPE FROM USERS              ');
  clAux.AddParam  ('WHERE (USCODE='+floattostr(cod)+')    ');
  if (clAux.Execute) then
  begin
    if (clAux.Result('USTYPE')='1') then
      result := true
    else
      result := false;
  end
  else
    result := false;
  clAux.desconect;
  clAux.Free;
end;

procedure CarregaFotoProduto (grupo,subgrupo,produto: Real; imagem: TImage);
var
  clAux: TClassAuxiliar;
  refint: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PR_REFI FROM PRODUTOS             ');
  clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND               ');
  clAux.AddParam ('      (PR_SUBG=:subgrupo) AND            ');
  clAux.AddParam ('      (PR_CODI=:produto)                 ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  if (clAux.Execute) then
  begin
    refint := clAux.result('PR_REFI');
    CarregaFotoProduto_ (refint,imagem);
  end
  else
    imagem.visible := false;
  clAux.desconect;
  clAux.Free;
end;

procedure CarregaFotoProduto_ (refint: String; imagem: TImage);
var
  nome_arquivo: String;
begin
  imagem.visible := true;
  nome_arquivo   := refint;
  if (FileExists(frm_principal.x_path_fotos_produtos+'\'+nome_arquivo+'.BMP')) then
    imagem.picture.loadfromFile(frm_principal.x_path_fotos_produtos+'\'+nome_arquivo+'.BMP')
  else
  if (FileExists(frm_principal.x_path_fotos_produtos+'\'+nome_arquivo+'.JPG')) then
    imagem.picture.loadfromFile(frm_principal.x_path_fotos_produtos+'\'+nome_arquivo+'.JPG')
  else
  if (FileExists(frm_principal.x_path_fotos_produtos+'\'+nome_arquivo+'.GIF')) then
    imagem.picture.loadfromFile(frm_principal.x_path_fotos_produtos+'\'+nome_arquivo+'.GIF')
  else
    imagem.visible := false;
end;

procedure BuscaNomeAvancado (lista: Tlistbox);
begin
  Application.CreateForm(Tfrm_BuscaNomeAvancado, frm_BuscaNomeAvancado);
  frm_BuscaNomeAvancado.y_Lista := lista;
  frm_BuscaNomeAvancado.showmodal;
  frm_BuscaNomeAvancado.Free;
end;


function precoetiquetasempromocao(loja,grup,subg,prod,core:Real;tama:String;var oldpreco:Real):Boolean;
begin
  Result := false;
  if (UpperCase(Frm_Principal.X_preconormaletiq) = 'SIM') or
    ((UpperCase(Frm_Principal.X_preconormaletiq) = 'PERGUNTAR') and
    (japerguntouprecoetiq or (frmDialogo.ExibirMensagem
    ('Deseja imprimir o preço anterior ao preço promocional?'
    ,'Etiquetas',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mryes))) then
  begin
    Result := true;
    japerguntouprecoetiq := UpperCase(Frm_Principal.X_preconormaletiq) = 'PERGUNTAR';
    oldpreco := InformaPrecoVendaDiferencial(loja,grup,subg,prod,core,tama,'1');
    if oldpreco <= 0 then
      oldpreco := InformaPrecoVendaprincipal(grup,subg,prod,core,tama,'1');
  end;
end;

begin
  japerguntouprecoetiq := false;
end.
