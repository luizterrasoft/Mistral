unit f8Forn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal,
  Menus;

type
  Tfrm_F8Forn = class(TForm)
    grade: TDBGrid;
    ds: TDataSource;
    pn_procurar: TPanel;
    lblNome: TLabel;
    edt_nome: TMaskEdit;
    Panel3: TPanel;
    botao_sair: TPanel;
    botaoProcurar: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Panel4: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure botaoProcurarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_F8Forn: Tfrm_F8Forn;

implementation

uses funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_F8Forn.BitBtn1Click(Sender: TObject);
begin
  close;
end;

{botao de procurar e filtrar a querie, usando o FILTER}
{A consulta tem um boa performance porque é executada localmente}
procedure Tfrm_F8Forn.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
    frm_F8Forn.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_F8Forn.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_nome.setfocus;
end;

procedure Tfrm_F8Forn.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo fornecedores...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  grade.setfocus;
  edt_nome.text:='';
end;

procedure Tfrm_F8Forn.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    botaoProcurarClick(Sender);
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_F8Forn.close;
  if (key=K_F2) then
    grade.setfocus;
end;

{Botao de cadastro de lojas ***}
procedure Tfrm_F8Forn.botao_sairClick(Sender: TObject);
begin
  close;
end;

{Duplo clique ***}
procedure Tfrm_F8Forn.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('FO_CODI').asstring;
  frm_F8Forn.close
end;

procedure Tfrm_F8Forn.botaoProcurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_nome.text)<>'') then
    begin
      if (grade.columns[1].title.caption='Nome Fantasia') then
        filter := 'fo_nfan='+chr(39)+Trim(edt_nome.text)+'*'+chr(39)
      else
        filter := 'fo_raza='+chr(39)+Trim(edt_nome.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure Tfrm_F8Forn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F7) then
    if (grade.columns[1].title.caption='Nome Fantasia') then
    begin
      grade.columns[1].title.caption :='Razão Social';
      lblNome.caption:= 'Razão Social';
      grade.columns[1].fieldname := 'FO_RAZA';
    end
    else
    if (grade.columns[1].title.caption='Razão Social') then
    begin
      grade.columns[1].title.caption :='Nome Fantasia';
      lblNome.caption:= 'Nome Fantasia';
      grade.columns[1].fieldname := 'FO_NFAN';
    end;
end;

end.
