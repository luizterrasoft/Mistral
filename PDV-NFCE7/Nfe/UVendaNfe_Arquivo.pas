unit UVendaNfe_Arquivo;

interface

uses UVendaNfe_Registro10, UVendaNfe_Registro12, UVendaNfe_Registro20,
     UVendaNfe_Registro21, UVendaNfe_Registro22, auxiliar, principal,
     funcoes2, SysUtils;

type
  TVendaNfe_Arquivo = class
  protected
    _cliente: Real;
    _caixa: Real;
    _loja: Real;
    _venda: Real;

    //incluir campos --> 16/07/2012
    _formpg       : Real;
    _InfoAdic     : String;
    _valorliquido : String;

    _registro10: TVendaNfe_Registro10;
    _registro12: TVendaNfe_Registro12;
    _registro20: TVendaNfe_Registro20;
    _registro21: TVendaNfe_Registro21;
    _registro22: TVendaNfe_Registro22;
  private
    function getCaixa     : Real;
    function getCliente   : Real;
    function getLoja      : Real;
    function getVenda     : Real;

     //incluir campos --> 16/07/2012
    function getformpg        : Real;
    function getInfoAdic      : String;
    function getvalorliquido  : String;

    function getRegistro10: TVendaNfe_Registro10;
    function getRegistro12: TVendaNfe_Registro12;
    function getRegistro20: TVendaNfe_Registro20;
    function getRegistro21: TVendaNfe_Registro21;
    function getRegistro22: TVendaNfe_Registro22;
    procedure setCaixa(const Value: Real);
    procedure setCliente(const Value: Real);
    procedure setLoja(const Value: Real);
    procedure setVenda(const Value: Real);

     //incluir campos --> 16/07/2012
    procedure setformpg(const Value: Real);
    procedure setInfoAdic(const Value: String);
    procedure setvalorliquido(const Value: String);

    procedure setRegistro10(const Value: TVendaNfe_Registro10);
    procedure setRegistro12(const Value: TVendaNfe_Registro12);
    procedure setRegistro20(const Value: TVendaNfe_Registro20);
    procedure setRegistro21(const Value: TVendaNfe_Registro21);
    procedure setRegistro22(const Value: TVendaNfe_Registro22);
  public
//    constructor Create(codCliente,codCaixa,codLoja,codVenda: Real);
    constructor Create(codCliente,codCaixa,codLoja,codVenda,form_pag: Real;infoadicionais : String;valorliquido : String);

    destructor Destroy; override;
    function CriaArquivoVendaNfe(dtVenda: TDateTime): Boolean;

    property Cliente: Real                       read getCliente       write setCliente;
    property Caixa: Real                         read getCaixa         write setCaixa;
    property Loja: Real                          read getLoja          write setLoja;
    property Venda: Real                         read getVenda         write setVenda;

    //incluir campos --> 16/07/2012
    property formpg   : Real                  read getformpg                  write setformpg;
    property InfoAdic : String                read getInfoAdic                write setInfoAdic;
    property valorliquido : String            read getvalorliquido            write setvalorliquido;

    property Registro10: TVendaNfe_Registro10    read getRegistro10    write setRegistro10;
    property Registro12: TVendaNfe_Registro12    read getRegistro12    write setRegistro12;
    property Registro20: TVendaNfe_Registro20    read getRegistro20    write setRegistro20;
    property Registro21: TVendaNfe_Registro21    read getRegistro21    write setRegistro21;
    property Registro22: TVendaNfe_Registro22    read getRegistro22    write setRegistro22;
  end;

implementation

{ TVendaNfe_Arquivo }

// constructor novo com campos novos
constructor TVendaNfe_Arquivo.Create(codCliente, codCaixa, codLoja, codVenda, form_pag: Real;infoadicionais : String;valorliquido : String);

//constructor TVendaNfe_Arquivo.Create(codCliente, codCaixa, codLoja, codVenda: Real);
begin
  _cliente      := codCliente;
  _caixa        := codCaixa;
  _loja         := codLoja;
  _venda        := codVenda;
  _formpg       := form_pag;
  _InfoAdic     := infoadicionais;
  _valorliquido := valorliquido;

  //*** Criando as classes que irão compor o arquivo ***
  _registro10 := TVendaNfe_Registro10.Create;
  _registro12 := TVendaNfe_Registro12.Create;
  _registro20 := TVendaNfe_Registro20.Create;
  _registro21 := TVendaNfe_Registro21.Create;
  _registro22 := TVendaNfe_Registro22.Create;
  //****************************************************
end;

