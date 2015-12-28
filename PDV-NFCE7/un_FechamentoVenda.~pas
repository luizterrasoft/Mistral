{ - FALTA 'AMARRAR' OS DESCONTOS, DE ACORDO COM O CONFIGURADO NO PEDIDO - Se for um desconto maior
  pedir senha do supervisor}
{ - ATENCAO: Esta versao nao foi testada ainda com venda possuindo 'troca' embutida, pois o total trocado
             vai como desconto, e somente os itens vendidos sao impressos no cupom fiscal!!!}
unit un_FechamentoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StrUtils, Math,
  ExtCtrls, StdCtrls, Grids, DBGrids, Mask, Db, DBTables, Menus, Gauges, urano, urano1efc,
  auxiliar, bematech, darumaFS345, dataregis,funcoesglobais,serial,uDPOSDLL, IniFiles;

type
   TResultArray = array of string;


  Tfrm_FechamentoVenda = class(TForm)
    Image2: TImage;
    botao1: TPanel;
    btnFechar: TPanel;
    pnVendedor: TPanel;
    Panel1: TPanel;
    grade: TDBGrid;
    lblForma: TLabel;
    edtCodForma: TMaskEdit;
    pnForma: TPanel;
    edtValor: TMaskEdit;
    pnTroco: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lblNDoc1: TLabel;
    edtNDoc: TMaskEdit;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparedits1: TMenuItem;
    Inserirforma1: TMenuItem;
    Processarvenda1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    ds: TDataSource;
    qFormas: TQuery;
    qFormasVF_CAIX: TFloatField;
    qFormasVF_LOJA: TFloatField;
    qFormasVF_VEND: TFloatField;
    qFormasVF_ORDE: TSmallintField;
    qFormasVF_FPGT: TFloatField;
    qFormasVF_VALO: TFloatField;
    qFormasnomeForma: TStringField;
    qFormasvalorPago: TStringField;
    qFormasordem: TStringField;
    N2: TMenuItem;
    qFormasVF_TROC: TFloatField;
    lblNDoc2: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    imagemEmpresa: TImage;
    Image1: TImage;
    botao_sair: TPanel;
    lblModoVenda: TLabel;
    Label1: TLabel;
    Label12: TLabel;
    lblValor3: TLabel;
    Bevel2: TBevel;
    Label15: TLabel;
    pnFinanc: TPanel;
    pnFinanc1: TPanel;
    Label2: TLabel;
    Label22: TLabel;
    pnVendaReal: TPanel;
    pnFinanc2: TPanel;
    pnFinanc3: TPanel;
    Label8: TLabel;
    Label4: TLabel;
    pnSaldoAPagar: TPanel;
    N3: TMenuItem;
    Ajuda1: TMenuItem;
    Bevel3: TBevel;
    pnFinanc21: TPanel;
    Label25: TLabel;
    edtDesc: TMaskEdit;
    Label5: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    pnTotalVenda: TPanel;
    edtTotalDesc: TMaskEdit;
    Label14: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblStatus: TLabel;
    pnVend: TPanel;
    pnECF: TPanel;
    pnCaixa: TPanel;
    pnLoja: TPanel;
    pnSit: TPanel;
    pnDia: TPanel;
    pnData: TPanel;
    lblValor4: TLabel;
    lblValor: TLabel;
    lblValor2: TLabel;
    Image3: TImage;
    Memo2: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtDescEnter(Sender: TObject);
    procedure edtDescExit(Sender: TObject);
    procedure edtTotalDescEnter(Sender: TObject);
    procedure edtTotalDescExit(Sender: TObject);
    procedure edtTotalDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodFormaDblClick(Sender: TObject);
    procedure edtCodFormaEnter(Sender: TObject);
    procedure edtCodFormaExit(Sender: TObject);
    procedure edtCodFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorChange(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparedits1Click(Sender: TObject);
    procedure Inserirforma1Click(Sender: TObject);
    procedure qFormasCalcFields(DataSet: TDataSet);
    procedure edtNDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNDocEnter(Sender: TObject);
    procedure Processarvenda1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function abrirgavetafp:Boolean;    { Private declarations }
  public
    { Public declarations }
    continuaConclusao : Boolean;
    totalEntrada, codEntrada: Real;
    codigoCliente,codigoContrato,codigoBoleta: Real;
    totalContrato,totalFinanciado: Real;

    tipoDesconto,tipoAcrescimo, Tipo_Nota : String;
    descontoVenda,acrescimoVenda: Boolean;
    Credito_Troca, HouveCredito_Troca : Boolean;
    descontoCupom,acrescimoCupom: Real;
    naoGravouCrediario: Boolean;

    //****************************************************************************************
    //Atributos relacionados com o funcionamento
    //****************************************************************************************
    jaChamou: Boolean;
    tecla: Integer;
    y_caixa,y_loja,y_venda: Real;
    y_total_venda: Real; {armazena o total da venda efetuada - É FIXA!!!!}
    y_novo_total_venda: Real; {armazena o total de venda com desconto}
    y_saldo_venda: Real; {armazena o total que falta para ser pago - muda, com desconto, e formas de pgto.}
    y_tipz: String; {define o 1-DENTRO(nota manual)/2-FORA/3-DENTRO(cupom fiscal)}
    y_percentual_comissionavel: Real; {define quantos POR CENTO da venda total sera comissionada}
    JaEnviouDescontoDataRegisItem: Boolean; {FLAG que indica se o vai desconto ou nao!}
    CuponCartao,CuponDebito: String;
    valor_informado: Real;

    //****************************************************************************************
    //Atributos relacionados com o PROCESSAMENTO do fechamento da VENDA
    //****************************************************************************************
    total_qtde1: Real;
    total_qtde2: Real;
    total_venda_por_itens: Real;

    {********************************************************************************************}
    {configuracoes gerais da NFE e NFCE  ***}
    {********************************************************************************************}

    NFCE_DESC, NFCE_QTDE, NFCE_PUNIT, NFCE_VALITEM, NFCE_CODVD, NFCE_NCM, NFCE_UNID  : string;
    Ngrupo, Nsubgrupo, Ncodigo : real;
    NFCE_TOT_ITENS : integer;
    A_NFCE_COD    : array[1..20] of String;
    A_NFCE_NCM    : array[1..20] of String;
    A_NFCE_DESCR  : array[1..20] of String;
    A_NFCE_UNIDADE : array[1..20] of String;
    sArquivoEntNfe,sArquivoEntNfe2, sArquivoSaiNfe : String;
    lArq,vrAux3 : TStringList;
    gera_sai_nfe : boolean;
    A_STATUS_SEFAZ : array[1..30] of String;
//
  y_BaseICMS, y_ValorICMS, y_ValorProduto, y_BaseICMSSubstituicao, y_ValorICMSSubstituicao, y_ValorFrete,
  y_ValorSeguro, y_ValorDesconto, y_ValorIPI, y_ValorPIS, y_ValorCOFINS, y_ValorOutrasDespesas : Real ;
  y_aliquota, y_ValorPRodutos : real;
  y_vFrete, y_vSeg, y_Desc, y_vOutro : real;

  //
    //****************************************************************************************
    //  VARIAVEIS Y
    //****************************************************************************************

    y_cgc,y_nome,y_tipo_logradouro,y_endereco,y_complemento,y_cliente: String;
    y_insc,y_orgexp, y_bairro,y_cep,y_uf,y_cidade,y_pais,y_cod_pais,y_email: String;
    y_numero,y_cod_cidadeIBGE,y_cod_ufIBGE: Integer;
    y_codigoCliente: Real;
    y_clienteCadastrado: Boolean;

    y_form_pg       : Real;
    y_info_adic     : string;
    y_valorliquido  : string;
    y_desc_plano : string;

    vrAux, sCSTat, NDOC : String;

    //****************************************************************************************
    //Procedimentos auxiliares
    //****************************************************************************************

    //****************************************************************************************
    pNumeroEmpresa,pNumeroLoja,pTipoRegistro,pData,pHora,pcodigoTransacao,pNumeroEquipamento,pNumeroFiscalEquipamentos: String;
    pNumeroCupom,pValorTransacao1,pTipoColetaCartao,pNumeroAutorizador,pNumeroCartao,pVencimentoCartao,pTipoOperacao1: String;
    pNumeroParcelas1,pValorParcela1,pValorTaxaServico1,pcodigoResposta,pNumeroControleRede: String;
    pNumeroControle1,pNumeroAutorizadoRede,pMensagemErro,pValorTaxaEmbarque,pMotivoReinicio,pCRLF: String;
    //****************************************************************************************
    procedure RefrescaTabela;
    procedure ExibeFormaPgto (codigo_forma,valor: Real; ordem: Integer);
    procedure ExclueFormaPgto (codigo_forma: Real);
    procedure AlteraValorFormaPgto (codigo_forma,valor: Real);
    procedure AlteraValorTroco (codigo_forma,valor_troco: Real);
    function ExisteErroNoDocumento (documento: String):Boolean;
    function GetOrdemFormaPgto (codigo_forma: Real):Integer;
    function GetValorFormaPgto (codigo_forma: Real):Real;
    function ProximaOrdem (loja,terminal,venda: Real):Integer;
    function LancouValorMaiorSaldo:Boolean;
    function JaLancadoFormaPgto:Boolean;
    function RetornaSaldoVenda:Real;
    function RetornaQtdeSaidas (loja,terminal,venda: Real):Real;
    function RetornaQtdeEntradas (loja,terminal,venda: Real):Real;
    function CalculaValorComissionavel:Real;
    procedure AvancaSequencialDeVenda;
    procedure CarregaLogDTEF;
    procedure CAB_VENDA_ANTIGO;

    //****************************************************************************************
    //Procedimentos relacionados com a gravacao da VENDA
    //****************************************************************************************
    procedure GravaCabecalhoVenda;
    procedure GravaItemVenda (clItVend: TClassAuxiliar);
    procedure GravaFormasDePagamentoVenda;
    procedure GravaExcessoTrocasVenda (total: Real);
    procedure EmiteValeVendaTROCO;
    procedure ApagaRegistros_VENDA_E_ITEM_VENDA_LOCAL;
    procedure GERA_NFCE;
    procedure GERA_CAB_NFCE;
    procedure GERA_ITENS_NFCE;
    procedure GERA_TOTAIS_NFCE;
    procedure GRAVA_DADOS_RETORNO_NFE;
    procedure IMPRIMI_DANFE_NFCE;
    procedure ENVIAR_DANFEEMAIL_CLIENTE;
    procedure TRATA_ERROS_NFCE(DescrErro : String) ;
    Function BuscaNCM(grupo, subgrupo, produto: Real) : string;

    //****************************************************************************************
    //Procedimentos relacionados com a gravacao doS ATENDIMENTOS relativos àquela VENDA
    //****************************************************************************************
    procedure GeraInfoSobreAtendimentosDaVenda (terminalvenda,codigovenda: Real);
    procedure ConcluirAtendimentosDaVenda (terminalvenda,codigovenda: Real);
  end;

var
  frm_FechamentoVenda: Tfrm_FechamentoVenda;
  ncodigo : Real;
  y_somaQtdeCompras : Boolean = True;
  OutPutList: TStringList;


implementation

{$R *.DFM}

uses funcoes1, funcoes2, procura, unDialogo, principal,
  un_frmConsulta1, f8Vend, DM2, caixas, un_FechamentoVenda_Cheque,
  un_FechamentoVenda_Adm, un_FechamentoVenda_Cred, un_VerDadosPgto,
  unMensagem, un_FechamentoVenda_AjudaComandos, venda, DM16,
  un_FechamentoVenda_Cartao, un_LancaVenda, un_FechamentoVenda_Vales,
  un_VendaDeVales, un_AjudaComandos, un_senhaSupervisor, cupomfiscal,
  un_FechamentoVenda_ValeMerc, AbreCupomMFD,cadcli, UIdentificaCliente,
  un_FrmInfoAdicionais, un_TrataNFENFCE, AuxiliarNFE;

procedure Tfrm_FechamentoVenda.FormShow(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;

     Tipo_Nota := frm_principal.Tipo_Nota;

end;


procedure Tfrm_FechamentoVenda.FormActivate(Sender: TObject);
var
  hR : THandle;
  clAux: TClassAuxiliar;
begin
  if (not JaChamou) or (sender = frm_LancaVenda) then
  begin
    {*** N. do documento configurado como inicial!!!!}

    if (frm_principal.x_ecf_habilita_modo_fiscal) and
      (y_total_venda>0.00) and
      (not frm_principal.x_ImpItemECF or
      (frm_lancavenda.Y_ImpVendaItens = 'C'))
    then //somente para valores MAIORES que ZERO
    begin
      y_tipz:='3';
      lblNDoc2.caption := 'C'; {cupom - DENTRO}
      if not frm_principal.x_ImpItemECF then
        edtNDoc.text :=  BuscaProximoCOOCupom //se estiver configurado para tal
      else
        edtNDoc.text :=  frm_lancavenda.FCupom;

      if (trim(edtNDoc.text)<>'') or
        (trim(edtNDoc.text)<>'0') then
      begin
        if (frm_principal.x_ecf_busca_proximo_COO) then
          edtNDoc.readonly:=true
        else
          edtNDoc.readonly:=false;
      end
      else
        edtNDoc.readonly:=false;
    end
    else
    if frm_principal.x_ImpItemECF and
      (frm_lancavenda.Y_ImpVendaItens = 'R') then
    begin
      y_tipz:='2';
      lblNDoc2.caption := 'R'; {romaneio - FORA}
      edtNDoc.text:=floattostr(frm_principal.x_romaneio);
      edtNDoc.readonly:=false;
    end
    else
    begin
      y_tipz:='1';
      lblNDoc2.caption := 'N'; {nota manual - DENTRO}
      edtNDoc.text:=floattostr(frm_principal.x_nota_fiscal);
      edtNDoc.readonly:=false;
    end;

    if (sender = frm_LancaVenda) and JaChamou then
      exit;

          {*** config. de terminal}
    lblStatus.caption := frm_LancaVenda.lblStatus.caption;
    pnData.caption    := frm_LancaVenda.pnData.caption;
    pnDia.caption     := frm_LancaVenda.pnDia.caption;
    pnSit.caption     := frm_LancaVenda.pnSit.caption;
    pnLoja.caption    := frm_LancaVenda.pnLoja.caption;
    pnCaixa.caption   := frm_LancaVenda.pnCaixa.caption;
    pnEcf.caption     := frm_LancaVenda.pnEcf.caption;
    pnECF.Color       := frm_LancaVenda.pnECF.Color;
    pnECF.Font.Color  := frm_LancaVenda.pnECF.Font.Color;
    pnVend.caption    := frm_LancaVenda.pnVend.caption;

    if (frm_principal.x_ecf_habilita_modo_fiscal) then
    begin
      if (frm_principal.x_ecf=0) then
        pnEcf.color := clRed
      else
        pnEcf.color := clTeal;
    end
    else
      pnEcf.color   := clTeal;

          {*** cara de XP}
    hR := CreateRoundRectRgn(0,0,width,height,10,10);
    SetWindowRgn(Handle,hR,true);

          {*** Verificando se houve desconto}
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VE_DESC FROM VENDAS_LOCAL     ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja) AND            ');
    clAux.AddParam ('      (VE_CAIX=:caixa) AND           ');
    clAux.AddParam ('      (VE_CODI=:codigo_venda)        ');
    clAux.consulta.parambyname('loja').AsFloat         := y_loja;
    clAux.consulta.parambyname('caixa').AsFloat        := y_caixa;
    clAux.consulta.parambyname('codigo_venda').AsFloat := y_venda;
    if (clAux.Execute) then
      if (clAux.result('VE_DESC')<>0.00) then
        if (clAux.result('VE_DESC')<0) then
        begin
          pnFinanc2.visible       := true;
          pnFinanc21.visible      := false;
          pnFinanc2.height        := 73;
          edtDesc.color           := clBlack;
          edtDesc.font.color      := clWhite;
          edtDesc.readonly        := true;
          edtTotalDesc.color      := clWhite;
          edtTotalDesc.font.color := clBlack;
          edtTotalDesc.readonly   := false;
          edtDesc.text            := '0,00';
          edtDescExit(Sender);
          edtTotalDesc.text       := trim(form_nc((-1)*clAux.result('VE_DESC'),15)); {*}
          y_ValorDesconto         := StrToFloat(trim(edtTotalDesc.text));
          if sender <> frm_lancavenda then
            edtTotalDesc.setfocus;
        end
        else //b. se for desconto percentual, mais COMUM
        if (clAux.result('VE_DESC')>0) then
        begin
          pnFinanc2.visible       := true;
          pnFinanc21.visible      := true;
          pnFinanc2.height        := 113;
          edtDesc.color           := clWhite;
          edtDesc.font.color      := clBlack;
          edtDesc.readonly        := false;
          edtTotalDesc.color      := clBlack;
          edtTotalDesc.font.color := clWhite;
          edtTotalDesc.readonly   := true;
          edtTotalDesc.text       := '0,00';
          edtTotalDescExit(Sender);
          edtDesc.text            := trim(form_nc(clAux.result('VE_DESC'),15)); {*}
          y_ValorDesconto         := StrToFloat(trim(edtTotalDesc.text));
          if sender <> frm_lancavenda then
            edtDesc.setfocus;
        end//a. se for desconto em valor
//SE TIVER DESCONTO
    ;
    clAux.desconect;
    clAux.Free;

          //o desconto do ATENDIMENTO nao podera ser alterado
    if (frm_LancaVenda.MODO='ATENDIMENTO') then
    begin
      edtDesc.readonly := true;
      edtTotalDesc.readonly := true;
    end
    else
    if (frm_LancaVenda.MODO='VENDEDOR') then
    begin
      edtDesc.readonly := false;
      edtTotalDesc.readonly := false;
    end;

          {...}
    jaChamou:=true;
  end;
  if (Trim(pnVendaReal.caption)='') then
    pnVendaReal.caption:=form_nc(y_total_venda,10);
  if (Trim(pnTotalVenda.caption)='') then
    pnTotalVenda.caption:=form_nc(y_novo_total_venda,10);
  if (y_saldo_venda=0.00) then
  begin
    y_saldo_venda := RetornaSaldoVenda;
    pnSaldoAPagar.caption:=form_nc(y_saldo_venda,10);
  end;
  RefrescaTabela;
  if sender <> frm_lancavenda then
    if (y_saldo_venda=0.00) then
      edtNDoc.setfocus
    else
    if (pnFinanc2.visible) then
    begin

      if (pnFinanc21.visible) then
        edtDesc.setfocus
      else
        edtTotalDesc.setfocus;
    end
    else
      edtCodForma.setfocus;
end;

procedure Tfrm_FechamentoVenda.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda.edtDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda.edtDescExit(Sender: TObject);
var
  desc: Real;
  crit: Boolean;
begin
  edtTotalDesc.text := '0,00';
  if (Trim(edtDesc.text)<>'') then
  begin
    desc                := strtofloat(RetiraFormatacaoNumero(sem_brancos(edtDesc.text)));
    y_novo_total_venda  := y_total_venda - (y_total_venda*(desc/100));
    edtDesc.text        := form_nc(desc,18);
    edtTotalDesc.text   := form_nc((y_total_venda*(desc/100)),17);
    y_saldo_venda       := RetornaSaldoVenda;
    pnTotalVenda.caption     := form_nc(y_novo_total_venda,18);
    pnSaldoAPagar.caption    := form_nc(y_saldo_venda,18);
    FormatarZerosDecimais (TMaskEdit(sender));
    if (frm_principal.x_usarfaixa) then
    begin
      crit := false;
      if (StrToFloatN(pnTotalVenda.Caption)>=frm_principal.x_faixaini1) and (StrToFloatN(pnTotalVenda.Caption)<=frm_principal.x_faixafim1) then
      begin
        if (frm_principal.x_tipofaixa='P') then
        begin
          if (StrToFloatN(edtDesc.Text)>frm_principal.x_desc1) then
            crit := true
          else
          if (StrToFloatN(edtDesc.Text)<=frm_principal.x_desc1) then
            crit := false;
        end
        else
        if (frm_principal.x_tipofaixa='V') then
          if (StrToFloatN(edtTotalDesc.Text)> frm_principal.x_desc1) then
            crit := true
          else
          if (StrToFloatN(edtTotalDesc.Text)<= frm_principal.x_desc1) then
            crit := false;
      end
      else
      if (StrToFloatN(pnTotalVenda.Caption)>=frm_principal.x_faixaini2) and (StrToFloatN(pnTotalVenda.Caption)<=frm_principal.x_faixafim2) then
      begin
        if (frm_principal.x_tipofaixa='P') then
        begin
          if (StrToFloatN(edtDesc.Text)>frm_principal.x_desc2) then
            crit := true
          else
          if (StrToFloatN(edtDesc.Text)<=frm_principal.x_desc2) then
            crit := false;
        end
        else
        if (frm_principal.x_tipofaixa='V') then
          if (StrToFloatN(edtTotalDesc.Text)> frm_principal.x_desc2) then
            crit := true
          else
          if (StrToFloatN(edtTotalDesc.Text)<= frm_principal.x_desc2) then
            crit := false;
      end
      else
      if (StrToFloatN(pnTotalVenda.Caption)>=frm_principal.x_faixaini3) and (StrToFloatN(pnTotalVenda.Caption)<=frm_principal.x_faixafim3) then
      begin
        if (frm_principal.x_tipofaixa='P') then
        begin
          if (StrToFloatN(edtDesc.Text)>frm_principal.x_desc3) then
            crit := true
          else
          if (StrToFloatN(edtDesc.Text)<=frm_principal.x_desc3) then
            crit := false;
        end
        else
        if (frm_principal.x_tipofaixa='V') then
          if (StrToFloatN(edtTotalDesc.Text)> frm_principal.x_desc3) then
            crit := true
          else
          if (StrToFloatN(edtTotalDesc.Text)<= frm_principal.x_desc3) then
            crit := false;
      end
      else
      if (StrToFloatN(pnTotalVenda.Caption)>frm_principal.x_faixafim3) then
        crit := true;
      if (crit) then
      begin
        frmDialogo.ExibirMensagem ('Desconto não autorizado pela empresa!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        y_novo_total_venda  := y_total_venda;
        edtDesc.text        := '';
        edtTotalDesc.text   := '';
        y_saldo_venda       := RetornaSaldoVenda;
        pnTotalVenda.caption     := form_nc(y_novo_total_venda,18);
        pnSaldoAPagar.caption    := form_nc(y_saldo_venda,18);
        FormatarZerosDecimais (TMaskEdit(sender));
        edtDesc.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_FechamentoVenda.edtTotalDescEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda.edtTotalDescExit(Sender: TObject);
var
  total_desc: Real;
begin
  edtDesc.text := '0,00';
  if (Trim(edtTotalDesc.text)<>'') then
  begin
    total_desc          := strtofloat(RetiraFormatacaoNumero(sem_brancos(edtTotalDesc.text)));
    y_novo_total_venda  := y_total_venda - total_desc;
    edtDesc.text        := form_nc(((total_desc/y_total_venda)*100),17);
    edtTotalDesc.text   := form_nc(total_desc,18);
    y_saldo_venda       := RetornaSaldoVenda;
  end;
  pnTotalVenda.caption     := form_nc(y_novo_total_venda,18);
  pnSaldoAPagar.caption    := form_nc(y_saldo_venda,18);
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda.edtTotalDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtTotalDescExit(Sender);
    if (y_saldo_venda>0.00) then
      edtCodForma.setfocus
    else
      edtNDoc.setfocus;
  end;
end;

procedure Tfrm_FechamentoVenda.edtTotalDescKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda.edtDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (y_saldo_venda>0.00) then
      edtCodForma.setfocus
    else
      edtNdoc.setfocus;
end;

procedure Tfrm_FechamentoVenda.edtDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda.RefrescaTabela;
begin
  with (qFormas) do
  begin
    close;
    parambyname('caixa').AsFloat        := y_caixa;
    parambyname('loja').AsFloat         := y_loja;
    parambyname('codigo_venda').AsFloat := y_venda;
    open;
  end;
end;

procedure Tfrm_FechamentoVenda.CarregaLogDTEF;
begin
  with (qFormas) do
  begin
    close;
    parambyname('caixa').AsFloat        := y_caixa;
    parambyname('loja').AsFloat         := y_loja;
    parambyname('codigo_venda').AsFloat := y_venda;
    open;
  end;
end;


procedure Tfrm_FechamentoVenda.edtCodFormaDblClick(Sender: TObject);
begin
  if (y_saldo_venda>0.00) then
    ChamandoF8FormaPgto (edtCodForma,false)
  else
  if (y_saldo_venda<0.00) then
    ChamandoF8FormaPgto_2 (edtCodForma,false);
end;

procedure Tfrm_FechamentoVenda.edtCodFormaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda.edtCodFormaExit(Sender: TObject);
var
  codigo: String;
begin
  codigo := Trim(edtCodForma.text);
  ncodigo := StrToFloatN(edtCodForma.Text);
  if (codigo<>'')then
  begin
    if (y_saldo_venda>0.00) then//venda com valor POSITIVO
    begin
      if (strtofloat(codigo)<=6) or (strtofloat(codigo)=8) then
      begin
        edtCodForma.text := form_nz(strtofloat(codigo),2);
        pnForma.caption  := ':' + ProcuraNomeFormaPgto(strtofloat(codigo),self);
      end
      else
      begin
        edtCodForma.text := '';
        pnForma.caption  := ':';
        edtCodForma.setfocus;
      end;
    end
    else
    if (y_saldo_venda<0.00) then //venda com valor NEGATIVO
      if (strtofloat(codigo)=1) or (strtofloat(codigo)=7) then
      begin
        edtCodForma.text := form_nz(strtofloat(codigo),2);
        pnForma.caption  := ':' + ProcuraNomeFormaPgto(strtofloat(codigo),self);
      end
      else
      begin
        edtCodForma.text := '';
        pnForma.caption  := ':';
        edtCodForma.setfocus;
      end;
  end
  else
    pnForma.caption:=':';
end;

procedure Tfrm_FechamentoVenda.edtCodFormaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    grade.setfocus;
  if (key=K_F8) then
    if (y_saldo_venda>0.00) then
      ChamandoF8FormaPgto (edtCodForma,false)
    else
    if (y_saldo_venda<0.00) then
      ChamandoF8FormaPgto_2 (edtCodForma,false);
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(edtCodForma.text)<>'') then
    begin
      edtValor.visible:=true;
      lblValor.visible:=true;
      lblValor2.visible:=true;
      lblValor3.visible:=true;
      lblValor4.visible:=true;
      edtValor.setfocus;
    end
    else
      edtNDoc.setfocus;
  if (key=K_CIMA) then
    if (pnFinanc2.visible) then
      if (edtDesc.color=clWhite) then
        edtDesc.setfocus
      else
        edtTotalDesc.setfocus;
end;

procedure Tfrm_FechamentoVenda.edtValorChange(Sender: TObject);
var
  codigo_forma: String;
begin
  if (y_saldo_venda>0.00) then
  begin
    codigo_forma:=Trim(edtCodForma.text);
    if (codigo_forma<>'') then
      if (strtofloat(codigo_forma)=2) then {* crediario}
               {edtTotalContrato.text:=edtValor.text;};
  end;
end;

procedure Tfrm_FechamentoVenda.edtValorEnter(Sender: TObject);
begin
  if (trim(edtValor.text)='') or (trim(edtValor.text)='0') or (trim(edtValor.text)='0.00') or (trim(edtValor.text)='0,00') then
    edtValor.text := trim(form_nc(y_saldo_venda,10))
  else
  if (trim(edtTotalDesc.text)<>'') and (trim(edtTotalDesc.text)<>'0') and (trim(edtTotalDesc.text)<>'0.00') and (trim(edtTotalDesc.text)<>'0,00') then
    edtValor.text := trim(form_nc(y_saldo_venda,10));  
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda.edtValorExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_FechamentoVenda.edtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    Inserirforma1.click;
  if (key=K_CIMA) then
    edtCodForma.setfocus;
end;

procedure Tfrm_FechamentoVenda.edtValorKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

function Tfrm_FechamentoVenda.RetornaSaldoVenda:Real;
var
  dif: Real;
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(VF_VALO) as TOTAL_PAGO    ');
  clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL  ');
  clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND         ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND         ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)             ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat   := y_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat   := y_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat   := y_venda;
  clAux.Execute;
  dif    := y_novo_total_venda - clAux.result('TOTAL_PAGO');
  dif    := strtofloat(trim(RetiraFormatacaoNumero(form_nc(dif,20))));
  result := dif;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_FechamentoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  continua: Boolean;
