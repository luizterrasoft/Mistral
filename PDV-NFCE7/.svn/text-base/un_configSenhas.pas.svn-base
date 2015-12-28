unit un_configSenhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, CheckBoxOO, LabelOO, Mask,
  QuickRpt;

type
  Tfrm_configSenhas = class(TForm)
    BotaoSair1: TBotaoSair;
    btnAplicar: TPanel;
    Label6: TLabel;
    Label12: TLabel;
    Image2: TImage;
    LabelOO3: TLabelOO;
    Bevel3: TBevel;
    ch_solicitar_senha_TRANSFERENCIA: TCheckBoxOO;
    ch_solicitar_senha_DESCONTO: TCheckBoxOO;
    ch_solicitar_senha_TROCA_DEVOLUCAO: TCheckBoxOO;
    ch_solicitar_senha_CONF_CAIXA: TCheckBoxOO;
    ch_solicitar_senha_RECEB_CHEQ_DEV: TCheckBoxOO;
    ch_solicitar_senha_INVENTARIO: TCheckBoxOO;
    ch_solicitar_senha_MOVIMENTO: TCheckBoxOO;
    ch_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS: TCheckBoxOO;
    ch_solicitar_senha_LISTAGENS_VENDAS: TCheckBoxOO;
    ch_solicitar_senha_CONSULTA_VENDA: TCheckBoxOO;
    ch_solicitar_senha_ALTERACAO_PRECO_VENDA: TCheckBoxOO;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label7: TLabel;
    Bevel5: TBevel;
    edtSenha: TMaskEdit;
    Image1: TImage;
    Label1: TLabel;
    ch_solicitar_senha_SAIDA_LANCAMENTO_VENDA: TCheckBoxOO;
    ch_solicitar_senha_DESCONTO_VALE: TCheckBoxOO;
    Ch_Saldo: TCheckBoxOO;
    ch_solicitar_senha_CADASTRO_CLIENTE: TCheckBoxOO;
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
  frm_configSenhas: Tfrm_configSenhas;

implementation

uses principal, unDialogo;

{$R *.dfm}

procedure Tfrm_configSenhas.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;
end;

procedure Tfrm_configSenhas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_configSenhas.btnAplicarClick(Sender: TObject);
begin
  if (UpperCase(Trim(edtSenha.text))<>trim(frm_principal.x_senha_admin)) then
  begin
    frmDialogo.ExibirMensagem ('Senha de segurança incorreta! Alteração de loja não permitida!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSenha.setfocus;
  end
  else
  begin
    frm_principal.x_solicitar_senha_TRANSFERENCIA                 := ch_solicitar_senha_TRANSFERENCIA.checked;
    frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO               := ch_solicitar_senha_TROCA_DEVOLUCAO.checked;
    frm_principal.x_solicitar_senha_DESCONTO                      := ch_solicitar_senha_DESCONTO.checked;
    frm_principal.x_solicitar_senha_CONF_CAIXA                    := ch_solicitar_senha_CONF_CAIXA.checked;
    frm_principal.x_solicitar_senha_RECEB_CHEQ_DEV                := ch_solicitar_senha_RECEB_CHEQ_DEV.checked;
    frm_principal.x_solicitar_senha_INVENTARIO                    := ch_solicitar_senha_INVENTARIO.checked;
    frm_principal.x_solicitar_senha_MOVIMENTO                     := ch_solicitar_senha_MOVIMENTO.checked;
    frm_principal.x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS   := ch_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS.checked;
    frm_principal.x_solicitar_senha_LISTAGENS_VENDAS              := ch_solicitar_senha_LISTAGENS_VENDAS.checked;
    frm_principal.x_solicitar_senha_CONSULTA_VENDA                := ch_solicitar_senha_CONSULTA_VENDA.checked;
    frm_principal.x_solicitar_senha_ALTERACAO_PRECO_VENDA         := ch_solicitar_senha_ALTERACAO_PRECO_VENDA.checked;
    frm_principal.x_solicitar_senha_SAIDA_LANCAMENTO_VENDA        := ch_solicitar_senha_SAIDA_LANCAMENTO_VENDA.checked;
    frm_principal.x_solicitar_senha_DESCONTO_VALE                 := ch_solicitar_senha_DESCONTO_VALE.checked;
    frm_principal.x_solicitar_senha_saldo                         := ch_Saldo.checked;
    frm_principal.x_solicitar_senha_CADASTRO_CLIENTE              := ch_solicitar_senha_CADASTRO_CLIENTE.Checked;

         {********************************************************************}
    DeleteFile ('C:\NATIVA\VENDAS.ini');
    frm_principal.GravaConfigLocal_Caixa; {*}

    close;
  end;
end;

procedure Tfrm_configSenhas.FormActivate(Sender: TObject);
begin
  ch_solicitar_senha_TRANSFERENCIA.checked               := frm_principal.x_solicitar_senha_TRANSFERENCIA;
  ch_solicitar_senha_TROCA_DEVOLUCAO.checked             := frm_principal.x_solicitar_senha_TROCA_DEVOLUCAO;
  ch_solicitar_senha_DESCONTO.checked                    := frm_principal.x_solicitar_senha_DESCONTO;
  ch_solicitar_senha_CONF_CAIXA.checked                  := frm_principal.x_solicitar_senha_CONF_CAIXA;
  ch_solicitar_senha_RECEB_CHEQ_DEV.checked              := frm_principal.x_solicitar_senha_RECEB_CHEQ_DEV;
  ch_solicitar_senha_INVENTARIO.checked                  := frm_principal.x_solicitar_senha_INVENTARIO;
  ch_solicitar_senha_MOVIMENTO.checked                   := frm_principal.x_solicitar_senha_MOVIMENTO;
  ch_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS.checked := frm_principal.x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS;
  ch_solicitar_senha_LISTAGENS_VENDAS.checked            := frm_principal.x_solicitar_senha_LISTAGENS_VENDAS;
  ch_solicitar_senha_CONSULTA_VENDA.checked              := frm_principal.x_solicitar_senha_CONSULTA_VENDA;
  ch_solicitar_senha_ALTERACAO_PRECO_VENDA.checked       := frm_principal.x_solicitar_senha_ALTERACAO_PRECO_VENDA;
  ch_solicitar_senha_SAIDA_LANCAMENTO_VENDA.checked      := frm_principal.x_solicitar_senha_SAIDA_LANCAMENTO_VENDA;
  ch_solicitar_senha_DESCONTO_VALE.checked               := frm_principal.x_solicitar_senha_DESCONTO_VALE;
  ch_saldo.checked                                       := frm_principal.x_solicitar_senha_Saldo;
  ch_solicitar_senha_CADASTRO_CLIENTE.Checked            := frm_principal.x_solicitar_senha_CADASTRO_CLIENTE;
end;

procedure Tfrm_configSenhas.edtSenhaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_configSenhas.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_CIMA) then
  ;
  if (key=K_ENTER) then
    btnAplicarClick(btnAplicar);
end;

procedure Tfrm_configSenhas.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

end.
