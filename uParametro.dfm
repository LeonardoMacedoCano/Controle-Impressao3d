object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Par'#226'metros'
  ClientHeight = 315
  ClientWidth = 405
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
    Width = 405
    Height = 315
    ActivePage = tsGeral
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 0
    object tsGeral: TTabSheet
      Caption = 'Geral'
      object pnlGeral: TPanel
        Left = 0
        Top = 0
        Width = 397
        Height = 287
        Align = alClient
        Color = 10658466
        ParentBackground = False
        TabOrder = 0
        object lblConsumoEnder3KWH: TLabel
          Left = 72
          Top = 102
          Width = 118
          Height = 13
          Caption = 'Consumo Ender 3 (kw/h)'
        end
        object lblCustoEnergiaKWH: TLabel
          Left = 89
          Top = 75
          Width = 101
          Height = 13
          Caption = 'Custo Energia (kw/h)'
        end
        object lblCustoManutencao: TLabel
          Left = 78
          Top = 129
          Width = 112
          Height = 13
          Caption = 'Custo Manuten'#231#227'o (%)'
        end
        object lblValorTopoManutencao: TLabel
          Left = 77
          Top = 156
          Width = 113
          Height = 13
          Caption = 'Valor Topo Manuten'#231#227'o'
        end
        object Param_ConsumoEnder3KWH: TEdit
          Left = 196
          Top = 99
          Width = 100
          Height = 21
          TabOrder = 1
        end
        object Param_CustoEnergiaKWH: TEdit
          Left = 196
          Top = 72
          Width = 100
          Height = 21
          TabOrder = 0
        end
        object Param_CustoManutencao: TEdit
          Left = 196
          Top = 126
          Width = 100
          Height = 21
          TabOrder = 2
        end
        object Param_ValorTopoManutencao: TEdit
          Left = 196
          Top = 153
          Width = 100
          Height = 21
          TabOrder = 3
        end
        object pnlBottom: TPanel
          Left = 1
          Top = 248
          Width = 395
          Height = 38
          Align = alBottom
          TabOrder = 4
          object btnCancelar: TButton
            Left = 1
            Top = 1
            Width = 100
            Height = 36
            Align = alLeft
            Caption = 'Cancelar'
            TabOrder = 0
            OnClick = btnCancelarClick
          end
          object btnSalvar: TButton
            Left = 294
            Top = 1
            Width = 100
            Height = 36
            Align = alRight
            Caption = 'Salvar'
            TabOrder = 1
            OnClick = btnSalvarClick
          end
        end
      end
    end
    object tsTipoFilamento: TTabSheet
      Caption = 'Tipo Filamento'
      ImageIndex = 1
      object dgTipoFilamento: TDBGrid
        Left = 0
        Top = 0
        Width = 397
        Height = 287
        Align = alClient
        DataSource = dsTipoFilamento
        PopupMenu = PopupMenu
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = actSelecionarExecute
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 150
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
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'diametro'
            Title.Caption = 'Di'#226'metro'
            Width = 50
            Visible = True
          end>
      end
    end
    object tsCategoria: TTabSheet
      Caption = 'Categoria'
      ImageIndex = 2
      object dgCategoria: TDBGrid
        Left = 0
        Top = 0
        Width = 397
        Height = 287
        Align = alClient
        DataSource = dsCategoria
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = actSelecionarExecute
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
            Width = 290
            Visible = True
          end>
      end
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
    object Editar1: TMenuItem
      Action = actEditar
    end
    object Excluir1: TMenuItem
      Action = actExcluir
    end
  end
  object ActionList: TActionList
    Left = 351
    Top = 48
    object actAdicionar: TAction
      Caption = 'Adicionar'
      OnExecute = actAdicionarExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      OnExecute = actEditarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      OnExecute = actExcluirExecute
    end
    object actSelecionar: TAction
      Caption = 'Selecionar'
      OnExecute = actSelecionarExecute
    end
  end
end
