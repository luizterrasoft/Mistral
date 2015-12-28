unit aux3Contrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_Aux3Contrato = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    Button1: TButton;
    lb_texto: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Aux3Contrato: Tfrm_Aux3Contrato;

implementation

uses cadcli;

{$R *.DFM}

procedure Tfrm_Aux3Contrato.FormActivate(Sender: TObject);
begin
  btnOk.setfocus;
end;

procedure Tfrm_Aux3Contrato.btnOkClick(Sender: TObject);
begin
  frm_Aux3Contrato.modalresult:=1;
end;

procedure Tfrm_Aux3Contrato.btnCancelClick(Sender: TObject);
begin
  frm_Aux3Contrato.modalresult:=2;
end;

procedure Tfrm_Aux3Contrato.Button1Click(Sender: TObject);
begin
  frm_Aux3Contrato.modalresult:=3;
  frm_edtCliente.btnEdtGrade.Click;
end;

end.
