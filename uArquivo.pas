unit uArquivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, uDM;

type
  TfrmArquivo = class(TfrmPadrao)
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    lblDescricao: TLabel;
    edtDescricao: TDBEdit;
    lblCaminho: TLabel;
    edtCaminho: TDBEdit;
    lblCustoMaterial: TLabel;
    edtCustoMaterial: TDBEdit;
    lblCustoEnergia: TLabel;
    edtCustoEnergia: TDBEdit;
    edtComprimentoFilamento: TDBEdit;
    lblComprimentoFilamento: TLabel;
    edtTempoImpressao: TDBEdit;
    lblTempoImpressao: TLabel;
    edtPeso: TDBEdit;
    lblPeso: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIdImpressao: Integer;
    function GetSQLBuscaValorTipoFilamento: string;
    function GetValorTipoFilamento: Double;
    procedure CalcularCustoMaterial;
    procedure CalcularCustoEnergia;
  public
    { Public declarations }
  published
    property IdImpressao: Integer read FIdImpressao write FIdImpressao;
  end;

var
  frmArquivo: TfrmArquivo;

implementation

{$R *.dfm}

function TfrmArquivo.GetSQLBuscaValorTipoFilamento;
begin
  Result := 'select Valor from TipoFilamento ' +
            ' where ID = ( ' +
            '   select IDTipoFilamento from Impressao ' +
            '     where ID = :IdImpressao ' +
            '   )';
end;

function TfrmArquivo.GetValorTipoFilamento: Double;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := dm.FDConnection;
    qry.SQL.Text := GetSQLBuscaValorTipoFilamento;
    qry.Params.ParamByName('IdImpressao').AsInteger := FIdImpressao;
    qry.Open;

    Result := qry.FieldByName('Valor').AsFloat;
  finally
    qry.Free;
  end;
end;

procedure TfrmArquivo.CalcularCustoMaterial;
var
  vPeso,
  vValorQuiloFilamento,
  vValorCustoMaterial: Double;
begin
  vPeso := StrToFloat(edtPeso.Text);
  vValorQuiloFilamento := GetValorTipoFilamento;
  vValorCustoMaterial := 0.00;

  if (vPeso > 0.00) and (vValorQuiloFilamento > 0.00) then
  begin
    vValorCustoMaterial := (vValorQuiloFilamento / 1000) * vPeso;
  end;

  dsMain.DataSet.FieldByName('CustoMaterial').AsString := FormatarValorMoeda(vValorCustoMaterial);
end;

procedure TfrmArquivo.CalcularCustoEnergia;
var
  vCustoEnergiaKWH: Double;
  vConsumoEnder3KWH: Double;
  vTempoImpressao: Integer;
  vValorCustoEnergia: Double;
begin
  vCustoEnergiaKWH := StrToFloat(GetValorParametroGeral('CustoEnergiaKWH'));
  vConsumoEnder3KWH := StrToFloat(GetValorParametroGeral('ConsumoEnder3KWH'));
  vTempoImpressao := qryMain.FieldByName('TempoImpressao').AsInteger;

  vValorCustoEnergia := (vCustoEnergiaKWH / 1000 * vConsumoEnder3KWH) * (vTempoImpressao / 60);

  dsMain.DataSet.FieldByName('CustoMaterial').AsString := FormatarValorMoeda(vValorCustoEnergia);
end;

procedure TfrmArquivo.btnSalvarClick(Sender: TObject);
begin
  dsMain.DataSet.FieldByName('IdImpressao').AsInteger := FIdImpressao;

  CalcularCustoMaterial;
  //CalcularCustoEnergia;

  inherited;
end;

procedure TfrmArquivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  ModalResult := mrOk;
end;

end.
