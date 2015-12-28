unit un_Mapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, LabelOO, jpeg;

type
  Tfrm_Mapa = class(TForm)
    ScrollBox1: TScrollBox;
    LabelOO1: TLabelOO;
    BotaoSair1: TBotaoSair;
    Image1: TImage;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Mapa: Tfrm_Mapa;

implementation

{$R *.dfm}

procedure Tfrm_Mapa.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Mapa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

end.
