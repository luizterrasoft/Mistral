unit un_Indexar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Gauges, Db, DBTables;

type
  Tfrm_Indexar = class(TForm)
    Label1: TLabel;
    Image2: TImage;
    Label6: TLabel;
    Label12: TLabel;
    lista: TListBox;
    btnIndexar: TPanel;
    btnIndexarTabela: TPanel;
    botao_sair: TPanel;
    Gauge1: TGauge;
    lblprogresso: TLabel;
    qIndices: TQuery;
    qIndicesARQUIVO: TStringField;
    qIndicesNOME: TStringField;
    qIndicesCAMPOS: TStringField;
    qIndexar: TQuery;
    Bevel1: TBevel;
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIndexarTabelaClick(Sender: TObject);
    procedure btnIndexarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    jaChamou: Boolean;
    procedure RotinaIndexacao (nomearq: String);
  end;

var
  frm_Indexar: Tfrm_Indexar;

implementation

{$R *.DFM}

uses auxiliar,principal, unDialogo, venda;

procedure Tfrm_Indexar.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Indexar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_Indexar.btnIndexarTabelaClick(Sender: TObject);
var
  nome_arquivo: String;
begin
  if (lista.itemindex>=0) then
    if (frmDialogo.ExibirMensagem ('Confirma indexação da tabela selecionada?',
      'Indexação',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
    begin
      nome_arquivo := trim(lista.items[lista.itemindex]);
      RotinaIndexacao (nome_arquivo);
    end;
end;

procedure Tfrm_Indexar.btnIndexarClick(Sender: TObject);
var
  ind,tot: Integer;
  nome_arquivo: String;
begin
  if (frmDialogo.ExibirMensagem ('Confirma indexação de todas as tabelas?',
    'Indexação',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
    250,200)=mrYes) then
  begin
    ind:=0;
    tot:=lista.items.count;
    gauge1.visible:=true;
    lblprogresso.visible:=true;
    gauge1.progress:=0;
    while (ind<tot) do
    begin
      nome_arquivo := trim(lista.items[ind]);
      RotinaIndexacao (nome_arquivo);
      ind:=ind+1;
      gauge1.progress:=Round((ind/tot)*100);
      gauge1.refresh;
    end;
    gauge1.visible:=false;
    lblprogresso.visible:=false;
    frmDialogo.ExibirMensagem ('Indexação concluída!'
      ,'Indexação',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end;
end;

procedure Tfrm_Indexar.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (not jaChamou) then
  begin
    ReformularProjetoIndicesVENDAS;
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT DISTINCT ARQUIVO FROM INDICES ');
    clAux.Execute;
    clAux.first;
    lista.items.clear;
    while (not clAux.eof) do
    begin
      lista.items.Add(UpperCase(clAux.result('ARQUIVO')));
               {--->}
      clAux.next;
    end;
    clAux.desconect;
    clAux.Free;
    jaChamou:=true;
  end;
end;

procedure Tfrm_Indexar.FormCreate(Sender: TObject);
begin
  jaChamou:=false;
end;

procedure Tfrm_Indexar.RotinaIndexacao (nomearq: String);
var
  banco: Integer;
begin
  banco := frm_principal.x_banco_de_dados;
  with (qIndices) do
  begin
    open;
    filtered := false;
    filter   := 'ARQUIVO='+chr(39)+nomearq+chr(39);
    filtered := true;
    first;
    while (not eof) do
    begin
      with (qIndexar) do
      begin
        try
          sql.clear;
          if (banco=KDB_INTERBASE) then
            sql.Add ('DROP INDEX '+qIndices.fieldbyname('NOME').AsString+'')
          else
          if (banco=KDB_SQL_SERVER) then
            sql.Add ('DROP INDEX '+nomearq+'.'+qIndices.fieldbyname('NOME').AsString+'');
          execsql;
        except
        end;
        try
          sql.clear;
          sql.Add ('CREATE INDEX '+qIndices.fieldbyname('NOME').AsString);
          sql.Add ('ON '+nomearq+'('+qIndices.fieldbyname('CAMPOS').AsString+')');
          execsql;
        except
        end;
      end;
      next;
    end;
  end;
  frm_principal.ExibirDica ('Indexação concluida!',5);
end;

end.
