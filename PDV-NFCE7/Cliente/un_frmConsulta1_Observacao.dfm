object frm_Consulta1_Observacao: Tfrm_Consulta1_Observacao
  Left = 52
  Top = 105
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Observa'#231#227'o'
  ClientHeight = 99
  ClientWidth = 696
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblObs: TLabel
    Left = 14
    Top = 13
    Width = 46
    Height = 16
    Caption = 'lblObs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 16
    Top = 40
    Width = 665
    Height = 89
    BorderStyle = bsNone
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object bTNoK: TPanel
    Left = 320
    Top = 64
    Width = 90
    Height = 28
    Cursor = crHandPoint
    BevelInner = bvRaised
    Caption = 'SAIR-ESC'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnOkClick
  end
end
