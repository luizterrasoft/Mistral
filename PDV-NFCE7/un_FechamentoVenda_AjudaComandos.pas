unit un_FechamentoVenda_AjudaComandos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  Tfrm_FechamentoVenda_AjudaComandos = class(TForm)
    pnData: TPanel;
    Panel1: TPanel;
    botao_sair: TPanel;
    Bevel1: TBevel;
    btnFechar: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel2: TPanel;
    Panel8: TPanel;
    Panel3: TPanel;
    Panel9: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_FechamentoVenda_AjudaComandos: Tfrm_FechamentoVenda_AjudaComandos;

implementation

{$R *.DFM}

procedure Tfrm_FechamentoVenda_AjudaComandos.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_FechamentoVenda_AjudaComandos.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_AjudaComandos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_FechamentoVenda_AjudaComandos.btnFecharClick(Sender: TObject);
begin
  close;
end;

end.
