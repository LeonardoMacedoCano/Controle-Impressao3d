unit uImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoHeranca, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, uPesquisaPadrao, Vcl.Grids, Vcl.DBGrids;

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
    dsArquivo: TDataSource;
    qryArquivo: TFDQuery;
    gridArquivo: TDBGrid;
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
  private
    procedure atualizarLabels;
    procedure atualizarArquivos;
    procedure zerarCustos;
    procedure verificarCamposObrigatorios;
    function getValueLabelCategoriaDescricao: string;
    function getValueLabelTipoFilamentoDescricao: string;
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

{$R *.dfm}

procedure TfrmImpressao.atualizarArquivos;
begin
  qryArquivo.Active := False;
  qryArquivo.Params.ParamByName('idImpressao').Value := qryMain.FieldByName('id').AsInteger;
  qryArquivo.Active := True;
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

procedure TfrmImpressao.btnConsultarClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
end;

procedure TfrmImpressao.btnExcluirClick(Sender: TObject);
begin
  inherited;

  atualizarArquivos;
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
end;

procedure TfrmImpressao.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPesquisaPadrao.Free;
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

end.
