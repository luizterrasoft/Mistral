unit DM10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TDMRecCheqDev = class(TDataModule)
    qBaixaCheque: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRecCheqDev: TDMRecCheqDev;

implementation

{$R *.DFM}

end.
