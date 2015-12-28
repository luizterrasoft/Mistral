//****************************************************************************************
//Procedimentos relacionados com o CUPOM
//****************************************************************************************
unit cupomfiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uDPOSDLL,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers, dbTables, gauges, DB, auxiliar,funcoesglobais;




function  AbreCupom(numeroCOO: String):Boolean; {*}
function  AbreCupom_MFD(numeroCOO: String; cgc: String; nome: String; endereco:String):Boolean; {*}
function  BuscaProximoCOOCupom:String; {*}
function  VerificaImpressoraCupom:Boolean; {*}
function  LancaItemCupom (clItVend: TClassAuxiliar; valor_desconto: String):Boolean; {*}
function  DeletaItemEcf(Pos:Integer;Descricao:String=''):Boolean;
function  ConclueCupom (qFormas: TQuery; valor_desconto, numeroCOO: String):Boolean; {*}
function  FinalizaCupom:Boolean; {*}
function  ImprimeCupomNaoFiscalVinculado(qFormas: TQuery):Boolean; {*}
function  ImprimeSangria(Valor:Real;Sangria:String='S'):Boolean; {*}

procedure CriaFlagCupom(numeroCOO: String);
procedure DestroiFlagCupom(numeroCOO: String);

function abregaveta(fini:Boolean=false):Boolean;

var
  AliquotasDataRegis:array of Real;

implementation



uses Bematech, darumaFS345, dataregis, urano, urano1EFC, principal, funcoes1, funcoes2, venda,
  procura,un_lancavenda, un_FechamentoVenda;

function AbreCupom (numeroCOO: String):Boolean;
var
  ret: Integer;
begin
      {********************************************************************************}
  CriaFlagCupom (numeroCOO);
      {********************************************************************************}
  result := true;
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
    ret := URANOEFC_ImprimeCabecalho;
    if (ret=0) then
      result := true //codigo 33, que vira 0, é SUCESSO
    else
      result := false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
    ret := URANOEFC_1EFC_ImprimeCabecalho;
    if (ret=0) then
      result := true //codigo 33, que vira 0, é SUCESSO
    else
      result := false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
    ret := Bematech_AbreCupom;
    if (ret=1) then
      result := true //codigo 1 é SUCESSO
    else
      result := false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
  begin
    ret := DARUMAFS345_AbreCupom; //codigo 1 é SUCESSO
    if (ret=1) then
      result := true
    else
      result := false;
  end;
      {********************************************************************************}
end;

function  AbreCupom_MFD(numeroCOO: String; cgc: String; nome: String; endereco:String):Boolean;
var
  ret: Integer;
begin
      {********************************************************************************}
  CriaFlagCupom (numeroCOO);
      {********************************************************************************}
  result := true;
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
    ret := URANOEFC_ImprimeCabecalho;
    if (ret=0) then
      result := true //codigo 33, que vira 0, é SUCESSO
    else
      result := false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
    ret := URANOEFC_1EFC_ImprimeCabecalho;
    if (ret=0) then
      result := true //codigo 33, que vira 0, é SUCESSO
    else
      result := false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
    ret := Bematech_AbreCupomMFD(cgc,nome,endereco);
    if (ret=1) then
      result := true //codigo 1 é SUCESSO
    else
      result := false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
  begin
    ret := DARUMAFS345_AbreCupom; //codigo 1 é SUCESSO
    if (ret=1) then
      result := true
    else
      result := false;
  end;
      {********************************************************************************}
end;

function FinalizaCupom:Boolean;
begin
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    URANOEFC_Finaliza
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
    URANOEFC_1EFC_Finaliza
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    BEMATECH_Finaliza
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    DARUMAFS345_Finaliza;
end;

function BuscaProximoCOOCupom:String;
var
  resultado: String;
begin
     {**********************************************************}
  result := '';
  if (frm_principal.x_ecf_busca_proximo_COO) then
  begin
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      begin
        resultado := URANOEFC_LeRegistrador(Pchar(trim('18'))); {busca da IMPRESSORA FISCAL, o proximo cupom}
        if (trim(resultado)<>'') then
          result    := inttostr(strtoint(trim(resultado))+1);
        URANOEFC_Finaliza;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
    begin
      if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      begin
        resultado := URANOEFC_1EFC_LeRegistrador(Pchar(trim('18'))); {busca da IMPRESSORA FISCAL, o proximo cupom}
        if (trim(resultado)<>'') then
          result    := inttostr(strtoint(trim(resultado))+1);
        URANOEFC_1EFC_Finaliza;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    begin
      if (BEMATECH_Inicializa=1) then
      begin
        resultado := BEMATECH_NumeroCupom; {busca da IMPRESSORA FISCAL, o proximo cupom}
        if (trim(resultado)<>'') then
          result    := inttostr(strtoint(trim(resultado))+1);
        BEMATECH_Finaliza;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
      if (DARUMAFS345_Inicializa=1) then
      begin
        resultado := DARUMAFS345_NumeroCupom; {busca da IMPRESSORA FISCAL, o proximo cupom}
        if (trim(resultado)<>'') then
          result    := inttostr(strtoint(trim(resultado))+1);
        DARUMAFS345_Finaliza;
      end;
  end
  else
    result := trim(floattostr(frm_principal.x_cupom_fiscal));
     {**********************************************************}
end;

function VerificaImpressoraCupom:Boolean;
var
  codigoestado: Integer;
begin
      {********************************************************************************}
      {checagem do modelo ECF}
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
    if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
    begin
      codigoestado := URANOEFC_CodigoEstadoImpressora;
      if (codigoestado=118) then //deve estar em 'Em periodo de venda'
        result:=true
      else
      begin
        URANOEFC_Finaliza;
        result:=false;
      end;
    end
    else
      result:=false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
    if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
    begin
      codigoestado := URANOEFC_1EFC_CodigoEstadoImpressora;
      if (codigoestado=118) then //deve estar em 'Em periodo de venda'
        result:=true
      else
      begin
        URANOEFC_1EFC_Finaliza;
        result:=false;
      end;
    end
    else
      result:=false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
    if (BEMATECH_Inicializa=1) then
      result:=true
    else
    begin
      BEMATECH_Finaliza;
      result:=false;
    end;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
    result:=true//NAO TEM COMO TESTAR A CONEXAO!!!!

  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
  begin
    if (DARUMAFS345_Inicializa=1) then
      result:=true
    else
    begin
      DARUMAFS345_Finaliza;
      result:=false;
    end;
  end
  else
    result:=true;
      {********************************************************************************}
end;

function LancaItemCupom (clItVend: TClassAuxiliar; valor_desconto: String):Boolean;
var
  ecf_Codigo,ecf_Descricao,ecf_Quantidade,ecf_ValorUnitario,ecf_Taxa: String;
  ecf_Aliquota,ecf_Unidade,ecf_Tipo: String;
  sValorunitario,sValoraliquota: String;
  valorunitario,valoraliquota: Real;
  sValordesconto: String;
  vlaliquota,valordesconto: Real;
  ind,ret: Integer;
  JaEnviouDescontoDataRegisItem: Boolean;
  i2,i:Integer;
begin
      {********************************************************************************}
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
           //enviar sempre o codigo de barras
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO) then
      ecf_Codigo := RetornaCodigoDeBarrasDoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'))
    else
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_EAN13) then
      ecf_Codigo := RetornaEAN13DoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'));
    ecf_Descricao := trim(form_t(ProcuraNomeItemEstoque(
      clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      clItVend.Result('IV_CORE'),
      clItVend.Result('IV_TAMA'),
      frm_principal),frm_principal.x_ecf_max_tam_descricao_item_cupom));
    ecf_Quantidade := form_nz(clItVend.Result('IV_QTDE'),7);
    sValorunitario := trim(form_nc(clItVend.Result('IV_PVEN'),10));
    while (Pos(',',sValorunitario)>0) do
      delete(sValorunitario,Pos(',',sValorunitario),1);
    while (Pos('.',sValorunitario)>0) do
      delete(sValorunitario,Pos('.',sValorunitario),1);
    valorunitario := strtofloat(sValorunitario);
    ecf_ValorUnitario := form_nz(valorunitario,9);
    ecf_Unidade    := form_t(DevolveUnidadeProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD')),2);
    ecf_Tipo       := '0'; {duas casas decimais}


    vlaliquota :=  IcmsProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      frm_principal.x_uf);

    if (VlAliquota = -1) or (VlAliquota = 0) then
      Ecf_Taxa      := '08'
    else
    if VlAliquota = -2 then
      Ecf_Taxa      := '07'
    else
    begin
      carregaaliquotasurano;
      for i:=0 to length(AliquotasUrano) - 1 do
        if  VlAliquota = AliquotasUrano[i] then
        begin
          Ecf_Taxa := formatFloat('00',i);
          break;
        end;
    end;

    if Ecf_Taxa = '' then
      Ecf_Taxa      := '00';


    URANOEFC_VendaItem (Pchar(trim(ecf_Codigo)),
      Pchar(trim(ecf_Descricao)),
      Pchar(trim(ecf_Quantidade)),
      Pchar(trim(ecf_ValorUnitario)),
      Pchar(trim(ecf_Taxa)),
      Pchar(trim(ecf_Unidade)),
      Pchar(trim(ecf_Tipo)));

    result := true;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
           //enviar sempre o codigo de barras
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO) then
      ecf_Codigo := RetornaCodigoDeBarrasDoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'))
    else
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_EAN13) then
      ecf_Codigo := RetornaEAN13DoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'));
    ecf_Descricao := trim(form_t(ProcuraNomeItemEstoque(
      clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      clItVend.Result('IV_CORE'),
      clItVend.Result('IV_TAMA'),
      frm_principal),frm_principal.x_ecf_max_tam_descricao_item_cupom));
    ecf_Quantidade := form_nz(clItVend.Result('IV_QTDE'),7);
    sValorunitario := trim(form_nc(clItVend.Result('IV_PVEN'),10));
    while (Pos(',',sValorunitario)>0) do
      delete(sValorunitario,Pos(',',sValorunitario),1);
    while (Pos('.',sValorunitario)>0) do
      delete(sValorunitario,Pos('.',sValorunitario),1);
    valorunitario := strtofloat(sValorunitario);
    ecf_ValorUnitario := form_nz(valorunitario,9);
