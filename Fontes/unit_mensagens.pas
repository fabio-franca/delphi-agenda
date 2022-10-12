unit unit_mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tform_mensagens = class(TForm)
    pnl_fundo: TPanel;
    shp_fundo: TShape;
    Shape1: TShape;
    lb_titulo_janela: TLabel;
    img_mensagem: TImage;
    lb_titulo: TLabel;
    lb_mensagem: TLabel;
    pnl_sim: TPanel;
    btn_sim: TSpeedButton;
    pnl_nao: TPanel;
    btn_nao: TSpeedButton;
    procedure btn_naoClick(Sender: TObject);
    procedure btn_simClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sTituloJanela, sTituloMSG, sMSG, sCaminhoIcone, sTipo: String;
    bRespostaMSG: Boolean;
  end;
var
  form_mensagens: Tform_mensagens;

implementation

{$R *.dfm}

procedure Tform_mensagens.btn_naoClick(Sender: TObject);
begin
  bRespostaMSG := False;

  Close;
end;

procedure Tform_mensagens.btn_simClick(Sender: TObject);
begin
  bRespostaMSG := True;

  Close;
end;

procedure Tform_mensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tform_mensagens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btn_simClick(Self);
  if Key = VK_ESCAPE then
    btn_naoClick(Self);
end;

procedure Tform_mensagens.FormShow(Sender: TObject);
begin
  bRespostaMSG := False;

  lb_titulo_janela.Caption := sTituloJanela;
  lb_titulo.Caption        := sTituloMSG;
  lb_mensagem.Caption      := sMSG;
  img_mensagem.Picture.LoadFromFile(sCaminhoIcone);

  If sTipo = 'OK' Then
  begin
    pnl_nao.Visible := False;
    btn_sim.Caption := 'OK(ENTER)';
  end;
end;

end.
