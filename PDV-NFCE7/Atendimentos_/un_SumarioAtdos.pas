unit un_SumarioAtdos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, StdCtrls, Mask, MaskEditOO, LabelOO, Menus,
  CheckBoxOO;

type
  Tfrm_SumarioAtdos = class(TForm)
    BotaoSair1: TBotaoSair;
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    LabelOO1: TLabelOO;
    edtData: TMaskEditOO;
    Memo1: TMemo;
    botao1: TPanel;
    Buscaratendimentos1: TMenuItem;
    Label3: TLabel;
    Label1: TLabel;
    Image2: TImage;
    Bevel2: TBevel;
    chSumarizar: TCheckBoxOO;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure edtDataEnter(Sender: TObject);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Buscaratendimentos1Click(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SumarioAtdos: Tfrm_SumarioAtdos;

implementation

uses principal, auxiliar, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_SumarioAtdos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_SumarioAtdos.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_SumarioAtdos.botao1Click(Sender: TObject);
begin
  Buscaratendimentos1.click;
end;

procedure Tfrm_SumarioAtdos.edtDataEnter(Sender: TObject);
begin
  if (edtData.GetValor=strtodate('01/01/1900')) then
    edtData.text := form_data(frm_principal.x_data_trabalho);   
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_SumarioAtdos.edtDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botao1Click(Sender);
end;

procedure Tfrm_SumarioAtdos.Limparformulrio1Click(Sender: TObject);
begin
  edtData.text := '';
  memo1.lines.clear;
  edtData.setfocus;
end;

procedure Tfrm_SumarioAtdos.FormActivate(Sender: TObject);
begin
  edtData.setfocus;
end;

procedure Tfrm_SumarioAtdos.Buscaratendimentos1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  qtdAtdo: Integer;
  totalAtdo: Real;
begin
  if (edtData.GetValor<>strtodate('01/01/1900')) then
  begin
    memo1.lines.clear;
    memo1.lines.Add('');

    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT AT_TOTA FROM ATENDIMENTOS                                     ');
    clAux.AddParam ('WHERE (AT_LOJA=:loja) AND                                            ');
    clAux.AddParam ('      (AT_DATA=:data) AND                                            ');
    clAux.AddParam ('      (AT_STAT=:status)                                              ');
    if (not chSumarizar.checked) then
      clAux.AddParam ('  AND (AT_CAIX=:terminal)                                         ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    clAux.consulta.parambyname('data').AsDateTime  := edtData.GetValor;
    clAux.consulta.parambyname('status').AsString  := '0'; //em andamento
    if (not chSumarizar.checked) then
      clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
    clAux.Execute; {*}
    clAux.first;
    qtdAtdo   := 0;
    totalAtdo := 0.00;
    while (not clAux.eof) do
    begin
      qtdAtdo   := qtdAtdo + 1;
      totalAtdo := totalAtdo + clAux.result('AT_TOTA');

               {---->}
      clAux.next;
    end;
    memo1.lines.Add(' Em Andamento....: '+form_n(qtdAtdo,8)+' '+form_nc(totalAtdo,10));
    clAux.desconect;
    clAux.Free;

    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT AT_TOTA FROM ATENDIMENTOS                                     ');
    clAux.AddParam ('WHERE (AT_LOJA=:loja) AND (AT_CAIX=:terminal) AND (AT_DATA=:data)    ');
    clAux.AddParam ('      AND (AT_STAT=:status)                                          ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
    clAux.consulta.parambyname('data').AsDateTime  := edtData.GetValor;
    clAux.consulta.parambyname('status').AsString  := '1'; //concluido
    clAux.Execute; {*}
    clAux.first;
    qtdAtdo   := 0;
    totalAtdo := 0.00;
    while (not clAux.eof) do
    begin
      qtdAtdo   := qtdAtdo + 1;
      totalAtdo := totalAtdo + clAux.result('AT_TOTA');

               {---->}
      clAux.next;
    end;
    memo1.lines.Add(' Concluído.......: '+form_n(qtdAtdo,8)+' '+form_nc(totalAtdo,10));
    clAux.desconect;
    clAux.Free;

    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT AT_TOTA FROM ATENDIMENTOS                                     ');
    clAux.AddParam ('WHERE (AT_LOJA=:loja) AND (AT_CAIX=:terminal) AND (AT_DATA=:data)    ');
    clAux.AddParam ('      AND (AT_STAT=:status)                                          ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
    clAux.consulta.parambyname('data').AsDateTime  := edtData.GetValor;
    clAux.consulta.parambyname('status').AsString  := '2'; //cancelado
    clAux.Execute; {*}
    clAux.first;
    qtdAtdo   := 0;
    totalAtdo := 0.00;
    while (not clAux.eof) do
    begin
      qtdAtdo   := qtdAtdo + 1;
      totalAtdo := totalAtdo + clAux.result('AT_TOTA');

               {---->}
      clAux.next;
    end;
    memo1.lines.Add(' Cancelado.......: '+form_n(qtdAtdo,8)+' '+form_nc(totalAtdo,10));
    clAux.desconect;
    clAux.Free;

    memo1.lines.Add('- - - - - - - - - - - - - - - - - - - - -');
  end;
end;

procedure Tfrm_SumarioAtdos.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

end.
