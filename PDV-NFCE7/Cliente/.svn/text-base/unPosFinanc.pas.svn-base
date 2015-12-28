unit unPosFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, ExtCtrls;

type
  Tfrm_PosFinanc = class(TForm)
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    lbF8mens: TLabel;
    lbF8: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    btnConfere: TButton;
    gPlano: TGroupBox;
    lbl: TLabel;
    edtcodigo: TMaskEdit;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    pnCliente: TPanel;
    edtCliente: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edtTipo: TMaskEdit;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfereClick(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtcodigoDblClick(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTipoEnter(Sender: TObject);
    procedure edtTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    flagCli: Integer;
    procedure LimparEdits;
  end;

var
  frm_PosFinanc: Tfrm_PosFinanc;

implementation

uses unDialogo, principal, mem_prnt, contratos, prestcontrato, funcoes1, funcoes2,
  f8Clientes, cliente, loja, relat, procura;

{$R *.DFM}

procedure Tfrm_PosFinanc.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_PosFinanc.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_PosFinanc.edtcodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {Mudando o metodo de pesquisa ***}
  if (key=K_ESC) then
  begin
    if (flagCli=0) then
    begin
      edtCodigo.editmask:='';
      lbl.caption := 'Cpf do cliente';
      flagCli:=1;
    end
    else
    begin
      edtCodigo.editmask:='!999999;1; ';
      lbl.caption := 'Código do cliente';
      flagCli:=0;
    end;
    edtCodigo.selectall;
    edtCodigo.setfocus;
  end;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      left:=287;
      top :=76;
      if (flagCli=0) then
        edit:=edtCodigo
      else
        edit:=edtCliente;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    if (Trim(edtCodigo.text)<>'') then
      if (flagCli=0) then
      begin
        pnCliente.caption:=ProcuraNomeClienteCod(strtofloat(Trim(edtCodigo.text)),self);
        edtCodigo.text := form_nz(strtofloat(Trim(edtCodigo.text)),6);
        edtcodigo.selectall;
      end
      else
        pnCliente.caption:=ProcuraNomeClienteCpf (Trim(edtCodigo.text),self);
    edtTipo.setfocus;
  end;
end;

procedure Tfrm_PosFinanc.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_PosFinanc.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtCodigo.setfocus;
end;

procedure Tfrm_PosFinanc.LimparEdits;
begin
  edtCodigo.text:='';
  edtTipo.text:='';
  pnCliente.caption:='';
end;

{Opcao de impressao do contrato/prestacoes ***}
procedure Tfrm_PosFinanc.Registrarbaixadodocumento1Click(Sender: TObject);
begin
     {CRITICA AOS DADOS ***}
  if (Trim(edtCodigo.text)='') then
  begin
    if (flagCli=0) then
      frmDialogo.ExibirMensagem ('O código do cliente não pode ficar nulo!',
        'Posição financeira',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
        250,200)
    else
      frmDialogo.ExibirMensagem ('O CNPJ do cliente não pode ficar nulo!',
        'Posição financeira',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
        250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtTipo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Selecione o status dos contratos!',
      'Posição financeira',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
      250,200);
    edtTipo.setfocus;
  end
  else
  if (Trim(edtTipo.text)='1') then
    RelatorioLiquidado (Trim(edtCodigo.text),1)
  else
    RelatorioEmAberto (Trim(edtCodigo.text),1);
end;

procedure Tfrm_PosFinanc.FormActivate(Sender: TObject);
begin
  if (flagCli=0) then
  begin
    edtCodigo.editmask:='!999999;1; ';
    lbl.caption := 'Código do cliente';
  end
  else
  begin
    edtCodigo.editmask:='';
    lbl.caption := 'Cpf do cliente';
  end;
  edtCodigo.setfocus;
end;

procedure Tfrm_PosFinanc.FormCreate(Sender: TObject);
begin
  flagCli:=0;
  edtTipo.text:='0';
end;

procedure Tfrm_PosFinanc.edtcodigoDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    left:=287;
    top :=76;
    if (flagCli=0) then
      edit:=edtCodigo
    else
      edit:=edtCliente;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_PosFinanc.edtcodigoEnter(Sender: TObject);
begin
  edtCodigo.selectall;
end;

procedure Tfrm_PosFinanc.edtClienteChange(Sender: TObject);
var
  clClient: TClassCliente;
begin
  if (Trim(edtCliente.text)<>'') then
  begin
    clClient := TClassCliente.Create;
    with (clClient) do
    begin
      conect ('CREDITO',self);
      AddParam ('Select CL_CODI,CL_CPF                     ');
      AddParam ('From   CRECLI                             ');
      AddParam ('Where  (CL_CODI='+Trim(edtCliente.text)+') ');
      Execute;
      edtCodigo.text := Result('CL_CPF');
      desconect;
      Free;
    end;
  end;
end;

procedure Tfrm_PosFinanc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_PosFinanc.edtTipoEnter(Sender: TObject);
begin
  edtTipo.selectall;
end;

procedure Tfrm_PosFinanc.edtTipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfere.click;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
end;

end.
