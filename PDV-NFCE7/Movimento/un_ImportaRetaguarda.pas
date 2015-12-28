{[MOVIMENTO]}
unit un_ImportaRetaguarda;

interface
                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Buttons, StdCtrls, ExtCtrls, Gauges, Db, DBTables, Grids,
  DBGrids, FileCtrl, Inifiles, classetxt2, ComCtrls, classeExport, LabelOO,
  jpeg, BotaoSair,zlib, tsqUnZip;

type
  Tfrm_ImportaRetaguarda = class(TForm)
    qDiminueSaldo: TQuery;
    qAumentaSaldo: TQuery;
    qInsereItemVenda: TQuery;
    pg1: TPageControl;
    pagina1: TTabSheet;
    pagina2: TTabSheet;
    pagina3: TTabSheet;
    chProgresso: TCheckBox;
    Label10: TLabel;
    edtLocal: TMaskEdit;
    ListaDiretorio: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    lblLoja: TLabel;
    pnGauge1: TPanel;
    Gauge1: TGauge;
    Bevel4: TBevel;
    lblCopiando: TLabelOO;
    pg2: TPageControl;
    pagina51: TTabSheet;
    MemoTarefas: TMemo;
    pagina52: TTabSheet;
    MemoErros: TMemo;
    pnDatas: TPanel;
    Label9: TLabel;
    pnMensagem: TPanel;
    pnFracasso: TPanel;
    pnSucesso: TPanel;
    pnLogo: TPanel;
    Image1: TImage;
    timerMensagem: TTimer;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnReceberFtp: TBitBtn;
    Descompactar: TBitBtn;
    BitBtnVoltar: TBitBtn;
    BitBtnAvancar: TBitBtn;
    BitBtnAvancar1: TBitBtn;
    BotaoSair1: TBotaoSair;
    BotaoSair2: TBotaoSair;
    BotaoSair3: TBotaoSair;
    BitBtnVoltar3: TBitBtn;
    lbl1: TLabel;
    tsqnzp: TtsqUnZip;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ListaDiretorioChange(Sender: TObject);
    procedure btnReceberFtpxClick(Sender: TObject);
    procedure btnDescompactarxClick(Sender: TObject);
    procedure btnAvancar1Click(Sender: TObject);
    procedure btnFechar1Click(Sender: TObject);
    procedure edtLocalEnter(Sender: TObject);
    procedure edtLocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAvancar2Click(Sender: TObject);
    procedure btnFechar2Click(Sender: TObject);
    procedure btnVoltar2Click(Sender: TObject);
    procedure btnVoltar3Click(Sender: TObject);
    procedure edtLocalChange(Sender: TObject);
    procedure timerMensagemTimer(Sender: TObject);
    procedure btnReceberFtpClick(Sender: TObject);
    procedure DescompactarClick(Sender: TObject);
    procedure BitBtnVoltarClick(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnAvancarClick(Sender: TObject);
    procedure BitBtnAvancar1Click(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure BotaoSair2Click(Sender: TObject);
    procedure BotaoSair3Click(Sender: TObject);
    procedure BitBtnVoltar3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    pathCompactadores: String;
    pathCompactadoresDOS: String;
    unidadeCompactadores: String;
    y_pathlocal: String;
    y_tipo_exportacao: String;
    indGauge,totGauge: Integer;
    EXPORTACAO_SUCESSO: Boolean;
    procedure DecompressionProgress(Sender: TObject);
    procedure DecompressFiles(FileName, Destination: String);
    procedure DecompressFiles2(FileName, Destination: String);
    procedure ImportandoProdutosExc;
    procedure ImportandoProdutosFaixasExc;
    procedure ImportandoEstoqueExc;
    procedure VerificaTipoExportacao;
    procedure ImportandoItensTabelasPrecosExcluidos;
    procedure ImportandoPrecosPromocionaisExcluidos;
    procedure ImportaTabelaUsers;
    procedure ImportaTabelaCBarras;
    procedure ImportaTabelaConf;
    procedure ImportaSequenciaisVendas;
    procedure ImportaTransfLoja;
    procedure DescompactarArquivo;
    procedure ImportarMovimento;
    procedure SinalizandoSucesso;
    procedure SinalizandoFracasso;
    procedure PreparandoSinalizacao;
    procedure ImportandoImpostoProduto;
    procedure ImportandoArqImpostoProd;
    procedure ApagaArquivosDir(nomedir: String; extArq: String);
  end;

var
  frm_ImportaRetaguarda: Tfrm_ImportaRetaguarda;
  nMax: Integer;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar, unDialogo,
  unMensagem, F8Lojas, DM3, venda, DM4,
  un_Importacao_FTP, un_ALERTA, un_LancaVenda;


procedure Tfrm_ImportaRetaguarda.ImportarMovimento;
var
  clExp: TClassExport;
  nome_user,data,hora: String;
  fexcimp:Boolean;
begin
  if (trim(edtLocal.text)='') then
  begin
    ExibeCritica ('Informe a pasta onde se localiza o arquivo de importação!','Vendas',nil);
    pg1.activepage:=pagina1;
    edtLocal.setfocus;
  end
  else
  begin
    nome_user := ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,self);
    data := datetostr(frm_principal.x_data_trabalho);
    hora := timetostr(time);

    memoTarefas.lines.Add ('');
    memoTarefas.lines.Add ('      Status da importação - Data/Hora: '+data+' '+hora+'  Usuario: '+nome_user);
    memoTarefas.lines.Add ('-------------------------------------------------------------------------------------------');
    memoTarefas.lines.Add ('');
    RefreshObjeto(frm_ImportaRetaguarda);
   {***********************************************************}

    VerificaTipoExportacao; //VERIFICA SE A EXPORTACAO FOI 'TOTAL' OU 'PARCIAL'
   {***********************************************************}       

    if y_tipo_exportacao = 'T' then
      Fexcimp := false
    else
      FExcImp := frm_principal.x_ExcImp;

    clExp := TClassExport.Create;
    clExp.Inicializa;

    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\PRODUTOS.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','PRODUTOS',trim(edtLocal.text)+'\PRODUTOS.'+form_nz(frm_principal.x_loja,3),'PRODUTOS',
        'PR_GRUP,PR_SUBG,PR_CODI','f,f,f',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      if (y_tipo_exportacao='P') then
        ImportandoProdutosExc;
      DeleteFile(trim(edtLocal.text)+'\PRODUTOS.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\PRODFAIX.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','PRODUTOS_FAIXAS',trim(edtLocal.text)+'\PRODFAIX.'+form_nz(frm_principal.x_loja,3),'PROD. FAIXAS',
        'PF_GRUP,PF_SUBG,PF_PROD,PF_TAMA','f,f,f,c',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      if (y_tipo_exportacao='P') then
        ImportandoProdutosFaixasExc;
      DeleteFile(trim(edtLocal.text)+'\PRODFAIX.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\ESTOQUE.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','ESTOQUE',trim(edtLocal.text)+'\ESTOQUE.'+form_nz(frm_principal.x_loja,3),'ITENS PRODUTOS',
        'ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA','f,f,f,f,c',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      if (y_tipo_exportacao='P') then
        ImportandoEstoqueExc;
      DeleteFile(trim(edtLocal.text)+'\ESTOQUE.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\ESLOJA.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','ESTOQUE_LOJA',trim(edtLocal.text)+'\ESLOJA.'+form_nz(frm_principal.x_loja,3),'ITENS PROD/LOJA',
        'EL_LOJA,EL_GRUP,EL_SUBG,EL_PROD,EL_CORE,EL_TAMA','f,f,f,f,f,c',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      DeleteFile(trim(edtLocal.text)+'\ESLOJA.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\PRECO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','ITENS_TABELAS_PRECOS',trim(edtLocal.text)+'\PRECO.'+form_nz(frm_principal.x_loja,3),'PREÇOS DIF.',
        'IP_LOJA,IP_TABE,IP_GRUP,IP_SUBG,IP_PROD,IP_CORE,IP_TAMA','f,f,f,f,f,f,c',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      if (y_tipo_exportacao='P') then
        ImportandoItensTabelasPrecosExcluidos;
      DeleteFile(trim(edtLocal.text)+'\PRECO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\PRECOPRO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','PRECOS_PROMOCIONAIS',trim(edtLocal.text)+'\PRECOPRO.'+form_nz(frm_principal.x_loja,3),'PREÇOS PROM.',
        'PP_LOJA,PP_GRUP,PP_SUBG,PP_PROD,PP_CORE,PP_TAMA','f,f,f,f,f,c',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      if (y_tipo_exportacao='P') then
        ImportandoPrecosPromocionaisExcluidos;
      DeleteFile(trim(edtLocal.text)+'\PRECOPRO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;

    //ESTAS TABELAS SAO SEMPRE IMPORTADDAS COMO SE FOSSE 'EXPORTACAO TOTAL'
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\GRUPO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','GRUPOS_PRODUTOS',trim(edtLocal.text)+'\GRUPO.'+form_nz(frm_principal.x_loja,3),'GRUPOS',
        'GR_CODI','f,f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\GRUPO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\SUBGRUPO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','SUBGRUPOS_PRODUTOS',trim(edtLocal.text)+'\SUBGRUPO.'+form_nz(frm_principal.x_loja,3),'SUBGRUPOS',
        'SG_GRUP,SG_CODI','f,f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\SUBGRUPO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\COR.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','CORES',trim(edtLocal.text)+'\COR.'+form_nz(frm_principal.x_loja,3),'CORES',
        'CR_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\COR.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\TAMANHO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','TAMANHOS',trim(edtLocal.text)+'\TAMANHO.'+form_nz(frm_principal.x_loja,3),'TAMANHOS',
        'TM_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\TAMANHO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\TAMAFAIX.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','TAMANHOS_FAIXAS',trim(edtLocal.text)+'\TAMAFAIX.'+form_nz(frm_principal.x_loja,3),'TAMANHOS FAIXAS',
        'TF_CODI,TF_TAMA','f,c',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\TAMAFAIX.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\COLECAO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','COLECOES',trim(edtLocal.text)+'\COLECAO.'+form_nz(frm_principal.x_loja,3),'COLECOES',
        'CO_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\COLECAO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\LINHA.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','LINHAS',trim(edtLocal.text)+'\LINHA.'+form_nz(frm_principal.x_loja,3),'LINHAS',
        'LI_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\LINHA.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\MATERIAL.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','MATERIAIS',trim(edtLocal.text)+'\MATERIAL.'+form_nz(frm_principal.x_loja,3),'MATERIAIS',
        'MA_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\MATERIAL.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\MODELO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','MODELOS',trim(edtLocal.text)+'\MODELO.'+form_nz(frm_principal.x_loja,3),'MODELOS',
        'MD_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\MODELO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\ADM.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','ADMINISTRADORAS',trim(edtLocal.text)+'\ADM.'+form_nz(frm_principal.x_loja,3),'ADMINISTRADORAS',
        'AM_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\ADM.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\ADMLOJA.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','ADMINISTRADORAS_LOJAS',trim(edtLocal.text)+'\ADMLOJA.'+form_nz(frm_principal.x_loja,3),'ADM. LOJAS',
        'AL_CADM,AL_LOJA','f,f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\ADMLOJA.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\ALIQ.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','ALIQUOTAS_PRODUTOS',trim(edtLocal.text)+'\ALIQ.'+form_nz(frm_principal.x_loja,3),'ALIQUOTAS',
        'AP_GRUP,AP_SUBG,AP_PROD,AP_ESTA','f,f,f,c',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\ALIQ.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    ImportaTabelaCBarras;
    Application.ProcessMessages;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\IMPOSTPR.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','IMPOSTO_PRODUTO',trim(edtLocal.text)+'\IMPOSTPR.'+form_nz(frm_principal.x_loja,3),'IMPOSTO_PRODUTO',
        'CODIGO,EX,TABELA','f,f,f',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      if (y_tipo_exportacao='P') then
        ImportandoImpostoProduto;
      DeleteFile(trim(edtLocal.text)+'\IMPOSTPR.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\ARQIMPPR.'+form_nz(frm_principal.x_loja,3))) then
    begin
{      clExp.ImportaTabela ('VENDAS','ARQ_IMPORT_IMPOSTO_PRODUTO',trim(edtLocal.text)+'\ARQIMPPR.'+form_nz(frm_principal.x_loja,3),'ARQ_IMPORT_IMPOSTO_PRODUTO',
        'ARQUIVO,VERSAO','c,c',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);

      if (y_tipo_exportacao='P') then
        ImportandoArqImpostoProd;}
      DeleteFile(trim(edtLocal.text)+'\ARQIMPPR.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************


    ImportaTabelaConf;
    Application.ProcessMessages;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\CRELOJA.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','CRELOJA',trim(edtLocal.text)+'\CRELOJA.'+form_nz(frm_principal.x_loja,3),'LOJAS',
        'LO_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\CRELOJA.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\USER.'+form_nz(frm_principal.x_loja,3))) then
    begin
      ImportaTabelaUsers;
      DeleteFile(trim(edtLocal.text)+'\USER.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\TRANSFLO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      ImportaTransfLoja;
      DeleteFile(trim(edtLocal.text)+'\TRANSFLO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\VENDEDOR.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','VENDEDORES',trim(edtLocal.text)+'\VENDEDOR.'+form_nz(frm_principal.x_loja,3),'VENDEDORES',
        'VD_LOJA,VD_CODI','f,f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\VENDEDOR.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\FORN.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','FORNECEDORES',trim(edtLocal.text)+'\FORN.'+form_nz(frm_principal.x_loja,3),'FORNECEDORES',
        'FO_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\FORN.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\BANCO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','BANCOS',trim(edtLocal.text)+'\BANCO.'+form_nz(frm_principal.x_loja,3),'BANCOS',
        'BA_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\BANCO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\CONTAS.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','CONTAS',trim(edtLocal.text)+'\CONTAS.'+form_nz(frm_principal.x_loja,3),'CONTAS',
        'CO_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\CONTAS.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\GRCONTAS.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','GRUPOS_CONTAS',trim(edtLocal.text)+'\GRCONTAS.'+form_nz(frm_principal.x_loja,3),'GRUPOS CONTAS',
        'GR_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\GRCONTAS.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************
    if (FileExists(trim(edtLocal.text)+'\MTVATDO.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','MTV_ATDOS',trim(edtLocal.text)+'\MTVATDO.'+form_nz(frm_principal.x_loja,3),'MOT. SUSPENS. ATDO.',
        'MA_CODI','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\MTVATDO.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    //***************************************************************************************

    if (FileExists(trim(edtLocal.text)+'\MTVSANG.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','MTV_SANG',trim(edtLocal.text)+'\MTVSANG.'+form_nz(frm_principal.x_loja,3),'MOT. SANG',
        'CODIGO','f',memoTarefas,gauge1,chProgresso.checked,'T',0,FExcImp);
      DeleteFile(trim(edtLocal.text)+'\MTVSANG.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;

    if (FileExists(trim(edtLocal.text)+'\PESQPR.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','PESQUISA_PRECOS',trim(edtLocal.text)+'\PESQPR.'+form_nz(frm_principal.x_loja,3),'PESQ. DE PREÇOS',
        'PS_LOJA,PS_GRUP,PS_SUBG,PS_PROD,PS_EMPR,PS_DAT1,PS_DAT2','f,f,f,f,c,d,d',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      DeleteFile(trim(edtLocal.text)+'\PESQPR.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;
    if (FileExists(trim(edtLocal.text)+'\HISTPREC.'+form_nz(frm_principal.x_loja,3))) then
    begin
      clExp.ImportaTabela ('VENDAS','HISTORICO_PRECOS',trim(edtLocal.text)+'\HISTPREC.'+form_nz(frm_principal.x_loja,3),'HISTORICO PRECOS',
        'DATA','d',memoTarefas,gauge1,chProgresso.checked,y_tipo_exportacao);
      DeleteFile(trim(edtLocal.text)+'\HISTPREC.'+form_nz(frm_principal.x_loja,3));
      Application.ProcessMessages;
    end;

    clExp.Finaliza;
    clExp.Free;

    {***********************************************************}
    RefreshObjeto(frm_ImportaRetaguarda);              
    {***********************************************************}
    //RENOMEANDO ARQUIVO
    CopyFile  (Pchar(trim(edtLocal.text)+'\ESTOQ'+form_nz(frm_principal.x_loja,3)+'.ZIP'),
      Pchar(trim(edtLocal.text)+'\ESTOQ'+form_nz(frm_principal.x_loja,3)+'_JA_IMPORTADO.ZIP'),
      false);
    DeleteFile (trim(edtLocal.text)+'\ESTOQ'+form_nz(frm_principal.x_loja,3)+'.ZIP');

    memoTarefas.lines.Add ('');
    memoTarefas.lines.Add ('-- Importação concluída --');
  end;
end;

procedure Tfrm_ImportaRetaguarda.FormActivate(Sender: TObject);
begin
  if (pg1.activepage=pagina1) then
    edtLocal.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ImportaRetaguarda.ImportandoItensTabelasPrecosExcluidos; {*}
var
  clAux,clAux1: TClassAuxiliar;
  clExp: TClassExport;
  nome_arquivo: String;
  clItemExc: TClassTXT2;
  continua: Boolean;
  loja,tabela,grupo,subgrupo,produto,cor: Real;
  tipz,faixa: String;
begin
  clItemExc := TClassTXT2.Create;
  try
        {*************************************************************************************************************************************}
    nome_arquivo := trim(edtLocal.text)+'\PRECOEXC.'+form_nz(frm_principal.x_loja,3);
    clItemExc.Open   (nome_arquivo,KTA_LEITURA);
        {*************************************************************************************************************************************}
    continua:=true;
  except
    memoTarefas.lines.Add (' PRECOS DIF EXC...: Arquivo '+nome_arquivo+' não encontrado');
    memoTarefas.refresh;
    continua:=false;
  end;
  if (continua) then
  begin
    clExp := TClassExport.Create;
    clExp.Inicializa;
    clExp.MontaEstruturaTabelaImportacao ('ESTOQUE','ITENS_TABELAS_PRECOS_EXCLUIDOS',clItemExc);
    if (chProgresso.checked) then
      pnGauge1.visible:=true;
    indGauge:=0;
    totGauge:=clItemExc.RecordCount;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
         {*******************************************************************}
    clExp.MontaComandoInsertNaTabela('ITENS_TABELAS_PRECOS_EXCLUIDOS',clAux);
         {*******************************************************************}
    while (not clItemExc.Feof) do
    begin
             {*******************************************************************}
      Application.ProcessMessages;
      clItemExc.Next; {*}
             {*******************************************************************}
      loja      := clItemExc.FieldByName('IP_LOJA');
      tabela    := clItemExc.FieldByName('IP_TABE');
      grupo     := clItemExc.FieldByName('IP_GRUP');
      subgrupo  := clItemExc.FieldByName('IP_SUBG');
      produto   := clItemExc.FieldByName('IP_PROD');
      cor       := clItemExc.FieldByName('IP_CORE');
      faixa     := clItemExc.FieldByName('IP_TAMA');
      tipz      := clItemExc.FieldByName('IP_TIPZ');
             {*******************************************************************}
      clAux1 := TClassAuxiliar.Create;
      clAux1.conect   ('VENDAS',self);
      clAux1.ClearSql;
      clAux1.AddParam ('SELECT IP_PRE1,IP_PRE2 FROM ITENS_TABELAS_PRECOS  ');
      clAux1.AddParam ('WHERE (IP_LOJA='+floattostr(loja)+') AND          ');
      clAux1.AddParam ('      (IP_TABE='+floattostr(tabela)+') AND        ');
      clAux1.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND         ');
      clAux1.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND      ');
      clAux1.AddParam ('      (IP_PROD='+floattostr(produto)+') AND       ');
      clAux1.AddParam ('      (IP_CORE='+floattostr(cor)+') AND           ');
      clAux1.AddParam ('      (IP_TAMA='+chr(39)+faixa+chr(39)+')         ');
      if (clAux1.Execute) then
        if (tipz='1') then
        begin
          if (clAux1.Result('IP_PRE2')<>0.00) then
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('UPDATE ITENS_TABELAS_PRECOS                    ');
            clAux1.AddParam ('SET    IP_PRE'+tipz+'=0                        ');
            clAux1.AddParam ('WHERE (IP_LOJA='+floattostr(loja)+') AND       ');
            clAux1.AddParam ('      (IP_TABE='+floattostr(tabela)+') AND     ');
            clAux1.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND      ');
            clAux1.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND   ');
            clAux1.AddParam ('      (IP_PROD='+floattostr(produto)+') AND    ');
            clAux1.AddParam ('      (IP_CORE='+floattostr(cor)+') AND        ');
            clAux1.AddParam ('      (IP_TAMA='+chr(39)+faixa+chr(39)+')      ');
            clAux1.Execute;
          end
          else
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('DELETE FROM ITENS_TABELAS_PRECOS               ');
            clAux1.AddParam ('WHERE (IP_LOJA='+floattostr(loja)+') AND       ');
            clAux1.AddParam ('      (IP_TABE='+floattostr(tabela)+') AND     ');
            clAux1.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND      ');
            clAux1.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND   ');
            clAux1.AddParam ('      (IP_PROD='+floattostr(produto)+') AND    ');
            clAux1.AddParam ('      (IP_CORE='+floattostr(cor)+') AND        ');
            clAux1.AddParam ('      (IP_TAMA='+chr(39)+faixa+chr(39)+')      ');
            clAux1.Execute;
          end;
        end
        else
        if (tipz='2') then
          if (clAux1.Result('IP_PRE1')<>0.00) then
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('UPDATE ITENS_TABELAS_PRECOS                    ');
            clAux1.AddParam ('SET    IP_PRE'+tipz+'=0                        ');
            clAux1.AddParam ('WHERE (IP_LOJA='+floattostr(loja)+') AND       ');
            clAux1.AddParam ('      (IP_TABE='+floattostr(tabela)+') AND     ');
            clAux1.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND      ');
            clAux1.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND   ');
            clAux1.AddParam ('      (IP_PROD='+floattostr(produto)+') AND    ');
            clAux1.AddParam ('      (IP_CORE='+floattostr(cor)+') AND        ');
            clAux1.AddParam ('      (IP_TAMA='+chr(39)+faixa+chr(39)+')      ');
            clAux1.Execute;
          end
          else
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('DELETE FROM ITENS_TABELAS_PRECOS               ');
            clAux1.AddParam ('WHERE (IP_LOJA='+floattostr(loja)+') AND       ');
            clAux1.AddParam ('      (IP_TABE='+floattostr(tabela)+') AND     ');
            clAux1.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND      ');
            clAux1.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND   ');
            clAux1.AddParam ('      (IP_PROD='+floattostr(produto)+') AND    ');
            clAux1.AddParam ('      (IP_CORE='+floattostr(cor)+') AND        ');
            clAux1.AddParam ('      (IP_TAMA='+chr(39)+faixa+chr(39)+')      ');
            clAux1.Execute;
          end;
      clAux1.desconect;
      clAux1.Free;

             {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    clItemExc.Close;
    clExp.Finaliza;
    clExp.Free;
    pnGauge1.visible:=false;
    clAux.desconect;
    clAux.Free;
    memoTarefas.lines.Add (' PRECOS DIF EXC...: OK - Total de registros..: '+form_n(indGauge,5));
    memoTarefas.refresh;
  end;
  clItemExc.Free;
  DeleteFile(nome_arquivo);
end;

procedure Tfrm_ImportaRetaguarda.ImportandoPrecosPromocionaisExcluidos; {*}
var
  clAux,clAux1: TClassAuxiliar;
  clExp: TClassExport;
  tipz,nome_arquivo: String;
  clItemExc: TClassTXT2;
  continua: Boolean;
  loja,tabela,grupo,subgrupo,produto,cor: Real;
  faixa: String;
  data1,data2: TDateTime;
begin
  clItemExc := TClassTXT2.Create;
  try
        {*************************************************************************************************************************************}
    nome_arquivo := trim(edtLocal.text)+'\PROMOEXC.'+form_nz(frm_principal.x_loja,3);
    clItemExc.Open   (nome_arquivo,KTA_LEITURA);
        {*************************************************************************************************************************************}
    continua:=true;
  except
    memoTarefas.lines.Add (' PRECOS PROMO EXC.: Arquivo '+nome_arquivo+' não encontrado');
    memoTarefas.refresh;
    continua:=false;
  end;
  if (continua) then
  begin
    clExp := TClassExport.Create;
    clExp.Inicializa;
    clExp.MontaEstruturaTabelaImportacao ('ESTOQUE','PRECOS_PROMOCIONAIS_EXCLUIDOS',clItemExc);
    if (chProgresso.checked) then
      pnGauge1.visible:=true;
    indGauge:=0;
    totGauge:=clItemExc.RecordCount;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
         {*******************************************************************}
    clExp.MontaComandoInsertNaTabela('PRECOS_PROMOCIONAIS_EXCLUIDOS',clAux);
         {*******************************************************************}
    while (not clItemExc.Feof) do
    begin
             {*******************************************************************}
      Application.ProcessMessages;
      clItemExc.Next; {*}
             {*******************************************************************}
      loja      := clItemExc.FieldByName('PP_LOJA');
      grupo     := clItemExc.FieldByName('PP_GRUP');
      subgrupo  := clItemExc.FieldByName('PP_SUBG');
      produto   := clItemExc.FieldByName('PP_PROD');
      cor       := clItemExc.FieldByName('PP_CORE');
      faixa     := clItemExc.FieldByName('PP_TAMA');
      tipz      := clItemExc.FieldByName('PP_TIPZ');
      data1     := clItemExc.FieldByName('PP_DAT1');
      data2     := clItemExc.FieldByName('PP_DAT2');
             {*******************************************************************}
      clAux1 := TClassAuxiliar.Create;
      clAux1.conect   ('VENDAS',self);
      clAux1.ClearSql;
      clAux1.AddParam ('SELECT PP_PRE1,PP_PRE2 FROM PRECOS_PROMOCIONAIS                          ');
      clAux1.AddParam ('WHERE (PP_LOJA='+floattostr(loja)+') AND                                 ');
      clAux1.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                ');
      clAux1.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                             ');
      clAux1.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                              ');
      clAux1.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                  ');
      clAux1.AddParam ('      (PP_TAMA='+chr(39)+faixa+chr(39)+') AND                            ');
      clAux1.AddParam ('      (PP_DAT1='+chr(39)+FormataDataVendas(data1)+chr(39)+') AND         ');
      clAux1.AddParam ('      (PP_DAT2='+chr(39)+FormataDataVendas(data2)+chr(39)+')             ');
      if (clAux1.Execute) then
        if (tipz='1') then
        begin
          if (clAux1.Result('PP_PRE2')<>0.00) then
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('UPDATE PRECOS_PROMOCIONAIS                                               ');
            clAux1.AddParam ('SET    PP_PRE1=0                                                         ');
            clAux1.AddParam ('WHERE (PP_LOJA='+floattostr(loja)+') AND                                 ');
            clAux1.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                ');
            clAux1.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                             ');
            clAux1.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                              ');
            clAux1.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                  ');
            clAux1.AddParam ('      (PP_TAMA='+chr(39)+faixa+chr(39)+') AND                            ');
            clAux1.AddParam ('      (PP_DAT1='+chr(39)+FormataDataVendas(data1)+chr(39)+') AND         ');
            clAux1.AddParam ('      (PP_DAT2='+chr(39)+FormataDataVendas(data2)+chr(39)+')             ');
            clAux1.Execute; {*}
          end
          else
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('DELETE FROM PRECOS_PROMOCIONAIS                                          ');
            clAux1.AddParam ('WHERE (PP_LOJA='+floattostr(loja)+') AND                                 ');
            clAux1.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                ');
            clAux1.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                             ');
            clAux1.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                              ');
            clAux1.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                  ');
            clAux1.AddParam ('      (PP_TAMA='+chr(39)+faixa+chr(39)+') AND                            ');
            clAux1.AddParam ('      (PP_DAT1='+chr(39)+FormataDataVendas(data1)+chr(39)+') AND         ');
            clAux1.AddParam ('      (PP_DAT2='+chr(39)+FormataDataVendas(data2)+chr(39)+')             ');
            clAux1.Execute; {*}
          end;
        end
        else
        if (tipz='2') then
          if (clAux1.Result('PP_PRE1')<>0.00) then
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('UPDATE PRECOS_PROMOCIONAIS                                               ');
            clAux1.AddParam ('SET    PP_PRE2=0                                                         ');
            clAux1.AddParam ('WHERE (PP_LOJA='+floattostr(loja)+') AND                                 ');
            clAux1.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                ');
            clAux1.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                             ');
            clAux1.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                              ');
            clAux1.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                  ');
            clAux1.AddParam ('      (PP_TAMA='+chr(39)+faixa+chr(39)+') AND                            ');
            clAux1.AddParam ('      (PP_DAT1='+chr(39)+FormataDataVendas(data1)+chr(39)+') AND         ');
            clAux1.AddParam ('      (PP_DAT2='+chr(39)+FormataDataVendas(data2)+chr(39)+')             ');
            clAux1.Execute; {*}
          end
          else
          begin
            clAux1.ClearSql;
            clAux1.AddParam ('DELETE FROM PRECOS_PROMOCIONAIS                                          ');
            clAux1.AddParam ('WHERE (PP_LOJA='+floattostr(loja)+') AND                                 ');
            clAux1.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                ');
            clAux1.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                             ');
            clAux1.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                              ');
            clAux1.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                  ');
            clAux1.AddParam ('      (PP_TAMA='+chr(39)+faixa+chr(39)+') AND                            ');
            clAux1.AddParam ('      (PP_DAT1='+chr(39)+FormataDataVendas(data1)+chr(39)+') AND         ');
            clAux1.AddParam ('      (PP_DAT2='+chr(39)+FormataDataVendas(data2)+chr(39)+')             ');
            clAux1.Execute; {*}
          end;
      clAux1.desconect;
      clAux1.Free;

             {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    clItemExc.Close;
    clExp.Finaliza;
    clExp.Free;
    pnGauge1.visible:=false;
    clAux.desconect;
    clAux.Free;
    memoTarefas.lines.Add (' PRECOS PROMO EXC.: OK - Total de registros..: '+form_n(indGauge,5));
    memoTarefas.refresh;
  end;
  clItemExc.Free;
  DeleteFile(nome_arquivo);
end;

procedure Tfrm_ImportaRetaguarda.ImportaTabelaUsers;
var
  arq: textfile;
  clAux,clAux1: TClassAuxiliar;
  continua: Boolean;
  total_novos,indfiltros: Integer;
  indGauge,totGauge: Integer;
  linha,nomearquivo: String;
  uscode,usalias,usname,uspassword,ussession,ustype: String;
  usdcad,usgrupo: String;
begin
  if (y_tipo_exportacao='T') then
  begin
    clAux1 := TClassAuxiliar.Create;
    clAux1.conect  ('VENDAS',self);
    clAux1.ClearSql;
    clAux1.AddParam ('DELETE FROM USERS');
    clAux1.Execute;
    clAux1.desconect;
    clAux1.Free;
  end;

  nomearquivo := trim(edtLocal.text)+'\USER.'+form_nz(frm_principal.x_loja,3);
  if (not FileExists(nomearquivo)) then
  begin
    memoTarefas.lines.Add (' '+form_tc2('USUARIOS',17,'.')+': Arquivo '+nomearquivo+' não encontrado');
    memoTarefas.refresh;
  end
  else
  begin
    if (chProgresso.checked) then
      gauge1.visible:=true;
    AssignFile(arq,nomearquivo);
    Reset(arq);
    totGauge:=0;
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    Reset (arq);
    indGauge:=0;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    total_novos := 0;
    while (not Eof(arq)) do
    begin
      ReadLn (arq,linha);
      linha  := linha + ';';
      uscode := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      usalias := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      usname := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      uspassword := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      ustype := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      usdcad := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      ussession := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      usgrupo := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
             {*********************************************************************}

      if (y_tipo_exportacao='T') then
      begin
        clAux1 := TClassAuxiliar.Create;
        clAux1.conect   ('VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam('INSERT INTO USERS(USCODE,USALIAS,USNAME,USPASSWORD,USTYPE,USDCAD,USSESSION,USGRUPO) ');
        clAux.AddParam('VALUES(:USCODE,:USALIAS,:USNAME,:USPASSWORD,:USTYPE,:USDCAD,:USSESSION,:USGRUPO)');
        clAux.consulta.parambyname('USCODE').AsFloat      := strtofloat(uscode);
        clAux.consulta.parambyname('USALIAS').AsString    := usalias;
        clAux.consulta.parambyname('USNAME').AsString     := usname;
        clAux.consulta.parambyname('USPASSWORD').AsString := uspassword;
        clAux.consulta.parambyname('USTYPE').AsString     := ustype;
        clAux.consulta.parambyname('USDCAD').AsDateTime   := strtodate(usdcad);
        clAux.consulta.parambyname('USSESSION').AsFloat   := strtofloat(ussession);
        clAux.consulta.parambyname('USGRUPO').AsFloat     := strtofloat(usgrupo);
        clAux.Execute;
        total_novos := total_novos + 1;
        clAux1.desconect;
        clAux1.Free;
      end
      else
      begin
        clAux1 := TClassAuxiliar.Create;
        clAux1.conect   ('VENDAS',self);
        clAux1.ClearSql;
        clAux1.AddParam ('SELECT * FROM USERS       ');
        clAux1.AddParam ('WHERE (USCODE='+uscode+') ');
        if (not clAux1.Execute) then
        begin
          clAux.ClearSql;
          clAux.AddParam('INSERT INTO USERS(USCODE,USALIAS,USNAME,USPASSWORD,USTYPE,USDCAD,USSESSION,USGRUPO) ');
          clAux.AddParam('VALUES(:USCODE,:USALIAS,:USNAME,:USPASSWORD,:USTYPE,:USDCAD,:USSESSION,:USGRUPO)');
          clAux.consulta.parambyname('USCODE').AsFloat      := strtofloat(uscode);
          clAux.consulta.parambyname('USALIAS').AsString    := usalias;
          clAux.consulta.parambyname('USNAME').AsString     := usname;
          clAux.consulta.parambyname('USPASSWORD').AsString := uspassword;
          clAux.consulta.parambyname('USTYPE').AsString     := ustype;
          clAux.consulta.parambyname('USDCAD').AsDateTime   := strtodate(usdcad);
          clAux.consulta.parambyname('USSESSION').AsFloat   := strtofloat(ussession);
          clAux.consulta.parambyname('USGRUPO').AsFloat     := strtofloat(usgrupo);
          clAux.Execute;
          total_novos := total_novos + 1;
        end
        else
        begin
          clAux.ClearSql;
          clAux.AddParam('UPDATE USERS SET               ');
          clAux.AddParam('       USCODE=:USCODE,         ');
          clAux.AddParam('       USALIAS=:USALIAS,       ');
          clAux.AddParam('       USNAME=:USNAME,         ');
          clAux.AddParam('       USPASSWORD=:USPASSWORD, ');
          clAux.AddParam('       USTYPE=:USTYPE,         ');
          clAux.AddParam('       USDCAD=:USDCAD,         ');
          clAux.AddParam('       USSESSION=:USSESSION,   ');
          clAux.AddParam('       USGRUPO=:USGRUPO        ');
          clAux.AddParam('WHERE (USCODE=:USCODE)         ');
          clAux.consulta.parambyname('USCODE').AsFloat      := strtofloat(uscode);
          clAux.consulta.parambyname('USALIAS').AsString    := usalias;
          clAux.consulta.parambyname('USNAME').AsString     := usname;
          clAux.consulta.parambyname('USPASSWORD').AsString := uspassword;
          clAux.consulta.parambyname('USTYPE').AsString     := ustype;
          clAux.consulta.parambyname('USDCAD').AsDateTime   := strtodate(usdcad);
          clAux.consulta.parambyname('USSESSION').AsFloat   := strtofloat(ussession);
          clAux.consulta.parambyname('USGRUPO').AsFloat     := strtofloat(usgrupo);
          clAux.Execute;
        end;
        clAux1.desconect;
        clAux1.Free;
      end;

             {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    gauge1.visible:=false;
    clAux.desconect;
    clAux.Free;
    memoTarefas.lines.Add (' '+form_tc2('USUARIOS',17,'.')+': OK - Total de registros..: '+form_n(indGauge,5)+
      ' Incluídos...: '+form_n(total_novos,5));
    memoTarefas.refresh;
    CloseFile(arq);
    DeleteFile(nomearquivo);
  end;
end;

procedure Tfrm_ImportaRetaguarda.DescompactarArquivo;
var
  result: Integer;
  arq: textfile;
begin
     {Descompactando o arquivo  ***}
  SetCurrentDir(edtLocal.text);
  AssignFile (arq, 'DESCOMP.BAT');
  ReWrite    (arq);
//  WriteLn    (arq, pathCompactadoresDOS+'\PKUNZIP -o ESTOQ'+form_nz(frm_principal.x_loja,3)+'.ZIP');
//  WriteLn    (arq, pathCompactadoresDOS+'\rar a  VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.zip *.'+form_nz(frm_principal.x_loja,3));

  WriteLn    (arq, pathCompactadoresDOS+'\rar e ESTOQ'+form_nz(frm_principal.x_loja,3)+'.ZIP');
  CloseFile  (arq);
  result := winexec ('DESCOMP.BAT',1);
  if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
    showmessage('Não foi possível descompactar o arquivo ESTOQ'+form_nz(frm_principal.x_loja,3)+'.ZIP. Tente descompactar o arquivo através de outro programa!');
end;

procedure Tfrm_ImportaRetaguarda.ImportaTabelaCBarras;
var
  arq: textfile;
  clAux,clAux1: TClassAuxiliar;
  continua: Boolean;
  total_novos,indfiltros: Integer;
  indGauge,totGauge: Integer;
  linha,nomearquivo: String;
  campo,espaco: String;
begin
  nomearquivo := trim(edtLocal.text)+'\CBARRA.'+form_nz(frm_principal.x_loja,3);
  if (FileExists(nomearquivo)) then
  begin
    clAux1 := TClassAuxiliar.Create;
    clAux1.conect   ('VENDAS',self);
    clAux1.ClearSql;
    clAux1.AddParam ('DELETE FROM CONFIG_CODIGO_BARRAS  ');
    clAux1.Execute; {*}
    clAux1.desconect;
    clAux1.Free;

    if (chProgresso.checked) then
      gauge1.visible:=true;
    AssignFile(arq,nomearquivo);
    Reset(arq);
    totGauge:=0;
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    Reset (arq);
    indGauge:=0;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    total_novos := 0;
    while (not Eof(arq)) do
    begin
      ReadLn (arq,linha);
      linha  := linha + ';';
      campo := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      espaco := Copy(linha,1,Pos(';',linha)-1);
             {*********************************************************************}
      clAux.ClearSql;
      clAux.AddParam('INSERT INTO CONFIG_CODIGO_BARRAS(CAMPO,ESPACO) ');
      clAux.AddParam('VALUES(:CAMPO,:ESPACO)');
      clAux.consulta.parambyname('CAMPO').AsInteger  := strtoint(campo);
      clAux.consulta.parambyname('ESPACO').AsInteger := strtoint(espaco);
      clAux.Execute;
      total_novos := total_novos + 1;
             {*********************************************************************}

             {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    gauge1.visible:=false;
    clAux.desconect;
    clAux.Free;
    memoTarefas.lines.Add (' '+form_tc2('CONFIG. C.BARRA',17,'.')+': OK - Total de registros..: '+form_n(indGauge,5)+
      ' Incluídos...: '+form_n(total_novos,5));
    memoTarefas.refresh;
    CloseFile(arq);
    DeleteFile(nomearquivo);
  end;
end;

procedure Tfrm_ImportaRetaguarda.ImportaSequenciaisVendas;
var
  clConf: TClassAuxiliar;
  arq: textfile;
  linha,nomearquivo: String;
  terminal,sequencial: String;
  sequencial_importado: Real;
begin
  nomearquivo := trim(edtLocal.text)+'\SEQVENDA.'+form_nz(frm_principal.x_loja,3);
  if (not FileExists(nomearquivo)) then
  begin
    memoTarefas.lines.Add (' '+form_tc2('SEQS. DE VENDA',17,'.')+': Arquivo '+nomearquivo+' não encontrado');
    memoTarefas.refresh;
  end
  else
  begin
    AssignFile(arq,nomearquivo);
    Reset(arq);
    while (not Eof(arq)) do
    begin
      ReadLn (arq,linha);
      linha  := linha + ';';
      terminal   := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      sequencial := Copy(linha,1,Pos(';',linha)-1);
      if (trim(terminal)=floattostr(frm_principal.x_terminal)) then
        if (not frm_principal.x_online) then //somente para sistema OFF-LINE
        begin
                       {**************************************************************}
          sequencial_importado := strtofloat(trim(sequencial));
                       {**************************************************************}
          if (sequencial_importado<frm_principal.x_codigo_venda) then //ERRO SERIO!!!!!
          begin
            frm_ALERTA.memo1.lines.clear;
            frm_ALERTA.memo1.lines.Add('Erro: O código da última venda não pode ser menor que ');
            frm_ALERTA.memo1.lines.Add('      que a última venda lançada! ');
            frm_ALERTA.memo1.lines.Add('      No escritório provavelmente não consta a última ');
            frm_ALERTA.memo1.lines.Add('      venda lançada pelo sistema! ');
            frm_ALERTA.showmodal;
                            {...}
            frm_ALERTA.memo1.lines.clear;
            frm_ALERTA.memo1.lines.Add('Aviso: O sequencial de venda permanecerá inalterado! ');
            frm_ALERTA.showmodal;
                            {...}
          end
          else
          begin
                           {**************************************************************}
            frm_principal.x_codigo_venda := sequencial_importado;
            frm_principal.lblSeq.color   := clTeal;
            frm_principal.lblSeq.caption := 'Última Venda: '+floattostr(frm_principal.x_codigo_venda);
                           {**************************************************************}
            clConf := TClassAuxiliar.Create;
            clConf.conect   ('C:\NATIVA',self);
            clConf.ClearSql;
            clConf.AddParam ('UPDATE SEQVENDAS.DBF SET ULTIMA_VENDA=:ultima_venda');
            clConf.consulta.parambyname('ultima_venda').AsFloat := frm_principal.x_codigo_venda;
            clConf.Execute;
            clConf.desconect;
            clConf.Free;
                           {**************************************************************}
          end;
        end;
    end;
    gauge1.visible:=false;
    if (not frm_principal.x_online) then
      memoTarefas.lines.Add (' '+form_tc2('SEQS. DE VENDA',17,'.')+': OK - Sequencial atualizado ');
    memoTarefas.refresh;
    CloseFile(arq);
    DeleteFile(nomearquivo);
  end;
end;

procedure Tfrm_ImportaRetaguarda.ImportaTabelaConf;
var
  arq: textfile;
  clAux: TClassAuxiliar;
  linha,nomearquivo: String;
  campo1,campo2,campo3,campo4,campo5,campo6,campo7,campo8,campo9,campo10,campo11: String;
  campo12,campo13,campo14,campo15,campo16,campo17,campo18,campo19,campo20,campo21: String;
  campo22,campo23,campo24,campo25,campo26,campo27,campo28,campo29,campo30,campo31,campo32: String;
begin
  nomearquivo := trim(edtLocal.text)+'\CONF.'+form_nz(frm_principal.x_loja,3);
  if (FileExists(nomearquivo)) then
  begin
    if (chProgresso.checked) then
      gauge1.visible:=true;
    AssignFile(arq,nomearquivo);
    Reset(arq);
    {*********************************************************************}
    ReadLn (arq,linha);
    linha:=linha;
    campo1 := Copy(linha,1,1);
    campo2 := Copy(linha,3,1);
    campo3 := Copy(linha,5,1);
    campo4 := Copy(linha,7,1);
    campo5 := Copy(linha,9,1);
    campo6 := Copy(linha,11,1);
    campo7 := Copy(linha,13,1);
    campo8 := Copy(linha,15,1);
    campo9 := Copy(linha,17,1);
    campo10 := Copy(linha,19,1);
    campo11 := Copy(linha,21,1);
    campo12 := Copy(linha,23,10);
    campo13 := Copy(linha,34,10);
    campo14 := Copy(linha,45,10);
    campo15 := Copy(linha,56,10);
    campo16 := Copy(linha,67,10);
    campo17 := Copy(linha,78,10);
    campo18 := Copy(linha,89,10);
    campo19 := Copy(linha,100,10);
    campo20 := Copy(linha,111,10);
    campo21 := Copy(linha,122,1);
    campo22 := Copy(linha,124,1);
    campo23 := Copy(linha,126,3);
    campo24 := Copy(linha,130,1);
    campo25 := Copy(linha,132,3);
    campo26 := Copy(linha,136,1);
    campo27 := Copy(linha,138,1);
    campo28 := Copy(linha,140,1);
    campo29 := Copy(linha,142,10);
    campo30 := Copy(linha,153,1);
    campo31 := Copy(linha,155,1);
    campo32 := Copy(linha,157,1);
    {*********************************************************************}
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('UPDATE CONF                             ');
    clAux.AddParam ('SET ADICIONA_DV_CODIGO_BARRAS=:campo1,  ');
    clAux.AddParam ('    ORDEM_CODIGO=:campo2,               ');
    clAux.AddParam ('    ORDEM_REFINTERNA=:campo3,           ');
    clAux.AddParam ('    ORDEM_REFFABRIC=:campo4,            ');
    clAux.AddParam ('    ORDEM_CBARRA=:campo5,               ');
    clAux.AddParam ('    ORDEM_PROD_COR_TAM=:campo6,         ');
    clAux.AddParam ('    PERM_CANC_VENDA_CUPOM=:campo7,      ');
    clAux.AddParam ('    VALES_EMITIDO=:campo8,              ');
    clAux.AddParam ('    VALES_RECEBIDO=:campo9,             ');
    clAux.AddParam ('    VALES_MERCADORIA=:campo10,          ');
    clAux.AddParam ('    EXIBIR_ITENS=:campo11,              ');
    clAux.AddParam ('    FAIXAINI1=:campo12,                 ');
    clAux.AddParam ('    FAIXAINI2=:campo13,                 ');
    clAux.AddParam ('    FAIXAINI3=:campo14,                 ');
    clAux.AddParam ('    FAIXAFIM1=:campo15,                 ');
    clAux.AddParam ('    FAIXAFIM2=:campo16,                 ');
    clAux.AddParam ('    FAIXAFIM3=:campo17,                 ');
    clAux.AddParam ('    DESC1=:campo18,                     ');
    clAux.AddParam ('    DESC2=:campo19,                     ');
    clAux.AddParam ('    DESC3=:campo20,                     ');
    clAux.AddParam ('    TIPOFAIXA=:campo21,                 ');
    clAux.AddParam ('    USARFAIXA=:campo22,                 ');
    clAux.AddParam ('    VALIDADE_VALES=:campo23,            ');
    clAux.AddParam ('    SOMA_VALEFUNC_TOTAL_VENDA=:campo24, ');
    clAux.AddParam ('    PRAZO_VENDAS=:campo25,              ');
    clAux.AddParam ('    EXIBIR_DEVOLUCAO=:campo26,          ');
    clAux.AddParam ('    EXIBIR_TROCA=:campo27,              ');
    clAux.AddParam ('    BLOQUEIA_VENDA_VALOR=:campo28,      ');
    clAux.AddParam ('    VALOR_BLOQUEIO_VENDA=:campo29,      ');
    clAux.AddParam ('    EXIBE_FORNECEDOR_CONSULTA=:campo30, ');
    clAux.AddParam ('    IMPRIME_VENDEDOR_CUPOM=:campo31,    ');
    clAux.AddParam ('    EXIBE_PRECO_CUSTO=:campo32          ');

    clAux.consulta.parambyname('campo1').AsString    := campo1;
    clAux.consulta.parambyname('campo2').AsInteger   := strtoint(trim(campo2));
    clAux.consulta.parambyname('campo3').AsInteger   := strtoint(trim(campo3));
    clAux.consulta.parambyname('campo4').AsInteger   := strtoint(trim(campo4));
    clAux.consulta.parambyname('campo5').AsInteger   := strtoint(trim(campo5));
    clAux.consulta.parambyname('campo6').AsInteger   := strtoint(trim(campo6));
    clAux.consulta.parambyname('campo7').AsString    := trim(campo7);
    clAux.consulta.parambyname('campo8').AsString    := trim(campo8);
    clAux.consulta.parambyname('campo9').AsString    := trim(campo9);
    clAux.consulta.parambyname('campo10').AsString   := trim(campo10);
    clAux.consulta.parambyname('campo11').AsString   := trim(campo11);
    clAux.consulta.parambyname('campo12').Asfloat    := StrToFloat(trim(campo12));
    clAux.consulta.parambyname('campo13').Asfloat    := StrToFloat(trim(campo13));
    clAux.consulta.parambyname('campo14').Asfloat    := StrToFloat(trim(campo14));
    clAux.consulta.parambyname('campo15').AsFloat    := StrToFloat(trim(campo15));
    clAux.consulta.parambyname('campo16').AsFloat    := StrToFloat(trim(campo16));
    clAux.consulta.parambyname('campo17').AsFloat    := StrToFloat(trim(campo17));
    clAux.consulta.parambyname('campo18').AsFloat    := StrToFloat(trim(campo18));
    clAux.consulta.parambyname('campo19').AsFloat    := StrToFloat(trim(campo19));
    clAux.consulta.parambyname('campo20').AsFloat    := StrToFloat(trim(campo20));
    clAux.consulta.parambyname('campo21').AsString   := trim(campo21);
    clAux.consulta.parambyname('campo22').AsString   := trim(campo22);
    clAux.consulta.parambyname('campo23').AsString   := trim(campo23);
    clAux.consulta.parambyname('campo24').AsString   := trim(campo24);
    clAux.consulta.parambyname('campo25').AsString   := trim(campo25);
    clAux.consulta.parambyname('campo26').AsString   := trim(campo26);
    clAux.consulta.parambyname('campo27').AsString   := trim(campo27);
    clAux.consulta.ParamByName('campo28').AsString   := Trim(campo28);
    clAux.consulta.ParamByName('campo29').AsFloat    := StrToFloat(Trim(campo29));
    clAux.consulta.ParamByName('campo30').AsString   := Trim(campo30);
    clAux.consulta.ParamByName('campo31').AsString   := Trim(campo31);
    clAux.consulta.ParamByName('campo32').AsString   := Trim(campo32);

    clAux.Execute;
    clAux.desconect;
    clAux.Free;
    {*********************************************************************}
    if (campo1='0') then
      frm_principal.x_adiciona_dv_codigo_barras := false
    else
    if (campo1='1') then
      frm_principal.x_adiciona_dv_codigo_barras := true;
    frm_principal.x_ordem_codigo       := strtoint(trim(campo2));
    frm_principal.x_ordem_refinterna   := strtoint(trim(campo3));
    frm_principal.x_ordem_reffabric    := strtoint(trim(campo4));
    frm_principal.x_ordem_cbarra       := strtoint(trim(campo5));
    frm_principal.x_ordem_prod_cor_tam := strtoint(trim(campo6));
    if (trim(campo7)='1') then
      frm_principal.x_permitir_cancelar_venda_com_cupom := true
    else
    if (trim(campo7)='0') then
      frm_principal.x_permitir_cancelar_venda_com_cupom := false;

    if (Trim(campo8)='1') then
      frm_principal.x_comissao_vales_emitidos := true
    else
    if (trim(campo8)='0') then
      frm_principal.x_comissao_vales_emitidos := false;

    if (Trim(campo9)='1') then
      frm_principal.x_comissao_vales_recebidos := true
    else
    if (trim(campo9)='0') then
      frm_principal.x_comissao_vales_recebidos := false;

    if (Trim(campo10)='1') then
      frm_principal.x_comissao_vales_mercadoria := true
    else
    if (trim(campo10)='0') then
      frm_principal.x_comissao_vales_mercadoria := false;

    if (Trim(campo11)='1') then
      frm_principal.x_exibir_itens := true
    else
    if (trim(campo11)='0') then
      frm_principal.x_exibir_itens := false;

    frm_principal.x_faixaini1 := StrToFloat(Trim(campo12));
    frm_principal.x_faixaini2 := StrToFloat(Trim(campo13));
    frm_principal.x_faixaini3 := StrToFloat(Trim(campo14));
    frm_principal.x_faixafim1 := StrToFloat(Trim(campo15));
    frm_principal.x_faixafim2 := StrToFloat(Trim(campo16));
    frm_principal.x_faixafim3 := StrToFloat(Trim(campo17));
    frm_principal.x_desc1 := StrToFloat(Trim(campo18));
    frm_principal.x_desc2 := StrToFloat(Trim(campo19));
    frm_principal.x_desc3 := StrToFloat(Trim(campo20));
    frm_principal.x_tipofaixa := Trim(campo21);
    if (Trim(campo22)='1') then
      frm_principal.x_usarfaixa := true
    else
    if (trim(campo22)='0') then
      frm_principal.x_usarfaixa := false;
    frm_principal.x_validade_vales := Trim(campo23);
    if (Trim(campo24)='1') then
      frm_principal.x_soma_valefunc_total_venda := true
    else
    if (trim(campo24)='0') then
      frm_principal.x_soma_valefunc_total_venda := false;
    frm_principal.x_prazo_vendas := campo25;

    if (Trim(campo16)='1') then
      frm_principal.x_exibir_itens := true
    else
    if (trim(campo11)='0') then
      frm_principal.x_exibir_itens := false;

    if (Trim(campo11)='1') then
      frm_principal.x_exibir_itens := true
    else
    if (trim(campo11)='0') then
      frm_principal.x_exibir_itens := false;

    if (Trim(campo28) = '1') then
      frm_principal.x_bloqueia_venda_valor := true
    else if (Trim(campo28) = '0') then
      frm_principal.x_bloqueia_venda_valor := false;

    frm_principal.x_valor_bloqueio_venda := StrToFloat(Trim(campo29));

    if (Trim(campo30) = '1') then
      frm_principal.x_exibe_fornecedor_consulta := true
    else if (Trim(campo30) = '0') then
      frm_principal.x_exibe_fornecedor_consulta := false;

    if (Trim(campo31) = '1') then
      frm_principal.x_imprime_vendedor_cupom := true
    else if (Trim(campo31) = '0') then
      frm_principal.x_imprime_vendedor_cupom := false;

    if (Trim(campo32)='1') then
      frm_principal.x_exibe_preco_custo := true
    else
    if (trim(campo32)='0') then
      frm_principal.x_exibe_preco_custo := false;


    {*********************************************************************}
    memoTarefas.lines.Add (' '+form_tc2('CONF...........',17,'.')+': OK ');
    memoTarefas.refresh;
    {*********************************************************************}
    CloseFile(arq);
    DeleteFile(nomearquivo);
  end;
end;

procedure Tfrm_ImportaRetaguarda.FormCreate(Sender: TObject);
begin
  pathCompactadores    := UpperCase(frm_principal.x_pathsystem);
  pathCompactadoresDOS := pathCompactadores;
  if (Pos('ARQUIVOS DE PROGRAMAS',pathCompactadores)<>0) then
  begin
    unidadeCompactadores := Copy(pathCompactadores,1,1);
    pathCompactadoresDOS := unidadeCompactadores+':\ARQUIV~1\NATIVA\VENDAS';
  end
  else
  if (Length(pathCompactadores)>11) then //QUANDO FOR UMA PASTA SO
  begin
    unidadeCompactadores := Copy(pathCompactadores,1,1);
    pathCompactadoresDOS := Copy(pathCompactadores,4,100);
    pathCompactadoresDOS := unidadeCompactadores+':\'+Copy(pathCompactadoresDOS,1,6)+'~1';
  end;   
  chProgresso.checked := frm_principal.x_exibe_progresso_movimento;
  lblLoja.caption:='Loja: '+form_nz(frm_principal.x_loja,2)+'-'+
    form_t(ProcuraNomeLoja(frm_principal.x_loja,self),15);     
  ListaDiretorio.directory := trim(edtLocal.text);
  y_tipo_exportacao:='?';
  pg1.activepage:=pagina1;
end;

procedure Tfrm_ImportaRetaguarda.VerificaTipoExportacao;
var
  arq: textfile;
  data1,data2,linha: String;
begin
  if (FileExists(y_pathlocal+'\TIPOEXPO.'+form_nz(frm_principal.x_loja,3))) then
  begin
    SetCurrentDir(y_pathlocal);
    AssignFile (arq,'TIPOEXPO.'+form_nz(frm_principal.x_loja,3));
    Reset      (arq);
    while (not Eof(arq)) do
    begin
      Readln (arq,linha);
      if (trim(linha)='Exportacao=TOTAL') then
      begin
        y_tipo_exportacao:='T';
        memoTarefas.lines.add(' Tipo de exportação...: TOTAL');
      end
      else
      if (trim(linha)='Exportacao=PARCIAL') then
      begin
        y_tipo_exportacao:='P';
        memoTarefas.lines.add(' Tipo de exportação...: PARCIAL');
        ReadLn (arq,linha);
        data1:=Copy(linha,12,10);
        ReadLn (arq,linha);
        data2:=Copy(linha,9,10);
        memoTarefas.lines.add(' Periodo de exportação: '+data1+' a '+data2);
      end;
    end;
    CloseFile  (arq);
    DeleteFile('TIPOEXPO.'+form_nz(frm_principal.x_loja,3));
  end;
end;

procedure Tfrm_ImportaRetaguarda.ImportandoProdutosExc;
var
  clAux: TClassAuxiliar;
  arq: textfile;
  linha: String;
  grupo,subgrupo,produto: String;
  indGauge,totGauge: Integer;
begin
  if (FileExists(y_pathlocal+'\PRODEXC.'+form_nz(frm_principal.x_loja,3))) then
  begin
    SetCurrentDir(y_pathlocal);
    AssignFile (arq,'PRODEXC.'+form_nz(frm_principal.x_loja,3));
    Reset      (arq);
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM PRODUTOS ');
    clAux.AddParam ('WHERE (PR_GRUP=:grupo) AND (PR_SUBG=:subgrupo) AND (PR_CODI=:produto) ');
    if (chProgresso.checked) then
      gauge1.progress:=0;
    indGauge:=0;
    while (not Eof(arq)) do
    begin
      Readln(arq,linha);
      grupo := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      subgrupo := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      produto := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      clAux.consulta.parambyname('grupo').AsFloat    := strtofloat(grupo);
      clAux.consulta.parambyname('subgrupo').AsFloat := strtofloat(subgrupo);
      clAux.consulta.parambyname('produto').AsFloat  := strtofloat(produto);
      clAux.Execute;

              {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    clAux.desconect;
    clAux.Free;
    CloseFile(arq);
    DeleteFile('PRODEXC.'+form_nz(frm_principal.x_loja,3));
  end;
end;

procedure Tfrm_ImportaRetaguarda.ImportandoProdutosFaixasExc;
var
  clAux: TClassAuxiliar;
  arq: textfile;
  linha: String;
  grupo,subgrupo,produto,tamanho: String;
  indGauge,totGauge: Integer;
begin
  if (FileExists(y_pathlocal+'\PROFXEXC.'+form_nz(frm_principal.x_loja,3))) then
  begin
    SetCurrentDir(y_pathlocal);
    AssignFile (arq,'PROFXEXC.'+form_nz(frm_principal.x_loja,3));
    Reset      (arq);
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM PRODUTOS_FAIXAS ');
    clAux.AddParam ('WHERE (PF_GRUP=:grupo) AND (PF_SUBG=:subgrupo) AND (PF_PROD=:produto) AND (PF_TAMA=:tamanho) ');
    if (chProgresso.checked) then
      gauge1.progress:=0;
    indGauge:=0;
    while (not Eof(arq)) do
    begin
      Readln(arq,linha);
      grupo := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      subgrupo := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      produto := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      tamanho := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      clAux.consulta.parambyname('grupo').AsFloat    := strtofloat(grupo);
      clAux.consulta.parambyname('subgrupo').AsFloat := strtofloat(subgrupo);
      clAux.consulta.parambyname('produto').AsFloat  := strtofloat(produto);
      clAux.consulta.parambyname('tamanho').AsString := tamanho;
      clAux.Execute;

              {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    clAux.desconect;
    clAux.Free;
    CloseFile(arq);
    DeleteFile('PROFXEXC.'+form_nz(frm_principal.x_loja,3));
  end;
end;

procedure Tfrm_ImportaRetaguarda.ImportandoEstoqueExc;
var
  clAux: TClassAuxiliar;
  arq: textfile;
  linha: String;
  grupo,subgrupo,produto,cor,tamanho: String;
  indGauge,totGauge: Integer;
begin
  if (FileExists(y_pathlocal+'\ESTEXC.'+form_nz(frm_principal.x_loja,3))) then
  begin
    SetCurrentDir(y_pathlocal);
    AssignFile (arq,'ESTEXC.'+form_nz(frm_principal.x_loja,3));
    Reset      (arq);
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM ESTOQUE ');
    clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND (ES_SUBG=:subgrupo) AND (ES_PROD=:produto) AND ');
    clAux.AddParam ('      (ES_CORE=:cor) AND (ES_TAMA=:tamanho) ');
    if (chProgresso.checked) then
      gauge1.progress:=0;
    indGauge:=0;
    while (not Eof(arq)) do
    begin
      Readln(arq,linha);
      grupo := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      subgrupo := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      produto := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      cor := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      tamanho := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      clAux.consulta.parambyname('grupo').AsFloat    := strtofloat(grupo);
      clAux.consulta.parambyname('subgrupo').AsFloat := strtofloat(subgrupo);
      clAux.consulta.parambyname('produto').AsFloat  := strtofloat(produto);
      clAux.consulta.parambyname('cor').AsFloat      := strtofloat(cor);
      clAux.consulta.parambyname('tamanho').AsString := tamanho;
      clAux.Execute;

      {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    clAux.desconect;
    clAux.Free;
    CloseFile(arq);
    DeleteFile('ESTEXC.'+form_nz(frm_principal.x_loja,3));
  end;
end;

procedure Tfrm_ImportaRetaguarda.ListaDiretorioChange(Sender: TObject);
begin
  y_pathlocal := ListaDiretorio.Directory;
  edtLocal.text := y_pathlocal;
end;

procedure Tfrm_ImportaRetaguarda.btnReceberFtpxClick(Sender: TObject);
var
  codloja: String;
begin
  Application.CreateForm (Tfrm_ImportaFTP,frm_ImportaFTP);
  codloja:=form_nz(frm_principal.x_loja,3);
  frm_ImportaFTP.flag          := false;
  frm_ImportaFTP.arquivoLocal  := Pchar(trim(edtLocal.text)+'\ESTOQ'+codloja+'.ZIP');
  frm_ImportaFTP.arquivoRemoto := Pchar('ESTOQ'+codloja+'.ZIP');
  frm_ImportaFTP.showmodal;
  frm_ImportaFTP.Free;
end;

procedure Tfrm_ImportaRetaguarda.btnDescompactarxClick(Sender: TObject);
var
  codigoloja: real;
begin
  //DescompactarArquivo;
  codigoloja     := ((frm_principal.x_loja));
  //DecompressFiles('C:\Nativa\VENDAS\MOVIMENTO\ESTOQ'+form_nz(codigoloja,2)+'XX.ZIP','C:\Nativa\VENDAS\MOVIMENTO\');
  DecompressFiles2('C:\Nativa\VENDAS\MOVIMENTO\ESTOQ'+form_nz(codigoloja,2)+'XX.ZIP','C:\Nativa\VENDAS\MOVIMENTO\');
  showmessage('Arquivo descompactado com sucesso!');
end;

procedure Tfrm_ImportaRetaguarda.btnAvancar1Click(Sender: TObject);
begin
  pg1.activepage:=pagina2;
  btnReceberFtp.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.btnFechar1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ImportaRetaguarda.edtLocalEnter(Sender: TObject);
begin
  edtLocal.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.edtLocalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    BitbtnAvancar1.click;
end;

procedure Tfrm_ImportaRetaguarda.btnAvancar2Click(Sender: TObject);
begin
  if (not FileExists(trim(edtLocal.text)+'\ESTOQ'+form_nz(frm_principal.x_loja,3)+'.ZIP')) then
    ExibeCritica ('Não há arquivo de importação na pasta selecionada!','Vendas',nil)
  else
  if (Application.MessageBox('Confirma o início da importação de produtos?','',4+32)=6) then
  begin
    pnLogo.visible:=false;
    pg1.activepage:=pagina3;

    PreparandoSinalizacao;
    try
      ImportarMovimento;
      SinalizandoSucesso;
      showmessage ('Importação concluída com sucesso!');
    except
      on E: Exception do
      begin
        showmessage ('Ocorreu um erro na importação de movimento: '+#13+E.Message);
        frm_ImportaRetaguarda.MemoErros.lines.Add('');
        frm_ImportaRetaguarda.MemoErros.lines.Add(' '+E.Message);
        SinalizandoFracasso;
      end;
    end;
  end;
end;

procedure Tfrm_ImportaRetaguarda.btnFechar2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ImportaRetaguarda.btnVoltar2Click(Sender: TObject);
begin
  pg1.activepage:=pagina1;
  edtLocal.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.btnVoltar3Click(Sender: TObject);
begin
  pnLogo.visible:=true;
  pg1.activepage:=pagina2;
  btnReceberFtp.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.edtLocalChange(Sender: TObject);
begin
  y_pathlocal := trim(edtLocal.text);
end;

procedure Tfrm_ImportaRetaguarda.SinalizandoSucesso;
begin
  lblCopiando.visible   := false;
  lblCopiando.refresh;

  gauge1.visible        := false;

  EXPORTACAO_SUCESSO    := true;

  label9.visible        := true;
  timerMensagem.enabled := true;
  pnMensagem.visible    := true;
end;

procedure Tfrm_ImportaRetaguarda.SinalizandoFracasso;
begin
  lblCopiando.visible   := false;
  lblCopiando.refresh;

  gauge1.visible        := false;

  EXPORTACAO_SUCESSO    := false;

  label9.visible        := true;
  timerMensagem.enabled := true;
  pnMensagem.visible    := true;
end;

procedure Tfrm_ImportaRetaguarda.PreparandoSinalizacao;
begin
  timerMensagem.enabled := false;

  lblCopiando.visible := true;
  lblCopiando.refresh;

  label9.visible      := false;
  pnMensagem.visible  := false;
  pnSucesso.visible   := false;
  pnFracasso.visible  := false;
end;

procedure Tfrm_ImportaRetaguarda.timerMensagemTimer(Sender: TObject);
begin
  if (EXPORTACAO_SUCESSO) then
  begin
    pnFracasso.visible := false;
    if (pnSucesso.visible) then
      pnSucesso.visible:=false
    else
      pnSucesso.visible:=true;
  end
  else
  begin
    pnSucesso.visible  := false;
    if (pnFracasso.visible) then
      pnFracasso.visible:=false
    else
      pnFracasso.visible:=true;
  end;
end;

procedure Tfrm_ImportaRetaguarda.btnReceberFtpClick(Sender: TObject);
var
  codloja: String;
begin
  Application.CreateForm (Tfrm_ImportaFTP,frm_ImportaFTP);
  codloja:=form_nz(frm_principal.x_loja,3);
  frm_ImportaFTP.flag          := false;
  frm_ImportaFTP.arquivoLocal  := Pchar(trim(edtLocal.text)+'\ESTOQ'+codloja+'.ZIP');
  frm_ImportaFTP.arquivoRemoto := Pchar('ESTOQ'+codloja+'.ZIP');
  frm_ImportaFTP.showmodal;
  frm_ImportaFTP.Free;
end;
procedure Tfrm_ImportaRetaguarda.DecompressionProgress(Sender: TObject);
begin
  Label2.Caption := CurrToStrF(((Sender as TDecompressionStream).Position * 100) / nMax,ffNumber,0);
  Application.ProcessMessages;
end;
procedure Tfrm_ImportaRetaguarda.DecompressFiles(FileName, Destination: String);
var
  InFile, OutFile: TFilestream;
  Decompr: TDecompressionStream;
  S: String;
  I,L,C: Integer;
begin
  Destination := IncludeTrailingPathDelimiter(Destination);
  InFile      := TFileStream.Create(FileName,fmOpenRead or fmShareDenyNone);
  try
    { Pega o número de arquivos }
    InFile.Read(C,SizeOf(C));
    for I := 1 to C do
    begin
      Label1.Caption := 'Descomprimindo: '+IntToStr(I)+' de '+IntToStr(C);
      { Pega o nome do arquivo }
      InFile.Read(L,SizeOf(L));
      SetLength(S,L);
      InFile.Read(S[1],L);
      { Lê o tamanho do arquivo }
      InFile.Read(L,SizeOf(L));
      { Progresso do arquivo atual. Não se pode ler Decompr.Size, dá erro, por isso utilizamos L }
      nMax := L;
      if not (S = 'C:\Nativa\ESTOQUE\') then
      begin
      { Descompacta e grava o arquivo no disco }
      S := Destination+S; // Adiciona o caminho do arquivo
      OutFile := TFileStream.Create(S,fmCreate or fmShareExclusive);
      Decompr := TDecompressionStream.Create(InFile);
      Decompr.OnProgress := DecompressionProgress;
      try
        OutFile.CopyFrom(Decompr,L);
      finally
        OutFile.Free;
        Decompr.Free;
      end;
      end;
    end;
    Label1.Caption := '';
    Label2.Caption := '';
  finally
    InFile.Free;
  end;
end;

procedure Tfrm_ImportaRetaguarda.DescompactarClick(Sender: TObject);
var
  codigoloja: real;
begin
  //DescompactarArquivo;
  codigoloja     := ((frm_principal.x_loja));
  //DecompressFiles('C:\Nativa\VENDAS\MOVIMENTO\ESTOQ'+form_nz(codigoloja,2)+'XX.ZIP','C:\Nativa\VENDAS\MOVIMENTO\');
//  DecompressFiles2('C:\Nativa\VENDAS\MOVIMENTO\ESTOQ'+form_nz(codigoloja,2)+'XX.ZIP','C:\Nativa\VENDAS\MOVIMENTO\');  { Ex. ESTOQ02XX.ZIP }
  DecompressFiles2('C:\Nativa\VENDAS\MOVIMENTO\ESTOQ'+form_nz(codigoloja,3)+'.ZIP','C:\Nativa\VENDAS\MOVIMENTO\');    { Ex. ESTOQ002.ZIP }
  showmessage('Arquivo descompactado com sucesso!');
end;

procedure Tfrm_ImportaRetaguarda.BitBtnVoltarClick(Sender: TObject);
begin
  pg1.activepage:=pagina1;
  edtLocal.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.BitBtnFecharClick(Sender: TObject);
begin
  close;
  frm_ImportaRetaguarda.Free;
end;

procedure Tfrm_ImportaRetaguarda.BitBtnAvancarClick(Sender: TObject);
var
  Path : String;
begin
//  Path := trim(edtLocal.text)+'\ESTOQ'+form_nz(frm_principal.x_loja,2)+'XX.zip';
  Path := trim(edtLocal.text)+'\ESTOQ'+form_nz(frm_principal.x_loja,3)+'.ZIP';
  if (not FileExists(Path)) then
    ExibeCritica ('Não há arquivo de importação na pasta selecionada!','Vendas',nil)
  else
  if (Application.MessageBox('Confirma o início da importação de produtos?','',4+32)=6) then
  begin
    pnLogo.visible:=false;
    pg1.activepage:=pagina3;

    PreparandoSinalizacao;
    try
      ImportarMovimento;
      SinalizandoSucesso;
      showmessage ('Importação concluída com sucesso!');
    except
      on E: Exception do
      begin
        showmessage ('Ocorreu um erro na importação de movimento: '+#13+E.Message);
        frm_ImportaRetaguarda.MemoErros.lines.Add('');
        frm_ImportaRetaguarda.MemoErros.lines.Add(' '+E.Message);
        SinalizandoFracasso;
      end;
    end;
  end;
end;

procedure Tfrm_ImportaRetaguarda.BitBtnAvancar1Click(Sender: TObject);
begin
  pg1.activepage:=pagina2;
  btnreceberFtp.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ImportaRetaguarda.BotaoSair2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ImportaRetaguarda.BotaoSair3Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ImportaRetaguarda.BitBtnVoltar3Click(Sender: TObject);
begin
  pnLogo.visible:=true;
  pg1.activepage:=pagina2;
  btnReceberFtp.setfocus;
end;

procedure Tfrm_ImportaRetaguarda.ImportaTransfLoja;
var
  clAux,clTransf: TClassAuxiliar;
  linha,nomearquivo: String;
  arq: textfile;
  indgauge,totgauge: Integer;
  lojaorigem,documento: String;
  data,lojadestino: String;
  status,enviado,online,tipz: String;
  total_novos: Integer;
begin
  nomearquivo := trim(edtLocal.text)+'\TRANSFLO.'+form_nz(frm_principal.x_loja,3);
  if (not FileExists(nomearquivo)) then
  begin
    memoTarefas.lines.Add (' '+form_tc2('TRANSFERÊNCIAS',17,'.')+': Arquivo '+nomearquivo+' não encontrado');
    memoTarefas.refresh;
  end
  else
  begin
    if (chProgresso.checked) then
      gauge1.visible:=true;
    AssignFile(arq,nomearquivo);
    Reset(arq);
    totGauge:=0;
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    Reset (arq);
    indGauge:=0;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    total_novos := 0;
    while (not Eof(arq)) do
    begin
      ReadLn (arq,linha);
      linha  := linha + ';';
      lojaorigem := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      documento := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      data := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      lojadestino := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      status := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      enviado := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      online := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));
      tipz := Copy(linha,1,Pos(';',linha)-1);
      delete(linha,1,Pos(';',linha));

             {*********************************************************************}
             //VERIFICANDO SE O DOCUMENTO JA NAO EXISTE
      clTransf := TClassAuxiliar.Create;
      clTransf.conect   ('VENDAS',self);
      clTransf.ClearSql;
      clTransf.AddParam ('SELECT TR_DATA,TR_LOJ2                ');
      clTransf.AddParam ('FROM TRANSF_LOJA                      ');
      clTransf.AddParam ('WHERE      (TR_NUME='+documento+')    ');
      if (not clTransf.Execute) then
      begin
        clTransf.ClearSql;
        clTransf.AddParam ('INSERT INTO TRANSF_LOJA(TR_LOJ1,TR_NUME,TR_LOJ2,TR_DATA,TR_STAT,TR_ENVI,TR_ONLI,TR_TIPZ) ');
        clTransf.AddParam ('VALUES (:TR_LOJ1,:TR_NUME,:TR_LOJ2,:TR_DATA,:TR_STAT,:TR_ENVI,:TR_ONLI,:TR_TIPZ)         ');
        clTransf.consulta.parambyname('TR_LOJ1').AsFloat    := strtofloat(lojaorigem);
        clTransf.consulta.parambyname('TR_NUME').AsFloat    := strtofloat(documento);
        clTransf.consulta.parambyname('TR_LOJ2').AsFloat    := strtofloat(lojadestino);
        clTransf.consulta.parambyname('TR_DATA').AsDateTime := strtodate(data);
        clTransf.consulta.parambyname('TR_STAT').AsString   := status; {*}
        clTransf.consulta.parambyname('TR_ENVI').AsString   := enviado;
        clTransf.consulta.parambyname('TR_ONLI').AsString   := online;
        clTransf.consulta.parambyname('TR_TIPZ').AsString   := tipz;
        clTransf.Execute;
        total_novos := total_novos + 1;
      end;
      clTransf.desconect;
      clTransf.Free;

             {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    if (chProgresso.checked) then
      gauge1.visible:=false;
    clAux.desconect;
    clAux.Free;
    memoTarefas.lines.Add (' '+form_tc2('TRANSFERÊNCIAS',17,'.')+': OK - Total de registros..: '+form_n(indGauge,5)+
      ' Incluídos...: '+form_n(total_novos,5));
    memoTarefas.refresh;
    CloseFile(arq);
  end;
end;

procedure Tfrm_ImportaRetaguarda.ImportandoArqImpostoProd;
var
  clAux: TClassAuxiliar;
  arq: textfile;
  linha: String;
  PARQUIVO,PDATAIMPIP, PVERSAO :String;
  indGauge,totGauge   :Integer;
begin
  if (FileExists(y_pathlocal+'\ARQIMPPR.'+form_nz(frm_principal.x_loja,3))) then
  begin
    SetCurrentDir(y_pathlocal);
    AssignFile (arq,'ARQIMPPR.'+form_nz(frm_principal.x_loja,3));
    Reset      (arq);
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM ARQ_IMPORT_IMPOSTO_PRODUTO ');
    clAux.AddParam ('WHERE (ARQUIVO=:ARQUIVO) AND (VERSAO=:VERSAO) ');
    if (chProgresso.checked) then
      gauge1.progress:=0;
    indGauge:=0;
    while (not Eof(arq)) do
    begin
      Readln(arq,linha);
      PARQUIVO := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      Delete (linha,1,Pos(';',linha));
      Delete (linha,1,Pos(';',linha));
      PVERSAO := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));

      clAux.consulta.parambyname('ARQUIVO').AsString     := PARQUIVO;
      clAux.consulta.parambyname('VERSAO').AsString := PVERSAO; //StrToDate(PDATAIMPIP);
      clAux.Execute;

              {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    clAux.desconect;
    clAux.Free;
    CloseFile(arq);
    DeleteFile('ARQIMPPR.'+form_nz(frm_principal.x_loja,3));
  end;
end;

procedure Tfrm_ImportaRetaguarda.ImportandoImpostoProduto;
var
  clAux: TClassAuxiliar;
  arq: textfile;
  linha: String;
  PCODIGO,PEX,PTABELA: String;
  indGauge,totGauge: Integer;
begin
  if (FileExists(y_pathlocal+'\IMPOSTPR.'+form_nz(frm_principal.x_loja,3))) then
  begin
    SetCurrentDir(y_pathlocal);
    AssignFile (arq,'IMPOSTPR.'+form_nz(frm_principal.x_loja,3));
    Reset      (arq);
    while (not Eof(arq)) do
    begin
      ReadLn(arq,linha);
      totGauge:=totGauge+1;
    end;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM IMPOSTO_PRODUTO ');
    clAux.AddParam ('WHERE (CODIGO=:CODIGO) AND (EX=:EX) AND (TABELA=:TABELA) ');
    if (chProgresso.checked) then
      gauge1.progress:=0;
    indGauge:=0;
    while (not Eof(arq)) do
    begin
      Readln(arq,linha);
      PCODIGO := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      PEX := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      PTABELA := Copy(linha,1,Pos(';',linha)-1);
      Delete (linha,1,Pos(';',linha));
      clAux.consulta.parambyname('CODIGO').AsFloat  := strtofloat(PCODIGO); 
      clAux.consulta.parambyname('EX').AsInteger    := StrToInt(PEX);
      clAux.consulta.parambyname('TABELA').AsInteger:= StrToInt(PTABELA);
      clAux.Execute;

              {prox. registro------>}
      indGauge:=indGauge+1;
      if (chProgresso.checked) then
      begin
        gauge1.progress:=Round((indGauge/totGauge)*100);
        gauge1.refresh;
      end;
    end;
    clAux.desconect;
    clAux.Free;
    CloseFile(arq);
    DeleteFile('IMPOSTPR.'+form_nz(frm_principal.x_loja,3));
  end;
end;

procedure Tfrm_ImportaRetaguarda.DecompressFiles2(FileName,
  Destination: String);
begin
  try
    with tsqnzp do
    begin
      ZipFileName := FileName;
      DirToExtractTo := Destination;
      UnZipOptions.DirCreationOption := dcoSafePath;
      Execute;
    end;
  finally
    tsqnzp.Free;
  end;
end;

procedure Tfrm_ImportaRetaguarda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_ImportaRetaguarda.ApagaArquivosDir(nomedir, extArq: String);
var
  SearchRec : TSearchRec;
  i : Integer;
begin
  i := FindFirst(nomedir + extArq, faAnyFile, SearchRec);
  while i = 0 do begin
    if (SearchRec.Attr > 0) then
      DeleteFile(nomedir + SearchRec.Name);
        //then ShowMessage('Não foi possivel excluir o arquivo ' + SearchRec.Name);
    i := FindNext(SearchRec);
  end;
end;

end.
