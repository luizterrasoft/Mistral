inherited frm_CaixaLancamentos: Tfrm_CaixaLancamentos
  Left = 117
  Top = 165
  BorderStyle = bsNone
  Caption = 'Lan'#231'amentos Diversos - Inclus'#227'o'
  ClientHeight = 312
  ClientWidth = 565
  Color = clTeal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 0
    Top = 0
    Width = 565
    Height = 312
    Align = alClient
    Shape = bsFrame
  end
  object Image2: TImage [1]
    Left = 4
    Top = 3
    Width = 558
    Height = 35
  end
  object LabelOO1: TLabelOO [2]
    Left = 19
    Top = 52
    Width = 39
    Height = 13
    Caption = 'Valor $'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO [3]
    Left = 118
    Top = 52
    Width = 124
    Height = 13
    Caption = 'Natureza da opera'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO3: TLabelOO [4]
    Left = 19
    Top = 95
    Width = 120
    Height = 13
    Caption = 'Conta do lan'#231'amento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO4: TLabelOO [5]
    Left = 19
    Top = 137
    Width = 73
    Height = 13
    Caption = 'Tipo de valor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel [6]
    Left = 9
    Top = 228
    Width = 536
    Height = 9
    Shape = bsTopLine
  end
  object Label14: TLabel [7]
    Left = 51
    Top = 236
    Width = 106
    Height = 13
    Caption = 'Salvar lan'#231'amento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblF8mens: TLabel [8]
    Left = 51
    Top = 252
    Width = 54
    Height = 13
    Caption = 'Consultar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lblF8: TLabel [9]
    Left = 19
    Top = 252
    Width = 27
    Height = 13
    Caption = 'F8->'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label15: TLabel [10]
    Left = 19
    Top = 236
    Width = 27
    Height = 13
    Caption = 'F5->'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label22: TLabel [11]
    Left = 479
    Top = 244
    Width = 34
    Height = 13
    Caption = 'ESC->'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label23: TLabel [12]
    Left = 517
    Top = 244
    Width = 22
    Height = 13
    Caption = 'Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO5: TLabelOO [13]
    Left = 19
    Top = 179
    Width = 255
    Height = 13
    Caption = 'Descri'#231#227'o do lan'#231'amento (at'#233' 50 caracteres)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbtipz: TLabel [14]
    Left = 412
    Top = 244
    Width = 35
    Height = 16
    Caption = 'Sr.: 1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbltitulo_sombra: TLabel [15]
    Left = 19
    Top = 11
    Width = 180
    Height = 18
    Caption = '[Lan'#231'amentos diversos]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbltitulo: TLabel [16]
    Left = 20
    Top = 12
    Width = 180
    Height = 18
    Caption = '[Lan'#231'amentos diversos]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  inherited Panel3: TPanel
    Top = 312
    Width = 565
    Height = 0
    TabOrder = 5
    inherited Panel4: TPanel
      Top = -51
      Width = 561
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 444
    Top = 65
    TabOrder = 6
  end
  inherited edteditformulario1: TEdit
    Left = 452
    Top = 59
    TabOrder = 7
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 460
    Top = 53
    TabOrder = 8
  end
  inherited CheckBox1: TCheckBox
    Left = 472
    Top = 48
    Width = 105
    TabOrder = 9
  end
  object edtValor: TMaskEditOO [22]
    Left = 17
    Top = 66
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtmaskeditformulario1Exit
    OnKeyDown = edtmaskeditformulario1KeyDown
    OnKeyUp = edtmaskeditformulario1KeyUp
    zFieldTypeOO = ftFloat
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object BotaoSair1: TBotaoSair [23]
    Left = 468
    Top = 273
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
    TabOrder = 10
    OnClick = BotaoSair1Click
  end
  object Panel1: TPanel [24]
    Left = 152
    Top = 66
    Width = 113
    Height = 36
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Color = clTeal
    TabOrder = 11
    object Label7: TLabel
      Left = 9
      Top = 4
      Width = 60
      Height = 13
      Caption = 'C= Cr'#233'dito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 18
      Width = 57
      Height = 13
      Caption = 'D= D'#233'bito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edtNatu: TMaskEditOO [25]
    Left = 116
    Top = 66
    Width = 33
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = edtNatuChange
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtmaskeditformulario1KeyDown
    zFieldTypeOO = ftString
    zFieldLengthOO = 1
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object edtConta: TMaskEditOO [26]
    Left = 17
    Top = 110
    Width = 97
    Height = 21
    Cursor = crHandPoint
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnDblClick = edtContaDblClick
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtmaskeditformulario1Exit
    OnKeyDown = edtmaskeditformulario1KeyDown
    zNomeOO = 'C'#243'digo do lan'#231'amento'
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 10
    zTipoOO = -1
    zPainelEntidadeOO = pnCodigo
    zTipoPesquisaF8 = True
  end
  object pnCodigo: TPanelOO [27]
    Left = 117
    Top = 110
    Width = 431
    Height = 21
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object edtTipoValor: TMaskEditOO [28]
    Left = 17
    Top = 152
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnDblClick = edtTipoValorDblClick
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtmaskeditformulario1Exit
    OnKeyDown = edtmaskeditformulario1KeyDown
    zNomeOO = 'Tipo de valor'
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 2
    zTipoOO = -1
    zPainelEntidadeOO = pnTipoValor
    zTipoPesquisaF8 = True
  end
  object pnTipoValor: TPanelOO [29]
    Left = 69
    Top = 152
    Width = 205
    Height = 21
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
  end
  object btnConfere: TPanel [30]
    Left = 232
    Top = 274
    Width = 234
    Height = 23
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = 'Salvar lan'#231'amento - [F5]'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = btnConfereClick
  end
  object edtDesc: TMaskEditOO [31]
    Left = 17
    Top = 193
    Width = 531
    Height = 21
    Hint = 'F8 para pesquisar descri'#231#245'es j'#225' lan'#231'adas'
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 50
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtDescKeyDown
    zNomeOO = 'Descri'#231#227'o do lan'#231'amento'
    zFieldTypeOO = ftString
    zFieldLengthOO = 60
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object BitBtn1: TBitBtn [32]
    Left = 96
    Top = 274
    Width = 118
    Height = 25
    Caption = 'Acertar lancamentos'
    TabOrder = 15
    Visible = False
    OnClick = BitBtn1Click
  end
  inherited MainMenu1: TMainMenu
    Left = 274
    Top = 68
    inherited Principal1: TMenuItem
      Visible = False
      inherited N1: TMenuItem
        Caption = 'Salvar lan'#231'amento'
        ShortCut = 116
        OnClick = N1Click
      end
    end
  end
end
