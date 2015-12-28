unit DM1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMF8 = class(TDataModule)
    qGruposProdutosF8: TQuery;
    qGruposProdutosF8GR_CODI: TFloatField;
    qGruposProdutosF8GR_DESC: TStringField;
    qSubGruposF8: TQuery;
    qSubGruposF8SG_GRUP: TFloatField;
    qSubGruposF8SG_CODI: TFloatField;
    qSubGruposF8SG_DESC: TStringField;
    qProdutos2F8: TQuery;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    qFaixasF8: TQuery;
    qFaixasF8PF_GRUP: TFloatField;
    qFaixasF8PF_SUBG: TFloatField;
    qFaixasF8PF_PROD: TFloatField;
    qFaixasF8PF_TAMA: TStringField;
    qCoresF8: TQuery;
    qCoresF8CR_CODI: TFloatField;
    qCoresF8CR_DESC: TStringField;
    qVendF8: TQuery;
    qVendF8VD_CODI: TFloatField;
    qVendF8VD_NOME: TStringField;
    qFornF8: TQuery;
    qFornF8FO_CODI: TFloatField;
    qFornF8FO_RAZA: TStringField;
    qFormaPgtoF8: TQuery;
    qFormaPgtoF8FO_CODI: TFloatField;
    qFormaPgtoF8FO_DESC: TStringField;
    qAdmF8: TQuery;
    qAdmF8AM_CODI: TFloatField;
    qAdmF8AM_DESC: TStringField;
    qPlanoF8: TQuery;
    qPlanoF8PL_CODI: TFloatField;
    qPlanoF8PL_TIPO: TStringField;
    qPlanoF8PL_QTPR: TFloatField;
    qPlanoF8PL_CARN: TStringField;
    qPlanoF8PL_BOLE: TStringField;
    qPlanoF8PL_BAIX: TStringField;
    qPlanoF8PL_CART: TStringField;
    qPlanoF8PL_CHEQ: TStringField;
    qPlanoF8PL_LOCA: TStringField;
    qPlanoF8carn: TStringField;
    qPlanoF8bole: TStringField;
    qPlanoF8baix: TStringField;
    qPlanoF8cart: TStringField;
    qPlanoF8cheq: TStringField;
    qPlanoF8loca: TStringField;
    qLojaF8: TQuery;
    qLojaF8LO_CODI: TFloatField;
    qLojaF8LO_NOME: TStringField;
    qSitF8: TQuery;
    qSitF8SI_CODI: TStringField;
    qSitF8SI_DESC: TStringField;
    qUsersF8: TQuery;
    qUsersF8USCODE: TFloatField;
    qUsersF8USNAME: TStringField;
    qClientesF8: TQuery;
    qClientesF8CL_CODI: TFloatField;
    qClientesF8CL_NOME: TStringField;
    qClientesF8CL_ENDE: TStringField;
    qClientesF8CL_BAIR: TStringField;
    qClientesF8CL_CPF: TStringField;
    qClientesF8CL_DTNA: TDateTimeField;
    qClientesF8CL_IDEN: TStringField;
    qClientesF8cCL_CPF: TStringField;
    qBancosF8: TQuery;
    qBancosF8BA_CODI: TFloatField;
    qBancosF8BA_NOME: TStringField;
    qConsultaProdutos2: TQuery;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    qConsultaProdutos2PR_GRUP: TFloatField;
    qConsultaProdutos2PR_SUBG: TFloatField;
    qConsultaProdutos2PR_FORN: TFloatField;
    qConsultaProdutos2PR_DESC: TStringField;
    qConsultaProdutos2PR_REFI: TStringField;
    qConsultaProdutos2PR_REFF: TStringField;
    qConsultaProdutos2PR_CODI: TFloatField;
    qConsultaProdutos2ES_CORE: TFloatField;
    qConsultaProdutos2ES_TAMA: TStringField;
    qConsultaProdutos2ES_OTAM: TSmallintField;
    qConsultaProdutos2ES_CBAR: TStringField;
    qCoresF8cSORT: TStringField;
    qCoresProdutosF8: TQuery;
    qFaixasF8PF_SEQ: TIntegerField;
    qFornF8FO_NFAN: TStringField;
    qAdmF8AM_PARC: TStringField;
    qAdmF8cAM_PARC: TStringField;
    qFormaPgtoF8cOK: TStringField;
    qAdmF8AM_TIPO: TSmallintField;
    qAdmF8AL_LOJA: TFloatField;
    qContasF8: TQuery;
    qContasF8CO_CODI: TFloatField;
    qContasF8CO_DESC: TStringField;
    qContasF8CO_NATU: TStringField;
    qContasF8cNatureza: TStringField;
    qVendF8VD_CARG: TStringField;
    qFormaPgtoF82: TQuery;
    FloatField1: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    qCaixaF8: TQuery;
    FloatField5: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    qPortF8: TQuery;
    qPortF8PO_CODI: TFloatField;
    qPortF8PO_NOME: TStringField;
    qConsultaProdutos2ES_IPPT: TStringField;
    qConsultaProdutos2ES_SITR: TStringField;
    qConsultaProdutos2PR_UNID: TStringField;
    qConsultaProdutos2ES_IAT: TStringField;
    qCompradoresf8: TQuery;
    qCompradoresf8CC_CLIE: TFloatField;
    qCompradoresf8CC_NCO1: TStringField;
    qConsultaProdutos2PR_NCM: TStringField;
    StringField23: TStringField;
    qCidadeF8: TQuery;
    qCidadeF8CIDADE: TStringField;
    qCidadeF8UF: TStringField;
    intgrfldCidadeF8IBGE: TIntegerField;
    intgrfldCidadeF8IBGE_UF: TIntegerField;
    qPaisF8: TQuery;
    qPaisF8ID: TStringField;
    qPaisF8PAIS: TStringField;
    procedure qFormaPgtoF8_AVistaCalcFields(DataSet: TDataSet);
    procedure qClientesF8CalcFields(DataSet: TDataSet);
    procedure qConsultaProdutos2AfterClose(DataSet: TDataSet);
    procedure qConsultaProdutos2AfterOpen(DataSet: TDataSet);
    procedure qConsultaProdutos2AfterScroll(DataSet: TDataSet);
    procedure qConsultaProdutos2CalcFields(DataSet: TDataSet);
    procedure qCoresProdutosF8CalcFields(DataSet: TDataSet);
    procedure qAdmF8CalcFields(DataSet: TDataSet);
    procedure qFormaPgtoF8CalcFields(DataSet: TDataSet);
    procedure qPlanoF8CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMF8: TDMF8;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, procura, un_ConsultaProdutos, auxiliar, venda, principal;

