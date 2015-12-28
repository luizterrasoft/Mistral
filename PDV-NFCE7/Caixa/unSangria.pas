unit unSangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, un_AuxFormularioVendas, StdCtrls, ExtCtrls, Mask, MaskEditOO,
  LabelOO, BotaoSair, Menus, EditControle,Funcoesglobais,db,dbtables,
  PanelControle, Pesquisa,caixa,cupomfiscal;

type
  TfrmSangria = class(Tfrm_AuxFormularioVendas)
    rdOpcao: TRadioGroup;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Salvar1: TMenuItem;
    Panel1: TPanel;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    edtMotivo: TMaskEditOO;
    edtValor: TMaskEditOO;
    Label1: TLabel;
    lbtipz: TLabel;
    Panel3: TPanel;
    LabelOO3: TLabelOO;
    Banco: TEditControle;
    Agencia: TEditControle;
    LabelOO4: TLabelOO;
    LabelOO5: TLabelOO;
    Numero: TEditControle;
    LabelOO6: TLabelOO;
    Conta: TEditControle;
    Label2: TLabel;
    Query1: TQuery;
    Query2: TQuery;
    Pesquisa1: TPesquisa;
    Label3: TLabel;
    Query1Terminal: TFloatField;
    Query1CPF: TStringField;
    Query1Banco: TIntegerField;
    Query1Age: TStringField;
    Query1Conta: TStringField;
    Query1Numero: TFloatField;
    Query1Valor: TFloatField;
    btnSalvar: TPanel;
    BotaoSair1: TBotaoSair;
    procedure edtValorEnter(Sender: TObject);
    procedure edtMotivoEnter(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMotivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BotaoSair1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Salvar1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtMotivoDblClick(Sender: TObject);
    procedure rdOpcaoClick(Sender: TObject);
    procedure NumeroExit(Sender: TObject);
    procedure Label2DblClick(Sender: TObject);
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    fsql:string;
    flistacheque:boolean;
    ftotalcheque:double;
    TotCheque,totcheque2:Double;
    FJaPerguntou:integer;
    function listacheques(fsang:boolean=true):boolean;

    { Private declarations }
  public
    { Public declarations }
    tipz: string;
  end;

var
  frmSangria: TfrmSangria;

implementation

uses principal,funcoes1,funcoes2,procura,auxiliar, unSangria_Sumario,
  un_FechamentoCaixa, unSangria_Motivos, GridCons, unDialogo;

{$R *.dfm}

procedure TfrmSangria.edtValorEnter(Sender: TObject);
begin
     tmaskedit(sender).selectall;
end;

procedure TfrmSangria.edtMotivoEnter(Sender: TObject);
begin
     tmaskedit(sender).selectall;
end;

procedure TfrmSangria.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=13) or (key=40) then edtMotivo.setfocus;
     if (key=38) then ;
end;

procedure TfrmSangria.edtMotivoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=13) then begin
       btnSalvarClick(btnSalvar);
     end;
     if (key=38) then edtValor.setfocus;
     if (key=K_F8) then edtMotivoDblClick(edtMotivo);
end;

procedure TfrmSangria.BotaoSair1Click(Sender: TObject);
begin
     close;
end;

procedure TfrmSangria.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure TfrmSangria.edtValorExit(Sender: TObject);
begin
     FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure TfrmSangria.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FormatarEditNumerico (TMaskEdit(sender));
end;

