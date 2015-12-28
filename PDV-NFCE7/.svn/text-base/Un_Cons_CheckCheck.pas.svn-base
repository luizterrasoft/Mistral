unit Un_Cons_CheckCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, MaskEdit, StdCtrls, EditControle, PiscaLabel, ExtCtrls,CHECKCOMLib_TLB,auxiliar,
  ComCtrls, Grids, GridControl, GridSql, MemoControle, DB, DBTables,bitbtncontrole,buttons,funcoesglobais,maskutils;

type

  TClassConsCheckCheck = class
  private
    FGrupo:TStringList;
    FRegistro:TStringList;
    FCampo:TStringList;
  public
    TipoConsulta :Integer;
    constructor Create;
    destructor  Destroy;
    function DivideBuffer(FBuffer:String):String;
    function retornaValor(Grupo,Campo: String;Linha:Integer=0;Tratar:Boolean=true): String;
    function RetornaTitulo(Grupo: String;
      Campo: Integer;CAMPOSTR:String='';semquant:Boolean=true): String;
  end;

  TFrm_ConsCheckCheck = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    lblCpfCnpj: TLabel;
    lblValor: TLabel;
    lblBanco: TLabel;
    lblAgencia: TLabel;
    lblConta: TLabel;
    lblChequeInicial: TLabel;
    lblCMC7: TLabel;
    Label1: TLabel;
    lblChequeFinal: TLabel;
    Panel2: TPanel;
    CnpjCpf: TEditControle;
    Valor: TEditControle;
    Banco: TEditControle;
    Agencia: TEditControle;
    Conta: TEditControle;
    ChequeIni: TEditControle;
    ChequeFinal: TEditControle;
    Cmc7: TEditControle;
    Qtde: TEditControle;
    Panel1: TPanel;
    lblTelefone1: TLabel;
    lblTelefone2: TLabel;
    lblTelefone3: TLabel;
    lblTelefone4: TLabel;
    Tel1: TMaskEditControle;
    Tel2: TMaskEditControle;
    Tel3: TMaskEditControle;
    Tel4: TMaskEditControle;
    Obs: TMemoControle;
    Query1: TQuery;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    Label2: TLabel;
    lOGIN: TMemoControle;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    MLogin: TMemoControle;
    Cheques: TMemoControle;
    Pendencias: TMemoControle;
    Outras: TMemoControle;
    TabSheet9: TTabSheet;
    Cliente: TMemoControle;
    LbCheckCheck: TLabel;
    Query2: TQuery;
    botao_sair: TPanel;
    Label8: TLabel;
    BConfirma: TBitBtnControle;
    PiscaLabel1: TPiscaLabel;
    Query3: TQuery;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FClickBotao(Sender: TObject);
    procedure CnpjCpfExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure BConfirmaClick(Sender: TObject);
  private
    FClassCheckCheck:TClassConsCheckCheck;
    FSenha:Boolean;
    { Private declarations }
  public
    FhoraCons:TDateTime;
    { Public declarations }
  end;

function RetornaNomeGrupoCheckCheck(Grupo,Campo:String):String;

var
  Frm_ConsCheckCheck: TFrm_ConsCheckCheck;
  ap : ChkApplication;     //Objeto ChkApplication
  sv : ChkServer;          //Objeto ChkServer (genérico)
  rp : ChkResponse;        //Objeto ChkResponse
  rq : ChkRequest;         //Objeto ChkRequest (genérico)
  md : ChkModem;           //Objeto ChkModem
  Claux: TClassAuxiliar;

function ConexaoCheckCheck:Boolean;

implementation

uses Principal, unDialogo, unMensagem,funcoes2,funcoes1, Un_Senha_CheckCheck,
  un_senhaSupervisor, un_frmConsulta1, cadcli;

function ConexaoCheckCheck:Boolean;
var
  i,iTipoServidor : Integer;
  iProtocolo    : Integer;
  iTRansacao    : Integer;
  bConn         : Boolean;

