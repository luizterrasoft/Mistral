unit DM5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TDMAtualizReceb = class(TDataModule)
    qBaixaDoc: TQuery;
    qBaixaLote: TQuery;
    qApagaLote: TQuery;
    qDiminue: TQuery;
    qTotais: TQuery;
    qTotaisTOTLANC: TIntegerField;
    qTotaisTOTVAL: TFloatField;
    qAtualizaCliente: TQuery;
    qReabreDoc: TQuery;
    qAumenta: TQuery;
    qTotaisLOJA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAtualizReceb: TDMAtualizReceb;

implementation

{$R *.DFM}

end.
