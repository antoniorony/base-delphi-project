unit Granjastoq.Gestao.Login.View;

interface

uses
  {Delphi}
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,

  {Projeto}
  Granjastoq.View.Padrao,
  Granjastoq.Controller.Login;

type
  TGestaoLoginView = class(TViewPadrao)
    dsUsuario: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure SearchBox1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure CarregarListaDeUsuariosNoGrid;
    procedure FiltrarTabelaPorCampo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GestaoLoginView: TGestaoLoginView;

implementation

uses
  Granjastoq.View.Images,
  System.Generics.Collections,
  Granjastoq.Model.Login, FireDAC.Comp.Client;

{$R *.dfm}

procedure TGestaoLoginView.CarregarListaDeUsuariosNoGrid();
var
  lDataSource: TDataSource;
  lControlleLogin: TControllerLogin;
  lDataSet: TFDMemTable;
begin
  lControlleLogin := TControllerLogin.Create(nil);
  lDataSource := TDataSource.Create(nil);
  lDataSet := TFDMemTable.Create(nil);
  try
    lControlleLogin.ListaDeLogins := TList<TLogin>.Create;
    try
      lDataSet := TFDMemTable(lControlleLogin.BuscarUsuarios());
      dsUsuario.DataSet := lDataSet;
      dsUsuario.DataSet.Open;
      grdBase.DataSource := dsUsuario;
    finally
      lControlleLogin.Free;
    end;

  finally
    if Assigned(lDataSource) then
      lDataSource.Free;
    if Assigned(lControlleLogin) then
      lControlleLogin.Free;
    if Assigned(lDataSet) then
      lDataSet.Free;
  end;

end;

procedure TGestaoLoginView.FormShow(Sender: TObject);
begin
  inherited;
  CarregarListaDeUsuariosNoGrid();
end;

procedure TGestaoLoginView.SearchBox1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  FiltrarTabelaPorCampo();
end;

procedure TGestaoLoginView.FiltrarTabelaPorCampo();
begin
  grdBase.DataSource.DataSet.Filtered := False;
  grdBase.DataSource.DataSet.Filter := ' ' + cbbTipoDeBusca.Text + ' Like ' +
    QuotedStr('%' + SearchBox1.Text + '%');
  grdBase.DataSource.DataSet.Filtered := True;
end;

end.
