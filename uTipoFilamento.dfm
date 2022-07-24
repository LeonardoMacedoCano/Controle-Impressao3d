inherited frmTipoFilamento: TfrmTipoFilamento
  Caption = 'Tipo Filamento'
  ClientHeight = 211
  OnClose = FormClose
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 157
    ExplicitHeight = 157
    object Label1: TLabel
      Left = 68
      Top = 43
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 55
      Top = 70
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 13
      Top = 97
      Width = 88
      Height = 13
      Caption = 'Valor do quilo (R$)'
    end
    object Label4: TLabel
      Left = 183
      Top = 97
      Width = 89
      Height = 13
      Caption = 'Densidade (g/cm'#179')'
    end
    object Label5: TLabel
      Left = 359
      Top = 97
      Width = 70
      Height = 13
      Caption = 'Di'#226'metro (mm)'
    end
    object edtCodigo: TDBEdit
      Left = 107
      Top = 40
      Width = 50
      Height = 21
      DataField = 'id'
      DataSource = dsMain
      Enabled = False
      TabOrder = 0
    end
    object edtDescricao: TDBEdit
      Left = 107
      Top = 67
      Width = 378
      Height = 21
      DataField = 'descricao'
      DataSource = dsMain
      TabOrder = 1
    end
    object edtValor: TDBEdit
      Left = 107
      Top = 94
      Width = 50
      Height = 21
      DataField = 'valor'
      DataSource = dsMain
      TabOrder = 2
    end
    object edtDensidade: TDBEdit
      Left = 278
      Top = 94
      Width = 50
      Height = 21
      DataField = 'densidade'
      DataSource = dsMain
      TabOrder = 3
    end
    object edtDiametro: TDBEdit
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
      'select * from tipoFilamento'
      'order by id')
  end
end
