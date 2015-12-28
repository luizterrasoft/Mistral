unit un_CaixaLancamentos_Consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, DB, DBTables, Grids, DBGrids,
  Mask, MaskEditOO, LabelOO, Menus, CheckBoxOO,caixa;

type
  Tfrm_CaixaLancamentos_Consulta = class(TForm)
    Label22: TLabel;
    Label23: TLabel;
    BotaoSair1: TBotaoSair;
    grade: TDBGrid;
    ds: TDataSource;
    qLancamentos: TQuery;
    LabelOO1: TLabelOO;
    edtData1: TMaskEditOO;
    LabelOO2: TLabelOO;
    edtData2: TMaskEditOO;
    btnOk: TPanel;
    lblCaixa: TLabelOO;
    lblTerminal: TLabelOO;
    Bevel1: TBevel;
    lblLoja: TLabelOO;
    qLancamentosLC_LOJA: TFloatField;
    qLancamentosLC_CAIX: TFloatField;
    qLancamentosLC_DATA: TDateTimeField;
    qLancamentosLC_FUNC: TFloatField;
    qLancamentosLC_SEQ: TFloatField;
    qLancamentosLC_VALO: TFloatField;
    qLancamentosLC_NATU: TStringField;
    qLancamentosLC_DESC: TStringField;
    qLancamentosLC_TIPZ: TStringField;
    qLancamentosLC_CONT: TFloatField;
    qLancamentosLC_TIPO: TFloatField;
    qLancamentoscNATUREZA: TStringField;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    qLancamentoscTIPO: TStringField;
    lbtipz: TLabel;
    qLancamentoscVALO: TStringField;
    chTodosTerminais: TCheckBoxOO;
    pnTotalDeb: TPanel;
    LabelOO3: TLabelOO;
    LabelOO4: TLabelOO;
    pnTotalCred: TPanel;
    LabelOO5: TLabelOO;
    pnTotal: TPanel;
    LabelOO6: TLabelOO;
    LabelOO7: TLabelOO;
    lbltitulo: TLabel;
    lbltitulo_sombra: TLabel;
    Image2: TImage;
    Bevel2: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure edtData1Enter(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qLancamentosCalcFields(DataSet: TDataSet);
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chTodosTerminaisClick(Sender: TObject);
    procedure chTodosTerminaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qLancamentosAfterClose(DataSet: TDataSet);
    procedure Panel1Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipz: String;
    procedure deletacontasapagar(recalc:Boolean);
  end;

var
  frm_CaixaLancamentos_Consulta: Tfrm_CaixaLancamentos_Consulta;

implementation

uses principal, venda, funcoes1, funcoes2, procura, auxiliar, unDialogo,
  un_CaixaLancamentos;

{$R *.dfm}

procedure Tfrm_CaixaLancamentos_Consulta.edtData1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall; 
end;

procedure Tfrm_CaixaLancamentos_Consulta.btnOkClick(Sender: TObject);
var
  total_credito: Real;
  total_debito: Real;
begin
  if (edtData1.GetValor=strtodate('01/01/1900')) then
    ExibeCritica ('Informe a data inicial dos lançamentos!','Caixa',edtData1)
  else
  if (edtData2.GetValor=strtodate('01/01/1900')) then
    ExibeCritica ('Informe a data inicial dos lançamentos!','Caixa',edtData2)
  else
  begin
    with (qLancamentos) do
    begin
      close;
      sql.clear;
      sql.Add ('SELECT * FROM LANCAMENTOS_CAIXA                                           ');
      sql.Add ('WHERE (LC_DATA>=:data1) AND (LC_DATA<=:data2) AND                         ');
      sql.Add ('      (LC_LOJA=:loja)                                                     ');
      if (not chTodosTerminais.checked) then
        sql.Add ('   AND (LC_CAIX=:terminal)                                             ');
      if (frm_principal.x_caixa_ativo<>0) then
        sql.Add ('    AND (LC_FUNC=:func)                                                ');
      if (tipz='1') or (tipz='2') then
        sql.Add (' AND (LC_TIPZ='+chr(39)+tipz+chr(39)+')                                ');
      parambyname('data1').AsDateTime := edtData1.GetValor;
      parambyname('data2').AsDateTime := edtData2.GetValor;
      if (frm_principal.x_caixa_ativo<>0) then
        parambyname('func').AsFloat  := frm_principal.x_caixa_ativo;
      parambyname('loja').AsFloat     := frm_principal.x_loja;
      if (not chTodosTerminais.checked) then
        parambyname('terminal').AsFloat := frm_principal.x_terminal;
      open; {*}

      disablecontrols;
      first;
      total_credito := 0.00;
      total_debito  := 0.00;
      while (not eof) do
      begin
        if (fieldbyname('LC_NATU').AsString='C') then
          total_credito := total_credito + fieldbyname('LC_VALO').AsFloat
        else
        if (fieldbyname('LC_NATU').AsString='D') then
          total_debito := total_debito + fieldbyname('LC_VALO').AsFloat;
        next;
      end;
               
      pnTotalDeb.caption  := trim(form_nc(total_debito,10));
      pnTotalCred.caption := trim(form_nc(total_credito,10));
      pnTotal.caption     := trim(form_nc(total_credito - total_debito,10));

      enablecontrols;
      first;
    end;
    grade.setfocus;
  end;
end;

procedure Tfrm_CaixaLancamentos_Consulta.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_CaixaLancamentos_Consulta.Limparformulrio1Click(
  Sender: TObject);
begin
  qLancamentos.close;
  edtData1.text := '';
  edtData2.text := '';
  edtData1.setfocus;
end;

procedure Tfrm_CaixaLancamentos_Consulta.FormActivate(Sender: TObject);
begin
  windowstate:=wsMaximized;   
  lblLoja.caption := 'Loja: '+form_nz(frm_principal.x_loja,2)+'/'+ProcuraNomeLoja(frm_principal.x_loja,self);
  lblTerminal.caption := 'Terminal: '+form_nz(frm_principal.x_terminal,2);
  if (frm_principal.x_caixa_ativo<>0) then
    lblCaixa.caption := 'Operador de caixa: '+form_nz(frm_principal.x_caixa_ativo,6)+'/'+ProcuraNomeVendCaixa(frm_principal.x_loja,frm_principal.x_caixa_ativo,self)
  else
    lblCaixa.caption := 'Operador de caixa: TODOS';
  chTodosTerminais.checked := false;
end;

procedure Tfrm_CaixaLancamentos_Consulta.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lbtipz.visible:=true;
        grade.columns[8].visible := true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='3';
        lbtipz.visible:=true;
        grade.columns[8].visible := true;
      end
      else
      if (tipz='3') then
      begin
        tipz:='1';
        lbtipz.visible:=false;
        grade.columns[8].visible := false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
               
      if (edtData1.GetValor<>strtodate('01/01/1900')) and (edtData2.GetValor<>strtodate('01/01/1900')) then
        btnOkClick(btnOk);
    end;
end;

procedure Tfrm_CaixaLancamentos_Consulta.edtData1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtData2.setfocus;
  if (key=38) then
  ;
end;

procedure Tfrm_CaixaLancamentos_Consulta.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    BtnOkClick(btnOk);
  if (key=38) then
    edtData1.setfocus;
end;

procedure Tfrm_CaixaLancamentos_Consulta.qLancamentosCalcFields(
  DataSet: TDataSet);
begin
  with (dataset) do
  begin
    if (fieldbyname('cTIPO').IsNull) then
      fieldbyname('cTIPO').AsString := ProcuraNomeTipoValor(fieldbyname('LC_TIPO').AsInteger);
    if (fieldbyname('cVALO').IsNull) then
      fieldbyname('cVALO').AsString := trim(form_nc(fieldbyname('LC_VALO').AsFloat,15));
  end;
end;

procedure Tfrm_CaixaLancamentos_Consulta.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_CaixaLancamentos_Consulta.FormCreate(Sender: TObject);
begin
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
  edtData1.text :=form_data(frm_principal.x_data_trabalho);
  edtData2.text :=form_data(frm_principal.x_data_trabalho);
  qLancamentos.databasename := databasecontas; {* - VENDAS ou CONTASPAGAR}
  Image2.picture := frm_principal.Image1.picture;
end;

procedure Tfrm_CaixaLancamentos_Consulta.chTodosTerminaisClick(
  Sender: TObject);
begin
  if (chTodosTerminais.checked) then
    lblterminal.caption := 'Terminal: TODOS'
  else
    lblTerminal.caption := 'Terminal: '+form_nz(frm_principal.x_terminal,2);
     
  if (edtData1.GetValor<>strtodate('01/01/1900')) and (edtData2.GetValor<>strtodate('01/01/1900')) then
    btnOkClick(btnOk);
end;

procedure Tfrm_CaixaLancamentos_Consulta.chTodosTerminaisKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  chTodosTerminaisClick(chTodosTerminais);
end;

procedure Tfrm_CaixaLancamentos_Consulta.qLancamentosAfterClose(
  DataSet: TDataSet);
begin
  pnTotalDeb.caption  := '0,00';
  pnTotalCred.caption := '0,00';
  pnTotal.caption     := '0,00';
end;

procedure Tfrm_CaixaLancamentos_Consulta.Panel1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  SavePlace:TBookMark;
  floja,fcaix,ffunc,fseq,total_credito,total_debito:Real;
  fdata:tdatetime;
begin
  if (frmDialogo.ExibirMensagem ('Confirma Exclusão?'
    ,'Lançamentos Diversos',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)<>mrYes) then
    exit;


  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecontas,self);
  clAux.ClearSql;
  clAux.AddParam ('DELETE FROM LANCAMENTOS_CAIXA ');
  clAux.AddParam ('WHERE (LC_LOJA=:loja) AND (LC_CAIX=:terminal) AND (LC_FUNC=:caixa) AND (LC_DATA=:data) AND LC_SEQ =:SEQ');
  clAux.consulta.parambyname('loja').AsFloat     := QLancamentos.fieldbyname('LC_LOJA').AsFloat;
  clAux.consulta.parambyname('terminal').AsFloat := QLancamentos.fieldbyname('LC_CAIX').AsFloat;
  clAux.consulta.parambyname('caixa').AsFloat    := QLancamentos.fieldbyname('LC_FUNC').AsFloat;
  clAux.consulta.parambyname('data').AsDateTime  := QLancamentos.fieldbyname('LC_DATA').AsDateTime;
  clAux.consulta.parambyname('Seq').AsFloat      := QLancamentos.fieldbyname('LC_SEQ').AsFloat;
  claux.execute;
  try
    deletacontasapagar(true);

    QLancamentos.Next;
    if QLancamentos.eof then
    begin
      QLancamentos.Prior;
      QLancamentos.Prior;
    end;

    Floja := QLancamentos.fieldbyname('LC_LOJA').AsFloat;
    FCaix := QLancamentos.fieldbyname('LC_CAIX').AsFloat;
    FFunc := QLancamentos.fieldbyname('LC_FUNC').AsFloat;
    Fdata := QLancamentos.fieldbyname('LC_DATA').AsDateTime;
    FSeq  := QLancamentos.fieldbyname('LC_SEQ').AsFloat;

    try
      SavePlace := QLancamentos.GetBookmark;

      QLancamentos.Close;
      QLancamentos.Open;

      with qlancamentos do
      begin
        disablecontrols;
        first;
        total_credito := 0.00;
        total_debito  := 0.00;
        while (not eof) do
        begin
          if (fieldbyname('LC_NATU').AsString='C') then
            total_credito := total_credito + fieldbyname('LC_VALO').AsFloat
          else
          if (fieldbyname('LC_NATU').AsString='D') then
            total_debito := total_debito + fieldbyname('LC_VALO').AsFloat;
          next;
        end;

        pnTotalDeb.caption  := trim(form_nc(total_debito,10));
        pnTotalCred.caption := trim(form_nc(total_credito,10));
        pnTotal.caption     := trim(form_nc(total_credito - total_debito,10));

        enablecontrols;
        first;
      end;

      if not qlancamentos.eof then
        QLancamentos.Locate('LC_LOJA;LC_CAIX;LC_FUNC;LC_DATA;LC_SEQ',VarArrayOf([floja,fcaix,ffunc,fdata,fseq]),[]);
    finally
      QLancamentos.FreeBookmark(SavePlace);
    end;
  finally
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure Tfrm_CaixaLancamentos_Consulta.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (KEY = VK_DELETE) and (SHIFT = [SSCTRL]) then
    Panel1.OnClick(Sender);
  if key = vk_f5 then
    Panel2.OnClick(Sender); 
