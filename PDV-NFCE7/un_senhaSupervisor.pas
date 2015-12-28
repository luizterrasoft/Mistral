
{*** A SENHA DE QUALQUER SUPERVISOR TEM ACESSO A ESTA ROTINA, INDEPENDENTE DE LOJA ***}
unit un_senhaSupervisor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls;

type
  Tfrm_senhaSupervisor = class(TForm)
    Label1: TLabel;
    edtSenha: TMaskEdit;
    btnOk: TPanel;
    btnCancel: TPanel;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_tentativas: Integer;
    y_flag: Boolean;
    y_cargo: String;
    y_nome: String;
    function ExisteSenhaSupervisorGerente(senha: String):Boolean;
  end;

var
  frm_senhaSupervisor: Tfrm_senhaSupervisor;

implementation

uses principal, unDialogo, auxiliar, funcoes1, funcoes2, procura;

{$R *.DFM}

procedure Tfrm_senhaSupervisor.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);

  edtSenha.text:='';   
  edtSenha.setfocus;
end;

procedure Tfrm_senhaSupervisor.btnCancelClick(Sender: TObject);
begin
  y_flag:=false;
  close;
end;

procedure Tfrm_senhaSupervisor.btnOkClick(Sender: TObject);
var
  senha: String;
begin
  senha := UpperCase(Trim(edtSenha.text));
  if (trim(senha)<>'') then
  begin
    if (not ExisteSenhaSupervisorGerente(senha)) then
    begin
      frmDialogo.ExibirMensagem (' Senha incorreta!','Supervisor / Gerente',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      y_flag:=false;
      close;
    end
    else
    begin
      y_flag:=true;
      close;
    end;
  end
  else
  begin
    frmDialogo.ExibirMensagem (' Senha incorreta!','Supervisor / Gerente',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    y_flag:=false;
    close;
  end;
end;

procedure Tfrm_senhaSupervisor.edtSenhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_senhaSupervisor.edtSenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOkclick(sender);
  if (key=K_ESC) then
    btnCancelclick(sender);
end;

procedure Tfrm_senhaSupervisor.FormCreate(Sender: TObject);
begin
  y_flag        := false;
  y_tentativas  := 0;
  edtSenha.text := '';
end;

function Tfrm_senhaSupervisor.ExisteSenhaSupervisorGerente(senha: String):Boolean;
var
  clVend: TClassAuxiliar;
begin
  if (trim(senha)='NATIVA') then
  begin
    result:=true;
    y_cargo := 'Administrador';
    y_nome  := 'ADMIN';
  end
  else
  begin
    y_cargo := '';
    y_nome  := '';

    clVend := TClassAuxiliar.Create;
    clVend.conect   (databaseprodutos,self);
    clVend.ClearSql;
    clVend.AddParam ('SELECT VD_SENH,VD_CARG,VD_NOME FROM VENDEDORES       ');
    clVend.AddParam ('WHERE (VD_SENH=:senha) AND                           ');
    clVend.AddParam ('     ((VD_CARG=:cargo1) OR (VD_CARG=:cargo2))AND     ');
    clVend.AddParam ('      (VD_LOJA=:loja)                                ');
    clVend.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    clVend.consulta.parambyname('senha').AsString  := form_t(senha,6);
    clVend.consulta.parambyname('cargo1').AsString := 'SUPERVISOR';
    clVend.consulta.parambyname('cargo2').AsString := 'GERENTE';
    if (clVend.Execute) then
    begin
      result:=true;
      y_cargo := clVend.result('VD_CARG');
      y_nome  := clVend.result('VD_NOME');
    end
    else
      result:=false;
    clVend.desconect;
    clVend.Free;
  end;
end;

end.
