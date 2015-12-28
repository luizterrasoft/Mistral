unit un_VerMovimentoItemLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, Buttons, StdCtrls, ExtCtrls;

type
  Tfrm_VerMovimentoItemLoja = class(TForm)
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    botao_sair: TPanel;
    ds: TDataSource;
    qMovimento: TQuery;
    grade: TDBGrid;
    qMovimentoMO_GRUP: TFloatField;
    qMovimentoMO_SUBG: TFloatField;
    qMovimentoMO_PROD: TFloatField;
    qMovimentoMO_LOJA: TFloatField;
    qMovimentoMO_CORE: TFloatField;
    qMovimentoMO_TAMA: TStringField;
    qMovimentoMO_NPED: TFloatField;
    qMovimentoMO_DATA: TDateTimeField;
    qMovimentoMO_TIPO: TStringField;
    qMovimentoMO_MODE: TStringField;
    qMovimentoMO_QTD1: TFloatField;
    qMovimentoMO_PVE1: TFloatField;
    qMovimentoMO_PCU1: TFloatField;
    qMovimentoMO_TIPZ: TStringField;
    qMovimentoMO_NOTA: TStringField;
    qMovimentoMO_ENTR: TStringField;
    qMovimentoMO_FORN: TFloatField;
    Panel1: TPanel;
    Label1: TLabel;
    pnLoja: TPanel;
    Label2: TLabel;
    pnSubGrupo: TPanel;
    Label3: TLabel;
    pnGrupo: TPanel;
    Label5: TLabel;
    pnCor: TPanel;
    Label6: TLabel;
    pnTamanho: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    qMovimentoMO_SEQ: TFloatField;
    qMovimentocQtde: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qMovimentoCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    y_loja: Real;
    y_produto: Real;
    y_subgrupo: Real;
    y_grupo: Real;
    y_tamanho: String;
    y_cor: Real;
    jaViu: Boolean;
    tipz: String;
    procedure AtualizaMovimento;
  end;

var
  frm_VerMovimentoItemLoja: Tfrm_VerMovimentoItemLoja;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, unDialogo, auxiliar, estoques;

procedure Tfrm_VerMovimentoItemLoja.AtualizaMovimento;
begin
  with (qMovimento) do
  begin
    close;
    parambyname('loja').AsFloat     := y_loja;
    parambyname('grupo').AsFloat    := y_grupo;
    parambyname('subgrupo').AsFloat := y_subgrupo;
    parambyname('produto').AsFloat  := y_produto;
    parambyname('faixa').AsString   := y_tamanho;
    parambyname('cor').AsFloat      := y_cor;
    open;
  end;
end;

procedure Tfrm_VerMovimentoItemLoja.FormActivate(Sender: TObject);
begin
  if (not jaViu) then
  begin
    qMovimento.close;
    qMovimento.sql.clear;
    qMovimento.sql.add('SELECT *                       ');
    qMovimento.sql.add('FROM MOVIMENTO                 ');
    qMovimento.sql.add('WHERE (MO_LOJA=:loja) AND      ');
    qMovimento.sql.add('      (MO_PROD=:produto) AND   ');
    qMovimento.sql.add('      (MO_GRUP=:grupo) AND     ');
    qMovimento.sql.add('      (MO_SUBG=:subgrupo) AND  ');
    qMovimento.sql.add('      (MO_TAMA=:faixa) AND     ');
    qMovimento.sql.add('      (MO_CORE=:cor)           ');
    if (tipz='1') then
      qMovimento.sql.add(' AND (MO_TIPZ='+chr(39)+'1'+chr(39)+')           ')
    else
    if (tipz='2') then
      qMovimento.sql.add(' AND (MO_TIPZ='+chr(39)+'2'+chr(39)+')           ');
    qMovimento.sql.add('Order by MO_DATA               ');
    AtualizaMovimento;
    pnLoja.caption     := ProcuraNomeLoja(y_loja,self);
    pnGrupo.caption    := ProcuraNomeGruposProdutos(y_grupo,self);
    pnSubGrupo.caption := ProcuraNomeSubgruposProdutos(y_grupo,y_subgrupo,self);
    pnCor.caption      := ProcuraAbrevCor(y_cor,self);
    pnTamanho.caption  := y_tamanho;
    jaViu              := true;
  end;
  grade.setfocus;
end;

procedure Tfrm_VerMovimentoItemLoja.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_VerMovimentoItemLoja.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  seqAnt: Real;
  clAux: TClassAuxiliar;
