unit UConfiguraServidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.Mask, Vcl.DBCtrls, MQSDBEdit, UFuncoes, MQSMaskEdit,
  UClasseConexao, UDMConexao, MQSEdit;

type
  TfrmConfiguraServidor = class(TForm)
    shpFundo: TShape;
    Panel4: TPanel;
    pnlTopConfiguracao: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    imgIconConfiguracao: TImage;
    lblTextConfiguracao: TLabel;
    lblTextDescricao: TLabel;
    pnlBtnConfirmar: TPanel;
    btnConfirmar: TSpeedButton;
    pnlBtnCancelar: TPanel;
    btnCancelar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    MQSDedtCaminho: TMQSDBEdit;
    Label10: TLabel;
    MQSDBedtPorta: TMQSDBEdit;
    Label11: TLabel;
    MQSDBedtBancoDados: TMQSDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    MQSDBedtLogin: TMQSDBEdit;
    MQSDBedtSenha: TMQSDBEdit;
    edtCaminho: TMQSEdit;
    edtPortaConexao: TMQSEdit;
    edtBancoDado: TMQSEdit;
    edtLogin: TMQSEdit;
    edtSenha: TMQSEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguraServidor: TfrmConfiguraServidor;

implementation

{$R *.dfm}

uses UMensagem;

procedure TfrmConfiguraServidor.btnCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmConfiguraServidor.btnConfirmarClick(Sender: TObject);
begin
  prcValidarCamposObrigatorios( frmConfiguraServidor );
  frmDados.Conexao.Servidor := edtCaminho.Text;
  frmDados.Conexao.Base     := edtBancoDado.Text;
  frmDados.Conexao.Login    := edtLogin.Text;
  frmDados.Conexao.Senha    := edtSenha.Text;
  frmDados.Conexao.Porta    := edtPortaConexao.Text;

  frmDados.Conexao.prcGravarArquivoINI;

  if frmDados.Conexao.fnc_conectar_banco_dados then
  begin
    fnc_criar_mensagem('CONEXÃO AO BANCO DE DADOS',
                       'CONECTADO COM BANCO DE DADOS.',
                       'conectar ao Banco de Dados com sucesso '+ #13 + 'Sistema deverá ser reinicializado.',
                       ExtractFilePath(Application.ExeName) +'\icones\aviso.png','OK');
    Application.Terminate;
  end else
  begin
    fnc_criar_mensagem('CONEXÃO', 'ERRO AO CONECTAR COM BANCO DE DADOS.',
                       'Não foi possível conectar ao Banco de Dados, possível causa: '+ #13
                       + frmDados.Conexao.MsgErro, ExtractFilePath(Application.ExeName) +'\icones\erro.png','OK');
    edtCaminho.SetFocus;
  end;
end;

procedure TfrmConfiguraServidor.FormShow(Sender: TObject);
begin
   if frmDados.Conexao.fncLerArquivoINI then
   begin
      MQSDedtCaminho.Text := frmDados.Conexao.Servidor;
      MQSDBedtBancoDados.Text := frmDados.Conexao.Base;
      MQSDBedtLogin.Text := frmDados.Conexao.Login;
      MQSDBedtSenha.Text := frmDados.Conexao.Senha;
      MQSDBedtPorta.Text := frmDados.Conexao.Porta;
   end;
end;

end.
