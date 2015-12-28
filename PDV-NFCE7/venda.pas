unit venda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers, DbTables, Db,funcoesglobais;

{*** Funcoes}
function ProximaVenda(loja,caixa: Real):Real;
function InformaAliqICMS(estado: String):Real;
function DevolvePrecoItem(loja: Real; grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function DevolvePrecoCusto(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function InformaUltimoPrecoCusto(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
function ReformataCodigoBarras(codigo_barras: String):String;
function RetornaTamanhoCodigoBarrasConfigurado:Integer;
function DevolveCodTam(grupo,subgrupo,produto: Real; n_tam: String):Integer;
function FormataNomeItemProduto (n_produto: String; n_cor: Real; n_tam: String):String;
function FormataCodigoBarras(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
function InformaRefFabric(grupo,subgrupo,produto: Real):String;
function DevolveUnidadeProduto(grupo,subgrupo,produto: Real):String;
function RetornaNomeECF:String;
function RetornaCodigoDeBarrasDoItem(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
function RetornaEAN13DoItem(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
procedure ConfiguraStatusPDV;
function DevolvePercComisVend(loja,vendedor: Real; tipo: String):Real;
procedure VerificaExistenciaDoRegistroESTOQUE_LOJA(grupo,subgrupo,produto,cor: Real; tamanho: String; loja: Real);
function AtualizaPrecoPrincipal(preco,loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
procedure SaidaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real; cor: Real; faixa: String; qtde: Real);
procedure EntradaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real; cor: Real; faixa: String; qtde: Real);
procedure AtualizaUltimaVenda_Estoque(grupo,subgrupo,produto,cor: Real; faixa: String; data: TDateTime; tipz: String);
procedure AtualizaUltimaVenda_Estoque_Loja(grupo,subgrupo,produto,cor: Real; faixa: String; loja: Real; data: TDateTime; tipz: String);
procedure AtualizaUltimaVenda_Produto(grupo,subgrupo,produto: Real; data: TDateTime; tipz: String);
procedure ExclueVendaLocal;
procedure ExcluePagamentosLocal;
procedure ExclueItemVendaLocal(grupo,subgrupo,produto,cor: Real; tamanho: String; modo: Integer);
procedure ReformularProjetoIndicesVENDAS;
function  ExisteIndice(nome_indice: String):Boolean;
procedure CriaIndice(arquivo,nome,campos: String);
function RetornaCodigoDaUltimaVendaPorCupom(loja,terminal: Real):Real;
function BuscaFornecedor(grupo,subgrupo,produto: Real):Real;
procedure CancelaVenda(codigo_loja,codigo_terminal,codigo_venda: Real);
function VerificaStatusDaVenda(loja,terminal,venda: Real):String;
function ChecaSenhaCaixa(func: Real; senha: String):Boolean;
function VerificaSeTemCaixaAbertoHoje(func: Real):Boolean;
procedure CriaTabela(local,nome: String; tipo: TTableType; NomeCampos,TamanhoCampos,TipoCampos: TStringList; qtdecampos: Integer);
procedure ChecaExistenciaArquivo_TEMP_SAIDAS;
procedure ChecaExistenciaArquivo_SEQVENDAS;
procedure ChecaExistenciaArquivo_TEMP_TRANSF;
procedure ChecaExistenciaArquivo_TIPOFUNCVENDAS;
function RetornaApelidoEmpresa:String;
procedure ImprimeSlipTransferencia(lojaorigem,documento: Real);
procedure GeraInformacaoFinanceiraDinheiro;
procedure ExcluiInformacaoFinanceiraDinheiro (loja,terminal,codigovenda: Real);
function TotalizaValorEntradas(loja,terminal,venda: Real):Real;
function VerificaVendedorDaVenda(terminalvenda,codigovenda: Real):Real;
procedure CriaPastaNoVendasLocal(nomepasta: String);
procedure ExclueItemAtendimentoLocal(grupo,subgrupo,produto,cor: Real; tamanho: String);
procedure GravaExcessoTrocasAtendimentos (loja,terminal,numero: Real; total: Real);
function ExisteExcessoNoAtendimento (loja,terminal,numero: Real):Boolean;
procedure ExclueAtendimentoLocal;
procedure ImprimeSlipAtendimento(loja,terminal,atdo: Real);
procedure ImprimeSlipCancelado(loja,terminal,atdo: Real);
procedure ChecaExistenciaArquivo_SEQATDO;
function excluicrediario(loja,terminal,codigovenda: Real):Boolean;
function IcmsProduto(grupo,subgrupo,produto: Real;Estado:String):Real;
function InformaultimaVenda(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):TDateTime;
function InformaultimaCompra(grupo,subgrupo,produto,cor: Real; tamanho: String):TDateTime;
function InformaCodTEF(codigo: Real):Real;
function ExisteCodTefCadastrado:Boolean;

implementation

uses auxiliar, funcoes1, funcoes2, procura, principal, itensestoque, itensestoqueloja, DM2,
  DM16, mem_prnt, caixa,credito;

{Informa o codigo da proxima venda ***}
function  ProximaVenda(loja,caixa: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux:= TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select MAX(VE_CODI) as MAXCODIGO           ');
  clAux.AddParam ('From   VENDAS                              ');
  clAux.AddParam ('Where (VE_CAIX='+floattostr(caixa)+') AND  ');
  clAux.AddParam ('      (VE_LOJA='+floattostr(loja)+')       ');
  clAux.Execute;
  ProximaVenda := clAux.result('MAXCODIGO')+1;
  clAux.desconect;
  clAux.Free;
end;

{Informa a aliquota de ICMS ***}
function InformaAliqICMS(estado: String):Real;
var
  aliq,valor_icms: Real;
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT AP_ICMS,AP_ESTA                          ');
  clAux.AddParam ('FROM   ALIQUOTAS_PRODUTOS                       ');
  clAux.AddParam ('WHERE (AP_ESTA='+chr(39)+estado+chr(39)+') AND  ');
  clAux.AddParam ('      (AP_GRUP=1) AND                           ');
  clAux.AddParam ('      (AP_SUBG=1) AND                           ');
  clAux.AddParam ('      (AP_PROD=1)                               ');
  if (clAux.Execute) then
    result := clAux.result('AP_ICMS')
  else
    result := 0.00;
  clAux.desconect;
  clAux.Free;
end;

{Informa código do TEF (DTEF) ***}

function InformacodTEF(codigo: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT AM_CODI                                  ');
  clAux.AddParam ('FROM   ADMINISTRADORAS                          ');
  clAux.AddParam ('WHERE (AM_CODT='+FloatToStr(codigo)+')          ');
  if (clAux.Execute) then
    result := clAux.result('AM_CODI')
  else
    result := 0.00;
  clAux.desconect;
  clAux.Free;
end;

procedure SaidaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real;
  cor: Real; faixa: String; qtde: Real);
begin
  if (grupo<>0) and (subgrupo<>0)   and (produto<>0) and
    (cor<>-1)  and (faixa<>'-1') and (tipz<>'')   and
    (loja<>0) then
  begin
         {*** Saldo do item}
    DMCaixa.qDiminueSaldo.Close;
    DMCaixa.qDiminueSaldo.DatabaseName := databaseprodutos;
    DMCaixa.qDiminueSaldo.parambyname('grupo').AsFloat    := grupo;
    DMCaixa.qDiminueSaldo.parambyname('subgrupo').AsFloat := subgrupo;
    DMCaixa.qDiminueSaldo.parambyname('produto').AsFloat  := produto;
    DMCaixa.qDiminueSaldo.parambyname('cor').AsFloat      := cor;
    DMCaixa.qDiminueSaldo.parambyname('tamanho').AsString := faixa;
    DMCaixa.qDiminueSaldo.parambyname('loja').AsFloat     := loja;
    if (tipz='1') then
    begin
      DMCaixa.qDiminueSaldo.parambyname('qtd1').AsFloat     := qtde;
      DMCaixa.qDiminueSaldo.parambyname('qtd2').AsFloat     := 0;
    end
    else
    if (tipz='2') then
    begin
      DMCaixa.qDiminueSaldo.parambyname('qtd1').AsFloat     := 0;
      DMCaixa.qDiminueSaldo.parambyname('qtd2').AsFloat     := qtde;
    end;
    DMCaixa.qDiminueSaldo.parambyname('time').AsDateTime       := frm_principal.x_data_trabalho;
    DMCaixa.qDiminueSaldo.ExecSql;
  end;
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
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select PP_PRE1,PP_PRE2                                                                      ');
  clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                                  ');
  clAux.AddParam ('Where (PP_LOJA='+floattostr(loja)+') AND                                                    ');
  clAux.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                                   ');
  clAux.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                                                ');
  clAux.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                                                 ');
  clAux.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                                     ');
  clAux.AddParam ('      (PP_TAMA='+chr(39)+tamanho+chr(39)+') AND                                             ');
  clAux.AddParam ('      (PP_DAT1<='+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+') AND   '); {*}
  clAux.AddParam ('      (PP_DAT2>='+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+')       '); {*}
  clAux.AddParam ('Order by PP_DAT1                                                                            ');
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

function DevolvePrecoCusto(grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
Var
  clAux :TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select ES_UPC1,ES_UPC2                                   ');
  clAux.AddParam ('From   ESTOQUE                                           ');
  clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND                ');
  clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND             ');
  clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND              ');
  clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND                  ');
  clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')              ');
  if (clAux.Execute) then
    result := clAux.result('ES_UPC'+tipz);
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaUltimaVenda_Estoque(grupo,subgrupo,produto,cor: Real;
  faixa: String; data: TDateTime; tipz: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam('UPDATE ESTOQUE                               ');
  if (tipz='1') then
    clAux.AddParam('SET ES_ULC1=:data         ')
  else
  if (tipz='2') then
    clAux.AddParam('SET ES_ULC2=:data    ');
  clAux.AddParam('WHERE (ES_GRUP='+floattostr(grupo)+') AND    ');
  clAux.AddParam('      (ES_SUBG='+floattostr(subgrupo)+') AND ');
  clAux.AddParam('      (ES_PROD='+floattostr(produto)+') AND  ');
  clAux.AddParam('      (ES_CORE='+floattostr(cor)+') AND      ');
  clAux.AddParam('      (ES_TAMA='+chr(39)+faixa+chr(39)+')    ');
  clAux.consulta.parambyname('data').AsDateTime := data;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

//so tem finalidade se o sistema estiver on-line
//supoe-se que a venda que esta sendo lancada é a mais recente
procedure AtualizaUltimaVenda_Estoque_Loja(grupo,subgrupo,produto,cor: Real;
  faixa: String; loja: Real; data: TDateTime; tipz: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE ESTOQUE_LOJA                            ');
  if (tipz='1') then
    clAux.AddParam('SET EL_ULC1=:data            ')
  else
  if (tipz='2') then
    clAux.AddParam('SET EL_ULC2=:data       ');
  clAux.AddParam ('WHERE (EL_GRUP='+floattostr(grupo)+') AND      ');
  clAux.AddParam ('      (EL_SUBG='+floattostr(subgrupo)+') AND   ');
  clAux.AddParam ('      (EL_PROD='+floattostr(produto)+') AND    ');
  clAux.AddParam ('      (EL_CORE='+floattostr(cor)+') AND        ');
  clAux.AddParam ('      (EL_TAMA='+chr(39)+faixa+chr(39)+') AND  ');
  clAux.AddParam ('      (EL_LOJA='+floattostr(loja)+')           ');
  clAux.consulta.parambyname('data').AsDateTime := data;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaUltimaVenda_Produto(grupo,subgrupo,produto: Real;
  data: TDateTime; tipz: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE PRODUTOS                                ');
  if (tipz='1') then
    clAux.AddParam('SET PR_ULC1=:data            ')
  else
  if (tipz='2') then
    clAux.AddParam('SET PR_ULC2=:data       ');
  clAux.AddParam ('WHERE (PR_GRUP='+floattostr(grupo)+') AND      ');
  clAux.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND   ');
  clAux.AddParam ('      (PR_CODI='+floattostr(produto)+')        ');
  clAux.consulta.parambyname('data').AsDateTime := data;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

{** rotina de exclusao da venda local}
procedure ExclueVendaLocal;
var
  clAux: TClassAuxiliar;
begin
  clAux  := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM ITENS_VENDAS_LOCAL    ');
  clAux.AddParam ('Where (IV_LOJA=:IV_LOJA) AND      ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND      ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND)          ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VENDAS_LOCAL          ');
  clAux.AddParam ('Where (VE_LOJA=:VE_LOJA) AND      ');
  clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND      ');
  clAux.AddParam ('      (VE_CODI=:VE_CODI)          ');
  clAux.consulta.parambyname('VE_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VE_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VE_CODI').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CARTOES_LOCAL         ');
  clAux.AddParam ('Where (CA_LOJA=:CA_LOJA) AND      ');
  clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
  clAux.AddParam ('      (CA_VEND=:CA_VEND)          ');
  clAux.consulta.parambyname('CA_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CA_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CA_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CARTOES_PARCELAS_LOCAL          ');
  clAux.AddParam ('Where (PC_LOJA=:PC_LOJA) AND                ');
  clAux.AddParam ('      (PC_CAIX=:PC_CAIX) AND                ');
  clAux.AddParam ('      (PC_VEND=:PC_VEND)                    ');
  clAux.consulta.parambyname('PC_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('PC_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('PC_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CHEQUES_LOCAL          ');
  clAux.AddParam ('Where (CH_LOJA=:CH_LOJA) AND       ');
  clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND       ');
  clAux.AddParam ('      (CH_VEND=:CH_VEND)           ');
  clAux.consulta.parambyname('CH_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CH_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CH_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CREDIARIOS_LOCAL      ');
  clAux.AddParam ('Where (CR_LOJA=:CR_LOJA) AND      ');
  clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND      ');
  clAux.AddParam ('      (CR_VEND=:CR_VEND)          ');
  clAux.consulta.parambyname('CR_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CR_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CR_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VENDAS_FORMA_PAGAMENTO_LOCAL      ');
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND                  ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                  ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)                      ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VF_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam('DELETE FROM VALES_MERC_LOCAL ');
  clAux.AddParam('WHERE (VM_LOJA=:VM_LOJA) AND ');
  clAux.AddParam('      (VM_CAIX=:VM_CAIX) AND ');
  clAux.AddParam('      (VM_VEND=:VM_VEND)     ');
  clAux.consulta.parambyname('VM_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VM_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VM_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam('DELETE FROM VALES_RECEBIDOS_LOCAL ');
  clAux.AddParam('WHERE (VE_LOJA=:VE_LOJA) AND      ');
  clAux.AddParam('      (VE_CAIX=:VE_CAIX) AND      ');
  clAux.AddParam('      (VE_VEND=:VE_VEND)          ');
  clAux.consulta.parambyname('VE_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VE_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VE_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.Desconect;
  clAux.Free;
end;

{** rotina de exclusao da venda local}
procedure ExcluePagamentosLocal;
var
  clAux: TClassAuxiliar;
begin
  clAux  := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CARTOES_LOCAL          ');
  clAux.AddParam ('Where (CA_LOJA=:CA_LOJA) AND       ');
  clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND       ');
  clAux.AddParam ('      (CA_VEND=:CA_VEND)           ');
  clAux.consulta.parambyname('CA_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CA_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CA_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CARTOES_PARCELAS_LOCAL          ');
  clAux.AddParam ('Where (PC_LOJA=:PC_LOJA) AND                ');
  clAux.AddParam ('      (PC_CAIX=:PC_CAIX) AND                ');
  clAux.AddParam ('      (PC_VEND=:PC_VEND)                    ');
  clAux.consulta.parambyname('PC_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('PC_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('PC_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CHEQUES_LOCAL          ');
  clAux.AddParam ('Where (CH_LOJA=:CH_LOJA) AND       ');
  clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND       ');
  clAux.AddParam ('      (CH_VEND=:CH_VEND)           ');
  clAux.consulta.parambyname('CH_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CH_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CH_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CREDIARIOS_LOCAL      ');
  clAux.AddParam ('Where (CR_LOJA=:CR_LOJA) AND      ');
  clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND      ');
  clAux.AddParam ('      (CR_VEND=:CR_VEND)          ');
  clAux.consulta.parambyname('CR_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CR_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CR_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VENDAS_FORMA_PAGAMENTO_LOCAL      ');
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND                  ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                  ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)                      ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VF_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.desconect;
  clAux.Free;
end;

{- No momento, ele suprimi ou nao o DV na leitura}
function ReformataCodigoBarras(codigo_barras: String):String;
var
  tamanhoConfigurado: Integer;
begin
  codigo_barras := trim(codigo_barras);
  tamanhoConfigurado := RetornaTamanhoCodigoBarrasConfigurado;
  if (frm_principal.x_adiciona_dv_codigo_barras) then
    tamanhoConfigurado := tamanhoConfigurado + 1;
  if (tamanhoConfigurado<Length(codigo_barras)) then
    codigo_barras := Copy(codigo_barras,1,tamanhoConfigurado);
  result:=codigo_barras;
end;

{Retorna o tamanho do campo codigo de barras, de acordo com a configuracao informada}
function RetornaTamanhoCodigoBarrasConfigurado:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(ESPACO) as TAMANHO ');
  clAux.AddParam ('FROM CONFIG_CODIGO_BARRAS     ');
  clAux.Execute;
  result := clAux.result('TAMANHO');
  clAux.desconect;
  clAux.Free;
end;

procedure ExclueItemVendaLocal(grupo,subgrupo,produto,cor: Real; tamanho: String; modo: Integer);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM ITENS_VENDAS_LOCAL     ');
  clAux.AddParam ('WHERE (IV_LOJA=:loja) AND          ');
  clAux.AddParam ('      (IV_CAIX=:caixa) AND         ');
  clAux.AddParam ('      (IV_VEND=:codigo_venda) AND  ');
  clAux.AddParam ('      (IV_GRUP=:grupo) AND         ');
  clAux.AddParam ('      (IV_SUBG=:subgrupo) AND      ');
  clAux.AddParam ('      (IV_PROD=:produto) AND       ');
  clAux.AddParam ('      (IV_CORE=:cor) AND           ');
  clAux.AddParam ('      (IV_TAMA=:tam) AND           ');
  clAux.AddParam ('      (IV_MODO=:modo)              ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
  clAux.consulta.parambyname('grupo').AsFloat        := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat     := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat      := produto;
  clAux.consulta.parambyname('cor').AsFloat          := cor;
  clAux.consulta.parambyname('tam').AsString         := tamanho;
  clAux.consulta.parambyname('modo').AsInteger       := modo;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
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
      clAux.conect   (databaseprodutos,frm_principal);
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

{Funcao responsavel pela formatacao do codigo de barras dos itens ***}
function FormataCodigoBarras(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
var
  clAux,clAux2: TClassAuxiliar;
  codigo_barras: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
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
        clAux2.conect   (databaseprodutos,frm_principal);
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
        codigo_barras:=codigo_barras + form_nz(cor,clAux.result('ESPACO'))
      else
      if (clAux.result('CAMPO')=6) then
        codigo_barras:=codigo_barras + form_nz(DevolveCodTam(grupo,subgrupo,produto,tamanho),clAux.result('ESPACO'));
      clAux.next;
    end;
    result:=codigo_barras;
  end
  else
    result:='?';
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
    conect   (databaseprodutos,frm_principal);
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

{Retorna o codigo do tamanho para geracao dos codigos de barras ***}
{Como os tamanhos sao 'strings' ocorre que os codigos de barras geram um inteiro}
function DevolveCodTam(grupo,subgrupo,produto: Real; n_tam: String):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
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

procedure ReformularProjetoIndicesVENDAS;
var
  clAux: TClassAuxiliar;
begin
    {**************************************************************************************}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM INDICES ');
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
    {**************************************************************************************}
  if (not ExisteIndice('VENDAS_PRIM')) then
    CriaIndice('VENDAS','VENDAS_PRIM','VE_LOJA,VE_CAIX,VE_CODI');
  if (not ExisteIndice('VENDAS_SEC1')) then
    CriaIndice('VENDAS','VENDAS_SEC1','VE_DATA');
  if (not ExisteIndice('VENDAS_SEC2')) then
    CriaIndice('VENDAS','VENDAS_SEC2','VE_TIPZ');

  if (not ExisteIndice('ITENS_VENDAS_PRIM')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_PRIM','IV_LOJA,IV_CAIX,IV_VEND');
  if (not ExisteIndice('ITENS_VENDAS_SEC1')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_SEC1','IV_GRUP');
  if (not ExisteIndice('ITENS_VENDAS_SEC2')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_SEC2','IV_SUBG');
  if (not ExisteIndice('ITENS_VENDAS_SEC3')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_SEC3','IV_PROD');
  if (not ExisteIndice('ITENS_VENDAS_SEC4')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_SEC4','IV_DATA');
  if (not ExisteIndice('ITENS_VENDAS_SEC5')) then
    CriaIndice('ITENS_VENDAS','ITENS_VENDAS_SEC5','IV_VEDE');

  if (not ExisteIndice('ITENS_VENDAS_LOCAL_PRIM')) then
    CriaIndice('ITENS_VENDAS_LOCAL','ITENS_VENDAS_LOCAL_PRIM','IV_LOJA,IV_CAIX,IV_VEND');

  if (not ExisteIndice('VENDAS_FORMA_PAGAMENTO_PRIM')) then
    CriaIndice('VENDAS_FORMA_PAGAMENTO','VENDAS_FORMA_PAGAMENTO_PRIM','VF_LOJA,VF_CAIX,VF_VEND');
  if (not ExisteIndice('VENDAS_FORMA_PAGAMENTO_SEC1')) then
    CriaIndice('VENDAS_FORMA_PAGAMENTO','VENDAS_FORMA_PAGAMENTO_SEC1','VF_FPGT');
  if (not ExisteIndice('VENDAS_FORMA_PAGAMENTO_LOC1')) then
    CriaIndice('VENDAS_FORMA_PAGAMENTO_LOCAL','VENDAS_FORMA_PAGAMENTO_LOC1','VF_LOJA,VF_CAIX,VF_VEND');

  if (not ExisteIndice('VENDAS_ATENDIMENTO_PRIM')) then
    CriaIndice('VENDAS_ATENDIMENTO','VENDAS_ATENDIMENTO_PRIM','VA_LOJA,VA_CAIX,VA_VEND');
  if (not ExisteIndice('VENDAS_ATENDIMENTO_SEC1')) then
    CriaIndice('VENDAS_ATENDIMENTO','VENDAS_ATENDIMENTO_SEC1','VA_VEDE');
  if (not ExisteIndice('VENDAS_ATDO_LOCAL_PRIM')) then
    CriaIndice('VENDAS_ATENDIMENTO_LOCAL','VENDAS_ATDO_LOCAL_PRIM','VA_LOJA,VA_CAIX,VA_VEND');

  if (not ExisteIndice('CARTOES_PRIM')) then
    CriaIndice('CARTOES','CARTOES_PRIM','CA_CAIX,CA_LOJA,CA_VEND');
  if (not ExisteIndice('CARTOES_LOCAL_PRIM')) then
    CriaIndice('CARTOES_LOCAL','CARTOES_LOCAL_PRIM','CA_CAIX,CA_LOJA,CA_VEND');

  if (not ExisteIndice('CREDIARIOS_PRIM')) then
    CriaIndice('CREDIARIOS','CREDIARIOS_PRIM','CR_CAIX,CR_LOJA,CR_VEND');
  if (not ExisteIndice('CREDIARIOS_LOCAL_PRIM')) then
    CriaIndice('CREDIARIOS_LOCAL','CREDIARIOS_LOCAL_PRIM','CR_CAIX,CR_LOJA,CR_VEND');

  if (not ExisteIndice('CHEQUES_PRIM')) then
    CriaIndice('CHEQUES','CHEQUES_PRIM','CH_CAIX,CH_LOJA,CH_VEND');
  if (not ExisteIndice('CHEQUES_LOCAL_PRIM')) then
    CriaIndice('CHEQUES_LOCAL','CHEQUES_LOCAL_PRIM','CH_CAIX,CH_LOJA,CH_VEND');

  if (not ExisteIndice('VENDEDORES_PRIM')) then
    CriaIndice('VENDEDORES','VENDEDORES_PRIM','VD_LOJA,VD_CODI');

  if (not ExisteIndice('ADMINISTRADORAS_PRIM')) then
    CriaIndice('ADMINISTRADORAS','ADMINISTRADORAS_PRIM','AM_CODI');

  if (not ExisteIndice('LINHAS_PRIM')) then
    CriaIndice('LINHAS','LINHAS_PRIM','LI_CODI');

  if (not ExisteIndice('COLECOES_PRIM')) then
    CriaIndice('COLECOES','COLECOES_PRIM','CO_CODI');

  if (not ExisteIndice('MATERIAIS_PRIM')) then
    CriaIndice('MATERIAIS','MATERIAIS_PRIM','MA_CODI');

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

  if (not ExisteIndice('PRODUTOS_PRIM')) then
    CriaIndice('PRODUTOS','PRODUTOS_PRIM','PR_GRUP,PR_SUBG,PR_CODI');
  if (not ExisteIndice('PRODUTOS_SEC1')) then
    CriaIndice('PRODUTOS','PRODUTOS_SEC1','PR_DESC');
  if (not ExisteIndice('PRODUTOS_SEC2')) then
    CriaIndice('PRODUTOS','PRODUTOS_SEC2','PR_REFI');
  if (not ExisteIndice('PRODUTOS_SEC3')) then
    CriaIndice('PRODUTOS','PRODUTOS_SEC3','PR_REFF');

  if (not ExisteIndice('PRODUTOS_FAIXAS_PRIM')) then
    CriaIndice('PRODUTOS_FAIXAS','PRODUTOS_FAIXAS_PRIM','PF_GRUP,PF_SUBG,PF_PROD');

  if (not ExisteIndice('ESTOQUE_PRIM')) then
    CriaIndice('ESTOQUE','ESTOQUE_PRIM','ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA');
  if (not ExisteIndice('ESTOQUE_SEC1')) then
    CriaIndice('ESTOQUE','ESTOQUE_SEC1','ES_CBAR');
  if (not ExisteIndice('ESTOQUE_SEC2')) then
    CriaIndice('ESTOQUE','ESTOQUE_SEC2','ES_REFF');

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

  if (not ExisteIndice('CARTOES_PARCELAS_PRIM')) then
    CriaIndice('CARTOES_PARCELAS','CARTOES_PARCELAS_PRIM','PC_LOJA,PC_CAIX,PC_VEND');
  if (not ExisteIndice('CARTOES_PARCELAS_LOCAL_PRIM')) then
    CriaIndice('CARTOES_PARCELAS_LOCAL','CARTOES_PARCELAS_LOCAL_PRIM','PC_LOJA,PC_CAIX,PC_VEND');

  if (not ExisteIndice('VALES_MERCADORIAS_PRIM')) then
    CriaIndice('VALES_MERCADORIAS','VALES_MERCADORIAS_PRIM','VA_LOJA,VA_CAIX,VA_NUME');
  if (not ExisteIndice('ITENS_VALES_MERC_PRIM')) then
    CriaIndice('ITENS_VALES_MERCADORIAS','ITENS_VALES_MERC_PRIM','IV_LOJA,IV_CAIX,IV_NUME');

  if (not ExisteIndice('CRELOJA_PRIM')) then
    CriaIndice('CRELOJA','CRELOJA_PRIM','LO_CODI');

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

  if (not ExisteIndice('MTV_ATDO_PRIM')) then
    CriaIndice('MTV_ATDOS','MTV_ATDO_PRIM','MA_CODI');

  if (not ExisteIndice('LOTE_INVENTARIO_PRIM')) then
    CriaIndice('LOTE_INVENTARIO','LOTE_INVENTARIO_PRIM','LOJA,TERMINAL,CBARRA');
  if (not ExisteIndice('LOTE_INVENTARIO_SEC1')) then
    CriaIndice('LOTE_INVENTARIO','LOTE_INVENTARIO_SEC1','SEQ');

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
end;

function ExisteIndice(nome_indice: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  if (Trim(nome_indice)<>'') then
  begin
    clAux:=TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM INDICES                         ');
    clAux.AddParam ('WHERE (NOME='+chr(39)+nome_indice+chr(39)+')  ');
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
    clAux.conect   ('VENDAS',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO INDICES(ARQUIVO,NOME,CAMPOS)  ');
    clAux.AddParam ('VALUES (:arquivo,:nome,:campos)           ');
    clAux.consulta.parambyname('arquivo').AsString:=arquivo;
    clAux.consulta.parambyname('nome').AsString:=nome;
    clAux.consulta.parambyname('campos').AsString:=campos;
    clAux.Execute;
    clAux.desconect;
    clAux.Free;
  end;
end;

function DevolveUnidadeProduto(grupo,subgrupo,produto: Real):String;
var
  clAux: TClassAuxiliar;
begin
  clAux:=TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PR_UNID FROM PRODUTOS    ');
  clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND      ');
  clAux.AddParam ('      (PR_SUBG=:subgrupo) AND   ');
  clAux.AddParam ('      (PR_CODI=:produto)        ');
  clAux.consulta.parambyname('grupo').AsFloat    := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat  := produto;
  if (clAux.Execute) then
    result:=clAux.result('PR_UNID')
  else
    result:='??';
  clAux.desconect;
  clAux.Free;
end;

function RetornaNomeECF:String;
begin
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    result := 'Bematech'
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    result := 'Urano EFC - 2EFC'
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
    result := 'Urano EFC - 1EFC'
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
    result := 'DataRegis'
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    result := 'Daruma FS345';
end;

procedure ConfiguraStatusPDV;
begin
  if (frm_principal.x_tipo_funcionamento_sistema=0) then //ILHA
  begin
    if (databaseprodutos='ESTOQUE') then
    begin
      frm_principal.lblStatus.caption := '[On_Line]';
      frm_principal.x_online          := true;
    end
    else
    if (databaseprodutos='VENDAS') then
    begin
      if (frm_principal.x_exibe_alerta_offline) then
      begin
        frm_principal.lblStatus.Color := clRed;
        frm_principal.lblStatus.Font.Color := clRed;
        frm_principal.lblStatus.Font.Size := 22;
        frm_principal.lblStatus.Top := 540;
      end;
      frm_principal.lblStatus.caption := '[Off_Line]';
      frm_principal.x_online          := false;
    end;
  end
  else
  if (frm_principal.x_tipo_funcionamento_sistema=1) then //CAIXA
  begin
    if (databaseprodutos='ESTOQUE') then
    begin
      frm_principal.lblStatus.caption := '[On_Line]';
      frm_principal.x_online          := true;
    end
    else
    if (databaseprodutos='VENDAS') then
    begin
      if (frm_principal.x_exibe_alerta_offline) then
      begin
        frm_principal.lblStatus.Font.Color := clRed;
        frm_principal.lblStatus.Font.Size := 22;
        frm_principal.lblStatus.Top := 540;
      end;
      frm_principal.lblStatus.caption := '[Off_Line]';
      frm_principal.x_online          := false;
    end;
    if (not frm_principal.x_ecf_habilita_modo_fiscal) then
      frm_principal.lblStatus.caption := frm_principal.lblStatus.caption
    else
      frm_principal.lblStatus.caption := frm_principal.lblStatus.caption + ' / [ECF:'+RetornaNomeECF+']';
  end;
end;

function RetornaCodigoDeBarrasDoItem(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
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

function RetornaEAN13DoItem(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ES_CEAN FROM ESTOQUE                   ');
  clAux.AddParam ('WHERE (ES_GRUP='+floattostr(grupo)+') AND     ');
  clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND  ');
  clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND   ');
  clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND       ');
  clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')   ');
  if (clAux.Execute) then
  begin
    if (trim(clAux.result('ES_CEAN'))<>'') then
      result:=clAux.result('ES_CEAN')
    else
      result:='[SEM EAN13]';
  end
  else
    result:='-1';
  clAux.desconect;
  clAux.Free;
end;


{Funcao que retorna o perc. de comissao do vendedor, A vista (AV) ou A Prazo (AP) ***}
function DevolvePercComisVend(loja,vendedor: Real; tipo: String):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
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

{//Esta rotina so faz sentido com o sistema on-line}
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

{//Esta rotina so faz sentido com o sistema on-line}
function AtualizaPrecoPrincipal(preco,loja,grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
  preco_anterior: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select *                                             ');
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
    clAux.AddParam ('(IP_GRUP,IP_SUBG,IP_PROD,IP_CORE,IP_OTAM,IP_TAMA,IP_LOJA,IP_TABE,IP_PRE1,IP_PRE2,IP_REAJ,IP_POR1,IP_POR2,IP_REA1,IP_REA2)                   ');
    clAux.AddParam ('Values                                                                                                                                      ');
    clAux.AddParam ('(:IP_GRUP,:IP_SUBG,:IP_PROD,:IP_CORE,:IP_OTAM,:IP_TAMA,:IP_LOJA,:IP_TABE,:IP_PRE1,:IP_PRE2,:IP_REAJ,:IP_POR1,:IP_POR2,:IP_REA1,:IP_REA2)    ');
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
    clAux.Execute;
  end
  else
  begin
    if (tipz='1') then
      preco_anterior := clAux.result('IP_PRE2')
    else
    if (tipz='2') then
      preco_anterior := clAux.result('IP_PRE1');
    clAux.ClearSql;
    clAux.AddParam ('Update ITENS_TABELAS_PRECOS                ');
    clAux.AddParam ('Set    IP_PRE1=:IP_PRE1,                   ');
    clAux.AddParam ('       IP_PRE2=:IP_PRE2                    ');
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
      clAux.consulta.parambyname('IP_PRE2').AsFloat   := preco_anterior;
    end
    else
    if (tipz='2') then
    begin
      clAux.consulta.parambyname('IP_PRE1').AsFloat   := preco_anterior;
      clAux.consulta.parambyname('IP_PRE2').AsFloat   := preco;
    end;
    clAux.Execute;
  end;
  frm_principal.barraDicas.caption := '';
  frm_principal.barraDicas.refresh;
  clAux.desconect;
  clAux.Free;
end;

procedure EntradaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real;
  cor: Real; faixa: String; qtde: Real);
begin
  if (grupo<>0) and (subgrupo<>0)   and (produto<>0) and
    (cor<>-1)  and (faixa<>'-1') and (tipz<>'')   and
    (loja<>0) then
  begin
         {*** Saldo do item}
    DMCaixa.qAumentaSaldo.Close;
    DMCaixa.qAumentaSaldo.DatabaseName := databaseprodutos;
    DMCaixa.qAumentaSaldo.parambyname('grupo').AsFloat    := grupo;
    DMCaixa.qAumentaSaldo.parambyname('subgrupo').AsFloat := subgrupo;
    DMCaixa.qAumentaSaldo.parambyname('produto').AsFloat  := produto;
    DMCaixa.qAumentaSaldo.parambyname('cor').AsFloat      := cor;
    DMCaixa.qAumentaSaldo.parambyname('tamanho').AsString := faixa;
    DMCaixa.qAumentaSaldo.parambyname('loja').AsFloat     := loja;
    if (tipz='1') then
    begin
      DMCaixa.qAumentaSaldo.parambyname('qtd1').AsFloat     := qtde;
      DMCaixa.qAumentaSaldo.parambyname('qtd2').AsFloat     := 0;
    end
    else
    if (tipz='2') then
    begin
      DMCaixa.qAumentaSaldo.parambyname('qtd1').AsFloat     := 0;
      DMCaixa.qAumentaSaldo.parambyname('qtd2').AsFloat     := qtde;
    end;
    DMCaixa.qAumentaSaldo.parambyname('time').AsDateTime       := frm_principal.x_data_trabalho;
    DMCaixa.qAumentaSaldo.ExecSql;
  end;
end;

{Rotina de cancelamento de venda ***}
{O campo VE_STAT da tabela de vendas assume as seguintes situacoes:
 0-> SEM pagamento concluido,
 1-> COM pagamento concluido,
 2-> cancelado
 ...}
{- CANCELA A VENDA USANDO OS CODIGOS DA VENDA}
procedure CancelaVenda(codigo_loja,codigo_terminal,codigo_venda: Real);
var
  clAux,clUlt: TClassAuxiliar;
  data_ultima_venda: TDateTime;
begin
     {.................................................}
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.AddParam ('UPDATE VENDAS SET VE_STAT='+chr(39)+'2'+chr(39)+'  ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                          ');
  clAux.AddParam ('      (VE_CAIX=:terminal) AND                      ');
  clAux.AddParam ('      (VE_CODI=:venda)                             ');
  clAux.consulta.parambyname('loja').AsFloat     := codigo_loja;
  clAux.consulta.parambyname('terminal').AsFloat := codigo_terminal;
  clAux.consulta.parambyname('venda').AsFloat    := codigo_venda;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;

     {.................................................}
  if (frm_principal.x_online) then
  begin
         {.................................................}
    ExcluiInformacaoFinanceiraDinheiro (codigo_loja,codigo_terminal,codigo_venda); {*}


         //Dando baixa nos itens da VENDA ....................................}
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,frm_principal);
    clAux.AddParam ('SELECT *                             ');
    clAux.AddParam ('FROM   ITENS_VENDAS,VENDAS           ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja) AND            ');
    clAux.AddParam ('      (VE_CAIX=:terminal) AND        ');
    clAux.AddParam ('      (VE_CODI=:venda) AND           ');
    clAux.AddParam ('      (VE_LOJA=IV_LOJA) AND          ');
    clAux.AddParam ('      (VE_CAIX=IV_CAIX) AND          ');
    clAux.AddParam ('      (VE_CODI=IV_VEND)              ');
    clAux.consulta.parambyname('loja').AsFloat     := codigo_loja;
    clAux.consulta.parambyname('terminal').AsFloat := codigo_terminal;
    clAux.consulta.parambyname('venda').AsFloat    := codigo_venda;
    clAux.Execute;
    clAux.first;
    while (not clAux.eof) do
    begin
      if (clAux.result('IV_TOTA')>=0.00) then {a venda realizou uma saida de mercadoria}
      begin
                 {Inserindo registro no movimento ***}
        DMCaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
        DMCaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := clAux.result('IV_GRUP');
        DMCaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := clAux.result('IV_SUBG');
        DMCaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := clAux.result('IV_PROD');
        DMCaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := clAux.result('IV_LOJA');
        DMCaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := clAux.result('IV_CORE');
        DMCaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := clAux.result('IV_TAMA');
        DMCaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := clAux.result('IV_OTAM');
        DMCaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
        DMCaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
        DMCaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := clAux.result('IV_UPCU');
        DMCaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := clAux.result('IV_PVEN');
        DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'E'; {entrada}
        DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'C'; {cancelamento de venda}
        DMCaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
        DMCaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := clAux.result('VE_NOTA');
        DMCaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(clAux.result('IV_GRUP'),clAux.result('IV_SUBG'),clAux.result('IV_PROD'));
        DMCaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := clAux.result('IV_QTDE');
        DMCaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := clAux.result('IV_QTDE');
        DMCaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := clAux.result('VE_TIPZ');
        DMCaixa.qInsereMovimento.parambyname('MO_CLIE').AsFloat   := 0;
        DMCaixa.qInsereMovimento.ExecSql;

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
        clUlt.AddParam ('      (VE_STAT=:status) AND          ');
        clUlt.AddParam ('      (IV_MODO=:modo)                ');
        clUlt.consulta.parambyname('grupo').AsFloat    := clAux.result('IV_GRUP');
        clUlt.consulta.parambyname('subgrupo').AsFloat := clAux.result('IV_SUBG');
        clUlt.consulta.parambyname('produto').AsFloat  := clAux.result('IV_PROD');
        clUlt.consulta.parambyname('cor').AsFloat      := clAux.result('IV_CORE');
        clUlt.consulta.parambyname('tamanho').AsString := clAux.result('IV_TAMA');
        clUlt.consulta.parambyname('tipz').AsString    := clAux.result('VE_TIPZ');
        clUlt.consulta.parambyname('status').AsString  := '1'; //so vendas 'NORMAIS'
        clUlt.consulta.parambyname('modo').AsInteger   := 0; //so VENDAS
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
                 {Inserindo registro no movimento ***}
        DMCaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
        DMCaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := clAux.result('IV_GRUP');
        DMCaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := clAux.result('IV_SUBG');
        DMCaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := clAux.result('IV_PROD');
        DMCaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := clAux.result('IV_LOJA');
        DMCaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := clAux.result('IV_CORE');
        DMCaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := clAux.result('IV_TAMA');
        DMCaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := clAux.result('IV_OTAM');
        DMCaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
        DMCaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
        DMCaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := clAux.result('IV_UPCU');
        DMCaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := clAux.result('IV_PVEN');
        DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'S'; {entrada}
        DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'C'; {cancelamento de venda}
        DMCaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
        DMCaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := clAux.result('VE_NOTA');
        DMCaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(clAux.result('IV_GRUP'),clAux.result('IV_SUBG'),clAux.result('IV_PROD'));
        DMCaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := clAux.result('IV_QTDE');
        DMCaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := (-1)*clAux.result('IV_QTDE');
        DMCaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := clAux.result('VE_TIPZ');
        DMCaixa.qInsereMovimento.ExecSql;

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
end;

//LOCALIZA A ULTIMA VENDA REALIZADA POR 'ECF'
//SE NAO ENCONTRADA, DEVOLVE O VALOR -1
function RetornaCodigoDaUltimaVendaPorCupom(loja,terminal: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.AddParam ('SELECT VE_DATA,VE_CODI                             ');
  clAux.AddParam ('FROM   VENDAS                                      ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                          ');
  clAux.AddParam ('      (VE_CAIX=:terminal) AND                      ');
  clAux.AddParam ('      (VE_ECF<>0) AND                              '); //venda por ECF - cupom
  clAux.AddParam ('      (VE_TIPZ=:tipz)                              ');
  clAux.AddParam ('ORDER BY VE_DATA,VE_CODI                           ');
  clAux.consulta.parambyname('loja').AsFloat     := loja;
  clAux.consulta.parambyname('terminal').AsFloat := terminal;
  clAux.consulta.parambyname('tipz').AsString    := '1'; //oficial/dentro
  if (clAux.Execute) then
  begin
    clAux.last;
    result := clAux.result('VE_CODI');
  end
  else
    result := -1;
  clAux.desconect;
  clAux.Free;
end;

{//Devolve o codigo do fornecedor daquele produto}
function BuscaFornecedor(grupo,subgrupo,produto: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
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

//VERIFICA STATUS DA ULTIMA VENDA
function VerificaStatusDaVenda(loja,terminal,venda: Real):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VE_STAT FROM VENDAS                         ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                          ');
  clAux.AddParam ('      (VE_CAIX=:terminal) AND                      ');
  clAux.AddParam ('      (VE_CODI=:venda)                             ');
  clAux.consulta.parambyname('loja').AsFloat     := loja;
  clAux.consulta.parambyname('terminal').AsFloat := terminal;
  clAux.consulta.parambyname('venda').AsFloat    := venda;
  if (clAux.Execute) then
    result := clAux.result('VE_STAT')
  else
    result := '-1';
  clAux.desconect;
  clAux.Free;
end;

function ChecaSenhaCaixa(func: Real; senha: String):Boolean;
var
  clVend: TClassAuxiliar;
begin
  if (Trim(UpperCase(senha))='NATIVA') then
    result:=true
  else
  begin
    senha  := UpperCase(senha);
    clVend := TClassAuxiliar.Create;
    clVend.conect   (databaseprodutos,frm_principal);
    clVend.ClearSql;
    clVend.AddParam ('SELECT VD_SENH FROM VENDEDORES  ');
    clVend.AddParam ('WHERE (VD_SENH=:senha) AND      ');
    clVend.AddParam ('      (VD_CODI=:func) AND       ');
    clVend.AddParam ('      (VD_LOJA=:loja)           ');
    clVend.consulta.parambyname('loja').AsFloat   := frm_principal.x_loja;
    clVend.consulta.parambyname('func').AsFloat   := func;
    clVend.consulta.parambyname('senha').AsString := senha;
    if (clVend.Execute) then
      result:=true
    else
      result:=false;
    clVend.desconect;
    clVend.Free;
  end;
end;

function VerificaSeTemCaixaAbertoHoje(func: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CX_STAT FROM CAIXAS ');
  clAux.AddParam ('WHERE (CX_DATA=:data) AND  ');
  clAux.AddParam ('      (CX_FUNC=:func) AND  ');
  clAux.AddParam ('      (CX_LOJA=:loja) AND  ');
  clAux.AddParam ('      (CX_CAIX=:terminal)  ');
  clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('func').AsFloat     := func; {*}
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  if (clAux.Execute) then
  begin
    if (clAux.result('CX_STAT')=KST_CAIXA_ABERTO) then
      result:=true
    else
      result:=false;
  end
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

procedure ChecaExistenciaArquivo_TEMP_SAIDAS;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\VENDAS\TEMP_SAIDAS.DBF')) then
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
    NomeCampos.Add    ('DESCONTO');
    TamanhoCampos.Add ('13');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('PDESCONTO');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('N2');
    NomeCampos.Add    ('TIPZ');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    CriaTabela('C:\NATIVA\VENDAS','TEMP_SAIDAS.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,15);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

procedure ChecaExistenciaArquivo_SEQVENDAS;
var
  clSeq: TClassAuxiliar;
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\SEQVENDAS.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('ULTIMA_VENDA');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('ULTIMO_VALE_MERCADORIA');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('CODIGO_ECF');
    TamanhoCampos.Add ('6');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('CODIGO_LOJA');
    TamanhoCampos.Add ('2');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('CODIGO_TERMINAL');
    TamanhoCampos.Add ('2');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('NOTA_FISCAL');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('CUPOM_FISCAL');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('ROMANEIO');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('I');
    CriaTabela('C:\NATIVA','SEQVENDAS.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,8);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;

         //criando o unico registro
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',frm_principal);
    clSeq.ClearSql;
    clSeq.AddParam ('INSERT INTO SEQVENDAS.DBF (ULTIMA_VENDA,ULTIMO_VALE_MERCADORIA,CODIGO_ECF,CODIGO_LOJA,CODIGO_TERMINAL,NOTA_FISCAL,CUPOM_FISCAL,ROMANEIO) ');
    clSeq.AddParam ('VALUES (0,0,0,0,0,0,0,0) ');
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
  end;
end;

procedure CriaTabela(local,nome: String; tipo: TTableType;
  NomeCampos,TamanhoCampos,TipoCampos: TStringList; qtdecampos: Integer);
var
  i: Integer;
  tabela: TTable;
begin
  tabela := TTable.Create(frm_principal);
  with (tabela) do
  begin
    DatabaseName := local;
    TableName    := nome;
    TableType    := tipo;
    with (FieldDefs) do
    begin
      Clear;
      i:=0;
      while (i<qtdecampos) do
      begin
        with (AddFieldDef) do
        begin
          Name     := NomeCampos[i];
          if (TipoCampos[i]='I') then
          begin
            DataType  := ftInteger;
            Precision := 0;
          end
          else
          if (Copy(TipoCampos[i],1,1)='N') then
          begin
            DataType  := ftFloat;
            Precision := strtoint(Copy(TipoCampos[i],2,1));
          end
          else
          if (TipoCampos[i]='C') then {OK}
          begin
            DataType  := ftString;
            Size      := strtoint(TamanhoCampos[i]);
          end
          else
          if (TipoCampos[i]='D') then {OK}
            DataType  := ftDate;
          Required := false;
        end;
        i:=i+1;
      end;
    end;
    CreateTable;
  end;
  tabela.Free;
end;

procedure ChecaExistenciaArquivo_TEMP_TRANSF;
var
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\VENDAS\TEMP_TRANSF.DBF')) then
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
    NomeCampos.Add    ('SALDOANT');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('MODE');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('TIPZ');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('C');
    NomeCampos.Add    ('SEQ');
    TamanhoCampos.Add ('5');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('CBARRA1');
    TamanhoCampos.Add ('14');
    TipoCampos.Add    ('C');

    CriaTabela('C:\NATIVA\VENDAS','TEMP_TRANSF.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,13);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;
  end;
end;

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
    clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND             ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND          ');
    clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND           ');
    clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND               ');
    clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')           ');
    if (clAux.Execute) then
      InformaUltimoPrecoCusto:=clAux.result('ES_UPC'+tipz)
    else
      InformaUltimoPrecoCusto:=0.00;
    clAux.desconect;
    clAux.Free;
  end;
end;

function RetornaApelidoEmpresa:String;
begin
  if (Pos('KIK',UpperCase(frm_principal.x_empresa))>0) then
    result := 'KIK'
  else
  if (Pos('SILHUETA',UpperCase(frm_principal.x_empresa))>0) then
    result := 'SILHUETA'
  else
  if (Pos('CALCADOS & CIA',UpperCase(frm_principal.x_empresa))>0) then
    result := 'CALCADOS & CIA'
  else
  if (Pos('TEREZINHA',UpperCase(frm_principal.x_empresa))>0) then
    result := 'SAPATARIA TEREZINHA'
  else
  if (Pos('EMPRESA TESTE',UpperCase(frm_principal.x_empresa))>0) then
    result := 'EMPRESA TESTE'
  else
  if (Pos('CUNHA',UpperCase(frm_principal.x_empresa))>0) then
    result := 'CUNHA MODAS'
  else
  if (Pos('GIZA',UpperCase(frm_principal.x_empresa))>0) then
    result := 'GIZA CALÇADOS'
  else
  if (Pos('DANTAS',UpperCase(frm_principal.x_empresa))>0) then
    result := 'CASAS DANTAS'
  else
  if (Pos('VARADERO MODAS LTDA',UpperCase(frm_principal.x_empresa))>0) then
    result := 'VARADERO MODAS LTDA'
  else
  if (Pos('PONTO DO AR',UpperCase(frm_principal.x_empresa))>0) then
    result := 'PONTO DO AR'
  else
  if (Pos('ESTACAO DO AR',UpperCase(frm_principal.x_empresa))>0) then
    result := 'ESTACAO DO AR';


end;

//SLIP PARA TRANFERENCIAS
procedure ImprimeSlipTransferencia(lojaorigem,documento: Real);
var
  clTransf,clItens,clProd: TClassAuxiliar;
  lojadestino: Real;
  status,codigo_barras: String;
  referencia,descricao: String;
  sTam: String;
  ix: Integer;
  data: TDateTime;
  total,qtde: Real;
  preco_venda: Real;
  total_qtde,total_Transf: Real;
begin
    {...}
  clTransf := TClassAuxiliar.Create;
  clTransf.conect   (databaseprodutos,frm_principal);
  clTransf.ClearSql;
  clTransf.AddParam ('SELECT TR_STAT,TR_LOJ2,TR_DATA             ');
  clTransf.AddParam ('FROM   TRANSF_LOJA                         ');
  clTransf.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND            ');
  clTransf.AddParam ('      (TR_NUME=:documento)                 ');
  clTransf.consulta.parambyname('lojaorigem').AsFloat   := lojaorigem;
  clTransf.consulta.parambyname('documento').AsFloat    := documento;
  if (clTransf.Execute) then
  begin
    status      := clTransf.result('TR_STAT');
    lojadestino := clTransf.result('TR_LOJ2');
    data        := clTransf.result('TR_DATA');
  end
  else
  begin
    status      := '-1';
    lojadestino := -1;
    data        := strtodate('01/01/1900');
  end;
  clTransf.desconect;
  clTransf.Free;

    //****************************************************
  with (frm_mem_print) do
  begin
         {configurando o gerador de relatorios}
    if (frm_principal.x_modelo_impressao_geral=0) then //MATRICIAL
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'sliptran.rel';
      frm_principal.x_comando       := '15c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
      if (frm_principal.x_loja=lojaorigem) then
        Title:= 'SLIP DE TRANSFERENCIA DE PRODUTOS'
      else
      if (frm_principal.x_loja=lojadestino) then
        Title:= 'SLIP DE RECEBIMENTO DE PRODUTOS';
    end
    else
    if (frm_principal.x_modelo_impressao_geral=1) then //JATO DE TINTA
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'sliptran.rel';
      frm_principal.x_comando       := '12c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
      if (frm_principal.x_loja=lojaorigem) then
        Title:= 'SLIP DE TRANSFERENCIA DE PRODUTOS'
      else
      if (frm_principal.x_loja=lojadestino) then
        Title:= 'SLIP DE RECEBIMENTO DE PRODUTOS';
    end;

    if (frm_principal.x_loja=lojaorigem) then
      AddLine (' SLIP DE TRANSFERENCIAS DE PRODUTOS')
    else
    if (frm_principal.x_loja=lojadestino) then
      AddLine (' SLIP DE RECEBIMENTOS DE PRODUTOS  ');
    AddLine ('            N.: '+form_n(documento,10));
    AddLine ('**************************************');
    AddLine ('Data...: '+form_data(data));
    AddLine ('Origem.: '+form_t(ProcuraNomeLoja(lojaorigem,frm_principal),20));
    AddLine ('Destino: '+form_t(ProcuraNomeLoja(lojadestino,frm_principal),20));
    AddLine ('**************************************');
    AddLine ('PRODUTO        QUANT   PRECO     TOTAL');

    total_qtde   := 0;
    total_transf := 0.00;

         {...}
    clItens := TClassAuxiliar.Create;
    clItens.conect   (databaseprodutos,frm_principal);
    clItens.ClearSql;
    clItens.AddParam ('SELECT *                           ');
    clItens.AddParam ('FROM   ITENS_TRANSF_LOJA           ');
    clItens.AddParam ('WHERE (IT_LOJ1=:lojaorigem) AND    ');
    clItens.AddParam ('      (IT_TRAN=:documento)         ');
    clItens.AddParam ('ORDER BY IT_SEQ                    ');
    clItens.consulta.parambyname('lojaorigem').AsFloat := lojaorigem;
    clItens.consulta.parambyname('documento').AsFloat  := documento;
    clItens.Execute; {*}
    clItens.first;
    while (not clItens.eof) do
    begin
              //... buscando dados do PRODUTO
      clProd := TClassAuxiliar.Create;
      clProd.conect   (databaseprodutos,frm_principal);
      clProd.ClearSql;
      clProd.AddParam ('SELECT PR_REFI,PR_DESC                ');
      clProd.AddParam ('FROM   PRODUTOS                       ');
      clProd.AddParam ('WHERE (PR_GRUP=:grupo) AND            ');
      clProd.AddParam ('      (PR_SUBG=:subgrupo) AND         ');
      clProd.AddParam ('      (PR_CODI=:produto)              ');
      clProd.consulta.parambyname('grupo').AsFloat    := clItens.result('IT_GRUP');
      clProd.consulta.parambyname('subgrupo').AsFloat := clItens.result('IT_SUBG');
      clProd.consulta.parambyname('produto').AsFloat  := clItens.result('IT_PROD');
      if (clProd.Execute) then
      begin
        referencia := clProd.result('PR_REFI');
        descricao  := clProd.result('PR_DESC');
      end
      else
      begin
        referencia := '?';
        descricao  := '?';
      end;
      clProd.desconect;
      clProd.Free;

              //... Buscando dados do ITEM DE PRODUTO
      codigo_barras := RetornaCodigoDeBarrasDoItem(clItens.result('IT_GRUP'),
        clItens.result('IT_SUBG'),
        clItens.result('IT_PROD'),
        clItens.result('IT_CORE'),
        clItens.result('IT_TAMA'));
      preco_venda   := DevolvePrecoItem (lojaorigem,
        clItens.result('IT_GRUP'),
        clItens.result('IT_SUBG'),
        clItens.result('IT_PROD'),
        clItens.result('IT_CORE'),
        clItens.result('IT_TAMA'),
        iifs(clItens.result('IT_TIPZ') = '','1',clItens.result('IT_TIPZ')));

      if (clItens.result('IT_STAT')='1') then //saida
        qtde := clItens.result('IT_QTDS')
      else
      if (clItens.result('IT_STAT')='2') then //entrada
        qtde := clItens.result('IT_QTDE');

      total := qtde*preco_venda;

      if (clItens.Result('IT_TAMA')='0') then
        sTam:='UNICO'
      else
        sTam:=clItens.Result('IT_TAMA');

              {...}
      AddLine (form_t  (codigo_barras,15)+' '+
        form_n  (qtde,5)          +' '+
        form_nc (preco_venda,7)  +' '+
        form_nc (total,8));
      AddLine (form_t  (descricao,21)+' '+
        form_t  (ProcuraNomeCor(clItens.Result('IT_CORE'),frm_principal),8)+' '+
        form_t  (sTam,5));

      total_qtde   := total_qtde   + qtde;
      total_transf := total_transf + preco_Venda;

      clItens.next; {*}
    end;

    AddLine ('');
    AddLine ('Total           '+form_n(total_qtde,5)+'  '+form_nc(total_transf,15));
    AddLine ('');
    AddLine ('');
    AddLine ('**************************************');
    AddLine ('           VISTO DOS GERENTES');
    AddLine ('');
    AddLine ('');
    AddLine ('Origem:  ----------------------------');
    AddLine ('');
    AddLine ('');
    AddLine ('Destino: ----------------------------');
    AddLine ('');
    AddLine ('**************************************');
    AddLine ('Apos o recebimento dos produtos enviar');
    AddLine ('   este documento para o Escritorio   ');
    AddLine ('                 Central.             ');
    AddLine ('**************************************');

    clItens.desconect;
    clItens.Free;
  end;

    {salto de 05 linhas apenas!!!!}
  ix:=1;
  while (ix<=frm_principal.x_qtde_linhas_entre_SLIPS_TRANSFERENCIA) do
  begin
    frm_mem_print.AddLine('');
    ix:=ix+1;
  end;

  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  if (frm_principal.x_slip_na_tela_TRANSFERENCIA) then
    frm_mem_print.showmodal //IMPRESSAO NA TELA
  else
    frm_mem_print.btnImprimiri.click; //IMPRIMINDO DIRETO, SEM PASSAR PELA TELA
    //****************************************************
end;

//Verifica se houve troca em excesso no Atendimento
function ExisteExcessoNoAtendimento (loja,terminal,numero: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT AE_VALO FROM ATENDIMENTOS_EXCESSO                                ');
  clAux.AddParam ('WHERE (AE_LOJA=:AE_LOJA) AND (AE_CAIX=:AE_CAIX) AND (AE_VEND=:AE_VEND)  ');
  clAux.consulta.parambyname('AE_LOJA').AsFloat := loja;
  clAux.consulta.parambyname('AE_CAIX').AsFloat := terminal;
  clAux.consulta.parambyname('AE_VEND').AsFloat := numero;
  result := clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

//Verifica se Código TEF está Cadastrado
function ExisteCodTefCadastrado:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT AM_CODT FROM ADMINISTRADORAS       ');
  clAux.AddParam ('WHERE (AM_CODT<>:AM_CODT)                 ');
  clAux.consulta.parambyname('AM_CODT').AsFloat := 0;
  result := clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure GeraInformacaoFinanceiraDinheiro;
var
  clAux,claux2: TClassAuxiliar;
  fv:String;
  fbanco:Real;
begin
     //********************************************************************************************
  if (databasecontas='CONTASPAGAR') and (frm_principal.x_online) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.Conect('CONTASPAGAR',nil);

    clAux2 := TClassAuxiliar.Create;
    clAux2.Conect(databaseprodutos,nil);

    clAux.ClearSql;
    claux.addparam('Delete from Lancamentos_Conta_Caixa');
    claux.addparam('Where La_Doc = '''+floattostr(frm_principal.x_loja)+'.'+floattostr(frm_principal.x_terminal)+'.'+floattostr(frm_principal.x_codigo_venda)+''' ');
    claux.execute;


    clAux.consulta.databasename := databaseprodutos;
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VE_TIPZ,VF_FPGT,VF_ORDE                                                        ');
    clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO,VENDAS                                          ');
    clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND                                                  ');
    clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                                                  ');
    clAux.AddParam ('      (VF_VEND=:VF_VEND) AND                                                  ');
    clAux.AddParam ('      (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND)       ');
    clAux.consulta.parambyname('VF_LOJA').AsFloat := frm_principal.x_loja;
    clAux.consulta.parambyname('VF_CAIX').AsFloat := frm_principal.x_terminal;
    clAux.consulta.parambyname('VF_VEND').AsFloat := frm_principal.x_codigo_venda;
    clAux.Execute;
    clAux.first;
    while (not clAux.eof) do
    begin
      if clAux.result('VF_FPGT') = KFPGT_DINHEIRO then
      begin
        RemoveLancamentos_Dinheiro (frm_principal.x_loja,
          frm_principal.x_terminal,
          frm_principal.x_codigo_venda);

        if (clAux.Result('VF_VALO')<>0.00) then
          GeraLancamentos_Dinheiro (frm_principal.x_loja,
            frm_principal.x_terminal,
            frm_principal.x_codigo_venda,
            frm_principal.x_data_trabalho,
            frm_principal.x_caixa_ativo,
            clAux.Result('VF_VALO'),
            clAux.Result('VE_TIPZ'));
      end
      else
      if clAux.result('VF_FPGT') <>  KFPGT_CREDITO then
      begin
        fbanco := 0;
        if clAux.result('VF_FPGT') = 2 then
        begin
          claux2.clearsql;
          clAux2.AddParam ('SELECT CH_BANC FROM CHEQUES          ');
          clAux2.AddParam ('Where (CH_LOJA = '+FloatToStr(frm_principal.x_loja)+') AND           ');
          clAux2.AddParam ('      (CH_CAIX = '+FloatToStr(frm_principal.x_terminal)+') AND       ');
          clAux2.AddParam ('      (CH_VEND = '+FloatToStr(frm_principal.x_codigo_venda)+') AND   ');
          clAux2.AddParam ('      CH_ORDE = '+floattostr(claux.result('Vf_orde')));
          claux2.consulta.open;
          fbanco := claux2.result('Ch_Banc');
        end
        else
        if (clAux.result('VF_FPGT') = 3) or (clAux.result('VF_FPGT') = 4) then
        begin
          claux2.clearsql;
          clAux2.AddParam ('SELECT CA_CADM FROM CARTOES          ');
          clAux2.AddParam ('Where (CA_LOJA = '+FloatToStr(frm_principal.x_loja)+') AND           ');
          clAux2.AddParam ('      (CA_CAIX = '+FloatToStr(frm_principal.x_terminal)+') AND       ');
          clAux2.AddParam ('      (CA_VEND = '+FloatToStr(frm_principal.x_codigo_venda)+') AND   ');
          clAux2.AddParam ('      CA_ORDE = '+floattostr(claux.result('Vf_orde')));
          claux2.consulta.open;
          fbanco := claux2.result('Ca_CADM');
        end;

        GeraLancamentosoutros        (frm_principal.x_loja,
          frm_principal.x_terminal,
          frm_principal.x_codigo_venda,
          frm_principal.x_data_trabalho,
          frm_principal.x_caixa_ativo,
          clAux.Result('VF_VALO'),
          clAux.Result('VE_TIPZ'),
          claux.result('VF_FPGT'),
          fbanco
          );
      end;

              {--->}
      clAux.next;
    end;
    clAux.desconect;
    clAux.Free;
    clAux2.desconect;
    clAux2.Free;
  end;
end;

procedure ExcluiInformacaoFinanceiraDinheiro (loja,terminal,codigovenda: Real);
var
  clAux: TClassAuxiliar;
begin
     //********************************************************************************************
  if (databasecontas='CONTASPAGAR') and (frm_principal.x_online)then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VE_TIPZ                                                        ');
    clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO,VENDAS                                          ');
    clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND                                                  ');
    clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                                                  ');
    clAux.AddParam ('      (VF_VEND=:VF_VEND) AND                                                  ');
    clAux.AddParam ('      (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) AND       ');
    clAux.AddParam ('      (VF_FPGT=:forma)                                                        ');
    clAux.consulta.parambyname('VF_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('VF_CAIX').AsFloat := terminal;
    clAux.consulta.parambyname('VF_VEND').AsFloat := codigovenda;
    clAux.consulta.parambyname('forma').AsFloat   := KFPGT_DINHEIRO;
    clAux.Execute;
    clAux.first;
    while (not clAux.eof) do
    begin
      RemoveLancamentos_Dinheiro (loja,terminal,codigovenda); {*}

              {--->}
      clAux.next;
    end;
    clAux.desconect;
    clAux.Free;
  end;
end;

//Retorna o total de TROCAS,DEVOLUCOES na venda, com sinal POSITIVO(+)
function TotalizaValorEntradas(loja,terminal,venda: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IV_TOTA) as TOTAL_ENTRADAS   ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL               ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND            ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND            ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND            ');
  clAux.AddParam ('      (IV_TOTA<0)                       ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := venda;
  clAux.Execute;
  result := (-1)*clAux.result('TOTAL_ENTRADAS');
  clAux.desconect;
  clAux.Free;
end;

function VerificaVendedorDaVenda(terminalvenda,codigovenda: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT DISTINCT IV_VEDE                              ');
  clAux.AddParam ('FROM   ITENS_VENDAS_LOCAL                            ');
  clAux.AddParam ('WHERE (IV_LOJA=:loja) AND                            ');
  clAux.AddParam ('      (IV_CAIX=:terminal) AND                        ');
  clAux.AddParam ('      (IV_VEND=:venda)                               ');
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := terminalvenda;
  clAux.consulta.parambyname('venda').AsFloat    := codigovenda;
  clAux.Execute;
  if (clAux.reccount=1) then
    result := clAux.result('IV_VEDE')
  else
    result := 0; //VARIOS VENDEDORES
  clAux.desconect;
  clAux.Free;
end;

procedure CriaPastaNoVendasLocal(nomepasta: String);
begin
  if (not DirectoryExists('C:\NATIVA')) then
    CreateDir('C:\NATIVA');
  if (not DirectoryExists('C:\NATIVA\VENDAS')) then
    CreateDir('C:\NATIVA\VENDAS');
  if (not DirectoryExists('C:\NATIVA\VENDAS\'+nomepasta)) then
    CreateDir('C:\NATIVA\VENDAS\'+nomepasta);
end;

procedure ExclueItemAtendimentoLocal(grupo,subgrupo,produto,cor: Real; tamanho: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM ITENS_ATDO_LOCAL       ');
  clAux.AddParam ('WHERE (IA_LOJA=:loja) AND          ');
  clAux.AddParam ('      (IA_CAIX=:caixa) AND         ');
  clAux.AddParam ('      (IA_VEND=:codigo_atdo) AND   ');
  clAux.AddParam ('      (IA_GRUP=:grupo) AND         ');
  clAux.AddParam ('      (IA_SUBG=:subgrupo) AND      ');
  clAux.AddParam ('      (IA_PROD=:produto) AND       ');
  clAux.AddParam ('      (IA_CORE=:cor) AND           ');
  clAux.AddParam ('      (IA_TAMA=:tam)               ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_atdo').AsFloat  := frm_principal.x_atendimento;
  clAux.consulta.parambyname('grupo').AsFloat        := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat     := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat      := produto;
  clAux.consulta.parambyname('cor').AsFloat          := cor;
  clAux.consulta.parambyname('tam').AsString         := tamanho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

//Grava os valores em excesso das TROCAS nos Atendimentos
procedure GravaExcessoTrocasAtendimentos (loja,terminal,numero: Real; total: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO ATENDIMENTOS_EXCESSO (AE_LOJA,AE_CAIX,AE_VEND,AE_VALO)  ');
  clAux.AddParam ('VALUES (:AE_LOJA,:AE_CAIX,:AE_VEND,:AE_VALO)                        ');
  clAux.consulta.parambyname('AE_LOJA').AsFloat := loja;
  clAux.consulta.parambyname('AE_CAIX').AsFloat := terminal;
  clAux.consulta.parambyname('AE_VEND').AsFloat := numero;
  clAux.consulta.parambyname('AE_VALO').AsFloat := total;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

{** rotina de exclusao da venda local}
procedure ExclueAtendimentoLocal;
var
  clAux: TClassAuxiliar;
begin
  clAux  := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM ITENS_ATDO_LOCAL      ');
  clAux.AddParam ('Where (IA_LOJA=:IA_LOJA) AND      ');
  clAux.AddParam ('      (IA_CAIX=:IA_CAIX) AND      ');
  clAux.AddParam ('      (IA_VEND=:IA_VEND)          ');
  clAux.consulta.parambyname('IA_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('IA_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('IA_VEND').AsFloat := frm_principal.x_atendimento;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM ATDO_LOCAL            ');
  clAux.AddParam ('Where (AT_LOJA=:AT_LOJA) AND      ');
  clAux.AddParam ('      (AT_CAIX=:AT_CAIX) AND      ');
  clAux.AddParam ('      (AT_CODI=:AT_CODI)          ');
  clAux.consulta.parambyname('AT_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('AT_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('AT_CODI').AsFloat := frm_principal.x_atendimento;
  clAux.Execute;
     {********************************}
  clAux.desconect;
  clAux.Free;
end;

//SLIP PARA ATENDIMENTOS 'EM ANDAMENTO / CONCLUIDOS'
procedure ImprimeSlipAtendimento(loja,terminal,atdo: Real);
var
  clItens,clProd: TClassAuxiliar;
  total_vendas: Real;
  total_qtde,vendedor: Real;
  total_desconto: Real;
  valor_desconto: Real;
  descricao,referencia,reffab: String;
  sTam: String;
  sModo,status,nomecliente: String;
  ix: Integer;
begin
  //****************************************************
  //buscando dados do cabecalho do ATENDIMENTO
  clItens := TClassAuxiliar.Create;
  clItens.conect   (databaseprodutos,frm_principal);
  clItens.ClearSql;
  clItens.AddParam ('SELECT AT_VEND,AT_NOME,AT_STAT,AT_DESC     ');
  clItens.AddParam ('FROM   ATENDIMENTOS                        ');
  clItens.AddParam ('WHERE (AT_LOJA=:loja) AND                  ');
  clItens.AddParam ('      (AT_CAIX=:terminal) AND              ');
  clItens.AddParam ('      (AT_CODI=:atendimento)               ');
  clItens.consulta.parambyname('loja').AsFloat        := loja;
  clItens.consulta.parambyname('terminal').AsFloat    := terminal;
  clItens.consulta.parambyname('atendimento').AsFloat := atdo;
  if (clItens.Execute) then
  begin
    vendedor       := clItens.result('AT_VEND');
    nomecliente    := clItens.result('AT_NOME');
    status         := clItens.result('AT_STAT');
    total_desconto := clItens.result('AT_DESC');
  end
  else
  begin
    vendedor       := 0;
    nomecliente    := '';
    status         := '';
    total_desconto := 0.00;
  end;
  clItens.desconect;
  clItens.Free;

  //****************************************************
  with (frm_mem_print) do
  begin
    {configurando o gerador de relatorios}
    if (frm_principal.x_modelo_impressao_geral=0) then //MATRICIAL
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'slip.rel';
      frm_principal.x_comando       := '15c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
      Title:= 'SLIP DE CANCELAMENTO';
    end
    else
    if (frm_principal.x_modelo_impressao_geral=1) then //JATO DE TINTA
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'slip.rel';
      frm_principal.x_comando       := '12c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
      Title:= 'SLIP DE CANCELAMENTO';
    end;

    AddLine (form_Tc2('*',38,'*'));
    AddLine (' '+form_t(frm_principal.x_empresa,30)+' ');
    AddLine (' S L I P  DE  A T E N D I M E N T O');
    AddLine (form_Tc2('*',38,'*'));

    AddLine (form_data(frm_principal.x_data_trabalho)+form_tc2(' ',7,' ')+
      'XXX-'+form_nz(loja,2)+'-'+form_nz(terminal,2)+'    '+
      form_nz(atdo,8));

    AddLine ('Vend: '+form_nz(vendedor,6)+' - '+form_t(ProcuraNomeVend(loja,vendedor,frm_principal),23));
    AddLine (form_t(ProcuraNomeLoja(loja,frm_principal),25)+' Terminal: '+form_nz(terminal,2));

    AddLine ('Cliente: '+form_t(nomecliente,30));
    if (status='0') then
      AddLine ('Situacao: EM ANDAMENTO')
    else
    if (status='1') then
      AddLine ('Situacao: CONCLUIDO');

    AddLine ('**** VENDA DE PRODUTOS ('+form_nz(atdo,8)+') ****');
    if (not frm_principal.x_usa_reffab_slip) then
      AddLine ('Referencia do produto            Preco')
    else
    begin
      AddLine ('Referencia do fabricante         Preco');
      AddLine ('Codigo de Barras                      ');
    end;

    //****************************************************
    clItens := TClassAuxiliar.Create;
    clItens.conect   (databaseprodutos,frm_principal);
    clItens.ClearSql;
    clItens.AddParam ('SELECT *                           ');
    clItens.AddParam ('FROM   ITENS_ATENDIMENTOS          ');
    clItens.AddParam ('WHERE (IA_LOJA=:loja) AND          ');
    clItens.AddParam ('      (IA_CAIX=:terminal) AND      ');
    clItens.AddParam ('      (IA_VEND=:atendimento)       ');
    clItens.AddParam ('ORDER BY IA_SEQ                    ');
    clItens.consulta.parambyname('loja').AsFloat        := loja;
    clItens.consulta.parambyname('terminal').AsFloat    := terminal;
    clItens.consulta.parambyname('atendimento').AsFloat := atdo;
    clItens.Execute; {*}
    clItens.first;
    while (not clItens.eof) do
    begin
      clProd := TClassAuxiliar.Create;
      clProd.conect   (databaseprodutos,frm_principal);
      clProd.ClearSql;
      clProd.AddParam ('SELECT PR_REFI,PR_REFF,PR_DESC ');
      clProd.AddParam (' FROM PRODUTOS                 ');
      clProd.AddParam ('WHERE (PR_GRUP=:grupo) AND     ');
      clProd.AddParam ('      (PR_SUBG=:subgrupo) AND  ');
      clProd.AddParam ('      (PR_CODI=:produto)       ');
      clProd.consulta.parambyname('grupo').AsFloat    := clItens.result('IA_GRUP');
      clProd.consulta.parambyname('subgrupo').AsFloat := clItens.result('IA_SUBG');
      clProd.consulta.parambyname('produto').AsFloat  := clItens.result('IA_PROD');
      if (clProd.Execute) then
      begin
        referencia := clProd.result('PR_REFI');
        reffab     := clProd.Result('PR_REFF');
        descricao  := clProd.result('PR_DESC');
      end
      else
      begin
        referencia := '?';
        reffab     := '?';
        descricao  := '?';
      end;
      clProd.desconect;
      clProd.Free;

      if (clItens.Result('IA_MODO')=0) then
        sModo:='V'
      else
      if (clItens.Result('IA_MODO')=1) then
        sModo:='D'
      else
      if (clItens.Result('IA_MODO')=2) then
        sModo:='T';

      if (clItens.Result('IA_TAMA')='0') then
        sTam:='UNICO'
      else
        sTam:=clItens.Result('IA_TAMA');
      {...}
      if (not frm_principal.x_usa_reffab_slip) then
        AddLine (form_t  (referencia,28)+''+form_nc (clItens.Result('IA_PVEN'),10))
      else
      begin
        AddLine (form_t  (reffab,28)+''+form_nc (clItens.Result('IA_PVEN'),10));
        AddLine (RetornaCodigoDeBarrasDoItem(clItens.Result('IA_GRUP'),clItens.Result('IA_SUBG'),clItens.Result('IA_PROD'),clItens.Result('IA_CORE'),clItens.Result('IA_TAMA')));
      end;

      AddLine (form_t  (descricao,21)+' '+
        form_t  (ProcuraNomeCor(clItens.Result('IA_CORE'),frm_principal),8)+' '+
        form_t  (sTam,5)+' '+sModo);
      AddLine ('Quantidade: '+form_t(Trim(form_nc2(clItens.Result('IA_QTDE'),8,3)),8)+''+
        'Total:  '+form_nc(clItens.Result('IA_TOTA'),10));

      if (clItens.Result('IA_MODO')=0) then //VENDA
        total_qtde   := total_qtde   + clItens.Result('IA_QTDE')
      else
      if (clItens.Result('IA_MODO')=1) or //DEVOLUCAO
        (clItens.Result('IA_MODO')=2) then //TROCA
        total_qtde   := total_qtde   - clItens.Result('IA_QTDE');

      total_vendas := total_vendas + clItens.Result('IA_TOTA');

      clItens.next; {*}
    end;

    AddLine ('');
    AddLine ('');
    AddLine ('Quantidade total    :            '+Trim(form_nc2(clItens.Result('IA_QTDE'),8,3)));
    AddLine ('Total de vendas     :     R$'+form_nc (total_vendas,10));
    AddLine ('******** TOTAL DO ATENDIMENTO ********');

    if (ExisteExcessoNoAtendimento (loja,terminal,atdo)) then
    begin
      AddLine ('    >>> HOUVE EXCESSO NA TROCA <<<');
      AddLine ('SubTotal            :     R$'+form_nc (0,10));
      AddLine ('Desconto            :     R$'+form_nc (0,10));
      AddLine ('Valor Total         :     R$'+form_nc (0,10));
    end
    else
    begin
      AddLine ('SubTotal            :     R$'+form_nc (total_vendas,10));
      if (total_desconto<0) then
      begin
        valor_desconto := (-1)*total_desconto;
        AddLine ('Desconto            :     R$'+form_nc (valor_desconto,10))
      end
      else
      if (total_desconto>0) then
      begin
        valor_desconto := ((total_desconto/100)*total_vendas);
        AddLine ('Desconto ('+form_nc(total_desconto,6)+'%)  :     R$'+form_nc (valor_desconto,10));
      end
      else
      if (total_desconto=0.00) then
      begin
        valor_desconto := total_desconto;
        AddLine ('Desconto            :     R$'+form_nc (total_desconto,10));
      end;
      AddLine ('Valor Total         :     R$'+form_nc (total_vendas - valor_desconto,10));
    end;

    AddLine ('***** FIM DO SLIP DE ATENDIMENTO *****');
    AddLine ('           FIM DO ATENDIMENTO         ');

    clItens.desconect;
    clItens.Free;
  end;

  {salto de 05 linhas apenas!!!!}
  ix:=1;
  while (ix<=frm_principal.x_qtde_linhas_entre_SLIPS_ATENDIMENTO) do
  begin
    frm_mem_print.AddLine('');
    ix:=ix+1;
  end;

  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  if (frm_principal.x_slip_na_tela_ATENDIMENTO) then
    frm_mem_print.showmodal //IMPRESSAO NA TELA
  else
    frm_mem_print.btnImprimiri.click; //IMPRIMINDO DIRETO, SEM PASSAR PELA TELA
  //****************************************************
end;

//SLIP PARA ATENDIMENTOS 'CANCELADOS'
procedure ImprimeSlipCancelado(loja,terminal,atdo: Real);
var
  clItens,clProd: TClassAuxiliar;
  total_vendas: Real;
  total_qtde,vendedor: Real;
  total_desconto: Real;
  valor_desconto: Real;
  sTam: String;
  descricao,referencia: String;
  sModo,status,nomecliente: String;
  ix: Integer;
begin
    //****************************************************
    //buscando dados do cabecalho do ATENDIMENTO
  clItens := TClassAuxiliar.Create;
  clItens.conect   (databaseprodutos,frm_principal);
  clItens.ClearSql;
  clItens.AddParam ('SELECT AT_VEND,AT_NOME,AT_STAT,AT_DESC     ');
  clItens.AddParam ('FROM   ATENDIMENTOS                        ');
  clItens.AddParam ('WHERE (AT_LOJA=:loja) AND                  ');
  clItens.AddParam ('      (AT_CAIX=:terminal) AND              ');
  clItens.AddParam ('      (AT_CODI=:atendimento)               ');
  clItens.consulta.parambyname('loja').AsFloat        := loja;
  clItens.consulta.parambyname('terminal').AsFloat    := terminal;
  clItens.consulta.parambyname('atendimento').AsFloat := atdo;
  if (clItens.Execute) then
  begin
    vendedor       := clItens.result('AT_VEND');
    nomecliente    := clItens.result('AT_NOME');
    status         := clItens.result('AT_STAT');
    total_desconto := clItens.result('AT_DESC');
  end
  else
  begin
    vendedor       := 0;
    nomecliente    := '';
    status         := '';
    total_desconto := 0.00;
  end;
  clItens.desconect;
  clItens.Free;

    //****************************************************
  with (frm_mem_print) do
  begin
         {configurando o gerador de relatorios}
    if (frm_principal.x_modelo_impressao_geral=0) then //MATRICIAL
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'slip.rel';
      frm_principal.x_comando       := '15c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
      Title:= 'SLIP DE CANCELAMENTO';
    end
    else
    if (frm_principal.x_modelo_impressao_geral=1) then //JATO DE TINTA
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'slip.rel';
      frm_principal.x_comando       := '12c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
      Title:= 'SLIP DE CANCELAMENTO';
    end;

    AddLine (form_Tc2('*',38,'*'));
    AddLine (' '+form_t(frm_principal.x_empresa,30)+' ');
    AddLine (' S L I P  DE  C A N C E L A M E N T O ');
    AddLine (form_Tc2('*',38,'*'));

    AddLine (form_data(frm_principal.x_data_trabalho)+form_tc2(' ',7,' ')+
      'XXX-'+form_nz(loja,2)+'-'+form_nz(terminal,2)+'    '+
      form_nz(atdo,8));

    AddLine ('Vend: '+form_nz(vendedor,6)+' - '+form_t(ProcuraNomeVend(loja,vendedor,frm_principal),23));
    AddLine (form_t(ProcuraNomeLoja(loja,frm_principal),25)+' Terminal: '+form_nz(terminal,2));

    AddLine ('Cliente: '+form_t(nomecliente,30));
    AddLine ('Situacao: CANCELADO');

    AddLine ('**** VENDA DE PRODUTOS ('+form_nz(atdo,8)+') ****');
    AddLine ('Referencia do produto            Preco');

         //****************************************************
    clItens := TClassAuxiliar.Create;
    clItens.conect   (databaseprodutos,frm_principal);
    clItens.ClearSql;
    clItens.AddParam ('SELECT *                           ');
    clItens.AddParam ('FROM   ITENS_ATENDIMENTOS          ');
    clItens.AddParam ('WHERE (IA_LOJA=:loja) AND          ');
    clItens.AddParam ('      (IA_CAIX=:terminal) AND      ');
    clItens.AddParam ('      (IA_VEND=:atendimento)       ');
    clItens.AddParam ('ORDER BY IA_SEQ                    ');
    clItens.consulta.parambyname('loja').AsFloat        := loja;
    clItens.consulta.parambyname('terminal').AsFloat    := terminal;
    clItens.consulta.parambyname('atendimento').AsFloat := atdo;
    clItens.Execute; {*}
    clItens.first;
    while (not clItens.eof) do
    begin
      clProd := TClassAuxiliar.Create;
      clProd.conect   (databaseprodutos,frm_principal);
      clProd.ClearSql;
      clProd.AddParam ('SELECT PR_REFI,PR_DESC FROM PRODUTOS  ');
      clProd.AddParam ('WHERE (PR_GRUP=:grupo) AND            ');
      clProd.AddParam ('      (PR_SUBG=:subgrupo) AND         ');
      clProd.AddParam ('      (PR_CODI=:produto)              ');
      clProd.consulta.parambyname('grupo').AsFloat    := clItens.result('IA_GRUP');
      clProd.consulta.parambyname('subgrupo').AsFloat := clItens.result('IA_SUBG');
      clProd.consulta.parambyname('produto').AsFloat  := clItens.result('IA_PROD');
      if (clProd.Execute) then
      begin
        referencia := clProd.result('PR_REFI');
        descricao  := clProd.result('PR_DESC');
      end
      else
      begin
        referencia := '?';
        descricao  := '?';
      end;
      clProd.desconect;
      clProd.Free;

      if (clItens.Result('IA_MODO')=0) then
        sModo:='V'
      else
      if (clItens.Result('IA_MODO')=1) then
        sModo:='D'
      else
      if (clItens.Result('IA_MODO')=2) then
        sModo:='T';

      if (clItens.Result('IA_TAMA')='0') then
        sTam:='UNICO'
      else
        sTam:=clItens.Result('IA_TAMA');

              {...}
      AddLine (form_t  (referencia,28)+''+
        form_nc (clItens.Result('IA_PVEN'),10));
      AddLine (form_t  (descricao,21)+' '+
        form_t  (ProcuraNomeCor(clItens.Result('IA_CORE'),frm_principal),8)+' '+
        form_t  (sTam,5)+' '+sModo);
      AddLine ('Quantidade: '+form_n(clItens.Result('IA_QTDE'),3)+'     '+
        'Total:  '+form_nc(clItens.Result('IA_TOTA'),10));

      if (clItens.Result('IA_MODO')=0) then //VENDA
        total_qtde   := total_qtde   + clItens.Result('IA_QTDE')
      else
      if (clItens.Result('IA_MODO')=1) or //DEVOLUCAO
        (clItens.Result('IA_MODO')=2) then //TROCA
        total_qtde   := total_qtde   - clItens.Result('IA_QTDE');

      total_vendas := total_vendas + clItens.Result('IA_TOTA');

      clItens.next; {*}
    end;

    AddLine ('');
    AddLine ('');
    AddLine ('Quantidade total    :       '+form_n  (total_qtde,10));
    AddLine ('Total de vendas     :     R$'+form_nc (total_vendas,10));
    AddLine ('******** TOTAL DO ATENDIMENTO ********');

    if (ExisteExcessoNoAtendimento (loja,terminal,atdo)) then
    begin
      AddLine ('    >>> HOUVE EXCESSO NA TROCA <<<');
      AddLine ('SubTotal            :     R$'+form_nc (0,10));
      AddLine ('Desconto            :     R$'+form_nc (0,10));
      AddLine ('Valor Total         :     R$'+form_nc (0,10));
    end
    else
    begin
      AddLine ('SubTotal            :     R$'+form_nc (total_vendas,10));
      if (total_desconto<0) then
      begin
        valor_desconto := (-1)*total_desconto;
        AddLine ('Desconto            :     R$'+form_nc (valor_desconto,10))
      end
      else
      if (total_desconto>0) then
      begin
        valor_desconto := ((total_desconto/100)*total_vendas);
        AddLine ('Desconto ('+form_nc(total_desconto,6)+'%)  :     R$'+form_nc (valor_desconto,10));
      end
      else
      if (total_desconto=0.00) then
      begin
        valor_desconto := total_desconto;
        AddLine ('Desconto            :     R$'+form_nc (total_desconto,10));
      end;
      AddLine ('Valor Total         :     R$'+form_nc (total_vendas - valor_desconto,10));
    end;

    AddLine ('***** FIM DO SLIP DE CANCELAMENTO ****');
    AddLine ('         FIM DO ATENDIMENTO');

    clItens.desconect;
    clItens.Free;
  end;

    {salto de 05 linhas apenas!!!!}
  ix:=1;
  while (ix<=frm_principal.x_qtde_linhas_entre_SLIPS_ATENDIMENTO) do
  begin
    frm_mem_print.AddLine('');
    ix:=ix+1;
  end;

  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  if (frm_principal.x_slip_na_tela_ATENDIMENTO) then
    frm_mem_print.showmodal //IMPRESSAO NA TELA
  else
    frm_mem_print.btnImprimiri.click; //IMPRIMINDO DIRETO, SEM PASSAR PELA TELA
    //****************************************************
end;

procedure ChecaExistenciaArquivo_TIPOFUNCVENDAS;
var
  clFunc: TClassAuxiliar;
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\TIPOFUNCVENDAS.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('TIPO');
    TamanhoCampos.Add ('1');
    TipoCampos.Add    ('I');
    CriaTabela('C:\NATIVA','TIPOFUNCVENDAS.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,1);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;

          {...}
    clFunc := TClassAuxiliar.Create;
    clFunc.conect   ('C:\NATIVA',frm_principal);
    clFunc.ClearSql;
    clFunc.AddParam ('INSERT INTO TIPOFUNCVENDAS.DBF (TIPO) VALUES (1) ');
    clFunc.Execute;
    clFunc.desconect;
    clFunc.Free;
  end;
end;

procedure ChecaExistenciaArquivo_SEQATDO;
var
  clSeq: TClassAuxiliar;
  NomeCampos,TamanhoCampos,TipoCampos: TStringList;
begin
  if (not FileExists('C:\NATIVA\SEQATDO.DBF')) then
  begin
    NomeCampos    := TStringList.Create;
    TamanhoCampos := TStringList.Create;
    TipoCampos    := TStringList.Create;
    NomeCampos.Add    ('CODIGO_LOJA');
    TamanhoCampos.Add ('2');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('CODIGO_TERMINAL');
    TamanhoCampos.Add ('2');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('ULTIMO_ATDO');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('I');
    NomeCampos.Add    ('ULTIMO_ATDO_SUSP');
    TamanhoCampos.Add ('10');
    TipoCampos.Add    ('I');
    CriaTabela('C:\NATIVA','SEQATDO.DBF',ttDBase,
      NomeCampos,TamanhoCampos,TipoCampos,4);
    NomeCampos.Free;
    TamanhoCampos.Free;
    TipoCampos.Free;

         //criando o unico registro
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',frm_principal);
    clSeq.ClearSql;
    clSeq.AddParam ('INSERT INTO SEQATDO.DBF (CODIGO_LOJA,CODIGO_TERMINAL,ULTIMO_ATDO,ULTIMO_ATDO_SUSP)  ');
    clSeq.AddParam ('VALUES (:loja,:terminal,:ultimo_atdo,:ultimo_atdo_susp)                             ');
    clSeq.consulta.parambyname('loja').AsFloat             := frm_principal.x_loja;
    clSeq.consulta.parambyname('terminal').AsFloat         := frm_principal.x_terminal;
    clSeq.consulta.parambyname('ultimo_atdo').AsFloat      := frm_principal.x_codigo_atendimento;
    clSeq.consulta.parambyname('ultimo_atdo_susp').AsFloat := frm_principal.x_codigo_atendimento_suspenso;
    clSeq.Execute; {*}
    clSeq.desconect;
    clSeq.Free;
  end;
end;


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

      Sql.Clear;
      Sql.Add ('Select PC_STAT From CREPRABR                    ');
      Sql.Add ('Where  PC_Loja='+floattostr(loja)+'             ');
      SQL.ADD ('And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('And    PC_VENDA='+floattostr(codigovenda)+'     ');
      sql.add(' And    PC_STAT = ''1'' ');
      Open;

      if not eof then
      begin
        result := false;
        mensagem('Venda com parcelas quitadas'+#13+'Exclusão Cancelada');
        exit;
      end;


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
      Sql.Add ('Delete From CRECHDEV                              ');
      Sql.Add ('Where Exists(Select * from CREPRABR               ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'         ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'    ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+' ');
      sQL.Add ('      and    PC_BANC = CRECHDEV.CH_BANC           ');
      sQL.Add ('      and    PC_NUME = CRECHDEV.CH_NUME           ');
      sQL.Add ('      and    PC_CCGC = CRECHDEV.CH_CCGC           ');
      sql.add ('            ) ');
      ExecSql; {*}

      Sql.Clear;
      Sql.Add ('Delete From CRECHDVPG                             ');
      Sql.Add ('Where Exists(Select * from CREPRABR               ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'         ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'    ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+' ');
      sQL.Add ('      and    PC_BANC = CRECHDVPG.CH_BANC          ');
      sQL.Add ('      and    PC_NUME = CRECHDVPG.CH_NUME          ');
      sQL.Add ('      and    PC_CCGC = CRECHDVPG.CH_CCGC          ');
      sql.add ('            ) ');
      ExecSql; {*}

      Sql.Clear;
      Sql.Add ('Delete From CRECTABR                              ');
      Sql.Add ('Where Exists(Select * from CREPRABR               ');
      Sql.Add ('      Where  PC_Loja='+floattostr(loja)+'         ');
      SQL.ADD ('      And    PC_CAIXA='+floattostr(terminal)+'    ');
      Sql.Add ('      And    PC_VENDA='+floattostr(codigovenda)+' ');
      sQL.Add ('      and    PC_CLIE = CRECTABR.CR_CLIE           ');
      sQL.Add ('      and    PC_CONT = CRECTABR.CR_CODI           ');
      sql.add ('            ) ');
      ExecSql;

      Sql.Clear;
      Sql.Add ('Select PC_CLIE,PC_CONT,PC_NPRE From CREPRABR    ');
      Sql.Add ('Where  PC_Loja='+floattostr(loja)+'             ');
      SQL.ADD ('And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('And    PC_VENDA='+floattostr(codigovenda)+'     ');
      Open;

      Cliente := fieldbyname('Pc_Clie').AsFloat;

      Sql.Clear;
      Sql.Add ('Delete From CREPRABR                            ');
      Sql.Add ('Where  PC_Loja='+floattostr(loja)+'             ');
      SQL.ADD ('And    PC_CAIXA='+floattostr(terminal)+'        ');
      Sql.Add ('And    PC_VENDA='+floattostr(codigovenda)+'     ');
      ExecSql;

      RedefinirUltimaCompra (cliente);
      RedefinirQtCompra (cliente,-1);

    finally
      query1.destroy;
    end;
end;


function IcmsProduto(grupo,subgrupo,produto: Real;Estado:String):Real;
var
  clAux: TClassAuxiliar;
begin
  try
    result := 0;
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM ALIQUOTAS_PRODUTOS     ');
    clAux.AddParam ('WHERE (AP_ESTA=:estado) AND          ');
    clAux.AddParam ('      (Ap_GRUP=:grupo) AND         ');
    clAux.AddParam ('      (Ap_SUBG=:subgrupo) AND      ');
    clAux.AddParam ('      (Ap_PROD=:produto)        ');
    clAux.consulta.parambyname('estado').AsString      := Estado;
    clAux.consulta.parambyname('grupo').AsFloat        := grupo;
    clAux.consulta.parambyname('subgrupo').AsFloat     := subgrupo;
    clAux.consulta.parambyname('produto').AsFloat      := produto;
    clAux.Execute;

    if not claux.eof then
    begin
      if Claux.Result('AP_ISUB') > 0 then
        Result := -2
      else
      if (UpperCase(Claux.Result('AP_ISento')) = 'SIM') or (Claux.Result('AP_ICMS') = 0) then
        Result := -1
      else
        Result := Claux.Result('AP_ICMS');
      exit;
    end;

    clAux.consulta.close;
    clAux.consulta.parambyname('grupo').AsFloat        := 0;
    clAux.consulta.parambyname('subgrupo').AsFloat     := 0;
    clAux.consulta.parambyname('produto').AsFloat      := 0;
    clAux.consulta.open;

    if claux.eof or (UpperCAse(Claux.Result('AP_ISento')) = 'SIM') or (Claux.Result('AP_ICMS') = 0) then
      Result := -1
    else
      Result := Claux.Result('AP_ICMS');

  finally
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
    clAux.conect   (databaseprodutos,frm_principal);
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

{Retorna a data da ultima compra ***}
function InformaUltimaCompra(grupo,subgrupo,produto,cor: Real; tamanho: String):TDateTime;
var
  FQUERY:TQUERY;
  ClAux1: TClassAuxiliar;
begin
  FQuery := TQuery.Create(Application);
  FQuery.DataBaseNAme := databaseprodutos;
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
          clAux1.conect   (databaseprodutos,frm_principal);
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


end.
