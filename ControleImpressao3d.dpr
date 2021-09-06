program ControleImpressao3d;

uses
  Vcl.Forms,
  uSeletor in 'uSeletor.pas' {frmSeletor},
  uDM in 'uDM.pas' {dm: TDataModule},
  uParametro in 'uParametro.pas' {frmParametro},
  uPadrao in 'uPadrao.pas' {frmPadrao},
  uTipoFilamento in 'uTipoFilamento.pas' {frmTipoFilamento},
  uCategoria in 'uCategoria.pas' {frmCategoria};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSeletor, frmSeletor);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmParametro, frmParametro);
  Application.CreateForm(TfrmPadrao, frmPadrao);
  Application.CreateForm(TfrmTipoFilamento, frmTipoFilamento);
  Application.CreateForm(TfrmCategoria, frmCategoria);
  Application.Run;
end.
