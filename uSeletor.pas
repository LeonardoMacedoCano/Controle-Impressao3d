unit uSeletor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfrmSeletor = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnConfiguracao: TSpeedButton;
    btnArquivo: TSpeedButton;
    Image1: TImage;
    procedure btnConfiguracaoClick(Sender: TObject);
  private
    procedure abrirTelaParametro;
  public
    { Public declarations }
  end;

var
  frmSeletor: TfrmSeletor;

implementation

uses uParametro;

{$R *.dfm}

procedure TfrmSeletor.abrirTelaParametro;
begin
  frmParametro := TfrmParametro.Create(nil);
  frmParametro.Show;
end;

procedure TfrmSeletor.btnConfiguracaoClick(Sender: TObject);
begin
  abrirTelaParametro;
end;

end.
