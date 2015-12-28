{**** Impressao do carnet a partir do cadastro do contrato *** - Usado no Frente de Loja}
unit unEmissCarnet2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Menus, Printers, Buttons, ComCtrls;

type
  Tfrm_EmisCarnet2 = class(TForm)
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtLocalPgto: TMaskEdit;
    edtObs1: TMaskEdit;
    edtObs2: TMaskEdit;
    chQualquerLoja: TCheckBox;
    GroupBox3: TGroupBox;
    chCarnet: TCheckBox;
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    btnConfere: TButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Label4: TLabel;
    edtContrato: TMaskEdit;
    edtCliente: TMaskEdit;
    barraImpressora: TStatusBar;
    timerImp: TTimer;
    btnConfImp: TSpeedButton;
    chEntrada: TCheckBox;
    Label22: TLabel;
    Label23: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtContratoEnter(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtLocalPgtoEnter(Sender: TObject);
    procedure edtLocalPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtObs1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtObs1Enter(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteExit(Sender: TObject);
    procedure edtContratoExit(Sender: TObject);
    procedure edtObs2Enter(Sender: TObject);
    procedure edtObs2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfImpClick(Sender: TObject);
    procedure timerImpTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer;
    procedure LimparEdits;
    procedure ImprimeCarnetGenerica;
    procedure ImprimeCarnetPadrao;
    procedure ImprimeCarnetJatoDeTinta;
  end;

var
  frm_EmisCarnet2: Tfrm_EmisCarnet2;

implementation

{$R *.DFM}

uses unDialogo, principal, F8Lojas, funcoes1, funcoes2, prestcontrato, cliente,
  unImpressoras, credito, contratos, loja, plano, DM4,
  un_CarnetJatoDeTinta2;

procedure Tfrm_EmisCarnet2.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_EmisCarnet2.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_EmisCarnet2.FormActivate(Sender: TObject);
begin
  if (edtCliente.canfocus) then
    edtCliente.setfocus
  else
    edtObs2.setfocus;

     {info. de impressora ativa}
  chCarnet.checked:=frm_principal.x_flag_carnet_juros;
  timerImp.enabled:=true;
  barraimpressora.panels[1].text:='Modo de impressão: [Texto]'
end;

procedure Tfrm_EmisCarnet2.edtContratoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_EmisCarnet2.edtClienteEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_EmisCarnet2.edtLocalPgtoEnter(Sender: TObject);
begin
  edtLocalPgto.selectall;
end;

procedure Tfrm_EmisCarnet2.edtLocalPgtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtObs1.setfocus;
  if (key=38) then
    if (edtContrato.canfocus) then
      edtContrato.setfocus;
end;

procedure Tfrm_EmisCarnet2.edtObs1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtObs2.setfocus;
  if (key=38) then
    edtLocalPgto.setfocus;
end;

procedure Tfrm_EmisCarnet2.edtObs1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_EmisCarnet2.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_EmisCarnet2.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtCliente.setfocus;
end;

procedure Tfrm_EmisCarnet2.LimparEdits;
begin
  edtContrato.text:='';
  edtCliente.text:='';
  edtLocalPgto.text:='';
  edtObs1.text:='';
  edtObs2.text:='';
  chQualquerLoja.checked:=false;
  chCarnet.checked:=false;
end;

{Opcao de impressao do carnet de pagamento ***}
{Se o contrato nao permite impresao de carnet, entao nao e permitido imprimir--}
{Pode ser para impressao LOCAL/ESCRITORIO ----}
procedure Tfrm_EmisCarnet2.Registrarbaixadodocumento1Click(
  Sender: TObject);
begin
     {CRITICA AOS DADOS ***}
  if (Trim(edtContrato.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O número do contrato não pode ficar vazio!',
      'Carnet',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
      250,200);
    edtContrato.setfocus;
  end
  else
  if (Trim(edtCliente.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código do cliente não pode ficar vazio!',
      'Carnet',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
      250,200);
    edtCliente.setfocus;
  end
  else
  if (frm_principal.x_modelo_impressao_carnet=1) then
    ImprimeCarnetJatoDeTinta
  else
  if (frm_principal.x_tipo_imp_carnet=0) then
    ImprimeCarnetGenerica
  else
    ImprimeCarnetPadrao;
end;

procedure Tfrm_EmisCarnet2.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    edtContrato.setfocus;
end;

procedure Tfrm_EmisCarnet2.edtContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLocalPgto.setfocus;
  if (key=K_CIMA) then
    edtCliente.setfocus;
end;

procedure Tfrm_EmisCarnet2.edtClienteExit(Sender: TObject);
begin
  if (trim(edtCliente.text)<>'') then
    edtCliente.text:=form_nz(strtofloat(Trim(edtCliente.text)),6);
end;

procedure Tfrm_EmisCarnet2.edtContratoExit(Sender: TObject);
begin
  if (trim(edtContrato.text)<>'') then
    edtContrato.text:=form_nz(strtofloat(Trim(edtContrato.text)),6);
end;

procedure Tfrm_EmisCarnet2.edtObs2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_EmisCarnet2.edtObs2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnConfere.click;
  if (key=38) then
    edtLocalPgto.setfocus;
end;

procedure Tfrm_EmisCarnet2.btnConfImpClick(Sender: TObject);
begin
  frm_impressoras.showmodal;
end;

procedure Tfrm_EmisCarnet2.timerImpTimer(Sender: TObject);
begin
  barraimpressora.panels[0].text:='Impressora ativa: ['+BuscaImpressoraPadrao+']';
end;

procedure Tfrm_EmisCarnet2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    frm_CarnetJatoDeTinta2.Free;
  except
  end;   
  timerImp.enabled:=false;
end;

procedure Tfrm_EmisCarnet2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

{Impressao em generica somente/texto **** --------------------------------- ***} 
procedure Tfrm_EmisCarnet2.ImprimeCarnetGenerica;
var
  clPrestCont: TClassPrestContrat;
  clClie: TClassCliente;
  clLoja: TClassLoja;
  clPlan: TClassPlano;
  pdc,nomecli,nomeloja: String;
  i,lin: Integer;
  flagQuit: Boolean;
  endeloja,contrato,cliente: String;
  multa,moras: Real;
  flagPlan: Boolean;
begin
    {Pegando os filtros ***}
  contrato:=Trim(edtContrato.text);
  cliente :=Trim(edtCliente.text);

    {Pergunta se imprime tambem os carnets para prestacoes ja quitadas ***}
  if (Modo<>1) then
    if (frmDialogo.ExibirMensagem ('Imprime carnets de prestações já quitadas?',
      'Emissão Carnet',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
      flagQuit:=true
    else
      flagQuit:=false;

    {iniciando o relatorio ***}
  mostra_mensagem ('Preparando carnets...Aguarde!');
  clPrestCont := TClassPrestContrat.Create;
  with (clPrestCont) do
  begin
         {BUSCANDO DADOS *** - Prestacoes em aberto dentro do periodo pedido}
    conect ('CREDITO', self);
    ClearSql;
    AddParam ('Select PC_LOJA,PC_CONT,PC_CLIE,PC_NPRE,PC_PORT,PC_TPRE,      ');
    AddParam ('       PC_VALO,PC_DCON,PC_DVTO,PC_FATO,PC_AVAL,PC_PLAN       ');
    AddParam ('From   CREPRABR                                              ');
    AddParam ('Where (PC_CONT='+contrato+') AND                             ');
    AddParam ('      (PC_CLIE='+cliente +')                                 ');
    if (not flagQuit) then
      AddParam ('AND (PC_STAT='+chr(39)+'0'+chr(39)+')                     ');
    if (not Execute) then
    begin
      esconde_mensagem;
      frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
        'Emissão Carnet',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
        250,200);
    end
    else
    begin
              {buscando o plano, para verificar se pode imprimir carnet ***}
              {Exibe mensagem de aviso/erro ---}
      clPrestCont.first;
      clPlan := TClassPlano.Create;
      with (clPlan) do
      begin
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PL_CODI,PL_CARN ');
        AddParam ('From   CREDPLANO       ');
        AddParam ('where (PL_CODI='+floattostr(clPrestCont.Result('PC_PLAN'))+')');
        if (not Execute) then
          flagPlan:=false
        else
        if (Result('PL_CARN')='1') then
          flagPlan:=true
        else
          flagPlan:=false;
        desconect;
        Free;
      end;

              {Verificando o plano ***}
      if (not flagPlan) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('O plano do contrato não permite impressão de carnet!',
          'Carnet',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
        edtCliente.setfocus;
      end
      else
      begin
                 {Inicio da impressao de cada conjunto Carnet/Prestacao ---->}
                 {Pergunta se a impressora é a GENERICA ***}
        esconde_mensagem;
        mostra_mensagem('Imprimindo '+inttostr(reccount)+' carnets...Aguarde!');
        Printer.BeginDoc;
        lin:=0;
        first;
        while (not eof) do
        begin
                      {buscando a loja}
          clLoja := TClassLoja.Create;
          with (clLoja) do
          begin
            conect ('CREDITO',self);
            AddParam ('Select LO_CODI,LO_MULT,LO_MORA,LO_NOME,LO_ENDE    ');
            AddParam ('From CRELOJA                                      ');
            AddParam ('Where (LO_CODI='+floattostr(clPrestCont.Result('PC_LOJA'))+') ');
            multa:=0.00;
            moras:=0.00;
            nomeloja:='<loja nao encontrada>';
            endeloja:='?';
            if (Execute) then
            begin
              multa:=(Result('LO_MULT')*clPrestCont.Result('PC_VALO'))/100;
              moras:=(Result('LO_MORA')*clPrestCont.Result('PC_VALO'))/100;
              nomeloja:=Result('LO_NOME');
              endeLoja:=Result('LO_ENDE');
            end;
          end;

                      {buscando o cliente}
          clClie := TClassCliente.Create;
          with (clClie) do
          begin
            Conect ('CREDITO',self);
            AddParam ('Select CL_CODI,CL_NOME,CL_PDC ');
            AddParam ('From CRECLI                      ');
            AddParam ('Where (CL_CODI='+chr(39)+floattostr(clPrestCont.Result('PC_CLIE'))+chr(39)+')');
            if (Execute) then
            begin
              nomecli  := Result('CL_NOME');
              pdc      := Result('CL_PDC');
            end
            else
            begin
              nomecli  := '';
              pdc      := '';
            end;
            desconect;
            Free;
          end;

                      {imprimindo um Carnet}
          Printer.Canvas.TextOut(1,lin,
            form_tc(' ',4,' ')+
            form_t(frm_principal.x_empresa,30)+
            form_tc(' ',6,' ')+form_t(nomeloja,20)+' '+
            form_nz(Result('PC_LOJA'),2));
          lin:=lin+2;
          Printer.Canvas.TextOut(1,lin,
            form_tc(' ',4,' ')+
            form_t(nomecli,30)+
            form_tc(' ',6,' ')+
            form_t(nomecli,30));
          lin:=lin+2;
          Printer.Canvas.TextOut(1,lin,
            form_tc(' ',4,' ')+
            form_nz(Result('PC_NPRE'),2)+'/'+form_nz(Result('PC_TPRE'),2)+
            '  '+form_data(Result('PC_DVTO'))+'    '+
            form_nc(Result('PC_VALO'),10)+form_tc(' ',12,' ')+form_t(pdc,4)+
            '    '+form_nz(Result('PC_LOJA'),2)+'.'+form_nz(Result('PC_CLIE'),6)+
            '.'+form_nz(Result('PC_CONT'),6)+'.'+form_nz(Result('PC_NPRE'),2)+
            ' '+form_n(DigitoVerificador(
            form_nz(Result('PC_LOJA'),2)+
            form_nz(Result('PC_CLIE'),6)+
            form_nz(Result('PC_CONT'),6)+
            form_nz(Result('PC_NPRE'),2)),1));
          lin:=lin+2;
          Printer.Canvas.TextOut(1,lin,
            form_tc(' ',40,' ')+
            form_nz(Result('PC_NPRE'),2)+'/'+form_nz(Result('PC_TPRE'),2)+
            ' '+form_data(Result('PC_DVTO'))+'           '+
            form_nc(Result('PC_VALO'),10));
          lin:=lin+2;
          if (chCarnet.checked) then
            Printer.Canvas.TextOut(1,lin,
              form_tc(' ',4,' ')+
              form_nz(Result('PC_LOJA'),2)+' '+
              form_nz(Result('PC_CLIE'),6)+' '+
              form_nz(Result('PC_CONT'),6)+
              form_tc(' ',26,' ')+
              form_nc(multa,10))
          else
            Printer.Canvas.TextOut(1,lin,
              form_tc(' ',4,' ')+
              form_nz(Result('PC_LOJA'),2)+' '+
              form_nz(Result('PC_CLIE'),6)+' '+
              form_nz(Result('PC_CONT'),6));
          if (chCarnet.checked) then
          begin
            lin:=lin+2;
            Printer.Canvas.TextOut(1,lin,
              form_tc(' ',46,' ')+
              form_nc(moras,10));
            lin:=lin+2;
          end
          else
            lin:=lin+4;
          Printer.Canvas.TextOut(1,lin,
            form_tc(' ',6,' ')+Trim(edtObs1.text));
          lin:=lin+1;
          Printer.Canvas.TextOut(1,lin,
            form_tc(' ',8,' ')+Trim(edtObs2.text));
          lin:=lin+1;
          if (chQualquerLoja.checked) then
            Printer.Canvas.TextOut(1,lin,
              form_tc(' ',45,' ')+'QUALQUER UMA DE NOSSAS LOJAS')
          else
          if (Trim(edtLocalPgto.text)<>'') then
            Printer.Canvas.TextOut(1,lin,
              form_tc(' ',45,' ')+Trim(edtLocalPgto.text))
          else
            Printer.Canvas.TextOut(1,lin,
              form_tc(' ',45,' ')+Trim(endeLoja));
          next;
          lin:=4;
          Printer.NewPage;
        end;
        lin:=lin+1;
        i:=1;
        while (i<20) do
        begin
          Printer.Canvas.TextOut(1,lin,' ');
          lin:=lin+1;
          i:=i+1;
        end;
        Printer.EndDoc;
        MarcaCarnetContrato (clPrestCont.Result('PC_CLIE'),
          clPrestCont.Result('PC_CONT'));

                 {Marca o contrato como ja impresso, somente se for chamado
                  no lancamento de contratos ***}
        if (Modo=1) then
          MarcaCarnetContrato (strtofloat(cliente),strtofloat(contrato));

        esconde_mensagem;
      end;
    end;
  end;
  clPrestCont.desconect;
  clPrestCont.Free;
  if (Modo=1) then
    frm_EmisCarnet2.close;
end;


{Impressao em impressora padrao matricial instalada **** ------------------ ***}
procedure Tfrm_EmisCarnet2.ImprimeCarnetPadrao;
var
  arq: textfile;
  clPrestCont: TClassPrestContrat;
  clClie: TClassCliente;
  clLoja: TClassLoja;
  clPlan: TClassPlano;
  pdc,nomecli,nomeloja: String;
  i,lin: Integer;
  flagQuit: Boolean;
  campo01,campo02,campo03,campo04,campo05,campo06,campo07,campo08: String;
  campo09,campo10,campo11,campo12,campo13,campo14,campo15,campo16: String;
  campo17,campo18: String;
  endeloja,contrato,cliente: String;
  multa,moras: Real;
  flagPlan: Boolean;
  result2: Integer;
begin
    {Pegando os filtros ***}
  contrato:=Trim(edtContrato.text);
  cliente :=Trim(edtCliente.text);

    {Pergunta se imprime tambem os carnets para prestacoes ja quitadas ***}
  if (Modo<>1) then
    if (frmDialogo.ExibirMensagem ('Imprime carnets de prestações já quitadas?',
      'Emissão Carnet',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
      flagQuit:=true
    else
      flagQuit:=false;

    {iniciando o relatorio ***}
  mostra_mensagem ('Preparando carnets...Aguarde!');
  clPrestCont := TClassPrestContrat.Create;
  with (clPrestCont) do
  begin
         {BUSCANDO DADOS *** - Prestacoes em aberto dentro do periodo pedido}
    conect ('CREDITO', self);
    ClearSql;
    AddParam ('Select PC_LOJA,PC_CONT,PC_CLIE,PC_NPRE,PC_PORT,PC_TPRE,      ');
    AddParam ('       PC_VALO,PC_DCON,PC_DVTO,PC_FATO,PC_AVAL,PC_PLAN       ');
    AddParam ('From   CREPRABR                                              ');
    AddParam ('Where (PC_CONT='+contrato+') AND                             ');
    AddParam ('      (PC_CLIE='+cliente +')                                 ');
    if (not flagQuit) then
      AddParam ('AND (PC_STAT='+chr(39)+'0'+chr(39)+')                     ');
    if (not Execute) then
    begin
      esconde_mensagem;
      frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
        'Emissão Carnet',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
        250,200);
    end
    else
    begin
              {buscando o plano, para verificar se pode imprimir carnet ***}
              {Exibe mensagem de aviso/erro ---}
      clPrestCont.first;
      clPlan := TClassPlano.Create;
      with (clPlan) do
      begin
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PL_CODI,PL_CARN ');
        AddParam ('From   CREDPLANO       ');
        AddParam ('where (PL_CODI='+floattostr(clPrestCont.Result('PC_PLAN'))+')');
        if (not Execute) then
          flagPlan:=false
        else
        if (Result('PL_CARN')='1') then
          flagPlan:=true
        else
          flagPlan:=false;
        desconect;
        Free;
      end;

              {Verificando o plano ***}
      if (not flagPlan) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('O plano do contrato não permite impressão de carnet!',
          'Carnet',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
        edtCliente.setfocus;
      end
      else
      begin
                 {Inicio da impressao de cada conjunto Carnet/Prestacao ---->}
        mostra_mensagem ('Gerando arquivo de carnets...Aguarde!');
        AssignFile      (arq, 'C:\NATIVA\CREDITO\CARNTEMP.TXT');
        Rewrite         (arq);
        first;
        while (not eof) do
        begin
                      {buscando a loja}
          clLoja := TClassLoja.Create;
          with (clLoja) do
          begin
            conect ('CREDITO',self);
            AddParam ('Select LO_CODI,LO_MULT,LO_MORA,LO_NOME,LO_ENDE    ');
            AddParam ('From CRELOJA                                      ');
            AddParam ('Where (LO_CODI='+floattostr(clPrestCont.Result('PC_LOJA'))+') ');
            multa:=0.00;
            moras:=0.00;
            nomeloja:='<loja nao encontrada>';
            endeloja:='?';
            if (Execute) then
            begin
              multa:=(Result('LO_MULT')*clPrestCont.Result('PC_VALO'))/100;
              moras:=(Result('LO_MORA')*clPrestCont.Result('PC_VALO'))/100;
              nomeloja:=Result('LO_NOME');
              endeLoja:=Result('LO_ENDE');
            end;
          end;

                      {buscando o cliente}
          clClie := TClassCliente.Create;
          with (clClie) do
          begin
            Conect ('CREDITO',self);
            AddParam ('Select CL_CODI,CL_NOME,CL_PDC ');
            AddParam ('From CRECLI                      ');
            AddParam ('Where (CL_CODI='+chr(39)+floattostr(clPrestCont.Result('PC_CLIE'))+chr(39)+')');
            if (Execute) then
            begin
              nomecli  := Result('CL_NOME');
              pdc      := Result('CL_PDC');
            end
            else
            begin
              nomecli  := '';
              pdc      := '';
            end;
            desconect;
            Free;
          end;

                      {gravando linhas no arquivos ****}
          campo01 := form_nz(Result('PC_LOJA'),2);
          campo02 := form_nz(Result('PC_CLIE'),6);
          campo03 := form_nz(Result('PC_CONT'),6);
          campo04 := form_nz(Result('PC_NPRE'),2);
          campo05 := form_t(frm_principal.x_empresa,30);
          campo06 := form_t(nomeloja,20);
          campo07 := form_t(nomecli,30);
          campo08 := form_nz(Result('PC_TPRE'),2);
          campo09 := form_data(Result('PC_DVTO'));
          campo10 := form_nc(Result('PC_VALO'),10);
          campo11 := form_t(pdc,4);
          campo12 := form_n(DigitoVerificador(
            form_nz(Result('PC_LOJA'),2)+
            form_nz(Result('PC_CLIE'),6)+
            form_nz(Result('PC_CONT'),6)+
            form_nz(Result('PC_NPRE'),2)),1);
          if (chCarnet.checked) then
            campo13 := form_nc(multa,10)
          else
            campo13 := form_nc(0,10);
          if (chCarnet.checked) then
            campo14 := form_nc(moras,10)
          else
            campo14 := form_nc(0,10);
          campo15 := form_t(Trim(edtObs1.text),23);
          campo16 := form_t(Trim(edtObs2.text),23);
          if (chQualquerLoja.checked) then
            campo17 := form_t('QUALQUER UMA DE NOSSAS LOJAS',34)
          else
          if (Trim(edtLocalPgto.text)<>'') then
            campo17 := form_t(Trim(edtLocalPgto.text),34)
          else
            campo17 := form_t(Trim(endeLoja),34);
          Writeln (arq, campo01+']'+campo02+']'+campo03+']'+
            campo04+']'+campo05+']'+campo06+']'+campo07+']'+
            campo08+']'+campo09+']'+campo10+']'+campo11+']'+
            campo12+']'+campo13+']'+campo14+']'+campo15+']'+
            campo16+']'+campo17);
          next;
        end;
        Writeln (arq,'@'+form_tc2(' ',242,' '));
        CloseFile (arq);
        MarcaCarnetContrato (clPrestCont.Result('PC_CLIE'),
          clPrestCont.Result('PC_CONT'));

                 {chamando programa de impressao ***}
        result2 := winexec (Pchar(frm_principal.x_pathsystem+'\IMPCARN.EXE  '+
          'C:\NATIVA\CREDITO\CARNTEMP.TXT '+
          inttostr(frm_principal.x_impressora)+
          ' 12c ')
          ,1);

        if (result2=0) then
          frmDialogo.ExibirMensagem ('O sistema está sem memória para executar esta operação!',
            'Carnets',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
        if (result2=ERROR_BAD_FORMAT) then
          frmDialogo.ExibirMensagem ('O arquivo .EXE é inválido!',
            'Carnets',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
        if (result2=ERROR_FILE_NOT_FOUND) then
          frmDialogo.ExibirMensagem ('O arquivo especificado não foi encontrado!',
            'Carnets',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
        if (result2=ERROR_PATH_NOT_FOUND) then
          frmDialogo.ExibirMensagem ('O caminho especificado é inválido!',
            'Carnets',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);

                 {Marca o contrato como ja impresso, somente se for chamado
                  no lancamento de contratos ***}
        if (Modo=1) then
          MarcaCarnetContrato (strtofloat(cliente),strtofloat(contrato));
        esconde_mensagem;
      end;
    end;
  end;
  esconde_mensagem;
  clPrestCont.desconect;
  clPrestCont.Free;
  if (Modo=1) then
    frm_EmisCarnet2.close;
end;

procedure Tfrm_EmisCarnet2.FormCreate(Sender: TObject);
begin
  if (frm_principal.x_modelo_impressao_carnet=1) then
  begin
    ChecaExistenciaArquivo_TEMPCARNETJATODETINTA;
    try
      Application.CreateForm(Tfrm_CarnetJatoDeTinta2, frm_CarnetJatoDeTinta2);
    except
      showmessage('Erro: Verifique se existe uma impressora válida instalada como padrão! Obs: Algumas impressoras Laser são imcompatíveis com esta impressão de carnet!');
    end;
  end;

     {carregando as variaveis de config. do sistema}
  chCarnet.checked:=frm_principal.x_flag_carnet_juros;
  chEntrada.checked:=frm_principal.x_carnet_imprime_entrada;
  chQualquerLoja.checked:=frm_principal.x_qualquer_endereco_carnet;
  edtLocalPgto.text:=frm_principal.x_endereco_carnet;
  edtObs1.text:=frm_principal.x_obs1_carnet;
  edtObs2.text:=frm_principal.x_obs2_carnet;
end;

{Impressao em impressora padrao matricial instalada **** ------------------ ***}
procedure Tfrm_EmisCarnet2.ImprimeCarnetJatoDeTinta;
var
  arq: textfile;
  clPrestCont: TClassPrestContrat;
  clClie: TClassCliente;
  clLoja: TClassLoja;
  clPlan: TClassPlano;
  pdc,nomecli,nomeloja: String;
  i,lin: Integer;
  flagQuit: Boolean;
  campo01,campo02,campo03,campo04,campo05,campo06,campo07,campo08: String;
  campo09,campo10,campo11,campo12,campo13,campo14,campo15,campo16: String;
  campo17,campo18: String;
  diaHora,endeloja,contrato,cliente: String;
  multa,moras: Real;
  flagPlan: Boolean;
  ind,result2: Integer;
begin
    {Pegando os filtros ***}
  contrato:=Trim(edtContrato.text);
  cliente :=Trim(edtCliente.text);

    {Pergunta se imprime tambem os carnets para prestacoes ja quitadas ***}
  if (Modo<>1) then
    if (frmDialogo.ExibirMensagem ('Imprime carnets de prestações já quitadas?',
      'Emissão Carnet',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
      flagQuit:=true
    else
      flagQuit:=false;

    {iniciando o relatorio ***}
  mostra_mensagem ('Preparando carnets...Aguarde!');
  clPrestCont := TClassPrestContrat.Create;
  with (clPrestCont) do
  begin
         {BUSCANDO DADOS *** - Prestacoes em aberto dentro do periodo pedido}
    conect ('CREDITO', self);
    ClearSql;
    AddParam ('Select PC_LOJA,PC_CONT,PC_CLIE,PC_NPRE,PC_PORT,PC_TPRE,      ');
    AddParam ('       PC_VALO,PC_DCON,PC_DVTO,PC_FATO,PC_AVAL,PC_PLAN       ');
    if (chEntrada.checked) then
    begin
      AddParam ('       ,CR_VENT,CR_DNOT                                 ');
      AddParam ('From   CREPRABR,CRECTABR                                ');
    end
    else
      AddParam ('From   CREPRABR                                         ');
    AddParam ('Where (PC_CONT='+contrato+') AND                             ');
    AddParam ('      (PC_CLIE='+cliente +')                                 ');
    if (not flagQuit) then
      AddParam ('AND (PC_STAT='+chr(39)+'0'+chr(39)+')                     ');
    if (chEntrada.checked) then
      AddParam ('AND (CR_CODI=PC_CONT) AND (CR_CLIE=PC_CLIE)               ');
    if (not Execute) then
    begin
      esconde_mensagem;
      frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
        'Emissão Carnet',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
        250,200);
    end
    else
    begin
              {* Limpando tabela temporaria}
      DMcontrato.tbl_tempCarnetJatoDeTinta.open;
      DMcontrato.tbl_tempCarnetJatoDeTinta.first;
      while (not DMcontrato.tbl_tempCarnetJatoDeTinta.eof) do
        DMcontrato.tbl_tempCarnetJatoDeTinta.delete;

              {buscando o plano, para verificar se pode imprimir carnet ***}
              {Exibe mensagem de aviso/erro ---}
      clPrestCont.first;
      clPlan := TClassPlano.Create;
      with (clPlan) do
      begin
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PL_CODI,PL_CARN ');
        AddParam ('From   CREDPLANO       ');
        AddParam ('where (PL_CODI='+floattostr(clPrestCont.Result('PC_PLAN'))+')');
        if (not Execute) then
          flagPlan:=false
        else
        if (Result('PL_CARN')='1') then
          flagPlan:=true
        else
          flagPlan:=false;
        desconect;
        Free;
      end;

              {Verificando o plano ***}
      if (not flagPlan) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('O plano do contrato não permite impressão de carnet!',
          'Carnet',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
          250,200);
        edtCliente.setfocus;
      end
      else
      begin
                 {buscando a loja}
        clLoja := TClassLoja.Create;
        with (clLoja) do
        begin
          conect   ('CREDITO',self);
          AddParam ('Select LO_CODI,LO_MULT,LO_MORA,LO_NOME,LO_ENDE    ');
          AddParam ('From CRELOJA                                      ');
          AddParam ('Where (LO_CODI='+floattostr(clPrestCont.Result('PC_LOJA'))+') ');
          multa:=0.00;
          moras:=0.00;
          nomeloja:='<loja nao encontrada>';
          endeloja:='?';
          if (Execute) then
          begin
            multa    := (Result('LO_MULT')*clPrestCont.Result('PC_VALO'))/100;
            moras    := (Result('LO_MORA')*clPrestCont.Result('PC_VALO'))/100;
            nomeloja := Result('LO_NOME');
            endeLoja := Result('LO_ENDE');
          end;
          desconect;
          Free;
        end;

                 {buscando o cliente}
        clClie := TClassCliente.Create;
        with (clClie) do
        begin
          Conect   ('CREDITO',self);
          AddParam ('Select CL_CODI,CL_NOME,CL_PDC    ');
          AddParam ('From CRECLI                      ');
          AddParam ('Where (CL_CODI='+chr(39)+floattostr(clPrestCont.Result('PC_CLIE'))+chr(39)+')');
          if (Execute) then
          begin
            nomecli  := Result('CL_NOME');
            pdc      := Result('CL_PDC');
          end
          else
          begin
            nomecli  := '';
            pdc      := '';
          end;
          desconect;
          Free;
        end;

                 {Inicio da impressao de cada conjunto Carnet/Prestacao ---->}
        mostra_mensagem ('Gerando arquivo de carnets...Aguarde!');
        AssignFile      (arq, 'C:\NATIVA\CREDITO\CARNTEMP.TXT');
        Rewrite         (arq);

                 {**** Gravando a entrada se for necessario *******************}
        if (chEntrada.checked) then
          if (Result('CR_VENT')<>0.00) then
          begin
            campo01 := form_nz(Result('PC_LOJA'),2);
            campo02 := form_nz(Result('PC_CLIE'),6);
            campo03 := form_nz(Result('PC_CONT'),6);
            campo04 := form_t('  ',2);
            campo05 := form_t(frm_principal.x_empresa,30);
            campo06 := form_t(nomeloja,20);
            campo07 := form_t(nomecli,30);
            campo08 := form_t('  ',2);
            campo09 := form_data(Result('CR_DNOT'));
            campo10 := form_nc(Result('CR_VENT'),10);
            campo11 := form_t(pdc,4);
            campo12 := ' ';
            if (chCarnet.checked) then
              campo13 := form_nc(multa,10)
            else
              campo13 := form_nc(0,10);
            if (chCarnet.checked) then
              campo14 := form_nc(moras,10)
            else
              campo14 := form_nc(0,10);
            campo15 := form_t(Trim(edtObs1.text),23);
            campo16 := form_t(Trim(edtObs2.text),23);
            if (chQualquerLoja.checked) then
              campo17 := form_t('QUALQUER UMA DE NOSSAS LOJAS',34)
            else
            if (Trim(edtLocalPgto.text)<>'') then
              campo17 := form_t(Trim(edtLocalPgto.text),34)
            else
              campo17 := form_t(Trim(endeLoja),34);
            Writeln (arq, campo01+']'+campo02+']'+campo03+']'+
              campo04+']'+campo05+']'+campo06+']'+campo07+']'+
              campo08+']'+campo09+']'+campo10+']'+campo11+']'+
              campo12+']'+campo13+']'+campo14+']'+campo15+']'+
              campo16+']'+campo17);
                      {*}
            DMcontrato.tbl_tempCarnetJatoDeTinta.append;
            DMcontrato.tbl_tempCarnetJatoDeTinta.fieldbyname('LINHA').AsInteger:=ind;
            DMcontrato.tbl_tempCarnetJatoDeTinta.post;
            ind:=ind+1;
                      {*}
          end;
                 {*************************************************************}

        first;
        ind:=1;
        while (not eof) do
        begin
                      {gravando linhas no arquivos ****}
          campo01 := form_nz(Result('PC_LOJA'),2);
          campo02 := form_nz(Result('PC_CLIE'),6);
          campo03 := form_nz(Result('PC_CONT'),6);
          campo04 := form_nz(Result('PC_NPRE'),2);
          campo05 := form_t(frm_principal.x_empresa,30);
          campo06 := form_t(nomeloja,20);
          campo07 := form_t(nomecli,30);
          campo08 := form_nz(Result('PC_TPRE'),2);
          campo09 := form_data(Result('PC_DVTO'));
          campo10 := form_nc(Result('PC_VALO'),10);
          campo11 := form_t(pdc,4);
          campo12 := form_n(DigitoVerificador(
            form_nz(Result('PC_LOJA'),2)+
            form_nz(Result('PC_CLIE'),6)+
            form_nz(Result('PC_CONT'),6)+
            form_nz(Result('PC_NPRE'),2)),1);
          if (chCarnet.checked) then
            campo13 := form_nc(multa,10)
          else
            campo13 := form_nc(0,10);
          if (chCarnet.checked) then
            campo14 := form_nc(moras,10)
          else
            campo14 := form_nc(0,10);
          campo15 := form_t(Trim(edtObs1.text),23);
          campo16 := form_t(Trim(edtObs2.text),23);
          if (chQualquerLoja.checked) then
            campo17 := form_t('QUALQUER UMA DE NOSSAS LOJAS',34)
          else
          if (Trim(edtLocalPgto.text)<>'') then
            campo17 := form_t(Trim(edtLocalPgto.text),34)
          else
            campo17 := form_t(Trim(endeLoja),34);
          Writeln (arq, campo01+']'+campo02+']'+campo03+']'+
            campo04+']'+campo05+']'+campo06+']'+campo07+']'+
            campo08+']'+campo09+']'+campo10+']'+campo11+']'+
            campo12+']'+campo13+']'+campo14+']'+campo15+']'+
            campo16+']'+campo17);
                      {*}
          DMcontrato.tbl_tempCarnetJatoDeTinta.append;
          DMcontrato.tbl_tempCarnetJatoDeTinta.fieldbyname('LINHA').AsInteger:=ind;
          DMcontrato.tbl_tempCarnetJatoDeTinta.post;
          ind:=ind+1;
                      {*}
          next;
        end;
        Writeln (arq,'@'+form_tc2(' ',242,' '));
        CloseFile (arq);
        MarcaCarnetContrato (clPrestCont.Result('PC_CLIE'),
          clPrestCont.Result('PC_CONT'));
        esconde_mensagem;

                 {chamando programa de impressao ***}
        diaHora := FormatDateTime('ddmmyyyy-hhnnss',now);
        DeleteFile(Pchar('C:\NATIVA\CREDITO\CARNTEMP-'+diaHora+'.TXT'));
        CopyFile('C:\NATIVA\CREDITO\CARNTEMP.TXT',Pchar('C:\NATIVA\CREDITO\CARNTEMP-'+diaHora+'.TXT'),false);
        frm_CarnetJatoDeTinta2.nome_arquivo := 'C:\NATIVA\CREDITO\CARNTEMP-'+diaHora+'.TXT';
        frm_CarnetJatoDeTinta2.tbl_tempCarnetJatoDeTinta.open;
        frm_CarnetJatoDeTinta2.carnet.preview;
        try
          if (not frm_CarnetJatoDeTinta2.flagImprimiu) then
          begin
            CloseFile (frm_CarnetJatoDeTinta2.arquivo_carnet);
            DeleteFile (frm_CarnetJatoDeTinta2.nome_arquivo);
          end;
        except
        end;
      end;
    end;
  end;
  esconde_mensagem;
  clPrestCont.desconect;
  clPrestCont.Free;
  if (Modo=1) and (frm_principal.x_modelo_impressao_carnet=0) then
    frm_EmisCarnet2.close;
end;

end.
