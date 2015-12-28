object frm_sangria: Tfrm_sangria
  Left = 131
  Top = 69
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sangria/Reprovisionamento'
  ClientHeight = 347
  ClientWidth = 480
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 10
    Width = 98
    Height = 13
    Caption = 'Dados da sessão'
  end
  object Label3: TLabel
    Left = 13
    Top = 189
    Width = 203
    Height = 13
    Caption = 'Valor (sangria/reprovisionamento) $'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 82
    Top = 231
    Width = 60
    Height = 13
    Caption = 'Tipo (E/S)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 186
    Top = 231
    Width = 141
    Height = 13
    Caption = '(E-> Entrada; S-> Saída)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel5: TPanel
    Left = 0
    Top = 306
    Width = 480
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
    object btnFecharSessao: TButton
      Left = 200
      Top = 10
      Width = 158
      Height = 23
      Cursor = crHandPoint
      Caption = 'Abrir gaveta (F5)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharSessaoClick
    end
  end
  object Memo1: TMemo
    Left = 14
    Top = 24
    Width = 451
    Height = 153
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edtValor: TMaskEdit
    Left = 13
    Top = 202
    Width = 169
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = edtValorEnter
    OnExit = edtValorExit
    OnKeyDown = edtValorKeyDown
    OnKeyUp = edtValorKeyUp
  end
  object edtTipo: TMaskEdit
    Left = 144
    Top = 224
    Width = 38
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!c;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 1
    ParentFont = False
    TabOrder = 3
    Text = ' '
    OnEnter = edtTipoEnter
    OnKeyDown = edtTipoKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 265
    Width = 480
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 4
    object Bevel8: TBevel
      Left = 263
      Top = 7
      Width = 211
      Height = 28
      Shape = bsFrame
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
    object Label4: TLabel
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
    object Label5: TLabel
      Left = 41
      Top = 7
      Width = 69
      Height = 13
      Caption = 'abre gaveta'
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
    Left = 447
    Top = 6
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formulário'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Abrirsesso1: TMenuItem
        Caption = 'Abrir gaveta'
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
