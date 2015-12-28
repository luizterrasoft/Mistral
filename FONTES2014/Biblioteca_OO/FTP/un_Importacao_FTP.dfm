object frm_ImportaFTP: Tfrm_ImportaFTP
  Left = 124
  Top = 38
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importa'#231#227'o de movimento - Via FTP'
  ClientHeight = 294
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 175
    Width = 540
    Height = 26
    Align = alBottom
    ForeColor = clBlue
    Progress = 0
    Visible = False
  end
  object pnBRecebido: TPanel
    Left = 0
    Top = 201
    Width = 540
    Height = 23
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' ? bytes enviados'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 224
    Width = 540
    Height = 27
    Align = alBottom
    Alignment = taLeftJustify
    Caption = '  Status da conex'#227'o de FTP'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object pnStatus: TPanel
      Left = 170
      Top = 4
      Width = 103
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 251
    Width = 540
    Height = 43
    Align = alBottom
    Color = clTeal
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 0
    Top = 50
    Width = 540
    Height = 125
    Align = alClient
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object pnDiretorioInicial: TPanel
    Left = 0
    Top = 34
    Width = 540
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = ' Diret'#243'rio inicial:'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object pnUsuarioFtp: TPanel
    Left = 0
    Top = 18
    Width = 540
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = ' Usu'#225'rio:'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object pnServidorFtp: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 18
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = ' Host:'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object NMFTP1: TNMFTP
    Port = 21
    ReportLevel = 0
    OnPacketRecvd = NMFTP1PacketRecvd
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = False
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 506
    Top = 54
  end
  object timer: TTimer
    Enabled = False
    OnTimer = timerTimer
    Left = 476
    Top = 54
  end
end
