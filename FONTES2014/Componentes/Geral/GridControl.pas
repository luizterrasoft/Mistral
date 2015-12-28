Unit GridControl;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids,TipoDef,{RdPrint,}Math,ConstantesAppl;

type
  TVerticalAlignment = (vaTop, vaCenter, vaBottom);
  TMultiGridAlignmentEvent=procedure(Sender:TObject;ARow,ACol:LongInt;
var HorAlignment:TAlignment;var VerAlignment:TVerticalAlignment) of object;
  TMultiGridColorEvent=procedure(Sender:TObject;ARow,Acol:LongInt;
  AState:TGridDrawState;ABrush:TBrush;AFont:TFont) of object;

  TOnMovLinha=procedure(Sender:TObject;Acol,ARow,OldCol,OldRow:LongInt;FMouse:Boolean) of object;

  TImpgrid = record
    Align:TAlignment;
    Total:Boolean;
    Nimprime:Boolean;
    VlTotal:Double;
  end;

  Timpsgrid = Array of TImpGrid;




  TGridControl = class(TStringGrid)
  private
    oldvalueposicionalinha:string;
    oldrowposiconalinha :integer;
    FSkipControl  : Boolean;
    OldSelectCell:TSelectCellEvent;
    VarEncontrou : Boolean;
    VarSaiemBranco : Boolean;
    FMovimentaCelula : Boolean;
    FLimite : SmallInt;
    FAlignment : TAlignment;
    FVerticalAlignment : TVerticalAlignment;
    FMultiLinea : Boolean;
    FOnGetCellAlignment : TMultiGridAlignmentEvent;
    FOnGetCellColor : TMultiGridColorEvent;
    FPulaCelula : Array of Boolean;
    FCtrlDelete : Boolean;
    FCanselect,FIncluiLinha : Boolean;
    FDeletaLinha: TNotifyEvent;
    FAuxselectcell :TSelectCellEvent;
    FPulaSelectCell: Boolean;
    FPosicionaLinha: SmallInt;
    FPosicionarLinha: Boolean;
    FOldColWidths   : Array of Integer;
    FONMOVIMENTACelula: TNotifyEvent;
    FMovMouseLinha: Boolean;
    FChaveImp: String;
    FTituloImp: String;
    FPaginaImp,FLinhaImp:Integer;
    FOnMovLinha: TOnMovLinha;
    FOnBeginMovLinha: TOnMovLinha;
    FColChaves: String;
    FAndaProLado: Boolean;
    Procedure CreateWnd;Override;
    procedure SetAlignment(Valor : TAlignment);
    procedure SetVerticalAlignment(Valor : TVerticalAlignment);
    procedure SetMultiLinea(Valor : Boolean);
    Function  GetFPulaColuna(ACol:Integer) : Boolean;
    Procedure SetFPulaColuna(ACol : Integer;Const Value : Boolean);
    function GetRowCount: Integer;
    procedure SetPulaSelectCell(const Value: Boolean);
    function GetOldColWidths(ACol: Integer): Integer;
    procedure SetOldColWidths(ACol: Integer; const Value: Integer);
    function GetOldCells(Acol, Arow: Integer): String;
    procedure SetOldCells(Acol, Arow: Integer; const Value: String);
    function GetCells(Acol, Arow: Integer): String;
    procedure SetCells(Acol, Arow: Integer; const Value: String);
    procedure SetPosicionarLinha(const Value: Boolean);
  protected
    OldResult,Veiodoexit     : boolean;
    procedure DrawCell(ACol,ARow : LongInt; ARect : TRect;AState : TGridDrawState); override;
    procedure KeyPress(var Key: Char);override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoExit; override;
    Procedure DoEnter;Override;
    Procedure SetRowCount(const Value: Integer);
    procedure SizeChanged(OldColCount, OldRowCount: Longint);override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
  public
    FDupl:Boolean;
    OldListCol,OldListRow:Array of TStringList;
    ImpGrid:TImpsGrid;
    AbortaInsert,FMouse,FInsert,FromPulaCelula,FSaiuEmBranco,FSaidoExit,FSaidoEnter,InserindoLinha : Boolean;
    FLinhaMove:LongInt;
    constructor Create(AOwner : TComponent); override;
    Destructor Destroy;override;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure Limpa;
    Procedure RefreshOldCells;
    property  PulaSelectCell  : Boolean read FPulaSelectCell write SetPulaSelectCell Default False;
    property  MovimentaCelula : Boolean read FMovimentaCelula write FMovimentaCelula default false;
    property  CellSkip[ACol : Integer] : Boolean read GetFPulaColuna write SetFPulaColuna;
    Property  OldCells[Acol,Arow:Integer]:String read GetOldCells write SetOldCells;
    property  OldColWidths[ACol :longInt]:Integer read GetOldColWidths write SetOldColWidths;
    Property  Cells[Acol,Arow:LongInt]:String read GetCells write SetCells;
    procedure deletalinha(Linha:Integer);Virtual;
    Function  LinhaVazia(Ind:Integer):Boolean;
    Procedure Insert(Linha:LongInt;NMovLinha:Boolean=False);Virtual;
    Function  FirstCol:LongInt;
    Function  LastCol:LongInt;
    Procedure MovLinha(Origem,Destino:LongInt);
    Procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);Override;
    Procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);Override;
