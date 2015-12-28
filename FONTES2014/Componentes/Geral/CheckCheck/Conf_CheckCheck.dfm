object Frm_Conf_CheckCheck: TFrm_Conf_CheckCheck
  Left = 76
  Top = 57
  Width = 657
  Height = 375
  Caption = 'Configura'#231#227'o dos Dados Gerais para consultas Check Check'
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 649
    Height = 307
    ActivePage = TabSheet3
    Align = alClient
    Style = tsButtons
    TabIndex = 2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Conex'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lblSerial: TLabel
        Left = 0
        Top = 104
        Width = 94
        Height = 13
        Caption = 'Serial do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSenha: TLabel
        Left = 0
        Top = 55
        Width = 98
        Height = 13
        Caption = 'Senha do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigo: TLabel
        Left = 0
        Top = 8
        Width = 101
        Height = 13
        Caption = 'C'#243'digo do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 0
        Top = 200
        Width = 284
        Height = 13
        Caption = 'Senha MASTER para habilitar clientes com d'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 0
        Top = 152
        Width = 423
        Height = 13
        Caption = 
          'Bloqueia clientes de acordo com crit'#233'rios estabelecidos pela che' +
          'ck check'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtCodigo: TEdit
        Tag = 4
        Left = 0
        Top = 24
        Width = 129
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = txtCodigoKeyDown
      end
      object txtSenha: TEdit
        Tag = 4
        Left = 0
        Top = 71
        Width = 129
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        OnKeyDown = txtCodigoKeyDown
      end
      object txtSerial: TEdit
        Tag = 4
        Left = 0
        Top = 122
        Width = 129
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyDown = txtCodigoKeyDown
      end
      object SenhaM: TEdit
        Tag = 4
        Left = 0
        Top = 218
        Width = 129
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = 'X'
        TabOrder = 3
        OnKeyDown = txtCodigoKeyDown
      end
      object BloqCheckCheck: TComboSql
        Left = 0
        Top = 168
        Width = 129
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 4
        Items.Strings = (
          'Sim'
          'N'#227'o'
          'Senha')
        TipoCampo = varString
        Retorno = RcValores
        Valores.Strings = (
          'T'
          'F'
          'S')
        IncluiValores = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consultas'
      ImageIndex = 1
      object GridCons: TGridSql
        Left = 0
        Top = 0
        Width = 614
        Height = 276
        Align = alClient
        ColCount = 6
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
        TabOrder = 0
        OnKeyDown = GridConsKeyDown
        CtrlDelete = True
        IncluiLinha = True
        OnGetCellAlignment = GridConsGetCellAlignment
        OnGetCellColor = GridConsGetCellColor
        OnMovimentaCelula = GridConsMovimentaCelula
        PosicionaLinha = 0
        PosicionarLinha = False
        MovMouseLinha = True
        OnMovLinha = GridConsMovLinha
        ColChaves = '1'
        AndaProLado = False
        TituloHorizontal.Strings = (
          'Pos'
          'Consulta'
          'Valor de cada consulta'
          'Faixa Inicial'
          'Faixa Final'
          'Senha')
        ColunaMarcada = 0
        F3Editor = False
        OnMontaGridDataSet = GridConsMontaGridDataSet
        ColWidths = (
          27
          180
          151
          96
          85
          66)
      end
      object Panel2: TPanel
        Left = 614
        Top = 0
        Width = 27
        Height = 276
        Align = alRight
        TabOrder = 1
        object BPracima: TSpeedButton
          Left = 2
          Top = 3
          Width = 24
          Height = 142
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
            3333333333777F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
            3333333777737777F333333099999990333333373F3333373333333309999903
            333333337F33337F33333333099999033333333373F333733333333330999033
            3333333337F337F3333333333099903333333333373F37333333333333090333
            33333333337F7F33333333333309033333333333337373333333333333303333
            333333333337F333333333333330333333333333333733333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = BPracimaClick
        end
        object BPraBaixo: TSpeedButton
          Left = 2
          Top = 146
          Width = 24
          Height = 122
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = BPracimaClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Retornos'
      ImageIndex = 2
      object Retorno: TGridSql
        Left = 0
        Top = 0
        Width = 641
        Height = 276
        Align = alClient
        ColCount = 8
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
        TabOrder = 0
        OnGetCellColor = RetornoGetCellColor
        PosicionaLinha = 0
        PosicionarLinha = False
        MovMouseLinha = True
        ColChaves = '1'
        AndaProLado = False
        Campos.Strings = (
          ''
          ''
          'Ck_Exibe'
          'Ck_Trava'
          'Ck_Alinhamento'
          'Ck_Tam'
          'Ck_Grupo'
          'Ck_Campo')
        TituloHorizontal.Strings = (
          'Grupo'
          'Campo'
          'Exibe'
          'Trava'
          'Alinhamento'
          'Tamanho')
        ColunaMarcada = 0
        F3Editor = False
        ColWidths = (
          204
          196
          78
          79
          94
          77
          64
          64)
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 307
    Width = 649
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object botao_sair: TPanel
      Left = 563
      Top = 9
      Width = 76
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
    object btnAplicar: TButton
      Left = 373
      Top = 9
      Width = 182
      Height = 25
      Cursor = crHandPoint
      Caption = 'Aplicar configura'#231#245'es - [F5]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAplicarClick
    end
  end
  object Query1: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'ALTER TABLE USERS'
      'ADD USGRUPO DOUBLE PRECISION ')
    Left = 377
    Top = 77
  end
  object Query2: TQuery
    DatabaseName = 'CREDITO'
    SQL.Strings = (
      'ALTER TABLE USERS'
      'ADD USGRUPO DOUBLE PRECISION ')
    Left = 297
    Top = 77
  end
end
