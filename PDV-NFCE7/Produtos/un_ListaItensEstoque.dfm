object frm_ListaItensEstoque: Tfrm_ListaItensEstoque
  Left = 90
  Top = 9
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Listagem de itens de estoque'
  ClientHeight = 509
  ClientWidth = 602
  Color = clBtnFace
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
  PixelsPerInch = 96
  TextHeight = 13
  object gbFornecedores: TGroupBox
    Left = 0
    Top = 0
    Width = 602
    Height = 70
    Align = alTop
    Caption = 'Loja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label5: TLabel
      Left = 24
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Inicial'
    end
    object Label6: TLabel
      Left = 24
      Top = 47
      Width = 28
      Height = 13
      Caption = 'Final'
    end
    object ch1: TCheckBox
      Left = 528
      Top = 40
      Width = 65
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos'
      TabOrder = 0
      OnClick = ch1Click
      OnKeyDown = ch1KeyDown
    end
    object edtInicial1: TMaskEdit
      Left = 70
      Top = 16
      Width = 107
      Height = 21
      EditMask = '!99;1; '
      MaxLength = 2
      TabOrder = 1
      Text = '  '
      OnDblClick = edtInicial1DblClick
      OnEnter = edtInicial1Enter
      OnExit = edtInicial1Exit
      OnKeyDown = edtInicial1KeyDown
    end
    object pnLoja1: TPanel
      Left = 184
      Top = 16
      Width = 329
      Height = 24
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object edtFinal1: TMaskEdit
      Left = 70
      Top = 39
      Width = 107
      Height = 21
      EditMask = '!99;1; '
      MaxLength = 2
      TabOrder = 3
      Text = '  '
      OnDblClick = edtFinal1DblClick
      OnEnter = edtFinal1Enter
      OnExit = edtFinal1Exit
      OnKeyDown = edtFinal1KeyDown
    end
    object pnLoja2: TPanel
      Left = 184
      Top = 39
      Width = 329
      Height = 24
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 413
    Width = 602
    Height = 96
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 1
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
      Left = 508
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
      Left = 543
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
      Width = 94
      Height = 13
      Caption = 'Imprime listagem'
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
      Width = 163
      Height = 13
      Caption = 'exibe entidades cadastradas'
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
      Width = 598
      Height = 49
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
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
        Width = 161
        Height = 25
        Cursor = crHandPoint
        Caption = 'Listar relatório'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 70
    Width = 602
    Height = 70
    Align = alTop
    Caption = 'Grupos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Inicial'
    end
    object Label2: TLabel
      Left = 24
      Top = 47
      Width = 28
      Height = 13
      Caption = 'Final'
    end
    object ch2: TCheckBox
      Left = 528
      Top = 40
      Width = 65
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos'
      TabOrder = 0
      OnClick = ch2Click
      OnKeyDown = ch2KeyDown
    end
    object edtInicial2: TMaskEdit
      Left = 70
      Top = 16
      Width = 107
      Height = 21
      EditMask = '!999;1; '
      MaxLength = 3
      TabOrder = 1
      Text = '   '
      OnDblClick = edtInicial2DblClick
      OnEnter = edtInicial2Enter
      OnExit = edtInicial2Exit
      OnKeyDown = edtInicial2KeyDown
    end
    object pnGrupo1: TPanel
      Left = 184
      Top = 16
      Width = 329
      Height = 24
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object edtFinal2: TMaskEdit
      Left = 70
      Top = 39
      Width = 107
      Height = 21
      EditMask = '!999;1; '
      MaxLength = 3
      TabOrder = 3
      Text = '   '
      OnDblClick = edtFinal2DblClick
      OnEnter = edtFinal2Enter
      OnExit = edtFinal2Exit
      OnKeyDown = edtFinal2KeyDown
    end
    object pnGrupo2: TPanel
      Left = 184
      Top = 39
      Width = 329
      Height = 24
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 140
    Width = 602
    Height = 47
    Align = alTop
    Caption = 'Subgrupos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Inicial'
    end
    object Label4: TLabel
      Left = 184
      Top = 23
      Width = 28
      Height = 13
      Caption = 'Final'
    end
    object ch3: TCheckBox
      Left = 528
      Top = 24
      Width = 65
      Height = 17
      Cursor = crHandPoint
      Caption = 'Todos'
      TabOrder = 0
      OnClick = ch3Click
      OnKeyDown = ch3KeyDown
    end
    object edtInicial3: TMaskEdit
      Left = 70
      Top = 16
      Width = 107
      Height = 21
      EditMask = '!999;1; '
      MaxLength = 3
      TabOrder = 1
      Text = '   '
      OnDblClick = edtInicial3DblClick
      OnEnter = edtInicial3Enter
      OnKeyDown = edtInicial3KeyDown
    end
    object edtFinal3: TMaskEdit
      Left = 222
      Top = 15
      Width = 107
      Height = 21
      EditMask = '!999;1; '
      MaxLength = 3
      TabOrder = 2
      Text = '   '
      OnDblClick = edtFinal3DblClick
      OnEnter = edtFinal3Enter
      OnKeyDown = edtFinal3KeyDown
    end
  end
  object chSalto: TCheckBox
    Left = 8
    Top = 192
    Width = 217
    Height = 17
    Caption = 'Saltar página a cada separação'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 4
  end
  object MainMenu1: TMainMenu
    Left = 560
    Top = 16
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formulário'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Confirmarttulo1: TMenuItem
        Caption = 'Imprimir listagem'
        ShortCut = 116
        OnClick = Confirmarttulo1Click
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
end
