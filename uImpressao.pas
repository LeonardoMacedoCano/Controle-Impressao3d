unit uImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, uPesquisaPadrao, Vcl.Grids, Vcl.DBGrids;

type
  TfrmImpressao = class(TfrmPadrao)
    btnTipoFilamento: TSpeedButton;
    edtTipoFilamento: TDBEdit;
    lblTipoFilamento: TLabel;
    lblCategoria: TLabel;
    edtCategoria: TDBEdit;
    btnCategoria: TSpeedButton;
    edtLink: TDBEdit;
    lblLink: TLabel;
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    dsCategoria: TDataSource;
    qryCategoria: TFDQuery;
    dsTipoFilamento: TDataSource;
    qryTipoFilamento: TFDQuery;
    edtCategoriaDescricao: TEdit;
    edtTipoFilamentoDescricao: TEdit;
    lblCustoMaterial: TLabel;
    edtCustoMaterial: TDBEdit;
    lblCustoEnergia: TLabel;
    edtCustoEnergia: TDBEdit;
    Panel1: TPanel;
    dsArquivo: TDataSource;
    qryArquivo: TFDQuery;
    lblArquivo: TLabel;
    gridArquivo: TDBGrid;
    procedure btnCategoriaClick(Sender: TObject);
    procedure btnTipoFilamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsMainDataChange(Sender: TObject; Field: TField);
  private
    procedure atualizarLabels;
    function getValueLabelCategoriaDescricao: string;
    function getValueLabelTipoFilamentoDescricao: string;
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

{$R *.dfm}

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

procedure TfrmImpressao.FormShow(Sender: TObject);
begin
  inherited;

  atualizarLabels;
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

end.
