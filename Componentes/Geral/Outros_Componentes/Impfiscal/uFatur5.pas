unit uFatur5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, PrgFiscal;

type
  TFormTotais = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTotais: TFormTotais;

implementation

uses uFatur1, uCupom1;

{$R *.DFM}

procedure TFormTotais.Button1Click(Sender: TObject);
var
  Totais: TRetTotParc;
  i: integer;
  sTot1, sTot2, sTotValor1, sTotValor2: string;
begin
  Screen.Cursor := crHourGlass;
  Totais := FormCupomFiscal.PrgFiscal1.ConsTotalParc;
  with Totais do
  begin
   { totalizadores tributados}
    i := 1;
    while i <= 16 do
    begin
      if i = 1 then ListBox1.Items.Add('Tributados');
      sTot1 := IntToStr(i); if length(sTot1) < 2 then sTot1 := '0' + sTot1;
      sTotValor1 := FormatFloat('R$ 000,000,000.00', TotParcTrib[i]);
      Inc(i);
      sTot2 := IntToStr(i); if length(sTot2) < 2 then sTot2 := '0' + sTot2;
      sTotValor2 := FormatFloat('R$ 000,000,000.00', TotParcTrib[i]);
      Inc(i);
      ListBox1.Items.Add(sTot1 + ' - ' + sTotValor1 + '  |  ' + sTot2 + ' - ' + sTotValor2);
    end;
    ListBox1.Items.Add('-----------------------------------------------');
     { Totalizadores de isenção }
    ListBox1.Items.Add('Isenção              ' + FormatFloat('R$ 000,000,000.00', Isencao));
    ListBox1.Items.Add('Não Incidência       ' + FormatFloat('R$ 000,000,000.00', NaoIncid));
    ListBox1.Items.Add('Substituição         ' + FormatFloat('R$ 000,000,000.00', Substituicao));
    ListBox1.Items.Add('-----------------------------------------------');
    i := 1;
    while i <= 9 do
    begin
      if i = 1 then ListBox1.Items.Add('Não Sujeitos ao ICMS');
      sTot1 := IntToStr(i); if length(sTot1) < 2 then sTot1 := '0' + sTot1;
      sTotValor1 := FormatFloat('R$ 000,000,000.00', TotParcNTrib[i]);
      Inc(i);
      sTot2 := IntToStr(i); if length(sTot2) < 2 then sTot2 := '0' + sTot2;
      sTotValor2 := FormatFloat('R$ 000,000,000.00', TotParcNTrib[i]);
      Inc(i);
      if i < 11 then
        ListBox1.Items.Add(sTot1 + ' - ' + sTotValor1 + '  |  ' + sTot2 + ' - ' + sTotValor2)
      else ListBox1.Items.Add(sTot1 + ' - ' + sTotValor1 + '  |  ');
    end;
    ListBox1.Items.Add('-----------------------------------------------');
    ListBox1.Items.Add('Sangria              ' + FormatFloat('R$ 000,000,000.00', Sangria));
    ListBox1.Items.Add('Suprimento           ' + FormatFloat('R$ 000,000,000.00', Suprimento));
    ListBox1.Items.Add('GRANDE TOTAL         ' + FormatFloat('R$ 000,000,000.00', GrandTotal));
  end;
  Screen.Cursor := crDefault;
end;

procedure TFormTotais.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormTotais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
