unit un_InfBoletaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask;

type
  Tfrm_InfBoletaVenda = class(TForm)
    edtNumBoleta1: TMaskEdit;
    edtValEntrada1: TMaskEdit;
    edtValor1: TMaskEdit;
    edtNumBoleta2: TMaskEdit;
    edtValEntrada2: TMaskEdit;
    edtValor2: TMaskEdit;
    edtNumBoleta3: TMaskEdit;
    edtValEntrada3: TMaskEdit;
    edtValor3: TMaskEdit;
    edtTotalEntrada: TMaskEdit;
    edtTotalValor: TMaskEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    btnSair: TPanel;
    Label6: TLabel;
    btnConfirmar: TButton;
    Label7: TLabel;
    Label8: TLabel;
    procedure edtValEntrada1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValor1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumBoleta2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValEntrada2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValor2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumBoleta3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValEntrada3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValor3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumBoleta1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtValEntrada1Exit(Sender: TObject);
    procedure edtTotalEntradaChange(Sender: TObject);
    procedure edtValEntrada2Exit(Sender: TObject);
    procedure edtValEntrada3Exit(Sender: TObject);
    procedure edtValor1Exit(Sender: TObject);
    procedure edtValor2Exit(Sender: TObject);
    procedure edtValor3Exit(Sender: TObject);
    procedure edtTotalValorChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtNumBoleta2Exit(Sender: TObject);
    procedure edtNumBoleta3Exit(Sender: TObject);
  private
    { Private declarations }
    procedure LimparEdits;
  public
    { Public declarations }
    numContrato: String;
    numBoletas: Real;
    entrada1, entrada2, entrada3: Real;
    valor1, valor2, valor3: Real;
    voltou: Boolean;
    fechouInfBoletaVenda: Boolean;
    tudoVazio: Boolean;
    cancelou: Boolean;
    ativarBotaoDeEdicao: Boolean;
    //****VARIÁVEIS NECESSÁRIAS PARA ARMAZENAR OS VALORES ANTES DE SALVAR NA TABELA CREDIARIOS******
    codigoLoja,codigoCliente,codigoContrato: Real;
    codigoBoleta2,codigoBoleta3: Real;
    valorEntrada1,valorEntrada2,valorEntrada3: Real;
    valorBoleta1,valorBoleta2,valorBoleta3: Real;
    totalEntrada,totalValor,totalFinanciado1,totalFinanciado2,totalFinanciado3: Real;
    codigoPlano: Real;
    nome,cpf: String;
    jaGravou,confirmou: Boolean;
    //***********************************************************************************************
    //****VARIÁVEIS QUE ARMAZENAM OS VALORES ANTIGOS NO CASO DE ATUALIZAÇÃO/EDIÇÃO DOS VALORES*******
    codigoContratoAnt: Real;
    codigoBoleta2Ant,codigoBoleta3Ant: Real;
    valorEntrada1Ant,valorEntrada2Ant,valorEntrada3Ant: Real;
    valorBoleta1Ant,valorBoleta2Ant,valorBoleta3Ant: Real;
    totalEntradaAnt,totalValorAnt,totalFinanciado1Ant,totalFinanciado2Ant,totalFinanciado3Ant: Real;
    codigoPlanoAnt: Real;
    //***********************************************************************************************
  end;

var
  frm_InfBoletaVenda: Tfrm_InfBoletaVenda;

implementation

uses principal, funcoes1, funcoes2, auxiliar, unDialogo, cadcli, un_frmConsulta1;

{$R *.dfm}

