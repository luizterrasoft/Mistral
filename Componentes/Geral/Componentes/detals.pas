unit Detals;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, GridControl, StdCtrls, Buttons, Db, DBTables, ExtCtrls,
  PanelControle, EditControle,VariaveisSafi,FuncoesGlobais,
  CondPag, GridSql, Mask, MaskEdit,ComboSql,TipoDef,
  TEF,Registry, LayoutImp, RDprint,Setup;

type

  TSeguranca = record
     DataCadastro : TDateTime;
     Instalado : Char;
  End;

  TModulos = record
     Tef  : TSeguranca;
     ImpF : TSeguranca;
  End;



  TInformacaoDetalhamento = Record
      Campo : Array of String;
      Valor : Array of Variant;
      DescValor : Array of String;
      Tipo  : Array of Variant;
      Chave : Array of Boolean;
      TipoVariant : Array of Integer;
      CamposSubst:Array of String;
      IndsSubst  :TVetorDocDetal;
  end;

  TVetInformacaoDetalhamento = Array of TInformacaoDetalhamento;

  TFrm_Detals = class(TForm)
    ValorParcial: TEditControle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Query1: TQuery;
    NomeDetal: TLabel;
    btIncluiDetalhe: TBitBtn;
    btExcluiDetalhamento: TBitBtn;
    Panel1: TPanel;
    btOK: TBitBtn;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    PnVlTot: TPanelControle;
    PnFaltam: TPanelControle;
    PnInserido: TPanelControle;
    Label5: TLabel;
    Pagamento: TMaskEditControle;
    GeraBaixaParcial: TCheckBox;
    CondPag: TCondPag;
    BtAltera: TBitBtn;
    LbParcela: TLabel;
    BtCancParcelas: TBitBtn;
    BtGeraParcelaCheque: TBitBtn;
    Informacoes: TGridSql;
    QryFormaPagamento: TQuery;
    Formas: TGridSql;
    SgDetals: TGridSql;
    LayoutImp1: TLayoutImp;
    RDprint1: TRDprint;
    procedure FormasExit(Sender: TObject);
    procedure btIncluiDetalheClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure FormasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InformacoesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btExcluiDetalhamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormasGetCellColor(Sender: TObject; ARow, Acol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure InformacoesGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure SgDetalsGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure InformacoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PagamentoExit(Sender: TObject);
    procedure GeraBaixaParcialExit(Sender: TObject);
    procedure InformacoesEnter(Sender: TObject);
    procedure BtAlteraClick(Sender: TObject);
    procedure SgDetalsExit(Sender: TObject);
    procedure ValorParcialExit(Sender: TObject);
    procedure InformacoesKeyPress(Sender: TObject; var Key: Char);
    procedure BtCancParcelasClick(Sender: TObject);
    procedure BtGeraParcelaChequeClick(Sender: TObject);
    procedure SgDetalsClick(Sender: TObject);
    procedure SgDetalsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InformacoesExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormasMontaGridDataSet(var DadosGrid: TDadosgrid;
      var DeletaLinha: Boolean);
    procedure InformacoesGetCellColor(Sender: TObject; ARow, Acol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);

  private
    VarTabela       : String;
    ParcelasCheques :TTipoCondA;
    Function VerificaChaves(Const VarTipo:String;Chaves :Array of String;
                            VarInformacao:TInformacaoDetalhamento):Boolean;
    Function NumeroSequencialDinheiro:Boolean;
    { Private declarations }
  public
    FVLCREDITO,FVLCREDINI,Fjuros,Fltexced,FTroco,FSTroco:Double;
    InformacaoDetal :TVetInformacaoDetalhamento;
    OldRow : Word;
    VarFormaDePAgamento : String;
    TEF1:TTef;
    FSoCredito,HabilitaTEF : Boolean;
    Fmenstef : Tstringlist;
    FPropietario,FCNPJCPF,FSUBST:String;
    FIndSubst:Integer;
    { Public declarations }
  end;

var
  Frm_Detals: TFrm_Detals;
  FlagPagRec      : String;
  FlagOrigem      : String;
  DocumentosDetal : Array of TDocumentoDetal;
  CliFornDetal  : String;
  DocumentoDetalPrincipal,OrigemDetalPrincipal :String;
  ValorMaximoTroco : Currency;

const
  {camposcheque : array[0..12] of String    =  ('Banco','NomeBanco','Agencia','Conta','Talao','Numero',
                                              'Emissao','Vencimento','Deposito','Valor','PagRec','FormaPg');

  camposCartao : array[0..11] of String    =   ('Operadora','Numero','Autorizacao','Data'
                                              ,'Hora','Responsavel','Valor','PagRec','FormaPg','ValorOperadora','Vencimento');

  camposOutros : array[0..9] of String     =  ('Numero','Descricao','Emissao'
                                             ,'Vencimento','Deposito','valor'
                                             ,'formaPg','PagRec','Dinheiro');

  camposDin   : array[0..7] of String     =   ('Emissao','valor','formaPg','PagRec','Numero','Dinheiro','Deposito');}



  DocumentoCheque   = 'Documento';

  DocumentoCartao   = 'Documento';

  documentoOutros   = 'Documento';


  ChaveCheque : array[0..4] of String = ('Banco','Agencia','Conta','Talao','Numero');

  ChaveCartao : array[0..1] of String = ('Numero','Autorizacao');

  ChaveOutros : array[0..1] of String = ('Numero','formaPg');



implementation

{$R *.DFM}

procedure TFrm_Detals.FormasExit(Sender: TObject);
var
i,CamposInformados : integer;
begin
      if ((strtofloatn(pnfaltam.caption) = 0) or (ActiveControl = BitBtn4) or (ValorParcial.Focused)) and (Sender as Sender.ClassType = Formas) then
       exit;

      If (NomeDetal.Caption <> 'Forma de Pagamento') And (Sender as Sender.ClassType = Formas) then
       exit;


      NomeDetal.Caption :=  UpperCase(RetornaDescricaoGrupoPgto(Formas.FieldValue['Grupo',Formas.Row]));

//      LbParcela.Visible := ((Formas.Cells[5,Formas.row] <> '') and (Formas.Cells[2,Formas.row] = 'CHEQUE'));
//      LbParcela.Caption := 'Parcela 1';
//      BtCancParcelas.Visible := LbParcela.Visible;
//      BtGeraParcelaCheque.Visible := LbParcela.Visible;

      Informacoes.DeletaCombos;
      LimpaGrid(Informacoes);

      if Formas.FieldValue['TIPO',Formas.Row] = 'CHEQUE' then
       begin
          VarTabela := 'ChequeFinanceiro';
          Informacoes.RowCount := 6;


          Informacoes.cells[0,0] := 'Banco';
          Informacoes.cells[2,0] := 'Banco';
          Informacoes.cells[3,0] := 'S';
          Informacoes.cells[4,0] := 'S';
          Informacoes.cells[5,0] := '3';
          Informacoes.cells[8,0] := 'BancoDest';

          Informacoes.cells[0,1] := 'Nome do Banco';
          Informacoes.cells[2,1] := 'NomeBanco';
          Informacoes.cells[3,1] := 'S';
          Informacoes.cells[5,1] := '50';

          Informacoes.cells[0,2] := 'Agencia';
          Informacoes.cells[2,2] := 'Agencia';
          Informacoes.cells[3,2] := 'S';
          Informacoes.cells[4,2] := 'S';
          Informacoes.cells[5,2] := '7';
          Informacoes.cells[8,2] := 'AgenciaDest';

          Informacoes.cells[0,3]   := 'Conta';
          Informacoes.cells[2,3]   := 'Conta';
          Informacoes.cells[3,3]   := 'S';
          Informacoes.cells[4,3]   := 'S';
          Informacoes.cells[5,3]   := '9';
          Informacoes.cells[8,3]   := 'ContaDest';

          Informacoes.cells[0,4]   := 'Talão';
          Informacoes.cells[2,4]   := 'Talao';
          Informacoes.cells[3,4]   := 'S';
          Informacoes.cells[4,4]   := 'S';
          Informacoes.cells[5,4]   := '12';
          Informacoes.cells[8,4]   := 'TalaoDest';

          Informacoes.cells[0,5]   := 'Número';
          Informacoes.cells[2,5]   := 'Numero';
          Informacoes.cells[3,5]   := 'S';
          Informacoes.cells[4,5]   := 'S';
          Informacoes.cells[5,5]   := '12';
          Informacoes.cells[8,5]   := 'NumeroDest';
       end
      else if Formas.FieldValue['TIPO',Formas.Row] = 'CARTAO' then begin
          VarTabela := 'CartaoFinanceiro';
          Informacoes.RowCount     := 5;
          Informacoes.cells[0,0] := 'Operadora';
          Informacoes.cells[2,0] := 'Operadora';
          Informacoes.cells[3,0] := 'S';
          Informacoes.cells[4,0] := 'S';
          Informacoes.cells[5,0] := '3';
          Informacoes.cells[8,0] := 'BancoDest';

          Informacoes.SetCombo(1,0,9);
          With Informacoes.GetCombo[1,0] do begin
              BancodeDados   := 'BD';
              Tabela         := 'Operadora';
              CampoItens     := 'Descricao';
              CampoRetorno   := 'Codigo';
          end;


          Informacoes.cells[0,1] := 'Cartão';
          Informacoes.cells[2,1] := 'Numero';
          Informacoes.cells[3,1] := 'S';
          Informacoes.cells[4,1] := 'S';
          Informacoes.cells[5,1] := '16';
          Informacoes.cells[8,1] := 'NumeroDest';

          Informacoes.cells[0,2] := 'Autorização';
          Informacoes.cells[2,2] := 'Autorizacao';
          Informacoes.cells[3,2] := 'S';
          Informacoes.cells[4,2] := 'S';
          Informacoes.cells[5,2] := '20';
          Informacoes.cells[8,2] := 'AgenciaDest';

          Informacoes.cells[0,3]   := 'Hora';
          Informacoes.cells[1,3]   :=  FormatDateTime('hh:mm',Now());;
          Informacoes.cells[2,3]   := 'Hora';
          Informacoes.cells[3,3]   := 'H';

          Informacoes.cells[0,4]   := 'Responsável';
          Informacoes.cells[2,4]   := 'Responsavel';
          Informacoes.cells[3,4]   := 'S';
          Informacoes.cells[5,4]   := '50';
       end
      else if Formas.FieldValue['TIPO',Formas.Row] = 'OUTROS' then begin
            VarTabela := 'OutrosFinanceiro';
            Informacoes.RowCount := 2;

            Informacoes.cells[0,0]   := 'Número';
            Informacoes.cells[2,0]   := 'Numero';
            Informacoes.cells[3,0]   := 'S';
            Informacoes.cells[4,0]   := 'S';
            Informacoes.cells[5,0]   := '30';
            Informacoes.cells[8,0]   := 'NumeroDest';

            Informacoes.cells[0,1] := 'Descrição';
            Informacoes.cells[2,1] := 'Descricao';
            Informacoes.cells[3,1] := 'S';
            Informacoes.cells[5,1] := '50';
      end
      else if Formas.FieldValue['TIPO',Formas.Row] = 'DINHEI' then begin
            VarTabela := 'OutrosFinanceiro';
      end;

      If (Formas.FieldValue['TIPO',Formas.Row] <> 'CARTAO') and (Formas.FieldValue['TIPO',Formas.Row] <> 'DINHEI') then begin
          Informacoes.RowCount := Informacoes.RowCount + 1;
          Informacoes.cells[0,Informacoes.RowCount - 1]     := 'Vencimento';
          Informacoes.cells[2,Informacoes.RowCount - 1]     := 'Vencimento';
          Informacoes.cells[3,Informacoes.RowCount - 1]     := 'D';

          Informacoes.RowCount := Informacoes.RowCount + 1;
          Informacoes.cells[0,Informacoes.RowCount - 1]   := IIfs(FlagPagrec = 'R','Depósito','Saque');
          Informacoes.cells[2,Informacoes.RowCount - 1]   := 'Deposito';
          Informacoes.cells[3,Informacoes.RowCount - 1]   := 'D';
     end;


     Informacoes.RowCount := Informacoes.RowCount + IIfs(Formas.FieldValue['Tipo',Formas.Row] <> 'DINHEI',4,3);

     Informacoes.cells[0,Informacoes.RowCount - 4]     :=  'Propietário';
     Informacoes.cells[1,Informacoes.RowCount - 4]     :=  FPropietario;
     Informacoes.cells[2,Informacoes.RowCount - 4]     :=  'Propietario';
     Informacoes.cells[3,Informacoes.RowCount - 4]     :=  'S';
     Informacoes.cells[5,Informacoes.RowCount - 4]     :=  '50';
     Informacoes.cells[9,Informacoes.RowCount - 4]     :=  FCNPJCPF;

     Informacoes.SetCombo(1,Informacoes.RowCount - 4,9);
     With Informacoes.GetCombo[1,Informacoes.RowCount - 4] do begin
         Style        := csDropDown;
         BancodeDados := 'BD';
         Tabela       := VarTabela;
         CampoItens   := 'Propietario';
         CampoRetorno := 'Distinct CNPJ';
         IncluiChaves('ClienteFornecedor',DocumentosDetal[0].CliForn,VarString);
         IncluiChaves('PAGREC',FlagPagrec,VarString);
         IncluiChaves('Not Propietario','',VarString);
     end;


     Informacoes.cells[0,Informacoes.RowCount - 3]     := 'CPF/CNPJ';
     Informacoes.cells[1,Informacoes.RowCount - 3]     := FCNPJCPF;
     Informacoes.cells[2,Informacoes.RowCount - 3]     := 'CNPJ';
     Informacoes.cells[3,Informacoes.RowCount - 3]     := 'S';
     Informacoes.cells[5,Informacoes.RowCount - 3]     := '25';



     Informacoes.cells[0,Informacoes.RowCount - 2]     :=  IIfs(FlagPagRec = 'R','Destino','Origem');
     Informacoes.cells[1,Informacoes.RowCount - 2]     :=  Formas.FieldValue['DescConta',Formas.Row];
     Informacoes.cells[2,Informacoes.RowCount - 2]     :=  'ContaMov';
     Informacoes.cells[3,Informacoes.RowCount - 2]     :=  'S';
     Informacoes.cells[9,Informacoes.RowCount - 2]     :=  Formas.FieldValue['Conta',Formas.Row];

     Informacoes.SetCombo(1,Informacoes.RowCount - 2,9);
     With Informacoes.GetCombo[1,Informacoes.RowCount - 2] do begin
        BancodeDados   := 'BD';
        Tabela         := 'Conta';
        CampoItens     := 'Desc_Conta';
        CampoRetorno   := 'Cod_Conta';
     end;


     Informacoes.cells[0,Informacoes.RowCount - 1]     := 'OBS';
     Informacoes.cells[2,Informacoes.RowCount - 1]     := 'Observacao';
     Informacoes.cells[3,Informacoes.RowCount - 1]     := 'M';

     if (Formas.FieldValue['Tipo',Formas.Row] <> 'DINHEI') then begin
         Informacoes.RowCount := Informacoes.RowCount + 1;
         Informacoes.cells[0,Informacoes.RowCount - 1]     :=  'Cond.Pag';
         Informacoes.cells[1,Informacoes.RowCount - 1]     :=  Formas.FieldValue['DescCondPag',Formas.Row];
         Informacoes.cells[2,Informacoes.RowCount - 1]     :=  'CondPag';
         Informacoes.cells[3,Informacoes.RowCount - 1]     :=  'S';
         Informacoes.cells[9,Informacoes.RowCount - 1]     :=  Formas.FieldValue['Condpag',Formas.Row];
         Informacoes.SetCombo(1,Informacoes.RowCount - 1,9);
         With Informacoes.GetCombo[1,Informacoes.RowCount - 1] do begin
            BancodeDados   := 'BD';
            Tabela         := 'CondPag';
            CampoItens     := 'Descricao';
            CampoRetorno   := 'Codigo';
            IncluiChaves('PAGAVISTA','S',VarString);
         end;
     end;


     if (Formas.FieldValue['Tipo',Formas.Row] = 'DINHEI') or (Formas.FieldValue['Tipo',Formas.Row] = 'OUTROS')  then begin
           Informacoes.RowCount := Informacoes.RowCount + 1;
           Informacoes.cells[1,Informacoes.RowCount - 1]     :=  IIfs(Formas.FieldValue['Tipo',Formas.Row] = 'DINHEI','S','N');
           Informacoes.cells[2,Informacoes.RowCount - 1]     :=  'Dinheiro';
           Informacoes.cells[3,Informacoes.RowCount - 1]     :=  'S';
           Informacoes.RowHeights[Informacoes.RowCount - 1]  := -1;
     end;




     If (Sender = SgDetals) then
          exit;

     if (Formas.FieldValue['Tipo',Formas.Row]) = 'DINHEI'  then begin
       btincluidetalhe.setfocus;
       exit;
     end;

      Informacoes.setfocus;

end;

procedure TFrm_Detals.btIncluiDetalheClick(Sender: TObject);
var
i,i2,i3,ChavesIguais,NumeroChaves: integer;
FRetCredito:TCredito;
FVlRetCred :double;
F:Boolean;
begin
      F := True;
      If (Length(ParcelasCheques) = 0) then
        If (NomeDetal.Caption = 'Forma de Pagamento') then
          Formas.OnExit(Self)
        else if (Self.ActiveControl = Informacoes) or ((Self.ActiveControl is TComboSql) and Informacoes.ComboGrid(TComboSql(Self.ActiveControl)))  then begin
          Informacoes.OnSelectCell(Informacoes,Informacoes.Col,Informacoes.Row,F);
          If Not F then begin
            Informacoes.SetFocus;
            Exit;
          end;
        end;


      If (Length(ParcelasCheques) = 0) and (Formas.FieldValue['CondPag',Formas.Row] <> '') and (Formas.FieldValue['Tipo',Formas.Row] <> 'CARTAO') and (Sender <> BtAltera) then begin
          With CondPag do begin
                 CondPag.Ativa;
                 CondPag.Codigo := Formas.FieldValue['CondPag',Formas.Row];
                 CondPag.Recupera;
                 CondPag.Parcela := 1;
                 ParcelasCheques := GeraParcelas(CondPag.Codigo,'',StrtoFloatN(ValorParcial.Text),StrToDateTime(Pagamento.Text),CondPag.BancodeDados);
                 ValorParcial.Text  := FormatFloat('#,##0.00',ParcelasCheques[0].valor);
                 For I:=0 to Informacoes.RowCount - 1 do
                  If Informacoes.cells[2,I] = 'Vencimento' then
                    Break;
                 If (Informacoes.cells[1,I] = '') or (Informacoes.cells[1,I] = '  /  /  ') then
                   Informacoes.cells[1,I]  := FormatDateTime('dd/mm/yy',ParcelasCheques[0].Data);

                 For I:=0 to Informacoes.RowCount - 1 do
                  If Informacoes.cells[2,I] = 'Numero' then
                    Break;

                 If Informacoes.cells[1,I] = '' then
                  Informacoes.cells[1,I]   := format('%12.12d',[1]);

                //  Informacoes.cells[1,9]  := FloatToStr(ParcelasCheques[0].valor);
                //  LbParcela.Visible := true;
          end;
      end;






          For i:=1 to SgDetals.RowCount - 1 do begin
              ChavesIguais := 0;
              NumeroChaves := 0;
              If sgdetals.FieldValue['Codigo',i] <> Formas.FieldValue['Codigo',Formas.Row] then
                 Continue;

              If Formas.FieldValue['Tipo',Formas.Row] = 'DINHEI' Then
               Continue;

              For i2 := 0 to Length(InformacaoDetal[i - 1].Campo) - 1 Do begin
                   If not InformacaoDetal[i - 1].Chave[i2] then
                    continue;

                   For i3 := 0 to Informacoes.RowCount - 1 do begin
                       If (InformacaoDetal[i - 1].Campo[i2] = Informacoes.cells[2,i3]) then  begin
                          If (VarIsEmpty(InformacaoDetal[i - 1].Valor[i2]) and (Informacoes.cells[1,i3] = '')) Or
                             (Not(VarIsEmpty(InformacaoDetal[i - 1].Valor[i2])) and(InformacaoDetal[i - 1].Valor[i2] = Informacoes.cells[1,i3])) then
                                Inc(ChavesIguais);
                         break;
                       end;
                   end; // Fim do 3 For


              end;//Fim do 2 for

              For i3:=0 to Length(InformacaoDetal[i - 1].Campo) - 1 do begin
                If InformacaoDetal[i - 1].Chave[i3] then
                 Inc(NumeroChaves);
              end;

             If ChavesIguais = NumeroChaves then
              begin
                Informacoes.Limpa;
                Informacoes.DeletaCombos;
                Informacoes.Cells[00,00] := '';
                If Length(ParcelasCheques) = 0 then
                    Formas.SetFocus
                else begin
                   CondPag.Parcela := CondPag.Parcela - 1;
                   if CondPag.Parcela = 0 then begin 
                     SetLength(ParcelasCheques,0);
                     Formas.SetFocus;
                   end;  
                end;


                NomeDetal.Caption := 'Forma de Pagamento';
                MessageDlg('Forma de Pagamento Duplicada',mterror,[mbok],0);
                exit;
              end;

          end;


     If Formas.FieldValue['RETORNOCREDITO',Formas.Row] = 'T' then Begin
           FVlRetCred :=  StrtoFloatN(ValorParcial.Text);
           For i:=1 to SgDetals.RowCount - 1 do
            If SgDetals.FieldValue['RETORNOCREDITO',I] = 'T' then
              FVlRetCred := FVlRetCred + StrtoFloatN(SgDetals.Cells[1,I]);



           for i:=0 to length(DocumentosDetal) - 1 do begin
               if i > 0 then begin
                    For i2:=I - 1 downto 0  do
                      If DocumentosDetal[I2].CliForn = DocumentosDetal[I].CliForn then
                        break;

                     If I2 >= 0  then
                       Continue;
                end;

                FRetCredito := RetCredito(DocumentosDetal[0].Empresa,FlagPagRec,DocumentosDetal[I].CliForn,StrtoDateTime(Pagamento.Text));

                If (FRetCredito.Total < FRetCredito.Utilizado + FVlRetCred) And
                Not MensConf(IIfs(FlagPagRec = 'R','Cliente ','Fornecedor ')+' Sem Credito Cadastrado Suficiente '+#13+
                                  ' Credito           :'+FormatFloat('#,##0.00',FRetCredito.Total)+#13+
                                  ' Credito Utilizado :'+FormatFloat('#,##0.00',FRetCredito.Utilizado + FVlRetCred)+#13+
                                  ' Continua Operação ?') then begin
                                       Informacoes.DeletaCombos;
                                       Informacoes.Limpa;
                                       NomeDetal.Caption := 'Forma de Pagamento';
                                       SetLength(ParcelasCheques,0);
                                       ValorParcial.SetFocus;
                                       Exit;
                             end;


           end;
     end;


     If (Formas.FieldValue['CREDITO',Formas.Row] <> 'T') or FSoCredito  then begin
            PnInserido.Caption := FormatFloat('#,##0.00',Abs(StrtoFloatN(PnInserido.Caption) +
                                StrtoFloatN(ValorParcial.Text)));

            PnFaltam.Caption := FormatFloat('#,##0.00',Abs(StrtoFloatN(PnVlTot.Caption) -
                                StrtoFloatN(PnInserido.Caption)));
      end else begin
            If (FVlCredito + StrtoFloatN(VAlorParcial.Text)) > StrtoFloatN(PnFaltam.CAption) then begin
                 Mensagem(Formas.cells[0,Formas.Row]+' com Valor Maior que o Possivel');
                 ValorParcial.SetFocus;
                 exit;
            end;
            FVlCredito := FVlCredito + StrtoFloatN(ValorParcial.Text);
      end;




      If Not NumeroSequencialDinheiro then begin
                if StrtoFloatN(PnInserido.Caption) >= StrtoFloatN(PnVlTot.Caption) then
                 begin
                    If (SgDetals.FieldValue['TROCO',SgDetals.RowCount - 1] = 'T') then
                       SgDetals.deletalinha(SgDetals.RowCount - 1);

                    BtOk.Enabled     := True;
                    BtOk.Setfocus;
          {          BtIncluiDetalhe.Caption := 'Crédito<Tecle Insert>';
                    Label2.Caption          := 'Crédito/Troco';
                    BtIncluiDetalhe.Tag     := 1;
                    BtIncluiDetalhe.enabled := (StrtoFloatN(PnInserido.Caption) > StrtoFloatN(PnVlTot.Caption)) and
                                               (StrtoFloatN(PnFaltam.Caption)   > FVLCredito);}
                 end
                else If (Length(ParcelasCheques) = 0) or (CondPag.Parcelas = CondPag.Parcela) then
                   ValorParcial.setfocus;









                If sgdetals.cells[00,sgdetals.rowcount - 1] <> '' then
                   sgdetals.Rowcount := sgdetals.Rowcount + 1;

                sgdetals.cells[1,sgdetals.rowcount - 1] := FormatFloat('#,##0.00',StrtoFloatN(ValorParcial.text));

                If Formas.FieldValue['Tipo',Formas.Row] = 'CHEQUE' then
                  Sgdetals.FieldValue['NomeTabela',sgdetals.rowcount - 1] := 'CHEQUEFINANCEIRO'
                else if Formas.FieldValue['Tipo',Formas.Row] = 'CARTAO' then
                  Sgdetals.FieldValue['NomeTabela',sgdetals.rowcount - 1] := 'CARTAOFINANCEIRO'
                else
                  Sgdetals.FieldValue['NomeTabela',sgdetals.rowcount - 1] := 'OUTROSFINANCEIRO';

                If Length(ParcelasCheques) <> 0 then
                  Sgdetals.FieldValue['Parcela',sgdetals.rowcount - 1] := IntToStr(CondPag.Parcela);

                For I:=0 to Formas.Campos.Count - 1 do
                 sgdetals.FieldValue[Formas.Campos[I],sgdetals.rowcount - 1] := Formas.FieldValue[Formas.Campos[I],Formas.Row];


                 Setlength(InformacaoDetal,Length(InformacaoDetal) + 1);


                  For i:=0 to Informacoes.RowCount - 1 do begin
                   SetLength(InformacaoDetal[length(InformacaoDetal) - 1].Campo,i + 1) ;
                   SetLength(InformacaoDetal[length(InformacaoDetal) - 1].Valor,i + 1) ;
                   SetLength(InformacaoDetal[length(InformacaoDetal) - 1].Tipo,i + 1) ;
                   SetLength(InformacaoDetal[length(InformacaoDetal) - 1].Chave,i + 1) ;
                   SetLength(InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant,i + 1) ;
                   SetLength(InformacaoDetal[length(InformacaoDetal) - 1].DescValor,i + 1) ;
                   SetLength(InformacaoDetal[length(InformacaoDetal) - 1].CamposSubst,i + 1);

                   if (sgdetals.FieldValue['TIPO',sgdetals.rowcount - 1] = 'CARTAO') and (UpperCase(Informacoes.cells[2,i]) = 'OPERADORA') then
                      sgdetals.FieldValue['OPERADORA',sgdetals.rowcount - 1] := Informacoes.cells[1,i];

                   InformacaoDetal[length(InformacaoDetal) - 1].CamposSubst[i] := Informacoes.cells[8,i];
                   InformacaoDetal[length(InformacaoDetal) - 1].Campo[i]       := Informacoes.cells[2,i];
                   InformacaoDetal[length(InformacaoDetal) - 1].Chave[i]       := (Informacoes.cells[4,i] = 'S');

                       if Copy(Informacoes.cells[3,i],1,1) = 'S' then begin
                             InformacaoDetal[length(InformacaoDetal) - 1].Tipo[i]  := FtString;
                             InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant[i]  := $0100;
                       end;

                       if Copy(Informacoes.cells[3,i],1,1) = 'M' then begin
                             InformacaoDetal[length(InformacaoDetal) - 1].Tipo[i]  := FtMemo;
                             InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant[i]  := $0100;
                       end;


                      if Copy(Informacoes.cells[3,i],1,1) = 'D' then begin
                           if (Informacoes.cells[1,i] = '  /  /  ')  or  (Informacoes.cells[1,i] = '  /  /    ') then
                             Informacoes.cells[1,i] := '';

                            InformacaoDetal[length(InformacaoDetal) - 1].Tipo[i]  := FtDate;
                            InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant[i]  := $0007;
                      end;

                      if Copy(Informacoes.cells[3,i],1,1) = 'H' then begin
                              if (Informacoes.cells[1,i] = '  :  ')  then
                                Informacoes.cells[1,i] := '';

                              InformacaoDetal[length(InformacaoDetal) - 1].Tipo[i]  := FtTime;
                              InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant[i]  := $0007;
                      end;

                      if Copy(Informacoes.cells[3,i],1,1) = 'N' then begin
                          InformacaoDetal[length(InformacaoDetal) - 1].Tipo[i]  := FtFloat;
                          InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant[i]  := $0005;
                      end;

                    if Informacoes.cells[1,i] = '' then
                      Continue;

                    If (Informacoes.GetCombo[1,I] = Nil) or (TComboSql(Informacoes.GetCombo[1,I]).Style = csDropDown)  then 
                        InformacaoDetal[length(InformacaoDetal) - 1].Valor[i] := VarAsType(Informacoes.cells[1,i],InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant[i])
                    Else
                        InformacaoDetal[length(InformacaoDetal) - 1].Valor[i]     := VarAsType(Informacoes.cells[9,i],InformacaoDetal[length(InformacaoDetal) - 1].TipoVariant[i]);

                    If Informacoes.GetCombo[1,I] <> Nil then
                      InformacaoDetal[length(InformacaoDetal) - 1].DescValor[i] := Informacoes.cells[1,i];

             end;

             SgDetals.Row := SgDetals.RowCount - 1;
  end;

  If (Length(ParcelasCheques) = 0) or
      (CondPag.Parcela = CondPag.Parcelas) then begin

           Informacoes.DeletaCombos;
           Informacoes.Limpa;
           btExcluiDetalhamento.enabled := True;
           BtAltera.Enabled := False;
           NomeDetal.Caption := 'Forma de Pagamento';
           SetLength(ParcelasCheques,0);

           Label2.Caption        := IIfs(StrtoFloatN(PnVlTot.Caption) > (retornavalortotaldogrid(['+'],[1],SgDetals,1)),'Faltam','Troco/Credito');
           PnFaltam.Font.Color   := IIfs(Label2.Caption = 'Faltam',ClRed,ClBlue);

           Formas.MontaGridDataSet(QryFormaPagamento,0);

           For i:=1 to Formas.RowCount - 1 do
             If Formas.FieldValue['CODIGO',I] = SgDetals.FieldValue['CODIGO',SgDetals.Row] then begin
               Formas.Row := I;
               break;
             end;

           if StrtoFloatN(PnVlTot.Caption) >= StrtoFloatN(PnInserido.Caption)   then
                   ValorParcial.Text := PnFaltam.Caption
           else if (FVlCredito <  StrtoFloatN(PnFaltam.Caption)) then begin
                   For i:=1 to Formas.RowCount - 1 do
                       If Formas.FieldValue['CREDITO',I] = 'T' then begin
                           Formas.Row := I;
                           ValorParcial.Text := PnFaltam.Caption;
                           break;
                       end;

                   SgDetals.RowCount                                 := SgDetals.RowCount + 1;
                   SgDetals.Cells[0,SgDetals.RowCount - 1]           := 'TROCO';
                   SgDetals.Cells[1,SgDetals.RowCount - 1]           := FormatFloat('#,##0.00',StrtoFloatN(PnFaltam.Caption) - FVlCredito);
                   SgDetals.FieldValue['Troco',SgDetals.RowCount - 1]:= 'T';
                   SgDetals.Row  := SgDetals.RowCount - 1;
                   If Formas.FieldValue['CREDITO',Formas.Row] = 'T' then begin
                       Formas.OnExit(Sender);
                       BtOk.SetFocus;
                   end;
           end;
   end else begin
           CondPag.Parcela   := CondPag.Parcela + 1;
           For i:=0 to Length(ParcelasCheques) - 2 do
             ParcelasCheques[I] := ParcelasCheques[I + 1];
           SetLength(ParcelasCheques,Length(ParcelasCheques) - 1);
           For I:=0 to Informacoes.RowCount - 1 do
             If Informacoes.cells[2,I] = 'Numero' then
               Break;

            Informacoes.cells[1,I]   := format('%'+IntToStr(Length(Informacoes.cells[1,I]))+
                                               '.'+IntToStr(Length(Informacoes.cells[1,I]))+'d',[StrToInt(Informacoes.cells[1,I]) + 1]);
            For I:=0 to Informacoes.RowCount - 1 do
              If Informacoes.cells[2,I] = 'Vencimento' then
                Break;

            Informacoes.cells[1,I]   := FormatDateTime('dd/mm/yy',ParcelasCheques[0].Data);

            For I:=0 to Informacoes.RowCount - 1 do
             If Informacoes.cells[2,I] = 'Deposito' then
               Break;

            Informacoes.cells[1,I]   := '';
            ValorParcial.Text        := FormatFloat('#,##0.00',ParcelasCheques[0].Valor);
            btIncluiDetalhe.Click;

  end;
end;

procedure TFrm_Detals.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_Detals.btOKClick(Sender: TObject);
var
i,i2,i3,IndParcela : integer;
vardocumento,documentolocal,OrigemLocal,EmpresaLocal,VencimentoLocal,ValorLocal,ParcelaLocal : String;
varchave : array of string;
sequencialdinheiro : Int64;
sequencialdinheirostr : string;
Valores : TTipoCondA;
begin

        Try

                 For i:=1 to sgdetals.rowcount - 1 do begin
                        if Not ((SgDetals.FieldValue['ASSOCTEF',I] = 'T') and HabilitaTef ) then
                           continue
                        Else If Tef1 = Nil Then Begin
                                Tef1 := TTef.Create(Self);

                                MensP(True,'Ativando Gerenciador Padrão, Aguarde uns instantes...');
                                Application.ProcessMessages;
                                if not Tef1.CheckGerenciador then begin
                                  MensP(False,'');
                                  Tef1.Destroy;
                                  Tef1 := Nil;
                                  Mensagem('Não foi possível ativar o Gerenciador Padrão');
                                  Exit;
                                end;
                                MensP(False,'');
                        End;

                        Tef1.Rede := StrtoInt(sgdetals.FieldValue['REDE',I]);
                        if sgdetals.FieldValue['CONDPAG',I] <> '' then begin
                           CondPag.Ativa;
                           condpag.Codigo := sgdetals.FieldValue['CONDPAG',I];
                           condpag.recupera;
                           Tef1.Qtd_Par_Tef := condpag.Parcelas;
                        end;


                        If Tef1.Tef(StrtoInt(sgdetals.FieldValue['OPERACAOTEF',I]),StrtoFloatN(sgdetals.Cells[1,I])) then begin

                          i2 := 0;
                          while i2 = 0 do begin
                             if Tef1.TemResposta then
                              begin


                                Tef1.LeCampos;
                                FMensTef.Clear;
                                for i3:=1 to Tef1.Linhas_Tef do
                                   FMensTef.Add(Tef1.MAT_CUPOM[i3]);

                                 ShowMessage(Tef1.Mensagem_Tef);
                                 Tef1.ApagaResposta;
                                 If Tef1.Status_Tef <> '0' then
                                  exit;


                                 Break;
                              end;
                          end;
                        end else
                          mensagem('Não foi possível passar os valores para Ativar o Tef');
                 end;

                 Modalresult := mrok;

                 If SgDetals.FieldValue['TRoco',SgDetals.rowcount - 1] = 'T' then begin
                     SgDetals.deletalinha(SgDetals.rowcount - 1);
                     FTroco := StrtoFloatN(SgDetals.Cells[1,SgDetals.rowcount - 1]);
                 end;

                 for i:=0 to length(DocumentosDetal) - 1 do
                  begin
                     for i2 := 1 to sgdetals.rowcount - 1 do begin
                       with query1 do begin
                              CondPag.Parcelas := 1;

                              If (SgDetals.FieldValue['CONDPAG',i2] <> '') and (SgDetals.FieldValue['TIPO',i2] = 'CARTAO') then begin
                                 CondPag.Ativa;
                                 CondPag.Codigo := SgDetals.FieldValue['CONDPAG',i2];
                                 CondPag.Recupera;
                                 Valores  := GeraParcelas(SgDetals.FieldValue['CONDPAG',i2],'',StrtoFloatN(SgDetals.cells[1,i2]),StrToDateTime(Pagamento.Text),CondPag.BancodeDados);
                              end;



                             For indParcela := 0 to CondPag.Parcelas - 1 do begin
                                       sql.clear;
                                       sql.add('Insert Into '+sgdetals.FieldValue['NOMETABELA',i2]);
                                       sql.add('(      ');
                                       sql.add('Documento,Origem,Caixa,CaixaPrincipal,Empresa,DocumentoPrincipal,OrigemPrincipal,ClienteFornecedor,CliFornPrincipal,OutrosDoc');
                                       sql.add(',Valor,Pagrec,FormaPg,Substituido,IndSubst,Juros,VLCREDITO');
                                       If (sgdetals.FieldValue['TIPO',i2] = 'CARTAO')  then begin
                                             sql.add(',Data');
                                             If (SgDetals.FieldValue['CONDPAG',i2] <> '') then Begin
                                               sql.add(',Vencimento');
                                               sql.add(',Parcela');
                                             end;
                                       end else begin
                                             sql.add(',Emissao');
                                             If (sgdetals.FieldValue['TIPO',i2] = 'DINHEI') Then begin
                                                sql.add(',Vencimento');
                                                sql.add(',Deposito');
                                             end;
                                       end;

                                       for i3:=0 to Length(InformacaoDetal[i2 - 1].Campo) - 1 do
                                           sql.add(','+InformacaoDetal[i2 - 1].Campo[i3]);

                                       sql.add('    )');
                                       If DocumentosDetal[I].Duplicata <> '' then begin
                                          if Flagpagrec = 'R' then
                                            sql.add('Select DocNum_PagRec,Origem_PagRec,')
                                          else
                                            sql.add('Select DocNum_Pag,Origem_Pag, ');
                                       end
                                      else
                                          sql.add('Values( :Documento,:Origem,:Caixa,:CaixaPrincipal,');

                                       sql.add(':Empresa,:DocumentoPrincipal,:OrigemPrincipal,:ClienteFornecedor,:CliFornPrincipal,:OutrosDoc');

                                       sql.add(',:Valor,:Pagrec,:FormaPg,:Substituido,:IndSubst,:Juros,:VLCREDITO,:Emissao');
                                       ParamByName('FormaPg').AsString      :=  sgdetals.FieldValue['CODIGO',i2];
                                       ParamByName('Pagrec').AsString       :=  FlagPagRec;
                                       ParamByName('Substituido').AsString  :=  FSUBST;
                                       ParamByName('Emissao').AsDateTime    :=  StrtoDateTime(Pagamento.Text);
                                       ParamByName('Valor').AsFloat         :=  IIfs(Not((StrtoFloatN(SgDetals.Cells[1,i2]) > StrtoFloatN(PnVlTot.Caption)) and (FVlCredito = 0) and ((sgdetals.FieldValue['TIPO',i2] = 'DINHEI') or (sgdetals.FieldValue['PDVPERMITETROCO',i2] = 'T')))
                                                                               ,StrtoFloatN(SgDetals.Cells[1,i2]),StrtoFloatN(PnVlTot.Caption));
                                       ParamByName('Juros').AsFloat         :=  IIfs(SgDetals.fieldvalue['credito',i2] = 'T',0,
                                                                                     StrtoFloatN(SgDetals.FieldValue['Valor',i2])/StrtoFloatN(PnInserido.Caption) * fjuros);
                                       ParamByName('VLCredito').AsFloat     :=  IIfs(SgDetals.fieldvalue['credito',i2] = 'T',0,
                                                                                     StrtoFloatN(SgDetals.FieldValue['Valor',i2])/StrtoFloatN(PnInserido.Caption) * (FVLCREDITO + FVLCREDINI));
                                       If (sgdetals.FieldValue['TIPO',i2] = 'CARTAO') then begin
                                             If (SgDetals.FieldValue['CONDPAG',i2] <> '') then begin
                                                  sql.add(',:Vencimento');
                                                  sql.add(',:Parcela');
                                                  ParamByName('Valor').AsFloat         :=  Valores[indParcela].Valor;
                                                  ParamByName('Parcela').AsString      :=  Valores[indParcela].Documento;
                                                  ParamByName('Vencimento').AsDateTime :=  Valores[indParcela].Data;
                                             end;
                                       end else If (sgdetals.FieldValue['TIPO',i2] = 'DINHEI') Then begin
                                             sql.add(',:Emissao');
                                             sql.add(',:Emissao');
                                       end;

                                       for i3:=0 to Length(InformacaoDetal[i2 - 1].Campo) - 1 do begin
                                         sql.add(', :'+InformacaoDetal[i2 - 1].Campo[i3]);
                                       end;

                                       If DocumentosDetal[I].Duplicata = '' then begin
                                           sql.add('    )');
                                           ParamByName('Origem').Value         := DocumentosDetal[i].Origem;//Origem
                                           ParamByName('caixa').Value          := DocumentosDetal[i].Caixa;//Caixa
                                           ParamByName('Documento').Value      := DocumentosDetal[i].Documento;//Documento
                                        end
                                       else begin
                                         if FlagPagRec = 'R' then begin
                                             sql.add(' from PagRec ');
                                             sql.add('Where Duplicata_PagRec = '''+DocumentosDetal[i].Duplicata+'''');
                                             sql.add('And   Cod_Cli_PagRec   = '''+DocumentosDetal[i].CliForn+'''');
                                             sql.add('and   Empresa_PagRec   = '''+DocumentosDetal[i].Empresa+'''');
                                          end else begin
                                             sql.add(' from Pagament ');
                                             sql.add('Where Duplicata_PAg = '''+DocumentosDetal[i].Duplicata+'''');
                                             sql.add('And   Cod_Forn_PAg   = '''+DocumentosDetal[i].CliForn+'''');
                                             sql.add('and   Empresa_PAg   = '''+DocumentosDetal[i].Empresa+'''');
                                          end;
                                       end;

                                       ParamByName('Empresa').Value            := DocumentosDetal[i].Empresa;//Empresa
                                       ParamByName('ClienteFornecedor').Value  := DocumentosDetal[i].CliForn;

                                       ParamByName('DocumentoPrincipal').Value := DocumentosDetal[0].Documento;
                                       ParamByName('OrigemPrincipal').Value    := DocumentosDetal[0].Origem;
                                       ParamByName('CliFornPrincipal').Value   := DocumentosDetal[0].CliForn;
                                       ParamByName('caixaprincipal').Value     := DocumentosDetal[0].Caixa;
                                       ParamByName('IndSubst').AsInteger       := FIndSubst;



                                       If (Length(DocumentosDetal) = 1) and (DocumentosDetal[I].Duplicata = '') then
                                         ParamByName('OutrosDoc').Value := 'N'
                                       else
                                         ParamByName('OutrosDoc').Value := 'S';


                                       for i3:=0 to Length(InformacaoDetal[i2 - 1].Campo) - 1 do begin
                                           ParamByName(InformacaoDetal[i2 - 1].Campo[i3]).DataType := InformacaoDetal[i2 - 1].Tipo[i3];
                                           if (VarIsEmpty(InformacaoDetal[i2 - 1].Valor[i3])) and (ParamByName(InformacaoDetal[i2 - 1].Campo[i3]).DataType <> FtString)  then
                                               ParamByName(InformacaoDetal[i2 - 1].Campo[i3]).Clear
                                           else
                                              ParamByName(InformacaoDetal[i2 - 1].Campo[i3]).Value    := VarAsType(InformacaoDetal[i2 - 1].Valor[i3],InformacaoDetal[i2 - 1].TipoVariant[i3]);
                                      end;
                                      execsql;

                          end;// fim do for das parcelas
                       end;//fim do with da query

                       If i = length(DocumentosDetal) - 1 then begin
                             SetLength(InformacaoDetal[i2 - 1].Campo,Length(InformacaoDetal[i2 - 1].Campo) + 1);
                             SetLength(InformacaoDetal[i2 - 1].CamposSubst,Length(InformacaoDetal[i2 - 1].CamposSubst) + 1);
                             SetLength(InformacaoDetal[i2 - 1].TipoVariant,Length(InformacaoDetal[i2 - 1].TipoVariant) + 1);
                             SetLength(InformacaoDetal[i2 - 1].Valor,Length(InformacaoDetal[i2 - 1].Valor) + 1);

                             InformacaoDetal[i2 - 1].Campo[Length(InformacaoDetal[i2 - 1].Campo) - 1]               := 'FormaPg';
                             InformacaoDetal[i2 - 1].TipoVariant[Length(InformacaoDetal[i2 - 1].TipoVariant) - 1]   := $0100;
                             InformacaoDetal[i2 - 1].Valor[Length(InformacaoDetal[i2 - 1].Valor) - 1]               := sgdetals.FieldValue['CODIGO',i2];
                             InformacaoDetal[i2 - 1].CamposSubst[Length(InformacaoDetal[i2 - 1].CamposSubst) - 1]   := 'FPagDest';
                       end;

                     end;//fim do for sgdetals
                  end;//fim do for dos documento

                 Try
                      Setup.ImpModLayout             := True;
                      Setup.FaixasLayoutImp          := '';
                      Setup.FlagLayoutImp            := 'FPG';
                      LayoutImp1.CriaParametros(Self);
                      If (LayoutImp1.FgridParams <> Nil) then LayoutImp1.FgridParams.Visible := False;
                      Setup.GridParamsSetup  := LayoutImp1.FgridParams;
                      I3 := 0;
                      i  := SgDetals.RowCount - 1;
                      RdPrint1.OpcoesPreview.Preview := False;
                      While (I >= 1) or RdPrint1.OpcoesPreview.Preview  do begin
                          If (SgDetals.FieldValue['LayoutImp',I] <> '')  Then begin
                              If I3 <> 2 Then
                                I3 := MensOpcoes('DESEJA IMPRIMIR A FORMA DE PAGAMENTO '+SgDetals.FieldValue['Descricao',I],
                                      ['Sim','Setup','Todos','Não','Cancelar']);

                              If I3 = 3 then begin
                                I := I - 1;
                                Continue;
                              end else If I3 = 4 then
                                Exit;

                              If Not RecuperaRegistroRdPrint(RdPrint1,'FormasdePagamento'+SgDetals.FieldValue['Grupo',I],True) or (I3 = 1) then begin
                                 Setup.FlagLayoutImp  := 'FPG';
                                 If Setup.SetupLayoutImp = '' Then Setup.SetupLayoutImp := sgdetals.FieldValue['LayoutImp',i];
                                 If Setup.GridParamsSetup <> Nil then
                                      GridParamsSetup.Visible := False;
                                 If Not SetupRdPrint(RdPrint1,True) then begin
                                    I := I - 1;
                                    Continue;
                                 end else if Not RdPrint1.OpcoesPreview.Preview then
                                    GravaRegistroRdPrint(RdPrint1,'FormasdePagamento'+SgDetals.FieldValue['Grupo',I]);
                              end;
                              LayoutImp1.Modelo := SetupLayoutImp;

                               With LayoutImp1 do begin
                                     Params.Clear;

                                     TParam(Params.Add).Name := 'PEMPRESA';
                                     TParam(Params.Add).Name := 'PCLIFORN';
                                     TParam(Params.Add).Name := 'PORIGEM';
                                     TParam(Params.Add).Name := 'PCAIXA';
                                     TParam(Params.Add).Name := 'PDOCUMENTO';
                                     TParam(Params.Add).Name := 'PVALOR';
                                     TParam(Params.Add).Name := 'PTOTAL';
                                     TParam(Params.Add).Name := 'PEMISSAO';

                                     Params.ParamByName('PEMPRESA').AsString   := DocumentosDetal[0].eMPRESA;
                                     Params.ParamByName('POrigem').AsString    := DocumentosDetal[0].Origem;
                                     Params.ParamByName('PCliforn').AsString   := DocumentosDetal[0].CliForn;
                                     Params.ParamByName('PCaixa').AsString     := DocumentosDetal[0].Caixa;
                                     Params.ParamByName('PDOCUMENTO').AsString := DocumentosDetal[0].Documento;
                                     Params.ParamByName('PVALOR').AsFloat      := StrtoFloatN(SgDetals.FieldValue['VALOR',I]);
                                     Params.ParamByName('PTOTAL').AsFloat      := StrtoFloatN(PNVLTOT.CAPTION);
                                     Params.ParamByName('PEMISSAO').AsDateTime := StrtoDateTime(Pagamento.Text);



                                     for i2:=0 to Length(InformacaoDetal[i - 1].Campo) - 2 do begin
                                       TParam(Params.Add).Name := 'P'+InformacaoDetal[i - 1].Campo[i2];
                                       Params.ParamByName('P'+InformacaoDetal[i - 1].Campo[i2]).DataType := InformacaoDetal[i - 1].Tipo[i2];
                                       Params.ParamByName('P'+InformacaoDetal[i - 1].Campo[i2]).Value    := InformacaoDetal[i - 1].Valor[i2];
                                     end;
                                end;

                                RdPrint1.Abrir;
                                LayoutImp1.Items.RefreshTabelas;
                                LayoutImp1.Imprime;
                                RdPrint1.Fechar;
                          end;
                          If Not RdPrint1.OpcoesPreview.Preview then
                            I := I - 1;
                          RdPrint1.OpcoesPreview.Preview := False;
                      end;
                   finally
                           Setup.ImpModLayout         := False;
                           Setup.SetupLayoutImp       := '';
                           Setup.FaixasLayoutImp      := '';
                           Setup.FlagLayoutImp        := '';
                           If (LayoutImp1.FgridParams <> Nil) and (LayoutImp1.FgridParams.Owner = Self) then begin
                               LayoutImp1.FgridParams.Parent := Nil;
                               LayoutImp1.FgridParams.Owner.Components[LayoutImp1.FgridParams.ComponentIndex].Destroy;
                               LayoutImp1.FgridParams := Nil;
                           end;
                           GridParamsSetup := Nil;
                   end;

        except
            on E: Exception do Begin
                                 Mensagem(E.Message+#13+'Problemas ao Gravar as Formas de Pagamento'
                                          +#13+' Por isso esta Operação foi abortada ');
                                 BitBtn4.Click;
                               End;
        end;

end;

procedure TFrm_Detals.FormasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =  13 then
   Formas.OnExit(Self);
end;

procedure TFrm_Detals.InformacoesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
qry : tquery;
dataaux : TDateTime;
dia,ano,mes:word;
begin
   if (informacoes.RowHeights[ARow] = -1)   then
     Canselect :=  False;

   if (Formas.FieldValue['TIPO',Formas.Row] <> 'DINHEI') and (Informacoes.cells[0,Informacoes.Row] = 'Cond.Pag') then
     Formas.FieldValue['CondPag',Formas.Row] := Informacoes.cells[9,Informacoes.Row];

   if (Formas.FieldValue['TIPO',Formas.Row] = 'CHEQUE') and (Informacoes.Row = 0)  then begin
       query1.sql.clear;
       query1.sql.add('Select Distinct Upper(NomeBanco) as Descricao From ChequeFinanceiro');
       query1.sql.add('Where Banco  = :Numero');
       query1.parambyname('Numero').AsString := Informacoes.Cells[01,00];
       query1.open;
       If Not Query1.eof then
        Informacoes.Cells[01,01] := query1.fieldbyname('Descricao').AsString;
   end;

   If (Informacoes.cells[0,Informacoes.Row] = 'Propietário')  then
     Informacoes.Cells[1,Informacoes.Row + 1] := Informacoes.Cells[9,Informacoes.Row];

{   if (Formas.FieldValue['TIPO',Formas.Row] = 'CARTAO')  then begin
       with query1 do begin
         If (Informacoes.Row <> 0) or (Informacoes.cells[1,0] = '') then
          exit;

          sql.clear;
          sql.add('Select DiaPagamento,PrazoPagamento,Percentual as Resultado' );
          sql.add('From   Operadora ');
          sql.add('Where  Codigo =:Codigo');
          ParamByName('Codigo').asstring := Informacoes.cells[1,0];
          open;

          If Eof then begin
            ShowMessage('Informe um operadora cadastrada');
            CanSelect := False;
            exit;
          end;

          If FieldByName('Resultado').asCurrency > 0 Then
             Informacoes.cells[1,10] := FloatToStr(StrToFloatn(ValorParcial.Text)* FieldByName('Resultado').asCurrency/100)
          Else
             Informacoes.cells[1,10] := '0';

{          decodedate(Date(),ano,mes,dia);
          If (Mes = 2) and ((FieldByName('PrazoPagamento').AsInteger > 28)  and  (Ano Mod 4 <> 0)) then
            Dia := 1
          else If (Mes = 2) and ((FieldByName('PrazoPagamento').AsInteger > 29)  and  (Ano Mod 4 = 0)) then
            Dia := 1
          else If (Mes in [4,6,9,11]) and (FieldByName('PrazoPagamento').AsInteger > 30) then
            Dia := 1
          else
            Dia := FieldByName('PrazoPagamento').AsInteger;

          dataaux :=       encodedate(ano,mes,Dia);}
{          Informacoes.cells[1,11] := dateTostr(StrtoDateTime(Pagamento.Text) + FieldByName('PrazoPagamento').AsInteger);
       end;

   end;}




{   if (Formas.FieldValue['TIPO',Formas.Row] <> 'CHEQUE') then
    exit;

  if (Informacoes.row <= 1) then begin
     query1.sql.clear;
     query1.sql.add('Select Desc_Bco From Banco');
     query1.sql.add('Where Numero_Bco  = :Numero');
     query1.parambyname('Numero').AsString := Informacoes.Cells[01,00];
     query1.open;
     if not query1.eof then
       Informacoes.Cells[01,01] := query1.fieldbyname('Desc_Bco').AsString;
  end;}

end;

function TFrm_Detals.NumeroSequencialDinheiro: Boolean;
var
i : integer;
begin
    result := false;

    if not (Formas.FieldValue['TIPO',Formas.Row] = 'DINHEI') then
     exit;

    for i:=1 to sgdetals.rowcount - 1 do begin
     if (sgdetals.FieldValue['CODIGO',i] = formas.FieldValue['CODIGO',formas.row]) and
        (sgdetals.FieldValue['TIPO',i]   = formas.FieldValue['TIPO',formas.row]) then
          begin
            sgdetals.cells[01,i] := formatfloat('#,##0.00',StrtoFloatN(sgdetals.cells[01,i]) + Strtofloatn(ValorParcial.Text));
            InformacaoDetal[i - 1].Valor[2] := StrtoFloatN(sgdetals.cells[01,i]);
            result := true;
          end;
    end;
                                     
end;

function TFrm_Detals.VerificaChaves(const VarTipo: String;Chaves :Array of String;
                                    VarInformacao:TInformacaoDetalhamento): Boolean;
var
i,i2 : integer;
varmensagem : string;
begin

  result := false;
  varmensagem := 'Duplicação';
  with query1 do begin
   sql.clear;
   sql.add('Select  ');
   sql.add(Chaves[0]);
   sql.add('From  '+VarTabela);
   sql.add('Where '+Chaves[0]+'= :'+Chaves[0]);

     for i:=1 to  Length(Chaves) - 1 do begin
        sql.add('And '+Chaves[i]+'= :'+Chaves[i]);
           for i2:=0 to Length(VarInformacao.Campo) - 1 do begin
                if Chaves[i] =  varinformacao.Campo[i2] then begin
                  if VarInformacao.Tipo[i2] = ftstring then
                    ParamByName(Chaves[i]).Value := VarInformacao.Valor[i2];

                  if (VarInformacao.Tipo[i2] = ftdate) or (VarInformacao.Tipo[i2] = fttime) then
                     ParamByName(Chaves[i]).AsDateTime := VarInformacao.Valor[i2];

                  if VarInformacao.Tipo[i2] = ftFloat then
                    ParamByName(Chaves[i]).AsFloat := VarInformacao.Valor[i2];
                  break;
               end;// fim do se
          end;// fim do 2º for
     end;// fim do 1º for
    open;

    if not eof then
     begin
       ShowMessage(VarMensagem);
       result := true;

     end;
  end;//Fim do With




end;

procedure TFrm_Detals.btExcluiDetalhamentoClick(Sender: TObject);
var
i : integer;
begin
   if SgDetals.Cells[00,SgDetals.Row] = '' then
    exit;

   If length(InformacaoDetal) > 1 then
     for i:=sgdetals.row - 1  to length(InformacaoDetal) - 2  do
      informacaodetal[i] :=  informacaodetal[i + 1];

   setlength(informacaodetal,length(InformacaoDetal) - 1);


   If SgDetals.FieldValue['Credito',SgDetals.Row] <> 'T' then begin
         PnInserido.Caption := FormatFloat('#,##0.00',StrtoFloatN(PnInserido.Caption) -
                               StrtoFloatN(SgDetals.Cells[01,SgDetals.Row]));
         PnFaltam.Caption := FormatFloat('#,##0.00',Abs(StrtoFloatN(PnVlTot.Caption) -
                             StrtoFloatN(PnInserido.Caption)));
   end else begin
         FVlCredito := FVlCredito - StrToFloatN(SgDetals.Cells[1,SgDetals.Row]);
         If SgDetals.FieldValue['Troco',SgDetals.RowCount - 1] <> 'T' then begin
            SgDetals.RowCount                                 := SgDetals.RowCount + 1;
            SgDetals.Cells[0,SgDetals.RowCount - 1]           := 'TROCO';
            SgDetals.FieldValue['Troco',SgDetals.RowCount - 1]:= 'T';
         end;
         SgDetals.Cells[1,SgDetals.RowCount - 1]           := FormatFloat('#,##0.00',StrtoFloatN(PnFaltam.Caption) - FVlCredito);
   end;


   SgDetals.deletalinha(SgDetals.Row);
   BtOk.Enabled := StrtoFloatN(PnInserido.Caption) >= StrtoFloatN(PnVlTot.Caption);

   If (StrtoFloatN(PnInserido.Caption) <= StrtoFloatN(PnVlTot.Caption))
      and (SgDetals.FieldValue['TROCO',SgDetals.RowCount - 1] = 'T') then begin
       SgDetals.deletalinha(SgDetals.RowCount - 1);
       for i:=SgDetals.RowCount - 1 downto 1 do
          If SgDetals.FieldValue['Credito',I] = 'T' then
            SgDetals.deletalinha(I);
   end;


//   BtAltera.Enabled := Length(InformacaoDetal) > 0;


   If Sender = btExcluiDetalhamento then begin
          Formas.MontaGridDataSet(QryFormaPagamento,0);
          Label2.Caption        := IIfs(StrtoFloatN(PnVlTot.Caption) > (retornavalortotaldogrid(['+'],[1],SgDetals,1)),'Faltam','Troco/Credito');
          PnFaltam.Font.Color   := IIfs(Label2.Caption = 'Faltam',ClRed,ClBlue);
          ValorParcial.Text := PnFaltam.Caption;
          Informacoes.Limpa;
          Informacoes.DeletaCombos;
          NomeDetal.Caption := 'Forma de Pagamento';
          ValorParcial.SetFocus;
          BtExcluiDetalhamento.enabled := Length(InformacaoDetal) > 0;
          BtAltera.Enabled := False;
   end;



{   if SgDetals.Cells[00,SgDetals.Row] = '' Then
     BtExcluiDetalhamento.enabled := false;}


end;

procedure TFrm_Detals.FormCreate(Sender: TObject);
var
   Reg: TRegistry;
   Modulo: TModulos;
begin


  
   FVLCREDITO  := 0;
   FVLCREDINI  := 0;
   SgDetals.Cells[00,00]  := 'Forma de Pagamento';
   SgDetals.Cells[1,00]   := 'Valor Pago';
   Fmenstef := TstringList.Create;
   HabilitaTEF := False;
  try
    Reg := TRegistry.Create;
    { Define a chave-raiz do registro }

    Reg.RootKey := HKEY_CURRENT_USER;

    { Se existir a chave (path)... }
    if Reg.KeyExists('Sistemas\Precision\Safi\Modulos') then
    begin

            { Abre a chave (path) }
            Reg.OpenKey('Sistemas\Precision\Safi\Modulos', false);

            { Se existir o valor... }
            if Reg.ValueExists('Dados') then
            begin

              Reg.ReadBinaryData('Dados', Modulo, SizeOf(Modulo));

              If (Modulo.Tef.Instalado = 'S') and (FindWindow(Pchar('TPropertyInspector'),PChar('Object Inspector')) <> 0)  Then begin
                  HabilitaTEF := True;
                  //Tef1 := TTef.Create(Self);

                  //if not Tef1.CheckGerenciador then begin
                  //  Tef1 := Nil;
                  //  Mensagem('Não foi possível ativar o Gerenciador Padrão');
                  //end;
             end;

            end;
      end;
  finally
    Reg.Free;
  end;

end;

procedure TFrm_Detals.FormasGetCellColor(Sender: TObject; ARow,
  Acol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
   if arow = 0 then
    begin
      AFont.Style := [FsBold];
      AFont.Color := ClWhite;
    end;
end;

procedure TFrm_Detals.InformacoesGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
    If not Acol = 1 then
     exit;

    if (Copy(Informacoes.cells[3,ARow],1,1) = 'D') then
       Value :=  '99/99/99;1';

    if (Copy(Informacoes.cells[3,ARow],1,1) = 'H') then
       Value :=  '99:99;1';
end;

procedure TFrm_Detals.SgDetalsGetCellAlignment(Sender: TObject; ARow,
  ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
   If aCol = 1 Then HorAlignment := taRightJustify;
end;

procedure TFrm_Detals.InformacoesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if not ((Key = VK_F2) and (Formas.FieldValue['TIPO',Formas.Row] = 'CHEQUE')) then
      exit;

    if (Informacoes.row = 0) then
      MontaPesquisa(TWinControl(Sender),'CHEQUEBANCO','CHEQUEFINANCEIRO','nomebanco > ''''',CondPAg.BancodeDados);

    if (Informacoes.row = 2) then
      MontaPesquisa(TWinControl(Sender),'AGENCIA','','Cod_Bco = '''+Informacoes.Cells[01,00] + '''',CondPAg.BancodeDados);

    if (Informacoes.row = 3) then
      MontaPesquisa(TWinControl(Sender),'CONTA','','Cod_Bco_Conta = '''+Informacoes.Cells[01,00] +''''+' And Cod_Age_Conta = '''+Informacoes.Cells[01,02]+''''
        ,CondPAg.BancodeDados);
end;

procedure TFrm_Detals.PagamentoExit(Sender: TObject);
begin
   if pagamento.text = '  /  /  ' then
    ShowMessage('Campo  Obrigatório')
   else
    BtOk.SetFocus;
end;

procedure TFrm_Detals.GeraBaixaParcialExit(Sender: TObject);
begin
   if btok.enabled then btok.setfocus;
end;

procedure TFrm_Detals.InformacoesEnter(Sender: TObject);
begin
   Informacoes.COL := 1;
end;

procedure TFrm_Detals.BtAlteraClick(Sender: TObject);
begin
  BtExcluiDetalhamento.OnClick(Sender);
  BtIncluiDetalhe.Onclick(sender);
  BtExcluiDetalhamento.enabled := Length(InformacaoDetal) > 0;
  BtAltera.Enabled := False;
end;

procedure TFrm_Detals.SgDetalsExit(Sender: TObject);
var
i:integer;
begin
{   If SgDetals.Cells[0,1] = '' then
    exit;

   For  i:=1 to Formas.RowCount - 1  do begin
       If Formas.Cells[1,I] = sgdetals.cells[2,SgDetals.Row] then begin
          ValorParcial.Text :=    FormatFloat('#,##0.00',StrToFloatN(sgdetals.cells[1,SgDetals.Row]));
          Formas.Row := I;
          Formas.OnExit(Sender);
          Break;
       end;
   end;

   For i:=0 to Informacoes.RowCount - 1 do
       Informacoes.Cells[1,I] := VarToStr(InformacaoDetal[SgDetals.Row - 1].Valor[i]);}
  BtAltera.Enabled              :=   SgDetals.cells[0,SgDetals.Row] <> '';
  BtExcluiDetalhamento.Enabled :=   SgDetals.cells[0,SgDetals.Row] <> '';

end;

procedure TFrm_Detals.ValorParcialExit(Sender: TObject);
Var i : integer;
begin
  If Length(InformacaoDetal) = 0 then
   exit;

  For i:=0 to Informacoes.RowCount - 1 do begin
   If Uppercase(Informacoes.cells[2,I]) = 'VALOR' then
    Informacoes.cells[1,i] := ValorParcial.Text;
  end;
end;

procedure TFrm_Detals.InformacoesKeyPress(Sender: TObject; var Key: Char);
begin
{    If (Key = #13) Then Begin
         If (Formas.Cells[02,Formas.Row] = 'CHEQUE') And (7 = Informacoes.Row) Then
               Self.Perform(WM_NEXTDLGCTL,0,0)
         Else If (Formas.Cells[02,Formas.Row] = 'CARTAO') And (5 = Informacoes.Row) Then
               Self.Perform(WM_NEXTDLGCTL,0,0);
         Exit;
    End;}

{    If (Key = #13) and (Informacoes.row = Informacoes.rowCount - 1) then
      If Informacoes.Cells[1,Informacoes.row] = '' then
        Self.Perform(WM_NEXTDLGCTL,0,0)
      else begin
        Informacoes.RowHeights[Informacoes.row] := Informacoes.RowHeights[Informacoes.row] + Informacoes.DefaultRowHeight;
        TStringgRid
        Informacoes.top
//        SysUtils.Abort;
      end;}

     If (Key <> #8) And (Informacoes.Cells[5,Informacoes.Row] <> '') and
        ((Length(Informacoes.Cells[1,Informacoes.Row]) >= StrToFloatN(Informacoes.Cells[5,Informacoes.Row]))) then
           Key := #0;
end;

procedure TFrm_Detals.BtCancParcelasClick(Sender: TObject);
var i:integer;
begin
   CondPag.Ativa;
   CondPag.Codigo := SgDetals.FieldValue['CONDPAG',SgDetals.Row];
   CondPag.Recupera;

   If Length(ParcelasCheques) = 0 then 
     SgDetals.Row := SgDetals.Row + (CondPag.Parcelas - StrToInt(SgDetals.FieldValue['PARCELA',SgDetals.Row]));


   For i:=1 to CondPag.Parcelas do begin
     BtExcluiDetalhamento.OnClick(BtExcluiDetalhamento);
     If SgDetals.Row <> 1 then
        SgDetals.Row := SgDetals.Row - 1;
   end;

  SetLength(ParcelasCheques,0);
  BtCancParcelas.Visible       := false;
//  BtGeraParcelaCheque.Visible  := false;
  LbParcela.Visible := False;
  BtExcluiDetalhamento.Visible := True;
  BtAltera.Visible            := True;
end;

procedure TFrm_Detals.BtGeraParcelaChequeClick(Sender: TObject);
Var Loop,nParcelas : Word;
begin
     If (Informacoes.Cells[1,0] = '') Or (Informacoes.Cells[1,5] = '') Then Begin
        ShowMessage('Informações incompletas');
        Informacoes.SetFocus;
        Exit;
     End;

      With CondPag do begin
         CondPag.Ativa;
         CondPag.Codigo := Formas.cells[05,Formas.Row];
         CondPag.Recupera;
         nParcelas := CondPag.Parcelas;
         For Loop := 1 To nParcelas Do
               btIncluiDetalhe.Click;
      End;
end;

procedure TFrm_Detals.SgDetalsClick(Sender: TObject);
var
i:integer;
begin
    If (SgDetals.Cells[0,1] = '') then
     exit;


   btExcluiDetalhamento.Enabled  :=  SgDetals.FieldValue['TROCO',SgDetals.Row] <> 'T';
   BtAltera.Enabled              :=  SgDetals.FieldValue['TROCO',SgDetals.Row] <> 'T';
   BtIncluiDetalhe.Caption       :=  IIfs(SgDetals.FieldValue['TROCO',SgDetals.Row] = 'T','Credito<Tecle Insert>','Incluir<Tecle Insert>') ;
   BtIncluiDetalhe.Tag           :=  IIfs(SgDetals.FieldValue['TROCO',SgDetals.Row] = 'T',1,0) ;

   If SgDetals.FieldValue['TROCO',SgDetals.Row] = 'T' then begin
      ValorParcial.Text :=  FormatFloat('#,##0.00',StrToFloatN(sgdetals.cells[1,SgDetals.Row]));
      NomeDetal.Caption := 'Forma de Pagamento';
      Informacoes.Limpa;
      exit;
   end;

   For  i:=1 to Formas.RowCount - 1  do begin
       If Formas.FieldValue['CODIGO',I] = sgdetals.FieldValue['CODIGO',SgDetals.Row] then begin
          ValorParcial.Text :=    FormatFloat('#,##0.00',StrToFloatN(sgdetals.cells[1,SgDetals.Row]));
          Formas.Row := I;
          Formas.OnExit(Sender);
          Break;
       end;
   end;

   For i:=0 to Informacoes.RowCount - 1 do BEGIN
     If (Informacoes.GetCombo[1,I] = Nil) or (TComboSql(Informacoes.GetCombo[1,I]).Style = csDropDown) then
          Informacoes.Cells[1,I] := VarToStr(InformacaoDetal[SgDetals.Row - 1].Valor[i])
     else
          Informacoes.Cells[9,I] := VarToStr(InformacaoDetal[SgDetals.Row - 1].Valor[i]);
     If Informacoes.GetCombo[1,I] <> Nil then
        Informacoes.Cells[1,I] := VarToStr(InformacaoDetal[SgDetals.Row - 1].DescValor[i]);
  END;       

end;

procedure TFrm_Detals.SgDetalsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
     Informacoes.SetFocus;
end;

procedure TFrm_Detals.InformacoesExit(Sender: TObject);
begin
    If (BtAltera.Enabled) and (ActiveControl = Informacoes) then
     BtAltera.SetFocus;
end;

procedure TFrm_Detals.FormDestroy(Sender: TObject);
begin
   FmensTef.Destroy;
   if Tef1 <> Nil then
     Tef1.Destroy;
end;

procedure TFrm_Detals.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = Vk_Insert) and BtIncluiDetalhe.Enabled then begin
           If (NomeDetal.Caption = 'Forma de Pagamento') then
               Formas.OnExit(Self);
           BtIncluiDetalhe.Onclick(BtIncluiDetalhe);
           SysUtils.Abort;
    end;

    if ((Key = Vk_Delete) and (Shift = [ssCtrl])) and BtExcluiDetalhamento.Enabled then begin
         BtExcluiDetalhamento.Onclick(BtExcluiDetalhamento);
         SysUtils.Abort;
    end;

    if ((Key = Vk_Insert) and (Shift = [ssCtrl])) and BtAltera.Enabled then begin
         BtAltera.Onclick(BtAltera);
         SysUtils.Abort;
    end;



end;

procedure TFrm_Detals.FormasMontaGridDataSet(var DadosGrid: TDadosgrid;
  var DeletaLinha: Boolean);
begin
   If DadosGrid.field = 'CONTA' then
    If (QryFormaPagamento.FieldByName('Conta').AsString = '') and (QryFormaPagamento.FindField('ContaIni') <> Nil) then
      DadosGrid.Valor := QryFormaPagamento.FieldByName('ContaIni').AsString;

   If DadosGrid.Field = 'DESCCONTA' then
    If (QryFormaPagamento.FieldByName('Conta').AsString = '') then
      DadosGrid.Valor := QryFormaPagamento.FieldByName('DescContaIni').AsString;

   If Not FSoCredito and (StrtoFloatN(PnVlTot.Caption) >= StrtoFloatN(PnInserido.Caption))  
   and QryFormaPagamento.FieldByName('Credito').AsBoolean  then
          DeletaLinha := True;
end;

procedure TFrm_Detals.InformacoesGetCellColor(Sender: TObject; ARow,
  Acol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
   if acol = 0 then
    begin
      AFont.Style := [FsBold];
      AFont.Color := ClWhite;
    end;
end;

end.

  {  sgdetals.FieldValue[2,sgdetals.rowcount - 1] := formas.cells[1,formas.row];
  sgdetals.cells[3,sgdetals.rowcount - 1] := formas.cells[2,formas.row];
  If Formas.Cells[2,Formas.Row] = 'CHEQUE' then
    sgdetals.cells[4,sgdetals.rowcount - 1] := 'CHEQUEFINANCEIRO'
  else if Formas.Cells[2,Formas.Row] = 'CARTAO' then
    sgdetals.cells[4,sgdetals.rowcount - 1] := 'CARTAOFINANCEIRO'
  else
    sgdetals.cells[4,sgdetals.rowcount - 1] := 'OUTROSFINANCEIRO';
  sgdetals.cells[5,sgdetals.rowcount - 1] := formas.cells[3,formas.row];
  sgdetals.cells[6,sgdetals.rowcount - 1] := formas.cells[5,formas.row];//parcelas

  If Length(ParcelasCheques) <> 0 then
    sgdetals.cells[8,sgdetals.rowcount - 1] := IntToStr(CondPag.Parcela);

   sgdetals.cells[9,sgdetals.rowcount - 1]  := formas.cells[6,formas.row];
   sgdetals.cells[10,sgdetals.rowcount - 1] := formas.cells[7,formas.row];
   sgdetals.cells[11,sgdetals.rowcount - 1] := formas.cells[8,formas.row];
   sgdetals.cells[12,sgdetals.rowcount - 1] := formas.cells[9,formas.row];}


