unit EditControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,extctrls,{DsgnIntf,}dbtables,pesquisa,Buttons,TipoDef,FuncoesGlobais,comctrls,ConstantesAppl,Db,Variants;

type

  //TEditorTPesquisa = Class(TClassProperty)
  //public
  //  { Public declarations }
  //  Function GetAttributes : TPropertyAttributes;Override;
  //  Procedure Edit ; Override;
  //end;

  TTipoEdit = (tpCaracter,tpNumero,tpData,tpDecimal);


  TEditControle = class(TEdit)
  private
    { Private declarations }
    FCreating:Boolean;
    FButtonAjuda : TBitBtn;
    FNextPos : TWinControl;
    FPosicao : Word;
    FObrigatorio : Boolean;
    FPesquisa : TPesquisa;
    FGeraPesquisa : Boolean;
    FAlignment : TAlignment;
    FObjGrava : TWinControl;
    FObjAltera : TWinControl;
    FEncontrou : Boolean;
    FTipo   : TTipoEdit;
    FMascara : String;
    FDescCampo: String;
    FVAlueIni  :String;
    FEnter: Boolean;
    FNExist: Boolean;
    Procedure SetAlignment(Value : TAlignment);
    Procedure AddParams(Var Value : TQuery ;ValueToAssign : String;Posicao: Word;VTipo:TFieldType=ftUnknown);
    Procedure GeraPesquisaLocal;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;

  protected
    { Protected declarations }
    Procedure   CreateParams(Var Params : TCreateParams ); override;
  public
    { Public declarations }
    VPesquisa:TQuery;
    OldText:String;
    FDoExit : Boolean;
    OldFocus : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy ; override;
    Procedure  Clear;override;
    Function   FoiAlterado:Boolean;
    Property   ValueIni : String read FValueIni write FValueIni;
    Procedure  CreateWnd;Override;
  published
    { Published declarations }
    procedure DoExit; override;
    procedure DoEnter; override;
    Procedure Change;Override;
    Procedure KeyDown(var Key:Word;Shift:TShiftSTate); override;
    procedure KeyPress(var Key: Char); override;
    property ButtonAjuda : TBitBtn read FButtonAjuda write FButtonAjuda;
    property Obrigatorio : Boolean read FObrigatorio write FObrigatorio;
    property Posicao : Word read FPosicao write FPosicao;
    property GeraPesquisa : Boolean Read FGeraPesquisa Write FGeraPesquisa default False;
    property Enter : Boolean Read FEnter Write FEnter default False;
    Property Pesquisa  : TPesquisa Read FPesquisa Write FPesquisa;
    Property NextPos : TWinControl Read FNextPos Write FNextPos;
    Property ObjGrava : TWinControl read FObjGrava write FObjGrava;
    Property ObjAltera : TWinControl read FObjAltera write FObjAltera;
    Property Encontrou : Boolean Read FEncontrou write FEncontrou;
    Property Tipo  : TTipoEdit read FTipo write FTipo default tpCaracter;
    Property Mascara : String read FMascara write FMascara;
    Property DescCampo : String read FDescCampo write FDescCampo;
    property Alignment   : TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property NExist : Boolean Read FNExist Write FNExist default False;
  end;

procedure Register;

implementation

constructor TEditControle.Create(AOwner: TComponent);
Var nHandle : TComponent;
begin

  nHandle := inherited Create(AOwner);
  //FAlignment := taLeftJustify;
  FDoExit := True;
  FEnter  := False;
  OldFocus := False;
  FValueIni := '';
  VPesquisa := TQuery.Create(Self);
end;

destructor TEditControle.Destroy;
Begin
//   If FGeraPesquisa Then
  //     FPesquisa.Destroy;
   inherited Destroy;
End;

procedure TEditControle.DoExit;
Var Pesquisa : TQuery;
    Loop : Word;
    Texto : String;
    FList:TList;