procedure TfrmSangria.Salvar1Click(Sender: TObject);
var
claux2,clAux: TClassAuxiliar;
total_dinheiro,totalcheque: real;
motivoconta:Boolean;
function sangriacaixa:boolean;
var
clAux2: TClassAuxiliar;
A:Variant;
begin
  result := false;

  clAux2 := TClassAuxiliar.Create;
  try
    clAux2.Conect   (databaseprodutos,self);
    clAux2.ClearSql;
    ClAux2.AddParam ('SELECT CONTA FROM MTV_SANG ');
    ClAux2.AddParam ('WHERE Upper(DESCRICAO) = '''+uppercase(edtmotivo.text)+''' ');
    ClAux2.execute;
    if (UpperCase(ClAux2.result('CONTA')) = 'PERGUNTA') AND (fjaperguntou >= 1) then
     result := fjaperguntou <> 2
    else begin
     result       := Claux2.Eof or (UpperCase(ClAux2.result('CONTA')) = 'SIM');
     if (UpperCase(ClAux2.result('CONTA')) = 'PERGUNTA') then
       if (frmDialogo.ExibirMensagem('Deseja Realizar o Movimento de Caixa com esse lançamento ?','Venda',[mbYes,mbNo]
               ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
       begin
         result := true;
       end;
     FJaPerguntou := iifs(Result,1,2);
    end;
    If Claux2.Eof or Not Result then
     exit;

  finally
    claux2.destroy;
  end;


  Claux.ClearSql;
  claux.consulta.DatabaseName := 'ESTOQUE';
  Claux.addParam('Select C.LojaCaixa as LojaSang,C.ContaCaixa,C.ContaLanc as CONTARECEBER,C.LojaOrg,C.Tipo');
  Claux.addParam('from Mtv_Sang_Contas C');
  Claux.addParam('Left Join Mtv_Sang M On (M.Codigo = C.Mtv_Sang)');
  Claux.addParam('Where M.Descricao  =  '''+edtmotivo.text+''' ');
{  Claux.addParam('and   (C.LojaOrg   =    '+floattostr(frm_principal.x_loja)+' or C.LojaOrg = 0 or C.LojaOrg is Null)');
  Claux.addParam('and   (C.Tipo      =    '+iifs(rdOpcao.itemindex >= 2,'2','1')+' Or C.Tipo = 0 or C.Tipo is null)');}
  Claux.addParam('Order By C.LojaOrg Desc,C.Tipo Desc');
  Claux.Execute;

  If ClAux.Consulta.Locate('LojaOrg;Tipo',VarArrayOf([frm_principal.x_loja,IIfs(rdOpcao.itemindex >= 2,2,1)]),[]) then begin
    Result := True;
    exit;
  end;

  ClAux.First;
  If ClAux.Consulta.Locate('LojaOrg',frm_principal.x_loja,[]) then begin
    Result := True;
    exit;
  end;

  ClAux.First;
  If ClAux.Consulta.Locate('Tipo',IIfs(rdOpcao.itemindex >= 2,2,1),[]) then begin
    Result := True;
    exit;
  end;

  ClAux.First;
  If ClAux.Consulta.Locate('LojaOrg;Tipo',VarArrayOf([0,0]),[]) then begin
    Result := True;
    exit;
  end;

end;

begin

//  if not verificacampos(Self) then
//    exit;



     if (edtValor.GetValor=0.00) then
     begin
        if (rdOpcao.itemindex=0) then
           ExibeCritica ('Você deve informar o VALOR SER RETIRADO DO CAIXA!','Operação de Caixa',edtValor)
        else if (rdOpcao.itemindex=1) then
           ExibeCritica ('Você deve informar o VALOR SER ADICIONADO AO CAIXA!','Operação de Caixa',edtValor);
     end
     else if (edtMotivo.GetValor='') then
     begin
        if (rdOpcao.itemindex=0) then
           ExibeCritica ('Você deve informar o motivo da SANGRIA!','Operação de Caixa',edtMotivo)
        else if (rdOpcao.itemindex=1) then
           ExibeCritica ('Você deve informar o motivo do SUPRIMENTO!','Operação de Caixa',edtMotivo);
     end
     else
     begin
          //******************************************************************************************
  clAux2 := TClassAuxiliar.Create;
  try
    clAux2.Conect   (databaseprodutos,self);
    clAux2.ClearSql;
    ClAux2.AddParam ('SELECT CONTA FROM MTV_SANG ');
    ClAux2.AddParam ('WHERE Upper(DESCRICAO) = Upper('''+edtmotivo.text+''') ');
    ClAux2.execute;
    if claux2.consulta.eof then begin
      ExibeCritica ('Motivo Inválido','Operação de Caixa',edtMotivo);
      edtMotivo.SetFocus;
      Exit;
    end;
  finally
    claux2.destroy;
  end;
           if Sender <> RdOpcao then begin
                  Application.CreateForm(Tfrm_FechamentoCaixa, frm_FechamentoCaixa);
                  frm_FechamentoCaixa.rdTipo.itemindex              := 0; //ABRE O FORM DE FECHAMENTO APENAS PARA 'CONFERENCIA'
                  frm_FechamentoCaixa.botaoEncerramento.visible     := false; {*}
                  frm_FechamentoCaixa.rdTipo.enabled                := false;
                  frm_FechamentoCaixa.flagExibeImpressaoConferencia := false;
                  frm_FechamentoCaixa.y_caixa_ativo                 := frm_principal.x_caixa_ativo;

                  //sumarizando os valores do CAIXA
                  frm_FechamentoCaixa.tipz := tipz;
                  frm_FechamentoCaixa.Conferncia1.click;

                  //SUMARIZANDO A OPERACAO EFETUADA EM TELA **************************************************
                  Application.CreateForm(TfrmSangria_Sumario, frmSangria_Sumario);
                  frmSangria_Sumario.memo1.lines.clear;
                  frmSangria_Sumario.memo1.lines.Add (' ');

                  total_dinheiro := frm_FechamentoCaixa.a_valor_inicial
                                    + frm_FechamentoCaixa.total_recebimentos_cheque_devolvido
                                    + frm_FechamentoCaixa.d2_total_dinheiro_creditos
                                    - frm_FechamentoCaixa.d2_total_dinheiro_debitos
                                    + frm_FechamentoCaixa.a_total_dinheiro
                                    - frm_FechamentoCaixa.total_sangrias
                                    + frm_FechamentoCaixa.total_sangrias_ch
                                    + frm_FechamentoCaixa.total_reprovisionamento
                                    + frm_FechamentoCaixa.totprestfpgt('DINHEIRO','PC_VPAG');

                  IF RdOpcao.itemindex < 2 then begin
                      frmSangria_Sumario.memo1.lines.Add ('          -- SUMÁRIO DA OPERAÇÃO EFETUADA --');
                      frmSangria_Sumario.memo1.lines.Add (' VALORES EM DINHEIRO: ');
                      frmSangria_Sumario.memo1.lines.Add (' +) DINHEIRO INICIAL DO CAIXA        : '+form_nc(frm_FechamentoCaixa.a_valor_inicial,15));
                      frmSangria_Sumario.memo1.lines.Add (' +) CREDITOS DE LANÇAMENTOS DIVERSOS : '+form_nc(frm_FechamentoCaixa.d2_total_dinheiro_creditos,15));
                      frmSangria_Sumario.memo1.lines.Add (' -) DÉBITOS  DE LANÇAMENTOS DIVERSOS : '+form_nc(frm_FechamentoCaixa.d2_total_dinheiro_debitos,15));
                      frmSangria_Sumario.memo1.lines.Add (' +) DINHEIRO RECEBIDO DE VENDAS      : '+form_nc(frm_FechamentoCaixa.a_total_dinheiro,15));
                      if frm_FechamentoCaixa.totprestfpgt('DINHEIRO','PC_VPAG') > 0 then BEGIN
                      frmSangria_Sumario.memo1.lines.Add (' +) DINHEIRO RECEBIDO DE PRESTAÇÕES  : '+form_nc(frm_FechamentoCaixa.totprestfpgt('DINHEIRO','PC_VPAG'),15));
                      frmSangria_Sumario.memo1.lines.Add (' +) DINHEIRO RECEBIDO                : '+form_nc(frm_FechamentoCaixa.totprestfpgt('DINHEIRO','PC_VPAG') + frm_FechamentoCaixa.a_total_dinheiro,15));
                      end;
                      frmSangria_Sumario.memo1.lines.Add (' +) DINHEIRO DE CHEQUES DEVOLVIDOS   : '+form_nc(frm_FechamentoCaixa.total_recebimentos_cheque_devolvido,15));
                      frmSangria_Sumario.memo1.lines.Add (' -) SANGRIAS ANTERIORES              : '+form_nc(frm_FechamentoCaixa.total_sangrias - frm_FechamentoCaixa.total_sangrias_Ch,15));
                      frmSangria_Sumario.memo1.lines.Add (' +) SUPRIMENTOS                      : '+form_nc(frm_FechamentoCaixa.total_reprovisionamento,15));
                      frmSangria_Sumario.memo1.lines.Add ('');
                      frmSangria_Sumario.memo1.lines.Add ('                     TOTAL ATUAL: '+form_nc(total_dinheiro,20));

                      frmSangria_Sumario.memo2.lines.clear;
                      if (rdOpcao.itemindex=0) then
                      begin
                           frmSangria_Sumario.memo2.lines.Add ('    VALOR RETIRADO..:               '+form_nc(edtValor.GetValor,15)+'(-)');
                           total_dinheiro := total_dinheiro - edtValor.GetValor;
                      end
                      else if (rdOpcao.itemindex=1) then
                      begin
                           frmSangria_Sumario.memo2.lines.Add ('    VALOR ADICIONADO:               '+form_nc(edtValor.GetValor,15)+'(+)');
                           total_dinheiro := total_dinheiro + edtValor.GetValor;
                      end;

                      frmSangria_Sumario.memo3.lines.clear;
                      frmSangria_Sumario.memo3.lines.Add      ('    NOVO TOTAL EM DINHEIRO:         '+form_nc(total_dinheiro,15));
                  end else begin
                      if (sender <> nil) then
                       ftotalcheque := strtofloatN(edtvalor.text);
                      frmSangria_Sumario.memo1.lines.Add ('          -- SUMÁRIO DA OPERAÇÃO EFETUADA --');
                      frmSangria_Sumario.memo1.lines.Add (' VALORES EM CHEQUE: ');
                      frmSangria_Sumario.memo1.lines.Add (' +) CHEQUES A VISTA                  : '+form_nc(frm_FechamentoCaixa.a_total_cheque,15));
                      frmSangria_Sumario.memo1.lines.Add (' +) CHEQUES RECEBIDO DE PRESTAÇÕES   : '+form_nc(frm_FechamentoCaixa.totprestfpgt('CHEQUE','PC_VPAG'),15));

                      query1.Sql.Text := FSql;
                      query1.parambyname('LOJA').AsFloat       := frm_principal.x_loja;
                      query1.ParambyName('Sang').AsString      := 'T';
                      query1.ParambyName('data').AsDateTime    := frm_principal.x_data_trabalho;
                      query1.Open;

                      totalcheque := 0;
                      query1.first;
                      WHILE NOT QUERY1.EOF do begin
                         totalcheque := totalcheque + query1.fieldbyname('valor').asfloat;
                         query1.next;
                      end;
                      frmSangria_Sumario.memo1.lines.Add (' -) SANGRIAS ANTERIORES              : '+form_nc(TotalCheque - iifs(totcheque2 <= 0,0,totcheque2),15));
                      frmSangria_Sumario.memo1.lines.Add ('                          TOTAL ATUAL: '+form_nc(frm_FechamentoCaixa.a_total_cheque + frm_FechamentoCaixa.totprestfpgt('CHEQUE','PC_VPAG') - TotalCheque + iifs(totcheque2 <= 0,0,totcheque2),15));

                      frmSangria_Sumario.memo2.lines.clear;
                      frmSangria_Sumario.memo2.lines.Add ('    VALOR RETIRADO..:               '+form_nc(iifs(totcheque > 0,totcheque,strtofloatn(edtvalor.text)),15)+'(-)');
                      frmSangria_Sumario.memo3.lines.clear;
                      frmSangria_Sumario.memo3.lines.Add ('    NOVO TOTAL EM CHEQUE:           ' +form_nc(frm_FechamentoCaixa.a_total_cheque
                                                                                                        + frm_FechamentoCaixa.totprestfpgt('CHEQUE','PC_VPAG')
                                                                                                        - totalcheque
                                                                                                        - ftotalcheque
                                                                                                       ,17));

                  end;
                  frmSangria_Sumario.showmodal;
                  frmSangria_Sumario.Free;

                  frm_FechamentoCaixa.Free; {*}
          end;
          //*****************************************************************************************
          clAux := TClassAuxiliar.Create;
          clAux.Conect   ('VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('INSERT INTO SANGRIA_REPROVISAO (LOJA,TERMINAL,DATA,FUNC,VALOR,MOTIVO,TIPO,HORA,CHEQUE,ContaCH,BANCOCH,AGECH,NUMCH,TIPZ) ');
          clAux.AddParam ('VALUES (:LOJA,:TERMINAL,:DATA,:FUNC,:VALOR,:MOTIVO,:TIPO,:HORA,:CHEQUE,:ContaCH,:BANCOCH,:AGECH,:NUMCH,:TIPZ)           ');
          clAux.consulta.parambyname('LOJA').AsFloat       := frm_principal.x_loja;
          clAux.consulta.parambyname('TERMINAL').AsFloat   := frm_principal.x_terminal;
          clAux.consulta.parambyname('DATA').AsDateTime    := frm_principal.x_data_trabalho;
          clAux.consulta.parambyname('FUNC').AsFloat       := frm_principal.x_caixa_ativo;
          clAux.consulta.parambyname('VALOR').AsFloat      := edtValor.GetValor;
          clAux.consulta.parambyname('MOTIVO').AsString    := edtMotivo.GetValor;
          clAux.consulta.parambyname('TIPO').AsInteger     := iifs(rdOpcao.itemindex >= 2,0,rdOpcao.itemindex);
          clAux.consulta.parambyname('HORA').AsString      := timetostr(time);
          clAux.consulta.parambyname('CHEQUE').AsString    := iifs(rdOpcao.itemindex >= 2,'T','');
          clAux.consulta.parambyname('ContaCH').AsString     := Conta.Text;
          clAux.consulta.parambyname('BANCOCH').AsInteger  := StrtoIntN(Banco.Text);
          clAux.consulta.parambyname('AGECH').AsString     := Agencia.Text;
          clAux.consulta.parambyname('NumCH').AsFloat      := StrtoFloatN(Numero.Text);
          clAux.consulta.parambyname('Tipz').AsFloat       := iifs(tipz = '','1',tipz);

          clAux.Execute; {*}

          fassignparams(ClAux.Consulta,query2);
          query2.parambyname('Sangria').AsString := 'T';
          query2.execsql;

          if DataBaseProdutos = 'ESTOQUE' then
            try
             claux.consulta.databasename := 'ESTOQUE';
             clAux.Execute; {*}
            except
             //
            end;

          claux.consulta.databasename := 'VENDAS';



          if (sender <> RdOpcao) and
              frm_principal.x_ecf_habilita_modo_fiscal and ((UpperCase(frm_principal.X_ImpSangEcf) = 'SIM') or
              ((UpperCase(frm_principal.X_ImpSangEcf) = 'PERGUNTAR') and
               (frmDialogo.ExibirMensagem ('Imprimir sangria na impressora fiscal?'
                ,'Operação de Caixa',[mbYes,mbNo]
                 ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes)
              )) then
               ImprimeSangria(iifs(RdOpcao.ItemIndex <= 1,EdtValor.Text,iifs(totcheque <= 0,EdtValor.Text,totcheque)),iifs(RdOpcao.ItemIndex = 1,'U','S'));

          if (sender <> RdOpcao) Then
           totcheque := 0;


          motivoconta := True;
          if (databasecontas='CONTASPAGAR') and (frm_principal.x_online) and sangriacaixa then
          begin
              if not claux.consulta.active or Claux.consulta.eof then begin
                motivoconta := False;
                claux.clearsql;
                claux.consulta.DatabaseName := 'ESTOQUE';
                clAux.AddParam ('SELECT CONTARECEBER,CONTACAIXA,BANCO,LOJASANG FROM CONFIG_CREDITOS_CAIXA           ');
                clAux.AddParam ('WHERE (LOJA='+floattostr(frm_principal.x_loja)+') AND                               ');
                clAux.AddParam ('      (TIPO=:TIPO) And                                                     ');
                clAux.AddParam ('      (LOJASANG > 0)  ');
                if rdOpcao.itemindex >= 2 then begin
                  clAux.addparam (' And (TODOSBANCOS = 1 or Banco=:Banco or banco = 0 or banco is null)');
                  clAux.consulta.parambyname('Banco').AsFloat := StrtoFloatN(Banco.Text);
                end;
                clAux.consulta.parambyname('Tipo').AsFloat  := iifs(rdOpcao.itemindex >= 2,2,1);
                claux.consulta.open;
              end;
              if not claux.eof then begin
                  GeraLancamentosoutros        (frm_principal.x_loja,
                                                frm_principal.x_terminal,
                                                0,
                                                frm_principal.x_data_trabalho,
                                                frm_principal.x_caixa_ativo,
                                                iifs(rdOpcao.itemindex <> 1,-edtValor.GetValor,edtValor.GetValor),
                                                TIPZ,
                                                iifs(rdOpcao.itemindex >= 2,'02','01'),
                                                iifs(rdOpcao.itemindex >= 2,StrtoFloatN(Banco.text),10000),
                                                true,
                                                iifs(rdOpcao.itemindex >= 2,formatfloat('000',strtofloatn(banco.text))+' '+agencia.text+' '+formatfloat('000000',strtofloatn(numero.text)),''),
                                                claux.result('LOJASANG'),
                                                rdOpcao.itemindex = 1,
                                                edtmotivo.text
                                                );

                  GeraLancamentosoutros        (claux.result('LOJASANG'),
                                                frm_principal.x_terminal,
                                                0,
                                                frm_principal.x_data_trabalho,
                                                frm_principal.x_caixa_ativo,
                                                iifs(rdOpcao.itemindex = 1,-edtValor.GetValor,edtValor.GetValor),
                                                TIPZ,
                                                iifs(rdOpcao.itemindex >= 2,'02','01'),
                                                iifs(rdOpcao.itemindex >= 2,StrtoFloatN(Banco.text),10000),
                                                true,
                                                iifs(rdOpcao.itemindex >= 2,formatfloat('000',strtofloatn(banco.text))+' '+agencia.text+' '+formatfloat('000000',strtofloatn(numero.text)),''),
                                                frm_principal.x_loja,
                                                rdOpcao.itemindex = 1,
                                                edtmotivo.text,
                                                motivoconta,
                                                claux,
                                                );


              end;

           end;
          clAux.desconect;
          clAux.Free;
          ftotalcheque := 0;

          if (sender <> RdOpcao) then
           FJaPerguntou := 0;



          {...}
         If (RdOpcao.ItemIndex < 2) then
          close
         else if sender <> rdopcao then
          Limparformulrio1.OnClick(sender);
     end;
end;

procedure TfrmSangria.Limparformulrio1Click(Sender: TObject);
begin
     limpacampos(self);
     if panel3.Visible then
       Banco.setfocus
     else
       edtValor.setfocus;
end;

procedure TfrmSangria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     inherited;
     if (shift = [ssCtrl]) and (key = 83) then
      if frm_principal.x_ecf_habilita_modo_fiscal and (RdOpcao.ItemIndex <= 1) then
        ImprimeSangria(StrtoFloatN(EdtValor.Text),IIFS(RdOpcao.ItemIndex = 1,'U','S'));


     if (key = vk_f2) and (rdopcao.itemindex >= 2) then listacheques(Shift <> [ssCtrl]);
     if (shift=[ssShift, ssAlt]) then
     begin
          if (key=K_INSERT) then
          begin
               if (tipz='1') then
               begin
                    tipz:='2';
                    lbtipz.visible:=true;
               end
               else
               begin
                    tipz:='1';
                    lbtipz.visible:=false;
               end;
               lbtipz.caption:='Sr.: '+tipz;
          end;
     end;
end;

procedure TfrmSangria.FormCreate(Sender: TObject);
begin
     inherited;
     FJaPerguntou := 0;
     tipz:='1';
     lbtipz.visible:=false;
     fsql                := query1.sql.text;
     query1.DatabaseName := databaseprodutos;
     query2.DatabaseName := databaseprodutos;
     totcheque:=0;
     totcheque2:=0;
end;

procedure TfrmSangria.edtMotivoDblClick(Sender: TObject);
var
motivo: string;
begin
     Application.CreateForm(TfrmSangria_Motivos, frmSangria_Motivos);
     frmSangria_Motivos.showmodal;
     if (frmSangria_Motivos.tecla=K_ENTER) then
     begin
          motivo:=frmSangria_Motivos.lista.items[frmSangria_Motivos.lista.itemindex];
          motivo:=Copy(motivo,4,200);
          edtMotivo.text := motivo;
     end;
     frmSangria_Motivos.Free;
end;

procedure TfrmSangria.rdOpcaoClick(Sender: TObject);
begin
  Panel3.Visible    := RdOpcao.ItemIndex >= 2;
  label2.Visible    := RdOpcao.ItemIndex >= 2;
  label3.Visible    := RdOpcao.ItemIndex >= 2;
  edtvalor.readonly := false;
  If Panel3.Visible then begin
     ListaCheques(true);
     Limpacampos(Self,Banco);
  end else
     edtvalor.setfocus;
end;

procedure TfrmSangria.NumeroExit(Sender: TObject);
var Qry:TQuery;
begin
   if (Numero.Text = '') or (numero.oldfocus and Not Numero.FoiAlterado) then
    exit;

   Qry := TQuery.Create(Application);
   With qry do
    try
      DataBaseName := 'VENDAS';
      sql.add('Select Cheque from');
      sql.add(' SANGRIA_REPROVISAO ');
      sql.add('Where Loja     =:Loja');
      if rdopcao.itemindex = 2 then begin
        sql.add('And   Terminal  =:Terminal');
        parambyname('Terminal').AsFloat := frm_principal.x_Terminal;
      end;
      sql.add('And   ContaCh  =:ContaCh');
      sql.add('And   BancoCh  =:BancoCh');
      sql.add('And   AgeCh    =:AgeCh');
      sql.add('And   NumCh    =:NumCh');
      sql.add('And   CHEQUE   = ''T''');

      parambyname('LOJA').AsFloat       := frm_principal.x_loja;

      parambyname('ContaCH').AsString   := Conta.Text;
      parambyname('BANCOCH').AsInteger  := StrtoIntN(Banco.Text);
      parambyname('AGECH').AsString     := Agencia.Text;
      parambyname('NumCH').AsFloat      := StrtoFloatN(Numero.Text);
      open;
      edtvalor.readonly := false;
      if eof Then begin
       sql.clear;
       databasename := databaseprodutos;
       sql.add('Select Ch_Valo from cheques ');
       sql.add('Where ch_loja =:loja');
       if rdopcao.itemindex = 2 then begin
         sql.add('And   ch_caix  =:Terminal');
         parambyname('Terminal').AsFloat := frm_principal.x_Terminal;
       end;
       sql.add('and   ch_cont =:ContaCh');
       sql.add('and   ch_banc =:bancoCh');
       sql.add('and   CH_Agen =:agech');
       sql.add('and   ch_nume =:NumCh');

       parambyname('LOJA').AsFloat       := frm_principal.x_loja;


       parambyname('ContaCH').AsString   := Conta.Text;
       parambyname('BANCOCH').AsInteger  := StrtoIntN(Banco.Text);
       parambyname('AGECH').AsString     := Agencia.Text;
       parambyname('NumCH').AsFloat      := StrtoFloatN(Numero.Text);
       open;


       edtvalor.readonly := not eof;
       edtvalor.clear;
       if not eof then begin
         edtvalor.text := formatfloat('#,##0.00',fieldbyname('ch_valo').AsFloat);
         edtmotivo.SetFocus;
       end;
       exit;
      end else if Not Mensconf('Cheque '+#13+
                               'Banco '+Banco.Text+' Agencia '+Agencia.text+' Conta '+Conta.text+' Num '+Numero.text+#13+
                               'já retirado do caixa! Deseja Estorná-lo?')  then
       exit;

      fassignparams(Qry,query2);
      query2.parambyname('Sangria').AsString := '';

      sql[0] := 'Delete From';
      ExecSql;

      Query2.Execsql;


      if (databasecontas='CONTASPAGAR') and (frm_principal.x_online) then begin
        sql.clear;
        databasename := 'CONTASPAGAR';
        Sql.add('Delete from Lancamentos_Conta_Caixa');
        sql.add('Where La_Doc = ''SG.'+floattostr(frm_principal.x_loja)+'.'+formatfloat('000',strtofloatn(banco.text))+' '+agencia.text+' '+formatfloat('000000',strtofloatn(numero.text))+''' ');
        execsql;

        sql.clear;
        Sql.add('Delete from Lancamentos');
        sql.add('Where La_Doc = ''SG.'+floattostr(frm_principal.x_loja)+'.'+formatfloat('000',strtofloatn(banco.text))+' '+agencia.text+' '+formatfloat('000000',strtofloatn(numero.text))+''' ');
        execsql;
      end;


      Limparformulrio1.OnClick(sender);

    finally
      destroy;
    end;


end;

function TfrmSangria.listacheques(fsang:boolean=true): boolean;
var i:integer;
  procedure preenchelistacheque(vsang:boolean;ult:boolean);
  begin
      banco.text  := Query1.FieldbyName('Banco').AsString;
      Agencia.text    := Query1.FieldbyName('Age').AsString;
      Numero.text := Query1.FieldbyName('Numero').AsString;
      Conta.text  := Query1.FieldbyName('Conta').AsString;
      EdtValor.text  := Query1.FieldbyName('Valor').AsString;
      if Not Vsang then
         Numero.OnExit(Nil)
      else begin
        if edtmotivo.Text = '' then
         edtMotivoDblClick(edtMotivo);

         if not ult then
          salvar1.OnClick(RdOpcao)
         else
          salvar1.OnClick(nil);
      end;

  end;
begin
  query1.Sql.Text := FSql;
  query1.parambyname('LOJA').AsFloat       := frm_principal.x_loja;
  query1.ParambyName('Sang').AsString      := IIfs(FSang,'','T');
  query1.ParambyName('data').AsDateTime    := frm_principal.x_data_trabalho;
  query1.Open;

  result := FGridCons(query1,'Cheques '+iifs(Fsang,'A Retirar','Retirados')+' Lançados nesta Loja',true);

   If Not Result then
    exit;

   ftotalcheque := 0;
   TotCheque    := 0;
   TotCheque2   := 0;
   If Frm_gridCons.Grid.SelectedRows.Count > 0 then begin
     For i:=0 to Frm_gridCons.Grid.SelectedRows.Count - 1 do begin
      Query1.GotoBookmark(pointer(Frm_gridCons.Grid.SelectedRows.Items[i]));
      ftotalcheque := ftotalcheque + query1.fieldbyname('valor').AsFloat;
      TotCheque    := TotCheque + query1.fieldbyname('valor').AsFloat;
      preenchelistacheque(FSang,i = Frm_gridCons.Grid.SelectedRows.Count - 1);
      TotCheque2    := TotCheque2 + query1.fieldbyname('valor').AsFloat;
     end;
   end else begin
      ftotalcheque := query1.fieldbyname('valor').AsFloat;
      Preenchelistacheque(FSang,true);
   end;

   Limparformulrio1.OnClick(Nil);
end;

procedure TfrmSangria.Label2DblClick(Sender: TObject);
begin
  listacheques(sender = label2);
end;

procedure TfrmSangria.Query1BeforeOpen(DataSet: TDataSet);
begin
  query1.parambyname('terminal').AsFloat  := IIFS(rdopcao.itemindex = 2,frm_principal.x_terminal,0);
end;

end.

