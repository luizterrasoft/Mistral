unit un_BotoesOpcoes_Atdo_Suspensao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  Tfrm_BotoesOpcoes_Atdo_Suspensao = class(TForm)
    Bevel1: TBevel;
    botao1: TPanel;
    botao2: TPanel;
    btnFechar: TPanel;
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesOpcoes_Atdo_Suspensao: Tfrm_BotoesOpcoes_Atdo_Suspensao;

implementation

uses un_SuspensaoAtendimento;

{$R *.dfm}

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
end;

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SuspensaoAtendimento, frm_SuspensaoAtendimento);
  frm_SuspensaoAtendimento.MODO := 'SUSPENSAO';
  frm_SuspensaoAtendimento.showmodal;
  frm_SuspensaoAtendimento.Free;
end;

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SuspensaoAtendimento, frm_SuspensaoAtendimento);
  frm_SuspensaoAtendimento.MODO := 'REABERTURA';
  frm_SuspensaoAtendimento.showmodal;
  frm_SuspensaoAtendimento.Free;
end;

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (key=13) then
    if (botao1.color=clWhite) then
      botao1Click(Sender)
    else
    if (botao2.color=clWhite) then
      botao2Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao2Click(Sender);
end;

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesOpcoes_Atdo_Suspensao.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

end.
