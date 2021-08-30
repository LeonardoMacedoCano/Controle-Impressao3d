unit uParametro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmParametro = class(TForm)
    PageControl: TPageControl;
    tsGeral: TTabSheet;
    tsTipoFilamento: TTabSheet;
    tsCategoria: TTabSheet;
    pnlBottom: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    dsCategoria: TDataSource;
    qryCategoria: TFDQuery;
    dgCategoria: TDBGrid;
    dsTipoFilamento: TDataSource;
    fdTipoFilamento: TFDQuery;
    dgTipoFilamento: TDBGrid;
    fdGeral: TFDQuery;
    dsGeral: TDataSource;
    lblCustoEnergiaKWH: TLabel;
    edtCustoEnergiaKWH: TEdit;
    lblConsumoEnder3KWH: TLabel;
    edtConsumoEnder3KWH: TEdit;
    lblCustoManutencao: TLabel;
    edtCustoManutencao: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametro: TfrmParametro;

implementation

uses uDm;

{$R *.dfm}

end.
