object frm_DiarioRecebe: Tfrm_DiarioRecebe
  Left = 93
  Top = 27
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Di'#225'rio de recebimentos'
  ClientHeight = 468
  ClientWidth = 600
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object gPlano: TGroupBox
    Left = 0
    Top = 0
    Width = 600
    Height = 71
    Align = alTop
    Caption = ' Planos de pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 35
      Height = 13
      Caption = 'Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 49
      Width = 28
      Height = 13
      Caption = 'Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtInicial1: TMaskEdit
      Left = 64
      Top = 19
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      Text = '    '
      OnClick = edtInicial1Click
      OnEnter = edtInicial1Enter
      OnExit = edtInicial1Exit
      OnKeyDown = edtInicial1KeyDown
    end
    object edtFinal1: TMaskEdit
      Left = 64
      Top = 41
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 1
      Text = '    '
      OnClick = edtFinal1Click
      OnEnter = edtFinal1Enter
      OnExit = edtFinal1Exit
      OnKeyDown = edtFinal1KeyDown
    end
    object pnPlano1: TPanel
      Left = 148
      Top = 19
      Width = 376
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnPlano2: TPanel
      Left = 148
      Top = 41
      Width = 376
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object ch1: TCheckBox
      Left = 530
      Top = 32
      Width = 58
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = ch1Click
      OnKeyDown = ch1KeyDown
    end
  end
  object gContrato: TGroupBox
    Left = 0
    Top = 71
    Width = 600
    Height = 51
    Align = alTop
    Caption = 'Data de recebimento das presta'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 27
      Width = 35
      Height = 13
      Caption = 'Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 160
      Top = 27
      Width = 28
      Height = 13
      Caption = 'Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtInicial2: TMaskEdit
      Left = 64
      Top = 19
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = edtInicial2Enter
      OnExit = edtInicial2Exit
      OnKeyDown = edtInicial2KeyDown
    end
    object edtFinal2: TMaskEdit
      Left = 192
      Top = 19
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = edtFinal2Enter
      OnExit = edtFinal2Exit
      OnKeyDown = edtFinal2KeyDown
    end
    object ch2: TCheckBox
      Left = 529
      Top = 23
      Width = 58
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ch2Click
      OnKeyDown = ch2KeyDown
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 122
    Width = 600
    Height = 73
    Align = alTop
    Caption = 'Loja '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 31
      Width = 35
      Height = 13
      Caption = 'Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 53
      Width = 28
      Height = 13
      Caption = 'Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtInicial3: TMaskEdit
      Left = 64
      Top = 23
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      Color = clTeal
      EditMask = '!999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '   '
      OnDblClick = edtInicial3DblClick
      OnEnter = edtInicial3Enter
      OnExit = edtInicial3Exit
      OnKeyDown = edtInicial3KeyDown
    end
    object edtFinal3: TMaskEdit
      Left = 64
      Top = 45
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      Color = clTeal
      EditMask = '!999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '   '
      OnDblClick = edtFinal3DblClick
      OnEnter = edtFinal3Enter
      OnExit = edtFinal3Exit
      OnKeyDown = edtFinal3KeyDown
    end
    object pnLoja1: TPanel
      Left = 148
      Top = 23
      Width = 376
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnLoja2: TPanel
      Left = 148
      Top = 45
      Width = 376
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object ch3: TCheckBox
      Left = 528
      Top = 32
      Width = 58
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnClick = ch3Click
      OnKeyDown = ch3KeyDown
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 195
    Width = 600
    Height = 51
    Align = alTop
    Caption = 'Data de vencimento das presta'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label7: TLabel
      Left = 16
      Top = 30
      Width = 35
      Height = 13
      Caption = 'Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 160
      Top = 30
      Width = 28
      Height = 13
      Caption = 'Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtInicial4: TMaskEdit
      Left = 64
      Top = 22
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = edtInicial4Enter
      OnExit = edtInicial4Exit
      OnKeyDown = edtInicial4KeyDown
    end
    object edtFinal4: TMaskEdit
      Left = 192
      Top = 22
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = edtFinal4Enter
      OnExit = edtFinal4Exit
      OnKeyDown = edtFinal4KeyDown
    end
    object ch4: TCheckBox
      Left = 528
      Top = 23
      Width = 57
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ch4Click
      OnKeyDown = ch4KeyDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 372
    Width = 600
    Height = 96
    Align = alBottom
    BevelInner = bvLowered
    Color = clTeal
    TabOrder = 4
    object Bevel8: TBevel
      Left = 307
      Top = 10
      Width = 184
      Height = 26
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 262
      Top = 17
      Width = 41
      Height = 13
      Caption = 'Control'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label55: TLabel
      Left = 338
      Top = 17
      Width = 31
      Height = 13
      Caption = 'impar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label56: TLabel
      Left = 329
      Top = 16
      Width = 8
      Height = 13
      Caption = '&L'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 511
      Top = 17
      Width = 36
      Height = 13
      Caption = 'ESC->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 548
      Top = 17
      Width = 23
      Height = 13
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 15
      Top = 9
      Width = 26
      Height = 13
      Caption = 'F5->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 41
      Top = 9
      Width = 152
      Height = 13
      Caption = 'Listar presta'#231#245'es a vencer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbF8mens: TLabel
      Left = 41
      Top = 25
      Width = 54
      Height = 13
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbF8: TLabel
      Left = 15
      Top = 25
      Width = 26
      Height = 13
      Caption = 'F8->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Panel4: TPanel
      Left = 2
      Top = 45
      Width = 596
      Height = 49
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clTeal
      TabOrder = 0
      object botao_sair: TPanel
        Left = 503
        Top = 13
        Width = 76
        Height = 23
        Cursor = crHandPoint
        BevelInner = bvRaised
        Caption = 'SAIR'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = botao_sairClick
      end
      object btnConfere: TButton
        Left = 16
        Top = 12
        Width = 265
        Height = 25
        Cursor = crHandPoint
        Caption = 'Listar di'#225'rio de recebimentos - [F5]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnConfereClick
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 246
    Width = 600
    Height = 53
    Align = alTop
    Caption = 'Data dos contratos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object Label9: TLabel
      Left = 16
      Top = 30
      Width = 35
      Height = 13
      Caption = 'Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 160
      Top = 30
      Width = 28
      Height = 13
      Caption = 'Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtInicial5: TMaskEdit
      Left = 64
      Top = 22
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = edtInicial5Enter
      OnExit = edtInicial5Exit
      OnKeyDown = edtInicial5KeyDown
    end
    object edtFinal5: TMaskEdit
      Left = 192
      Top = 22
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = edtFinal5Enter
      OnExit = edtFinal5Exit
      OnKeyDown = edtFinal5KeyDown
    end
    object ch5: TCheckBox
      Left = 528
      Top = 23
      Width = 57
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ch5Click
      OnKeyDown = ch5KeyDown
    end
  end
  object chResumo: TCheckBox
    Left = 11
    Top = 309
    Width = 230
    Height = 17
    Cursor = crHandPoint
    Caption = 'Imprimir resumo no final do relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = chResumoClick
    OnExit = chResumoExit
  end
  object chSalto: TCheckBox
    Left = 11
    Top = 341
    Width = 214
    Height = 17
    Cursor = crHandPoint
    Caption = 'Saltar p'#225'gina a cada separa'#231#227'o'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 7
  end
  object rdOrdem: TRadioGroup
    Left = 255
    Top = 304
    Width = 329
    Height = 58
    Cursor = crHandPoint
    Caption = 'Ordenar presta'#231#245'es por'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Nome do cliente (verifica o cadastro do cliente)'
      'C'#243'digo do cliente'
      'C'#243'digo do contrato')
    ParentFont = False
    TabOrder = 8
  end
  object chSoResumo: TCheckBox
    Left = 11
    Top = 325
    Width = 222
    Height = 17
    Cursor = crHandPoint
    Caption = 'Imprimir somente o resumo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = chSoResumoClick
    OnExit = chSoResumoExit
  end
  object MainMenu1: TMainMenu
    Left = 540
    Top = 327
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Registrarbaixadodocumento1: TMenuItem
        Caption = 'Listar di'#225'rio de recebimentos'
        ShortCut = 116
        OnClick = Registrarbaixadodocumento1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
end
