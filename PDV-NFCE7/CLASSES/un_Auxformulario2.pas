unit un_Auxformulario2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, BotaoSair;

type
  Tfrm_Auxformulario2 = class(Tfrm_Auxformulario1)
    BotaoSair1: TBotaoSair;
    procedure BotaoSair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Auxformulario2: Tfrm_Auxformulario2;

implementation

{$R *.DFM}

procedure Tfrm_Auxformulario2.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

end.
