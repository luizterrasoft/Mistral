object frm_CaixaLancamentos_F8TipoValor: Tfrm_CaixaLancamentos_F8TipoValor
  Left = 211
  Top = 260
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Tipos de valor dispon'#237'veis'
  ClientHeight = 120
  ClientWidth = 198
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lista: TListBox
    Left = 0
    Top = 22
    Width = 198
    Height = 98
    Cursor = crHandPoint
    Align = alBottom
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 16
    Items.Strings = (
      '1- DINHEIRO'
      '2- CHEQUE'
      '3- OUTROS')
    ParentFont = False
    TabOrder = 0
    OnDblClick = listaDblClick
    OnKeyDown = listaKeyDown
  end
  object btnFechar: TPanel
    Left = 171
    Top = 3
    Width = 22
    Height = 16
    Cursor = crHandPoint
    Caption = 'X'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnFecharClick
  end
end
