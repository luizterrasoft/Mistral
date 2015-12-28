unit un_botoesOutrasFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfrm_botoesOutrasFuncoes = class(TForm)
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    btnFechar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Panel1: TPanel;
    botao4: TPanel;
    botao5: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao3Click(Sender: TObject);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_botoesOutrasFuncoes: Tfrm_botoesOutrasFuncoes;

implementation

uses un_CancelaVenda, un_TrocaVendedorNaVenda, un_BuscaAtendimento,
  un_InutilizaNFE;

{$R *.dfm}

procedure Tfrm_botoesOutrasFuncoes.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;


procedure Tfrm_botoesOutrasFuncoes.FormKeyDown(Sender: TObject;
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
    botao3Click(Sender)
  else
  if (key=99) or (key=Ord('4')) then
    botao3Click(Sender)
  else
   if (key=99) or (key=Ord('5')) then
     botao3Click(Sender);
end;

procedure Tfrm_botoesOutrasFuncoes.ApagaTudo;
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
end;

procedure Tfrm_botoesOutrasFuncoes.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_CancelaVenda, frm_CancelaVenda);
  frm_CancelaVenda.Modo := 1;
  frm_CancelaVenda.showmodal;
  frm_CancelaVenda.Free;
end;

procedure Tfrm_botoesOutrasFuncoes.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_BuscaAtendimento, frm_BuscaAtendimento);
  frm_BuscaAtendimento.Modo := 'CANCELAMENTO';
  frm_BuscaAtendimento.showmodal;
  frm_BuscaAtendimento.Free;
end;

procedure Tfrm_botoesOutrasFuncoes.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_CancelaVenda, frm_CancelaVenda);
  frm_CancelaVenda.Modo := 0;
  frm_CancelaVenda.showmodal;
  frm_CancelaVenda.Free;
end;

procedure Tfrm_botoesOutrasFuncoes.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_botoesOutrasFuncoes.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_botoesOutrasFuncoes.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_botoesOutrasFuncoes.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_botoesOutrasFuncoes.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;



procedure Tfrm_botoesOutrasFuncoes.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_botoesOutrasFuncoes.Panel1Click(Sender: TObject);
begin
  Application.CreateForm(TFrm_InutilizaNFE, Frm_InutilizaNFE);
  Frm_InutilizaNFE.showmodal;
  Frm_InutilizaNFE.Free;
end;

end.
