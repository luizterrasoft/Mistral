unit un_AjudaComandos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_AjudaComandos = class(TForm)
    Panel2: TPanel;
    Panel6: TPanel;
    botao_sair: TPanel;
    Bevel1: TBevel;
    btnFechar: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel12: TPanel;
    Label2: TLabel;
    Panel16: TPanel;
    Memo1: TMemo;
    Bevel4: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AjudaComandos: Tfrm_AjudaComandos;

implementation

{$R *.DFM}

uses principal;

procedure Tfrm_AjudaComandos.FormActivate(Sender: TObject);
var
  hR: THandle;
  ind: Integer;
begin
  hR := CreateRoundRectRgn(0,0,width,height,15,15);
  SetWindowRgn(Handle,hR,true);
  memo1.lines.clear;
  ind:=0;
  while (ind<ListaAtalhosF1.count) do
  begin
    memo1.lines.add(ListaAtalhosF1[ind]);
    ind:=ind+1;
  end;
end;

procedure Tfrm_AjudaComandos.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_AjudaComandos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_AjudaComandos.btnFecharClick(Sender: TObject);
begin
  close;
end;

end.
