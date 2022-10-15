unit unit_profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, unit_dados,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tform_profissionais = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ed_profissional: TEdit;
    mkCelular: TMaskEdit;
    ed_observacao: TEdit;
    Panel5: TPanel;
    btn_confirmar: TSpeedButton;
    Panel6: TPanel;
    btn_cancelar: TSpeedButton;
    Label2: TLabel;
    Shape1: TShape;
    DBGrid1: TDBGrid;
    ds_profissionais: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_profissionais: Tform_profissionais;

implementation

{$R *.dfm}


procedure Tform_profissionais.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_profissionais.FormShow(Sender: TObject);
begin
  ds_profissionais.DataSet := form_dados.profissional.fn_consulta('');
end;

end.
