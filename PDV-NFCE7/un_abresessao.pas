unit un_abresessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Menus;

type
  Tfrm_AbreSessao = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    Label1: TLabel;
    edtHoraAbertura: TMaskEdit;
    Label2: TLabel;
    edtOperador: TMaskEdit;
    pnOperador: TPanel;
    Label3: TLabel;
    edtValor: TMaskEdit;
    edtLoja: TMaskEdit;
    Label4: TLabel;
    pnLoja: TPanel;
    Label5: TLabel;
    edtCaixa: TMaskEdit;
    pnCaixa: TPanel;
    btnAbrirSessao: TButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Abrirsesso1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    Label6: TLabel;
    edtData: TMaskEdit;
    Panel1: TPanel;
    Bevel8: TBevel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnLeituraX: TButton;
    N2: TMenuItem;
    EmitirLeituraXdaImpressoraFiscal1: TMenuItem;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtHoraAberturaEnter(Sender: TObject);
    procedure edtOperadorEnter(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtHoraAberturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtOperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAbrirSessaoClick(Sender: TObject);
    procedure edtOperadorExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDataEnter(Sender: TObject);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataExit(Sender: TObject);
    procedure btnLeituraXClick(Sender: TObject);
    procedure EmitirLeituraXdaImpressoraFiscal1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AbreSessao: Tfrm_AbreSessao;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura, unDialogo, auxiliar,
  un_exibesituacao;

procedure Tfrm_AbreSessao.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_AbreSessao.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_AbreSessao.Limparformulrio1Click(Sender: TObject);
begin
  edtData.text         := form_data(date);
  edtHoraAbertura.text := '  :  ';
  edtOperador.text     := '';
  pnOperador.caption   := '';
  edtValor.text        := '';
  edtHoraAbertura.setfocus;
end;

procedure Tfrm_AbreSessao.FormActivate(Sender: TObject);
begin
  edtData.setfocus;
end;

procedure Tfrm_AbreSessao.edtHoraAberturaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_AbreSessao.edtOperadorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_AbreSessao.edtValorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_AbreSessao.edtHoraAberturaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtOperador.setfocus;
  if (key=K_CIMA) then
    edtData.setfocus;
end;

procedure Tfrm_AbreSessao.edtOperadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtValor.setfocus;
  if (key=K_CIMA) then
    edtHoraAbertura.setfocus;
end;

procedure Tfrm_AbreSessao.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAbrirSessao.click;
  if (key=K_CIMA) then
    edtOperador.setfocus;
end;

procedure Tfrm_AbreSessao.btnAbrirSessaoClick(Sender: TObject);
begin
  Abrirsesso1.click;
end;

procedure Tfrm_AbreSessao.edtOperadorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtOperador.text);
  if (codigo<>'') then
  begin
    pnOperador.caption:=ProcuraNomeUsuario(strtofloat(codigo),self);
    edtOperador.text:=form_nz(strtofloat(codigo),2);
  end;
end;

procedure Tfrm_AbreSessao.edtValorExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtValor);
end;

procedure Tfrm_AbreSessao.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico(edtValor);
end;

procedure Tfrm_AbreSessao.FormCreate(Sender: TObject);
begin
  edtLoja.text       := form_nz(frm_principal.x_loja,2);
  pnLoja.caption     := ProcuraNomeLoja(frm_principal.x_loja,self);
  edtCaixa.text      := form_nz(frm_principal.x_terminal,2);
  pnCaixa.caption := ProcuraNomeCaixa(frm_principal.x_loja,frm_principal.x_terminal,self);
end;

