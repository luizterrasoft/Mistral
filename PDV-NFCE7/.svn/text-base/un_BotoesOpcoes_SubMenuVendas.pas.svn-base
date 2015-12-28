unit un_BotoesOpcoes_SubMenuVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  Tfrm_BotoesOpcoes_SubMenuVendas = class(TForm)
    Panel1: TPanel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    procedure botao1Click(Sender: TObject);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2Click(Sender: TObject);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3Click(Sender: TObject);
    procedure botao4Click(Sender: TObject);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesOpcoes_SubMenuVendas: Tfrm_BotoesOpcoes_SubMenuVendas;

implementation

uses un_SumarioVendas, funcoes1, funcoes2, principal,
  un_SinteseVendasPorDia, un_ListaVendas, un_ConsultaVenda;

{$R *.DFM}

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SumarioVendas, frm_SumarioVendas);
  frm_SumarioVendas.edtData.text := form_data(frm_principal.x_data_trabalho);
  frm_SumarioVendas.showmodal;
  frm_SumarioVendas.Free;
end;

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes_SubMenuVendas.ApagaTudo;
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

procedure Tfrm_BotoesOpcoes_SubMenuVendas.FormKeyDown(Sender: TObject;
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

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SinteseVendasPorDia,frm_SinteseVendasPorDia);
  frm_SinteseVendasPorDia.showmodal;
  frm_SinteseVendasPorDia.Free;
end;

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ListaVendas, frm_ListaVendas);
  frm_ListaVendas.showmodal;
  frm_ListaVendas.Free;
end;

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao4Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaVenda, frm_ConsultaVenda);
  frm_ConsultaVenda.left   := 0;
  frm_ConsultaVenda.top    := 0;
  frm_ConsultaVenda.width  := 800;
  frm_ConsultaVenda.height := 600;
  frm_ConsultaVenda.Modo   := K_MODO_CONSULTA_VENDA_NORMAL;
  frm_ConsultaVenda.showmodal;
  frm_ConsultaVenda.Free;
end;

procedure Tfrm_BotoesOpcoes_SubMenuVendas.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

end.
