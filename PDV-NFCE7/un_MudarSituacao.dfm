object frm_MudarSituacao: Tfrm_MudarSituacao
  Left = 134
  Top = 121
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 154
  ClientWidth = 479
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 110
    Height = 13
    Caption = 'C'#243'digo da situa'#231#227'o'
  end
  object Panel5: TPanel
    Left = 0
    Top = 113
    Width = 479
    Height = 41
    Align = alBottom
    Color = clSilver
    TabOrder = 0
    object botao_sair: TPanel
      Left = 360
      Top = 10
      Width = 108
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
    object btnMudarSituacao: TButton
      Left = 160
      Top = 10
      Width = 198
      Height = 23
      Cursor = crHandPoint
      Caption = 'Mudar situa'#231#227'o do caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnMudarSituacaoClick
    end
  end
  object edtSituacao: TMaskEdit
    Left = 16
    Top = 30
    Width = 47
    Height = 21
    EditMask = '!9;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 1
    ParentFont = False
    TabOrder = 1
    Text = ' '
    OnDblClick = edtSituacaoDblClick
    OnEnter = edtSituacaoEnter
    OnExit = edtSituacaoExit
    OnKeyDown = edtSituacaoKeyDown
  end
  object pnSituacao: TPanel
    Left = 66
    Top = 30
    Width = 335
    Height = 22
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clNavy
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 72
    Width = 479
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 3
    object Bevel8: TBevel
      Left = 263
      Top = 7
      Width = 211
      Height = 28
      Shape = bsFrame
    end
    object lbF8: TLabel
      Left = 15
      Top = 22
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
      Left = 41
      Top = 22
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
    object Label54: TLabel
      Left = 218
      Top = 13
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
    object Label56: TLabel
      Left = 279
      Top = 13
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
    object Label55: TLabel
      Left = 288
      Top = 13
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
    object Label2: TLabel
      Left = 15
      Top = 7
      Width = 26
      Height = 13
      Caption = 'F5->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel
      Left = 41
      Top = 7
      Width = 135
      Height = 13
      Caption = 'muda situa'#231#227'o do caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 448
    Top = 8
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Abrirsesso1: TMenuItem
        Caption = 'Mudar situa'#231#227'o do caixa'
        ShortCut = 116
        OnClick = Abrirsesso1Click
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
