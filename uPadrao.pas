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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmPadrao.btnEditarClick(Sender: TObject);
begin
  dsMain.DataSet.Edit;
end;

procedure TfrmPadrao.btnNovoClick(Sender: TObject);
begin
  dsMain.DataSet.Append;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  dsMain.DataSet.Active := True;
end;

end.