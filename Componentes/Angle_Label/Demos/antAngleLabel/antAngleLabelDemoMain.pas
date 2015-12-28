{******************************************************************************}
{**                                                                          **}
{**  TantAngleLabel Component DEMO. Main Form unit                           **}
{**                                                                          **}
{**  Author:    KARPOLAN                                                     **}
{**  E-Mail:    karpolan@yahoo.com , karpolan@utilmind.com                   **}
{**  Home Page: http://karpolan.i.am, http://www.utilmind.com                **}
{**  Copyright © 1996-99 by KARPOLAN.                                        **}
{**  Copyright © 1999, UtilMind Solutions.                                   **}
{**                                                                          **}
{******************************************************************************}
{** History:
  04 mar 1999 - 1.1
  31 aug 1999 - 1.2 Some updates...
*******************************************************************************}
Unit antAngleLabelDemoMain;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Menus, antAngleLabel;

Type
  TfrmMain = Class(TForm)
    antAngleLabel1: TantAngleLabel;
    antAngleLabel2: TantAngleLabel;
    antAngleLabel3: TantAngleLabel;
    antAngleLabel4: TantAngleLabel;
    lbRotate: TantAngleLabel;
    tmrDelay: TTimer;
    lbXXX: TantAngleLabel;
    lbTopDown: TantAngleLabel;
    lbRightLeft: TantAngleLabel;
    mmMain: TMainMenu;
    miMain: TMenuItem;
    miAbout: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;

    Procedure tmrDelayTimer(Sender: TObject);
    Procedure miAboutClick(Sender: TObject);
    Procedure miExitClick(Sender: TObject);
  End;

Var
  frmMain: TfrmMain;

{##############################################################################}
{******************************************************************************}
{##############################################################################}
Implementation
{##############################################################################}
{******************************************************************************}
{##############################################################################}
{$R *.DFM}
Uses
  antAngleLabelDemoAbout;

Procedure TfrmMain.tmrDelayTimer(Sender: TObject);
Begin
  with lbRotate do
   if AngleDirection = adSouthEast
    then AngleDirection := adEast
    else AngleDirection := Succ(AngleDirection);

  with lbXXX do
   if AngleDirection = adNothEast
    then AngleDirection := adSouthEast
    else AngleDirection := adNothEast;

  with lbTopDown do
   if AngleDirection = adSouth
    then AngleDirection := adNoth
    else AngleDirection := adSouth;

  with lbRightLeft do
   if AngleDirection = adEast
    then AngleDirection := adWest
    else AngleDirection := adEast;
End;

Procedure TfrmMain.miAboutClick(Sender: TObject);
Begin
  ShowAbout;
End;

Procedure TfrmMain.miExitClick(Sender: TObject);
Begin
  Close;
End;

END{Unit antAngleLabelDemoMain}.
