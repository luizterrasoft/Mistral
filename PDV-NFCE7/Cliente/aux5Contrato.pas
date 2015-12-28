unit aux5Contrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, BotaoSair, Buttons;

type
  Tfrm_Aux5Contrato = class(Tfrm_Auxformulario1)
    edtObs1: TMaskEdit;
    edtObs2: TMaskEdit;
    edtObs3: TMaskEdit;
    edtObs4: TMaskEdit;
    edtObs5: TMaskEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TBitBtn;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtObs5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtObs1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    exibiu: Boolean;
    resultado: Integer;
    linha1,linha2,linha3,linha4,linha5: String;
  end;

var
  frm_Aux5Contrato: Tfrm_Aux5Contrato;

implementation

{$R *.DFM}

uses auxiliar, principal;

procedure Tfrm_Aux5Contrato.FormCreate(Sender: TObject);
begin
  inherited;
  exibiu:=false;
  resultado:=27;
end;

procedure Tfrm_Aux5Contrato.FormActivate(Sender: TObject);
begin
  inherited;
  if (not exibiu) then
  begin
    linha1 := edtObs1.text;
    linha2 := edtObs2.text;
    linha3 := edtObs3.text;
    linha4 := edtObs4.text;
    linha5 := edtObs5.text;
    edtObs1.setfocus;
    exibiu:=true;
  end;
end;

procedure Tfrm_Aux5Contrato.edtObs5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtObs4.setfocus;
  if (key=K_ENTER) then
    btnOk.click;
end;

procedure Tfrm_Aux5Contrato.edtObs1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_CIMA) then;
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtObs2.setfocus;
end;

procedure Tfrm_Aux5Contrato.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
  edtObs1.setfocus;
end;

procedure Tfrm_Aux5Contrato.btnOkClick(Sender: TObject);
begin
  resultado:=13; //dif. de 27   
  close;
end;

procedure Tfrm_Aux5Contrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (resultado=27) then
  begin
    edtObs1.text := linha1;
    edtObs2.text := linha2;
    edtObs3.text := linha3;
    edtObs4.text := linha4;
    edtObs5.text := linha5;
  end;
end;

procedure Tfrm_Aux5Contrato.N1Click(Sender: TObject);
begin
  btnOk.click;
end;

end.
