unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
  private
    { Private declarations }
  public
    function msgPadraoConfirmacao(msg: String): Boolean;
  end;

var
  frmPadrao: TfrmPadrao;

const
  msgConfirmarCancelamento = 'Tem certeza que deseja cancelar?';

implementation

uses uDm;

{$R *.dfm}

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

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  dsMain.DataSet.Active := True;
end;

function TfrmPadrao.msgPadraoConfirmacao(msg: String): Boolean;
begin
  Result := MessageDlg(msg, mtConfirmation, [mbYes, mbNo],0) = mrYes;
end;

end.
