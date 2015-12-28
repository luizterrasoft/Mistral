{ATENCAO: Para que esta rotina funcione, devem estar corretamente configurados os 'objetos' relativos}
{         ao esquema de importacao/exportacao, p.ex:}
{         (1) Marcacao do campo ??_TIME nos registros - gravacao no proprio codigo do programa}
{         (2) Os 'triggers' de EXCLUSAO (nao pode haver de INCLUSAO/ALTERACAO)}
{         (3) O campo 'LOJA' da configuracao local, e a config. se vai trabalhar como MATRIZ ou LOJA}
{         (4) Os campos dos arquivos de MOVIMENTO_?????}
{         (5) A data do sistema (no caso, do computador)}

{Conteudo da informacao de exportacao:
 EXPORTA CLIENTES, CONTRATOS E PRESTACOES MOVIMENTADAS E QUE ENTRARAM NO PERIODO,
 EXPORTA CHEQUES MOVIMENTADOS E QUE VENCEM NO PERIODO
 EXPORTA PAGAMENTOS EFETUADOS NO PERIODO (SEGUIDOS DOS CLIENTES, CONTRATOS DESTES PAGAMENTOS)}

{ATENCAO: - A LOJA NAO EXPORTA 'EXCLUSOES', NAO EXPORTA ALTERACAO DE DADOS CADASTRAIS DE CLIENTE}
{           SEM QUE HAJA UM CONTRATO/PRESTACAO NO DIA - Somente a MATRIZ (Escritorio) pode faze-lo}

{ATENCAO: - 'POLITICA' PARA O CHEQUES AINDA NAO DEFINIDA}

unit un_Exportacao_Trigger;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ExtCtrls, Menus, Gauges, Db, Grids, DBGrids,
  DBTables, FileCtrl,funcoesglobais, SHELLAPI;