procedure Tfrm_AbreSessao.Abrirsesso1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {CRITICA}
  if (Trim(edtLoja.text)='') then
  begin
    frmDialogo.ExibirMensagem ('A loja não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtLoja.setfocus;
  end
  else
  if (Trim(edtCaixa.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código do caixa não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCaixa.setfocus;
  end
  else
  if (edtData.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem ('A data de abertura da sessão não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData.setfocus;
  end
  else
  if (Trim(edtHoraAbertura.text)=':') then
  begin
    frmDialogo.ExibirMensagem ('A hora de abertura da sessão não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtHoraAbertura.setfocus;
  end
  else
  if (Trim(edtOperador.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O operador não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtOperador.setfocus;
  end
  else
  if (Trim(edtValor.text)='') or (Trim(edtValor.text)='0,00') then
  begin
    frmDialogo.ExibirMensagem ('O valor inicial da gaveta não pode ser nulo!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  if (frmDialogo.ExibirMensagem ('Confirma abertura de sessão?'
    ,'Vendas',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
            {...}
    clAux := TClassAuxiliar.Create;
    clAux.conect  ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam('SELECT * FROM SESSAO_CAIXA                                  ');
    clAux.AddParam('WHERE (SC_LOJA='+floattostr(frm_principal.x_loja)+') AND                  ');
    clAux.AddParam('      (SC_CAIX='+floattostr(frm_principal.x_terminal)+') AND                 ');
    clAux.AddParam('      (SC_DATA='+chr(39)+FormataData(strtodate(Trim(edtData.text)))+chr(39)+')       ');
    if (clAux.Execute) then
    begin
      frmDialogo.ExibirMensagem ('Já houve sessão nesta data!'
        ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtData.setfocus;
    end
    else
    begin
              {Abrindo a sessao}
      clAux.ClearSql;
      clAux.AddParam('INSERT INTO SESSAO_CAIXA (SC_LOJA,SC_CAIX,SC_DATA,SC_HORA,  ');
      clAux.AddParam('  SC_HORF,SC_OPER,SC_VALA,SC_VALF,SC_VALO,SC_STAT)          ');
      clAux.AddParam('VALUES (:SC_LOJA,:SC_CAIX,:SC_DATA,:SC_HORA,                ');
      clAux.AddParam('  :SC_HORF,:SC_OPER,:SC_VALA,:SC_VALF,:SC_VALO,:SC_STAT)    ');
      clAux.consulta.parambyname('SC_LOJA').AsFloat := frm_principal.x_loja;
      clAux.consulta.parambyname('SC_CAIX').AsFloat := frm_principal.x_terminal;
      clAux.consulta.parambyname('SC_DATA').AsDateTime := strtodate(Trim(edtData.text));
      clAux.consulta.parambyname('SC_HORA').AsString   := Trim(edtHoraAbertura.text);
      clAux.consulta.parambyname('SC_HORF').AsString   := '';
      if (Trim(edtOperador.text)<>'') then
        clAux.consulta.parambyname('SC_OPER').AsFloat := strtofloat(Trim(edtOperador.text))
      else
        clAux.consulta.parambyname('SC_OPER').AsFloat := 0.00;
      if (Trim(edtValor.text)<>'') then
        clAux.consulta.parambyname('SC_VALA').AsFloat := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)))
      else
        clAux.consulta.parambyname('SC_VALA').AsFloat := 0.00;
      clAux.consulta.parambyname('SC_VALO').AsFloat := clAux.consulta.parambyname('SC_VALA').AsFloat;
      clAux.consulta.parambyname('SC_VALF').AsFloat := 0.00;
      clAux.consulta.parambyname('SC_STAT').AsString := '1'; {sessao aberta}
      clAux.Execute;

              {*** Reconfigurando o programa}
      frm_ExibeSituacao.flagFecha := false;
              {frm_principal.botaoOperador.caption  := ' Op: '+form_t(ProcuraNomeOp(clAux.consulta.parambyname('SC_OPER').AsFloat,self),10);
              frm_principal.botaoHoraAbertura.caption := ' Abertura: '+clAux.consulta.parambyname('SC_HORA').AsString;
              frm_principal.botaoCaixa.caption     := ' N. Terminal: '+form_nz(frm_principal.x_terminal,2)+' '+ProcuraNomeSit('1',self);}

              {*** Armazena no historico a situacao atual}
      clAux.ClearSql;
      clAux.AddParam('INSERT INTO HISTORICO_SITUACOES(HS_LOJA,HS_CAIX,HS_DATA,      ');
      clAux.AddParam('       HS_STAT,HS_HORA)                                       ');
      clAux.AddParam('VALUES (:HS_LOJA,:HS_CAIX,:HS_DATA,:HS_STAT,:HS_HORA)         ');
      clAux.consulta.parambyname('HS_LOJA').AsFloat    := frm_principal.x_loja;
      clAux.consulta.parambyname('HS_CAIX').AsFloat    := frm_principal.x_terminal;
      clAux.consulta.parambyname('HS_DATA').AsDateTime := date;
      clAux.consulta.parambyname('HS_STAT').AsString   := '1';
      clAux.consulta.parambyname('HS_HORA').AsString   := Trim(edtHoraAbertura.text);
      clAux.Execute;
      clAux.desconect;
      clAux.Free;
      close;
    end;
  end;
end;

procedure Tfrm_AbreSessao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_AbreSessao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (not frm_ExibeSituacao.flagFecha) then
    frm_ExibeSituacao.close;
end;

procedure Tfrm_AbreSessao.edtDataEnter(Sender: TObject);
begin
  if (edtData.text='  /  /    ') then
    edtData.text:=form_data(date);   
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_AbreSessao.edtDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtHoraAbertura.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_AbreSessao.edtDataExit(Sender: TObject);
begin
  if (not IsDate (edtData.text) and (edtData.text<>'  /  /  ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data da sessão',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtData.setfocus;
  end;
end;

procedure Tfrm_AbreSessao.btnLeituraXClick(Sender: TObject);
begin
  EmitirLeituraXdaImpressoraFiscal1.click;
end;

procedure Tfrm_AbreSessao.EmitirLeituraXdaImpressoraFiscal1Click(
  Sender: TObject);
begin
  if (frmDialogo.ExibirMensagem ('Confirma emissão de leitura X da impressora fiscal?'
    ,'Vendas',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    showmessage('EMITINDO LEITURA X! TRABALHO DA IMPRESSORA INICIADO!');
end;

end.
