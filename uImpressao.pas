unit uImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoHeranca, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, uPesquisaPadrao, Vcl.Grids, Vcl.DBGrids,
  System.Actions, Vcl.ActnList;

type
  TfrmImpressao = class(TfrmPadraoHeranca)
    lblCustoMaterial: TLabel;
    lblTipoFilamento: TLabel;
    lblCategoria: TLabel;
    lblLink: TLabel;
    lblDescricao: TLabel;
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    edtLink: TDBEdit;
    edtCategoria: TDBEdit;
    edtTipoFilamento: TDBEdit;
    edtCustoMaterial: TDBEdit;
    btnTipoFilamento: TSpeedButton;
    btnCategoria: TSpeedButton;
    edtCategoriaDescricao: TEdit;
    edtTipoFilamentoDescricao: TEdit;
    lblCustoEnergia: TLabel;
    edtCustoEnergia: TDBEdit;
    dsCategoria: TDataSource;
    qryCategoria: TFDQuery;
    qryTipoFilamento: TFDQuery;
    dsTipoFilamento: TDataSource;
    gridArquivo: TDBGrid;
    ActionList: TActionList;
    actAdicionarArquivo: TAction;
    actEditarArquivo: TAction;
    procedure btnCategoriaClick(Sender: TObject);
    procedure btnTipoFilamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsMainDataChange(Sender: TObject; Field: TField);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultarChildClick(Sender: TObject);
    procedure gridArquivoDblClick(Sender: TObject);
    procedure actAdicionarArquivoExecute(Sender: TObject);
    procedure btnNovoChildClick(Sender: TObject);
    procedure actEditarArquivoExecute(Sender: TObject);
    procedure btnEditarChildClick(Sender: TObject);
  private
    procedure atualizarLabels;
    procedure atualizarArquivos;
    procedure zerarCustos;
    procedure verificarCamposObrigatorios;
    procedure abrirTelaArquivos(AModoEstado: TDataSetState);
    function getValueLabelCategoriaDescricao: string;
    function getValueLabelTipoFilamentoDescricao: string;
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

uses uArquivo;

{$R *.dfm}

procedure TfrmImpressao.actAdicionarArquivoExecute(Sender: TObject);
begin
  inherited;

  abrirTelaArquivos(dsInsert);
end;

procedure TfrmImpressao.actEditarArquivoExecute(Sender: TObject);
begin
  inherited;

  abrirTelaArquivos(dsEdit);
end;

procedure TfrmImpressao.atualizarArquivos;
begin
  qryChild.Active := False;
  qryChild.Params.ParamByName('idImpressao').Value := qryMain.FieldByName('id').AsInteger;
  qryChild.Active := True;
end;

procedure TfrmImpressao.atualizarLabels;
begin
  if (qryMain.Active) and
     (qryCategoria.Active) and
     (qryTipoFilamento.Active) then
  begin
    edtCategoriaDescricao.Text     := getValueLabelCategoriaDescricao;
    edtTipoFilamentoDescricao.Text := getValueLabelTipoFilamentoDescricao;
  end;
end;

procedure TfrmImpressao.btnAnteriorClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
end;

procedure TfrmImpressao.btnCancelarClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
end;

procedure TfrmImpressao.btnCategoriaClick(Sender: TObject);
begin
  if (dsMain.State in dsEditModes) then
  begin
    frmPesquisaPadrao.dsMain := dsCategoria;
    frmPesquisaPadrao.qryMain.SQL := qryCategoria.SQL;
    frmPesquisaPadrao.qryMain.Active := True;

    if frmPesquisaPadrao.ShowModal = mrOk then
    begin
      dsCategoria.DataSet.Locate('id', frmPesquisaPadrao.IdSelecionado, []);

      if qryCategoria.FieldByName('id').AsInteger > 0 then
      begin
        qryMain.Edit;
        qryMain.FieldByName('idCategoria').AsInteger := qryCategoria.FieldByName('id').AsInteger;
        edtCategoriaDescricao.Text                   := qryCategoria.FieldByName('Descricao').AsString;
      end;
    end;
  end;
end;

procedure TfrmImpressao.btnConsultarChildClick(Sender: TObject);
begin
  frmPesquisaPadrao.dsMain := dsChild;
  frmPesquisaPadrao.qryMain.SQL := qryChild.SQL;
  frmPesquisaPadrao.qryMain.ParamByName('idImpressao').AsInteger := qryChild.ParamByName('idImpressao').AsInteger;
  frmPesquisaPadrao.qryMain.Active := True;

  if frmPesquisaPadrao.ShowModal = mrOk then
  begin
    dsChild.DataSet.Locate('id', frmPesquisaPadrao.IdSelecionado, []);
  end;
