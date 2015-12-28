unit MemoOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMemoOO = class(TMemo)
  private
    { Private declarations }
    AlturaFonte: integer;
    LarguraFonte: integer;
    x,y: integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure SetFontColor(cor: TColor);
    procedure SetFontSize(tamanho: integer);
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TMemoOO.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
end;
procedure TMemoOO.SetFontColor(cor: TColor);
begin
//     Canvas.Font.Color := cor;
end;
procedure TMemoOO.SetFontSize(tamanho: integer);
begin
     Canvas.Font.Size := tamanho;
end;
procedure TMemoOO.SetFontStyle(estilo: TFontStyle);
begin
     Canvas.Font.Style := estilo;
end;
procedure TMemoOO.SetFontName(nome: string);
begin
     Canvas.Font.Name := nome;
end;
procedure TMemoOO.Clear(xpos,ypos: integer);
begin
     Canvas.Clear;
     x:= xpos;
     y:= ypos;
end;
procedure TMemoOO.AddLine(texto: string);
begin
     Canvas.TextOut(x,y,texto);
     y := y + Canvas.TextHeight(texto);
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TLabelOO]);
end;

end.