//           ecf_Taxa       := '00'; {* - aliquota de INSS, sempre T00}
    ecf_Unidade    := form_t(DevolveUnidadeProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD')),2);
    ecf_Tipo       := '0'; {duas casas decimais}

    vlaliquota :=  IcmsProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      frm_principal.x_uf);

    if (VlAliquota = -1) or (VlAliquota = 0) then
      Ecf_Taxa      := '08'
    else
    if VlAliquota = -2 then
      Ecf_Taxa      := '07'
    else
    begin
      carregaaliquotasUranoEcf1;
      for i:=0 to length(aliquotasuranoECF1) - 1 do
        if  VlAliquota = AliquotasUranoECF1[i] then
        begin
          Ecf_Taxa := formatFloat('00',i);
          break;
        end;
    end;

    if Ecf_Taxa = '' then
      Ecf_Taxa      := '00';

    URANOEFC_1EFC_VendaItem (Pchar(trim(ecf_Codigo)),
      Pchar(trim(ecf_Descricao)),
      Pchar(trim(ecf_Quantidade)),
      Pchar(trim(ecf_ValorUnitario)),
      Pchar(trim(ecf_Taxa)),
      Pchar(trim(ecf_Unidade)),
      Pchar(trim(ecf_Tipo)));

    result := true;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
           //enviar sempre o codigo de barras
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO) then
      ecf_Codigo := RetornaCodigoDeBarrasDoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'))
    else
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_EAN13) then
      ecf_Codigo := RetornaEAN13DoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'));
    ecf_Codigo := form_t(ecf_Codigo,13); //é o limite permitido pela BEMATECH

    ecf_Descricao := trim(form_t(ProcuraNomeItemEstoque(
      clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      clItVend.Result('IV_CORE'),
      clItVend.Result('IV_TAMA'),
      frm_principal),frm_principal.x_ecf_max_tam_descricao_item_cupom));
    ecf_Quantidade    := trim(form_n(clItVend.Result('IV_QTDE'),7));
    ecf_ValorUnitario := trim(form_nc(clItVend.Result('IV_PVEN'),10));
    while (Pos('.',ecf_ValorUnitario)>0) do
      delete(ecf_ValorUnitario,Pos('.',ecf_ValorUnitario),1);



    vlaliquota :=  IcmsProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      frm_principal.x_uf);

    if (VlAliquota = -1) or (VlAliquota = 0) then
      ecf_Aliquota      := 'II'
    else
    if VlAliquota = -2 then
      ecf_Aliquota      := 'FF'
    else
      ecf_aliquota := copy(formatFloat('0000',vlaliquota * 100),1,4);

    if ecf_aliquota = '' then
      ecf_Aliquota      := 'II';


    ret := BEMATECH_VendeItem (ecf_Codigo,
      ecf_Descricao,
      ecf_Aliquota,
      'I',ecf_Quantidade, //quantidade com valor inteiro
      2,ecf_ValorUnitario, //valor com duas casas decimais
      '%',
      '0,00'); //sem desconto no item
    if (ret=1) then
      result := true
    else
      result := false;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
  begin
           //enviar sempre o codigo de barras
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO) then
      ecf_Codigo := PadR(RetornaCodigoDeBarrasDoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA')),11,' ')
    else
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_EAN13) then
      ecf_Codigo := PadR(RetornaEAN13DoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA')),13,' ');
    ecf_Descricao := ecf_Codigo+' '+padr(ProcuraNomeItemEstoque(
      clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      clItVend.Result('IV_CORE'),
      clItVend.Result('IV_TAMA'), //deve ser 27 = 36 - 9
      frm_principal),35 - Length(ecf_codigo),' '); //tamanho fixo


    vlaliquota :=  IcmsProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      frm_principal.Fuf);




    Ecf_Aliquota      := '';
    if Trim(Frm_principal.X_AliquotasEcf) = '' then
    begin
      if (VlAliquota = -1) or (VlAliquota = 0) then
        Ecf_Aliquota      := '01'
      else
      if VlAliquota = -2 then
        Ecf_Aliquota      := '00'
      else
      begin
        carregaaliquotasdataregis;
        for i:=0 to length(AliquotasDataRegis) - 1 do
          if  VlAliquota = AliquotasDataRegis[i] then
          begin
            Ecf_Aliquota := formatFloat('00',i);
            break;
          end;
      end;
    end
    else
    begin
      with separastring(Frm_principal.X_AliquotasEcf,';') do
        try
          for i:=0 to Count - 1 do
            with SeparaString(Strings[i]) do
              try
                if StrtoFloatN(Strings[0]) = VlAliquota then
                begin
                  Ecf_Aliquota := formatfloat('00',Strtofloatn(Strings[1]));
                  Break;
                end;
              finally
                Destroy;
              end;
        finally
          destroy;
        end;

                {Ecf_Aliquota := copy(Frm_principal.X_AliquotasEcf,
                              Pos(FloattoStr(VlAliquota)+',',Frm_principal.X_AliquotasEcf)+1,
                              Length(Frm_principal.X_AliquotasEcf));
                ind    := iifs(Pos(';',Ecf_Aliquota) > 0,Pos(';',Ecf_Aliquota) - 1,Length(Ecf_Aliquota));
                Ecf_Aliquota  := formatfloat('00',strtofloatn(copy(Ecf_Aliquota,1,Ind)));}
    end;

    if Ecf_Aliquota = '' then
      Ecf_Aliquota      := '00';

//              ecf_Aliquota    := '00'; //fixo


    ecf_Quantidade  := form_nz(clItVend.Result('IV_QTDE'),3)+'000'; //com 03 casas decimais
    ecf_ValorUnitario := trim(form_nc(clItVend.Result('IV_PVEN'),10));
    while (Pos('.',ecf_ValorUnitario)>0) do
      delete(ecf_ValorUnitario,Pos('.',ecf_ValorUnitario),1);
    while (Pos(',',ecf_ValorUnitario)>0) do
      delete(ecf_ValorUnitario,Pos(',',ecf_ValorUnitario),1);
    ecf_ValorUnitario := form_nz(strtoint(trim(ecf_ValorUnitario)),9); //com 02 casas decimais

           {........................................................}
    if (not JaEnviouDescontoDataRegisItem) then //ENVIA O DESCONTO, CASO EXISTA, NO PRIMEIRO ITEM!!!!Sempre
    begin
      if (Trim(valor_desconto)<>'') then
        valordesconto:= strtofloat(RetiraFormatacaoNumero(Trim(valor_desconto)))
      else
        valordesconto:= 0.00;
      if (valordesconto<>0.00) then
      begin
        sValordesconto := trim(form_nc2(valordesconto,10,2));
        while (Pos(',',sValordesconto)>0) do
          delete(sValordesconto,Pos(',',sValordesconto),1);
        while (Pos('.',sValordesconto)>0) do
          delete(sValordesconto,Pos('.',sValordesconto),1);
        valordesconto  := strtofloat(sValordesconto);
        sValordesconto := form_nz(valordesconto,4);
      end
      else
        sValordesconto := '0000';
      JaEnviouDescontoDataRegisItem:=true;
    end
    else
      sValordesconto := '0000';
           {........................................................}



    DATAREGISEFC_ItemVendido(ecf_Descricao,
      ecf_Aliquota,
      ecf_Quantidade,
      ecf_ValorUnitario,
      sValordesconto);

    result := true;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
  begin
           //enviar sempre o codigo de barras
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO) then
      ecf_Codigo := RetornaCodigoDeBarrasDoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'))
    else
    if (frm_principal.x_ecf_codigo_de_barras_no_cupom=K_CUPOM_ITEM_IMPRIME_EAN13) then
      ecf_Codigo := RetornaEAN13DoItem(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'));
    ecf_Descricao := trim(form_t(ProcuraNomeItemEstoque(
      clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      clItVend.Result('IV_CORE'),
      clItVend.Result('IV_TAMA'),
      frm_principal),frm_principal.x_ecf_max_tam_descricao_item_cupom));
    ecf_Quantidade    := trim(form_n(clItVend.Result('IV_QTDE'),7));
    ecf_ValorUnitario := trim(form_nc(clItVend.Result('IV_PVEN'),10));
    while (Pos('.',ecf_ValorUnitario)>0) do
      delete(ecf_ValorUnitario,Pos('.',ecf_ValorUnitario),1);


    vlaliquota :=  IcmsProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      frm_principal.x_uf);

    if (VlAliquota = -1) or (VlAliquota = 0) then
      ecf_Aliquota      := 'II'
    else
    if VlAliquota = -2 then
      ecf_Aliquota      := 'FF'
    else
      ecf_aliquota := copy(formatFloat('0000',vlaliquota * 100),1,4);

    if ecf_aliquota = '' then
      ecf_Aliquota      := 'II';

    DARUMAFS345_VendeItem (ecf_Codigo,
      ecf_Descricao,
      ecf_Aliquota,
      'I',ecf_Quantidade, //quantidade com valor inteiro
      2,ecf_ValorUnitario, //valor com duas casas decimais
      '%','0,00'); //sem desconto no item

    result := true;
  end;
