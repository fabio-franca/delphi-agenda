unit unit_agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  Tform_agendamento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cb_profissional: TComboBox;
    btn_cad_prof: TSpeedButton;
    Shape1: TShape;
    Label2: TLabel;
    mkDia: TMaskEdit;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    ed_cliente: TEdit;
    Shape2: TShape;
    btn_pesq_clie: TSpeedButton;
    mkTelefone: TMaskEdit;
    mkCelular: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    ed_observacao: TEdit;
    Label6: TLabel;
    Panel5: TPanel;
    btn_confirmar: TSpeedButton;
    Panel6: TPanel;
    btn_cancelar: TSpeedButton;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cad_profClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_agendamento: Tform_agendamento;

implementation

{$R *.dfm}

uses unit_Principal, unit_profissionais;


procedure Tform_agendamento.btn_cad_profClick(Sender: TObject);
begin
  try
    form_profissionais := Tform_profissionais.Create(Self);
    form_profissionais.ShowModal;
  finally
    form_profissionais.Free;
  end;
end;

procedure Tform_agendamento.btn_cancelarClick(Sender: TObject);
begin
  Close;
  form_principal.pnl_bloqueia.Enabled := True;
end;

procedure Tform_agendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
