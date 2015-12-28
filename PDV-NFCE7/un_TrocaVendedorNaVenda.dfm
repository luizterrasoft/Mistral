inherited frm_TrocaVendedorNaVenda: Tfrm_TrocaVendedorNaVenda
  Left = 171
  Top = 187
  ActiveControl = edtNovoVendedor
  Caption = 'Troca de vendedor na venda'
  ClientHeight = 175
  ClientWidth = 421
  Color = clTeal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object LabelOO2: TLabelOO [0]
    Left = 16
    Top = 23
    Width = 103
    Height = 13
    Caption = 'Vendedor anterior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO5: TLabelOO [1]
    Left = 34
    Top = 47
    Width = 85
    Height = 13
    Caption = 'Novo vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel [2]
    Left = 11
    Top = 76
    Width = 401
    Height = 9
    Shape = bsTopLine
  end
  object Label3: TLabel [3]
    Left = 16
    Top = 88
    Width = 144
    Height = 13
    Caption = 'F5-> Trocar vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [4]
    Left = 16
    Top = 102
    Width = 184
    Height = 13
    Caption = 'CTRL+L-> Limpar formul'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [5]
    Left = 326
    Top = 113
    Width = 69
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO6: TLabelOO [6]
    Left = 228
    Top = 46
    Width = 154
    Height = 13
    Caption = '(F8 -> Consultar vendedor)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel3: TPanel
    Top = 175
    Width = 421
    Height = 0
    inherited Panel4: TPanel
      Top = -51
      Width = 417
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 396
    Top = 101
  end
  inherited edteditformulario1: TEdit
    Left = 404
    Top = 95
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 412
    Top = 89
  end
  inherited CheckBox1: TCheckBox
    Left = 424
    Top = 84
  end
  object BotaoSair1: TBotaoSair [12]
    Left = 320
    Top = 134
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
    TabOrder = 5
    OnClick = BotaoSair1Click
  end
  object pnVend: TPanelOO [13]
    Left = 128
    Top = 15
    Width = 282
    Height = 20
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object edtNovoVendedor: TMaskEditOO [14]
    Left = 128
    Top = 39
    Width = 91
    Height = 21
    Cursor = crHandPoint
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnDblClick = edtNovoVendedorDblClick
    OnEnter = edtNovoVendedorEnter
    OnKeyDown = edtNovoVendedorKeyDown
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 6
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object botao2: TPanel [15]
    Left = 64
    Top = 135
    Width = 254
    Height = 23
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = 'Efetuar troca - [F5]'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = botao2Click
  end
  inherited MainMenu1: TMainMenu
    Left = 250
    Top = 70
    inherited Principal1: TMenuItem
      Visible = False
      inherited N1: TMenuItem
        Caption = 'Trocar vendedor'
        ShortCut = 116
        OnClick = N1Click
      end
    end
  end
end
