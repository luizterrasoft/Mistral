unit un_Transf_Embarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair;

type
  Tfrm_Transf_Embarque = class(TForm)
    BotaoSair1: TBotaoSair;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Transf_Embarque: Tfrm_Transf_Embarque;

implementation

{$R *.DFM}

procedure Tfrm_Transf_Embarque.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Embarque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

end.
