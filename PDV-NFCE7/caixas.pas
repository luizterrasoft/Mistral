unit caixas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers;

{*** Funcoes relacionadas com o caixa ***}
function ProximaVenda(loja,caixa: Real):Real;
function InformaAliqICMS(estado: String):Real;
procedure SaidaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real; faixa: String; cor: Real; qtde: Real);
function DevolvePrecoItem (loja: Real; grupo,subgrupo,produto: Real; faixa: String; cor: Real):Real;
procedure AtualizaUltimaVenda_Estoque(grupo,subgrupo,produto: Real; faixa: String; cor: Real; data: TDateTime; tipz: String);
procedure AtualizaUltimaVenda_Estoque_Loja(grupo,subgrupo,produto: Real; faixa: String; cor,loja: Real; data: TDateTime; tipz: String);
procedure AtualizaUltimaVenda_Produto(grupo,subgrupo,produto: Real; data: TDateTime; tipz: String);
procedure ExclueVendaLocal;
procedure ExcluePagamentosLocal;
procedure ExclueItemVendaLocal(grupo,subgrupo,produto,cor: Real; tamanho: String);
function ReformataCodigoBarras(codigo_barras: String):String;
function RetornaTamanhoCodigoBarrasConfigurado:Integer;
function DevolveCodTam(grupo,subgrupo,produto: Real; n_tam: String):Integer;
function  FormataNomeItemProduto (n_produto: String; n_cor: Real; n_tam: String):String;
function FormataCodigoBarras(grupo,subgrupo,produto,cor: Real; tamanho: String):String;
function InformaRefFabric(grupo,subgrupo,produto: Real):String;
procedure VerificaExistenciaDoRegistroESTOQUE(grupo,subgrupo,produto,cor: Real; tamanho: String);
procedure VerificaExistenciaDoRegistroESTOQUE_LOJA(grupo,subgrupo,produto,cor: Real; tamanho: String;
  loja: Real);

implementation

uses auxiliar, funcoes1, funcoes2, procura, principal, DM8, itensestoque, itensestoqueloja, DM2;

