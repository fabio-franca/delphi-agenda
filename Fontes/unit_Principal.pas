unit unit_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tform_Principal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Principal: Tform_Principal;

implementation

{$R *.dfm}

uses unit_funcoes;

procedure Tform_Principal.Button1Click(Sender: TObject);
begin
  fn_criar_mensagem('Confirmação',
                    'Tem certeza que deseja continuar?',
                    'Deseja inserir esses dados?',
                    ExtractFilePath(Application.ExeName) + '\Arquivos\icone_atencao.png'
                    ,'CONFIRMA');
end;

end.
