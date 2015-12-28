unit un_botoesListagensAtdo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfrm_botoesListagensAtdo = class(TForm)
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    botao6: TPanel;
    btnFechar: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    botao5: TPanel;
    botao1: TPanel;
    botao7: TPanel;
    Botao8: TPanel;
    procedure botao3Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao4Click(Sender: TObject);
    procedure botao6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao5Click(Sender: TObject);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure botao7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao7Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Botao8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_botoesListagensAtdo: Tfrm_botoesListagensAtdo;

implementation

uses un_SinteseVendasPorDia, un_SumarioVendas, un_ListaVendas,
  un_ListaMaisVend2, funcoes1, funcoes2, principal,
  un_ListaVendasAtendimento, un_ListaAtendimentos, un_PromocoesAVencer;

{$R *.dfm}

procedure Tfrm_botoesListagensAtdo.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SinteseVendasPorDia ,frm_SinteseVendasPorDia);
  frm_SinteseVendasPorDia.showmodal;
  frm_SinteseVendasPorDia.Free;
end;

procedure Tfrm_botoesListagensAtdo.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SumarioVendas, frm_SumarioVendas);
  frm_SumarioVendas.edtData.text := form_data(frm_principal.x_data_trabalho);
  frm_SumarioVendas.showmodal;
  frm_SumarioVendas.Free;
end;

procedure Tfrm_botoesListagensAtdo.botao4Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ListaVendas, frm_ListaVendas);
  frm_ListaVendas.showmodal;
  frm_ListaVendas.Free;
end;

procedure Tfrm_botoesListagensAtdo.botao6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ListaMaisVend2, frm_ListaMaisVend2);
  frm_ListaMaisVend2.showmodal;
  frm_ListaMaisVend2.Free;
end;

procedure Tfrm_botoesListagensAtdo.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
  botao4.color := clTeal;
  botao4.font.color := clWhite;
  botao5.color := clTeal;
  botao5.font.color := clWhite;
  botao6.color := clTeal;
  botao6.font.color := clWhite;
  botao7.color := clTeal;
  botao7.font.color := clWhite;
  botao8.color := clTeal;
  botao8.font.color := clWhite;
end;


procedure Tfrm_botoesListagensAtdo.FormKeyDown(Sender: TObject;
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
      botao4Click(Sender)
    else
    if (botao5.color=clWhite) then
      botao5Click(Sender)
    else
    if (botao6.color=clWhite) then
      botao6Click(Sender)
    else
    if (botao7.color=clWhite) then
      botao7Click(Sender)
    else
    if (botao8.color=clWhite) then
      botao7Click(Sender);
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
    botao4Click(Sender)
  else
  if (key=101) or (key=Ord('5')) then
    botao5Click(Sender)
  else
  if (key=102) or (key=Ord('6')) then
    botao6Click(Sender)
  else
  if (key=103) or (key=Ord('7')) then
    botao8Click(Sender)
  else
  if (key=104) or (key=Ord('8')) then
    botao7Click(Sender);
end;

procedure Tfrm_botoesListagensAtdo.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_botoesListagensAtdo.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_botoesListagensAtdo.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_botoesListagensAtdo.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_botoesListagensAtdo.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_botoesListagensAtdo.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_botoesListagensAtdo.botao5Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ListaVendasAtendimento, frm_ListaVendasAtendimento);
  frm_ListaVendasAtendimento.showmodal;
  frm_ListaVendasAtendimento.Free;
end;

procedure Tfrm_botoesListagensAtdo.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_botoesListagensAtdo.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_botoesListagensAtdo.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ListaAtendimentos, frm_ListaAtendimentos);
  frm_ListaAtendimentos.showmodal;
  frm_ListaAtendimentos.Free;
end;

procedure Tfrm_botoesListagensAtdo.botao7MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  TPanel(Sender).color := clWhite;
  TPanel(Sender).font.color := clTeal;
end;

procedure Tfrm_botoesListagensAtdo.botao7Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_PromocoesAVencer, frm_PromocoesAVencer);
  frm_PromocoesAVencer.edtDiasAVencer.text := inttostr(frm_principal.x_memoria_solicitacao_dias_a_vencer_promocao);
  frm_PromocoesAVencer.chExibirCorTamanho.checked := frm_principal.x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho;
  frm_PromocoesAVencer.showmodal;
  frm_PromocoesAVencer.Free;
end;

procedure Tfrm_botoesListagensAtdo.FormDestroy(Sender: TObject);
begin
  frm_botoesListagensAtdo := nil;
end;

procedure Tfrm_botoesListagensAtdo.Botao8Click(Sender: TObject);
begin
  frm_principal.consultapromocoesavencer;
end;

end.
