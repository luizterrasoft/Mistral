unit PanelOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TPanelOO = class(TPanel)
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

constructor TPanelOO.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     font.style := [fsBold];
     caption    := '';
     Alignment  := taLeftJustify;
     bevelInner := bvNone;
     bevelOuter := bvLowered;
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TPanelOO]);
end;

end.
