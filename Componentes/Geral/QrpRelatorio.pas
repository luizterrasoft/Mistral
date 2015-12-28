unit QrpRelatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls,FuncPrint,DbTables,Db,Printers,FuncoesGlobais;

type

  TDadosCabecalho = Record
    NomeEmpresa:Boolean;
    ImagemEmpresa:Boolean;
    CodRotina:String;
  end;

  TDadosRelatorio = Record
    DataSetEmpresa:TDataSet;
    LinhaSeparacao:Boolean;
    Cabecalho:Boolean;
    DadosCabecalho:TDadosCabecalho;
    Data1,Data2:TDateTime;
    Titulo     :String; 
    MargemSuperior:extended;
    Indice     : Boolean;
  end;

  TFrm_QrpRelatorio = class(TForm)
    Relatorio: TQuickRep;
    Detalhes: TQRBand;
    QRBand9: TQRBand;
    Cabecalho: TQRBand;
    NomeEmpresa: TQRDBText;
    QRSysData7: TQRSysData;
    QRSysData8: TQRSysData;
    QRSysData9: TQRSysData;
    TitleApplication: TQRLabel;
    ImagemEmpresa: TQRDBImage;
    Titulo: TQRChildBand;
    TotalRelatorio: TQRBand;
    QRLabel20: TQRLabel;
    BandIndice: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    TitIndice: TQRMemo;
    PgIniIndice: TQRMemo;
    PgFimIndice: TQRMemo;
    TitRelatorio: TQRLabel;
    LbPeriodo: TQRMemo;
    procedure RelatorioPreview(Sender: TObject);
    procedure RelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure RelatorioAfterPrint(Sender: TObject);
    procedure TotalRelatorioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
      { Public declarations }
  end;

var
  Frm_QrpRelatorio: TFrm_QrpRelatorio;
  DadosRelatorio:TDadosRelatorio;
implementation

{$R *.DFM}

procedure TFrm_QrpRelatorio.RelatorioPreview(Sender: TObject);
begin
    FuncPrint.RelatorioPreview(Sender);
end;

procedure TFrm_QrpRelatorio.RelatorioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
        If LbPeriodo.Lines.Text = '' then begin
         LbPeriodo.Lines.add('Periodo');
         If (DadosRelatorio.Data1 <> 0) And (DadosRelatorio.Data2 <> 0) then
           LbPeriodo.Lines[0] := LbPeriodo.Lines[0] +' '+DateTimetoStr(DadosRelatorio.Data1)+' até '+DateTimetoStr(DadosRelatorio.Data2)
         else If (DadosRelatorio.Data1 <> 0) then
           LbPeriodo.Lines[0] := LbPeriodo.Lines[0] +' desde '+DateTimetoStr(DadosRelatorio.Data1)
         else If (DadosRelatorio.Data2 <> 0) then
           LbPeriodo.Lines[0] := LbPeriodo.Lines[0] +' até '+DateTimetoStr(DadosRelatorio.Data2)
         else
           LbPeriodo.Enabled := False;
       end;

       BandIndice.Enabled       := DadosRelatorio.Indice;
       Cabecalho.Enabled        := DadosRelatorio.Cabecalho;
       NomeEmpresa.Enabled      := DadosRelatorio.DadosCabecalho.NomeEmpresa;
       ImagemEmpresa.Enabled    := DadosRelatorio.DadosCabecalho.ImagemEmpresa;
       NomeEmpresa.DataSet      := DadosRelatorio.DataSetEmpresa;
       ImagemEmpresa.DataSet    := DadosRelatorio.DataSetEmpresa;
       TitleApplication.Caption := iifs(DadosRelatorio.DadosCabecalho.CodRotina <> '',UpperCase(DadosRelatorio.DadosCabecalho.CodRotina)+'-','')+Application.Title;
       TitRelatorio.Font.Size := 16;
       TitRelatorio.Width   := QRSysData9.Left - ImagemEmpresa.Width - 2;
       TitRelatorio.Left    := ImagemEmpresa.Width + 1;
       NomeEmpresa.Width   := TitleApplication.Left  - ImagemEmpresa.Width - 2;
       NomeEmpresa.Left    := ImagemEmpresa.Width + 1;

       NomeEmpresa.Left     := TitRelatorio.Left;
