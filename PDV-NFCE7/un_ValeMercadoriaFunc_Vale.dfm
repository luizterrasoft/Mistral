inherited frm_ValeMercadoriaFunc_Vale: Tfrm_ValeMercadoriaFunc_Vale
  Left = 166
  Top = 152
  Caption = 'Vale mercadoria funcion'#225'rio'
  ClientHeight = 141
  ClientWidth = 443
  Color = clTeal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object LabelOO1: TLabelOO [0]
    Left = 16
    Top = 24
    Width = 83
    Height = 13
    Caption = 'N'#186' Documento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO [1]
    Left = 123
    Top = 24
    Width = 67
    Height = 13
    Caption = 'Funcion'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel [2]
    Left = 0
    Top = 0
    Width = 443
    Height = 141
    Align = alClient
    Shape = bsFrame
  end
  inherited Panel3: TPanel
    Top = 141
    Width = 443
    Height = 0
    TabOrder = 2
    inherited Panel4: TPanel
      Top = -51
      Width = 439
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 364
    Top = 33
    TabOrder = 3
  end
  inherited edteditformulario1: TEdit
    Left = 372
    Top = 27
    TabOrder = 4
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 380
    Top = 21
    TabOrder = 5
  end
  inherited CheckBox1: TCheckBox
    Left = 400
    Top = 16
    TabOrder = 6
  end
  object BotaoSair1: TBotaoSair [8]
    Left = 352
    Top = 104
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
    TabOrder = 7
    OnClick = BotaoSair1Click
  end
  object botao2: TPanel [9]
    Left = 176
    Top = 104
    Width = 174
    Height = 25
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = 'Salvar - [F5]'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = botao2Click
  end
  object edtDoc: TMaskEditOO [10]
    Left = 16
    Top = 39
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 20
    ParentFont = False
    TabOrder = 0
    OnDblClick = edtmaskeditformulario1DblClick
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtmaskeditformulario1Exit
    OnKeyDown = edtmaskeditformulario1KeyDown
    OnKeyUp = edtmaskeditformulario1KeyUp
    zFieldTypeOO = ftString
    zFieldLengthOO = 20
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object edtFunc: TMaskEditOO [11]
    Left = 123
    Top = 39
    Width = 86
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 6
    ParentFont = False
    TabOrder = 1
    OnDblClick = edtFuncDblClick
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtFuncExit
    OnKeyDown = edtFuncKeyDown
    OnKeyUp = edtmaskeditformulario1KeyUp
    zFieldTypeOO = ftFloat
    zFieldLengthOO = 6
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object pnFunc: TPanelOO [12]
    Left = 16
    Top = 64
    Width = 409
    Height = 22
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  inherited MainMenu1: TMainMenu
    Left = 10
    Top = 104
    inherited Principal1: TMenuItem
      Visible = False
      inherited N1: TMenuItem
        Caption = 'Salvar'
        ShortCut = 116
        OnClick = N1Click
      end
    end
  end
end