begin
  if (key=K_ESC) then
    close;
  if (key=K_DELETE) then
    if (frmDialogo.ExibirMensagem ('Excluir registro de movimento?'
      ,'Movimento de estoque',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (Trim(qMovimento.fieldbyname('MO_NOTA').AsString)<>'') then
      begin
        frmDialogo.ExibirMensagem (' Registros de entrada c/ nota não podem ser excluídos! '
          ,'Movimento de estoque',[mbOK]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
        grade.setfocus;
      end
      else
      begin
                    {Excluindo o registro}
        qMovimento.disablecontrols;
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('ESTOQUE',self);
        clAux.ClearSql;
        clAux.AddParam ('Delete from MOVIMENTO  ');
        clAux.AddParam ('Where (MO_SEQ='+qMovimento.fieldbyname('MO_SEQ').AsString+')    ');
        clAux.Execute;
        clAux.desconect;
        clAux.Free;

                    {...}
        ReCalculaSaldoItem (qMovimento.fieldbyname('MO_GRUP').AsFloat,
          qMovimento.fieldbyname('MO_SUBG').AsFloat,
          qMovimento.fieldbyname('MO_PROD').AsFloat,
          qMovimento.fieldbyname('MO_LOJA').AsFloat,
          qMovimento.fieldbyname('MO_CORE').AsFloat,
          qMovimento.fieldbyname('MO_TAMA').AsString,
          qMovimento.fieldbyname('MO_TIPZ').AsString);
        CalculaPrecoCustoMedio (qMovimento.fieldbyname('MO_GRUP').AsFloat,
          qMovimento.fieldbyname('MO_SUBG').AsFloat,
          qMovimento.fieldbyname('MO_PROD').AsFloat,
          qMovimento.fieldbyname('MO_LOJA').AsFloat,
          qMovimento.fieldbyname('MO_CORE').AsFloat,
          qMovimento.fieldbyname('MO_TAMA').AsString,
          qMovimento.fieldbyname('MO_TIPZ').AsString);

                    {-->}
        qMovimento.next;
        if (not qMovimento.eof) then
          seqAnt := qMovimento.fieldbyname('MO_SEQ').AsFloat
        else
          seqAnt := -1;
        AtualizaMovimento;
        qMovimento.first;
        if (seqAnt<>-1) then
        begin
          while (not qMovimento.eof) do
          begin
            if (qMovimento.fieldbyname('MO_SEQ').AsFloat=seqAnt) then
              break;
            qMovimento.next;
          end;
        end
        else
          qMovimento.last;
        qMovimento.enablecontrols;
      end;
end;

procedure Tfrm_VerMovimentoItemLoja.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (qMovimentoMO_TIPO.AsString='E') then
    grade.Canvas.Font.color:=clBlue
  else
  if (qMovimentoMO_TIPO.AsString='S') then
    grade.Canvas.Font.color:=clRed;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_VerMovimentoItemLoja.qMovimentoCalcFields(
  DataSet: TDataSet);
begin
  with (qMovimento) do
    if (fieldbyname('cQTDE').IsNull) then
      fieldbyname('cQTDE').AsString :=
        Trim(form_nc(fieldbyname('MO_QTD1').AsFloat,10));
end;

procedure Tfrm_VerMovimentoItemLoja.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        grade.Columns[7].Title.Caption   := 'Qtde 02';
      end
      else
      if (tipz='2') then
      begin
        tipz:='1';
        grade.Columns[7].Title.Caption   := 'Qtde';
      end;
      qMovimento.close;
      qMovimento.sql.clear;
      qMovimento.sql.add('SELECT *                       ');
      qMovimento.sql.add('FROM MOVIMENTO                 ');
      qMovimento.sql.add('WHERE (MO_LOJA=:loja) AND      ');
      qMovimento.sql.add('      (MO_PROD=:produto) AND   ');
      qMovimento.sql.add('      (MO_GRUP=:grupo) AND     ');
      qMovimento.sql.add('      (MO_SUBG=:subgrupo) AND  ');
      qMovimento.sql.add('      (MO_TAMA=:faixa) AND     ');
      qMovimento.sql.add('      (MO_CORE=:cor)           ');
      if (tipz='1') then
        qMovimento.sql.add(' AND (MO_TIPZ='+chr(39)+'1'+chr(39)+')           ')
      else
      if (tipz='2') then
        qMovimento.sql.add(' AND (MO_TIPZ='+chr(39)+'2'+chr(39)+')           ');
      qMovimento.sql.add('Order by MO_DATA               ');
      AtualizaMovimento;
    end;
end;

end.
