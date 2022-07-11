unit uPadraoHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, uDM;

type
  TfrmPadraoHeranca = class(TfrmPadrao)
    ToolBarChild: TToolBar;
    imgToolBarChild: TImageList;
    btnNovoChild: TToolButton;
    btnEditarChild: TToolButton;
    btnSalvarChild: TToolButton;
    btnCancelarChild: TToolButton;
    EspacamentoChild1: TToolButton;
    EspacamentoChild2: TToolButton;
    pnlChild: TPanel;
    gbChild: TGroupBox;
    btnAnteriorChild: TToolButton;
    btnProximoChild: TToolButton;
    EspacamentoChild3: TToolButton;
    EspacamentoChild4: TToolButton;
    btnConsultarChild: TToolButton;
    btnExcluirChild: TToolButton;
    dsChild: TDataSource;
    qryChild: TFDQuery;
    procedure dsMainStateChange(Sender: TObject);
    procedure dsChildStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoChildClick(Sender: TObject);
    procedure btnEditarChildClick(Sender: TObject);
    procedure btnSalvarChildClick(Sender: TObject);
    procedure btnCancelarChildClick(Sender: TObject);
    procedure btnExcluirChildClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAnteriorChildClick(Sender: TObject);
    procedure btnProximoChildClick(Sender: TObject);
  private
    function isModoEdicaoDsChild: Boolean;
    procedure atualizarToolbarChild;
  public
    { Public declarations }
  end;

var
  frmPadraoHeranca: TfrmPadraoHeranca;

implementation

{$R *.dfm}

procedure TfrmPadraoHeranca.atualizarToolbarChild;
begin
  btnSalvarChild.Enabled    := isModoEdicaoDsChild;
  btnCancelarChild.Enabled  := isModoEdicaoDsChild;
  btnExcluirChild.Enabled   := not isModoEdicaoDsChild;
  btnNovoChild.Enabled      := not isModoEdicaoDsChild;
  btnEditarChild.Enabled    := not isModoEdicaoDsChild;
  btnConsultarChild.Enabled := not isModoEdicaoDsChild;
end;

procedure TfrmPadraoHeranca.btnAnteriorChildClick(Sender: TObject);
begin
  inherited;

  dsChild.DataSet.Prior;
end;

procedure TfrmPadraoHeranca.btnCancelarChildClick(Sender: TObject);
begin
  inherited;

  if msgPadraoConfirmacao(msgConfirmarCancelamento) then
  begin
    dsChild.DataSet.Cancel;
  end;
end;

procedure TfrmPadraoHeranca.btnCancelarClick(Sender: TObject);
begin
  if msgPadraoConfirmacao(msgConfirmarCancelamento) then
  begin
    dsChild.DataSet.Cancel;
    dsMain.DataSet.Cancel;

    if dm.FDConnection.InTransaction then
    begin
      dm.FDConnection.Rollback;
    end;

    dm.FDConnection.Connected := False;
    dm.FDConnection.Connected := True;

    qryMain.Active  := False;
    qryMain.Active  := True;

    qryChild.Active := False;
    qryChild.Active := True;
  end;
end;

procedure TfrmPadraoHeranca.btnEditarChildClick(Sender: TObject);
begin
  inherited;

  dsChild.DataSet.Edit;
end;

procedure TfrmPadraoHeranca.btnExcluirChildClick(Sender: TObject);
begin
  inherited;

  if not (dsChild.DataSet.IsEmpty) and msgPadraoConfirmacao(msgConfirmarExclucao) then
  begin
    dsMain.DataSet.Edit;
    dsChild.DataSet.Delete;
  end;
end;

procedure TfrmPadraoHeranca.btnExcluirClick(Sender: TObject);
begin
  if not (dsMain.DataSet.IsEmpty) and msgPadraoConfirmacao(msgConfirmarExclucao) then
  begin
    if not (dsChild.DataSet.IsEmpty) then
    begin
      dsChild.DataSet.Delete;
    end;

    dsMain.DataSet.Delete;
  end;
end;

procedure TfrmPadraoHeranca.btnNovoChildClick(Sender: TObject);
begin
  inherited;

  dsChild.DataSet.Append;
end;

procedure TfrmPadraoHeranca.btnProximoChildClick(Sender: TObject);
begin
  inherited;

  dsChild.DataSet.Next;
end;

procedure TfrmPadraoHeranca.btnSalvarChildClick(Sender: TObject);
begin
  inherited;

  dsChild.DataSet.Post;
end;

procedure TfrmPadraoHeranca.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if dm.FDConnection.InTransaction then
  begin
    dm.FDConnection.Commit;
  end;
end;

procedure TfrmPadraoHeranca.dsChildStateChange(Sender: TObject);
begin
  if (dsChild.State in dsEditModes) and
     (not (dm.FDConnection.InTransaction)) then
  begin
    dm.FDConnection.StartTransaction;
  end;

  inherited;

  if (dsChild.State in dsEditModes) and
     (not (dsMain.State in dsEditModes)) then
  begin
    dsMain.Edit;
  end;

  atualizarToolbarChild;
end;

procedure TfrmPadraoHeranca.dsMainStateChange(Sender: TObject);
begin
  if (dsMain.State in dsEditModes) and
     (not (dm.FDConnection.InTransaction)) then
  begin
    dm.FDConnection.StartTransaction;
  end;

  inherited;

end;

function TfrmPadraoHeranca.isModoEdicaoDsChild: Boolean;
begin
  Result := (dsChild.State in dsEditModes);
end;

end.
