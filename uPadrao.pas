unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.BaseImageCollection, Vcl.ImageCollection;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

end.
