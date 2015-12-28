unit MetadataParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, BitBtnControle, CheckControle, EditControle,
  ExtCtrls, Grids, GridControl, GridSql;

type
  TFrm_MetadataParam = class(TForm)
    campos: TGridSql;
    Panel1: TPanel;
    Label1: TLabel;
    Tabela: TEditControle;
    Delete: TCheckControle;
    BitBtnControle1: TBitBtnControle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MetadataParam: TFrm_MetadataParam;

implementation

{$R *.dfm}

procedure TFrm_MetadataParam.FormCreate(Sender: TObject);
begin
  Campos.CellSkip[0] := True;
  Campos.CellSkip[1] := True;
end;

end.
