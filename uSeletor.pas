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
    btnImpressao: TSpeedButton;
    Image1: TImage;
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
  private
    procedure abrirTelaParametro;
    procedure abrirTelaImpressao;
  public
    { Public declarations }
  end;

var
  frmSeletor: TfrmSeletor;

implementation

uses uParametro, uImpressao;

{$R *.dfm}

procedure TfrmSeletor.abrirTelaImpressao;
begin
  try
    frmImpressao := TfrmImpressao.Create(nil);
    frmImpressao.ShowModal;
  finally
    frmImpressao.Free;
  end;
end;

procedure TfrmSeletor.abrirTelaParametro;
begin
  try
    frmParametro := TfrmParametro.Create(nil);
    frmParametro.ShowModal;
  finally
    frmParametro.Free;
  end;
end;

procedure TfrmSeletor.btnImpressaoClick(Sender: TObject);
begin
  abrirTelaImpressao;
end;

procedure TfrmSeletor.btnConfiguracaoClick(Sender: TObject);
begin
  abrirTelaParametro;
end;

end.
