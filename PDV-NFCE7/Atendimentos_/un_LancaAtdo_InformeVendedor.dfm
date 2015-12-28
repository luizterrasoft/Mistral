inherited frm_LancaAtdo_InformeVendedor: Tfrm_LancaAtdo_InformeVendedor
  Left = 198
  Top = 132
  BorderStyle = bsNone
  Caption = 'Troca de Vendedor para realizar atendimento'
  ClientHeight = 234
  ClientWidth = 389
  Color = clTeal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Image2: TImage [0]
    Left = 0
    Top = 0
    Width = 389
    Height = 36
  end
  object LabelOO1: TLabelOO [1]
    Left = 21
    Top = 49
    Width = 170
    Height = 13
    Caption = 'Informe o c'#243'digo do Vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 18
    Top = 91
    Width = 94
    Height = 13
    Caption = 'Senha de acesso'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO [3]
    Left = 308
    Top = 149
    Width = 62
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO3: TLabelOO [4]
    Left = 12
    Top = 149
    Width = 170
    Height = 13
    Caption = 'CTRL + L -> Limpar formul'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel [5]
    Left = 9
    Top = 139
    Width = 372
    Height = 9
    Shape = bsTopLine
  end
  object Label3: TLabel [6]
    Left = 121
    Top = 10
    Width = 153
    Height = 18
    Caption = '[Troca de Vendedor]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel [7]
    Left = 120
    Top = 8
    Width = 153
    Height = 18
    Caption = '[Troca de Vendedor]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel4: TBevel [8]
    Left = 0
    Top = 0
    Width = 389
    Height = 234
    Align = alClient
    Shape = bsFrame
  end
  inherited Panel3: TPanel
    Top = 234
    Width = 389
    Height = 0
    TabOrder = 2
    inherited Panel4: TPanel
      Top = -51
      Width = 385
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 308
    Top = 65
    TabOrder = 3
  end
  inherited edteditformulario1: TEdit
    Left = 316
    Top = 59
    TabOrder = 4
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 324
    Top = 53
    TabOrder = 5
  end
  inherited CheckBox1: TCheckBox
    Left = 336
    Top = 45
    TabOrder = 6
  end
  object pnVend: TPanelOO [14]
    Left = 93
    Top = 64
    Width = 289
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
    TabOrder = 7
  end
  object edtCodigo: TMaskEditOO [15]
    Left = 19
    Top = 64
    Width = 72
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
    TabOrder = 0
    Text = '      '
    OnDblClick = edtCodigoDblClick
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
    OnKeyDown = edtCodigoKeyDown
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 6
    zTipoOO = -1
    zTipoPesquisaF8 = False
  end
  object btnConfirmar: TPanel [16]
    Left = 122
    Top = 180
    Width = 173
    Height = 22
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = ' Confirmar - [F5]'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnConfirmarClick
  end
  object edtSenha: TMaskEdit [17]
    Left = 18
    Top = 105
    Width = 112
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 6
    ParentFont = False
    PasswordChar = 'X'
    TabOrder = 1
    OnEnter = edtSenhaEnter
    OnKeyDown = edtSenhaKeyDown
  end
  object btnSairSemSelecionar: TPanel [18]
    Left = 10
    Top = 204
    Width = 285
    Height = 22
    Cursor = crHandPoint
    BevelInner = bvLowered
    Caption = 'Sair sem selecionar Vendedor '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnSairSemSelecionarClick
  end
  object Panel1: TPanel [19]
    Left = 304
    Top = 203
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
    TabOrder = 10
    OnClick = botao_sairClick
  end
  inherited MainMenu1: TMainMenu
    Left = 144
    Top = 105
    inherited Principal1: TMenuItem
      Visible = False
      inherited N1: TMenuItem
        Caption = 'Confirmar vendedor'
        ShortCut = 116
        OnClick = N1Click
      end
    end
  end
end
