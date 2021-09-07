unit uParametro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList, uPadrao;

type
  TfrmParametro = class(TForm)
    PageControl: TPageControl;
    tsGeral: TTabSheet;
    tsTipoFilamento: TTabSheet;
    tsCategoria: TTabSheet;
    pnlGeral: TPanel;
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
    actEditar: TAction;
    Editar1: TMenuItem;
    actExcluir: TAction;
    Excluir1: TMenuItem;
    pnlBottom: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure actAdicionarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    procedure activeQuerys;
    procedure abrirTelaModal(tela: TForm; dsParametro: TDataSet);
  public
    { Public declarations }
  end;

var
  frmParametro: TfrmParametro;

implementation

uses uDm, uTipoFilamento, uCategoria;

{$R *.dfm}

procedure TfrmParametro.abrirTelaModal(tela: TForm; dsParametro: TDataSet);
begin
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
    frmTipoFilamento.dsMain.DataSet := dsTipoFilamento.DataSet;
    dsTipoFilamento.DataSet.Append;

    abrirTelaModal(frmTipoFilamento, dsTipoFilamento.DataSet);
  end
  else if PageControl.ActivePage = tsCategoria then
  begin
    frmCategoria.dsMain.DataSet := dsCategoria.DataSet;
    dsCategoria.DataSet.Append;

    abrirTelaModal(frmCategoria, dsCategoria.DataSet);
  end;
end;

procedure TfrmParametro.actEditarExecute(Sender: TObject);
begin
  if PageControl.ActivePage = tsTipoFilamento then
  begin
    frmTipoFilamento.dsMain.DataSet := dsTipoFilamento.DataSet;
    dsTipoFilamento.DataSet.Edit;

    abrirTelaModal(frmTipoFilamento, dsTipoFilamento.DataSet);
  end
  else if PageControl.ActivePage = tsCategoria then
  begin
    frmCategoria.dsMain.DataSet := dsCategoria.DataSet;
    dsCategoria.DataSet.Edit;

    abrirTelaModal(frmCategoria, dsCategoria.DataSet);
  end;
end;

procedure TfrmParametro.actExcluirExecute(Sender: TObject);
begin
  if PageControl.ActivePage = tsTipoFilamento then
  begin
    if not (dsTipoFilamento.DataSet.IsEmpty) and frmPadrao.msgPadraoConfirmacao(msgConfirmarExclucao) then
    begin
      frmTipoFilamento.dsMain.DataSet := dsTipoFilamento.DataSet;
      dsTipoFilamento.DataSet.Delete;

      abrirTelaModal(frmTipoFilamento, dsTipoFilamento.DataSet);
    end;
  end
  else if PageControl.ActivePage = tsCategoria then
  begin
    if not (dsCategoria.DataSet.IsEmpty) and frmPadrao.msgPadraoConfirmacao(msgConfirmarExclucao) then
    begin
      frmCategoria.dsMain.DataSet := dsCategoria.DataSet;
      dsCategoria.DataSet.Delete;

      abrirTelaModal(frmCategoria, dsCategoria.DataSet);
    end;
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