begin
  Try
       If FTipo = tpDecimal Then Begin
             If (Text = '') And (FTipo = tpDecimal) Then Text := '0';
             Texto := Text;
             While Pos(ThousandSeparator,Texto) > 0 Do Delete(Texto,Pos(ThousandSeparator,Texto),1);
             If Text <> '' Then
                 Text := FormatFloat(FMascara,StrToCurr(Texto));
       End;

       If FDoExit And (TForm(Owner).ActiveControl <> Nil) Then
        begin
           FList := TList.Create;
           Try
             TForm(Owner).GetTabOrderList(FList);
             If FList.IndexOf(TForm(Owner).ActiveControl) < FList.IndexOf(Self) Then begin
               inherited DoExit;
               Exit;
             end;
           Finally
              Flist.Destroy;
           end;
        end;

       If FButtonAjuda <> Nil Then
        If FButtonAjuda.Focused Then Exit;

       If FObrigatorio And (Text = '') Then Begin
           Application.MessageBox(PChar('Dado Obrigatório'), PChar(Application.Title), mb_Ok + mb_IconInformation);
           SetFocus;
           Exit;
       End;

      GeraPesquisaLocal;

      inherited DoExit;

      If (StatusPanelHintAppl <> Nil) and (Application <> Nil) Then
       StatusPanelHintAppl.Text := Application.Hint;
  Finally
    OldFocus := False;
  end;
end;

procedure TEditControle.DoEnter;
begin
     OldText := Text;
     inherited DoEnter;

     If ShowHint and (ConstantesAppl.StatusPanelHintAppl <> Nil) Then
       StatusPanelHintAppl.Text := Hint;
end;

Procedure TEditControle.KeyDown(var Key:Word;Shift:TShiftSTate);
var
FList        : TList;
FlistParent  : Tlist;
FWinControl,Fparent,Fparent2    : TWinControl;
FPageControl:TPageControl;
FIndPage,I : Word;
i2 : integer;
F:boolean;
fform:TCustomForm;
Begin


      inherited KeyDown(Key,Shift);

     if (Key in [Vk_Up,Vk_Down,Vk_Return]) then begin
       FParent2 := Self.Parent;

       while (fparent2 <> Nil) and Not(FParent2 is TCustomForm) do begin
          fform    := TCustomForm(FParent2.Owner);
          FParent2 := FParent2.Parent;
       end;

       if (FParent2 is TCustomForm) then
         FForm := TCustomForm(Fparent2)
       else if fparent2 <> Nil then
         FForm := TCustomForm(Fparent2.Owner)
       else
         FForm := TCustomForm(Self.Owner);
     end;


      If (Key = Vk_Up) Then
        FForm.perform(Wm_NextDlgCtl,-1,0);

      If (Key = Vk_Down) Then
       FForm.perform(Wm_NextDlgCtl,0,0);

      if fenter and (FNextPos = Nil) and (Owner is TcustomForm)
      and (Key = VK_Return) then begin
             f := False;
             FParent := Parent;
             While (FParent <> Nil) and (FParent <> FForm) and Not(FParent is TTabSheet) do
              FParent := FParent.Parent;


                

             If (FParent is TTabSheet)  then begin
               FList := TList.Create;
               FParent.GetTabOrderList(FList);
               I := Flist.Count;

               if Flist.IndexOf(Self) + 1 <= Flist.Count - 1 then
                  for i:=Flist.IndexOf(Self) + 1 to Flist.Count - 1 do
                       If  (TWinControl(FList[I]).CanFocus)
                       and (TWinControl(FList[I]).TabStop)
                       and (TWinControl(FList[I]).DockClientCount = 0)  then
                         Break;


               If I = Flist.Count then begin
                  FPageControl := TPageControl(FParent.Parent);
                  FindPage     := IIFS(TPageControl(FParent.Parent).ActivePageIndex = TPageControl(FParent.Parent).PageCount - 1
                                  ,0,TPageControl(FParent.Parent).ActivePageIndex + 1);

                  while (FPageControl.pages[findpage].ControlCount = 0)
                        or Not FPageControl.pages[findpage].Enabled
                        or Not FPageControl.pages[findpage].TabVisible do begin
                    If (FIndPage = Ttabsheet(FParent).PageIndex) then
                      break;
                    FIndPage := FindPage + 1;
                  end;

                  If (FIndPage <> Ttabsheet(FParent).PageIndex) then begin
                      FPageControl.Pages[FIndPage].GetTabOrderList(FList);
                      for i:=0 to Flist.Count - 1 do
                           If  (TWinControl(FList[I]).CanFocus)
                           and (TWinControl(FList[I]).TabStop)
                           and (TWinControl(FList[I]).DockClientCount = 0)  then begin
                              FPageControl.ActivePageIndex := findpage;
                              f := True;
                              Break;
                           end;
                  end;

               end;
               Flist.Destroy;
             end;
             
             If Not F then begin
                 FWinControl := SelectNextFocus(Self,1,FForm);
                 If (FWinControl is TPageControl) then begin
                     While (FWincontrol is TPageControl) do
                       FWinControl := SelectNextFocus(FWincontrol,1,Fform);

                     If (FWinControl <> Self) and (FWinControl <> Nil) then begin
                         HabilitaTabSheets(FWinControl,FForm);
                         FWinControl.SetFocus;
                     end;  
                 end else
                   Fform.perform(Wm_NextDlgCtl,0,0);
             end;
      end;     



    Case Key of
      VK_Return :begin
                                If (FNextPos <> Nil) Or (FObjGrava <> Nil) Or (FObjAltera <> Nil) Then Begin
                                                   if (FObjGrava <> Nil) Or (FObjAltera <> Nil) Then Begin
                                                               If FEncontrou Then
                                                                  TWinControl(FObjAltera).SetFocus
                                                               Else
                                                                  TWinControl(FObjGrava).SetFocus;
                                                               FDoExit := False;
                                                               DoExit;
                                                               FDoExit := True;
                                                               Exit;
                                                    End;

                                                   if TWinControl(FNextPos).CanFocus then begin
                                                        If (FNextPos is TPageControl) then begin
                                                              FWinControl := SelectNextFocus(FNextPos,1,FNextPos);
                                                              If (FwinControl <> Nil) and (FWincontrol <> Self) then begin
                                                                  FWinControl.SetFocus;
                                                                  Exit;
                                                              end;
                                                        end;
                                                        TWinControl(FNextPos).SetFocus;
                                                    end else begin
                                                        FWinControl := NextFocus(TWinControl(FNextPos));
                                                        If FWinControl <> Nil then
                                                          FwinControl.SetFocus;
                                                    end;
                                end;
                         end;
      //Vk_Up : Perform(Wm_NextDlgCtl,1,0);
    End;
