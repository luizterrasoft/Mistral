{******************************************************************************}
{**                                                                          **}
{**  TantAngleLabel Component DEMO. About routines.                          **}
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
Unit antAngleLabelDemoAbout;

Interface

Uses
  Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

Const
  strProjectName = 'TantAngleLabel Component DEMO';
  strVerNumber   = '1.2';
  strVerStatus   = 'freeware' + #32'(31 aug 1999)';
  strEmail       = 'karpolan@utilmind.com';
  strWeb         = 'www.utilmind.com';
  strCopyRight   = 'Copyright © 1998-99 UtilMind Solutions';

Type
  TfrmAbout = Class(TForm)
    pn1: TPanel;
      lbProjectName: TLabel;
      lbProjectNameX: TLabel;
      lbCopyright: TLabel;
      lbEmail: TLabel;
    bbOk: TBitBtn;
    lbVersion: TLabel;
    pnImage: TPanel;
    imKarpolan: TImage;
    lbWeb: TLabel;
    Label1: TLabel;
    Label2: TLabel;

    Procedure FormCreate(Sender: TObject);
    Procedure lbEmailClick(Sender: TObject);
    Procedure lbEmailMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Procedure lbEmailMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbWebClick(Sender: TObject);
  End;{TfrmAbout = Class(TForm)}


Procedure ShowAbout;

{##############################################################################}
{******************************************************************************}
{##############################################################################}
Implementation
{##############################################################################}
{******************************************************************************}
{##############################################################################}
{$R *.DFM}
Uses
  ShellApi, SysUtils, antAngleLabelDemoMain;

Var
  frmAbout: TfrmAbout;

Procedure ShowAbout;
Begin
  frmAbout := TfrmAbout.Create(Application);
  with frmAbout do
   try
     ShowModal;
   finally
     Free;
   end;{try..finally}
End;{Procedure ShowAbout}


{##############################################################################}
{## TfrmAbout = Class(TForm) ###################################################}
{##############################################################################}

{******************************************************************************}
{** Pulished By Delphi ********************************************************}
{******************************************************************************}
Procedure TfrmAbout.FormCreate(Sender: TObject);
Begin
//  imIcon.Picture.Icon.Assign(Application.Icon);
  lbProjectName .Caption := strProjectName;
  lbProjectNameX.Caption := strProjectName;
  lbVersion     .Caption := 'Version ' + strVerNumber + ' ' + strVerStatus;
  lbEmail       .Caption := strEmail;
  lbWeb         .Caption := strWeb;
  lbCopyRight   .Caption := strCopyRight;

  RePaint;
End;{Procedure TfrmAbout.FormCreate}

Procedure TfrmAbout.lbEmailClick(Sender: TObject);
Var
  St: Array[0..255] of Char;
Begin
  ShellExecute(Application.Handle, 'open', StrPCopy(St, 'mailto:' + strEmail +
              '?subject=From ' + strProjectName), nil, nil, SW_SHOW);
End;

Procedure TfrmAbout.lbWebClick(Sender: TObject);
Var
  St: Array[0..255] of Char;
Begin
  ShellExecute(Application.Handle, 'open', StrPCopy(St,'http://' + strWeb),
    nil, nil, SW_SHOW);
End;

Procedure TfrmAbout.lbEmailMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Begin
  (Sender as TLabel).Font.Color := clRed;
End;

Procedure TfrmAbout.lbEmailMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Begin
  (Sender as TLabel).Font.Color := clBlue;
End;


END{Unit antAngleLabelDemoAbout}.

