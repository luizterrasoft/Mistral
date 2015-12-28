unit un_ExibeNumeroAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, LabelOO, BotaoSair;

type
  Tfrm_ExibeNumeroAtendimento = class(TForm)
    Bevel1: TBevel;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    lblNumTerminal: TLabelOO;
    lblNumAtendimento: TLabelOO;
    BotaoSair1: TBotaoSair;
    procedure BotaoSair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ExibeNumeroAtendimento: Tfrm_ExibeNumeroAtendimento;

implementation

{$R *.dfm}

procedure Tfrm_ExibeNumeroAtendimento.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

end.
