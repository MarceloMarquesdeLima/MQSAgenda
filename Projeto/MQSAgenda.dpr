program MQSAgenda;

uses
  Vcl.Forms,
  UFuncoes in '..\Classes\UFuncoes.pas',
  UClasseConexao in '..\Classes\UClasseConexao.pas',
  System.SysUtils,
  UCadPadrao in '..\Forms\UCadPadrao.pas' {frmPadrao},
  UConfiguraServidor in '..\Forms\UConfiguraServidor.pas' {frmConfiguraServidor},
  UDMConexao in '..\Forms\UDMConexao.pas' {frmDados: TDataModule},
  ULogin in '..\Forms\ULogin.pas' {frmLogin},
  UMensagem in '..\Forms\UMensagem.pas' {frmMensagem},
  UPrincipal in '..\Forms\UPrincipal.pas' {frmPrincipal},
  UAgendamento in '..\Forms\UAgendamento.pas' {frmAgendamento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TfrmDados, frmDados);
  if frmDados.Conexao.fnc_conectar_banco_dados then
    begin
       frmLogin := TfrmLogin.Create(nil);
       frmLogin.ShowModal;

       frmLogin.Hide;

       frmLogin.Free;

       Application.Run;
    end else
    begin
      fnc_criar_mensagem('CONEXÃO', 'ERRO AO CONECTAR COM BANCO DE DADOS.',
                         'Não foi possível conectar ao Banco de Dados, possível causa: '+ #13
                         + frmDados.Conexao.MsgErro, ExtractFilePath(Application.ExeName) +'\icones\erro.png','OK');
      Application.CreateForm(TfrmConfiguraServidor, frmConfiguraServidor);
      frmConfiguraServidor.ShowModal;
    end;

end.
