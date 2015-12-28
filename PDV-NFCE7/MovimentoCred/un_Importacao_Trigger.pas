{ATENCAO: Para que esta rotina funcione, devem estar corretamente configurados os 'objetos' relativos}
{         ao esquema de importacao/exportacao, p.ex:}
{         (1) Marcacao do campo ??_TIME nos registros - gravacao no proprio codigo do programa}
{         (2) Os 'triggers' de EXCLUSAO (nao pode haver de INCLUSAO/ALTERACAO)}
{         (3) O campo 'LOJA' da configuracao local, e a config. se vai trabalhar como MATRIZ ou LOJA}
{         (4) Os campos dos arquivos de MOVIMENTO_?????}
{         (5) A data do sistema (no caso, do computador)}

{*** ATENCAO: Esta rotina de importacao realiza checagem do tamanho dos registros
 dos arquivos CRECHDEV,CRECHDVPG,CRECLI,CRECTABR,CREPRABR}

{ATENCAO: - A MATRIZ NAO IMPORTA 'EXCLUSOES', E DE CLIENTE, SO PEGA INCLUSAO/ALTERACAO DE QUEM}
{           TEVE CONTRATO/PRESTACAO 'NOVOS'}

{ATENCAO: - 'POLITICA' PARA O CHEQUES AINDA NAO DEFINIDA}

unit un_Importacao_Trigger;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Buttons, StdCtrls, ExtCtrls, Gauges, Db, DBTables, Grids,
  DBGrids, FileCtrl, Inifiles,classetxt2,ClasseExport,funcoesglobais;

type
  Tfrm_ImportaTrigger = class(TForm)
    Memo1: TMemo;
    Panel3: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    gbDatas: TGroupBox;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulario1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    pnGauge1: TPanel;
    Gauge1: TGauge;
    rdModelo: TRadioGroup;
    Importarmovimento1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    pnLoja: TPanel;
    edtLoja: TMaskEdit;
    chTodas: TCheckBox;
    btnCompactar: TButton;
    btnImporta: TSpeedButton;
    qTeste: TQuery;
    btnReceberFTP: TButton;
    Panel2: TPanel;
    UltImp: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    UltExp: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtnReceberFTP: TBitBtn;
    BitBtnDescompactar: TBitBtn;
    BitBtnImportar: TBitBtn;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulario1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaDblClick(Sender: TObject);
    procedure rdModeloClick(Sender: TObject);
    procedure Importarmovimento1Click(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
    procedure btnCompactarClick(Sender: TObject);
    procedure btnReceberFTPClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtnReceberFTPClick(Sender: TObject);
    procedure BitBtnDescompactarClick(Sender: TObject);
    procedure BitBtnImportarClick(Sender: TObject);
  private
    procedure deletacontratos;
    procedure refreshpanel2;
    { Private declarations }
  public
    { Public declarations }
    procedure LimparEdits;
    procedure DeletaCliente(codigo: String);
    procedure DeletaComplemento(codigo: String);
    procedure DeletaObservacao(codigo: String);
    procedure DeletaContrato(cliente,codigo: String);
    procedure DeletaContratoRenegociado(cliente,mestre,escravo: String);
    procedure DeletaPrestacao(cliente,codigo,prestacao: String);
    procedure DeletaCheque(cgc,banco,numero: String);
    procedure DeletaChequePg(cgc,banco,numero: String);
    procedure DeletaChequeDev(cgc,banco,numero: String);
    procedure DeletaChequeDevPg(cgc,banco,numero: String);
    procedure ExcluiPrestacoesAlemContrato(cliente,contrato,qpre: Real);
    procedure deletatodosusers;
    procedure deletatodosperms;
    procedure deletatodoslojas;
    function  Posicao(caract: Char; linha: String):Integer;
    function  ChequeExiste(cgc,banco,numero: String):Boolean;
    function VerificaQtdePrestacoesNoContrato(cliente,contrato: Real):Real;
  end;

var
  frm_ImportaTrigger: Tfrm_ImportaTrigger;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar, unDialogo,
  unMensagem, cliente, contratos, prestcontrato, F8Lojas, cheques, chequespg,
  chequesdev, chequesdvpg, DM3, un_Importacao_FTP, mem_prnt, credito,
  un_Importacao_FTP_Crediario, Un_ConsImpExp, DM10, unRecCheqDev, DM1;

procedure Tfrm_ImportaTrigger.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ImportaTrigger.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ImportaTrigger.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key = vk_f8)  then
    SpeedButton1.onClick(sender);
end;

procedure Tfrm_ImportaTrigger.Limparformulario1Click(Sender: TObject);
begin
  edtLoja.text:='';
  pnLoja.caption:='';
  chTodas.checked:=true;   
  LimparEdits;
end;

procedure Tfrm_ImportaTrigger.LimparEdits;
begin
  memo1.lines.clear;
end;

procedure Tfrm_ImportaTrigger.FormCreate(Sender: TObject);
begin
     {***}
  if (frm_principal.x_tipo_exportacao=1) then
    btnReceberFTP.enabled:=true
  else
  if (frm_principal.x_tipo_exportacao=0) then
    btnReceberFTP.enabled:=false;

     {***}
  if (not DirectoryExists('C:\NATIVA\CREDITO\MOVIMENTO')) then
  begin
    CreateDir('C:\NATIVA');
    CreateDir('C:\NATIVA\CREDITO');
    CreateDir('C:\NATIVA\CREDITO\MOVIMENTO');
  end;

     {***}
  rdModelo.itemindex:=frm_principal.x_tipo_loja;
  rdModelo.enabled:=false;
  if (rdModelo.itemindex=1) then
    panel1.visible:=true
  else
  if (rdModelo.itemindex=0) then
    panel1.visible:=false;
  refreshpanel2;

end;

procedure Tfrm_ImportaTrigger.edtLojaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ImportaTrigger.edtLojaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codigo: String;
begin
  if (key=13) then
  begin
    codigo:=Trim(edtLoja.text);
    if (codigo<>'') then
    begin
      pnLoja.caption:=ProcuraNomeLoja(strtofloat(codigo),self);
      edtLoja.text:=form_nz(strtofloat(codigo),2);
    end;
    btnImporta.click;
  end;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLoja;
      showmodal;
    end;
end;

procedure Tfrm_ImportaTrigger.edtLojaDblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja;
    showmodal;
  end;
end;

procedure Tfrm_ImportaTrigger.rdModeloClick(Sender: TObject);
begin
  if (rdModelo.itemindex=1) then
  begin
    edtLoja.enabled:=true;
    chTodas.enabled:=true;
  end
  else
  if (rdModelo.itemindex=0) then
  begin
    edtLoja.enabled:=false;
    chTodas.enabled:=false;
  end;
end;

{Rotina de importacao do movimento ****}
procedure Tfrm_ImportaTrigger.Importarmovimento1Click(Sender: TObject);
var
  clCliente: TClassCliente;
  clTrigger,clComp,clObs,clRenegoc: TClassAuxiliar;
  clContrato: TClassContrato;
  clPrestacao: TClassPrestContrat;
  clCheque: TClassCheque;
  clChequePg: TClassChequePg;
  clChequeDev: TClassChequeDev;
  clChequeDvPg: TClassChequeDevPg;
  clRemove: TClassAuxiliar;
  clAux,clLoja,clBloq: TClassAuxiliar;
  indGauge,totGauge: Integer;
  campo01,campo02,campo03,campo04,campo05,campo06,campo07,campo08,campo09,campo10: String;
  campo11,campo12,campo13,campo14,campo15,campo16,campo17,campo18,campo19,campo20: String;
  campo21,campo22,campo23,campo24,campo25,campo26,campo27,campo28,campo29,campo30: String;
  campo31,campo32,campo33,campo34,campo35,campo36,campo37,campo38,campo39,campo40: String;
  campo41,campo42,campo43,campo44,campo45,campo46,campo47,campo48,campo49,campo50: String;
  arq,arqReg: TextFile;
  LogIni: TiniFile;
  ultima_importacao,mensagem_erro,cgc,banco,numero: String;
  totcheqdvpg,totcheqdev,totcheq,totcheqpg,pos,totcli,totctr,totptr: Integer;
  totcheqdvpg2,totcheqdev2,totcheq2,totcheqpg2,totcli2,totctr2,totptr2: Integer;
  totcomp,totcomp2,totbloq,totbloq2: Integer;
  totobs,totobs2: Integer;
  totrenegoc,totrenegoc2: Integer;
  nome_arq,codloja,cliente,prestacao: String;
  mestre,escravo: String;
  continua,continua2: Boolean;
  data,hora,nome_user,linha: String;
  flag_erro_crecli,flag_erro_crectabr,flag_erro_creprabr: Boolean;
  flag_erro_cheqdvpg,flag_erro_cheqdev,flag_erro_cheqpre,flag_erro_cheqprepg: Boolean;
  flag_erro_users,flag_erro_perms,flag_erro_lojas: Boolean;
  TS1,TS2: TDateTime; {timeStamp}
  result,tam: Integer;
  opX,op,codigo: String;
  data1,data2: String;
  clExp: TClassExport;
  query1:tquery;
  i,LinhaIni,LinhaFim:Integer;
  fLogExportacao:TLogExpImp;
  FArq,Vlog:String;
  clPerms,clUsers,clCreloja: TClassAuxiliar;
  multa,mora: Real;
