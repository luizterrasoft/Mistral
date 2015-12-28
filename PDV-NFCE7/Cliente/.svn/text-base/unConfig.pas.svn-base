unit unConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Mask, Buttons;

type
  Tfrm_config = class(TForm)
    fichario: TPageControl;
    pagina2: TTabSheet;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    pagina3: TTabSheet;
    Bevel1: TBevel;
    Label7: TLabel;
    edtLocalPgto: TEdit;
    chQualquerLoja: TCheckBox;
    Bevel4: TBevel;
    Label8: TLabel;
    edtObs1: TMaskEdit;
    edtObs2: TMaskEdit;
    pagina4: TTabSheet;
    chSubmenuAtivo: TCheckBox;
    Bevel5: TBevel;
    Label11: TLabel;
    edtLojaFrente: TMaskEdit;
    Bevel7: TBevel;
    rdTipoImpCarnet: TRadioGroup;
    Label12: TLabel;
    Bevel8: TBevel;
    Label13: TLabel;
    edtLimCred: TMaskEdit;
    Label14: TLabel;
    chCnpj: TCheckBox;
    Label9: TLabel;
    chSaldoDisponiv: TCheckBox;
    rdF8Cli: TRadioGroup;
    pagina5: TTabSheet;
    Label1: TLabel;
    edtSPC: TMaskEdit;
    Bevel6: TBevel;
    chValDifPago: TCheckBox;
    Bevel9: TBevel;
    Panel9: TPanel;
    OpenDialog1: TOpenDialog;
    rdInterv: TRadioGroup;
    pagina7: TTabSheet;
    Bevel12: TBevel;
    Label27: TLabel;
    edtEmailMatriz: TEdit;
    rdTipoLoja: TRadioGroup;
    rdTipoExp: TRadioGroup;
    GroupBox1: TGroupBox;
    Label29: TLabel;
    edtHostFtp: TEdit;
    Label30: TLabel;
    edtUserid: TEdit;
    Label31: TLabel;
    edtSenha: TEdit;
    imgGerais: TImage;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    cbImpressora: TComboBox;
    chSaltoNat: TCheckBox;
    TabSheet4: TTabSheet;
    rdColEtiq: TRadioGroup;
    rdTextoEtiq: TRadioGroup;
    Label32: TLabel;
    edtEspaco: TMaskEdit;
    Label33: TLabel;
    chJuros: TCheckBox;
    pagina8: TTabSheet;
    Bevel11: TBevel;
    Label26: TLabel;
    edtWinWord: TEdit;
    btnProcurarWord: TSpeedButton;
    Label28: TLabel;
    edtPath: TEdit;
    Label25: TLabel;
    edtArquivoProposta: TEdit;
    btnProcurar: TSpeedButton;
    Bevel3: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtPathImagem: TEdit;
    pagina9: TTabSheet;
    rdVideoEntrada: TRadioGroup;
    rdCoresEntrada: TRadioGroup;
    rdVideoSaida: TRadioGroup;
    rdCoresSaida: TRadioGroup;
    chModificarVideo: TCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtLocalPgtoEnter(Sender: TObject);
    procedure edtObs1Enter(Sender: TObject);
    procedure edtObs2Enter(Sender: TObject);
    procedure e(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtObs1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtObs2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLocalPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chQualquerLojaClick(Sender: TObject);
    procedure chQualquerLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSPCEnter(Sender: TObject);
    procedure edtLojaFrenteEnter(Sender: TObject);
    procedure edtSPCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaFrenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaFrenteDblClick(Sender: TObject);
    procedure edtLimCredKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLimCredEnter(Sender: TObject);
    procedure edtEndeEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnProcurarWordClick(Sender: TObject);
    procedure edtArquivoPropostaEnter(Sender: TObject);
    procedure edtArquivoPropostaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtWinWordEnter(Sender: TObject);
    procedure edtPathEnter(Sender: TObject);
    procedure edtWinWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPathKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHostFtpEnter(Sender: TObject);
    procedure edtHostFtpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUseridEnter(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtUseridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEspacoEnter(Sender: TObject);
    procedure edtPathImagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPathImagemEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_config: Tfrm_config;

implementation

uses principal, unDialogo, funcoes1, F8Lojas, funcoes2;

{$R *.DFM}

{Botao de cancelamento da configuracao}
procedure Tfrm_config.btnCancelClick(Sender: TObject);
begin
  close;
end;

{Botao de Ok para atualizacao ***}
procedure Tfrm_config.btnOkClick(Sender: TObject);
begin
     {Atualizando as variaveis do sistema}
  frm_principal.x_impressora := cbImpressora.itemindex;
  frm_principal.x_salto := chSaltoNat.checked;
  frm_principal.x_qualquer_endereco_carnet := chQualquerLoja.checked;
  frm_principal.x_endereco_carnet := Trim(edtLocalPgto.text);
  frm_principal.x_obs1_carnet := Trim(edtObs1.text);
  frm_principal.x_obs2_carnet := Trim(edtObs2.text);
  frm_principal.x_flag_carnet_juros := chJuros.checked;
  frm_principal.x_tipo_imp_carnet := rdTipoImpCarnet.itemindex;
  frm_principal.x_submenu_ativo := chSubmenuAtivo.checked;
  frm_principal.x_critica_cnpj := chCNPJ.checked;
  frm_principal.x_critica_limite := chSaldoDisponiv.checked;
  if (Trim(edtLojaFrente.text)<>'') then
    frm_principal.x_frente_loja := strtoint(Trim(edtLojaFrente.text))
  else
    frm_principal.x_frente_loja := 0;
  if (Trim(edtLimCred.text)<>'') then
    frm_principal.x_perc_lim_cred := strtoint(Trim(edtLimCred.text))
  else
    frm_principal.x_perc_lim_cred := 30;
  frm_principal.x_F8_cliente:=rdF8Cli.itemindex;
  if (Trim(edtSPC.text)<>'') then
    frm_principal.x_dias_reabSPC := strtoint(Trim(edtSPC.text))
  else
    frm_principal.x_dias_reabSPC:=30;
  frm_principal.x_tipo_intervalo_atraso := rdInterv.itemindex;
  frm_principal.x_pode_valor_dif_pago := chValDifPago.checked;
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
  frm_principal.x_pathsystem := Trim(edtPath.text);
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
  DeleteFile ('c:\nativa\cred.ini');
  frm_principal.GravaConfigLocal;
  close;
end;

procedure Tfrm_config.FormActivate(Sender: TObject);
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

     {paleta carnet}
  chQualquerLoja.checked := frm_principal.x_qualquer_endereco_carnet;
  if (not chQualquerLoja.checked) then
    habilitaedit(edtLocalPgto)
  else
    desabilitaedit(edtLocalPgto);
  edtLocalPgto.text := frm_principal.x_endereco_carnet;
  edtObs1.text := frm_principal.x_obs1_carnet;
  edtObs2.text := frm_principal.x_obs2_carnet;
  rdTipoImpCarnet.itemindex := frm_principal.x_tipo_imp_carnet;
  chJuros.checked := frm_principal.x_flag_carnet_juros;

     {paleta geral}
  chSubmenuAtivo.checked := frm_principal.x_submenu_ativo;
  chCNPJ.checked := frm_principal.x_critica_cnpj;
  edtLojaFrente.text := form_nz(frm_principal.x_frente_loja,2);
  edtLimCred.text := inttostr(frm_principal.x_perc_lim_cred);
  rdF8cli.itemindex := frm_principal.x_F8_cliente;

     {paleta cobranca}
  edtSPC.text := inttostr(frm_principal.x_dias_reabSPC);
  chValDifPago.checked := frm_principal.x_pode_valor_dif_pago;
  chSaldoDisponiv.checked := frm_principal.x_critica_limite;
  rdInterv.itemindex := frm_principal.x_tipo_intervalo_atraso;

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

procedure Tfrm_config.edtLocalPgtoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtObs1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtObs2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.e(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtObs1.setfocus;
  if (key=K_CIMA) then
    chQualquerLoja.setfocus;
end;

procedure Tfrm_config.edtObs1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtObs2.setfocus;
  if (key=K_CIMA) then
    edtLocalPgto.setfocus;
end;

procedure Tfrm_config.edtObs2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOk.click;
  if (key=K_CIMA) then
    edtObs2.setfocus;
end;

procedure Tfrm_config.edtLocalPgtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtObs1.setfocus;
  if (key=K_CIMA) then
    chQualquerLoja.setfocus;
end;

procedure Tfrm_config.chQualquerLojaClick(Sender: TObject);
begin
  if (not chQualquerLoja.checked) then
    habilitaedit(edtLocalPgto)
  else
    desabilitaedit(edtLocalPgto);
end;

procedure Tfrm_config.chQualquerLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not chQualquerLoja.checked) then
    habilitaedit(edtLocalPgto)
  else
    desabilitaedit(edtLocalPgto);
end;

procedure Tfrm_config.edtSPCEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtLojaFrenteEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtSPCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLimCred.setfocus;
end;

procedure Tfrm_config.edtLojaFrenteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOk.click;
  if (key=K_CIMA) then
    edtLimCred.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLojaFrente;
      showmodal;
    end;
end;

procedure Tfrm_config.edtLojaFrenteDblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLojaFrente;
    showmodal;
  end;
end;

procedure Tfrm_config.edtLimCredKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLojaFrente.setfocus;
  if (key=K_CIMA) then
    edtSpc.setfocus;
end;

procedure Tfrm_config.edtLimCredEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtEndeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    btnCancel.click;
end;

procedure Tfrm_config.btnProcurarClick(Sender: TObject);
begin
  if (OpenDialog1.Execute) then
    edtArquivoProposta.text:=OpenDialog1.filename;
end;

procedure Tfrm_config.btnProcurarWordClick(Sender: TObject);
begin
  if (OpenDialog1.Execute) then
    edtWinWord.text:=OpenDialog1.filename;
end;

procedure Tfrm_config.edtArquivoPropostaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtArquivoPropostaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtPath.setfocus;
  if (key=K_CIMA) then
    edtWinWord.setfocus;
end;

procedure Tfrm_config.edtWinWordEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtPathEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtWinWordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtArquivoProposta.setfocus;
end;

procedure Tfrm_config.edtPathKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPathImagem.setfocus;
  if (key=38) then
    edtArquivoProposta.setfocus;
end;

procedure Tfrm_config.edtHostFtpEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtHostFtpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtUserId.setfocus;
  if (key=K_CIMA) then
    edtEmailMatriz.setfocus;
end;

procedure Tfrm_config.edtUseridEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtSenhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtUseridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSenha.setfocus;
  if (key=K_CIMA) then
    edtHostFtp.setfocus;
end;

procedure Tfrm_config.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOk.click;
  if (key=K_CIMA) then
    edtUserId.setfocus;
end;

procedure Tfrm_config.edtEspacoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_config.edtPathImagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnOk.click;
  if (key=38) then
    edtPath.setfocus;
end;

procedure Tfrm_config.edtPathImagemEnter(Sender: TObject);
begin
  edtPathImagem.selectall;
end;



end.
