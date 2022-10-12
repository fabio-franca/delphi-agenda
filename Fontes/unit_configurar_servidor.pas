unit unit_configurar_servidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.StdCtrls;

type
  Tform_configurar_servidor = class(TForm)
    Shape1: TShape;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    LinkLabel1: TLinkLabel;
    LinkLabel2: TLinkLabel;
    Panel5: TPanel;
    btn_confirmar: TSpeedButton;
    Panel6: TPanel;
    btn_cancelar: TSpeedButton;
    LinkLabel3: TLinkLabel;
    LinkLabel4: TLinkLabel;
    Shape2: TShape;
    Shape3: TShape;
    ed_caminho: TEdit;
    ed_nome_banco: TEdit;
    ed_login: TEdit;
    ed_senha: TEdit;
    ed_porta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ed_nome_banco_atual: TEdit;
    ed_caminho_atual: TEdit;
    ed_login_atual: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    ed_senha_atual: TEdit;
    Label10: TLabel;
    ed_porta_atual: TEdit;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function ValidarObrigatoriedade:Boolean;
  public
    { Public declarations }
  end;

var
  form_configurar_servidor: Tform_configurar_servidor;

implementation

{$R *.dfm}

uses unit_dados, classe_conexao, unit_funcoes;

procedure Tform_configurar_servidor.btn_confirmarClick(Sender: TObject);
begin
  if (ValidarObrigatoriedade = True) Then
  begin

    form_dados.Conexao.Servidor := ed_caminho.Text;
    form_dados.Conexao.Base     := ed_nome_banco.Text;
    form_dados.Conexao.Login    := ed_login.Text;
    form_dados.Conexao.Senha    := ed_senha.Text;
    form_dados.Conexao.Porta    := ed_porta.Text;
    form_dados.Conexao.pcrGravarArquivoINI;

    if form_dados.Conexao.fn_conexao_banco then
    begin
      fn_criar_mensagem('CONEXÃO',
                        'Banco conectado com sucesso!',
                        ' O sistema será reiniciado',
                        ExtractFilePath(Application.ExeName) + '\Arquivos\icone-confirmacao.png'
                        ,'OK');
      Application.Terminate;
    end
    else
    begin
      fn_criar_mensagem('CONEXÃO',
                      'Erro ao conectar ao banco de dados',
                      '',
                      ExtractFilePath(Application.ExeName) + '\Arquivos\icone_atencao.png'
                      ,'OK');
      Application.Terminate;
    end;
  end;
end;

procedure Tform_configurar_servidor.FormShow(Sender: TObject);
begin
  if form_dados.Conexao.fnLerArquivoINI then
  begin
    ed_caminho_atual.Text    := form_dados.Conexao.Servidor;
    ed_nome_banco_atual.Text := form_dados.Conexao.Base;
    ed_login_atual.Text      := form_dados.Conexao.Login;
    ed_senha_atual.Text      := form_dados.Conexao.Senha;
    ed_porta_atual.Text      := form_dados.Conexao.Porta;
  end;
end;

procedure Tform_configurar_servidor.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

function Tform_configurar_servidor.ValidarObrigatoriedade:Boolean;
begin
  Result := False;
  if (ed_caminho.Text = '') then
  begin
    Showmessage('Caminho do Banco é obrigatório.');
    ed_caminho.SetFocus;
    Exit;
  end;

  if (ed_nome_banco.Text = '') then
  begin
    Showmessage('Nome do Banco é obrigatório.');
    ed_nome_banco.SetFocus;
    Exit;
  end;

  if (ed_login.Text = '') then
  begin
    Showmessage('Login é obrigatório.');
    ed_login.SetFocus;
    Exit;
  end;

  if (ed_senha.Text = '') then
  begin
    Showmessage('Senha é obrigatória.');
    ed_senha.SetFocus;
    Exit;
  end;

  if (ed_porta.Text = '') then
  begin
    Showmessage('Porta é obrigatória.');
    ed_porta.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.
