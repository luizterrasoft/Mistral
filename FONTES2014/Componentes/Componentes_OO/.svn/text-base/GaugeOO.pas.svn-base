unit GaugeOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gauges;

type
  TGaugeOO = class(TGauge)
  private
    { Private declarations }
    indGauge: integer;
    totGauge: integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure Inicializa(total_de_registros: integer);
    procedure Move;
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TGaugeOO.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     indGauge  :=0;
     visible   := false;
     width     := 577;
     height    := 25;
     forecolor := clBlue;
     kind      := gkHorizontalBar;
end;

procedure TGaugeOO.Inicializa(total_de_registros: integer);
begin
     if (total_de_registros<>0) then
     begin
          visible :=true;
          indGauge:=0;
          totGauge:=total_de_registros;
     end;
end;

procedure TGaugeOO.Move;
begin
     indGauge:=indGauge+1;
     progress:=Round((indGauge/totGauge)*100);
     refresh;
     if (progress>=100) then
         visible:=false;
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TGaugeOO]);
end;

end.
