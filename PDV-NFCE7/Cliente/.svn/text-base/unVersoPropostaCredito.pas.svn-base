unit unVersoPropostaCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  Tfrm_VersoProposta = class(TForm)
    listaVersoProposta: TQuickRep;
    QRBand2: TQRBand;
    QRLabel81: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel71: TQRLabel;
    qrm_TextodeCredito: TQRMemo;
    QRLabel70: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_VersoProposta: Tfrm_VersoProposta;

implementation

uses principal, unDialogo;

{$R *.DFM}

procedure Tfrm_VersoProposta.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  try
    qrm_TextodeCredito.lines.LoadFromFile(frm_principal.x_arquivo_proposta);
  except
    frmDialogo.ExibirMensagem (' Arquivo de proposta de crédito não encontrado! '
      ,'Proposta de crédito',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end;
end;

end.
