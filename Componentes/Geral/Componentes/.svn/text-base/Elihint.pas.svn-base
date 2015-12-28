unit Elihint;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

Const
  Sqrt2 = 1.4142135624;

type
  TEllipticHint = class(TComponent)
  private
    { Private declarations }
{    FHintColor : TColor;}
    FHintPauseTime : Integer;
    FPen : TPen;
    FBrush : TBrush;
    FFontColor : TColor;
    procedure SetHintPauseTime(Value:Integer);
    Procedure SetPen(Value : TPen);
    Procedure SetBrush(Value : TBrush);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); Override;
  published
    { Published declarations }
{    property HintColor : TColor read FHintColor write FHintColor default $0080FFFF;}
    property HintPauseTime : Integer read FHintPauseTime write SetHintPauseTime
                             default 600;
    property Pen : TPen Read FPen Write SetPen;
    property Brush : TBrush Read FBrush Write SetBrush;
    property FontColor : TColor Read FFontColor Write FFontColor Default clBlack;
  end;

  TEllipticHintWindow = class(THintWindow)
  private
    { Private declarations }
    FEllipticHint : TEllipticHint;
    function FindEllipticHint : TEllipticHint;
  protected
    { Protected declarations }
    procedure Paint; Override;
    procedure CreateParams(var Params: TCreateParams); Override;
  public
    { Public declarations }
    procedure ActivateHint(Rect: TRect; const AHint: string); Override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

var
  MemBmp : TBitmap;

procedure Register;
begin
  RegisterComponents('Sistema', [TEllipticHint]);
end;

Constructor TEllipticHint.Create(AOwner:TComponent);
begin
   inherited Create(AOwner);
{   FHintColor := $0080FFFF;}
   FPen := TPen.Create;
   FBrush := TBrush.Create;
   FBrush.Color := $0080FFFF;
   FFontColor := clBlack;
   FHintPauseTime := 600;
   Application.HintPause := FHintPauseTime;
   HintWindowClass := TEllipticHintWindow;
   Application.ShowHint := not Application.ShowHint;
   Application.ShowHint := not Application.ShowHint;
end;

Procedure TEllipticHint.SetHintPauseTime(Value : Integer);
Begin
  If (Value <> FHintPauseTime) Then Begin
    FHintPauseTime := Value;
    Application.HintPause := Value;
  End;
End;

Procedure TEllipticHint.SetPen(Value : TPen);
Begin
  FPen.Assign(Value);
End;

Procedure TEllipticHint.SetBrush(Value : TBrush);
Begin
  FBrush.Assign(Value);
End;

Function TEllipticHintWindow.FindEllipticHint : TEllipticHint;
var
  I : Integer;
begin
  Result := nil;
  For I := 0 To Application.MainForm.ComponentCount-1 Do
    If Application.MainForm.Components[I] Is TEllipticHint Then Begin
      Result := TEllipticHint(Application.MainForm.Components[I]);
      Exit;
    End;
End;

procedure TEllipticHintWindow.CreateParams(var Params : TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style-WS_BORDER;
end;

procedure TEllipticHintWindow.Paint;
var
  R : TRect;
  OfstX,OfstY : Integer;
begin
  R := ClientRect;
  With MemBMP.Canvas Do Begin
{    Brush.Color := FEllipticHint.HintColor;
    Brush.Style := bsSolid;
    Pen.Color := clBlack;
    Pen.Style := psSolid;}
    Pen.Assign(FEllipticHint.FPen);
    Brush.Assign(FEllipticHint.FBrush);
    Ellipse(R.Left,R.Top,R.Right,R.Bottom);
    Font.Color := FEllipticHint.FFontColor;
    OfstX := (R.Right-R.Left-TextWidth(Caption)) Div 2;
    OfstY := (R.Bottom-R.Top-TextHeight(Caption)) Div 2;
    TextOut(R.Left+OfstX,R.Top+OfstY,Caption);
  End;
  Canvas.CopyMode:=cmSrcCopy;
  Canvas.CopyRect(ClientRect,MemBmp.Canvas,ClientRect);
  MemBmp.Free;
end;

procedure TEllipticHintWindow.ActivateHint(Rect: TRect; const AHint: string);
var
  ScreenDC : HDC;
  Pnt : TPoint;
  OfstX,OfstY : Integer;
begin
  MemBmp := TBitmap.Create;
  Caption := AHint;
  FEllipticHint := FindEllipticHint;
  OfstX := Round((Rect.Right-Rect.Left-4)*(Sqrt2-1)*0.5);
  OfstY := Round((Rect.Bottom-Rect.Top-4)*(Sqrt2-1)*0.5);
  With Rect Do Begin
    Top := Top-OfstY;
    Left := Left-OfstX;
    Right := Right+OfstX;
    Bottom := Bottom+OfstY;
  End;
  BoundsRect := Rect;
  MemBmp.Width := Width;
  MemBmp.Height := Height;
  ScreenDC := CreateDC('DISPLAY',nil,nil,nil);
  Pnt.X := 0;
  Pnt.Y := 0;
  Pnt := ClientToScreen(Pnt);
  BitBlt(MemBmp.Canvas.Handle,0,0,Width,Height,ScreenDC,Pnt.X,Pnt.Y,SRCCOPY);
  SetWindowPos(Handle,HWND_TOPMOST,Pnt.X,Pnt.Y,0,0,
               SWP_SHOWWINDOW or SWP_NOACTIVATE or SWP_NOSIZE);
  BitBlt(Canvas.Handle,0,0,Width,Height,MemBmp.Canvas.Handle,0,0,SRCCOPY);
  DeleteDC(ScreenDC);
end;

initialization

end.
