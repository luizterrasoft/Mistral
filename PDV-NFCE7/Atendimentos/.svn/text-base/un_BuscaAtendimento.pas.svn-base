unit un_BuscaAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, Menus, StdCtrls, LabelOO, Mask, MaskEditOO, Db,
  DBTables, Grids, DBGrids, PanelOO;

type
  Tfrm_BuscaAtendimento = class(TForm)
    Panel1: TPanel;
    FiltroVendedor: TPanel;
    LabelOO1: TLabelOO;
    LabelOO5: TLabelOO;
    LabelOO7: TLabelOO;
    edtVendedor: TMaskEditOO;
    pnVend: TPanelOO;
    botao1: TPanel;
    edtData1: TMaskEditOO;
    Panel2: TPanel;
    grade: TDBGrid;
    FiltroCliente: TPanel;
    LabelOO2: TLabelOO;
    LabelOO6: TLabelOO;
    LabelOO8: TLabelOO;
    edtNome: TMaskEditOO;
    botao2: TPanel;
    edtData2: TMaskEditOO;
    FiltroNumero: TPanel;
    LabelOO3: TLabelOO;
    LabelOO4: TLabelOO;
    LabelOO9: TLabelOO;
    edtNumero: TMaskEditOO;
    botao3: TPanel;
    edtTerminal: TMaskEditOO;
    Panel3: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    BotaoSair1: TBotaoSair;
    Panel4: TPanel;
    Image2: TImage;
    Label10: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Aplicarfiltro1: TMenuItem;
    N2: TMenuItem;
    SuspenderAtendimento1: TMenuItem;
    Suspendetodososatendimentosselecionados1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    ds: TDataSource;
    qAtendimentos: TQuery;
    qAtendimentosAT_STAT: TStringField;
    qAtendimentosAT_CAIX: TFloatField;
    qAtendimentosAT_LOJA: TFloatField;
    qAtendimentosAT_CODI: TFloatField;
    qAtendimentosAT_FUNC: TFloatField;
    qAtendimentosAT_DATA: TDateTimeField;
    qAtendimentosAT_OPER: TFloatField;
    qAtendimentosAT_TOTA: TFloatField;
    qAtendimentosAT_QTDE: TFloatField;
    qAtendimentosAT_QTD1: TFloatField;
    qAtendimentosAT_QTD2: TFloatField;
    qAtendimentosAT_VEND: TFloatField;
    qAtendimentosAT_NOME: TStringField;
    qAtendimentosAT_ONLI: TStringField;
    qAtendimentosAT_ENVI: TStringField;
    qAtendimentoscVENDEDOR: TStringField;
    qAtendimentoscSTATUS: TStringField;
    qAtendimentosAT_DESC: TFloatField;
    qAtendimentoscDESC: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure edtVendedorEnter(Sender: TObject);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtVendedorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qAtendimentosCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure edtVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTerminalEnter(Sender: TObject);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtVendedorDblClick(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeDblClick(Sender: TObject);
    procedure SuspenderAtendimento1Click(Sender: TObject);
    procedure Suspendetodososatendimentosselecionados1Click(
      Sender: TObject);
    procedure Aplicarfiltro1Click(Sender: TObject);
    procedure edtData1Enter(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2Enter(Sender: TObject);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: String; {BUSCA / SUSPENSAO}
    tecla: Integer;
    flagExibe: Boolean;
    procedure BuscaAtendimento;
  end;

var
  frm_BuscaAtendimento: Tfrm_BuscaAtendimento;

implementation

uses principal, auxiliar, funcoes1, funcoes2, procura, un_LancaVenda, unDialogo,
  un_CancelaAtendimento;

{$R *.DFM}

procedure Tfrm_BuscaAtendimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_F7) then
    if (FiltroVendedor.visible) then
    begin
      FiltroVendedor.visible := false;
      FiltroCliente.visible  := true;
      FiltroNumero.visible   := false;
      edtData2.setfocus;
    end
    else
    if (FiltroCliente.visible) then
    begin
      FiltroVendedor.visible := false;
      FiltroCliente.visible  := false;
      FiltroNumero.visible   := true;
      edtTerminal.setfocus;
    end
    else
    if (FiltroNumero.visible) then
    begin
      FiltroVendedor.visible := true;
      FiltroCliente.visible  := false;
      FiltroNumero.visible   := false;
      edtData1.setfocus;
    end;
end;

procedure Tfrm_BuscaAtendimento.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BuscaAtendimento.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BuscaAtendimento.edtVendedorEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_BuscaAtendimento.edtNomeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_BuscaAtendimento.edtVendedorExit(Sender: TObject);
begin
  if (edtVendedor.GetValor<>0) then
  begin
    pnVend.caption:=ProcuraNomeVend(frm_principal.x_loja,edtVendedor.GetValor,self);
    edtVendedor.text:=form_nz(edtVendedor.GetValor,6);
  end
  else
    pnVend.caption:='';
end;

procedure Tfrm_BuscaAtendimento.FormCreate(Sender: TObject);
begin
  flagExibe:=false;
  tecla:=27;
  qAtendimentos.databasename:=databaseprodutos;
  FiltroVendedor.visible := true;
  FiltroCliente.visible  := false;
  FiltroNumero.visible   := false;
end;

procedure Tfrm_BuscaAtendimento.qAtendimentosCalcFields(DataSet: TDataSet);
begin
  with (dataset) do
  begin
    if (fieldbyname('cVENDEDOR').IsNull) then
      fieldbyname('cVENDEDOR').AsString := ProcuraNomeVend(frm_principal.x_loja,fieldbyname('AT_VEND').AsFloat,self);
    if (fieldbyname('cSTATUS').IsNull) then
      if (fieldbyname('AT_STAT').AsString='0') then
        fieldbyname('cSTATUS').AsString := 'Em Andamento'
      else
      if (fieldbyname('AT_STAT').AsString='1') then
        fieldbyname('cSTATUS').AsString := 'Concluído'
      else
      if (fieldbyname('AT_STAT').AsString='2') then
        fieldbyname('cSTATUS').AsString := 'Cancelado';
    if (fieldbyname('cDESC').IsNull) then
      if (fieldbyname('AT_DESC').AsFloat<0) then
        fieldbyname('cDESC').AsString := trim(form_nc((-1)*fieldbyname('AT_DESC').AsFloat,15))
      else
      if (fieldbyname('AT_DESC').AsFloat>0) then
        fieldbyname('cDESC').AsString := trim(form_nc(fieldbyname('AT_DESC').AsFloat,15))+' %'
      else
      if (fieldbyname('AT_DESC').AsFloat=0) then
        fieldbyname('cDESC').AsString := '0,00';
  end;
end;

procedure Tfrm_BuscaAtendimento.FormActivate(Sender: TObject);
begin
  if (not flagExibe) then
  begin
    if (Modo='BUSCA') then
    begin
      caption         := 'Sistema de Vendas';
      Label3.caption  := '[Busca por Atendimento]';
      Label10.caption := '[Busca por Atendimento]';
      Label2.visible  := false;
      Label5.visible  := false;
      N2.visible      := false;
      SuspenderAtendimento1.visible := false;
      Suspendetodososatendimentosselecionados1.visible := false;
    end
    else
    if (Modo='CANCELAMENTO') then
    begin
      caption         := 'Sistema de Vendas';
      Label3.caption  := '[Cancelamento de Atendimento]';
      Label10.caption := '[Cancelamento de Atendimento]';
      Label2.visible  := true;
      Label5.visible  := true;
      N2.visible      := true;
      SuspenderAtendimento1.visible := true;
      Suspendetodososatendimentosselecionados1.visible := true;
    end;
    edtData1.text := form_data(frm_principal.x_data_trabalho);
    edtData2.text := form_data(frm_principal.x_data_trabalho);
    flagExibe:=true;
  end;
  if (FiltroVendedor.visible) then
    edtData1.setfocus
  else
  if (FiltroCliente.visible) then
    edtData2.setfocus
  else
  if (FiltroNumero.visible) then
    edtTerminal.setfocus;
end;

procedure Tfrm_BuscaAtendimento.botao1Click(Sender: TObject);
begin
  BuscaAtendimento;
  if (edtVendedor.GetValor<>0) then
  begin
    pnVend.caption:=ProcuraNomeVend(frm_principal.x_loja,edtVendedor.GetValor,self);
    edtVendedor.text:=form_nz(edtVendedor.GetValor,6);
  end
  else
    pnVend.caption:='';
end;

procedure Tfrm_BuscaAtendimento.botao2Click(Sender: TObject);
begin
  BuscaAtendimento;
end;

procedure Tfrm_BuscaAtendimento.botao3Click(Sender: TObject);
begin
  BuscaAtendimento;
end;

procedure Tfrm_BuscaAtendimento.BuscaAtendimento;
begin
  with (qAtendimentos) do
  begin
    close;
    sql.Clear;
    sql.Add ('SELECT * FROM ATENDIMENTOS    ');
    sql.Add ('WHERE (AT_LOJA=:loja) AND     ');
    sql.Add ('      (AT_STAT=:status)       ');
    if (FiltroVendedor.visible) then
    begin
      if (edtData1.GetValor<>strtodate('01/01/1900')) then
        sql.Add ('  AND (AT_DATA=:data)     ');
      if (edtVendedor.GetValor<>0) then
        sql.Add ('  AND (AT_VEND=:vendedor) ');
    end
    else
    if (FiltroCliente.visible) then
    begin
      if (edtData2.GetValor<>strtodate('01/01/1900')) then
        sql.Add ('  AND (AT_DATA=:data)     ');
      if (edtNome.GetValor<>'') then
        sql.Add ('  AND (AT_NOME LIKE '+chr(39)+edtNome.GetValor+'%'+chr(39)+') ');
    end
    else
    if (FiltroNumero.visible) then
    begin
      if (edtTerminal.GetValor<>0) then
        sql.Add ('  AND (AT_CAIX=:terminal) ');
      if (edtNumero.GetValor<>0) then
        sql.Add ('  AND (AT_CODI=:numero)   ');
    end;
    parambyname('status').AsString := '0'; //em andamento
    parambyname('loja').AsFloat    := frm_principal.x_loja;
    if (FiltroVendedor.visible) then
    begin
      if (edtData1.GetValor<>strtodate('01/01/1900')) then
        parambyname('data').AsDateTime := edtData1.GetValor;
      if (edtVendedor.GetValor<>0) then
        parambyname('vendedor').AsFloat := edtVendedor.GetValor;
    end
    else
    if (FiltroNumero.visible) then
    begin
      if (edtTerminal.GetValor<>0) then
        parambyname('terminal').AsFloat := edtTerminal.GetValor;
      if (edtNumero.GetValor<>0) then
        parambyname('numero').AsFloat   := edtNumero.GetValor;
    end
    else
    if (FiltroCliente.visible) then
      if (edtData2.GetValor<>strtodate('01/01/1900')) then
        parambyname('data').AsDateTime := edtData2.GetValor;
    open;
    first;
  end;
  grade.setfocus;
end;

procedure Tfrm_BuscaAtendimento.edtVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1Click(Sender);
  if (key=K_CIMA) then
    edtData1.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVendedor);
