unit FuncPrint;

interface
Uses Forms,Classes,QuickRpt,QrpPrev,QRPrntr,Printers,Dialogs,SysUtils
    ,Buttons,Qrctrls,Db,Graphics,SetupGraf,Registry;
Type
    TConfigPrint = record
        Zoom : Integer;
        Orientation    : Integer;
        Preview        : Boolean;
        QtdVias        : Word;
        VerificaTamanho: Boolean;
        Modal          : Boolean;
        ParamGraf      : Boolean;
    end;

    TJanelas = record
        Nome  : String;
        Instancia : Word;
        OldOnClose : TCloseEvent;
    End;

procedure ImpRelatorio(Relatorio : TQuickRep;JanelaPai : TForm);
procedure RelatorioPreview(Sender: TObject);
Function  AchaPos(Value : String) : SmallInt;
Function  CriaSubDetail(Titulo:String;Relatorio:TQuickRep;FDataSet:TDataSet):TQrSubDetail;
PROCEDURE configurarelatorio(var VRelatorio:TQuickRep);

Var CPrint  : TConfigPrint;
    Janelas : Array of TJanelas;
    TamanhoJanela : Word;
    FirstImpFuncPrint:Boolean;
    ImpFuncPrint     :String;
implementation


procedure ImpRelatorio(Relatorio : TQuickRep;JanelaPai : TForm);
Var nPosicao,Loop,Loop2 : SmallInt;
    ImpRelatorio : Boolean;
    OldBeforePrint : TQrReportBeforePrintEvent;
Begin
     nPosicao := AchaPos(JanelaPai.Name);
     If nPosicao = -1 Then Begin
              nPosicao := 0;
              Inc(TamanhoJanela);
              SetLength(Janelas,TamanhoJanela);
              Janelas[TamanhoJanela-1].Nome       := JanelaPai.Name;
              Janelas[TamanhoJanela-1].OldOnClose := JanelaPai.OnClose;
              Janelas[TamanhoJanela-1].Instancia  := 1;
     End
     Else
         Janelas[nPosicao].Instancia := Janelas[nPosicao].Instancia + 1;

     configurarelatorio(relatorio);

     If cPrint.Preview Then Begin
        FrmQrpPrev := TFrmQrpPrev.Create(Application);
        If Cprint.Modal then begin
          FrmQrpPrev.FormStyle  := FsNormal;
          FrmQrpPrev.Visible    := Not FrmQrpPrev.Visible;
        end;
        JanelaPai.OnClose := FrmQrpPrev.OnClose;
     End;


     If CPrint.VerificaTamanho then begin
            Relatorio.Page.Orientation := poPortrait;

            For Loop:=0 to Relatorio.BandList.Count - 1 do begin

                 If (TQrCustomBand(Relatorio.BandList[Loop]).BandType <> rbPageHeader) and (TQrCustomBand(Relatorio.BandList[Loop]).ControlCount <> 0) then begin
                   For Loop2:=0 to TQrCustomBand(Relatorio.BandList[Loop]).ControlCount - 1 do
                     If (TQrCustomLabel(TQrCustomBand(Relatorio.BandList[Loop]).Controls[Loop2]).Left
                        + TQrCustomLabel(TQrCustomBand(Relatorio.BandList[Loop]).Controls[Loop2]).Width) > (TQrCustomBand(Relatorio.BandList[Loop]).Width) then
                          break;

                  If (Loop2 <> TQrCustomBand(Relatorio.BandList[Loop]).ControlCount) then begin
                       Relatorio.Page.Orientation := poLandScape;
                       break;
                  end;
                end;  
            end;

            cPrint.VerificaTamanho := False;
     end else If cPrint.Orientation = 0 Then
            Relatorio.Page.Orientation := poPortrait
     Else begin
            Relatorio.Page.Orientation := poLandScape;
     End;



     If Janelas[nPosicao].Instancia = 1 Then Begin
          JanelaPai.OnClose := Janelas[nPosicao].OldOnClose;
          For Loop := nPosicao + 1 To Length(Janelas)-1 Do Begin
              Janelas[Loop-1].Nome       := Janelas[Loop].Nome;
              Janelas[Loop-1].Instancia  := Janelas[Loop].Instancia;
              Janelas[Loop-1].OldOnClose := Janelas[Loop].OldOnClose;
          End;
          Inc(TamanhoJanela,-1);
          SetLength(Janelas,TamanhoJanela);
     End
     Else
          Janelas[nPosicao].Instancia := Janelas[nPosicao].Instancia - 1;


     ImpRelatorio := True;



     OldBeforePrint := Relatorio.BeforePrint;

     If Assigned(Relatorio.BeforePrint) then begin
        Relatorio.BeforePrint(Relatorio,ImpRelatorio);
        Relatorio.BeforePrint := nil;
     end;

      If Not(ImpRelatorio) or ((Relatorio.DataSet <> Nil) And Relatorio.DataSet.Eof) then begin
         If ImpRelatorio and ((Relatorio.DataSet <> Nil) And Relatorio.DataSet.Eof) then
          ShowMessage('Não foram encontrados registros com as faixas indicadas');
         Relatorio.BeforePrint :=   OldBeforePrint;
         If cPrint.Preview Then
            FrmQrpPrev.Close;
         Exit;
      end;



       If cPrint.Preview Then Begin
                  Relatorio.Preview;
          if Assigned(Relatorio.AfterPrint) then
             Relatorio.AfterPrint(Relatorio);
       end Else
          Relatorio.Print ;

      Relatorio.BeforePrint :=   OldBeforePrint;

     //Relatorio.PrinterSettings.Copies := cPrint.QtdVias;