//       TitRelatorio.Top     := NomeEmpresa.Height + 2;
//       TitRelatorio.Height  := Cabecalho.Height - TitRelatorio.Top;
       TitRelatorio.Caption := DadosRelatorio.Titulo;
       Font.Size := TitRelatorio.Font.Size;
       While LinesCanvas(Canvas,TitRelatorio.Caption,TitRelatorio.Width,True).Count * Canvas.TextHeight(UpperCase(TitRelatorio.Caption))
              > TitRelatorio.Height do begin
                Font.Size := Font.Size - 1;
                If Font.Size  = 0 then
                   break;
       end;
       TitRelatorio.Font.Size := Font.Size;
       Font.Size := 8;
       If DadosRelatorio.MargemSuperior > 0 Then
        Relatorio.Page.TopMargin := DadosRelatorio.MargemSuperior;
       Relatorio.ReportTitle    := Application.Title +' - '+ DadosRelatorio.Titulo;
//       TotalRelatorio.Font.Size := Self.Font.Size;  
end;

procedure TFrm_QrpRelatorio.FormDestroy(Sender: TObject);
begin
   Frm_QrpRelatorio := Nil;
end;

procedure TFrm_QrpRelatorio.RelatorioAfterPrint(Sender: TObject);
var
I,I2:Word;
begin
    DadosRelatorio.Data1 := 0;
    DadosRelatorio.Data2 := 0;
    DadosRelatorio.Cabecalho := False;
    DadosRelatorio.DadosCabecalho.NomeEmpresa   := False;
    DadosRelatorio.DadosCabecalho.ImagemEmpresa := False;
    DadosRelatorio.DadosCabecalho.Codrotina     := '';

    DadosRelatorio.Titulo := '';
    TitRelatorio.Font.Size := 16;
    DadosRelatorio.MargemSuperior := 1;
    DadosRelatorio.Indice := False;
    Relatorio.Page.Orientation := poPortrait;
    LbPeriodo.Lines.Clear;
    For i:=Self.ComponentCount - 1 downto 0  do begin
          If (Components[I] is TQrSubDetail) then begin
             While TQrSubDetail(Components[i]).ControlCount > 0 Do
              TQrSubDetail(Components[i]).Controls[TQrSubDetail(Components[i]).ControlCount - 1].Owner.Components[TQrSubDetail(Components[i]).Controls[TQrSubDetail(Components[i]).ControlCount - 1].ComponentIndex].Destroy;

            If TQrSubDetail(Components[i]).Bands.HasHeader then begin
                While TQrSubDetail(Components[i]).HeaderBand.ControlCount > 0 do
                 TQrSubDetail(Components[i]).HeaderBand.Controls[TQrSubDetail(Components[i]).HeaderBand.ControlCount - 1].Owner.Components[TQrSubDetail(Components[i]).HeaderBand.Controls[TQrSubDetail(Components[i]).HeaderBand.ControlCount - 1].ComponentIndex].Destroy;
                TQrSubDetail(Components[i]).Bands.HasHeader := False;
            end;

            If TQrSubDetail(Components[i]).Bands.HasFooter then begin
                While TQrSubDetail(Components[i]).FooterBand.ControlCount > 0 do
                 TQrSubDetail(Components[i]).FooterBand.Controls[TQrSubDetail(Components[i]).FooterBand.ControlCount - 1].Owner.Components[TQrSubDetail(Components[i]).FooterBand.Controls[TQrSubDetail(Components[i]).FooterBand.ControlCount - 1].ComponentIndex].Destroy;
                TQrSubDetail(Components[i]).Bands.HasFooter := False;
            end;

            TQrSubDetail(Components[i]).Owner.components[TQrSubDetail(Components[i]).ComponentIndex].Destroy;
          end;
    end;
end;

procedure TFrm_QrpRelatorio.TotalRelatorioBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//    PrintBand := (TotalRelatorio.ControlCount > 1) and TotalRelatorio.enabled;
end;

procedure TFrm_QrpRelatorio.FormCreate(Sender: TObject);
begin
    Relatorio.Page.Orientation := poPortrait;
    DadosRelatorio.MargemSuperior := 1;
    DadosRelatorio.Indice := False;
    configurarelatorio(Relatorio);
end;

procedure TFrm_QrpRelatorio.TituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := Not BandIndice.Enabled or (Relatorio.DataSet = Nil) or Not Relatorio.DataSet.Eof;
end;

end.
