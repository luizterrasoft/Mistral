object Frm_DadosDbGrid: TFrm_DadosDbGrid
  Left = 267
  Top = 189
  Width = 421
  Height = 276
  BorderIcons = [biSystemMenu]
  Caption = 'Dados DbGrid'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 413
    Height = 208
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '&1.Faixas'
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 35
        Height = 13
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 144
        Top = 16
        Width = 8
        Height = 13
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 2
        Top = 40
        Width = 79
        Height = 13
        Caption = 'Pesquisar Por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TMaskEditControle
        Tag = 1
        Left = 0
        Top = 14
        Width = 121
        Height = 21
        TabOrder = 0
        Obrigatorio = False
        Encontrou = False
        Alignment = taLeftJustify
        VerificaData = False
        VerificaHora = False
        DataDoDia = False
        FormataData = False
        FormatDate = False
      end
      object Edit2: TMaskEditControle
        Left = 160
        Top = 14
        Width = 121
        Height = 21
        TabOrder = 1
        Obrigatorio = False
        Encontrou = False
        Alignment = taLeftJustify
        VerificaData = False
        VerificaHora = False
        DataDoDia = False
        FormataData = False
        FormatDate = False
      end
      object Pesquisa: TComboSql
        Left = 0
        Top = 55
        Width = 302
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnExit = PesquisaExit
        Items.Strings = (
          'Inicio Palavra'
          'Palavra inteira'
          'Final Palavra'
          'Palavra identica'
          'Faixa'
          'Separados')
        TipoCampo = varString
        Retorno = RCText
        IncluiValores = False
      end
      object CkConcatena: TCheckControle
        Left = 0
        Top = 81
        Width = 297
        Height = 17
        Caption = '&Concatena Pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Encontrou = False
        Enter = False
        ClickAut = False
        TipoValor = varString
      end
      object CkDiferente: TCheckControle
        Left = 0
        Top = 97
        Width = 297
        Height = 17
        Caption = '&Diferente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Encontrou = False
        Enter = False
        ClickAut = False
        TipoValor = varString
      end
      object CkSeparador: TCheckControle
        Left = 0
        Top = 113
        Width = 297
        Height = 17
        Caption = '&Separador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Encontrou = False
        Enter = False
        ClickAut = False
        TipoValor = varString
      end
      object CkNupper: TCheckControle
        Left = 0
        Top = 127
        Width = 233
        Height = 23
        Caption = 'Diferenciar &Mai'#250'sculas e M'#237'nusculas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        Encontrou = False
        Enter = False
        ClickAut = False
        TipoValor = varString
      end
      object CkPesqMestre: TCheckControle
        Left = 0
        Top = 148
        Width = 233
        Height = 18
        Caption = 'Pesquisar na &Tabela Mestre'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 7
        Visible = False
        Encontrou = False
        Enter = False
        ClickAut = False
        TipoValor = varString
      end
      object CkAllDetals: TCheckControle
        Left = 0
        Top = 164
        Width = 241
        Height = 18
        Caption = 'Retorna todos os Registros da Tabela Detalhe'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 8
        Visible = False
        Encontrou = False
        Enter = False
        ClickAut = False
        TipoValor = varString
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&2.Ordem'
      ImageIndex = 1
      object GridOrdem: TGridSql
        Left = 0
        Top = 0
        Width = 405
        Height = 180
        Align = alClient
        ColCount = 3
        DefaultColWidth = 100
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
        TabOrder = 0
        OnEnter = GridOrdemEnter
        OnExit = GridOrdemExit
        OnSelectCell = GridOrdemSelectCell
        CtrlDelete = True
        IncluiLinha = True
        PosicionaLinha = 0
        PosicionarLinha = False
        MovMouseLinha = True
        TituloHorizontal.Strings = (
          'Campo'
          ''
          'Asc/Desc')
        ColunaMarcada = 0
        F3Editor = False
        ColWidths = (
          100
          100
          100)
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&3.Totais'
      ImageIndex = 2
      object GridTotal: TGridSql
        Left = 0
        Top = 0
        Width = 405
        Height = 158
        Align = alClient
        ColCount = 3
        DefaultColWidth = 150
        DefaultRowHeight = 18
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        CtrlDelete = True
        IncluiLinha = True
        OnGetCellAlignment = GridTotalGetCellAlignment
        PosicionaLinha = 0
        PosicionarLinha = False
        MovMouseLinha = True
        TituloHorizontal.Strings = (
          'Campo'
          'Total'
          'Media')
        ColunaMarcada = 0
        F3Editor = False
        ColWidths = (
          150
          122
          150)
        RowHeights = (
          18
          19)
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 208
    Width = 413
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 117
      Top = 4
      Width = 113
      Height = 29
      Caption = 'Confirma'
      Default = True
      ModalResult = 1
      TabOrder = 0
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
    end
  end
end
