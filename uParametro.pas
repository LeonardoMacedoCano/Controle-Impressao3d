unit uParametro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TfrmParametro = class(TForm)
    PageControl: TPageControl;
    tsGeral: TTabSheet;
    tsTipoFilamento: TTabSheet;
    tsCategoria: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametro: TfrmParametro;

implementation

{$R *.dfm}

end.
