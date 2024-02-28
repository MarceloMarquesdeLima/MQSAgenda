unit UMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmMensagem = class(TForm)
    pnlFundoMensagem: TPanel;
    shFundoMensagem: TShape;
    Panel1: TPanel;
    Label1: TLabel;
    lblTitulo: TLabel;
    imgMensagem: TImage;
    lblSubTitulo: TLabel;
    lblMensagem: TLabel;
    pnlBtnCancelar: TPanel;
    btnNao: TSpeedButton;
    pnlBtnConfirmar: TPanel;
    btnSim: TSpeedButton;
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    bRespostaMSG : Boolean;
    sTituloJanela, sTituloMSG, sMSG , sCaminhoIcone, sTipo : string;
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.dfm}

procedure TfrmMensagem.btnNaoClick(Sender: TObject);
begin
 bRespostaMSG := false;
 Close;
end;

procedure TfrmMensagem.btnSimClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMensagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSimClick(self)
    else
  if Key= VK_ESCAPE then
    btnNaoClick(self);

end;

procedure TfrmMensagem.FormShow(Sender: TObject);
begin
  bRespostaMSG := false;

  lblTitulo.Caption := sTituloJanela;
  lblSubTitulo.Caption := sTituloMSG;
  lblMensagem.Caption := sMSG;
  imgMensagem.Picture.LoadFromFile( sCaminhoIcone );

  if sTipo = 'OK' then
  begin
    pnlBtnCancelar.Visible := False;
    btnSim.Caption         := 'OK (ENTER)';
  end;
end;

end.
