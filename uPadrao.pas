unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.UITypes;

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
  private
    function isModoEdicaoDsMain: Boolean;
    procedure atualizarBtnToolbarMain;
    procedure atualizarSetasToolbarMain;
  public
    function msgPadraoConfirmacao(msg: String): Boolean;
    function somenteNumero(snum : String): String;
    procedure verificarCampoNuloOuVazio(campo: TField; msgErro: string);
  end;

var
  frmPadrao: TfrmPadrao;

const
  msgConfirmarCancelamento = 'Tem certeza que deseja cancelar?';
  msgConfirmarExclucao     = 'Tem certeza que deseja excluir esse registro?';

implementation

uses uDm;

{$R *.dfm}

procedure TfrmPadrao.atualizarBtnToolbarMain;
begin
  btnSalvar.Enabled    := isModoEdicaoDsMain;
  btnCancelar.Enabled  := isModoEdicaoDsMain;
  btnNovo.Enabled      := not isModoEdicaoDsMain;
  btnEditar.Enabled    := not isModoEdicaoDsMain;
  btnConsultar.Enabled := not isModoEdicaoDsMain;
  btnExcluir.Enabled   := not isModoEdicaoDsMain;
end;

procedure TfrmPadrao.atualizarSetasToolbarMain;
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
    atualizarSetasToolbarMain;
  end;
end;

procedure TfrmPadrao.dsMainStateChange(Sender: TObject);
begin
  atualizarBtnToolbarMain;
end;

function TfrmPadrao.isModoEdicaoDsMain: Boolean;
begin
  Result := (dsMain.State in dsEditModes);
end;

function TfrmPadrao.msgPadraoConfirmacao(msg: String): Boolean;
begin
  Result := MessageDlg(msg, mtConfirmation, [mbYes, mbNo],0) = mrYes;
end;

function TfrmPadrao.somenteNumero(snum: String): String;
var i: Integer;
begin
  Result := '';

  for i := 1 to Length(snum) do
  begin
    if CharInSet(snum[i],['0'..'9']) then
    begin
      Result := Result + snum[i];
    end;
  end;
end;

procedure TfrmPadrao.verificarCampoNuloOuVazio(campo: TField; msgErro: string);
begin
  if (campo.IsNull) or
     (Trim(campo.AsString) = EmptyStr) then
  begin
    raise Exception.Create(msgErro);
  end;
end;

end.
