object FrmMensPisca: TFrmMensPisca
  Left = 180
  Top = 245
  BorderStyle = bsDialog
  Caption = 'Mensagem'
  ClientHeight = 38
  ClientWidth = 405
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Mensagem: TPiscaLabel
    Left = 16
    Top = 8
    Width = 379
    Height = 16
    Caption = 'Ativando Gerenciador Padrão aguarde um momento...'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
end
