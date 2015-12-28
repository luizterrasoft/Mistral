unit siGridReporter;

{
Por Igor Siticov
    SiComponents: http://www.sicomponents.com

Publicado no Boletin Pascal #44 como parte do artigo
"Utilizando o MS Word como Gerador de Relatórios":
http://www.latiumsoftware.com/br/pascal/0044.php
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComObj, Grids;

type

  TWordColor = (wcAuto, wcBlack, wcBlue, wcTurquoise,
                wcBrightGreen, wcPink, wcRed,
                wcYellow, wcWhite, wcDarkBlue,
                wcTeal, wcGreen, wcViolet,
                wcDarkRed, wcDarkYellow, wcGray50,
                wcGray25);
  TWordAlignment = (
// Alignment constants
  waAlignParagraphLeft,
  waAlignParagraphCente,
  waAlignParagraphRight,
  waAlignParagraphJustify);

  TsiGridReporter = class(TComponent)
  private
    { Private declarations }
    FWordApp: Variant;
    FShowDate: boolean;
    FTitle: string;
    FGrid: TStringGrid;
    FTitleFont: TFont;
    FCellFont: TFont;
    FTitleAlignment: TWordAlignment;
    FTitleColor: TWordColor;
    FCellColor: TWordColor;
    procedure SetGrid(const Value: TStringGrid);
    procedure SetShowDate(const Value: boolean);
    procedure SetTitle(const Value: string);
    procedure SetCellFont(const Value: TFont);
    procedure SetTitleFont(const Value: TFont);
    procedure SetTitleAlignment(const Value: TWordAlignment);
    procedure SetTitleColor(const Value: TWordColor);
    procedure SetCellColor(const Value: TWordColor);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOner: TComponent); override;
    destructor Destroy; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ShowReport;
    procedure PrintReport;
    procedure PrintPreview;
  published
    { Published declarations }
    property Title: string read FTitle write SetTitle;
    property ShowDate: boolean read FShowDate write SetShowDate;
    property Grid: TStringGrid read FGrid write SetGrid;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property CellFont: TFont read FCellFont write SetCellFont;
    property TitleColor: TWordColor read FTitleColor write SetTitleColor default wcAuto;
    property CellColor: TWordColor read FCellColor write SetCellColor default wcAuto;
    property TitleAlignment: TWordAlignment read FTitleAlignment write SetTitleAlignment default waAlignParagraphLeft;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('siComponents', [TsiGridReporter]);
end;

{ TsiGridReporter }

constructor TsiGridReporter.Create(AOner: TComponent);
begin
  inherited;
  FTitleFont := TFont.Create;
  FCellFont := TFont.Create;
  FTitleColor := wcAuto;
  FTitleAlignment := waAlignParagraphLeft;
end;

destructor TsiGridReporter.Destroy;
begin
  FTitleFont.Free;
  FCellFont.Free;
  inherited;
end;

procedure TsiGridReporter.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FGrid) then
    FGrid := nil;
end;

procedure TsiGridReporter.PrintPreview;
begin
  ShowReport;
  if not VarIsEmpty(FWordApp) then begin
    FWordApp.PrintPreview := True;
  end;
end;

procedure TsiGridReporter.PrintReport;
begin
  ShowReport;
  if not VarIsEmpty(FWordApp) then begin
    FWordApp.PrintOut;
  end;
end;

procedure TsiGridReporter.SetCellColor(const Value: TWordColor);
begin
  FCellColor := Value;
end;

procedure TsiGridReporter.SetCellFont(const Value: TFont);
begin
  FCellFont.Assign(Value);
end;

procedure TsiGridReporter.SetGrid(const Value: TStringGrid);
begin
  FGrid := Value;
end;

procedure TsiGridReporter.SetShowDate(const Value: boolean);
begin
  FShowDate := Value;
end;

procedure TsiGridReporter.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TsiGridReporter.SetTitleAlignment(const Value: TWordAlignment);
begin
  FTitleAlignment := Value;
end;

procedure TsiGridReporter.SetTitleColor(const Value: TWordColor);
begin
  FTitleColor := Value;
end;

procedure TsiGridReporter.SetTitleFont(const Value: TFont);
begin
  FTitleFont.Assign(Value);
