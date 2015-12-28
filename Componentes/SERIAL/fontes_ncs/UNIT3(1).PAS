unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TS_CliAnal = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  S_CliAnal: TS_CliAnal;

implementation

{$R *.DFM}

procedure TS_CliAnal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

end.
