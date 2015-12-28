unit Copia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComboSql, Buttons, BitBtnGravacao;

type
  TFrmCopia = class(TForm)
    Grupoorigem: TComboSql;
    GrupoDestino: TComboSql;
    Label11: TLabel;
    Label1: TLabel;
    BitBtnGravacao1: TBitBtnGravacao;
    BSair: TBitBtnGravacao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCopia: TFrmCopia;

implementation

{$R *.DFM}

end.