procedure Tfrm_InfBoletaVenda.edtValEntrada1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    if (Trim(edtValEntrada1.Text) = '') then
      edtValEntrada1.Text := '0';
    edtValor1.SetFocus;
  end;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
  if (key=K_F5) then
  begin
    edtValEntrada1.OnExit(Sender);
    btnConfirmar.Click;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValor1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(edtValor1.Text) <> '') then
      edtNumBoleta2.SetFocus
    else
    begin
      frmDialogo.ExibirMensagem ('Digite o valor da boleta!'
        ,'Informações Boletas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtValor1.SetFocus;
    end;
  if (key=K_CIMA) then
    edtValEntrada1.SetFocus;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
  if (key=K_F5) then
  begin
    edtValor1.OnExit(Sender);
    btnConfirmar.Click;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtNumBoleta2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtNumBoleta2.Text := form_nz(strtofloat(Trim(edtNumBoleta2.Text)),6);
    edtValEntrada2.SetFocus;
  end;
  if (key=K_CIMA) then
    edtValor1.SetFocus;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
  if (key=K_F5) then
  begin
    edtNumBoleta2.OnExit(Sender);
    btnConfirmar.Click;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValEntrada2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    if (Trim(edtValEntrada2.Text) = '') then
      edtValEntrada2.Text := '0';
    edtValor2.SetFocus;
  end;
  if (key=K_CIMA) then
    edtNumBoleta2.SetFocus;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
  if (key=K_F5) then
  begin
    edtValEntrada2.OnExit(Sender);
    btnConfirmar.Click;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValor2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((key=K_ENTER) or (key=K_BAIXO)) and (edtNumBoleta3.Enabled) then
  begin
    if (Trim(edtValor2.Text) <> '') then
      edtNumBoleta3.SetFocus
    else
    begin
      frmDialogo.ExibirMensagem ('Digite o valor da boleta!'
        ,'Informações Boletas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtValor2.SetFocus;
    end;
  end
  else
  if ((key=K_ENTER) or (key=K_BAIXO)) and (Trim(edtValor2.Text) <> '') then
    btnConfirmar.SetFocus
  else
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    frmDialogo.ExibirMensagem ('Digite o valor da boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor2.SetFocus;
  end;
  if (key=K_CIMA) then
    edtValEntrada2.SetFocus;
  if (key=K_F5) then
  begin
    edtValor2.OnExit(Sender);
    btnConfirmar.Click;
  end;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtNumBoleta3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(edtNumBoleta3.Text) <> '') then
    begin
      edtNumBoleta3.Text := form_nz(strtofloat(Trim(edtNumBoleta3.Text)),6);
      edtValEntrada3.SetFocus;
    end
    else
    begin
      frmDialogo.ExibirMensagem ('Digite o número da boleta!'
        ,'Informações Boletas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtNumBoleta3.SetFocus;
    end;
  if (key=K_CIMA) then
    edtValor2.SetFocus;
  if (key=K_F5) then
  begin
    edtNumboleta3.OnExit(Sender);
    btnConfirmar.Click;
  end;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValEntrada3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    if (Trim(edtValEntrada3.Text) = '') then
      edtValEntrada3.Text := '0';
    edtValor3.SetFocus;
  end;
  if (key=K_CIMA) then
    edtNumBoleta2.SetFocus;
  if (key=K_F5) then
  begin
    edtValEntrada3.OnExit(Sender);
    btnConfirmar.Click;
  end;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValor3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(edtValor3.Text) <> '') then
      btnConfirmar.SetFocus
    else
    begin
      frmDialogo.ExibirMensagem ('Digite o valor da boleta!'
        ,'Informações Boletas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtValor3.SetFocus;
    end;
  if (key=K_CIMA) then
    edtValEntrada3.SetFocus;
  if (key=K_F5) then
  begin
    edtValor3.OnExit(Sender);
    btnConfirmar.Click;
  end;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
end;

procedure Tfrm_InfBoletaVenda.btnConfirmarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    if (edtValor3.Enabled) then
      edtValor3.SetFocus
    else
      edtValor2.SetFocus;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
  if (key=K_F5) or (key=K_ENTER) then
    btnConfirmar.Click;
end;

procedure Tfrm_InfBoletaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F5) then
    btnConfirmar.Click;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtNumBoleta1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F5) then
    btnConfirmar.Click;
  if (key=K_ESC) then
  begin
    cancelou := true;
    close;
  end;
end;

procedure Tfrm_InfBoletaVenda.FormActivate(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  cliente: String;
  loja: String;
  contrato: String;
  editarValores: Boolean;
  qtdeBoletas: Integer;
begin
  if (frm_principal.jaGravou) then
  begin
    LimparEdits;
    editarValores := true;
  end
  else
    editarValores := false;
        //*******VERIFICA SE JÁ FOI LANÇADO*************************************
        //*******CASO JÁ EXISTA, CARREGA AS INFORMAÇÕES PARA PODER EDITAR*******
        //**********************************************************************
        //editarValores := false;
  if (Trim(frm_edtCliente.edtCodigo.Text) <> '') then
    cliente  := Trim(frm_edtCliente.edtCodigo.Text)
  else
    cliente  := Trim(frm_Consulta1.edtCodCli.Text);
  loja     := Trim(frm_edtCliente.edtLoja.Text);
  contrato := Trim(frm_edtCliente.edtContrato.Text);
  clAux := TClassAuxiliar.Create;
  clAux.Conect('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam('SELECT *                               ');
  clAux.AddParam('FROM CRECTABR                          ');
  clAux.AddParam('WHERE (CR_CODI='+contrato+') AND       ');
  clAux.AddParam('      (CR_CLIE='+cliente+') AND        ');
  clAux.AddParam('      (CR_LOJA='+loja+')               ');
  if (clAux.Execute) then
  begin
                //editarValores := true;
    clAux2 := TClassAuxiliar.Create;
    clAux2.Conect(DataBaseProdutos,self);
    clAux2.ClearSql;
    clAux2.AddParam('SELECT CR_CONT,CR_CODI,CR_VENT,CR_TOTA,CR_PLAN   ');
    clAux2.AddParam('FROM CREDIARIOS                                  ');
    clAux2.AddParam('WHERE (CR_CONT='+contrato+') AND                 ');
    clAux2.AddParam('      (CR_CLIE='+cliente+')  AND                 ');
    clAux2.AddParam('      (CR_LOJA='+loja+')                         ');
    clAux2.AddParam('ORDER BY CR_CODI                                 ');
    if (clAux2.Execute) then
    begin
      clAux2.First;
      qtdeBoletas := clAux2.RecCount;
      while (not clAux2.Eof) do
      begin
        if (qtdeBoletas = 2) then
        begin
          codigoPlanoAnt                             := clAux2.Result('CR_PLAN');
          edtNumBoleta1.Text                         := form_nz(strtofloat(contrato),6);
          ;
          edtValEntrada1.Text                        := floattostr(clAux2.Result('CR_VENT'));
          totalEntrada                               := clAux2.Result('CR_VENT');
          entrada1                                   := clAux2.Result('CR_VENT');
          FormatarZerosDecimais(edtValEntrada1);
          edtValor1.Text                             := floattostr(clAux2.Result('CR_TOTA'));
          totalValor                                 := clAux2.Result('CR_TOTA');
          valor1                                     := clAux2.Result('CR_TOTA');
          FormatarZerosDecimais(edtValor1);
          clAux2.Next;
          edtNumBoleta2.Text                         := form_nz(clAux2.Result('CR_CODI'),6);
          edtValEntrada2.Text                        := floattostr(clAux2.Result('CR_VENT'));
          totalEntrada                               := totalEntrada + clAux2.Result('CR_VENT');
          entrada2                                   := clAux2.Result('CR_VENT');
          FormatarZerosDecimais(edtValEntrada2);
          edtValor2.Text                             := floattostr(clAux2.Result('CR_TOTA'));
          totalValor                                 := totalValor + clAux2.Result('CR_TOTA');
          valor2                                     := clAux2.Result('CR_TOTA');
          FormatarZerosDecimais(edtValor2);
          edtTotalEntrada.Text                       := floattostr(totalEntrada);
          FormatarZerosDecimais(edtTotalEntrada);
          edtTotalValor.Text                         := floattostr(totalValor);
          FormatarZerosDecimais(edtTotalValor);
          edtNumBoleta3.Enabled  := false;
          edtValEntrada3.Enabled := false;
          edtValor3.Enabled      := false;
          edtNumBoleta3.Color    := clBtnFace;
          edtValEntrada3.Color   := clBtnFace;
          edtValor3.Color        := clBtnFace;
          codigoContratoAnt      := strtofloat(contrato);
          codigoBoleta2Ant       := strtofloat(Trim(edtNumBoleta2.Text));
          valorEntrada1Ant       := entrada1;
          valorEntrada2Ant       := entrada2;
          valorBoleta1Ant        := valor1;
          valorBoleta2Ant        := valor2;
          totalEntradaAnt        := entrada1 + entrada2;
          totalValorAnt          := valor1 + valor2;
          totalFinanciado1Ant    := valor1 - entrada1;
          totalFinanciado2Ant    := valor2 - entrada2;
        end
        else
        if (qtdeBoletas = 3) then
        begin
          codigoPlanoAnt                             := clAux2.Result('CR_PLAN');
          edtNumBoleta3.Enabled                      := true;
          edtValEntrada3.Enabled                     := true;
          edtValor3.Enabled                          := true;
          edtNumBoleta3.Color                        := clWindow;
          edtValEntrada3.Color                       := clWindow;
          edtValor3.Color                            := clWindow;
          edtNumBoleta1.Text                         := form_nz(strtofloat(contrato),6);
          ;
          edtValEntrada1.Text                        := floattostr(clAux2.Result('CR_VENT'));
          totalEntrada                               := clAux2.Result('CR_VENT');
          entrada1                                   := clAux2.Result('CR_VENT');
          FormatarZerosDecimais(edtValEntrada1);
          edtValor1.Text                             := floattostr(clAux2.Result('CR_TOTA'));
          totalValor                                 := clAux2.Result('CR_TOTA');
          valor1                                     := clAux2.Result('CR_TOTA');
          FormatarZerosDecimais(edtValor1);
          clAux2.Next;
          edtNumBoleta2.Text                         := form_nz(clAux2.Result('CR_CODI'),6);
          edtValEntrada2.Text                        := floattostr(clAux2.Result('CR_VENT'));
          totalEntrada                               := totalEntrada + clAux2.Result('CR_VENT');
          entrada2                                   := clAux2.Result('CR_VENT');
          FormatarZerosDecimais(edtValEntrada2);
          edtValor2.Text                             := floattostr(clAux2.Result('CR_TOTA'));
          totalValor                                 := totalValor + clAux2.Result('CR_TOTA');
          valor2                                     := clAux2.Result('CR_TOTA');
          FormatarZerosDecimais(edtValor2);
          clAux2.Next;
          edtNumBoleta3.Text                         := form_nz(clAux2.Result('CR_CODI'),6);
          edtValEntrada3.Text                        := floattostr(clAux2.Result('CR_VENT'));
          totalEntrada                               := totalEntrada + clAux2.Result('CR_VENT');
          entrada3                                   := clAux2.Result('CR_VENT');
          FormatarZerosDecimais(edtValEntrada3);
          edtValor3.Text                             := floattostr(clAux2.Result('CR_TOTA'));
          totalValor                                 := totalValor + clAux2.Result('CR_TOTA');
          valor3                                     := clAux2.Result('CR_TOTA');
          FormatarZerosDecimais(edtValor3);
          edtTotalEntrada.Text                       := floattostr(totalEntrada);
          FormatarZerosDecimais(edtTotalEntrada);
          edtTotalValor.Text                         := floattostr(totalValor);
          FormatarZerosDecimais(edtTotalValor);
          codigoContratoAnt      := strtofloat(contrato);
          codigoBoleta2Ant       := strtofloat(Trim(edtNumBoleta2.Text));
          codigoBoleta3Ant       := strtofloat(Trim(edtNumBoleta3.Text));
          valorEntrada1Ant       := entrada1;
          valorEntrada2Ant       := entrada2;
          valorEntrada3Ant       := entrada3;
          valorBoleta1Ant        := valor1;
          valorBoleta2Ant        := valor2;
          valorBoleta3Ant        := valor3;
          totalEntradaAnt        := entrada1 + entrada2 + entrada3;
          totalValorAnt          := valor1 + valor2 + valor3;
          totalFinanciado1Ant    := valor1 - entrada1;
          totalFinanciado2Ant    := valor2 - entrada2;
          totalFinanciado3Ant    := valor3 - entrada3;
        end;
        clAux2.Last;
      end;
    end;
    clAux2.Desconect;
    clAux2.Free;
    edtValEntrada1.SetFocus;
    ativarBotaoDeEdicao := true;
  end
  else
  if (not jaGravou) and (confirmou) then
  begin
    edtValEntrada1.Text         := floattostr(valorEntrada1);
    FormatarZerosDecimais(edtValEntrada1);
    edtValEntrada2.Text         := floattostr(valorEntrada2);
    FormatarZerosDecimais(edtValEntrada2);
    if (edtValEntrada3.Enabled) then
    begin
      edtValEntrada3.Text := floattostr(valorEntrada3);
      FormatarZerosDecimais(edtValEntrada3);
    end;
    edtValor1.Text              := floattostr(valorBoleta1);
    FormatarZerosDecimais(edtValor1);
    edtValor2.Text              := floattostr(valorBoleta2);
    FormatarZerosDecimais(edtValor2);
    if (edtValor3.Enabled) then
    begin
      edtValor3.Text      := floattostr(valorBoleta3);
      FormatarZerosDecimais(edtValor3);
    end;
    edtNumBoleta1.Text          := form_nz(codigoContrato,6);
    edtNumBoleta2.Text          := form_nz(codigoBoleta2,6);
    if (edtNumBoleta3.Enabled) then
      edtNumBoleta3.Text  := form_nz(codigoBoleta3,6);
    edtTotalEntrada.Text        := floattostr(totalEntrada);
    edtTotalValor.Text          := floattostr(totalValor);
    confirmou                   := false;
  end
  else
  begin
    edtValEntrada1.Text  := '';
    edtValEntrada2.Text  := '';
    edtValEntrada3.Text  := '';
    edtValor1.Text       := '';
    edtValor2.Text       := '';
    edtValor3.Text       := '';
    edtNumBoleta1.Text   := '';
    edtNumBoleta2.Text   := '';
    edtNumBoleta3.Text   := '';
    edtTotalEntrada.Text := '';
    edtTotalValor.Text   := '';
  end;
  clAux.Desconect;
  clAux.Free;
        //**********************************************************************
  if (not editarValores) then
  begin
    edtNumBoleta1.Text := form_nz(strtofloat(numContrato),6);
    edtValEntrada1.SetFocus;
    entrada1                       := 0;
    entrada2                       := 0;
    entrada3                       := 0;
    valor1                         := 0;
    valor2                         := 0;
    valor3                         := 0;
    totalEntrada                   := 0;
    totalValor                     := 0;
    cancelou                       := false;
    ativarBotaoDeEdicao            := false;
    if (numBoletas = 2) then
    begin
      edtNumBoleta3.Enabled  := false;
      edtValEntrada3.Enabled := false;
      edtValor3.Enabled      := false;
      edtNumBoleta3.Color    := clBtnFace;
      edtValEntrada3.Color   := clBtnFace;
      edtValor3.Color        := clBtnFace;
    end
    else
    if (numBoletas = 3) then
    begin
      edtNumBoleta3.Enabled  := true;
      edtValEntrada3.Enabled := true;
      edtValor3.Enabled      := true;
      edtNumBoleta3.Color    := clWindow;
      edtValEntrada3.Color   := clWindow;
      edtValor3.Color        := clWindow;
    end;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValEntrada1Exit(Sender: TObject);
begin
  entrada1 := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada1.Text)));
  totalEntrada := entrada1 + entrada2 + entrada3;
  edtTotalEntrada.Text := floattostr(totalEntrada);
  FormatarZerosDecimais(TMaskEdit(sender));
