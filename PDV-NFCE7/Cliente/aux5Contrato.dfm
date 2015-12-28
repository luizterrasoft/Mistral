inherited frm_Aux5Contrato: Tfrm_Aux5Contrato
  Left = 53
  Top = 133
  Caption = 'Outras observa'#231#245'es'
  ClientHeight = 131
  ClientWidth = 677
  Color = clTeal
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 7
    Top = 12
    Width = 666
    Height = 80
    Shape = bsFrame
  end
  object Label1: TLabel [1]
    Left = 592
    Top = 105
    Width = 66
    Height = 13
    Caption = 'ESC -> Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 113
    Width = 162
    Height = 13
    Caption = 'CTRL+L -> Limpar formul'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 97
    Width = 163
    Height = 13
    Caption = 'F5 -> Confirmar observa'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel3: TPanel
    Top = 131
    Width = 677
    Height = 0
    TabOrder = 5
    inherited Panel4: TPanel
      Top = -51
      Width = 673
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 412
    Top = 65
    TabOrder = 6
  end
  inherited edteditformulario1: TEdit
    Left = 420
    Top = 59
    TabOrder = 7
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 428
    Top = 53
    TabOrder = 8
  end
  inherited CheckBox1: TCheckBox
    Left = 440
    Top = 32
    TabOrder = 9
  end
  object edtObs1: TMaskEdit [9]
    Left = 8
    Top = 14
    Width = 663
    Height = 15
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 80
    ParentFont = False
    TabOrder = 0
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtObs1KeyDown
  end
  object edtObs2: TMaskEdit [10]
    Left = 8
    Top = 29
    Width = 663
    Height = 15
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 80
    ParentFont = False
    TabOrder = 1
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtmaskeditformulario1KeyDown
  end
  object edtObs3: TMaskEdit [11]
    Left = 8
    Top = 44
    Width = 663
    Height = 15
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 80
    ParentFont = False
    TabOrder = 2
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtmaskeditformulario1KeyDown
  end
  object edtObs4: TMaskEdit [12]
    Left = 8
    Top = 59
    Width = 663
    Height = 15
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 80
    ParentFont = False
    TabOrder = 3
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtmaskeditformulario1KeyDown
  end
  object edtObs5: TMaskEdit [13]
    Left = 8
    Top = 74
    Width = 663
    Height = 15
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 80
    ParentFont = False
    TabOrder = 4
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtObs5KeyDown
  end
  object btnOk: TBitBtn [14]
    Left = 264
    Top = 99
    Width = 138
    Height = 26
    Cursor = crHandPoint
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = btnOkClick
    Glyph.Data = {
      B6040000424DB604000000000000360000002800000017000000100000000100
      18000000000080040000C40E0000C40E00000000000000000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600
      0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6840000840000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6CED3D6840000008200008200840000CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D68400000082000082000082000082008400
      00CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600
      0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6840000008200008200008200
      008200008200008200840000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D684000000820000
      820000820000FF00008200008200008200008200840000CED3D6CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3
      D600820000820000820000FF00CED3D600FF00008200008200008200840000CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D600FF0000820000FF00CED3D6CED3D6CED3D600FF000082
      00008200008200840000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600
      0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600FF00CED3D6CED3D6CED3D6
      CED3D6CED3D600FF00008200008200008200840000CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D600FF00008200008200008200840000
      CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600FF0000
      8200008200008200840000CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D600FF00008200008200008200840000CED3D6CED3D6CED3D600
      0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600FF000082000082000082008400
      00CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600FF00
      008200008200840000CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D600FF00008200008200CED3D6CED3D6000000}
  end
  inherited MainMenu1: TMainMenu
    Left = 18
    Top = 20
    inherited Principal1: TMenuItem
      Visible = False
      inherited N1: TMenuItem
        Caption = 'Salvar'
        ShortCut = 116
        OnClick = N1Click
      end
    end
  end
end