End;

Procedure RelatorioPreview(Sender: TObject);
Begin
  FrmQrpPrev.QRPreview1.QRPrinter := TQRPrinter(Sender);
  FrmQrpPrev.QuickRep             := TQuickRep(Sender);
  If Cprint.Modal Then begin
    FrmQrpPrev.Show;
    FrmQrpPrev.WindowState := wsMaximized;
    FrmQrpPrev.SpeedButton5.OnClick(FrmQrpPrev.SpeedButton5);
  end else
    FrmQrpPrev.FormStyle := fsMDIChild;
End;


Function AchaPos(Value : String) : SmallInt;
Var Loop : Word;
Begin
    Result := -1;
    If Length(Janelas) = 0 Then Exit;
    For Loop := 0 To Length(Janelas)-1 Do
         If Janelas[Loop].Nome = Value Then Begin
               Result := Loop;
               Break;
         End;
End;

Function  CriaSubDetail(Titulo:String;Relatorio:TQuickRep;FDataSet:TDataSet):TQrSubDetail;
var
  i: integer;
begin
    If Relatorio = Nil then
     exit;


    Result := TQrSubDetail.Create(Relatorio.Owner);
    With Result do begin
        DataSet         := FDataSet;
        Parent          := Relatorio;
        PrintIfEmpty    := False;
        PrintBefore     := False;
        Bands.HasHeader := True;
        Bands.HasFooter := True;
        HeaderBand.HasChild := True;
        HeaderBand.Frame.DrawTop := TRue;
        FooterBand.Enabled  := False;
        FooterBand.HasChild := True;
        FooterBand.ChildBand.Frame.DrawBottom := True;
        FooterBand.ChildBand.Height := 1;
    end;

    TQrLabel.Create(Result.Owner).Name := 'QrTitulo'+Result.HeaderBand.Name;

    With TQrLabel(Result.Owner.FindComponent('QrTitulo'+Result.HeaderBand.Name)) do begin
         ParentReport  := Relatorio;
         Parent        := Result.HeaderBand;
         Caption       := Titulo;
         Alignment     := taCenter;
         AlignToBand   := True;
         Parent.Height := Height;
         Top           := 1;
         Font.Style    := [FsBold];
         Alignment     := TaCenter;
         AlignToBand   := True;
         TQrBand(Parent).ChildBand.Height := Height;
    end;

end;

PROCEDURE configurarelatorio(var VRelatorio:TQuickRep);
begin
    if CPrint.ParamGraf and (Printer.Printers.Text <> '') and (Printer.PrinterIndex > -1) then
     if FirstImpFuncPrint and (ImpFuncPrint = '') then
        SetupGraf.ReadRegImpGraf(Printer.Printers[Printer.PrinterIndex],Vrelatorio)
     else if FirstImpFuncPrint and (ImpFuncPrint <> '') then
        SetupGraf.ReadRegImpGraf(ImpFuncPrint,Vrelatorio)
     else begin
        With TRegistry.Create do
         Try
            if  OpenKey('\NativaSoft\Impressao\ImpGraf\',false) and
               (ReadString('') <> '') and
               (Printer.Printers.IndexOf(ReadString('')) > -1) then begin
                   SetupGraf.ReadRegImpGraf(ReadString(''),Vrelatorio);
                   ImpFuncPrint := ReadString('');
            end else begin
                   SetupGraf.ReadRegImpGraf(Printer.Printers[Printer.PrinterIndex],Vrelatorio);
                   ImpFuncPrint := Printer.Printers[Printer.PrinterIndex];
            end;
         finally
           destroy;
         end;
         FirstImpFuncPrint := true;
     end;
end;     

Begin
   TamanhoJanela          := 0;
   cPrint.VerificaTamanho := False;
   cPrint.ParamGraf       := True;
   cprint.Modal           := True;

end.