end;

function ConclueCupom (qFormas: TQuery; valor_desconto,numeroCOO: String):Boolean;
var
  codigoforma: Real;
  sValorpagamento,sValordesconto,descricaoadicional: String;
  valordesconto,valorpagamento: Real;
  valorEntradas: Real;
  first,continua: Boolean;
  ret: Integer;
begin
  continua    := true;

      {********************************************************************************}
      {informando as formas de pagamento do cupom, fechamento do cupom}
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
           {*************************************************************************}
           {desconto}
    if (Trim(valor_desconto)<>'') then
      valordesconto:= strtofloat(RetiraFormatacaoNumero(Trim(valor_desconto)))
    else
      valordesconto:= 0.00;
    valorEntradas := TotalizaValorEntradas(frm_principal.x_loja,frm_principal.x_terminal,frm_principal.x_venda);
    valordesconto := valordesconto + valorEntradas;
    if (valordesconto<>0.00) then
    begin
      sValordesconto := trim(form_nc2(valordesconto,10,2));
      while (Pos(',',sValordesconto)>0) do
        delete(sValordesconto,Pos(',',sValordesconto),1);
      while (Pos('.',sValordesconto)>0) do
        delete(sValordesconto,Pos('.',sValordesconto),1);
      valordesconto := strtofloat(sValordesconto);
      if (valorEntradas=0.00) then
        URANOEFC_DescontoSubtotal (Pchar (trim('0')),
          Pchar (trim('Cortesia')),
          Pchar (trim(form_n (valordesconto,10))))
      else
        URANOEFC_DescontoSubtotal (Pchar (trim('0')),
          Pchar (trim('Troca')),
          Pchar (trim(form_n (valordesconto,10))));
    end;
           {*************************************************************************}
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
                {*************************************************************************
                {onde parametrizar isto?}
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
      begin
        codigoforma:=0;
        descricaoadicional:='';
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
      begin
        codigoforma:=1;
        descricaoadicional:=' A Vista';
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
      begin
        codigoforma:=2;
        descricaoadicional:='' //colocar nome do cartao;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
      begin
        codigoforma:=3;
        descricaoadicional:=' Debito Aut.';
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
      begin
        codigoforma:=5;
        descricaoadicional:=' Crediario';
      end;
                {*************************************************************************}
      sValorpagamento := trim(form_nc2(qFormas.fieldbyname('VF_VALO').AsFloat,10,2));
      while (Pos(',',sValorpagamento)>0) do
        delete(sValorpagamento,Pos(',',sValorpagamento),1);
      while (Pos('.',sValorpagamento)>0) do
        delete(sValorpagamento,Pos('.',sValorpagamento),1);
      valorpagamento := strtofloat(sValorpagamento);
      if (frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado) then
      begin
        if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
          URANOEFC_Pagamento(Pchar (trim(form_nz(codigoforma,2))),
            Pchar (trim(form_t (descricaoadicional,12))),
            Pchar (trim(form_n (valorpagamento,10))),
            Pchar (trim('0')))
        else
          URANOEFC_Pagamento(Pchar (trim(form_nz(codigoforma,2))),
            Pchar (trim(form_t (descricaoadicional,12))),
            Pchar (trim(form_n (valorpagamento,10))),
            Pchar (trim('1'))); //emite cupom vinculado
      end
      else
        URANOEFC_Pagamento(Pchar (trim(form_nz(codigoforma,2))),
          Pchar (trim(form_t (descricaoadicional,12))),
          Pchar (trim(form_n (valorpagamento,10))),
          Pchar (trim('0')));
                {*************************************************************************}
      qFormas.next;
                {*************************************************************************}
    end;
    qFormas.enablecontrols;
           {*************************************************************************}
    frm_principal.x_vendedor := VerificaVendedorDaVenda (frm_principal.x_terminal,frm_principal.x_venda); {*}
    if (frm_principal.x_vendedor=0) then
      URANOEFC_Propaganda ('0',Pchar('Vendedor: VARIOS'))
    else
      URANOEFC_Propaganda ('0',Pchar('Vendedor: '+form_nz(frm_principal.x_vendedor,6)));
    URANOEFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
           {*************************************************************************}
    if (frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado) then
      ImprimeCupomNaoFiscalVinculado(qFormas)
    else
      URANOEFC_AvancaLinhas (Pchar(trim('08'))); //Avanco de linha ate o picote
           {*************************************************************************}
    result := continua;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
           {*************************************************************************}
           {desconto}
    if (Trim(valor_desconto)<>'') then
      valordesconto:= strtofloat(RetiraFormatacaoNumero(Trim(valor_desconto)))
    else
      valordesconto:= 0.00;
    valorEntradas := TotalizaValorEntradas(frm_principal.x_loja,frm_principal.x_terminal,frm_principal.x_venda);
    valordesconto := valordesconto + valorEntradas;
    if (valordesconto<>0.00) then
    begin
      sValordesconto := trim(form_nc2(valordesconto,10,2));
      while (Pos(',',sValordesconto)>0) do
        delete(sValordesconto,Pos(',',sValordesconto),1);
      while (Pos('.',sValordesconto)>0) do
        delete(sValordesconto,Pos('.',sValordesconto),1);
      valordesconto := strtofloat(sValordesconto);
      if (valorEntradas=0.00) then
        URANOEFC_1EFC_DescontoSubtotal (Pchar (trim('0')),
          Pchar (trim('Cortesia')),
          Pchar (trim(form_n (valordesconto,10))))
      else
        URANOEFC_1EFC_DescontoSubtotal (Pchar (trim('0')),
          Pchar (trim('Troca')),
          Pchar (trim(form_n (valordesconto,10))));
    end;
           {*************************************************************************}
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
                {*************************************************************************
                {onde parametrizar isto?}
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
      begin
        codigoforma:=0;
        descricaoadicional:='';
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
      begin
        codigoforma:=1;
        descricaoadicional:=' A Vista';
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
      begin
        codigoforma:=2;
        descricaoadicional:='' //colocar nome do cartao;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
      begin
        codigoforma:=3;
        descricaoadicional:=' Debito Aut.';
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
      begin
        codigoforma:=5;
        descricaoadicional:=' Crediario';
      end;
                {*************************************************************************}
      sValorpagamento := trim(form_nc2(qFormas.fieldbyname('VF_VALO').AsFloat,10,2));
      while (Pos(',',sValorpagamento)>0) do
        delete(sValorpagamento,Pos(',',sValorpagamento),1);
      while (Pos('.',sValorpagamento)>0) do
        delete(sValorpagamento,Pos('.',sValorpagamento),1);
      valorpagamento := strtofloat(sValorpagamento);
      if (frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado) then
      begin
        if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
          URANOEFC_1EFC_Pagamento(Pchar (trim(form_nz(codigoforma,2))),
            Pchar (trim(form_t (descricaoadicional,12))),
            Pchar (trim(form_n (valorpagamento,10))),
            Pchar (trim('0')))
        else
          URANOEFC_1EFC_Pagamento(Pchar (trim(form_nz(codigoforma,2))),
            Pchar (trim(form_t (descricaoadicional,12))),
            Pchar (trim(form_n (valorpagamento,10))),
            Pchar (trim('1'))); //emite cupom vinculado
      end
      else
        URANOEFC_1EFC_Pagamento(Pchar (trim(form_nz(codigoforma,2))),
          Pchar (trim(form_t (descricaoadicional,12))),
          Pchar (trim(form_n (valorpagamento,10))),
          Pchar (trim('0')));
                {*************************************************************************}
      qFormas.next;
                {*************************************************************************}
    end;
    qFormas.enablecontrols;
           {*************************************************************************}
    if (frm_principal.x_vendedor=0) then
      URANOEFC_1EFC_Propaganda ('0',Pchar('Vendedor: VARIOS'))
    else
      URANOEFC_1EFC_Propaganda ('0',Pchar('Vendedor: '+trim(form_nz(frm_principal.x_vendedor,6))));
    URANOEFC_1EFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
           {*************************************************************************}
    if (frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado) then
      ImprimeCupomNaoFiscalVinculado(qFormas)
    else
      URANOEFC_1EFC_AvancaLinhas (Pchar(trim('08'))); //Avanco de linha ate o picote
           {*************************************************************************}
    result := continua;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
           {*************************************************************************}
           {desconto}
    if (Trim(valor_desconto)<>'') then
      valordesconto:= strtofloat(RetiraFormatacaoNumero(Trim(valor_desconto)))
    else
      valordesconto:= 0.00;
    valorEntradas := TotalizaValorEntradas(frm_principal.x_loja,frm_principal.x_terminal,frm_principal.x_venda);
    valordesconto := valordesconto + valorEntradas;
    if (valordesconto<>0.00) then
    begin
      sValordesconto := trim(form_nc2(valordesconto,10,2));
      while (Pos(',',sValordesconto)>0) do
        delete(sValordesconto,Pos(',',sValordesconto),1);
      while (Pos('.',sValordesconto)>0) do
        delete(sValordesconto,Pos('.',sValordesconto),1);
      valordesconto := strtofloat(sValordesconto);
      ret := BEMATECH_IniciaFechamentoCupom('D','$',trim(form_n (valordesconto,10)));
    end
    else
      ret := BEMATECH_IniciaFechamentoCupom('D','$','000');
    if (ret=1) then
      continua := true
    else
      continua := false;
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
        descricaoadicional:='DINHEIRO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
        descricaoadicional:='CHEQUE A VISTA'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
        descricaoadicional:='CARTAO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
        descricaoadicional:='DEB. AUTOMATICO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
        descricaoadicional:='CREDIARIO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
        descricaoadicional:='VALES RECEBIDOS';
                {*************************************************************************}
      sValorpagamento := trim(form_nc2(qFormas.fieldbyname('VF_VALO').AsFloat,10,2));
      while (Pos(',',sValorpagamento)>0) do
        delete(sValorpagamento,Pos(',',sValorpagamento),1);
      while (Pos('.',sValorpagamento)>0) do
        delete(sValorpagamento,Pos('.',sValorpagamento),1);
      valorpagamento := strtofloat(sValorpagamento);
      if (continua) then
      begin
        ret := BEMATECH_EfetuaFormaPagamento(trim(form_t (descricaoadicional,16)),
          trim(form_n (valorpagamento,10)));
        if (ret=1) then
          continua := true
        else
          continua := false;
      end;
                {*************************************************************************}
      qFormas.next;
    end;
    qFormas.enablecontrols;
           {*************************************************************************}
    if (continua) then
    begin
{marcio}        ret := BEMATECH_TerminaFechamentoCupom(frm_FechamentoVenda.Memo2.Text); //fechamento do cupom
      if (ret=1) then
        continua := true
      else
        continua := false;
    end;
           {*************************************************************************}
    if (frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado) and (continua) then
      continua := ImprimeCupomNaoFiscalVinculado(qFormas);
           {*************************************************************************}
    result := continua;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
  begin
           {*************************************************************************}
    qFormas.disablecontrols;     
    qFormas.first;
    while (not qFormas.eof) do
    begin
                {*************************************************************************}
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
        descricaoadicional:='DINHEIRO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
        descricaoadicional:='CHEQUE A VISTA'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
        descricaoadicional:='CARTAO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
        descricaoadicional:='DEB. AUTOMATICO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
        descricaoadicional:='CREDIARIO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
        descricaoadicional:='VALES RECEBIDOS';
                {*************************************************************************}
      sValorpagamento := trim(form_nc2(qFormas.fieldbyname('VF_VALO').AsFloat,10,2));
      while (Pos(',',sValorpagamento)>0) do
        delete(sValorpagamento,Pos(',',sValorpagamento),1);
      while (Pos('.',sValorpagamento)>0) do
        delete(sValorpagamento,Pos('.',sValorpagamento),1);
      valorpagamento  := strtofloat(sValorpagamento);
      sValorpagamento := form_nz(valorpagamento,12);
      DATAREGISEFC_FinalizaCupom(form_t(descricaoadicional,20),sValorpagamento+'00',qFormas.fieldbyname('VF_FPGT').AsString);
                {*************************************************************************}
      qFormas.next;
      if not qformas.eof then
        delay(round(frm_principal.x_tempointervecf * 1000));

                //if not qformas.eof then
                 //delay(2000);
                {*************************************************************************}
    end;
    qFormas.enablecontrols;
           {*************************************************************************}
    result := continua;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
  begin
           {*************************************************************************}
           {desconto}
    if (Trim(valor_desconto)<>'') then
      valordesconto:= strtofloat(RetiraFormatacaoNumero(Trim(valor_desconto)))
    else
      valordesconto:= 0.00;
    valorEntradas := TotalizaValorEntradas(frm_principal.x_loja,frm_principal.x_terminal,frm_principal.x_venda);
    valordesconto := valordesconto + valorEntradas;
    if (valordesconto<>0.00) then
    begin
      sValordesconto := trim(form_nc2(valordesconto,10,2));
      while (Pos(',',sValordesconto)>0) do
        delete(sValordesconto,Pos(',',sValordesconto),1);
      while (Pos('.',sValordesconto)>0) do
        delete(sValordesconto,Pos('.',sValordesconto),1);
      valordesconto := strtofloat(sValordesconto);
      DARUMAFS345_IniciaFechamentoCupom('D','$',trim(form_n (valordesconto,10)));
    end
    else
      DARUMAFS345_IniciaFechamentoCupom('D','$','000');
           {*************************************************************************}
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
                {*************************************************************************}
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
        descricaoadicional:='DINHEIRO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
        descricaoadicional:='CHEQUE A VISTA'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
        descricaoadicional:='CARTAO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
        descricaoadicional:='DEB. AUTOMATICO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
        descricaoadicional:='CREDIARIO'
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
        descricaoadicional:='VALES RECEBIDOS';
                {*************************************************************************}
      sValorpagamento := trim(form_nc2(qFormas.fieldbyname('VF_VALO').AsFloat,10,2));
      while (Pos(',',sValorpagamento)>0) do
        delete(sValorpagamento,Pos(',',sValorpagamento),1);
      while (Pos('.',sValorpagamento)>0) do
        delete(sValorpagamento,Pos('.',sValorpagamento),1);
      valorpagamento := strtofloat(sValorpagamento);
      DARUMAFS345_EfetuaFormaPagamento(trim(form_t (descricaoadicional,16)),
        trim(form_n (valorpagamento,10)));
                {*************************************************************************}
      qFormas.next;
                {*************************************************************************}
    end;
    qFormas.enablecontrols;
           {*************************************************************************}
    DARUMAFS345_TerminaFechamentoCupom('OBRIGADO, VOLTE SEMPRE!'); //fechamento do cupom
           {*************************************************************************}
    if (frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado) then
      ImprimeCupomNaoFiscalVinculado(qFormas);
           {*************************************************************************}
    result := continua;
  end;

      {********************************************************************************}
  if (result) then //somente se concluir com SUCESSO
    DestroiFlagCupom(numeroCOO);
      {********************************************************************************}
end;

procedure CriaFlagCupom(numeroCOO: String);
var
  arq: textfile;
begin
  CriaPastaNoVendasLocal('CUPOM');
  if (not FileExists('C:\NATIVA\VENDAS\CUPOM\CUPOM_'+trim(numeroCOO))) then
  begin
    AssignFile (arq,'C:\NATIVA\VENDAS\CUPOM\CUPOM_'+trim(numeroCOO));
    Rewrite    (arq);
    CloseFile  (arq);
  end;
end;

procedure DestroiFlagCupom(numeroCOO: String);
begin
  CriaPastaNoVendasLocal('CUPOM');
  DeleteFile ('C:\NATIVA\VENDAS\CUPOM\CUPOM_'+trim(numeroCOO));
end;

function ImprimeCupomNaoFiscalVinculado(qFormas: TQuery):Boolean;
var
  clForma,clForma2: TClassAuxiliar;
  sequencia_acumulada_forma_pagamento: Integer;
  descricaoadicional: String;
  pValorTransacao,
  pNumeroCupomVenda,
  pNumeroControle   : Pchar;
  RetDPOS,
  nStatus           : Integer;
  pTipoOperacao,pNumeroParcelas, pValorParcela, pValorTaxaServico,
  pPermiteAlteracao, pReservado : Pchar;
  arq,arqReg: TextFile;
  linha,a: String;
begin
//     a := frm_FechamentoVenda.CuponCartao;
//     a := frm_FechamentoVenda.CuponCartao;
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
    sequencia_acumulada_forma_pagamento := 1;
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
              {-- nao tem dados adicionais!}
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
      begin
        URANOEFC_EmiteVinculado(Pchar(trim('000000')),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CHEQUES_LOCAL       ');
        clForma.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND      ');
        clForma.AddParam ('      (CH_CAIX=:CH_CAIX) AND      ');
        clForma.AddParam ('      (CH_VEND=:CH_VEND) AND      ');
        clForma.AddParam ('      (CH_ORDE=:CH_ORDE)          ');
        clForma.consulta.parambyname('CH_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CH_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CH_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_LinhasLivres(Pchar('- Dados do cheque -'));
          URANOEFC_LinhasLivres(Pchar('  Numero banco.....: '+inttostr(clForma.Result('CH_BANC'))));
          URANOEFC_LinhasLivres(Pchar('  Nome do banco....: '+trim(clForma.Result('CH_NBAN'))));
          URANOEFC_LinhasLivres(Pchar('  Agencia..........: '+trim(clForma.Result('CH_AGEN'))));
          URANOEFC_LinhasLivres(Pchar('  Conta/Corrente...: '+trim(clForma.Result('CH_CONT'))));
          URANOEFC_LinhasLivres(Pchar('  N. do cheque.....: '+floattostr(clForma.Result('CH_NUME'))));
          URANOEFC_LinhasLivres(Pchar('  CPF/CNPJ Emitente: '+trim(clForma.Result('CH_CPF'))));
          URANOEFC_LinhasLivres(Pchar('  Nome Emitente....: '+trim(clForma.Result('CH_NOME'))));
          URANOEFC_LinhasLivres(Pchar('  Telefone.........: '+trim(clForma.Result('CH_FONE'))));
          if (clForma.Result('CH_FLAG')='0') then
            URANOEFC_LinhasLivres(Pchar('  Cheque do proprio cliente(S/N): N'))
          else
          if (clForma.Result('CH_FLAG')='1') then
            URANOEFC_LinhasLivres(Pchar('  Cheque do proprio cliente(S/N): S'));
                        {...}
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
      begin
        URANOEFC_EmiteVinculado(Pchar(trim('000000')),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_LinhasLivres(Pchar('- Dados do cartao -'));
          URANOEFC_LinhasLivres(Pchar('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),1,frm_principal))));
          URANOEFC_LinhasLivres(Pchar('  Numero do cartao...: '+trim(clForma.Result('CA_NUME'))));
                        {...}
          clForma.ClearSql;
          clForma.AddParam ('SELECT * FROM CARTOES_PARCELAS_LOCAL       ');
          clForma.AddParam ('WHERE (PC_LOJA=:PC_LOJA) AND               ');
          clForma.AddParam ('      (PC_CAIX=:PC_CAIX) AND               ');
          clForma.AddParam ('      (PC_VEND=:PC_VEND) AND               ');
          clForma.AddParam ('      (PC_ORDE=:PC_ORDE)                   ');
          clForma.consulta.parambyname('PC_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
          clForma.consulta.parambyname('PC_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
          clForma.consulta.parambyname('PC_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
          clForma.consulta.parambyname('PC_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
          clForma.Execute;
          clForma.first;
          URANOEFC_LinhasLivres(Pchar('  Qtde. parcelas.....: '+inttostr(clForma.reccount)));
          URANOEFC_LinhasLivres(Pchar('  Primeiro vencimento: '+form_data(clForma.Result('PC_DVTO'))));
          if (clForma.reccount=1) then
            URANOEFC_LinhasLivres(Pchar('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10))))
          else
          begin
            URANOEFC_LinhasLivres(Pchar('  Valor prim. parcela: '+trim(form_nc(clForma.Result('PC_VALO'),10))));
            clForma.next;
            URANOEFC_LinhasLivres(Pchar('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10))));
          end;
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
      begin
        URANOEFC_EmiteVinculado(Pchar(trim('000000')),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_LinhasLivres(Pchar('- Dados cartao/debito -'));
          URANOEFC_LinhasLivres(Pchar('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),0,frm_principal))));
          URANOEFC_LinhasLivres(Pchar('  Numero do cartao...: '+trim(clForma.Result('CA_NUME'))));
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
      begin
        URANOEFC_EmiteVinculado(Pchar(trim('000000')),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CREDIARIOS_LOCAL    ');
        clForma.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND      ');
        clForma.AddParam ('      (CR_CAIX=:CR_CAIX) AND      ');
        clForma.AddParam ('      (CR_VEND=:CR_VEND) AND      ');
        clForma.AddParam ('      (CR_ORDE=:CR_ORDE)          ');
        clForma.consulta.parambyname('CR_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CR_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CR_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CR_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_LinhasLivres(Pchar('- Dados crediario -'));
          URANOEFC_LinhasLivres(Pchar('  Total contrato.....: '+(trim(form_nc(clForma.Result('CR_TOTA'),10)))));
          URANOEFC_LinhasLivres(Pchar('  Total entrada......: '+(trim(form_nc(clForma.Result('CR_VENT'),10)))));
          URANOEFC_LinhasLivres(Pchar('  Total financiado...: '+(trim(form_nc(clForma.Result('CR_FINA'),10)))));
          URANOEFC_LinhasLivres(Pchar('  Nome cliente.......: '+(trim(form_t (clForma.Result('CR_NOME'),30)))));
          if (clForma.Result('CR_CLIE')<>0) and
            (clForma.Result('CR_CODI')) then
            if (databasecredito='CREDITO') then
            begin
                                  //buncando detalhes do contrato
              clForma2 := TClassAuxiliar.Create;
              clForma2.conect   ('CREDITO',frm_principal);
              clForma2.ClearSql;
              clForma2.AddParam ('SELECT * FROM CONTRATOS                         ');
              clForma2.AddParam ('WHERE (CR_CLIE=:CR_CLIE) AND (CR_CODI=:CR_CODI) ');
              clForma2.consulta.parambyname('CR_CLIE').AsFloat := clForma.Result('CR_CLIE');
              clForma2.consulta.parambyname('CR_CODI').AsFloat := clForma.Result('CR_CODI');
              if (clForma2.Execute) then
              begin
                URANOEFC_LinhasLivres(Pchar('  Numero contrato....: '+(trim(form_nz(clForma2.Result('CR_CODI'),6)))));
                URANOEFC_LinhasLivres(Pchar('  Codigo do cliente..: '+(trim(form_nz(clForma2.Result('CR_CLIE'),6)))));
                URANOEFC_LinhasLivres(Pchar('  Total de prestacoes: '+(trim(form_nz(clForma2.Result('CR_QPRE'),2)))));
              end;
              clForma2.desconect;
              clForma2.Free;
            end;
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
      begin
        URANOEFC_EmiteVinculado(Pchar('000000'),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM VALES_RECEBIDOS_LOCAL     ');
        clForma.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND      ');
        clForma.AddParam ('      (VE_CAIX=:VE_CAIX) AND      ');
        clForma.AddParam ('      (VE_VEND=:VE_VEND) AND      ');
        clForma.AddParam ('      (VE_ORDE=:VE_ORDE)          ');
        clForma.consulta.parambyname('VE_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('VE_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('VE_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('VE_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_LinhasLivres(Pchar('- Dados do vale -'));
          URANOEFC_LinhasLivres(Pchar('  Numero do vale.....: '+trim(clForma.Result('VE_NUME'))));
          URANOEFC_LinhasLivres(Pchar('  Total do vale......: '+(trim(form_nc(clForma.Result('VE_VALO'),10)))));
          if (clForma.result('VE_TIPO')='P') then
            URANOEFC_LinhasLivres(Pchar('  Tipo de vale.......: PRESENTE'))
          else
          if (clForma.result('VE_TIPO')='S') then
            URANOEFC_LinhasLivres(Pchar('  Tipo de vale.......: SIMPLES'))
          else
          if (clForma.result('VE_TIPO')='T') then
            URANOEFC_LinhasLivres(Pchar('  Tipo de vale.......: TROCO'))
          else
          if (clForma.result('VE_TIPO')='D') then
            URANOEFC_LinhasLivres(Pchar('  Tipo de vale.......: DESCONTO'))
          else
          if (clForma.result('VE_TIPO')='B') then
            URANOEFC_LinhasLivres(Pchar('  Tipo de vale.......: BRINDE'))
          else
          if (clForma.result('VE_TIPO')='O') then
            URANOEFC_LinhasLivres(Pchar('  Tipo de vale.......: BONUS'));
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end;
      qFormas.next;
    end;
    qFormas.enablecontrols;
          //**********************************************************************************
    result := true;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
    sequencia_acumulada_forma_pagamento := 1;
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
              {-- nao tem dados adicionais!}
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
      begin
        URANOEFC_1EFC_EmiteVinculado(Pchar(trim('000000')),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CHEQUES_LOCAL       ');
        clForma.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND      ');
        clForma.AddParam ('      (CH_CAIX=:CH_CAIX) AND      ');
        clForma.AddParam ('      (CH_VEND=:CH_VEND) AND      ');
        clForma.AddParam ('      (CH_ORDE=:CH_ORDE)          ');
        clForma.consulta.parambyname('CH_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CH_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CH_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_1EFC_LinhasLivres(Pchar('- Dados do cheque -'));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Numero banco.....: '+inttostr(clForma.Result('CH_BANC'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Nome do banco....: '+trim(clForma.Result('CH_NBAN'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Agencia..........: '+trim(clForma.Result('CH_AGEN'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Conta/Corrente...: '+trim(clForma.Result('CH_CONT'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  N. do cheque.....: '+floattostr(clForma.Result('CH_NUME'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  CPF/CNPJ Emitente: '+trim(clForma.Result('CH_CPF'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Nome Emitente....: '+trim(clForma.Result('CH_NOME'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Telefone.........: '+trim(clForma.Result('CH_FONE'))));
          if (clForma.Result('CH_FLAG')='0') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Cheque do proprio cliente(S/N): N'))
          else
          if (clForma.Result('CH_FLAG')='1') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Cheque do proprio cliente(S/N): S'));
                        {...}
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_1EFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
      begin
        URANOEFC_1EFC_EmiteVinculado(Pchar(trim('000000')),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_1EFC_LinhasLivres(Pchar('- Dados do cartao -'));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),1,frm_principal))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Numero do cartao...: '+trim(clForma.Result('CA_NUME'))));
                        {...}
          clForma.ClearSql;
          clForma.AddParam ('SELECT * FROM CARTOES_PARCELAS_LOCAL       ');
          clForma.AddParam ('WHERE (PC_LOJA=:PC_LOJA) AND               ');
          clForma.AddParam ('      (PC_CAIX=:PC_CAIX) AND               ');
          clForma.AddParam ('      (PC_VEND=:PC_VEND) AND               ');
          clForma.AddParam ('      (PC_ORDE=:PC_ORDE)                   ');
          clForma.consulta.parambyname('PC_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
          clForma.consulta.parambyname('PC_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
          clForma.consulta.parambyname('PC_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
          clForma.consulta.parambyname('PC_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
          clForma.Execute;
          clForma.first;
          URANOEFC_1EFC_LinhasLivres(Pchar('  Qtde. parcelas.....: '+inttostr(clForma.reccount)));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Primeiro vencimento: '+form_data(clForma.Result('PC_DVTO'))));
          if (clForma.reccount=1) then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10))))
          else
          begin
            URANOEFC_1EFC_LinhasLivres(Pchar('  Valor prim. parcela: '+trim(form_nc(clForma.Result('PC_VALO'),10))));
            clForma.next;
            URANOEFC_1EFC_LinhasLivres(Pchar('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10))));
          end;
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_1EFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
      begin
        URANOEFC_1EFC_EmiteVinculado(Pchar(trim('000000')),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_1EFC_LinhasLivres(Pchar('- Dados cartao/debito -'));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),0,frm_principal))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Numero do cartao...: '+trim(clForma.Result('CA_NUME'))));
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_1EFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
      begin
        URANOEFC_1EFC_EmiteVinculado(Pchar('000000'),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CREDIARIOS_LOCAL    ');
        clForma.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND      ');
        clForma.AddParam ('      (CR_CAIX=:CR_CAIX) AND      ');
        clForma.AddParam ('      (CR_VEND=:CR_VEND) AND      ');
        clForma.AddParam ('      (CR_ORDE=:CR_ORDE)          ');
        clForma.consulta.parambyname('CR_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CR_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CR_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CR_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_1EFC_LinhasLivres(Pchar('- Dados crediario -'));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Total contrato.....: '+(trim(form_nc(clForma.Result('CR_TOTA'),10)))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Total entrada......: '+(trim(form_nc(clForma.Result('CR_VENT'),10)))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Total financiado...: '+(trim(form_nc(clForma.Result('CR_FINA'),10)))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Nome cliente.......: '+(trim(form_t (clForma.Result('CR_NOME'),30)))));
          if (clForma.Result('CR_CLIE')<>0) and
            (clForma.Result('CR_CODI')) then
            if (databasecredito='CREDITO') then
            begin
                                  //buncando detalhes do contrato
              clForma2 := TClassAuxiliar.Create;
              clForma2.conect   ('CREDITO',frm_principal);
              clForma2.ClearSql;
              clForma2.AddParam ('SELECT * FROM CONTRATOS                         ');
              clForma2.AddParam ('WHERE (CR_CLIE=:CR_CLIE) AND (CR_CODI=:CR_CODI) ');
              clForma2.consulta.parambyname('CR_CLIE').AsFloat := clForma.Result('CR_CLIE');
              clForma2.consulta.parambyname('CR_CODI').AsFloat := clForma.Result('CR_CODI');
              if (clForma2.Execute) then
              begin
                URANOEFC_1EFC_LinhasLivres(Pchar('  Numero contrato....: '+(trim(form_nz(clForma2.Result('CR_CODI'),6)))));
                URANOEFC_1EFC_LinhasLivres(Pchar('  Codigo do cliente..: '+(trim(form_nz(clForma2.Result('CR_CLIE'),6)))));
                URANOEFC_1EFC_LinhasLivres(Pchar('  Total de prestacoes: '+(trim(form_nz(clForma2.Result('CR_QPRE'),2)))));
              end;
              clForma2.desconect;
              clForma2.Free;
            end;
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_1EFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
      begin
        URANOEFC_1EFC_EmiteVinculado(Pchar('000000'),
          Pchar(trim(form_nz(sequencia_acumulada_forma_pagamento,2))));
        sequencia_acumulada_forma_pagamento := sequencia_acumulada_forma_pagamento + 1;
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM VALES_RECEBIDOS_LOCAL     ');
        clForma.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND      ');
        clForma.AddParam ('      (VE_CAIX=:VE_CAIX) AND      ');
        clForma.AddParam ('      (VE_VEND=:VE_VEND) AND      ');
        clForma.AddParam ('      (VE_ORDE=:VE_ORDE)          ');
        clForma.consulta.parambyname('VE_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('VE_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('VE_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('VE_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          URANOEFC_1EFC_LinhasLivres(Pchar('- Dados do vale -'));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Numero do vale.....: '+trim(clForma.Result('VE_NUME'))));
          URANOEFC_1EFC_LinhasLivres(Pchar('  Total do vale......: '+(trim(form_nc(clForma.Result('VE_VALO'),10)))));
          if (clForma.result('VE_TIPO')='P') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Tipo de vale.......: PRESENTE'))
          else
          if (clForma.result('VE_TIPO')='S') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Tipo de vale.......: SIMPLES'))
          else
          if (clForma.result('VE_TIPO')='T') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Tipo de vale.......: TROCO'))
          else
          if (clForma.result('VE_TIPO')='D') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Tipo de vale.......: DESCONTO'))
          else
          if (clForma.result('VE_TIPO')='B') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Tipo de vale.......: BRINDE'))
          else
          if (clForma.result('VE_TIPO')='O') then
            URANOEFC_1EFC_LinhasLivres(Pchar('  Tipo de vale.......: BONUS'));
        end;
        clForma.desconect;
        clForma.Free;
        URANOEFC_1EFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,frm_principal))); //fechamento do cupom
      end;
      qFormas.next;
    end;
    qFormas.enablecontrols;
          //**********************************************************************************
    result := true;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
    FLAG_BEMATECH_CONTINUA_IMPRESSAO := true; {*}
          //**********************************************************************************
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
              {-- nao tem dados adicionais!}
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
      begin
        descricaoadicional:='CHEQUE A VISTA';
        BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CHEQUES_LOCAL       ');
        clForma.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND      ');
        clForma.AddParam ('      (CH_CAIX=:CH_CAIX) AND      ');
        clForma.AddParam ('      (CH_VEND=:CH_VEND) AND      ');
        clForma.AddParam ('      (CH_ORDE=:CH_ORDE)          ');
        clForma.consulta.parambyname('CH_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CH_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CH_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          BEMATECH_UsaComprovanteNaoFiscalVinculado('- Dados do cheque -');
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Numero banco.....: '+inttostr(clForma.Result('CH_BANC')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Nome do banco....: '+trim(clForma.Result('CH_NBAN')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Agencia..........: '+trim(clForma.Result('CH_AGEN')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Conta/Corrente...: '+trim(clForma.Result('CH_CONT')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  N. do cheque.....: '+floattostr(clForma.Result('CH_NUME')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  CPF/CNPJ Emitente: '+trim(clForma.Result('CH_CPF')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Nome Emitente....: '+trim(clForma.Result('CH_NOME')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Telefone.........: '+trim(clForma.Result('CH_FONE')));
          if (clForma.Result('CH_FLAG')='0') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Cheque do proprio cliente(S/N): N')
          else
          if (clForma.Result('CH_FLAG')='1') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Cheque do proprio cliente(S/N): S');
                        {...}
        end;
        clForma.desconect;
        clForma.Free;
        BEMATECH_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) and (not frm_principal.x_ecf_habilita_TEF)  then
      begin
        descricaoadicional:='CARTAO';
        BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          BEMATECH_UsaComprovanteNaoFiscalVinculado('- Dados do cartao -');
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),1,frm_principal)));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Numero do cartao...: '+trim(clForma.Result('CA_NUME')));
                        {...}
          clForma.ClearSql;
          clForma.AddParam ('SELECT * FROM CARTOES_PARCELAS_LOCAL       ');
          clForma.AddParam ('WHERE (PC_LOJA=:PC_LOJA) AND               ');
          clForma.AddParam ('      (PC_CAIX=:PC_CAIX) AND               ');
          clForma.AddParam ('      (PC_VEND=:PC_VEND) AND               ');
          clForma.AddParam ('      (PC_ORDE=:PC_ORDE)                   ');
          clForma.consulta.parambyname('PC_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
          clForma.consulta.parambyname('PC_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
          clForma.consulta.parambyname('PC_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
          clForma.consulta.parambyname('PC_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
          clForma.Execute;
          clForma.first;
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Qtde. parcelas.....: '+inttostr(clForma.reccount));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Primeiro vencimento: '+form_data(clForma.Result('PC_VENC')));
          if (clForma.reccount=1) then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10)))
          else
          begin
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Valor prim. parcela: '+trim(form_nc(clForma.Result('PC_VALO'),10)));
            clForma.next;
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10)));
          end;
        end;
        clForma.desconect;
        clForma.Free;
        BEMATECH_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) and (frm_principal.x_ecf_habilita_TEF)  and (frm_FechamentoVenda.CuponDebito='')  then
      begin
        if (FileExists(frm_FechamentoVenda.CuponCartao)) then
        begin
          AssignFile (arqReg,frm_FechamentoVenda.CuponCartao);
          Reset      (arqReg);
          linha := '';
          descricaoadicional:='CARTAO';
          BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
          BEMATECH_UsaComprovanteNaoFiscalVinculado(' ');
          while (not Eof(arqReg)) do
            try
              ReadLn (arqReg,linha);
              if (trim(linha)='') then
                linha:=' ';

              BEMATECH_UsaComprovanteNaoFiscalVinculado(linha);
            except
            end{encapsulamento da rotina, nao permite erros --->};
          BEMATECH_FechaComprovanteNaoFiscalVinculado;
          CloseFile  (arqReg);
        end
        else
          ShowMessage('Arquivo '+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3)+' não encontrado');
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) and (not frm_principal.x_ecf_habilita_modo_fiscal) then
      begin
        descricaoadicional:='DEB. AUTOMATICO';
        BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          BEMATECH_UsaComprovanteNaoFiscalVinculado('- Dados cartao/debito -');
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),0,frm_principal)));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Numero do cartao...: '+trim(clForma.Result('CA_NUME')));
        end;
        clForma.desconect;
        clForma.Free;
        BEMATECH_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) and (frm_principal.x_ecf_habilita_modo_fiscal) and
        (frm_FechamentoVenda.CuponDebito='') then
      begin
        if (FileExists(frm_FechamentoVenda.CuponDebito)) then
        begin
          AssignFile (arqReg,frm_FechamentoVenda.CuponDebito);
          Reset      (arqReg);
          linha := '';
          descricaoadicional:='DEB. AUTOMATICO';
          BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
          BEMATECH_UsaComprovanteNaoFiscalVinculado(' ');
          while (not Eof(arqReg)) do
            try
              ReadLn (arqReg,linha);
              if (trim(linha)='') then
                linha:=' ';

              BEMATECH_UsaComprovanteNaoFiscalVinculado(linha);
            except
            end{encapsulamento da rotina, nao permite erros --->};
          BEMATECH_FechaComprovanteNaoFiscalVinculado;
          CloseFile  (arqReg);
        end
        else
          ShowMessage('Arquivo '+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3)+' não encontrado');
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) and (frm_principal.x_ecf_habilita_modo_fiscal) and
        (frm_FechamentoVenda.CuponCartao<>'') and (frm_FechamentoVenda.CuponDebito<>'') then
      begin
        if (FileExists(frm_FechamentoVenda.CuponCartao)) then
        begin
          AssignFile (arqReg,frm_FechamentoVenda.CuponCartao);
          Reset      (arqReg);
          linha := '';
          descricaoadicional:='CARTAO';
          BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
          BEMATECH_UsaComprovanteNaoFiscalVinculado(' ');
          while (not Eof(arqReg)) do
            try
              ReadLn (arqReg,linha);
              if (trim(linha)='') then
                linha:=' ';

              BEMATECH_UsaComprovanteNaoFiscalVinculado(linha);
            except
            end{encapsulamento da rotina, nao permite erros --->};
        end
        else
          ShowMessage('Arquivo '+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3)+' não encontrado');
        if (FileExists(frm_FechamentoVenda.CuponDebito)) then
        begin
          AssignFile (arqReg,frm_FechamentoVenda.CuponDebito);
          Reset      (arqReg);
          linha := '';
          BEMATECH_UsaComprovanteNaoFiscalVinculado(' ');
          BEMATECH_UsaComprovanteNaoFiscalVinculado('    +--------------------------------------+');
          BEMATECH_UsaComprovanteNaoFiscalVinculado(' ');
          while (not Eof(arqReg)) do
            try
              ReadLn (arqReg,linha);
              if (trim(linha)='') then
                linha:=' ';

              BEMATECH_UsaComprovanteNaoFiscalVinculado(linha);
            except
            end{encapsulamento da rotina, nao permite erros --->};
        end
        else
          ShowMessage('Arquivo '+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3)+' não encontrado');
        BEMATECH_FechaComprovanteNaoFiscalVinculado;
        CloseFile  (arqReg);
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
      begin
        descricaoadicional:='CREDIARIO';
        BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CREDIARIOS_LOCAL    ');
        clForma.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND      ');
        clForma.AddParam ('      (CR_CAIX=:CR_CAIX) AND      ');
        clForma.AddParam ('      (CR_VEND=:CR_VEND) AND      ');
        clForma.AddParam ('      (CR_ORDE=:CR_ORDE)          ');
        clForma.consulta.parambyname('CR_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CR_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CR_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CR_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          BEMATECH_UsaComprovanteNaoFiscalVinculado('- Dados crediario -');
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Total contrato.....: '+(trim(form_nc(clForma.Result('CR_TOTA'),10))));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Total entrada......: '+(trim(form_nc(clForma.Result('CR_VENT'),10))));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Total financiado...: '+(trim(form_nc(clForma.Result('CR_FINA'),10))));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Nome cliente.......: '+(trim(form_t (clForma.Result('CR_NOME'),30))));
          if (clForma.Result('CR_CLIE')<>0) and
            (clForma.Result('CR_CODI')) then
            if (databasecredito='CREDITO') then
            begin
                                  //buncando detalhes do contrato
              clForma2 := TClassAuxiliar.Create;
              clForma2.conect   ('CREDITO',frm_principal);
              clForma2.ClearSql;
              clForma2.AddParam ('SELECT * FROM CONTRATOS                         ');
              clForma2.AddParam ('WHERE (CR_CLIE=:CR_CLIE) AND (CR_CODI=:CR_CODI) ');
              clForma2.consulta.parambyname('CR_CLIE').AsFloat := clForma.Result('CR_CLIE');
              clForma2.consulta.parambyname('CR_CODI').AsFloat := clForma.Result('CR_CODI');
              if (clForma2.Execute) then
              begin
                BEMATECH_UsaComprovanteNaoFiscalVinculado('  Numero contrato....: '+(trim(form_nz(clForma2.Result('CR_CODI'),6))));
                BEMATECH_UsaComprovanteNaoFiscalVinculado('  Codigo do cliente..: '+(trim(form_nz(clForma2.Result('CR_CLIE'),6))));
                BEMATECH_UsaComprovanteNaoFiscalVinculado('  Total de prestacoes: '+(trim(form_nz(clForma2.Result('CR_QPRE'),2))));
              end;
              clForma2.desconect;
              clForma2.Free;
            end;
        end;
        clForma.desconect;
        clForma.Free;
        BEMATECH_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
      begin
        descricaoadicional:='VALES RECEBIDOS';
        BEMATECH_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM VALES_RECEBIDOS_LOCAL     ');
        clForma.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND      ');
        clForma.AddParam ('      (VE_CAIX=:VE_CAIX) AND      ');
        clForma.AddParam ('      (VE_VEND=:VE_VEND) AND      ');
        clForma.AddParam ('      (VE_ORDE=:VE_ORDE)          ');
        clForma.consulta.parambyname('VE_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('VE_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('VE_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('VE_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          BEMATECH_UsaComprovanteNaoFiscalVinculado('- Dados do vale -');
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Numero do vale.....: '+trim(clForma.Result('VE_NUME')));
          BEMATECH_UsaComprovanteNaoFiscalVinculado('  Total do vale......: '+(trim(form_nc(clForma.Result('VE_VALO'),10))));
          if (clForma.result('VE_TIPO')='P') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: PRESENTE')
          else
          if (clForma.result('VE_TIPO')='S') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: SIMPLES')
          else
          if (clForma.result('VE_TIPO')='T') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: TROCO')
          else
          if (clForma.result('VE_TIPO')='D') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: DESCONTO')
          else
          if (clForma.result('VE_TIPO')='B') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: BRINDE')
          else
          if (clForma.result('VE_TIPO')='O') then
            BEMATECH_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: BONUS');
        end;
        clForma.desconect;
        clForma.Free;
        BEMATECH_FechaComprovanteNaoFiscalVinculado;
      end;
      qFormas.next;
    end;
    qFormas.enablecontrols;
          //**********************************************************************************
    result := FLAG_BEMATECH_CONTINUA_IMPRESSAO;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
    result := true{...}//**********************************************************************************

  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
  begin
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DINHEIRO) then
              {-- nao tem dados adicionais!}
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CHEQUE) then
      begin
        descricaoadicional:='CHEQUE A VISTA';
        DARUMAFS345_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CHEQUES_LOCAL       ');
        clForma.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND      ');
        clForma.AddParam ('      (CH_CAIX=:CH_CAIX) AND      ');
        clForma.AddParam ('      (CH_VEND=:CH_VEND) AND      ');
        clForma.AddParam ('      (CH_ORDE=:CH_ORDE)          ');
        clForma.consulta.parambyname('CH_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CH_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CH_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('- Dados do cheque -');
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Numero banco.....: '+inttostr(clForma.Result('CH_BANC')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Nome do banco....: '+trim(clForma.Result('CH_NBAN')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Agencia..........: '+trim(clForma.Result('CH_AGEN')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Conta/Corrente...: '+trim(clForma.Result('CH_CONT')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  N. do cheque.....: '+floattostr(clForma.Result('CH_NUME')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  CPF/CNPJ Emitente: '+trim(clForma.Result('CH_CPF')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Nome Emitente....: '+trim(clForma.Result('CH_NOME')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Telefone.........: '+trim(clForma.Result('CH_FONE')));
          if (clForma.Result('CH_FLAG')='0') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Cheque do proprio cliente(S/N): N')
          else
          if (clForma.Result('CH_FLAG')='1') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Cheque do proprio cliente(S/N): S');
                        {...}
        end;
        clForma.desconect;
        clForma.Free;
        DARUMAFS345_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CARTAO) then
      begin
        descricaoadicional:='CARTAO';
        DARUMAFS345_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('- Dados do cartao -');
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),1,frm_principal)));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Numero do cartao...: '+trim(clForma.Result('CA_NUME')));
                        {...}
          clForma.ClearSql;
          clForma.AddParam ('SELECT * FROM CARTOES_PARCELAS_LOCAL       ');
          clForma.AddParam ('WHERE (PC_LOJA=:PC_LOJA) AND               ');
          clForma.AddParam ('      (PC_CAIX=:PC_CAIX) AND               ');
          clForma.AddParam ('      (PC_VEND=:PC_VEND) AND               ');
          clForma.AddParam ('      (PC_ORDE=:PC_ORDE)                   ');
          clForma.consulta.parambyname('PC_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
          clForma.consulta.parambyname('PC_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
          clForma.consulta.parambyname('PC_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
          clForma.consulta.parambyname('PC_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
          clForma.Execute;
          clForma.first;
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Qtde. parcelas.....: '+inttostr(clForma.reccount));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Primeiro vencimento: '+form_data(clForma.Result('PC_DVTO')));
          if (clForma.reccount=1) then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10)))
          else
          begin
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Valor prim. parcela: '+trim(form_nc(clForma.Result('PC_VALO'),10)));
            clForma.next;
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Valor parcela......: '+trim(form_nc(clForma.Result('PC_VALO'),10)));
          end;
        end;
        clForma.desconect;
        clForma.Free;
        DARUMAFS345_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_DEBITO) then
      begin
        descricaoadicional:='DEB. AUTOMATICO';
        DARUMAFS345_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
        clForma.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND      ');
        clForma.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
        clForma.AddParam ('      (CA_VEND=:CA_VEND) AND      ');
        clForma.AddParam ('      (CA_ORDE=:CA_ORDE)          ');
        clForma.consulta.parambyname('CA_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CA_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CA_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('- Dados cartao/debito -');
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Administradora.....: '+trim(ProcuraNomeAdm(clForma.Result('CA_CADM'),0,frm_principal)));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Numero do cartao...: '+trim(clForma.Result('CA_NUME')));
        end;
        clForma.desconect;
        clForma.Free;
        DARUMAFS345_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_CREDITO) then
      begin
        descricaoadicional:='CREDIARIO';
        DARUMAFS345_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM CREDIARIOS_LOCAL    ');
        clForma.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND      ');
        clForma.AddParam ('      (CR_CAIX=:CR_CAIX) AND      ');
        clForma.AddParam ('      (CR_VEND=:CR_VEND) AND      ');
        clForma.AddParam ('      (CR_ORDE=:CR_ORDE)          ');
        clForma.consulta.parambyname('CR_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('CR_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('CR_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('CR_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('- Dados crediario -');
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Total contrato.....: '+(trim(form_nc(clForma.Result('CR_TOTA'),10))));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Total entrada......: '+(trim(form_nc(clForma.Result('CR_VENT'),10))));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Total financiado...: '+(trim(form_nc(clForma.Result('CR_FINA'),10))));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Nome cliente.......: '+(trim(form_t (clForma.Result('CR_NOME'),30))));
          if (clForma.Result('CR_CLIE')<>0) and
            (clForma.Result('CR_CODI')) then
            if (databasecredito='CREDITO') then
            begin
                                  //buncando detalhes do contrato
              clForma2 := TClassAuxiliar.Create;
              clForma2.conect   ('CREDITO',frm_principal);
              clForma2.ClearSql;
              clForma2.AddParam ('SELECT * FROM CONTRATOS                         ');
              clForma2.AddParam ('WHERE (CR_CLIE=:CR_CLIE) AND (CR_CODI=:CR_CODI) ');
              clForma2.consulta.parambyname('CR_CLIE').AsFloat := clForma.Result('CR_CLIE');
              clForma2.consulta.parambyname('CR_CODI').AsFloat := clForma.Result('CR_CODI');
              if (clForma2.Execute) then
              begin
                DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Numero contrato....: '+(trim(form_nz(clForma2.Result('CR_CODI'),6))));
                DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Codigo do cliente..: '+(trim(form_nz(clForma2.Result('CR_CLIE'),6))));
                DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Total de prestacoes: '+(trim(form_nz(clForma2.Result('CR_QPRE'),2))));
              end;
              clForma2.desconect;
              clForma2.Free;
            end;
        end;
        clForma.desconect;
        clForma.Free;
        DARUMAFS345_FechaComprovanteNaoFiscalVinculado;
      end
      else
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
      begin
        descricaoadicional:='VALES RECEBIDOS';
        DARUMAFS345_AbreComprovanteNaoFiscalVinculado(descricaoadicional,'','');
        clForma := TClassAuxiliar.Create;
        clForma.conect   ('VENDAS',frm_principal);
        clForma.ClearSql;
        clForma.AddParam ('SELECT * FROM VALES_RECEBIDOS_LOCAL     ');
        clForma.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND      ');
        clForma.AddParam ('      (VE_CAIX=:VE_CAIX) AND      ');
        clForma.AddParam ('      (VE_VEND=:VE_VEND) AND      ');
        clForma.AddParam ('      (VE_ORDE=:VE_ORDE)          ');
        clForma.consulta.parambyname('VE_LOJA').AsFloat   := qFormas.fieldbyname('VF_LOJA').AsFloat;
        clForma.consulta.parambyname('VE_CAIX').AsFloat   := qFormas.fieldbyname('VF_CAIX').AsFloat;
        clForma.consulta.parambyname('VE_VEND').AsFloat   := qFormas.fieldbyname('VF_VEND').AsFloat;
        clForma.consulta.parambyname('VE_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
        if (clForma.Execute) then
        begin
                        {...}
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('- Dados do vale -');
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Numero do vale.....: '+trim(clForma.Result('VE_NUME')));
          DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Total do vale......: '+(trim(form_nc(clForma.Result('VE_VALO'),10))));
          if (clForma.result('VE_TIPO')='P') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: PRESENTE')
          else
          if (clForma.result('VE_TIPO')='S') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: SIMPLES')
          else
          if (clForma.result('VE_TIPO')='T') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: TROCO')
          else
          if (clForma.result('VE_TIPO')='D') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: DESCONTO')
          else
          if (clForma.result('VE_TIPO')='B') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: BRINDE')
          else
          if (clForma.result('VE_TIPO')='O') then
            DARUMAFS345_UsaComprovanteNaoFiscalVinculado('  Tipo de vale.......: BONUS');
        end;
        clForma.desconect;
        clForma.Free;
        DARUMAFS345_FechaComprovanteNaoFiscalVinculado;
      end;
      qFormas.next;
    end;
    qFormas.enablecontrols;
          //**********************************************************************************
    result := true;
  end;
end;

function abregaveta(Fini:Boolean=false):Boolean;
begin
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
    if fini and (BEMATECH_Inicializa <> 1) then
      exit;
    result := Bematech_AcionaGaveta = 1;
    if fini then
      BEMATECH_Finaliza;
  end
  else
    result := false;
end;

function  DeletaItemEcf(Pos:Integer;Descricao:String=''):Boolean; {*}
var
  clitem:TClassAuxiliar;
begin
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    Bematech_CancelaItemGenerico(inttostr(Pos))
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    DARUMAFS345_CancelaItemGenerico(inttostr(Pos))
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    URANOEFC_CancelaItem(Pchar(Descricao),Pchar(inttostr(Pos)))
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
    URANOEFC_1CancelaItem(Pchar(Descricao),Pchar(inttostr(Pos)))
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS)  then
    if Frm_LancaVenda <> nil then
      DATAREGISEFC_CancelaItem(Frm_LancaVenda.FlistaProd,Pos);

  Result := true;


end;

function  ImprimeSangria(Valor:Real;Sangria:String='S'):Boolean; {*}
begin
  result := false;
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    Bematech_Sangria(Valor,Sangria)
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    DARUMAFS345_Sangria(Valor,Sangria)
  else
    exit;
  result := true;
end;

end.
