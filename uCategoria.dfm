inherited frmCategoria: TfrmCategoria
  Caption = 'Categoria'
  ClientHeight = 179
  OnClose = FormClose
  ExplicitHeight = 208
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 125
    object Label1: TLabel
      Left = 58
      Top = 43
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 45
      Top = 70
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edtCodigo: TDBEdit
      Left = 97
      Top = 40
      Width = 50
      Height = 21
      DataField = 'id'
      DataSource = dsMain
      Enabled = False
      TabOrder = 0
    end
    object edtDescricao: TDBEdit
      Left = 97
      Top = 67
      Width = 388
      Height = 21
      DataField = 'descricao'
      DataSource = dsMain
      TabOrder = 1
    end
  end
  inherited qryMain: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from categoria')
  end
end
