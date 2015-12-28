//POR ENQUANTO, ESTA EXIBINDO APENAS INFORMACOES DO 'CAIXA' ATIVO!!!!
unit un_SumarioVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, MaskEditOO, LabelOO, Menus, CheckBoxOO;

type
  Tfrm_SumarioVendas = class(TForm)
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    botaoSair: TPanel;
    Image2: TImage;
    Bevel4: TBevel;
    Memo1: TMemo;
    LabelOO1: TLabelOO;
    edtData: TMaskEditOO;
    botao1: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmardados1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    lblloja: TLabelOO;
    lblNTerminal: TLabelOO;
    Bevel2: TBevel;
    lbltipz: TLabel;
    rdSituacao: TRadioGroup;
    edtTerminal: TMaskEditOO;
    chTerminal: TCheckBoxOO;
    chExibirSomenteCaixa: TCheckBox;
    Label1: TLabel;
    procedure edtDataEnter(Sender: TObject);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTerminalEnter(Sender: TObject);
    procedure edtTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chTerminalClick(Sender: TObject);
    procedure chTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chTerminalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_tipz: String;
  end;

var
  frm_SumarioVendas: Tfrm_SumarioVendas;

implementation

uses unDialogo, principal, auxiliar, funcoes1, funcoes2, procura;

{$R *.DFM}

procedure Tfrm_SumarioVendas.edtDataEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_SumarioVendas.edtDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botao1Click(Sender);
  if (key=38) then
    edtTerminal.setfocus;
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_SumarioVendas.Limparformulrio1Click(Sender: TObject);
begin
  edtTerminal.text := '';
  edtData.text     := '';
  edtTerminal.font.color:=clWhite;
  edtTerminal.text:='';
  edtTerminal.readonly:=true;
  edtTerminal.color:=clTeal;
  chTerminal.checked:=true;
  edtTerminal.setfocus;
  memo1.lines.clear;
  edtData.setfocus;
end;

procedure Tfrm_SumarioVendas.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_SumarioVendas.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_SumarioVendas.Confirmardados1Click(Sender: TObject);
var
  clVendas: TClassAuxiliar;
  total_a_vista,total_a_prazo,total_valesg,total_valeemitG: Real;
  qtde_a_vista,qtde_a_prazo,qtde_valesg,qtde_valeemitG: Integer;
  total_vales_emitidos: Real;
  qtde_vales_emitidos,qtde_desconto: Integer;
  total_desconto: Real;
  databasename: String;
  totalvales1, totalvales2, totalgeral: Real;
  qtdvales1, qtdvales2, qtdgeral: Integer;
