unit un_ExportaRetaguarda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, Gauges, Mask, Buttons, MaskEditOO, ComCtrls,
  FileCtrl, classeExport, CheckBoxOO, LabelOO, jpeg, BotaoSair, zlib, tsqZip
  {ZipForge};

type
  Tfrm_ExportaRetaguarda = class(TForm)
    Panel1: TPanel;
    timerMensagem: TTimer;
    pg1: TPageControl;
    pagina1: TTabSheet;
    pagina2: TTabSheet;
    Label1: TLabel;
    rdTerminal: TRadioGroup;
    Label6: TLabel;
    edtTerminal: TMaskEditOO;
    pagina3: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    edtData2: TMaskEditOO;
    edtData1: TMaskEditOO;
    pagina4: TTabSheet;
    chProgresso: TCheckBox;
    Label9: TLabel;
    pnMensagem: TPanel;
    pnSucesso: TPanel;
    pnFracasso: TPanel;
    lblCopiando: TLabelOO;
    Gauge1: TGauge;
    Bevel4: TBevel;
    pg2: TPageControl;
    pagina51: TTabSheet;
    MemoTarefas: TMemo;
    pagina52: TTabSheet;
    MemoErros: TMemo;
    pnDatas: TPanel;
    pnLogo: TPanel;
    Image1: TImage;
    LabelOO1: TLabelOO;
    lblLocal: TLabelOO;
    btnFechar1: TBotaoSair;
    btnFechar2: TBotaoSair;
    btnFechar3: TBotaoSair;
    btnFechar4: TBotaoSair;
    BitBtnAvancar: TBitBtn;
    BitBtnAvancar2: TBitBtn;
    BitBtnVoltar2: TBitBtn;
    BitBtnAvancar3: TBitBtn;
    BitBtnVoltar3: TBitBtn;
    BitBtnVoltar4: TBitBtn;
    BitBtnCompactar: TBitBtn;
    BitBtnEnviaFTP: TBitBtn;
    BitBtnReenviar: TBitBtn;
    OpenDialog1: TOpenDialog;
    lbl1: TLabel;
    tsqZip: TtsqZip;
    procedure edtData1Enter(Sender: TObject);
    procedure edtData2Enter(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure timerMensagemTimer(Sender: TObject);
    procedure edtTerminalEnter(Sender: TObject);
    procedure edtTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rdTerminalClick(Sender: TObject);
    procedure btnEnviarFTPClick(Sender: TObject);
    procedure btnVoltar4Click(Sender: TObject);
    procedure btnVoltar3Click(Sender: TObject);
    procedure btnVoltar2Click(Sender: TObject);
    procedure btnAvancar2Click(Sender: TObject);
    procedure btnAvancar3Click(Sender: TObject);
    procedure btnCompactarClick(Sender: TObject);
    procedure btnAvancar1Click(Sender: TObject);
    procedure btnFechar1Click(Sender: TObject);
    procedure btnFechar2Click(Sender: TObject);
    procedure btnFechar3Click(Sender: TObject);
    procedure btnFechar4Click(Sender: TObject);
    procedure BitBtnAvancarClick(Sender: TObject);
    procedure BitBtnVoltar2Click(Sender: TObject);
    procedure BitBtnAvancar3Click(Sender: TObject);
    procedure BitBtnVoltar3Click(Sender: TObject);
    procedure BitBtnAvancar2Click(Sender: TObject);
    procedure BitBtnVoltar4Click(Sender: TObject);
    procedure BitBtnCompactarClick(Sender: TObject);
    procedure BitBtnEnviaFTPClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    y_pathlocal: String; {* localizacao dos arquivos do NATIVA VENDAS}
    pathCompactadores: String;
    pathCompactadoresDOS: String;
    unidadeCompactadores: String;
    contFtp: Integer;
    EXPORTACAO_SUCESSO: Boolean;
    procedure CompressionProgress(Sender: TObject);
    procedure CompressFiles(Arquivos: TStrings; const Compactado: String);
    procedure ComprimirArquivos(const NomeArquivo: String; const Extensao: String);
    procedure CompactarArquivo;
    procedure ExportarMovimento;
    procedure MarcaTodoMundoOffLineComoENVIADO;
    procedure EnviarFTP(oArquivo,dArquivo: String);
    procedure ExportaTipoExportacao;
    procedure ExportaTransferencias(seq: Integer);
    procedure ExportaItensTransferencias(seq: Integer);
    procedure ExportaFechamentoDoCaixa(seq: Integer);
    procedure ExportaValesMerc(seq: Integer);
    procedure executaCompactaBat(ExtArquivo: String; nomeArquivo: String);
  end;

var
  frm_ExportaRetaguarda: Tfrm_ExportaRetaguarda;

implementation

{$R *.DFM}

uses auxiliar, funcoes1, funcoes2, procura, unDialogo, principal, DM3, F8Lojas,
  un_Exportacao_FTP, URetornoNfe_AtualizaVenda, URetornoNfe_CancelaVenda;

procedure Tfrm_ExportaRetaguarda.edtData1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ExportaRetaguarda.edtData2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ExportaRetaguarda.edtData1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtData2.setfocus;
  if (key=K_ESC) then
    close;
  if (key=K_CIMA) then
    edtTerminal.setfocus;
end;

procedure Tfrm_ExportaRetaguarda.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    BitbtnAvancar3.click;
  if (key=K_CIMA) then
    edtData1.setfocus;
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ExportaRetaguarda.ExportarMovimento;
var
  nome_user,data,hora: String;
  clExp: TClassExport;
  sequencial: Integer;
  RetornoNfe: TRetornoNfe_AtualizaVenda;
  CancelaNfe: TRetornoNfe_CancelaVenda;
begin
  if (edtTerminal.GetValor = 0) and (rdTerminal.ItemIndex = 1) then
  begin
    frmDialogo.ExibirMensagem('O n� do terminal deve ser informado!'
      ,'Movimento',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtTerminal.SetFocus;
  end
  else
  if (edtData1.GetValor = StrToDate('01/01/1900')) then
  begin
    frmDialogo.ExibirMensagem('Data inicial n�o pode ficar vazia!'
      ,'Movimento',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.SetFocus;
  end
  else
  if (edtData2.GetValor = StrToDate('01/01/1900')) then
  begin
    frmDialogo.ExibirMensagem('Data final n�o pode ficar vazia!'
      ,'Movimento',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData2.SetFocus;
  end
  else
  begin
    if (frm_principal.x_habilita_integracao_nfe) then
    begin
      memoTarefas.Lines.Add('');
      memoTarefas.Lines.Add('    Importando retornos das NFe emitidas e canceladas, aguarde...                ');
      memoTarefas.Lines.Add('---------------------------------------------------------------------------------');
      RetornoNfe := TRetornoNfe_AtualizaVenda.Create;
      RetornoNfe.Free;
      CancelaNfe := TRetornoNfe_CancelaVenda.Create;
      CancelaNfe.Free;
    end;

    pnMensagem.Visible  := false;
    Label9.Visible      := false;
    lblCopiando.Visible := true;
    lblCopiando.Refresh;

    nome_user := ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,self);

    data := DateToStr(frm_principal.x_data_trabalho);
    hora := TimeToStr(Time);

    memoTarefas.Lines.Add('');
    memoTarefas.Lines.Add('      Status da exporta��o - Data/Hora: '+data+' '+hora+'  Usu�rio: '+nome_user);
    memoTarefas.Lines.Add('---------------------------------------------------------------------------------');

    {****************************************************************}
    clExp := TClassExport.Create;
    clExp.Inicializa;

    if (rdTerminal.ItemIndex = 0) then //TODOS OS TERMINAIS JUNTOS
    begin
      sequencial := 1;
      clExp.ExportaTabela('VENDAS','VENDAS',y_pathlocal+'\VENDAS.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VENDAS_EXCESSO',y_pathlocal+'\VENDAEXC.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ITENS_VENDAS',y_pathlocal+'\ITVENDAS.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VENDAS_FORMA_PAGAMENTO',y_pathlocal+'\VENDASFP.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VENDAS_ATENDIMENTO',y_pathlocal+'\VENDASAT.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CARTOES',y_pathlocal+'\CARTOES.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CARTOES_PARCELAS',y_pathlocal+'\CARTPARC.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CHEQUES',y_pathlocal+'\CHEQUES.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CREDIARIOS',y_pathlocal+'\CRED.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VALES_RECEBIDOS',y_pathlocal+'\VALREC.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VALES_EMITIDOS',y_pathlocal+'\VALEMIT.'+form_nz(frm_principal.x_loja,3),
        'VA_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','LANCAMENTOS_CAIXA_EXC',y_pathlocal+'\LANCAIXE.'+form_nz(frm_principal.x_loja,3),
        'LC_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','LANCAMENTOS_CAIXA',y_pathlocal+'\LANCAIX.'+form_nz(frm_principal.x_loja,3),
        'LC_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VALES_MERCADORIAS',y_pathlocal+'\VALEMERC.'+form_nz(frm_principal.x_loja,3),
        'VA_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ITENS_VALES_MERCADORIAS',y_pathlocal+'\ITVALEME.'+form_nz(frm_principal.x_loja,3),
        'VA_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ATENDIMENTOS',y_pathlocal+'\ATDO.'+form_nz(frm_principal.x_loja,3),
        'AT_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ITENS_ATENDIMENTOS',y_pathlocal+'\ITATDO.'+form_nz(frm_principal.x_loja,3),
        'AT_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','SANGRIA_REPROVISAO',y_pathlocal+'\SANG.'+form_nz(frm_principal.x_loja,3),
        'DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;

      clExp.ExportaTabela('VENDAS','CAIXAS',y_pathlocal+'\CAIX.'+form_nz(frm_principal.x_loja,3),
        'CX_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;

      clExp.ExportaTabela('VENDAS','CHEQUES_DEVOLVIDOS_RECEBIDOS',y_pathlocal+'\CHQD.'+form_nz(frm_principal.x_loja,3),
        'DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;

      clExp.ExportaTabela('VENDAS','AUDITORIA_TROCA_VENDEDOR',y_pathlocal+'\ADVD.'+form_nz(frm_principal.x_loja,3),
        'AV_DATA','d',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
    end
    else
    if (rdTerminal.ItemIndex = 1) then
    begin
      //SOMENTE UM TERMINAL ESPECIFICO
      sequencial := 1;
      clExp.ExportaTabela('VENDAS','VENDAS',y_pathlocal+'\VENDAS.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VENDAS_EXCESSO',y_pathlocal+'\VENDAEXC.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,e.VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ITENS_VENDAS',y_pathlocal+'\ITVENDAS.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VENDAS_FORMA_PAGAMENTO',y_pathlocal+'\VENDASFP.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VENDAS_ATENDIMENTO',y_pathlocal+'\VENDASAT.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CARTOES',y_pathlocal+'\CARTOES.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CARTOES_PARCELAS',y_pathlocal+'\CARTPARC.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CHEQUES',y_pathlocal+'\CHEQUES.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','CREDIARIOS',y_pathlocal+'\CRED.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VALES_RECEBIDOS',y_pathlocal+'\VALREC.'+form_nz(frm_principal.x_loja,3),
        'VE_DATA,tab1.VE_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VALES_EMITIDOS',y_pathlocal+'\VALEMIT.'+form_nz(frm_principal.x_loja,3),
        'VA_DATA,VA_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','LANCAMENTOS_CAIXA_EXC',y_pathlocal+'\LANCAIXE.'+form_nz(frm_principal.x_loja,3),
        'LC_DATA,LC_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','LANCAMENTOS_CAIXA',y_pathlocal+'\LANCAIX.'+form_nz(frm_principal.x_loja,3),
        'LC_DATA,LC_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','VALES_MERCADORIAS',y_pathlocal+'\VALEMERC.'+form_nz(frm_principal.x_loja,3),
        'VA_DATA,VA_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ITENS_VALES_MERCADORIAS',y_pathlocal+'\ITVALEME.'+form_nz(frm_principal.x_loja,3),
        'VA_DATA,VA_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ATENDIMENTOS',y_pathlocal+'\ATDO.'+form_nz(frm_principal.x_loja,3),
        'AT_DATA,AT_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','ITENS_ATENDIMENTOS',y_pathlocal+'\ITATDO.'+form_nz(frm_principal.x_loja,3),
        'AT_DATA,AT_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
      clExp.ExportaTabela('VENDAS','SANGRIA_REPROVISAO',y_pathlocal+'\SANG.'+form_nz(frm_principal.x_loja,3),
        'DATA,TERMINAL','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;

      clExp.ExportaTabela('VENDAS','CAIXAS',y_pathlocal+'\CAIX.'+form_nz(frm_principal.x_loja,3),
        'CX_DATA,CX_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;

      clExp.ExportaTabela('VENDAS','CHEQUES_DEVOLVIDOS_RECEBIDOS',y_pathlocal+'\CHQD.'+form_nz(frm_principal.x_loja,3),
        'DATA,CAIXA','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;

      clExp.ExportaTabela('VENDAS','AUDITORIA_TROCA_VENDEDOR',y_pathlocal+'\ADVD.'+form_nz(frm_principal.x_loja,3),
        'AV_DATA,AV_CAIX','d,f',
        form_data(edtData1.GetValor)+':'+form_data(edtData2.GetValor)+','+
        form_nz(edtTerminal.GetValor,2)+':'+form_nz(edtTerminal.GetValor,2),
        memoTarefas,gauge1,chProgresso.checked,';',panel1,sequencial);
      sequencial := sequencial + 1;
    end;
    {****************************************************************}
    ExportaTransferencias      (sequencial);
    sequencial := sequencial + 1;
    ExportaItensTransferencias (sequencial);
    sequencial := sequencial + 1;
    ExportaFechamentoDoCaixa   (sequencial);
    sequencial := sequencial + 1;
    ExportaValesMerc           (sequencial);
    sequencial := sequencial + 1;
    ExportaTipoExportacao; {*}
    {****************************************************************}

    MarcaTodoMundoOffLineComoENVIADO; {*}
    {****************************************************************}
    lblCopiando.visible := false;

    clExp.Finaliza;
    clExp.Free;

    //sinalizando o sucesso da exportacao
    Label9.visible := true;
    pnMensagem.visible := true;
    memoTarefas.lines.Add ('');
    memoTarefas.lines.Add (' - PROCESSAMENTO CONCLU�DO COM �XITO! - ');
  end;
end;

procedure Tfrm_ExportaRetaguarda.CompactarArquivo;
var
  arq: textfile;
  result: Integer;
  finalizador,data,hora: String;
begin

    {*** - Reescrevendo o programa de lote compacto}
  data := form_data(frm_principal.x_data_trabalho);
  while (Pos('/',data)>0) do
    Delete (data,Pos('/',data),1);
  hora := timetostr(time);
  while (Pos(':',hora)>0) do
    Delete (hora,Pos(':',hora),1);
  SetCurrentDir(y_pathlocal);
  AssignFile (arq, 'COMPACTA.BAT');
  ReWrite    (arq);
    {**********************************************************************************************************************************}
  if (rdTerminal.itemindex=0) then  //TUDO JUNTO , TODOS OS TERMINAIS
    finalizador := 'XX'
  else
    finalizador := form_nz(edtTerminal.GetValor,2);
    {**********************************************************************************************************************************}
//  DeleteFile (y_pathlocal+'\VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP');
  DeleteFile (y_pathlocal+'\VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.zip');
    {**********************************************************************************************************************************}
   // C:\Arquivos de programas\WinRAR\WINRAR.EXE a -r -V1440 "C:\Teste.Rar" "C:\Nova_Pasta"

    //  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VENDAEXC.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\rar a  VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.zip *.'+form_nz(frm_principal.x_loja,3));
{  WriteLn    (arq, pathCompactadoresDOS+'\rar VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VENDAEXC.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\rar VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP ITVENDAS.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\rar VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VENDASFP.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VENDASAT.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP CARTOES.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP CARTPARC.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP CHEQUES.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP CRED.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VALREC.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VALEMIT.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP LANCAIXE.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP LANCAIX.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP TIPOEXPO.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VALEMERC.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP ITVALEME.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP ATDO.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP ITATDO.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP TRANSF.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP ITTRANSF.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP SANG.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP CAIX.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP CHQD.'+form_nz(frm_principal.x_loja,3));
  WriteLn    (arq, pathCompactadoresDOS+'\PKZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP VALEMER.'+form_nz(frm_principal.x_loja,3));
    {**********************************************************************************************************************************}

  WriteLn    (arq, 'COPY VEND'+form_nz(frm_principal.x_loja,2)+finalizador+
    '.ZIP VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'_'+data+'_'+hora+'.BAK');
  WriteLn    (arq, 'DEL *.'+form_nz(frm_principal.x_loja,3));
    {**********************************************************************************************************************************}
  CloseFile  (arq);
  memoTarefas.lines.Add('');
  memoTarefas.lines.Add(' - COMPACTA��O DOS ARQUIVOS -');
  result := winexec (Pchar(y_pathlocal+'\COMPACTA.BAT'),1);
  if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
  begin
    showmessage('N�o foi poss�vel compactar os arquivos usando o programa PKZIP.EXE. Tente compactar os arquivos atrav�s de outro programa!');
    memoTarefas.lines.Add('   Status...: ERRO!!!');
    pnMensagem.Visible := false;
//         EXPORTACAO_SUCESSO := false;
  end
  else
  begin
    while (not FileExists
        (Pchar(y_pathlocal+'\VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP'))) do
    ;
    memoTarefas.lines.Add('   Status...: OK');
    pnMensagem.Visible := false;
//         EXPORTACAO_SUCESSO := true;
  end;
  if (frm_principal.x_tipo_exportacao=0) then
    timerMensagem.enabled := true;
end;

procedure Tfrm_ExportaRetaguarda.FormCreate(Sender: TObject);
begin
  if (frm_principal.x_tipo_exportacao=0) then //SEM FTP
  begin
    BitbtnEnviaFtp.visible := false;
    BitbtnCompactar.left    := 454;
    BitbtnVoltar4.left      := 339;
    edtTerminal.Color := clBtnFace;
    BitBtnReenviar.Enabled := false;
    Label6.Enabled := false;
  end;
  pg1.activepage:=pagina1;
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
    // pathCompactadoresDOS := unidadeCompactadores+':\'+Copy(pathCompactadoresDOS,1,6)+'~1';
    pathCompactadoresDOS := 'C:\MISTRALNF';
  end;
  if (not DirectoryExists('C:\NATIVA\VENDAS\MOVIMENTO')) then
  begin
    CreateDir('C:\NATIVA');
    CreateDir('C:\NATIVA\VENDAS');
    CreateDir('C:\NATIVA\MOVIMENTO');
  end;

     {***}
  contFtp := 1;
  EXPORTACAO_SUCESSO := false;
end;

procedure Tfrm_ExportaRetaguarda.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ExportaRetaguarda.MarcaTodoMundoOffLineComoENVIADO;
var
  clAux,clAux2: TClassAuxiliar;
  indGauge,totGauge: Integer;
begin
     //------------------- marcando VENDAS -----------------------------------------
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VE_LOJA,VE_CAIX,VE_CODI                            ');
  clAux.AddParam ('FROM   VENDAS                                             ');
  clAux.AddParam ('WHERE (VE_ENVI='+chr(39)+'0'+chr(39)+')                   '); //vendas NAO ENVIADAS pela exportacao
  if (rdTerminal.itemindex=1) then
    clAux.AddParam ('   AND (VE_CAIX='+floattostr(edtTerminal.GetValor)+')  ');
  clAux.Execute;
  clAux.first;
  if (chProgresso.checked) then
  begin
    gauge1.progress:=0;
    gauge1.visible:=true;
  end;
  indGauge:=0;
  totGauge:=clAux.reccount;
  while (not clAux.eof) do
  begin
          {***************************************************}
    clAux2 := TClassAuxiliar.Create;
    clAux2.conect   ('VENDAS',self);
    clAux2.ClearSql;
    clAux2.AddParam ('UPDATE VENDAS SET VE_ENVI='+chr(39)+'1'+chr(39)+'   '); //marcando como 'ENVIDAS'
    clAux2.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND                        ');
    clAux2.AddParam ('      (VE_CAIX=:VE_CAIX) AND                        ');
    clAux2.AddParam ('      (VE_CODI=:VE_CODI)                            ');
    clAux2.consulta.parambyname('VE_LOJA').AsFloat := clAux.result('VE_LOJA');
    clAux2.consulta.parambyname('VE_CAIX').AsFloat := clAux.result('VE_CAIX');
    clAux2.consulta.parambyname('VE_CODI').AsFloat := clAux.result('VE_CODI');
    clAux2.Execute;
    clAux2.desconect;
    clAux2.Free;
          {***************************************************}
    Application.ProcessMessages;
    clAux.next;
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

     //------------------- marcando ATENDIMENTOS -----------------------------------------
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT AT_LOJA,AT_CAIX,AT_CODI                            ');
  clAux.AddParam ('FROM   ATENDIMENTOS                                       ');
  clAux.AddParam ('WHERE (AT_ENVI='+chr(39)+'0'+chr(39)+')                   '); //vendas NAO ENVIADAS pela exportacao
  if (rdTerminal.itemindex=1) then
    clAux.AddParam (' AND  (AT_CAIX='+floattostr(edtTerminal.GetValor)+')   ');
  clAux.Execute;
  clAux.first;
  indGauge:=0;
  totGauge:=clAux.reccount;
  if (chProgresso.checked) then
    gauge1.visible:=true;
  while (not clAux.eof) do
  begin
          {***************************************************}
    clAux2 := TClassAuxiliar.Create;
    clAux2.conect   ('VENDAS',self);
    clAux2.ClearSql;
    clAux2.AddParam ('UPDATE ATENDIMENTOS SET AT_ENVI='+chr(39)+'1'+chr(39)+'   '); //marcando como 'ENVIDAS'
    clAux2.AddParam ('WHERE (AT_LOJA=:AT_LOJA) AND                        ');
    clAux2.AddParam ('      (AT_CAIX=:AT_CAIX) AND                        ');
    clAux2.AddParam ('      (AT_CODI=:AT_CODI)                            ');
    clAux2.consulta.parambyname('AT_LOJA').AsFloat := clAux.result('AT_LOJA');
    clAux2.consulta.parambyname('AT_CAIX').AsFloat := clAux.result('AT_CAIX');
    clAux2.consulta.parambyname('AT_CODI').AsFloat := clAux.result('AT_CODI');
    clAux2.Execute;
    clAux2.desconect;
    clAux2.Free;
          {***************************************************}
    Application.ProcessMessages;
    clAux.next;
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

     //------------------- marcando TRANSFERENCIAS -----------------------------------------
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT TR_LOJ1,TR_NUME                                    ');
  clAux.AddParam ('FROM   TRANSF_LOJA                                        ');
  clAux.AddParam ('WHERE (TR_ENVI='+chr(39)+'0'+chr(39)+')                   ');
  clAux.Execute;
  clAux.first;
  indGauge:=0;
  totGauge:=clAux.reccount;
  if (chProgresso.checked) then
    gauge1.visible:=true;
  while (not clAux.eof) do
  begin
          {***************************************************}
    clAux2 := TClassAuxiliar.Create;
    clAux2.conect   ('VENDAS',self);
    clAux2.ClearSql;
    clAux2.AddParam ('UPDATE TRANSF_LOJA SET TR_ENVI='+chr(39)+'1'+chr(39)+'   '); //marcando como 'ENVIDAS'
    clAux2.AddParam ('WHERE (TR_LOJ1=:TR_LOJ1) AND                        ');
    clAux2.AddParam ('      (TR_NUME=:TR_NUME)                            ');
    clAux2.consulta.parambyname('TR_LOJ1').AsFloat := clAux.result('TR_LOJ1');
    clAux2.consulta.parambyname('TR_NUME').AsFloat := clAux.result('TR_NUME');
    clAux2.Execute;
    clAux2.desconect;
    clAux2.Free;
          {***************************************************}
    Application.ProcessMessages;
    clAux.next;
    indGauge:=indGauge+1;
    if (chProgresso.checked) then
    begin
      gauge1.progress:=Round((indGauge/totGauge)*100);
      gauge1.refresh;
    end;
  end;

     //------------------- marcando SANGRIAS -----------------------------------------
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('UPDATE  SANGRIA_REPROVISAO SET ENV = ''1''           ');
  clAux.AddParam ('WHERE ENV= ''0''                                     ');
  clAux.Execute;
          
  if (chProgresso.checked) then
    gauge1.visible:=false;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_ExportaRetaguarda.EnviarFTP(oArquivo,dArquivo: String);
begin
  Application.CreateForm (Tfrm_ExportaFTP,frm_ExportaFTP);
  frm_ExportaFTP.flag:=false;
  frm_ExportaFTP.nome_arquivo:=oArquivo;
  frm_ExportaFTP.nome_arquivo_host:= dArquivo;
  frm_ExportaFTP.showmodal;
  if (frm_ExportaFTP.DEU_CERTO) then
  begin
    memoTarefas.lines.Add('   Status...: OK');
    EXPORTACAO_SUCESSO := true;
  end
  else
  begin
    memoTarefas.lines.Add('   Status...: ERRO!!! - Um erro ocorreu com a conex�o de FTP!!! O arquivo n�o foi enviado -');
    EXPORTACAO_SUCESSO := false;
  end;
  frm_ExportaFTP.Free;
  contFtp := contFtp + 1;
end;

procedure Tfrm_ExportaRetaguarda.timerMensagemTimer(Sender: TObject);
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

procedure Tfrm_ExportaRetaguarda.ExportaTipoExportacao;
var
  arq: textfile;
begin
  SetCurrentDir(y_pathlocal);
  AssignFile (arq, 'TIPOEXPO.'+form_nz(frm_principal.x_loja,3));
  ReWrite    (arq);
     {**********************************************************************************************************************************}
  if (rdTerminal.itemindex=0) then
    WriteLn    (arq, 'Terminal=TODOS')
  else
    WriteLn    (arq, 'Terminal='+floattostr(edtTerminal.GetValor));
     {**********************************************************************************************************************************}
  WriteLn    (arq,'Exportacao=PARCIAL');
  WriteLn    (arq,'DataInicio='+form_data(edtData1.GetValor));
  WriteLn    (arq,'DataFim='+form_data(edtData2.GetValor));
     
  CloseFile  (arq);
end;

procedure Tfrm_ExportaRetaguarda.edtTerminalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ExportaRetaguarda.edtTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    BitbtnAvancar2.click;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_ExportaRetaguarda.ExportaTransferencias(seq: Integer);
var
  clAux: TClassAuxiliar;
  arq: textfile;
  indGauge,totGauge: Integer;
begin
  SetCurrentDir(Pchar(y_pathlocal));
  AssignFile (arq, 'TRANSF.'+form_nz(frm_principal.x_loja,3));
  ReWrite    (arq);
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT DISTINCT TRANSF_LOJA.*                      ');
  clAux.AddParam ('FROM TRANSF_LOJA,ITENS_TRANSF_LOJA                 ');
  clAux.AddParam ('WHERE ((TR_LOJ1=:loja AND TR_STAT=:stat) OR         ');
  clAux.AddParam ('      (TR_LOJ2=:loja AND TR_STAT=:stat1)) AND       ');
  clAux.AddParam ('      (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME)      ');
  clAux.AddParam ('AND ((IT_DIGI>=:data1 AND IT_DIGI<=:data2) OR      ');
  clAux.AddParam ('     (IT_EMBA>=:data1 AND IT_EMBA<=:data2) OR      ');
  clAux.AddParam ('     (IT_CHEG>=:data1 AND IT_CHEG<=:data2))        ');
  clAux.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('stat').AsString := '1';
  clAux.consulta.parambyname('stat1').AsString := '2';
  clAux.consulta.parambyname('data1').AsDateTime := edtData1.GetValor;
  clAux.consulta.parambyname('data2').AsDateTime := edtData2.GetValor;
  clAux.Execute;
  clAux.first;
  indGauge:=0;
  totGauge:=clAux.reccount;
  if (chProgresso.checked) then
  begin
    gauge1.progress:=0;
    gauge1.visible:=true;
  end;
  while (not clAux.eof) do
  begin
    Writeln (arq, form_nz   (clAux.result('TR_LOJ1'),2)   +';'+
      form_n    (clAux.result('TR_NUME'),10)  +';'+
      form_data (clAux.result('TR_DATA'))     +';'+
      form_nz   (clAux.result('TR_LOJ2'),2)   +';'+
      form_t    (clAux.result('TR_STAT'),1)   +';'+
      form_t    (clAux.result('TR_ENVI'),1)   +';'+
      form_t    (clAux.result('TR_ONLI'),1)   +';'+
      form_t    (clAux.result('TR_TIPZ'),1)   +';');
          {--->}
    Application.ProcessMessages;
    clAux.next;
    indGauge:=indGauge+1;
    if (chProgresso.checked) then
    begin
      gauge1.progress:=Round((indGauge/TotGauge)*100);
      gauge1.refresh;
    end;
  end;
  gauge1.visible:=false;
  memoTarefas.lines.Add('  '+inttostr(seq)+'. '+form_tc2('TRANSFERENCIAS',23,'.')+': '+form_n(totGauge,10)+' registro(s) copiado(s). ');
  CloseFile  (arq);
end;

procedure Tfrm_ExportaRetaguarda.ExportaItensTransferencias(seq: Integer);
var
  clAux: TClassAuxiliar;
  arq: textfile;
  indGauge,totGauge: Integer;
begin
  SetCurrentDir(Pchar(y_pathlocal));
  AssignFile (arq, 'ITTRANSF.'+form_nz(frm_principal.x_loja,3));
  ReWrite    (arq);
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT ITENS_TRANSF_LOJA.*                              ');
  clAux.AddParam ('FROM TRANSF_LOJA,ITENS_TRANSF_LOJA                      ');
  clAux.AddParam ('WHERE ((TR_LOJ1=:loja AND TR_STAT=:stat) OR         ');
  clAux.AddParam ('      (TR_LOJ2=:loja AND TR_STAT=:stat1)) AND       ');
  clAux.AddParam ('       (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME)          ');
  clAux.AddParam ('AND ((IT_DIGI>=:data1 AND IT_DIGI<=:data2) OR      ');
  clAux.AddParam ('     (IT_EMBA>=:data1 AND IT_EMBA<=:data2) OR      ');
  clAux.AddParam ('     (IT_CHEG>=:data1 AND IT_CHEG<=:data2))        ');
  clAux.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('stat').AsString := '1';
  clAux.consulta.parambyname('stat1').AsString := '2';
  clAux.consulta.parambyname('data1').AsDateTime := edtData1.GetValor;
  clAux.consulta.parambyname('data2').AsDateTime := edtData2.GetValor;
  clAux.Execute;
  clAux.first;
  indGauge:=0;
  totGauge:=clAux.reccount;
  if (chProgresso.checked) then
  begin
    gauge1.progress:=0;
    gauge1.visible:=true;
  end;
  while (not clAux.eof) do
  begin
    Writeln (arq, form_nz   (clAux.result('IT_LOJ1'),2)   +';'+
      form_n    (clAux.result('IT_TRAN'),10)  +';'+
      form_t    (clAux.result('IT_TIPZ'),1)   +';'+
      form_nz   (clAux.result('IT_GRUP'),2)   +';'+
      form_nz   (clAux.result('IT_SUBG'),2)   +';'+
      form_nz   (clAux.result('IT_PROD'),4)   +';'+
      form_nz   (clAux.result('IT_CORE'),4)   +';'+
      form_n    (clAux.result('IT_OTAM'),5)   +';'+
      form_t    (clAux.result('IT_TAMA'),5)   +';'+
      form_n    (clAux.result('IT_QTDS'),5)   +';'+
      form_n    (clAux.result('IT_QTDE'),5)   +';'+
      form_n    (clAux.result('IT_MOV1'),10)  +';'+
      form_n    (clAux.result('IT_MOV2'),10)  +';'+
      form_data (clAux.result('IT_DIGI'))     +';'+
      form_data (clAux.result('IT_EMBA'))     +';'+
      form_data (clAux.result('IT_CHEG'))     +';'+
      form_t    (clAux.result('IT_STAT'),1)   +';'+
      formatdatetime('dd/mm/yyyy hh:nn:ss',clAux.result('IT_HORA'))+';');
          {--->}
    Application.ProcessMessages;
    clAux.next;
    indGauge:=indGauge+1;
    if (chProgresso.checked) then
    begin
      gauge1.progress:=Round((indGauge/TotGauge)*100);
      gauge1.refresh;
    end;
  end;
  gauge1.visible:=false;
  memoTarefas.lines.Add('  '+inttostr(seq)+'. '+form_tc2('ITENS. TRANSFERENCIAS',23,'.')+': '+form_n(totGauge,10)+' registro(s) copiado(s). ');
  CloseFile  (arq);
end;

procedure Tfrm_ExportaRetaguarda.ExportaValesMerc(seq: Integer);
var
  clAux: TClassAuxiliar;
  arq: textfile;
  indGauge,totGauge: Integer;
begin
  SetCurrentDir(Pchar(y_pathlocal));
  AssignFile (arq, 'VALEMER.'+form_nz(frm_principal.x_loja,3));
  ReWrite    (arq);
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('select vm_loja,vm_caix,vm_vend,vm_orde,vm_valo,vm_cfun,vm_npar,vm_nume   ');
  clAux.AddParam ('from VALES_MERC,VENDAS                                                   ');
  clAux.AddParam ('where (vm_loja=ve_loja) and (vm_caix=ve_caix) and (vm_vend=ve_codi) and  ');
  clAux.AddParam ('(VE_DATA>=:data1 AND VE_DATA<=:data2) and (vm_loja=:loja)                ');
  clAux.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('data1').AsDateTime := edtData1.GetValor;
  clAux.consulta.parambyname('data2').AsDateTime := edtData2.GetValor;
  clAux.Execute;
  clAux.first;
  indGauge:=0;
  totGauge:=clAux.reccount;
  if (chProgresso.checked) then
  begin
    gauge1.progress:=0;
    gauge1.visible:=true;
  end;
  while (not clAux.eof) do
  begin
    Writeln (arq, form_nz   (clAux.result('VM_LOJA'),2)   +';'+
      form_n    (clAux.result('VM_CAIX'),8)   +';'+
      form_n    (clAux.result('VM_VEND'),8)   +';'+
      form_n    (clAux.result('VM_ORDE'),2)   +';'+
      form_nc   (clAux.result('VM_VALO'),10)  +';'+
      form_n    (clAux.result('VM_CFUN'),8)   +';'+
      form_n    (clAux.result('VM_NPAR'),2)   +';'+
      form_t    (clAux.result('VM_NUME'),20)  +';');
          {--->}
    Application.ProcessMessages;
    clAux.next;
    indGauge:=indGauge+1;
    if (chProgresso.checked) then
    begin
      gauge1.progress:=Round((indGauge/TotGauge)*100);
      gauge1.refresh;
    end;
  end;
  gauge1.visible:=false;
  memoTarefas.lines.Add('  '+inttostr(seq)+'. '+form_tc2('VALES_MERC',23,'.')+': '+form_n(totGauge,10)+' registro(s) copiado(s). ');
  CloseFile  (arq);
end;

procedure Tfrm_ExportaRetaguarda.rdTerminalClick(Sender: TObject);
begin
  if (rdTerminal.itemindex=0) then
  begin
    Label6.enabled:=false;
//          edtTerminal.text:='';
    edtTerminal.Color:=clBtnFace;
    edtTerminal.enabled:=false;
    BitBtnReenviar.Enabled:=false;
  end
  else
  if (rdTerminal.itemindex=1) then
  begin
    Label6.enabled:=true;
    edtTerminal.enabled:=true;
    edtTerminal.text:='';
    edtTerminal.Color:=clWhite;
    edtTerminal.setfocus;
    BitBtnReenviar.Enabled:=false;
  end
  else
  if (rdTerminal.itemindex=2) then
  begin
    Label6.enabled:=false;
//          edtTerminal.text:='';
    edtTerminal.Color:=clBtnFace;
    edtTerminal.enabled:=false;
//          edtTerminal.setfocus;
    BitBtnReenviar.Enabled:=true;
    BitBtnReenviar.SetFocus;
  end;
end;

procedure Tfrm_ExportaRetaguarda.btnEnviarFTPClick(Sender: TObject);
var
  finalizador: String;
begin
  pnMensagem.visible  := true;
  Label9.visible      := true;
     {**********************************************************************************************************************************}
  if (rdTerminal.itemindex=0) then //TODOS OS TERMINAIS
    finalizador := 'XX'
  else
    finalizador := form_nz(edtTerminal.GetValor,2);
     {**********************************************************************************************************************************}
  timerMensagem.enabled:=false;
  memoTarefas.lines.Add('');
  memoTarefas.lines.Add(' - Enviando arquivos via FTP - tentativa '+form_n(contFtp,2));
  EnviarFTP(Pchar(y_pathlocal+'\VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP'),
    Pchar('VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP'));
  timerMensagem.enabled:=true;
end;

procedure Tfrm_ExportaRetaguarda.btnVoltar4Click(Sender: TObject);
begin
  pg1.activepage:=pagina3;
  pnLogo.visible:=true;
  edtData1.setfocus;
end;

procedure Tfrm_ExportaRetaguarda.btnVoltar3Click(Sender: TObject);
begin
  pg1.activepage:=pagina2;
end;

procedure Tfrm_ExportaRetaguarda.btnVoltar2Click(Sender: TObject);
begin
  pg1.activepage:=pagina1;
end;

procedure Tfrm_ExportaRetaguarda.btnAvancar2Click(Sender: TObject);
begin
  pg1.activepage:=pagina3;
//     edtData1.setfocus;gin
 
end;

procedure Tfrm_ExportaRetaguarda.btnAvancar3Click(Sender: TObject);
begin
  if (edtData1.getValor=strtodate('01/01/1900')) then
    ExibeCritica ('Informe a data inicial do per�odo de exporta��o!','Exporta��o',edtData1)
  else
  if (edtData2.getValor=strtodate('01/01/1900')) then
    ExibeCritica ('Informe a data final do per�odo de exporta��o!','Exporta��o',edtData2)
  else
  if (Application.MessageBox('Confirma o in�cio da exporta��o do movimento?','',4+32)=6) then
  begin
    pg1.activepage        := pagina4;
    pnLogo.visible        := false;
    BitbtnCompactar.enabled  := false;
    BitbtnEnviaFTP.enabled  := false;
    Label9.visible        := false;
    pnMensagem.visible    := false;
    TimerMensagem.enabled := false;
    MemoTarefas.lines.clear;
    MemoErros.lines.clear;
    ExportarMovimento; {*}
    BitbtnCompactar.enabled := true;
    BitbtnEnviaFTP.enabled := true;

    if (Application.MessageBox('Compactar arquivos?','',4+32)=6) then
      BitbtnCompactar.click
    else
    begin
      memoErros.lines.Add('');
      memoErros.lines.Add('                - EXPORTA��O N�O CONCLU�DA -');
      memoErros.lines.Add('');
      memoErros.lines.Add('   Status...: Os arquivos processados n�o foram COMPACTADOS, clique em "COMPACTAR" e tente enviar novamente!');
      EXPORTACAO_SUCESSO := false;
      TimerMensagem.enabled := true;
    end;
  end;
end;


procedure Tfrm_ExportaRetaguarda.btnCompactarClick(Sender: TObject);
var
  arq: textfile;
  codloja : string;
  Arquivo : String;
  Extensao: String;
begin
  codloja := form_nz(frm_principal.x_loja,2);
  Arquivo := 'C:\NATIVA\VENDAS\MOVIMENTO\VEND'+form_nz(frm_principal.x_loja,2)+'XX.ZIP';
  Extensao:= '*.0' + codloja;

  ComprimirArquivos('C:\NATIVA\VENDAS\MOVIMENTO\VEND'+form_nz(frm_principal.x_loja,2)+'XX.ZIP', Extensao);
  executaCompactaBat(Extensao, 'VEND'+form_nz(frm_principal.x_loja,2)+'XX.ZIP');
  MessageDlg('Arquivos compactados com sucesso!', mtInformation, [mbOK], 0);

end;

procedure Tfrm_ExportaRetaguarda.CompressFiles(Arquivos: TStrings; const Compactado: String);
var
  InFile, OutFile, TmpFile: TFileStream;
  Compr: TCompressionStream;
  I, L: Integer;
  S: String;
  APath: array[0..255] of Char;
begin
  if Arquivos.Count > 0 then
  begin
    // Cria o arquivo de sa�da, ser� nosso compactado
    OutFile := TFileStream.Create(Compactado, fmCreate);
    try
      { Grava o n�mero de arquivos }
      L := Arquivos.Count;
      OutFile.Write(L,SizeOf(L));
      for I := 0 to Arquivos.Count-1 do
      begin

        Label1.Caption := 'Comprimindo: '+IntToStr(I+1)+' de '+IntToStr(Arquivos.Count);
        InFile := TFileStream.Create(Arquivos[I], fmOpenRead or fmShareDenyNone);
        if inFile.Size > 0 then
        begin
        try
          { Grava o nome do arquivo a compactar }

          S := ExtractFilename(Arquivos[I]);
          L := Length(S);

          OutFile.Write(L,SizeOf(L));
          OutFile.Write(S[1],L);
          { Grava o tamanho do arquivo a compactar }
          L := InFile.Size;
          OutFile.Write(L,SizeOf(L));
          { Pega a pasta tempor�ria do Windows }
          APath := #0;
          GetTempPath(256, APath);
          { Comprime o arquivo em um outro tempor�rio }
          TmpFile := TFileStream.Create(Trim(APath)+'tmpZLib',fmCreate);
          //Compr := TCompressionStream.Create(clMax, TmpFile); // clMax � compress�o M�xima
          Compr.OnProgress := CompressionProgress; // Atribui o evento para sabermos se a compress�o est� em andamento
          try
            Compr.CopyFrom(InFile,L); // Efetua a compress�o do arquivo
          finally
            Compr.Free;
            TmpFile.Free;
          end;
          { Copia o arquivo comprimido tempor�rio para o nosso arquivo de sa�da }
          TmpFile := TFileStream.Create(Trim(APath)+'tmpZLib',fmOpenRead or fmShareDenyNone);
          try
            OutFile.CopyFrom(TmpFile,0);
          finally
            TmpFile.Free;
          end;

        finally
          InFile.Free;

        end;
        end;
      end;
      Label1.Caption := '';
      Lbl1.Caption := '';
    finally
      OutFile.Free;
    end;
    DeleteFile(Trim(APath)+'tmpZLib'); // Remove o arquivo tempor�rio
  end;
end;
procedure Tfrm_ExportaRetaguarda.CompressionProgress(Sender: TObject);
begin
  Lbl1.Caption := 'Leitura Atual: '+IntToStr((Sender as TCompressionStream).Position) +
                    ' / Taxa de Compress�o: ' + CurrToStrF(100 - (Sender as TCompressionStream).CompressionRate, ffNumber, 2);
  // Processa as mensagens do Windows na aplica��o para evitar o estado "N�o respondendo"
  Application.ProcessMessages;
end;


procedure Tfrm_ExportaRetaguarda.btnAvancar1Click(Sender: TObject);
begin
  pg1.activepage:=pagina2;
end;

procedure Tfrm_ExportaRetaguarda.btnFechar1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExportaRetaguarda.btnFechar2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExportaRetaguarda.btnFechar3Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExportaRetaguarda.btnFechar4Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExportaRetaguarda.ExportaFechamentoDoCaixa(seq: Integer);
var
  clAux: TClassAuxiliar;
  arq: textfile;
  indGauge,totGauge: Integer;
begin
  SetCurrentDir(Pchar(y_pathlocal));
  AssignFile (arq, 'ENCERRAM.'+form_nz(frm_principal.x_loja,3));
  ReWrite    (arq);
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT * FROM CAIXAS_ENCERRAMENTO                         ');
  clAux.AddParam ('WHERE (FC_DATA>=:data1) AND (FC_DATA<=:data2)             ');
  if (rdTerminal.itemindex=1) then
    clAux.AddParam ('   AND (FC_CAIX='+floattostr(edtTerminal.GetValor)+')  ');
  clAux.consulta.parambyname('data1').AsDateTime := edtData1.GetValor;
  clAux.consulta.parambyname('data2').AsDateTime := edtData2.GetValor;
  clAux.Execute;
  clAux.first;
  indGauge:=0;
  totGauge:=clAux.reccount;
  if (chProgresso.checked) then
  begin
    gauge1.progress:=0;
    gauge1.visible:=true;
  end;
  while (not clAux.eof) do
  begin
    Writeln (arq, form_nz   (clAux.result('FC_LOJA'),2)    +';'+
      form_nz   (clAux.result('FC_CAIX'),10)   +';'+
      form_nz   (clAux.result('FC_FUNC'),6)    +';'+
      form_data (clAux.result('FC_DATA'))      +';'+
      form_n    (clAux.result('FC_QATD'),5)    +';'+
      form_nc   (clAux.result('FC_TATD'),15)   +';'+
      form_nc   (clAux.result('FC_TROC1'),15)  +';'+
      form_nc   (clAux.result('FC_DINH1'),15)  +';'+
      form_nc   (clAux.result('FC_CCRE1'),15)  +';'+
      form_nc   (clAux.result('FC_CDEB1'),15)  +';'+
      form_nc   (clAux.result('FC_CHEQ1'),15)  +';'+
      form_nc   (clAux.result('FC_CRED1'),15)  +';'+
      form_nc   (clAux.result('FC_TROV1'),15)  +';'+
      form_nc   (clAux.result('FC_VALR1'),15)  +';'+
      form_nc   (clAux.result('FC_TOTA1'),15)  +';'+
      form_nc   (clAux.result('FC_TROC2'),15)  +';'+
      form_nc   (clAux.result('FC_DINH2'),15)  +';'+
      form_nc   (clAux.result('FC_CCRE2'),15)  +';'+
      form_nc   (clAux.result('FC_CDEB2'),15)  +';'+
      form_nc   (clAux.result('FC_CHEQ2'),15)  +';'+
      form_nc   (clAux.result('FC_CRED2'),15)  +';'+
      form_nc   (clAux.result('FC_TROV2'),15)  +';'+
      form_nc   (clAux.result('FC_VALR2'),15)  +';'+
      form_nc   (clAux.result('FC_TOTA2'),15));


          {--->}
    Application.ProcessMessages;
    clAux.next;
    indGauge:=indGauge+1;
    if (chProgresso.checked) then
    begin
      gauge1.progress:=Round((indGauge/TotGauge)*100);
      gauge1.refresh;
    end;
  end;
  gauge1.visible:=false;
  memoTarefas.lines.Add('  '+inttostr(seq)+'. '+form_tc2('ENCERRAMENTO CAIXAS',23,'.')+': '+form_n(totGauge,10)+' registro(s) copiado(s). ');
  CloseFile  (arq);
end;

procedure Tfrm_ExportaRetaguarda.BitBtnAvancarClick(Sender: TObject);
begin
  pg1.activepage:=pagina2;
end;

procedure Tfrm_ExportaRetaguarda.BitBtnVoltar2Click(Sender: TObject);
begin
  pg1.activepage:=pagina1;
end;

procedure Tfrm_ExportaRetaguarda.BitBtnAvancar3Click(Sender: TObject);
begin
  if (edtData1.getValor=strtodate('01/01/1900')) then
    ExibeCritica ('Informe a data inicial do per�odo de exporta��o!','Exporta��o',edtData1)
  else
  if (edtData2.getValor=strtodate('01/01/1900')) then
    ExibeCritica ('Informe a data final do per�odo de exporta��o!','Exporta��o',edtData2)
  else
  if (Application.MessageBox('Confirma o in�cio da exporta��o do movimento?','',4+32)=6) then
  begin
    pg1.activepage        := pagina4;
    pnLogo.visible        := false;
    BitbtnCompactar.enabled  := false;
    BitbtnEnviaFTP.enabled  := false;
    Label9.visible        := false;
    pnMensagem.visible    := false;
    TimerMensagem.enabled := false;
    MemoTarefas.lines.clear;
    MemoErros.lines.clear;
    ExportarMovimento; {*}
    BitbtnCompactar.enabled := true;
    BitbtnEnviaFTP.enabled := true;

    if (Application.MessageBox('Deseja compactar os arquivos?','',4+32)=6) then
      BitbtnCompactar.click
    else
    begin
      memoErros.lines.Add('');
      memoErros.lines.Add('                - EXPORTA��O N�O CONCLU�DA -');
      memoErros.lines.Add('');
      memoErros.lines.Add('   Status...: Os arquivos processados n�o foram COMPACTADOS, clique em "COMPACTAR" e tente enviar novamente!');
      EXPORTACAO_SUCESSO := false;
      TimerMensagem.enabled := true;
    end;
  end;
end;


procedure Tfrm_ExportaRetaguarda.BitBtnVoltar3Click(Sender: TObject);
begin
  pg1.activepage:=pagina2;
end;

procedure Tfrm_ExportaRetaguarda.BitBtnAvancar2Click(Sender: TObject);
begin
  pg1.activepage:=pagina3;
     //edtData1.setfocus;gin
end;

procedure Tfrm_ExportaRetaguarda.BitBtnVoltar4Click(Sender: TObject);
begin
  pg1.activepage:=pagina3;
  pnLogo.visible:=true;
  edtData1.setfocus;
end;

procedure Tfrm_ExportaRetaguarda.BitBtnCompactarClick(Sender: TObject);
var
  arq: textfile;
  codloja : string;
  Arquivo : String;
  Extensao: String;
begin
  CompactarArquivo;
      {
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\ADVD.'    +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\ENCERRAM.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VENDAS.'  +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VENDAEXC.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\ITVENDAS.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VENDASFP.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VENDASAT.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\CARTOES.' +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\CARTPARC.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\CHEQUES.' +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\CRED.'    +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VALREC.'  +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VALEMIT.' +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\LANCAIXE.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\LANCAIX.' +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\TIPOEXPO.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VALEMERC.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\ITVALEME.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\ATDO.'    +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\ITATDO.'  +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\TRANSF.'  +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\ITTRANSF.'+form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\SANG.'    +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\CAIX.'    +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\CHQD.'    +form_nz(frm_principal.x_loja,3));
      OpenDialog1.Files.Add('C:\Nativa\VENDAS\MOVIMENTO\VALEMER.' +form_nz(frm_principal.x_loja,3));
      }

    codloja := form_nz(frm_principal.x_loja,2);
    Arquivo := 'C:\NATIVA\VENDAS\MOVIMENTO\VEND'+form_nz(frm_principal.x_loja,2)+'XX.ZIP';
    Extensao:= '*.0' + codloja;

  //  CompressFiles(OpenDialog1.Files,'C:\Nativa\VENDAS\MOVIMENTO\VEND'+form_nz(frm_principal.x_loja,2)+'XX.ZIP');
//    ComprimirArquivos('C:\NATIVA\VENDAS\MOVIMENTO\VEND'+form_nz(frm_principal.x_loja,2)+'XX.ZIP', Extensao);
    executaCompactaBat(Extensao, 'VEND'+form_nz(frm_principal.x_loja,2)+'XX.ZIP');

    MessageDlg('Arquivos compactados com sucesso!', mtInformation, [mbOK], 0);

end;

procedure Tfrm_ExportaRetaguarda.BitBtnEnviaFTPClick(Sender: TObject);
var
  finalizador: String;
begin
  pnMensagem.visible := true;
  Label9.visible     := true;
  {**********************************************************************************************************************************}
  if (rdTerminal.ItemIndex = 0) or (rdTerminal.ItemIndex = 2) then //TODOS OS TERMINAIS
    finalizador := 'XX'
  else
    finalizador := form_nz(edtTerminal.GetValor,2);
  {**********************************************************************************************************************************}
  timerMensagem.Enabled := false;
  memoTarefas.lines.Add('');
  memoTarefas.lines.Add(' - Enviando arquivos via FTP - tentativa '+form_n(contFtp,2));
  EnviarFTP(Pchar(y_pathlocal+'\VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP'),
    Pchar('VEND'+form_nz(frm_principal.x_loja,2)+finalizador+'.ZIP'));
  if (frm_ExportaFTP.DEU_CERTO) then
  begin
    EXPORTACAO_SUCESSO := true;
    pnMensagem.Visible := true;
  end
  else
  begin
    EXPORTACAO_SUCESSO := false;
    pnMensagem.Visible := true;
  end;
  timerMensagem.enabled := true;
end;

procedure Tfrm_ExportaRetaguarda.FormShow(Sender: TObject);
begin
  BitBtnReenviar.Enabled :=false;
end;

procedure Tfrm_ExportaRetaguarda.executaCompactaBat(ExtArquivo,
  nomeArquivo: String);
var
  arq: textfile;
  result: Integer;
begin
    SetCurrentDir('C:\NATIVA\VENDAS\MOVIMENTO');
    AssignFile (arq, 'COMPACTA.BAT');
    ReWrite    (arq);
    WriteLn    (arq, 'DEL ' + ExtArquivo);
    CloseFile  (arq);
    result := winexec ('C:\NATIVA\VENDAS\MOVIMENTO\COMPACTA.BAT',1);
    if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
    begin
      showmessage('Erro ao compactar arquivos !');
      EXPORTACAO_SUCESSO := false;
    end
    else
    begin
      EXPORTACAO_SUCESSO := true;
      while (not FileExists
          ('C:\NATIVA\VENDAS\MOVIMENTO\' + nomeArquivo)) do
      ;
    end;
end;

procedure Tfrm_ExportaRetaguarda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_ExportaRetaguarda.ComprimirArquivos(const NomeArquivo: String; const Extensao: String);
// var
  // zip : TZipForge;
begin
{    zip := TZipForge.Create(nil);
    try
      with zip do
        begin
          // Set the name of the archive file we want to create
          FileName := NomeArquivo;
          // Because we create a new archive,
          // we set Mode to fmCreate
          OpenArchive(fmCreate);
          // Set base (default) directory for all archive operations
          BaseDir := ExtractFilePath(NomeArquivo);
          // Add file C:\test.txt the archive; wildcards can be used as well
          AddFiles(Extensao);
          CloseArchive();
        end
    except
    on E: Exception do
      begin
        showmessage('Exception: ' + E.Message);
      end;
    end;
}
end;

end.