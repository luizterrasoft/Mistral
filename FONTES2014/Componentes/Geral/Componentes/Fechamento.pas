unit Fechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, PanelControle, StdCtrls, EditControle, Buttons, Grids,
  GridControl, Pesquisa, Db, DBTables,Registro,CondPag,FuncoesGlobais,FechamentoFinanc,
  VariaveisSafi,Funcoes_Estoque;

type


  TFrm_Fechamento = class(TForm)
    CondicoesPagamento: TGridControl;
    Parcelas: TGridControl;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    Label5: TLabel;
    btOK: TBitBtn;
    BtCancel: TBitBtn;
    Label9: TLabel;
    ValorDesconto: TEditControle;
    ValorParcelado: TEditControle;
    ValorPago: TEditControle;
    Troco: TEditControle;
    Vendedor: TEditControle;
    NomeVendedor: TPanelControle;
    PesqVend: TPesquisa;
    Query1: TQuery;
    CondPag: TCondPag;
    BDuplicata: TBitBtn;
    Label1: TLabel;
    ValorTotal: TPanelControle;
    Label3: TLabel;
    TotalDesconto: TPanelControle;
    PercentualDesconto: TEditControle;
    BtInf: TBitBtn;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ValorPagoExit(Sender: TObject);
    procedure FormasPagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CondicoesPagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CondicoesPagamentoClick(Sender: TObject);
    procedure CondicoesPagamentoExit(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDuplicataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ParcelasGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure PercentualDescontoExit(Sender: TObject);
    procedure ValorDescontoExit(Sender: TObject);
    procedure CondicoesPagamentoGetCellColor(Sender: TObject; ARow,
      Acol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ParcelasEnter(Sender: TObject);
    procedure ParcelasGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure ParcelasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtInfClick(Sender: TObject);
    procedure ValorPagoEnter(Sender: TObject);
    procedure CondicoesPagamentoEnter(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure ValorPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    ValorPagoDesconto : Currency;
    duplicatafinanceira  : string;
    Fenter:Boolean;
    procedure abreteladeinfComp;

    { Private declarations }
  public
    VarVAlorParcial     : Currency;
    documentofinanceiro : string;
    PagrecFechamento    : TPagouRec;
    clifornfechamento   : String;
    fCondPagIni,FechamentoFormaPag  : String;
    Duplicata: String;
    VencDuplicata:TDateTime;
    Empresa:String;
    FDataEmissao:TDateTime;
    { Public declarations }
  end;

var
  Frm_Fechamento: TFrm_Fechamento;
  VarInfComplementarParcela : TInfComplementar;

implementation

uses InfComplementar, RedDuplicata;

{$R *.DFM}

procedure TFrm_Fechamento.FormCreate(Sender: TObject);
begin
   Condicoespagamento.cells[00,00] := 'Condiçoes de Pagmento';
   Parcelas.cells[00,00]           := 'Documentos';
   Parcelas.cells[01,00]           := 'Vencimento';
   Parcelas.cells[02,00]           := 'Valor';
   Parcelas.MovimentaCelula        := True;
   Fenter := False;
   //   valordesconto.text              := FloatToStr(Desconto);
end;

procedure TFrm_Fechamento.ValorPagoExit(Sender: TObject);
var
OldOptions : Set of TgridOption;
begin
   ValorPagoDesconto := VarVAlorParcial - (StrtoFloatn(ValorDesconto.Text) +
                                                      (Varvalorparcial * (strtofloatn(percentualdesconto.text)/100)));
{   If ValorPagoDesconto = StrtoFloatn(ValorPago.text) then
    Begin
     Troco.Text := '0,00';
     ValorParcelado.Text := '0,00';
     Parcelas.Limpa;
     CondicoesPagamento.Row := -1;
     exit;
    end;}


   If StrtoFloatn(ValorPago.text) >=  StrtoFloatN(TotalDesconto.Caption)  then
    begin
      Troco.Text          := FormatFloat('#,##0.00',StrtoFloatn(ValorPago.text) - valorpagodesconto);
      ValorParcelado.Text := '0,00';
      Parcelas.Limpa;
      If (CondicoesPagamento.Tag <> 1) then
        CondicoesPagamento.Row := 1;
    end
   else begin
      Troco.Text          := '0,00';
      ValorParcelado.Text := FormatFloat('#,##0.00',valorpagodesconto - StrtoFloatn(ValorPago.text));
      if (CondicoesPagamento.Row = 1) and (CondicoesPagamento.Tag <> 1) then begin
          if (FCondPagIni <> '') and (CondicoesPagamento.Cols[1].IndexOf(FcondPagIni) > -1) and FEnter then begin
             CondicoesPagamento.Row := CondicoesPagamento.Cols[1].IndexOf(FcondPagIni);
             CondicoesPagamento.OnExit(Sender);
             Fenter := False;
             If Not CondPag.ParcAberta then
                BtOk.SetFocus;
          end else
             condicoesPagamento.setfocus;
      end;   
         
  end;


//   If ValorPagoDesconto > StrtoFloatn(ValorPago.text) then
  //  begin

end;

procedure TFrm_Fechamento.FormasPagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = 13 then
   percentualdesconto.setfocus;

  if key = Vk_F3 then
    abreteladeinfComp;
end;

procedure TFrm_Fechamento.CondicoesPagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key <> 13)  then
   exit;

   If CondicoesPagamento.Tag = 1 then begin
        PercentualDesconto.SetFocus;
        exit;
   end;

   if (StrtoFloatN(ValorParcelado.Text) <> 0)  then begin
            if (CondicoesPagamento.Row = 1) then
              ValorPago.setfocus
           else if CondPag.ParcAberta then
              Parcelas.SetFocus
            else begin
                If Vendedor.Visible then
                  Vendedor.SetFocus
                else
                  BtOk.SetFocus;
            end;
   end else valorpago.setfocus;
end;

procedure TFrm_Fechamento.CondicoesPagamentoClick(Sender: TObject);
begin

{  if (StrtoFloatn(ValorPago.text) = 0) then
    exit;

   If ValorPagoDesconto <= StrtoFloatn(ValorPago.text) then
    begin
      ShowMessage('Para Inserir alguma condição de pagamento '+#13+
                  'O valor pago tem que ser menor que o valor a pagar com desconto');
      ValorPago.Setfocus;
    end;}

end;

procedure TFrm_Fechamento.CondicoesPagamentoExit(Sender: TObject);
var
i,Linha : integer;
Valores : TTipoCondA;
begin
          If (activecontrol = BtCancel) or (CondicoesPagamento.Tag = 1) or (ValorPagoDesconto <= StrtoFloatn(ValorPago.text))  then
           exit;

            LimpaGrid(Parcelas);

            If CondicoesPagamento.Row = 1 then begin
                 If (StrToFloatN(ValorParcelado.Text) <> 0) and (ActiveControl <> BtCancel) then begin
                      MessageDlg('Valor Pago menor que o Total'+#13+'Condição de Pagamento Obrigatória',mterror,[mbok],0);
                      ValorPago.SetFocus;
                 end;
                 exit;
            end;


           CondPag.Ativa;
           CondPag.Codigo := CondicoesPagamento.Cells[01,CondicoesPagamento.Row];
           CondPag.Recupera;

           if CondPag.GetAVista(StrtoFloatN(TotalDesconto.CAption)) <> 0 then
             ValorPago.Text      := FormatFloat('#,##0.00',CondPag.GetAVista(StrtoFloatN(TotalDesconto.CAption)));

           ValorParcelado.Text  := FormatFloat('#,##0.00',StrtoFloatN(TotalDesconto.Caption) - StrtoFloatn(ValorPago.text));
           Parcelas.incluiLinha := CondPag.ParcAberta;
           Parcelas.SaiEmBranco := CondPag.ParcAberta;
           Parcelas.CtrlDelete  := CondPag.ParcAberta;
           If CondPag.ParcAberta then begin
             Parcelas.SetFocus;
             exit;
           end;

           If CondPag.Parcelas = 0 then begin
             ShowMessage('Número de Parcelas Zerado. '+#13+'Não é possível gerar esta parcela.');
             exit;
           end;

           Valores  := GeraParcelas(CondPag.Codigo,'',StrtoFloatN(ValorParcelado.Text),FDataEmissao,CondPag.BancoDeDados);

           For i := 1 To CondPag.Parcelas do
             begin
              if i <> 1 then
                Parcelas.RowCount := Parcelas.RowCount + 1;
                If Not((CondPag.Parcelas = 1) and (StrtoFloatN(ValorPago.Text) = 0)) then 
                 Parcelas.Cells[0,i] := Valores[i-1].Documento; //cDoc;
                Parcelas.Cells[1,i] := FormatDateTime('dd/mm/yy',Valores[i-1].Data);
                Parcelas.Cells[2,i] := FormatFloat('#,##0.00',Valores[i-1].Valor);
                Linha:=linha + 1;
            end;


end;

procedure TFrm_Fechamento.VendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
     MontaPesquisa(TWinControl(Sender),'VENDEDOR','','CdEmpresa =  '''+Empresa+'''',Nil);
end;

procedure TFrm_Fechamento.BDuplicataClick(Sender: TObject);
var
duplicatalocal,tabelasql,CampoCliForn: string;
begin
        Frm_RedDuplicata := TFrm_RedDuplicata.Create(Application);
        Frm_RedDuplicata.PagRec := PaGRecToStr(PagrecFechamento);
        Frm_RedDuplicata.Duplicata.Obrigatorio := (PaGRecToStr(PagrecFechamento) = 'R');
        Frm_RedDuplicata.ClienteFornecedor := CliFornFechamento;
        Frm_RedDuplicata.Sequencial1.Campos[0].Valor := Empresa;
        try
         if Frm_RedDuplicata.ShowModal <> mrok then
          exit;

         if Frm_RedDuplicata.Duplicata.Text = '' then
                Frm_RedDuplicata.Sequencial1.GeraSequencial
         else if PagRecFechamento = Recebimento then begin
            with query1 do begin
                   sql.clear;
                   sql.add('Select Cliente_Duplicata From Duplicata');
                   sql.add('Where Empresa           =:Empresa');
                   sql.add('And   NFatura_Duplicata =:Duplicata');
                   params[0].asstring := empresa;
                   params[1].asstring := Frm_RedDuplicata.Duplicata.Text;
                   open;

                   If (Not Eof) and (Query1.FieldByName('Cliente_Duplicata').AsString <> CliFornFechamento) then begin
                     showmessage('Duplicata já pertence a outro Cliente');
                     SysUtils.Abort;
                   end;
            end;
         end;

         Duplicata := Frm_RedDuplicata.Duplicata.Text;
         vencduplicata := StrToDateTime(Frm_RedDuplicata.Vencimento.Text);
         self.close;

        finally
          Frm_RedDuplicata.Free;
        end;






end;

procedure TFrm_Fechamento.FormShow(Sender: TObject);
begin
   duplicatafinanceira  := DocumentoFinanceiro;
   if not vendedor.enabled then


end;

procedure TFrm_Fechamento.ParcelasGetCellAlignment(Sender: TObject; ARow,
  ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
   If aCol = 2 Then HorAlignment := taRightJustify;
end;

procedure TFrm_Fechamento.PercentualDescontoExit(Sender: TObject);
begin
   TotalDesconto.caption := formatfloat('#,##0.00',VarVAlorParcial - (StrtoFloatn(ValorDesconto.Text) +
                                                      (Varvalorparcial * (strtofloatn(percentualdesconto.text)/100))));
end;

procedure TFrm_Fechamento.ValorDescontoExit(Sender: TObject);
begin
   TotalDesconto.caption := formatfloat('#,##0.00',VarVAlorParcial - (StrtoFloatn(ValorDesconto.Text) +
                                                      (Varvalorparcial * (strtofloatn(percentualdesconto.text)/100))));
end;

procedure TFrm_Fechamento.abreteladeinfComp;
begin
end;

procedure TFrm_Fechamento.CondicoesPagamentoGetCellColor(Sender: TObject;
  ARow, Acol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
     If Arow = 0 then
      begin
        AFont.Color   := ClWhite;
        AFont.Style   := [FsBold];
      end;
end;

procedure TFrm_Fechamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Vk_F3 then
    abreteladeinfComp;

  if (Shift = [SSCtrl]) And (Key = 80) then
    Parcelas.SetFocus;

end;

procedure TFrm_Fechamento.ParcelasEnter(Sender: TObject);
begin
   if (Parcelas.Cells[00,00] = '') or (CondicoesPagamento.Row = 0) then
     Vendedor.SetFocus;
end;

procedure TFrm_Fechamento.ParcelasGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
    If Acol = 1 then
     Value := '99/99/99;1';
end;

procedure TFrm_Fechamento.ParcelasSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var letra1,Letra2:string;
    TotalGrid:Double;
    I:Word;
begin

        If CondicoesPagamento.Row = 0 then
         exit;

       if (Parcelas.Col = 1)  then
        begin
            If ((Parcelas.Cells[1,Parcelas.Row] = '') or  (Parcelas.Cells[1,Parcelas.Row] = '  /  /  ')) then begin
              Mensagem('Data Obrigatória');
              Canselect := False;
              Exit;
            end;

            If CondPag.Ajusta and (Dayofweek(StrtoDateTime(Parcelas.Cells[1,Parcelas.Col])) in [1,7]) then begin
                Mensagem('Vencimento não pode ser no final de semana');
                Canselect := False;
                Exit;
            end;

        end;



       if  (Parcelas.Col = 2) and (StrToFloatN(Parcelas.Cells[2,Parcelas.Row]) = 0) then
        begin
          Mensagem('Valor Obrigatório');
          Canselect := False;
          Exit;
       end;


     if (CondPag.ParcAberta) and (ACol = 0) and (Parcelas.Cells[0,Arow] = '') and   (StrtoFloatN(ValorParcelado.Text) > retornavalortotaldogrid(['+'],[2],Parcelas,1))   then begin
               Letra1  := Chr(65 + ((ARow - 1) Mod 26) );
               Letra2  := Chr(((ARow - 1) div 26 )* 65);
               Parcelas.cells[0,ARow] :=  Letra1 + IIfs(Letra2<>#0,Letra2,'');
               If (Arow = 1) then begin
                   if CondpAg.PrazoI <> 0 then
                     Parcelas.cells[1,ARow] := FormatDateTime('dd/mm/yy',FDataEmissao + CondpAg.PrazoI)
               end else If (CondPag.VariaPorMes) then
                  Parcelas.cells[1,ARow] := formatdatetime('dd/mm/yy',Incmonth(strtodatetime(Parcelas.cells[1,ARow - 1]),1))
               else if CondPag.Variacao <> 0 then
                  Parcelas.cells[1,ARow] := formatdatetime('dd/mm/yy',strtodatetime(Parcelas.cells[1,ARow - 1]) + CondpAg.Variacao);

                If (Parcelas.cells[1,ARow] <> '') and CondPag.Ajusta and (Dayofweek(StrtoDateTime(Parcelas.Cells[1,Parcelas.Col])) in [1,7]) then begin
                    If Dayofweek(StrtoDateTime(Parcelas.Cells[1,Parcelas.Col])) = 1 then
                      Parcelas.cells[1,ARow] := formatdatetime('dd/mm/yy',strtodatetime(Parcelas.cells[1,ARow]) + 1)
                    else
                      Parcelas.cells[1,ARow] := formatdatetime('dd/mm/yy',strtodatetime(Parcelas.cells[1,ARow]) + 2);
               end;
               If StrtoFloatN(ValorParcelado.Text) - retornavalortotaldogrid(['+'],[2],Parcelas,1) >= 0 then
                 Parcelas.cells[2,ARow] :=  formatfloat('#,##0.00',StrtoFloatN(ValorParcelado.Text) - retornavalortotaldogrid(['+'],[2],Parcelas,1));
               Parcelas.col := 1;
               exit;
      end;

      if (Parcelas.Col = 0)  and (CondicoesPagamento.row > 1) and VerificaDuplicidadeGrid(Parcelas,[0]) then begin
           Mensagem('Dado duplicado');
           canselect := false;
           exit;
      end;
end;

procedure TFrm_Fechamento.BtInfClick(Sender: TObject);
begin
    Frm_informacaocomplementar := TFrm_informacaocomplementar.Create(application);
     try
             frm_informacaocomplementar.Conta.ValorChave(VarInfComplementarParcela.Conta);
             frm_informacaocomplementar.Situacao.ValorChave(VarInfComplementarParcela.Situacao);
             frm_informacaocomplementar.Categoria.ValorChave(VarInfComplementarParcela.Categoria);
             frm_informacaocomplementar.SubCategoria.ValorChave(VarInfComplementarParcela.SubCategoria);

             if frm_informacaocomplementar.showmodal <> mrok then
                exit;
             If Frm_InformacaoComplementar.conta.itemindex <> -1 Then
                 VarInfComplementarParcela.Conta        := frm_informacaocomplementar.Conta.ValorRetorno;
             If Frm_InformacaoComplementar.situacao.itemindex <> -1 Then
                 VarInfComplementarParcela.Situacao     := frm_informacaocomplementar.Situacao.ValorRetorno;
             If Frm_InformacaoComplementar.categoria.itemindex <> -1 Then
                 VarInfComplementarParcela.Categoria    := frm_informacaocomplementar.Categoria.ValorRetorno;
             If Frm_InformacaoComplementar.subcategoria.itemindex <> -1 then
                 VarInfComplementarParcela.SubCategoria :=  frm_informacaocomplementar.SubCategoria.ValorRetorno;
     finally
             frm_informacaocomplementar.free;
     end;


    //    Parcelas.SetFocus;
end;

procedure TFrm_Fechamento.ValorPagoEnter(Sender: TObject);
begin
     If (StrToFloatN(ValorPago.Text) = 0) and ((CondicoesPagamento.Row = 1) or (CondicoesPagamento.Tag = 1))  then
       ValorPago.Text := TotalDesconto.Caption;

     If (StrToFloatN(ValorPago.Text) <> 0) then
      ValorPago.SelectAll;
end;

procedure TFrm_Fechamento.CondicoesPagamentoEnter(Sender: TObject);
begin
  If (CondicoesPagamento.Tag <> 1) And (StrToFloatN(ValorPago.Text) >= ValorPagoDesconto) then
    BtOk.SetFocus;
end;

procedure TFrm_Fechamento.btOKClick(Sender: TObject);
begin
     If (CondicoesPagamento.Tag = 1)  and (StrtoFloatN(ValorPago.Text) = 0) then begin
         Mensagem('Valor Pago Obrigatório');
         ValorPago.SetFocus;
         Exit;
     end;
     Modalresult := mrok;
end;

procedure TFrm_Fechamento.ValorPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Fenter := key = vk_return; 
end;

end.
