unit un_ConsultaVenda_Vendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_ConsultaVenda_Vendedores = class(TForm)
    Memo1: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    botao_sair: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaVenda_Vendedores: Tfrm_ConsultaVenda_Vendedores;

implementation

{$R *.dfm}

procedure Tfrm_ConsultaVenda_Vendedores.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_ConsultaVenda_Vendedores.botao_sairClick(Sender: TObject);
begin
  close;
end;

end.
