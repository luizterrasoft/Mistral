object frm_ImportaFTP_Crediario: Tfrm_ImportaFTP_Crediario
  Left = 110
  Top = 34
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Recepção de movimento - Via FTP'
  ClientHeight = 445
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
    Top = 326
    Width = 540
    Height = 26
    Align = alBottom
    ForeColor = clBlue
    Progress = 0
    Visible = False
  end
  object pnBRecebido: TPanel
    Left = 0
    Top = 352
    Width = 540
    Height = 23
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' ? bytes enviados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 375
    Width = 540
    Height = 27
    Align = alBottom
    Alignment = taLeftJustify
    Caption = '  Status da conexão de FTP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
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
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 402
    Width = 540
    Height = 43
    Align = alBottom
    Color = clNavy
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 0
    Top = 50
    Width = 540
    Height = 276
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
    Caption = ' Diretório inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
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
    Caption = ' Usuário:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
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
    Left = 480
    Top = 41
  end
  object timer: TTimer
    Enabled = False
    OnTimer = timerTimer
    Left = 448
    Top = 40
  end
end
