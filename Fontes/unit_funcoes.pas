unit unit_funcoes;

interface
  function fn_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String): Boolean;
  function Criptografia(Senha, Chave: string): string;

implementation

uses unit_mensagens;

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

end.
