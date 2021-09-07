unit uCategoria;

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
  TfrmCategoria = class(TfrmPadrao)
    edtCodigo: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmCategoria: TfrmCategoria;

implementation

{$R *.dfm}

procedure TfrmCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  ModalResult := mrOk;
end;

end.
