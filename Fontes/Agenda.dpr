program Agenda;

uses
  Vcl.Forms,
  unit_Principal in 'unit_Principal.pas' {form_Principal},
  unit_dados in 'unit_dados.pas' {form_Dados: TDataModule},
  unit_login in 'unit_login.pas' {form_login},
  unit_configurar_servidor in 'unit_configurar_servidor.pas' {form_configurar_servidor},
  unit_mensagens in 'unit_mensagens.pas' {form_mensagens},
  unit_funcoes in 'unit_funcoes.pas',
  classe_conexao in 'classe_conexao.pas',
  System.SysUtils,
  unit_agendamento in 'unit_agendamento.pas' {form_agendamento},
  unit_profissionais in 'unit_profissionais.pas' {form_profissionais},
  classe_profissionais in 'classe_profissionais.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tform_Dados, form_Dados);
  Application.CreateForm(Tform_Principal, form_Principal);

  If form_dados.Conexao.fn_conexao_banco then
  begin
      if (form_login = nil) then
      begin
        Application.CreateForm(Tform_login, form_login);
      end;
      form_Principal.Show;
      form_Principal.Enabled := False;
      form_login.ShowModal;

    //form_login := Tform_login.Create(nil);
    //form_login.ShowModal;
    //form_login.Hide;    //Esconde o form de login
    //form_login.Destroy;  //Free ainda guardava o form aberto. ? melhor destruir.
    //form_Principal.Focused;   //Focused exibe o form, ao inv?s de ter que clicar na barra de tarefas

    Application.Run;
  end
  else
  begin
    fn_criar_mensagem('CONEX?O',
                    'ERRO AO CONECTAR',
                    'N?o foi poss?vel conectar ao banco de dados. ' + form_dados.Conexao.MsgErro,
                    ExtractFilePath(Application.ExeName) + '\Arquivos\icone_atencao.png'
                    ,'OK');

    Application.CreateForm(Tform_configurar_servidor, form_configurar_servidor);
    form_configurar_servidor.ShowModal;
  end;
end.
