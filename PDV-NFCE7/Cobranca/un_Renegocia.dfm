inherited frm_Renegocia: Tfrm_Renegocia
  Left = 33
  Top = 10
  Caption = 'Renogocia'#231#227'o/Renova'#231#227'o de contrato'
  ClientHeight = 496
  ClientWidth = 720
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 0
    Top = 0
    Width = 720
    Height = 50
    Align = alTop
    Shape = bsFrame
  end
  object LabelOO1: TLabelOO [1]
    Left = 16
    Top = 8
    Width = 100
    Height = 13
    Caption = 'C'#243'digo do cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO2: TLabelOO [2]
    Left = 454
    Top = 82
    Width = 140
    Height = 13
    Caption = 'Saldo devedor sem juros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 80
    Width = 218
    Height = 13
    Caption = '* Contratos de cheques n'#227'o s'#227'o considerados'
  end
  object gauge: TGaugeOO [4]
    Left = 0
    Top = 365
    Width = 720
    Height = 25
    Align = alBottom
    ForeColor = clBlue
    Progress = 0
    Visible = False
  end
  object LabelOO3: TLabelOO [5]
    Left = 453
    Top = 102
    Width = 141
    Height = 13
    Caption = 'Saldo devedor com juros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel [6]
    Left = 8
    Top = 101
    Width = 263
    Height = 13
    Caption = 'Selecione os contratos a serem renegociados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOO4: TLabelOO [7]
    Left = 600
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Hoje:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grade: TDBGrid [8]
    Left = 0
    Top = 116
    Width = 720
    Height = 248
    Cursor = crHandPoint
    Hint = 'Duplo clique seleciona o contrato para renegociar'
    DataSource = ds1
    DefaultDrawing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = gradeDrawColumnCell
    OnDblClick = gradeDblClick
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'bFlag'
        Width = 1
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_CODI'
        Title.Caption = 'Contrato'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_LOJA'
        Title.Caption = 'Loja'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_DNOT'
        Title.Caption = 'Data'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_TOTA'
        Title.Caption = 'Total financiado $'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_VENT'
        Title.Caption = 'Entrada $'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cPLANO'
        Title.Caption = 'Plano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_QPRE'
        Title.Caption = 'Q.Pr.'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_PDEV'
        Title.Caption = 'P.Dev.'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cPORT'
        Title.Caption = 'Portador'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_VDEV'
        Title.Caption = 'Valor devido $'
        Width = 103
        Visible = True
      end>
  end
  inherited Panel3: TPanel
    Top = 390
    Width = 720
    Color = clTeal
    inherited Label10: TLabel
      Left = 634
      Top = 25
    end
    inherited Label11: TLabel
      Left = 671
      Top = 25
    end
    inherited Label4: TLabel
      Left = 22
      Top = 12
    end
    inherited Label5: TLabel
      Left = 48
      Top = 12
      Width = 123
      Caption = 'Renegociar sem juros'
    end
    inherited lbF8Mens: TLabel
      Width = 54
      Caption = 'Consultar'
    end
    object Label54: TLabel [6]
      Left = 373
      Top = 15
      Width = 33
      Height = 13
      Caption = 'CTRL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel8: TBevel [7]
      Left = 420
      Top = 8
      Width = 207
      Height = 41
      Shape = bsFrame
    end
    object Label56: TLabel [8]
      Left = 430
      Top = 14
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
    object Label55: TLabel [9]
      Left = 439
      Top = 15
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
    object Label2: TLabel [10]
      Left = 187
      Top = 13
      Width = 54
      Height = 13
      Caption = 'ENTER->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [11]
      Left = 242
      Top = 13
      Width = 61
      Height = 13
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel [12]
      Left = 430
      Top = 30
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
    object Label8: TLabel [13]
      Left = 456
      Top = 30
      Width = 124
      Height = 13
      Caption = 'Renegociar com juros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [14]
      Left = 306
      Top = 13
      Width = 48
      Height = 13
      Caption = 'contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Panel4: TPanel
      Width = 716
      inherited botao_sair: TPanel
        Left = 623
      end
      inherited botao1: TButton
        Width = 265
        Caption = 'Renegociar valor sem juros - [F5]'
        OnClick = botao1Click
      end
      object botao2: TButton
        Left = 283
        Top = 12
        Width = 262
        Height = 25
        Cursor = crHandPoint
        Caption = 'Renegociar valor com juros - CTRL+F5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = botao2Click
      end
    end
  end
  inherited edtcomboboxformulario1: TComboBox
    Left = 564
    Top = 337
  end
  inherited edteditformulario1: TEdit
    Left = 572
    Top = 331
  end
  inherited edtmaskeditformulario1: TMaskEdit
    Left = 580
    Top = 325
  end
  object edtCodigo: TMaskEditOO [13]
    Left = 16
    Top = 22
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnEnter = edtmaskeditformulario1Enter
    OnKeyDown = edtCodigoKeyDown
    zNomeOO = 'C'#243'digo do cliente'
    zFieldTypeOO = ftInteger
    zFieldLengthOO = 6
    zTipoOO = -1
    zEntidadeOO = 'CRECLI'
    zLabelEntidadeOO = 'Clientes'
    zPainelEntidadeOO = pnCliente
    zTipoPesquisaF8 = True
    zMensagemF1 = 
      'C'#243'digo do cliente: formato 999999 - F8/Duplo clique exibe client' +
      'es cadastrados'
  end
  object pnCliente: TPanelOO [14]
    Left = 92
    Top = 22
    Width = 501
    Height = 21
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Panel1: TPanel [15]
    Left = 1
    Top = 51
    Width = 722
    Height = 24
    Caption = 'Contratos em aberto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object pnSaldo1: TPanelOO [16]
    Left = 598
    Top = 76
    Width = 124
    Height = 19
    Alignment = taRightJustify
    BevelOuter = bvLowered
    Color = clRed
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object pnSaldo2: TPanelOO [17]
    Left = 598
    Top = 96
    Width = 124
    Height = 19
    Alignment = taRightJustify
    BevelOuter = bvLowered
    Color = clRed
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object pnHoje: TPanel [18]
    Left = 599
    Top = 21
    Width = 121
    Height = 25
    BevelInner = bvLowered
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  inherited MainMenu1: TMainMenu
    Left = 35
    Top = 158
    inherited Principal1: TMenuItem
      object N3: TMenuItem [1]
        Caption = '-'
      end
      inherited N1: TMenuItem
        Caption = 'Renegocia sem juros'
        ShortCut = 116
        OnClick = N1Click
      end
      object Renegociacomjuros1: TMenuItem [3]
        Caption = 'Renegocia com juros'
        ShortCut = 16500
        OnClick = Renegociacomjuros1Click
      end
    end
  end
  object ds1: TDataSource
    DataSet = DMcontrato.qRenegociaContratosEmAberto
    Left = 5
    Top = 158
  end
end
