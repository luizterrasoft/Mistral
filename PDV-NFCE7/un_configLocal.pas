unit un_configLocal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Mask, ComCtrls, LabelOO, Menus, CheckBoxOO,
  MaskEditOO, FileCtrl, ImgList, Grids, GridControl, GridSql, EditControle,funcoesglobais,
  DB, DBTables, CheckControle, ComboSql;

type
  Tfrm_ConfigLocal = class(TForm)
    fichario: TPageControl;
    pagina1: TTabSheet;
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
    pagina4: TTabSheet;
    rdTipoExp: TRadioGroup;
    pagina5: TTabSheet;
    Bevel11: TBevel;
    Label26: TLabel;
    btnProcurarWord: TSpeedButton;
    Label17: TLabel;
    edtWinWord: TEdit;
    edtPathImagem: TEdit;
    pagina6: TTabSheet;
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
    pagina3: TTabSheet;
    rdModeloImpressao: TRadioGroup;
    pagina2: TTabSheet;
    Bevel1: TBevel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Salvar1: TMenuItem;
    pagina7: TTabSheet;
    chSlipNaTela_TRANSFERENCIA: TCheckBox;
    Bevel5: TBevel;
    LabelOO2: TLabelOO;
    edtQtdeLinhas_TRANSFERENCIA: TMaskEditOO;
    chExportacaoProgresso: TCheckBoxOO;
    Label13: TLabel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet5: TTabSheet;
    Label29: TLabel;
    edtHostFtp: TEdit;
    Label30: TLabel;
    edtUserid: TEdit;
    Label31: TLabel;
    edtSenha: TEdit;
    Label19: TLabel;
    edtDiretorioInicial: TEdit;
    Label2: TLabel;
    edtLocalExportacao: TMaskEdit;
    ListaDiretorio: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rdFormaLeituraVenda: TRadioGroup;
    rdFormaLeituraTroca: TRadioGroup;
    rdFormaLeituraDevolucao: TRadioGroup;
    chPrevalecerEAN13: TCheckBoxOO;
    Panel8: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    LabelOO3: TLabelOO;
    LabelOO4: TLabelOO;
    Panel9: TPanel;
    Bevel2: TBevel;
    Panel10: TPanel;
    Panel11: TPanel;
    treeOpcoes: TTreeView;
    ImageList1: TImageList;
    Pagina8: TTabSheet;
    Panel12: TPanel;
    Panel13: TPanel;
    FpGaveta: TGridSql;
    Query1: TQuery;
    CkGaveta: TCheckControle;
    Label7: TLabel;
    TabSheet1: TTabSheet;
    memoria_solicitacao_dias_a_vencer_promocao: TEditControle;
    Label9: TLabel;
    UpDown1: TUpDown;
    memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho: TCheckControle;
    IniProm: TCheckControle;
    exploja_allcli: TCheckBoxOO;
    PageControl4: TPageControl;
    TabSheet7: TTabSheet;
    chECFHabilitaFiscal: TCheckBox;
    chBuscaCOO: TCheckBox;
    chImprimeCupomNaoFiscalVinculado: TCheckBoxOO;
    LabelOO1: TLabelOO;
    CkImpItemECF: TCheckBox;
    Label8: TLabel;
    ImpSangEcf: TComboSql;
    listaECFModeloImpressoraFiscal: TListBox;
    LabelOO6: TLabelOO;
    rdECFPorta: TRadioGroup;
    rdCodigoNoCupom: TRadioGroup;
    rdECFModoVenda: TRadioGroup;
    Panel4: TPanel;
    TabSheet8: TTabSheet;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    FormasPagamentoEcf: TGridSql;
    Panel17: TPanel;
    AliquotasEcf: TGridSql;
    Label10: TLabel;
    Label11: TLabel;
    TempoIntervEcf: TEditControle;
    CkExcImp: TCheckBoxOO;
    Pagina9: TTabSheet;
    Panel18: TPanel;
    GroupBox1: TGroupBox;
    CkConsEstoqOutras: TCheckBox;
    CkConsEstoqLoja: TCheckBox;
    CkConsEstoqQtd: TCheckBoxOO;
    CkConsEstoqPrc: TCheckBox;
    GroupBox3: TGroupBox;
    CheckCheckCont: TCheckBox;
    CheckCheckConsCli: TCheckBox;
    TabSheet9: TTabSheet;
    GroupBox4: TGroupBox;
    cbvalesemitidos: TCheckBox;
    cbvalesrecebidos: TCheckBox;
    cbvalesmerc: TCheckBox;
    cbexibiritens: TCheckBox;
    TabSheet10: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    lbldesc: TLabel;
    edtdesc1: TMaskEdit;
    edtfaixafim1: TMaskEdit;
    Label16: TLabel;
    edtfaixaini1: TMaskEdit;
    edtfaixaini2: TMaskEdit;
    Label18: TLabel;
    edtfaixafim2: TMaskEdit;
    edtdesc2: TMaskEdit;
    edtdesc3: TMaskEdit;
    edtfaixafim3: TMaskEdit;
    Label20: TLabel;
    edtfaixaini3: TMaskEdit;
    TabSheet11: TTabSheet;
    chexibiralerta: TCheckControle;
    Label21: TLabel;
    chonlinevpn: TCheckControle;
    edtprazo: TMaskEdit;
    chexibirdevolucao: TCheckBoxOO;
    chexibirtroca: TCheckBoxOO;
    chDescontarDevolucao: TCheckBoxOO;
    chbuscaaltomatica: TCheckControle;
    Bevel3: TBevel;
    chECFhabilitaTEF: TCheckBox;
    chSlipNaTela_COMPROVANTE: TCheckBox;
    chHabilitavalidacoes: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbImpressoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEspacoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHostFtpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUseridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtWinWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPathImagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chECFHabilitaFiscalClick(Sender: TObject);
    procedure chECFHabilitaFiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chECFHabilitaFiscalExit(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure edtDiretorioInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHostFtpEnter(Sender: TObject);
    procedure edtUseridEnter(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtDiretorioInicialEnter(Sender: TObject);
    procedure edtQtdeLinhas_TRANSFERENCIAEnter(Sender: TObject);
    procedure edtQtdeLinhas_TRANSFERENCIAKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtPathImagemEnter(Sender: TObject);
    procedure edtWinWordEnter(Sender: TObject);
    procedure edtLocalExportacaoEnter(Sender: TObject);
    procedure edtLocalExportacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListaDiretorioChange(Sender: TObject);
    procedure treeOpcoesDblClick(Sender: TObject);
    procedure treeOpcoesClick(Sender: TObject);
    procedure treeOpcoesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FpGavetaMontaGridDataSet(var DadosGrid: TDadosgrid;
      var DeletaLinha: Boolean);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure memoria_solicitacao_dias_a_vencer_promocaoChange(
      Sender: TObject);
    procedure treeOpcoesChange(Sender: TObject; Node: TTreeNode);
    procedure Panel14Click(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
    procedure TempoIntervEcfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormasPagamentoEcfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormasPagamentoEcfSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure AliquotasEcfGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure FormasPagamentoEcfMontaGridDataSet(var DadosGrid: TDadosgrid;
      var DeletaLinha: Boolean);
    procedure FormasPagamentoEcfGetCellColor(Sender: TObject; ARow,
      Acol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormasPagamentoEcfKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl3DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure PageControl2DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure PageControl4DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure edtprazoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chonlinevpnClick(Sender: TObject);
  private
    procedure refreshgridgaveta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConfigLocal: Tfrm_ConfigLocal;
  xdata:String;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, auxiliar, urano, venda,procura,
  un_SenhaAdmin, un_SenhaAdministrador, un_senhaSupervisor,
  un_ConfigCobranca;

procedure Tfrm_ConfigLocal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ConfigLocal.btnAplicarClick(Sender: TObject);
var
  i:Integer;
begin
  if xdata<>edtprazo.Text then
  begin
    Application.CreateForm(Tfrm_SenhaAdmin, frm_SenhaAdmin);
    frm_SenhaAdmin.caption := 'Configuração geral do sistema';
    frm_SenhaAdmin.color   := clteal;
    frm_SenhaAdmin.FVendas := true;
    frm_SenhaAdmin.showmodal;
    if (frm_SenhaAdmin.tecla=13) then
    begin
     {Atualizando as variaveis do sistema}
      frm_principal.x_forma_leitura_cbarra_venda     := rdFormaLeituraVenda.itemindex;
      frm_principal.x_forma_leitura_cbarra_troca     := rdFormaLeituraTroca.itemindex;
      frm_principal.x_forma_leitura_cbarra_devolucao := rdFormaLeituraDevolucao.itemindex;
      frm_principal.x_impressora   := cbImpressora.itemindex;
      frm_principal.x_salto        := chSaltoNat.checked;
      frm_principal.x_modelo_impressao_geral := rdModeloImpressao.itemindex;
      frm_principal.x_tipo_exportacao        := rdTipoExp.itemindex;
      frm_principal.x_ftp_host   := edtHostFtp.text;
      frm_principal.x_ftp_userid := edtUserId.text;
      frm_principal.x_ftp_password := edtSenha.text;
      frm_principal.x_ftp_diretorio_inicial := edtDiretorioInicial.text;
      frm_principal.x_etiquetas_colunas     := rdColEtiq.itemindex;
      frm_principal.x_etiquetas_texto       := rdTextoEtiq.itemindex;
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
      if (rdVideoEntrada.itemindex = 2) then
      begin
        frm_principal.x_video_entrada_width  := 1024;
        frm_principal.x_video_entrada_height := 768;
      end
      else
      if (rdVideoEntrada.itemindex = 3) then
      begin
        frm_principal.x_video_entrada_width  := 1280;
        frm_principal.x_video_entrada_height := 1024;
      end
      else
      if (rdVideoEntrada.itemindex = 4) then
      begin
        frm_principal.x_video_entrada_width  := 1440;
        frm_principal.x_video_entrada_height := 900;
      end;
      if (rdCoresEntrada.itemindex = 0) then
        frm_principal.x_video_entrada_color := 4
      else
      if (rdCoresEntrada.itemindex = 1) then
        frm_principal.x_video_entrada_color := 8
      else
      if (rdCoresEntrada.itemindex = 2) then
        frm_principal.x_video_entrada_color := 16
      else
      if (rdCoresEntrada.itemindex = 3) then
        frm_principal.x_video_entrada_color := 32;
      if (rdVideoSaida.itemindex = 0) then
      begin
        frm_principal.x_video_saida_width  := 640;
        frm_principal.x_video_saida_height := 480;
      end
      else
      if (rdVideoSaida.itemindex = 1) then
      begin
        frm_principal.x_video_saida_width  := 800;
        frm_principal.x_video_saida_height := 600;
      end
      else
      if (rdVideoSaida.itemindex = 2) then
      begin
        frm_principal.x_video_saida_width  := 1024;
        frm_principal.x_video_saida_height := 768;
      end
      else
      if (rdVideoSaida.itemindex = 3) then
      begin
        frm_principal.x_video_saida_width  := 1280;
        frm_principal.x_video_saida_height := 1024;
      end
      else
      if (rdVideoSaida.itemindex = 4) then
      begin
        frm_principal.x_video_saida_width  := 1440;
        frm_principal.x_video_saida_height := 900;
      end;
      if (rdCoresSaida.itemindex = 0) then
        frm_principal.x_video_saida_color := 4
      else
      if (rdCoresSaida.itemindex = 1) then
        frm_principal.x_video_saida_color := 8
      else
      if (rdCoresSaida.itemindex = 2) then
        frm_principal.x_video_saida_color := 16
      else
      if (rdCoresSaida.itemindex = 3) then
        frm_principal.x_video_saida_color := 32;
      frm_principal.x_ecf_habilita_modo_fiscal := chECFHabilitaFiscal.checked;
      frm_principal.x_ecf_habilita_TEF         := chECFhabilitaTEF.Checked;
      frm_principal.x_ecf_modo_venda := rdECFModoVenda.itemindex;
      frm_principal.x_ecf_modelo_impressora := listaECFModeloImpressoraFiscal.itemindex;
      if (rdECFPorta.itemindex <= 3) then
        frm_principal.x_ecf_porta_comunicacao :='COM'+inttostr(rdECFPorta.itemindex+1);
      frm_principal.x_ecf_busca_proximo_COO   :=chBuscaCOO.checked;
      frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado := chImprimeCupomNaoFiscalVinculado.checked;
      frm_principal.x_qtde_linhas_entre_SLIPS_TRANSFERENCIA  := edtQtdeLinhas_TRANSFERENCIA.GetValor;
      frm_principal.x_slip_na_tela_TRANSFERENCIA := chSlipNaTela_TRANSFERENCIA.checked;
      frm_principal.x_slip_na_tela_COMPROVANTE   := chSlipNaTela_COMPROVANTE.Checked;
      frm_principal.x_prevalecer_EAN13           := chPrevalecerEAN13.checked;
      frm_principal.x_exibe_alerta_offline       := chexibiralerta.checked;
      frm_principal.x_ecf_codigo_de_barras_no_cupom := rdCodigoNoCupom.itemindex;
      frm_principal.x_exibe_progresso_movimento     := chExportacaoProgresso.checked;
      frm_principal.x_exploja_allcli := exploja_allcli.checked;


      frm_principal.x_path_arquivos_vendas_destino := ListaDiretorio.directory;
      frm_principal.x_tempo_gaveta_venda := iifs(ckGaveta.checked,1,0);
      frm_principal.label7.visible       := frm_principal.x_tempo_gaveta_venda = 1;
      frm_principal.x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho := memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho.checked;
      frm_principal.x_memoria_solicitacao_dias_a_vencer_promocao := strtointn(memoria_solicitacao_dias_a_vencer_promocao.text);
      frm_principal.x_iniprom := iniprom.checked;
      frm_principal.x_comissao_vales_emitidos   := cbvalesemitidos.Checked;
      frm_principal.x_comissao_vales_recebidos  := cbvalesrecebidos.Checked;
      frm_principal.x_comissao_vales_mercadoria := cbvalesmerc.Checked;
      frm_principal.x_exibir_itens := cbexibiritens.Checked;

//     frm_principal.x_desconto_venda := cbdescontovenda.Checked;
      frm_principal.x_impitemecf := CkImpItemEcf.checked;
      frm_principal.x_impSangecf := ImpSangEcf.Text;

      frm_principal.x_ExcImp     := ckExcImp.checked;

      frm_principal.x_ConsEstoqOutras := CkConsEstoqOutras.checked;
      frm_principal.x_ConsEstoqLoja   := CkConsEstoqLoja.checked;
      frm_principal.x_ConsEstoqQtd    := CkConsEstoqQtd.checked;
      frm_principal.x_ConsEstoqPrc    := CkConsEstoqPrc.checked;

      frm_principal.x_CheckCheckConsCli := CheckCheckConsCli.Checked;
      frm_principal.x_CheckCheckCont    := CheckCheckCont.Checked;
      frm_principal.x_HabilitaValidacoes:= chHabilitavalidacoes.Checked;
      if (edtprazo.Text='  /  /    ') then
        frm_principal.x_prazo_vendas := '01/01/1900'
      else
        frm_principal.x_prazo_vendas := edtprazo.Text;
      frm_principal.x_onlinevpn    := chonlinevpn.checked;
      frm_principal.x_buscaaltomatica := chbuscaaltomatica.Checked;
     {********************************************************************}
      DeleteFile ('C:\NATIVA\VENDAS.ini');
      frm_principal.GravaConfigLocal_Caixa;

     {********************************************************************}
      ConfiguraStatusPDV;
      if (frm_principal.x_ecf_habilita_modo_fiscal) then
      begin
        if (frm_principal.x_ecf=0) then
          frm_principal.pnEcf.color:=clRed
        else
          frm_principal.pnEcf.color:=clTeal;
        frm_principal.pnEcf.caption      := ' ECF: '+form_n(frm_principal.x_ecf,2);
      end
      else
      begin
        frm_principal.pnEcf.color:=clTeal;
        frm_principal.pnEcf.caption      := ' ECF';
      end;
      with query1 do
      begin
        sql.clear;
        sql.add('Update  Formas_Pagamento set Fo_Gaveta =:Fo_Gaveta Where Fo_Codi =:Fo_Codi');
        for i:=1 to fpGaveta.rowcount - 1 do
        begin
          parambyname('Fo_Codi').AsFloat    := StrtoFloatN(FpGaveta.FieldValue['Fo_Codi',i]);
          parambyname('Fo_Gaveta').AsString := IIfs(FpGaveta.linhamarcada(i),'T','');
          execsql;
        end;
      end;

      Frm_principal.X_TempoIntervEcf := StrtoFloatN(TempoIntervEcf.Text);

      Frm_principal.X_FormasPagamentoEcf := '';
      for i:=1 to FormasPagamentoEcf.RowCount - 1 do
        if (FormasPagamentoEcf.Cells[0,i] <> '') and (FormasPagamentoEcf.Cells[2,i] <> '') then
          Frm_principal.X_FormasPagamentoEcf := Frm_principal.X_FormasPagamentoEcf + iifs(Frm_principal.X_FormasPagamentoEcf = '','',';')+
            FormasPagamentoEcf.Cells[0,i]+','+FormasPagamentoEcf.Cells[2,i];

      Frm_principal.X_AliquotasEcf       := '';
      for i:=1 to AliquotasEcf.RowCount - 1 do
        if (AliquotasEcf.Cells[0,i] <> '') and (AliquotasEcf.Cells[1,i] <> '') then
          Frm_principal.X_AliquotasEcf     := Frm_principal.X_AliquotasEcf + iifs(Frm_principal.X_AliquotasEcf = '','',';')+
            AliquotasEcf.Cells[0,i]+','+AliquotasEcf.Cells[1,i];


     {********************************************************************}
      close;
    end;
    frm_SenhaAdmin.Free;
  end
  else
  begin
     {Atualizando as variaveis do sistema}
    frm_principal.x_forma_leitura_cbarra_venda := rdFormaLeituraVenda.itemindex;
    frm_principal.x_forma_leitura_cbarra_troca := rdFormaLeituraTroca.itemindex;
    frm_principal.x_forma_leitura_cbarra_devolucao := rdFormaLeituraDevolucao.itemindex;
    frm_principal.x_impressora := cbImpressora.itemindex;
    frm_principal.x_salto := chSaltoNat.checked;
    frm_principal.x_modelo_impressao_geral := rdModeloImpressao.itemindex;
    frm_principal.x_tipo_exportacao := rdTipoExp.itemindex;
    frm_principal.x_ftp_host := edtHostFtp.text;
    frm_principal.x_ftp_userid := edtUserId.text;
    frm_principal.x_ftp_password := edtSenha.text;
    frm_principal.x_ftp_diretorio_inicial := edtDiretorioInicial.text;
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
    end
    else
    if (rdVideoEntrada.itemindex=3) then
    begin
      frm_principal.x_video_entrada_width  := 1280;
      frm_principal.x_video_entrada_height := 1024;
    end
    else
    if (rdVideoEntrada.itemindex=4) then
    begin
      frm_principal.x_video_entrada_width  := 1440;
      frm_principal.x_video_entrada_height := 900;
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
    end
    else
    if (rdVideoSaida.itemindex=3) then
    begin
      frm_principal.x_video_saida_width  := 1280;
      frm_principal.x_video_saida_height := 1024;
    end
    else
    if (rdVideoSaida.itemindex=4) then
    begin
      frm_principal.x_video_saida_width  := 1440;
      frm_principal.x_video_saida_height := 900;
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
    frm_principal.x_ecf_habilita_modo_fiscal := chECFHabilitaFiscal.checked;
    frm_principal.x_ecf_habilita_TEF := chECFhabilitaTEF.Checked;
    frm_principal.x_ecf_modo_venda := rdECFModoVenda.itemindex;
    frm_principal.x_ecf_modelo_impressora := listaECFModeloImpressoraFiscal.itemindex;
    if (rdECFPorta.itemindex<=3) then
      frm_principal.x_ecf_porta_comunicacao:='COM'+inttostr(rdECFPorta.itemindex+1);
    frm_principal.x_ecf_busca_proximo_COO:=chBuscaCOO.checked;
    frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado := chImprimeCupomNaoFiscalVinculado.checked;
    frm_principal.x_qtde_linhas_entre_SLIPS_TRANSFERENCIA := edtQtdeLinhas_TRANSFERENCIA.GetValor;
    frm_principal.x_slip_na_tela_TRANSFERENCIA := chSlipNaTela_TRANSFERENCIA.checked;
    frm_principal.x_slip_na_tela_COMPROVANTE := chSlipNaTela_COMPROVANTE.Checked;
    frm_principal.x_prevalecer_EAN13 := chPrevalecerEAN13.checked;
    frm_principal.x_exibe_alerta_offline := chexibiralerta.checked;
    frm_principal.x_ecf_codigo_de_barras_no_cupom := rdCodigoNoCupom.itemindex;
    frm_principal.x_exibe_progresso_movimento := chExportacaoProgresso.checked;
    frm_principal.x_exploja_allcli := exploja_allcli.checked;


    frm_principal.x_path_arquivos_vendas_destino := ListaDiretorio.directory;
    frm_principal.x_tempo_gaveta_venda := iifs(ckGaveta.checked,1,0);
    frm_principal.label7.visible       := frm_principal.x_tempo_gaveta_venda = 1;
    frm_principal.x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho := memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho.checked;
    frm_principal.x_memoria_solicitacao_dias_a_vencer_promocao := strtointn(memoria_solicitacao_dias_a_vencer_promocao.text);
    frm_principal.x_iniprom := iniprom.checked;
    frm_principal.x_comissao_vales_emitidos := cbvalesemitidos.Checked;
    frm_principal.x_comissao_vales_recebidos := cbvalesrecebidos.Checked;
    frm_principal.x_comissao_vales_mercadoria := cbvalesmerc.Checked;
    frm_principal.x_exibir_itens := cbexibiritens.Checked;

//     frm_principal.x_desconto_venda := cbdescontovenda.Checked;
    frm_principal.x_impitemecf := CkImpItemEcf.checked;
    frm_principal.x_impSangecf := ImpSangEcf.Text;

    frm_principal.x_ExcImp     := ckExcImp.checked;

    frm_principal.x_ConsEstoqOutras := CkConsEstoqOutras.checked;
    frm_principal.x_ConsEstoqLoja   := CkConsEstoqLoja.checked;
    frm_principal.x_ConsEstoqQtd    := CkConsEstoqQtd.checked;
    frm_principal.x_ConsEstoqPrc    := CkConsEstoqPrc.checked;

    frm_principal.x_CheckCheckConsCli := CheckCheckConsCli.Checked;
    frm_principal.x_CheckCheckCont    := CheckCheckCont.Checked;
    frm_principal.x_HabilitaValidacoes:= chHabilitavalidacoes.Checked;
    if (edtprazo.Text='  /  /    ') then
      frm_principal.x_prazo_vendas := '01/01/1900'
    else
      frm_principal.x_prazo_vendas := edtprazo.Text;
    frm_principal.x_onlinevpn    := chonlinevpn.checked;
    frm_principal.x_buscaaltomatica := chbuscaaltomatica.Checked;
     {********************************************************************}
    DeleteFile ('C:\NATIVA\VENDAS.ini');
    frm_principal.GravaConfigLocal_Caixa;

     {********************************************************************}
    ConfiguraStatusPDV;
    if (frm_principal.x_ecf_habilita_modo_fiscal) then
    begin
      if (frm_principal.x_ecf=0) then
        frm_principal.pnEcf.color:=clRed
      else
        frm_principal.pnEcf.color:=clTeal;
      frm_principal.pnEcf.caption      := ' ECF: '+form_n(frm_principal.x_ecf,2);
    end
    else
    begin
      frm_principal.pnEcf.color:=clTeal;
      frm_principal.pnEcf.caption      := ' ECF';
    end;

    with query1 do
    begin
      sql.clear;
      sql.add('Update  Formas_Pagamento set Fo_Gaveta =:Fo_Gaveta Where Fo_Codi =:Fo_Codi');
      for i:=1 to fpGaveta.rowcount - 1 do
      begin
        parambyname('Fo_Codi').AsFloat    := StrtoFloatN(FpGaveta.FieldValue['Fo_Codi',i]);
        parambyname('Fo_Gaveta').AsString := IIfs(FpGaveta.linhamarcada(i),'T','');
        execsql;
      end;
    end;

    Frm_principal.X_TempoIntervEcf := StrtoFloatN(TempoIntervEcf.Text);

    Frm_principal.X_FormasPagamentoEcf := '';
    for i:=1 to FormasPagamentoEcf.RowCount - 1 do
      if (FormasPagamentoEcf.Cells[0,i] <> '') and (FormasPagamentoEcf.Cells[2,i] <> '') then
        Frm_principal.X_FormasPagamentoEcf := Frm_principal.X_FormasPagamentoEcf + iifs(Frm_principal.X_FormasPagamentoEcf = '','',';')+
          FormasPagamentoEcf.Cells[0,i]+','+FormasPagamentoEcf.Cells[2,i];

    Frm_principal.X_AliquotasEcf       := '';
    for i:=1 to AliquotasEcf.RowCount - 1 do
      if (AliquotasEcf.Cells[0,i] <> '') and (AliquotasEcf.Cells[1,i] <> '') then
        Frm_principal.X_AliquotasEcf     := Frm_principal.X_AliquotasEcf + iifs(Frm_principal.X_AliquotasEcf = '','',';')+
          AliquotasEcf.Cells[0,i]+','+AliquotasEcf.Cells[1,i];
     {********************************************************************}
    close;
  end;
end;

procedure Tfrm_ConfigLocal.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConfigLocal.FormActivate(Sender: TObject);
var
  i:Integer;
  a:String;
begin
  CkConsEstoqOutras.checked := frm_principal.x_ConsEstoqOutras;
  CkConsEstoqLoja.checked   :=frm_principal.x_ConsEstoqLoja;
  CkConsEstoqQtd.checked    := frm_principal.x_ConsEstoqQtd;
  CkConsEstoqPrc.checked    := frm_principal.x_ConsEstoqPrc;

  CheckCheckConsCli.Checked    :=  frm_principal.x_CheckCheckConsCli;
  CheckCheckCont.Checked       :=  frm_principal.x_CheckCheckCont;
  chHabilitavalidacoes.Checked :=  frm_principal.x_HabilitaValidacoes;

  rdFormaLeituraVenda.itemindex          := frm_principal.x_forma_leitura_cbarra_venda;
  rdFormaLeituraTroca.itemindex          := frm_principal.x_forma_leitura_cbarra_troca;
  rdFormaLeituraDevolucao.itemindex      := frm_principal.x_forma_leitura_cbarra_devolucao;
  chSaltoNat.checked                     := frm_principal.x_salto;
  cbImpressora.itemindex                 := frm_principal.x_impressora;
  chSaltoNat.checked                     := frm_principal.x_salto;
  rdModeloImpressao.itemindex            := frm_principal.x_modelo_impressao_geral;
  rdColEtiq.itemindex                    := frm_principal.x_etiquetas_colunas;
  rdTextoEtiq.itemindex                  := frm_principal.x_etiquetas_texto;
  edtEspaco.text                         := inttostr(frm_principal.x_etiquetas_espaco);
  rdTipoExp.itemindex                    := frm_principal.x_tipo_exportacao;
  edtHostFtp.text                        := Trim(frm_principal.x_ftp_host);
  edtUserId.text                         := Trim(frm_principal.x_ftp_userid);
  edtSenha.text                          := Trim(frm_principal.x_ftp_password);
  edtDiretorioInicial.text               := Trim(frm_principal.x_ftp_diretorio_inicial);
  edtPathImagem.text                     := frm_principal.x_pathImg;
  edtWinWord.text                        := frm_principal.x_arquivo_winword;
  chModificarVideo.checked               := frm_principal.x_modificar_video;
  if (frm_principal.x_video_entrada_width=640) and (frm_principal.x_video_entrada_height=480) then
    rdVideoEntrada.itemindex:=0;
  if (frm_principal.x_video_entrada_width=800) and (frm_principal.x_video_entrada_height=600) then
    rdVideoEntrada.itemindex:=1;
  if (frm_principal.x_video_entrada_width=1024) and (frm_principal.x_video_entrada_height=768) then
    rdVideoEntrada.itemindex:=2;
  if (frm_principal.x_video_entrada_width=1280) and (frm_principal.x_video_entrada_height=1024) then
    rdVideoEntrada.itemindex:=3;
  if (frm_principal.x_video_entrada_width=1440) and (frm_principal.x_video_entrada_height=900) then
    rdVideoEntrada.itemindex:=4;
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
  if (frm_principal.x_video_saida_width=1280) and (frm_principal.x_video_saida_height=1024) then
    rdVideosaida.itemindex:=3;
  if (frm_principal.x_video_saida_width=1440) and (frm_principal.x_video_saida_height=900) then
    rdVideosaida.itemindex:=48;
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
  chECFHabilitaFiscal.checked              := frm_principal.x_ecf_habilita_modo_fiscal;
  chECFhabilitaTEF.Checked                 := frm_principal.x_ecf_habilita_TEF;
  chImprimeCupomNaoFiscalVinculado.checked := frm_principal.x_ecf_imprime_cupom_nao_fiscal_vinculado;
  listaECFModeloImpressoraFiscal.itemindex := frm_principal.x_ecf_modelo_impressora;
  if (Pos('COM',frm_principal.x_ecf_porta_comunicacao)>0) then
    rdECFPorta.itemindex                   := strtoint(Copy(frm_principal.x_ecf_porta_comunicacao,4,1))-1;
  chBuscaCOO.checked                       :=frm_principal.x_ecf_busca_proximo_COO;
  rdCodigoNoCupom.itemindex                := frm_principal.x_ecf_codigo_de_barras_no_cupom;
  memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho.checked := frm_principal.x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho;
  memoria_solicitacao_dias_a_vencer_promocao.text                   := inttostr(frm_principal.x_memoria_solicitacao_dias_a_vencer_promocao);
  memoria_solicitacao_dias_a_vencer_promocao.ValueIni               := inttostr(frm_principal.x_memoria_solicitacao_dias_a_vencer_promocao);
  iniprom.checked               := frm_principal.x_iniprom;
  cbvalesemitidos.Checked       := frm_principal.x_comissao_vales_emitidos;
  cbvalesrecebidos.Checked      := frm_principal.x_comissao_vales_recebidos;
  cbvalesmerc.Checked           := frm_principal.x_comissao_vales_mercadoria;
  chexibirdevolucao.Checked     := frm_principal.x_exibe_devolucao;
  chexibirtroca.Checked         := frm_principal.x_exibe_troca;
  chDescontarDevolucao.Checked  := frm_principal.x_descontar_devolucao;

  cbexibiritens.Checked := frm_principal.x_exibir_itens;
  edtfaixaini1.Text     := form_nc(frm_principal.x_faixaini1,10);
  edtfaixaini2.Text     := form_nc(frm_principal.x_faixaini2,10);
  edtfaixaini3.Text     := form_nc(frm_principal.x_faixaini3,10);
  edtfaixafim1.Text     := form_nc(frm_principal.x_faixafim1,10);
  edtfaixafim2.Text     := form_nc(frm_principal.x_faixafim2,10);
  edtfaixafim3.Text     := form_nc(frm_principal.x_faixafim3,10);
  edtdesc1.Text := form_nc(frm_principal.x_desc1,8);
  edtdesc2.Text := form_nc(frm_principal.x_desc2,8);
  edtdesc3.Text := form_nc(frm_principal.x_desc3,8);
  if (frm_principal.x_tipofaixa='') or (frm_principal.x_tipofaixa='P') then
    lbldesc.Caption := 'Desconto %'
  else
  if (frm_principal.x_tipofaixa='V') then
    lbldesc.Caption := 'Desconto $';
//     cbdescontovenda.Checked := frm_principal.x_desconto_venda;
  ckImpItemEcf.checked := frm_principal.x_ImpItemEcf;
  ImpSangEcf.ItemIndex := ImpSangEcf.Items.IndexOf(frm_principal.x_ImpSangEcf);

  if (chECFHabilitaFiscal.checked) then
  begin
    chBuscaCOO.enabled := true;
    listaECFModeloImpressoraFiscal.enabled := true;
    rdECFPorta.enabled := true;
  end
  else
  begin
    chBuscaCOO.enabled := false;
    listaECFModeloImpressoraFiscal.enabled := false;
    rdECFPorta.enabled := false;
  end;
  edtQtdeLinhas_TRANSFERENCIA.text   := form_nz(frm_principal.x_qtde_linhas_entre_SLIPS_TRANSFERENCIA,2);
  chSlipNaTela_TRANSFERENCIA.checked := frm_principal.x_slip_na_tela_TRANSFERENCIA;
  chSlipNaTela_COMPROVANTE.Checked   := frm_principal.x_slip_na_tela_COMPROVANTE;
  chPrevalecerEAN13.checked          := frm_principal.x_prevalecer_EAN13;
  chexibiralerta.checked             := frm_principal.x_exibe_alerta_offline;
  chExportacaoProgresso.checked      := frm_principal.x_exibe_progresso_movimento;
  exploja_allcli.checked             := frm_principal.x_exploja_allcli;
  ListaDiretorio.directory           := frm_principal.x_path_arquivos_vendas_destino;
  edtLocalExportacao.text            := frm_principal.x_path_arquivos_vendas_destino;
  ckgaveta.checked                   := frm_principal.x_tempo_gaveta_venda = 1;
  ckExcImp.checked                   := frm_principal.x_ExcImp;
  if frm_principal.x_prazo_vendas='01/01/1900' then
  begin
    edtprazo.Text := '';
    xdata:= '  /  /    ';
  end
  else
  begin
    edtprazo.Text := frm_principal.x_prazo_vendas;
    xdata         := frm_principal.x_prazo_vendas;
  end;
  TempoIntervEcf.Text    := floattostr(Frm_principal.X_TempoIntervEcf);
  chonlinevpn.Checked    := frm_principal.x_onlinevpn;
  chbuscaaltomatica.Checked := frm_principal.x_buscaaltomatica;
  if (chonlinevpn.Checked) then
  begin
    chbuscaaltomatica.Checked := false;
    chbuscaaltomatica.Enabled := false;
  end;

  if trim(Frm_principal.X_FormasPagamentoEcf) <> '' then
    with separastring(Frm_principal.X_FormasPagamentoEcf,';') do
      try
        for i:=0 to Count - 1 do
          with SeparaString(Strings[i]) do
            try
              a := Strings[0];
              if FormasPagamentoEcf.Cols[0].IndexOf(a) > -1 then
                FormasPagamentoEcf.cells[2,FormasPagamentoEcf.Cols[0].IndexOf(a)] := Strings[1];
//               FormasPagamentoEcf.cells[0,FormasPagamentoEcf.RowCount - 1] := Strings[0];
  //             FormasPagamentoEcf.cells[1,FormasPagamentoEcf.RowCount - 1] := ProcuraNomeFormaPgto(StrtoFloatN(Strings[0]),Self);
            finally
              destroy;
            end//             if i <> count - 1 then
//             FormasPagamentoEcf.RowCount := FormasPagamentoEcf.RowCount + 1;
        ;
      finally
        destroy;
      end;


  if trim(Frm_principal.X_AliquotasEcf) <> '' then
    with separastring(Frm_principal.X_AliquotasEcf,';') do
      try
        for i:=0 to Count - 1 do
        begin
          with SeparaString(Strings[i]) do
            try
              AliquotasEcf.cells[0,AliquotasEcf.RowCount - 1] := Strings[0];
              AliquotasEcf.cells[1,AliquotasEcf.RowCount - 1] := Strings[1];
            finally
              destroy;
            end;
          if i <> count - 1 then
            AliquotasEcf.RowCount := AliquotasEcf.RowCount + 1;
        end;
      finally
        destroy;
      end;

  treeOpcoes.setfocus; {*}
end;

procedure Tfrm_ConfigLocal.cbImpressoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
end;

procedure Tfrm_ConfigLocal.edtEspacoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
end;

procedure Tfrm_ConfigLocal.edtHostFtpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtUserId.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_ConfigLocal.edtUseridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSenha.setfocus;
  if (key=K_CIMA) then
    edtHostFtp.setfocus;
end;

procedure Tfrm_ConfigLocal.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDiretorioInicial.setfocus;
  if (key=K_CIMA) then
    edtUserId.setfocus;
end;

procedure Tfrm_ConfigLocal.edtWinWordKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtPathImagem.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_ConfigLocal.edtPathImagemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
  if (key=K_CIMA) then
    edtWinWord.setfocus;
end;

procedure Tfrm_ConfigLocal.chECFHabilitaFiscalClick(Sender: TObject);
begin
  if (chECFHabilitaFiscal.checked) then
  begin
    chBuscaCOO.enabled:=true;
    listaECFModeloImpressoraFiscal.enabled:=true;
    rdECFPorta.enabled:=true;
    chECFhabilitaTEF.Enabled := true;
  end
  else
  begin
    chBuscaCOO.enabled := false;
    listaECFModeloImpressoraFiscal.enabled:=false;
    rdECFPorta.enabled := false;
    chECFhabilitaTEF.Checked := false;
    chECFhabilitaTEF.Enabled := false;
  end;
end;

procedure Tfrm_ConfigLocal.chECFHabilitaFiscalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chECFHabilitaFiscal.checked) then
  begin
    chBuscaCOO.enabled := true;
    listaECFModeloImpressoraFiscal.enabled := true;
    rdECFPorta.enabled := true;
    chECFhabilitaTEF.Enabled := true;
  end
  else
  begin
    chBuscaCOO.enabled := false;
    listaECFModeloImpressoraFiscal.enabled := false;
    rdECFPorta.enabled := false;
    chECFhabilitaTEF.Checked := false;
    chECFhabilitaTEF.Enabled := false;
  end;
end;

procedure Tfrm_ConfigLocal.chECFHabilitaFiscalExit(Sender: TObject);
begin
  if (chECFHabilitaFiscal.checked) then
  begin
    chBuscaCOO.enabled := true;
    listaECFModeloImpressoraFiscal.enabled := true;
    rdECFPorta.enabled := true;
    chECFhabilitaTEF.Enabled := true;
  end
  else
  begin
    chBuscaCOO.enabled := false;
    listaECFModeloImpressoraFiscal.enabled := false;
    rdECFPorta.enabled := false;
    chECFhabilitaTEF.Checked := false;
    chECFhabilitaTEF.Enabled := false;
  end;
end;

procedure Tfrm_ConfigLocal.Salvar1Click(Sender: TObject);
begin
  btnAplicarClick(Sender);
end;

procedure Tfrm_ConfigLocal.edtDiretorioInicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
  if (key=K_CIMA) then
    edtUserId.setfocus;
end;

procedure Tfrm_ConfigLocal.edtHostFtpEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConfigLocal.edtUseridEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConfigLocal.edtSenhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConfigLocal.edtDiretorioInicialEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConfigLocal.edtQtdeLinhas_TRANSFERENCIAEnter(
  Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

procedure Tfrm_ConfigLocal.edtQtdeLinhas_TRANSFERENCIAKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(btnAplicar);
end;

procedure Tfrm_ConfigLocal.edtPathImagemEnter(Sender: TObject);
begin
  edtPathImagem.selectall;
end;

procedure Tfrm_ConfigLocal.edtWinWordEnter(Sender: TObject);
begin
  edtWinWord.selectall;
end;

procedure Tfrm_ConfigLocal.edtLocalExportacaoEnter(Sender: TObject);
begin
  edtLocalExportacao.selectall;
end;

procedure Tfrm_ConfigLocal.edtLocalExportacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  btnAplicarClick(btnAplicar);
end;

procedure Tfrm_ConfigLocal.ListaDiretorioChange(Sender: TObject);
begin
  edtLocalExportacao.text := ListaDiretorio.directory;
end;

procedure Tfrm_ConfigLocal.treeOpcoesDblClick(Sender: TObject);
var
  ind: Integer;
begin
  ind:=0;
  while (ind<treeOpcoes.items.count) do
  begin
    if (treeOpcoes.items.item[ind].selected) then
      break;
    ind:=ind+1;
  end;


  if (ind=0) then
    fichario.activepage:=pagina1 //relatorios
  else
  if (ind=1) then
    fichario.activepage:=pagina2 //interface
  else
  if (ind=2) then
  begin
    fichario.activepage:=pagina3; //fiscal
    pagecontrol4.activepageindex:=0;
  end
  else
  if (ind=3) then
    fichario.activepage:=pagina4 //movimento
  else
  if (ind=4) then
    fichario.activepage:=pagina5 //diretorios
  else
  if (ind=5) then
    fichario.activepage:=pagina6 //video
  else
  if (ind=6) then
    fichario.activepage:=pagina7 //slips
  else
  if (ind=7) then
    fichario.activepage:=pagina8 //gaveta
  else
  if (ind=8) then
    fichario.activepage:=pagina9; //outras
end;

procedure Tfrm_ConfigLocal.treeOpcoesClick(Sender: TObject);
begin
  treeOpcoesDblClick(treeOpcoes);
end;

procedure Tfrm_ConfigLocal.treeOpcoesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_CIMA) or (key=K_PGUP) or (key=K_PGDOWN) then
    treeOpcoesDblClick(treeOpcoes);
end;

procedure Tfrm_ConfigLocal.FormCreate(Sender: TObject);
begin
  with fpgaveta do
  begin
    colwidths[2] := -1;
    movimentacelula := true;
  end;

  with query1 do
  begin
    sql.add('Select Fo_Gaveta,Fo_Desc,Fo_Codi from Formas_Pagamento order by fo_desc');
    open;
    FpGaveta.MontaGriddataset(Query1,0);
  end;

  with query1 do
  begin
    sql.clear;
    sql.add('Select Fo_Codi,Fo_Desc,'''' as CodEcf from Formas_Pagamento order by fo_codi');
    open;
    FormasPagamentoEcf.MontaGriddataset(Query1,0);
  end;

  with formaspagamentoecf  do
  begin
    cellskip[0] := true;
    cellskip[1] := true;
    movimentacelula := false;
    incluilinha     := false;
    ctrldelete      := false;
    colchaves       := '';
  end;

  with Aliquotasecf  do
    movimentacelula := true;


end;

procedure Tfrm_ConfigLocal.refreshgridgaveta;
begin

end;

procedure Tfrm_ConfigLocal.FpGavetaMontaGridDataSet(
  var DadosGrid: TDadosgrid; var DeletaLinha: Boolean);
begin
  if dadosgrid.Coluna = 0 then
    if query1.fieldbyname('Fo_Gaveta').AsString = 'T' then
      dadosgrid.valor := GridSql.Marcacao
    else
      dadosgrid.valor := '';
end;

procedure Tfrm_ConfigLocal.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  memoria_solicitacao_dias_a_vencer_promocao.text := inttostr(strtointn(memoria_solicitacao_dias_a_vencer_promocao.text) + iifs(button = btnext,1,-1));
end;

procedure Tfrm_ConfigLocal.memoria_solicitacao_dias_a_vencer_promocaoChange(
  Sender: TObject);
begin
  UpDown1.Position := strtointn(memoria_solicitacao_dias_a_vencer_promocao.text);
end;

procedure Tfrm_ConfigLocal.treeOpcoesChange(Sender: TObject;
  Node: TTreeNode);
begin
  NODE.SelectedIndex := NODE.ImageIndex;
end;

procedure Tfrm_ConfigLocal.Panel14Click(Sender: TObject);
begin
  Pagecontrol4.ActivePageIndex := 1;
end;

procedure Tfrm_ConfigLocal.Panel16Click(Sender: TObject);
begin
  Pagecontrol4.ActivePageIndex := 0;
end;

procedure Tfrm_ConfigLocal.TempoIntervEcfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Vk_Return then
    BtnAplicar.OnClick(Sender);
end;

procedure Tfrm_ConfigLocal.FormasPagamentoEcfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Vk_F8 then
    ChamandoF8FormaPgto(FormasPagamentoEcf,false);
end;

procedure Tfrm_ConfigLocal.FormasPagamentoEcfSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  with FormasPagamentoEcf do
    if cells[0,Row] <> '' then
      cells[1,Row] := ProcuraNomeFormaPgto(StrtoFloatN(cells[0,Row]),Self)
    else
      cells[1,Row] := '';
end;

procedure Tfrm_ConfigLocal.AliquotasEcfGetCellAlignment(Sender: TObject;
  ARow, ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
  HorAlignment := TaRightJustify;
end;

procedure Tfrm_ConfigLocal.FormasPagamentoEcfMontaGridDataSet(
  var DadosGrid: TDadosgrid; var DeletaLinha: Boolean);
begin
  if dadosgrid.Coluna = 0 then
    dadosgrid.semmascara := true;
end;

procedure Tfrm_ConfigLocal.FormasPagamentoEcfGetCellColor(Sender: TObject;
  ARow, Acol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
  if (Acol in [0,1]) and (arow <> 0) then
  begin
    ABrush.Color := clnavy;
    AFont.Color  := clwindow;
  end;
end;

procedure Tfrm_ConfigLocal.FormasPagamentoEcfKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (UpCase(Key) in ['A'..'Z']) then
    Key := #0;
end;

procedure Tfrm_ConfigLocal.PageControl3DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if Active then
  begin
    Control.Canvas.Font.Color := clWhite;
    Control.Canvas.Brush.Color := clTeal;
  end
  else
  begin
    Control.Canvas.Font.Color := clBtnFace;
    Control.Canvas.Font.Style := [fsBold];
    Control.Canvas.Brush.Color := clTeal;
  end;

  Control.Canvas.FillRect( Rect );
  Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(PageControl3.Pages[TabIndex]).Caption );
end;

procedure Tfrm_ConfigLocal.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if Active then
  begin
    Control.Canvas.Font.Color := clWhite;
    Control.Canvas.Brush.Color := clTeal;
  end
  else
  begin
    Control.Canvas.Font.Color := clBtnFace;
    Control.Canvas.Font.Style := [fsBold];
    Control.Canvas.Brush.Color := clTeal;
  end;

  Control.Canvas.FillRect( Rect );
  Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(PageControl1.Pages[TabIndex]).Caption );
end;

procedure Tfrm_ConfigLocal.PageControl2DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if Active then
  begin
    Control.Canvas.Font.Color := clWhite;
    Control.Canvas.Brush.Color := clTeal;
  end
  else
  begin
    Control.Canvas.Font.Color := clBtnFace;
    Control.Canvas.Font.Style := [fsBold];
    Control.Canvas.Brush.Color := clTeal;
  end;

  Control.Canvas.FillRect( Rect );
  Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(PageControl2.Pages[TabIndex]).Caption );
end;

procedure Tfrm_ConfigLocal.PageControl4DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if Active then
  begin
    Control.Canvas.Font.Color := clWhite;
    Control.Canvas.Brush.Color := clTeal;
  end
  else
  begin
    Control.Canvas.Font.Color := clBtnFace;
    Control.Canvas.Font.Style := [fsBold];
    Control.Canvas.Brush.Color := clTeal;
  end;

  Control.Canvas.FillRect( Rect );
  Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(PageControl4.Pages[TabIndex]).Caption );
end;

procedure Tfrm_ConfigLocal.edtprazoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Salvar1.Click;
end;

procedure Tfrm_ConfigLocal.chonlinevpnClick(Sender: TObject);
begin
  if (chonlinevpn.Checked) then
  begin
    chbuscaaltomatica.Checked := false;
    chbuscaaltomatica.Enabled := false;
  end
  else
    chbuscaaltomatica.Enabled := true;
end;

end.
