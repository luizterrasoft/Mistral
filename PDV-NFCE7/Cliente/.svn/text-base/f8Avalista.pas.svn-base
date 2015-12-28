unit f8Avalista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, DB, principal, DbTables;

type
  Tfrm_f8Avalistas = class(TForm)
    grade: TDBGrid;
    pn_procurar: TPanel;
    Label1: TLabel;
    edt_nome: TMaskEdit;
    ds: TDataSource;
    Panel3: TPanel;
    botao_sair: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    procedure F(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btn_procurarClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
  end;

var
  frm_f8Avalistas: Tfrm_f8Avalistas;

implementation

uses F8Lojas, funcoes1, funcoes2, f8Clientes, cadcli;

{$R *.DFM}

procedure Tfrm_f8Avalistas.F(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
  if (key=K_ENTER) then
  begin
    if (edit is Tedit) then
      TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CL_CODI').asstring;
    if (edit is TMaskedit) then
      TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CL_CODI').asstring;
    frm_F8Clientes.close;
  end;
  if (key=K_ESC) then
    frm_F8Avalistas.Close;
  if (key=K_F2) then
    edt_nome.setfocus;
end;

procedure Tfrm_f8Avalistas.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
     {if (key=K_ENTER) then
     begin
       btn_procurar.click;
       grade.setfocus;
     end;}
  if (key=K_ESC) then
    frm_F8Avalistas.Close;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_f8Avalistas.FormActivate(Sender: TObject);
begin
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).filter  :='';
  if (not TQuery(ds.dataset).active) then
  begin
    mostra_mensagem ('Abrindo clientes...Aguarde!');
        {fectch all ***}
    TQuery(ds.dataset).open;
    TQuery(ds.dataset).last;
    esconde_mensagem;
  end;
  TQuery(ds.dataset).first;
  edt_nome.text:='';
  edt_nome.setfocus;
end;

procedure Tfrm_f8Avalistas.btn_procurarClick(Sender: TObject);
begin
  with TQuery(ds.dataset) do
    if (Trim(edt_nome.text)<>'') then
    begin
      filter   := 'cl_nome='+chr(39)+Trim(edt_nome.text)+'*'+chr(39);
      filtered := true;
    end
    else
    begin
      filter   := '';
      filtered := false;
    end;
end;

procedure Tfrm_f8Avalistas.btnCadastroClick(Sender: TObject);
begin
     {relendo as lojas cadastradas}
  TQuery(ds.dataset).close;
  TQuery(ds.dataset).filtered:=false;
  TQuery(ds.dataset).open;
  grade.setfocus;
  edt_nome.text := '';
end;

procedure Tfrm_f8Avalistas.botao_sairClick(Sender: TObject);
begin
  close;
end;

{Duplo clique ***}
procedure Tfrm_f8Avalistas.gradeDblClick(Sender: TObject);
begin
  if (edit is Tedit) then
    TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CL_CODI').asstring;
  if (edit is TMaskedit) then
    TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CL_CODI').asstring;
  frm_F8Clientes.close;
end;

procedure Tfrm_f8Avalistas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_edtCliente.edtValMerc.SetFocus;
end;

end.
