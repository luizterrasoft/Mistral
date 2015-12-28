unit ButtonControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Controle;

type
  TButtonControle = class(TButton)
  private
    { Private declarations }
    FPosicao : Word;
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
  public
    { Public declarations }
    FocoDestino : HWND;
    ControlDestino : TObject;
  published
    { Published declarations }
    procedure Click; override;
    property Posicao : Word read FPosicao write FPosicao;
  end;

  Procedure SetaFoco;
  Var
    FFocoDestino : HWND;

procedure Register;

implementation


constructor TButtonControle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Posicao := RetPosicao(AOwner);
end;

Procedure SetaFoco;
Begin
    SetFocus(FFocoDestino);
End;

procedure TButtonControle.Click;
Begin
    inherited Click;
    FFocoDestino := FocoDestino;
    SetaFoco;
End;

procedure Register;
begin
  RegisterComponents('Sistema', [TButtonControle]);
end;

end.
