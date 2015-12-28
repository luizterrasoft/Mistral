unit Conf_CheckCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, GridControl, GridSql, DB,
  DBTables,funcoesglobais, Buttons, CheckControle, ComboSql,funcoes1;

type
  TFrm_Conf_CheckCheck = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lblSerial: TLabel;
    lblSenha: TLabel;
    lblCodigo: TLabel;
    txtCodigo: TEdit;
    txtSenha: TEdit;
    txtSerial: TEdit;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    botao_sair: TPanel;
    btnAplicar: TButton;
    GridCons: TGridSql;
    Query1: TQuery;
    Query2: TQuery;
    Panel2: TPanel;
    BPracima: TSpeedButton;
    BPraBaixo: TSpeedButton;
    TabSheet3: TTabSheet;
    Retorno: TGridSql;
    Label1: TLabel;
    SenhaM: TEdit;
    Label2: TLabel;
    BloqCheckCheck: TComboSql;
    procedure botao_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridConsMontaGridDataSet(var DadosGrid: TDadosgrid;
      var DeletaLinha: Boolean);
    procedure btnAplicarClick(Sender: TObject);
    procedure GridConsMovLinha(Sender: TObject; Acol, ARow, OldCol,
      OldRow: Integer; FMouse: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridConsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridConsMovimentaCelula(Sender: TObject);
    procedure GridConsGetCellColor(Sender: TObject; ARow, Acol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure GridConsGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure BPracimaClick(Sender: TObject);
    procedure RetornoGetCellColor(Sender: TObject; ARow, Acol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Conf_CheckCheck: TFrm_Conf_CheckCheck;

implementation

uses principal, unDialogo,un_cons_checkcheck;
{$R *.dfm}

procedure TFrm_Conf_CheckCheck.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_Conf_CheckCheck.FormCreate(Sender: TObject);
var
fstringsc:TStringList;
fstringst:TStringList;
Fgrupo:String;
i2:integer;
procedure carregagrid(limpa:boolean=true);
var
i:integer;
begin

   for i:=0 to FStringsC.Count - 1 do begin
     if Retorno.Cells[1,1] <> '' Then
       Retorno.RowCount := Retorno.rowcount + 1;

     Query1.First;
     if Query1.Locate('Ck_Grupo;Ck_Campo',VarArrayOf([Fgrupo,FStringsC[i]]),[]) then begin
       Retorno.FieldValue['Ck_Trava',Retorno.rowcount - 1] := Query1.FieldByName('Ck_Trava').AsString;
       Retorno.FieldValue['Ck_Exibe',Retorno.rowcount - 1] := Query1.FieldByName('Ck_Exibe').AsString;
       Retorno.FieldValue['Ck_Alinhamento',Retorno.rowcount - 1] := Query1.FieldByName('Ck_Alinhamento').AsString;
       Retorno.FieldValue['Ck_Tam',Retorno.rowcount - 1] := Query1.FieldByName('Ck_Tam').AsString;
     end;

     Retorno.FieldValue['Ck_Campo',Retorno.rowcount - 1] := FStringsC[i];
     Retorno.FieldValue['Ck_Grupo',Retorno.rowcount - 1] := FGrupo;
     Retorno.Cells[1,Retorno.rowcount - 1] := RetornaNomeGrupoCheckCheck(FGrupo,FStringsC[i]);
     Retorno.Cells[0,Retorno.rowcount - 1] := RetornaNomeGrupoCheckCheck(FGrupo,'');
     if Retorno.Cells[0,Retorno.rowcount - 1] = '' then
      Retorno.Cells[0,Retorno.rowcount - 1] := FGrupo;
   end;

   if limpa then
    FstringsC.clear;
end;


begin
   TabSheet3.TabVisible := false;
   pagecontrol1.activepageindex := 0;
   with gridcons do begin
    movimentacelula := true;
    with setcombo(1,-1,-1)do begin
      Items.add('CheckCadastro');
      Items.add('CheckCheck');
      Items.add('CheckPlus');
      Items.add('CheckMaster');
      Items.add('CheckGold');
    end;
    with setcombo(5,-1,-1) do begin
      Items.Add('Sim');
      Items.Add('Não');
    end;
    CellSkip[0] := True;
   end;

   with query2 do begin
    sql.clear;
    sql.add('Select Ck_Pos,Ck_Consulta,Ck_Valor,Ck_FaixaIni,Ck_Faixafim,ck_senhat,Ck_cliente,Ck_Senha,Ck_Serial,ck_bloq,ck_senhat,ck_senhaM From CheckCheck');
    sql.add('Order By Ck_Pos');
    open;

    txtcodigo.text  :=  Query2.FieldByName('Ck_cliente').AsString;
    txtSenha.text   :=  Query2.FieldByName('Ck_Senha').AsString;
    txtSerial.text  :=  Query2.FieldByName('Ck_Serial').AsString;
    SenhaM.text     :=  Descriptografar(Query2.FieldByName('Ck_SenhaM').AsString);
    if eof then
      BloqCheckCheck.ItemIndex := BloqCheckCheck.Items.IndexOf('Sim')
    else
      BloqCheckCheck.ValorChave(Query2.FieldByName('Ck_Bloq').AsString);

    GridCons.Limite :=  -1;
    GridCons.MontaGridDataSet(Query2,0);
    for i2:=gridCOns.ColunaCampo('Ck_senhat') + 1 to GridCons.ColCount - 1 do
     gridCOns.ColWidths[i2] := -1;

   end;


   With Retorno do begin
     for i2:=0 to ColCount - 1 do begin
        if i2 < ColunaCampo('Ck_Exibe') then
          CellSkip[i2] := true
        else if i2 > ColunaCampo('Ck_Tam') then begin
          CellSkip[i2]  := true;
          ColWidths[i2] := -1;
        end;
        limite := ColunaCampo('Ck_Tam');
     end;
     MovimentaCelula := True;
     with setcombo(ColunaCampo('Ck_Exibe'),-1,-1)do begin
        Items.add('Sim');
        Items.add('Não');
     end;
     with setcombo(ColunaCampo('Ck_Trava'),-1,-1)do begin
        Items.add('Sim');
        Items.add('Não');
        Items.add('Senha');
     end;

     with setcombo(ColunaCampo('Ck_Alinhamento'),-1,-1)do begin
        Items.add('Esquerda');
        Items.add('Direita');
     end;
   end;

   qUERY1.Sql.Clear;
   query1.Sql.Add('Select * from CheckCheckRet');
   Query1.Open;



   FStringsC := TStringList.Create;
   try
       FGrupo := 'LOI';
       FstringsC.add('STATUS_LOGIN');
       FstringsC.add('COD_RESP');
       FstringsC.add('MENS');
       FstringsC.add('CNPJ');
       FstringsC.add('NOME');
       FstringsC.add('RAZAO');
       FstringsC.add('END');
       FstringsC.add('BAIRRO');
       FstringsC.add('CIDADE');
       FstringsC.add('UF');
       FstringsC.add('CEP');
       FstringsC.add('EMAIL');
       FstringsC.add('FONE');
       FstringsC.add('FRANQ');
       FstringsC.add('USO_CMC7');
       FstringsC.add('TIME_CONS');
       FstringsC.add('TIME_LOGIN');
       carregagrid;

       FGrupo := 'MSG';
       FstringsC.add('TIPO_MSG');
       FstringsC.add('MENSAGEM');
       carregagrid;

       FGrupo := 'FRN';
       FstringsC.add('frn_cod');
       FstringsC.add('FRN_RSO');
       FstringsC.add('FRN_TEL');
       FstringsC.add('FRN_FAX');
       FstringsC.add('FRN_');
       FstringsC.add('FRN_BAI');
       FstringsC.add('FRN_CID');
       FstringsC.add('FRN_UF');
       FstringsC.add('FRN_CEP');
       FstringsC.add('FRN_EMAIL');
       carregagrid;

       FGrupo := 'LAS';
       FstringsC.add('PCF_FAIXA');
       FstringsC.add('COD_SRV');
       FstringsC.add('SRV_DEF');
       FstringsC.add('VAL_MIN');
       FstringsC.add('VAL_MAX');
       carregagrid;

       FGrupo := 'ERR';
       FstringsC.add('NIV_ERRO');
       FstringsC.add('MSG_COD_ERR');
       carregagrid;

       FGrupo := 'NOM' ;
       FstringsC.add('NOME');
       carregagrid;

       FGrupo := 'CFM';
       FstringsC.add('NOME');
       FstringsC.add('DATANASC');
       FstringsC.add('SITREC');
       FstringsC.add('DATAAT');
       FstringsC.add('NOMEMAE');
       carregagrid;

       FGrupo := 'BCO';
       FstringsC.add('QUANT');
       FstringsC.add('NOME');
       FstringsC.add('DESCRICAO');
       carregagrid;

       FGrupo := 'AGE';
       FstringsC.add('QUANT');
       FstringsC.add('NOME');
       FstringsC.add('END');
       FstringsC.add('CIDADE');
       FstringsC.add('UF');
       FstringsC.add('DATAULTATUALIZACAO');
       FstringsC.add('DDD');
       FstringsC.add('FONE');
       FstringsC.add('DDDFAX');
       FstringsC.add('FAX');
       carregagrid;

       FGrupo := 'RCH';
       FstringsC.add('QUANT');
       FstringsC.add('SIT');
       FstringsC.add('DATAABERTENCERR');
       FstringsC.add('TIPOPESSOA');
       FstringsC.add('CPFCNPJ');
       FstringsC.add('NOME');
       FstringsC.add('TIPODOC');
       FstringsC.add('DOC');
       FstringsC.add('EMISSOR');
       FstringsC.add('UF');
       FstringsC.add('DATAEMISSAO');
       carregagrid;

        FGrupo := 'CFV';
        FstringsC.add('QUANT');
        FstringsC.add('DATAREC');
        FstringsC.add('CODCOMP');
        FstringsC.add('NOME');
        FstringsC.add('NUMOC');
        FstringsC.add('ORIGEM');
        FstringsC.add('SIGLA');
        FstringsC.add('NUMLOJA');
        carregagrid;

        FGrupo := 'PVJ';
        FstringsC.add('QUANT');
        FstringsC.add('DATAREC');
        FstringsC.add('CODCOMP');
        FstringsC.add('NOME');
        FstringsC.add('NUMOC');
        FstringsC.add('ORIGEM');
        FstringsC.add('SIGLA');
        FstringsC.add('NUMLOJA');
        carregagrid;

        FGrupo := 'CCF';
        FstringsC.add('QUANT');
        FstringsC.add('DATA_ANT');
        FstringsC.add('DATA_REC');
        FstringsC.add('COD_BNC');
        FstringsC.add('NOM_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('NOM_AGE');
        FstringsC.add('DATA_INC_REC');
        FstringsC.add('DATA_PROC_PRI_INC');
        FstringsC.add('TIP_PES_ASSOC');
        FstringsC.add('ALN_BNC');
        carregagrid;

        FGrupo := 'RCO';
        FstringsC.add('QUANT');
        FstringsC.add('EMP_NOM');
        FstringsC.add('EMP_TEL');
        FstringsC.add('DAT_DEB');
        FstringsC.add('DAT_INC');
        FstringsC.add('COD_MOT_INC');
        FstringsC.add('COD_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('NUM_CHQ');
        FstringsC.add('ALN');
        FstringsC.add('NUM_PARC');
        FstringsC.add('TOT_PARC');
        FstringsC.add('NUM_MEM');
        FstringsC.add('NUM_DUP');
        FstringsC.add('EMP_UF');
        FstringsC.add('MOT_INC_CLI');
        FstringsC.add('EMP_RAZ');
        FstringsC.add('CNPJ');
        FstringsC.add('TIP_PES');
        FstringsC.add('OCR_VAL');
        carregagrid;

        FGrupo := 'TLB';
        FstringsC.add('QUANT');
        FstringsC.add('COD_BNC');
        FstringsC.add('NOM_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('NOM_AGE');
        FstringsC.add('CNT_COR');
        FstringsC.add('CHQ_INI');
        FstringsC.add('CHQ_FIM');
        FstringsC.add('MOTIV');
        FstringsC.add('DAT_REG');
        FstringsC.add('HORA');
        carregagrid;

        FGrupo := 'TBC';
        carregagrid;
        
        FGrupo := 'PLU';
        FstringsC.add('QUANT');
        FstringsC.add('COD_BNC');
        FstringsC.add('NOM_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('NOM_AGE');
        FstringsC.add('CNT_COR');
        FstringsC.add('CHQ_INI');
        FstringsC.add('CHQ_FIM');
        FstringsC.add('DATA_CCO');
        FstringsC.add('TIP_CCO');
        FstringsC.add('HORA');
        FstringsC.add('FONTE');
        carregagrid;
        
        FGrupo := 'CTM';
        FstringsC.add('QUANT');
        FstringsC.add('COD_BNC');
        FstringsC.add('NOM_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('NOM_AGE');
        FstringsC.add('CNT_COR');
        FstringsC.add('CHQ_INI');
        FstringsC.add('CHQ_FIM');
        FstringsC.add('TIP_CCO');
        FstringsC.add('DATA_CCO');
        FstringsC.add('FONTE');
        carregagrid;

        FGrupo := 'SEM';
        FstringsC.add('QUANT');
        FstringsC.add('COD_BNC');
        FstringsC.add('NOM_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('NOM_AGE');
        FstringsC.add('CNT_COR');
        FstringsC.add('CHQ_INI');
        FstringsC.add('CHQ_FIM');
        FstringsC.add('TIP_CCO');
        FstringsC.add('DATA_CCO');
        FstringsC.add('Fonte');
        FstringsC.add('Hora');
        Fstringsc.add('DOC_ORI');
        carregagrid;

        FGrupo := 'PFN';
        FstringsC.add('QUANT');
        FstringsC.add('DAT_ANT');
        FstringsC.add('DAT_REC');
        FstringsC.add('PFN_DATA');
        FstringsC.add('PFN_MOD');
        FstringsC.add('AVAL');
        FstringsC.add('TIPO_MOEDA');
        FstringsC.add('PFN_VAL');
        FstringsC.add('CONTR');
        FstringsC.add('PFN_ORI');
        FstringsC.add('SIGLA');
        carregagrid;

        FGrupo := 'RFN';
        FstringsC.add('QUANT');
        FstringsC.add('DAT_ANT');
        FstringsC.add('DAT_REC');
        FstringsC.add('RFN_DATA');
        FstringsC.add('RFN_NAT');
        FstringsC.add('COD_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('RFN_VAL');
        FstringsC.add('UF');
        FstringsC.add('NOM_BNC');
        FstringsC.add('CID');
        FstringsC.add('AVAL');
        carregagrid;

        FGrupo := 'CHI';
        FstringsC.add('QUANT');
        FstringsC.add('COD_BNC');
        FstringsC.add('NOM_BNC');
        FstringsC.add('COD_AGE');
        FstringsC.add('NOM_AGE');
        FstringsC.add('CNT_COR');
        FstringsC.add('NUM_CHQ');
        FstringsC.add('ALN');
        FstringsC.add('CHQ_VAL');
        FstringsC.add('CID');
        FstringsC.add('UF');
        carregagrid;

        FGrupo := 'INS';
        FstringsC.add('QUANT');
        FstringsC.add('DAT_ANT');
        FstringsC.add('DAT_REC');
        FstringsC.add('INS_DATA');
        FstringsC.add('INS_QLF');
        FstringsC.add('INS_VAR');
        FstringsC.add('NOM_PES');
        carregagrid;



        FGrupo := 'PRT';
        FstringsC.add('QUANT');
        FstringsC.add('DAT_ANT');
        FstringsC.add('DAT_REC');
        FstringsC.add('PRT_DATA');
        FstringsC.add('COD_CART');
        FstringsC.add('PRT_NAT');
        FstringsC.add('PRT_VAL');
        FstringsC.add('CID');
        FstringsC.add('UF');
        carregagrid;

        FGrupo := 'ACO';
        FstringsC.add('QUANT');
        FstringsC.add('DAT_ANT');
        FstringsC.add('DAT_REC');
        FstringsC.add('ACO_DAT');
        FstringsC.add('COD_VAR');
        FstringsC.add('COD_DIST');
        FstringsC.add('ACO_NATU');
        FstringsC.add('ACO_VAL');
        FstringsC.add('CID');
        FstringsC.add('UF');
        FstringsC.add('PRI_COO');
        carregagrid;

        FGrupo := 'FAL';
        FstringsC.add('QUANT');
        FstringsC.add('DAT_ANT');
        FstringsC.add('DAT_REC');
        FstringsC.add('FAL_DAT');
        FstringsC.add('FAL_VAR');
        FstringsC.add('FAL_NATU');
        FstringsC.add('CID');
        FstringsC.add('UF');
        carregagrid;

        FGrupo := 'TEL';
        FstringsC.add('QUANT');
        FstringsC.add('INFO');
        FstringsC.add('NOME');
        FstringsC.add('TIP_PES');
        FstringsC.add('CPF_CNPJ');
        FstringsC.add('END');
        FstringsC.add('BAI');
        FstringsC.add('CID');
        FstringsC.add('UF');
        FstringsC.add('CEP');
        FstringsC.add('DDD');
        FstringsC.add('FONE');
        carregagrid;

        FGrupo := 'VCL';
        FstringsC.add('QUANT');
        FstringsC.add('RENAVAM');
        FstringsC.add('PLACA');
        FstringsC.add('UF');
        FstringsC.add('CHASSI');
        FstringsC.add('CIDADE');
        FstringsC.add('TIP_MONT');
        FstringsC.add('TIP_VEIC');
        FstringsC.add('MARCA');
        FstringsC.add('ESPECIE');
        FstringsC.add('SITUACAO');
        FstringsC.add('COR');
        FstringsC.add('ANO');
        FstringsC.add('COMBUSTIVEL');
        FstringsC.add('PROCED');
        FstringsC.add('TIP_DOC_PROP');
        FstringsC.add('DOC_PROP');
        FstringsC.add('NOME_PROP');
        FstringsC.add('DATA_ULT_ATUA');
        FstringsC.add('CILIND');
        FstringsC.add('POTENCIA');
        FstringsC.add('MOTOR');
        FstringsC.add('QTD_EIXOS');
        FstringsC.add('REST1');
        FstringsC.add('REST2');
        FstringsC.add('REST3');
        FstringsC.add('REST4');
        FstringsC.add('MAX_PASS');
        FstringsC.add('PESO_BRUTO');
        FstringsC.add('ANO_FAB');
        FstringsC.add('TIP_CHASSI');
        FstringsC.add('REST5');
        FstringsC.add('REST6');
        FstringsC.add('REST7');
        carregagrid;

        FGrupo := 'RST';
        FstringsC.add('QUANT');
        FstringsC.add('DATA');
        FstringsC.add('RAZAO');
        FstringsC.add('TIP_PES');
        FstringsC.add('CPF_CNPJ');
        FstringsC.add('CIDADE');
        FstringsC.add('UF');
        FstringsC.add('FONE');
        FstringsC.add('NOME');
        carregagrid;

        FGrupo := 'DHC';
        FstringsC.add('DAT_HOR');
        carregagrid;

        FGrupo := 'CRE';
        FstringsC.add('COD_RESP');
        carregagrid;
    finally
        FStringsC.Destroy;
    end;





end;

procedure TFrm_Conf_CheckCheck.GridConsMontaGridDataSet(
  var DadosGrid: TDadosgrid; var DeletaLinha: Boolean);
begin
  if (uppercase(dadosgrid.field) = 'CK_POS') Then begin
     DadosGrid.SemMascara := false;
     DadosGrid.Mascara    := '000';
  end else if (uppercase(dadosgrid.field) <> 'CK_VALOR') and (uppercase(dadosgrid.field) <> 'CK_FAIXAINI') and (uppercase(dadosgrid.field) <> 'CK_FAIXAFIM') Then
     DadosGrid.SemMascara := true
  else
     DadosGrid.SemMascara := false;
end;

procedure TFrm_Conf_CheckCheck.btnAplicarClick(Sender: TObject);
var i,i2:integer;
begin
     if (frmDialogo.ExibirMensagem ('Confirma Dados?'
        ,'CheckCheck',[mbYes,mbNo],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200)<>mrYes)
        or not verificacampos(Self)  then
         exit;

     if gridcons.cells[1,1] = '' Then begin
        frmDialogo.ExibirMensagem (' Informe Alguma Consulta '
        ,'CheckCheck',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        exit;
     end;

     if not frm_principal.Servidor_Credito.InTransaction Then
      frm_principal.Servidor_Credito.StartTransaction;

     try
       query1.sql.clear;
       query1.sql.add('Delete from CheckCheck');
       query1.ExecSql;

       query1.sql.clear;
       query1.sql.add('Insert Into CheckCheck (Ck_Pos,Ck_Consulta,Ck_Valor,Ck_FaixaIni,Ck_Faixafim,ck_senhat,Ck_cliente,Ck_Senha,Ck_Serial,ck_bloq,ck_senhaM)');
       query1.sql.add('Values (:Ck_Pos,:Ck_Consulta,:Ck_Valor,:Ck_FaixaIni,:Ck_Faixafim,:ck_senhat,:Ck_cliente,:Ck_Senha,:Ck_Serial,:ck_bloq,:ck_senhaM)');
       Query1.ParamByName('Ck_cliente').AsString := txtcodigo.text;
       Query1.ParamByName('Ck_Senha').AsString   := txtSenha.text;
       Query1.ParamByName('Ck_Serial').AsString  := txtSerial.text;
       Query1.ParamByName('Ck_SenhaM').AsString  := criptografar(SenhaM.text);
       Query1.ParamByName('Ck_Bloq').AsString    := BloqCheckCheck.ValorRetorno;
//       Query1.ParamByName('Ck_SenhaM').AsString  := SenhaM.text;


       for i:=1 to GridCons.RowCount - 1 do
         if gridCons.fieldvalue['Ck_Consulta',I] <> '' then begin
//            Query1.ParamByName('Ck_SenhaM').AsString := SenhaM.text;
            for i2:=0 to gridCons.ColunaCampo('Ck_senhat') do
             if tipodatatype(query2.fieldbyname(gridCons.campos[i2]).datatype) in [dtnumero,dtinteiro] then
              Query1.ParamByName(gridCons.campos[i2]).AsFloat := StrtoFloatN(gridCons.Cells[i2,I])
             else
              Query1.ParamByName(gridCons.campos[i2]).AsString := gridCons.Cells[i2,I];
            query1.execsql;
         end;

       query1.sql.clear;
       query1.sql.add('Delete from CheckCheckRet');
       query1.ExecSql;

       query1.sql.clear;
       query1.sql.add('Insert Into CheckCheckRet (Ck_Grupo,Ck_Campo,Ck_Trava,Ck_Exibe,ck_tam,ck_alinhamento,ck_pos)');
       query1.sql.add('Values (:Ck_Grupo,:Ck_Campo,:Ck_Trava,:Ck_Exibe,:ck_tam,:ck_alinhamento,:ck_pos)');
       for i:=1 to Retorno.RowCount - 1 do begin
         Query1.ParamByName('Ck_Pos').AsInteger := I;
         Retorno.FieldValue['Ck_Trava',I] := 'Sim';
         Retorno.FieldValue['Ck_Exibe',I] := 'Sim';
         Retorno.FieldValue['Ck_Alinhamento',I] := 'Esquerda';
         if (Retorno.fieldvalue['Ck_Trava',I] <> '') or
            (Retorno.fieldvalue['Ck_Exibe',I] <> '') then begin
              for i2:=Retorno.ColunaCampo('Ck_Exibe') to Retorno.ColunaCampo('Ck_Campo') do
                if UpperCase(Retorno.campos[i2]) = 'CK_TAM' then begin
                   Query1.ParamByName(Retorno.campos[i2]).AsInteger := 50;
                   //StrtoIntN(Retorno.Cells[i2,I])
                end else begin
//                   if (UpperCase(Retorno.Campos[i2]) = 'CK_GRUPO') or
//                      (UpperCase(Retorno.Campos[i2]) = 'CK_CAMPO') then
                         Query1.ParamByName(Retorno.campos[i2]).AsString := Retorno.Cells[i2,I];
                end;
              query1.execsql;
         end;
       end;

       if frm_principal.Servidor_Credito.InTransaction Then
         frm_principal.Servidor_Credito.Commit;

       close;
     except
       if frm_principal.Servidor_Credito.InTransaction Then
         frm_principal.Servidor_Credito.RollBack;
       raise;
     end;
end;

procedure TFrm_Conf_CheckCheck.GridConsMovLinha(Sender: TObject; Acol,
  ARow, OldCol, OldRow: Integer; FMouse: Boolean);
var
i:integer;
begin
   for i:=1 to GridCons.rowcount - 1 do
    GridCons.Cells[0,I] := formatfloat('000',I);
end;

procedure TFrm_Conf_CheckCheck.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
i:integer;
begin
  if key = vk_f5 then
   btnAplicar.OnClick(Sender);
  if key = vk_escape then
   close;
end;

procedure TFrm_Conf_CheckCheck.txtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_up then
    Self.perform(Wm_NextDlgCtl,-1,0)
   else if key = vk_return then
     if sender = senham then begin
       habilitatabsheets(GridCons);
       GridCons.SetFocus;
     end else
      Self.perform(Wm_NextDlgCtl,0,0);

end;

procedure TFrm_Conf_CheckCheck.GridConsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
i:integer;
begin
  If (Key = VK_DELETE) And (Shift = [ssCtrl]) then
   for i:=1 to GridCons.rowcount - 1 do
    GridCons.Cells[0,I] := formatfloat('000',I);
end;

procedure TFrm_Conf_CheckCheck.GridConsMovimentaCelula(Sender: TObject);
begin
  gridcons.cells[0,GridCons.row] := formatfloat('000',GridCons.Row);
end;

procedure TFrm_Conf_CheckCheck.GridConsGetCellColor(Sender: TObject; ARow,
  Acol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if arow = 0 then
   Afont.Style := [fsBold]
  else if acol = 0 then begin
    Afont.Color := ClWindow;
    ABrush.Color := ClNavy;
  end
end;

procedure TFrm_Conf_CheckCheck.GridConsGetCellAlignment(Sender: TObject;
  ARow, ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
  if Acol > 1 then
    HorAlignment := taRightJustify;
end;

procedure TFrm_Conf_CheckCheck.BPracimaClick(Sender: TObject);
begin
  if ((sender = BPraCima) and (GridCons.Row = 1)) or ((sender = BPraBaixo) and (GridCons.Row = GridCons.RowCount - 1)) Then
   exit;

 GridCons.MovLinha(GridCons.Row,GridCons.Row + iifs(sender = BPraBaixo,1,-1));
 GridCons.Row := GridCons.Row + iifs(sender = BPraBaixo,1,-1);
end;

procedure TFrm_Conf_CheckCheck.RetornoGetCellColor(Sender: TObject; ARow,
  Acol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if arow = 0 then
   Afont.Style := [fsBold];
end;

end.


