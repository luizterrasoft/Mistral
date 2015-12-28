unit un_configVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Mask, ComCtrls, LabelOO;

type
  Tfrm_ConfigLocal = class(TForm)
    fichario: TPageControl;
    pagina2: TTabSheet;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    cbImpressora: TComboBox;
    chSaltoNat: TCheckBox;
    TabSheet4: TTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    rdColEtiq: TRadioGroup;
    rdTextoEtiq: TRadioGroup;
    edtEspaco: TMaskEdit;
    pagina7: TTabSheet;
    Bevel12: TBevel;
    Label27: TLabel;
    edtEmailMatriz: TEdit;
    rdTipoLoja: TRadioGroup;
    rdTipoExp: TRadioGroup;
    GroupBox1: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtHostFtp: TEdit;
    edtUserid: TEdit;
    edtSenha: TEdit;
    pagina8: TTabSheet;
    Bevel3: TBevel;
    Bevel11: TBevel;
    Label26: TLabel;
    btnProcurarWord: TSpeedButton;
    Label28: TLabel;
    Label25: TLabel;
    btnProcurar: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtWinWord: TEdit;
    edtPath: TEdit;
    edtArquivoProposta: TEdit;
    edtPathImagem: TEdit;
    pagina9: TTabSheet;
    rdVideoEntrada: TRadioGroup;
    rdCoresEntrada: TRadioGroup;
    rdVideoSaida: TRadioGroup;
    rdCoresSaida: TRadioGroup;
    chModificarVideo: TCheckBox;
    Panel1: TPanel;
    Image2: TImage;
    Label6: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    botao_sair: TPanel;
    btnAplicar: TPanel;
    pagina6: TTabSheet;
    CheckBox1: TCheckBox;
    LabelOO6: TLabelOO;
    listaModeloImpressoraFiscal: TListBox;
    btnConfigImpressoraFiscal: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure btnConfigImpressoraFiscalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConfigLocal: Tfrm_ConfigLocal;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2;

procedure Tfrm_ConfigLocal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ConfigLocal.btnAplicarClick(Sender: TObject);
begin
     {Atualizando as variaveis do sistema}
  frm_principal.x_impressora := cbImpressora.itemindex;
  frm_principal.x_salto := chSaltoNat.checked;
  frm_principal.x_tipo_loja := rdTipoLoja.itemindex;
  frm_principal.x_email_publicador := Trim(edtEmailMatriz.text);
  frm_principal.x_tipo_exportacao := rdTipoExp.itemindex;
  frm_principal.x_ftp_host := edtHostFtp.text;
  frm_principal.x_ftp_userid := edtUserId.text;
  frm_principal.x_ftp_password := edtSenha.text;
  frm_principal.x_etiquetas_colunas := rdColEtiq.itemindex;
  frm_principal.x_etiquetas_texto := rdTextoEtiq.itemindex;
  if (Trim(edtEspaco.text)<>'') then
    frm_principal.x_etiquetas_espaco := strtoint(edtEspaco.text)
  else
    frm_principal.x_etiquetas_espaco := 0;
  frm_principal.x_pathImg := Trim(edtPathImagem.text);
  frm_principal.x_arquivo_winword := Trim(edtWinWord.text);
  frm_principal.x_arquivo_proposta := Trim(edtArquivoProposta.text);
  frm_principal.x_modificar_video := chModificarVideo.checked;
  if (rdVideoEntrada.itemindex=0) then
  begin
    frm_principal.x_video_entrada_width  := 640;
    frm_principal.x_video_entrada_height := 480;
  end
  else
  if (rdVideoEntrada.itemindex=1) then
  begin
    frm_principal.x_video_entrada_width  := 800;
    frm_principal.x_video_entrada_height := 600;
  end
  else
  if (rdVideoEntrada.itemindex=2) then
  begin
    frm_principal.x_video_entrada_width  := 1024;
    frm_principal.x_video_entrada_height := 768;
  end;
  if (rdCoresEntrada.itemindex=0) then
    frm_principal.x_video_entrada_color := 4
  else
  if (rdCoresEntrada.itemindex=1) then
    frm_principal.x_video_entrada_color := 8
  else
  if (rdCoresEntrada.itemindex=2) then
    frm_principal.x_video_entrada_color := 16
  else
  if (rdCoresEntrada.itemindex=3) then
    frm_principal.x_video_entrada_color := 32;
  if (rdVideoSaida.itemindex=0) then
  begin
    frm_principal.x_video_saida_width  := 640;
    frm_principal.x_video_saida_height := 480;
  end
  else
  if (rdVideoSaida.itemindex=1) then
  begin
    frm_principal.x_video_saida_width  := 800;
    frm_principal.x_video_saida_height := 600;
  end
  else
  if (rdVideoSaida.itemindex=2) then
  begin
    frm_principal.x_video_saida_width  := 1024;
    frm_principal.x_video_saida_height := 768;
  end;
  if (rdCoresSaida.itemindex=0) then
    frm_principal.x_video_saida_color := 4
  else
  if (rdCoresSaida.itemindex=1) then
    frm_principal.x_video_saida_color := 8
  else
  if (rdCoresSaida.itemindex=2) then
    frm_principal.x_video_saida_color := 16
  else
  if (rdCoresSaida.itemindex=3) then
    frm_principal.x_video_saida_color := 32;

     {2- Gravando as configuracoes do sistema}
  DeleteFile ('c:\nativa\vendas.ini');
  frm_principal.GravaConfigLocal;
  close;
