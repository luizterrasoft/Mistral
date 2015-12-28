unit PanelBarra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type

  TPanelBarra = class(TPanel)
  private
    Imagem,ImagemClose : TImage;
    Procedure ClickImagem(Sender:TObject);
    Procedure ClickClose(Sender:TObject);
    Procedure CreateWnd; override;
    { Private declarations }
  protected
//    Caption : TCaption;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    Procedure  Resize;Override;
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoComponentes', [TPanelBarra]);
end;

{ TPanelBarra }

procedure TPanelBarra.ClickClose(Sender: TObject);
begin
     TForm(Owner).Close;
end;

procedure TPanelBarra.ClickImagem(Sender: TObject);
Var
OldPosition : TPosition;
begin
     OldPosition := TForm(Owner).Position;

     If TForm(Owner).FormStyle = fsMDIChild Then
         TForm(Owner).FormStyle := fsNormal
     Else if (TForm(Owner).FormStyle = fsNormal) And Not(TForm(Owner).FormState  = [fsModal])then
         TForm(Owner).FormStyle := fsMDIChild;

      TForm(Owner).Position := OldPosition;

end;

constructor TPanelBarra.Create(AOwner: TComponent);
begin
    inherited Create(Aowner);
    color := $00D5D500;
    font.color := ClNavy;
    font.size  := 16;
    BevelInner  := BvNone;
    BevelOuter  := BvNone;
    Align        := AlTop;
    height       := 35;
    Alignment    := taleftjustify;
    Imagem       := TImage.Create(Self);
    Imagem.parent       := Self;
    imagem.Onclick  := ClickImagem;
    Imagem.Visible  := true;
    Imagem.height   := height;
    Imagem.Stretch  := True;
    imagem.transparent := true;
    imagem.width       := 50;

    ImagemClose          := TImage.Create(Self);
    ImagemClose.parent   := Self;
    ImagemClose.Onclick  := ClickClose;
    ImagemClose.Visible  := true;
    ImagemClose.height   := height;
    ImagemClose.Stretch  := True;
    ImagemClose.transparent := true;
    ImagemClose.width    := 50;
    ImagemClose.ShowHint    := True;
    ImagemClose.Hint        := 'Fecha Formulario de '+TForm(Owner).Caption;

    ImagemClose.align    := alRight;
    imagem.align         := alRight;

    if FileExists(ExtractFilePath(Application.ExeName)+'NovaJanela.Bmp') then
      imagem.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'NovaJanela.Bmp');

    if FileExists(ExtractFilePath(Application.ExeName)+'Exit.Bmp') then
      ImagemClose.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Exit.Bmp');

//    Caption      := TForm(Owner).Caption;
end;

procedure TPanelBarra.CreateWnd;
begin
  inherited CreateWnd;
//  Caption      := TForm(Owner).Caption;
end;

destructor TPanelBarra.Destroy;
begin
  Imagem.Destroy;
  ImagemClose.Destroy;
  inherited Destroy;
end;

procedure TPanelBarra.Resize;
begin
  Caption      := TForm(Owner).Caption;
  inherited Resize;
end;

end.
