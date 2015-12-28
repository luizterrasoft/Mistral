object frm_edtEstoqueLoja: Tfrm_edtEstoqueLoja
  Left = 22
  Top = 7
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONSULTAR ESTOQUE'
  ClientHeight = 511
  ClientWidth = 746
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
  object gbLoja: TPanel
    Left = 0
    Top = 38
    Width = 746
    Height = 100
    Align = alTop
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label34: TLabel
      Left = 14
      Top = 57
      Width = 20
      Height = 13
      Caption = 'Cor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 11
      Top = 75
      Width = 25
      Height = 13
      Caption = 'Tam'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnLocalizar: TSpeedButton
      Left = 171
      Top = 74
      Width = 159
      Height = 26
      Cursor = crHandPoint
      Hint = 'Localiza os itens especificados pelo critério de busca'
      Caption = 'Localizar itens '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        B6070000424DB60700000000000036000000280000001A000000180000000100
        18000000000080070000C40E0000C40E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000
        0000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF7F0000FF0000FFFF00FF0000000000BFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000FF0000FFFF00FFFF00FF
        0000000000BFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        7F0000FF0000FFFF00FFFF00FF0000FF0000000000BFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF7F0000FF0000FFFF00FFFF00FF0000FF000000
        0000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000FF0000
        FFFF00FFFF00FF0000FF0000000000BFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF7F0000FF0000FFFF00FFFF00FF0000FF0000000000BFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFFFFFFFFFFF00
        FF0000FF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000000000000000000000000000
        007F7F7FBFBFBFFFFFFFBFBFBF7F7F7FFF0000000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000007F
        7F007F7F007F7F007F7F007F7F007F7F00000000000000BFBFBF7F7F7F7F7F7F
        000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F007F7F000000007F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F007F7F00000000000000
        000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBF7F7F7FFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
        00FFFFFFFFFF007F7F00000000BFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBF7F7F7FFFFF00FFFFFFFFFF00FFFFFFFF
        FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF007F7F00000000
        BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        7F7F7FFFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
        00FFFFFFFFFF00FFFFFF7F7F00000000BFBFBF000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF00FFFFFFFFFF007F7F00000000
        BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        7F7F7FFFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
        00FFFFFFFFFF00FFFFFF7F7F00000000BFBFBF000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF00FFFFFFFFFF007F7F00000000
        BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBF7F7F7FFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
        00FFFFFFFFFF00FFFFFF000000FFFFFFBFBFBF000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF00FFFFFF7F7F00000000FFFFFF
        BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBF7F7F7FFFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
        00FFFFFF7F7F00000000FFFFFFFFFFFFBFBFBF000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7FFF
        FFFFFFFFFFFFFF00FFFFFFFFFF00FFFFFF000000000000FFFFFFFFFFFFFFFFFF
        BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
        00BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnLocalizarClick
    end
    object Label3: TLabel
      Left = 405
      Top = 57
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCor: TMaskEdit
      Left = 40
      Top = 49
      Width = 41
      Height = 21
      EditMask = '!99;1; '
      MaxLength = 2
      TabOrder = 0
      Text = '  '
      OnChange = edtCorChange
      OnDblClick = edtCorDblClick
      OnEnter = edtCorEnter
      OnExit = edtCorExit
      OnKeyDown = edtCorKeyDown
    end
    object pnCor: TPanel
      Left = 80
      Top = 49
      Width = 321
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 3
    end
    object edtFaixaTam: TMaskEdit
      Left = 40
      Top = 71
      Width = 129
      Height = 21
      MaxLength = 5
      TabOrder = 1
      OnChange = edtFaixaTamChange
      OnDblClick = edtFaixaTamDblClick
      OnEnter = edtFaixaTamEnter
      OnExit = edtFaixaTamExit
      OnKeyDown = edtFaixaTamKeyDown
    end
    object pnProduto: TPanel
      Left = 269
      Top = 24
      Width = 407
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnLocal1: TPanel
      Left = 37
      Top = 9
      Width = 232
      Height = 42
      Color = clTeal
      TabOrder = 4
      Visible = False
      object Label14: TLabel
        Left = 3
        Top = 4
        Width = 35
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 69
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Subgrupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 135
        Top = 4
        Width = 75
        Height = 13
        Caption = 'Cód. Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtGrupo: TMaskEdit
        Left = 3
        Top = 17
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        EditMask = '!999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        Text = '   '
        OnChange = edtGrupoChange
        OnDblClick = edtGrupoDblClick
        OnEnter = edtGrupoEnter
        OnExit = edtGrupoExit
        OnKeyDown = edtGrupoKeyDown
      end
      object edtSubGrupo: TMaskEdit
        Left = 69
        Top = 17
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        EditMask = '!999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 1
        Text = '   '
        OnChange = edtSubGrupoChange
        OnDblClick = edtSubGrupoDblClick
        OnEnter = edtSubGrupoEnter
        OnExit = edtSubGrupoExit
        OnKeyDown = edtSubGrupoKeyDown
      end
      object edtCodigo: TMaskEdit
        Left = 135
        Top = 17
        Width = 92
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
        TabOrder = 2
        Text = '      '
        OnChange = edtCodigoChange
        OnDblClick = edtCodigoDblClick
        OnEnter = edtCodigoEnter
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
      end
    end
    object pnLocal2: TPanel
      Left = 271
      Top = 9
      Width = 159
      Height = 42
      Color = clTeal
      TabOrder = 5
      Visible = False
      object Label18: TLabel
        Left = 3
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Ref. Interna'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRefInt: TMaskEdit
        Left = 3
        Top = 17
        Width = 150
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 12
        ParentFont = False
        TabOrder = 0
        OnEnter = edtRefIntEnter
        OnKeyDown = edtRefIntKeyDown
      end
    end
    object pnUnidade: TPanel
      Left = 457
      Top = 48
      Width = 76
      Height = 22
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 404
    Width = 746
    Height = 107
    Align = alBottom
    BevelInner = bvLowered
    Color = clNavy
    TabOrder = 1
    object Bevel1: TBevel
      Left = 9
      Top = 8
      Width = 392
      Height = 42
      Shape = bsFrame
    end
    object Bevel8: TBevel
      Left = 464
      Top = 8
      Width = 177
      Height = 43
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 416
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
      Left = 485
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
      Left = 477
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
    object Label4: TLabel
      Left = 23
      Top = 17
      Width = 26
      Height = 13
      Caption = 'F3->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 47
      Top = 17
      Width = 36
      Height = 13
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 121
      Top = 17
      Width = 39
      Height = 13
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 95
      Top = 17
      Width = 26
      Height = 13
      Caption = 'F4->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 655
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
    object Label11: TLabel
      Left = 689
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
    object Label12: TLabel
      Left = 526
      Top = 17
      Width = 14
      Height = 13
      Caption = 'Im'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 540
      Top = 17
      Width = 9
      Height = 13
      Caption = '&P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 550
      Top = 17
      Width = 24
      Height = 13
      Caption = 'rimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbF8: TLabel
      Left = 23
      Top = 33
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
    object lbF8Mens: TLabel
      Left = 49
      Top = 33
      Width = 146
      Height = 13
      Caption = 'exibe grupos cadastrados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 183
      Top = 17
      Width = 26
      Height = 13
      Caption = 'F7->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 209
      Top = 17
      Width = 174
      Height = 13
      Caption = 'Alterna localização do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 56
      Top = 56
      Width = 23
      Height = 22
    end
    object Label8: TLabel
      Left = 477
      Top = 32
      Width = 9
      Height = 13
      Caption = '&A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 485
      Top = 33
      Width = 30
      Height = 13
      Caption = 'lterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 2
      Top = 56
      Width = 742
      Height = 49
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object btnInserir: TSpeedButton
        Left = 9
        Top = 5
        Width = 112
        Height = 20
        Cursor = crHandPoint
        Hint = 'Inserir item'
        Caption = 'Inserir item (F3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnInserirClick
      end
      object btnAlterar: TSpeedButton
        Left = 9
        Top = 26
        Width = 112
        Height = 19
        Cursor = crHandPoint
        Hint = 'Alterar item'
        Caption = '&Alterar item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAlterarClick
      end
      object btnExcluir: TSpeedButton
        Left = 124
        Top = 5
        Width = 111
        Height = 20
        Cursor = crHandPoint
        Hint = 'Excluir item'
        Caption = 'Excluir item (F4)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnExcluirClick
      end
      object SpeedButton4: TSpeedButton
        Left = 124
        Top = 26
        Width = 111
        Height = 19
        Cursor = crHandPoint
        Hint = 'Listar movimento do item'
        Caption = '&Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton4Click
      end
      object Bevel3: TBevel
        Left = 240
        Top = 5
        Width = 10
        Height = 42
        Shape = bsLeftLine
      end
      object btnEntrada: TSpeedButton
        Left = 251
        Top = 5
        Width = 127
        Height = 20
        Cursor = crHandPoint
        Hint = 'Lançar outras entradas'
        Caption = 'Lançar &Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEntradaClick
      end
      object SpeedButton2: TSpeedButton
        Left = 251
        Top = 26
        Width = 127
        Height = 20
        Cursor = crHandPoint
        Hint = 'Lançar outras saídas'
        Caption = 'Lançar &Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object btnEditarMovimento: TSpeedButton
        Left = 381
        Top = 5
        Width = 127
        Height = 20
        Cursor = crHandPoint
        Hint = 'Lançar outras entradas'
        Caption = 'Editar movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEditarMovimentoClick
      end
      object botao_sair: TPanel
        Left = 647
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
    end
  end
  object grade: TDBGrid
    Left = 0
    Top = 138
    Width = 746
    Height = 266
    Cursor = crHandPoint
    Hint = 'Tecle ENTER para ver dados do item'
    Align = alClient
    DataSource = ds1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = gradeDblClick
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'EL_LOJA'
        Title.Caption = 'Loja'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cor'
        Title.Caption = 'Cor'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cTam'
        Title.Caption = 'Tamanho'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDesc'
        Title.Caption = 'Descricao'
        Width = 485
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_QTD1'
        Title.Caption = 'Saldo (qtde)'
        Width = 90
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 38
    Align = alTop
    Color = clTeal
    TabOrder = 3
    object Label33: TLabel
      Left = 15
      Top = 20
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
    object edtLoja: TMaskEdit
      Left = 42
      Top = 12
      Width = 41
      Height = 21
      EditMask = '!99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '  '
      OnChange = edtLojaChange
      OnDblClick = edtLojaDblClick
      OnEnter = edtLojaEnter
      OnExit = edtLojaExit
      OnKeyDown = edtLojaKeyDown
    end
    object pnLoja: TPanel
      Left = 82
      Top = 12
      Width = 321
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 180
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparcadastro1: TMenuItem
        Caption = 'Limpar formulário'
        ShortCut = 16460
        OnClick = Limparcadastro1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Inseriritemdeestoque1: TMenuItem
        Caption = 'Inserir item de estoque'
        ShortCut = 114
        OnClick = Inseriritemdeestoque1Click
      end
      object Alterardadosdeumitemdeestoque1: TMenuItem
        Caption = 'Alterar dados de um item de estoque'
        ShortCut = 16449
        OnClick = Alterardadosdeumitemdeestoque1Click
      end
      object Excluiritem1: TMenuItem
        Caption = 'Excluir item'
        ShortCut = 115
        OnClick = Excluiritem1Click
      end
      object Veritemdeestoque1: TMenuItem
        Caption = 'Ver item de estoque'
        OnClick = Veritemdeestoque1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Lanarentrada1: TMenuItem
        Caption = 'Lançar entrada'
        ShortCut = 16453
        OnClick = Lanarentrada1Click
      end
      object Lanarsada1: TMenuItem
        Caption = 'Lançar saída'
        ShortCut = 16467
        OnClick = Lanarsada1Click
      end
      object Revisarsaldodoitem1: TMenuItem
        Caption = 'Revisão de saldo'
        object Todosositens1: TMenuItem
          Caption = 'Todos os itens'
          OnClick = Todosositens1Click
        end
        object Itemselecionado1: TMenuItem
          Caption = 'Item selecionado'
          OnClick = Itemselecionado1Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Extratodemovimentodoitem1: TMenuItem
        Caption = 'Movimento do item'
        ShortCut = 16461
        OnClick = Extratodemovimentodoitem1Click
      end
      object Editarmovimentodoitem1: TMenuItem
        Caption = 'Editar movimento do item'
        OnClick = Editarmovimentodoitem1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Imprimirplanos1: TMenuItem
        Caption = 'Imprimir itens exibidos'
        ShortCut = 16464
        OnClick = Imprimirplanos1Click
      end
      object Outrasconsultas1: TMenuItem
        Caption = 'Outras consultas'
        ShortCut = 16463
        OnClick = Outrasconsultas1Click
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
  object ds1: TDataSource
    DataSet = qEstoque
    Left = 4
    Top = 180
  end
  object qEstoque: TQuery
    OnCalcFields = qEstoqueCalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT *'
      'FROM ESTOQUE_LOJA')
    Left = 34
    Top = 180
    object qEstoqueloja: TStringField
      FieldKind = fkCalculated
      FieldName = 'loja'
      Calculated = True
    end
    object qEstoquecor: TStringField
      FieldKind = fkCalculated
      FieldName = 'cor'
      Calculated = True
    end
    object qEstoquecTam: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTam'
      Size = 10
      Calculated = True
    end
    object qEstoqueEL_GRUP: TFloatField
      FieldName = 'EL_GRUP'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_GRUP'
    end
    object qEstoqueEL_SUBG: TFloatField
      FieldName = 'EL_SUBG'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_SUBG'
    end
    object qEstoqueEL_PROD: TFloatField
      FieldName = 'EL_PROD'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PROD'
    end
    object qEstoqueEL_CORE: TFloatField
      FieldName = 'EL_CORE'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_CORE'
    end
    object qEstoqueEL_TAMA: TStringField
      FieldName = 'EL_TAMA'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_TAMA'
      Size = 5
    end
    object qEstoqueEL_LOJA: TFloatField
      FieldName = 'EL_LOJA'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_LOJA'
    end
    object qEstoqueEL_PVE1: TFloatField
      FieldName = 'EL_PVE1'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PVE1'
    end
    object qEstoqueEL_PVE2: TFloatField
      FieldName = 'EL_PVE2'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PVE2'
    end
    object qEstoqueEL_PCU1: TFloatField
      FieldName = 'EL_PCU1'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PCU1'
    end
    object qEstoqueEL_PCU2: TFloatField
      FieldName = 'EL_PCU2'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PCU2'
    end
    object qEstoqueEL_QTD1: TFloatField
      FieldName = 'EL_QTD1'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_QTD1'
    end
    object qEstoqueEL_QTD2: TFloatField
      FieldName = 'EL_QTD2'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_QTD2'
    end
    object qEstoquecDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDesc'
      Size = 60
      Calculated = True
    end
    object qEstoquepvenda1: TStringField
      FieldKind = fkCalculated
      FieldName = 'pvenda1'
      Calculated = True
    end
    object qEstoquepcusto1: TStringField
      FieldKind = fkCalculated
      FieldName = 'pcusto1'
      Calculated = True
    end
    object qEstoquepvenda2: TStringField
      FieldKind = fkCalculated
      FieldName = 'pvenda2'
      Calculated = True
    end
    object qEstoquepcusto2: TStringField
      FieldKind = fkCalculated
      FieldName = 'pcusto2'
      Calculated = True
    end
  end
end
