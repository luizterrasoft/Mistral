unit un_EmissaoNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TfrmEmissaoNfe = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Ca1: TMenuItem;
    Incluir1: TMenuItem;
    grboxInfVend: TGroupBox;
    pnVendas: TPanel;
    lblnvenda: TLabel;
    lblCliente: TLabel;
    ldlDtEmissao: TLabel;
    lblDtSaida: TLabel;
    lblCodigo: TLabel;
    lblPedCompra: TLabel;
    lblCidade: TLabel;
    lblCnpjCpf: TLabel;
    lblSerinalNFe: TLabel;
    lblNnoFiscal: TLabel;
    edtNotFiscal: TEdit;
    edtSerialNFe: TEdit;
    edtCliente: TEdit;
    edtCnpjCpf: TEdit;
    edtCidade: TEdit;
    edtEmisao: TEdit;
    edtSaida: TEdit;
    edtPedCompra: TEdit;
    edtCodigo: TEdit;
    edtNvenda: TEdit;
    gruImpTotal: TGroupBox;
    Label3: TLabel;
    lblSeguro: TLabel;
    lblVlIcms: TLabel;
    lblVlFrete: TLabel;
    lblIcms: TLabel;
    lblOutros: TLabel;
    lblIcmsSub: TLabel;
    lblTotNota: TLabel;
    lblVlIcmsSub: TLabel;
    lblVlIpi: TLabel;
    lblTotProd: TLabel;
    lbllVlrDesc: TLabel;
    edtBcIcms: TEdit;
    edtTotProd: TEdit;
    edtVlDesc: TEdit;
    edtVlIcms: TEdit;
    edtVlFrete: TEdit;
    edtBIcmsSub: TEdit;
    edtSeguro: TEdit;
    edtVIcmsSub: TEdit;
    edtOutros: TEdit;
    edtTotNota: TEdit;
    edtVlIpi: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    gruTipeTribNota: TGroupBox;
    lblNfSaida: TLabel;
    lblNfEntrada: TLabel;
    lblCfop: TLabel;
    lblCsosn: TLabel;
    lblSitIpi: TLabel;
    lblSitPis: TLabel;
    lblSitCofins: TLabel;
    edtCfop: TEdit;
    edtCsosn: TEdit;
    edtSitIpi: TEdit;
    edtSitPis: TEdit;
    edtSitCofins: TEdit;
    Panel1: TPanel;
    btnNovo: TButton;
    btnServico: TBitBtn;
    btnExcluir: TBitBtn;
    StatusBar1: TStatusBar;
    lblDescCfop: TLabel;
    rdgTpNota: TRadioGroup;
    lblDescCsosn: TLabel;
    lblDescSitIpi: TLabel;
    lblDescSitPis: TLabel;
    lblDescSitCofins: TLabel;
    gbxEnvioeAutoNfe: TGroupBox;
    lblXmlNfe: TLabel;
    lblPtrotocolo: TLabel;
    lblDataHora: TLabel;
    lblNsalvar: TLabel;
    lblNenviar: TLabel;
    lblNimpDanfe: TLabel;
    lblNeniaNfeCliente: TLabel;
    gbxExportacao: TGroupBox;
    lblUfEmbarque: TLabel;
    lblLocEmbarque: TLabel;
    edtUfEmbarque: TEdit;
    edtLocEmbarque: TEdit;
    edtXmlNfe: TEdit;
    edtProtocolo: TEdit;
    edtDataHora: TEdit;
    btnEnvioNfeCliente: TButton;
    GroupBox2: TGroupBox;
    EdtInfoAdicionais: TEdit;
    GroupBox1: TGroupBox;
    lblTransportadora: TLabel;
    lblMarca: TLabel;
    lblEspecie: TLabel;
    lblQtdeVolume: TLabel;
    lblPbruto: TLabel;
    lblPliquido: TLabel;
    lblPlaca: TLabel;
    sbtnTranspo: TSpeedButton;
    edtTransportadora: TEdit;
    editMarca: TEdit;
    edtEspecie: TEdit;
    estQtdVolume: TEdit;
    edtPbruto: TEdit;
    edtPliquido: TEdit;
    edtPlaca: TEdit;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    imgSalvar: TImage;
    ImgEnviarCliente: TImage;
    imgImprimir: TImage;
    imgEnviar: TImage;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure edtNvendaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNotFiscalEnter(Sender: TObject);
    procedure btnServicoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtNvendaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNvendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    codigo,Nvenda, TotNota, Tipreg, Linha : string;
    nreg,i,ind1, ind2 : integer;

