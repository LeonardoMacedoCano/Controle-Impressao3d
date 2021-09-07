object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Par'#226'metros'
  ClientHeight = 305
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
    Height = 305
    ActivePage = tsGeral
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 0
    ExplicitHeight = 370
    object tsGeral: TTabSheet
      Caption = 'Geral'
      ExplicitHeight = 342
      object pnlGeral: TPanel
        Left = 0
        Top = 0
        Width = 387
        Height = 277
        Align = alClient
        Color = 10658466
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 64
        ExplicitHeight = 271
        object lblConsumoEnder3KWH: TLabel
          Left = 16
          Top = 91
          Width = 118
          Height = 13
          Caption = 'Consumo Ender 3 (kw/h)'
        end
        object lblCustoEnergiaKWH: TLabel
          Left = 33
          Top = 64
          Width = 101
          Height = 13
          Caption = 'Custo Energia (kw/h)'
        end
        object lblCustoManutencao: TLabel
          Left = 22
          Top = 118
          Width = 112
          Height = 13
          Caption = 'Custo Manuten'#231#227'o (%)'
        end
        object lblValorTopoManutencao: TLabel
          Left = 21
          Top = 145
          Width = 113
          Height = 13
          Caption = 'Valor Topo Manuten'#231#227'o'
        end
        object edtConsumoEnder3KWH: TEdit
          Left = 140
          Top = 88
          Width = 100
          Height = 21
          TabOrder = 0
        end
        object edtCustoEnergiaKWH: TEdit
          Left = 140
          Top = 61
          Width = 100
          Height = 21
          TabOrder = 1
        end
        object edtCustoManutencao: TEdit
          Left = 140
          Top = 115
          Width = 100
          Height = 21
          TabOrder = 2
        end
        object edtValorTopoManutencao: TEdit
          Left = 140
          Top = 142
          Width = 100
          Height = 21
          TabOrder = 3
        end
        object pnlBottom: TPanel
          Left = 1
          Top = 238
          Width = 385
          Height = 38
          Align = alBottom
          TabOrder = 4
          ExplicitTop = 296
          object btnCancelar: TButton
            Left = 1
            Top = 1
            Width = 100
            Height = 36
            Align = alLeft
            Caption = 'Cancelar'
            TabOrder = 0
            ExplicitHeight = 39
          end
          object btnSalvar: TButton
            Left = 284
            Top = 1
            Width = 100
            Height = 36
            Align = alRight
            Caption = 'Salvar'
            TabOrder = 1
            ExplicitLeft = 354
            ExplicitHeight = 39
          end
        end
      end
    end
    object tsTipoFilamento: TTabSheet
      Caption = 'Tipo Filamento'
      ImageIndex = 1
      ExplicitHeight = 342
      object dgTipoFilamento: TDBGrid
        Left = 0
        Top = 0
        Width = 387
        Height = 277
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
            Width = 55
            Visible = True
          end>
      end
    end
    object tsCategoria: TTabSheet
      Caption = 'Categoria'
      ImageIndex = 2
      ExplicitHeight = 342
      object dgCategoria: TDBGrid
        Left = 0
        Top = 0
        Width = 387
        Height = 277
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
  end
end