begin
  if (shift=[ssShift, ssAlt]) then
  begin
    if (key=K_INSERT) then
    begin

      if frm_principal.x_ecf_habilita_modo_fiscal and
        frm_principal.x_ImpItemECF then
        if (frm_lancavenda.Y_ImpVendaItens = 'C') then
          exit
        else
        if Y_Tipz = '2' then
          Y_Tipz := '3';

      if (y_tipz='1') then
      begin
        y_tipz:='2';
        lblNDoc2.caption := 'R'; {romaneio - FORA}
        edtNDoc.text:=floattostr(frm_principal.x_romaneio);
        edtNDoc.readonly:=false;
        edtNDoc.selectall;
      end
      else
      if (y_tipz='2') then
      begin
        if (frm_principal.x_ecf_habilita_modo_fiscal) and
          (y_total_venda>0.00) then //ou seja, impressora fiscal somente para valores MAIORES que ZERO!!!!
        begin
          y_tipz:='3';
          lblNDoc2.caption := 'C'; {cupom - DENTRO}
          edtNDoc.text := BuscaProximoCOOCupom; //se estiver configurado para tal
          if (trim(edtNDoc.text)<>'') or
            (trim(edtNDoc.text)<>'0') then
          begin
            if (frm_principal.x_ecf_busca_proximo_COO) then
              edtNDoc.readonly:=true
            else
              edtNDoc.readonly:=false;
          end
          else
            edtNDoc.readonly:=false;
          edtNDoc.selectall;
        end
        else
        begin
          y_tipz:='1';
          lblNDoc2.caption := 'N'; {nota manual - DENTRO}
          edtNDoc.text:=floattostr(frm_principal.x_nota_fiscal);
          edtNDoc.readonly:=false;
          edtNDoc.selectall;
        end;
      end
      else
      begin
        y_tipz:='1';
        lblNDoc2.caption := 'N'; {nota manual - DENTRO}
        edtNDoc.text:=floattostr(frm_principal.x_nota_fiscal);
        edtNDoc.readonly:=false;
        edtNDoc.selectall;
      end;
    end;
  end
  else
  if (shift=[ssCtrl]) then
  begin
    if (Key=Ord('C')) or (Key=Ord('c')) then
    begin
      //if (lblNDoc2.Caption = 'C') then
      //begin
