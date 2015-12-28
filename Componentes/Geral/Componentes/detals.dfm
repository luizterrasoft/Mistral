object Frm_Detals: TFrm_Detals
  Left = 21
  Top = 94
  ActiveControl = ValorParcial
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Detalhamento'
  ClientHeight = 398
  ClientWidth = 771
  Color = 16056319
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 3
    Width = 63
    Height = 13
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 2
    Top = 91
    Width = 38
    Height = 13
    Caption = 'Faltam'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 2
    Top = 137
    Width = 30
    Height = 13
    Caption = '&Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object NomeDetal: TLabel
    Left = 433
    Top = 0
    Width = 337
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Forma de Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 2
    Top = 49
    Width = 79
    Height = 13
    Caption = 'Valor Inserido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 619
    Top = 268
    Width = 113
    Height = 13
    Caption = 'Data de &Pagamento'
    FocusControl = Pagamento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbParcela: TLabel
    Left = 599
    Top = 202
    Width = 55
    Height = 13
    Caption = 'Parcela 1'
    FocusControl = Pagamento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object ValorParcial: TEditControle
    Left = 2
    Top = 152
    Width = 207
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnExit = ValorParcialExit
    Obrigatorio = False
    Posicao = 0
    NextPos = Formas
    Encontrou = False
    Tipo = tpDecimal
    Mascara = '#,##0.00'
    Alignment = taRightJustify
  end
  object btIncluiDetalhe: TBitBtn
    Left = 431
    Top = 198
    Width = 164
    Height = 29
    Hint = 'Para Incluir a Forma de Pagamento<Tecle Insert>'
    Caption = 'Incluir <Tecle Insert>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btIncluiDetalheClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333FF33333333FF333993333333300033377F3333333777333993333333
      300033F77FFF3333377739999993333333333777777F3333333F399999933333
      33003777777333333377333993333333330033377F3333333377333993333333
      3333333773333333333F333333333333330033333333F33333773333333C3333
      330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
      333333333337733333FF3333333C333330003333333733333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object btExcluiDetalhamento: TBitBtn
    Left = 430
    Top = 244
    Width = 166
    Height = 29
    Hint = 'Para Excluir Forma de Pagamento Selecionada<Tecle Ctrl + Delete>'
    Caption = 'Excluir<Tecle Ctrl + Del>'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btExcluiDetalhamentoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
      0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
      703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
      700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
      0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
      03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
      033333777777777773333333307770333333333337FFF7F33333333330000033
      3333333337777733333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 357
    Width = 771
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 16056319
    TabOrder = 12
    object btOK: TBitBtn
      Left = 253
      Top = 6
      Width = 150
      Height = 30
      Hint = 'Confirma Operação'
      Caption = 'Confirma'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btOKClick
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBF7F00007F00
        007F00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBF
        BFBFBFBF7F0000007F00007F007F00007F00007F7F7F7F7F7F7F7F7F7F7F7FBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF00FF00007F00007F00007F00007F007F00007F
        00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000FF00007F00007F0000
        7F00007F00007F00007F007F00007F00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF0000FF00007F00007F00007F00007F00007F00007F00007F007F00007F0000
        7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF0000FF00007F00007F00007F00007F00007F00
        007F00007F00007F007F00007F00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000FF00007F00
        007F00007F00007F00007F00007F00007F00007F00007F007F00007F00007F7F
        7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBF0000FF00007F00007F00007F00007F00007F00007F00007F00007F
        00007F00007F007F00007F00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000FF00007F00007F00007F00007F
        00007F0000FF0000FF00007F00007F00007F00007F007F00007F00007F7F7F7F
        7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000FF
        00007F00007F00007F00007F007F00007F7F7F00FF0000FF00007F00007F0000
        7F00007F007F00007F00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF0000FF00007F00007F00007F00007F007F00007F7F7F7F
        7F7F00FF0000FF00007F00007F00007F00007F007F00007F00007F7F7F7F7F7F
        7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000FF00007F00007F0000
        7F00007F007F00007F7F7F7F7F7FBFBFBF00FF0000FF00007F00007F00007F00
        007F007F00007F00007F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF0000FF0000FF00007F00007F00007F007F00007F7F7F7F7F7FBFBFBFBFBFBF
        00FF0000FF00007F00007F00007F00007F007F00007F7F7F7F7F7F7F7F7F7F7F
        7FBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF00FF00007F00007F00007F007F0000
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FF0000FF00007F00007F00007F007F00
        007F00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF00BFBFBF00FF00
        00FF0000FF0000FF00007F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FF
        0000FF00007F00007F00007F007F00007F00007F7F7F7F7F7F7F7F7F7F7F7FBF
        BFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF00FF0000FF00007F00007F00007F007F00007F
        00007F7F7F7F7F7F7F7F7F7F7F7FBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FF0000
        FF00007F00007F00007F007F00007F00007F7F7F7F7F7F7F7F7F7F7F7F00BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBF00FF0000FF00007F00007F00007F007F00007F0000
        7F7F7F7F7F7F7F7F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FF0000FF00
        007F00007F00007F007F00007F00007F7F7F7F7F7F00BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF00FF0000FF00007F00007F00007F007F00007F7F7F7F7F
        7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FF0000FF00007F
        00007F007F00007F7F7F7F7F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF00FF0000FF00007F007F00007F7F7F7F7F7F00BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FF0000FF00007F00BF
        BFBFBFBFBF00}
    end
    object BitBtn4: TBitBtn
      Left = 448
      Top = 5
      Width = 150
      Height = 31
      Hint = 'Cancela Operação'
      Cancel = True
      Caption = 'Cancela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
  object PnVlTot: TPanelControle
    Tag = 3
    Left = 2
    Top = 21
    Width = 207
    Height = 24
    Alignment = taRightJustify
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object PnFaltam: TPanelControle
    Tag = 3
    Left = 2
    Top = 104
    Width = 207
    Height = 24
    Alignment = taRightJustify
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object PnInserido: TPanelControle
    Tag = 3
    Left = 2
    Top = 60
    Width = 207
    Height = 24
    Alignment = taRightJustify
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object Pagamento: TMaskEditControle
    Left = 640
    Top = 284
    Width = 57
    Height = 21
    TabStop = False
    EditMask = '!99/99/99;1;_'
    MaxLength = 8
    TabOrder = 13
    Text = '  /  /  '
    OnExit = PagamentoExit
    Obrigatorio = True
    NextPos = btOK
    Encontrou = False
    Alignment = taLeftJustify
    VerificaData = False
    VerificaHora = False
    DataDoDia = False
    FormataData = False
    FormatDate = False
  end
  object GeraBaixaParcial: TCheckBox
    Left = 440
    Top = 327
    Width = 137
    Height = 17
    Hint = 
      'Deseja gerar outros documento com a diferença entre valor previs' +
      'to  e o valor pago'
    TabStop = False
    Caption = '&Gera Baixa Parcial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnExit = GeraBaixaParcialExit
  end
  object BtAltera: TBitBtn
    Left = 431
    Top = 294
    Width = 165
    Height = 29
    Hint = 'Para Alterar Forma de Pagamento Selecionada<Tecle Ctrl + Insert>'
    Caption = 'Alterar<Tecle Ctrl + Ins>'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BtAlteraClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
  end
  object BtCancParcelas: TBitBtn
    Left = 653
    Top = 223
    Width = 117
    Height = 21
    Hint = 
      'Cancelar Todas as Parcelas Geradas com esta forma de pagamento i' +
      'nserida'
    Caption = '&Cancelar Parcelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
    OnClick = BtCancParcelasClick
    NumGlyphs = 2
  end
  object BtGeraParcelaCheque: TBitBtn
    Left = 653
    Top = 199
    Width = 118
    Height = 21
    Hint = 'Gerar Parcelas da Forma de Pagamento Selcionada'
    Caption = 'Gerar parcelas C&heque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
    OnClick = BtGeraParcelaChequeClick
    NumGlyphs = 2
  end
  object Informacoes: TGridSql
    Left = 431
    Top = 18
    Width = 339
    Height = 179
    Hint = 'Informações da Forma de Pagamento Selecionada'
    ColCount = 9
    DefaultColWidth = 100
    DefaultRowHeight = 20
    FixedColor = clTeal
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goEditing]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = InformacoesEnter
    OnExit = InformacoesExit
    OnGetEditMask = InformacoesGetEditMask
    OnKeyDown = InformacoesKeyDown
    OnKeyPress = InformacoesKeyPress
    OnSelectCell = InformacoesSelectCell
    Limite = 1
    OnGetCellColor = InformacoesGetCellColor
    SaiemBranco = True
    PosicionaLinha = 0
    PosicionarLinha = False
    MovMouseLinha = False
    ColunaMarcada = 0
    F3Editor = False
    ColWidths = (
      145
      182
      100
      100
      100
      100
      100
      100
      100)
    RowHeights = (
      20)
  end
  object Formas: TGridSql
    Left = 213
    Top = 18
    Width = 212
    Height = 174
    ColCount = 1
    DefaultRowHeight = 18
    FixedColor = clTeal
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 1
    OnExit = FormasExit
    OnKeyDown = FormasKeyDown
    OnGetCellColor = FormasGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = True
    MovMouseLinha = False
    ColunaMarcada = 0
    F3Editor = False
    OnMontaGridDataSet = FormasMontaGridDataSet
    ColWidths = (
      202)
  end
  object SgDetals: TGridSql
    Left = 2
    Top = 195
    Width = 424
    Height = 155
    ColCount = 2
    DefaultRowHeight = 18
    FixedColor = clTeal
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 8
    OnClick = SgDetalsClick
    OnExit = SgDetalsExit
    OnGetCellAlignment = SgDetalsGetCellAlignment
    OnGetCellColor = FormasGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = True
    MovMouseLinha = False
    Campos.Strings = (
      'DESCRICAO'
      'VALOR'
      'TROCO'
      'NOMETABELA'
      'PARCELA'
      'OPERADORA')
    ColunaMarcada = 0
    F3Editor = False
    ColWidths = (
      299
      111)
  end
  object Query1: TQuery
    DatabaseName = 'bd'
    SessionName = 'Default'
    Left = 496
    Top = 32
  end
  object CondPag: TCondPag
    Parcelas = 0
    PrazoI = 0
    Variacao = 0
    DiaFixo = 0
    Limite = 0
    PagAVista = False
    Limite_Cred = False
    Pagamentos = False
    Recebimentos = False
    ParcAberta = False
    Left = 568
    Top = 40
  end
  object QryFormaPagamento: TQuery
    DatabaseName = 'bd'
    SessionName = 'Default'
    Left = 496
    Top = 104
  end
  object LayoutImp1: TLayoutImp
    RdPrint = RDprint1
    Flag = 'FPG'
    Items = <>
    NAtuaPreview = True
    Left = 288
    Top = 311
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = True
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    Autor = Deltress
    About = 'RDprint 3.0h - Registrado'
    Acentuacao = SemAcento
    CaptionSetup = 'Impressão de Pedidos'
    TitulodoRelatorio = 'Impressão de Formas de Pagamento'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    PortaComunicacao = 'LPT1'
    TestarPorta = False
    TamanhoQteLinhas = 33
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumeroPaginaInicial = 1
    PaginaInicial = 1
    PaginaFinal = 9999
    NumerodeCopias = 1
    FonteTamanhoPadrao = S12cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 341
    Top = 308
  end
end
