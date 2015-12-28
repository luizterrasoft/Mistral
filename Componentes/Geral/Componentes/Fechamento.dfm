object Frm_Fechamento: TFrm_Fechamento
  Left = 19
  Top = 14
  ActiveControl = PercentualDesconto
  BorderStyle = bsDialog
  ClientHeight = 462
  ClientWidth = 684
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 213
    Top = 60
    Width = 123
    Height = 19
    Caption = 'Descontos      %'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 252
    Top = 135
    Width = 84
    Height = 19
    Caption = 'Valor Pago'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 291
    Top = 167
    Width = 45
    Height = 19
    Caption = 'Troco'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 406
    Top = 59
    Width = 36
    Height = 18
    Caption = 'Valor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 386
    Top = 230
    Width = 4
    Height = 19
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 206
    Top = 230
    Width = 75
    Height = 19
    Caption = 'Vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 272
    Top = 5
    Width = 64
    Height = 19
    Caption = 'Subtotal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 298
    Top = 104
    Width = 38
    Height = 19
    Caption = 'Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 270
    Top = 199
    Width = 66
    Height = 19
    Alignment = taRightJustify
    Caption = 'Parcelas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CondicoesPagamento: TGridControl
    Left = 0
    Top = 0
    Width = 201
    Height = 463
    Hint = 'Condiçoes de Pagamento do Valor Parcelado'
    ColCount = 9
    DefaultRowHeight = 18
    FixedColor = clBackground
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = CondicoesPagamentoClick
    OnEnter = CondicoesPagamentoEnter
    OnExit = CondicoesPagamentoExit
    OnKeyDown = CondicoesPagamentoKeyDown
    Limite = 0
    OnGetCellColor = CondicoesPagamentoGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = True
    MovMouseLinha = False
    ColWidths = (
      194
      19
      64
      64
      64
      64
      64
      64
      64)
  end
  object Parcelas: TGridControl
    Left = 215
    Top = 263
    Width = 461
    Height = 197
    Hint = 'Parcelas Geradas(Ctrl + P)'
    ColCount = 3
    DefaultRowHeight = 18
    FixedColor = clBackground
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnEnter = ParcelasEnter
    OnGetEditMask = ParcelasGetEditMask
    OnSelectCell = ParcelasSelectCell
    OnGetCellAlignment = ParcelasGetCellAlignment
    OnGetCellColor = CondicoesPagamentoGetCellColor
    PosicionaLinha = 0
    PosicionarLinha = False
    MovMouseLinha = False
    ColWidths = (
      157
      156
      125)
  end
  object btOK: TBitBtn
    Left = 517
    Top = 89
    Width = 150
    Height = 30
    Hint = 'Confirma Operação'
    Caption = 'Confirma'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
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
  object BtCancel: TBitBtn
    Left = 517
    Top = 121
    Width = 151
    Height = 30
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
    TabOrder = 12
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
  object ValorDesconto: TEditControle
    Left = 450
    Top = 54
    Width = 158
    Height = 28
    Hint = 'Desconto por Valor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = ValorDescontoExit
    Obrigatorio = False
    Posicao = 0
    NextPos = ValorPago
    Encontrou = False
    Tipo = tpDecimal
    Mascara = '#,##0.00'
    Alignment = taRightJustify
  end
  object ValorParcelado: TEditControle
    Left = 342
    Top = 197
    Width = 170
    Height = 28
    Hint = 'Valor que será Parcelado'
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
    Obrigatorio = False
    Posicao = 0
    NextPos = Vendedor
    Encontrou = False
    Mascara = '#,##0.00'
    Alignment = taRightJustify
  end
  object ValorPago: TEditControle
    Left = 342
    Top = 134
    Width = 170
    Height = 28
    Hint = 'Valor Pago a Vista'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = ValorPagoEnter
    OnExit = ValorPagoExit
    OnKeyDown = ValorPagoKeyDown
    Obrigatorio = False
    Posicao = 0
    NextPos = Vendedor
    Encontrou = False
    Tipo = tpDecimal
    Mascara = '#,##0.00'
    Alignment = taRightJustify
  end
  object Troco: TEditControle
    Left = 342
    Top = 165
    Width = 171
    Height = 28
    Hint = 'Troco'
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    Obrigatorio = False
    Posicao = 0
    NextPos = ValorParcelado
    Encontrou = False
    Mascara = '#,##0.00'
    Alignment = taRightJustify
  end
  object Vendedor: TEditControle
    Left = 282
    Top = 229
    Width = 57
    Height = 28
    Hint = 'Vendedor Responsável'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnKeyDown = VendedorKeyDown
    Obrigatorio = False
    Posicao = 0
    GeraPesquisa = True
    Pesquisa = PesqVend
    NextPos = btOK
    Encontrou = False
    Tipo = tpNumero
  end
  object NomeVendedor: TPanelControle
    Left = 340
    Top = 229
    Width = 341
    Height = 28
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object BDuplicata: TBitBtn
    Left = 518
    Top = 185
    Width = 150
    Height = 27
    Hint = 'Gera Duplicata Financeira'
    Caption = 'Gera Duplicata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = BDuplicataClick
    Glyph.Data = {
      AA040000424DAA04000000000000360000002800000014000000130000000100
      18000000000074040000C30E0000C30E00000000000000000000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000000000000000000000BFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000000000000000
      00000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF7F7F7F000000BFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F00007F00007F0000000000
      000000BFBFBFFFFFFFFFFFFF000000000000000000000000BFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F00007F00007F0000000000BFBFBFFF
      FFFFFFFFFF000000BFBFBF000000000000000000000000000000000000000000
      000000BFBFBFBFBFBF7F00007F00007F00007F0000000000BFBFBFFFFFFFFFFF
      FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BF
      BFBFBFBFBFFF0000FF0000FF0000FF00000000007F7F7F7F7F7F7F7F7F7F7F7F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBF
      BF7F00007F00007F00007F0000BFBFBFBFBFBFBFBFBF7F7F7FFFFFFF7F00007F
      00007F00007F00007F00007F0000FFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F00007F00007F00007F00007F0000
      7F00007F00007F00007F0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBF7F7F7F7F00007F0000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7F00007F0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF7F7F7F7F00007F00007F00007F00007F00007F00007F00007F00
      007F0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F
      7FFFFFFF7F00007F00007F00007F0000FFFFFFFFFFFFFFFFFFFFFFFF000000BF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFF7F00007F
      00007F00007F00007F0000FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
      7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF}
  end
  object ValorTotal: TPanelControle
    Left = 343
    Top = 0
    Width = 166
    Height = 28
    Hint = 'Total sem Desconto'
    Alignment = taRightJustify
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object TotalDesconto: TPanelControle
    Left = 342
    Top = 103
    Width = 170
    Height = 28
    Hint = 'Total com Descontos'
    Alignment = taRightJustify
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object PercentualDesconto: TEditControle
    Left = 342
    Top = 55
    Width = 61
    Height = 28
    Hint = 'Desconto por Valor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = PercentualDescontoExit
    Obrigatorio = False
    Posicao = 0
    NextPos = ValorDesconto
    Encontrou = False
    Tipo = tpDecimal
    Mascara = '#,##0.00'
    Alignment = taRightJustify
  end
  object BtInf: TBitBtn
    Left = 517
    Top = 153
    Width = 151
    Height = 28
    Hint = 'Informações Complementares'
    Caption = '<F3> Outros Dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = BtInfClick
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777700000007777777777777700700000007777777777777000700000007777
      7777777700077000000077778000087000777000000077700777700007777000
      0000770870007E80777770000000780777077770877770000000707777077777
      077770000000707777077777077770000000707E70000777077770000000707E
      77077777077770000000780EE70770708777700000007708EEE0078077777000
      0000777007777007777770000000777780000877777770000000777777777777
      777770000000}
  end
  object PesqVend: TPesquisa
    Sql.Strings = (
      'SELECT NOME FROM VENDEDOR WHERE COD_VENDEDOR = :CODIGO'
      'AND CDEMPRESA =:EMPRESA')
    Descricao = NomeVendedor
    Campo = 'Nome'
    Filtro1 = Vendedor
    Left = 650
    Top = 62
  end
  object Query1: TQuery
    DatabaseName = 'BD'
    Left = 688
    Top = 16
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
    Left = 656
    Top = 128
  end
end
