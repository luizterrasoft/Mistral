object frm_Transf_Lancamento_Salvar: Tfrm_Transf_Lancamento_Salvar
  Left = 164
  Top = 99
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Transfer'#234'ncia'
  ClientHeight = 269
  ClientWidth = 384
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 384
    Height = 269
    Align = alClient
    Shape = bsFrame
  end
  object LabelOO1: TLabelOO
    Left = 8
    Top = 132
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
  object LabelOO2: TLabelOO
    Left = 8
    Top = 172
    Width = 88
    Height = 13
    Caption = 'Loja de destino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbTipz: TLabelOO
    Left = 344
    Top = 48
    Width = 24
    Height = 13
    Caption = 'Sr.1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label1: TLabel
    Left = 10
    Top = 74
    Width = 120
    Height = 13
    Caption = 'F7-> Alternar op'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BotaoSair1: TBotaoSair
    Left = 294
    Top = 232
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
    TabOrder = 0
    OnClick = BotaoSair1Click
  end
  object edtNumero: TMaskEditOO
    Left = 8
    Top = 146
    Width = 93
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!9999999999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '          '
    OnEnter = edtNumeroEnter
    OnKeyDown = edtNumeroKeyDown
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 10
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object edtLojaDestino: TMaskEditOO
    Left = 8
    Top = 186
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 2
    Text = '  '
    OnDblClick = edtLojaDestinoDblClick
    OnEnter = edtLojaDestinoEnter
    OnExit = edtLojaDestinoExit
    OnKeyDown = edtLojaDestinoKeyDown
    zFieldTypeOO = ftFloat
    zFieldLengthOO = 2
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object pnLojaDestino: TPanelOO
    Left = 59
    Top = 186
    Width = 315
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
    TabOrder = 3
  end
  object botao2: TPanel
    Left = 118
    Top = 232
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
    TabOrder = 4
    OnClick = botao2Click
  end
  object panel1: TPanel
    Left = 8
    Top = 94
    Width = 371
    Height = 33
    Alignment = taLeftJustify
    Caption = ' Loja origem:'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object edtLojaOrigem: TMaskEditOO
      Left = 94
      Top = 6
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      Color = clTeal
      EditMask = '!999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      Text = '   '
      OnDblClick = edtLojaOrigemDblClick
      OnEnter = edtLojaOrigemEnter
      OnExit = edtLojaOrigemExit
      OnKeyDown = edtLojaOrigemKeyDown
      zFieldTypeOO = ftInteger
      zFieldLengthOO = 2
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object pnLojaOrigem: TPanelOO
      Left = 145
      Top = 6
      Width = 216
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
      TabOrder = 1
    end
  end
  object rdOpcao: TRadioGroup
    Left = 7
    Top = 6
    Width = 371
    Height = 62
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'SA'#205'DA'
      'ENTRADA - OFF LINE')
    ParentFont = False
    TabOrder = 6
    OnClick = rdOpcaoClick
  end
  object MainMenu1: TMainMenu
    Left = 178
    Top = 120
    object Principal1: TMenuItem
      Caption = 'Principal'
      object mniNovaTransferncia1: TMenuItem
        Caption = 'Nova Transfer'#234'ncia'
        ShortCut = 114
        OnClick = mniNovaTransferncia1Click
      end
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Confirmarsalvamento1: TMenuItem
        Caption = 'Salvar'
        ShortCut = 116
        OnClick = Confirmarsalvamento1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
  object qVerifConf: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT * FROM CONF')
    Left = 336
    Top = 144
  end
end
