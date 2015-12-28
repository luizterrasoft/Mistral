object frm_F8FormaPgto_AVista: Tfrm_F8FormaPgto_AVista
  Left = 69
  Top = 82
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'FORMAS DE PAGAMENTO'
  ClientHeight = 373
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object grade: TDBGrid
    Left = 0
    Top = 29
    Width = 660
    Height = 297
    Cursor = crHandPoint
    Align = alClient
    Color = clBlack
    DataSource = ds
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = gradeDblClick
    OnKeyDown = gradeKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'cFO_CODI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Código'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FO_DESC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Descrição'
        Width = 561
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 326
    Width = 660
    Height = 47
    Align = alBottom
    TabOrder = 1
    object botao_sair: TPanel
      Left = 564
      Top = 2
      Width = 85
      Height = 45
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 29
    Align = alTop
    Caption = 'Pagamentos à vista disponíveis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object ds: TDataSource
    DataSet = DMF8.qFormaPgtoF8_AVista
    Left = 8
    Top = 96
  end
end
