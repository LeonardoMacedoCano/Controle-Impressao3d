object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  Caption = 'Par'#226'metros'
  ClientHeight = 603
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 620
    Height = 603
    ActivePage = tsCategoria
    Align = alClient
    TabOrder = 0
    object tsGeral: TTabSheet
      Caption = 'Geral'
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
    object tsTipoFilamento: TTabSheet
      Caption = 'Tipo Filamento'
      ImageIndex = 1
    end
    object tsCategoria: TTabSheet
      Caption = 'Categoria'
      ImageIndex = 2
    end
  end
end
