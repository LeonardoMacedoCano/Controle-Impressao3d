program ControleImpressao3d;

uses
  Vcl.Forms,
  uSeletor in 'uSeletor.pas' {frmSeletor},
  uDM in 'uDM.pas' {DataModule1: TDataModule},
  uParametro in 'uParametro.pas' {frmParametro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSeletor, frmSeletor);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmParametro, frmParametro);
  Application.Run;
end.
