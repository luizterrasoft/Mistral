inherited frm_CancelaAtendimento: Tfrm_CancelaAtendimento
  Left = 190
  Top = 122
  Caption = 'Cancelamento de Atendimento'
  ClientHeight = 146
  ClientWidth = 412
  PixelsPerInch = 96
  TextHeight = 13
  object LabelOO1: TLabelOO [0]
    Left = 16
    Top = 16
    Width = 139
    Height = 13
    Caption = 'Motivo do cancelamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel [1]
    Left = 326
    Top = 88
    Width = 69
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [2]
    Left = 8
    Top = 76
    Width = 184
    Height = 13
    Caption = 'CTRL+L-> Limpar formul'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel [3]
    Left = 0
    Top = 70
    Width = 571
    Height = 9
    Shape = bsTopLine
  end
  inherited Panel3: TPanel
    Top = 144
    Width = 412
    Color = clTeal
    inherited Panel4: TPanel
      Width = 408
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 196
    Top = 33
  end
  inherited edteditformulario1: TEdit
    Left = 236
    Top = 27
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 244
    Top = 21
  end
  inherited CheckBox1: TCheckBox
    Left = 259
    Top = 8
  end
  inherited BotaoSair1: TBotaoSair
    Left = 323
    Top = 110
  end
  object edtMotivo: TMaskEditOO [10]
    Left = 16
    Top = 32
    Width = 65
    Height = 22
    CharCase = ecUpperCase
    EditMask = '!999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 3
    ParentFont = False
    TabOrder = 6
    Text = '   '
    OnDblClick = edtMotivoDblClick
    OnKeyDown = edtMotivoKeyDown
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 3
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object pnMotivo: TPanelOO [11]
    Left = 83
    Top = 32
    Width = 321
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object btnSuspender: TPanel [12]
    Left = 50
    Top = 110
    Width = 270
    Height = 25
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = 'Confirmar cancelamento - [F5]'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnSuspenderClick
  end
  inherited MainMenu1: TMainMenu
    Left = 170
    Top = 17
    inherited Principal1: TMenuItem
      inherited N1: TMenuItem
        Caption = 'Confirmar cancelamento'
        ShortCut = 116
        OnClick = N1Click
      end
    end
  end
end
