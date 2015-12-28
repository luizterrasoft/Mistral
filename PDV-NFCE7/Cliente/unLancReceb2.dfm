object frm_LancReceb2: Tfrm_LancReceb2
  Left = 116
  Top = 19
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 456
  ClientWidth = 594
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = -8
    Top = 0
    Width = 602
    Height = 61
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 17
    Top = 16
    Width = 116
    Height = 13
    Caption = 'Loja do recebimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 65
    Width = 61
    Height = 13
    Caption = 'Num. Doc.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 162
    Top = 65
    Width = 18
    Height = 13
    Caption = 'DV'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 0
    Top = 59
    Width = 594
    Height = 276
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 14
    Top = 226
    Width = 119
    Height = 13
    Caption = 'Data de recebimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 144
    Top = 226
    Width = 62
    Height = 13
    Caption = 'Valor pago'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 281
    Top = 227
    Width = 115
    Height = 13
    Caption = 'Diferen'#231'a calculada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 271
    Width = 83
    Height = 13
    Caption = 'Valor corrigido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 86
    Top = 293
    Width = 53
    Height = 13
    Caption = 'Multa (%)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 87
    Top = 315
    Width = 52
    Height = 13
    Caption = 'Juros (%)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblFormaPgto: TLabel
    Left = 420
    Top = 226
    Width = 86
    Height = 13
    Caption = 'Forma de pgto.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LabelOO1: TLabelOO
    Left = 192
    Top = 85
    Width = 254
    Height = 13
    Caption = '[F8] - Consulta cliente/presta'#231#245'es em aberto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtLoja: TMaskEdit
    Left = 16
    Top = 33
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    Color = clTeal
    EditMask = '!99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = '  '
    OnDblClick = edtLojaDblClick
    OnEnter = edtLojaEnter
    OnExit = edtLojaExit
    OnKeyDown = edtLojaKeyDown
  end
  object pnLoja: TPanel
    Left = 67
    Top = 33
    Width = 506
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
    TabOrder = 1
  end
  object pnContrato: TPanel
    Left = 15
    Top = 80
    Width = 146
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label11: TLabel
      Left = 18
      Top = 7
      Width = 5
      Height = 16
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 63
      Top = 7
      Width = 5
      Height = 16
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 109
      Top = 7
      Width = 5
      Height = 16
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodLoja: TMaskEdit
      Left = 1
      Top = 5
      Width = 18
      Height = 21
      BorderStyle = bsNone
      EditMask = '!99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '  '
      OnChange = edtCodLojaChange
      OnEnter = edtCodLojaEnter
      OnExit = edtCodLojaExit
      OnKeyDown = edtCodLojaKeyDown
    end
    object edtCodCli: TMaskEdit
      Left = 21
      Top = 5
      Width = 43
      Height = 21
      BorderStyle = bsNone
      EditMask = '!999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 1
      Text = '      '
      OnChange = edtCodCliChange
      OnEnter = edtCodCliEnter
      OnKeyDown = edtCodCliKeyDown
    end
    object edtCodCont: TMaskEdit
      Left = 67
      Top = 5
      Width = 43
      Height = 21
      BorderStyle = bsNone
      EditMask = '!999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 2
      Text = '      '
      OnChange = edtCodContChange
      OnEnter = edtCodContEnter
      OnKeyDown = edtCodContKeyDown
    end
    object edtNPre: TMaskEdit
      Left = 115
      Top = 5
      Width = 26
      Height = 21
      BorderStyle = bsNone
      EditMask = '!99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 3
      Text = '  '
      OnEnter = edtNPreEnter
      OnExit = edtNPreExit
      OnKeyDown = edtNPreKeyDown
    end
  end
  object edtDV: TMaskEdit
    Left = 163
    Top = 80
    Width = 23
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!9;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 1
    ParentFont = False
    TabOrder = 3
    Text = ' '
    OnEnter = edtDVEnter
    OnKeyDown = edtDVKeyDown
  end
  object Memo2: TMemo
    Left = -1
    Top = 104
    Width = 594
    Height = 113
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object edtDatPgto: TMaskEdit
    Left = 15
    Top = 240
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    EditMask = '99/99/9999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = '  /  /    '
    OnEnter = edtDatPgtoEnter
    OnExit = edtDatPgtoExit
    OnKeyDown = edtDatPgtoKeyDown
  end
  object edtValor: TMaskEdit
    Left = 144
    Top = 240
    Width = 135
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnEnter = edtValorEnter
    OnExit = edtValorExit
    OnKeyDown = edtValorKeyDown
    OnKeyUp = edtValorKeyUp
  end
  object pnDif: TPanel
    Left = 280
    Top = 240
    Width = 138
    Height = 21
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object Panel3: TPanel
    Left = 0
    Top = 360
    Width = 594
    Height = 96
    Align = alBottom
    BevelInner = bvLowered
    Color = clTeal
    TabOrder = 8
    object Bevel8: TBevel
      Left = 307
      Top = 10
      Width = 184
      Height = 26
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 283
      Top = 19
      Width = 20
      Height = 13
      Caption = 'Ctrl'
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
      Left = 547
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
      Width = 170
      Height = 13
      Caption = 'Registrar baixa do documento'
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
      Width = 590
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
      object btnBaixar: TButton
        Left = 283
        Top = 12
        Width = 185
        Height = 25
        Cursor = crHandPoint
        Caption = 'Baixar a presta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnBaixarClick
      end
      object btnLimpar: TButton
        Left = 53
        Top = 12
        Width = 185
        Height = 25
        Cursor = crHandPoint
        Caption = 'Limpar formul'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnLimparClick
      end
    end
  end
  object pnCorrigido: TPanel
    Left = 144
    Top = 261
    Width = 134
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object pnMulta: TPanel
    Left = 144
    Top = 284
    Width = 134
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object pnJuros: TPanel
    Left = 144
    Top = 307
    Width = 134
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object StatusBar1: TStatusBar
    Left = 1
    Top = 333
    Width = 593
    Height = 27
    Align = alNone
    Color = clTeal
    Panels = <
      item
        Alignment = taCenter
        Width = 50
      end>
    SimplePanel = False
  end
  object edtFormaPgto: TMaskEdit
    Left = 420
    Top = 240
    Width = 36
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 13
    Text = '  '
    Visible = False
    OnDblClick = edtFormaPgtoDblClick
    OnEnter = edtFormaPgtoEnter
    OnExit = edtFormaPgtoExit
    OnKeyDown = edtFormaPgtoKeyDown
  end
  object pnFormaPgto: TPanel
    Left = 458
    Top = 240
    Width = 131
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
    TabOrder = 14
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 553
    Top = 10
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Registrarbaixadodocumento1: TMenuItem
        Caption = 'Registrar baixa do documento'
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
