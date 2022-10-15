unit unit_agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons, classe_profissionais, Data.DB, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tform_agendamento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
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
    ds_profissionais: TDataSource;
    cb_profissional: TDBLookupComboBox;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cad_profClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_agendamento: Tform_agendamento;

implementation

{$R *.dfm}

uses unit_Principal, unit_profissionais, unit_dados;


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
  form_dados.Profissional.Destroy;
  Action := caFree;
end;

procedure Tform_agendamento.FormCreate(Sender: TObject);
begin
  form_dados.Profissional := TProfissionais.Create(form_dados.FDConnection);
end;

procedure Tform_agendamento.FormShow(Sender: TObject);
begin
  ds_profissionais.DataSet := form_dados.profissional.fn_consulta('');
end;

end.
