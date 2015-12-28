unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tcupom = class(TForm)
    Memo1: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cupom: Tcupom;

implementation

{$R *.DFM}

procedure Tcupom.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=27 then
      Close;
end;

end.