type
  Tfrm_ExportaTrigger = class(TForm)
    gbDatas: TGroupBox;
    Panel3: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Limparformulario1: TMenuItem;
    pnGauge1: TPanel;
    Gauge1: TGauge;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    pnLoja: TPanel;
    rdModelo: TRadioGroup;
    qTeste: TQuery;
    pnFracasso: TPanel;
    pnSucesso: TPanel;
    timerMensagem: TTimer;
    N2: TMenuItem;
    Label1: TLabel;
    pnDatas: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Panel1: TPanel;
    Verificararquivosenviadosanteriormente1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Exportar1: TMenuItem;
    chExclusao: TCheckBox;
    chPagamentos: TCheckBox;
    chCheques: TCheckBox;
    Removerarquivodemovimentoanterior1: TMenuItem;
    N3: TMenuItem;
    Compactararquivos1: TMenuItem;
    chExportaSoLoja: TCheckBox;
    Panel2: TPanel;
    UltImp: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    UltExp: TLabel;
    Query1: TQuery;
    SpeedButton1: TSpeedButton;
    BitBtnExportar: TBitBtn;
    BitBtnCompactar: TBitBtn;
    BitBtnEnviarFTP: TBitBtn;
    BitBtnEmail: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure timerMensagemTimer(Sender: TObject);
    procedure btnRetryFTPClick(Sender: TObject);
    procedure edtData1Enter(Sender: TObject);
    procedure edtData2Enter(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulario1Click(Sender: TObject);
    procedure Verificararquivosenviadosanteriormente1Click(
      Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure btnExportaClick(Sender: TObject);
    procedure Removerarquivodemovimentoanterior1Click(Sender: TObject);
    procedure Compactararquivos1Click(Sender: TObject);
    procedure btnCompactarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtnEnviarFTPClick(Sender: TObject);
    procedure BitBtnExportarClick(Sender: TObject);
    procedure BitBtnCompactarClick(Sender: TObject);
    procedure BitBtnEmailClick(Sender: TObject);
  private
    procedure refreshpanel2;
    { Private declarations }
  public
    { Public declarations }
    pathCompactadores: String;
    pathCompactadoresDOS: String;
    unidadeCompactadores: String;
    data1,data2: String;
    n_data1,n_data2: TDateTime;
    contFtp: Integer;
    EXPORTACAO_SUCESSO: Boolean;
    procedure CompactarArquivo;
    procedure EnviarFTP (oArquivo,dArquivo: String);
  end;

var
  frm_ExportaTrigger: Tfrm_ExportaTrigger;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar, unDialogo, DM3,
  un_Exportacao_FTP, Un_ConsImpExp;

procedure Tfrm_ExportaTrigger.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ExportaTrigger.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExportaTrigger.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if key = vk_f8 then
    SpeedButton1.onClick(sender);
end;

{Rotina de geracao de arquivo para exportacao de movimento para sistema
 localizado em outra loja --- sem link dedicado > }
procedure Tfrm_ExportaTrigger.FormCreate(Sender: TObject);
var
  clAux: TClassAuxiliar;
  linha: String;
begin
     {***}
  pathCompactadores    := UpperCase(frm_principal.x_pathsystem);
  pathCompactadoresDOS := pathCompactadores;
  if (Pos('ARQUIVOS DE PROGRAMAS',pathCompactadores)<>0) then
  begin
    unidadeCompactadores := Copy(pathCompactadores,1,1);
    pathCompactadoresDOS := unidadeCompactadores+':\ARQUIV~1\NATIVA\CREDITO';
  end;
  if (not DirectoryExists('C:\NATIVA\CREDITO\MOVIMENTO')) then
  begin
    CreateDir('C:\NATIVA');
    CreateDir('C:\NATIVA\CREDITO');
    CreateDir('C:\NATIVA\MOVIMENTO');
  end;

     {***}
  contFtp := 1;
  EXPORTACAO_SUCESSO := false;
  if (frm_principal.x_tipo_exportacao=1) then
  begin
    BitBtnEmail.visible:=false;
    BitBtnEnviarFTP.visible:=true;
  end
  else
  if (frm_principal.x_tipo_exportacao=0) then
  begin
    BitBtnEmail.visible:=true;
    BitBtnEnviarFTP.visible:=false;
  end;

     {***}
  rdModelo.itemindex := frm_principal.x_tipo_loja;
  rdModelo.enabled   := false;
  pnLoja.caption     := form_nz(frm_principal.x_frente_loja,2)+'/'+
    ProcuraNomeLoja(frm_principal.x_frente_loja,self);
  if (rdModelo.itemindex=0) then
  begin
    Label9.visible := true;
    pnLoja.visible := true;
    chExportaSoLoja.checked:=false;
    chExportaSoLoja.enabled:=true;
  end
  else
  begin
    Label9.visible := false;
    pnLoja.visible := false;
    chExportaSoLoja.checked:=false;
    chExportaSoLoja.enabled:=false;
  end;

     {Configuracoes de email para matriz ***}
  if (rdModelo.itemindex=0) then

    chExclusao.checked  := false//Mailto1.MailSubject := 'Movimento da loja '+
//form_nz(frm_principal.x_frente_loja,2)+' até o dia '+form_data(frm_principal.x_data_trabalho);
//Mailto1.MailAddress := frm_principal.x_email_publicador;

  else
  begin
         //Mailto1.MailSubject := 'Movimento da matriz até o dia '+form_data(frm_principal.x_data_trabalho);
    clAux:=TClassAuxiliar.Create;
    clAux.conect ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('Select LO_EMAI From CRELOJA');
    clAux.Execute;
    linha:='';
    clAux.first;
    linha:=clAux.result('LO_EMAI');
    clAux.next;
    while (not clAux.eof) do
    begin
      linha:=linha+';'+clAux.result('LO_EMAI');
      clAux.next;
    end;
    clAux.desconect;
    clAux.Free;
         //Mailto1.MailAddress := linha;
  end;
  refreshpanel2;
end;

{Chamando automaticamente o WINZIP para compactar arquivos ***}
{Para o caso de envio via FTP...tambem envia o arquivo compactado}
procedure Tfrm_ExportaTrigger.CompactarArquivo;
var
  arq: textfile;
  result: Integer;
  codloja,data,hora: String;
begin
  if (rdModelo.itemindex=0) then
  begin
        {*** - Reescrevendo o programa de lote compacto}
    data := form_data(frm_principal.x_data_trabalho);
    while (Pos('/',data)>0) do
      Delete (data,Pos('/',data),1);
    hora := timetostr(time);
    while (Pos(':',hora)>0) do
      Delete (hora,Pos(':',hora),1);
    codloja := form_nz(frm_principal.x_frente_loja,2);
    SetCurrentDir('C:\NATIVA\CREDITO\MOVIMENTO');
    AssignFile (arq, 'COMPACTA.BAT');
    ReWrite    (arq);
    WriteLn    (arq, pathCompactadoresDOS+'\PKZIP LOJA'+codloja+'.ZIP *.L'+codloja);
    WriteLn    (arq, 'COPY LOJA'+codloja+'.ZIP LJ'+codloja+'_'+data+'_'+hora+'.BAK');
    WriteLn    (arq, 'DEL *.L'+codloja);
    CloseFile  (arq);
    Memo1.lines.Add('');
    Memo1.lines.Add(' - Compactação dos arquivos-');
    result := winexec ('C:\NATIVA\CREDITO\MOVIMENTO\COMPACTA.BAT',1);
    if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
    begin
      showmessage('Não foi possível compactar os arquivos usando o programa PKZIP.EXE. Tente compactar os arquivos através de outro programa!');
      Memo1.lines.Add('   Status...: ERRO!!!');
      EXPORTACAO_SUCESSO := false;
    end
    else
    begin
      EXPORTACAO_SUCESSO := true;
      while (not FileExists
          (Pchar('C:\NATIVA\CREDITO\MOVIMENTO\LOJA'+codloja+'.ZIP'))) do
      ;
      Memo1.lines.Add('   Status...: OK');
    end;
  end
  else
  if (rdModelo.itemindex=1) then
  begin
        {*** - Reescrevendo o programa de lote compacto}
    data := form_data(frm_principal.x_data_trabalho);
    while (Pos('/',data)>0) do
      Delete (data,Pos('/',data),1);
    hora := timetostr(time);
    while (Pos(':',hora)>0) do
      Delete (hora,Pos(':',hora),1);
    codloja := form_nz(frm_principal.x_frente_loja,2);
    SetCurrentDir('C:\NATIVA\CREDITO\MOVIMENTO');
    AssignFile (arq, 'COMPACTA.BAT');
    ReWrite    (arq);
    WriteLn    (arq, pathCompactadoresDOS+'\PKZIP MATRIZ.ZIP *.MTZ');
    WriteLn    (arq, 'COPY MATRIZ.ZIP MTZ_'+data+'_'+hora+'.BAK');
    WriteLn    (arq, 'DEL *.MTZ');
    CloseFile  (arq);
    Memo1.lines.Add('');
    Memo1.lines.Add(' - Compactação dos arquivos-');
    result := winexec ('C:\NATIVA\CREDITO\MOVIMENTO\COMPACTA.BAT',1);
    if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
    begin
      showmessage('Não foi possível compactar os arquivos usando o programa PKZIP.EXE. Tente compactar os arquivos através de outro programa!');
      Memo1.lines.Add('   Status...: ERRO!!!');
      EXPORTACAO_SUCESSO := false;
    end
    else
    begin
      EXPORTACAO_SUCESSO := true;
      while (not FileExists
          (Pchar('C:\NATIVA\CREDITO\MOVIMENTO\MATRIZ.ZIP'))) do
      ;
      Memo1.lines.Add('   Status...: OK');
    end;
  end;
  if (frm_principal.x_tipo_exportacao=0) then
    timerMensagem.enabled:=true;
end;

{Controlador de mensagens}
procedure Tfrm_ExportaTrigger.timerMensagemTimer(Sender: TObject);
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

{Procedimento padrao de envio de arquivo via FTP}
procedure Tfrm_ExportaTrigger.EnviarFTP(oArquivo,dArquivo: String);
begin
  Application.CreateForm (Tfrm_ExportaFTP,frm_ExportaFTP);
  frm_ExportaFTP.flag:=false;
  frm_ExportaFTP.nome_arquivo:=oArquivo;
  frm_ExportaFTP.nome_arquivo_host:= dArquivo;
  frm_ExportaFTP.showmodal;
  if (frm_ExportaFTP.DEU_CERTO) then
  begin
    Memo1.lines.Add('   Status...: OK');
    EXPORTACAO_SUCESSO := true;
  end
  else
  begin
    Memo1.lines.Add('   Status...: ERRO!!! - Um erro ocorreu com a conexão de FTP!!! O arquivo não foi enviado -');
    EXPORTACAO_SUCESSO := false;
  end;
  frm_ExportaFTP.Free;
  contFtp := contFtp + 1;
end;

{Botao de tentar enviar FTP novamente}
procedure Tfrm_ExportaTrigger.btnRetryFTPClick(Sender: TObject);
var
  codloja: String;
begin
  timerMensagem.enabled:=false;
  if (rdModelo.itemindex=0) then
  begin
    Memo1.lines.Add('');
    Memo1.lines.Add(' - Enviando arquivos via FTP - tentativa '+form_n(contFtp,2));
    codloja := form_nz(frm_principal.x_frente_loja,2);
    EnviarFTP('C:\NATIVA\CREDITO\MOVIMENTO\LOJA'+codloja+'.ZIP',
      'LOJA'+codloja+'.ZIP');
  end
  else
  if (rdModelo.itemindex=1) then
  begin
    Memo1.lines.Add('');
    Memo1.lines.Add(' - Enviando arquivos via FTP - tentativa '+form_n(contFtp,2));
    EnviarFTP('C:\NATIVA\CREDITO\MOVIMENTO\MATRIZ.ZIP',
      'MATRIZ.ZIP');
  end;
  timerMensagem.enabled:=true;
end;

procedure Tfrm_ExportaTrigger.edtData1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ExportaTrigger.edtData2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ExportaTrigger.edtData1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtData2.setfocus;
  if (key=K_ESC) then;
end;

procedure Tfrm_ExportaTrigger.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    BitBtnExportar.click;
  if (key=K_CIMA) then
    edtData1.setfocus;
  if (key=K_ESC) then
    SAIR1.click;
end;

procedure Tfrm_ExportaTrigger.Limparformulario1Click(Sender: TObject);
begin
  edtData1.text       := '';
  edtData2.text       := '';
  pnSucesso.visible   := false;
  pnFracasso.visible  := false;
  Memo1.lines.clear;
  edtData1.setfocus;
end;

procedure Tfrm_ExportaTrigger.Verificararquivosenviadosanteriormente1Click(
  Sender: TObject);
begin
  OpenDialog1.Execute;
  if (rdModelo.itemindex=0) then
  begin
    CopyFile(Pchar(OpenDialog1.filename),Pchar('C:\NATIVA\CREDITO\MOVIMENTO\LOJA'+
      form_nz(frm_principal.x_frente_loja,2)+'.ZIP'),false);
    frmDialogo.ExibirMensagem ('Apenas envie o movimento pelo FTP agora!'
      ,'Movimento',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end
  else
  begin
    CopyFile(Pchar(OpenDialog1.filename),'C:\NATIVA\CREDITO\MOVIMENTO\MATRIZ.ZIP',false);
    frmDialogo.ExibirMensagem ('Apenas envie o movimento pelo FTP agora!'
      ,'Movimento',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end;
end;

procedure Tfrm_ExportaTrigger.FormActivate(Sender: TObject);
begin
  edtData1.setfocus;
end;

procedure Tfrm_ExportaTrigger.Exportar1Click(Sender: TObject);
var
  continua: Boolean;
  clAux,clAux2: TClassAuxiliar;
  arq: TextFile;
  Year,Month,Day: Word;
  totcheqdvpg1,totcheqdev1,totcheq1,totcheqpg1: Integer;
  totptr1,totcli1,totctr1: Integer;
  totptr2,totcli2,totctr2: Integer;
  i,totptr3,totcli3,totctr3: Integer;
  totcomp1,totcomp2: Integer;
  totobs1,totobs2: Integer;
  totrenegoc1,totrenegoc2: Integer;
  totcheqdvpg2,totcheqdev2,totcheq2,totcheqpg2: Integer;
  campo01,campo02,campo03,campo04,campo05,campo06,campo07,campo08,campo09,campo10: String;
  campo11,campo12,campo13,campo14,campo15,campo16,campo17,campo18,campo19,campo20: String;
  campo21,campo22,campo23,campo24,campo25,campo26,campo27,campo28,campo29,campo30: String;
  campo31,campo32,campo33,campo34,campo35,campo36,campo37,campo38,campo39,campo40: String;
  campo41,campo42,campo43,campo44,campo45,campo46,campo47,campo48,campo49,campo50: String;
  indGauge,totGauge: Integer;
  datamax: TDateTime;
  ind,tot: Real;
  data,hora,horaexp,dataexp,nome_user,nome_arq: String;
  vlog,codloja,arquivoZIP: String;
  sequencial_operacao: Integer;
  fLogExportacao:TLogExpImp;
  LinhaIni,LinhaFim:Integer;
begin
  {Verificando a existencia do PKZKIP.EXE }
  if (rdModelo.itemindex=0) then
  begin
    codloja := form_nz(frm_principal.x_frente_loja,2);
    arquivoZIP := 'LOJA'+codloja+'.ZIP';
  end
  else
    arquivoZIP := 'MATRIZ.ZIP';
  if (not FileExists(pathCompactadores+'\PKZIP.EXE')) then
  begin
    Memo1.lines.Add('   ERRO!!! - Arquivo '+pathCompactadores+'\PKZIP.EXE não encontrado!');
    Memo1.lines.Add('    - Este programa é necessário para a compactação e envio dos arquivos... - ');
    EXPORTACAO_SUCESSO := false;
    timerMensagem.enabled := true;
  end
  else
  if (frm_principal.x_tipo_exportacao=1) and (Trim(frm_principal.x_ftp_host)='') then
  begin
    Memo1.lines.Add('   ERRO!!! - O host de FTP não foi definido!');
    Memo1.lines.Add('    - Vá na opção de configuração local do sistema e configura corretamente o servidor de FTP... - ');
    EXPORTACAO_SUCESSO := false;
    timerMensagem.enabled := true;
  end
  else
  if (frm_principal.x_tipo_exportacao=1) and (Trim(frm_principal.x_ftp_userid)='') then
  begin
    Memo1.lines.Add('   ERRO!!! - O usuário de FTP não foi definido!');
    Memo1.lines.Add('    - Vá na opção de configuração local do sistema e configura corretamente o servidor de FTP... - ');
    EXPORTACAO_SUCESSO := false;
    timerMensagem.enabled := true;
  end
  else
  if (frm_principal.x_tipo_exportacao=1) and (Trim(frm_principal.x_ftp_password)='') then
  begin
    Memo1.lines.Add('   ERRO!!! - A senha do usuário de FTP não foi definida!');
    Memo1.lines.Add('    - Vá na opção de configuração local do sistema e configura corretamente o servidor de FTP... - ');
    EXPORTACAO_SUCESSO := false;
    timerMensagem.enabled := true;
  end
  else
  if (edtData1.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem ('Data inicial não pode ficar vazia!'
      ,'Movimento',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.setfocus;
  end
  else
  if (edtData1.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem ('Data final não pode ficar vazia!'
      ,'Movimento',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData2.setfocus;
  end
  else
  if (FileExists('C:\NATIVA\CREDITO\MOVIMENTO\'+arquivoZIP)) then
  begin
    Memo1.lines.clear;
    Memo1.lines.Add('   ERRO!!! - O movimento gerado anteriormente não foi enviado com êxito!');
    if (frm_principal.x_tipo_exportacao=0) then
    begin
      if (rdModelo.itemindex=0) then
      begin
        Memo1.lines.Add('    - Envie o arquivo C:\NATIVA\CREDITO\MOVIMENTO\'+arquivoZIP+' por e-mail para a matriz ');
        Memo1.lines.Add('    - Em seguida, apague este arquivo! - ');
      end
      else
      begin
        Memo1.lines.Add('    - Envie o arquivo C:\NATIVA\CREDITO\MOVIMENTO\'+arquivoZIP+' por e-mail para as filiais -');
        Memo1.lines.Add('    - Em seguida, apague este arquivo! - ');
      end;
    end
    else
      Memo1.lines.Add('    - Envie o movimento anterior pelo FTP! - ');
  end
  else
  begin
     {filtro - no caso de uso de datas}
    LinhaIni := -1;
    DecodeDate(strtodate(Trim(edtData1.text)),Year,Month,Day);
    data1  := form_nz(Year,4)+'-'+form_nz(Month,2)+'-'+form_nz(Day,2)+' 00:00:01';
    DecodeDate(strtodate(Trim(edtData2.text)),Year,Month,Day);
    data2  := form_nz(Year,4)+'-'+form_nz(Month,2)+'-'+form_nz(Day,2)+' 23:59:59';
    n_data1 := strtodate(Trim(edtData1.text));
    n_data2 := strtodate(Trim(edtData2.text));

    with FLogExportacao do
    begin
      ImpExp  := 'E';
      data    := Now();
      inicio  := N_data1;
      Fim     := N_data2;
      LojaOrg := frm_principal.x_frente_loja;
      LojaDest:= -1;
    end;
    
    {...}
    if (frmDialogo.ExibirMensagem ('Confirma exportação?'
      ,'Exportação de movimento',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      try
        timerMensagem.enabled := false;
        BitBtnExportar.enabled    := false;

          //MailTo1.enabled:=false;
        nome_user := 'NATIVA';

          {Verificando o diretorio do movimento}
        data := form_data(frm_principal.x_data_trabalho);
        hora := timetostr(time);
        if (not DirectoryExists('C:\NATIVA\CREDITO\MOVIMENTO')) then
          CreateDir ('C:\NATIVA\CREDITO\MOVIMENTO');
        memo1.lines.clear;
        memo1.lines.Add ('');
        memo1.lines.Add ('      Status da exportação - Data/Hora: '+data+' '+hora+'  Usuario: '+nome_user);
        memo1.lines.Add (' Tabela                      Regs   Nome do arquivo');
        memo1.lines.Add ('------------------------------------------------------------------------------');

          {** Excluindo os arquivos de movimento TXT}
        if (rdModelo.itemindex=0) then
        begin
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CLIOBS.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.L'+form_nz(frm_principal.x_frente_loja,2));
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.L'+form_nz(frm_principal.x_frente_loja,2));
        end
        else
        if (rdModelo.itemindex=1) then
        begin
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CLIOBS.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.MTZ');
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.MTZ');
        end;
        sequencial_operacao := 1;

          {1A. PARTE - Exportacao de todas as exclusoes registradas}
          {1 - Exportacao das exclusoes de contratos------------------------->}
        if (chExclusao.checked) and (rdModelo.itemindex=1) then {SOMENTE A MATRIZ PODE MANDAR EXCLUSAO}
        begin
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CRECTABR                       ');
          clAux.AddParam ('Where ((CR_TIME>=:data1 AND CR_TIME<=:data2) OR        ');
          clAux.AddParam ('       (CR_TIME>=:n_data1 AND CR_TIME<=:n_data2)) AND  ');
          clAux.AddParam ('       (CR_OPER='+chr(39)+'E'+chr(39)+')               ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CR_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CR_CLIE,CR_CODI                               ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exclusões de contratos...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totctr1 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CR_CLIE,CR_CODI  ');
            clAux2.AddParam ('From CRECTABR           ');
            clAux2.AddParam ('Where (CR_CLIE='+floattostr(clAux.result('CR_CLIE'))+') AND  ');
            clAux2.AddParam ('      (CR_CODI='+floattostr(clAux.result('CR_CODI'))+')      ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CR_CLIE'),6);
              campo02 := form_nz(clAux.result('CR_CODI'),6);
              campo03 := form_nz(clAux.result('CR_LOJA'),2);
              campo04 := form_t(clAux.result('CR_NOTA'),10);
              campo05 := form_t(clAux.result('CR_SERI'),2);
              campo06 := form_data(clAux.result('CR_DNOT'));
              campo07 := form_nz(clAux.result('CR_AVAL'),6);
              campo08 := form_nz(clAux.result('CR_PORT'),4);
              campo09 := form_nz(clAux.result('CR_TOTA')*100,15);
              campo10 := form_nz(clAux.result('CR_VENT')*100,15);
              campo11 := form_nz(clAux.result('CR_PLAN'),3);
              campo12 := form_nz(clAux.result('CR_QPRE'),2);
              campo13 := form_nz(clAux.result('CR_PDEV'),2);
              campo14 := form_nz(clAux.result('CR_FATO')*100,5);
              campo15 := form_t(clAux.result('CR_CARN'),1);
              campo16 := form_t(clAux.result('CR_FICH'),1);
              campo17 := form_nz(clAux.result('CR_VDEV')*100,15);
              campo18 := form_data(clAux.result('CR_DTRA'));
              campo19 := form_nz(clAux.result('CR_TOT2')*100,15);
              campo20 := form_t(clAux.result('CR_BOLE'),1);
              campo21 := form_t(clAux.result('CR_OBSE'),80);
              campo22 := form_data(clAux.result('CR_TIME'));
              campo23 := clAux.result('CR_OPER');
              campo24 := form_t(clAux.result('CR_QBOL'),1);
              WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19+campo20+
                campo21+campo22+campo23+campo24);
              totctr1 := totctr1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          LinhaIni :=  memo1.Lines.Count;
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Contratos....: '+form_n(totctr1,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'EXC CONTRATO';
            Reg             := totctr1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;

              {2.1. - Exportacao das exclusoes de clientes --------------------------->}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CRECLI                         ');
          clAux.AddParam ('Where ((CL_TIME>=:data1 AND CL_TIME<=:data2) OR        ');
          clAux.AddParam ('       (CL_TIME>=:n_data1 AND CL_TIME<=:n_data2)) AND  ');
          clAux.AddParam ('       (CL_OPER='+chr(39)+'E'+chr(39)+')               ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CL_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CL_CODI                                       ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exclusões de clientes...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcli1 := 0;
          pnGauge1.visible:=true;
          gauge1.visible:=true;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CL_CODI   ');
            clAux2.AddParam ('From CRECLI      ');
            clAux2.AddParam ('Where (CL_CODI='+floattostr(clAux.result('CL_CODI'))+')  ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CL_CODI'),6);
              campo02 := form_t(clAux.result('CL_NOME'),40);
              campo03 := form_t(clAux.result('CL_CPF'),14);
              campo04 := form_t(clAux.result('CL_ENDE'),50);
              campo05 := form_nz(clAux.result('CL_LOJA'),2);
              campo06 := form_t(clAux.result('CL_SEXO'),1);
              campo07 := form_t(clAux.result('CL_BAIR'),30);
              campo08 := form_t(clAux.result('CL_CIDA'),20);
              campo09 := form_t(clAux.result('CL_ESTA'),2);
              campo10 := form_t(clAux.result('CL_CEP'),8);
              campo11 := form_t(clAux.result('CL_FONE'),15);
              campo12 := form_t(clAux.result('CL_FAX'),15);
              campo13 := form_t(clAux.result('CL_CELU'),15);
              campo14 := form_data(clAux.result('CL_DTNA'));
              campo15 := form_t(clAux.result('CL_IDEN'),25);
              campo16 := form_t(clAux.result('CL_OEXP'),10);
              campo17 := form_t(clAux.result('CL_ECIV'),1);
              campo18 := form_t(clAux.result('CL_CONJ'),40);
              campo19 := form_t(clAux.result('CL_NPAI'),40);
              campo20 := form_t(clAux.result('CL_NMAE'),40);
              campo21 := form_t(clAux.result('CL_REF1'),40);
              campo22 := form_t(clAux.result('CL_TRF1'),15);
              campo23 := form_t(clAux.result('CL_REF2'),40);
              campo24 := form_t(clAux.result('CL_TRF2'),15);
              campo25 := form_t(clAux.result('CL_EMPR'),30);
              campo26 := form_t(clAux.result('CL_CARG'),20);
              campo27 := form_t(clAux.result('CL_EEMP'),50);
              campo28 := form_t(clAux.result('CL_FEMP'),15);
              campo29 := form_t(clAux.result('CL_REMP'),5);
              campo30 := form_data(clAux.result('CL_DADM'));
              campo31 := form_t(clAux.result('CL_CPRO'),20);
              campo32 := form_nz(clAux.result('CL_SALA')*100,10);
              campo33 := form_nz(clAux.result('CL_LIMC')*100,10);
              campo34 := form_t(clAux.result('CL_CFUN'),1);
              campo35 := form_t(clAux.result('CL_TPRO'),1);
              campo36 := form_t(clAux.result('CL_RSPC'),1);
              campo37 := form_data(clAux.result('CL_DSPC'));
              campo38 := form_data(clAux.result('CL_DREG'));
              campo39 := form_data(clAux.result('CL_VALI'));
              campo40 := form_data(clAux.result('CL_DTCA'));
              campo41 := form_data(clAux.result('CL_ULTC'));
              if (clAux.result('CL_QTDC')<0) then
                campo42 := form_nz(clAux.result('CL_QTDC')*(-100),5)
              else
                campo42 := form_nz(clAux.result('CL_QTDC')*100,5);
              campo43 := form_t(clAux.result('CL_OBSE'),50);
              campo44 := form_t(clAux.result('CL_ALTE'),1);
              campo45 := form_data(clAux.result('CL_DULP'));
              campo46 := form_t(clAux.result('CL_PDC'),4);
              campo47 := form_t(clAux.result('CL_EMAI'),80);
              campo48 := form_t(clAux.result('CL_LIVR'),4);
              campo49 := form_data(clAux.result('CL_TIME'));
              campo50 := clAux.result('CL_OPER');
              WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19+campo20+
                campo21+campo22+campo23+campo24+campo25+
                campo26+campo27+campo28+campo29+campo30+
                campo31+campo32+campo33+campo34+campo35+
                campo36+campo37+campo38+campo39+campo40+
                campo41+campo42+campo43+campo44+campo45+
                campo46+campo47+campo48+campo49+campo50);
              totcli1 := totcli1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Clientes.....: '+form_n(totcli1,10) +'   Arquivo.: '+nome_arq);
          with FLogExportacao do
          begin
            Tabela          := 'EXC CLIENTE';
            Reg             := totcli1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {3.1 - Exportacao de exclusoes prestacoes------------------------------->}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CREPRABR                         ');
          clAux.AddParam ('Where ((PC_TIME>=:data1 AND PC_TIME<=:data2) OR          ');
          clAux.AddParam ('       (PC_TIME>=:n_data1 AND PC_TIME<=:n_data2)) AND    ');
          clAux.AddParam ('       (PC_OPER='+chr(39)+'E'+chr(39)+')                 ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (PC_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by PC_CLIE,PC_CONT,PC_NPRE                         ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exclusões de prestações...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totptr1 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select PC_CLIE,PC_CONT   ');
            clAux2.AddParam ('From CREPRABR            ');
            clAux2.AddParam ('Where (PC_CLIE='+floattostr(clAux.result('PC_CLIE'))+')  AND ');
            clAux2.AddParam ('      (PC_CONT='+floattostr(clAux.result('PC_CONT'))+')  AND ');
            clAux2.AddParam ('      (PC_NPRE='+floattostr(clAux.result('PC_NPRE'))+')      ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('PC_NPRE'),2);
              campo02 := form_nz(clAux.result('PC_VALO')*100,15);
              campo03 := form_nz(clAux.result('PC_FATO')*100,5);
              campo04 := form_data(clAux.result('PC_DCON'));
              campo05 := form_data(clAux.result('PC_DVTO'));
              campo06 := form_data(clAux.result('PC_DTPG'));
              campo07 := form_nz(clAux.result('PC_LOJA'),2);
              campo08 := form_nz(clAux.result('PC_PORT'),4);
              campo09 := form_nz(clAux.result('PC_AVAL'),6);
              campo10 := form_nz(clAux.result('PC_PLAN'),3);
              campo11 := form_nz(clAux.result('PC_LJPG'),2);
              campo12 := form_nz(clAux.result('PC_VPAG')*100,15);
              campo13 := form_nz(clAux.result('PC_SALD')*100,5);
              campo14 := form_t(clAux.result('PC_STAT'),1);
              campo15 := form_nz(clAux.result('PC_CONT'),6);
              campo16 := form_nz(clAux.result('PC_CLIE'),6);
              campo17 := form_nz(clAux.result('PC_CHEQ'),10);
              campo18 := form_nz(clAux.result('PC_TPRE'),2);
              campo19 := form_data(clAux.result('PC_DTRA'));
              campo20 := form_t(clAux.result('PC_CCGC'),14);
              campo21 := form_nz(clAux.result('PC_BANC'),6);
              campo22 := form_t(clAux.result('PC_AGEN'),10);
              campo23 := form_nz(clAux.result('PC_NUME'),10);
              campo24 := form_nz(clAux.result('PC_FPGT'),2);
              campo25 := form_data(clAux.result('PC_TIME'));
              campo26 := clAux.result('PC_OPER');
              WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19+campo20+
                campo21+campo22+campo23+campo24+campo25+
                campo26);
              totptr1 := totptr1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Prestações...: '+form_n(totptr1,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'EXC PRESTACAO';
            Reg             := totptr1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {4.1 - Exportacao de exclusoes de cheques pre-datados----------------------------->}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CRECHMOV                         ');
          clAux.AddParam ('Where ((CH_TIME>=:data1 AND CH_TIME<=:data2) OR          ');
          clAux.AddParam ('       (CH_TIME>=:n_data1 AND CH_TIME<=:n_data2)) AND    ');
          clAux.AddParam ('       (CH_OPER='+chr(39)+'E'+chr(39)+')                 ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME                         ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exclusões de cheques...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheq1 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CH_CCGC,CH_BANC,CH_NUME  ');
            clAux2.AddParam ('From CRECHMOV                   ');
            clAux2.AddParam ('Where (CH_CCGC='+chr(39)+clAux.result('CH_CCGC')+chr(39)+')  AND ');
            clAux2.AddParam ('      (CH_BANC='+floattostr(clAux.result('CH_BANC'))+') AND      ');
            clAux2.AddParam ('      (CH_NUME='+floattostr(clAux.result('CH_NUME'))+')          ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CH_CODI'),6);
              campo02 := form_t(clAux.result('CH_CCGC'),14);
              campo03 := form_n(clAux.result('CH_BANC'),3);
              campo04 := form_n(clAux.result('CH_NUME'),7);
              campo05 := form_data(clAux.result('CH_DTCT'));
              campo06 := form_t(clAux.result('CH_NOME'),40);
              campo07 := form_t(clAux.result('CH_FONE'),15);
              campo08 := form_nz(clAux.result('CH_LOJA'),2);
              campo09 := form_data(clAux.result('CH_DVTO'));
              campo10 := form_nz(clAux.result('CH_PORT'),4);
              campo11 := form_t(clAux.result('CH_AGEN'),10);
              campo12 := form_data(clAux.result('CH_DTRA'));
              campo13 := form_nz(clAux.result('CH_TRAN'),4);
              campo14 := form_nz(clAux.result('CH_VALO')*100,15);
              campo15 := form_nz(clAux.result('CH_CLIE'),6);
              campo16 := form_t(clAux.result('CH_STAT'),1);
              campo17 := form_t(clAux.result('CH_OBS'),50);
              campo18 := form_data(clAux.result('CH_TIME'));
              campo19 := clAux.result('CH_OPER');
              WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19);
              totcheq1 := totcheq1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Cheques-pre..: '+form_n(totcheq1,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'EXC CHEQUE PRE';
            Reg             := totcheq1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {5.1 - Exportacao de exclusoes de cheques pre-datados compensados ------->}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CRECHMVPG                        ');
          clAux.AddParam ('Where ((CH_TIME>=:data1 AND CH_TIME<=:data2) OR          ');
          clAux.AddParam ('       (CH_TIME>=:n_data1 AND CH_TIME<=:n_data2)) AND    ');
          clAux.AddParam ('      (CH_OPER='+chr(39)+'E'+chr(39)+')                  ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME                         ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exclusões de cheques pagos...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheqpg1 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CH_CCGC,CH_BANC,CH_NUME                                   ');
            clAux2.AddParam ('From CRECHMVPG                                                   ');
            clAux2.AddParam ('Where (CH_CCGC='+chr(39)+clAux.result('CH_CCGC')+chr(39)+')  AND ');
            clAux2.AddParam ('      (CH_BANC='+floattostr(clAux.result('CH_BANC'))+') AND      ');
            clAux2.AddParam ('      (CH_NUME='+floattostr(clAux.result('CH_NUME'))+')          ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CH_CODI'),6);
              campo02 := form_t(clAux.result('CH_CCGC'),14);
              campo03 := form_n(clAux.result('CH_BANC'),3);
              campo04 := form_n(clAux.result('CH_NUME'),7);
              campo05 := form_data(clAux.result('CH_DTCT'));
              campo06 := form_t(clAux.result('CH_NOME'),40);
              campo07 := form_t(clAux.result('CH_FONE'),15);
              campo08 := form_nz(clAux.result('CH_LOJA'),2);
              campo09 := form_data(clAux.result('CH_DVTO'));
              campo10 := form_nz(clAux.result('CH_PORT'),4);
              campo11 := form_t(clAux.result('CH_AGEN'),10);
              campo12 := form_data(clAux.result('CH_DTRA'));
              campo13 := form_nz(clAux.result('CH_TRAN'),4);
              campo14 := form_nz(clAux.result('CH_VALO')*100,15);
              campo15 := form_nz(clAux.result('CH_CLIE'),6);
              campo16 := form_t(clAux.result('CH_STAT'),1);
              campo17 := form_t(clAux.result('CH_OBS'),50);
              campo18 := form_data(clAux.result('CH_DTPG'));
              campo19 := form_data(clAux.result('CH_TIME'));
              campo20 := clAux.result('CH_OPER');
              WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19+campo20);
              totcheqpg1 := totcheqpg1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Cheques comp.: '+form_n(totcheqpg1,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'EXC CHEQUE COMP';
            Reg             := totcheqpg1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {6.1 - Exportacao de exclusoes de cheques devolvidos ------------------>}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CRECHDEV                         ');
          clAux.AddParam ('Where ((CH_TIME>=:data1 AND CH_TIME<=:data2) OR          ');
          clAux.AddParam ('       (CH_TIME>=:n_data1 AND CH_TIME<=:n_data2)) AND    ');
          clAux.AddParam ('      (CH_OPER='+chr(39)+'E'+chr(39)+')                  ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME                         ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando excs. de cheques dev...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheqdev1 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CH_CCGC,CH_BANC,CH_NUME  ');
            clAux2.AddParam ('From CRECHDEV                   ');
            clAux2.AddParam ('Where (CH_CCGC='+chr(39)+clAux.result('CH_CCGC')+chr(39)+')  AND ');
            clAux2.AddParam ('      (CH_BANC='+floattostr(clAux.result('CH_BANC'))+') AND      ');
            clAux2.AddParam ('      (CH_NUME='+floattostr(clAux.result('CH_NUME'))+')          ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CH_CLIE'),6);
              campo02 := form_t(clAux.result('CH_CCGC'),14);
              campo03 := form_n(clAux.result('CH_NUME'),7);
              campo04 := form_data(clAux.result('CH_DTCT'));
              campo05 := form_nz(clAux.result('CH_LOJA'),2);
              campo06 := form_data(clAux.result('CH_DTEM'));
              campo07 := form_data(clAux.result('CH_DVTO'));
              campo08 := form_nz(clAux.result('CH_PORT'),4);
              campo09 := form_n(clAux.result('CH_BANC'),3);
              campo10 := form_t(clAux.result('CH_AGEN'),10);
              campo11 := form_nz(clAux.result('CH_VALO')*100,15);
              campo12 := form_t(clAux.result('CH_ALIN'),4);
              campo13 := form_t(clAux.result('CH_OBS'),50);
              campo14 := form_t(clAux.result('CH_NOME'),40);
              campo15 := form_n(clAux.result('CH_TRAN'),4);
              campo16 := form_data(clAux.result('CH_TIME'));
              campo17 := clAux.result('CH_OPER');
              WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17);
              totcheqdev1 := totcheqdev1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Cheques dev..: '+form_n(totcheqdev1,10) +'   Arquivo.: '+nome_arq);
          with FLogExportacao do
          begin
            Tabela          := 'EXC CHEQUES DEV';
            Reg             := totcheqdev1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {7.1 - Exportacao de exclusoes de cheques devolvidos compensados ----------------->}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect  ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CRECHDVPG                        ');
          clAux.AddParam ('Where ((CH_TIME>=:data1 AND CH_TIME<=:data2) OR          ');
          clAux.AddParam ('       (CH_TIME>=:n_data1 AND CH_TIME<=:n_data2)) AND    ');
          clAux.AddParam ('      (CH_OPER='+chr(39)+'E'+chr(39)+')                  ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME                         ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exc. de cheq. dev. pagos...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheqdvpg1 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CH_CCGC,CH_BANC,CH_NUME  ');
            clAux2.AddParam ('From CRECHDVPG                  ');
            clAux2.AddParam ('Where (CH_CCGC='+chr(39)+clAux.result('CH_CCGC')+chr(39)+')  AND ');
            clAux2.AddParam ('      (CH_BANC='+floattostr(clAux.result('CH_BANC'))+') AND      ');
            clAux2.AddParam ('      (CH_NUME='+floattostr(clAux.result('CH_NUME'))+')          ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CH_CLIE'),6);
              campo02 := form_t(clAux.result('CH_CCGC'),14);
              campo03 := form_n(clAux.result('CH_NUME'),7);
              campo04 := form_data(clAux.result('CH_DTCT'));
              campo05 := form_nz(clAux.result('CH_LOJA'),2);
              campo06 := form_data(clAux.result('CH_DTEM'));
              campo07 := form_data(clAux.result('CH_DVTO'));
              campo08 := form_nz(clAux.result('CH_PORT'),4);
              campo09 := form_n(clAux.result('CH_BANC'),3);
              campo10 := form_t(clAux.result('CH_AGEN'),10);
              campo11 := form_nz(clAux.result('CH_VALO')*100,15);
              campo12 := form_data(clAux.result('CH_DTPG'));
              campo13 := form_t(clAux.result('CH_ALIN'),4);
              campo14 := form_nz(clAux.result('CH_VAPG')*100,15);
              campo15 := form_t(clAux.result('CH_OBS'),50);
              campo16 := form_nz(clAux.result('CH_POR2'),4);
              campo17 := form_t(clAux.result('CH_NOME'),40);
              campo18 := form_n(clAux.result('CH_TRAN'),4);
              campo19 := form_data(clAux.result('CH_TIME'));
              campo20 := clAux.result('CH_OPER');
              WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19+campo20);
              totcheqdvpg1 := totcheqdvpg1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Cheques dvpg.: '+form_n(totcheqdvpg1,10) +'   Arquivo.: '+nome_arq);
          with FLogExportacao do
          begin
            Tabela          := 'EXC CHEQUES DEVPG';
            Reg             := totcheqdvpg1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {8.1. - Exportacao das exclusoes de complementos de clientes --------------------------->}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_CRECLI_COMP                      ');
          clAux.AddParam ('Where ((CC_TIME>=:data1 AND CC_TIME<=:data2) OR          ');
          clAux.AddParam ('       (CC_TIME>=:n_data1 AND CC_TIME<=:n_data2)) AND    ');
          clAux.AddParam ('       (CC_OPER='+chr(39)+'E'+chr(39)+')                 ');
          clAux.AddParam ('Order by CC_CLIE                                         ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exclusões de complementos de clientes...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcomp1 := 0;
          pnGauge1.visible:=true;
          gauge1.visible:=true;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CC_CLIE     ');
            clAux2.AddParam ('From CRECLI_COMP   ');
            clAux2.AddParam ('Where (CC_CLIE='+floattostr(clAux.result('CC_CLIE'))+')  ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CC_CLIE'),6);
              campo02 := form_t(clAux.result('CC_ENDC'),50);
              campo03 := form_t(clAux.result('CC_BAIC'),30);
              campo04 := form_t(clAux.result('CC_CIDC'),20);
              campo05 := form_t(clAux.result('CC_ESTC'),2);
              campo06 := form_t(clAux.result('CC_CEPC'),8);
              campo07 := form_t(clAux.result('CC_NCO1'),50);
              campo08 := form_t(clAux.result('CC_TCO1'),15);
              campo09 := form_nz(clAux.result('CC_CCO1')*100,10);
              campo10 := form_t(clAux.result('CC_NCO2'),50);
              campo11 := form_t(clAux.result('CC_TCO2'),15);
              campo12 := form_nz(clAux.result('CC_CCO2')*100,10);
              campo13 := form_data(clAux.result('CC_TIME'));
              campo14 := clAux.result('CC_OPER');
              WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14);
              totcomp1 := totcomp1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Complementos.: '+form_n(totcomp1,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'EXC COMPLEMENTOS';
            Reg             := totcomp1;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {9.1. - Exportacao das exclusoes das observacoes de clientes --------------------------->}
          if (rdModelo.itemindex=1) then
          begin
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIOBS.MTZ';
            AssignFile (arq, nome_arq);
            if (FileExists(nome_arq)) then
              Append(arq)
            else
              Rewrite (arq);
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('CREDITO',self);
            clAux.ClearSql;
            clAux.AddParam ('Select * From MOVIMENTO_CRECLI_OBS                       ');
            clAux.AddParam ('Where ((OB_TIME>=:data1 AND OB_TIME<=:data2) OR          ');
            clAux.AddParam ('       (OB_TIME>=:n_data1 AND OB_TIME<=:n_data2)) AND    ');
            clAux.AddParam ('       (OB_OPER='+chr(39)+'E'+chr(39)+')                 ');
            clAux.AddParam ('Order by OB_CLIE                                         ');
            clAux.consulta.parambyname('data1').AsString := data1;
            clAux.consulta.parambyname('data2').AsString := data2;
            clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
            clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
            mostra_mensagem ('Buscando exclusões de observações de clientes...');
            gauge1.visible:=true;
            gauge1.progress:=0;
            clAux.Execute;
            clAux.first;
            totobs1 := 0;
            pnGauge1.visible:=true;
            gauge1.visible:=true;
            indGauge:=0;
            totGauge:=clAux.reccount;
            while (not clAux.eof) do
            begin
              clAux2 := TClassAuxiliar.Create;
              clAux2.conect   ('CREDITO',self);
              clAux2.ClearSql;
              clAux2.AddParam ('Select OB_CLIE     ');
              clAux2.AddParam ('From CRECLI_OBS    ');
              clAux2.AddParam ('Where (OB_CLIE='+floattostr(clAux.result('OB_CLIE'))+')  ');
              if (not clAux2.Execute) then
              begin
                campo01 := form_nz(clAux.result('OB_CLIE'),6);
                campo02 := form_t (' ',80);
                campo03 := form_t (' ',80);
                campo04 := form_t (' ',80);
                campo05 := form_t (' ',80);
                campo06 := form_t (' ',80);
                campo07 := form_data(clAux.result('OB_TIME'));
                campo08 := clAux.result('OB_OPER');
                WriteLn (arq,  campo01+campo02+campo03+campo04+
                  campo05+campo06+campo07+campo08);
                totobs1 := totobs1 + 1;
              end;
              clAux2.desconect;
              clAux2.Free;
              clAux.next;
              indGauge:=indGauge+1;
              gauge1.progress:=Round((indGauge/totGauge)*100);
              gauge1.refresh;
            end;
            clAux.desconect;
            clAux.Free;
            CloseFile (arq);
            memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Observações..: '+form_n(totobs1,10) +'   Arquivo.: '+nome_arq);
            with FLogExportacao do
            begin
              Tabela          := 'EXC OBS';
              Reg             := totobs1;
            end;

            LogExportacao(FLogExportacao);

            sequencial_operacao := sequencial_operacao + 1;
            memo1.refresh;
          end;

              {10.1. - Exportacao da tabela de contratos de renegociacao --------------------------->}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\RENEGOC.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\RENEGOC.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From MOVIMENTO_RENEGOCIADOS                     ');
          clAux.AddParam ('Where ((CR_TIME>=:data1 AND CR_TIME<=:data2) OR          ');
          clAux.AddParam ('       (CR_TIME>=:n_data1 AND CR_TIME<=:n_data2)) AND    ');
          clAux.AddParam ('       (CR_OPER='+chr(39)+'E'+chr(39)+')                 ');
          clAux.AddParam ('Order by CLIENTE                                         ');
          clAux.consulta.parambyname('data1').AsString := data1;
          clAux.consulta.parambyname('data2').AsString := data2;
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando exclusões de contratos de renegociação...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totrenegoc1 := 0;
          pnGauge1.visible:=true;
          gauge1.visible:=true;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.conect   ('CREDITO',self);
            clAux2.ClearSql;
            clAux2.AddParam ('Select CLIENTE                                                               ');
            clAux2.AddParam ('From CONTRATOS_RENEGOCIADOS                                                  ');
            clAux2.AddParam ('Where (CLIENTE='+floattostr(clAux.result('CLIENTE'))+') AND                  ');
            clAux2.AddParam ('      (CONTRATO_MESTRE='+floattostr(clAux.result('CONTRATO_MESTRE'))+') AND  ');
            clAux2.AddParam ('      (CONTRATO_ESCRAVO='+floattostr(clAux.result('CONTRATO_ESCRAVO'))+')    ');
            if (not clAux2.Execute) then
            begin
              campo01 := form_nz(clAux.result('CLIENTE'),6);
              campo02 := form_nz(clAux.result('CONTRATO_MESTRE'),6);
              campo03 := form_nz(clAux.result('CONTRATO_ESCRAVO'),6);
              campo04 := form_nz(clAux.result('MENSALIDADE_INICIAL'),2);
              campo05 := form_data(clAux.result('CR_TIME'));
              campo06 := clAux.result('CR_OPER');
              WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
                campo06);
              totrenegoc1 := totrenegoc1 + 1;
            end;
            clAux2.desconect;
            clAux2.Free;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Exc. Renegociações: '+form_n(totrenegoc1,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'EXC RENEGOCIACOES';
            Reg             := totrenegoc1;
          end;

          LogExportacao(FLogExportacao);
          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;
        end;
          {******************** FIM DO TRECHO RELATIVO A ENVIO DE 'EXCLUSOES' *********************}
          {FIM DA EXPORTACAO DAS EXCLUSOES EXECUTADAS *****}

          {2A PARTE - EXPORTACAO GERAL}
          {8.- EXPORTACAO DE CONTRATOS MOVIMENTADOS NO PERIODO E QUE FORAM REALIZADOS NO PERIODO ***}

        if (rdModelo.itemindex=0) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.L'+form_nz(frm_principal.x_frente_loja,2)
        else
        if (rdModelo.itemindex=1) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.MTZ';
        AssignFile (arq, nome_arq);
        if (FileExists(nome_arq)) then
          Append(arq)
        else
          Rewrite (arq);
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('CREDITO',self);
        clAux.ClearSql;
        clAux.AddParam ('Select * From CRECTABR                         ');
        if (rdModelo.itemindex=0) then {FILIAIS MANDA SOMENTE OS CONTRATOS DO DIA}
        begin
          clAux.AddParam ('Where    (CR_DNOT>=:n_data1)  AND         ');
          clAux.AddParam ('         (CR_DNOT<=:n_data2)              ');
        end
        else
        if (rdModelo.itemindex=1) then {MATRIZ MANDA TUDO}
        begin
          clAux.AddParam ('Where  (((CR_DNOT>=:n_data1)  AND         ');
          clAux.AddParam ('         (CR_DNOT<=:n_data2)) OR          ');
          clAux.AddParam ('        ((CR_TIME>=:n_data1)  AND         ');
          clAux.AddParam ('         (CR_TIME<=:n_data2)))            ');
        end;
        if (chExportaSoLoja.checked) then
          clAux.AddParam ('    AND (CR_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
        clAux.AddParam ('Order by CR_CLIE,CR_CODI                 ');
        clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
        clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
        mostra_mensagem ('Buscando contratos movimentados...');
        gauge1.visible:=true;
        gauge1.progress:=0;
        clAux.Execute;
        clAux.first;
        totctr2 := 0;
        indGauge:=0;
        totGauge:=clAux.reccount;
        while (not clAux.eof) do
        begin
          campo01 := form_nz(clAux.result('CR_CLIE'),6);
          campo02 := form_nz(clAux.result('CR_CODI'),6);
          campo03 := form_nz(clAux.result('CR_LOJA'),2);
          campo04 := form_t(clAux.result('CR_NOTA'),10);
          campo05 := form_t(clAux.result('CR_SERI'),2);
          campo06 := form_data(clAux.result('CR_DNOT'));
          campo07 := form_nz(clAux.result('CR_AVAL'),6);
          campo08 := form_nz(clAux.result('CR_PORT'),4);
          campo09 := form_nz(clAux.result('CR_TOTA')*100,15);
          campo10 := form_nz(clAux.result('CR_VENT')*100,15);
          campo11 := form_nz(clAux.result('CR_PLAN'),3);
          campo12 := form_nz(clAux.result('CR_QPRE'),2);
          campo13 := form_nz(clAux.result('CR_PDEV'),2);
          campo14 := form_nz(clAux.result('CR_FATO')*100,5);
          campo15 := form_t(clAux.result('CR_CARN'),1);
          campo16 := form_t(clAux.result('CR_FICH'),1);
          campo17 := form_nz(clAux.result('CR_VDEV')*100,15);
          campo18 := form_data(clAux.result('CR_DTRA'));
          campo19 := form_nz(clAux.result('CR_TOT2')*100,15);
          campo20 := form_t(clAux.result('CR_BOLE'),1);
          campo21 := form_t(clAux.result('CR_OBSE'),80);
          campo22 := form_data(clAux.result('CR_TIME'));
          campo24 := form_t(clAux.result('CR_QBOL'),1);
          campo23 := 'A';
          WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
            campo06+campo07+campo08+campo09+campo10+
            campo11+campo12+campo13+campo14+campo15+
            campo16+campo17+campo18+campo19+campo20+
            campo21+campo22+campo24+campo23);
          totctr2 := totctr2 + 1;
          clAux.next;
          indGauge:=indGauge+1;
          gauge1.progress:=Round((indGauge/totGauge)*100);
          gauge1.refresh;
        end;
        clAux.desconect;
        clAux.Free;
        CloseFile (arq);
        if LinhaIni = -1 then
          LinhaINi := Memo1.Lines.Count;
        memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Contratos.........: '+form_n(totctr2,10) +'   Arquivo.: '+nome_arq);
        sequencial_operacao := sequencial_operacao + 1;
        memo1.refresh;


          {9.- EXPORTACAO DOS CLIENTES DOS CONTRATOS ANTERIORES E CLIENTES MOVIMENTADOS NO PERIODO ***}
        if (rdModelo.itemindex=0) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.L'+form_nz(frm_principal.x_frente_loja,2)
        else
        if (rdModelo.itemindex=1) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.MTZ';
        AssignFile (arq, nome_arq);
        if (FileExists(nome_arq)) then
          Append(arq)
        else
          Rewrite (arq);
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('CREDITO',self);

        if (rdModelo.itemindex=1) then {SOMENTE A MATRIZ PODE MANDAR CLIENTES 'ALTERADOS' SEM COMPRA}
        begin
              {... - (9.1) - de clientes que tiveram alguma alteracao cadastral no periodo}
          clAux.ClearSql;
          clAux.AddParam ('SELECT CL_CODI,CL_LOJA,CL_NOME,CL_ENDE,CL_SEXO,CL_BAIR,CL_CIDA,     ');
          clAux.AddParam ('      CL_ESTA,CL_CEP ,CL_FONE,CL_FAX ,CL_CELU,CL_EMAI,CL_DTNA,      ');
          clAux.AddParam ('      CL_IDEN,CL_OEXP,CL_CPF,CL_ECIV,CL_CONJ,CL_NPAI,CL_NMAE,       ');
          clAux.AddParam ('      CL_REF1,CL_REF2,CL_EMPR,CL_CARG,CL_EEMP,CL_FEMP,CL_REMP,      ');
          clAux.AddParam ('      CL_CPRO,CL_SALA,CL_LIMC,CL_CFUN,CL_TPRO,CL_RSPC,CL_DSPC,      ');
          clAux.AddParam ('      CL_DREG,CL_VALI,CL_DTCA,CL_ULTC,CL_QTDC,CL_OBSE,CL_DADM,      ');
          clAux.AddParam ('      CL_TRF1,CL_TRF2,CL_DULP,CL_ALTE,CL_PDC,CL_LIVR,CL_TIME        ');
          clAux.AddParam ('From  CRECLI                                                        ');
          clAux.AddParam ('Where (CL_TIME>=:n_data1)  AND                                      ');
          clAux.AddParam ('      (CL_TIME<=:n_data2)                                           ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('     AND (CL_LOJA='+floattostr(frm_principal.x_frente_loja)+')  ');
          clAux.AddParam ('Order by CL_CODI                                                    ');
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando clientes com alteração contratual...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcli2 := 0;
          pnGauge1.visible:=true;
          gauge1.visible:=true;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            campo01 := form_nz(clAux.result('CL_CODI'),6);
            campo02 := form_t(clAux.result('CL_NOME'),40);
            campo03 := form_t(clAux.result('CL_CPF'),14);
            campo04 := form_t(clAux.result('CL_ENDE'),50);
            campo05 := form_nz(clAux.result('CL_LOJA'),2);
            campo06 := form_t(clAux.result('CL_SEXO'),1);
            campo07 := form_t(clAux.result('CL_BAIR'),30);
            campo08 := form_t(clAux.result('CL_CIDA'),20);
            campo09 := form_t(clAux.result('CL_ESTA'),2);
            campo10 := form_t(clAux.result('CL_CEP'),8);
            campo11 := form_t(clAux.result('CL_FONE'),15);
            campo12 := form_t(clAux.result('CL_FAX'),15);
            campo13 := form_t(clAux.result('CL_CELU'),15);
            campo14 := form_data(clAux.result('CL_DTNA'));
            campo15 := form_t(clAux.result('CL_IDEN'),25);
            campo16 := form_t(clAux.result('CL_OEXP'),10);
            campo17 := form_t(clAux.result('CL_ECIV'),1);
            campo18 := form_t(clAux.result('CL_CONJ'),40);
            campo19 := form_t(clAux.result('CL_NPAI'),40);
            campo20 := form_t(clAux.result('CL_NMAE'),40);
            campo21 := form_t(clAux.result('CL_REF1'),40);
            campo22 := form_t(clAux.result('CL_TRF1'),15);
            campo23 := form_t(clAux.result('CL_REF2'),40);
            campo24 := form_t(clAux.result('CL_TRF2'),15);
            campo25 := form_t(clAux.result('CL_EMPR'),30);
            campo26 := form_t(clAux.result('CL_CARG'),20);
            campo27 := form_t(clAux.result('CL_EEMP'),50);
            campo28 := form_t(clAux.result('CL_FEMP'),15);
            campo29 := form_t(clAux.result('CL_REMP'),5);
            campo30 := form_data(clAux.result('CL_DADM'));
            campo31 := form_t(clAux.result('CL_CPRO'),20);
            campo32 := form_nz(clAux.result('CL_SALA')*100,10);
            campo33 := form_nz(clAux.result('CL_LIMC')*100,10);
            campo34 := form_t(clAux.result('CL_CFUN'),1);
            campo35 := form_t(clAux.result('CL_TPRO'),1);
            campo36 := form_t(clAux.result('CL_RSPC'),1);
            campo37 := form_data(clAux.result('CL_DSPC'));
            campo38 := form_data(clAux.result('CL_DREG'));
            campo39 := form_data(clAux.result('CL_VALI'));
            campo40 := form_data(clAux.result('CL_DTCA'));
            campo41 := form_data(clAux.result('CL_ULTC'));
            if (clAux.result('CL_QTDC')<0) then
              campo42 := form_nz(clAux.result('CL_QTDC')*(-100),5)
            else
              campo42 := form_nz(clAux.result('CL_QTDC')*100,5);
            campo43 := form_t(clAux.result('CL_OBSE'),50);
            campo44 := form_t(clAux.result('CL_ALTE'),1);
            campo45 := form_data(clAux.result('CL_DULP'));
            campo46 := form_t(clAux.result('CL_PDC'),4);
            campo47 := form_t(clAux.result('CL_EMAI'),80);
            campo48 := form_t(clAux.result('CL_LIVR'),4);
            campo49 := form_data(clAux.result('CL_TIME'));
            campo50 := 'A';
            WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
              campo06+campo07+campo08+campo09+campo10+
              campo11+campo12+campo13+campo14+campo15+
              campo16+campo17+campo18+campo19+campo20+
              campo21+campo22+campo23+campo24+campo25+
              campo26+campo27+campo28+campo29+campo30+
              campo31+campo32+campo33+campo34+campo35+
              campo36+campo37+campo38+campo39+campo40+
              campo41+campo42+campo43+campo44+campo45+
              campo46+campo47+campo48+campo49+campo50);
            totcli2 := totcli2 + 1;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
        end;

          {... - (9.1) - de clientes que tiveram contrato no periodo}
        clAux.ClearSql;
        clAux.AddParam ('SELECT DISTINCT CL_CODI,                                                     ');
        clAux.AddParam ('      CL_LOJA,CL_NOME,CL_ENDE,CL_SEXO,CL_BAIR,CL_CIDA,                       ');
        clAux.AddParam ('      CL_ESTA,CL_CEP ,CL_FONE,CL_FAX ,CL_CELU,CL_EMAI,CL_DTNA,               ');
        clAux.AddParam ('      CL_IDEN,CL_OEXP,CL_CPF,CL_ECIV,CL_CONJ,CL_NPAI,CL_NMAE,                ');
        clAux.AddParam ('      CL_REF1,CL_REF2,CL_EMPR,CL_CARG,CL_EEMP,CL_FEMP,CL_REMP,               ');
        clAux.AddParam ('      CL_CPRO,CL_SALA,CL_LIMC,CL_CFUN,CL_TPRO,CL_RSPC,CL_DSPC,               ');
        clAux.AddParam ('      CL_DREG,CL_VALI,CL_DTCA,CL_ULTC,CL_QTDC,CL_OBSE,CL_DADM,               ');
        clAux.AddParam ('      CL_TRF1,CL_TRF2,CL_DULP,CL_ALTE,CL_PDC,CL_LIVR,CL_TIME                 ');
        if not frm_principal.x_exploja_allcli then
        begin
          clAux.AddParam ('From CRECLI                          ');
          claux.addParam ('Left Join CRECTABR on (CL_CODI=CR_CLIE)');
          if (rdModelo.itemindex=0) then {FILIAIS MANDA SOMENTE OS CONTRATOS DO DIA}
          begin
            clAux.AddParam ('Where    ((CR_DNOT>=:n_data1)  AND  (CR_DNOT<=:n_data2))                ');
            clAux.AddParam (' OR      ((CL_DTCA>=:n_data1)  AND  (CL_DTCA<=:n_data2))                ');
          end
          else
          if (rdModelo.itemindex=1) then {MATRIZ MANDA TUDO}
          begin
            clAux.AddParam ('Where  (((CR_DNOT>=:n_data1)  AND                                       ');
            clAux.AddParam ('         (CR_DNOT<=:n_data2)) OR                                        ');
            clAux.AddParam ('       ((CR_TIME>=:n_data1)  AND                                        ');
            clAux.AddParam ('         (CR_TIME<=:n_data2))) AND                                      ');
            clAux.AddParam ('         (CL_CODI=CR_CLIE)                                              ');
          end;
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('     AND (CR_LOJA='+floattostr(frm_principal.x_frente_loja)+')          ');
        end
        else
        begin
          clAux.AddParam ('From CRECLI                                                             ');
          clAux.AddParam ('Where     (CL_TIME>=:n_data1 AND CL_TIME<=:n_data2)                     ');
          clAux.AddParam (' OR       (CL_DTCA>=:n_data1 AND  CL_DTCA<=:n_data2)                    ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('     AND (CL_LOJA='+floattostr(frm_principal.x_frente_loja)+')          ');
        end;
        clAux.AddParam ('Order by CL_CODI                                                                 ');
        clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
        clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
        mostra_mensagem ('Buscando clientes movimentados...');
        gauge1.visible:=true;
        gauge1.progress:=0;
        clAux.Execute;
        clAux.first;
        pnGauge1.visible:=true;
        gauge1.visible:=true;
        indGauge:=0;
        totGauge:=clAux.reccount;
        while (not clAux.eof) do
        begin
          campo01 := form_nz(clAux.result('CL_CODI'),6);
          campo02 := form_t(clAux.result('CL_NOME'),40);
          campo03 := form_t(clAux.result('CL_CPF'),14);
          campo04 := form_t(clAux.result('CL_ENDE'),50);
          campo05 := form_nz(clAux.result('CL_LOJA'),2);
          campo06 := form_t(clAux.result('CL_SEXO'),1);
          campo07 := form_t(clAux.result('CL_BAIR'),30);
          campo08 := form_t(clAux.result('CL_CIDA'),20);
          campo09 := form_t(clAux.result('CL_ESTA'),2);
          campo10 := form_t(clAux.result('CL_CEP'),8);
          campo11 := form_t(clAux.result('CL_FONE'),15);
          campo12 := form_t(clAux.result('CL_FAX'),15);
          campo13 := form_t(clAux.result('CL_CELU'),15);
          campo14 := form_data(clAux.result('CL_DTNA'));
          campo15 := form_t(clAux.result('CL_IDEN'),25);
          campo16 := form_t(clAux.result('CL_OEXP'),10);
          campo17 := form_t(clAux.result('CL_ECIV'),1);
          campo18 := form_t(clAux.result('CL_CONJ'),40);
          campo19 := form_t(clAux.result('CL_NPAI'),40);
          campo20 := form_t(clAux.result('CL_NMAE'),40);
          campo21 := form_t(clAux.result('CL_REF1'),40);
          campo22 := form_t(clAux.result('CL_TRF1'),15);
          campo23 := form_t(clAux.result('CL_REF2'),40);
          campo24 := form_t(clAux.result('CL_TRF2'),15);
          campo25 := form_t(clAux.result('CL_EMPR'),30);
          campo26 := form_t(clAux.result('CL_CARG'),20);
          campo27 := form_t(clAux.result('CL_EEMP'),50);
          campo28 := form_t(clAux.result('CL_FEMP'),15);
          campo29 := form_t(clAux.result('CL_REMP'),5);
          campo30 := form_data(clAux.result('CL_DADM'));
          campo31 := form_t(clAux.result('CL_CPRO'),20);
          campo32 := form_nz(clAux.result('CL_SALA')*100,10);
          campo33 := form_nz(clAux.result('CL_LIMC')*100,10);
          campo34 := form_t(clAux.result('CL_CFUN'),1);
          campo35 := form_t(clAux.result('CL_TPRO'),1);
          campo36 := form_t(clAux.result('CL_RSPC'),1);
          campo37 := form_data(clAux.result('CL_DSPC'));
          campo38 := form_data(clAux.result('CL_DREG'));
          campo39 := form_data(clAux.result('CL_VALI'));
          campo40 := form_data(clAux.result('CL_DTCA'));
          campo41 := form_data(clAux.result('CL_ULTC'));
          if (clAux.result('CL_QTDC')<0) then
            campo42 := form_nz(clAux.result('CL_QTDC')*(-100),5)
          else
            campo42 := form_nz(clAux.result('CL_QTDC')*100,5);
          campo43 := form_t(clAux.result('CL_OBSE'),50);
          campo44 := form_t(clAux.result('CL_ALTE'),1);
          campo45 := form_data(clAux.result('CL_DULP'));
          campo46 := form_t(clAux.result('CL_PDC'),4);
          campo47 := form_t(clAux.result('CL_EMAI'),80);
          campo48 := form_t(clAux.result('CL_LIVR'),4);
          campo49 := form_data(clAux.result('CL_TIME'));
          campo50 := 'A';
          WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
            campo06+campo07+campo08+campo09+campo10+
            campo11+campo12+campo13+campo14+campo15+
            campo16+campo17+campo18+campo19+campo20+
            campo21+campo22+campo23+campo24+campo25+
            campo26+campo27+campo28+campo29+campo30+
            campo31+campo32+campo33+campo34+campo35+
            campo36+campo37+campo38+campo39+campo40+
            campo41+campo42+campo43+campo44+campo45+
            campo46+campo47+campo48+campo49+campo50);
          totcli2 := totcli2 + 1;
          clAux.next;
          indGauge:=indGauge+1;
          gauge1.progress:=Round((indGauge/totGauge)*100);
          gauge1.refresh;
        end;
        clAux.desconect;
        clAux.Free;
        CloseFile (arq);
        memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Clientes..........: '+form_n(totcli2,10) +'   Arquivo.: '+nome_arq);
        with FLogExportacao do
        begin
          Tabela          := 'CLIENTES';
          Reg             := totcli2;
        end;

        LogExportacao(FLogExportacao);

        sequencial_operacao := sequencial_operacao + 1;
        memo1.refresh;

          {10. - EXPORTACAO DE PRESTACOES DOS CONTRATOS ANTERIORES E MOVIMENTADOS NO PERIODO INDICADO}
        if (rdModelo.itemindex=0) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.L'+form_nz(frm_principal.x_frente_loja,2)
        else
        if (rdModelo.itemindex=1) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.MTZ';
        AssignFile (arq, nome_arq);
        if (FileExists(nome_arq)) then
          Append(arq)
        else
          Rewrite (arq);
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('CREDITO',self);
        clAux.ClearSql;
        clAux.AddParam ('Select * From CREPRABR                    ');
        if (rdModelo.itemindex=0) then {FILIAIS MANDA SOMENTE OS CONTRATOS DO DIA}
        begin
          clAux.AddParam ('Where   (PC_DCON>=:n_data1) AND      ');
          clAux.AddParam ('        (PC_DCON<=:n_data2)          ');
        end
        else
        if (rdModelo.itemindex=1) then {MATRIZ MANDA TUDO}
        begin
          clAux.AddParam ('Where (((PC_DCON>=:n_data1) AND      ');
          clAux.AddParam ('        (PC_DCON<=:n_data2)) OR      ');
          clAux.AddParam ('       ((PC_TIME>=:n_data1) AND      ');
          clAux.AddParam ('        (PC_TIME<=:n_data2)))        ');
        end;
        if (chExportaSoLoja.checked) then
          clAux.AddParam ('    AND (PC_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
        clAux.AddParam ('Order by PC_CLIE,PC_CONT,PC_NPRE     ');
        clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
        clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
        mostra_mensagem ('Buscando prestações movimentadas...');
        gauge1.visible:=true;
        gauge1.progress:=0;
        clAux.Execute;
        clAux.first;
        totptr2 := 0;
        indGauge:=0;
        totGauge:=clAux.reccount;
        while (not clAux.eof) do
        begin
          campo01 := form_nz(clAux.result('PC_NPRE'),2);
          campo02 := form_nz(clAux.result('PC_VALO')*100,15);
          campo03 := form_nz(clAux.result('PC_FATO')*100,5);
          campo04 := form_data(clAux.result('PC_DCON'));
          campo05 := form_data(clAux.result('PC_DVTO'));
          campo06 := form_data(clAux.result('PC_DTPG'));
          campo07 := form_nz(clAux.result('PC_LOJA'),2);
          campo08 := form_nz(clAux.result('PC_PORT'),4);
          campo09 := form_nz(clAux.result('PC_AVAL'),6);
          campo10 := form_nz(clAux.result('PC_PLAN'),3);
          campo11 := form_nz(clAux.result('PC_LJPG'),2);
          campo12 := form_nz(clAux.result('PC_VPAG')*100,15);
          campo13 := form_nz(clAux.result('PC_SALD')*100,5);
          campo14 := form_t(clAux.result('PC_STAT'),1);
          campo15 := form_nz(clAux.result('PC_CONT'),6);
          campo16 := form_nz(clAux.result('PC_CLIE'),6);
          campo17 := form_nz(clAux.result('PC_CHEQ'),10);
          campo18 := form_nz(clAux.result('PC_TPRE'),2);
          campo19 := form_data(clAux.result('PC_DTRA'));
          campo20 := form_t(clAux.result('PC_CCGC'),14);
          campo21 := form_nz(clAux.result('PC_BANC'),6);
          campo22 := form_t(clAux.result('PC_AGEN'),10);
          campo23 := form_nz(clAux.result('PC_NUME'),10);
          campo24 := form_nz(clAux.result('PC_FPGT'),2);
          campo25 := form_data(clAux.result('PC_TIME'));
          campo26 := 'A';
          campo27 := form_nz(clAux.result('PC_FUNC'),6);
          campo28 := clAux.result('PC_HORA');
          if (Trim(campo28)='') then
            campo28 := '00:00:00';
          WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
            campo06+campo07+campo08+campo09+campo10+
            campo11+campo12+campo13+campo14+campo15+
            campo16+campo17+campo18+campo19+campo20+
            campo21+campo22+campo23+campo24+campo25+
            campo26+campo27,campo28);
          totptr2 := totptr2 + 1;
          clAux.next;
          indGauge:=indGauge+1;
          gauge1.progress:=Round((indGauge/totGauge)*100);
          gauge1.refresh;
        end;
        clAux.desconect;
        clAux.Free;
        CloseFile (arq);
        memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Prestações........: '+form_n(totptr2,10) +'   Arquivo.: '+nome_arq);
        with FLogExportacao do
        begin
          Tabela          := 'PRETACOES';
          Reg             := totptr2;
        end;

        LogExportacao(FLogExportacao);

        sequencial_operacao := sequencial_operacao + 1;
        memo1.refresh;
          {FIM DA EXPORTACAO SIMPLES DE CLIENTE,CONTRATOS E PRESTACOES *****}


          {3A PARTE - EXPORTANDO OS CHAMADOS 'PAGAMENTOS' ***}
          {11. - EXPORTANDO AS PRESTACOES PAGAS OU SEJA OS CHAMADOS 'PAGAMENTOS'}
        if (chPagamentos.checked) then
        begin
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From CREPRABR                  ');
          clAux.AddParam ('Where (PC_DTPG>=:n_data1) AND           ');
          clAux.AddParam ('      (PC_DTPG<=:n_data2) AND           ');
          clAux.AddParam ('      (PC_STAT='+chr(39)+'1'+chr(39)+') ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (PC_LJPG='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by PC_CLIE,PC_CONT,PC_NPRE        ');
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando pagamentos...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totptr3 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            campo01 := form_nz(clAux.result('PC_NPRE'),2);
            campo02 := form_nz(clAux.result('PC_VALO')*100,15);
            campo03 := form_nz(clAux.result('PC_FATO')*100,5);
            campo04 := form_data(clAux.result('PC_DCON'));
            campo05 := form_data(clAux.result('PC_DVTO'));
            campo06 := form_data(clAux.result('PC_DTPG'));
            campo07 := form_nz(clAux.result('PC_LOJA'),2);
            campo08 := form_nz(clAux.result('PC_PORT'),4);
            campo09 := form_nz(clAux.result('PC_AVAL'),6);
            campo10 := form_nz(clAux.result('PC_PLAN'),3);
            campo11 := form_nz(clAux.result('PC_LJPG'),2);
            campo12 := form_nz(clAux.result('PC_VPAG')*100,15);
            campo13 := form_nz(clAux.result('PC_SALD')*100,5);
            campo14 := form_t(clAux.result('PC_STAT'),1);
            campo15 := form_nz(clAux.result('PC_CONT'),6);
            campo16 := form_nz(clAux.result('PC_CLIE'),6);
            campo17 := form_nz(clAux.result('PC_CHEQ'),10);
            campo18 := form_nz(clAux.result('PC_TPRE'),2);
            campo19 := form_data(clAux.result('PC_DTRA'));
            campo20 := form_t(clAux.result('PC_CCGC'),14);
            campo21 := form_nz(clAux.result('PC_BANC'),6);
            campo22 := form_t(clAux.result('PC_AGEN'),10);
            campo23 := form_nz(clAux.result('PC_NUME'),10);
            campo24 := form_nz(clAux.result('PC_FPGT'),2);
            campo25 := form_data(clAux.result('PC_TIME'));
            campo26 := 'P';
            campo27 := form_nz(clAux.result('PC_FUNC'),6);
            campo28 := clAux.result('PC_HORA');
            WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
              campo06+campo07+campo08+campo09+campo10+
              campo11+campo12+campo13+campo14+campo15+
              campo16+campo17+campo18+campo19+campo20+
              campo21+campo22+campo23+campo24+campo25+
              campo26+campo27+campo28);
            totptr3 := totptr3 + 1;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Pagamentos........: '+form_n(totptr3,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'PAGAMENTOS';
            Reg             := totptr2;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {12. - EXPORTANDO OS CONTRATOS DAS PRESTACOES ANTERIORES}
          if (rdModelo.itemindex=1) then {SOMENTE A MATRIZ, QUE DEVE ENVIAR O REGISTRO INTEGRO}
          begin
            if (rdModelo.itemindex=0) then
              nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.L'+form_nz(frm_principal.x_frente_loja,2)
            else
            if (rdModelo.itemindex=1) then
              nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.MTZ';
            AssignFile (arq, nome_arq);
            if (FileExists(nome_arq)) then
              Append(arq)
            else
              Rewrite (arq);
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('CREDITO',self);
            clAux.ClearSql;
            clAux.AddParam ('Select * From CRECTABR,CREPRABR                ');
            clAux.AddParam ('Where (PC_DTPG>=:n_data1) AND                  ');
            clAux.AddParam ('      (PC_DTPG<=:n_data2) AND                  ');
            clAux.AddParam ('      (PC_STAT='+chr(39)+'1'+chr(39)+') AND    ');
            clAux.AddParam ('      (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI)  ');
            if (chExportaSoLoja.checked) then
              clAux.AddParam ('    AND (PC_LJPG='+floattostr(frm_principal.x_frente_loja)+') ');
            clAux.AddParam ('Order by PC_CLIE,PC_CONT                       ');
            clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
            clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
            mostra_mensagem ('Buscando contratos dos pagamentos...');
            gauge1.visible:=true;
            gauge1.progress:=0;
            clAux.Execute;
            clAux.first;
            totctr3 := 0;
            indGauge:=0;
            totGauge:=clAux.reccount;
            while (not clAux.eof) do
            begin
              campo01 := form_nz(clAux.result('CR_CLIE'),6);
              campo02 := form_nz(clAux.result('CR_CODI'),6);
              campo03 := form_nz(clAux.result('CR_LOJA'),2);
              campo04 := form_t(clAux.result('CR_NOTA'),10);
              campo05 := form_t(clAux.result('CR_SERI'),2);
              campo06 := form_data(clAux.result('CR_DNOT'));
              campo07 := form_nz(clAux.result('CR_AVAL'),6);
              campo08 := form_nz(clAux.result('CR_PORT'),4);
              campo09 := form_nz(clAux.result('CR_TOTA')*100,15);
              campo10 := form_nz(clAux.result('CR_VENT')*100,15);
              campo11 := form_nz(clAux.result('CR_PLAN'),3);
              campo12 := form_nz(clAux.result('CR_QPRE'),2);
              campo13 := form_nz(clAux.result('CR_PDEV'),2);
              campo14 := form_nz(clAux.result('CR_FATO')*100,5);
              campo15 := form_t(clAux.result('CR_CARN'),1);
              campo16 := form_t(clAux.result('CR_FICH'),1);
              campo17 := form_nz(clAux.result('CR_VDEV')*100,15);
              campo18 := form_data(clAux.result('CR_DTRA'));
              campo19 := form_nz(clAux.result('CR_TOT2')*100,15);
              campo20 := form_t(clAux.result('CR_BOLE'),1);
              campo21 := form_t(clAux.result('CR_OBSE'),80);
              campo22 := form_data(clAux.result('CR_TIME'));
              campo23 := 'A';
              WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19+campo20+
                campo21+campo22+campo23);
              totctr3 := totctr3 + 1;
              clAux.next;
              indGauge:=indGauge+1;
              gauge1.progress:=Round((indGauge/totGauge)*100);
              gauge1.refresh;
            end;
            clAux.desconect;
            clAux.Free;
            CloseFile (arq);
            memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Contratos/Pagtos..: '+form_n(totctr3,10) +'   Arquivo.: '+nome_arq);
            with FLogExportacao do
            begin
              Tabela          := 'CONTRATOS';
              Reg             := totctr3;
            end;

            LogExportacao(FLogExportacao);

            sequencial_operacao := sequencial_operacao + 1;
            memo1.refresh;

                  {13. - EXPORTANDO OS CLIENTES DOS CONTRATOS DE PAGAMENTO ANTERIORES}
            if (rdModelo.itemindex=0) then
              nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.L'+form_nz(frm_principal.x_frente_loja,2)
            else
            if (rdModelo.itemindex=1) then
              nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.MTZ';
            AssignFile (arq, nome_arq);
            if (FileExists(nome_arq)) then
              Append(arq)
            else
              Rewrite (arq);
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('CREDITO',self);
            clAux.ClearSql;
            clAux.AddParam ('Select DISTINCT CL_CODI,                                            ');
            clAux.AddParam ('      CL_LOJA,CL_NOME,CL_ENDE,CL_SEXO,CL_BAIR,CL_CIDA,              ');
            clAux.AddParam ('      CL_ESTA,CL_CEP ,CL_FONE,CL_FAX ,CL_CELU,CL_EMAI,CL_DTNA,      ');
            clAux.AddParam ('      CL_IDEN,CL_OEXP,CL_CPF,CL_ECIV,CL_CONJ,CL_NPAI,CL_NMAE,       ');
            clAux.AddParam ('      CL_REF1,CL_REF2,CL_EMPR,CL_CARG,CL_EEMP,CL_FEMP,CL_REMP,      ');
            clAux.AddParam ('      CL_CPRO,CL_SALA,CL_LIMC,CL_CFUN,CL_TPRO,CL_RSPC,CL_DSPC,      ');
            clAux.AddParam ('      CL_DREG,CL_VALI,CL_DTCA,CL_ULTC,CL_QTDC,CL_OBSE,CL_DADM,      ');
            clAux.AddParam ('      CL_TRF1,CL_TRF2,CL_DULP,CL_ALTE,CL_PDC,CL_LIVR,CL_TIME        ');
            clAux.AddParam ('From CREPRABR,CRECLI                                                ');
            clAux.AddParam ('Where (PC_DTPG>=:n_data1) AND                                       ');
            clAux.AddParam ('      (PC_DTPG<=:n_data2) AND                                       ');
            clAux.AddParam ('      (PC_STAT='+chr(39)+'1'+chr(39)+') AND                         ');
            clAux.AddParam ('      (PC_CLIE=CL_CODI)                                             ');
            if (chExportaSoLoja.checked) then
              clAux.AddParam ('   AND (PC_LJPG='+floattostr(frm_principal.x_frente_loja)+')     ');
            clAux.AddParam ('Order by CL_CODI                                                    ');
            clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
            clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
            mostra_mensagem ('Buscando clientes dos pagamentos...');
            gauge1.visible:=true;
            gauge1.progress:=0;
            clAux.Execute;
            clAux.first;
            totcli3 := 0;
            pnGauge1.visible:=true;
            gauge1.visible:=true;
            indGauge:=0;
            totGauge:=clAux.reccount;
            while (not clAux.eof) do
            begin
              campo01 := form_nz(clAux.result('CL_CODI'),6);
              campo02 := form_t(clAux.result('CL_NOME'),40);
              campo03 := form_t(clAux.result('CL_CPF'),14);
              campo04 := form_t(clAux.result('CL_ENDE'),50);
              campo05 := form_nz(clAux.result('CL_LOJA'),2);
              campo06 := form_t(clAux.result('CL_SEXO'),1);
              campo07 := form_t(clAux.result('CL_BAIR'),30);
              campo08 := form_t(clAux.result('CL_CIDA'),20);
              campo09 := form_t(clAux.result('CL_ESTA'),2);
              campo10 := form_t(clAux.result('CL_CEP'),8);
              campo11 := form_t(clAux.result('CL_FONE'),15);
              campo12 := form_t(clAux.result('CL_FAX'),15);
              campo13 := form_t(clAux.result('CL_CELU'),15);
              campo14 := form_data(clAux.result('CL_DTNA'));
              campo15 := form_t(clAux.result('CL_IDEN'),25);
              campo16 := form_t(clAux.result('CL_OEXP'),10);
              campo17 := form_t(clAux.result('CL_ECIV'),1);
              campo18 := form_t(clAux.result('CL_CONJ'),40);
              campo19 := form_t(clAux.result('CL_NPAI'),40);
              campo20 := form_t(clAux.result('CL_NMAE'),40);
              campo21 := form_t(clAux.result('CL_REF1'),40);
              campo22 := form_t(clAux.result('CL_TRF1'),15);
              campo23 := form_t(clAux.result('CL_REF2'),40);
              campo24 := form_t(clAux.result('CL_TRF2'),15);
              campo25 := form_t(clAux.result('CL_EMPR'),30);
              campo26 := form_t(clAux.result('CL_CARG'),20);
              campo27 := form_t(clAux.result('CL_EEMP'),50);
              campo28 := form_t(clAux.result('CL_FEMP'),15);
              campo29 := form_t(clAux.result('CL_REMP'),5);
              campo30 := form_data(clAux.result('CL_DADM'));
              campo31 := form_t(clAux.result('CL_CPRO'),20);
              campo32 := form_nz(clAux.result('CL_SALA')*100,10);
              campo33 := form_nz(clAux.result('CL_LIMC')*100,10);
              campo34 := form_t(clAux.result('CL_CFUN'),1);
              campo35 := form_t(clAux.result('CL_TPRO'),1);
              campo36 := form_t(clAux.result('CL_RSPC'),1);
              campo37 := form_data(clAux.result('CL_DSPC'));
              campo38 := form_data(clAux.result('CL_DREG'));
              campo39 := form_data(clAux.result('CL_VALI'));
              campo40 := form_data(clAux.result('CL_DTCA'));
              campo41 := form_data(clAux.result('CL_ULTC'));
              if (clAux.result('CL_QTDC')<0) then
                campo42 := form_nz(clAux.result('CL_QTDC')*(-100),5)
              else
                campo42 := form_nz(clAux.result('CL_QTDC')*100,5);
              campo43 := form_t(clAux.result('CL_OBSE'),50);
              campo44 := form_t(clAux.result('CL_ALTE'),1);
              campo45 := form_data(clAux.result('CL_DULP'));
              campo46 := form_t(clAux.result('CL_PDC'),4);
              campo47 := form_t(clAux.result('CL_EMAI'),80);
              campo48 := form_t(clAux.result('CL_LIVR'),4);
              campo49 := form_data(clAux.result('CL_TIME'));
              campo50 := 'A';
              WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
                campo06+campo07+campo08+campo09+campo10+
                campo11+campo12+campo13+campo14+campo15+
                campo16+campo17+campo18+campo19+campo20+
                campo21+campo22+campo23+campo24+campo25+
                campo26+campo27+campo28+campo29+campo30+
                campo31+campo32+campo33+campo34+campo35+
                campo36+campo37+campo38+campo39+campo40+
                campo41+campo42+campo43+campo44+campo45+
                campo46+campo47+campo48+campo49+campo50);
              totcli3 := totcli3 + 1;
              clAux.next;
              indGauge:=indGauge+1;
              gauge1.progress:=Round((indGauge/totGauge)*100);
              gauge1.refresh;
            end;
            clAux.desconect;
            clAux.Free;
            CloseFile (arq);
            memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Clientes/Pagtos...: '+form_n(totcli3,10) +'   Arquivo.: '+nome_arq);
            with FLogExportacao do
            begin
              Tabela          := 'CLIENTES/PAGAMENTOS';
              Reg             := totcli3;
            end;

            LogExportacao(FLogExportacao);

            sequencial_operacao := sequencial_operacao + 1;
            memo1.refresh;
          end;
        end;
          {FIM DA EXPORTACAO DE PAGAMENTOS *****}

          {14. - Exportacao dos complementos de clientes --------------------------->}
        if (rdModelo.itemindex=0) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.L'+form_nz(frm_principal.x_frente_loja,2)
        else
        if (rdModelo.itemindex=1) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.MTZ';
        AssignFile (arq, nome_arq);
        if (FileExists(nome_arq)) then
          Append(arq)
        else
          Rewrite (arq);
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('CREDITO',self);
        clAux.ClearSql;
        clAux.AddParam ('Select * From CRECLI_COMP                       ');
        clAux.AddParam ('Where (CC_TIME>=:n_data1) AND                   ');
        clAux.AddParam ('      (CC_TIME<=:n_data2)                       ');
        clAux.AddParam ('Order by CC_CLIE                                ');
        clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
        clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
        mostra_mensagem ('Buscando complementos de clientes...');
        gauge1.visible:=true;
        gauge1.progress:=0;
        clAux.Execute;
        clAux.first;
        totcomp2 := 0;
        pnGauge1.visible:=true;
        gauge1.visible:=true;
        indGauge:=0;
        totGauge:=clAux.reccount;
        while (not clAux.eof) do
        begin
          campo01 := form_nz(clAux.result('CC_CLIE'),6);
          campo02 := form_t(clAux.result('CC_ENDC'),50);
          campo03 := form_t(clAux.result('CC_BAIC'),30);
          campo04 := form_t(clAux.result('CC_CIDC'),20);
          campo05 := form_t(clAux.result('CC_ESTC'),2);
          campo06 := form_t(clAux.result('CC_CEPC'),8);
          campo07 := form_t(clAux.result('CC_NCO1'),50);
          campo08 := form_t(clAux.result('CC_TCO1'),15);
          campo09 := form_nz(clAux.result('CC_CCO1')*100,10);
          campo10 := form_t(clAux.result('CC_NCO2'),50);
          campo11 := form_t(clAux.result('CC_TCO2'),15);
          campo12 := form_nz(clAux.result('CC_CCO2')*100,10);
          campo13 := form_data(clAux.result('CC_TIME'));
          campo14 := 'A';
          WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
            campo06+campo07+campo08+campo09+campo10+
            campo11+campo12+campo13+campo14);
          totcomp2 := totcomp2 + 1;
          clAux.next;
          indGauge:=indGauge+1;
          gauge1.progress:=Round((indGauge/totGauge)*100);
          gauge1.refresh;
        end;
        clAux.desconect;
        clAux.Free;
        CloseFile (arq);
        memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Complementos......: '+form_n(totcomp2,10) +'   Arquivo.: '+nome_arq);

        with FLogExportacao do
        begin
          Tabela          := 'COMPLEMENTOS';
          Reg             := totcomp2;
        end;

        LogExportacao(FLogExportacao);

        sequencial_operacao := sequencial_operacao + 1;
        memo1.refresh;
          {FIM DAS EXPORTACOES DE COMPLEMENTOS ****}


          {15. - Exportacao das outras observacoes de clientes --------------------------->}
        if (rdModelo.itemindex=0) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIOBS.L'+form_nz(frm_principal.x_frente_loja,2)
        else
        if (rdModelo.itemindex=1) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIOBS.MTZ';
        AssignFile (arq, nome_arq);
        if (FileExists(nome_arq)) then
          Append(arq)
        else
          Rewrite (arq);
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('CREDITO',self);
        clAux.ClearSql;
        clAux.AddParam ('Select * From CRECLI_OBS                        ');
        clAux.AddParam ('Where (OB_TIME>=:n_data1) AND                   ');
        clAux.AddParam ('      (OB_TIME<=:n_data2)                       ');
        clAux.AddParam ('Order by OB_CLIE                                ');
        clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
        clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
        mostra_mensagem ('Buscando observações de clientes...');
        gauge1.visible:=true;
        gauge1.progress:=0;
        clAux.Execute;
        clAux.first;
        totobs2 := 0;
        pnGauge1.visible:=true;
        gauge1.visible:=true;
        indGauge:=0;
        totGauge:=clAux.reccount;
        while (not clAux.eof) do
        begin
          campo01 := form_nz(clAux.result('OB_CLIE'),6);
          campo02 := form_t (clAux.result('OB_LIN1'),80);
          campo03 := form_t (clAux.result('OB_LIN2'),80);
          campo04 := form_t (clAux.result('OB_LIN3'),80);
          campo05 := form_t (clAux.result('OB_LIN4'),80);
          campo06 := form_t (clAux.result('OB_LIN5'),80);
          campo07 := form_data(clAux.result('OB_TIME'));
          campo08 := 'A';
          WriteLn (arq,  campo01+campo02+campo03+campo04+
            campo05+campo06+campo07+campo08);
          totobs2 := totobs2 + 1;
          clAux.next;
          indGauge:=indGauge+1;
          gauge1.progress:=Round((indGauge/totGauge)*100);
          gauge1.refresh;
        end;
        clAux.desconect;
        clAux.Free;
        CloseFile (arq);
        memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Observações.......: '+form_n(totobs2,10) +'   Arquivo.: '+nome_arq);
        with FLogExportacao do
        begin
          Tabela          := 'OBS';
          Reg             := totobs2;
        end;

        LogExportacao(FLogExportacao);

        sequencial_operacao := sequencial_operacao + 1;
        memo1.refresh;
          {FIM DAS EXPORTACOES DE OBSERVACOES ****}


          {16. - Exportacao das renegociacoes de contratos --------------------------->}
        if (rdModelo.itemindex=0) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\RENEGOC.L'+form_nz(frm_principal.x_frente_loja,2)
        else
        if (rdModelo.itemindex=1) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\RENEGOC.MTZ';
        AssignFile (arq, nome_arq);
        if (FileExists(nome_arq)) then
          Append(arq)
        else
          Rewrite (arq);
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('CREDITO',self);
        clAux.ClearSql;
        clAux.AddParam ('Select * From CONTRATOS_RENEGOCIADOS            ');
        clAux.AddParam ('Where (CR_TIME>=:n_data1) AND                   ');
        clAux.AddParam ('      (CR_TIME<=:n_data2)                       ');
        clAux.AddParam ('Order by CLIENTE                                ');
        clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
        clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
        mostra_mensagem ('Buscando renegociações de contratos...');
        gauge1.visible:=true;
        gauge1.progress:=0;
        clAux.Execute;
        clAux.first;
        totrenegoc2 := 0;
        pnGauge1.visible:=true;
        gauge1.visible:=true;
        indGauge:=0;
        totGauge:=clAux.reccount;
        while (not clAux.eof) do
        begin
          campo01 := form_nz(clAux.result('CLIENTE'),6);
          campo02 := form_nz(clAux.result('CONTRATO_MESTRE'),6);
          campo03 := form_nz(clAux.result('CONTRATO_ESCRAVO'),6);
          campo04 := form_nz(clAux.result('MENSALIDADE_INICIAL'),2);
          campo05 := form_data(clAux.result('CR_TIME'));
          campo06 := 'A';
          WriteLn (arq,  campo01+campo02+campo03+campo04+campo05+
            campo06);
          totrenegoc2 := totrenegoc2 + 1;
          clAux.next;
          indGauge:=indGauge+1;
          gauge1.progress:=Round((indGauge/totGauge)*100);
          gauge1.refresh;
        end;
        clAux.desconect;
        clAux.Free;
        CloseFile (arq);
        memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Renegociações.....: '+form_n(totrenegoc2,10) +'   Arquivo.: '+nome_arq);

        with FLogExportacao do
        begin
          Tabela          := 'RENEGOCIACOES';
          Reg             := totrenegoc2;
        end;

        LogExportacao(FLogExportacao);

        sequencial_operacao := sequencial_operacao + 1;
        memo1.refresh;
          {FIM DAS EXPORTACOES DE COMPLEMENTOS ****}


          {4A. PARTE- MOVIMENTO DE CHEQUES ****}
          {17. - EXPORTACAO DOS CHEQUES MOVIMENTADOS NO PERIODO E}
          {CHEQUES QUE VENCEM NO PERIODO}
        if (chCheques.checked) then
        begin
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From CRECHMOV               ');
          clAux.AddParam ('Where (((CH_DVTO>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DVTO<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_DTCT>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DTCT<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_TIME>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_TIME<=:n_data2)))         ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME     ');
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando cheques movimentados...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheq2 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            campo01 := form_nz(clAux.result('CH_CODI'),6);
            campo02 := form_t(clAux.result('CH_CCGC'),14);
            campo03 := form_n(clAux.result('CH_BANC'),3);
            campo04 := form_n(clAux.result('CH_NUME'),7);
            campo05 := form_data(clAux.result('CH_DTCT'));
            campo06 := form_t(clAux.result('CH_NOME'),40);
            campo07 := form_t(clAux.result('CH_FONE'),15);
            campo08 := form_nz(clAux.result('CH_LOJA'),2);
            campo09 := form_data(clAux.result('CH_DVTO'));
            campo10 := form_nz(clAux.result('CH_PORT'),4);
            campo11 := form_t(clAux.result('CH_AGEN'),10);
            campo12 := form_data(clAux.result('CH_DTRA'));
            campo13 := form_nz(clAux.result('CH_TRAN'),4);
            campo14 := form_nz(clAux.result('CH_VALO')*100,15);
            campo15 := form_nz(clAux.result('CH_CLIE'),6);
            campo16 := form_t(clAux.result('CH_STAT'),1);
            campo17 := form_t(clAux.result('CH_OBS'),50);
            campo18 := form_data(clAux.result('CH_TIME'));
            campo19 := 'A';
            WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
              campo06+campo07+campo08+campo09+campo10+
              campo11+campo12+campo13+campo14+campo15+
              campo16+campo17+campo18+campo19);
            totcheq2 := totcheq2 + 1;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Cheques pré.......: '+form_n(totcheq2,10) +'   Arquivo.: '+nome_arq);
          with FLogExportacao do
          begin
            Tabela          := 'CHEQUE PRE';
            Reg             := totcheq2;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {18. - EXPORTANDO OS CHEQUES COMPENSADOS QUE VENCEM NO PERIODO}
              {E QUE MOVIMENTARAM NO PERIODO}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From CRECHMVPG               ');
          clAux.AddParam ('Where (((CH_DVTO>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DVTO<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_DTCT>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DTCT<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_TIME>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_TIME<=:n_data2)))         ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME     ');
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando cheques pagos movimentados...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheqpg2 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            campo01 := form_nz(clAux.result('CH_CODI'),6);
            campo02 := form_t(clAux.result('CH_CCGC'),14);
            campo03 := form_n(clAux.result('CH_BANC'),3);
            campo04 := form_n(clAux.result('CH_NUME'),7);
            campo05 := form_data(clAux.result('CH_DTCT'));
            campo06 := form_t(clAux.result('CH_NOME'),40);
            campo07 := form_t(clAux.result('CH_FONE'),15);
            campo08 := form_nz(clAux.result('CH_LOJA'),2);
            campo09 := form_data(clAux.result('CH_DVTO'));
            campo10 := form_nz(clAux.result('CH_PORT'),4);
            campo11 := form_t(clAux.result('CH_AGEN'),10);
            campo12 := form_data(clAux.result('CH_DTRA'));
            campo13 := form_nz(clAux.result('CH_TRAN'),4);
            campo14 := form_nz(clAux.result('CH_VALO')*100,15);
            campo15 := form_nz(clAux.result('CH_CLIE'),6);
            campo16 := form_t(clAux.result('CH_STAT'),1);
            campo17 := form_t(clAux.result('CH_OBS'),50);
            campo18 := form_data(clAux.result('CH_DTPG'));
            campo19 := form_data(clAux.result('CH_TIME'));
            campo20 := 'A';
            WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
              campo06+campo07+campo08+campo09+campo10+
              campo11+campo12+campo13+campo14+campo15+
              campo16+campo17+campo18+campo19+campo20);
            totcheqpg2 := totcheqpg2 + 1;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Cheques compens...: '+form_n(totcheqpg2,10) +'   Arquivo.: '+nome_arq);

          with FLogExportacao do
          begin
            Tabela          := 'CHEQUE COMP';
            Reg             := totcheqpg2;
          end;

          LogExportacao(FLogExportacao);

          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {19. - EXPORTANDO OS CHEQUES DEVOLVIDOS QUE VENCEM NO PERIODO}
              {E QUE MOVIMENTARAM NO PERIODO}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From CRECHDEV                ');
          clAux.AddParam ('Where (((CH_DVTO>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DVTO<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_DTCT>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DTCT<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_DTEM>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DTEM<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_TIME>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_TIME<=:n_data2)))         ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME     ');
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando cheques dev. movimentados...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheqdev2 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            campo01 := form_nz(clAux.result('CH_CLIE'),6);
            campo02 := form_t(clAux.result('CH_CCGC'),14);
            campo03 := form_n(clAux.result('CH_NUME'),7);
            campo04 := form_data(clAux.result('CH_DTCT'));
            campo05 := form_nz(clAux.result('CH_LOJA'),2);
            campo06 := form_data(clAux.result('CH_DTEM'));
            campo07 := form_data(clAux.result('CH_DVTO'));
            campo08 := form_nz(clAux.result('CH_PORT'),4);
            campo09 := form_n(clAux.result('CH_BANC'),3);
            campo10 := form_t(clAux.result('CH_AGEN'),10);
            campo11 := form_nz(clAux.result('CH_VALO')*100,15);
            campo12 := form_t(clAux.result('CH_ALIN'),4);
            campo13 := form_t(clAux.result('CH_OBS'),50);
            campo14 := form_t(clAux.result('CH_NOME'),40);
            campo15 := form_n(clAux.result('CH_TRAN'),4);
            campo16 := form_data(clAux.result('CH_TIME'));
            campo17 := 'A';
            WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
              campo06+campo07+campo08+campo09+campo10+
              campo11+campo12+campo13+campo14+campo15+
              campo16+campo17);
            totcheqdev2 := totcheqdev2 + 1;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Cheques devolv....: '+form_n(totcheqdev2,10) +'   Arquivo.: '+nome_arq);
          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;

              {20. - EXPORTANDO OS CHEQUES DEVOLVIDOS COMPENSADOS QUE VENCEM NO PERIODO}
              {E QUE MOVIMENTARAM NO PERIODO}
          if (rdModelo.itemindex=0) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.L'+form_nz(frm_principal.x_frente_loja,2)
          else
          if (rdModelo.itemindex=1) then
            nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.MTZ';
          AssignFile (arq, nome_arq);
          if (FileExists(nome_arq)) then
            Append(arq)
          else
            Rewrite (arq);
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam ('Select * From CRECHDVPG               ');
          clAux.AddParam ('Where (((CH_DVTO>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DVTO<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_DTCT>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DTCT<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_DTEM>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DTEM<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_DTPG>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_DTPG<=:n_data2)) OR       ');
          clAux.AddParam ('       ((CH_TIME>=:n_data1) AND       ');
          clAux.AddParam ('        (CH_TIME<=:n_data2)))         ');
          if (chExportaSoLoja.checked) then
            clAux.AddParam ('    AND (CH_LOJA='+floattostr(frm_principal.x_frente_loja)+') ');
          clAux.AddParam ('Order by CH_CCGC,CH_BANC,CH_NUME     ');
          clAux.consulta.parambyname('n_data1').AsDateTime := n_data1;
          clAux.consulta.parambyname('n_data2').AsDateTime := n_data2;
          mostra_mensagem ('Buscando cheques dev. pagos movimentados...');
          gauge1.visible:=true;
          gauge1.progress:=0;
          clAux.Execute;
          clAux.first;
          totcheqdvpg2 := 0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            campo01 := form_nz(clAux.result('CH_CLIE'),6);
            campo02 := form_t(clAux.result('CH_CCGC'),14);
            campo03 := form_n(clAux.result('CH_NUME'),7);
            campo04 := form_data(clAux.result('CH_DTCT'));
            campo05 := form_nz(clAux.result('CH_LOJA'),2);
            campo06 := form_data(clAux.result('CH_DTEM'));
            campo07 := form_data(clAux.result('CH_DVTO'));
            campo08 := form_nz(clAux.result('CH_PORT'),4);
            campo09 := form_n(clAux.result('CH_BANC'),3);
            campo10 := form_t(clAux.result('CH_AGEN'),10);
            campo11 := form_nz(clAux.result('CH_VALO')*100,15);
            campo12 := form_data(clAux.result('CH_DTPG'));
            campo13 := form_t(clAux.result('CH_ALIN'),4);
            campo14 := form_nz(clAux.result('CH_VAPG')*100,15);
            campo15 := form_t(clAux.result('CH_OBS'),50);
            campo16 := form_nz(clAux.result('CH_POR2'),4);
            campo17 := form_t(clAux.result('CH_NOME'),40);
            campo18 := form_n(clAux.result('CH_TRAN'),4);
            campo19 := form_data(clAux.result('CH_TIME'));
            campo20 := 'A';
            WriteLn (arq, campo01+campo02+campo03+campo04+campo05+
              campo06+campo07+campo08+campo09+campo10+
              campo11+campo12+campo13+campo14+campo15+
              campo16+campo17+campo18+campo19+campo20);
            totcheqdvpg2 := totcheqdvpg2 + 1;
            clAux.next;
            indGauge:=indGauge+1;
            gauge1.progress:=Round((indGauge/totGauge)*100);
            gauge1.refresh;
          end;
          clAux.desconect;
          clAux.Free;
          CloseFile (arq);
          memo1.lines.Add (' '+form_nz(sequencial_operacao,2)+'. Cheques dev pagos.: '+form_n(totcheqdvpg2,10) +'   Arquivo.: '+nome_arq);
          sequencial_operacao := sequencial_operacao + 1;
          memo1.refresh;
        end;
          {FIM DA EXPORTACAO DE CHEQUES}
          {FIM DE TODAS A EXPORTACAO *****}
        esconde_mensagem;
        LinhaFim :=  memo1.Lines.Count - 1;
        memo1.lines.Add ('   -- Copia de registros concluída -- ');

          {Sumario contendo os totais de registro por arquivo exportado}
        memo1.lines.Add ('');
        memo1.lines.Add ('   -- Total de registros exportados -- ');
        memo1.lines.Add (' -Clientes.............: '+form_n (totcli1+totcli2+totcli3,     10));
        memo1.lines.Add (' -Contratos............: '+form_n (totctr1+totctr2+totctr3,     10));
        memo1.lines.Add (' -Prestações...........: '+form_n (totptr1+totptr2+totptr3,     10));
        memo1.lines.Add (' -Cheques-pré..........: '+form_n (totcheq1+totcheq2,           10));
        memo1.lines.Add (' -Cheques pagos........: '+form_n (totcheqpg1+totcheqpg2,       10));
        memo1.lines.Add (' -Cheques devolvidos...: '+form_n (totcheqdev1+totcheqdev2,     10));
        memo1.lines.Add (' -Cheques devolv. pagos: '+form_n (totcheqdvpg1+totcheqdvpg2,   10));
        memo1.lines.Add (' -Complementos clientes: '+form_n (totcomp1+totcomp2,           10));
        memo1.lines.Add (' -Observações..........: '+form_n (totobs1+totobs2,             10));
        memo1.lines.Add (' -Renegociações........: '+form_n (totrenegoc1+totrenegoc2,     10));

          {Criando arquivo contendo o periodo da exportacao>>>>>}
        if (rdModelo.itemindex=0) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PERIODO.L'+form_nz(frm_principal.x_frente_loja,2)
        else
        if (rdModelo.itemindex=1) then
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PERIODO.MTZ';
        horaexp := TimeToStr(Time);
        dataexp := DateTimeToStr(Date);
        AssignFile (arq,nome_arq);
        Rewrite    (arq);
        WriteLn    (arq,FormatDateTime('dd/mm/yyyy',n_data1));
        WriteLn    (arq,FormatDateTime('dd/mm/yyyy',n_data2));
        WriteLn    (arq,dataexp);
        WriteLn    (arq,horaexp);
        CloseFile  (arq);

          {...Salvando o status em LOG}
        pnGauge1.visible:=false;
        if (not DirectoryExists('C:\NATIVA\CREDITO\MOVIMENTO\LOGS')) then
          CreateDir('C:\NATIVA\CREDITO\MOVIMENTO\LOGS');
        while (Pos('/',data)>0) do
          delete(data,Pos('/',data),1);
        while (Pos(':',hora)>0) do
          delete(hora,Pos(':',hora),1);
        memo1.lines.savetofile('C:\NATIVA\CREDITO\MOVIMENTO\LOGS\LOG_EXP_'+data+'_'+hora+'_'+nome_user+'.LGE');
        BitBtnExportar.enabled:=true;
      finally
        if linhaini > -1 then
          for i:=linhaini to linhafim do
            with FLogExportacao do
            begin
              vlog            := TrimLeft(Copy(Memo1.Lines[i],Pos('.',Memo1.Lines[i]) + 1,Pos(':',Memo1.Lines[i]) - 1));
              Tabela          := TrimLeft(Copy(Vlog,1,Pos('.',VLog) - 1));
              vlog            := TrimLeft(Copy(Memo1.Lines[i],Pos(':',Memo1.Lines[i]) + 1,Length(Memo1.Lines[i])));
              Reg             := StrtofloatN(Copy(Vlog,1,Pos(' ',Vlog) - 1));
              Sucesso         := iifs(BitBtnExportar.enabled,'Com Sucesso','Com Erros');
              if reg > 0 then
                LogExportacao(FLogExportacao,true);
            end;
        Refreshpanel2;
      end{Pegando o nome do usuario responsavel}//MailTo1.enabled:=true;
    ;
  end;
