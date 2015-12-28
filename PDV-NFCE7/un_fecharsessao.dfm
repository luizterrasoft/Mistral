object frm_FecharSessao: Tfrm_FecharSessao
  Left = 133
  Top = 59
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechar sessão do caixa'
  ClientHeight = 309
  ClientWidth = 481
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
  object Label2: TLabel
    Left = 12
    Top = 196
    Width = 177
    Height = 13
    Caption = 'Hora de fechamento da sessão'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel5: TPanel
    Left = 0
    Top = 268
    Width = 481
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
      Caption = 'Fechar sessão (F5)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharSessaoClick
    end
    object btnLeituraX: TButton
      Left = 40
      Top = 10
      Width = 158
      Height = 23
      Cursor = crHandPoint
      Caption = 'Redução Z Impressora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnLeituraXClick
    end
  end
  object Memo1: TMemo
    Left = 14
    Top = 24
    Width = 451
    Height = 153
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edtHoraFechamento: TMaskEdit
    Left = 195
    Top = 188
    Width = 91
    Height = 21
    EditMask = '!99\:99;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 2
    Text = '  :  '
    OnEnter = edtHoraFechamentoEnter
    OnKeyDown = edtHoraFechamentoKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 227
    Width = 481
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
    object Label3: TLabel
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
    object Label4: TLabel
      Left = 41
      Top = 7
      Width = 76
      Height = 13
      Caption = 'fecha sessão'
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
    Left = 431
    Top = 30
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formulário'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object EmitirReduoZdaImpressoraFiscal1: TMenuItem
        Caption = 'Emitir Redução Z da Impressora Fiscal'
        OnClick = EmitirReduoZdaImpressoraFiscal1Click
      end
      object Abrirsesso1: TMenuItem
        Caption = 'Fechar sessão'
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
