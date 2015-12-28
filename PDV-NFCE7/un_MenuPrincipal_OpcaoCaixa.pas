unit un_MenuPrincipal_OpcaoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_MenuPrincipal_OpcaoCaixa = class(TForm)
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TPanel;
    Bevel1: TBevel;
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_MenuPrincipal_OpcaoCaixa: Tfrm_MenuPrincipal_OpcaoCaixa;

implementation

uses un_LancaVenda, un_VendaDeVales, un_SumarioVendas, funcoes1, funcoes2,
  un_SinteseVendasPorDia, un_ListaVendas, un_ConsultaVenda, principal,
  un_CaixaLancamentos, un_CaixaLancamentos_Contas,
  un_CaixaLancamentos_Consulta, unDialogo;

{$R *.DFM}

procedure Tfrm_MenuPrincipal_OpcaoCaixa.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
      botao3Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao2Click(Sender)
  else
  if (key=99) or (key=Ord('3')) then
    botao3Click(Sender);
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.botao1Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
  begin
    Application.CreateForm(Tfrm_CaixaLancamentos, frm_CaixaLancamentos);
    frm_CaixaLancamentos.showmodal;
    frm_CaixaLancamentos.Free;
  end
  else
    frmDialogo.ExibirMensagem ('Não foi definido um CAIXA ativo ainda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);     
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_CaixaLancamentos_Contas, frm_CaixaLancamentos_Contas);
  frm_CaixaLancamentos_Contas.qContas.databasename := databasecontas;
  frm_CaixaLancamentos_Contas.showmodal;
  frm_CaixaLancamentos_Contas.Free;
end;

procedure Tfrm_MenuPrincipal_OpcaoCaixa.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_CaixaLancamentos_Consulta, frm_CaixaLancamentos_Consulta);
  frm_CaixaLancamentos_Consulta.showmodal;
  frm_CaixaLancamentos_Consulta.Free;
end;

end.
