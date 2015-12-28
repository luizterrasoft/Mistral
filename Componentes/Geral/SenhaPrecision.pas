unit SenhaPrecision;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFrm_SenhaPrecision = class(TForm)
    Label3: TLabel;
    EdSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SenhaPrecision: TFrm_SenhaPrecision;

implementation

{$R *.DFM}

procedure TFrm_SenhaPrecision.BitBtn2Click(Sender: TObject);
begin
     Close;
end;

end.
