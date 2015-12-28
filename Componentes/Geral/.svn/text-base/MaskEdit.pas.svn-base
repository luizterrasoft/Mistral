unit MaskEdit;

interface

uses
  Windows,mask,forms,classes,Controls,TipoDef,SysUtils,Dialogs,FuncoesGlobais,Messages,ComCtrls,ConstantesAppl,MaskUtils;

Type
  TMaskEditControle = class(TMaskEdit)
  private
    { Private declarations }
    FNextPos : TWinControl;
    FObjGrava : TWinControl;
    FObjAltera : TWinControl;
    FEncontrou,FObrigatorio : Boolean;
    FAlignment : TAlignment;
    VarVerificaData : Boolean;
    VarVerificaHora : Boolean;
    VarDataDoDia    : Boolean;
    PrimeiraVez     : Boolean;
    FValueIni: String;
    FEnter: Boolean;
    FDescCampo: String;
    FFormataData: Boolean;
    FFormatDate: Boolean;
    Procedure DataHoraValida;
    Procedure DataValida;
    Procedure HoraValida;
    Procedure SetAlignment(Value : TAlignment);
    Function  MascaraVazia:String;
    Procedure PassaValorGravacao;
    Procedure CreateWnd;override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent);override;
    Procedure CreateParams(Var Params : TCreateParams ); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
  public
    OldText : String;
    FDoExit : Boolean;
    OldFocus:Boolean;
    Procedure Clear;Override;
    Procedure ConvertData(Data:TdateTime);
    Function  EditEmBranco:Boolean;
    function FoiAlterado: Boolean;
    Property ValueIni : String read FValueIni write FValueIni;

//    Function MascaraCompleta(Mascara,Texto:String):Boolean;
    { Public declarations }
  published
    { Published declarations }
    property Obrigatorio : Boolean read FObrigatorio write FObrigatorio;
    procedure DoExit; override;
    procedure DoEnter; override;
    Procedure Change;Override;
    Procedure KeyDown(var Key:Word;Shift:TShiftSTate); override;
    procedure KeyPress(var Key: Char); override;
    Property NextPos : TWinControl Read FNextPos Write FNextPos;
    Property ObjGrava : TWinControl read FObjGrava write FObjGrava;
    Property ObjAltera : TWinControl read FObjAltera write FObjAltera;
    Property Encontrou : Boolean Read FEncontrou write FEncontrou;
    property Alignment  : TAlignment read FAlignment write SetAlignment default taRightJustify;
    Property VerificaData : Boolean Read VarVerificaData Write VarVerificaData;
    Property VerificaHora : Boolean Read VarVerificaHora Write VarVerificaHora;
    Property DataDoDia    : Boolean Read VarDataDoDia    Write VarDataDoDia;
    property Enter : Boolean Read FEnter Write FEnter default False;
    Property DescCampo : String read FDescCampo write FDescCampo;
    Property FormataData : Boolean read FFormataData write FFormataData;
    Property FormatDate : Boolean read FFormatDate write FFormatDate;
  end;

procedure Register;

Implementation

constructor TMaskEditControle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDoExit := True;
  FAlignment := taRightJustify;
  PrimeiraVez := True;
  OldFocus := False;
end;

Procedure TMaskEditControle.CreateParams(Var Params : TCreateParams );
Const
    Alignmento : Array[TAlignment] of Word = (ES_LEFT,ES_RIGHT,ES_CENTER);
Begin
    inherited;
    Params.Style := Params.Style or Alignmento[FAlignment];
End;

Procedure TMaskEditControle.SetAlignment(Value : TAlignment);
Begin
   If FAlignment <> Value Then Begin
       FAlignment := Value;
       RecreateWND;
   End;
End;


procedure TMaskEditControle.DoExit;
Var    Loop : Word;
       VText,Vano,Fmascaravazia : string;