procedure TDMF8.qFormaPgtoF8_AVistaCalcFields(DataSet: TDataSet);
begin
  if (dataset.fieldbyname('cFO_CODI').IsNull) then
    dataset.fieldbyname('cFO_CODI').AsString :=
      form_nz(strtofloat(Copy(dataset.fieldbyname('FO_CODI').AsString,2,1)),2);
end;

procedure TDMF8.qClientesF8CalcFields(DataSet: TDataSet);
begin
  with (dataset) do
    if (fieldbyname('cCL_CPF').IsNull) then
      fieldbyname('cCL_CPF').AsString := FormataCNPJ(fieldbyname('CL_CPF').AsString);
end;

procedure TDMF8.qConsultaProdutos2AfterClose(DataSet: TDataSet);
begin
  try
    frm_consultaProduto.pnNomeProduto.caption := ' ';
  except
  end;
end;

procedure TDMF8.qConsultaProdutos2AfterOpen(DataSet: TDataSet);
begin
  if (DataSet.recordcount<>0) then
    try
      frm_consultaProduto.pnNomeProduto.caption :=
        ' Gr.Subgr.Cod: '+form_nz(qConsultaProdutos2.fieldbyname('PR_GRUP').AsFloat,2)+
        form_nz(qConsultaProdutos2.fieldbyname('PR_SUBG').AsFloat,2)+
        form_nz(qConsultaProdutos2.fieldbyname('PR_CODI').AsFloat,4)+'   -'+
        'Ref.Interna: '  +qConsultaProdutos2.fieldbyname('PR_REFI').AsString+'   -'+
        'Ref.Fab: '  +qConsultaProdutos2.fieldbyname('PR_REFF').AsString+'   -'+
        'Cod.Barra: '+qConsultaProdutos2.fieldbyname('cBarra').AsString;
    except
    end
  else
    frm_consultaProduto.pnNomeProduto.caption := ' [Sem itens a serem exibidos]';
end;

procedure TDMF8.qConsultaProdutos2AfterScroll(DataSet: TDataSet);
begin
  if (DataSet.recordcount<>0) then
  begin
    try
      frm_consultaProduto.pnNomeProduto.caption :=
        ' Gr.Subgr.Cod: '+form_nz(qConsultaProdutos2.fieldbyname('PR_GRUP').AsFloat,2)+
        form_nz(qConsultaProdutos2.fieldbyname('PR_SUBG').AsFloat,2)+
        form_nz(qConsultaProdutos2.fieldbyname('PR_CODI').AsFloat,4)+'   -'+
        'Ref.Interna: '  +qConsultaProdutos2.fieldbyname('PR_REFI').AsString+'   -'+
        'Ref.Fab: '  +qConsultaProdutos2.fieldbyname('PR_REFF').AsString+'   -'+
        'Cod.Barra: '+qConsultaProdutos2.fieldbyname('cBarra').AsString;
      if (frm_principal.x_online) then
        frm_ConsultaProduto.pnEstoque.Caption := frm_ConsultaProduto.ConsultaEstoqueProduto;
    except
    end;
  end
  else
    frm_consultaProduto.pnNomeProduto.caption := ' [Sem itens a serem exibidos]';
end;

