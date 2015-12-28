unit un_funcoesImpressora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_funcoesImpressora = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    btnLeituraX: TPanel;
    btnReducaoZ: TPanel;
    btnInformaAliq: TPanel;
    btnProxCupom: TPanel;
    btnCancelarCupom: TPanel;
    Label1: TLabel;
    pnModelo: TPanel;
    Label2: TLabel;
    btnDefinirModelo: TPanel;
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_funcoesImpressora: Tfrm_funcoesImpressora;

implementation

{$R *.DFM}

uses funcoes1,funcoes2,procura,principal;

procedure Tfrm_funcoesImpressora.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_funcoesImpressora.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

end.