{Informa o codigo da proxima venda ***}
function  ProximaVenda(loja,caixa: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux:= TClassAuxiliar.Create;
  clAux.conect ('CAIXA',frm_principal);
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
  clAux.conect   ('ESTOQUE',frm_principal);
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

procedure SaidaItemEstoque (loja: Real; tipz: String; grupo,subgrupo,produto: Real;
  faixa: String; cor: Real; qtde: Real);
begin
  if (grupo<>0) and (subgrupo<>0)   and (produto<>0) and
    (cor<>-1)  and (faixa<>'-1') and (tipz<>'')   and
    (loja<>0) then
  begin
         {*** Saldo do item}
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
    DMCaixa.qDiminueSaldo.ExecSql;
  end;
end;

{???? - De inicio, so esta fornecendo o preco oficial - tipz='1'}
function DevolvePrecoItem (loja: Real; grupo,subgrupo,produto: Real;
  faixa: String; cor: Real):Real;
var
  clAux: TClassAuxiliar;
begin
     {1o nivel de procura de preco - TABELAS_PRECOS}
  clAux := TClassAuxiliar.Create;
  clAux.conect ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select IP_PRE1,IP_PRE2                          ');
  clAux.AddParam ('From TABELAS_PRECOS,ITENS_TABELAS_PRECOS        ');
  clAux.AddParam ('Where (IP_LOJA='+floattostr(loja)+') AND        ');
  clAux.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND       ');
  clAux.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND    ');
  clAux.AddParam ('      (IP_PROD='+floattostr(produto)+') AND     ');
  clAux.AddParam ('      (IP_CORE='+floattostr(cor)+') AND         ');
  clAux.AddParam ('      (IP_TAMA='+chr(39)+faixa+chr(39)+') AND   ');
  clAux.AddParam ('      (IP_LOJA=TP_LOJA) AND                     ');
  clAux.AddParam ('      (IP_TABE=TP_CODI) AND                     ');
  clAux.AddParam ('      (TP_DAT1<='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+') AND ');
  clAux.AddParam ('      (TP_DAT2>='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+')     ');
  if (clAux.Execute) then
    result := clAux.result('IP_PRE1')
  else
  begin
         {2o nivel de procura de preco - ESTOQUE_LOJA}
    clAux.ClearSql;
    clAux.AddParam ('Select *                                        ');
    clAux.AddParam ('From ESTOQUE_LOJA                               ');
    clAux.AddParam ('Where (EL_LOJA='+floattostr(loja)+') AND        ');
    clAux.AddParam ('      (EL_GRUP='+floattostr(grupo)+') AND       ');
    clAux.AddParam ('      (EL_SUBG='+floattostr(subgrupo)+') AND    ');
    clAux.AddParam ('      (EL_PROD='+floattostr(produto)+') AND     ');
    clAux.AddParam ('      (EL_CORE='+floattostr(cor)+') AND         ');
    clAux.AddParam ('      (EL_TAMA='+chr(39)+faixa+chr(39)+')       ');
    if (clAux.Execute) then
      result := clAux.result('EL_PVE1')
    else
      result := 0.00;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure AtualizaUltimaVenda_Estoque(grupo,subgrupo,produto: Real;
  faixa: String; cor: Real; data: TDateTime; tipz: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect ('ESTOQUE',frm_principal);
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

procedure AtualizaUltimaVenda_Estoque_Loja(grupo,subgrupo,produto: Real;
  faixa: String; cor,loja: Real; data: TDateTime; tipz: String);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam('UPDATE ESTOQUE_LOJA                            ');
  if (tipz='1') then
    clAux.AddParam('SET EL_ULC1=:data           ')
  else
  if (tipz='2') then
    clAux.AddParam('SET EL_ULC2=:data      ');
  clAux.AddParam('WHERE (EL_GRUP='+floattostr(grupo)+') AND      ');
  clAux.AddParam('      (EL_SUBG='+floattostr(subgrupo)+') AND   ');
  clAux.AddParam('      (EL_PROD='+floattostr(produto)+') AND    ');
  clAux.AddParam('      (EL_CORE='+floattostr(cor)+') AND        ');
  clAux.AddParam('      (EL_TAMA='+chr(39)+faixa+chr(39)+') AND  ');
  clAux.AddParam('      (EL_LOJA='+floattostr(loja)+')           ');
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
  clAux.conect   ('ESTOQUE',frm_principal);
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
  clAux.conect('CAIXA',frm_principal);
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
  clAux.AddParam ('DELETE FROM PAGAMENTOS_A_VISTA_LOCAL ');
  clAux.AddParam ('Where (PV_LOJA=:PV_LOJA) AND         ');
  clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND         ');
  clAux.AddParam ('      (PV_VEND=:PV_VEND)             ');
  clAux.consulta.parambyname('PV_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('PV_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('PV_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CARTOES_LOCAL          ');
  clAux.AddParam ('Where (CA_LOJA=:CA_LOJA) AND      ');
  clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
  clAux.AddParam ('      (CA_VEND=:CA_VEND)          ');
  clAux.consulta.parambyname('CA_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CA_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CA_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CHEQUES_LOCAL          ');
  clAux.AddParam ('Where (CH_LOJA=:CH_LOJA) AND      ');
  clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND      ');
  clAux.AddParam ('      (CH_VEND=:CH_VEND)          ');
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
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND      ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND      ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)          ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VF_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.desconect;
  clAux.Free;
end;

{** rotina de exclusao da venda local}
procedure ExcluePagamentosLocal;
var
  clAux: TClassAuxiliar;
begin
  clAux  := TClassAuxiliar.Create;
  clAux.conect('CAIXA',frm_principal);
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM PAGAMENTOS_A_VISTA_LOCAL ');
  clAux.AddParam ('Where (PV_LOJA=:PV_LOJA) AND         ');
  clAux.AddParam ('      (PV_CAIX=:PV_CAIX) AND         ');
  clAux.AddParam ('      (PV_VEND=:PV_VEND)             ');
  clAux.consulta.parambyname('PV_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('PV_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('PV_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CARTOES_LOCAL          ');
  clAux.AddParam ('Where (CA_LOJA=:CA_LOJA) AND      ');
  clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
  clAux.AddParam ('      (CA_VEND=:CA_VEND)          ');
  clAux.consulta.parambyname('CA_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CA_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CA_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CHEQUES_LOCAL          ');
  clAux.AddParam ('Where (CH_LOJA=:CH_LOJA) AND      ');
  clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND      ');
  clAux.AddParam ('      (CH_VEND=:CH_VEND)          ');
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
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND      ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND      ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)          ');
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
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(ESPACO) as TAMANHO ');
  clAux.AddParam ('FROM CONFIG_CODIGO_BARRAS     ');
  clAux.Execute;
  result:=clAux.result('TAMANHO');
  clAux.desconect;
  clAux.Free;
end;

procedure ExclueItemVendaLocal(grupo,subgrupo,produto,cor: Real; tamanho: String);
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
  clAux.AddParam ('      (IV_TAMA=:tam)               ');
  clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat        := frm_principal.x_terminal;
  clAux.consulta.parambyname('codigo_venda').AsFloat := frm_principal.x_venda;
  clAux.consulta.parambyname('grupo').AsFloat        := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat     := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat      := produto;
  clAux.consulta.parambyname('cor').AsFloat          := cor;
  clAux.consulta.parambyname('tam').AsString         := tamanho;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

{* Rotina muito usada em PEDIDOS,ENTRADAS,OUTRAS ENTRADAS,OUTRAS SAIDAS,TRANSFERENCIAS,etc...}
procedure VerificaExistenciaDoRegistroESTOQUE(grupo,subgrupo,produto,cor: Real; tamanho: String);
var
  clEstoque: TClassItensEstoque;
begin
  clEstoque := TClassItensEstoque.Create;
  clEstoque.conect   ('ESTOQUE',frm_principal);
  clEstoque.ClearSql;
  clEstoque.AddParam ('Select * From ESTOQUE                           ');
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
  clEstoque.inES_OTAM := InformaOrdemTamanho(grupo,
    subgrupo,
    produto,
    tamanho);
  clEstoque.inES_DESC := FormataNomeItemProduto(form_nz(grupo,2)+
    form_nz(subgrupo,2)+
    form_nz(produto,4),
    cor,tamanho);
  if (not clEstoque.Execute) then
  begin
    clEstoque.inES_CBAR := FormataCodigoBarras(grupo,subgrupo,produto,cor,tamanho);
    clEstoque.inES_REFF := InformaRefFabric(grupo,subgrupo,produto);
    clEstoque.Insert;
  end;
  clEstoque.desconect;
  clEstoque.Free;
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

{Retorna o codigo do tamanho para geracao dos codigos de barras ***}
{Como os tamanhos sao 'strings' ocorre que os codigos de barras geram um inteiro}
function DevolveCodTam(grupo,subgrupo,produto: Real; n_tam: String):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.AddParam ('SELECT PF_TAMA,PF_SEQ         ');
  clAux.AddParam ('FROM   PRODUTOS_FAIXAS        ');
  clAux.AddParam ('WHERE (PF_TAMA=:pf_tama) AND  ');
  clAux.AddParam ('      (PF_GRUP=:pf_grupo) AND ');
  clAux.AddParam ('      (PF_SUBG=:pf_subg) AND  ');
  clAux.AddParam ('      (PF_PROD=:pf_prod)      ');
  clAux.consulta.parambyname('pf_tama').AsString := n_tam;
  clAux.consulta.parambyname('pf_grupo').AsFloat := grupo;
  clAux.consulta.parambyname('pf_subg').AsFloat := subgrupo;
  clAux.consulta.parambyname('pf_prod').AsFloat := produto;
  if (clAux.Execute) then
    result := clAux.result('PF_SEQ')
  else
    result := -1;
  clAux.desconect;
  clAux.Free;
end;

end.