begin
  Frm_ConsCheckCheck := TFrm_ConsCheckCheck.Create(Application);
  try
    with Frm_ConsCheckCheck do
    begin
      Query1.sql.add('Select * from CheckCheck');
      Query1.Open;

      if Query1.Eof then
      begin
        frmDialogo.ExibirMensagem (' Parametros de configuração de conexão e consultas da Check Check não Configurados!'
          ,'CheckCheck',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        exit;
      end;


      mostra_mensagem ('Conectando ao Servidor Check Check!Aguarde...');
      frm_mensagem.painel.visible:=true;
      frm_mensagem.gauge1.progress:=0;
      application.ProcessMessages;


      //Criando objeto ChkApplication
      ap := CoChkApplication.Create;

      if( frm_principal.x_checkcheckServidor = 'RENPAC' ) then
        iTipoServidor := 1
      else
        iTipoServidor := 0;

      if (Frm_Principal.X_CheckCheckProtocolo = 'ISO8583 EXTENDED' ) then
        iProtocolo := 2
      else
      if( Frm_Principal.X_CheckCheckProtocolo = 'ISO8583' ) then
        iProtocolo := 1
      else
        iProtocolo := 0;

      //Desconectar caso já esteja conectado
      if( sv <> nil ) then
        sv.Disconnect();

      sv := ap.CreateServer( iTipoServidor, iProtocolo );

      if( iTipoServidor = 0 ) then      //Servidor TCPIP
      begin
          //Setando os dados da conexão TCPIP
        ChkServerTCPIP(sv).ProvedorTCPIP := frm_principal.x_checkcheckprovedor;
        ChkServerTCPIP(sv).PortaTCPIP := InttoStr(frm_principal.x_checkcheckPorta);
        ChkServerTCPIP(sv).CodigoCliente := Query1.FieldByNAme('Ck_Cliente').AsString;
        ChkServerTCPIP(sv).SenhaCliente := Query1.FieldByNAme('Ck_senha').AsString;
        ChkServerTCPIP(sv).SerialCliente := Query1.FieldByNAme('Ck_serial').AsString;
        ChkServerTCPIP(sv).EmailCliente := '';
        ChkServerTCPIP(sv).Historico := 1;
        ChkServerTCPIP(sv).Detalhe := '99';
        ChkServerTCPIP(sv).NivelRetornoEstado := 1;
        ChkServerTCPIP(sv).Criptografia := 1;
        bConn := true;
      end
      else
      if( iTipoServidor = 1 ) then   //Servidor PAC
      begin
          //Setando os dados da conexão RENPAC
        ChkServerPAC(sv).ProvedorPAC := frm_principal.X_checkcheckprovedor;
          //ChkServerPAC(sv).NiuPAC := ''
          //ChkServerPAC(sv).SenhaPAC := ''
        ChkServerPAC(sv).TelefonePAC := '0,07878236';
        ChkServerPAC(sv).CodigoCliente := Query1.FieldByNAme('Ck_Cliente').AsString;
        ChkServerPAC(sv).SenhaCliente := Query1.FieldByNAme('Ck_Senha').AsString;
        ChkServerPAC(sv).SerialCliente := Query1.FieldByNAme('Ck_Serial').AsString;
        ChkServerPAC(sv).EmailCliente := '';
        ChkServerPAC(sv).Historico := 1;
        ChkServerPAC(sv).Detalhe := '99';
        ChkServerPAC(sv).NivelRetornoEstado := 1;

          //Detectando modem
        frm_mensagem.pn_mensagem.caption := 'Detectando Modemm...';
        application.ProcessMessages;

        md := ChkServerPAC(sv).DetectModem(1,Query1.FieldByNAme('Ck_Porta').AsInteger );

        if(md = nil) then
        begin
          esconde_mensagem;
          frmDialogo.ExibirMensagem (' Porta de Modem nao Encontrada '
            ,'CheckCheck',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        end
        else
        begin
          md.Dialed := 1;
          bConn := true;
        end
      end;

     //Abrindo conexao
      if( bConn ) then
        if( sv.Connect() <> 0 ) then
        begin
          frm_mensagem.pn_mensagem.caption := 'Realizando Operação de Login Externo';
          frm_mensagem.painel.visible:=true;
          frm_mensagem.gauge1.progress:=50;
          application.ProcessMessages;
        end
        else
        begin
          esconde_mensagem;
          frmDialogo.ExibirMensagem (' Falha na Conexão com a Check Check '
            ,'CheckCheck',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        end;

      iTransacao := 0;

      //////////////////////////////////////////////////////////////////////
      // Criando objeto ChkRequest.                                       //
      // Operações com o objeto ChkRequest podem ser feitas com o objeto  //
      // generico ou com os especificos. Nesse caso escolhemos o genérico //
      // e utilizamos casting para setar as propriedades.                 //
      //////////////////////////////////////////////////////////////////////
      rq := sv.CreateRequest( iTransacao );

      //Criando objeto ChkResponse
      rp := sv.CreateResponse();

      Application.ProcessMessages;

      if sv.Transaction() <> 0 then
      begin
        frm_mensagem.pn_mensagem.caption := 'Login realizado com sucesso';
        application.ProcessMessages;
        obs.Text := rp.Buffer ;
        FClassCheckCheck.TipoConsulta := 0;
        Login.Text := FClassCheckCheck.DivideBuffer(rp.Buffer);

      end
      else
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem (' Falha no Login com a Check Check '
          ,'CheckCheck',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      end;


      i := 1;
      while not Query1.eof do
      begin
        with TBitBtnControle.Create(Frm_ConsCheckCheck) do
        begin
          Parent  := Panel2;
          if Tel4.NextPos = nil then
            Tel4.NextPos := TwinControl(Panel2.Controls[0]);
          OnClick := FClickBotao;
          Caption := '&'+InttoStr(I)+'.'+Query1.FieldByName('Ck_Consulta').AsString;
          if Pos('CheckCadastro',Caption) > 0 then
            Tag := 5
          else
          if Pos('CheckCheck',Caption) > 0  then
            Tag := 55
          else
          if Pos('CheckPlus',Caption) > 0 then
            Tag := 56
          else
          if Pos('CheckMaster',Caption) > 0 then
            Tag := 57
          else
          if Pos('CheckGold',Caption) > 0 then
            Tag := 58;

//          OnClick := FClickBotao;
          Top  := 05;
          Height := Panel2.height - 10;
          Width  := 115;
          if Panel2.ControlCount = 1 then
            left := 1
          else
            Left := TBitBtn(Panel2.Controls[Panel2.ControlCount - 2]).Left +
              TBitBtn(Panel2.Controls[Panel2.ControlCount - 2]).width + 15;

        end;
        Query1.Next;
        Inc(I);
      end;

      esconde_mensagem;

      if login.text <> '' then
        Result := ShowModal = mrok
      else
        Exit;

    end;




  finally
    Frm_ConsCheckCheck.Destroy;
  end;


end;

{$R *.dfm}

procedure TFrm_ConsCheckCheck.FClickBotao(Sender: TObject);
var
  iTRansacao:Integer;
  FLinha,ind,i:Integer;
  F,FValor,oldgrupo : String;
  fmemo:tmemo;
  Flist:TList;
  ffocu:Boolean;
  Fgrupo,FirstCampo:String;
  marcio: String;
  senham : String;
  continua : Boolean;
  conf : String;
const
  FGruposReg : array[0..20] of String = ('LAS','CFM','SRF','PVJ','CCF','RCO','TLB'
    ,'TBC','PLU','CTM','SEM','PFN','RFN','CHI','INS'
    ,'PRT','ACO','FAL','TEL','VCL','RST');
  FgruposLogin:array[0..3] of String = ('LOI','MSG','FRN','LAS');
  FgruposCliente:array[0..5] of String = ('NOM','SRF','BCO','AGE','TEL','VEL');
  FgruposPen:array[0..6] of String = ('PVJ','PFN','RFN','INS','PRT','ACO','FAL');
  FgruposCheques:array[0..9] of String = ('RCH','CFV','CCF','RCO','TLB','TBC','PLU','CTM','SEM','CHI');
  FgruposOutras:array[0..2] of String = ('DHC','CRE','RST');
  FGruposRest : array[0..11] of String = ('CFV','PVJ','CCF','RCO','TLB','PLU','PFN','RFN','INS','PRT','ACO','FAL');


  function RetornaMemo(grupo:String):TMemocontrole;
  var
    i:Integer;
    flist:TLIst;
  begin
    result := nil;
    for i:=0 to Length(FGruposLogin) - 1 do
      if FGruposLogin[i] = Grupo then
      begin
        Result := Mlogin;
        Exit;
        ;
      end;

    for i:=0 to Length(FGruposCheques) - 1 do
      if FGruposCheques[i] = Grupo then
      begin
        Result := Cheques;
        Exit;
        ;
      end;

    for i:=0 to Length(FGruposOutras) - 1 do
      if FGruposOutras[i] = Grupo then
      begin
        Result := Outras;
        Exit;
        ;
      end;

    for i:=0 to Length(FGruposPen) - 1 do
      if FGruposPen[i] = Grupo then
      begin
        Result := Pendencias;
        Exit;
        ;
      end;

    for i:=0 to Length(FGruposCliente) - 1 do
      if FGruposCliente[i] = Grupo then
      begin
        Result := Cliente;
        Exit;
        ;
      end;




  end;

  function gruporeg(FGrupo:String):Boolean;
  var
    i:Integer;
  begin
    result := false;
    for i:=0 to Length(FGruposReg) - 1 do
      if uppercase(FgruposReg[i]) = UpperCase(Fgrupo) then
      begin
        Result := true;
        exit;
      end;
  end;


  procedure montacabecalho(FGrupo:String);
  var
    FTam:Integer;
    FNGrupo:String;
    oldfont:TFont;
  begin

    with TQuery.Create(application) do
      try
        databasename := 'CREDITO';

        Sql.Clear;
        Sql.Add('Select Sum(Ck_Tam) as tam from CheckCheckRet');
        sql.add('Where Ck_Grupo = '''+Fgrupo+'''');
        Open;

        FTam := FieldByName('Tam').AsiNteGER;

        Sql.Clear;
        Sql.Add('Select * from CheckCheckRet');
        sql.add('Where Ck_Grupo = '''+Fgrupo+'''');
        sql.add('And   Ck_Exibe = ''SIM''');
        Sql.Add('Order By Ck_pos');
        Open;



        if not eof then
        begin
//      fmemo.Color := clblack;
          fmemo.Font.Color := clnavy;
//      fmemo.Font.Name := 'curier new';
//      fmemo.Font.Style := [fsbold];
          Fmemo.lines.Add(stringofchar('-',500));
          oldfont := TFont.Create;
          try
            Oldfont.Assign(Self.Canvas.Font);
            Self.Canvas.Font.Assign(MLogin.Font);
            FNGrupo := UpperCase(RetornaNomeGrupoCheckCheck(Fgrupo,''));
//        Fmemo.lines.Add(PadC(FNGrupo,MLogin.Width div Self.Canvas.textwidth('-') div 2 - Length(FNGrupo) div 2,' '));
            Fmemo.lines.Add(PadC(FNGrupo,MLogin.Width div Self.Canvas.textwidth('-'),' '));
          finally
            Self.Canvas.Font.Assign(oldfont);
            OldFont.Destroy;
          end;

        end;

        if gruporeg(FGrupo) then
        begin
          Fmemo.lines.Add('');
          while not Eof do
          begin
            if FieldByName('Ck_Alinhamento').AsString = 'Direita' then
              Fmemo.lines[Fmemo.lines.Count - 1] := Fmemo.lines[Fmemo.lines.Count - 1]+iifs(Fmemo.Lines[FMemo.Lines.Count - 1] <> '',' ','') + PadL(RetornaNomeGrupoCheckCheck(FGrupo,FieldByName('Ck_Campo').AsString),FieldByName('Ck_Tam').AsInteger,' ')
            else
              Fmemo.lines[Fmemo.lines.Count - 1] := Fmemo.lines[Fmemo.lines.Count - 1]+iifs(Fmemo.Lines[FMemo.Lines.Count - 1] <> '',' ','') + PadR(RetornaNomeGrupoCheckCheck(FGrupo,FieldByName('Ck_Campo').AsString),FieldByName('Ck_Tam').AsInteger,' ');
//         fmemo.Lines.Add('');
            next;
          end;
        end;

        first;
        if not eof then
          Fmemo.lines.Add(stringofchar('-',500));
      finally
        destroy;
      end;




  end;


  function linhaobs(vgrupo:String):String;
  begin
    Result :=  'Existem '+
      iifs(FClassCheckCheck.retornaValor(VGrupo,'QUANT') <> '',
      FClassCheckCheck.retornaValor(VGrupo,'QUANT'),
      '1')+' '+
      RetornaNomeGrupoCheckCheck(VGrupo,'')+
      ' com pendencia(s)';
  end;

begin


  Screen.Cursor := CrHourGlass;
  TabSheet3.TabVisible := false;
  TabSheet2.TabVisible := false;

  try
    for i:=0 to Self.ComponentCount - 1 do
      if Self.Components[i] is Tmemo then
        Tmemo(Self.Components[i]).Lines.Clear;

    TabSheet3.TabVisible := false;
    iTransacao := TBitBtn(Sender).Tag;

    rq := sv.CreateRequest( iTransacao );

      //Criando objeto ChkResponse
    rp := sv.CreateResponse();
//Marcio---------------------------------------------------------------------------
    Query3.Close;
    Query3.SQL.Clear;
    Query3.SQL.Add('Select * from Checkcheck      ');
    Query3.SQL.Add('Where ck_consulta = :ckcons   ');
    if iTRansacao = 5 then
      Query3.ParamByName('ckcons').AsString := 'CheckCadastro'
    else
    if iTRansacao = 55 then
      Query3.ParamByName('ckcons').AsString := 'CheckCheck'
    else
    if iTRansacao = 56 then
      Query3.ParamByName('ckcons').AsString := 'CheckPlus'
    else
    if iTRansacao = 57 then
      Query3.ParamByName('ckcons').AsString := 'CheckMaster'
    else
    if iTRansacao = 58 then
      Query3.ParamByName('ckcons').AsString := 'CheckGold';
    Query3.Open;
    if (Query3.FieldByName('ck_senhat').AsString = 'Sim') then
    begin
      frm_senhaSupervisor.showmodal;
      if (frm_senhaSupervisor.y_flag) then
        continua := true
      else
        continua := false;
    end
    else
      continua := true;

    if (continua) then
    begin
      if iTransacao = 5 then     //ChkRequestCheckCadastro
      begin
        ChkRequestCheckCadastro(rq).CPFCNPJ := CNPJCPF.Text;
        ChkRequestCheckCadastro(rq).TipoPessoa := IIfs(Length(CNPJCPF.Text) = 11,'F','J');

        ChkRequestCheckCadastro(rq).DDD1 := Copy(SoNumero(Tel1.Text),1,2);
        ChkRequestCheckCadastro(rq).DDD2 := Copy(SoNumero(Tel2.Text),1,2);
        ChkRequestCheckCadastro(rq).DDD3 := Copy(SoNumero(Tel3.Text),1,2);
        ChkRequestCheckCadastro(rq).DDD4 := Copy(SoNumero(Tel4.Text),1,2);

        ChkRequestCheckCadastro(rq).Telefone1 := Copy(SoNumero(Tel1.Text),3,Length(Tel1.Text));
        ChkRequestCheckCadastro(rq).Telefone2 := Copy(SoNumero(Tel2.Text),3,Length(Tel2.Text));
        ChkRequestCheckCadastro(rq).Telefone3 := Copy(SoNumero(Tel3.Text),3,Length(Tel3.Text));
        ChkRequestCheckCadastro(rq).Telefone4 := Copy(SoNumero(Tel4.Text),3,Length(Tel4.Text));
      end
      else
      if iTransacao = 55 then    //ChkRequestCheckCheck
      begin
        ChkRequestCheckCheck(rq).CPFCNPJ := CNPJCPF.Text;
        ChkRequestCheckCheck(rq).TipoPessoa := IIfs(Length(CNPJCPF.Text) = 11,'F','J');
        ChkRequestCheckCheck(rq).Valor := Valor.Text;
        ChkRequestCheckCheck(rq).DDD1 := Copy(SoNumero(Tel1.Text),1,2);
        ChkRequestCheckCheck(rq).DDD2 := Copy(SoNumero(Tel2.Text),1,2);
        ;

        ChkRequestCheckCheck(rq).Telefone1 := Copy(SoNumero(Tel1.Text),3,Length(Tel1.Text));
        ChkRequestCheckCheck(rq).Telefone2 := Copy(SoNumero(Tel2.Text),3,Length(Tel2.Text));
      end
      else
      if iTransacao = 56 then    //ChkRequestCheckPlus
      begin
        ChkRequestCheckPlus(rq).CPFCNPJ := CNPJCPF.Text;
        ChkRequestCheckPlus(rq).TipoPessoa := IIfs(Length(CNPJCPF.Text) = 11,'F','J');
        ;
        ChkRequestCheckPlus(rq).Valor := Valor.Text;
        ChkRequestCheckPlus(rq).Banco := Banco.Text;
        ChkRequestCheckPlus(rq).Agencia := Agencia.Text;
        ChkRequestCheckPlus(rq).Conta := Conta.Text;
        ChkRequestCheckPlus(rq).ChequeInicial := ChequeIni.Text;
        ChkRequestCheckPlus(rq).ChequeFinal := ChequeFinal.Text;
        ChkRequestCheckPlus(rq).Cmc7 := CMC7.Text;
        ChkRequestCheckPlus(rq).QuantidadeCmc7 := StrToIntN( Qtde.Text);


        ChkRequestCheckPlus(rq).DDD1 := Copy(SoNumero(Tel1.Text),1,2);
        ChkRequestCheckPlus(rq).DDD2 := Copy(SoNumero(Tel2.Text),1,2);

        ChkRequestCheckPlus(rq).Telefone1 := Copy(SoNumero(Tel1.Text),3,Length(Tel1.Text));
        ChkRequestCheckPlus(rq).Telefone2 := Copy(SoNumero(Tel2.Text),3,Length(Tel2.Text));

      end
      else
      if iTransacao = 57 then    //ChkRequestCheckMaster
      begin
        ChkRequestCheckMaster(rq).CPFCNPJ := CNPJCPF.Text;
        ChkRequestCheckMaster(rq).TipoPessoa := IIfs(Length(CNPJCPF.Text) = 11,'F','J');
        ChkRequestCheckMaster(rq).Valor := Valor.Text;
        ChkRequestCheckMaster(rq).Banco := Banco.Text;
        ChkRequestCheckMaster(rq).Agencia := Agencia.Text;
        ChkRequestCheckMaster(rq).Conta := Conta.Text;
        ChkRequestCheckMaster(rq).ChequeInicial := ChequeIni.Text;
        ChkRequestCheckMaster(rq).ChequeFinal := ChequeFinal.Text;
        ChkRequestCheckMaster(rq).Cmc7 := CMC7.Text;
        ChkRequestCheckMaster(rq).QuantidadeCmc7 := StrToIntN( Qtde.Text );

        ChkRequestCheckMaster(rq).DDD1 := Copy(SoNumero(Tel1.Text),1,2);
        ChkRequestCheckMaster(rq).DDD2 := Copy(SoNumero(Tel2.Text),1,2);

        ChkRequestCheckMaster(rq).Telefone1 := Copy(SoNumero(Tel1.Text),3,Length(Tel1.Text));
        ChkRequestCheckMaster(rq).Telefone2 := Copy(SoNumero(Tel2.Text),3,Length(Tel2.Text));

      end
      else
      if iTransacao = 58 then    //ChkRequestCheckGold
      begin
        ChkRequestCheckGold(rq).CPFCNPJ := CNPJCPF.Text;
        ChkRequestCheckGold(rq).TipoPessoa := IIfs(Length(CNPJCPF.Text) = 11,'F','J');
        ChkRequestCheckGold(rq).Valor := Valor.Text;
        ChkRequestCheckGold(rq).Banco := Banco.Text;
        ChkRequestCheckGold(rq).Agencia := Agencia.Text;
        ChkRequestCheckGold(rq).Conta := Conta.Text;
        ChkRequestCheckGold(rq).ChequeInicial := ChequeIni.Text;
        ChkRequestCheckGold(rq).ChequeFinal := ChequeFinal.Text;
        ChkRequestCheckGold(rq).Cmc7 := CMC7.Text;
        ChkRequestCheckGold(rq).QuantidadeCmc7 := StrToIntN( Qtde.Text );

        ChkRequestCheckGold(rq).DDD1 := Copy(SoNumero(Tel1.Text),1,2);
        ChkRequestCheckGold(rq).DDD2 := Copy(SoNumero(Tel2.Text),1,2);

        ChkRequestCheckGold(rq).Telefone1 := Copy(SoNumero(Tel1.Text),3,Length(Tel1.Text));
        ChkRequestCheckGold(rq).Telefone2 := Copy(SoNumero(Tel2.Text),3,Length(Tel2.Text));
      end;



      Application.ProcessMessages;

      if sv.Transaction() <> 0 then
      begin
        frm_mensagem.pn_mensagem.caption := 'Login realizado com sucesso';
        application.ProcessMessages;
        FList := TList.Create;
        try
          pagecontrol2.GetTabOrderList(FList);
          for i:=0 to flist.count - 1 do
            if (TWinControl(FLIst[i]) is TMemo) and
              (TMemo(FLIst[i]).Parent is TTabSheet)  then
              TTabSheet(TMemo(FLIst[i])).TabVisible := true;
        finally
          Flist.destroy;
        end;

        FClassCheckCheck.DivideBuffer(rp.Buffer);
//        ShowMessage(rp.Buffer);
        marcio := FClassCheckCheck.DivideBuffer(rp.Buffer);
//        ShowMessage(marcio);
        if FClassCheckCheck.FGrupo.indexof('ERR') >= 0 then
        begin
          with TStringList.Create do
            try
              Add('Consulta');
              Add(Copy(TbitBtn(Sender).Caption,4,Length(TbitBtn(Sender).Caption)));
              Add('');
              add('Parametros da Consulta');
              Add('');
              for i:=0 to TabSheet1.ControlCount - 1 do
                if TabSheet1.Controls[i] is TCustomEdit then
                  Add(Copy(PadR(TCustomEdit(TabSheet1.Controls[i]).Name,20,'.'),1,20)+' '+TCustomEdit(TabSheet1.Controls[i]).Text);
              Add('');
              Add('Erro');
              Add(PadR('Nível',20,'.')+FClassCheckCheck.retornaValor('ERR','NIV_ERR'));
              Add(PadR('Descrição',20,'.')+FClassCheckCheck.retornaValor('ERR','MSG_COD_ERR'));
              SaveToFile('C:\Nativa\Credito\RetCheckCheck.txt');
              SaveToFile('C:\Sql.Sql');
            finally
              Destroy;
            end;

          if MensOpcoes('Erro na Abertura da Pesquisa '+Copy(TButton(Sender).Caption,4,length(TButton(Sender).Caption))+#13+
            'Nível           '+FClassCheckCheck.retornaValor('ERR','NIV_ERR')+#13+
            'Descrição       '+FClassCheckCheck.retornaValor('ERR','MSG_COD_ERR')
            ,['Repetir',
            'Cancelar'
            ],0) = 0 then
            FClickBotao(Sender);
          exit;
        end;

        with TStringList.Create do
          try
            Add('Consulta');
            Add(Copy(TbitBtn(Sender).Caption,4,Length(TbitBtn(Sender).Caption)));
            Add('');
            add('Parametros da Consulta');
            Add('');
            for i:=0 to TabSheet1.ControlCount - 1 do
              if TabSheet1.Controls[i] is TCustomEdit then
                Add(Copy(PadR(TCustomEdit(TabSheet1.Controls[i]).Name,50,'.'),1,50)+' '+TCustomEdit(TabSheet1.Controls[i]).Text);
            add('');
            add('Retorno da Consulta(Grupo-Campo)');
            Add('');
            for i:=0 to FClassCheckCheck.FCampo.Count - 1 do
              Add(PadR(
                FClassCheckCheck.RetornaTitulo(Copy(FClassCheckCheck.FCampo[i],1,3),-1)+'-'+
                RetornaNomeGrupoCheckCheck(Copy(FClassCheckCheck.FCampo[i],1,3),FClassCheckCheck.RetornaTitulo(Copy(FClassCheckCheck.FCampo[i],1,3),I - LikeStrings(FClassCheckCheck.FCampo,Copy(FClassCheckCheck.FCampo[i],1,3))))
                ,50,'.')+' '+
                Copy(FClassCheckCheck.FCampo[i],5,Length(FClassCheckCheck.FCampo[i])));
            Add('');


            Add(PadR('Numero da Consulta',50,'.')+FClassCheckCheck.retornaValor('CRE','COD_RESP'));

            try
              FhoraCons := StrtoDateN(FClassCheckCheck.retornaValor('DHC','DAT_HOR'));
            except
              FhoraCons := Now;
            end;

            if FClassCheckCheck.retornaValor('DHC','DAT_HOR') <> '' then
              Add(PadR('Data/Hora',50,'.')+FClassCheckCheck.retornaValor('DHC','DAT_HOR'))
            else
            begin
              FhoraCons := Now;
              Add(PadR('Data/Hora',50,'.')+formatdatetime('dd/mm/yyyy hh:mm:ss',Now()));
            end;


            SaveToFile('C:\Nativa\Credito\RetCheckCheck.txt');
            SaveToFile('C:\Sql.Sql');
          finally
            Destroy;
          end;


        qUERY1.Sql.Clear;
        query1.Sql.Add('Select Min(Ck_Pos) as Ck_Pos,(Select Max(Ck_Bloq) from CheckCheck) as Ck_Bloq,Ck_Grupo from CheckCheckRet CR');
        query1.Sql.Add('Group By Ck_Grupo');
        query1.Sql.Add('Order By 1');


        Query1.Open;
        oldgrupo := '';
        while not Query1.Eof do
        begin
          Fmemo := RetornaMemo(Query1.FieldByName('Ck_grupo').AsString);
          with Fmemo do
          begin
            if FClassCheckCheck.Fgrupo.IndexOf(Query1.FieldByName('Ck_grupo').AsString) = -1 then
            begin
              query1.Next;
              continue;
            end;

            Lines.Add('');
            MontaCabecalho(Query1.FieldByName('Ck_grupo').AsString);
            Lines.add('');

            with Query2 do
            begin
              Sql.Clear;
              Sql.Add('Select * from CheckCheckRet');
              sql.add('Where Ck_Grupo = '''+Query1.FieldByName('Ck_grupo').AsString+'''');
              sql.add('And   Ck_Exibe = ''SIM''');
              sql.add('Order By Ck_Pos');
              Open;
            end;

            ind := 0;
            i   := LikeStrings(FClassCheckCheck.FCampo,Query1.FieldByName('Ck_Grupo').AsString+'*');
            FirstCampo := '';
            FLinha := 0;
            while (FClassCheckCheck.FCampo.Count > Ind + I) and (Copy(FClassCheckCheck.FCampo[Ind + LikeStrings(FClassCheckCheck.FCampo,Query1.FieldByName('Ck_Grupo').AsString+'*')],1,4) = Query1.FieldByName('Ck_Grupo').AsString+'*') do
            begin
              query2.first;
              FValor := FClassCheckCheck.RetornaTitulo(Query1.FieldByName('Ck_Grupo').AsString,Ind);

              F := FClassCheckCheck.RetornaTitulo(Query1.FieldByName('Ck_Grupo').AsString,IND);
              if not Query2.Locate('CK_CAMPO',F,[])  then
              begin
                Inc(Ind);
                Continue;
              end;

              if gruporeg(Query1.FieldByName('Ck_Grupo').AsString) then
                if firstcampo = '' then
                  FirstCampo := FValor
                else
                if (Fvalor <> '') and (FirstCampo = FValor) then
                begin
                  Lines.Add('');
                  Inc(FLinha);
                end;

              fvalor := FClassCheckCheck.RetornaValor(Query1.FieldByName('Ck_Grupo').AsString,Query2.FieldByName('Ck_Campo').AsString,Flinha);
              if gruporeg(Query1.FieldByName('Ck_Grupo').AsString) then
              begin
                if (Query2.FieldByName('Ck_Alinhamento').AsString = 'Direita') then
                begin
                  try
                    FValor := formatfloat('#,##0.00',StrtofloatN(FValor));
                  except
                   //
                  end;
                  Lines[Lines.Count - 1] := Lines[Lines.Count - 1] +iifs(Lines[Lines.Count - 1] <> '',' ','') +PadL(FValor,Query2.FieldByName('Ck_Tam').AsInteger,' ');
                end
                else
                  Lines[Lines.Count - 1] := Lines[Lines.Count - 1] +iifs(Lines[Lines.Count - 1] <> '',' ','') + PadR(FValor,Query2.FieldByName('Ck_Tam').AsInteger,' ');
              end
              else
                Lines.Add(copy(PadR(RetornaNomeGrupoCheckCheck(Query1.FieldByName('Ck_Grupo').AsString,Query2.FieldByName('Ck_Campo').AsString),37,'.'),1,37)+': '+FValor);

              ind := ind + 1;
//              Fmemo.Lines.Add('');
            end;
            oldgrupo := Query1.FieldByName('Ck_grupo').AsString;
            if ind > 1 then
              Fmemo.lines.Add(stringofchar('-',500));
          end;
          Query1.Next;
        end;

        TabSheet3.TabVisible := true;
        TabSheet2.TabVisible := true;



        FFocu := false;
        FList := TList.Create;
        try
          pagecontrol2.GetTabOrderList(FList);
          for i:=0 to flist.count - 1 do
            if (TWinControl(FLIst[i]) is TMemo) and
              (TMemo(FLIst[i]).Parent is TTabSheet) then
              if (Trim(TMemo(FLIst[i]).Text) = '') then
                TTabSheet(TMemo(FLIst[i]).Parent).TabVisible := false
              else
              if not ffocu then
              begin
                PageControl2.ActivePage := TTabSheet(TMemo(FLIst[i]).Parent);
{                 HabilitaTabSheets(TMemo(FLIst[i]));
                 TMemo(FLIst[i]).SetFocus;}
                FFocu := true;
              end;

        finally
          Flist.destroy;
        end;

        if LikeStrings(FClassCheckCheck.Fgrupo,'NCO0') > -1   then
        begin
          if Query1.FieldByName('Ck_Bloq').AsString = 'T' then
            LbCheckCheck.Color   := Clred;
          PiscaLabel1.Caption := 'Cliente com pendencias financeira';
          LbCheckCheck.Caption := 'Cliente com pendencias financeira de acordo com a CheckCheck';
        end
        else
        if LikeStrings(FClassCheckCheck.Fgrupo,'NCO1') > -1   then
        begin
          LbCheckCheck.Color   := ClYellow;
          if Query1.FieldByName('Ck_Bloq').AsString = 'T' then
            PiscaLabel1.Caption := 'Cliente com observações,mas sem pendencias financeiras';
          LbCheckCheck.Caption := 'Cliente com observações,mas sem pendencias financeiras de acordo com a CheckCheck';
        end
        else
        begin
          LbCheckCheck.Color   := Clgreen;
          if Query1.FieldByName('Ck_Bloq').AsString = 'T' then
            PiscaLabel1.Caption := 'Cliente OK';
          LbCheckCheck.Caption := 'Cliente OK de acordo com a CheckCheck';
        end;
        LbCheckCheck.Visible := ((Query1.FieldByName('Ck_Bloq').AsString <> 'T') and (Query1.FieldByName('Ck_Bloq').AsString <> 'S'));
        HabilitaTabSheets(TMemo(pagecontrol2.ActivePage.Controls[0]));
        TMemo(pagecontrol2.ActivePage.Controls[0]).SetFocus;
        Obs.Lines.Clear;
        FSenha := false;
        if (Query1.FieldByName('Ck_Bloq').AsString <> 'T') and (Query1.FieldByName('Ck_Bloq').AsString <> 'S') then
        begin
          obs.font.color := clred;
          with TQuery.Create(Application) do
            try
              databasename := query1.databasename;
              Sql.Clear;
              Sql.Add('Select Ck_Grupo,Min(Ck_Trava) as Ck_Trava from CheckCheckRet');
              sql.add('Where (Ck_Trava = ''Sim'') or (Ck_Trava = ''Senha'') ');
              sql.add('Group By Ck_Grupo ');
              Open;

              while not Eof do
              begin
                fgrupo := FieldByName('Ck_Grupo').AsString;
                if (FClassCheckCheck.FGrupo.indexof(Fgrupo) >= 0) then
                begin
                  Obs.Lines.Add(LinhaObs(FieldByName('Ck_Grupo').AsString));
                  FSenha := FSenha or (FieldByName('Ck_Trava').AsString = 'Senha');
                end;
                Next;
              end;
            finally
              destroy;
            end;
        end
        else
        begin

          obs.font.color := LbCheckCheck.color;
          for i:=0 to Length(FgruposRest) - 1 do
            if (FClassCheckCheck.FGrupo.indexof(FgruposRest[i]) >= 0) then
            begin
              Obs.Lines.Add(LinhaObs(FgruposRest[i]));
              FSenha := FSenha or (Query1.FieldByName('Ck_Bloq').AsString = 'S');
            end;
        end;

        if not LbCheckCheck.Visible then
          PiscaLabel1.Color := LbCheckCheck.Color
        else
        if Obs.Lines.Text <> ''   then
        begin
          PiscaLabel1.Color   := Clred;
          PiscaLabel1.Caption := 'Cliente com pendencias financeira';
          LbCheckCheck.Color   := Clred;
          LbCheckCheck.Caption := 'Cliente com pendencias financeira';
        end
        else
        begin
          PiscaLabel1.Color   := Clgreen;
          PiscaLabel1.Caption := 'Cliente OK';
        end;

        with Query2 do
        begin
          Sql.Clear;
          Sql.Add('Select Ck_Valor from CheckCheck');
          sql.add('Where Ck_Consulta = '''+Copy(TBitBtn(Sender).Caption,4,length(TBitBtn(Sender).Caption))+'''');
          Open;
        end;


        with Query1 do
        begin
          sql.clear;
          sql.add('Insert Into CheckCheckMov');
          sql.add(' (  Ck_Loja,Ck_Consulta,Ck_Data,Ck_Hora,Ck_Numero,Ck_Cpf,Ck_Valor,Ck_Usuario,Ck_Bloq )  ');
          sql.add('Values(:Ck_Loja,:Ck_Consulta,:Ck_Data,:Ck_Hora,:Ck_Numero,:Ck_Cpf,:Ck_Valor,:Ck_Usuario,:Ck_Bloq )');
          ParamByName('Ck_Loja').AsFloat        :=  frm_principal.x_frente_loja;
          ParamByName('Ck_Consulta').AsString   := Copy(TBitBtn(Sender).Caption,4,length(TBitBtn(Sender).Caption));
          ParamByName('Ck_Data').AsDateTime     := StrtoDateN(FormatdateTime('dd/mm/yy',FHoraCons));
          ParamByName('Ck_Hora').AsDateTime     := FHoraCons;
          try
            ParamByName('Ck_Numero').AsFloat      := StrtoFloatN(FClassCheckCheck.retornaValor('CRE','COD_RESP'));
          except
            ParamByName('Ck_Numero').AsFloat      := 0;
          end;
          ParamByName('Ck_Cpf').AsString        := CnpjCpf.Text;
          ParamByName('Ck_Valor').AsFloat       := Query2.FieldByName('Ck_Valor').AsFloat;
          ParamByName('Ck_Usuario').AsString    := frm_principal.pnCaixaAtiva.caption;

          ParamByName('Ck_Bloq').AsString       := IIfs(PiscaLabel1.Color = clred,'S','N');
          execsql;
        end;


        Panel3.color := PiscaLabel1.Color;
        TabSheet3.TabVisible := Obs.Text <> '';
        if TabSheet3.TabVisible then
        begin
          HabilitaTabSheets(Obs);
          Obs.SetFocus;
        end;
        PiscaLabel1.Velocidad := 1000;
        Panel3.Visible        := true;
      end
      else
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem (' Falha no Login com a Check Check '
          ,'CheckCheck',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      end;
    end;
  finally
    Screen.Cursor := CrDefault;
  end;
end;

procedure TFrm_ConsCheckCheck.FormCreate(Sender: TObject);
begin
  FhoraCons := 0;
  piscalabel1.Visible   := false;
  piscalabel1.Velocidad := 0;

  TabSheet2.TabVisible  := false;
  TabSheet3.TabVisible  := false;

  FClassCheckCheck := TClassConsCheckCheck.Create;
  Pagecontrol1.activepageindex := 0;

  if frm_edtCliente <> nil then
    CnpjCpf.Text := frm_edtCliente.edtCpf.Text;
end;

procedure TFrm_ConsCheckCheck.CnpjCpfExit(Sender: TObject);
begin
  if not(Length(CnpjCpf.Text) in [11,14]) or
    ((Length(CnpjCpf.Text) = 11) and not CHEK_CPF(CnpjCpf.Text)) or
    ((Length(CnpjCpf.Text) = 14) and not CHEK_CGC(CnpjCpf.Text)) then
  begin
    frmDialogo.ExibirMensagem (' Cpf/Cnpj Inválido'
      ,'CheckCheck',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    CnpjCpf.SetFocus;
    exit;
  end;
end;

{ TClassConsCheckCheck }

constructor TClassConsCheckCheck.Create;
begin
  inherited Create;
  FRegistro := TStringList.create;
  FCampo    := TStringList.create;
  FGrupo    := TStringList.create;
end;

destructor TClassConsCheckCheck.Destroy;
begin
  FRegistro.Destroy;
  FCampo.Destroy;
  FGrupo.Destroy;
  inherited Destroy;
end;

function TClassConsCheckCheck.DivideBuffer(FBuffer: String): String;
var
  i:Integer;
  temchrreg,temchrcampo,temchrgrupo:Boolean;
begin
  TemChrReg   := false;
  TemChrCampo := false;
  TemChrGrupo := false;

  FRegistro.Clear;
  FCampo.Clear;
  FGrupo.Clear;
//  FCampo.Add('');
  Result := '';
  i := 1;
  while length(FBuffer) >= i do
  begin
    if (FBuffer[i] = '<') then
    begin
      FGrupo.Add(Copy(FBuffer,i + 1,3));
      Fcampo.Add(Fgrupo[FGrupo.count - 1]+'*');
      I := i + 4;
      if (FBuffer[i] = '|') then
        I := i + 1;
      continue;
    end
    else
    if (FBuffer[i] = '>') or (FBuffer[i] = ',') or (FBuffer[i] = '|') then
    begin
      if (FBuffer[i] <> '>') then
        Fcampo.Add(Fgrupo[FGrupo.count - 1]+'*');        
      inc(i);
      Continue;
    end;


    Fcampo[fcampo.Count - 1] := Fcampo[fcampo.Count - 1] + FBuffer[i];

    Inc(I);
  end;
  Result := FCampo.Text;
end;

function RetornaNomeGrupoCheckCheck(Grupo:String;Campo:String):String;
begin
  if Pos('.',Campo) > 0  then
    Campo := uppercase(tiraacento(copy(Campo,1,pos('.',campo) - 1)));

  Result := campo;

  if trim(campo) = '' then
  begin
    if uppercase(grupo) = 'LOI' then
      Result := 'Login'
    else
    if uppercase(grupo) = 'MSG' then
      Result := 'Mensagem de Propaganda'
    else
    if uppercase(grupo) = 'FRN' then
      Result := 'Dados da Franquia'
    else
    if uppercase(grupo) = 'LAS' then
      Result := 'Lista de serviços'
    else
    if uppercase(grupo) = 'ERR' then
      Result := 'Erros'
    else
    if uppercase(grupo) = 'FRN' then
      Result := 'Lista de consultas permitidas'
    else
    if uppercase(grupo) = 'FRN' then
      Result := 'Erro na Transação'
    else
    if uppercase(grupo) = 'NOM' then
      Result := 'Nomes relacionados ao CNPJ/CPF'
    else
    if uppercase(grupo) = 'CFM' then
      Result := 'Confirmação de Nome na Receita Federal'
    else
    if uppercase(grupo) = 'BCO' then
      Result := 'Situação do Banco perante ao CCO'
    else
    if uppercase(grupo) = 'AGE' then
      Result := 'Endereço de agência bancária'
    else
    if uppercase(grupo) = 'RCH' then
      Result := 'Recheque online'
    else
    if uppercase(grupo) = 'CFV' then
      Result := 'Cheques sem fundos varejo'
    else
    if uppercase(grupo) = 'PVJ' then
      Result := 'Pendências internas no varejo'
    else
    if uppercase(grupo) = 'NCO' then
      Result := 'Consta alguma restrição'
    else
    if uppercase(grupo) = 'NC1' then
      Result := 'Nada Consta'
    else
    if uppercase(grupo) = 'NC2' then
      Result := 'Constam somente informações complementares'
    else
    if uppercase(grupo) = 'CCF' then
      Result := 'Cheques sem Fundos'
    else
    if uppercase(grupo) = 'RCO' then
      Result := 'Restrições Comerciais.'
    else
    if uppercase(grupo) = 'TLB' then
      Result := 'Telebloqueio para o cheque consultado'
    else
    if uppercase(grupo) = 'TBC' then
      Result := 'Telebloqueio para outros cheques não consultados'
    else
    if uppercase(grupo) = 'PLU' then
      Result := 'Cheques Contra Ordenados'
    else
    if uppercase(grupo) = 'SEM' then
      Result := 'Cheques Contra Ordenados com dados semelhantes'
    else
    if uppercase(grupo) = 'CHI' then
      Result := 'Cheques Irregulares'
    else
    if uppercase(grupo) = 'PRT' then
      Result := 'Protestos'
    else
    if uppercase(grupo) = 'ACO' then
      Result := 'Ações'
    else
    if uppercase(grupo) = 'FAL' then
      Result := 'Falências'
    else
    if uppercase(grupo) = 'RFN' then
      Result := 'Refinanciamentos'
    else
    if uppercase(grupo) = 'CTM' then
      Result := 'Contumácia de Cheques contra-ordenados'
    else
    if uppercase(grupo) = 'PFN' then
      Result := 'Pendências Financeiras'
    else
    if uppercase(grupo) = 'INS' then
      Result := 'Insucessos Empresariais'
    else
    if uppercase(grupo) = 'TEL' then
      Result := 'Telefones Confirmados'
    else
    if uppercase(grupo) = 'VCL' then
      Result := 'Veiculos Retornados'
    else
    if uppercase(grupo) = 'CRE' then
      Result := 'Código da Resposta'
    else
    if uppercase(grupo) = 'DHC' then
      Result := 'Data e Hora da consulta'
    else
    if uppercase(grupo) = 'RST' then
      Result := 'Histórico das últimas consultas';
    exit;  
  end;

  if uppercase(grupo) = 'LOI' then
  begin
    if campo = 'STATUS_LOGIN' then
      result := 'Status do Login'
    else
    if campo = 'COD_RESP' then
      Result := 'Código de Resposta do Login'
    else
    if campo = 'MENS' then
      Result := 'Mensagem de Resposta do Login'
    else
    if campo = 'CNPJ' then
      Result := 'CNPJ da Empresa'
    else
    if campo = 'NOME' then
      Result := 'Nome Fantasia'
    else
    if campo = 'RAZAO' then
      Result := 'Razão Social'
    else
    if campo = 'END' then
      Result := 'Endereço'
    else
    if campo = 'BAIRRO' then
      Result := 'Bairro'
    else
    if campo = 'CIDADE' then
      Result := 'Cidade'
    else
    if campo = 'UF' then
      Result := 'UF'
    else
    if campo = 'CEP' then
      Result := 'Cep'
    else
    if campo = 'EMAIL' then
      Result := 'Email'
    else
    if campo = 'FONE' then
      Result := 'Fone'
    else
    if campo = 'FRANQ' then
      Result := 'Franquia'
    else
    if campo = 'USO_CMC7' then
      Result := 'Usa CMC7'
    else
    if campo = 'TIME_CONS' then
      Result := 'TimeOut de Consultas'
    else
    if campo = 'TIME_LOGIN' then
      Result := 'TimeOut de LOGIN';
  end
  else
  if uppercase(grupo) = 'MSG' then
  begin
    if campo = 'TIPO_MSG' then
      result := 'Tipo de mensagem'
    else
    if campo = 'MENSAGEM' then
      Result := 'Mensagem';
  end
  else
  if uppercase(grupo) = 'FRN' then
  begin
    if campo = 'frn_cod' then
      result := 'Codigo'
    else
    if campo = 'FRN_RSO' then
      Result := 'Razão Social'
    else
    if campo = 'FRN_TEL' then
      Result := 'Tel'
    else
    if campo = 'FRN_FAX' then
      Result := 'Fax'
    else
    if campo = 'FRN_END' then
      Result := 'Endereço'
    else
    if campo = 'FRN_BAI' then
      Result := 'Bairro'
    else
    if campo = 'FRN_CID' then
      Result := 'Cidade'
    else
    if campo = 'FRN_UF' then
      Result := 'UF'
    else
    if campo = 'FRN_CEP' then
      Result := 'Cep'
    else
    if campo = 'FRN_EMAIL' then
      Result := 'Email';
  end
  else
  if uppercase(grupo) = 'LAS' then
  begin
    if campo = 'PCF_FAIXA' then
      result := 'Perfil'
    else
    if campo = 'COD_SRV' then
      Result := 'Codigo'
    else
    if campo = 'SRV_DEF' then
      Result := 'Default'
    else
    if campo = 'VAL_MIN' then
      Result := 'Min'
    else
    if campo = 'VAL_MAX' then
      Result := 'Max';
  end
  else
  if uppercase(grupo) = 'ERR' then
  begin
    if campo = 'NIV_ERRO' then
      result := 'Nível'
    else
    if campo = 'MSG_COD_ERR' then
      Result := 'Mensagem';
  end
  else
  if uppercase(grupo) = 'NOM' then
  begin
    if campo = 'NOME' then
      result := 'Nome';
  end
  else
  if uppercase(grupo) = 'CFM' then
  begin
    if campo = 'NOME' then
      result := 'Nome'
    else
    if campo = 'DATANASC' then
      Result := 'Data de Nascimento'
    else
    if campo = 'SITREC' then
      Result := 'Sit. Cpf/Cnpj'
    else
    if campo = 'DATAAT' then
      Result := 'Atualização'
    else
    if campo = 'NOMEMAE' then
      Result := 'Nome da Mae';
  end
  else
  if uppercase(grupo) = 'BCO' then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if campo = 'NOME' then
      Result := 'Nome'
    else
    if campo = 'DESCRICAO' then
      Result := 'Descrição';
  end
  else
  if uppercase(grupo) = 'AGE' then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if campo = 'NOME' then
      Result := 'Nome'
    else
    if campo = 'END' then
      Result := 'Endereço'
    else
    if campo = 'CIDADE' then
      Result := 'Cidade'
    else
    if campo = 'UF' then
      Result := 'UF'
    else
    if campo = 'DATAULTATUALIZACAO' then
      Result := 'Atualização'
    else
    if campo = 'DDD' then
      Result := 'DDD'
    else
    if campo = 'FONE' then
      Result := 'FONE'
    else
    if campo = 'DDDFAX' then
      Result := 'DDDFAX'
    else
    if campo = 'FAX' then
      Result := 'FAX'
  end
  else
  if uppercase(grupo) = 'RCH' then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'SIT' then
      result := 'Rec'
    else
    if result = 'DATAABERTENCERR' then
      result := 'Abertura/Encerramento'
    else
    if result = 'TIPOPESSOA' then
      result := 'Pessoa'
    else
    if result = 'CPFCNPJ' then
      result := 'Cpf/Cnpj'
    else
    if result = 'NOME' then
      result := 'Nome'
    else
    if result = 'TIPODOC' then
      result := 'Tipo Doc.'
    else
    if result = 'DOC' then
      result := 'Nº'
    else
    if result = 'EMISSOR' then
      result := 'Og.Emissor'
    else
    if result = 'UF' then
      result := 'UF'
    else
    if result = 'DATAEMISSAO' then
      result := 'Emissao';
  end
  else
  if uppercase(grupo) = 'CFV' then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DATAREC' then
      result := 'Data'
    else
    if result = 'CODCOMP' then
      result := 'Cod.Compensação'
    else
    if result = 'NOME' then
      result := 'Nome'
    else
    if result = 'NUMOC' then
      result := 'Nº Ocorrencia'
    else
    if result = 'ORIGEM' then
      result := 'Origem'
    else
    if result = 'SIGLA' then
      result := 'Sigla/Embratel'
    else
    if result = 'NUMLOJA' then
      result := 'Nº da Loja';
  end
  else
  if uppercase(grupo) = 'PVJ' then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DATAREC' then
      result := 'Data'
    else
    if result = 'CODCOMP' then
      result := 'Cod.Compensação'
    else
    if result = 'NOME' then
      result := 'Nome'
    else
    if result = 'NUMOC' then
      result := 'Nº Ocorrencia'
    else
    if result = 'ORIGEM' then
      result := 'Origem'
    else
    if result = 'SIGLA' then
      result := 'Sigla/Embratel'
    else
    if result = 'NUMLOJA' then
      result := 'Nº da Loja';
  end
  else
  if uppercase(grupo) = 'CCF' then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DATA_ANT' then
      result := 'Data do primeiro cheque'
    else
    if result = 'DATA_REC' then
      result := 'Data do cheque mais recente'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'NOM_BNC' then
      result := 'Nome'
    else
    if result = 'COD_AGE' then
      result := 'Agencia'
    else
    if result = 'NOM_AGE' then
      result := 'Nome'
    else
    if result = 'DATA_INC_REC' then
      result := 'Data Inc.'
    else
    if result = 'DATA_PROC_PRI_INC' then
      result := 'Data Primeiro Proc'
    else
    if result = 'TIP_PES_ASSOC' then
      result := 'Pessoa'
    else
    if result = 'ALN_BNC' then
      result := 'Alinea do Banco'
  end
  else
  if uppercase(grupo) = 'RCO' then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'EMP_NOM' then
      result := 'Empresa'
    else
    if result = 'EMP_TEL' then
      result := 'Telefone'
    else
    if result = 'DAT_DEB' then
      result := 'Ocorrencia'
    else
    if result = 'DAT_INC' then
      result := 'Inclusão'
    else
    if result = 'COD_MOT_INC' then
      result := 'Codigo Motivo'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'COD_AGE' then
      result := 'Age'
    else
    if result = 'NUM_CHQ' then
      result := 'Cheque'
    else
    if result = 'ALN' then
      result := 'Alinea'
    else
    if result = 'NUM_PARC' then
      result := 'Nº Parcelas '
    else
    if result = 'TOT_PARC' then
      result := 'Total '
    else
    if result = 'NUM_MEM' then
      result := 'Mensalidades'
    else
    if result = 'NUM_DUP' then
      result := 'Duplicatas'
    else
    if result = 'EMP_UF' then
      result := 'Uf'
    else
    if result = 'MOT_INC_CLI' then
      result := 'Motivo'
    else
    if result = 'EMP_RAZ' then
      result := 'Empresa'
    else
    if result = 'CNPJ' then
      result := 'CNPJ'
    else
    if result = 'TIP_PES' then
      result := 'Pessoa'
    else
    if result = 'OCR_VAL' then
      result := 'Valor'
  end
  else
  if (uppercase(grupo) = 'TLB') or (uppercase(grupo) = 'TBC')  then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'NOM_BNC' then
      result := 'Nome'
    else
    if result = 'COD_AGE' then
      result := 'Age'
    else
    if result = 'NOM_AGE' then
      result := 'Nome'
    else
    if result = 'CNT_COR' then
      result := 'Conta'
    else
    if result = 'CHQ_INI' then
      result := 'Cheque Ini'
    else
    if result = 'CHQ_FIM' then
      result := 'Cheque Fim'
    else
    if result = 'MOTIV' then
      result := 'Motivo'
    else
    if result = 'DAT_REG' then
      result := 'Data'
    else
    if result = 'HORA' then
      result := 'Hora';
  end
  else
  if (uppercase(grupo) = 'PLU') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'NOM_BNC' then
      result := 'Nome'
    else
    if result = 'COD_AGE' then
      result := 'Age'
    else
    if result = 'NOM_AGE' then
      result := 'Nome'
    else
    if result = 'CNT_COR' then
      result := 'Conta'
    else
    if result = 'CHQ_INI' then
      result := 'Cheque Ini'
    else
    if result = 'CHQ_FIM' then
      result := 'Cheque Fim'
    else
    if result = 'DATA_CCO' then
      result := 'Data'
    else
    if result = 'TIP_CCO' then
      result := 'Tipo'
    else
    if result = 'HORA' then
      result := 'Hora'
    else
    if result = 'FONTE' then
      result := 'Fonte';
  end
  else
  if (uppercase(grupo) = 'CTM') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'NOM_BNC' then
      result := 'Nome'
    else
    if result = 'COD_AGE' then
      result := 'Age'
    else
    if result = 'NOM_AGE' then
      result := 'Nome'
    else
    if result = 'CNT_COR' then
      result := 'Conta'
    else
    if result = 'CHQ_INI' then
      result := 'Cheque Ini'
    else
    if result = 'CHQ_FIM' then
      result := 'Cheque Fim'
    else
    if result = 'TIP_CCO' then
      result := 'Tipo'
    else
    if result = 'DATA_CCO' then
      result := 'Data'
    else
    if result = 'FONTE' then
      result := 'Fonte';
  end
  else
  if (uppercase(grupo) = 'SEM') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'NOM_BNC' then
      result := 'Nome'
    else
    if result = 'COD_AGE' then
      result := 'Age'
    else
    if result = 'NOM_AGE' then
      result := 'Nome'
    else
    if result = 'CNT_COR' then
      result := 'Conta'
    else
    if result = 'CHQ_INI' then
      result := 'Cheque Ini'
    else
    if result = 'CHQ_FIM' then
      result := 'Cheque Fim'
    else
    if result = 'TIP_CCO' then
      result := 'Tipo'
    else
    if result = 'DATA_CCO' then
      result := 'Data'
    else
    if result = 'FONTE' then
      result := 'Fonte'
    else
    if result = 'HORA' then
      result := 'Hora'
    else
    if result = 'DOC_ORI' then
      result := 'Doc';
  end
  else
  if (uppercase(grupo) = 'PFN') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DAT_ANT' then
      result := 'Data da 1ª Pend'
    else
    if result = 'DAT_REC' then
      result := 'Data da Ult. Pend'
    else
    if result = 'PFN_DATA' then
      result := 'Data'
    else
    if result = 'PFN_MOD' then
      result := 'Modalidade'
    else
    if result = 'AVAL' then
      result := 'Avalista'
    else
    if result = 'TIPO_MOEDA' then
      result := 'Moeda'
    else
    if result = 'PFN_VAL' then
      result := 'Valor'
    else
    if result = 'CONTR' then
      result := 'Contrato'
    else
    if result = 'PFN_ORI' then
      result := 'Origem'
    else
    if result = 'SIGLA' then
      result := 'Sigla'
  end
  else
  if (uppercase(grupo) = 'RFN') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DAT_ANT' then
      result := 'Data da 1ª Pend'
    else
    if result = 'DAT_REC' then
      result := 'Data da Ult. Pend'
    else
    if result = 'RFN_DATA' then
      result := 'Data'
    else
    if result = 'RFN_NAT' then
      result := 'Natureza'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'COD_AGE' then
      result := 'Age'
    else
    if result = 'RFN_VAL' then
      result := 'Valor'
    else
    if result = 'UF' then
      result := 'UF'
    else
    if result = 'NOM_BNC' then
      result := 'Nome Banco'
    else
    if result = 'CID' then
      result := 'Cidade'
    else
    if result = 'AVAL' then
      result := 'Avalista';
  end
  else
  if (uppercase(grupo) = 'CHI') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'COD_BNC' then
      result := 'Banco'
    else
    if result = 'NOM_BNC' then
      result := 'Nome'
    else
    if result = 'COD_AGE' then
      result := 'Age'
    else
    if result = 'NOM_AGE' then
      result := 'Nome'
    else
    if result = 'CNT_COR' then
      result := 'Conta'
    else
    if result = 'NUM_CHQ' then
      result := 'Cheque'
    else
    if result = 'ALN' then
      result := 'Aline'
    else
    if result = 'CHQ_VAL' then
      result := 'Valor'
    else
    if result = 'CID' then
      result := 'Cidade'
    else
    if result = 'UF' then
      result := 'UF';
  end
  else
  if (uppercase(grupo) = 'INS') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DAT_ANT' then
      result := 'Data da 1ª Ins'
    else
    if result = 'DAT_REC' then
      result := 'Data da Ult. Ins'
    else
    if result = 'INS_DATA' then
      result := 'Data'
    else
    if result = 'INS_QLF' then
      result := 'Qualf.'
    else
    if result = 'INS_VAR' then
      result := 'Vara'
    else
    if result = 'NOM_PES' then
      result := 'Nome';
  end
  else
  if (uppercase(grupo) = 'PRT') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DAT_ANT' then
      result := 'Data da 1º Prt'
    else
    if result = 'DAT_REC' then
      result := 'Data da Ult. Prt'
    else
    if result = 'PRT_DATA' then
      result := 'Data'
    else
    if result = 'COD_CART' then
      result := 'Cartório'
    else
    if result = 'PRT_NAT' then
      result := 'Natureza'
    else
    if result = 'PRT_VAL' then
      result := 'Valor'
    else
    if result = 'CID' then
      result := 'Cidade'
    else
    if result = 'UF' then
      result := 'UF';
  end
  else
  if (uppercase(grupo) = 'ACO') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DAT_ANT' then
      result := 'Data da 1º Ação'
    else
    if result = 'DAT_REC' then
      result := 'Data da 2ª Ação'
    else
    if result = 'ACO_DAT' then
      result := 'Data'
    else
    if result = 'COD_VAR' then
      result := 'Vara'
    else
    if result = 'COD_DIST' then
      result := 'Distribuidor'
    else
    if result = 'ACO_NATU' then
      result := 'Natureza'
    else
    if result = 'ACO_VAL' then
      result := 'Valor'
    else
    if result = 'CID' then
      result := 'Cidade'
    else
    if result = 'UF' then
      result := 'UF'
    else
    if result = 'PRI_COO' then
      result := 'Status';
  end
  else
  if (uppercase(grupo) = 'FAL') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DAT_ANT' then
      result := 'Data da 1ª Fal'
    else
    if result = 'DAT_REC' then
      result := 'Data da Ult Fal'
    else
    if result = 'FAL_DAT' then
      result := 'Data'
    else
    if result = 'FAL_VAR' then
      result := 'Vara'
    else
    if result = 'FAL_NATU' then
      result := 'Natureza'
    else
    if result = 'CID' then
      result := 'Cidade'
    else
    if result = 'UF' then
      result := 'UF';
  end
  else
  if (uppercase(grupo) = 'TEL') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'INFO' then
      result := 'Info'
    else
    if result = 'NOME' then
      result := 'Nome'
    else
    if result = 'TIP_PES' then
      result := 'Pessoa'
    else
    if result = 'CPF_CNPJ' then
      result := 'Cpf/Cnpj'
    else
    if result = 'END' then
      result := 'Endereço'
    else
    if result = 'BAI' then
      result := 'Bairro'
    else
    if result = 'CID' then
      result := 'Cidade'
    else
    if result = 'UF' then
      result := 'UF'
    else
    if result = 'CEP' then
      result := 'CEP'
    else
    if result = 'DDD' then
      result := 'DDD'
    else
    if result = 'FONE' then
      result := 'FONE';
  end
  else
  if (uppercase(grupo) = 'VCL') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'RENAVAM' then
      result := 'Renavam'
    else
    if result = 'PLACA' then
      result := 'Placa'
    else
    if result = 'UF' then
      result := 'UF'
    else
    if result = 'CHASSI' then
      result := 'Chassi'
    else
    if result = 'CIDADE' then
      result := 'Cidade'
    else
    if result = 'TIP_MONT' then
      result := 'Montagem'
    else
    if result = 'TIP_VEIC' then
      result := 'Tipo'
    else
    if result = 'MARCA' then
      result := 'Marca'
    else
    if result = 'ESPECIE' then
      result := 'Especie'
    else
    if result = 'SITUACAO' then
      result := 'Situação'
    else
    if result = 'COR' then
      result := 'Cor'
    else
    if result = 'ANO' then
      result := 'Ano'
    else
    if result = 'COMBUSTIVEL' then
      result := 'Combustivel'
    else
    if result = 'PROCED' then
      result := 'Procedencia'
    else
    if result = 'TIP_DOC_PROP' then
      result := 'PESSOA'
    else
    if result = 'DOC_PROP' then
      result := 'Cpf/Cnpj Propietario'
    else
    if result = 'NOME_PROP' then
      result := 'Propietario'
    else
    if result = 'DATA_ULT_ATUA' then
      result := 'Atualização'
    else
    if result = 'CILIND' then
      result := 'Cilindradas'
    else
    if result = 'POTENCIA' then
      result := 'Potencia'
    else
    if result = 'MOTOR' then
      result := 'Motor'
    else
    if result = 'QTD_EIXOS' then
      result := 'Eixos'
    else
    if result = 'REST1' then
      result := 'Arrendamento'
    else
    if result = 'REST2' then
      result := 'Alienação'
    else
    if result = 'REST3' then
      result := 'Roubo'
    else
    if result = 'REST4' then
      result := 'Judicial'
    else
    if result = 'MAX_PASS' then
      result := 'Passageiros'
    else
    if result = 'PESO_BRUTO' then
      result := 'Peso'
    else
    if result = 'ANO_FAB' then
      result := 'Ano'
    else
    if result = 'TIP_CHASSI' then
      result := 'Tipo chassi'
    else
    if result = 'REST5' then
      result := 'Administrativas'
    else
    if result = 'REST6' then
      result := 'Reserva Dominio'
    else
    if result = 'REST7' then
      result := 'Tributarias'
  end
  else
  if (uppercase(grupo) = 'RST') then
  begin
    if campo = 'QUANT' then
      result := 'Quant'
    else
    if result = 'DATA' then
      result := 'Data'
    else
    if result = 'RAZAO' then
      result := 'Razao'
    else
    if result = 'TIP_PES' then
      result := 'Pessoa'
    else
    if result = 'CPF_CNPJ' then
      result := 'Cpf/Cnpj'
    else
    if result = 'CIDADE' then
      result := 'Cidade'
    else
    if result = 'UF' then
      result := 'UF'
    else
    if result = 'FONE' then
      result := 'FONE'
    else
    if result = 'NOME' then
      result := 'Nome';
  end
  else
  if (uppercase(grupo) = 'DHC') then
    result := 'Data/Hora Consulta'
  else
  if (uppercase(grupo) = 'CRE') then
    result := 'Numero Consulta';
end;

function TClassConsCheckCheck.RetornaTitulo(Grupo: String;
  Campo: Integer;CAMPOSTR:String='';SemQuant:Boolean=true): String;
var
  Ftit:String;
  i2:Integer;

  function acertaretornosarray(campos:array of String;reg:Integer):String;
  var
    i2,i:Integer;
    FInd:Integer;
  begin
{      if reg <= lengtH(campos)   then
        result := campos[reg - 1]+'.1'
      else
        result := campos[(reg mod length(Campos)) - 1]+'.'+inttostr(reg div length(campos) + 1);}
    Result := '';  
    if reg <= lengtH(campos)   then
      result := campos[reg - 1]
    else
    begin
      if (reg mod length(Campos)) = 0 then
        FInd := Length(Campos) - 1
      else
        FInd := reg mod length(Campos) - 1;
      result := campos[Find];
    end;
  end;

begin
  try
    result := '';

    if (campostr <> '') then
    begin
      ftit := '';
      i2 := 0;
      repeat
        Ftit := uppercase(RetornaTitulo(Grupo,i2));
        if Ftit = uppercase(CampoStr) then
          break;
        i2 := i2 + 1;
      until
        (FTit = '');

      if (FTit = '') then
        exit;
      campo := i2; 
    end;


    if campo < 0 then
    begin
      if uppercase(grupo) = 'LOI' then
        Result := 'Login'
      else
      if uppercase(grupo) = 'MSG' then
        Result := 'Mensagem de Propaganda'
      else
      if uppercase(grupo) = 'FRN' then
        Result := 'Dados da Franquia'
      else
      if uppercase(grupo) = 'FRN' then
        Result := 'Lista de consultas permitidas'
      else
      if uppercase(grupo) = 'FRN' then
        Result := 'Erro na Transação'
      else
      if uppercase(grupo) = 'NOM' then
        Result := 'Nomes relacionados ao CNPJ/CPF'
      else
      if uppercase(grupo) = 'CFM' then
        Result := 'Confirmação de Nome na Receita Federal'
      else
      if uppercase(grupo) = 'NCO' then
        Result := 'Consta alguma restrição'
      else
      if uppercase(grupo) = 'NC1' then
        Result := 'Nada Consta'
      else
      if uppercase(grupo) = 'NC2' then
        Result := 'Constam somente informações complementares'
      else
      if uppercase(grupo) = 'CCF' then
        Result := 'Cheques sem Fundos'
      else
      if uppercase(grupo) = 'RCO' then
        Result := 'Restrições Comerciais.'
      else
      if uppercase(grupo) = 'TLB' then
        Result := 'Telebloqueio para o cheque consultado'
      else
      if uppercase(grupo) = 'TBC' then
        Result := 'Telebloqueio para outros cheques não consultados'
      else
      if uppercase(grupo) = 'PLU' then
        Result := 'Cheques Contra Ordenados'
      else
      if uppercase(grupo) = 'SEM' then
        Result := 'Cheques Contra Ordenados com dados semelhantes'
      else
      if uppercase(grupo) = 'CHI' then
        Result := 'Cheques Irregulares'
      else
      if uppercase(grupo) = 'PRT' then
        Result := 'Protestos'
      else
      if uppercase(grupo) = 'ACO' then
        Result := 'Ações'
      else
      if uppercase(grupo) = 'FAL' then
        Result := 'Falências'
      else
      if uppercase(grupo) = 'RFN' then
        Result := 'Refinanciamentos'
      else
      if uppercase(grupo) = 'CTM' then
        Result := 'Contumácia de Cheques contra-ordenados'
      else
      if uppercase(grupo) = 'PFN' then
        Result := 'Pendências Financeiras'
      else
      if uppercase(grupo) = 'INS' then
        Result := 'Insucessos Empresariais'
      else
      if uppercase(grupo) = 'TEL' then
        Result := 'Telefones Confirmados'
      else
      if uppercase(grupo) = 'VCL' then
        Result := 'Veiculos Retornados'
      else
      if uppercase(grupo) = 'CRE' then
        Result := 'Código da Resposta'
      else
      if uppercase(grupo) = 'DHC' then
        Result := 'Data e Hora da consulta'
      else
      if uppercase(grupo) = 'RST' then
        Result := 'Histórico das últimas consultas';
    end
    else
    begin
      if uppercase(grupo) = 'LOI' then
        case campo of
          0:Result := 'STATUS_LOGIN';
          1:Result := 'cod_resp';
          2:Result := 'mens';
          3:Result := 'cnpj';
          4:Result := 'nome';
          5:Result := 'razao';
          6:Result := 'end';
          7:Result := 'bairro';
          8:Result := 'cidade';
          9:Result := 'uf';
          10:Result := 'cep';
          11:Result := 'email';
          12:Result := 'fone';
          13:Result := 'franq';
          14:Result := 'perfil';
          15:Result := 'uso_cmc7';
          16:Result := 'time_cons';
          17:Result := 'time_login';
        end
      else
      if uppercase(grupo) = 'MSG' then
        case campo of
          0:Result := 'tipo_msg';
          1:Result := 'mensagem';
        end
      else
      if uppercase(grupo) = 'LOI' then
        case campo of
          0:Result := 'STATUS_LOGIN';
          1:Result := 'cod_resp';
          2:Result := 'mens';
          3:Result := 'cnpj';
          4:Result := 'nome';
          5:Result := 'razao';
          6:Result := 'end';
          7:Result := 'bairro';
          8:Result := 'cidade';
          9:Result := 'uf';
          10:Result := 'cep';
          11:Result := 'email';
          12:Result := 'fone';
          13:Result := 'franq';
          14:Result := 'perfil';
          15:Result := 'uso_cmc7';
          16:Result := 'time_cons';
          17:Result := 'time_login';
        end
      else
      if uppercase(grupo) = 'FRN' then
        case campo of
          0:Result := 'frn_cod';
          1:Result := 'frn_rso';
          2:Result := 'frn_tel';
          3:Result := 'frn_fax';
          4:Result := 'frn_end';
          5:Result := 'frn_bai';
          6:Result := 'frn_cid';
          7:Result := 'frn_uf';
          8:Result := 'frn_cep';
          9:Result := 'frn_email';
        end
      else
      if uppercase(grupo) = 'LAS' then
        case campo of
          0:Result := 'pfc_faixa';
        end
      else
      if uppercase(grupo) = 'ERR' then
        case campo of
          0:Result := 'niv_err';
          1:Result := 'msg_cod_err';
        end
      else
      if uppercase(grupo) = 'NOM' then
        case campo of
          0:Result := 'quant'
        else Result  := 'Nome';
        end
      else
      if uppercase(grupo) = 'CFM' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['nome','DataNasc','SitRec','DataAt','NomeMae'],campo);
        end
      else
      if uppercase(grupo) = 'BCO' then
        case campo of
          0:Result := 'quant';
          1:Result := 'nome';
          2:Result := 'descricao';
        end
      else
      if uppercase(grupo) = 'AGE' then
        case campo of
          0:Result := 'quant';
          1:Result := 'nome';
          2:Result := 'end';
          3:Result := 'cidade';
          4:Result := 'uf';
          5:Result := 'dataultatualizacao';
          6:Result := 'ddd';
          7:Result := 'fone';
          8:Result := 'dddfax';
          9:Result := 'fax';
        end
      else
      if uppercase(grupo) = 'RCH' then
        case campo of
          0:Result := 'quant';
          1:Result := 'sit';
          2:Result := 'dataabertencerr';
          3:Result := 'tipopessoa';
          4:Result := 'cpfcnpj';
          5:Result := 'nome';
          6:Result := 'tipodoc';
          7:Result := 'doc';
          8:Result := 'emissor';
          9:Result := 'uf';
          10:Result := 'dataemissao';
        end
      else
      if uppercase(grupo) = 'CFV' then
        case campo of
          0:Result := 'quant';
          1:Result := 'datarec';
          2:Result := 'codComp';
          3:Result := 'nome';
          4:Result := 'numoc';
          5:Result := 'origem';
          6:Result := 'sigla';
          7:Result := 'numlj';
        end
      else
      if uppercase(grupo) = 'PVJ' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['DataAnt','Datarec','DataOc','Mod','Aval','Moeda','Valor'
            ,'Contr','Origem','Sigla','DataOc'],campo);
        end
      else
      if uppercase(grupo) = 'CCF' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['dat_ant','dat_rec','cod_bnc','nom_bnc','cod_age','nom_age'
            ,'dat_inc_rec','tot_ccf','dat_proc',
            'dat_inc_ant','dat_proc_pri_inc','cpf_cnpj_assoc',
            'tip_pes_assoc','aln_bnc'],campo);
        end
      else
      if uppercase(grupo) = 'RCO' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['emp_nom','emp_tel','dat_deb','dat_inc',
            'cod_mot_inc','ori_inc','cod_bnc','cod_age','num_chq','aln',
            'num_parc','tot_parc','num_men','num_dup','emp_uf','mot_inc_cli'
            ,'emp_raz','cnpj','tip_pes','ocr_val'],campo);
        end
      else
      if (uppercase(grupo) = 'TLB') or (uppercase(grupo) = 'TBC')  then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['emp_nom','emp_tel','dat_deb','dat_inc',
            'cod_mot_inc','ori_inc','cod_bnc','cod_age','num_chq','aln',
            'num_parc','tot_parc','num_men','num_dup','emp_uf','mot_inc_cli'
            ,'emp_raz','cnpj','tip_pes','ocr_val'],campo);
        end
      else
      if uppercase(grupo) = 'PLU' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['cod_bnc','nom_bnc','cod_age','nom_age',
            'cnt_cor','chq_ini','chq_fin','dat_cco','reserv1','tip_cco',
            'reserv2','hora','fonte'
            ],campo);
        end
      else
      if uppercase(grupo) = 'CTM' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['cod_bnc','nom_bnc','cod_age','nom_age',
            'cnt_cor','chq_ini','chq_fin','tip_cco','dat_cco','reserv1','fonte'
            ],campo);
        end
      else
      if uppercase(grupo) = 'SEM' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['cod_bnc','nom_bnc','cod_age','nom_age',
            'cnt_cor','chq_ini','chq_fin','dat_cco','reserv1','tip_cco',
            'reserv2','hora','fonte'],campo);
        end
      else
      if uppercase(grupo) = 'PFN' then
        case campo of
          0:Result := 'quant';
          1:Result := 'dat_ant';
          2:Result := 'dat_rec';
        else Result := acertaretornosarray(['pfn_dat','pfn_mod',
            'aval','tip_moeda','pfn_val','contr','pfn_ori','sigla'],campo);
        end
      else
      if uppercase(grupo) = 'RFN' then
        case campo of
          0:Result := 'quant';
          1:Result := 'dat_ant';
          2:Result := 'dat_rec';
        else Result := acertaretornosarray(['rfn_dat','rfn_nat',
            'cod_bnc','cod_age','rfn_val','sigla','uf','nom_bnc',
            'cid','cod_bcn_conv','aval'],campo);
        end
      else
      if uppercase(grupo) = 'CHI' then
        case campo of
          0:Result := 'quant';
          1:Result := 'dat_ant';
          2:Result := 'dat_rec';
        else Result := acertaretornosarray(['chi_dat','cod_bnc',
            'cod_age','cnt_cor','num_chq','aln','chq_val','cid','uf'],campo);
        end
      else
      if uppercase(grupo) = 'INS' then
        case campo of
          0:Result := 'quant';
          1:Result := 'dat_ant';
          2:Result := 'dat_rec';
        else Result := acertaretornosarray(['ins_dat','ins_nat','ins_qlf','ins_var','nom_pes'],campo);
        end
      else
      if uppercase(grupo) = 'PRT' then
        case campo of
          0:Result := 'quant';
          1:Result := 'dat_ant';
          2:Result := 'dat_rec';
        else Result := acertaretornosarray(['prt_dat','cod_cart','prt_nat','prt_val','cid','uf'],campo);
        end
      else
      if uppercase(grupo) = 'ACO' then
        case campo of
          0:Result := 'quant';
          1:Result := 'dat_ant';
          2:Result := 'dat_rec';
        else Result := acertaretornosarray(['aco_dat','cod_var','cod_dist','aco_nat','aco_val','cid','uf','pri_coo'],campo);
        end
      else
      if uppercase(grupo) = 'FAL' then
        case campo of
          0:Result := 'quant';
          1:Result := 'dat_ant';
          2:Result := 'dat_rec';
        else Result := acertaretornosarray(['fal_dat','fal_nat','fal_var','cid','uf'],campo);
        end
      else
      if uppercase(grupo) = 'TEL' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['info','nome','tip_pes','cpf_cnpj','end'
            ,'bai','cid','uf','cep','ddd','fone'],campo);
        end
      else
      if uppercase(grupo) = 'VCL' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['renavam','placa','uf','chassi','cidade','tip_mont',
            'tip_veic','marca','especie','situacao','cor','ano_mod','combust',
            'proced','tip_doc_prop','doc_prop','nome_prop','dat_ult_atu',
            'cilind','potencia','motor','qtd_eixos','rest1','rest2','rest3',
            'rest4','max_pass','peso_bruto','tip_doc_fat','doc_fat','nome_fat'
            ,'ano_fab','tip_chassi','cambio','rest5','rest6','rest7'],campo);
        end
      else
      if uppercase(grupo) = 'RST' then
        case campo of
          0:Result := 'quant';
        else Result := acertaretornosarray(['data','razao','cidade','uf','fone','nome'],campo);
        end
      else
      if uppercase(grupo) = 'DHC' then
        case campo of
          0:Result := 'dat_hor';
        end
      else
      if uppercase(grupo) = 'CRE' then
        case campo of
          0:Result := 'cod_resp';
        end;


      if trim(result) <> '' then {     If SemQuant  and (UpperCase(Result) = 'QUANT') then
       Result := RetornaTitulo(Grupo,Campo + 1);}
      else
        result := 'Campo '+InttoStr(Campo)+' do Grupo'+Grupo+' não encontrado';
    end;
  finally
    result := uppercase(result);
  end;

end;

function TClassConsCheckCheck.retornaValor(Grupo,Campo: String;Linha:Integer=0;Tratar:Boolean=true): String;
var
  Ind,i2,i:Integer;
  ftit:String;

begin
  result := '';
  I := LikeStrings(FCampo,Grupo+'*');
  ftit := '';

  Ind := 0;
  i2 := 0;
  repeat
    Ftit := uppercase(RetornaTitulo(Grupo,i2));
    if (Ftit = uppercase(Campo)) then
      if (Linha = 0) or (Ind = Linha) then 
        break
      else
        Inc(Ind);       
    i2 := i2 + 1;
  until
    (FTit = '');

  if (i < 0) or (I + I2 >= FCampo.Count) then
    exit;
  Result := Copy(FCampo[i + I2],5,Length(FCampo[i + I2]));
  if Result <> '' then
    if (grupo = 'DHC') and (UpperCase(campo) = 'DAT_HOR') then
      Result := Copy(Result,7,2)+'/'+Copy(Result,5,2)+'/'+Copy(Result,1,4)+' '+Copy(Result,9,2)+':'+Copy(Result,11,2)+':'+Copy(Result,13,2)
    else
    if (Pos('DAT_',UpperCase(Campo)) = 1) or (Pos('DATA',UpperCase(Campo)) = 1) then
      Result := Copy(Result,7,2)+'/'+Copy(Result,5,2)+'/'+Copy(Result,1,4)
    else
    if (Pos('CPF',UpperCase(Campo)) > 0) or  (Pos('CNPJ',UpperCase(Campo)) > 0) then
      if Length(TRIM(Result)) <= 11 then
        Result := FormatMaskText('999.999.999-99;0',Result)
      else
        Result := FormatMaskText('99.999.999/9999-99;0',Result);

end;

procedure TFrm_ConsCheckCheck.FormDestroy(Sender: TObject);
begin
  FClassCheckCheck.Destroy;
end;

procedure TFrm_ConsCheckCheck.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Flist:Tlist;
  i:Integer;  
begin
  if key  = vk_F5 then
    BConfirma.OnClick(BConfirma);
  if key  = vk_escape then
    close;
  if (Shift = [ssctrl]) and
    (key>=Ord('1')) and (key<=Ord('9')) then
  begin
    flist := TList.Create;
    Panel2.GetTabOrderList(FList);
    for i:=0 to FList.count - 1 do
      if (TWinControl(FList[i]) is TbitBtn) and (I = Key - Ord('1')) then
        FClickBotao(TBitBtn(FList[i]));
  end;
end;

procedure TFrm_ConsCheckCheck.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_ConsCheckCheck.BConfirmaClick(Sender: TObject);
begin
  if not bconfirma.visible then
    exit;

  if piscalabel1.visible and (piscalabel1.color <> clred) then
  begin
    BConfirma.ModalResult := MrOk;
    close;
    exit;
  end;

  if FSenha then
  begin
    frm_senha_checkcheck := tfrm_senha_checkcheck.create(application);
    try
      frm_senha_checkcheck.showmodal;
      if frm_senha_checkcheck.BtnAplicar.ModalResult = MrOk then
      begin
        BConfirma.ModalResult := MrOk;
        close;
        with Query1 do
        begin
          sql.clear;
          sql.add('Update CheckCheckMov Set Ck_Bloq = ''N'',Ck_Senha = ''S'',Ck_UsuSenha='''+frm_senha_checkcheck.ffunc+''' ');
          sql.add('Where Ck_Hora =:Ck_Hora');
          ParamByName('Ck_Hora').AsDateTime  := FHoraCons;
          execsql;
        end;
      end
      else
        close;
    finally
      frm_senha_checkcheck.Destroy;
    end;
  end
  else
    close;
end;

end.
