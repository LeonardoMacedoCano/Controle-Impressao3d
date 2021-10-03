inherited frmImpressao: TfrmImpressao
  Caption = 'Impress'#227'o 3d'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    ExplicitTop = 60
    object btnTipoFilamento: TSpeedButton
      Left = 146
      Top = 149
      Width = 23
      Height = 22
      OnClick = btnTipoFilamentoClick
    end
    object lblTipoFilamento: TLabel
      Left = 22
      Top = 152
      Width = 69
      Height = 13
      Caption = 'Tipo Filamento'
    end
    object lblCategoria: TLabel
      Left = 44
      Top = 124
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object btnCategoria: TSpeedButton
      Left = 146
      Top = 121
      Width = 23
      Height = 22
      OnClick = btnCategoriaClick
    end
    object lblLink: TLabel
      Left = 73
      Top = 97
      Width = 18
      Height = 13
      Caption = 'Link'
    end
    object lblDescricao: TLabel
      Left = 45
      Top = 70
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblCodigo: TLabel
      Left = 58
      Top = 43
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object edtTipoFilamento: TDBEdit
      Left = 97
      Top = 149
      Width = 50
      Height = 21
      DataField = 'idtipofilamento'
      DataSource = dsMain
      TabOrder = 0
    end
    object edtCategoria: TDBEdit
      Left = 97
      Top = 121
      Width = 50
      Height = 21
      DataField = 'idcategoria'
      DataSource = dsMain
      TabOrder = 1
    end
    object edtLink: TDBEdit
      Left = 97
      Top = 94
      Width = 388
      Height = 21
      DataField = 'link'
      DataSource = dsMain
      TabOrder = 2
    end
    object edtDescricao: TDBEdit
      Left = 97
      Top = 67
      Width = 388
      Height = 21
      DataField = 'descricao'
      DataSource = dsMain
      TabOrder = 3
    end
    object edtCodigo: TDBEdit
      Left = 97
      Top = 40
      Width = 50
      Height = 21
      DataField = 'id'
      DataSource = dsMain
      Enabled = False
      TabOrder = 4
    end
    object edtCategoriaDescricao: TEdit
      Left = 168
      Top = 121
      Width = 317
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object edtTipoFilamentoDescricao: TEdit
      Left = 168
      Top = 149
      Width = 317
      Height = 21
      Enabled = False
      TabOrder = 6
    end
  end
  inherited qryMain: TFDQuery
    Active = True
    SQL.Strings = (
      'select *'
      'from impressao'
      'order by id')
  end
  object dsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 424
    Top = 111
  end
  object qryCategoria: TFDQuery
    Active = True
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from categoria'
      'order by id')
    Left = 463
    Top = 110
  end
  object dsTipoFilamento: TDataSource
    DataSet = qryTipoFilamento
    Left = 424
    Top = 157
  end
  object qryTipoFilamento: TFDQuery
    Active = True
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from tipoFilamento'
      'order by id')
    Left = 463
    Top = 156
  end
end
