inherited frmArquivo: TfrmArquivo
  Caption = 'Arquivo'
  ClientHeight = 228
  ClientWidth = 575
  OnClose = FormClose
  ExplicitWidth = 581
  ExplicitHeight = 257
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TToolBar
    Width = 575
    ExplicitWidth = 575
  end
  inherited pnlMain: TPanel
    Width = 575
    Height = 174
    ExplicitWidth = 575
    ExplicitHeight = 174
    object lblCodigo: TLabel
      Left = 74
      Top = 27
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblDescricao: TLabel
      Left = 61
      Top = 54
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblCaminho: TLabel
      Left = 66
      Top = 81
      Width = 41
      Height = 13
      Caption = 'Caminho'
    end
    object lblCustoMaterial: TLabel
      Left = 14
      Top = 135
      Width = 93
      Height = 13
      Caption = 'Custo Material (R$)'
    end
    object lblCustoEnergia: TLabel
      Left = 390
      Top = 135
      Width = 91
      Height = 13
      Caption = 'Custo Energia (R$)'
    end
    object lblComprimentoFilamento: TLabel
      Left = 182
      Top = 108
      Width = 124
      Height = 13
      Caption = 'Comprimento utilizado (m)'
    end
    object lblTempoImpressao: TLabel
      Left = 48
      Top = 108
      Width = 59
      Height = 13
      Caption = 'Tempo (min)'
    end
    object lblPeso: TLabel
      Left = 387
      Top = 108
      Width = 94
      Height = 13
      Caption = 'Peso estimulado (g)'
    end
    object edtCodigo: TDBEdit
      Left = 113
      Top = 24
      Width = 50
      Height = 21
      DataField = 'id'
      DataSource = dsMain
      Enabled = False
      TabOrder = 0
    end
    object edtDescricao: TDBEdit
      Left = 113
      Top = 51
      Width = 424
      Height = 21
      DataField = 'descricao'
      DataSource = dsMain
      TabOrder = 1
    end
    object edtCaminho: TDBEdit
      Left = 113
      Top = 78
      Width = 424
      Height = 21
      DataField = 'Caminho'
      DataSource = dsMain
      TabOrder = 2
    end
    object edtCustoMaterial: TDBEdit
      Left = 113
      Top = 132
      Width = 50
      Height = 21
      DataField = 'customaterial'
      DataSource = dsMain
      Enabled = False
      TabOrder = 3
    end
    object edtCustoEnergia: TDBEdit
      Left = 487
      Top = 132
      Width = 50
      Height = 21
      DataField = 'custoenergia'
      DataSource = dsMain
      Enabled = False
      TabOrder = 4
    end
    object edtComprimentoFilamento: TDBEdit
      Left = 312
      Top = 105
      Width = 50
      Height = 21
      DataField = 'comprimentofilamento'
      DataSource = dsMain
      TabOrder = 5
    end
    object edtTempoImpressao: TDBEdit
      Left = 113
      Top = 105
      Width = 50
      Height = 21
      DataField = 'tempoimpressao'
      DataSource = dsMain
      TabOrder = 6
    end
    object edtPeso: TDBEdit
      Left = 487
      Top = 105
      Width = 50
      Height = 21
      DataField = 'peso'
      DataSource = dsMain
      TabOrder = 7
    end
  end
  inherited qryMain: TFDQuery
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric, fvFmtEditNumeric]
    SQL.Strings = (
      'select *'
      'from arquivo'
      'order by id')
  end
end
