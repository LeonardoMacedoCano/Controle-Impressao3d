inherited frmTipoFilamento: TfrmTipoFilamento
  Caption = 'Tipo Filamento'
  ClientHeight = 211
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TToolBar
    ExplicitWidth = 550
  end
  inherited pnlMain: TPanel
    Height = 157
    ExplicitTop = 53
    ExplicitWidth = 550
    ExplicitHeight = 182
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
    object Label3: TLabel
      Left = 27
      Top = 97
      Width = 64
      Height = 13
      Caption = 'Valor do quilo'
    end
    object Label4: TLabel
      Left = 215
      Top = 97
      Width = 50
      Height = 13
      Caption = 'Densidade'
    end
    object Label5: TLabel
      Left = 386
      Top = 97
      Width = 43
      Height = 13
      Caption = 'Di'#226'metro'
    end
    object edtCodigo: TDBEdit
      Left = 97
      Top = 40
      Width = 50
      Height = 21
      DataField = 'id'
      DataSource = dsMain
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
    object DBEdit1: TDBEdit
      Left = 97
      Top = 94
      Width = 50
      Height = 21
      DataField = 'valor'
      DataSource = dsMain
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 271
      Top = 94
      Width = 50
      Height = 21
      DataField = 'densidade'
      DataSource = dsMain
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 435
      Top = 94
      Width = 50
      Height = 21
      DataField = 'diametro'
      DataSource = dsMain
      TabOrder = 4
    end
  end
  inherited qryMain: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from tipoFilamento')
  end
end
