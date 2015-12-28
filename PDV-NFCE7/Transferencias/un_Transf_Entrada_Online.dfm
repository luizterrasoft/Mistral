object frm_Transf_Entrada_Online: Tfrm_Transf_Entrada_Online
  Left = -4
  Top = -4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de itens para transfer'#234'ncia - ENTRADAS'
  ClientHeight = 555
  ClientWidth = 800
  Color = clTeal
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 15
    Top = 529
    Width = 161
    Height = 13
    Caption = 'CTRL+L-> Limpar formul'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 256
    Top = 519
    Width = 311
    Height = 23
    Caption = '[F3]  -> Lan'#231'ar Itens de Entrada'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 714
    Top = 503
    Width = 59
    Height = 13
    Caption = 'ESC-> Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object filtro2: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 57
    Align = alTop
    Color = clTeal
    TabOrder = 0
    object LabelOO3: TLabelOO
      Left = 8
      Top = 11
      Width = 84
      Height = 13
      Caption = 'Loja de origem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelOO4: TLabelOO
      Left = 8
      Top = 36
      Width = 81
      Height = 13
      Caption = 'N'#186' Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDocumento: TMaskEditOO
      Left = 96
      Top = 30
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnEnter = edtDocumentoEnter
      OnKeyDown = edtDocumentoKeyDown
      zFieldTypeOO = ftString
      zFieldLengthOO = 10
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object edtLojaOrigem: TMaskEditOO
      Left = 97
      Top = 5
      Width = 40
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
      Text = '  '
      OnDblClick = edtLojaOrigemDblClick
      OnEnter = edtLojaOrigemEnter
      OnExit = edtLojaOrigemExit
      OnKeyDown = edtLojaOrigemKeyDown
      zFieldTypeOO = ftInteger
      zFieldLengthOO = 2
      zTipoOO = -1
      zTipoPesquisaF8 = False
    end
    object pnLojaOrigem: TPanelOO
      Left = 139
      Top = 5
      Width = 540
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object botao5: TPanel
      Left = 167
      Top = 30
      Width = 125
      Height = 22
      Cursor = crHandPoint
      BevelInner = bvLowered
      Caption = 'Buscar - [F5]'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = botao5Click
    end
  end
  object pg1: TPageControl
    Left = 0
    Top = 57
    Width = 800
    Height = 444
    Cursor = crHandPoint
    ActivePage = pagina2
    Align = alTop
    OwnerDraw = True
    TabIndex = 1
    TabOrder = 1
    OnChanging = pg1Changing
    OnDrawTab = pg1DrawTab
    object pagina1: TTabSheet
      Caption = 'Sa'#237'das   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object grade: TDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 401
        Align = alTop
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnKeyDown = gradeKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'IT_LOJ1'
            Title.Caption = 'LjO'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IT_TRAN'
            Title.Caption = 'N'#186' Doc'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TR_LOJ2'
            Title.Caption = 'LjD'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'cCBARRA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'C'#243'digo de Barras'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'cDESCITEM'
            Title.Caption = 'Descri'#231#227'o do Produto'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 452
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cSTATUS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Situa'#231#227'o'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 97
            Visible = True
          end>
      end
    end
    object pagina2: TTabSheet
      Caption = 'Entradas >>>    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object btnIncluir: TSpeedButton
        Left = 5
        Top = 385
        Width = 192
        Height = 30
        Cursor = crHandPoint
        Caption = 'Lan'#231'ar itens - [F3]'
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
        OnClick = btnIncluirClick
      end
      object btnSalvar: TSpeedButton
        Left = 602
        Top = 385
        Width = 182
        Height = 30
        Cursor = crHandPoint
        Caption = 'Salvar Entradas - [F5]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnSalvarClick
      end
      object LabelOO1: TLabelOO
        Left = 612
        Top = 349
        Width = 78
        Height = 16
        Caption = 'TOTAL >>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnExcluir: TSpeedButton
        Left = 399
        Top = 385
        Width = 201
        Height = 30
        Cursor = crHandPoint
        Caption = 'Excluir Tudo - [CTRL+DEL]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          5E080000424D5E080000000000003600000028000000170000001D0000000100
          18000000000028080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
          FFFFFFFF000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FF0000FF0000FF000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF0000FF0000FF0000FF000080000080000080000080000080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF00008000008000008000008000
          0080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000800000800000
          80000080000080000080000080000080000080FFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF000080
          000080000080000080000080000080000080000080000080000080FFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF00
          00FF0000FF000080000080000080000080000080000080000080000080000080
          000080000080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF00008000008000008000008000
          0080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000800000
          800000800000800000800000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
          0000FF000080000080000080000080000080000080FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FF0000FF0000FF0000FF000080000080000080000080000080000080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF00008000008000008000008000
          0080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000800000
          80000080000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
          0000FF000080000080000080000080000080000080FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FF0000FF0000FF0000FF000080000080000080000080000080000080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000}
        ParentFont = False
        OnClick = btnExcluirClick
      end
      object btnDiminuir: TSpeedButton
        Left = 199
        Top = 385
        Width = 198
        Height = 30
        Cursor = crHandPoint
        Caption = 'Excluir refer'#234'ncia - [DEL]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          5E080000424D5E080000000000003600000028000000170000001D0000000100
          18000000000028080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000}
        ParentFont = False
        OnClick = btnDiminuirClick
      end
      object btnAumentaQtde: TSpeedButton
        Left = 199
        Top = 333
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Hint = 'Aumenta a Qtde. informada na refer'#234'ncia selecionada'
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAumentaQtdeClick
      end
      object btnDiminuiQtde: TSpeedButton
        Left = 199
        Top = 359
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Hint = 'Diminui a Qtde. informada na refer'#234'ncia selecionada'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDiminuiQtdeClick
      end
      object Label5: TLabel
        Left = 227
        Top = 338
        Width = 294
        Height = 16
        Caption = 'Adicionar quantidade ao item selecionado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 226
        Top = 363
        Width = 291
        Height = 16
        Caption = 'Remover quantidade do item selecionado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grade2: TDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 328
        Align = alTop
        DataSource = ds2
        DefaultDrawing = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = grade2DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'cflasit'
            Visible = False
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'cCBARRA'
            Title.Caption = 'C'#243'digo de barras'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'cDescricao'
            Title.Caption = 'Descri'#231#227'o do Produto'
            Title.Color = clTeal
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 372
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cCOR'
            Title.Caption = 'Cor'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cTAM'
            Title.Caption = 'Tamanho'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Qtde. Ent.'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 62
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cSituacao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Situa'#231#227'o'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 71
            Visible = True
          end>
      end
      object pnQtdeTotal2: TPanel
        Left = 695
        Top = 343
        Width = 88
        Height = 27
        BevelInner = bvLowered
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object BotaoSair1: TBotaoSair
    Left = 704
    Top = 520
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fecha o formul'#225'rio'
    Caption = 'SAIR'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BotaoSair1Click
  end
  object MainMenu1: TMainMenu
    Left = 70
    Top = 119
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Limparformulrio1: TMenuItem
        Caption = 'Limpar formul'#225'rio'
        ShortCut = 16460
        OnClick = Limparformulrio1Click
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
  object qItens: TQuery
    OnCalcFields = qItensCalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT *'
      'FROM ITENS_TRANSF_LOJA,TRANSF_LOJA'
      'WHERE (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME)'
      'ORDER BY IT_SEQ')
    Left = 39
    Top = 119
    object qItensIT_LOJ1: TFloatField
      FieldName = 'IT_LOJ1'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_LOJ1'
    end
    object qItensIT_TRAN: TFloatField
      FieldName = 'IT_TRAN'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TRAN'
    end
    object qItensIT_TIPZ: TStringField
      FieldName = 'IT_TIPZ'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TIPZ'
      Size = 1
    end
    object qItensIT_GRUP: TFloatField
      FieldName = 'IT_GRUP'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_GRUP'
    end
    object qItensIT_SUBG: TFloatField
      FieldName = 'IT_SUBG'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_SUBG'
    end
    object qItensIT_PROD: TFloatField
      FieldName = 'IT_PROD'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_PROD'
    end
    object qItensIT_CORE: TFloatField
      FieldName = 'IT_CORE'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_CORE'
    end
    object qItensIT_OTAM: TIntegerField
      FieldName = 'IT_OTAM'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_OTAM'
    end
    object qItensIT_TAMA: TStringField
      FieldName = 'IT_TAMA'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_TAMA'
      Size = 5
    end
    object qItensIT_QTDE: TFloatField
      FieldName = 'IT_QTDE'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_QTDE'
    end
    object qItensIT_MOV1: TFloatField
      FieldName = 'IT_MOV1'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_MOV1'
    end
    object qItensIT_MOV2: TFloatField
      FieldName = 'IT_MOV2'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_MOV2'
    end
    object qItensIT_DIGI: TDateTimeField
      FieldName = 'IT_DIGI'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_DIGI'
    end
    object qItensIT_EMBA: TDateTimeField
      FieldName = 'IT_EMBA'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_EMBA'
    end
    object qItensIT_CHEG: TDateTimeField
      FieldName = 'IT_CHEG'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_CHEG'
    end
    object qItensIT_STAT: TStringField
      FieldName = 'IT_STAT'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_STAT'
      Size = 1
    end
    object qItensIT_QTDS: TFloatField
      FieldName = 'IT_QTDS'
      Origin = 'ESTOQUE.ITENS_TRANSF_LOJA.IT_QTDS'
    end
    object qItenscDESCITEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDESCITEM'
      Size = 60
      Calculated = True
    end
    object qItenscCBARRA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCBARRA'
      Calculated = True
    end
    object qItenscSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSTATUS'
      Calculated = True
    end
    object qItenscDATADIGITACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATADIGITACAO'
      Size = 10
      Calculated = True
    end
    object qItenscDATAEMBARQUE: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATAEMBARQUE'
      Size = 10
      Calculated = True
    end
    object qItenscDATACHEGADA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDATACHEGADA'
      Size = 10
      Calculated = True
    end
    object qItensTR_LOJ1: TFloatField
      FieldName = 'TR_LOJ1'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      DisplayFormat = '00'
    end
    object qItensTR_NUME: TFloatField
      FieldName = 'TR_NUME'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
    end
    object qItensTR_DATA: TDateTimeField
      FieldName = 'TR_DATA'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
    end
    object qItensTR_LOJ2: TFloatField
      FieldName = 'TR_LOJ2'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      DisplayFormat = '00'
    end
    object qItensTR_STAT: TStringField
      FieldName = 'TR_STAT'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItensTR_ENVI: TStringField
      FieldName = 'TR_ENVI'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItensTR_ONLI: TStringField
      FieldName = 'TR_ONLI'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItensTR_TIPZ: TStringField
      FieldName = 'TR_TIPZ'
      Origin = 'VENDAS.ITENS_TRANSF_LOJA.IT_LOJ1'
      Size = 1
    end
    object qItenscQTDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'cQTDE'
      Size = 5
      Calculated = True
    end
    object qItenscQTDS: TStringField
      FieldKind = fkCalculated
      FieldName = 'cQTDS'
      Size = 5
      Calculated = True
    end
    object qItenscDIVERG: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDIVERG'
      Size = 1
      Calculated = True
    end
  end
  object ds: TDataSource
    DataSet = qItens
    Left = 9
    Top = 119
  end
  object tblTransf: TTable
    AfterOpen = tblTransfAfterOpen
    AfterClose = tblTransfAfterClose
    OnCalcFields = tblTransfCalcFields
    DatabaseName = 'C:\NATIVA\VENDAS'
    Filtered = True
    TableName = 'TEMP_TRANSF'
    TableType = ttDBase
    Left = 101
    Top = 119
    object tblTransfGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object tblTransfSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
    end
    object tblTransfPRODUTO: TFloatField
      FieldName = 'PRODUTO'
    end
    object tblTransfLOJA: TIntegerField
      FieldName = 'LOJA'
    end
    object tblTransfCOR: TIntegerField
      FieldName = 'COR'
    end
    object tblTransfTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 5
    end
    object tblTransfQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object tblTransfDATA: TDateField
      FieldName = 'DATA'
    end
    object tblTransfMODE: TStringField
      FieldName = 'MODE'
      Size = 1
    end
    object tblTransfTIPZ: TStringField
      FieldName = 'TIPZ'
      Size = 1
    end
    object tblTransfSALDOANT: TIntegerField
      FieldName = 'SALDOANT'
    end
    object tblTransfcCBARRA: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCBARRA'
      Calculated = True
    end
    object tblTransfcSaldo1: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSaldo1'
      Size = 10
      Calculated = True
    end
    object tblTransfcDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDescricao'
      Size = 40
      Calculated = True
    end
    object tblTransfcSituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'cSituacao'
      Calculated = True
    end
    object tblTransfcflasit: TStringField
      FieldKind = fkCalculated
      FieldName = 'cflasit'
      Calculated = True
    end
    object tblTransfSEQ: TIntegerField
      FieldName = 'SEQ'
    end
    object tblTransfcCOR: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCOR'
      Size = 10
      Calculated = True
    end
    object tblTransfcTAM: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTAM'
      Size = 5
      Calculated = True
    end
  end
  object ds2: TDataSource
    DataSet = tblTransf
    Left = 131
    Top = 119
  end
end
