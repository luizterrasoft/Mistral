object frm_ConclueVenda: Tfrm_ConclueVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Fechamento da venda'
  ClientHeight = 510
  ClientWidth = 792
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 510
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvNone
    Color = clNavy
    TabOrder = 0
    object Label3: TLabel
      Left = 68
      Top = 187
      Width = 102
      Height = 20
      Caption = 'Novo total  $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 44
      Top = 222
      Width = 128
      Height = 20
      Caption = 'Saldo a pagar $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Gauge1: TGauge
      Left = 16
      Top = 472
      Width = 281
      Height = 25
      ForeColor = clBlue
      Progress = 0
      Visible = False
    end
    object Label23: TLabel
      Left = 24
      Top = 456
      Width = 146
      Height = 13
      Caption = 'Progresso do processamento...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label24: TLabel
      Left = 19
      Top = 17
      Width = 55
      Height = 13
      Caption = 'Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 74
      Top = 122
      Width = 98
      Height = 20
      Caption = 'Desconto %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel4: TBevel
      Left = 11
      Top = 64
      Width = 294
      Height = 9
      Shape = bsTopLine
    end
    object Label14: TLabel
      Left = 33
      Top = 152
      Width = 137
      Height = 20
      Caption = 'Valor desconto $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 61
      Top = 86
      Width = 109
      Height = 20
      Caption = 'Total venda $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 12
      Top = 253
      Width = 294
      Height = 9
      Shape = bsTopLine
    end
    object lblStatus: TLabel
      Left = 3
      Top = 266
      Width = 310
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = '[Pagamento à vista não efetuado]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Bevel5: TBevel
      Left = 11
      Top = 292
      Width = 294
      Height = 9
      Shape = bsTopLine
    end
    object pnSaldoAPagar: TPanel
      Left = 178
      Top = 212
      Width = 127
      Height = 33
      Alignment = taRightJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnTotalVenda: TPanel
      Left = 178
      Top = 177
      Width = 127
      Height = 35
      Alignment = taRightJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtVendedor: TMaskEdit
      Left = 19
      Top = 31
      Width = 62
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
      TabOrder = 2
      Text = '    '
      OnDblClick = edtVendedorDblClick
      OnEnter = edtVendedorEnter
      OnExit = edtVendedorExit
      OnKeyDown = edtVendedorKeyDown
    end
    object pnVendedor: TPanel
      Left = 83
      Top = 30
      Width = 223
      Height = 23
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtDesc: TMaskEdit
      Left = 178
      Top = 112
      Width = 127
      Height = 30
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnEnter = edtDescEnter
      OnExit = edtDescExit
      OnKeyDown = edtDescKeyDown
      OnKeyUp = edtDescKeyUp
    end
    object pnVendaReal: TPanel
      Left = 178
      Top = 76
      Width = 127
      Height = 35
      Alignment = taRightJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object painelTroco: TPanel
      Left = 19
      Top = 305
      Width = 289
      Height = 136
      BevelOuter = bvNone
      Color = clNavy
      TabOrder = 6
      Visible = False
      object Label16: TLabel
        Left = 92
        Top = 105
        Width = 61
        Height = 20
        Caption = 'Troco $'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 14
        Top = 40
        Width = 139
        Height = 20
        Caption = 'Valor a receber $'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label34: TLabel
        Left = 53
        Top = 73
        Width = 97
        Height = 20
        Caption = 'Recebido  $'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 78
        Top = 8
        Width = 207
        Height = 20
        Caption = 'Recebimento valor à vista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnTroco_: TPanel
        Left = 159
        Top = 94
        Width = 127
        Height = 33
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '0,00'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtRecebido_: TMaskEdit
        Left = 159
        Top = 63
        Width = 127
        Height = 30
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnEnter = edtRecebido_Enter
        OnExit = edtRecebido_Exit
        OnKeyDown = edtRecebido_KeyDown
        OnKeyUp = edtRecebido_KeyUp
      end
      object edtValor_: TMaskEdit
        Left = 159
        Top = 32
        Width = 127
        Height = 30
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnEnter = edtValor_Enter
        OnExit = edtValor_Exit
        OnKeyDown = edtValor_KeyDown
        OnKeyUp = edtValor_KeyUp
      end
    end
    object edtTotalDesc: TMaskEdit
      Left = 178
      Top = 144
      Width = 127
      Height = 30
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      OnEnter = edtTotalDescEnter
      OnExit = edtTotalDescExit
      OnKeyDown = edtTotalDescKeyDown
      OnKeyUp = edtTotalDescKeyUp
    end
  end
  object Panel2: TPanel
    Left = 313
    Top = 0
    Width = 479
    Height = 510
    Align = alClient
    Color = clBlack
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 477
      Height = 96
      Align = alTop
      BevelOuter = bvNone
      Color = clNavy
      TabOrder = 0
      object Bevel1: TBevel
        Left = 8
        Top = 16
        Width = 469
        Height = 9
        Shape = bsTopLine
      end
      object lblForma: TLabel
        Left = 16
        Top = 9
        Width = 149
        Height = 16
        Caption = 'Forma de pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValor: TLabel
        Left = 16
        Top = 68
        Width = 58
        Height = 20
        Caption = 'Valor $'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodForma: TMaskEdit
        Left = 16
        Top = 27
        Width = 57
        Height = 30
        EditMask = '!99;1; '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        Text = '  '
        OnDblClick = edtCodFormaDblClick
        OnEnter = edtCodFormaEnter
        OnExit = edtCodFormaExit
        OnKeyDown = edtCodFormaKeyDown
      end
      object pnForma: TPanel
        Left = 74
        Top = 27
        Width = 343
        Height = 30
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtValor: TMaskEdit
        Left = 78
        Top = 60
        Width = 127
        Height = 30
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnChange = edtValorChange
        OnEnter = edtValorEnter
        OnExit = edtValorExit
        OnKeyDown = edtValorKeyDown
        OnKeyUp = edtValorKeyUp
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 289
      Width = 477
      Height = 22
      Align = alTop
      Caption = 'Formas de pagamento da venda'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object grade: TDBGrid
      Left = 1
      Top = 311
      Width = 477
      Height = 157
      Cursor = crHandPoint
      Align = alClient
      Color = clWhite
      DataSource = ds
      FixedColor = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = gradeDblClick
      OnKeyDown = gradeKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'ordem'
          Title.Caption = 'Ord'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeForma'
          Title.Caption = 'Forma de pagamento'
          Width = 237
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorPago'
          Title.Caption = 'Valor $'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Caption = 'A Receber $'
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 1
      Top = 468
      Width = 477
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = clNavy
      TabOrder = 3
      object botao_sair: TPanel
        Left = 384
        Top = 10
        Width = 89
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
      object btnProcessar: TButton
        Left = 224
        Top = 10
        Width = 158
        Height = 23
        Cursor = crHandPoint
        Caption = 'Concluir (F5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnProcessarClick
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 97
      Width = 477
      Height = 192
      Cursor = crHandPoint
      ActivePage = paginaCrediario
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 4
      Visible = False
      object paginaCheque: TTabSheet
        Caption = 'Cheque à vista'
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 469
          Height = 161
          Align = alClient
          BevelOuter = bvNone
          Color = clNavy
          TabOrder = 0
          object Label5: TLabel
            Left = 147
            Top = 9
            Width = 64
            Height = 13
            Caption = 'Cod/banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 165
            Top = 49
            Width = 90
            Height = 13
            Caption = 'Nome do banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 11
            Top = 9
            Width = 20
            Height = 13
            Caption = 'Cpf'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 347
            Top = 8
            Width = 47
            Height = 13
            Caption = 'Agência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 11
            Top = 49
            Width = 87
            Height = 13
            Caption = 'Conta/corrente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 11
            Top = 90
            Width = 103
            Height = 13
            Caption = 'Nome do emitente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 225
            Top = 9
            Width = 108
            Height = 13
            Caption = 'Número do cheque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 356
            Top = 90
            Width = 99
            Height = 13
            Caption = 'Fone do emitente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtCodBanco: TMaskEdit
            Left = 147
            Top = 23
            Width = 76
            Height = 21
            EditMask = '!999;1; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 1
            Text = '   '
            OnDblClick = edtCodBancoDblClick
            OnEnter = edtCodBancoEnter
            OnExit = edtCodBancoExit
            OnKeyDown = edtCodBancoKeyDown
          end
          object edtNomeBanco: TMaskEdit
            Left = 163
            Top = 63
            Width = 294
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 20
            ParentFont = False
            TabOrder = 5
            OnEnter = edtNomeBancoEnter
            OnKeyDown = edtCodBancoKeyDown
          end
          object edtCpf: TMaskEdit
            Left = 11
            Top = 23
            Width = 134
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 11
            ParentFont = False
            TabOrder = 0
            OnEnter = edtCpfEnter
            OnExit = edtCpfExit
            OnKeyDown = edtCpfKeyDown
          end
          object edtAgencia: TMaskEdit
            Left = 347
            Top = 22
            Width = 110
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 3
            OnEnter = edtAgenciaEnter
            OnKeyDown = edtCodBancoKeyDown
          end
          object edtConta: TMaskEdit
            Left = 11
            Top = 63
            Width = 150
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 4
            OnEnter = edtContaEnter
            OnKeyDown = edtCodBancoKeyDown
          end
          object edtNome: TMaskEdit
            Left = 11
            Top = 104
            Width = 340
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 40
            ParentFont = False
            TabOrder = 6
            OnEnter = edtNomeEnter
            OnKeyDown = edtCodBancoKeyDown
          end
          object edtNumero: TMaskEdit
            Left = 225
            Top = 24
            Width = 119
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 2
            OnEnter = edtNumeroEnter
            OnKeyDown = edtCodBancoKeyDown
          end
          object chFlag: TCheckBox
            Left = 303
            Top = 137
            Width = 171
            Height = 17
            Cursor = crHandPoint
            Caption = 'Cheque do próprio cliente'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            State = cbChecked
            TabOrder = 8
          end
          object edtFone: TMaskEdit
            Left = 353
            Top = 104
            Width = 105
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 40
            ParentFont = False
            TabOrder = 7
            OnEnter = edtNomeEnter
            OnKeyDown = edtFoneKeyDown
          end
        end
      end
      object paginaCartao: TTabSheet
        Caption = 'Administradora'
        ImageIndex = 1
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 469
          Height = 161
          Align = alClient
          BevelOuter = bvNone
          Color = clNavy
          TabOrder = 0
          object Label10: TLabel
            Left = 11
            Top = 6
            Width = 84
            Height = 13
            Caption = 'Administradora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 11
            Top = 46
            Width = 72
            Height = 13
            Caption = 'N. do cartão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtCodAdm: TMaskEdit
            Left = 11
            Top = 20
            Width = 76
            Height = 21
            EditMask = '!999;1; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 0
            Text = '   '
            OnDblClick = edtCodAdmDblClick
            OnEnter = edtCodAdmEnter
            OnExit = edtCodAdmExit
            OnKeyDown = edtCodAdmKeyDown
          end
          object pnAdm: TPanel
            Left = 90
            Top = 20
            Width = 319
            Height = 21
            Alignment = taLeftJustify
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object edtCartao: TMaskEdit
            Left = 11
            Top = 60
            Width = 206
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnEnter = edtCartaoEnter
            OnKeyDown = edtCartaoKeyDown
          end
        end
      end
      object paginaCrediario: TTabSheet
        Caption = 'Crediário'
        ImageIndex = 2
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 469
          Height = 161
          Align = alClient
          BevelOuter = bvNone
          Color = clNavy
          TabOrder = 0
          object lblCliente: TLabel
            Left = 51
            Top = 2
            Width = 100
            Height = 13
            Caption = 'Código do cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 203
            Top = 2
            Width = 113
            Height = 13
            Caption = 'Número do contrato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel3: TBevel
            Left = 8
            Top = 39
            Width = 465
            Height = 9
            Shape = bsTopLine
          end
          object Label19: TLabel
            Left = 46
            Top = 85
            Width = 131
            Height = 16
            Caption = 'Total do contrato $'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 71
            Top = 109
            Width = 108
            Height = 16
            Caption = 'Valor Entrada $'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 52
            Top = 137
            Width = 126
            Height = 16
            Caption = 'Valor financiado $'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 14
            Top = 53
            Width = 114
            Height = 16
            Caption = 'Nome do cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtCpf_crediario: TMaskEdit
            Left = 51
            Top = 16
            Width = 150
            Height = 21
            EditMask = '!cccccccccccccc;1; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 14
            ParentFont = False
            TabOrder = 5
            Text = '              '
            Visible = False
            OnEnter = edtCpf_crediarioEnter
            OnExit = edtCpf_crediarioExit
            OnKeyDown = edtCpf_crediarioKeyDown
          end
          object edtCliente: TMaskEdit
            Left = 51
            Top = 16
            Width = 150
            Height = 21
            EditMask = '!999999;1; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 6
            ParentFont = False
            TabOrder = 0
            Text = '      '
            OnDblClick = edtClienteDblClick
            OnEnter = edtClienteEnter
            OnExit = edtClienteExit
            OnKeyDown = edtClienteKeyDown
          end
          object edtContrato: TMaskEdit
            Left = 203
            Top = 16
            Width = 142
            Height = 21
            Color = clWhite
            EditMask = '!999999;1; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
            Text = '      '
            OnEnter = edtContratoEnter
            OnKeyDown = edtContratoKeyDown
          end
          object edtTotalContrato: TMaskEdit
            Left = 203
            Top = 72
            Width = 142
            Height = 27
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnChange = edtTotalContratoChange
            OnEnter = edtTotalContratoEnter
            OnExit = edtTotalContratoExit
            OnKeyDown = edtTotalContratoKeyDown
            OnKeyUp = edtTotalContratoKeyUp
          end
          object edtValorEntrada: TMaskEdit
            Left = 203
            Top = 100
            Width = 142
            Height = 27
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnEnter = edtValorEntradaEnter
            OnExit = edtValorEntradaExit
            OnKeyDown = edtValorEntradaKeyDown
            OnKeyUp = edtValorEntradaKeyUp
          end
          object edtValorFinanciado: TMaskEdit
            Left = 203
            Top = 128
            Width = 142
            Height = 27
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            OnEnter = edtValorFinanciadoEnter
            OnExit = edtValorFinanciadoExit
            OnKeyDown = edtValorFinanciadoKeyDown
            OnKeyUp = edtValorFinanciadoKeyUp
          end
          object edtNome_crediario: TMaskEdit
            Left = 131
            Top = 44
            Width = 334
            Height = 27
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            MaxLength = 40
            ParentFont = False
            TabOrder = 6
            OnEnter = edtNome_crediarioEnter
            OnKeyDown = edtNome_crediarioKeyDown
          end
        end
      end
    end
  end
  object ds: TDataSource
    DataSet = qFormas
    Left = 350
    Top = 362
  end
  object qFormas: TQuery
    OnCalcFields = qFormasCalcFields
    DatabaseName = 'CAIXA'
    SQL.Strings = (
      'SELECT *'
      'FROM VENDAS_FORMA_PAGAMENTO_LOCAL'
      'WHERE (VF_CAIX=:caixa) AND'
      '               (VF_LOJA=:loja) AND'
      '               (VF_VEND=:codigo_venda)')
    Left = 379
    Top = 362
    ParamData = <
      item
        DataType = ftFloat
        Name = 'caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'loja'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'codigo_venda'
        ParamType = ptUnknown
      end>
    object qFormasVF_CAIX: TFloatField
      FieldName = 'VF_CAIX'
      Origin = 'CAIXA.VENDAS_FORMA_PAGAMENTO.VF_CAIX'
    end
    object qFormasVF_LOJA: TFloatField
      FieldName = 'VF_LOJA'
      Origin = 'CAIXA.VENDAS_FORMA_PAGAMENTO.VF_LOJA'
    end
    object qFormasVF_VEND: TFloatField
      FieldName = 'VF_VEND'
      Origin = 'CAIXA.VENDAS_FORMA_PAGAMENTO.VF_VEND'
    end
    object qFormasVF_ORDE: TSmallintField
      FieldName = 'VF_ORDE'
      Origin = 'CAIXA.VENDAS_FORMA_PAGAMENTO.VF_FPGT'
    end
    object qFormasVF_FPGT: TFloatField
      FieldName = 'VF_FPGT'
      Origin = 'CAIXA.VENDAS_FORMA_PAGAMENTO.VF_FPGT'
    end
    object qFormasVF_VALO: TFloatField
      FieldName = 'VF_VALO'
      Origin = 'CAIXA.VENDAS_FORMA_PAGAMENTO.VF_VALO'
    end
    object qFormasnomeForma: TStringField
      FieldKind = fkCalculated
      FieldName = 'nomeForma'
      Calculated = True
    end
    object qFormasvalorPago: TStringField
      FieldKind = fkCalculated
      FieldName = 'valorPago'
      Calculated = True
    end
    object qFormasordem: TStringField
      FieldKind = fkCalculated
      FieldName = 'ordem'
      Calculated = True
    end
    object qFormasaReceber: TStringField
      FieldKind = fkCalculated
      FieldName = 'aReceber'
      Calculated = True
    end
  end
  object MainMenu1: TMainMenu
    Left = 321
    Top = 362
    object Principal1: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Limparedits1: TMenuItem
        Caption = 'Limpar edits'
        OnClick = Limparedits1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Inserirforma1: TMenuItem
        Caption = 'Inserir forma de pagamento'
        OnClick = Inserirforma1Click
      end
      object Inserirformadepagamentovista1: TMenuItem
        Caption = 'Inserir forma de pagamento - À vista'
        OnClick = Inserirformadepagamentovista1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Processarvenda1: TMenuItem
        Caption = 'Processar venda'
        ShortCut = 116
        OnClick = Processarvenda1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
  end
  object timer_lblStatus: TTimer
    Enabled = False
    OnTimer = timer_lblStatusTimer
    Left = 8
    Top = 416
  end
end
