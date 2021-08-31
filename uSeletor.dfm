object frmSeletor: TfrmSeletor
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Controle Impress'#227'o 3d'
  ClientHeight = 599
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 92
    Align = alTop
    Color = 10658466
    ParentBackground = False
    TabOrder = 0
    object btnConfiguracao: TSpeedButton
      Left = 873
      Top = 1
      Width = 90
      Height = 90
      Align = alRight
      Flat = True
      OnClick = btnConfiguracaoClick
      ExplicitLeft = 899
    end
    object btnArquivo: TSpeedButton
      Left = 1
      Top = 1
      Width = 90
      Height = 90
      Align = alLeft
      Flat = True
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 92
    Width = 964
    Height = 507
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
  end
end
