inherited frmImpressao: TfrmImpressao
  Caption = 'Impress'#227'o 3d'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 205
    Align = alTop
    ExplicitHeight = 205
    object btnTipoFilamento: TSpeedButton
      Left = 146
      Top = 132
      Width = 23
      Height = 23
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000000000000000000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001414140D1C1C
        1C3F000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000002424240E1C1C1CC51D1D
        1DF81C1C1C3F0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001717170B1D1D1DC01D1D1DFF1E1E
        1EC62424240E0000000000000000000000000000000000000000000000000000
        00000000000000000000000000001717170B1D1D1DC01D1D1DFF1E1E1EC62424
        240E00000000000000000000000000000000212121171C1C1C631D1D1D841D1D
        1D7C1E1E1E43000000021414140D1E1E1EC61D1D1DFF1E1E1EC62424240E0000
        00000000000000000000000000021E1E1E801D1D1DF71D1D1DFF1D1D1DFF1D1D
        1DFF1D1D1DFF1D1D1DD31D1D1D7A1D1D1DFF1E1E1EC62424240E000000000000
        000000000000000000001E1E1E9A1D1D1DFF1D1D1DE41C1C1C751B1B1B411C1C
        1C511E1E1EAC1D1D1DFF1D1D1DFF1E1E1E771515150C00000000000000000000
        0000000000001C1C1C4A1D1D1DFF1D1D1DD01B1B1B1300000000000000000000
        0000000000001C1C1C631D1D1DFF1D1D1DD30000000200000000000000000000
        0000000000001D1D1DB61D1D1DFF1F1F1F310000000000000000000000000000
        000000000000000000001C1C1CAB1D1D1DFF1E1E1E4300000000000000000000
        0000000000001D1D1DED1D1D1DDD000000000000000000000000000000000000
        000000000000000000001C1C1C511D1D1DFF1D1D1D7B00000000000000000000
        0000000000001D1D1DF71C1C1CCE000000000000000000000000000000000000
        000000000000000000001F1F1F421D1D1DFF1D1D1D8500000000000000000000
        0000000000001D1D1DD61D1D1DF51717170B0000000000000000000000000000
        000000000000000000001C1C1C751D1D1DFF1D1D1D6200000000000000000000
        0000000000001D1D1D831D1D1DFF1D1D1D830000000000000000000000000000
        0000000000001B1B1B131D1D1DE41D1D1DF72121211700000000000000000000
        0000000000001E1E1E111D1D1DE31D1D1DFE1D1D1D821717170B000000000000
        00001B1B1B301D1D1DD01D1D1DFF1E1E1E800000000000000000000000000000
        000000000000000000001C1C1C2D1D1D1DE31D1D1DFF1D1D1DF51E1E1ECF1D1D
        1DDD1D1D1DFF1D1D1DFF1E1E1E9A000000020000000000000000000000000000
        00000000000000000000000000001E1E1E111D1D1D821D1D1DD61D1D1DF81D1D
        1DED1D1D1DB61C1C1C4A00000000000000000000000000000000000000000000
        000000000000}
      OnClick = btnTipoFilamentoClick
    end
    object lblTipoFilamento: TLabel
      Left = 22
      Top = 136
      Width = 69
      Height = 13
      Caption = 'Tipo Filamento'
    end
    object lblCategoria: TLabel
      Left = 44
      Top = 108
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object btnCategoria: TSpeedButton
      Left = 146
      Top = 104
      Width = 23
      Height = 23
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000000000000000000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001414140D1C1C
        1C3F000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000002424240E1C1C1CC51D1D
        1DF81C1C1C3F0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001717170B1D1D1DC01D1D1DFF1E1E
        1EC62424240E0000000000000000000000000000000000000000000000000000
        00000000000000000000000000001717170B1D1D1DC01D1D1DFF1E1E1EC62424
        240E00000000000000000000000000000000212121171C1C1C631D1D1D841D1D
        1D7C1E1E1E43000000021414140D1E1E1EC61D1D1DFF1E1E1EC62424240E0000
        00000000000000000000000000021E1E1E801D1D1DF71D1D1DFF1D1D1DFF1D1D
        1DFF1D1D1DFF1D1D1DD31D1D1D7A1D1D1DFF1E1E1EC62424240E000000000000
        000000000000000000001E1E1E9A1D1D1DFF1D1D1DE41C1C1C751B1B1B411C1C
        1C511E1E1EAC1D1D1DFF1D1D1DFF1E1E1E771515150C00000000000000000000
        0000000000001C1C1C4A1D1D1DFF1D1D1DD01B1B1B1300000000000000000000
        0000000000001C1C1C631D1D1DFF1D1D1DD30000000200000000000000000000
        0000000000001D1D1DB61D1D1DFF1F1F1F310000000000000000000000000000
        000000000000000000001C1C1CAB1D1D1DFF1E1E1E4300000000000000000000
        0000000000001D1D1DED1D1D1DDD000000000000000000000000000000000000
        000000000000000000001C1C1C511D1D1DFF1D1D1D7B00000000000000000000
        0000000000001D1D1DF71C1C1CCE000000000000000000000000000000000000
        000000000000000000001F1F1F421D1D1DFF1D1D1D8500000000000000000000
        0000000000001D1D1DD61D1D1DF51717170B0000000000000000000000000000
        000000000000000000001C1C1C751D1D1DFF1D1D1D6200000000000000000000
        0000000000001D1D1D831D1D1DFF1D1D1D830000000000000000000000000000
        0000000000001B1B1B131D1D1DE41D1D1DF72121211700000000000000000000
        0000000000001E1E1E111D1D1DE31D1D1DFE1D1D1D821717170B000000000000
        00001B1B1B301D1D1DD01D1D1DFF1E1E1E800000000000000000000000000000
        000000000000000000001C1C1C2D1D1D1DE31D1D1DFF1D1D1DF51E1E1ECF1D1D
        1DDD1D1D1DFF1D1D1DFF1E1E1E9A000000020000000000000000000000000000
        00000000000000000000000000001E1E1E111D1D1D821D1D1DD61D1D1DF81D1D
        1DED1D1D1DB61C1C1C4A00000000000000000000000000000000000000000000
        000000000000}
      OnClick = btnCategoriaClick
    end
    object lblLink: TLabel
      Left = 73
      Top = 81
      Width = 18
      Height = 13
      Caption = 'Link'
    end
    object lblDescricao: TLabel
      Left = 45
      Top = 54
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblCodigo: TLabel
      Left = 58
      Top = 27
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblCustoMaterial: TLabel
      Left = 22
      Top = 163
      Width = 69
      Height = 13
      Caption = 'Custo Material'
    end
    object lblCustoEnergia: TLabel
      Left = 362
      Top = 163
      Width = 67
      Height = 13
      Caption = 'Custo Energia'
    end
    object lblArquivo: TLabel
      Left = 5
      Top = 192
      Width = 60
      Height = 13
      Caption = 'Arquivo(s)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtTipoFilamento: TDBEdit
      Left = 97
      Top = 133
      Width = 50
      Height = 21
      DataField = 'idtipofilamento'
      DataSource = dsMain
      TabOrder = 0
    end
    object edtCategoria: TDBEdit
      Left = 97
      Top = 105
      Width = 50
      Height = 21
      DataField = 'idcategoria'
      DataSource = dsMain
      TabOrder = 1
    end
    object edtLink: TDBEdit
      Left = 97
      Top = 78
      Width = 388
      Height = 21
      DataField = 'link'
      DataSource = dsMain
      TabOrder = 2
    end
    object edtDescricao: TDBEdit
      Left = 97
      Top = 51
      Width = 388
      Height = 21
      DataField = 'descricao'
      DataSource = dsMain
      TabOrder = 3
    end
    object edtCodigo: TDBEdit
      Left = 97
      Top = 24
      Width = 50
      Height = 21
      DataField = 'id'
      DataSource = dsMain
      Enabled = False
      TabOrder = 4
    end
    object edtCategoriaDescricao: TEdit
      Left = 168
      Top = 105
      Width = 317
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object edtTipoFilamentoDescricao: TEdit
      Left = 168
      Top = 133
      Width = 317
      Height = 21
      Enabled = False
      TabOrder = 6
    end
    object edtCustoMaterial: TDBEdit
      Left = 97
      Top = 160
      Width = 50
      Height = 21
      DataField = 'customaterial'
      DataSource = dsMain
      Enabled = False
      TabOrder = 7
    end
    object edtCustoEnergia: TDBEdit
      Left = 435
      Top = 160
      Width = 50
      Height = 21
      DataField = 'custoenergia'
      DataSource = dsMain
      Enabled = False
      TabOrder = 8
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 259
    Width = 550
    Height = 166
    Align = alClient
    Color = 10658466
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 263
    ExplicitHeight = 168
    object gridArquivo: TDBGrid
      Left = 1
      Top = 1
      Width = 548
      Height = 164
      Align = alClient
      DataSource = dsArquivo
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'customaterial'
          Title.Caption = 'Custo Material'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'custoenergia'
          Title.Caption = 'Custo Energia'
          Visible = True
        end>
    end
  end
  inherited imgToolBar: TImageList
    Left = 8
  end
  inherited dsMain: TDataSource
    Left = 464
  end
  inherited qryMain: TFDQuery
    Active = True
    SQL.Strings = (
      'select *'
      'from impressao'
      'order by id')
    Left = 503
  end
  object dsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 464
    Top = 111
  end
  object qryCategoria: TFDQuery
    Active = True
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from categoria'
      'order by id')
    Left = 503
    Top = 110
  end
  object dsTipoFilamento: TDataSource
    DataSet = qryTipoFilamento
    Left = 464
    Top = 157
  end
  object qryTipoFilamento: TFDQuery
    Active = True
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from tipoFilamento'
      'order by id')
    Left = 503
    Top = 156
  end
  object dsArquivo: TDataSource
    DataSet = qryArquivo
    OnStateChange = dsMainStateChange
    OnDataChange = dsMainDataChange
    Left = 464
    Top = 264
  end
  object qryArquivo: TFDQuery
    Active = True
    Connection = dm.FDConnection
    SQL.Strings = (
      'select *'
      'from arquivo'
      'where idImpressao = :idImpressao'
      'order by id')
    Left = 503
    Top = 264
    ParamData = <
      item
        Name = 'IDIMPRESSAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end