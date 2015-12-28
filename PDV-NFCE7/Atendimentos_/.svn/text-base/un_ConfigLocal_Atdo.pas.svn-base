unit un_ConfigLocal_Atdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Mask, ComCtrls, LabelOO, Menus, MaskEditOO,
  CheckBoxOO;

type
  Tfrm_ConfigLocal_Atdo = class(TForm)
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
    pagina8: TTabSheet;
    Bevel3: TBevel;
    Bevel11: TBevel;
    Label26: TLabel;
    btnProcurarWord: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    edtWinWord: TEdit;
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
    rdModeloImpressao: TRadioGroup;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Salvar1: TMenuItem;
    rdF8Cli: TRadioGroup;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rdFormaLeituraVenda: TRadioGroup;
    rdFormaLeituraTroca: TRadioGroup;
    rdFormaLeituraDevolucao: TRadioGroup;
    Bevel4: TBevel;
    TabSheet2: TTabSheet;
    LabelOO1: TLabelOO;
    edtQtdeLinhas_ATENDIMENTO: TMaskEditOO;
    Bevel2: TBevel;
    chSlipNaTela_ATENDIMENTO: TCheckBox;
    chPrevalecerEAN13: TCheckBoxOO;
    rdRelatorio: TRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbImpressoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEspacoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtWinWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPathImagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Salvar1Click(Sender: TObject);
    procedure edtQtdeLinhas_ATENDIMENTOEnter(Sender: TObject);
    procedure edtQtdeLinhas_ATENDIMENTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPathImagemEnter(Sender: TObject);
    procedure edtWinWordEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConfigLocal_Atdo: Tfrm_ConfigLocal_Atdo;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, auxiliar, venda;

procedure Tfrm_ConfigLocal_Atdo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ConfigLocal_Atdo.btnAplicarClick(Sender: TObject);
begin
     {Atualizando as variaveis do sistema}
  frm_principal.x_impressora := cbImpressora.itemindex;
  frm_principal.x_salto := chSaltoNat.checked;
  frm_principal.x_modelo_impressao_geral := rdModeloImpressao.itemindex;
  frm_principal.x_forma_leitura_cbarra_venda := rdFormaLeituraVenda.itemindex;
  frm_principal.x_forma_leitura_cbarra_troca := rdFormaLeituraTroca.itemindex;
  frm_principal.x_forma_leitura_cbarra_devolucao := rdFormaLeituraDevolucao.itemindex;
  frm_principal.x_etiquetas_colunas := rdColEtiq.itemindex;
  frm_principal.x_etiquetas_texto := rdTextoEtiq.itemindex;
  if (Trim(edtEspaco.text)<>'') then
    frm_principal.x_etiquetas_espaco := strtoint(edtEspaco.text)
  else
    frm_principal.x_etiquetas_espaco := 0;
  frm_principal.x_pathImg := Trim(edtPathImagem.text);
  frm_principal.x_arquivo_winword := Trim(edtWinWord.text);
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
  frm_principal.x_f8_cliente := rdF8Cli.itemindex;
  frm_principal.x_qtde_linhas_entre_SLIPS_ATENDIMENTO := edtQtdeLinhas_ATENDIMENTO.GetValor;
  if (rdRelatorio.ItemIndex = 0) then
  begin
    frm_principal.x_slip_na_tela_ATENDIMENTO := true; //chSlipNaTela_ATENDIMENTO.checked;
    frm_principal.x_Orcamento_Atendimento    := false;
  end
  else
  begin
    frm_principal.x_slip_na_tela_ATENDIMENTO := false; //chSlipNaTela_ATENDIMENTO.checked;
    frm_principal.x_Orcamento_Atendimento    := true;
  end;
  frm_principal.x_prevalecer_EAN13 := chPrevalecerEAN13.checked;

  DeleteFile ('C:\NATIVA\ATENDIMENTO.ini');
  frm_principal.GravaConfigLocal_Atdo;
     {********************************************************************}
  close;
end;

procedure Tfrm_ConfigLocal_Atdo.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConfigLocal_Atdo.FormActivate(Sender: TObject);
begin
  fichario.activepage:=pagina2;
  chSaltoNat.checked  := frm_principal.x_salto;
  cbImpressora.itemindex := frm_principal.x_impressora;
  rdFormaLeituraVenda.itemindex := frm_principal.x_forma_leitura_cbarra_venda;
  rdFormaLeituraTroca.itemindex := frm_principal.x_forma_leitura_cbarra_troca;
  rdFormaLeituraDevolucao.itemindex := frm_principal.x_forma_leitura_cbarra_devolucao;
  chSaltoNat.checked := frm_principal.x_salto;
  rdModeloImpressao.itemindex := frm_principal.x_modelo_impressao_geral;
  rdColEtiq.itemindex := frm_principal.x_etiquetas_colunas;
  rdTextoEtiq.itemindex := frm_principal.x_etiquetas_texto;
  edtEspaco.text := inttostr(frm_principal.x_etiquetas_espaco);
  edtPathImagem.text := frm_principal.x_pathImg;
  edtWinWord.text := frm_principal.x_arquivo_winword;
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
  rdF8Cli.itemindex := frm_principal.x_f8_cliente;
  fichario.activepageindex := 0;
  edtQtdeLinhas_ATENDIMENTO.text := form_nz(frm_principal.x_qtde_linhas_entre_SLIPS_ATENDIMENTO,2);
  if (frm_principal.x_slip_na_tela_ATENDIMENTO) then
    rdRelatorio.ItemIndex := 0;
  if (frm_principal.x_Orcamento_Atendimento) then
    rdRelatorio.ItemIndex := 1;
  chPrevalecerEAN13.checked := frm_principal.x_prevalecer_EAN13;

  cbImpressora.setfocus;
end;

procedure Tfrm_ConfigLocal_Atdo.cbImpressoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
end;

procedure Tfrm_ConfigLocal_Atdo.edtEspacoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
end;

procedure Tfrm_ConfigLocal_Atdo.edtWinWordKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtPathImagem.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_ConfigLocal_Atdo.edtPathImagemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
  if (key=K_CIMA) then
    edtWinWord.setfocus;
end;

procedure Tfrm_ConfigLocal_Atdo.Salvar1Click(Sender: TObject);
begin
  btnAplicarClick(Sender);
end;

procedure Tfrm_ConfigLocal_Atdo.edtQtdeLinhas_ATENDIMENTOEnter(Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

procedure Tfrm_ConfigLocal_Atdo.edtQtdeLinhas_ATENDIMENTOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnAplicarClick(btnAplicar);
end;

procedure Tfrm_ConfigLocal_Atdo.edtPathImagemEnter(Sender: TObject);
begin
  edtPathImagem.selectall;
end;

procedure Tfrm_ConfigLocal_Atdo.edtWinWordEnter(Sender: TObject);
begin
  edtWinWord.selectall;
end;

end.
