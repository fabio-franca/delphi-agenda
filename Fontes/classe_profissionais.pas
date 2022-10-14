unit classe_profissionais;

interface

uses
  FireDAC.Comp.Client;

Type
  TProfissionais = class
    private
      FConexao         : TFdConnection;
      FId_Profissional : Integer;
      Fds_profissional : String;
      Fds_especialidade: String;
      Fnr_contato      : String;
    public
      property Conexao         : TFdConnection read  FConexao           write FConexao;
      property Id_Profissional : Integer       read  FId_Profissional   write FId_Profissional;
      property ds_profissional : String        read  Fds_profissional   write Fds_profissional;
      property ds_especialidade : String       read  Fds_especialidade  write Fds_especialidade;
      property nr_contato : String             read  Fnr_contato        write Fnr_contato;

      constructor Create(Conexao : TFdConnection);
      destructor Destroy; Override;
  end;

implementation

{ TProfissionais }

constructor TProfissionais.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao
end;

destructor TProfissionais.Destroy;
begin

  inherited;
end;

end.