begin
   Try
       If not EditEmBranco then begin
         If VarVerificaHora then begin
             for Loop:=1 to length(EditMask) do begin
                If EditMask[loop] = ';' then
                 break;

                FMascaraVazia := FMascaraVazia + IIfs(Not(EditMask[Loop] in ['!',';','\','<','>'])
                                                      ,Copy(EditMask,Loop,1)
                                                      ,'');
             end;
             Loop := 1;
             Vtext := Text;
             VAno  := Copy(FormatDateTime('AAAA',Now()),1,2);
             While Length(FMascaraVazia) >= Loop do begin
                 If (Copy(FMascaraVazia,loop,5) = '/9999') and
                    (ValidaCharacteres(['0'..'9'],Copy(Vtext,loop + 1,4),True) <> Copy(Vtext,loop + 1,4)) and
                    ((ValidaCharacteres(['0'..'9'],Copy(Vtext,loop + 1,2),True) = Copy(Vtext,loop + 1,2)) or
                    (ValidaCharacteres(['0'..'9'],Copy(Vtext,loop + 3,2),True) = Copy(Vtext,loop + 3,2))) then begin
                        VAno  := Copy(FormatDateTime('YYYY',Now()),1,2) + ValidaCharacteres(['0'..'9'],Copy(Vtext,loop + 1,4),True);
                        Vtext := IIfs(Loop = 1,'',Copy(Vtext,1,Loop)) +VAno+
                                 IIfs(Loop + 4 = Length(Vtext),'',Copy(Vtext,Loop + 5,Length(Vtext)));
                 end else If (Copy(FMascaraVazia,loop,1) <> ' ') and (Copy(Vtext,loop,1) = ' ') then
                     Vtext := IIfs(Loop = 1,'',Copy(Vtext,1,Loop - 1)) +'0'+
                                IIfs(Loop = Length(Vtext),'',Copy(Vtext,Loop + 1,Length(Vtext) - Loop));
               Inc(loop);
             end;
             Text := Vtext;
         end;
         If VarVerificaData and VarVerificaHora then
            DataHoraValida
         else If VarVerificaData then
            DataValida
         else If VarVerificaHora then
            HoraValida;
       end;

       If FDoExit and (TForm(Owner).ActiveControl.TabOrder <= TabOrder) Then
            Exit;

       If (FObrigatorio) and (EditEmBranco) then
        begin
         ShowMessage('Dado Obrigatório');
         SetFocus;
         exit;
        end;

        inherited DoExit;

        If (StatusPanelHintAppl <> Nil) and (Application <> Nil) Then
          StatusPanelHintAppl.Text := Application.Hint;
   finally
        OldFocus := False;
   end;
end;


Procedure TMaskEditControle.KeyDown(var Key:Word;Shift:TShiftSTate);
var
FList        : TList;
FlistParent  : Tlist;
FWinControl,Fparent     : TWinControl;
FPageControl:TPageControl;
FIndPage,I : Word;
i2 : integer;
F : boolean;
Begin
    If (Key = Vk_Up) Then
     TCustomForm(Owner).perform(Wm_NextDlgCtl,-1,0);

    If (Key = Vk_Down) Then
     TCustomForm(Owner).perform(Wm_NextDlgCtl,0,0);

    inherited KeyDown(Key,Shift);

    if fenter and (FNextPos = Nil) and (Owner is TcustomForm)
    and ((Key = VK_Return) or (Key = Vk_Down)) then begin
             f := False;
             FParent := Parent;
             While (FParent <> Nil) and (FParent <> Owner) and Not(FParent is TTabSheet) do
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
                 FWinControl := SelectNextFocus(Self,1,TCustomForm(Owner));
                 If (FWinControl is TPageControl) then begin
                     While (FWincontrol is TPageControl) do
                       FWinControl := SelectNextFocus(FWincontrol,1,TCustomForm(Owner));

                     If (FWinControl <> Self) and (FWinControl <> Nil) then begin
                         HabilitaTabSheets(FWinControl);
                         FWinControl.SetFocus;
                     end;  
                 end else
                   TCustomForm(Owner).perform(Wm_NextDlgCtl,0,0);
             end;
    end;

    Case Key of
      VK_Return,Vk_Down :If (FNextPos <> Nil) Or (FObjGrava <> Nil) Or (FObjAltera <> Nil) Then Begin
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
                                                    if TWinControl(FNextPos).CanFocus then
                                                        TWinControl(FNextPos).SetFocus
                                                    else begin
                                                        FWinControl := NextFocus(TWinControl(FNextPos));
                                                        If FWinControl <> Nil then
                                                          FwinControl.SetFocus;
                                                    end;
                                              end;
    End;
End;


procedure TMaskEditControle.KeyPress(var Key: Char);
Begin
    If Key = #13 Then Key := #0;
    inherited;
End;


procedure Register;
begin
  RegisterComponents('Sistema', [TMaskEditControle]);
end;

procedure TMaskEditControle.PassaValorGravacao;
begin
{      if Vartipotabela =  varstring then
        TMaskEditControle(Gravacao.ObjetoRetornoGravacao).text := Gravacao.VAlorRetornoGravacao;

      if Vartipotabela = varcurrency then
         TMaskEditControle(Gravacao.ObjetoRetornoGravacao).text := FormatFloat('#,##0.00',Gravacao.VAlorRetornoGravacao);

      if Vartipotabela  = varDate then
         TMaskEditControle(Gravacao.ObjetoRetornoGravacao).text := DatetimetoStr(Gravacao.VAlorRetornoGravacao);

      if Vartipotabela  = varinteger then
         TMaskEditControle(Gravacao.ObjetoRetornoGravacao).text := IntToStr(Gravacao.VAlorRetornoGravacao);

      if Vartipotabela  = varmemo then
         TMaskEditControle(Gravacao.ObjetoRetornoGravacao).text := Gravacao.VAlorRetornoGravacao;}
end;

function TMaskEditControle.MascaraVazia: String;
var
i : integer;
begin
{  for i:=0 to Length(EditMask) do begin
  end;}
end;


Function TMaskEditControle.EditEmBranco:Boolean;
begin
   Result := (Text = FormatMaskText(EditMask,''));
end;


procedure TMaskEditControle.DataValida;
var
 VarDataHora:TDateTime;
begin
  Try
    VarDataHora := StrtoDate(Text);
  Except
    MessageDlg('Data Inválida',mterror,[mbok],0);
    SetFocus;
    SysUtils.Abort;
  end;
end;

procedure TMaskEditControle.HoraValida;
var
 VarDataHora:TDateTime;
begin
  Try
    VarDataHora := StrtoTime(Text);
  Except
    MessageDlg('Hora Inválida',mterror,[mbok],0);
    SetFocus;
    SysUtils.Abort;
  end;
end;

procedure TMaskEditControle.Change;
var oldtext : string;
begin
   inherited Change;

   If Not OldFocus and (TForm(Owner).ActiveControl <> Self) and not(EditEmBranco) and (MascaraCompleta(EditMask,Text)) then
     If VarVerificaData and VarVerificaHora then
        DataHoraValida
     else If VarVerificaData then
        DataValida
     else If VarVerificaHora then
        HoraValida;

end;

procedure TMaskEditControle.CreateWnd;
begin
//  Clear;
  inherited CreateWnd;

{  If (VarDataDoDia or VarVerificaHora)  And not (csDesigning in ComponentState) and PrimeiraVez then begin
    Clear;
    PrimeiraVez := False;
  end;}
end;

procedure TMaskEditControle.Clear;
begin
  inherited Clear;
  If VarDataDoDia then begin
{     If VarVerificaHora and VerificaData then
       Text := FormatMaskText(EditMask,DateTimeToStr(Now))
     else If VarVerificaHora then
       Text := FormatMaskText(EditMask,TimeToStr(Time()))
     else
       Text := FormatMaskText(EditMask,DateToStr(DateM()));}

     ConvertData(strtodate(DateToStr(DateM))+time());
   end else Text := FValueIni;
end;



procedure TMaskEditControle.CreateWindowHandle(
  const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);

  If (VarDataDoDia or (VarVerificaHora and Not VarVerificaData))  And not (csDesigning in ComponentState) then
    Clear;
end;


procedure TMaskEditControle.CMTextChanged(var Message: TMessage);
begin
  inherited;
  If (csLoading in ComponentState) then
    FValueIni := Text;
End;

procedure TMaskEditControle.CMExit(var Message: TCMExit);
begin
   OldFocus := True;
   inherited;
end;

procedure TMaskEditControle.ConvertData(Data: TdateTime);
begin
      If VarVerificaData or VarVerificaHora then 
        inherited Clear;

      If Data > 0 then
        If VarVerificaData and VarVerificaHora then begin
         If Pos('99/99/9999 99:99',EditMask) > 0 then
           Text := FormatDateTime('dd/mm/yyyy hh:mm',Data)
         else If Pos('99/99/99 99:99',EditMask) > 0 then
           Text := FormatDateTime('dd/mm/yy hh:mm',Data);
        end else If VarVerificaData then begin
          If Pos('99/99/9999',EditMask) > 0 then
            Text := FormatDateTime('dd/mm/yyyy',Data)
          else If Pos('99/99/99',EditMask) > 0 then
            Text := FormatDateTime('dd/mm/yy',Data);
        end else if VarVerificaHora then begin
          If Pos('99:99:99',EditMask) > 0 then
            Text := FormatDateTime('hh:mm:ss',Data)
          else If Pos('99:99',EditMask) > 0 then
            Text := FormatDateTime('hh:mm',Data);
        end;
end;

procedure TMaskEditControle.DoEnter;
begin
  If ShowHint and (ConstantesAppl.StatusPanelHintAppl <> Nil) Then
   StatusPanelHintAppl.Text := Hint;

  OldText := Text;
  inherited DoEnter;
end;

function TMaskEditControle.FoiAlterado: Boolean;
begin
   Result :=  Text <> OldText;
end;


procedure TMaskEditControle.DataHoraValida;
var
 VarDataHora:TDateTime;
begin
  Try
    VarDataHora := StrtoDateTime(Text);
  Except
    MessageDlg('Data ou Hora Inválida',mterror,[mbok],0);
    SetFocus;
    SysUtils.Abort;
  end;
end;

End.