end;

procedure Tfrm_InfBoletaVenda.edtValEntrada2Exit(Sender: TObject);
begin
  if (Trim(edtValEntrada2.Text) <> '') then
  begin
    entrada2 := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada2.Text)));
    totalEntrada := entrada1 + entrada2 + entrada3;
    edtTotalEntrada.Text := floattostr(totalEntrada);
    FormatarZerosDecimais(TMaskEdit(sender));
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValEntrada3Exit(Sender: TObject);
begin
  if (Trim(edtValEntrada3.Text) <> '') then
  begin
    entrada3 := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada3.Text)));
    totalEntrada := entrada1 + entrada2 + entrada3;
    edtTotalEntrada.Text := floattostr(totalEntrada);
    FormatarZerosDecimais(TMaskEdit(sender));
  end;
end;

procedure Tfrm_InfBoletaVenda.edtTotalEntradaChange(Sender: TObject);
begin
  FormatarZerosDecimais(TMaskEdit(sender));
end;

procedure Tfrm_InfBoletaVenda.edtValor1Exit(Sender: TObject);
begin
  if (Trim(edtValor1.Text) <> '') then
  begin
    valor1 := strtofloat(RetiraFormatacaoNumero(Trim(edtValor1.Text)));
    totalValor := valor1 + valor2 + valor3;
    edtTotalValor.Text := floattostr(totalValor);
    FormatarZerosDecimais(TMaskEdit(sender));
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValor2Exit(Sender: TObject);
begin
  if (Trim(edtValor2.Text) <> '') then
  begin
    valor2 := strtofloat(RetiraFormatacaoNumero(Trim(edtValor2.Text)));
    totalValor := valor1 + valor2 + valor3;
    edtTotalValor.Text := floattostr(totalValor);
    FormatarZerosDecimais(TMaskEdit(sender));
  end;
