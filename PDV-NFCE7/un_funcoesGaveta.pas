unit un_funcoesGaveta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_funcoesGaveta = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    btnAbrirGaveta: TPanel;
    btnFecharGaveta: TPanel;
    btnDefinirModelo: TPanel;
    pnModelo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_funcoesGaveta: Tfrm_funcoesGaveta;

implementation

{$R *.DFM}

uses funcoes1,funcoes2,procura,principal;

procedure Tfrm_funcoesGaveta.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_funcoesGaveta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

end.
