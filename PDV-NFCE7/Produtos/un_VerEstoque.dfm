object frm_VerEstoque: Tfrm_VerEstoque
  Left = 61
  Top = 33
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ver dados sobre o item de estoque'
  ClientHeight = 456
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 663
    Height = 415
    Align = alClient
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 415
    Width = 663
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel8: TPanel
      Left = 576
      Top = 9
      Width = 76
      Height = 23
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'SAIR'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Panel8Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 444
    Top = 8
    object Principal1: TMenuItem
      Caption = 'Principal'
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
end
