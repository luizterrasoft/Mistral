unit Myrotaed;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, MyRotate, ColorGrd,DesignIntf,DesignEditors,
  Spin,ExtCtrls;

type
   TLabelEditorDlg = class(TForm)
    RBNormal: TRadioButton;
    RBRaised: TRadioButton;
    RBResit: TRadioButton;
    RBShadowed: TRadioButton;
    RBResetWhite: TCheckBox;
    Label4: TLabel;
    TheAngle: TScrollBar;
    Degree: TLabel;
    BitBtnOk: TBitBtn;
    MyLabelRotate1: TMyLabelRotate;
    BitBtnCancel: TBitBtn;
    ShadeV: TSpinEdit;
    Label2: TLabel;
    ShadeH: TSpinEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    MyLabelRotate2: TMyLabelRotate;
    ByLabel: TLabel;
    ShadowColors: TComboBox;
    ShadowChoice: TRadioGroup;
    procedure TheAngleScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure RBResetWhiteClick(Sender: TObject);
    procedure ShadowColorsChange(Sender: TObject);
    procedure RBNormalClick(Sender: TObject);
    procedure RBRaisedClick(Sender: TObject);
    procedure RBResitClick(Sender: TObject);
    procedure RBShadowedClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure ShadeVChange(Sender: TObject);
    procedure ShadeHChange(Sender: TObject);
    procedure MyLabelRotate1Click(Sender: TObject);
     { Private declarations }
   private
    fAngle: longint;
    FA3DEffect : T3DEffectShort;
    FhOffSet,FvOffSet : integer;
    FShadowColor,FWhiteColor : TColor;
    FShadeLTSet : boolean;
    FLabelStyle : TLabelStyle;
    ColorValues : array[0..38] of TColor;
    procedure DefaultColorPallet;
    procedure SetTheAngle(Value: longint);
    procedure setTheStyleEffect(Value : T3DEffectShort);
    procedure SetTheShadowColor(Value:TColor);
    procedure SetTheWhiteColor(Value:TColor);
    procedure SetTheShadeLT(value: boolean);
    procedure SetTheFhOffSet(value: integer);
    procedure SetTheFvOffSet(value: integer);
    procedure setTheLabelstyle(value:TLabelStyle);
  public
    { Public declarations }
    property EditorLabelStyle : TLabelStyle read FLabelStyle write setTheLabelStyle;
  end;

  TLabelStyleProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TMyLabelRotateEditor = class(TDefaultEditor)
  public
    procedure EditProperty(PropertyEditor: TPropertyEditor;
      var Continue, FreeEditor: Boolean); virtual;
  end;

implementation

{$R *.DFM}
procedure TLabelStyleProperty.Edit;
var
  Style: TLabelStyle;
  LabelStyleEditor: TLabelEditorDlg ;
begin
  Style := TLabelStyle(GetOrdValue);
  LabelStyleEditor := TLabelEditorDlg .Create(Application);
  try
    LabelStyleEditor.EditorLabelStyle := Style;
    LabelStyleEditor.ShowModal;
    Designer.Modified;
  finally
    LabelStyleEditor.Free;
  end;
end;

function TLabelStyleProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paSubProperties, paAutoUpdate];
end;

{TMyLabelRotateEditor}

procedure TMyLabelRotateEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: Boolean);
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'LABELSTYLE') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

procedure TLabelEditorDlg.DefaultColorPallet;
begin
   ColorValues[0] := clBlack;
ColorValues[1] := clMaroon;
ColorValues[2] := clGreen;
ColorValues[3] := clOlive;
ColorValues[4] := clNavy;
ColorValues[5] := clPurple;
ColorValues[6] := clTeal;
ColorValues[7] := clGray;
ColorValues[8] := clSilver;
ColorValues[9] := clRed;
ColorValues[10] := clLime;
ColorValues[11] := clYellow;
ColorValues[12] := clBlue;
ColorValues[13] := clFuchsia;
ColorValues[14] := clAqua;
ColorValues[15] := clWhite;
ColorValues[16] := clLtGray;
ColorValues[17] := clDkGray;
ColorValues[18] := clScrollBar;
ColorValues[19] := clBackground;
ColorValues[20] := clActiveCaption;
ColorValues[21] := clInactiveCaption;
ColorValues[22] := clMenu;
ColorValues[23] := clWindow;
ColorValues[24] := clWindowFrame;
ColorValues[25] := clMenuText;
ColorValues[26] := clWindowText;
ColorValues[27] := clCaptionText;
ColorValues[28] := clActiveBorder;
ColorValues[29] := clInactiveBorder;
ColorValues[30] := clAppWorkSpace;
ColorValues[31] := clHighlight;
ColorValues[32] := clHighlightText;
ColorValues[33] := clBtnFace;
ColorValues[34] := clBtnShadow;
ColorValues[35] := clGrayText;
ColorValues[36] := clBtnText;
ColorValues[37] := clInactiveCaptionText;
ColorValues[38] := clBtnHighlight;
end;

