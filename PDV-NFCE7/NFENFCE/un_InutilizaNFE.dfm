object Frm_InutilizaNFE: TFrm_InutilizaNFE
  Left = 394
  Top = 184
  Width = 563
  Height = 384
  Caption = 'NFE / NFCE -  INUTILIZA'#199#195'O DE NOTA '
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
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
    Width = 547
    Height = 346
    Align = alClient
    Color = clTeal
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 48
      Width = 32
      Height = 13
      Caption = 'CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 49
      Height = 13
      Caption = 'MOTIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 144
      Width = 27
      Height = 13
      Caption = 'ANO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 328
      Top = 152
      Width = 30
      Height = 13
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 208
      Width = 75
      Height = 13
      Caption = 'N.Doc Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 256
      Top = 208
      Width = 68
      Height = 13
      Caption = 'N.Doc Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCNPJ: TLabel
      Left = 72
      Top = 48
      Width = 57
      Height = 16
      Caption = 'lblCNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblANO: TLabel
      Left = 72
      Top = 144
      Width = 33
      Height = 16
      Caption = '2015'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtNSerie: TEdit
      Left = 384
      Top = 144
      Width = 25
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object edtNInicial: TEdit
      Left = 96
      Top = 204
      Width = 49
      Height = 21
      TabOrder = 1
    end
    object edtNFinal: TEdit
      Left = 328
      Top = 208
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object MXMotivo2: TMemo
      Left = 72
      Top = 80
      Width = 465
      Height = 49
      TabOrder = 3
    end
    object rdgMODELO: TRadioGroup
      Left = 152
      Top = 136
      Width = 129
      Height = 41
      Caption = 'Modelo'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'NFE'
        'NFCE')
      ParentFont = False
      TabOrder = 4
    end
    object btnInutilizar: TButton
      Left = 72
      Top = 288
      Width = 75
      Height = 25
      Caption = 'Inutilizar'
      TabOrder = 5
      OnClick = btnInutilizarClick
    end
    object btnSair: TButton
      Left = 296
      Top = 288
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 6
      OnClick = btnSairClick
    end
  end
end
