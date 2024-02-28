unit UCadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  MQSEdit, Vcl.DBCtrls, MQSDBLookupComboBox;

type
  TfrmPadrao = class(TForm)
    pnlFundo: TPanel;
    shPadrao: TShape;
    lblTitulo: TLabel;
    pnlButton: TPanel;
    btnClose: TSpeedButton;
    pnlPesquisa: TPanel;
    pnlSeparacao: TPanel;
    pnlSeparacaoInferior: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    btnNovo: TSpeedButton;
    lcbPadrao: TMQSDBLookupComboBox;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

procedure TfrmPadrao.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
