unit un_ExcVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, Db, DBTables, StdCtrls, LabelOO,variants,funcoesglobais;

type
  Tfrm_ExcVenda = class(TForm)
    Panel1: TPanel;
    botao_sair: TPanel;
    ds: TDataSource;
    qItens: TQuery;
    qItensIV_LOJA: TFloatField;
    qItensIV_CAIX: TFloatField;
    qItensIV_VEND: TFloatField;
    qItensIV_TIPZ: TStringField;
    qItensIV_GRUP: TFloatField;
    qItensIV_SUBG: TFloatField;
    qItensIV_PROD: TFloatField;
    qItensIV_TAMA: TStringField;
    qItensIV_CORE: TFloatField;
    qItensIV_QTDE: TFloatField;
    qItensIV_TOTA: TFloatField;
    qItensIV_PVEN: TFloatField;
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
    qItensIV_MODO: TSmallintField;
    qItenscMODO: TStringField;
    qItenscIV_CORE: TStringField;
    qItenscIV_TAMA: TStringField;
    LabelOO1: TLabelOO;
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
  frm_ExcVenda: Tfrm_ExcVenda;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,auxiliar, unDialogo, venda,
  un_senhaSupervisor, un_LancaVenda;

procedure Tfrm_ExcVenda.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExcVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ExcVenda.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  continua: Boolean;
  FGrupo,fsubg,fprod,fcor:Real;
  ftama:String;
begin
  if (key=K_ENTER) or (key=K_DELETE) then
    if (frmDialogo.ExibirMensagem ('Confirma exclusão do item?'
      ,'Venda',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
               //***********************************************************************************
      if (frm_principal.x_solicitar_senha_SAIDA_LANCAMENTO_VENDA) then
      begin
        frm_senhaSupervisor.showmodal;
        if (frm_senhaSupervisor.y_flag) then
        begin
          frm_LancaVenda.bPODE_SAIR := true;
          continua := true;
        end
        else
          continua := false;
        frm_senhaSupervisor.y_flag:=false;
      end
      else
        continua := true;
               //***********************************************************************************

               {...}
      if (frm_lancavenda <> nil) and
        frm_principal.x_ecf_habilita_modo_fiscal and
        frm_principal.x_ImpItemECF and
        frm_lancavenda.CupomAberto and
        (qItens.fieldbyname('IV_MODO').AsInteger = 0) then
        continua :=  frm_lancavenda.DeletaItemVendaCupom(qItens.fieldbyname('IV_GRUP').AsFloat,
          qItens.fieldbyname('IV_SUBG').AsFloat,
          qItens.fieldbyname('IV_PROD').AsFloat,
          qItens.fieldbyname('IV_CORE').AsFloat,
          qItens.fieldbyname('IV_TAMA').AsString);

      if (continua) then
      begin
        ExclueItemVendaLocal(qItens.fieldbyname('IV_GRUP').AsFloat,
          qItens.fieldbyname('IV_SUBG').AsFloat,
          qItens.fieldbyname('IV_PROD').AsFloat,
          qItens.fieldbyname('IV_CORE').AsFloat,
          qItens.fieldbyname('IV_TAMA').AsString,
          qItens.fieldbyname('IV_MODO').AsInteger);

        qItens.close;
        qItens.open;

        if (frm_lancavenda <> nil) and
          frm_principal.x_ecf_habilita_modo_fiscal and
          frm_principal.x_ImpItemECF and
          frm_lancavenda.CupomAberto and
          (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) and(frm_lancavenda.FListaProd.Count > 0) and
          (qItens.fieldbyname('IV_MODO').AsInteger = 0) then
        begin
          QItens.First;
          fgrupo := StrtoFloatN(copy(Frm_LancaVenda.FListaProd[Frm_LancaVenda.FListaProd.Count - 1],1,10));
          fsubg  := StrtoFloatN(copy(Frm_LancaVenda.FListaProd[Frm_LancaVenda.FListaProd.Count - 1],11,10));
          fprod  := StrtoFloatN(copy(Frm_LancaVenda.FListaProd[Frm_LancaVenda.FListaProd.Count - 1],21,10));
          fcor   := StrtoFloatN(copy(Frm_LancaVenda.FListaProd[Frm_LancaVenda.FListaProd.Count - 1],31,10));
          ftama  := copy(Frm_LancaVenda.FListaProd[Frm_LancaVenda.FListaProd.Count - 1],41,Pos('*',Frm_LancaVenda.FListaProd[Frm_LancaVenda.FListaProd.Count - 1]) - 41);
          while not QItens.eof do
          begin
            if (QItens.FieldbYName('Iv_Grup').AsFloat = fgrupo) and
              (QItens.FieldbYName('Iv_SubG').AsFloat = FSubG) and
              (QItens.FieldbYName('Iv_Prod').AsFloat = Fprod) and
              (QItens.FieldbYName('Iv_Core').AsFloat = FCor) and
              (QItens.FieldbYName('Iv_Tama').AsString = Ftama) then
              break;
            QItens.next;
          end;
        end;

      end;
    end;
  if (key = vk_escape) and not grade.enabled then
    close;
end;

procedure Tfrm_ExcVenda.qItensCalcFields(DataSet: TDataSet);
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
      clAux.AddParam ('WHERE (PR_GRUP='+fieldbyname('IV_GRUP').AsString+') AND  ');
      clAux.AddParam ('      (PR_SUBG='+fieldbyname('IV_SUBG').AsString+') AND  ');
      clAux.AddParam ('      (PR_CODI='+fieldbyname('IV_PROD').AsString+')      ');
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
        form_nc(fieldbyname('IV_PVEN').AsFloat,10);
    if (fieldbyname('cTota').IsNull) then
      fieldbyname('cTota').AsString :=
        form_nc(fieldbyname('IV_TOTA').AsFloat,10);
    if (fieldbyname('cIV_TAMA').IsNull) then
      if (fieldbyname('IV_TAMA').AsString='0') then
        fieldbyname('cIV_TAMA').AsString := 'UNICO'
      else
        fieldbyname('cIV_TAMA').AsString :=
          fieldbyname('IV_TAMA').AsString;
    if (fieldbyname('cIV_CORE').IsNull) then
      if (fieldbyname('IV_CORE').AsFloat=0) then
        fieldbyname('cIV_CORE').AsString := 'UNICA'
      else
        fieldbyname('cIV_CORE').AsString :=
          ProcuraAbrevCor(fieldbyname('IV_CORE').AsFloat,self);
    if (fieldbyname('cMODO').IsNull) then
      if (fieldbyname('IV_MODO').AsInteger=0) then
        fieldbyname('cMODO').AsString := 'V'
      else
      if (fieldbyname('IV_MODO').AsInteger=1) then
        fieldbyname('cMODO').AsString := 'D'
      else
      if (fieldbyname('IV_MODO').AsInteger=2) then
        fieldbyname('cMODO').AsString := 'T';
  end;
end;

procedure Tfrm_ExcVenda.FormActivate(Sender: TObject);
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

procedure Tfrm_ExcVenda.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExcVenda.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (qItens.fieldbyname('IV_MODO').AsInteger=0) then {VENDA}
    grade.Canvas.Font.color:=clBlack
  else
  if (qItens.fieldbyname('IV_MODO').AsInteger=1) then {DEVOLUCAO}
    grade.Canvas.Font.color:=clRed
  else
  if (qItens.fieldbyname('IV_MODO').AsInteger=2) then {TROCA}
    grade.Canvas.Font.color:=clBlue;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

end.
