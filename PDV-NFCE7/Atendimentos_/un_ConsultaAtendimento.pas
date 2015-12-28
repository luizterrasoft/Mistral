unit un_ConsultaAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, Menus, StdCtrls, LabelOO, Mask, MaskEditOO, Db,
  DBTables, Grids, DBGrids, PanelOO;

type
  Tfrm_ConsultaAtendimento = class(TForm)
    FiltroVendedor: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    SAIR1: TMenuItem;
    edtVendedor: TMaskEditOO;
    LabelOO1: TLabelOO;
    Panel2: TPanel;
    grade: TDBGrid;
    pnVend: TPanelOO;
    botao1: TPanel;
    Aplicarfiltro1: TMenuItem;
    FiltroCliente: TPanel;
    LabelOO2: TLabelOO;
    edtNome: TMaskEditOO;
    botao2: TPanel;
    ds: TDataSource;
    qAtendimentos: TQuery;
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
    qAtendimentosAT_STAT: TStringField;
    qAtendimentoscVENDEDOR: TStringField;
    FiltroNumero: TPanel;
    LabelOO3: TLabelOO;
    edtNumero: TMaskEditOO;
    botao3: TPanel;
    Panel1: TPanel;
    BotaoSair1: TBotaoSair;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    edtTerminal: TMaskEditOO;
    LabelOO4: TLabelOO;
    Panel3: TPanel;
    Label3: TLabel;
    Label10: TLabel;
    Image2: TImage;
    N2: TMenuItem;
    qAtendimentoscSTATUS: TStringField;
    LabelOO5: TLabelOO;
    edtData1: TMaskEditOO;
    edtData2: TMaskEditOO;
    LabelOO6: TLabelOO;
    LabelOO7: TLabelOO;
    LabelOO8: TLabelOO;
    LabelOO9: TLabelOO;
    ImprimirSLIP: TMenuItem;
    btnImprimirSlip: TPanel;
    N3: TMenuItem;
    rdSit: TRadioGroup;
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
    procedure Aplicarfiltro1Click(Sender: TObject);
    procedure edtData1Enter(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2Enter(Sender: TObject);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirSlipClick(Sender: TObject);
    procedure ImprimirSLIPClick(Sender: TObject);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdSitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tecla: Integer;
    flagExibe: Boolean;
    procedure BuscaAtendimento;
  end;

var
  frm_ConsultaAtendimento: Tfrm_ConsultaAtendimento;

implementation

uses principal, auxiliar, funcoes1, funcoes2, procura,
  un_CancelaAtendimento, mem_prnt, unDialogo, venda;

{$R *.DFM}

procedure Tfrm_ConsultaAtendimento.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_ConsultaAtendimento.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConsultaAtendimento.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConsultaAtendimento.edtVendedorEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ConsultaAtendimento.edtNomeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ConsultaAtendimento.edtVendedorExit(Sender: TObject);
begin
  if (edtVendedor.GetValor<>0) then
  begin
    pnVend.caption:=ProcuraNomeVend(frm_principal.x_loja,edtVendedor.GetValor,self);
    edtVendedor.text:=form_nz(edtVendedor.GetValor,6);
  end
  else
    pnVend.caption:='';
end;

procedure Tfrm_ConsultaAtendimento.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;    
  flagExibe:=false;
  tecla:=27;
  qAtendimentos.databasename:=databaseprodutos;
  FiltroVendedor.visible := true;
  FiltroCliente.visible  := false;
  FiltroNumero.visible   := false;
end;

procedure Tfrm_ConsultaAtendimento.qAtendimentosCalcFields(DataSet: TDataSet);
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

procedure Tfrm_ConsultaAtendimento.FormActivate(Sender: TObject);
begin
  if (not flagExibe) then
  begin
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

procedure Tfrm_ConsultaAtendimento.botao1Click(Sender: TObject);
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

procedure Tfrm_ConsultaAtendimento.botao2Click(Sender: TObject);
begin
  BuscaAtendimento;
end;

procedure Tfrm_ConsultaAtendimento.botao3Click(Sender: TObject);
begin
  BuscaAtendimento;
end;

procedure Tfrm_ConsultaAtendimento.BuscaAtendimento;
begin
  with (qAtendimentos) do
  begin
    close;
    sql.Clear;
    sql.Add ('SELECT * FROM ATENDIMENTOS    ');
    sql.Add ('WHERE (AT_LOJA=:loja)         ');
    if (rdSit.itemindex>=0) and (rdSit.itemindex<=2) then
      sql.Add ('   AND (AT_STAT=:status)   ');
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
    if (rdSit.itemindex>=0) and (rdSit.itemindex<=2) then
      parambyname('status').AsString := inttostr(rdSit.itemindex);
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

procedure Tfrm_ConsultaAtendimento.edtVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1Click(Sender);
  if (key=K_CIMA) then
    edtData1.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVendedor);
