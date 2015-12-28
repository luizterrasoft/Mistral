unit PanelControle;

interface

uses
   Graphics,extctrls,classes,Controls,Forms;

type
  TPanelControle = class(TPanel)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TPanelControle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Color := clWhite;
  Alignment := taLeftJustify;
  BevelInner := bvNone;
  BevelOuter:= bvNone;
  Height    := 21;
  BorderStyle := bsSingle;
  CAption     := '';
end;

procedure Register;
begin
  RegisterComponents('Sistema', [TPanelControle]);
end;

end.
