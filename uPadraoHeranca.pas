unit uPadraoHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin;

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
    btnAnteriorChild: TToolButton;
    btnProximoChild: TToolButton;
    EspacamentoChild3: TToolButton;
    EspacamentoChild4: TToolButton;
    btnConsultarChild: TToolButton;
    btnExcluirChild: TToolButton;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadraoHeranca: TfrmPadraoHeranca;

implementation

{$R *.dfm}

end.
