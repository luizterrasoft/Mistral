unit GroupBControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,extctrls;

type
  TGroupBControle = class(TGroupBox)
  private
    { Private declarations }
    FNextPos : TWinControl;
    FObjGrava : TWinControl;
    FObjAltera : TWinControl;
    FEncontrou : Boolean;
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
  public
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
  end;

procedure Register;

implementation

constructor TGroupBControle.Create(AOwner: TComponent);
Var nHandle : TComponent;
begin
  nHandle := inherited Create(AOwner);
end;

destructor TGroupBControle.Destroy;
Begin
   inherited Destroy;
End;

procedure TGroupBControle.DoExit;
Var    Loop : Word;
begin
   If TForm(Owner).ActiveControl.TabOrder <= TabOrder Then
          Exit;

   inherited DoExit;
end;

Procedure TGroupBControle.KeyDown(var Key:Word;Shift:TShiftSTate);
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

procedure TGroupBControle.KeyPress(var Key: Char);
Begin
    If Key = #13 Then Key := #0;
    inherited;
End;


procedure Register;
begin
  RegisterComponents('Sistema', [TGroupBControle]);
end;


end.
