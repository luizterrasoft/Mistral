unit MostraDetalhamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, GridControl, GridSql, Buttons, ExtCtrls,FuncPrint, Db,
  DBGrids, DBTables,TipoDef;

type
  TFrm_MostraDetalhamento = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GridCheque: TGridSql;
    GridCartao: TGridSql;
    GridDinheiro: TGridSql;
    GridOutros: TGridSql;
    Panel1: TPanel;
    Descricao: TLabel;
    Label30: TLabel;
    LbOrigem: TLabel;
    LbCliForn: TLabel;
    NumeroDocumento: TLabel;
    NomeCliForn: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    LbEmpresa: TLabel;
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Codigo: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure GridChequeGetCellColor(Sender: TObject; ARow, Acol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure GridChequeGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure GridCartaoGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure GridDinheiroGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure GridOutrosGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MostraDetalhamento: TFrm_MostraDetalhamento;

implementation

uses Qr_FPag;

{$R *.DFM}

procedure TFrm_MostraDetalhamento.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_MostraDetalhamento.GridChequeGetCellColor(Sender: TObject;
  ARow, Acol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
   if arow = 0 then begin
     afont.color  := ClWhite;
     afont.style  := [FsBold];
     abrush.color := ClTeal;
   end else if (TGridSql(Sender).FieldValue['CANCELAMENTO',ARow] <> '') then
     afont.color  := ClRed;
end;

procedure TFrm_MostraDetalhamento.GridChequeGetCellAlignment(
  Sender: TObject; ARow, ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
   If aCol = 1 Then HorAlignment := taRightJustify;
end;

procedure TFrm_MostraDetalhamento.GridCartaoGetCellAlignment(
  Sender: TObject; ARow, ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
   If aCol in [1,2,3] Then HorAlignment := taRightJustify;
end;

procedure TFrm_MostraDetalhamento.GridDinheiroGetCellAlignment(
  Sender: TObject; ARow, ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
   If aCol = 1 Then HorAlignment := taRightJustify;
end;

procedure TFrm_MostraDetalhamento.GridOutrosGetCellAlignment(
  Sender: TObject; ARow, ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
   If aCol = 1 Then HorAlignment := taRightJustify;
end;

procedure TFrm_MostraDetalhamento.BitBtn4Click(Sender: TObject);
begin
    Frm_Qr_FPag := TFrm_Qr_FPag.Create(Application);
    With Frm_Qr_FPag do begin
        cprint.preview     := true;
        cprint.zoom        := 100;
        cprint.Orientation := 0;
        FDinheiro          := true;
        FCartao            := true;
        FCheque            := true;
        FOutrasFP          := true;
        Documento1         := NumeroDocumento.Caption;
        Documento2         := NumeroDocumento.Caption;
        Origem             := LbOrigem.Caption;
        PagRec             := IIfs(LbCliForn.Caption = 'Cliente','R','P');
        ClienteFornecedor  := Codigo.Caption;
        QrLabel39.CAption  := 'Detalhamento do Documento '+NumeroDocumento.Caption+'('+lborigem.caption+')';
        Empresa            := LbEmpresa.Caption;
        Imprelatorio(ReportFPag,Frm_Qr_FPag);
        free;
    end;
end;

procedure TFrm_MostraDetalhamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     action := cafree;
end;

end.



