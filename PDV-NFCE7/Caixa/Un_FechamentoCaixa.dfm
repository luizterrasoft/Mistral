object Frm_FechamentoCaixa: TFrm_FechamentoCaixa
  Left = 197
  Top = 119
  BorderStyle = bsSingle
  Caption = 'Confer'#234'ncia do Caixa'
  ClientHeight = 223
  ClientWidth = 382
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 382
    Height = 223
    ActivePage = TabSheet2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      TabVisible = False
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 374
        Height = 213
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object lbGerenteSupervisor: TLabelOO
        Left = 18
        Top = 54
        Width = 151
        Height = 13
        Caption = 'Gerente: FULANO DE TAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCaixa: TLabelOO
        Left = 18
        Top = 70
        Width = 125
        Height = 16
        Caption = 'Caixa: VERONICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 25
        Top = 98
        Width = 319
        Height = 3
      end
      object Bevel1: TBevel
        Left = 25
        Top = 172
        Width = 319
        Height = 3
      end
      object lbltitulo_sombra: TLabel
        Left = 19
        Top = 11
        Width = 186
        Height = 18
        Caption = '[Encerramento do Caixa]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbltitulo: TLabel
        Left = 20
        Top = 9
        Width = 186
        Height = 18
        Caption = '[Encerramento do Caixa]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Image2: TImage
        Left = 3
        Top = 3
        Width = 332
        Height = 35
      end
      object Label1: TLabel
        Left = 283
        Top = 180
        Width = 68
        Height = 16
        Caption = 'ESC-> sair'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbtipz: TLabel
        Left = 222
        Top = 204
        Width = 40
        Height = 16
        Caption = 'Sr.:1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object rdTipo: TRadioGroup
        Left = 314
        Top = -11
        Width = 30
        Height = 50
        Cursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          ' '
          ' ')
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object botaoEncerramento: TPanel
        Left = 75
        Top = 140
        Width = 222
        Height = 24
        Cursor = crHandPoint
        BevelInner = bvLowered
        Caption = 'Encerrar - [F5]'
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = botaoEncerramentoClick
      end
      object botaoConferencia: TPanel
        Left = 75
        Top = 111
        Width = 222
        Height = 24
        Cursor = crHandPoint
        BevelInner = bvLowered
        Caption = 'Confer'#234'ncia'
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = botaoConferenciaClick
      end
      object BotaoSair1: TBotaoSair
        Left = 279
        Top = 199
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
        TabOrder = 3
        OnClick = BotaoSair1Click
      end
      object chtodoscaixas: TCheckBox
        Left = 24
        Top = 184
        Width = 177
        Height = 17
        Caption = 'Consolidar todos os caixas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      TabVisible = False
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 25
        Height = 13
        Caption = 'Loja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 81
        Width = 32
        Height = 13
        Caption = 'Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 238
        Top = 177
        Width = 33
        Height = 16
        Caption = 'Sr.: 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Bevel4: TBevel
        Left = 9
        Top = 124
        Width = 352
        Height = 2
      end
      object Bevel5: TBevel
        Left = 9
        Top = 164
        Width = 352
        Height = 3
      end
      object Label7: TLabel
        Left = 9
        Top = 1
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 87
        Top = 22
        Width = 8
        Height = 13
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 80
        Top = 135
        Width = 222
        Height = 24
        Cursor = crHandPoint
        BevelInner = bvLowered
        Caption = 'Confer'#234'ncia - [F5]'
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Panel1Click
      end
      object BotaoSair2: TBotaoSair
        Left = 283
        Top = 175
        Width = 80
        Height = 22
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
        TabOrder = 1
        OnClick = BotaoSair2Click
      end
      object PanelControle2: TPanelControle
        Left = 88
        Top = 94
        Width = 272
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object chtodoscaixas1: TCheckBox
        Left = 9
        Top = 173
        Width = 177
        Height = 17
        Caption = 'Consolidar todos os caixas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = chtodoscaixas1Click
      end
      object Caixa: TEdit
        Left = 5
        Top = 94
        Width = 75
        Height = 21
        TabOrder = 4
        OnExit = CaixaExit
        OnKeyDown = CaixaKeyDown
      end
      object Data: TMaskEditOO
        Left = 8
        Top = 14
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 5
        Text = '  /  /    '
        OnKeyDown = DataKeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 0
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object Data2: TMaskEditOO
        Left = 100
        Top = 14
        Width = 74
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 6
        Text = '  /  /    '
        OnKeyDown = Data2KeyDown
        zFieldTypeOO = ftDateTime
        zFieldLengthOO = 0
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object edtDescLoja: TEdit
        Left = 88
        Top = 54
        Width = 273
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object chExibeData: TCheckBox
        Left = 9
        Top = 192
        Width = 177
        Height = 17
        Caption = 'Exibir data dos credi'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = chtodoscaixas1Click
      end
    end
  end
  object Loja: TEdit
    Left = 10
    Top = 60
    Width = 75
    Height = 21
    TabOrder = 1
    OnExit = LojaExit
    OnKeyDown = LojaKeyDown
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 80
    object Principal2: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Conferncia1: TMenuItem
        Caption = 'Confer'#234'ncia'
        OnClick = Conferncia1Click
      end
      object N1: TMenuItem
        Caption = 'Encerramento'
        ShortCut = 116
        OnClick = N1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
end
