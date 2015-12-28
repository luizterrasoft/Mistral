unit LabelOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TLabelOO = class(TLabel)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TLabelOO.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     font.style := [fsBold];
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TLabelOO]);
end;

end.