//*****>>>
  // Variaveis para a Geração do Arquivo Ini
  sLogoMarca,sPathArq : String;
  sSalvaArq : boolean;
  sCertificado,sSenha,sSerial : String;
  sRazao,sFantasia,sCNPJ,sIE,sEndereco,sNum,sBairro,sCidade,sCEP,sUF,sCodMun : String;
  sAmbiente,sFormas : integer;
  sUFWS,sHost,sPorta,sUsuario,sSenhaWS : String;
  //


  end;

var
  frmEmissaoNfe: TfrmEmissaoNfe;

const
  {teclas de funcao *** - configuracao}
  NULO     = 0;
  K_F1     = 112;
  K_F2     = 113;
  K_F3     = 114;
  K_F4     = 115;
  K_F5     = 116;
  K_F6     = 117;
  K_F7     = 118;
  K_F8     = 119;
  K_F9     = 120;
  K_F10    = 121;
  K_F11    = 122;
  K_F12    = 123;
  K_ENTER  = 13;
  K_ESC    = 27;
  K_ESQ    = 37;
  K_BAIXO  = 40;
  K_CIMA   = 38;
  K_DIR    = 39;
  K_INSERT = 45;
  K_DELETE = 46;
  K_HOME   = 36;
  K_END    = 35;
  K_PGUP   = 33;
  K_PGDOWN = 34;
  K_BACK   = 8;
  VK_F8    = K_BACK  ;

implementation

{$R *.dfm}

procedure TfrmEmissaoNfe.edtNvendaEnter(Sender: TObject);
var
key : integer;
begin
  // Abre Janela com Notas *.rem no Caminho C:\MistralNFE\INTEGRACAO
  if (key=K_F8) then    // F8 - Para Buscar Nota
    // ChamandoF8Forn(edtForn,true);
     Begin
     //  pnBuscaNotas.Visible := true;
     //  LerArqRemessa;
     End;
end;

procedure TfrmEmissaoNfe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // Analisa se alguma tecla foi pressionada
end;

procedure TfrmEmissaoNfe.edtNotFiscalEnter(Sender: TObject);
begin
   // F3 - GERA SEQUENCIAL
   // F8 - BUSCAR O NUMERO DA NOTA
end;

procedure TfrmEmissaoNfe.btnServicoClick(Sender: TObject);
begin

  ShowMessage('TfrmEmissaoNfe.btnServicoClick');

end;

procedure TfrmEmissaoNfe.FormShow(Sender: TObject);
begin
  ShowMessage('TfrmEmissaoNfe.FormShow');
end;


procedure TfrmEmissaoNfe.BitBtn1Click(Sender: TObject);
begin
  //
end;

procedure TfrmEmissaoNfe.edtNvendaKeyPress(Sender: TObject; var Key: Char);
begin
 { if (key=VK_F8) then    // F8 - Para Buscar Nota
     FrmLocaliza.ShowModal;
  }

  ShowMessage('TfrmEmissaoNfe.edtNvendaKeyPress');

{     Begin
       pnBuscaNotas.Visible := true;
       LerArqRemessa;
     End;
}

end;


procedure TfrmEmissaoNfe.edtNvendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    // Abre Janela com Notas *.rem no Caminho C:\MistralNFE\INTEGRACAO
  if (key=VK_F8) then    // F8 - Para Buscar Nota
    // ChamandoF8Forn(edtForn,true);
     Begin
      // pnBuscaNotas.Visible := true;
       // 
     End;
  if (key=VK_ESCAPE) then
     Begin
      // pnBuscaNotas.Visible := false;
     End;
end;

procedure TfrmEmissaoNfe.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmissaoNfe.SpeedButton2Click(Sender: TObject);
begin
//

//
end;

End.
