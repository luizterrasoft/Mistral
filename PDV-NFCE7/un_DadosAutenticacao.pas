unit un_DadosAutenticacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables;

type
  Tfrm_DadosAutenticacao = class(TForm)
    Label1: TLabel;
    edtEmpresa: TMaskEdit;
    Label2: TLabel;
    edtEndereco: TMaskEdit;
    Label3: TLabel;
    edtBairro: TMaskEdit;
    Label4: TLabel;
    edtCidade: TMaskEdit;
    Label5: TLabel;
    edtEstado: TMaskEdit;
    Label6: TLabel;
    edtCep: TMaskEdit;
    Label7: TLabel;
    edtTelefone: TMaskEdit;
    Label8: TLabel;
    edtCnpj: TMaskEdit;
    Label9: TLabel;
    edtFax: TMaskEdit;
    Label10: TLabel;
    edtInsc: TMaskEdit;
    Bevel1: TBevel;
    qAutentica: TQuery;
    Label11: TLabel;
    edtEmail: TMaskEdit;
    Image2: TImage;
    Label12: TLabel;
    Label13: TLabel;
    btnOk: TPanel;
    btnCancelar: TPanel;
    Bevel2: TBevel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtEmpresaEnter(Sender: TObject);
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FocusControle(controle: TWinControl; direcao: Boolean; tecla: Integer);
  end;

var
  frm_DadosAutenticacao: Tfrm_DadosAutenticacao;

implementation

uses principal;

{$R *.DFM}

procedure Tfrm_DadosAutenticacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    btnCancelarClick(Sender);
end;

procedure Tfrm_DadosAutenticacao.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtEmpresa.setfocus;
  edtEmpresa.text  := frm_principal.x_empresa;
  edtEndereco.text := frm_principal.x_endereco;
  edtBairro.text   := frm_principal.x_bairro;
  edtCidade.text   := frm_principal.x_cidade;
  edtEstado.text   := frm_principal.x_uf;
  edtCep.text      := frm_principal.x_cep;
  edtTelefone.text := frm_principal.x_telefone;
  edtEmail.text    := frm_principal.x_email;
  edtCnpj.text     := frm_principal.x_cnpj;
  edtFax.text      := frm_principal.x_fax;
  edtInsc.text     := frm_principal.x_insc;
end;

procedure Tfrm_DadosAutenticacao.FocusControle(controle: TWinControl; direcao: Boolean; tecla: Integer);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind,indAnt: Integer;
  flagFocus: Boolean;
begin
  flagFocus:=true;
  Lista:=TList.Create;
  frm_DadosAutenticacao.GetTabOrderList(Lista);
  ind:=TWinControl(controle).TabOrder;
  indAnt:=ind;
  if (direcao) then
  begin
    while (true) do
    begin
      ind:=ind+1;
      if (TWinControl(Lista.items[ind]).enabled) then
      begin
        if (ind<=Lista.count) then
          proxcontrole:=Lista.items[ind]
        else
          proxcontrole:= Lista.items[0];
        break;
      end
      else
      if (TWinControl(Lista.items[ind]).Name='edtObs') then
        if (tecla=13) then
        begin
          btnOkClick(btnOk);
          flagFocus:=false;
          break;
        end
        else
        if (tecla=40) then
          proxcontrole:= Lista.items[indAnt];
    end;
  end
  else
    while (true) do
    begin
      ind:=ind-1;
      if (TWinControl(Lista.items[ind]).enabled) then
      begin
        if (ind>=0) then
          proxcontrole:=Lista.items[ind]
        else
          proxcontrole:= Lista.items[Lista.count-1];
        break;
      end;
    end;
  if (flagFocus) then
    proxcontrole.setfocus;
  Lista.Free;
end;

procedure Tfrm_DadosAutenticacao.edtEmpresaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_DadosAutenticacao.edtEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true,key);
  if (key=38) then
    FocusControle(TWinControl(sender),false,key);
end;

procedure Tfrm_DadosAutenticacao.edtEmpresaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true,key);
  if (key=38) then
  ;
end;

procedure Tfrm_DadosAutenticacao.edtEmailKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnOkClick(Sender);
  if (key=38) then
    FocusControle(TWinControl(sender),false,key);
end;

procedure Tfrm_DadosAutenticacao.btnOkClick(Sender: TObject);
begin
     {*** dados default}
  if (Trim(edtEmpresa.text)='') then
  begin
    showmessage('Nome da empresa não pode ficar vazia!');
    edtEmpresa.setfocus;
  end
  else
  begin
    frm_principal.x_empresa  := Trim(edtEmpresa.text);
    frm_principal.x_endereco := Trim(edtEndereco.text);
    frm_principal.x_bairro   := Trim(edtBairro.text);
    frm_principal.x_cidade   := Trim(edtCidade.text);
    frm_principal.x_uf       := Trim(edtEstado.text);
    frm_principal.x_cep      := Trim(edtCep.text);
    frm_principal.x_telefone := Trim(edtTelefone.text);
    frm_principal.x_email    := Trim(edtEmail.text);
    frm_principal.x_cnpj     := Trim(edtCnpj.text);
    frm_principal.x_fax      := Trim(edtFax.text);
    frm_principal.x_insc     := Trim(edtInsc.text);
         {............................................................................}
    qAutentica.parambyname('ENDERECO').AsString := frm_principal.x_endereco;
    qAutentica.parambyname('BAIRRO').AsString := frm_principal.x_bairro;
    qAutentica.parambyname('CIDADE').AsString := frm_principal.x_cidade;
    qAutentica.parambyname('UF').AsString := frm_principal.x_uf;
    qAutentica.parambyname('CNPJ').AsString := frm_principal.x_cnpj;
    qAutentica.parambyname('CEP').AsString := frm_principal.x_cep;
    qAutentica.parambyname('TELEFONE').AsString := frm_principal.x_telefone;
    qAutentica.parambyname('EMAIL').AsString := frm_principal.x_email;
    qAutentica.parambyname('FAX').AsString := frm_principal.x_fax;
    qAutentica.parambyname('INSC').AsString := frm_principal.x_insc;
    qAutentica.ExecSql;
         {............................................................................}
    close;
  end;
end;

procedure Tfrm_DadosAutenticacao.btnCancelarClick(Sender: TObject);
begin
  close;
end;

end.
