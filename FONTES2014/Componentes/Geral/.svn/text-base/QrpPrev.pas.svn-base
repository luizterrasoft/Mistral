unit QrpPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, QRPrntr, ComCtrls, StdCtrls, Spin, Buttons, QRExport,Printers,ExpQuickRep,SetupGraf,Variants,funcoesglobais;

type
  TFrmQrpPrev = class(TForm)
    QRPreview1: TQRPreview;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpinZoom: TSpinEdit;
    GroupBox2: TGroupBox;
    SpinPagina: TSpinEdit;
    SpeedButton1: TSpeedButton;
    SalvaArquivo: TSaveDialog;
    GroupBox3: TGroupBox;
    SpinRH: TSpinEdit;
    GroupBox4: TGroupBox;
    SpinRV: TSpinEdit;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    AbreArquivo: TOpenDialog;
    SpeedButton8: TSpeedButton;
    PrintDialog1: TPrintDialog;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    UltPag: TLabel;
    Perc: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpinZoomChange(Sender: TObject);
    procedure SpinPaginaChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpinRHChange(Sender: TObject);
    procedure SpinRVChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure QRPreview1PageAvailable(Sender: TObject; PageNum: Integer);
    procedure QRPreview1ProgressUpdate(Sender: TObject; Progress: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QRPreview1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    FONExportToFilter:TQRExportToFilterEvent;
    FQuicklendo:TQuickRep;
    Function  StrtoIntN(Valor:String):Integer;
    Function IIFs(Value1:Boolean;Value2,Value3:Variant) : Variant;
    Procedure RelatorioPreview(Sender: TObject);
    { Private declarations }
  public
    QuickRep : TQuickrep;
    lendo:boolean;
    { Public declarations }
  end;

var
  FrmQrpPrev: TFrmQrpPrev;

//const
//  crMyCursor = 23;

Procedure RetornaErroWinExec(Erro:Integer);
implementation
uses FuncPrint;



{$R *.DFM}

procedure TFrmQrpPrev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     If Copy(TComponent(Sender).Name,1,10) = 'FrmQrpPrev' Then
           Action := caFree
     Else
           Action := caNone;

end;

procedure TFrmQrpPrev.FormShow(Sender: TObject);
begin
     SpinZoom.Value := QRPreview1.Zoom;
     SpinPagina.Value := QRPreview1.PageNumber;
end;

procedure TFrmQrpPrev.SpinZoomChange(Sender: TObject);
begin
       If SpinZoom.Text <> '' Then
           QRPreview1.Zoom := SpinZoom.Value;
end;

procedure TFrmQrpPrev.SpinPaginaChange(Sender: TObject);
begin
      If SpinPagina.Text <> '' Then Begin
           QRPreview1.PageNumber := SpinPagina.Value;
           If QRPreview1.PageNumber <> SpinPagina.Value Then
              SpinPagina.Value :=  QRPreview1.PageNumber;
      End;
end;

procedure TFrmQrpPrev.SpeedButton1Click(Sender: TObject);
var
OldMaster : TWincontrol;
i:word;
fcomando:string;
begin

    OldMaster                   := QRPreview1.QRPrinter.Master;
    try
       QRPreview1.QRPrinter.Master := Nil;
       If FSetupGraf(TQuickRep(OldmAster)) Then begin
           if Printer.Printers.Count > TQuickRep(OldmAster).PrinterSettings.PrinterIndex then
             ImpFuncPrint     := Printer.Printers[TQuickRep(OldmAster).PrinterSettings.PrinterIndex];
           QRPreview1.QRPrinter.PrinterIndex     := TQuickRep(OldmAster).PrinterSettings.PrinterIndex;
           QRPreview1.QRPrinter.PaperSize        := TQuickRep(OldmAster).PrinterSettings.PaperSize;
           If TQuickRep(OldmAster).PrinterSettings.FirstPage = 0 Then begin
             QRPreview1.QRPrinter.FirstPage        := 1;
             QRPreview1.QRPrinter.LastPage         := QRPreview1.QRPrinter.PageCount;
           end else begin
             QRPreview1.QRPrinter.FirstPage        := TQuickRep(OldmAster).PrinterSettings.FirstPage;
             QRPreview1.QRPrinter.LastPage         := TQuickRep(OldmAster).PrinterSettings.LastPage;
           end;

           If Not ImpMatricial then begin
             for i:=1 to TQuickRep(OldmAster).PrinterSettings.Copies do
              QRPreview1.QRPrinter.Print;
           end else begin
                QRPreview1.QRPrinter.ExportToFilter(TQrAsciiExportFilter.Create('C:\RelatorioGraftoText.Txt'));
                try
                  if Round(TQuickRep(OldmAster).Font.Size) >= 18 then
                    fcomando := '20c'
                  else if Round(TQuickRep(OldmAster).Font.Size) in [13..17]  then
                    fcomando := '17c'
                  else if Round(TQuickRep(OldmAster).Font.Size) in [11..12]  then
                    fcomando := '12c'
                  else if Round(TQuickRep(OldmAster).Font.Size) in [6..10]  then
                    fcomando := '10c'
                  else
                    fcomando := '5c';

                  RetornaErroWinExec(WinExec (Pchar(ExtractFilePath(Application.ExeName)+'IMPRESS.EXE '+
                                             'C:\RelatorioGraftoText.Txt'+' '+
                                             '80'+' '+
                                             pRINTER.Printers[QRPreview1.QRPrinter.PrinterIndex]+' '+
                                             fcomando+' '+
                                             '1'),
                                             SW_SHOW)
                                     );
                  finally
                    deletefile('C:\RelatorioGraftoText.Txt');
                  end;
           end;
       end;

{       QRPreview1.QRPrinter.Master := Nil;
       TQuickRep(OldmAster).PrinterSetup;
       If TQuickRep(OldmAster).Tag = 0 then begin
           QRPreview1.QRPrinter.PrinterIndex     := TQuickRep(OldmAster).PrinterSettings.PrinterIndex;
           QRPreview1.QRPrinter.FirstPage        := TQuickRep(OldmAster).PrinterSettings.FirstPage;
           QRPreview1.QRPrinter.LastPage         := TQuickRep(OldmAster).PrinterSettings.LastPage;
           for i:=1 to TQuickRep(OldmAster).PrinterSettings.Copies do
            QRPreview1.QRPrinter.Print;
       end;}

     finally
       ImpMatricial := False;
       QRPreview1.QRPrinter.Master := OldMaster;
     end;
end;

procedure TFrmQrpPrev.SpeedButton2Click(Sender: TObject);
begin
    SpinPagina.Value := QRPreview1.QRPrinter.PageCount;
end;

procedure TFrmQrpPrev.SpeedButton3Click(Sender: TObject);
begin
    SpinPagina.Value := 1;    
end;

procedure TFrmQrpPrev.SpinRHChange(Sender: TObject);
begin
       If SpinRH.Text <> '' Then Begin
          QrPreview1.HorzScrollBar.Position := SpinRH.Value;
          If QrPreview1.HorzScrollBar.Position <> SpinRH.Value Then
             SpinRH.Value := QrPreview1.HorzScrollBar.Position;
       End;
end;

procedure TFrmQrpPrev.SpinRVChange(Sender: TObject);
begin
       If SpinRV.Text <> '' Then Begin
          QrPreview1.VertScrollBar.Position := SpinRV.Value;
          If QrPreview1.VertScrollBar.Position <> SpinRV.Value Then
             SpinRV.Value := QrPreview1.VertScrollBar.Position;
       End;
end;

procedure TFrmQrpPrev.SpeedButton6Click(Sender: TObject);
Var
   AImagem : TMetafile;
   Imagem:TImage;
   FRect:TRect;
   FQrPrinter:TQrPrinter;
   OldMaster:TQRPrinter;
   FQuickRep:TQuickRep;
begin

    SalvaArquivo.FileName    := '';
    SalvaArquivo.Filter      := 'Formato Relatório(*.Qrp)|*.QRP|'+
                             'Formato Texto(*.Txt)|*.TXT|Formato Word(*.Doc)|*.DOC|'+
                             'Formato Excel(*.XLS)|*.XLS|Formato Internet(*.HTML)|*.HTML|'+
                             'Formato WMF(*.WMF)|*.WMF|Formato BitMap(*.BMP)|*.BMP';

    SalvaArquivo.DefaultExt  := '*.QRP';

    If Not SalvaArquivo.Execute or (FileExists(SalvaArquivo.FileName) and
       Not MensConf('Arquivo '+SalvaArquivo.FileName+#13+'Ja Existente.Deseja Sobrescrevê-lo?')) Then
     exit;

    If FileExists(SalvaArquivo.FileName) Then
     DeleteFile(SalvaArquivo.FileName);

{    If Not Lendo then
       FQrPrinter := QRPreview1.QRPrinter
    else
       FQrPrinter := QRPreview1.PreviewImage.QRPrinter;


//     OldMaster   := TQuickRep(QRPreview1.QRPrinter.Master).QrPrinter;
     tqUICKrEP(QRPreview1.QRPrinter.mASTER).ExportToFilter(TQrAsciiExportFilter.Create(SalvaArquivo.FileName));
//     TQuickRep(QRPreview1.QRPrinter.Master).QrPrinter := OldMaster;
     FQuickRep := TQuickRep.Create(Self);
     With fQuickRep do begin

     end;}
//     Qrpreview1.QrPrinter.OnExportToFilter := FONExportToFilter;
//     QRPreview1.QRPrinter.ExportToFilter(TQrAsciiExportFilter.Create(SalvaArquivo.FileName));
  //   EXIT;



    try
        If UpperCase(ExtractFileExt(SalvaArquivo.FileName)) = '.QRP' Then
          QRPreview1.QRPrinter.Save(SalvaArquivo.FileName)
        else If UpperCase(ExtractFileExt(SalvaArquivo.FileName)) = '.TXT' Then
          QRPreview1.QRPrinter.ExportToFilter(TQrAsciiExportFilter.Create(SalvaArquivo.FileName))
        else If UpperCase(ExtractFileExt(SalvaArquivo.FileName)) = '.DOC' Then
          QRPreview1.QRPrinter.ExportToFilter(TQRRTFExportFilter.Create(SalvaArquivo.FileName))
        else If UpperCase(ExtractFileExt(SalvaArquivo.FileName)) = '.XLS' Then
          QRPreview1.QRPrinter.ExportToFilter(TQRXLSFilter.Create(SalvaArquivo.FileName))
        else If UpperCase(ExtractFileExt(SalvaArquivo.FileName)) = '.HTML' Then
          QRPreview1.QRPrinter.ExportToFilter(TQRHTMLDocumentFilter.Create(SalvaArquivo.FileName))
        else If UpperCase(ExtractFileExt(SalvaArquivo.FileName)) = '.WMF' Then
          QRPreview1.QRPrinter.ExportToFilter(TQRWMFExportFilter.Create(SalvaArquivo.FileName))
        else If (UpperCase(ExtractFileExt(SalvaArquivo.FileName)) = '.BMP') Then begin
             AImagem := TMetafile.Create;
             Imagem  := TImage.Create(Nil);
             Try
               AImagem := QRPreview1.QRPrinter.GetPage(QRPreview1.QRPrinter.PageNumber);
               With Imagem do begin
                    Height := AImagem.Height;
                    Width  := AImagem.Width;
                    Canvas.Draw(0,0,AImagem);
                    Picture.SaveToFile(SalvaArquivo.FileName);
               end;
             Finally
                AImagem.Destroy;
                Imagem.Destroy;
             end;
        end;
    finally
//       QRPreview1.QRPrinter.Master := OldMaster;
    end;



end;

procedure TFrmQrpPrev.SpeedButton7Click(Sender: TObject);
begin
    AbreArquivo.FileName    := '';
    AbreArquivo.Filter      := 'Formato Relatório(*.Qrp)|*.QRP';
    AbreArquivo.DefaultExt  := '*.QRP';
    If AbreArquivo.Execute Then Begin
       If FQuickLendo <> Nil Then
        FQuicklendo.Destroy;



{       FQuickLendo := TQuickRep.Create(Self);
       FQuickLendo.PreviewModeless;
       FQuickLendo.QRPrinter.Load(AbreArquivo.FileName);
       Self.QRPreview1.QRPrinter := TQRPrinter(FQuickLendo);
       Self.QuickRep             := TQuickRep(FQuickLendo);}

//     FONExportToFilter := Qrpreview1.QrPrinter.OnExportToFilter;
       QRPreview1.QrPrinter.Load(AbreArquivo.FileName);
//     TQuickRep(QRPreview1.QrPrinter.Master).QrPrinter.Load(AbreArquivo.FileName);
//     Qrpreview1.QrPrinter.OnExportToFilter := FONExportToFilter;

       QRPreview1.PageNumber := 1;
       QRPreview1.PreviewImage.PageNumber := 1;
       Perc.Caption   := '100%';
       ultpag.caption := 'Qtde '+InttoStr(QRPreview1.PreviewImage.QrPrinter.PageCount);
       Lendo := True;
    End;

end;

procedure TFrmQrpPrev.SpeedButton8Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmQrpPrev.SpeedButton4Click(Sender: TObject);
begin
    QrPreview1.ZoomToFit;
    SpinZoom.Value := QRPreview1.Zoom;
end;

procedure TFrmQrpPrev.SpeedButton5Click(Sender: TObject);
begin
    QrPreview1.ZoomToWidth;
    SpinZoom.Value := QRPreview1.Zoom;
end;

procedure TFrmQrpPrev.QRPreview1PageAvailable(Sender: TObject;
  PageNum: Integer);
begin
   UltPag.Caption := 'Qtde '+IntToStr(PageNum);
end;

procedure TFrmQrpPrev.QRPreview1ProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
  If Progress >= 100 then begin
    SpeedButton1.enabled := true;
    SpeedButton6.enabled := true;
    SpeedButton7.enabled := true;
  end;
  Perc.Caption := IntToStr(Progress)+'%';
end;

procedure TFrmQrpPrev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
   close;
end;

procedure TFrmQrpPrev.QRPreview1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

    SpinZoom.Text := IntToStr(StrtoIntN(SpinZoom.Text) + SpinZoom.Increment * iifs(Button = mbRight,-1,1));
end;

function TFrmQrpPrev.StrtoIntN(Valor: String): Integer;
begin
  If trim(Valor) = ''  then
   Result := 0
  else
   Result := StrtoInt(Trim(Valor));
end;

function TFrmQrpPrev.IIFs(Value1: Boolean; Value2,
  Value3: Variant): Variant;
begin
  If Value1 Then Result := Value2 Else Result := Value3;
end;

Procedure RetornaErroWinExec(Erro:Integer);
begin
      if (Erro=0) then
          ShowMessage ('O sistema está sem memória! Tente fechar alguns aplicativos...');
      if (Erro=ERROR_BAD_FORMAT) then
          ShowMessage ('O arquivo IMPRESS.EXE é inválido!');
      if (Erro=ERROR_FILE_NOT_FOUND) then
          ShowMessage ('O programa IMPRESS.EXE não foi encontrado!');
      if (Erro=ERROR_PATH_NOT_FOUND) then
          ShowMessage ('O caminho especificado é inválido!');
end;

procedure TFrmQrpPrev.FormCreate(Sender: TObject);
begin
   lendo := false;
end;

procedure TFrmQrpPrev.RelatorioPreview(Sender: TObject);
begin
  Self.QRPreview1.QRPrinter := TQRPrinter(Sender);
  Self.QuickRep             := TQuickRep(Sender);
end;

end.
