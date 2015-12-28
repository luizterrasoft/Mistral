unit SelecaoRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Qrctrls,QuickRpt,
  CheckControle,db,DbTables,Qrprntr,TipoDef,FuncPrint,printers,Menus,FuncoesGlobais
  ,EditControle,MaskEdit,ComboSql,StdCtrls,QrExpr,Math,variants;

type

  TFlagItSelRel     = (FGFiltro,FGDbText,FGExpression,FGTotal,FGDadoQuebra);

  TFlagFaixa        = (DadoaDado,Unico,DadoDescricao);

  TBandBfPrint = Record
    Banda:TQrCustomBand;
    BeforePrint:TQRBandBeforePrintEvent;
  end;

  TindiceRel = Record
     Titulo:String;
     PgIni:Word;
     PgFim:Word;
  end;

  TVetIndiceRel = Array of TindiceRel;

  TSelecaoRel = class;

  TItemSelRel = Class;

  TItemSelRelCreate      = procedure (sender : TItemSelRel;Var Value:String) of object;


  TFaixaSelRel = Class(TCollectionItem)
  private
    FParametro1: TStringList;
    FParametro2: TStringList;
    FCampo: String;
    FPesquisaFiltro: String;
    FTitulo: String;
    FPesquisa: String;
    FPesquisaTabela: String;
    FTipo: TFieldType;
    FFlag: TFlagFaixa;
    FCriaSql: Boolean;
    FVlNull: String;
    FTabela: String;
    FAlias: String;
    FTabelaCodigo: String;
    FTabelaDescricao: String;
    FItemsCombo: TStringList;
    FValoresCombo: TStringList;
    FMascara: String;
    procedure SetItemsCombo(const Value: TStringList);
    procedure SetValoresCombo(const Value: TStringList);
    Procedure FKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure SetParametro1(const Value: TStringList);
    procedure SetParametro2(const Value: TStringList);
  Public
    FParams:TParams;
    FSql:TStringList;
    FControl1:TWinControl;
    FControl2:TWinControl;
    Procedure   SqlFaixa;
    Procedure   CriaComponentes(FParent:TWinControl;Var Ftop:Word;FLeft:Word);
    constructor Create(Collection:TCollection);Override;
    Destructor  Destroy;Override;
    { Public declarations }
  published
     Property Tipo            : TFieldType     Read FTipo  Write FTipo;
     Property Flag            : TFlagFaixa     Read FFlag  Write FFlag;
     Property Titulo          : String         Read FTitulo Write FTitulo;
     Property Alias           : String         Read FAlias Write FAlias;
     Property Mascara         : String         Read FMascara Write FMascara;
     Property VlNull          : String         Read FVlNull Write FVlNull;
     Property Campo           : String         Read FCampo Write FCampo;
     Property CriaSql         : Boolean        Read FCriaSql Write FCriaSql;
     Property Parametro1      : TStringList     Read FParametro1 Write SetParametro1;
     Property Parametro2      : TStringList     Read FParametro2 Write SetParametro2;
     Property Pesquisa        : String         Read FPesquisa Write FPesquisa;
     Property PesquisaTabela  : String         Read FPesquisaTabela Write FPesquisaTabela;
     Property PesquisaFiltro  : String         Read FPesquisaFiltro Write FPesquisaFiltro;
     Property Tabela          : String         Read FTabela Write FTabela;
     Property TabelaCodigo    : String         Read FTabelaCodigo Write FTabelaCodigo;
     Property TabelaDescricao : String         Read FTabelaDescricao Write FTabelaDescricao;
     Property ItemsCombo      : TStringList    Read FItemsCombo Write SetItemsCombo;
     Property ValoresCombo    : TStringList    Read FValoresCombo Write SetValoresCombo;
  end;


  TFaixasSelRel = Class (Tcollection)
   Private
      FSelecaoRel : TSelecaoRel;
      function GetItem(Index: Integer): TFaixaSelRel;
      procedure SetItem(Index: Integer; const Value: TFaixaSelRel);
      { Private declarations }
   Public
      FSql:TStringList;
      FParametros:TParams;
      Constructor Create(SelecaoRel:TSelecaoRel);
      destructor Destroy; override;
      function    GetOwner: TPersistent; override;
      Property    Items[Index:Integer] : TFaixaSelRel read GetItem write SetItem ;Default;
      Procedure   CriaControls(FParent:TwinControl);
      procedure   SqlFaixa;
      function    Add :TFaixaSelRel;
      Function    Parametros(FQuery:TQuery):TParams; 
      { Public declarations }
   Published
      { Published declarations }
   end;

  TCampoQuebra = Class(TCollectionItem)
  private
    FCodigo   : Boolean;
    FDescricao: String;
    FCampo: String;
    FTitulo: String;
    FIndice: Word;
    FTamanho: Word;
    FCampoDesativado:Boolean;
    FOnPrint: TQRLabelOnPrintEvent;
  Public
    QrLabel : TQrLabel;
    { Public declarations }
  published
    Property Tamanho           : Word           read FTamanho    Write FTamanho;
    Property Campo             : String         read FCampo      Write FCampo;    Property Titulo            : String         read FTitulo     Write FTitulo;
    Property Descricao         : String         read FDescricao  Write FDescricao;
    Property Codigo            : Boolean        read FCodigo  Write FCodigo;
    Property Indice            : Word           read FIndice      Write FIndice;
    Property CampoDesativado   : Boolean        read FCampoDesativado      Write FCampoDesativado;
    Property OnPrint           : TQRLabelOnPrintEvent  Read FOnPrint Write FOnPrint;
  end;

  TDadoQuebra = class;

  TCamposQuebra = Class (Tcollection)
   Private
      FDadoQuebra : TDadoQuebra;
      function GetCampos(Index: Integer): TCampoQuebra;
      procedure SetCampos(Index: Integer; const Value: TCampoQuebra);
      { Private declarations }
   Public
      Constructor Create(DadoQuebra:TDadoQuebra);
      function GetOwner: TPersistent; override;
      Property Items[Index:Integer] : TCampoQuebra read GetCampos write SetCampos ;Default;
      { Public declarations }
   Published
      { Published declarations }
   end;

  TItemsSelRel = Class;

  TDadoQuebra = Class(TCollectionItem)
   Private
     oldexpquebra:Variant;
     FCamposQuebra: TCamposQuebra;
     FIndice: Word;
     FTitulo: String;
     FMenu: TMenuItem;
     FTemGroupFooter: Boolean;
     FResumida: Boolean;
     FCampoFaixa: String;
     FOnBeforePrintGroupFooter: TQRBandBeforePrintEvent;
     FOnBeforePrintGroup: TQRBandBeforePrintEvent;
     FExpression: String;
     FDesabilitada: Boolean;
    FQuebraPag: Boolean;
     procedure SetCamposQuebra(const Value: TCamposQuebra);
   Public
     ListaCampos:TStringList;
     QrGroup : TQrGroup;
     constructor Create(Collection:TCollection);Override;
     Destructor  Destroy ;Override;
     function  NomeCampos:String;
     function  IndiceCampos:String;
     function  IndiceCamposSql(Sql: TStrings): String;
    { Public declarations }
   Published
     Property Resumida          :Boolean        read FResumida       Write FResumida;
     Property Desabilitada          :Boolean        read FDesabilitada       Write FDesabilitada;
     Property CampoFaixa        :String         read FCampoFaixa     Write FCampoFaixa;
     Property TemGroupFooter    :Boolean        read FTemGroupFooter Write FTemGroupFooter;
     Property Expression        :String         read FExpression     Write FExpression;
     Property Indice            :Word           read FIndice         Write FIndice;
     Property Titulo            :String         read FTitulo         Write FTitulo;
     Property Campos            :TCamposQuebra  read FCamposQuebra   Write SetCamposQuebra;
     Property QuebraPagina         :Boolean      read FQuebraPag           Write FQuebraPag;
     Property MenuItem             :TMenuItem      read FMenu           Write FMenu;
     Property OnPrintQrGroup       : TQRBandBeforePrintEvent  Read FOnBeforePrintGroup Write FOnBeforePrintGroup;
     Property OnPrintQrGroupFooterFooter : TQRBandBeforePrintEvent  Read FOnBeforePrintGroupFooter Write FOnBeforePrintGroupFooter;
  end;


  TItemSelRel = Class(TCollectionItem)
   Private
    FQuebra:TDadoQuebra;
    FCampo: String;
    FTitulo: String;
    FMascara: String;
    FTipo: TFieldType;
    FBandTit: TQrCustomBand;
    FBand: TQrCustomBand;
    FTam: Word;
    FPanel: TwinControl;
    FAlignment: TAlignment;
    FDataSet: TDataSet;
    FChecked: Boolean;
    FFlag: TFlagItSelRel;
    FExpression: TStringList;
    FSql: TStringList;
    FFiltro: TStringList;
    FOnPrint : TQRLabelOnPrintEvent;
    FCondExprTotal: Boolean;
    FTotal: Boolean;
    LbTitulo:TQrLabel;
    FResetAfterPrint: Boolean;
    FSemTotal: Boolean;
    FTemContrario: Boolean;
    FTitContrario: String;
    FCheckContrario: Boolean;
    FAlignToBand: Boolean;
    FMedia: Boolean;
    FSemCheckControle: Boolean;
    FNaoGeraSql: Boolean;
    FCompQuebra: Boolean;
    FQuebraParam: String;
    FCamposParam: TStringList;
    FCamposRel: TStringList;
    FColObjParams: LongInt;
    FObjParams: TWinControl;
    FVAlueParams: String;
    FRowObjParams: LongInt;
    FEspVazios: Boolean;
    FTamanhoQtde: LongInt;
    FBandasMedia: TStringList;
    FBandasSoma: TStringList;
    FTotalResumido:Boolean;
    FQuebrasReset: TStringList;
    FAliasFiltro: String;
    FAliasFiltroC: String;
    FNFiltro: TStringList;
    FTag: Integer;
    FBancodeDados: String;
    Function GetDisplayName:String;Override;
    procedure SetExpression(const Value: TStringList);
    procedure SetFiltro(const Value: TStringList);
    procedure SetSql(const Value: TStringList);
    function GetCheckAtual: Boolean;
    procedure SetCheckAtual(const Value: Boolean);
    function GetCheckContrarioAtual: Boolean;
    procedure SetCheckContrarioAtual(const Value: Boolean);
    procedure SetCamposParam(const Value: TStringList);
    procedure SetCamposRel(const Value: TStringList);
    procedure SetBandasMedia(const Value: TStringList);
    procedure SetBandasSoma(const Value: TStringList);
    procedure SetQuebrasReset(const Value: TStringList);
    procedure SetNFiltro(const Value: TStringList);
    { Private declarations }
   Public
     OldReset:String;
     FQuebraAut:TDadoQuebra;
     FiltroSql:Boolean;
     FCopyOrigem:TItemsSelRel;
     FCheckControle:TCheckControle;
     FCheckControleContrario:TCheckControle;
     QuebraDetal:TDadoquebra;
     Controls : TList;
     Value    : String;
     constructor Create(Collection:TCollection);Override;
     Destructor  Destroy ;Override;
     procedure   Assign(Source: TPersistent); override;
     Property    CheckAtual :Boolean  read GetCheckAtual Write SetCheckAtual;
     Property    CheckContrarioAtual :Boolean  read GetCheckContrarioAtual Write SetCheckContrarioAtual;
    { Public declarations }
   Published
     Property AlignToBand  : Boolean        Read FAlignToBand Write FAlignToBand;
     Property Quebra       : TDadoQuebra    read FQuebra Write FQuebra;
     Property Campo        : String         Read FCampo Write FCampo;
     Property AliasFiltro  : String         Read FAliasFiltro Write FAliasFiltro;
     Property AliasFiltroC  : String         Read FAliasFiltroC Write FAliasFiltroC;
     Property Mascara      : String         Read FMascara Write FMascara;
     Property Tipo         : TFieldType     Read FTipo  Write FTipo;
     Property Flag         : TFlagItSelRel  Read FFlag  Write FFlag;
     Property Titulo       : String         Read FTitulo Write FTitulo;
     Property BandaTitulo  : TQrCustomBand  Read FBandTit Write FBandTit;
     Property Banda        : TQrCustomBand  Read FBand Write FBand;
     Property DataSet      : TDataSet       Read FDataSet Write FDataSet;
     Property Alignment    : TAlignment     Read FAlignment Write FAlignment;
     Property Checked      : Boolean        Read FChecked Write FChecked;
     Property CondExprTotal: Boolean        Read FCondExprTotal Write FCondExprTotal;
     Property Total        : Boolean        Read FTotal Write FTotal;
     Property ResetAfterPrint  : Boolean    Read FResetAfterPrint Write FResetAfterPrint;
     Property SemTotal        : Boolean     Read FSemTotal Write FSemTotal;
     Property Panel        : TWinControl    Read FPanel Write FPanel;
     Property OnPrint      : TQRLabelOnPrintEvent  Read FOnPrint Write FOnPrint;
     Property Tamanho      : Word            Read FTam Write FTam;
     Property Expression   : TStringList     Read FExpression Write SetExpression;
     Property Sql          : TStringList     Read FSql Write SetSql;
     Property Filtro           : TStringList     Read FFiltro Write SetFiltro;
     Property NFiltro           : TStringList     Read FNFiltro Write SetNFiltro;
     Property CamposParam           : TStringList     Read FCamposParam Write SetCamposParam;
     Property CamposRel           : TStringList     Read FCamposRel Write SetCamposRel;
     Property QuebraParam      : String         Read FQuebraParam Write FQuebraParam;
     Property TituloContrario : String       Read FTitContrario Write FTitContrario;
     Property TemContrario    : Boolean      Read FTemContrario Write FTemContrario;
     Property CheckContrario    : Boolean      Read FCheckContrario Write FCheckContrario;
     Property Media    : Boolean      Read FMedia Write FMedia;
     Property SemCheckControle    : Boolean  Read FSemCheckControle Write FSemCheckControle;
     Property NaoGeraSql    : Boolean  Read FNaoGeraSql Write FNaoGeraSql;
     Property CompQuebra    : Boolean  Read FCompQuebra Write FCompQuebra;
     Property ObjParams      : TWinControl  Read FObjParams Write FObjParams;
     Property ColObjParams   : LongInt  Read FColObjParams Write FColObjParams default 0;
     Property RowObjParams   : LongInt  Read FRowObjParams Write FRowObjParams default 0;
     Property ValueParams   : String  Read FVAlueParams Write FVAlueParams;
     Property TamanhoQtde   : LongInt  Read FTamanhoQtde Write FTamanhoQtde default 0;
     Property EspVazios    : Boolean  Read FEspVazios Write FEspVazios;
     Property BandasSoma   : TStringList  Read FBandasSoma Write SetBandasSoma;
     Property BandasMedia  : TStringList  Read FBandasMedia Write SetBandasMedia;
     Property TotalResumido  : Boolean  Read FTotalResumido Write FTotalResumido;
     Property QuebrasReset    : TStringList    Read FQuebrasReset Write SetQuebrasReset;
     Property Tag   : Integer  Read FTag Write FTag default 0;
     Property BancodeDados      : String         Read FBancodeDados Write FBancodeDados;
    { Published declarations }
 end;



  TItemsSelRel = Class (Tcollection)
   Private
      FSelecaoRel : TSelecaoRel;
      function GetItems(Index: Integer): TItemSelRel;
      procedure SetItems(Index: Integer; const Value: TItemSelRel);
      { Private declarations }
   Public
      Constructor Create(SelecaoRel:TSelecaoRel);
      function    Add :TItemSelRel;
      function    GetOwner: TPersistent; override;
      Property    Items[Index:Integer] : TItemSelRel read GetItems write SetItems ;Default;
      Function    ItemsPorTitulo(Titulo:String):TItemSelrel;
      Function    ItemsPorCampo(Campo:String):TItemSelrel;
      Function    ItemsPorObj(Obj:TQrCustomLabel):TItemSelrel;
      Function    ItemsPorTag(Tag:Integer):TItemSelrel;
      Procedure   CriaControls(FParent:TwinControl;Aut:Boolean=False);
      Procedure   CopyControls(FItems:TitemsselRel;IndexIni:Word);
      Function    SqlCampos:TStringList;
      Function    ValoresCampos(Campo:String;Marcado:Boolean):String;
      { Public declarations }
   Published
      { Published declarations }
   end;


  TDadosQuebra = Class (Tcollection)
   Private
      FSelecaoRel : TSelecaoRel;
      function GetDados(Index: Integer): TDadoQuebra;
      procedure SetDados(Index: Integer; const Value: TDadoQuebra);
      { Private declarations }
   Public
      Constructor Create(SelecaoRel:TSelecaoRel);
      function Add :TDadoQuebra;
      function GetOwner: TPersistent; override;
      Function QuebraPorMenu(Menu:TMenuItem):TDadoQuebra;
      Function QuebraPorIndice(Indice:Word):TDadoQuebra;
      Function QuebraPorNome(Nome:String):TDadoQuebra;
      Property Dados[Index:Integer] : TDadoQuebra read GetDados write SetDados ;Default;
      { Public declarations }
   Published
      { Published declarations }
   end;



  TSelecaoRel = class(TComponent)
  private
    FCriaQuebraAut:Boolean;
    CriandoQuebraResumida:Boolean;
    VLeft:Word;
    FBandaTotal:TQrCustomBand;
    OldCountComponent:Word;
    FItemsSelRel: TItemsSelRel;
    FQuickRep: TQuickRep;
    FTopCheck: Word;
    FLeftCheck: Word;
    FLeftReport: Word;
    FWidthCheck: Word;
    FBandTit: TQrCustomBand;
    FBand: TQrCustomBand;
    FOnCreateTotal: TItemSelRelCreate;
    FOnCreateQrControls: TItemSelRelCreate;
    FCondExprTotal: TstringList;
    FDadosQuebra: TDadosQuebra;
    FFiltros: TItemsSelRel;
    FBandAlignment: TAlignment;
    FAutoSize: Boolean;
    CriandoCompQuebra: Boolean;
    FFaixasSelRel: TFaixasSelRel;
    FParams: TItemsSelRel;
    FBfBands:Array of TBandBfPrint;
    procedure SetItemsSelRel(const Value: TItemsSelRel);
    procedure SetCondExprTotal(const Value: TStringList);
    Procedure FCriaDetalhe;
    Procedure FCriaCompDetalhe(FItemSelRel:TItemSelRel);
    procedure SetDadosQuebra(const Value: TDadosQuebra);
    Procedure OnPrintQuebra(Sender:TObject;Var Value:String);
    procedure SetFiltros(const Value: TItemsSelRel);
    Procedure PrintCompDateTime(sender: TObject; var Value: String);
    Procedure PrintGroupQuebra(Sender: TQrCustomBand;var PrintBand: Boolean);
    Procedure FBfPrintVquebra(Sender: TQrCustomBand;var PrintBand: Boolean);
    procedure SetFaixasSelRel(const Value: TFaixasSelRel);
    procedure SetParams(const Value: TItemsSelRel);
    { Private declarations }
  protected
    { Protected declarations }
  public
    Findices:TVetIndiceRel;
    Constructor Create(AOwner: TComponent);Override;
    Destructor  Destroy ;Override;
    Procedure FExpQuebra(VQuebra:String);
    Procedure CriaControlsReport;
    Procedure CriaTotal(Band:TqrCustomBand);
    Procedure CriaTotalQuebra(Quebra:TDadoQuebra);
    Procedure DeletaControlsReport;
    Procedure CriaQuebra(Quebra:TDadoQuebra;Resumida:Boolean);
    Function  GeraSqlFiltros:TStringList;
    Function  SqlCampos:TStringList;
    Procedure OcupaEspacosVazios(Values:Array of String);
    procedure FiltrosSql(DataSet: TDataSet;Campo:String;IndIni:Integer;FParent:TWincontrol;VNFiltro:String='';VDFiltro:String='');
    Procedure GeraParametros(VQuebra:String);
    { Public declarations }
  published
     Property AutoSize    : Boolean   Read FAutoSize Write FAutoSize;
     Property BandAlignment    : TAlignment   Read FBandAlignment Write FBandAlignment;
     Property Items  : TItemsSelRel read FItemsSelRel write SetItemsSelRel;
     Property Faixas  : TFaixasSelRel read FFaixasSelRel write SetFaixasSelRel;
     Property Filtros: TItemsSelRel read FFiltros     write SetFiltros;
     Property Params: TItemsSelRel read FParams     write SetParams;
     Property Relatorio          : TQuickRep      Read FQuickRep      Write FQuickRep;
     Property WidthCheck         : Word           Read FWidthCheck    Write FWidthCheck;
     Property LeftCheck          : Word           Read FLeftCheck     Write FLeftCheck;
     Property TopCheck           : Word           Read FTopCheck      Write FTopCheck;
     Property LeftReport         : Word           Read FLeftReport    Write FLeftReport;
     Property BandaTitulo        : TQrCustomBand  read FBandTit    Write FBandTit;
     Property Banda              : TQrCustomBand  read FBand       Write FBand;
     Property CondExprTotal      : TstringList          read FCondExprTotal   Write SetCondExprTotal;
     Property OnCreateQrControls : TItemSelRelCreate    read FOnCreateQrControls write FOnCreateQrControls;
     Property OnCreateTotal      : TItemSelRelCreate    read FOnCreateTotal write FOnCreateTotal;
     Property Quebras            : TDadosQuebra         Read FDadosQuebra   Write SetDadosQuebra;
    { Published declarations }
  end;

