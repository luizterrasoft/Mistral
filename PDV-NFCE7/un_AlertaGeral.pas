unit un_AlertaGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, BotaoSair;

type
  Tfrm_AlertaGeral = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    BotaoSair1: TBotaoSair;
    procedure BotaoSair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AlertaGeral: Tfrm_AlertaGeral;

implementation

{$R *.DFM}

procedure Tfrm_AlertaGeral.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_AlertaGeral.Timer1Timer(Sender: TObject);
begin
  if (Panel1.caption='Atenção') then
    Panel1.caption:=''
  else
    Panel1.caption:='Atenção';
end;

procedure Tfrm_AlertaGeral.FormActivate(Sender: TObject);
begin
  Timer1.enabled:=true;
end;

procedure Tfrm_AlertaGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.enabled:=false;
end;

end.
