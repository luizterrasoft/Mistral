unit DM9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TDMRegAutSpc = class(TDataModule)
    qRegistra: TQuery;
    qRegManContSPC: TQuery;
    qAltManContSPC: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegAutSpc: TDMRegAutSpc;

implementation

{$R *.DFM}

end.