//    procedure ImprimirGrid(VRDPrint:TRdPrint);
    Function  ColunaAlterada(ACol,Arow:longInt):Boolean;
    function  PrimeiraColunaHab:Integer;
  published
    property ScrollBars;
    property Limite   : SmallInt read FLimite write FLimite default -1;
    property CtrlDelete  : Boolean read FCtrlDelete  write FCtrlDelete default false;
    property IncluiLinha : Boolean read FIncluiLinha write FIncluiLinha  default false;
    property Alignment : TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property VerticalAlignment : TVerticalAlignment read FVerticalAlignment write SetVerticalAlignment default vaCenter;
    property MultiLinea : Boolean read FMultiLinea write SetMultiLinea default False;
    property OnGetCellAlignment : TMultiGridAlignmentEvent read FOnGetCellAlignment write FOnGetCellAlignment;
    property OnGetCellColor : TMultiGridColorEvent read FOnGetCellColor write FOnGetCellColor;
    property Options default [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goRowSizing,goColSizing];
    Property SaiemBranco : Boolean read VarSaiemBranco write VarSaiEmBranco Default False;
    Property Encontrou : Boolean read VarEncontrou write VarEncontrou Default False;
    Property OnDeletaLinha : TNotifyEvent read FDeletaLinha Write FDeletaLinha;
    Property OnMovimentaCelula : TNotifyEvent read FOnMovimentaCelula Write FOnMovimentaCelula;
    Property PosicionaLinha :SmallInt Read FPosicionaLinha Write FPosicionaLinha default -1;
    Property PosicionarLinha :Boolean Read FPosicionarLinha Write SetPosicionarLinha;
    Property MovMouseLinha :Boolean Read FMovMouseLinha Write FMovMouseLinha;
    Property ChaveImp :String read FChaveImp write FChaveImp;
    Property TituloImp :String read FTituloImp write FTituloImp;
    property OnBeginMovLinha :TOnMovLinha read FOnBeginMovLinha write FOnBeginMovLinha;
    property OnMovLinha :TOnMovLinha read FOnMovLinha write FOnMovLinha;
    property ColChaves : String read FColChaves write FColChaves;
    property AndaProLado:Boolean read FAndaProLado write FAndaProLado;
//    Property RowCount    : Integer Read GetRowCount Write SetRowCount Stored False;
  end;

procedure Register;

implementation
Uses {Setup,}Funcoesglobais;

constructor TGridControl.Create(AOwner : TComponent);
var I,I2:Integer;
begin
  inherited Create(AOwner);

  SetLength(FPulaCelula,ColCount);
  FAlignment:=taLeftJustify;
  FVerticalAlignment:=vaCenter;
  FDupl:= False;
  FSaiuEmBranco := False;
  FSkipControl := False;
  FromPulaCelula := False;
  Finsert        := False;
  FMultiLinea:=False;
  Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goRowSizing,goColSizing];
  Flimite := -1;
  FLinhaMove := -1;
  InserindoLinha := False;
  DefaultRowHeight := 18;
  FMouse := False;
  AbortaInsert := False;
  oldrowposiconalinha := -1;
  oldvalueposicionalinha := '';


  While Length(OldListCol) <> ColCount do
      if ColCount > Length(OldListCol) then begin
           SetLength(OldListCol,Length(OldListCol) + 1);
           OldListCol[Length(OldListCol) - 1] := TStringList.Create;
           While (OldListCol[Length(OldListCol) - 1].Count <> RowCount) do
             OldListCol[Length(OldListCol) - 1].Add('');
      end else begin
            If OldListCol[Length(OldListCol) - 1] <> Nil then OldListCol[Length(OldListCol) - 1].Destroy;
            SetLength(OldListCol,Length(OldListCol) - 1);
      end;


  RowCount         := 2;
  OldResult        := True;
  Veiodoexit       := False;
  FLinhaImp        := 0;
  FPaginaImp       := 1;
end;

procedure TGridControl.SetAlignment(Valor : TAlignment);
begin
  if valor <> FAlignment then
  begin
    FAlignment:=Valor;
    Invalidate;
  end;
end;

procedure TGridControl.SetVerticalAlignment(Valor : TVerticalAlignment);
begin
  if valor <> FVerticalAlignment then
  begin
    FVerticalAlignment:=Valor;
    Invalidate;
  end;

end;

procedure TGridControl.SetMultiLinea(Valor : Boolean);
begin
  if valor <> FMultiLinea then
  begin
    FMultiLinea:=Valor;
    Invalidate;
  end;
