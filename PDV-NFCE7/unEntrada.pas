unit unEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Gauges, LabelOO;

type
  Tfrm_entrada = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Gauge1: TGauge;
    Image1: TImage;
    Label5: TLabel;
    LabelOO1: TLabelOO;
    Bevel2: TBevel;
    Bevel3: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_entrada: Tfrm_entrada;

implementation

uses principal, auxiliar, DM3;

{$R *.DFM}

end.
