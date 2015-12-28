unit un_AjudaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_AjudaCons = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Memo1: TMemo;
    botao_sair: TPanel;
    Bevel2: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AjudaCons: Tfrm_AjudaCons;

implementation

{$R *.DFM}


procedure Tfrm_AjudaCons.FormActivate(Sender: TObject);
var
hR: THandle;
ind: integer;
begin
     hR := CreateRoundRectRgn(0,0,width,height,15,15);
     SetWindowRgn(Handle,hR,True);
end;

procedure Tfrm_AjudaCons.botao_sairClick(Sender: TObject);
begin
     close;
end;

procedure Tfrm_AjudaCons.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=27) then close;
end;

end.
