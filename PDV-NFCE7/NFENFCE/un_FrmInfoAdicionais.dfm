object Frm_InfoAdicionais: TFrm_InfoAdicionais
  Left = 0
  Top = 14
  Width = 1024
  Height = 714
  Caption = 'NFE / NFCE - Informa'#231#245'es Adicionais'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 676
    Align = alClient
    Color = clTeal
    TabOrder = 0
    object Label2: TLabel
      Left = 408
      Top = 272
      Width = 285
      Height = 16
      Caption = 'Informa'#231#245'es adicionais para NFE / NFCE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConfirma: TButton
      Left = 784
      Top = 624
      Width = 99
      Height = 25
      Caption = 'Confirma'
      TabOrder = 0
      OnClick = btnConfirmaClick
    end
    object btnCancela: TButton
      Left = 920
      Top = 624
      Width = 99
      Height = 25
      Caption = 'Cancela'
      TabOrder = 1
      OnClick = btnCancelaClick
    end
    object PageControl1: TPageControl
      Left = 7
      Top = 11
      Width = 1066
      Height = 598
      ActivePage = TabSheet1
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'F9- Situa'#231#227'o Trubut'#225'ria, Transporte e Mensagem da Nota'
        object gruTipeTribNota: TGroupBox
          Left = 5
          Top = 1
          Width = 1041
          Height = 168
          Caption = 'Tipo e Tributa'#231#227'o da Nota Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
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
            Left = 176
            Top = 48
            Width = 413
            Height = 13
            Caption = 'VENDA DE MERCADORIAS ADIQURIDAS E RECEBIDA DE TERCEIROS'
          end
          object lblDescCsosn: TLabel
            Left = 168
            Top = 72
            Width = 417
            Height = 13
            Caption = 'TRIBUTADA PELO SIMPLES NACIONAL SEM PERMISS'#195'O DE CR'#201'DITO'
          end
          object lblDescSitIpi: TLabel
            Left = 168
            Top = 96
            Width = 98
            Height = 13
            Caption = 'SEM USO DE IPI'
          end
          object lblDescSitPis: TLabel
            Left = 168
            Top = 120
            Width = 738
            Height = 13
            Caption = 
              'OPERA'#199#195'O TRIBUT'#193'VEL (BASE DE CALCULO = VALOR OPERA'#199#195'O ALIQUOTA N' +
              'ORMAL (CUMULATIVA / N'#195'O CUMULATIVO))'
          end
          object lblDescSitCofins: TLabel
            Left = 168
            Top = 144
            Width = 738
            Height = 13
            Caption = 
              'OPERA'#199#195'O TRIBUT'#193'VEL (BASE DE CALCULO = VALOR OPERA'#199#195'O ALIQUOTA N' +
              'ORMAL (CUMULATIVA / N'#195'O CUMULATIVO))'
          end
          object edtCfop: TEdit
            Left = 104
            Top = 40
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = '5102'
            OnExit = edtCfopExit
            OnKeyDown = edtCfopKeyDown
          end
          object edtCsosn: TEdit
            Left = 104
            Top = 64
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            Text = '102'
            OnExit = edtCsosnExit
          end
          object edtSitIpi: TEdit
            Left = 104
            Top = 88
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            Text = '00'
            OnExit = edtSitIpiExit
          end
          object edtSitPis: TEdit
            Left = 104
            Top = 112
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            Text = '01'
            OnExit = edtSitPisExit
          end
          object edtSitCofins: TEdit
            Left = 104
            Top = 136
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            Text = '01'
            OnExit = edtSitCofinsExit
          end
          object rdgTpNota: TRadioGroup
            Left = 304
            Top = 8
            Width = 369
            Height = 33
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              '0- Nota Fiscal de Entrada'
              '1- Nota Fiscal de Sa'#237'da')
            TabOrder = 5
            OnClick = rdgTpNotaClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 420
          Width = 1041
          Height = 133
          Caption = 'Informa'#231#245'es Adicionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object MemoInfoAd: TMemo
            Left = 8
            Top = 16
            Width = 1025
            Height = 113
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              'Documento emitido por ME ou EPP optante pelo Simples Nacional.'
              'Nao gera direito a credito fiscal de IPI.'
              
                'PROCON-RJ - Rua da Ajuda N 05 - subsolo - Central do Brasil - Te' +
                'lefone 151'
              
                'ALERJ - Palacio Tiradentes - Rua Primeiro de Marco, S/N - Praca ' +
                'XV - Tel:2588-1000 '
              
                'Permite o aproveitamento do credito ICMS no valor de R$ 99,99 co' +
                'rrespodente a aliquota de 3,91, nos termos do Art. 23 da LC 123/' +
                '2006')
            ParentFont = False
            TabOrder = 0
          end
        end
        object GrpTransportadora: TGroupBox
          Left = 3
          Top = 294
          Width = 1047
          Height = 115
          Caption = 'Transportadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
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
            Left = 424
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
            Left = 592
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object editMarca: TEdit
            Left = 88
            Top = 48
            Width = 177
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object edtEspecie: TEdit
            Left = 624
            Top = 24
            Width = 105
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object estQtdVolume: TEdit
            Left = 796
            Top = 23
            Width = 43
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object edtPbruto: TEdit
            Left = 328
            Top = 48
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object edtPliquido: TEdit
            Left = 496
            Top = 48
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
          object edtPlaca: TEdit
            Left = 624
            Top = 48
            Width = 105
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNone
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
          object rdgFrete: TRadioGroup
            Left = 850
            Top = 8
            Width = 185
            Height = 95
            Caption = 'Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemIndex = 1
            Items.Strings = (
              '0- Emitente'
              '1- Destinat'#225'rio'
              '2- Por conta de Terceiros'
              '3- Sem Frete')
            ParentFont = False
            TabOrder = 7
          end
        end
        object gruImpTotal: TGroupBox
          Left = 4
          Top = 177
          Width = 1041
          Height = 105
          Caption = 'Impostos e Totalizadores (F12 Editar)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
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
            Left = 654
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
          object edtValDesc: TEdit
            Left = 152
            Top = 72
            Width = 97
            Height = 21
            TabOrder = 2
          end
          object edtValorICMS: TEdit
            Left = 328
            Top = 24
            Width = 89
            Height = 21
            TabOrder = 3
          end
          object edtValFrete: TEdit
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
          object edtValorlPI: TEdit
            Left = 912
            Top = 24
            Width = 97
            Height = 21
            TabOrder = 10
          end
        end
      end
    end
  end
end
