//***********************************************************************************************************
//SUGESTAO DE PROTECAO DO CODIGO DA LOJA: (1) Pode-se usar um algoritimo de calculo do DV, concatenando-se
//                                            o código da loja com o numero serial do HD.
//                                        (2) Se for ON LINE, o sistema pode pegar no frame-relay uma
//                                            tabela que informe qual loja o HD deve trabalhar.
//***********************************************************************************************************
unit un_MudarLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Menus, jpeg;

type
  Tfrm_MudarLoja = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtNumero1: TMaskEdit;
    edtNumero2: TMaskEdit;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Abrirsesso1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    botao1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Label7: TLabel;
    edtSenha: TMaskEdit;
    Bevel2: TBevel;
    Image1: TImage;
    procedure edtNumero1Enter(Sender: TObject);
    procedure edtNumero2Enter(Sender: TObject);
    procedure edtNumero2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    y_loja: Real;
  end;

var
  frm_MudarLoja: Tfrm_MudarLoja;

implementation

uses unDialogo, principal, funcoes1, funcoes2, procura, f8Users, auxiliar;

{$R *.DFM}

procedure Tfrm_MudarLoja.edtNumero1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarLoja.edtNumero2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarLoja.edtNumero2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSenha.setfocus;
end;

procedure Tfrm_MudarLoja.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MudarLoja.Limparformulrio1Click(Sender: TObject);
begin
  edtNumero2.text := '';
  edtSenha.text   := '';
  edtNumero2.setfocus;
end;

procedure Tfrm_MudarLoja.Abrirsesso1Click(Sender: TObject);
var
  clSeq: TClassAuxiliar;
begin
     {CRITICA}
  if (Trim(edtNumero2.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O novo código da loja não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumero2.setfocus;
  end
  else
  if (Trim(edtSenha.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Senha de segurança deve ser informada! Alteração de loja não permitida!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSenha.setfocus;
  end
  else
  if (UpperCase(Trim(edtSenha.text))<>trim(frm_principal.x_senha_admin)) then
  begin
    frmDialogo.ExibirMensagem ('Senha de segurança incorreta! Alteração de loja não permitida!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSenha.setfocus;
  end
  else
  begin
    y_loja := strtofloat(Trim(edtNumero2.text));
          {*************************************************************}
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    if (frm_principal.x_tipo_funcionamento_sistema<>0) then
      clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET CODIGO_LOJA=:codigo_loja ')
    else
      clSeq.AddParam ('UPDATE SEQATDO.DBF SET CODIGO_LOJA=:codigo_loja ');
    clSeq.consulta.parambyname('codigo_loja').AsFloat := y_loja;
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
          {*************************************************************}
    close;
  end;
end;

procedure Tfrm_MudarLoja.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_MudarLoja.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    botao_sairClick(sender);
end;

procedure Tfrm_MudarLoja.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtNumero1.text := floattostr(y_loja);
  edtNumero2.text := floattostr(y_loja);
  edtNumero2.setfocus;
end;

procedure Tfrm_MudarLoja.botao1Click(Sender: TObject);
begin
  Abrirsesso1.click;
end;

procedure Tfrm_MudarLoja.edtSenhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarLoja.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtNumero2.setfocus;
  if (key=K_ENTER) then
    botao1Click(Sender);
end;

end.
