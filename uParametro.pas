unit uParametro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList;

type
  TModalAction = (maAdicionar,
                  maEditar,
                  maExcluir);

  TfrmParametro = class(TForm)
    PageControl: TPageControl;
    tsGeral: TTabSheet;
    tsTipoFilamento: TTabSheet;
    tsCategoria: TTabSheet;
    pnlBottom: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    dsCategoria: TDataSource;
    qryCategoria: TFDQuery;
    dgCategoria: TDBGrid;
    dsTipoFilamento: TDataSource;
    qryTipoFilamento: TFDQuery;
    dgTipoFilamento: TDBGrid;
    qryGeral: TFDQuery;
    dsGeral: TDataSource;
    lblCustoEnergiaKWH: TLabel;
    edtCustoEnergiaKWH: TEdit;
    lblConsumoEnder3KWH: TLabel;
    edtConsumoEnder3KWH: TEdit;
    lblCustoManutencao: TLabel;
    edtCustoManutencao: TEdit;
    lblValorTopoManutencao: TLabel;
    edtValorTopoManutencao: TEdit;
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    actAdicionar: TAction;
    Adicionar1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actAdicionarExecute(Sender: TObject);
  private
    procedure activeQuerys;
    procedure abrirTelaModal(tela: TForm; dsTela, dsParametro: TDataSet; acao: TModalAction);
  public
    { Public declarations }
  end;

var
  frmParametro: TfrmParametro;

implementation

uses uDm, uTipoFilamento;

{$R *.dfm}

procedure TfrmParametro.abrirTelaModal(tela: TForm; dsTela, dsParametro: TDataSet; acao: TModalAction);
begin
  dsTela := dsParametro;

  case acao of
    maAdicionar: dsParametro.Append;
    maEditar: dsParametro.Edit;
    maExcluir: dsParametro.Delete;
  end;

  if tela.ShowModal = mrOk then
  begin
    dsParametro.Active := False;
    dsParametro.Active := True;
  end;
end;

procedure TfrmParametro.actAdicionarExecute(Sender: TObject);
begin
  if PageControl.ActivePage = tsTipoFilamento then
  begin
    abrirTelaModal(frmTipoFilamento, frmTipoFilamento.dsMain.DataSet, dsTipoFilamento.DataSet, maAdicionar);
  end
  else if PageControl.ActivePage = tsCategoria then
  begin
    // to do
  end;
end;

procedure TfrmParametro.activeQuerys;
begin
  qryGeral.Active         := True;
  qryTipoFilamento.Active := True;
  qryCategoria.Active     := True;
end;

procedure TfrmParametro.FormCreate(Sender: TObject);
begin
  activeQuerys;
end;

end.
