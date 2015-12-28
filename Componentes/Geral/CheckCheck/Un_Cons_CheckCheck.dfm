object Frm_ConsCheckCheck: TFrm_ConsCheckCheck
  Left = 15
  Top = 19
  Width = 788
  Height = 555
  ActiveControl = CnpjCpf
  Caption = 'Consulta Check Check'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LbCheckCheck: TLabel
    Left = 0
    Top = 469
    Width = 780
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 'CPF/CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 80
    Width = 780
    Height = 389
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '&Dados'
      object lblCpfCnpj: TLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 13
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValor: TLabel
        Left = 8
        Top = 48
        Width = 92
        Height = 13
        Caption = 'Valor do Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBanco: TLabel
        Left = 488
        Top = 64
        Width = 37
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblAgencia: TLabel
        Left = 556
        Top = 64
        Width = 47
        Height = 13
        Caption = 'Ag'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblConta: TLabel
        Left = 652
        Top = 64
        Width = 86
        Height = 13
        Caption = 'Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblChequeInicial: TLabel
        Left = 488
        Top = 104
        Width = 82
        Height = 13
        Caption = 'Cheque Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblCMC7: TLabel
        Left = 8
        Top = 88
        Width = 34
        Height = 13
        Caption = 'CMC7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 252
        Top = 88
        Width = 28
        Height = 13
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblChequeFinal: TLabel
        Left = 595
        Top = 105
        Width = 75
        Height = 13
        Caption = 'Cheque Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblTelefone1: TLabel
        Left = 8
        Top = 173
        Width = 111
        Height = 13
        Caption = 'DDD/Telefone Fixo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTelefone2: TLabel
        Left = 8
        Top = 213
        Width = 111
        Height = 13
        Caption = 'DDD/Telefone Fixo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTelefone3: TLabel
        Left = 8
        Top = 253
        Width = 95
        Height = 13
        Caption = 'DDD/Telefone 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblTelefone4: TLabel
        Left = 8
        Top = 293
        Width = 95
        Height = 13
        Caption = 'DDD/Telefone 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 160
        Top = 28
        Width = 61
        Height = 13
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label3: TLabel
        Left = 71
        Top = 7
        Width = 81
        Height = 13
        Caption = '(Sem pontua'#231#227'o)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -3
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 103
        Top = 48
        Width = 63
        Height = 13
        Caption = '(Sem v'#237'rgula)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -3
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 130
        Width = 82
        Height = 13
        Caption = 'Cliente des de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 9
        Top = 150
        Width = 20
        Height = 13
        Caption = 'M'#234's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -3
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 61
        Top = 150
        Width = 19
        Height = 13
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -3
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CnpjCpf: TEditControle
        Left = 8
        Top = 24
        Width = 145
        Height = 21
        MaxLength = 14
        TabOrder = 0
        OnExit = CnpjCpfExit
        Obrigatorio = True
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpNumero
      end
      object Valor: TEditControle
        Left = 8
        Top = 64
        Width = 93
        Height = 21
        TabOrder = 1
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpDecimal
        Mascara = '#,##0.00'
        Alignment = taRightJustify
      end
      object Banco: TEditControle
        Left = 488
        Top = 80
        Width = 63
        Height = 21
        TabOrder = 2
        Visible = False
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpNumero
      end
      object Agencia: TEditControle
        Left = 556
        Top = 80
        Width = 92
        Height = 21
        TabOrder = 3
        Visible = False
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpNumero
      end
      object Conta: TEditControle
        Left = 652
        Top = 80
        Width = 102
        Height = 21
        TabOrder = 4
        Visible = False
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpNumero
      end
      object ChequeIni: TEditControle
        Left = 488
        Top = 120
        Width = 102
        Height = 21
        TabOrder = 5
        Visible = False
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpNumero
      end
      object ChequeFinal: TEditControle
        Left = 595
        Top = 121
        Width = 102
        Height = 21
        TabOrder = 6
        Visible = False
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpNumero
      end
      object Cmc7A: TEditControle
        Left = 8
        Top = 103
        Width = 64
        Height = 21
        MaxLength = 8
        TabOrder = 7
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
      end
      object Qtde: TEditControle
        Left = 252
        Top = 103
        Width = 41
        Height = 21
        TabOrder = 10
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
        Tipo = tpNumero
        Alignment = taRightJustify
      end
      object Tel1: TMaskEditControle
        Left = 8
        Top = 189
        Width = 110
        Height = 21
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 13
        Text = '(  )    -    '
        Obrigatorio = False
        Encontrou = False
        Alignment = taLeftJustify
        VerificaData = False
        VerificaHora = False
        DataDoDia = False
        Enter = True
        FormataData = False
        FormatDate = False
      end
      object Tel2: TMaskEditControle
        Left = 8
        Top = 229
        Width = 109
        Height = 21
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 14
        Text = '(  )    -    '
        Obrigatorio = False
        Encontrou = False
        Alignment = taLeftJustify
        VerificaData = False
        VerificaHora = False
        DataDoDia = False
        Enter = True
        FormataData = False
        FormatDate = False
      end
      object Tel3: TMaskEditControle
        Left = 8
        Top = 267
        Width = 101
        Height = 21
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 15
        Text = '(  )    -    '
        Visible = False
        Obrigatorio = False
        Encontrou = False
        Alignment = taLeftJustify
        VerificaData = False
        VerificaHora = False
        DataDoDia = False
        Enter = True
        FormataData = False
        FormatDate = False
      end
      object Tel4: TMaskEditControle
        Left = 8
        Top = 309
        Width = 101
        Height = 21
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 16
        Text = '(  )    -    '
        Visible = False
        Obrigatorio = False
        Encontrou = False
        Alignment = taLeftJustify
        VerificaData = False
        VerificaHora = False
        DataDoDia = False
        FormataData = False
        FormatDate = False
      end
      object Cmc7B: TEditControle
        Left = 75
        Top = 103
        Width = 76
        Height = 21
        MaxLength = 8
        TabOrder = 8
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
      end
      object Cmc7C: TEditControle
        Left = 153
        Top = 103
        Width = 92
        Height = 21
        MaxLength = 8
        TabOrder = 9
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
      end
      object EditControle1: TEditControle
        Left = 34
        Top = 145
        Width = 22
        Height = 21
        MaxLength = 8
        TabOrder = 11
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
      end
      object EditControle2: TEditControle
        Left = 85
        Top = 145
        Width = 35
        Height = 21
        MaxLength = 8
        TabOrder = 12
        Obrigatorio = False
        Posicao = 0
        Enter = True
        Encontrou = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Retorno'
      ImageIndex = 1
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 772
        Height = 361
        ActivePage = TabSheet6
        Align = alClient
        Style = tsButtons
        TabIndex = 0
        TabOrder = 0
        OnEnter = PageControl2Enter
        OnExit = PageControl2Exit
        object TabSheet6: TTabSheet
          Caption = 'C&heques'
          ImageIndex = 1
          object Cheques: TMemoControle
            Left = 0
            Top = 0
            Width = 764
            Height = 330
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            NHotKey = False
          end
        end
        object TabSheet7: TTabSheet
          Caption = '&Pend'#234'ncias'
          ImageIndex = 2
          object Pendencias: TMemoControle
            Left = 0
            Top = 0
            Width = 764
            Height = 330
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            NHotKey = False
          end
        end
        object TabSheet9: TTabSheet
          Caption = '&Cliente'
          ImageIndex = 4
          object Cliente: TMemoControle
            Left = 0
            Top = 0
            Width = 764
            Height = 330
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            NHotKey = False
          end
        end
        object TabSheet8: TTabSheet
          Caption = '&Outras'
          ImageIndex = 3
          object Outras: TMemoControle
            Left = 0
            Top = 0
            Width = 764
            Height = 330
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            NHotKey = False
          end
        end
        object TabSheet5: TTabSheet
          Caption = '&Login'
          object MLogin: TMemoControle
            Left = 0
            Top = 0
            Width = 764
            Height = 330
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            NHotKey = False
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Obser&va'#231#227'o'
      ImageIndex = 2
      object Obs: TMemoControle
        Left = 0
        Top = 0
        Width = 772
        Height = 361
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        NHotKey = False
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Login'
      ImageIndex = 3
      TabVisible = False
      object lOGIN: TMemoControle
        Left = 0
        Top = 0
        Width = 772
        Height = 361
        Align = alClient
        TabOrder = 0
        WordWrap = False
        NHotKey = False
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 780
    Height = 39
    Align = alTop
    Color = clGreen
    TabOrder = 1
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 780
    Height = 39
    Align = alBottom
    TabOrder = 2
    object Label8: TLabel
      Left = 650
      Top = 13
      Width = 37
      Height = 13
      Caption = 'Esc ->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BotaoVoltar: TSpeedButton
      Left = 438
      Top = 6
      Width = 102
      Height = 29
      Caption = 'Retornar'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF044906055B09066C0C066C0C055E0A044C06FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05600905600908911309B01809
        B31A09B31909B11907961405680C05680CFF00FFFF00FFFF00FFFF00FFFF00FF
        0A6A150A7F150BB61C09B91A08B41807B21609B31909B41909B81A09B91A0783
        10044D06FF00FFFF00FFFF00FF0B6A150F852216BD3411B7270BB21C07B11608
        B11709B21909B21909B21909B41909BA1A07841006670CFF00FFFF00FF0B6A15
        20BE491BBD4014B7300AB21F63CE6DEEFAEFDFF5E128BC3609B21909B21909B3
        1909BA1A06670CFF00FF0872101B9A3A2AC65B1DBB450EB4255BCC66F7FDF8FF
        FFFF9ADFA011B42009B21909B21909B21909B81A089413045D090872102AB65B
        2CC56522BD4D5CCC69F6FCF7FDFEFD8EDB9509B21A09B21909B21909B21909B2
        1909B51A08AB17045D090F821C37C26C33C76C8ADDA8F4FCF6FFFFFFF9FDFAC7
        EED2C4EDCCBFEBC3BFEBC3C0EBC4C2ECC608B41909B31905650B138D2358CC83
        42C977C9EFD8FFFFFFFFFFFFFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0AB41A09B319066D0D0F911D6FD2935FD38D44C977B7EACBFFFFFFFBFEFC9A
        E2B458CD795CCE765CCD765CCD735BCD7211B82B08B11905610A0F911D67CC83
        9BE5BA38C67032C36AAAE6C1FFFFFFE9F9EF6AD38E21BD4D1EBC491EBC471AB9
        3E10BA2908A31705610AFF00FF25AE39BCEDD282DBA428C06331C268A4E4BDFF
        FFFFF7FDF945C86E20BB4A1DBA4118B73614C0300A8517FF00FFFF00FF25AE39
        71D28CD2F4E180DAA336C46D31C36AAAE6C1BDECCF35C46924BE5623BC4D1FC1
        4616AE340A8517FF00FFFF00FFFF00FF25AE3984D89FDBF7EAAFE8C66BD49352
        CC8144C97849CA7B48CB7839CB6A21B6490F7C1FFF00FFFF00FFFF00FFFF00FF
        FF00FF25AE3925AE39ADE8C5CCF2DEBAEDD1A6E7C291E2B364D4922FB1572FB1
        57FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32B74E25AE3925
        AE3925AE3925AE3924A342FF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = BotaoVoltarClick
    end
    object BotaoSeguir: TSpeedButton
      Left = 541
      Top = 6
      Width = 102
      Height = 29
      Caption = 'Avan'#231'ar'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF044906055B09066C0C066C0C055E0A044C06FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05600905600908911309B01809
        B31A09B31909B11907961405680C05680CFF00FFFF00FFFF00FFFF00FFFF00FF
        0A6A150A7F150BB61C09B91A08B41807B21609B31909B41909B81A09B91A0783
        10044D06FF00FFFF00FFFF00FF0B6A150F852216BD3411B7270BB21C07B11608
        B11709B21909B21909B21909B41909BA1A07841006670CFF00FFFF00FF0B6A15
        20BE491BBD4014B7300AB21F28BC36DFF5E1EEFAEF63CE6D09B21909B21909B3
        1909BA1A06670CFF00FF0872101B9A3A2AC65B1DBB450EB4250BB31B11B4219A
        DFA0FFFFFFF7FDF85ACB6509B21909B21909B81A089413045D090872102AB65B
        2CC56522BD4D0FB4220AB21A0CB31C0AB2198DDB95FDFEFDF6FCF758CB6309B2
        1909B51A08AB17045D090F821C37C26C33C76CCDF1DAC9EFD3C7EED0C8EFD2C5
        EED0C7EECFF8FDF9FFFFFFF2FBF36FD27908B41909B31905650B138D2358CC83
        42C977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDFFFFFFFFFFFFBCEA
        C10AB41A09B319066D0D0F911D6FD2935FD38D6DD49572D69971D69872D69964
        D28C92DFA8FBFEFBFFFFFFACE5B82EBF4C11B82B08B11905610A0F911D67CC83
        9BE5BA38C67030C36938C56F38C56F70D697E8F8EEFFFFFF9FE2B120BD481AB9
        3E10BA2908A31705610AFF00FF25AE39BCEDD282DBA428C0632FC26753CD82F7
        FDF9FFFFFF9CE2B222BC4B1DBA4118B73614C0300A8517FF00FFFF00FF25AE39
        71D28CD2F4E180DAA336C46D39C56FBCECCEABE6C22DC26324BE5623BC4D1FC1
        4616AE340A8517FF00FFFF00FFFF00FF25AE3984D89FDBF7EAAFE8C66BD49352
        CC8144C97849CA7B48CB7839CB6A21B6490F7C1FFF00FFFF00FFFF00FFFF00FF
        FF00FF25AE3925AE39ADE8C5CCF2DEBAEDD1A6E7C291E2B364D4922FB1572FB1
        57FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32B74E25AE3925
        AE3925AE3925AE3924A342FF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphRight
      OnClick = BotaoSeguirClick
    end
    object botao_sair: TPanel
      Left = 693
      Top = 8
      Width = 76
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
    object BConfirma: TBitBtnControle
      Left = 84
      Top = 8
      Width = 153
      Height = 25
      Caption = 'F5 - Confirma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = BConfirmaClick
      Posicao = 55
      Acao = tanone
    end
    object BConsulta: TBitBtnControle
      Left = 277
      Top = 6
      Width = 153
      Height = 29
      Caption = 'F5 - Consulta'
      TabOrder = 2
      OnClick = BConsultaClick
      Glyph.Data = {
        02030000424D0203000000000000360100002800000013000000170000000100
        080000000000CC010000C30E0000C30E000040000000000000001C3404002434
        1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
        54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
        7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
        94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
        040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
        2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
        6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
        B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C0003F3F3F3F3F3F
        191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112193F3F3F3F3F3F3F
        3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F3F3F120E0C0B0B0C
        11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F3F3F3F3F3F003F3F
        3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E0F03100C0C0E1219
        3F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F3F003F3F2B212223
        221305170C0C0E11173F3F3F3F003F3521222323231E06090E0C0C0E12193F3F
        3F003F2B2223272726221304180E0C0C0E123F3F3F003F2926252A2F2F261F06
        08110E0C0E11173F3F0038302D232C39332E23150311110E0C0E11173F003F39
        2E28383F37312A220F0117110E0E0E1219003F3F373F3F3F3F3A30261E060917
        110E0E1117003F3F3F3F3F3F3F3F322E2315030C1712111217003F3F3F3F3F3F
        3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B342E231300193F3F
        3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F3F3F3F3F3F3F3F3F
        3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D312320353F003F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F373F3F00}
      Posicao = 59
      Acao = tanone
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 41
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvSpace
    Color = clGreen
    TabOrder = 3
    Visible = False
    object PiscaLabel1: TPiscaLabel
      Left = 2
      Top = 2
      Width = 776
      Height = 37
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cliente OK!'
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      Visible = False
      Velocidad = 0
    end
  end
  object Query1: TQuery
    DatabaseName = 'CREDITO'
    Left = 601
    Top = 301
  end
  object Query2: TQuery
    DatabaseName = 'CREDITO'
    Left = 425
    Top = 333
  end
  object Query3: TQuery
    DatabaseName = 'CREDITO'
    Left = 456
    Top = 144
  end
end