end;

procedure Tfrm_InfBoletaVenda.edtValor3Exit(Sender: TObject);
begin
  if (Trim(edtValor3.Text) <> '') then
  begin
    valor3 := strtofloat(RetiraFormatacaoNumero(Trim(edtValor3.Text)));
    totalValor := valor1 + valor2 + valor3;
    edtTotalValor.Text := floattostr(totalValor);
    FormatarZerosDecimais(TMaskEdit(sender));
  end;
end;

procedure Tfrm_InfBoletaVenda.edtTotalValorChange(Sender: TObject);
begin
  FormatarZerosDecimais(TMaskEdit(sender));
end;

procedure Tfrm_InfBoletaVenda.btnSairClick(Sender: TObject);
begin
  cancelou := true;
  close;
end;

procedure Tfrm_InfBoletaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  totalFinanciado: Real;
begin
  if (Trim(edtTotalValor.Text) <> '') then
    totalFinanciado := strtofloat(Retiraformatacaonumero(Trim(edtTotalValor.Text)));
  if ((Trim(edtTotalEntrada.Text) = '') or (Trim(edtTotalValor.Text) = '') or
    (totalFinanciado = 0)) and (cancelou) then
    tudoVazio := true;
  fechouInfBoletaVenda := true;
  if (not cancelou) and (Trim(edtTotalEntrada.Text) <> '') and (Trim(edtTotalValor.Text) <> '') and
    (totalFinanciado > 0) then
  begin
    if (Trim(edtTotalValor.Text) <> '') then
    begin
      frm_edtCliente.edtValMerc.Text       := Retiraformatacaonumero(Trim(edtTotalValor.Text));
      frm_edtCliente.edtValMerc.Enabled    := false;
    end;
    if (Trim(edtTotalEntrada.Text) <> '') then
    begin
      frm_edtCliente.edtValEntrada.Text    := Retiraformatacaonumero(Trim(edtTotalEntrada.Text));
      frm_edtCliente.edtValEntrada.Enabled := false;
    end;
    ativarBotaoDeEdicao := true;
    frm_edtCliente.edtCodAval.SetFocus;
  end;
  if (cancelou) then
    frm_edtCliente.edtQtdeBoleta.SetFocus
  else
    frm_edtCliente.edtCodAval.SetFocus;
