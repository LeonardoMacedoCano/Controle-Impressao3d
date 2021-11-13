inherited frmPadraoHeranca: TfrmPadraoHeranca
  Caption = 'frmPadraoHeranca'
  ClientHeight = 488
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 251
    Align = alTop
    ExplicitHeight = 251
  end
  object ToolBarChild: TToolBar [2]
    Left = 0
    Top = 305
    Width = 550
    Height = 42
    ButtonHeight = 42
    ButtonWidth = 43
    Images = imgToolBarChild
    TabOrder = 2
    object btnNovoChild: TToolButton
      Left = 0
      Top = 0
      Caption = 'btnNovoChild'
      ImageIndex = 0
    end
    object btnEditarChild: TToolButton
      Left = 43
      Top = 0
      Caption = 'btnEditarChild'
      ImageIndex = 1
    end
    object btnSalvarChild: TToolButton
      Left = 86
      Top = 0
      Caption = 'btnSalvarChild'
      ImageIndex = 2
    end
    object btnCancelarChild: TToolButton
      Left = 129
      Top = 0
      Caption = 'btnCancelarChild'
      ImageIndex = 3
    end
    object EspacamentoChild1: TToolButton
      Left = 172
      Top = 0
      Width = 95
      Caption = 'EspacamentoChild1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object EspacamentoChild2: TToolButton
      Left = 267
      Top = 0
      Width = 8
      Caption = 'EspacamentoChild2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object btnAnteriorChild: TToolButton
      Left = 275
      Top = 0
      Caption = 'btnAnteriorChild'
      ImageIndex = 4
    end
    object btnProximoChild: TToolButton
      Left = 318
      Top = 0
      Caption = 'btnProximoChild'
      ImageIndex = 5
    end
    object EspacamentoChild3: TToolButton
      Left = 361
      Top = 0
      Width = 95
      Caption = 'EspacamentoChild3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object EspacamentoChild4: TToolButton
      Left = 456
      Top = 0
      Width = 8
      Caption = 'EspacamentoChild4'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnConsultarChild: TToolButton
      Left = 464
      Top = 0
      Caption = 'btnConsultarChild'
      ImageIndex = 6
    end
    object btnExcluirChild: TToolButton
      Left = 507
      Top = 0
      Caption = 'btnExcluirChild'
      ImageIndex = 7
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 347
    Width = 550
    Height = 141
    Align = alClient
    Color = 10658466
    ParentBackground = False
    TabOrder = 3
  end
  object imgToolBarChild: TImageList
    Height = 36
    ImageType = itMask
    Width = 36
    Left = 512
    Top = 110
  end
end
