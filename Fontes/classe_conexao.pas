unit classe_conexao;

interface

uses
  FireDAC.Comp.Client, System.IniFiles, Vcl.Forms;

type
  TConexao = class
    private
    FServidor: String;
    FMsgErro: String;
    FSenha: String;
    FBase: String;
    FLogin: String;
    FPorta: String;
    FConexao: TFDConnection;

    public
      constructor Create ( NomeConexao: TFDConnection);
      Destructor Destroy; override;

      function fn_conexao_banco: Boolean;
      procedure pcrGravarArquivoINI;
      function fnLerArquivoINI: Boolean;
      property Conexao   : TFDConnection Read FConexao Write FConexao;
      property Servidor  : String Read FServidor Write FServidor;
      property Base      : String Read FBase Write FBase;
      property Login     : String Read FLogin Write FLogin;
      property Senha     : String Read FSenha Write FSenha;
      property Porta     : String Read FPorta Write FPorta;
      property MsgErro   : String Read FMsgErro Write FMsgErro;
  end;
implementation

uses
  FireDAC.Stan.Intf, unit_funcoes, System.SysUtils;

{ TConexao }

constructor TConexao.Create(NomeConexao: TFDConnection);
begin
  FConexao := NomeConexao;
end;

destructor TConexao.Destroy;
begin
  FConexao.Connected := False;
  inherited;
end;

function TConexao.fn_conexao_banco: Boolean;
begin
  Result := True;

  FConexao.Params.Clear;

  if not fnLerArquivoINI then
  begin
    Result   := False;
    FMsgErro := 'O Arquivo de Configura��o n�o foi encontrado.';
  end
  else
  begin
    FConexao.Params.Add('Server='+ FServidor);
    FConexao.Params.Add('user_name='+ FLogin);
    FConexao.Params.Add('password='+ FSenha);
    FConexao.Params.Add('port='+ FPorta);
    FConexao.Params.Add('Database='+ FBase);
    FConexao.Params.Add('DriverID=' + 'MySQL');

    try
      FConexao.Connected := True;
    Except
      on e:Exception do
      begin
        FMsgErro := e.Message;
        Result   := False;
      end;
    end;
  end;
end;

procedure TConexao.pcrGravarArquivoINI;
var
  IniFile: String;
  Ini    : TiniFile;
begin
  IniFile := ChangeFileExt(Application.Exename, '.ini'); //Seta o caminho do arquivo .ini
  Ini     := TIniFile.Create(IniFile);                  //Cria o arquivo

  try
    ini.WriteString('Configuracao', 'Servidor', FServidor); //Escreve uma string dentro do arquivo
    ini.WriteString('Configuracao', 'Base', FBase);
    ini.WriteString('Configuracao', 'Porta', FPorta);
    ini.WriteString('Acesso', 'Login', FLogin);
    ini.WriteString('Acesso', 'Senha', Criptografia(FSenha, '1devsecnpi'));
  finally
    Ini.Free;
  end;
end;

function TConexao.fnLerArquivoINI: Boolean;
var
  IniFile: String;
  Ini    : TiniFile;
begin

  IniFile := ChangeFileExt(Application.Exename, '.ini'); //Seta o caminho do arquivo .ini
  Ini     := TIniFile.Create(IniFile);                  //Cria o arquivo

  if not fileexists (IniFile) then
    Result := False
  else
  begin
    try
      FServidor := ini.ReadString('Configuracao', 'Servidor', ''); //Escreve uma string dentro do arquivo
      FBase     := ini.ReadString('Configuracao', 'Base', '');
      FPorta    := ini.ReadString('Configuracao', 'Porta', '');
      FLogin    := ini.ReadString('Acesso', 'Login', '');
      FSenha    := ini.ReadString('Acesso', 'Senha', '');
      FSenha    := Criptografia(FSenha, '1devsecnpi');    //Ao rodar novamente a fun��o criptografia, descriptografa a senha
    finally
      Result := True;
      Ini.Free;
    end;
  end;

end;

end.
