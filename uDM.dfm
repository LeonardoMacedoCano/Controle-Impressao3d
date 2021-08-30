object dm: Tdm
  OldCreateOrder = False
  Height = 177
  Width = 231
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\DelphiProjects\Controle-Impressao3d\dbImpressao3d.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
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
    Left = 32
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 128
    Top = 88
  end
end