end;

procedure Tfrm_BuscaAtendimento.edtNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_CIMA) then
    edtData2.setfocus;
end;

procedure Tfrm_BuscaAtendimento.edtTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNumero.setfocus;
  if (key=K_CIMA) then;
end;

procedure Tfrm_BuscaAtendimento.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao3Click(Sender);
  if (key=K_CIMA) then
    edtTerminal.setfocus;
end;

procedure Tfrm_BuscaAtendimento.edtTerminalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_BuscaAtendimento.edtNumeroEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_BuscaAtendimento.edtVendedorDblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtVendedor);
end;

procedure Tfrm_BuscaAtendimento.Limparformulrio1Click(Sender: TObject);
begin
  edtData1.text    := '';
  edtData2.text    := '';
  edtVendedor.text := '';
  edtNome.text     := '';
  edtTerminal.text := '';
  edtNumero.text   := '';
  pnVend.caption   := '';
  if (FiltroVendedor.visible) then
    edtData1.setfocus
  else
  if (FiltroCliente.visible) then
    edtData2.setfocus
  else
  if (FiltroNumero.visible) then
    edtTerminal.setfocus;
  qAtendimentos.close;
end;

procedure Tfrm_BuscaAtendimento.gradeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  terminal_atendimento,numero_atendimento: Real;
begin
  if (key=K_F2) then
    if (FiltroVendedor.visible) then
      edtData1.setfocus
    else
    if (FiltroCliente.visible) then
      edtData2.setfocus
    else
    if (FiltroNumero.visible) then
      edtTerminal.setfocus;
  if (Modo='BUSCA') then
    if (key=K_ENTER) then
      if (qAtendimentos.active) then
        if (qAtendimentos.recordcount<>0) then
        begin
          terminal_atendimento  := qAtendimentos.fieldbyname('AT_CAIX').AsFloat;
          numero_atendimento    := qAtendimentos.fieldbyname('AT_CODI').AsFloat;
          if (frm_LancaVenda.y_LISTA_atendimentos.IndexOf(form_n(terminal_atendimento,10)+'/'+form_n(numero_atendimento,10))<>-1) then
            frmDialogo.ExibirMensagem ('O atendimento selecionado já se encontra incluído na VENDA!'
              ,'Venda',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
          else
          begin
            tecla:=13;
            close;
          end;
        end;
  if (Modo='CANCELAMENTO') then
    if (shift=[ssCtrl]) then
    begin
      if (key=K_DELETE) then
        Suspendetodososatendimentosselecionados1.click;
    end
    else
    if (key=K_DELETE) then
      SuspenderAtendimento1.click;
end;

procedure Tfrm_BuscaAtendimento.gradeDblClick(Sender: TObject);
var
  terminal_atendimento,numero_atendimento: Real;
begin
  if (Modo='BUSCA') then
    if (qAtendimentos.active) then
      if (qAtendimentos.recordcount<>0) then
      begin
        terminal_atendimento  := qAtendimentos.fieldbyname('AT_CAIX').AsFloat;
        numero_atendimento    := qAtendimentos.fieldbyname('AT_CODI').AsFloat;
        if (frm_LancaVenda.y_LISTA_atendimentos.IndexOf(form_n(terminal_atendimento,10)+'/'+form_n(numero_atendimento,10))<>-1) then
          frmDialogo.ExibirMensagem ('O atendimento selecionado já se encontra incluído na VENDA!'
            ,'Venda',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
          tecla:=13;
          close;
        end;
      end;
end;

procedure Tfrm_BuscaAtendimento.SuspenderAtendimento1Click(Sender: TObject);
var
  terminalAnt,numeroAtdoAnt: Real;
begin
  if (qAtendimentos.active) then
    if (qAtendimentos.recordcount<>0) then
    begin
      qAtendimentos.disablecontrols;
      qAtendimentos.next;
      terminalAnt   := qAtendimentos.fieldbyname('AT_CAIX').AsFloat;
      numeroAtdoAnt := qAtendimentos.fieldbyname('AT_CODI').AsFloat;
      if (not qAtendimentos.eof) then
        qAtendimentos.prior;
      Application.CreateForm(Tfrm_CancelaAtendimento, frm_CancelaAtendimento);
      frm_CancelaAtendimento.tipocancelamento := 0;
      frm_CancelaAtendimento.y_terminal       := qAtendimentos.fieldbyname('AT_CAIX').AsFloat;
      frm_CancelaAtendimento.y_numero         := qAtendimentos.fieldbyname('AT_CODI').AsFloat;
      frm_CancelaAtendimento.showmodal;
      if (frm_CancelaAtendimento.tecla=13) then
      begin
        Aplicarfiltro1.click;

        qAtendimentos.first;
        while (not qAtendimentos.eof) do
        begin
          if (terminalAnt   = qAtendimentos.fieldbyname('AT_CAIX').AsFloat) and
            (numeroAtdoAnt = qAtendimentos.fieldbyname('AT_CODI').AsFloat) then
            break;
          qAtendimentos.next;
        end;
      end;
      qAtendimentos.enablecontrols;
      frm_CancelaAtendimento.Free;
      grade.setfocus;
    end;
end;

procedure Tfrm_BuscaAtendimento.Suspendetodososatendimentosselecionados1Click(
  Sender: TObject);
begin
  if (qAtendimentos.active) then
    if (qAtendimentos.recordcount<>0) then
    begin
      Application.CreateForm(Tfrm_CancelaAtendimento, frm_CancelaAtendimento);
      frm_CancelaAtendimento.tipocancelamento := 1;
      frm_CancelaAtendimento.showmodal;
      if (frm_CancelaAtendimento.tecla=13) then
        Aplicarfiltro1.click;
      frm_CancelaAtendimento.Free;
    end;
end;

procedure Tfrm_BuscaAtendimento.Aplicarfiltro1Click(Sender: TObject);
begin
  if (FiltroVendedor.visible) then
    botao1Click(Sender)
  else
  if (FiltroCliente.visible) then
    botao2Click(Sender)
  else
  if (FiltroNumero.visible) then
    botao3Click(Sender);
end;

procedure Tfrm_BuscaAtendimento.edtData1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_BuscaAtendimento.edtData1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    edtVendedor.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_BuscaAtendimento.edtData2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall; 
end;

procedure Tfrm_BuscaAtendimento.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    edtNome.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_BuscaAtendimento.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (qAtendimentos.fieldbyname('AT_STAT').AsString='0') then //em andamento
    grade.Canvas.Font.color:=clBlue
  else
  if (qAtendimentos.fieldbyname('AT_STAT').AsString='1') then //concluida
    grade.Canvas.Font.color:=clBlack
  else
  if (qAtendimentos.fieldbyname('AT_STAT').AsString='2') then //cancelada
    grade.Canvas.Font.color:=clRed;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

end.
