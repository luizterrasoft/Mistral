unit un_AjudaComandos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_AjudaComandos = class(TForm)
    pnData: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    botao_sair: TPanel;
    Bevel1: TBevel;
    btnFechar: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel19: TPanel;
    Panel14: TPanel;
    Panel18: TPanel;
    Bevel4: TBevel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
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
  frm_AjudaComandos: Tfrm_AjudaComandos;

implementation

{$R *.DFM}

procedure Tfrm_AjudaComandos.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_AjudaComandos.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_AjudaComandos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_AjudaComandos.btnFecharClick(Sender: TObject);
begin
  close;
end;

end.
