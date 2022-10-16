unit unit_funcoes;

interface

uses
  FireDAC.Comp.Client;
  function fn_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String): Boolean;
  function Criptografia(Senha, Chave: string): string;
  function fn_proximo_codigo (Tabela, Campo : String): Integer;
implementation

uses unit_mensagens, unit_dados;

function fn_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String): Boolean;
begin
  Result := False;

  form_mensagens                := Tform_mensagens.Create(nil);
  form_mensagens.sTituloJanela  := TituloJanela;
  form_mensagens.sTituloMSG     := TituloMSG;
  form_mensagens.sMSG           := MSG;
  form_mensagens.sCaminhoIcone  := Icone;
  form_mensagens.sTipo          := Tipo;

  form_mensagens.ShowModal;
  Result := form_mensagens.bRespostaMSG;
end;

function Criptografia(Senha, Chave: string): string;
var
  x,y : Integer;
  NovaSenha : string;
begin
  for x := 1 to Length(Chave) do
  begin
    NovaSenha := '';

    for y := 1 to Length(Senha) do
    begin
      NovaSenha := NovaSenha + chr( ( Ord(Chave[x] ) xor Ord ( Senha[y] ) ) );
    end;

    Senha := NovaSenha;
  end;

  result := Senha;
end;

function fn_proximo_codigo (Tabela, Campo : String): Integer;
var
  Query: TFDQuery;
begin
  Result := 1;

  try
    form_dados.FDConnection.Connected := False;
    form_dados.FDConnection.Connected := True;

    Query := TFDQuery.Create(nil);
    Query.Connection := form_dados.FDConnection;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELEC MAX('+ Campo +') AS CODIGO FROM ' + Tabela);
    Query.Open();

    if Query.FieldByName('CODIGO').AsString <> '' then
      Result := Query.FieldByName('CODIGO').AsInteger + 1;

  finally
    Query.Destroy;
  end;

end;

end.
