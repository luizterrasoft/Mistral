unit unImpressoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, StdCtrls, Printers, ComCtrls;

type
  Tfrm_impressoras = class(TForm)
    grade: TStringGrid;
    Panel1: TPanel;
    botao_sair: TPanel;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    btnDefinir: TButton;
    btnConfig: TButton;
    Label1: TLabel;
    listafontes: TListBox;
    Bevel1: TBevel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure btnDefinirClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_impressoras: Tfrm_impressoras;

implementation

{$R *.DFM}

uses principal;

{Ativacao do formulario ***}
procedure Tfrm_impressoras.FormActivate(Sender: TObject);
var
  ind: Integer;
begin
  grade.rowcount:=printer.printers.count+1;
  grade.Cells[0,0]:=' Nome   ';
  grade.Cells[1,0]:=' Padrão ';
  grade.Cells[2,0]:=' Tipo   ';
  ind:=0;
  while (ind<printer.printers.count) do
  begin
    grade.Cells[0,ind+1]:=printer.printers[ind];
    if (ind=printer.printerindex) then
      grade.Cells[1,ind+1]:='<<<'
    else
      grade.Cells[1,ind+1]:='   ';
    grade.Cells[2,ind+1]:='Local';
    ind:=ind+1;
  end;
  listafontes.items:=printer.fonts;
end;

{Botao de saida do sistema ***}
procedure Tfrm_impressoras.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_impressoras.btnDefinirClick(Sender: TObject);
begin
  PrintDialog1.Execute;
  frm_impressoras.FormActivate(Sender);
end;

procedure Tfrm_impressoras.btnConfigClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
  frm_impressoras.FormActivate(Sender);
end;

{Duplo clique na grade para escolher a impressora ***}
procedure Tfrm_impressoras.gradeDblClick(Sender: TObject);
begin
  printer.printerindex:=grade.row-1;
  frm_impressoras.FormActivate(Sender);
end;

procedure Tfrm_impressoras.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
  begin
    printer.printerindex:=grade.row-1;
    frm_impressoras.FormActivate(Sender);
  end;
end;

procedure Tfrm_impressoras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

end.
