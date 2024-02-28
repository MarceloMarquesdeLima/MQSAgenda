unit UClasseConexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Intf, System.SysUtils,System.IniFiles,
  Vcl.Forms, UFuncoes;

type
  Tconexao = class
    private
    FServidor: String;
    FMsgErro: String;
    FSenha: String;
    FBase: String;
    FLogin: String;
    FPorta: String;
    FConexao: TFDConnection;

    public

      constructor Create ( NomeConexao : TFDConnection );
      destructor Destroy; override;

      function fnc_conectar_banco_dados : boolean;
      procedure prcGravarArquivoINI;
      function fncLerArquivoINI: boolean;

      property Conexao  : TFDConnection Read  FConexao Write FConexao;
      property Servidor : String  Read FServidor Write FServidor;
      property Base : String Read FBase Write FBase;
      property Login : String Read FLogin Write FLogin;
      property Senha : String Read FSenha Write FSenha;
      property Porta : String Read FPorta Write FPorta;
      property MsgErro : String Read FMsgErro Write FMsgErro;
  end;

implementation

{ Tconexao }

constructor Tconexao.Create(NomeConexao: TFDConnection);
begin
   FConexao := NomeConexao;
end;

destructor Tconexao.Destroy;
begin
  FConexao.Connected := False;
  inherited;
end;

function Tconexao.fnc_conectar_banco_dados: boolean;
begin
   Result := True;
   FConexao.Params.Clear;

   if not fncLerArquivoINI then
   begin
     Result   := False;
     FMsgErro := 'O arquivo de configuração não foi encontrado!';
   end else
   begin
     FConexao.Params.Add('Server=' + FServidor);
     FConexao.Params.Add('user_name=' + FLogin);
     FConexao.Params.Add('password=' + FSenha);
     FConexao.Params.Add('port=' + FPorta);
     FConexao.Params.Add('database=' + FBase);
     FConexao.Params.Add('DriverId=' + 'MySQL');

     //FConexao.Connected := True;

     try
       FConexao.Connected := True;
     except
       on e:Exception do
       begin
         FMsgErro := e.Message;
         Result   := False;
       end;
      end;
   end;
end;

procedure Tconexao.prcGravarArquivoINI;
var
  IniFile: string;
  Ini    : TIniFile;
begin
   IniFile := ChangeFileExt(Application.ExeName, '.ini');
   Ini     := TIniFile.Create( Inifile);

   try
     Ini.WriteString('Configuracao', 'Servidor',FServidor);
     Ini.WriteString('Configuracao','Base',FBase);
     Ini.WriteString('Configuracao','Porta',FPorta);
     Ini.WriteString('Acesso','Login',FLogin);
     Ini.WriteString('Acesso','Senha',
     FSenha);
     //Ini.WriteString('Acesso','Senha',fncCriptografica(FSenha, 'MQSDESENVOLVIMENTO'));
   finally
     Ini.Free;
   end;
end;

function Tconexao.fncLerArquivoINI : boolean;
var
  IniFile: string;
  Ini    : TIniFile;
begin
   IniFile := ChangeFileExt(Application.ExeName, '.ini');
   Ini     := TIniFile.Create( Inifile);

   if FileExists ( IniFile ) then
    begin
        try
         FServidor := Ini.ReadString('Configuracao', 'Servidor', '');
         FBase := Ini.ReadString('Configuracao','Base', '');
         FPorta := Ini.ReadString('Configuracao','Porta', '');
         FLogin := Ini.ReadString('Acesso','Login', '');

         FSenha := Ini.ReadString('Acesso','Senha', '');
        // FSenha := fncCriptografica(FSenha, 'MQSDESENVOLVIMENTO');
      finally
         Result := True;
         Ini.Free;
      end;
    end
   else
   Begin
      Result := false;

   End;

end;

end.
