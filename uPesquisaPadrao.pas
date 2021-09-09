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
    procedure btnFiltrarClick(Sender: TObject);
    procedure cbNomeColunaChange(Sender: TObject);
    procedure alimentarCBNomeColuna;
    procedure FormShow(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
  private
    FFiltro: string;
    FIdSelecionado: Variant;
    FNomeColuna: string;
    FTipoColuna: TFieldType;
    function campoSomenteNumeros: Boolean;
    function novoFiltro(var Filtro_Descr: String): String;
    function getTipoColuna: TFieldType;
  public
    property NomeColuna : string read FNomeColuna write FNomeColuna;
    property Filtro : string read FFiltro write FFiltro;
    property TipoColuna : TFieldType read FTipoColuna write FTipoColuna;
    property IdSelecionado : Variant read FIdSelecionado write FIdSelecionado;
    procedure filtrar;
    procedure limparFiltro;
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;

implementation

{$R *.dfm}

{ TfrmPesquisaPadrao }

procedure TfrmPesquisaPadrao.alimentarCBNomeColuna;
var i: integer;
begin
  cbNomeColuna.Clear;

  for i := 0 to dsMain.DataSet.FieldCount -1 do
  begin
    if dsMain.DataSet.Fields[i].FieldName <> EmptyStr then
    begin
      cbNomeColuna.Items.Add(dsMain.DataSet.Fields[i].FieldName);
    end;
  end;

  cbNomeColuna.ItemIndex := 0;

  FNomeColuna := cbNomeColuna.Text;
  FTipoColuna := getTipoColuna;
end;

procedure TfrmPesquisaPadrao.btnFiltrarClick(Sender: TObject);
begin
  filtrar;
end;

procedure TfrmPesquisaPadrao.btnLimparFiltroClick(Sender: TObject);
begin
  limparFiltro;
end;

function TfrmPesquisaPadrao.campoSomenteNumeros: Boolean;
begin
  Result := (TipoColuna = ftSmallint) or
            (TipoColuna = ftInteger) or
            (TipoColuna = ftFloat) or
            (TipoColuna = ftCurrency) or
            (TipoColuna = ftAutoInc);
end;

procedure TfrmPesquisaPadrao.cbNomeColunaChange(Sender: TObject);
begin
  FNomeColuna := cbNomeColuna.Text;
  FTipoColuna := getTipoColuna;
end;

procedure TfrmPesquisaPadrao.DBGridDblClick(Sender: TObject);
begin
  FIdSelecionado := DBGrid.DataSource.DataSet.FieldByName('id').AsVariant;

  ModalResult := mrOk;
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

procedure TfrmPesquisaPadrao.filtrar;
var Filtro_Descr: String;
begin
  if (cbNomeColuna.Text <> EmptyStr) and
     (cbTipoFiltro.Text <> EmptyStr) and
     (edtFiltro.Text    <> EmptyStr) then
  begin
    if Filtro <> EmptyStr then
    begin
      Filtro := Filtro + ' and ' + novoFiltro(Filtro_Descr);
    end
    else
    begin
      Filtro := novoFiltro(Filtro_Descr);
    end;

    qryMain.Close;
    qryMain.Filtered := False;
    qryMain.Filter   := Filtro;
    qryMain.Filtered := True;
    qryMain.Open;

    listBoxFiltros.Items.Add(Filtro_Descr);
  end
  else
  begin
    raise Exception.Create('Campos insuficientes para adicionar um novo filtro!');
  end;
end;

procedure TfrmPesquisaPadrao.FormShow(Sender: TObject);
begin
  alimentarCBNomeColuna;
end;

function TfrmPesquisaPadrao.getTipoColuna: TFieldType;
var i: integer;
begin
  Result := ftUnknown;

  for i := 0 to dsMain.DataSet.FieldCount -1 do
  begin
    if dsMain.DataSet.Fields[i].FieldName = FNomeColuna then
    begin
      Result := dsMain.DataSet.Fields[i].DataType;
    end;
  end;
end;

procedure TfrmPesquisaPadrao.limparFiltro;
begin
  Filtro := EmptyStr;
  listBoxFiltros.Clear;

  qryMain.Close;
  qryMain.Filtered := False;
  qryMain.Filter   := Filtro;
  qryMain.Filtered := True;
  qryMain.Open;
end;

function TfrmPesquisaPadrao.novoFiltro(var Filtro_Descr: String): String;
begin
    Result := cbNomeColuna.Text;

  case cbTipoFiltro.ItemIndex of
    0: begin //Igual
      Result := Result + ' = ''' + edtFiltro.text + '''';
    end;
    1:begin //Inicia com
      Result := Result + ' like ''' + edtFiltro.text + '%''';
    end;
    2:begin //Termina com
      Result := Result + ' like ''%' + edtFiltro.text + '''';
    end;
    3:begin //Contem
      Result := Result + ' like ''%' + edtFiltro.text + '%''';
    end;
    4:begin //Diferente
      Result := Result + ' <> ''' + edtFiltro.text + '''';
    end;
  end;

  Filtro_Descr := cbNomeColuna.Text + ' ' + cbTipoFiltro.Text + ' ' + edtFiltro.text;
end;

end.
