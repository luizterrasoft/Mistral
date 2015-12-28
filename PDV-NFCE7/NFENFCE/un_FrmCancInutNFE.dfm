object frm_CancInutNFE: Tfrm_CancInutNFE
  Left = 328
  Top = 188
  Width = 630
  Height = 382
  Caption = 'NFE / NFCE - Cancelamento / Inutiliza'#231#227'o'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 344
    Align = alClient
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 32
      Width = 44
      Height = 16
      Caption = 'NDOC'
    end
    object lblNDOC: TLabel
      Left = 120
      Top = 32
      Width = 33
      Height = 16
      Caption = 'DOC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 40
      Top = 72
      Width = 49
      Height = 16
      Caption = 'ChNFE'
    end
    object lblChNFE: TLabel
      Left = 120
      Top = 72
      Width = 49
      Height = 16
      Caption = 'ChNFE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 40
      Top = 112
      Width = 47
      Height = 16
      Caption = 'Motivo'
    end
    object btnCancelar: TButton
      Left = 44
      Top = 272
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnSair: TButton
      Left = 464
      Top = 272
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object MXMOTIVO: TMemo
      Left = 120
      Top = 112
      Width = 473
      Height = 57
      Lines.Strings = (
        '')
      TabOrder = 2
    end
  end
end
