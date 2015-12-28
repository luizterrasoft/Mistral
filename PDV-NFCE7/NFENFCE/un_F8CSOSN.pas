unit un_F8CSOSN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal;

type
  Tfrm_F8CSOSN = class(TForm)
    grade: TDBGrid;
    pn_procurar: TPanel;
    Label1: TLabel;
    edt_Desc: TMaskEdit;
    Panel3: TPanel;
    botao_sair: TPanel;
    ds: TDataSource;
    botaoProcurar: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Bevel4: TBevel;
    Label12: TLabel;
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure botaoProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_F8CSOSN: Tfrm_F8CSOSN;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, DM30;

procedure Tfrm_F8CSOSN.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_F8CSOSN.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CODIGO').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CODIGO').asstring;
  frm_F8CSOSN.close;
end;

procedure Tfrm_F8CSOSN.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CODIGO').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CODIGO').asstring;
    frm_F8CSOSN.close;
  end;

     {teclando esc, ele sai}
  if (key=K_ESC) then
    frm_F8CSOSN.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_desc.setfocus;
end;

procedure Tfrm_F8CSOSN.edt_DescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
  if (key=K_ENTER) then
  begin
    botaoProcurarClick(Sender);
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_F8CSOSN.Close;

     {teclando o F2}
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_F8CSOSN.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo CSOSNs...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  edt_desc.text:='';
  grade.setfocus;
end;

procedure Tfrm_F8CSOSN.botaoProcurarClick(Sender: TObject);
begin
{ INICIO }
{ DEIXEI COMO COMENTÁRIO - LUIZ CAPINZAL - SC, 15.10.2015 20:52 }

{  with TQuery(ds.dataset) do
    if (Trim(edt_desc.text)<>'') then
    begin
      filter   := 'DESCRICAO='+chr(39)+Trim(edt_desc.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;}

{ FIM }


{ MEU CODIGO - LUIZ CAPINZAL - SC, 15.10.2015 20:52 }
  DMNFE.qCSOSNF8.Close;
  DMNFE.qCSOSNF8.SQL.Clear;
  DMNFE.qCSOSNF8.SQL.Add('SELECT * FROM CSOSN');
  DMNFE.qCSOSNF8.SQL.Add('WHERE descricao LIKE :desc');
  DMNFE.qCSOSNF8.ParamByName('desc').AsString := '%' + edt_Desc.Text + '%';
  DMNFE.qCSOSNF8.Active := True;
  DMNFE.qCSOSNF8.Open;
end;

end.