function TVendaNfe_Arquivo.CriaArquivoVendaNfe(dtVenda: TDateTime): Boolean;
var
  qCliente,qProduto,qItemVenda,qCrediario,qVenda: TClassAuxiliar;
  nomeArquivo: String;
  contrato: Real;
begin
  nomeArquivo := FormatDateTime('YYYYMMDD',dtVenda)+form_nz(_venda,9)+'.rem';
  //****************************************************************************
  qCliente := TClassAuxiliar.Create;
  qCliente.Conect('CREDITO',frm_principal);
  qCliente.ClearSql;
  qCliente.AddParam('SELECT CL_NOME,CL_CPF,CL_IDEN,CL_TIPO_LOGRADOURO,CL_ENDE, ');
  qCliente.AddParam('       CL_NUMERO,CL_COMPLEMENTO,CL_BAIR,CL_IBGE_CIDADE,   ');
  qCliente.AddParam('       CL_IBGE_UF,CL_CEP,CL_CODIGO_PAIS,CL_FONE,CL_FAX,   ');
  qCliente.AddParam('       CL_EMAI                                            ');
  qCliente.AddParam('FROM CRECLI WHERE (CL_CODI=:cliente)                      ');
  qCliente.consulta.ParamByName('cliente').AsFloat := Cliente;
  qCliente.consulta.Open;
  if (not qCliente.consulta.IsEmpty) then
  begin
    with (Registro10) do
    begin
      Nome           := qCliente.Result('CL_NOME');
      CpfCnpj        := qCliente.Result('CL_CPF');
      RgIe           := qCliente.Result('CL_IDEN');
      TipoLogradouro := qCliente.Result('CL_TIPO_LOGRADOURO');
      Logradouro     := qCliente.Result('CL_ENDE');
      Numero         := qCliente.Result('CL_NUMERO');
      Complemento    := qCliente.Result('CL_COMPLEMENTO');
      Bairro         := qCliente.Result('CL_BAIR');
      IbgeCidade     := qCliente.Result('CL_IBGE_CIDADE');
      IbgeUf         := qCliente.Result('CL_IBGE_UF');
      Cep            := qCliente.Result('CL_CEP');
      CodPais        := qCliente.Result('CL_CODIGO_PAIS');
      Telefone       := qCliente.Result('CL_FONE');
      Fax            := qCliente.Result('CL_FAX');
      Email          := qCliente.Result('CL_EMAI');
      try
        EscreveRegistro(nomeArquivo);
      except
        Result := False;
      end;
    end;
    qVenda := TClassAuxiliar.Create;
    if frm_principal.x_online = true
       then
          qVenda.Conect('ESTOQUE',frm_principal)
          else
             qVenda.Conect(DataBaseProdutos,frm_principal);
    qVenda.ClearSql;
    qVenda.AddParam('SELECT VE_DESC FROM VENDAS');
    qVenda.AddParam('where ve_caix=:caixa and');
    qVenda.AddParam('      ve_loja=:loja and');
    qVenda.AddParam('      ve_codi=:venda');
    qVenda.consulta.ParamByName('caixa').AsFloat := _caixa;
    qVenda.consulta.ParamByName('loja').AsFloat  := _loja;
    qVenda.consulta.ParamByName('venda').AsFloat := _venda;
    qVenda.consulta.Open;
    with (Registro20) do
    begin
      Caixa          := _caixa;
      Loja           := _loja;
      Venda          := _venda;
      CpfCnpjCliente := qCliente.Result('CL_CPF');
      NomeCliente    := qCliente.Result('CL_NOME');
      DataVenda      := dtVenda;
      if not qVenda.consulta.IsEmpty then
      begin
        desconto     := qVenda.Result('VE_DESC');
        tipoDesconto := 'V';
      end
      else
      begin
        desconto     := 0;
        tipoDesconto := 'V';
      end;
      formpg  := _formpg;
      InfoAdic:= _InfoAdic;
      valorliquido := _valorliquido;
    end;
    qVenda.consulta.close;
  end;
  qCliente.Desconect;
  qCliente.Free;
  //****************************************************************************
  qItemVenda := TClassAuxiliar.Create;
  qItemVenda.Conect(DataBaseProdutos,frm_principal);
  qItemVenda.ClearSql;
  qItemVenda.AddParam('SELECT IV_GRUP,IV_SUBG,IV_PROD,IV_CORE,IV_TAMA, ');
  qItemVenda.AddParam('       IV_TOTA,IV_QTDE,IV_SEQ,IV_PDES,IV_DESC,IV_ACRE,IV_DATA   ');
  qItemVenda.AddParam('FROM ITENS_VENDAS                               ');
  qItemVenda.AddParam('WHERE (IV_CAIX=:caixa) AND                      ');
  qItemVenda.AddParam('      (IV_LOJA=:loja) AND                       ');
  qItemVenda.AddParam('      (IV_VEND=:venda) AND                      ');
  qItemVenda.AddParam('      (IV_STAT='+QuotedStr('1')+')              ');
  qItemVenda.AddParam('ORDER BY IV_SEQ                                 ');
  qItemVenda.consulta.ParamByName('caixa').AsFloat := _caixa;
  qItemVenda.consulta.ParamByName('loja').AsFloat  := _loja;
  qItemVenda.consulta.ParamByName('venda').AsFloat := _venda;
  qItemVenda.consulta.Open;
  if (not qItemVenda.consulta.IsEmpty) then
  begin
    qProduto := TClassAuxiliar.Create;
    qProduto.Conect(DataBaseProdutos,frm_principal);
    while (not qItemVenda.Eof) do
    begin
      qProduto.ClearSql;
      qProduto.AddParam('SELECT PR_NCM,ES_DESC,PR_UNID,PR_TIPO,PR_MVA,      ');
      qProduto.AddParam('       case when es_upc1>0 then es_upc1 else ES_PVE1/2 end as es_upc1,');
      qProduto.AddParam('       ES_PVE1,PR_ORIG,PR_REFI,PR_DESC,'            );
      qProduto.AddParam('       ES_CBAR,');
      qProduto.AddParam('       case when ES_UPC1>0 THEN (((ES_PVE1*100)/ES_UPC1)-100) else 50 end AS MARGEM');
      qProduto.AddParam('FROM PRODUTOS                                      ');
      qProduto.AddParam('LEFT JOIN ESTOQUE ON (PR_GRUP=ES_GRUP) AND         ');
      qProduto.AddParam('                     (PR_SUBG=ES_SUBG) AND         ');
      qProduto.AddParam('                     (PR_CODI=ES_PROD)             ');
      qProduto.AddParam('WHERE (ES_GRUP=:grupo) AND (ES_SUBG=:subgrupo) AND ');
      qProduto.AddParam('      (ES_PROD=:produto) AND (ES_CORE=:cor) AND    ');
      qProduto.AddParam('      (ES_TAMA=:tamanho)                           ');
      qProduto.consulta.ParamByName('grupo').AsFloat    := qItemVenda.Result('IV_GRUP');
      qProduto.consulta.ParamByName('subgrupo').AsFloat := qItemVenda.Result('IV_SUBG');
      qProduto.consulta.ParamByName('produto').AsFloat  := qItemVenda.Result('IV_PROD');
      qProduto.consulta.ParamByName('cor').AsFloat      := qItemVenda.Result('IV_CORE');
      qProduto.consulta.ParamByName('tamanho').AsString := qItemVenda.Result('IV_TAMA');
      qProduto.consulta.Open;
      if (not qProduto.consulta.IsEmpty) then
      begin
        with (Registro12) do
        begin
          CodigoProduto := form_nz(qItemVenda.Result('IV_GRUP'),2)+
                           form_nz(qItemVenda.Result('IV_SUBG'),2)+
                           form_nz(qItemVenda.Result('IV_PROD'),4);
          Ncm           := qProduto.Result('PR_NCM');
          Descricao     := qProduto.Result('ES_DESC');
          DescricaoMestre:=qProduto.Result('PR_DESC');
          Unidade       := qProduto.Result('PR_UNID');
          TipoProduto   := qProduto.Result('PR_TIPO');
          Mva           := qProduto.Result('PR_MVA');
          PrecoCusto    := qProduto.Result('ES_UPC1');
          Margem        := qProduto.Result('MARGEM');
          PrecoVenda    := qProduto.Result('ES_PVE1');
          Origem        := qProduto.Result('PR_ORIG');
          RefInterna    := qProduto.Result('PR_REFI');
          codBarras     := qProduto.Result('ES_CBAR');
          try
            EscreveRegistro(nomeArquivo);
          except
            Result := False;
          end;
        end;
      end;
      qProduto.consulta.Close;
      qItemVenda.Next;
    end;

    try
      Registro20.EscreveRegistro(nomeArquivo);
    except
      Result := False;
    end;

    qItemVenda.First;
    while (not qItemVenda.Eof) do
    begin
      qProduto.ClearSql;
      qProduto.AddParam('SELECT PR_REFI,PR_CSOSN,ES_CBAR');
      qProduto.AddParam('FROM PRODUTOS                                      ');
      qProduto.AddParam('LEFT JOIN ESTOQUE ON (PR_GRUP=ES_GRUP) AND         ');
      qProduto.AddParam('                     (PR_SUBG=ES_SUBG) AND         ');
      qProduto.AddParam('                     (PR_CODI=ES_PROD)             ');
      qProduto.AddParam('WHERE (ES_GRUP=:grupo) AND (ES_SUBG=:subgrupo) AND ');
      qProduto.AddParam('      (ES_PROD=:produto) AND (ES_CORE=:cor) AND    ');
      qProduto.AddParam('      (ES_TAMA=:tamanho)                           ');
      qProduto.consulta.ParamByName('grupo').AsFloat    := qItemVenda.Result('IV_GRUP');
      qProduto.consulta.ParamByName('subgrupo').AsFloat := qItemVenda.Result('IV_SUBG');
      qProduto.consulta.ParamByName('produto').AsFloat  := qItemVenda.Result('IV_PROD');
      qProduto.consulta.ParamByName('cor').AsFloat      := qItemVenda.Result('IV_CORE');
      qProduto.consulta.ParamByName('tamanho').AsString := qItemVenda.Result('IV_TAMA');
      qProduto.consulta.Open;

      with (Registro21) do
      begin
        Venda         := _venda;
        Item          := qItemVenda.Result('IV_SEQ');
        CodigoProduto := form_nz(qItemVenda.Result('IV_GRUP'),2)+
                         form_nz(qItemVenda.Result('IV_SUBG'),2)+
                         form_nz(qItemVenda.Result('IV_PROD'),4);

        //FORMULA DO DESCONTO DO ITEM ANTIGA
        if  (qItemVenda.Result('IV_DESC') > 0) or (qItemVenda.Result('IV_ACRE') > 0)
            then
            begin
               if (qItemVenda.Result('IV_DESC') > 0) then
                  PrecoVendido  := (qItemVenda.Result('IV_TOTA')/qItemVenda.Result('IV_QTDE')) + (qItemVenda.Result('IV_DESC')  / qItemVenda.Result('IV_QTDE'))   // + ((qItemVenda.Result('IV_DESC')/100) * qItemVenda.Result('IV_QTDE')))
               else
               if  (qItemVenda.Result('IV_ACRE') > 0)
               then
                 PrecoVendido  := (qItemVenda.Result('IV_TOTA')/qItemVenda.Result('IV_QTDE')) - (qItemVenda.Result('IV_ACRE') / qItemVenda.Result('IV_QTDE'))  ; // - ((qItemVenda.Result('IV_ACRE')/100) * qItemVenda.Result('IV_QTDE')));
            end
            else
              PrecoVendido  := (qItemVenda.Result('IV_TOTA')/qItemVenda.Result('IV_QTDE'));

        if (PrecoVendido < 0) then
            PrecoVendido := PrecoVendido * (-1); 

        Quantidade    := qItemVenda.Result('IV_QTDE');
        Desconto      := qItemVenda.Result('IV_PDES');

        //VALOR DO DESCONTO DO ITEM
        valorDesconto := qItemVenda.Result('IV_DESC')  / qItemVenda.Result('IV_QTDE');
        valorAcrescimo := qItemVenda.Result('IV_ACRE') / qItemVenda.Result('IV_QTDE') ;

        if qProduto.consulta.IsEmpty then
        begin
          refInterna := '';
          codBarras  := '';
          csosn      := '';
        end
        else
        begin
          refInterna := qProduto.Result('PR_REFI');
          codBarras  := qProduto.Result('ES_CBAR');
          csosn := qProduto.Result('PR_CSOSN');
        end;
        qProduto.consulta.Close;
        try
          EscreveRegistro(nomeArquivo);
        except
          Result := False;
        end;
      end;
      qItemVenda.Next;
    end;
  end;
  qProduto.Desconect;
  qProduto.Free;

  qItemVenda.Desconect;
  qItemVenda.Free;

  qCrediario := TClassAuxiliar.Create;
  qCrediario.Conect(databaseprodutos,frm_principal);
  qCrediario.ClearSql;
  qCrediario.AddParam('SELECT CR_CONT FROM CREDIARIOS ');
  qCrediario.AddParam('WHERE (CR_CAIX=:caixa) AND     ');
  qCrediario.AddParam('      (CR_LOJA=:loja) AND      ');
  qCrediario.AddParam('      (CR_VEND=:venda)         ');
  qCrediario.consulta.ParamByName('caixa').AsFloat := _caixa;
  qCrediario.consulta.ParamByName('loja').AsFloat  := _loja;
  qCrediario.consulta.ParamByName('venda').AsFloat := _venda;
  qCrediario.consulta.Open;
  if (not qCrediario.consulta.IsEmpty) then
  begin
    contrato := qCrediario.Result('CR_CONT');
    //***************************************
    qCrediario.consulta.Close;
    qCrediario.Desconect;
    //***************************************
    qCrediario.Conect('CREDITO',frm_principal);
    qCrediario.ClearSql;
    qCrediario.AddParam('SELECT PC_VALO,PC_DVTO        ');
    qCrediario.AddParam('FROM CREPRABR                 ');
    qCrediario.AddParam('WHERE (PC_CONT=:contrato) AND ');
    qCrediario.AddParam('      (PC_CLIE=:cliente)      ');
    qCrediario.consulta.ParamByName('contrato').AsFloat := contrato;
    qCrediario.consulta.ParamByName('cliente').AsFloat  := _cliente;
    qCrediario.consulta.Open;
    if (not qCrediario.consulta.IsEmpty) then
    begin
      while (not qCrediario.Eof) do
      begin
        with (Registro22) do
        begin
          Venda       := _venda;
          Fatura      := contrato;
          ValorFatura := qCrediario.Result('PC_VALO');
          Vencimento  := qCrediario.Result('PC_DVTO');
          try
            EscreveRegistro(nomeArquivo);
          except
            Result := False;
          end;
        end;
        qCrediario.Next;
      end;
    end;
  end;
  qCrediario.Desconect;
  qCrediario.Free;

  Result := True;