end;

procedure Tfrm_ConfigLocal.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConfigLocal.btnConfigImpressoraFiscalClick(Sender: TObject);
begin
  showmessage('Rotina ainda não disponível!');
end;

procedure Tfrm_ConfigLocal.FormActivate(Sender: TObject);
begin
  fichario.activepage:=pagina2;

     {paleta relatorios}
  chSaltoNat.checked  := frm_principal.x_salto;
  cbImpressora.itemindex := frm_principal.x_impressora;
  chSaltoNat.checked := frm_principal.x_salto_nativa;

     {etiquetas}
  rdColEtiq.itemindex := frm_principal.x_etiquetas_colunas;
  rdTextoEtiq.itemindex := frm_principal.x_etiquetas_texto;
  edtEspaco.text := inttostr(frm_principal.x_etiquetas_espaco);

     {paleta exportacao}
  edtEmailMatriz.text := frm_principal.x_email_publicador;
  rdTipoLoja.itemindex := frm_principal.x_tipo_loja;
  rdTipoExp.itemindex := frm_principal.x_tipo_exportacao;
  edtHostFtp.text := Trim(frm_principal.x_ftp_host);
  edtUserId.text := Trim(frm_principal.x_ftp_userid);
  edtSenha.text := Trim(frm_principal.x_ftp_password);

     {paleta diretorios}
  edtArquivoProposta.text := frm_principal.x_arquivo_proposta;
  edtPathImagem.text := frm_principal.x_pathImg;
  edtWinWord.text := frm_principal.x_arquivo_winword;
  edtPath.text := frm_principal.x_pathsystem;

     {paleta video}
  chModificarVideo.checked := frm_principal.x_modificar_video;
  if (frm_principal.x_video_entrada_width=640) and (frm_principal.x_video_entrada_height=480) then
    rdVideoEntrada.itemindex:=0;
  if (frm_principal.x_video_entrada_width=800) and (frm_principal.x_video_entrada_height=600) then
    rdVideoEntrada.itemindex:=1;
  if (frm_principal.x_video_entrada_width=1024) and (frm_principal.x_video_entrada_height=768) then
    rdVideoEntrada.itemindex:=2;
  if (frm_principal.x_video_entrada_color=4) then
    rdCoresEntrada.itemindex:=0
  else
  if (frm_principal.x_video_entrada_color=8) then
    rdCoresEntrada.itemindex:=1
  else
  if (frm_principal.x_video_entrada_color=16) then
    rdCoresEntrada.itemindex:=2
  else
  if (frm_principal.x_video_entrada_color=32) then
    rdCoresEntrada.itemindex:=3;
  if (frm_principal.x_video_saida_width=640) and (frm_principal.x_video_saida_height=480) then
    rdVideosaida.itemindex:=0;
  if (frm_principal.x_video_saida_width=800) and (frm_principal.x_video_saida_height=600) then
    rdVideosaida.itemindex:=1;
  if (frm_principal.x_video_saida_width=1024) and (frm_principal.x_video_saida_height=768) then
    rdVideosaida.itemindex:=2;
  if (frm_principal.x_video_saida_color=4) then
    rdCoressaida.itemindex:=0
  else
  if (frm_principal.x_video_saida_color=8) then
    rdCoressaida.itemindex:=1
  else
  if (frm_principal.x_video_saida_color=16) then
    rdCoressaida.itemindex:=2
  else
  if (frm_principal.x_video_saida_color=32) then
    rdCoressaida.itemindex:=3;

     {...}
  fichario.activepageindex := 0;
  edtEspaco.setfocus;
end;

end.
