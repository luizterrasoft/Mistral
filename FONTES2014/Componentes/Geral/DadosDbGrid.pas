unit DadosDbGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckControle, ComboSql, Mask, MaskEdit,Tipodef,
  Grids, GridControl, GridSql, ComCtrls, ExtCtrls;

type
  TFrm_DadosDbGrid = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TMaskEditControle;
    Edit2: TMaskEditControle;
    Pesquisa: TComboSql;
    CkConcatena: TCheckControle;
    CkDiferente: TCheckControle;
    CkSeparador: TCheckControle;
    TabSheet2: TTabSheet;
    GridOrdem: TGridSql;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    CkNupper: TCheckControle;
    TabSheet3: TTabSheet;
    GridTotal: TGridSql;
    CkPesqMestre: TCheckControle;
    CkAllDetals: TCheckControle;
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PesquisaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridOrdemEnter(Sender: TObject);
    procedure GridOrdemExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridTotalGetCellAlignment(Sender: TObject; ARow,
      ACol: Integer; var HorAlignment: TAlignment;
      var VerAlignment: TVerticalAlignment);
    procedure GridOrdemSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_DadosDbGrid: TFrm_DadosDbGrid;

implementation

{$R *.DFM}

procedure TFrm_DadosDbGrid.FormDestroy(Sender: TObject);
begin
   Frm_DadosDbGrid := Nil;
end;

procedure TFrm_DadosDbGrid.FormActivate(Sender: TObject);
begin
  If (Edit1.Tag = 1) and (PageControl1.ActivePageIndex = 0) Then begin
    Edit1.SetFocus;
    Edit1.SelLength := 0;
    Edit1.SelStart  := IIfs(Edit1.EditMask = '',Length(Edit1.Text) + 1,1);
    Edit1.Tag := 0;
 end;
end;

procedure TFrm_DadosDbGrid.FormCreate(Sender: TObject);
begin
   Pesquisa.ItemIndex := 0;
   With GridOrdem do begin
      MovimentaCelula := True;
      TituloHorizontal.Automatico := True;
      TituloHorizontal.Refresh(0);
      With SetCombo(0,-1,1) do begin
        Retorno := RcValores;
      end;
      ColWidths[1] := -1;
      With SetCombo(2,-1,2) do begin
        Retorno := RcText;
        Items.Add('Asc');
        Items.Add('Desc');
      end;
   end;
   GridTotal.TituloHorizontal.Automatico := True;
   GridTotal.TituloHorizontal.Refresh(1);
end;

procedure TFrm_DadosDbGrid.PesquisaExit(Sender: TObject);
var OldVisi :Boolean;
begin
   OldVisi := Edit2.Visible;
   If Pos('Faixa',Pesquisa.Text) > 0 Then begin
     Edit2.Visible  := True;
     Edit1.Width    := Edit2.Width;
     If Pos('FAIXA DATA',UpperCase(Pesquisa.Text)) > 0 Then Begin
       Edit1.VerificaData := True;
       Edit1.VerificaHora := Pesquisa.Text = 'Faixa Data/Hora';
       Edit1.EditMask := '99/99/9999'+IIfs(Pesquisa.Text = 'Faixa Data/Hora',' 99:99','');
       Edit2.EditMask := Edit1.EditMask;
       Edit1.Text     := Copy(Edit1.Text,1,Length(Edit1.EditMask));
       Edit2.Text     := Copy(Edit2.Text,1,Length(Edit2.EditMask));
     end;
   end else begin
     Edit1.VerificaData := False;
     Edit1.VerificaHora := False;
     Edit2.Visible := False;
     Edit1.Width := Edit2.Left + Edit2.Width;
   end;
   Edit2.VerificaData := Edit1.VerificaData;
   Edit2.VerificaHora := Edit1.VerificaHora;
   If Pesquisa.OldFocus and Edit2.Visible and Not OldVisi and Edit2.EditemBranco Then
    Edit2.SetFocus;
end;

procedure TFrm_DadosDbGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = Vk_Escape Then begin
      ModalResult := mrCancel;
      Close;
    end;
end;

procedure TFrm_DadosDbGrid.GridOrdemEnter(Sender: TObject);
begin
   Bitbtn1.Default := False;
end;

procedure TFrm_DadosDbGrid.GridOrdemExit(Sender: TObject);
begin
   Bitbtn1.Default := True;
end;

procedure TFrm_DadosDbGrid.FormShow(Sender: TObject);
begin
  GridOrdem.TituloHorizontal.Refresh(0);
end;

procedure TFrm_DadosDbGrid.GridTotalGetCellAlignment(Sender: TObject; ARow,
  ACol: Integer; var HorAlignment: TAlignment;
  var VerAlignment: TVerticalAlignment);
begin
   If Acol <> 0 Then
    HorAlignment := taRightJustify; 
end;

procedure TFrm_DadosDbGrid.GridOrdemSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i:integer;
begin
  for i:=1 to gridordem.RowCount - 1 do
    if (i <> Gridordem.Row) and (gridordem.Cells[0,i] = gridordem.Cells[0,GridOrdem.row]) then begin
      ShowMessage('Campo Duplicado');
      canselect := false;
      exit;
    end;

end;

end.
