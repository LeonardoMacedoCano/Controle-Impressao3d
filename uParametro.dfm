object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Par'#226'metros'
  ClientHeight = 411
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 395
    Height = 370
    ActivePage = tsGeral
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 0
    object tsGeral: TTabSheet
      Caption = 'Geral'
      object lblCustoEnergiaKWH: TLabel
        Left = 25
        Top = 32
        Width = 101
        Height = 13
        Caption = 'Custo Energia (kw/h)'
      end
      object lblConsumoEnder3KWH: TLabel
        Left = 8
        Top = 59
        Width = 118
        Height = 13
        Caption = 'Consumo Ender 3 (kw/h)'
      end
      object lblCustoManutencao: TLabel
        Left = 14
        Top = 86
        Width = 112
        Height = 13
        Caption = 'Custo Manuten'#231#227'o (%)'
      end
      object lblValorTopoManutencao: TLabel
        Left = 13
        Top = 113
        Width = 113
        Height = 13
        Caption = 'Valor Topo Manuten'#231#227'o'
      end
      object edtCustoEnergiaKWH: TEdit
        Left = 132
        Top = 29
        Width = 100
        Height = 21
        TabOrder = 0
      end
      object edtConsumoEnder3KWH: TEdit
        Left = 132
        Top = 56
        Width = 100
        Height = 21
        TabOrder = 1
      end
      object edtCustoManutencao: TEdit
        Left = 132
        Top = 83
        Width = 100
        Height = 21
        TabOrder = 2
      end
      object edtValorTopoManutencao: TEdit
        Left = 132
        Top = 110
        Width = 100
        Height = 21
        TabOrder = 3
      end
    end
    object tsTipoFilamento: TTabSheet
      Caption = 'Tipo Filamento'
      ImageIndex = 1
      object dgTipoFilamento: TDBGrid
        Left = 0
        Top = 0
        Width = 387
        Height = 342
        Align = alClient
        DataSource = dsTipoFilamento
        PopupMenu = PopupMenu
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Title.Caption = 'Valor R$'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'densidade'
            Title.Caption = 'Densidade'
            Width = 50
            Visible = True
          end>
      end
    end
    object tsCategoria: TTabSheet
      Caption = 'Categoria'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object dgCategoria: TDBGrid
        Left = 0
        Top = 0
        Width = 387
        Height = 342
        Align = alClient
        DataSource = dsCategoria
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 320
            Visible = True
          end>
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 370
    Width = 395
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      395
      41)
    object btnSalvar: TButton
      Left = 296
      Top = 5
      Width = 95
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 4
      Top = 6
      Width = 95
      Height = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Cancelar'
      TabOrder = 0
    end
  end
  object dsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 320
    Top = 2
  end
  object qryCategoria: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from categoria')
    Left = 351
    Top = 2
  end
  object dsTipoFilamento: TDataSource
    DataSet = qryTipoFilamento
    Left = 232
    Top = 2
  end
  object qryTipoFilamento: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from tipofilamento')
    Left = 263
    Top = 2
  end
  object qryGeral: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from parametrogeral')
    Left = 167
    Top = 3
  end
  object dsGeral: TDataSource
    DataSet = qryGeral
    Left = 136
    Top = 3
  end
  object PopupMenu: TPopupMenu
    Left = 316
    Top = 48
    object Adicionar1: TMenuItem
      Action = actAdicionar
    end
  end
  object ActionList: TActionList
    Left = 351
    Top = 48
    object actAdicionar: TAction
      Caption = 'Adicionar'
      OnExecute = actAdicionarExecute
    end
  end
end
