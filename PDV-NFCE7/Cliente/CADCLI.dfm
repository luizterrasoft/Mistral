object frm_edtCliente: Tfrm_edtCliente
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cliente'
  ClientHeight = 581
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = menu
  OldCreateOrder = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object fichario: TPageControl
    Left = 0
    Top = 0
    Width = 800
    Height = 581
    Cursor = crHandPoint
    ActivePage = pagina1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabIndex = 0
    TabOrder = 0
    TabStop = False
    OnChange = ficharioChange
    OnChanging = ficharioChanging
    OnDrawTab = ficharioDrawTab
    object pagina1: TTabSheet
      Caption = 'Dados cadastrais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnEnter = pagina1Enter
      object Bevel1: TBevel
        Left = 1
        Top = 7
        Width = 788
        Height = 182
        Shape = bsFrame
      end
      object Bevel3: TBevel
        Left = 1
        Top = 190
        Width = 788
        Height = 224
        Shape = bsFrame
      end
      object Label9: TLabel
        Left = 18
        Top = 63
        Width = 67
        Height = 13
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNome: TLabel
        Left = 262
        Top = 24
        Width = 94
        Height = 13
        Caption = 'Nome do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 19
        Top = 24
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEndereco: TLabel
        Left = 355
        Top = 64
        Width = 65
        Height = 13
        Caption = 'Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 256
        Top = 100
        Width = 34
        Height = 13
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 116
        Top = 63
        Width = 25
        Height = 13
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 732
        Top = 100
        Width = 17
        Height = 13
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 448
        Top = 100
        Width = 40
        Height = 13
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 16
        Top = 243
        Width = 61
        Height = 13
        Caption = 'Identidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 128
        Top = 244
        Width = 82
        Height = 13
        Caption = 'Org'#227'o Emissor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 102
        Top = 24
        Width = 69
        Height = 13
        Caption = 'CPF / CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 17
        Top = 198
        Width = 51
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 129
        Top = 198
        Width = 40
        Height = 13
        Caption = 'Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 241
        Top = 198
        Width = 21
        Height = 13
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 351
        Top = 199
        Width = 35
        Height = 13
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 16
        Top = 290
        Width = 68
        Height = 13
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 129
        Top = 290
        Width = 47
        Height = 13
        Caption = 'C'#244'njuge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 16
        Top = 338
        Width = 73
        Height = 13
        Caption = 'Nome do Pai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 340
        Top = 338
        Width = 79
        Height = 13
        Caption = 'Nome da M'#227'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label158: TLabel
        Left = 607
        Top = 48
        Width = 29
        Height = 13
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label69: TLabel
        Left = 9
        Top = 1
        Width = 223
        Height = 13
        Caption = 'F3 - Sugerir novo c'#243'digo para cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 209
        Top = 64
        Width = 94
        Height = 13
        Caption = 'Tipo Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 79
        Top = 100
        Width = 76
        Height = 13
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 17
        Top = 100
        Width = 44
        Height = 13
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 18
        Top = 140
        Width = 27
        Height = 13
        Caption = 'Pa'#237's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodPais: TLabel
        Left = 53
        Top = 140
        Width = 36
        Height = 13
        Caption = '01058'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblCodCidadeIBGE: TLabel
        Left = 498
        Top = 99
        Width = 15
        Height = 13
        Caption = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblCodUFIBGE: TLabel
        Left = 757
        Top = 99
        Width = 15
        Height = 13
        Caption = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbl5: TLabel
        Left = 656
        Top = 99
        Width = 72
        Height = 13
        Caption = 'F8-Consultar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 227
        Top = 140
        Width = 72
        Height = 13
        Caption = 'F8-Consultar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtNasc: TMaskEdit
        Left = 17
        Top = 78
        Width = 97
        Height = 21
        CharCase = ecUpperCase
        EditMask = '99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '  /  /    '
        OnEnter = edtNascEnter
        OnExit = edtNascExit
        OnKeyDown = edtNascKeyDown
      end
      object edtNome: TMaskEdit
        Left = 262
        Top = 40
        Width = 341
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 2
        OnChange = edtNomeChange
        OnEnter = edtNomeEnter
        OnKeyDown = edtNomeKeyDown
        OnKeyPress = edtNomeKeyPress
      end
      object edtCodigo: TMaskEdit
        Left = 18
        Top = 40
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        TabOrder = 0
        Text = '      '
        OnDblClick = edtCodigoDblClick
        OnEnter = edtCodigoEnter
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
      end
      object edtEndereco: TMaskEdit
        Left = 354
        Top = 78
        Width = 426
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        TabOrder = 7
        OnEnter = edtEnderecoEnter
        OnKeyDown = edtEnderecoKeyDown
        OnKeyPress = edtNomeKeyPress
      end
      object edtBairro: TMaskEdit
        Left = 256
        Top = 114
        Width = 189
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 10
        OnEnter = edtBairroEnter
        OnKeyDown = edtBairroKeyDown
        OnKeyPress = edtNomeKeyPress
      end
      object edtCep: TMaskEdit
        Left = 116
        Top = 78
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99999\-999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentFont = False
        TabOrder = 5
        OnDblClick = edtCepDblClick
        OnEnter = edtCepEnter
        OnKeyDown = edtCepKeyDown
      end
      object edtCidade: TMaskEdit
        Left = 447
        Top = 114
        Width = 283
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        TabOrder = 11
        OnEnter = edtCidadeEnter
        OnKeyDown = edtCidadeKeyDown
      end
      object edtIdentidade: TMaskEdit
        Left = 16
        Top = 259
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnEnter = edtIdentidadeEnter
        OnKeyDown = edtIdentidadeKeyDown
      end
      object edtOrgExped: TMaskEdit
        Left = 127
        Top = 259
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 19
        OnEnter = edtOrgExpedEnter
        OnKeyDown = edtOrgExpedKeyDown
      end
      object edtCpf: TMaskEdit
        Left = 101
        Top = 40
        Width = 159
        Height = 21
        CharCase = ecUpperCase
        EditMask = '99999999999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentFont = False
        TabOrder = 1
        Text = '              '
        OnEnter = edtCpfEnter
        OnExit = edtCpfExit
        OnKeyDown = edtCpfKeyDown
      end
      object edtEmail: TMaskEdit
        Left = 350
        Top = 214
        Width = 429
        Height = 21
        CharCase = ecLowerCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 80
        ParentFont = False
        TabOrder = 17
        OnEnter = edtEmailEnter
        OnKeyDown = edtEmailKeyDown
      end
      object edtFax: TMaskEdit
        Left = 239
        Top = 214
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!\(99\)9999\-9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 16
        OnEnter = edtFaxEnter
        OnKeyDown = edtFaxKeyDown
      end
      object edtCelular: TMaskEdit
        Left = 128
        Top = 214
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!\(99\)9999\-9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 15
        OnEnter = edtCelularEnter
        OnKeyDown = edtCelularKeyDown
      end
      object edtTelefone: TMaskEdit
        Left = 17
        Top = 214
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!\(99\)9999\-9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 14
        OnEnter = edtTelefoneEnter
        OnKeyDown = edtTelefoneKeyDown
      end
      object cbEstadoCivil: TComboBox
        Left = 16
        Top = 306
        Width = 112
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 20
        OnEnter = cbEstadoCivilEnter
        OnKeyDown = cbEstadoCivilKeyDown
        Items.Strings = (
          'SOLTEIRO'
          'CASADO'
          'SEPARADO'
          'VIUVO'
          'OUTROS...')
      end
      object edtConjuge: TMaskEdit
        Left = 130
        Top = 306
        Width = 321
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 40
        ParentFont = False
        TabOrder = 21
        OnEnter = edtConjugeEnter
        OnKeyDown = edtConjugeKeyDown
      end
      object edtPai: TMaskEdit
        Left = 16
        Top = 354
        Width = 321
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 22
        OnEnter = edtPaiEnter
        OnKeyDown = edtPaiKeyDown
      end
      object edtMae: TMaskEdit
        Left = 340
        Top = 354
        Width = 321
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 23
        OnEnter = edtMaeEnter
        OnKeyDown = edtMaeKeyDown
      end
      object cbEstado: TComboBox
        Left = 731
        Top = 114
        Width = 49
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        MaxLength = 2
        ParentFont = False
        TabOrder = 24
        OnEnter = cbEstadoEnter
        OnExit = cbEstadoExit
        OnKeyDown = cbEstadoKeyDown
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'BA'
          'CE'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RO'
          'RJ'
          'RN'
          'RR'
          'RS'
          'SE'
          'SC'
          'SP'
          'TO')
      end
      object pn_menucadcli: TPanel
        Left = 0
        Top = 425
        Width = 790
        Height = 124
        BevelInner = bvLowered
        Color = clTeal
        TabOrder = 25
        object pnMensForm00: TPanel
          Left = -2
          Top = 24
          Width = 791
          Height = 48
          BevelInner = bvRaised
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clTeal
          TabOrder = 1
          object Bevel5: TBevel
            Left = 47
            Top = 15
            Width = 420
            Height = 25
            Shape = bsFrame
          end
          object Label50: TLabel
            Left = 16
            Top = 21
            Width = 20
            Height = 13
            Caption = 'Ctrl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbLimpar: TLabel
            Left = 69
            Top = 21
            Width = 31
            Height = 13
            Caption = 'impar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 60
            Top = 21
            Width = 8
            Height = 13
            Caption = '&L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 136
            Top = 22
            Width = 20
            Height = 13
            Caption = 'X->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 156
            Top = 22
            Width = 113
            Height = 13
            Caption = 'Prosseguir cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 505
            Top = 22
            Width = 207
            Height = 13
            Caption = 'Ir direto para o cadastro do contrato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 479
            Top = 22
            Width = 26
            Height = 13
            Caption = 'F5->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnMensForm01: TPanel
          Left = 0
          Top = 27
          Width = 787
          Height = 43
          Color = clTeal
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 2
          object Label67: TLabel
            Left = 15
            Top = 19
            Width = 20
            Height = 13
            Caption = 'Ctrl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel11: TBevel
            Left = 46
            Top = 13
            Width = 420
            Height = 25
            Shape = bsFrame
          end
          object Label68: TLabel
            Left = 67
            Top = 18
            Width = 31
            Height = 13
            Caption = 'impar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label105: TLabel
            Left = 58
            Top = 18
            Width = 8
            Height = 13
            Caption = '&L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label106: TLabel
            Left = 109
            Top = 19
            Width = 20
            Height = 13
            Caption = 'Z->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label107: TLabel
            Left = 130
            Top = 18
            Width = 103
            Height = 13
            Caption = 'Retornar cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label108: TLabel
            Left = 241
            Top = 18
            Width = 14
            Height = 13
            Caption = 'Im'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label109: TLabel
            Left = 256
            Top = 18
            Width = 9
            Height = 13
            Caption = '&P'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label110: TLabel
            Left = 265
            Top = 18
            Width = 24
            Height = 13
            Caption = 'rimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label111: TLabel
            Left = 418
            Top = 19
            Width = 10
            Height = 13
            Caption = '&O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label112: TLabel
            Left = 428
            Top = 19
            Width = 29
            Height = 13
            Caption = 'utros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label113: TLabel
            Left = 301
            Top = 19
            Width = 9
            Height = 13
            Caption = '&C'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label114: TLabel
            Left = 310
            Top = 19
            Width = 94
            Height = 13
            Caption = 'ancelar inclus'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label115: TLabel
            Left = 478
            Top = 8
            Width = 26
            Height = 13
            Caption = 'F3->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label116: TLabel
            Left = 504
            Top = 8
            Width = 268
            Height = 13
            Caption = 'Sugerir c'#243'digo para o cadastro do novo cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label119: TLabel
            Left = 478
            Top = 26
            Width = 26
            Height = 13
            Caption = 'F5->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label120: TLabel
            Left = 504
            Top = 26
            Width = 137
            Height = 13
            Caption = 'Salvar dados cadastrais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnPagina1: TPanel
          Left = 2
          Top = 69
          Width = 787
          Height = 54
          BevelInner = bvLowered
          TabOrder = 0
          object btnHist: TSpeedButton
            Left = 159
            Top = 16
            Width = 100
            Height = 27
            Cursor = crHandPoint
            Caption = 'Hist'#243'rico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnHistClick
          end
          object btnConsulta: TSpeedButton
            Left = 260
            Top = 16
            Width = 100
            Height = 27
            Cursor = crHandPoint
            Caption = 'Consulta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnConsultaClick
          end
          object btnSalvar: TSpeedButton
            Left = 497
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Salvar cadastro do cliente'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnSalvarClick
          end
          object pnTipoCad1: TPanel
            Left = -6
            Top = -14
            Width = 791
            Height = 15
            Alignment = taRightJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
          end
          object BitBtnProsseguir: TBitBtn
            Left = 584
            Top = 13
            Width = 188
            Height = 34
            Caption = 'Prosseguir Cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtnProsseguirClick
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0136020136020136020136020136
              02013602013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A0401360203860903990B
              039F0C03A10C03A10C039F0C03980B038109013602013602FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A04034A04038F0A03
              A40C03A40C039F0C039F0C039F0C039F0C039F0C039F0C03A40C03A40C03880A
              013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06690C0469
              0C06A51304A30F039E0C039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0C039E0C03A40C039D0C025B05013602FF00FFFF00FFFF00FFFF00FFFF00FF
              06690C0569100AAB1F08A51906A014049F0F049F0F049F0F039E0C039E0C039E
              0C039E0C039E0C039E0C039E0C039E0C039F0C039F0C025705013602FF00FFFF
              00FFFF00FFFF00FF06690C0EAB2A0CA7250AA41F049F0F049F0F049F0F049F0F
              0DA61E2BB53BEBF8EEFFFFFF8ED996039E0C039E0C039E0C039E0C03A10C0399
              0B013602FF00FFFF00FFFF00FF06690C0F952B11B0340EA92B0EA92B0DA7260E
              A92809A41C13AA2810A72375D182FFFFFFFFFFFFFFFFFF8BD992039E0C039E0C
              039E0C039E0C03A50C037A08013602FF00FFFF00FF06690C16B44113AC3711AA
              3216AC3916AF3D16AF3E18AD3716AB2F13AA292CB540C7EECEFCFEFCFFFFFFFF
              FFFF8BD992039E0C039E0C039E0C039F0C039E0C013602FF00FF039E0C118F31
              1AB64A16AF3E16AF3E16AF3E13AC351CB0401DB03B1AAF3517AC2F13AB2A29B5
              3DABE5B4E5F7E7FFFFFFFFFFFF8BD992039E0C039E0C039E0C03A50C026B0701
              3602039E0C19A9471CB44E19B14719B14719B14728B64E25B44721B2411EB03C
              1BAF3517AC3014AB2B2BB5406DCF7DFFFFFFFFFFFFFFFFFF4EC45A039E0C039E
              0C03A10C03880A013602039E0C20B25122B6551CB24E1CB24EA7E5BBC2EDD0C1
              EDCEC0EBCCBFEBCABDEAC9BCEAC6BBEAC5B8E9C1D8F3DCFFFFFFFFFFFFFFFFFF
              FFFFFF4EC25A039E0C039E0C03990B013602039E0C2EBA5E31BC631FB4521FB4
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF039E0C039E0C039F0C013602039E0C3EC06C
              47C57524B65624B656F0FBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFF0FBF3D9F3DEFFFFFFFFFFFFFFFFFFFFFFFFC6EDCB039E0C039E0C039E0C01
              3602039E0C47C27267D08E34BC6434BC644CC67860CE875ECB835CCB8059CA7D
              56C97753C77346C26442C15F89DA9CFFFFFFFFFFFFFFFFFFB7E9BF16AA28039E
              0C039F0C03930B013602039E0C40BB6683D9A452C97D38BF6838BF6837BF6736
              BF6434BC5F30BB5B2DBA562AB7502DB852AAE5BAFFFFFFFFFFFFFFFFFF99E0A6
              13AA280FA723039E0D03A30C037F09013602039E0C2BAA4888DCA986DAA535BD
              6538BF6838BF6838BF6836BD6434BC6031BB5C44C26BD8F3E0FFFFFFFFFFFFFF
              FFFF95DDA50CA7250AA52008A31905A01104A50E026006013602FF00FF039E0C
              6BD091ADE6C46ED3932BBA5C38BF6838BF6838BF6836BD6534BC608CDCA7FFFF
              FFFFFFFFFFFFFF98E0AB11AA320FA92C0CA7250AA41D07A518059911013602FF
              00FFFF00FF039E0C37B5579DE2B8B5E9C967CF8C38BF6838BF6838BF6838BF68
              36BD655FCC84FFFFFFFFFFFF70D18E16AD3F13AD3911AB310EA7280CA6230AAC
              1F046B0C013602FF00FFFF00FFFF00FF039E0C5AC980B7EACABBEBCE73D49638
              BF6838BF6838BF6838BF6837BD6635BC6232BC5D2FBA5918B04415AD3D12AB35
              10A92E0FAF2C098E1C034A04FF00FFFF00FFFF00FFFF00FF039E0C189F2A67CF
              8CBAEACCCAEFD897E0B25DCC863ABF6929B85A22B5541FB4521FB45221B55324
              B65222B54C19B04114B23A0E9D2906680D034A04FF00FFFF00FFFF00FFFF00FF
              FF00FF039E0C189F2959C97EA3E3BCCAEFD8C1EDD1A0E2B87FD8A068D08E5CCB
              8458CA8158CA814FC77A38C06722BA5010982F06680D06690CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF039E0C039E0C35B5536CD1919AE1B6B1E9C6
              B5E9C9ABE6C19DE2B788DAA76CD3934AC9792AB4570F842706680D06680DFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF039E0C03
              9E0C28AC4141BB6351C57755C77D4EC5773EBB6528A749138B2906680D06690C
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
          end
          object BitBtnRetornar1: TBitBtn
            Left = 16
            Top = 13
            Width = 140
            Height = 34
            Caption = 'Retornar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtnRetornar1Click
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0136020136020136020136020136
              02013602013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A0401360203860903990B
              039F0C03A10C03A10C039F0C03980B038109013602013602FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A04034A04038F0A03
              A40C03A40C039F0C039F0C039F0C039F0C039F0C039F0C03A40C03A40C03880A
              013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06690C0469
              0C06A51304A30F039E0C039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0C039E0C03A40C039D0C025B05013602FF00FFFF00FFFF00FFFF00FFFF00FF
              06690C0569100AAB1F08A51906A014049F0F049F0F049F0F039E0C039E0C039E
              0C039E0C039E0C039E0C039E0C039E0C039F0C039F0C025705013602FF00FFFF
              00FFFF00FFFF00FF06690C0EAB2A0CA7250AA41F049F0F049F0F049F0F049F0F
              93DD9EFFFFFFEBF8EE27B233059F0F039E0C039E0C039E0C039E0C03A10C0399
              0B013602FF00FFFF00FFFF00FF06690C0F952B11B0340EA92B0EA92B049F0F04
              9F0F049F0F98DEA4FFFFFFFFFFFFFFFFFF70D07B06A113039E0C039E0C039E0C
              039E0C039E0C03A50C037A08013602FF00FFFF00FF06690C16B44113AC3711AA
              3216AB37049F0F049F0F9CE0AAFFFFFFFFFFFFFCFEFCC7EECE25B23609A31703
              9E0C039E0C039E0C039E0C039E0C039F0C039E0C013602FF00FF039E0C118F31
              1AB64A16AF3E16AF3E16AF3E049F0FA0E1B1FFFFFFFFFFFFE7F7EAAFE6B829B5
              3D0EA61F0BA51C039E0C039E0C039E0C039E0C039E0C039E0C03A50C026B0701
              3602039E0C19A9471CB44E19B14719B14719B1476ED08AFFFFFFFFFFFFFFFFFF
              78D48B32B84A14AB2B11A9250EA6200CA51C09A31807A11406A111039E0C039E
              0C03A10C03880A013602039E0C20B25122B6551CB24E1CB24E74D392FFFFFFFF
              FFFFFFFFFFFFFFFFDAF3E1BBEAC5BBEAC5BAE9C2B7E9C0B7E9BFB6E7BCB5E7BB
              B4E7BA8FDA96039E0C039E0C03990B013602039E0C2EBA5E31BC631FB4521FB4
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF039E0C039E0C039F0C013602039E0C3EC06C
              47C57524B65624B656D4F2E0FFFFFFFFFFFFFFFFFFFFFFFFDCF4E3F2FBF4FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF8EE039E0C039E0C039E0C01
              3602039E0C47C27267D08E34BC6434BC6441C26FC6EED5FFFFFFFFFFFFFFFFFF
              92DDA949C46946C2644DC56949C46346C15D42C05941BD543DBD4F22B033039E
              0C039F0C03930B013602039E0C40BB6683D9A452C97D38BF6838BF6837BF67AB
              E6C0FFFFFFFFFFFFFFFFFFADE6BF2DB85223B44520B13F1DB03919AD3416AC2D
              13AA280FA723039E0D03A30C037F09013602039E0C2BAA4888DCA986DAA535BD
              6538BF6838BF6838BF68ABE6C0FFFFFFFFFFFFFFFFFFD8F3E03EC05F23B44611
              AA300EA92B0CA7250AA52008A31905A01104A50E026006013602FF00FF039E0C
              6BD091ADE6C46ED3932BBA5C38BF6838BF6838BF68ABE6C1FFFFFFFFFFFFFFFF
              FF89DAA128B64C13AC3711AA320FA92C0CA7250AA41D07A518059911013602FF
              00FFFF00FF039E0C37B5579DE2B8B5E9C967CF8C38BF6838BF6838BF6838BF68
              79D59AFFFFFFFFFFFF5ACB7E2CB75216AD3F13AD3911AB310EA7280CA6230AAC
              1F046B0C013602FF00FFFF00FFFF00FF039E0C5AC980B7EACABBEBCE73D49638
              BF6838BF6838BF6838BF6837BD6635BC6232BC5D2FBA5918B04415AD3D12AB35
              10A92E0FAF2C098E1C034A04FF00FFFF00FFFF00FFFF00FF039E0C189F2A67CF
              8CBAEACCCAEFD897E0B25DCC863ABF6929B85A22B5541FB4521FB45221B55324
              B65222B54C19B04114B23A0E9D2906680D034A04FF00FFFF00FFFF00FFFF00FF
              FF00FF039E0C189F2959C97EA3E3BCCAEFD8C1EDD1A0E2B87FD8A068D08E5CCB
              8458CA8158CA814FC77A38C06722BA5010982F06680D06690CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF039E0C039E0C35B5536CD1919AE1B6B1E9C6
              B5E9C9ABE6C19DE2B788DAA76CD3934AC9792AB4570F842706680D06680DFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF039E0C03
              9E0C28AC4141BB6351C57755C77D4EC5773EBB6528A749138B2906680D06690C
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Spacing = 20
          end
        end
      end
      object edtSexo: TMaskEdit
        Left = 639
        Top = 40
        Width = 21
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnChange = edtSexoChange
        OnEnter = edtSexoEnter
        OnKeyDown = edtSexoKeyDown
      end
      object Panel5: TPanel
        Left = 663
        Top = 28
        Width = 117
        Height = 44
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 26
        object Label159: TLabel
          Left = 11
          Top = 6
          Width = 66
          Height = 13
          Caption = '(M)asculino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label160: TLabel
          Left = 11
          Top = 24
          Width = 59
          Height = 13
          Caption = '(F)eminino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnEmail: TPanel
        Left = 744
        Top = 238
        Width = 35
        Height = 19
        AutoSize = True
        BevelInner = bvSpace
        TabOrder = 27
        object Image1: TImage
          Left = 2
          Top = 2
          Width = 31
          Height = 15
          Picture.Data = {
            07544269746D6170F6050000424DF60500000000000036000000280000001E00
            0000100000000100180000000000C0050000C30E0000C30E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFCFCFCFFFFFFFFFFFFFEFEFE
            FFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFFFFFFFFFFFFFFFFFF00000303
            0300000003030300000003030300000003030301010102020200000002020200
            0000000000000000020202010101000000000000000000000000000000000000
            0000000000000202020000000000000202020000000101010000FFFFFFFFFFFF
            FDFDFDFFFFFFFDFDFDFFFFFFFFFFFFFEFEFEFCFCFCFFFFFFFDFDFDFFFFFFFBFB
            FBFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFCFCFCFFFFFFFFFFFFFDFDFDFFFFFF0000000000FCFCFCFEFEFEFEFEFEFF
            FFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFDFDFD
            FFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFCFCFCFFFFFFFFFFFFFFFFFF0000000000FFFFFFFFFFFFFFFFFFFEFEFEFFFF
            FFFFFFFFFAFAFAFFFFFFFEFEFEFEFEFEFFFFFFFDFDFDFDFDFDFFFFFFFCFCFCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
            FFFFFFFEFEFEFFFFFF0000000000FEFEFEFFFFFF000000000000000000000000
            040404FDFDFDFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF
            FFFFFDFDFD0101010000FEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF
            FFFFFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFCFCFCFFFFFFFEFEFEFEFEFE
            FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFFFF
            FF0000000000FFFFFFFDFDFDFFFFFFFBFBFBFFFFFFFFFFFFFEFEFEFEFEFEFFFF
            FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFCFCFC010101
            0000FEFEFEFEFEFEFFFFFFFFFFFFFBFBFBFEFEFEFEFEFEFFFFFFFEFEFEFFFFFF
            FFFFFFFEFEFE000000000000FEFEFEFFFFFF010101000000FFFFFFFFFFFFFEFE
            FEFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFCFCFCFFFFFF0000000000FFFF
            FFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFEFEFE00000003
            0303FFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF000000000000FFFFFFFFFFFF
            FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD0000000000FEFEFEFCFCFC
            FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFF000000020202FDFDFDFDFDFDFFFF
            FFFCFCFCFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFF000000000000FFFFFFFF
            FFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFFFF0101010000FEFEFEFFFFFFFDFDFDFE
            FEFEFFFFFFFFFFFF030303000000FFFFFFFDFDFDFFFFFFFCFCFCFFFFFFFDFDFD
            FEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB020202000000FDFD
            FDFCFCFCFFFFFFFEFEFEFFFFFF0000000000FFFFFFFFFFFFFFFFFFFEFEFE0000
            00010101FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFFFFFFFE
            FEFEFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFDFDFDFFFFFF010101010101
            FDFDFDFFFFFFFCFCFC0404040000FFFFFFFFFFFF000000010101FFFFFFFCFCFC
            FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
            FFFFFFFFFFFFFFFFFFFFFCFCFCFEFEFEFEFEFEFFFFFFFCFCFCFFFFFF04040400
            0000FFFFFF0000000000FCFCFC040404FFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFC
            FCFCFFFFFFFEFEFEFFFFFFFFFFFFFAFAFAFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFCFCFCFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF0202
            020000000000FFFFFFFFFFFFFCFCFCFFFFFFFDFDFDFFFFFFFCFCFCFFFFFFFFFF
            FFFFFFFFFFFFFFFCFCFCFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFCFCFCFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFEFEFE010101
            0000}
          Stretch = True
        end
      end
      object pnDesatualizado: TPanel
        Left = 665
        Top = 153
        Width = 118
        Height = 22
        BevelOuter = bvNone
        Caption = 'Desatualizado'
        Color = clRed
        TabOrder = 28
        Visible = False
      end
      object cbbTipoLogradouro: TComboBox
        Left = 208
        Top = 78
        Width = 145
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 6
        OnKeyDown = cbbTipoLogradouroKeyDown
      end
      object edtComplemento: TMaskEdit
        Left = 79
        Top = 114
        Width = 175
        Height = 21
        Hint = 'Complemento do endere'#231'o com at'#233' 12 caracteres'
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 12
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnEnter = edtBairroEnter
        OnKeyDown = edtComplementoKeyDown
        OnKeyPress = edtNomeKeyPress
      end
      object edtNumero: TMaskEdit
        Left = 17
        Top = 114
        Width = 60
        Height = 21
        Hint = 'N'#250'mero do endere'#231'o com at'#233' 06 digitos'
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnEnter = edtBairroEnter
        OnKeyDown = edtNumeroKeyDown
        OnKeyPress = edtNumeroKeyPress
      end
      object edtPais: TMaskEdit
        Left = 17
        Top = 154
        Width = 283
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        Text = 'BRASIL'
        OnEnter = edtPaisEnter
        OnKeyDown = edtPaisKeyDown
      end
      object edtUF: TMaskEdit
        Left = 731
        Top = 114
        Width = 48
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 12
        OnKeyDown = edtUFKeyDown
      end
    end
    object pagina2: TTabSheet
      Caption = 'Refer'#234'ncias'
      OnEnter = pagina2Enter
      object Bevel6: TBevel
        Left = 1
        Top = 6
        Width = 791
        Height = 436
        Shape = bsFrame
      end
      object Label25: TLabel
        Left = 16
        Top = 16
        Width = 131
        Height = 13
        Caption = 'Empresa onde trabalha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 16
        Top = 56
        Width = 55
        Height = 13
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 348
        Top = 16
        Width = 87
        Height = 13
        Caption = 'Cargo ocupado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 16
        Top = 98
        Width = 113
        Height = 13
        Caption = 'Carteira profissional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 417
        Top = 56
        Width = 54
        Height = 13
        Caption = 'Admiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 213
        Top = 98
        Width = 83
        Height = 13
        Caption = 'Sal'#225'rio mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label34: TLabel
        Left = 350
        Top = 98
        Width = 95
        Height = 13
        Caption = 'Limite de cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 16
        Top = 223
        Width = 69
        Height = 13
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 514
        Top = 55
        Width = 51
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 15
        Top = 140
        Width = 81
        Height = 13
        Caption = 'Referencia 01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 15
        Top = 181
        Width = 81
        Height = 13
        Caption = 'Referencia 02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 350
        Top = 140
        Width = 51
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 349
        Top = 183
        Width = 51
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label82: TLabel
        Left = 34
        Top = 329
        Width = 86
        Height = 13
        Caption = 'Cliente no SPC'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label83: TLabel
        Left = 272
        Top = 329
        Width = 175
        Height = 13
        Caption = 'Cliente com cheque sem fundo'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label147: TLabel
        Left = 501
        Top = 329
        Width = 162
        Height = 13
        Caption = 'Cliente tem t'#237'tulo protestado'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label148: TLabel
        Left = 31
        Top = 410
        Width = 103
        Height = 13
        Caption = 'Data de cadastro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label150: TLabel
        Left = 432
        Top = 410
        Width = 105
        Height = 13
        Caption = 'Qtde. de compras:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label156: TLabel
        Left = 90
        Top = 308
        Width = 26
        Height = 13
        Caption = 'PDC'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label149: TLabel
        Left = 242
        Top = 410
        Width = 85
        Height = 13
        Caption = #218'ltima compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label157: TLabel
        Left = 603
        Top = 411
        Width = 54
        Height = 13
        Caption = 'Validade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label161: TLabel
        Left = 624
        Top = 55
        Width = 36
        Height = 13
        Caption = 'Ramal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label164: TLabel
        Left = 460
        Top = 98
        Width = 83
        Height = 13
        Caption = 'Saldo devedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 20
        Top = 289
        Width = 29
        Height = 13
        Caption = 'Livre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtNomeEmp: TMaskEdit
        Left = 16
        Top = 30
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 0
        OnEnter = edtNomeEmpEnter
        OnKeyDown = edtNomeEmpKeyDown
      end
      object edtEndEmp: TMaskEdit
        Left = 16
        Top = 70
        Width = 396
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        TabOrder = 2
        OnEnter = edtEndEmpEnter
        OnKeyDown = edtEndEmpKeyDown
      end
      object edtCargo: TMaskEdit
        Left = 348
        Top = 30
        Width = 337
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        TabOrder = 1
        OnEnter = edtCargoEnter
        OnKeyDown = edtCargoKeyDown
      end
      object edtCartProf: TMaskEdit
        Left = 16
        Top = 112
        Width = 193
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        TabOrder = 5
        OnEnter = edtCartProfEnter
        OnKeyDown = edtCartProfKeyDown
      end
      object edtAdmissaoEmp: TMaskEdit
        Left = 415
        Top = 70
        Width = 97
        Height = 21
        CharCase = ecUpperCase
        EditMask = '99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 3
        Text = '  /  /    '
        OnEnter = edtAdmissaoEmpEnter
        OnExit = edtAdmissaoEmpExit
        OnKeyDown = edtAdmissaoEmpKeyDown
      end
      object edtSalario: TMaskEdit
        Left = 212
        Top = 112
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnEnter = edtSalarioEnter
        OnExit = edtSalarioExit
        OnKeyDown = edtSalarioKeyDown
        OnKeyUp = edtSalarioKeyUp
      end
      object edtLimCred: TMaskEdit
        Left = 349
        Top = 112
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnEnter = edtLimCredEnter
        OnExit = edtLimCredExit
        OnKeyDown = edtLimCredKeyDown
        OnKeyUp = edtLimCredKeyUp
      end
      object edtObs: TMaskEdit
        Left = 16
        Top = 239
        Width = 529
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        TabOrder = 12
        OnEnter = edtObsEnter
        OnKeyDown = edtObsKeyDown
      end
      object edtTelEmp: TMaskEdit
        Left = 514
        Top = 70
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!\(99\)9999\-9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 4
        OnEnter = edtTelEmpEnter
        OnKeyDown = edtTelEmpKeyDown
      end
      object edtRef1: TMaskEdit
        Left = 16
        Top = 156
        Width = 330
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 8
        OnEnter = edtRef1Enter
        OnKeyDown = edtRef1KeyDown
      end
      object edtRef2: TMaskEdit
        Left = 16
        Top = 197
        Width = 331
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 30
        ParentFont = False
        TabOrder = 10
        OnEnter = edtRef2Enter
        OnKeyDown = edtRef2KeyDown
      end
      object edtTelRef1: TMaskEdit
        Left = 349
        Top = 156
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!\(99\)9999\-9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 9
        OnEnter = edtTelRef1Enter
        OnKeyDown = edtTelRef1KeyDown
      end
      object edtTelRef2: TMaskEdit
        Left = 350
        Top = 197
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!\(99\)9999\-9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 11
        OnEnter = edtTelRef2Enter
        OnKeyDown = edtTelRef2KeyDown
      end
      object Panel1: TPanel
        Left = 0
        Top = 464
        Width = 792
        Height = 89
        Align = alBottom
        BevelInner = bvLowered
        Color = clNavy
        TabOrder = 17
        object pnMensForm10: TPanel
          Left = 2
          Top = 2
          Width = 788
          Height = 36
          Align = alClient
          BevelOuter = bvNone
          Color = clTeal
          TabOrder = 1
          object Label49: TLabel
            Left = 17
            Top = 14
            Width = 20
            Height = 13
            Caption = 'Ctrl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel7: TBevel
            Left = 42
            Top = 7
            Width = 420
            Height = 25
            Shape = bsFrame
          end
          object Label53: TLabel
            Left = 71
            Top = 11
            Width = 8
            Height = 13
            Caption = '&L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 80
            Top = 12
            Width = 31
            Height = 13
            Caption = 'impar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label71: TLabel
            Left = 150
            Top = 12
            Width = 20
            Height = 13
            Caption = 'Z->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label70: TLabel
            Left = 171
            Top = 12
            Width = 103
            Height = 13
            Caption = 'Retornar cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label64: TLabel
            Left = 302
            Top = 12
            Width = 20
            Height = 13
            Caption = 'X->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label65: TLabel
            Left = 323
            Top = 12
            Width = 113
            Height = 13
            Caption = 'Prosseguir cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label84: TLabel
            Left = 509
            Top = 13
            Width = 26
            Height = 13
            Caption = 'F3->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label85: TLabel
            Left = 535
            Top = 13
            Width = 73
            Height = 13
            Caption = 'Novo cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label75: TLabel
            Left = 630
            Top = 13
            Width = 26
            Height = 13
            Caption = 'F5->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label74: TLabel
            Left = 656
            Top = 13
            Width = 104
            Height = 13
            Caption = 'Salvar refer'#234'ncias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnMensForm11: TPanel
          Left = 2
          Top = 2
          Width = 788
          Height = 36
          Align = alClient
          BevelOuter = bvNone
          Color = clTeal
          TabOrder = 2
          object Label2: TLabel
            Left = 17
            Top = 13
            Width = 20
            Height = 13
            Caption = 'Ctrl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel10: TBevel
            Left = 42
            Top = 6
            Width = 420
            Height = 25
            Shape = bsFrame
          end
          object Label86: TLabel
            Left = 56
            Top = 11
            Width = 8
            Height = 13
            Caption = '&L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label87: TLabel
            Left = 65
            Top = 11
            Width = 31
            Height = 13
            Caption = 'impar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label88: TLabel
            Left = 112
            Top = 12
            Width = 20
            Height = 13
            Caption = 'Z->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label89: TLabel
            Left = 132
            Top = 12
            Width = 103
            Height = 13
            Caption = 'Retornar cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label90: TLabel
            Left = 526
            Top = 13
            Width = 26
            Height = 13
            Caption = 'F3->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label91: TLabel
            Left = 553
            Top = 13
            Width = 36
            Height = 13
            Caption = 'Incluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label92: TLabel
            Left = 598
            Top = 13
            Width = 26
            Height = 13
            Caption = 'F4->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label93: TLabel
            Left = 625
            Top = 13
            Width = 39
            Height = 13
            Caption = 'Excluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label94: TLabel
            Left = 675
            Top = 13
            Width = 26
            Height = 13
            Caption = 'F5->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label95: TLabel
            Left = 702
            Top = 13
            Width = 37
            Height = 13
            Caption = 'Salvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label96: TLabel
            Left = 238
            Top = 12
            Width = 14
            Height = 13
            Caption = 'Im'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label97: TLabel
            Left = 252
            Top = 11
            Width = 9
            Height = 13
            Caption = '&P'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label98: TLabel
            Left = 262
            Top = 12
            Width = 24
            Height = 13
            Caption = 'rimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label101: TLabel
            Left = 304
            Top = 12
            Width = 94
            Height = 13
            Caption = 'ancelar inclus'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label102: TLabel
            Left = 295
            Top = 12
            Width = 9
            Height = 13
            Caption = '&C'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label100: TLabel
            Left = 420
            Top = 12
            Width = 29
            Height = 13
            Caption = 'utros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label99: TLabel
            Left = 410
            Top = 12
            Width = 10
            Height = 13
            Caption = '&O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 38
          Width = 788
          Height = 49
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object btnIncluir2: TSpeedButton
            Left = 195
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Incluir novo cliente'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnIncluir2Click
          end
          object btnCancelainclusao2: TSpeedButton
            Left = 245
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Cancela inclus'#227'o'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnCancelainclusao2Click
          end
          object btnExcluir2: TSpeedButton
            Left = 295
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Excluir cliente'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnExcluir2Click
          end
          object btnSalvar2: TSpeedButton
            Left = 497
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Salvar cadastro do cliente'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnSalvar2Click
          end
          object btnImprimir2: TSpeedButton
            Left = 355
            Top = 5
            Width = 91
            Height = 40
            Cursor = crHandPoint
            Hint = 'Imprimir clientes'
            Caption = 'Todos'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = btnImprimir2Click
          end
          object btnImpIndiv2: TSpeedButton
            Left = 345
            Top = 5
            Width = 113
            Height = 40
            Cursor = crHandPoint
            Hint = 'Imprimir cliente individual'
            Caption = 'Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnImpIndiv2Click
          end
          object BitBtnProsseguir2: TBitBtn
            Left = 567
            Top = 8
            Width = 209
            Height = 34
            Caption = 'Prosseguir Cadastro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtnProsseguir2Click
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0136020136020136020136020136
              02013602013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A0401360203860903990B
              039F0C03A10C03A10C039F0C03980B038109013602013602FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A04034A04038F0A03
              A40C03A40C039F0C039F0C039F0C039F0C039F0C039F0C03A40C03A40C03880A
              013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06690C0469
              0C06A51304A30F039E0C039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0C039E0C03A40C039D0C025B05013602FF00FFFF00FFFF00FFFF00FFFF00FF
              06690C0569100AAB1F08A51906A014049F0F049F0F049F0F039E0C039E0C039E
              0C039E0C039E0C039E0C039E0C039E0C039F0C039F0C025705013602FF00FFFF
              00FFFF00FFFF00FF06690C0EAB2A0CA7250AA41F049F0F049F0F049F0F049F0F
              0DA61E2BB53BEBF8EEFFFFFF8ED996039E0C039E0C039E0C039E0C03A10C0399
              0B013602FF00FFFF00FFFF00FF06690C0F952B11B0340EA92B0EA92B0DA7260E
              A92809A41C13AA2810A72375D182FFFFFFFFFFFFFFFFFF8BD992039E0C039E0C
              039E0C039E0C03A50C037A08013602FF00FFFF00FF06690C16B44113AC3711AA
              3216AC3916AF3D16AF3E18AD3716AB2F13AA292CB540C7EECEFCFEFCFFFFFFFF
              FFFF8BD992039E0C039E0C039E0C039F0C039E0C013602FF00FF039E0C118F31
              1AB64A16AF3E16AF3E16AF3E13AC351CB0401DB03B1AAF3517AC2F13AB2A29B5
              3DABE5B4E5F7E7FFFFFFFFFFFF8BD992039E0C039E0C039E0C03A50C026B0701
              3602039E0C19A9471CB44E19B14719B14719B14728B64E25B44721B2411EB03C
              1BAF3517AC3014AB2B2BB5406DCF7DFFFFFFFFFFFFFFFFFF4EC45A039E0C039E
              0C03A10C03880A013602039E0C20B25122B6551CB24E1CB24EA7E5BBC2EDD0C1
              EDCEC0EBCCBFEBCABDEAC9BCEAC6BBEAC5B8E9C1D8F3DCFFFFFFFFFFFFFFFFFF
              FFFFFF4EC25A039E0C039E0C03990B013602039E0C2EBA5E31BC631FB4521FB4
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF039E0C039E0C039F0C013602039E0C3EC06C
              47C57524B65624B656F0FBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFF0FBF3D9F3DEFFFFFFFFFFFFFFFFFFFFFFFFC6EDCB039E0C039E0C039E0C01
              3602039E0C47C27267D08E34BC6434BC644CC67860CE875ECB835CCB8059CA7D
              56C97753C77346C26442C15F89DA9CFFFFFFFFFFFFFFFFFFB7E9BF16AA28039E
              0C039F0C03930B013602039E0C40BB6683D9A452C97D38BF6838BF6837BF6736
              BF6434BC5F30BB5B2DBA562AB7502DB852AAE5BAFFFFFFFFFFFFFFFFFF99E0A6
              13AA280FA723039E0D03A30C037F09013602039E0C2BAA4888DCA986DAA535BD
              6538BF6838BF6838BF6836BD6434BC6031BB5C44C26BD8F3E0FFFFFFFFFFFFFF
              FFFF95DDA50CA7250AA52008A31905A01104A50E026006013602FF00FF039E0C
              6BD091ADE6C46ED3932BBA5C38BF6838BF6838BF6836BD6534BC608CDCA7FFFF
              FFFFFFFFFFFFFF98E0AB11AA320FA92C0CA7250AA41D07A518059911013602FF
              00FFFF00FF039E0C37B5579DE2B8B5E9C967CF8C38BF6838BF6838BF6838BF68
              36BD655FCC84FFFFFFFFFFFF70D18E16AD3F13AD3911AB310EA7280CA6230AAC
              1F046B0C013602FF00FFFF00FFFF00FF039E0C5AC980B7EACABBEBCE73D49638
              BF6838BF6838BF6838BF6837BD6635BC6232BC5D2FBA5918B04415AD3D12AB35
              10A92E0FAF2C098E1C034A04FF00FFFF00FFFF00FFFF00FF039E0C189F2A67CF
              8CBAEACCCAEFD897E0B25DCC863ABF6929B85A22B5541FB4521FB45221B55324
              B65222B54C19B04114B23A0E9D2906680D034A04FF00FFFF00FFFF00FFFF00FF
              FF00FF039E0C189F2959C97EA3E3BCCAEFD8C1EDD1A0E2B87FD8A068D08E5CCB
              8458CA8158CA814FC77A38C06722BA5010982F06680D06690CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF039E0C039E0C35B5536CD1919AE1B6B1E9C6
              B5E9C9ABE6C19DE2B788DAA76CD3934AC9792AB4570F842706680D06680DFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF039E0C03
              9E0C28AC4141BB6351C57755C77D4EC5773EBB6528A749138B2906680D06690C
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            Spacing = 10
          end
          object botao_sair: TPanel
            Left = 696
            Top = 13
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
          object BitBtnRetornar: TBitBtn
            Left = 16
            Top = 8
            Width = 140
            Height = 34
            Caption = 'Retornar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtnRetornarClick
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0136020136020136020136020136
              02013602013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A0401360203860903990B
              039F0C03A10C03A10C039F0C03980B038109013602013602FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A04034A04038F0A03
              A40C03A40C039F0C039F0C039F0C039F0C039F0C039F0C03A40C03A40C03880A
              013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06690C0469
              0C06A51304A30F039E0C039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0C039E0C03A40C039D0C025B05013602FF00FFFF00FFFF00FFFF00FFFF00FF
              06690C0569100AAB1F08A51906A014049F0F049F0F049F0F039E0C039E0C039E
              0C039E0C039E0C039E0C039E0C039E0C039F0C039F0C025705013602FF00FFFF
              00FFFF00FFFF00FF06690C0EAB2A0CA7250AA41F049F0F049F0F049F0F049F0F
              93DD9EFFFFFFEBF8EE27B233059F0F039E0C039E0C039E0C039E0C03A10C0399
              0B013602FF00FFFF00FFFF00FF06690C0F952B11B0340EA92B0EA92B049F0F04
              9F0F049F0F98DEA4FFFFFFFFFFFFFFFFFF70D07B06A113039E0C039E0C039E0C
              039E0C039E0C03A50C037A08013602FF00FFFF00FF06690C16B44113AC3711AA
              3216AB37049F0F049F0F9CE0AAFFFFFFFFFFFFFCFEFCC7EECE25B23609A31703
              9E0C039E0C039E0C039E0C039E0C039F0C039E0C013602FF00FF039E0C118F31
              1AB64A16AF3E16AF3E16AF3E049F0FA0E1B1FFFFFFFFFFFFE7F7EAAFE6B829B5
              3D0EA61F0BA51C039E0C039E0C039E0C039E0C039E0C039E0C03A50C026B0701
              3602039E0C19A9471CB44E19B14719B14719B1476ED08AFFFFFFFFFFFFFFFFFF
              78D48B32B84A14AB2B11A9250EA6200CA51C09A31807A11406A111039E0C039E
              0C03A10C03880A013602039E0C20B25122B6551CB24E1CB24E74D392FFFFFFFF
              FFFFFFFFFFFFFFFFDAF3E1BBEAC5BBEAC5BAE9C2B7E9C0B7E9BFB6E7BCB5E7BB
              B4E7BA8FDA96039E0C039E0C03990B013602039E0C2EBA5E31BC631FB4521FB4
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF039E0C039E0C039F0C013602039E0C3EC06C
              47C57524B65624B656D4F2E0FFFFFFFFFFFFFFFFFFFFFFFFDCF4E3F2FBF4FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF8EE039E0C039E0C039E0C01
              3602039E0C47C27267D08E34BC6434BC6441C26FC6EED5FFFFFFFFFFFFFFFFFF
              92DDA949C46946C2644DC56949C46346C15D42C05941BD543DBD4F22B033039E
              0C039F0C03930B013602039E0C40BB6683D9A452C97D38BF6838BF6837BF67AB
              E6C0FFFFFFFFFFFFFFFFFFADE6BF2DB85223B44520B13F1DB03919AD3416AC2D
              13AA280FA723039E0D03A30C037F09013602039E0C2BAA4888DCA986DAA535BD
              6538BF6838BF6838BF68ABE6C0FFFFFFFFFFFFFFFFFFD8F3E03EC05F23B44611
              AA300EA92B0CA7250AA52008A31905A01104A50E026006013602FF00FF039E0C
              6BD091ADE6C46ED3932BBA5C38BF6838BF6838BF68ABE6C1FFFFFFFFFFFFFFFF
              FF89DAA128B64C13AC3711AA320FA92C0CA7250AA41D07A518059911013602FF
              00FFFF00FF039E0C37B5579DE2B8B5E9C967CF8C38BF6838BF6838BF6838BF68
              79D59AFFFFFFFFFFFF5ACB7E2CB75216AD3F13AD3911AB310EA7280CA6230AAC
              1F046B0C013602FF00FFFF00FFFF00FF039E0C5AC980B7EACABBEBCE73D49638
              BF6838BF6838BF6838BF6837BD6635BC6232BC5D2FBA5918B04415AD3D12AB35
              10A92E0FAF2C098E1C034A04FF00FFFF00FFFF00FFFF00FF039E0C189F2A67CF
              8CBAEACCCAEFD897E0B25DCC863ABF6929B85A22B5541FB4521FB45221B55324
              B65222B54C19B04114B23A0E9D2906680D034A04FF00FFFF00FFFF00FFFF00FF
              FF00FF039E0C189F2959C97EA3E3BCCAEFD8C1EDD1A0E2B87FD8A068D08E5CCB
              8458CA8158CA814FC77A38C06722BA5010982F06680D06690CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF039E0C039E0C35B5536CD1919AE1B6B1E9C6
              B5E9C9ABE6C19DE2B788DAA76CD3934AC9792AB4570F842706680D06680DFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF039E0C03
              9E0C28AC4141BB6351C57755C77D4EC5773EBB6528A749138B2906680D06690C
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Spacing = 20
          end
        end
      end
      object pnTipoCad2: TPanel
        Left = -1
        Top = 434
        Width = 792
        Height = 30
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
      end
      object edtSpc: TMaskEdit
        Left = 124
        Top = 323
        Width = 48
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        TabOrder = 14
        Visible = False
        OnEnter = edtSpcEnter
        OnExit = edtSpcExit
        OnKeyDown = edtSpcKeyDown
      end
      object edtCFun: TMaskEdit
        Left = 451
        Top = 323
        Width = 42
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        TabOrder = 15
        Visible = False
        OnEnter = edtCFunEnter
        OnExit = edtCFunExit
        OnKeyDown = edtCFunKeyDown
      end
      object edtTPro: TMaskEdit
        Left = 668
        Top = 323
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        TabOrder = 16
        Visible = False
        OnEnter = edtTProEnter
        OnExit = edtTProExit
        OnKeyDown = edtTProKeyDown
      end
      object pnDtca: TPanel
        Left = 140
        Top = 404
        Width = 93
        Height = 22
        BevelInner = bvLowered
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 19
      end
      object pnUltc: TPanel
        Left = 331
        Top = 404
        Width = 93
        Height = 22
        BevelInner = bvLowered
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 20
      end
      object pnQtdc: TPanel
        Left = 538
        Top = 404
        Width = 56
        Height = 22
        BevelInner = bvLowered
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 21
      end
      object edtPDC: TMaskEdit
        Left = 124
        Top = 302
        Width = 48
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        TabOrder = 13
        Visible = False
        OnEnter = edtPDCEnter
        OnKeyDown = edtPDCKeyDown
      end
      object pnValidade: TPanel
        Left = 660
        Top = 404
        Width = 93
        Height = 22
        BevelInner = bvLowered
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
      end
      object edtRamal: TMaskEdit
        Left = 625
        Top = 70
        Width = 61
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentFont = False
        TabOrder = 23
        Text = '     '
        OnEnter = edtRamalEnter
        OnKeyDown = edtRamalKeyDown
      end
      object pnDSPC: TPanel
        Left = 176
        Top = 324
        Width = 93
        Height = 21
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
        Visible = False
      end
      object pnSaldoDevedor: TPanel
        Left = 461
        Top = 112
        Width = 89
        Height = 21
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 25
      end
      object btnDadosComp: TBitBtn
        Left = 16
        Top = 262
        Width = 328
        Height = 25
        Cursor = crHandPoint
        Caption = 'Dados complementares para pessoa jur'#237'dica'
        TabOrder = 26
        Visible = False
        OnClick = btnDadosCompClick
      end
      object edtLivre: TMaskEdit
        Left = 20
        Top = 303
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        TabOrder = 27
        OnEnter = edtLivreEnter
        OnKeyDown = edtLivreKeyDown
      end
      object btnOutrasObservacoes: TBitBtn
        Left = 545
        Top = 239
        Width = 60
        Height = 22
        Cursor = crHandPoint
        Caption = '&Outras'
        TabOrder = 28
        OnClick = btnOutrasObservacoesClick
      end
    end
    object pagina3: TTabSheet
      Caption = 'Contrato'
      OnEnter = pagina3Enter
      object Bevel2: TBevel
        Left = 3
        Top = 5
        Width = 382
        Height = 177
        Shape = bsFrame
      end
      object Label36: TLabel
        Left = 16
        Top = 23
        Width = 66
        Height = 13
        Caption = 'N'#186' contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 232
        Top = 23
        Width = 62
        Height = 13
        Caption = 'Nota fiscal'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label39: TLabel
        Left = 316
        Top = 23
        Width = 30
        Height = 13
        Caption = 'S'#233'rie'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label41: TLabel
        Left = 16
        Top = 98
        Width = 46
        Height = 13
        Caption = 'Avalista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label42: TLabel
        Left = 16
        Top = 138
        Width = 49
        Height = 13
        Caption = 'Portador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel4: TBevel
        Left = 3
        Top = 183
        Width = 382
        Height = 138
        Shape = bsFrame
      end
      object Label43: TLabel
        Left = 16
        Top = 190
        Width = 34
        Height = 13
        Caption = 'Valor '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 89
        Top = 190
        Width = 85
        Height = 13
        Caption = 'Valor (entrada)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 15
        Top = 228
        Width = 33
        Height = 13
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label46: TLabel
        Left = 15
        Top = 268
        Width = 67
        Height = 13
        Caption = 'N'#186' parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 90
        Top = 268
        Width = 30
        Height = 13
        Caption = 'Fator'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object btnGerarPrestacoes: TSpeedButton
        Left = 64
        Top = 345
        Width = 232
        Height = 26
        Cursor = crHandPoint
        Caption = 'Gerar Presta'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnGerarPrestacoesClick
      end
      object Label48: TLabel
        Left = 677
        Top = 335
        Width = 96
        Height = 13
        Caption = 'Total Financiado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel13: TBevel
        Left = 387
        Top = 5
        Width = 405
        Height = 395
        Shape = bsFrame
      end
      object Label153: TLabel
        Left = 9
        Top = -1
        Width = 155
        Height = 13
        Caption = #218'ltimo contrato do cliente: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbUltimo: TLabel
        Left = 163
        Top = -1
        Width = 43
        Height = 13
        Caption = '000001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label162: TLabel
        Left = 88
        Top = 23
        Width = 25
        Height = 13
        Caption = 'Loja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label163: TLabel
        Left = 135
        Top = 23
        Width = 79
        Height = 13
        Caption = 'Data contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCalc: TSpeedButton
        Left = 700
        Top = 350
        Width = 87
        Height = 25
        Cursor = crHandPoint
        Glyph.Data = {
          5A0D0000424D5A0D0000000000003600000028000000260000001D0000000100
          180000000000240D0000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C080800080800080000080000080000080000080000080
          0000800000800000800000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000008000008000008000008000
          00800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C08080
          00FFFF0080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          808000808000808000808000808000808000808000800000000000C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFFFF8080008080000000
          0000000000000080800000000000000000000080800000000000000000000080
          8000000000000000000000808000000000000000000000000000000000000000
          000000808000808000800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0808000FFFF00808000808000FFFFFFC0C0C0000000808000FFFF
          FFC0C0C0000000808000FFFFFFC0C0C0000000808000FFFFFFC0C0C000000080
          8000FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000808000808000800000
          000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFFFF
          808000808000FFFFFFFFFFFF000000808000FFFFFFFFFFFF000000808000FFFF
          FFFFFFFF000000808000FFFFFFFFFFFF000000808000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000808000808000800000000000C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFF00808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0808000FFFFFF808000808000000000000000000000808000000000000000
          0000008080000000000000000000008080000000000000000000008080000000
          00000000000000808000000000000000000000808000808000800000000000C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFF0080800080
          8000FFFFFFC0C0C0000000808000FFFFFFC0C0C0000000808000FFFFFFC0C0C0
          000000808000FFFFFFC0C0C0000000808000FFFFFFC0C0C0000000808000FFFF
          FFC0C0C0000000808000808000800000000000C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C0808000FFFFFF808000808000FFFFFFFFFFFF00000080
          8000FFFFFFFFFFFF000000808000FFFFFFFFFFFF000000808000FFFFFFFFFFFF
          000000808000FFFFFFFFFFFF000000808000FFFFFFFFFFFF0000008080008080
          00800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C08080
          00FFFF0080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          808000808000808000808000808000808000808000800000000000C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFFFF8080008080000000
          0000000000000080800000000000000000000080800000000000000000000080
          8000000000000000000000808000000000000000000000808000000000000000
          000000808000808000800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0808000FFFF00808000808000FFFFFFC0C0C0000000808000FFFF
          FFC0C0C0000000808000FFFFFFC0C0C0000000808000FFFFFFC0C0C000000080
          8000FFFFFFC0C0C0000000808000FFFFFFC0C0C0000000808000808000800000
          000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFFFF
          808000808000FFFFFFFFFFFF000000808000FFFFFFFFFFFF000000808000FFFF
          FFFFFFFF000000808000FFFFFFFFFFFF000000808000FFFFFFFFFFFF00000080
          8000FFFFFFFFFFFF000000808000808000800000000000C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFF00808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0808000FFFFFF808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080008080
          00808000808000808000808000808000808000808000808000800000000000C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFF0080800080
          8000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFC0C0C08080008080008080008080008080008080
          00808000808000808000808000800000000000C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C0808000FFFFFF808000808000000000C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C08080008080008080008080008080008080008080008080008080008080
          00800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C08080
          00FFFF0080800080800000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000808000808000808000
          808000808000808000808000808000808000808000800000000000C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0808000FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00800000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C08080008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000}
        OnClick = btnCalcClick
      end
      object lbl_Cpf: TLabel
        Left = 396
        Top = 296
        Width = 100
        Height = 13
        Caption = 'CNPJ do cliente: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_banco: TLabel
        Left = 396
        Top = 310
        Width = 96
        Height = 13
        Caption = 'Banco/ag'#234'ncia: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label77: TLabel
        Left = 16
        Top = 61
        Width = 78
        Height = 13
        Caption = 'Qtde. Boletas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnAval: TPanel
        Left = 89
        Top = 112
        Width = 288
        Height = 21
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
      end
      object edtCodAval: TMaskEdit
        Left = 16
        Top = 112
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        TabOrder = 5
        Text = '      '
        OnDblClick = edtCodAvalDblClick
        OnEnter = edtCodAvalEnter
        OnExit = edtCodAvalExit
        OnKeyDown = edtCodAvalKeyDown
      end
      object edtContrato: TMaskEdit
        Left = 16
        Top = 37
        Width = 71
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentFont = False
        TabOrder = 0
        Text = '      '
        OnEnter = edtContratoEnter
        OnExit = edtContratoExit
        OnKeyDown = edtContratoKeyDown
      end
      object edtNotaFiscal: TMaskEdit
        Left = 231
        Top = 37
        Width = 85
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        EditMask = '!99999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        TabOrder = 3
        Text = '        '
        Visible = False
        OnEnter = edtNotaFiscalEnter
        OnKeyDown = edtNotaFiscalKeyDown
      end
      object edtSerieNota: TMaskEdit
        Left = 317
        Top = 37
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        EditMask = 'c;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnEnter = edtSerieNotaEnter
        OnKeyDown = edtSerieNotaKeyDown
      end
      object edtPortador: TMaskEdit
        Left = 15
        Top = 152
        Width = 71
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        TabOrder = 6
        Text = '    '
        OnDblClick = edtPortadorDblClick
        OnEnter = edtPortadorEnter
        OnExit = edtPortadorExit
        OnKeyDown = edtPortadorKeyDown
      end
      object pnPortador: TPanel
        Left = 89
        Top = 152
        Width = 288
        Height = 21
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
      end
      object edtValMerc: TMaskEdit
        Left = 16
        Top = 204
        Width = 71
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnEnter = edtValMercEnter
        OnExit = edtValMercExit
        OnKeyDown = edtValMercKeyDown
        OnKeyUp = edtValMercKeyUp
      end
      object edtValEntrada: TMaskEdit
        Left = 89
        Top = 204
        Width = 87
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnEnter = edtValEntradaEnter
        OnExit = edtValEntradaExit
        OnKeyDown = edtValEntradaKeyDown
        OnKeyUp = edtValEntradaKeyUp
      end
      object edtPlano: TMaskEdit
        Left = 15
        Top = 241
        Width = 71
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 9
        Text = '   '
        OnDblClick = edtPlanoDblClick
        OnEnter = edtPlanoEnter
        OnExit = edtPlanoExit
        OnKeyDown = edtPlanoKeyDown
      end
      object pnPlano: TPanel
        Left = 89
        Top = 241
        Width = 288
        Height = 21
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
      end
      object edtNumParc: TMaskEdit
        Left = 15
        Top = 282
        Width = 71
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!99;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 10
        Text = '  '
        OnEnter = edtNumParcEnter
        OnExit = edtNumParcExit
        OnKeyDown = edtNumParcKeyDown
      end
      object edtFator: TMaskEdit
        Left = 89
        Top = 282
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        Visible = False
        OnEnter = edtFatorEnter
        OnExit = edtFatorExit
        OnKeyDown = edtFatorKeyDown
        OnKeyUp = edtFatorKeyUp
      end
      object grade_lancamentos: TStringGrid
        Left = 390
        Top = 8
        Width = 395
        Height = 285
        TabStop = False
        Color = clWhite
        ColCount = 4
        DefaultColWidth = 75
        DefaultRowHeight = 20
        RowCount = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnDrawCell = grade_lancamentosDrawCell
        OnGetEditMask = grade_lancamentosGetEditMask
        OnKeyDown = grade_lancamentosKeyDown
        OnKeyPress = grade_lancamentosKeyPress
        OnSetEditText = grade_lancamentosSetEditText
        ColWidths = (
          75
          73
          77
          75)
        RowHeights = (
          20
          20
          20
          23)
      end
      object pnTotalDevido: TPanel
        Left = 652
        Top = 297
        Width = 132
        Height = 37
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '0,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
      end
      object Panel3: TPanel
        Left = 0
        Top = 450
        Width = 792
        Height = 103
        Align = alBottom
        BevelInner = bvLowered
        Color = clTeal
        TabOrder = 16
        object pnMensForm20: TPanel
          Left = 2
          Top = 2
          Width = 788
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Color = clTeal
          TabOrder = 1
          object Bevel9: TBevel
            Left = 47
            Top = 12
            Width = 420
            Height = 25
            Shape = bsFrame
          end
          object Label54: TLabel
            Left = 20
            Top = 18
            Width = 20
            Height = 13
            Caption = 'Ctrl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label72: TLabel
            Left = 280
            Top = 19
            Width = 20
            Height = 13
            Caption = 'Z->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label73: TLabel
            Left = 301
            Top = 19
            Width = 103
            Height = 13
            Caption = 'Retornar cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 58
            Top = 17
            Width = 8
            Height = 13
            Caption = '&L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label55: TLabel
            Left = 67
            Top = 18
            Width = 31
            Height = 13
            Caption = 'impar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label62: TLabel
            Left = 184
            Top = 18
            Width = 14
            Height = 13
            Caption = 'Im'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label63: TLabel
            Left = 198
            Top = 18
            Width = 9
            Height = 13
            Caption = '&P'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label66: TLabel
            Left = 208
            Top = 19
            Width = 64
            Height = 13
            Caption = 'rimir carnet'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label80: TLabel
            Left = 520
            Top = 9
            Width = 73
            Height = 13
            Caption = 'Novo cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label81: TLabel
            Left = 494
            Top = 9
            Width = 26
            Height = 13
            Caption = 'F3->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label58: TLabel
            Left = 634
            Top = 9
            Width = 108
            Height = 13
            Caption = 'Confirmar Cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 608
            Top = 9
            Width = 26
            Height = 13
            Caption = 'F5->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 105
            Top = 18
            Width = 21
            Height = 13
            Caption = 'H->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 127
            Top = 18
            Width = 50
            Height = 13
            Caption = 'Cheques'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbF8mens: TLabel
            Left = 521
            Top = 31
            Width = 54
            Height = 13
            Caption = 'Consultar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lbF8: TLabel
            Left = 495
            Top = 31
            Width = 26
            Height = 13
            Caption = 'F8->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
        end
        object pnMensForm22: TPanel
          Left = 2
          Top = 2
          Width = 788
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Color = clTeal
          TabOrder = 2
          object Label123: TLabel
            Left = 20
            Top = 20
            Width = 20
            Height = 13
            Caption = 'Ctrl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel12: TBevel
            Left = 47
            Top = 11
            Width = 420
            Height = 25
            Shape = bsFrame
          end
          object Label124: TLabel
            Left = 57
            Top = 16
            Width = 8
            Height = 13
            Caption = '&L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label125: TLabel
            Left = 67
            Top = 17
            Width = 31
            Height = 13
            Caption = 'impar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label128: TLabel
            Left = 478
            Top = 18
            Width = 26
            Height = 13
            Caption = 'F3->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label129: TLabel
            Left = 503
            Top = 18
            Width = 36
            Height = 13
            Caption = 'Incluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label130: TLabel
            Left = 545
            Top = 18
            Width = 26
            Height = 13
            Caption = 'F4->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label131: TLabel
            Left = 571
            Top = 18
            Width = 39
            Height = 13
            Caption = 'Excluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label132: TLabel
            Left = 617
            Top = 18
            Width = 26
            Height = 13
            Caption = 'F5->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label133: TLabel
            Left = 643
            Top = 18
            Width = 37
            Height = 13
            Caption = 'Salvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label134: TLabel
            Left = 242
            Top = 18
            Width = 14
            Height = 13
            Caption = 'Im'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label135: TLabel
            Left = 255
            Top = 16
            Width = 11
            Height = 16
            Caption = '&P'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label136: TLabel
            Left = 266
            Top = 18
            Width = 24
            Height = 13
            Caption = 'rimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label137: TLabel
            Left = 418
            Top = 17
            Width = 10
            Height = 13
            Caption = '&O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label138: TLabel
            Left = 428
            Top = 18
            Width = 29
            Height = 13
            Caption = 'utros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label139: TLabel
            Left = 313
            Top = 18
            Width = 94
            Height = 13
            Caption = 'ancelar inclus'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label140: TLabel
            Left = 303
            Top = 17
            Width = 9
            Height = 13
            Caption = '&C'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbF8mens2: TLabel
            Left = 715
            Top = 19
            Width = 54
            Height = 13
            Caption = 'Consultar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lbF82: TLabel
            Left = 689
            Top = 19
            Width = 26
            Height = 13
            Caption = 'F8->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label60: TLabel
            Left = 128
            Top = 18
            Width = 103
            Height = 13
            Caption = 'Retornar cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label61: TLabel
            Left = 108
            Top = 18
            Width = 20
            Height = 13
            Caption = 'Z->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 52
          Width = 788
          Height = 49
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object btnSalvar1: TSpeedButton
            Left = 339
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Salvar cadastro do contrato'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnSalvar1Click
          end
          object btnImpCarnet: TSpeedButton
            Left = 392
            Top = 5
            Width = 161
            Height = 20
            Cursor = crHandPoint
            Hint = 'Impress'#227'o do carnet de pgto.'
            Caption = 'Imprimir carnet'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000010000008000000080
              0000008000000080000000800000008000000080000000800000007F0000007F
              0000007D0000007B0000007900000175010002700200036A030004630400055A
              0500084F08000A450A000C3C0C000F330F00102E10001329130015241500171F
              17001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
              2100222222002323230024242400252525002626260027272700282828002929
              29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
              3100323232003333330034343400353535003636360037373700383838003939
              39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
              4100424242004E4E4E005A5A5A0066666600717171007B7B7B00858585009594
              9400A3A3A200BDBBB900D8D4D000E9E5E000F4F0EB00FAF6F100FCF9F500FDFA
              F700FEFBF800FEFCF800FEFCF900FEFCF900FEFCF800FEFBF800FEFBF600FEF9
              F300FEF9F200FEF8F000FEF7EE00FEF6EC00FEF5EB00FEF4E900FEF4E800FEF3
              E700FEF3E600FEF3E500FEF2E400FEF1E200FEF0E000FEEFDE00FEEEDB00FEEC
              D700FEEBD400FEE9D100FEE9D000FEE8CE00FEE7CD00FEE7CD00FEE6CC00FEE6
              CB00FEE5CA00FEE5C900FEE4C800FEE3C500FEE2C300FEE1C100FEE0C000FEDF
              BE00FEDEBC00FEDDB900FEDBB500FED9B200FED8AF00FED7AE00FED6AC00FED5
              AA00FED4A900FED4A800FED3A600FED3A600FDD2A400FDD1A300FDD1A100FDD1
              A200FDD1A200FCD1A300FCD2A400FBD2A600F8D2A800F5D1AA00F0CFAB00E8CB
              AB00DEC5A900CFBBA500BAAE9F00ACA49B00A29E99009D9A9800989898009999
              99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
              A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
              A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
              B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600BBABBB00C0A1C000C597
              C500CA8DCA00CE84CE00D574D500DD5EDD00E93FE900F127F100F813F800FB09
              FB00FD04FD00FE01FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
              FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
              FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
              FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE01FE00FE02FE00FE03
              FE00FE04FD00FD06FC00FD08FA00F70FEC00EF17D700E423BB00D6339500C549
              5E00BD5A2D00BD631300C1660900C4670400C6670100C8680000C8680000C968
              0000C9680000C9680000C9680000C9680000C9680000C9680000C9680000C968
              0000C9680000C9680000C9680000C9680000C9680000C9680000D1D1D1D1D1D1
              D1D1D1D1D1D1D1D1D1D1D1D1F7F7F7F7F7F7F7F7F7F7F7F7D1D1D1F76C73777A
              7C7D818588888888F7D1D1F7696F73767A7C7D8185888888F7D1D1F768070707
              0707070707070788F7D1D1F764686A6C73777A7C7E818588F7D1D1F75F656707
              07070707077E8185F7D1D1F75C5F6567696C73777A7C7E81F7D1D1F759070707
              070707070707077EF7D1D1F752595C606568696C73777A7CF7D1D1F755535907
              070707070773777AF7D1D1F7545453595C5F6567696C7377F7D1D1F754070707
              0707070707070773F7D1D1F75454545553595C5F65676A6CF7D1D1D1F7F7F7F7
              F7F7F7F7F7F7F7F7D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnImpCarnetClick
          end
          object btnIncluir1: TSpeedButton
            Left = 189
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Incluir novo contrato'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnIncluir1Click
          end
          object btnCancelainclusao1: TSpeedButton
            Left = 239
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Cancela inclus'#227'o'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnCancelainclusao1Click
          end
          object btnExcluir1: TSpeedButton
            Left = 289
            Top = 5
            Width = 50
            Height = 40
            Cursor = crHandPoint
            Hint = 'Excluir contrato'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnExcluir1Click
          end
          object btnImpProposta: TSpeedButton
            Left = 392
            Top = 25
            Width = 161
            Height = 20
            Cursor = crHandPoint
            Hint = 'Impress'#227'o do carnet de pgto.'
            Caption = 'Imprimir proposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFA0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
              A0A0A0A0A0A0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0A0A0FDFDFDFE
              FEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA0A0A0FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFA0A0A0FBFBFB9292929292929292929292929292929292
              92FBFBFBA0A0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0A0A0F8F8F8FA
              FAFAF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8A0A0A0FF00FFA0A0A0A0A0A0
              A0A0A0A0A0A0A0A0A0A0A0A0F5F5F59292929292929292929292929292929292
              92F5F5F5A0A0A0FF00FFA0A0A0FDFDFDFEFEFEFDFDFDFDFDFDA0A0A0F3F3F3F4
              F4F4F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3A0A0A0FF00FFA0A0A0FBFBFB
              929292929292929292A0A0A0F1F1F19292929292929292929292929292929292
              92F1F1F1A0A0A0FF00FFA0A0A0F8F8F8FAFAFAF8F8F8F8F8F8A0A0A0EEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEED9D9D9D8D8D8C8C8C8A0A0A0FF00FFA0A0A0F5F5F5
              929292929292929292A0A0A0EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBB5B5B5B6B6
              B6BEBEBEB3B3B3FF00FFA0A0A0F3F3F3F4F4F4F3F3F3F3F3F3A0A0A0E8E8E8E8
              E8E8E8E8E8E8E8E8E5E5E5B7B7B7FEFEFEB3B3B3FF00FFFF00FFA0A0A0F1F1F1
              929292929292929292A0A0A0E7E7E7E7E7E7E7E7E7E7E7E7D4D4D4C3C3C3B3B3
              B3FF00FFFF00FFFF00FFA0A0A0EEEEEEEEEEEEEEEEEEEEEEEEA0A0A0A0A0A0A0
              A0A0A0A0A0A0A0A0A0A0A0B3B3B3FF00FFFF00FFFF00FFFF00FFA0A0A0EBEBEB
              EBEBEBEBEBEBEBEBEBEBEBEBB5B5B5B6B6B6BEBEBEB3B3B3FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFA0A0A0E8E8E8E8E8E8E8E8E8E8E8E8E5E5E5B7B7B7FE
              FEFEB3B3B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0A0A0E7E7E7
              E7E7E7E7E7E7E7E7E7D4D4D4C3C3C3B3B3B3FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFA0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0B3B3B3FF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnImpPropostaClick
          end
          object BitBtnConfirmar: TBitBtn
            Left = 568
            Top = 8
            Width = 209
            Height = 34
            Caption = 'Confirmar Cadastro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnSalvarGradeClick
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0136020136020136020136020136
              02013602013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A0401360203860903990B
              039F0C03A10C03A10C039F0C03980B038109013602013602FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A04034A04038F0A03
              A40C03A40C039F0C039F0C039F0C039F0C039F0C039F0C03A40C03A40C03880A
              013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06690C0469
              0C06A51304A30F039E0C039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0C039E0C03A40C039D0C025B05013602FF00FFFF00FFFF00FFFF00FFFF00FF
              06690C0569100AAB1F08A51906A014049F0F049F0F049F0F039E0C039E0C039E
              0C039E0C039E0C039E0C039E0C039E0C039F0C039F0C025705013602FF00FFFF
              00FFFF00FFFF00FF06690C0EAB2A0CA7250AA41F049F0F049F0F049F0F049F0F
              0DA61E2BB53BEBF8EEFFFFFF8ED996039E0C039E0C039E0C039E0C03A10C0399
              0B013602FF00FFFF00FFFF00FF06690C0F952B11B0340EA92B0EA92B0DA7260E
              A92809A41C13AA2810A72375D182FFFFFFFFFFFFFFFFFF8BD992039E0C039E0C
              039E0C039E0C03A50C037A08013602FF00FFFF00FF06690C16B44113AC3711AA
              3216AC3916AF3D16AF3E18AD3716AB2F13AA292CB540C7EECEFCFEFCFFFFFFFF
              FFFF8BD992039E0C039E0C039E0C039F0C039E0C013602FF00FF039E0C118F31
              1AB64A16AF3E16AF3E16AF3E13AC351CB0401DB03B1AAF3517AC2F13AB2A29B5
              3DABE5B4E5F7E7FFFFFFFFFFFF8BD992039E0C039E0C039E0C03A50C026B0701
              3602039E0C19A9471CB44E19B14719B14719B14728B64E25B44721B2411EB03C
              1BAF3517AC3014AB2B2BB5406DCF7DFFFFFFFFFFFFFFFFFF4EC45A039E0C039E
              0C03A10C03880A013602039E0C20B25122B6551CB24E1CB24EA7E5BBC2EDD0C1
              EDCEC0EBCCBFEBCABDEAC9BCEAC6BBEAC5B8E9C1D8F3DCFFFFFFFFFFFFFFFFFF
              FFFFFF4EC25A039E0C039E0C03990B013602039E0C2EBA5E31BC631FB4521FB4
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF039E0C039E0C039F0C013602039E0C3EC06C
              47C57524B65624B656F0FBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFF0FBF3D9F3DEFFFFFFFFFFFFFFFFFFFFFFFFC6EDCB039E0C039E0C039E0C01
              3602039E0C47C27267D08E34BC6434BC644CC67860CE875ECB835CCB8059CA7D
              56C97753C77346C26442C15F89DA9CFFFFFFFFFFFFFFFFFFB7E9BF16AA28039E
              0C039F0C03930B013602039E0C40BB6683D9A452C97D38BF6838BF6837BF6736
              BF6434BC5F30BB5B2DBA562AB7502DB852AAE5BAFFFFFFFFFFFFFFFFFF99E0A6
              13AA280FA723039E0D03A30C037F09013602039E0C2BAA4888DCA986DAA535BD
              6538BF6838BF6838BF6836BD6434BC6031BB5C44C26BD8F3E0FFFFFFFFFFFFFF
              FFFF95DDA50CA7250AA52008A31905A01104A50E026006013602FF00FF039E0C
              6BD091ADE6C46ED3932BBA5C38BF6838BF6838BF6836BD6534BC608CDCA7FFFF
              FFFFFFFFFFFFFF98E0AB11AA320FA92C0CA7250AA41D07A518059911013602FF
              00FFFF00FF039E0C37B5579DE2B8B5E9C967CF8C38BF6838BF6838BF6838BF68
              36BD655FCC84FFFFFFFFFFFF70D18E16AD3F13AD3911AB310EA7280CA6230AAC
              1F046B0C013602FF00FFFF00FFFF00FF039E0C5AC980B7EACABBEBCE73D49638
              BF6838BF6838BF6838BF6837BD6635BC6232BC5D2FBA5918B04415AD3D12AB35
              10A92E0FAF2C098E1C034A04FF00FFFF00FFFF00FFFF00FF039E0C189F2A67CF
              8CBAEACCCAEFD897E0B25DCC863ABF6929B85A22B5541FB4521FB45221B55324
              B65222B54C19B04114B23A0E9D2906680D034A04FF00FFFF00FFFF00FFFF00FF
              FF00FF039E0C189F2959C97EA3E3BCCAEFD8C1EDD1A0E2B87FD8A068D08E5CCB
              8458CA8158CA814FC77A38C06722BA5010982F06680D06690CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF039E0C039E0C35B5536CD1919AE1B6B1E9C6
              B5E9C9ABE6C19DE2B788DAA76CD3934AC9792AB4570F842706680D06680DFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF039E0C03
              9E0C28AC4141BB6351C57755C77D4EC5773EBB6528A749138B2906680D06690C
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            Spacing = 10
          end
          object BitBtnRetornar2: TBitBtn
            Left = 17
            Top = 8
            Width = 140
            Height = 34
            Caption = 'Retornar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtnRetornar2Click
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0450070450070450070450070450
              07045007045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C045007089D1509AE18
              09B31909B51909B51909B31909AD18089914045007045007FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C08650C09A51709
              B71A09B71A09B31909B31909B31909B31909B31909B31909B71A09B71A089F16
              045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F83190B83
              190FB8250CB61E09B21909B21909B21909B21909B21909B21909B21909B21909
              B21909B21909B71A09B11906760E045007FF00FFFF00FFFF00FFFF00FFFF00FF
              0F83190E832017BD3513B82D0FB4260CB31F0CB31F0CB31F09B21909B21909B2
              1909B21909B21909B21909B21909B21909B31909B31906720D045007FF00FFFF
              00FFFF00FFFF00FF0F83191DBD421ABA3C16B7340CB31F0CB31F0CB31F0CB31F
              A9E5B2FFFFFFF0FAF23EC34C0EB31F09B21909B21909B21909B21909B51909AE
              18045007FF00FFFF00FFFF00FF0F83191EAA4322C14D1DBB431DBB430CB31F0C
              B31F0CB31FADE6B7FFFFFFFFFFFFFFFFFF8ADB9410B52409B21909B21909B219
              09B21909B21909B81A089313045007FF00FFFF00FF0F831929C45B25BE5121BC
              4B29BD510CB31F0CB31FB0E7BCFFFFFFFFFFFFFDFEFDD4F2D93CC35014B62A09
              B21909B21909B21909B21909B21909B31909B219045007FF00FF09B21921A54A
              2EC66529C05829C05829C0580CB31FB4E8C2FFFFFFFFFFFFEDF9EFC0ECC841C5
              571DB93518B83009B21909B21909B21909B21909B21909B21909B81A07851104
              500709B2192DBB6231C4692DC2622DC2622DC26288DBA1FFFFFFFFFFFFFFFFFF
              91DEA24BC86526BD4321BB3C1DB93619B83015B62B12B5260FB52109B21909B2
              1909B51A089F1604500709B21936C36C38C67030C36930C3698DDDA8FFFFFFFF
              FFFFFFFFFFFFFFFFE3F6E8CAEFD2CAEFD2C9EED0C7EECEC7EECDC6EDCBC5EDCA
              C4EDC9A5E3AB09B21909B21909AE1804500709B21947C9794ACB7D35C46D35C4
              6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF09B21909B21909B31904500709B21958CE86
              62D28E3BC6713BC671DEF5E7FFFFFFFFFFFFFFFFFFFFFFFFE4F7EAF5FCF7FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FAF209B21909B21909B21904
              500709B21962D08B81DBA44DCB7E4DCB7E5CD089D3F2DFFFFFFFFFFFFFFFFFFF
              A8E5BB64D18361D07E68D28364D17D61CF785DCE745BCC6F57CC6A38C14C09B2
              1A09B31909A91804500709B2195ACA809BE2B76DD59552CD8252CD8251CD81BD
              ECCEFFFFFFFFFFFFFFFFFFBFECCD46C86D3AC46036C25932C1532DBF4D28BE45
              24BC401FBA390AB21C09B61908971404500709B21943BC639FE4BB9DE3B84FCC
              7F52CD8252CD8252CD82BDECCEFFFFFFFFFFFFFFFFFFE1F6E758CE7A3AC46121
              BC491DBB431ABA3C17B83613B62D0DB4220BB81D067B0F045007FF00FF09B219
              85DBA7BFECD188DDA943C97752CD8252CD8252CD82BDECCFFFFFFFFFFFFFFFFF
              FFA0E3B53FC66725BE5121BC4B1EBB441ABA3C16B73212B82B0EAE22045007FF
              00FFFF00FF09B21951C572B1E9C8C5EED581DAA352CD8252CD8252CD8252CD82
              92DFAFFFFFFFFFFFFF75D79644C76D28BF5925BF5321BD4A1DBA4019B93916BE
              350C851A045007FF00FFFF00FFFF00FF09B21975D598C7EFD6CAF0D98CDEAB52
              CD8252CD8252CD8252CD8251CC804ECB7C4BCB7848C9742BC15F27BF5723BD4E
              20BB471EC04415A43008650CFF00FFFF00FFFF00FFFF00FF09B2192CB34281DA
              A3C9EFD8D6F3E1ACE7C378D89D54CD8341C87538C56F35C46D35C46D37C56E3B
              C66D38C5672DC15B26C3541DB1410F821C08650CFF00FFFF00FFFF00FFFF00FF
              FF00FF09B2192BB34174D596B6EACBD6F3E1CFF1DCB4E9C897E1B482DBA477D7
              9C73D69973D6996AD49352CE8138C96B20AD480F821C0F8319FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF09B21909B2194FC56E86DCA7AFE8C6C2EED3
              C5EED5BDECCFB1E9C79FE3BA86DDA965D59242C4721F9C3E0F821C0F821CFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09B21909
              B2193FBE5C5BCA7D6CD29070D49569D29058CA7F3FBA6424A2410F821C0F8319
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF09B21909B21909B21909B21909B21909B21909B21909
              B219FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Spacing = 20
          end
          object BitBtn4: TBitBtn
            Left = 567
            Top = 8
            Width = 209
            Height = 34
            Caption = 'Prosseguir Cadastro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtnProsseguir2Click
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0136020136020136020136020136
              02013602013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A0401360203860903990B
              039F0C03A10C03A10C039F0C03980B038109013602013602FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A04034A04038F0A03
              A40C03A40C039F0C039F0C039F0C039F0C039F0C039F0C03A40C03A40C03880A
              013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06690C0469
              0C06A51304A30F039E0C039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0C039E0C03A40C039D0C025B05013602FF00FFFF00FFFF00FFFF00FFFF00FF
              06690C0569100AAB1F08A51906A014049F0F049F0F049F0F039E0C039E0C039E
              0C039E0C039E0C039E0C039E0C039E0C039F0C039F0C025705013602FF00FFFF
              00FFFF00FFFF00FF06690C0EAB2A0CA7250AA41F049F0F049F0F049F0F049F0F
              0DA61E2BB53BEBF8EEFFFFFF8ED996039E0C039E0C039E0C039E0C03A10C0399
              0B013602FF00FFFF00FFFF00FF06690C0F952B11B0340EA92B0EA92B0DA7260E
              A92809A41C13AA2810A72375D182FFFFFFFFFFFFFFFFFF8BD992039E0C039E0C
              039E0C039E0C03A50C037A08013602FF00FFFF00FF06690C16B44113AC3711AA
              3216AC3916AF3D16AF3E18AD3716AB2F13AA292CB540C7EECEFCFEFCFFFFFFFF
              FFFF8BD992039E0C039E0C039E0C039F0C039E0C013602FF00FF039E0C118F31
              1AB64A16AF3E16AF3E16AF3E13AC351CB0401DB03B1AAF3517AC2F13AB2A29B5
              3DABE5B4E5F7E7FFFFFFFFFFFF8BD992039E0C039E0C039E0C03A50C026B0701
              3602039E0C19A9471CB44E19B14719B14719B14728B64E25B44721B2411EB03C
              1BAF3517AC3014AB2B2BB5406DCF7DFFFFFFFFFFFFFFFFFF4EC45A039E0C039E
              0C03A10C03880A013602039E0C20B25122B6551CB24E1CB24EA7E5BBC2EDD0C1
              EDCEC0EBCCBFEBCABDEAC9BCEAC6BBEAC5B8E9C1D8F3DCFFFFFFFFFFFFFFFFFF
              FFFFFF4EC25A039E0C039E0C03990B013602039E0C2EBA5E31BC631FB4521FB4
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF039E0C039E0C039F0C013602039E0C3EC06C
              47C57524B65624B656F0FBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFF0FBF3D9F3DEFFFFFFFFFFFFFFFFFFFFFFFFC6EDCB039E0C039E0C039E0C01
              3602039E0C47C27267D08E34BC6434BC644CC67860CE875ECB835CCB8059CA7D
              56C97753C77346C26442C15F89DA9CFFFFFFFFFFFFFFFFFFB7E9BF16AA28039E
              0C039F0C03930B013602039E0C40BB6683D9A452C97D38BF6838BF6837BF6736
              BF6434BC5F30BB5B2DBA562AB7502DB852AAE5BAFFFFFFFFFFFFFFFFFF99E0A6
              13AA280FA723039E0D03A30C037F09013602039E0C2BAA4888DCA986DAA535BD
              6538BF6838BF6838BF6836BD6434BC6031BB5C44C26BD8F3E0FFFFFFFFFFFFFF
              FFFF95DDA50CA7250AA52008A31905A01104A50E026006013602FF00FF039E0C
              6BD091ADE6C46ED3932BBA5C38BF6838BF6838BF6836BD6534BC608CDCA7FFFF
              FFFFFFFFFFFFFF98E0AB11AA320FA92C0CA7250AA41D07A518059911013602FF
              00FFFF00FF039E0C37B5579DE2B8B5E9C967CF8C38BF6838BF6838BF6838BF68
              36BD655FCC84FFFFFFFFFFFF70D18E16AD3F13AD3911AB310EA7280CA6230AAC
              1F046B0C013602FF00FFFF00FFFF00FF039E0C5AC980B7EACABBEBCE73D49638
              BF6838BF6838BF6838BF6837BD6635BC6232BC5D2FBA5918B04415AD3D12AB35
              10A92E0FAF2C098E1C034A04FF00FFFF00FFFF00FFFF00FF039E0C189F2A67CF
              8CBAEACCCAEFD897E0B25DCC863ABF6929B85A22B5541FB4521FB45221B55324
              B65222B54C19B04114B23A0E9D2906680D034A04FF00FFFF00FFFF00FFFF00FF
              FF00FF039E0C189F2959C97EA3E3BCCAEFD8C1EDD1A0E2B87FD8A068D08E5CCB
              8458CA8158CA814FC77A38C06722BA5010982F06680D06690CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF039E0C039E0C35B5536CD1919AE1B6B1E9C6
              B5E9C9ABE6C19DE2B788DAA76CD3934AC9792AB4570F842706680D06680DFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF039E0C03
              9E0C28AC4141BB6351C57755C77D4EC5773EBB6528A749138B2906680D06690C
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
              9E0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            Spacing = 10
          end
        end
      end
      object pnTipoCad3: TPanel
        Left = 0
        Top = 428
        Width = 792
        Height = 22
        Align = alBottom
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
      end
      object btnEdtGrade: TButton
        Left = 393
        Top = 350
        Width = 90
        Height = 25
        Cursor = crHandPoint
        Caption = '&Editar'
        Enabled = False
        TabOrder = 19
        TabStop = False
        OnClick = btnEdtGradeClick
      end
      object btnCancelGrade: TButton
        Left = 484
        Top = 350
        Width = 95
        Height = 25
        Cursor = crHandPoint
        Caption = 'C&ancelar'
        Enabled = False
        TabOrder = 20
        TabStop = False
        OnClick = btnCancelGradeClick
      end
      object btnSalvarGrade: TButton
        Left = 580
        Top = 350
        Width = 119
        Height = 25
        Cursor = crHandPoint
        Caption = '&Salvar edi'#231#227'o '
        Enabled = False
        TabOrder = 21
        TabStop = False
        OnClick = btnSalvarGradeClick
      end
      object edtLoja: TMaskEdit
        Left = 88
        Top = 37
        Width = 46
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '   '
        OnEnter = edtLojaEnter
        OnExit = edtLojaExit
        OnKeyDown = edtLojaKeyDown
      end
      object edtDatContrato: TMaskEdit
        Left = 135
        Top = 37
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        EditMask = '99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = edtDatContratoEnter
        OnExit = edtDatContratoExit
        OnKeyDown = edtDatContratoKeyDown
      end
      object Button1: TButton
        Left = 393
        Top = 375
        Width = 394
        Height = 21
        Cursor = crHandPoint
        Hint = 'Consulta da Posi'#231#227'o Financeira do cliente'
        Caption = 'Consulta &Financeira'
        TabOrder = 22
        TabStop = False
        Visible = False
        OnClick = Button1Click
      end
      object edtQtdeBoleta: TMaskEdit
        Left = 16
        Top = 75
        Width = 70
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        TabOrder = 23
        OnKeyDown = edtQtdeBoletaKeyDown
        OnKeyPress = edtQtdeBoletaKeyPress
      end
      object btnEditarBoletas: TBitBtn
        Left = 104
        Top = 73
        Width = 113
        Height = 25
        Caption = 'Editar Boletas'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
        OnClick = btnEditarBoletasClick
      end
    end
    object pagina5: TTabSheet
      Caption = 'Foto'
      ImageIndex = 3
      object Bevel8: TBevel
        Left = 1
        Top = 3
        Width = 789
        Height = 442
      end
      object BitBtn3: TBitBtn
        Left = 320
        Top = 388
        Width = 128
        Height = 33
        Caption = 'Capturar Foto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn3Click
        Glyph.Data = {
          B6030000424DB60300000000000076000000280000001F0000001A0000000100
          0800000000004003000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00080808080808
          0808080808080808080808080808080808080808080808080800080808080808
          0808080700000000000708080808080808080808080808080800080808000000
          0000000708080808080700000000000000000000000808080800080800000000
          0000080800000000000808000000000000000000000008080800080000000000
          0008070007070707070007080000000000000000000000080800080000000000
          0008000707070707070700080000000000000000000000000800080000000000
          0800070707070707070707000800000000000000000008000800080000000000
          0800070708070707070707000800000000000000000008000800080000000000
          080007070F070707070707000800000000000000000008000800080000000000
          080007070F080707070707000800000000000000000008000800080000000000
          08000707080F0707070707000800000000000000000008000800080000000000
          0008000707080F08070700080700000000000000000008000800080000000000
          0008070007070707070007080000000000000000000008000800080000000000
          0000080800000000000808070700000000000000000008000800080000000000
          0000000008080808080F0F000000000000000000000008000800080000000000
          00000000070F0F0F0F0F0000000000000000000000000000080008000F080808
          080808080000080808080F00080808080808080808070000080008000F080808
          080808080808000000000008080808080808080808070700080008000F080808
          08080808080808080808080808080808080808080807070008000808000F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0807000800080808000800
          0000070808000707070707070007080000000000070808000800080808080000
          0F0700000000080808080808000000000F0F0F07000000080800080808080808
          0000070808080008080808000700080800000000070808080800080808080808
          08080808080808000F0F0F070008080808080808080808080800080808080808
          0808080808080808000000000808080808080808080808080800080808080808
          0808080808080808080808080808080808080808080808080800}
      end
      object Panel55: TPanel
        Left = 208
        Top = 68
        Width = 354
        Height = 290
        TabOrder = 1
        object foto_cliente: TImage
          Left = 1
          Top = 1
          Width = 352
          Height = 288
          Align = alClient
          Proportional = True
          Stretch = True
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 451
        Width = 793
        Height = 100
        BevelInner = bvLowered
        TabOrder = 2
        object Panel7: TPanel
          Left = 2
          Top = 2
          Width = 789
          Height = 42
          Align = alTop
          AutoSize = True
          TabOrder = 0
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 787
            Height = 40
            Alignment = taRightJustify
            BevelOuter = bvNone
            Color = clTeal
            TabOrder = 0
            object Label76: TLabel
              Left = 13
              Top = 13
              Width = 20
              Height = 13
              Caption = 'Ctrl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel19: TBevel
              Left = 41
              Top = 6
              Width = 420
              Height = 25
              Shape = bsFrame
            end
            object Label141: TLabel
              Left = 48
              Top = 12
              Width = 20
              Height = 13
              Caption = 'Z->'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label142: TLabel
              Left = 68
              Top = 12
              Width = 104
              Height = 13
              Caption = 'Retornar Cadastro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label225: TLabel
              Left = 486
              Top = 13
              Width = 26
              Height = 13
              Caption = 'F3->'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label226: TLabel
              Left = 512
              Top = 13
              Width = 36
              Height = 13
              Caption = 'Incluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label227: TLabel
              Left = 558
              Top = 13
              Width = 26
              Height = 13
              Caption = 'F4->'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label228: TLabel
              Left = 584
              Top = 13
              Width = 39
              Height = 13
              Caption = 'Excluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label229: TLabel
              Left = 635
              Top = 13
              Width = 26
              Height = 13
              Caption = 'F5->'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label230: TLabel
              Left = 661
              Top = 13
              Width = 37
              Height = 13
              Caption = 'Salvar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label231: TLabel
              Left = 180
              Top = 12
              Width = 14
              Height = 13
              Caption = 'Im'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label232: TLabel
              Left = 194
              Top = 11
              Width = 9
              Height = 13
              Caption = '&P'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label233: TLabel
              Left = 204
              Top = 12
              Width = 24
              Height = 13
              Caption = 'rimir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label234: TLabel
              Left = 352
              Top = 12
              Width = 10
              Height = 13
              Caption = '&O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label235: TLabel
              Left = 362
              Top = 12
              Width = 29
              Height = 13
              Caption = 'utros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label236: TLabel
              Left = 247
              Top = 12
              Width = 94
              Height = 13
              Caption = 'ancelar inclus'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label237: TLabel
              Left = 238
              Top = 12
              Width = 9
              Height = 13
              Caption = '&C'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object BitBtn1: TBitBtn
          Left = 11
          Top = 59
          Width = 140
          Height = 34
          Caption = 'Retornar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtnRetornar2Click
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0450070450070450070450070450
            07045007045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C045007089D1509AE18
            09B31909B51909B51909B31909AD18089914045007045007FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C08650C09A51709
            B71A09B71A09B31909B31909B31909B31909B31909B31909B71A09B71A089F16
            045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F83190B83
            190FB8250CB61E09B21909B21909B21909B21909B21909B21909B21909B21909
            B21909B21909B71A09B11906760E045007FF00FFFF00FFFF00FFFF00FFFF00FF
            0F83190E832017BD3513B82D0FB4260CB31F0CB31F0CB31F09B21909B21909B2
            1909B21909B21909B21909B21909B21909B31909B31906720D045007FF00FFFF
            00FFFF00FFFF00FF0F83191DBD421ABA3C16B7340CB31F0CB31F0CB31F0CB31F
            A9E5B2FFFFFFF0FAF23EC34C0EB31F09B21909B21909B21909B21909B51909AE
            18045007FF00FFFF00FFFF00FF0F83191EAA4322C14D1DBB431DBB430CB31F0C
            B31F0CB31FADE6B7FFFFFFFFFFFFFFFFFF8ADB9410B52409B21909B21909B219
            09B21909B21909B81A089313045007FF00FFFF00FF0F831929C45B25BE5121BC
            4B29BD510CB31F0CB31FB0E7BCFFFFFFFFFFFFFDFEFDD4F2D93CC35014B62A09
            B21909B21909B21909B21909B21909B31909B219045007FF00FF09B21921A54A
            2EC66529C05829C05829C0580CB31FB4E8C2FFFFFFFFFFFFEDF9EFC0ECC841C5
            571DB93518B83009B21909B21909B21909B21909B21909B21909B81A07851104
            500709B2192DBB6231C4692DC2622DC2622DC26288DBA1FFFFFFFFFFFFFFFFFF
            91DEA24BC86526BD4321BB3C1DB93619B83015B62B12B5260FB52109B21909B2
            1909B51A089F1604500709B21936C36C38C67030C36930C3698DDDA8FFFFFFFF
            FFFFFFFFFFFFFFFFE3F6E8CAEFD2CAEFD2C9EED0C7EECEC7EECDC6EDCBC5EDCA
            C4EDC9A5E3AB09B21909B21909AE1804500709B21947C9794ACB7D35C46D35C4
            6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF09B21909B21909B31904500709B21958CE86
            62D28E3BC6713BC671DEF5E7FFFFFFFFFFFFFFFFFFFFFFFFE4F7EAF5FCF7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FAF209B21909B21909B21904
            500709B21962D08B81DBA44DCB7E4DCB7E5CD089D3F2DFFFFFFFFFFFFFFFFFFF
            A8E5BB64D18361D07E68D28364D17D61CF785DCE745BCC6F57CC6A38C14C09B2
            1A09B31909A91804500709B2195ACA809BE2B76DD59552CD8252CD8251CD81BD
            ECCEFFFFFFFFFFFFFFFFFFBFECCD46C86D3AC46036C25932C1532DBF4D28BE45
            24BC401FBA390AB21C09B61908971404500709B21943BC639FE4BB9DE3B84FCC
            7F52CD8252CD8252CD82BDECCEFFFFFFFFFFFFFFFFFFE1F6E758CE7A3AC46121
            BC491DBB431ABA3C17B83613B62D0DB4220BB81D067B0F045007FF00FF09B219
            85DBA7BFECD188DDA943C97752CD8252CD8252CD82BDECCFFFFFFFFFFFFFFFFF
            FFA0E3B53FC66725BE5121BC4B1EBB441ABA3C16B73212B82B0EAE22045007FF
            00FFFF00FF09B21951C572B1E9C8C5EED581DAA352CD8252CD8252CD8252CD82
            92DFAFFFFFFFFFFFFF75D79644C76D28BF5925BF5321BD4A1DBA4019B93916BE
            350C851A045007FF00FFFF00FFFF00FF09B21975D598C7EFD6CAF0D98CDEAB52
            CD8252CD8252CD8252CD8251CC804ECB7C4BCB7848C9742BC15F27BF5723BD4E
            20BB471EC04415A43008650CFF00FFFF00FFFF00FFFF00FF09B2192CB34281DA
            A3C9EFD8D6F3E1ACE7C378D89D54CD8341C87538C56F35C46D35C46D37C56E3B
            C66D38C5672DC15B26C3541DB1410F821C08650CFF00FFFF00FFFF00FFFF00FF
            FF00FF09B2192BB34174D596B6EACBD6F3E1CFF1DCB4E9C897E1B482DBA477D7
            9C73D69973D6996AD49352CE8138C96B20AD480F821C0F8319FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF09B21909B2194FC56E86DCA7AFE8C6C2EED3
            C5EED5BDECCFB1E9C79FE3BA86DDA965D59242C4721F9C3E0F821C0F821CFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09B21909
            B2193FBE5C5BCA7D6CD29070D49569D29058CA7F3FBA6424A2410F821C0F8319
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF09B21909B21909B21909B21909B21909B21909B21909
            B219FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Spacing = 20
        end
        object Panel8: TPanel
          Left = 696
          Top = 60
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
          TabOrder = 2
          OnClick = botao_sairClick
        end
      end
    end
  end
  object menu: TMainMenu
    Left = 739
    Top = 336
    object Lancamentos: TMenuItem
      Caption = 'Formulario0'
      Visible = False
      object Salvarocliente1: TMenuItem
        Caption = 'Salvar o cliente'
        ShortCut = 116
        OnClick = Salvarocliente1Click
      end
      object Salvarocontrato1: TMenuItem
        Caption = 'Salvar o contrato'
        ShortCut = 16500
        OnClick = Salvarocontrato1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Mudaralojaedatadocontraot1: TMenuItem
        Caption = 'Mudar loja de cadastro'
        ShortCut = 16461
        Visible = False
      end
      object Novocontrato1: TMenuItem
        Caption = 'Novo contrato'
        ShortCut = 114
        OnClick = Novocontrato1Click
      end
      object Gerarprestacoes1: TMenuItem
        Caption = 'Gerar prestacoes'
        Visible = False
        OnClick = Gerarprestacoes1Click
      end
      object Imprimircarnet1: TMenuItem
        Caption = 'Imprimir carnet'
        ShortCut = 16464
        Visible = False
      end
      object Gerarcheques1: TMenuItem
        Caption = 'Gerar cheques'
        ShortCut = 16456
        OnClick = Gerarcheques1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Editarvalores1: TMenuItem
        Caption = 'Editar valores'
        ShortCut = 16453
        OnClick = Editarvalores1Click
      end
      object Cancelarediodevalores1: TMenuItem
        Caption = 'Cancelar edi'#231#227'o de valores'
        ShortCut = 16451
        OnClick = Cancelarediodevalores1Click
      end
      object Salvarvaloreseditados1: TMenuItem
        Caption = 'Salvar valores editados'
        ShortCut = 16467
        OnClick = Salvarvaloreseditados1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Prosseguecadastro1: TMenuItem
        Caption = 'Prossegue cadastro'
        ShortCut = 16472
        OnClick = Prosseguecadastro1Click
      end
      object Retornacadastro1: TMenuItem
        Caption = 'Retorna cadastro'
        ShortCut = 16474
        OnClick = Retornacadastro1Click
      end
      object Limpareditspagina11: TMenuItem
        Caption = 'Limpar edits'
        ShortCut = 16460
        Visible = False
        OnClick = Limpareditspagina11Click
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
    object Formulario11: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Incluircliente1: TMenuItem
        Caption = 'Incluir cliente'
        OnClick = Incluircliente1Click
      end
      object Cancelarinclusaocliente1: TMenuItem
        Caption = 'Cancelar inclusao cliente'
        Enabled = False
        OnClick = Cancelarinclusaocliente1Click
      end
      object Exclusaodocliente1: TMenuItem
        Caption = 'Exclus'#227'o do cliente'
        Enabled = False
        OnClick = Exclusaodocliente1Click
      end
      object Salvarcliente1: TMenuItem
        Caption = 'Salvar cliente'
        Enabled = False
        OnClick = Salvarcliente1Click
      end
      object Limparcadastro1: TMenuItem
        Caption = 'Limpar cadastro'
        OnClick = Limparcadastro1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Imprimirclienteindividual1: TMenuItem
        Caption = 'Imprimir cliente individual'
        Enabled = False
        OnClick = Imprimirclienteindividual1Click
      end
      object Imprimirclientescadastrados1: TMenuItem
        Caption = 'Imprimir clientes cadastrados'
        OnClick = Imprimirclientescadastrados1Click
      end
      object Outrosrelatrios1: TMenuItem
        Caption = 'Outros relat'#243'rios'
        OnClick = Outrosrelatrios1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SAIR2: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR2Click
      end
    end
    object Formulario21: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Incluircontrato1: TMenuItem
        Caption = 'Incluir contrato'
        OnClick = Incluircontrato1Click
      end
      object Cancelarinclusaocontrato1: TMenuItem
        Caption = 'Cancelar inclusao contrato'
        Enabled = False
        OnClick = Cancelarinclusaocontrato1Click
      end
      object Exclusodocontrato1: TMenuItem
        Caption = 'Exclus'#227'o do contrato'
        Enabled = False
        OnClick = Exclusodocontrato1Click
      end
      object Salvarcontrato1: TMenuItem
        Caption = 'Salvar contrato'
        Enabled = False
        OnClick = Salvarcontrato1Click
      end
      object Limparcadastro2: TMenuItem
        Caption = 'Limpar cadastro'
        OnClick = Limparcadastro2Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Imprimircontratoindividual1: TMenuItem
        Caption = 'Imprimir contrato individual'
        Enabled = False
        OnClick = Imprimircontratoindividual1Click
      end
      object Imprimircontratoscadastrados1: TMenuItem
        Caption = 'Imprimir contratos cadastrados'
        OnClick = Imprimircontratoscadastrados1Click
      end
      object Outrosrelatrios2: TMenuItem
        Caption = 'Outros relat'#243'rios'
        OnClick = Outrosrelatrios2Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Editarvalores2: TMenuItem
        Caption = 'Editar valores'
        OnClick = Editarvalores2Click
      end
      object Cancelarediodevalores2: TMenuItem
        Caption = 'Cancelar edi'#231#227'o de valores'
        OnClick = Cancelarediodevalores2Click
      end
      object Salvarvaloreseditados2: TMenuItem
        Caption = 'Salvar valores editados'
        OnClick = Salvarvaloreseditados2Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object SAIR3: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR3Click
      end
    end
  end
  object PopUpMenuHistorico: TPopupMenu
    Left = 711
    Top = 336
    object Relatriode1: TMenuItem
      Caption = 'Posi'#231#227'o financeira - contratos liquidados'
      OnClick = Relatriode1Click
    end
    object Posiofinanceiracontratosemaberto1: TMenuItem
      Caption = 'Posi'#231#227'o financeira - contratos em aberto'
      OnClick = Posiofinanceiracontratosemaberto1Click
    end
    object Consultadecheques1: TMenuItem
      Caption = 'Consulta de cheques'
      OnClick = Consultadecheques1Click
    end
  end
end
