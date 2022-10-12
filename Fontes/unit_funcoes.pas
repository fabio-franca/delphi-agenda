unit unit_funcoes;

interface
  function fn_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String): Boolean;

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

end.
