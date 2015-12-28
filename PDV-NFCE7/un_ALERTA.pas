unit un_ALERTA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_ALERTA = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Memo1: TMemo;
    botao1: TPanel;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ALERTA: Tfrm_ALERTA;

implementation

{$R *.DFM}

procedure Tfrm_ALERTA.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  Timer1.enabled:=true;
end;

procedure Tfrm_ALERTA.botao1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ALERTA.Timer1Timer(Sender: TObject);
begin
  if (label1.visible) then
  begin
    label1.visible:=false;
    label2.visible:=false;
  end
  else
  begin
    label1.visible:=true;
    label2.visible:=true;
  end;
end;

procedure Tfrm_ALERTA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.enabled:=false;
end;

procedure Tfrm_ALERTA.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botao1Click(Sender);
  if (key=27) then
    botao1Click(Sender);
end;

procedure Tfrm_ALERTA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botao1Click(Sender);
  if (key=27) then
    botao1Click(Sender);
end;

end.