end;

procedure Tfrm_CaixaLancamentos_Consulta.Panel2Click(Sender: TObject);
var
  SavePlace:TBookMark;
  floja,fcaix,ffunc,fseq,total_credito,total_debito:Real;
  fdata:tdatetime;
begin
  frm_CaixaLancamentos := Tfrm_CaixaLancamentos.Create(Application);
  try
    with frm_CaixaLancamentos do
    begin
      edtvalor.text := formatfloat('#,##0.00',QLancamentos.FieldbyName('LC_Valo').AsFloat);
      edtNatu.text  := QLancamentos.FieldbyName('LC_NATU').AsString;
      edtconta.text := QLancamentos.FieldbyName('LC_CONT').AsString;
      edtmaskeditformulario1.OnExit(edtconta);
      EdtTipoValor.text := QLancamentos.FieldbyName('LC_TIPO').AsString;
      edtmaskeditformulario1.OnExit(EdtTipoValor);
      EdtDesc.text := QLancamentos.FieldbyName('LC_DESC').AsString;
      Tipz         := QLancamentos.FieldbyName('LC_TIPZ').AsString;
      altera       := QLancamentos.FieldbyName('LC_SEQ').AsFloat;
      frm_CaixaLancamentos.showmodal;
    end;
  finally
    frm_CaixaLancamentos.Destroy;
  end;

  try
    SavePlace := QLancamentos.GetBookmark;

    Floja := QLancamentos.fieldbyname('LC_LOJA').AsFloat;
    FCaix := QLancamentos.fieldbyname('LC_CAIX').AsFloat;
    FFunc := QLancamentos.fieldbyname('LC_FUNC').AsFloat;
    Fdata := QLancamentos.fieldbyname('LC_DATA').AsDateTime;
    FSeq  := QLancamentos.fieldbyname('LC_SEQ').AsFloat;


    QLancamentos.Close;
    QLancamentos.Open;

    with qlancamentos do
    begin
      disablecontrols;
      first;
      total_credito := 0.00;
      total_debito  := 0.00;
      while (not eof) do
      begin
        if (fieldbyname('LC_NATU').AsString='C') then
          total_credito := total_credito + fieldbyname('LC_VALO').AsFloat
        else
        if (fieldbyname('LC_NATU').AsString='D') then
          total_debito := total_debito + fieldbyname('LC_VALO').AsFloat;
        next;
      end;

      pnTotalDeb.caption  := trim(form_nc(total_debito,10));
      pnTotalCred.caption := trim(form_nc(total_credito,10));
      pnTotal.caption     := trim(form_nc(total_credito - total_debito,10));

      enablecontrols;
      first;
    end;


    if not qlancamentos.eof then
      QLancamentos.Locate('LC_LOJA;LC_CAIX;LC_FUNC;LC_DATA;LC_SEQ',VarArrayOf([floja,fcaix,ffunc,fdata,fseq]),[]);
  finally
    QLancamentos.FreeBookmark(SavePlace);
  end;
