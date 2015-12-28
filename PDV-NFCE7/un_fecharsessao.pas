unit un_fecharsessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Menus, ExtCtrls;

type
  Tfrm_FecharSessao = class(TForm)
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
    Label2: TLabel;
    edtHoraFechamento: TMaskEdit;
    Panel1: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnLeituraX: TButton;
    N2: TMenuItem;
    EmitirReduoZdaImpressoraFiscal1: TMenuItem;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtHoraFechamentoEnter(Sender: TObject);
    procedure edtHoraFechamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharSessaoClick(Sender: TObject);
    procedure EmitirReduoZdaImpressoraFiscal1Click(Sender: TObject);
    procedure btnLeituraXClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_situacao: String;
    y_valor_final: Real;
  end;

var
  frm_FecharSessao: Tfrm_FecharSessao;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,auxiliar, unDialogo;

procedure Tfrm_FecharSessao.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FecharSessao.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FecharSessao.FormActivate(Sender: TObject);
begin
  edtHoraFechamento.setfocus;
end;

procedure Tfrm_FecharSessao.Limparformulrio1Click(Sender: TObject);
begin
  edtHoraFechamento.text := '  :  ';
  edtHoraFechamento.setfocus;
end;

procedure Tfrm_FecharSessao.edtHoraFechamentoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FecharSessao.edtHoraFechamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnFecharSessao.click;
end;

procedure Tfrm_FecharSessao.FormCreate(Sender: TObject);
var
  clSessao: TClassAuxiliar;
begin
  y_situacao:='-1';
  memo1.lines.clear;
  memo1.lines.add ('');
  memo1.lines.add ('  Loja...........: '+form_nz(frm_principal.x_loja,2)+'-'+
    ProcuraNomeLoja(frm_principal.x_loja,self));
  memo1.lines.add ('  Caixa..........: '+form_nz(frm_principal.x_terminal,2)+'-'+
    ProcuraNomeCaixa(frm_principal.x_loja,frm_principal.x_terminal,self));
  memo1.lines.add ('  Data...........: '+form_data(date));
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
    memo1.lines.add('  Hora abertura..: '+form_t(clSessao.result('SC_HORA'),5)); 
    memo1.lines.add('  Valor inicial $: '+form_nc(clSessao.result('SC_VALA'),10));
    memo1.lines.add('  Valor atual ..$: '+form_nc(clSessao.result('SC_VALO'),10));
    y_valor_final := clSessao.result('SC_VALO');
  end;
  clSessao.desconect;
  clSessao.Free;
end;

procedure Tfrm_FecharSessao.Abrirsesso1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {CRITICA}
  if (Trim(edtHoraFechamento.text)=':') then
  begin
    frmDialogo.ExibirMensagem ('A hora do fechamento da sessão não pode ficar vazia!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtHoraFechamento.setfocus;
  end
  else
  if (frmDialogo.ExibirMensagem ('Confirma fechamento da sessão?'
    ,'Vendas',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
            {fechando a sessao}
    clAux := TClassAuxiliar.Create;
    clAux.conect  ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam('UPDATE SESSAO_CAIXA                                         ');
    clAux.AddParam('SET SC_HORF=:SC_HORF,                                       ');
    clAux.AddParam('    SC_STAT=:SC_STAT,                                       ');
    clAux.AddParam('    SC_VALF=:SC_VALF                                        ');
    clAux.AddParam('WHERE (SC_LOJA='+floattostr(frm_principal.x_loja)+') AND    ');
    clAux.AddParam('      (SC_CAIX='+floattostr(frm_principal.x_terminal)+') AND   ');
    clAux.AddParam('      (SC_DATA='+chr(39)+FormataData(date)+chr(39)+')       ');
    clAux.consulta.parambyname('SC_HORF').AsString   := Trim(edtHoraFechamento.text);
    clAux.consulta.parambyname('SC_VALF').AsFloat    := y_valor_final;
    clAux.consulta.parambyname('SC_STAT').AsString   := '9'; {sessao fechada}
    clAux.Execute;

            {*** Armazena no historico a situacao atual}
    clAux.ClearSql;
    clAux.AddParam('INSERT INTO HISTORICO_SITUACOES(HS_LOJA,HS_CAIX,HS_DATA,      ');
    clAux.AddParam('       HS_STAT,HS_HORA)                                       ');
    clAux.AddParam('VALUES (:HS_LOJA,:HS_CAIX,:HS_DATA,:HS_STAT,:HS_HORA)         ');
    clAux.consulta.parambyname('HS_LOJA').AsFloat    := frm_principal.x_loja;
    clAux.consulta.parambyname('HS_CAIX').AsFloat    := frm_principal.x_terminal;
    clAux.consulta.parambyname('HS_DATA').AsDateTime := date;
    clAux.consulta.parambyname('HS_STAT').AsString   := '9';
    clAux.consulta.parambyname('HS_HORA').AsString   := Trim(edtHoraFechamento.text);
    clAux.Execute;
    clAux.desconect;
    clAux.Free;

            {*** Reconfigurando o programa}
    y_situacao := '9';
    close;
  end;
end;

procedure Tfrm_FecharSessao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_FecharSessao.btnFecharSessaoClick(Sender: TObject);
begin
  Abrirsesso1.click;
end;

procedure Tfrm_FecharSessao.EmitirReduoZdaImpressoraFiscal1Click(
  Sender: TObject);
begin
  if (frmDialogo.ExibirMensagem ('Confirma emissão de redução Z da impressora fiscal?'
    ,'Vendas',[mbYes,mbNo],
    frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    showmessage('EMITINDO REDUÇÃO Z! TRABALHO DA IMPRESSORA INICIADO!');
end;

procedure Tfrm_FecharSessao.btnLeituraXClick(Sender: TObject);
begin
  EmitirReduoZdaImpressoraFiscal1.click;
end;

end.
