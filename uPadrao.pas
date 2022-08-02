unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.UITypes, uPesquisaPadrao;

type
  TfrmPadrao = class(TForm)
    imgToolBar: TImageList;
    ToolBar: TToolBar;
    btnNovo: TToolButton;
    btnEditar: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    Espacamento1: TToolButton;
    Espacamento2: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    Espacamento3: TToolButton;
    Espacamento4: TToolButton;
    btnConsultar: TToolButton;
    btnExcluir: TToolButton;
    pnlMain: TPanel;
    dsMain: TDataSource;
    qryMain: TFDQuery;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dsMainStateChange(Sender: TObject);
    procedure dsMainDataChange(Sender: TObject; Field: TField);
    procedure btnConsultarClick(Sender: TObject);
  private
    function IsModoEdicaoDsMain: Boolean;
    procedure AtualizarBtnToolbarMain;
    procedure AtualizarSetasToolbarMain;
  public
    function MsgPadraoConfirmacao(AMensagem: String): Boolean;
    function FormatarSomenteNumero(AString: String): String;
    function FormatarValorMoeda(AValor: Double): string;
    function GetSQLValorParametroGeral: string;
    function GetValorParametroGeral(AParametro: string): string;
    procedure VerificarCampoNuloOuVazio(ACampo: TField; AMensagemErro: string);
    procedure AtualizarDataSet(ADataSet: TDataSet);
    procedure LocalizarIDSelecionado(ADataSource: TDataSource);
  end;

var
  frmPadrao: TfrmPadrao;

const
  msgConfirmarCancelamento = 'Tem certeza que deseja cancelar?';
  msgConfirmarExclucao     = 'Tem certeza que deseja excluir esse registro?';

implementation

uses uDm;

{$R *.dfm}

procedure TfrmPadrao.AtualizarBtnToolbarMain;
begin
  btnSalvar.Enabled    := IsModoEdicaoDsMain;
  btnCancelar.Enabled  := IsModoEdicaoDsMain;
  btnNovo.Enabled      := not IsModoEdicaoDsMain;
  btnEditar.Enabled    := not IsModoEdicaoDsMain;
  btnAnterior.Enabled  := not IsModoEdicaoDsMain;
  btnProximo.Enabled   := not IsModoEdicaoDsMain;
  btnConsultar.Enabled := not IsModoEdicaoDsMain;
  btnExcluir.Enabled   := not IsModoEdicaoDsMain;
end;

procedure TfrmPadrao.AtualizarDataSet(ADataSet: TDataSet);
begin
  ADataSet.Active := False;
  ADataSet.Active := True;
end;

procedure TfrmPadrao.AtualizarSetasToolbarMain;
begin
  btnAnterior.Enabled := not (dsMain.DataSet.Bof);
  btnProximo.Enabled  := not (dsMain.DataSet.Eof);
end;

procedure TfrmPadrao.btnAnteriorClick(Sender: TObject);
begin
  dsMain.DataSet.Prior;
end;

procedure TfrmPadrao.btnCancelarClick(Sender: TObject);
begin
  if msgPadraoConfirmacao(msgConfirmarCancelamento) then
  begin
    dsMain.DataSet.Cancel;
  end;
end;

procedure TfrmPadrao.btnConsultarClick(Sender: TObject);
begin
  frmPesquisaPadrao.dsMain := dsMain;
  frmPesquisaPadrao.qryMain.SQL := qryMain.SQL;
  frmPesquisaPadrao.qryMain.Active := True;

  if frmPesquisaPadrao.ShowModal = mrOk then
  begin
    dsMain.DataSet.Locate('id', frmPesquisaPadrao.IdSelecionado, []);
  end;
end;

procedure TfrmPadrao.btnEditarClick(Sender: TObject);
begin
  dsMain.DataSet.Edit;
end;

procedure TfrmPadrao.btnExcluirClick(Sender: TObject);
begin
  if not (dsMain.DataSet.IsEmpty) and msgPadraoConfirmacao(msgConfirmarExclucao) then
  begin
    dsMain.DataSet.Delete;
  end;
end;

procedure TfrmPadrao.btnNovoClick(Sender: TObject);
begin
  dsMain.DataSet.Append;
end;

procedure TfrmPadrao.btnProximoClick(Sender: TObject);
begin
  dsMain.DataSet.Next;
end;

procedure TfrmPadrao.btnSalvarClick(Sender: TObject);
begin
  dsMain.DataSet.Post;
end;

procedure TfrmPadrao.dsMainDataChange(Sender: TObject; Field: TField);
begin
  if not (dsMain.State in dsEditModes) then
  begin
    AtualizarSetasToolbarMain;
  end;
end;

procedure TfrmPadrao.dsMainStateChange(Sender: TObject);
begin
  AtualizarBtnToolbarMain;
end;

function TfrmPadrao.IsModoEdicaoDsMain: Boolean;
begin
  Result := (dsMain.State in dsEditModes);
end;

function TfrmPadrao.msgPadraoConfirmacao(AMensagem: String): Boolean;
begin
  Result := MessageDlg(AMensagem, mtConfirmation, [mbYes, mbNo],0) = mrYes;
end;

function TfrmPadrao.FormatarSomenteNumero(AString: String): String;
var
  i: Integer;
begin
  Result := EmptyStr;

  for i := 1 to Length(AString) do
  begin
    if CharInSet(AString[i],['0'..'9']) then
    begin
      Result := Result + AString[i];
    end;
  end;
end;

procedure TfrmPadrao.VerificarCampoNuloOuVazio(ACampo: TField; AMensagemErro: string);
begin
  if (ACampo.IsNull) or (Trim(ACampo.AsString) = EmptyStr) then
  begin
    raise Exception.Create(AMensagemErro);
  end;
end;

function TfrmPadrao.FormatarValorMoeda(AValor: Double): string;
begin
  Result := FormatFloat(',0.00', AValor);
end;

function TfrmPadrao.GetSQLValorParametroGeral: string;
begin
  Result := 'Select Valor from ParametroGeral ' +
            'Where Parametro = :Parametro';
end;

function TfrmPadrao.GetValorParametroGeral(AParametro: string): string;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := dm.FDConnection;
    qry.SQL.Text := GetSQLValorParametroGeral;
    qry.Params.ParamByName('Parametro').AsString := AParametro;
    qry.Open;

    Result := qry.FieldByName('Valor').AsString;
  finally
    qry.Free;
  end;
end;

procedure TfrmPadrao.LocalizarIDSelecionado(ADataSource: TDataSource);
begin
  if not(ADataSource.DataSet.Active) then
  begin
    ADataSource.DataSet.Active := True;
  end;

  ADataSource.DataSet.Locate('ID', frmPesquisaPadrao.IdSelecionado, []);
end;

end.
