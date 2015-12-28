object frm_Opcoes_2via: Tfrm_Opcoes_2via
  Left = 342
  Top = 161
  Width = 260
  Height = 176
  Caption = '2'#170' Via'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 16
    Width = 217
    Height = 80
    Caption = 'Selecione uma das op'#231#245'es:'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object rbCarnet: TRadioButton
    Left = 24
    Top = 40
    Width = 113
    Height = 17
    Caption = 'Carnet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyDown = rbCarnetKeyDown
  end
  object rbRecibo: TRadioButton
    Left = 24
    Top = 68
    Width = 113
    Height = 17
    Caption = 'Comprovante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnKeyDown = rbReciboKeyDown
  end
  object btnOK: TButton
    Left = 88
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnOKClick
    OnKeyDown = btnOKKeyDown
  end
end
