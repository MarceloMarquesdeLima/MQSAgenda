unit UFuncoes;

interface

uses
  Vcl.Forms, System.SysUtils, UMensagem, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Mask,
  MQSDBEdit, MQSMaskEdit;

  function fnc_criar_mensagem ( TituloJanela, TituloMSG, MSG , CaminhoIcone, Tipo : String) : boolean;
  procedure prcValidarCamposObrigatorios ( Form : TForm );
  function fncRemoveCaractesres(AsString: String) : String;
  function fncCriptografica (Senha, Chave: String) : String;

implementation

function fncRemoveCaractesres(AsString: String) : String;
var
  I : Integer;
  Limpos : String;

  begin
    Limpos := '';
    for I := 1 to Length(AsString) do
    begin
      if Pos ( Copy(AsString, I, 1), '"!%$#@&�*().,;:/<>[]{}=+-_\|')  = 0 then
        Limpos := Limpos + Copy(AsString, i, 1);
    end;
    Result := Limpos;
  end;

function fnc_criar_mensagem ( TituloJanela, TituloMSG, MSG , CaminhoIcone, Tipo : String) : boolean;
begin
  Result := False;
  frmMensagem := TfrmMensagem.Create( nil );
  frmMensagem.sTituloJanela := TituloJanela;
  frmMensagem.sTituloMSG    := TituloMSG;
  frmMensagem.sMSG          := MSG;
  frmMensagem.sCaminhoIcone := CaminhoIcone;
  frmMensagem.sTipo         := Tipo;

  frmMensagem.ShowModal;
  Result := frmMensagem.bRespostaMSG;
end;

procedure prcValidarCamposObrigatorios ( Form : TForm );
var i :Integer;
begin
  for I := 0 to Form.ComponentCount - 1 do
  begin
    if Form.Components[i].Tag = 5 then
    begin
      if Form.Components[i] is TDBEdit then
        if(( Form.Components[i] as TDBEdit).Hint <> '') and
              (( Form.Components[i] as TDBEdit).Text = '') Then
        begin
           fnc_criar_mensagem('AVISO DE DADDOS OBRIGAT�RIOS', 'Verificar campo obrigat�o n�o preenchido!',
                              'O CAMPO ' + (Form.Components[i] as TDBEdit).Hint,
                              ExtractFilePath(Application.ExeName) +'\icones\aviso.png','AVISO');
           if ((Form.Components[i] as TDBEdit).Enabled) then
              ( Form.Components[i] as TDBEdit).SetFocus;
               abort;
       end;

      if Form.Components[i] is TMQSDBEdit then
        if(( Form.Components[i] as TMQSDBEdit).Hint <> '') and
              (( Form.Components[i] as TMQSDBEdit).Text = '') Then
        begin
          fnc_criar_mensagem('AVISO DE DADDOS OBRIGAT�RIOS', 'Verificar campo obrigat�o n�o preenchido!',
                              'O CAMPO ' + (Form.Components[i] as TMQSDBEdit).Hint,
                              ExtractFilePath(Application.ExeName) +'\icones\aviso.png','AVISO');
           if ((Form.Components[i] as TMQSDBEdit).Enabled) then
              ( Form.Components[i] as TMQSDBEdit).SetFocus;
               abort;
        end;


      if Form.Components[i] is TEdit then
        if(( Form.Components[i] as TEdit).Hint <> '') and
              (( Form.Components[i] as TEdit).Text = '') Then
        begin
          fnc_criar_mensagem('AVISO DE DADDOS OBRIGAT�RIOS', 'Verificar campo obrigat�o n�o preenchido!',
                              'O CAMPO ' + (Form.Components[i] as TEdit).Hint,
                              ExtractFilePath(Application.ExeName) +'\icones\aviso.png','AVISO');
           if ((Form.Components[i] as TEdit).Enabled) then
              ( Form.Components[i] as TEdit).SetFocus;
               abort;
        end;


      if Form.Components[i] is TMaskedit then
        if(( Form.Components[i] as TMaskedit).Hint <> '') and
            (fncRemoveCaractesres(( Form.Components[i] as TMaskedit).Text) = '') Then
         begin
           fnc_criar_mensagem('AVISO DE DADDOS OBRIGAT�RIOS', 'Verificar campo obrigat�o n�o preenchido!',
                              'O CAMPO ' + (Form.Components[i] as TMaskedit).Hint,
                              ExtractFilePath(Application.ExeName) +'\icones\aviso.png','AVISO');
           if ((Form.Components[i] as TMaskedit).Enabled) then
              ( Form.Components[i] as TMaskedit).SetFocus;
               abort;
         end;

      if Form.Components[i] is TMQSMaskEdit then
        if(( Form.Components[i] as TMQSMaskEdit).Hint <> '') and
            (fncRemoveCaractesres(( Form.Components[i] as TMQSMaskEdit).Text) = '') Then
         begin
           fnc_criar_mensagem('AVISO DE DADDOS OBRIGAT�RIOS', 'Verificar campo obrigat�o n�o preenchido!',
                              'O CAMPO ' + (Form.Components[i] as TMQSMaskEdit).Hint,
                              ExtractFilePath(Application.ExeName) +'\icones\aviso.png','AVISO');
           if ((Form.Components[i] as TMQSMaskEdit).Enabled) then
              ( Form.Components[i] as TMQSMaskEdit).SetFocus;
               abort;
         end;

      if Form.Components[i] is TComboBox then
        if(( Form.Components[i] as TComboBox).Hint <> '') and
            (( Form.Components[i] as TComboBox).Text = '') Then
         begin
           fnc_criar_mensagem('AVISO DE DADDOS OBRIGAT�RIOS', 'Verificar campo obrigat�o n�o preenchido!',
                              'O CAMPO ' + (Form.Components[i] as TComboBox).Hint,
                              ExtractFilePath(Application.ExeName) +'\icones\aviso.png','AVISO');
           if ((Form.Components[i] as TComboBox).Enabled) then
              ( Form.Components[i] as TComboBox).SetFocus;
               abort;
              end;
         end;
    end;
  end;
  function fncCriptografica (Senha, Chave: String) : String;
  var
    x,y : Integer;
    NovaSenha : String;
  begin
    for x := 1 to length ( Senha ) do
      begin
        NovaSenha := '';
        for y := 1 to length ( Senha ) do
          begin
            NovaSenha := NovaSenha + chr ((Ord (Chave[x]) xor Ord (Senha[y])));
          end;
          Senha := NovaSenha;
      end;
      Result := Senha;
  end;
end.