function DataTypeToVarType(FDatatype:TFieldType):Integer;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sistema', [TSelecaoRel]);
end;

{ TItemSelRel }

procedure TItemSelRel.Assign(Source: TPersistent);
begin
  if Not (Source is TItemSelRel) then begin
    inherited Assign(Source);
    exit;
  end;

  FCheckControle     := TItemSelRel(Source).FCheckControle;
  Campo              := TItemSelRel(Source).Campo;
  AliasFiltro         := TItemSelRel(Source).AliasFiltro;
  AliasFiltroC         := TItemSelRel(Source).AliasFiltroC;
  Tipo               := TItemSelRel(Source).Tipo;
  Mascara            := TItemSelRel(Source).Mascara;
  Flag               := TItemSelRel(Source).Flag;
  Titulo             := TItemSelRel(Source).Titulo;
  BandaTitulo        := TItemSelRel(Source).BandaTitulo;
  Banda              := TItemSelRel(Source).Banda;
  DataSet            := TItemSelRel(Source).DataSet;
  Alignment          := TItemSelRel(Source).Alignment;
  ResetAfterPrint    := TItemSelRel(Source).ResetAfterPrint;
  Checked            := TItemSelRel(Source).Checked;
  Tamanho            := TItemSelRel(Source).Tamanho;
  Panel              := TItemSelRel(Source).Panel;
  Total              := TItemSelRel(Source).Total;
  CondExprTotal      := TItemSelRel(Source).CondExprTotal;
  OnPrint            := TItemSelRel(Source).OnPrint;
  AlignToBand        := TItemSelRel(Source).AlignToBand;
  Media              := TItemSelRel(Source).Media;
  ResetAfterPrint    := TItemSelRel(Source).ResetAfterPrint;
  CompQuebra         := TItemSelRel(Source).CompQuebra;
  SemTotal         := TItemSelRel(Source).SemTotal;
  TituloContrario         := TItemSelRel(Source).TituloContrario;
  CheckContrario         := TItemSelRel(Source).CheckContrario;
  Media         := TItemSelRel(Source).Media;
  SemCheckControle         := TItemSelRel(Source).SemCheckControle;
  NaoGeraSql         := TItemSelRel(Source).NaoGeraSql;
  Expression.Assign(TItemSelRel(Source).Expression);
  Sql.Assign(TItemSelRel(Source).Sql);
  Filtro.Assign(TItemSelRel(Source).Filtro);
  NFiltro.Assign(TItemSelRel(Source).NFiltro);
  QuebrasReset.Assign(TItemSelRel(Source).QuebrasReset);
  ObjParams         := TItemSelRel(Source).ObjParams;
  colobjparams      := TItemSelRel(Source).colobjparams;
  rowobjparams      := TItemSelRel(Source).rowobjparams;
  ValueParams       := TItemSelRel(Source).ValueParams;
  FiltroSql         := TItemSelRel(Source).FiltroSql; 
  TamanhoQtde         := TItemSelRel(Source).TamanhoQtde;
  EspVazios         := TItemSelRel(Source).EspVazios;
end;

constructor TItemSelRel.Create(Collection: TCollection);
begin
   inherited Create(Collection);
   FExpression      := TStringList.Create;
   FFiltro          := TStringList.Create;
   FNFiltro          := TStringList.Create;
   FCamposParam     := TStringList.Create;
   FCamposRel       := TStringList.Create;
   FSql             := TStringList.Create;
   FBandasSoma      := TStringList.Create;
   FBandasMedia     := TStringList.Create;
   FQuebrasReset    := TStringList.Create;
   Controls         := TList.Create;
   Ftipo            := FtString;
   FFlag            := FGDbText;


   If Not((Collection is TItemsSelRel) and (TItemsSelRel(Collection).GetOwner <> Nil)) then
      exit;

   If (TSelecaoRel(TItemsSelRel(Collection).GetOwner).Relatorio <> Nil) and (TSelecaoRel(TItemsSelRel(Collection).GetOwner).Relatorio.DataSet <> Nil) then
       Self.DataSet := TSelecaoRel(TItemsSelRel(Collection).GetOwner).Relatorio.DataSet;

   If TSelecaoRel(TItemsSelRel(Collection).GetOwner).BandaTitulo <> Nil then
       Self.BandaTitulo := TSelecaoRel(TItemsSelRel(Collection).GetOwner).BandaTitulo;

   If TSelecaoRel(TItemsSelRel(Collection).GetOwner).Banda <> Nil then
       Self.Banda       := TSelecaoRel(TItemsSelRel(Collection).GetOwner).Banda;

end;



destructor TItemSelRel.Destroy;
begin
  FCamposParam.Destroy;
  FCamposRel.Destroy;
  FExpression.Destroy;
  FFiltro.DEstroy;
  FNFiltro.DEstroy;
  FSql.DEstroy;
  Controls.Destroy;
  FBandasSoma.Destroy;
  FBandasMedia.Destroy;
  FQuebrasReset.Destroy;
  inherited Destroy;
end;



function TItemSelRel.GetCheckAtual: Boolean;
begin
  Result :=  (FSemCheckControle and FChecked) or
             (Not FSemCheckControle and (FCheckControle <> Nil) and FCheckControle.Checked);
end;

function TItemSelRel.GetCheckContrarioAtual: Boolean;
begin
  Result :=  (FSemCheckControle and FCheckContrario) or
             (Not FSemCheckControle and (FCheckControleContrario <> Nil) and  FCheckControleContrario.Checked);
end;

