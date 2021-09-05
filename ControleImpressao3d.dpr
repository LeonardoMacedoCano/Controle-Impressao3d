program ControleImpressao3d;

uses
  Vcl.Forms,
  uSeletor in 'uSeletor.pas' {frmSeletor},
  uDM in 'uDM.pas' {dm: TDataModule},
  uParametro in 'uParametro.pas' {frmParametro},
  uTipoFilamento in 'uTipoFilamento.pas' {frmTipoFilamento},
  uPadrao in 'uPadrao.pas' {frmPadrao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSeletor, frmSeletor);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmParametro, frmParametro);
  Application.CreateForm(TfrmTipoFilamento, frmTipoFilamento);
  Application.CreateForm(TfrmPadrao, frmPadrao);
  Application.Run;
end.
