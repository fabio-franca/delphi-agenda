unit classe_profissionais;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Vcl.Forms;

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

      function fn_inserir_alterar (TipoOperacao: String; out Erro: String): Boolean;
      procedure prc_deleta (id_chave: Integer);
      function fn_consulta (texto : String): TFDQuery;
  end;

var
  Query : TFDQuery;

implementation

{ TProfissionais }

uses unit_funcoes, unit_dados;

constructor TProfissionais.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;

  Query := TFDQuery.Create(nil);
  Query.Connection := FConexao;
end;

destructor TProfissionais.Destroy;
begin
  Query.Destroy;
  inherited;
end;

function TProfissionais.fn_consulta(texto: String): TFDQuery;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT id_profissionais, ds_profissional, ds_especialidade, nr_contato ');
    Query.SQL.Add('  FROM profissionais                                                 ');
    Query.SQL.Add(' WHERE ds_profissional                                               ');
    Query.SQL.Add('  LIKE :parametro_texto                                              ');
    Query.ParamByName('parametro_texto').AsString := '%' + texto + '%';
    Query.Open();
  finally
    Result := Query;
  end;
end;

function TProfissionais.fn_inserir_alterar(TipoOperacao: String;
  out Erro: String): Boolean;
var
  Query: TFDQuery;
begin
   try

     try
       FConexao.Connected := False;
       FConexao.Connected := True;

       Query := TFDQuery.Create(nil);
       Query.Connection := FConexao;

       Query.Close;
       Query.SQL.Clear;

       if TipoOperacao = 'INSERIR' then
       begin
         Query.SQL.Add('INSERT INTO profissionais (   ');
         Query.SQL.Add('            id_profissionais,  ');
         Query.SQL.Add('            ds_profissional,  ');
         Query.SQL.Add('            ds_especialidade, ');
         Query.SQL.Add('            nr_contato)       ');
         Query.SQL.Add('VALUES ( :p_id_profissional,  ');
         Query.SQL.Add('         :p_ds_profissional,  ');
         Query.SQL.Add('         :p_ds_especialidade, ');
         Query.SQL.Add('         :p_nr_contato )      ');

         Query.ParamByName('p_id_profissional').AsInteger :=
            fn_proximo_codigo('profissionais', 'id_profissionais');

       end
       else
       begin
         Query.SQL.Add('UPDATE profissionais                           ');
         Query.SQL.Add('   SET ds_profissional  = :p_ds_profissional , ');
         Query.SQL.Add('       ds_especialidade = :p_ds_especialidade, ');
         Query.SQL.Add('       nr_contato       = :p_nr_contato        ');
         Query.SQL.Add(' WHERE id_profissional  = :p_id_profissional   ');

         Query.ParamByName('p_id_profissionais').AsInteger := FId_Profissional;
       end;

       Query.ParamByName('p_ds_profissional').AsString    :=  Fds_profissional;
       Query.ParamByName('p_ds_especialidade').AsString   :=  Fds_especialidade;
       Query.ParamByName('p_nr_contato').AsString         :=  Fnr_contato;
       Query.ExecSQL;

       fn_consulta('');

       Result := True;

     except
      on E: Exception do
      begin
        Erro := E.Message;
        Result := False;
      end;
     end;
   finally
     Query.Destroy;
   end;
end;

procedure TProfissionais.prc_deleta(id_chave: Integer);
begin
  if fn_criar_mensagem ('Confirma��o', 'Excluir Dados',
                        'Deseja realizar a exclus�o?',
                        ExtractFilePath(Application.ExeName)+ '\Arquivos\icone_atencao.png',
                        'CONFIRMA') then
  begin
    FConexao.Connected := False; //Feito para garantir que a conex�o esteja OK
    FConexao.Connected := True;

    FConexao.ExecSQL('DELETE FROM profissionais WHERE id_profissionais = :id_chave',
                      [id_chave]);

    fn_consulta('');
  end;

end;

end.
