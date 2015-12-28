unit procura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers, dbTables,funcoesglobais;

{***}
function  ProcuraNomeSit (codigo: String; componente: TComponent):String;
function  ProcuraNomeLoja       (codigo: Real; componente: TComponent):String;
function  ProcuraNomeGruposProdutos (codigo: Real; componente: TComponent):String;
function  ProcuraNomeSubgruposProdutos (grupo,codigo: Real;componente: TComponent):String;
function  ProcuraNomeCor (codigo: Real; componente: TComponent):String;
function  ProcuraNomeForn       (codigo: Real; componente: TComponent):String;
function  ProcuraNomeItemEstoque (n_grupo,n_subgrupo,n_produto,n_cor: Real; n_tam: String;  componente: TComponent):String;
function  ProcuraAbrevCor(codigo: Real; componente: TComponent):String;
function  ProcuraNomeVend (loja,codigo: Real; componente: TComponent;sovendedor:Boolean=false):String;
function  ProcuraApelVend (loja,codigo: Real; componente: TComponent):String;
function  ProcuraNomeVendCaixa (loja,codigo: Real; componente: TComponent):String;
function  ProcuraNomeFormaPgto(codigo: Real; componente: TComponent):String;
function  ProcuraNomeFormaPrestacao(codigo: Real; componente: TComponent):String;
function  ProcuraNomeAdm(codigo: Real; tipo: Integer; componente: TComponent):String;
function  ProcuraNomeClienteCpf (cpf: String;  componente: TComponent):String;
function  ProcuraNomeClienteCod (codigo: Real; componente: TComponent):String;
function  ProcuraTipoPlano       (codigo: Real; componente: TComponent):String;
function  ProcuraNomeCaixa (loja,codigo: Real; componente: TComponent):String;
function  ProcuraNomeUsuario (codigo: Real; componente: TComponent):String;
function  ProcuraNomeBanco (codigo: Real; componente: TComponent):String;
function  ProcuraNomeConta       (codigo: Real; componente: TComponent):String;
function  ProcuraNomeTipoValor(codigotipo: Real):String;
function  InformaOrdemTamanho(grupo,subgrupo,produto: Real;tam: String):Integer;
function  ProcuraNomeProdutos_1 (grupo,subgrupo,produto: Real; componente: TComponent):String;
function  ProcuraNomePortador  (codigo: Real; componente: TComponent):String;
function  ProcuraNomeEntidade(codigo: Real;
  database: String; entidade: String; labelentidade: String;
  campo1: String; campo2: String; componente: TComponent):String;
function  ProcuraNomeMotivoSuspensAtdo(codigo: Real; componente: TComponent):String;
function  ProcuraNomeLinha(codigo: Real; componente: TComponent):String;
function  ProcuraNomeColecao(codigo: Real; componente: TComponent):String;
function  ProcuraReferencia (grupo,subgrupo,produto: Real; componente: TComponent):String;
function  ProcuraReferenciaFabricante (grupo,subgrupo,produto: Real; componente: TComponent):String;