end;

procedure Tfrm_ExportaTrigger.btnExportaClick(Sender: TObject);
begin
  Exportar1.click;
end;

{Remove o arquivo de movimento anterior para que se continue com uma nova exportacao ****}
procedure Tfrm_ExportaTrigger.Removerarquivodemovimentoanterior1Click(Sender: TObject);
var
  codloja: String;
begin
    {...}
  if (frmDialogo.ExibirMensagem ('Confirma remoção do movimento anterior?'
    ,'Exportação de movimento',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    if (rdModelo.itemindex=0) then
    begin
      codloja := form_nz(frm_principal.x_frente_loja,2);
      DeleteFile('C:\NATIVA\CREDITO\MOVIMENTO\LOJA'+codloja+'.ZIP');
    end
    else
      DeleteFile('C:\NATIVA\CREDITO\MOVIMENTO\MATRIZ.ZIP');
end;

procedure Tfrm_ExportaTrigger.Compactararquivos1Click(Sender: TObject);
begin
     {... Compactando os arquivos}
  CompactarArquivo;
end;

procedure Tfrm_ExportaTrigger.btnCompactarClick(Sender: TObject);
begin
  Compactararquivos1.click;
end;


procedure Tfrm_ExportaTrigger.refreshpanel2;
begin
  with QTEste do
  begin
    sql.clear;
    sql.Add('Select Ix_data,Ix_inicio,Ix_Fim,Ix_usuario,Ix_Erro');
    sql.add('From Imp_Exp');
    Sql.Add('Where Ix_LojaOrg = '+floattostr(Frm_principal.x_loja));
    Sql.Add('And   Ix_ImpExp =:ImpExp');
    Parambyname('ImpExp').AsString := 'E';
    Sql.add('Order By Ix_data desc');
    open;
    if eof then
      ultexp.caption := ''
    else
    begin


      if FieldByName('Ix_Erro').AsString = 'Com Erro' then
        UltExp.Color := Clred;

      UltExp.Caption := FormatDateTime('dd/mm/yyyy hh:mm',FieldByName('Ix_Data').AsDateTime)+' de '+
        FormatDateTime('dd/mm/yyyy',FieldByName('Ix_Inicio').AsDateTime)+' até '+
        FormatDateTime('dd/mm/yyyy',FieldByName('Ix_Fim').AsDateTime)+' '+
        'Usuario '+PadR(FieldByName('Ix_Usuario').AsString,17,' ')+' '+
        FieldByName('Ix_Erro').AsString;
    end;

    close;
    Parambyname('ImpExp').AsString := 'I';
    open;

    if eof then
      ultImp.caption := ''
    else
    begin
      if FieldByName('Ix_Erro').AsString = 'Com Erro' then
        UltImp.Color   := Clred;
      UltImp.Caption := FormatDateTime('dd/mm/yyyy hh:mm',FieldByName('Ix_Data').AsDateTime)+
        StringOfChar(' ',30)+
        'Usuario '+PadR(FieldByName('Ix_Usuario').AsString,17,' ')+' '+
        FieldByName('Ix_Erro').AsString;
    end;
  end;
end;

procedure Tfrm_ExportaTrigger.SpeedButton1Click(Sender: TObject);
begin
  frm_cons_impexp := Tfrm_cons_impexp.create(Application);
  frm_cons_impexp.RdTipo.ItemIndex := 0;
  frm_cons_impexp.Btn_procurar.OnClick(Sender);
  frm_cons_impexp.ShowModal;
end;

procedure Tfrm_ExportaTrigger.BitBtnEnviarFTPClick(Sender: TObject);
var
  codloja: String;
begin
  timerMensagem.enabled:=false;
  if (rdModelo.itemindex=0) then
  begin
    Memo1.lines.Add('');
    Memo1.lines.Add(' - Enviando arquivos via FTP - tentativa '+form_n(contFtp,2));
    codloja := form_nz(frm_principal.x_frente_loja,2);
    EnviarFTP('C:\NATIVA\CREDITO\MOVIMENTO\LOJA'+codloja+'.ZIP',
      'LOJA'+codloja+'.ZIP');
  end
  else
  if (rdModelo.itemindex=1) then
  begin
    Memo1.lines.Add('');
    Memo1.lines.Add(' - Enviando arquivos via FTP - tentativa '+form_n(contFtp,2));
    EnviarFTP('C:\NATIVA\CREDITO\MOVIMENTO\MATRIZ.ZIP',
      'MATRIZ.ZIP');
  end;
  timerMensagem.enabled:=true;
end;

procedure Tfrm_ExportaTrigger.BitBtnExportarClick(Sender: TObject);
begin
  Exportar1.click;
end;

procedure Tfrm_ExportaTrigger.BitBtnCompactarClick(Sender: TObject);
begin
  Compactararquivos1.click;
end;

procedure Tfrm_ExportaTrigger.BitBtnEmailClick(Sender: TObject);
var
  Mail : String;
begin
  Mail := 'mailto:digite o email da matriz aqui!';
  ShellExecute(GetDesktopWindow,'open',Pchar(Mail),nil,nil,sw_ShowNormal);
end;

end.
