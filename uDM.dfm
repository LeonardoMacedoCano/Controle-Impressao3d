object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 311
  Width = 465
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=dbImpressao3d')
    TxOptions.DisconnectAction = xdRollback
    Connected = True
    Left = 40
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Options.DisconnectAction = xdRollback
    Connection = FDConnection
    Left = 128
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 344
    Top = 24
  end
  object fdImpressao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from impressao')
    Left = 40
    Top = 96
  end
end
