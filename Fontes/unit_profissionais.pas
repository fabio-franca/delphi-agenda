unit unit_profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, unit_dados,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  unit_funcoes;

type
  Tform_profissionais = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ed_profissional: TEdit;
    mkCelular: TMaskEdit;
    ed_especialidade: TEdit;
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
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_confirmarClick(Sender: TObject);
  private
    { Private declarations }
    function ValidarObrigatoriedade:Boolean;
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

procedure Tform_profissionais.btn_confirmarClick(Sender: TObject);
var
  Erro : String;
begin
  if ValidarObrigatoriedade then
  begin
    form_dados.Profissional.ds_profissional  := ed_profissional.Text;
    form_dados.Profissional.ds_especialidade := ed_especialidade.Text;
    form_dados.Profissional.nr_contato       := mkCelular.Text;

    if form_dados.Profissional.fn_inserir_alterar('INSERIR', Erro) then
    begin
      fn_criar_mensagem('CADASTRO',
                        'CADASTRAR NOVO PROFISSIONAL!',
                        'Profissional inserido com sucesso.',
                        ExtractFilePath(Application.ExeName) + '\Arquivos\icone-sucesso-2.png'
                        ,'OK');
    end
    else
    begin
      fn_criar_mensagem('CADASTRO',
                        'ERRO AO CADASTRAR NOVO PROFISSIONAL!',
                        'N?o foi poss?vel cadastrar o profissional.',
                        ExtractFilePath(Application.ExeName) + '\Arquivos\icone_atencao.png'
                        ,'OK');
    end;
  end;

end;

procedure Tform_profissionais.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( NOT ( DBGrid1.DataSource.DataSet.IsEmpty) ) and (key = VK_DELETE) then
    form_dados.Profissional.prc_deleta(DBGrid1.DataSource.DataSet.FieldByName('id_profissionais').AsInteger );

end;

procedure Tform_profissionais.FormShow(Sender: TObject);
begin
  ds_profissionais.DataSet := form_dados.profissional.fn_consulta('');
end;

function Tform_profissionais.ValidarObrigatoriedade: Boolean;
begin
  Result := False;

  if (ed_profissional.Text = '') then
  begin
    Showmessage('Profissional ? obrigat?rio.');
    ed_profissional.SetFocus;
    Exit;
  end;

  if (ed_especialidade.Text = '') then
  begin
    Showmessage('Especialidade ? obrigat?rio.');
    ed_especialidade.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.
