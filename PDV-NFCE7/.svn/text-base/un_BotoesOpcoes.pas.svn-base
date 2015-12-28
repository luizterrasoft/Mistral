unit un_BotoesOpcoes;

interface                                     

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus;

type
  Tfrm_BotoesOpcoes = class(TForm)
    botao1: TPanel;
    Bevel1: TBevel;
    btnFechar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure botao4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesOpcoes: Tfrm_BotoesOpcoes;

implementation

uses un_senhaSupervisor, un_MudarLoja, principal, funcoes1, funcoes2, procura,
  un_MudarOp, un_MudarTerminal, un_SumarioVendas, un_ConfigLocal, un_Indexar,
  un_BotoesMovimento, unDialogo, un_BotoesECF,
  un_BotoesOpcoes_SubMenuVendas, un_MudarECF, un_MudarSeqVenda,
  un_LancaVenda, un_TrocaVendedorNaVenda, un_BuscaAtendimento,
  un_BotoesInventario, un_BotoesManut, un_configSenhas, unSangria;

{$R *.DFM}

procedure Tfrm_BotoesOpcoes.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_BotoesOpcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (key=13) then
    if (botao1.color=clWhite) then
      botao1Click(Sender)
    else
    if (botao2.color=clWhite) then
      botao2Click(Sender)
    else
    if (botao3.color=clWhite) then
      botao3Click(Sender)
    else
    if (botao4.color=clWhite) then
      botao4Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao2Click(Sender)
  else
  if (key=99) or (key=Ord('3')) then
    botao3Click(Sender)
  else
  if (key=100) or (key=Ord('4')) then
    botao4Click(Sender);
end;

procedure Tfrm_BotoesOpcoes.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesOpcoes.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
end;

procedure Tfrm_BotoesOpcoes.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
  botao4.color := clTeal;
  botao4.font.color := clWhite;
end;

procedure Tfrm_BotoesOpcoes.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_BotoesManut, frm_BotoesManut);
  frm_BotoesManut.showmodal;
  frm_BotoesManut.Free;
end;

procedure Tfrm_BotoesOpcoes.botao2Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_MOVIMENTO) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_BotoesMovimento,frm_BotoesMovimento);
      frm_BotoesMovimento.showmodal;
      frm_BotoesMovimento.Free;
    end
  end
  else
  begin
    Application.CreateForm(Tfrm_BotoesMovimento,frm_BotoesMovimento);
    frm_BotoesMovimento.showmodal;
    frm_BotoesMovimento.Free;
  end;
end;

procedure Tfrm_BotoesOpcoes.botao3Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_INVENTARIO) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_BotoesInventario, frm_BotoesInventario);
      frm_BotoesInventario.showmodal;
      frm_BotoesInventario.Free;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_BotoesInventario, frm_BotoesInventario);
    frm_BotoesInventario.showmodal;
    frm_BotoesInventario.Free;
  end;
end;

procedure Tfrm_BotoesOpcoes.botao4Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption=' Caixa: INDEFINIDO') then
  begin
    frmDialogo.ExibirMensagem ('Não foi definido um CAIXA ativo ainda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    exit;
  end;

  Application.CreateForm(TfrmSangria, frmSangria);
  frmSangria.showmodal;
  frmSangria.Free;
end;

end.