end;

procedure TGridControl.DrawCell(ACol,ARow : LongInt; ARect : TRect;
 AState : TGridDrawState);
Const
  TextAlignments : Array[TAlignment] of Word = (dt_Left, dt_Right,
 dt_Center);
Var
  HorAlineacion : TAlignment;
  VerAlineacion : TVerticalAlignment;
  Texto : string;
  Altura : integer;
  CRect : TRect;

  opciones : integer;
begin
  Texto:=Cells[Acol,ARow];
  HorAlineacion:=FAlignment;
  VerAlineacion:=FVerticalAlignment;
  if Assigned(FOnGetCellAlignment) then FOnGetCellAlignment
(Self,ARow,ACol,HorAlineacion,VerAlineacion);
  if Assigned(FOnGetCellColor) then
    FOnGetCellColor(Self,ARow,ACol,AState,Canvas.Brush,Canvas.Font);
  Canvas.FillRect(ARect);
  Inc(ARect.Left,2);
  Dec(ARect.Right,2);
  CRect:=Arect;
  opciones:=TextAlignments[HorAlineacion] or dt_VCenter;

  if Multilinea then opciones:=opciones or dt_WordBreak;
  if not DefaultDrawing then
    inherited DrawCell(ACol,ARow,ARect,AState)
  else
    with ARect,Canvas do
    begin
      Altura:=DrawText(Handle,PChar(Texto),-1,CRect,opciones or dt_CalcRect);
      if FVerticalAlignment = vaCenter then
      begin
        if Altura < Bottom-Top+1 then
        begin
          Top:=(Bottom+Top-Altura) shr 1;
          Bottom:=Top+Altura;
        end;
      end
      else if FVerticalAlignment = vaBottom then

        if Altura < Bottom-Top+1 then Top:=Bottom-Altura;
       DrawText(Handle,PChar(Texto),-1,ARect,opciones)
    end;
end;


function TGridControl.SelectCell(ACol, ARow: Longint): Boolean;
Var nQuantPula : Byte;
    OldCol     : Word;
    VColChaves:Array of Integer;
    VVarChaves:Array of String;
    i:integer;
    oldlimite:integer;
Begin
//      If Veiodoexit then  exit;
//    refreshOldCells;
//    Fdupl := false;
    OldCells[ACol,Arow] := Cells[ACOl,AROW];
    oldlimite           := Flimite;
    If Flimite < 0 Then
      FLimite := LastCol;

    iF aROW  <> Row then begin
      oldrowposiconalinha := -1;
      oldvalueposicionalinha := '';
    end;

    Try

          If (FColChaves <> '')  then
            With SeparaString(FColChaves) do
             try
                 If IndexOf(inttostr(Col)) > -1 then begin
                     SetLength(VcolChaves,0);
                     SetLength(VVarChaves,0);
                     for i:=0 to count - 1 do begin
                      SetLength(VcolChaves,length(VcolChaves)  + 1);
                      SetLength(VVarChaves,length(VVarChaves) + 1);
                      VColChaves[i] := strtointn(strings[i]);
                      VVarChaves[i] := cells[strtointn(strings[i]),row];
                     end;

                     i := linhaduplicadagrid(Self,VColChaves,VVarChaves,row);
                     if  (i > -1) and (i <> row)  then
                       try
                         fdupl := true;
                         FSkipControl := True;
                         SetPulaSelectCell(True);
                         FSkipControl := true;
                         MovLinha(I,row);
                         deletalinha(Row + IIfs(Row > i,-1,1));
                         if (col = lastcol) and inserindolinha then
                           deletalinha(Row);
                         Arow := Row;
                       finally
                         FSkipControl := false;
                       end;
                 end;
              finally
                 destroy;
              end;


          If FSkipControl or PulaSelectCell or FromPulaCelula  then begin
             Result := True;
             Exit;
          end;

          If (OldLimite > -1) And (ACol > FLimite) Then Begin
              Result := False;
              Exit;
          End;

          If Not (GoEditing in Options) then begin
             Result := Inherited SelectCell(ACol, ARow);
             Exit;
          end;



          If ((FPulaCelula[ACol]) or (ColWidths[ACol] < 0)) Then Begin
                  If (ACol > Col) Then Begin
                     If Col + 1 < ColCount -1 Then Begin
                               nQuantPula   := 1;
                               While (Col+nQuantPula < ColCount) And
                                     (FPulaCelula[Col+nQuantPula] Or (ColWidths[Col+nQuantPula] < 0))  do
                                 Inc(nQuantPula);
                               FromPulaCelula := true;
                               FSkipControl   := True;
                               Result         := False;
                               Try
                                   If Inherited SelectCell(Col + NQuantPula, ARow) and
                                     (ColCount - 1 >= Col + NQuantPula) and
                                     ((FLimite >= Col + NQuantPula) or (Flimite < 0)) then
                                        Col  := Col + nQuantPula;
                               finally
                                   FSkipControl   := False;
                                   FromPulaCelula := False;
                               end;
                               Exit;
                      End;
                  End
                  Else Begin
                      If Col > 0 Then Begin
                           nQuantPula   := 1;
                           While (Col - nQuantPula > 0) and
                                 (FPulaCelula[Col-nQuantPula] Or (ColWidths[Col-nQuantPula] < 0))  do
                             Inc(nQuantPula);
                           FromPulaCelula := true;
                           FSkipControl   := True;
                           Result         := False;
                           Try
                               If Inherited SelectCell(Col - NQuantPula, ARow) and
                                 (Col - NQuantPula >= 0) then
                                   Col  := Col - nQuantPula;
                           finally
                               FSkipControl   := False;
                               FromPulaCelula := False;
                           end;
                           Exit;
                      End
                     else begin // ALTEREI POIS QUANDO ERA ZERO ELE Não Movimentava a linha
                        Result := Inherited SelectCell(ACol, ARow);
                        Exit;
                     end;
                  End;
              //End;
              Exit;
          End;

          OldCol       := Col;

      //    Fskipcontrol := True;
          Result       := Inherited SelectCell(ACol, ARow);
      //    Fskipcontrol := False;

    finally
          Flimite := OldLimite;
          If Result then OldCells[Col,row] := Cells[COl,ROW];
          If FDupl  then SetPulaSelectCell(False);
    end;
