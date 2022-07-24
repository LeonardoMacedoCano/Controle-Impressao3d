unit uArquivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls;

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
  public
    { Public declarations }
  published
    property IdImpressao: Integer read FIdImpressao write FIdImpressao;
  end;

var
  frmArquivo: TfrmArquivo;

implementation

{$R *.dfm}

procedure TfrmArquivo.btnSalvarClick(Sender: TObject);
begin
  dsMain.DataSet.FieldByName('IdImpressao').AsInteger := FIdImpressao;

  inherited;

end;

procedure TfrmArquivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  ModalResult := mrOk;
end;

end.
