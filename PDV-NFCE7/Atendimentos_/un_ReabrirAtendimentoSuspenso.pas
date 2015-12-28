unit un_ReabrirAtendimentoSuspenso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, BotaoSair, StdCtrls, LabelOO, DB, DBTables,
  Grids, DBGrids;

type
  Tfrm_ReabrirAtendimentoSuspenso = class(TForm)
    BotaoSair1: TBotaoSair;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    Label3: TLabel;
    Label10: TLabel;
    Image2: TImage;
    Bevel1: TBevel;
    LabelOO1: TLabelOO;
    ds1: TDataSource;
    grade: TDBGrid;
    LabelOO2: TLabelOO;
    qAtendimentos: TQuery;
    qAtendimentosAT_CAIX: TFloatField;
    qAtendimentosAT_LOJA: TFloatField;
    qAtendimentosAT_CODI: TFloatField;
    qAtendimentosAT_FUNC: TFloatField;
    qAtendimentosAT_DATA: TDateTimeField;
    qAtendimentosAT_TOTA: TFloatField;
    qAtendimentosAT_QTDE: TFloatField;
    qAtendimentosAT_VEND: TFloatField;
    Label1: TLabel;
    lblVend: TLabel;
    procedure BotaoSair1Click(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ativou: Boolean;
    y_loja: Real;
    y_data: TDateTime;
    y_vendedor: Real;
    tecla: Integer;
    procedure RefrescaTabela;
  end;

var
  frm_ReabrirAtendimentoSuspenso: Tfrm_ReabrirAtendimentoSuspenso;

implementation

{$R *.dfm}

uses procura;

procedure Tfrm_ReabrirAtendimentoSuspenso.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ReabrirAtendimentoSuspenso.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ReabrirAtendimentoSuspenso.FormActivate(Sender: TObject);
begin
  if (not ativou) then
  begin
    RefrescaTabela;
    lblVend.caption := ProcuraNomeVend(y_loja,y_vendedor,self);
    ativou:=true;
  end;
  grade.setfocus;
end;

procedure Tfrm_ReabrirAtendimentoSuspenso.RefrescaTabela;
begin
  with (qAtendimentos) do
  begin
    close;
    parambyname('loja').AsFloat     := y_loja;
    parambyname('data').AsDateTime  := y_data;
    parambyname('vendedor').AsFloat := y_vendedor;
    open;
    first;
  end;
end;

procedure Tfrm_ReabrirAtendimentoSuspenso.gradeDblClick(Sender: TObject);
begin
  tecla:=13;
  close; 
end;

procedure Tfrm_ReabrirAtendimentoSuspenso.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
  begin
    tecla:=13;
    close;
  end;
end;

procedure Tfrm_ReabrirAtendimentoSuspenso.FormCreate(Sender: TObject);
begin
  tecla:=27;
end;

end.
