unit un_frmConsulta1_Observacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_Consulta1_Observacao = class(TForm)
    lblObs: TLabel;
    Memo1: TMemo;
    bTNoK: TPanel;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Consulta1_Observacao: Tfrm_Consulta1_Observacao;

implementation

{$R *.DFM}

procedure Tfrm_Consulta1_Observacao.btnOkClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Consulta1_Observacao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

end.
