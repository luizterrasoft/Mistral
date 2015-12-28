{*** FORMULARIO DE CLASSE PAI - Para efetuar buscas de [F8] ***}
unit un_F8formulario1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, Grids, DBGrids, DBTables, principal;

type
  Tfrm_F8formulario1 = class(TForm)
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
    tabela: TQuery;
    procedure botao_sairClick(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_procurarClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DescEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    edit: TObject; {edit o qual sera jogado a informacao requerida}
    database: string; {nome do database da entidade}
    entidade: string; {armazena o nome da entidade que se esta trabalhando}
    labelentidade: string; {contem o LABEL da entidade - Ex. 'Cliente'}
    camposchaveprimaria: TStringList; {contem um vetor de strings com as chaves primarias da entidade - usado em SELECTS}
    atributosentidade: array[1..10] of TRegistroCampo; {contem informacoes sobre atributos em questao}
    labeldescricao: string; {indica o nome do campo descricao}

    {** Métodos do F8formulario1}
    procedure AjustaTabela; virtual;
    procedure AjustaCaption;
    procedure AjustaGrade;
  end;

var
  frm_F8formulario1: Tfrm_F8formulario1;

implementation

{$R *.DFM}

uses funcoes1, funcoes2;

procedure Tfrm_F8formulario1.botao_sairClick(Sender: TObject);
begin
     close;
end;

procedure Tfrm_F8formulario1.gradeDblClick(Sender: TObject);
begin
     if (edit is Tedit) then
       TEdit(edit).text := TQuery(ds.dataset).fieldbyname(camposchaveprimaria[0]).asstring;
     if (edit is TMaskedit) then
       TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname(camposchaveprimaria[0]).asstring;
     close;
end;

procedure Tfrm_F8formulario1.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando enter, seleciona}
     if (key=K_ENTER) then
     begin
       if (edit is Tedit) then
         TEdit(edit).text := TQuery(ds.dataset).fieldbyname(camposchaveprimaria[0]).asstring;
       if (edit is TMaskedit) then
         TMaskEdit(edit).text := TQuery(ds.dataset).fieldbyname(camposchaveprimaria[0]).asstring;
       close;
     end;

     {teclando esc, ele sae}
     if (key=K_ESC) then close;

     {teclando F2}
     if (key=K_F2) then edt_desc.setfocus;
end;

procedure Tfrm_F8formulario1.edt_DescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {teclando ENTER}
     if (key=K_ENTER) then
     begin
       btn_procurar.click;
       grade.setfocus;
     end;
     if (key=K_ESC) then close;

     {teclando o F2}
     if (key=K_F2) then grade.setfocus;
end;

procedure Tfrm_F8formulario1.btn_procurarClick(Sender: TObject);
begin
     with TQuery(ds.dataset) do
     begin
       if (Trim(edt_desc.text)<>'') then
       begin
         filter   := atributosentidade[2].nome+
                     '='+chr(39)+Trim(edt_desc.text)+'*'+chr(39);
         filtered := true;
       end
       else
       begin
         filter   := '';
         filtered := false;
       end;
     end;
end;

procedure Tfrm_F8formulario1.btnCadastroClick(Sender: TObject);
begin
     {relendo as lojas cadastradas}
     TQuery(ds.dataset).close;
     TQuery(ds.dataset).filtered:=false;
     TQuery(ds.dataset).open;
     grade.setfocus;
     edt_desc.text := '';
end;

procedure Tfrm_F8formulario1.FormActivate(Sender: TObject);
begin
     TQuery(ds.dataset).filtered:=false;
     TQuery(ds.dataset).filter  :='';
     if (not TQuery(ds.dataset).active) then
     begin
        mostra_mensagem ('Abrindo '+LowerCase(labelentidade)+'...Aguarde!');
        {fectch all ***}
        TQuery(ds.dataset).open;
        TQuery(ds.dataset).last;
        esconde_mensagem;
     end;
     TQuery(ds.dataset).first;
     edt_desc.text:='';
     grade.setfocus;
end;

procedure Tfrm_F8formulario1.AjustaCaption;
begin
     caption := 'Procurar por '+LowerCase(labelentidade);
     Panel2.caption := ' ENTER -> Seleciona o(a) '+LowerCase(labelentidade)+'               '+
                       'ESC-> Sai sem selecionar';
     Panel1.caption := ' F2 -> Alterna entre grade/'+labeldescricao;
     Label1.caption := labeldescricao;
end;

procedure Tfrm_F8formulario1.AjustaGrade;
begin
     with (grade) do
     begin
          grade.columns[0].fieldname     := atributosentidade[1].nome;
          grade.columns[0].title.caption := atributosentidade[1].labelcampo;
          grade.columns[1].fieldname     := atributosentidade[2].nome;
          grade.columns[1].title.caption := atributosentidade[2].labelcampo;
     end;
end;

procedure Tfrm_F8formulario1.AjustaTabela;
begin
     tabela.close;
     tabela.databasename:=database;
     with (tabela.sql) do
     begin
          clear;
          Add('SELECT '+atributosentidade[1].nome+','+atributosentidade[2].nome+'  ');
          Add('FROM '+entidade+'                                                   ');
          Add('ORDER BY '+atributosentidade[2].nome+'                              ');
     end;
end;

procedure Tfrm_F8formulario1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=Ord('C')) or (key=Ord('c')) then
     begin
         if (Shift=[ssCtrl]) then
         begin
              if (btnCadastro.visible) then btnCadastro.click;
         end;
     end;
end;

procedure Tfrm_F8formulario1.edt_DescEnter(Sender: TObject);
begin
     TMaskEdit(Sender).selectall;
end;

end.
