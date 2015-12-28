object Frm_ConsProdutosEstoque: TFrm_ConsProdutosEstoque
  Left = -3
  Top = -3
  BorderStyle = bsToolWindow
  Caption = 'Consulta de Estoque de Itens dos Produtos nas Lojas'
  ClientHeight = 578
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object gbLoja: TPanel
    Left = 0
    Top = 28
    Width = 795
    Height = 91
    Align = alTop
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label34: TLabel
      Left = 14
      Top = 51
      Width = 20
      Height = 13
      Caption = 'Cor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 11
      Top = 69
      Width = 25
      Height = 13
      Caption = 'Tam'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 388
      Top = 51
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 642
      Top = 24
      Width = 42
      Height = 13
      Caption = 'CTRL+U'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 522
      Top = 48
      Width = 41
      Height = 13
      Caption = 'CTRL+C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 96
      Top = 72
      Width = 41
      Height = 13
      Caption = 'CTRL+T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtCor: TMaskEdit
      Left = 40
      Top = 43
      Width = 51
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 0
      Text = '    '
      OnChange = edtCorChange
      OnDblClick = edtCorDblClick
      OnEnter = edtRefIntEnter
      OnExit = edtCorExit
      OnKeyDown = edtCorKeyDown
    end
    object pnCor: TPanel
      Left = 95
      Top = 43
      Width = 289
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
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
    object edtFaixaTam: TMaskEdit
      Left = 40
      Top = 65
      Width = 51
      Height = 21
      MaxLength = 5
      TabOrder = 1
      OnChange = edtFaixaTamChange
      OnDblClick = edtFaixaTamDblClick
      OnEnter = edtRefIntEnter
      OnExit = edtFaixaTamExit
      OnKeyDown = edtFaixaTamKeyDown
    end
    object pnProduto: TPanel
      Left = 222
      Top = 20
      Width = 410
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
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
    object pnLocal1: TPanel
      Left = 37
      Top = 3
      Width = 183
      Height = 39
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 4
      Visible = False
      object Label14: TLabel
        Left = 3
        Top = 4
        Width = 35
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 44
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Subgrupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 104
        Top = 4
        Width = 75
        Height = 13
        Caption = 'C'#243'd. Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtGrupo: TMaskEdit
        Left = 3
        Top = 17
        Width = 39
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        EditMask = '!99;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        Text = '  '
        OnChange = edtGrupoChange
        OnDblClick = edtGrupoDblClick
        OnEnter = edtGrupoEnter
        OnExit = edtGrupoExit
        OnKeyDown = edtGrupoKeyDown
      end
      object edtSubGrupo: TMaskEdit
        Left = 44
        Top = 17
        Width = 58
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
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
        OnChange = edtSubGrupoChange
        OnDblClick = edtSubGrupoDblClick
        OnEnter = edtSubGrupoEnter
        OnExit = edtSubGrupoExit
        OnKeyDown = edtSubGrupoKeyDown
      end
      object edtCodigo: TMaskEdit
        Left = 104
        Top = 17
        Width = 78
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        TabOrder = 2
        Text = '    '
        OnChange = edtCodigoChange
        OnDblClick = edtCodigoDblClick
        OnEnter = edtCodigoEnter
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
      end
    end
    object pnLocal2: TPanel
      Left = 226
      Top = 3
      Width = 182
      Height = 39
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 5
      Visible = False
      object Label18: TLabel
        Left = 3
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Ref. Interna'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRefInt: TMaskEdit
        Left = 3
        Top = 17
        Width = 178
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 12
        ParentFont = False
        TabOrder = 0
        OnChange = edtRefIntChange
        OnDblClick = edtRefIntDblClick
        OnEnter = edtRefIntEnter
        OnExit = edtRefIntExit
        OnKeyDown = edtRefIntKeyDown
      end
    end
    object pnUnidade: TPanel
      Left = 440
      Top = 43
      Width = 76
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object pnLocal3: TPanel
      Left = 410
      Top = 3
      Width = 185
      Height = 39
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 7
      Visible = False
      object Label22: TLabel
        Left = 63
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Ref. do fabric.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 5
        Top = 4
        Width = 44
        Height = 13
        Caption = 'Fornec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRefFab: TMaskEdit
        Left = 63
        Top = 17
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentFont = False
        TabOrder = 0
        OnChange = edtRefFabChange
        OnDblClick = edtRefFabDblClick
        OnEnter = edtRefIntEnter
        OnExit = edtRefFabExit
        OnKeyDown = edtRefFabKeyDown
      end
      object edtForn: TMaskEdit
        Left = 3
        Top = 17
        Width = 56
        Height = 21
        CharCase = ecUpperCase
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
        OnChange = edtFornChange
        OnDblClick = edtFornDblClick
        OnEnter = edtRefIntEnter
        OnExit = edtFornExit
        OnKeyDown = edtFornKeyDown
      end
    end
    object btnLocalizar: TPanel
      Left = 146
      Top = 65
      Width = 238
      Height = 24
      Cursor = crHandPoint
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Localizar itens'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btnLocalizarClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 28
    Align = alTop
    Color = clTeal
    TabOrder = 1
    object Label33: TLabel
      Left = 15
      Top = 13
      Width = 25
      Height = 13
      Caption = 'Loja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 642
      Top = 9
      Width = 39
      Height = 13
      Caption = 'CTRL+J'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtLoja: TMaskEdit
      Left = 42
      Top = 5
      Width = 51
      Height = 21
      EditMask = '!99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '  '
      OnChange = edtLojaChange
      OnDblClick = edtLojaDblClick
      OnEnter = edtLojaEnter
      OnExit = edtLojaExit
      OnKeyDown = edtLojaKeyDown
    end
    object pnLoja: TPanel
      Left = 97
      Top = 5
      Width = 536
      Height = 21
      Alignment = taLeftJustify
      BevelInner = bvLowered
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 119
    Width = 800
    Height = 462
    Cursor = crHandPoint
    ActivePage = pagina1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabIndex = 0
    TabOrder = 2
    OnChange = PageControl1Change
    object pagina1: TTabSheet
      Caption = 'Exibindo Itens'
      object grade: TDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 335
        Cursor = crHandPoint
        Hint = '[ENTER] / Duplo clique, exibe dados do item selecionado'
        Align = alClient
        Color = clInfoBk
        DataSource = ds1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = gradeDblClick
        OnEnter = gradeEnter
        OnExit = edtFaixaTamExit
        OnKeyDown = gradeKeyDown
        Columns = <
          item
            Alignment = taLeftJustify
            Color = clTeal
            Expanded = False
            FieldName = 'EL_LOJA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Loja'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cCodigo'
            Title.Caption = 'C'#243'digo'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cRefi'
            Title.Caption = 'Ref/Interna'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cReffab'
            Title.Caption = 'Ref/Fabric.'
            Width = 75
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'ES_CBAR'
            Title.Caption = 'C'#243'digo de Barras'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'cDesc'
            Title.Caption = 'Descri'#231#227'o do produto'
            Width = 331
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cor'
            Title.Caption = 'Cor'
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cTam'
            Title.Caption = 'Tam'
            Width = 47
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'FQTD1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Qtde2'
            Width = 50
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'pprinc1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Pre'#231'o Principal $'
            Visible = False
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'pvenda1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Pre'#231'o Diferenciado $'
            Visible = False
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'pvigente1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Pre'#231'o Promocional $'
            Visible = False
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'pprinc1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Pre'#231'o Vigente $'
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 335
        Width = 792
        Height = 99
        Align = alBottom
        Color = clTeal
        TabOrder = 1
        object btnMudarProduto: TSpeedButton
          Left = 111
          Top = 3
          Width = 106
          Height = 22
          Cursor = crHandPoint
          Caption = 'Mudar prod&Uto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnMudarProdutoClick
        end
        object btnMudarLoja: TSpeedButton
          Left = 6
          Top = 3
          Width = 105
          Height = 22
          Cursor = crHandPoint
          Caption = 'Mudar lo&Ja'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnMudarLojaClick
        end
        object btnExibirCodBarras: TSpeedButton
          Left = 217
          Top = 3
          Width = 170
          Height = 22
          Cursor = crHandPoint
          Caption = 'Exibir c'#243'digo de barras >>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnExibirCodBarrasClick
        end
        object btnExibirTodosPrecos: TSpeedButton
          Left = 706
          Top = 3
          Width = 168
          Height = 22
          Cursor = crHandPoint
          Caption = 'Exibir todos os pre'#231'os >>>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          OnClick = btnExibirTodosPrecosClick
        end
        object btnDadosProduto: TSpeedButton
          Left = 387
          Top = 3
          Width = 160
          Height = 22
          Cursor = crHandPoint
          Caption = 'Dados do produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnDadosProdutoClick
        end
        object LabelOO1: TLabelOO
          Left = 8
          Top = 33
          Width = 65
          Height = 13
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 547
          Top = 3
          Width = 160
          Height = 22
          Cursor = crHandPoint
          Caption = 'Grade de itens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object LbAtualizado: TLabelOO
          Left = 535
          Top = 28
          Width = 250
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Atualizado'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object lbF8: TLabel
          Left = 7
          Top = 55
          Width = 26
          Height = 13
          Caption = 'F8->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbF8Mens: TLabel
          Left = 33
          Top = 55
          Width = 147
          Height = 13
          Caption = 'Exibe grupos cadastrados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblStatus: TLabel
          Left = 7
          Top = 69
          Width = 203
          Height = 23
          Cursor = crHandPoint
          Hint = 'Duplo clique exibe a situa'#231#227'o atual das conex'#245'es'
          Alignment = taCenter
          Caption = '[On-Line] / [ECF: Urano]'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = True
        end
        object btnEditarMovimento: TSpeedButton
          Left = 376
          Top = 61
          Width = 228
          Height = 27
          Cursor = crHandPoint
          Hint = 'Verifica o movimento do item selecionado na grade'
          Caption = 'Transf'#234'ncia do item - [CTRL+F]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF019ACF019ACF019ACF019ACFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF0D9FD18BD4EE6BD3F845C0ED28B0E0019ACF01
            9ACF019ACF019ACFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF069CD076C8E5A9E9FE6DD8
            FF75DBFF77DCFF77DBFF63D1F930B3E3029BD0019ACF019ACF019ACF019ACFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF019ACF
            34AFD9BCE9F86ED8FF6FD8FE70D8FE70D8FE71D8FF74DBFF7ADEFF79DDFF73D9
            FF5CCCF522ACDD019ACF019ACF019ACFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF019ACF1FA9D68FD3EB97E4FF6FD9FE71D9FE71D9FE71D9FE71D9FE
            71D9FE71D9FE73DAFE76DCFF7BDFFF7ADEFF78DCFF77DCFF019ACFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF019ACF31B1DC49B7DEBDEEFB71DDFE77DEFE77
            DEFE77DEFE77DEFE77DEFE77DEFE77DEFE76DEFE76DEFE76DEFE78DFFF7CE1FF
            65D2F8019ACFFF00FFFF00FFFF00FFFF00FFFF00FF019ACF52C2E71DA7D5ADE2
            F38FE8FF7CE2FE7CE3FE7CE3FE7CE3FE7CE3FE7CE3FE7CE3FE7CE3FE7CE3FE7C
            E3FE7DE4FE7DE3FE5ED1F3019ACFFF00FFFF00FFFF00FFFF00FFFF00FF019ACF
            60CAEF1FA8D85EC1E2BBF4FE7DE7FE82E8FE81E8FE81E8FE0C85181085200C85
            1846B68B81E8FE81E8FE82E8FE84E9FE5ED3F18DEEFF019ACFFF00FFFF00FFFF
            00FFFF00FF019ACF65CFF53EB7E529ACD8BFEEF88DEFFF85EDFF85EDFF85EDFF
            85EDFF0C85180D9C180988120C85187AE1E887EDFF89EEFF65D9F396F5FF019A
            CFFF00FFFF00FFFF00FFFF00FF019ACF69D1F855C4F31FA7D771C9E3C3FBFD93
            F7FF93F7FF92F6FF8DF4FF89F3FF0C85180FA71D0B95160C851887EEF88EF3FF
            6ADEF395F8FF98FAFF019ACFFF00FFFF00FFFF00FF019ACF77D5FC5CC8FB3EB8
            E920A7D5B6E6F3D0F4FAD1F5FAD2F6FAD5F9FCB9FBFE9BF8FF0C85180FA61C0A
            8E140C851895F8FF71E3F39FFCFFA4FFFF43C1E2019ACFFF00FFFF00FF019ACF
            8BDBFF5FCDFF64CDFE2CAFE30D9FD30FA0D310A0D310A0D317A3D38ED7ECE2FD
            FE0E8D190FA51C0EA31B198A2995E9E383E4F3B6FDFFBAFFFFB5FCFD019ACFFF
            00FFFF00FF019ACF99E2FF67D3FF6DD4FE6CD4FE69D1FE64CEFB61CDF95BC9F5
            48BEEB17A3D549B6D630913A17AB280FA61D0A8F1474C0989CE4F2DAFEFFD9FE
            FFE3FFFFADE9F5019ACFFF00FF019ACF9FE9FF70DCFF76DDFE76DDFE76DDFE75
            DCFE74DCFE73DCFE73DBFE61CEF61CA8D90C814122B43919AE2B0F9E1C55A460
            CEEEF7F8FFFFF7FFFFFEFFFFE9F9FD019ACFFF00FF019ACFA7EFFF76E5FF7CE5
            FF7CE5FF7CE5FF7CE5FF7DE5FF7BE3FB74DCED77DDF26FDAF41586412EBE4A25
            B63C1AAC2C0881260195B90198C60197C20197C2019ACF019ACFFF00FF019ACF
            ABF6FF7EEDFF85ECFF85ECFF85ECFF85ECFF84ECFF0C85180C85182292400C85
            181F96343AC75B31BF4D27BA3F12921F0C85180C85180C85180C8518FF00FFFF
            00FFFF00FF019ACFC7FFFF82F5FF8FF5FF8FF5FF8FF5FF8EF5FF8DF4FFA0FDFF
            0C85181E902E55DD8151DB7E46D16D3CC95F32C15028BA421EB3330C89160C85
            18FF00FFFF00FFFF00FFFF00FF019ACFA4E0F0A0FDFF8AFCFF90FCFF90FCFF90
            FCFF99FDFF86E8F5019ACF0C8518279F3D5AE38B53DD7F48D26F3ECA6035C655
            1A9B2B0C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF019ACFECFFFFBCFF
            FFBCFFFFBCFFFFC0FFFF9DF5FB019ACFFF00FFFF00FF0C851835B1535CE58D54
            DC804CD8762CAF470C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF019ACF019ACF019ACF019ACF019ACF019ACFFF00FFFF00FFFF00FFFF00
            FF0C851842C36660EA9342C5660C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0C851842C1650C8518FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C8518FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEditarMovimentoClick
        end
        object lblajuda: TLabelOO
          Left = 625
          Top = 69
          Width = 74
          Height = 13
          Caption = '[F1] -> Ajuda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnForn: TPanel
          Left = 77
          Top = 28
          Width = 630
          Height = 23
          Alignment = taLeftJustify
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = ' '
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object botao_sair: TPanel
          Left = 706
          Top = 65
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
          TabOrder = 1
          OnClick = botao_sairClick
        end
      end
    end
    object pagina2: TTabSheet
      Caption = 'Exibindo Grade de itens'
      ImageIndex = 1
      object grade2: TDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 399
        Cursor = crHandPoint
        Align = alClient
        Color = clInfoBk
        DataSource = ds2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
      object Memo3: TMemo
        Left = 560
        Top = 16
        Width = 209
        Height = 73
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        Visible = False
      end
      object Panel15: TPanel
        Left = 0
        Top = 399
        Width = 792
        Height = 0
        Align = alBottom
        Color = clTeal
        TabOrder = 1
        object btnMudarProduto2: TSpeedButton
          Left = 111
          Top = 3
          Width = 105
          Height = 22
          Cursor = crHandPoint
          Caption = 'Mudar Prod&Uto'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btnMudarLoja2: TSpeedButton
          Left = 6
          Top = 3
          Width = 105
          Height = 22
          Cursor = crHandPoint
          Caption = 'Mudar lo&Ja'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 399
        Width = 792
        Height = 35
        Align = alBottom
        Color = clTeal
        TabOrder = 2
        object btnVer1: TSpeedButton
          Left = 6
          Top = 3
          Width = 105
          Height = 22
          Cursor = crHandPoint
          Caption = 'Ver quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnVer1Click
        end
        object btnVer5: TSpeedButton
          Left = 111
          Top = 3
          Width = 106
          Height = 22
          Cursor = crHandPoint
          Caption = 'Ver pre'#231'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnVer5Click
        end
        object Label19: TLabel
          Left = 632
          Top = 7
          Width = 77
          Height = 13
          Caption = 'Saldo total ->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnQtdeTotal: TPanel
          Left = 712
          Top = 1
          Width = 79
          Height = 24
          BevelInner = bvLowered
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object qEstoque: TQuery
    AfterScroll = qEstoqueAfterScroll
    OnCalcFields = qEstoqueCalcFields
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT ESTOQUE_LOJA.*,ES_CBAR,ES_CEAN,ES_PVE1,ES_PVE2'
      'FROM ESTOQUE_LOJA,ESTOQUE'
      'Where (EL_GRUP=1) AND               '
      '      (EL_SUBG=1) AND            '
      '      (EL_PROD=1) AND             '
      '      (EL_LOJA=1) AND                       '
      '      (EL_CORE=1) AND                        '
      '      (EL_TAMA='#39'0'#39') AND'
      
        '      (EL_GRUP=ES_GRUP) AND (EL_SUBG=ES_SUBG) AND (EL_PROD=ES_PR' +
        'OD) AND '
      '      (EL_CORE=ES_CORE) AND (EL_TAMA=ES_TAMA)'
      'Order by EL_LOJA,EL_GRUP,EL_SUBG,EL_PROD,EL_CORE,EL_OTAM '
      ''
      ''
      ' ')
    Left = 189
    Top = 282
    object qEstoqueloja: TStringField
      FieldKind = fkCalculated
      FieldName = 'loja'
      Calculated = True
    end
    object qEstoquecor: TStringField
      FieldKind = fkCalculated
      FieldName = 'cor'
      Calculated = True
    end
    object qEstoquecTam: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTam'
      Size = 10
      Calculated = True
    end
    object qEstoqueEL_GRUP: TFloatField
      FieldName = 'EL_GRUP'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_GRUP'
    end
    object qEstoqueEL_SUBG: TFloatField
      FieldName = 'EL_SUBG'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_SUBG'
    end
    object qEstoqueEL_PROD: TFloatField
      FieldName = 'EL_PROD'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PROD'
    end
    object qEstoqueEL_CORE: TFloatField
      FieldName = 'EL_CORE'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_CORE'
    end
    object qEstoqueEL_TAMA: TStringField
      FieldName = 'EL_TAMA'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_TAMA'
      Size = 5
    end
    object qEstoqueEL_LOJA: TFloatField
      FieldName = 'EL_LOJA'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_LOJA'
      DisplayFormat = '00'
    end
    object qEstoqueEL_PVE1: TFloatField
      FieldName = 'EL_PVE1'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PVE1'
    end
    object qEstoqueEL_PVE2: TFloatField
      FieldName = 'EL_PVE2'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PVE2'
    end
    object qEstoqueEL_PCU1: TFloatField
      FieldName = 'EL_PCU1'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PCU1'
    end
    object qEstoqueEL_PCU2: TFloatField
      FieldName = 'EL_PCU2'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_PCU2'
    end
    object qEstoqueEL_QTD1: TFloatField
      FieldName = 'EL_QTD1'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_QTD1'
    end
    object qEstoqueEL_QTD2: TFloatField
      FieldName = 'EL_QTD2'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_QTD2'
    end
    object qEstoquecDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'cDesc'
      Size = 60
      Calculated = True
    end
    object qEstoquepvenda1: TStringField
      FieldKind = fkCalculated
      FieldName = 'pdif1'
      Size = 10
      Calculated = True
    end
    object qEstoquepcusto1: TStringField
      FieldKind = fkCalculated
      FieldName = 'pcusto1'
      Calculated = True
    end
    object qEstoquepcusto2: TStringField
      FieldKind = fkCalculated
      FieldName = 'pcusto2'
      Calculated = True
    end
    object qEstoquepvenda2: TStringField
      FieldKind = fkCalculated
      FieldName = 'pdif2'
      Size = 10
      Calculated = True
    end
    object qEstoquefEL_QTD3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'fEL_QTD3'
      Calculated = True
    end
    object qEstoqueEL_UPC1: TFloatField
      FieldName = 'EL_UPC1'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_UPC1'
    end
    object qEstoqueEL_UPC2: TFloatField
      FieldName = 'EL_UPC2'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_UPC2'
    end
    object qEstoquecRefi: TStringField
      FieldKind = fkCalculated
      FieldName = 'cRefi'
      Calculated = True
    end
    object qEstoquecCodigo: TStringField
      FieldKind = fkCalculated
      FieldName = 'cCodigo'
      Calculated = True
    end
    object qEstoquecUnidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'cUnidade'
      Calculated = True
    end
    object qEstoquecReffab: TStringField
      FieldKind = fkCalculated
      FieldName = 'cReffab'
      Calculated = True
    end
    object qEstoquepvigente1: TStringField
      FieldKind = fkCalculated
      FieldName = 'pvigente1'
      Size = 10
      Calculated = True
    end
    object qEstoquepvigente2: TStringField
      FieldKind = fkCalculated
      FieldName = 'pvigente2'
      Size = 10
      Calculated = True
    end
    object qEstoqueES_CBAR: TStringField
      DisplayWidth = 20
      FieldName = 'ES_CBAR'
      Origin = 'ESTOQUE.ESTOQUE.ES_CBAR'
      Size = 14
    end
    object qEstoqueES_PVE1: TFloatField
      FieldName = 'ES_PVE1'
      Origin = 'ESTOQUE.ESTOQUE.ES_PVE1'
    end
    object qEstoqueES_PVE2: TFloatField
      FieldName = 'ES_PVE2'
      Origin = 'ESTOQUE.ESTOQUE.ES_PVE2'
    end
    object qEstoqueppromocional1: TStringField
      FieldKind = fkCalculated
      FieldName = 'ppromocional1'
      Size = 10
      Calculated = True
    end
    object qEstoqueppromocional2: TStringField
      FieldKind = fkCalculated
      FieldName = 'ppromocional2'
      Size = 10
      Calculated = True
    end
    object qEstoquepprinc1: TStringField
      FieldKind = fkCalculated
      FieldName = 'pprinc1'
      Size = 10
      Calculated = True
    end
    object qEstoquepprinc2: TStringField
      FieldKind = fkCalculated
      FieldName = 'pprinc2'
      Size = 10
      Calculated = True
    end
    object qEstoqueES_CEAN: TStringField
      DisplayWidth = 20
      FieldName = 'ES_CEAN'
      Origin = 'ESTOQUE.ESTOQUE.ES_CEAN'
      Size = 30
    end
    object qEstoqueEL_UVEN: TDateTimeField
      FieldName = 'EL_UVEN'
    end
    object qEstoqueEL_UTRF: TDateTimeField
      FieldName = 'EL_UTRF'
    end
    object qEstoqueEL_UVLM: TDateTimeField
      FieldName = 'EL_UVLM'
    end
    object qEstoqueFQTD1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FQTD1'
      Calculated = True
    end
    object qEstoqueEL_TIME: TDateTimeField
      FieldName = 'EL_TIME'
    end
  end
  object qLojas: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT DISTINCT EL_LOJA'
      'FROM ESTOQUE_LOJA'
      'WHERE (EL_GRUP=:grupo) AND'
      '               (EL_SUBG=:subgrupo) AND'
      '               (EL_PROD=:produto)')
    Left = 276
    Top = 194
    ParamData = <
      item
        DataType = ftFloat
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subgrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qLojasEL_LOJA: TFloatField
      FieldName = 'EL_LOJA'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_LOJA'
    end
  end
  object qCores: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT DISTINCT EL_CORE'
      'FROM ESTOQUE_LOJA'
      'WHERE (EL_GRUP=:grupo) AND'
      '               (EL_SUBG=:subgrupo) AND'
      '               (EL_PROD=:produto)')
    Left = 130
    Top = 186
    ParamData = <
      item
        DataType = ftFloat
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subgrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qCoresEL_CORE: TFloatField
      FieldName = 'EL_CORE'
      Origin = 'ESTOQUE.ESTOQUE_LOJA.EL_CORE'
    end
  end
  object qFaixas: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT DISTINCT IT_TAMA'
      'FROM ITENS_PEDIDO_COMPRA'
      'WHERE (IT_NPED=:pedido) AND'
      '      (IT_GRUP=PR_GRUP) AND'
      '      (IT_SUBG=PR_SUBG) AND'
      '      (IT_PROD=PR_CODI)'
      ' ')
    Left = 160
    Top = 186
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pedido'
        ParamType = ptUnknown
      end>
  end
  object ds1: TDataSource
    DataSet = qEstoque
    Left = 39
    Top = 186
  end
  object ds2: TDataSource
    DataSet = qGrade
    Left = 39
    Top = 231
  end
  object qGrade: TQuery
    DatabaseName = 'ESTOQUE'
    Left = 69
    Top = 239
  end
  object Query1: TQuery
    DatabaseName = 'ESTOQUE'
    SQL.Strings = (
      'SELECT ESTOQUE_LOJA.*,ES_CBAR,ES_CEAN,ES_PVE1,ES_PVE2'
      'FROM ESTOQUE_LOJA,ESTOQUE'
      'Where (EL_GRUP=1) AND               '
      '      (EL_SUBG=1) AND            '
      '      (EL_PROD=1) AND             '
      '      (EL_LOJA=1) AND                       '
      '      (EL_CORE=1) AND                        '
      '      (EL_TAMA='#39'0'#39') AND'
      
        '      (EL_GRUP=ES_GRUP) AND (EL_SUBG=ES_SUBG) AND (EL_PROD=ES_PR' +
        'OD) AND '
      '      (EL_CORE=ES_CORE) AND (EL_TAMA=ES_TAMA)'
      'Order by EL_LOJA,EL_GRUP,EL_SUBG,EL_PROD,EL_CORE,EL_OTAM '
      ''
      ''
      ' ')
    Left = 213
    Top = 282
  end
end