end;

procedure TfrmImpressao.btnConsultarClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
end;

procedure TfrmImpressao.btnEditarChildClick(Sender: TObject);
begin
  inherited;

  if not (dsChild.DataSet.IsEmpty) then
  begin
    actEditarArquivo.Execute;
  end;
end;

procedure TfrmImpressao.btnExcluirClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
end;

procedure TfrmImpressao.btnNovoChildClick(Sender: TObject);
begin
  inherited;

  actAdicionarArquivo.Execute;
end;

procedure TfrmImpressao.btnNovoClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
  zerarCustos;
end;

procedure TfrmImpressao.btnProximoClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
end;

procedure TfrmImpressao.btnSalvarClick(Sender: TObject);
begin
  verificarCamposObrigatorios;

  inherited;
end;

procedure TfrmImpressao.btnTipoFilamentoClick(Sender: TObject);
begin
  if (dsMain.State in dsEditModes) then
  begin
    frmPesquisaPadrao.dsMain := dsTipoFilamento;
    frmPesquisaPadrao.qryMain.SQL := qryTipoFilamento.SQL;
    frmPesquisaPadrao.qryMain.Active := True;

    if frmPesquisaPadrao.ShowModal = mrOk then
    begin
      dsTipoFilamento.DataSet.Locate('id', frmPesquisaPadrao.IdSelecionado, []);

      if qryTipoFilamento.FieldByName('id').AsInteger > 0 then
      begin
        qryMain.Edit;
        qryMain.FieldByName('idTipoFilamento').AsInteger := qryTipoFilamento.FieldByName('id').AsInteger;
        edtTipoFilamentoDescricao.Text                   := qryTipoFilamento.FieldByName('Descricao').AsString;
      end;
    end;
  end;
end;

procedure TfrmImpressao.dsMainDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  atualizarLabels;
end;

procedure TfrmImpressao.FormCreate(Sender: TObject);
begin
  inherited;

  frmPesquisaPadrao := TfrmPesquisaPadrao.Create(nil);
  frmArquivo := tfrmArquivo.Create(nil);
end;

procedure TfrmImpressao.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPesquisaPadrao.Free;
  frmArquivo.Free;
end;

procedure TfrmImpressao.FormShow(Sender: TObject);
begin
  inherited;

  atualizarLabels;
  atualizarArquivos;
end;

function TfrmImpressao.getValueLabelCategoriaDescricao: string;
begin
  Result := EmptyStr;

  if qryMain.FieldByName('idCategoria').AsInteger > 0 then
  begin
    dsCategoria.DataSet.Locate('id', qryMain.FieldByName('idCategoria').AsInteger, []);
    Result := qryCategoria.FieldByName('Descricao').AsString;
  end;
end;

function TfrmImpressao.getValueLabelTipoFilamentoDescricao: string;
begin
  Result := EmptyStr;

  if qryMain.FieldByName('idTipoFilamento').AsInteger > 0 then
  begin
    dsTipoFilamento.DataSet.Locate('id', qryMain.FieldByName('idTipoFilamento').AsInteger, []);
    Result := qryTipoFilamento.FieldByName('Descricao').AsString;
  end;
end;

procedure TfrmImpressao.gridArquivoDblClick(Sender: TObject);
begin
  inherited;

  if not (dsChild.DataSet.IsEmpty) then
  begin
    abrirTelaArquivos(dsBrowse);
  end;
end;

procedure TfrmImpressao.verificarCamposObrigatorios;
begin
  verificarCampoNuloOuVazio(edtDescricao.Field,     'Preencha a Descrição!');
  verificarCampoNuloOuVazio(edtCategoria.Field,     'Preencha a Categoria!');
  verificarCampoNuloOuVazio(edtTipoFilamento.Field, 'Preencha o Tipo Filamento!');
end;

procedure TfrmImpressao.zerarCustos;
begin
  qryMain.FieldByName('CustoMaterial').AsFloat := 0.00;
  qryMain.FieldByName('CustoEnergia').AsFloat  := 0.00;
end;

procedure TfrmImpressao.abrirTelaArquivos(AModoEstado: TDataSetState);
begin
  frmArquivo.dsMain.DataSet := dsChild.DataSet;
  frmArquivo.IdImpressao := qryMain.FieldByName('Id').AsInteger;

  if (AModoEstado = dsInsert) then
  begin
    dsChild.DataSet.Append;
  end
  else if (AModoEstado = dsEdit) then
  begin
    dsChild.DataSet.Edit;
  end;

  if frmArquivo.ShowModal = mrOk then
  begin
    atualizarDataSet(dsChild.DataSet);
  end;
end;

end.
