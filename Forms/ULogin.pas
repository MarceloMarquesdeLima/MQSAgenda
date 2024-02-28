unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, UPrincipal;

type
  TfrmLogin = class(TForm)
    pnlFundo: TPanel;
    pnlLateral: TPanel;
    lblNomeSistema: TLabel;
    lblDesenvolvimento: TLabel;
    lblVersao: TLabel;
    imgLogo: TImage;
    lblLoginSenha: TLabel;
    lblBemVindo: TLabel;
    pnlUsuario: TPanel;
    lblUsuario: TLabel;
    pnlTracoUsuario: TPanel;
    pnlSenha: TPanel;
    lblSenha: TLabel;
    pnlTracoSenha: TPanel;
    btnFechar: TSpeedButton;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    pnlBtnConfirmar: TPanel;
    btnConfirmar: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnConfirmaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
begin
   frmPrincipal := TfrmPrincipal.Create(nil);
   frmPrincipal.ShowModal;

   Application.Terminate;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
 pnlFundo.Left := Round (( frmLogin.Width - pnlFundo.Width ) / 2) ;
 pnlFundo.Top :=  Round (( frmLogin.Height - pnlFundo.Height ) / 2 );
end;

end.
