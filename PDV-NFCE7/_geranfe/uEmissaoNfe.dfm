object frmEmissaoNfe: TfrmEmissaoNfe
  Left = 13
  Top = 9
  Width = 1040
  Height = 616
  Caption = 'Emiss'#227'o de Nf-e'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grboxInfVend: TGroupBox
    Left = 0
    Top = 0
    Width = 1024
    Height = 484
    Align = alClient
    Caption = 'Informa'#231#245'es da Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object pnVendas: TPanel
      Left = 8
      Top = 16
      Width = 1073
      Height = 121
      TabOrder = 1
      object lblnvenda: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 16
        Caption = 'N'#186' da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblCliente: TLabel
        Left = 48
        Top = 32
        Width = 32
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ldlDtEmissao: TLabel
        Left = 32
        Top = 60
        Width = 39
        Height = 13
        Caption = 'Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblDtSaida: TLabel
        Left = 264
        Top = 60
        Width = 29
        Height = 13
        Caption = 'Sa'#237'da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblCodigo: TLabel
        Left = 848
        Top = 68
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPedCompra: TLabel
        Left = 512
        Top = 68
        Width = 87
        Height = 13
        Caption = 'Pedido de Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblCidade: TLabel
        Left = 872
        Top = 40
        Width = 58
        Height = 13
        Caption = 'Cidade / UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblCnpjCpf: TLabel
        Left = 544
        Top = 40
        Width = 58
        Height = 13
        Caption = 'CNPJ / CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblSerinalNFe: TLabel
        Left = 544
        Top = 16
        Width = 52
        Height = 13
        Caption = 'Serial NF-e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblNnoFiscal: TLabel
        Left = 272
        Top = 8
        Width = 68
        Height = 13
        Caption = 'N'#186' Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton4: TSpeedButton
        Left = 216
        Top = 60
        Width = 23
        Height = 22
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000C30E0000C30E00000000000000000000A0A0A0A0A0A0
          A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
          A0A0A0A0A0A0A0A0A0A0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000F0F0F0F0F0F0F0F0F08080808080808080808080808080808080
          80808080808080808080808080808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000F0F0F0F0F0F000000000000080000000000080000080
          0000000000800000000000000000800000808080F0F0F0F0F0F0A0A0A0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080F0F0F0F0F0F0A0A0
          A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFF0000000000
          00000000FFFFFF000000000000000000C0C0C0FFFFFF800000808080F0F0F0F0
          F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFFF
          FFFF000000FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0000000FFFFFF800000808080
          F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0
          FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF8000
          00808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0
          F0F0F0F0FFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000C0C0C0FF
          FFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000F0F0F0F0F0F0FFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000F0F0F0F0F0F0FFFFFFFFFFFF000000FFFFFFFFFFFF0000000000
          00000000000000FFFFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFC0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF800000808080F0F0F0F0F0F0A0A0
          A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F00000000000000000
          00000000000000000000000000000000000000000000F0F0F0F0F0F0F0F0F0F0
          F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000B3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3
          ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      end
      object SpeedButton5: TSpeedButton
        Left = 432
        Top = 60
        Width = 23
        Height = 22
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000C30E0000C30E00000000000000000000A0A0A0A0A0A0
          A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
          A0A0A0A0A0A0A0A0A0A0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000F0F0F0F0F0F0F0F0F08080808080808080808080808080808080
          80808080808080808080808080808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000F0F0F0F0F0F000000000000080000000000080000080
          0000000000800000000000000000800000808080F0F0F0F0F0F0A0A0A0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080F0F0F0F0F0F0A0A0
          A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFF0000000000
          00000000FFFFFF000000000000000000C0C0C0FFFFFF800000808080F0F0F0F0
          F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFFF
          FFFF000000FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0000000FFFFFF800000808080
          F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0
          FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF8000
          00808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0
          F0F0F0F0FFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000C0C0C0FF
          FFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000F0F0F0F0F0F0FFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000F0F0F0F0F0F0FFFFFFFFFFFF000000FFFFFFFFFFFF0000000000
          00000000000000FFFFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080F0F0F0F0F0F0A0A0A0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0FFFFFFC0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF800000808080F0F0F0F0F0F0A0A0
          A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F00000000000000000
          00000000000000000000000000000000000000000000F0F0F0F0F0F0F0F0F0F0
          F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000B3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3
          ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABB3ADABFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      end
      object edtNotFiscal: TEdit
        Left = 368
        Top = 8
        Width = 129
        Height = 21
        TabOrder = 0
        OnEnter = edtNotFiscalEnter
      end
      object edtSerialNFe: TEdit
        Left = 616
        Top = 8
        Width = 441
        Height = 21
        TabOrder = 1
      end
      object edtCliente: TEdit
        Left = 88
        Top = 32
        Width = 409
        Height = 21
        TabOrder = 2
      end
      object edtCnpjCpf: TEdit
        Left = 616
        Top = 40
        Width = 241
        Height = 21
        TabOrder = 3
      end
      object edtCidade: TEdit
        Left = 944
        Top = 40
        Width = 113
        Height = 21
        TabOrder = 4
      end
      object edtEmisao: TEdit
        Left = 88
        Top = 60
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edtSaida: TEdit
        Left = 304
        Top = 60
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object edtPedCompra: TEdit
        Left = 616
        Top = 68
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object edtCodigo: TEdit
        Left = 936
        Top = 68
        Width = 121
        Height = 21
        TabOrder = 8
      end
    end
    object edtNvenda: TEdit
      Left = 96
      Top = 22
      Width = 121
      Height = 21
      HideSelection = False
      TabOrder = 0
      OnEnter = edtNvendaEnter
      OnKeyDown = edtNvendaKeyDown
      OnKeyPress = edtNvendaKeyPress
    end
    object gruImpTotal: TGroupBox
      Left = 8
      Top = 137
      Width = 1073
      Height = 105
      Caption = 'Impostos e Totalizadores (F12 Editar)'
      TabOrder = 2
      object Label3: TLabel
        Left = 144
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Label3'
      end
      object lblSeguro: TLabel
        Left = 480
        Top = 48
        Width = 34
        Height = 13
        Caption = 'Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblVlIcms: TLabel
        Left = 264
        Top = 24
        Width = 53
        Height = 13
        Caption = 'Valor ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblVlFrete: TLabel
        Left = 264
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Valor Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblIcms: TLabel
        Left = 16
        Top = 24
        Width = 106
        Height = 13
        Caption = 'Base de Calculo ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblOutros: TLabel
        Left = 696
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Outros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblIcmsSub: TLabel
        Left = 640
        Top = 24
        Width = 75
        Height = 13
        Caption = 'Valor ICMS Sub'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTotNota: TLabel
        Left = 656
        Top = 72
        Width = 79
        Height = 13
        Caption = 'Total da Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVlIcmsSub: TLabel
        Left = 432
        Top = 24
        Width = 75
        Height = 13
        Caption = 'Base ICMS Sub'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblVlIpi: TLabel
        Left = 856
        Top = 24
        Width = 40
        Height = 13
        Caption = 'Valor IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTotProd: TLabel
        Left = 56
        Top = 48
        Width = 69
        Height = 13
        Caption = 'Total Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbllVlrDesc: TLabel
        Left = 24
        Top = 72
        Width = 88
        Height = 13
        Caption = 'Valor do Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edtBcIcms: TEdit
        Left = 152
        Top = 24
        Width = 97
        Height = 21
        TabOrder = 0
      end
      object edtTotProd: TEdit
        Left = 152
        Top = 48
        Width = 97
        Height = 21
        TabOrder = 1
      end
      object edtVlDesc: TEdit
        Left = 152
        Top = 72
        Width = 97
        Height = 21
        TabOrder = 2
      end
      object edtVlIcms: TEdit
        Left = 328
        Top = 24
        Width = 89
        Height = 21
        TabOrder = 3
      end
      object edtVlFrete: TEdit
        Left = 328
        Top = 48
        Width = 89
        Height = 21
        TabOrder = 4
      end
      object edtBIcmsSub: TEdit
        Left = 528
        Top = 24
        Width = 89
        Height = 21
        TabOrder = 5
      end
      object edtSeguro: TEdit
        Left = 528
        Top = 48
        Width = 89
        Height = 21
        TabOrder = 6
      end
      object edtVIcmsSub: TEdit
        Left = 736
        Top = 24
        Width = 97
        Height = 21
        TabOrder = 7
      end
      object edtOutros: TEdit
        Left = 736
        Top = 48
        Width = 97
        Height = 21
        TabOrder = 8
      end
      object edtTotNota: TEdit
        Left = 736
        Top = 72
        Width = 97
        Height = 21
        TabOrder = 9
      end
      object edtVlIpi: TEdit
        Left = 912
        Top = 24
        Width = 97
        Height = 21
        TabOrder = 10
      end
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 248
      Width = 1071
      Height = 360
      ActivePage = TabSheet1
      TabOrder = 3
      object TabSheet1: TTabSheet
        Caption = 'F9- Situa'#231#227'o Trubut'#225'ria, Transporte e Mensagem da Nota'
        object gruTipeTribNota: TGroupBox
          Left = 0
          Top = 1
          Width = 1056
          Height = 168
          Caption = 'Tipo e Tributa'#231#227'o da Nota Fiscal'
          TabOrder = 0
          object lblNfSaida: TLabel
            Left = 328
            Top = 24
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblNfEntrada: TLabel
            Left = 496
            Top = 24
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblCfop: TLabel
            Left = 56
            Top = 40
            Width = 28
            Height = 13
            Caption = 'CFOP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblCsosn: TLabel
            Left = 48
            Top = 72
            Width = 37
            Height = 13
            Caption = 'CSOSN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblSitIpi: TLabel
            Left = 32
            Top = 96
            Width = 58
            Height = 13
            Caption = 'Situa'#231#227'o IPI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblSitPis: TLabel
            Left = 32
            Top = 120
            Width = 62
            Height = 13
            Caption = 'Situa'#231#227'o PIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblSitCofins: TLabel
            Left = 8
            Top = 144
            Width = 84
            Height = 13
            Caption = 'Situa'#231#227'o COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblDescCfop: TLabel
            Left = 168
            Top = 48
            Width = 13
            Height = 13
            Caption = '...'
          end
          object lblDescCsosn: TLabel
            Left = 168
            Top = 72
            Width = 13
            Height = 13
            Caption = '...'
          end
          object lblDescSitIpi: TLabel
            Left = 168
            Top = 96
            Width = 13
            Height = 13
            Caption = '...'
          end
          object lblDescSitPis: TLabel
            Left = 168
            Top = 120
            Width = 13
            Height = 13
            Caption = '...'
          end
          object lblDescSitCofins: TLabel
            Left = 168
            Top = 144
            Width = 13
            Height = 13
            Caption = '...'
          end
          object edtCfop: TEdit
            Left = 104
            Top = 40
            Width = 57
            Height = 21
            TabOrder = 0
          end
          object edtCsosn: TEdit
            Left = 104
            Top = 64
            Width = 57
            Height = 21
            TabOrder = 1
          end
          object edtSitIpi: TEdit
            Left = 104
            Top = 88
            Width = 57
            Height = 21
            TabOrder = 2
          end
          object edtSitPis: TEdit
            Left = 104
            Top = 112
            Width = 57
            Height = 21
            TabOrder = 3
          end
          object edtSitCofins: TEdit
            Left = 104
            Top = 136
            Width = 57
            Height = 21
            TabOrder = 4
          end
          object rdgTpNota: TRadioGroup
            Left = 304
            Top = 8
            Width = 369
            Height = 33
            Columns = 2
            Items.Strings = (
              '1- Nota Fiscal de Sa'#237'da'
              '0- Nota Fiscal de Entrada')
            TabOrder = 5
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 284
          Width = 1073
          Height = 43
          Caption = 'Informa'#231#245'es Adicionais'
          TabOrder = 1
          object EdtInfoAdicionais: TEdit
            Left = 8
            Top = 16
            Width = 1055
            Height = 21
            TabOrder = 0
            Text = '...'
          end
        end
        object GroupBox1: TGroupBox
          Left = 2
          Top = 174
          Width = 1054
          Height = 107
          Caption = 'Transportadora'
          TabOrder = 2
          object lblTransportadora: TLabel
            Left = 8
            Top = 24
            Width = 72
            Height = 13
            Caption = 'Transportadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblMarca: TLabel
            Left = 48
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Marca'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblEspecie: TLabel
            Left = 584
            Top = 24
            Width = 38
            Height = 13
            Caption = 'Esp'#233'cie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblQtdeVolume: TLabel
            Left = 733
            Top = 24
            Width = 58
            Height = 13
            Caption = 'Qtd. Volume'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblPbruto: TLabel
            Left = 272
            Top = 56
            Width = 52
            Height = 13
            Caption = 'Peso Bruto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblPliquido: TLabel
            Left = 432
            Top = 56
            Width = 63
            Height = 13
            Caption = 'Peso L'#237'quido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblPlaca: TLabel
            Left = 600
            Top = 56
            Width = 27
            Height = 13
            Caption = 'Placa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sbtnTranspo: TSpeedButton
            Left = 552
            Top = 24
            Width = 23
            Height = 22
            Caption = '...'
          end
          object edtTransportadora: TEdit
            Left = 88
            Top = 24
            Width = 457
            Height = 21
            TabOrder = 0
          end
          object editMarca: TEdit
            Left = 88
            Top = 48
            Width = 177
            Height = 21
            TabOrder = 1
          end
          object edtEspecie: TEdit
            Left = 624
            Top = 24
            Width = 105
            Height = 21
            TabOrder = 2
          end
          object estQtdVolume: TEdit
            Left = 799
            Top = 22
            Width = 43
            Height = 21
            TabOrder = 3
          end
          object edtPbruto: TEdit
            Left = 328
            Top = 48
            Width = 89
            Height = 21
            TabOrder = 4
          end
          object edtPliquido: TEdit
            Left = 504
            Top = 48
            Width = 89
            Height = 21
            TabOrder = 5
          end
          object edtPlaca: TEdit
            Left = 632
            Top = 48
            Width = 105
            Height = 21
            TabOrder = 6
          end
          object RadioGroup1: TRadioGroup
            Left = 858
            Top = 8
            Width = 185
            Height = 95
            Caption = 'Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              '0- Entrada'
              '1- Destinat'#225'rio'
              '2- Por conta de Terceiros'
              '3- Sem Frete')
            ParentFont = False
            TabOrder = 7
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'F10- Produtos, Faturas e Impostos'
        ImageIndex = 1
        object BitBtn1: TBitBtn
          Left = 80
          Top = 120
          Width = 75
          Height = 25
          Caption = 'BitBtn1'
          TabOrder = 0
        end
        object BitBtn2: TBitBtn
          Left = 184
          Top = 120
          Width = 75
          Height = 25
          Caption = 'BitBtn2'
          TabOrder = 1
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 152
          Width = 1049
          Height = 57
          Caption = '???'
          TabOrder = 2
        end
        object DBGrid2: TDBGrid
          Left = 8
          Top = 216
          Width = 1049
          Height = 80
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
        end
        object DBGrid1: TDBGrid
          Left = 6
          Top = 11
          Width = 1049
          Height = 97
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              Title.Caption = 'Item'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Codigo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Descri'#231#227'o'
              Width = 402
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Unidade'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Valor Unit'#225'rio'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Quantidade'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = '% Desconto'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Vlr Desconto'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Valor Total'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'CFOP'
              Visible = True
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'F11- Configura'#231#227'o, Envio, Autoriza'#231#227'o e Cancelamento Sefaz'
        ImageIndex = 2
        object gbxEnvioeAutoNfe: TGroupBox
          Left = 0
          Top = 3
          Width = 993
          Height = 203
          Caption = 'Enivo e Auotiza'#231#227'o da NF-e'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblXmlNfe: TLabel
            Left = 40
            Top = 72
            Width = 128
            Height = 13
            Caption = 'XML Nota Fiscal Eletr'#244'nica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblPtrotocolo: TLabel
            Left = 128
            Top = 96
            Width = 45
            Height = 13
            Caption = 'Protocolo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblDataHora: TLabel
            Left = 520
            Top = 96
            Width = 57
            Height = 13
            Caption = 'Data / Hora'
          end
          object lblNsalvar: TLabel
            Left = 248
            Top = 184
            Width = 13
            Height = 13
            Caption = '1'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNenviar: TLabel
            Left = 408
            Top = 184
            Width = 13
            Height = 13
            Caption = '2'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNimpDanfe: TLabel
            Left = 576
            Top = 184
            Width = 13
            Height = 13
            Caption = '3'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNeniaNfeCliente: TLabel
            Left = 752
            Top = 184
            Width = 13
            Height = 13
            Caption = '4'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton1: TSpeedButton
            Left = 216
            Top = 152
            Width = 81
            Height = 25
            Caption = 'Salvar'
            Glyph.Data = {
              0E060000424D0E06000000000000360000002800000016000000160000000100
              180000000000D8050000C30E0000C30E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000B17F
              3CB17F3CB17F3CB17F3CB17F3CB17F3CB17F3CB17F3CB17F3CB17F3CB17F3CB1
              7F3CB17F3CB17F3CB17F3CB17F3CB17F3CB17F3CFFFFFFFFFFFFFFFFFFFFFFFF
              0000F0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3D
              F0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3DF0CD3DFFFFFFFFFFFFFFFF
              FFFFFFFF00003F3F3FCFCFCF3F3F3FCFCFCF3F3F3FCFCFCF3F3F3FCFCFCF3F3F
              3FCFCFCF3F3F3FCFCFCF3F3F3FCFCFCF3F3F3FCFCFCF3F3F3FCFCFCFFFFFFFFF
              FFFFFFFFFFFFFFFF0000D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              FFFFFFFFFFFFFFFFFFFFFFFF0000D2D2D2D2D2D2D2D2D2000000000000000000
              000000000000000000000000000000000000000000000000000000000000D2D2
              D2D2D2D2FFFFFFFFFFFFFFFFFFFFFFFF0000D4D4D4D4D4D40000000080800080
              80000000000000000000000000000000000000C0C0C0C0C0C000000000808000
              0000D4D4D4D4D4D4FFFFFFFFFFFFFFFFFFFFFFFF0000D6D6D6D6D6D600000000
              8080008080000000000000000000000000000000000000C0C0C0C0C0C0000000
              008080000000D6D6D6D6D6D6FFFFFFFFFFFFFFFFFFFFFFFF0000D8D8D8D8D8D8
              000000008080008080000000000000000000000000000000000000C0C0C0C0C0
              C0000000008080000000D8D8D8D8D8D8FFFFFFFFFFFFFFFFFFFFFFFF0000D8D8
              D8D8D8D800000000808000808000000000000000000000000000000000000000
              0000000000000000008080000000D8D8D8D8D8D8FFFFFFFFFFFFFFFFFFFFFFFF
              0000DADADADADADA000000008080008080008080008080008080008080008080
              008080008080008080008080008080000000DADADADADADAFFFFFFFFFFFFFFFF
              FFFFFFFF0000DBDBDBDBDBDB0000000080800080800000000000000000000000
              00000000000000000000000000008080008080000000DBDBDBDBDBDBFFFFFFFF
              FFFFFFFFFFFFFFFF0000DDDDDDDDDDDD000000008080000000C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000008080000000DDDDDDDDDDDD
              FFFFFFFFFFFFFFFFFFFFFFFF0000EBEBEBEBEBEB000000008080000000C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000008080000000EBEB
              EBEBEBEBFFFFFFFFFFFFFFFFFFFFFFFF0000ECECECECECEC0000000080800000
              00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000808000
              0000ECECECECECECFFFFFFFFFFFFFFFFFFFFFFFF0000EDEDEDEDEDED00000000
              8080000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
              008080000000EDEDEDEDEDEDFFFFFFFFFFFFFFFFFFFFFFFF0000EDEDEDEDEDED
              000000008080000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0000000000000000000EDEDEDEDEDEDFFFFFFFFFFFFFFFFFFFFFFFF0000EFEF
              EFEFEFEF000000008080000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0000000008080000000EFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFF
              0000F0F0F0F0F0F0000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0F0F0F0F0F0FFFFFFFFFFFFFFFF
              FFFFFFFF0000F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1FFFFFFFF
              FFFFFFFFFFFFFFFF0000F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              FFFFFFFFFFFFFFFFFFFFFFFF0000020202F2F2F2020202F2F2F2020202F2F2F2
              020202F2F2F2020202F2F2F2020202F2F2F2020202F2F2F2020202F2F2F20202
              02F2F2F2FFFFFFFFFFFFFFFFFFFFFFFF0000}
          end
          object SpeedButton2: TSpeedButton
            Left = 384
            Top = 152
            Width = 73
            Height = 22
            Caption = 'Enviar'
            OnClick = SpeedButton2Click
          end
          object SpeedButton3: TSpeedButton
            Left = 552
            Top = 152
            Width = 73
            Height = 22
            Caption = 'Imprimir'
          end
          object imgSalvar: TImage
            Left = 248
            Top = 120
            Width = 25
            Height = 25
            Picture.Data = {
              07544269746D617066060000424D660600000000000036000000280000001700
              000016000000010018000000000030060000C30E0000C30E0000000000000000
              0000F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3000000CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF000000D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1000000D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2808080808080D2D2D2D2D2D2D2D2D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D200
              0000D4D4D4D4D4D4D4D4D4D4D4D4D4D4D40000FF000080000080808080D4D4D4
              D4D4D4D4D4D4D4D4D4D4D4D40000FF808080D4D4D4D4D4D4D4D4D4D4D4D4D4D4
              D4D4D4D4D4D4D4000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6D60000FF00008000
              0080000080808080D6D6D6D6D6D6D6D6D60000FF000080000080808080D6D6D6
              D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6
              D60000FF000080000080000080000080808080D6D6D60000FF00008000008000
              0080000080808080D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D8D8D8D8D8D8
              D8D8D8D8D8D8D8D8D8D8D8D80000FF0000800000800000800000808080800000
              80000080000080000080000080808080D8D8D8D8D8D8D8D8D8D8D8D8D8D8D800
              0000DADADADADADADADADADADADADADADADADADADADADA0000FF000080000080
              000080000080000080000080000080000080808080DADADADADADADADADADADA
              DADADADADADADA000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
              DBDB0000FF000080000080000080000080000080000080808080DBDBDBDBDBDB
              DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DDDDDDDDDDDDDDDDDDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDD000080000080000080000080000080808080DD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000FF0000800000800000
              80000080808080DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00
              0000EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB0000FF000080
              000080000080000080000080808080EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
              EBEBEBEBEBEBEB000000ECECECECECECECECECECECECECECECECECECECECEC00
              00FF000080000080000080808080000080000080000080808080ECECECECECEC
              ECECECECECECECECECECECECECECEC000000EDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDED0000FF000080000080000080808080EDEDED0000FF00008000008000
              0080808080EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED000000EFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080808080EFEFEFEFEFEFEFEF
              EF0000FF000080000080000080808080EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF00
              0000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0000FF000080EFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080000080EFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEF000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000FF0000800000FF
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1000000F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F200
              0000F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2000000FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFC000000}
          end
          object ImgEnviarCliente: TImage
            Left = 744
            Top = 120
            Width = 25
            Height = 25
            Picture.Data = {
              07544269746D617066060000424D660600000000000036000000280000001700
              000016000000010018000000000030060000C30E0000C30E0000000000000000
              0000F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3000000CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF000000D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1000000D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2808080808080D2D2D2D2D2D2D2D2D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D200
              0000D4D4D4D4D4D4D4D4D4D4D4D4D4D4D40000FF000080000080808080D4D4D4
              D4D4D4D4D4D4D4D4D4D4D4D40000FF808080D4D4D4D4D4D4D4D4D4D4D4D4D4D4
              D4D4D4D4D4D4D4000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6D60000FF00008000
              0080000080808080D6D6D6D6D6D6D6D6D60000FF000080000080808080D6D6D6
              D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6
              D60000FF000080000080000080000080808080D6D6D60000FF00008000008000
              0080000080808080D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D8D8D8D8D8D8
              D8D8D8D8D8D8D8D8D8D8D8D80000FF0000800000800000800000808080800000
              80000080000080000080000080808080D8D8D8D8D8D8D8D8D8D8D8D8D8D8D800
              0000DADADADADADADADADADADADADADADADADADADADADA0000FF000080000080
              000080000080000080000080000080000080808080DADADADADADADADADADADA
              DADADADADADADA000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
              DBDB0000FF000080000080000080000080000080000080808080DBDBDBDBDBDB
              DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DDDDDDDDDDDDDDDDDDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDD000080000080000080000080000080808080DD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000FF0000800000800000
              80000080808080DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00
              0000EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB0000FF000080
              000080000080000080000080808080EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
              EBEBEBEBEBEBEB000000ECECECECECECECECECECECECECECECECECECECECEC00
              00FF000080000080000080808080000080000080000080808080ECECECECECEC
              ECECECECECECECECECECECECECECEC000000EDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDED0000FF000080000080000080808080EDEDED0000FF00008000008000
              0080808080EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED000000EFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080808080EFEFEFEFEFEFEFEF
              EF0000FF000080000080000080808080EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF00
              0000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0000FF000080EFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080000080EFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEF000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000FF0000800000FF
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1000000F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F200
              0000F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2000000FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFC000000}
          end
          object imgImprimir: TImage
            Left = 584
            Top = 120
            Width = 25
            Height = 25
            Picture.Data = {
              07544269746D617066060000424D660600000000000036000000280000001700
              000016000000010018000000000030060000C30E0000C30E0000000000000000
              0000F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3000000CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF000000D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1000000D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2808080808080D2D2D2D2D2D2D2D2D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D200
              0000D4D4D4D4D4D4D4D4D4D4D4D4D4D4D40000FF000080000080808080D4D4D4
              D4D4D4D4D4D4D4D4D4D4D4D40000FF808080D4D4D4D4D4D4D4D4D4D4D4D4D4D4
              D4D4D4D4D4D4D4000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6D60000FF00008000
              0080000080808080D6D6D6D6D6D6D6D6D60000FF000080000080808080D6D6D6
              D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6
              D60000FF000080000080000080000080808080D6D6D60000FF00008000008000
              0080000080808080D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D8D8D8D8D8D8
              D8D8D8D8D8D8D8D8D8D8D8D80000FF0000800000800000800000808080800000
              80000080000080000080000080808080D8D8D8D8D8D8D8D8D8D8D8D8D8D8D800
              0000DADADADADADADADADADADADADADADADADADADADADA0000FF000080000080
              000080000080000080000080000080000080808080DADADADADADADADADADADA
              DADADADADADADA000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
              DBDB0000FF000080000080000080000080000080000080808080DBDBDBDBDBDB
              DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DDDDDDDDDDDDDDDDDDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDD000080000080000080000080000080808080DD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000FF0000800000800000
              80000080808080DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00
              0000EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB0000FF000080
              000080000080000080000080808080EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
              EBEBEBEBEBEBEB000000ECECECECECECECECECECECECECECECECECECECECEC00
              00FF000080000080000080808080000080000080000080808080ECECECECECEC
              ECECECECECECECECECECECECECECEC000000EDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDED0000FF000080000080000080808080EDEDED0000FF00008000008000
              0080808080EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED000000EFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080808080EFEFEFEFEFEFEFEF
              EF0000FF000080000080000080808080EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF00
              0000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0000FF000080EFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080000080EFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEF000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000FF0000800000FF
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1000000F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F200
              0000F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2000000FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFC000000}
          end
          object imgEnviar: TImage
            Left = 408
            Top = 120
            Width = 25
            Height = 25
            Picture.Data = {
              07544269746D617066060000424D660600000000000036000000280000001700
              000016000000010018000000000030060000C30E0000C30E0000000000000000
              0000F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3000000CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
              CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF000000D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1000000D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2808080808080D2D2D2D2D2D2D2D2D2D2D2D2D2D2
              D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D200
              0000D4D4D4D4D4D4D4D4D4D4D4D4D4D4D40000FF000080000080808080D4D4D4
              D4D4D4D4D4D4D4D4D4D4D4D40000FF808080D4D4D4D4D4D4D4D4D4D4D4D4D4D4
              D4D4D4D4D4D4D4000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6D60000FF00008000
              0080000080808080D6D6D6D6D6D6D6D6D60000FF000080000080808080D6D6D6
              D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D6D6D6D6D6D6D6D6D6D6D6D6D6D6
              D60000FF000080000080000080000080808080D6D6D60000FF00008000008000
              0080000080808080D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6000000D8D8D8D8D8D8
              D8D8D8D8D8D8D8D8D8D8D8D80000FF0000800000800000800000808080800000
              80000080000080000080000080808080D8D8D8D8D8D8D8D8D8D8D8D8D8D8D800
              0000DADADADADADADADADADADADADADADADADADADADADA0000FF000080000080
              000080000080000080000080000080000080808080DADADADADADADADADADADA
              DADADADADADADA000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
              DBDB0000FF000080000080000080000080000080000080808080DBDBDBDBDBDB
              DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DDDDDDDDDDDDDDDDDDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDD000080000080000080000080000080808080DD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000FF0000800000800000
              80000080808080DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00
              0000EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB0000FF000080
              000080000080000080000080808080EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
              EBEBEBEBEBEBEB000000ECECECECECECECECECECECECECECECECECECECECEC00
              00FF000080000080000080808080000080000080000080808080ECECECECECEC
              ECECECECECECECECECECECECECECEC000000EDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDED0000FF000080000080000080808080EDEDED0000FF00008000008000
              0080808080EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED000000EFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080808080EFEFEFEFEFEFEFEF
              EF0000FF000080000080000080808080EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF00
              0000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0000FF000080EFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEF0000FF000080000080000080EFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEF000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000FF0000800000FF
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1000000F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F200
              0000F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2F2F2F2000000FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFC000000}
          end
          object gbxExportacao: TGroupBox
            Left = 176
            Top = 16
            Width = 809
            Height = 49
            Caption = 'Exporta'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object lblUfEmbarque: TLabel
              Left = 32
              Top = 16
              Width = 65
              Height = 13
              Caption = 'UF Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblLocEmbarque: TLabel
              Left = 144
              Top = 16
              Width = 92
              Height = 13
              Caption = 'Local de Embarque'
            end
            object edtUfEmbarque: TEdit
              Left = 104
              Top = 16
              Width = 33
              Height = 21
              TabOrder = 0
            end
            object edtLocEmbarque: TEdit
              Left = 256
              Top = 16
              Width = 545
              Height = 21
              TabOrder = 1
            end
          end
          object edtXmlNfe: TEdit
            Left = 176
            Top = 72
            Width = 801
            Height = 21
            TabOrder = 1
          end
          object edtProtocolo: TEdit
            Left = 176
            Top = 96
            Width = 297
            Height = 21
            TabOrder = 2
          end
          object edtDataHora: TEdit
            Left = 584
            Top = 96
            Width = 145
            Height = 21
            TabOrder = 3
          end
          object btnEnvioNfeCliente: TButton
            Left = 704
            Top = 152
            Width = 105
            Height = 25
            Caption = 'Enviar NF-e Cliente'
            TabOrder = 4
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 503
    Width = 1024
    Height = 55
    Align = alBottom
    TabOrder = 1
    object btnNovo: TButton
      Left = 8
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
    end
    object btnServico: TBitBtn
      Left = 400
      Top = 14
      Width = 113
      Height = 25
      Caption = 'Status do Servi'#231'o'
      TabOrder = 1
      OnClick = btnServicoClick
    end
    object btnExcluir: TBitBtn
      Left = 104
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
    object Button1: TButton
      Left = 696
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 484
    Width = 1024
    Height = 19
    Panels = <
      item
        Width = 536
      end
      item
        Text = 'Ambiente de Produ'#231#227'o'
        Width = 100
      end>
  end
  object MainMenu1: TMainMenu
    Left = 840
    Top = 404
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Ca1: TMenuItem
        Caption = 'Cadastros'
        ShortCut = 123
      end
      object Incluir1: TMenuItem
        Caption = 'Incluir'
        ShortCut = 114
      end
    end
  end
end
