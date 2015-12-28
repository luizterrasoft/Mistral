unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TS_CliSint = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  S_CliSint: TS_CliSint;

implementation

{$R *.DFM}

procedure TS_CliSint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

end.
