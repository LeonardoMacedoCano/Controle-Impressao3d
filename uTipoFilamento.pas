unit uTipoFilamento;

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
  TfrmTipoFilamento = class(TfrmPadrao)
    Label1: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtValor: TDBEdit;
    edtDensidade: TDBEdit;
    edtDiametro: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoFilamento: TfrmTipoFilamento;

implementation

{$R *.dfm}

end.
