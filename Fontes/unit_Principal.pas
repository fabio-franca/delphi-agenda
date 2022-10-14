unit unit_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Imaging.jpeg;

type
  Tform_Principal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Shape2: TShape;
    Label3: TLabel;
    Panel6: TPanel;
    Image5: TImage;
    Shape3: TShape;
    pnl_formulario: TPanel;
    pnl_bloqueia: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    btn_agendamento: TSpeedButton;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    Panel5: TPanel;
    SpeedButton4: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure btn_agendamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EsmaecerFormPrincipal(Liga : String);
  end;

var
  form_Principal: Tform_Principal;

implementation

{$R *.dfm}

uses unit_funcoes, unit_configurar_servidor, unit_agendamento;

procedure Tform_Principal.btn_agendamentoClick(Sender: TObject);
begin
    form_agendamento := Tform_agendamento.Create(Self);
    form_agendamento.Parent := pnl_formulario;
    form_agendamento.Show;
    form_principal.pnl_bloqueia.Enabled := False;
end;

procedure Tform_Principal.Button1Click(Sender: TObject);
begin
  fn_criar_mensagem('Confirmação',
                    'Tem certeza que deseja continuar?',
                    'Deseja inserir esses dados?',
                    ExtractFilePath(Application.ExeName) + '\Arquivos\icone_atencao.png'
                    ,'CONFIRMA');
end;

procedure Tform_Principal.EsmaecerFormPrincipal(Liga : String);
begin
  if(Liga = 'S') Then
  begin
    Self.AlphaBlend := True;
    Self.AlphaBlendValue := 50;
  end
  else
  begin
    Self.AlphaBlend := False;
  end;
end;

procedure Tform_Principal.FormCreate(Sender: TObject);
begin
  EsmaecerFormPrincipal('S');
end;

procedure Tform_Principal.Image5Click(Sender: TObject);
begin
  try
    form_configurar_servidor := Tform_configurar_servidor.Create(Self);
    form_configurar_servidor.ShowModal;
  finally
    form_configurar_servidor.Destroy;
  end;
end;

procedure Tform_Principal.SpeedButton1Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure Tform_Principal.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
