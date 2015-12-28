unit un_F8FormaPgto_AVista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal;

type
  Tfrm_F8FormaPgto_AVista = class(TForm)
    grade: TDBGrid;
    Panel3: TPanel;
    botao_sair: TPanel;
    ds: TDataSource;
    Panel1: TPanel;
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_F8FormaPgto_AVista: Tfrm_F8FormaPgto_AVista;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, un_F8FormaPgto;

procedure Tfrm_F8FormaPgto_AVista.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_F8FormaPgto_AVista.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('cFO_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('cFO_CODI').asstring;
  frm_F8FormaPgto_AVista.close;
end;

procedure Tfrm_F8FormaPgto_AVista.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('cFO_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('cFO_CODI').asstring;
    frm_F8FormaPgto_AVista.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_F8FormaPgto_AVista.Close;
end;

procedure Tfrm_F8FormaPgto_AVista.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo formas de pgto...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  grade.setfocus;
end;

end.
