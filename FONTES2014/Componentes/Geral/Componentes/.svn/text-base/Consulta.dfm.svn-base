object FrmConsulta: TFrmConsulta
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Consulta'
  ClientHeight = 238
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridConsulta: TDBGrid
    Left = 0
    Top = 0
    Width = 370
    Height = 178
    Align = alClient
    DataSource = SourcePesquisa
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = GridConsultaKeyPress
  end
  object Painel: TPanel
    Left = 0
    Top = 178
    Width = 370
    Height = 60
    Align = alBottom
    TabOrder = 1
    Visible = False
    object Label2: TLabel
      Left = 15
      Top = 21
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Confirma: TBitBtn
      Left = 294
      Top = 22
      Width = 72
      Height = 37
      Caption = 'Confirma'
      Default = True
      TabOrder = 0
      OnClick = ConfirmaClick
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
    object PageControl1: TPageControl
      Left = 1
      Top = 20
      Width = 289
      Height = 39
      ActivePage = TabSheet1
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        TabVisible = False
        object Label1: TLabel
          Left = 4
          Top = 7
          Width = 39
          Height = 13
          Caption = 'Coluna :'
        end
        object cWhere: TEdit
          Left = 59
          Top = 3
          Width = 219
          Height = 21
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        TabVisible = False
        object Label3: TLabel
          Left = 4
          Top = 8
          Width = 26
          Height = 13
          Caption = 'Data:'
        end
        object Label4: TLabel
          Left = 120
          Top = 7
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object Data1: TMaskEdit
          Left = 40
          Top = 3
          Width = 57
          Height = 21
          EditMask = '!99/99/99;1;_'
          MaxLength = 8
          TabOrder = 0
          Text = '  /  /  '
          OnExit = Data1Exit
        end
        object Data2: TMaskEdit
          Left = 149
          Top = 3
          Width = 57
          Height = 21
          EditMask = '!99/99/99;1;_'
          MaxLength = 8
          TabOrder = 1
          Text = '  /  /  '
          OnExit = Data1Exit
        end
      end
    end
    object NaPalavra: TCheckBox
      Left = 6
      Top = 5
      Width = 150
      Height = 12
      Caption = 'Pesquisa na palavra Inteira'
      TabOrder = 2
    end
  end
  object Pesquisa: TQuery
    Left = 160
    Top = 8
  end
  object SourcePesquisa: TDataSource
    DataSet = Pesquisa
    Left = 224
    Top = 8
  end
  object Query1: TQuery
    Left = 111
    Top = 9
  end
  object Query2: TQuery
    Left = 111
    Top = 65
  end
end