begin
  if (not chTerminal.checked) and (edtTerminal.GetValor=0) then
  begin
    frmDialogo.ExibirMensagem ('O número do terminal deve ser informado!'
      ,'Sumário de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtTerminal.setfocus;
  end
  else
  if (edtData.GetValor=strtodate('01/01/1900')) then
  begin
    frmDialogo.ExibirMensagem ('A data das vendas deve ser informada!'
      ,'Sumário de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData.setfocus;
  end
  else
  if (frm_principal.x_prazo_vendas<>'01/01/1900') and (edtData.GetValor<StrToDateTime(frm_principal.x_prazo_vendas)) then
  begin
    frmDialogo.ExibirMensagem ('Data informada não permitida!'
      ,'Sumário de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData.setfocus;
  end
  else
  begin
          {******************************************************************}
    if (databaseprodutos='ESTOQUE') then
      databasename:='ESTOQUE'
    else
    if (databaseprodutos='VENDAS') then
      databasename:='VENDAS';
          {******************************************************************}
    Memo1.lines.clear;
          //Memo1.lines.Add   ('');
    Memo1.lines.Add   ('-Seq.-------------------------------[$]--Qtd.Fpgt');
    clVendas := TClassAuxiliar.Create;
    clVendas.conect   (databasename,self);
          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_DINHEIRO,          ');
    clVendas.AddParam ('       COUNT(*) as QTDE_DINHEIRO                ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_DINHEIRO)+') AND');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    Memo1.lines.Add('  1. - DINHEIRO............: '+form_nc (clVendas.Result('TOTAL_DINHEIRO'),13)+'  '+
      form_n  (clVendas.Result('QTDE_DINHEIRO'),5));
    total_a_vista := total_a_vista + clVendas.Result('TOTAL_DINHEIRO');
    qtde_a_vista  := qtde_a_vista + clVendas.Result('QTDE_DINHEIRO');
          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_CHEQUE,            ');
    clVendas.AddParam ('       COUNT(*) as QTDE_CHEQUE                  ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_CHEQUE)+') AND  ');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    Memo1.lines.Add('  2. - CHEQUE A VISTA......: '+form_nc(clVendas.Result('TOTAL_CHEQUE'),13)+'  '+
      form_n  (clVendas.Result('QTDE_CHEQUE'),5));
    total_a_vista := total_a_vista + clVendas.Result('TOTAL_CHEQUE');
    qtde_a_vista := qtde_a_vista + clVendas.Result('QTDE_CHEQUE');
          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_DEBITO,            ');
    clVendas.AddParam ('       COUNT(*) as QTDE_DEBITO                  ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_DEBITO)+') AND  ');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    Memo1.lines.Add('  3. - DÉBITO AUTOMÁTICO...: '+form_nc(clVendas.Result('TOTAL_DEBITO'),13)+'  '+
      form_n  (clVendas.Result('QTDE_DEBITO'),5));
    total_a_vista := total_a_vista + clVendas.Result('TOTAL_DEBITO');
    qtde_a_vista := qtde_a_vista + clVendas.Result('QTDE_DEBITO');
          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_CARTAO,            ');
    clVendas.AddParam ('       COUNT(*) as QTDE_CARTAO                  ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_CARTAO)+') AND  ');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    Memo1.lines.Add('  4. - CARTÃO / CRÉDITO....: '+form_nc (clVendas.Result('TOTAL_CARTAO'),13)+'  '+
      form_n  (clVendas.Result('QTDE_CARTAO'),5));
    total_a_prazo := total_a_prazo + clVendas.Result('TOTAL_CARTAO');
    qtde_a_prazo := qtde_a_prazo + clVendas.Result('QTDE_CARTAO');
          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_CREDIARIO,         ');
    clVendas.AddParam ('       COUNT(*) as QTDE_CREDIARIO               ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_CREDITO)+') AND ');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    Memo1.lines.Add('  5. - CREDIÁRIO...........: '+form_nc (clVendas.Result('TOTAL_CREDIARIO'),13)+'  '+
      form_n  (clVendas.Result('QTDE_CREDIARIO'),5));
    total_a_prazo := total_a_prazo + clVendas.Result('TOTAL_CREDIARIO');
    qtde_a_prazo  := qtde_a_prazo + clVendas.Result('QTDE_CREDIARIO');
          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_VALES,             ');
    clVendas.AddParam ('       COUNT(*) as QTDE_VALES                   ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_VALES)+') AND   ');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    Memo1.lines.Add('  6. - VALES RECEBIDOS.....: '+form_nc (clVendas.Result('TOTAL_VALES'),13)+'  '+
      form_n  (clVendas.Result('QTDE_VALES'),5));
    total_valesg := total_valesg + clVendas.Result('TOTAL_VALES');
    qtde_valesg  := qtde_valesg + clVendas.Result('QTDE_VALES');
          {******************************************************************}
    totalvales1 := 0;
    qtdvales1 := 0;
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_VALES,             ');
    clVendas.AddParam ('       COUNT(*) as QTDE_VALES                   ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_VALE_MERC)+') AND   ');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    totalvales1 := clVendas.Result('TOTAL_VALES');
    qtdvales1 := clVendas.Result('QTDE_VALES');
          {Marcio******************************************************************}
    totalvales2 := 0;
    qtdvales2 := 0;
    if (y_tipz = '2') or (y_tipz = '3') then
    begin
      clVendas.ClearSql;
      clVendas.AddParam ('SELECT SUM(IV_TOTA) as TOTAL_VALESSEM,               ');
      clVendas.AddParam ('       COUNT(*) as QTDE_VALESSEM                     ');
      clVendas.AddParam ('FROM ITENS_VALES_MERCADORIAS                         ');
      clVendas.AddParam ('WHERE (IV_LOJA=:loja) AND                            ');
      if (not chTerminal.checked) then
        clVendas.AddParam ('      (IV_CAIX=:terminal) AND                        ');
      clVendas.AddParam ('      (IV_HORA=:data)                                ');
      if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        clVendas.AddParam ('AND      (IV_FUNC=:func)                             ');
      clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
      if (not chTerminal.checked) then
        clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
      clVendas.consulta.parambyname('data').AsDateTime := StrToDateTime(edtData.Text);
      if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
      clVendas.Execute;
      totalvales2 := clVendas.Result('TOTAL_VALESSEM');
      qtdvales2 := clVendas.Result('QTDE_VALESSEM')
    end;
          {Marcio******************************************************************}
    totalgeral := totalvales1+totalvales2;
    qtdgeral := qtdvales1+qtdvales2;
    Memo1.lines.Add('  7. - VALES MERCADORIAS...: '+form_nc (totalgeral,13)+'  '+
      form_n  (qtdgeral,5));
    total_valesg := total_valesg + totalgeral;
    qtde_valesg  := qtde_valesg  + qtdgeral;

          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_VALO) as TOTAL_VALES,             ');
    clVendas.AddParam ('       COUNT(*) as QTDE_VALES                   ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_VALES_EMI)+')AND');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    total_vales_emitidos := total_vales_emitidos + clVendas.Result('TOTAL_VALES');// clVendas.Result('TOTAL_VALES');
    qtde_vales_emitidos  := qtde_vales_emitidos  + clVendas.Result('QTDE_VALES'); // clVendas.Result('QTDE_VALES');
          {Marcio******************************************************************}
    total_valeemitg := 0;
    qtde_valeemitg := 0;
    clVendas := TClassAuxiliar.Create;
    clVendas.conect   (databasecontas,self);
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VA_VALO) as TOTAL_VALEEMIT,               ');
    clVendas.AddParam ('       COUNT(*) as QTDE_VALEEMIT                     ');
    clVendas.AddParam ('FROM VALES_EMITIDOS                                  ');
    clVendas.AddParam ('WHERE (VA_LOJA=:loja) AND                            ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VA_CAIX=:terminal) AND                        ');
    clVendas.AddParam ('      (VA_DATA=:data)                                ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('AND      (VA_FUNC=:func)                             ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('AND      (VA_TIPZ=:tipz)                                ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := StrToDateTime(edtData.Text);
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    total_valeemitg := clVendas.Result('TOTAL_VALEEMIT');
    qtde_valeemitg := clVendas.Result('QTDE_VALEEMIT');
          {Marcio******************************************************************}
//          total_vales_emitidos := total_vales_emitidos + total_valeemitG;
//          qtde_vales_emitidos  := qtde_vales_emitidos  + qtde_valeemitG;
          {******************************************************************}
    clVendas := TClassAuxiliar.Create;
    clVendas.conect   (databasename,self);
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VE_DESC) as TOTAL_DESCONTO,          ');
    clVendas.AddParam ('       COUNT(*) as QTDE_DESCONTO                ');
    clVendas.AddParam ('FROM VENDAS              ');
    clVendas.AddParam ('WHERE (VE_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VE_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    clVendas.AddParam ('      (VE_DESC<>0)                           ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('   AND   (VE_TIPZ=:tipz)                           ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' and (VE_STAT='+chr(39)+'1'+chr(39)+')           ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' and (VE_STAT='+chr(39)+'2'+chr(39)+')           ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    total_desconto := clVendas.Result('TOTAL_DESCONTO');
    qtde_desconto  := clVendas.Result('QTDE_DESCONTO');
          {******************************************************************}
    Memo1.lines.Add(form_tc2('-',50,'-'));
    Memo1.lines.Add('  a) - TOT. A VIST(1+2+3)..: '+form_nc (total_a_vista,13)+'  '+
      form_n  (qtde_a_vista,5));

    if (frm_principal.x_comissao_vales_mercadoria) or (frm_principal.x_soma_valefunc_total_venda)  then
    begin
      Memo1.lines.Add('  b) - TOT. A PRAZO(4+5+7).: '+form_nc (total_a_prazo+totalgeral,13)+'  '+
        form_n  (qtde_a_prazo+qtdgeral,5));
      Memo1.lines.Add('     - TOTAL VENDAS(a+b)...: '+form_nc (total_a_vista+total_a_prazo+totalgeral,13)+'  '+
        form_n  (qtde_a_vista+qtde_a_prazo,5));
    end
    else
    begin
      Memo1.lines.Add('  b) - TOT. A PRAZO(4+5)...: '+form_nc (total_a_prazo,13)+'  '+
        form_n  (qtde_a_prazo,5));
      Memo1.lines.Add('     - TOTAL VENDAS(a+b)...: '+form_nc (total_a_vista+total_a_prazo,13)+'  '+
        form_n  (qtde_a_vista+qtde_a_prazo,5));
    end;

    Memo1.lines.Add(form_tc2('-',50,'-'));

    if (frm_principal.x_comissao_vales_mercadoria) or (frm_principal.x_soma_valefunc_total_venda) then
    begin
      Memo1.lines.Add('  c) - VALES(6)............: '+form_nc (total_valesg-totalgeral,13)+'  '+
        form_n  (qtde_valesg-qtdgeral,5));
      Memo1.lines.Add(form_tc2('-',50,'-'));
      Memo1.lines.Add('     - TOTAL GERAL(a+b+c)..: '+form_nc (total_a_vista+total_a_prazo+total_valesg,13)+'  '+
        form_n  (qtde_a_vista+qtde_a_prazo,5));

    end
    else
    begin
      Memo1.lines.Add('  c) - VALES(6+7)..........: '+form_nc (total_valesg,13)+'  '+
        form_n  (qtde_valesg,5));
      Memo1.lines.Add(form_tc2('-',50,'-'));
      Memo1.lines.Add('     - TOTAL GERAL(a+b+c)..: '+form_nc (total_a_vista+total_a_prazo+total_valesg,13)+'  '+
        form_n  (qtde_a_vista+qtde_a_prazo+qtde_valesg,5));

    end;
    Memo1.lines.Add(form_tc2('-',50,'-'));
    Memo1.lines.Add('     - TOT. DESCONTOS(-)...: '+form_nc (total_desconto,13)+'  '+
      form_n  (qtde_desconto,5));
    Memo1.lines.Add('     - VALES EMITIDOS(-)...: '+form_nc (((-1)*total_vales_emitidos)+total_valeemitg,13)+'  '+
      form_n  (qtde_vales_emitidos+qtde_valeemitg,5));
    Memo1.lines.Add(form_tc2('-',50,'-'));

          {******************************************************************}
    clVendas.ClearSql;
    clVendas.AddParam ('SELECT SUM(VF_TROC) as TOTAL_TROCO              ');
    clVendas.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS              ');
    clVendas.AddParam ('WHERE (VF_LOJA=:loja) AND                       ');
    if (not chTerminal.checked) then
      clVendas.AddParam ('      (VF_CAIX=:terminal) AND                   ');
    clVendas.AddParam ('      (VF_FPGT='+inttostr(KFPGT_DINHEIRO)+') AND');
    clVendas.AddParam ('      (VE_DATA=:data) AND                       ');
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.AddParam ('      (VE_FUNC=:func) AND                       ');
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.AddParam ('      (VE_TIPZ=:tipz) AND                       ');
    if (rdSituacao.itemindex=0) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'1'+chr(39)+') AND       ')
    else
    if (rdSituacao.itemindex=1) then
      clVendas.AddParam (' (VE_STAT='+chr(39)+'2'+chr(39)+') AND       ');
    clVendas.AddParam (' (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND (VE_CODI=VF_VEND) ');
    clVendas.consulta.parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (not chTerminal.checked) then
      clVendas.consulta.parambyname('terminal').AsFloat:= edtTerminal.GetValor;
    clVendas.consulta.parambyname('data').AsDateTime := edtData.GetValor;
    if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      clVendas.consulta.parambyname('func').AsFloat    := frm_principal.x_caixa_ativo;
    if (y_tipz='1') or (y_tipz='2') then
      clVendas.consulta.parambyname('tipz').AsString := y_tipz;
    clVendas.Execute;
    Memo1.lines.Add('  *. - TROCOS..............: '+form_nc(clVendas.Result('TOTAL_TROCO'),13));
          {******************************************************************}
    clVendas.desconect;
    clVendas.Free;
  end;
end;

procedure Tfrm_SumarioVendas.botao1Click(Sender: TObject);
begin
  Confirmardados1.click;
end;

procedure Tfrm_SumarioVendas.FormActivate(Sender: TObject);
begin
  edtdata.setfocus;
end;

procedure Tfrm_SumarioVendas.FormCreate(Sender: TObject);
begin
  lblLoja.caption := ' Loja: '+form_nz(frm_principal.x_loja,2)+'/'+
    form_t(ProcuraNomeLoja(frm_principal.x_loja,self),20); 
  lblNTerminal.caption := ' Nº do terminal de venda: '+form_nz(frm_principal.x_terminal,2);
  y_tipz:='1';
  lbltipz.caption:='Sr.'+y_tipz;
  lbltipz.visible:=false;
end;

procedure Tfrm_SumarioVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (y_tipz='1') then
      begin
        y_tipz:='2';
        lbltipz.visible:=true;
      end
      else
      if (y_tipz='2') then
      begin
        y_tipz:='3';
        lbltipz.visible:=true;
      end
      else
      if (y_tipz='3') then
      begin
        y_tipz:='1';
        lbltipz.visible:=false;
      end;
      lbltipz.caption:='Sr.'+y_tipz;
      if (edtData.GetValor=strtodate('01/01/1900')) then
        edtData.text:=form_data(frm_principal.x_data_trabalho);
      botao1Click(Sender);
    end
end;

procedure Tfrm_SumarioVendas.edtTerminalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_SumarioVendas.edtTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtData.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_SumarioVendas.chTerminalClick(Sender: TObject);
begin
  if (chTerminal.checked) then
  begin
    edtTerminal.font.color:=clWhite;
    edtTerminal.text:='';
    edtTerminal.readonly:=true;
    edtTerminal.color:=clTeal;
  end
  else
  begin
    edtTerminal.font.color:=clBlack;
    edtTerminal.readonly:=false;
    edtTerminal.color:=clWhite;
    edtTerminal.setfocus;
  end;
end;

procedure Tfrm_SumarioVendas.chTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chTerminal.checked) then
  begin
    edtTerminal.font.color:=clWhite;
    edtTerminal.text:='';
    edtTerminal.readonly:=true;
    edtTerminal.color:=clTeal;
  end
  else
  begin
    edtTerminal.font.color:=clBlack;
    edtTerminal.readonly:=false;
    edtTerminal.color:=clWhite;
    edtTerminal.setfocus;
  end;
end;

procedure Tfrm_SumarioVendas.chTerminalExit(Sender: TObject);
begin
  if (chTerminal.checked) then
  begin
    edtTerminal.font.color:=clWhite;
    edtTerminal.text:='';
    edtTerminal.readonly:=true;
    edtTerminal.color:=clTeal;
  end
  else
  begin
    edtTerminal.font.color:=clBlack;
    edtTerminal.readonly:=false;
    edtTerminal.color:=clWhite;
    edtTerminal.setfocus;
  end;
end;

end.
