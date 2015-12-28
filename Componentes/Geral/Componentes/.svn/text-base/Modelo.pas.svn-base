unit Modelo;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ComCtrls, StdCtrls, EditControle, Grids, GridControl, Buttons,
  ExtCtrls,QrCtrls,Db,DbTAbles;

type

  TFrm_Modelos = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn9: TBitBtn;
    BFecha: TBitBtn;
    GridCampos: TGridControl;
    BtInclui: TBitBtn;
    btExcluiCampo: TBitBtn;
    GridIncluidos: TGridControl;
    Label1: TLabel;
    Linha: TEditControle;
    Coluna: TEditControle;
    Label2: TLabel;
    Label3: TLabel;
    Codigo: TEditControle;
    UpDown3: TUpDown;
    UpDown1: TUpDown;
    Label4: TLabel;
    Tamanho: TEditControle;
    UpDown2: TUpDown;
    Descricao: TEditControle;
    Label5: TLabel;
    ScrollBox1: TScrollBox;
    QuickRep1: TQuickRep;
    QtdeColuna: TEditControle;
    Label6: TLabel;
    QtdeLinha: TEditControle;
    UpDown4: TUpDown;
    Label7: TLabel;
    UpDown5: TUpDown;
    Largura: TEditControle;
    Label8: TLabel;
    UpDown6: TUpDown;
    procedure BFechaClick(Sender: TObject);
    procedure GridIncluidosClick(Sender: TObject);
    procedure BtIncluiClick(Sender: TObject);
    procedure btExcluiCampoClick(Sender: TObject);
    procedure LinhaChange(Sender: TObject);
    procedure ColunaChange(Sender: TObject);
    procedure TamanhoChange(Sender: TObject);
    procedure LarguraChange(Sender: TObject);
    procedure QtdeLinhaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   QtdComponent:Word;
    { Private declarations }
  public
    Tipo : String;
    { Public declarations }
  end;

var
  Frm_Modelos: TFrm_Modelos;

implementation

{$R *.DFM}

procedure TFrm_Modelos.BFechaClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_Modelos.GridIncluidosClick(Sender: TObject);
var i : Integer;
begin
  If GridIncluidos.Cells[0,GridIncluidos.Row] = '' then
   exit;

//  TQrCustomLabel(FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Font.Color := ClBlue;

  for i:=0 to QuickRep1.ControlCount - 1 do
   If Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row]) <> QuickRep1.Controls[I] then
      TQrCustomLabel(QuickRep1.Controls[I]).Font.Color := ClBlack
   else
      TQrCustomLabel(QuickRep1.Controls[I]).Font.Color := ClBlue;

 Linha.Text    := FloattoStr(TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Top);
 Coluna.Text   := FloattoStr(TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Left);
 Tamanho.Text  := FloattoStr(TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Width);
 Largura.Text  := FloattoStr(TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Height);
end;




procedure TFrm_Modelos.BtIncluiClick(Sender: TObject);
var i:integer;
begin

   If Sender = BtInclui then
      TQrLabel.Create(Self).Name := 'Component'+Inttostr(QtdComponent)
   else
      TQrMemo.Create(Self).Name :=  'Component'+Inttostr(QtdComponent);

   TQrCustomLabel(Self.FindComponent('Component'+Inttostr(QtdComponent))).Parent := QuickRep1;
   TQrCustomLabel(Self.FindComponent('Component'+Inttostr(QtdComponent))).ParentReport := QuickRep1;
   TQrCustomLabel(Self.FindComponent('Component'+Inttostr(QtdComponent))).Left   := QuickRep1.Width div 2;
   TQrCustomLabel(Self.FindComponent('Component'+Inttostr(QtdComponent))).Top    := QuickRep1.Height div 2;
   TQrCustomLabel(Self.FindComponent('Component'+Inttostr(QtdComponent))).Caption := GridCampos.Cells[0,gridcampos.row];
   TQrCustomLabel(Self.FindComponent('Component'+Inttostr(QtdComponent))).AutoSize   := False;


   if GridIncluidos.Cells[0,1] <> '' then
     GridIncluidos.RowCount := GridIncluidos.RowCount + 1;
   For i:=0 to GridCampos.ColCount - 1 do
      GridIncluidos.Cells[I,GridCampos.RowCount - 1] := GridCampos.Cells[I,GridCampos.Row] ;

   GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.RowCount - 1] := 'Component'+Inttostr(QtdComponent);
   GridCampos.DeletaLinha(GridCampos.Row);
   GridIncluidos.Row := GridIncluidos.RowCount - 1;
   Inc(QtdComponent);
   Linha.Text    := FloattoStr(TQrCustomLabel(FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Top);
   Coluna.Text   := FloattoStr(TQrCustomLabel(FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Left);
   Tamanho.Text  := FloattoStr(TQrCustomLabel(FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Width);
   Largura.Text  := FloattoStr(TQrCustomLabel(FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Height);

   for i:=0 to QuickRep1.ControlCount - 1 do
    If Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row]) <> QuickRep1.Controls[I] then
       TQrCustomLabel(QuickRep1.Controls[I]).Font.Color := ClBlack
    else
       TQrCustomLabel(QuickRep1.Controls[I]).Font.Color := ClBlue;

end;

procedure TFrm_Modelos.btExcluiCampoClick(Sender: TObject);
var i:integer;
begin
   TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridCampos.Row])).Destroy;
   if GridCampos.Cells[0,1] <> '' then
     GridCampos.RowCount := GridCampos.RowCount + 1;

   For i:=0 to GridCampos.ColCount - 1 do
    GridCampos.Cells[I,GridCampos.RowCount - 1] := GridIncluidos.Cells[I,GridIncluidos.Row] ;
   GridIncluidos.DeletaLinha(GridIncluidos.Row);
   GridCampos.Row := GridCampos.RowCount - 1;
end;

procedure TFrm_Modelos.LinhaChange(Sender: TObject);
begin
 If (Linha.Text <> '') and (Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row]) <> Nil) then
  TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Top := StrToFloat(Linha.Text);
end;

procedure TFrm_Modelos.ColunaChange(Sender: TObject);
begin
 If (Coluna.Text <> '') and  (Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row]) <> Nil) then
  TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Left := StrToFloat(Coluna.Text);
end;

procedure TFrm_Modelos.TamanhoChange(Sender: TObject);
begin
 If (Tamanho.Text <> '') and (Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row]) <> Nil) then
  TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Width := StrToFloat(Tamanho.Text);
end;

procedure TFrm_Modelos.LarguraChange(Sender: TObject);
begin
 If (Largura.Text <> '') and (Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row]) <> Nil) then
  TQrCustomLabel(Self.FindComponent(GridIncluidos.Cells[GridIncluidos.ColCount - 1,GridIncluidos.Row])).Size.Height := StrToFloat(Largura.Text);
end;

procedure TFrm_Modelos.QtdeLinhaChange(Sender: TObject);
begin
 If Coluna.Text <> '' then
//  QuickRep1.Size.Left := StrToFloat(Coluna.Text);

end;

procedure TFrm_Modelos.FormCreate(Sender: TObject);
Var i:integer;
begin
   for i:=1 to GridCampos.ColCount - 1 do
     GridCampos.ColWidths[I] := -1;

   for i:=1 to GridIncluidos.ColCount - 1 do
     GridIncluidos.ColWidths[I] := -1;

   GridCampos.Cells[0,0] := 'Descrição';
   GridIncluidos.Cells[0,0] := 'Descrição';
   GridCampos.MovimentaCelula := True;
   GridIncluidos.MovimentaCelula := True;
end;

procedure TFrm_Modelos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

end.
