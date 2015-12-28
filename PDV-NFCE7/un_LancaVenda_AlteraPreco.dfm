object frm_LancaVenda_AlteraPreco: Tfrm_LancaVenda_AlteraPreco
  Left = 225
  Top = 196
  BorderStyle = bsSingle
  Caption = 'Alterar pre'#231'o de venda'
  ClientHeight = 126
  ClientWidth = 316
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 316
    Height = 126
    Align = alClient
  end
  object LabelOO1: TLabelOO
    Left = 24
    Top = 16
    Width = 87
    Height = 13
    Caption = 'Pre'#231'o sugerido:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO
    Left = 24
    Top = 61
    Width = 107
    Height = 13
    Caption = 'Alterar pre'#231'o para:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOk: TPanel
    Left = 189
    Top = 19
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Caption = '&Ok'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TPanel
    Left = 189
    Top = 48
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Caption = '&Cancelar'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edtPrecoSugerido: TMaskEditOO
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    zFieldTypeOO = ftUnknown
    zFieldLengthOO = 0
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object edtNovoPreco: TMaskEditOO
    Left = 24
    Top = 77
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = edtNovoPrecoEnter
    OnExit = edtNovoPrecoExit
    OnKeyDown = edtNovoPrecoKeyDown
    OnKeyUp = edtNovoPrecoKeyUp
    zFieldTypeOO = ftFloat
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
end
