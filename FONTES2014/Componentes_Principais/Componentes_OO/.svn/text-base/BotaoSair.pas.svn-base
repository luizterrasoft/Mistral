unit BotaoSair;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TBotaoSair = class(TPanel)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TBotaoSair.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     font.style := [fsBold];
     font.color := clWhite;
     color      := clRed;
     width      := 81;
     height     := 25;
     caption    := '';
     showhint   := true;
     hint       := 'Fecha o formulário';
     caption    := 'SAIR';
     cursor     := crHandPoint;
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TBotaoSair]);
end;

end.
