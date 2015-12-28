unit mem_prnt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus, Buttons, ExtCtrls, ComCtrls, Printers,
  Spin, fileCtrl;

type
  Tfrm_mem_print = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    botao_sair: TPanel;
    btnImprimiri: TSpeedButton;
    btnZooMais: TSpeedButton;
    btnZooMenos: TSpeedButton;
    btnConf: TSpeedButton;
    barra: TStatusBar;
    btnNotePad: TSpeedButton;
    btnConfImp: TSpeedButton;
    barraImpressora: TStatusBar;
    timerImp: TTimer;
    pnPrincipal: TPanel;
    Label18: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Configura1: TMenuItem;
    Sistema1: TMenuItem;
    Impressora1: TMenuItem;
    edtPagina: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    lbTotPag: TLabel;
    Imprimir1: TMenuItem;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    PopupMenuModoImpressao: TPopupMenu;
    N1: TMenuItem;
    MododeimpressoImpressoramatricial1: TMenuItem;
    MododeimpressoImpressoraJatodeTinta1: TMenuItem;
    N2: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure btnImprimiriClick(Sender: TObject);
    procedure btnZooMaisClick(Sender: TObject);
    procedure btnZooMenosClick(Sender: TObject);
    procedure btnNotePadClick(Sender: TObject);
    procedure btnConfImpClick(Sender: TObject);
    procedure timerImpTimer(Sender: TObject);
    procedure Sistema1Click(Sender: TObject);
    procedure Impressora1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Imprimir1Click(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure MododeimpressoImpressoramatricial1Click(Sender: TObject);
    procedure MododeimpressoImpressoraJatodeTinta1Click(Sender: TObject);
    procedure btnConfClick(Sender: TObject);
  private
    { Private declarations }
    procedure VisualizaPagina (direcao: Integer);
    procedure CriaMemo        (indice: Integer);
    procedure DestroiMemo     (indice: Integer);
    procedure AtivaMemo       (indice: Integer);
  public
    { Public declarations }
    vMemo: array[1..500]of TMemo; {vetor de memos criadas em execucao}
    Title: String; {titulo do relatorio visualizado}
    flagPodeImprimir: Boolean; {indica se o que esta sendo jogado em 'AddLine' pode ser impresso ou nao}
    Condensed: Boolean; {determina de o relatorio sai condensado ou nao}
    n_max_lin: Integer; {...}
    memo_max_linha: Integer; {determina a qtde. maxima de linhas impressas em cada memo}
    memo_ativa: Integer; {determina a memo ativa no momento}
    last_memo: Integer; {indice da ultima memo criada}
    tamfonte: Integer; {determina o tamanho da fonte - MODO GRAFICO}
    arquivo: String; {armazena o nome do arquivo do relatorio em questao - MODO NATIVA TEXTO}
    fonte: String; {determina a fonte usada - MODO GRAFICO}
    path_local: String; {determina o caminho da pasta local do sistema}
    flagImprimeCabecalho: Boolean;
    flagImprimeSlip: Boolean;
    //*****************************************
    bloqueiaImpressaoGiza: Boolean;
    //*****************************************
    procedure PrepareReport;
    procedure AddLine (linha:String);

    {procedimentos de impressao do sistema *** --------->}
    procedure imprime_texto_Impress(linhas:TStrings; Titulo,arquivo: String; tudo: Boolean);
    procedure GeraTextoNativa(linhas:TStrings; Titulo,arquivo: String; tudo: Boolean);
    procedure imprime_texto_Grafico (linhas: TStrings; Titulo: String; tudo: Boolean);
  end;

var
  frm_mem_print: Tfrm_mem_print;

implementation

{$R *.DFM}

uses Principal, funcoes1, funcoes2, unDialogo, unImpressoras, unMensagem,
  Un_FechamentoCaixa;


{Inicializando variaveis necessarias para impressao na tela *****}
procedure Tfrm_mem_print.PrepareReport;
begin
  flagImprimeCabecalho := true;
  flagImprimeSlip      := false;
  Memocontrol          := 1;
  last_memo            := 1;
  memo_ativa           := 1;
  edtPagina.text       := ' '+form_n(1,3);
  CriaMemo(Memocontrol);
end;

{Procedimento de insercao de linhas no formulario *****}
procedure Tfrm_mem_print.AddLine(linha:String);
begin
  if (frm_mem_print.flagPodeImprimir) then
    if (vMemo[Memocontrol].lines.count>memo_max_linha) then
    begin
      Memocontrol := Memocontrol+1;
      last_memo   := Memocontrol;
      CriaMemo    (Memocontrol);
      AddLine     (linha);
    end
    else
      vMemo[Memocontrol].lines.add(linha);
end;

{Saindo do formulario *****}
procedure Tfrm_mem_print.Sair1Click(Sender: TObject);
begin
  close;
end;

{Preparando o formulario para visualizacao do relatorio *****}
procedure Tfrm_mem_print.FormActivate(Sender: TObject);
begin
  {configurando condensado}
  if (frm_principal.x_col_impressao=80) then
    Condensed:=false
  else
    Condensed:=true;
  tamfonte := frm_principal.x_tam_fonte;
  arquivo  := frm_principal.x_arq_impressao;

  {configurando o caption do formulario}
  lbTotPag.caption := ' de '+form_n(last_memo,3);
  vMemo[1].bringtofront;
  frm_mem_print.caption := frm_principal.x_sistema+' - Gerador de relatórios ';
  barra.panels[0].text := Title;
  barra.panels[1].text := inttostr(frm_principal.x_col_impressao)+' colunas';
  barra.panels[2].text := frm_principal.x_arq_impressao;
  if (frm_principal.x_modelo_impressao_geral=0) then
    barraimpressora.panels[1].text:='Modo de impressão: [Matricial]'
  else
  if (frm_principal.x_modelo_impressao_geral=1) then
    barraimpressora.panels[1].text:='Modo de impressão: [Jato de tinta]';
  vMemo[1].bringtofront;   
  vMemo[1].setfocus;
end;

{Criacao do formulario ******}
procedure Tfrm_mem_print.FormCreate(Sender: TObject);
begin
  {configuracao de linhas das memos ***}
  flagPodeImprimir := true;
  n_max_lin      := 59;
  memo_max_linha := 210;
  path_local     := frm_principal.x_pathlocal;
end;

{Opcao de saida do sistema *****}
procedure Tfrm_mem_print.btnSairClick(Sender: TObject);
begin
  sair1.click;
end;

{botao de sair *****}
procedure Tfrm_mem_print.botao_sairClick(Sender: TObject);
begin
  sair1.click;
end;

{botao de impressao ******}
procedure Tfrm_mem_print.btnImprimiriClick(Sender: TObject);
var
  arquivo,fonte: String;
  tamfonte: Integer;
  ind: Integer;
begin
  if (not bloqueiaImpressaoGiza) then
  begin
    if (frm_principal.x_modelo_impressao_geral=0) then
      Imprime_texto_Impress(vMemo[1].lines, Title, frm_principal.x_arq_impressao, true)
    else
    if (frm_principal.x_modelo_impressao_geral=1) then
      Imprime_texto_Grafico(vMemo[1].lines, Title, true);
  end
  else
    frmDialogo.ExibirMensagem ('Impressão não permitida!',
      'Impressão de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
end;

{botao de ZOOM+ *****}
procedure Tfrm_mem_print.btnZooMaisClick(Sender: TObject);
var
  ind: Integer;
begin
  ind:=1;
  while (ind<=last_memo) do
  begin
    vMemo[ind].font.size := vMemo[ind].font.size+2;
    ind:=ind+1;
  end;
end;

{botao de ZOO- *****}
procedure Tfrm_mem_print.btnZooMenosClick(Sender: TObject);
var
  ind: Integer;
begin
  ind:=1;
  while (ind<=last_memo) do
  begin
    vMemo[ind].font.size := vMemo[ind].font.size-2;
    ind:=ind+1;
  end;
end;

{Botao de execucao do NOTEPAD com o arquivo especificado *****}
procedure Tfrm_mem_print.btnNotePadClick(Sender: TObject);
var
  result: Integer;
begin
     {gerando a impressao em arquivo --->}
  if (Trim(frm_principal.x_arquivo_winword)='') then
    frmDialogo.ExibirMensagem ('Configure o caminho do executável WINWORD.EXE nas configurações do sistema!',
      'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
      250,200)
  else
  begin
    GeraTextoNativa (vMemo[1].lines, Title, frm_principal.x_arq_impressao, true);
    result := winexec (Pchar(frm_principal.x_arquivo_winword+' '+
      path_local+'\'+frm_principal.x_arq_impressao),1);
    if (result=0) then
      frmDialogo.ExibirMensagem ('O sistema está sem memória para executar esta operação!',
        'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
        250,200);
    if (result=ERROR_BAD_FORMAT) then
      frmDialogo.ExibirMensagem ('O arquivo do word '+frm_principal.x_arquivo_winword+' é inválido!',
        'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
        250,200);
    if (result=ERROR_FILE_NOT_FOUND) then
      frmDialogo.ExibirMensagem ('O arquivo do word '+frm_principal.x_arquivo_winword+' não foi encontrado!',
        'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
        250,200);
    if (result=ERROR_PATH_NOT_FOUND) then
      frmDialogo.ExibirMensagem ('O caminho '+frm_principal.x_arquivo_winword+' é inválido!',
        'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
        250,200);
  end;
end;

{Chamando o dialogo de impressora ***}
procedure Tfrm_mem_print.btnConfImpClick(Sender: TObject);
begin
  frm_principal.ChamandoImpressoras;
end;

{Timer que imprime a impressora ativa no sistema ****}
procedure Tfrm_mem_print.timerImpTimer(Sender: TObject);
begin
  try
//       barraimpressora.panels[0].text:='Impressora ativa: ['+BuscaImpressoraPadrao+']';
  except
  end;
end;

procedure Tfrm_mem_print.Sistema1Click(Sender: TObject);
begin
  btnConf.click;
end;

procedure Tfrm_mem_print.Impressora1Click(Sender: TObject);
begin
  btnConfImp.click;
end;

procedure Tfrm_mem_print.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

{Proc. de facilitar visualizacao das paginas *****}
procedure Tfrm_mem_print.VisualizaPagina (direcao: Integer);
begin
  if (direcao=-1) then
  begin
    if (memo_ativa>1) then
    begin
      memo_ativa:=memo_ativa-1;
      AtivaMemo(memo_ativa);
    end;
  end
  else
  if (direcao=1) then
  begin
    if (memo_ativa<last_memo) then
    begin
      memo_ativa:=memo_ativa+1;
      AtivaMemo(memo_ativa);
    end;
  end
  else
  if (direcao=0) then {primeira pagina}
  begin
    memo_ativa:=1;
    AtivaMemo(memo_ativa);
  end
  else
  if (direcao=last_memo) then {ultima pagina}
  begin
    memo_ativa:=last_memo;
    AtivaMemo(memo_ativa);
  end;
  edtPagina.text := ' '+form_n(memo_ativa,3);
end;

{Botao de atalho para pular paginas ***}

{Procedimento encarregado de criar as memos em tempo de execucao *****}
procedure Tfrm_mem_print.CriaMemo(indice: Integer);
begin
  vMemo[indice] := TMemo.create(frm_mem_print);
  vMemo[indice].parent := frm_mem_print;
  vMemo[indice].align := alClient;
  vMemo[indice].font.color := clBlack;
  vMemo[indice].font.name := 'Courier New';
  vMemo[indice].font.size := 9;
  vMemo[indice].ScrollBars := ssBoth;
  vMemo[indice].lines.clear;
end;

{Procedimento encarregado de destruir a memo *****}
procedure Tfrm_mem_print.DestroiMemo(indice: Integer);
begin
  vMemo[indice].Free;
end;

{Procedimento encarregado de ativar uma memo *****}
procedure Tfrm_mem_print.AtivaMemo(indice: Integer);
begin
  vMemo[indice].bringtofront;
end;

{Saida do formulario de impressao *****}
procedure Tfrm_mem_print.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ind: Integer;
begin
  ind:=1;
  while (ind<=last_memo) do
  begin
    DestroiMemo(ind);
    ind:=ind+1;
  end;
  bloqueiaImpressaoGiza := false;
end;


{Imprime o texto direto em um arquivo de nome configuravel ---}
{O arquivo, então, pode ser impresso pelo utilitario IMPRESS.EXE versão 1.0}
{Os relatorios impressos pelo utilitario terminam com o caractere chr(18), portanto}
procedure Tfrm_mem_print.imprime_texto_Impress (linhas: TStrings; Titulo,
  arquivo: String; tudo: Boolean);
var
  arq: textfile;
  ind,maxcol: Integer;
  cont: Longint;
  controle: Char;
  memo_control: Byte;
  memo:array[1..500] of TStrings;
  P_linhas: TStrings;
  result,inclin: Integer;
  FlagSalto: String;
begin
  try
        {pegando a configuracao de qtde.de colunas do rel. 80/132 ---}
    if not DirectoryExists(path_local) then
      CreateDir (path_local);
    AssignFile   (arq, path_local+'\'+arquivo);
    Rewrite      (arq);
    maxcol := frm_principal.x_col_impressao;
    memo_control:= 1;
    ind := 1;
    while (ind<=frm_mem_print.last_memo) do
    begin
      memo[ind]:=frm_mem_print.vMemo[ind].lines;
      ind:=ind+1;
    end;
    inclin:=1;
    P_linhas:=linhas;
    with (P_linhas) do
    begin
      if titulo<>'#N' then
        if (frm_principal.x_Fecha_caixa) then
        begin
//               if (flagImprimeCabecalho) then
//               begin
                    {cabecalho geral dos relatórios *** }
                    {Configurado para impressao 132cols., condensado}
          if (not flagImprimeSlip) then
          begin
            if (maxcol=80) or (maxcol=40) then
              WriteLn(arq,form_TC2(frm_principal.x_empresa,35,' ')+'NATIVA SOFT INFORMATICA LTDA.'+form_tce(frm_principal.x_pathlocal,16))
            else
              WriteLn(arq,form_TC2(frm_principal.x_empresa,55,' ')+'NATIVA SOFT INFORMATICA LTDA.'+form_tce(frm_principal.x_sistema,48));
            if (maxcol=80) or (maxcol=40) then
              Writeln (arq, form_TC2(Titulo, 45, ' ')+' em: '+FormatDateTime('dd/mm/yyyy',frm_principal.x_data_trabalho)+' '+FormatDateTime('hh:nn:ss',time)+' Pag: '+form_nz(1, 3)+'  ')
            else
              Writeln (arq, form_TC2(Titulo, 99, ' ')+' em: '+FormatDateTime('dd/mm/yyyy',frm_principal.x_data_trabalho)+' '+FormatDateTime('hh:nn:ss',time)+' Pag: '+form_nz(1, 3));
            Writeln (arq, form_TC2('-',maxcol,'-'));
          end;
        end
        else
          Writeln (arq, form_TC2(' ',maxcol,' '))//            end;
      ;
      cont:=0;
      while (cont<P_Linhas.count) do
      begin
        if (sem_brancos(P_Linhas[cont])='') then
          Writeln (arq, form_tc(' ',maxcol,' '))
        else
          Writeln (arq, form_tc2(P_Linhas[cont],maxcol,' '));
        cont:=cont+1;
        if ((tudo) and (memo_control<>frm_mem_print.last_memo) and (cont=P_Linhas.count)
          and (frm_mem_print.memo_max_linha=(cont-1))) then
        begin
          cont :=0;
          memo_control := memo_control+1;
          P_Linhas     := memo[memo_control];
        end;
      end;
    end;
    frm_mem_print.n_max_lin:= 59;
    Writeln (arq, chr(18)); {caracter usado para fim da impressao--}
    CloseFile  (arq);

        {IMPORTANTE: O aplicativo deve estar no local especificado---}
        {Passando o arquivo como parametro para o utilitario de impressao ***}
    if (flagImprimeSlip) then
    begin
      flagSalto:='1';
      result := WinExec (Pchar(frm_principal.x_pathsystem+'\SLIP.EXE '+
        'C:\NATIVA\VENDAS\'+arquivo+' '+
        inttostr(maxcol)+' '+
        inttostr(frm_principal.x_impressora)+' '+
        frm_principal.x_comando+' '+
        flagSalto),
        SW_SHOW);

            {Testando a execucao do program - Fica TRANSPARENTE para o usuario---}
      if (result=0) then
        frmDialogo.ExibirMensagem ('O sistema está sem memória! Tente fechar alguns aplicativos...',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      if (result=ERROR_BAD_FORMAT) then
        frmDialogo.ExibirMensagem ('O arquivo SLIP.EXE é inválido!',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      if (result=ERROR_FILE_NOT_FOUND) then
        frmDialogo.ExibirMensagem ('O programa SLIP.EXE não foi encontrado!',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      if (result=ERROR_PATH_NOT_FOUND) then
        frmDialogo.ExibirMensagem ('O caminho especificado é inválido!',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
    end
    else
    begin
      flagSalto:='1';
      result := WinExec (Pchar(frm_principal.x_pathsystem+'\IMPRESS.EXE '+
        'C:\NATIVA\VENDAS\'+arquivo+' '+
        inttostr(maxcol)+' '+
        inttostr(frm_principal.x_impressora)+' '+
        frm_principal.x_comando+' '+
        flagSalto),
        SW_SHOW);

            {Testando a execucao do program - Fica TRANSPARENTE para o usuario---}
      if (result=0) then
        frmDialogo.ExibirMensagem ('O sistema está sem memória! Tente fechar alguns aplicativos...',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      if (result=ERROR_BAD_FORMAT) then
        frmDialogo.ExibirMensagem ('O arquivo IMPRESS.EXE é inválido!',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      if (result=ERROR_FILE_NOT_FOUND) then
        frmDialogo.ExibirMensagem ('O programa IMPRESS.EXE não foi encontrado!',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      if (result=ERROR_PATH_NOT_FOUND) then
        frmDialogo.ExibirMensagem ('O caminho especificado é inválido!',
          'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
    end;
  except
    esconde_mensagem;
    frmDialogo.ExibirMensagem ('Um erro ocorreu na tentativa de imprimir!',
      'Impress',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
  end;
end;


{Procedimento que gera o arquivo-texto no diretorio CONTAS ***}
{Para ser aberto por um editor simples ***}
procedure Tfrm_mem_print.GeraTextoNativa (linhas: TStrings; Titulo,arquivo: String;
  tudo: Boolean);
var
  arq: textfile;
  ind,maxcol: Integer;
  cont: Longint;
  controle: Char;
  memo_control: Byte;
  memo:array[1..500] of TStrings;
  P_linhas: TStrings;
  result,inclin: Integer;
  FlagSalto: String;
begin
  try
        {pegando a configuracao de qtde.de colunas do rel. 80/132 ---}
    if not DirectoryExists(path_local) then
      CreateDir(path_local);
    AssignFile (arq, path_local+'\'+arquivo);
    Rewrite    (arq);
    maxcol := frm_principal.x_col_impressao;
    memo_control:= 1;
    ind := 1;
    while (ind<=frm_mem_print.last_memo) do
    begin
      memo[ind]:=frm_mem_print.vMemo[ind].lines;
      ind:=ind+1;
    end;
    inclin:=1;
    P_linhas:=linhas;
    with (P_linhas) do
    begin
      if titulo<>'#N' then
        if (flagImprimeCabecalho) then
        begin
                    {cabecalho geral dos relatórios *** }
                    {Configurado para impressao 132cols., condensado}
          if (maxcol=80) or (maxcol=40) then
            Writeln (arq,form_TC2(frm_principal.x_empresa,35,' ')+'NATIVA SOFT INFORMATICA LTDA.'+form_tce('Contas',16))
          else
            Writeln (arq,form_TC2(frm_principal.x_empresa,55,' ')+'NATIVA SOFT INFORMATICA LTDA.'+form_tce(frm_principal.x_sistema,48));
          if (maxcol=80) or (maxcol=40) then
            Writeln (arq, form_TC2(Titulo, 45, ' ')+' em: '+FormatDateTime('dd/mm/yyyy',frm_principal.x_data_trabalho)+' '+FormatDateTime('hh:nn:ss',time)+' Pag: '+form_nz(1, 3)+'  ')
          else
            Writeln (arq, form_TC2(Titulo, 99, ' ')+' em: '+FormatDateTime('dd/mm/yyyy',frm_principal.x_data_trabalho)+' '+FormatDateTime('hh:nn:ss',time)+' Pag: '+form_nz(1, 3));
          Writeln (arq, form_TC2('-',maxcol,'-'));
        end
        else
          Writeln (arq, form_TC2(' ',maxcol,' '));
      cont:=0;
      while (cont<P_Linhas.count) do
      begin
        if (sem_brancos(P_Linhas[cont])='') then
          Writeln (arq, form_tc(' ',maxcol,' '))
        else
          Writeln (arq, form_tc2(P_Linhas[cont],maxcol,' '));
        cont:=cont+1;
        if ((tudo) and (memo_control<>frm_mem_print.last_memo) and (cont=P_Linhas.count)
          and (frm_mem_print.memo_max_linha=(cont-1))) then
        begin
          cont :=0;
          memo_control := memo_control+1;
          P_Linhas     := memo[memo_control];
        end;
      end;
    end;
    frm_mem_print.n_max_lin:= 59;
    Writeln (arq, chr(18)); {caractere usado para fim da impressao--}
    CloseFile  (arq);
  except
    esconde_mensagem;
    frmDialogo.ExibirMensagem ('Um erro ocorreu na tentativa de imprimir o relatório!',
      'Impress',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
      250,200);
  end;
end;

procedure Tfrm_mem_print.Imprimir1Click(Sender: TObject);
begin
  btnImprimiri.click;
end;

{*** Rotina de impressao de relatorios em impressoras Jato de tinta e Laser - IMPRESSAO EM CANVAS}
{Solucao definitiva para o problema das impressoes de relatorios ***}
procedure Tfrm_mem_print.imprime_texto_Grafico (linhas: TStrings; Titulo: String; tudo: Boolean);
var
  arq: textfile;
  ind,maxcol: Integer;
  cont: Longint;
  controle: Char;
  memo_control: Byte;
  memo:array[1..500] of TStrings;
  P_linhas: TStrings;
  qtdelinhas,altura,result,linha: Integer;
  FlagSalto: String;
  paginas,maxlinhas: Integer;
begin
      {pegando a configuracao de qtde.de colunas do rel. 80/132 ---}
  maxcol := frm_principal.x_col_impressao;
  if (maxcol=132) then
  begin
    Printer.Canvas.font.name:='Courier New';
    Printer.Canvas.font.size:=9;
    Printer.Orientation:=poLandscape;
    maxlinhas:=55;
  end
  else
  if (maxcol=80) or (maxcol=40) then
  begin
    Printer.Canvas.font.name:='Courier New';
    Printer.Canvas.font.size:=11;
    Printer.Orientation:=poPortrait;
    if (maxcol=40) and (Title= 'CONFERENCIA DE CAIXA') then
      maxlinhas := 55
    else
      maxlinhas:=55;
  end;
  Printer.BeginDoc;
  memo_control:= 1;
  ind := 1;
  while (ind<=frm_mem_print.last_memo) do
  begin
    memo[ind]:=frm_mem_print.vMemo[ind].lines;
    ind:=ind+1;
  end;
  P_linhas:=linhas;
  linha:=10;
  altura:=Printer.Canvas.TextHeight('A');
  qtdelinhas:=0;
  paginas:=1;
  with (P_linhas) do
  begin
    if titulo<>'#N' then
      if (frm_principal.x_Fecha_caixa) then
        if (flagImprimeCabecalho) then
        begin
                    {cabecalho geral dos relatórios *** }
                    {Configurado para impressao 132cols., condensado}
          if (maxcol=80)or (maxcol=40)  then
            Printer.Canvas.TextOut(0,linha,form_TC2(frm_principal.x_empresa,35,' ')+'NATIVA SOFT INFORMATICA LTDA.'+form_tce('Contas',16))
          else
            Printer.Canvas.TextOut(0,linha,form_TC2(frm_principal.x_empresa,55,' ')+'NATIVA SOFT INFORMATICA LTDA.'+form_tce(frm_principal.x_sistema,48));
          linha := linha + altura;
          if (maxcol=80)or (maxcol=40)  then
            Printer.Canvas.TextOut(0,linha,form_TC2(Titulo, 45, ' ')+' em: '+FormatDateTime('dd/mm/yyyy',frm_principal.x_data_trabalho)+' '+FormatDateTime('hh:nn:ss',time)+' Pag: '+form_nz(1, 3)+'  ')
          else
            Printer.Canvas.TextOut(0,linha,form_TC2(Titulo, 99, ' ')+' em: '+FormatDateTime('dd/mm/yyyy',frm_principal.x_data_trabalho)+' '+FormatDateTime('hh:nn:ss',time)+' Pag: '+form_nz(1, 3));
          linha := linha + altura;
          Printer.Canvas.TextOut(0,linha,form_TC2('-',maxcol,'-'));
          linha := linha + altura;
          qtdelinhas := qtdelinhas + 1;
        end;
    cont:=0;
    while (cont<P_Linhas.count) do
    begin
      if (sem_brancos(P_Linhas[cont])='') then
        Printer.Canvas.TextOut(0,linha,form_tc(' ',maxcol,' '))
      else
        Printer.Canvas.TextOut(0,linha,form_tc2(P_Linhas[cont],maxcol,' '));
      linha:=linha+altura;
      qtdelinhas:=qtdelinhas+1;
      cont:=cont+1;
      if ((tudo) and
        (memo_control<>frm_mem_print.last_memo) and
        (cont=P_Linhas.count) and
        (frm_mem_print.memo_max_linha=(cont-1))) then
      begin
        cont         := 0;
        memo_control := memo_control+1;
        P_Linhas     := memo[memo_control];
      end;
      if (qtdelinhas>maxlinhas) or
        (P_Linhas[cont]=chr(12)+form_tc(' ',maxcol-1,' ')) then
      begin
        if (P_Linhas[cont]=chr(12)+form_tc(' ',maxcol-1,' ')) then
          cont:=cont+1;
        linha:=(maxlinhas+3)*altura;
        if (flagImprimeCabecalho) then
          Printer.Canvas.TextOut(0,linha,form_TC2('-',maxcol,'-'));
        linha:=linha+altura;
        if (flagImprimeCabecalho) then
          Printer.Canvas.TextOut(0,linha,form_TC2(' ',maxcol-18,' ')+'Pagina...: '+form_nz(paginas,5));
        paginas:=paginas+1;
        if (flagImprimeCabecalho) then
          Printer.NewPage;
        qtdelinhas:=0;
        linha:=15;
      end;
    end;
    linha:=(maxlinhas+3)*altura;
    if (flagImprimeCabecalho) then
      Printer.Canvas.TextOut(0,linha,form_TC2('-',maxcol,'-'));
    linha:=linha+altura;
    if (flagImprimeCabecalho) then
      Printer.Canvas.TextOut(0,linha,form_TC2(' ',maxcol-18,' ')+'Pagina...: '+form_nz(paginas,5));
  end;
  frm_mem_print.n_max_lin:= 59;
  Printer.EndDoc;
end;

procedure Tfrm_mem_print.btnPrimeiroClick(Sender: TObject);
begin
  VisualizaPagina(0); {primeira pagina}
end;

procedure Tfrm_mem_print.btnAnteriorClick(Sender: TObject);
begin
  VisualizaPagina(-1);
end;

procedure Tfrm_mem_print.btnProximoClick(Sender: TObject);
begin
  VisualizaPagina(+1);
end;

procedure Tfrm_mem_print.btnUltimoClick(Sender: TObject);
begin
  VisualizaPagina(last_memo); {ultima pagina}
end;

procedure Tfrm_mem_print.MododeimpressoImpressoramatricial1Click(Sender: TObject);
begin
  frm_principal.x_modelo_impressao_geral := 0;
  if (frm_principal.x_tipo_funcionamento_sistema=0) then
    frm_principal.GravaConfigLocal_Atdo
  else
  if (frm_principal.x_tipo_funcionamento_sistema=1) then
    frm_principal.GravaConfigLocal_Caixa;
  if (frm_principal.x_modelo_impressao_geral=0) then
    barraimpressora.panels[1].text:='Modo de impressão: [Matricial]'
  else
  if (frm_principal.x_modelo_impressao_geral=1) then
    barraimpressora.panels[1].text:='Modo de impressão: [Jato de tinta]';
end;

procedure Tfrm_mem_print.MododeimpressoImpressoraJatodeTinta1Click(
  Sender: TObject);
begin
  frm_principal.x_modelo_impressao_geral := 1;
  if (frm_principal.x_tipo_funcionamento_sistema=0) then
    frm_principal.GravaConfigLocal_Atdo
  else
  if (frm_principal.x_tipo_funcionamento_sistema=1) then
    frm_principal.GravaConfigLocal_Caixa;
  if (frm_principal.x_modelo_impressao_geral=0) then
    barraimpressora.panels[1].text:='Modo de impressão: [Matricial]'
  else
  if (frm_principal.x_modelo_impressao_geral=1) then
    barraimpressora.panels[1].text:='Modo de impressão: [Jato de tinta]';
end;

procedure Tfrm_mem_print.btnConfClick(Sender: TObject);
begin
  PopupMenuModoImpressao.PopUp(400,10);
end;

end.