procedure TDMF8.qConsultaProdutos2CalcFields(DataSet: TDataSet);
begin
  with (qConsultaProdutos2) do
  begin
    if (fieldbyname('cPVenda').IsNull) then
      fieldbyname('cPVenda').AsString :=
        form_nc(DevolvePrecoItem (frm_principal.x_loja,
        fieldbyname('PR_GRUP').AsFloat,
        fieldbyname('PR_SUBG').AsFloat,
        fieldbyname('PR_CODI').AsFloat,
        fieldbyname('ES_CORE').AsFloat,
        fieldbyname('ES_TAMA').AsString,
        '1')
        ,10);

    if (fieldbyname('cPCusto').IsNull) then
      fieldbyname('cPCusto').AsString :=
        form_nc(DevolvePrecoCusto (
        fieldbyname('PR_GRUP').AsFloat,
        fieldbyname('PR_SUBG').AsFloat,
        fieldbyname('PR_CODI').AsFloat,
        fieldbyname('ES_CORE').AsFloat,
        fieldbyname('ES_TAMA').AsString,
        '1')
        ,10);

    if (fieldbyname('nomeforn').IsNull) then
      fieldbyname('nomeforn').AsString :=
        ProcuraNomeForn(fieldbyname('PR_FORN').AsFloat,self);
    if (fieldbyname('nome_produto').IsNull) then
      fieldbyname('nome_produto').AsString :=
        form_t(fieldbyname('PR_DESC').AsString,48);
    if (fieldbyname('cCor').IsNull) then
      if (fieldbyname('ES_CORE').AsFloat<>0) then
        fieldbyname('cCor').AsString :=
          form_nz(fieldbyname('ES_CORE').AsFloat,4)+'-'+
          ProcuraNomeCor(fieldbyname('ES_CORE').AsFloat,self)
      else
        fieldbyname('cCor').AsString := 'UNICA';
    if (fieldbyname('cTam').IsNull) then
      if (fieldbyname('ES_TAMA').AsString<>'0') then
        fieldbyname('cTam').AsString := fieldbyname('ES_TAMA').AsString
      else
        fieldbyname('cTam').AsString := 'UNICO';
    if (fieldbyname('cBarra').IsNull) then
      fieldbyname('cBarra').AsString := fieldbyname('ES_CBAR').AsString
    else
      fieldbyname('cBarra').AsString := 'N/CAD';
  end;
end;

procedure TDMF8.qCoresProdutosF8CalcFields(DataSet: TDataSet);
begin
  with (dataset) do
    if (fieldbyname('cSORT').IsNull) then
      if (fieldbyname('CR_SORT').AsString='0') then
        fieldbyname('cSORT').AsString := 'NÃO'
      else
      if (fieldbyname('CR_SORT').AsString='1') then
        fieldbyname('cSORT').AsString := 'SIM!!';
end;

procedure TDMF8.qAdmF8CalcFields(DataSet: TDataSet);
begin
  with (dataset) do
    if (fieldbyname('cAM_PARC').IsNull) then
      if (fieldbyname('AM_TIPO').AsInteger=1) then //CREDITO
      begin
        if (fieldbyname('AM_PARC').AsString='0') then
          fieldbyname('cAM_PARC').AsString := ' - '
        else
        if (fieldbyname('AM_PARC').AsString='1') then
          fieldbyname('cAM_PARC').AsString := 'SIM';
      end
      else
      if (fieldbyname('AM_TIPO').AsInteger=0) then //DEBITO
        fieldbyname('cAM_PARC').AsString := ' - ';
end;

procedure TDMF8.qFormaPgtoF8CalcFields(DataSet: TDataSet);
begin
  with (dataset) do
    if (fieldbyname('cOK').IsNull) then
      if (fieldbyname('FO_CODI').AsFloat=KFPGT_CREDITO) then //testa o crediario
      begin
        if (databasecredito<>'CREDITO') then
          fieldbyname('cOK').AsString := '0' //credito inacessivel!!!!
        else
          fieldbyname('cOK').AsString := '1';
      end
      else
        fieldbyname('cOK').AsString := '1';
end;

procedure TDMF8.qPlanoF8CalcFields(DataSet: TDataSet);
begin
  with (qPlanoF8) do
  begin
    if (fieldbyname('PL_CARN').asstring='0') then
      fieldbyname('carn').asstring:='Não'
    else
      fieldbyname('carn').asstring:='Sim';
    if (fieldbyname('PL_BOLE').asstring='0') then
      fieldbyname('bole').asstring:='Não'
    else
      fieldbyname('bole').asstring:='Sim';
    if (fieldbyname('PL_BAIX').asstring='0') then
      fieldbyname('baix').asstring:='Não'
    else
      fieldbyname('baix').asstring:='Sim';
    if (fieldbyname('PL_CART').asstring='0') then
      fieldbyname('cart').asstring:='Não'
    else
      fieldbyname('cart').asstring:='Sim';
    if (fieldbyname('PL_CHEQ').asstring='0') then
      fieldbyname('cheq').asstring:='Não'
    else
      fieldbyname('cheq').asstring:='Sim';
    if (fieldbyname('PL_LOCA').asstring='0') then
      fieldbyname('loca').asstring:='Sim'
    else
      fieldbyname('loca').asstring:='Não';
  end;
end;

end.
