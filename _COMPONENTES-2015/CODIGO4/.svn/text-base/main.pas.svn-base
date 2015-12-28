unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Barcode, ExtCtrls;

type
  TForm1 = class(TForm)
    Barcode1: TBarcode;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
	Image1.Canvas.TextOut(10,10,'Barcode Test');
	// TCanvas
	Barcode1.Top := 50;
	Barcode1.Left := 30;
	Barcode1.DrawBarcode(Image1.Canvas);

	Barcode1.Top := 100;
	Barcode1.Left := 1;
	Barcode1.Angle := 90;
	{Barcode1.Typ := bcCode_2_5_interleaved;}
	Barcode1.DrawBarcode(Image1.Canvas);

end;

end.
