unit un_F8Tamanhos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal;

type
  Tfrm_F8Tamanhos = class(TForm)
    grade: TDBGrid;
    pn_procurar: TPanel;
    Label1: TLabel;
    edt_Desc: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_procurar: TBitBtn;
    btnCadastro: TBitBtn;
    botao_sair: TPanel;
    ds: TDataSource;
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_procurarClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_F8Tamanhos: Tfrm_F8Tamanhos;

implementation

{$R *.DFM}

uses funcoes1, funcoes2;

procedure Tfrm_F8Tamanhos.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_F8Tamanhos.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('TM_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('TM_CODI').asstring;
  frm_F8Tamanhos.close;
end;

procedure Tfrm_F8Tamanhos.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('TM_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('TM_CODI').asstring;
    frm_F8Tamanhos.close;
  end;

     {teclando esc, ele sae}
  if (key=K_ESC) then
    frm_F8Tamanhos.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_desc.setfocus;
end;

procedure Tfrm_F8Tamanhos.edt_DescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    btn_procurar.click;
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_F8Tamanhos.Close;

     {teclando o F2}
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_F8Tamanhos.btn_procurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_desc.text)<>'') then
    begin
      filter   := 'tm_desc='+chr(39)+Trim(edt_desc.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure Tfrm_F8Tamanhos.btnCadastroClick(Sender: TObject);
begin
     {...}

     {relendo as lojas cadastradas}
  TQuery(ds.dataset).close;
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).open;
  grade.setfocus;
  edt_desc.text := '';
end;

procedure Tfrm_F8Tamanhos.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo tipos de tamanho...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  edt_desc.text:='';
  grade.setfocus;
end;

end.
