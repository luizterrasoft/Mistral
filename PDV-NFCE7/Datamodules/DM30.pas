unit DM30;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDMNFE = class(TDataModule)
    qCFOPF8: TQuery;
    qCSOSNF8: TQuery;
    qCSTPISF8: TQuery;
    qCSTIPIF8: TQuery;
    qCSTCOFINSF8: TQuery;
    Query6: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNFE: TDMNFE;

implementation

{$R *.dfm}

end.
