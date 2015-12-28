unit Uf8Comprador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal,
  Menus;

type
  Tfrm_f8Comprador = class(TForm)
    Panel3: TPanel;
    botao_sair: TPanel;
    botaoProcurar: TPanel;
    pn_procurar: TPanel;
    Label1: TLabel;
    edt_nome: TMaskEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    grade: TDBGrid;
    Image2: TImage;
    Label2: TLabel;
    ds: TDataSource;
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure botaoProcurarClick(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_f8Comprador: Tfrm_f8Comprador;

implementation

uses DM1, funcoes1, Funcoes2;

{$R *.dfm}

procedure Tfrm_f8Comprador.gradeDblClick(Sender: TObject);
begin                               
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CC_CLIE').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CC_CLIE').asstring;
  frm_f8Comprador.close
end;

procedure Tfrm_f8Comprador.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CC_CLIE').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CC_CLIE').asstring;
    frm_f8Comprador.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_f8Comprador.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_nome.setfocus;

end;

procedure Tfrm_f8Comprador.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_f8Comprador.botaoProcurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_nome.text)<>'') then
    begin
      filter   := 'CC_NCO1='+chr(39)+Trim(edt_nome.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure Tfrm_f8Comprador.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    botaoProcurarClick(Sender);
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_f8Comprador.close;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_f8Comprador.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo Contratados...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  edt_nome.text:='';
  edt_nome.setfocus;  
end;

end.
