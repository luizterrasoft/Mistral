unit un_CaixaLancamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, MaskEditOO, LabelOO,
  BotaoSair, PanelOO,tipodef,db,dbtables,funcoesglobais, Buttons;

type
  Tfrm_CaixaLancamentos = class(Tfrm_Auxformulario1)
    LabelOO1: TLabelOO;
    edtValor: TMaskEditOO;
    Bevel1: TBevel;
    BotaoSair1: TBotaoSair;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    LabelOO2: TLabelOO;
    edtNatu: TMaskEditOO;
    LabelOO3: TLabelOO;
    edtConta: TMaskEditOO;
    pnCodigo: TPanelOO;
    LabelOO4: TLabelOO;
    edtTipoValor: TMaskEditOO;
    pnTipoValor: TPanelOO;
    Bevel2: TBevel;
    Label14: TLabel;
    lblF8mens: TLabel;
    lblF8: TLabel;
    Label15: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    btnConfere: TPanel;
    LabelOO5: TLabelOO;
    edtDesc: TMaskEditOO;
    lbtipz: TLabel;
    lbltitulo: TLabel;
    lbltitulo_sombra: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    procedure BotaoSair1Click(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure edtContaDblClick(Sender: TObject);
    procedure edtTipoValorDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNatuChange(Sender: TObject);
    procedure edtmaskeditformulario1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmaskeditformulario1Enter(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipz: String;
    altera:Real;
    function BuscaProximoSequencialLancamento:Real;
  end;

var
  frm_CaixaLancamentos: Tfrm_CaixaLancamentos;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,auxiliar, unDialogo,
  un_AjudaComandos, DM16, caixa, un_CaixaLancamentos_Consulta;

procedure Tfrm_CaixaLancamentos.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_CaixaLancamentos.btnConfereClick(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_CaixaLancamentos.edtContaDblClick(Sender: TObject);
begin
  if (trim(edtNatu.text)<>'') then
    ChamandoF8Contas(edtConta,trim(edtNatu.text));
end;

procedure Tfrm_CaixaLancamentos.edtTipoValorDblClick(Sender: TObject);
begin
  ChamandoF8TipoValor(edtTipoValor);
end;


procedure Tfrm_CaixaLancamentos.N1Click(Sender: TObject);
var
  clAux,clLanca: TClassAuxiliar;
  sequencial: Real;
  seq_diverso: Real;
begin
  if (edtValor.GetValor=0.00) then
    ExibeCritica('Informe um valor para lançamento no caixa!','Lançamentos Diversos',edtValor)
  else
  if (edtNatu.GetValor='') then
    ExibeCritica('Informe a natureza do lançamento no caixa!','Lançamentos Diversos',edtNatu)
  else
  if (edtConta.GetValor=0) then
    ExibeCritica('Informe a conta credora/devedora!','Lançamentos Diversos',edtConta)
  else
  if (edtTipoValor.GetValor=0) then
    ExibeCritica('Informe o tipo de valor!','Lançamentos Diversos',edtTipoValor)
  else
  if (edtDesc.GetValor='') then
    ExibeCritica('Informe uma descrição para o lançamento!','Lançamentos Diversos',edtDesc)
  else
  if (frmDialogo.ExibirMensagem ('Confirma lançamento?'
    ,'Lançamentos Diversos',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    if altera > 0 then
    begin
      sequencial := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_SEQ').AsFloat;

      clAux.ClearSql;
      clAux.AddParam ('UPDATE LANCAMENTOS_CAIXA SET                                                                            ');
      clAux.AddParam ('LC_VALO =:LC_VALO,LC_NATU =:LC_NATU,LC_CONT =:LC_CONT,LC_DESC =:LC_DESC,LC_TIPO =:LC_TIPO,LC_TIPZ =:LC_TIPZ');
      clAux.AddParam ('WHERE (LC_LOJA=:LC_loja) AND (LC_CAIX=:LC_CAIX) AND (LC_FUNC=:LC_FUNC) AND (LC_DATA=:LC_data) AND LC_SEQ =:LC_SEQ');
      clAux.consulta.parambyname('LC_loja').AsFloat     := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_LOJA').AsFloat;
      clAux.consulta.parambyname('LC_CAIX').AsFloat     := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_CAIX').AsFloat;
      clAux.consulta.parambyname('LC_FUNC').AsFloat     := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_FUNC').AsFloat;
      clAux.consulta.parambyname('LC_data').AsDateTime  := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_DATA').AsDateTime;
      clAux.consulta.parambyname('LC_Seq').AsFloat      := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_SEQ').AsFloat;
    end
    else
    begin
      sequencial := BuscaProximoSequencialLancamento; {*}
                {...}
      clAux.ClearSql;
      clAux.AddParam ('INSERT INTO LANCAMENTOS_CAIXA                                                                            ');
      clAux.AddParam (' (LC_LOJA,LC_CAIX,LC_DATA,LC_FUNC,LC_SEQ,LC_VALO,LC_NATU,LC_CONT,LC_DESC,LC_TIPO,LC_TIPZ)                ');
      clAux.AddParam ('VALUES                                                                                                   ');
      clAux.AddParam (' (:LC_LOJA,:LC_CAIX,:LC_DATA,:LC_FUNC,:LC_SEQ,:LC_VALO,:LC_NATU,:LC_CONT,:LC_DESC,:LC_TIPO,:LC_TIPZ)     ');
      clAux.consulta.parambyname('LC_LOJA').AsFloat    := frm_principal.x_loja;
      clAux.consulta.parambyname('LC_CAIX').AsFloat    := frm_principal.x_terminal;
      clAux.consulta.parambyname('LC_DATA').AsDateTime := frm_principal.x_data_trabalho;
      clAux.consulta.parambyname('LC_FUNC').AsFloat    := frm_principal.x_caixa_ativo;
      clAux.consulta.parambyname('LC_SEQ').AsFloat     := sequencial;
    end;
    clAux.consulta.parambyname('LC_VALO').AsFloat    := edtValor.GetValor;
    clAux.consulta.parambyname('LC_NATU').AsString   := edtNatu.GetValor;
    clAux.consulta.parambyname('LC_CONT').AsFloat    := edtConta.GetValor;
    clAux.consulta.parambyname('LC_DESC').AsString   := edtDesc.GetValor;
    clAux.consulta.parambyname('LC_TIPO').AsFloat    := edtTipoValor.GetValor;
    clAux.consulta.parambyname('LC_TIPZ').AsString   := tipz;
    clAux.Execute; {*}

    if altera > 0 then
      Frm_caixaLancamentos_Consulta.deletacontasapagar(false);

    if (databasecontas='CONTASPAGAR') then //contas a pagar ONLINE
    begin
                   // GERANDO LANCAMENTOS EM 'LANCAMENTOS DIVERSOS' DO CONTAS A PAGAR
                   //................................
      seq_diverso := Round(MaxiCod_contaspagar ('LANCAMENTOS',frm_principal.barraDicas));

      clLanca := TClassAuxiliar.Create;
      clLanca.conect   ('CONTASPAGAR',self);
      clLanca.ClearSql;
      clLanca.AddParam ('INSERT INTO LANCAMENTOS                                                                                 ');
      clLanca.AddParam (' (LA_SEQ,LA_CUST,LA_CONT,LA_DATA,LA_VALO,LA_NATU,LA_TIPZ,LA_DESC,LA_TIME,LA_SEQP,LA_TIPO)               ');
      clLanca.AddParam ('VALUES                                                                                                  ');
      clLanca.AddParam (' (:LA_SEQ,:LA_CUST,:LA_CONT,:LA_DATA,:LA_VALO,:LA_NATU,:LA_TIPZ,:LA_DESC,:LA_TIME,:LA_SEQP,:LA_TIPO)    ');
      if altera > 0 then
      begin
        ClLanca.consulta.parambyname('LA_Cust').AsFloat     := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_LOJA').AsFloat;
        ClLanca.consulta.parambyname('LA_Tipo').AsString    := 'CX'+
          form_nz(Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_CAIX').AsFloat,2)+
          form_nz(Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_FUNC').AsFloat,6);
        ClLanca.consulta.parambyname('LA_data').AsDateTime  := Frm_caixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_DATA').AsDateTime;
      end
      else
      begin
        clLanca.consulta.parambyname('LA_CUST').AsFloat    := frm_principal.x_loja;
        clLanca.consulta.parambyname('LA_TIPO').AsString   := 'CX'+form_nz(frm_principal.x_terminal,2)+form_nz(frm_principal.x_caixa_ativo,6); //INDENTIFICA O 'TERMINAL' E O 'OPERADOR DE CAIXA'
        clLanca.consulta.parambyname('LA_DATA').AsDateTime := frm_principal.x_data_trabalho;
      end;
      clLanca.consulta.parambyname('LA_SEQ').AsFloat     := seq_diverso;
      clLanca.consulta.parambyname('LA_CONT').AsFloat    := edtConta.GetValor;
      clLanca.consulta.parambyname('LA_VALO').AsFloat    := edtValor.GetValor;
      clLanca.consulta.parambyname('LA_NATU').AsString   := edtNatu.GetValor;
      clLanca.consulta.parambyname('LA_TIPZ').AsString   := tipz;
      clLanca.consulta.parambyname('LA_DESC').AsString   := edtDesc.GetValor;
      clLanca.consulta.parambyname('LA_SEQP').AsFloat    := sequencial;
      clLanca.consulta.parambyname('LA_TIME').AsDatetime := frm_principal.x_data_trabalho;
      clLanca.Execute;
      clLanca.desconect;
      clLanca.Free;


                   //**** - Gerando registro em CONTA-CAIXA caso esteja configurado para tal
                   //**********************************************************************************
      if (frm_principal.x_online) then //se ESTOQUE estiver ONLINE
        if altera > 0 then
        begin
          GeraLancamentos_Diverso (frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_LOJA').AsFloat,
            edtTipoValor.GetValor,
            edtConta.GetValor,
            IIFS(edtNatu.GetValor = 'D',-1,1) * edtValor.GetValor,
            frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_DATA').AsDateTime,
            edtDesc.GetValor,
            'CX'+
            form_nz(frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_CAIX').AsFloat,2)+
            form_nz(frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_FUNC').AsFloat,6),
            tipz,
            seq_diverso);

          RecalcularSaldosConta     (edtConta.GetValor,frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_LOJA').AsFloat,frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_DATA').AsDateTime);
          RecalcularSaldosContaTipz (edtConta.GetValor,frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_LOJA').AsFloat,Tipz,frm_CaixaLancamentos_Consulta.QLancamentos.fieldbyname('LC_DATA').AsDateTime);
        end
        else
          GeraLancamentos_Diverso (frm_principal.x_loja,
            edtTipoValor.GetValor,
            edtConta.GetValor,
            IIFS(edtNatu.GetValor = 'D',-1,1) * edtValor.GetValor,
            frm_principal.x_data_trabalho,
            edtDesc.GetValor,
            'CX'+form_nz(frm_principal.x_terminal,2)+form_nz(frm_principal.x_caixa_ativo,6),
            tipz,
            seq_diverso);



                   //**********************************************************************************
    end;

    Limparformulrio1.click;
    edtValor.setfocus;
    clAux.desconect;
    clAux.Free;
    if altera > 0 then
      close;
  end;
end;

//O CONTROLE DE SEQUENCIAL É A NIVEL DE: LOJA / TERMINAL / CODIGO OP. CAIXA / DATA DO LANCAMENTO
function Tfrm_CaixaLancamentos.BuscaProximoSequencialLancamento:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecontas,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(LC_SEQ) as MAXIMO_SEQ FROM LANCAMENTOS_CAIXA                                 ');
  clAux.AddParam ('WHERE (LC_LOJA=:loja) AND (LC_CAIX=:terminal) AND (LC_FUNC=:caixa) AND (LC_DATA=:data)  ');
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('caixa').AsFloat    := frm_principal.x_caixa_ativo;
  clAux.Execute;
  result := clAux.result('MAXIMO_SEQ')+1;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_CaixaLancamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key=K_F1) then
  begin
    ListaAtalhosF1.clear;
    ListaAtalhosF1.Add('  [F1]     - Ajuda ');
    ListaAtalhosF1.Add('  [CTRL+L] - Limpar formulário ');
    ListaAtalhosF1.Add('  [F5]     - Salvar');
    ListaAtalhosF1.Add('  [ESC]    - Sair');
    Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
    frm_AjudaComandos.showmodal;
    frm_AjudaComandos.Free;
  end;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lbtipz.visible:=true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='1';
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
end;

procedure Tfrm_CaixaLancamentos.edtNatuChange(Sender: TObject);
begin
  if (trim(edtNatu.text)<>'C') and
    (trim(edtNatu.text)<>'D') and
    (trim(edtNatu.text)<>'') then
  begin
    edtNatu.text:='';
    edtNatu.setfocus;
  end;
end;

procedure Tfrm_CaixaLancamentos.edtmaskeditformulario1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (TMaskEdit(Sender).name='edtConta') and (key=K_F8) then
  begin
    if (trim(edtNatu.text)<>'') then
      ChamandoF8Contas(edtConta,trim(edtNatu.text));
  end
  else
  if (TMaskEdit(Sender).name='edtTipoValor') and (key=K_F8) then
    ChamandoF8TipoValor(edtTipoValor)
  else
    inherited;
end;

procedure Tfrm_CaixaLancamentos.edtmaskeditformulario1Exit(Sender: TObject);
var
  codigo: String;
begin
  if (TMaskEdit(Sender).name='edtConta') then
    pnCodigo.caption := ProcuraNomeConta(edtConta.GetValor,self)
  else
  if (TMaskEdit(Sender).name='edtTipoValor') then
    pnTipoValor.caption := ProcuraNomeTipoValor(edtTipoValor.GetValor)
  else
    inherited;
  lblF8.visible     := false;
  lblF8mens.visible := false;
end;

procedure Tfrm_CaixaLancamentos.edtDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FQuery:TQuery;
begin
  if key = vk_f8 then
  begin
    FQuery := TQuery.Create(Application);
    FQuery.DataBaseName := databasecontas;
    try
      FQuery.Sql.Add('Select Distinct Upper(LC_DESC) as LC_DESC  from Lancamentos_Caixa Where LC_Desc > '''' ');
      FQuery.Sql.Add('Order By 1');
      FQuery.Open;
      FQuery.FieldByName('LC_DESC').DisplayLabel := 'Descrições';
      if FGridCons(FQuery,'Descrições já lançadas',false,-1,true) then
        edtdesc.text := FQuery.FieldByName('LC_DESC').AsString;
    finally
      FQuery.Destroy;
    end;
  end;
     
  if (key=K_ENTER) then
    btnConfereClick(Sender);
  if (key=K_CIMA) then
    edtTipoValor.setfocus;
end;

procedure Tfrm_CaixaLancamentos.edtmaskeditformulario1Enter(
  Sender: TObject);
begin
  if (TMaskEdit(Sender).name='edtConta') then
  begin
    lblF8.visible     := true;
    lblF8mens.visible := true;
    lblF8mens.caption := 'exibe contas cadastradas';
  end
  else
  if (TMaskEdit(Sender).name='edtTipoValor') then
  begin
    lblF8.visible     := true;
    lblF8mens.visible := true;
    lblF8mens.caption := 'exibe tipo de valor cadastrado';
  end
  else
  if (TMaskEdit(Sender) = edtDesc) then
  begin
    lblF8.visible     := true;
    lblF8mens.visible := true;
    lblF8mens.caption := 'exibe descrições já lançadas';
  end
  else
    inherited;
end;

procedure Tfrm_CaixaLancamentos.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
  btnConfere.caption := 'Salvar lançamento - [F5]';
  BotaoSair1.caption := 'SAIR';
end;

procedure Tfrm_CaixaLancamentos.FormCreate(Sender: TObject);
begin
  inherited;
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
  edtDesc.charcase:=ecNormal;
  Image2.picture := frm_principal.Image1.picture;
  altera := 0;
end;

procedure Tfrm_CaixaLancamentos.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  inherited;
  edtDesc.charcase:=ecNormal;

     {***** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_CaixaLancamentos.BitBtn1Click(Sender: TObject);
var
  clAux,clAux1: TClassAuxiliar;
  sequencial: Real;
  seq_diverso: Real;
begin
  sequencial := BuscaProximoSequencialLancamento; {*}

  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CONTASPAGAR',self);
  clAux1 := TClassAuxiliar.Create;
  clAux1.conect   ('CONTASPAGAR',self);

  clAux.ClearSql;
  clAux.AddParam ('Select LC_CONT,LC_SEQ,LC_DATA,LC_VALO,LC_NATU,LC_LOJA,LC_TIPZ,LC_DESC,LC_TIPO ');
  clAux.AddParam ('From LANCAMENTOS_CAIXA                                                        ');
  clAux.AddParam ('Where LC_SEQ=:LC_SEQ AND LC_DATA=:LC_DATA                                     ');
  clAux.consulta.ParamByName('LC_SEQ').AsFloat := 1;
  clAux.consulta.ParamByName('LC_DATA').AsDateTime := StrToDateTime('16/02/2009');
  clAux.Execute;
    


{    clLanca.ClearSql;
    clLanca.AddParam ('INSERT INTO LANCAMENTOS                                                                                 ');
    clLanca.AddParam (' (LA_SEQ,LA_CUST,LA_CONT,LA_DATA,LA_VALO,LA_NATU,LA_TIPZ,LA_DESC,LA_TIME,LA_SEQP,LA_TIPO)               ');
    clLanca.AddParam ('VALUES                                                                                                  ');
    clLanca.AddParam (' (:LA_SEQ,:LA_CUST,:LA_CONT,:LA_DATA,:LA_VALO,:LA_NATU,:LA_TIPZ,:LA_DESC,:LA_TIME,:LA_SEQP,:LA_TIPO)    '); }

end;

end.