Function TItemSelRel.GetDisplayName:String;
begin
    If Titulo <> '' then
      Result := Titulo
    else if Campo <> '' then
      Result := Campo
    else
      Result := inherited GetDisplayName;
end;

procedure TItemSelRel.SetBandasMedia(const Value: TStringList);
begin
  FBandasMedia.Assign(Value);
end;

procedure TItemSelRel.SetBandasSoma(const Value: TStringList);
begin
  FBandasSoma.Assign(Value);
end;

procedure TItemSelRel.SetCamposParam(const Value: TStringList);
begin
  FCamposParam.Assign(Value);
end;

procedure TItemSelRel.SetCamposRel(const Value: TStringList);
begin
  FCamposRel.Assign(Value);
end;

procedure TItemSelRel.SetCheckAtual(const Value: Boolean);
begin
  If (FSemCheckControle) or (FCheckControle = Nil) then
     FChecked := Value
  else 
     FCheckControle.Checked := Value;
end;

procedure TItemSelRel.SetCheckContrarioAtual(const Value: Boolean);
begin
  If (FSemCheckControle) or (FCheckControleContrario = Nil) then
     FCheckContrario := Value
  else
     FCheckControleContrario.Checked := Value;
end;


procedure TItemSelRel.SetExpression(const Value: TStringList);
begin
  FExpression.Assign(Value);
end;


procedure TItemSelRel.SetFiltro(const Value: TStringList);
begin
  FFiltro.Assign(Value);
end;

procedure TItemSelRel.SetNFiltro(const Value: TStringList);
begin
  FNFiltro.Assign(Value);
end;

procedure TItemSelRel.SetQuebrasReset(const Value: TStringList);
begin
  FQuebrasReset.Assign(Value);
end;

procedure TItemSelRel.SetSql(const Value: TStringList);
begin
  FSql.Assign(Value);
end;

{ TItemsSelRel }

function TItemsSelRel.Add: TItemSelRel;
begin
  Result := TItemSelRel(inherited Add);
end;

procedure TItemsSelRel.CopyControls(FItems: TitemsselRel;IndexIni:Word);
Var I:word;
begin

   If Self.Count > 0 then
     for I:=Self.Count - 1 downto 0 do
      if (GetItems(i).FCopyOrigem = FItems) then
          Delete(I);

   for i:=0 to FItems.Count - 1 do begin
       Add;
       Items[Count - 1].FCopyOrigem := FItems;
       Items[Count - 1].Assign(Fitems[I]);
       Items[Count - 1].Index := I + IndexIni;
   end;
end;

constructor TItemsSelRel.Create(SelecaoRel: TSelecaoRel);
begin
  inherited Create(TItemSelRel);
  Self.FSelecaoRel := SelecaoRel;
end;

procedure TItemsSelRel.CriaControls(FParent: TwinControl;Aut:Boolean=False);
Var VLeft,VTop,I,i2:word;
    FCount:Integer;
begin
   VTop   := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.topCheck,1);
   VLeft  := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.LeftCheck,1);
   FCount := 0;   
{   For i:=0 to Count - 1 do
    If Not Items[I].SemCheckControle then
     Fcount :=  FCount + IIfs(Items[i].TemContrario,2,1);
   OldTabSheet :=}   



   For i:=0 to Self.Count - 1 do begin
             If Items[I].SemCheckControle then
               exit;

             TCheckControle.Create(FParent.Owner).Name := 'CkSelecao'+IntToStr(FParent.Owner.ComponentCount);
             Items[I].FCheckControle                   := TCheckControle(FParent.Owner.FindComponent('CkSelecao'+IntToStr(FParent.Owner.ComponentCount)));

             With TCheckControle(FParent.Owner.FindComponent('CkSelecao'+IntToStr(FParent.Owner.ComponentCount))) do begin
                      If  Items[I].Panel = Nil then Parent := FParent else Parent := Items[I].Panel;
                      
                       If Aut Then begin
                          FCount := 0;
                          
                          For i2:=0 to Count - 1 do
                           If (Items[i].Panel = Items[i2].Panel) and Not Items[I2].SemCheckControle  then
                            Fcount :=  FCount + IIfs(Items[i2].TemContrario,2,1);

                          If Ceil(TWinControl(Parent).Height/(Height + 1)) >= FCount then
                            FSelecaoRel.WidthCheck := Parent.Width
                          else
                            FSelecaoRel.WidthCheck := Floor(Parent.Width/(Ceil(FCount/(TWinControl(Parent).Height/(Height + 1)))));
                       end;

                      Checked  := Items[i].Checked;
                      CheckIni := Checked;
                      Caption  := Items[i].Titulo;
                      Width    := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.WidthCheck,100);

                      If (Parent.ControlCount > 1) and
                         (TWinControl(Parent.Controls[Parent.ControlCount - 2]).Top +
                          TWinControl(Parent.Controls[Parent.ControlCount - 2]).Height + Height > Parent.Height) then begin
                               Top     := 1;
                               Left    := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.WidthCheck,100) + 5 +
                                          TWinControl(Parent.Controls[Parent.ControlCount - 2]).Left;

                      end Else begin
                               If (Parent.ControlCount > 1) then begin
                                     Left    := TWinControl(Parent.Controls[Parent.ControlCount - 2]).Left;
                                     Top     := TWinControl(Parent.Controls[Parent.ControlCount - 2]).Top
                                                + TWinControl(Parent.Controls[Parent.ControlCount - 2]).height + 1;
                               end else begin
                                     Left    := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.LeftCheck,1);
                                     Top     := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.TopCheck,1);
                               end;
                      end;

             end;

             If not Items[i].TemContrario then
               continue;

             TCheckControle.Create(FParent.Owner).Name := 'CkSelecao'+IntToStr(FParent.Owner.ComponentCount);
             With TCheckControle(FParent.Owner.FindComponent('CkSelecao'+IntToStr(FParent.Owner.ComponentCount))) do begin
                      Items[I].FCheckControleContrario          := TCheckControle(FParent.Owner.FindComponent('CkSelecao'+IntToStr(FParent.Owner.ComponentCount)));
                      If Items[I].Panel = Nil then Parent := FParent else Parent := Items[I].Panel;
                      
                      Checked  := Items[i].CheckContrario;
                      CheckIni := Checked;
                      Caption  := Items[i].TituloContrario;
                      Width    := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.WidthCheck,100);

                      If (Parent.ControlCount > 1) and
                         (TWinControl(Parent.Controls[Parent.ControlCount - 2]).Top +
                          TWinControl(Parent.Controls[Parent.ControlCount - 2]).Height + Height > Parent.Height) then begin
                              Top     := 1;
                              Left    := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.WidthCheck,100) + 5 +
                                         TWinControl(Parent.Controls[Parent.ControlCount - 2]).Left;

                      end Else begin
                              If (Parent.ControlCount > 1) then begin
                                     Left    := TWinControl(Parent.Controls[Parent.ControlCount - 2]).Left;
                                     Top     := TWinControl(Parent.Controls[Parent.ControlCount - 2]).Top
                                                + TWinControl(Parent.Controls[Parent.ControlCount - 2]).height + 1;
                              end else begin
                                     Left    := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.LeftCheck,1);
                                     Top     := IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.TopCheck,1);
                              end;
                      end;

             end;


   end;




              {              If VTop + Height > Parent.Height then begin
                VTop  := 1;
                VLeft := VLeft + IIfs((FSelecaoRel <>  Nil) and (FSelecaoRel is TSelecaoRel),FSelecaoRel.WidthCheck,100) + 5;
              end;


              Top     := Vtop;
              Left    := VLeft;
              VTop    := Height + Vtop + 1;}




end;

function TItemsSelRel.GetItems(Index: Integer): TItemSelRel;
begin
  Result := TItemSelRel(inherited GetItem(Index));
end;

function TItemsSelRel.GetOwner: TPersistent;
begin
  Result := Self.FSelecaoRel;
end;

function TItemsSelRel.ItemsPorCampo(Campo: String): TItemSelrel;
var i:word;
begin
  Result := Nil;
  for i:=0 to Count - 1 do
    If UpperCase(GetItems(I).Campo) = UpperCase(Campo) then begin
      Result := GetItems(I);
      exit;
    end;

end;

function TItemsSelRel.ItemsPorObj(Obj: TQrCustomLabel): TItemSelrel;
var I,I2:Integer;
begin
  Result := Nil;
  For I:=0 to Count - 1 do
   If ((Items[i].LbTitulo <> Nil) and (Items[i].LbTitulo = Obj)) 
   or (Items[i].Controls.IndexOf(Pointer(Obj)) > -1) Then begin
     Result := Items[i];
     Exit;
   end;
end;

function TItemsSelRel.ItemsPorTag(Tag: Integer): TItemSelrel;
var i:integer;
begin
  Result := Nil;
  for i:=0 to Count - 1 do
    If GetItems(I).Tag = Tag then begin
      Result := GetItems(I);
      exit;
    end;

end;

function TItemsSelRel.ItemsPorTitulo(Titulo: String): TItemSelrel;
var i:word;
begin
  Result := Nil;
  for i:=0 to Count - 1 do
    If UpperCase(GetItems(I).Titulo) = UpperCase(Titulo) then begin
      Result := GetItems(I);
      exit;
    end;

end;

procedure TItemsSelRel.SetItems(Index: Integer;
  const Value: TItemSelRel);
begin
  inherited SetItem(Index, Value);
end;

function TItemsSelRel.SqlCampos: TStringList;
Var i,i2:word;
VItemSelRel:Titemselrel;
begin
   Result := TStringList.Create;
   for i:=0 to Count - 1 do begin
       If (GetItems(I).FCheckControle <> Nil) and
           GetItems(I).FCheckControle.Checked  and
           (GetItems(I).Sql.Text <> '')   then begin
               If (Pos('SELECT ',UpperCase(GetItems(I).Sql.text)) > 0) then begin
                   If (Result.IndexOF(' AS '+UpperCase(GetItems(I).Campo)) = -1) then begin
                         If Result.Text <> '' then
                           Result.Add(',');
                         Result.Add(' ( ');
                         Result.AddStrings(GetItems(I).Sql);
                         Result.Add(' ) ');
                         Result.Add(' AS '+UpperCase(GetItems(I).Campo));
                   end;
               end else begin
                      For i2:=0 to GetItems(I).Sql.Count - 1 do begin
                            VItemSelRel := ItemsPorCampo(GetItems(I).Sql[i2]);
                            If (VItemSelRel <> Nil) and
                               (VItemSelRel.Sql.Text <> '') and
                               (Result.IndexOF(' AS '+UpperCase(GetItems(I).Sql[I2])) = -1) then begin
                                 If Result.Text <> '' then
                                   Result.Add(',');
                                 Result.Add(' ( ');
                                 Result.AddStrings(VitemSelRel.Sql);
                                 Result.Add(' ) ');
                                 Result.Add(' AS '+UpperCase(VitemSelRel.Campo));
                           end;
                      end;
               end;
       end;
   end;
end;