End;

//constructor TPesquisa.Create(AOwner: TComponent);
//begin
//  inherited Create(AOwner);
//  FSql   := TStringList.Create;
//  FDataBase := TDataBase.Create(Self);
//end;

//destructor  TPesquisa.Destroy ;
//Begin
//   FSql.Destroy;
//   FDataBase.Destroy;
//  inherited Destroy;
//End;

//Function TEditorTPesquisa.GetAttributes : TPropertyAttributes;
//Begin
//   Result := [paSubProperties,paMultiSelect,paAutoUpDate];
//End;

//Procedure TEditorTPesquisa.Edit;
//Begin
//   Designer.Modified;
//End;

Procedure TEditControle.CreateParams(Var Params : TCreateParams );
Const
    Alignmento : Array[TAlignment] of Word = (ES_LEFT,ES_RIGHT,ES_CENTER);
Begin
    inherited;
    Params.Style := Params.Style or Alignmento[FAlignment];
End;

Procedure TEditControle.SetAlignment(Value : TAlignment);
Begin
   If FAlignment <> Value Then Begin
       FAlignment := Value;
       RecreateWND;
   End;
End;

procedure TEditControle.KeyPress(var Key: Char);
Begin
    If Key = #13 Then Begin
           Key := #0;
           Exit;
    End
    Else Begin
        If (FTipo <> tpCaracter) Then begin

          If Not (Key in ['0'..'9',#8])  Then begin

            If (FTipo = tpDecimal) And (Key = '.') Then Key := DecimalSeparator;

            If (Key <> '-') and Not((FTipo = tpDecimal) and (Key = DecimalSeparator)) then
               Key := #0;

          End;
        End;
    End;

    inherited;
End;

Procedure TEditControle.AddParams(Var Value : TQuery ;ValueToAssign : String;Posicao: Word;VTipo:TFieldType=ftUnknown);
Begin
    If VTipo <> ftUnknown Then begin
        Value.Params[Posicao].DataType   := Vtipo;
        Value.Params[Posicao].Value      := VarasType(ValueToAssign,VDataTypetoVarType(VTipo));
    end else If FTipo  = tpCaracter Then
        Value.Params[Posicao].AsString   := ValueToAssign
    Else If FTipo = tpData Then
        Value.Params[Posicao].AsDateTime := StrToDateTime(ValueToAssign)
    Else If FTipo = tpNumero Then
        Value.Params[Posicao].AsInteger  :=  StrToInt(ValueToAssign);
End;

procedure Register;
begin
  //RegisterPropertyEditor(TypeInfo(TPesquisa),Nil,'Pesquisa',TEditorTPesquisa);
  RegisterComponents('Sistema', [TEditControle]);
  //RegisterComponents('Sistema', [TPesquisa]);
end;




procedure TEditControle.GeraPesquisaLocal;
Var Loop : Word;
    Texto : String;
begin
   If GeraPesquisa And (Fpesquisa <> nil)  Then Begin
         If ((Text <> '') and (FTipo  = tpCaracter)) or
                                                   ((StrToFloatN(Text) <> 0) and (FTipo in [tpNumero,tpDecimal])) Then Begin
              If FPesquisa.DataBase <> Nil then
                VPesquisa.DataBaseName := FPesquisa.DataBase.DataBaseName
              else
                VPesquisa.DataBaseName := FPesquisa.DataBaseName;
              Vpesquisa.sql.clear;
              VPesquisa.Sql := FPesquisa.Sql;
              For Loop := 0 To VPesquisa.ParamCount - 1 Do Begin
                   If Loop = 0 Then begin
                      If FPesquisa.Filtro1 <> nil then
                        AddParams(VPesquisa,FPesquisa.Filtro1.Text,Loop)
                      else
                        AddParams(VPesquisa,VarToStr(FPesquisa.Parametro[loop]),Loop,VarTypetodatatype(VarType(FPesquisa.Parametro[loop])));
                    end
                   Else If Loop = 1 Then begin
                      If FPesquisa.Filtro2 <> nil then
                        AddParams(VPesquisa,FPesquisa.Filtro2.Text,Loop)
                      else
                        AddParams(VPesquisa,VarToStr(FPesquisa.Parametro[loop]),Loop,VarTypetodatatype(VarType(FPesquisa.Parametro[loop])));
                    end
                   Else If Loop = 2 Then begin
                      If FPesquisa.Filtro3 <> nil then
                        AddParams(VPesquisa,FPesquisa.Filtro3.Text,Loop)
                      else
                        AddParams(VPesquisa,VarToStr(FPesquisa.Parametro[loop]),Loop,VarTypetodatatype(VarType(FPesquisa.Parametro[loop])));
                    end
                   Else If Loop = 3 Then begin
                      If FPesquisa.Filtro4 <> nil then
                        AddParams(VPesquisa,FPesquisa.Filtro4.Text,Loop)
                      else
                        AddParams(VPesquisa,VarToStr(FPesquisa.Parametro[loop]),Loop,VarTypetodatatype(VarType(FPesquisa.Parametro[loop])));
                    end
              End;

              VPesquisa.Open;
              If VPesquisa.eof and FNExist then begin
                If FPesquisa.Descricao <> Nil Then
                   FPesquisa.Descricao.Caption := '<Dado não Cadastrado>';
              end else If VPesquisa.Eof And (FObrigatorio Or (Text <> ''))Then Begin
                 Application.MessageBox(PChar('Dado não encontrado'), PChar(Application.Title), mb_Ok + mb_IconInformation);
                 SetFocus;
//                 Pesquisa.Destroy;
                 Exit;
              End
              Else
                 If FPesquisa.Descricao <> Nil Then
                     FPesquisa.Descricao.Caption := VPesquisa.FieldByName(FPesquisa.Campo).AsString;

//              Pesquisa.Destroy;
        End
        Else If FPesquisa.Descricao <> Nil Then  FPesquisa.Descricao.Caption := '';
   end;
end;
procedure TEditControle.Change;
begin
  inherited Change;
  If Not(Focused) then
    GeraPesquisaLocal;
end;

function TEditControle.FoiAlterado: Boolean;
begin
   Result :=  Text <> OldText;
end;


procedure TEditControle.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if not HandleAllocated or (GetWindowLong(Handle, GWL_STYLE) and
    ES_MULTILINE <> 0) then Change;
  If (csLoading in ComponentState) then
   FValueIni := Text;
end;

procedure TEditControle.Clear;
begin
  inherited Clear;
  If Not (csDesigning in ComponentState) then
    Text := FValueini;
end;

procedure TEditControle.CMExit(var Message: TCMExit);
begin
   OldFocus := True;
   inherited;
end;


procedure TEditControle.CreateWnd;
begin
  Try
    FCreating := True;
    inherited CreateWnd;
  finally
    FCreating := False;
  end;
end;

end.