end;

procedure Tfrm_ConsultaAtendimento.edtNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_CIMA) then
    edtData2.setfocus;
end;

procedure Tfrm_ConsultaAtendimento.edtTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNumero.setfocus;
  if (key=K_CIMA) then;
end;

procedure Tfrm_ConsultaAtendimento.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao3Click(Sender);
  if (key=K_CIMA) then
    edtTerminal.setfocus;
end;

procedure Tfrm_ConsultaAtendimento.edtTerminalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ConsultaAtendimento.edtNumeroEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ConsultaAtendimento.edtVendedorDblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtVendedor);
end;

procedure Tfrm_ConsultaAtendimento.Limparformulrio1Click(Sender: TObject);
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

procedure Tfrm_ConsultaAtendimento.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
end;

procedure Tfrm_ConsultaAtendimento.Aplicarfiltro1Click(Sender: TObject);
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

procedure Tfrm_ConsultaAtendimento.edtData1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ConsultaAtendimento.edtData1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    edtVendedor.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_ConsultaAtendimento.edtData2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall; 
end;

procedure Tfrm_ConsultaAtendimento.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    edtNome.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_ConsultaAtendimento.btnImprimirSlipClick(Sender: TObject);
begin
  ImprimirSLIP.click;
end;

procedure Tfrm_ConsultaAtendimento.ImprimirSLIPClick(Sender: TObject);
var
  continua: Boolean;
begin
  if (qAtendimentos.active) then
    if (qAtendimentos.recordcount<>0) then
      if (qAtendimentos.fieldbyname('AT_STAT').AsString='0') or
        (qAtendimentos.fieldbyname('AT_STAT').AsString='1') then
      begin
//        if (frm_principal.x_slip_na_tela_ATENDIMENTO) then
//        continua:=true
//        else
//        begin
//          if (frmDialogo.ExibirMensagem ('Confirma impressão do SLIP?','Atendimentos',[mbYes,mbNo]
//            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            continua:=true;
//          else
//            continua:=false;
//        end;
        if (continua) then
          ImprimeSlipAtendimento(qAtendimentos.fieldbyname('AT_LOJA').AsFloat,
            qAtendimentos.fieldbyname('AT_CAIX').AsFloat,
            qAtendimentos.fieldbyname('AT_CODI').AsFloat);
      end
      else
      if (qAtendimentos.fieldbyname('AT_STAT').AsString='2') then
      begin
        if (frm_principal.x_slip_na_tela_ATENDIMENTO) then
          continua:=true
        else
        if (frmDialogo.ExibirMensagem ('Confirma impressão do SLIP?'
          ,'Atendimentos',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          continua:=true
        else
          continua:=false;
        if (continua) then
          ImprimeSlipCancelado(qAtendimentos.fieldbyname('AT_LOJA').AsFloat,
            qAtendimentos.fieldbyname('AT_CAIX').AsFloat,
            qAtendimentos.fieldbyname('AT_CODI').AsFloat);
      end;
end;

procedure Tfrm_ConsultaAtendimento.gradeDrawColumnCell(Sender: TObject;
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

procedure Tfrm_ConsultaAtendimento.rdSitClick(Sender: TObject);
begin
  BuscaAtendimento;
end;

end.
