unit f8Cep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls, Db, DbTables, DBCtrls,
  LabelOO;

type
  Tfrm_f8Cep = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    botao_sair: TPanel;
    grade: TDBGrid;
    pn_procurar: TPanel;
    pnEndereco: TPanel;
    Label1: TLabel;
    edtEndereco: TMaskEdit;
    pnBairro: TPanel;
    Label2: TLabel;
    edtBairro: TMaskEdit;
    ds: TDataSource;
    qCepsF8: TQuery;
    qCepsF8UF: TStringField;
    qCepsF8CEP: TStringField;
    qCepsF8TIPO: TStringField;
    qCepsF8LOGRADOURO: TStringField;
    qCepsF8COMPLEMENT: TStringField;
    qCepsF8BAIRRO1: TStringField;
    qCepsF8BAIRRO2: TStringField;
    qCepsF8CIDADE: TStringField;
    qCepsF8TIPOLOCAL: TStringField;
    Panel4: TPanel;
    lblComplemento: TLabel;
    DBComplemento: TDBText;
    Bevel1: TBevel;
    btn_procurar: TBitBtn;
    procedure botao_sairClick(Sender: TObject);
    procedure edtEnderecoEnter(Sender: TObject);
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBairroEnter(Sender: TObject);
    procedure edtBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btn_procurarClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject;
    procedure PesquisaCep;
    procedure AjustaPaineis(i: integer);
  end;

var
  frm_f8Cep: Tfrm_f8Cep;

implementation

{$R *.DFM}

uses principal;

procedure Tfrm_f8Cep.botao_sairClick(Sender: TObject);
begin
     close;
end;

procedure Tfrm_f8Cep.edtEnderecoEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_f8Cep.edtEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ESC) then close;
     if (key=K_ENTER) then btn_procurar.click;
     if (key=K_F2) then grade.setfocus;
     if (key=K_F7) then
     begin
          ds.dataset.close;
          pnEndereco.visible:=false;
          pnBairro.visible:=true;
          edtBairro.setfocus;
     end;
end;

procedure Tfrm_f8Cep.edtBairroEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_f8Cep.edtBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ESC) then close;
     if (key=K_ENTER) then btn_procurar.click;
     if (key=K_F2) then grade.setfocus;
     if (key=K_F7) then
     begin
          ds.dataset.close;
          pnEndereco.visible:=true;
          pnBairro.visible:=false;
          edtEndereco.setfocus;
     end;
end;

procedure Tfrm_f8Cep.FormActivate(Sender: TObject);
begin
     if (pnEndereco.visible) then
         edtEndereco.setfocus
     else if (pnBairro.visible) then
         edtBairro.setfocus;
end;

procedure Tfrm_f8Cep.btn_procurarClick(Sender: TObject);
begin
     PesquisaCep;
     grade.setfocus;
end;

procedure Tfrm_f8Cep.gradeDblClick(Sender: TObject);
begin
     if (edit is Tedit) then
       TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CEP').asstring;
     if (edit is TMaskedit) then
       TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CEP').asstring;
     frm_F8Cep.close;
end;

procedure Tfrm_f8Cep.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ENTER) then
     begin
          if (edit is Tedit) then
            TEdit(edit).text := TQuery(ds.dataset).fieldbyname('CEP').asstring;
          if (edit is TMaskedit) then
            TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname('CEP').asstring;
          frm_F8Cep.close;
     end;
     if (key=K_F2) then
     begin
          if (pnEndereco.visible) then edtEndereco.setfocus
          else if (pnBairro.visible) then edtBairro.setfocus;
     end;
     if (key=K_ESC) then
     begin
          ds.dataset.close;
          if (pnEndereco.visible) then
              edtEndereco.setfocus
          else if (pnBairro.visible) then
              edtBairro.setfocus;
     end;
end;

procedure Tfrm_f8Cep.PesquisaCep;
var
endereco,bairro: string;
begin
     if (pnEndereco.visible) then
     begin
         AjustaPaineis(0);
         endereco:=Trim(edtEndereco.text);
         if (endereco<>'') then
         begin
             TQuery(ds.dataset).close;
             TQuery(ds.dataset).sql.clear;
             TQuery(ds.dataset).sql.Add ('Select  * FROM CEP                                         ');
             TQuery(ds.dataset).sql.Add ('Where  (LOGRADOURO LIKE '+chr(39)+endereco+'%'+chr(39)+')  ');
             TQuery(ds.dataset).sql.Add ('Order by UF,LOGRADOURO,CIDADE                              ');
             TQuery(ds.dataset).open;
         end
         else TQuery(ds.dataset).close;
     end
     else if (pnBairro.visible) then
     begin
         AjustaPaineis(1);
         bairro:=Trim(edtBairro.text);
         if (bairro<>'') then
         begin
             TQuery(ds.dataset).close;
             TQuery(ds.dataset).sql.clear;
             TQuery(ds.dataset).sql.Add ('Select  * FROM CEP                                         ');
             TQuery(ds.dataset).sql.Add ('Where  (BAIRRO1 LIKE '+chr(39)+bairro+'%'+chr(39)+')       ');
             TQuery(ds.dataset).sql.Add ('Order by UF,BAIRRO1,CIDADE                                 ');
             TQuery(ds.dataset).open;
         end
         else TQuery(ds.dataset).close;
     end;
end;

procedure Tfrm_f8Cep.AjustaPaineis(i: integer);
begin
     if (i=0) then {endereco}
     begin
          lblComplemento.caption  :='Bairro';
          DBComplemento.datafield :='BAIRRO1';
          grade.columns[2].fieldname     :='LOGRADOURO';
          grade.columns[2].title.caption :='Endereço';
          grade.columns[6].fieldname :='BAIRRO1';
          grade.columns[6].title.caption :='Bairro';
     end
     else if (i=1) then {bairro}
     begin
          lblComplemento.caption :='Endereço';
          DBComplemento.datafield :='LOGRADOURO';
          grade.columns[2].fieldname :='BAIRRO1';
          grade.columns[2].title.caption :='Bairro';
          grade.columns[6].fieldname :='LOGRADOURO';
          grade.columns[6].title.caption :='Endereço';
     end;
end;

end.
