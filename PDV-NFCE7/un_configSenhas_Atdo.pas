unit un_configSenhas_Atdo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, CheckBoxOO, LabelOO, Mask;

type
  Tfrm_configSenhas_Atdo = class(TForm)
    BotaoSair1: TBotaoSair;
    btnAplicar: TPanel;
    Label6: TLabel;
    Label12: TLabel;
    Image2: TImage;
    LabelOO3: TLabelOO;
    Bevel3: TBevel;
    ch_solicitar_senha_TRANSFERENCIAS_Atdo: TCheckBoxOO;
    ch_solicitar_senha_OPCOES_Atdo: TCheckBoxOO;
    ch_solicitar_senha_LISTAGENS_Atdo: TCheckBoxOO;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label7: TLabel;
    Bevel5: TBevel;
    edtSenha: TMaskEdit;
    Image1: TImage;
    Label1: TLabel;
    ch_solicitar_senha_DESCONTO_Atdo: TCheckBoxOO;
    ch_solicitar_senha_TROCA_DEVOLUCAO_Atdo: TCheckBoxOO;
    AltPrecoAtend: TCheckBoxOO;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BotaoSair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_configSenhas_Atdo: Tfrm_configSenhas_Atdo;

implementation

uses principal, unDialogo;

{$R *.dfm}

procedure Tfrm_configSenhas_Atdo.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;
end;

procedure Tfrm_configSenhas_Atdo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_configSenhas_Atdo.btnAplicarClick(Sender: TObject);
begin
  if (UpperCase(Trim(edtSenha.text))<>trim(frm_principal.x_senha_admin)) then
  begin
    frmDialogo.ExibirMensagem ('Senha de segurança incorreta! Alteração de loja não permitida!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSenha.setfocus;
  end
  else
  begin
    frm_principal.x_solicitar_senha_OPCOES_Atdo          := ch_solicitar_senha_OPCOES_Atdo.checked;
    frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO_Atdo := ch_solicitar_senha_TROCA_DEVOLUCAO_Atdo.checked;
    frm_principal.x_solicitar_senha_TRANSFERENCIAS_Atdo  := ch_solicitar_senha_TRANSFERENCIAS_Atdo.checked;
    frm_principal.x_solicitar_senha_LISTAGENS_Atdo       := ch_solicitar_senha_LISTAGENS_Atdo.checked;
    frm_principal.x_solicitar_senha_DESCONTO_Atdo        := ch_solicitar_senha_DESCONTO_Atdo.checked;
    frm_principal.x_AltPrecoAtend                        := AltPrecoAtend.checked;

         {********************************************************************}
    DeleteFile ('C:\NATIVA\ATENDIMENTO.ini');
    frm_principal.GravaConfigLocal_Atdo; {*}

    close;
  end;
end;

procedure Tfrm_configSenhas_Atdo.FormActivate(Sender: TObject);
begin
  ch_solicitar_senha_OPCOES_Atdo.checked          := frm_principal.x_solicitar_senha_OPCOES_Atdo;
  ch_solicitar_senha_TROCA_DEVOLUCAO_Atdo.checked := frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO_Atdo;
  ch_solicitar_senha_TRANSFERENCIAS_Atdo.checked  := frm_principal.x_solicitar_senha_TRANSFERENCIAS_Atdo;
  ch_solicitar_senha_LISTAGENS_Atdo.checked       := frm_principal.x_solicitar_senha_LISTAGENS_Atdo;
  ch_solicitar_senha_DESCONTO_Atdo.checked        := frm_principal.x_solicitar_senha_DESCONTO_Atdo;
  AltPrecoAtend.checked                           := frm_principal.x_AltPrecoAtend;
end;

procedure Tfrm_configSenhas_Atdo.edtSenhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_configSenhas_Atdo.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_CIMA) then
  ;
  if (key=K_ENTER) then
    btnAplicarClick(btnAplicar);
end;

procedure Tfrm_configSenhas_Atdo.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

end.
