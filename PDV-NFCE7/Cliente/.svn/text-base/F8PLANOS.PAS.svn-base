unit f8planos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, Buttons, Mask, principal;

type
  Tfrm_f8Planos = class(TForm)
    pn_procurar: TPanel;
    grade: TDBGrid;
    Label1: TLabel;
    edt_tipo: TMaskEdit;
    ds: TDataSource;
    Panel3: TPanel;
    botao_sair: TPanel;
    btnCadastro: TBitBtn;
    btnProcurar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_tipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
    consulta: Integer;
  end;

var
  frm_f8Planos: Tfrm_f8Planos;

implementation

uses DM1, funcoes1, funcoes2, cadcli, un_FechamentoVenda_Cred;

{$R *.DFM}

procedure Tfrm_f8Planos.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_f8Planos.btnProcurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_tipo.text)<>'') then
    begin
      filter := 'pl_Tipo='+chr(39)+Trim(edt_tipo.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure Tfrm_f8Planos.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo planos de pgto...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  edt_tipo.text:='';
  grade.SetFocus;
end;

procedure Tfrm_f8Planos.edt_tipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {enter}
  if (key=13) then
  begin
    btnProcurar.click;
    grade.setfocus;
  end;
  if (key=K_ESC) then
    frm_F8Planos.Close;

     {teclando o F2}
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_f8Planos.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=13) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('PL_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('PL_CODI').asstring;
    frm_F8planos.close;
  end;

     {teclando esc, ele sai}
  if (key=K_ESC) then
    frm_F8Planos.Close;

     {teclando F2}
  if (key=K_F2) then
    edt_tipo.setfocus;
end;

procedure Tfrm_f8Planos.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_f8Planos.btnCadastroClick(Sender: TObject);
begin
     
end;

{Duplo clique ***}
procedure Tfrm_f8Planos.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('PL_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('PL_CODI').asstring;
  frm_F8planos.close;
end;

procedure Tfrm_f8Planos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {if (consulta = 1) then
    frm_FechamentoVenda_Cred.edtValorEntrada.setfocus
  else
    frm_edtCliente.edtNumParc.SetFocus; }
end;

end.
