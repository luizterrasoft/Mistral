unit un_TrocaVendedorNaVenda_EscolhaVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, LabelOO;

type
  Tfrm_TrocaVendedorNaVenda_EscolhaVendedor = class(TForm)
    LabelOO1: TLabelOO;
    Bevel1: TBevel;
    Lista: TListBox;
    btnOk: TPanel;
    btnCancel: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    y_vendedor: Real;
    tecla: Integer;
    exibiu: Boolean;
  end;

var
  frm_TrocaVendedorNaVenda_EscolhaVendedor: Tfrm_TrocaVendedorNaVenda_EscolhaVendedor;

implementation

{$R *.dfm}

procedure Tfrm_TrocaVendedorNaVenda_EscolhaVendedor.FormKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_TrocaVendedorNaVenda_EscolhaVendedor.btnCancelClick(
  Sender: TObject);
begin
  close;
end;

procedure Tfrm_TrocaVendedorNaVenda_EscolhaVendedor.btnOkClick(
  Sender: TObject);
begin
  if (Lista.itemindex>=0) then
  begin
    y_vendedor := strtofloat(Copy(Lista.items[Lista.itemindex],1,6));
    tecla := 13;
    close;
  end;
end;

procedure Tfrm_TrocaVendedorNaVenda_EscolhaVendedor.FormCreate(
  Sender: TObject);
begin
  tecla:=27;
  exibiu := false;
  y_vendedor := -1;
end;

procedure Tfrm_TrocaVendedorNaVenda_EscolhaVendedor.FormActivate(
  Sender: TObject);
begin
  if (not exibiu) then
    exibiu := true;
  lista.itemindex:=0;
  lista.setfocus;
end;

procedure Tfrm_TrocaVendedorNaVenda_EscolhaVendedor.ListaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    if (Lista.itemindex>=0) then
      btnOkClick(btnOk);
end;

end.
