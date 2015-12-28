inherited frm_LancaVenda_InformeVendedor: Tfrm_LancaVenda_InformeVendedor
  Left = 199
  Top = 171
  BorderStyle = bsNone
  ClientHeight = 131
  ClientWidth = 399
  Color = clTeal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 0
    Top = 0
    Width = 399
    Height = 131
    Align = alClient
    Shape = bsFrame
  end
  object LabelOO1: TLabelOO [1]
    Left = 25
    Top = 26
    Width = 172
    Height = 13
    Caption = 'Informe o c'#243'digo do Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO [2]
    Left = 313
    Top = 75
    Width = 62
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel3: TPanel
    Top = 131
    Width = 399
    Height = 0
    inherited Panel4: TPanel
      Top = -51
      Width = 395
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 308
    Top = 33
  end
  inherited edteditformulario1: TEdit
    Left = 316
    Top = 27
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 324
    Top = 21
  end
  inherited CheckBox1: TCheckBox
    Left = 336
    Top = 13
  end
  object BotaoSair1: TBotaoSair [8]
    Left = 303
    Top = 92
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fecha o formul'#225'rio'
    Caption = 'SAIR'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BotaoSair1Click
  end
  object pnVend: TPanelOO [9]
    Left = 97
    Top = 41
    Width = 284
    Height = 23
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object edtCodigo: TMaskEditOO [10]
    Left = 23
    Top = 42
    Width = 72
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!999999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 6
    ParentFont = False
    TabOrder = 7
    Text = '      '
    OnDblClick = edtCodigoDblClick
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
    OnKeyDown = edtCodigoKeyDown
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 6
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object btnConfirmar: TPanel [11]
    Left = 112
    Top = 92
    Width = 188
    Height = 25
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = ' Confirmar - [F5]'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnConfirmarClick
  end
  inherited MainMenu1: TMainMenu
    Left = 11
    Top = 73
    inherited Principal1: TMenuItem
      Visible = False
      inherited N1: TMenuItem
        Caption = 'Confirmar vendedor'
        ShortCut = 116
        OnClick = N1Click
      end
    end
  end
end