end;

procedure TsiGridReporter.ShowReport;
var
   Range: Variant;
   i, j: integer;
begin

  if FGrid = nil then
    raise Exception.Create('No grid selected!');
  FWordApp := CreateOleObject('Word.Application');
  try
    FWordApp.Visible := True;
    FWordApp.Documents.Add;
    if FShowDate then begin
      Range := FWordApp.Documents.Item(1);
      Range := Range.Sections.Item(1);
      Range := Range.Headers.Item(1).Range;
      Range.Text := 'Date: ' + DateToStr(Date) + ' Time: ' + TimeToStr(Time);
    end;
    Range := FWordApp.Documents.Item(1);
    Range := Range.Sections.Item(1);
    Range := Range.Footers.Item(1);
    Range.Range.Text := 'Page:';
    Range.Range.ParagraphFormat.Alignment := ord(waAlignParagraphRight);
    Range.PageNumbers.Add;
    FWordApp.Documents.Item(1).Paragraphs.Add;
    Range := FWordApp.Documents.Item(1).Range(
             FWordApp.Documents.Item(1).Paragraphs.Item(FWordApp.Documents.Item(1).Paragraphs.Count - 1).Range.End,
             FWordApp.Documents.Item(1).Paragraphs.Item(FWordApp.Documents.Item(1).Paragraphs.Count - 1).Range.End);
    Range.Text := FTitle;
    Range.Bold := fsBold in FTitleFont.Style;
    Range.Italic := fsItalic in FTitleFont.Style;
    Range.Underline := fsUnderline in FTitleFont.Style;
    Range.Font.StrikeThrough := fsStrikeOut in FTitleFont.Style;
    Range.Font.Name := FTitleFont.Name;
    Range.Font.Size := FTitleFont.Size;
    Range.Font.ColorIndex := ord(FTitleColor);
    Range.ParagraphFormat.Alignment := ord(FTitleAlignment);
    FWordApp.Documents.Item(1).Paragraphs.Add;
    FWordApp.Documents.Item(1).Paragraphs.Add;
    Range := FWordApp.Documents.Item(1).Range(
             FWordApp.Documents.Item(1).Paragraphs.Item(FWordApp.Documents.Item(1).Paragraphs.Count - 1).Range.End,
             FWordApp.Documents.Item(1).Paragraphs.Item(FWordApp.Documents.Item(1).Paragraphs.Count - 1).Range.End);
    FWordApp.Documents.Item(1).Tables.Add(Range, FGrid.RowCount, FGrid.ColCount);
    Range := FWordApp.Documents.Item(1).Tables.Item(FWordApp.Documents.Item(1).Tables.Count);
    for i := 1 to FGrid.RowCount do
      for j := 1 to FGrid.ColCount do begin
        Range.Cell(i, j).Range.InsertAfter(FGrid.Cells[j-1, i-1]);
        if (i <= FGrid.FixedRows) or (j <= FGrid.FixedCols) then begin
          Range.Cell(i, j).Range.Bold := True;
          Range.Cell(i, j).Range.Shading.BackgroundPatternColorIndex := ord(wcGray25);
        end
        else begin
          Range.Cell(i, j).Range.Bold := fsBold in FCellFont.Style;
          Range.Cell(i, j).Range.Italic := fsItalic in FCellFont.Style;
          Range.Cell(i, j).Range.Underline := fsUnderline in FCellFont.Style;
          Range.Cell(i, j).Range.Font.StrikeThrough := fsStrikeOut in FCellFont.Style;
          Range.Cell(i, j).Range.Font.Name := FCellFont.Name;
          Range.Cell(i, j).Range.Font.Size := FCellFont.Size;
//          Range.Cell(i, j).Range.Font.ColorIndex := ord(FCellColor);
          Range.Cell(i, j).Range.Shading.BackgroundPatternColorIndex := FCellColor;
        end;
      end;
  finally
{    if not VarIsEmpty(FWordApp) then begin


      WordApp.Documents.Item(1).SaveAs(FileName,,,,True);
      if MessageDlg('Close word?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        FWordApp.DisplayAlerts := 0;
        FWordApp.Quit;
      end;
    end;
    FWordApp := UnAssigned;}
  end;
end;

end.