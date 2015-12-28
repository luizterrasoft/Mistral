unit un_ExcAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, Db, DBTables, StdCtrls;

type
  Tfrm_ExcAtendimento = class(TForm)
    Panel1: TPanel;
    botao_sair: TPanel;
    ds: TDataSource;
    qItens: TQuery;
    grade: TDBGrid;
    qItensnomeProduto: TStringField;
    Panel2: TPanel;
    qItenscTota: TStringField;
    qItenscPven: TStringField;
    btnFechar: TPanel;
    Label1: TLabel;
    Image1: TImage;
    qItenscREFI: TStringField;
    qItenscREFF: TStringField;
    qItenscMODO: TStringField;
    qItenscIA_CORE: TStringField;
    qItenscIA_TAMA: TStringField;
    qItensIA_LOJA: TFloatField;
    qItensIA_CAIX: TFloatField;
    qItensIA_VEND: TFloatField;
    qItensIA_GRUP: TFloatField;
    qItensIA_SUBG: TFloatField;
    qItensIA_PROD: TFloatField;
    qItensIA_TAMA: TStringField;
    qItensIA_CORE: TFloatField;
    qItensIA_QTDE: TFloatField;
    qItensIA_TOTA: TFloatField;
    qItensIA_PVEN: TFloatField;
    qItensIA_OTAM: TSmallintField;
    qItensIA_MODO: TSmallintField;
    qItensIA_SEQ: TSmallintField;
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qItensCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ExcAtendimento: Tfrm_ExcAtendimento;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,auxiliar, unDialogo, caixas, venda;

procedure Tfrm_ExcAtendimento.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExcAtendimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ExcAtendimento.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_DELETE) then
    if (frmDialogo.ExibirMensagem ('Confirma exclusão do item?'
      ,'Venda',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
      ExclueItemAtendimentoLocal(qItens.fieldbyname('IA_GRUP').AsFloat,
        qItens.fieldbyname('IA_SUBG').AsFloat,
        qItens.fieldbyname('IA_PROD').AsFloat,
        qItens.fieldbyname('IA_CORE').AsFloat,
        qItens.fieldbyname('IA_TAMA').AsString);
      qItens.close;
      qItens.open;
    end;
end;

procedure Tfrm_ExcAtendimento.qItensCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (dataset) do
  begin
    if (fieldbyname('nomeproduto').IsNull) then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('SELECT PR_DESC,PR_REFF,PR_REFI FROM PRODUTOS             ');
      clAux.AddParam ('WHERE (PR_GRUP='+fieldbyname('IA_GRUP').AsString+') AND  ');
      clAux.AddParam ('      (PR_SUBG='+fieldbyname('IA_SUBG').AsString+') AND  ');
      clAux.AddParam ('      (PR_CODI='+fieldbyname('IA_PROD').AsString+')      ');
      if (clAux.Execute) then
      begin
        fieldbyname('nomeproduto').AsString := clAux.result('PR_DESC');
        fieldbyname('cREFF').AsString := clAux.result('PR_REFF');
        fieldbyname('cREFI').AsString := clAux.result('PR_REFI');
      end
      else
      begin
        fieldbyname('nomeproduto').AsString := '<Produto não cadastrado>';
        fieldbyname('cREFF').AsString := '';
        fieldbyname('cREFI').AsString := '';
      end;
      clAux.desconect;
      clAux.Free;
    end;
    if (fieldbyname('cPven').IsNull) then
      fieldbyname('cPven').AsString :=
        form_nc(fieldbyname('IA_PVEN').AsFloat,10);
    if (fieldbyname('cTota').IsNull) then
      fieldbyname('cTota').AsString :=
        form_nc(fieldbyname('IA_TOTA').AsFloat,10);
    if (fieldbyname('cIA_TAMA').IsNull) then
      if (fieldbyname('IA_TAMA').AsString='0') then
        fieldbyname('cIA_TAMA').AsString := 'UNICO'
      else
        fieldbyname('cIA_TAMA').AsString :=
          fieldbyname('IA_TAMA').AsString;
    if (fieldbyname('cIA_CORE').IsNull) then
      if (fieldbyname('IA_CORE').AsFloat=0) then
        fieldbyname('cIA_CORE').AsString := 'UNICA'
      else
        fieldbyname('cIA_CORE').AsString :=
          ProcuraAbrevCor(fieldbyname('IA_CORE').AsFloat,self);
    if (fieldbyname('cMODO').IsNull) then
      if (fieldbyname('IA_MODO').AsInteger=0) then
        fieldbyname('cMODO').AsString := 'V'
      else
      if (fieldbyname('IA_MODO').AsInteger=1) then
        fieldbyname('cMODO').AsString := 'D'
      else
      if (fieldbyname('IA_MODO').AsInteger=2) then
        fieldbyname('cMODO').AsString := 'T';
  end;
end;

procedure Tfrm_ExcAtendimento.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);

     {**************************************************}
  grade.columns[1].visible := false;
  grade.columns[2].visible := false;
  grade.columns[3].visible := false;
  grade.columns[4].visible := false;
  grade.columns[5].visible := false;
  if (frm_principal.x_ordem_codigo=1) then
  begin
    grade.columns[1].visible := true;
    grade.columns[2].visible := true;
    grade.columns[3].visible := true;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
    grade.columns[4].visible := true
  else
  if (frm_principal.x_ordem_reffabric=1) then
    grade.columns[5].visible := true;
end;

procedure Tfrm_ExcAtendimento.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExcAtendimento.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (qItens.fieldbyname('IA_MODO').AsInteger=0) then {VENDA}
    grade.Canvas.Font.color:=clBlack
  else
  if (qItens.fieldbyname('IA_MODO').AsInteger=1) then {DEVOLUCAO}
    grade.Canvas.Font.color:=clRed
  else
  if (qItens.fieldbyname('IA_MODO').AsInteger=2) then {TROCA}
    grade.Canvas.Font.color:=clBlue;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

end.