begin
   {CRITICA}
  if (rdModelo.itemindex=1) and (Trim(edtLoja.text)='') and (not chTodas.checked) then
  begin
    frmDialogo.ExibirMensagem ('A loja deve ser escolhida para importação!'
      ,'Importação',[mbOk],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtLoja.setfocus;
    continua:=false;
  end
  else
    continua:=true;

   {...}
  if (continua) then
    if (frmDialogo.ExibirMensagem ('Confirma importação?'
      ,'Importação de movimento',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      try
        nome_user := 'NATIVA';
        LinhaIni := -1;

        with FLogExportacao do
        begin
          ImpExp  := 'I';
          data    := Now();
          inicio  := frm_principal.x_data_trabalho;
          Fim     := frm_principal.x_data_trabalho;
          LojaOrg := frm_principal.x_frente_loja;
          FArq    := CaminhoExtensao('C:\NATIVA\CREDITO\MOVIMENTO\',['.MTZ']);
          if (FArq <> '') or  (UpperCase(ExtractFileExt(FArq)) = '.MTZ')  then
            LojaDest := -1
          else
            try
              LojaDest := StrtofloatN(Copy(FArq,System.Pos('.',FArq) + 1,Length(FArq)))
            except
                 //
            end;
        end;


          {...}
        data := datetostr(frm_principal.x_data_trabalho);
        hora := timetostr(time);
        if (not DirectoryExists('C:\NATIVA\CREDITO\MOVIMENTO')) then
          CreateDir ('C:\NATIVA\CREDITO\MOVIMENTO');

          {... Gravacao em arquivo dos registros que entraram}
        AssignFile (arqreg, 'C:\NATIVA\CREDITO\MOVIMENTO\REGIMP.TXT');
        Rewrite    (arqreg);

          {a) MODELO DE IMPORTACAO DAS LOJAS}
        if (rdModelo.itemindex=0) then
        begin
              {Pegando o periodo exportado>>>>}
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PERIODO.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            ReadLn     (arq, data1);
            ReadLn     (arq, data2);
            CloseFile  (arq);
            DeleteFile (nome_arq);
          end
          else
          begin
            data1:='';
            data2:='';
          end;

              {Pegando as lojas}
          memo1.lines.clear;
          memo1.lines.Add ('');
          memo1.lines.Add ('      Status da importação - Data/Hora: '+data+' '+hora+'  Usuario: '+nome_user);
          if (data1<>'') then
          begin
            memo1.lines.Add (' Movimento enviado pela matriz...: '+data1+' a '+data2);
            try
              FLogExportacao.inicio  := StrtoDateN(Data1);
              FLogExportacao.Fim     := StrtoDateN(Data2);
            except
                  //
            end;
          end;    
          memo1.lines.Add ('---------------------------------------------------------------------------------');
          if LinhaIni = -1 then
            LinhaINi := Memo1.Lines.Count;

              {1. - Clientes----------------------------------------------->}
          WriteLn (arqreg, 'Clientes');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Codigo  Nome                           Alteracao     Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcli := 0;
            flag_erro_crecli := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              if (Length(linha)<>882) then
              begin
                flag_erro_crecli := true;
                break;
              end;
              totcli:=totcli+1;
            end;
            if (flag_erro_crecli) then
            begin
              showmessage('O arquivo de clientes está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' Clientes.........: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcli;
              gauge1.progress:=0;
              linha:='';
              totcli2:=0;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=40;
                  campo02 := Copy(linha,pos,tam);
                  pos:=47;
                  tam:=14;
                  campo03 := Copy(linha,pos,tam);
                  pos:=61;
                  tam:=50;
                  campo04 := Copy(linha,pos,tam);
                  pos:=111;
                  tam:=2;
                  campo05 := Copy(linha,pos,tam);
                  pos:=113;
                  tam:=1;
                  campo06 := Copy(linha,pos,tam);
                  pos:=114;
                  tam:=30;
                  campo07 := Copy(linha,pos,tam);
                  pos:=144;
                  tam:=20;
                  campo08 := Copy(linha,pos,tam);
                  pos:=164;
                  tam:=2;
                  campo09 := Copy(linha,pos,tam);
                  pos:=166;
                  tam:=8;
                  campo10 := Copy(linha,pos,tam);
                  pos:=174;
                  tam:=15;
                  campo11 := Copy(linha,pos,tam);
                  pos:=189;
                  tam:=15;
                  campo12 := Copy(linha,pos,tam);
                  pos:=204;
                  tam:=15;
                  campo13 := Copy(linha,pos,tam);
                  pos:=219;
                  tam:=10;
                  campo14 := Copy(linha,pos,tam);
                  pos:=229;
                  tam:=25;
                  campo15 := Copy(linha,pos,tam);
                  pos:=254;
                  tam:=10;
                  campo16 := Copy(linha,pos,tam);
                  pos:=264;
                  tam:=1;
                  campo17 := Copy(linha,pos,tam);
                  pos:=265;
                  tam:=40;
                  campo18 := Copy(linha,pos,tam);
                  pos:=305;
                  tam:=40;
                  campo19 := Copy(linha,pos,tam);
                  pos:=345;
                  tam:=40;
                  campo20 := Copy(linha,pos,tam);
                  pos:=385;
                  tam:=40;
                  campo21 := Copy(linha,pos,tam);
                  pos:=425;
                  tam:=15;
                  campo22 := Copy(linha,pos,tam);
                  pos:=440;
                  tam:=40;
                  campo23 := Copy(linha,pos,tam);
                  pos:=480;
                  tam:=15;
                  campo24 := Copy(linha,pos,tam);
                  pos:=495;
                  tam:=30;
                  campo25 := Copy(linha,pos,tam);
                  pos:=525;
                  tam:=20;
                  campo26 := Copy(linha,pos,tam);
                  pos:=545;
                  tam:=50;
                  campo27 := Copy(linha,pos,tam);
                  pos:=595;
                  tam:=15;
                  campo28 := Copy(linha,pos,tam);
                  pos:=610;
                  tam:=5;
                  campo29 := Copy(linha,pos,tam);
                  pos:=615;
                  tam:=10;
                  campo30 := Copy(linha,pos,tam);
                  pos:=625;
                  tam:=20;
                  campo31 := Copy(linha,pos,tam);
                  pos:=645;
                  tam:=10;
                  campo32 := Copy(linha,pos,tam);
                  pos:=655;
                  tam:=10;
                  campo33 := Copy(linha,pos,tam);
                  pos:=665;
                  tam:=1;
                  campo34 := Copy(linha,pos,tam);
                  pos:=666;
                  tam:=1;
                  campo35 := Copy(linha,pos,tam);
                  pos:=667;
                  tam:=1;
                  campo36 := Copy(linha,pos,tam);
                  pos:=668;
                  tam:=10;
                  campo37 := Copy(linha,pos,tam);
                  pos:=678;
                  tam:=10;
                  campo38 := Copy(linha,pos,tam);
                  pos:=688;
                  tam:=10;
                  campo39 := Copy(linha,pos,tam);
                  pos:=698;
                  tam:=10;
                  campo40 := Copy(linha,pos,tam);
                  pos:=708;
                  tam:=10;
                  campo41 := Copy(linha,pos,tam);
                  pos:=718;
                  tam:=5;
                  campo42 := Copy(linha,pos,tam);
                  pos:=723;
                  tam:=50;
                  campo43 := Copy(linha,pos,tam);
                  pos:=773;
                  tam:=1;
                  campo44 := Copy(linha,pos,tam);
                  pos:=774;
                  tam:=10;
                  campo45 := Copy(linha,pos,tam);
                  pos:=784;
                  tam:=4;
                  campo46 := Copy(linha,pos,tam);
                  pos:=788;
                  tam:=80;
                  campo47 := Copy(linha,pos,tam);
                  pos:=868;
                  tam:=4;
                  campo48 := Copy(linha,pos,tam);
                  pos:=872;
                  tam:=10;
                  TS1 := strtodate(Copy(linha,pos,tam));
                  pos:=882;
                  tam:=1;
                  op := Copy(linha,pos,tam);

                          {...}
                  codigo := Trim(campo01);
                  if (op='I') or (op='A') then
                  begin
                    with (clCliente) do
                      if (codigo<>'') then
                      begin
                        clCliente := TClassCliente.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CL_CODI,CL_TIME                ');
                        AddParam ('From CRECLI                           ');
                        AddParam ('Where (CL_CODI='+codigo+')            ');
                        inCL_CODI := strtofloat(codigo);
                        inCL_NOME := Trim(campo02);
                        inCL_CPF  := Trim(campo03);
                        inCL_ENDE := Trim(campo04);
                        inCL_LOJA := strtofloat(campo05);
                        inCL_SEXO := campo06;
                        inCL_BAIR := Trim(campo07);
                        inCL_CIDA := Trim(campo08);
                        inCL_ESTA := Trim(campo09);
                        inCL_CEP  := Trim(campo10);
                        inCL_FONE := Trim(campo11);
                        inCL_FAX  := Trim(campo12);
                        inCL_CELU := Trim(campo13);
                        inCL_DTNA := strtodate(campo14);
                        inCL_IDEN := Trim(campo15);
                        inCL_OEXP := Trim(campo16);
                        inCL_ECIV := Trim(campo17);
                        inCL_CONJ := Trim(campo18);
                        inCL_NPAI := Trim(campo19);
                        inCL_NMAE := Trim(campo20);
                        inCL_REF1 := Trim(campo21);
                        inCL_TRF1 := Trim(campo22);
                        inCL_REF2 := Trim(campo23);
                        inCL_TRF2 := Trim(campo24);
                        inCL_EMPR := Trim(campo25);
                        inCL_CARG := Trim(campo26);
                        inCL_EEMP := Trim(campo27);
                        inCL_FEMP := Trim(campo28);
                        inCL_REMP := Trim(campo29);
                        inCL_DADM := strtodate(Trim(campo30));
                        inCL_CPRO := Trim(campo31);
                        inCL_SALA := strtofloat(campo32)/100;
                        inCL_LIMC := strtofloat(campo33)/100;
                        inCL_CFUN := Trim(campo34);
                        inCL_TPRO := Trim(campo35);
                        inCL_RSPC := Trim(campo36);
                        inCL_DSPC := strtodate(Trim(campo37));
                        inCL_DREG := strtodate(Trim(campo38));
                        inCL_VALI := strtodate(Trim(campo39));
                        inCL_DTCA := strtodate(Trim(campo40));
                        inCL_ULTC := strtodate(Trim(campo41));
                        inCL_QTDC := strtofloat(campo42)/100;
                        inCL_OBSE := Trim(campo43);
                        inCL_ALTE := Trim(campo44);
                        inCL_DULP := strtodate(Trim(campo45));
                        inCL_PDC  := Trim(campo46);
                        inCL_EMAI := Trim(campo47);
                        inCL_LIVR := Trim(campo48);
                        inCL_TIME := TS1;
                        if (Execute) then
                        begin
                                      {* a MATRIZ sempre sobrepoe a LOJA}
                          UpdateAll;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          Insert;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='E') then
                    with (clCliente) do
                      if (codigo<>'') then
                      begin
                        clCliente := TClassCliente.Create;
                        conect ('CREDITO',self);
                        ClearSql;
                        AddParam ('Select CL_CODI,CL_TIME From CRECLI ');
                        AddParam ('Where (CL_CODI='+codigo+') ');
                        if (Execute) then
                        begin
                          DeletaCliente(codigo);
                          totcli2:=totcli2+1;
                          mensagem_erro := '  EOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente'
                end;
                WriteLn (arqreg, form_t    (codigo,6)     +' '+
                  form_t    (campo02,30)   +' '+
                  form_data (TS1)          +'    '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Cliente..........: OK - Total..: '+form_n(totcli,10)+' Registros alterados..: '+
                form_n(totcli2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Cliente..........: Arquivo CLIENTE.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcli,10)+' registro(s)');

          if FileExists('C:\NATIVA\CREDITO\MOVIMENTO\EXCONT.MTZ') then
          begin
            DeletaContratos;
            DeleteFile('C:\NATIVA\CREDITO\MOVIMENTO\EXCONT.MTZ');
          end
          else
            memo1.lines.Add (' Exclui Contratos..: Arquivo EXCONT.MTZ  não encontrado');

              {2. - Contratos---------------------------------------------->}
          WriteLn (arqreg, '');
          WriteLn (arqreg, 'Contratos');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Cliente  Contrato  Alteracao    Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totctr := 0;
            flag_erro_crectabr := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              if (Length(linha)<>223) then
              begin
                flag_erro_crectabr := true;
                break;
              end;
              totctr:=totctr+1;
            end;
            if (flag_erro_crectabr) then
            begin
              showmessage('O arquivo de contratos está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' Contratos........: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totctr;
              gauge1.progress:=0;
              linha:='';
              totctr2:=0;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=6;
                  campo02 := Copy(linha,pos,tam);
                  pos:=13;
                  tam:=2;
                  campo03 := Copy(linha,pos,tam);
                  pos:=15;
                  tam:=10;
                  campo04 := Copy(linha,pos,tam);
                  pos:=25;
                  tam:=2;
                  campo05 := Copy(linha,pos,tam);
                  pos:=27;
                  tam:=10;
                  campo06 := Copy(linha,pos,tam);
                  pos:=37;
                  tam:=6;
                  campo07 := Copy(linha,pos,tam);
                  pos:=43;
                  tam:=4;
                  campo08 := Copy(linha,pos,tam);
                  pos:=47;
                  tam:=15;
                  campo09 := Copy(linha,pos,tam);
                  pos:=62;
                  tam:=15;
                  campo10 := Copy(linha,pos,tam);
                  pos:=77;
                  tam:=3;
                  campo11 := Copy(linha,pos,tam);
                  pos:=80;
                  tam:=2;
                  campo12 := Copy(linha,pos,tam);
                  pos:=82;
                  tam:=2;
                  campo13 := Copy(linha,pos,tam);
                  pos:=84;
                  tam:=5;
                  campo14 := Copy(linha,pos,tam);
                  pos:=89;
                  tam:=1;
                  campo15 := Copy(linha,pos,tam);
                  pos:=90;
                  tam:=1;
                  campo16 := Copy(linha,pos,tam);
                  pos:=91;
                  tam:=15;
                  campo17 := Copy(linha,pos,tam);
                  pos:=106;
                  tam:=10;
                  campo18 := Copy(linha,pos,tam);
                  pos:=116;
                  tam:=15;
                  campo19 := Copy(linha,pos,tam);
                  pos:=131;
                  tam:=1;
                  campo20 := Copy(linha,pos,tam);
                  pos:=132;
                  tam:=80;
                  campo21 := Copy(linha,pos,tam);
                  pos:=212;
                  tam:=10;
                  TS1 := strtodate(Copy(linha,pos,tam));
                  pos:=222;
                  tam:=1;
                  campo22 := Copy(linha,pos,tam);
                  pos := 223;
                  tam := 1;
                  op  := Copy(linha,pos,tam);    
                  {...}
                  cliente := Trim(campo01);
                  codigo  := Trim(campo02);
                  if (op='I') or (op='A') then
                  begin
                    with (clContrato) do
                      if (codigo<>'') and (cliente<>'') then
                      begin
                        clContrato := TClassContrato.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CR_CLIE,CR_CODI,CR_TIME,CR_PDEV  ');
                        AddParam ('From   CRECTABR                         ');
                        AddParam ('Where (CR_CLIE='+cliente+') AND         ');
                        AddParam ('      (CR_CODI='+codigo+')              ');
                        inCR_CLIE := strtofloat(cliente);
                        inCR_CODI := strtofloat(codigo);
                        inCR_LOJA := strtofloat(campo03);
                        inCR_NOTA := Trim(campo04);
                        inCR_SERI := Trim(campo05);
                        inCR_DNOT := strtodate(campo06);
                        inCR_AVAL := strtofloat(campo07);
                        inCR_PORT := strtofloat(campo08);
                        inCR_TOTA := strtofloat(campo09)/100;
                        inCR_VENT := strtofloat(campo10)/100;
                        inCR_PLAN := strtofloat(campo11);
                        inCR_QPRE := strtofloat(campo12);
                        inCR_PDEV := strtofloat(campo13);
                        inCR_FATO := strtofloat(campo14)/100;
                        inCR_CARN := Trim(campo15);
                        inCR_FICH := Trim(campo16);
                        inCR_VDEV := strtofloat(campo17)/100;
                        inCR_DTRA := strtodate(campo18);
                        inCR_TOT2 := strtofloat(campo19)/100;
                        inCR_BOLE := Trim(campo20);
                        inCR_OBSE := Trim(campo21);
                        inCR_TIME := TS1;
                        inCR_QBOL := Trim(campo22);
                        if (Execute) then
                        begin
                          UpdateAll;
                          totctr2:=totctr2+1;
                          mensagem_erro := '  AOK';

                          {apagando eventuais prestacoes alem do permitido}
                          ExcluiPrestacoesAlemContrato(inCR_CLIE,inCR_CODI,inCR_QPRE);
                        end
                        else
                        begin
                          Insert;
                          totctr2:=totctr2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='E') then
                    with (clContrato) do
                      if (codigo<>'') and (cliente<>'') then
                      begin
                        clContrato := TClassContrato.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CR_CLIE,CR_CODI,CR_TIME,CR_PDEV  ');
                        AddParam ('From   CRECTABR                         ');
                        AddParam ('Where (CR_CLIE='+cliente+') AND         ');
                        AddParam ('      (CR_CODI='+codigo+')              ');
                        if (Execute) then
                        begin
                          DeletaContrato(cliente,codigo);
                          totctr2:=totctr2+1;
                          mensagem_erro := '  EOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente';
                end;
                WriteLn (arqreg, form_t    (cliente,6)  +'   '+
                  form_t    (codigo,6)   +'   '+
                  form_data (TS1)+'    '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Contrato.........: OK - Total..: '+form_n(totctr,10)+' Registros alterados..: '+
                form_n(totctr2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Contrato.........: Arquivo CONTRATO.MTZ não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totctr,10)+' registro(s)');

              {3. - Prestacoes -------------------------------------------->}
          WriteLn (arqreg, '');
          WriteLn (arqreg, 'Prestacoes');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Cliente  Contrato  Prestacao  Alteracao    Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totptr := 0;
            flag_erro_creprabr := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              if (Length(linha)<>177) then
              begin
                flag_erro_creprabr := true;
                break;
              end;
              totptr:=totptr+1;
            end;
            if (flag_erro_creprabr) then
            begin
              showmessage('O arquivo de prestações está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' Prestações.......: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totptr;
              gauge1.progress:=0;
              linha:='';
              totptr2:=0;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=2;
                  campo01 := Copy(linha,pos,tam);
                  pos:=3;
                  tam:=15;
                  campo02 := Copy(linha,pos,tam);
                  pos:=18;
                  tam:=5;
                  campo03 := Copy(linha,pos,tam);
                  pos:=23;
                  tam:=10;
                  campo04 := Copy(linha,pos,tam);
                  pos:=33;
                  tam:=10;
                  campo05 := Copy(linha,pos,tam);
                  pos:=43;
                  tam:=10;
                  campo06 := Copy(linha,pos,tam);
                  pos:=53;
                  tam:=2;
                  campo07 := Copy(linha,pos,tam);
                  pos:=55;
                  tam:=4;
                  campo08 := Copy(linha,pos,tam);
                  pos:=59;
                  tam:=6;
                  campo09 := Copy(linha,pos,tam);
                  pos:=65;
                  tam:=3;
                  campo10 := Copy(linha,pos,tam);
                  pos:=68;
                  tam:=2;
                  campo11 := Copy(linha,pos,tam);
                  pos:=70;
                  tam:=15;
                  campo12 := Copy(linha,pos,tam);
                  pos:=85;
                  tam:=5;
                  campo13 := Copy(linha,pos,tam);
                  pos:=90;
                  tam:=1;
                  campo14 := Copy(linha,pos,tam);
                  pos:=91;
                  tam:=6;
                  campo15 := Copy(linha,pos,tam);
                  pos:=97;
                  tam:=6;
                  campo16 := Copy(linha,pos,tam);
                  pos:=103;
                  tam:=10;
                  campo17 := Copy(linha,pos,tam);
                  pos:=113;
                  tam:=2;
                  campo18 := Copy(linha,pos,tam);
                  pos:=115;
                  tam:=10;
                  campo19 := Copy(linha,pos,tam);
                  pos:=125;
                  tam:=14;
                  campo20 := Copy(linha,pos,tam);
                  pos:=139;
                  tam:=6;
                  campo21 := Copy(linha,pos,tam);
                  pos:=145;
                  tam:=10;
                  campo22 := Copy(linha,pos,tam);
                  pos:=155;
                  tam:=10;
                  campo23 := Copy(linha,pos,tam);
                  pos:=165;
                  tam:=2;
                  campo24 := Copy(linha,pos,tam);
                  pos:=167;
                  tam:=10;
                  TS1 := strtodate(Copy(linha,pos,tam));
                  pos:=177;
                  tam:=1;
                  op  := Copy(linha,pos,tam);

                          {...}
                  cliente   := Trim(campo16);
                  codigo    := Trim(campo15);
                  prestacao := Trim(campo01);
                  if (op='I') or (op='A') then
                  begin
                    with (clPrestacao) do
                      if (codigo<>'') and (cliente<>'') and (prestacao<>'') then
                      begin
                        clPrestacao := TClassPrestContrat.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select PC_CLIE,PC_CONT,PC_TIME,PC_STAT  ');
                        AddParam ('From   CREPRABR                         ');
                        AddParam ('Where (PC_CLIE='+cliente+') AND         ');
                        AddParam ('      (PC_CONT='+codigo+') AND          ');
                        AddParam ('      (PC_NPRE='+prestacao+')           ');
                        inPC_NPRE := strtofloat(Trim(campo01));
                        inPC_VALO := strtofloat(campo02)/100;
                        inPC_FATO := strtofloat(campo03)/100;
                        inPC_DCON := strtodate(campo04);
                        inPC_DVTO := strtodate(campo05);
                        inPC_DTPG := strtodate(campo06);
                        inPC_LOJA := strtofloat(campo07);
                        inPC_PORT := strtofloat(campo08);
                        inPC_AVAL := strtofloat(campo09);
                        inPC_PLAN := strtofloat(campo10);
                        inPC_LJPG := strtofloat(campo11);
                        inPC_VPAG := strtofloat(campo12)/100;
                        inPC_SALD := strtofloat(campo13);
                        inPC_STAT := Trim(campo14);
                        inPC_CONT := strtofloat(campo15);
                        inPC_CLIE := strtofloat(campo16);
                        inPC_CHEQ := strtofloat(campo17);
                        inPC_TPRE := strtofloat(campo18);
                        inPC_DTRA := strtodate(campo19);
                        inPC_CCGC := Trim(campo20);
                        inPC_BANC := strtofloat(campo21);
                        inPC_AGEN := Trim(campo22);
                        inPC_NUME := strtofloat(campo23);
                        inPC_FPGT := strtofloat(campo24);
                        inPC_TIME := TS1;
                        if (Execute)  then
                        begin
                          if (Result('PC_STAT') <> 1) or (inPC_VPAG > 0) then
                          begin
                            if (databasecontas='CONTASPAGAR') then
                              try
                                query1 := tquery.create(application);
                                query1.databasename := 'CONTASPAGAR';
                                query1.sql.clear;
                                query1.sql.add('Delete from Lancamentos_Conta_Caixa ');
                                query1.sql.add('Where La_Doc =:Doc');
                                query1.parambyname('Doc').AsString := 'CR'+floattostr(inPC_CLIE)+'.'+floattostr(inPC_CONT)+'.'+floattostr(inPC_NPRE);
                                query1.execsql;

                                query1.sql[0] := 'Delete from Lancamentos';
                                query1.execsql;

                                if (inPC_STAT = '1')  then
                                  QuitaPrestacao (inPC_CLIE,
                                    inPC_CONT,
                                    inPC_NPRE,
                                    inPC_LJPG,
                                    inPC_VPAG,
                                    inPC_DTPG,
                                    inPC_FPGT,
                                    true);

                              finally
                                query1.destroy;
                              end;

                            if (Result('PC_STAT') = 1) and (InPC_STAT = '0') then
                              mensagem_erro := '  ROK'
                            else
                              mensagem_erro := '  AOK';

                            UpdateAll;
                            totptr2:=totptr2+1;
                          end
                          else
                            mensagem_erro := '  NOK';
                        end
                        else
                        begin
                          Insert;
                          totptr2:=totptr2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='E') then
                  begin
                    with (clPrestacao) do
                      if (codigo<>'') and (cliente<>'') and (prestacao<>'') then
                      begin
                        clPrestacao := TClassPrestContrat.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select PC_CLIE,PC_CONT,PC_TIME,PC_STAT  ');
                        AddParam ('From   CREPRABR                         ');
                        AddParam ('Where (PC_CLIE='+cliente+') AND         ');
                        AddParam ('      (PC_CONT='+codigo+') AND          ');
                        AddParam ('      (PC_NPRE='+prestacao+')           ');
                        if (Execute) then
                        begin
                          DeletaPrestacao(cliente,codigo,prestacao);
                          totptr2:=totptr2+1;
                          mensagem_erro := '  EOK'
                        end;
                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='P') then
                  begin
                               {******************************************************}
                               {Pagamentos que vem da MATRIZ (Escritorio)}
                               {ja atualiza o CONTRATO e o CLIENTE}
                    QuitaPrestacao (strtofloat(cliente),
                      strtofloat(codigo),
                      strtofloat(prestacao),
                      strtofloat(campo11),
                      strtofloat(campo12)/100,
                      strtodate(campo06),
                      strtofloatn(campo24));
                    totptr2:=totptr2+1;
                    mensagem_erro := '  POK'
                               {******************************************************}
                  end;
                except
                  mensagem_erro := '  Reg. inconsistente';
                end;
                WriteLn (arqreg, form_t    (cliente  ,6)  +'   '+
                  form_t    (codigo   ,6)  +'    '+
                  form_t    (prestacao,2)  +'        '+
                  form_data (TS1)+'    '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Prestações.......: OK - Total..: '+form_n(totptr,10)+' Registros alterados..: '+
                form_n(totptr2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Prestações.......: Arquivo PRESTAC.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totptr,10)+' registro(s)');

              {4. - Cheques pre-datados-------------------------------------------->}
          Writeln (arqreg, '');
          Writeln (arqreg, 'Cheques pre-datados');
          Writeln (arqreg, form_tc2('-',80,'-'));
          Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
          Writeln (arqreg, form_tc2('-',80,'-'));

          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcheq := 0;
            flag_erro_cheqpre := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              linha := Trim(linha);
              if (Length(linha)<>218) then
              begin
                flag_erro_cheqpre := true;
                break;
              end;
              totcheq:=totcheq+1;
            end;
            if (flag_erro_cheqpre) then
            begin
              showmessage('O arquivo de cheques pré-datados está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' Cheques pré......: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcheq;
              gauge1.progress:=0;
              linha:='';
              totcheq2:=0;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=14;
                  campo02 := Copy(linha,pos,tam);
                  pos:=21;
                  tam:=3;
                  campo03 := Copy(linha,pos,tam);
                  pos:=24;
                  tam:=7;
                  campo04 := Copy(linha,pos,tam);
                  pos:=31;
                  tam:=10;
                  campo05 := Copy(linha,pos,tam);
                  pos:=41;
                  tam:=40;
                  campo06 := Copy(linha,pos,tam);
                  pos:=81;
                  tam:=15;
                  campo07 := Copy(linha,pos,tam);
                  pos:=96;
                  tam:=2;
                  campo08 := Copy(linha,pos,tam);
                  pos:=98;
                  tam:=10;
                  campo09 := Copy(linha,pos,tam);
                  pos:=108;
                  tam:=4;
                  campo10 := Copy(linha,pos,tam);
                  pos:=112;
                  tam:=10;
                  campo11 := Copy(linha,pos,tam);
                  pos:=122;
                  tam:=10;
                  campo12 := Copy(linha,pos,tam);
                  pos:=132;
                  tam:=4;
                  campo13 := Copy(linha,pos,tam);
                  pos:=136;
                  tam:=15;
                  campo14 := Copy(linha,pos,tam);
                  pos:=151;
                  tam:=6;
                  campo15 := Copy(linha,pos,tam);
                  pos:=157;
                  tam:=1;
                  campo16 := Copy(linha,pos,tam);
                  pos:=158;
                  tam:=50;
                  campo17 := Copy(linha,pos,tam);
                  pos:=208;
                  tam:=10;
                  TS1 := strtodate(Copy(linha,pos,tam));
                  pos:=218;
                  tam:=1;
                  op  := Copy(linha,pos,tam);

                          {...}
                  cgc    := Trim(campo02);
                  banco  := Trim(campo03);
                  numero := Trim(campo04);
                  if (op='I') or (op='A') then
                  begin
                    with (clCheque) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clCheque := TClassCheque.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHMOV ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        inCH_CCGC := cgc;
                        inCH_BANC := strtofloat(banco);
                        inCH_NUME := strtofloat(numero);
                        inCH_DTCT := strtodate(Trim(campo05));
                        inCH_NOME := Trim(campo06);
                        inCH_FONE := Trim(campo07);
                        inCH_LOJA := strtofloat(Trim(campo08));
                        inCH_DVTO := strtodate(Trim(campo09));
                        inCH_PORT := strtofloat(Trim(campo10));
                        inCH_AGEN := Trim(campo11);
                        inCH_DTRA := strtodate(Trim(campo12));
                        inCH_TRAN := strtoint(Trim(campo13));
                        inCH_VALO := strtofloat(campo14)/100;
                        inCH_CLIE := strtofloat(Trim(campo15));
                        inCH_STAT := Trim(campo16);
                        inCH_OBS  := Trim(campo17);
                        inCH_TIME := TS1;
                        if (Execute) then
                        begin
                          UpdateAll;
                          totcheq2:=totcheq2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          Insert;
                          totcheq2:=totcheq2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='E') then
                    with (clCheque) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clCheque := TClassCheque.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHMOV ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        if (Execute) then
                        begin
                          DeletaCheque(cgc,banco,numero);
                          totcheq2:=totcheq2+1;
                          mensagem_erro := '  EOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente';
                end;
                Writeln (arqreg , form_t    (cgc      ,14) +' '+
                  form_t    (banco    ,4)  +'   '+
                  form_t    (numero   ,6)  +'   '+
                  form_data (TS1)+'    '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Cheques pré......: OK - Total..: '+form_n(totcheq,10)+' Registros alterados..: '+
                form_n(totcheq2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Cheques pré......: Arquivo CHEQPRE.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcheq,10)+' registro(s)');

              {5. - Cheques pre-datados compensados ------------------------------->}
          Writeln (arqreg, '');
          Writeln (arqreg, 'Cheques compensados');
          Writeln (arqreg, form_tc2('-',80,'-'));
          Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
          Writeln (arqreg, form_tc2('-',80,'-'));

          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcheqpg := 0;
            flag_erro_cheqprepg := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              linha := Trim(linha);
              if (Length(linha)<>228) then
              begin
                flag_erro_cheqprepg := true;
                break;
              end;
              totcheqpg:=totcheqpg+1;
            end;
            if (flag_erro_cheqprepg) then
            begin
              showmessage('O arquivo de cheques compensados está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' Cheques compens..: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcheqpg;
              gauge1.progress:=0;
              linha:='';
              totcheqpg2:=0;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=14;
                  campo02 := Copy(linha,pos,tam);
                  pos:=21;
                  tam:=3;
                  campo03 := Copy(linha,pos,tam);
                  pos:=24;
                  tam:=7;
                  campo04 := Copy(linha,pos,tam);
                  pos:=31;
                  tam:=10;
                  campo05 := Copy(linha,pos,tam);
                  pos:=41;
                  tam:=40;
                  campo06 := Copy(linha,pos,tam);
                  pos:=81;
                  tam:=15;
                  campo07 := Copy(linha,pos,tam);
                  pos:=96;
                  tam:=2;
                  campo08 := Copy(linha,pos,tam);
                  pos:=98;
                  tam:=10;
                  campo09 := Copy(linha,pos,tam);
                  pos:=108;
                  tam:=4;
                  campo10 := Copy(linha,pos,tam);
                  pos:=112;
                  tam:=10;
                  campo11 := Copy(linha,pos,tam);
                  pos:=122;
                  tam:=10;
                  campo12 := Copy(linha,pos,tam);
                  pos:=132;
                  tam:=4;
                  campo13 := Copy(linha,pos,tam);
                  pos:=136;
                  tam:=15;
                  campo14 := Copy(linha,pos,tam);
                  pos:=151;
                  tam:=6;
                  campo15 := Copy(linha,pos,tam);
                  pos:=157;
                  tam:=1;
                  campo16 := Copy(linha,pos,tam);
                  pos:=158;
                  tam:=50;
                  campo17 := Copy(linha,pos,tam);
                  pos:=208;
                  tam:=10;
                  campo18 := Copy(linha,pos,tam);
                  pos:=218;
                  tam:=10;
                  TS1 := strtodate(Copy(linha,pos,tam));
                  pos:=228;
                  tam:=1;
                  op  := Copy(linha,pos,tam);

                          {...}
                  cgc    := Trim(campo02);
                  banco  := Trim(campo03);
                  numero := Trim(campo04);
                  if (op='I') or (op='A') then
                  begin
                    with (clChequePg) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clChequePg := TClassChequePg.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHMVPG ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        inCH_CCGC := cgc;
                        inCH_BANC := strtofloat(banco);
                        inCH_NUME := strtofloat(numero);
                        inCH_DTCT := strtodate(Trim(campo05));
                        inCH_NOME := Trim(campo06);
                        inCH_FONE := Trim(campo07);
                        inCH_LOJA := strtofloat(Trim(campo08));
                        inCH_DVTO := strtodate(Trim(campo09));
                        inCH_DTPG := strtodate(Trim(campo18));
                        inCH_PORT := strtofloat(Trim(campo10));
                        inCH_AGEN := Trim(campo11);
                        inCH_DTRA := strtodate(Trim(campo12));
                        inCH_TRAN := strtoint(Trim(campo13));
                        inCH_VALO := strtofloat(campo14)/100;
                        inCH_CLIE := strtofloat(Trim(campo15));
                        inCH_STAT := Trim(campo16);
                        inCH_OBS  := Trim(campo17);
                        inCH_TIME := TS1;
                        if (Execute) then
                        begin
                          UpdateAll;
                          totcheqpg2:=totcheqpg2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          Insert;
                          totcheqpg2:=totcheqpg2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='E') then
                    with (clChequePg) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clChequePg := TClassChequePg.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHMVPG ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        if (Execute) then
                        begin
                          DeletaChequePg(cgc,banco,numero);
                          totcheqpg2:=totcheqpg2+1;
                          mensagem_erro := '  EOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente';
                end;
                Writeln (arqreg, form_t    (cgc      ,14) +' '+
                  form_t    (banco    ,4)  +'   '+
                  form_t    (numero   ,6)  +'   '+
                  form_data (TS1)+'    '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Cheques compens..: OK - Total..: '+form_n(totcheqpg,10)+' Registros alterados..: '+
                form_n(totcheqpg2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Cheques compens..: Arquivo CHEQMVPG.MTZ não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcheqpg,10)+' registro(s)');

              {6. - Cheques devolvidos ------------------------------->}
          Writeln (arqreg, '');
          Writeln (arqreg, 'Cheques devolvidos');
          Writeln (arqreg, form_tc2('-',80,'-'));
          Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
          Writeln (arqreg, form_tc2('-',80,'-'));

          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcheqdev := 0;
            flag_erro_cheqdev := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              linha := Trim(linha);
              if (Length(linha)<>200) then
              begin
                flag_erro_cheqdev := true;
                break;
              end;
              totcheqdev:=totcheqdev+1;
            end;
            if (flag_erro_cheqdev) then
            begin
              showmessage('O arquivo de cheques devolvidos está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' Cheques devolv...: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcheqdev;
              gauge1.progress:=0;
              linha:='';
              totcheqdev2:=0;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=14;
                  campo02 := Copy(linha,pos,tam);
                  pos:=21;
                  tam:=7;
                  campo03 := Copy(linha,pos,tam);
                  pos:=28;
                  tam:=10;
                  campo04 := Copy(linha,pos,tam);
                  pos:=38;
                  tam:=2;
                  campo05 := Copy(linha,pos,tam);
                  pos:=40;
                  tam:=10;
                  campo06 := Copy(linha,pos,tam);
                  pos:=50;
                  tam:=10;
                  campo07 := Copy(linha,pos,tam);
                  pos:=60;
                  tam:=4;
                  campo08 := Copy(linha,pos,tam);
                  pos:=64;
                  tam:=3;
                  campo09 := Copy(linha,pos,tam);
                  pos:=67;
                  tam:=10;
                  campo10 := Copy(linha,pos,tam);
                  pos:=77;
                  tam:=15;
                  campo11 := Copy(linha,pos,tam);
                  pos:=92;
                  tam:=4;
                  campo12 := Copy(linha,pos,tam);
                  pos:=96;
                  tam:=50;
                  campo13 := Copy(linha,pos,tam);
                  pos:=146;
                  tam:=40;
                  campo14 := Copy(linha,pos,tam);
                  pos:=186;
                  tam:=4;
                  campo15 := Copy(linha,pos,tam);
                  pos:=190;
                  tam:=10;
                  TS1 := strtodate(Copy(linha,pos,tam));
                  pos:=200;
                  tam:=1;
                  op  := Copy(linha,pos,tam);

                          {...}
                  cgc    := Trim(campo02);
                  banco  := Trim(campo09);
                  numero := Trim(campo03);
                  if (op='I') or (op='A') then
                  begin
                    with (clChequeDev) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clChequeDev := TClassChequeDev.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHDEV ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        inCH_CLIE := strtofloat(campo01);
                        inCH_CCGC := Trim(cgc);
                        inCH_NUME := strtofloat(numero);
                        inCH_DTCT := strtodate(Trim(campo04));
                        inCH_LOJA := strtofloat(campo05);
                        inCH_DTEM := strtodate(campo06);
                        inCH_DVTO := strtodate(campo07);
                        inCH_PORT := strtofloat(campo08);
                        inCH_BANC := strtofloat(campo09);
                        inCH_AGEN := Trim(campo10);
                        inCH_VALO := strtofloat(campo11)/100;
                        inCH_ALIN := Trim(campo12);
                        inCH_OBS  := Trim(campo13);
                        inCH_NOME := Trim(campo14);
                        inCH_TRAN := strtoint(campo15);
                        inCH_TIME := TS1;
                        if (Execute) then
                        begin
                          UpdateAll;
                          totcheqdev2:=totcheqdev2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          Insert;
                          totcheqdev2:=totcheqdev2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='E') then
                    with (clChequeDev) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clChequeDev := TClassChequeDev.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHDEV ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        if (Execute) then
                        begin
                          DeletaChequeDev(cgc,banco,numero);
                          totcheqdev2:=totcheqdev2+1;
                          mensagem_erro := '  EOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente';
                end;
                Writeln (arqreg, form_t    (cgc      ,14) +' '+
                  form_t    (banco    ,4)  +'   '+
                  form_t    (numero   ,6)  +'   '+
                  form_data (TS1)+'    '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Cheques devolv...: OK - Total..: '+form_n(totcheqdev,10)+' Registros alterados..: '+
                form_n(totcheqdev2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Cheques devolv...: Arquivo CHEQDEV.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcheqdev,10)+' registro(s)');

              {7. - Cheques devolvidos compensados ------------------->}
          Writeln (arqreg, '');
          Writeln (arqreg, 'Cheques devolvidos compensados');
          Writeln (arqreg, form_tc2('-',80,'-'));
          Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
          Writeln (arqreg, form_tc2('-',80,'-'));

          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcheqdvpg := 0;
            flag_erro_cheqdvpg := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              if (Length(linha)<>229) then
              begin
                flag_erro_cheqdvpg := true;
                break;
              end;
              totcheqdvpg:=totcheqdvpg+1;
            end;
            if (flag_erro_cheqdvpg) then
            begin
              showmessage('O arquivo de cheques devolvidos pagos está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' Cheques dev pagos: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcheqdvpg;
              gauge1.progress:=0;
              linha:='';
              totcheqdvpg2:=0;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=14;
                  campo02 := Copy(linha,pos,tam);
                  pos:=21;
                  tam:=7;
                  campo03 := Copy(linha,pos,tam);
                  pos:=28;
                  tam:=10;
                  campo04 := Copy(linha,pos,tam);
                  pos:=38;
                  tam:=2;
                  campo05 := Copy(linha,pos,tam);
                  pos:=40;
                  tam:=10;
                  campo06 := Copy(linha,pos,tam);
                  pos:=50;
                  tam:=10;
                  campo07 := Copy(linha,pos,tam);
                  pos:=60;
                  tam:=4;
                  campo08 := Copy(linha,pos,tam);
                  pos:=64;
                  tam:=3;
                  campo09 := Copy(linha,pos,tam);
                  pos:=67;
                  tam:=10;
                  campo10 := Copy(linha,pos,tam);
                  pos:=77;
                  tam:=15;
                  campo11 := Copy(linha,pos,tam);
                  pos:=92;
                  tam:=10;
                  campo12 := Copy(linha,pos,tam);
                  pos:=102;
                  tam:=4;
                  campo13 := Copy(linha,pos,tam);
                  pos:=106;
                  tam:=15;
                  campo14 := Copy(linha,pos,tam);
                  pos:=121;
                  tam:=50;
                  campo15 := Copy(linha,pos,tam);
                  pos:=171;
                  tam:=4;
                  campo16 := Copy(linha,pos,tam);
                  pos:=175;
                  tam:=40;
                  campo17 := Copy(linha,pos,tam);
                  pos:=215;
                  tam:=4;
                  campo18 := Copy(linha,pos,tam);
                  pos:=219;
                  tam:=10;
                  TS1 := strtodate(Copy(linha,pos,tam));
                  pos:=229;
                  tam:=1;
                  op  := Copy(linha,pos,tam);

                          {...}
                  cgc    := Trim(campo02);
                  banco  := Trim(campo09);
                  numero := Trim(campo03);
                  if (op='I') or (op='A') then
                  begin
                    with (clChequeDvPg) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clChequeDvPg := TClassChequeDevPg.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHDVPG ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        inCH_BANC := strtofloat(banco);
                        inCH_NUME := strtofloat(numero);
                        inCH_CCGC := Trim(cgc);
                        inCH_CLIE := strtofloat(campo01);
                        inCH_DTCT := strtodate(campo04);
                        inCH_LOJA := strtofloat(campo05);
                        inCH_DTEM := strtodate(campo06);
                        inCH_DVTO := strtodate(campo07);
                        inCH_PORT := strtofloat(campo08);
                        inCH_AGEN := Trim(campo10);
                        inCH_VALO := strtofloat(campo11)/100;
                        inCH_DTPG := strtodate(campo12);
                        inCH_ALIN := Trim(campo13);
                        inCH_STAT := '1';
                        inCH_OBS  := Trim(campo15);
                        inCH_VAPG := strtofloat(campo14)/100;
                        inCH_POR2 := strtofloat(campo16);
                        inCH_NOME := Trim(campo17);
                        inCH_TRAN := strtoint(campo18);
                        inCH_TIME := TS1;
                        if (Execute) then
                        begin
                          UpdateAll;
                          totcheqdvpg2:=totcheqdvpg2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          Insert;
                          totcheqdvpg2:=totcheqdvpg2+1;
                          mensagem_erro := '  IOK'
                        end;

                        with (DMRecCheqDev.qBaixaCheque) do
                        begin
                          parambyname('ccgc').AsString   := cgc;
                          parambyname('banco').AsFloat   := strtofloat(banco);
                          parambyname('numero').AsFloat  := strtofloat(numero);
                          ExecSql;
                        end;

                        QuitaChequePre (cgc,banco,numero);

                        frm_RecCheqDev := Tfrm_RecCheqDev.create(application);
                        with frm_RecCheqDev do
                          try
                            edtvalor.text := floattostr(inCH_VAPG);
                            edtData.text  := formatdatetime('dd/mm/yyyy',inCH_DTPG);
                            VerificaPrestacaoChequeDev (cgc,banco,numero);
                          finally
                            destroy;
                          end;
                        ClienteComChequeDevolvido (cgc);

                        desconect;
                        Free;
                      end;
                  end
                  else
                  if (op='E') then
                    with (clChequeDvPg) do
                      if (cgc<>'') and (banco<>'') and (numero<>'') then
                      begin
                        clChequeDvPg := TClassChequeDevPg.Create;
                        conect ('CREDITO',self);
                        ClearFields;
                        ClearSql;
                        AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                        AddParam ('From   CRECHDVPG ');
                        AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                        AddParam ('      (CH_BANC='+banco+') AND ');
                        AddParam ('      (CH_NUME='+numero+')  ');
                        if (Execute) then
                        begin
                          DeletaChequeDevPg(cgc,banco,numero);
                          totcheqdvpg2:=totcheqdvpg2+1;
                          mensagem_erro := '  EOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente';
                end;
                Writeln (arqreg, form_t    (cgc      ,14) +' '+
                  form_t    (banco    ,4)  +'   '+
                  form_t    (numero   ,6)  +'   '+
                  form_data (TS1)+'    '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Cheques dev pagos: OK - Total..: '+form_n(totcheqdvpg,10)+' Registros alterados..: '+
                form_n(totcheqdvpg2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Cheques dev pagos: Arquivo CHEQDVPG.MTZ não encontrado');
          WriteLn (arqreg, ' Total...: '+form_n(totcheqdvpg,10)+' registro(s)');

              {8. - Complementos de Clientes---------------------------------->}
          WriteLn (arqreg, 'Clientes');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Codigo  Alteracao     Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcomp := 0;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              totcomp:=totcomp+1;
            end;
            Reset(arq);
            indGauge:=0;
            totGauge:=totcomp;
            gauge1.progress:=0;
            linha:='';
            totcomp2:=0;
            while (not Eof(arq)) do
            begin
                        {encapsulamento da rotina, nao permite erros --->}
              try
                ReadLn (arq,linha);
                pos:=1;
                tam:=6;
                campo01 := Copy(linha,pos,tam);
                pos:=7;
                tam:=50;
                campo02 := Copy(linha,pos,tam);
                pos:=57;
                tam:=30;
                campo03 := Copy(linha,pos,tam);
                pos:=87;
                tam:=20;
                campo04 := Copy(linha,pos,tam);
                pos:=107;
                tam:=2;
                campo05 := Copy(linha,pos,tam);
                pos:=109;
                tam:=8;
                campo06 := Copy(linha,pos,tam);
                pos:=117;
                tam:=50;
                campo07 := Copy(linha,pos,tam);
                pos:=167;
                tam:=15;
                campo08 := Copy(linha,pos,tam);
                pos:=182;
                tam:=10;
                campo09 := Copy(linha,pos,tam);
                pos:=192;
                tam:=50;
                campo10 := Copy(linha,pos,tam);
                pos:=242;
                tam:=15;
                campo11 := Copy(linha,pos,tam);
                pos:=257;
                tam:=10;
                campo12 := Copy(linha,pos,tam);
                pos:=267;
                tam:=10;
                TS1 := strtodate(Copy(linha,pos,tam));
                pos:=277;
                tam:=1;
                op := Copy(linha,pos,tam);

                          {...}
                codigo := Trim(campo01);
                if (op='I') or (op='A') then
                begin
                  with (clComp) do
                    if (codigo<>'') then
                    begin
                      clComp := TClassAuxiliar.Create;
                      conect ('CREDITO',self);
                      ClearSql;
                      AddParam ('Select CC_CLIE,CC_TIME                ');
                      AddParam ('From CRECLI_COMP                      ');
                      AddParam ('Where (CC_CLIE='+codigo+')            ');
                      if (Execute) then
                      begin
                        ClearSql;
                        AddParam('UPDATE CRECLI_COMP       ');
                        AddParam('SET    CC_ENDC=:CC_ENDC, ');
                        AddParam('       CC_BAIC=:CC_BAIC, ');
                        AddParam('       CC_CIDC=:CC_CIDC, ');
                        AddParam('       CC_ESTC=:CC_ESTC, ');
                        AddParam('       CC_CEPC=:CC_CEPC, ');
                        AddParam('       CC_NCO1=:CC_NCO1, ');
                        AddParam('       CC_TCO1=:CC_TCO1, ');
                        AddParam('       CC_CCO1=:CC_CCO1, ');
                        AddParam('       CC_NCO2=:CC_NCO2, ');
                        AddParam('       CC_TCO2=:CC_TCO2, ');
                        AddParam('       CC_CCO2=:CC_CCO2, ');
                        AddParam('       CC_TIME=:CC_TIME  ');
                        AddParam('WHERE (CC_CLIE='+codigo+') ');
                        consulta.parambyname('CC_ENDC').AsString := campo02;
                        consulta.parambyname('CC_BAIC').AsString := campo03;
                        consulta.parambyname('CC_CIDC').AsString := campo04;
                        consulta.parambyname('CC_ESTC').AsString := campo05;
                        consulta.parambyname('CC_CEPC').AsString := campo06;
                        consulta.parambyname('CC_NCO1').AsString := campo07;
                        consulta.parambyname('CC_TCO1').AsString := campo08;
                        consulta.parambyname('CC_CCO1').AsFloat  := strtofloat(campo09)/100;
                        consulta.parambyname('CC_NCO2').AsString := campo10;
                        consulta.parambyname('CC_TCO2').AsString := campo11;
                        consulta.parambyname('CC_CCO2').Asfloat  := strtofloat(campo12)/100;
                        consulta.parambyname('CC_TIME').AsDateTime := TS1;
                        Execute;
                        totcomp2:=totcomp2+1;
                        mensagem_erro := '  AOK'
                      end
                      else
                      begin
                        ClearSql;
                        AddParam('INSERT INTO CRECLI_COMP(CC_CLIE,CC_ENDC,CC_BAIC,CC_CIDC,CC_ESTC,CC_CEPC,          ');
                        AddParam('                        CC_NCO1,CC_TCO1,CC_CCO1,CC_NCO2,CC_TCO2,CC_CCO2,CC_TIME)  ');
                        AddParam('VALUES (:CC_CLIE,:CC_ENDC,:CC_BAIC,:CC_CIDC,:CC_ESTC,:CC_CEPC,                    ');
                        AddParam('        :CC_NCO1,:CC_TCO1,:CC_CCO1,:CC_NCO2,:CC_TCO2,:CC_CCO2,:CC_TIME)           ');
                        consulta.parambyname('CC_CLIE').AsFloat  := strtofloat(codigo);
                        consulta.parambyname('CC_ENDC').AsString := campo02;
                        consulta.parambyname('CC_BAIC').AsString := campo03;
                        consulta.parambyname('CC_CIDC').AsString := campo04;
                        consulta.parambyname('CC_ESTC').AsString := campo05;
                        consulta.parambyname('CC_CEPC').AsString := campo06;
                        consulta.parambyname('CC_NCO1').AsString := campo07;
                        consulta.parambyname('CC_TCO1').AsString := campo08;
                        consulta.parambyname('CC_CCO1').Asfloat  := strtofloat(campo09)/100;
                        consulta.parambyname('CC_NCO2').AsString := campo10;
                        consulta.parambyname('CC_TCO2').AsString := campo11;
                        consulta.parambyname('CC_CCO2').Asfloat  := strtofloat(campo12)/100;
                        consulta.parambyname('CC_TIME').AsDateTime := TS1;
                        Execute;
                        totcomp2:=totcomp2+1;
                        mensagem_erro := '  IOK'
                      end;
                      desconect;
                      Free;
                    end;
                end
                else
                if (op='E') then
                  with (clComp) do
                    if (codigo<>'') then
                    begin
                      clComp := TClassAuxiliar.Create;
                      conect ('CREDITO',self);
                      ClearSql;
                      AddParam ('Select CC_CLIE,CC_TIME From CRECLI_COMP ');
                      AddParam ('Where (CC_CLIE='+codigo+')              ');
                      if (Execute) then
                      begin
                        DeletaComplemento(codigo);
                        totcomp2:=totcomp2+1;
                        mensagem_erro := '  EOK'
                      end;
                      desconect;
                      Free;
                    end;
              except
                mensagem_erro := '  Reg. inconsistente'
              end;
              WriteLn (arqreg, form_t    (codigo,6)     +' '+
                form_t    (campo02,30)   +' '+
                form_data (TS1)          +'    '+
                form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
              indGauge:=indGauge+1;
              gauge1.progress:=Round((indGauge/totGauge)*100);
              gauge1.refresh;
            end;
            CloseFile  (arq);
            memo1.lines.Add (' Complementos.....: OK - Total..: '+form_n(totcomp,10)+' Registros alterados..: '+
              form_n(totcomp2,10));
            DeleteFile (nome_arq);
          end
          else
            memo1.lines.Add (' Complementos.....: Arquivo CLICOMP.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcomp,10)+' registro(s)');

              {9. - Observacoes de Clientes---------------------------------->}
          WriteLn (arqreg, 'Observacoes de Clientes');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Codigo  Alteracao     Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIOBS.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totobs := 0;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              totobs:=totobs+1;
            end;
            Reset(arq);
            indGauge:=0;
            totGauge:=totobs;
            gauge1.progress:=0;
            linha:='';
            totobs2:=0;
            while (not Eof(arq)) do
            begin
                        {encapsulamento da rotina, nao permite erros --->}
              try
                ReadLn (arq,linha);
                pos:=1;
                tam:=6;
                campo01 := Copy(linha,pos,tam);
                pos:=7;
                tam:=80;
                campo02 := Copy(linha,pos,tam);
                pos:=87;
                tam:=80;
                campo03 := Copy(linha,pos,tam);
                pos:=167;
                tam:=80;
                campo04 := Copy(linha,pos,tam);
                pos:=247;
                tam:=80;
                campo05 := Copy(linha,pos,tam);
                pos:=327;
                tam:=80;
                campo06 := Copy(linha,pos,tam);
                pos:=407;
                tam:=10;
                TS1 := strtodate(Copy(linha,pos,tam));
                pos:=417;
                tam:=1;
                op := Copy(linha,pos,tam);

                          {...}
                codigo := Trim(campo01);
                if (op='I') or (op='A') then
                begin
                  with (clObs) do
                    if (codigo<>'') then
                    begin
                      clObs := TClassAuxiliar.Create;
                      conect   ('CREDITO',self);
                      ClearSql;
                      AddParam ('Select OB_CLIE,OB_TIME                ');
                      AddParam ('From CRECLI_OBS                       ');
                      AddParam ('Where (OB_CLIE='+codigo+')            ');
                      if (Execute) then
                      begin
                        ClearSql;
                        AddParam('UPDATE CRECLI_OBS SET    ');
                        AddParam('       OB_LIN1=:OB_LIN1, ');
                        AddParam('       OB_LIN2=:OB_LIN2, ');
                        AddParam('       OB_LIN3=:OB_LIN3, ');
                        AddParam('       OB_LIN4=:OB_LIN4, ');
                        AddParam('       OB_LIN5=:OB_LIN5, ');
                        AddParam('       OB_TIME=:OB_TIME  ');
                        AddParam('WHERE (OB_CLIE='+codigo+') ');
                        consulta.parambyname('OB_LIN1').AsString   := campo02;
                        consulta.parambyname('OB_LIN2').AsString   := campo03;
                        consulta.parambyname('OB_LIN3').AsString   := campo04;
                        consulta.parambyname('OB_LIN4').AsString   := campo05;
                        consulta.parambyname('OB_LIN5').AsString   := campo06;
                        consulta.parambyname('OB_TIME').AsDateTime := TS1;
                        Execute;
                        totobs2:=totobs2+1;
                        mensagem_erro := '  AOK'
                      end
                      else
                      begin
                        ClearSql;
                        AddParam('INSERT INTO CRECLI_OBS(OB_CLIE,OB_LIN1,OB_LIN2,OB_LIN3,OB_LIN4,OB_LIN5,OB_TIME)  ');
                        AddParam('VALUES (:OB_CLIE,:OB_LIN1,:OB_LIN2,:OB_LIN3,:OB_LIN4,:OB_LIN5,:OB_TIME)          ');
                        consulta.parambyname('OB_CLIE').AsFloat    := strtofloat(codigo);
                        consulta.parambyname('OB_LIN1').AsString   := campo02;
                        consulta.parambyname('OB_LIN2').AsString   := campo03;
                        consulta.parambyname('OB_LIN3').AsString   := campo04;
                        consulta.parambyname('OB_LIN4').AsString   := campo05;
                        consulta.parambyname('OB_LIN5').AsString   := campo06;
                        consulta.parambyname('OB_TIME').AsDateTime := TS1;
                        Execute;
                        totobs2:=totobs2+1;
                        mensagem_erro := '  IOK'
                      end;
                      desconect;
                      Free;
                    end;
                end
                else
                if (op='E') then
                  with (clObs) do
                    if (codigo<>'') then
                    begin
                      clObs := TClassAuxiliar.Create;
                      conect   ('CREDITO',self);
                      ClearSql;
                      AddParam ('Select OB_CLIE,OB_TIME From CRECLI_OBS ');
                      AddParam ('Where (OB_CLIE='+codigo+')             ');
                      if (Execute) then
                      begin
                        DeletaObservacao(codigo);
                        totobs2:=totobs2+1;
                        mensagem_erro := '  EOK'
                      end;
                      desconect;
                      Free;
                    end;
              except
                mensagem_erro := '  Reg. inconsistente'
              end;
              WriteLn (arqreg, form_t    (codigo,6)     +' '+
                form_t    (campo02,30)   +' '+
                form_data (TS1)          +'    '+
                form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
              indGauge:=indGauge+1;
              gauge1.progress:=Round((indGauge/totGauge)*100);
              gauge1.refresh;
            end;
            CloseFile  (arq);
            memo1.lines.Add (' Observações......: OK - Total..: '+form_n(totobs,10)+' Registros alterados..: '+
              form_n(totobs2,10));
            DeleteFile (nome_arq);
          end
          else
            memo1.lines.Add (' Observações......: Arquivo CLIOBS.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totobs,10)+' registro(s)');


              {10. - Contratos renegociados ---------------------------------->}
          WriteLn (arqreg, 'Renegociacoes');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Cliente  Mestre  Escravo  Alteracao     Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\RENEGOC.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totrenegoc := 0;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              totrenegoc:=totrenegoc+1;
            end;
            Reset(arq);
            indGauge:=0;
            totGauge:=totrenegoc;
            gauge1.progress:=0;
            linha:='';
            totrenegoc2:=0;
            while (not Eof(arq)) do
            begin
                        {encapsulamento da rotina, nao permite erros --->}
              try
                ReadLn (arq,linha);
                pos:=1;
                tam:=6;
                campo01 := Copy(linha,pos,tam);
                pos:=7;
                tam:=6;
                campo02 := Copy(linha,pos,tam);
                pos:=13;
                tam:=6;
                campo03 := Copy(linha,pos,tam);
                pos:=19;
                tam:=2;
                campo04 := Copy(linha,pos,tam);
                pos:=21;
                tam:=10;
                TS1 := strtodate(Copy(linha,pos,tam));
                pos:=31;
                tam:=1;
                op := Copy(linha,pos,tam);

                          {...}
                cliente := Trim(campo01);
                mestre  := Trim(campo02);
                escravo := Trim(campo03);
                if (op='I') or (op='A') then
                begin
                  with (clRenegoc) do
                    if (cliente<>'') and (mestre<>'') and (escravo<>'') then
                    begin
                      clRenegoc := TClassAuxiliar.Create;
                      conect   ('CREDITO',self);
                      ClearSql;
                      AddParam ('Select CLIENTE,CONTRATO_MESTRE,CONTRATO_ESCRAVO,            ');
                      AddParam ('       MENSALIDADE_INICIAL,CR_TIME                          ');
                      AddParam ('From CONTRATOS_RENEGOCIADOS                                 ');
                      AddParam ('Where (CLIENTE='+cliente+') AND                             ');
                      AddParam ('      (CONTRATO_MESTRE='+mestre+') AND                      ');
                      AddParam ('      (CONTRATO_ESCRAVO='+escravo+')                        ');
                      if (Execute) then
                      begin
                        ClearSql;
                        AddParam ('UPDATE CONTRATOS_RENEGOCIADOS                     ');
                        AddParam ('SET    CLIENTE=:CLIENTE,                          ');
                        AddParam ('       CONTRATO_MESTRE=:CONTRATO_MESTRE,          ');
                        AddParam ('       CONTRATO_ESCRAVO=:CONTRATO_ESCRAVO,        ');
                        AddParam ('       MENSALIDADE_INICIAL=:MENSALIDADE_INICIAL,  ');
                        AddParam ('       CR_TIME=:CR_TIME                           ');
                        AddParam ('Where (CLIENTE='+cliente+') AND                   ');
                        AddParam ('      (CONTRATO_MESTRE='+mestre+') AND            ');
                        AddParam ('      (CONTRATO_ESCRAVO='+escravo+')              ');
                        consulta.parambyname('CLIENTE').AsFloat := strtofloat(cliente);
                        consulta.parambyname('CONTRATO_MESTRE').AsFloat := strtofloat(mestre);
                        consulta.parambyname('CONTRATO_ESCRAVO').AsFloat := strtofloat(escravo);
                        consulta.parambyname('MENSALIDADE_INICIAL').AsFloat := strtofloat(campo04);
                        consulta.parambyname('CR_TIME').AsDateTime := TS1;
                        Execute;
                        totrenegoc2:=totrenegoc2+1;
                        mensagem_erro := '  AOK'
                      end
                      else
                      begin
                        ClearSql;
                        AddParam('INSERT INTO CONTRATOS_RENEGOCIADOS(CLIENTE,CONTRATO_MESTRE,CONTRATO_ESCRAVO,MENSALIDADE_INICIAL,CR_TIME)    ');
                        AddParam('VALUES (:CLIENTE,:CONTRATO_MESTRE,:CONTRATO_ESCRAVO,:MENSALIDADE_INICIAL,:CR_TIME)                          ');
                        consulta.parambyname('CLIENTE').AsFloat := strtofloat(cliente);
                        consulta.parambyname('CONTRATO_MESTRE').AsFloat := strtofloat(mestre);
                        consulta.parambyname('CONTRATO_ESCRAVO').AsFloat := strtofloat(escravo);
                        consulta.parambyname('MENSALIDADE_INICIAL').AsFloat := strtofloat(campo04);
                        consulta.parambyname('CR_TIME').AsDateTime := TS1;
                        Execute;
                        totrenegoc2:=totrenegoc2+1;
                        mensagem_erro := '  IOK'
                      end;
                      desconect;
                      Free;
                    end;
                end
                else
                if (op='E') then
                  with (clRenegoc) do
                    if (cliente<>'') and (mestre<>'') and (escravo<>'') then
                    begin
                      clRenegoc := TClassAuxiliar.Create;
                      conect ('CREDITO',self);
                      ClearSql;
                      AddParam ('Select CR_TIME From CONTRATOS_RENEGOCIADOS       ');
                      AddParam ('Where (CLIENTE='+cliente+') AND                  ');
                      AddParam ('      (CONTRATO_MESTRE='+mestre+') AND           ');
                      AddParam ('      (CONTRATO_ESCRAVO='+escravo+')             ');
                      if (Execute) then
                      begin
                        DeletaContratoRenegociado(cliente,mestre,escravo);
                        totrenegoc2:=totrenegoc2+1;
                        mensagem_erro := '  EOK'
                      end;
                      desconect;
                      Free;
                    end;
              except
                mensagem_erro := '  Reg. inconsistente'
              end;
              WriteLn (arqreg, form_t    (cliente,6)    +' '+
                form_t    (mestre,6)     +' '+
                form_t    (escravo,6)    +' '+
                form_data (TS1)          +'    '+
                form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
              indGauge:=indGauge+1;
              gauge1.progress:=Round((indGauge/totGauge)*100);
              gauge1.refresh;
            end;
            CloseFile  (arq);
            memo1.lines.Add (' Renegociações....: OK - Total..: '+form_n(totrenegoc,10)+' Registros alterados..: '+
              form_n(totrenegoc2,10));
            DeleteFile (nome_arq);
          end
          else
            memo1.lines.Add (' Renegociações....: Arquivo RENEGOC.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totrenegoc,10)+' registro(s)');

              
              {11. - Bloqueios de clientes ---------------------------------->}
          WriteLn (arqreg, 'Bloqueios de clientes');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Cliente  Status Data/Bloq  Data/Desbloq');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\BLOQCLI.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totbloq := 0;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              totbloq:=totbloq+1;
            end;
            Reset(arq);
            indGauge:=0;
            totGauge:=totbloq;
            gauge1.progress:=0;
            linha:='';
            totbloq2:=0;
            while (not Eof(arq)) do
            begin
                        {encapsulamento da rotina, nao permite erros --->}
              try
                ReadLn (arq,linha);
                pos:=1;
                tam:=6;
                campo01 := Copy(linha,pos,tam);
                pos:=7;
                tam:=1;
                campo02 := Copy(linha,pos,tam);
                pos:=8;
                tam:=10;
                campo03 := Copy(linha,pos,tam);
                pos:=18;
                tam:=10;
                campo04 := Copy(linha,pos,tam);
                pos:=28;
                tam:=80;
                campo05 := Copy(linha,pos,tam);
                pos:=108;
                tam:=1;
                op := Copy(linha,pos,tam);

                clBloq := TClassAuxiliar.Create;
                with (clBloq) do
                begin
                  conect   ('CREDITO',self);
                  ClearSql;
                  AddParam ('SELECT CLIENTE,DATABLOQ,DATADESBLOQ,STATUS,MOTIVO ');
                  AddParam ('FROM   CLIENTES_BLOQUEADOS                        ');
                  AddParam ('Where (CLIENTE='+campo01+')                       ');
                  if (Execute) then
                  begin
                    ClearSql;
                    AddParam ('UPDATE CLIENTES_BLOQUEADOS                   ');
                    AddParam ('SET    STATUS=:status,                       ');
                    AddParam ('       DATABLOQ=:databloq,                   ');
                    AddParam ('       DATADESBLOQ=:datadesbloq,             ');
                    AddParam ('       MOTIVO=:motivo                        ');
                    AddParam ('Where (CLIENTE='+campo01+')                  ');
                    consulta.parambyname('status').AsString        := campo02;
                    consulta.parambyname('databloq').AsDateTime    := strtodate(campo03);
                    consulta.parambyname('datadesbloq').AsDateTime := strtodate(campo04);
                    consulta.parambyname('motivo').AsString        := trim(campo05);
                    Execute;
                    totbloq2 := totbloq2 + 1;
                  end
                  else
                  begin
                    ClearSql;
                    AddParam ('INSERT INTO CLIENTES_BLOQUEADOS (CLIENTE,DATABLOQ,DATADESBLOQ,STATUS,MOTIVO)   ');
                    AddParam ('VALUES (:CLIENTE,:DATABLOQ,:DATADESBLOQ,:STATUS,:MOTIVO)                       ');
                    consulta.parambyname('CLIENTE').AsFloat        := strtofloat(campo01);
                    consulta.parambyname('STATUS').AsString        := campo02;
                    consulta.parambyname('DATABLOQ').AsDateTime    := strtodate(campo03);
                    consulta.parambyname('DATADESBLOQ').AsDateTime := strtodate(campo04);
                    consulta.parambyname('MOTIVO').AsString        := trim(campo05);
                    Execute;
                    totbloq2 := totbloq2 + 1;
                  end;
                  desconect;
                  Free;
                end;
              except
                mensagem_erro := '  Reg. inconsistente'
              end;
              WriteLn (arqreg, form_t    (campo01,6)    +' '+
                form_t    (campo02,1)    +' '+
                form_t    (campo03,10)   +' '+
                form_t    (campo04,10)   +' '+
                form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
              indGauge:=indGauge+1;
              gauge1.progress:=Round((indGauge/totGauge)*100);
              gauge1.refresh;
            end;
            CloseFile  (arq);
            memo1.lines.Add (' Cli. bloqueados..: OK - Total..: '+form_n(totbloq,10)+' Registros alterados..: '+
              form_n(totbloq2,10));
            DeleteFile (nome_arq);
          end
          else
            memo1.lines.Add (' Cli. bloqueados..: Arquivo BLOQCLI.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totrenegoc,10)+' registro(s)');

          clExp := TClassExport.Create;
          clExp.Inicializa;

          try
            if FileExists('C:\NATIVA\CREDITO\MOVIMENTO\CONTSPC.MTZ') then
            begin
              clExp.ImportaTabela ('CREDITO','CONTRATOS_SPC','C:\NATIVA\CREDITO\MOVIMENTO\CONTSPC.MTZ','CONTRATOS SPC',
                'LOJA,CLIENTE,CONTRATO,PARCELA','f,f,f,f',memo1,gauge1,true,'P',1);
              DeleteFile('C:\NATIVA\CREDITO\MOVIMENTO\CONTSPC.MTZ');
            end;

            if FileExists('C:\NATIVA\CREDITO\MOVIMENTO\PLANOS.MTZ') then
            begin
              clExp.ImportaTabela ('CREDITO','CREDPLANO','C:\NATIVA\CREDITO\MOVIMENTO\PLANOS.MTZ','PLANOS',
                'PL_CODI','f',memo1,gauge1,true,'P',1);
              DeleteFile('C:\NATIVA\CREDITO\MOVIMENTO\PLANOS.MTZ');
              DMF8.qPlanoF8.close;
              DMF8.qPlanoF8.open;
            end
            else
              memo1.lines.Add (' Planos...........: Arquivo PLANOS.MTZ  não encontrado');
          finally
            clexp.destroy;
          end;

//marcio---------------
              {12. - Usuários----------------------------------------------->}
          WriteLn (arqreg, 'Usuarios');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Codigo  Nome                           Alteracao     Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\USERS.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcli := 0;
            flag_erro_users := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              if (Length(linha)<>98) then
              begin
                flag_erro_users := true;
                break;
              end;
              totcli:=totcli+1;
            end;
            if (flag_erro_users) then
            begin
              showmessage('O arquivo de Usuários está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' usuários.........: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcli;
              gauge1.progress:=0;
              linha:='';
              totcli2:=0;
              deletatodosusers;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=10;
                  campo02 := Copy(linha,pos,tam);
                  pos:=17;
                  tam:=40;
                  campo03 := Copy(linha,pos,tam);
                  pos:=57;
                  tam:=6;
                  campo04 := Copy(linha,pos,tam);
                  pos:=63;
                  tam:=1;
                  campo05 := Copy(linha,pos,tam);
                  pos:=64;
                  tam:=10;
                  campo06 := Copy(linha,pos,tam);
                  pos:=74;
                  tam:=6;
                  campo07 := Copy(linha,pos,tam);
                  pos:=80;
                  tam:=6;
                  campo08 := Copy(linha,pos,tam);
                  pos:=86;
                  tam:=10;
                  campo09 := Copy(linha,pos,tam);
                  pos:=96;
                  tam:=1;
                  campo10 := Copy(linha,pos,tam);
                  pos:=97;
                  tam:=1;
                  campo11 := Copy(linha,pos,tam);
                  pos := 98;
                  tam := 1;
                  op  := Copy(linha,pos,tam);

                  {...}
                  codigo := Trim(campo01);
                  if (op='I') or (op='A') then
                    with (clUsers) do
                      if (codigo<>'') then
                      begin
                        clUsers := TClassAuxiliar.Create;
                        conect ('CREDITO',self);
                        ClearSql;
                        AddParam ('Select USCODE                         ');
                        AddParam ('From USERS                            ');
                        AddParam ('Where USCODE='+codigo+'               ');
                        if (Execute) then
                        begin
                                      {* a MATRIZ sempre sobrepoe a LOJA}
                          ClearSql;
                          AddParam ('UPADTE USERS SET (USCODE=:USCODE,USALIAS=:USALIAS,             ');
                          AddParam ('                  USNAME=:USNAME,USPASSWORD=:USPASSWORD,       ');
                          AddParam ('                  USTYPE=:USTYPE,USDCAD=:USDCAD,               ');
                          AddParam ('                  USSESSION=:USSESSION,USGRUPO=:USGRUPO,       ');
                          AddParam ('                  US_TIME=:US_TIME,USCHECKCHECK=:USCHECKCHECK, ');
                          AddParam ('                  USLIBERAZERADO=:USLIBERAZERADO)              ');
                          if (trim(campo01)<>'') then
                            consulta.ParamByName('USCODE').AsFloat := StrToFloat(campo01)
                          else
                            consulta.ParamByName('USCODE').AsFloat := 0;
                          consulta.ParamByName('USALIAS').AsString := campo02;
                          consulta.ParamByName('USNAME').AsString := campo03;
                          consulta.ParamByName('USPASSWORD').AsString := campo04;
                          consulta.ParamByName('USTYPE').AsString := campo05;
                          if (trim(campo06)<>'') then
                            consulta.ParamByName('USDCAD').AsDateTime := StrToDateTime(campo06)
                          else
                            consulta.ParamByName('USDCAD').AsDateTime := StrToDateTime('01/01/1900');
                          if (trim(campo07)<>'') then
                            consulta.ParamByName('USSESSION').AsFloat := StrToFloat(campo07)
                          else
                            consulta.ParamByName('USSESSION').AsFloat := 0;
                          if (trim(campo08)<>'') then
                            consulta.ParamByName('USGRUPO').AsFloat := StrToFloat(campo08)
                          else
                            consulta.ParamByName('USGRUPO').AsFloat := 0;
                          if (trim(campo09)<>'') then
                            consulta.ParamByName('US_TIME').AsDateTime := StrToDateTime(campo09)
                          else
                            consulta.ParamByName('US_TIME').AsDateTime := StrToDateTime('01/01/1900');
                          consulta.ParamByName('USCHECKCHECK').AsString := campo10;
                          consulta.ParamByName('USLIBERAZERADO').AsString := campo11;
                          Execute;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          ClearSql;
                          AddParam ('INSERT INTO USERS (USCODE,USALIAS,USNAME,USPASSWORD,     ');
                          AddParam ('                   USTYPE,USDCAD,USSESSION,USGRUPO,      ');
                          AddParam ('                   US_TIME,USCHECKCHECK,USLIBERAZERADO)  ');
                          AddParam ('           VALUES(:USCODE,:USALIAS,:USNAME,:USPASSWORD,  ');
                          AddParam ('                  :USTYPE,:USDCAD,:USSESSION,:USGRUPO,   ');
                          AddParam ('                  :US_TIME,:USCHECKCHECK,:USLIBERAZERADO)');
                          if (trim(campo01)<>'') then
                            consulta.ParamByName('USCODE').AsFloat := StrToFloat(campo01)
                          else
                            consulta.ParamByName('USCODE').AsFloat := 0;
                          consulta.ParamByName('USALIAS').AsString := campo02;
                          consulta.ParamByName('USNAME').AsString := campo03;
                          consulta.ParamByName('USPASSWORD').AsString := campo04;
                          consulta.ParamByName('USTYPE').AsString := campo05;
                          if (trim(campo06)<>'') then
                            consulta.ParamByName('USDCAD').AsDateTime := StrToDateTime(campo06)
                          else
                            consulta.ParamByName('USDCAD').AsDateTime := StrToDateTime('01/01/1900');
                          if (trim(campo07)<>'') then
                            consulta.ParamByName('USSESSION').AsFloat := StrToFloat(campo07)
                          else
                            consulta.ParamByName('USSESSION').AsFloat := 0;
                          if (trim(campo08)<>'') then
                            consulta.ParamByName('USGRUPO').AsFloat := StrToFloat(campo08)
                          else
                            consulta.ParamByName('USGRUPO').AsFloat := 0;
                          if (trim(campo09)<>'') then
                            consulta.ParamByName('US_TIME').AsDateTime := StrToDateTime(campo09)
                          else
                            consulta.ParamByName('US_TIME').AsDateTime := StrToDateTime('01/01/1900');
                          consulta.ParamByName('USCHECKCHECK').AsString := campo10;
                          consulta.ParamByName('USLIBERAZERADO').AsString := campo11;
                          Execute;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente'
                end;
                WriteLn (arqreg, form_t    (codigo,6)     +' '+
                  form_t    (campo02,30)   +' '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Usuários.........: OK - Total..: '+form_n(totcli,10)+' Registros alterados..: '+
                form_n(totcli2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Usuários.........: Arquivo USERS.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcli,10)+' registro(s)');


//marcio---------------
              {13. - Permissões----------------------------------------------->}
          WriteLn (arqreg, 'Permissões');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Codigo  Nome                           Alteracao     Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PERMS.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcli := 0;
            flag_erro_perms := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              if (Length(linha)<>14) then
              begin
                flag_erro_perms := true;
                break;
              end;
              totcli:=totcli+1;
            end;
            if (flag_erro_perms) then
            begin
              showmessage('O arquivo de permissões de usuários está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' permissões.........: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcli;
              gauge1.progress:=0;
              linha:='';
              totcli2:=0;
              deletatodosperms;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=6;
                  campo01 := Copy(linha,pos,tam);
                  pos:=7;
                  tam:=6;
                  campo02 := Copy(linha,pos,tam);
                  pos:=13;
                  tam:=1;
                  campo03 := Copy(linha,pos,tam);
                  pos:=14;
                  tam:=1;
                  op := Copy(linha,pos,tam);

                          {...}
                  codigo := Trim(campo01);
                  if (op='I') or (op='A') then
                    with (clPerms) do
                      if (codigo<>'') then
                      begin
                        clPerms := TClassAuxiliar.Create;
                        conect ('CREDITO',self);
                        ClearSql;
                        AddParam ('Select PERUSER                        ');
                        AddParam ('From PERMS                            ');
                        AddParam ('Where PERUSER='+codigo+'              ');
                        AddParam ('AND PERMODULE='+campo02+'             ');
                        AddParam ('AND PERTYPE='+chr(39)+campo03+chr(39)+'               ');
                        if (Execute) then
                        begin
                                      {* a MATRIZ sempre sobrepoe a LOJA}
                          ClearSql;
                          AddParam ('Updade PERMS set(                 ');
                          AddParam ('PERUSER=:PERUSER, ');
                          AddParam ('PERMODULE=:PERMODULE, ');
                          AddParam ('PERTYPE=:PERTYPE) ');
                          consulta.ParamByName('PERUSER').AsFloat := StrToFloat(campo01);
                          consulta.ParamByName('PERMODULE').AsFloat := StrToFloat(campo02);
                          consulta.ParamByName('PERTYPE').AsString := campo03;
                          Execute;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          ClearSql;
                          AddParam ('Insert into  PERMS            ');
                          AddParam ('(PERUSER,PERMODULE,PERTYPE)    ');
                          AddParam ('Values                ');
                          AddParam ('(:PERUSER,:PERMODULE,:PERTYPE)    ');
                          consulta.ParamByName('PERUSER').AsFloat := StrToFloat(campo01);
                          consulta.ParamByName('PERMODULE').AsFloat := StrToFloat(campo02);
                          consulta.ParamByName('PERTYPE').AsString := campo03;
                          Execute;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente'
                end;
                WriteLn (arqreg, form_t    (codigo,6)     +' '+
                  form_t    (campo02,6)   +' '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Permissão........: OK - Total..: '+form_n(totcli,10)+' Registros alterados..: '+
                form_n(totcli2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Permissão........: Arquivo CLIENTE.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcli,10)+' registro(s)');


//---------------

//marcio---------------
              {13. - Lojas----------------------------------------------->}
          WriteLn (arqreg, 'Lojas');
          WriteLn (arqreg, form_tc2('-',80,'-'));
          WriteLn (arqreg, 'Codigo  Nome                           Alteracao     Linha  Erro');
          WriteLn (arqreg, form_tc2('-',80,'-'));

          pnGauge1.visible:=true;
          gauge1.visible:=true;
          gauge1.progress:=0;
          nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CRELOJA.MTZ';
          if (FileExists(nome_arq)) then
          begin
            AssignFile (arq,nome_arq);
            Reset      (arq);
            totcli := 0;
            flag_erro_lojas := false;
            while (not Eof(arq)) do
            begin
              ReadLn (arq,linha);
              if (Length(linha)<>408) then
              begin
                flag_erro_lojas := true;
                break;
              end;
              totcli:=totcli+1;
            end;
            if (flag_erro_lojas) then
            begin
              showmessage('O arquivo de Lojas está fora do formato '+
                'adequado para importação. Informe o escritório para que a sua versão '+
                'do sistema seja atualizada!');
              CloseFile  (arq);
              memo1.lines.Add (' lojas.........: [ERRO: Arquivo fora do formato adequado!!!]');
            end
            else
            begin
              Reset(arq);
              indGauge:=0;
              totGauge:=totcli;
              gauge1.progress:=0;
              linha:='';
              totcli2:=0;
              deletatodoslojas;
              while (not Eof(arq)) do
              begin
                        {encapsulamento da rotina, nao permite erros --->}
                try
                  ReadLn (arq,linha);
                  pos:=1;
                  tam:=2;
                  campo01 := Copy(linha,pos,tam);
                  pos:=3;
                  tam:=40;
                  campo02 := Copy(linha,pos,tam);
                  pos:=43;
                  tam:=6;
                  campo03 := Copy(linha,pos,tam);
                  pos:=49;
                  tam:=50;
                  campo04 := Copy(linha,pos,tam);
                  pos:=99;
                  tam:=30;
                  campo05 := Copy(linha,pos,tam);
                  pos:=129;
                  tam:=20;
                  campo06 := Copy(linha,pos,tam);
                  pos:=149;
                  tam:=2;
                  campo07 := Copy(linha,pos,tam);
                  pos:=151;
                  tam:=8;
                  campo08 := Copy(linha,pos,tam);
                  pos:=159;
                  tam:=15;
                  campo09 := Copy(linha,pos,tam);
                  pos:=174;
                  tam:=1;
                  campo10 := Copy(linha,pos,tam);
                  pos:=175;
                  tam:=14;
                  campo11 := Copy(linha,pos,tam);
                  pos:=189;
                  tam:=1;
                  campo12 := Copy(linha,pos,tam);
                  pos:=190;
                  tam:=20;
                  campo13 := Copy(linha,pos,tam);
                  pos:=210;
                  tam:=10;
                  campo14 := Copy(linha,pos,tam);
                  pos:=220;
                  tam:=10;
                  campo15 := Copy(linha,pos,tam);
                  pos:=230;
                  tam:=2;
                  campo16 := Copy(linha,pos,tam);
                  pos:=232;
                  tam:=2;
                  campo17 := Copy(linha,pos,tam);
                  pos:=234;
                  tam:=10;
                  campo18 := Copy(linha,pos,tam);
                  pos:=244;
                  tam:=1;
                  campo19 := Copy(linha,pos,tam);
                  pos:=245;
                  tam:=4;
                  campo20 := Copy(linha,pos,tam);
                  pos:=249;
                  tam:=4;
                  campo21 := Copy(linha,pos,tam);
                  pos:=253;
                  tam:=80;
                  campo22 := Copy(linha,pos,tam);
                  pos:=333;
                  tam:=4;
                  campo23 := Copy(linha,pos,tam);
                  pos:=337;
                  tam:=40;
                  campo24 := Copy(linha,pos,tam);
                  pos:=377;
                  tam:=20;
                  campo25 := Copy(linha,pos,tam);
                  pos:=497;
                  tam:=1;
                  campo26 := Copy(linha,pos,tam);
                  pos:=398;
                  tam:=10;
                  campo27 := Copy(linha,pos,tam);
                  pos:=408;
                  tam:=1;
                  op := Copy(linha,pos,tam);

                          {...}
                  codigo := Trim(campo01);
                  multa := (StrToFloat(campo14)/100);
                  mora := (StrToFloat(campo15)/100);
                  mora := (StrToFloat(campo15)/100);
                  if (op='I') or (op='A') then
                    with (clCreloja) do
                      if (codigo<>'') then
                      begin
                        clCreloja := TClassAuxiliar.Create;
                        conect ('CREDITO',self);
                        ClearSql;
                        AddParam ('Select LO_CODI                        ');
                        AddParam ('From CRELOJA                          ');
                        AddParam ('Where LO_CODI='+codigo+'              ');
                        if (Execute) then
                        begin
                                      {* a MATRIZ sempre sobrepoe a LOJA}
                          ClearSql;
                          AddParam ('Updade CRELOJA set(                 ');
                          AddParam ('LO_CODI=:LO_CODI, ');
                          AddParam ('LO_NOME=:LO_NOME, ');
                          AddParam ('LO_GRUP=:LO_GRUP, ');
                          AddParam ('LO_ENDE=:LO_ENDE, ');
                          AddParam ('LO_BAIR=:LO_BAIR, ');
                          AddParam ('LO_CIDA=:LO_CIDA, ');
                          AddParam ('LO_ESTA=:LO_ESTA, ');
                          AddParam ('LO_CEP=:LO_CEP,   ');
                          AddParam ('LO_FONE=:LO_FONE, ');
                          AddParam ('LO_FILL=:LO_FILL, ');
                          AddParam ('LO_CGC=:LO_CGC,   ');
                          AddParam ('LO_INCE=:LO_INCE, ');
                          AddParam ('LO_SECA=:LO_SECA, ');
                          AddParam ('LO_MULT=:LO_MULT, ');
                          AddParam ('LO_MORA=:LO_MORA, ');
                          AddParam ('LO_DMUL=:LO_DMUL, ');
                          AddParam ('LO_DMOR=:LO_DMOR, ');
                          AddParam ('LO_DESC=:LO_DESC, ');
                          AddParam ('LO_EXIB=:LO_EXIB, ');
                          AddParam ('LO_CORE=:LO_CORE, ');
                          AddParam ('LO_CORF=:LO_CORF, ');
                          AddParam ('LO_EMAI=:LO_EMAI, ');
                          AddParam ('LO_METI=:LO_METI, ');
                          AddParam ('LO_RAZA=:LO_RAZA, ');
                          AddParam ('LO_INSC=:LO_INSC, ');
                          AddParam ('LO_FF8E=:LO_FF8E, ');
                          AddParam ('LO_TIME=:LO_TIME) ');
                          if (trim(campo01)<>'') then
                            consulta.ParamByName('LO_CODI').AsFloat := StrToFloat(campo01)
                          else
                            consulta.ParamByName('LO_CODI').AsFloat := StrToFloat(campo01);
                          consulta.ParamByName('LO_NOME').AsString := campo02;
                          if (trim(campo03)<>'') then
                            consulta.ParamByName('LO_GRUP').AsFloat := StrToFloat(campo03)
                          else
                            consulta.ParamByName('LO_GRUP').AsFloat := 0;
                          consulta.ParamByName('LO_ENDE').AsString := campo04;
                          consulta.ParamByName('LO_BAIR').AsString := campo05;
                          consulta.ParamByName('LO_CIDA').AsString := campo06;
                          consulta.ParamByName('LO_ESTA').AsString := campo07;
                          consulta.ParamByName('LO_CEP').AsString := campo08;
                          consulta.ParamByName('LO_FONE').AsString := campo09;
                          consulta.ParamByName('LO_FILL').AsString := campo10;
                          consulta.ParamByName('LO_CGC').AsString := campo11;
                          consulta.ParamByName('LO_INCE').AsString := campo12;
                          consulta.ParamByName('LO_SECA').AsString := campo13;
                          if (trim(campo14)<>'') then
                            consulta.ParamByName('LO_MULT').AsFloat := multa
                          else
                            consulta.ParamByName('LO_MULT').AsFloat := 0.00;
                          if (trim(campo15)<>'') then
                            consulta.ParamByName('LO_MORA').AsFloat := mora
                          else
                            consulta.ParamByName('LO_MORA').AsFloat := 0.00;
                          if (trim(campo16)<>'') then
                            consulta.ParamByName('LO_DMUL').AsInteger := StrToInt(campo16)
                          else
                            consulta.ParamByName('LO_DMUL').AsInteger := 0;
                          if (trim(campo17)<>'') then
                            consulta.ParamByName('LO_DMOR').AsInteger := StrToInt(campo17)
                          else
                            consulta.ParamByName('LO_DMOR').AsInteger := 0;
                          if (trim(campo18)<>'') then
                            consulta.ParamByName('LO_DESC').AsFloat := StrToFloat(campo18)
                          else
                            consulta.ParamByName('LO_DESC').AsFloat := 0;
                          consulta.ParamByName('LO_EXIB').AsString := campo19;
                          if (trim(campo20)<>'') then
                            consulta.ParamByName('LO_CORE').AsInteger := StrToInt(campo20)
                          else
                            consulta.ParamByName('LO_CORE').AsInteger := 0;
                          if (trim(campo21)<>'') then
                            consulta.ParamByName('LO_CORF').AsInteger := StrToInt(campo21)
                          else
                            consulta.ParamByName('LO_CORF').AsInteger := 0;
                          consulta.ParamByName('LO_EMAI').AsString := campo22;
                          if (trim(campo23)<>'') then
                            consulta.ParamByName('LO_METI').AsInteger := StrToInt(campo23)
                          else
                            consulta.ParamByName('LO_METI').AsInteger := 0;
                          consulta.ParamByName('LO_RAZA').AsString := campo24;
                          consulta.ParamByName('LO_INSC').AsString := campo25;
                          consulta.ParamByName('LO_FF8E').AsString := campo26;
                          if (trim(campo27)<>'') then
                            consulta.ParamByName('LO_TIME').AsDateTime := StrToDateTime(campo27)
                          else
                            consulta.ParamByName('LO_TIME').AsDateTime := StrToDateTime('01/01/1900');
                          Execute;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  AOK'
                        end
                        else
                        begin
                          ClearSql;
                          AddParam ('Insert into  CRELOJA                  ');
                          AddParam ('(LO_CODI, ');
                          AddParam ('LO_NOME, ');
                          AddParam ('LO_GRUP, ');
                          AddParam ('LO_ENDE, ');
                          AddParam ('LO_BAIR, ');
                          AddParam ('LO_CIDA, ');
                          AddParam ('LO_ESTA, ');
                          AddParam ('LO_CEP,  ');
                          AddParam ('LO_FONE, ');
                          AddParam ('LO_FILL, ');
                          AddParam ('LO_CGC,  ');
                          AddParam ('LO_INCE, ');
                          AddParam ('LO_SECA, ');
                          AddParam ('LO_MULT, ');
                          AddParam ('LO_MORA, ');
                          AddParam ('LO_DMUL, ');
                          AddParam ('LO_DMOR, ');
                          AddParam ('LO_DESC, ');
                          AddParam ('LO_EXIB, ');
                          AddParam ('LO_CORE, ');
                          AddParam ('LO_CORF, ');
                          AddParam ('LO_EMAI, ');
                          AddParam ('LO_METI, ');
                          AddParam ('LO_RAZA, ');
                          AddParam ('LO_INSC, ');
                          AddParam ('LO_FF8E, ');
                          AddParam ('LO_TIME) ');
                          AddParam ('Values                ');
                          AddParam ('(:LO_CODI, ');
                          AddParam (':LO_NOME, ');
                          AddParam (':LO_GRUP, ');
                          AddParam (':LO_ENDE, ');
                          AddParam (':LO_BAIR, ');
                          AddParam (':LO_CIDA, ');
                          AddParam (':LO_ESTA, ');
                          AddParam (':LO_CEP, ');
                          AddParam (':LO_FONE, ');
                          AddParam (':LO_FILL, ');
                          AddParam (':LO_CGC, ');
                          AddParam (':LO_INCE, ');
                          AddParam (':LO_SECA, ');
                          AddParam (':LO_MULT, ');
                          AddParam (':LO_MORA, ');
                          AddParam (':LO_DMUL, ');
                          AddParam (':LO_DMOR, ');
                          AddParam (':LO_DESC, ');
                          AddParam (':LO_EXIB, ');
                          AddParam (':LO_CORE, ');
                          AddParam (':LO_CORF, ');
                          AddParam (':LO_EMAI, ');
                          AddParam (':LO_METI, ');
                          AddParam (':LO_RAZA, ');
                          AddParam (':LO_INSC, ');
                          AddParam (':LO_FF8E, ');
                          AddParam (':LO_TIME) ');
                          if (trim(campo01)<>'') then
                            consulta.ParamByName('LO_CODI').AsFloat := StrToFloat(campo01)
                          else
                            consulta.ParamByName('LO_CODI').AsFloat := StrToFloat(campo01);
                          consulta.ParamByName('LO_NOME').AsString := campo02;
                          if (trim(campo03)<>'') then
                            consulta.ParamByName('LO_GRUP').AsFloat := StrToFloat(campo03)
                          else
                            consulta.ParamByName('LO_GRUP').AsFloat := 0;
                          consulta.ParamByName('LO_ENDE').AsString := campo04;
                          consulta.ParamByName('LO_BAIR').AsString := campo05;
                          consulta.ParamByName('LO_CIDA').AsString := campo06;
                          consulta.ParamByName('LO_ESTA').AsString := campo07;
                          consulta.ParamByName('LO_CEP').AsString := campo08;
                          consulta.ParamByName('LO_FONE').AsString := campo09;
                          consulta.ParamByName('LO_FILL').AsString := campo10;
                          consulta.ParamByName('LO_CGC').AsString := campo11;
                          consulta.ParamByName('LO_INCE').AsString := campo12;
                          consulta.ParamByName('LO_SECA').AsString := campo13;
                          if (trim(campo14)<>'') then
                            consulta.ParamByName('LO_MULT').AsFloat := multa
                          else
                            consulta.ParamByName('LO_MULT').AsFloat := 0.00;
                          if (trim(campo15)<>'') then
                            consulta.ParamByName('LO_MORA').AsFloat := mora
                          else
                            consulta.ParamByName('LO_MORA').AsFloat := 0.00;
                          if (trim(campo16)<>'') then
                            consulta.ParamByName('LO_DMUL').AsInteger := StrToInt(campo16)
                          else
                            consulta.ParamByName('LO_DMUL').AsInteger := 0;
                          if (trim(campo17)<>'') then
                            consulta.ParamByName('LO_DMOR').AsInteger := StrToInt(campo17)
                          else
                            consulta.ParamByName('LO_DMOR').AsInteger := 0;
                          if (trim(campo18)<>'') then
                            consulta.ParamByName('LO_DESC').AsFloat := StrToFloat(campo18)
                          else
                            consulta.ParamByName('LO_DESC').AsFloat := 0;
                          consulta.ParamByName('LO_EXIB').AsString := campo19;
                          if (trim(campo20)<>'') then
                            consulta.ParamByName('LO_CORE').AsInteger := StrToInt(campo20)
                          else
                            consulta.ParamByName('LO_CORE').AsInteger := 0;
                          if (trim(campo21)<>'') then
                            consulta.ParamByName('LO_CORF').AsInteger := StrToInt(campo21)
                          else
                            consulta.ParamByName('LO_CORF').AsInteger := 0;
                          consulta.ParamByName('LO_EMAI').AsString := campo22;
                          if (trim(campo23)<>'') then
                            consulta.ParamByName('LO_METI').AsInteger := StrToInt(campo23)
                          else
                            consulta.ParamByName('LO_METI').AsInteger := 0;
                          consulta.ParamByName('LO_RAZA').AsString := campo24;
                          consulta.ParamByName('LO_INSC').AsString := campo25;
                          consulta.ParamByName('LO_FF8E').AsString := campo26;
                          if (trim(campo27)<>'') then
                            consulta.ParamByName('LO_TIME').AsDateTime := StrToDateTime(campo27)
                          else
                            consulta.ParamByName('LO_TIME').AsDateTime := StrToDateTime('01/01/1900');
                          Execute;
                          totcli2:=totcli2+1;
                          mensagem_erro := '  IOK'
                        end;
                        desconect;
                        Free;
                      end;
                except
                  mensagem_erro := '  Reg. inconsistente'
                end;
                WriteLn (arqreg, form_t    (codigo,6)     +' '+
                  form_t    (campo02,6)   +' '+
                  form_nz   (indGauge+1,5) +mensagem_erro);

                        {...}
                indGauge:=indGauge+1;
                gauge1.progress:=Round((indGauge/totGauge)*100);
                gauge1.refresh;
              end;
              CloseFile  (arq);
              memo1.lines.Add (' Lojas............: OK - Total..: '+form_n(totcli,10)+' Registros alterados..: '+
                form_n(totcli2,10));
              DeleteFile (nome_arq);
            end;
          end
          else
            memo1.lines.Add (' Lojas............: Arquivo CLIENTE.MTZ  não encontrado');
          gauge1.progress:=0;
          WriteLn (arqreg, ' Total...: '+form_n(totcli,10)+' registro(s)');


//-----------------


          LinhaFim := Memo1.lInes.Count - 1;


              {**** finalizacao da importacao}
          gauge1.progress:=0;
          pnGauge1.visible:=false;
          memo1.lines.Add ('');
          memo1.lines.Add (' >>Importação concluída');
        end;

{*********************************************************************************************************}
{*********************************************************************************************************}
{*********************************************************************************************************}

          {b) MODELO DE IMPORTACAO DA MATRIZ/ESCRITORIO----------------------------------------}
        if (rdModelo.itemindex=1) then
        begin
              {Filtro de dados}
          codloja := Trim(edtLoja.text);

              {Pegando as lojas}
          memo1.lines.clear;
          memo1.lines.Add ('');
          memo1.lines.Add ('      Status da importação - Data/Hora: '+data+' '+hora+'  Usuario: '+nome_user);
          memo1.lines.Add ('---------------------------------------------------------------------------------');

              {...}
          clLoja  := TClassAuxiliar.Create;
          clLoja.conect   ('CREDITO',self);
          clLoja.ClearSql;
          clLoja.AddParam ('Select LO_CODI,LO_NOME          ');
          clLoja.AddParam ('From CRELOJA                    ');
          if (not chTodas.checked) then
            clLoja.AddParam ('Where (LO_CODI='+codloja+') ');
          if (not clLoja.Execute) then
            frmDialogo.ExibirMensagem ('Loja(s) não encontradas!'
              ,'Importação',[mbOk],
              frm_principal.x_pathimg+'iconequestion.bmp',250,200)
          else
          begin
                   {laco principal por loja}
            clLoja.first;
            while (not clLoja.eof) do
            begin
                      {Pegando o periodo exportado>>>>}
              nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PERIODO.L'+form_nz(clLoja.result('LO_CODI'),2);
              if (FileExists(nome_arq)) then
              begin
                AssignFile (arq,nome_arq);
                Reset      (arq);
                ReadLn     (arq, data1);
                ReadLn     (arq, data2);
                CloseFile  (arq);
                DeleteFile (nome_arq);
              end
              else
              begin
                data1:='';
                data2:='';
              end;
              WriteLn (arqreg, 'LOJA...: '+form_nz(clLoja.result('LO_CODI'),2)+'-'+
                ProcuraNomeLoja(clLoja.result('LO_CODI'),self));
              memo1.lines.Add ('LOJA...: '+form_nz(clLoja.result('LO_CODI'),2)+'-'+
                ProcuraNomeLoja(clLoja.result('LO_CODI'),self));
              if (data1<>'') then
              begin
                WriteLn (arqreg, 'Movimento enviado pela loja..: '+data1+' a '+data2);
                memo1.lines.Add ('Movimento enviado pela loja..: '+data1+' a '+data2);
                try
                  FLogExportacao.inicio  := StrtoDateN(Data1);
                  FLogExportacao.Fim     := StrtoDateN(Data2);
                except
                          //
                end;
              end;
              WriteLn (arqreg, form_tc2('-',80,'-'));

              if LinhaIni = -1 then
                LinhaINi := Memo1.Lines.Count;


                      {*** CRITICA - Verificando se o movimento recebido ja nao foi recebido anteriormente}
              continua2:=true;
              if (data1<>'') then
                if (FileExists('C:\NATIVA\CREDITO\MOVIMENTO\LOG.INI')) then
                begin
                  LogIni := TIniFile.Create ('C:\NATIVA\CREDITO\MOVIMENTO\LOG.INI');
                  ultima_importacao := LogIni.ReadString('Importacao','loja'+form_nz(clLoja.result('LO_CODI'),2), '?');
                  LogIni.Free;
                  if (ultima_importacao=data1+'-'+data2) then
                    if (frmDialogo.ExibirMensagem ('O movimento da loja'+form_nz(clLoja.result('LO_CODI'),2)+
                      ' neste período já foi importado. Deseja continuar?'
                      ,'Importação de movimento',[mbYes,mbNo],
                      frm_principal.x_pathimg+'iconequestion.bmp',450,300)=mrYes) then
                      continua2:=true
                    else
                      continua2:=false;
                end;

                      {...}
              if (continua2) then
              begin
                        {1. - Clientes----------------------------------------------->}
                WriteLn (arqreg, 'Clientes');
                WriteLn (arqreg, form_tc2('-',80,'-'));
                WriteLn (arqreg, 'Codigo  Nome                           Alteracao     Linha  Erro');
                WriteLn (arqreg, form_tc2('-',80,'-'));

                pnGauge1.visible:=true;
                gauge1.visible:=true;
                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIENTE.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totcli := 0;
                  flag_erro_crecli := false;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    if (Length(linha)<>882) then
                    begin
                      flag_erro_crecli := true;
                      break;
                    end;
                    totcli:=totcli+1;
                  end;
                  if (flag_erro_crecli) then
                  begin
                    showmessage('O arquivo de clientes está fora do formato '+
                      'adequado para importação. Informe a loja correspondente para que a sua versão '+
                      'do sistema seja atualizada!');
                    CloseFile  (arq);
                    memo1.lines.Add (' Clientes.........: [ERRO: Arquivo fora do formato adequado!!!]');
                  end
                  else
                  begin
                    Reset(arq);
                    indGauge:=0;
                    totGauge:=totcli;
                    gauge1.progress:=0;
                    linha:='';
                    totcli2:=0;
                    while (not Eof(arq)) do
                    begin
                               {encapsulamento da rotina, nao permite erros --->}
                      try
                        ReadLn (arq,linha);
                        pos:=1;
                        tam:=6;
                        campo01 := Copy(linha,pos,tam);
                        pos:=7;
                        tam:=40;
                        campo02 := Copy(linha,pos,tam);
                        pos:=47;
                        tam:=14;
                        campo03 := Copy(linha,pos,tam);
                        pos:=61;
                        tam:=50;
                        campo04 := Copy(linha,pos,tam);
                        pos:=111;
                        tam:=2;
                        campo05 := Copy(linha,pos,tam);
                        pos:=113;
                        tam:=1;
                        campo06 := Copy(linha,pos,tam);
                        pos:=114;
                        tam:=30;
                        campo07 := Copy(linha,pos,tam);
                        pos:=144;
                        tam:=20;
                        campo08 := Copy(linha,pos,tam);
                        pos:=164;
                        tam:=2;
                        campo09 := Copy(linha,pos,tam);
                        pos:=166;
                        tam:=8;
                        campo10 := Copy(linha,pos,tam);
                        pos:=174;
                        tam:=15;
                        campo11 := Copy(linha,pos,tam);
                        pos:=189;
                        tam:=15;
                        campo12 := Copy(linha,pos,tam);
                        pos:=204;
                        tam:=15;
                        campo13 := Copy(linha,pos,tam);
                        pos:=219;
                        tam:=10;
                        campo14 := Copy(linha,pos,tam);
                        pos:=229;
                        tam:=25;
                        campo15 := Copy(linha,pos,tam);
                        pos:=254;
                        tam:=10;
                        campo16 := Copy(linha,pos,tam);
                        pos:=264;
                        tam:=1;
                        campo17 := Copy(linha,pos,tam);
                        pos:=265;
                        tam:=40;
                        campo18 := Copy(linha,pos,tam);
                        pos:=305;
                        tam:=40;
                        campo19 := Copy(linha,pos,tam);
                        pos:=345;
                        tam:=40;
                        campo20 := Copy(linha,pos,tam);
                        pos:=385;
                        tam:=40;
                        campo21 := Copy(linha,pos,tam);
                        pos:=425;
                        tam:=15;
                        campo22 := Copy(linha,pos,tam);
                        pos:=440;
                        tam:=40;
                        campo23 := Copy(linha,pos,tam);
                        pos:=480;
                        tam:=15;
                        campo24 := Copy(linha,pos,tam);
                        pos:=495;
                        tam:=30;
                        campo25 := Copy(linha,pos,tam);
                        pos:=525;
                        tam:=20;
                        campo26 := Copy(linha,pos,tam);
                        pos:=545;
                        tam:=50;
                        campo27 := Copy(linha,pos,tam);
                        pos:=595;
                        tam:=15;
                        campo28 := Copy(linha,pos,tam);
                        pos:=610;
                        tam:=5;
                        campo29 := Copy(linha,pos,tam);
                        pos:=615;
                        tam:=10;
                        campo30 := Copy(linha,pos,tam);
                        pos:=625;
                        tam:=20;
                        campo31 := Copy(linha,pos,tam);
                        pos:=645;
                        tam:=10;
                        campo32 := Copy(linha,pos,tam);
                        pos:=655;
                        tam:=10;
                        campo33 := Copy(linha,pos,tam);
                        pos:=665;
                        tam:=1;
                        campo34 := Copy(linha,pos,tam);
                        pos:=666;
                        tam:=1;
                        campo35 := Copy(linha,pos,tam);
                        pos:=667;
                        tam:=1;
                        campo36 := Copy(linha,pos,tam);
                        pos:=668;
                        tam:=10;
                        campo37 := Copy(linha,pos,tam);
                        pos:=678;
                        tam:=10;
                        campo38 := Copy(linha,pos,tam);
                        pos:=688;
                        tam:=10;
                        campo39 := Copy(linha,pos,tam);
                        pos:=698;
                        tam:=10;
                        campo40 := Copy(linha,pos,tam);
                        pos:=708;
                        tam:=10;
                        campo41 := Copy(linha,pos,tam);
                        pos:=718;
                        tam:=5;
                        campo42 := Copy(linha,pos,tam);
                        pos:=723;
                        tam:=50;
                        campo43 := Copy(linha,pos,tam);
                        pos:=773;
                        tam:=1;
                        campo44 := Copy(linha,pos,tam);
                        pos:=774;
                        tam:=10;
                        campo45 := Copy(linha,pos,tam);
                        pos:=784;
                        tam:=4;
                        campo46 := Copy(linha,pos,tam);
                        pos:=788;
                        tam:=80;
                        campo47 := Copy(linha,pos,tam);
                        pos:=868;
                        tam:=4;
                        campo48 := Copy(linha,pos,tam);
                        pos:=872;
                        tam:=10;
                        TS1 := strtodate(Copy(linha,pos,tam));
                        pos:=882;
                        tam:=1;
                        op  := Copy(linha,pos,tam);

                                  {...}
                        codigo := Trim(campo01);
                        if (op='I') or (op='A') then
                        begin
                          with (clCliente) do
                            if (codigo<>'') then
                            begin
                              clCliente := TClassCliente.Create;
                              conect   ('CREDITO',self);
                              ClearFields;
                              ClearSql;
                              AddParam ('Select CL_CODI,CL_TIME,CL_CFUN,    ');
                              AddParam ('       CL_TPRO,CL_RSPC,CL_DSPC,    ');
                              AddParam ('       CL_DREG                     ');
                              AddParam ('From CRECLI                        ');
                              AddParam ('Where (CL_CODI='+codigo+')         ');
                              inCL_CODI := strtofloat(codigo);
                              inCL_NOME := Trim(campo02);
                              inCL_CPF  := Trim(campo03);
                              inCL_ENDE := Trim(campo04);
                              inCL_LOJA := strtofloat(campo05);
                              inCL_SEXO := campo06;
                              inCL_BAIR := Trim(campo07);
                              inCL_CIDA := Trim(campo08);
                              inCL_ESTA := Trim(campo09);
                              inCL_CEP  := Trim(campo10);
                              inCL_FONE := Trim(campo11);
                              inCL_FAX  := Trim(campo12);
                              inCL_CELU := Trim(campo13);
                              inCL_DTNA := strtodate(campo14);
                              inCL_IDEN := Trim(campo15);
                              inCL_OEXP := Trim(campo16);
                              inCL_ECIV := Trim(campo17);
                              inCL_CONJ := Trim(campo18);
                              inCL_NPAI := Trim(campo19);
                              inCL_NMAE := Trim(campo20);
                              inCL_REF1 := Trim(campo21);
                              inCL_TRF1 := Trim(campo22);
                              inCL_REF2 := Trim(campo23);
                              inCL_TRF2 := Trim(campo24);
                              inCL_EMPR := Trim(campo25);
                              inCL_CARG := Trim(campo26);
                              inCL_EEMP := Trim(campo27);
                              inCL_FEMP := Trim(campo28);
                              inCL_REMP := Trim(campo29);
                              inCL_DADM := strtodate(Trim(campo30));
                              inCL_CPRO := Trim(campo31);
                              inCL_SALA := strtofloat(campo32)/100;
                              inCL_LIMC := strtofloat(campo33)/100;
                              inCL_CFUN := Trim(campo34);
                              inCL_TPRO := Trim(campo35);
                              inCL_RSPC := Trim(campo36);
                              inCL_DSPC := strtodate(Trim(campo37));
                              inCL_DREG := strtodate(Trim(campo38));
                              inCL_VALI := strtodate(Trim(campo39));
                              inCL_DTCA := strtodate(Trim(campo40));
                              inCL_ULTC := strtodate(Trim(campo41));
                              inCL_QTDC := strtofloat(campo42)/100;
                              inCL_OBSE := Trim(campo43);
                              inCL_ALTE := Trim(campo44);
                              inCL_DULP := strtodate(Trim(campo45));
                              inCL_PDC  := Trim(campo46);
                              inCL_EMAI := Trim(campo47);
                              inCL_LIVR := Trim(campo48);
                              inCL_TIME := TS1;
                              mensagem_erro:='  Reg. desatualizado';
                              if (Execute) then
                              begin
                                              {permite, para o caso de ser cliente de contrato novo}
                                              {onde o cadastro do cliente é 'REFEITO'}
                                if (TS1>=result('CL_TIME')) then
                                begin
                                  inCL_CFUN := result('CL_CFUN');
                                  inCL_TPRO := result('CL_TPRO');
                                  inCL_RSPC := result('CL_RSPC');
                                  inCL_DSPC := result('CL_DSPC');
                                  inCL_DREG := result('CL_DREG');
                                  UpdateAll;
                                end;
                                totcli2:=totcli2+1;
                                mensagem_erro:='  AOK';
                              end
                              else
                              begin
                                Insert;
                                totcli2:=totcli2+1;
                                mensagem_erro:='  IOK';
                              end;
                              desconect;
                              Free;
                            end;
                        end
                        else
                        if (op='E') then
                                  {nao faz nada};
                      except
                        mensagem_erro := '  Reg. inconsistente'
                      end;
                      WriteLn (arqreg, form_t    (codigo,6)     +' '+
                        form_t    (campo02,30)   +' '+
                        form_data (TS1)          +'    '+
                        form_nz   (indGauge+1,5) +mensagem_erro);

                               {...}
                      indGauge:=indGauge+1;
                      gauge1.progress:=Round((indGauge/totGauge)*100);
                      gauge1.refresh;
                    end;
                    CloseFile  (arq);
                    memo1.lines.Add (' Cliente..........: OK - Total..: '+form_n(totcli,10)+' Registros alterados..: '+
                      form_n(totcli2,10));
                    DeleteFile (nome_arq);
                  end;
                end
                else
                  memo1.lines.Add (' Cliente..........: Arquivo '+nome_arq+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totcli,10)+' registro(s)');



                        {2. - Contratos---------------------------------------------->}
                WriteLn (arqreg, '');
                WriteLn (arqreg, 'Contratos');
                WriteLn (arqreg, form_tc2('-',80,'-'));
                WriteLn (arqreg, 'Cliente  Contrato  Alteracao    Linha  Erro');
                WriteLn (arqreg, form_tc2('-',80,'-'));

                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CONTRATO.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totctr := 0;
                  flag_erro_crectabr := false;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    if (Length(linha)<>222) then
                    begin
                      flag_erro_crectabr := true;
                      break;
                    end;
                    totctr:=totctr+1;
                  end;
                  if (flag_erro_crectabr) then
                  begin
                    showmessage('O arquivo de contratos está fora do formato '+
                      'adequado para importação. Informe a loja correspondente para que a sua versão '+
                      'do sistema seja atualizada!');
                    CloseFile  (arq);
                    memo1.lines.Add (' Contratos........: [ERRO: Arquivo fora do formato adequado!!!]');
                  end
                  else
                  begin
                    Reset(arq);
                    indGauge:=0;
                    totGauge:=totctr;
                    gauge1.progress:=0;
                    linha:='';
                    totctr2:=0;
                    while (not Eof(arq)) do
                    begin
                               {encapsulamento da rotina, nao permite erros --->}
                      try
                        ReadLn (arq,linha);
                        pos:=1;
                        tam:=6;
                        campo01 := Copy(linha,pos,tam);
                        pos:=7;
                        tam:=6;
                        campo02 := Copy(linha,pos,tam);
                        pos:=13;
                        tam:=2;
                        campo03 := Copy(linha,pos,tam);
                        pos:=15;
                        tam:=10;
                        campo04 := Copy(linha,pos,tam);
                        pos:=25;
                        tam:=2;
                        campo05 := Copy(linha,pos,tam);
                        pos:=27;
                        tam:=10;
                        campo06 := Copy(linha,pos,tam);
                        pos:=37;
                        tam:=6;
                        campo07 := Copy(linha,pos,tam);
                        pos:=43;
                        tam:=4;
                        campo08 := Copy(linha,pos,tam);
                        pos:=47;
                        tam:=15;
                        campo09 := Copy(linha,pos,tam);
                        pos:=62;
                        tam:=15;
                        campo10 := Copy(linha,pos,tam);
                        pos:=77;
                        tam:=3;
                        campo11 := Copy(linha,pos,tam);
                        pos:=80;
                        tam:=2;
                        campo12 := Copy(linha,pos,tam);
                        pos:=82;
                        tam:=2;
                        campo13 := Copy(linha,pos,tam);
                        pos:=84;
                        tam:=5;
                        campo14 := Copy(linha,pos,tam);
                        pos:=89;
                        tam:=1;
                        campo15 := Copy(linha,pos,tam);
                        pos:=90;
                        tam:=1;
                        campo16 := Copy(linha,pos,tam);
                        pos:=91;
                        tam:=15;
                        campo17 := Copy(linha,pos,tam);
                        pos:=106;
                        tam:=10;
                        campo18 := Copy(linha,pos,tam);
                        pos:=116;
                        tam:=15;
                        campo19 := Copy(linha,pos,tam);
                        pos:=131;
                        tam:=1;
                        campo20 := Copy(linha,pos,tam);
                        pos:=132;
                        tam:=80;
                        campo21 := Copy(linha,pos,tam);
                        pos:=212;
                        tam:=10;
                        TS1 := strtodate(Copy(linha,pos,tam));
                        pos:=222;
                        tam:=1;
                        op  := Copy(linha,pos,tam);

                                  {...}
                        cliente := Trim(campo01);
                        codigo  := Trim(campo02);
                        if (op='I') or (op='A') then
                        begin
                          with (clContrato) do
                            if (codigo<>'') then
                            begin
                              clContrato := TClassContrato.Create;
                              conect   ('CREDITO',self);
                              ClearFields;
                              ClearSql;
                              AddParam ('Select CR_CLIE,CR_CODI,CR_TIME,CR_PDEV  ');
                              AddParam ('From   CRECTABR                         ');
                              AddParam ('Where (CR_CLIE='+cliente+') AND         ');
                              AddParam ('      (CR_CODI='+codigo+')              ');
                              inCR_CLIE := strtofloat(cliente);
                              inCR_CODI := strtofloat(codigo);
                              inCR_LOJA := strtofloat(campo03);
                              inCR_NOTA := Trim(campo04);
                              inCR_SERI := Trim(campo05);
                              inCR_DNOT := strtodate(campo06);
                              inCR_AVAL := strtofloat(campo07);
                              inCR_PORT := strtofloat(campo08);
                              inCR_TOTA := strtofloat(campo09)/100;
                              inCR_VENT := strtofloat(campo10)/100;
                              inCR_PLAN := strtofloat(campo11);
                              inCR_QPRE := strtofloat(campo12);
                              inCR_PDEV := strtofloat(campo13);
                              inCR_FATO := strtofloat(campo14)/100;
                              inCR_CARN := Trim(campo15);
                              inCR_FICH := Trim(campo16);
                              inCR_VDEV := strtofloat(campo17)/100;
                              inCR_DTRA := strtodate(campo18);
                              inCR_TOT2 := strtofloat(campo19)/100;
                              inCR_BOLE := Trim(campo20);
                              inCR_OBSE := Trim(campo21);
                              inCR_TIME := TS1;
                              mensagem_erro:='  Reg. desatualizado';
                              if (Execute) then
                                         {nao faz nada}
                              else
                              begin
                                Insert;
                                totctr2:=totctr2+1;
                                mensagem_erro:='  IOK';
                              end;
                              desconect;
                              Free;
                            end;
                        end
                        else
                        if (op='E') then
                                  {nao faz nada};
                      except
                        mensagem_erro := '  Reg. inconsistente';
                      end;
                      WriteLn (arqreg, form_t    (cliente,6)  +'   '+
                        form_t    (codigo,6)   +'   '+
                        form_data (TS1)+'    '+
                        form_nz   (indGauge+1,5) +mensagem_erro);

                               {...}
                      indGauge:=indGauge+1;
                      gauge1.progress:=Round((indGauge/totGauge)*100);
                      gauge1.refresh;
                    end;
                    CloseFile  (arq);
                    memo1.lines.Add (' Contrato.........: OK - Total..: '+form_n(totctr,10)+' Registros alterados..: '+
                      form_n(totctr2,10));
                    DeleteFile (nome_arq);
                  end;
                end
                else
                  memo1.lines.Add (' Contrato.........: Arquivo '+nome_arq+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totctr,10)+' registro(s)');

                        {3. - Prestacoes -------------------------------------------->}
                WriteLn (arqreg, '');
                WriteLn (arqreg, 'Prestacoes');
                WriteLn (arqreg, form_tc2('-',80,'-'));
                WriteLn (arqreg, 'Cliente  Contrato  Prestacao  Alteracao    Linha  Erro');
                WriteLn (arqreg, form_tc2('-',80,'-'));

                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\PRESTAC.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totptr := 0;
                  flag_erro_creprabr := false;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    if (Length(linha)<>177) then
                    begin
                      flag_erro_creprabr := true;
                      break;
                    end;
                    totptr:=totptr+1;
                  end;
                  if (flag_erro_creprabr) then
                  begin
                    showmessage('O arquivo de prestações está fora do formato '+
                      'adequado para importação. Informe a loja correspondente para que a sua versão '+
                      'do sistema seja atualizada!');
                    CloseFile  (arq);
                    memo1.lines.Add (' Prestações.......: [ERRO: Arquivo fora do formato adequado!!!]');
                  end
                  else
                  begin
                    Reset(arq);
                    indGauge:=0;
                    totGauge:=totptr;
                    gauge1.progress:=0;
                    linha:='';
                    totptr2:=0;
                    while (not Eof(arq)) do
                    begin
                               {encapsulamento da rotina, nao permite erros --->}
                      try
                        ReadLn (arq,linha);
                        pos:=1;
                        tam:=2;
                        campo01 := Copy(linha,pos,tam);
                        pos:=3;
                        tam:=15;
                        campo02 := Copy(linha,pos,tam);
                        pos:=18;
                        tam:=5;
                        campo03 := Copy(linha,pos,tam);
                        pos:=23;
                        tam:=10;
                        campo04 := Copy(linha,pos,tam);
                        pos:=33;
                        tam:=10;
                        campo05 := Copy(linha,pos,tam);
                        pos:=43;
                        tam:=10;
                        campo06 := Copy(linha,pos,tam);
                        pos:=53;
                        tam:=2;
                        campo07 := Copy(linha,pos,tam);
                        pos:=55;
                        tam:=4;
                        campo08 := Copy(linha,pos,tam);
                        pos:=59;
                        tam:=6;
                        campo09 := Copy(linha,pos,tam);
                        pos:=65;
                        tam:=3;
                        campo10 := Copy(linha,pos,tam);
                        pos:=68;
                        tam:=2;
                        campo11 := Copy(linha,pos,tam);
                        pos:=70;
                        tam:=15;
                        campo12 := Copy(linha,pos,tam);
                        pos:=85;
                        tam:=5;
                        campo13 := Copy(linha,pos,tam);
                        pos:=90;
                        tam:=1;
                        campo14 := Copy(linha,pos,tam);
                        pos:=91;
                        tam:=6;
                        campo15 := Copy(linha,pos,tam);
                        pos:=97;
                        tam:=6;
                        campo16 := Copy(linha,pos,tam);
                        pos:=103;
                        tam:=10;
                        campo17 := Copy(linha,pos,tam);
                        pos:=113;
                        tam:=2;
                        campo18 := Copy(linha,pos,tam);
                        pos:=115;
                        tam:=10;
                        campo19 := Copy(linha,pos,tam);
                        pos:=125;
                        tam:=14;
                        campo20 := Copy(linha,pos,tam);
                        pos:=139;
                        tam:=6;
                        campo21 := Copy(linha,pos,tam);
                        pos:=145;
                        tam:=10;
                        campo22 := Copy(linha,pos,tam);
                        pos:=155;
                        tam:=10;
                        campo23 := Copy(linha,pos,tam);
                        pos:=165;
                        tam:=2;
                        campo24 := Copy(linha,pos,tam);
                        pos:=167;
                        tam:=10;
                        TS1 := strtodate(Copy(linha,pos,tam));
                        pos:=177;
                        tam:=1;
                        op  := Copy(linha,pos,tam);

                                  {...}
                        cliente   := Trim(campo16);
                        codigo    := Trim(campo15);
                        prestacao := Trim(campo01);
                        if (op='I') or (op='A') then
                        begin
                          with (clPrestacao) do
                            if (cliente<>'') and (codigo<>'') and (prestacao<>'') then
                            begin
                              clPrestacao := TClassPrestContrat.Create;
                              conect   ('CREDITO',self);
                              ClearFields;
                              ClearSql;
                              AddParam ('Select PC_CLIE,PC_CONT,PC_TIME,PC_STAT  ');
                              AddParam ('From   CREPRABR                         ');
                              AddParam ('Where (PC_CLIE='+cliente+') AND         ');
                              AddParam ('      (PC_CONT='+codigo+') AND          ');
                              AddParam ('      (PC_NPRE='+prestacao+')           ');
                              inPC_NPRE := strtofloat(Trim(campo01));
                              inPC_VALO := strtofloat(campo02)/100;
                              inPC_FATO := strtofloat(campo03)/100;
                              inPC_DCON := strtodate(campo04);
                              inPC_DVTO := strtodate(campo05);
                              inPC_DTPG := strtodate(campo06);
                              inPC_LOJA := strtofloat(campo07);
                              inPC_PORT := strtofloat(campo08);
                              inPC_AVAL := strtofloat(campo09);
                              inPC_PLAN := strtofloat(campo10);
                              inPC_LJPG := strtofloat(campo11);
                              inPC_VPAG := strtofloat(campo12)/100;
                              inPC_SALD := strtofloat(campo13);
                              inPC_STAT := Trim(campo14);
                              inPC_CONT := strtofloat(campo15);
                              inPC_CLIE := strtofloat(campo16);
                              inPC_CHEQ := strtofloat(campo17);
                              inPC_TPRE := strtofloat(campo18);
                              inPC_DTRA := strtodate(campo19);
                              inPC_CCGC := Trim(campo20);
                              inPC_BANC := strtofloat(campo21);
                              inPC_AGEN := Trim(campo22);
                              inPC_NUME := strtofloat(campo23);
                              inPC_FPGT := strtofloat(campo24);
                              inPC_TIME := TS1;
                              mensagem_erro:='  Reg. desatualizado';
                              if (Execute) then
                              begin
                                if (Result('PC_STAT') <> 1) and (inPC_VPAG > 0) then
                                  if (databasecontas='CONTASPAGAR') then
                                    try
                                      query1 := tquery.create(application);
                                      query1.databasename := 'CONTASPAGAR';
                                      query1.sql.clear;
                                      query1.sql.add('Delete from Lancamentos_Conta_Caixa ');
                                      query1.sql.add('Where La_Doc =:Doc');
                                      query1.parambyname('Doc').AsString := 'CR'+floattostr(inPC_CLIE)+'.'+floattostr(inPC_CONT)+'.'+floattostr(inPC_NPRE);
                                      query1.execsql;

                                      query1.sql[0] := 'Delete from Lancamentos';
                                      query1.execsql;

                                      if (inPC_STAT = '1')  then
                                        QuitaPrestacao (inPC_CLIE,
                                          inPC_CONT,
                                          inPC_NPRE,
                                          inPC_LJPG,
                                          inPC_VPAG,
                                          inPC_DTPG,
                                          inPC_FPGT,
                                          true);

                                    finally
                                      query1.destroy;
                                    end;
                                              {nao faz nada}
                              end
                              else
                              if (inPC_NPRE<=VerificaQtdePrestacoesNoContrato(inPC_CLIE,inPC_CONT)) then
                              begin
                                Insert;
                                totptr2:=totptr2+1;
                                mensagem_erro:='  IOK'
                              end
                              else
                                              {nao faz nada};
                              desconect;
                              Free;
                            end;
                        end
                        else
                        if (op='E') then
                                  {nao faz nada}
                        else
                        if (op='P') then
                        begin
                          clPrestacao := TClassPrestContrat.Create;
                          clPrestacao.conect   ('CREDITO',self);
                          clPrestacao.ClearFields;
                          clPrestacao.ClearSql;
                          clPrestacao.AddParam ('Select PC_STAT                          ');
                          clPrestacao.AddParam ('From   CREPRABR                         ');
                          clPrestacao.AddParam ('Where (PC_CLIE='+cliente+') AND         ');
                          clPrestacao.AddParam ('      (PC_CONT='+codigo+') AND          ');
                          clPrestacao.AddParam ('      (PC_NPRE='+prestacao+')           ');
                          if (clPrestacao.Execute) then
                            if (clPrestacao.Result('PC_STAT')='0') then
                            begin
                                                {******************************************************}
                                                {ja atualiza o CONTRATO e o CLIENTE}
                              QuitaPrestacao (strtofloat(cliente),
                                strtofloat(codigo),
                                strtofloat(prestacao),
                                strtofloat(campo11),
                                strtofloat(campo12)/100,
                                strtodate(campo06),
                                strtofloatn(campo24));
                              totptr2:=totptr2+1;
                              mensagem_erro := '  POK';
                                                {******************************************************}
                            end//Somente se a prestacao no ESCRITORIO estiver em aberto!!!!
                          ;
                          clPrestacao.desconect;
                          clPrestacao.Free;
                        end;
                      except
                        mensagem_erro:='  Reg. inconsistente';
                      end;
                      WriteLn (arqreg, form_t    (cliente  ,6)  +'   '+
                        form_t    (codigo   ,6)  +'    '+
                        form_t    (prestacao,2)  +'        '+
                        form_data (TS1)+'    '+
                        form_nz   (indGauge+1,5) +mensagem_erro);

                               {...}
                      indGauge:=indGauge+1;
                      gauge1.progress:=Round((indGauge/totGauge)*100);
                      gauge1.refresh;
                    end;
                    CloseFile  (arq);
                    memo1.lines.Add (' Prestações.......: OK - Total..: '+form_n(totptr,10)+' Registros alterados..: '+
                      form_n(totptr2,10));
                    DeleteFile (nome_arq);
                  end;
                end
                else
                  memo1.lines.Add (' Prestações.......: Arquivo '+nome_arq+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totptr,10)+' registro(s)');

                        {4. - Cheques pre-datados-------------------------------------------->}
                Writeln (arqreg, '');
                Writeln (arqreg, 'Cheques pre-datados');
                Writeln (arqreg, form_tc2('-',80,'-'));
                Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
                Writeln (arqreg, form_tc2('-',80,'-'));

                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPRE.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  flag_erro_cheqpre := false;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    linha := Trim(linha);
                    if (Length(linha)<>218) then
                    begin
                      flag_erro_cheqpre := true;
                      break;
                    end;
                    totcheq:=totcheq+1;
                  end;
                  if (flag_erro_cheqpre) then
                  begin
                    showmessage('O arquivo de cheques pré-datados está fora do formato '+
                      'adequado para importação. Informe a loja correspondente para que a sua versão '+
                      'do sistema seja atualizada!');
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques pré......: [ERRO: Arquivo fora do formato adequado!!!]');
                  end
                  else
                  begin
                    Reset(arq);
                    indGauge:=0;
                    totGauge:=totcheq;
                    gauge1.progress:=0;
                    linha:='';
                    totcheq2:=0;
                    while (not Eof(arq)) do
                    begin
                               {encapsulamento da rotina, nao permite erros --->}
                      try
                        ReadLn (arq,linha);
                        pos:=1;
                        tam:=6;
                        campo01 := Copy(linha,pos,tam);
                        pos:=7;
                        tam:=14;
                        campo02 := Copy(linha,pos,tam);
                        pos:=21;
                        tam:=3;
                        campo03 := Copy(linha,pos,tam);
                        pos:=24;
                        tam:=7;
                        campo04 := Copy(linha,pos,tam);
                        pos:=31;
                        tam:=10;
                        campo05 := Copy(linha,pos,tam);
                        pos:=41;
                        tam:=40;
                        campo06 := Copy(linha,pos,tam);
                        pos:=81;
                        tam:=15;
                        campo07 := Copy(linha,pos,tam);
                        pos:=96;
                        tam:=2;
                        campo08 := Copy(linha,pos,tam);
                        pos:=98;
                        tam:=10;
                        campo09 := Copy(linha,pos,tam);
                        pos:=108;
                        tam:=4;
                        campo10 := Copy(linha,pos,tam);
                        pos:=112;
                        tam:=10;
                        campo11 := Copy(linha,pos,tam);
                        pos:=122;
                        tam:=10;
                        campo12 := Copy(linha,pos,tam);
                        pos:=132;
                        tam:=4;
                        campo13 := Copy(linha,pos,tam);
                        pos:=136;
                        tam:=15;
                        campo14 := Copy(linha,pos,tam);
                        pos:=151;
                        tam:=6;
                        campo15 := Copy(linha,pos,tam);
                        pos:=157;
                        tam:=1;
                        campo16 := Copy(linha,pos,tam);
                        pos:=158;
                        tam:=50;
                        campo17 := Copy(linha,pos,tam);
                        pos:=208;
                        tam:=10;
                        TS1 := strtodate(Copy(linha,pos,tam));
                        pos:=218;
                        tam:=1;
                        op  := Copy(linha,pos,tam);

                                  {...}
                        cgc    := Trim(campo02);
                        banco  := Trim(campo03);
                        numero := Trim(campo04);
                        if (op='I') or (op='A') then
                        begin
                          with (clCheque) do
                            if (cgc<>'') and (banco<>'') and (numero<>'') then
                            begin
                              clCheque := TClassCheque.Create;
                              conect ('CREDITO',self);
                              ClearFields;
                              ClearSql;
                              AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                              AddParam ('From   CRECHMOV ');
                              AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                              AddParam ('      (CH_BANC='+banco+') AND ');
                              AddParam ('      (CH_NUME='+numero+')  ');
                              inCH_CCGC := cgc;
                              inCH_BANC := strtofloat(banco);
                              inCH_NUME := strtofloat(numero);
                              inCH_DTCT := strtodate(Trim(campo05));
                              inCH_NOME := Trim(campo06);
                              inCH_FONE := Trim(campo07);
                              inCH_LOJA := strtofloat(Trim(campo08));
                              inCH_DVTO := strtodate(Trim(campo09));
                              inCH_PORT := strtofloat(Trim(campo10));
                              inCH_AGEN := Trim(campo11);
                              inCH_DTRA := strtodate(Trim(campo12));
                              inCH_TRAN := strtoint(Trim(campo13));
                              inCH_VALO := strtofloat(campo14)/100;
                              inCH_CLIE := strtofloat(Trim(campo15));
                              inCH_STAT := Trim(campo16);
                              inCH_OBS  := Trim(campo17);
                              inCH_TIME := TS1;
                              mensagem_erro:='  Reg. desatualizado';
                              if (Execute) then
                              begin
                                if (TS1>=result('CH_TIME')) then
                                  UpdateAll;
                                totcheq2:=totcheq2+1;
                                mensagem_erro:='  AOK';
                              end
                              else
                              begin
                                Insert;
                                totcheq2:=totcheq2+1;
                                mensagem_erro:='  IOK';
                              end;
                              desconect;
                              Free;
                            end;
                        end
                        else
                        if (op='E') then
                                  {nao faz nada};
                      except
                        mensagem_erro:='  Reg. inconsistente';
                      end;
                      Writeln (arqreg , form_t    (cgc      ,14) +' '+
                        form_t    (banco    ,4)  +'   '+
                        form_t    (numero   ,6)  +'   '+
                        form_data (TS1)+'    '+
                        form_nz   (indGauge+1,5) +mensagem_erro);

                               {...}
                      indGauge:=indGauge+1;
                      gauge1.progress:=Round((indGauge/totGauge)*100);
                      gauge1.refresh;
                    end;
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques pré......: OK - Total..: '+form_n(totcheq,10)+' Registros alterados..: '+
                      form_n(totcheq2,10));
                    DeleteFile (nome_arq);
                  end;
                end
                else
                  memo1.lines.Add (' Cheques pré......: Arquivo '+nome_arq+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totcheq,10)+' registro(s)');

                        {5. - Cheques pre-datados compensados ------------------------------->}
                Writeln (arqreg, '');
                Writeln (arqreg, 'Cheques compensados');
                Writeln (arqreg, form_tc2('-',80,'-'));
                Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
                Writeln (arqreg, form_tc2('-',80,'-'));

                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQPG.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totcheqpg := 0;
                  flag_erro_cheqprepg := false;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    linha := Trim(linha);
                    if (Length(linha)<>228) then
                    begin
                      flag_erro_cheqprepg := true;
                      break;
                    end;
                    totcheqpg:=totcheqpg+1;
                  end;
                  if (flag_erro_cheqprepg) then
                  begin
                    showmessage('O arquivo de cheques compensados está fora do formato '+
                      'adequado para importação. Informe a loja correspondente para que a sua versão '+
                      'do sistema seja atualizada!');
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques compens..: [ERRO: Arquivo fora do formato adequado!!!]');
                  end
                  else
                  begin
                    Reset(arq);
                    indGauge:=0;
                    totGauge:=totcheqpg;
                    gauge1.progress:=0;
                    linha:='';
                    totcheqpg2:=0;
                    while (not Eof(arq)) do
                    begin
                               {encapsulamento da rotina, nao permite erros --->}
                      try
                        ReadLn (arq,linha);
                        pos:=1;
                        tam:=6;
                        campo01 := Copy(linha,pos,tam);
                        pos:=7;
                        tam:=14;
                        campo02 := Copy(linha,pos,tam);
                        pos:=21;
                        tam:=3;
                        campo03 := Copy(linha,pos,tam);
                        pos:=24;
                        tam:=7;
                        campo04 := Copy(linha,pos,tam);
                        pos:=31;
                        tam:=10;
                        campo05 := Copy(linha,pos,tam);
                        pos:=41;
                        tam:=40;
                        campo06 := Copy(linha,pos,tam);
                        pos:=81;
                        tam:=15;
                        campo07 := Copy(linha,pos,tam);
                        pos:=96;
                        tam:=2;
                        campo08 := Copy(linha,pos,tam);
                        pos:=98;
                        tam:=10;
                        campo09 := Copy(linha,pos,tam);
                        pos:=108;
                        tam:=4;
                        campo10 := Copy(linha,pos,tam);
                        pos:=112;
                        tam:=10;
                        campo11 := Copy(linha,pos,tam);
                        pos:=122;
                        tam:=10;
                        campo12 := Copy(linha,pos,tam);
                        pos:=132;
                        tam:=4;
                        campo13 := Copy(linha,pos,tam);
                        pos:=136;
                        tam:=15;
                        campo14 := Copy(linha,pos,tam);
                        pos:=151;
                        tam:=6;
                        campo15 := Copy(linha,pos,tam);
                        pos:=157;
                        tam:=1;
                        campo16 := Copy(linha,pos,tam);
                        pos:=158;
                        tam:=50;
                        campo17 := Copy(linha,pos,tam);
                        pos:=208;
                        tam:=10;
                        campo18 := Copy(linha,pos,tam);
                        pos:=218;
                        tam:=10;
                        TS1 := strtodate(Copy(linha,pos,tam));
                        pos:=228;
                        tam:=1;
                        op  := Copy(linha,pos,tam);

                                  {...}
                        cgc    := Trim(campo02);
                        banco  := Trim(campo03);
                        numero := Trim(campo04);
                        if (op='I') or (op='A') then
                        begin
                          with (clChequePg) do
                            if (cgc<>'') and (banco<>'') and (numero<>'') then
                            begin
                              clChequePg := TClassChequePg.Create;
                              conect ('CREDITO',self);
                              ClearFields;
                              ClearSql;
                              AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                              AddParam ('From   CRECHMVPG ');
                              AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                              AddParam ('      (CH_BANC='+banco+') AND ');
                              AddParam ('      (CH_NUME='+numero+')  ');
                              inCH_CCGC := cgc;
                              inCH_BANC := strtofloat(banco);
                              inCH_NUME := strtofloat(numero);
                              inCH_DTCT := strtodate(Trim(campo05));
                              inCH_NOME := Trim(campo06);
                              inCH_FONE := Trim(campo07);
                              inCH_LOJA := strtofloat(Trim(campo08));
                              inCH_DVTO := strtodate(Trim(campo09));
                              inCH_DTPG := strtodate(Trim(campo18));
                              inCH_PORT := strtofloat(Trim(campo10));
                              inCH_AGEN := Trim(campo11);
                              inCH_DTRA := strtodate(Trim(campo12));
                              inCH_TRAN := strtoint(Trim(campo13));
                              inCH_VALO := strtofloat(campo14)/100;
                              inCH_CLIE := strtofloat(Trim(campo15));
                              inCH_STAT := Trim(campo16);
                              inCH_OBS  := Trim(campo17);
                              inCH_TIME := TS1;
                              mensagem_erro:='  Reg. desatualizado';
                              if (Execute) then
                              begin
                                if (TS1>=result('CH_TIME')) then
                                  UpdateAll;
                                totcheqpg2:=totcheqpg2+1;
                                mensagem_erro:='  AOK';
                              end
                              else
                              begin
                                Insert;
                                totcheqpg2:=totcheqpg2+1;
                                mensagem_erro:='  IOK';
                              end;
                              desconect;
                              Free;
                            end;
                        end
                        else
                        if (op='E') then
                                  {nao faz nada};
                      except
                        mensagem_erro:='  Reg. inconsistente';
                      end;
                      Writeln (arqreg , form_t    (cgc      ,14) +' '+
                        form_t    (banco    ,4)  +'   '+
                        form_t    (numero   ,6)  +'   '+
                        form_data (TS1)+'    '+
                        form_nz   (indGauge+1,5) +mensagem_erro);

                               {...}
                      indGauge:=indGauge+1;
                      gauge1.progress:=Round((indGauge/totGauge)*100);
                      gauge1.refresh;
                    end;
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques compens..: OK - Total..: '+form_n(totcheqpg,10)+' Registros alterados..: '+
                      form_n(totcheqpg2,10));
                    DeleteFile (nome_arq);
                  end;
                end
                else
                  memo1.lines.Add (' Cheques compens..: Arquivo '+nome_arq+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totcheqpg,10)+' registro(s)');

                        {6. - Cheques devolvidos ------------------------------->}
                Writeln (arqreg, '');
                Writeln (arqreg, 'Cheques devolvidos');
                Writeln (arqreg, form_tc2('-',80,'-'));
                Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
                Writeln (arqreg, form_tc2('-',80,'-'));

                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDEV.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totcheqdev := 0;
                  flag_erro_cheqdev := false;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    if (Length(linha)<>200) then
                    begin
                      flag_erro_cheqdev := true;
                      break;
                    end;
                    totcheqdev:=totcheqdev+1;
                  end;
                  if (flag_erro_cheqdev) then
                  begin
                    showmessage('O arquivo de cheques devolvidos está fora do formato '+
                      'adequado para importação. Informe a loja correspondente para que a sua versão '+
                      'do sistema seja atualizada!');
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques devolv...: [ERRO: Arquivo fora do formato adequado!!!]');
                  end
                  else
                  begin
                    Reset(arq);
                    indGauge:=0;
                    totGauge:=totcheqdev;
                    gauge1.progress:=0;
                    linha:='';
                    totcheqdev2:=0;
                    while (not Eof(arq)) do
                    begin
                               {encapsulamento da rotina, nao permite erros --->}
                      try
                        ReadLn (arq,linha);
                        pos:=1;
                        tam:=6;
                        campo01 := Copy(linha,pos,tam);
                        pos:=7;
                        tam:=14;
                        campo02 := Copy(linha,pos,tam);
                        pos:=21;
                        tam:=7;
                        campo03 := Copy(linha,pos,tam);
                        pos:=28;
                        tam:=10;
                        campo04 := Copy(linha,pos,tam);
                        pos:=38;
                        tam:=2;
                        campo05 := Copy(linha,pos,tam);
                        pos:=40;
                        tam:=10;
                        campo06 := Copy(linha,pos,tam);
                        pos:=50;
                        tam:=10;
                        campo07 := Copy(linha,pos,tam);
                        pos:=60;
                        tam:=4;
                        campo08 := Copy(linha,pos,tam);
                        pos:=64;
                        tam:=3;
                        campo09 := Copy(linha,pos,tam);
                        pos:=67;
                        tam:=10;
                        campo10 := Copy(linha,pos,tam);
                        pos:=77;
                        tam:=15;
                        campo11 := Copy(linha,pos,tam);
                        pos:=92;
                        tam:=4;
                        campo12 := Copy(linha,pos,tam);
                        pos:=96;
                        tam:=50;
                        campo13 := Copy(linha,pos,tam);
                        pos:=146;
                        tam:=40;
                        campo14 := Copy(linha,pos,tam);
                        pos:=186;
                        tam:=4;
                        campo15 := Copy(linha,pos,tam);
                        pos:=190;
                        tam:=10;
                        TS1 := strtodate(Copy(linha,pos,tam));
                        pos:=200;
                        tam:=1;
                        op  := Copy(linha,pos,tam);

                                  {...}
                        cgc    := Trim(campo02);
                        banco  := Trim(campo09);
                        numero := Trim(campo03);
                        if (op='I') or (op='A') then
                        begin
                          with (clChequeDev) do
                            if (cgc<>'') and (banco<>'') and (numero<>'') then
                            begin
                              clChequeDev := TClassChequeDev.Create;
                              conect ('CREDITO',self);
                              ClearFields;
                              ClearSql;
                              AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                              AddParam ('From   CRECHDEV ');
                              AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                              AddParam ('      (CH_BANC='+banco+') AND ');
                              AddParam ('      (CH_NUME='+numero+')  ');
                              inCH_CLIE := strtofloat(campo01);
                              inCH_CCGC := Trim(cgc);
                              inCH_NUME := strtofloat(numero);
                              inCH_DTCT := strtodate(Trim(campo04));
                              inCH_LOJA := strtofloat(campo05);
                              inCH_DTEM := strtodate(campo06);
                              inCH_DVTO := strtodate(campo07);
                              inCH_PORT := strtofloat(campo08);
                              inCH_BANC := strtofloat(campo09);
                              inCH_AGEN := Trim(campo10);
                              inCH_VALO := strtofloat(campo11)/100;
                              inCH_ALIN := Trim(campo12);
                              inCH_OBS  := Trim(campo13);
                              inCH_NOME := Trim(campo14);
                              inCH_TRAN := strtoint(campo15);
                              inCH_TIME := TS1;
                              mensagem_erro:='  Reg. desatualizado';
                              if (Execute) then
                              begin
                                if (TS1>=result('CH_TIME')) then
                                  UpdateAll;
                                totcheqdev2:=totcheqdev2+1;
                                mensagem_erro:='  AOK';
                              end
                              else
                              begin
                                Insert;
                                totcheqdev2:=totcheqdev2+1;
                                mensagem_erro:='  IOK';
                              end;
                              desconect;
                              Free;
                            end;
                        end
                        else
                        if (op='E') then
                                  {nao faz nada};
                      except
                        mensagem_erro:='  Reg. inconsistente';
                      end;
                      Writeln (arqreg , form_t    (cgc      ,14) +' '+
                        form_t    (banco    ,4)  +'   '+
                        form_t    (numero   ,6)  +'   '+
                        form_data (TS1)+'    '+
                        form_nz   (indGauge+1,5) +mensagem_erro);

                               {...}
                      indGauge:=indGauge+1;
                      gauge1.progress:=Round((indGauge/totGauge)*100);
                      gauge1.refresh;
                    end;
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques devolv...: OK - Total..: '+form_n(totcheqdev,10)+' Registros alterados..: '+
                      form_n(totcheqdev2,10));
                    DeleteFile (nome_arq);
                  end;
                end
                else
                  memo1.lines.Add (' Cheques devolv...: Arquivo '+nome_arq+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totcheqdev,10)+' registro(s)');

                        {7. - Cheques devolvidos compensados ------------------->}
                Writeln (arqreg, '');
                Writeln (arqreg, 'Cheques devolvidos compensados');
                Writeln (arqreg, form_tc2('-',80,'-'));
                Writeln (arqreg, 'CPF            Banco   Numero  Alteracao    Linha  Erro');
                Writeln (arqreg, form_tc2('-',80,'-'));

                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CHEQDVPG.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totcheqdvpg := 0;
                  flag_erro_cheqdvpg := false;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    if (Length(linha)<>229) then
                    begin
                      flag_erro_cheqdvpg := true;
                      break;
                    end;
                    totcheqdvpg:=totcheqdvpg+1;
                  end;
                  if (flag_erro_cheqdvpg) then
                  begin
                    showmessage('O arquivo de cheques devolvidos pagos está fora do formato '+
                      'adequado para importação. Informe a loja correspondente para que a sua versão '+
                      'do sistema seja atualizada!');
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques dev pagos: [ERRO: Arquivo fora do formato adequado!!!]');
                  end
                  else
                  begin
                    Reset(arq);
                    indGauge:=0;
                    totGauge:=totcheqdvpg;
                    gauge1.progress:=0;
                    linha:='';
                    totcheqdvpg2:=0;
                    while (not Eof(arq)) do
                    begin
                               {encapsulamento da rotina, nao permite erros --->}
                      try
                        ReadLn (arq,linha);
                        pos:=1;
                        tam:=6;
                        campo01 := Copy(linha,pos,tam);
                        pos:=7;
                        tam:=14;
                        campo02 := Copy(linha,pos,tam);
                        pos:=21;
                        tam:=7;
                        campo03 := Copy(linha,pos,tam);
                        pos:=28;
                        tam:=10;
                        campo04 := Copy(linha,pos,tam);
                        pos:=38;
                        tam:=2;
                        campo05 := Copy(linha,pos,tam);
                        pos:=40;
                        tam:=10;
                        campo06 := Copy(linha,pos,tam);
                        pos:=50;
                        tam:=10;
                        campo07 := Copy(linha,pos,tam);
                        pos:=60;
                        tam:=4;
                        campo08 := Copy(linha,pos,tam);
                        pos:=64;
                        tam:=3;
                        campo09 := Copy(linha,pos,tam);
                        pos:=67;
                        tam:=10;
                        campo10 := Copy(linha,pos,tam);
                        pos:=77;
                        tam:=15;
                        campo11 := Copy(linha,pos,tam);
                        pos:=92;
                        tam:=10;
                        campo12 := Copy(linha,pos,tam);
                        pos:=102;
                        tam:=4;
                        campo13 := Copy(linha,pos,tam);
                        pos:=106;
                        tam:=15;
                        campo14 := Copy(linha,pos,tam);
                        pos:=121;
                        tam:=50;
                        campo15 := Copy(linha,pos,tam);
                        pos:=171;
                        tam:=4;
                        campo16 := Copy(linha,pos,tam);
                        pos:=175;
                        tam:=40;
                        campo17 := Copy(linha,pos,tam);
                        pos:=215;
                        tam:=4;
                        campo18 := Copy(linha,pos,tam);
                        pos:=219;
                        tam:=10;
                        TS1 := strtodate(Copy(linha,pos,tam));
                        pos:=229;
                        tam:=1;
                        op  := Copy(linha,pos,tam);

                                  {...}
                        cgc    := Trim(campo02);
                        banco  := Trim(campo09);
                        numero := Trim(campo03);
                        if (op='I') or (op='A') then
                        begin
                          with (clChequeDvPg) do
                            if (cgc<>'') and (banco<>'') and (numero<>'') then
                            begin
                              clChequeDvPg := TClassChequeDevPg.Create;
                              conect ('CREDITO',self);
                              ClearFields;
                              ClearSql;
                              AddParam ('Select CH_CCGC,CH_BANC,CH_NUME,CH_TIME ');
                              AddParam ('From   CRECHDVPG ');
                              AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
                              AddParam ('      (CH_BANC='+banco+') AND ');
                              AddParam ('      (CH_NUME='+numero+')  ');
                              inCH_BANC := strtofloat(banco);
                              inCH_NUME := strtofloat(numero);
                              inCH_CCGC := Trim(cgc);
                              inCH_CLIE := strtofloat(campo01);
                              inCH_DTCT := strtodate(campo04);
                              inCH_LOJA := strtofloat(campo05);
                              inCH_DTEM := strtodate(campo06);
                              inCH_DVTO := strtodate(campo07);
                              inCH_PORT := strtofloat(campo08);
                              inCH_AGEN := Trim(campo10);
                              inCH_VALO := strtofloat(campo11)/100;
                              inCH_DTPG := strtodate(campo12);
                              inCH_ALIN := Trim(campo13);
                              inCH_STAT := '1';
                              inCH_OBS  := Trim(campo15);
                              inCH_VAPG := strtofloat(campo14)/100;
                              inCH_POR2 := strtofloat(campo16);
                              inCH_NOME := Trim(campo17);
                              inCH_TRAN := strtoint(campo18);
                              inCH_TIME := TS1;
                              mensagem_erro:='  Reg. desatualizado';
                              if (Execute) then
                              begin
                                if (TS1>=result('CH_TIME')) then
                                  UpdateAll;
                                totcheqdvpg2:=totcheqdvpg2+1;
                                mensagem_erro:='  AOK';
                              end
                              else
                              begin
                                Insert;
                                totcheqdvpg2:=totcheqdvpg2+1;
                                mensagem_erro:='  IOK';
                              end;

                              with (DMRecCheqDev.qBaixaCheque) do
                              begin
                                parambyname('ccgc').AsString   := cgc;
                                parambyname('banco').AsFloat   := strtofloat(banco);
                                parambyname('numero').AsFloat  := strtofloat(numero);
                                ExecSql;
                              end;

                              QuitaChequePre (cgc,banco,numero);

                              frm_RecCheqDev := Tfrm_RecCheqDev.create(application);
                              with frm_RecCheqDev do
                                try
                                  edtvalor.text := floattostr(inCH_VAPG);
                                  edtData.text  := formatdatetime('dd/mm/yyyy',inCH_DTPG);
                                  VerificaPrestacaoChequeDev (cgc,banco,numero);
                                finally
                                  destroy;
                                end;
                              ClienteComChequeDevolvido (cgc);


                              desconect;
                              Free;
                            end;
                        end
                        else
                        if (op='E') then
                                  {nao faz nada};
                      except
                        mensagem_erro:='  Reg. inconsistente';
                      end;
                      Writeln (arqreg , form_t    (cgc      ,14) +' '+
                        form_t    (banco    ,4)  +'   '+
                        form_t    (numero   ,6)  +'   '+
                        form_data (TS1)+'    '+
                        form_nz   (indGauge+1,5) +mensagem_erro);

                               {...}
                      indGauge:=indGauge+1;
                      gauge1.progress:=Round((indGauge/totGauge)*100);
                      gauge1.refresh;
                    end;
                    CloseFile  (arq);
                    memo1.lines.Add (' Cheques dev pagos: OK - Total..: '+form_n(totcheqdvpg,10)+' Registros alterados..: '+
                      form_n(totcheqdvpg2,10));
                    DeleteFile (nome_arq);
                  end;
                end
                else
                  memo1.lines.Add (' Cheques dev pagos: Arquivo '+nome_arq+' não encontrado');
                WriteLn (arqreg, ' Total...: '+form_n(totcheqdvpg,10)+' registro(s)');
                gauge1.progress:=0;

                        {8. - Complementos de Clientes---------------------------------->}
                WriteLn (arqreg, 'Clientes');
                WriteLn (arqreg, form_tc2('-',80,'-'));
                WriteLn (arqreg, 'Codigo  Alteracao     Linha  Erro');
                WriteLn (arqreg, form_tc2('-',80,'-'));

                pnGauge1.visible:=true;
                gauge1.visible:=true;
                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLICOMP.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totcomp := 0;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    totcomp:=totcomp+1;
                  end;
                  Reset(arq);
                  indGauge:=0;
                  totGauge:=totcomp;
                  gauge1.progress:=0;
                  linha:='';
                  totcomp2:=0;
                  while (not Eof(arq)) do
                  begin
                                  {encapsulamento da rotina, nao permite erros --->}
                    try
                      ReadLn (arq,linha);
                      pos:=1;
                      tam:=6;
                      campo01 := Copy(linha,pos,tam);
                      pos:=7;
                      tam:=50;
                      campo02 := Copy(linha,pos,tam);
                      pos:=57;
                      tam:=30;
                      campo03 := Copy(linha,pos,tam);
                      pos:=87;
                      tam:=20;
                      campo04 := Copy(linha,pos,tam);
                      pos:=107;
                      tam:=2;
                      campo05 := Copy(linha,pos,tam);
                      pos:=109;
                      tam:=8;
                      campo06 := Copy(linha,pos,tam);
                      pos:=117;
                      tam:=50;
                      campo07 := Copy(linha,pos,tam);
                      pos:=167;
                      tam:=15;
                      campo08 := Copy(linha,pos,tam);
                      pos:=182;
                      tam:=10;
                      campo09 := Copy(linha,pos,tam);
                      pos:=192;
                      tam:=50;
                      campo10 := Copy(linha,pos,tam);
                      pos:=242;
                      tam:=15;
                      campo11 := Copy(linha,pos,tam);
                      pos:=257;
                      tam:=10;
                      campo12 := Copy(linha,pos,tam);
                      pos:=267;
                      tam:=10;
                      TS1 := strtodate(Copy(linha,pos,tam));
                      pos:=277;
                      tam:=1;
                      op := Copy(linha,pos,tam);

                                    {...}
                      codigo := Trim(campo01);
                      if (op='I') or (op='A') then
                      begin
                        with (clComp) do
                          if (codigo<>'') then
                          begin
                            clComp := TClassAuxiliar.Create;
                            conect ('CREDITO',self);
                            ClearSql;
                            AddParam ('Select CC_CLIE,CC_TIME                ');
                            AddParam ('From CRECLI_COMP                      ');
                            AddParam ('Where (CC_CLIE='+codigo+')            ');
                            if (Execute) then
                            begin
                              if (TS1>=result('CC_TIME')) then
                              begin
                                ClearSql;
                                AddParam('UPDATE CRECLI_COMP       ');
                                AddParam('SET    CC_ENDC=:CC_ENDC, ');
                                AddParam('       CC_BAIC=:CC_BAIC, ');
                                AddParam('       CC_CIDC=:CC_CIDC, ');
                                AddParam('       CC_ESTC=:CC_ESTC, ');
                                AddParam('       CC_CEPC=:CC_CEPC, ');
                                AddParam('       CC_NCO1=:CC_NCO1, ');
                                AddParam('       CC_TCO1=:CC_TCO1, ');
                                AddParam('       CC_CCO1=:CC_CCO1, ');
                                AddParam('       CC_NCO2=:CC_NCO2, ');
                                AddParam('       CC_TCO2=:CC_TCO2, ');
                                AddParam('       CC_CCO2=:CC_CCO2, ');
                                AddParam('       CC_TIME=:CC_TIME  ');
                                AddParam('WHERE (CC_CLIE='+codigo+') ');
                                consulta.parambyname('CC_ENDC').AsString := campo02;
                                consulta.parambyname('CC_BAIC').AsString := campo03;
                                consulta.parambyname('CC_CIDC').AsString := campo04;
                                consulta.parambyname('CC_ESTC').AsString := campo05;
                                consulta.parambyname('CC_CEPC').AsString := campo06;
                                consulta.parambyname('CC_NCO1').AsString := campo07;
                                consulta.parambyname('CC_TCO1').AsString := campo08;
                                consulta.parambyname('CC_CCO1').AsFloat  := strtofloat(campo09)/100;
                                consulta.parambyname('CC_NCO2').AsString := campo10;
                                consulta.parambyname('CC_TCO2').AsString := campo11;
                                consulta.parambyname('CC_CCO2').Asfloat  := strtofloat(campo12)/100;
                                consulta.parambyname('CC_TIME').AsDateTime := TS1;
                                Execute;
                              end;
                              totcomp2:=totcomp2+1;
                              mensagem_erro := '  AOK'
                            end
                            else
                            begin
                              ClearSql;
                              AddParam('INSERT INTO CRECLI_COMP(CC_CLIE,CC_ENDC,CC_BAIC,CC_CIDC,CC_ESTC,CC_CEPC,          ');
                              AddParam('                        CC_NCO1,CC_TCO1,CC_CCO1,CC_NCO2,CC_TCO2,CC_CCO2,CC_TIME)  ');
                              AddParam('VALUES (:CC_CLIE,:CC_ENDC,:CC_BAIC,:CC_CIDC,:CC_ESTC,:CC_CEPC,                    ');
                              AddParam('        :CC_NCO1,:CC_TCO1,:CC_CCO1,:CC_NCO2,:CC_TCO2,:CC_CCO2,:CC_TIME)           ');
                              consulta.parambyname('CC_CLIE').AsFloat  := strtofloat(codigo);
                              consulta.parambyname('CC_ENDC').AsString := campo02;
                              consulta.parambyname('CC_BAIC').AsString := campo03;
                              consulta.parambyname('CC_CIDC').AsString := campo04;
                              consulta.parambyname('CC_ESTC').AsString := campo05;
                              consulta.parambyname('CC_CEPC').AsString := campo06;
                              consulta.parambyname('CC_NCO1').AsString := campo07;
                              consulta.parambyname('CC_TCO1').AsString := campo08;
                              consulta.parambyname('CC_CCO1').Asfloat  := strtofloat(campo09)/100;
                              consulta.parambyname('CC_NCO2').AsString := campo10;
                              consulta.parambyname('CC_TCO2').AsString := campo11;
                              consulta.parambyname('CC_CCO2').Asfloat  := strtofloat(campo12)/100;
                              consulta.parambyname('CC_TIME').AsDateTime := TS1;
                              Execute;
                              totcomp2:=totcomp2+1;
                              mensagem_erro := '  IOK'
                            end;
                            desconect;
                            Free;
                          end;
                      end
                      else
                      if (op='E') then
                                    {nao faz nada};
                    except
                      mensagem_erro := '  Reg. inconsistente'
                    end;
                    WriteLn (arqreg, form_t    (codigo,6)     +' '+
                      form_t    (campo02,30)   +' '+
                      form_data (TS1)          +'    '+
                      form_nz   (indGauge+1,5) +mensagem_erro);

                                  {...}
                    indGauge:=indGauge+1;
                    gauge1.progress:=Round((indGauge/totGauge)*100);
                    gauge1.refresh;
                  end;
                  CloseFile  (arq);
                  memo1.lines.Add (' Complementos.....: OK - Total..: '+form_n(totcomp,10)+' Registros alterados..: '+
                    form_n(totcomp2,10));
                  DeleteFile (nome_arq);
                end
                else
                  memo1.lines.Add (' Complementos.....: Arquivo '+nome_arq+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totcomp,10)+' registro(s)');


                        {9. - Observacoes de Clientes---------------------------------->}
                WriteLn (arqreg, 'Observacoes de Clientes');
                WriteLn (arqreg, form_tc2('-',80,'-'));
                WriteLn (arqreg, 'Codigo  Alteracao     Linha  Erro');
                WriteLn (arqreg, form_tc2('-',80,'-'));

                pnGauge1.visible:=true;
                gauge1.visible:=true;
                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\CLIOBS.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totobs := 0;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    totobs:=totobs+1;
                  end;
                  Reset(arq);
                  indGauge:=0;
                  totGauge:=totobs;
                  gauge1.progress:=0;
                  linha:='';
                  totobs2:=0;
                  while (not Eof(arq)) do
                  begin
                                  {encapsulamento da rotina, nao permite erros --->}
                    try
                      ReadLn (arq,linha);
                      pos:=1;
                      tam:=6;
                      campo01 := Copy(linha,pos,tam);
                      pos:=7;
                      tam:=80;
                      campo02 := Copy(linha,pos,tam);
                      pos:=87;
                      tam:=80;
                      campo03 := Copy(linha,pos,tam);
                      pos:=167;
                      tam:=80;
                      campo04 := Copy(linha,pos,tam);
                      pos:=247;
                      tam:=80;
                      campo05 := Copy(linha,pos,tam);
                      pos:=327;
                      tam:=80;
                      campo06 := Copy(linha,pos,tam);
                      pos:=407;
                      tam:=10;
                      TS1 := strtodate(Copy(linha,pos,tam));
                      pos:=417;
                      tam:=1;
                      op := Copy(linha,pos,tam);

                                    {...}
                      codigo := Trim(campo01);
                      if (op='I') or (op='A') then
                      begin
                        with (clObs) do
                          if (codigo<>'') then
                          begin
                            clObs := TClassAuxiliar.Create;
                            conect   ('CREDITO',self);
                            ClearSql;
                            AddParam ('Select OB_CLIE,OB_TIME                ');
                            AddParam ('From CRECLI_OBS                       ');
                            AddParam ('Where (OB_CLIE='+codigo+')            ');
                            if (Execute) then
                                           {...}
                            else
                            begin
                              ClearSql;
                              AddParam('INSERT INTO CRECLI_OBS(OB_CLIE,OB_LIN1,OB_LIN2,OB_LIN3,OB_LIN4,OB_LIN5,OB_TIME)  ');
                              AddParam('VALUES (:OB_CLIE,:OB_LIN1,:OB_LIN2,:OB_LIN3,:OB_LIN4,:OB_LIN5,:OB_TIME)          ');
                              consulta.parambyname('OB_CLIE').AsFloat    := strtofloat(codigo);
                              consulta.parambyname('OB_LIN1').AsString   := campo02;
                              consulta.parambyname('OB_LIN2').AsString   := campo03;
                              consulta.parambyname('OB_LIN3').AsString   := campo04;
                              consulta.parambyname('OB_LIN4').AsString   := campo05;
                              consulta.parambyname('OB_LIN5').AsString   := campo06;
                              consulta.parambyname('OB_TIME').AsDateTime := TS1;
                              Execute;
                              totobs2:=totobs2+1;
                              mensagem_erro := '  IOK'
                            end;
                            desconect;
                            Free;
                          end;
                      end
                      else
                      if (op='E') then
                        with (clObs) do
                          if (codigo<>'') then
                          begin
                            clObs := TClassAuxiliar.Create;
                            conect   ('CREDITO',self);
                            ClearSql;
                            AddParam ('Select OB_CLIE,OB_TIME From CRECLI_OBS ');
                            AddParam ('Where (OB_CLIE='+codigo+')             ');
                            if (Execute) then
                                           {...};
                            desconect;
                            Free;
                          end;
                    except
                      mensagem_erro := '  Reg. inconsistente'
                    end;
                    WriteLn (arqreg, form_t    (codigo,6)     +' '+
                      form_t    (campo02,30)   +' '+
                      form_data (TS1)          +'    '+
                      form_nz   (indGauge+1,5) +mensagem_erro);

                                  {...}
                    indGauge:=indGauge+1;
                    gauge1.progress:=Round((indGauge/totGauge)*100);
                    gauge1.refresh;
                  end;
                  CloseFile  (arq);
                  memo1.lines.Add (' Observações......: OK - Total..: '+form_n(totobs,10)+' Registros alterados..: '+
                    form_n(totobs2,10));
                  DeleteFile (nome_arq);
                end
                else
                  memo1.lines.Add (' Observações......: Arquivo CLIOBS.L'+form_nz(clLoja.result('LO_CODI'),2)+' não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totobs,10)+' registro(s)');


                        {10. - Contratos renegociados ---------------------------------->}
                WriteLn (arqreg, 'Renegociacoes');
                WriteLn (arqreg, form_tc2('-',80,'-'));
                WriteLn (arqreg, 'Cliente  Mestre  Escravo  Alteracao     Linha  Erro');
                WriteLn (arqreg, form_tc2('-',80,'-'));

                pnGauge1.visible:=true;
                gauge1.visible:=true;
                gauge1.progress:=0;
                nome_arq := 'C:\NATIVA\CREDITO\MOVIMENTO\RENEGOC.L'+form_nz(clLoja.result('LO_CODI'),2);
                if (FileExists(nome_arq)) then
                begin
                  AssignFile (arq,nome_arq);
                  Reset      (arq);
                  totrenegoc := 0;
                  while (not Eof(arq)) do
                  begin
                    ReadLn (arq,linha);
                    totrenegoc:=totrenegoc+1;
                  end;
                  Reset(arq);
                  indGauge:=0;
                  totGauge:=totrenegoc;
                  gauge1.progress:=0;
                  linha:='';
                  totrenegoc2:=0;
                  while (not Eof(arq)) do
                  begin
                                  {encapsulamento da rotina, nao permite erros --->}
                    try
                      ReadLn (arq,linha);
                      pos:=1;
                      tam:=6;
                      campo01 := Copy(linha,pos,tam);
                      pos:=7;
                      tam:=6;
                      campo02 := Copy(linha,pos,tam);
                      pos:=13;
                      tam:=6;
                      campo03 := Copy(linha,pos,tam);
                      pos:=19;
                      tam:=10;
                      TS1 := strtodate(Copy(linha,pos,tam));
                      pos:=29;
                      tam:=1;
                      op := Copy(linha,pos,tam);

                                    {...}
                      cliente := Trim(campo01);
                      mestre  := Trim(campo02);
                      escravo := Trim(campo03);
                      if (op='I') or (op='A') then
                      begin
                        with (clRenegoc) do
                          if (cliente<>'') and (mestre<>'') and (escravo<>'') then
                          begin
                            clRenegoc := TClassAuxiliar.Create;
                            conect   ('CREDITO',self);
                            ClearSql;
                            AddParam ('Select CLIENTE,CONTRATO_MESTRE,CONTRATO_ESCRAVO,          ');
                            AddParam ('       MENSALIDADE_INICIAL,CR_TIME                        ');
                            AddParam ('From CONTRATOS_RENEGOCIADOS                               ');
                            AddParam ('Where (CLIENTE='+cliente+') AND                           ');
                            AddParam ('      (CONTRATO_MESTRE='+mestre+') AND                    ');
                            AddParam ('      (CONTRATO_ESCRAVO='+escravo+')                      ');
                            if (Execute) then
                            begin
                              if (TS1>=result('CR_TIME')) then
                              begin
                                ClearSql;
                                AddParam ('UPDATE CONTRATOS_RENEGOCIADOS                     ');
                                AddParam ('SET    CLIENTE=:CLIENTE,                          ');
                                AddParam ('       CONTRATO_MESTRE=:CONTRATO_MESTRE,          ');
                                AddParam ('       CONTRATO_ESCRAVO=:CONTRATO_ESCRAVO,        ');
                                AddParam ('       MENSALIDADE_INICIAL=:MENSALIDADE_INICIAL,  ');
                                AddParam ('       CR_TIME=:CR_TIME                           ');
                                AddParam ('Where (CLIENTE='+cliente+') AND                   ');
                                AddParam ('      (CONTRATO_MESTRE='+mestre+') AND            ');
                                AddParam ('      (CONTRATO_ESCRAVO='+escravo+')              ');
                                consulta.parambyname('CLIENTE').AsFloat := strtofloat(cliente);
                                consulta.parambyname('CONTRATO_MESTRE').AsFloat := strtofloat(mestre);
                                consulta.parambyname('CONTRATO_ESCRAVO').AsFloat := strtofloat(escravo);
                                consulta.parambyname('MENSALIDADE_INICIAL').AsFloat := strtofloat(campo04);
                                consulta.parambyname('CR_TIME').AsDateTime := TS1;
                                Execute;
                              end;
                              totrenegoc2:=totrenegoc2+1;
                              mensagem_erro := '  AOK'
                            end
                            else
                            begin
                              ClearSql;
                              AddParam('INSERT INTO CONTRATOS_RENEGOCIADOS(CLIENTE,CONTRATO_MESTRE,CONTRATO_ESCRAVO,MENSALIDADE_INICIAL,CR_TIME)    ');
                              AddParam('VALUES (:CLIENTE,:CONTRATO_MESTRE,:CONTRATO_ESCRAVO,:MENSALIDADE_INICIAL,:CR_TIME)                          ');
                              consulta.parambyname('CLIENTE').AsFloat := strtofloat(cliente);
                              consulta.parambyname('CONTRATO_MESTRE').AsFloat := strtofloat(mestre);
                              consulta.parambyname('CONTRATO_ESCRAVO').AsFloat := strtofloat(escravo);
                              consulta.parambyname('MENSALIDADE_INICIAL').AsFloat := strtofloat(campo04);
                              consulta.parambyname('CR_TIME').AsDateTime := TS1;
                              Execute;
                              totrenegoc2:=totrenegoc2+1;
                              mensagem_erro := '  IOK'
                            end;
                            desconect;
                            Free;
                          end;
                      end
                      else
                      if (op='E') then
                                    {nao faz nada};
                    except
                      mensagem_erro := '  Reg. inconsistente'
                    end;
                    WriteLn (arqreg, form_t    (cliente,6)    +' '+
                      form_t    (mestre,6)     +' '+
                      form_t    (escravo,6)    +' '+
                      form_data (TS1)          +'    '+
                      form_nz   (indGauge+1,5) +mensagem_erro);

                                  {...}
                    indGauge:=indGauge+1;
                    gauge1.progress:=Round((indGauge/totGauge)*100);
                    gauge1.refresh;
                  end;
                  CloseFile  (arq);
                  memo1.lines.Add (' Renegociações....: OK - Total..: '+form_n(totrenegoc,10)+' Registros alterados..: '+
                    form_n(totrenegoc2,10));
                  DeleteFile (nome_arq);
                end
                else
                  memo1.lines.Add (' Renegociações....: Arquivo '+nome_arq+'  não encontrado');
                gauge1.progress:=0;
                WriteLn (arqreg, ' Total...: '+form_n(totrenegoc,10)+' registro(s)');
                LinhaFim := Memo1.lInes.Count - 1;
                        {** - Gravando em log a ultima importacao executada}
                if (data1<>'') then
                begin
                  LogIni := TIniFile.Create('C:\NATIVA\CREDITO\MOVIMENTO\LOG.INI');
                  LogIni.WriteString('Importacao','loja'+form_nz(clLoja.result('LO_CODI'),2),data1+'-'+data2);
                  LogIni.UpdateFile;
                  LogIni.Free;
                end;
              end
              else
                memo1.lines.Add (' -- Importação da loja '+form_nz(clLoja.result('LO_CODI'),2)+' cancelada --');

                      {prox loja--->}
              memo1.lines.Add ('---------------------------------------------------------------------------------');
              clLoja.next;
              Writeln (arqreg, chr(12));
              Writeln (arqreg, '');
            end;
            memo1.lines.Add (' >>Importação concluída');
          end;
          clLoja.desconect;
          clLoja.Free;
        end;
          {...}
        CloseFile (arqreg);

          {...Salvando o status em LOG}
        pnGauge1.visible:=false;
        if (not DirectoryExists('C:\NATIVA\CREDITO\MOVIMENTO\LOGS')) then
          CreateDir('C:\NATIVA\CREDITO\MOVIMENTO\LOGS');
        while (Posicao('/',data)>0) do
          delete(data,Posicao('/',data),1);
        while (Posicao(':',hora)>0) do
          delete(hora,Posicao(':',hora),1);
        memo1.lines.savetofile('C:\NATIVA\CREDITO\MOVIMENTO\LOGS\LOG_IMP_'+data+'_'+hora+'_'+nome_user+'.LGI');

          {...Salvando o arquivo de registros em LOG}
        CopyFile ('C:\NATIVA\CREDITO\MOVIMENTO\REGIMP.TXT', Pchar('C:\NATIVA\CREDITO\MOVIMENTO\LOGS\REGIMP_'+data+'_'+hora+'_'+nome_user+'.TXT'), false);
      finally
        if linhaini > -1 then
          for i:=linhaini to linhafim do
            with FLogExportacao do
            begin
              if (System.Pos('[ERRO',UpperCAse(Memo1.Lines[i])) > 0) or
                (System.Pos('NAO ENCONTRADO',UpperCAse(TiraAcento(Memo1.Lines[i]))) > 0) then
                continue;

              Tabela          := TrimLeft(Copy(Memo1.Lines[i],1,System.Pos('.',Memo1.Lines[i]) - 1));

              Vlog            := TrimLeft(Copy(Memo1.Lines[i],System.Pos(':',Memo1.Lines[i]) + 1,Length(Memo1.Lines[i])));
              Reg             := StrtoFloatN(TrimLeft(Copy(vLOG,System.Pos(':',vLOG) + 1,System.Pos('R',vlOG) - System.Pos(':',vLOG) - 1)));

              Vlog            := TrimLeft(Copy(Memo1.Lines[i],System.Pos('Registros alterados..',Memo1.Lines[i]) + 22,Length(Memo1.Lines[i])));
              RegNew          := StrtoFloatN(VLog);

              Sucesso         := iifs(memo1.Lines.IndexOf(' >>Importação concluída') > -1,'Com Sucesso','Com Erros');
              if reg > 0 then
                LogExportacao(FLogExportacao,true);
            end;
        Refreshpanel2;
      end;
end;

procedure Tfrm_ImportaTrigger.btnImportaClick(Sender: TObject);
begin
  Importarmovimento1.click;
end;

procedure Tfrm_ImportaTrigger.DeletaCliente(codigo: String);
var
  clCliente: TClassAuxiliar;
begin
  with (clCliente) do
  begin
    clCliente := TClassAuxiliar.Create;
    conect   ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECLI                ');
    AddParam ('Where (CL_CODI='+codigo+')        ');
    Execute;
    ClearSql;
    AddParam ('Delete from CLIENTES_BLOQUEADOS   ');
    AddParam ('Where (CLIENTE='+codigo+')        ');
    Execute;
    ClearSql;
    AddParam ('Delete from CRECLI_OBS            ');
    AddParam ('Where (OB_CLIE='+codigo+')        ');
    Execute;
    desconect;
    Free;
  end;
end;

//---------------------------
procedure Tfrm_ImportaTrigger.DeletaTodosusers;
var
  clusers: TClassAuxiliar;
begin
  with (clusers) do
  begin
    clusers := TClassAuxiliar.Create;
    conect   ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from USERS                         ');
    Execute;
    desconect;
    Free;
  end;
end;
//---------------------------
procedure Tfrm_ImportaTrigger.DeletaTodosperms;
var
  clPerms: TClassAuxiliar;
begin
  with (clPerms) do
  begin
    clPerms := TClassAuxiliar.Create;
    conect   ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from PERMS                         ');
    Execute;
    desconect;
    Free;
  end;
end;
//--------------------------
procedure Tfrm_ImportaTrigger.DeletaTodoslojas;
var
  clCreloja: TClassAuxiliar;
begin
  with (clCreloja) do
  begin
    clCreloja := TClassAuxiliar.Create;
    conect   ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRELOJA                         ');
    Execute;
    desconect;
    Free;
  end;
end;
//--------------------------


procedure Tfrm_ImportaTrigger.DeletaComplemento(codigo: String);
var
  clComp: TClassAuxiliar;
begin
  with (clComp) do
  begin
    clComp := TClassAuxiliar.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECLI_COMP ');
    AddParam ('Where (CC_CLIE='+codigo+') ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaObservacao(codigo: String);
var
  clObs: TClassAuxiliar;
begin
  with (clObs) do
  begin
    clObs := TClassAuxiliar.Create;
    conect   ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECLI_OBS     ');
    AddParam ('Where (OB_CLIE='+codigo+') ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaContratoRenegociado(cliente,mestre,escravo: String);
var
  clRenegoc: TClassAuxiliar;
begin
  with (clRenegoc) do
  begin
    clRenegoc := TClassAuxiliar.Create;
    conect   ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from MOVIMENTO_RENEGOCIADOS        ');
    AddParam ('Where (CLIENTE='+cliente+') AND           ');
    AddParam ('      (MESTRE='+mestre+') AND             ');
    AddParam ('      (ESCRAVO='+escravo+')               ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaContrato(cliente,codigo: String);
var
  clContrato: TClassAuxiliar;
begin
  with (clContrato) do
  begin
    clContrato := TClassAuxiliar.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECTABR             ');
    AddParam ('Where (CR_CLIE='+cliente+') AND  ');
    AddParam ('      (CR_CODI='+codigo+')       ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaPrestacao(cliente,codigo,prestacao: String);
var
  clPrestacao: TClassAuxiliar;
begin
  with (clPrestacao) do
  begin
    clPrestacao := TClassAuxiliar.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CREPRABR ');
    AddParam ('Where (PC_CLIE='+cliente+') AND ');
    AddParam ('      (PC_CONT='+codigo+') AND ');
    AddParam ('      (PC_NPRE='+prestacao+') ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaCheque(cgc,banco,numero: String);
var
  clCheque: TClassAuxiliar;
begin
  with (clCheque) do
  begin
    clCheque := TClassAuxiliar.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECHMOV ');
    AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    AddParam ('      (CH_BANC='+banco+') AND ');
    AddParam ('      (CH_NUME='+numero+') ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaChequePg(cgc,banco,numero: String);
var
  clChequePg: TClassAuxiliar;
begin
  with (clChequePg) do
  begin
    clChequePg := TClassAuxiliar.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECHMVPG ');
    AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    AddParam ('      (CH_BANC='+banco+') AND ');
    AddParam ('      (CH_NUME='+numero+') ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaChequeDev(cgc,banco,numero: String);
var
  clChequeDev: TClassAuxiliar;
begin
  with (clChequeDev) do
  begin
    clChequeDev := TClassAuxiliar.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECHDEV ');
    AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    AddParam ('      (CH_BANC='+banco+') AND ');
    AddParam ('      (CH_NUME='+numero+') ');
    Execute;
    desconect;
    Free;
  end;
end;

procedure Tfrm_ImportaTrigger.DeletaChequeDevPg(cgc,banco,numero: String);
var
  clChequeDevPg: TClassAuxiliar;
begin
  with (clChequeDevPg) do
  begin
    clChequeDevPg := TClassAuxiliar.Create;
    conect ('CREDITO',self);
    ClearSql;
    AddParam ('Delete from CRECHDVPG ');
    AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    AddParam ('      (CH_BANC='+banco+') AND ');
    AddParam ('      (CH_NUME='+numero+') ');
    Execute;
    desconect;
    Free;
  end;
end;

function  Tfrm_ImportaTrigger.Posicao(caract: Char; linha: String):Integer;
begin
  Posicao := Pos(caract,linha);
end;

procedure Tfrm_ImportaTrigger.btnCompactarClick(Sender: TObject);
var
  clLoja: TClassAuxiliar;
  arq: textfile;
  ind,result: Integer;
  codloja: String;
  continua: Boolean;
begin
  if (rdModelo.itemindex=0) then
  begin
          {Descompactando os arquivos ***}
    SetCurrentDir('C:\NATIVA\CREDITO\MOVIMENTO');
    AssignFile (arq, 'DESCOMP.BAT');
    ReWrite    (arq);
    WriteLn    (arq, 'C:\ARQUIV~1\NATIVA\CREDITO\PKUNZIP -o MATRIZ.ZIP');
    CloseFile  (arq);
    result := winexec ('C:\NATIVA\CREDITO\MOVIMENTO\DESCOMP.BAT',1);
    if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
      showmessage('Não foi possível descompactar o arquivo MATRIZ.MTZ. Tente descompactar o arquivo através de outro programa!');
  end
  else
  if (rdModelo.itemindex=1) then
  begin
       {CRITICA}
    if (rdModelo.itemindex=1) and (Trim(edtLoja.text)='') and (not chTodas.checked) then
    begin
      frmDialogo.ExibirMensagem ('A loja deve ser escolhida para importação!'
        ,'Importação',[mbOk],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtLoja.setfocus;
      continua:=false;
    end
    else
      continua:=true;

       {...}
    if (continua) then
    begin
          {Filtro de dados}
      codloja := Trim(edtLoja.text);

          {Pegando as lojas}
      clLoja  := TClassAuxiliar.Create;
      clLoja.conect ('CREDITO',self);
      clLoja.ClearSql;
      clLoja.AddParam ('Select LO_CODI,LO_NOME ');
      clLoja.AddParam ('From CRELOJA ');
      if (not chTodas.checked) then
        clLoja.AddParam ('Where (LO_CODI='+codloja+') ');
      clLoja.AddParam ('Order by LO_CODI');
      if (not clLoja.Execute) then
        frmDialogo.ExibirMensagem ('Loja(s) não encontradas!'
          ,'Importação',[mbOk],
          frm_principal.x_pathimg+'iconequestion.bmp',250,200)
      else
      begin
               {laco principal por loja}
               {Descompactando os arquivos ***}
        SetCurrentDir('C:\NATIVA\CREDITO\MOVIMENTO');
        AssignFile (arq, 'DESCOMP.BAT');
        ReWrite    (arq);
        clLoja.first;
        while (not clLoja.eof) do
        begin
          codloja := form_nz(clLoja.result('LO_CODI'),2);
          WriteLn(arq, 'C:\ARQUIV~1\NATIVA\CREDITO\PKUNZIP -o LOJA'+codloja+'.ZIP');
          clLoja.next;
        end;
        CloseFile  (arq);
        result := winexec ('C:\NATIVA\CREDITO\MOVIMENTO\DESCOMP.BAT',1);
        if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
          showmessage('Não foi possível descompactar os arquivos. Tente descompactar os arquivos através de outro programa!');
      end;
    end;
  end;
end;

{Verifica se o cheque que vem da filial ja esta cadastrado no banco de dados ou nao ***}
function Tfrm_ImportaTrigger.ChequeExiste(cgc,banco,numero: String):Boolean;
var
  clAux: TClassAuxiliar;
  retorno: Boolean;
begin
  retorno:=false;
  if (cgc<>'') and (banco<>'') and (numero<>'') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CRECHMOV ');
    clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    clAux.AddParam ('      (CH_BANC='+banco+') AND ');
    clAux.AddParam ('      (CH_NUME='+numero+')  ');
    if (clAux.Execute) then
      retorno:=true;
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CRECHMVPG ');
    clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    clAux.AddParam ('      (CH_BANC='+banco+') AND ');
    clAux.AddParam ('      (CH_NUME='+numero+')  ');
    if (clAux.Execute) then
      retorno:=true;
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CRECHDEV ');
    clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    clAux.AddParam ('      (CH_BANC='+banco+') AND ');
    clAux.AddParam ('      (CH_NUME='+numero+')  ');
    if (clAux.Execute) then
      retorno:=true;
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CRECHDVPG ');
    clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
    clAux.AddParam ('      (CH_BANC='+banco+') AND ');
    clAux.AddParam ('      (CH_NUME='+numero+')  ');
    if (clAux.Execute) then
      retorno:=true;
    clAux.desconect;
    clAux.Free;
  end;
end;

{Botao de abertura de tela de recebimento pelo cliente de FTP ***}
procedure Tfrm_ImportaTrigger.btnReceberFTPClick(Sender: TObject);
var
  clLoja: TClassAuxiliar;
  continua: Boolean;
  codloja: String;
  ind: Integer;
begin
  if (rdModelo.itemindex=0) then
  begin
    Application.CreateForm (Tfrm_ImportaFTP_Crediario,frm_ImportaFTP_Crediario);
    frm_ImportaFTP_Crediario.flag:=false;
    frm_ImportaFTP_Crediario.arquivos_host[1]  := 0;
    frm_ImportaFTP_Crediario.totarq := 1;
    frm_ImportaFTP_Crediario.flag_importa := rdModelo.itemindex;
    frm_ImportaFTP_Crediario.showmodal;
    frm_ImportaFTP_Crediario.Free;
  end
  else
  if (rdModelo.itemindex=1) then
  begin
         {CRITICA}
    if (rdModelo.itemindex=1) and (Trim(edtLoja.text)='') and (not chTodas.checked) then
    begin
      frmDialogo.ExibirMensagem ('A loja deve ser escolhida para importação!'
        ,'Importação',[mbOk],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtLoja.setfocus;
      continua:=false;
    end
    else
      continua:=true;

         {...}
    if (continua) then
    begin
            {Filtro de dados}
      codloja := Trim(edtLoja.text);

            {Pegando as lojas}
      clLoja  := TClassAuxiliar.Create;
      clLoja.conect ('CREDITO',self);
      clLoja.ClearSql;
      clLoja.AddParam ('Select LO_CODI,LO_NOME ');
      clLoja.AddParam ('From CRELOJA ');
      if (not chTodas.checked) then
        clLoja.AddParam ('Where (LO_CODI='+codloja+') ');
      clLoja.AddParam ('Order by LO_CODI');
      if (not clLoja.Execute) then
        frmDialogo.ExibirMensagem ('Loja(s) não encontradas!'
          ,'Importação',[mbOk],
          frm_principal.x_pathimg+'iconequestion.bmp',250,200)
      else
      begin
                {Buscando arquivos por FTP}
        Application.CreateForm (Tfrm_ImportaFTP_Crediario,frm_ImportaFTP_Crediario);
        frm_ImportaFTP_Crediario.flag:=false;
        clLoja.first;
        ind:=1;
        while (not clLoja.eof) do
        begin
          frm_ImportaFTP_Crediario.arquivos_host[ind]  := Trunc(clLoja.Result('LO_CODI'));
          clLoja.next;
          ind:=ind+1;
        end;
        frm_ImportaFTP_Crediario.totarq := clLoja.reccount;
        frm_ImportaFTP_Crediario.flag_importa := rdModelo.itemindex;
        frm_ImportaFTP_Crediario.showmodal;
        frm_ImportaFTP_Crediario.Free;
      end;
    end;
  end;
end;

procedure Tfrm_ImportaTrigger.FormActivate(Sender: TObject);
begin
  if (rdModelo.itemindex=1) then
    edtLoja.setfocus;
end;

function Tfrm_ImportaTrigger.VerificaQtdePrestacoesNoContrato(cliente,contrato: Real):Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CR_QPRE FROM CRECTABR                       ');
  clAux.AddParam ('WHERE (CR_CLIE='+floattostr(cliente)+') AND        ');
  clAux.AddParam ('      (CR_CODI='+floattostr(contrato)+')           ');
  clAux.Execute;
  result := clAux.result('CR_QPRE');
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_ImportaTrigger.ExcluiPrestacoesAlemContrato(cliente,contrato,qpre: Real);
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM CREPRABR                               ');
  clAux.AddParam ('WHERE (PC_CLIE='+floattostr(cliente)+') AND        ');
  clAux.AddParam ('      (PC_CONT='+floattostr(contrato)+') AND       ');
  clAux.AddParam ('      (PC_NPRE>'+floattostr(qpre)+')               ');
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_ImportaTrigger.deletacontratos;
var
  query1:tquery;
  cltxt:TClassTXT2;
  clExp :TClassExport;
begin
  try
    query1 := tquery.create(Application);
    query1.databasename := 'CREDITO';

    clExp := TClassExport.Create;
    clExp.Inicializa;
    cltxt :=     clExp.ImportaTabela ('CREDITO','CRECTABR_EXCLUI','C:\NATIVA\CREDITO\MOVIMENTO\EXCONT.MTZ','Exc Contratos',
      'CR_CLIE,CR_CODI,CR_DTEXCLUI','f,f,d',memo1,gauge1,true,'P',1);

    cltxt.freset;
    while not ClTxt.feof do
      with query1 do
      begin
        cltxt.next;

        Sql.Clear;
        Sql.Add ('Delete From CONTRATOS_SPC    ');
        Sql.Add ('Where (CLIENTE  ='+floattostr(cltxt.fieldbyname('CR_CLIE'))+')  AND ');
        sql.add ('      (CONTRATO ='+floattostr(cltxt.fieldbyname('CR_CODI'))+')      ');
        ExecSql;


        Sql.Clear;
        Sql.Add ('Delete From CRECHMOV                      ');
        Sql.Add ('Where Exists(Select * from CREPRABR       ');
        Sql.Add ('      Where  PC_CLIE='+floattostr(cltxt.fieldbyname('CR_CLIE'))+'           ');
        SQL.ADD ('      And    PC_Cont='+floattostr(cltxt.fieldbyname('CR_CODI'))+'         ');
        sQL.Add ('      and    PC_BANC = CRECHMOV.CH_BANC   ');
        sQL.Add ('      and    PC_NUME = CRECHMOV.CH_NUME   ');
        sQL.Add ('      and    PC_CCGC = CRECHMOV.CH_CCGC   ');
        sql.add ('            ) ');

        ExecSql; {*}

        Sql.Clear;
        Sql.Add ('Delete From CRECHMVPG                        ');
        Sql.Add ('Where Exists(Select * from CREPRABR       ');
        Sql.Add ('      Where  PC_CLIE='+floattostr(cltxt.fieldbyname('CR_CLIE'))+'           ');
        SQL.ADD ('      And    PC_Cont='+floattostr(cltxt.fieldbyname('CR_CODI'))+'         ');
        sQL.Add ('      and    PC_BANC = CRECHMVPG.CH_BANC   ');
        sQL.Add ('      and    PC_NUME = CRECHMVPG.CH_NUME   ');
        sQL.Add ('      and    PC_CCGC = CRECHMVPG.CH_CCGC   ');
        sql.add ('            ) ');
        ExecSql; {*}

        Sql.Clear;
        Sql.Add ('Delete From CRECHDEV                         ');
        Sql.Add ('Where Exists(Select * from CREPRABR       ');
        Sql.Add ('      Where  PC_CLIE='+floattostr(cltxt.fieldbyname('CR_CLIE'))+'           ');
        SQL.ADD ('      And    PC_Cont='+floattostr(cltxt.fieldbyname('CR_CODI'))+'         ');
        sQL.Add ('      and    PC_BANC = CRECHDEV.CH_BANC   ');
        sQL.Add ('      and    PC_NUME = CRECHDEV.CH_NUME   ');
        sQL.Add ('      and    PC_CCGC = CRECHDEV.CH_CCGC   ');
        sql.add ('            ) ');
        ExecSql; {*}

        Sql.Clear;
        Sql.Add ('Delete From CRECHDVPG                        ');
        Sql.Add ('Where Exists(Select * from CREPRABR       ');
        Sql.Add ('      Where  PC_CLIE='+floattostr(cltxt.fieldbyname('CR_CLIE'))+'           ');
        SQL.ADD ('      And    PC_Cont='+floattostr(cltxt.fieldbyname('CR_CODI'))+'         ');
        sQL.Add ('      and    PC_BANC = CRECHDVPG.CH_BANC   ');
        sQL.Add ('      and    PC_NUME = CRECHDVPG.CH_NUME   ');
        sQL.Add ('      and    PC_CCGC = CRECHDVPG.CH_CCGC   ');
        sql.add ('            ) ');
        ExecSql; {*}

        Sql.Clear;
        Sql.Add ('Delete From CREPRABR                ');
        Sql.Add ('Where (PC_CLIE='+floattostr(cltxt.fieldbyname('CR_CLIE'))+')     AND  ');
        sql.add ('      (PC_CONT='+floattostr(cltxt.fieldbyname('CR_CODI'))+')    ');
        ExecSql;

        Sql.Clear;
        Sql.Add ('Delete From CRECTABR                ');
        Sql.Add ('Where (CR_CLIE='+floattostr(cltxt.fieldbyname('CR_CLIE'))+')          ');
        SQL.ADD ('and   (CR_CODI='+floattostr(cltxt.fieldbyname('CR_CODI'))+')       ');
        ExecSql;

        RedefinirUltimaCompra (cltxt.fieldbyname('CR_CLIE'));
        RedefinirQtCompra (cltxt.fieldbyname('CR_CLIE'),-1);
      end;
  finally
    cltxt.close;
    cltxt.destroy;
    clexp.finaliza;
    clexp.destroy;
    query1.destroy;
  end;
end;

procedure Tfrm_ImportaTrigger.refreshpanel2;
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

procedure Tfrm_ImportaTrigger.SpeedButton1Click(Sender: TObject);
begin
  frm_cons_impexp := Tfrm_cons_impexp.create(Application);
  frm_cons_impexp.RdTipo.ItemIndex := 1;
  frm_cons_impexp.Btn_procurar.OnClick(Sender);
  frm_cons_impexp.ShowModal;
end;

procedure Tfrm_ImportaTrigger.BitBtnReceberFTPClick(Sender: TObject);
var
  clLoja: TClassAuxiliar;
  continua: Boolean;
  codloja: String;
  ind: Integer;
begin
  if (rdModelo.itemindex=0) then
  begin
    Application.CreateForm (Tfrm_ImportaFTP_Crediario,frm_ImportaFTP_Crediario);
    frm_ImportaFTP_Crediario.flag:=false;
    frm_ImportaFTP_Crediario.arquivos_host[1]  := 0;
    frm_ImportaFTP_Crediario.totarq := 1;
    frm_ImportaFTP_Crediario.flag_importa := rdModelo.itemindex;
    frm_ImportaFTP_Crediario.showmodal;
    frm_ImportaFTP_Crediario.Free;
  end
  else
  if (rdModelo.itemindex=1) then
  begin
         {CRITICA}
    if (rdModelo.itemindex=1) and (Trim(edtLoja.text)='') and (not chTodas.checked) then
    begin
      frmDialogo.ExibirMensagem ('A loja deve ser escolhida para importação!'
        ,'Importação',[mbOk],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtLoja.setfocus;
      continua:=false;
    end
    else
      continua:=true;

         {...}
    if (continua) then
    begin
            {Filtro de dados}
      codloja := Trim(edtLoja.text);

            {Pegando as lojas}
      clLoja  := TClassAuxiliar.Create;
      clLoja.conect ('CREDITO',self);
      clLoja.ClearSql;
      clLoja.AddParam ('Select LO_CODI,LO_NOME ');
      clLoja.AddParam ('From CRELOJA ');
      if (not chTodas.checked) then
        clLoja.AddParam ('Where (LO_CODI='+codloja+') ');
      clLoja.AddParam ('Order by LO_CODI');
      if (not clLoja.Execute) then
        frmDialogo.ExibirMensagem ('Loja(s) não encontradas!'
          ,'Importação',[mbOk],
          frm_principal.x_pathimg+'iconequestion.bmp',250,200)
      else
      begin
                {Buscando arquivos por FTP}
        Application.CreateForm (Tfrm_ImportaFTP_Crediario,frm_ImportaFTP_Crediario);
        frm_ImportaFTP_Crediario.flag:=false;
        clLoja.first;
        ind:=1;
        while (not clLoja.eof) do
        begin
          frm_ImportaFTP_Crediario.arquivos_host[ind]  := Trunc(clLoja.Result('LO_CODI'));
          clLoja.next;
          ind:=ind+1;
        end;
        frm_ImportaFTP_Crediario.totarq := clLoja.reccount;
        frm_ImportaFTP_Crediario.flag_importa := rdModelo.itemindex;
        frm_ImportaFTP_Crediario.showmodal;
        frm_ImportaFTP_Crediario.Free;
      end;
    end;
  end;
end;

procedure Tfrm_ImportaTrigger.BitBtnDescompactarClick(Sender: TObject);
var
  clLoja: TClassAuxiliar;
  arq: textfile;
  ind,result: Integer;
  codloja: String;
  continua: Boolean;
begin
  if (rdModelo.itemindex=0) then
  begin
          {Descompactando os arquivos ***}
    SetCurrentDir('C:\NATIVA\CREDITO\MOVIMENTO');
    AssignFile (arq, 'DESCOMP.BAT');
    ReWrite    (arq);
    WriteLn    (arq, 'C:\ARQUIV~1\NATIVA\CREDITO\PKUNZIP -o MATRIZ.ZIP');
    CloseFile  (arq);
    result := winexec ('C:\NATIVA\CREDITO\MOVIMENTO\DESCOMP.BAT',1);
    if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
      showmessage('Não foi possível descompactar o arquivo MATRIZ.MTZ. Tente descompactar o arquivo através de outro programa!');
  end
  else
  if (rdModelo.itemindex=1) then
  begin
       {CRITICA}
    if (rdModelo.itemindex=1) and (Trim(edtLoja.text)='') and (not chTodas.checked) then
    begin
      frmDialogo.ExibirMensagem ('A loja deve ser escolhida para importação!'
        ,'Importação',[mbOk],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200);
      edtLoja.setfocus;
      continua:=false;
    end
    else
      continua:=true;

       {...}
    if (continua) then
    begin
          {Filtro de dados}
      codloja := Trim(edtLoja.text);

          {Pegando as lojas}
      clLoja  := TClassAuxiliar.Create;
      clLoja.conect ('CREDITO',self);
      clLoja.ClearSql;
      clLoja.AddParam ('Select LO_CODI,LO_NOME ');
      clLoja.AddParam ('From CRELOJA ');
      if (not chTodas.checked) then
        clLoja.AddParam ('Where (LO_CODI='+codloja+') ');
      clLoja.AddParam ('Order by LO_CODI');
      if (not clLoja.Execute) then
        frmDialogo.ExibirMensagem ('Loja(s) não encontradas!'
          ,'Importação',[mbOk],
          frm_principal.x_pathimg+'iconequestion.bmp',250,200)
      else
      begin
               {laco principal por loja}
               {Descompactando os arquivos ***}
        SetCurrentDir('C:\NATIVA\CREDITO\MOVIMENTO');
        AssignFile (arq, 'DESCOMP.BAT');
        ReWrite    (arq);
        clLoja.first;
        while (not clLoja.eof) do
        begin
          codloja := form_nz(clLoja.result('LO_CODI'),2);
          WriteLn(arq, 'C:\ARQUIV~1\NATIVA\CREDITO\PKUNZIP -o LOJA'+codloja+'.ZIP');
          clLoja.next;
        end;
        CloseFile  (arq);
        result := winexec ('C:\NATIVA\CREDITO\MOVIMENTO\DESCOMP.BAT',1);
        if (result=0) or (result=ERROR_BAD_FORMAT) or (result=ERROR_FILE_NOT_FOUND) or (result=ERROR_PATH_NOT_FOUND) then
          showmessage('Não foi possível descompactar os arquivos. Tente descompactar os arquivos através de outro programa!');
      end;
    end;
  end;
end;

procedure Tfrm_ImportaTrigger.BitBtnImportarClick(Sender: TObject);
begin
  Importarmovimento1.click;
end;

end.
{Verifica se o cheque que vem da filial ja esta cadastrado no banco de dados ou nao ***}function Tfrm_ImportaTrigger.ChequeExiste(cgc,banco,numero: String):Boolean;
var
clAux: TClassAuxiliar;
retorno: Boolean;
begin
retorno:=false;
if (cgc<>'') and (banco<>'') and (numero<>'') then
begin
clAux := TClassAuxiliar.Create;
clAux.conect   ('CREDITO',self);
clAux.ClearSql;
clAux.AddParam ('SELECT * FROM CRECHMOV ');
clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
clAux.AddParam ('      (CH_BANC='+banco+') AND ');
clAux.AddParam ('      (CH_NUME='+numero+')  ');
if (clAux.Execute) then
retorno:=true;
clAux.ClearSql;
clAux.AddParam ('SELECT * FROM CRECHMVPG ');
clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
clAux.AddParam ('      (CH_BANC='+banco+') AND ');
clAux.AddParam ('      (CH_NUME='+numero+')  ');
if (clAux.Execute) then
retorno:=true;
clAux.ClearSql;
clAux.AddParam ('SELECT * FROM CRECHDEV ');
clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
clAux.AddParam ('      (CH_BANC='+banco+') AND ');
clAux.AddParam ('      (CH_NUME='+numero+')  ');
if (clAux.Execute) then
retorno:=true;
clAux.ClearSql;
clAux.AddParam ('SELECT * FROM CRECHDVPG ');
clAux.AddParam ('Where (CH_CCGC='+chr(39)+cgc+chr(39)+') AND ');
clAux.AddParam ('      (CH_BANC='+banco+') AND ');
clAux.AddParam ('      (CH_NUME='+numero+')  ');
if (clAux.Execute) then
retorno:=true;
clAux.desconect;
clAux.Free;
end;
end;
end.