end;

procedure Tfrm_InfBoletaVenda.btnConfirmarClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  valorBoletas,entradaBoletas,valor,entrada: Real;
begin
        {valorBoletas   := strtofloat(Trim(edtTotalValor.Text));
        entradaBoletas := strtofloat(Trim(edtTotalEntrada.Text));
        if (frm_edtCliente.edtValMerc.Text <> '') then
                valor  := strtofloat(Trim(frm_edtCliente.edtValMerc.Text))
        else
                valor  := 0;
        entrada        := strtofloat(Trim(frm_edtCliente.edtValEntrada.Text)); }
        {CRÍTICAS}
  if (Trim(edtValEntrada1.Text) = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o valor da entrada da 1ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValEntrada1.SetFocus;
  end
  else
  if (Trim(edtValor1.Text) = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o valor da 1ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor1.SetFocus;
  end
  else
  if (Trim(edtNumBoleta2.Text) = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o número da 2ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta2.SetFocus;
  end
  else
  if (Trim(edtValEntrada2.Text) = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o valor da entrada da 2ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValEntrada2.SetFocus;
  end
  else
  if (Trim(edtValor2.Text) = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o valor da 2ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor2.SetFocus;
  end
  else
  if (Trim(edtNumBoleta3.Text) = '') and (edtNumBoleta3.Enabled) then
  begin
    frmDialogo.ExibirMensagem ('Digite o número da 3ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta3.SetFocus;
  end
  else
  if (Trim(edtValEntrada3.Text) = '') and (edtValEntrada3.Enabled) then
  begin
    frmDialogo.ExibirMensagem ('Digite o valor da entrada da 3ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValEntrada3.SetFocus;
  end
  else
  if (Trim(edtValor3.Text) = '') and (edtValor3.Enabled) then
  begin
    frmDialogo.ExibirMensagem ('Digite o valor da 3ª boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor3.SetFocus;
  end
  else {if (Trim(frm_edtCliente.edtValMerc.Text) <> '') then
        begin
                if (valor <> valorBoletas) or (entrada <> entradaBoletas) then
                begin
                        frmDialogo.ExibirMensagem ('Valores digitados são diferentes as informações da venda!'
                                ,'Informações Boletas',[mbOK]
                                ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
                        edtValEntrada1.SetFocus;
                end
                else
                begin
                        jaGravou         := false;
                        confirmou        := true;
                        frm_edtCliente.btnEditarBoletas.Enabled := true;
                        tudoVazio        := false;
                        cancelou         := false;
                        codigoLoja       := strtofloat(Trim(frm_edtCliente.edtLoja.Text));
                        codigoCliente    := frm_edtCliente.cdCliente;
                        if (Trim(frm_edtCliente.edtCpf.Text) = '') or (Trim(frm_edtCliente.edtNome.Text) = '') then
                        begin
                                clAux := TClassAuxiliar.Create;
                                clAux.Conect('CREDITO',self);
                                clAux.ClearSql;
                                clAux.AddParam('SELECT CL_NOME, CL_CPF                        ');
                                clAux.AddParam('FROM CRECLI                                   ');
                                clAux.AddParam('WHERE (CL_CODI='+floattostr(codigoCliente)+') ');
                                clAux.Execute;
                                nome := clAux.Result('CL_NOME');
                                cpf  := clAux.Result('CL_CPF');
                                clAux.Desconect;
                                clAux.Free;
                        end
                        else
                        begin
                                cpf              := Trim(frm_edtCliente.edtCpf.Text);
                                nome             := Trim(frm_edtCliente.edtNome.Text);
                        end;
                        codigoContrato   := strtofloat(Trim(edtNumBoleta1.Text));
                        codigoBoleta2    := strtofloat(Trim(edtNumBoleta2.Text));
                        if (edtNumBoleta3.Enabled) then
                                codigoBoleta3    := strtofloat(Trim(edtNumBoleta3.Text));
                        valorEntrada1    := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada1.Text)));
                        valorEntrada2    := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada2.Text)));
                        if (edtValEntrada3.Enabled) then
                                valorEntrada3    := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada3.Text)));
                        valorBoleta1     := strtofloat(RetiraFormatacaoNumero(Trim(edtValor1.Text)));
                        valorBoleta2     := strtofloat(RetiraFormatacaoNumero(Trim(edtValor2.Text)));
                        if (edtValor3.Enabled) then
                                valorBoleta3     := strtofloat(RetiraFormatacaoNumero(Trim(edtValor3.Text)));
                        totalFinanciado1 := valorBoleta1 - valorEntrada1;
                        totalFinanciado2 := valorBoleta2 - valorEntrada2;
                        if (edtValEntrada3.Enabled) and (edtValor3.Enabled) then
                                totalFinanciado3 := valorBoleta3 - valorEntrada3;
                        //*******VERIFICA SE É UMA ATUALIZAÇÃO DE VALORES************************************
                        if (valorBoleta1Ant <> 0) and (valorBoleta2Ant <> 0) and ((edtValor3.Enabled) and (valorBoleta3Ant <> 0)) then
                        begin
                                if (entrada1 <> valorEntrada1Ant) or (entrada2 <> valorEntrada2Ant) or
                                   (entrada3 <> valorEntrada3Ant) or (valor1 <> valorBoleta1Ant) or
                                   (valor2 <> valorBoleta2Ant) or (valor3 <> valorBoleta3Ant) then
                                        frm_edtCliente.atualizaMultiBoleta := true
                                else
                                        frm_edtCliente.atualizaMultiBoleta := false;
                        end
                        else
                                frm_edtCliente.atualizaMultiBoleta := false;
                        //***********************************************************************************
                        close;
                end;
        end
        else }
  begin
                //jaGravou         := false;
    confirmou        := true;
    frm_edtCliente.btnEditarBoletas.Enabled := true;
    tudoVazio        := false;
    cancelou         := false;
    codigoLoja       := strtofloat(Trim(frm_edtCliente.edtLoja.Text));
    codigoCliente    := frm_edtCliente.cdCliente;
    if (Trim(frm_edtCliente.edtCpf.Text) = '') or (Trim(frm_edtCliente.edtNome.Text) = '') then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.Conect('CREDITO',self);
      clAux.ClearSql;
      clAux.AddParam('SELECT CL_NOME, CL_CPF                        ');
      clAux.AddParam('FROM CRECLI                                   ');
      clAux.AddParam('WHERE (CL_CODI='+floattostr(codigoCliente)+') ');
      clAux.Execute;
      nome := clAux.Result('CL_NOME');
      cpf  := clAux.Result('CL_CPF');
      clAux.Desconect;
      clAux.Free;
    end
    else
    begin
      cpf      := Trim(frm_edtCliente.edtCpf.Text);
      nome     := Trim(frm_edtCliente.edtNome.Text);
    end;
    codigoContrato   := strtofloat(Trim(edtNumBoleta1.Text));
    codigoBoleta2    := strtofloat(Trim(edtNumBoleta2.Text));
    if (edtNumBoleta3.Enabled) then
      codigoBoleta3    := strtofloat(Trim(edtNumBoleta3.Text));
    valorEntrada1    := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada1.Text)));
    valorEntrada2    := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada2.Text)));
    if (edtValEntrada3.Enabled) then
      valorEntrada3    := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada3.Text)));
    valorBoleta1     := strtofloat(RetiraFormatacaoNumero(Trim(edtValor1.Text)));
    valorBoleta2     := strtofloat(RetiraFormatacaoNumero(Trim(edtValor2.Text)));
    if (edtValor3.Enabled) then
      valorBoleta3     := strtofloat(RetiraFormatacaoNumero(Trim(edtValor3.Text)));
    totalFinanciado1 := valorBoleta1 - valorEntrada1;
    totalFinanciado2 := valorBoleta2 - valorEntrada2;
    if (edtValEntrada3.Enabled) and (edtValor3.Enabled) then
      totalFinanciado3 := valorBoleta3 - valorEntrada3;
                //*******VERIFICA SE É UMA ATUALIZAÇÃO DE VALORES************************************
    if ((valorBoleta1Ant <> 0) and (valorBoleta2Ant <> 0)) or (valorBoleta3Ant <> 0) then
    begin
      if (entrada1 <> valorEntrada1Ant) or (entrada2 <> valorEntrada2Ant) or
        (entrada3 <> valorEntrada3Ant) or (valor1 <> valorBoleta1Ant) or
        (valor2 <> valorBoleta2Ant) or (valor3 <> valorBoleta3Ant) then
        frm_edtCliente.atualizaMultiBoleta := true
      else
        frm_edtCliente.atualizaMultiBoleta := false;
    end
    else
      frm_edtCliente.atualizaMultiBoleta := false;
                //***********************************************************************************
    close;
  end;
