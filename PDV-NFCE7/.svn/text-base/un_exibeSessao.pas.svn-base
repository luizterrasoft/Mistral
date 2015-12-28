unit un_exibeSessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_ExibeSessao = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    botao_sair: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ExibeSessao: Tfrm_ExibeSessao;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, procura,principal,auxiliar;

procedure Tfrm_ExibeSessao.FormCreate(Sender: TObject);
var
  clSessao: TClassAuxiliar;
begin
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
  end;
  clSessao.ClearSql;
  clSessao.AddParam('SELECT SUM(VE_TOTA) as TOTAL_VENDIDO,                       ');
  clSessao.AddParam('       COUNT(*) as QTDE_VENDAS                              ');
  clSessao.AddParam('FROM VENDAS                                                 ');
  clSessao.AddParam('WHERE (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND    ');
  clSessao.AddParam('      (VE_CAIX='+floattostr(frm_principal.x_terminal)+') AND   ');
  clSessao.AddParam('      (VE_DATA='+chr(39)+FormataData(date)+chr(39)+')       ');
  clSessao.Execute;
  memo1.lines.add('  Qtde de vendas.: '+form_n(clSessao.result('QTDE_VENDAS'),5));
  memo1.lines.add('  Total vendido $: '+form_nc(clSessao.result('TOTAL_VENDIDO'),15));
  clSessao.desconect;
  clSessao.Free;
end;

procedure Tfrm_ExibeSessao.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExibeSessao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

end.
