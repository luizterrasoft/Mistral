object frm_Aux4Contrato_demo: Tfrm_Aux4Contrato_demo
  Left = 230
  Top = 222
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 71
  ClientWidth = 373
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 373
    Height = 70
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 301
    Height = 13
    Caption = 'CPF/CNPJ do cliente obrigat'#243'ro em plano de cheque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCpf: TMaskEdit
    Left = 16
    Top = 32
    Width = 161
    Height = 21
    EditMask = '99999999999999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 14
    ParentFont = False
    TabOrder = 0
    Text = '              '
    OnEnter = edtCpfEnter
    OnKeyDown = edtCpfKeyDown
  end
end
