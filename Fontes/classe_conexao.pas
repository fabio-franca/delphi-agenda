unit classe_conexao;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, System.IniFiles, Vcl.Forms;

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
  FireDAC.Stan.Intf, unit_funcoes;

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

end.
