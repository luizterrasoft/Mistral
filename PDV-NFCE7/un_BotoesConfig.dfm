object frm_BotoesConfig: Tfrm_BotoesConfig
  Left = 380
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 249
  ClientWidth = 270
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 270
    Height = 249
    Align = alClient
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 47
    Top = 17
    Width = 165
    Height = 27
    Caption = 'Configura'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 50
    Top = 18
    Width = 165
    Height = 27
    Caption = 'Configura'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object botao1: TPanel
    Left = 10
    Top = 53
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  1. C'#243'digo da Loja'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = botao1Click
    OnMouseMove = botao1MouseMove
  end
  object botao2: TPanel
    Left = 10
    Top = 76
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  2. N'#250'mero do Terminal'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = botao2Click
    OnMouseMove = botao2MouseMove
  end
  object botao3: TPanel
    Left = 10
    Top = 100
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  3. C'#243'digo da ECF'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = botao3Click
    OnMouseMove = botao3MouseMove
  end
  object botao4: TPanel
    Left = 10
    Top = 124
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  4. Sequenciais de Venda'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = botao4Click
    OnMouseMove = botao4MouseMove
  end
  object botao5: TPanel
    Left = 10
    Top = 148
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  5. Senhas do Sistema'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = botao5Click
    OnMouseMove = botao5MouseMove
  end
  object botao6: TPanel
    Left = 10
    Top = 172
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  6. Diversas'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = botao6Click
    OnMouseMove = botao6MouseMove
  end
  object btnFechar: TPanel
    Left = 239
    Top = 5
    Width = 22
    Height = 16
    Cursor = crHandPoint
    Caption = 'X'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnFecharClick
  end
  object botao7: TPanel
    Left = 10
    Top = 196
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  7. Funcionamento do Sistema'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = botao7Click
    OnMouseMove = botao7MouseMove
  end
  object Botao8: TPanel
    Left = 9
    Top = 219
    Width = 253
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  8. Atualizar Banco de Dados'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = Botao8Click
    OnMouseMove = botao7MouseMove
  end
end
