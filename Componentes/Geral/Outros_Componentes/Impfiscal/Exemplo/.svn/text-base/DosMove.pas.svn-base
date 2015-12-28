//-----------------------------------------------------------------------------
// TDosMove ver 1.00
//
// Last updated at: 25/07/1998
//
// Component that allows you to move thourgh the controls in your app with
//  UP/DOWN arrows or ENTER key insted of using the old boring TAB.
//
// Code by: Liran Shahar
//          Israel
//          simpletech@ibm.net
//-----------------------------------------------------------------------------
unit DosMove;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TMoveOptions = set of (moEnter,moUpDn);

  TDosMove = class(TComponent)
  private
    FActive       : boolean;
    FOptions      : TMoveOptions;
    FOwnerKeyDown : TKeyEvent;
  protected
    procedure NewKeyDown(Sender : TObject;var Key : word;Shift : TShiftState);
  public
    constructor Create(AOwner : TComponent); override;
  published
    property Active : boolean read FActive write FActive;
    property Options : TMoveOptions read FOptions write FOptions;
  end;

procedure Register;

implementation

//-----------------------------------------------------------------------------
procedure Register;
begin
  RegisterComponents('HomeMade', [TDosMove]);
end;

//-----------------------------------------------------------------------------
constructor TDosMove.Create(AOwner : TComponent);
var
  Loop : integer;
begin
  // First check to see no other TDosMove exists on the form
  for Loop:=0 to AOwner.ComponentCount-1 do
    if AOwner.Components[Loop] is TDosMove then raise
      EInvalidOperation.Create('TDosMove can have only one instance per form');

  // Create component and set default properties
  inherited Create(AOwner);
  FActive:=false;
  FOptions:=[];

  // Intercept with OnKeyDown event of 'Owner'
  FOwnerKeyDown:=(AOwner as TForm).OnKeyDown;
  (AOwner as TForm).OnKeyDown:=NewKeyDown;
  (AOwner as TForm).KeyPreview:=true;
end; // Create

//-----------------------------------------------------------------------------
procedure TDosMove.NewKeyDown(Sender : TObject;var Key : word;
  Shift : TShiftState);
begin
  if FActive and (FOptions<>[]) then begin
    // Handle the specials keys
    if ((Key=VK_DOWN) and (moUpDn in FOptions)) or
       ((Key=VK_RETURN) and (moEnter in FOptions)) then
      (Owner as TForm).Perform(WM_NEXTDLGCTL,0,0)
    else if (Key=VK_UP) and (moUpDn in FOptions) then
      (Owner as TForm).Perform(WM_NEXTDLGCTL,1,0);
  end; // if FActive ...
  
  // Call owner OnKeyDown if it's assigned
  if assigned(FOwnerKeyDown) then FOwnerKeyDown(Sender,Key,Shift);
end; // NewKeyDown

end.
