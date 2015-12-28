unit un_F8FormaPgto2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal;

type
  Tfrm_F8FormaPgto2 = class(TForm)
    Panel3: TPanel;
    botao_sair: TPanel;
    ds: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    Image2: TImage;
    grade: TDBGrid;
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_F8FormaPgto2: Tfrm_F8FormaPgto2;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, un_F8FormaPgto;

procedure Tfrm_F8FormaPgto2.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_F8FormaPgto2.FormActivate(Sender: TObject);
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

procedure Tfrm_F8FormaPgto2.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
  frm_F8FormaPgto2.close;
end;

procedure Tfrm_F8FormaPgto2.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
    frm_F8FormaPgto2.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_F8FormaPgto2.Close;
end;

procedure Tfrm_F8FormaPgto2.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (ds.dataset.fieldbyname('cOK').AsString='0') then
    grade.Canvas.Font.color:=clRed
  else
  if (ds.dataset.fieldbyname('cOK').AsString='1') then
    grade.Canvas.Font.color:=clWhite;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

end.
