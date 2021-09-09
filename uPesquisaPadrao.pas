unit uPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaPadrao = class(TForm)
    pnlFiltro: TPanel;
    cbNomeColuna: TComboBox;
    cbTipoFiltro: TComboBox;
    edtFiltro: TEdit;
    btnFiltrar: TButton;
    btnLimparFiltro: TSpeedButton;
    listBoxFiltros: TListBox;
    DBGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;

implementation

{$R *.dfm}

end.
