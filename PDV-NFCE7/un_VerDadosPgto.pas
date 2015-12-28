unit un_VerDadosPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_VerDadosPgto = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    botao1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_VerDadosPgto: Tfrm_VerDadosPgto;

implementation

uses principal,funcoes1,funcoes2,procura;

{$R *.DFM}

procedure Tfrm_VerDadosPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_VerDadosPgto.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_VerDadosPgto.botao1Click(Sender: TObject);
begin
  close;
end;

end.
