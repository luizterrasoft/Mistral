unit un_Opcoes_2via;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_Opcoes_2via = class(TForm)
    RadioGroup1: TRadioGroup;
    rbCarnet: TRadioButton;
    rbRecibo: TRadioButton;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbCarnetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbReciboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Opcoes_2via: Tfrm_Opcoes_2via;

implementation

uses principal, unDialogo, unEmissCarnet2, un_frmConsulta1, un_Emissao_Comprovante;

{$R *.dfm}

procedure Tfrm_Opcoes_2via.btnOKClick(Sender: TObject);
begin
  if(not rbCarnet.Checked) and (not rbRecibo.Checked) then
    frmDialogo.ExibirMensagem ('Selecione uma opção!',
      '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);

  if(rbCarnet.Checked) then
  begin
    Application.CreateForm(Tfrm_EmisCarnet2, frm_EmisCarnet2);
    with(frm_EmisCarnet2) do
    begin
      caption := frm_principal.x_sistema+' - '+LB_EMIS_CARNET;
      Modo    := 0;
      edtCliente.text := frm_Consulta1.edtCodCli.text;
      frm_Opcoes_2via.Close;
      showmodal;
      free;
    end;
  end
  else
  if(rbRecibo.Checked) then
  begin
    Application.CreateForm(Tfrm_Emissao_Comprovante,frm_Emissao_Comprovante);
    with(frm_Emissao_Comprovante) do
    begin
      frm_Opcoes_2via.Close;
      showmodal;
      free;
    end;
  end;
end;

procedure Tfrm_Opcoes_2via.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key=K_ESC) then
    close;
end;

procedure Tfrm_Opcoes_2via.btnOKKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key=K_ESC) then
    close;
end;

procedure Tfrm_Opcoes_2via.rbCarnetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key=K_ESC) then
    close;
end;

procedure Tfrm_Opcoes_2via.rbReciboKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key=K_ESC) then
    close;
end;

end.
