object frmSenhaConfirmacao: TfrmSenhaConfirmacao
  Left = 232
  Top = 178
  Width = 325
  Height = 169
  ActiveControl = edtusuario
  Caption = 'Confirmar Venda'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 6
    Width = 309
    Height = 127
  end
  object Label1: TLabel
    Left = 80
    Top = 47
    Width = 37
    Height = 13
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 80
    Top = 10
    Width = 44
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCancel: TBitBtn
    Left = 160
    Top = 91
    Width = 107
    Height = 25
    Cursor = crHandPoint
    Cancel = True
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnOk: TBitBtn
    Left = 40
    Top = 91
    Width = 107
    Height = 26
    Cursor = crHandPoint
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
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
  object edtSenha: TMaskEdit
    Left = 80
    Top = 62
    Width = 145
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    PasswordChar = 'X'
    TabOrder = 2
    OnKeyDown = edtSenhaKeyDown
  end
  object edtusuario: TMaskEdit
    Left = 80
    Top = 24
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 3
    OnKeyDown = edtusuarioKeyDown
  end
end