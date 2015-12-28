unit GridCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBGridControle, ToolWin, ComCtrls, ImgList,ConstantesAppl,
  ExtCtrls, StdCtrls, Mask, MaskEdit,funcoesglobais;

type
  TFrm_GridCons = class(TForm)
    DataSource1: TDataSource;
    ImageList1: TImageList;
    Grid: TDBGridControle;
    Bevel1: TBevel;
    Panel1: TPanel;
    Panel4: TPanel;
    botao_sair: TPanel;
    Panel3: TPanel;
    Panel8: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel6: TPanel;
    Panel7: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Panel11: TPanel;
    Label1: TLabel;
    EditPesquisa: TMaskEditControle;
    Label2: TLabel;
    EditPesquisa2: TMaskEditControle;
    Panel2: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
  private
    IndPesquisa:Integer;
    VGrid:TDbGridControle;
    factive:boolean;
    procedure TrocaPesquisa;
    { Private declarations }
  public
    CamposPesq:TStringList;
    VFecha:Boolean;
    { Public declarations }
  end;

var
  Frm_GridCons: TFrm_GridCons;
implementation
uses un_ajudacons;
{$R *.dfm}

procedure TFrm_GridCons.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
f:string;
i,i2,i3:integer;
begin
  if key = vk_escape then begin
   close;
   modalresult := mrcancel;
  end;

  if (key = vk_f7) and Panel1.Visible then
   trocapesquisa;

  if (key=VK_F1) then
  begin
        f := '';
        for i3:=0 to CamposPesq.count - 1 do
         for i:=0 to self.componentcount - 1 do
          if (self.components[i] is TDbGridControle) then
           if TDbGridControle(Self.Components[i]).DataSource.DataSet.fields.findfield(CamposPesq[i3]) <> Nil Then
             f := f + iifs(f <> '',iifs(i3 = CamposPesq.Count - 1,' e ',' ,'),'')+TDbGridControle(Self.Components[i]).DataSource.DataSet.fields.findfield(CamposPesq[i3]).DisplayLabel;



        Application.CreateForm(Tfrm_AjudaCons, frm_AjudaCons);
        with frm_AjudaCons do begin
          Memo1.Lines.clear;
          Memo1.Lines.Add('-- Atalhos --');
          Memo1.Lines.Add(' ');
          Memo1.Lines.Add('  [F2]    - Alterna entre grade e filtro');
          Memo1.Lines.Add('  [F7]    - Alterna filtros entre ');
          Memo1.Lines.Add('            '+F);
          if VFecha then
          Memo1.Lines.Add('  [ENTER] - Seleciona');
          Memo1.Lines.Add('  [ESC]   - Sai');
        end;
        frm_AjudaCons.showmodal;
        frm_AjudaCons.Free;

  end;

end;

procedure TFrm_GridCons.GridDblClick(Sender: TObject);
begin
 if VFecha Then begin
   modalresult := mrok;
   close;
 end;
end;

procedure TFrm_GridCons.FormDestroy(Sender: TObject);
begin
  If CamposPesq <> Nil Then
   CamposPesq.Destroy;
  frm_gridcons := nil;
end;

procedure TFrm_GridCons.FormCreate(Sender: TObject);
var i:integer;
begin
  FActive := false;
  IndPesquisa := -1;
  CamposPesq := TStringList.Create;
//  if CollorApplication <> -1 then
  // ToolBar1.Color := CollorApplication;
//  Grid.ToolBar := ToolBar1;
{    while ToolBar1.Componentcount > 0 do begin
      TGraphicControl(ToolBar1.Components[ToolBar1.ComponentCount - 1]).Parent := nil;
      ToolBar1.Components[ToolBar1.ComponentCount - 1].Destroy;
    end;}
end;

procedure TFrm_GridCons.FormActivate(Sender: TObject);
var
hR : THandle;
begin
 if not FActive then begin
  trocapesquisa;
  if FfocusgradeGridCons then
   grid.setfocus;
 end;
 FActive := true;
end;