End;


procedure TGridControl.KeyPress(var Key: Char);
Var VarKey :Char;
    i,i2 : integer;
    FAuxselectcell :TSelectCellEvent;
    FCanSelect:Boolean;
    fkey,Teste:String;
Begin
    VarKey := Key;

    Inherited KeyPress(Key);
    If FPosicionarLinha and (FPosicionaLinha > -1) and Not(goEditing in Options) and Not(UpCase(Key) in [#0,#13,#8,#27,#9]) and
    Not tbKeyIsDown(Vk_Control) and not tbKeyIsDown(Vk_Menu) then begin
         fkey := tiraacento(iifs((oldrowposiconalinha > -1) and (oldrowposiconalinha = row),oldvalueposicionalinha,'')+key);
//         I := IIfs(Row = RowCount - 1,FixedRows,Row + 1);
//         While (I <> Row) do begin
         I :=  Row;
         I2 := FixedRows;
         While (I2 <> RowCount + 1) do begin
            If (UpperCase(fKey) = TiraAcento(UpperCase(Copy(Cells[FPosicionaLinha,I],1,length(fkey))))) then begin
               Row := I;
               break;
            end;
            I := IIfs(I = RowCount - 1,FixedRows,I + 1);
            Inc(I2);
         end;
         if I2 = RowCount + 1 then begin
           oldrowposiconalinha := -1;
           oldvalueposicionalinha := '';
         end else begin
           oldrowposiconalinha := row;
           oldvalueposicionalinha := fkey;
         end;
     end;


    If VarKey = #13 Then Begin
      If FMovimentaCelula Then Begin

       for i:=fixedcols to colcount - 1 do
        if not fpulacelula[i] then
         break;

        If VarSaiEmBranco and (RowCount - 1 = Row) and
           (((Cells[I,Row] = '') and FIncluiLinha)  or ((Limite <> - 1) and (Limite = Col)  and Not FIncluiLinha))
          Then begin
//               DoExit;
               FSaiuEmBranco := True;
               TControl(Owner).Perform(WM_NEXTDLGCTL,0,0);
               Exit;
          End;
          Try
              If (Col <> LastCol) And ((Col <> FLimite) Or (FLimite = -1) )  Then
                  Col := Col + 1
              Else Begin
                  If Row <> RowCount -1 Then begin
                      Row := Row + 1;
                      If FAndaProLado then
                       try
                         FskipControl := True;
                         SetPulaSelectCell(True);
                         Col := PrimeiraColunaHab;
                       finally
                         FskipControl := False;
                         SetPulaSelectCell(False);
                       end;
                  end Else Begin
                      If FIncluiLinha Then Begin
                          RowCount := RowCount + 1;
                          Rows[RowCount-1].Clear;
                          InserindoLinha := True;
                          FskipControl := True;
                          If Not (Inherited SelectCell(I, RowCount -  1)) or AbortaInsert then begin
                           DeletaLinha(RowCount -  1);
                           If Not AbortaInsert Then
                            Exit;
                          end;
                          Col := I;
                          Row := RowCount - 1;
                      End;
                  End;
              End;
              if Assigned(FOnMovimentaCelula) then
               FOnMovimentaCelula(Self);
          finally
               FskipControl := False;
               InserindoLinha := False;
               AbortaInsert := False;
          end;
      End;
    End;

End;

procedure TGridControl.KeyDown(var Key: Word; Shift: TShiftState);
Var Loop,Loop2 : Word;
Begin
     if (key = vk_control) and (Shift = []) then begin
       oldrowposiconalinha := -1;
       oldvalueposicionalinha := '';
     end;

     If (Key = VK_DELETE) And (Shift = [ssCtrl]) And FCtrlDelete Then Begin
        if Assigned(FDeletaLinha) then
          FDeletaLinha(Self);
        deletalinha(Row);
        inherited KeyDown(Key,Shift);
     End
     Else
         inherited KeyDown(Key,Shift);

     If (Key = VK_INSERT) and FIncluiLinha and (GoEditing in Options) then
      Try
        InserindoLinha := True;
        if (ssCtrl in Shift) then
         Insert(Row + 1)
        else
         Insert(RowCount);
       finally
         InserindoLinha := False;
       end;

End;


procedure TGridControl.Limpa;
Var Loop,Loop2 : Word;
Begin
         FSkipControl := True;
         For Loop := FixedRows To RowCount - 1 Do
                Rows[Loop].Clear;
               //For Loop2 := FixedCols To ColCount-1 Do
               //     Cells[Loop2,Loop] := '';

         RowCount := FixedRows + 1;
         FSkipControl := False;
End;


procedure TGridControl.SizeChanged(OldColCount, OldRowCount: Longint);
var i,i2:Integer;
Begin


{   If ColCount <> OldColCount then begin
      if ColCount > OLdColCount then begin
         For i:=OLdColCount - 1 to ColCount - 2 do begin
           SetLength(OldListCol,Length(OldListCol) + 1);
           OldListCol[Length(OldListCol) - 1] := TStringList.Create;
         end;
      end else if ColCount < OldColCount then begin
         For i:=OLdColCount - 2 downto ColCount - 1 do begin
           If OldListCol[Length(OldListCol) - 1] <> Nil then OldListCol[Length(OldListCol) - 1].Destroy;
           SetLength(OldListCol,Length(OldListCol) - 1);
         end;
       end;
   end;

   if RowCount <> OLdRowCount then
     For i:=0 to ColCount - 1 do
        if RowCount > OLdRowCount then
           For i2:=oldRowCount to RowCount - 1 do
             OldListCol[i].Add('')
     else if RowCount < OldRowCount then
         For i2:=oldRowCount - 2 downto RowCount - 1 do
          OldListCol[i].Delete(OldListCol[i].Count - 1);}


   if colCount <> OLdcolCount then
     While Length(OldListCol) <> ColCount do
        if ColCount > OLdColCount then begin
             SetLength(OldListCol,Length(OldListCol) + 1);
             OldListCol[Length(OldListCol) - 1] := TStringList.Create;
             While (OldListCol[Length(OldListCol) - 1].Count <> RowCount) do
               OldListCol[Length(OldListCol) - 1].Add('');
        end else begin
             If OldListCol[Length(OldListCol) - 1] <> Nil then OldListCol[Length(OldListCol) - 1].Destroy;
             SetLength(OldListCol,Length(OldListCol) - 1);
        end;

   if RowCount <> OLdRowCount then
      For i:=0 to ColCount - 1 do
        While (OldListCol[i].Count <> RowCount) do
           if RowCount > OLdRowCount then
               OldListCol[i].Add('')
           else
               OldListCol[i].Delete(OldListCol[i].Count - 1);


   inherited SizeChanged(OldColCount,OldRowCount);


   If OldColCount <> ColCount Then begin
        SetLength(FPulaCelula,ColCount);
        SetLength(ImpGrid,ColCount);
        SetLength(FOldColWidths,ColCount);
        If (OldColCount > 0) and (ColCount > OldColCount) then
          for i:=OldColCount to ColCount - 1 do
           FOldColWidths[I] := DefaultColWidth;
   end;
end;

Function TGridControl.GetFPulaColuna(ACol:Integer) : Boolean;
Begin
    Result := FPulaCelula[ACol];
End;

procedure TGridControl.SetFPulaColuna(ACol : Integer;Const Value : Boolean);
Begin
    FPulaCelula[ACol] := Value;
End;

procedure TGridControl.DoExit;
Begin
    If FSaidoExit then
     exit;


    If inherited SelectCell(Col,Row) then begin {or Not Focused}
       Try
           inherited DoExit;
           oldrowposiconalinha := -1;
           oldvalueposicionalinha := '';
       finally
           If (StatusPanelHintAppl <> Nil) and (Application <> Nil) Then
            StatusPanelHintAppl.Text := Application.Hint;
       end;
    end Else begin
        try
           FskipControl := True;
           SetFocus;
        finally
           FskipControl := False;
        end;
    end;
End;


procedure Register;
begin
  RegisterComponents('Sistema', [TGridControl]);
end;

procedure TGridControl.deletalinha(Linha: Integer);
Var Loop,Loop2 : Word;
    OldFskipControl,Fselectcell:Boolean;
begin
      OldFskipcontrol := FSkipControl;
      FSelectCell  := True;

      If (Rowcount = Fixedrows) then begin
          for Loop:=Fixedcols to colcount - 1 do
            if cells[Loop,Fixedrows] <> '' then
             break;
         FSelectCell := Loop > colcount - 1;
      end;


      FskipControl := True;
      For Loop := Linha To RowCount Do begin
          Rows[Loop].Clear;
        For Loop2 := FixedCols To ColCount-1 Do
             Cells[Loop2,Loop] := Cells[Loop2,Loop+1];
      end;

        If RowCount-1 > FixedRows Then Begin
             Rows[RowCount -1].Clear;
             RowCount := RowCount -1;
         End
         Else
              Rows[RowCount-1].Clear;
      FskipControl := False;

   If FselectCell and Not OldFskipControl then
     inherited SelectCell(Col,Row);
end;

procedure TGridControl.DoEnter;
Var
i : integer;
begin

  If ShowHint and (ConstantesAppl.StatusPanelHintAppl <> Nil) Then
    StatusPanelHintAppl.Text := Hint;

  If FskipControl or FSaidoEnter then begin
    If Not FSkipControl then
      FSaidoEnter := False;
    exit;
  end;  

  FSaiuEmBranco := False;

  inherited DoEnter;

  If (not FPulaCelula[Col]) and (ColWidths[Col] > 0)  then begin
    selectcell(Col,Row);
    exit;
  end;

  I := 0;
  while (FPulaCelula[I]) and (ColWidths[Col] > 0) do begin
     Inc(I);
     If I = ColCount - 1 then
      break;
  end;

  Col := I;
end;


function TGridControl.LinhaVazia(Ind: Integer): Boolean;
var i : integer;
begin
   Result := True;
   For i:=FixedCols to ColCount - 1 do begin
     Result := (Cells[I,Ind] = '');
     If Not Result then Exit;
   end;
end;

function TGridControl.GetRowCount: Integer;
begin
  result :=  TStringGrid(Self).RowCount;
end;

procedure TGridControl.SetRowCount(const Value: Integer);
begin
  TStringGrid(Self).RowCount := Value;
end;

procedure TGridControl.CreateWnd;
Var
I:Word;
begin
  inherited CreateWnd;

{  If colcount > 0 then
   For i:=0 to ColCount - 1 do
     FOldColWidths[I] := ColWidths[I];}
//  SetRowCount(GetRowCount);

end;

procedure TGridControl.SetPulaSelectCell(const Value: Boolean);
begin
    If Value = FPulaSelectCell then
     exit;

    FPulaSelectCell := Value;
    If Not FPulaSelectCell then
      OnSelectCell := OldSelectCell
    else begin
      OldSelectCell := OnSelectCell;
      OnSelectCell := Nil;
    end;
end;

function TGridControl.GetOldColWidths(ACol: Integer): Integer;
begin
  Result := FOldColWidths[ACol];
end;

procedure TGridControl.SetOldColWidths(ACol: Integer;
  const Value: Integer);
begin
  FOldColWidths[ACol] := Value;
end;

procedure TGridControl.CreateWindowHandle(const Params: TCreateParams);
var i:longint;
begin
  inherited CreateWindowHandle(Params);

  SetLength(FOldColWidths,ColCount);
  If colcount > 0 then
     For i:=0 to ColCount - 1 do
       FOldColWidths[I] := ColWidths[I];
end;

procedure TGridControl.Insert(Linha: Integer;NMovLinha:Boolean=False);
var i,i2:integer;
begin
    If Linha <= fixedRows - 1 then
     exit;

   If Linha > rowcount - 1 then begin
     if Not Inherited SelectCell(FirstCol,Linha) then
      exit;

     I2             := RowCount;
     RowCount       := Linha + 1;

     For i:=i2  to rowcount - 1 do
      Rows[i].Clear;

     PulaSelectCell := True;
     Row            := Linha;
     If Not NMovLinha Then
       Col  := FirstCol;
     PulaSelectCell := False;
     FinSert        := True;
     if Assigned(FOnMovimentaCelula) then
       FOnMovimentaCelula(Self);
     FinSert        := False;
   end else begin
     rowcount := rowcount + 1;
     for i:=Rowcount - 2 Downto Linha  do
       for i2:=0 to colcount - 1 do
         cells[i2,i + 1] := cells[i2,i];
     Rows[Linha].Clear;

     PulaSelectCell := True;
     Row            := Linha;
     If Not NMovLinha Then
      Col := FirstCol;
     PulaSelectCell := False;
     FinSert        := True;
     if Assigned(FOnMovimentaCelula) then
       FOnMovimentaCelula(Self);
     FinSert        := False;
   end;

end;

function TGridControl.FirstCol: LongInt;
var i:Integer;
begin
  Result := -1;
  for i:=0 to colcount - 1 do
     If not CellSkip[i] then
       break;
  If I <= colcount - 1 then
   Result := I;
end;

procedure TGridControl.MovLinha(Origem,Destino:LongInt);
var I,I2,I3,OldRow : Word;
    FRows:Array of String;
begin
       If (Origem = Destino) then
        exit;

       If Assigned(FOnBeginMovLinha) Then
        FOnBeginMovLinha(Self,Col,Destino,Col,Origem,FMouse);
        
       SetLEngth(FRows,colcount);

       For i:=0 to colcount - 1 do
          FRows[I] := Cells[I,Origem];

       for i:=0 to colcount - 1 do
         if  Destino > Origem then
           For i2:=Origem to Destino - 1 do
              Cells[I,i2] := Cells[I,i2 + 1]
         else begin
           For i2:=Origem - 1 downto Destino do
              Cells[I,i2 + 1] := Cells[I,i2];
         end;

       For i:=0 to colcount - 1 do
          Cells[I,Destino] := FRows[I];

       If Assigned(FOnMovLinha) Then
        FOnMovLinha(Self,Col,Destino,Col,Origem,FMouse);
end;

procedure TGridControl.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FLinhaMove := Row;
  FMouse     := FMovMouseLinha and (ssAlt in Shift); 
  inherited MouseDown(Button,Shift,X,Y);
end;

procedure TGridControl.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button,Shift,X,Y);

  If FMovMouseLinha and (ssAlt in Shift) and (FLinhaMove > FixedRows - 1) then
     Try
      FMouse := True;
      If Selectcell(Col,Row) then
        MovLinha(FLinhaMove,Row);
     finally
        FMouse := False;
     end;
end;

function TGridControl.LastCol: LongInt;
var i:LongInt;
begin
  Result := -1;

  for i:=colcount - 1 downto FixedCols  do
   If not CellSkip[i] and (ColWidths[i] > -1) then
     break;

  If (I >= FixedCols) then
   Result := I;
end;

{procedure TGridControl.ImprimirGrid(VRDPrint:TRdPrint);
var I,I2:Integer;
    FRdPrint:TRdPrint;
    FtotWidth:Integer;
    FLinha,Fcoluna:Integer;
begin
  If VRdPrint = Nil then
     FRdPrint := TRdPrint.Create(Self)
  else
     FRdPrint := VRdPrint;
  try
    If (FChaveImp <> '') and (FLinhaImp = 0) then
     If Not RecuperaRegistroRdPrint(FRdPrint,FChaveImp,True)  then
       If Not SetupRdPrint(FRdPrint,True) then begin
          exit;
       end else
         GravaRegistroRdPrint(FRdPrint,FChaveImp);


     FtotWidth := 0;
     For i:=0 to ColCount - 1 do begin
      ImpGrid[i].VlTotal := 0;
      If (ColWidths[I] > 0) and
          Not ImpGrid[i].NImprime then
       FtotWidth := FtotWidth + ColWidths[I];
     end;

     If FLinhaImp = 0 then FRdPrint.Abrir;

     RdPrintImpNegrito(FRdPrint,1,FRdPrint.TamanhoQteColunas div 2,Copy(FTituloImp,1,FRdPrint.TamanhoQteColunas),TaCenter,5);
     RdPrintImpNegrito(FRdPrint,2,1,'Pg:'+InttoStr(FPaginaImp),TaLeftJustify,5);
     RdPrintImpNegrito(FRdPrint,2,FRdPrint.TamanhoQteColunas,FormatDateTime('dd/mm/yy hh:mm',Now()),TaRightJustify,5);
     FLinha := 3;
     If FixedRows > 0 then begin
        RdPrintImpNegrito(FRdPrint,3,1,RepeatChar('-',FRdPrint.TamanhoQteColunas),TaLeftJustify,1);
        FLinha := 4;
     end;
     For i:=0 to RowCount - 1 do begin
       If (I < FLinhaImp) and
          (I > FixedRows - 1) then
            Continue;

       Fcoluna := 0;
       For i2:=0 to ColCount - 1 do
         If (ColWidths[i2] > 0) and
         Not ImpGrid[i2].NImprime then begin
            RdPrintImpNegrito(FRdPrint,
                              FLinha,
                              Fcoluna + 1 +
                              IIfs(ImpGrid[i2].Align <> TaLeftJustify,Floor(COlWidths[i2]/FtotWidth * FRdPrint.TamanhoQteColunas) -
                                   IIfs(ImpGrid[i2].Align = TaCenter,
                                   Floor(COlWidths[i2]/FtotWidth * FRdPrint.TamanhoQteColunas) div 2,
                                   0)
                                  ,0),
                              Copy(Cells[i2,I],1,Floor(COlWidths[i2]/FtotWidth * FRdPrint.TamanhoQteColunas)),
                              ImpGrid[i2].Align,
                              1);
            fColuna := Fcoluna + Floor(COlWidths[i2]/FtotWidth * FRdPrint.TamanhoQteColunas);
            If ImpGrid[i].Total then ImpGrid[i].VlTotal := ImpGrid[i].VlTotal + StrtoFloatN(Cells[i,i2]);
        end;
       If i = FixedRows - 1 then begin
         FLinha := FLinha + 1;
         RdPrintImpNegrito(FRdPrint,FLinha,1,RepeatChar('-',FRdPrint.TamanhoQteColunas),TaLeftJustify,1);
       end;
       FLinha  := FLinha + 1;
       If (Flinha > FRdPrint.TamanhoQteLinhas) and (I < RowCount - 1) then begin
           FLInhaImp  := I + 1;
           FPaginaImp := FPaginaImp + 1;
           FRdPrint.NovaPagina;
           ImprimirGrid(FRdPrint);
           Exit;
       end;
     end;
     FRdPrint.Fechar;
     FLinhaImp  := 0;
     FPaginaImp := 1;
  finally
     If (FrdPrint.Owner = Self) and (FRdPrint <> Nil) then FrdPrint.Destroy;
  end;
end;}


function TGridControl.GetOldCells(Acol, Arow: Integer): String;
begin
 If (Acol < ColCount) and (Arow < RowCount) and
    (Length(OldListCol) > Acol) and (OldListCol[Acol] <> Nil) and
    (OldListCol[Acol].Count > Arow) then
        Result := OldListCol[Acol].Strings[Arow]
   else
        Result := '';   
end;

procedure TGridControl.SetOldCells(Acol, Arow: Integer;
  const Value: String);
begin
 If (Acol < ColCount) and (Arow < RowCount) and
    (Length(OldListCol) > Acol) and (OldListCol[Acol] <> Nil) and
    (OldListCol[Acol].Count > Arow) then
       OldListCol[Acol].Strings[Arow] := Value;
end;


function TGridControl.GetCells(Acol, Arow: Integer): String;
begin
  Result := TStringGrid(Self).Cells[Acol,Arow];
end;

procedure TGridControl.SetCells(Acol, Arow: Integer; const Value: String);
begin
  If Cells[ACol,ARow] <> Value then
    OldCells[Acol,Arow] := Cells[ACol,Arow];
  TStringGrid(Self).Cells[Acol,Arow] := Value;
end;


procedure TGridControl.RefreshOldCells;
var i,i2:Integer;
Begin
{   For i:=0 to Length(OldListCol) - 1 do
     OldListCol[i].Destroy;

   SetLength(OldListCol,ColCount);
   For i:=0 to ColCount - 1 do begin
     OldListCol[i] := TStringList.Create;
     For i2:=0 to RowCount - 1 do
       OldListCol[i].Add(Cells[i,i2]);
   end;}
end;

destructor TGridControl.Destroy;
var i:Integer;
Begin
  For i:=0 to Length(OldListCol) - 1 do
    OldListCol[i].Destroy;

  inherited Destroy;
end;

function TGridControl.ColunaAlterada(ACol, Arow: Integer): Boolean;
begin
 Result :=  Cells[ACol,Arow] <> OldCells[ACol,Arow];
end;



function TGridControl.PrimeiraColunaHab: Integer;
Var
I:Integer;
begin
  result := -1;
  for i:=FixedCols to ColCount - 1 do
    If (ColWidths[i] > 0) And Not CellSkip[i] Then begin
      result := I;
      Break;
    end;
end;

procedure TGridControl.SetPosicionarLinha(const Value: Boolean);
begin
  if FPosicionarLinha <> Value then begin
     oldrowposiconalinha := -1;
     oldvalueposicionalinha := '';
  end;
  FPosicionarLinha := Value;
end;

end.

               {If Col + 1 < ColCount -1 Then Begin
                    FSkipControl := True;
                    Result := Inherited SelectCell(ACol, ARow);
                    If Result Then Begin
                         nQuantPula := 1;
                         While (Col+nQuantPula < ColCount) And FPulaCelula[Col+nQuantPula] Do
                                Inc(nQuantPula);

                         FromPulaCelula := true;
                         Col            := Col + nQuantPula;
                         FSkipControl   := False;
                         FromPulaCelula := False;
                         Result         := False;
                         Exit;
                     End
                     Else FSkipControl := False;
                End;}
{                    FSkipControl := True;
                    Result := Inherited SelectCell(ACol, ARow);
                    If Result Then Begin
                          nQuantPula := 1;

                          While (Col-nQuantPula > 0) And FPulaCelula[Col-nQuantPula] Do
                              Inc(nQuantPula);

                          FromPulaCelula := true;
                          Col := Col - nQuantPula;
                          FSkipControl := False;
                          FromPulaCelula := False;
                          Result := False;
                          Exit;
                    End
                    Else FSkipControl := False;}
                

