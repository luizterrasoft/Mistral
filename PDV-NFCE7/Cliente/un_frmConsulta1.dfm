object frm_Consulta1: Tfrm_Consulta1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta geral do cliente'
  ClientHeight = 532
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 88
    Width = 784
    Height = 368
    Cursor = crHandPoint
    ActivePage = pagina6
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    OwnerDraw = True
    ParentFont = False
    TabOrder = 0
    OnChange = PageControl1Change
    OnDrawTab = PageControl1DrawTab
    object pagina1: TTabSheet
      Caption = 'Contratos em aberto'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 0
        Top = 28
        Width = 776
        Height = 262
        TabStop = False
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '')
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        OnKeyDown = Memo2KeyDown
      end
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
        object Panel15: TPanel
          Left = 0
          Top = 2
          Width = 81
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label13: TLabel
            Left = 6
            Top = 3
            Width = 15
            Height = 13
            Caption = 'Lj.'
          end
          object Label14: TLabel
            Left = 30
            Top = 3
            Width = 35
            Height = 13
            Caption = 'N'#186' Ctr'
          end
        end
        object Panel16: TPanel
          Left = 83
          Top = 2
          Width = 68
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label15: TLabel
            Left = 14
            Top = 3
            Width = 37
            Height = 13
            Caption = 'Data *'
          end
        end
        object Panel17: TPanel
          Left = 152
          Top = 2
          Width = 104
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label16: TLabel
            Left = 12
            Top = 4
            Width = 82
            Height = 13
            Caption = 'Valor Contrato'
          end
        end
        object Panel18: TPanel
          Left = 257
          Top = 2
          Width = 22
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label17: TLabel
            Left = 2
            Top = 3
            Width = 16
            Height = 13
            Caption = 'Pc'
          end
        end
        object Panel19: TPanel
          Left = 280
          Top = 2
          Width = 88
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label18: TLabel
            Left = 8
            Top = 3
            Width = 73
            Height = 13
            Caption = 'Vencimentos'
          end
        end
        object Panel20: TPanel
          Left = 370
          Top = 2
          Width = 54
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label19: TLabel
            Left = 6
            Top = 3
            Width = 37
            Height = 13
            Caption = 'Atraso'
          end
        end
        object Panel21: TPanel
          Left = 426
          Top = 2
          Width = 85
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label20: TLabel
            Left = 10
            Top = 3
            Width = 61
            Height = 13
            Caption = '$ Parcelas'
          end
        end
        object Panel22: TPanel
          Left = 513
          Top = 2
          Width = 86
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object Label21: TLabel
            Left = 31
            Top = 3
            Width = 32
            Height = 13
            Caption = 'Multa'
          end
        end
        object Panel23: TPanel
          Left = 601
          Top = 2
          Width = 87
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object Label22: TLabel
            Left = 21
            Top = 3
            Width = 31
            Height = 13
            Caption = 'Juros'
          end
        end
        object Panel24: TPanel
          Left = 690
          Top = 2
          Width = 80
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object Label23: TLabel
            Left = 13
            Top = 3
            Width = 49
            Height = 13
            Caption = 'A cobrar'
          end
        end
        object Panel26: TPanel
          Left = 770
          Top = 2
          Width = 15
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object Label50: TLabel
            Left = 3
            Top = -4
            Width = 7
            Height = 13
            Caption = 's'
            Transparent = True
          end
          object Label51: TLabel
            Left = 3
            Top = 3
            Width = 8
            Height = 13
            Caption = 'p'
            Transparent = True
          end
          object Label52: TLabel
            Left = 3
            Top = 11
            Width = 8
            Height = 13
            Caption = 'c'
            Transparent = True
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 290
        Width = 776
        Height = 50
        Align = alBottom
        BevelInner = bvSpace
        BevelOuter = bvSpace
        Color = clTeal
        TabOrder = 2
        object pnDados1: TPanel
          Left = 3
          Top = 3
          Width = 579
          Height = 23
          Alignment = taLeftJustify
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel27: TPanel
          Left = 581
          Top = 0
          Width = 209
          Height = 51
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label28: TLabel
            Left = 4
            Top = 35
            Width = 98
            Height = 13
            Caption = 'Venc. corrigido->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 3
            Top = 19
            Width = 100
            Height = 13
            Caption = 'Venc. s/ juros  ->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 2
            Top = 4
            Width = 101
            Height = 13
            Caption = 'Total em aberto->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnTotab: TPanel
            Left = 102
            Top = 1
            Width = 107
            Height = 18
            Alignment = taRightJustify
            BevelInner = bvRaised
            BevelOuter = bvNone
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object pnTotsemJur: TPanel
            Left = 102
            Top = 18
            Width = 107
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvRaised
            BevelOuter = bvNone
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object pnTotCor: TPanel
            Left = 102
            Top = 34
            Width = 107
            Height = 15
            Alignment = taRightJustify
            BevelInner = bvRaised
            BevelOuter = bvNone
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnDados2: TPanel
          Left = 3
          Top = 26
          Width = 580
          Height = 24
          Alignment = taLeftJustify
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object pagina2: TTabSheet
      Caption = 'Contratos liquidados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object Memo1: TMemo
        Left = 0
        Top = 28
        Width = 776
        Height = 312
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = Memo1KeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 2
          Width = 81
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label4: TLabel
            Left = 6
            Top = 3
            Width = 15
            Height = 13
            Caption = 'Lj.'
          end
          object Label1: TLabel
            Left = 30
            Top = 3
            Width = 37
            Height = 13
            Caption = 'No.Ctr'
          end
        end
        object Panel6: TPanel
          Left = 82
          Top = 2
          Width = 71
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label2: TLabel
            Left = 14
            Top = 3
            Width = 37
            Height = 13
            Caption = 'Data *'
          end
        end
        object Panel7: TPanel
          Left = 155
          Top = 2
          Width = 94
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label3: TLabel
            Left = 5
            Top = 3
            Width = 82
            Height = 13
            Caption = 'Valor Contrato'
          end
        end
        object Panel8: TPanel
          Left = 251
          Top = 2
          Width = 21
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label5: TLabel
            Left = 2
            Top = 3
            Width = 16
            Height = 13
            Caption = 'Pc'
          end
        end
        object Panel9: TPanel
          Left = 273
          Top = 2
          Width = 161
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label6: TLabel
            Left = 6
            Top = 3
            Width = 73
            Height = 13
            Caption = 'Vencimentos'
          end
        end
        object Panel10: TPanel
          Left = 435
          Top = 2
          Width = 68
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label7: TLabel
            Left = 12
            Top = 3
            Width = 42
            Height = 13
            Caption = '$ Parc.'
          end
        end
        object Panel11: TPanel
          Left = 505
          Top = 2
          Width = 72
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label8: TLabel
            Left = 13
            Top = 3
            Width = 41
            Height = 13
            Caption = '$ Pago'
          end
        end
        object Panel12: TPanel
          Left = 580
          Top = 2
          Width = 80
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object Label9: TLabel
            Left = 10
            Top = 3
            Width = 48
            Height = 13
            Caption = 'Dt.Pgto.'
          end
        end
        object Panel13: TPanel
          Left = 662
          Top = 2
          Width = 195
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object Label12: TLabel
            Left = 8
            Top = 3
            Width = 26
            Height = 13
            Caption = 'Dias'
          end
          object Label38: TLabel
            Left = 73
            Top = 3
            Width = 117
            Height = 13
            Caption = 'Cheque (Bco./Num.)'
          end
        end
      end
    end
    object pagina3: TTabSheet
      Caption = 'Cheques pr'#233'-datados'
      ImageIndex = 2
      object Memo3: TMemo
        Left = 0
        Top = 28
        Width = 776
        Height = 312
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = Memo3KeyDown
      end
      object Panel25: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
        object Panel28: TPanel
          Left = 2
          Top = 2
          Width = 63
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label31: TLabel
            Left = 15
            Top = 3
            Width = 37
            Height = 13
            Caption = 'Banco'
          end
        end
        object Panel29: TPanel
          Left = 163
          Top = 2
          Width = 87
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label32: TLabel
            Left = 19
            Top = 3
            Width = 47
            Height = 13
            Caption = 'Ag'#234'ncia'
          end
        end
        object Panel30: TPanel
          Left = 66
          Top = 2
          Width = 96
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label33: TLabel
            Left = 8
            Top = 3
            Width = 62
            Height = 13
            Caption = 'N'#186' Cheque'
          end
        end
        object Panel31: TPanel
          Left = 251
          Top = 2
          Width = 53
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label34: TLabel
            Left = 10
            Top = 3
            Width = 25
            Height = 13
            Caption = 'Loja'
          end
        end
        object Panel32: TPanel
          Left = 305
          Top = 2
          Width = 69
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label35: TLabel
            Left = 12
            Top = 3
            Width = 49
            Height = 13
            Caption = 'Portador'
          end
        end
        object Panel33: TPanel
          Left = 376
          Top = 2
          Width = 82
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label36: TLabel
            Left = 7
            Top = 3
            Width = 73
            Height = 13
            Caption = 'Vencimentos'
          end
        end
        object Panel34: TPanel
          Left = 544
          Top = 2
          Width = 87
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label37: TLabel
            Left = 48
            Top = 3
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
        end
        object Panel35: TPanel
          Left = 633
          Top = 2
          Width = 148
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object Label30: TLabel
            Left = 8
            Top = 3
            Width = 65
            Height = 13
            Caption = 'Devolvido?'
          end
        end
        object Panel46: TPanel
          Left = 460
          Top = 2
          Width = 82
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object Label59: TLabel
            Left = 10
            Top = 3
            Width = 64
            Height = 13
            Caption = 'Pagamento'
          end
        end
      end
    end
    object pagina5: TTabSheet
      Caption = 'Cheques-devolvidos'
      ImageIndex = 4
      object Memo6: TMemo
        Left = 0
        Top = 28
        Width = 776
        Height = 312
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = Memo6KeyDown
      end
      object Panel36: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
        object Label53: TLabel
          Left = 772
          Top = -2
          Width = 7
          Height = 13
          Caption = 's'
          Transparent = True
        end
        object Label57: TLabel
          Left = 772
          Top = 13
          Width = 8
          Height = 13
          Caption = 'c'
          Transparent = True
        end
        object Label58: TLabel
          Left = 772
          Top = 5
          Width = 8
          Height = 13
          Caption = 'p'
          Transparent = True
        end
        object Panel38: TPanel
          Left = 3
          Top = 2
          Width = 63
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label39: TLabel
            Left = 14
            Top = 3
            Width = 37
            Height = 13
            Caption = 'Banco'
          end
        end
        object Panel39: TPanel
          Left = 67
          Top = 2
          Width = 87
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label40: TLabel
            Left = 19
            Top = 3
            Width = 47
            Height = 13
            Caption = 'Ag'#234'ncia'
          end
        end
        object Panel40: TPanel
          Left = 155
          Top = 2
          Width = 97
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label41: TLabel
            Left = 8
            Top = 3
            Width = 62
            Height = 13
            Caption = 'N'#186' Cheque'
          end
        end
        object Panel41: TPanel
          Left = 253
          Top = 2
          Width = 53
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label42: TLabel
            Left = 10
            Top = 3
            Width = 25
            Height = 13
            Caption = 'Loja'
          end
        end
        object Panel42: TPanel
          Left = 307
          Top = 2
          Width = 69
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label43: TLabel
            Left = 12
            Top = 3
            Width = 49
            Height = 13
            Caption = 'Portador'
          end
        end
        object Panel43: TPanel
          Left = 378
          Top = 2
          Width = 82
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label44: TLabel
            Left = 8
            Top = 3
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
        end
        object Panel44: TPanel
          Left = 462
          Top = 2
          Width = 142
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label45: TLabel
            Left = 8
            Top = 3
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
        end
        object Panel37: TPanel
          Left = 606
          Top = 2
          Width = 163
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object Label46: TLabel
            Left = 8
            Top = 3
            Width = 101
            Height = 13
            Caption = 'Al'#237'nea devolu'#231#227'o'
          end
        end
      end
    end
    object pagina6: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 5
      object Panel47: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel48: TPanel
          Left = 0
          Top = 2
          Width = 140
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblIdProduto: TLabel
            Left = 30
            Top = 3
            Width = 51
            Height = 13
            Caption = '???? - id'
          end
        end
        object Panel49: TPanel
          Left = 142
          Top = 2
          Width = 323
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label60: TLabel
            Left = 6
            Top = 3
            Width = 123
            Height = 13
            Caption = 'Descri'#231#227'o do produto'
          end
        end
        object Panel50: TPanel
          Left = 467
          Top = 2
          Width = 115
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label62: TLabel
            Left = 6
            Top = 4
            Width = 20
            Height = 13
            Caption = 'Cor'
          end
        end
        object Panel51: TPanel
          Left = 584
          Top = 2
          Width = 51
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label63: TLabel
            Left = 11
            Top = 4
            Width = 25
            Height = 13
            Caption = 'Tam'
          end
        end
        object Panel52: TPanel
          Left = 638
          Top = 2
          Width = 41
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label64: TLabel
            Left = 6
            Top = 3
            Width = 32
            Height = 13
            Caption = 'Qtde.'
          end
        end
        object Panel53: TPanel
          Left = 681
          Top = 2
          Width = 73
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label65: TLabel
            Left = 6
            Top = 3
            Width = 41
            Height = 13
            Caption = 'Total $'
          end
        end
        object Panel54: TPanel
          Left = 756
          Top = 2
          Width = 32
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label66: TLabel
            Left = 2
            Top = 3
            Width = 26
            Height = 13
            Caption = 'Tipo'
          end
        end
      end
      object Memo7: TMemo
        Left = 0
        Top = 28
        Width = 776
        Height = 312
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = Memo7KeyDown
      end
    end
    object pagina4: TTabSheet
      Caption = 'Dados do cliente'
      ImageIndex = 3
      object Memo4: TMemo
        Left = 0
        Top = 0
        Width = 782
        Height = 328
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = Memo4KeyDown
      end
      object Memo5: TMemo
        Left = 0
        Top = 328
        Width = 782
        Height = 23
        Align = alBottom
        Color = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pagina7: TTabSheet
      Caption = 'Foto'
      ImageIndex = 6
      OnEnter = pagina7Enter
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 776
        Height = 340
        Align = alClient
      end
      object SpeedButton1: TSpeedButton
        Left = 327
        Top = 315
        Width = 128
        Height = 33
        Caption = 'Capturar Foto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Memo8: TMemo
        Left = 344
        Top = 144
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo8')
        ReadOnly = True
        TabOrder = 0
      end
      object Panel55: TPanel
        Left = 208
        Top = 16
        Width = 354
        Height = 290
        TabOrder = 1
        object foto_cliente: TImage
          Left = 1
          Top = 1
          Width = 352
          Height = 288
          Align = alClient
          Stretch = True
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 456
    Width = 784
    Height = 76
    Align = alBottom
    BevelInner = bvLowered
    Color = clTeal
    TabOrder = 1
    object Bevel8: TBevel
      Left = 42
      Top = 5
      Width = 532
      Height = 24
      Shape = bsFrame
    end
    object Label54: TLabel
      Left = 15
      Top = 11
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
    object Label55: TLabel
      Left = 64
      Top = 10
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
    object Label56: TLabel
      Left = 54
      Top = 9
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
    object Label10: TLabel
      Left = 714
      Top = 11
      Width = 36
      Height = 13
      Caption = 'ESC->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 752
      Top = 11
      Width = 23
      Height = 13
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbF8Mens: TLabel
      Left = 394
      Top = 11
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
      Left = 366
      Top = 11
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
    object Label24: TLabel
      Left = 123
      Top = 11
      Width = 26
      Height = 13
      Caption = 'F7->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 149
      Top = 11
      Width = 190
      Height = 13
      Caption = 'Alternar entre C'#211'D / CPF / CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 2
      Top = 37
      Width = 780
      Height = 37
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object btnBaixo1Lin: TSpeedButton
        Left = 0
        Top = 4
        Width = 26
        Height = 29
        Cursor = crHandPoint
        Hint = 'Baixar uma linha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          A6080000424DA6080000000000003600000028000000180000001E0000000100
          18000000000070080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0080
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00800000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF00800000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF0000
          8000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00800000800000800000800000800000FF0000FF0000FF0000FF0000FF0000
          8000008000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF
          0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000
          00FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF0000
          8000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF
          0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000
          00FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF0000
          8000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF
          0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000
          00FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000800000800000800000800000800000
          8000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = btnBaixo1LinClick
      end
      object btnCima1Lin: TSpeedButton
        Left = 26
        Top = 4
        Width = 26
        Height = 29
        Cursor = crHandPoint
        Hint = 'Subir uma linha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          A6080000424DA6080000000000003600000028000000180000001E0000000100
          18000000000070080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00800000800000800000800000800000800000FF00FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF00008000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF
          0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF00
          00FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF00008000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF
          0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF00
          00FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF00008000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF
          0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF00
          00FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000800000800000
          800000800000FF0000FF0000FF0000FF0000FF00008000008000008000008000
          008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00800000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF00008000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF000080
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = btnCima1LinClick
      end
      object btnPageDown: TSpeedButton
        Left = 52
        Top = 4
        Width = 26
        Height = 29
        Cursor = crHandPoint
        Hint = 'Baixar uma p'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          A6080000424DA6080000000000003600000028000000180000001E0000000100
          18000000000070080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FF
          FF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80
          FFFF008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00808080FFFF00808000808000808000808000808000808080FFFF0080
          0080FFFF00808080FFFF008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF
          80FFFF00800000FF0000800080FFFF80FFFF008080FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF00808000808000
          808000808000808000800000FF0000FF0000FF0000800080FFFF008080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FF
          FF80FFFF80FFFF80FFFF80FFFF00800000FF0000FF0000FF0000FF0000FF0000
          8000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00808080FFFF00808000808000808000800000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF80FFFF00800000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF00800000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FF
          FF00800000800000800000800000800000FF0000FF0000FF0000FF0000FF0000
          8000008000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00808080FFFF80FFFF80FFFF80FFFF80FFFF00800000FF0000FF0000FF
          0000FF0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00808080FFFF008080008080008080008080008000
          00FF0000FF0000FF0000FF0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF80FFFF80
          FFFF80FFFF00800000FF0000FF0000FF0000FF0000FF00008000008080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FF
          FF00808000808000808080FFFF00800000FF0000FF0000FF0000FF0000FF0000
          8000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00808080FFFF80FFFF80FFFF80FFFF80FFFF00800000FF0000FF0000FF
          0000FF0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00808080FFFF00808000808000808080FFFF008000
          00FF0000FF0000FF0000FF0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF80FFFF80
          FFFF80FFFF00800000FF0000FF0000FF0000FF0000FF00008000008080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0080800080
          8000808000808000808000808000800000FF0000FF0000FF0000FF0000FF0000
          8000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF
          0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000
          00FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000800000800000800000800000800000
          8000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = btnPageDownClick
      end
      object btnPageUp: TSpeedButton
        Left = 78
        Top = 4
        Width = 26
        Height = 29
        Cursor = crHandPoint
        Hint = 'Subir uma p'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          A6080000424DA6080000000000003600000028000000180000001E0000000100
          18000000000070080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00808080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF
          FF80FFFF80FFFF008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF00808080FFFF008080008080008080008080008080008080
          00808000808000808000808080FFFF008080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF80FFFF80FFFF80
          FFFF00800000800000800000800000800000800000FF00008080FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF0080
          8000808000808080FFFF00800000FF0000FF0000FF0000FF0000FF0000800000
          8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00808080FFFF80FFFF80FFFF80FFFF80FFFF00800000FF0000FF0000FF0000FF
          0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF00808080FFFF00808000808000808080FFFF00800000FF00
          00FF0000FF0000FF0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF80FFFF80FFFF80
          FFFF00800000FF0000FF0000FF0000FF0000FF00008000008080FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF0080
          8000808000808000808000800000FF0000FF0000FF0000FF0000FF0000800000
          8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00808080FFFF80FFFF80FFFF80FFFF80FFFF00800000FF0000FF0000FF0000FF
          0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF00808080FFFF00808080FFFF00808000808000800000FF00
          00FF0000FF0000FF0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FFFF80FFFF80FFFF80
          FFFF00800000FF0000FF0000FF0000FF0000FF00008000008080FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF0080
          8000808080FFFF00808000800000FF0000FF0000FF0000FF0000FF0000800000
          8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00808080FFFF80FFFF80FFFF80FFFF80FFFF00800000FF0000FF0000FF0000FF
          0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF00808080FFFF00808000808000808000808000800000FF00
          00FF0000FF0000FF0000FF00008000008080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF00800000800000800000
          800000800000FF0000FF0000FF0000FF0000FF00008000008000008000008000
          008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808080FFFF80FF
          FF00800000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00808080FFFF80FFFF80FFFF00800000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF00808000808000808000808000808000800000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00800000FF0000FF0000FF0000FF0000FF00008000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF0000FF0000FF00008000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000FF000080
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = btnPageUpClick
      end
      object btnLanc: TSpeedButton
        Left = 156
        Top = 4
        Width = 97
        Height = 29
        Cursor = crHandPoint
        Hint = 
          'Lan'#231'amento de contrato - permitindo verifica'#231#227'o do cadastro do c' +
          'liente'
        Caption = 'La&N'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
          A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
          FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFC
          FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFAF5FEFCFBFEFAF5FEFAF5FE
          FCFBFEFAF5FEFAF5FEFCFBFEFAF5FEFAF5C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFA
          F5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FE
          F7F0FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FEF3E9FEF7F0FEF7F0FEF3E9FEF7F0FEF7
          F0C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9FEF3E9FEF3E9FE
          F3E9FEF3E9FEF3E9FEF3E9FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFF0E2FFF0E2FEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEE
          DEC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FFEEDEFFF0E2FEF3E9FF
          EEDEFFF0E2DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC3B4A8C3B4A8C3B4A8C3B4
          A8C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFEEDEFFEAD7FFEEDEFFEAD7FF
          EAD7FFEEDEB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFEFAF5FEF7F0E6DAD9C2A6
          A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFEAD7FFE6D0FFEAD7FFE6D0FF
          EAD7C5B5A9FEFAF5DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDDCFC2C2A6A4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
          A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = btnLancClick
      end
      object btnBaixa: TSpeedButton
        Left = 488
        Top = 4
        Width = 64
        Height = 29
        Cursor = crHandPoint
        Hint = 'Lan'#231'amento de baixa de presta'#231#227'o'
        Caption = '&Baixar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          B1908EB1908EB1908EB1908EB1908EB1908EB1908EB1908EB1908EB1908EB190
          8EB1908EFF00FFFF00FFFF00FFFF00FFB1908EFEFBFAFEFBFAFEFBFAFEFBFAFE
          FBFAFEFBFAFEFBFAFEFBFAFEFBFAFEFBFAB1908EFF00FFFF00FFFF00FFFF00FF
          B1908EFEFBFA811E00811E00811E00811E00811E00811E00811E00811E00FEFB
          FAB1908EFF00FFFF00FFFF00FFFF00FFB1908EFEFAF4811E00FEFEFEFEFEFEFE
          FEFE758EFCA5B6FCFEFEFE811E00FEFAF4B1908EFF00FFFF00FFFF00FFFF00FF
          B1908EFEF7F0811E00FEFEFEF8FAFE6480FB011FFA3F5FFBFEFEFE811E00FEF7
          F0B1908EFF00FFFF00FFFF00FFFF00FFB1908EFEF4EB811E00CAD4FE2B4DFB01
          1FFA284BFB0120FACED7FE811E00FEF4EBB1908EFF00FFFF00FFFF00FFFF00FF
          B1908EFEF2E6811E003859FB092AFAAABAFCEAEEFE0C2EFA3557FB7F1E01FEF2
          E6B1908EFF00FFFF00FFFF00FFFF00FFB1908EFEEFE2811E00DCE3FECED7FEFE
          FEFEFEFEFE8097FC011FFA491F3FFEEFE2B1908EFF00FFFF00FFFF00FFFF00FF
          B1908EFFEDDD811E00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE3C5CFB011FFAFFED
          DDB1908EFF00FFFF00FFFF00FFFF00FFB1908EFFEBD9811E00811E00811E0081
          1E00811E00811E00761E07111FB8011FFAB1908EFF00FFFF00FFFF00FFFF00FF
          B1908EFFE9D4FFE9D4FFE9D4FFE9D4FFE9D4FFE9D4B5A193B2A092B19F91011F
          FA011FFA011FFAFF00FFFF00FFFF00FFB1908EFFE6CFFFE6CFFFE6CFFFE6CFFF
          E6CFFFE6CF9C8B7E9C8B7E9C8B7E9C8B7EB1908E011FFAFF00FFFF00FFFF00FF
          B1908EFFE3CBFFE3CBFFE3CBFFE3CBFFE3CBBAA697FAF6F0FAF6F0DECFCEB190
          8EFF00FFFF00FFFF00FFFF00FFFF00FFB1908EFFE1C6FFE1C6FFE1C6FFE1C6FF
          E1C6BAA697FAF6F0D5C0B7B1908EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          B1908EFFDEC2FFDEC2FFDEC2FFDEC2FFDEC2BAA697D5C0B7B1908EFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB1908EB1908EB1908EB1908EB1908EB1
          908EB1908EB1908EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = btnBaixaClick
      end
      object btnDir1lin: TSpeedButton
        Left = 130
        Top = 4
        Width = 26
        Height = 29
        Cursor = crHandPoint
        Hint = 'Baixar uma linha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          EA090000424DEA0900000000000036000000280000001E0000001B0000000100
          180000000000B4090000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0008000C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0008000008000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF00008000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C000800000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0008000008000008000008000008000008000008000008000008000008000
          00800000800000800000FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C00080
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C000800000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C000FF0000800000800000800000800000800000800000
          800000800000800000800000800000800000FF0000FF0000FF00008000C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C000800000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C000800000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0008000008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00080
          00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000}
        ParentFont = False
        OnClick = btnDir1linClick
      end
      object btnEsq1lin: TSpeedButton
        Left = 104
        Top = 4
        Width = 26
        Height = 29
        Cursor = crHandPoint
        Hint = 'Baixar uma linha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          EA090000424DEA0900000000000036000000280000001E0000001B0000000100
          180000000000B4090000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000
          8000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF00008000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF00008000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C000800000FF0000FF0000FF0000800000800000800000800000
          800000800000800000800000800000800000800000800000FF00C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          00800000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF00008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF0000FF000080000080
          0000800000800000800000800000800000800000800000800000800000800000
          8000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF0000FF00008000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C000800000FF00008000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0008000008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000}
        ParentFont = False
        OnClick = btnEsq1linClick
      end
      object btnRenova: TSpeedButton
        Left = 253
        Top = 4
        Width = 90
        Height = 29
        Cursor = crHandPoint
        Hint = 'Lan'#231'amento de contrato - sem verifica'#231#227'o cadastral'
        Caption = '&Renova'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
          A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
          FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBD8EBD6018A02018A02D8EBD6FEFCFBFEFC
          FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFBF7FEFBF7018A02D8EAD201
          8A02D8EAD2D8EAD2018A02FEFBF7FEFBF7C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF9F4FEF9F4018A02018A02D8E8D0FEF9F4FEF9F4D8E8D0FEF9F4FEF9
          F4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0018A02018A0201
          8A02FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF5ECFEF5ECFEF5ECFEF5ECFEF5EC018A02018A02018A02FEF5ECFEF5
          ECC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9D8E3C7FEF3E9FE
          F3E9D8E3C7018A02018A02FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFF1E5FFF1E5018A02D9E2C3D9E2C3018A02D9E2C3018A02FFF1E5FFF1
          E5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFF0E2FFF0E2D9E1C1018A0201
          8A02D9E1C1DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC5B5A9C3B4A8C2B3A7C1B2
          A6C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFECDAFFECDAFFECDAFFECDAFF
          ECDAFFECDAB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFBF8F4FBF8F4E6DAD9C2A6
          A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFE8D3FFE8D3FFE8D3FFE8D3FF
          E8D3C9B9ACFBF8F4DFCEC7C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDFCEC7C2A6A4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
          A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = btnRenovaClick
      end
      object btnProposta: TSpeedButton
        Left = 343
        Top = 4
        Width = 78
        Height = 29
        Cursor = crHandPoint
        Hint = 'Impress'#227'o do formul'#225'rio de Proposta de Cr'#233'dito'
        Caption = '&Proposta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
        Spacing = 2
        OnClick = btnPropostaClick
      end
      object btn2avia: TSpeedButton
        Left = 421
        Top = 4
        Width = 67
        Height = 29
        Cursor = crHandPoint
        Hint = 'Emiss'#227'o de 2a. via de carnet'
        Caption = '2a. &Via'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000009800000098
          0000009800000098000000980000009800000098000000980000009700000096
          00000095000000930000008F0000018B010002850200037D030004750400056A
          0500085C08000A500A000C450C000F3A0F0010341000132D1300152715001720
          17001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
          2100222222002323230024242400252525002626260027272700282828002929
          29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
          3100323232003333330034343400353535003636360037373700383838003939
          39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
          4100424242004343430044444400454545004646460047474700484848004949
          49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
          5100525252005353530054545400555555005656560057575700585858005959
          59005A5A5A00646363006F6D6C00817E7C00908D8A00A4A09A00B4AFA800C2BB
          B300D3CCC300DFD8CF00E8E1D800EFE8DF00F6F0E900FBF5EF00FDF8F300FEFA
          F500FEFBF700FEFCF800FEFCFA00FEFCFA00FEFCFA00FEFCF900FEFCF800FEFB
          F800FEFBF700FEFBF700FEFAF500FEFAF400FEF9F200FEF8F000FEF7EF00FEF7
          EE00FEF7EE00FEF6ED00FEF6EC00FEF5EB00FEF5E900FEF4E800FEF3E700FEF3
          E500FEF1E200FEF0DF00FEEFDD00FEEEDA00FEEDD900FEEDD900FEECD800FEEC
          D700FEECD600FEEBD600FEEBD500FEEAD300FEE9D100FEE8D000FEE8CF00FEE7
          CD00FEE6CB00FEE5C900FEE4C600FEE2C400FEE1C200FEE0C000FEE0BE00FEDF
          BD00FEDFBC00FEDEBB00FEDDB900FEDDB800FEDCB600FDDCB500FDDBB400FDDB
          B500FDDCB600FDDCB700FDDCB800FCDDB900FBDDBA00FADDBB00F7DCBD00F2D9
          BE00ECD6BD00E4D1BC00D8CAB900CDC3B700C3BCB400B8B5B100B4B3B100B1B1
          B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
          B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C4B5
          C400C9A9C900CD9FCD00D295D200D58BD500DB7ADB00E263E200E850E800ED40
          ED00F133F100F526F500F916F900FB0CFB00FD07FD00FD04FD00FE02FE00FE01
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE01FC00FA0CE500F420C000EC3A8C00E5515F00DE653700DB712100D87A
          0F00D77E0700D6800200D6810100D6810000D6810000D5820000D5820000D582
          0000D5820000D5820000D5820000D5820000D5820000D5820000DEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEFBFBFBFBFBFBFBFBFBFBFBFBDEDEDEFB858C9092
          94969A9DA0A0A0A0FBDEDEFB83878C8E929496999DA0A0A0FBDEDEFB81070707
          07070707070707A0FBDEDEFB7D8183858C909294979A9DA0FBDEDEFB7A7E8107
          0707070707979A9DFBDEDEFB767A7E8183858C8F9294979AFBDEDEFB72070707
          0707070707070797FBDEDEFB6C72767A7F8183858C909294FBDEDEFB6E6E7207
          07070707078C8F92FBDEDEFB6E6E6F72767A7E8183858C8FFBDEDEFB6E070707
          070707070707078CFBDEDEFB6E6E6E6E6F72767A7E818385FBDEDEDEFBFBFBFB
          FBFBFBFBFBFBFBFBDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = btn2aviaClick
      end
      object btnCep: TSpeedButton
        Left = 552
        Top = 4
        Width = 58
        Height = 29
        Cursor = crHandPoint
        Hint = 'Consulta CEP'
        Caption = '&CEP'#39's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
          9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
          E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
          FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
          B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
          FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
          DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
          B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
          BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
          D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
          6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = btnCepClick
      end
      object btnRenegocia: TSpeedButton
        Left = 610
        Top = 4
        Width = 93
        Height = 29
        Cursor = crHandPoint
        Hint = 'Renegocia'#231#227'o de contrato'
        Caption = 'Rene&gociar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF0274AC
          0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274
          AC0274ACFF00FFFF00FFA56F6FA56F6FA56F6FA56F6FA56F6FA56F6FA56F6F4A
          BFF74ABFF64ABFF74ABFF64BC0F72398CC0274ACFF00FFFF00FFA56F6FFEFCFA
          FEFCFAFEFCFAFEFCFAFEFCFA346D2B046B0B046B0B046B0B37ABA353C7F7279D
          CE6ACBE50274ACFF00FFA56F6FFEF7F0FEF7F0FEF7F0FEF7F0FEF7F0A56F6F4C
          C0CA046B0B088013046B0B32A4822AA0C799EDF70274ACFF00FFA56F6FFEF3E7
          FEF3E7FEF3E7FEF3E7FEF3E7A56F6F69DCFB6ADCFB046B0B14A428046B0B2092
          8A9FF0F70274ACFF00FFA56F6FFFEEE0FFEEE0FFEEE0F8E1D4F8E1D4A56F6F74
          E5FC74E5FC42AF91046B0B21B43E046B0B97EBE552BBD70274ACA56F6FFFEAD7
          FFEAD7FFEAD7C28887C28987B57A7A97DCCF88D0BB689667046B0B35D05D046B
          0B80A7818CAD970274ACA56F6FFFE5CEFFE5CEEFCBBAC99692C4B8B1BF818102
          6D66046B0B046B0B2EC2533FDA6E2AB64C046B0B046B0B0274ACA56F6FFFE1C5
          FFE1C5EFC7B4CE9997BF818182F3FE83F2FE48B58E046B0B42E17548E98033C2
          5A046B0BEBEDE0A56F6FA56F6FA56F6FA56F6FA56F6FBF81818AF8FE8AFAFE89
          F8FE8AFAFE58643D046B0B2DBC53046B0BEAE7D5FEF3E7A56F6FFF00FF0274AC
          FEFEFE8FFEFF8FFEFF8FFEFF0274AC0274AC0274ACA56F6F6AA060046B0BE7E1
          CBF8E1D4F8E1D4A56F6FFF00FFFF00FF0274AC0274AC0274AC0274ACFF00FFFF
          00FFFF00FFA56F6FFFEAD7FFEAD7FFEAD7C28887C28987B57A7AFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA56F6FFFE5CEFFE5CEEFCB
          BAC99692C4B8B1BF8181FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA56F6FFFE1C5FFE1C5EFC7B4CE9997BF8181FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA56F6FA56F6FA56F6FA56F
          6FBF8181FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnRenegociaClick
      end
      object botao_sair: TPanel
        Left = 705
        Top = 7
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
    end
  end
  object pnCabec: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 88
    Align = alTop
    TabOrder = 2
    object lbLoja: TLabel
      Left = 617
      Top = 2
      Width = 33
      Height = 13
      Caption = 'Loja: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pn3: TPanel
      Left = 2
      Top = 4
      Width = 279
      Height = 35
      Alignment = taLeftJustify
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Caption = '        C'#243'digo............: 000001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Visible = False
      object Bevel1: TBevel
        Left = 195
        Top = 4
        Width = 75
        Height = 26
      end
    end
    object pn2: TPanel
      Left = 3
      Top = 3
      Width = 279
      Height = 34
      Alignment = taLeftJustify
      Caption = '   CPF/CNPJ do cliente...:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
      object edtCpf: TMaskEdit
        Left = 154
        Top = 4
        Width = 119
        Height = 21
        TabOrder = 0
        OnChange = edtCpfChange
        OnEnter = edtCpfEnter
        OnExit = edtCpfExit
        OnKeyDown = edtCpfKeyDown
      end
    end
    object pn1: TPanel
      Left = 4
      Top = 3
      Width = 278
      Height = 34
      Alignment = taLeftJustify
      Caption = '   C'#243'digo do cliente...:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object edtCodCli: TMaskEdit
        Left = 138
        Top = 4
        Width = 87
        Height = 21
        EditMask = '!999999;1; '
        MaxLength = 6
        TabOrder = 0
        Text = '      '
        OnChange = edtCodCliChange
        OnDblClick = edtCodCliDblClick
        OnEnter = edtCodCliEnter
        OnExit = edtCodCliExit
        OnKeyDown = edtCodCliKeyDown
      end
    end
    object btnConsulta: TBitBtn
      Left = 288
      Top = 8
      Width = 97
      Height = 25
      Cursor = crHandPoint
      Caption = 'Consultar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnConsultaClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object pnHoje: TPanel
      Left = 392
      Top = 1
      Width = 222
      Height = 17
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object pnAlerta: TPanel
      Left = 392
      Top = 17
      Width = 222
      Height = 21
      BevelInner = bvLowered
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object pnCli2: TPanel
      Left = 3
      Top = 42
      Width = 610
      Height = 45
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'pnCli2'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object pnCli1: TPanel
      Left = 3
      Top = 41
      Width = 610
      Height = 16
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      Caption = 'pnCli1'
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object Panel45: TPanel
      Left = 615
      Top = 17
      Width = 184
      Height = 71
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object Label47: TLabel
        Left = 3
        Top = 55
        Width = 62
        Height = 13
        Caption = 'Dispon'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 2
        Top = 23
        Width = 77
        Height = 13
        Caption = 'Limite cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label49: TLabel
        Left = 2
        Top = 6
        Width = 40
        Height = 13
        Caption = 'Sal'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 2
        Top = 40
        Width = 70
        Height = 13
        Caption = 'Total aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnSalario: TPanel
        Left = 82
        Top = 1
        Width = 101
        Height = 18
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvNone
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object pnLimite: TPanel
        Left = 82
        Top = 18
        Width = 101
        Height = 20
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvNone
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pnTotab2: TPanel
        Left = 82
        Top = 34
        Width = 101
        Height = 17
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvNone
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object pnDisponiv: TPanel
        Left = 82
        Top = 51
        Width = 101
        Height = 19
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvNone
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object pnTel: TPanel
    Left = 4
    Top = 3
    Width = 278
    Height = 34
    Alignment = taLeftJustify
    Caption = '  Telefone do Cliente : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    object edtFone: TMaskEdit
      Left = 138
      Top = 4
      Width = 90
      Height = 21
      EditMask = '!\(99\)9999-9999;0;_'
      MaxLength = 13
      TabOrder = 0
      OnChange = edtCodCliChange
      OnDblClick = edtCodCliDblClick
      OnEnter = edtCodCliEnter
      OnExit = edtCodCliExit
      OnKeyDown = edtCodCliKeyDown
    end
  end
  object MainMenu1: TMainMenu
    Left = 755
    Top = 146
    object Principal1: TMenuItem
      Caption = 'Principal'
      Visible = False
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
      end
      object Desmarcarcliente1: TMenuItem
        Caption = 'Executar consulta'
        ShortCut = 116
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
      end
    end
    object Auxiliares1: TMenuItem
      Caption = 'Auxiliares'
      Visible = False
      object Lancamento1: TMenuItem
        Caption = 'Lancamento'
        ShortCut = 16462
        OnClick = Lancamento1Click
      end
      object Baixa1: TMenuItem
        Caption = 'Baixa'
        ShortCut = 16450
        OnClick = Baixa1Click
      end
      object Renovao1: TMenuItem
        Caption = 'Renova'#231#227'o'
        ShortCut = 16466
        OnClick = Renovao1Click
      end
      object Proposta1: TMenuItem
        Caption = 'Proposta'
        ShortCut = 16464
        OnClick = Proposta1Click
      end
      object N2avia1: TMenuItem
        Caption = '2a. via'
        ShortCut = 16470
        OnClick = N2avia1Click
      end
      object Renegocia1: TMenuItem
        Caption = 'Renegocia'
        OnClick = Renegocia1Click
      end
    end
  end
  object TimerDia: TTimer
    Interval = 5000
    OnTimer = TimerDiaTimer
    Left = 697
    Top = 146
  end
  object TimerAlerta: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerAlertaTimer
    Left = 726
    Top = 146
  end
end