object frm_ConfigLocal: Tfrm_ConfigLocal
  Left = 59
  Top = 31
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 508
  ClientWidth = 730
  Color = clTeal
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 729
    Height = 513
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 0
    Top = 0
    Width = 729
    Height = 513
  end
  object fichario: TPageControl
    Left = 196
    Top = 41
    Width = 541
    Height = 438
    Cursor = crHandPoint
    ActivePage = Pagina9
    MultiLine = True
    Style = tsButtons
    TabOrder = 0
    object pagina1: TTabSheet
      Caption = 'Relat'#243'rios'
      TabVisible = False
      object PageControl1: TPageControl
        Left = 16
        Top = 118
        Width = 329
        Height = 164
        Cursor = crHandPoint
        ActivePage = TabSheet4
        OwnerDraw = True
        TabIndex = 1
        TabOrder = 0
        OnDrawTab = PageControl1DrawTab
        object TabSheet3: TTabSheet
          Caption = 'Relat'#243'rios'
          object Label5: TLabel
            Left = 9
            Top = 8
            Width = 142
            Height = 16
            Caption = 'Impressora matricial'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbImpressora: TComboBox
            Left = 8
            Top = 26
            Width = 177
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            OnKeyDown = cbImpressoraKeyDown
            Items.Strings = (
              'Amelia'
              'Antares'
              'Emilia'
              'Epson'
              'Grafix'
              'Lady II'
              'Mirage'
              'p720'
              'Rima')
          end
          object chSaltoNat: TCheckBox
            Left = 9
            Top = 59
            Width = 265
            Height = 17
            Caption = 'Salto de p'#225'gina no final da impress'#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Etiquetas'
          ImageIndex = 3
          object Label32: TLabel
            Left = 11
            Top = 76
            Width = 122
            Height = 13
            Caption = 'Posi'#231#227'o da 2'#170' coluna'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 78
            Top = 104
            Width = 71
            Height = 13
            Caption = '(Padr'#227'o: 45)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object rdColEtiq: TRadioGroup
            Left = 8
            Top = 8
            Width = 147
            Height = 57
            Caption = ' N'#186' de colunas '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemIndex = 0
            Items.Strings = (
              '01 coluna'
              '02 colunas')
            ParentFont = False
            TabOrder = 0
          end
          object rdTextoEtiq: TRadioGroup
            Left = 160
            Top = 8
            Width = 147
            Height = 57
            Caption = ' Texto '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemIndex = 0
            Items.Strings = (
              'Simples'
              'Condensado')
            ParentFont = False
            TabOrder = 1
          end
          object edtEspaco: TMaskEdit
            Left = 11
            Top = 94
            Width = 61
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnKeyDown = edtEspacoKeyDown
          end
        end
      end
      object rdModeloImpressao: TRadioGroup
        Left = 16
        Top = 43
        Width = 329
        Height = 58
        Cursor = crHandPoint
        Caption = ' Modo Geral de Impress'#227'o dos Relat'#243'rios'
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Impressora matricial'
          'Impressora jato de tinta')
        ParentFont = False
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Relat'#243'rios'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object pagina2: TTabSheet
      Caption = 'Interface'
      ImageIndex = 5
      TabVisible = False
      object PageControl3: TPageControl
        Left = 24
        Top = 40
        Width = 489
        Height = 334
        Cursor = crHandPoint
        ActivePage = TabSheet9
        OwnerDraw = True
        TabIndex = 2
        TabOrder = 0
        OnDrawTab = PageControl3DrawTab
        object TabSheet6: TTabSheet
          Caption = 'C'#243'digo de barras'
          object GroupBox2: TGroupBox
            Left = 22
            Top = 27
            Width = 437
            Height = 194
            Caption = ' Forma de Leitura do C'#243'digo de Barras (Interno / EAN13)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 16
              Top = 32
              Width = 120
              Height = 16
              Caption = 'p/ MODO VENDA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 16
              Top = 88
              Width = 120
              Height = 16
              Caption = 'p/ MODO TROCA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 16
              Top = 144
              Width = 122
              Height = 16
              Caption = 'p/ MODO DEVOL.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rdFormaLeituraVenda: TRadioGroup
              Left = 160
              Top = 16
              Width = 246
              Height = 52
              ItemIndex = 0
              Items.Strings = (
                '>Leitura manual da qtde.'
                '>Leitura direta')
              TabOrder = 0
            end
            object rdFormaLeituraTroca: TRadioGroup
              Left = 160
              Top = 72
              Width = 246
              Height = 52
              ItemIndex = 0
              Items.Strings = (
                '>Leitura manual da qtde.'
                '>Leitura direta')
              TabOrder = 1
            end
            object rdFormaLeituraDevolucao: TRadioGroup
              Left = 160
              Top = 128
              Width = 246
              Height = 52
              ItemIndex = 0
              Items.Strings = (
                '>Leitura manual da qtde.'
                '>Leitura direta')
              TabOrder = 2
            end
          end
          object chPrevalecerEAN13: TCheckBoxOO
            Left = 24
            Top = 232
            Width = 441
            Height = 17
            Cursor = crHandPoint
            Caption = 'Prevalecer o EAN13 nos Lan'#231'amentos de '#205'tens de Produtos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Promo'#231#245'es'
          ImageIndex = 1
          object Label9: TLabel
            Left = 14
            Top = 31
            Width = 183
            Height = 16
            Caption = 'Dias que faltam para vencer'
          end
          object memoria_solicitacao_dias_a_vencer_promocao: TEditControle
            Left = 13
            Top = 48
            Width = 69
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnChange = memoria_solicitacao_dias_a_vencer_promocaoChange
            Obrigatorio = False
            Posicao = 0
            Enter = True
            Encontrou = False
          end
          object UpDown1: TUpDown
            Left = 80
            Top = 49
            Width = 17
            Height = 24
            Min = -1
            Max = 32767
            Position = -1
            TabOrder = 2
            Wrap = False
            OnClick = UpDown1Click
          end
          object memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho: TCheckControle
            Left = 13
            Top = 73
            Width = 157
            Height = 17
            Caption = 'Exibir Cor e Tamanho'
            TabOrder = 3
            Encontrou = False
            Enter = True
            ClickAut = False
            TipoValor = varString
          end
          object IniProm: TCheckControle
            Left = 14
            Top = 2
            Width = 253
            Height = 17
            Caption = 'Exibir consulta ao iniciar o sistema'
            TabOrder = 0
            Encontrou = False
            Enter = True
            ClickAut = False
            TipoValor = varString
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Vales/Devolu'#231#245'es'
          ImageIndex = 2
          object GroupBox4: TGroupBox
            Left = 2
            Top = 3
            Width = 477
            Height = 128
            Caption = 'Comissionar'
            TabOrder = 0
            object cbvalesemitidos: TCheckBox
              Left = 7
              Top = 22
              Width = 190
              Height = 17
              Caption = 'Vales emitidos/devolu'#231#227'o'
              Checked = True
              Enabled = False
              State = cbChecked
              TabOrder = 0
            end
            object cbvalesrecebidos: TCheckBox
              Left = 7
              Top = 38
              Width = 131
              Height = 17
              Caption = 'Vales recebidos'
              Checked = True
              Enabled = False
              State = cbChecked
              TabOrder = 1
            end
            object cbvalesmerc: TCheckBox
              Left = 7
              Top = 55
              Width = 136
              Height = 17
              Caption = 'Vales mercadoria'
              Checked = True
              Enabled = False
              State = cbChecked
              TabOrder = 2
            end
            object cbexibiritens: TCheckBox
              Left = 7
              Top = 72
              Width = 307
              Height = 17
              Caption = 'Exibir qtde vendas/'#237'tens vendas (Relat'#243'rio)'
              Checked = True
              Enabled = False
              State = cbChecked
              TabOrder = 3
            end
            object chDescontarDevolucao: TCheckBoxOO
              Left = 7
              Top = 89
              Width = 237
              Height = 17
              Cursor = crHandPoint
              Caption = 'Descontar devolu'#231#245'es nas comiss'#245'es'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Descontos'
          ImageIndex = 3
          object Label14: TLabel
            Left = 8
            Top = 7
            Width = 79
            Height = 13
            Caption = 'Faixa inicial $'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 115
            Top = 7
            Width = 70
            Height = 13
            Caption = 'Faixa final $'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbldesc: TLabel
            Left = 201
            Top = 7
            Width = 68
            Height = 13
            Caption = 'Desconto %'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 91
            Top = 26
            Width = 19
            Height = 13
            Caption = 'at'#233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 91
            Top = 55
            Width = 19
            Height = 13
            Caption = 'at'#233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 91
            Top = 84
            Width = 19
            Height = 13
            Caption = 'at'#233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtdesc1: TMaskEdit
            Left = 201
            Top = 23
            Width = 57
            Height = 24
            Enabled = False
            TabOrder = 0
          end
          object edtfaixafim1: TMaskEdit
            Left = 114
            Top = 23
            Width = 79
            Height = 24
            Enabled = False
            TabOrder = 1
          end
          object edtfaixaini1: TMaskEdit
            Left = 7
            Top = 23
            Width = 79
            Height = 24
            Enabled = False
            TabOrder = 2
          end
          object edtfaixaini2: TMaskEdit
            Left = 7
            Top = 52
            Width = 79
            Height = 24
            Enabled = False
            TabOrder = 3
          end
          object edtfaixafim2: TMaskEdit
            Left = 114
            Top = 52
            Width = 79
            Height = 24
            Enabled = False
            TabOrder = 4
          end
          object edtdesc2: TMaskEdit
            Left = 201
            Top = 52
            Width = 57
            Height = 24
            Enabled = False
            TabOrder = 5
          end
          object edtdesc3: TMaskEdit
            Left = 201
            Top = 81
            Width = 57
            Height = 24
            Enabled = False
            TabOrder = 6
          end
          object edtfaixafim3: TMaskEdit
            Left = 114
            Top = 81
            Width = 79
            Height = 24
            Enabled = False
            TabOrder = 7
          end
          object edtfaixaini3: TMaskEdit
            Left = 7
            Top = 81
            Width = 79
            Height = 24
            Enabled = False
            TabOrder = 8
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Outros'
          ImageIndex = 4
          object Label21: TLabel
            Left = 13
            Top = 99
            Width = 211
            Height = 13
            Caption = 'Data m'#237'nima da consulta das vendas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object chexibiralerta: TCheckControle
            Left = 14
            Top = 2
            Width = 291
            Height = 17
            Caption = 'Exibir alerta ao entrar no sistema off-line'
            TabOrder = 0
            Encontrou = False
            Enter = True
            ClickAut = False
            TipoValor = varString
          end
          object chonlinevpn: TCheckControle
            Left = 14
            Top = 21
            Width = 218
            Height = 17
            Caption = 'Sistema funciona online (VPN)'
            TabOrder = 1
            OnClick = chonlinevpnClick
            Encontrou = False
            Enter = True
            ClickAut = False
            TipoValor = varString
          end
          object edtprazo: TMaskEdit
            Tag = 1
            Left = 14
            Top = 117
            Width = 77
            Height = 21
            EditMask = '!99/99/9999;1; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 2
            Text = '  /  /    '
            OnKeyDown = edtprazoKeyDown
          end
          object chexibirdevolucao: TCheckBoxOO
            Left = 14
            Top = 59
            Width = 272
            Height = 17
            Cursor = crHandPoint
            Caption = 'Exibir devolu'#231#245'es nos relat'#243'rios de vendas'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object chexibirtroca: TCheckBoxOO
            Left = 14
            Top = 78
            Width = 238
            Height = 17
            Cursor = crHandPoint
            Caption = 'Exibir trocas nos relat'#243'rios de vendas'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object chbuscaaltomatica: TCheckControle
            Left = 14
            Top = 40
            Width = 214
            Height = 17
            Caption = 'Busca autom'#225'tica na consulta'
            TabOrder = 5
            Encontrou = False
            Enter = True
            ClickAut = False
            TipoValor = varString
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Interface'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pagina3: TTabSheet
      Caption = 'Fiscal'
      ImageIndex = 5
      TabVisible = False
      object PageControl4: TPageControl
        Left = -4
        Top = -6
        Width = 533
        Height = 428
        ActivePage = TabSheet8
        OwnerDraw = True
        Style = tsButtons
        TabOrder = 0
        OnDrawTab = PageControl4DrawTab
        object TabSheet7: TTabSheet
          Caption = 'TabSheet7'
          TabVisible = False
          object LabelOO1: TLabelOO
            Left = 60
            Top = 118
            Width = 319
            Height = 13
            Cursor = crHandPoint
            Caption = 'a Forma de Pagamento Impressa no '#250'ltimo Cupom Fiscal'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 62
            Top = 160
            Width = 211
            Height = 13
            Caption = 'Imprimir Sangria na Impressora Fiscal'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LabelOO6: TLabelOO
            Left = 77
            Top = 209
            Width = 164
            Height = 13
            Caption = 'Modelo da Impressora Fiscal:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object chECFHabilitaFiscal: TCheckBox
            Left = 40
            Top = 42
            Width = 175
            Height = 17
            Cursor = crHandPoint
            Caption = 'Habilitar Impressora Fiscal'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = chECFHabilitaFiscalClick
            OnExit = chECFHabilitaFiscalExit
            OnKeyDown = chECFHabilitaFiscalKeyDown
          end
          object chBuscaCOO: TCheckBox
            Left = 40
            Top = 80
            Width = 393
            Height = 17
            Cursor = crHandPoint
            Caption = 'Sempre Buscar o C'#243'digo do Cupom Fiscal a partir da Impressora'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object chImprimeCupomNaoFiscalVinculado: TCheckBoxOO
            Left = 40
            Top = 101
            Width = 457
            Height = 17
            Cursor = crHandPoint
            Caption = 
              'Imprimir Cupom N'#227'o-Fiscal Vinculado com Informa'#231#245'es Adicionais s' +
              'obre'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object CkImpItemECF: TCheckBox
            Left = 41
            Top = 136
            Width = 385
            Height = 17
            Cursor = crHandPoint
            Caption = 'Imprimir '#205'tens da Impressora Fiscal durante a Venda'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object ImpSangEcf: TComboSql
            Left = 62
            Top = 177
            Width = 92
            Height = 21
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
            Items.Strings = (
              'Sim'
              'N'#227'o'
              'Perguntar')
            TipoCampo = varString
            Retorno = RCText
            IncluiValores = False
            Enter = True
          end
          object listaECFModeloImpressoraFiscal: TListBox
            Left = 29
            Top = 223
            Width = 266
            Height = 85
            Cursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 16
            Items.Strings = (
              'Bematech'
              'Urano - 2EFC'
              'Urano - 1EFC'
              'DataRegis'
              'Daruma - FS345')
            ParentFont = False
            TabOrder = 5
          end
          object rdECFPorta: TRadioGroup
            Left = 303
            Top = 216
            Width = 185
            Height = 92
            Cursor = crHandPoint
            Caption = 'Porta de Comunica'#231#227'o '
            ItemIndex = 1
            Items.Strings = (
              'COM1'
              'COM2'
              'COM3'
              'COM4')
            TabOrder = 6
          end
          object rdCodigoNoCupom: TRadioGroup
            Left = 29
            Top = 315
            Width = 268
            Height = 51
            Cursor = crHandPoint
            Caption = ' C'#243'digo de Barras Impresso no Cupom '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemIndex = 1
            Items.Strings = (
              'INTERNO'
              'EAN13')
            ParentFont = False
            TabOrder = 7
          end
          object rdECFModoVenda: TRadioGroup
            Left = 312
            Top = 313
            Width = 289
            Height = 54
            Cursor = crHandPoint
            Caption = ' Modo de Venda '
            Enabled = False
            ItemIndex = 1
            Items.Strings = (
              'Paralelo '#224' realiza'#231#227'o da venda'
              'No fechamento da venda')
            TabOrder = 8
            Visible = False
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 512
            Height = 25
            Alignment = taLeftJustify
            Caption = ' Impressora Fiscal'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
          end
          object Panel14: TPanel
            Left = 383
            Top = 378
            Width = 137
            Height = 23
            Cursor = crHandPoint
            BevelInner = bvRaised
            Caption = 'Outras Op'#231#245'es ->'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            OnClick = Panel14Click
          end
          object chECFhabilitaTEF: TCheckBox
            Left = 40
            Top = 61
            Width = 98
            Height = 17
            Cursor = crHandPoint
            Caption = 'Habilitar TEF'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'TabSheet8'
          ImageIndex = 1
          TabVisible = False
          object Label10: TLabel
            Left = 168
            Top = 360
            Width = 254
            Height = 16
            Caption = 'Intervalo entre um comando para a Ecf'
          end
          object Label11: TLabel
            Left = 357
            Top = 384
            Width = 63
            Height = 16
            Alignment = taRightJustify
            Caption = 'Segundos'
          end
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 525
            Height = 25
            Align = alTop
            Caption = 
              'Relacionamento entre Formas de Pagamentos do Sistema e da Impres' +
              'sora Fiscal'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel16: TPanel
            Left = 4
            Top = 376
            Width = 95
            Height = 23
            Cursor = crHandPoint
            BevelInner = bvRaised
            Caption = '<- Voltar'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = Panel16Click
          end
          object FormasPagamentoEcf: TGridSql
            Left = 0
            Top = 25
            Width = 525
            Height = 152
            Hint = 'Selecione as formas de pagamento que abrir'#227'o a gaveta'
            ColCount = 3
            DefaultRowHeight = 18
            FixedCols = 2
            RowCount = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clBtnText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goEditing]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnKeyDown = FormasPagamentoEcfKeyDown
            OnKeyPress = FormasPagamentoEcfKeyPress
            OnSelectCell = FormasPagamentoEcfSelectCell
            Limite = 2
            CtrlDelete = True
            IncluiLinha = True
            OnGetCellColor = FormasPagamentoEcfGetCellColor
            SaiemBranco = True
            PosicionaLinha = 0
            PosicionarLinha = False
            MovMouseLinha = False
            ColChaves = '0'
            AndaProLado = True
            TituloHorizontal.Strings = (
              'C'#243'digo do Sistema'
              'Descri'#231#227'o'
              'C'#243'digo da Ecf')
            ColunaMarcada = 0
            F3Editor = False
            OnMontaGridDataSet = FormasPagamentoEcfMontaGridDataSet
            ColWidths = (
              133
              244
              132)
            RowHeights = (
              18
              16)
          end
          object Panel17: TPanel
            Left = 0
            Top = 178
            Width = 525
            Height = 25
            Caption = 
              'Relacionamento entre Al'#237'quotas de ICMS do Sistema e da Impressor' +
              'a Fiscal'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object AliquotasEcf: TGridSql
            Left = 0
            Top = 203
            Width = 525
            Height = 152
            Hint = 
              'Utilize o c'#243'digo do sistema como -1 para Isento e -2 para substi' +
              'tui'#231#227'o tribut'#225'ria'
            ColCount = 2
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clBtnText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goEditing]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            CtrlDelete = True
            IncluiLinha = True
            OnGetCellAlignment = AliquotasEcfGetCellAlignment
            SaiemBranco = True
            PosicionaLinha = 0
            PosicionarLinha = False
            MovMouseLinha = False
            ColChaves = '0'
            AndaProLado = True
            TituloHorizontal.Strings = (
              'Percentual do Sistema'
              'C'#243'digo na Impressora Fiscal')
            ColunaMarcada = 0
            F3Editor = False
            ColWidths = (
              238
              274)
            RowHeights = (
              18
              16)
          end
          object TempoIntervEcf: TEditControle
            Left = 272
            Top = 379
            Width = 79
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnKeyDown = TempoIntervEcfKeyDown
            Obrigatorio = False
            Posicao = 0
            Encontrou = False
            Tipo = tpDecimal
            Alignment = taRightJustify
          end
        end
      end
    end
    object pagina4: TTabSheet
      Caption = 'Movimento'
      ImageIndex = 6
      TabVisible = False
      object Label13: TLabel
        Left = 50
        Top = 359
        Width = 408
        Height = 14
        Caption = 
          '(ATEN'#199#195'O: Exibir a barra de progresso pode reduzir velocidade no' +
          ' processamento)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rdTipoExp: TRadioGroup
        Left = 22
        Top = 32
        Width = 489
        Height = 53
        Cursor = crHandPoint
        Caption = ' Envio/Recebimento do Movimento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Via Email / Aplicativo de Transfer'#234'ncia'
          'Via FTP')
        ParentFont = False
        TabOrder = 0
      end
      object chExportacaoProgresso: TCheckBoxOO
        Left = 31
        Top = 343
        Width = 401
        Height = 17
        Cursor = crHandPoint
        Caption = 'Exibir sempre a barra de progresso nas Exporta'#231#245'es e Importa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object PageControl2: TPageControl
        Left = 23
        Top = 92
        Width = 489
        Height = 246
        Cursor = crHandPoint
        ActivePage = TabSheet2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OwnerDraw = True
        ParentFont = False
        TabIndex = 0
        TabOrder = 2
        OnDrawTab = PageControl2DrawTab
        object TabSheet2: TTabSheet
          Caption = 'Pasta de destino da Exporta'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          object edtLocalExportacao: TMaskEdit
            Left = 5
            Top = 6
            Width = 471
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnEnter = edtLocalExportacaoEnter
            OnKeyDown = edtLocalExportacaoKeyDown
          end
          object ListaDiretorio: TDirectoryListBox
            Left = 4
            Top = 28
            Width = 472
            Height = 159
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 16
            ParentFont = False
            TabOrder = 1
            OnChange = ListaDiretorioChange
          end
          object DriveComboBox1: TDriveComboBox
            Left = 4
            Top = 187
            Width = 472
            Height = 22
            DirList = ListaDiretorio
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Configura'#231#227'o do FTP'
          ImageIndex = 1
          object Label29: TLabel
            Left = 17
            Top = 15
            Width = 136
            Height = 13
            Caption = 'Endere'#231'o do FTP (host)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 16
            Top = 59
            Width = 144
            Height = 13
            Caption = 'Nome do Usu'#225'rio (userid)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 191
            Top = 59
            Width = 102
            Height = 13
            Caption = 'Senha (password)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 16
            Top = 105
            Width = 198
            Height = 13
            Caption = 'Diret'#243'rio inicial no servidor de FTP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 16
            Top = 148
            Width = 413
            Height = 13
            Caption = 
              '(Alguns servidores de FTP exigem a adi'#231#227'o de uma barra invertida' +
              ' (/) antes do diret'#243'rio)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edtHostFtp: TEdit
            Left = 16
            Top = 30
            Width = 417
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 80
            ParentFont = False
            TabOrder = 0
            OnEnter = edtHostFtpEnter
            OnKeyDown = edtHostFtpKeyDown
          end
          object edtUserid: TEdit
            Left = 16
            Top = 75
            Width = 168
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 80
            ParentFont = False
            TabOrder = 1
            OnEnter = edtUseridEnter
            OnKeyDown = edtUseridKeyDown
          end
          object edtSenha: TEdit
            Left = 187
            Top = 75
            Width = 153
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 80
            ParentFont = False
            PasswordChar = 'x'
            TabOrder = 2
            OnEnter = edtSenhaEnter
            OnKeyDown = edtSenhaKeyDown
          end
          object edtDiretorioInicial: TEdit
            Left = 16
            Top = 120
            Width = 412
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 80
            ParentFont = False
            TabOrder = 3
            OnEnter = edtDiretorioInicialEnter
            OnKeyDown = edtDiretorioInicialKeyDown
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Movimento'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object exploja_allcli: TCheckBoxOO
        Left = 32
        Top = 377
        Width = 401
        Height = 17
        Cursor = crHandPoint
        Caption = 'Exportar Clientes sem Compra (Credi'#225'rio)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object CkExcImp: TCheckBoxOO
        Left = 32
        Top = 396
        Width = 529
        Height = 17
        Cursor = crHandPoint
        Caption = 
          'Manter Registros de Tabelas n'#227'o Relacionadas a Produtos na Impor' +
          'ta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object pagina5: TTabSheet
      Caption = 'Diret'#243'rios'
      ImageIndex = 6
      TabVisible = False
      object Bevel11: TBevel
        Left = 12
        Top = 40
        Width = 501
        Height = 124
        Shape = bsFrame
      end
      object Label26: TLabel
        Left = 32
        Top = 56
        Width = 262
        Height = 13
        Caption = 'Arquivo execut'#225'vel do word (qualquer vers'#227'o)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnProcurarWord: TSpeedButton
        Left = 394
        Top = 72
        Width = 33
        Height = 24
        Cursor = crHandPoint
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
      end
      object Label17: TLabel
        Left = 32
        Top = 106
        Width = 348
        Height = 13
        Caption = 'Diret'#243'rio dos arquivos de imagens (adicione uma "\" no final)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtWinWord: TEdit
        Left = 32
        Top = 71
        Width = 361
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = edtWinWordEnter
        OnKeyDown = edtWinWordKeyDown
      end
      object edtPathImagem: TEdit
        Left = 32
        Top = 121
        Width = 361
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnEnter = edtPathImagemEnter
        OnKeyDown = edtPathImagemKeyDown
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Diret'#243'rios'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object pagina6: TTabSheet
      Caption = 'Video'
      ImageIndex = 6
      TabVisible = False
      object LabelOO3: TLabelOO
        Left = 224
        Top = 72
        Width = 92
        Height = 16
        Caption = '- ENTRADA -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOO4: TLabelOO
        Left = 232
        Top = 269
        Width = 64
        Height = 16
        Caption = '- SA'#205'DA -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object rdVideoEntrada: TRadioGroup
        Left = 28
        Top = 87
        Width = 473
        Height = 40
        Cursor = crHandPoint
        Caption = 'Resolu'#231#227'o de video'
        Columns = 5
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          '640x480 '
          '800x600'
          '1024x768'
          '1280x1024'
          '1440x900')
        ParentFont = False
        TabOrder = 0
      end
      object rdCoresEntrada: TRadioGroup
        Left = 28
        Top = 130
        Width = 473
        Height = 113
        Cursor = crHandPoint
        Caption = 'Cores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          '16 cores (4 bits)'
          '256 cores (8 bits)'
          'High color (16 bits)'
          'True color (32 bits)')
        ParentFont = False
        TabOrder = 1
      end
      object rdVideoSaida: TRadioGroup
        Left = 28
        Top = 286
        Width = 473
        Height = 40
        Cursor = crHandPoint
        Caption = 'Resolu'#231#227'o de video'
        Columns = 5
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          '640x480 '
          '800x600'
          '1024x768'
          '1280x1024'
          '1440x900')
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object rdCoresSaida: TRadioGroup
        Left = 28
        Top = 329
        Width = 473
        Height = 80
        Cursor = crHandPoint
        Caption = 'Cores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          '16 cores (4 bits)'
          '256 cores (8 bits)'
          'High color (16 bits)'
          'True color (32 bits)')
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object chModificarVideo: TCheckBox
        Left = 36
        Top = 41
        Width = 373
        Height = 17
        Cursor = crHandPoint
        Caption = 'Modificar resolu'#231#227'o de video durante a execu'#231#227'o do sistema'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Video'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object pagina7: TTabSheet
      Caption = 'SLIPS'
      ImageIndex = 6
      TabVisible = False
      object Bevel5: TBevel
        Left = 23
        Top = 111
        Width = 488
        Height = 47
      end
      object LabelOO2: TLabelOO
        Left = 81
        Top = 130
        Width = 180
        Height = 13
        Caption = 'Qtde. de Linhas entre os SLIPS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chSlipNaTela_TRANSFERENCIA: TCheckBox
        Left = 23
        Top = 49
        Width = 381
        Height = 17
        Cursor = crHandPoint
        Caption = 'Exibir SLIP de Transfer'#234'ncia na Tela antes da Impress'#227'o '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtQtdeLinhas_TRANSFERENCIA: TMaskEditOO
        Left = 37
        Top = 123
        Width = 36
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 1
        Text = ' 5'
        OnEnter = edtQtdeLinhas_TRANSFERENCIAEnter
        OnKeyDown = edtQtdeLinhas_TRANSFERENCIAKeyDown
        zFieldTypeOO = ftInteger
        zFieldLengthOO = 2
        zTipoOO = -1
        zTipoPesquisaF8 = False
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Slips'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object chSlipNaTela_COMPROVANTE: TCheckBox
        Left = 23
        Top = 75
        Width = 381
        Height = 17
        Cursor = crHandPoint
        Caption = 'Exibir SLIP de Comprovante na Tela antes da Impress'#227'o '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object Pagina8: TTabSheet
      Caption = 'Gaveta'
      ImageIndex = 7
      TabVisible = False
      object Label7: TLabel
        Left = 50
        Top = 400
        Width = 412
        Height = 14
        Alignment = taRightJustify
        Caption = 
          'Utilize o duplo-clique do Mouse ou <Ctrl+M> para Selecionar as F' +
          'ormas de Pagamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Gaveta'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel13: TPanel
        Left = -15
        Top = 27
        Width = 488
        Height = 18
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object CkGaveta: TCheckControle
          Left = 127
          Top = 2
          Width = 289
          Height = 17
          Caption = 'Habilitar Gaveta'
          TabOrder = 0
          Encontrou = False
          Enter = False
          ClickAut = False
          TipoValor = varString
        end
      end
      object FpGaveta: TGridSql
        Left = 111
        Top = 49
        Width = 280
        Height = 344
        Hint = 'Selecione as formas de pagamento que abrir'#227'o a gaveta'
        Color = clTeal
        ColCount = 3
        DefaultRowHeight = 18
        FixedColor = clTeal
        FixedCols = 0
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goRowSelect]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Limite = 1
        PosicionaLinha = 0
        PosicionarLinha = False
        MovMouseLinha = False
        AndaProLado = False
        TituloHorizontal.Strings = (
          '*'
          'Formas de Pagamento')
        Marcador = True
        ColunaMarcada = 0
        F3Editor = False
        OnMontaGridDataSet = FpGavetaMontaGridDataSet
        ColWidths = (
          14
          259
          64)
        RowHeights = (
          18
          16)
      end
    end
    object Pagina9: TTabSheet
      Caption = 'Pagina9'
      ImageIndex = 8
      TabVisible = False
      object Panel18: TPanel
        Left = 0
        Top = 0
        Width = 512
        Height = 25
        Alignment = taLeftJustify
        Caption = ' Outras'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 33
        Width = 481
        Height = 113
        Caption = ' Consulta de Estoque da Loja(s) '
        TabOrder = 1
        object CkConsEstoqOutras: TCheckBox
          Left = 11
          Top = 23
          Width = 441
          Height = 17
          Cursor = crHandPoint
          Caption = 'Permitir Consulta do Estoque de Outras Lojas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = chECFHabilitaFiscalClick
          OnExit = chECFHabilitaFiscalExit
          OnKeyDown = chECFHabilitaFiscalKeyDown
        end
        object CkConsEstoqLoja: TCheckBox
          Left = 11
          Top = 42
          Width = 423
          Height = 17
          Cursor = crHandPoint
          Caption = 'Permitir Consulta do Estoque desta Loja'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object CkConsEstoqQtd: TCheckBoxOO
          Left = 11
          Top = 62
          Width = 126
          Height = 17
          Cursor = crHandPoint
          Caption = 'Exibir Quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object CkConsEstoqPrc: TCheckBox
          Left = 11
          Top = 81
          Width = 94
          Height = 17
          Cursor = crHandPoint
          Caption = 'Exibir Pre'#231'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 148
        Width = 482
        Height = 89
        Caption = ' Configura'#231#245'es Consulta Externas (Credi'#225'rio) '
        TabOrder = 2
        object CheckCheckCont: TCheckBox
          Left = 11
          Top = 42
          Width = 401
          Height = 17
          Caption = 
            'Habilitar Consulta Automatica na Inclus'#227'o e Altera'#231#227'o de Contrat' +
            'os'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object CheckCheckConsCli: TCheckBox
          Left = 11
          Top = 22
          Width = 401
          Height = 17
          Caption = 
            'Habilitar Consulta Automatica nas Consultas Financeiras de Clien' +
            'tes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object chHabilitavalidacoes: TCheckBox
          Left = 11
          Top = 62
          Width = 300
          Height = 17
          Caption = 'Criticar endere'#231'os no Cadastro de Cliente'
          TabOrder = 2
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 41
    Align = alTop
    Color = clTeal
    TabOrder = 1
    object Image2: TImage
      Left = 3
      Top = 2
      Width = 727
      Height = 38
      Picture.Data = {
        07544269746D61705A590100424D5A5901000000000036000000280000001C03
        000025000000010018000000000024590100120B0000120B0000000000000000
        0000808000808000808000808000808000808000808000808100818101818102
        8181028181028182038182038282038282048282048382048282058283058383
        0683830784830783830783840784840884840884840985840984840985850A85
        850A86850B85850A85860B86860B86860C86860C86870D87860D86870E87870E
        87870F87880F88880F8888108888108988118989118989118989128989128A89
        128989138989138A8A148A89158A8A158B8B158A8B158B8B168C8A178B8B178C
        8B178C8B178C8C188C8C198C8C198C8C198D8C1A8C8C1A8D8D1A8D8D1A8E8E1B
        8E8E1C8E8E1C8E8E1C8E8E1D8F8E1D8F8F1D8F8F1E908F1E8F8F1F908F1F9090
        1F90902090902091902091902291912191912291912391912391912391922392
        9224929224929225939225939326939326939327939427939328949328949428
        94942894942994942995952A95952A95952B96952B95962C95952C96952D9696
        2C96962C97962D97962E98962E97972F98972F98973097983098973098983098
        98319998319998329998329999339A99339A99349A99339A9A349A9A349B9A35
        9B9A359A9B369B9B369B9B379C9B379C9B379C9B389C9B389C9C399D9C399D9C
        3A9D9C3A9D9D3A9D9D3A9D9D3B9E9D3C9D9E3B9E9E3C9F9E3C9F9E3D9E9E3E9F
        9E3E9F9E3EA09F3E9F9F3FA09F3FA0A040A09F40A1A041A1A041A0A041A1A042
        A1A142A1A142A1A143A2A144A2A144A2A145A2A244A2A245A3A245A3A346A3A3
        46A3A346A4A347A4A348A4A348A4A449A5A448A5A449A5A449A5A44AA5A44BA5
        A54AA5A54BA6A54BA6A64CA6A54DA7A64DA7A64EA7A64EA7A74EA8A64FA8A74F
        A8A750A8A750A8A850A8A851A9A851A8A851A9A852A9A853A9A952AAA952A9A9
        53AAA954ABAA55AAA954AAAA54ABAA55ABAA56ABAA56ABAB57ACAB57ACAB57AC
        AB58ACAB58ACAB59ADAB59ACAC59ADAC59ADAC5AADAD5BAEAD5BAEAD5BAEAD5C
        AEAD5DAEAE5DAEAE5DAFAE5DAFAE5EAFAE5FAFAF5FB0AF5FAFAF60B0AF60B0AF
        61B0B061B1B061B1B061B1B061B1B162B2B163B2B063B2B164B2B264B2B165B2
        B164B2B265B3B266B3B366B3B366B3B367B4B367B3B367B4B368B5B369B4B468
        B5B369B5B46AB5B46AB5B46AB5B56BB5B56BB6B56BB6B56CB6B56DB7B66CB7B6
        6DB7B66EB7B66EB7B66EB8B76FB8B76FB8B770B8B770B8B771B8B771B9B772B8
        B872B9B873B9B873BAB872B9B973BAB974BAB974BABA74BBB975BAB975BBBA75
        BBBA76BBBA77BCBB77BCBB77BCBB77BCBC78BCBC78BCBB79BCBC79BDBC7ABDBC
        7ABDBD7BBDBD7BBEBC7BBEBD7CBEBD7CBEBD7DBFBE7DBFBD7DBFBE7EBFBE7EBF
        BF7FBFBE7FBFBF7FC0BF80C0BF80C0BF81C1C081C1BF81C0C082C2C082C1C082
        C1C183C2C083C2C184C2C184C3C185C3C285C3C285C3C285C3C386C3C287C3C2
        87C4C387C4C388C5C389C5C389C4C389C5C489C5C48AC5C48AC6C48BC6C48CC6
        C58CC6C58CC6C58CC6C68DC7C68DC7C58EC7C68EC7C68EC7C78FC8C78FC8C68F
        C8C790C8C790C8C790C8C791C9C892C9C792C9C892C9C893CAC894CAC994CAC9
        94CAC995CBC995CACA95CBC996CBCA96CBCA96CBCA97CBCA97CBCB98CCCB98CC
        CB99CDCB99CDCC99CDCC9ACDCC9ACDCC9BCDCC9BCDCD9BCECD9CCECD9CCECD9C
        CECD9DCECE9ECFCD9ECFCE9ECFCE9ED0CE9FD0CE9FD0CFA0D0CFA0D1CFA1D1CF
        A1D1D0A1D0CFA2D1D0A2D1D0A3D2D0A3D1D0A4D2D0A4D2D1A4D2D1A4D3D1A5D3
        D1A5D3D1A6D3D2A7D3D2A6D3D2A7D4D3A7D4D2A8D4D2A9D4D3A9D5D4A9D5D3AA
        D5D4AAD5D4ABD5D4ABD5D5ABD5D4ABD6D4ACD6D4ADD7D5ADD7D5ADD7D6ADD7D5
        AED7D6AED7D6AED8D6AFD8D7B0D8D7B0D8D7B0D8D7B1D9D8B1D8D8B2D9D8B2D9
        D8B2D9D8B3DAD9B3DAD8B4DAD8B4DAD9B5DBD9B5DBD9B5DBD9B6DBDAB6DBDAB6
        DCDAB7DBDAB7DBDAB8DCDBB8DCDBB9DDDBB9DCDBB9DDDBB9DDDCBADDDBBADEDC
        BBDEDDBBDEDDBCDEDCBCDEDDBDDEDDBDDEDEBEDFDDBEDFDDBEDFDEBFDFDEBFE0
        DEC0E0DFC0E0DEC1E0DFC0E1DFC0E0DFC2E1DFC2E1E0C2E1E0C2E1E0C3E2E0C3
        E2E0C4E2E1C4E3E1C4E3E1C5E3E1C6E3E2C6E3E2C6E3E2C6E3E2C7E4E2C7E4E2
        C8E4E2C9E4E3C9E5E2C9E4E4C9E5E3CAE5E4CAE6E4CBE6E4CBE6E4CBE6E5CCE6
        E5CCE7E4CCE6E5CDE7E5CDE6E5CEE7E6CEE7E5CEE7E6CFE8E7D0E7E7D0E8E7D0
        E8E6D1E9E6D1E9E7D2E9E7D2E9E7D2E9E7D2E9E8D3EAE8D4EAE9D4EAE8D5EAE8
        D5EBE9D5EBE9D6EBE9D6EBEAD6ECEAD7EBEAD7EBEAD7ECEAD8ECEAD9ECEAD9EC
        EBD9EDEBD9EDECDBEDEBDAEDEBDBEEECDBEEECDCEEECDCEEEDDCEEECDDEFECDE
        EFEDDEEFEDDEEFEEDFF0EDDFF0EEDFF0EEE0F0EEE0F1EFE1F1EEE1F1EFE2F1EF
        E2F1EFE2F1EFE2F1EFE3F1F0E3F2F0E3F2F0E4F3F0E5F2F1E5F3F1E5F3F1E5F3
        F2E6F3F1E7F3F2E7F3F2E7F4F2E8F4F2E8F4F2E8F5F2E8F5F3E9F5F3EAF5F3EA
        F5F4EBF6F4EBF5F4ECF6F4ECF6F5ECF7F5EDF6F4EDF6F5EEF7F5EDF7F5EEF8F6
        EEF8F5F0F8F5EFF8F6F0F8F6F0F8F6F1F8F6F2F9F7F1F9F7F2F9F7F3F9F8F2F9
        F8F3FAF8F3FAF8F4FAF8F4FAF8F5FAF9F5FAF9F6FBF9F6FBF9F6FCF9F6FCFAF7
        FBF9F7FCFAF8FCFAF8FDFAF9FDFBF9FDFBF9FDFBFAFDFBFBFEFBFBFEFBFBFEFB
        FCFEFCFCFEFCFCFEFDFDFEFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE80800080800080800080
        8000808000808000808000808000818000818002818101818102818102828203
        8281038282048282048282048382058382068283058383068383068383068383
        0784840884840884840985840984840A85840A85850B85850A85850B86860C86
        850B86860C86860D87860D86860D87870E87870E87870E88870F888810888810
        888810888911888811898811888912898912898913898A148A89138A8A148A8A
        148B8A158B8A158B8B158B8B168B8B168C8C168C8C178C8C178C8B188D8C188C
        8C198C8C198D8D198D8C1A8D8D1A8D8D1B8D8E1B8E8E1B8E8E1C8E8E1D8E8E1D
        8E8E1D8E8E1E8F8F1E8F8F1F8F8F1F8F901F908F1F908F1F9090219190219090
        2191912291902291912391922392912392912392922492912593922592922593
        922693922693932693932794932894932894942894932894942995942995952A
        95952A96952A95952B96952B96952B96962C96962D96962D97962E97962E9797
        2F97972F97972F97972F98973098983098983199983199983199983299993299
        99329A99339A99349A99349A99349A9A349A9A359B9A359B9A369B9B369B9B36
        9C9B379C9B379C9B389C9C389C9C389C9C399C9D399D9C3A9D9C3A9D9D3A9D9D
        3B9E9D3C9E9D3C9E9E3C9E9E3C9E9E3D9F9E3E9F9E3EA09E3E9F9F3F9F9F3F9F
        A040A09F40A09F40A1A041A0A041A1A042A1A042A1A042A1A143A2A143A2A143
        A2A244A2A244A3A144A3A245A2A346A3A345A4A346A3A347A3A348A3A448A4A4
        48A4A348A5A449A4A449A4A44AA6A44AA6A54AA6A54AA5A54BA6A64CA6A54CA6
        A64CA7A64DA6A64DA6A64DA7A74EA7A74FA8A74FA8A74FA8A750A8A750A8A851
        A8A851A9A851A9A852A9A852A9A853A9A853AAA953AAA953AAA954AAAA55ABAA
        55ABAA55ABAA56ABAB56ABAB56ABAB57ACAB58ACAB58ACAB59ACAC59ACAC59AC
        AC5AACAC5AADAC5AADAD5BAEAC5BAEAD5BAEAD5BAFAD5DAEAE5DAEAE5DAFAE5E
        AFAE5EAFAF5EAFAF5FAFAF5FB0AF60B0AF60B1AF61B0AF61B1B061B1B061B1B0
        62B1B163B1B063B1B063B1B164B2B264B3B164B2B264B2B265B2B265B3B265B3
        B366B3B367B3B367B4B368B4B368B4B468B4B369B5B46AB5B469B5B46AB5B46B
        B5B46BB6B46BB6B56CB6B56CB7B56CB6B56DB7B66DB7B66DB7B66EB7B66EB7B6
        6FB8B76FB8B76FB8B770B8B770B9B771B9B871B9B872B9B872B9B872BAB873BA
        B974BAB973BAB974BAB974BAB975BABA75BBBA76BBBA76BBBA77BCBA77BCBB77
        BCBB77BDBB78BCBB78BDBC79BDBB7ABDBC79BDBC7ABEBC7BBEBC7BBEBD7BBEBD
        7CBEBD7CBEBE7DBFBD7DBFBE7EBFBE7EBFBE7EBFBF7FC0BF7FC0BE7FBFBF7FC0
        BF81C0C081C1C081C1C082C1C082C1C083C1C183C1C083C1C084C1C184C2C284
        C2C184C2C285C3C286C3C286C3C287C4C286C3C387C4C287C4C388C4C489C4C3
        89C5C389C5C48AC5C38AC5C48AC6C48BC6C58BC6C48BC6C58CC6C58DC7C68CC7
        C68EC7C58EC7C68EC7C68FC7C68FC8C68FC8C790C8C790C8C891C9C790C9C892
        C8C892C9C792CAC893C9C893CAC993CAC994CAC894CBC995CBC995CAC995CBCA
        96CBCA96CBCA97CBCA97CBCB97CCCA98CCCB98CCCC98CCCB99CDCB9ACDCB99CD
        CC9ACDCC9ACDCC9BCECD9BCECD9CCECC9CCFCD9CCECE9DCFCE9DCFCE9DCFCE9E
        CFCE9FCFCF9ED0CF9FD0CF9FD1CFA0D1CFA1D0D0A1D1D0A1D1D0A2D1CFA2D1D0
        A2D2D0A3D2D1A3D2D1A4D2D1A4D3D1A5D2D1A5D2D1A6D3D2A6D3D1A7D3D2A7D3
        D2A7D4D3A8D4D2A8D5D3A9D4D3A9D4D3A9D5D4A9D5D4AAD5D4AAD5D4AAD6D5AB
        D6D5ACD5D5ACD6D4ADD7D5ACD7D6ADD7D5ADD7D6AED7D6AFD7D6AFD7D6AFD8D6
        B0D8D6B0D8D7B1D8D7B1D8D7B1D9D8B2D9D8B2D9D8B3D9D8B2DAD8B3D9D8B3DA
        D9B4DAD9B5DAD9B5DBD9B5DBD9B6DBD9B6DBDAB7DCDAB7DCDAB8DCDAB7DCDBB8
        DCDBB8DCDBB9DDDBB9DDDCBADDDCBADDDCBADDDCBBDEDCBCDEDCBCDEDCBCDEDD
        BCDFDDBDDFDDBEDFDDBDDFDEBEDFDEBEDFDDBFE0DEBFDFDEC0E0DEC0E1DEC1E0
        DFC0E1DFC2E1DFC2E1E0C2E1E0C2E2E0C3E2E0C3E1E0C3E2E1C4E2E0C4E2E1C5
        E3E1C5E3E2C5E3E1C7E3E2C7E3E2C7E4E2C8E4E3C8E4E3C8E4E2C9E5E3C9E5E3
        CAE5E3CAE5E3CAE6E4CBE6E4CBE6E5CCE6E4CCE6E4CDE7E5CDE7E5CDE7E5CEE7
        E5CEE7E5CEE7E5CFE7E6CFE8E6CFE8E6D0E8E7D1E8E7D1E9E7D1E9E7D2E9E7D2
        EAE7D2E9E8D3E9E8D3EAE9D3EAE8D4EAE9D4EAE9D5EAE9D5EBE9D6EBEAD6EBEA
        D6ECE9D7EBEAD7ECEAD8ECEAD8ECEBD8ECEAD9ECEBD9EDEBD9EDECDAEDECDBEE
        ECDBEDECDBEEECDCEEECDCEEEDDCEEEDDDEFEDDDEEEDDDEFEDDEEFEEDFF0EDDF
        EFEEDFF0EFE0F0EFE0F0EFE1F0EFE1F0EEE1F1EFE2F1EFE2F2F0E2F1F0E3F2F0
        E3F2F0E4F2F0E4F2F0E5F2F1E5F2F1E5F3F1E6F3F1E6F3F1E7F3F2E7F4F2E7F4
        F2E8F4F2E8F4F2E9F4F2E9F4F3E9F4F3E9F6F3EAF6F3EBF6F4EBF6F3EBF6F4EC
        F6F5ECF7F4ECF6F5EDF6F5EEF7F5EEF7F5EEF7F5EEF8F6EFF8F6EFF8F6EFF8F6
        F0F8F7F1F9F7F1F9F6F2F9F7F1F9F7F2FAF7F3FAF8F3F9F7F3FAF8F3FAF8F4FA
        F8F5FBF8F5FBF8F6FBF9F6FCF9F6FCF9F7FCF9F7FCFAF7FCFAF8FCFBF8FCFAF8
        FCFBF9FDFBF9FDFBFAFDFBFAFEFBFBFDFCFBFEFCFBFEFCFCFEFDFCFFFCFCFEFC
        FDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFE80800080800080800080800080800080800080800080
        8001818100818101818102818102828103828102828103818204828204828205
        8383048382068383068383068383078483078483078484078484088484088484
        0984850985850A85850B85850B85860B85850C86860C86860C86860D86860D87
        870D86870D87870E88870F87880F88880F878810888811888810888811898912
        8988128989128989138989138A89138A8A148A8A148A8A148A8B158B8B168B8B
        168B8B178B8B168B8B178C8B188C8B188C8C188C8C198D8C198D8C198D8C1A8D
        8D1B8D8D1A8E8E1B8E8E1B8D8D1C8E8E1D8F8E1D8F8E1D8F8E1E8F8F1E8F8F1E
        8F901F8F901F8F9020908F209090209090219091219191229190229191239191
        2291912392922492912492922493922592922592922593932694932693932794
        932793942794932894942895942894942995942A95952A95952A96952B96952B
        96952B96962C97962D96962D96972D97962E97972E97972E97972F98972F9897
        309898319998309898319899329998329A99339999339999339A9A349A99349A
        9A349A9A359B9A359B9B359B9A369B9B369B9B369B9B379B9B379C9B389C9C38
        9D9C399D9C399D9D399D9C3A9D9C3A9E9D3B9D9D3B9E9D3C9E9D3B9E9E3C9E9E
        3C9E9E3D9F9F3E9F9E3E9F9E3FA09F3E9F9F3FA09F40A0A040A19F40A09F41A1
        A041A1A042A1A142A1A042A2A142A1A143A2A243A2A244A2A244A3A244A3A245
        A3A346A3A346A3A246A4A347A4A347A3A448A4A448A4A449A4A449A5A449A5A4
        4AA5A54AA5A54BA6A54AA6A54BA5A64CA6A54CA6A64DA6A64DA6A64DA7A74EA7
        A64EA7A74EA7A64FA7A750A8A750A8A850A8A851A8A851A9A851A9A852A9A852
        A9A953AAA953AAA953AAA954AAA955AAA954AAAA55AAAA55ABAA56ABAB56ABAA
        57ABAB57ABAB57ACAB58ACAB59ACAC58ACAC59ACAC59ADAC5AADAC5AAEAC5BAD
        AD5BAEAD5BAEAD5CAEAD5DAFAE5DAEAE5DAFAE5DAFAE5DB0AE5FAFAE5FAFAF5F
        B0AF60B0AF60B0AF61B0B061B0B061B1B062B1B062B1B062B2B062B2B163B2B1
        64B2B164B2B164B3B164B3B266B2B265B3B266B3B366B3B267B3B367B3B368B4
        B367B4B368B4B369B4B369B5B469B5B46AB5B56BB5B56BB6B56BB6B56CB6B56C
        B7B56CB7B56DB7B66DB7B66EB7B66EB7B66EB8B66FB8B66FB8B770B8B770B8B7
        70B9B771B9B871B9B872B9B872B9B873BAB872BAB974BAB974BAB974BAB975BA
        B975BAB975BBBA76BBBA76BBBA77BBBB77BBBA77BCBB78BCBB78BCBB78BDBB79
        BCBB79BDBC7ABDBC7BBDBC7ABDBD7BBDBC7BBEBD7CBEBD7CBEBD7CBFBD7DBFBD
        7DBFBE7EC0BE7EBFBE7EBFBF7FC0BF7FC0BF80C0BF80C0BF81C1C081C1C081C1
        C082C1C082C1C083C2C183C2C184C2C083C2C184C2C284C2C185C2C285C3C286
        C3C286C4C287C3C387C4C287C4C387C4C388C4C389C4C489C4C489C5C48AC5C4
        8AC6C48BC6C58BC6C58CC6C58CC6C58CC6C68DC7C58EC7C68DC7C68EC7C68FC8
        C68FC8C68FC8C790C8C790C8C791C8C791C8C792C9C792C9C892C9C993C9C993
        CAC894CAC994CAC994CACA94CAC995CACA95CBCA96CBCA96CCCA97CCCA97CCCB
        97CCCB98CCCB98CCCB98CDCB98CCCB99CDCB9ACDCC9ACECC9BCECC9BCECC9BCE
        CC9CCECC9CCECD9DCECD9DCFCE9DCFCE9ED0CE9ECFCE9FCFCE9FCFCE9FD0CEA0
        D1CEA0D0CFA0D0CFA1D0D0A1D1D0A2D1CFA2D1D0A2D1D1A3D1D1A4D2D0A4D2D1
        A4D3D1A5D3D1A5D3D2A6D3D1A6D3D2A6D3D2A6D4D3A7D4D3A8D4D3A8D4D3A8D5
        D3A9D5D3A9D5D3AAD5D3AAD5D3AAD6D4ABD6D5ABD5D5ABD6D5ACD6D5ACD6D5AD
        D7D5ADD6D5AED7D5AED8D6AED7D6AED8D6AFD8D7B0D8D7B0D8D7B0D9D7B1D9D7
        B1D9D7B1D9D8B2D9D8B3D9D8B3DAD8B3DAD9B4DAD9B4DAD9B4DAD9B4DBD9B5DB
        D9B6DBDAB6DBDAB6DCDAB7DCDAB8DCDBB8DCDAB9DCDBB8DDDBB8DDDBB9DDDBBA
        DDDCBADDDCBBDDDCBBDDDCBCDEDDBCDEDDBCDFDDBCDEDDBDDFDDBEDFDDBEDFDE
        BEDFDEBFDFDDBFE0DEBFE0DEBFE0DEC0E0DFC1E0DFC1E1DFC1E1DFC2E1DFC3E2
        E0C2E1E0C3E1E0C4E2E1C4E2E0C4E2E1C5E3E1C5E2E1C5E2E1C6E3E1C6E3E2C6
        E4E2C7E4E2C7E4E3C8E4E2C8E4E3C8E5E3C9E5E3CAE5E3CAE5E4CAE6E3CAE5E4
        CBE6E4CBE6E4CBE6E4CCE7E4CDE6E5CDE6E6CDE7E5CEE8E5CEE8E6CFE8E6D0E8
        E6CFE8E6D0E9E6D0E9E6D1E9E7D1E9E7D1E9E7D2E9E7D3E9E8D3EAE8D3EAE8D4
        EAE8D4EAE8D4EAE9D5EBE9D5EBE9D6EBE9D6EBEAD6ECEAD7EBEAD7ECEAD7ECEB
        D8ECEAD8ECEBD8ECEBD9EDEBDAEDEBDAEDEBDAEEECDAEDEBDCEEEDDCEEECDCEE
        EDDCEEECDCEFEDDDEFEDDEEFEEDEF0EEDEF0EDDFF0EEDFF0EEDFF0EEE0F0EFE0
        F0EFE1F1EFE2F1EFE1F1F0E2F1F0E3F1F0E3F2F0E4F2F0E3F2F0E4F3F1E4F3F1
        E5F3F1E5F3F1E6F3F1E6F4F1E6F4F2E7F3F1E7F4F2E8F4F2E8F5F2E9F5F3E9F5
        F3E9F5F3EAF5F3EAF5F4EBF6F4EBF6F4EBF6F4ECF6F4EDF7F4EDF7F5EDF7F5ED
        F7F5EEF7F5EEF7F6EEF8F6EFF7F6F0F8F6F0F8F6F1F8F7F0F8F7F1F8F7F1F9F7
        F1FAF7F3F9F7F3F9F8F3FAF8F4FAF8F4FAF8F4FBF8F5FBF9F5FBF9F5FBF9F6FB
        F9F7FCF9F6FCF9F7FCF9F8FCFAF8FDFAF8FDFAF9FDFAF9FCFAFAFDFBFAFEFCFB
        FEFBFBFEFCFBFEFCFCFEFCFCFFFCFCFEFDFDFEFDFDFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080
        0080800080800080800080800080800080800080800181810181810181810281
        8102828103818103818203828203828204828205828205828205838306848306
        83830784840784830784840784840884840884850984850984840A85850A8585
        0B85850B86850C86860C86860D86860C86870C86860D87870D88870E87870F87
        870E88870F888710888810888811898811898911888912898912898913898913
        8A8A148A8A148A8A148A8A158B8A158B8A158B8B168B8B168B8B168B8B178C8B
        188C8C188C8C188C8C198C8D198D8C1A8D8C1A8D8D1A8D8E1A8D8D1B8E8D1B8E
        8D1C8E8E1C8E8E1D8F8F1D8E8F1E8F8F1E8F8F1F908F1F908F1F909020909020
        9090209090219191219191229191229190229191239292239292239292249292
        2593922492932593932693932694932793932793932794942894932894942895
        942895952A94952A95952A95952B95952B96952B96952C96952C96962C97962D
        96962D97972E97972E97972F97972F98982F9898309898309998309998309998
        319999329998329999329999339A9A339A9A349A9A349A9A359A9A349B9B369B
        9B359B9A379C9B369B9B379C9C389C9B379C9B389D9B389C9C399C9C3A9D9D3A
        9D9D3A9D9D3B9D9D3B9D9D3B9E9E3C9E9D3C9E9D3D9F9E3D9F9E3D9F9E3E9F9F
        3F9F9F3EA09F3FA09F40A09F40A19F40A0A041A1A041A1A041A1A042A2A143A1
        A142A1A143A2A243A2A144A2A244A3A245A2A245A3A245A3A246A3A247A3A247
        A4A347A3A347A4A448A4A448A4A348A5A449A4A44AA5A44AA5A54AA5A54BA6A5
        4BA5A54CA6A54CA7A54DA7A64DA6A64DA7A64EA7A64EA7A74EA7A74FA7A74FA7
        A850A8A750A8A851A9A850A8A851A8A852A9A852A9A853A9A853A9A953AAA954
        ABAA54AAAA54ABAA55AAAA55ABAA56ABAB56ABAB57ABAA57ACAB58ACAC58ACAC
        59ACAC59ADAB59ADAC59ADAC59ADAC5AADAD5BADAD5BADAD5BAEAD5CAEAD5CAF
        AD5DAFAE5DAEAE5EAFAE5EAFAF5EAFAE5EAFAF5FB0AF60B0AF60B0AF60B0AF61
        B1B061B0B061B1B062B1B163B2B163B2B163B1B164B2B164B2B164B2B264B2B1
        65B3B266B3B266B3B266B3B367B4B267B4B367B4B368B4B469B4B469B4B369B5
        B46AB5B46AB5B46BB5B56BB6B56BB6B56CB6B66CB7B56DB6B56DB7B56DB7B66D
        B7B76EB7B66EB7B66FB7B770B8B76FB8B870B9B770B8B770B8B871B9B872B9B8
        72B9B873B9B873BAB973BAB973BAB974BABA75BBBA75BBBA75BBBA76BBBA76BB
        BA77BBBA76BCBA77BBBB78BCBB78BCBC79BDBC78BCBC7ABDBC7ABDBC7ABEBC7A
        BEBC7BBEBD7CBEBD7CBEBD7CBEBE7CBFBD7CBEBD7DBFBD7EBFBE7FBFBE7FBFBF
        7FBFBF7FC0BF80C0BF80C0BF81C0C081C1C081C1BF82C1C082C2C083C2C083C1
        C184C2C183C2C184C2C185C3C285C2C286C3C186C3C286C3C287C3C287C3C388
        C4C388C4C388C4C389C4C389C5C38AC5C48AC5C48AC6C58AC6C48BC6C48BC6C4
        8CC7C58CC7C58CC6C58DC6C68DC7C68EC7C68EC8C78FC8C78FC8C78FC8C790C9
        C791C8C890C9C891C9C892C9C892C9C892CAC893C9C893C9C994CAC994CAC994
        CAC995CAC996CBC995CBCA96CBCA97CBCB97CCCB97CCCB98CCCB98CCCC99CDCB
        99CDCB9ACDCC99CDCC9ACDCC9BCDCC9BCECC9BCDCD9CCECD9CCECD9DCECE9DCF
        CD9DCFCE9ECFCD9ED0CE9ECFCE9FD0CEA0D0CEA0D0CFA0D0CFA0D1CFA1D1D0A1
        D1CFA1D1D0A2D1D0A3D1D1A3D2D1A4D2D1A4D2D1A4D3D1A5D2D1A5D2D1A6D3D1
        A6D3D2A7D3D2A7D3D2A8D4D2A8D4D2A8D4D2A8D4D3A9D4D4A9D5D4AAD5D3A9D5
        D3AAD5D4ABD6D5ABD6D4ABD6D4ACD6D5ADD7D5ACD7D5ADD7D5AED6D5AED7D6AF
        D7D6AFD8D6B0D7D6AFD8D7B0D8D6B1D8D7B0D9D7B1D8D7B2D9D8B2DAD7B3D9D8
        B2D9D8B3DAD8B3DAD8B3DAD9B5DBD9B5DAD9B5DAD9B5DBD9B6DBDAB7DCDAB7DC
        DAB8DBDBB8DCDBB8DCDBB9DCDBB8DCDBB9DDDBB9DDDCBADDDCBBDDDCBBDEDCBB
        DEDCBCDEDCBCDEDDBDDEDDBDDFDDBDDFDDBEDFDEBEE0DDBFDFDEBFE0DEC0DFDE
        BFE0DEC0E1DFC0E0DFC0E1DFC2E1DFC2E1E0C3E1DFC2E1E0C3E2E0C4E2E0C4E2
        E0C4E3E1C5E2E1C5E3E1C6E3E1C6E3E2C6E4E2C7E3E2C7E4E2C7E4E3C8E4E2C8
        E4E2C8E4E3C9E5E3C9E5E4CAE5E4CBE5E4CBE5E4CBE6E4CBE6E4CCE6E4CDE6E5
        CDE6E5CDE7E5CEE7E6CEE7E5CEE8E6CEE8E5CFE7E6CFE8E6D0E9E6D0E8E7D0E9
        E7D1E9E7D1E9E7D1EAE7D2E9E8D3EAE8D4EAE8D4EAE8D4EAE9D4EAE9D5EBE9D5
        EBE9D6EBE9D6EBE9D7EBEAD7ECEAD7ECEAD7ECEAD8ECEAD9ECEAD9ECEAD9EDEB
        D9EDEBDAEDEBDBEEEBDBEEECDBEEECDBEEEDDCEFECDCEFEDDDEFEDDEEFEEDDEF
        EEDEEFEEDEEFEEDFF0EEE0F0EEDFF0EFE0F0EFE0F1EFE1F1EFE1F1EFE1F1EFE2
        F1EFE2F2F0E3F1F0E4F2F0E4F2F0E4F3F1E5F3F1E5F2F1E6F3F1E6F3F1E6F4F1
        E6F4F2E7F4F2E8F4F2E7F5F2E9F4F2E8F5F3E9F5F3EAF4F3E9F5F3EAF6F4EAF6
        F4EBF6F4EBF5F4ECF6F5EDF6F4EDF7F5EDF7F5EEF7F6EEF7F6EEF7F5EFF8F5EF
        F8F6EFF8F6F0F8F6F0F9F6F1F9F7F1F9F6F1F9F7F2F9F8F3F9F8F3FAF7F3FAF8
        F3FAF8F4FBF8F4FAF8F5FBF8F6FBF9F5FBF9F6FBF9F6FBF9F7FBFAF7FCF9F8FC
        FAF8FCFAF8FDFBF8FDFBFAFDFAFAFDFBFAFDFBFAFDFBFBFEFBFBFEFCFBFEFCFC
        FEFCFDFEFDFDFFFDFDFEFDFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080008080008080008080008080
        0080800080800080810080810081800181800181810282810381820381810382
        8203828204828205838205838306838305838306848306838407838308838408
        84840884840984850985840985850A85850A85850B86850B86860B86850B8686
        0C86870D87860D87870D87870E87870E87870E88880F88870F88880F88881089
        8811888811888911898912898913898A12898913898A148A89148B8A148A8A14
        8B8B158A8B158B8B168C8B178B8B168C8B188C8B178C8C188C8B198C8C198C8C
        198D8D198C8D1A8E8D1A8E8D1A8E8E1B8E8D1B8E8E1C8E8E1C8E8E1D8F8F1D8F
        8E1D8F8F1E8F8F1E8F8F1F8F8F208F901F908F1F909021909021919021919021
        9190229291239191239291249292249291249292249292259392259293269393
        2693932694932793932794942894942995942994942894952995952995942A95
        952A96952B96952B96952B96952C96962C97962D96962D97972D97972F98972E
        97972F9897309898309897309998309898309998329998329999329A99339A9A
        339A99339A9A349A9A359A9A359A9A359B9A359B9A369B9B369C9A369B9B379B
        9B379C9C379C9C389C9C399D9C3A9C9C3A9D9C3A9D9D3B9D9C3A9D9D3B9E9D3C
        9E9E3C9E9E3C9E9E3C9F9E3D9F9F3D9F9E3E9F9E3E9F9E3EA09F409F9F3FA0A0
        40A09F40A0A040A0A041A1A042A1A042A2A142A1A143A1A143A1A144A2A144A2
        A244A2A245A2A245A3A345A3A346A3A346A4A247A4A347A4A348A4A448A4A348
        A5A449A5A449A4A44AA5A54AA5A54AA5A54BA6A54BA6A54BA6A54CA6A64CA6A6
        4DA7A64DA7A64EA7A64EA7A74EA8A74FA8A74FA8A750A8A750A8A750A8A851A9
        A852A9A852A9A852A9A852AAA953AAA954A9A953AAAA54AAA954ABAA55AAAA55
        ABAA56ABAA56ABAA57ABAB57ACAB57ACAB58ACAB58ADAB59ACAC59ADAC5AADAC
        5AADAC5AAEAC5BADAD5BAEAD5BADAE5CAEAE5CAEAE5DAEAE5DAFAE5DAFAE5EAF
        AE5EAFAF5EAFAF5FB0AE60B0AF5FB0AF61B1B061B0AF61B1B061B1B062B1B063
        B1B163B2B163B2B163B2B164B2B164B2B265B2B266B2B266B3B266B3B266B3B3
        67B4B367B3B368B4B368B4B368B4B469B4B469B4B469B5B56AB5B46AB6B46BB5
        B56BB6B56BB6B56CB6B66CB6B66DB7B56EB6B66DB7B66EB7B66EB7B76FB8B66F
        B8B770B8B770B8B870B9B771B9B872B9B872B9B872B9B872B9B873BAB973BAB8
        74BAB974BBB975BABA75BBB975BABA76BBBB76BBBA76BBBB77BCBB77BCBB78BC
        BB78BCBB79BCBC79BDBB7ABDBC7ABDBC7ABDBC7BBEBC7BBEBD7BBEBD7CBEBD7C
        BFBE7DBEBE7DBEBE7DBEBE7EC0BE7EBFBF7FBFBF7FBFBE80C0BF80C0BF80C0BF
        81C1BF81C0C081C1C081C1C082C1C083C1C183C2C183C2C184C2C184C3C185C3
        C185C3C186C3C286C3C287C3C287C4C387C4C388C3C287C4C488C4C389C5C389
        C5C489C5C48AC5C48AC5C48AC6C58BC6C48BC6C58CC6C58CC7C58DC6C68DC7C5
        8EC7C68EC8C68EC8C68FC8C68FC8C68FC8C790C8C790C8C791C8C891C9C892C9
        C892C9C892CAC893C9C993CAC894CAC994CAC994CBCA95CBCA96CBC996CBCA96
        CCCA97CBCA97CCCB98CCCB97CCCB98CCCB98CCCB99CDCB9ACDCB99CDCC9ACECC
        9BCDCC9BCECD9CCECC9BCECC9CCECD9CCECD9DCFCD9ECFCE9ECFCE9ECFCE9FCF
        CE9FCFCF9FD0CFA0D1CFA0D0CFA1D1D0A1D1D0A1D1D0A2D1D0A2D1D0A3D1D0A3
        D1D0A3D2D1A4D2D1A4D2D1A4D2D1A5D2D2A6D3D1A6D3D2A6D3D2A7D4D3A7D3D3
        A7D4D3A8D4D3A8D4D3A9D4D3A9D4D3A9D5D4AAD5D4ABD6D4AAD6D4ABD5D5ACD6
        D5ACD6D5ACD6D5ACD6D5ADD7D5ADD7D5AED7D6AED7D6AED8D6AFD8D7AFD8D7B0
        D8D7B0D8D7B0D8D7B2D8D7B1D9D7B2D9D8B2DAD8B3DAD8B3DAD8B3DAD8B4DAD9
        B4DAD9B5DAD9B6DBD9B5DBDAB6DCD9B7DCDAB7DCDBB7DCDBB8DCDAB8DCDBB9DC
        DBB9DCDBB9DDDCBADDDBBADDDCBBDEDCBBDEDCBBDEDCBCDEDDBCDFDDBDDEDDBD
        DFDDBDDFDEBEDFDEBEDFDEBFE0DEBEDFDEBFE0DFBFE0DFC0E0DFC1E1DFC0E1DF
        C2E1DFC1E1E0C2E1E0C3E2E0C3E2E0C3E2E0C4E2E0C4E2E0C5E2E1C5E2E1C6E3
        E1C6E3E1C6E4E2C7E3E2C7E4E2C7E4E2C8E5E3C8E4E2C9E4E3C9E4E3CAE5E4C9
        E5E4CAE5E3CBE5E4CBE6E4CCE6E5CCE6E5CCE6E5CDE7E4CDE7E5CEE7E6CDE7E6
        CFE8E6CFE8E6CFE7E6D0E8E6D0E8E7D0E9E7D0E9E7D1E8E7D1E9E8D2E9E7D3EA
        E7D3EAE8D3E9E8D3EAE8D4EAE8D5EAE9D5EBE8D5EBE9D6EBEAD6EBEAD7EBEAD7
        ECEAD7ECEAD7ECEAD8ECEBD8EDEBD9ECEBD9EDEBD9EDEBDAEDECDBEDECDBEDEC
        DBEDECDBEEECDCEEEDDCEFEDDCEFEDDEEEEDDDEFEDDEEFEEDEEFEEDFF0EEDFEF
        EEE0F0EFE0F0EEE1F0EEE1F0EFE1F1EFE1F1EFE2F2EFE2F1F0E3F1F0E4F2F0E4
        F2F0E4F2F1E5F2F0E5F3F1E5F3F1E6F3F2E6F3F2E6F3F2E7F4F2E7F4F2E7F4F3
        E8F4F2E8F4F3E9F5F3E9F5F3EAF5F3EAF5F4EBF6F4EBF6F3EBF6F4ECF6F4ECF6
        F5ECF7F4EDF6F4EDF7F5EDF7F5EEF7F5EEF7F5EFF7F6EFF8F6F0F8F6F1F8F7F1
        F8F6F1F9F7F2F9F8F2F9F7F3FAF7F3F9F7F3F9F8F4FAF8F4FAF8F5FBF8F5FAF9
        F5FAF9F5FBF9F6FBF9F6FBFAF6FBFAF7FCFAF8FCFAF7FCFAF8FDFAF8FDFBF9FD
        FBFAFDFBFAFDFBFBFDFCFBFEFBFBFEFCFCFEFCFCFEFCFCFEFCFDFFFCFDFEFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFE8080008080008080008080008080008080008080008081008081
        0181810181810281810281810281810382820382820482820482820582820582
        8305838306838306848306838407838408848408848308848408848408848509
        85850985850A85850B85850B85850B86850B86860D87860C86860D86860D8687
        0E87870E87870F87870F88880F87880F88881089881189881189891189891189
        89128989138989138A89138989148B8A148B8A158A8B158B8A168B8B168B8B16
        8C8C178B8B178B8C178C8C188C8C188D8C188C8D198D8D1A8D8D1A8D8D1B8D8D
        1B8D8D1B8E8D1C8E8E1C8E8E1C8F8E1D8F8E1D8E8E1E8F8F1E8F8F1F8F8F1F8F
        8F1F909020909020909020909021919021909021919022919122919122929123
        9292249291249292259392259292259293269393269393279493279394289493
        2894932894942994942995942994942A95952A96952A96952B96952C96952C96
        952C96952C96962C97972D97972E97972E97972F98972F989730989830989730
        9898319898319898319999329999329998339999329A9A349A9A349A9A349A9A
        349A9A359B9A359B9A369B9B369B9B369C9B379C9B379C9C389C9B389C9C399C
        9C399D9C399D9D3A9D9D3A9D9D3A9D9D3B9E9D3B9E9D3C9E9E3C9E9E3C9F9E3D
        9F9E3D9F9E3E9F9F3EA09F3FA09F3FA09F40A0A040A0A041A0A040A1A041A0A0
        42A1A042A1A042A2A142A2A144A2A144A2A144A2A245A3A145A2A245A3A246A3
        A246A3A246A3A247A4A347A4A348A4A448A4A349A4A349A5A449A5A44AA5A54A
        A5A54BA5A44BA6A54BA6A54BA6A64CA6A64CA6A64DA7A64DA7A64EA7A74EA7A7
        4EA7A74FA8A750A8A750A8A750A8A850A8A751A8A851A8A852A9A852AAA852AA
        A953A9A953A9AA54ABAA54ABAA55AAAA55ABAA56ABAA56ABAA57ABAA57ABAB57
        ACAB57ACAB58ACAB58ACAC58ACAC59ADAC59ADAC5AADAC5AAEAD5AAEAD5BAEAD
        5CAEAD5CAEAD5CAEAE5DAEAE5DAFAE5EAFAE5EAFAE5FAFAF5EAFAF5FAFAF60B0
        AF60B0AF60B0B060B1B061B1B061B1B062B1B162B2B063B1B063B2B164B2B264
        B2B164B2B265B3B265B3B266B3B266B3B366B3B367B4B367B3B368B4B368B4B4
        68B4B369B5B46AB5B469B5B46AB5B46AB5B46BB5B56BB6B56BB6B56CB6B56CB6
        B66DB7B66DB7B66EB7B66EB7B66FB8B76FB8B76FB8B770B8B770B8B770B8B770
        B9B871B9B872B9B872B9B972B9B973BAB973BAB974BAB974BAB974BBBA75BABA
        75BBBA76BBBA76BBBB77BCBB77BBBB78BBBB78BCBB78BCBC78BCBB78BCBC79BD
        BC79BDBC7ABDBC7ABDBC7BBEBC7BBEBD7CBEBD7CBEBD7DBEBD7DBEBE7DBFBE7E
        BFBE7FC0BE7FBFBE7FBFBE7FC0BF80C0BF80C0BF81C1BF81C0BF81C1BF82C1C0
        82C1C082C2C183C2C184C2C183C3C184C2C185C2C185C3C285C3C286C3C286C4
        C287C3C387C4C388C4C288C4C388C4C388C5C489C4C489C5C48AC5C48AC5C48B
        C6C48CC6C58CC6C58CC7C58CC7C68CC7C68DC7C58DC7C68EC8C68FC8C78FC8C7
        8FC8C78FC8C790C8C790C9C791C8C791C9C792C9C892C9C892C9C993C9C894CA
        C994CAC994CBC994CBCA95CACA96CBC996CBCA96CBCA96CBCA97CBCB97CCCB97
        CCCB98CCCB99CCCC99CDCB9ACDCC9ACDCC9ACDCC9ACECC9BCECC9CCECD9CCFCD
        9CCECD9DCFCD9DCFCD9ECFCE9ECFCE9ECFCE9ECFCF9FCFCE9FD0CE9FD0CFA1D0
        CFA0D0CFA1D0CFA1D1D0A2D1D0A2D1D0A3D1D1A3D1D0A3D2D0A4D2D1A4D3D1A5
        D3D1A5D3D1A6D3D2A6D3D1A6D3D2A7D4D2A7D4D2A8D4D3A8D4D3A9D4D3A9D4D3
        A9D5D4AAD5D3AAD5D3AAD6D4ABD5D5ABD6D4ABD6D4ACD6D4ADD7D5ADD6D5ADD7
        D5ADD7D5AED7D6AFD7D6AFD7D6AFD7D6AFD8D6B0D8D7B0D8D7B1D9D7B1D9D8B1
        D9D8B2D9D8B3D9D8B3D9D8B3DAD9B4DAD9B4DAD9B5DBD9B5DAD9B5DBD9B5DBD9
        B6DBDAB6DCDAB7DBDAB7DCDAB8DDDBB8DCDBB8DCDBB9DCDBB9DDDBBADDDBBADD
        DCBBDDDCBBDEDDBCDDDCBBDEDDBCDEDDBDDEDDBDDFDDBEDFDDBDDFDEBEDFDEBE
        DFDEBFE0DEBFE0DEBFE0DEC0E0DFC1E0DFC1E1DFC2E0DFC2E1E0C3E1DFC3E1E0
        C3E2E0C4E2E1C4E2E0C4E2E1C4E3E0C5E3E1C5E2E1C5E4E1C6E3E2C7E3E2C7E3
        E2C7E4E3C8E4E3C8E4E3C9E5E3C9E5E3CAE5E4CAE5E3CAE6E4CAE6E4CBE5E4CC
        E6E5CCE6E4CDE6E5CDE6E5CEE6E5CEE7E6CEE7E6CFE8E6CFE8E6CFE8E6D0E8E6
        D0E8E6D1E8E7D1E8E6D1E9E7D2E9E7D2EAE7D2E9E8D3EAE8D3EAE9D3EAE8D4EB
        E9D4EAE9D5EBE9D6EBE9D6EBE9D6EBE9D6EBEAD7ECEAD7EBEAD8ECEAD8EDEAD8
        ECEAD8ECEAD9EDEBD9EDEBDAEDEBDBEEECDBEEECDBEEECDCEEECDCEEECDDEEED
        DDEEEDDDEFEEDDEFEDDEEFEEDFEFEEDFF0EDE0EFEEE0F0EFE0F1EFE1F1EEE1F0
        EFE2F1EFE1F1EFE2F2EFE2F2F0E3F2F0E3F2F0E4F2F1E4F3F1E5F2F1E5F2F0E5
        F3F1E5F3F1E6F3F1E7F4F1E7F3F2E7F4F2E8F4F3E8F4F2E9F5F3E9F4F3E9F5F3
        EAF5F3EAF5F3EBF6F4EBF5F4EBF5F5ECF6F4ECF6F5EDF7F4EDF7F5EEF7F5EEF7
        F6EEF7F6EFF7F6EFF8F6F0F8F6F0F8F6F0F8F7F0F9F6F1F8F6F1F9F7F2F9F7F2
        F9F7F3FAF7F3FAF8F3FAF8F4FAF8F4FAF8F5FBF8F5FBF9F6FBF9F6FBF9F7FCFA
        F6FCF9F7FBFAF7FCFAF8FCFAF9FCFBF9FDFAF9FCFBFAFDFBFAFDFBFAFDFCFBFD
        FCFBFDFCFCFEFCFCFEFCFDFEFCFDFEFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000
        8080008080008080008080008080008080018080018181028180018181028181
        0281820381810482820382820482820483820582830583830683830683830683
        830783830784830884840884840985850985840A85850A85850A85850A86850B
        86860C86860C86860C86860C87870D87860E87860D87870F87870F87880F8787
        10888810888810888910898811898811888911898912898A13898A13898A138A
        89148A8A158A8A148A8A158B8A158B8B168B8B168B8C168C8C178C8B178C8C18
        8C8C188C8C198C8C198C8C198D8C198D8D1A8D8D1B8D8E1B8E8D1C8E8D1C8E8E
        1D8E8F1C8F8E1E8F8F1D8F8F1E8F8F1E8F8F1F908F1F90902090902090902190
        9021919022919021919122919122929223919123919224929224929224939225
        9393259392269393269393269393269493279493289493289494299594299594
        2995952995952A96952A96952B96962B96952C97962C96962C96962D97962D97
        972E97972E97972E97972F979730989830999830989730999831999931999931
        9998329A99329A99339A9A349999349B9A349A9A359B9A359A9A359B9A359B9B
        369C9B379B9B379C9B379C9B389C9B399C9C399D9C399D9C3A9D9C3A9D9D3A9E
        9D3A9D9D3B9E9D3B9D9D3C9E9E3D9E9E3C9E9E3D9E9F3D9F9F3E9F9F3E9F9F3E
        A09F40A09F3FA0A040A0A040A19F41A1A041A1A042A1A042A1A142A1A143A2A1
        43A1A144A2A144A2A245A2A245A3A245A3A345A3A246A3A247A3A347A4A347A4
        A348A4A448A4A348A4A449A5A44AA5A549A5A54AA5A44AA5A54AA6A54BA5A54B
        A6A64CA7A64DA6A64DA6A64EA6A64DA7A74EA7A64EA7A64FA7A74FA8A750A8A7
        50A9A851A9A751A9A851A9A852A9A952AAA953A9A853A9A954AAA953AAAA54AB
        AA55ABAA55ABAA56ABAA56ABAB56ABAB57ABAB57ACAB57ACAB58ADAB58ACAC59
        ADAC59ADAC59ADAC59ADAD5AADAC5AAEAD5BADAD5BAEAD5CAEAE5CAEAD5CAFAE
        5DAFAE5EAFAE5DAFAF5EAFAE5FB0AF5FB0AF60B0AF60B0AF60B0B061B0B062B1
        B061B1B061B1B162B2B162B1B163B1B164B1B163B2B264B2B264B3B265B3B265
        B3B266B3B367B3B267B3B367B4B367B4B368B4B368B4B368B4B46AB5B469B5B4
        6AB5B56AB6B56BB5B46BB6B56CB6B56CB6B66CB7B66DB7B66DB7B66DB7B66EB7
        B66EB7B66FB7B76FB7B670B8B770B8B770B9B771B9B871B8B872B9B873B9B872
        BAB873BAB974BAB974BAB974BBB974BAB974BABA75BBBA76BBBA77BBBA77BCBB
        77BCBB78BCBB78BCBB78BCBC79BDBB79BDBC79BDBC7ABDBC7BBDBD7BBDBC7BBD
        BC7BBEBD7CBEBD7CBEBE7DBFBD7DBEBD7DBFBE7DBFBF7EC0BE7FBFBF7FBFBE80
        C0BF80C1BF81C0BF80C0C081C1BF81C1C082C1C082C1C083C1C183C2C184C1C1
        84C3C184C2C185C2C185C2C185C3C286C3C287C4C386C3C287C4C388C4C388C4
        C488C5C389C4C389C5C389C5C48AC6C48BC6C48BC5C48BC6C58CC6C58CC6C58D
        C6C58CC6C68DC7C58DC7C68EC8C68EC8C68FC8C78FC8C690C8C790C8C790C9C7
        90C9C791C9C892C9C892C9C892C9C893C9C893CAC994CAC994CAC995CAC994CB
        C995CBC995CBC996CCCA97CCCA97CCCB98CCCB98CCCB98CDCB99CCCB99CDCC99
        CDCC9ACDCC9ACDCC9BCECC9BCECD9BCDCC9CCECD9CCECD9CCECE9DCECD9DCFCE
        9ECFCE9ED0CE9ED0CE9FD0CFA0D0CFA0D0CFA0D0CFA1D1CFA1D1CFA1D1D0A2D1
        D0A2D1D0A3D2D1A3D1D0A3D2D0A4D2D1A5D3D1A4D3D1A5D2D1A6D2D2A6D3D2A6
        D4D2A6D4D2A7D4D2A7D4D2A8D4D3A8D4D3A9D4D3A9D5D3AAD5D4AAD5D4AAD6D4
        ABD6D4ABD6D4ACD6D4ACD6D5ACD6D5ADD7D5ADD7D5AED7D6AED8D6AED7D6AED8
        D6AFD8D6B0D8D7B0D8D7B0D9D7B1D8D7B1D9D7B2D9D8B2D9D8B2DAD8B3D9D8B3
        DAD8B4DAD9B4DAD9B5DBD9B5DBD9B5DBDAB6DBDAB6DBDAB6DBDAB6DBDAB7DCDB
        B8DCDBB8DDDBB9DDDBB9DDDBB9DDDCBADDDCBADDDCBBDEDCBBDDDCBBDDDCBCDE
        DDBCDEDDBDDEDDBDDEDEBDDFDEBDDFDDBEDFDEBEE0DEBFE0DFBFDFDEC0E0DFC0
        E1DFC1E0DFC1E1DFC1E1DFC2E1E0C2E1DFC3E1E0C3E2E0C4E2E1C4E3E0C4E2E1
        C5E2E1C5E2E1C5E3E1C6E3E2C6E3E1C6E4E2C7E4E2C8E4E3C8E4E2C8E5E2C9E5
        E3C9E5E3C9E5E4CAE5E4CAE5E3CBE6E4CBE5E4CBE6E4CCE6E4CDE6E4CDE7E5CD
        E6E6CEE7E5CEE7E6CEE7E6CFE7E6CFE8E6CFE8E7D0E8E7D0E8E7D1E9E7D1E9E7
        D2E9E7D2E9E8D2E9E8D3E9E8D3EAE8D3EAE8D4EBE9D5EBE8D5EAE8D5EBE9D5EB
        E9D6EBE9D6ECEAD7ECEAD8ECEAD7ECEBD8EDEAD8ECEBD9ECEBDAEDEBD9EDEBDA
        EDEBDAEEECDBEEECDCEEECDCEEECDCEEEDDCEEECDDEFEDDDEFEDDDEFEEDEEFED
        DEEFEDDFEFEEDFF0EEDFF0EEE0F0EEE1F1EEE1F0EFE1F1EFE1F1F0E2F2EFE2F1
        EFE3F1F0E3F1F0E4F3F0E4F2F0E4F2F0E5F3F1E5F3F1E5F3F1E6F4F1E6F4F2E7
        F4F2E7F4F2E8F4F2E8F5F2E8F4F3E9F5F3E9F4F3EAF5F3EAF5F3EAF5F4EBF6F3
        EBF6F4ECF6F4ECF6F4EDF7F5EDF6F4EEF7F5EEF7F5EEF7F5EEF8F5EFF7F5F0F8
        F6F0F8F6F0F8F7F0F9F7F1F9F7F1F9F7F1F9F8F2F9F8F3FAF7F3FAF8F4FAF8F4
        FAF8F4FBF8F5FBF9F5FBF9F5FBF9F5FBFAF6FCF9F6FCFAF7FCFAF8FCFAF7FCFB
        F9FCFAF9FDFBFAFDFBFAFDFBFAFDFBFAFDFBFAFEFBFBFEFCFCFEFCFCFEFDFCFE
        FCFCFEFCFDFEFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000808000808000808000808000
        8080008081018181018081018181028182028181038281038281038282048282
        0482820583830583830583830683830683830684830783840884840884840885
        840885850985850A85850985840A85850B85850B85860B86860B86860C86860C
        87870D87860D87870D87870F87870F88880E88881088880F8888118888118989
        11888811888912898912898912898A138A8A138A89148A8A148A8A158A8A158B
        8B158B8B168B8B168B8B178B8C178B8B188C8C188C8C188D8D188C8C1A8D8C1A
        8D8D1A8D8D1A8E8D1A8D8E1B8E8D1B8D8E1B8E8E1C8F8E1C8F8E1D8F8E1E8F8F
        1E908F1E908F1E8F901F8F8F2090902090902090902191912191912191902292
        9123919123919123929124929224929224939224929325939225939326939327
        94932794932794942894932894942895942995942995942A95952A95942A9595
        2B95952B95952C96962C97962C96962D97962D97962D97972E98972E97972F98
        972F9897309897309998319999319898319998319999329999329999339A9A33
        9A9A349A9A349A9A359A9A359A9A359B9B359B9B369B9B379C9B379C9B389C9B
        389C9C389C9C399D9C399D9C399D9C3A9E9D3A9E9C3B9D9D3B9E9D3C9E9D3C9E
        9E3D9F9E3C9F9E3D9E9E3E9F9E3EA09E3E9F9F3F9F9F3F9F9F40A09F40A09F40
        A0A041A0A041A1A042A1A142A1A042A1A143A2A143A1A243A2A244A2A145A2A2
        45A2A245A3A246A3A346A3A347A4A347A4A347A4A348A4A348A5A349A4A449A4
        A449A5A44AA5A44AA5A54BA5A54AA6A54BA6A54CA6A64CA6A54CA6A64CA6A64D
        A7A64DA7A64EA7A74FA8A74FA8A74FA7A850A8A750A8A851A8A851A9A852A9A9
        52A9A852A9A953A9A952A9A953AAA954AAA954ABAA54ABAA55AAAA56ABAA56AB
        AB57ABAA57ACAB57ACAB58ACAB58ACAC59ACAB58ACAC59ACAC5AACAC5AADAD5A
        ADAC5AAEAD5BAEAD5BAEAD5CAEAE5CAEAD5DAFAE5DAFAE5DAFAE5DAFAF5EAFAE
        5EAFAF5FAFAF5FB0AF60B0B061B1AF60B1AF61B1B062B1B062B1B163B2B063B1
        B163B1B163B2B163B3B165B3B265B3B265B2B266B3B266B3B267B3B267B4B367
        B4B368B4B368B4B469B4B468B5B369B5B46AB5B46AB5B46AB5B56BB6B46BB6B5
        6CB6B56CB7B56CB7B66DB6B66DB6B66DB7B66EB7B76EB7B76FB7B76FB8B76FB8
        B770B8B770B8B771B8B871B8B872B9B872B9B973B9B973B9B974B9B873BAB974
        BABA75BBBA75BBBA75BBBA76BBBA76BBBA77BBBB77BCBA77BCBB78BCBB78BDBB
        78BCBC79BCBC79BCBC7ABDBC7ABEBC7ABDBC7BBDBD7BBEBD7CBEBD7CBFBD7DBE
        BD7DBFBD7DBFBE7EC0BE7FBFBE7FBFBF7FBFBF7FC0BE80C0BF80C0BF81C1C081
        C1BF82C1BF82C1C083C2C083C1C183C1C083C1C184C2C184C2C185C3C185C3C1
        85C3C286C3C286C3C286C3C287C3C387C4C388C4C489C5C389C5C389C5C389C5
        C48AC5C48AC5C58BC5C58BC6C58CC6C48CC6C58CC6C58DC7C68DC7C68DC7C68E
        C7C68EC7C68FC7C78FC8C790C8C790C8C790C8C791C9C891C9C791C9C893C9C8
        93C9C893C9C893CAC994CBC994CAC995CAC994CBC995CBC996CBCA96CCCA96CB
        CA97CCCA97CCCA98CCCB98CCCB98CDCB98CDCB99CCCC9ACDCB9BCECC9ACDCC9B
        CECC9BCECD9CCFCC9DCECD9CCECE9DCFCD9ECFCD9ECFCE9ECFCE9ECFCE9FD0CE
        A0D0CEA0D0CFA1D0CFA1D0CFA1D0CFA2D0D0A2D1D0A2D1D0A3D2D1A3D2D0A3D2
        D0A3D2D1A4D3D1A4D3D2A5D3D1A5D3D2A6D4D2A6D3D2A6D4D2A7D4D2A7D3D2A8
        D4D3A8D5D3A9D5D3A9D5D3AAD5D3AAD5D4ABD5D4ABD6D4ABD5D5ABD6D5ABD6D5
        ACD6D5ADD6D5ADD6D6AED7D5AED7D5AED8D6AED7D7B0D8D6B0D8D7B0D8D7B0D9
        D7B1D9D7B1D9D7B2D9D8B2D9D8B2D9D8B2D9D8B3DAD9B4DAD9B4DAD9B4DAD9B5
        DBD9B5DBDAB5DBDAB6DBD9B6DBDAB7DCDAB7DCDBB8DCDAB8DCDBB9DDDBB9DDDB
        B9DDDBBADDDCBADDDCBBDDDCBBDDDDBBDEDDBCDEDCBCDEDDBCDEDDBDDFDDBDDF
        DDBDDFDEBEDFDEBEDFDEBFE0DEBFE0DFC0E0DEC0E0DEC1E1DFC1E1DFC1E1DFC2
        E1DFC2E1E0C2E2E0C3E2E0C4E2E1C4E3E1C4E3E1C4E3E1C5E3E1C5E3E1C5E3E1
        C7E4E1C7E4E2C7E3E2C7E4E2C8E4E3C8E4E3C8E5E3C9E4E3C9E5E3C9E5E4CBE5
        E3CBE5E4CBE5E4CBE6E5CCE6E4CCE6E5CDE7E5CDE7E5CEE7E6CDE7E6CEE7E6CE
        E7E6CFE7E6D0E7E7D0E8E7D0E8E7D0E9E7D1E9E8D1E9E7D2E9E7D2E9E7D3EAE8
        D3EAE8D3EAE8D4EAE9D5EAE8D5EBE8D5EBE9D5EBE9D6EBEAD6EBEAD6ECEAD7EC
        EAD7ECEAD8ECEAD8ECEBD8EDEBD9ECEBDAEDEBDAEDEBDAEDECDBEDECDBEDEDDC
        EEEDDCEEEDDCEFEDDDEEEDDEEEEDDEEFEDDEEFEEDFEFEEDEEFEEDFF0EEE0F0EE
        E0F0EFE1F0EFE1F1EFE1F1EFE2F1F0E2F1EFE2F2F0E3F1F0E3F2F0E4F2F0E4F3
        F0E4F3F1E5F3F1E5F2F1E6F3F1E6F3F1E7F4F2E7F4F2E7F4F2E8F4F2E8F4F2E8
        F5F3E9F5F3EAF5F3EAF5F3EAF6F4EBF6F3EBF6F4EBF6F4ECF6F4ECF6F4EDF7F4
        EDF6F5EDF7F5EEF7F6EFF7F5EEF8F6EFF8F6F0F8F6F0F8F7F0F8F6F0F9F7F1F9
        F7F2F9F7F2F9F8F3F9F8F3F9F8F3FAF8F3FAF8F4FAF8F5FAF9F4FAF9F5FBF8F5
        FBF9F6FBF9F7FBFAF6FCF9F7FBFAF8FCFAF8FDFBF8FCFBF9FCFBF9FDFAF9FDFB
        FAFDFBFAFDFBFAFDFCFCFEFCFBFEFCFCFEFCFDFEFDFDFFFDFDFEFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFE808000808000808000808000808000808000808000808001808001818101
        8181018181028281028182028181038282038282048282058382058382058383
        0683830683830784840784840784840884840884840885840985850985850A85
        850A85850A85850B86860B86860B86860C86860D87860D87860E86870D87870F
        88880E88880F88871088880F8888118988118888118889128989128989128989
        128989138A89148A8A148A8A148A8A148A8A158B8B168B8B168B8B168B8C178C
        8B178C8B188C8B188C8C198D8C198D8D198D8C1A8D8D1A8E8D1A8E8D1A8D8D1B
        8E8E1B8E8E1C8E8D1C8F8E1D8E8E1D8F8F1D8F8E1D8F8F1E908F1F908F1F908F
        1F90902090902091902090902191912191902291912292922391912392922492
        9224929224929324929325939326939226939326939326949328949427949328
        94932995942894942995942A95942A95952A95952B96952B95962C96952D9695
        2D97972D97962D97962E97962E97962E97972F98982F98982F98983098983199
        98319998329999329999329A99329A99339A9934999A349A9A349A9A349A9A35
        9B9A359B9B369B9A369B9B379B9B379B9B389C9C389C9B389C9C389C9C399C9C
        399D9C399D9C3A9D9D3B9D9D3B9E9D3C9E9E3B9E9E3C9E9E3C9F9E3D9F9E3D9F
        9F3E9F9F3FA09E3F9F9F3FA09F40A0A040A0A040A0A041A0A041A1A142A1A142
        A1A143A2A143A1A143A2A144A2A143A3A145A3A245A3A245A2A345A3A346A3A3
        46A4A346A3A348A4A448A4A448A5A448A5A349A5A44AA5A44AA5A44AA5A54AA5
        A54BA5A54BA6A64BA6A54CA7A64DA6A64DA6A64EA7A64EA7A64EA7A74FA8A74E
        A7A74FA8A750A8A850A8A850A9A851A9A852A9A851A9A852A9A953A9A953A9A9
        53A9A954AAAA54AAA955AAAA55ABAA55ABAA56ABAB56ACAB57ABAB57ACAB58AC
        AB58ACAB58ACAC59ACAC59ACAC5AADAC5AADAC5AADAD5BAEAD5BAEAD5CAEAD5C
        AEAE5DAEAE5DAEAD5DAFAE5EAFAE5EAFAF5EAFAE5FAFAF5FAFAF60AFB060B0AF
        61B1AF61B0AF61B1B061B1B062B1B062B1B163B1B164B2B164B1B164B2B165B2
        B265B2B265B3B265B3B266B3B366B3B366B3B367B4B268B4B368B4B368B5B469
        B5B469B5B46AB5B46AB5B46BB6B46BB5B56BB6B56CB6B56CB6B66CB6B66DB7B6
        6DB6B66EB7B76EB7B76EB7B76FB7B66FB8B770B8B770B8B871B9B871B8B771B8
        B872B9B872B9B872BAB972BAB973BAB973BAB974BAB974BBB975BBBA75BBBA76
        BBBA76BCBB77BBBB77BCBB78BCBB78BDBB78BCBB78BDBB79BDBC79BDBC7ABDBC
        7ABDBC7ABDBC7BBEBD7BBEBD7CBEBD7DBEBD7CBFBD7DBFBE7DBFBE7EBFBE7EC0
        BE7FBFBE7FC0BF7FC0BE7FC0BF81C1C081C1C081C1BF82C1C082C1C082C2C182
        C2C083C2C184C2C184C2C185C2C184C2C285C3C286C3C286C3C286C3C286C4C3
        87C3C387C4C388C4C388C4C388C5C489C5C389C5C38AC6C48AC5C48BC6C58BC6
        C58BC5C58CC6C58CC7C58DC6C58DC6C58DC7C68EC7C68EC7C68FC7C78FC8C78F
        C8C690C8C790C8C790C8C891C9C892C9C892C9C892CAC993CAC893CAC894CAC9
        94CAC994CBC995CBCA95CBCA95CBCA96CBCA97CCCA97CCCA97CCCA98CCCB98CC
        CB99CCCB99CDCB99CDCB99CDCC9ACDCC9BCDCC9BCECD9BCDCD9BCECC9CCECD9C
        CFCD9DCFCE9DCFCE9DCFCE9ECFCE9ECFCE9FD0CF9FD0CEA0D0CFA0D0CFA1D0CF
        A1D1CFA2D1D0A1D1D0A2D1D0A3D1D0A3D2D0A3D2D1A4D3D0A5D3D1A4D3D1A5D3
        D2A6D3D2A6D3D2A6D4D2A7D4D2A8D3D2A7D4D3A8D4D2A8D4D3A8D5D3A9D5D3AA
        D5D4AAD5D4AAD5D4ABD5D5ABD6D5ACD6D4ACD7D5ACD7D5ADD7D5ADD7D5AED7D5
        ADD7D6AED8D6AED7D6AFD8D6B0D8D7B0D8D7B0D9D7B1D8D7B1D9D7B2D9D8B2D9
        D8B3DAD8B3D9D9B3DAD9B4DAD8B4DAD9B4DAD9B5DBD9B5DBDAB6DBD9B6DCDAB6
        DCDAB7DBDAB7DBDAB7DCDBB8DCDBB9DDDBB9DDDBB9DDDBB9DDDBBADDDCBADDDC
        BBDDDCBBDEDCBCDEDCBCDEDDBCDEDDBDDFDDBDDEDEBEDFDDBEDFDDBFE0DEBEE0
        DEBFDFDEC0E0DEC0E0DFC0E0DFC1E1DFC1E1E0C2E1DFC2E1DFC2E1E0C3E2E0C3
        E2E0C4E2E1C4E2E0C5E2E1C5E3E1C5E3E1C5E3E2C6E3E1C6E3E2C7E3E2C7E3E2
        C8E4E3C8E5E3C9E4E3C9E4E3CAE5E3CAE5E4CAE6E4CBE5E4CBE6E4CCE6E4CCE6
        E4CCE7E5CDE7E5CEE7E5CDE7E6CEE7E5CEE7E6CFE7E6CFE8E7D0E8E6D0E8E7D0
        E8E7D1E8E7D1E9E7D2E9E8D2E9E8D2E9E7D2EAE8D3EAE8D4EAE8D4EAE9D4EAE9
        D4EAE9D5EAE9D6EBE9D6EBEAD7EBE9D6EBEAD7ECEAD7ECEAD8ECEBD8ECEBD9ED
        EBD9EDEBD9EDEBDBEEEBDAEEECDBEDECDBEEEDDCEEEDDCEEEDDCEFEDDDEEECDD
        EFEDDEEFEEDEF0EDDEEFEEDFF0EEDFEFEEDFF0EEE0F1EFE1F1EFE1F1EFE2F1EF
        E2F1F0E2F1EFE2F2EFE3F1F0E3F2F0E4F2F0E4F3F0E5F3F1E5F3F1E5F3F1E6F4
        F1E6F3F1E7F3F1E7F4F2E8F4F2E8F4F2E8F4F2E8F5F2E9F5F3E9F5F3EAF5F3EA
        F6F4EAF5F4EBF5F3ECF6F4ECF6F4EDF7F4EDF7F4EDF7F5EDF7F5EEF7F5EFF7F5
        EFF8F6EFF8F6F0F8F6EFF8F6F0F9F7F1F9F7F1F8F6F2F9F7F2F9F7F2F9F7F2F9
        F8F4F9F7F4FAF8F4FAF8F4FAF8F5FAF9F6FAF9F6FBF9F6FBFAF7FCF9F7FBF9F7
        FCFAF8FCFAF8FCFBF8FCFBF8FCFBF9FDFBFAFDFBFAFDFCFAFDFCFBFEFCFCFEFC
        FCFEFCFCFEFCFCFFFCFDFFFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE80800080800080800080
        8000808000808000808000808001818101818101818002818102828103828103
        8281038282038282048282048382058282058382068383068484068383068484
        0784830784840884850885840985850985850A85850A85850B86850B86850C86
        860B87860D86870C87860D87870D87860D87870E88870E88870F87880F88870F
        8988108988118889118889128989118989128A89138A89138A8A138A8A138A8A
        148A8A158A8A158A8A158B8B168B8A178B8B178B8C178B8C178C8B188C8C188D
        8D188C8C198D8D198C8C1A8E8D1A8D8D1B8E8D1B8D8E1B8E8D1C8E8E1C8F8E1C
        8F8E1E8F8F1E8F8F1E8F8F1E8F8F1F908F1F8F90209090209090219090209191
        2191912291912292912292912292912391912392912493922592922592922593
        932693932693932693932794942893932794942894942895942994942995952A
        95952A95952A95962A95952B96952C97962C96962C97962D96972D97972E9796
        2E97972F97972F97973098982F98983198983199993199983199983299993299
        99329999339A99339A9A349A9A349A9A349A9A359B9B359B9A369B9B369C9B37
        9B9B379C9C379C9C379C9C389C9C389C9C399D9C399D9D3A9D9D3A9E9D3A9D9D
        3B9E9D3C9E9E3B9E9E3C9E9E3C9F9E3D9F9F3E9F9F3E9F9F3E9F9F3E9F9F3F9F
        9F40A0A040A19F41A1A041A1A042A1A041A1A042A1A143A2A043A2A143A2A143
        A2A144A2A244A2A245A3A245A3A246A3A246A4A347A3A247A4A347A4A347A4A3
        48A4A448A5A449A5A449A5A44AA5A44AA5A54BA6A44BA6A54BA6A54CA6A64DA7
        A64DA7A64DA6A64EA6A64EA7A64FA7A74FA7A74FA8A750A8A850A8A850A8A851
        A9A851A8A851A9A852A9A952A9A952A9A953A9A954AAA954AAAA54ABAA54AAAA
        55AAAA56ABAA55ABAB56ACAB57ACAB57ABAB57ACAB58ACAB58ADAC59ADAB59AD
        AC59ADAC5AADAD5AAEAD5BAEAD5BAEAD5BAEAE5CAEAD5CAEAE5CAFAD5DAEAE5E
        AFAE5EAFAF5EAFAF5FAFAE60B0AF60B0AF60B0AF60B0B061B1B061B1B062B1B0
        62B1B062B1B163B1B163B1B164B1B164B2B264B2B164B3B265B3B266B3B266B3
        B366B3B267B4B367B4B368B4B368B4B368B4B468B4B369B4B469B5B46AB5B46A
        B5B46BB6B46BB6B56BB6B56CB6B66DB6B66DB7B66DB7B66DB7B66EB8B66EB8B7
        6FB7B670B8B76FB8B770B9B770B9B871B9B871B9B871B9B872BAB872B9B873B9
        B973BAB973BAB974BBBA75BBB975BABA75BBBA75BCBA76BCBA76BBBB77BBBB77
        BCBB78BCBB78BCBB78BCBB79BDBC79BDBC7ABDBC7ABDBC7BBDBD7BBEBD7BBEBD
        7CBEBD7CBEBD7CBEBD7DBFBD7EBFBE7EBFBF7EBFBF7FC0BE7FC0BF7FC0BF7FC0
        BF80C0BF80C0BF81C1C082C1C082C1C082C1C183C2C183C2C183C2C184C2C284
        C3C185C3C185C2C186C3C286C3C286C3C287C4C287C3C287C4C388C4C388C4C3
        88C4C489C5C38AC5C48AC5C48AC5C58AC6C58BC5C58CC6C58CC7C58CC6C58DC7
        C68EC6C68DC7C68EC7C68FC8C68FC8C68FC8C78FC8C790C8C791C8C791C9C892
        C8C892C9C892C9C892C9C993C9C893CAC993CAC994CAC994CAC994CAC995CBCA
        96CBCA96CBCA97CBCA97CCCB97CCCB98CCCB98CCCB99CCCB99CDCB9ACDCB9ACD
        CC9ACDCC9ACECD9ACECD9CCECD9CCECD9CCECD9CCECD9DCECD9DCECD9ECFCE9E
        CFCE9FCFCE9FD0CFA0CFCFA0D0CFA0D0CFA1D1CFA1D1D0A1D1D0A2D1D0A2D1D0
        A2D2D0A3D1D0A4D2D1A3D2D0A4D2D1A4D2D2A5D3D1A6D2D2A6D4D2A7D4D2A6D3
        D2A7D4D3A8D4D3A8D4D3A8D5D3A8D5D4A9D5D3A9D4D4AAD6D4ABD6D4AAD6D4AB
        D6D4ACD6D4ACD6D4ACD6D5ADD6D5ADD7D5ADD7D6AED7D6AFD8D6AFD7D7AFD8D7
        AFD8D6B0D8D7B1D8D7B1D8D7B1D9D7B1D9D8B2D9D8B3D9D8B3DAD8B3D9D8B4DA
        D9B4DAD9B4DBD9B5DAD9B5DBD9B6DBDAB6DBDAB7DBDAB6DCDBB7DCDAB7DCDAB8
        DCDBB8DCDBB8DDDBB9DDDBB9DDDBBADDDCBBDEDCBBDEDDBCDEDCBCDEDCBCDEDD
        BDDEDDBDDEDDBEDFDDBEDFDDBEE0DEBEE0DEBFE0DEBFE0DFBFE0DFC0E1DFC1E1
        DFC1E1DFC1E1DFC1E1DFC2E1E0C3E2E0C3E1E0C4E2E0C4E2E1C4E2E0C4E3E1C4
        E3E1C6E2E1C6E3E1C6E3E2C7E4E2C7E4E2C7E4E3C8E4E2C8E4E3C8E5E3C9E5E3
        C9E5E4CAE5E3CAE6E4CBE5E3CBE6E5CBE5E4CCE6E4CCE6E4CDE7E5CDE7E6CDE7
        E6CEE7E5CFE8E6CFE7E6CFE8E6CFE8E7D0E8E7D0E8E7D1E9E7D2E8E7D1E9E7D2
        E9E7D3E9E8D2EAE8D3EAE8D3EAE8D4EAE8D4EBE8D4EBE9D5EAE9D6EBE9D6ECE9
        D6EBE9D7ECE9D7ECEAD8ECEAD8ECEBD8ECEAD8EDEBD9EDEBDAEDEBDAEDEBDBED
        ECDAEEECDBEEECDCEEECDCEEECDCEFEDDDEFEDDEEFEDDEEFEEDEEFEDDFEFEDDF
        EFEEDFEFEEDFF0EFE0F0EFE1F1EEE1F1EFE1F1EFE2F1F0E2F1F0E3F1F0E2F2F0
        E3F2F0E4F2F1E4F2F1E5F3F0E5F2F1E5F3F1E6F3F1E6F4F2E6F3F2E7F4F2E7F4
        F2E8F4F2E8F4F2E9F5F3E9F5F3EAF5F3EAF5F3EAF6F4EAF5F4EBF5F3EBF6F4EC
        F6F4ECF6F5EDF6F4EDF7F5EDF7F5EEF7F5EEF7F5EEF8F6F0F8F6F0F8F6F0F8F6
        F0F8F7F1F9F6F1F9F7F2F9F7F2F9F7F3FAF8F2F9F8F3F9F8F4FAF9F4FAF8F5FB
        F9F5FBF9F5FBF9F6FBF9F5FBF9F6FCF9F7FBFAF7FBFAF7FCFAF8FCFAF8FCFAF8
        FCFBF9FDFBFAFDFBFAFDFBFAFDFBFBFDFCFBFEFCFCFEFCFCFEFDFDFFFCFDFEFC
        FDFFFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFE80800080800080800080800080800080800080800081
        8100808001808001818101818102818202818103828203828204828204828305
        8382058383058383068383068384068383078484078484088484088485088585
        0885850A85850A86850A85850A85850B85850B86860C86860C86860D86870D87
        870E87870E87870E88870F88870F88870F88880F888810888810888811888911
        8988128989128989138989138A89138A89148A8A158B8A148B8A158B8B168A8B
        168C8B168B8B168B8B178B8C178C8C188D8C188C8C198C8C198D8D1A8D8D198D
        8D1A8D8E1B8E8E1B8E8E1C8E8E1C8E8E1C8F8E1D8F8E1D8F8E1D8F8E1E908F1E
        8F8F1E90901F90901F9090209090209091209190229090229191229191239191
        2392912392922492912493922492922593932593932593922693932793932793
        932794942894942894942894942995942995952A95942A96952A96952A95952B
        96962B96962C96962D97962D97962E96972E97962E97972E97972E98972F9797
        309898309998319998319998319998329999329999339999339A9933999A349A
        9A349A99359B9A349B9A359B9A369B9A369C9B379C9B379B9B379C9C389C9C38
        9D9C399D9C399D9C3A9D9C3A9D9D3A9E9C3A9E9D3B9E9D3B9D9E3C9E9E3C9E9E
        3D9E9E3D9F9E3D9F9E3E9F9E3F9F9F3EA09F3F9FA03FA0A040A0A041A0A041A1
        A041A1A042A1A041A1A042A2A143A1A143A2A243A2A144A2A244A2A245A3A245
        A3A346A3A346A3A346A3A347A4A347A3A348A4A348A4A448A4A449A5A449A5A4
        4AA5A44AA5A44AA5A54BA6A54BA6A64BA6A54CA7A54DA7A64DA6A64DA7A64EA7
        A74EA7A64EA8A64FA7A74FA7A750A8A850A8A850A9A851A8A851A9A952A9A852
        A9A953A9A952AAA953AAAA53AAA955ABA954AAA955ABAA56ABAB56ABAA56ABAB
        57ABAB57ACAB58ABAB57ACAB58ADAB58ADAC59ADAC5AADAD5AADAC5AAEAC5BAD
        AC5BADAD5BAEAD5BAEAD5CAEAD5CAFAE5DAEAE5DAFAE5EAFAE5FB0AE5FB0AF5F
        AFAF5FB0B060B0AF60B1AF61B1B061B1B062B1B062B1B162B2B063B2B163B2B1
        64B2B164B2B265B2B165B3B265B3B265B3B266B3B267B4B266B3B267B4B367B4
        B368B4B369B4B369B5B469B5B469B5B46AB5B56AB5B56AB6B56BB6B56BB6B66C
        B6B56DB7B66DB6B66DB6B66DB7B66EB7B66EB8B66FB8B76FB8B770B8B771B8B7
        70B9B771B9B871B9B872B9B873B9B872B9B872BAB973BAB973BAB975BABA74BA
        B975BAB975BBBA76BBBA76BBBA77BCBA77BCBB77BBBB77BCBB78BCBB78BDBB79
        BDBC79BDBC79BEBC7ABDBC7ABDBD7BBDBD7BBEBD7CBEBD7DBEBD7DBEBD7DBEBD
        7DBFBD7EBFBF7EBFBF7FBFBE7FC0BF80C0BF80C1BF81C0C081C0BF81C1BF81C1
        C082C1C083C1C183C1C183C2C183C2C184C2C184C3C184C3C285C2C286C3C286
        C3C286C3C387C4C387C3C388C4C387C4C388C5C388C5C489C4C48AC5C38AC5C4
        8AC6C48BC5C58BC6C48BC6C58CC7C58CC7C68DC7C58DC7C58EC7C68EC7C68FC7
        C68FC8C78FC8C690C8C790C8C791C9C791C9C792C8C792C9C792C9C893C9C993
        CAC893CAC894CAC994CAC995CBC995CBC995CBCA95CBCA96CBCA97CCCA97CBCB
        98CCCB98CCCB98CCCB99CDCB99CDCB9ACDCC99CDCB9ACDCC9BCECC9ACDCD9BCE
        CC9BCECD9CCFCD9DCECD9DCFCD9DCECE9ECFCE9ECFCE9FD0CE9FCFCF9FD0CEA0
        D0CFA0D0CFA0D0CFA1D1CFA1D1CFA2D1D0A3D1D0A2D2D1A3D2D1A3D2D1A4D2D1
        A4D2D1A5D3D2A5D3D1A6D3D2A5D3D2A6D3D2A7D4D2A7D4D2A8D4D2A8D4D3A8D5
        D3A9D4D3A9D5D4A9D5D3AAD6D4AAD5D4ABD6D4ABD6D5ABD6D5ACD7D5ACD7D5AD
        D6D6ADD6D6AED7D6AED7D6AFD8D6AFD7D6AFD8D6AFD8D6B0D8D7B0D8D7B0D8D7
        B1D8D7B2D9D8B2D9D8B2DAD8B3DAD8B3DAD9B3DAD8B4DAD9B5DAD9B5DAD9B5DB
        D9B6DBDAB6DBDAB7DCDAB7DBDAB7DCDAB8DCDBB8DCDBB8DDDBB9DCDCB9DCDBBA
        DDDCBADDDCBADEDCBBDDDCBBDEDCBBDEDDBCDEDDBDDFDDBDDEDDBEDFDDBEDFDE
        BEDFDEBEE0DDBFE0DEBFDFDEBFE0DFC0E0DFC1E0DFC1E1DFC1E1DFC2E1E0C2E2
        E0C2E1E0C3E2E0C4E2E0C4E2E1C4E2E1C4E3E1C5E3E1C5E3E2C6E3E2C6E3E2C7
        E3E2C7E4E3C7E4E2C8E4E2C9E4E3C9E4E3C9E5E3CAE5E3CAE5E3CAE5E4CBE6E4
        CBE6E4CCE6E4CCE6E5CCE7E5CDE7E5CDE6E5CDE6E5CEE7E5CFE8E6CEE7E6CFE8
        E6D0E8E7D0E9E6D0E8E7D0E9E7D1E8E8D2E8E7D2E9E8D3E9E8D3E9E8D4EAE8D3
        EAE9D4EBE9D5EAE9D5EBE8D5EAE9D6EBEAD6EBEAD6EBEAD6EBEAD8ECEAD7ECEA
        D8ECEAD9ECEAD9EDEADAEDEBD9EDECDAEEECDAEDECDBEDECDBEEECDCEEEDDCEE
        ECDDEFECDDEFEDDDEEEDDEEFEEDFEFEDDEF0EDDFEFEEE0EFEEE0F0EEE0F0EEE1
        F1EFE1F1EFE2F1EFE2F1EFE2F1EFE3F1F0E3F1F0E3F2F0E3F2F0E4F2F0E5F2F1
        E5F3F1E5F3F1E6F3F1E6F3F2E6F3F2E7F4F2E7F4F2E8F4F2E8F4F2E8F4F3E9F4
        F3EAF5F3EAF5F3EAF5F3EAF5F4EBF6F4ECF6F4ECF6F4ECF6F4EDF7F4EDF7F5EE
        F7F5EEF7F5EEF7F5EFF7F6EFF8F6EFF8F6F0F8F6F1F8F6F1F8F6F1F8F7F2F9F7
        F2F9F7F2F9F8F3FAF8F3F9F8F3FAF8F4FAF8F5FAF8F5FAF8F5FAF9F5FBF9F6FB
        F9F6FCF9F7FBFAF7FCFAF8FCFAF8FDFAF9FDFBF9FCFBFAFDFBF9FDFBFAFDFBFB
        FDFCFAFEFBFBFEFCFCFEFCFCFFFCFDFEFCFCFFFCFDFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080
        0080800080800080800080800080800080800080810080810180810281810281
        8102818103818103828203818203828204828204838304838205828306838307
        84830684830684840783840784840885840984840985840985850A85850A8586
        0B85850A85850B86860C86860C86860C87870D87870D87870E87870E88870F88
        880F88871088880F8888118888108889118989118989118989128989138A8913
        8A8A148A8A138A8A158A8A148A8A158B8A158B8B168B8B178B8B178B8B178C8B
        188C8C188C8B188D8C188D8C198D8C198D8D1A8D8D1A8E8E1A8E8E1B8E8D1C8E
        8E1C8E8D1C8E8F1D8E8E1E8F8E1E8F8F1E8F8F1F908F1F908F1F908F20909020
        9090219090219190219190229190229191229191239291239291249292249392
        2493922593922593932693932693932693932694932794932894932894932995
        942994942995952995952A95952B96952B96952B96952B96962C97962D96962D
        96962E97962E97972F97972F98982F9897309898309898309998319898319998
        329998329998329A99329A9A339A99349999349A9A359A9A359A9A359B9A359B
        9A369B9B379B9B369B9B379C9B379C9B389C9C399C9C399D9C399C9D3A9D9D3A
        9D9C3A9D9D3A9D9D3B9E9D3B9E9D3C9E9E3C9E9E3C9F9E3D9F9E3D9F9F3E9F9E
        3EA09F3FA09F3FA09F3FA09F40A0A041A1A041A1A041A0A142A1A042A2A043A1
        A142A2A143A2A143A2A244A2A144A3A145A2A245A3A345A3A246A3A347A3A347
        A3A347A4A347A4A448A4A448A5A449A5A449A5A449A5A54AA5A54BA5A44BA5A5
        4BA5A54CA6A64CA6A54CA6A64CA7A64EA7A64EA7A64EA7A74EA7A74EA8A74FA8
        A74FA8A750A9A850A8A851A8A851A9A852A9A952AAA953AAA953AAA954AAA954
        AAA954AAAA55AAAA55ABAA55ABAA56ABAB56ABAB56ACAB57ACAB57ABAB58ACAC
        58ADAC58ACAC59ACAC5AADAC5AADAC5AADAC5BAEAD5BAEAD5BAEAD5CAEAD5CAE
        AD5CAEAE5DAFAE5EAFAF5EAFAE5EAFAE5FB0AF5FB0AF5FB0AF60B0B060B0AF60
        B1B061B0B062B1B062B1B162B2B163B1B163B2B164B2B264B2B164B3B264B2B2
        66B3B266B3B266B3B367B4B267B3B267B4B368B4B368B4B468B5B469B5B469B5
        B469B5B56AB5B46AB6B56AB6B56BB5B56CB6B56CB6B66CB6B56DB7B66DB6B66E
        B7B66EB7B66EB7B76FB8B66FB8B770B8B770B9B770B8B771B9B772B9B872B9B8
        72B9B873B9B873BAB873BAB973BAB974BAB975BBBA75BBB975BABA76BBBA76BB
        BA76BBBB77BCBB77BBBB78BCBB78BDBB79BCBC79BDBC79BDBC7ABEBC7BBDBD7A
        BEBC7BBEBD7CBEBC7CBEBD7CBEBD7DBFBD7DBEBD7DBFBE7EBFBE7FBFBE7FC0BF
        7FC0BF7FC0BF80C0BF80C0BF81C1C081C1BF81C1BF82C1C083C2C083C2C184C2
        C183C2C084C2C184C2C184C2C185C3C185C3C286C3C286C3C286C3C287C3C388
        C4C387C4C389C4C389C4C48AC5C48AC5C38AC5C48AC5C58BC5C48BC6C58CC6C5
        8CC6C58CC6C58DC6C68DC7C58EC7C68EC7C68EC7C78FC7C690C8C68FC7C790C8
        C790C8C791C9C891C9C791C9C892C9C893CAC893CAC894CAC894CAC894CBC994
        CBCA95CACA95CBC995CBCA96CBCA96CCCA97CCCA98CCCB97CCCB98CCCB99CDCB
        98CDCC99CDCB9ACDCC9ACDCC9ACDCC9BCDCD9BCECD9CCECD9CCECD9CCECD9DCE
        CD9DCFCD9ECFCE9ED0CF9FCFCE9ECFCE9FD0CEA0D0CFA0D1CFA0D0D0A1D0CFA1
        D1D0A1D1D0A2D1D0A2D1D0A3D2D0A3D2D0A3D2D1A4D2D1A5D3D1A5D2D1A5D3D2
        A6D3D2A6D3D2A7D3D2A7D4D3A8D4D2A8D4D3A8D4D3A9D5D3A9D5D4AAD5D4AAD5
        D4AAD6D4AAD5D4ABD5D5ABD6D5ACD6D5ACD6D5ACD7D6ADD6D6ADD7D6AED8D6AF
        D7D6AED7D7AFD8D6B0D8D6B0D8D6B0D9D7B0D8D7B1D9D7B1D9D7B2DAD8B2D9D8
        B3D9D8B3DAD8B4DAD9B4DAD9B4DBD9B5DBD9B5DBD9B6DBDAB6DBDAB7DCDAB7DB
        DAB7DCDAB7DCDAB8DDDAB9DCDBB8DDDBBADDDCB9DDDCBADDDCBBDDDCBBDEDCBC
        DEDDBBDEDDBCDEDDBCDEDDBDDFDDBDDFDDBEDFDEBEDFDDBFE0DEBFE0DEBFE0DF
        C0E1DFC0E1DEC0E1DFC1E1E0C2E1DFC2E2DFC3E1E0C3E1E0C3E2E0C3E2E0C4E2
        E1C4E2E1C5E3E1C5E3E1C5E3E1C6E3E2C6E4E2C7E4E2C7E4E2C7E4E2C8E5E3C8
        E4E3C9E5E3C9E5E3C9E5E3CAE5E3CBE5E4CBE5E4CBE6E4CBE6E4CCE6E5CDE6E4
        CDE6E5CDE7E5CDE7E5CEE7E6CEE7E6CFE8E6CFE8E6D0E8E7D0E9E7D0E9E7D1E9
        E7D1E9E7D1E9E7D2E9E7D2E9E8D3E9E8D4EAE8D4EAE8D4EAE9D4EAE9D5EAE9D5
        EBE9D6EBE9D6EBEAD6EBEAD7EBEAD7ECEAD8ECEAD8ECEAD9ECEBD8ECEBD9EDEB
        DAEDEBDAEDECDBEDEBDBEDECDBEEECDBEEEDDCEFECDCEFECDDEFECDDEFEDDDEF
        EDDEEFEDDFEFEDDFF0EDDFF0EEDFF0EEE0F0EEE0F1EEE1F1EFE1F1EFE1F1EFE2
        F1EFE2F2F0E3F2F0E3F1F0E4F2F0E4F2F1E5F3F0E5F2F0E6F3F1E5F3F1E7F3F2
        E7F4F1E7F3F2E7F4F2E8F4F3E8F4F2E8F5F3E9F5F3EAF5F3EAF5F3EAF5F3EBF5
        F3EBF6F4EBF6F4ECF6F4ECF6F5EDF7F5EDF7F5EDF7F5EDF7F5EEF7F5EFF7F5EF
        F8F6EFF8F6F0F8F6F0F9F7F1F8F7F1F9F7F2F9F7F1F9F7F3F9F7F2F9F7F3FAF8
        F4FAF8F4FBF8F5FAF8F5FBF8F5FBF9F5FAF9F5FBF9F6FBF9F7FCFAF7FCFAF7FC
        FAF8FDFBF8FCFAF9FDFBF9FDFBFAFDFBFAFDFCFAFEFBFAFEFBFBFDFCFCFEFCFC
        FEFDFCFFFCFDFEFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080008080008080008080008080
        0080800080800080800080810181800281810281810281810382810382810382
        8203828204838204828205828205838306838306848307838307838307848408
        84840884840984850985840985850A85850A85860B86850B85850C86860B8686
        0C86860C86870D86870D87870D87870E87870E87870F88871088881088881089
        88118889118989128889128A89128A89138989138A89138A89148A8A148A8A15
        8A8A158B8B168B8A168B8B178C8B178B8B178B8C178C8B188C8C188D8C188D8C
        198C8D1A8D8D1A8D8D1A8D8E1A8E8D1B8E8D1C8E8E1C8E8E1C8E8F1D8F8F1D8F
        8E1D8F8F1E8F8F1F8F8F1F8F8F20908F1F909020909021909021909022919122
        9191229191239291229291239291249292249292259292259293259392269393
        2693932693932793932794942895942894942994942895942995942A95942A95
        942A95952B96952C95962C96952C97962C97962D96962D96972E97972E97972F
        97972F9898309898309998309898319898319998319999329999329999339999
        339A99349A9A349A99359A9A349A9B359A9A369B9B369B9B369B9B379C9B379B
        9B389C9B379D9C389C9C399C9C399D9C399D9C3A9D9D3A9D9D3B9D9D3B9E9D3C
        9E9D3C9F9D3C9E9E3D9F9E3D9E9E3D9F9F3E9F9F3E9F9F3E9F9F3FA0A03FA0A0
        40A0A040A1A041A1A041A1A041A0A142A1A142A1A143A2A143A1A143A2A244A2
        A244A2A245A3A245A2A246A3A246A3A246A3A347A4A347A4A348A4A448A5A349
        A4A349A5A44AA5A44AA5A44AA5A54BA6A54BA5A54BA6A54CA6A64CA6A64DA6A5
        4DA7A64DA7A64EA7A74EA7A74FA7A74FA8A74FA8A750A8A750A8A751A8A851A8
        A851A9A852AAA852AAA953A9A953AAA953AAAA53AAA954ABA954ABAA55AAAA55
        ABAB56ABAA56ABAB56ACAB57ACAB58ACAB58ADAB58ACAB59ACAC59ACAC5AADAD
        5AADAD5AADAD5BAEAD5BADAD5BAEAD5BAEAE5CAFAE5DAFAE5DAEAE5EAFAF5EAF
        AE5FAFAF5EB0AF5FB0AF60B0AF60B0AF61B1AF60B0B061B1B062B1B062B1B162
        B2B162B2B163B2B164B2B164B2B165B2B264B3B265B3B266B3B266B3B367B3B2
        67B3B367B4B368B4B368B4B368B4B369B5B369B5B469B5B46AB5B46AB6B46BB5
        B46BB6B56BB6B66CB6B56CB6B66DB7B66DB7B66DB7B76EB7B76EB8B76FB8B76F
        B8B66FB8B870B9B770B9B871B8B872B9B872B9B872B9B972BAB873BAB873BAB9
        74BAB974BAB974BAB975BBBA76BBBA75BBBA76BBBA76BBBB77BBBB78BCBB77BD
        BB78BDBC79BDBB78BDBC7ABDBC7ABDBC7ABEBC7ABEBC7BBEBD7BBDBD7BBEBD7C
        BEBE7DBFBE7DBFBE7EBEBD7EBFBE7EC0BE7EBFBE7FC0BE7FC0BF80C0BF80C0C0
        81C0BF81C1C081C1C082C1C182C1C083C2C183C2C183C2C184C2C184C2C185C2
        C185C3C286C3C285C4C286C3C287C3C287C4C388C4C388C4C388C4C489C4C389
        C5C48AC5C48AC6C48AC6C48AC5C48CC5C48CC6C58CC6C58DC7C68DC7C68DC7C6
        8EC7C68EC7C68FC7C68FC8C68FC7C790C8C790C8C790C8C891C8C791C9C791C9
        C892C9C892CAC892C9C893CAC993CAC994CAC994CAC995CAC995CBC995CBCA96
        CBCA97CCCA97CBCB97CCCB98CCCA98CDCB98CCCB99CDCC99CDCB9ACDCC9ACDCD
        9BCDCC9BCECC9BCECD9BCECC9DCECD9CCECD9CCECD9DCFCE9ECFCE9ED0CE9FCF
        CE9FD0CFA0D0CEA0D0CFA0D0CFA1D0CFA1D1D0A1D1D0A2D1D0A2D1D0A3D2D1A3
        D2D0A4D2D0A4D2D1A4D2D1A4D3D2A5D2D1A6D3D1A6D3D1A6D4D2A7D4D3A7D3D3
        A7D4D2A8D4D2A8D4D3A9D4D3A9D5D3A9D5D4AAD5D4AAD5D4AAD6D4ABD6D5ABD6
        D4ACD6D5ADD6D5ADD6D6ADD6D5ADD7D6AED8D5AFD8D6AFD8D6AFD8D6AFD8D7B0
        D8D7B0D8D7B1D9D7B1D9D8B1D9D8B2D9D8B2D9D8B3D9D9B3DAD9B4DAD8B4DAD8
        B4DAD9B5DBD9B6DAD9B5DBDAB6DBDAB6DCDAB6DBDBB7DCDBB8DCDBB9DCDAB9DD
        DBB9DCDCB9DDDBBADDDCBADDDBBBDEDCBADDDCBCDEDCBCDEDDBDDEDDBCDEDDBD
        DFDEBDDFDDBEDFDEBEDFDEBFE0DEBFDFDFBFE0DEC0E0DFC0E0DFC0E1DFC1E0DF
        C1E1DFC2E1E0C2E1E0C3E2E0C3E2E0C4E2E0C4E2E0C4E3E1C5E3E1C5E3E1C5E3
        E1C6E3E1C6E3E1C7E4E1C7E4E2C7E4E2C8E4E3C8E4E3C9E5E3C9E5E4C9E5E3CA
        E6E3CAE5E4CBE5E4CBE6E4CCE6E4CCE6E4CCE6E5CCE7E5CDE7E6CDE7E5CEE8E6
        CFE7E6CFE7E6CFE8E6D0E8E6D0E8E6D0E8E6D1E8E7D2E9E8D2E9E7D2E9E7D3EA
        E7D3E9E8D3EAE8D4EAE8D4EAE8D4EAE9D4EAE9D5EBE9D5EBEAD6EBE9D7EBEAD7
        EBEAD7ECEAD8ECEBD8ECEAD8EDEBD9ECEBDAEDEBD9EDECDAEDECDBEDEBDBEEEC
        DBEEECDBEEECDCEEEDDCEEECDDEFECDEEEEDDEEFEEDEEFEDDFF0EEDFEFEEDFF0
        EEE0F0EFE0F0EFE0F0EFE1F1EFE1F1EFE2F1EFE2F2EFE3F2EFE3F1F0E3F1F0E3
        F2F0E4F2F0E5F3F1E5F3F1E5F3F1E6F3F1E6F4F2E7F4F1E7F3F2E7F4F2E8F4F2
        E8F4F2E9F4F3E9F5F3E9F4F3E9F5F4EAF5F4EAF6F4EBF6F3ECF6F4EBF6F4ECF6
        F5EDF6F5EDF6F5EDF7F5EEF7F5EEF7F5EFF7F6EFF8F5F0F8F6F0F8F6F0F9F6F0
        F9F6F1F8F7F1F9F7F2F9F8F2F9F8F3F9F7F3FAF7F3FAF8F4FAF9F4FAF8F5FBF9
        F5FBF9F5FBF9F6FBF9F6FCFAF6FCF9F7FBFAF7FCFAF8FCFAF9FCFAF9FDFBF9FC
        FBFAFDFBFAFDFBFBFDFCFBFEFCFBFEFCFBFEFCFCFFFCFCFEFCFDFEFDFDFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFE8080008080008080008080008080008080008080008080018081
        0081800181810281810281810281820382810382820482820482830582820583
        8206828205838306838406838307838407848307848408848408848409848409
        85840985850A85850B85850B86860B85860C86860C86860C86870D87870E8787
        0E87870E87870E88880F87870F87881089881088881088881188891289891289
        89128A89138A89138A89148A8A148A8A148A8A158B8A158B8A158B8B168B8B16
        8C8B168C8C178B8C178C8C188C8C188C8D198D8C198C8C198D8D1A8D8D1A8D8D
        1A8E8D1B8E8E1B8E8E1C8E8E1C8E8E1D8E8F1D8F8F1E8F8F1E8F8F1F908F1E90
        8F1F90901F909020919021909020909121919121919022919122919222919223
        9292249292249292249292249392269392269392269393269393279393279493
        2794942894942894942994942995952A95952A95952A95952A96952B96952C96
        962C96962D96972D97962D97962E98972E98972F98972F97972F989730989730
        9898319998309898319999329999329A98329A99339A99339A9A349A99349A99
        359A9A359B9A359B9A369B9B369C9B369C9B379C9B379C9B389C9C389D9C389C
        9C399D9C399D9C3A9D9D3A9D9D3A9D9D3B9E9E3C9E9E3C9E9D3C9E9E3C9F9E3D
        9F9E3D9F9E3E9F9F3E9F9E3F9F9F3FA09F3FA0A040A1A040A1A041A1A041A1A1
        41A1A141A1A043A2A142A2A143A1A144A2A144A3A145A2A245A2A245A2A246A3
        A246A3A346A4A346A3A347A4A348A4A448A5A348A5A449A4A449A5A44AA5A54A
        A5A44AA5A54BA6A54BA6A54CA6A64CA7A64CA6A64DA7A64DA6A74DA7A64EA7A7
        4EA7A74FA7A74FA8A750A8A750A8A850A9A851A8A851A9A852A9A853A9A952AA
        A953A9A953AAA954AAA954AAA954ABAA55ABAA56AAAA56ABAA56ABAA57ACAB57
        ABAB57ACAB57ACAC58ADAC59ACAC59ADAC59ADAD5AADAD5AADAD5AAEAD5BAEAD
        5BADAE5CAFAE5CAFAD5CAFAE5DAFAE5EAFAE5EAFAE5EB0AE5EB0AE5FB0AF60B0
        B060B0AF60B1B061B1AF61B1B062B1B161B1B062B2B063B2B163B2B163B2B163
        B2B265B2B265B3B265B2B265B3B266B3B366B4B267B4B368B4B367B4B368B4B4
        69B5B469B5B469B5B46AB5B56AB5B46AB5B56BB5B56BB6B56CB6B56CB6B56CB7
        B66DB7B66DB6B56EB7B66EB7B76EB8B66FB8B76FB8B76FB8B770B8B770B8B771
        B9B771B9B872B9B872BAB972BAB873BAB973BAB973BAB974BABA74BAB975BBB9
        75BABA75BBBA76BBBA76BBBA77BCBB77BCBB78BCBB78BCBB78BDBC79BDBC79BD
        BC7ABDBC7ABDBC7BBDBC7BBEBD7BBDBD7CBEBD7CBEBD7DBEBD7DBFBE7DBFBE7E
        BFBE7EC0BE7FBFBE7FC0BE7FC0BE80C0BF80C0C080C1C081C0BF81C1C082C2C0
        83C1C183C2C083C2C184C2C183C2C184C2C184C2C185C2C286C3C186C3C286C4
        C286C4C387C4C387C4C388C4C389C4C389C4C389C5C38AC5C48AC5C48AC6C48A
        C6C58CC6C58CC6C58CC6C58DC6C58DC7C58DC6C58DC7C68EC7C68FC7C68FC8C7
        8FC8C68FC8C790C9C790C9C791C9C891C9C792C9C892C9C892C9C892C9C994CA
        C994CAC994CAC994CBC995CAC995CBCA96CBCA96CBCA96CBCA97CCCA98CCCA97
        CCCB98CCCB98CCCB99CDCC99CDCC9ACDCB9ACDCC9BCDCD9BCDCC9CCECD9BCECD
        9CCECD9CCECD9DCECE9DCFCE9ECFCE9ECFCE9FCFCE9FD0CFA0D0CFA0D0CFA0D1
        CFA1D0CFA1D1CFA2D1CFA2D1D0A2D1D0A3D1D0A3D2D0A3D2D0A4D3D1A4D3D1A5
        D2D2A5D2D2A6D3D2A6D3D2A6D3D2A7D3D2A7D4D2A7D4D3A8D4D3A8D4D3A8D4D3
        A9D4D4A9D5D3AAD5D4AAD5D4ABD6D5ABD5D4ABD6D5ACD7D5ACD7D5ACD6D5AED6
        D6ADD7D5ADD7D6AED7D6AFD8D6AFD8D6AFD8D7B0D8D6B1D8D7B1D8D7B2D9D8B2
        D9D8B2D9D8B2DAD8B3DAD8B3D9D9B3DAD9B4DAD9B5DAD9B5DAD9B5DBDAB6DBD9
        B6DBDAB7DCDAB7DCDAB7DCDBB8DCDBB8DCDBB9DCDBB9DDDBB9DDDBBADDDBBADD
        DBBBDEDCBBDDDCBBDEDCBCDEDDBCDEDDBCDEDDBDDFDDBDDFDDBEDFDDBEE0DEBE
        DFDEBFDFDEBFE0DEC0E0DFC0E1DFC0E1DFC1E1DFC1E1DFC1E1DFC2E2DFC2E2E0
        C3E1E0C4E2E0C4E2E0C4E2E0C4E3E1C5E3E1C5E3E1C6E3E1C6E3E2C6E4E2C7E4
        E2C7E4E3C8E4E2C8E4E3C9E5E3C9E4E3C9E5E4CAE5E3CAE5E4CBE6E4CBE6E5CC
        E6E4CCE6E4CCE6E5CDE7E5CDE7E5CDE7E5CEE7E5CEE7E6CFE8E6CFE7E6D0E8E7
        CFE8E7D0E8E7D1E8E6D1E8E7D1E9E8D2E9E8D2E9E7D3EAE8D3EAE8D4EAE8D4EB
        E8D4EAE9D5EAE9D5EBE9D6EBEAD6EBEAD6ECEAD6ECE9D7ECEAD7ECEAD8ECEBD8
        ECEAD8ECEBD9EDEBD9EDEBDAEEECDAEDEBDBEEECDBEEEDDBEEECDCEEECDCEEED
        DDEEEDDDEFEDDEEFEDDEEFEDDEEFEDDEF0EDDFF0EEE0F0EEE0F0EFE0F1EEE1F1
        EFE2F1EFE2F1EFE2F1EFE2F2EFE3F1F0E4F2F0E4F2F0E4F2F1E4F2F1E5F3F0E5
        F2F1E6F3F1E6F4F2E6F3F2E7F4F2E8F4F3E7F4F2E8F5F3E9F5F2E9F5F2E9F5F4
        EAF5F3EAF6F3EAF5F3EBF6F4EBF6F4EBF6F4ECF6F4ECF7F5EDF7F5EDF6F5EEF7
        F5EFF7F6EFF7F6EFF8F6EFF8F7F0F8F6F0F9F6F1F9F6F1F8F7F1F9F7F2F9F7F2
        F9F8F3F9F8F4F9F8F4FAF8F4FAF8F4FAF8F5FBF9F5FAF9F5FBF9F6FBF9F6FCFA
        F7FBFAF7FCFAF7FCFAF8FCFBF8FDFAF8FDFAF9FDFBF9FDFBFAFDFCFBFEFCFAFD
        FBFBFEFCFBFEFCFCFEFCFDFEFDFDFFFCFDFFFCFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000
        8080008080008080008080008080008080008080008181028181028181028181
        0382820382810381820482820482820483820583830583830683830684830683
        830783830784840884840885840884850985840A85850985850A85850A85850B
        85860B86860C86850C86870C87860D86870D87860E87870E88870E88870F8888
        0F8887108888108888108989118989128989128989128A89138A89138A8A138A
        89138A8A148B8A158B8A158B8A168B8B168B8B168B8C168C8B178B8C188C8B17
        8C8C198D8C198D8C198D8D1A8D8D1A8D8D1A8D8D1A8D8D1B8E8E1C8E8E1C8E8E
        1C8E8E1D8F8E1D8E8F1E8F8F1E8F8F1F8F8F1F90901F8F902090902090902191
        9121919022919021919122929122919122929124929224929124939225939224
        9392259392269393269493279393279494289493289494289594299594299495
        2994942A95942A95952B95952B95952C96962C96952C96962C97962D97962E97
        972D97972E97972F97972E989830989730989830989831989831989831999932
        9998329999339999339A99339A99349A9A349B9A359B9A359B9A359A9A369C9B
        369B9B379B9B379B9B379C9C389C9B389C9C389C9C399D9C399D9D3A9E9D3A9D
        9D3A9E9D3B9E9D3C9E9E3C9E9D3C9F9E3D9F9E3D9F9E3D9F9E3E9F9F3EA09E3F
        A09F3FA09F40A09F40A0A040A1A040A0A041A1A042A1A042A1A142A1A143A2A1
        44A2A143A2A144A2A244A3A244A3A245A3A345A3A346A3A347A4A347A3A348A4
        A348A4A348A5A348A5A449A5A449A5A44AA5A44AA5A54AA5A54BA5A54BA5A54B
        A6A54CA7A64CA6A64DA6A64DA7A74EA7A74EA7A64EA7A64FA8A750A8A74FA8A7
        51A8A851A9A751A9A852A9A952A9A952A9A853AAA953AAA953AAA954AAAA54AA
        AA55ABAA55ABAA55ABAA55ABAA56ABAB56ABAB57ACAB58ACAB58ADAB58ACAB58
        ACAC59ADAC59ADAC59ADAD5AAEAC5BADAC5BADAD5BAEAD5CAEAE5CAEAE5DAEAE
        5DAFAE5DAFAE5EAFAE5EAFAF5EB0AF5FB0AF60B0AF60B0AF60B0B061B0AF61B0
        B062B1B062B2B063B1B062B2B163B2B163B2B164B2B164B2B265B2B265B3B266
        B3B366B3B266B3B367B3B367B3B368B4B368B4B368B5B468B4B46AB5B46AB5B5
        6AB5B56AB5B56BB5B46BB6B56CB6B56CB6B66CB6B56DB7B56DB7B66EB7B66EB8
        B66EB8B66FB8B76FB8B770B9B770B9B771B8B871B8B871B9B872B9B872B9B872
        BAB973BAB973B9B974BAB975BBB974BABA75BABA75BBBA75BBBA76BBBA76BCBA
        77BCBA77BCBA77BCBB78BDBC78BCBC79BDBC7ABDBC79BDBC7ABDBC7ABDBC7BBD
        BD7CBEBD7BBFBD7CBEBE7CBFBD7CBEBD7EBFBE7EBFBE7EC0BF7FBFBE7FC0BE80
        C0BF80C0BF80C1C081C1BF81C0C081C1BF82C2C082C1C082C2C184C2C183C2C1
        84C2C184C3C185C2C185C2C286C3C286C3C287C3C286C4C287C4C288C4C388C4
        C388C5C488C5C489C5C38AC5C48AC5C48BC6C48BC6C58BC5C48BC6C58BC6C58C
        C7C68DC7C68DC7C58EC6C68EC7C68FC7C78FC8C690C8C78FC8C690C8C791C8C7
        91C8C791C9C892C9C892C9C893CAC893CAC893CAC993CAC994CAC994CAC995CB
        C995CBC995CBCA96CBCA97CBCA97CBCB97CCCB98CCCB98CCCB99CDCB98CDCB99
        CDCC9ACDCC9ACDCC9ACDCD9BCECD9CCECC9CCECD9CCFCD9DCECD9DCFCD9ECFCE
        9ECFCE9ECFCE9ED0CE9FD0CE9FCFCE9FD0CFA0D1CFA1D1CFA1D1CFA1D1D0A2D1
        CFA2D1D0A3D1D0A3D2D1A3D2D1A4D2D1A4D3D1A5D3D2A5D3D2A5D2D2A5D3D2A6
        D3D2A7D4D3A7D3D2A8D4D3A8D4D3A8D4D3A8D5D3A9D5D3A9D5D3A9D5D4ABD6D4
        ABD5D5ABD5D4ABD6D4ACD6D5ACD6D5ACD7D5ADD7D6ADD7D5AED7D6AED7D6AED8
        D6AFD8D7B0D8D6B0D9D7B0D8D7B1D9D7B1D9D7B1D9D8B2D9D7B2DAD8B2DAD9B3
        DAD8B3DAD9B4DAD9B4DAD8B4DAD9B6DAD9B6DBD9B6DBDAB6DBD9B6DCDAB7DBDA
        B8DCDAB8DDDBB8DCDBB8DCDBB9DDDCB9DDDCBADDDBBADEDCBBDDDCBBDEDCBCDE
        DCBCDEDDBCDFDDBDDFDDBDDFDDBEDFDEBEDFDDBFDFDDBFE0DEBFDFDEBFE0DEC0
        E0DFC0E1DFC1E1E0C2E1DFC2E1E0C2E2DFC3E1E0C3E2E0C4E2E0C4E2E1C4E2E1
        C5E2E1C5E2E2C6E3E1C6E3E2C6E3E2C7E3E2C7E3E2C7E4E2C8E4E2C8E5E2C8E5
        E3C9E5E3C9E5E4CAE5E4CAE5E3CBE6E4CBE5E4CCE6E4CCE6E4CCE7E5CCE7E5CD
        E7E5CEE7E5CEE7E6CEE7E5CFE8E6CFE7E6D0E7E7D0E8E7D0E9E6D1E8E7D1E9E7
        D1E9E7D2E9E7D2E9E8D3EAE8D3EAE8D4EAE8D4EAE9D4EBE8D5EBE9D5EBE9D5EB
        E9D6EBE9D6EBEAD7ECEAD7EBEAD8ECEAD8ECEAD9ECEBD8EDEBD9EDEBD9EDEBDA
        EDECDBEDECDAEDECDBEEECDBEEECDCEFECDDEEECDDEFEDDDEFEDDEEFEEDEEFEE
        DFEFEEDFEFEEE0EFEEDFF0EEE0F1EEE1F1EEE1F1EFE1F1EFE1F1EFE2F1F0E2F1
        F0E2F2F0E3F2F0E4F2F1E4F2F0E4F2F1E5F3F1E6F3F1E6F3F1E6F3F2E6F3F1E7
        F4F2E8F4F2E8F4F2E8F4F3E9F5F3E9F5F3E9F5F3EAF5F3EAF5F4EBF6F4EBF5F4
        EBF6F4ECF6F4ECF6F4EDF7F4EDF6F5EDF7F5EEF7F6EFF7F5EEF8F6EFF8F6EFF8
        F6F0F8F6F0F8F6F1F9F6F1F9F7F2F9F7F2F9F7F2F9F7F3F9F8F3FAF8F4FAF8F4
        FAF8F5FAF9F4FBF8F5FBF9F6FBF9F6FBFAF6FBFAF7FBF9F7FCFAF7FCFAF8FCFA
        F8FDFBF8FDFAF9FDFBFAFDFBFAFDFCFAFDFBFAFDFBFBFEFBFBFEFCFCFEFCFDFE
        FCFDFFFCFDFFFDFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000808000808000808000808000
        8080008081008080008181018181018181038181028181038282038282048282
        0482830583820583830583830583830683830683830784840784840884840984
        850985840985850985850A85850A85850B85850B86860B86860C86860C87860D
        87860D87870E87870D87870E88870E87880F88880F8888108888108888118988
        118988118889128989128A8A138A89138989138A8A148A8A148B8A158B8B158B
        8B158B8B168B8B168C8B178C8C178B8B188C8C188D8C188C8C188D8C198D8C19
        8D8D1A8D8D1B8E8D1B8E8E1B8E8D1C8E8E1C8E8E1C8E8F1D8F8E1D8F8F1D8F8F
        1E8F8F1E8F8F1E908F1F8F8F1F90902091902091912190902190902291902292
        9122919222919124929224929224929224929225939225939326939326939326
        93932794932894932894942895942994942895952995952A95952A95952B9696
        2B95962B96962C96962D96962C97972D97962D97972E97972E97972E98972F98
        972F9897309898309998319898319998319899329A99329999339A9933999933
        9A9A349A9A349A9A349A9A359B9A359B9A369B9A379C9A379C9B379C9C379C9C
        389C9B389C9C399D9C399C9C399D9D3A9D9D3A9D9D3B9E9D3B9E9D3C9E9E3C9E
        9E3C9F9E3C9F9F3D9E9F3D9E9F3E9F9F3E9F9F3EA09F3FA0A040A0A040A0A040
        A0A041A1A041A1A142A1A042A1A142A2A143A1A143A2A144A2A144A2A244A3A2
        45A2A345A2A346A3A346A3A346A3A346A4A347A3A348A4A348A4A448A4A449A5
        A449A5A44AA5A44AA5A44AA5A54BA6A54BA6A54BA6A54CA6A64DA7A64DA7A64E
        A7A64EA7A74EA7A64EA7A74FA7A74FA8A74FA8A750A8A850A8A851A8A851A9A8
        51A9A852A9A852A9A953A9A953AAA954AAA954AAAA55ABAA55ABAA55ABAA56AB
        AA56ACAA57ABAB57ABAB57ACAB58ACAC58ADAC58ACAB59ADAB5AADAD5AADAC5A
        ADAC5BAEAD5CAEAD5BAEAD5CAEAD5CAEAE5CAFAE5DAFAE5DAFAE5EAFAF5EB0AF
        5EB0AF5FB0AF60B0AF5FB0AF60B0AF61B1B061B1B061B1B062B1B063B2B063B2
        B163B2B164B2B164B2B264B3B164B3B265B3B266B3B266B3B366B3B266B3B368
        B4B367B4B368B5B368B5B469B5B369B5B46AB5B46AB5B46BB5B46BB6B56BB5B5
        6BB6B56CB6B56CB6B56DB6B66DB7B66EB7B66EB8B76EB8B66EB7B770B8B770B8
        B770B8B770B8B771B9B872B9B871B9B972B9B973B9B973B9B973BAB973BAB975
        BAB974BBB975BBBA75BBBA76BBBA77BCBB76BBBA77BCBA77BCBB78BCBC78BCBB
        79BDBB79BDBC7ABDBC7ABDBC7ABDBD7BBEBD7BBEBD7CBEBD7BBEBE7CBEBE7CBE
        BD7DBFBE7EBFBE7DBFBE7EBFBE7FBFBF7FBFBF80BFBF80C0BF80C0BF81C0C081
        C1C082C1C082C1C082C1C083C1C083C2C184C2C183C2C184C2C184C2C285C3C2
        85C3C285C3C286C3C387C4C287C3C387C4C388C4C389C4C488C5C389C4C48AC5
        C48AC5C48BC6C58BC6C58BC6C58CC6C58CC7C58CC6C58DC6C58DC7C68EC7C58E
        C7C68EC8C78FC7C78FC8C78FC8C690C8C790C8C791C8C791C9C792C9C892C9C8
        93C9C893CAC893C9C894CAC994CAC994CBCA95CAC995CBCA95CBCA96CBCA97CC
        CA97CCCB97CCCB98CCCB98CCCB98CDCB99CCCC99CDCC9ACDCC9ACECC9ACECC9B
        CECC9BCECD9BCECD9CCECD9CCECD9DCECE9DCFCE9ECFCE9ECFCE9FCFCE9FD0CF
        A0CFCFA0D0CFA1D0CFA0D0CFA1D1CFA1D1D0A2D1D0A2D1D0A3D1D0A3D2D1A4D2
        D1A3D2D0A4D3D1A4D2D1A5D2D1A6D3D1A6D3D2A6D3D2A6D4D2A7D3D2A8D4D2A7
        D4D3A8D5D3A9D5D3AAD4D4AAD5D3AAD5D4AAD5D4ABD6D4ABD6D4ABD6D4ACD6D5
        ADD7D5ADD7D5AED7D5ADD7D5AED7D5AED7D6AFD7D6AFD7D7B0D8D6B0D8D6B1D9
        D7B0D9D7B1D9D7B2D9D7B2D9D7B2D9D8B3DAD8B3DAD8B3DAD9B3DAD9B4DAD9B5
        DBD9B5DAD9B5DBDAB6DCDAB6DCDAB6DBDAB8DCDAB8DCDAB8DDDBB8DCDBB9DDDB
        B9DDDBBADDDBBADEDCBBDEDCBBDDDCBBDEDCBCDEDDBCDEDDBCDEDDBDDFDDBDDF
        DDBEDFDDBEDFDEBEDFDEBFDFDEBFDFDFBFE0DFC0E0DFC0E1DEC0E1DFC2E1DFC1
        E1E0C2E1E0C2E2E0C3E2E0C3E2E0C3E2E0C4E2E1C4E2E1C5E3E1C5E3E2C5E3E1
        C7E4E2C7E4E2C7E4E2C7E4E3C8E5E2C9E5E3C9E5E3C9E5E3CAE5E3CAE5E4CBE5
        E4CBE5E4CBE6E4CBE6E4CCE6E4CCE7E5CCE6E5CDE7E5CEE7E5CEE7E5CEE7E6CE
        E8E6CFE7E6D0E8E6D0E8E7D0E8E7D0E9E7D1E9E7D2E9E7D2E9E7D2EAE7D3E9E8
        D3EAE8D3EAE8D4EAE9D4EBE8D5EBE9D5EBE9D5EBEAD6EBEAD6ECE9D7ECEAD7EB
        EAD8ECEAD8ECEBD9EDEAD9ECEAD9ECEBDAEDECDAEDEBDBEEECDBEEEBDBEDECDC
        EEECDCEEECDDEFEDDCEEEDDDEFEDDDEFEEDEEFEEDEEFEDDFF0EEDFF0EEE0F0EE
        E0F1EFE1F0EFE1F0EFE2F1EFE1F2EFE2F1EFE3F1EFE3F1F0E3F1F0E4F2F1E4F2
        F1E4F2F1E5F2F1E5F3F1E5F3F1E6F3F1E7F3F2E7F4F2E7F4F2E8F4F2E8F4F2E8
        F4F2E9F5F3EAF5F3EAF5F3EAF6F3EBF5F4EAF5F4EBF6F4EBF6F5ECF7F5EDF6F5
        EDF7F4EEF7F5EEF7F5EEF7F5EFF8F6EFF8F6F0F8F6F0F8F6F0F8F7F1F8F7F1F9
        F6F2F9F7F2F9F7F2F9F7F3FAF7F3F9F7F3FAF8F4FAF8F4FAF9F5FAF9F5FBF9F6
        FBF9F6FBF9F6FCF9F7FBF9F7FCFAF7FCFAF7FCFBF8FCFAF9FCFBF9FDFBFAFDFB
        FAFDFCFBFDFCFBFDFBFBFEFBFCFEFBFCFEFCFDFEFCFDFFFDFDFFFCFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFE808000808000808000808000808000808000808000808001808001808101
        8181028181028181038182038282038281038281048383058382048383058383
        0583830684830683840784840784840784840884850884850984850985850985
        850A86850A86850B86850C86860C86860C87870D86860D87870D86870E87870E
        87870F88880F88870F8887108888108888118888118888128989128989138989
        13898A138A8A148A89148A8A148A8A158B8B158B8A158B8A168C8B168B8B178C
        8C178C8C178C8C188C8C188C8C198D8C198D8C198D8C1A8D8D1A8D8D1B8D8D1B
        8E8D1B8E8E1C8E8E1C8E8E1D8E8E1D8F8E1E8F8F1E8F8F1E908F1E908F1F908F
        1F90902090902090902191902191912191912291912392922391922392922492
        9224929225929225929226939226939326939326939327949327949428949428
        95942894942995952995952A95942A95952B96952B95962C96962C96952C9796
        2D97962D96972D96972E97972E97972F98982F98972F98983098983099973198
        98319999319999329999329A98339A99339999339A9A349A9A349A9A359B9A35
        9B9A359B9A359B9B369B9B369B9B379B9C379C9C389C9C389C9C399C9C3A9C9C
        3A9D9D399D9D3A9D9D3A9D9E3B9D9D3B9E9E3C9E9E3D9F9E3C9F9E3D9F9E3D9F
        9E3E9F9F3EA09E3E9F9F3F9FA040A0A040A1A040A0A041A0A041A1A042A1A142
        A1A042A2A143A2A143A1A144A2A244A2A144A2A245A3A246A3A246A3A246A3A3
        47A3A347A4A347A4A348A4A448A4A448A4A449A4A44AA5A44AA5A44AA5A54AA6
        A54BA5A54BA5A54BA6A54CA6A64DA6A54DA7A64DA6A64DA7A64EA7A64FA8A64F
        A7A74FA8A750A8A750A9A751A8A750A9A852A9A852A9A953A9A852A9A853AAA9
        54AAA954AAA954ABAA55AAAA55AAAA55ABAB55ABAA56ABAB57ACAB57ACAB57AC
        AB58ACAC58ADAC59ADAC59ACAC59ADAC5AADAC5AADAD5BAEAD5BAEAD5BAEAD5C
        AEAE5CAEAD5DAEAE5DAFAE5EAFAE5EAFAF5EAFAF5FB0AF5FB0AF5FB0AF60B1AF
        60B0B061B0AF61B1B062B1B062B2B062B1B163B2B163B2B163B2B264B2B165B2
        B165B2B265B3B266B3B366B4B267B4B367B4B367B4B367B4B368B4B368B4B369
        B5B469B5B46AB5B56AB5B56AB5B56AB5B56BB6B56CB6B56CB6B56DB6B66DB7B5
        6DB7B66EB7B66EB7B76EB7B76FB8B770B8B770B8B770B8B771B9B871B8B872B8
        B872B9B872B9B873B9B873BAB974BAB974BAB975BAB975BAB975BABA75BBBA76
        BBBA76BBBA77BBBB77BCBA77BBBB77BCBB78BDBB78BCBC79BDBC7ABDBC79BDBC
        7ABEBC7ABEBC7BBEBD7BBEBD7CBEBD7CBFBE7DBEBD7DBFBE7EBFBE7EBFBE7EC0
        BE7FC0BE7FBFBF7FBFBF80C0BF80C0BF80C0BF81C1C081C1C082C1C083C2C082
        C1C083C2C084C2C184C2C184C2C185C3C286C2C185C3C286C3C287C4C287C3C2
        87C3C387C4C388C4C388C4C389C5C389C5C48AC5C489C5C58AC5C48BC6C48BC5
        C58BC6C58CC6C58CC6C58DC7C58DC7C68EC7C58EC7C68FC8C68EC8C68FC8C78F
        C8C790C8C790C8C791C8C891C9C792C9C892C9C892C9C893CAC893CAC894CAC9
        94CAC995CAC995CBCA95CACA95CBCA96CBCA97CBCA97CBCA98CCCB98CCCB98CC
        CB98CCCC98CDCB99CDCB99CDCC9ACDCC9BCDCC9BCDCD9CCECC9BCECD9CCECD9C
        CECD9DCFCD9DCECE9ECFCD9ED0CE9FCFCE9FD0CE9FCFCE9FD0CEA0D0CFA1D0CF
        A1D1CFA2D0CFA2D1CFA2D1D0A2D2D0A3D2D1A4D2D0A4D2D1A4D2D1A5D3D1A5D2
        D1A5D3D2A6D3D2A7D3D2A7D4D2A8D4D2A7D4D3A8D4D2A8D4D3A8D4D3A9D5D3AA
        D4D4AAD5D4AAD6D4AAD6D4ABD6D4ACD6D5ACD6D5ACD7D5ADD7D5ADD6D5AED7D5
        AED7D6AED7D6AFD8D6AFD8D6AFD8D7B0D8D7B0D8D7B1D9D7B1D9D7B2D9D8B2D9
        D8B2D9D8B3D9D9B3DAD8B3DAD8B4DAD9B4DAD9B5DBD9B6DBD9B5DBD9B6DBDAB6
        DBDAB6DBDAB8DCDAB8DCDAB8DCDBB8DCDBB9DCDCBADDDBBADDDBBADEDCBBDDDC
        BBDDDCBCDEDCBCDEDCBCDEDDBCDFDDBDDFDDBDDEDDBEDFDDBEE0DDBEE0DEBFDF
        DFBFE0DFBFE1DFC0E0DFC1E0DEC1E0E0C2E0E0C2E1DFC2E1E0C3E1E0C3E1E0C3
        E2E0C3E2E0C4E2E1C4E2E1C5E3E1C5E3E1C6E3E2C6E3E2C7E3E2C7E3E2C7E4E3
        C8E4E3C8E4E3C9E5E3C9E4E3C9E5E3CAE5E3CAE5E4CBE6E4CBE6E4CBE6E4CCE6
        E4CDE6E4CDE6E5CDE6E5CDE7E5CEE7E6CFE7E6CEE7E6CFE8E6D0E8E7D0E8E6D0
        E8E7D1E9E7D1E9E7D2E9E7D2E9E8D2E9E8D3E9E8D3E9E8D4EAE8D4EAE9D5EAE8
        D5EBE9D5EBE9D6EBEAD6EBEAD6ECE9D7ECEAD7ECEAD7ECEBD8ECEBD8EDEBD9EC
        EBD9EDECDAEDEBDAEEECDBEDEBDBEDEBDBEEECDBEFEDDCEEEDDCEFEDDDEFEDDD
        EFEDDEEFEDDEEFEDDEF0EEDFF0EEDFF0EEDFF0EEE0F1EFE1F0EFE1F1EFE1F1EF
        E2F1EFE2F1EFE2F1F0E3F1F0E4F1F0E4F2F0E4F2F1E5F3F1E5F3F1E5F3F1E5F4
        F1E6F3F1E7F3F2E6F3F2E7F4F2E8F4F2E9F4F3E8F4F2E9F4F3E9F5F3E9F5F3EA
        F5F4EBF6F4EBF6F4ECF6F4ECF6F4EDF7F5EDF6F5EDF7F5EDF7F5EDF7F5EFF7F6
        EFF7F6EFF8F6F0F8F6F0F8F6F0F8F6F0F9F6F1F8F7F2F9F7F2F9F7F2FAF8F3FA
        F7F3FAF8F3FAF8F4FAF8F5FAF9F5FBF8F5FAF9F6FBF9F6FBF9F6FBF9F7FBF9F7
        FCFAF7FCFAF8FDFAF8FDFBF9FCFAF9FCFBF9FDFBFAFEFBFBFDFBFBFEFCFBFEFC
        FBFEFCFCFEFCFCFEFCFCFEFDFDFFFCFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE80800080800080800080
        8000808000808000808000808000818001808101818102818102818202818103
        8282038282048282048282048382058283068383068383078383068383078483
        0884840884840884840985840884840985840A85850A86850A86850B86860C86
        850C86860C86860D86870D87860E87870E87870E87870E88870F888810878810
        8888108888118989118988118989128989128989138A89138989148A8A148A8A
        158A8B158A8A158B8B168B8B158B8A178C8B168C8C178C8C178C8C178D8C188C
        8C198C8C198D8C198D8D1A8D8D1A8D8D1A8E8D1B8E8D1C8E8E1C8E8E1D8E8E1D
        8E8E1D8F8F1D8F8F1E8F8F1F908F1F908F1F90901F9090209090209090219191
        2191902291902291912291912391912392912492912493922492922593932693
        9325939226939326939327949328939327949328949429949428949429959429
        95952A96952A95952A96952B96952C96962C96962D96962D97962D97962D9797
        2E97972F98972F98972F98973098983098983199983198983298993299993299
        99329A9933999A349A9A339A99349A9A349A9A359A9A359B9A359C9B379C9B37
        9B9B379C9B379C9B389C9C389D9C389D9C399D9C399C9D3A9D9D3B9E9D3B9E9D
        3B9E9D3B9E9D3C9E9E3C9E9E3D9F9E3D9F9E3E9F9E3E9F9E3E9F9F3F9F9F3FA0
        9F40A09F40A09F40A0A041A0A041A0A042A1A042A1A142A1A142A1A143A1A143
        A2A144A2A245A2A245A3A245A3A345A3A246A3A346A3A346A4A347A4A447A4A4
        48A5A348A4A449A5A449A5A449A5A44AA5A54AA6A54AA5A54BA6A54BA6A54CA6
        A54CA7A64CA7A64DA7A64EA7A64EA7A64FA7A74FA8A750A8A750A8A750A8A850
        A8A851A9A852A8A852A9A952A9A852AAA853AAA954AAA954AAAA54AAA955AAAA
        55ABAA56ABAA56ABAB56ACAA56ABAA57ACAB58ABAB58ACAB58ACAC59ACAB59AD
        AC5AADAC5AAEAC5AADAD5AAEAC5BAEAD5CAEAD5CAEAE5CAEAD5CAFAD5DAFAE5E
        AFAE5EAFAF5FAFAF5EB0AE5FB0AF5FB0AF60B0AF60B0AF60B0B061B1B062B1B0
        61B1B163B1B163B1B163B2B163B2B164B2B165B3B165B3B265B3B265B3B266B4
        B266B4B266B4B267B4B368B4B368B4B369B4B369B5B469B5B46AB5B46AB5B46A
        B5B56BB5B46BB6B56BB6B56CB6B56DB7B56DB7B66DB7B66EB7B66EB7B66FB7B7
        6EB7B770B8B770B8B770B8B770B8B871B8B871B9B871B9B872B9B872B9B973BA
        B973B9B974BAB974BBB974BBBA75BBBA76BBB976BBBA76BCBB76BBBA77BCBB77
        BCBB78BDBB78BDBB78BCBB79BDBC79BDBC7ABDBC7BBDBD7ABEBC7BBDBD7BBEBD
        7CBEBD7CBEBD7CBEBD7DBEBE7EBFBE7EBFBE7EBFBE7EC0BE7FC0BF7FC0BF80C0
        BF81C0BF81C1BF81C0C081C1C082C1C082C1C083C1C083C2C183C2C084C2C185
        C2C184C2C186C3C285C3C186C3C286C3C286C4C387C3C387C4C387C5C389C4C4
        88C5C389C4C48AC5C48AC5C48AC5C48BC6C58BC6C48CC6C58CC6C58CC6C58DC7
        C58DC7C68EC7C58EC7C68EC7C78EC8C78FC8C78FC8C790C8C790C8C791C9C792
        C9C792C9C892C9C893CAC892C9C893CAC893CAC994CAC994CACA95CBCA95CAC9
        96CBCA96CBCA97CBCA97CCCA98CCCB98CCCB98CCCC99CCCC99CCCC9ACDCB9ACD
        CB9ACDCC9BCDCD9BCECD9CCECC9CCECD9DCECD9CCECD9DCFCE9DCFCD9DCFCE9E
        CFCE9FCFCE9FCFCE9FD0CFA0D0CFA0D0CFA1D1CFA1D0D0A1D1CFA2D1D0A2D1D0
        A2D1D0A3D2D0A4D2D1A3D2D1A4D2D1A4D3D1A5D3D1A5D3D2A6D4D2A7D3D2A6D3
        D3A7D4D2A7D4D3A8D4D2A8D4D3A8D5D3A9D5D3A9D5D4AAD5D4AAD5D4ABD5D4AB
        D6D4ABD6D5ACD6D5ACD6D5ADD7D5AED7D5AED7D6AED7D6AFD8D6AFD8D7AFD8D6
        B0D8D6B0D8D7B0D8D7B1D8D7B1D9D7B2D9D8B2D9D8B2D9D8B3DAD9B3DAD8B3D9
        D8B4DBD9B5DAD9B4DBD9B6DAD9B5DBD9B6DBDAB6DBDAB7DBDBB7DCDAB7DCDAB8
        DDDBB8DCDBB9DDDBBADDDCBADEDBBADDDBBADEDCBADEDCBCDEDCBBDEDCBCDEDD
        BCDEDDBDDEDEBDDEDEBEDFDEBEE0DEBEDFDEBFE0DFC0E0DFC0E0DEC0E0DEC0E1
        DFC1E0DFC2E1E0C2E1E0C2E1E0C2E1E0C3E2E0C4E2E0C4E2E1C5E2E1C4E3E1C5
        E2E2C5E3E1C6E3E2C6E3E2C7E3E2C7E4E2C8E4E2C7E4E3C8E4E2C9E4E3C9E5E3
        CAE5E3CAE5E4CAE5E4CBE6E4CBE6E4CCE6E4CCE6E5CDE7E5CDE7E5CDE7E5CDE7
        E5CEE7E5CEE7E6CFE7E6CFE8E6D0E8E7D0E8E6D1E8E6D1E8E6D1E9E7D2E9E7D2
        E9E8D2E9E8D3E9E7D3EAE8D4EAE8D4EAE8D5EAE9D5EBE9D6EAE9D6EBE9D6EBE9
        D7EBE9D7EBE9D7ECEAD7ECEAD8ECEBD9EDEBD9ECEBD9EDEBDAEDECDAEDECDBEE
        EBDBEDECDBEEECDCEEEDDCEEECDCEEECDDEEECDEEFEDDEEFEDDFF0EDDFEFEDDE
        F0EEDFF0EEE0F0EFE0F1EEE0F0EFE1F0EFE1F1EFE2F1F0E2F1EFE3F2F0E2F2F0
        E3F2F0E4F2F1E4F2F0E4F2F0E5F2F1E6F3F1E6F3F1E6F3F1E7F3F2E7F3F2E7F4
        F2E8F4F2E8F4F2E8F4F2E8F5F3E9F5F3EAF5F3EAF6F3EAF6F4EBF5F4EBF6F4EC
        F6F4ECF7F4ECF7F4EDF6F5EDF7F5EEF7F5EEF8F5EFF7F6EFF7F6F0F8F6F0F8F6
        F0F8F6F1F8F6F1F8F7F2F9F7F2F9F7F2F9F7F3FAF8F3FAF8F4FAF8F4FAF9F5FB
        F8F5FBF8F5FBF9F5FBF9F6FBF9F6FBFAF7FBFAF7FCFAF7FCFAF8FCFAF9FDFBF9
        FDFBF9FDFBFAFDFBFAFDFBFAFDFBFAFEFBFBFEFBFCFEFCFCFEFCFCFFFCFDFFFD
        FDFFFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFE80800080800080800080800080800080800080800080
        8001808101818001818002818102818103818203818203828204828204838205
        8282058382068383068383068483078383078484078484088484088484088485
        0984840984840985840B86850B85860B86850B86860C86860C86870D86860D86
        860D87870E88870E88870E87880E88880F888710898811888911888811888911
        8989128989128989138A89138A8A148A8A148A8A148B8A148A8A158B8A168B8B
        168C8A168B8B178B8B178C8C178C8C188C8C188C8C198D8C198D8D198D8D1A8D
        8D1B8D8D1B8D8D1B8E8D1B8E8E1C8E8E1C8F8E1C8E8E1D8F8E1E8F8F1E8F8F1E
        908F1F90901F909020908F209090209090219191229190219191229291229291
        2292912391912392922492922492932592932593932693932694932694932793
        932794932894942894942894942995952995942995952A95952B96962B95952B
        96962C96962C96962C96962D97962D96972E97972E97972F98972F97972F9898
        309898309898319899319898329998329999329A99329999339A99339A9A349A
        9A349A9A359A9A359A9A359B9A369B9B369B9B379C9B379C9B379C9C389C9C39
        9C9C399C9C399C9C399C9D3A9E9C3A9E9D3B9E9D3B9E9D3B9E9E3C9E9E3C9F9D
        3C9E9E3D9E9F3E9F9E3E9F9F3E9F9E3EA09F3FA09F40A0A03FA0A040A0A041A1
        A041A1A042A1A141A1A042A2A143A2A143A1A143A2A144A2A244A2A245A3A245
        A3A246A3A246A4A246A4A347A4A347A4A347A4A448A4A448A4A448A5A449A5A4
        4AA5A44AA5A54AA6A54BA5A54BA6A54BA6A54CA6A64CA7A64CA6A64DA7A64EA7
        A74EA7A64FA8A74FA7A74FA8A850A8A750A8A750A9A850A8A852A9A851A9A852
        A9A853AAA953A9A954A9AA54AAAA54AAAA54AAAA55AAAA56ABAA55ABAB56ABAB
        56ACAB57ACAB58ABAB58ACAB58ACAC59ADAB59ADAC59ADAC5AADAC5AAEAC5BAD
        AD5BADAD5BAEAD5CAEAD5CAEAE5DAFAE5DAEAE5DAFAF5DAFAF5EB0AF5EAFAF5F
        AFAF5FB0AF5FB0AF60B0B061B0B061B1B061B1B062B1B063B1B162B1B063B2B1
        63B2B164B2B164B2B164B2B165B3B265B3B266B3B267B4B367B3B367B3B367B4
        B368B4B368B4B469B4B469B4B469B5B46AB5B46BB6B56AB6B56BB6B56BB6B56C
        B6B56CB7B66DB6B66DB7B66EB7B76EB7B66EB8B66FB8B670B8B770B8B870B8B8
        70B8B871B9B871B8B871B9B872B9B873B9B973BAB973BAB974BAB974BAB975BA
        B975BBB975BBBA75BBBB76BCBB77BCBA77BCBB77BBBA77BCBB78BDBB79BDBB79
        BDBC7ABDBC7ABDBC7ABDBD7ABDBC7BBEBD7CBEBD7CBEBD7CBEBD7DBEBE7DBFBE
        7DBFBD7EBFBE7FBFBE7EBFBE7FC0BF80C0BF80C0BF80C0C081C0BF81C1C081C1
        C082C1C082C1C183C1C083C1C083C1C184C2C184C2C185C3C185C3C286C3C286
        C3C286C3C286C3C287C3C387C4C388C4C389C4C388C5C389C5C38AC5C489C5C4
        8AC6C48BC6C58BC5C58CC5C58CC6C58DC6C58CC7C68EC7C68DC7C68EC7C68FC7
        C68FC7C68FC8C790C8C790C8C790C8C791C8C792C9C791C9C892C9C893C9C993
        C9C893CAC894CAC994CAC994CAC995CBC995CBC995CBCA96CBCA96CBCA97CBCA
        97CCCB97CCCB98CDCB99CDCB99CDCC99CDCC9ACDCC9ACDCC9BCECD9BCECC9BCE
        CD9BCECC9CCECD9CCFCE9DCECE9DCFCE9ECFCE9FCFCE9ECFCE9FD0CFA0D0CFA0
        D0CEA0D0CFA1D0CFA1D1D0A2D0CFA2D1CFA2D2D0A2D2D1A3D1D1A3D2D0A4D2D1
        A4D2D1A4D3D1A5D3D1A6D3D1A6D3D2A6D4D2A6D3D2A7D4D3A7D4D3A7D4D3A8D4
        D3A8D5D4A9D5D4AAD5D4AAD5D4AAD5D4AAD6D4ABD6D5ABD6D4ACD6D5ACD6D5AC
        D6D5ADD7D5ADD7D6AED7D6AED7D6AED8D6AFD8D7AFD8D6B0D9D7B0D8D7B1D9D8
        B2D9D7B1D9D7B2DAD7B2D9D8B3D9D8B4DAD8B4DAD9B4DAD9B4DAD9B5DAD9B5DB
        DAB5DBD9B6DBD9B7DBDAB7DCDAB7DCDAB8DCDBB9DCDBB8DCDBB8DDDBB9DCDBB9
        DDDBBADDDCBBDEDCBBDEDCBBDEDCBCDFDDBCDEDDBCDEDDBDDFDDBDDFDDBEDFDD
        BEE0DEBFDFDEBFE0DEBFE0DEC0E0DEC0E0DEC1E1DFC1E0DFC1E1E0C2E1E0C2E1
        DFC2E2E0C3E1E0C4E2E0C3E2E1C4E2E1C4E3E1C5E2E1C6E3E1C5E3E1C6E3E1C7
        E3E1C7E4E2C8E4E2C7E4E3C8E4E3C9E4E3C9E4E3CAE4E3C9E5E4CAE6E4CAE5E4
        CBE5E4CCE6E4CCE6E4CDE6E4CDE6E5CDE7E5CEE7E6CDE7E6CEE8E6CFE7E6CFE8
        E6D0E8E7D0E8E6D0E8E6D1E8E7D1E9E8D2E9E8D2E9E7D2EAE7D2EAE8D3EAE8D3
        EAE8D4EAE9D4EAE9D5EAE9D5EBE9D6EBE9D6EBEAD6EBEAD7EBEAD7ECEBD8ECEB
        D8EDEAD8EDEAD8ECEBDAECEBDAEDECDAEDEBDAEDECDBEEECDBEEECDCEEECDCEE
        ECDCEEEDDCEFEDDDEEEDDEEFEDDEEFEEDEEFEDDFEFEEDFEFEEDFF0EEE0F0EFE0
        F1EEE1F1EEE1F1EFE2F1EFE2F1F0E3F1F0E3F2F0E3F2F0E3F2F0E5F3F1E5F3F1
        E5F3F1E5F2F1E5F3F1E7F3F2E7F3F1E7F4F2E8F4F2E7F4F2E8F5F2E9F5F2E9F5
        F3EAF5F3EAF6F3EBF5F3EBF6F3EBF6F4ECF6F4ECF6F4ECF7F4ECF6F5EDF7F5ED
        F7F5EEF7F5EFF7F6EEF8F6EFF8F6EFF8F6F0F8F6F1F9F6F1F9F6F1F9F7F2F9F7
        F2F9F7F2F9F8F3F9F8F3FAF8F4FAF8F4FAF9F4FAF8F5FBF9F5FBF9F6FBF9F6FB
        F9F6FBFAF6FBFAF8FCFAF7FCFAF8FCFAF9FCFBF8FDFBF9FDFBFAFDFBFAFDFCFB
        FEFBFBFDFBFCFEFCFBFEFCFCFFFCFDFFFCFDFEFCFEFFFCFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080
        0080800080800080800080800080800080800080800181810180810181810281
        8102818102828103818203828204828204828205828305838305838306838306
        83840683830784830783830884840884850885840985840A85850A85850B8685
        0A86860B86860C86850B86860C87870C87860D86860D87870D87870E87880E88
        870F87880F8887108888118888118989118888128989118989128989128A8913
        8A8A138A89148A8A148B8B158B8B158A8B168B8B168B8B168C8B178B8C178C8B
        188C8B178C8C188D8C188C8C198C8C198D8D198D8C1A8E8D1B8E8D1B8E8E1C8E
        8D1C8E8E1C8E8E1C8E8E1D8F8F1E8E8E1E8F8F1E8F8F1F908F1F9090208F8F20
        9090209090209191219190219190229191229291239292239292249292249292
        2593922592922592922693922693932794942793932794932894942895942894
        942995942994952A95942A95952A95952B96952B96952B96962C96962C96962D
        97972D96962E97972E97972E98972F98972F9898309898309898309998319998
        319899319999329999339999339A9A33999A339A9A349A9A359B9A359B9A359B
        9A359B9B369C9B379B9B379C9B389C9B389C9C389D9C399C9C399D9C399D9C3A
        9D9D3A9E9D3A9E9D3B9E9D3C9E9D3B9E9E3D9F9E3D9F9E3D9F9F3E9F9E3E9F9F
        3FA09F3EA09F3F9F9F40A09F40A0A040A1A041A0A042A1A042A1A042A1A142A1
        A143A1A243A2A243A2A144A2A244A2A245A3A245A3A246A3A246A4A346A4A347
        A4A347A4A348A4A448A5A448A4A449A4A44AA5A44AA5A44AA6A44AA5A44BA5A5
        4CA5A64CA6A64CA7A54DA7A64CA7A64DA7A64EA7A64EA7A74EA7A74EA8A750A7
        A750A8A750A8A750A9A751A9A851A9A852A9A952AAA953AAA952AAA954A9A954
        AAAA54AAAA55ABAA55AAAA56ABAA56ABAA56ABAB56ABAB57ABAB58ACAB57ACAB
        59ACAB59ADAC59ADAC59ADAC5AADAD5AAEAD5BADAC5BAEAD5CAEAD5BAEAD5CAE
        AD5DAFAD5DAFAE5DAFAE5EAFAE5FAFAE5FAFAE60B0AF5FB0AF5FB0B060B0AF61
        B1B062B1B061B1B062B1B063B1B162B1B163B2B163B2B164B2B165B3B265B3B2
        65B2B265B2B366B4B366B3B267B3B367B4B368B3B368B5B468B5B469B4B469B5
        B469B5B56AB5B46AB5B46BB6B56BB5B56CB6B56BB6B66DB6B66DB6B66DB6B56E
        B7B66EB8B76FB7B66FB8B66FB8B76FB8B770B8B770B9B871B9B872B9B871B9B9
        72BAB872BAB973BAB974BAB973BAB974BBBA74BAB975BBBA75BBBA76BBBB76BB
        BA77BBBB77BCBB78BCBB77BCBB78BCBB79BCBC79BCBC7ABDBC7ABDBC7ABDBD7A
        BEBC7BBEBC7BBEBD7CBFBD7CBEBD7CBEBD7DBFBE7DBFBE7EBFBE7EC0BE7FC0BF
        7FC0BE7FC0BE80C0BF80C0C081C0BF81C0C081C1C082C1C082C1C183C2C083C2
        C084C2C184C2C184C3C184C2C285C3C185C3C286C3C286C4C286C4C387C4C387
        C4C388C4C388C5C489C5C389C5C489C5C48AC6C48AC5C48BC5C58BC6C58BC6C5
        8CC6C68CC6C58DC6C68EC7C58EC7C68EC7C68EC8C68FC7C78FC8C78FC8C790C8
        C790C9C791C9C791C9C791C9C792C9C893C9C893CAC993C9C994CAC994CAC994
        CACA95CBC995CBC995CBCA96CBCA97CCCB96CCCA97CCCB98CCCB98CCCB98CCCB
        99CCCC99CDCB99CDCC9BCDCC9ACECC9BCECC9BCECC9BCFCD9CCECD9DCFCD9DCF
        CD9DCFCD9ECFCE9ECFCE9FCFCE9FCFCF9FD0CFA0D0CFA0D0CFA1D0CFA1D1D0A2
        D1D0A2D2D0A2D1D0A2D1D1A3D2D0A3D2D0A4D2D1A4D2D1A4D3D1A5D3D1A5D3D1
        A6D3D2A6D3D2A6D3D2A7D4D3A7D4D2A8D4D3A8D4D3A8D5D3A9D5D4A9D5D3AAD5
        D4AAD5D4AAD6D4ABD6D4ACD6D5ACD7D5ACD6D5ACD7D5ADD7D6ADD7D6AED7D6AE
        D7D6AFD8D6AFD7D6B0D8D7B0D9D6B0D8D7B1D8D7B1D9D8B1D9D8B2D9D8B3DAD7
        B3D9D8B4D9D8B4DAD9B4DAD8B4DAD9B5DBD9B6DBDAB6DBDAB6DBDAB6DCDAB6DC
        DBB7DCDAB8DCDAB8DCDAB8DDDBB9DCDBB9DDDCBADDDBBADDDBBADDDCBADEDCBB
        DDDCBCDFDDBCDEDDBDDEDDBDDEDDBEDFDDBEDFDEBEDFDEBFDFDEBFE0DEBFE0DE
        C0E0DEC0E1DEC1E1DEC1E1DFC2E1E0C1E1DFC2E1E0C2E2E0C3E1E0C4E2E1C4E2
        E0C4E2E1C5E2E1C5E3E1C5E2E1C6E3E2C6E3E2C7E3E2C7E4E2C7E4E2C8E4E3C8
        E4E3C8E5E3C9E5E3CAE5E3CAE5E3CAE5E4CAE5E4CBE6E4CCE6E4CCE6E4CCE6E4
        CDE7E4CEE6E5CDE7E6CEE7E5CEE7E6CFE7E6CFE8E6D0E8E6D0E8E6D0E8E7D0E9
        E6D1E9E7D1E8E7D2EAE7D3E9E8D2EAE8D3EAE8D4EAE8D4EAE8D5EAE8D5EAE9D5
        EBE9D6EBE9D6EBE9D6ECEAD7EBEAD7ECEAD7ECEAD8ECEAD9EDEBD9ECEBD9EDEB
        DAEDEBDAEDECDBEDECDBEDECDBEEECDBEEECDCEFECDCEEECDDEFEDDDEFEDDDEF
        EEDEEFEEDFEFEEDFEFEEDFF0EEE0F0EFE0F0EFE1F1EFE1F0EFE1F1EFE1F1EFE2
        F1F0E2F2EFE3F1F0E3F2F0E4F3F0E4F2F0E4F2F1E5F2F0E5F3F1E6F3F1E6F3F2
        E7F3F2E7F4F2E8F3F2E7F4F2E8F4F3E9F4F3E9F5F3EAF5F3E9F5F3EBF5F3EAF5
        F4EBF6F3ECF6F4EBF6F4ECF6F4EDF7F5EDF7F5EEF6F5EEF7F6EFF7F5EFF7F6EF
        F8F6F0F8F6F0F8F6F0F8F7F0F9F6F1F9F7F1F8F7F1FAF7F2F9F8F3FAF8F3F9F8
        F4FAF8F4FAF8F4FAF9F5FBF9F5FBF9F6FBFAF6FBF9F6FCFAF6FCFAF7FBFAF8FC
        FAF8FCFAF9FCFAF9FCFBFAFCFAFAFDFBFAFDFBFBFEFBFBFEFBFBFEFCFCFEFCFC
        FEFCFDFEFCFDFEFCFDFFFCFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080008080008080008080008080
        0080800080800080800080800180810180810181810281820282810382810382
        8103828204828205828205838206838305838307838306838307838407848408
        84840884840984840984850984850985850A85850A86850B85850B86860B8686
        0C86860D86870D87870D87870D88870E87870E87880F88881088881088881088
        88118989118988128989128989138989128989138A8A138A89148A8A148A8A14
        8B8A158B8B158B8B158B8B168C8B168B8B188C8B188B8C178C8C198C8C198D8D
        198D8D1A8D8D198D8D1A8E8D1B8E8D1B8E8D1C8E8D1B8E8E1C8E8E1D8F8F1E8F
        8F1E8F8F1D8F8F1E90901F8F901F90901F909020909020919021919021919021
        9191229191229191239292239292249291249392249292259392259393259393
        2693932793932793942794932794942895942994942995942A95942A95952B96
        952B95952A96952B96952C96952C96952C97962D96962D97962E97962F97972E
        97972F9898309897309898319898319999319999319999319999329999339A99
        339A9A33999A349A9A349B9A359B9A359B9A369B9A359B9B369B9B379B9B379C
        9B379C9C389D9C389C9C399C9C399D9C399D9C399D9D3A9D9D3B9E9D3B9E9D3C
        9E9D3B9E9E3D9F9E3D9E9E3D9F9E3E9F9F3E9F9F3E9F9F3F9F9F3FA0A040A09F
        40A0A041A1A041A0A141A1A142A1A042A1A043A2A142A2A143A1A143A2A244A3
        A244A2A145A3A245A2A346A3A346A3A246A3A346A4A347A4A348A4A348A4A349
        A4A449A4A449A5A449A5A44AA5A54BA5A54BA5A54BA6A54CA6A64CA7A64DA6A6
        4DA7A64DA7A64EA7A64EA8A64FA7A74FA8A74FA8A750A8A850A9A850A8A851A9
        A851A9A952A9A952A9A953AAA953AAA953AAA954AAAA54AAA954ABA955AAAA55
        ABAA56ABAA56ABAA57ACAB57ACAB57ACAB58ACAB58ACAC58ADAC59ACAC5AADAC
        5AADAC5AADAD5AADAD5BADAD5BAEAD5CAEAE5CAEAE5DAEAE5DAEAE5DAFAF5EAF
        AE5EAFAF5FAFAF5FAFAF60B0B060B0AF61B0B061B1B061B1B061B1B062B1B062
        B1B062B2B163B2B164B2B164B2B165B3B165B3B265B3B266B3B266B3B266B3B3
        67B4B367B4B368B4B368B4B369B4B469B5B469B5B469B5B46AB5B56BB6B56BB6
        B46BB5B56BB6B56CB7B66CB6B66DB6B56DB7B66DB7B76FB7B66FB8B66EB7B66F
        B8B770B8B770B8B870B8B871B8B771B9B871B9B972BAB872B9B973B9B874BAB9
        74BAB974BABA75BAB975BBBA75BBBA76BBBA76BCBB77BCBA77BCBA78BCBA78BC
        BC78BCBB78BDBC79BDBC79BDBC7ABDBD7ABDBC7BBEBC7BBEBD7BBEBD7CBEBD7C
        BEBD7DBEBE7DBFBE7DBFBE7EBFBE7FBFBE7FBFBF7FC0BF80C0BF80C1BF80C0C0
        81C0C081C1C081C1BF82C1C082C1C082C1C183C2C183C2C184C2C185C2C185C2
        C185C3C185C3C286C3C286C3C287C3C287C3C388C4C387C4C388C4C389C5C489
        C4C489C5C48AC6C48AC6C48BC6C58BC6C58BC6C58CC6C58CC6C58DC6C58DC6C5
        8DC7C68EC8C68FC7C78FC7C690C8C790C8C790C9C790C8C791C8C891C9C892C9
        C892CAC892C9C993C9C994CAC994CAC994CAC995CAC995CBC995CBCA95CBCA96
        CCCA96CCCA97CBCA98CBCB98CCCB99CCCB98CCCB98CDCC9ACDCB99CDCC9ACDCC
        9BCECC9BCDCC9BCECC9CCECD9CCECD9CCFCD9DCFCE9DCFCD9ECFCE9FD0CE9ECF
        CE9ECFCF9FD0CE9FD0CFA0D1CFA1D0D0A1D1CFA2D1CFA2D1D0A3D1D0A3D2D0A3
        D1D0A4D2D1A4D3D1A4D3D1A5D2D1A5D3D1A5D3D1A6D3D1A6D3D2A6D4D3A7D4D3
        A8D4D3A8D4D3A9D5D3A9D5D3A9D4D4AAD5D3AAD5D4AAD5D4ABD5D4ABD6D5ABD6
        D4ACD6D4ADD6D5ACD7D6AED6D6ADD7D6AED7D6AED7D6AFD7D6AFD8D6AFD8D7AF
        D8D7B0D8D7B1D9D7B1D8D8B2D9D7B2D9D8B3D9D8B2DAD8B3DAD9B4DAD8B4DAD9
        B4DAD9B5DBD9B5DBD9B6DBDAB6DBDAB6DCDAB7DCDAB7DCDAB8DCDBB8DDDBB8DC
        DBB9DDDBB9DDDCBADDDCBADDDBBADDDBBBDDDCBBDEDCBCDEDCBCDEDDBCDFDDBD
        DFDDBEDFDDBEDFDEBEE0DDBFDFDEBFE0DEC0E0DEC0E0DEC0E0DEC1E1DFC1E1DF
        C2E1E0C2E1DFC3E1DFC3E2E0C3E2E0C4E1E1C4E2E1C4E2E0C4E3E1C5E3E1C5E3
        E2C6E3E2C6E3E2C6E4E2C7E4E2C8E4E3C8E4E3C8E4E3C9E5E3C9E5E3CAE5E3CA
        E5E4CAE5E3CBE5E4CBE5E4CCE6E4CCE6E4CCE6E5CCE6E5CDE6E5CDE7E5CEE7E6
        CEE7E6CFE7E6CFE7E6D0E7E6D0E8E6D0E8E6D1E9E6D1E9E7D2E9E7D2E9E8D2E9
        E8D3EAE8D3EAE8D4EAE8D3EBE9D4EAE9D5EBE9D5EBE9D5EBE9D6EBE9D6EBEAD6
        EBEAD8ECEAD8ECEAD8EDEBD8EDEBD9ECEBD9EDEBD9EDEBDAEEECDBEDECDBEEEC
        DBEEECDCEEECDCEFEDDDEEEDDCEFEDDEEEEDDEEFEDDEF0EEDFF0EDDFF0EEDFF0
        EEE0F0EFE0F0EFE1F0EEE1F0EFE1F0EFE2F1EFE2F1EFE2F2F0E3F2F0E3F2F0E4
        F2F0E4F2F1E5F2F1E5F3F1E6F2F1E6F3F1E6F3F2E7F4F2E7F4F2E7F4F2E8F4F3
        E8F4F2E8F5F3E9F5F3EAF5F4EAF5F3EAF6F4EBF6F4EBF6F3EBF6F4EBF6F4ECF6
        F5EDF6F4EDF7F5EEF7F5EEF7F6EEF8F5EFF7F6EFF8F6F0F8F6F0F8F6F1F8F7F1
        F8F6F1F9F7F2F9F7F2F9F8F2FAF7F2FAF7F3FAF8F3FAF8F4FAF8F4FAF9F5FBF8
        F5FBF9F5FBF9F6FBF9F6FBF9F7FBF9F7FCFAF7FCFAF8FCFAF9FCFBF9FCFBFAFD
        FBF9FDFBFAFDFBFAFEFCFBFDFCFBFEFCFCFEFCFCFEFCFDFEFDFCFEFDFDFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFE8080008080008080008080008080008080008080008080018180
        0181810181800181810281820282810381820382820482820482820482820582
        820683830583830683830683840784840784840784840884840984840885850A
        85850A85850A86860B86850B85860C86860C86860D86860D86860D87870D8787
        0E87870E87870E88870F87880F88881088881088881088881189891289891289
        8912898A128A89138A8A14898A148B8A148A8A158A8B158B8A158B8A168B8B16
        8B8B168C8B178C8B178C8C178C8C198D8C188C8C198D8C198C8D1A8D8D1A8E8D
        1B8E8D1B8D8D1B8E8E1C8E8E1C8F8E1D8E8F1D8F8E1D8F8F1D8F8F1E8F8F1F8F
        8F1F909020909020909020909021919021909022919122919022919122919123
        9291249292249291249392259392259393259393269493269493279493279493
        2894942894942895942995952994952A95942A96952B95962B95952C96962C96
        962C96962C96962D96972D97962E97972E97962E98972F989830979830989830
        9898309898319998319999319998339999329A9933999A339A9A349A9A349A9A
        359B9B359A9A359B9A359B9A369B9B369B9B379C9B379B9C389C9C399C9C399D
        9C399D9D3A9C9C3A9D9C3A9D9D3B9D9D3B9E9D3B9D9D3C9E9E3C9E9E3C9F9E3D
        9F9E3D9F9F3EA09F3EA09F3F9F9F3F9F9F40A0A040A09F40A09F41A1A041A0A0
        41A1A042A1A042A1A142A1A143A2A143A2A144A2A144A2A245A2A246A3A346A3
        A246A3A347A3A347A4A348A4A348A4A348A4A449A4A349A5A44AA5A44AA5A54A
        A5A54AA5A54BA6A54BA6A54BA6A64CA6A64DA6A64CA6A64DA7A64DA7A74EA7A7
        4FA7A74FA8A750A8A750A8A750A8A851A9A851A8A851A8A852A9A852A9A853AA
        A953A9A953AAA954AAA954ABA955AAA955ABAA55AAAA56ABAA56ABAB57ACAB56
        ACAB57ACAB58ACAB59ACAC59ACAC59ADAC5AADAC59ADAD5AADAD5AADAD5BAEAD
        5BAEAD5CAEAD5CAEAE5DAFAD5DAFAE5EAFAF5EAFAE5FB0AF5EAFAE5FAFAF60B0
        AF60B0AF60B1AF61B0B061B1B062B1B062B1B162B1B162B1B063B1B164B2B164
        B2B165B2B165B3B266B2B265B3B266B3B266B3B267B4B267B3B367B4B468B4B3
        69B4B468B4B469B5B469B5B46AB5B46BB5B46AB6B56BB5B56BB6B56CB6B66CB6
        B66DB6B66DB6B66EB7B66EB7B66EB7B76FB8B770B8B770B8B770B8B771B8B771
        B9B871B9B872B9B972B9B873B9B873BAB973BAB874BAB974BAB975BABA75BABA
        75BBBA76BBBA76BBBA77BCBA77BCBB77BBBB78BCBB78BCBB78BDBC79BCBC7ABD
        BC7ABDBC7ABDBC7BBEBD7BBEBC7BBEBD7CBEBD7CBEBE7CBEBD7DBFBE7DBFBE7E
        BFBE7EBFBE7FBFBF7FC0BF7FC0BF80C0BF80C0BF80C0BF81C1BF82C1C082C1C0
        82C1C183C2C083C2C183C2C184C2C184C3C185C3C185C2C286C3C286C3C286C3
        C387C4C287C4C287C4C388C4C389C4C489C4C389C5C38AC5C48AC5C58AC6C48A
        C6C48BC5C58BC6C58BC6C58DC6C68DC6C68DC7C58EC7C68EC7C68EC7C68FC7C6
        8FC8C690C8C790C8C790C9C891C9C791C9C892C9C892C9C893C9C893C9C893CA
        C893CAC894CAC994CACA95CBC996CBC996CBCA96CBCA96CBCA97CBCB97CCCB97
        CCCB98CCCB99CCCB99CDCC99CDCC99CDCC9ACDCC9BCECC9BCECC9BCECD9CCECD
        9CCECE9CCECD9DCECD9ECFCE9ECFCE9ED0CE9FD0CE9FD0CEA0D0CFA0D0CFA0D0
        CFA0D0CFA1D1CFA2D1CFA1D1D0A2D2D0A3D1D0A3D2D1A3D1D1A4D3D1A4D3D1A5
        D3D1A5D3D1A6D3D2A6D3D2A6D3D2A7D3D2A7D4D3A8D4D3A7D4D3A8D4D3A8D4D3
        A9D5D4AAD5D4AAD5D3AAD5D4ABD6D5ABD6D5ABD5D4ACD7D5ACD7D5ADD7D6AED6
        D5ADD7D5AED7D6AED7D6AED7D6AFD7D6AFD8D7B0D8D6B1D8D7B1D9D7B1D8D7B2
        D9D7B2D9D8B3DAD8B3D9D8B3DAD8B4DAD9B4DBD9B4DAD8B5DBD9B5DAD9B6DBD9
        B6DBDAB6DBDAB7DBDBB7DCDBB7DCDBB8DCDBB8DCDBB9DDDBB9DDDCB9DDDCBADE
        DBBBDEDCBBDEDCBCDEDCBBDEDDBCDEDCBCDFDCBCDEDDBDDFDDBEDFDEBEDFDEBE
        E0DEBFE0DFBFE0DEC0E0DEC0E0DFC1E1DFC1E0DFC1E0E0C1E1DFC2E1E0C2E1E0
        C3E2E1C3E2E1C4E2E0C4E2E1C4E3E0C5E2E1C5E3E2C5E3E2C7E3E2C7E3E2C7E3
        E2C7E4E3C7E4E2C8E4E2C9E4E3C9E5E3C9E5E3CAE6E4CAE5E3CBE6E4CBE6E4CB
        E6E5CCE6E5CDE6E4CDE6E5CDE7E5CDE7E6CDE7E6CFE8E6CFE8E6CFE8E6D0E8E7
        D0E8E6D1E8E7D1E9E7D1E9E7D2E9E7D2E9E8D2EAE8D2EAE8D3EAE8D3EAE9D4EA
        E8D4EAE9D4EAE9D5EBE9D6EBE9D6EBEAD7ECE9D7EBE9D7ECEAD7ECEBD8EDEAD9
        EDEBD9EDEBD9EDEBDAEDEBDAEDEBDAEDECDAEDECDBEEECDBEEECDCEEEDDDEEED
        DCEEEDDDEEEDDEEFEDDEF0EEDEF0EEDFEFEDDFEFEEE0F0EEE0F1EFE1F0EEE1F0
        EFE2F1EFE2F2EFE2F1EFE3F1F0E3F1F0E3F2F0E4F2F1E4F2F1E5F2F0E5F3F1E5
        F2F2E6F3F1E6F3F1E6F3F2E7F4F2E7F3F3E7F5F2E8F4F3E9F5F2E9F5F2E9F5F3
        EAF5F4EAF5F3EBF5F3EBF6F4EBF6F4ECF6F4EDF6F5EDF7F5EDF7F5EDF7F5EEF7
        F5EEF7F5EEF7F5EFF8F5F0F8F6EFF8F6F0F8F6F1F9F7F1F9F7F1F9F7F2F9F7F2
        F9F7F2F9F8F4FAF7F4F9F8F4FAF8F4FAF9F5FBF8F5FBF9F6FBF9F6FBF9F7FBFA
        F6FBFAF7FCFAF7FCFAF8FCFAF9FCFBF8FDFBF9FDFBF9FDFBFAFEFCFAFDFCFBFD
        FBFBFEFBFBFEFCFCFEFCFCFEFCFDFFFDFEFEFCFDFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000
        8080008080008080008080008080008080008081018181018180028181028181
        0282810382810482810482820482830483820582830683820583830683830683
        830784830784840884840984850984840984850985850A85850A85860A86860B
        86860B86850C86860C86860D86870D87860D86860E87870E88870E88870F8888
        108888108888118988108889118888118989128A89128989128A8A138989138A
        8A148A8A148B8A158B8A158B8B158A8B168B8B168B8C178C8C178C8C178C8C18
        8C8C188C8C198D8C198C8D1A8D8C1A8D8D1A8E8D1A8E8D1B8E8D1C8E8D1C8E8E
        1D8F8E1D8F8E1D8F8F1D8F8F1E8F8F1E908F1F90901F8F8F1F90902090902090
        9021909022909022919122929122919123919123929123929124929224939225
        9393259393269392269393269493279393279394279494289494289494299594
        2995942A95952A96952A96952B95952C96962C96962C96962C96962D96972D97
        972E97962E97972F98972F97972F989730989730999831989831999831999932
        9999329A99339A99339999339A99349A9A349A9A359B9A359A9B359B9A369B9A
        369C9B379C9B379C9B389C9B389C9C389C9C399D9C399D9D399D9D3A9D9C3A9D
        9D3A9E9E3B9D9D3C9E9D3B9F9E3C9F9D3D9F9E3D9F9E3D9E9F3E9F9F3F9F9F3F
        A09F3FA09F40A0A040A1A040A0A041A0A042A1A141A1A042A1A142A1A042A1A1
        43A2A144A2A144A2A245A3A245A2A245A2A345A3A246A4A246A3A347A4A347A4
        A348A4A348A4A448A5A448A4A449A5A44AA6A54AA5A54AA5A54BA5A54BA6A54C
        A6A54CA6A54CA6A54DA7A74DA7A64DA7A74EA7A64FA7A74FA7A74FA8A750A8A7
        50A8A750A8A751A8A852A9A951A9A952A9A953A9A953AAA953AAA954AAA955AB
        AA55ABAA55AAAA55ABAA56ABAA56ABAB57ACAB57ACAB57ACAB58ACAB58ACAB59
        ADAC59ADAC59ACAC5AADAD5AAEAC5AADAD5BAEAD5CAEAD5CAFAE5CAEAD5DAEAD
        5DAFAE5EAFAF5EAFAE5EAFAF5FAFAF5FB0AF5FB0B060B1AF60B1AF61B1AF61B1
        B062B1B162B1B063B2B063B2B163B2B163B2B164B2B164B2B265B3B265B2B266
        B3B266B3B266B3B367B3B367B4B367B4B368B4B368B5B369B5B369B5B46AB5B4
        6AB5B46AB5B46BB5B56BB6B56BB6B56CB6B56DB6B66DB6B66DB7B66EB7B66EB7
        B66FB8B66FB8B770B8B770B8B770B8B771B8B771B9B771B9B872B9B872B9B972
        B9B873BAB974BAB974BAB974BABA75BAB975BBB975BBBA76BBBA76BBBA76BBBB
        77BCBA78BCBB78BCBB78BCBB78BCBC79BDBC79BDBC7ABDBD7ABEBD7BBDBC7BBE
        BD7CBEBD7CBEBD7CBFBD7CBFBD7DBFBE7DBFBE7EBFBE7FBFBF7FBFBF7FC0BF80
        C0BF80C0BF80C1BF81C0C082C1C082C0C082C1C082C2C183C2C183C2C183C2C0
        84C2C184C2C184C2C285C3C285C3C286C3C286C3C286C4C287C4C387C4C388C4
        C389C5C488C4C489C5C489C5C38AC5C48AC5C58BC5C48BC5C48CC6C58BC6C58C
        C6C58DC7C58DC7C58EC7C68EC7C68EC7C68FC8C78FC8C790C8C790C8C790C8C7
        90C8C792C8C892C9C892CAC992C9C893CAC893C9C994CAC994CAC994CACA95CB
        C995CAC995CBCA96CCCA96CBCA97CCCA98CCCB98CCCB98CCCB98CCCB98CCCB99
        CDCC9ACDCC9ACDCC9ACECD9ACDCD9BCECC9CCFCD9DCECD9CCECD9DCECD9ECFCE
        9ECFCE9ED0CE9ECFCF9FD0CE9FD0CFA0D0CFA1D1CFA0D1CFA1D1CFA1D0CFA2D1
        CFA2D1D0A3D1D0A3D2D0A4D2D1A4D2D0A4D2D1A5D2D1A5D2D1A6D3D2A5D3D2A6
        D3D2A7D4D2A7D4D2A7D4D3A8D5D3A8D4D3A9D4D3A9D5D3A9D5D3AAD5D4AAD6D4
        ABD5D4ABD6D4ABD6D5ACD6D5ACD6D5ADD6D6ADD7D6AED7D6AED7D6AED7D6AFD7
        D6AFD8D7AFD8D7B0D8D7B1D9D7B1D9D7B1D9D7B1D9D8B2D9D7B2DAD8B3D9D8B3
        DAD8B4DAD9B4DAD8B5DAD9B5DAD9B5DBD9B6DBDAB6DBDAB6DCDAB7DBDAB8DCDA
        B8DCDAB8DCDAB9DCDAB9DCDBB9DDDBB9DDDBBADDDCBADDDCBBDEDCBBDEDDBCDE
        DCBCDEDDBCDFDDBCDEDEBDDFDEBEDFDDBEDFDDBFDFDEBFDFDEC0E0DFC0E0DFC0
        E0DFC1E1DFC1E1DFC1E0DFC2E1DFC3E1E0C3E1E0C3E2E0C4E2E0C4E2E1C5E2E1
        C4E3E0C5E3E1C6E2E2C6E3E1C6E3E1C6E3E2C7E3E2C7E3E2C7E4E3C9E5E3C8E4
        E3C9E4E3C9E5E3CAE5E3CAE5E4CBE6E4CBE6E4CCE6E4CBE6E5CCE6E5CCE6E5CD
        E7E5CEE7E5CEE7E6CEE7E5CEE7E6CFE8E6D0E8E7D0E8E6D1E9E7D0E8E7D2E8E7
        D2E9E8D2E9E7D2E9E8D3E9E8D3E9E8D4EAE8D4EAE8D4EBE8D5EBE9D5EBEAD5EB
        E9D6EBEAD6EBEAD7EBEAD7ECEAD7ECEAD8ECEAD8EDEAD9EDEBDAECEBDAEDEBDA
        EDECDAEEECDBEEEBDBEEECDBEEECDCEFECDCEEEDDDEEECDDEFEDDDEFEEDEEFED
        DEEFEDDFF0EEE0F0EEE0F0EEE0F0EEE0F0EEE0F0EFE1F1EFE1F1EFE2F1EFE2F2
        EFE3F2EFE4F2F0E4F2F0E5F3F0E5F2F1E5F3F0E5F3F1E6F3F1E6F4F1E7F3F1E7
        F3F2E7F3F2E7F4F2E9F5F3E8F5F3E9F4F3EAF5F3EAF5F4EAF6F3EBF6F3EBF6F4
        EBF6F4ECF6F5EDF7F5EDF6F4EDF7F5EDF7F5EDF7F5EEF7F6EEF7F5EFF7F6F0F8
        F6F0F8F7F0F8F7F1F8F6F1F9F7F1F9F7F2F9F7F3F9F7F3FAF8F3FAF7F4FAF8F4
        FAF9F5FBF8F5FAF9F5FAF9F6FBF9F6FBFAF6FBFAF7FBF9F7FCFAF7FCFAF8FCFA
        F8FDFAF9FDFBF9FDFBF9FDFBFAFEFBFAFDFBFBFEFBFBFEFCFBFEFCFCFEFCFCFE
        FCFDFFFDFDFFFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000808000808000808000808000
        8080008081008080008181018181028181028181038181028282038282048282
        0482830582830583820583830683830683830784830784840784840884840884
        840984850985850984850A85850A86860A85860B86860C86850C86860C87870D
        87860D87860D87860E87870E87870E87870F88871088880F8888118888108989
        118989118989128A89128989128A89138A89148A89148A8A148A8A148B8A158B
        8A158A8B168B8B168B8C178B8B178C8C178C8C178C8B188D8C188D8C198C8C19
        8D8D1A8D8D1A8D8D1A8E8D1B8E8D1B8E8D1C8E8E1C8F8F1C8F8E1D8F8F1D8F8F
        1E8F8E1F8F8F1F908F1F908F2090902090902090902191902191912291912291
        9122929122919224929223929224929124939224939225939226939226939327
        93932794942794932794942994942994942995942995942995952A95952A9595
        2A95952B96952B96962C96962D97962D96962D97962E97972F97972E98972F98
        98309897309898309998309898319898329998319999329999329A99339A9934
        9A9A349A9A349A9A359A9A359B9A369B9A369B9B369B9B369B9B379C9B379C9C
        379C9B389C9B399D9C399C9D399D9C3A9D9D3A9E9D3A9D9D3B9D9D3C9D9E3C9F
        9D3C9E9E3C9E9E3D9F9E3D9F9E3E9F9E3FA09F3FA09F3FA0A03FA09F40A09F40
        A1A040A1A042A1A041A1A042A1A043A2A043A1A143A2A144A2A244A2A244A2A1
        45A3A245A2A246A3A246A3A347A3A347A4A347A3A348A4A448A4A349A4A449A5
        A44AA5A449A5A54AA5A54AA5A54BA6A54CA6A54CA6A64CA6A54CA7A64DA7A64D
        A7A74DA7A64EA7A74EA8A74FA8A74FA8A750A8A750A8A851A8A851A9A852A9A8
        52A9A952A9A852AAA952AAA953AAA954AAAA54AAAA54ABA955AAAA55ABAA56AB
        AA57ABAA56ABAB56ABAB58ABAC57ACAC58ADAC59ACAC59ADAC59ADAC5AADAD5A
        ADAC5AAEAD5BAEAD5BAEAD5CAEAE5DAEAD5DAEAE5DAEAE5DAFAE5DAFAF5EB0AF
        5EB0AF5FB0AF60AFAF60B0B060B1B061B0B061B1B062B1B062B1B063B1B163B2
        B063B1B163B2B164B2B165B2B265B2B265B3B266B3B265B3B266B4B267B4B367
        B3B367B4B468B4B368B4B469B4B469B5B469B5B46AB5B46BB5B56BB5B56CB6B5
        6CB6B56CB6B56DB6B56DB7B66EB7B66DB7B66EB8B76EB7B76FB8B76FB8B770B8
        B870B8B770B8B871B8B771B8B871B9B872BAB872B9B973BAB873BAB974BAB974
        BAB974BBB975BBBA75BBBA76BBBA76BCBB76BCBB77BCBB77BCBB78BCBB78BCBB
        78BDBC79BDBC79BDBC7ABDBC7ABDBC7BBEBD7BBDBC7BBEBD7BBFBD7CBEBE7CBE
        BD7DBFBE7DBFBE7DBFBE7EC0BE7FC0BE7FC0BF80C0BF80C0BF80C0C081C1C081
        C1C081C1C082C1C082C2C083C1C183C2C184C2C184C2C184C2C185C2C285C3C2
        85C3C286C3C286C4C287C4C287C3C387C3C288C4C388C5C388C5C38AC5C489C5
        C38AC6C48BC5C48BC5C58BC6C58CC6C58CC6C58CC6C58CC7C58DC6C68EC7C68D
        C7C68EC7C68FC8C78FC8C790C8C790C8C791C8C791C8C792C9C792C9C892CAC8
        93CAC893CAC893CAC994CAC994CBC994CAC995CBCA95CACA96CBC996CBCA96CB
        CA97CBCB97CCCA97CCCB98CDCB98CDCB99CDCB99CDCC99CDCC9ACECC9ACDCC9B
        CECD9BCECC9BCECD9CCFCD9DCECD9DCFCE9ECECE9ECFCE9ECFCE9ECFCF9FD0CF
        A0D0CEA0D0CFA0D0CFA0D1CFA1D1D0A1D0CFA2D1CFA3D2D0A2D1D0A3D2D0A4D2
        D0A4D2D1A4D2D1A5D2D1A5D2D2A5D3D1A6D3D1A7D4D2A6D4D2A7D4D2A7D4D2A8
        D4D2A8D4D3A9D5D4A9D5D4A9D5D4AAD5D4ABD5D4ABD6D4ABD6D5ACD6D4ACD6D5
        ACD7D5ADD7D5ADD6D6AED7D6AED7D6AED7D6AFD7D6AFD8D7B0D8D6B0D8D7B1D8
        D7B1D8D7B2D9D7B2D9D7B2D9D8B2D9D8B2D9D8B3D9D8B3DAD8B4DAD9B5DAD9B4
        DBD9B6DBDAB5DBD9B6DBDAB6DBDAB7DBDAB7DCDBB8DCDBB9DDDAB8DCDBB8DDDB
        BADDDCBADDDBBADDDCBBDDDCBBDDDCBBDEDCBCDEDDBCDFDDBCDEDDBDDFDDBDDF
        DDBDDFDDBEDFDDBFE0DEBFDFDFBFDFDFC0E0DFC0E1DFC0E0DFC1E1DFC1E1E0C2
        E2E0C2E1DFC3E1E0C3E1E0C3E2E0C4E2E1C4E2E1C4E2E1C5E3E2C5E3E1C5E4E2
        C7E3E1C7E3E2C7E4E2C8E4E2C8E4E3C9E4E2C8E4E3C9E5E3CAE5E4CAE5E4CAE6
        E3CAE6E4CCE6E4CBE6E4CCE6E5CDE6E5CDE6E5CDE6E5CDE7E6CEE7E5CEE7E5CF
        E8E6CFE7E6D0E8E6D0E8E7D1E8E7D1E9E7D1E8E7D1E9E7D2E9E8D2E9E8D3E9E8
        D3EAE8D4EAE8D4EAE8D4EAE9D4EBE9D5EBE9D5EBE9D6EBEAD6EBEAD7EBEAD7EC
        EBD8ECEAD8ECEAD8ECEBD9ECEBD9EDECDAEDECDAEEECDBEDECDBEEECDBEEEDDB
        EEEDDCEEECDCEFEDDDEFEDDDEEEDDDEFEDDEEFEEDEF0EEDFF0EEDFF0EEDFF0EF
        E1F0EFE1F1EFE1F0EEE1F0EFE1F1EFE2F1EFE3F1F0E3F2F0E3F2F0E3F3F0E4F3
        F1E5F3F1E5F3F1E5F3F1E6F3F2E6F3F2E6F4F2E7F4F2E7F4F2E8F4F2E8F5F2E8
        F4F2E9F4F3EAF4F3EAF5F3EAF5F3EAF6F4EBF5F4ECF6F4EBF6F5ECF7F5EDF7F5
        EDF7F5EDF6F5EDF7F5EEF8F6EEF8F6EFF8F6EFF8F6F0F8F7F0F8F6F0F9F7F1F8
        F7F2F9F7F1F9F7F2F9F7F3FAF8F3FAF8F4FAF8F4FAF9F5FAF9F5FBF9F5FBF9F6
        FBF9F6FBF9F7FCF9F7FBFAF7FCFAF8FCFAF8FCFAF8FDFAF8FDFBF9FDFBF9FDFB
        FAFDFBFAFEFCFBFDFCFBFEFCFCFEFCFCFEFCFDFFFCFDFEFDFDFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFE808000808000808000808000808000808000808000808000808001818101
        8181028181028281028281038181038282038282048283058283058383058383
        0683830683830683830783830784830885840884850884850984840A85840A85
        850A86850A86860B85850B86860C86860C86860C87860D86870D87860E87870E
        87870F88870F888810888810888810888810898911898812898911898912898A
        138989138989138A8A148A8A148B8A158B8B158B8B158B8B168B8B178B8B168C
        8B178B8C178C8C188C8C198D8C198D8D198D8D1A8D8D1A8D8D1A8E8D1A8D8D1B
        8E8E1B8E8E1C8E8E1D8E8E1D8E8E1D8F8E1E8F8F1E8F8F1E8F901F908F1F8F90
        2090902090902190902190902190912291912291902391912392912391922492
        9224939225939325929325939325939326939227939327939327949328949428
        94932994942995952995952A95952A95942B96952B96962C96952C96952C9796
        2C97962D96962D97972E97972E97972E98972F98982F98983098983098983099
        98319898319998319999329999329A99329999349A99339A99349A9A349A9A35
        9A9B359B9B369B9B369C9B379B9B379B9B389B9B389C9C399C9C389C9C399C9C
        3A9D9C3A9D9D3B9D9D3A9D9D3B9E9D3C9E9E3C9E9D3C9F9E3D9E9E3D9F9E3E9F
        9E3EA09E3EA09F3E9F9F3F9F9F3FA09F3FA0A040A1A041A1A041A1A041A1A142
        A1A042A2A142A1A143A2A144A2A144A2A245A3A145A3A345A3A246A3A246A3A2
        46A4A247A3A347A4A348A4A448A4A348A5A449A5A54AA5A44AA5A54AA5A44AA5
        A54BA6A54BA6A54CA6A64CA6A64CA6A64DA7A74DA7A64EA7A64EA7A74EA7A74F
        A7A74FA8A74FA8A750A8A850A9A851A8A852A9A852AAA952A9A953A9A953A9A9
        53AAA954AAAA54AAA954AAAA55ABAA55ABAA56ABAA56ABAB57ACAB57ABAB57AC
        AB57ACAB58ADAB58ADAC59ACAC5AADAC5AADAC5AADAD5BADAD5BADAD5CAEAD5C
        AEAE5CAEAD5CAFAD5DAFAE5DAFAE5EB0AE5EAFAE5FB0AF5FB0AF60B0AF60B0B0
        60B0AF61B0B061B0B062B1B062B1B062B1B162B1B163B2B164B2B164B2B265B2
        B265B3B165B3B265B3B266B3B267B3B366B4B267B4B367B4B368B4B369B4B469
        B4B369B5B46AB5B46AB5B46BB5B56BB5B56BB6B56CB6B56CB7B66DB6B66DB6B6
        6DB7B66EB7B66EB8B76EB8B66FB8B76FB8B770B8B770B8B870B9B871B8B871B9
        B872B9B872BAB872BAB872BAB973BAB974BAB974BAB975BABA75BBB975BBBA76
        BBBA76BBBA76BCBB77BCBB78BBBB78BCBB78BCBC78BDBB79BDBC79BDBC79BDBC
        7BBEBD7BBDBD7BBEBC7BBEBC7CBEBD7DBFBD7CBFBD7DBFBE7DBFBD7DBFBE7EC0
        BE7FBFBE7FC0BE80C0BF80C0BF80C0BF80C1C081C1BF81C1C082C1C182C2C082
        C2C183C2C183C1C184C2C185C3C185C3C186C3C285C3C286C3C386C4C286C4C3
        87C4C287C4C388C5C388C5C389C4C389C5C389C5C48AC6C48BC5C58BC5C58CC6
        C58BC6C58CC7C58CC6C58DC7C68DC7C68DC7C68EC7C68FC7C68FC7C68FC8C790
        C8C690C8C791C8C891C8C891C9C792C9C892CAC892C9C893CAC993C9C894CAC9
        94CAC995CAC995CACA95CBC995CBCA96CCCA96CCCA97CCCB98CCCB98CCCA98CC
        CB99CDCB99CCCC9ACCCB9ACDCC9BCDCC9ACECD9BCECD9CCECD9CCECD9CCFCD9C
        CFCD9DCECD9DCFCD9ED0CE9FCFCE9FCFCE9FD0CFA0D0CF9FD0CFA0D0CFA0D1D0
        A1D0CFA1D1D0A1D1CFA2D1D0A3D1D0A3D2D1A3D2D1A4D2D1A4D2D1A4D2D1A5D3
        D1A6D3D2A6D3D2A6D4D2A6D3D2A7D4D3A7D3D2A8D4D3A9D4D3A9D4D3A9D4D4A9
        D5D4AAD5D4ABD6D4ABD6D4ABD6D4ACD6D5ACD6D5ACD6D5ACD7D5ADD7D6AED7D6
        AED7D6AED7D6AFD8D6AFD8D6AFD8D7B0D9D7B1D8D7B1D9D8B1D9D8B1D9D8B2D9
        D8B2D9D8B3DAD8B3DAD9B4DAD9B4DBD9B4DAD9B5DBD9B5DBDAB5DBDAB6DBDAB6
        DCDAB7DCDBB8DCDAB7DCDBB8DCDBB8DCDBB9DCDBB9DDDCBADDDBBADEDCBBDEDC
        BBDEDCBBDEDCBCDEDCBDDFDCBDDFDDBDDFDDBDDFDDBEDFDEBEDFDDBFE0DEBFE0
        DEBFE0DEC0E1DFC0E0DEC1E1DFC1E1DFC1E0DFC1E1E0C2E2E0C3E2E0C3E2E0C3
        E2E0C4E2E1C5E3E0C5E3E1C5E3E1C6E3E2C6E3E1C6E3E2C7E3E2C7E3E2C8E4E2
        C8E4E3C8E4E3C8E5E2C9E4E4CAE5E4CAE5E4CAE6E4CBE5E4CBE5E4CBE6E5CBE6
        E5CCE6E5CDE6E5CEE7E5CDE7E6CEE8E6CEE7E6CFE7E6CFE7E6CFE8E7D0E8E6D1
        E9E7D1E8E7D1E9E7D2E9E7D2EAE8D3EAE7D3E9E8D3EAE8D4EAE9D4EAE9D5EAE9
        D4EAE9D5EAE9D6EAEAD6EBE9D6ECEAD7ECE9D7ECEAD7ECEAD8ECEBD9ECEBD9EC
        EBD9EDEBDAEDECDAEDEBDBEEECDBEDECDBEEECDCEEECDCEEECDCEFECDDEEEDDD
        EEEDDEEFEDDEEFEDDEF0EDDFEFEEDFF0EEDFF0EFE0F0EFE1F1EEE1F0EFE2F1EF
        E2F1EFE2F1F0E2F2EFE3F2F0E3F1F0E3F2F1E4F2F1E5F2F1E5F3F1E5F3F1E6F3
        F1E6F4F2E6F3F1E7F4F1E8F4F2E8F4F3E8F4F2E8F5F3E9F5F3E9F5F3EAF5F3EA
        F5F3EBF5F4EBF6F4EBF5F4ECF6F4ECF6F5EDF6F5EDF7F5EEF7F5EEF7F5EEF7F5
        EFF8F5EFF8F6F0F8F6F0F8F6F0F9F7F1F9F7F1F8F7F1F8F7F2F9F7F3FAF8F2F9
        F8F3FAF8F4FAF8F4FBF8F4FAF8F4FBF9F5FAF9F6FBF9F6FBFAF7FBFAF7FBF9F7
        FCFAF7FCFAF8FDFAF9FCFAF8FCFBF9FDFAF9FDFBFAFDFBFAFEFBFBFDFCFBFEFC
        FBFEFCFBFEFCFCFEFDFDFEFDFDFFFDFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE80800080800080800080
        8000808000808000808000808000808100808102818102818102818203818202
        8182048282048282048282058383058383058383058383068383068483078483
        0784830884840885840884850985840985850985850A85850B85850B85860B86
        860C86860C86860C86860D87870E87860D87860E87880F88870F888810888710
        8888108888108888118888118889128989128989138A89138A89148A8A148A89
        148B8A158B8B158A8A158B8B168B8B168B8B178C8B188C8B188C8C188C8C188C
        8D198C8D198D8D198D8D1A8D8D1A8E8D1B8E8D1B8D8D1C8E8E1C8E8E1D8F8E1D
        8E8E1D8F8F1E8F8F1E908F1F908F1F908F1F8F901F9090209190219090219091
        2191902191912291912292912392912392922392912493912593932592922693
        932693922694932793932793942793942894942895942894942995942995952A
        95942A95942A95952B95952C96962B96962C97962D97962D97972E97972D9797
        2F97972F97972F98973098973098983098983198983199983299993299983299
        99329A99339999349A9A349A9A349A9A359B9A359B9A369B9A369B9B369B9B36
        9C9C379C9C379C9C389C9C389C9B389C9C399D9D399D9C3A9D9D3A9D9D3B9D9D
        3B9D9D3B9E9E3C9E9E3C9E9E3D9F9E3D9E9F3D9F9E3EA09E3E9F9F3F9F9F3F9F
        9F40A09F40A1A040A0A040A0A041A1A042A0A042A1A042A1A143A1A143A1A143
        A2A144A2A145A3A244A3A245A3A245A3A345A3A346A3A247A4A347A4A348A4A3
        48A4A348A5A448A5A44AA5A44AA5A44AA6A54BA5A54BA5A54BA6A54CA6A64CA7
        A64CA6A54DA6A64DA7A64DA7A64EA7A74FA7A64FA8A74FA8A750A8A750A8A851
        A8A851A8A851A9A952A9A852A9A853AAA953AAA954AAAA54AAAA54AAAA54ABAA
        55AAAA55ABAB56ABAB56ACAB57ABAB57ACAB57ACAB58ACAB58ADAB58ACAC59AD
        AC59ADAC5AADAC5AADAC5AAEAD5BAEAD5BAEAE5CAEAE5CAEAE5DAFAE5DAFAE5E
        AFAE5EAFAF5EAFAE5EAFAF5FB0AF60B0AF60B0B060B0B061B0B061B0B061B1B0
        61B1B062B1B063B2B163B2B064B2B164B2B164B2B265B3B265B3B266B3B366B3
        B266B4B267B4B267B4B368B4B368B4B469B5B369B4B369B5B469B5B46AB5B56A
        B5B56BB6B56CB6B56BB6B56CB6B56CB7B56DB7B56DB6B66EB7B66EB7B66FB7B6
        6FB7B770B8B76FB8B870B8B870B8B771B8B871B9B872B9B872B9B873BAB973BA
        B973BAB974BAB974BAB974BABA75BBB976BBBA75BBBA77BBBA76BCBB77BBBA77
        BCBB78BCBB78BCBB79BDBB79BDBB79BDBC7ABEBC7ABDBC7BBDBC7BBEBD7BBEBD
        7CBEBD7CBEBD7DBEBE7CBFBD7EBFBD7DBFBE7FC0BE7FC0BF7FBFBF80C0BF80C0
        BF80C0BF81C0C081C1C081C1C082C1C182C1C182C2C184C2C184C2C184C2C184
        C2C185C2C185C3C285C3C285C3C286C3C387C3C387C4C388C4C388C4C388C5C3
        89C5C389C5C489C5C48AC5C48AC5C48BC5C58BC6C48CC6C58CC6C58DC6C58DC7
        C58DC6C58DC7C68EC8C68EC7C68EC8C78FC7C790C8C790C8C790C8C791C8C891
        C9C892C9C892C9C893C9C892CAC994C9C993CAC994CAC995CBCA94CBCA95CACA
        95CBCA96CBCA97CCCA96CCCA97CBCA98CCCB98CCCB98CDCB99CDCC99CDCC99CD
        CC9ACDCC9ACDCC9BCDCC9CCECC9CCECD9DCECD9DCFCD9DCFCD9ECFCD9ED0CE9E
        CFCE9ECFCF9FD0CE9FD0CEA0D0CEA0D0CFA1D0CFA1D1D0A1D1D0A2D1D0A2D1D0
        A3D2D0A3D2D1A4D2D0A4D2D1A4D3D1A4D2D1A5D3D2A5D3D2A6D3D2A6D4D2A7D4
        D2A7D3D3A8D4D2A8D4D3A8D4D3A8D5D3A9D4D3A9D5D4AAD6D4AAD6D4ABD6D4AB
        D6D4ACD6D5ABD6D5ADD6D5ACD7D5ADD6D5AED7D6AED7D5AED8D6AED8D6AFD8D6
        B0D8D6B0D8D7B1D9D7B1D8D7B1D9D7B2D9D8B2DAD8B2DAD8B3DAD8B3DAD8B4DA
        D9B4DAD8B4DBD9B4DBD9B5DADAB5DBDAB6DBDAB7DBDAB7DBDAB7DCDAB8DCDAB9
        DCDBB8DCDBB9DCDCB9DDDCBADDDBBADDDCBADEDCBBDDDCBCDDDCBBDEDCBCDFDD
        BDDEDDBDDEDEBDDFDDBEDFDEBEDFDEBFE0DEBFE0DFC0E0DFBFE0DFC0E0DFC1E1
        DFC1E0DFC1E1DFC2E1E0C2E1E0C3E2E0C3E2E0C3E2E0C4E2E0C4E2E1C4E3E1C5
        E3E2C5E3E1C5E3E1C6E4E2C6E3E2C7E4E2C8E4E3C7E4E2C8E5E2C8E4E3C9E4E3
        CAE5E3CAE5E3CAE5E4CBE5E4CBE6E4CBE6E4CCE6E5CCE6E5CCE6E5CDE7E5CDE7
        E5CEE7E5CEE7E5CFE7E6CFE7E7D0E8E6D0E8E6D0E8E7D1E9E6D1E8E7D1E9E7D2
        EAE7D2EAE8D3EAE8D3EAE8D3E9E8D4EAE8D5EBE9D5EAE9D5EBE9D6EBE9D6EBE9
        D7EBEAD6ECEAD7ECEAD7ECEAD8ECEBD8ECEBD9EDEBD9ECEBD9EDEBDAEEEBDBEE
        EBDBEEECDBEEECDCEEECDCEFEDDDEEEDDDEEEDDDEFEDDEEFEEDEEFEEDEF0EEDE
        F0EEDFF0EEE0F0EEE0F0EFE1F0EEE1F1EFE1F1EFE1F1EFE2F2F0E3F2EFE3F2F0
        E3F2F1E4F2F0E4F3F0E5F3F1E5F2F1E5F3F1E5F3F1E6F4F2E7F3F2E7F4F2E7F4
        F2E7F4F2E8F4F3E8F5F2E9F5F3E9F5F3EAF6F3EAF6F3EAF5F4EBF6F4EBF6F4EC
        F6F4EDF6F4EDF6F5EDF7F5EDF7F5EEF7F5EFF8F6EFF7F5EFF7F6EFF8F6F0F8F6
        F0F8F7F1F8F7F1F9F7F1F9F7F2F9F8F2FAF8F2FAF8F3FAF8F4FAF8F4FAF8F4FA
        F8F5FAF9F5FAF9F6FBF9F6FBF9F6FBFAF7FCF9F7FCF9F8FCFAF8FCFAF8FCFAF8
        FDFBF9FCFBF9FDFBF9FDFBFAFEFCFBFDFBFBFEFCFCFEFCFCFEFCFCFFFCFCFFFC
        FDFFFCFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFE80800080800080800080800080800080800080800080
        8001808101818001818102818102818202828203818204828203828204828204
        8383058382058383058383068383068383078483078484078484088484098485
        0885840984840A85850A85850A86850B86860C86850C86860C86860D87860D87
        870D87870D87870E88870F88870F878810878810888810898811898811898911
        8989128989128989128A89138A8A138A8A138A8A148A8B148B8B158B8B158B8B
        168B8B168C8B178C8B178C8B178C8C188C8C188D8C188C8D198D8D1A8D8C1A8D
        8D1A8E8D1B8E8D1B8E8E1C8E8E1B8E8E1D8F8F1D8E8E1D8F8E1D8F8F1E8F8F1E
        908F1F908F1F9090209090209090219190219190219091229190229191229191
        2392912392912492912492922493922593932593922593932693932694932794
        932794942894942894942895942995942995942A95942A95952B95952A95952B
        96952C96952C96962C96962D97962D96972E97972E97972F98972F9897309897
        2F9897309898309898309899329998319999329999339999339A99339A99349A
        99349A9A359B9A359A9A359B9A359B9B369B9B379C9B379C9B389C9C379C9C38
        9C9C399C9C399C9C399D9D3A9E9C3B9D9D3B9D9D3B9D9D3C9D9D3C9E9E3C9E9D
        3C9F9E3D9F9F3E9F9E3E9F9E3E9F9F3F9F9F3F9FA040A0A040A0A040A1A041A1
        A041A1A142A1A042A1A142A1A143A2A143A2A143A2A244A2A244A3A145A3A245
        A3A246A3A246A3A347A3A347A4A347A4A447A4A448A4A348A4A449A4A449A5A4
        4AA5A44AA5A44AA6A54BA6A54BA6A54CA6A54CA6A54DA7A64DA7A64DA7A74EA7
        A64EA7A64FA8A74FA7A750A8A74FA8A850A8A851A8A851A9A852A9A852A9A852
        A9A953A9A952AAA953AAA954AAA954AAA954AAA955ABAA55AAAA55ABAB56ACAA
        57ABAB57ACAB57ABAB58ACAB58ACAC59ACAC59ACAC5AADAC5AADAC5AAEAC5AAD
        AD5BAEAD5CAEAD5CAEAE5DAEAE5DAEAE5DAEAE5EAFAE5EAFAE5EB0AF5FB0AF5F
        AFAF60B0AF60B0AF60B0B061B1B061B1B061B0B062B1B162B1B062B2B163B2B1
        63B2B164B2B164B2B264B2B265B3B266B3B266B3B266B4B367B3B267B4B367B4
        B468B4B468B4B368B5B469B5B46AB5B46AB6B46AB5B46BB6B56BB6B56CB6B56C
        B7B66CB6B66DB7B66DB7B66EB7B66EB7B66EB7B76FB8B66FB8B770B8B770B8B8
        70B9B771B9B871B9B872B9B872BAB873B9B973BAB973BAB974BAB974BAB975BA
        BA75BABA76BBBA76BBBB76BBBA77BBBA77BBBB78BCBB77BCBB78BCBB79BCBC79
        BDBC7ABDBC79BDBD7ABDBD7BBDBD7BBEBC7CBEBD7CBEBD7DBEBD7DBFBE7DBEBE
        7DBFBE7EBFBE7EC0BF7EC0BE7FBFBF7FC0BF80C0BF80C1BF80C1C081C0C081C1
        C082C1C082C1C083C1C083C2C184C2C184C2C185C2C184C2C185C3C286C3C186
        C3C286C4C286C4C387C4C388C4C388C5C389C5C389C5C38AC5C489C5C48AC5C4
        8AC5C58BC6C58BC6C58BC6C58CC6C58CC7C58CC7C68DC7C68DC7C68EC7C68EC7
        C68FC8C68FC8C790C8C690C8C790C8C791C8C791C9C892C9C792C9C892CAC893
        CAC893CAC894CAC894CBCA94CACA95CBC995CBCA96CBC996CBCA97CBCA97CCCA
        97CCCB98CCCB99CCCB99CCCB99CDCB99CDCB99CDCC9BCDCC9BCECC9BCDCC9CCE
        CC9CCECD9CCECD9CCFCD9DCFCD9ECFCE9ECFCE9ED0CE9FD0CE9FD0CFA0CFCFA0
        D0CFA0D0CFA0D0CFA1D1CFA2D0CFA2D1CFA3D2D0A3D1D0A3D2D1A3D2D1A3D2D1
        A5D3D1A5D3D1A5D3D1A5D3D2A6D4D2A6D3D2A7D3D2A7D4D2A8D4D2A8D4D3A8D5
        D3A8D5D3A9D5D4AAD5D4AAD6D4ABD5D4ABD6D4ACD6D4ABD6D4ACD6D5ACD6D5AD
        D7D5ADD6D5AED7D6AED7D6AFD7D6AFD7D6AFD8D6AFD8D7B0D8D7B0D8D7B0D9D7
        B1D9D7B2D9D8B2D9D7B3DAD8B3D9D9B3DAD8B4DAD8B4DAD9B4DAD9B5DBD9B5DB
        D9B6DBDAB6DBDAB6DCDAB7DCDAB7DBDAB7DCDAB8DDDBB9DDDBB9DDDBB9DDDBBA
        DDDCBBDDDCBBDDDCBBDDDCBCDDDCBBDFDCBCDEDDBCDFDDBDDFDDBDDFDDBEDFDD
        BEE0DDBEDFDEBFE0DEBFE0DEBFE0DEC0E0DEC1E0DFC1E1DFC1E0E0C2E1E0C2E2
        E0C3E2E0C3E2E0C3E1E1C3E2E0C4E2E0C4E2E1C5E2E1C6E3E2C6E3E1C6E3E2C6
        E4E2C7E4E2C7E3E2C8E4E3C8E4E3C8E5E3C9E5E3C9E5E3CAE6E4CAE5E4CBE5E4
        CBE6E4CCE6E5CCE7E5CDE7E5CCE6E5CDE7E5CDE7E5CDE7E6CFE7E6CFE8E6CFE8
        E6CFE8E6CFE8E7D0E9E7D1E9E6D1E8E7D2E9E8D2E9E8D2E9E8D3E9E7D3EAE8D4
        EAE8D4EAE8D4EAE9D5EBE9D5EAE9D6EBE9D6EBE9D6EBEAD7ECEAD7ECEAD7ECEB
        D8EDEBD8EDEBD9ECEAD9EDEBDAEDECDAEDEBDAEDECDBEDEBDCEEECDBEEECDCEE
        ECDDEEEDDDEFEDDDEFEDDEEFEEDEEFEDDEEFEEDFF0EEDFF0EEDFF0EFE0F1EEE0
        F1EFE1F0EFE1F1EFE1F1EFE2F1EFE3F2F0E3F1F0E4F2F0E3F2F0E4F2F0E4F2F0
        E5F3F1E5F3F1E6F3F1E6F3F1E7F3F1E7F3F2E7F4F2E8F4F3E8F4F2E9F4F3E9F4
        F3EAF5F3EAF5F4EAF5F3EBF6F3EBF5F4EBF5F4ECF6F4ECF6F4EDF6F5EDF6F5ED
        F7F5EEF7F6EEF8F5EEF8F6F0F7F6EFF8F6F0F9F6F1F8F6F1F8F6F1F9F6F1F8F7
        F2FAF8F2FAF7F3F9F7F3FAF8F4FAF8F4FAF8F5FBF8F5FAF8F5FBF9F5FBF9F6FC
        F9F6FCFAF7FBFAF7FCF9F7FCFAF8FCFBF8FCFBF9FDFBF9FCFBF9FDFBFAFEFCFB
        FDFBFBFEFCFCFEFCFCFEFCFCFEFCFCFFFDFDFEFCFDFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080
        0080800080800080800080800080800080800080800080810080800281810181
        8102818102828103828203828204828204828304828205828305838306838306
        83830684830683830884840884840884840884840985850985850A85850A8585
        0B86860B86860C86860C87860C87860D87860D87860D87870E87870E87870F88
        880F87870F8887108888108888108989118989118989128A8912898912898A14
        8A8A138A8A148A8A148A8A158B8B158B8B158B8B168B8B168B8B178C8B178C8C
        178C8C188C8C188D8C198D8C198D8C1A8D8D1A8D8D1A8E8D1B8E8D1B8E8D1C8E
        8E1C8E8E1C8F8F1D8F8E1D8F8E1E8F8E1E8F8F1E908F1E908F1F90901F909020
        9090219090219090219091219190229291229191239292239191239291249391
        2492922592922592932593932693932793932793932793932794932894942995
        942995942995942996942A95952A95952B95952B95962B96962C96962D96962D
        96972D97972E97972E97962E97972F98972F9898309897309998309898319898
        319999319999329999329999339999349A99349A99349A9A349A9A359A9A359A
        9B369B9A369B9B379B9B379C9B389C9B389C9B389D9C389D9C399C9D399D9C3A
        9D9D3B9D9D3A9D9D3B9E9D3C9E9E3C9E9E3D9F9E3D9F9E3D9F9E3E9F9F3E9F9E
        3E9F9F3FA09F3FA09F3FA0A040A0A040A0A041A1A041A1A142A1A142A1A042A2
        A143A2A143A1A244A2A144A2A144A2A245A2A245A2A245A3A246A3A246A4A247
        A3A347A3A448A4A348A4A449A4A348A4A449A4A449A5A44AA5A44AA5A54BA6A5
        4BA6A54CA6A54CA6A64DA6A64DA7A64EA7A74DA7A64EA7A64EA7A74FA7A74FA8
        A74FA8A750A9A750A9A751A8A852A9A951A9A952A9A953A9A953AAA953AAA953
        AAAA54AAA955AAAA55ABAA55ABAB55ABAA57ABAA57ACAB57ACAB57ABAC58ACAB
        58ACAC59ACAC59ACAC59ADAC5AAEAC5AADAC5BAEAD5BADAD5BAEAD5CAEAD5DAE
        AD5DAFAE5DAFAE5DAFAF5DAFAE5EB0AE5EAFAE5FB0AE5FB0AF60B0AF61B1AF61
        B1B061B0B062B1B062B1B162B1B162B1B163B2B063B2B264B3B164B3B265B3B2
        65B3B266B3B266B3B267B4B367B3B268B4B368B3B368B5B369B4B368B4B469B5
        B469B5B46AB6B56AB6B56BB6B46BB5B56CB6B56CB7B56DB6B56DB7B66DB7B66D
        B7B66EB8B66EB8B76FB8B76FB8B76FB8B770B8B870B9B771B9B871B9B872B9B8
        72BAB973B9B873BAB973BAB973BAB974BBBA75BABA75BBBA75BBBA76BBBA76BB
        BA77BBBB77BCBB78BCBB77BCBB78BCBB78BCBC79BCBC79BDBC7ABDBC7ABDBD7B
        BEBC7BBEBD7CBEBD7CBEBD7DBFBD7CBFBD7CBFBE7DBFBE7EBFBE7EBFBE7EBFBE
        7FC0BF80C0BF80C0BF81C0BF81C0BF81C1C082C1C082C1C083C1C183C2C083C2
        C183C2C184C2C285C3C185C2C185C3C285C3C286C3C286C3C387C3C387C4C287
        C4C388C4C388C4C389C5C389C5C489C5C48AC5C48AC5C48AC5C58CC5C58CC6C5
        8CC7C58CC6C58CC7C58DC7C58EC7C68EC7C68EC7C68FC7C78FC8C68FC8C790C8
        C791C8C791C8C891C9C792C9C892CAC892C9C893C9C893C9C994CAC894CACA94
        CBC995CBC996CBCA96CBCA96CBCB97CCCB97CCCA97CCCB97CCCB98CCCB99CCCB
        99CCCB99CDCC9ACDCC9ACDCC9BCDCC9BCECD9BCECD9CCECD9DCFCD9CCFCD9DCF
        CD9ECFCE9DCFCE9ECFCE9FCFCF9FD0CE9FCFCF9FD0CFA0D0CFA0D0CFA1D0D0A2
        D1CFA1D1D0A2D1D0A2D2D0A3D2D0A4D2D0A4D2D0A4D2D1A5D3D1A6D2D2A5D3D1
        A6D4D2A6D4D2A7D3D2A7D3D3A7D4D2A8D4D2A9D4D3A8D5D4A9D4D4A9D5D4AAD5
        D4ABD5D4ABD6D4ABD6D4ABD6D5ACD6D5ACD6D5ADD7D5AED6D6ADD7D5AED7D6AE
        D7D6AED7D6B0D8D7AFD8D7B0D8D7B1D9D7B0D8D7B2D9D7B1D9D8B2D9D8B3D9D8
        B2DAD8B3DAD8B4DAD8B4DAD9B4DAD9B5DBD9B5DBD9B6DBD9B6DBD9B6DBDAB7DB
        DAB7DCDBB8DCDBB8DCDBB8DCDBB9DCDBB9DDDCBADDDCBADEDCBBDEDCBBDEDCBB
        DDDCBBDEDDBCDEDCBCDFDDBDDEDDBDDFDEBDDFDEBEDFDEBFE0DEBFDFDEBFE0DE
        BFE0DEC0E0DFC1E1DFC0E0DFC1E1E0C2E1DFC3E1DFC2E2E0C3E1E0C3E1E0C4E2
        E1C5E3E1C5E2E1C5E3E1C6E3E2C6E3E2C6E3E1C7E4E2C7E4E2C7E4E2C8E4E3C9
        E4E3C9E5E3C9E4E3CAE5E3C9E5E3CBE5E4CBE5E4CBE6E4CCE6E4CCE7E5CCE6E5
        CCE7E5CDE6E6CDE7E5CEE8E5CEE7E6CFE7E6CFE8E7CFE8E6D0E8E7D0E8E7D1E8
        E7D2E9E7D2E9E7D1E9E7D2E9E8D3E9E8D3E9E9D3EAE9D4EAE9D4EBE9D5EAE9D5
        EBE9D6EBEAD6EBE9D6EBEAD7EBEAD8ECEBD8ECEAD8EDEBD8ECEBD9ECEBD9EDEB
        DAEDECDAEDEBDAEEEBDBEEECDBEEECDCEEEDDCEEECDDEFEDDDEFEDDEEFEDDEEF
        EEDEEFEDDEF0EEDFEFEEDFF0EEE0F0EEE0F1EFE0F1EEE0F1EFE2F1EFE1F1F0E2
        F1EFE3F2EFE3F2F0E3F2F0E3F2F0E4F3F0E4F3F0E5F3F1E5F3F1E5F3F2E6F4F2
        E7F4F2E7F3F2E7F3F2E8F4F3E8F4F3E8F5F3E9F5F3EAF5F3EAF5F3EAF6F4EBF6
        F4EBF6F3EBF6F4ECF6F4ECF7F4EDF7F5EDF6F4EEF7F5EEF7F5EEF7F5EFF7F6EF
        F8F6EFF8F6F0F8F6F1F8F6F0F9F7F1F9F7F1F9F7F2F9F7F2F9F7F3FAF7F3FAF8
        F3FAF8F4FAF8F4FBF8F5FBF9F5FBF8F5FBF9F6FCF9F6FBF9F7FCF9F7FCFAF7FC
        FAF8FCFAF8FCFAF9FDFAF9FDFBF9FDFCFAFEFCFAFEFCFBFEFBFBFEFCFCFEFCFB
        FEFDFCFEFDFDFFFCFDFEFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080008080008080008080008080
        0080800080800080800181810081800181810181810281810281820382820381
        8204828204828205838305838205838306838306838306838407838407848408
        84840884840885840985840A85850985850A85860A86850B85850C86860C8686
        0C86860D86860D87870E87870E88870E87870F87870F87871088871088881089
        88108988118989118988128989128989128A89138A8A13898A148A8A148B8A15
        8B8A158B8A158B8B168B8B168B8B168B8B178C8C178B8C188C8C188C8C198D8C
        198C8D1A8D8D1A8D8D1A8D8D1B8E8D1B8D8E1C8E8E1C8E8E1D8E8E1D8E8E1E8F
        8F1E8F8F1E8F8E1E8F8F1E90901F8F8F1F909020909021919020909121919121
        9191229191239191239291239291239291249292249292259392269392259393
        2693932693932794932894932894942895942994952995952995942A95952A95
        952B96952B96952B96952C96962C96962C97972D97972D97962E97972E97972E
        97972F97972F98982F9998309898319898319999319998329998329A99339999
        339A99339A99349A9A349B9A349A9A359B9A359B9A369C9B369B9B379B9B379B
        9B379C9C389C9C399C9B399D9C399D9C399D9C3A9D9D3A9D9D3B9D9D3B9D9D3C
        9E9D3B9E9E3C9F9E3C9F9E3D9F9E3E9F9E3E9F9E3F9F9F3F9F9F3FA09F40A0A0
        40A09F40A0A041A1A041A1A041A1A041A2A142A2A043A2A143A2A244A2A244A2
        A144A3A245A3A245A3A246A3A346A3A347A4A347A4A347A3A347A4A448A4A448
        A4A448A5A44AA5A44AA5A54AA5A54AA5A44BA6A54CA6A54BA6A54CA6A54CA6A6
        4DA7A64DA7A64DA7A64EA7A74EA7A64FA8A750A8A750A8A850A8A751A9A851A8
        A851A9A852A9A952A9A853A9A952A9A954AAA954AAAA54ABAA55AAAA55ABAA55
        ABAB55ABAA56ACAA56ABAA57ACAB58ACAB57ACAC59ADAC58ADAC59ADAC59ADAC
        5AADAC5AADAD5AAEAC5BAEAD5BAEAD5CAEAD5CAEAE5CAFAD5DAFAE5EAFAF5EAF
        AE5EB0AE5EB0AF5FB0AF5FB0AF60B0B061B0AF61B0AF61B1B061B1B062B1B162
        B1B163B2B163B2B163B2B164B2B164B2B165B2B265B3B265B3B266B3B267B3B3
        67B4B367B4B368B4B468B4B368B4B368B5B369B4B469B5B46AB5B46AB6B56AB5
        B56CB6B56CB6B56CB7B56DB7B56DB7B66DB7B66DB7B76EB7B66FB7B76FB7B76F
        B8B770B8B770B8B771B8B871B8B871B9B871B9B872B9B873BAB973BAB973BAB9
        74BAB974BABA74BABA75BBBA75BAB975BBBA76BBBA76BCBB76BCBB77BCBB78BC
        BB78BCBB79BDBC78BDBC7ABDBC79BDBC7ABDBD7ABEBC7BBEBD7CBEBD7CBEBD7C
        BEBD7DBFBD7DBFBE7EBFBE7DBFBE7FBFBE7EBFBE7FBFBE7FC0BF80C0C080C0BF
        80C0C081C1BF81C1C082C1C082C1C083C1C083C2C083C2C184C2C185C2C185C3
        C185C2C286C3C286C3C286C3C386C4C388C4C288C4C388C4C388C4C489C4C389
        C4C48AC5C48AC5C48AC5C48BC5C48CC5C58CC6C58CC6C58CC7C58DC7C58DC7C6
        8DC7C58EC7C68FC8C68EC7C68FC8C790C8C790C9C790C9C891C8C891C9C891C9
        C792C9C993CAC893C9C893CAC994CAC994CAC994CBC995CBC995CBCA96CBC996
        CBCA96CBCB97CCCB97CCCB97CCCA98CCCB98CDCB98CCCC99CDCC9ACDCB9ACDCC
        9ACDCC9BCECD9BCDCC9BCECD9CCECD9CCECD9DCFCD9DCFCD9ECFCE9ECFCE9ED0
        CE9FCFCEA0D0CEA0D0CFA0D0CFA1D0CFA1D1CFA1D1D0A2D1CFA2D1D0A3D1D0A3
        D2D1A3D2D1A4D2D1A4D2D1A4D3D1A5D3D1A5D3D2A5D3D2A6D3D2A7D3D2A7D4D2
        A7D4D3A8D4D3A9D5D3A8D4D3A9D5D3A9D5D3AAD5D4ABD6D4AAD5D4ABD5D4ABD6
        D5ACD6D4ACD6D5ACD7D5ADD7D6ADD7D5AED7D5AED7D6AFD7D6AFD8D6AFD8D7B0
        D9D6B0D8D7B1D9D7B1D9D7B2D9D8B2DAD8B2D9D8B3DAD8B3DAD8B4DAD9B4DAD9
        B4DAD9B5DBD9B6DADAB5DBD9B6DBDAB6DBDAB7DCDAB7DCDAB8DCDBB8DCDAB9DC
        DBB8DDDBB9DDDBB9DDDCBADEDCBBDEDCBBDEDDBBDEDCBBDEDCBDDFDDBCDFDDBD
        DEDDBDDFDDBEDFDDBEDFDEBFDFDEBFDFDEC0DFDEBFE0DFC0E0DFC0E0DFC1E1DF
        C2E1E0C2E1DFC2E2E0C2E1E0C3E2E0C4E2E1C4E2E0C4E2E1C5E3E0C5E3E1C5E2
        E2C6E4E2C6E3E2C7E4E2C7E3E3C7E4E2C8E4E3C8E4E3C8E4E3C9E4E3CAE5E3CA
        E5E4CAE6E4CAE5E4CBE6E4CCE6E4CCE6E5CCE7E5CDE6E5CDE7E5CDE7E5CDE7E5
        CEE8E6CEE7E6CFE7E6D0E8E6D0E8E6D0E9E7D1E8E7D1E9E7D1E9E8D1E9E8D2E9
        E8D3EAE8D3E9E8D3EAE9D4EAE9D4EBE9D5EAE9D5EBE9D5EBEAD6EBE9D6EBEAD6
        ECEAD7ECEAD7ECEAD8ECEBD8ECEBD9EDEBD9EDEBDAEDEBDAEEEBDBEEEBDBEDEB
        DBEEECDBEEECDCEEECDCEEEDDDEEEDDDEFEDDDEFEDDEEFEEDEEFEEDFF0EDDFF0
        EEE0F0EEE1F0EFE0F0EEE1F1EFE1F1EFE1F1EFE2F1EFE3F1F0E3F2EFE3F2F1E3
        F2F1E5F2F0E4F2F1E5F2F1E5F3F1E6F4F1E6F3F2E6F3F2E7F4F2E7F4F2E8F4F2
        E8F5F2E8F4F2E9F5F3E9F5F3EAF5F3EAF6F4EAF6F4EBF6F4EBF6F4ECF6F4ECF7
        F4EDF6F5EDF6F5EDF7F5EEF7F5EFF7F5EFF8F6EFF8F6F0F8F6F0F8F6F1F8F7F1
        F9F6F1F9F7F2F9F7F2F9F7F2FAF8F3FAF8F3FAF8F4FAF8F4FAF8F4FAF9F5FAF9
        F5FBF9F6FBF9F6FBF9F6FCFAF7FCFAF7FBF9F8FCFAF8FCFBF8FDFAF9FDFBF9FD
        FBF9FDFBFAFDFBFAFDFBFBFEFBFBFEFCFCFEFCFCFFFDFCFFFCFDFEFDFDFFFDFD
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFE8080008080008080008080008080008080008080008080018181
        0181810181810181810281810281810382820382810482820482820583820483
        8205838305838306838307848407838307848408848408848508858409858409
        85850A85850A86850B85860B86860B85850C86860C87860C86860D87860D8787
        0E87870E87870F88870F88870F88881088881189881088891189881289891289
        89128989138A89138A8A138A89148A8A148A8A148B8A158B8A158B8A168B8B16
        8C8B178B8B178C8C178C8C188C8C188C8C198D8C198D8D1A8D8D1A8D8D1A8D8D
        1A8E8D1B8D8E1B8E8E1C8E8E1D8F8E1D8E8E1D8E8E1D8F8F1E908F1E8F8F1F8F
        8F20908F20909020909020909021909022919022919122919122919123919224
        9292239292249292259392259392259393259393269393269393279394289394
        2794942894942895942894942995942A95952A96952A95962B96962C96952C96
        952C96962C96972D96962D97962E97972F97972F98972F97972F989730989731
        9898309898319998319999329999339999329A99339999339A9A349A9A359A9A
        359B9A359B9B369B9A369B9B369B9B369B9B379B9B379C9C389C9B389C9C399C
        9C399D9C3A9D9D3A9D9C3A9E9D3A9D9D3B9E9D3B9D9E3B9E9E3C9E9D3D9F9E3D
        9F9F3D9F9F3E9F9F3E9F9E3F9F9F3F9F9F3FA0A03FA0A041A1A041A0A041A1A0
        42A1A142A1A142A1A143A2A143A2A244A2A144A3A245A3A245A2A245A2A245A3
        A246A3A347A4A347A4A347A4A348A4A348A5A449A5A449A4A449A5A44AA5A44A
        A5A54AA5A54BA6A54BA5A54BA6A64CA6A64CA7A64DA6A64EA7A64DA7A64EA7A7
        4FA7A74FA7A74FA8A750A8A750A8A751A8A851A9A851A9A852A9A852A9A852A9
        A953A9A953AAA954AAAA54AAAA55AAAA55ABAA55ABAB56ABAB56ABAB56ACAB57
        ACAB57ACAB57ACAC58ACAC58ACAB59ACAC59ADAC5AADAC5BADAC5BAEAD5BADAD
        5CAEAD5CAEAD5CAEAE5DAFAE5DAFAE5DAFAE5EB0AF5EAFAE5FAFAF5FB0AF5FB0
        AF60B0AF60B1AF61B1B061B1B062B1B061B1B063B2B162B2B163B2B164B2B164
        B2B164B2B265B2B165B3B265B3B266B3B366B3B367B3B267B4B367B4B368B4B3
        69B4B368B4B469B4B469B5B46AB5B46AB6B56AB6B46BB6B56CB6B56CB6B66CB7
        B56DB7B66DB7B66DB7B66EB8B76EB8B66EB8B670B8B770B8B770B9B770B9B871
        B8B772B8B871B9B872B9B872B9B873B9B973BAB974BAB974BAB975BBBA75BAB9
        76BABA76BBBA76BBBA76BCBA77BCBB77BCBB78BCBB78BCBB78BDBB79BCBC79BD
        BC7ABDBC7ABDBC7ABDBD7BBDBD7CBEBD7CBEBD7DBFBE7DBFBD7DBEBE7EBFBE7E
        BFBE7EC0BE7FBFBF7FC0BF80C0BF80C0BF80C0BF81C0BF81C1C081C0C082C1C0
        82C1C183C2C083C2C183C2C184C2C184C2C185C2C285C2C286C3C186C3C386C4
        C287C3C387C3C288C4C288C5C388C5C388C5C489C5C389C5C48AC5C48AC6C58A
        C6C58CC6C58CC6C58CC6C58DC7C58DC7C68DC7C58DC7C68EC7C68FC8C68EC8C6
        8FC8C790C8C790C8C790C9C791C8C792C9C791C9C892CAC893CAC893CAC994CA
        C994CAC994CAC994CAC995CBC995CBC996CBCA96CBCA97CBCA96CBCB98CCCB98
        CCCB98CCCB98CCCC99CCCC99CCCC9ACDCC9ACECC9BCECC9BCECC9BCECD9CCFCD
        9CCECD9CCFCD9DCECE9ECFCD9ECFCE9FD0CE9ECFCE9FCFCEA0D0CFA0D0CEA1D0
        CFA0D1D0A1D1CFA1D1D0A2D1CFA2D2D0A2D1D1A2D1D0A3D2D0A4D2D1A4D2D1A4
        D2D1A5D3D2A6D3D1A5D3D1A6D4D2A7D4D2A7D3D3A7D4D3A8D4D3A9D4D3A8D5D4
        A9D4D3AAD5D4A9D5D4ABD5D4ABD5D4ABD6D5ABD6D4ACD6D5ADD6D5ADD7D5ADD7
        D5ADD7D6AED7D6AFD8D6AED8D6AFD7D6AFD8D7B0D8D7B1D8D7B0D8D7B1D9D8B1
        D9D7B2D9D8B2D9D8B2DAD8B3DAD9B3DAD9B4DAD9B4DBD9B5DBD9B6DBD9B6DBD9
        B6DCDAB7DBDAB7DBDAB7DCDAB8DCDBB8DDDAB9DCDBB9DCDBB9DCDBBADDDCBADE
        DCBADDDCBBDEDCBCDEDCBBDEDDBCDEDDBCDFDDBDDEDDBDDFDDBDDFDEBEE0DDBE
        E0DEBEDFDEBFE0DEC0E0DFC0E1DEC1E0DFC1E1DFC2E0DFC2E2DFC2E2E0C3E2E0
        C3E2E0C4E2E0C4E2E1C4E2E1C4E2E1C5E2E1C5E3E1C6E3E2C6E3E2C7E3E2C7E4
        E2C7E4E3C7E4E2C8E4E2C9E5E3C9E5E3C9E5E3CAE5E4CAE6E3CBE6E4CBE6E4CC
        E6E5CCE6E4CCE7E4CDE6E5CDE6E5CEE7E5CEE7E5CFE7E6CEE8E6CFE7E6CFE8E6
        D0E8E6D0E8E7D1E8E7D1E8E7D2E9E7D2E9E7D2E9E8D3EAE8D3EAE8D3EAE9D4EA
        E8D4EAE9D5EBE8D5EBE9D5EBE9D6ECE9D7ECEAD6EBEAD7ECEAD7ECEAD8ECEBD8
        ECEBD9EDEBD9EDEBDAEDEBDAEDEBDAEDECDBEDECDBEDECDBEEECDCEEEDDCEFEC
        DDEFEDDDEFEDDEEFEDDEEFEDDEF0EEDFF0EEE0F0EEDFF0EEE0F0EFE1F0EFE1F1
        EEE2F1EFE2F1EFE2F2F0E2F2F0E3F2F0E4F1F0E4F2F0E4F3F0E5F3F0E5F3F1E5
        F3F1E6F3F1E6F3F2E7F3F2E7F4F2E7F4F2E8F4F2E8F5F3E9F4F3E9F5F3E9F5F3
        EAF5F3EAF5F4EBF6F4EBF5F4EBF6F4ECF6F4EDF6F4EDF7F5EDF7F4EDF7F5EEF7
        F5EEF8F5EFF7F6EFF8F6F0F8F6F0F8F6F0F8F6F1F9F7F1F9F7F2F9F7F2F9F8F3
        F9F8F3F9F8F3F9F7F3FAF8F4FAF9F4FBF9F5FAF9F5FBF9F5FBF9F6FBF9F7FCF9
        F7FCFAF8FCFAF7FCFAF8FDFAF8FDFAF9FDFBF9FDFBF9FDFBFAFDFBFAFDFBFAFE
        FCFBFEFCFBFEFCFCFEFCFDFFFCFDFEFDFDFEFDFDFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000
        8080008080008080008080008080008081008081018081028081028181028181
        0382810381810381820382820482820483830583820682830683830683830784
        840783840783840784840984840885840985840A85850A85850A85850A86850B
        85850B86860C86860C87870D87870D87870E87870E87870E88870E88870F8888
        0F8888108887108888118988118989128889128A88138989128989138A89138A
        8A148A8A158A8A148A8B158B8A168B8A168B8B168B8B178C8B178B8C188C8C18
        8C8C188D8C188D8D198C8D1A8D8C198D8D1A8D8D1B8E8E1B8E8E1C8E8E1C8F8E
        1D8F8E1C8E8F1D8F8F1E8F8F1E8F8F1E8F8F1F908F1F909020908F2090902191
        9021919021919121919022919122919123929124919124929224929224939225
        9392269393269393269393279393279393289493289494289493299494299594
        2A95942A95952A95952B95952B96962B96952B96962C96962C97962D97962D97
        972D97972E97972E98972F97972F989730989830989831989831989932999832
        9998329999329A99339999339A99349A9A349A9A349A9A359B9A369B9A369B9B
        379B9B369C9B379C9B389C9B389C9C389C9C389D9C399D9D3A9D9D3A9E9D3A9D
        9C3A9D9D3B9D9D3B9E9E3C9E9D3C9E9E3D9F9E3D9E9E3E9F9F3E9F9E3EA09F3F
        9F9F3F9F9F40A09F40A0A040A0A041A1A041A1A042A1A042A1A042A1A043A2A1
        43A2A143A2A244A2A145A3A245A3A245A3A245A3A246A3A246A3A347A4A348A4
        A347A4A448A4A448A5A349A4A449A5A449A5A54AA5A54AA5A54BA6A64BA6A54B
        A6A64CA6A54DA6A54DA6A74EA7A64EA7A64EA7A64EA8A74FA8A74FA8A74FA8A7
        50A9A851A9A851A8A851A9A852A9A952A9A952A9A953AAAA54AAA954AAA954AA
        A955AAAA55AAAA55ABAA56ABAB56ABAB57ABAB57ACAB58ACAB58ACAB58ACAC58
        ACAC59ADAC5AADAC5AAEAD5AADAD5BADAD5BADAD5BAEAD5BAEAD5CAFAD5DAFAE
        5DAFAE5EAFAF5EAFAF5EAFAE5EB0AF5FB0AF60B0AF60B0B060B0AF61B0AF62B0
        B061B1B061B1B062B2B162B1B163B2B164B2B164B2B264B2B264B3B265B3B266
        B3B266B3B266B3B367B3B367B4B367B4B368B5B468B5B468B4B469B5B46AB5B4
        6AB5B56AB6B46BB6B46BB6B56CB6B56CB6B66DB6B56DB6B66DB7B66EB7B66EB7
        B66FB7B76FB8B76FB8B76FB8B770B8B770B8B871B8B871B9B872B9B872B9B872
        BAB973BAB973BAB974BAB974BAB974BBB975BAB975BBBA76BBBA76BBBB76BBBB
        77BBBB77BCBB77BCBB78BCBB78BDBB79BDBC7ABDBC7ABDBC7ABDBC7ABEBC7BBE
        BD7BBEBD7CBEBD7CBEBD7DBFBE7DBFBE7EBFBE7EBFBE7FBFBE7EC0BF7FC0BF7F
        C0BF80C0BF80C0BF81C1C081C1C081C1C082C1C082C2C083C2C183C1C184C2C1
        84C2C185C2C184C2C285C3C286C3C286C3C286C4C286C4C387C4C387C4C388C4
        C388C4C489C5C489C5C489C5C48AC5C48AC6C48BC6C48BC5C58BC6C58CC7C58C
        C7C58DC6C58DC7C68EC7C58EC7C68FC8C68EC8C78FC7C790C8C790C8C791C9C8
        91C8C792C9C891C9C892C9C892C9C893CAC893CAC894CAC994CBC995CAC995CB
        C995CBCA96CBC996CBCB96CCCA97CCCB97CCCB98CCCB98CCCB98CCCB99CCCB99
        CDCC9ACECB9ACECD9BCDCC9BCDCC9CCECC9BCECD9CCECD9CCECD9DCFCE9DCFCE
        9ECFCE9ECFCE9ED0CE9FD0CFA0CFCFA0D0CFA0D0CFA1D1CFA1D1CFA2D0D0A2D1
        D0A2D1D0A2D2D0A3D2D1A4D2D1A4D2D1A4D3D1A5D2D1A5D2D2A5D3D2A6D3D2A6
        D4D2A7D4D2A7D4D3A7D4D3A8D4D3A8D4D3A9D5D3A9D5D3AAD5D4AAD5D4AAD5D4
        ABD5D4ABD5D5ABD6D5ACD6D5ACD7D5ADD6D5ADD6D6AED7D6AED7D6AED7D6AFD8
        D6AFD7D6B0D8D6B0D9D6B1D9D7B1D8D8B1D9D7B1D9D7B2D9D8B3DAD8B3D9D8B3
        DAD9B4DAD9B4DAD9B5DAD9B5DBD9B5DBDAB6DBDAB6DCDAB6DCDAB7DBDBB7DBDB
        B7DCDBB8DCDAB8DCDBB9DDDCBADDDCB9DDDCBADDDCBBDDDCBBDDDDBBDEDCBCDE
        DCBCDFDDBDDEDDBDDEDDBDDFDDBEDFDEBEDFDEBFDFDEBFDFDEC0E0DFC0E0DFC0
        E0DFC0E1DFC0E0DFC2E1DFC2E1E0C2E1DFC2E2E0C3E2E0C3E2E0C4E2E0C4E2E1
        C4E3E1C5E3E1C5E3E1C5E3E2C6E3E2C7E4E2C7E4E2C8E4E3C8E4E2C8E4E3C8E4
        E3C9E5E3C9E5E3CAE5E4CAE5E4CBE5E4CBE6E4CBE6E4CBE6E4CCE6E5CDE6E5CD
        E7E5CEE7E5CEE7E6CFE8E6CFE8E6CFE7E6CFE8E6D0E8E6D1E8E7D1E8E7D1E9E7
        D2E9E8D2E9E8D2E9E7D3EAE7D4EAE8D4EAE8D4EAE8D5EBE9D5EAE9D5EBE9D6EB
        E9D6EBE9D6EBEAD7ECEAD7ECEAD7ECEAD8ECEAD8EDEAD9EDEAD9ECEBDAEDECDA
        EEECDAEDEBDBEDEBDCEDEDDCEEEDDCEEECDCEFEDDDEEEDDDEEEDDEF0EDDEF0ED
        DEF0EEDEEFEEDFF0EEE0F0EEE0F0EEE0F1EFE1F0EFE1F0EFE1F1F0E2F1F0E3F2
        F0E3F2EFE3F2F0E4F2F0E5F2F0E5F3F1E5F3F1E5F3F1E6F3F1E6F3F1E7F4F1E7
        F4F2E7F4F2E7F4F2E8F4F3E9F5F3E9F5F3E9F5F3EAF5F3EAF5F3EAF5F4EBF6F4
        ECF6F4ECF6F4EDF6F5EDF6F5EDF6F5EEF6F5EEF7F5EEF7F6EFF8F5EFF8F6EFF8
        F6F0F9F6F1F8F7F1F8F7F1F9F7F2F9F7F2F9F7F2F9F7F3F9F8F3FAF8F4FAF8F4
        FBF8F5FAF8F5FBF9F5FBF9F5FBF9F6FBFAF7FBF9F7FBF9F7FBFAF8FCFAF8FDFA
        F8FCFBF8FCFBF9FCFBF9FDFBF9FDFBFAFDFBFBFDFBFBFEFBFCFEFCFCFEFCFCFF
        FCFDFFFDFDFEFDFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFE808000808000808000808000808000808000
        8080008081008080018081018180028181028181038282038281038282048282
        0582820482830582830583820683830683840684830784840784840784840885
        840984850984850A85850A85850A85850B85860B86850C85850C86860C86860D
        87860D87860D86870D87870E87870E87870E87870F8888108888108988118988
        118889118989128989128989138A89138989138A8A148A8A148A8A148B8A158A
        8A168B8B168B8B168C8B168B8B178C8B188C8C188C8C188C8C198C8D198C8D1A
        8C8D1A8D8D1A8E8D1B8D8E1B8E8E1C8E8E1B8E8E1C8F8E1C8E8E1D8F8E1E8F8E
        1E8F8F1F908F1F8F8F1F909020908F2090902090902091912191912291912291
        9122919123929223929124929224929225929225939325939226939326939326
        94932794942794932794942895942894942895942995942A95952A95952B9695
        2B96952B95952B96952C96962D97972D96962D97972E97972E97972F98972F97
        972F9897309897309898319898319898319998329998329999329A99339A9933
        9A99349A99349A9A359B9A359A9A369B9A369B9A369B9B379C9B379C9C379C9C
        379C9B399D9C399D9C3A9D9C399D9C3A9D9D3A9E9D3A9D9D3B9D9D3B9E9D3C9F
        9E3D9E9D3D9F9E3D9E9E3E9F9E3E9F9E3EA09E3EA09F3FA09F40A0A03FA0A040
        A0A040A1A041A1A042A1A042A1A142A1A143A2A143A1A244A2A244A2A245A2A1
        44A3A245A3A246A3A246A3A347A3A347A4A347A4A447A4A448A5A448A4A449A5
        A549A5A449A5A54AA6A54BA5A54BA5A54BA6A64BA6A54CA7A64DA7A64DA6A64D
        A7A64EA7A74EA7A74EA7A64FA7A74FA8A750A8A750A8A750A8A851A9A851A9A8
        52A9A852A9A952A9A953A9A954A9A954AAA954AAAA54ABAA55AAAA55AAAA56AB
        AA56ABAB57ABAB57ACAB57ACAB58ACAC58ACAC59ADAC59ADAC5AACAD59AEAC5A
        ADAD5BADAD5BAEAD5BAEAD5CAEAD5CAEAE5CAEAD5DAEAE5DAFAF5EAFAE5EB0AE
        5FB0AF5FB0AF5FB0AF5FB0AF60B0AF60B0B061B1B062B1B062B2B062B1B162B1
        B163B2B163B2B164B2B264B2B165B3B266B2B265B3B266B3B266B3B367B3B368
        B4B368B4B367B5B368B5B369B5B469B5B469B5B46AB5B46AB5B46BB6B56BB6B5
        6CB6B66CB7B56DB7B66DB7B66DB6B66EB7B66EB7B66FB7B66FB8B76FB8B770B8
        B770B8B770B9B870B9B771B8B772B9B872BAB872BAB873BAB873BAB973BAB974
        BBB974BBBA75BAB975BBBA76BCBA76BBBA77BCBA77BCBB77BCBB78BCBB78BCBB
        78BCBC79BDBC7ABDBC7ABDBC7ABDBC7BBDBD7BBEBD7CBEBD7CBEBD7DBEBE7DBF
        BD7DBFBD7DBFBD7DC0BF7FC0BE7EC0BF7FC0BF7FC0BF80C1BF80C0BF81C1C081
        C1C081C1C081C1C082C1C183C1C183C2C083C2C184C3C184C3C184C3C185C3C2
        86C3C186C4C386C3C287C4C387C3C387C4C388C4C388C5C489C4C389C5C389C5
        C48AC5C48BC5C48BC5C48BC6C58CC6C58CC6C58DC6C68DC7C68DC6C58EC7C68E
        C7C68EC7C78FC8C68FC7C690C8C790C8C791C9C891C9C891C9C892C9C892C9C8
        92C9C893CAC893CAC894CAC994CAC995CAC994CBC995CACA95CBCA96CBCA96CB
        CA97CCCA98CCCB97CCCB98CDCB98CDCB99CDCB99CDCB99CDCC9ACDCC9ACECC9A
        CECD9BCECD9CCECD9CCECD9DCECE9DCECE9ECFCE9DCFCE9FCFCE9FCFCE9FD0CE
        A0D0CFA0D0CFA0D0CFA1D1CFA1D1D0A2D1D0A2D2D0A2D1D0A3D2D0A3D2D1A4D2
        D0A4D2D0A5D3D1A4D2D1A5D2D2A6D3D1A6D3D2A7D4D2A7D3D3A7D3D3A8D4D3A8
        D4D3A9D5D3A8D5D3A9D5D4AAD5D4AAD6D3AAD5D4ABD6D4ABD6D5ABD6D5ACD6D4
        ADD7D5ADD6D5ADD6D5ADD7D6AED7D5AFD8D6AFD7D6AFD8D6AFD8D7B0D8D7B0D8
        D7B0D8D8B1D9D8B2D9D8B1D9D8B3D9D8B3D9D8B3DAD9B3DAD9B4DAD9B4DAD9B4
        DAD9B5DBDAB5DBD9B6DCDAB6DCDAB7DCDAB7DBDAB8DCDAB8DDDAB8DCDBB8DCDC
        B9DCDCBADDDCBADDDCBBDDDCBBDEDCBBDDDDBBDEDCBCDFDDBDDFDDBDDEDDBDDF
        DEBEDFDDBEDFDEBEE0DEBFE0DEBFE0DEC0E0DFC1E0DFC0E1DFC1E1DFC1E1E0C1
        E1E0C2E1E0C3E1E0C3E2E0C3E2E0C3E2E1C4E3E1C4E2E1C5E2E1C5E3E1C6E3E2
        C6E3E1C6E3E2C7E3E2C7E4E2C8E4E2C8E4E2C8E4E3C9E5E3CAE5E3CAE5E3CAE5
        E3CAE5E4CBE5E4CBE6E4CCE6E4CCE6E4CDE7E5CDE7E5CDE7E5CEE8E6CFE7E6CE
        E7E6CFE7E6CFE8E6D0E8E7D0E9E7D1E9E7D1E9E7D1E9E7D2EAE8D3EAE8D3E9E8
        D3EAE8D3EAE8D4EAE9D4EAE8D4EBE9D5EAE9D6EBEAD6EBEAD7ECEAD6ECEAD7EC
        EAD8ECEBD8ECEBD9EDEAD8EDEBD9EDEBD9EDECDAEDECDBEEECDBEEECDBEEECDC
        EEECDCEEEDDCEFEDDDEFEDDDEFEEDDEFEEDEEFEDDFEFEEDFEFEEE0EFEEDFF0EF
        E0F0EEE0F0EFE1F1EEE2F1EFE2F1EFE2F1F0E2F2F0E3F1F0E3F2F0E3F2F0E4F2
        F0E4F2F1E5F3F1E5F3F1E5F3F1E6F3F1E7F3F1E7F4F2E7F4F2E7F4F2E8F4F3E9
        F4F3E9F5F3EAF5F3E9F5F3EAF5F3EBF5F4EBF5F4ECF6F4EBF7F4EDF6F4ECF7F4
        EDF7F5EDF7F5EEF7F5EEF7F5EFF8F6EFF8F6EFF8F6EFF8F6F0F9F7F1F9F7F1F8
        F7F2F9F7F2F9F7F2F9F7F3F9F8F3F9F8F3FAF8F4FAF8F5FAF8F5FBF8F5FBF9F6
        FBF9F6FBFAF7FBF9F7FCF9F7FCFAF8FCFAF8FCFAF9FCFBF9FCFAFAFDFBFAFDFB
        FAFDFBFAFDFBFBFEFBFBFDFBFCFEFCFCFEFCFCFEFCFCFEFDFDFFFDFDFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFE808000808000808000808000808000808000808000808001808001808001
        8181028181028182038281038281038282048282048282048382058283068383
        0583830684830783830783830784840784840884840985850885840985840986
        850B86850B86860B85860B86860B86860C86870D87870D87860D86870D87870E
        87870E87870F88880F8888108888108988108889118989128988118A89128989
        138A89138A8A138A8A148A8A158A8B148B8A158B8B158B8B168B8B178B8B178C
        8B178C8B188C8C188D8C188D8C198C8D198D8D1A8D8D1A8D8D1A8E8D1B8D8E1B
        8E8E1C8E8E1C8E8E1C8E8E1D8E8E1D8F8F1D8F8F1D8F8F1E908F1F8F8F1F908F
        2090901F90902190902190912290912291902292912291912392912392912392
        9124929224929225929225939226939326939327949327939327949428949428
        94942995952994942A95952A95952A96952B95952B96952B96952C96952C9696
        2C97962D97962D97962E97962E97972E98982F98972F97973098973098983098
        98319999319999319998329A99339A99339999339A9A339A9A349A9A349B9A35
        9B9A359B9A369B9B369B9B369B9B379B9B389C9B389C9C389D9C389D9C399D9D
        3A9D9C3A9D9D3A9E9D3A9D9D3B9E9D3C9E9D3C9E9D3C9E9E3D9F9E3D9F9E3D9F
        9F3E9F9F3E9F9F3F9F9F3FA09F40A09F40A0A041A1A041A1A041A1A042A1A042
        A1A142A1A142A2A144A2A143A2A144A2A244A3A245A2A245A3A246A3A245A3A3
        46A4A346A4A347A4A348A4A448A4A348A5A449A4A44AA5A44AA5A54AA5A44AA5
        A54BA5A54BA5A54CA6A64CA7A54CA6A54CA6A64DA7A64EA7A64EA7A64EA7A74F
        A7A74FA8A750A8A850A8A851A8A850A9A851A8A851A9A952AAA852AAA953AAA9
        54AAA954AAA954ABA955ABA955ABA955ABAA56ABAB56ABAB57ABAA57ABAB58AB
        AC58ACAB59ACAC59ACAC59ADAC59ADAC5AADAC5AADAC5BAEAC5BADAD5BADAE5C
        AEAD5CAFAD5CAEAE5DAFAE5EAFAE5DAFAE5EB0AE5EAFAF5FB0AE60B0B060B0B0
        61B0B061B1B061B1B062B1B062B2B062B1B063B1B164B1B163B2B164B2B164B3
        B265B3B165B3B266B3B266B3B366B3B267B4B267B3B267B4B368B4B369B4B469
        B5B46AB5B469B5B56AB6B56AB5B56AB6B56BB6B56BB6B56CB6B56DB6B66CB7B6
        6DB7B66EB7B66EB7B76FB7B66FB8B66FB8B770B8B770B8B770B8B871B8B871B9
        B871B9B872B9B872BAB973B9B973BAB974BAB974BAB974BAB975BBB976BABA76
        BBBA76BBBA77BBBA77BCBA77BCBB78BCBB78BCBB79BDBC79BCBC79BDBC79BDBC
        7ABEBC7BBDBD7BBEBD7CBEBD7CBEBE7CBEBD7DBFBE7DBFBD7EBFBE7DBFBE7EBF
        BE7FBFBF7FC0BF80C0BF80C0BF80C0BF81C1BF81C1C081C1C081C1C083C2C082
        C1C083C2C084C2C184C2C184C3C184C3C285C3C186C3C286C3C286C3C386C4C2
        87C3C387C4C387C4C388C4C388C5C48AC4C489C5C48AC5C48BC6C58BC6C48BC5
        C58BC6C58CC6C58CC7C58DC6C58EC7C68EC7C58EC7C68EC7C68EC7C78FC7C78F
        C8C690C9C790C9C890C9C891C9C891C9C892C9C892C9C893CAC893CAC994CAC9
        94CAC994CBC995CBC995CBCA96CBCA96CBCA97CBCA97CCCB97CCCB98CCCB99CC
        CB99CCCB99CDCC99CCCC9ACDCC9ACDCC9BCECD9BCDCC9BCECC9BCECD9CCECD9D
        CECD9DCFCD9DCFCD9ED0CE9ECFCE9FD0CF9FCFCF9FD0CE9FD0CFA0D0CFA1D0CF
        A1D0CFA1D1CFA2D1D0A3D1D0A2D1D0A3D2D0A3D2D1A4D2D0A4D2D1A4D3D1A5D3
        D1A6D3D1A6D3D2A6D3D2A7D4D2A7D4D2A7D4D2A8D4D3A9D5D3A9D5D3A9D5D3AA
        D5D4AAD5D4ABD5D4ABD5D4ABD5D5ABD6D5ACD6D5ACD7D5ADD6D5AED7D5ADD7D5
        AED7D6AED7D6AFD7D6AFD8D6AFD8D6B0D9D7B0D8D7B0D9D7B1D9D7B1D9D7B2DA
        D7B2D9D8B3DAD8B3D9D9B4DAD9B4DBD9B5DBD9B5DAD9B5DAD9B6DBD9B6DBDAB7
        DCDAB7DCDAB8DCDAB8DCDAB8DCDBB8DCDBB9DCDBBADDDBBADDDBBADDDBBBDDDC
        BBDDDCBBDEDCBCDEDCBCDEDDBCDEDDBDDEDDBDDEDDBEDFDEBFDFDEBEE0DEBEE0
        DFBFE0DEC0E0DFC0E0DFC0E1DFC1E1E0C1E1E0C1E1DFC2E1E0C3E2E0C3E2E0C3
        E2E0C4E2E1C4E3E1C4E2E1C5E2E1C5E3E1C6E3E1C6E4E2C6E4E2C7E3E2C8E4E2
        C8E4E2C8E4E3C9E5E3C9E5E3C9E5E3CAE5E4CAE5E4CBE5E4CBE5E4CCE6E5CCE6
        E4CCE7E4CDE6E5CDE7E5CDE7E6CEE7E5CEE7E5CFE8E6CFE8E6D0E8E6D0E8E6D0
        E8E6D1E9E7D1E8E7D1E9E7D2E9E8D3E9E7D3EAE8D3EAE8D3EAE8D4EAE8D4EAE8
        D5EAE9D5EBEAD6EBE9D6EBE9D6ECEAD7EBEAD7ECEAD8ECEAD8ECEAD8ECEBD9EC
        EBD9EDEBD9EDEBDAEDEBDBEEECDAEDECDBEDECDBEEECDCEEECDDEEECDDEFEDDE
        EFEDDEEFEDDEF0EDDFF0EDDEF0EEDFF0EEE0F0EEE0F0EFE1F0EFE0F0EFE1F1EF
        E1F1EFE2F1EFE3F1EFE3F2F0E4F1F0E4F2F0E4F2F0E5F3F1E5F2F1E5F3F1E6F3
        F2E6F4F1E7F3F2E7F4F2E7F4F2E8F4F3E8F4F3E9F5F3E9F4F3E9F5F3E9F5F4EA
        F5F3EAF5F3EBF5F4EBF6F4ECF6F4ECF6F4ECF6F4EDF7F5EDF7F5EEF7F6EFF7F5
        EFF7F6EFF8F6EFF8F6F0F8F6F0F9F6F1F8F7F1F9F7F1F9F7F2F9F7F2F9F7F3F9
        F8F3FAF8F4FAF8F4FAF9F4FAF9F5FBF8F5FAF9F5FBF9F6FBFAF7FCF9F7FBFAF7
        FCFAF8FCFAF8FCFAF8FCFBF9FDFAF9FDFBFAFDFBF9FDFBFBFEFCFAFEFCFBFEFC
        FBFEFCFCFEFCFDFFFCFDFFFCFDFEFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE80800080800080800080
        8000808000808000808000818001808101808101818102818102818102828102
        8282038282048282048282048382058382068383058383068383078384078384
        0884830784840884840985840985850A85850985850A86850B86860B86860B86
        850C87860C87860D87870D87860D87860E87870E87870F88870F87870F888710
        8888118888118989118888118889118A89128989138A89138A8A148A89148A8A
        158A8A158B8A168B8B158B8B168C8B168C8B178C8C178C8C178C8B188C8C188D
        8C188D8C198D8C198D8C1A8E8D1A8D8D1B8E8E1B8E8E1B8E8E1C8E8E1C8F8F1D
        8F8E1D8F8F1D8F8F1E8F8F1E8F8F1F90901F908F1F908F209090209190219190
        2191902191912291912291912292922392922392922492922493922593932593
        922593932693932793932794932894942894942894942894942995942994942A
        95952A95952B95952B95962C96962C96962C97962D97962D97962D97972D9797
        2E97972F98972F98972F98983099973098983099983199993199993199983299
        9833999933999A339A9A349A99349B9A349A9A359B9A359B9A369B9B369C9B37
        9C9B379C9C379C9C389C9C389C9C389D9C399D9C399D9D3A9D9D3A9D9D3B9D9D
        3B9E9D3B9E9E3C9E9E3C9E9E3D9F9E3D9F9F3D9F9E3EA09F3E9F9F3FA09F3FA0
        A03FA09F3FA0A040A0A041A1A041A1A041A1A142A1A143A2A143A2A143A2A144
        A2A144A3A245A2A245A3A246A3A345A3A346A3A247A3A347A4A347A4A448A4A3
        48A5A348A5A449A4A449A5A44AA5A44AA5A44BA6A44BA5A54BA5A64CA6A54DA7
        A54DA6A64DA7A64DA7A64DA7A74EA8A74EA8A64FA8A74FA8A750A8A750A8A751
        A8A851A8A852A9A851A9A852A9A952A9A953AAA953AAA954AAAA54AAAA55ABAA
        55AAAA55ABAA56ABAA56ABAA57ABAB57ACAB57ACAB58ACAB58ADAC58ADAC59AD
        AC59ACAD5AADAC5BADAD5AAEAD5CAEAD5CAEAD5CAEAD5CAEAE5DAEAE5DAFAE5E
        AFAE5EAFAF5EAFAF5FAFAE5FAFAF5FB0AF60B0AF60B1B060B1B062B1B062B0B0
        62B2B063B2B163B2B163B2B163B2B163B2B164B3B264B3B165B2B265B3B266B3
        B266B3B367B3B367B4B367B4B368B4B369B5B369B4B469B5B469B5B46AB5B46A
        B5B56AB5B46BB6B56CB6B56CB6B56DB7B56DB7B56DB7B66EB7B66EB7B76FB7B7
        6EB8B770B7B770B8B770B8B870B9B870B8B772B9B872B9B872BAB873B9B873B9
        B973BAB974BAB974BABA74BABA75BAB975BBBA76BBBA76BBBA77BBBA77BCBA78
        BBBB78BCBB79BDBB79BDBB79BCBC7ABDBC79BDBC7BBDBD7ABEBC7BBDBC7CBDBD
        7CBEBD7CBEBE7DBEBD7DBFBE7EBEBE7EBFBE7EBFBE7EBFBE7FC0BF80C0BF80C0
        BF81C0BF81C1C081C1C082C1C082C1C082C1C083C1C083C1C083C2C084C3C184
        C2C285C2C185C3C186C3C286C3C286C3C287C3C287C4C388C4C388C4C388C4C4
        88C5C489C5C38AC5C48AC5C48AC5C48BC5C58BC6C48BC6C58CC6C58DC7C58DC7
        C68DC7C68EC7C68EC7C68EC7C68FC8C68FC7C790C8C690C8C790C8C791C9C891
        C9C891C9C892C9C893CAC893CAC993CAC993CAC994CAC995CAC995CBC995CBCA
        96CBCA96CCCA96CBCA97CCCA97CCCB98CCCB98CCCB98CDCC99CDCC99CDCB9ACD
        CB9ACDCC9BCECD9BCDCC9BCDCD9BCFCD9CCECD9CCFCD9DCECD9DCFCE9ECFCD9E
        CFCE9FCFCE9FD0CF9FD0CFA0D0CFA0D0CFA0D0CFA1D1CFA2D1D0A2D1D0A2D1D0
        A3D1D1A3D1D0A3D2D1A4D2D1A5D2D1A4D2D1A5D3D1A6D3D2A6D3D2A6D3D2A7D4
        D2A7D3D3A7D3D2A8D4D3A9D5D3A9D4D3A9D5D4A9D5D4AAD5D4AAD5D4AAD5D4AB
        D6D4ACD6D5ACD7D5ACD6D5ADD6D5ADD7D6AED6D6AED7D6AED7D6AFD7D6AFD8D6
        B0D8D7AFD8D6B1D8D7B0D9D7B1D8D8B1D9D8B2D9D7B3D9D8B3D9D8B3D9D9B3DA
        D8B4DAD9B5DAD9B4DBD9B5DBDAB6DBDAB6DCD9B6DBDAB7DBDBB7DCDAB8DCDAB8
        DCDAB8DDDBB8DDDBB9DDDCB9DDDBBADDDCBBDEDCBBDEDCBCDEDCBBDEDCBCDFDD
        BDDFDDBDDEDDBDDEDDBDDFDDBEDFDEBFDFDEBFE0DEC0E0DEC0E0DEC0E0DFC1E0
        DFC1E0DFC1E0E0C2E1E0C2E1DFC2E1E0C3E2E0C3E2E0C4E2E1C4E3E1C4E2E1C5
        E3E1C5E3E1C6E3E2C6E4E2C6E3E1C7E4E2C8E3E3C8E4E2C8E5E3C9E4E3C9E5E4
        CAE5E3CAE5E3CAE5E4CAE5E4CBE6E4CBE6E4CCE6E4CDE6E5CDE6E5CDE6E6CDE7
        E6CEE7E6CEE7E6CFE7E6D0E8E6CFE8E7CFE8E7D0E9E7D1E9E7D1E8E7D2E9E7D2
        E9E8D2EAE7D3EAE8D3EAE8D3EAE8D4EAE8D5EAE9D4EBE9D6EBE9D5EBE9D6EBEA
        D7ECEAD7ECEAD7ECEAD7ECEAD8EDEBD8ECEBD9ECEBD9ECECDAEDEBDAEDEBDBED
        ECDBEDEBDBEEECDCEEECDCEEEDDCEFECDDEEEDDDEFEDDEEFEEDEF0EDDEEFEEDF
        EFEEDFF0EEDFF0EEE0F0EEE1F0EFE1F1EFE1F1EFE1F1EFE3F1EFE3F1F0E3F2F0
        E3F1F0E3F2F0E4F2F0E4F3F1E5F3F1E5F3F1E6F3F1E6F4F2E6F4F1E7F3F2E8F4
        F2E8F4F2E8F4F2E9F5F3E9F5F3EAF5F3EAF5F3EAF5F4EAF5F4EBF5F4EBF6F4EC
        F6F4ECF7F5ECF7F5EDF7F5EDF7F5EDF7F5EEF8F6EFF7F6EFF8F5F0F8F6F0F8F6
        F0F9F6F1F9F6F2F8F6F2F9F7F2F9F8F2F9F8F3FAF8F3F9F7F3FAF8F4FAF8F5FA
        F9F5FBF9F5FBF9F6FBF9F6FBF9F6FBF9F7FCF9F7FCFAF7FCFAF8FDFBF8FDFAF9
        FDFBF9FCFAF9FDFBFAFDFBFBFEFBFBFDFCFBFEFCFCFEFCFCFEFDFCFEFCFDFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFE80800080800080800080800080800080800080800080
        8000808001818001818102818102818102828103828203828204828204838205
        8282058383058383068383068383078383068484078484078484088484098585
        0985850985850A85850A85850B85860B85860B85860C86860C86860C87860D87
        860D87870E87870E88870E87880F87880F888710888710888810888811898911
        8989128A89128989138A8A138A89138A89148A8A148B8B158A8A158A8B158B8B
        168B8B168B8B168C8B178C8B188B8B188C8C188C8C188D8C198D8D1A8D8D1A8D
        8D1B8E8D1A8E8D1B8E8D1B8E8D1C8F8E1C8E8E1D8F8F1D8E8E1D8F8F1E8F8F1E
        8F901F908F1F908F1F908F209090219091219190219190219191229191229191
        2391922392912492922493922493922593922693932593932693922793932693
        942794932894942894942994952895942995942A95952A95952A95952B96952B
        95952B96962C96962C96962D96962E97962D97962E97962F98972F97972F9898
        309898309898309998319899319899329999329A99339A99339999339A9A349A
        9A349B99349A9A359B9B369B9B369B9B369B9B369B9B379C9B379C9C389C9B39
        9D9C399D9C399D9C399D9C3A9D9C3B9D9D3A9D9D3B9E9E3C9E9D3C9E9E3C9F9E
        3D9E9E3D9E9F3D9F9F3E9F9F3E9F9F3FA09F3F9F9F40A09F40A09F41A09F41A0
        A041A1A041A1A142A1A143A2A143A1A143A2A144A2A244A2A245A3A244A2A245
        A3A346A3A346A3A246A3A247A3A347A4A348A4A348A5A449A4A348A5A449A5A4
        4AA5A54AA5A54AA5A54BA5A54BA6A54CA6A64CA6A64DA7A64CA6A64DA7A64EA7
        A74EA7A64EA7A64FA7A750A8A750A8A750A8A851A8A851A8A851A9A852A9A852
        A9A852A9A952AAA953AAAA54AAA954ABA954ABAA55AAAA55ABAA56ABAA56ACAA
        56ACAB57ABAB57ACAB58ACAB58ADAC59ACAC58ACAC5AADAD5AADAC5AADAC5BAD
        AD5BADAD5CAEAD5CAEAD5CAEAD5DAFAE5DAFAE5EAFAE5EAFAF5FAFAF5FB0AE5F
        B0AF5FB0B060B0AF60B0B061B0B061B0B061B1B062B1B063B2B162B2B163B2B1
        64B2B264B2B164B2B264B3B165B3B266B3B266B3B266B4B367B4B367B4B367B4
        B367B4B469B4B368B4B369B5B46AB5B46AB5B56AB5B46BB6B56BB6B56CB6B66C
        B6B56CB6B66DB7B66DB6B66EB7B66EB7B76EB8B66FB8B76FB8B770B8B770B9B8
        71B9B771B9B871B9B872B9B872BAB972B9B973BAB873BAB973BAB974BAB974BB
        BA75BBB975BBBA76BCBA76BBBA77BCBA77BCBB77BCBB78BCBB78BCBB79BDBC79
        BCBC7ABDBC7ABDBC7ABDBD7ABDBD7BBEBD7CBEBD7CBEBD7CBFBD7CBEBD7DBFBE
        7EBFBE7EBFBE7FBFBE7FC0BE7FC0BF80C0BF80C0C080C0BF80C1BF81C0BF81C1
        C082C1C182C2C082C2C084C2C183C2C184C2C184C3C285C2C185C2C185C3C285
        C3C286C4C286C3C287C4C387C4C288C4C488C4C389C4C489C5C38AC5C48AC5C4
        8AC6C58BC5C48BC6C48BC6C58CC6C58CC7C58DC6C68DC7C58DC7C68EC8C78FC8
        C68FC7C78FC8C78FC8C790C8C791C8C891C9C791C9C791C9C892CAC892C9C893
        C9C893CAC993CAC894CAC995CAC995CBCA95CBC996CBCA96CBCA96CBCA97CCCB
        97CBCA97CCCB98CCCB98CDCB99CDCC9ACCCB9ACDCC9ACDCC9ACDCD9BCECC9BCE
        CC9CCECD9CCFCD9DCFCD9DCFCE9ECECE9ECFCE9ED0CE9ECFCE9FCFCE9FD0CEA0
        D0CFA0D1CFA1D0CFA1D1CFA1D1D0A2D2D0A2D1D0A2D2D0A3D1D1A4D2D0A4D2D1
        A4D2D1A5D3D1A5D3D1A5D2D2A5D3D2A6D3D2A7D4D3A7D3D2A8D4D3A8D4D2A8D5
        D3A8D5D3A9D5D4A9D5D4AAD5D4AAD6D4ABD6D4ABD5D4ABD6D5ACD6D5ADD6D5AD
        D7D5ADD6D6ADD7D6AED7D6AED8D6AFD7D6AFD8D6AFD8D7AFD8D7B0D8D7B0D9D7
        B2D9D7B2D9D8B2D9D8B3D9D7B2DAD8B3DAD8B4DAD8B4DAD9B4DAD9B4DAD9B5DB
        D9B5DBDAB6DBDAB6DCDAB7DBDBB7DCDAB8DCDBB8DCDBB8DDDBB9DCDBB9DCDBB9
        DDDCBADEDCBBDDDCBBDEDCBBDEDCBCDEDDBCDEDDBDDEDDBDDFDDBDDFDDBEDFDD
        BEDFDEBFDFDEBFE0DEC0E0DEBFE0DFC0E0DFC0E1DFC1E1DFC2E1E0C2E1E0C2E1
        DFC2E1E0C3E2E0C3E2E0C3E2E0C4E2E0C4E2E0C5E2E1C6E3E2C6E3E1C7E3E2C6
        E4E2C7E4E2C8E4E2C8E4E3C8E4E3C8E5E3C9E4E3CAE5E3CAE5E3CAE6E3CBE6E4
        CBE6E4CCE6E5CCE6E5CDE6E5CCE7E4CDE6E5CEE7E6CEE7E5CFE8E6CFE7E6CFE7
        E6D0E8E6D0E8E7D0E8E6D1E8E7D1E9E7D1E9E7D2E9E7D2EAE8D3EAE8D3EAE8D3
        EAE8D4EAE9D4EBE8D5EAE9D5EBEAD6EAE9D6EBE9D6ECE9D7ECE9D7EBEAD8ECEB
        D8ECEAD8ECEBD9EDEBD9EDECDAEDEBDAEDEBDAEEECDBEEECDCEEECDCEEECDCEE
        ECDDEFEDDDEEEDDDEFEDDEEFEDDEEFEDDFEFEDDFEFEEDFF0EEE0F0EEE0F0EEE0
        F0EFE1F0EFE1F1EFE2F1F0E2F1EFE3F1F0E3F1F0E3F1F0E4F2F0E4F2F0E5F3F0
        E5F3F0E6F3F1E6F3F2E6F3F1E7F4F2E7F4F2E8F4F2E7F4F2E8F5F3E8F5F3E9F4
        F3E9F5F3E9F5F4EBF5F4EBF5F3EBF6F4EBF6F4ECF6F4ECF6F5EDF6F5EDF7F5ED
        F7F5EEF7F5EEF8F6EFF7F5EFF8F5EFF8F6EFF8F6F1F8F6F0F9F7F1F9F7F2F9F7
        F2F9F8F2FAF8F2FAF8F4FAF8F4FAF8F3FAF8F5FBF9F5FAF8F5FBF9F5FBF9F6FB
        FAF6FCF9F7FBFAF7FCFAF8FCFAF8FCFAF8FCFAF9FDFBF9FDFBFAFDFBFAFDFCFA
        FDFCFAFEFBFBFEFBFBFEFCFCFFFCFDFEFDFDFEFCFDFFFDFDFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080
        0080800080800080800080800080800080800080810080810181810181810181
        8102818103818203818204828204828204828205838305828205838306838306
        84830783840683840783830884840884840885840984840985850A85850A8585
        0B86860B85860B85850B86860C87860C87860D87870E87870E87870E87870E87
        880F88881088880F8888118889108988118988118989128989128A89138A8913
        8A8A138A8A148A8A158B8A158A8B158B8A158B8B168B8B168B8B168B8C178C8C
        178C8C188C8C188C8C198D8C198D8D1A8D8D1A8D8C1A8D8D1B8D8D1B8D8D1C8E
        8D1C8E8E1C8E8E1C8F8E1D8E8E1D8F8E1E8F8F1F8F8F1F908F1F8F9020909020
        9190209190219090219191229191229191229191239191249292249292249292
        2492922593922593922593932693932693932793932894932794942894932995
        942894942995952A95952A95952B96952B96952C95952B97962C96962C96962D
        97962D97962D97972E97972F97972F9897309897309898309898319899319999
        329999329999339A99339A9933999A339A9A349A99349B9A359B9A359A9A359B
        9A359B9B369C9B379B9B379C9B379B9B389C9B399C9C389C9D399D9D399D9C3A
        9D9D3A9D9D3A9E9D3B9D9E3B9E9D3C9E9E3C9E9E3D9F9E3D9F9F3E9F9E3E9F9F
        3E9F9F3FA09F3FA09F3FA09F40A0A041A0A040A1A041A1A041A1A142A1A143A1
        A142A2A144A1A244A2A144A2A144A2A245A2A245A3A346A3A246A3A346A4A346
        A4A347A4A347A4A348A4A448A5A448A4A44AA5A44AA5A54AA5A44BA5A54AA5A5
        4BA6A54CA6A64CA7A54CA6A54DA7A64EA6A64EA7A74EA7A74FA8A74FA7A74FA8
        A750A8A850A9A850A9A851A8A851A9A852A9A952A9A852AAA953AAA953AAA954
        AAA954ABA954AAAA55ABAA56ABAA56ABAA56ABAA56ACAB57ACAB58ACAB58ACAB
        58ACAC59ADAC59ADAC59ADAC5AADAD5AAEAC5BADAC5BADAD5BAEAD5CAEAD5DAE
        AD5CAEAE5DAFAE5DAFAE5EAFAF5EAFAF5FB0AF5FB0AF5FB0B060B0AF60B0B061
        B1B061B1B062B1B062B1B062B1B163B2B163B2B163B2B164B2B264B3B265B3B2
        65B3B266B3B366B4B266B3B267B3B367B4B368B4B368B4B469B5B468B4B469B5
        B46AB5B46AB5B46BB6B56BB6B56BB6B56CB6B56CB6B56CB6B56DB6B66DB7B66D
        B7B66EB7B66FB7B76FB7B76FB8B76FB8B770B8B770B8B871B9B872B9B872B9B8
        72BAB973B9B873BAB973BAB974BAB974BAB974BABA75BABA76BBBA76BBBA77BB
        BA76BBBA76BBBB77BCBB77BCBB78BDBB78BCBC79BDBC79BDBC7ABDBC7ABDBC7B
        BDBD7BBDBD7BBEBC7CBEBE7CBEBD7DBFBD7DBFBD7DBFBE7EBFBE7EBFBE7EC0BE
        7FC0BF7FBFBF80C0BF80C0BF80C0BF81C1C082C1C082C1C083C1C083C1C183C1
        C183C2C184C2C184C2C185C2C185C3C285C3C286C3C287C3C387C4C387C4C387
        C4C388C4C388C4C489C5C389C5C48AC5C48AC5C48AC6C58BC6C48BC6C58CC6C4
        8CC6C58CC6C58DC7C68DC7C58EC7C68EC7C68EC8C68FC8C78FC8C68FC8C690C8
        C790C8C791C8C791C8C891C9C892C9C893CAC893C9C994CAC993CAC994CBC994
        CBC995CBC996CBC995CBCA96CBCA97CBCA97CCCB97CCCB97CCCB98CDCB99CCCC
        99CDCC99CDCC9ACDCC9ACECC9BCECC9BCECC9BCECD9BCECD9CCECD9DCFCE9DCF
        CE9ECFCD9ECFCE9ECFCE9ED0CE9FCFCF9FD0CEA0D0CFA0D0CFA1D0D0A1D0CFA1
        D1CFA2D1CFA2D1D0A3D2D0A3D2D0A4D1D1A4D3D1A4D2D1A4D3D1A5D3D1A6D3D1
        A6D3D1A6D4D2A6D3D2A7D4D2A8D4D2A8D4D3A8D4D3A8D5D4A9D5D3A9D5D4AAD5
        D3ABD6D4AAD5D5ABD5D5ABD6D5ACD6D5ADD7D5ADD7D6ADD6D5AED7D6AED8D6AE
        D8D6AFD8D6AFD8D6AFD8D7B0D8D7B1D8D7B1D9D7B1D9D8B2D9D8B2D9D8B3D9D8
        B3DAD8B3DAD8B3DAD9B4DAD9B5DBD9B4DBD9B6DAD9B5DBDAB6DCDAB7DBDAB6DC
        DAB8DCDAB7DCDBB8DCDBB8DCDBB9DDDBBADDDBBADDDBBADEDCBBDDDCBBDEDCBB
        DDDCBCDEDCBCDEDDBCDFDDBDDEDDBDDFDDBEE0DEBEDFDDBEE0DEBFDFDFC0E0DE
        C0E0DEC0E0DFC0E0DFC1E1DFC1E0DFC2E1DFC3E1E0C2E1E0C3E2E0C3E2E0C4E2
        E1C4E2E0C5E2E1C5E3E1C5E3E2C5E3E2C7E3E1C7E4E2C7E3E2C7E4E2C8E5E2C8
        E4E2C9E5E3C9E5E3CAE5E4CAE6E4CAE5E4CAE6E4CBE6E5CBE5E4CBE6E5CDE6E5
        CDE6E5CDE7E5CEE7E5CEE7E5CEE7E5CEE7E6CFE8E6D0E8E6D0E8E6D0E8E7D1E9
        E7D1E9E7D2E9E7D2E9E7D2EAE8D3E9E8D3EAE8D4EAE8D4EAE9D4EAE9D4EBE9D6
        EBEAD5EBE9D6EBE9D6EBEAD6ECE9D7EBEAD7ECEBD8EDEBD9ECEBD9ECEBD9ECEB
        D9EDECDAEDEBDAEDEBDBEDECDBEEECDCEEECDCEFEDDDEFECDDEFEDDDEFEDDEEF
        EEDEF0EEDFEFEDDFEFEEE0F0EEDFF0EFE0F0EFE1F1EFE1F1EFE2F1EFE2F1F0E2
        F1EFE3F1F0E3F2EFE3F2F0E4F3F0E4F2F1E4F3F1E5F3F1E5F3F1E5F3F2E6F3F1
        E6F4F1E7F3F2E7F4F2E7F4F3E8F4F2E8F5F3E9F5F3E9F5F3E9F5F4EAF5F3EBF6
        F4EBF6F4ECF6F4EBF6F4ECF6F5EDF6F5EDF7F5EDF7F5EDF7F6EEF8F6EEF7F6EF
        F7F6F0F7F6EFF8F6F0F8F7F0F9F6F1F9F7F1F8F7F2F9F8F3F9F7F3F9F8F3FAF8
        F3FAF8F4FAF8F5FAF9F4FBF9F5FBF9F6FBF9F6FBF9F7FBFAF6FBFAF7FCFAF7FC
        FAF8FCFAF9FCFBF8FDFBF9FDFBF9FDFBFAFDFCFBFDFCFBFDFBFBFEFCFBFEFCFC
        FFFDFCFEFCFDFEFCFDFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE8080008080008080008080008080
        0080800080800080800081800181810280810181810281820381820281820382
        8204828104828205838205828205838305838306838306848307848307838308
        84840885850985840985840985850A85850A85850A85850B86850C86860C8686
        0C86860D87870D87870D87870D88870E87870E88880F88881088881088881188
        89118888118989118989128989128989128989138989138A8A148A89148A8A15
        8B8A158B8A158B8B168B8B168B8C178C8B178C8C188C8C188C8C188C8C188D8D
        198D8C1A8D8D1A8D8D1A8D8D1B8E8D1B8E8E1B8E8E1C8E8E1C8E8E1D8F8E1D8F
        8E1D8F8F1E8F8F1F908F1E8F901F908F20909020909020909021919021919022
        9190229191239192239291239292249292249392259392259292259392259393
        2694932694932794932794942894942895942894942994952995942995942A95
        942A96952B96952B95952B96962D96952D97962D96962D97972D98972E97972F
        97972F9897309798309897309898319998319898319998329999329A98339A9A
        33999A349A99339A9A349A9A359A9A359B9B359B9B369C9B369B9A379C9B379C
        9C389B9C389C9C389C9C389D9C399D9C3A9C9C3A9D9D3A9D9D3B9D9D3B9E9E3B
        9E9D3C9E9E3D9E9E3D9F9E3D9E9E3D9F9E3EA09E3E9F9F3F9F9F3FA09F3FA09F
        40A19F40A0A041A1A041A1A142A1A042A1A142A2A143A2A143A2A143A2A244A2
        A244A3A144A3A245A3A246A3A346A3A346A4A347A4A348A4A348A4A448A4A348
        A4A348A5A449A5A449A5A44AA5A54AA6A54AA6A54BA6A64CA6A64CA6A64DA6A6
        4DA7A64EA6A64EA7A74EA7A74EA7A74FA8A74FA8A84FA8A750A8A750A9A751A9
        A851A9A851A9A952A9A852AAA953AAA954AAA954AAAA54AAAA55AAA955ABAA55
        AAAB56ABAB56ABAA57ABAB56ACAB58ACAB57ACAC59ADAB59ACAB59ACAC59ADAC
        5AADAD5BADAC5BADAD5BADAD5CAEAD5CAEAD5CAEAE5DAFAE5DAFAE5EAFAE5EAF
        AE5EB0AF5EAFAE5FB0AF60B0AF60B0AF61B0B061B0B061B0B061B0B062B1B062
        B2B163B1B163B1B163B2B164B3B165B2B265B3B265B2B266B3B266B3B267B3B2
        67B3B368B3B368B4B368B4B369B4B469B4B469B5B46AB5B46AB5B46BB5B46BB5
        B56BB5B46CB6B56CB6B66CB7B66DB7B66EB7B66DB7B66EB8B66FB7B76FB8B76F
        B8B670B8B770B8B770B8B871B8B872B9B871B9B872BAB873B9B873BAB873BAB9
        74BAB974BABA74BABA75BBBA75BBBA76BBBA77BCBB76BCBA77BCBA78BCBB77BC
        BB78BCBB79BDBC79BDBB79BDBB7ABDBC7ABEBC7BBEBD7BBDBC7BBEBD7CBEBD7C
        BEBD7DBEBD7DBFBE7EBFBE7EBFBE7EBFBE7EBFBE7FC0BF7FC0BF7FC0BF80C0C0
        81C0BF81C0BF81C1C081C1C083C1C082C1C183C2C083C1C183C3C284C3C185C2
        C285C3C286C3C286C3C287C3C287C3C387C4C387C4C387C4C388C5C388C4C489
        C5C48AC5C48AC5C48AC5C48BC6C58BC6C58BC6C58CC6C58CC7C58DC6C68DC6C6
        8DC7C68DC7C68FC7C78EC8C68FC7C690C8C790C8C790C9C791C9C791C9C891C9
        C892CAC892C9C893CAC893C9C994CAC994CBC995CBC995CAC995CBCA96CBCA96
        CBCA96CBCB97CCCA97CCCA97CCCB98CCCB98CCCB99CDCC99CDCC99CDCC9ACDCC
        9BCECC9BCDCC9CCECD9BCECC9CCECD9CCECD9DCFCD9DCFCE9ECFCD9ED0CE9FD0
        CE9FD0CF9FD0CEA0D1CFA0D1CFA0D1CFA1D0CFA2D1D0A2D1D0A2D2D0A3D2D1A3
        D1D1A3D2D0A4D3D1A5D2D2A5D2D1A5D3D2A6D3D1A5D3D2A6D3D2A7D3D3A7D4D2
        A8D3D3A8D4D2A8D5D3A9D5D4AAD4D4AAD5D4AAD5D4AAD5D4ABD6D4ABD6D5ABD6
        D4ACD6D4ACD6D5ACD6D6ADD6D6AED7D5AED7D6AED8D6AFD7D6AFD8D6AFD8D6B0
        D8D7B0D8D7B1D9D7B1D8D8B1D9D8B2D9D8B2D9D8B3DAD9B3D9D8B4DAD8B4DAD9
        B4DAD9B5DBD9B5DAD9B5DBDAB6DBDAB6DBDAB7DCDAB7DBDBB8DCDAB8DCDAB9DC
        DBB9DCDBB9DDDCBADDDBBADDDBBBDEDCBADDDCBBDEDCBCDEDCBCDEDDBCDEDDBD
        DEDDBDDEDDBEDFDDBEDFDEBEDFDEBFE0DEBFE0DEC0E0DFC0E0DFC0E1DFC1E1DF
        C2E0DFC2E1E0C3E1DFC2E1E0C3E2E0C4E1E1C4E2E0C4E2E1C4E2E1C5E3E1C5E3
        E2C5E3E1C6E3E2C6E3E2C7E4E2C7E4E2C8E4E3C8E4E3C8E5E3CAE5E3CAE5E3CA
        E5E4CBE6E4CAE5E4CBE5E4CCE6E4CCE6E4CCE7E5CCE6E5CDE6E5CEE7E5CEE8E5
        CEE7E5CFE8E6CFE7E6CFE8E6CFE8E7D1E8E7D0E9E6D1E9E7D2E8E7D2E9E8D3E9
        E7D3EAE7D4EAE8D3EAE9D4EAE9D4EAE9D5EBE9D5EBE9D5EBE9D6EBEAD6EBE9D7
        EBEAD7ECEBD8ECEAD8ECEAD8ECEBD9EDEBD9EDEBD9EDECDAEEEBDAEDECDBEEEC
        DBEEECDCEEEDDCEEECDCEEEDDDEEEDDDEEEDDDEFEDDEEFEDDEF0EEDFF0EEDFEF
        EEE0F0EEE0F0EFE1F0EEE1F1EFE1F1EFE2F1EFE2F1F0E3F1EFE3F1F0E4F2F0E4
        F2F0E5F2F1E4F2F0E5F3F1E6F3F2E5F3F1E6F4F2E6F3F1E7F4F2E8F4F2E7F4F2
        E8F4F3E8F4F2E9F4F3E9F4F3EAF5F3EAF5F4EBF6F3EBF6F3EBF6F4ECF7F4EDF6
        F5EDF7F5EDF7F5EEF6F5EEF7F5EEF8F6EFF8F6EFF8F6F0F8F6F0F9F6F0F8F6F1
        F8F6F1F9F7F2F9F7F2F9F7F2F9F7F3F9F8F3FAF8F3FAF8F4FAF9F4FAF8F5FBF8
        F5FBF9F5FBF9F6FBF9F7FBF9F7FCF9F7FCFAF8FCFAF8FCFAF8FCFBF9FDFBF9FD
        FBF9FDFBFAFEFBFAFEFBFBFDFBFBFEFBFCFEFCFBFEFCFCFEFCFDFFFCFDFFFDFD
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFD
        FEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFF
        FDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFDFE
        FFFDFEFFFDFE}
    end
    object Label12: TLabel
      Left = 15
      Top = 11
      Width = 191
      Height = 18
      Caption = '[Configura'#231#245'es Diversas]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 16
      Top = 12
      Width = 191
      Height = 18
      Caption = '[Configura'#231#245'es Diversas]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object Panel2: TPanel
    Left = 184
    Top = 463
    Width = 545
    Height = 41
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 2
    object Bevel2: TBevel
      Left = 8
      Top = -1
      Width = 532
      Height = 10
      Shape = bsTopLine
    end
    object botao_sair: TPanel
      Left = 451
      Top = 10
      Width = 89
      Height = 25
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
    object btnAplicar: TPanel
      Left = 230
      Top = 10
      Width = 217
      Height = 25
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Aplicar altera'#231#245'es - [F5]'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAplicarClick
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 467
    Align = alLeft
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 3
    object Panel11: TPanel
      Left = 8
      Top = 10
      Width = 170
      Height = 447
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BorderStyle = bsSingle
      Color = clSilver
      TabOrder = 0
      object treeOpcoes: TTreeView
        Left = -16
        Top = 2
        Width = 184
        Height = 448
        Cursor = crHandPoint
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Images = ImageList1
        Indent = 19
        MultiSelectStyle = []
        ParentFont = False
        ReadOnly = True
        RowSelect = True
        ShowLines = False
        TabOrder = 0
        OnChange = treeOpcoesChange
        OnClick = treeOpcoesClick
        OnDblClick = treeOpcoesDblClick
        OnKeyUp = treeOpcoesKeyUp
        Items.Data = {
          0900000023000000000000000000000000000000FFFFFFFF0000000000000000
          0A52656C6174F372696F7322000000010000000100000001000000FFFFFFFF00
          0000000000000009496E746572666163651F0000000200000002000000020000
          00FFFFFFFF00000000000000000646697363616C220000000400000003000000
          04000000FFFFFFFF0000000000000000094D6F76696D656E746F230000000500
          00000400000005000000FFFFFFFF00000000000000000A4469726574F372696F
          731E000000060000000500000006000000FFFFFFFF0000000000000000055669
          64656F1E000000030000000600000003000000FFFFFFFF000000000000000005
          536C6970731F000000070000000700000007000000FFFFFFFF00000000000000
          00064761766574611F000000080000000800000008000000FFFFFFFF00000000
          00000000064F7574726173}
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 648
    Top = 85
    object Principal1: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        ShortCut = 116
        OnClick = Salvar1Click
      end
    end
  end
  object ImageList1: TImageList
    Left = 138
    Top = 462
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      940084848400737373006B6B6B006B6B6B008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400737373006B6B6B0063636300636363007B7B7B008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B8C
      5200395A21002121210021311800636363006B6B6B007B7B7B008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006BD6
      00006BD600004284000018390000737B73006B6B6B0073737300848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084FF
      080084FF10006BDE0000295A0000425239006B6B6B006B6B6B007B7B7B008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5C6A5007BFF000084FF
      100084FF100084FF10006BD60000295A0000737373006B6B6B006B6B6B007373
      7300848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094D65A0084FF080094FF
      210094FF21008CFF210084FF0800429400008C948C00737373006B6B6B006B6B
      6B00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDC6B500ADFF63009CFF42009CF7
      4A00BDCEB500BDF78400A5FF4A0084FF1000183900007B7B7B007B7B7B007373
      73006B6B6B007B7B7B008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDCEB500A5FF4A00BDC6
      B50000000000BDCEAD00B5FF6B009CFF390042840000213118008C8C8C007B7B
      7B00737373007373730084848400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5F7730084FF100052AD0000183900006B6B
      6B008C8C8C007B7B7B00848484008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDCEAD009CFF420084FF1000429400001831
      00008C948C008C8C8C008C8C8C00949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDFF7B00A5FF4A0084FF10004294
      0000183100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDCEB500C6FF8C00B5FF
      6B008CFF18005273390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDC6B500C6F7
      9400B5FF6B0073F70000B5C6A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDCEAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400525252005A635A008C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C004A4A4A00424242007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094737300D6C6C600E7D6
      D600DECECE00D6BDBD00C69C9C008C6363004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363009494940084848400B5A5A500CEA5A500A58C8C00393939005A5A
      5A00000000000000000000000000000000000000000000000000636B6B006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6ADAD00E7E7E700E7E7E700DEDE
      DE00DED6D600E7D6D600CEC6C600BD949400BD8484008C6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000BDBD
      BD000000000000000000000000000000000000000000000000005A5A5A00CECE
      CE00D6D6D600CECECE007B7B7B009C949400000000002121210042424200D6BD
      BD007B6B6B004A4A4A008484840000000000000000007384E700DEF7FF0052C6
      F70018ADDE002184A5005A6B73007B6B73000000000000000000000000000000
      000000000000000000000000000000000000E7EFEF00F7F7F700F7F7F700E7E7
      E700DED6D600DEBDBD00CE9C9C00BD8C8C00CE9C9C008C6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008484000000
      0000BDBDBD0000000000000000000000000084848400DEDEDE00D6D6D600CECE
      CE00BDBDBD00B5B5B5007B7B7B00BDBDBD006B6B6B006B636300000000001010
      10007B737300E7BDBD00D6ADAD0094949400000000007384E700ADDEEF0073DE
      FF0073DEFF0073DEFF0073DEFF006BD6FF0029B5DE00188CB5004A7384006363
      630000000000000000000000000000000000D6BDBD00F7EFEF00EFE7E700E7EF
      EF00D6B5B500CE949400CE848400C67B8400BD8C8C0000000000000000000000
      00000000000029523100086B1000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000008484000084
      840000000000000000000000000000000000D6D6D600C6C6C600BDBDBD00ADAD
      AD00D6D6D600EFEFEF00DEDEDE00D6D6D6006B6B6B0094949400A5A5A500847B
      7B00524A4A008C737300AD8C8C0094949400000000007384E70031ADDE0084E7
      FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF006BDE
      FF006363630000000000000000000000000000000000D6B5B500F7BD6300D69C
      A500C6848400CE636300CE6363009C5A63000000000000000000000000002952
      31001094290031CE63003173310000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008484000084
      840000000000000000000000000000000000B5B5B500C6C6C600EFEFEF00F7F7
      F700EFEFEF00CE8484007B5252008C8C8C00C6C6C600D6D6D600DEDEDE007373
      730094949400A5A5A500947B7B0094949400000000008C94EF0039B5EF00D6FF
      FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF006BD6
      FF00318CAD0000000000000000000000000000000000C6949C00FFAD1800FFAD
      1800FFBD4A00DEA59400BD636B007B52520000000000315A420029BD52001094
      290042DE7300000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000FFFF0000000000BDBDBD0000000000008484000084
      840000000000000000000000000000000000A5A5A500C6C6C600FFFFFF00FFFF
      FF00F7F7F700FFA5A500CE636300DEC6C600EFE7E700B5B5B500847B7B00BDBD
      BD00BDBDBD00A5A5A50000000000000000000000000042A5DE0052C6F700DEF7
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0073DE
      FF00A5F7FF007B6B7300000000000000000000000000C69C9C00FFB53100FFBD
      3900FFBD4200FFB53100FF9C0000E794310029AD5A0021B54A0039BD5A0031B5
      4A0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000BDBDBD0000000000008484000084
      840000000000000000000000000000000000000000000000000000000000A5A5
      A500BDBDBD00FFA5A500CE636300A5737300D6A5A500F7F7F700D6A5A500CE63
      63004A4A4A00000000000000000000000000000000005ABDE70063CEFF005ABD
      E700ADFFFF00A5FFFF00A5FFFF00A5FFFF00A5FFFF00A5FFFF00A5FFFF0073DE
      FF00CEFFFF00427B8C000000000000000000CEB5A500CE947300FFC64A00FFC6
      5A00FFAD1800F78C0000B5845A00ADA5A5006BE78C008CEF9C00187321000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFADAD00CE636300CE949400A5737300E7E7E700E7ADAD00CE63
      63004A4A4A000000000000000000000000000000000063C6E70073DEFF0073DE
      FF0029B5DE0063BDDE00BDE7F700FFFFFF00C6FFFF00C6FFFF00C6FFFF007BDE
      FF00E7FFFF008CDEEF000000000000000000D6C6C600E7AD6300FFCE6300FFC6
      4A00103973009C6B4200FFF7CE00EFA55A007B6B52006B6B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFB5B500CE6363009C9C9C00F7F7F700A5A5A500D6A5A500CE63
      63004A4A4A000000000000000000000000000000000073CEE70084EFFF0084EF
      FF0084EFFF0084EFFF0084EFFF006BDEF700FFFFFF00F7FFFF00E7FFFF0084DE
      FF00F7FFFF00F7FFFF005A6B730000000000D6BDC600FFCE6300FFD67B008CB5
      AD006BD6FF0052BDE70008639400B5845A00E7AD630073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFBDBD00CE636300A55A5A00CE636300CE636300A55A5A00CE63
      63004A4A4A000000000000000000000000000000000073CEE70094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0073E7F70010A5
      D6008CA5EF0084CEE7005A8CDE0000000000D6CECE00FFDE7300FFDE8C009CBD
      A500188CC6005AC6F7005AC6F700FFDE8C00DE9C730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFBDBD00CE636300CECECE00E7E7E700FFFFFF00CECECE00CE63
      63004A4A4A000000000000000000000000000000000073CEE7009CFFFF009CFF
      FF009CFFFF00A5FFFF00D6FFFF00BDFFFF009CFFFF009CFFFF009CFFFF0021B5
      DE0000000000000000000000000000000000BDB5BD00F7D68400FFEF9C00FFF7
      AD00FFFFBD00B5CEB50084BDBD00FFE79400C6847B0073737300000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFC6C600CE636300CECECE00BDBDBD00BDBDBD00E7E7E700CE63
      63004A4A4A000000000000000000000000000000000000000000EFFFFF00CEFF
      FF00B5FFFF00BDE7F70000000000000000009494EF009494EF0073A5E70063A5
      E70000000000000000000000000000000000D6D6D600ADA5A5009C8C8C00A58C
      8C00CEB5A500EFE7BD00FFFFBD00FFEFA500AD7B7B0073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF000084840000FFFF000084840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCECE00CE636300E7E7E700E7E7E700D6D6D600D6D6D600CE63
      63004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB5A500E7CECE00E7CE
      CE00D6C6C600BDA5A500B5949400AD7B7B009473730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000FFFF000084840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00E7E7E700FFFFFF00E7AD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E7CECE00E7CECE00E7CECE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B006B6B6B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C008C8C8C0000000000000000000000
      00000000000000000000000000000000000000000000000000009C6363009C63
      63009C6363009C6363009C6363009C6363009C6363009C6363009C6363009C63
      63009C6363009C63630000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A006B6B6B00000000006B6B6B007373
      7300000000000000000000000000000000000000000000000000000000000000
      000021AD420021A5420029CE5A0029CE5A008CB59400000000007B7B7B008C84
      84007B7B7B000000000000000000000000000000000000000000000000000000
      000094847B00E7B5B500B5948C00FFC6C600FFCECE00949494009C9C9C000000
      0000000000000000000000000000000000000000000000000000FFEFCE00FFEF
      CE00FFEFCE00FFDECE00FFDECE00FFDECE00FFDECE00FFDECE00FFDECE00FFDE
      CE00FFDECE009C63630000000000000000000000000000000000000000000000
      0000000000006B6B6B00FFFFFF00B5B5B500B5B5B500AD8484009C9C9C00DEDE
      DE005252520063636300000000000000000000000000000000008C6B6B00BD9C
      9C00C6ADAD00BD9C9C0073946B0029A54A0000000000219C3900108C210021B5
      420021C64A0029A54A004A73520000000000000000000000000000000000BDA5
      9C00EFBDB500FFC6C600E7B5AD00FFC6C600FFC6C6009C847B00FFC6C6008C73
      7300000000000000000000000000000000000000000000000000FFFFFF00FFEF
      CE00FFEFCE00FFEFCE00FFEFCE00FFDECE00C6C6C600FFDECE00FFDECE00C6C6
      C600C6C6C6009C63630000000000000000000000000000000000000000008484
      8400EFEFEF00F7F7F700EFEFEF00ADADAD00B5B5B500424242005A5A5A008484
      8400A5A5A500DEDEDE009C9C9C000000000000000000DEDEDE00E7E7E700DEDE
      DE00DECECE00E7D6D600C6BDBD00C69C9C00634A4A0000000000000000001094
      290018BD390018BD3900525A5200000000000000000000000000B59C8C00B58C
      8C00D6AD9C00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00E7AD
      AD00000000000000000000000000000000000000000000000000FFFFFF00FFEF
      CE00FFFF6300FFFF6300FFEFCE00FFEFCE00C6C6C600FFDECE00FFDECE000000
      FF00FFDECE009C6363000000000000000000000000000000000000000000FFFF
      FF00F7F7F700EFEFEF00D6D6D60094949400A5A5A500B5B5B500BDBDBD00A5A5
      A5007B7B7B00949494005252520000000000C6A5A500EFEFEF00F7F7F700E7E7
      E700DED6D600DEC6C600CEA5A500B5848400C68C8C00000000000000000021AD
      420010AD290010AD29005A5A5A000000000000000000C6ADA500FFB5B500FFB5
      B500FFB5B500FFB5B500FFB5B500F7B5AD00FFB5B500FFB5B500FFB5B500AD84
      84008C7B7B006363630000000000000000000000000000000000FFFF6300FFFF
      6300FFFF6300FFFF6300FFFF6300FFFF6300FFEFCE000000FF000000FF000000
      FF00FFDECE009C6363000000000000000000000000000000000000000000FFFF
      FF00CECECE00A5A5A500DEDEDE00A5A5A5009C9C9C00949494008C8C8C00ADAD
      AD00C6C6C600A5B5AD005A5A5A000000000000000000EFEFEF00EFDEDE00EFEF
      EF00D6BDBD00CE949400CE848400BD84840052A55200316B31005252520029C6
      5A0008A5180008A518005A5A5A00000000000000000000000000CEA59400FFAD
      AD00FFADAD00EFA5A500000000000000000000000000CEA59400FFADAD00FFAD
      AD00FFADAD00CE94940000000000000000000000000000000000FFFF6300FFFF
      6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFEFCE00C6C6C6000000
      FF00FFDECE009C6363000000000000000000000000000000000000000000C6C6
      C600EFEFEF00DEDEDE00D6D6D600E7E7E700EFEFEF00E7E7E700C6C6C600B5B5
      B5009C9C9C00848484005A5A5A00000000000000000000000000E7A55A00E7C6
      C600C6848400CE636300CE63630073946B0039D66B00009C080010AD1800009C
      0800009C0800009C08005A5A5A0000000000000000009C949400BD948C00FFA5
      A500FFADAD00A5A5A50000000000000000000000000000000000D6A59400FFAD
      AD00FFADAD00D69C9C0000000000000000000000000000000000FFFF6300FFFF
      6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFEFCE00FFEFCE000000
      FF00FFDECE009C63630000000000000000002994C600399CD6002994C600E7E7
      E700D6D6D600CECECE00EFEFEF00EFEFEF00F7F7F700D6D6D600C6C6C600C6C6
      C600DEDEDE00DEDEDE00737373000000000000000000DEBDBD00FFAD2100FFAD
      2900FFAD2900EFCE9400CE7B7B00634A4A0042DE730029C65200316B310039D6
      6B00009C0000009C00005A5A5A000000000000000000D6A59400FFA5A500FFA5
      A500FFA5A5000000000000000000000000000000000000000000CEAD9C00FFA5
      A500FFA5A5006363630000000000000000000000000000000000FFFF6300FFFF
      6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFEFCE00FFEF
      CE00FFDECE009C636300000000000000000052BDDE006BD6FF0073D6FF00A5BD
      C600CECECE00CECECE00CECECE00EFEFEF00F7F7F700EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00B5B5B500000000000000000000000000D6ADAD00FFB53900FFBD
      4200FFBD4200FFBD4200FFBD4200FFB54200CE7B730042DE7B000094000042DE
      730000940000009400005A5A5A000000000000000000D6A59400FF9C9C00FF9C
      9C00FF9C9C000000000000000000000000000000000000000000C6ADA500F79C
      9400FF9C9C00FF9C9C005A5A5A00000000000000000000000000FFFF6300FFFF
      6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFEFCE00FFEF
      CE00FFDECE009C636300000000000000000052ADD60073DEFF007BDEFF007BDE
      FF0084D6EF00FFFFFF00B5B5B500ADB5B500BDBDBD00CECECE00DEDEDE00D6D6
      D600B5B5B50000000000000000000000000000000000CEADAD00FFC65200FFCE
      5A00FFCE6300FFCE6300FFC65A00FFC65200E78C520052E7840042DE730018AD
      2900008C0000008C00005A5A5A00000000000000000000000000BDA59C00F794
      9400FF9494006363630000000000000000000000000000000000C6A59C00F794
      9400FF949400FF94940084848400000000000000000000000000FFFF6300FFFF
      6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFEFCE00FFEFCE00FFEF
      CE00FFDECE009C636300000000000000000039ADDE0084EFFF0084EFFF0084EF
      FF0084EFFF00F7C69C00FFD6AD00FFCEA500FFD6B500FFD6B500BDADAD000000
      00000000000000000000000000000000000000000000CEA58C00FFCE6B00FFD6
      7300FFDE8400FFDE7B00FFD67300FFCE6B00D6846B00000000004AE784000894
      100000840000008400005A5A5A00000000000000000000000000EF948C00F78C
      8C00F78C8C00AD6B6B0094949400000000000000000000000000C6AD9C00F78C
      8C00F78C8C0094948C0000000000000000000000000000000000FFFF63008484
      84000000FF00F7FFFF00F7FFFF00FFFF6300FFFF6300FFEFCE00FFFF6300FFEF
      CE00FFEFCE009C63630000000000000000005AC6F700A5F7FF008CF7FF008CF7
      FF008CF7FF00FFDEBD00FFE7C600FFE7C600FFE7C600FFE7C600736B6B000000
      000000000000000000000000000000000000D6BDBD00E7B57B00FFDE7B00FFE7
      9400FFE79C00FFE79C00FFE78C00FFD67B00A5636300000000004AE7840052EF
      8400007B0000007B00005A5A5A000000000000000000C6ADA500E78C8400EF84
      8400EF848400EF848400845A5A008484840000000000AD9C9400E78C8400EF84
      8400EF8484009C6B6B0000000000000000000000000000000000FFFFFF008484
      8400F7FFFF0000FFFF0000FFFF00FFEFCE00FFFF6300FFFF6300FFFF6300FFEF
      CE00FFCECE009C636300000000000000000073DEFF00C6FFFF0094FFFF0094FF
      FF009CD6D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600CECECE000000
      000000000000000000000000000000000000D6BDBD00FFD67B00FFE79400FFEF
      A500FFF7B500FFF7B500FFEFA500FFE78C008C6B6B00000000000000000052EF
      8C0029B54200007300005A5A5A00000000000000000000000000CEAD9C00CEAD
      9C00CE9C8C00E77B7B00E77B7B00E7848400DE7B7B00E77B7B00E77B7B00E77B
      7B00E77B7B00DE7B7B0000000000000000000000000000000000FFFFFF008484
      8400F7FFFF0000FFFF0000FFFF00FFFF6300FFEFCE00FFFF6300FFEFCE00FFCE
      CE00CE9C9C009C63630000000000000000008CE7FF006BD6FF007BDEFF007BDE
      FF00C6B5B500FFF7E700FFF7E700FFF7E700FFF7E700DEBDB5009C9C9C000000
      000000000000000000000000000000000000E7D6D600A5949400A5949400B5A5
      9400DED6B500FFFFCE00FFF7B500FFE79400735A5A00000000000000000042DE
      73005AF78C00007300005A5A5A0000000000000000000000000000000000CEAD
      9C00D6847B00DE7B7B00DE737300DE7B7B00DE7B7B00DE737300DE7B7B00BD73
      7300D69C9C000000000000000000000000000000000000000000FFFFFF008484
      8400F7FFFF000000000000000000FFFF6300FFFF6300FFFF6300CE9C9C00FFEF
      CE00CE9C9C00000000000000000000000000B5FFFF0084EFFF0084EFFF008CD6
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000D6BDBD00D6BD
      BD00D6C6C600CEADAD00B58C8C00B58484007B73730000000000000000000000
      000063FF940042D66B006363630000000000000000000000000000000000CEAD
      9C00CE8C8400DE6B7300CEAD9C00D6737300D66B6B00CEA58C00DE6B7300DE73
      7300000000000000000000000000000000000000000000000000FFFFFF008484
      8400848484008484840084848400FFFF6300FFFF6300FFFF6300CE9C9C00CE9C
      9C00000000000000000000000000000000007BCEE70094DEEF0094D6EF0084CE
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5A5A5000000000000000000000000000000
      00000000000094F7B50000000000000000000000000000000000000000000000
      00000000000000000000C6AD9C00CE6B6B00D6636300BDADAD00CE847B000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9C9C000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F8FF000000000000E07F000000000000
      E03F000000000000E01F000000000000E00F000000000000E00F000000000000
      8007000000000000800700000000000000010000000000008800000000000000
      FE00000000000000FE00000000000000FF07000000000000FF83000000000000
      FFC1000000000000FFFB000000000000FFFFFFFFE1FFC01FFC3FFFFF807FC00F
      F00FCFFF003FE007C00180FF003FE0030000800F007980030000800780E18007
      000080078087800700038003800F8007E0078003001F8007F8078003003F8007
      F8078001003FE007F8078001003FC007F807800F003FC007F807C30F003FE007
      F807FFFF803FF803FF0FFFFFFC7FFC03FFFFF8FFFE7FC003FE4FF047F01FC003
      F803C081E00FC003E0018061C00FC003E00100618003C003E0018001C383C003
      E001C00183C3C0030001800187C3C0030003800187C1C00300078001C3C1C003
      001F8041C1C3C003001F00418083C003001F0061C003C003001F0061E007C007
      003FC071E00FC00F0FFFFEFBFC1FC01F00000000000000000000000000000000
      000000000000}
  end
  object Query1: TQuery
    DatabaseName = 'Vendas'
    Left = 608
    Top = 88
  end
end
