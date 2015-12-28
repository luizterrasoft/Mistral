unit un_BotoesTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_BotoesTransf = class(TForm)
    Bevel1: TBevel;
    btnFechar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
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
  frm_BotoesTransf: Tfrm_BotoesTransf;

implementation

uses principal, un_senhaSupervisor, unMensagem, auxiliar, funcoes1, funcoes2, procura,
  unDialogo, un_senhaCaixa, un_Transf_Lancamento, un_Transf_MudaSituacao,
  un_Transf_Consulta, un_Transf_Entrada_Online, Un_ConsProdutosEstoque;

{$R *.DFM}

procedure Tfrm_BotoesTransf.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesTransf.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_BotoesTransf.FormKeyDown(Sender: TObject; var Key: Word;
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
  if (key=99) or (key=Ord('3')) and Botao3.Visible then
    botao3Click(Sender)
  else
  if (key=100) or (key=Ord('4')) and Botao4.Visible then
    botao4Click(Sender);
end;

procedure Tfrm_BotoesTransf.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
end;

procedure Tfrm_BotoesTransf.ApagaTudo;
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

procedure Tfrm_BotoesTransf.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesTransf.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;


procedure Tfrm_BotoesTransf.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Transf_Lancamento,frm_Transf_Lancamento);
  frm_Transf_Lancamento.ModoOperando := 'SAIDA';
  frm_Transf_Lancamento.showmodal;
  frm_Transf_Lancamento.Free;

  if Frm_ConsProdutosEstoque <> nil then
    close;
end;

procedure Tfrm_BotoesTransf.botao2Click(Sender: TObject);
begin
  if (not frm_principal.x_online) then
  begin
    Application.CreateForm(Tfrm_Transf_Lancamento,frm_Transf_Lancamento);
    frm_Transf_Lancamento.ModoOperando := 'ENTRADA';
    frm_Transf_Lancamento.showmodal;
    frm_Transf_Lancamento.Free;
  end
  else
  begin
          //ON LINE
    Application.CreateForm(Tfrm_Transf_Entrada_Online, frm_Transf_Entrada_Online);
    frm_Transf_Entrada_Online.showmodal;
    frm_Transf_Entrada_Online.Free;
  end;

  if Frm_ConsProdutosEstoque <> nil then
    close;
end;

procedure Tfrm_BotoesTransf.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesTransf.botao3Click(Sender: TObject);
begin
  Application.CreateForm (Tfrm_Transf_Consulta, frm_Transf_Consulta);
  frm_Transf_Consulta.flagAcerto := false;
  frm_Transf_Consulta.showmodal;
  frm_Transf_Consulta.Free;
end;

procedure Tfrm_BotoesTransf.botao4Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Transf_Consulta, frm_Transf_Consulta);
  frm_Transf_Consulta.flagAcerto := true; 
  frm_Transf_Consulta.showmodal;
  frm_Transf_Consulta.Free;
end;

procedure Tfrm_BotoesTransf.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

end.
