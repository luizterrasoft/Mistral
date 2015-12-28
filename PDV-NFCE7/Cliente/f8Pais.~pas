unit f8Pais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, Mask, DBTables;

type
  TFrmF8Pais = class(TForm)
    botao_procurar: TPanel;
    lbl1: TLabel;
    edt_nome: TMaskEdit;
    botao2: TPanel;
    botao3: TPanel;
    botao1: TPanel;
    botao_sair: TPanel;
    botaoProcurar: TPanel;
    img1: TImage;
    lbl2: TLabel;
    lbl3: TLabel;
    dbgGrade: TDBGrid;
    ds: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure botaoProcurarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgGradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgGradeDblClick(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_nomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
    labelCodPais: TObject;
    exterior: Boolean;
  end;

var
  FrmF8Pais: TFrmF8Pais;

implementation

uses principal, funcoes2, un_AjudaComandos;

{$R *.dfm}

procedure TFrmF8Pais.FormActivate(Sender: TObject);
begin
  TQuery(ds.DataSet).Filtered := false;
  TQuery(ds.DataSet).Filter   := '';
  if (not TQuery(ds.DataSet).Active) then
  begin
    if (exterior) then
    begin
      TQuery(ds.DataSet).SQL.Clear;
      TQuery(ds.DataSet).SQL.Add('SELECT *    ');
      TQuery(ds.DataSet).SQL.Add('FROM PAISES ');
      TQuery(ds.DataSet).SQL.Add('WHERE ID<>'+QuotedStr('01058'));
    end
    else
    begin
      TQuery(ds.DataSet).SQL.Clear;
      TQuery(ds.DataSet).SQL.Add('SELECT *    ');
      TQuery(ds.DataSet).SQL.Add('FROM PAISES ');
    end;
    mostra_mensagem ('Carregando paises... Aguarde!');
    TQuery(ds.DataSet).Open;
    TQuery(ds.DataSet).Last;
    esconde_mensagem;
  end;
  TQuery(ds.DataSet).First;
  edt_nome.Text := '';
  edt_nome.SetFocus;
end;

procedure TFrmF8Pais.botaoProcurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_nome.Text) <> '') then
    begin
      filter   := 'PAIS='+chr(39)+Trim(edt_nome.Text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure TFrmF8Pais.botao_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmF8Pais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ESC) then
    Close;
  if (key = K_F1) then
  begin
    ListaAtalhosF1.Clear;
    ListaAtalhosF1.Add('                        -- Atalhos --');
    ListaAtalhosF1.Add(' ');
    ListaAtalhosF1.Add('  [F2]  - Alterna entre grade e filtro ');
    ListaAtalhosF1.Add('  [ESC] - Sai');
    Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
    frm_AjudaComandos.ShowModal;
    frm_AjudaComandos.Free;
  end;
end;

procedure TFrmF8Pais.dbgGradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).Text := TQuery(ds.dataset).FieldByName('PAIS').AsString;
    if (edit is TMaskedit) then
      TMaskEdit(edit).Text := TQuery(ds.dataset).FieldByName('PAIS').AsString;
    TLabel(labelCodPais).Caption := TQuery(ds.DataSet).FieldByName('ID').AsString;
    Close;
  end;
  if (key = K_ESC) then
    Close;
  if (key = K_F2) then
    edt_nome.SetFocus;
end;

procedure TFrmF8Pais.dbgGradeDblClick(Sender: TObject);
begin
  if (edit is TEdit) then
    TEdit(edit).Text := TQuery(ds.dataset).FieldByName('PAIS').AsString;
  if (edit is TMaskEdit) then
    TMaskEdit(edit).Text := TQuery(ds.dataset).FieldByName('PAIS').AsString;
  TLabel(labelCodPais).Caption := TQuery(ds.DataSet).FieldByName('ID').AsString;
  Close;
end;

procedure TFrmF8Pais.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) then
  begin
    botaoProcurar.OnClick(Self);
    dbgGrade.SetFocus;
  end;
  if (key = K_F2) then
    dbgGrade.SetFocus;
  if (key = K_ESC) then
    Close;
end;

procedure TFrmF8Pais.edt_nomeChange(Sender: TObject);
begin
  botaoProcurarClick(Self);
end;

end.
