unit un_BotoesOpcoes;

interface                                     

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus;

type
  Tfrm_BotoesOpcoes = class(TForm)
    botao5: TPanel;
    botao_sair: TPanel;
    Bevel1: TBevel;
    btnFechar: TPanel;
    botao3: TPanel;
    botao6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    botao4: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5Click(Sender: TObject);
    procedure botao6Click(Sender: TObject);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3Click(Sender: TObject);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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

uses un_ConfigLocal, un_Indexar, principal, funcoes1, funcoes2, procura, auxiliar,
  un_BuscaAtendimento, un_SumarioAtdos, un_ListaAtendimentos,
  un_ConsultaAtendimento;

{$R *.DFM}

procedure Tfrm_BotoesOpcoes.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_BotoesOpcoes.botao_sairClick(Sender: TObject);
begin
  close;
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
      botao4Click(Sender)
    else
    if (botao5.color=clWhite) then
      botao5Click(Sender)
    else
    if (botao6.color=clWhite) then
      botao6Click(Sender);
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
    botao6Click(Sender);
end;

procedure Tfrm_BotoesOpcoes.btnFecharClick(Sender: TObject);
begin
  close;
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
  botao5.color := clTeal;
  botao5.font.color := clWhite;
  botao6.color := clTeal;
  botao6.font.color := clWhite;
end;

procedure Tfrm_BotoesOpcoes.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.botao5Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Indexar,frm_Indexar);
  frm_Indexar.showmodal;
  frm_Indexar.Free;
end;

procedure Tfrm_BotoesOpcoes.botao6Click(Sender: TObject);
begin
  frm_principal.ChamandoConfigLocal;
end;

procedure Tfrm_BotoesOpcoes.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_BuscaAtendimento, frm_BuscaAtendimento);
  frm_BuscaAtendimento.showmodal;
  frm_BuscaAtendimento.Free;
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

procedure Tfrm_BotoesOpcoes.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ListaAtendimentos, frm_ListaAtendimentos);
  frm_ListaAtendimentos.showmodal;
  frm_ListaAtendimentos.Free;
end;

procedure Tfrm_BotoesOpcoes.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SumarioAtdos, frm_SumarioAtdos);
  frm_SumarioAtdos.showmodal;
  frm_SumarioAtdos.Free;
end;

procedure Tfrm_BotoesOpcoes.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes.botao4Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaAtendimento, frm_ConsultaAtendimento);
  frm_ConsultaAtendimento.showmodal;
  frm_ConsultaAtendimento.Free;
end;

end.
