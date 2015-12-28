unit un_AuxFormularioVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfrm_AuxFormularioVendas = class(TForm)
    Bevel1: TBevel;
    lbltitulo: TLabel;
    lbltitulo_sombra: TLabel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AuxFormularioVendas: Tfrm_AuxFormularioVendas;

implementation

uses principal;

{$R *.dfm}

procedure Tfrm_AuxFormularioVendas.FormCreate(Sender: TObject);
var
  hR : THandle;
begin
  Image2.picture := frm_principal.Image1.picture;

     {***** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_AuxFormularioVendas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

end.