function  ChamandoF8Lojas:String;
procedure ChamandoF8GruposProdutos(y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8SubGrupos (y_edit: TObject; grupo: Real; cadastro: Boolean);
procedure ChamandoF8Produtos_2(y_edit: TObject; grupo,subgrupo: Real; cadastro: Boolean);
procedure ChamandoF8Faixas (y_edit: TObject; grupo,subgrupo,produto: Real; cadastro: Boolean);
procedure ChamandoF8CoresProdutos (grupo,subgrupo,produto: Real; y_edit: TObject);
procedure ChamandoF8Cores (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8Forn (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8FormaPgto (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8FormaPgto_2 (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8FormaPgto_3 (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8Vend (loja: Real; y_edit: TObject;cadastro:Boolean=false;altera:Boolean=false);
procedure ChamandoF8Caixa (loja: Real; y_edit: TObject);
procedure ChamandoF8TodosFuncionarios (loja: Real; y_edit: TObject);
procedure ChamandoF8Contas (y_edit: TObject; natureza: String);
procedure ChamandoF8TipoValor (y_edit: TObject);
procedure ChamandoF8MotivosSuspensAtdo (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8SubGrupos2 (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8Linhas (y_edit: TObject; cadastro: Boolean);
procedure ChamandoF8Colecoes (y_edit: TObject; cadastro: Boolean);


{... - Relativos ao CEP}
procedure ProcuraCep (cep: String; edt1,edt2,edt3,cb1: TObject);
procedure ChamandoF8Cep (edit_x: TObject);


implementation

uses principal, funcoes2, funcoes1, loja, f8GruposProdutos, f8SubGrupos, DM1,
  grupos_produtos, f8Produtos2, un_F8Faixas, un_F8Cores, cores, f8forn,un_F8MtvSuspensAtdo, 
  auxiliar, un_F8FormaPgto, cliente, plano, F8Vend,
  un_F8CoresProdutos, f8Contas, un_CaixaLancamentos_F8TipoValor, un_F8FormaPgto2,
  un_F8Linhas, un_F8Colecoes, un_F8FormaPgto3;

{Esta funcao facilita na busca apenas do nome da loja ***}
{Ideal para relatorios secundarios e preenchimento de paineis nos cadastros}
function  ProcuraNomeLoja       (codigo: Real; componente: TComponent):String;
var
  clLoja: TClassLoja;
begin
  if (codigo=0) then
    ProcuraNomeLoja := '<loja nao cadastrada>'
  else
  begin
    clLoja := TClassLoja.Create;
    with (clLoja) do
    begin
      conect   (databasecredito,componente);
      AddParam ('Select LO_CODI,LO_NOME                      ');
      AddParam ('From CRELOJA                                ');
      AddParam ('Where (LO_CODI='+floattostr(codigo)+')      ');
      if (not Execute) then
        ProcuraNomeLoja := '<loja nao cadastrada>'
      else
        ProcuraNomeLoja := Result('LO_NOME');
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8GruposProdutos(y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8GruposProdutos) do
  begin
    left:=287;
    top :=76;
    edit:=y_edit;
    showmodal;
  end;
end;

procedure ChamandoF8SubGrupos (y_edit: TObject; grupo: Real; cadastro: Boolean);
begin
  with (frm_f8SubGrupos) do
  begin
    DMF8.qSubGruposF8.close;
    DMF8.qSubGruposF8.sql.clear;
    DMF8.qSubGruposF8.sql.Add ('SELECT SG_GRUP,SG_CODI,SG_DESC ');
    DMF8.qSubGruposF8.sql.Add ('FROM    SUBGRUPOS_PRODUTOS ');
    DMF8.qSubGruposF8.sql.Add ('WHERE (SG_GRUP=:grupo) ');
    DMF8.qSubGruposF8.sql.Add ('ORDER BY SG_DESC ');
    DMF8.qSubGruposF8.parambyname('grupo').AsFloat := grupo;
    DMF8.qSubGruposF8.open;
    left:=287;
    top :=76;
    edit:=y_edit;
    caption:='Procurar por subgrupo do grupo..: '+ProcuraNomeGruposProdutos (grupo,frm_principal);
    showmodal;
  end;
end;

{Procura o nome do grupo}
function  ProcuraNomeGruposProdutos (codigo: Real; componente: TComponent):String;
var
  clGrupo: TClassGruposProdutos;
begin
  if (codigo=0) then
    ProcuraNomeGruposProdutos := '<Grupo não cadastrado>'
  else
  begin
    clGrupo := TClassGruposProdutos.Create;
    with (clGrupo) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select GR_CODI,GR_DESC                   ');
      AddParam ('From   GRUPOS_PRODUTOS                   ');
      AddParam ('Where (GR_CODI='+floattostr(codigo)+')   ');
      if (not Execute) then
        ProcuraNomeGruposProdutos := '<Grupo não cadastrado>'
      else
        ProcuraNomeGruposProdutos := Result('GR_DESC');
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8Produtos_2(y_edit: TObject; grupo,subgrupo: Real; cadastro: Boolean);
begin
  with (frm_f8Produtos2) do
  begin
    DMF8.qProdutos2F8.close;
    DMF8.qProdutos2F8.parambyname('grupo').AsFloat    := grupo;
    DMF8.qProdutos2F8.parambyname('subgrupo').AsFloat    := subgrupo;
    DMF8.qProdutos2F8.open;
    left:=100;
    top :=76;
    edit:=y_edit;
    caption:='Procurar por produto do subgrupo..: '+
      ProcuraNomeSubgruposProdutos (grupo,subgrupo,frm_principal);
    showmodal;
  end;
end;

function ProcuraNomeSubgruposProdutos (grupo,codigo: Real;componente: TComponent):String;
var
  clGrupo: TClassGruposProdutos;
begin
  if (codigo=0) or (grupo=0) then
    ProcuraNomeSubgruposProdutos := '<SubGrupo não cadastrado>'
  else
  begin
    clGrupo := TClassGruposProdutos.Create;
    with (clGrupo) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select SG_GRUP,SG_CODI,SG_DESC             ');
      AddParam ('From   SUBGRUPOS_PRODUTOS                  ');
      AddParam ('Where (SG_GRUP='+floattostr(grupo)+') AND  ');
      AddParam ('      (SG_CODI='+floattostr(codigo)+')     ');
      if (not Execute) then
        ProcuraNomeSubgruposProdutos := '<SubGrupo não cadastrado>'
      else
        ProcuraNomeSubgruposProdutos := Result('SG_DESC');
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8Faixas (y_edit: TObject; grupo,subgrupo,produto: Real;
  cadastro: Boolean);
begin
  with (frm_f8Faixas) do
  begin
    DMF8.qFaixasF8.close;
    DMF8.qFaixasF8.parambyname('grupo').AsFloat    := grupo;
    DMF8.qFaixasF8.parambyname('subgrupo').AsFloat := subgrupo;
    DMF8.qFaixasF8.parambyname('produto').AsFloat  := produto;
    DMF8.qFaixasF8.open;
    left:=287;
    top :=76;
    edit:=y_edit;
    showmodal;
  end;
end;

procedure ChamandoF8Cores (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8Cores) do
  begin
    left:=287;
    top :=76;
    edit:=y_edit;
    showmodal;
  end;
end;

function  ProcuraNomeCor (codigo: Real; componente: TComponent):String;
var
  clCor: TClassCores;
begin
  if (codigo=-1) then
    ProcuraNomeCor := '<Cor não cadastrada>'
  else
  begin
    clCor := TClassCores.Create;
    with (clCor) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select CR_CODI,CR_DESC                  ');
      AddParam ('From   CORES                            ');
      AddParam ('Where (CR_CODI='+floattostr(codigo)+')  ');
      if (not Execute) then
        ProcuraNomeCor := '<Cor não cadastrada>'
      else
        ProcuraNomeCor := Result('CR_DESC');
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8Forn (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8Forn) do
  begin
    left:=287;
    top :=76;
    edit:=y_edit;
    showmodal;
  end;
end;

{Procura o nome do fornecedor}
function  ProcuraNomeForn       (codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomeForn := '<Fornecedor não cadastrado>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databasecontas,componente);
      AddParam ('Select FO_CODI,FO_RAZA                     ');
      AddParam ('From   FORNECEDORES                        ');
      AddParam ('Where (FO_CODI='+floattostr(codigo)+')     ');
      if (not Execute) then
        ProcuraNomeForn := '<Fornecedor não cadastrado>'
      else
        ProcuraNomeForn := Result('FO_RAZA');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeItemEstoque (n_grupo,n_subgrupo,n_produto,n_cor: Real; n_tam: String;
  componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  clAux:=TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select ES_DESC                                            ');
  clAux.AddParam ('From ESTOQUE                                              ');
  clAux.AddParam ('Where  (ES_GRUP='+floattostr(n_grupo)+') AND              ');
  clAux.AddParam ('       (ES_PROD='+floattostr(n_produto)+') AND            ');
  clAux.AddParam ('       (ES_SUBG='+floattostr(n_subgrupo)+') AND           ');
  clAux.AddParam ('       (ES_CORE='+floattostr(n_cor)+') AND                ');
  clAux.AddParam ('       (ES_TAMA='+chr(39)+n_tam+chr(39)+')                ');
  if (clAux.Execute) then
    ProcuraNomeItemEstoque:=clAux.result('ES_DESC')
  else
    ProcuraNomeItemEstoque:='<Item de estoque não encontrado>';
  clAux.desconect;
  clAux.Free;
end;

function  ProcuraAbrevCor(codigo: Real; componente: TComponent):String;
var
  clCor: TClassCores;
begin
  if (codigo=-1) then
    ProcuraAbrevCor := '<Cor não cadastrada>'
  else
  begin
    clCor := TClassCores.Create;
    with (clCor) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select CR_CODI,CR_ABRV                   ');
      AddParam ('From   CORES                             ');
      AddParam ('Where (CR_CODI='+floattostr(codigo)+')   ');
      if (not Execute) then
        ProcuraAbrevCor := '<Cor não cadastrada>'
      else
        ProcuraAbrevCor := Result('CR_ABRV');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeVend (loja,codigo: Real; componente: TComponent;sovendedor:Boolean=false):String;
var
  clVend: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomeVend := '<Vendedor não cadastrado>'
  else
  begin
    clVend := TClassAuxiliar.Create;
    with (clVend) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select VD_CODI,VD_NOME                      ');
      AddParam ('From   VENDEDORES                           ');
      AddParam ('Where (VD_LOJA='+floattostr(loja)+') AND    ');
      AddParam ('      (VD_CODI='+floattostr(codigo)+')      ');
//            AddParam ('      (VD_STAT='+chr(39)+'1'+chr(39)+')     ');
      if sovendedor then
        AddParam('And (VD_CARG='+chr(39)+'VENDEDOR COMUM'+chr(39)+')  ');
      if (not Execute) then
        ProcuraNomeVend := '<Vendedor não cadastrado>'
      else
        ProcuraNomeVend := Result('VD_NOME');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeVendCaixa (loja,codigo: Real; componente: TComponent):String;
var
  clVend: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomeVendCaixa := '<Operador não cadastrado>'
  else
  begin
    clVend := TClassAuxiliar.Create;
    with (clVend) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select VD_CODI,VD_NOME                       ');
      AddParam ('From   VENDEDORES                            ');
      AddParam ('Where (VD_LOJA='+floattostr(loja)+') AND     ');
      AddParam ('      (VD_CODI='+floattostr(codigo)+') AND   ');
      AddParam ('      (VD_STAT='+chr(39)+'1'+chr(39)+') AND  ');
      AddParam ('      (VD_CARG='+chr(39)+'OPERADOR DE CAIXA'+chr(39)+') ');
      if (not Execute) then
        ProcuraNomeVendCaixa := '<Operador não cadastrado>'
      else
        ProcuraNomeVendCaixa := Result('VD_NOME');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraApelVend (loja,codigo: Real; componente: TComponent):String;
var
  clVend: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraApelVend := '<Vendedor não cadastrado>'
  else
  begin
    clVend := TClassAuxiliar.Create;
    with (clVend) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select VD_CODI,VD_APEL                      ');
      AddParam ('From   VENDEDORES                           ');
      AddParam ('Where (VD_LOJA='+floattostr(loja)+') AND    ');
      AddParam ('      (VD_CODI='+floattostr(codigo)+') AND  ');
      AddParam ('      (VD_STAT='+chr(39)+'1'+chr(39)+')     ');
      if (not Execute) then
        ProcuraApelVend := '<Vendedor não cadastrado>'
      else
        ProcuraApelVend := Result('VD_APEL');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeFormaPgto(codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    ProcuraNomeFormaPgto := '<Forma de pgto. não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   ('VENDAS',componente);
      AddParam ('Select FO_CODI,FO_DESC                  ');
      AddParam ('From   FORMAS_PAGAMENTO                 ');
      AddParam ('Where (FO_CODI='+floattostr(codigo)+')  ');
      if (not Execute) then
        ProcuraNomeFormaPgto := '<Forma de pgto. não cadastrada>'
      else
        ProcuraNomeFormaPgto := Result('FO_DESC');
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8FormaPgto (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8FormaPgto) do
  begin
    left:=50;
    top :=82;
    edit:=y_edit;
    showmodal;
  end;
end;

procedure ChamandoF8FormaPgto_3 (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8FormaPgto3) do
  begin
    left:=50;
    top :=82;
    edit:=y_edit;
    btnCadastro.visible:=false;
    showmodal;
  end;
end;


procedure ChamandoF8FormaPgto_2 (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8FormaPgto2) do
  begin
    left:=50;
    top :=82;
    edit:=y_edit;
    showmodal;
  end;
end;

function  ProcuraNomeAdm(codigo: Real; tipo: Integer; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    ProcuraNomeAdm := ''
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select AM_CODI,AM_DESC                      ');
      AddParam ('From   ADMINISTRADORAS                      ');
      AddParam ('Where (AM_CODI='+floattostr(codigo)+') AND  ');
      AddParam ('      (AM_TIPO='+inttostr(tipo)+')          ');
      if (not Execute) then
        ProcuraNomeAdm := ''
      else
        ProcuraNomeAdm := Result('AM_DESC');
      desconect;
      Free;
    end;
  end;
end;

{Procura o nome do cliente pelo CPF}
function  ProcuraNomeClienteCpf (cpf: String;  componente: TComponent):String;
var
  clClie: TClassCliente;
begin
  if (Trim(cpf)='') then
    ProcuraNomeClienteCpf := '<Cliente não cadastrado>'
  else
  begin
    clClie := TClassCliente.Create;
    with (clClie) do
    begin
      Conect   (databasecredito,componente);
      AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_FONE    ');
      AddParam ('From CRECLI                              ');
      AddParam ('Where (CL_CPF='+chr(39)+cpf+chr(39)+')   ');
      if (not Execute) then
        ProcuraNomeClienteCpf := '<Cliente não cadastrado>'
      else
        ProcuraNomeClienteCpf := Result('CL_NOME');
      desconect;
      Free;
    end;
  end;
end;

{Procura o nome do cliente pelo Codigo}
function  ProcuraNomeClienteCod (codigo: Real; componente: TComponent):String;
var
  clClie: TClassCliente;
begin
  if (codigo=0) then
    ProcuraNomeClienteCod := '<Cliente não cadastrado>'
  else
  begin
    clClie := TClassCliente.Create;
    with (clClie) do
    begin
      Conect   (databasecredito,componente);
      AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_FONE    ');
      AddParam ('From CRECLI                              ');
      AddParam ('Where (CL_CODI='+floattostr(codigo)+')   ');
      if (not Execute) then
        ProcuraNomeClienteCod := '<Cliente não cadastrado>'
      else
        ProcuraNomeClienteCod := Result('CL_NOME');
      desconect;
      Free;
    end;
  end;
end;

{Funcao que facilita a busca do tipo do plano ***}
function ProcuraTipoPlano       (codigo: Real; componente: TComponent):String;
var
  clPlano: TClassPlano;
begin
  if (codigo=0) then
    ProcuraTipoPlano := '<Plano nao cadastrado>'
  else
  begin
    clPlano := TClassPlano.Create;
    with (clPlano) do
    begin
      conect   (databasecredito, componente);
      ClearSql;
      AddParam ('Select PL_CODI,PL_TIPO                      ');
      AddParam ('From CREDPLANO                              ');
      AddParam ('where (PL_CODI='+floattostr(codigo)+')      ');
      if (not Execute) then
        ProcuraTipoPlano := '<Plano não cadastrado>'
      else
        ProcuraTipoPlano := Result('PL_TIPO');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeSit (codigo: String; componente: TComponent):String;
var
  clSit: TClassAuxiliar;
begin
  if (codigo='') then
    ProcuraNomeSit := '<Situação nao cadastrada>'
  else
  begin
    clSit := TClassAuxiliar.Create;
    with (clSit) do
    begin
      conect   ('VENDAS',componente);
      AddParam ('Select SI_CODI,SI_DESC                      ');
      AddParam ('From   SITUACOES_CAIXA                      ');
      AddParam ('Where (SI_CODI='+chr(39)+codigo+chr(39)+')  ');
      if (not Execute) then
        ProcuraNomeSit := '<Situação nao cadastrada>'
      else
        ProcuraNomeSit := Result('SI_DESC');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeCaixa (loja,codigo: Real; componente: TComponent):String;
var
  clCaixa: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomeCaixa := '<Caixa nao cadastrado>'
  else
  begin
    clCaixa := TClassAuxiliar.Create;
    with (clCaixa) do
    begin
      conect   ('VENDAS',componente);
      AddParam ('Select CX_LOJA,CX_CODI,CX_DESC           ');
      AddParam ('From   CAIXAS                            ');
      AddParam ('Where (CX_LOJA='+floattostr(loja)+') AND ');
      AddParam ('      (CX_CODI='+floattostr(codigo)+')   ');
      if (not Execute) then
        ProcuraNomeCaixa := '<Caixa nao cadastrado>'
      else
        ProcuraNomeCaixa := Result('CX_DESC');
      desconect;
      Free;
    end;
  end;
end;

{Procura o nome do usuario pelo Codigo}
function  ProcuraNomeUsuario (codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomeUsuario := '<Usuário não cadastrado>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databasecredito,componente);
      AddParam ('Select USCODE,USNAME                     ');
      AddParam ('From   USERS                             ');
      AddParam ('Where (USCODE='+floattostr(codigo)+')    ');
      if (not Execute) then
        ProcuraNomeUsuario := '<Usuário não cadastrado>'
      else
        ProcuraNomeUsuario := Result('USNAME');
      desconect;
      Free;
    end;
  end;
end;

function InformaOrdemTamanho(grupo,subgrupo,produto: Real;tam: String):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
     //clAux.conect   (databaseprodutos,frm_principal);
  clAux.Conect('VENDAS',frm_principal);
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
    result:=-1;
  clAux.desconect;
  clAux.Free;
end;

function  ProcuraNomeBanco (codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomeBanco := ''
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databasecontas,componente);
      AddParam ('Select BA_CODI,BA_NOME                   ');
      AddParam ('From   BANCOS                            ');
      AddParam ('Where (BA_CODI='+floattostr(codigo)+')   ');
      if (not Execute) then
        ProcuraNomeBanco := ''
      else
        ProcuraNomeBanco := Result('BA_NOME');
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8Vend (loja: Real; y_edit: TObject;cadastro:Boolean=false;altera:Boolean=false);
begin
  with (frm_f8Vend) do
  begin
    left:=100;
    top :=76;
    edit:=y_edit;
    y_loja:=loja;
    if (loja=0) then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.dataset).sql.Add('select VD_LOJA,VD_CODI,VD_NOME,VD_APEL,VD_CARG from vendedores   ');
      TQuery(ds.dataset).sql.Add('where (VD_CARG='+chr(39)+'VENDEDOR COMUM'+chr(39)+') AND         ');
      TQuery(ds.dataset).sql.Add('      (VD_STAT='+chr(39)+'1'+chr(39)+')                          ');
      TQuery(ds.dataset).sql.Add('order by VD_NOME                                                 ');
      TQuery(ds.dataset).open;
      label2.caption  := 'Procurar por Vendedor - Todas as Lojas: ';
      label12.caption := 'Procurar por Vendedor - Todas as Lojas: ';
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.dataset).sql.Add('select VD_LOJA,VD_CODI,VD_NOME,VD_APEL,VD_CARG from vendedores   ');
      TQuery(ds.dataset).sql.Add('where (VD_LOJA=:loja) AND                                        ');
      TQuery(ds.dataset).sql.Add('      (VD_CARG='+chr(39)+'VENDEDOR COMUM'+chr(39)+') AND         ');
      TQuery(ds.dataset).sql.Add('      (VD_STAT='+chr(39)+'1'+chr(39)+')                          ');
      TQuery(ds.dataset).sql.Add('order by VD_NOME                                                 ');
      TQuery(ds.dataset).parambyname('loja').AsFloat := y_loja;
      TQuery(ds.dataset).open;
      label2.caption  := 'Procurar por Vendedor - Loja: '+form_nz(frm_principal.x_loja,2);
      label12.caption := 'Procurar por Vendedor - Loja: '+form_nz(frm_principal.x_loja,2);
    end;
    showmodal;
  end;
end;

function  ProcuraNomeProdutos_1 (grupo,subgrupo,produto: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select PR_DESC                                     ');
  clAux.AddParam ('From PRODUTOS                                      ');
  clAux.AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND          ');
  clAux.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND       ');
  clAux.AddParam ('      (PR_CODI='+floattostr(produto)+')            ');
  if (clAux.Execute) then
    ProcuraNomeProdutos_1 := clAux.result('PR_DESC')
  else
    ProcuraNomeProdutos_1 := '<Produto não cadastrado>';
  clAux.desconect;
  clAux.Free;
end;

procedure ChamandoF8CoresProdutos (grupo,subgrupo,produto: Real; y_edit: TObject);
begin
  if (grupo<>0) and (subgrupo<>0) and (produto<>0) then
    with (frm_f8CoresProdutos) do
    begin
           //pnProduto.caption := ' '+ProcuraNomeProdutos_1 (grupo,subgrupo,produto,frm_principal);
      DMF8.qCoresProdutosF8.Close;
      DMF8.qCoresProdutosF8.SQL.Clear;
      DMF8.qCoresProdutosF8.SQL.Add('SELECT DISTINCT CR_CODI,CR_DESC,CR_SORT ');
      DMF8.qCoresProdutosF8.SQL.Add('FROM CORES,ESTOQUE                      ');
      DMF8.qCoresProdutosF8.SQL.Add('WHERE (ES_CORE=CR_CODI) AND             ');
      DMF8.qCoresProdutosF8.SQL.Add('      (ES_GRUP=:grupo) AND              ');
      DMF8.qCoresProdutosF8.SQL.Add('      (ES_SUBG=:subgrupo) AND           ');
      DMF8.qCoresProdutosF8.SQL.Add('      (ES_PROD=:produto) AND            ');
      DMF8.qCoresProdutosF8.SQL.Add('      (CR_ATIV=:CODIGO)                 ');
      DMF8.qCoresProdutosF8.SQL.Add('ORDER BY CR_CODI                        ');
      DMF8.qCoresProdutosF8.parambyname('grupo').AsFloat    := grupo;
      DMF8.qCoresProdutosF8.parambyname('subgrupo').AsFloat := subgrupo;
      DMF8.qCoresProdutosF8.parambyname('produto').AsFloat  := produto;
      DMF8.qCoresProdutosF8.ParamByName('CODIGO').AsInteger := 1;
      frm_F8CoresProdutos.grade.Columns.Items[0].FieldName  := 'CR_CODI';
      DMF8.qCoresProdutosF8.Open;
      {DMF8.qCoresProdutosF8.close;
      DMF8.qCoresProdutosF8.parambyname('grupo').AsFloat    := grupo;
      DMF8.qCoresProdutosF8.parambyname('subgrupo').AsFloat := subgrupo;
      DMF8.qCoresProdutosF8.parambyname('produto').AsFloat  := produto;
      DMF8.qCoresProdutosF8.open;}
      left:=287;
      top :=76;
      edit:=y_edit;
      showmodal;
    end;
end;

{**** funcao de procura generica}
function  ProcuraNomeEntidade(codigo: Real;
  database: String; entidade: String; labelentidade: String;
  campo1: String; campo2: String; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    ProcuraNomeEntidade := '<'+labelentidade+' não cadastrado(a)>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (database,componente);
      AddParam ('Select '+campo2+'                          ');
      AddParam ('From   '+entidade+'                        ');
      AddParam ('Where ('+campo1+'='+floattostr(codigo)+')  ');
      if (not Execute) then
        ProcuraNomeEntidade := '<'+labelentidade+' não cadastrado(a)>'
      else
        ProcuraNomeEntidade := Result(campo2);
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8Cep(edit_x: TObject);
begin
  try
    frm_principal.barraDicas.caption:='CONECTANDO COM O SERVIDOR DE CEP...AGUARDE!';
    frm_principal.barraDicas.refresh;
    clCep.ConectaServidorCep;
    frm_principal.barraDicas.caption:='';
    frm_principal.barraDicas.refresh;
    clCep.ChamandoF8Cep(edit_x);
  except
    frm_principal.BarraDicas.color      :=clRed;
    frm_principal.BarraDicas.font.color :=clWhite;
    frm_principal.ExibirDica('SERVIDOR DE CEP NÃO INSTALADO NESTE TERMINAL!',10);
  end;
end;

procedure ProcuraCep(cep: String; edt1,edt2,edt3,cb1: TObject);
begin
  try
    frm_principal.barraDicas.caption:='CONECTANDO COM O SERVIDOR DE CEP...AGUARDE!';
    frm_principal.barraDicas.refresh;
    clCep.ConectaServidorCep;
    frm_principal.barraDicas.caption:='';
    frm_principal.barraDicas.refresh;
    clCep.ChamandoServidorCep(cep);
    if (edt1 is Tedit) then
      Tedit(edt1).text := clCep.getEndereco
    else
    if (edt1 is TMaskEdit) then
      TMaskEdit(edt1).text := clCep.getEndereco;
    if (edt2 is Tedit) then
      Tedit(edt2).text := clCep.getBairro
    else
    if (edt2 is TMaskEdit) then
      TMaskEdit(edt2).text := clCep.getBairro;
    if (edt3 is Tedit) then
      Tedit(edt3).text := clCep.getCidade
    else
    if (edt3 is TMaskEdit) then
      TMaskEdit(edt3).text := clCep.getCidade;
    if (cb1 is TComboBox) then
      TComboBox(cb1).text := clCep.getUF;
  except
    frm_principal.BarraDicas.color      :=clRed;
    frm_principal.BarraDicas.font.color :=clWhite; 
    frm_principal.ExibirDica('SERVIDOR DE CEP NÃO INSTALADO NESTE TERMINAL!',10);
  end;
end;


function ProcuraNomePortador  (codigo: Real; componente: TComponent):String;
var
  clPort: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomePortador := '<Portador não cadastrado>'
  else
  begin
    clPort := TClassAuxiliar.Create;
    with (clPort) do
    begin
      conect ('CREDITO', componente);
      ClearSql;
      AddParam ('Select PO_CODI,PO_NOME ');
      AddParam ('From   CREPORT ');
      AddParam ('Where (PO_CODI='+floattostr(codigo)+')');
      if (not Execute) then
        ProcuraNomePortador := '<Portador não cadastrado>'
      else
        ProcuraNomePortador := Result('PO_NOME');
      desconect;
      Free;
    end;
  end;
end;

procedure ChamandoF8Contas (y_edit: TObject; natureza: String);
begin
  with (frm_f8Contas) do
  begin
    if (natureza='C') then
      natureza:='1'
    else
    if (natureza='D') then
      natureza:='2';
    TQuery(ds.dataset).close;
    TQuery(ds.dataset).sql.clear;
    TQuery(ds.dataset).sql.Add('SELECT UPPER(CO_DESC) AS CO_DESC,CO_CODI,CO_NATU FROM CONTAS WHERE (CO_NATU=:natu) AND (CO_ESTOQ <> ''F'') ');
    TQuery(ds.dataset).parambyname('natu').AsString := natureza;
    TQuery(ds.dataset).open;
    left:=287;
    top :=76;
    edit:=y_edit;
    showmodal;
  end;
end;

procedure ChamandoF8TipoValor (y_edit: TObject);
begin
  Application.CreateForm(Tfrm_CaixaLancamentos_F8TipoValor, frm_CaixaLancamentos_F8TipoValor);
  frm_CaixaLancamentos_F8TipoValor.showmodal;
  if (frm_CaixaLancamentos_F8TipoValor.y_tipo_valor<>-1) then
    TMaskEdit(y_edit).text := inttostr(frm_CaixaLancamentos_F8TipoValor.y_tipo_valor);
  frm_CaixaLancamentos_F8TipoValor.Free;
end;

function  ProcuraNomeConta       (codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=0) then
    ProcuraNomeConta := '<Conta não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect (databasecontas,componente);
      AddParam ('Select CO_CODI,CO_DESC ');
      AddParam ('From   CONTAS ');
      AddParam ('Where (CO_CODI='+floattostr(codigo)+')');
      AddParam ('And Co_Estoq <> ''F'' ');
      if (not Execute) then
        ProcuraNomeConta := '<Conta não cadastrada>'
      else
        ProcuraNomeConta := Result('CO_DESC');
      desconect;
      Free;
    end;
  end;
end;

function ProcuraNomeTipoValor(codigotipo: Real):String;
begin
  if (codigotipo=1) then
    result:='DINHEIRO'
  else
  if (codigotipo=2) then
    result:='CHEQUE'
  else
  if (codigotipo=3) then
    result:='OUTROS'
  else
    result:='?';
end;

procedure ChamandoF8Caixa (loja: Real; y_edit: TObject);
begin
  with (frm_f8Vend) do
  begin
    left:=100;
    top :=76;
    edit:=y_edit;
    y_loja:=loja;
    if (loja=0) then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.dataset).sql.Add('select VD_LOJA,VD_CODI,VD_NOME,VD_APEL,VD_CARG from vendedores   ');
      TQuery(ds.dataset).sql.Add('where (VD_CARG='+chr(39)+'OPERADOR DE CAIXA'+chr(39)+') AND      ');
      TQuery(ds.dataset).sql.Add('      (VD_STAT='+chr(39)+'1'+chr(39)+')                          ');
      TQuery(ds.dataset).sql.Add('order by VD_NOME                                                 ');
      TQuery(ds.dataset).open;
      label2.caption  := 'Procurar por Caixa - Todas as Lojas: ';
      label12.caption := 'Procurar por Caixa - Todas as Lojas: ';
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.dataset).sql.Add('select VD_LOJA,VD_CODI,VD_NOME,VD_APEL,VD_CARG from vendedores   ');
      TQuery(ds.dataset).sql.Add('where (VD_LOJA=:loja) AND                                        ');
      TQuery(ds.dataset).sql.Add('      (VD_CARG='+chr(39)+'OPERADOR DE CAIXA'+chr(39)+') AND      ');
      TQuery(ds.dataset).sql.Add('      (VD_STAT='+chr(39)+'1'+chr(39)+')                          ');
      TQuery(ds.dataset).sql.Add('order by VD_NOME                                                 ');
      TQuery(ds.dataset).parambyname('loja').AsFloat := y_loja;
      TQuery(ds.dataset).open;
      label2.caption  := 'Procurar por Caixa - Loja: '+form_nz(frm_principal.x_loja,2);
      label12.caption := 'Procurar por Caixa - Loja: '+form_nz(frm_principal.x_loja,2);
    end;
    showmodal;
  end;
end;

procedure ChamandoF8TodosFuncionarios (loja: Real; y_edit: TObject);
begin
  with (frm_f8Vend) do
  begin
    left:=100;
    top :=76;
    edit:=y_edit;
    y_loja:=loja;
    if (loja=0) then
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.dataset).sql.Add('select VD_LOJA,VD_CODI,VD_NOME,VD_APEL,VD_CARG from vendedores   ');
      TQuery(ds.dataset).sql.Add('where (VD_STAT='+chr(39)+'1'+chr(39)+')                          ');
      TQuery(ds.dataset).sql.Add('order by VD_NOME                                                 ');
      TQuery(ds.dataset).open;
      label2.caption  := 'Procurar por Funcionário - Todas as Lojas: ';
      label12.caption := 'Procurar por Funcionário - Todas as Lojas: ';
    end
    else
    begin
      TQuery(ds.dataset).close;
      TQuery(ds.dataset).sql.clear;
      TQuery(ds.dataset).sql.Add('select VD_LOJA,VD_CODI,VD_NOME,VD_APEL,VD_CARG from vendedores   ');
      TQuery(ds.dataset).sql.Add('where (VD_LOJA=:loja) AND                                        ');
      TQuery(ds.dataset).sql.Add('      (VD_STAT='+chr(39)+'1'+chr(39)+')                          ');
      TQuery(ds.dataset).sql.Add('order by VD_NOME                                                 ');
      TQuery(ds.dataset).parambyname('loja').AsFloat := y_loja;
      TQuery(ds.dataset).open;
      label2.caption  := 'Procurar por Funcionário - Loja: '+form_nz(y_loja,2);
      label12.caption := 'Procurar por Funcionário - Loja: '+form_nz(y_loja,2);
    end;
    showmodal;
  end;
end;

procedure ChamandoF8MotivosSuspensAtdo (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_F8MtvSuspensAtdo) do
  begin
    left:=287;
    top :=76;
    edit:=y_edit;
    btnCadastro.visible:=cadastro;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure ChamandoF8SubGrupos2 (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8SubGrupos) do
  begin
    DMF8.qSubGruposF8.close;
    DMF8.qSubGruposF8.sql.clear;
    DMF8.qSubGruposF8.sql.Add ('SELECT SG_GRUP,SG_CODI,SG_DESC ');
    DMF8.qSubGruposF8.sql.Add ('FROM    SUBGRUPOS_PRODUTOS ');
    DMF8.qSubGruposF8.sql.Add ('ORDER BY SG_DESC ');
    DMF8.qSubGruposF8.open;
    left:=287;
    top :=76;
    edit:=y_edit;
    caption:='Procurar por subgrupo';
    showmodal;
  end;
end;

procedure ChamandoF8Linhas (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8Linhas) do
  begin
    left:=287;
    top :=76;
    edit:=y_edit;
    btnCadastro.visible:=cadastro;
    panel1.caption := '  F2 -> Alterna entre grade e descrição                 ';
    panel2.caption := '  ENTER -> Seleciona a Descrição              ESC-> Sai sem selecionar';
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure ChamandoF8Colecoes (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_f8Colecoes) do
  begin
    left:=287;
    top :=76;
    edit:=y_edit;
    btnCadastro.visible:=cadastro;
    panel1.caption := '  F2 -> Alterna entre grade e descrição                 ';
    panel2.caption := '  ENTER -> Seleciona a Descrição              ESC-> Sai sem selecionar';
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

function  ProcuraNomeMotivoSuspensAtdo(codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    ProcuraNomeMotivoSuspensAtdo := '<Motivo não cadastrado>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select MA_CODI,MA_DESC                  ');
      AddParam ('From   MTV_ATDOS                        ');
      AddParam ('Where (MA_CODI='+floattostr(codigo)+')  ');
      if (not Execute) then
        ProcuraNomeMotivoSuspensAtdo := '<Motivo não cadastrado>'
      else
        ProcuraNomeMotivoSuspensAtdo := Result('MA_DESC');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeFormaPrestacao(codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    ProcuraNomeFormaPrestacao := '<Forma de pgto. não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databasecredito,componente);
      AddParam ('Select FP_CODI,FP_DESC                  ');
      AddParam ('From   CREFPGT                          ');
      AddParam ('Where (FP_CODI='+floattostr(codigo)+')  ');
      if (not Execute) then
        ProcuraNomeFormaPrestacao := '<Forma de pgto. não cadastrada>'
      else
        ProcuraNomeFormaPrestacao := Result('FP_DESC');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeLinha(codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    ProcuraNomeLinha := '<Linha não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select LI_CODI,LI_DESC                  ');
      AddParam ('From   LINHAS                           ');
      AddParam ('Where (LI_CODI='+floattostr(codigo)+')  ');
      if (not Execute) then
        ProcuraNomeLinha := '<Linha não cadastrada>'
      else
        ProcuraNomeLinha := Result('LI_DESC');
      desconect;
      Free;
    end;
  end;
end;

function  ProcuraNomeColecao(codigo: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    ProcuraNomeColecao := '<Coleção não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   (databaseprodutos,componente);
      AddParam ('Select CO_CODI,CO_DESC                   ');
      AddParam ('From   COLECOES                          ');
      AddParam ('Where (CO_CODI='+floattostr(codigo)+')   ');
      if (not Execute) then
        ProcuraNomeColecao := '<Coleção não cadastrada>'
      else
        ProcuraNomeColecao := Result('CO_DESC');
      desconect;
      Free;
    end;
  end;
end;

function ChamandoF8Lojas:String;
var
  FQuery:Tquery;
begin
  Result := '';

  FQuery := TQuery.Create(Application);
  FfocusgradeGridCons := true;

  try
    Fquery.DataBaseName := databasecredito;
    Fquery.sql.add('Select Lo_codi as Codigo,Lo_Nome From CRELOJA');
    Fquery.open;

    FQuery.FieldByName('Codigo').DisplayLabel := 'Código';
    FQuery.FieldByName('Codigo').DisplayWidth := 4;
    FQuery.FieldByName('Lo_Nome').DisplayLabel := 'Descrição';

    if Fgridcons(FQuery,'Consulta de Lojas',false,-1,true,true,'Lo_Nome') then
      Result := FormatFloat('00',Fquery.fieldbyname('Codigo').AsFloat);
  finally
    FfocusgradeGridCons := false;
    FQuery.Destroy;
  end;
end;

function  ProcuraReferencia (grupo,subgrupo,produto: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select PR_REFI                                     ');
  clAux.AddParam ('From PRODUTOS                                      ');
  clAux.AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND          ');
  clAux.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND       ');
  clAux.AddParam ('      (PR_CODI='+floattostr(produto)+')            ');
  if (clAux.Execute) then
    ProcuraReferencia := clAux.result('PR_REFI')
  else
    ProcuraReferencia := '<Referência não cadastrado>';
  clAux.desconect;
  clAux.Free;
end;

function  ProcuraReferenciaFabricante (grupo,subgrupo,produto: Real; componente: TComponent):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select PR_REFF                                     ');
  clAux.AddParam ('From PRODUTOS                                      ');
  clAux.AddParam ('Where (PR_GRUP='+floattostr(grupo)+') AND          ');
  clAux.AddParam ('      (PR_SUBG='+floattostr(subgrupo)+') AND       ');
  clAux.AddParam ('      (PR_CODI='+floattostr(produto)+')            ');
  if (clAux.Execute) then
    ProcuraReferenciaFabricante := clAux.result('PR_REFF')
  else
    ProcuraReferenciaFabricante := '<Referência não cadastrado>';
  clAux.desconect;
  clAux.Free;
end;

end.
