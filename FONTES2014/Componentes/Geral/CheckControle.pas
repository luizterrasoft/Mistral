unit CheckControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,extctrls,TipoDef,FuncoesGlobais,comctrls,ConstantesAppl;

type
  TCheckControle = class(TCheckBox)
  private
    { Private declarations }
    ffocu:boolean;
    FNextPos : TWinControl;
    FObjGrava : TWinControl;
    FObjAltera : TWinControl;
    FEncontrou : Boolean;
    VarValorChecado,VarValorNaoChecado :String;
    VarTipo    : TTipoCampo;
    FCheckIni: Boolean;
    FDescCampo: String;
    FEnter: Boolean;
    oldfocus:twincontrol;
    FClickAut: Boolean;
    function GetChkStr: String;
    procedure SetChkStr(const Value: String);
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    procedure SetChecked(Value: Boolean); override;
  public
     Function RetornaValor :Variant;
     Property CheckIni : Boolean read FCheckIni write FCheckIni;
     Property ChkStr : String read GetChkStr write SetChkStr;
     procedure setfocus;override;
     procedure click;override;
    { Public declarations }
  published
    { Published declarations }
    procedure DoEnter; override;
    procedure DoExit; override;
    Procedure KeyDown(var Key:Word;Shift:TShiftSTate); override;
    procedure KeyPress(var Key: Char); override;
    Property NextPos : TWinControl Read FNextPos Write FNextPos;
    Property ObjGrava : TWinControl read FObjGrava write FObjGrava;
    Property ObjAltera : TWinControl read FObjAltera write FObjAltera;
    Property Encontrou : Boolean Read FEncontrou write FEncontrou;
    Property Enter : Boolean Read FEnter write FEnter;
    Property ClickAut : Boolean Read FClickAut write FClickAut;
    Property DescCampo :String Read FDescCampo Write FDescCampo;
    Property ValorChecado :String Read VarVAlorChecado Write VarValorChecado;
    Property ValorNaoChecado :String Read VarVAlorNaoChecado Write VarValorNaoChecado;
    Property TipoValor       :TTipoCAmpo Read VarTipo Write VarTipo;
  end;

procedure Register;

implementation


                  
procedure TCheckControle.click;
var
oldchecked:boolean;
oldenter:tnotifyevent;
begin
//  oldchecked := checked;
  inherited click;
  try
    if fclickaut and (oldfocus <> nil) then begin
      oldfocus.setfocus;
    end;
  finally
    oldfocus := nil;
  end;
end;



constructor TCheckControle.Create(AOwner: TComponent);
Var nHandle : TComponent;
begin
  nHandle  := inherited Create(AOwner);
  vartipo  := varstring;
  oldfocus := nil;
  ffocu := false;
end;

destructor TCheckControle.Destroy;
Begin
   inherited Destroy;
End;

procedure TCheckControle.DoEnter;
begin
  inherited DoEnter;

  If ShowHint and (ConstantesAppl.StatusPanelHintAppl <> Nil) Then
    StatusPanelHintAppl.Text := Hint;
end;

procedure TCheckControle.DoExit;
Var    Loop : Word;
begin

     If TForm(Owner).ActiveControl.TabOrder <= TabOrder Then
           Exit;

     inherited DoExit;

     If (StatusPanelHintAppl <> Nil) and (Application <> Nil) Then
       StatusPanelHintAppl.Text := Application.Hint;
end;

function TCheckControle.GetChkStr: String;
begin
  If Checked then
    Result := IIfs(ValorChecado = '','T',ValorChecado)
  else
    Result := IIfs(ValorNaoChecado = '','F',ValorNaoChecado);

end;

Procedure TCheckControle.KeyDown(var Key:Word;Shift:TShiftSTate);
var
FList        : TList;
FlistParent  : Tlist;
FWinControl,Fparent     : TWinControl;
FPageControl:TPageControl;
FIndPage,I : Word;
i2 : integer;
F : Boolean;
Begin
     inherited KeyDown(Key,Shift);

      if fenter and (FNextPos = Nil) and (Owner is TcustomForm)
      and ((Key = VK_Return) or (Key = Vk_Down)) then begin
             FParent := Parent;
             F := False;
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
                              F := True;
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
                                                    If (FObjGrava <> Nil) Or (FObjAltera <> Nil) Then Begin
                                                         If FEncontrou Then
                                                            TWinControl(FObjAltera).SetFocus
                                                         Else
                                                            TWinControl(FObjGrava).SetFocus;
                                                         Exit;
                                                    End;
                                                    TWinControl(FNextPos).SetFocus;
                                                 End;
    End;
End;

procedure TCheckControle.KeyPress(var Key: Char);
Begin
    If Key = #13 Then Key := #0;
    inherited;
End;


procedure Register;
begin
  RegisterComponents('Sistema', [TCheckControle]);
end;



function TCheckControle.RetornaValor: Variant;
var
valor :string;
begin

  If Checked then
    Valor := varvalorchecado
  else
    Valor := varvalornaochecado;

   if vartipo = varstring then
    result := valor
   else if vartipo = varinteger then
    result := strtoint(VAlor)
   else if vartipo = varcurrency then
    result := strtofloatn(valor);

end;


procedure TCheckControle.SetChecked(Value: Boolean);
begin

  inherited setchecked(Value);

  If (csLoading in ComponentState) then
   FCheckIni := Value;
end;



procedure TCheckControle.SetChkStr(const Value: String);
begin
  Checked := IIfs(ValorChecado = '',UpperCase(Value) = 'T',UpperCase(Value) = UpperCase(ValorChecado));
end;


procedure TCheckControle.setfocus;
begin
  if (Owner is TCustomForm) and (Tcustomform(Owner).ActiveControl <> nil) and
     (Tcustomform(Owner).ActiveControl <> self) and
     Tcustomform(Owner).ActiveControl.canfocus then
   oldfocus := Tcustomform(Owner).ActiveControl
  else
   oldfocus := nil;

  inherited setfocus;
end;




end.
