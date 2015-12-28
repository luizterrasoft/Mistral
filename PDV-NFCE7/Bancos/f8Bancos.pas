unit f8Bancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal,
  Menus;

type
  Tfrm_F8Bancos = class(TForm)
    grade: TDBGrid;
    ds: TDataSource;
    pn_procurar: TPanel;
    Label1: TLabel;
    edt_nome: TMaskEdit;
    Panel3: TPanel;
    botao_sair: TPanel;
    botaoProcurar: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Bevel4: TBevel;
    Image2: TImage;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure botaoProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_F8Bancos: Tfrm_F8Bancos;

implementation

uses funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_F8Bancos.BitBtn1Click(Sender: TObject);
begin
  close;
end;

{botao de procurar e filtrar a querie, usando o FILTER}
{A consulta tem um boa performance porque � executada localmente}
procedure Tfrm_F8Bancos.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('BA_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('BA_CODI').asstring;
    frm_F8Bancos.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_F8Bancos.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_nome.setfocus;
end;

procedure Tfrm_F8Bancos.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo bancos...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  grade.setfocus;
  edt_nome.text:='';
end;

procedure Tfrm_F8Bancos.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    botaoProcurarClick(Sender);
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_F8Bancos.close;
  if (key=K_F2) then
    grade.setfocus;
end;

{Botao de cadastro de lojas ***}
procedure Tfrm_F8Bancos.botao_sairClick(Sender: TObject);
begin
  close;
end;

{Duplo clique ***}
procedure Tfrm_F8Bancos.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('BA_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('BA_CODI').asstring;
  frm_F8Bancos.close
end;

procedure Tfrm_F8Bancos.botaoProcurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_nome.text)<>'') then
    begin
      filter   := 'ba_nome='+chr(39)+Trim(edt_nome.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

end.