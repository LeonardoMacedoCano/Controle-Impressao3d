unit uTipoFilamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmTipoFilamento = class(TForm)
    dsMain: TDataSource;
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