end;

destructor TVendaNfe_Arquivo.Destroy;
begin
  //*** Liberando as classes da memória ***
  _registro10.Free;
  _registro12.Free;
  _registro20.Free;
  _registro21.Free;
  _registro22.Free;
  //***************************************
end;

function TVendaNfe_Arquivo.getCaixa: Real;
begin
  Result := _caixa;
end;

function TVendaNfe_Arquivo.getCliente: Real;
begin
  Result := _cliente;
end;

function TVendaNfe_Arquivo.getLoja: Real;
begin
  Result := _loja;
end;

function TVendaNfe_Arquivo.getRegistro10: TVendaNfe_Registro10;
begin
  Result := _registro10;
end;

function TVendaNfe_Arquivo.getRegistro12: TVendaNfe_Registro12;
begin
  Result := _registro12;
end;

function TVendaNfe_Arquivo.getRegistro20: TVendaNfe_Registro20;
begin
  Result := _registro20;
end;

function TVendaNfe_Arquivo.getRegistro21: TVendaNfe_Registro21;
begin
  Result := _registro21;
end;

function TVendaNfe_Arquivo.getRegistro22: TVendaNfe_Registro22;
begin
  Result := _registro22;
end;

function TVendaNfe_Arquivo.getVenda: Real;
begin
  Result := _venda;
