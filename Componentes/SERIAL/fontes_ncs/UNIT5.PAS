unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TS_EtiqCli = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  S_EtiqCli: TS_EtiqCli;

implementation

{$R *.DFM}

procedure TS_EtiqCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

end.
