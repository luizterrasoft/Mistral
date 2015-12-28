unit un_CaixaLancamentos_F8TipoValor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_CaixaLancamentos_F8TipoValor = class(TForm)
    lista: TListBox;
    btnFechar: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure listaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure listaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_tipo_valor: Integer;
  end;

var
  frm_CaixaLancamentos_F8TipoValor: Tfrm_CaixaLancamentos_F8TipoValor;

implementation

{$R *.DFM}

procedure Tfrm_CaixaLancamentos_F8TipoValor.btnFecharClick(
  Sender: TObject);
begin
  close;
end;

procedure Tfrm_CaixaLancamentos_F8TipoValor.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_CaixaLancamentos_F8TipoValor.FormActivate(Sender: TObject);
begin
  if (lista.itemindex=-1) then
    lista.itemindex:=0;
  lista.setfocus;
end;

procedure Tfrm_CaixaLancamentos_F8TipoValor.listaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
  begin
    y_tipo_valor := lista.itemindex+1;
    close;
  end;
end;

procedure Tfrm_CaixaLancamentos_F8TipoValor.FormCreate(Sender: TObject);
begin
  y_tipo_valor := -1;
end;

procedure Tfrm_CaixaLancamentos_F8TipoValor.listaDblClick(Sender: TObject);
begin
  y_tipo_valor := lista.itemindex+1;
  close;
end;

end.