function TItemsSelRel.ValoresCampos(Campo:String;Marcado: Boolean): String;
var i:integer;
begin
    Result := '';
    for i:=0 to Count - 1 do
      if (UpperCase(Campo) = UpperCase(Items[I].Campo)) and (Marcado = Items[I].CheckAtual) then
        Result := IIfs(Result <> '',Result+',','')+IIfs(Items[i].Tipo = ftString,'''','')+Items[i].Value+IIfs(Items[i].Tipo = ftString,'''','');
end;

{ TSelecaoRel }

procedure TSelecaoRel.FExpQuebra(VQuebra: String);
var
FqrValue:TQREvResult;
begin
  If Relatorio.Functions.IndexOf('EXPQUEBRA') = -1 then
     Relatorio.Functions.AddFunction('EXPQUEBRA',''''+VQuebra+'''')
  else begin
     FQrValue.Kind      := resString;
     FQrValue.StrResult := VQuebra;
     Relatorio.Functions.UpdateConstant('EXPQUEBRA',FQrValue);
  end;
end;


constructor TSelecaoRel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.FItemsSelRel  := TItemsSelRel.Create(Self);
  Self.FFaixasSelRel := TFaixasSelRel.Create(Self);
  Self.FFiltros      := TItemsSelRel.Create(Self);
  Self.FParams       := TItemsSelRel.Create(Self);
  FCondExprTotal     := TStringList.Create;
  FDadosQuebra       := TDadosQuebra.Create(Self);
  FCriaQuebraAut     := False;
  CriandoCompQuebra  := False;
end;

destructor TSelecaoRel.Destroy;
begin
  FCondExprTotal.Destroy;
  FItemsSelRel.Destroy;
  FFaixasSelRel.Destroy;
  FFiltros.Destroy;
  FDadosQuebra.Destroy;
  FParams.Destroy;
  inherited Destroy;
end;

procedure TSelecaoRel.SetItemsSelRel(const Value: TItemsSelRel);
begin
  FItemsSelRel.Assign(Value);
end;


procedure TSelecaoRel.CriaControlsReport;
var VLeft,Vtop,i:word;
    FValue : String;
begin
   FBandaTotal := Nil;

   For i:=0 to FItemsSelRel.Count - 1 do
    If (FItemsSelRel[I].LbTitulo <> Nil) and (FItemsSelRel[I].BandaTitulo = Nil) then
     FItemsSelRel[I].LbTitulo := Nil;

   FCriaDetalhe;

end;

procedure TSelecaoRel.DeletaControlsReport;
Var I:Integer;
begin
     SetLength(Findices,0);
     Vleft := 0;
     While Self.ComponentCount > 0 do begin
        TQrCustomLabel(Self.Components[Self.ComponentCount - 1]).Parent := Nil;
        Self.Components[Self.ComponentCount - 1].Destroy;
     end;

     for i:=0 to FItemsSelRel.Count - 1 do begin
        While FItemsSelRel[I].Controls.Count > 0 do begin
          If FItemsSelRel[I].Controls[FItemsSelRel[I].Controls.Count - 1] <> Nil then
            FItemsSelRel[I].Controls.Delete(FItemsSelRel[I].Controls.Count - 1);
        end;
        FItemsSelRel[I].LbTitulo    := Nil;
        FItemsSelRel[I].QuebraDetal := Nil;
        FItemsSelRel[I].FQuebraAut  := Nil;
        FItemsSelRel[I].OldReset    := '';
     end;

{    If Relatorio <> Nil Then
     For i:=0 to FParams.Count - 1 do
      If Relatorio.Functions.IndexOf(FParams[i].Campo) > -1 Then
       Relatorio.Functions.DeleteFunction(FParams[i].Campo);}


      If FDadosQuebra.Count > 0 then begin
            For i:=0 to FDadosQuebra.Count - 1 do begin
              FDadosQuebra[I].OldExpQuebra := Null;
               If FDadosQuebra[I].QrGroup <> Nil then begin
                  If FDadosQuebra[I].Qrgroup.FooterBand <> Nil then begin
                     FQuickRep.Owner.Components[FDadosQuebra[I].Qrgroup.FooterBand.ComponentIndex].Destroy;
                     FDadosQuebra[I].Qrgroup.FooterBand := Nil;
                  end;
                  FQuickRep.Owner.Components[FDadosQuebra[I].QrGroup.ComponentIndex].Destroy;
                  FDadosQuebra[I].Qrgroup := Nil;
               end;
            end;
      end;


{     for i:=Quebra.Campos.count - 1 downto 0  do
       If FItemsSelRel[I].Quebra <> Nil then
         FItemsSelRel.Delete(I);}

end;

procedure TSelecaoRel.CriaTotal(Band: TqrCustomBand);
begin
     If Band = Nil then
      exit;

     FBandaTotal := Band;
     FCriaDetalhe;
end;


procedure TSelecaoRel.SetCondExprTotal(const Value: TstringList);
begin
  FCondExprTotal.Assign(Value);
end;


procedure TSelecaoRel.FCriaDetalhe;
var i:ShortInt;
begin

     If VLeft = 0 then
       VLeft := FLeftReport;

     OldCountComponent  := Self.ComponentCount;
     If FBandAlignment = taLeftJustify then
        I := 0
     else
        I := FItemsSelRel.Count - 1;

    While ((I <= FItemsSelRel.Count - 1) and (FBandAlignment = taLeftJustify)) or
           ((I >= 0) and (FBandAlignment = taRightJustify)) do begin
          If Not(((FItemsSelRel[I].Banda <> Nil) and (FItemsSelRel[I].FquebraAut = Nil) and ((FItemsSelRel[I].Banda.Parent <> Self.Relatorio) or (FItemsSelRel[I].Banda <> Self.Banda)))
                 or Not(FItemsSelRel[I].CheckAtual) or (FItemsSelRel[I].Flag = FgFiltro)
                 or ((FItemsSelRel[I].Flag = FGTOTAL)   and (FBandaTotal = Nil))
                 or ((FItemsSelRel[I].Flag = FGDBTEXT) and (FItemsSelRel[I].QuebraDetal <> Nil))
                 or ((FBandaTotal <> Nil) and (FitemsSelRel[i].FquebraAut = Nil) and Not CriandoCompQuebra and (FItemsSelRel[I].SemTotal or (Not(FItemsSelRel[I].Tipo in [FtFloat,FtCurrency])  and  (FItemsSelRel[I].quebra = Nil))))
                 or (CriandoCompQuebra and Not FItemsSelRel[I].CompQuebra))
                 then
                   FCriaCompDetalhe(FItemsSelRel[I]);
           If FBandAlignment = taLeftJustify then
              I := I + 1
           else
              I := I - 1;
    end;






{      for i:=0 to FItemsSelRel.Count - 1 do begin
             If Not(FItemsSelRel[I].FCheckControle.Checked) or (FItemsSelRel[I].Flag = FgFiltro)
                or ((FItemsSelRel[I].Flag = FGTOTAL) and (FBandaTotal = Nil))
                or  ((FBandaTotal <> Nil) and (FItemsSelRel[I].SemTotal or (Not(FItemsSelRel[I].Tipo in [FtFloat,FtCurrency])  and  (FItemsSelRel[I].quebra = Nil))))
                then continue;

             FCriaCompDetalhe(FItemsSelRel[I]);
     end;}

end;

procedure TSelecaoRel.SetDadosQuebra(const Value: TDadosQuebra);
begin
  FDadosQuebra.Assign(Value);
end;

procedure TSelecaoRel.CriaQuebra(Quebra: TDadoQuebra;Resumida:Boolean);
var i,i2,i3:integer;
VLeft:Word;
VItem:TItemSelRel;
begin
      If Quebra = Nil then
       exit;

      If Quebra.TemGroupFooter or Quebra.Resumida then begin
              TQrBand.Create(FQuickRep.Owner).Name := 'QrBandFooterQuebra'+IntToStr(FQuickRep.Owner.ComponentCount);
              With TQrBand(FQuickRep.Owner.FindComponent('QrBandFooterQuebra'+IntToStr(FQuickRep.Owner.ComponentCount))) do begin
                    ParentFont     := True;
                    Parent         := FQuickRep;
                    BandType       := rbGroupFooter;
                    BeforePrint    := PrintGroupQuebra;
                    If Not Quebra.Resumida Then begin
                      Frame.Style := psSolid;
                      Frame.DrawTop := True;
                      Frame.DrawBottom := True;
                    end;
              end;

              If Not Resumida then begin
                  TQrLabel.Create(Self).Name := 'QrLAbelFooterQuebra'+inttostr(Self.ComponentCount);
                  With TQrLabel(Self.FindComponent('QrLAbelFooterQuebra'+IntToStr(Self.ComponentCount))) do begin
                        ParentFont       := True;
                        ParentReport     := FQuickRep;
                        Parent           := TQrBand(FQuickRep.Owner.FindComponent('QrBandFooterQuebra'+IntToStr(FQuickRep.Owner.ComponentCount)));
                        ParentFont       := True;
                        Font.Style       := [fsBold];
                        AutoSize         := True;
                        Caption          := 'TOTAL  '+UpperCase(Quebra.Titulo);
                        Left             := 1;
                        Top              := 1;
                  end;
              end;
       end;

      TQrGroup.Create(FQuickRep.Owner).Name := 'QrGroupQuebra'+IntToStr(FQuickRep.Owner.ComponentCount);

      FBandaTotal := TQrGroup(FQuickRep.Owner.FindComponent('QrGroupQuebra'+IntToStr(FQuickRep.Owner.ComponentCount)));

      With TQrGroup(FQuickRep.Owner.FindComponent('QrGroupQuebra'+IntToStr(FQuickRep.Owner.ComponentCount))) do begin
            Parent           := FQuickRep;
            ParentFont       := True;
            Master           := FQuickRep;
            color            := clScrollBar;
            Frame.Style      := PsSolid;
            Frame.DrawBottom := True;
            Frame.DrawTop    := True;
            expression       := '';
            FooterBand       := TQrBand(FQuickRep.Owner.FindComponent('QrBandFooterQuebra'+IntToStr(FQuickRep.Owner.ComponentCount - 1)));
            Enabled          := Not Resumida;
            ReprintOnNewPage := True;
            BeforePrint      := PrintGroupQuebra;
            Expression       := Quebra.Expression;
            If Not Resumida Then
             ForceNewPage := Quebra.QuebraPagina;
      end;

     FDadosQuebra[Quebra.Index].QrGroup  := TQrGroup(FQuickRep.Owner.FindComponent('QrGroupQuebra'+IntToStr(FQuickRep.Owner.componentcount)));
     FDadosQuebra[Quebra.Index].Resumida := Resumida;

     If Quebra.ListaCampos.Count > 0 then begin
           for i:=0 to Quebra.ListaCampos.count - 1 do
             if FitemsSelRel.ItemsPorTitulo(Quebra.ListaCampos[i]) <> Nil then begin
                  FCriaQuebraAut := True;
                  VItem := TItemSelRel.Create(Nil);
                  VItem.Assign(FitemsSelRel.ItemsPorTitulo(Quebra.ListaCampos[i]));

                  if Quebra.TemGroupFooter and Quebra.Resumida then
                    for i2:=Quebra.Index - 1 downto 0 do
                      if FDadosQuebra[i2].TemGroupFooter and FDadosQuebra[i2].Resumida
                         and (FDadosQuebra[i2].ListaCampos.IndexOf(Quebra.ListaCampos[i]) > -1) then begin
                           For i3:=0 to Self.ComponentCount - 1 do
                            if (Self.Components[i3] is TQrLabel) then
                             if  (UpperCase(TQrLabel(Self.Components[i3]).Caption) = UpperCase(Quebra.ListaCampos[i]))then begin
                                 VItem.LbTitulo := TQrLabel(Self.Components[i3]);
                                 break;
                             end;
                            break;
                      end;




                  Vitem.FQuebraAut  := Quebra;
                  If Not Resumida then begin
                    VItem.Banda       := Quebra.QrGroup;
                    VItem.BandaTitulo := Quebra.QrGroup;
                  end else
                    VItem.Banda       := Quebra.QrGroup.FooterBand;
                  Vitem.Quebra        := Quebra;
                  FCriaCompDetalhe(VItem);
                  Vitem.Destroy;
                  FCriaQuebraAut      := False;
             end;
      end else begin
            for i:=0 to Quebra.Campos.count - 1  do begin
                           If Quebra.Campos[I].CampoDesativado then
                             continue;

                            TQrGroup(FQuickRep.Owner.FindComponent('QrGroupQuebra'+IntToStr(FQuickRep.Owner.componentcount))).expression
                              := TQrGroup(FQuickRep.Owner.FindComponent('QrGroupQuebra'+IntToStr(FQuickRep.Owner.componentcount))).expression +  IIfs(TQrGroup(FQuickRep.Owner.FindComponent('QrGroupQuebra'+InttoStr(FQuickRep.Owner.componentcount))).Expression <> '',' + ','')+FQuickRep.Dataset.Name+'.'+Quebra.Campos[i].Campo;

                           If Resumida then
                              continue;

                          For i2:=0 to FItemsSelRel.Count - 1 do
                           If (FitemsSelRel[i2].Flag = FgDbText) and
                              ((Uppercase(Quebra.Campos[I].Campo) = Uppercase(Fitemsselrel[i2].Campo)) or (Uppercase(Quebra.Campos[I].Descricao) = Uppercase(Fitemsselrel[i2].Campo)))
                               then
                                 FItemsSelRel[I2].QuebraDetal := Quebra;

                          TQrLabel.Create(Self).Name := 'QrSelRelQuebra'+IntToStr(Self.ComponentCount);
                          With TqrLabel(Self.FindComponent('QrSelRelQuebra'+IntToStr(Self.ComponentCount))) do begin
                             AutoSize      := true;
                             Caption       := Quebra.Campos[i].Titulo;
                             ParentReport  := FQuickRep;
                             Parent        := TQrGroup(FQuickRep.Owner.FindComponent('QrGroupQuebra'+IntToStr(FQuickRep.Owner.ComponentCount)));
                             If Parent.ControlCount = 1 then
                               Alignment     := taLeftJustify
                             else If ((Parent.ControlCount = 2) and (Quebra.Campos.count = 2)) or (Parent.ControlCount > 2) then
                               Alignment     := taRightJustify
                             else If ((Parent.ControlCount = 2) and (Quebra.Campos.count > 2)) then
                               Alignment     := taCenter;
            //                 Left          := IIfs(Parent.ControlCount = 1,0,Parent.Width - (Parent.Width div Parent.ControlCount) - (Width div 2));
                             AlignToBand   := True;
                             Color         := TQrBand(Parent).Color;
                             Top           := 2;
                             OnPrint       := OnPrintQuebra;
                             Font.Size     := FQuickRep.Font.Size;
                             Font.Color    := ClBlack;
                             Font.Style    := [fsBold];
                             FDadosQuebra[Quebra.Index].Campos[I].QrLabel := TqrLabel(Self.FindComponent('QrSelRelQuebra'+IntToStr(Self.ComponentCount)));
                             TQrGroup(Parent).Height := Height + 3;
                         end;
             end;
      end;

      If Not Resumida then begin
           CriandoCompQuebra := True;
           FCriaDetalhe;
           CriandoCompQuebra := False;
      end;


end;

procedure TSelecaoRel.OnPrintQuebra(Sender: TObject; var Value: String);
var
I,I2 : Integer;
begin


     For i:=0 to FDadosQuebra.Count - 1 do
      If TQrLabel(Sender).Parent = FDadosQuebra[I].QrGroup then
        Break;

     For i2:=0 to FDadosQuebra[i].Campos.count - 1 do
       If TQrLabel(Sender) = FDadosQuebra[I].Campos[i2].QrLabel then
         break;

     Value := FDadosQuebra[I].Campos[i2].Titulo;


     If FDadosQuebra[I].Campos[I2].Codigo then
       Value := Value+'    '+FQuickRep.DataSet.FieldByName(FDadosQuebra[I].Campos[I2].Campo).AsString;


     If FDadosQuebra[I].Campos[I2].Descricao <> '' then
        Value := Value +'    '+FQuickRep.DataSet.FieldByName(FDadosQuebra[I].Campos[I2].Descricao).AsString;

     If Assigned(FDadosQuebra[I].Campos[I2].OnPrint) then
       FDadosQuebra[I].Campos[I2].OnPrint(Sender,Value);

end;

procedure TSelecaoRel.CriaTotalQuebra(Quebra:TDadoQuebra);
var i:Integer;
    FItemSelRel:TItemSelRel;
begin

     If (Quebra.QrGroup = nil) or (Quebra.QrGroup.FooterBand = Nil) then
      exit;

     CriandoQuebraResumida := Quebra.Resumida;

     If Quebra.Resumida  Then begin
        FBandaTotal := Nil;
         for i:=0 to Quebra.Campos.count - 1 do begin
           If Quebra.Campos[I].CampoDesativado then
             continue;

           FItemSelRel := TItemSelRel.Create(Nil);
           FItemSelRel.Quebra      := Quebra;
           FItemSelRel.Flag        := FGDbText;
           FItemSelRel.Banda       := Quebra.QrGroup.FooterBand;;
           FItemSelRel.BandaTitulo := Self.BandaTitulo;
           FItemSelRel.DataSet     := FQuickRep.DataSet;
           If Quebra.Campos[I].Descricao <> '' then
              FItemSelRel.Campo       := Quebra.Campos[I].Descricao
           else
              FItemSelRel.Campo       := Quebra.Campos[I].Campo;
           FItemSelRel.Tamanho     := Quebra.Campos[I].Tamanho;
           FItemSelRel.Titulo      := Quebra.Campos[I].Titulo;
           FItemSelRel.OnPrint     := Quebra.Campos[I].OnPrint;
           FCriaCompDetalhe(FItemSelRel);
           FItemSelRel.Destroy;
         end;
     end;

     FBandaTotal := Quebra.QrGroup.FooterBand;

     FCriaDetalhe;

     Quebra.QrGroup.FooterBand.Enabled := Quebra.QrGroup.FooterBand.ControlCount > 1;

     CriandoQuebraResumida := False;

end;


procedure TSelecaoRel.FCriaCompDetalhe(FItemSelRel: TItemSelRel);
var a,b,FtotWidth,FoldWidth,Vtop,i,i2,i3,I4:Integer;
    FValue,Exp : String;
    VItemSelRel3,VItemSelRel2,VItemSelRel: TItemSelRel;
    OldFontCanvas:TFont;
    VDadoQuebra:TDadoQuebra;
begin
      If FItemSelRel.DataSet = Nil then
         FItemSelRel.DataSet := FQuickRep.DataSet;

      For i:=0 to Quebras.count - 1 do
       If Not Quebras[i].DesABILITADA and (Quebras[i].ListaCampos.IndexOf(FItemSelRel.Titulo) > -1) and (FitemSelRel.FQuebraAut = Nil) then
         exit;


      OldFontCanvas := TFont.Create;
      OldFontCanvas.Assign(TForm(Self.Owner).Canvas.Font);
      try

             If (FItemSelRel.LbTitulo =  Nil) {or (Self.BandaTitulo <> FItemSelRel.LbTitulo.Parent)} then begin
                TQrLabel.Create(Self).Name := 'QrLbTit'+IntToStr(Self.ComponentCount);
                With TQrLabel(Self.FindComponent('QrLbTit'+IntToStr(Self.ComponentCount))) do begin
                      FItemSelRel.LbTitulo := TQrLabel(Self.FindComponent('QrLbTit'+IntToStr(Self.ComponentCount)));


                      If (FItemSelRel.FQuebraAut <> Nil) and Not FitemSelrel.FquebraAut.Resumida then
                        Parent        := FItemSelRel.FQuebraAut.QrGroup
                      else If FItemSelRel.BandaTitulo = Nil then
                        Parent        := Self.BandaTitulo
                      else
                        Parent        := FItemSelRel.BandaTitulo;
                      Tag           := FItemSelRel.Tag;  
                      Color         := TQrBand(Parent).Color;
                      ParentReport  := FQuickRep;
                      AutoSize      := False;
                      Caption       := FItemSelRel.Titulo;
                      Alignment     := FItemSelRel.Alignment;
                      Top           := 1;
                      AlignToBand   := FitemSelRel.AlignToBand and Not CriandoQuebraResumida and (Alignment = taRightJustify);
                      TForm(Self.Owner).Canvas.Font.Assign(Font);
                      If ((FItemSelRel.TamanhoQtde <> 0) or (FItemSelRel.Tamanho <> 0)) and Not((FitemSelrel.FQuebraAut <> Nil) and Not FitemSelrel.FQuebraAut.Resumida)  then
                        Width         := Iifs(FItemSelRel.TamanhoQtde > 0,TForm(Self.Owner).Canvas.TextWidth(IIfs(Fitemselrel.tipo in [FtString,FtMemo],'W','9')) * (FItemSelRel.TamanhoQtde + 1),FItemSelRel.Tamanho)
                      else
                        AutoSize      := True;
                      If (Parent.ControlCount = 1) and Not FItemSelRel.LbTitulo.AlignToBand then
                         Left := FLeftReport
                      else begin
                            for i:=Parent.ControlCount - 1 downto 0 do begin

                                       VItemSelRel := FItemsSelRel.ItemsPorTitulo(TQrLabel(Parent.Controls[i]).Caption);


                                          If CriandoQuebraResumida or
                                          ((VItemSelRel = Nil) and Not TQrLabel(Parent.Controls[i]).AlignToBand)
                                          or  (AligntoBand = VItemSelRel.AlignToBand) then begin

                                                    If Not AligntoBand  or CriandoQuebraResumida  then begin
                                                             If i = Parent.ControlCount - 1 then
                                                               continue;

                                                             Left := TQrCustomLAbel(Parent.Controls[I]).Width +
                                                                     TQrCustomLAbel(Parent.Controls[I]).Left  + 3;
                                                             break;
                                                    end;

                                                    If Relatorio.Page.Orientation <> poLandScape then
                                                             For i2:=Self.ComponentCount - 1 downto 0  do begin
                                                                  If  (Self.Components[I2] is TQrCustomLabel) and Not(TQrCustomLabel(Self.Components[I2]).Parent  is TQrGroup)
                                                                  and (TQrLAbel(Parent.Controls[I]).Left <> TQrCustomLabel(Self.Components[I2]).Left)
                                                                  And Not TQrLabel(Self.Components[I2]).aligntoband
                                                                  And Not((Items.ItemsPorObj(TQrCustomLabel(Self.Components[I2])) <> nil) and Items.ItemsPorObj(TQrCustomLabel(Self.Components[I2])).AlignToBand)
                                                                  and (TQrLAbel(Parent.Controls[I]).Left  - Width - 3   > TQrCustomLabel(Self.Components[I2]).Left)
                                                                  and (TQrLAbel(Parent.Controls[I]).Left  - Width - 3  < TQrCustomLabel(Self.Components[I2]).Left +
                                                                      TQrCustomLabel(Self.Components[I2]).Width ) then begin
                                                                        FOldWidth                  := Parent.Width;
                                                                        CPrint.Orientation         := 1;
                                                                        Relatorio.Page.Orientation := poLandScape;
                                                                        For i3:=0 to Self.ComponentCount - 1 do begin

                                                                               If Not(Self.Components[i3] is TQrLabel) then
                                                                                 continue;

                                                                               VItemSelRel2 := FItemsSelRel.ItemsPorTitulo(TQrLabel(Self.Components[i3]).Caption);
                                                                               If (VItemSelRel2 <> Nil) and VItemSelRel2.AlignToBand And (VItemSelRel2.Lbtitulo <> Nil) then begin
                                                                                    VItemSelRel2.LbTitulo.Left := Parent.Width - (FoldWidth - VItemSelRel2.Lbtitulo.Left);
                                                                                     If VItemSelRel2.Controls.Count > 0 then
                                                                                       For I4:=0 to VItemSelRel2.Controls.Count - 1 do
                                                                                            TQrCustomLabel(VItemSelRel2.Controls[I4]).Left   := VItemSelRel2.LbTitulo.Left;
                                                                               end;
                                                                        end;
                                                                       Break;
                                                                 end;
                                                             end;


                                                    If  (I = Parent.ControlCount - 1) then
                                                      continue;


                                                    TQrLAbel(Parent.Controls[I]).AlignToBand := False;
                                                    TQrLAbel(Parent.Controls[I]).Left := TQrLAbel(Parent.Controls[I]).Left  - Width  - 3;







                                                   If VItemSelRel.Controls.Count > 0 then
                                                      For i2:=0 to VItemSelRel.Controls.Count - 1 do begin
                                                            TQrDbText(VItemSelRel.Controls[i2]).AlignToBand := False;
                                                            TQrCustomLabel(VItemSelRel.Controls[i2]).Left   := TQrLAbel(Parent.Controls[I]).Left;
                                                            TQrCustomLabel(VItemSelRel.Controls[i2]).Width  := TQrLAbel(Parent.Controls[I]).Width;
                                                      end;

                                          end;
                            end;
                      end;
                end;
             end;

             FVALUE := '';
             If FItemSelRel.Flag <> FGDbText then
                for i2:=0 to FItemSelRel.Expression.Count - 1 do
                   FValue := FValue + FItemSelRel.Expression[i2]
             else
                 FValue := FItemSelRel.Campo;

             If (FBandaTotal = Nil) and (Assigned(OnCreateQrControls))  then
                  OnCreateQrControls(FItemSelRel,FValue)
             else if (FBandaTotal <> Nil) then begin
                 If (FCondExprTotal.Text <> '') and FItemSelRel.CondExprTotal then begin
                        for i2:=0 to FCondExprTotal.Count - 1 do
                          Exp := Exp +' '+ FCondExprTotal[I2];
                        If FItemSelRel.Flag = FGDbText then
                          FValue := FItemSelRel.DataSet.Name+'.'+FValue;
                        FValue := 'IF('+Exp+','+FValue+','+FValue+' - '+FValue+')';
                 end;

                 If FItemSelRel.Tipo in [FtFloat,FtCurrency] then begin
                       VDadoQuebra := Nil;
                       If (FBandaTotal is TqrBand) and (TQrBand(FBandaTotal).BandType = rbGroupFooter) then 
                           For i2:=0 to FdadosQuebra.Count - 1 do
                             If (FBandaTotal <> Nil) and
                                Not FdadosQuebra[i2].Desabilitada and
                                (FdadosQuebra[i2].QrGroup <> Nil) and
                                (FdadosQuebra[i2].QrGroup.FooterBand <> Nil) and
                                (FdadosQuebra[i2].QrGroup.FooterBand = FBandaTotal) then begin
                                 VDadoQuebra := FdadosQuebra[i2];
                                 Break;
                             end;


                       If FItemSelRel.Total and                         
                          Not(FitemSelRel.TotalResumido and
                             (VdadoQuebra <> Nil) and
                             VDadoQuebra.Resumida) then
                             FValue :=  'SUM('+FValue+')';

                       If FItemSelRel.Media and
                          Not(FitemSelRel.TotalResumido and
                             (VdadoQuebra <> Nil) and
                             VDadoQuebra.Resumida) then
                            FValue :=  'AVERAGE('+FValue+')';
                 end;

                 If Assigned(OnCreateQrControls) then
                    OnCreateTotal(FItemSelRel,FValue);
             end;


             If (FItemSelRel.Flag = FGDbText) and ((FBandaTotal = Nil) or ((FItemSelRel.FquebraAut <> Nil) and Not FItemSelRel.FquebraAut.Resumida)  or (FItemSelRel.quebra <> Nil)) then begin
                TQrDbText.Create(Self).Name := 'QrDado'+IntToStr(Self.ComponentCount);
                With TQrDbText(Self.FindComponent('QrDado'+IntToStr(Self.ComponentCount))) do begin
                    DataSet       := FItemSelRel.DataSet;
                    DataField     := FValue;
                    Mask          := FItemSelRel.Mascara;
                    OnPrint       := PrintCompDateTime;
{                    If (FItemSelRel.Tipo in [FtMemo,FtFloat,FtCurrency,FtDateTime,FtDate,FtTime]) then
                      OnPrint := PrintCompDateTime
                    else If Assigned(FItemSelRel.OnPrint) then
                      OnPrint := FItemSelRel.OnPrint;}
                end;
             end else  begin
                TQrExpr.Create(Self).Name := 'QrDado'+IntToStr(Self.ComponentCount);
                With TQrExpr(Self.FindComponent('QrDado'+IntToStr(Self.ComponentCount))) do begin
                    ResetAfterPrint := FItemSelRel.ResetAfterPrint;
                    Expression      := FValue;
                    Mask            := FItemSelRel.Mascara;
                    OnPrint       := PrintCompDateTime;
                    With DivideMemo(Expression) do
                     try
                       for i:=0 to count - 1 do
                        if Pos('CHR',UpperCase(Strings[i])) > 0 then begin
                          AutoStretch := True;
                          Break;
                        end;
                     finally
                       destroy;
                     end;
                end;
             end;

             With TQrCustomLAbel(Self.Components[Self.ComponentCount - 1]) do begin
                  If (FitemSelRel.Quebra <> nil) or ((FitemSelRel.FQuebraAut <> Nil) and Not FItemSelRel.FquebraAut.resumida) then
                    Parent        := FitemSelRel.Banda
                  else if (FBandaTotal = Nil) Then begin
                    If (FItemSelRel.BandaTitulo = Nil) or (FItemSelRel.Banda = nil) then
                      Parent        := Self.Banda
                    else
                      Parent        := FItemSelRel.Banda;
                  end else
                    Parent        := FBandaTotal;
                  Tag           := FItemSelRel.Tag;
                  Color         := TQrBand(Parent).Color;  
                  ParentReport  := FQuickRep;
                  Color         := TQrBand(Parent).color;
                  Alignment     := FItemSelRel.Alignment;
                  AutoSize      := False;
                  if not AutoStretch then
                    AutoStretch   := FItemSelRel.Tipo = FtMemo;
                  Top           := 1;
                  TForm(Self.Owner).Canvas.Font.Assign(Font);
                  Left          := FItemSelRel.LbTitulo.Left+IIfs((FitemSelRel.FQuebraAut <> Nil)  and not FitemSelRel.FQuebraAut.Resumida
                                                                 ,TForm(Self.Owner).Canvas.textwidth(FItemSelRel.LbTitulo.CAption) + 5,0);
                  AutoSize      := False;
                  if (FitemSelrel.FquebraAut = nil) or FitemSelrel.FquebraAut.Resumida  then
                     Width    := FItemSelRel.LbTitulo.Width
                  else begin
                     Width    := Iifs(FItemSelRel.TamanhoQtde > 0,TForm(Self.Owner).Canvas.TextWidth(IIfs(Fitemselrel.tipo in [FtString,FtMemo],'W','9')) * (FItemSelRel.TamanhoQtde + 1),FItemSelRel.Tamanho);
                     AutoSize := (FItemSelRel.Tamanho = 0) and (FItemSelRel.TamanhoQtde = 0);
                  end;   

                  FItemSelRel.Controls.Add(TQrCustomLAbel(Self.Components[Self.ComponentCount - 1]));
                  TQrBand(Parent).Height := Height + 2;
                  If (TQrCustomLAbel(Self.Components[Self.ComponentCount - 1]) is TQrExpr) and (Parent is TQrSubDEtail) then
                     TQrExpr(Self.Components[Self.ComponentCount - 1]).Master := TQrSubDetail(TQrExpr(Self.Components[Self.ComponentCount - 1]).Parent);
             end;
      finally
         TForm(Self.Owner).Canvas.Font.Assign(OldFontCanvas);
         OldFontCanvas.Destroy;
      end;
end;

procedure TSelecaoRel.SetFiltros(const Value: TItemsSelRel);
begin
  FFiltros.Assign(Value);
end;



Function TSelecaoRel.GeraSqlFiltros:TStringList;
var i,i2:Integer;
begin
   Result := TStringList.Create;
   for i:=0 to FFiltros.Count - 1 do Begin
          If (FFiltros[i].NaoGeraSql) or (FFiltros[i].Filtro.Text = '') or  ((FFiltros[i].FCheckControleContrario <> Nil) and (FFiltros[i].FCheckControleContrario.Checked = FFiltros[i].FCheckControle.Checked)) then
           continue;

          If Not FFiltros[i].FCheckControle.Checked Then begin
               if FFiltros[i].FiltroSql and (FFiltros[i].NFiltro.Text <> '') and
                  (Result.IndexOf('And ( '+StringsToStr(FFiltros[i].NFiltro.Text)+' )') = -1) then
                    Result.Add('And ( '+StringsToStr(FFiltros[i].NFiltro.Text)+' )');

               Result.add(IIfs(Result.Text <> '',' And ',' ')+' Not ( ');
               for i2:=0 to FFiltros[i].Filtro.Count - 1 do
                  result.add(FFiltros[i].Filtro[i2]);
               Result.add(' ) ');
          end;

          If (FFiltros[i].FCheckControleContrario <> Nil) and  Not FFiltros[i].FCheckControleContrario.Checked then begin
               Result.add(IIfs(Result.Text <> '',' And ',' ')+' ( ');
               for i2:=0 to FFiltros[i].Filtro.Count - 1 do
                  result.add(FFiltros[i].Filtro[i2]);
               Result.add(' ) ');
          end;
   end;
end;

function TSelecaoRel.SqlCampos: TStringList;
var i:word;
begin
   Result := TStringList.Create;
   For i:=0 to FItemsSelRel.Count - 1 do begin
        If FItemsSelRel[I].Flag <> FGDbText then
          continue;
        If Result.Text <> '' then
          Result.Add(',');
        If FItemsSelRel[I].Sql.Text <> '' then begin
           Result.AddStrings(FItemsSelRel[I].Sql);
           Result.Add(' as ');
        end;
        Result.Add(FItemsSelRel[I].Campo);
   end;
end;


procedure TSelecaoRel.PrintCompDateTime(sender: TObject;
  var Value: String);
Var FItemSelRel : TItemSelRel;
    FStr:TStringList;
begin
{     iF (FItemsSelRel.ItemsPorObj(TQrCustomLabel(Sender)) <> nIL) AND
        (FItemsSelRel.ItemsPorObj(TQrCustomLabel(Sender)).Tipo = fTmEMO) Then begin
         FStr      := TStringList.Create;
         FStr.Text := Value;
         DivLimiteStrings(FStr,FItemsSelRel.ItemsPorObj(TQrCustomLabel(Sender)).TamanhoQtde);
         Value := FStr.Text;
     end ELSE} If (sENDER IS tqRDBTEXT) AND
                 (TQrDbText(Sender).DataSet <> Nil) and
                 (TQrDbText(Sender).DataSet.FindField(TQrDbText(Sender).DataField) <> Nil) then begin
           If (TQrDbText(Sender).DataSet.FieldByName(TQrDbText(Sender).DataField).DataType in [FtDate,FtTime,FtDateTime]) and
              (TQrDbText(Sender).DataSet.FieldByName(TQrDbText(Sender).DataField).AsDateTime = 0) then
                Value := '';

           If (TQrDbText(Sender).DataSet.FieldByName(TQrDbText(Sender).DataField).DataType in [FtFloat,FtCurrency]) and
              (TQrDbText(Sender).Mask = '') and
              (TQrDbText(Sender).DataSet.FieldByName(TQrDbText(Sender).DataField).IsNull) then
                Value := '0';
    end;
    If (FItemsSelRel.ItemsPorObj(TQrCustomLabel(Sender)) <> nIL) AND Assigned(FItemsSelRel.ItemsPorObj(TQrCustomLabel(Sender)).OnPrint)  then
      FItemsSelRel.ItemsPorCampo(TQrDbText(Sender).DataField).OnPrint(Sender,Value);
end;




procedure TSelecaoRel.OcupaEspacosVazios(Values: array of String);
var VarMaxLeft,VarLeftAlign,VarWidth,VarNewWidth,
i,i2,i3:word;
VitemVAlue:TitemSelRel;
begin
          VarWidth := 0;
          VarMaxLeft := 0;
          VarLeftAlign := 0;
          for i:=0 to FBandTit.ControlCount - 1 do
            For i2:=0 to Length(Values) - 1 do
               If (FBandTit.Controls[I] is TQrCustomLabel) and
                  (UpperCase(TQrCustomLabel(FBandTit.Controls[I]).Caption) = UpperCase(Values[I2])) and
                  (VarMaxLeft < TQrCustomLabel(FBandTit.Controls[I]).Left)  then
                     VarMaxLeft := TQrCustomLabel(FBandTit.Controls[I]).Left;

          VarLeftAlign := FBandTit.Width;  
          for i:=0 to FBandTit.ControlCount - 1 do begin
              If Not(FBandTit.Controls[I] is TQrCustomLabel) or
                    (VarMaxLeft > TQrCustomLabel(FBandTit.Controls[I]).Left)  then
                      continue;

              VItemValue := Items.ItemsPorTitulo(TQrCustomLabel(FBandTit.Controls[I]).Caption);
              If (VItemValue <> Nil) and VitemValue.AlignToBand then begin
                  if(TQrCustomLabel(FBandTit.Controls[I]).Left < VarLeftAlign) then
                     VarLeftAlign := TQrCustomLabel(FBandTit.Controls[I]).Left;
                  continue;
              end;
              VarWidth := VarWidth + TWincontrol(FBandTit.Controls[I]).Width + 3;
          end;

          If (VarWidth + VarMaxLeft + 3) > VarLeftAlign then
            exit;


         VarNewWidth := VarLeftAlign - VarMaxLeft - VarWidth - 3;

         For i:=0 to FBandTit.ControlCount - 1 do begin
                  If Not(FBandTit.Controls[I] is TQrCustomLabel) or
                        (VarMaxLeft > TQrCustomLabel(FBandTit.Controls[I]).Left) or
                         TQrLabel(FBandTit.Controls[I]).AlignToBand  then
                          continue;


                  For i2:=0 to Length(Values) - 1 do
                    If UpperCase(TQrCustomLabel(FBandTit.Controls[I]).Caption) = UpperCase(Values[I2]) then
                      Break;

                  If I2 <= Length(Values) - 1  then begin
                       TQrCustomLabel(FBandTit.Controls[I]).Width := TQrCustomLabel(FBandTit.Controls[I]).Width +
                       VarNewWidth div Length(Values);

                       VItemValue := Items.ItemsPorTitulo(Values[I2]);

                       If (VitemValue <> Nil) and (VItemValue.Controls.Count > 0) then
                          For i3:=0 to VItemValue.Controls.Count - 1 do
                            TQrCustomLabel(VItemValue.controls[I3]).Width :=
                            TQrCustomLabel(VItemValue.controls[I3]).Width + VarNewWidth div Length(Values);
                       continue;
                  end;

                  VItemValue := Items.ItemsPorTitulo(TQrCustomLabel(FBandTit.Controls[I]).Caption);

                 If (VItemValue <> Nil) and VitemValue.AlignToBand then
                    continue;

                  TQrCustomLabel(FBandTit.Controls[I]).Left := TQrCustomLabel(FBandTit.Controls[I]).Left +
                  VarNewWidth;


                  If (VitemValue <> Nil) and (VItemValue.Controls.Count > 0) then
                     For i3:=0 to VItemValue.Controls.Count - 1 do
                       TQrCustomLabel(VItemValue.controls[I3]).Left :=  TQrCustomLabel(VItemValue.controls[I3]).Left +
                       VarNewWidth;
         end;


end;


procedure TSelecaoRel.PrintGroupQuebra(Sender: TQrCustomBand;var PrintBand: Boolean);
var FExp,FSql,ValueQuebra:String;
    F:Boolean;
    I,I2,I3:Integer;
    VParams:TParams;
    Fquery,VQuery:Tquery;
begin
  try
    F := True;
    For i:=0 to FDadosQuebra.Count - 1 do begin
      If Not FDadosQuebra[I].Desabilitada and (FDadosQuebra[I].QrGroup <> Nil) then
         If (Not FDadosQuebra[I].REsumida and (FDadosQuebra[I].QrGroup = TQrGroup(Sender))) or
            (FDadosQuebra[I].REsumida and (FDadosQuebra[I].QrGroup.FooterBand = TQrBand(Sender))) then begin
              GeraParametros(FDadosQuebra[i].Titulo);
               for i2:=0 to Items.Count - 1 do begin
                  With TQREvaluator.Create do
                    Try
                      DataSets    := Self.FQuickRep.AllDataSets;
                      Environment := Self.FQuickRep.Functions;
                      Environment.Prepare;
                      With Calculate(StringsToStr(FDadosQuebra[I].QrGroup.Expression)) do
                       case kind of
                       ResInt:Fexp := IntToStr(IntResult);
                       resDouble:FExp := FloatToStr(DblResult);
                       else
                       Fexp := StrResult;
                       end;
                    finally
                      Environment.UnPrepare;
                      Destroy;
                    end;
                 If (Items[i2].QuebrasReset.IndexOf(FDadosQuebra[i].Titulo) > -1) and
                    (items[i2].OldReset <> Items[i2].QuebrasReset[Items[i2].QuebrasReset.IndexOf(FDadosQuebra[i].Titulo)] + FExp) then
                     for i3:=0 to Items[i2].Controls.Count - 1 do
                       If TQrCustomLabel(Items[i2].Controls[i3]) is  TQrExpr then
                         If ((Relatorio.BandList.IndexOf(TQrCustomLabel(Items[i2].Controls[i3]).Parent)) >=
                             (Relatorio.BandList.IndexOf(FDadosQuebra[i].QrGroup))
                             ) and
                            ((Relatorio.BandList.IndexOf(TQrCustomLabel(Items[i2].Controls[i3]).Parent)) <=
                             (Relatorio.BandList.IndexOf(FDadosQuebra[i].QrGroup.FooterBand))) then begin
                               Items[i2].OldReset := Items[i2].QuebrasReset[Items[i2].QuebrasReset.IndexOf(FDadosQuebra[i].Titulo)]+Fexp;
                               TQrExpr(Items[i2].Controls[i3]).Reset;
                         end;
                end;
              Break;
         end;
    end;

    For i:=0 to FDadosQuebra.Count - 1 do
      If (FDadosQuebra[I].QrGroup <> nil) and
         ((FDadosQuebra[I].QrGroup = TQrGroup(Sender)) or
         (FDadosQuebra[I].QrGroup.FooterBand = TQrbaND(Sender))) Then Begin
            With TQREvaluator.Create do
              Try
                DataSets    := Self.FQuickRep.AllDataSets;
                Environment := Self.FQuickRep.Functions;
                Environment.Prepare;
                With Calculate(StringsToStr(FDadosQuebra[I].QrGroup.Expression)) do
                 case kind of
                 ResInt:Fexp := IntToStr(IntResult);
                 resDouble:FExp := FloatToStr(DblResult);
                 else
                 Fexp := StrResult;
                 end;
                 fexp := iifs(Sender is TQrGroup,'G','B')+fexp;
              finally
                Environment.UnPrepare;
                Destroy;
              end;


           If VarIsNull(FDadosQuebra[I].OldExpQuebra) or (FExp <> FDadosQuebra[I].OldExpQuebra) Then
             FExpQuebra(FDadosQuebra[I].Titulo);
           FDadosQuebra[I].OldExpQuebra := Fexp;

           For i2:=0 to FDadosQuebra.Count - 1 do
            If (i <> i2) and
               (FDadosQuebra[i2].QrGroup <> Nil) and
               (FDadosQuebra[i2].QrGroup.Master = FDadosQuebra[i].QrGroup.Master) and
               (TQuickRep(FDadosQuebra[i2].QrGroup.Master).BandList.IndexOf(FDadosQuebra[i2].QrGroup) > -1) and
               (TQuickRep(FDadosQuebra[i2].QrGroup.Master).BandList.IndexOf(FDadosQuebra[i2].QrGroup) >
                TQuickRep(FDadosQuebra[i].QrGroup.Master).BandList.IndexOf(FDadosQuebra[i].QrGroup)) then               
                  FDadosQuebra[I2].OldExpQuebra := NULL;

           break;
      end;


    If Not(Sender Is TQrGroup) then begin
        For i:=0 to FDadosQuebra.Count - 1 do
         If Not FDadosQuebra[I].Desabilitada and (FDadosQuebra[I].QrGroup <> Nil) then
            If FDadosQuebra[I].REsumida and (FDadosQuebra[I].QrGroup.FooterBand = TQrBand(Sender))
               and Assigned(FDadosQuebra[I].OnPrintQrGroupFooterFooter) then begin
                  FDadosQuebra[I].OnPrintQrGroupFooterFooter(Sender,F);
                  Break;
            end;
        Exit;
    end;

    For i:=0 to FDadosQuebra.Count - 1 do begin
        If FDadosQuebra[I].QrGroup = TQrGroup(Sender) then begin
            If FDadosQuebra[I].ListaCampos.Count > 0 then
              exit;

            If Assigned(FDadosQuebra[I].OnPrintQrGroup) then
              FDadosQuebra[I].OnPrintQrGroup(Sender,F);

             For i2:=0 to FDadosQuebra[I].Campos.Count - 1 do begin
               ValueQuebra := VAlueQuebra+IIfs(ValueQuebra <> '',' ','')+FDadosQuebra[I].Titulo;
               If FDadosQuebra[I].Campos[i2].Codigo then
                  VAlueQuebra := VAlueQuebra+' '+FQuickRep.Dataset.FieldByName(FDadosQuebra[I].Campos[i2].Campo).AsString;
               If FDadosQuebra[I].Campos[i2].Descricao <> '' then
                  VAlueQuebra := VAlueQuebra+' '+FQuickRep.Dataset.FieldByName(FDadosQuebra[I].Campos[i2].Descricao).AsString;
             end;
             Break;
        end;
    end;

    If (Length(Findices) > 0) then
        Findices[Length(Findices) - 1].PgFim  := FQuickRep.PageNumber;

    If (Length(Findices) = 0) then begin
          SetLength(Findices,1);
          Findices[0].Titulo := ValueQuebra;
          Findices[0].PgIni  := 1;
          Findices[0].PgFim  := 1;
    end else If Findices[Length(Findices) - 1].Titulo <> ValueQuebra then begin
          SetLength(Findices,Length(Findices) + 1);
          Findices[Length(Findices) - 1].Titulo := ValueQuebra;
          Findices[Length(Findices) - 1].PgIni  := FQuickRep.PageNumber;
          Findices[Length(Findices) - 1].PgFim  := FQuickRep.PageNumber;
    end;
  finally
{    if printband then
     for i:=0 to Quebras.Count - 1 do
      If (Quebras[i].QrGroup = Sender) and Assigned(Quebras[i].OnPrintQrGroup) then
       Quebras[i].OnPrintQrGroup(Sender,PrintBand);}
  end;
end;

procedure TSelecaoRel.FiltrosSql(DataSet: TDataSet;Campo:String;IndIni:Integer;FParent:TWincontrol;VNFiltro:String='';VDFiltro:String='');
Var FindIni:Integer;
begin
 If Not DataSet.Active then
    DataSet.Open;

  With DataSet do begin

       If IndIni > -1 then
           FindIni := IndIni
       else
           FIndIni := Filtros.Count;

       While Not Eof do begin
              Filtros.Add;
              Filtros[Filtros.Count - 1].Index := FIndIni;
              Filtros[FIndIni].Campo           := IIfs(Campo <> '',Campo,Fields[0].FieldName);
              Filtros[FIndIni].Tipo            := Fields[0].DataType;
              Filtros[FIndIni].Titulo          := Fields[1].AsString;
              Filtros[FIndIni].Value           := VarToStr(Fields[0].Value);
              Filtros[FIndIni].Filtro.Text     := IIfs(Campo <> '',Campo,Fields[0].FieldName)+' = '''+Fields[0].AsString+'''';
              Filtros[FIndIni].FiltroSql       := True;
              Filtros[FIndIni].NFiltro.Text    := VNFiltro;
              Filtros[FIndIni].Panel           := FParent;
              If VDFiltro = '' Then
                Filtros[FIndIni].Checked         := True
              else
                  With TQrEvaluator.Create do begin
                    Try
                      DataSets.Add(DataSet);
                      Environment:= QrGlobalEnvironment;
                      Environment.Prepare;
                      Filtros[FIndIni].Checked := Not Calculate(StringsToStr(VDFiltro)).booResult;
                    finally
                      Destroy;
                    end;


              end;

              FindIni := FIndIni + 1;
              Next;
       end;
  end;
end;

procedure TSelecaoRel.SetFaixasSelRel(const Value: TFaixasSelRel);
begin
  FFaixasSelRel.Assign(Value);
end;

procedure TSelecaoRel.SetParams(const Value: TItemsSelRel);
begin
  FParams.Assign(Value);
end;

procedure TSelecaoRel.GeraParametros(VQuebra: String);
var
I,i2,i3 : Integer;
VQuery,FQuery:TQuery;
VParams:TParams;
VSql,FValue:String;
FqrValue:TQREvResult;
VBand:TQrCustomBand;
VCampo:TStringList;
begin
  If VQuebra = '' Then begin
    If Relatorio.Bands.HasDetail Then
      Relatorio.Bands.DetailBand.BeforePrint := FBfPrintVquebra;

    If Relatorio.Bands.HasSummary Then 
       Relatorio.Bands.SummaryBand.BeforePrint := FBfPrintVquebra;
    FExpQuebra('');
  end;

  FQuery := TQuery.Create(Application);
  Try
      For i:=0 to FParams.Count - 1 do begin
         iF (VQUEBRA <> '') AND (UpperCase(FParams[i].QuebraParam) <> UpperCase(VQuebra)) THEN
           continue;

       Try
         FValue := FParams[i].ValueParams;
         VCampo := DivideMemo(FParams[i].Campo);
         For i3:=0 to VCampo.Count - 1 do
             With FParams[i] do begin
                  If Expression.Text <> '' then begin
                     Fvalue := '';
                     For i2:=0 to Expression.Count - 1 do
                      FValue := FValue +IIfs(FValue = '','',' ')+Expression[i2];
                  end else If NaoGeraSql then begin
                    If ObjParams <> Nil then
                      FValue := GetValueObjectG(ObjParams,ColObjParams,RowObjParams)
                  end else iF (UpperCase(FParams[i].QuebraParam) = UpperCase(VQuebra)) THEN  begin
                    If I3 = 0 Then begin
                         FQuery.Sql.Clear;
                         FQuery.DataBaseName := iifs(FBancoDeDados = '','Bd',FBancodeDados);
                         FQuery.Sql.Text := Sql.Text;
                         If (VQuebra <> '') then begin
                             VParams := TParams.Create;
                             Try
                                If FDadosQuebra.QuebraPorNome(VQuebra).QrGroup.Master is TQuickRep then
                                  VQuery := TQuery(TQuickRep(FDadosQuebra.QuebraPorNome(VQuebra).QrGroup.Master).DataSet)
                                else
                                  VQuery := TQuery(TQrSubDetail(FDadosQuebra.QuebraPorNome(VQuebra).QrGroup.Master).DataSet);

                                 With VQuery do
                                  for i2:=0 to Fields.Count - 1 do
                                     VParams.Add.Assign(Fields[i2]);
                                  Fquery.Sql.Text := Fparams[i].Sql.Text;
                                  TrocaStringParams(Fquery,Vparams);
                              Finally
                                  VParams.Destroy;
                              end;
                        end;
                        FQuery.OPen;
                    end;

                    Tipo   := FQuery.Fields[i3].DataType;
                    FValue := FQuery.Fields[i3].AsString;

                  end;
                  If Relatorio.Functions.IndexOf(VCampo[i3]) = -1 then begin
                         If Expression.Text = '' then begin
                             If (Tipo = FtString) or (Tipo = FtMemo) or (Tipo = FtDate) then begin
                                  FValue :=  ''''+FValue+''''
                             end  else If FValue = ''  then
                                  FValue :=  '0';

                             If (Tipo = FtFloat) or (Tipo = FtCurrency) then begin
                                FValue := TrocaPalavra(FloatToStr(StrtoFloatN(FValue)),',','.');
                                FValue := FValue+IIfs(Pos('.',FValue) = 0,'.0','');
                             end;

                             If (Tipo = FtDate) or (Tipo = FtDateTime) then
                               FValue := ''''+DataBancoDados(StrtoDateTime(FValue))+'''';
                         end;

                         Relatorio.Functions.AddFunction(VCampo[i3],FValue);
                  end else begin
                         If (Tipo = FtFloat) or (Tipo = FtCurrency) then begin
                              FQrValue.Kind      := resDouble;
                              FQrValue.DblResult := StrtoFloatN(FValue);
                         end else if (tipo = FtInteger) or (tipo = FtSmallInt) or (tipo = FtWord) then begin
                              FQrValue.Kind      := resInt;
                              FQrValue.IntResult := StrtoIntN(FValue);
                         end else If (tipo = FtBoolean) then begin
                              FQrValue.Kind      := resBool;
                              FQrValue.BooResult := UpperCase(FValue) = 'TRUE';
                         end else  begin
                              FQrValue.Kind      := resString;
                              FQrValue.StrResult := FValue;
                         end;
                         Relatorio.Functions.UpdateConstant(VCampo[i3],FQrValue);
                  end;
             end;
       finally
         VCampo.Destroy;
       end;
       
      end;
   finally
      FQuery.Destroy;
   end;
end;

procedure TSelecaoRel.FBfPrintVquebra(Sender: TQrCustomBand;
  var PrintBand: Boolean);
Var
VBand:TQrCustomBand;
I:Integer;
begin
   VBand := Sender;
   While (VBand <> Nil) and (VBand is TQrChildBand) do
    VBand := TQrChildBand(VBand).parentBand;

   If VBand.BandType = rbDetail Then
     FExpQuebra('DETAIL')
   else if  VBand.BandType = rbSummary Then begin
     FExpQuebra('SUMMARY');
     PrintBand := (Sender.ControlCount > 1) and Sender.enabled;
   end;

   if not printband then
    exit;


{  for i:=0 to Quebras.Count - 1 do
   If (Quebras[i].QrGroup.FooterBand = Sender) and Assigned(Quebras[i].OnPrintQrGroupFooterFooter) then
    Quebras[i].OnPrintQrGroupFooterFooter(Sender,PrintBand);}
end;

{ TCamposQuebra }

constructor TCamposQuebra.Create(DadoQuebra: TDadoQuebra);
begin
  inherited Create(TCampoQuebra);
  Self.FDadoQuebra := DadoQuebra
end;

function TCamposQuebra.GetCampos(Index: Integer): TCampoQuebra;
begin
  Result := TCampoQuebra(inherited GetItem(Index));
end;

function TCamposQuebra.GetOwner: TPersistent;
begin
  Result := FDadoQuebra;
end;

procedure TCamposQuebra.SetCampos(Index: Integer;
  const Value: TCampoQuebra);
begin
  inherited SetItem(Index, Value);
end;

{ TDadoQuebra }

constructor TDadoQuebra.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FCamposQuebra  := TCamposQuebra.Create(Self);
  ListaCampos    := TStringList.Create;
  OldExpQuebra := Null;
end;


destructor TDadoQuebra.Destroy;
begin
  ListaCampos.Destroy;
  FCamposQuebra.Destroy;
  inherited Destroy;
end;

function TDadoQuebra.IndiceCampos: String;
var
I : integer;
begin
  Result := '';

  If Self = Nil then
   exit;

  for i:=0 to FCamposQuebra.Count - 1 do
    If FCamposQuebra[i].Indice > 0 then
      Result := Result + IIfs(Result = '',IntToStr(FCamposQuebra[i].Indice),','+IntToStr(FCamposQuebra[i].Indice));

end;

function TDadoQuebra.IndiceCamposSql(Sql: TStrings): String;
var
I : integer;
F : Word;
begin
  Result := '';

  If Self = Nil then
   exit;

  for i:=0 to FCamposQuebra.Count - 1 do
    If Not FCamposQuebra[i].CampoDesativado then begin
        F := PosField(Sql,FCamposQuebra[i].Campo);
        If F > 0 then
          Result := Result + IIfs(Result = '',InttoStr(F),','+InttoStr(F));
     end;


end;

function TDadoQuebra.NomeCampos: String;
var
I : integer;
begin
  Result := '';

  If Self = Nil then
   exit;

  for i:=0 to FCamposQuebra.Count - 1 do
    If FCamposQuebra[i].Campo <> '' then
      Result := Result + IIfs(Result = '',FCamposQuebra[i].Campo,','+FCamposQuebra[i].Campo);

end;

procedure TDadoQuebra.SetCamposQuebra(const Value: TCamposQuebra);
begin
  FCamposQuebra.Assign(Value);
end;

{ TDadosQuebra }

function TDadosQuebra.Add: TDadoQuebra;
begin
  Result := TDadoQuebra(inherited Add);
end;

constructor TDadosQuebra.Create(SelecaoRel:TSelecaoRel);
begin
  inherited Create(TDadoQuebra);
  Self.FSelecaoRel := SelecaoRel;
end;

function TDadosQuebra.GetDados(Index: Integer): TDadoQuebra;
begin
  Result := TDadoQuebra(inherited GetItem(Index));
end;

function TDadosQuebra.GetOwner: TPersistent;
begin
  Result := FSelecaoRel;
end;


function TDadosQuebra.QuebraPorIndice(Indice: Word): TDadoQuebra;
var i:word;
begin
  Result := Nil;
  for i:=0 to Count - 1 do
    If GetDados(I).Indice = Indice then begin
      Result := GetDados(I);
      exit;
    end;
end;

function TDadosQuebra.QuebraPorMenu(Menu: TMenuItem): TDadoQuebra;
var i:word;
begin
  Result := Nil;
  for i:=0 to Count - 1 do
    If GetDados(I).MenuItem = Menu then begin
      Result := GetDados(I);
      exit;
    end;
end;

function TDadosQuebra.QuebraPorNome(Nome: String): TDadoQuebra;
var i:word;
begin
  Result := Nil;
  for i:=0 to Count - 1 do
    If UpperCase(GetDados(I).Titulo) = UpperCase(Nome) then begin
      Result := GetDados(I);
      exit;
    end;
end;

procedure TDadosQuebra.SetDados(Index: Integer;
  const Value: TDadoQuebra);
begin
  inherited SetItem(Index, Value);
end;


{ TFaixaSelRel }

constructor TFaixaSelRel.Create(Collection: TCollection);
begin
   inherited Create(Collection);
   FParametro1  := TStringList.Create;
   FParametro2  := TStringList.Create;
   FSql    := TStringList.Create;
   FParams := TParams.Create;
   FItemsCombo := TStringList.Create;
   FValoresCombo := TStringList.Create;
end;

procedure TFaixaSelRel.CriaComponentes(FParent: TWinControl;Var Ftop:Word;FLeft:Word);
var OldFont:TFont;
begin
  If FParent = Nil then
   exit;

  With TLabel.Create(FPArent.Owner) do begin
    Parent  := FParent;
    Caption := Ftitulo;
    Top     := FTop;
    Left    := FLeft;
    Ftop    := Height + Ftop + 1;
  end;

  If FControl1 = Nil then begin
      If (FFlag = DadoDescricao) then begin
        FControl1 := TComboSql.Create(FPArent.Owner);
        With TComboSql(FControl1) do begin
          Name         := 'compfaixa'+IntToStr(Self.Index)+'1';
          ParentFont   := False;
          Font.Style   := [];
          ItemIndex    := -1;
          Text         := '';
          Style        := CsDropDownList;
          BancoDeDados := 'Bd';
          Tabela       := FTabela;
          CampoItens   := FTabelaDescricao;
          CampoRetorno := FTabelaCodigo;
          Valores.addStrings(FValoresCombo);
          Items.addStrings(FItemsCombo);
          If FTabela <> '' then
             Retorno  := RcValorRetorno
          else if FValoresCombo.Text <> '' then
             Retorno  := RcValores;
          IncluiValores := (FTabela <> '') and (FValoresCombo.Text <> '');
          Width         := (Parent.Width div 2);
        end;
      end else begin
          FControl1 := TMaskEditcontrole.Create(FPArent.Owner);
          With TMaskEditcontrole(FControl1) do begin
              Name         := 'compfaixa'+IntToStr(Self.Index)+'1';
              ParentFont   := False;
              Font.Style   := [];
              Text         := '';
              EditMask     := Mascara;
              Enter        := True;
              Width        := IIfs(Mascara = '',120,TForm(FParent.Owner).Canvas.TextWidth(TrocaPalavra(Text,' ','9')));
              OnKeyDown    := Self.FKeyDown;
              VerificaData := (FTipo = FtDate) or (Ftipo = FtDateTime);
              VerificaHora := (FTipo = FtTime) or (Ftipo = FtDateTime);
           end;
      end;

      With FControl1 do begin
          PArent     := FParent;
          Left       := FLeft;
          Top        := Ftop;
      end;
  end;

  If (FFlag = DadoaDado) and (FControl2 = Nil) then begin
      With TLabel.Create(FPArent.Owner) do begin
        Parent  := FParent;
        Caption := 'a';
        Left    := Fcontrol1.Left + Fcontrol1.Width + 10;
        FLeft   := Left + Width + 10;
        Top     := FTop + Fcontrol1.Height div 2 - Height div 2;
      end;

      FControl2 := TMaskEditControle.Create(FPArent.Owner);
      With TMaskEditcontrole(FControl2) do begin
          Name         := 'compfaixa'+IntTOStr(Self.Index)+'2';
          text         := ''; 
          ParentFont := False;
          Font.Style := [];
          PArent     := FParent;
          Left       := FLeft;
          Top        := Ftop;
          EditMask     := Mascara;
          Text         := '';
          Enter        := True;
          Width        := IIfs(Mascara = '',120,TForm(FParent.Owner).Canvas.TextWidth(TrocaPalavra(Text,' ','9')));
          OnKeyDown    := Self.FKeyDown;
          VerificaData := (FTipo = FtDate) or (Ftipo = FtDateTime);
          VerificaHora := (FTipo = FtTime) or (Ftipo = FtDateTime);
       end;
  end;

  Ftop := Fcontrol1.Height + Ftop + 3;

end;

destructor TFaixaSelRel.Destroy;
begin
  Fparametro1.Destroy;
  Fparametro2.Destroy;
  FParams.Destroy;
  FSql.Destroy;
  FItemsCombo.Destroy;
  FValoresCombo.Destroy;
  inherited Destroy;
end;

procedure TFaixaSelRel.FKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If (Key = Vk_F2) and (FPesquisa <> '') then
   MontaPesquisa(TwinControl(Sender),FPesquisa,FPesquisaTabela,FPesquisaFiltro,Nil);
end;

procedure TFaixaSelRel.SetItemsCombo(const Value: TStringList);
begin
  FItemsCombo.Assign(Value);
end;


procedure TFaixaSelRel.SetParametro1(const Value: TStringList);
begin
  FParametro1.Assign(Value);
end;

procedure TFaixaSelRel.SetParametro2(const Value: TStringList);
begin
  FParametro2.Assign(Value);
end;


procedure TFaixaSelRel.SetValoresCombo(const Value: TStringList);
begin
  FValoresCombo.Assign(Value);
end;

Procedure TFaixaSelRel.SqlFaixa;
Var Valias:String;
I:Integer;
begin
     VAlias := IIfs(FAlias <> '',FAlias,FCampo);
     FSql.Clear;
     FParams.Clear;
     If FCriaSql then begin
       If VLComponent(FControl1) <> '' then
         FSql.Add(FCampo+iifs(Flag = DadoaDado,' >= ',' LIKE ')+':P'+VAlias+'1');
       If (Flag = DadoaDado) and  (VLComponent(FControl2) <> '') then
         FSql.Add(IIfs(VLComponent(FControl1) <> '',' And ','')+FCampo+' <= '+':P'+VAlias+'2');

         If FSql.Text <> '' then begin
           FParams.ParseSQL(FSql.Text,True);

           If FParams.FindParam('P'+VAlias+'1') <> Nil then
             With FParams.ParamByName('P'+VAlias+'1') do Begin
                DataType := Ftipo;
                If (VLComponent(FControl1) <> '')   then
                   Value  := VarAsType(VLComponent(FControl1),SelecaoRel.DataTypeToVarType(Ftipo))
                else
                   AsString := FVLNULL;
             end;

           If FParams.FindParam('P'+VAlias+'2') <> Nil then
             With FParams.ParamByName('P'+VAlias+'2') do Begin
                DataType := Ftipo;
                If (VLComponent(FControl2) <> '')   then
                   Value  := VarAsType(VLComponent(FControl2),SelecaoRel.DataTypeToVarType(Ftipo))
                else
                   AsString := FVLNULL;
             end;
         end;
     end;

     If (FParametro1.Text <> '') then Begin
        For i:=0 to Fparametro1.count - 1 do
           with TParam(FParams.Add) do begin
              Name :=  FParametro1[I];
              DataType := Ftipo;
                If (VLComponent(FControl1) <> '')   then
                   Value  := VarAsType(VLComponent(FControl1),SelecaoRel.DataTypeToVarType(Ftipo))
                else
                   AsString := FVLNULL;
           end;
     end;

     If (Flag = DadoaDado) and (FParametro2.Text <> '') then Begin
        For i:=0 to Fparametro2.count - 1 do
          with TParam(FParams.Add) do begin
            Name :=  FParametro2[I];
            DataType := Ftipo;
            If (VLComponent(FControl2) <> '')   then
               Value  := VarAsType(VLComponent(FControl2),SelecaoRel.DataTypeToVarType(Ftipo))
            else
               AsString := FVLNULL;
         end;
     end;



end;

function DataTypeToVarType(FDatatype:TFieldType):Integer;
begin
  case FDataType of
     ftSmallInt               : Result := System.varSmallint;
     ftInteger                : Result := System.varInteger;
     ftBCD                    : Result := System.varCurrency;
     ftFloat                  : Result := System.varSingle;
     ftTime,ftDate,ftDateTime : Result := System.varDate;
     ftBoolean                : Result := System.varBoolean;
     ftString,FtMemo,FtBlob   : Result := System.varString;
  else
     Result := System.VarUnknown;
  end;
end;

{ TFaixasSelRel }

constructor TFaixasSelRel.Create(SelecaoRel: TSelecaoRel);
begin
  inherited Create(TFaixaSelRel);
  Self.FSelecaoRel := SelecaoRel;
  FParametros    := TParams.Create;
  FSql       := TStringList.Create;
end;

procedure TFaixasSelRel.CriaControls(FParent: TwinControl);
Var I:Integer;
Ftop:Word;
begin
  Ftop := 1;
  for i:=0 to Count - 1 do
    GetItem(I).CriaComponentes(FParent,FTop,0);
end;

function TFaixasSelRel.GetItem(Index: Integer): TFaixaSelRel;
begin
  Result := TFaixaSelRel(inherited GetItem(Index));
end;


function TFaixasSelRel.GetOwner: TPersistent;
begin
  Result := FSelecaoRel;
end;


procedure TFaixasSelRel.SetItem(Index: Integer; const Value: TFaixaSelRel);
begin
  inherited SetItem(Index, Value);
end;



Procedure TFaixasSelRel.SqlFaixa;
var I,i2:Integer;
begin
   FSql.Clear;
   FParametros.Clear;
   For i:=0 to Count - 1 do begin
        GetItem(I).SqlFaixa;
        If (GetItem(I).FSql.Text = '') AND (GetItem(I).FParams.Count = 0) then
          continue;
        If (FSql.Text <> '') AND (GetItem(I).FSql.Text <> '') then
          FSql.Add(' And ');
        FSql.AddStrings(GetItem(I).FSql);
        For i2:=0 to GetItem(I).FParams.count - 1 do 
          FParametros.Add.Assign(GetItem(I).FParams[i2]);
   end;
end;

Destructor TFaixasSelRel.Destroy;
begin
   FParametros.Destroy;
   FSql.Destroy;
   inherited Destroy;
end;


function TFaixasSelRel.Add: TFaixaSelRel;
begin
  Result := TFaixaSelRel(inherited Add);
end;

function TFaixasSelRel.Parametros(FQuery: TQuery): TParams;
Var Valias:String;
I,i2:Integer;
begin
   Result := TParams.Create;
   For i:=0 to Count - 1do begin
       With Items[i] do begin
             VAlias := IIfs(Alias <> '',Alias,Campo);
             If CriaSql then begin
                     If (FQuery.Params.FindParam('P'+VAlias+'1') <> Nil)
                        and (FQuery.Params.FindParam('P'+VAlias+'1').IsNull) then
                        With TParam(Result.Add) do begin
                          Name     := 'P'+VAlias+'1';
                          DataType := Tipo;
                        end;

                     If (Flag = DadoaDado) and (FQuery.Params.FindParam('P'+VAlias+'2') <> Nil)
                        and (FQuery.Params.FindParam('P'+VAlias+'2').IsNull) then
                            With TParam(Result.Add) do begin
                              Name     := 'P'+VAlias+'2';
                              DataType := Tipo;
                            end;
            end;

            for i2:=0 to Parametro1.count - 1 do
              If (FQuery.Params.FindParam(Parametro1[I2]) <> Nil)
                 and (FQuery.Params.FindParam(Parametro1[I2]).IsNull) then
                      With TParam(Result.Add) do begin
                        Name     := Parametro1[I2];
                        DataType := Tipo;
                      end;

          If (Flag = DadoaDado) then
            for i2:=0 to Parametro2.count - 1 do
              If (FQuery.Params.FindParam(Parametro2[I2]) <> Nil)
                 and (FQuery.Params.FindParam(Parametro2[I2]).IsNull) then
                      With TParam(Result.Add) do begin
                        Name     := Parametro2[I2];
                        DataType := Tipo;
                      end;
      end;
   end;
end;

end.
