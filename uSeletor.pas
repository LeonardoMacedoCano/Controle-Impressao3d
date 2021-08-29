unit uSeletor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmSeletor = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnConfiguracao: TSpeedButton;
    btnArquivo: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeletor: TfrmSeletor;

implementation

{$R *.dfm}

end.
