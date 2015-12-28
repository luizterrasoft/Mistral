object frm_ExibeSessao: Tfrm_ExibeSessao
  Left = 135
  Top = 63
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sessão ativa'
  ClientHeight = 310
  ClientWidth = 484
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 228
    Width = 484
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 0
  end
  object Panel5: TPanel
    Left = 0
    Top = 269
    Width = 484
    Height = 41
    Align = alBottom
    Color = clSilver
    TabOrder = 1
    object botao_sair: TPanel
      Left = 200
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
  end
  object Memo1: TMemo
    Left = 14
    Top = 24
    Width = 451
    Height = 177
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
