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
    Param_CustoEnergiaKWH: TEdit;
    lblConsumoEnder3KWH: TLabel;
    Param_ConsumoEnder3KWH: TEdit;
    lblCustoManutencao: TLabel;
    Param_CustoManutencao: TEdit;
    lblValorTopoManutencao: TLabel;
    Param_ValorTopoManutencao: TEdit;
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    actAdicionar: TAction;
    Adicionar1: TMenuItem;
    actEditar: TAction;
    Editar1: TMenuItem;
    actExcluir: TAction;
    Excluir1: TMenuItem;
    pnlBottom: TPanel;
    actSelecionar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actAdicionarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure activeQuerys;
    procedure createTelasModal;
    procedure abrirTelaModal(tela: TForm; dsParametro: TDataSet);
    procedure atualizarParametrosGeral(salvarParam: Boolean);
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

procedure TfrmParametro.actSelecionarExecute(Sender: TObject);
begin
  if PageControl.ActivePage = tsTipoFilamento then
  begin
    if not (dsTipoFilamento.DataSet.IsEmpty) then
    begin
      frmTipoFilamento.dsMain.DataSet := dsTipoFilamento.DataSet;
      abrirTelaModal(frmTipoFilamento, dsTipoFilamento.DataSet);
    end;
  end
  else if PageControl.ActivePage = tsCategoria then
  begin
  if not (dsCategoria.DataSet.IsEmpty) then
    begin
      frmCategoria.dsMain.DataSet := dsCategoria.DataSet;
      abrirTelaModal(frmCategoria, dsCategoria.DataSet);
    end;
  end;
end;

procedure TfrmParametro.atualizarParametrosGeral(salvarParam: Boolean);
var
  i: Integer;
begin
  qryGeral.First;

  while not (qryGeral.Eof) do
  begin
    for i := Self.ComponentCount -1 downto 0 do
    begin
      if (Self.Components[i] is TEdit) and
         (Self.Components[i].Name = 'Param_' + qryGeral.FieldByName('Parametro').AsString) then
      begin
        if salvarParam then
        begin
          qryGeral.Edit;
          qryGeral.FieldByName('Valor').AsString := (Self.Components[i] as TEdit).Text;
          qryGeral.Post;
        end
        else
        begin
          (Self.Components[i] as TEdit).Text := qryGeral.FieldByName('Valor').AsString;
        end;
      end;
    end;

    qryGeral.Next;
  end;
end;

procedure TfrmParametro.btnCancelarClick(Sender: TObject);
begin
  if frmPadrao.msgPadraoConfirmacao(msgConfirmarCancelamento) then
  begin
    atualizarParametrosGeral(False);
  end;
end;

procedure TfrmParametro.btnSalvarClick(Sender: TObject);
begin
  atualizarParametrosGeral(True);
end;

procedure TfrmParametro.createTelasModal;
begin
  frmTipoFilamento := TfrmTipoFilamento.Create(nil);
  frmCategoria     := TfrmCategoria.Create(nil);
end;

procedure TfrmParametro.FormCreate(Sender: TObject);
begin
  activeQuerys;
  createTelasModal;

  PageControl.ActivePage := tsGeral;

  atualizarParametrosGeral(False);
end;

procedure TfrmParametro.FormDestroy(Sender: TObject);
begin
  frmTipoFilamento.Free;
  frmCategoria.Free;
end;

end.
