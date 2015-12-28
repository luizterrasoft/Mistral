unit un_BotoesInventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_BotoesInventario = class(TForm)
    Bevel1: TBevel;
    btnFechar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesInventario: Tfrm_BotoesInventario;

implementation

uses principal, un_senhaSupervisor, unMensagem, auxiliar, funcoes1, funcoes2, procura,
  unDialogo, un_senhaCaixa, un_ListaItensEstoque, un_inventario1,
  un_ImportarContagem, un_ExportarContagem;

{$R *.DFM}

procedure Tfrm_BotoesInventario.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesInventario.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_BotoesInventario.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ListaItensEstoque, frm_ListaItensEstoque);
  frm_ListaItensEstoque.caption := 'Relação para contagem';
  frm_ListaItensEstoque.showmodal;
  frm_ListaItensEstoque.Free;
end;

procedure Tfrm_BotoesInventario.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_BotoesInventario.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
end;

procedure Tfrm_BotoesInventario.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
end;

procedure Tfrm_BotoesInventario.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesInventario.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;


procedure Tfrm_BotoesInventario.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesInventario.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_inventario1, frm_inventario1);
  frm_inventario1.height := 600;
  frm_inventario1.showmodal;
  frm_inventario1.Free;
end;

procedure Tfrm_BotoesInventario.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ExportarContagem, frm_ExportarContagem);
  frm_ExportarContagem.showmodal;
  frm_ExportarContagem.Free;
end;

end.
