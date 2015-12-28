inherited frm_ExibeCaixas_NovoCaixa: Tfrm_ExibeCaixas_NovoCaixa
  Left = 161
  Top = 119
  BorderStyle = bsNone
  ClientHeight = 275
  ClientWidth = 499
  Color = clTeal
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Image2: TImage [0]
    Left = 4
    Top = 3
    Width = 492
    Height = 35
  end
  object Label12: TLabel [1]
    Left = 19
    Top = 11
    Width = 146
    Height = 18
    Caption = '[Abertura de caixa]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object LabelOO1: TLabelOO [2]
    Left = 16
    Top = 48
    Width = 160
    Height = 13
    Caption = 'C'#243'digo do operador de caixa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO [3]
    Left = 19
    Top = 151
    Width = 157
    Height = 13
    Caption = 'Senha do operador de caixa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO3: TLabelOO [4]
    Left = 16
    Top = 90
    Width = 167
    Height = 13
    Caption = 'Valor inicial do caixa $ (troco)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel [5]
    Left = 8
    Top = 139
    Width = 481
    Height = 8
    Shape = bsTopLine
  end
  object LabelOO4: TLabelOO [6]
    Left = 17
    Top = 132
    Width = 66
    Height = 13
    Caption = ' Seguran'#231'a '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [7]
    Left = 21
    Top = 213
    Width = 233
    Height = 13
    Caption = 'F5-> Salvar abertura do novo caixa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [8]
    Left = 21
    Top = 229
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
  object Bevel2: TBevel [9]
    Left = 9
    Top = 199
    Width = 478
    Height = 5
    Shape = bsTopLine
  end
  object Label9: TLabel [10]
    Left = 411
    Top = 214
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
  object lblValor2: TLabelOO [11]
    Left = 106
    Top = 114
    Width = 24
    Height = 13
    Caption = '(02)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbtipz: TLabel [12]
    Left = 316
    Top = 209
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
  object Label6: TLabel [13]
    Left = 20
    Top = 9
    Width = 146
    Height = 18
    Caption = '[Abertura de caixa]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel3: TBevel [14]
    Left = 0
    Top = 0
    Width = 499
    Height = 275
    Align = alClient
    Shape = bsFrame
  end
  inherited Panel3: TPanel
    Top = 275
    Width = 499
    Height = 0
    TabOrder = 4
    inherited Panel4: TPanel
      Top = -51
      Width = 495
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 452
    Top = 65
    TabOrder = 10
  end
  inherited edteditformulario1: TEdit
    Left = 460
    Top = 59
    TabOrder = 6
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 468
    Top = 53
    TabOrder = 7
  end
  object BotaoSair1: TBotaoSair [19]
    Left = 408
    Top = 236
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
    TabOrder = 8
    OnClick = BotaoSair1Click
  end
  object edtFunc: TMaskEditOO [20]
    Left = 15
    Top = 64
    Width = 66
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnDblClick = edtFuncDblClick
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtmaskeditformulario1Exit
    OnKeyDown = edtmaskeditformulario1KeyDown
    zNomeOO = 'C'#243'digo do funcion'#225'rio'
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 6
    zTipoOO = -1
    zPainelEntidadeOO = pnFunc
    zTipoPesquisaF8 = True
    zMensagemF1 = 
      'C'#243'digo do funcion'#225'rio : formato 999999 - F8/Duplo clique exibe f' +
      'uncion'#225'rios cadastrados'
  end
  object pnFunc: TPanelOO [21]
    Left = 83
    Top = 64
    Width = 408
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
    TabOrder = 9
  end
  object edtValorInicial1: TMaskEditOO [22]
    Left = 15
    Top = 106
    Width = 86
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtmaskeditformulario1Exit
    OnKeyDown = edtmaskeditformulario1KeyDown
    OnKeyUp = edtmaskeditformulario1KeyUp
    zNomeOO = 'Valor inicial'
    zFieldTypeOO = ftFloat
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
    zMensagemF1 = 'Valor inicial: formato 9,999.99'
  end
  inherited CheckBox1: TCheckBox
    Left = 528
    Top = 72
    TabOrder = 5
  end
  object botao2: TPanel [24]
    Left = 261
    Top = 236
    Width = 144
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
    TabOrder = 11
    OnClick = botao2Click
  end
  object edtSenha: TMaskEdit [25]
    Left = 19
    Top = 167
    Width = 108
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 6
    ParentFont = False
    PasswordChar = 'X'
    TabOrder = 3
    OnEnter = edtSenhaEnter
    OnKeyDown = edtSenhaKeyDown
  end
  object edtValorInicial2: TMaskEditOO [26]
    Left = 132
    Top = 106
    Width = 86
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnEnter = edtmaskeditformulario1Enter
    OnExit = edtmaskeditformulario1Exit
    OnKeyDown = edtmaskeditformulario1KeyDown
    OnKeyUp = edtmaskeditformulario1KeyUp
    zNomeOO = 'Valor inicial'
    zFieldTypeOO = ftFloat
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
    zMensagemF1 = 'Valor inicial: formato 9,999.99'
  end
  inherited MainMenu1: TMainMenu
    Left = 458
    Top = 12
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
