unit f8Port;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, DB, principal, DbTables;

type
  Tfrm_f8Port = class(TForm)
    grade: TDBGrid;
    pn_procurar: TPanel;
    Label1: TLabel;
    edt_nome: TMaskEdit;
    ds: TDataSource;
    Panel3: TPanel;
    botao_sair: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btn_procurar: TBitBtn;
    btnCadastro: TBitBtn;
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btn_procurarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_f8Port: Tfrm_f8Port;

implementation

uses F8Lojas, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_f8Port.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('PO_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('PO_CODI').asstring;
    frm_F8Port.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_F8Port.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_nome.setfocus;
end;

procedure Tfrm_f8Port.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    btn_procurar.click;
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_F8Port.Close;

     {teclando o F2}
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_f8Port.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo portadores... Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  edt_nome.text:='';
  grade.setfocus;
     //edt_nome.setfocus;
end;

procedure Tfrm_f8Port.btn_procurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_nome.text)<>'') then
    begin
      filter   := 'po_nome='+chr(39)+Trim(edt_nome.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure Tfrm_f8Port.botao_sairClick(Sender: TObject);
begin
  close;
end;

{Duplo clique ***}
procedure Tfrm_f8Port.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('PO_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('PO_CODI').asstring;
  frm_F8Port.close;
end;

end.
