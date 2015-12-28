unit uFatur6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PrgFiscal;

type
  TFormAliquotas = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAliquotas: TFormAliquotas;

implementation

uses uFatur1, uCupom1;

{$R *.DFM}

procedure TFormAliquotas.Button1Click(Sender: TObject);
var
  i: integer;
  Aliqs: TAliquota;
  sVal1: string;
begin
  Screen.Cursor := crHourGlass;
  Aliqs := FormCupomFiscal.PrgFiscal1.ConAliqTribut;
  for i := 1 to 16 do
  begin
    if Aliqs[i] > 0 then
    begin
      sVal1 := IntToStr(i); if Length(sVal1) < 2 then sVal1 := '0' + sVal1;
      ListBox1.Items.Add('Aliquota : ' + sVal1 + ' - ' + FloatToStrF(Aliqs[i], ffNumber, 15, 2) + '%');
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFormAliquotas.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormAliquotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
