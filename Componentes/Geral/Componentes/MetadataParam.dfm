object Frm_MetadataParam: TFrm_MetadataParam
  Left = 192
  Top = 114
  Width = 440
  Height = 396
  ActiveControl = campos
  Caption = 'Selecione o nome da Tabela e os campos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object campos: TGridSql
    Left = 0
    Top = 0
    Width = 432
    Height = 261
    Align = alTop
    ColCount = 3
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goRowSelect]
    TabOrder = 0
    SaiemBranco = True
    PosicionaLinha = 0
    PosicionarLinha = False
    MovMouseLinha = False
    AndaProLado = False
    TituloHorizontal.Strings = (
      '*'
      'Campos'
      'Expression')
    Marcador = True
    ColunaMarcada = 0
    NaoEditaDesmarcado = True
    F3Editor = True
    ColWidths = (
      25
      275
      120)
  end
  object Panel1: TPanel
    Left = 0
    Top = 261
    Width = 432
    Height = 101
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Tabela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Tabela: TEditControle
      Left = 8
      Top = 24
      Width = 401
      Height = 21
      TabOrder = 0
      Obrigatorio = False
      Posicao = 0
      Enter = True
      Encontrou = False
    end
    object Delete: TCheckControle
      Left = 8
      Top = 52
      Width = 97
      Height = 17
      Caption = 'Inclui &Delete'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      Encontrou = False
      Enter = True
      ClickAut = False
      TipoValor = varString
    end
    object BitBtnControle1: TBitBtnControle
      Left = 304
      Top = 64
      Width = 105
      Height = 25
      Caption = 'Confirma'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
      Posicao = 6
      Acao = tanone
    end
  end
end