end;

procedure Tfrm_CaixaLancamentos_Consulta.deletacontasapagar(
  recalc: Boolean);
var
  ClLanc3,ClLanca,cllanc2:TClassAuxiliar;
  SeqLanca:Real;
begin
  clLanc3 := TClassAuxiliar.Create;
  clLanc3.conect   ('VENDAS',self);

  ClLanc3.ClearSql;
  ClLanc3.AddParam ('INSERT INTO LANCAMENTOS_CAIXA_EXC');
  ClLanc3.AddParam (' (LC_LOJA,LC_CAIX,LC_DATA,LC_FUNC,LC_SEQ,LC_TIME)');
  ClLanc3.AddParam ('VALUES                                                                                                   ');
  ClLanc3.AddParam (' (:LC_LOJA,:LC_CAIX,:LC_DATA,:LC_FUNC,:LC_SEQ,:LC_TIME)');
  ClLanc3.consulta.parambyname('LC_loja').AsFloat     := QLancamentos.fieldbyname('LC_LOJA').AsFloat;
  ClLanc3.consulta.parambyname('LC_CAIX').AsFloat     := QLancamentos.fieldbyname('LC_CAIX').AsFloat;
  ClLanc3.consulta.parambyname('LC_FUNC').AsFloat     := QLancamentos.fieldbyname('LC_FUNC').AsFloat;
  ClLanc3.consulta.parambyname('LC_data').AsDateTime  := QLancamentos.fieldbyname('LC_DATA').AsDateTime;
  ClLanc3.consulta.parambyname('LC_Seq').AsFloat      := QLancamentos.fieldbyname('LC_SEQ').AsFloat;
  ClLanc3.consulta.parambyname('LC_TIME').AsDateTime  := frm_principal.x_data_trabalho;
  ClLanc3.Execute;

  ClLanc3.Desconect;
  ClLanc3.Destroy;







  if databasecontas <> 'CONTASPAGAR' then
    exit;

  try
    clLanca := TClassAuxiliar.Create;
    clLanca.conect   ('CONTASPAGAR',self);

    clLanc2 := TClassAuxiliar.Create;
    clLanc2.conect   ('ESTOQUE',self);

    clLanca.ClearSql;
    clLanca.AddParam ('SELECT LA_SEQ FROM LANCAMENTOS');
    clLanca.AddParam ('WHERE LA_CUST =:LA_CUST  ');
    clLanca.AddParam ('AND   LA_TIPO =:LA_TIPO  ');
    clLanca.AddParam ('AND   LA_DATA =:LA_DATA  ');
    clLanca.AddParam ('AND   LA_SEQP =:LA_SEQP  ');
    ClLanca.consulta.parambyname('LA_Cust').AsFloat     := QLancamentos.fieldbyname('LC_LOJA').AsFloat;
    ClLanca.consulta.parambyname('LA_Tipo').AsString    := 'CX'+
      form_nz(QLancamentos.fieldbyname('LC_CAIX').AsFloat,2)+
      form_nz(QLancamentos.fieldbyname('LC_FUNC').AsFloat,6);
    ClLanca.consulta.parambyname('LA_data').AsDateTime  := QLancamentos.fieldbyname('LC_DATA').AsDateTime;
    clLanca.consulta.parambyname('LA_SEQP').AsFloat    := QLAncamentos.FieldByNAme('LC_SEQ').AsFloat;
    clLanca.Execute;

    seqlanca := cllanca.result('LA_SEQ');


    cllanca.consulta.close;
    clLanca.consulta.sql[0] :=  'DELETE FROM LANCAMENTOS';
    clLanca.Execute;

    if (frm_principal.x_online) then //se ESTOQUE estiver ONLINE
    begin
      ClLanca.ClearSql;
      clLanca.AddParam ('DELETE FROM LANCAMENTOS_CONTA_CAIXA');
      clLanca.AddParam ('WHERE LA_CUST =:LA_CUST  ');
      clLanca.AddParam ('AND   LA_TIPO =:LA_TIPO  ');
      clLanca.AddParam ('AND   LA_DATA =:LA_DATA  ');
      clLanca.AddParam ('AND   LA_SEQ  =:LA_SEQ  ');
      ClLanca.consulta.parambyname('LA_Cust').AsFloat     := QLancamentos.fieldbyname('LC_LOJA').AsFloat;
      ClLanca.consulta.parambyname('LA_Tipo').AsString    := 'CX'+
        form_nz(QLancamentos.fieldbyname('LC_CAIX').AsFloat,2)+
        form_nz(QLancamentos.fieldbyname('LC_FUNC').AsFloat,6);
      ClLanca.consulta.parambyname('LA_data').AsDateTime  := QLancamentos.fieldbyname('LC_DATA').AsDateTime;

      ClLanc2.Clearsql;
      ClLanc2.AddParam('Select SEQCAIXA from CAIXA_DIVERSO WHERE SEQDIVERSO =:LA_SEQ');
      clLanc2.consulta.parambyname('LA_SEQ').AsFloat    := SeqLanca;
      cllanc2.execute;

      while not ClLanc2.Eof do
      begin
        clLanca.consulta.parambyname('LA_SEQ').AsFloat := ClLanc2.Result('SEQCAIXA');
        cllanca.execute;
        ClLanc2.Next;
      end;

      RecalcularSaldosConta     (QLancamentos.fieldbyname('LC_CONT').AsFloat,QLancamentos.fieldbyname('LC_LOJA').AsFloat,QLancamentos.fieldbyname('LC_DATA').AsDateTime);
      RecalcularSaldosContaTipz (QLancamentos.fieldbyname('LC_CONT').AsFloat,QLancamentos.fieldbyname('LC_LOJA').AsFloat,QLancamentos.fieldbyname('LC_TIPZ').AsString,QLancamentos.fieldbyname('LC_DATA').AsDateTime);
    end;
  finally
    ClLanca.Desconect;
    ClLanc2.Desconect;
    ClLanca.Destroy;
    ClLanc2.Destroy;
  end;

end;

procedure Tfrm_CaixaLancamentos_Consulta.FormDestroy(Sender: TObject);
begin
  frm_CaixaLancamentos_Consulta := nil;
end;

end.
