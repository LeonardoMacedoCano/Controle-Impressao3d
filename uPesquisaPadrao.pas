unit uPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    qryMain: TFDQuery;
    dsMain: TDataSource;
    procedure edtFiltroKeyPress(Sender: TObject; var Key: Char);
  private
    FFiltro: string;
    FIdSelecionado: Variant;
    FNomeColuna: string;
    FTipoColuna: TFieldType;
    function campoSomenteNumeros: Boolean;
  public
    property NomeColuna : string read FNomeColuna write FNomeColuna;
    property Filtro : string read FFiltro write FFiltro;
    property TipoColuna : TFieldType read FTipoColuna write FTipoColuna;
    property IdSelecionado : Variant read FIdSelecionado write FIdSelecionado;
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;

implementation

{$R *.dfm}

{ TfrmPesquisaPadrao }

function TfrmPesquisaPadrao.campoSomenteNumeros: Boolean;
begin
  Result := (TipoColuna = ftSmallint) or
            (TipoColuna = ftInteger) or
            (TipoColuna = ftFloat) or
            (TipoColuna = ftCurrency) or
            (TipoColuna = ftAutoInc);
end;

procedure TfrmPesquisaPadrao.edtFiltroKeyPress(Sender: TObject; var Key: Char);
begin
  if campoSomenteNumeros then
  begin
    if not (CharInSet(key,['1','2','3','4','5','6','7','8','9','0',',', Chr(VK_BACK)])) then
    begin
      key := #0;
    end;
  end;
end;

end.