end;

procedure Tfrm_InfBoletaVenda.LimparEdits;
begin
  edtNumBoleta1.Text   := '';
  edtNumBoleta2.Text   := '';
  edtNumBoleta3.Text   := '';
  edtValEntrada1.Text  := '';
  edtValEntrada2.Text  := '';
  edtValEntrada3.Text  := '';
  edtValor1.Text       := '';
  edtValor2.Text       := '';
  edtValor3.Text       := '';
  edtTotalEntrada.Text := '';
  edtTotalValor.Text   := '';
end;

procedure Tfrm_InfBoletaVenda.edtNumBoleta2Exit(Sender: TObject);
var
  numBoleta2,numBoleta3: Real;
begin
  if (Trim(edtNumBoleta2.Text) <> '') then
    numBoleta2 := strtofloat(Trim(edtNumBoleta2.Text));
  if (Trim(edtNumBoleta3.Text) <> '') then
    numBoleta3 := strtofloat(Trim(edtNumBoleta3.Text));
  if Trim(edtNumBoleta1.Text) = form_nz(numBoleta2,6) then
  begin
    frmDialogo.ExibirMensagem ('O número da segunda boleta não pode ser igual ao da primeira boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta2.Text := form_nz(numBoleta2,6);
    edtNumBoleta2.SetFocus;
    edtNumBoleta2.SelectAll;
  end
  else
  if form_nz(numBoleta2,6) = form_nz(numBoleta3,6) then
  begin
    frmDialogo.ExibirMensagem ('O número da segunda boleta não pode ser igual ao da terceira boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta2.Text := form_nz(numBoleta2,6);
    edtNumBoleta2.SetFocus;
    edtNumBoleta2.SelectAll;
  end
  else
  if (Trim(edtNumBoleta2.Text) = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o número da segunda boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta2.SetFocus;
    edtNumBoleta2.SelectAll;
  end;
end;

procedure Tfrm_InfBoletaVenda.edtNumBoleta3Exit(Sender: TObject);
var
  numBoleta2,numBoleta3: Real;
begin
  if (Trim(edtNumBoleta2.Text) <> '') then
    numBoleta2 := strtofloat(Trim(edtNumBoleta2.Text));
  if (Trim(edtNumBoleta3.Text) <> '') then
    numBoleta3 := strtofloat(Trim(edtNumBoleta3.Text));
  if Trim(edtNumBoleta1.Text) = form_nz(numBoleta3,6) then
  begin
    frmDialogo.ExibirMensagem ('O número da terceira boleta não pode ser igual ao da primeira boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta3.Text := form_nz(numBoleta3,6);
    edtNumBoleta3.SetFocus;
    edtNumBoleta3.SelectAll;
  end
  else
  if form_nz(numBoleta2,6) = form_nz(numBoleta3,6) then
  begin
    frmDialogo.ExibirMensagem ('O número da terceira boleta não pode ser igual ao da segunda boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta3.Text := form_nz(numBoleta3,6);
    edtNumBoleta3.SetFocus;
    edtNumBoleta3.SelectAll;
  end
  else
  if (Trim(edtNumBoleta3.Text) = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o número da terceira boleta!'
      ,'Informações Boletas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumBoleta3.SetFocus;
    edtNumBoleta3.SelectAll;
  end;
end;

end.