procedure TLabelEditorDlg.setTheLabelStyle(Value: TLabelStyle);

begin
  DefaultColorPallet;
  FLabelStyle := Value;
  fAngle := Value.Angle;
  degree.Caption := IntTOStr(fAngle);
  TheAngle.Position := fAngle;
  FA3DEffect := Value.AStyle3D;
  FhOffSet := Value.AHShadeOffSet;
  FvOffSet := Value.AVShadeOffSet;
  FShadowColor := Value.AShadeRightBottom;
  FWhiteColor := Value.AShadeLeftTop;
  FShadeLTSet := Value.AShadeLTSet;
  FLabelStyle.Angle  := value.Angle;

  degree.Caption := IntTOStr(value.Angle);
  ShadeH.Value := Value.AHShadeOffSet;
  ShadeV.Value := Value.AVShadeOffSet;

  RBResetWhite.Checked := Value.AShadeLTSet;
  Case Value.AStyle3D of
    A3dNormal   : RBNormal.Checked := true;
    A3dResit    : RBResit.Checked := true;
    A3dRaised   : RBRaised.Checked := true;
    A3dShadowed : RBShadowed.Checked := true;
  end;
end;

procedure TLabelEditorDlg.TheAngleScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  if ScrollPos = 360 then
    ScrollPos := 0;
  SetTheAngle(ScrollPos);
  degree.Caption := IntTOStr(ScrollPos);
end;

procedure TLabelEditorDlg.SetTheAngle(Value: longint);
begin
   FLabelStyle.Angle  := value;
end;

procedure TLabelEditorDlg.SetTheFhOffSet(value: integer);
begin
  FLabelStyle.AHShadeOffSet  := value;
end;

procedure TLabelEditorDlg.SetTheFvOffSet(value: integer);
begin
  FLabelStyle.AVShadeOffSet  := value;
end;

procedure TLabelEditorDlg.SetTheShadeLT(value: boolean);
begin
   FLabelStyle.AShadeLTSet := value;
end;

procedure TLabelEditorDlg.RBResetWhiteClick(Sender: TObject);
begin
   if RBResetWhite.Checked then
      SetTheShadeLT(True)
   else
      SetTheShadeLT(false);
end;

procedure TLabelEditorDlg.SetTheShadowColor(Value:TColor);
begin
   FLabelStyle.AShadeRightBottom := value;
end;

procedure TLabelEditorDlg.SetTheWhiteColor(Value:TColor);
begin
  FLabelStyle.AShadeLeftTop := value;
end;

procedure TLabelEditorDlg.ShadowColorsChange(Sender: TObject);
begin
  if ShadowChoice.ItemIndex = 1 then
    SetTheShadowColor(ColorValues[ShadowColors.ItemIndex])
  else
    SetTheWhiteColor(ColorValues[ShadowColors.ItemIndex]);
end;

procedure TLabelEditorDlg.setTheStyleEffect(Value : T3DEffectShort);
begin
  FLabelStyle.AStyle3D := value;
end;

procedure TLabelEditorDlg.RBNormalClick(Sender: TObject);
begin
  setTheStyleEffect(A3dNormal);
end;

procedure TLabelEditorDlg.RBRaisedClick(Sender: TObject);
begin
 setTheStyleEffect(A3dRaised);
end;

procedure TLabelEditorDlg.RBResitClick(Sender: TObject);
begin
  setTheStyleEffect(A3dResit);
end;

procedure TLabelEditorDlg.RBShadowedClick(Sender: TObject);
begin
  setTheStyleEffect(A3dShadowed);
end;

procedure TLabelEditorDlg.BitBtnCancelClick(Sender: TObject);

begin
  SetTheAngle(fAngle);
  degree.Caption := IntTOStr(fAngle);
  TheAngle.Position := fAngle;

  setTheStyleEffect(FA3DEffect);
  Case FA3DEffect of
    A3dNormal   : RBNormal.Checked := true;
    A3dResit    : RBResit.Checked := true;
    A3dRaised   : RBRaised.Checked := true;
    A3dShadowed : RBShadowed.Checked := true;
  end;

  SetTheShadowColor(FShadowColor);
  SetTheWhiteColor(FWhiteColor);

  SetTheShadeLT(FShadeLTSet);
  RBResetWhite.Checked := FShadeLTSet;

  SetTheFhOffSet(FhOffSet);
  SetTheFvOffSet(FvOffSet);
  ShadeH.Value := FhOffSet;
  ShadeV.Value := FvOffSet;
end;

procedure TLabelEditorDlg.ShadeVChange(Sender: TObject);
begin
   SetTheFvOffSet(ShadeV.Value);
end;

procedure TLabelEditorDlg.ShadeHChange(Sender: TObject);
begin
   SetTheFhOffSet(ShadeH.Value);
end;

procedure TLabelEditorDlg.MyLabelRotate1Click(Sender: TObject);
begin
  if ByLabel.Visible = false then
    ByLabel.Visible := true
  else
    ByLabel.Visible := false;
end;

end.