end;

function TVendaNfe_Arquivo.getformpg: Real;
begin
  Result := _formpg;
end;

function TVendaNfe_Arquivo.getInfoAdic : String;
begin
   Result := _InfoAdic;
end;

function TVendaNfe_Arquivo.getvalorliquido : String;
begin
   Result := _valorliquido;
end;

procedure TVendaNfe_Arquivo.setCaixa(const Value: Real);
begin
  _caixa := Value;
end;

procedure TVendaNfe_Arquivo.setCliente(const Value: Real);
begin
  _cliente := Value;
end;

procedure TVendaNfe_Arquivo.setLoja(const Value: Real);
begin
  _loja := Value;
end;

procedure TVendaNfe_Arquivo.setRegistro10(
  const Value: TVendaNfe_Registro10);
begin
  _registro10 := Value;
end;

procedure TVendaNfe_Arquivo.setRegistro12(
  const Value: TVendaNfe_Registro12);
begin
  _registro12 := Value;
end;

procedure TVendaNfe_Arquivo.setRegistro20(
  const Value: TVendaNfe_Registro20);
begin
  _registro20 := Value;
end;

procedure TVendaNfe_Arquivo.setRegistro21(
  const Value: TVendaNfe_Registro21);
begin
  _registro21 := Value;
end;

procedure TVendaNfe_Arquivo.setRegistro22(
  const Value: TVendaNfe_Registro22);
begin
  _registro22 := Value;
end;

procedure TVendaNfe_Arquivo.setVenda(const Value: Real);
begin
  _venda := Value;
end;

procedure TVendaNfe_Arquivo.setformpg(const Value: Real);
begin
  _formpg := Value;
end;

procedure TVendaNfe_Arquivo.setInfoAdic(const Value: String);
begin
  _InfoAdic := Value;
end;

procedure TVendaNfe_Arquivo.setvalorliquido(const Value: String);
begin
  _valorliquido := Value;
end;

end.
