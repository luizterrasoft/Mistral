unit USenhaConfirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TfrmSenhaConfirmacao = class(TForm)
    Bevel1: TBevel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    edtSenha: TMaskEdit;
    Label1: TLabel;
    edtusuario: TMaskEdit;
    Label3: TLabel;
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtusuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cliente, contrato: String;
    continua: boolean;
  end;

var
  frmSenhaConfirmacao: TfrmSenhaConfirmacao;

implementation

uses principal, credito, funcoes1, funcoes2, auxiliar, unDialogo;

{$R *.dfm}

procedure TfrmSenhaConfirmacao.edtSenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_CIMA) then
    btnOk.Click;
  if (key = K_CIMA) then
    edtusuario.SetFocus;
end;

procedure TfrmSenhaConfirmacao.btnOkClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  vendedor: String;
begin
  vendedor := Trim(edtusuario.Text);
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,self);
  clAux.ClearSql;

  clAux.consulta.SQL.Add('SELECT VD_NOME,VD_CODI FROM VENDEDORES ');
  clAux.consulta.SQL.Add('WHERE (VD_APEL=:APELIDO) AND           ');
  clAux.consulta.SQL.Add('      (VD_SENH=:SENHA)                 ');
  clAux.consulta.Params.ParamByName('APELIDO').AsString := LowerCase(Trim(edtusuario.Text));
  clAux.consulta.Params.ParamByName('SENHA').AsString   := LowerCase(Trim(edtSenha.Text));
  clAux.consulta.Open;
  if (clAux.consulta.RecordCount = 0) then
  begin
    frmDialogo.ExibirMensagem ('Senha incorreta!',
        'Senha Incorreta',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSenha.SetFocus;
    edtSenha.SelectAll;
    continua := false;
    exit;
  end
  else
  begin
    AuditaOperacao(14,clAux.Result('VD_CODI'),Trim(form_t(clAux.Result('VD_NOME'),40)), 'MÓDULO: VENDAS / CLIE: '+cliente+' / CONT: '+contrato+'');
    continua := true;
    Close;
  end;
  clAux.Desconect;
  clAux.Free;
end;

procedure TfrmSenhaConfirmacao.FormCreate(Sender: TObject);
begin
  continua := false;
end;

procedure TfrmSenhaConfirmacao.edtusuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSenha.SetFocus;
end;

procedure TfrmSenhaConfirmacao.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