procedure TFrm_GridCons.TrocaPesquisa;
var
I,i2:integer;
oldfont:TFont;
begin
 try
    if (CamposPesq = Nil) or (CamposPesq.count = 0) then
     exit;

    If Indpesquisa > -1 then
     EditPesquisa.SetFocus;

    if indpesquisa = CamposPesq.Count - 1 then
     IndPesquisa := 0
    else
     IndPesquisa := IndPesquisa + 1;
    for i:=0 to self.componentcount - 1 do
     if (self.components[i] is TDbGridControle) then
      for i2:=0 to TDbGridControle(Self.Components[i]).DataSource.DataSet.fields.count - 1 do
       if TDbGridControle(Self.Components[i]).DataSource.DataSet.fields.findfield(CamposPesq[indpesquisa]) <> Nil Then begin
         VGrid := TDbGridControle(Self.Components[i]);
         editpesquisa.clear;
         editpesquisa2.clear;

         Label1.Caption := 'Filtrar '+TDbGridControle(Self.Components[i]).DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).DisplayLabel;
         if TipoDataType(TDbGridControle(Self.Components[i]).DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).DataType) = dtdata then begin
          label2.visible := True;
          editpesquisa2.visible  := True;
          editpesquisa.editmask  := '99/99/9999;1; ';
          editpesquisa2.editmask := '99/99/9999;1; ';
          editpesquisa.width    := 100
         end else begin
          if TipoDataType(TDbGridControle(Self.Components[i]).DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).DataType) in [dtnumero,dtinteiro] then
            editpesquisa.width    := 100
          else begin
            OldFont               := Self.Canvas.Font;
            Self.Canvas.Font      := EditPesquisa.Font;
            editpesquisa.width    := self.canvas.textwidth(StringofChar('W',TDbGridControle(Self.Components[i]).DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).DisplayWidth)) + 3 - editpesquisa.Left;
            IF editpesquisa.width > Self.ClientWidth Then
             editpesquisa.width := Self.ClientWidth - 10;
            Self.Canvas.Font      := OldFont;
          end;
          editpesquisa.editmask := '';
          label2.visible := false;
          editpesquisa2.visible := false;
         end;
         editpesquisa2.width    := editpesquisa.width;
         exit;
       end;
   finally
    if not factive then begin
      botao_sair.left := botao_sair.Parent.width - botao_sair.Width - 3;
      panel7.caption := 'Esc -> Sai'+iifs(vfecha,' Sem Selecionar','');
      Panel7.left := Panel7.Parent.width - Panel7.width - 3;
      Label4.left := Label4.Parent.width - Label4.width - 3;
      panel4.font.assign(panel1.font);
      panel4.color := panel1.color;
      Label3.caption := '    [ '+self.caption+'  ] ';
      Panel5.visible := vfecha;
      PAnel8.Visible := Pos('VENDAS',UpperCase(Application.ExeName)) > 0;
      if Pos('VENDAS',UpperCase(Application.ExeName)) = 0 then begin
       with Panel3 do begin
        Caption    := 'Pesquisar >';
        BevelInner := bvNone;
        Width      := 113;
        font.style := [];
       end;
      end else begin
       panel10.align := alBottom;
       panel9.align := alBottom;
       panel10.BevelOuter := BvNone;
       panel9.BevelOuter := BvNone;
       panel10.BevelOuter := BvNone;
       panel11.BevelOuter := BvNone;
       panel1.Font.Name := 'Verdana';
       panel1.Font.Size := 8;
      end;
    end;
   end;

end;

procedure TFrm_GridCons.EditPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
FKey:Char;
fvis:boolean;
oldfield:TField;
i:integer;
begin
  if (key = vk_f2) and Grid.CanFocus Then
   Grid.SetFocus;

  FKey := #0;
  FVis := false;
  try
    if (key = vk_return) and not((Sender = EditPesquisa) and (EditPesquisa2.CanFocus))  then begin
      if Not Vgrid.DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).Visible Then begin
        Vgrid.DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).Visible := True;
        FVis := True;
      end;
      OldField  := Vgrid.SelectedField;
      Vgrid.SelectedField := Vgrid.DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]);
      if TipoDataType(Vgrid.DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).DataType) = dtdata then
        Vgrid.IndFaixa := 'Faixa Data'
      else if TipoDataType(Vgrid.DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).DataType) = dtinteiro then
        Vgrid.IndFaixa := 'Valor Identico'
      else
        Vgrid.IndFaixa := 'Inicio Palavra';
      Vgrid.Faixa1 := EditPesquisa.text;
      Vgrid.Faixa2 := EditPesquisa2.text;
      Vgrid.KeyPress(Fkey);
      for i:=0 to Vgrid.Columns.count - 1 do
        if Vgrid.Columns[i].Visible then
          break;
      Vgrid.SelectedField := Vgrid.DataSource.DataSet.fieldbyname(Vgrid.Columns[i].fieldname);
    end;
  finally
    if FVis Then
     Vgrid.DataSource.DataSet.fieldbyname(CamposPesq[indpesquisa]).Visible := False;
//    Vgrid.SelectedField := OldField;
  end;

end;

procedure TFrm_GridCons.Panel2Click(Sender: TObject);
begin
 trocapesquisa;
end;

procedure TFrm_GridCons.Panel3Click(Sender: TObject);
var
FKey:Word;
begin
  FKey := Vk_return;
  EditPesquisa.OnKeyDown(Sender,Fkey,[]);
end;

procedure TFrm_GridCons.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) and VFecha then begin
   close;
   modalresult := mrok;
  end;

  if (key = vk_f2) and EditPesquisa.CanFocus Then
   EditPesquisa.SetFocus;
end;

procedure TFrm_GridCons.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_GridCons.Panel6Click(Sender: TObject);
begin
  panel3.onclick(Panel3);
end;

end.
