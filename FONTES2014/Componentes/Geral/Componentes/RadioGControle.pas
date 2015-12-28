unit RadioGControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,extctrls;

type
  TRadioGroupRetorno = (RGItem,RGValores,RGItemIndex);

  TRadioGControle = class(TRadioGroup)
  private
    { Private declarations }
    FNextPos : TWinControl;
    FObjGrava : TWinControl;
    FObjAltera : TWinControl;
    FEncontrou : Boolean;
    VarVAlores : TstringList;
    VarRetorno : TRadioGroupRetorno;
    Procedure  SetValores(Value:TStringList);
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
  public
    Function  RetornaValor:Variant;
    Procedure RecebeValor(Value:Variant);
    { Public declarations }
  published
    { Published declarations }
    procedure DoExit; override;
    Procedure KeyDown(var Key:Word;Shift:TShiftSTate); override;
    procedure KeyPress(var Key: Char); override;
    Property NextPos : TWinControl Read FNextPos Write FNextPos;
    Property ObjGrava : TWinControl read FObjGrava write FObjGrava;
    Property ObjAltera : TWinControl read FObjAltera write FObjAltera;
    Property Encontrou : Boolean Read FEncontrou write FEncontrou;
    Property Retorno   : TRadioGroupRetorno Read VarRetorno Write VarRetorno;
    Property VAlores   : TStringList Read VarVAlores Write SetVAlores;
  end;

procedure Register;

implementation

constructor TRadioGControle.Create(AOwner: TComponent);
Var nHandle : TComponent;
begin
  nHandle := inherited Create(AOwner);
  VarValores := TStringList.Create;
  VarRetorno := RGItem;
end;

destructor TRadioGControle.Destroy;
Begin
   if varvalores <> nil then
    varvalores.destroy;

   inherited Destroy;
End;

procedure TRadioGControle.DoExit;
Var    Loop : Word;
begin
   If TForm(Owner).ActiveControl.TabOrder <= TabOrder Then
          Exit;

   inherited DoExit;
end;

Procedure TRadioGControle.KeyDown(var Key:Word;Shift:TShiftSTate);
Begin
     inherited KeyDown(Key,Shift);
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

procedure TRadioGControle.KeyPress(var Key: Char);
Begin
    If Key = #13 Then Key := #0;
    inherited KeyPress(Key);
End;


procedure Register;
begin
  RegisterComponents('Sistema', [TRadioGControle]);
end;


procedure TRadioGControle.RecebeValor(Value: Variant);
var
i : integer;
begin
  If (VarRetorno = RGValores)  then begin
    for i:=0 to VarVAlores.Count - 1 do begin
      If UpperCase(VarValores[I]) = Uppercase(Value) then begin
        ItemIndex := i;
        exit;
      end;
    end;
  end;

  If (VarRetorno = RGItem)  then begin
      for i:=0 to Items.Count - 1 do
        If UpperCase(Items[i]) = Uppercase(Value) then begin
          ItemIndex := i;
          exit;
        end;
  end;

  If (VarRetorno = RGItemIndex)  then
    ItemIndex := Value;
end;

function TRadioGControle.RetornaValor: Variant;
begin
  If Itemindex <= -1 then
   exit;

  If VarRetorno = RGValores then
    result := VarVAlores[itemindex];

  If VarRetorno = RGItem then
    result := Items[itemindex];

  If VarRetorno = RGItemIndex then
    result := itemindex;
end;

procedure TRadioGControle.SetValores(Value: TStringList);
begin
   VarValores.Assign(VAlue);
end;

end.
