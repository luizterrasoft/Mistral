unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, siGridReporter;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    siGridReporter1: TsiGridReporter;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
   i, j: integer;
begin
  with StringGrid1 do begin
    for i := 0 to RowCount - 1 do
      for j := 0 to ColCount - 1 do
        Cells[j, i] := 'Cell: ' + IntToStr(i) + '-' + IntToStr(j);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  siGridReporter1.ShowReport;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  siGridReporter1.PrintPreview;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  siGridReporter1.PrintReport;
end;

end.
