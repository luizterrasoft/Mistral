object frm_Transf_Consulta: Tfrm_Transf_Consulta
  Left = -4
  Top = -4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 554
  ClientWidth = 800
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 715
    Top = 493
    Width = 59
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 469
    Width = 161
    Height = 13
    Caption = 'CTRL+L-> Limpar formul'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbtipz: TLabel
    Left = 658
    Top = 497
    Width = 22
    Height = 13
    Caption = 'Sr.1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LabelOO16: TLabelOO
    Left = 529
    Top = 466
    Width = 66
    Height = 13
    Caption = 'TOTAL >>>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BotaoSair1: TBotaoSair
    Left = 704
    Top = 514
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
  object grade: TDBGrid
    Left = 0
    Top = 55
    Width = 796
    Height = 405
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'IT_LOJ1'
        Title.Caption = 'Lj.O'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_TRAN'
        Title.Caption = 'N'#186' Doc.'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TR_LOJ2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Lj.D'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDATAEMBARQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Enviado'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDATACHEGADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Recebido'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 73
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'cCBARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'C'#243'digo de Barras'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'cDESCITEM'
        Title.Caption = 'Descri'#231#227'o do Item'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 241
        Visible = True
      end
      item
        Alignment = taRightJustify
        Color = clYellow
        Expanded = False
        FieldName = 'cQTDS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Saiu'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 42
        Visible = True
      end
      item
        Alignment = taRightJustify
        Color = clYellow
        Expanded = False
        FieldName = 'cQTDE'
        Title.Caption = 'Entrou'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 44
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'cSTATUS'
        Title.Caption = 'Situa'#231#227'o'
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDIVERG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = ' '
        Title.Color = clTeal
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 16
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 57
    Align = alTop
    Color = clTeal
    TabOrder = 2
    object filtro1: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 55
      Align = alClient
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LabelOO1: TLabelOO
        Left = 37
        Top = 36
        Width = 78
        Height = 13
        Caption = 'Data do envio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO2: TLabelOO
        Left = 48
        Top = 8
        Width = 195
        Height = 13
        Caption = 'Transfer'#234'ncias DESTINADAS '#224' loja:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO5: TLabelOO
        Left = 225
        Top = 37
        Width = 19
        Height = 13
        Caption = 'at'#233
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO14: TLabelOO
        Left = 638
        Top = 32
        Width = 133
        Height = 16
        Caption = '[F7] Alternar Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDataEmba1: TMaskEditOO
        Left = 119
        Top = 29
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        OnEnter = edtDataEmba1Enter
        OnKeyDown = edtDataEmba1KeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 10
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object botao2: TPanel
        Left = 354
        Top = 29
        Width = 125
        Height = 22
        Cursor = crHandPoint
        BevelInner = bvLowered
        Caption = 'Buscar - [F5]'
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = botao2Click
      end
      object edtLoja1: TMaskEditOO
        Left = 252
        Top = 3
        Width = 70
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
        OnDblClick = edtLoja1DblClick
        OnEnter = edtLoja1Enter
        OnExit = edtLoja1Exit
        OnKeyDown = edtLoja1KeyDown
        zFieldTypeOO = ftInteger
        zFieldLengthOO = 2
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object pnLoja1: TPanelOO
        Left = 324
        Top = 3
        Width = 445
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edtDataEmba12: TMaskEditOO
        Left = 250
        Top = 29
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '  /  /    '
        OnEnter = edtDataEmba12Enter
        OnKeyDown = edtDataEmba12KeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 10
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
    end
    object filtro2: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 55
      Align = alClient
      Color = clTeal
      TabOrder = 1
      Visible = False
      object LabelOO7: TLabelOO
        Left = 38
        Top = 36
        Width = 78
        Height = 13
        Caption = 'Data do envio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO8: TLabelOO
        Left = 56
        Top = 8
        Width = 187
        Height = 13
        Caption = 'Transfer'#234'ncias ENVIADAS da loja:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO9: TLabelOO
        Left = 225
        Top = 37
        Width = 19
        Height = 13
        Caption = 'at'#233
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO12: TLabelOO
        Left = 638
        Top = 32
        Width = 133
        Height = 16
        Caption = '[F7] Alternar Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDataEmba2: TMaskEditOO
        Left = 119
        Top = 29
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        OnEnter = edtDataEmba2Enter
        OnKeyDown = edtDataEmba2KeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 10
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object botao3: TPanel
        Left = 354
        Top = 29
        Width = 125
        Height = 22
        Cursor = crHandPoint
        BevelInner = bvLowered
        Caption = 'Buscar - [F5]'
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = botao2Click
      end
      object edtLoja2: TMaskEditOO
        Left = 251
        Top = 3
        Width = 70
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
        OnDblClick = edtLoja2DblClick
        OnEnter = edtLoja2Enter
        OnExit = edtLoja2Exit
        OnKeyDown = edtLoja2KeyDown
        zFieldTypeOO = ftInteger
        zFieldLengthOO = 2
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object pnLoja2: TPanelOO
        Left = 323
        Top = 3
        Width = 446
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edtDataEmba21: TMaskEditOO
        Left = 250
        Top = 29
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '  /  /    '
        OnEnter = edtDataEmba21Enter
        OnKeyDown = edtDataEmba21KeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 10
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
    end
    object filtro3: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 55
      Align = alClient
      Color = clTeal
      TabOrder = 2
      Visible = False
      object LabelOO10: TLabelOO
        Left = 33
        Top = 36
        Width = 82
        Height = 13
        Caption = 'Data do receb.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO11: TLabelOO
        Left = 26
        Top = 8
        Width = 218
        Height = 13
        Caption = 'Transfer'#234'ncias que CHEGARAM na loja:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO6: TLabelOO
        Left = 225
        Top = 37
        Width = 19
        Height = 13
        Caption = 'at'#233
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO15: TLabelOO
        Left = 638
        Top = 32
        Width = 133
        Height = 16
        Caption = '[F7] Alternar Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDataCheg1: TMaskEditOO
        Left = 119
        Top = 29
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        OnEnter = edtDataCheg1Enter
        OnKeyDown = edtDataCheg1KeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 10
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object botao4: TPanel
        Left = 354
        Top = 29
        Width = 125
        Height = 22
        Cursor = crHandPoint
        BevelInner = bvLowered
        Caption = 'Buscar - [F5]'
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = botao2Click
      end
      object edtLoja3: TMaskEditOO
        Left = 251
        Top = 3
        Width = 70
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
        OnDblClick = edtLoja3DblClick
        OnEnter = edtLoja3Enter
        OnExit = edtLoja3Exit
        OnKeyDown = edtLoja3KeyDown
        zFieldTypeOO = ftInteger
        zFieldLengthOO = 2
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object pnLoja3: TPanelOO
        Left = 323
        Top = 3
        Width = 446
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edtDataCheg12: TMaskEditOO
        Left = 250
        Top = 29
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '  /  /    '
        OnEnter = edtDataCheg12Enter
        OnKeyDown = edtDataCheg12KeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 10
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
    end
    object filtro4: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 55
      Align = alClient
      Color = clTeal
      TabOrder = 3
      Visible = False
      object LabelOO3: TLabelOO
        Left = 8
        Top = 12
        Width = 84
        Height = 13
        Caption = 'Loja de origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO4: TLabelOO
        Left = 8
        Top = 37
        Width = 81
        Height = 13
        Caption = 'N'#186' Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO13: TLabelOO
        Left = 638
        Top = 32
        Width = 133
        Height = 16
        Caption = '[F7] Alternar Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object botao5: TPanel
        Left = 169
        Top = 30
        Width = 125
        Height = 22
        Cursor = crHandPoint
        BevelInner = bvLowered
        Caption = 'Buscar - [F5]'
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = botao2Click
      end
      object edtLojaOrigem: TMaskEditOO
        Left = 97
        Top = 6
        Width = 40
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
        TabOrder = 1
        Text = '  '
        OnDblClick = edtLojaOrigemDblClick
        OnEnter = edtLojaOrigemEnter
        OnExit = edtLojaOrigemExit
        OnKeyDown = edtLojaOrigemKeyDown
        zFieldTypeOO = ftInteger
        zFieldLengthOO = 2
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object edtDocumento: TMaskEditOO
        Left = 96
        Top = 30
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        TabOrder = 2
        OnEnter = edtDocumentoEnter
        OnKeyDown = edtDocumentoKeyDown
        zFieldTypeOO = ftString
        zFieldLengthOO = 10
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object pnLojaOrigem: TPanelOO
        Left = 139
        Top = 6
        Width = 630
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object btnExcluiReferencia: TPanel
    Left = 8
    Top = 492
    Width = 204
    Height = 26
    Cursor = crHandPoint
    Hint = 'Exclui a refer'#234'ncia selecionada'
    BevelInner = bvLowered
    Caption = 'Excluir item - [DEL]'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnExcluiReferenciaClick
  end
  object btnImprimiSLIP: TPanel
    Left = 420
    Top = 521
    Width = 273
    Height = 26
    Cursor = crHandPoint
    Hint = 'Imprime o SLIP da transfer'#234'ncia selecionada na consulta'
    BevelInner = bvLowered
    Caption = 'Imprimir SLIP da transfer'#234'ncia - [CTRL+P]'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnImprimiSLIPClick
  end
  object btnImprimirTransfConsultadas: TPanel
    Left = 420
    Top = 492
    Width = 273
    Height = 26
    Cursor = crHandPoint
    Hint = 'Imprime todas as transfer'#234'ncias listadas na consulta'
    BevelInner = bvLowered
    Caption = 'Imprimir transfer'#234'ncias consultadas'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnImprimirTransfConsultadasClick
  end
  object btnExcluiDocumento: TPanel
    Left = 214
    Top = 492
    Width = 204
    Height = 26
    Cursor = crHandPoint
    Hint = 'Exclui o documento de transfer'#234'ncia inteiro'
    BevelInner = bvLowered
    Caption = 'Excluir documento - [CTRL+DEL]'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnExcluiDocumentoClick
  end
  object pnTotalEntradas: TPanelOO
    Left = 644
    Top = 463
    Width = 46
    Height = 21
    Alignment = taRightJustify
    BevelOuter = bvLowered
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object pnTotalSaidas: TPanelOO
    Left = 600
    Top = 463
    Width = 44
    Height = 21
    Alignment = taRightJustify
    BevelOuter = bvLowered
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object btnAcertaSaida: TPanel
    Left = 8
    Top = 521
    Width = 204
    Height = 26
    Cursor = crHandPoint
    Hint = 'Altera a quantidade de sa'#237'da da refer'#234'ncia'
    BevelInner = bvLowered
    Caption = 'Alterar Sa'#237'da - [CTRL+S]'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnAcertaSaidaClick
  end
  object btnAcertaEntrada: TPanel
    Left = 214
    Top = 521
    Width = 204
    Height = 26
    Cursor = crHandPoint
    Hint = 'Altera a quantidade de entrada '
    BevelInner = bvLowered
    Caption = 'Alterar Entrada - [CTRL+E]'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnAcertaEntradaClick
  end
  object MainMenu1: TMainMenu
    Left = 35
    Top = 98
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Buscaritensdatransferncia1: TMenuItem
        Caption = 'Buscar itens da transfer'#234'ncia'
        ShortCut = 116
        Visible = False
        OnClick = Buscaritensdatransferncia1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Imprimir1: TMenuItem
        Caption = 'Imprimir transfer'#234'ncias consultadas'
        OnClick = Imprimir1Click
      end
      object ImprimirSLIPdatransfernciaselecionada1: TMenuItem
        Caption = 'Imprimir SLIP'
        ShortCut = 16464
        OnClick = ImprimirSLIPdatransfernciaselecionada1Click
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
  object ds: TDataSource
    DataSet = qItens
    Left = 5
    Top = 98
  end
  object qItens: TQuery
    AfterOpen = qItensAfterOpen
    AfterClose = qItensAfterClose
    AfterScroll = qItensAfterScroll
    OnCalcFields = qItensCalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT *'
      'FROM ITENS_TRANSF_LOJA,TRANSF_LOJA'
      'WHERE (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME)'
      'ORDER BY TR_DATA,TR_NUME')
    Left = 65
    Top = 98
    object qItensIT_LOJ1: TFloatField
      FieldName = 'IT_LOJ1'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_LOJ1'
      DisplayFormat = '00'
    end
    object qItensIT_TRAN: TFloatField
      FieldName = 'IT_TRAN'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TRAN'
    end
    object qItensIT_TIPZ: TStringField
      FieldName = 'IT_TIPZ'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TIPZ'
      Size = 1
    end
    object qItensIT_GRUP: TFloatField
      FieldName = 'IT_GRUP'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_GRUP'
    end
    object qItensIT_SUBG: TFloatField
      FieldName = 'IT_SUBG'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_SUBG'
    end
    object qItensIT_PROD: TFloatField
      FieldName = 'IT_PROD'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_PROD'
    end
    object qItensIT_CORE: TFloatField
      FieldName = 'IT_CORE'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_CORE'
    end
    object qItensIT_OTAM: TIntegerField
      FieldName = 'IT_OTAM'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_OTAM'
    end
    object qItensIT_TAMA: TStringField
      FieldName = 'IT_TAMA'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TAMA'
      Size = 5
    end
    object qItensIT_QTDE: TFloatField
      FieldName = 'IT_QTDE'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_QTDE'
    end
    object qItensIT_MOV1: TFloatField
      FieldName = 'IT_MOV1'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_MOV1'
    end
    object qItensIT_MOV2: TFloatField
      FieldName = 'IT_MOV2'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_MOV2'
    end
    object qItensIT_DIGI: TDateTimeField
      FieldName = 'IT_DIGI'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_DIGI'
    end
    object qItensIT_EMBA: TDateTimeField
      FieldName = 'IT_EMBA'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_EMBA'
    end
    object qItensIT_CHEG: TDateTimeField
      FieldName = 'IT_CHEG'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_CHEG'
    end
    object qItensIT_STAT: TStringField
      FieldName = 'IT_STAT'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_STAT'
      Size = 1
    end
    object qItensIT_QTDS: TFloatField
      FieldName = 'IT_QTDS'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_QTDS'
    end
    object qItenscDESCITEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDESCITEM'
      Size = 60
      Calculated = True
    end
    object qItenscCBARRA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCBARRA'
      Calculated = True
    end
    object qItenscSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSTATUS'
      Calculated = True
    end
    object qItenscDATADIGITACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATADIGITACAO'
      Size = 10
      Calculated = True
    end
    object qItenscDATAEMBARQUE: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATAEMBARQUE'
      Size = 10
      Calculated = True
    end
    object qItenscDATACHEGADA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATACHEGADA'
      Size = 10
      Calculated = True
    end
    object qItensTR_LOJ1: TFloatField
      FieldName = 'TR_LOJ1'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      DisplayFormat = '00'
    end
    object qItensTR_NUME: TFloatField
      FieldName = 'TR_NUME'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
    end
    object qItensTR_DATA: TDateTimeField
      FieldName = 'TR_DATA'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
    end
    object qItensTR_LOJ2: TFloatField
      FieldName = 'TR_LOJ2'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      DisplayFormat = '00'
    end
    object qItensTR_STAT: TStringField
      FieldName = 'TR_STAT'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItensTR_ENVI: TStringField
      FieldName = 'TR_ENVI'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItensTR_ONLI: TStringField
      FieldName = 'TR_ONLI'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItensTR_TIPZ: TStringField
      FieldName = 'TR_TIPZ'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItenscQTDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'cQTDE'
      Size = 5
      Calculated = True
    end
    object qItenscQTDS: TStringField
      FieldKind = fkCalculated
      FieldName = 'cQTDS'
      Size = 5
      Calculated = True
    end
    object qItenscDIVERG: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDIVERG'
      Size = 1
      Calculated = True
    end
    object qItensIT_ACER: TStringField
      FieldName = 'IT_ACER'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_ACER'
      Size = 1
    end
  end
end
