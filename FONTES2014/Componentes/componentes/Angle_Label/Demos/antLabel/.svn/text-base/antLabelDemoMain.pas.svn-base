{******************************************************************************}
{**                                                                          **}
{**  TantLabel Component Demo.                                               **}
{**                                                                          **}
{**  Author:    KARPOLAN                                                     **}
{**  E-Mail:    karpolan@yahoo.com , karpolan@utilmind.com                   **}
{**  Home Page: http://karpolan.i.am, http://www.utilmind.com                **}
{**  Copyright © 1996-99 by KARPOLAN.                                        **}
{**  Copyright © 1999, UtilMind Solutions.                                   **}
{**                                                                          **}
{******************************************************************************}
{** History:
  21 des 1998 - 1.0 First release....
  31 aug 1999 - 2.3 Some updates...
*******************************************************************************}
Unit antLabelDemoMain;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, antLabel, ExtCtrls, Buttons, Menus;

Type
  TfrmMain = Class(TForm)
    lbExit: TantLabel;
    antLabel1: TantLabel;
    antLabel2: TantLabel;
    antLabel3: TantLabel;
    antLabel4: TantLabel;
    lbEmail: TantLabel;
    Image1: TImage;
    antLabel5: TantLabel;
    antLabel6: TantLabel;
    antLabel7: TantLabel;
    lbWeb: TantLabel;
    Procedure lbExitClick(SEnder: TObject);
    Procedure antLabelClick(SEnder: TObject);
    Procedure lbEmailClick(SEnder: TObject);
    procedure lbWebClick(Sender: TObject);
  End;

Var
  frmMain: TfrmMain;

Implementation
{$R *.DFM}

Uses
  ShellApi;

Procedure TfrmMain.lbExitClick(SEnder: TObject);
Begin
  Close;
End;

Procedure TfrmMain.antLabelClick(SEnder: TObject);
Begin
  Beep;
End;

Procedure TfrmMain.lbEmailClick(SEnder: TObject);
Var
  St : Array[0..255] of Char;
Begin
  ShellExecute(frmMain.Handle, 'open', StrPCopy(St, 'mailto:' + lbEmail.Caption +
              '?subject=From TantLabel component Demo'),
               nil, nil, SW_SHOW);
End;

Procedure TfrmMain.lbWebClick(Sender: TObject);
Var
  St: Array[0..255] of Char;
Begin
  ShellExecute(Application.Handle, 'open', StrPCopy(St,'http://' + lbWeb.Caption),
    nil, nil, SW_SHOW);
End;

END{Unit formMain}.
