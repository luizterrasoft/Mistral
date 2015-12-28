unit ColorPanelOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TColorPanelOO = class(TImage)
  private
    { Private declarations }
    linha: integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure SetFontConfig(fonte: string; size: integer; estilo: TFontStyles;
                            cor_de_fundo: TColor); {configura as fontes escritas}
    procedure ClearAll; {limpa o painel com a cor atual}
    procedure AddLine(texto: string; cor: TColor); {escreve linhas coloridas no painel}
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TColorPanelOO.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     caption    := '';
     linha      := 5;
end;
procedure TColorPanelOO.ClearAll;
begin
     linha      := 5;   
     Canvas.FillRect(Rect(1,1,width-1,height-1));
end;
procedure TColorPanelOO.SetFontConfig(fonte: string; size: integer; estilo: TFontStyles;
    cor_de_fundo: TColor);
begin
     Canvas.Font.Name   := fonte;
     Canvas.Font.Size   := size;
     Canvas.Font.Style  := estilo;
     Canvas.Brush.Color := cor_de_fundo;
end;
procedure TColorPanelOO.AddLine(texto: string; cor: TColor);
var
altura: integer;
begin
     Canvas.Font.Color := cor;
     altura := Canvas.TextHeight('A');
     Canvas.TextOut(5,linha,texto);
     linha  := linha + altura;
end;
procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TColorPanelOO]);
end;

end.