//        Application.CreateForm(Tfrm_AbreCupomMFD, frm_AbreCupomMFD);
//        frm_AbreCupomMFD.showmodal;
        Application.CreateForm(Tfrm_IdentificaCliente, frm_IdentificaCliente);
        frm_IdentificaCliente.showmodal;
      //end;
    end;

    if (qFormas.recordcount=0) then
      if (key=Ord('D')) or (key=Ord('d')) then
      begin
                   //CRITICA À PERMISSAO DE DESCONTO
        if (frm_LancaVenda.MODO='ATENDIMENTO') then
        begin
          frmDialogo.ExibirMensagem ('Opção de desconto não permitida!'
            ,'Venda',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          frmDialogo.ExibirMensagem ('O desconto deverá vir do ATENDIMENTO!'
            ,'Venda',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          continua := false;
        end
        else
          continua := true;

                   {...}
        if (continua) then
        begin
                       {********************************************************************************}
          if (frm_principal.x_solicitar_senha_DESCONTO) then
          begin
            if (not frm_senhaSupervisor.y_flag) then
              frm_senhaSupervisor.showmodal;
          end
          else
            frm_senhaSupervisor.y_flag:=true;

                       {...}
          if (frm_senhaSupervisor.y_flag) then
            if (not pnFinanc2.visible) then
            begin
              pnFinanc2.visible       := true;
              pnFinanc21.visible      := true;
              pnFinanc2.height        := 113;
              edtDesc.color           := clWhite;
              edtDesc.font.color      := clBlack;
              edtDesc.readonly        := false;
              edtTotalDesc.color      := clBlack;
              edtTotalDesc.font.color := clWhite;
              edtTotalDesc.readonly   := true;
              edtTotalDesc.text       := '0,00';
              edtTotalDescExit(Sender);
              edtDesc.setfocus;
            end
            else
            if (edtDesc.color=clWhite) then
            begin
              pnFinanc21.visible      := false;
              pnFinanc2.height        := 73;
              edtDesc.color           := clBlack;
              edtDesc.font.color      := clWhite;
              edtDesc.readonly        := true;
              edtTotalDesc.color      := clWhite;
              edtTotalDesc.font.color := clBlack;
              edtTotalDesc.readonly   := false;
              edtDesc.text            := '0,00';
              edtDescExit(Sender);
              edtTotalDesc.setfocus;
            end
            else
            begin
              pnFinanc21.visible      := true;
              pnFinanc2.height        := 113;
              edtDesc.color           := clWhite;
              edtDesc.font.color      := clBlack;
              edtDesc.readonly        := false;
              edtTotalDesc.color      := clBlack;
              edtTotalDesc.font.color := clWhite;
              edtTotalDesc.readonly   := true;
              edtTotalDesc.text       := '0,00';
              edtTotalDescExit(Sender);
              pnFinanc2.visible := false;
              frm_senhaSupervisor.y_flag:=false;
              edtCodForma.setfocus;
            end;
        end;
      end{descontos};
  end
  else
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_FechamentoVenda.Limparedits1Click(Sender: TObject);
begin
  edtCodForma.text              := '';
  edtValor.text                 := '';
  pnForma.caption               := ':';
  edtValor.visible              := true;
  lblValor.visible              := true;
  lblValor2.visible             := true;
  lblValor3.visible             := true;
  lblValor4.visible             := true;
  if (y_saldo_venda=0.00) then
    edtNdoc.setfocus
  else
  begin
    edtValor.text := trim(form_nc(y_saldo_venda,10));
    edtCodForma.setfocus;
  end;
end;

procedure Tfrm_FechamentoVenda.Inserirforma1Click(Sender: TObject);
var
  clAux,clAux2,clCheq,clCartao,clValeMerc: TClassAuxiliar;
  valor_troco: Real;
  sequencia_ordem: Integer;
  codigo_forma: Real;
  continua: Boolean;
  valor_ja_informado_gravado: Real;
  pValorTransacao,
  pNumeroCupomVenda,
  pNumeroControle   : Pchar;
  RetDPOS,
  nStatus           : Integer;
  pTipoOperacao,pNumeroParcelas, pValorParcela, pValorTaxaServico,
  pPermiteAlteracao, pReservado : Pchar;
  arq,arqReg: TextFile;
  linha,a: String;
  SL: TStringList;
  ContinuaTEF: Boolean;
begin
     {CRITICA AOS DADOS}
  if (Trim(edtCodForma.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Informe o código da forma de pgto!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodForma.setfocus;
  end
  else
  if (Trim(edtValor.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Informe o valor a ser pago!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  if (strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)))=0.00) then
  begin
    frmDialogo.ExibirMensagem ('Informe o valor a ser pago!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  begin
    {******************************************************************************************}
    codEntrada      := strtofloat(Trim(edtCodForma.Text));
    if (codEntrada = 1) or (codEntrada = 2) or (codEntrada = 3) then
      totalEntrada := totalEntrada + strtofloat(RetiraFormatacaoNumero(Trim(edtValor.Text)))
    else
      totalEntrada := totalEntrada + 0;
    codigo_forma    := strtofloat(Trim(edtCodForma.text));
    valor_informado := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
    sequencia_ordem := ProximaOrdem(y_loja,y_caixa,y_venda);
    continua        := true;
    {*****************************************************************************************}
    if (JaLancadoFormaPgto) then //IRA CRITICAR SOMENTE 'DINHEIRO'
    begin
      ExclueFormaPgto(codigo_forma);
               {******************************************************************************************}
      RefrescaTabela;
      y_saldo_venda         := RetornaSaldoVenda;
      pnSaldoAPagar.caption := form_nc(y_saldo_venda,10);
               {******************************************************************************************}
      Inserirforma1.click;
    end
    else
    if (y_saldo_venda=0.00) then
              {...}
    else
    if (LancouValorMaiorSaldo) and
      (strtofloat(Trim(edtCodForma.text))<>KFPGT_DINHEIRO) and
      (strtofloat(Trim(edtCodForma.text))<>KFPGT_VALES) then
    begin
      frmDialogo.ExibirMensagem ('O valor informado é maior que o saldo a pagar!'
        ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtValor.setfocus;
    end
    else
    begin
      {*****************************************************************************************}
      if (codigo_forma=KFPGT_CHEQUE) then {CHEQUE A VISTA}
      begin
        Application.CreateForm(Tfrm_FechamentoVenda_Cheque, frm_FechamentoVenda_Cheque);
        frm_FechamentoVenda_Cheque.LimparEdits;
        frm_FechamentoVenda_Cheque.showmodal;
        if (frm_FechamentoVenda_Cheque.tecla=27) then
          continua:=false;
      end
      else
      if (codigo_forma=KFPGT_CARTAO) then {CARTAO DE CREDITO}
      begin
        if (frm_principal.x_ecf_habilita_modo_fiscal) and (frm_principal.x_ecf_habilita_TEF) then
        begin
          if (ExisteCodTefCadastrado) then
          begin
            if not CarregaModuloDPOS then
              exit
            else
            begin
              pValorTransacao      := StrAlloc(100);
              pNumeroCupomVenda    := StrAlloc(100);
              pNumeroControle      := StrAlloc(100);
              frm_principal.x_ultimo_numro_controle_cartao_tef := StrAlloc(100);
              pTipoOperacao        := StrAlloc(3);
              pNumeroParcelas      := StrAlloc(3);
              pValorParcela        := StrAlloc(13);
              pValorTaxaServico    := StrAlloc(13);
              pPermiteAlteracao    := StrAlloc(2);
              pReservado           := StrAlloc(160);
              CuponCartao := '';
              StrPLCopy(pValorTransacao,form_nz(strtofloat(EliminarFormatacao(form_nc(valor_informado,12))),12),12);
              StrPLCopy(pNumeroCupomVenda,form_nz(strtofloat(BuscaProximoCOOCupom),6),6);
              StrPLCopy(pNumeroControle,'',6);
              StrPLCopy(frm_principal.x_ultimo_numro_controle_cartao_tef,'',6);
              RetDPOS := TransacaoCartaoCredito(
                pValorTransacao,   pNumeroCupomVenda, pNumeroControle);
              if RetDPOS <> 0 then
                ContinuaTEF := false// TRANSACAO NAO REALIZADA ...

              else
              begin // transacao realizada com sucesso ...
                              {... Gravacao em arquivo dos registros que entraram}
                if (FileExists('C:\DPOS3x25\CUPONS\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3))) then
                begin
                  AssignFile (arqReg, 'C:\DPOS3x25\CUPONS\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3));
                  Reset      (arqReg);
                  linha := '';
                  frm_FechamentoVenda.Memo2.Lines.Clear;
                  while (not Eof(arqReg)) do
                    try
                      ReadLn (arqReg,linha);
                      frm_FechamentoVenda.Memo2.Lines.Add(linha);
                    except
                    end{encapsulamento da rotina, nao permite erros --->};
                  CloseFile  (arqReg);
                  SL:=TStringList.Create;
                  SL.Add(Memo2.Text);
                  SL.SaveToFile('C:\Nativa\CuponDTEF\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3));
                  SL.Free;
                  frm_FechamentoVenda.Memo2.Lines.Clear;
                  CuponCartao := 'C:\Nativa\CuponDTEF\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3);
                  frm_principal.x_ultimo_numro_controle_cartao_tef := pNumeroControle;
                end
                else
                  ShowMessage('Arquivo '+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3)+' não encontrado');
                nStatus        := ConfirmaCartaoCredito(pNumeroControle);

                if nStatus = 11 then
                begin
                  MessageDlg('Transação não pode ser confirmada...', mtInformation, [mbOk], 0);
                  ContinuaTEF := false;
                  edtCodForma.SetFocus;
                end
                else
                  ContinuaTEF := true;
                nStatus :=  FinalizaTransacao; // SE NAO CONFIRMAR, EH REALIZADO O DESFAZIMENTO!
                if nStatus = 11 then
                begin
                  MessageDlg('Transação não pode ser confirmada...', mtInformation, [mbOk], 0);
                  ContinuaTEF := false;
                  edtCodForma.SetFocus;
                end;
              end;
              DescarregaModuloDPOS;
            end;
            if (ContinuaTEF) then
            begin
                              {... Gravacao em arquivo dos registros que entraram}
              if (FileExists('C:\DPOS3x25\INTERNO\DPOS'+form_nz(StrToFloat(Copy(DateToStr(Date),1,2)),2)+form_nz(StrToFloat(Copy(DateToStr(Date),4,2)),2)+Copy(DateToStr(Date),7,4)+'.'+form_nz(frm_principal.x_terminal,3))) then
              begin
                AssignFile (arqReg, 'C:\DPOS3x25\INTERNO\DPOS'+form_nz(StrToFloat(Copy(DateToStr(Date),1,2)),2)+form_nz(StrToFloat(Copy(DateToStr(Date),4,2)),2)+Copy(DateToStr(Date),7,4)+'.'+form_nz(frm_principal.x_terminal,3));
                Reset      (arqReg);
                linha := '';
                frm_FechamentoVenda.Memo2.Lines.Clear;
                while (not Eof(arqReg)) do
                  try
                    ReadLn (arqReg,linha);
                    if (eof(arqReg)) then
                      frm_FechamentoVenda.Memo2.Lines.Add(linha);
                  except
                  end{encapsulamento da rotina, nao permite erros --->};
                pTipoRegistro := Copy(linha,11,3);
                if (pTipoRegistro='INI') or (pTipoRegistro='FIM') then
                begin
                  pNumeroEmpresa     := copy(linha,1,04);
                  pNumeroLoja        := copy(linha,5,06);
                  pData              := copy(linha,14,08);
                  pHora              := copy(linha,22,06);
                  pNumeroEquipamento := copy(linha,28,06);
                  pNumeroFiscalEquipamentos := copy(linha,36,8);
                  pCRLF              := copy(linha,263,2);
                end
                else
                if (pTipoRegistro='REI') then
                begin
                  pNumeroEmpresa     := copy(linha,1,04);
                  pNumeroLoja        := copy(linha,5,06);
                  pData              := copy(linha,14,08);
                  pHora              := copy(linha,26,06);
                  pNumeroEquipamento := copy(linha,30,06);
                  pNumeroFiscalEquipamentos := copy(linha,36,80);
                  pMotivoReinicio    := copy(linha,44,30);
                  pCRLF              := copy(linha,296,02);
                end
                else
                if (pTipoRegistro='CCR') then
                begin
                  pNumeroEmpresa     := copy(linha,1,4);
                  pNumeroLoja        := copy(linha,5,6);
                  pData              := copy(linha,14,08);
                  pHora              := copy(linha,22,6);
                  pcodigoTransacao   := copy(linha,28,2);
                  pNumeroEquipamento := copy(linha,30,3);
                  pNumeroFiscalEquipamentos := copy(linha,33,8);
                  pNumeroCupom       := copy(linha,41,6);
                  pValorTransacao1    := copy(linha,47,12);
                  pTipoColetaCartao  := copy(linha,59,1);
                  pNumeroAutorizador := copy(linha,60,2);
                  pNumeroCartao      := copy(linha,62,37);
                  pVencimentoCartao  := copy(linha,99,4);
                  pTipoOperacao1      := copy(linha,103,2);
                  pNumeroParcelas1   := copy(linha,105,2);
                  pValorParcela1     := copy(linha,117,12);
                  pValorTaxaServico1 := copy(linha,129,12);
                  pcodigoResposta    := copy(linha,150,2);
                  pNumeroControleRede := copy(linha,152,9);
                  pNumeroControle1   := copy(linha,161,6);
                  pNumeroAutorizadoRede := copy(linha,167,6);
                  pMensagemErro      := copy(linha,173,20);
                  pValorTaxaEmbarque := copy(linha,193,12);
                  pCRLF              := copy(linha,256,2);
                end;
                CloseFile  (arqReg);
              end;
              if (pTipoRegistro='CCR') then
              begin
                frm_FechamentoVenda.Memo2.Clear;
                Application.CreateForm(Tfrm_FechamentoVenda_Cartao, frm_FechamentoVenda_Cartao);
                frm_FechamentoVenda_Cartao.y_total_financiado := valor_informado;
                frm_FechamentoVenda_Cartao.y_data_compra      := frm_principal.x_data_trabalho;
                frm_FechamentoVenda_Cartao.LimparEdits;
                frm_FechamentoVenda_Cartao.edtCodAdm.Text := FloatToStr(InformaCodTEF(StrToFloat(pNumeroAutorizador)));
                frm_FechamentoVenda_Cartao.edtCodAdm.OnExit(Self);
                frm_FechamentoVenda_Cartao.edtCartao.Text := pNumeroCartao;
                if (pTipoOperacao1='AV') then
                  frm_FechamentoVenda_Cartao.edtParcela.Text := '01'
                else
                  frm_FechamentoVenda_Cartao.edtParcela.Text := pNumeroParcelas1;

                if (pTipoOperacao1='AV') then
                  frm_FechamentoVenda_Cartao.RGTipoPag.ItemIndex:=0
                else
                if (pTipoOperacao1='FL') then
                  frm_FechamentoVenda_Cartao.RGTipoPag.ItemIndex:=1
                else
                if (pTipoOperacao1='FA') then
                  frm_FechamentoVenda_Cartao.RGTipoPag.ItemIndex:=2;
                if (frm_FechamentoVenda_Cartao.edtParcela.Text<>'') then
                  frm_FechamentoVenda_Cartao.MontarParcelas;

                frm_FechamentoVenda_Cartao.y_sequencia_ordem := sequencia_ordem;
                frm_FechamentoVenda_Cartao.Confirmardados1.Click;
                frm_FechamentoVenda_Cartao.showmodal;
                y_cliente := '';
                if (frm_FechamentoVenda_Cartao.tecla=27) then
                  continua:=false;
              end;
            end;
          end
          else
            MessageDlg('Favor Cadastrar Código ADM TEF...', mtInformation, [mbOk], 0);
        end
        else
        begin
          Application.CreateForm(Tfrm_FechamentoVenda_Cartao, frm_FechamentoVenda_Cartao);
          frm_FechamentoVenda_Cartao.y_total_financiado := valor_informado;
          frm_FechamentoVenda_Cartao.y_data_compra      := frm_principal.x_data_trabalho;
          frm_FechamentoVenda_Cartao.LimparEdits;
          frm_FechamentoVenda_Cartao.y_sequencia_ordem := sequencia_ordem;
          frm_FechamentoVenda_Cartao.showmodal;
          y_cliente := '';
          if (frm_FechamentoVenda_Cartao.tecla=27) then
            continua:=false;
        end;

      end
      else
      if (codigo_forma=KFPGT_VALE_MERC) then {VALE MERCADORIA FUNCIONARIO}
      begin
        Application.CreateForm(Tfrm_FechamentoVenda_ValeMerc, frm_FechamentoVenda_ValeMerc);
        frm_FechamentoVenda_ValeMerc.y_valor := valor_informado; {*}
        frm_FechamentoVenda_ValeMerc.LimparEdits;
        frm_FechamentoVenda_ValeMerc.showmodal;
        if (frm_FechamentoVenda_ValeMerc.tecla=27) then
          continua:=false;
      end
      else
      if (codigo_forma=KFPGT_VALES) or {VALES RECEBIDOS}
        (codigo_forma=KFPGT_VALES_EMI) then {VALES EMITIDOS}
      begin
        Application.CreateForm(Tfrm_FechamentoVenda_Vales, frm_FechamentoVenda_Vales);
        frm_FechamentoVenda_Vales.y_valor           := valor_informado;
        frm_FechamentoVenda_Vales.y_forma_pagamento := codigo_forma; {* definira se é emitido / recebido}
        frm_FechamentoVenda_Vales.LimparEdits;
        frm_FechamentoVenda_Vales.showmodal;
        if (frm_FechamentoVenda_Vales.tecla=27) then
          continua:=false;
      end
      else
      if (codigo_forma=KFPGT_DEBITO) {and (not frm_principal.x_ecf_habilita_TEF)}  then {DEBITO AUTOMATICO}
      begin
        if (frm_principal.x_ecf_habilita_modo_fiscal) and (frm_principal.x_ecf_habilita_TEF) then
        begin
          if not CarregaModuloDPOS then
            exit;
          pValorTransacao      := StrAlloc(100);
          pNumeroCupomVenda    := StrAlloc(100);
          pNumeroControle      := StrAlloc(100);
          pTipoOperacao        := StrAlloc(3);
          pNumeroParcelas      := StrAlloc(3);
          pValorParcela        := StrAlloc(13);
          pValorTaxaServico    := StrAlloc(13);
          pPermiteAlteracao    := StrAlloc(2);
          pReservado           := StrAlloc(160);
          CuponDebito := '';
          StrPLCopy(pValorTransacao,form_nz(strtofloat(EliminarFormatacao(form_nc(valor_informado,12))),12),12);
          StrPLCopy(pNumeroCupomVenda,form_nz(strtofloat(BuscaProximoCOOCupom),6),6);
          StrPLCopy(pNumeroControle,'',6);
                          // Dados Adicionais ...
          StrPLCopy(pTipoOperacao, 'FA', 2);
          StrPLCopy(pNumeroParcelas, '02', 2);
          StrPLCopy(pValorParcela, '000000000000', 12);
          StrPLCopy(pValorTaxaServico, '000000000000', 12);
          StrPLCopy(pPermiteAlteracao, 'S', 1);
          StrPLCopy(pReservado, '', 158);
          pValorTransacao[12]  := #0;
          pNumeroCupomVenda[6] := #0;
          pNumeroControle[6]   := #0;
          RetDPOS := TransacaoCartaoDebito(
            pValorTransacao,   pNumeroCupomVenda, pNumeroControle);
//                                     pTipoOperacao,     pNumeroParcelas,   pValorParcela,
//                                     pValorTaxaServico, pPermiteAlteracao, pReservado);
          if RetDPOS <> 0 then
          begin
            ContinuaTEF := false;
            edtCodForma.SetFocus;
          end
          else
          begin // transacao realizada com sucesso ...
                              {... Gravacao em arquivo dos registros que entraram}
            if (FileExists('C:\DPOS3x25\CUPONS\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3))) then
            begin
              AssignFile (arqReg, 'C:\DPOS3x25\CUPONS\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3));
              Reset      (arqReg);
              linha := '';
              frm_FechamentoVenda.Memo2.Lines.Clear;
              while (not Eof(arqReg)) do
                try
                  ReadLn (arqReg,linha);
                  frm_FechamentoVenda.Memo2.Lines.Add(linha);
                except
                end{encapsulamento da rotina, nao permite erros --->};
              CloseFile  (arqReg);
              SL:=TStringList.Create;
              SL.Add(Memo2.Text);
              SL.SaveToFile('C:\Nativa\CuponDTEF\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3));
              SL.Free;
              frm_FechamentoVenda.Memo2.Lines.Clear;
              CuponDebito := 'C:\Nativa\CuponDTEF\'+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3)
            end
            else
              ShowMessage('Arquivo '+pNumeroControle+'.'+form_nz(frm_principal.x_terminal,3)+' não encontrado');
            nStatus := ConfirmaCartaoDebito(pNumeroControle);

            if nStatus = 11 then
            begin
              MessageDlg('Transação não pode ser confirmada...', mtInformation, [mbOk], 0);
              ContinuaTEF := false;
              edtCodForma.SetFocus;
            end
            else
              ContinuaTEF := true;
            FinalizaTransacao; // SE NAO CONFIRMAR, EH REALIZADO O DESFAZIMENTO!
          end;
          DescarregaModuloDPOS;
          if (ContinuaTEF) then
          begin
            Application.CreateForm(Tfrm_FechamentoVenda_Adm, frm_FechamentoVenda_Adm);
            frm_FechamentoVenda_Adm.label2.caption  := '[Dados relativos ao débito automático]';
            frm_FechamentoVenda_Adm.label12.caption := '[Dados relativos ao débito automático]';
            frm_FechamentoVenda_Adm.LimparEdits;
            frm_FechamentoVenda_Adm.y_data_compra      := frm_principal.x_data_trabalho;
            frm_FechamentoVenda_Adm.y_total_financiado := valor_informado;
            frm_FechamentoVenda_Adm.y_sequencia_ordem  := sequencia_ordem;
            frm_FechamentoVenda_Adm.showmodal;
            y_cliente := '';
            if (frm_FechamentoVenda_Adm.tecla=27) then
              continua:=false;
          end;
        end
        else
        begin
          Application.CreateForm(Tfrm_FechamentoVenda_Adm, frm_FechamentoVenda_Adm);
          frm_FechamentoVenda_Adm.label2.caption  := '[Dados relativos ao débito automático]';
          frm_FechamentoVenda_Adm.label12.caption := '[Dados relativos ao débito automático]';
          frm_FechamentoVenda_Adm.LimparEdits;
          frm_FechamentoVenda_Adm.y_data_compra      := frm_principal.x_data_trabalho;
          frm_FechamentoVenda_Adm.y_total_financiado := valor_informado;
          frm_FechamentoVenda_Adm.y_sequencia_ordem  := sequencia_ordem;
          frm_FechamentoVenda_Adm.showmodal;
          y_cliente := '';
          if (frm_FechamentoVenda_Adm.tecla=27) then
            continua:=false;
        end;
      end
      else
      if (codigo_forma=KFPGT_CREDITO) then {CREDIARIO}
      begin
        Application.CreateForm(Tfrm_FechamentoVenda_Cred, frm_FechamentoVenda_Cred);
        frm_FechamentoVenda_Cred.label2.caption  := '[Dados relativos à concessão de Crédito]';
        frm_FechamentoVenda_Cred.label12.caption := '[Dados relativos à concessão de Crédito]';
        frm_FechamentoVenda_Cred.edtValorFinanciado.text   := edtValor.text;
        frm_FechamentoVenda_Cred.edtTotalContrato.Text := floattostr(strtofloat(RetiraFormatacaoNumero(edtValor.Text)) + totalEntrada);
        FormatarZerosDecimais(frm_FechamentoVenda_Cred.edtTotalContrato);
        if (Trim(edtValor.text)='') or (Trim(edtValor.text)='0,00')then
        begin
          frmDialogo.ExibirMensagem ('Valor não pode ficar vazio!'
            ,'Venda',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtValor.setfocus;
        end
        else
        if (databasecredito<>'CREDITO') then
        begin
          frm_FechamentoVenda_Cred.LimparEdits;
          frm_FechamentoVenda_Cred.edtValorFinanciado.text     := trim(form_nc(y_saldo_venda,10));
          frm_FechamentoVenda_Cred.edtTotalContrato.readonly   := true;
          frm_FechamentoVenda_Cred.edtValorFinanciado.readonly := true;
          frm_FechamentoVenda_Cred.edtValorEntrada.readonly    := true;
          frm_FechamentoVenda_Cred.showmodal;
          if (frm_FechamentoVenda_Cred.tecla=27) then
            continua:=false;
        end
        else
        begin
          {// somente se o CREDIARIO estiver acessível!!!!}
          frmDialogo.posativ:=1;
          if (frmDialogo.ExibirMensagem ('Deseja lançar o contrato agora?'
            ,'Venda',[mbYes,mbNo]
            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          begin
            frm_FechamentoVenda_Cred.edtCliente.readonly         := true;
            frm_FechamentoVenda_Cred.edtContrato.readonly        := true;
            frm_FechamentoVenda_Cred.edtTotalContrato.readonly   := true;
            frm_FechamentoVenda_Cred.edtValorEntrada.readonly    := true;
            frm_FechamentoVenda_Cred.edtValorFinanciado.readonly := true;
            frm_principal.fechamentoVenda                        := true;
            FormatarZerosDecimais (edtValor);
            frm_principal.ChamandoPosFinancCons;
            if (frm_consulta1.y_codigo_cliente<>-1) and
              (frm_consulta1.y_codigo_contrato<>-1) then
            begin
              frm_FechamentoVenda_Cred.edtCliente.tag   := 1;
              frm_FechamentoVenda_Cred.edtCliente.text  := form_nz(frm_consulta1.y_codigo_cliente,6);
              frm_FechamentoVenda_Cred.edtContrato.text := form_nz(frm_consulta1.y_codigo_contrato,6);
              frm_FechamentoVenda_Cred.y_cliente        := frm_consulta1.y_codigo_cliente; {*}
              frm_FechamentoVenda_Cred.y_contrato       := frm_consulta1.y_codigo_contrato; {*}


              frm_FechamentoVenda_Cred.edtTotalContrato.color        := frm_FechamentoVenda_Cred.edtCliente.color;
              frm_FechamentoVenda_Cred.edtTotalContrato.font.color   := frm_FechamentoVenda_Cred.edtCliente.font.color;

              frm_FechamentoVenda_Cred.edtValorEntrada.color         := frm_FechamentoVenda_Cred.label20.color;
              frm_FechamentoVenda_Cred.edtValorEntrada.font.color    := frm_FechamentoVenda_Cred.label20.font.color;

              frm_FechamentoVenda_Cred.edtTotalContrato.color        := frm_FechamentoVenda_Cred.edtCliente.color;
              frm_FechamentoVenda_Cred.edtTotalContrato.font.color   := frm_FechamentoVenda_Cred.edtCliente.font.color;

              frm_FechamentoVenda_Cred.edtNome_crediario.color       := frm_FechamentoVenda_Cred.edtCliente.color;
              frm_FechamentoVenda_Cred.edtNome_crediario.font.color  := frm_FechamentoVenda_Cred.edtCliente.font.color;


              //frm_FechamentoVenda_Cred.LimparEdits;
              frm_FechamentoVenda_Cred.showmodal;
              if (frm_FechamentoVenda_Cred.edtValorFinanciado.text<>'') then
                edtValor.text := frm_FechamentoVenda_Cred.edtValorFinanciado.text;
              if (frm_FechamentoVenda_Cred.tecla=27) then
                continua:=false;
            end
            else
              continua:=false;
          end
          else
          begin
            frm_FechamentoVenda_Cred.LimparEdits;
            //frm_FechamentoVenda_Cred.edtValorFinanciado.text     := trim(form_nc(y_saldo_venda,10));
            frm_FechamentoVenda_Cred.edtValorFinanciado.Text     := Trim(form_nc(strtofloat(RetiraFormatacaoNumero(Trim(edtValor.Text))),12));
            frm_FechamentoVenda_Cred.edtTotalContrato.readonly   := true;
            frm_FechamentoVenda_Cred.edtValorFinanciado.readonly := true;
            frm_FechamentoVenda_Cred.edtValorEntrada.readonly    := true;
            frm_FechamentoVenda_Cred.edtValorEntrada.Text        := floattostr(totalEntrada);
            FormatarZerosDecimais(frm_FechamentoVenda_Cred.edtValorEntrada);
            frm_FechamentoVenda_Cred.showmodal;
            if (frm_FechamentoVenda_Cred.edtValorFinanciado.text<>'') then
              edtValor.text := frm_FechamentoVenda_Cred.edtValorFinanciado.text;
            if (frm_FechamentoVenda_Cred.tecla=27) then
              continua:=false;
          end;
        end;
      end;
      {******************************************************************************************}

                  {...}
      if (continua) then
      begin
        {***********************************************************************************}
        if (strtofloat(Trim(edtCodForma.text))=KFPGT_DINHEIRO) or
          (strtofloat(Trim(edtCodForma.text))=KFPGT_VALES) then
        begin
          if (valor_informado>y_saldo_venda) then
          begin
            pnTroco.caption := trim(form_nc(valor_informado - y_saldo_venda,10));
            valor_troco := valor_informado - y_saldo_venda;
          end
          else
          begin
            pnTroco.caption := '0,00';
            valor_troco := 0.00;
          end;
        end
        else
        begin
          pnTroco.caption := '0,00';
          valor_troco := 0.00;
        end;
        {******************************************************************************************}
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('INSERT INTO VENDAS_FORMA_PAGAMENTO_LOCAL       ');
        clAux.AddParam (' (VF_CAIX,VF_LOJA,VF_VEND,VF_FPGT,             ');
        clAux.AddParam ('  VF_ORDE,VF_VALO,VF_TROC)                     ');
        clAux.AddParam ('VALUES                                         ');
        clAux.AddParam (' (:VF_CAIX,:VF_LOJA,:VF_VEND,:VF_FPGT,         ');
        clAux.AddParam ('  :VF_ORDE,:VF_VALO,:VF_TROC)                  ');
        clAux.consulta.parambyname('VF_LOJA').AsFloat   := y_loja;
        clAux.consulta.parambyname('VF_CAIX').AsFloat   := y_caixa;
        clAux.consulta.parambyname('VF_VEND').AsFloat   := y_venda;
        clAux.consulta.parambyname('VF_FPGT').AsFloat   := codigo_forma;
        clAux.consulta.parambyname('VF_ORDE').AsInteger := sequencia_ordem;
        if (valor_informado>y_saldo_venda) then
          clAux.consulta.parambyname('VF_VALO').AsFloat := y_saldo_venda
        else
          clAux.consulta.parambyname('VF_VALO').AsFloat := valor_informado;
        clAux.consulta.parambyname('VF_TROC').AsFloat := valor_troco;
        clAux.Execute;
        clAux.desconect;
        clAux.Free;
        {******************************************************************************************}
        if (codigo_forma=KFPGT_CHEQUE) then {salvando dados CHEQUE A VISTA}
        begin
          clCheq := TClassAuxiliar.Create;
          clCheq.conect   ('VENDAS',self);
          clCheq.ClearSql;
          clCheq.AddParam ('INSERT INTO CHEQUES_LOCAL                        ');
          clCheq.AddParam (' (CH_CAIX,CH_LOJA,CH_VEND,CH_BANC,               ');
          clCheq.AddParam ('  CH_NBAN,CH_AGEN,CH_CONT,CH_NUME,CH_ORDE,       ');
          clCheq.AddParam ('  CH_FLAG,CH_NOME,CH_CPF,CH_FONE,                ');
          clCheq.AddParam ('  CH_VENC,CH_DTPG,CH_ALIN,CH_STAT,               ');
          clCheq.AddParam ('  CH_VALO,CH_VAPG)                               ');
          clCheq.AddParam ('VALUES                                           ');
          clCheq.AddParam (' (:CH_CAIX,:CH_LOJA,:CH_VEND,:CH_BANC,           ');
          clCheq.AddParam ('  :CH_NBAN,:CH_AGEN,:CH_CONT,:CH_NUME,:CH_ORDE,  ');
          clCheq.AddParam ('  :CH_FLAG,:CH_NOME,:CH_CPF,:CH_FONE,            ');
          clCheq.AddParam ('  :CH_VENC,:CH_DTPG,:CH_ALIN,:CH_STAT,           ');
          clCheq.AddParam ('  :CH_VALO,:CH_VAPG)                             ');
          clCheq.consulta.parambyname('CH_LOJA').AsFloat   := y_loja;
          clCheq.consulta.parambyname('CH_CAIX').AsFloat   := y_caixa;
          clCheq.consulta.parambyname('CH_VEND').AsFloat   := y_venda;
          if (Trim(frm_FechamentoVenda_Cheque.edtCodBanco.text)<>'') then
            clCheq.consulta.parambyname('CH_BANC').AsInteger  := strtoint(Trim(frm_FechamentoVenda_Cheque.edtCodBanco.text))
          else
            clCheq.consulta.parambyname('CH_BANC').AsInteger  := 0;
          clCheq.consulta.parambyname('CH_NBAN').AsString  := Trim(frm_FechamentoVenda_Cheque.edtNomeBanco.text);
          clCheq.consulta.parambyname('CH_AGEN').AsString  := Trim(frm_FechamentoVenda_Cheque.edtAgencia.text);
          clCheq.consulta.parambyname('CH_CONT').AsString  := Trim(frm_FechamentoVenda_Cheque.edtConta.text);
          if (Trim(frm_FechamentoVenda_Cheque.edtNumero.text)<>'') then
            clCheq.consulta.parambyname('CH_NUME').AsFloat := strtofloat(Trim(frm_FechamentoVenda_Cheque.edtNumero.text))
          else
            clCheq.consulta.parambyname('CH_NUME').AsFloat := 0;
          clCheq.consulta.parambyname('CH_ORDE').AsInteger := sequencia_ordem; {****}
          if (frm_FechamentoVenda_Cheque.chFlag.checked) then
            clCheq.consulta.parambyname('CH_FLAG').AsString  := '1'
          else
            clCheq.consulta.parambyname('CH_FLAG').AsString  := '0';
          clCheq.consulta.parambyname('CH_NOME').AsString := Trim(frm_FechamentoVenda_Cheque.edtNome.text);
          clCheq.consulta.parambyname('CH_FONE').AsString := Trim(frm_FechamentoVenda_Cheque.edtFone.text);
          clCheq.consulta.parambyname('CH_CPF').AsString  := Trim(frm_FechamentoVenda_Cheque.edtCpf.text);
          clCheq.consulta.parambyname('CH_VENC').AsDateTime := frm_principal.x_data_trabalho; //vencimento é no dia
          clCheq.consulta.parambyname('CH_DTPG').AsDateTime := strtodate('01/01/1900');
          clCheq.consulta.parambyname('CH_ALIN').AsString   := '';
          clCheq.consulta.parambyname('CH_STAT').AsString   := '0'; //em aberto
          clCheq.consulta.parambyname('CH_VALO').AsFloat    := valor_informado;
          clCheq.consulta.parambyname('CH_VAPG').AsFloat    := 0.00;
          clCheq.Execute;
          clCheq.desconect;
          clCheq.Free;
          y_cliente := Trim(frm_FechamentoVenda_Cheque.edtNome.text);
          frm_FechamentoVenda_Cheque.Free;
        end
        else
        if (codigo_forma=KFPGT_CARTAO) then {salvando dados CARTAO DE CREDITO}
        begin
          clCartao := TClassAuxiliar.Create;
          clCartao.conect   ('VENDAS',self);
          clCartao.ClearSql;
          clCartao.AddParam ('INSERT INTO CARTOES_LOCAL                                         ');
          clCartao.AddParam (' (CA_CAIX,CA_LOJA,CA_VEND,CA_NUME,CA_ORDE,CA_CADM,CA_TPAR)        ');
          clCartao.AddParam ('VALUES                                                            ');
          clCartao.AddParam (' (:CA_CAIX,:CA_LOJA,:CA_VEND,:CA_NUME,:CA_ORDE,:CA_CADM,:CA_TPAR) ');
          clCartao.consulta.parambyname('CA_LOJA').AsFloat   := y_loja;
          clCartao.consulta.parambyname('CA_CAIX').AsFloat   := y_caixa;
          clCartao.consulta.parambyname('CA_VEND').AsFloat   := y_venda;
          if (Trim(frm_FechamentoVenda_Cartao.edtCodAdm.text)<>'') then
            clCartao.consulta.parambyname('CA_CADM').AsInteger  := strtoint(frm_FechamentoVenda_Cartao.edtCodAdm.text)
          else
            clCartao.consulta.parambyname('CA_CADM').AsInteger  := 0;
          clCartao.consulta.parambyname('CA_NUME').AsString  := Trim(frm_FechamentoVenda_Cartao.edtCartao.text);
          clCartao.consulta.parambyname('CA_ORDE').AsInteger := sequencia_ordem; {****}
          clCartao.consulta.parambyname('CA_TPAR').AsInteger := frm_FechamentoVenda_Cartao.y_qtde_parcelas; {****}
          clCartao.Execute;
          clCartao.desconect;
          clCartao.Free;
          frm_FechamentoVenda_Cartao.Free;
        end
        else
        if (codigo_forma=KFPGT_VALE_MERC) then {VALE MERCADORIA FUNCIONARIO}
        begin
          clValeMerc := TClassAuxiliar.Create;
          clValeMerc.conect   ('VENDAS',self);
          clValeMerc.ClearSql;
          clValeMerc.AddParam ('INSERT INTO VALES_MERC_LOCAL                                                  ');
          clValeMerc.AddParam (' (VM_CAIX,VM_LOJA,VM_VEND,VM_ORDE,VM_VALO,VM_NUME,VM_CFUN,VM_NPAR)            ');
          clValeMerc.AddParam ('VALUES                                                                        ');
          clValeMerc.AddParam (' (:VM_CAIX,:VM_LOJA,:VM_VEND,:VM_ORDE,:VM_VALO,:VM_NUME,:VM_CFUN,:VM_NPAR)    ');
          clValeMerc.consulta.parambyname('VM_LOJA').AsFloat   := y_loja;
          clValeMerc.consulta.parambyname('VM_CAIX').AsFloat   := y_caixa;
          clValeMerc.consulta.parambyname('VM_VEND').AsFloat   := y_venda;
          clValeMerc.consulta.parambyname('VM_ORDE').AsInteger := sequencia_ordem; {****}
          if (Trim(frm_FechamentoVenda_ValeMerc.edtCodFunc.text)<>'') then
            clValeMerc.consulta.parambyname('VM_CFUN').AsInteger  := strtoint(frm_FechamentoVenda_ValeMerc.edtCodFunc.text)
          else
            clValeMerc.consulta.parambyname('VM_CFUN').AsInteger  := 0;
          clValeMerc.consulta.parambyname('VM_NUME').AsString  := Trim(frm_FechamentoVenda_ValeMerc.edtNDoc.text);
          clValeMerc.consulta.parambyname('VM_NPAR').AsInteger := strtoint(Trim(frm_FechamentoVenda_ValeMerc.edtNParc.text)); {****}
          clValeMerc.consulta.parambyname('VM_VALO').AsFloat   := frm_FechamentoVenda_ValeMerc.y_valor;
          clValeMerc.Execute;
          clValeMerc.desconect;
          clValeMerc.Free;
          y_cliente := Trim(frm_FechamentoVenda_ValeMerc.pnFunc.Caption);
          frm_FechamentoVenda_ValeMerc.Free;
        end
        else
        if (codigo_forma=KFPGT_DEBITO) then {salvando dados DEBITO AUTOMATICO}
        begin
          clCartao := TClassAuxiliar.Create;
          clCartao.conect   ('VENDAS',self);
          clCartao.ClearSql;
          clCartao.AddParam ('INSERT INTO CARTOES_LOCAL                                ');
          clCartao.AddParam (' (CA_CAIX,CA_LOJA,CA_VEND,CA_NUME,CA_ORDE,CA_CADM)       ');
          clCartao.AddParam ('VALUES                                                   ');
          clCartao.AddParam (' (:CA_CAIX,:CA_LOJA,:CA_VEND,:CA_NUME,:CA_ORDE,:CA_CADM) ');
          clCartao.consulta.parambyname('CA_LOJA').AsFloat   := y_loja;
          clCartao.consulta.parambyname('CA_CAIX').AsFloat   := y_caixa;
          clCartao.consulta.parambyname('CA_VEND').AsFloat   := y_venda;
          if (Trim(frm_FechamentoVenda_Adm.edtCodAdm.text)<>'') then
            clCartao.consulta.parambyname('CA_CADM').AsInteger  := strtoint(frm_FechamentoVenda_Adm.edtCodAdm.text)
          else
            clCartao.consulta.parambyname('CA_CADM').AsInteger  := 0;
          clCartao.consulta.parambyname('CA_NUME').AsString  := Trim(frm_FechamentoVenda_Adm.edtCartao.text);
          clCartao.consulta.parambyname('CA_ORDE').AsInteger := sequencia_ordem; {****}
          clCartao.Execute;
          clCartao.desconect;
          clCartao.Free;
          frm_FechamentoVenda_Adm.Free;
        end
        else
        if (codigo_forma=KFPGT_VALES) or {VALES RECEBIDOS}
          (codigo_forma=KFPGT_VALES_EMI) then {VALES EMITIDOS}
        begin
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('INSERT INTO VALES_RECEBIDOS_LOCAL (VE_LOJA,VE_CAIX,VE_VEND,VE_ORDE,VE_NUME,VE_VALO,VE_TIPO,VE_CNPJ,VE_ECLI,VE_TELE) ');
          clAux.AddParam ('VALUES (:VE_LOJA,:VE_CAIX,:VE_VEND,:VE_ORDE,:VE_NUME,:VE_VALO,:VE_TIPO,:VE_CNPJ,:VE_CLIE,:VE_TELE)');
          clAux.consulta.parambyname('VE_LOJA').AsFloat    := y_loja;
          clAux.consulta.parambyname('VE_CAIX').AsFloat    := y_caixa;
          clAux.consulta.parambyname('VE_VEND').AsFloat    := y_venda;
          clAux.consulta.parambyname('VE_ORDE').AsInteger  := sequencia_ordem; {****}
          if (codigo_forma=KFPGT_VALES) then
            clAux.consulta.parambyname('VE_VALO').AsFloat := frm_FechamentoVenda_Vales.y_valor
          else
          if (codigo_forma=KFPGT_VALES_EMI) then
            if (frm_FechamentoVenda_Vales.y_valor>0.00) then
              clAux.consulta.parambyname('VE_VALO').AsFloat := (-1)*frm_FechamentoVenda_Vales.y_valor
            else
              clAux.consulta.parambyname('VE_VALO').AsFloat := frm_FechamentoVenda_Vales.y_valor;
          clAux.consulta.parambyname('VE_NUME').AsString   := frm_FechamentoVenda_Vales.y_numero;
          clAux.consulta.parambyname('VE_TIPO').AsString   := frm_FechamentoVenda_Vales.y_tipo_vale;
          clAux.consulta.parambyname('VE_CNPJ').AsString   := frm_FechamentoVenda_Vales.y_cpfcnpj;
          clAux.consulta.parambyname('VE_CLIE').AsString   := frm_FechamentoVenda_Vales.y_cliente;
          clAux.consulta.parambyname('VE_TELE').AsString   := frm_FechamentoVenda_Vales.y_telefone;
          clAux.Execute; {*}
          clAux.desconect;
          clAux.Free;
          y_cliente := Trim(frm_FechamentoVenda_Vales.y_cliente);
          frm_FechamentoVenda_Vales.Free;
        end
        else
        if (codigo_forma=KFPGT_CREDITO) then {salvando dados CREDIARIO}
        begin
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('INSERT INTO CREDIARIOS_LOCAL                    ');
          clAux.AddParam (' (CR_CAIX,CR_LOJA,CR_VEND,CR_ORDE,CR_CLIE,      ');
          clAux.AddParam ('  CR_CODI,CR_TOTA,CR_VENT,CR_FINA,CR_RECE,      ');
          clAux.AddParam ('  CR_CPF,CR_NOME,CR_EORD,CR_PLAN)               ');
          clAux.AddParam ('VALUES                                          ');
          clAux.AddParam (' (:CR_CAIX,:CR_LOJA,:CR_VEND,:CR_ORDE,:CR_CLIE, ');
          clAux.AddParam ('  :CR_CODI,:CR_TOTA,:CR_VENT,:CR_FINA,:CR_RECE, ');
          clAux.AddParam ('  :CR_CPF,:CR_NOME,:CR_EORD,:CR_PLAN)           ');
          clAux.consulta.parambyname('CR_LOJA').AsFloat   := y_loja;
          clAux.consulta.parambyname('CR_CAIX').AsFloat   := y_caixa;
          clAux.consulta.parambyname('CR_VEND').AsFloat   := y_venda;
          clAux.consulta.parambyname('CR_ORDE').AsInteger := sequencia_ordem; {***}
          if (Trim(frm_FechamentoVenda_Cred.edtCliente.text)<>'') then
            clAux.consulta.parambyname('CR_CLIE').AsFloat := strtofloat(Trim(frm_FechamentoVenda_Cred.edtCliente.text))
          else
            clAux.consulta.parambyname('CR_CLIE').AsFloat := 0;
          clAux.consulta.parambyname('CR_CPF').AsString  := Trim(frm_FechamentoVenda_Cred.edtCpf_crediario.text);
          clAux.consulta.parambyname('CR_NOME').AsString := Trim(frm_FechamentoVenda_Cred.edtNome_crediario.text);
          if (Trim(frm_FechamentoVenda_Cred.edtContrato.text)<>'') then
            clAux.consulta.parambyname('CR_CODI').AsFloat := strtofloat(Trim(frm_FechamentoVenda_Cred.edtContrato.text))
          else
            clAux.consulta.parambyname('CR_CODI').AsFloat := 0;
          if (Trim(frm_FechamentoVenda_Cred.edtTotalContrato.text)<>'') then
            clAux.consulta.parambyname('CR_TOTA').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(frm_FechamentoVenda_Cred.edtTotalContrato.text)))
          else
            clAux.consulta.parambyname('CR_TOTA').AsFloat := 0.00;
          if (Trim(frm_FechamentoVenda_Cred.edtValorEntrada.text)<>'') then
            clAux.consulta.parambyname('CR_VENT').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(frm_FechamentoVenda_Cred.edtValorEntrada.text)))
          else
            clAux.consulta.parambyname('CR_VENT').AsFloat := 0.00;
          if (Trim(frm_FechamentoVenda_Cred.edtValorFinanciado.text)<>'') then
            clAux.consulta.parambyname('CR_FINA').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(frm_FechamentoVenda_Cred.edtValorFinanciado.text)))
          else
            clAux.consulta.parambyname('CR_FINA').AsFloat := 0.00;
          clAux.consulta.parambyname('CR_RECE').AsFloat := 0.00;
          clAux.consulta.parambyname('CR_EORD').AsInteger := frm_FechamentoVenda_Cred.y_sequencial_forma_pagamento_entrada;
          if (frm_principal.servidor_credito.Connected) then
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.Conect('CREDITO',self);
            clAux2.AddParam('SELECT CR_PLAN');
            clAux2.AddParam('FROM CRECTABR');
            clAux2.AddParam('WHERE (CR_CODI=:contrato) AND (CR_CLIE=:cliente) AND (CR_LOJA=:loja)');
            clAux2.consulta.ParamByName('contrato').AsFloat := strtofloat(Trim(frm_FechamentoVenda_Cred.edtContrato.text));
            clAux2.consulta.ParamByName('cliente').AsFloat  := strtofloat(Trim(frm_FechamentoVenda_Cred.edtCliente.text));
            clAux2.consulta.ParamByName('loja').AsFloat     := y_loja;
            if (clAux2.Execute) then
              clAux.consulta.ParamByName('CR_PLAN').AsFloat := clAux2.Result('CR_PLAN')
            else
              clAux.consulta.parambyname('CR_PLAN').AsFloat := frm_FechamentoVenda_Cred.y_plano;
          end
          else
            clAux.consulta.parambyname('CR_PLAN').AsFloat := frm_FechamentoVenda_Cred.y_plano;

          clAux.Execute;
          clAux.desconect;
          clAux.Free;
          y_cliente := Trim(frm_FechamentoVenda_Cred.edtNome_crediario.text);
          frm_FechamentoVenda_Cred.Free;
        end;
        {******************************************************************************************}
        RefrescaTabela;
        y_saldo_venda         := RetornaSaldoVenda;
        pnSaldoAPagar.caption := form_nc(y_saldo_venda,10);
        {******************************************************************************************}
        Limparedits1.click;
        {******************************************************************************************}
      end;
    end;
  end;
end;

function Tfrm_FechamentoVenda.JaLancadoFormaPgto:Boolean;
var
  codigo_forma: Real;
begin
  if (Trim(edtCodForma.text)<>'') then
  begin
    codigo_forma:=strtofloat(Trim(edtCodForma.text));
    result:=false;
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=codigo_forma) then
      begin
        if (codigo_forma=KFPGT_DINHEIRO) then
          result:=true
        else
          result:=false;
        break;
      end;
      qFormas.next;
    end;
    qFormas.enablecontrols;
  end;
end;

function Tfrm_FechamentoVenda.LancouValorMaiorSaldo:Boolean;
var
  saldo_venda: Real;
  valor: Real;
begin
  saldo_venda := (strtofloat(Trim(RetiraFormatacaoNumero(form_nc(y_saldo_venda*100,10)))))/100;
  valor       := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
  valor       := (strtofloat(Trim(RetiraFormatacaoNumero(form_nc(valor*100,10)))))/100;
  if (valor>saldo_venda) then
    result:=true
  else
    result:=false;
end;

function Tfrm_FechamentoVenda.ProximaOrdem(loja,terminal,venda: Real):Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(VF_ORDE) as MAXIMA_ORDEM  ');
  clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL        ');
  clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND         ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND         ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)             ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat   := y_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat   := y_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat   := y_venda;
  clAux.Execute;
  result := clAux.result('MAXIMA_ORDEM') + 1;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_FechamentoVenda.qFormasCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (qFormas) do
  begin
    if (fieldbyname('nomeForma').IsNull) then
      fieldbyname('nomeForma').AsString :=
        ProcuraNomeFormaPgto(fieldbyname('VF_FPGT').AsFloat,self);
    if (fieldbyname('valorPago').IsNull) then
      fieldbyname('valorPago').AsString :=
        form_nc(fieldbyname('VF_VALO').AsFloat,10);
    if (fieldbyname('ordem').IsNull) then
      fieldbyname('ordem').AsString :=
        form_nz(fieldbyname('VF_ORDE').AsInteger,2);
  end;
end;

procedure Tfrm_FechamentoVenda.edtNDocKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Processarvenda1.click;
  if (key=K_CIMA) then
    edtValor.setfocus;
end;

procedure Tfrm_FechamentoVenda.edtNDocEnter(Sender: TObject);
begin
  if (trim(edtNDoc.text)='') then
    if (lblNDoc2.caption='R') then
      edtNDoc.text:=floattostr(frm_principal.x_romaneio)
    else
    if (lblNDoc2.caption='C') then
      edtNDoc.text:='' {busca da IMPRESSORA FISCAL, o proximo cupom}
    else
    if (lblNDoc2.caption='N') then
      edtNDoc.text:=floattostr(frm_principal.x_nota_fiscal);
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_FechamentoVenda.Processarvenda1Click(Sender: TObject);
var
  clItVend: TClassAuxiliar;
  Emite_NFE_NFCE, ClienteIdentificado: Boolean;
  indGauge,totGauge: Integer;
  cgc,nome,endereco: String;
  pValorTransacao, pNumeroCupomVenda, pNumeroControle : Pchar;
  RetDPOS, nStatus	: Integer;   a:string;
  Y_Qtde_Itens : integer; Y_desc_parc : real;
begin
  {CRITICA AOS DADOS}
  // Tecla F5 -
  if (trim(form_nc(y_saldo_venda,15))<>'0,00') then {obvio}
  begin
    ExibeCritica ('A venda ainda não foi concluída!','Venda',edtCodForma);
    ExibeCritica ('Provavelmente alguma FORMA DE PAGTO.   não foi informada!','Venda',edtCodForma);
  end
  else
  if (trim(edtNDoc.text)='') and (y_total_venda>0.00) then {*}
    ExibeCritica ('O Nº do documento deve ser informado!','Venda',edtNDoc)
  else
  if (not ExisteErroNoDocumento(trim(edtNDoc.text))) then
  begin
    ExibeCritica ('O Nº do documento está com formato incorreto!','Venda',nil);
    ExibeCritica ('Corrija a numeração do documento e tente novamente!','Venda',edtNDoc);
  end
  else
  begin
    {********************************************************************************}
    continuaConclusao := true;
    cgc := '';
    nome := '';
    endereco := '';
    if (lblNDoc2.caption='C') and
      (frm_principal.x_ecf_habilita_modo_fiscal) and
      (frm_principal.x_ecf_modo_venda=KMODOVENDA_ECF_FECHAMENTO) then
      continuaConclusao := VerificaImpressoraCupom;
    {********************************************************************************}
    EmiteValeVendaTROCO;

         {...}
    if (continuaConclusao) then
    begin
      frmDialogo.posativ:=1;
      if (frmDialogo.ExibirMensagem ('Confirma conclusão da venda?'
        ,'Venda',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        {********************************************************************************}
        //Buscando os itens vendidos
        {********************************************************************************}


      If Tipo_Nota = 'NFE' then
        begin
        Application.CreateForm(Tfrm_IdentificaCliente, frm_IdentificaCliente);
          frm_IdentificaCliente.showmodal;
          if trim(Frm_identificaCliente.edtNome.Text) = '' then
             ClienteIdentificado := false
          Else
             ClienteIdentificado := true;

          IF Not ClienteIdentificado then
             Begin
               ShowMessage('ClIENTE PRECISA SER IDENTIFICADO !! ');
               Exit;
             End;

         // frm_IdentificaCliente.Free;
        end;
        Application.CreateForm(TFrm_InfoAdicionais, Frm_InfoAdicionais);
        Frm_InfoAdicionais.ShowModal;

     If not Frm_InfoAdicionais.Confirma_Impressao then
        continuaConclusao := false;

     if not continuaConclusao then
        Exit;


       y_BaseICMS := 0.00; y_BaseICMSSubstituicao := 0.00;
       y_ValorICMS := 0.00; y_ValorPRodutos := 0.00;

        GERA_CAB_NFCE;

        clItVend := TClassAuxiliar.Create;
        clItVend.conect   ('VENDAS',self);
        clItVend.ClearSql;
        clItVend.AddParam ('Select *                          ');
        clItVend.AddParam ('From ITENS_VENDAS_LOCAL           ');
        clItVend.AddParam ('Where (IV_LOJA=:IV_LOJA) AND      ');
        clItVend.AddParam ('      (IV_CAIX=:IV_CAIX) AND      ');
        clItVend.AddParam ('      (IV_VEND=:IV_VEND)          ');
        clItVend.AddParam ('Order by IV_GRUP,IV_SUBG,IV_PROD  ');
        clItVend.consulta.parambyname('IV_LOJA').AsFloat := y_loja;
        clItVend.consulta.parambyname('IV_CAIX').AsFloat := y_caixa;
        clItVend.consulta.parambyname('IV_VEND').AsFloat := y_venda;
        clItVend.Execute;
        clItVend.first;
        {********************************************************************************}

        {... - IMPRESSAO DO CUPOM FISCAL}
        {********************************************************************************}
        if (lblNDoc2.caption='C') and
          (frm_principal.x_ecf_habilita_modo_fiscal) and
          (frm_principal.x_ecf_modo_venda=KMODOVENDA_ECF_FECHAMENTO) then
        begin
          abrirgavetafp;

          if frm_principal.x_ecf_habilita_modo_fiscal and
            frm_principal.x_ImpItemECF and
            (frm_lancavenda.Y_ImpVendaItens = 'C') then
            continuaConclusao :=  true
          else
          if (Trim(y_cgc)<>'') then
            continuaConclusao := AbreCupom_MFD(trim(edtNDoc.text),trim(cgc),trim(nome),trim(endereco))
          else
          if (Trim(y_cgc)='') then
            continuaConclusao := AbreCupom(trim(edtNDoc.text)); {*}

          if (continuaConclusao) then
          begin
            mostra_mensagem ('Imprimindo NFCE... Aguarde');
            frm_mensagem.painel.visible:=true;
            frm_mensagem.gauge1.progress:=0;
            indGauge:=0;
            totGauge:=clItVend.reccount;

           // if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
           //   frm_principal.PortaSerial.OpenPort(cpCom1);

            if not(frm_principal.x_ImpItemECF and (frm_lancavenda.Y_ImpVendaItens = 'C')) then
              while (not clItVend.eof) do
              begin
                if (clItVend.Result('IV_MODO')=0) then {+ SOMENTE 'ITEM VENDIDO'}
                begin
                  continuaConclusao := LancaItemCupom (clItVend,Trim(edtTotalDesc.text)); {*}
                  if (not continuaConclusao) then
                    break;
                end;

                {----->}
                Application.ProcessMessages;
                clItVend.next;

                //

                indGauge:=indGauge+1;
                frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
                frm_mensagem.gauge1.refresh;
              end;

            if (continuaConclusao) then
              continuaConclusao := ConclueCupom (qFormas,Trim(edtTotalDesc.text),trim(edtNDoc.text)); {*}
            esconde_mensagem;
          end;
          try
            FinalizaCupom; {*}

            if frm_principal.x_ecf_habilita_modo_fiscal and
              frm_principal.x_ImpItemECF then
              if (frm_lancavenda.Y_ImpVendaItens = 'C') then
                frm_lancavenda.Fcupom := FloatToStr(StrtofloatN(EdtNDoc.Text) + 1)
              else
                frm_lancavenda.Y_ImpVendaItens := Lblndoc2.Caption;
          except
          end;

          if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
            frm_principal.PortaSerial.ClosePort;
        end;
        {********************************************************************************}
        //fim da impressao do cupom fiscal

        {... - PROCESSAMENTO DA VENDA}
        {********************************************************************************}
        if (continuaConclusao) then
        begin
          //Pegando o proximo sequencial de VENDA interno
          frm_principal.x_codigo_venda := frm_principal.x_codigo_venda + 1;

          //Gravando os ITENS
          {********************************************************************************}
          clItVend.first;

          mostra_mensagem('Processando Venda... Aguarde');
          frm_mensagem.painel.visible:=true;
          frm_mensagem.gauge1.progress:=0;
          indGauge:=0;
          totGauge:=clItVend.reccount;
          total_venda_por_itens := 0.00;
          total_qtde1           := 0;
          total_qtde2           := 0;

// Processa o Rateio do Desconto

        Y_qtde_Itens  := totGauge;
        if trim(edtTotalDesc.text) <> '' then
           y_VaLorDesconto := StrToFloat(edtTotalDesc.text)
        else
           y_VaLorDesconto := 0.00;
        Y_desc_parc     := Y_ValorDesconto / Y_qtde_Itens;
        Y_desc          := Y_desc_Parc;

          while (not clItVend.eof) do
          begin
//********************************  GRAVA ITENS NFCE  ***********************

                NFCE_TOT_ITENS := NFCE_TOT_ITENS + 1;
                A_NFCE_COD     [NFCE_TOT_ITENS] := FloatToStr(clItVend.Result('IV_GRUP')) + '-'+ FloatToStr(clItVend.Result('IV_SUBG')) + '-'+ FloatToStr(clItVend.Result('IV_PROD'));

                A_NFCE_NCM     [NFCE_TOT_ITENS] := BuscaNCM(clItVend.Result('IV_GRUP'), clItVend.Result('IV_SUBG'),
                                                                                                 clItVend.Result('IV_PROD'));
                A_NFCE_DESCR   [NFCE_TOT_ITENS] := trim(form_t(ProcuraNomeItemEstoque(
                                                            clItVend.Result('IV_GRUP'),
                                                                  clItVend.Result('IV_SUBG'),
                                                                  clItVend.Result('IV_PROD'),
                                                                  clItVend.Result('IV_CORE'),
                                                                  clItVend.Result('IV_TAMA'),
                                                                  frm_principal),frm_principal.x_ecf_max_tam_descricao_item_cupom));

                A_NFCE_UNIDADE [NFCE_TOT_ITENS] := form_t(DevolveUnidadeProduto(clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'), clItVend.Result('IV_PROD')),2);

       NFCE_QTDE  := FloatToStr(clItVend.Result('IV_QTDE'));
       NFCE_PUNIT := FormatFloat('###,###.#0',clItVend.Result('IV_PVEN'));
       NFCE_VALITEM := FormatFloat('###,###.#0', clItVend.Result('IV_PVEN')*clItVend.Result('IV_QTDE'));

//   Gerar os Calculos das Bases

            GERA_ITENS_NFCE;

//********************************  GRAVA ITENS NFCE  ***********************
            GravaItemVenda (clItVend); {*}

            {----->}
            Application.ProcessMessages;
            clItVend.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          clItVend.desconect;
          clItVend.Free;

          {********************************************************************************}
          GravaCabecalhoVenda; {*}

          if (y_novo_total_venda=0.00) and (total_venda_por_itens<0.00) then
            GravaExcessoTrocasVenda (total_venda_por_itens); {*}

          {********************************************************************************}
           GERA_TOTAIS_NFCE;

          GravaFormasDePagamentoVenda; {*}
          GeraInformacaoFinanceiraDinheiro; //caso haja forma de pagamento em DINHEIRO

          {********************************************************************************}
          GeraInfoSobreAtendimentosDaVenda (frm_principal.x_terminal,frm_principal.x_codigo_venda);
          ConcluirAtendimentosDaVenda (frm_principal.x_terminal,frm_principal.x_codigo_venda);

          {********************************************************************************}
          ApagaRegistros_VENDA_E_ITEM_VENDA_LOCAL; //remove o BUFFER de venda (...LOCAL)
          AvancaSequencialDeVenda; {---> sequencial interno e documentos C,N,R}

          {********************************************************************************}
          esconde_mensagem;

          tecla:=13; {confirmacao}
          frm_LancaVenda.bPODE_SAIR := true; //SINALIZANDO A CONCLUSAO DA 'VENDA'

          close;
        end;
          //  a:=A+ 'A';

      end;
        // a:=A+ 'B';

    end;
      // Se continuaConclusao = False
      //a:=A+ 'C';

  end;
  // a:=A+ 'D';
  // ShowMessage('A='+A);
end;

procedure Tfrm_FechamentoVenda.FormCreate(Sender: TObject);
begin
  tecla:=27;
  frm_senhaSupervisor.y_flag := false;
  jaChamou:=false;
  y_tipz                     := '3'; {inicia como NORMAL(cupom fiscal) ***}
  y_total_venda              := 0.00;
  y_novo_total_venda         := 0.00;
  y_saldo_venda              := 0.00;
  CuponCartao                :='';
  CuponDebito                :='';
end;

procedure Tfrm_FechamentoVenda.gradeDblClick(Sender: TObject);
begin
  ExibeFormaPgto(qFormas.fieldbyname('VF_FPGT').AsFloat,
    qFormas.fieldbyname('VF_VALO').AsFloat,
    qFormas.fieldbyname('VF_ORDE').AsInteger);
end;

procedure Tfrm_FechamentoVenda.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    edtCodForma.setfocus;
  if (key=K_DELETE) then
  begin
    frmDialogo.posativ:=2;
    if (frmDialogo.ExibirMensagem ('Confirma exclusão do pagamento?'
      ,'Venda',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
      ExclueFormaPgto(qFormas.fieldbyname('VF_FPGT').AsFloat);
      excluicrediario(y_loja,y_caixa,ncodigo);
      CancelaVenda(y_loja,y_caixa,ncodigo);
    end;
    frmDialogo.posativ:=1;
  end;
  if (key=K_ENTER) then
    edtNDoc.setfocus;
end;

procedure Tfrm_FechamentoVenda.ExibeFormaPgto(codigo_forma,valor: Real; ordem: Integer);
var
  clAux,clAux2: TClassAuxiliar;
  primeiro_valor: Real;
begin
  Application.CreateForm(Tfrm_VerDadosPgto,frm_VerDadosPgto);
  clAux := TClassAuxiliar.Create;
  clAux.conect ('VENDAS',self);
  if (codigo_forma=KFPGT_DINHEIRO) then {* DINHEIRO}
  begin
         {***************************************************************************}
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VENDAS_FORMA_PAGAMENTO_LOCAL   ');
    clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND                 ');
    clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                 ');
    clAux.AddParam ('      (VF_VEND=:VF_VEND) AND                 ');
    clAux.AddParam ('      (VF_ORDE=:VF_ORDE)                     ');
    clAux.consulta.parambyname('VF_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('VF_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('VF_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('VF_ORDE').AsInteger := ordem;
    clAux.Execute;
         {***************************************************************************}
    frm_VerDadosPgto.Memo1.lines.Add(' --- DINHEIRO ---------------------------------------');
    frm_VerDadosPgto.Memo1.lines.Add(' Valor a receber.....$: '+form_nc(clAux.result('VF_VALO'),18));
    frm_VerDadosPgto.Memo1.lines.Add(' Valor recebido......$: '+form_nc(clAux.result('VF_VALO')+clAux.result('VF_TROC'),18));
    frm_VerDadosPgto.Memo1.lines.Add(' Troco...............$: '+form_nc(clAux.result('VF_TROC'),18));
    frm_VerDadosPgto.Memo1.lines.Add(' ----------------------------------------------------');
  end
  else
  if (codigo_forma=KFPGT_CHEQUE) then {* CHEQUE A VISTA}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CHEQUES_LOCAL           ');
    clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND          ');
    clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND          ');
    clAux.AddParam ('      (CH_VEND=:CH_VEND) AND          ');
    clAux.AddParam ('      (CH_ORDE=:CH_ORDE)              ');
    clAux.consulta.parambyname('CH_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('CH_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('CH_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('CH_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.Add(' --- CHEQUE À VISTA -------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Cód/Banco......: '+form_n (clAux.result('CH_BANC'),3));
      frm_VerDadosPgto.Memo1.lines.Add(' Emitente.......: '+form_t (clAux.result('CH_NOME'),40));
      frm_VerDadosPgto.Memo1.lines.Add(' Tel............: '+form_t (clAux.result('CH_FONE'),15));
      frm_VerDadosPgto.Memo1.lines.Add(' CPF............: '+ExibeCpf(clAux.result('CH_CPF')));
      if (clAux.result('CH_FLAG')='1') then
        frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: PRÓPRIO CLIENTE ')
      else
      if (clAux.result('CH_FLAG')='0') then
        frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: TERCEIROS ');
      frm_VerDadosPgto.Memo1.lines.Add(' Nome banco.....: '+form_t (clAux.result('CH_NBAN'),30));
      frm_VerDadosPgto.Memo1.lines.Add(' Agência........: '+form_t (clAux.result('CH_AGEN'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' Conta/Corrente.: '+form_t (clAux.result('CH_CONT'),20));
      frm_VerDadosPgto.Memo1.lines.Add(' Número cheque..: '+form_n (clAux.result('CH_NUME'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
  if (codigo_forma=KFPGT_CREDITO) then {* CREDIARIO}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CREDIARIOS_LOCAL        ');
    clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND          ');
    clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND          ');
    clAux.AddParam ('      (CR_VEND=:CR_VEND) AND          ');
    clAux.AddParam ('      (CR_ORDE=:CR_ORDE)              ');
    clAux.consulta.parambyname('CR_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('CR_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('CR_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('CR_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- CREDIÁRIO ------------------------------------------');
      if (clAux.result('CR_CLIE')<>0) then
      begin
        if (databasecredito='CREDITO') then
          frm_VerDadosPgto.Memo1.lines.Add(' Código/cliente..: '+form_nz(clAux.result('CR_CLIE'),6)+'-'+
            ProcuraNomeClienteCod(clAux.result('CR_CLIE'),self))
        else
          frm_VerDadosPgto.Memo1.lines.Add(' Código/cliente..: '+form_nz(clAux.result('CR_CLIE'),6));
      end
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Código/cliente..: >>Não informado');
      if (clAux.result('CR_CPF')<>'') then
        frm_VerDadosPgto.Memo1.lines.Add(' CPF/CNPJ........: '+form_t(clAux.result('CR_CPF'),14))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' CPF/CNPJ........: >>Não informado');
      if (clAux.result('CR_NOME')<>'') then
        frm_VerDadosPgto.Memo1.lines.Add(' Nome do cliente.: '+form_t(clAux.result('CR_NOME'),40))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Nome do cliente.: >>Não informado');
      if (clAux.result('CR_CODI')<>0) then
        frm_VerDadosPgto.Memo1.lines.Add(' Contrato........: '+form_nz(clAux.result('CR_CODI'),6))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Contrato........: >>Não informado');
      frm_VerDadosPgto.Memo1.lines.Add(' Total contrato.$: '+form_nc(clAux.result('CR_TOTA'),12));
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Entrada........$: '+form_nc(clAux.result('CR_VENT'),12));
      if (clAux.result('CR_RECE')<>0.00) then
        frm_VerDadosPgto.Memo1.lines.Add(' Recebido?......$: SIM')
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Recebido?......$: NAO!!!');
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Financiado.....$: '+form_nc(clAux.result('CR_FINA'),12));
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
  if (codigo_forma=KFPGT_VALE_MERC) then {* vale mercadoria funcionario}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VALES_MERC_LOCAL                 ');
    clAux.AddParam ('WHERE (VM_LOJA=:VM_LOJA) AND                   ');
    clAux.AddParam ('      (VM_CAIX=:VM_CAIX) AND                   ');
    clAux.AddParam ('      (VM_VEND=:VM_VEND) AND                   ');
    clAux.AddParam ('      (VM_ORDE=:VM_ORDE)                       ');
    clAux.consulta.parambyname('VM_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('VM_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('VM_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('VM_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- VALE MERCADORIA ------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Funcionário.......: '+form_nz(clAux.result('VM_CFUN'),4)+'-'+
        ProcuraNomeVend(frm_principal.x_loja,clAux.result('VM_CFUN'),self));
      frm_VerDadosPgto.Memo1.lines.Add(' Nº documento......: '+clAux.result('VM_NUME'));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor $...........: '+form_nc(clAux.result('VM_VALO'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' Nº de parcelas....: '+form_nz(clAux.result('VM_NPAR'),2));
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
  if (codigo_forma=KFPGT_CARTAO) then {* cartao de credito}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CARTOES_LOCAL           ');
    clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND          ');
    clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND          ');
    clAux.AddParam ('      (CA_VEND=:CA_VEND) AND          ');
    clAux.AddParam ('      (CA_ORDE=:CA_ORDE)              ');
    clAux.consulta.parambyname('CA_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('CA_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('CA_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      clAux2 := TClassAuxiliar.Create;
      clAux2.conect   ('VENDAS',self);
      clAux2.ClearSql;
      clAux2.AddParam ('SELECT PC_VENC,PC_VALO FROM CARTOES_PARCELAS_LOCAL ');
      clAux2.AddParam ('WHERE (PC_LOJA=:PC_LOJA) AND                       ');
      clAux2.AddParam ('      (PC_CAIX=:PC_CAIX) AND                       ');
      clAux2.AddParam ('      (PC_VEND=:PC_VEND) AND                       ');
      clAux2.AddParam ('      (PC_ORDE=:PC_ORDE)                           ');
      clAux2.consulta.parambyname('PC_LOJA').AsFloat := y_loja;
      clAux2.consulta.parambyname('PC_CAIX').AsFloat := y_caixa;
      clAux2.consulta.parambyname('PC_VEND').AsFloat := y_venda;
      clAux2.consulta.parambyname('PC_ORDE').AsInteger := ordem;
      clAux2.Execute;
      clAux2.first; //primeira parcela
      primeiro_valor := clAux2.result('PC_VALO');
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- CARTÃO DE CRÉDITO ----------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Administradora....: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
        ProcuraNomeAdm(clAux.result('CA_CADM'),1,self));
      frm_VerDadosPgto.Memo1.lines.Add(' Nº do cartão......: '+clAux.result('CA_NUME'));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor $...........: '+form_nc(valor,10));
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Nº de parcelas....: '+form_nz(clAux.result('CA_TPAR'),2));
      frm_VerDadosPgto.Memo1.lines.Add(' Vencimento inicial: '+form_data(clAux2.result('PC_VENC'))); {*}
      clAux2.last; //ultima parcela -> a primeira pode ter acrescimo
      if (trim(form_nc(primeiro_valor,10))<>trim(form_nc(clAux2.result('PC_VALO'),10))) then
        frm_VerDadosPgto.Memo1.lines.Add(' Valor parcelas $..: '+trim(form_nc(clAux2.result('PC_VALO'),10))+
          ' / (1ª parc: '+trim(form_nc(primeiro_valor,10))+')')
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Valor parcelas $..: '+trim(form_nc(clAux2.result('PC_VALO'),10))); {*}
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
      clAux2.desconect;
      clAux2.Free;
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
  if (codigo_forma=KFPGT_DEBITO) then {* DEBITO AUTOMATICO}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CARTOES_LOCAL           ');
    clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND          ');
    clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND          ');
    clAux.AddParam ('      (CA_VEND=:CA_VEND) AND          ');
    clAux.AddParam ('      (CA_ORDE=:CA_ORDE)              ');
    clAux.consulta.parambyname('CA_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('CA_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('CA_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- DÉBITO AUTOMÁTICO ----------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
        ProcuraNomeAdm(clAux.result('CA_CADM'),0,self));
      frm_VerDadosPgto.Memo1.lines.Add(' Nº do cartão...: '+clAux.result('CA_NUME'));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor $........: '+form_nc(valor,10));
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
  if (codigo_forma=KFPGT_VALES) then {* VALES RECEBIDOS}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VALES_RECEBIDOS_LOCAL           ');
    clAux.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND          ');
    clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND          ');
    clAux.AddParam ('      (VE_VEND=:VE_VEND) AND          ');
    clAux.AddParam ('      (VE_ORDE=:VE_ORDE)              ');
    clAux.consulta.parambyname('VE_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('VE_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('VE_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('VE_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- VALES RECEBIDOS ------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Número do vale.: '+form_t(clAux.result('VE_NUME'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor do vale $: '+form_nc(clAux.result('VE_VALO'),10));
      if (clAux.result('VE_TIPO')='P') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE PRESENTE')
      else
      if (clAux.result('VE_TIPO')='S') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE SIMPLES')
      else
      if (clAux.result('VE_TIPO')='T') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE TROCO')
      else
      if (clAux.result('VE_TIPO')='F') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE FUNCIONARIO')
      else
      if (clAux.result('VE_TIPO')='D') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE DESCONTO')
      else
      if (clAux.result('VE_TIPO')='B') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BRINDE')
      else
      if (clAux.result('VE_TIPO')='O') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BÔNUS ');
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
  if (codigo_forma=KFPGT_VALES_EMI) then {* VALES EMITIDOS}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VALES_RECEBIDOS_LOCAL           ');
    clAux.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND          ');
    clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND          ');
    clAux.AddParam ('      (VE_VEND=:VE_VEND) AND          ');
    clAux.AddParam ('      (VE_ORDE=:VE_ORDE)              ');
    clAux.consulta.parambyname('VE_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('VE_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('VE_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('VE_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- VALES VENDIDOS  ------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Nº do vale.....: '+form_t(clAux.result('VE_NUME'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor do vale $: '+form_nc((-1)*clAux.result('VE_VALO'),10));
      if (clAux.result('VE_TIPO')='P') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE PRESENTE')
      else
      if (clAux.result('VE_TIPO')='S') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE SIMPLES')
      else
      if (clAux.result('VE_TIPO')='T') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE TROCO')
      else
      if (clAux.result('VE_TIPO')='F') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE FUNCIONARIO')
      else
      if (clAux.result('VE_TIPO')='D') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE DESCONTO')
      else
      if (clAux.result('VE_TIPO')='B') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BRINDE')
      else
      if (clAux.result('VE_TIPO')='O') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BÔNUS ');
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
    frm_VerDadosPgto.Memo1.lines.Add('>>Nenhuma Forma de Pagamento Informada');
  clAux.desconect;
  clAux.Free;
  frm_VerDadosPgto.showmodal;
  frm_VerDadosPgto.Free;
end;

function Tfrm_FechamentoVenda.GetOrdemFormaPgto(codigo_forma: Real):Integer;
begin
  qFormas.disablecontrols;
  qFormas.first;
  result:=0;
  while (not qFormas.eof) do
  begin
    if (qFormas.fieldbyname('VF_FPGT').AsFloat=codigo_forma) then
    begin
      result := qFormas.fieldbyname('VF_ORDE').AsInteger;
      break;
    end;
    qFormas.next;
  end;
  qFormas.enablecontrols;
end;

procedure Tfrm_FechamentoVenda.ExclueFormaPgto(codigo_forma: Real);
var
  clAux: TClassAuxiliar;
  ordem: Integer;
  codigo_forma_a_vista: Real;
  ordem_pgto_a_vista: Integer;
begin
  ordem := GetOrdemFormaPgto(codigo_forma);
  clAux := TClassAuxiliar.Create;
  clAux.conect ('VENDAS',self);
  if (codigo_forma=KFPGT_CREDITO) then {* deletando CREDIARIO}
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM CREDIARIOS_LOCAL          ');
    clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND          ');
    clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND          ');
    clAux.AddParam ('      (CR_VEND=:CR_VEND) AND          ');
    clAux.AddParam ('      (CR_ORDE=:CR_ORDE)              ');
    clAux.consulta.parambyname('CR_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('CR_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('CR_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('CR_ORDE').AsInteger := ordem;
    clAux.Execute;
  end
  else
  if (codigo_forma=KFPGT_CARTAO) or (codigo_forma=KFPGT_DEBITO) then {* deletando CARTAO DE CREDITO / DEBITO AUTOMATICO}
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM CARTOES_LOCAL             ');
    clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND          ');
    clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND          ');
    clAux.AddParam ('      (CA_VEND=:CA_VEND) AND          ');
    clAux.AddParam ('      (CA_ORDE=:CA_ORDE)              ');
    clAux.consulta.parambyname('CA_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('CA_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('CA_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem;
    clAux.Execute;
         {...}
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM CARTOES_PARCELAS_LOCAL    ');
    clAux.AddParam ('WHERE (PC_LOJA=:PC_LOJA) AND          ');
    clAux.AddParam ('      (PC_CAIX=:PC_CAIX) AND          ');
    clAux.AddParam ('      (PC_VEND=:PC_VEND)              ');
    clAux.consulta.parambyname('PC_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('PC_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('PC_VEND').AsFloat := y_venda;
    clAux.Execute;
  end
  else
  if (codigo_forma_a_vista=KFPGT_CHEQUE) then {* deletando CHEQUE A VISTA}
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM CHEQUES_LOCAL             ');
    clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND          ');
    clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND          ');
    clAux.AddParam ('      (CH_VEND=:CH_VEND) AND          ');
    clAux.AddParam ('      (CH_ORDE=:CH_ORDE)              ');
    clAux.consulta.parambyname('CH_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('CH_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('CH_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('CH_ORDE').AsInteger := ordem_pgto_a_vista;
    clAux.Execute;
  end
  else
  if (codigo_forma_a_vista=KFPGT_VALES) or
    (codigo_forma_a_vista=KFPGT_VALES_EMI) then {* deletando VALES}
  begin
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM VALES_RECEBIDOS_LOCAL             ');
    clAux.AddParam ('WHERE (VE_LOJA=:CH_LOJA) AND          ');
    clAux.AddParam ('      (VE_CAIX=:CH_CAIX) AND          ');
    clAux.AddParam ('      (VE_VEND=:CH_VEND) AND          ');
    clAux.AddParam ('      (VE_ORDE=:CH_ORDE)              ');
    clAux.consulta.parambyname('VE_LOJA').AsFloat := y_loja;
    clAux.consulta.parambyname('VE_CAIX').AsFloat := y_caixa;
    clAux.consulta.parambyname('VE_VEND').AsFloat := y_venda;
    clAux.consulta.parambyname('VE_ORDE').AsInteger := ordem_pgto_a_vista;
    clAux.Execute;
  end;

    {*** Excluindo a forma de pagamento *****************************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VENDAS_FORMA_PAGAMENTO_LOCAL   ');
  clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND               ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND               ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND) AND               ');
  clAux.AddParam ('      (VF_ORDE=:VF_ORDE)                   ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat := y_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat := y_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat := y_venda;
  clAux.consulta.parambyname('VF_ORDE').AsInteger := ordem;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;

    {****************************}
  RefrescaTabela;
  y_saldo_venda := RetornaSaldoVenda;
  pnSaldoAPagar.caption := form_nc(y_saldo_venda,10);
end;

procedure Tfrm_FechamentoVenda.botao1Click(Sender: TObject);
begin
  Processarvenda1.click;
end;

procedure Tfrm_FechamentoVenda.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda.Ajuda1Click(Sender: TObject);
begin
  ListaAtalhosF1.clear;
  ListaAtalhosF1.Add(' [ESC]     - Sair                ');
  ListaAtalhosF1.Add('');
  ListaAtalhosF1.Add(' [CTRL+D]  - Desconto na Venda   ');
  ListaAtalhosF1.Add('');
  ListaAtalhosF1.Add(' [F8]      - Busca forma de pgto.');
  ListaAtalhosF1.Add('   (com o foco na forma de pgto.)   ');
  ListaAtalhosF1.Add('');
  ListaAtalhosF1.Add(' [CTRL+L]  - Limpar formulário   ');
  ListaAtalhosF1.Add('');
  ListaAtalhosF1.Add(' [F5]      - Busca forma de pgto.');
  ListaAtalhosF1.Add('');
  ListaAtalhosF1.Add(' [CTRL+C] - Dados do cliente no cupom.');
  Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
  frm_AjudaComandos.showmodal;
  frm_AjudaComandos.Free;
end;

procedure Tfrm_FechamentoVenda.AlteraValorFormaPgto(codigo_forma,valor: Real);
var
  clAux: TClassAuxiliar;
  ordem: Integer;
begin
  ordem := GetOrdemFormaPgto(codigo_forma);
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('Update VENDAS_FORMA_PAGAMENTO_LOCAL ');
  clAux.AddParam ('Set    VF_VALO=:VF_VALO             ');
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND        ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND        ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND) AND        ');
  clAux.AddParam ('      (VF_ORDE=:VF_ORDE)            ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat   := y_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat   := y_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat   := y_venda;
  clAux.consulta.parambyname('VF_ORDE').AsInteger := ordem;
  clAux.consulta.parambyname('VF_VALO').AsFloat   := valor;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_FechamentoVenda.GetValorFormaPgto(codigo_forma: Real):Real;
begin
  qFormas.disablecontrols;
  qFormas.first;
  result:=0;
  while (not qFormas.eof) do
  begin
    if (qFormas.fieldbyname('VF_FPGT').AsFloat=codigo_forma) then
    begin
      result := qFormas.fieldbyname('VF_VALO').AsFloat;
      break;
    end;
    qFormas.next;
  end;
  qFormas.enablecontrols;
end;

procedure Tfrm_FechamentoVenda.AlteraValorTroco(codigo_forma,valor_troco: Real);
var
  clAux: TClassAuxiliar;
  ordem: Integer;
begin
  ordem := GetOrdemFormaPgto(codigo_forma);
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('Update VENDAS_FORMA_PAGAMENTO_LOCAL ');
  clAux.AddParam ('Set    VF_TROC=:VF_TROC             ');
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND        ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND        ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND) AND        ');
  clAux.AddParam ('      (VF_ORDE=:VF_ORDE)            ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat   := y_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat   := y_caixa;
  clAux.consulta.parambyname('VF_VEND').AsFloat   := y_venda;
  clAux.consulta.parambyname('VF_ORDE').AsInteger := ordem;
  clAux.consulta.parambyname('VF_TROC').AsFloat   := valor_troco;
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_FechamentoVenda.RetornaQtdeSaidas(loja,terminal,venda: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IV_QTDE) as TOTAL_SAIDAS  ');
  clAux.AddParam ('FROM   ITENS_VENDAS                  ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND         ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND         ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND         ');
  clAux.AddParam ('      (IV_TOTA>0)                    ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := venda;
  clAux.Execute;
  result := clAux.result('TOTAL_SAIDAS');
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_FechamentoVenda.RetornaQtdeEntradas(loja,terminal,venda: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT SUM(IV_QTDE) as TOTAL_ENTRADAS ');
  clAux.AddParam ('FROM   ITENS_VENDAS                   ');
  clAux.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND          ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND          ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND) AND          ');
  clAux.AddParam ('      (IV_TOTA<0)                     ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat  := loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat  := terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat  := venda;
  clAux.Execute;
  result := clAux.result('TOTAL_ENTRADAS');
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_FechamentoVenda.ConcluirAtendimentosDaVenda(terminalvenda,codigovenda: Real);
var
  terminalatendimento: Real;
  codigoatendimento: Real;
  clAux: TClassAuxiliar;
  i: Integer;
begin
  i:=0;
  while (i<frm_LancaVenda.y_LISTA_atendimentos.count) do
  begin
    terminalatendimento := strtofloat(trim(Copy(frm_LancaVenda.y_LISTA_atendimentos[i],1,10))); {*}
    codigoatendimento   := strtofloat(trim(Copy(frm_LancaVenda.y_LISTA_atendimentos[i],12,10))); {*}

          //1. ---------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('UPDATE ATENDIMENTOS                          ');
    clAux.AddParam ('SET    AT_FUNC=:caixa_ativo,                 ');
    clAux.AddParam ('       AT_STAT=:status,                      ');
    clAux.AddParam ('       AT_CAI2=:terminalvenda,               ');
    clAux.AddParam ('       AT_VEN2=:codigovenda                  ');
    clAux.AddParam ('WHERE (AT_LOJA=:loja) AND                    ');
    clAux.AddParam ('      (AT_CAIX=:terminalatendimento) AND     ');
    clAux.AddParam ('      (AT_CODI=:codigoatendimento)           ');
    clAux.consulta.parambyname('terminalvenda').AsFloat         := terminalvenda;
    clAux.consulta.parambyname('terminalatendimento').AsFloat   := terminalatendimento; {*}
    clAux.consulta.parambyname('codigovenda').AsFloat           := codigovenda;
    clAux.consulta.parambyname('codigoatendimento').AsFloat     := codigoatendimento; {*}
    clAux.consulta.parambyname('loja').AsFloat                  := frm_principal.x_loja;
    clAux.consulta.parambyname('caixa_ativo').AsFloat           := frm_principal.x_caixa_ativo;
    clAux.consulta.parambyname('status').AsString               := '1';
    clAux.Execute; {*}
    clAux.desconect;
    clAux.Free;
          //------------------------------------------------------

    i:=i+1; {*}
  end;
end;

procedure Tfrm_FechamentoVenda.EmiteValeVendaTROCO;
var
  valor_troco: Real;
  temVendaVale: Boolean;
begin
  if (trim(pnTroco.caption)<>'') then
    valor_troco := strtofloat(RetiraFormatacaoNumero(trim(pnTroco.caption)))
  else
    valor_troco := 0.00;
  if (valor_troco>0.00) then //somente se teve troco
  begin
    temVendaVale:=false;
    qFormas.disablecontrols;
    qFormas.first;
    while (not qFormas.eof) do
    begin
      if (qFormas.fieldbyname('VF_FPGT').AsFloat=KFPGT_VALES) then
      begin
        temVendaVale:=true;
        break;
      end;

               {--->}
      qFormas.next;
    end;

          {...}
    if (temVendaVale) then {*}
    begin
      frmDialogo.posativ:=1;
      if (frmDialogo.ExibirMensagem ('Deseja emitir um Vale-troco?'
        ,'Venda',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
                    //***********************************************************************************
        Application.CreateForm(Tfrm_VendaDeVales, frm_VendaDeVales);
        frm_VendaDeVales.rdTipo.itemindex       := 2; //TROCO
        frm_VendaDeVales.edtValor.text          := pnTroco.caption; //fixa o valor do troco
        frm_VendaDeVales.rdTipo.enabled         := false;
        frm_VendaDeVales.edtValor.readonly      := true;
        frm_VendaDeVales.caption                := 'EMISSÃO DE VALE-TROCO';
        frm_VendaDeVales.y_flagFecharAposSalvar := true;
        frm_VendaDeVales.showmodal;
        frm_VendaDeVales.rdTipo.enabled         := true;
        frm_VendaDeVales.edtValor.readonly      := false;
        frm_VendaDeVales.Free;
                    //***********************************************************************************
      end;
    end;
    qFormas.enablecontrols;
  end;
end;

//RECEBIMENTOS DE 'VALES' NAO PODE SER COMISSIONADO, nem o que sai, nem o que entra
function Tfrm_FechamentoVenda.CalculaValorComissionavel:Real;
var
  clAux: TClassAuxiliar;
  total_comissionavel: Real;
  total_nao_comissionavel: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VF_FPGT,VF_VALO                               ');
  clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL                  ');
  clAux.AddParam ('WHERE (VF_LOJA=:loja) AND                            ');
  clAux.AddParam ('      (VF_CAIX=:terminal) AND                        ');
  clAux.AddParam ('      (VF_VEND=:venda)                               ');
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('venda').AsFloat    := frm_principal.x_venda; //-1 , local
  clAux.Execute;
  clAux.first;
  total_comissionavel     := 0.00;
  total_nao_comissionavel := 0.00;
  while (not clAux.eof) do
  begin

    if (clAux.result('VF_FPGT')=KFPGT_DINHEIRO) or
      (clAux.result('VF_FPGT')=KFPGT_CHEQUE)   or
      (clAux.result('VF_FPGT')=KFPGT_DEBITO)   or
      (clAux.result('VF_FPGT')=KFPGT_CARTAO)   or
      (clAux.result('VF_FPGT')=KFPGT_CREDITO)  then
      total_comissionavel := total_comissionavel + clAux.result('VF_VALO')
    else
      total_nao_comissionavel := total_nao_comissionavel + clAux.result('VF_VALO');
//Marcio----------------------------------------------------------------------------------------
    if (frm_principal.x_comissao_vales_recebidos) and (clAux.Result('VF_FPGT')=KFPGT_VALES) then
    begin
      total_comissionavel := total_comissionavel + clAux.result('VF_VALO');
      total_nao_comissionavel := total_nao_comissionavel - clAux.result('VF_VALO');
    end;
    if (frm_principal.x_comissao_vales_emitidos) and (clAux.Result('VF_FPGT')=KFPGT_VALES_EMI) then
    begin
      total_comissionavel := total_comissionavel + clAux.result('VF_VALO');
      total_nao_comissionavel := total_nao_comissionavel - clAux.result('VF_VALO');
    end;
    if (frm_principal.x_comissao_vales_mercadoria) and (clAux.Result('VF_FPGT')=KFPGT_VALE_MERC) then
    begin
      total_comissionavel := total_comissionavel + clAux.result('VF_VALO');
      total_nao_comissionavel := total_nao_comissionavel - clAux.result('VF_VALO');
    end;
          {--->}
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;

  if ((total_comissionavel+total_nao_comissionavel)<>0.00) then
    y_percentual_comissionavel := total_comissionavel/(total_comissionavel+total_nao_comissionavel) {*}
  else
    y_percentual_comissionavel := 1;

  if (frm_principal.x_descontar_devolucao) then
    total_comissionavel := total_comissionavel
  else
  if (not frm_principal.x_descontar_devolucao)and (total_comissionavel<0.00) then
    total_comissionavel := 0.00;

  result := total_comissionavel;
end;

//ESTA ROTINA É BASTANTE IMPORTANTE **************************************************************
procedure Tfrm_FechamentoVenda.GeraInfoSobreAtendimentosDaVenda(terminalvenda,codigovenda: Real);
var
  clAux,clAux2: TClassAuxiliar;
  desconto_atendimento: Real;
  terminalatendimento: Real;
  codigoatendimento: Real;
  total_real_venda: Real;
  total_venda_atendimento: Real;
  i: Integer;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT IV_VEDE,                                      ');
  clAux.AddParam ('       SUM(IV_TOTA/IV_PVEN) as TOTAL_QTDE,           '); //considerando o sinal
  clAux.AddParam ('       SUM(IV_TOTA) as TOTAL_VENDA                   ');
  clAux.AddParam ('FROM   ITENS_VENDAS                                  ');
  clAux.AddParam ('WHERE (IV_LOJA=:loja) AND                            ');
  clAux.AddParam ('      (IV_CAIX=:terminal) AND                        ');
  clAux.AddParam ('      (IV_VEND=:venda)                               ');
  clAux.AddParam ('GROUP BY IV_VEDE                                     ');
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := terminalvenda;
  clAux.consulta.parambyname('venda').AsFloat    := codigovenda;
  clAux.Execute;

     {...}
  clAux.first;
  while (not clAux.eof) do
  begin
          //... Verificando se houve desconto
    if (frm_LancaVenda.MODO='ATENDIMENTO') then
    begin
      desconto_atendimento := 0.00;
      i:=0;
      while (i<frm_LancaVenda.y_LISTA_atendimentos.count) do
      begin
        terminalatendimento := strtofloat(trim(Copy(frm_LancaVenda.y_LISTA_atendimentos[i],1,10))); {*}
        codigoatendimento   := strtofloat(trim(Copy(frm_LancaVenda.y_LISTA_atendimentos[i],12,10))); {*}

        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   (databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT AT_DESC,AT_VEND FROM ATENDIMENTOS     ');
        clAux2.AddParam ('WHERE (AT_LOJA=:loja) AND                    ');
        clAux2.AddParam ('      (AT_CAIX=:terminalatendimento) AND     ');
        clAux2.AddParam ('      (AT_CODI=:codigoatendimento)           ');
        clAux2.consulta.parambyname('loja').AsFloat                := frm_principal.x_loja;
        clAux2.consulta.parambyname('terminalatendimento').AsFloat := terminalatendimento; {*}
        clAux2.consulta.parambyname('codigoatendimento').AsFloat   := codigoatendimento; {*}
        clAux2.Execute;
        if (clAux2.result('AT_VEND')=clAux.result('IV_VEDE')) then //se mesmo VENDEDOR
        begin
          if (clAux2.result('AT_DESC')<0) then //desconto no valor
            desconto_atendimento := (-1)*clAux2.result('AT_DESC')
          else
          if (clAux2.result('AT_DESC')>0) then //desconto no percentual
            desconto_atendimento := ((clAux2.result('AT_DESC')/100)*clAux.result('TOTAL_VENDA'))
          else
            desconto_atendimento := 0.00;
          break;
        end
        else
          desconto_atendimento := 0.00;
        clAux2.desconect;
        clAux2.Free;

        i:=i+1; //prox. atdo.
      end;
    end
    else
    if (frm_LancaVenda.MODO='VENDEDOR') then
    begin
      clAux2 := TClassAuxiliar.Create;
      clAux2.conect   (databaseprodutos,self);
      clAux2.ClearSql;
      clAux2.AddParam ('SELECT VE_DESC,VE_TOTA FROM VENDAS           ');
      clAux2.AddParam ('WHERE (VE_LOJA=:loja) AND                    ');
      clAux2.AddParam ('      (VE_CAIX=:terminalvenda) AND           ');
      clAux2.AddParam ('      (VE_CODI=:codigovenda)                 ');
      clAux2.consulta.parambyname('loja').AsFloat          := frm_principal.x_loja;
      clAux2.consulta.parambyname('terminalvenda').AsFloat := terminalvenda;
      clAux2.consulta.parambyname('codigovenda').AsFloat   := codigovenda;
      clAux2.Execute; {*}
      desconto_atendimento := clAux2.result('VE_DESC');
      total_real_venda     := clAux2.result('VE_TOTA');
      clAux2.desconect;
      clAux2.Free;
    end;

    //VERIFICANDO SE HOUVE 'TROCA EM EXCESSO'
    if (clAux.result('TOTAL_VENDA')<0.00) then
    begin
      if (total_real_venda=0.00) then //significa que decidiu zerar a VENDA
        total_venda_atendimento := 0.00
      else
        total_venda_atendimento := clAux.result('TOTAL_VENDA');
    end
    else
      total_venda_atendimento := clAux.result('TOTAL_VENDA') - desconto_atendimento; {*}

    {...}
    clAux2 := TClassAuxiliar.Create;
    clAux2.conect   (databaseprodutos,self);
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO VENDAS_ATENDIMENTO (VA_LOJA,VA_CAIX,VA_VEND,VA_VEDE,VA_QTDE,VA_TOTA,VA_COMI)  ');
    clAux2.AddParam ('VALUES (:VA_LOJA,:VA_CAIX,:VA_VEND,:VA_VEDE,:VA_QTDE,:VA_TOTA,:VA_COMI)                   ');
    clAux2.consulta.parambyname('VA_LOJA').AsFloat := frm_principal.x_loja;
    clAux2.consulta.parambyname('VA_CAIX').AsFloat := terminalvenda;
    clAux2.consulta.parambyname('VA_VEND').AsFloat := codigovenda;
    clAux2.consulta.parambyname('VA_VEDE').AsFloat := clAux.result('IV_VEDE');
    clAux2.consulta.parambyname('VA_QTDE').AsFloat := clAux.result('TOTAL_QTDE');
    clAux2.consulta.parambyname('VA_TOTA').AsFloat := (total_venda_atendimento);
    if (not frm_principal.x_descontar_devolucao) and (total_venda_atendimento<0.00) then
      total_venda_atendimento := 0.00;
    clAux2.consulta.parambyname('VA_COMI').AsFloat := (y_percentual_comissionavel)*(total_venda_atendimento);
    clAux2.Execute; {*}
    clAux2.Desconect;
    clAux2.Free;

    {--->}
    clAux.Next;
  end;
  clAux.Desconect;
  clAux.Free;
end;

function Tfrm_FechamentoVenda.ExisteErroNoDocumento(documento: String):Boolean;
var
  v: Real;
begin
  try
    v:=strtofloat(trim(documento)); {*}
    result:=true;
  except
    result:=false;
  end;
end;

procedure Tfrm_FechamentoVenda.GravaFormasDePagamentoVenda;
var
  clAux,clAux2: TClassAuxiliar;
begin
  clAux  := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);

  clAux2 := TClassAuxiliar.Create;
  clAux2.conect  (databaseprodutos,frm_principal);

  {********************************}
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM CARTOES_LOCAL       ');
  clAux.AddParam ('Where (CA_LOJA=:CA_LOJA) AND      ');
  clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND      ');
  clAux.AddParam ('      (CA_VEND=:CA_VEND)          ');
  clAux.consulta.parambyname('CA_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CA_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CA_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO CARTOES(CA_CAIX,CA_LOJA,CA_VEND,CA_ORDE,CA_CADM,CA_NUME)   ');
    clAux2.AddParam ('VALUES (:CA_CAIX,:CA_LOJA,:CA_VEND,:CA_ORDE,:CA_CADM,:CA_NUME)         ');
    clAux2.consulta.parambyname('CA_LOJA').AsFloat := frm_principal.x_loja;
    clAux2.consulta.parambyname('CA_CAIX').AsFloat := frm_principal.x_terminal;
    clAux2.consulta.parambyname('CA_VEND').AsFloat := frm_principal.x_codigo_venda;
    clAux2.consulta.parambyname('CA_CADM').AsFloat := clAux.Result('CA_CADM');
    clAux2.consulta.parambyname('CA_ORDE').AsInteger := clAux.Result('CA_ORDE');
    clAux2.consulta.parambyname('CA_NUME').AsString  := clAux.Result('CA_NUME');
    clAux2.Execute;
    clAux.next;
  end;
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
  clAux.AddParam ('SELECT * FROM CARTOES_PARCELAS_LOCAL        ');
  clAux.AddParam ('Where (PC_LOJA=:PC_LOJA) AND                ');
  clAux.AddParam ('      (PC_CAIX=:PC_CAIX) AND                ');
  clAux.AddParam ('      (PC_VEND=:PC_VEND)                    ');
  clAux.consulta.parambyname('PC_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('PC_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('PC_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO CARTOES_PARCELAS                                                                                                                         ');
    clAux2.AddParam ('(PC_LOJA,PC_CAIX,PC_VEND,PC_ORDE,PC_NPAR,PC_VALO,PC_TOTA,PC_TOTJ,PC_STAT,PC_PERJ,PC_VALJ,PC_VENC,PC_DEBI,PC_DBAI,PC_DIAS,PC_PERC)                    ');
    clAux2.AddParam ('VALUES                                                                                                                                               ');
    clAux2.AddParam ('(:PC_LOJA,:PC_CAIX,:PC_VEND,:PC_ORDE,:PC_NPAR,:PC_VALO,:PC_TOTA,:PC_TOTJ,:PC_STAT,:PC_PERJ,:PC_VALJ,:PC_VENC,:PC_DEBI,:PC_DBAI,:PC_DIAS,:PC_PERC)    ');
    clAux2.consulta.parambyname('PC_LOJA').AsFloat    := frm_principal.x_loja;
    clAux2.consulta.parambyname('PC_CAIX').AsFloat    := frm_principal.x_terminal;
    clAux2.consulta.parambyname('PC_VEND').AsFloat    := frm_principal.x_codigo_venda;
    clAux2.consulta.parambyname('PC_ORDE').AsInteger  := clAux.result('PC_ORDE');
    clAux2.consulta.parambyname('PC_NPAR').AsInteger  := clAux.result('PC_NPAR');
    clAux2.consulta.parambyname('PC_VALO').AsFloat    := clAux.result('PC_VALO');
    clAux2.consulta.parambyname('PC_TOTA').AsFloat    := clAux.result('PC_TOTA');
    clAux2.consulta.parambyname('PC_TOTJ').AsFloat    := clAux.result('PC_TOTJ');
    clAux2.consulta.parambyname('PC_STAT').AsString   := clAux.result('PC_STAT');
    clAux2.consulta.parambyname('PC_PERJ').AsFloat    := clAux.result('PC_PERJ');
    clAux2.consulta.parambyname('PC_VALJ').AsFloat    := clAux.result('PC_VALJ');
    clAux2.consulta.parambyname('PC_VENC').AsDateTime := clAux.result('PC_VENC');
    clAux2.consulta.parambyname('PC_DEBI').AsDateTime := clAux.result('PC_DEBI');
    clAux2.consulta.parambyname('PC_DIAS').AsInteger  := clAux.result('PC_DIAS');
    clAux2.consulta.parambyname('PC_PERC').AsFloat    := clAux.result('PC_PERC');
    clAux2.consulta.parambyname('PC_DBAI').AsDateTime := clAux.result('PC_DBAI');
    clAux2.Execute;
    clAux.next;
  end;
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
  clAux.AddParam ('SELECT * FROM VALES_MERC_LOCAL              ');
  clAux.AddParam ('Where (VM_LOJA=:VM_LOJA) AND                ');
  clAux.AddParam ('      (VM_CAIX=:VM_CAIX) AND                ');
  clAux.AddParam ('      (VM_VEND=:VM_VEND)                    ');
  clAux.consulta.parambyname('VM_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VM_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VM_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO VALES_MERC(VM_CAIX,VM_LOJA,VM_VEND,VM_ORDE,VM_VALO,VM_NUME,VM_CFUN,VM_NPAR)          ');
    clAux2.AddParam ('VALUES (:VM_CAIX,:VM_LOJA,:VM_VEND,:VM_ORDE,:VM_VALO,:VM_NUME,:VM_CFUN,:VM_NPAR)                 ');
    clAux2.consulta.parambyname('VM_LOJA').AsFloat   := frm_principal.x_loja;
    clAux2.consulta.parambyname('VM_CAIX').AsFloat   := frm_principal.x_terminal;
    clAux2.consulta.parambyname('VM_VEND').AsFloat   := frm_principal.x_codigo_venda;
    clAux2.consulta.parambyname('VM_ORDE').AsInteger := clAux.Result('VM_ORDE');
    clAux2.consulta.parambyname('VM_CFUN').AsFloat   := clAux.Result('VM_CFUN');
    clAux2.consulta.parambyname('VM_NUME').AsString  := clAux.Result('VM_NUME');
    clAux2.consulta.parambyname('VM_NPAR').AsInteger := clAux.Result('VM_NPAR');
    clAux2.consulta.parambyname('VM_VALO').AsFloat   := clAux.Result('VM_VALO');
    clAux2.Execute;

    clAux.next; {--->}
  end;
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VALES_MERC_LOCAL                 ');
  clAux.AddParam ('Where (VM_LOJA=:VM_LOJA) AND                 ');
  clAux.AddParam ('      (VM_CAIX=:VM_CAIX) AND                 ');
  clAux.AddParam ('      (VM_VEND=:VM_VEND)                     ');
  clAux.consulta.parambyname('VM_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VM_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VM_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  {********************************}
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM CHEQUES_LOCAL       ');
  clAux.AddParam ('Where (CH_LOJA=:CH_LOJA) AND      ');
  clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND      ');
  clAux.AddParam ('      (CH_VEND=:CH_VEND)          ');
  clAux.consulta.parambyname('CH_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CH_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CH_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO CHEQUES(CH_CAIX,CH_LOJA,CH_VEND,CH_BANC,CH_NBAN,CH_AGEN,CH_CONT,CH_NUME,CH_ORDE,CH_FLAG,CH_CPF,CH_NOME,CH_FONE,CH_VENC,CH_DTPG,CH_STAT,CH_ALIN,CH_VALO,CH_VAPG)         ');
    clAux2.AddParam ('VALUES (:CH_CAIX,:CH_LOJA,:CH_VEND,:CH_BANC,:CH_NBAN,:CH_AGEN,:CH_CONT,:CH_NUME,:CH_ORDE,:CH_FLAG,:CH_CPF,:CH_NOME,:CH_FONE,:CH_VENC,:CH_DTPG,:CH_STAT,:CH_ALIN,:CH_VALO,:CH_VAPG)  ');
    clAux2.consulta.parambyname('CH_LOJA').AsFloat    := frm_principal.x_loja;
    clAux2.consulta.parambyname('CH_CAIX').AsFloat    := frm_principal.x_terminal;
    clAux2.consulta.parambyname('CH_VEND').AsFloat    := frm_principal.x_codigo_venda;
    clAux2.consulta.parambyname('CH_BANC').AsInteger  := clAux.Result('CH_BANC');
    clAux2.consulta.parambyname('CH_NBAN').AsString   := clAux.Result('CH_NBAN');
    clAux2.consulta.parambyname('CH_AGEN').AsString   := clAux.Result('CH_AGEN');
    clAux2.consulta.parambyname('CH_CONT').AsString   := clAux.Result('CH_CONT');
    clAux2.consulta.parambyname('CH_NUME').AsFloat    := clAux.Result('CH_NUME');
    clAux2.consulta.parambyname('CH_ORDE').AsInteger  := clAux.Result('CH_ORDE');
    clAux2.consulta.parambyname('CH_FLAG').AsString   := clAux.Result('CH_FLAG');
    clAux2.consulta.parambyname('CH_CPF').AsString    := clAux.Result('CH_CPF');
    clAux2.consulta.parambyname('CH_NOME').AsString   := clAux.Result('CH_NOME');
    clAux2.consulta.parambyname('CH_FONE').AsString   := clAux.Result('CH_FONE');
    clAux2.consulta.parambyname('CH_VENC').AsDateTime := clAux.Result('CH_VENC');
    clAux2.consulta.parambyname('CH_DTPG').AsDateTime := clAux.Result('CH_DTPG');
    clAux2.consulta.parambyname('CH_ALIN').AsString   := clAux.Result('CH_ALIN');
    clAux2.consulta.parambyname('CH_STAT').AsString   := clAux.Result('CH_STAT');
    clAux2.consulta.parambyname('CH_VALO').AsFloat    := clAux.Result('CH_VALO');
    clAux2.consulta.parambyname('CH_VAPG').AsFloat    := clAux.Result('CH_VAPG');
    clAux2.Execute;
    clAux.next;
  end;
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
  clAux.AddParam ('SELECT * FROM CREDIARIOS_LOCAL        ');
  clAux.AddParam ('Where (CR_LOJA=:CR_LOJA) AND          ');
  clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND          ');
  clAux.AddParam ('      (CR_VEND=:CR_VEND)              ');
  clAux.consulta.parambyname('CR_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('CR_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('CR_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
    if (not frm_principal.multiBoleta) then
    begin
      clAux2.ClearSql;
      clAux2.AddParam ('INSERT INTO CREDIARIOS(CR_CAIX,CR_LOJA,CR_VEND,CR_ORDE,CR_CLIE,CR_CODI,CR_TOTA,CR_VENT,CR_FINA,CR_RECE,CR_CPF,CR_NOME,CR_EORD,CR_PLAN,CR_CONT)   ');
      clAux2.AddParam ('VALUES (:CR_CAIX,:CR_LOJA,:CR_VEND,:CR_ORDE,:CR_CLIE,:CR_CODI,:CR_TOTA,:CR_VENT,:CR_FINA,:CR_RECE,:CR_CPF,:CR_NOME,:CR_EORD,:CR_PLAN,:CR_CONT)    ');
      clAux2.consulta.parambyname('CR_LOJA').AsFloat   := frm_principal.x_loja;
      clAux2.consulta.parambyname('CR_CAIX').AsFloat   := frm_principal.x_terminal;
      clAux2.consulta.parambyname('CR_VEND').AsFloat   := frm_principal.x_codigo_venda;
      clAux2.consulta.parambyname('CR_ORDE').AsInteger := clAux.Result('CR_ORDE');
      clAux2.consulta.parambyname('CR_CLIE').AsFloat   := clAux.Result('CR_CLIE');
      clAux2.consulta.parambyname('CR_CODI').AsFloat   := clAux.Result('CR_CODI');
      clAux2.consulta.parambyname('CR_TOTA').AsFloat   := clAux.Result('CR_TOTA');
      clAux2.consulta.parambyname('CR_VENT').AsFloat   := clAux.Result('CR_VENT');
      clAux2.consulta.parambyname('CR_FINA').AsFloat   := clAux.Result('CR_FINA');
      clAux2.consulta.parambyname('CR_RECE').AsFloat   := clAux.Result('CR_RECE');
      clAux2.consulta.parambyname('CR_CPF').AsString   := clAux.Result('CR_CPF');
      clAux2.consulta.parambyname('CR_NOME').AsString  := clAux.Result('CR_NOME');
      clAux2.consulta.parambyname('CR_EORD').AsInteger := clAux.Result('CR_EORD');
      clAux2.consulta.parambyname('CR_PLAN').AsInteger := clAux.Result('CR_PLAN');
      clAux2.consulta.ParamByName('CR_CONT').AsFloat   := clAux.Result('CR_CODI');
      clAux2.Execute;
      clAux.next;
    end
    else
    begin
      clAux2.ClearSql;
      clAux2.AddParam('UPDATE CREDIARIOS SET CR_CAIX=:CR_CAIX,CR_VEND=:CR_VEND,CR_ORDE=:CR_ORDE,CR_RECE=:CR_RECE,CR_EORD=:CR_EORD   ');
      clAux2.AddParam('WHERE (CR_CLIE='+floattostr(codigoCliente)+') AND (CR_CONT='+floattostr(codigoContrato)+') AND               ');
      clAux2.AddParam('      (CR_CODI='+floattostr(codigoBoleta)+') AND                                                             ');
      clAux2.AddParam('      (CR_LOJA='+floattostr(frm_principal.x_loja)+')                                                         ');
      clAux2.consulta.ParamByName('CR_CAIX').AsFloat   := frm_principal.x_terminal;
      clAux2.consulta.ParamByName('CR_VEND').AsFloat   := frm_principal.x_codigo_venda;
      clAux2.consulta.ParamByName('CR_ORDE').AsInteger := clAux.Result('CR_ORDE');
      clAux2.consulta.ParamByName('CR_RECE').AsFloat   := clAux.Result('CR_RECE');
      clAux2.consulta.ParamByName('CR_EORD').AsInteger := clAux.Result('CR_EORD');
      clAux2.Execute;
      clAux.Next;
    end;
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
  clAux.AddParam ('SELECT * FROM VALES_RECEBIDOS_LOCAL        ');
  clAux.AddParam ('Where (VE_LOJA=:VE_LOJA) AND               ');
  clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND               ');
  clAux.AddParam ('      (VE_VEND=:VE_VEND)                   ');
  clAux.consulta.parambyname('VE_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VE_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VE_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO VALES_RECEBIDOS(VE_CAIX,VE_LOJA,VE_VEND,VE_ORDE,VE_NUME,VE_VALO,VE_TIPO,VE_CNPJ,VE_ECLI,VE_TELE)  ');
    clAux2.AddParam ('VALUES (:VE_CAIX,:VE_LOJA,:VE_VEND,:VE_ORDE,:VE_NUME,:VE_VALO,:VE_TIPO,:VE_CNPJ,:VE_CLIE,:VE_TELE     )       ');
    clAux2.consulta.parambyname('VE_LOJA').AsFloat := frm_principal.x_loja;
    clAux2.consulta.parambyname('VE_CAIX').AsFloat := frm_principal.x_terminal;
    clAux2.consulta.parambyname('VE_VEND').AsFloat := frm_principal.x_codigo_venda;
    clAux2.consulta.parambyname('VE_ORDE').AsInteger := clAux.Result('VE_ORDE');
    clAux2.consulta.parambyname('VE_VALO').AsFloat  := clAux.Result('VE_VALO');
    clAux2.consulta.parambyname('VE_NUME').AsString := clAux.Result('VE_NUME');
    clAux2.consulta.parambyname('VE_TIPO').AsString := clAux.Result('VE_TIPO');
    clAux2.consulta.parambyname('VE_CNPJ').AsString := clAux.Result('VE_CNPJ');
    clAux2.consulta.parambyname('VE_CLIE').AsString := clAux.Result('VE_ECLI');
    clAux2.consulta.parambyname('VE_TELE').AsString := clAux.Result('VE_TELE');
    clAux2.Execute;
    clAux.next;
  end;
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VALES_RECEBIDOS_LOCAL      ');
  clAux.AddParam ('Where (VE_LOJA=:VE_LOJA) AND           ');
  clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND           ');
  clAux.AddParam ('      (VE_VEND=:VE_VEND)               ');
  clAux.consulta.parambyname('VE_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VE_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VE_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM VENDAS_FORMA_PAGAMENTO_LOCAL        ');
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND                      ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                      ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)                          ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VF_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
    clAux2.ClearSql;
    clAux2.AddParam ('INSERT INTO VENDAS_FORMA_PAGAMENTO(VF_CAIX,VF_LOJA,VF_VEND,VF_ORDE,VF_FPGT,VF_VALO,VF_TROC)  ');
    clAux2.AddParam ('VALUES (:VF_CAIX,:VF_LOJA,:VF_VEND,:VF_ORDE,:VF_FPGT,:VF_VALO,:VF_TROC)                      ');
    clAux2.consulta.parambyname('VF_LOJA').AsFloat   := frm_principal.x_loja;
    clAux2.consulta.parambyname('VF_CAIX').AsFloat   := frm_principal.x_terminal;
    clAux2.consulta.parambyname('VF_VEND').AsFloat   := frm_principal.x_codigo_venda;
    clAux2.consulta.parambyname('VF_ORDE').AsInteger := clAux.Result('VF_ORDE');
    clAux2.consulta.parambyname('VF_FPGT').AsFloat   := clAux.Result('VF_FPGT');
    clAux2.consulta.parambyname('VF_VALO').AsFloat   := clAux.Result('VF_VALO');
    clAux2.consulta.parambyname('VF_TROC').AsFloat   := clAux.Result('VF_TROC');
    clAux2.Execute;
    clAux.next;
  end;
     {********************************}
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VENDAS_FORMA_PAGAMENTO_LOCAL          ');
  clAux.AddParam ('Where (VF_LOJA=:VF_LOJA) AND                      ');
  clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                      ');
  clAux.AddParam ('      (VF_VEND=:VF_VEND)                          ');
  clAux.consulta.parambyname('VF_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VF_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VF_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_FechamentoVenda.GravaExcessoTrocasVenda (total: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO VENDAS_EXCESSO (VE_LOJA,VE_CAIX,VE_VEND,VE_VALO)        ');
  clAux.AddParam ('VALUES (:VE_LOJA,:VE_CAIX,:VE_VEND,:VE_VALO)                        ');
  clAux.consulta.parambyname('VE_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VE_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VE_VEND').AsFloat := frm_principal.x_codigo_venda;
  clAux.consulta.parambyname('VE_VALO').AsFloat := total;
  clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_FechamentoVenda.GravaCabecalhoVenda;
var
  clVend,clAux,clCliente: TClassAuxiliar;
  icms: Real;
begin
  //*** Consulta os valores de descontos ou acréscimos exercidos nos itens da venda ****
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;
  clAux.AddParam('SELECT SUM(IV_DESC) as SOMA_DESC,SUM(IV_ACRE) as SOMA_ACRE ');
  clAux.AddParam('FROM ITENS_VENDAS                                          ');
  clAux.AddParam('WHERE (IV_LOJA=:loja) AND (IV_CAIX=:caixa) AND             ');
  clAux.AddParam('      (IV_VEND=:venda) AND (IV_STAT='+QuotedStr('1')+')    ');
  clAux.consulta.ParamByName('loja').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('venda').AsFloat := frm_principal.x_codigo_venda;
  clAux.Execute;
  //************************************************************************************
  clVend := TClassAuxiliar.Create;
  clVend.conect   (databaseprodutos,self);
  clVend.ClearSql;
  clVend.AddParam ('INSERT INTO VENDAS                       ');
  clVend.AddParam (' (VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,       ');
  clVend.AddParam ('  VE_OPER,VE_CLIE,VE_CONT,VE_TOTA,       ');
  clVend.AddParam ('  VE_QTDE,VE_QTD1,VE_QTD2,VE_STAT,       ');
  clVend.AddParam ('  VE_TIPZ,VE_CUPO,VE_VEND,VE_ONLI,       ');
  clVend.AddParam ('  VE_ICMS,VE_ALIQ,VE_ENVI,VE_ECF,        ');
  clVend.AddParam ('  VE_CPF,VE_NOME,VE_FONE,VE_FUNC,        ');
  clVend.AddParam ('  VE_SERI,VE_NOTA,VE_DESC,VE_PDES,       ');
  clVend.AddParam ('  VE_COMI,VE_HORA,VE_ACRE,VE_PACR,       ');
  clVend.AddParam ('  VE_NFEFPGT,VE_NFEINFOADIC)             ');
  clVend.AddParam ('VALUES                                   ');
  clVend.AddParam (' (:VE_CAIX,:VE_LOJA,:VE_CODI,:VE_DATA,   ');
  clVend.AddParam ('  :VE_OPER,:VE_CLIE,:VE_CONT,:VE_TOTA,   ');
  clVend.AddParam ('  :VE_QTDE,:VE_QTD1,:VE_QTD2,:VE_STAT,   ');
  clVend.AddParam ('  :VE_TIPZ,:VE_CUPO,:VE_VEND,:VE_ONLI,   ');
  clVend.AddParam ('  :VE_ICMS,:VE_ALIQ,:VE_ENVI,:VE_ECF,    ');
  clVend.AddParam ('  :VE_CPF,:VE_NOME,:VE_FONE,:VE_FUNC,    ');
  clVend.AddParam ('  :VE_SERI,:VE_NOTA,:VE_DESC,:VE_PDES,   ');
  clVend.AddParam ('  :VE_COMI,:VE_HORA,:VE_ACRE,:VE_PACR,   ');
  clVend.AddParam ('  :VE_NFEFPGT,:VE_NFEINFOADIC)           ');
  clVend.consulta.parambyname('VE_LOJA').AsFloat  := frm_principal.x_loja;
  clVend.consulta.parambyname('VE_CAIX').AsFloat  := frm_principal.x_terminal;
  clVend.consulta.parambyname('VE_CODI').AsFloat  := frm_principal.x_codigo_venda;
  clVend.consulta.parambyname('VE_FUNC').AsFloat  := frm_principal.x_caixa_ativo;
  clVend.consulta.parambyname('VE_CLIE').AsFloat  := y_codigoCliente;
  clVend.consulta.parambyname('VE_CONT').AsFloat  := 0;
  if (lblNDoc2.caption = 'C') then {cupom fiscal}
  begin
    if (trim(edtNDoc.Text) <> '') then
      clVend.consulta.parambyname('VE_CUPO').AsFloat := StrToFloat(Trim(edtNDoc.Text))
    else
      clVend.consulta.parambyname('VE_CUPO').AsFloat := 0;
  end
  else
    clVend.consulta.parambyname('VE_CUPO').AsFloat := 0;
  clVend.consulta.parambyname('VE_NOTA').AsString := Trim(edtNDoc.Text);
  if (frm_LancaVenda.lancamentoNfe) then
    clVend.consulta.parambyname('VE_TIPZ').AsString := '1'
  else
    clVend.consulta.parambyname('VE_TIPZ').AsString := frm_principal.modoFiscal;

  if (Trim(y_cgc) <> '') then
    clVend.consulta.parambyname('VE_CPF').AsString := AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(y_cgc,'-',''),'.',''),' ',''),'/','')
  else
    clVend.consulta.parambyname('VE_CPF').AsString := '';

  if (Trim(y_nome) <> '') then
    clVend.consulta.parambyname('VE_NOME').AsString := Trim(y_nome)
  else
    clVend.consulta.parambyname('VE_NOME').AsString := '';

  clVend.consulta.parambyname('VE_FONE').AsString   := '';
  clVend.consulta.parambyname('VE_SERI').AsString   := '';
  clVend.consulta.parambyname('VE_STAT').AsString   := '1';
  clVend.consulta.parambyname('VE_DATA').AsDateTime := frm_principal.x_data_trabalho;
  clVend.consulta.parambyname('VE_OPER').AsFloat    := frm_principal.x_caixa_ativo;
  frm_principal.x_vendedor := VerificaVendedorDaVenda(frm_principal.x_terminal,frm_principal.x_venda); {*}
  clVend.consulta.parambyname('VE_VEND').AsFloat    := frm_principal.x_vendedor;
  //*** Informações de desconto ou acréscimo *******************************************************************
  if (descontoVenda) or (descontoCupom <> 0) then
  begin
    clVend.consulta.parambyname('VE_DESC').AsFloat := StrToFloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.Text)));
    clVend.consulta.parambyname('VE_PDES').AsFloat := RoundTo(((StrToFloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.Text)))/(y_novo_total_venda + StrToFloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.Text)))))*100),-2);
  end
  else
  begin
    clVend.consulta.parambyname('VE_DESC').AsFloat := 0.00;
    clVend.consulta.parambyname('VE_PDES').AsFloat := 0.00;
  end;
  if (acrescimoVenda) or (acrescimoCupom <> 0) then
  begin
    clVend.consulta.ParamByName('VE_ACRE').AsFloat := StrToFloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.text)));
    clVend.consulta.ParamByName('VE_PACR').AsFloat := RoundTo(((StrToFloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.Text)))/(y_novo_total_venda - StrToFloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.Text)))))*100),-2);
  end
  else
  begin
    clVend.consulta.parambyname('VE_ACRE').AsFloat := 0.00;
    clVend.consulta.parambyname('VE_PACR').AsFloat := 0.00;
  end;
  //INFORMACOES DA NFE
          if (y_codigoCliente <> 0) and
             (frm_principal.x_habilita_integracao_nfe) and
             ((frm_principal.x_gera_registro_nfe_todas_vendas) or (frm_LancaVenda.lancamentoNfe))then
            begin
                clVend.consulta.parambyname('VE_NFEFPGT').AsFloat      := y_form_pg;
                clVend.consulta.parambyname('VE_NFEINFOADIC').AsString := y_info_adic;
            end
          else
            begin
                clVend.consulta.parambyname('VE_NFEFPGT').AsFloat      := 0;
                clVend.consulta.parambyname('VE_NFEINFOADIC').AsString := '';
            end;

  //************************************************************************************************************
  clVend.consulta.parambyname('VE_TOTA').AsFloat  := y_novo_total_venda;
  clVend.consulta.parambyname('VE_COMI').AsFloat  := CalculaValorComissionavel; {*}
  clVend.consulta.ParamByName('VE_HORA').AsString := FormatDateTime('hh:nn',time);
  clVend.consulta.parambyname('VE_QTD1').AsFloat  := total_qtde1;
  clVend.consulta.parambyname('VE_QTD2').AsFloat  := total_qtde2;
  clVend.consulta.parambyname('VE_QTDE').AsFloat  := (total_qtde1 - total_qtde2);
  icms := InformaAliqICMS(frm_principal.x_estado);
  clVend.consulta.parambyname('VE_ICMS').AsFloat  := clVend.consulta.parambyname('VE_TOTA').AsFloat*(icms/100);
  clVend.consulta.parambyname('VE_ALIQ').AsFloat  := icms;
  if (frm_principal.x_online) then
  begin
    clVend.consulta.parambyname('VE_ONLI').AsString := '1';
    clVend.consulta.parambyname('VE_ENVI').AsString := '1';
  end
  else
  begin
    clVend.consulta.parambyname('VE_ONLI').AsString := '0';
    clVend.consulta.parambyname('VE_ENVI').AsString := '0'; //passa para '1' quando for exportado
  end;
  if (not frm_principal.vendaManual) then
    clVend.consulta.parambyname('VE_ECF').AsInteger := trunc(frm_principal.x_ecf)
  else
    clVend.consulta.parambyname('VE_ECF').AsInteger := 0;

  //*** Gravando o cliente no banco do crediário caso ele não esteja cadastrado ***
  if (not y_clienteCadastrado) and (y_codigoCliente <> 0) and
     (Trim(y_cgc) <> '') and (Trim(y_nome) <> '') then
  begin
    clCliente := TClassAuxiliar.Create;
    clCliente.Conect('CREDITO',self);
    clCliente.ClearSql;

    clCliente.AddParam('INSERT INTO CRECLI (CL_CODI,CL_NOME,CL_CPF,CL_IDEN, CL_ENDE,CL_BAIR,CL_CIDA,       ');
    clCliente.AddParam('                    CL_ESTA,CL_CEP,CL_LOJA,CL_QTDC,CL_ULTC,CL_DTCA,       ');
    clCliente.AddParam('                    CL_TIPO_LOGRADOURO,CL_NUMERO,CL_COMPLEMENTO,          ');
    clCliente.AddParam('                    CL_IBGE_CIDADE,CL_IBGE_UF,CL_CODIGO_PAIS,CL_PAIS,CL_EMAI)');
    clCliente.AddParam('            VALUES (:CL_CODI,:CL_NOME,:CL_CPF,:CL_IDEN,:CL_ENDE,:CL_BAIR,:CL_CIDA, ');
    clCliente.AddParam('                    :CL_ESTA,:CL_CEP,:CL_LOJA,:CL_QTDC,:CL_ULTC,:CL_DTCA, ');
    clCliente.AddParam('                    :CL_TIPO_LOGRADOURO,:CL_NUMERO,:CL_COMPLEMENTO,       ');
    clCliente.AddParam('                    :CL_IBGE_CIDADE,:CL_IBGE_UF,:CL_CODIGO_PAIS,:CL_PAIS,:CL_EMAI) ');
    clCliente.consulta.ParamByName('CL_CODI').AsFloat             := y_codigoCliente;
    clCliente.consulta.ParamByName('CL_NOME').AsString            := Trim(form_t(y_nome,40));
    clCliente.consulta.ParamByName('CL_CPF').AsString             := Trim(form_t(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(y_cgc,'-',''),'.',''),' ',''),'/',''),14));
    clCliente.consulta.ParamByName('CL_IDEN').AsString             := Trim(form_t(AnsiReplaceStr(AnsiReplaceStr(y_insc,'.',''),'.',''),14)); // frmUIdentificaCliente
    clCliente.consulta.ParamByName('CL_ENDE').AsString            := Trim(form_t(y_endereco,50));
    clCliente.consulta.ParamByName('CL_BAIR').AsString            := Trim(form_t(y_bairro,30));
    clCliente.consulta.ParamByName('CL_CIDA').AsString            := Trim(form_t(y_cidade,80));
    clCliente.consulta.ParamByName('CL_ESTA').AsString            := Trim(form_t(y_uf,2));
    clCliente.consulta.ParamByName('CL_CEP').AsString             := Trim(form_t(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(y_cep,'-',''),'.',''),' ',''),8));
    clCliente.consulta.ParamByName('CL_LOJA').AsFloat             := frm_principal.x_loja;
    clCliente.consulta.ParamByName('CL_QTDC').AsFloat             := 1;
    clCliente.consulta.ParamByName('CL_ULTC').AsDateTime          := frm_principal.x_data_trabalho;
    clCliente.consulta.ParamByName('CL_DTCA').AsDateTime          := frm_principal.x_data_trabalho;
    clCliente.consulta.ParamByName('CL_TIPO_LOGRADOURO').AsString := Trim(y_tipo_logradouro);
    clCliente.consulta.ParamByName('CL_NUMERO').AsInteger         := y_numero;
    clCliente.consulta.ParamByName('CL_COMPLEMENTO').AsString     := Trim(y_complemento);
    clCliente.consulta.ParamByName('CL_IBGE_CIDADE').AsInteger    := y_cod_cidadeIBGE;
    clCliente.consulta.ParamByName('CL_IBGE_UF').AsInteger        := y_cod_ufIBGE;
    clCliente.consulta.ParamByName('CL_CODIGO_PAIS').AsString     := Trim(y_cod_pais);
    clCliente.consulta.ParamByName('CL_PAIS').AsString            := Trim(y_pais);
    clCliente.consulta.ParamByName('CL_EMAI').AsString           := Trim(y_email);
    try
      clCliente.consulta.ExecSQL;
      if (not frm_principal.x_online) then
      begin
        clCliente.ClearSql;
        clCliente.AddParam('UPDATE GEN_CRECLI SET CODIGO=CODIGO+1 ');
        clCliente.Execute;
      end;
    except
      Application.MessageBox('Erro ao gravar o cliente no banco de dados! Entre em contato com o suporte técnico!', 'Atenção',
                             MB_IconInformation + MB_OK);
    end;
    clCliente.Desconect;
    clCliente.Free;
  end
  //*** Atualizando quantidade de compras do cliente ***
  else if (y_clienteCadastrado) and (y_somaQtdeCompras) and (y_codigoCliente <> 0) then
  begin
    clCliente := TClassAuxiliar.Create;
    clCliente.Conect('CREDITO',self);
    clCliente.ClearSql;
    clCliente.AddParam('UPDATE CRECLI SET CL_QTDC=CL_QTDC+1  ');
    clCliente.AddParam('WHERE (CL_CODI=:codigo)              ');
    clCliente.consulta.ParamByName('codigo').AsFloat := y_codigoCliente;
    try
      clCliente.consulta.ExecSQL;
    except
      Application.MessageBox('Erro ao atualizar informações do cliente no banco de dados! #13'+
                             'Entre em contato com o suporte técnico!', 'Atenção',
                             MB_IconInformation + MB_OK);
    end;

    clCliente.ClearSql;
    clCliente.AddParam('SELECT CL_ENDE FROM CRECLI ');
    clCliente.AddParam('WHERE (CL_CODI=:codigo)    ');
    clCliente.consulta.ParamByName('codigo').AsFloat := y_codigoCliente;
    clCliente.consulta.Open;
    if (not clCliente.consulta.IsEmpty) then
    begin
      if (Trim(clCliente.Result('CL_ENDE')) <> Trim(y_endereco)) then
      begin
        clCliente.consulta.Close;
        clCliente.ClearSql;
        clCliente.AddParam('UPDATE CRECLI SET CL_ENDE=:endereco,                   ');
        clCliente.AddParam('                  CL_TIPO_LOGRADOURO=:tipo_logradouro, ');
        clCliente.AddParam('                  CL_NUMERO=:numero,                   ');
        clCliente.AddParam('                  CL_COMPLEMENTO=:complemento,         ');
        clCliente.AddParam('                  CL_IBGE_CIDADE=:ibge_cidade,         ');
        clCliente.AddParam('                  CL_IBGE_UF=:ibge_uf,                 ');
        clCliente.AddParam('                  CL_CODIGO_PAIS=:codigo_pais,         ');
        clCliente.AddParam('                  CL_PAIS=:pais,                       ');
        clCliente.AddParam('                  CL_EMAI=:emai                        ');
        clCliente.AddParam('WHERE (CL_CODI=:codigo)                                ');
        clCliente.consulta.ParamByName('codigo').AsFloat           := y_codigoCliente;
        clCliente.consulta.ParamByName('endereco').AsString        := Trim(form_t(y_endereco,50));
        clCliente.consulta.ParamByName('tipo_logradouro').AsString := Trim(y_tipo_logradouro);
        clCliente.consulta.ParamByName('numero').AsInteger         := y_numero;
        clCliente.consulta.ParamByName('complemento').AsString     := Trim(y_complemento);
        clCliente.consulta.ParamByName('ibge_cidade').AsInteger    := y_cod_cidadeIBGE;
        clCliente.consulta.ParamByName('ibge_uf').AsInteger        := y_cod_ufIBGE;
        clCliente.consulta.ParamByName('codigo_pais').AsString     := Trim(y_cod_pais);
        clCliente.consulta.ParamByName('pais').AsString            := Trim(y_pais);
        clCliente.consulta.ParamByName('emai').AsString            := trim(y_email);
        try
          clCliente.consulta.ExecSQL;
        except
          Application.MessageBox('Erro ao atualizar informações do endereço do cliente no banco de dados! #13'+
                                 'Entre em contato com o suporte técnico!', 'Atenção',
                                 MB_IconInformation + MB_OK);
        end;
      end;
    end;
    clCliente.Desconect;
    clCliente.Free;
  end;
  //*******************************************************************************
      {
     //rotina de erros
     CONT_CONTROL:= CONT_CONTROL + 1;
     ROTINA_PROC:= 'PROCEDURE GravaCabecalhoVenda --> query clVend - banco de dados--> '+databaseprodutos+ ' - SALVAR TABELA VENDAS';
     achar_bugs;
     }

  clVend.Execute;

  clVend.Desconect;
  clVend.Free;
  clAux.Desconect;
  clAux.Free;

end;

procedure Tfrm_FechamentoVenda.GravaItemVenda (clItVend: TClassAuxiliar);
var
  clProd,clEstoque: TClassAuxiliar;
  codigo_fornecedor: Real;
  data_ultima_venda: TDateTime;
  preco_custo_item: Real;
  preco_custo_medio_item: Real;
  preco_aquisicao_item: Real;
  preco_custo: Real;
begin
     {********************************************************************************}
  clEstoque := TClassAuxiliar.Create;
  clEstoque.Conect(DataBaseProdutos,self);
  clEstoque.ClearSql;
  clEstoque.AddParam ('SELECT ES_PCU1,ES_PCU2,       ');
  clEstoque.AddParam ('       ES_UPA1,ES_UPA2,       ');
  clEstoque.AddParam ('       ES_UPC1,ES_UPC2        ');
  clEstoque.AddParam ('FROM   ESTOQUE                ');
  clEstoque.AddParam ('WHERE (ES_GRUP=:grupo) AND    ');
  clEstoque.AddParam ('      (ES_SUBG=:subgrupo) AND ');
  clEstoque.AddParam ('      (ES_PROD=:produto) AND  ');
  clEstoque.AddParam ('      (ES_CORE=:cor) AND      ');
  clEstoque.AddParam ('      (ES_TAMA=:tamanho)      ');
  clEstoque.consulta.parambyname('grupo').AsFloat    := clItVend.Result('IV_GRUP');
  clEstoque.consulta.parambyname('subgrupo').AsFloat := clItVend.Result('IV_SUBG');
  clEstoque.consulta.parambyname('produto').AsFloat  := clItVend.Result('IV_PROD');
  clEstoque.consulta.parambyname('cor').AsFloat      := clItVend.Result('IV_CORE');
  clEstoque.consulta.parambyname('tamanho').AsString := clItVend.Result('IV_TAMA');
  if (clEstoque.Execute) then
  begin
    if (clItVend.Result('IV_TIPZ') = '2') then
    begin
      if (clEstoque.Result('ES_UPC2') = 0) then
        preco_custo_item := clEstoque.Result('ES_UPC1')
      else
        preco_custo_item := clEstoque.Result('ES_UPC2');

      if (clEstoque.Result('ES_PCU2') = 0) then
        preco_custo_medio_item := clEstoque.Result('ES_PCU1')
      else
        preco_custo_medio_item := clEstoque.Result('ES_PCU2');

      if (clEstoque.Result('ES_UPA2') = 0) then
        preco_aquisicao_item := clEstoque.Result('ES_UPA1')
      else
        preco_aquisicao_item := clEstoque.Result('ES_UPA2');
    end
    else if (clItVend.Result('IV_TIPZ') = '1') then
    begin
      preco_custo_item       := clEstoque.Result('ES_UPC1');
      preco_custo_medio_item := clEstoque.Result('ES_PCU1');
      preco_aquisicao_item   := clEstoque.Result('ES_UPA1');
    end;
  end
  else
  begin
    preco_custo_item       := 0.00;
    preco_custo_medio_item := 0.00;
    preco_aquisicao_item   := 0.00;
  end;
  clEstoque.desconect;
  clEstoque.Free;

  {********************************************************************************}
  {0o PASSO - Insercao real do registro de venda}
  {********************************************************************************}
  with (DMCaixa.qInsereItemVenda_real) do
  begin
    parambyname('IV_SEQ').AsInteger   := clItVend.Result('IV_SEQ');
    parambyname('IV_LOJA').AsFloat    := clItVend.Result('IV_LOJA');
    parambyname('IV_CAIX').AsFloat    := clItVend.Result('IV_CAIX');
    parambyname('IV_VEND').AsFloat    := frm_principal.x_codigo_venda;
    parambyname('IV_TIPZ').AsString   := clItVend.Result('IV_TIPZ');
    parambyname('IV_GRUP').AsFloat    := clItVend.Result('IV_GRUP');
    parambyname('IV_SUBG').AsFloat    := clItVend.Result('IV_SUBG');
    parambyname('IV_PROD').AsFloat    := clItVend.Result('IV_PROD');
    parambyname('IV_TAMA').AsString   := clItVend.Result('IV_TAMA');
    parambyname('IV_OTAM').AsInteger  := clItVend.Result('IV_OTAM');
    parambyname('IV_CORE').AsFloat    := clItVend.Result('IV_CORE');
    parambyname('IV_QTDE').AsFloat    := clItVend.Result('IV_QTDE');
    if (clItVend.Result('IV_MODO')=0) then //VENDA
      parambyname('IV_QTDR').AsFloat := clItVend.Result('IV_QTDE')
    else
    if (clItVend.Result('IV_MODO')=1) or (clItVend.Result('IV_MODO')=2) then //TROCA / DEVOLUCAO
      parambyname('IV_QTDR').AsFloat := (-1)*clItVend.Result('IV_QTDE');
    parambyname('IV_PVEN').AsFloat    := clItVend.Result('IV_PVEN');
    parambyname('IV_TOTA').AsFloat    := clItVend.Result('IV_TOTA');
    parambyname('IV_MODO').AsInteger  := clItVend.Result('IV_MODO');
    parambyname('IV_VEDE').AsFloat    := clItVend.Result('IV_VEDE');
    parambyname('IV_DATA').AsDateTime := clItVend.Result('IV_DATA');
    parambyname('IV_UPCU').AsFloat    := preco_custo_item;
    parambyname('IV_PAQU').AsFloat    := preco_aquisicao_item;
    parambyname('IV_PCUS').AsFloat    := preco_custo_medio_item;
    parambyname('IV_HORA').AsDateTime := Now;
    parambyname('IV_DESC').AsFloat    := clItVend.Result('IV_DESC');
    parambyname('IV_PDES').AsFloat    := clItVend.Result('IV_PDES');
    parambyname('IV_ACRE').AsFloat    := clItVend.Result('IV_ACRE');
    parambyname('IV_PACR').AsFloat    := clItVend.Result('IV_PACR');
    parambyname('IV_STAT').AsString   := clItVend.Result('IV_STAT');
    ExecSql; {*}

  end;

  {********************************************************************************}
  {1o PASSO - Geracao de registro de movimento de SAIDA // somente se estiver ON-LINE}
  {********************************************************************************}
  if (y_tipz='3') then
    y_tipz:='1';
  if (frm_principal.x_online) then
  begin
    //Pesquisando DADOS SOBRE O ITEM DE PRODUTO em questao
    {***********************************************************}
    clProd := TClassAuxiliar.Create;
    clProd.conect   ('ESTOQUE',self);
    clProd.ClearSql;
    clProd.AddParam ('SELECT PR_FORN,ES_UPC1,ES_UPC2,                                              ');
    clProd.AddParam ('       ES_PCU'+y_tipz+',                                                     ');
    clProd.AddParam ('       EL_ULC'+y_tipz+'                                                      ');
    clProd.AddParam ('FROM   PRODUTOS,ESTOQUE,ESTOQUE_LOJA                                         ');
    clProd.AddParam ('WHERE (PR_GRUP=:grupo) AND                                                   ');
    clProd.AddParam ('      (PR_SUBG=:subgrupo) AND                                                ');
    clProd.AddParam ('      (PR_CODI=:produto) AND                                                 ');
    clProd.AddParam ('      (ES_CORE=:cor) AND                                                     ');
    clProd.AddParam ('      (ES_TAMA=:tamanho) AND                                                 ');
    clProd.AddParam ('      (PR_GRUP=ES_GRUP) AND (PR_SUBG=ES_SUBG) AND (PR_CODI=ES_PROD) AND      '); //juncao 1
    clProd.AddParam ('      (ES_GRUP=EL_GRUP) AND (ES_SUBG=EL_SUBG) AND (ES_PROD=EL_PROD) AND      '); //juncao 2
    clProd.AddParam ('      (ES_CORE=EL_CORE) AND (ES_TAMA=EL_TAMA) AND                            '); //juncao 2
    clProd.AddParam ('      (EL_LOJA=:loja)                                                        ');
    clProd.consulta.parambyname('grupo').AsFloat     := clItVend.Result('IV_GRUP');
    clProd.consulta.parambyname('subgrupo').AsFloat  := clItVend.Result('IV_SUBG');
    clProd.consulta.parambyname('produto').AsFloat   := clItVend.Result('IV_PROD');
    clProd.consulta.parambyname('cor').AsFloat       := clItVend.Result('IV_CORE');
    clProd.consulta.parambyname('tamanho').AsString  := clItVend.Result('IV_TAMA');
    clProd.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
    if (clProd.Execute) then
    begin
      codigo_fornecedor := clProd.Result('PR_FORN');
      if (y_tipz='2') and (clProd.Result('ES_UPC2')=0) then
        preco_custo       := clProd.Result('ES_UPC1')
      else
        preco_custo       := clProd.Result('ES_UPC'+y_tipz);
      data_ultima_venda := clProd.Result('EL_ULC'+y_tipz);
    end
    else
    begin
      codigo_fornecedor := -1; //para identificar registro nao encontrado mas lancado
      preco_custo       := 0.00;
      data_ultima_venda := strtodate('01/01/1900');
    end;
    clProd.desconect;
    clProd.Free;

    {...}
    if (clItVend.Result('IV_STAT') = '1') then
    begin
      DMCaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
      DMCaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := clItVend.Result('IV_GRUP');
      DMCaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := clItVend.Result('IV_SUBG');
      DMCaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := clItVend.Result('IV_PROD');
      DMCaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := y_loja;
      DMCaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := clItVend.Result('IV_CORE');
      DMCaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := clItVend.Result('IV_TAMA');
      DMCaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := clItVend.Result('IV_OTAM');
      DMCaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
      DMCaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '0';
      DMCaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
      DMCaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := clItVend.Result('IV_PVEN');
      DMCaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := preco_custo; {*}
      DMCaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := clItVend.Result('IV_QTDE');
      if (y_cliente<>'') then
        DMCaixa.qInsereMovimento.parambyname('MO_CLIE').AsString    := y_cliente
      else
      if (y_nome<>'') then
        DMCaixa.qInsereMovimento.parambyname('MO_CLIE').AsString    := y_nome
      else
        DMCaixa.qInsereMovimento.parambyname('MO_CLIE').AsString := '';

      if (clItVend.Result('IV_MODO')=0) then {VENDA}
      begin
        DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString := 'S';
        DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString := 'N';
        DMCaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat  := (-1)*clItVend.Result('IV_QTDE');
      end
      else
      if (clItVend.Result('IV_MODO')=1) then {DEVOLUCAO}
      begin
        DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString := 'E';
        DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString := 'V';
        DMCaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat  := clItVend.Result('IV_QTDE');
      end
      else
      if (clItVend.Result('IV_MODO')=2) then {TROCA}
      begin
        DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString := 'E';
        DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString := 'R';
        DMCaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat  := clItVend.Result('IV_QTDE');
      end;
      DMCaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat  := codigo_fornecedor;
      DMCaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString := y_tipz;
      DMCaixa.qInsereMovimento.parambyname('MO_NOTA').AsString := trim(edtNDoc.text);
      DMCaixa.qInsereMovimento.ExecSql;
    end;
  end;
  {***********************************************************}
  if (clItVend.Result('IV_MODO') = 0)  and (clItVend.Result('IV_STAT') = '1') then {VENDA} {-}
    SaidaItemEstoque   (y_loja,
      y_tipz,
      clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      clItVend.Result('IV_CORE'),
      clItVend.Result('IV_TAMA'),
      clItVend.Result('IV_QTDE'))
  else
  if ((clItVend.Result('IV_MODO') = 1) or {DEVOLUCAO}
     (clItVend.Result('IV_MODO') = 2)) and (clItVend.Result('IV_STAT') = '1') then {TROCA} {+}
    EntradaItemEstoque (y_loja,
      y_tipz,
      clItVend.Result('IV_GRUP'),
      clItVend.Result('IV_SUBG'),
      clItVend.Result('IV_PROD'),
      clItVend.Result('IV_CORE'),
      clItVend.Result('IV_TAMA'),
      clItVend.Result('IV_QTDE'));

  //so para 'VENDA'
  {***********************************************************}
  if (clItVend.Result('IV_MODO') = 0) and (clItVend.Result('IV_STAT') = '1') then {VENDA} {-}
    if (frm_principal.x_data_trabalho>data_ultima_venda) then
    begin
      AtualizaUltimaVenda_Estoque(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'),
        frm_principal.x_data_trabalho,
        y_tipz);

      AtualizaUltimaVenda_Estoque_Loja(clItVend.Result('IV_GRUP'),
        clItVend.Result('IV_SUBG'),
        clItVend.Result('IV_PROD'),
        clItVend.Result('IV_CORE'),
        clItVend.Result('IV_TAMA'),
        y_loja,
        frm_principal.x_data_trabalho,
        y_tipz);
    end;

  {prox. item -->}
  if (clItVend.Result('IV_MODO')=0) then {+ VENDA}
    total_qtde1 := total_qtde1 + clItVend.Result('IV_QTDE')
  else
  if (clItVend.Result('IV_MODO')=1) or (clItVend.Result('IV_MODO')=2) then {- DEVOLUCAO/TROCA}
    total_qtde2 := total_qtde2 + clItVend.Result('IV_QTDE');
  total_venda_por_itens := total_venda_por_itens + clItVend.Result('IV_TOTA'); //com sinal
end;

procedure Tfrm_FechamentoVenda.AvancaSequencialDeVenda;
var
  clSeq: TClassAuxiliar;
begin
  clSeq := TClassAuxiliar.Create;
  clSeq.conect   ('C:\NATIVA',self);
  clSeq.ClearSql;
  clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET ULTIMA_VENDA=:ultima_venda ');
  clSeq.consulta.parambyname('ultima_venda').AsFloat := frm_principal.x_codigo_venda;
  clSeq.Execute;
  clSeq.desconect;
  clSeq.Free;
  if (trim(edtNDoc.text)<>'') then
    if (lblNDoc2.caption='N') then
    begin
      frm_principal.x_nota_fiscal := strtofloat(trim(edtNDoc.text)); //pegando o que foi digitado
      frm_principal.x_nota_fiscal := frm_principal.x_nota_fiscal + 1;
              {*************************************************************}
      clSeq := TClassAuxiliar.Create;
      clSeq.conect   ('C:\NATIVA',self);
      clSeq.ClearSql;
      clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET NOTA_FISCAL=:nota_fiscal ');
      clSeq.consulta.parambyname('nota_fiscal').AsFloat := frm_principal.x_nota_fiscal;
      clSeq.Execute;
      clSeq.desconect;
      clSeq.Free;
              {*************************************************************}
    end
    else
    if (lblNDoc2.caption='C') then
    begin
      if (not frm_principal.x_ecf_busca_proximo_COO) then
      begin
        frm_principal.x_cupom_fiscal := strtofloat(trim(edtNDoc.text)); //pegando o que foi digitado
        frm_principal.x_cupom_fiscal := frm_principal.x_cupom_fiscal + 1;
                  {*************************************************************}
        clSeq := TClassAuxiliar.Create;
        clSeq.conect   ('C:\NATIVA',self);
        clSeq.ClearSql;
        clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET CUPOM_FISCAL=:cupom_fiscal ');
        clSeq.consulta.parambyname('cupom_fiscal').AsFloat := frm_principal.x_cupom_fiscal;
        clSeq.Execute;
        clSeq.desconect;
        clSeq.Free;
                  {*************************************************************}
      end;
    end
    else
    if (lblNDoc2.caption='R') then
    begin
      frm_principal.x_romaneio := strtofloat(trim(edtNDoc.text)); //pegando o que foi digitado
      frm_principal.x_romaneio := frm_principal.x_romaneio + 1;
              {*************************************************************}
      clSeq := TClassAuxiliar.Create;
      clSeq.conect   ('C:\NATIVA',self);
      clSeq.ClearSql;
      clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET ROMANEIO=:romaneio ');
      clSeq.consulta.parambyname('romaneio').AsFloat := frm_principal.x_romaneio;
      clSeq.Execute;
      clSeq.desconect;
      clSeq.Free;
              {*************************************************************}
    end;
end;

procedure Tfrm_FechamentoVenda.ApagaRegistros_VENDA_E_ITEM_VENDA_LOCAL;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);

  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM ITENS_VENDAS_LOCAL    ');
  clAux.AddParam ('Where (IV_LOJA=:IV_LOJA) AND      ');
  clAux.AddParam ('      (IV_CAIX=:IV_CAIX) AND      ');
  clAux.AddParam ('      (IV_VEND=:IV_VEND)          ');
  clAux.consulta.parambyname('IV_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('IV_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('IV_VEND').AsFloat := frm_principal.x_venda;
  clAux.Execute; {*}

  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM VENDAS_LOCAL          ');
  clAux.AddParam ('Where (VE_LOJA=:VE_LOJA) AND      ');
  clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND      ');
  clAux.AddParam ('      (VE_CODI=:VE_CODI)          ');
  clAux.consulta.parambyname('VE_LOJA').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('VE_CAIX').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('VE_CODI').AsFloat := frm_principal.x_venda;
  clAux.Execute; {*}

  clAux.desconect;
  clAux.Free;
end;

function Tfrm_FechamentoVenda.abrirgavetafp:Boolean;
var
  claux:TClassAuxiliar;
begin
  if frm_principal.x_tempo_gaveta_venda <> 1 then
    exit;

  clAux := TClassAuxiliar.Create;
  try
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT *   ');
    clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL,FORMAS_PAGAMENTO ');
    clAux.AddParam ('WHERE (VF_FPGT = FO_CODI) AND        ');
    claux.addparam ('      (VF_LOJA=:VF_LOJA)  AND         ');
    clAux.AddParam ('      (VF_CAIX=:VF_CAIX)  AND         ');
    clAux.AddParam ('      (VF_VEND=:VF_VEND)  and         ');
    clAux.AddParam ('      (FO_GAVETA = ''T'') ');
    clAux.consulta.parambyname('VF_LOJA').AsFloat   := y_loja;
    clAux.consulta.parambyname('VF_CAIX').AsFloat   := y_caixa;
    clAux.consulta.parambyname('VF_VEND').AsFloat   := y_venda;
    Claux.consulta.open;
    result := not Claux.consulta.eof;

    if result then
      try
        frm_principal.barraDicas.caption := 'Abrindo Gaveta';
        frm_principal.refresh;
        if not abregaveta then
        begin
          frm_principal.BarraDicas.caption := 'Gaveta não pode ser aberta';
          frm_principal.refresh;
          Sleep(2000);
          frm_principal.BarraDicas.caption := '';
        end;
      except
        frm_principal.BarraDicas.caption := 'Erro ao Abrir Gaveta';
        frm_principal.refresh;
        Sleep(2000);
        frm_principal.BarraDicas.caption := '';
      end;
  finally
    frm_principal.BarraDicas.caption := '';
    claux.Desconect;
    claux.Destroy;
  end;
end;

procedure Tfrm_FechamentoVenda.FormDestroy(Sender: TObject);
begin
  Frm_fechamentoVenda := nil;
end;

procedure Tfrm_FechamentoVenda.GERA_NFCE;
begin
  NFCE_CODVD := FloatToStr(frm_principal.x_codigo_venda);

end;

function Tfrm_FechamentoVenda.BuscaNCM(grupo, subgrupo,
  produto: Real) : String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;
  clAux.AddParam('SELECT PR_NCM                       ');
  clAux.AddParam('FROM PRODUTOS                                ');
  clAux.AddParam('WHERE (PR_GRUP='+floattostr(grupo)+') AND    ');
  clAux.AddParam('      (PR_SUBG='+floattostr(subgrupo)+') AND ');
  clAux.AddParam('      (PR_CODI='+floattostr(produto)+')      ');
  if (clAux.Execute) then
      Result := clAux.Result('PR_NCM')
  else
      Result :='';

  clAux.Desconect;
  clAux.Free;
end;

procedure Tfrm_FechamentoVenda.GERA_CAB_NFCE;
var
  clConf : TClassAuxiliar;
  TP_CLIENTE : String;

begin
  TP_CLIENTE := 'PJ';
  
//  AMB_TP := Frm_Principal.AMB_TP;

  {**********************************************************************************}
  clConf := TClassAuxiliar.Create;
  clConf.conect   ('VENDAS',self);
  clConf.ClearSql;
  clConf.AddParam ('SELECT * FROM CONF');
{
  clConf.conect   ('CREDITO',self);
  clConf.ClearSql;
  clConf.AddParam ('SELECT * FROM CRELOJA');
}
  clConf.Execute;
  clConf.First;

  NDOC := trim(Frm_FechamentoVenda.edtNDoc.Text);

  NFCE_CODVD := FloatToStr(frm_principal.x_codigo_venda);

  sArquivoEntNfe := ExtractFilePath(Application.ExeName)+'TXT\ENTNFE'+NDOC+'.TXT';
  sArquivoEntNfe2 := ExtractFilePath(Application.ExeName)+Tipo_Nota+'\ENTNFE'+NDOC+'.TXT';

  sArquivoSaiNfe := ExtractFilePath(Application.ExeName)+'TXT\SAINFE'+NDOC+'.TXT';
  lArq := TStringList.Create;
  lArq.Add('NaturezaOperacao='+copy(Frm_InfoAdicionais.lblDescCfop.Caption,1,60));
  lArq.Add('Modelo='+frm_principal.x_modelo_NF);
  lArq.Add('Serie=1');
  lArq.Add('Codigo='+Trim(NFCE_CODVD));
  lArq.Add('Numero='+Frm_FechamentoVenda.edtNDoc.Text);
  lArq.Add('Emissao='+FormatDateTime('dd/mm/yyyy', Date) + ' ' +  formatdatetime ('hh:mm:ss',now));
  lArq.Add('Saida='+FormatDateTime('dd/mm/yyyy', Date));

  // Tipo=0=Entrada - 1 Saida
//** VERIFICAR

  if Frm_Principal.Tipo_Nota = 'NFCE' then  // Não Há NFCE de Devolução
     lArq.Add('Tipo=1')
  else
     If Frm_InfoAdicionais.rdgTpNota.ItemIndex = 0 then
        lArq.Add('Tipo=0')
     ELse
        lArq.Add('Tipo=1');

  if frm_principal.x_internet_ok then
     lArq.Add('tpEmis=1')  // 1 - Normal  9-Contingencia
  else
    Begin
      lArq.Add('tpEmis=9');  // 1 - Normal  9-Contingencia
      lArq.Add('xJust=Houve falha na Internet, durante o processo de envio');  // 1 - Normal  9-Contingencia
    End;
  if Tipo_Nota = 'NFE' then
     lArq.Add('tpImp=1')
  else
     lArq.Add('tpImp=4');
  lArq.Add('IndFinal=1');
  lArq.Add('indPres=1');
  if Frm_Principal.AMB_TP = 1 then
     lArq.Add('tpAmb=1')  // TpAmbiente=1 - Produção, 2 - Homologação
  else
     Begin
       lArq.Add('tpAmb=2');  // TpAmbiente=1 - Produção, 2 - Homologação
            if frm_principal.MISTRAL_MSG = 1 then
               ShowMessage('Ambiente Teste !!!');
     end;
  lArq.Add('FormaPag=0');

  // Finalidade da Nota = Se 1=Normal, 2=Complementar, 3=Ajuste, 4=Devolução
  // NFCE=1 (Para NFCE será sempre valor = 1
  lArq.Add('Finalidade=1');

  lArq.Add('[Emitente]');
  lArq.Add('CNPJ='+clConf.Result('CNPJ'));
  lArq.Add('IE='+clConf.Result('INSC'));
  lArq.Add('Razao='+clConf.Result('EMPRESA'));
  lArq.Add('Fantasia='+clConf.Result('EMPRESA'));
  lArq.Add('Fone='+clConf.Result('TELEFONE'));
  lArq.Add('CEP='+clConf.Result('CEP'));
  lArq.Add('Logradouro='+clConf.Result('ENDERECO'));
  lArq.Add('Numero=');
  lArq.Add('Complemento=');
  lArq.Add('Bairro='+clConf.Result('BAIRRO'));
  lArq.Add('CidadeCod=');
  lArq.Add('Cidade='+clConf.Result('CIDADE'));
  lArq.Add('UF='+clConf.Result('UF'));

{
  lArq.Add('CNPJ='+clConf.Result('LO_CGC'));
  lArq.Add('IE='+clConf.Result('LO_INSC'));
  lArq.Add('Razao='+clConf.Result('LO_RAZA'));
  lArq.Add('Fantasia='+clConf.Result('LO_NOME'));
  lArq.Add('Fone='+clConf.Result('LO_FONE'));
  lArq.Add('CEP='+clConf.Result('LO_CEP'));
  lArq.Add('Logradouro='+clConf.Result('LO_ENDE'));
  lArq.Add('Numero=');
  lArq.Add('Complemento=');
  lArq.Add('Bairro='+clConf.Result('LO_BAIR'));
  lArq.Add('CidadeCod=');
  lArq.Add('Cidade='+clConf.Result('LO_CIDA'));
  lArq.Add('UF='+clConf.Result('LO_ESTA'));
}
  // CRT=1-Simples Nacional = 2=Simples Nacional - excesso de sublimite da receita bruta
  // CRT=Regime Normal

  lArq.Add('CRT=3');

  if Tipo_Nota = 'NFCE' then
     begin
       if Frm_Principal.AMB_TP=2 Then
          Begin
            lArq.Add('cIdToken='+Frm_Principal.CSC_ID_TESTE);
            lArq.Add('CSC='+Frm_Principal.CSC_TOKEN_TESTE);
          End
       else
          Begin
            lArq.Add('cIdToken='+Frm_Principal.CSC_ID_PRODUCAO);
            lArq.Add('CSC='+Frm_Principal.CSC_TOKEN_PRODUCAO);
          End;
    end;

  lArq.Add('[Destinatario]');

  if Tipo_Nota = 'NFE' then
     begin
       if TP_CLIENTE = 'PJ' then
          lArq.Add('CNPJ='+y_cgc)
        else
          lArq.Add('CPF='+y_cgc);

        if ((UpperCase(y_insc) = 'ISENTO') or (y_insc = '') ) then
           lArq.Add('IndIEDest=2')
        else
           begin
            lArq.Add('IE='+y_insc);
            lArq.Add('IndIEDest=1');
           end
     end
  else
      begin
          lArq.Add('CPF='+y_cgc);
          lArq.Add('IndIEDest=9');
      end;
  lArq.Add('NomeRazao='+y_nome);
  lArq.Add('Fone='+' ');
  lArq.Add('CEP='+y_cep );
  lArq.Add('Logradouro='+y_endereco);
  lArq.Add('Numero='+Trim(IntToStr(y_numero)));
  lArq.Add('Complemento='+y_complemento);
  lArq.Add('Bairro='+y_bairro);
  lArq.Add('CidadeCod='+Trim(IntToStr(y_cod_cidadeIBGE)));
  lArq.Add('Cidade='+y_cidade);
  lArq.Add('UF='+y_uf);

  lArq.Add('[Transportador]');
  if Frm_InfoAdicionais.rdgFrete.ItemIndex = 1 then
     lArq.Add('FretePorConta=9')
  else
    Begin
     lArq.Add('FretePorConta=9');
{
     lArq.Add('CnpjCpf='+' ');
     lArq.Add('NomeRazao='+trim(edtTransportadora.text));
     lArq.Add('IE='+' ');
     lArq.Add('Endereco='+' ');
     lArq.Add('Cidade='+' ');
     lArq.Add('UF='+' ');
     lArq.Add('ValorServico='+' ');
     lArq.Add('ValorBase='+' ');
     lArq.Add('Aliquota='+' ');
     lArq.Add('Valor='+' ');
     lArq.Add('CFOP='+' ');
     lArq.Add('CidadeCod='+' ');
     lArq.Add('Placa='+trim(edtPlaca.text));
     lArq.Add('UFPlaca='+' ');
     lArq.Add('RNTC='+' ');

     lArq.Add('[Volume001]
     lArq.Add('Quantidade='+trim(estQtdVolume.text));
     lArq.Add('Especie='+trim(edtEspecie.text));
     lArq.Add('Marca='+trim(editMarca.text));
     lArq.Add('Numeracao='+' ');
     lArq.Add('PesoLiquido='+trim(edtPliquido.text));
     lArq.Add('PesoBruto='+trim(edtPbruto.text));
}

{  // Fatura e Duplicata

Begin
     lArq.Add('[Fatura]
     lArq.Add('Numero='+trim(''));
     lArq.Add('ValorOriginal='+trim(''));
     lArq.Add('ValorDesconto='+trim(''));
     lArq.Add('ValorLiquido='+trim(''));
end;

Begin
     lArq.Add('[Duplicata001]
     lArq.Add('Numero='+trim(''));
     lArq.Add('DataVencimento='+trim(''));
     lArq.Add('Valor='+trim(''));
End;

}
    end;
  clConf.desconect;
  clConf.Free;

end;

procedure Tfrm_FechamentoVenda.GERA_TOTAIS_NFCE;
var
   x : integer;  clAux : TClassAuxiliar;
   sCstat, cStatus, z, sInfoAdicionais : string;

begin
       vrAux3 := TStringList.Create;  sInfoAdicionais := '';
       x:=0;

       clAux := TClassAuxiliar.Create;
       clAux.conect   ('VENDAS',self);

       clAux.ClearSql;
       clAux.AddParam ('SELECT *    ');
       clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO_LOCAL  ');
       clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND         ');
       clAux.AddParam ('      (VF_CAIX=:VF_CAIX)           ');
//       clAux.AddParam (' AND     (VF_VEND=:VF_VEND)             ');
       clAux.consulta.parambyname('VF_LOJA').AsFloat   := y_loja;
       clAux.consulta.parambyname('VF_CAIX').AsFloat   := y_caixa;
 //      clAux.consulta.parambyname('VF_VEND').AsFloat   := y_venda;
       clAux.Execute;

      while (not clAux.eof) do
      begin
         x := x + 1;

        lArq.Add('[PAG'+trim('00'+IntTostr(x)+']'));
        lArq.Add('tpag='+FormatFloat('#0',(clAux.result('VF_FPGT'))));
        lArq.Add('vPag='+FormatFloat('###,###.#0',(clAux.result('VF_VALO'))));
  //      lArq.Add('CNPJ='+'-'clAux.result('TOTAL_PAGO'));
  //    lArq.Add('tBand='+'-');
  //    lArq.Add('cAut='+'-');

        clAux.next;
      end;

  lArq.Add('[Total]');

  lArq.Add('BaseICMS='+FloatToStr(y_BaseICMS));
  lArq.Add('ValorICMS='+FloatToStr(y_ValorICMS));
  lArq.Add('ValorProduto='+FloatToStr(y_ValorProdutos));
  lArq.Add('BaseICMSSubstituicao='+FloatToStr(y_BaseICMSSubstituicao));
  lArq.Add('ValorICMSSubstituicao='+FloatToStr(y_ValorICMSSubstituicao));
  lArq.Add('ValorFrete='+FloatToStr(y_ValorFrete));
  lArq.Add('ValorSeguro='+FloatToStr(Y_ValorSeguro));
  lArq.Add('ValorDesconto='+FloatToStr(y_ValorDesconto));
  lArq.Add('ValorIPI='+FloatToStr(y_ValorIPI));
  lArq.Add('ValorPIS='+FloatToStr(y_ValorPIS));
  lArq.Add('ValorCOFINS='+FloatToStr(y_ValorCOFINS));
  lArq.Add('ValorOutrasDespesas='+FloatToStr(y_ValorOutrasDespesas));
  lArq.Add('ValorNota='+FloatToStr(y_novo_total_venda));
  lArq.Add('[DadosAdicionais]');
//  lArq.Add('infCpl='+Frm_InfoAdicionais.EdtInfoAdicionais.Text);

//  lArq.Add('infCpl='+Frm_InfoAdicionais.MemoInfoAd.Text);

  For x := 0 To Frm_InfoAdicionais.MemoInfoAd.Lines.Count - 1 Do
     begin
      sInfoAdicionais := sInfoAdicionais  + Trim(Frm_InfoAdicionais.MemoInfoAd.Lines.Strings[x]) + ';';
     end;
  lArq.Add('infCpl='+sInfoAdicionais);

//  lArq.Add('infAdFisco=Teste do Campo Fisco');

//  lArq.Add('infAdProd='+Frm_InfoAdicionais.EdtInfoAdicionais.Text);
//   Valores dos Tributos

{
infAdProd := 'Valor aproximado dos tributos Federal R$ ' + FormatFloat('0.00', vTribFed) + ' (' + FormatFloat('#0.00', pAliqFed) + '%) Fonte: IBPT';

infAdProd := infAdProd + 'Valor aproximado dos tributos Estadual R$ ' + FormatFloat('0.00', vTribEst) + ' (' + FormatFloat('#0.00', pAliqEst) + '%) Fonte: IBPT';

infAdProd := infAdProd + 'Valor aproximado dos tributos Municipal R$ ' + FormatFloat('0.00', vTribMun) + ' (' + FormatFloat('#0.00', pAliqMun) + '%) Fonte: IBPT';

}

  lArq.Text := 'NFe.CriarEnviarNFe("[Identificacao]'+chr(13)+lArq.Text+'",2,0)';

//
  lArq.SaveToFile(sArquivoEntNfe);
  lArq.SaveToFile(sArquivoEntNfe2);

    Begin
      while not FileExists(sArquivoSaiNfe) do
         Sleep(1000);

    // Grava_Dados_NFE
     VrAux3 := ChecaStatusSefaz(sArquivoSaiNFE, NDOC);    

     sCstat := VrAux3[0];
     if sCstat = 'OK:' then    // Pegar os 3 primeiros da String
        begin
         cStatus := VrAux3[15];
       if cStatus = '100' then
          Begin
              GRAVA_DADOS_RETORNO_NFE;

//              IF Tipo_Nota = 'NFCE' then
//                 Begin
                   IMPRIMI_DANFE_NFCE;

                   IF trim(y_email) <> '' then
                      ENVIAR_DANFEEMAIL_CLIENTE;
//                 End;
{              frm_TrataNFENFCE.ShowModal;

              if frm_TrataNFENFCE.sCSTaTusDanfe = 'OK:' then
                 begin
                   if frm_principal.MISTRAL_MSG = 1 then
                      ShowMessage('Nota Impressa com Sucesso');
                   end
              else
               ShowMessage('Erro na impressão da Nota');
}

          end
        else
          TRATA_ERROS_NFCE (VrAux3[15]+#13#10+VrAux3[16]);
       // ShowMessage ('Erro Encontrado '+VrAux);
        // MarcaCao_Da_NFE_ como Nao cEnviada;
      end
        else
          // Houve Erro no Stat
          TRATA_ERROS_NFCE (VrAux3[15]+#13#10+VrAux3[16]);
  end;
end;

procedure Tfrm_FechamentoVenda.GERA_ITENS_NFCE;
var  PIS : integer; ICMS,x_aliquota, nValItem : real;
     s_aliquota, cValItem : string;

begin
  cValItem := stringReplace(NFCE_VALITEM, '.', '', []);

  y_aliquota := 0.19; s_aliquota := '19';
  lArq.Add('[Produto'+trim('00'+IntTostr(NFCE_TOT_ITENS)+']'));
  lArq.Add('Codigo='+A_NFCE_COD [NFCE_TOT_ITENS]);
  lArq.Add('cEAN=');
  lArq.Add('Descricao='+A_NFCE_DESCR [NFCE_TOT_ITENS]);
  if trim(A_NFCE_NCM [NFCE_TOT_ITENS]) = '' then
     lArq.Add('NCM=03057900')
  else
    lArq.Add('NCM='+A_NFCE_NCM [NFCE_TOT_ITENS]);
  lArq.Add('CFOP='+trim(Frm_InfoAdicionais.edtCfop.Text));
  if trim(A_NFCE_UNIDADE [NFCE_TOT_ITENS]) <> '' then
     lArq.Add('Unidade='+A_NFCE_UNIDADE [NFCE_TOT_ITENS])
  else
     lArq.Add('Unidade=PC');

  lArq.Add('Quantidade='+NFCE_QTDE);
  lArq.Add('ValorUnitario='+NFCE_PUNIT);

  lArq.Add('ValorTotal='+cValItem);

 //  y_vFrete, y_vSeg, y_Desc, y_vOutro

  lArq.Add('vFrete='+FormatFloat('###,###.#0', y_vFrete));
  lArq.Add('vSeg='+FormatFloat('###,###.#0', y_vSeg));
  lArq.Add('vDesc='+FormatFloat('###,###.#0', y_Desc));
  lArq.Add('ValorDesconto='+FormatFloat('###,###.#0', y_Desc));
  lArq.Add('vOutro='+FormatFloat('###,###.#0', y_vOutro));

  lArq.Add('[ICMS'+trim('00'+IntTostr(NFCE_TOT_ITENS)+']'));
  lArq.Add('CST=00');
  lArq.Add('CSOSN='+trim(Frm_InfoAdicionais.edtCsosn.Text));
  lArq.Add('Origem=0');
  lArq.Add('Modalidade=0');
  lArq.Add('ValorBase='+cValItem);   

  lArq.Add('Aliquota='+s_aliquota);

  ICMS := StrtoFloat(cValItem)*0.19; // Pegar este valor da Base de Dados
  lArq.Add('Valor='+FormatFloat('###,###.#0',ICMS));

  y_ValorPRodutos := y_ValorProdutos + StrToFloat(cValItem);
  y_BaseICMS  := y_BaseICMS + StrToFloat(cValItem);
  y_ValorICMS := y_ValorICMS + ICMS;

  PIS :=0;
  If PIS=1 then
     begin
      lArq.Add('[PIS'+trim('00'+IntTostr(NFCE_TOT_ITENS)+']'));
      lArq.Add('CST=0');
//      lArq.Add('ValorBase='+FormatFloat('###,###.#0',(0.00)));
      lArq.Add('ValorBase='+cValItem);
      lArq.Add('Aliquota=0');
      lArq.Add('Valor='+FormatFloat('###,###.#0',(0.00)));
    end;

  lArq.Add('[COFINS'+trim('00'+IntTostr(NFCE_TOT_ITENS)+']'));
  lArq.Add('CST=0');
//  lArq.Add('ValorBase='+FormatFloat('###,###.#0',(0.00)));
  lArq.Add('ValorBase='+cValItem);
  lArq.Add('Aliquota=0');
  lArq.Add('Valor='+FormatFloat('###,###.#0',(0.00)));

end;

procedure Tfrm_FechamentoVenda.CAB_VENDA_ANTIGO;
var
  clVend: TClassAuxiliar;
  icms: Real;
begin
  clVend := TClassAuxiliar.Create;
  clVend.conect   (databaseprodutos,self);
  clVend.ClearSql;
  clVend.AddParam ('INSERT INTO VENDAS                       ');
  clVend.AddParam (' (VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,       ');
  clVend.AddParam ('  VE_OPER,VE_CLIE,VE_CONT,VE_TOTA,       ');
  clVend.AddParam ('  VE_QTDE,VE_QTD1,VE_QTD2,VE_STAT,       ');
  clVend.AddParam ('  VE_TIPZ,VE_CUPO,VE_VEND,VE_ONLI,       ');
  clVend.AddParam ('  VE_ICMS,VE_ALIQ,VE_ENVI,VE_ECF,        ');
  clVend.AddParam ('  VE_CPF,VE_NOME,VE_FONE,VE_FUNC,        ');
  clVend.AddParam ('  VE_SERI,VE_NOTA,VE_DESC,VE_PDES,       ');
  clVend.AddParam ('  VE_COMI,VE_HORA,VE_ACRE,VE_PACR)       ');
  clVend.AddParam ('VALUES                                   ');
  clVend.AddParam (' (:VE_CAIX,:VE_LOJA,:VE_CODI,:VE_DATA,   ');
  clVend.AddParam ('  :VE_OPER,:VE_CLIE,:VE_CONT,:VE_TOTA,   ');
  clVend.AddParam ('  :VE_QTDE,:VE_QTD1,:VE_QTD2,:VE_STAT,   ');
  clVend.AddParam ('  :VE_TIPZ,:VE_CUPO,:VE_VEND,:VE_ONLI,   ');
  clVend.AddParam ('  :VE_ICMS,:VE_ALIQ,:VE_ENVI,:VE_ECF,    ');
  clVend.AddParam ('  :VE_CPF,:VE_NOME,:VE_FONE,:VE_FUNC,    ');
  clVend.AddParam ('  :VE_SERI,:VE_NOTA,:VE_DESC,:VE_PDES,   ');
  clVend.AddParam ('  :VE_COMI,:VE_HORA,:VE_ACRE,:VE_PACR)   ');
  clVend.consulta.parambyname('VE_LOJA').AsFloat  := frm_principal.x_loja;
  clVend.consulta.parambyname('VE_CAIX').AsFloat  := frm_principal.x_terminal;
  clVend.consulta.parambyname('VE_CODI').AsFloat  := frm_principal.x_codigo_venda;
  clVend.consulta.parambyname('VE_FUNC').AsFloat  := frm_principal.x_caixa_ativo;
  clVend.consulta.parambyname('VE_CLIE').AsFloat  := 0;
  clVend.consulta.parambyname('VE_CONT').AsFloat  := 0;
  if (lblNDoc2.caption='C') then {cupom fiscal}
  begin
    if (trim(edtNDoc.text)<>'') then
      clVend.consulta.parambyname('VE_CUPO').AsFloat  := strtofloat(trim(edtNDoc.text))
    else
      clVend.consulta.parambyname('VE_CUPO').AsFloat  := 0;
  end
  else
    clVend.consulta.parambyname('VE_CUPO').AsFloat  := 0;
  clVend.consulta.parambyname('VE_NOTA').AsString := trim(edtNDoc.text);
  clVend.consulta.parambyname('VE_TIPZ').AsString := y_tipz;
  if (Trim(y_cgc) <> '') then
    clVend.consulta.parambyname('VE_CPF').AsString := AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(y_cgc,'-',''),'.',''),' ',''),'/','')
  else
    clVend.consulta.parambyname('VE_CPF').AsString := '';

  if (Trim(y_nome) <> '') then
    clVend.consulta.parambyname('VE_NOME').AsString := Trim(y_nome)
  else
    clVend.consulta.parambyname('VE_NOME').AsString := '';
  clVend.consulta.parambyname('VE_FONE').AsString := '';
  clVend.consulta.parambyname('VE_SERI').AsString := '';
  clVend.consulta.parambyname('VE_STAT').AsString := '1';
  clVend.consulta.parambyname('VE_DATA').AsDateTime := frm_principal.x_data_trabalho;
  clVend.consulta.parambyname('VE_OPER').AsFloat    := frm_principal.x_caixa_ativo;
  frm_principal.x_vendedor := VerificaVendedorDaVenda (frm_principal.x_terminal,frm_principal.x_venda); {*}
  clVend.consulta.parambyname('VE_VEND').AsFloat    := frm_principal.x_vendedor;
  if (Trim(edtDesc.text)<>'') then
    clVend.consulta.parambyname('VE_PDES').AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtDesc.text)))
  else
    clVend.consulta.parambyname('VE_PDES').AsFloat  := 0.00;
  if (Trim(edtTotalDesc.text)<>'') then
    clVend.consulta.parambyname('VE_DESC').AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtTotalDesc.text)))
  else
    clVend.consulta.parambyname('VE_DESC').AsFloat  := 0.00;
  clVend.consulta.parambyname('VE_TOTA').AsFloat  := y_novo_total_venda;
  clVend.consulta.parambyname('VE_COMI').AsFloat  := CalculaValorComissionavel; {*}
  clVend.consulta.ParamByName('VE_HORA').AsString := FormatDateTime('hh:nn',time);
  clVend.consulta.parambyname('VE_QTD1').AsFloat  := total_qtde1;
  clVend.consulta.parambyname('VE_QTD2').AsFloat  := total_qtde2;
  clVend.consulta.parambyname('VE_QTDE').AsFloat  := (total_qtde1 - total_qtde2);
  icms := InformaAliqICMS(frm_principal.x_estado);
  clVend.consulta.parambyname('VE_ICMS').AsFloat  := clVend.consulta.parambyname('VE_TOTA').AsFloat*(icms/100);
  clVend.consulta.parambyname('VE_ALIQ').AsFloat  := icms;
  if (frm_principal.x_online) then
  begin
    clVend.consulta.parambyname('VE_ONLI').AsString := '1';
    clVend.consulta.parambyname('VE_ENVI').AsString := '1';
  end
  else
  begin
    clVend.consulta.parambyname('VE_ONLI').AsString := '0';
    clVend.consulta.parambyname('VE_ENVI').AsString := '0'; //passa para '1' quando for exportado
  end;
  if (lblNDoc2.caption='C') then {cupom fiscal}
    clVend.consulta.parambyname('VE_ECF').AsInteger := trunc(frm_principal.x_ecf)
  else
    clVend.consulta.parambyname('VE_ECF').AsInteger := 0;
  clVend.consulta.ParamByName('VE_ACRE').AsFloat := 0;
  clVend.consulta.ParamByName('VE_PACR').AsFloat := 0;
  clVend.Execute;
  clVend.desconect;
  clVend.Free;

end;

procedure Tfrm_FechamentoVenda.TRATA_ERROS_NFCE(DescrErro : String) ;
begin
  ShowMessage('Erro '+DescrErro);
  continuaConclusao := false;
  
end;

procedure Tfrm_FechamentoVenda.GRAVA_DADOS_RETORNO_NFE;
var
  clVend: TClassAuxiliar;
  icms: Real;
begin
  clVend := TClassAuxiliar.Create;
//  clVend.conect   (databaseprodutos,self);
  clVend.conect   (databasevendas, self);
  clVend.ClearSql;
  clVend.AddParam ('INSERT INTO DADOSNFE                     ');
  clVend.AddParam (' (ID,ENV_VERSAO, NFE_CSTAT, NFE_CHNFE, NFE_ARQUIVO, NFE_NUMERO) ');
  clVend.AddParam ('VALUES                                   ');
  clVend.AddParam (' (:ID, :ENV_VERSAO, :NFE_CSTAT, :NFE_CHNFE, :NFE_ARQUIVO, :NFE_NUMERO) ');

  clVend.consulta.parambyname('ID').AsInteger         := StrtoInt(trim(edtNDoc.Text));

  clVend.consulta.parambyname('ENV_VERSAO').AsString  := ' ';
  clVend.consulta.parambyname('NFE_CSTAT').AsString   := vrAux3[15];
  clVend.consulta.parambyname('NFE_CHNFE').AsString   := vrAux3[24];;
  clVend.consulta.parambyname('NFE_ARQUIVO').AsString := vrAux3[28];
  clVend.consulta.parambyname('NFE_NUMERO').AsInteger := StrtoInt(trim(edtNDoc.Text));

  clVend.Execute;
  clVend.desconect;
  clVend.Free;

end;

procedure Tfrm_FechamentoVenda.IMPRIMI_DANFE_NFCE;
Var
    sCSTaTusDanfe : String;

begin

  lArq := TStringList.Create;


  if (frmDialogo.ExibirMensagem ('IMPRIME NOTA CLIENTE ?'
        ,'Venda',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        If trim(vrAux3[28]) <> '' then
          Begin
            lArq.Text := 'NFe.ImprimirDanfe("'+trim(vrAux3[28])+'")';

            lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUSC.TXT');

            If Frm_Principal.MISTRAL_MSG = 1 then
                 begin ShowMEssage('Gravou o Arquivo Para o Envio da DanFe'); end;

            while not FileExists('C:\MIstralNF\TXT\SAINFESTATUSC.TXT') do

            Sleep(1000);
            //
            sCSTaTusDanfe := ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUSC.TXT');
      //      if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUSC.TXT') = 'OK:' then
            if sCSTaTusDanfe = 'OK:' then
               Begin
                If Frm_Principal.MISTRAL_MSG = 1 then
                    ShowMEssage('Nota Enviada Com sucesso');
               end
            else
                TRATA_ERROS_NFCE('ERRO: NOTA NÃO ENVIADA') ;
          End;
  // Rotina para Testar se foi tudo com Sucesso

  // Carregar a Imagem do Botão Verde

  begin
      lArq.Text := 'NFe.ImprimirDanfePDF("'+trim(vrAux3[28])+'")';
      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUSD.TXT');

      If Frm_Principal.MISTRAL_MSG = 1 then
           begin ShowMEssage('Gravou o Arquivo Para Gerar o PDF do DANFE'); end;

      while not FileExists('C:\MIstralNF\TXT\SAINFESTATUSD.TXT') do

      Sleep(1000);
      //
      if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUSD.TXT') = 'OK:' then
         Begin
          If Frm_Principal.MISTRAL_MSG = 1 then
             ShowMEssage('Arquivo PDF Gerado com sucesso');
          End
      else
          TRATA_ERROS_NFCE('ERRO: PDF da NOTA NÃO CRIADA !') ;
   end;

 //
end;

procedure Tfrm_FechamentoVenda.ENVIAR_DANFEEMAIL_CLIENTE;
begin

  lArq := TStringList.Create;

  If trim(y_email) <> '' then
    Begin

      lArq.Text := 'NFe.EnviarEmail("'+trim(y_email)+'","'+trim(vrAux3[28])+'")';

      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUSE.TXT');

      // Carregar a Imagem do Botão Verde

      while not FileExists('C:\MIstralNF\TXT\SAINFESTATUSE.TXT') do
      Sleep(1000);
//**VERIFICAR
      if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUSE.TXT') = 'OK:' then
         ShowMessage('Nota Enviada com Sucesso ')
      else
         ShowMessage('ERRO NA IMPRESSAO DO ARQUIVO ');

  End;
  
End;  

end.
