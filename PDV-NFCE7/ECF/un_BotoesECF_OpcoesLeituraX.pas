unit un_BotoesECF_OpcoesLeituraX;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_BotoesECF_OpcoesLeituraX = class(TForm)
    rd: TRadioGroup;
    botao1: TPanel;
    Bevel1: TBevel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BotoesECF_OpcoesLeituraX: Tfrm_BotoesECF_OpcoesLeituraX;

implementation

uses principal, urano, urano1efc, unDialogo;

{$R *.DFM}

procedure Tfrm_BotoesECF_OpcoesLeituraX.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (key=13) then
    botao1Click(Sender);
end;

procedure Tfrm_BotoesECF_OpcoesLeituraX.botao1Click(Sender: TObject);
begin
  frmDialogo.posativ:=2;
  if (frmDialogo.ExibirMensagem ('Confirma envio do comando?'
    ,'ECF',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      begin
        if (rd.itemindex=0) then
          URANOEFC_Relatorio_XZ (Pchar(trim('0'))) //inicial
        else
        if (rd.itemindex=1) then
          URANOEFC_Relatorio_XZ (Pchar(trim('2'))); //rel. gerencial
        URANOEFC_Finaliza; //finaliza DLL usada
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
      if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      begin
        if (rd.itemindex=0) then
          URANOEFC_1EFC_Relatorio_XZ (Pchar(trim('0'))) //inicial
        else
        if (rd.itemindex=1) then
          URANOEFC_1EFC_Relatorio_XZ (Pchar(trim('2'))); //rel. gerencial
        URANOEFC_1EFC_Finaliza; //finaliza DLL usada
      end;
end;

procedure Tfrm_BotoesECF_OpcoesLeituraX.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

end.
