object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  Caption = 'Par'#226'metros'
  ClientHeight = 483
  ClientWidth = 395
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
    Width = 395
    Height = 442
    ActivePage = tsCategoria
    Align = alClient
    TabOrder = 0
    object tsGeral: TTabSheet
      Caption = 'Geral'
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
  object pnlBottom: TPanel
    Left = 0
    Top = 442
    Width = 395
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSalvar: TButton
      Left = 296
      Top = 5
      Width = 95
      Height = 30
      Caption = 'Salvar'
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 4
      Top = 5
      Width = 95
      Height = 30
      Caption = 'Cancelar'
      TabOrder = 0
    end
  end
end
