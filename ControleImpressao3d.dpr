program ControleImpressao3d;

uses
  Vcl.Forms,
  uSeletor in 'uSeletor.pas' {frmSeletor},
  uDM in 'uDM.pas' {dm: TDataModule},
  uParametro in 'uParametro.pas' {frmParametro},
  uPadrao in 'uPadrao.pas' {frmPadrao},
  uTipoFilamento in 'uTipoFilamento.pas' {frmTipoFilamento},
  uCategoria in 'uCategoria.pas' {frmCategoria},
  uPesquisaPadrao in 'uPesquisaPadrao.pas' {frmPesquisaPadrao},
  uPadraoHeranca in 'uPadraoHeranca.pas' {frmPadraoHeranca},
  uImpressao in 'uImpressao.pas' {frmImpressao},
  uArquivo in 'uArquivo.pas' {frmArquivo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSeletor, frmSeletor);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
