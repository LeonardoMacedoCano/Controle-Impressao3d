inherited frmArquivo: TfrmArquivo
  Caption = 'Arquivo'
  ClientHeight = 203
  OnClose = FormClose
  ExplicitHeight = 232
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 149
    ExplicitHeight = 155
    object lblCodigo: TLabel
      Left = 58
      Top = 27
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblDescricao: TLabel
      Left = 45
      Top = 54
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblCaminho: TLabel
      Left = 50
      Top = 81
      Width = 41
      Height = 13
      Caption = 'Caminho'
    end
    object lblCustoMaterial: TLabel
      Left = 22
      Top = 108
      Width = 69
      Height = 13
      Caption = 'Custo Material'
    end
    object lblCustoEnergia: TLabel
      Left = 362
      Top = 108
      Width = 67
      Height = 13
      Caption = 'Custo Energia'
    end
    object edtCodigo: TDBEdit
      Left = 97
      Top = 24
      Width = 50
      Height = 21
      DataField = 'id'
      DataSource = dsMain
      Enabled = False
      TabOrder = 0
    end
    object edtDescricao: TDBEdit
      Left = 97
      Top = 51
      Width = 388
      Height = 21
      DataField = 'descricao'
      DataSource = dsMain
      TabOrder = 1
    end
    object edtCaminho: TDBEdit
      Left = 97
      Top = 78
      Width = 388
      Height = 21
      DataField = 'Caminho'
      DataSource = dsMain
      TabOrder = 2
    end
    object edtCustoMaterial: TDBEdit
      Left = 97
      Top = 105
      Width = 50
      Height = 21
      DataField = 'customaterial'
      DataSource = dsMain
      TabOrder = 3
    end
    object edtCustoEnergia: TDBEdit
      Left = 435
      Top = 105
      Width = 50
      Height = 21
      DataField = 'custoenergia'
      DataSource = dsMain
      TabOrder = 4
    end
  end
end
