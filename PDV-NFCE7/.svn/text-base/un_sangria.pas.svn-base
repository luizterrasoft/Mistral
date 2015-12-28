unit un_sangria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, Mask;

type
  Tfrm_sangria = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    btnFecharSessao: TButton;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Abrirsesso1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    Memo1: TMemo;
    Label1: TLabel;
    edtValor: TMaskEdit;
    Label3: TLabel;
    Label2: TLabel;
    edtTipo: TMaskEdit;
    Panel1: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtTipoEnter(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure btnFecharSessaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_valor_atual: Real;
  end;

var
  frm_sangria: Tfrm_sangria;

implementation

uses unDialogo, principal, funcoes1, funcoes2, procura, auxiliar;

{$R *.DFM}

procedure Tfrm_sangria.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_sangria.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_sangria.edtValorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_sangria.edtTipoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_sangria.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtTipo.setfocus;
  if (key=K_CIMA) then;
end;

procedure Tfrm_sangria.edtTipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnFecharSessao.click;
  if (key=K_CIMA) then
    edtValor.setfocus;
end;

procedure Tfrm_sangria.edtValorExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtValor);
end;

procedure Tfrm_sangria.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico(edtValor);
end;

procedure Tfrm_sangria.Limparformulrio1Click(Sender: TObject);
begin
  edtValor.text:='';
  edtTipo.text:='';
  edtValor.setfocus;
end;

procedure Tfrm_sangria.FormCreate(Sender: TObject);
var
  clSessao: TClassAuxiliar;
begin
  y_valor_atual:=0;
  memo1.lines.clear;
  memo1.lines.add ('');
  memo1.lines.add ('  Loja...........: '+form_nz(frm_principal.x_loja,2)+'-'+
    ProcuraNomeLoja(frm_principal.x_loja,self));
  memo1.lines.add ('  Caixa..........: '+form_nz(frm_principal.x_terminal,2)+'-'+
    ProcuraNomeCaixa(frm_principal.x_loja,frm_principal.x_terminal,self));
  memo1.lines.add ('  Data...........: '+form_data(date));
  memo1.lines.add ('  Hora...........: '+FormatDateTime('hh:nn',time));
     {***}
  clSessao := TClassAuxiliar.Create;
  clSessao.conect  ('VENDAS',self);
  clSessao.ClearSql;
  clSessao.AddParam('SELECT * FROM SESSAO_CAIXA                                  ');
  clSessao.AddParam('WHERE (SC_LOJA='+floattostr(frm_principal.x_loja)+') AND                  ');
  clSessao.AddParam('      (SC_CAIX='+floattostr(frm_principal.x_terminal)+') AND                 ');
  clSessao.AddParam('      (SC_DATA='+chr(39)+FormataData(date)+chr(39)+')       ');
  clSessao.AddParam('ORDER BY SC_DATA                                            ');
  if (clSessao.Execute) then
  begin
    memo1.lines.add('  Valor atual ..$: '+form_nc(clSessao.result('SC_VALO'),10));
    y_valor_atual:=clSessao.result('SC_VALO');
  end;
  clSessao.desconect;
  clSessao.Free;
end;

procedure Tfrm_sangria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_sangria.Abrirsesso1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  mens,tipo: String;
  valor: Real;
begin
     {CRITICA}
  if (Trim(edtValor.text)='') or (Trim(edtValor.text)='0,00') then
  begin
    frmDialogo.ExibirMensagem ('O valor não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
  end
  else
  if (Trim(edtTipo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O tipo não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtTipo.setfocus;
  end
  else
  begin
    tipo := Trim(edtTipo.text);
    if (tipo='E') then
      mens:='reprovisionamento'
    else
    if (tipo='S') then
      mens:='sangria';
    valor := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));

       {CRITICA}
    if (y_valor_atual<valor) and (tipo='S') then
    begin
      frmDialogo.ExibirMensagem ('Valor de retirada maior do que o presente na gaveta!'
        ,'Vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtValor.setfocus;
    end
    else
    if (frmDialogo.ExibirMensagem ('Confirma '+mens+'?'
      ,'Vendas',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
              {gerando o lancamento}
      clAux := TClassAuxiliar.Create;
      clAux.conect  ('VENDAS',self);
      clAux.ClearSql;
      clAux.AddParam('INSERT INTO SANGRIAS (SA_LOJA,SA_CAIX,SA_TIPO,SA_VALO,      ');
      clAux.AddParam('  SA_CDES,SA_DATA,SA_HORA)                                  ');
      clAux.AddParam('VALUES (:SA_LOJA,:SA_CAIX,:SA_TIPO,:SA_VALO,                ');
      clAux.AddParam('  :SA_CDES,:SA_DATA,:SA_HORA)                               ');
      clAux.consulta.parambyname('SA_LOJA').AsFloat    := frm_principal.x_loja;
      clAux.consulta.parambyname('SA_CAIX').AsFloat    := frm_principal.x_terminal;
      clAux.consulta.parambyname('SA_DATA').AsDateTime := date;
      clAux.consulta.parambyname('SA_HORA').AsString   := FormatDateTime('hh:nn',time);
      clAux.consulta.parambyname('SA_CDES').AsFloat    := 0;
      clAux.consulta.parambyname('SA_VALO').AsFloat    := valor;
      clAux.consulta.parambyname('SA_TIPO').AsString   := tipo;
      clAux.Execute;

              {Atualizando o valor em gaveta, nesta sessao}
      clAux.ClearSql;
      clAux.AddParam('UPDATE SESSAO_CAIXA                                         ');
      clAux.AddParam('SET SC_VALO=:SC_VALO                                        ');
      clAux.AddParam('WHERE (SC_LOJA='+floattostr(frm_principal.x_loja)+') AND    ');
      clAux.AddParam('      (SC_CAIX='+floattostr(frm_principal.x_terminal)+') AND   ');
      clAux.AddParam('      (SC_DATA='+chr(39)+FormataData(date)+chr(39)+')       ');
      if (tipo='E') then
        clAux.consulta.parambyname('SC_VALO').AsFloat := y_valor_atual + valor
      else
      if (tipo='S') then
        clAux.consulta.parambyname('SC_VALO').AsFloat := y_valor_atual - valor;
      clAux.Execute;
      clAux.desconect;
      clAux.Free;

              {Comando de abertura da gaveta>>>}
      close;
    end;
  end;
end;

procedure Tfrm_sangria.btnFecharSessaoClick(Sender: TObject);
begin
  Abrirsesso1.click;
end;

procedure Tfrm_sangria.FormActivate(Sender: TObject);
begin
  edtValor.setfocus;
end;

end.
