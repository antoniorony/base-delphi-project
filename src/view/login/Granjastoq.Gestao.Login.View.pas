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
  Granjastoq.Controller.Login, Datasnap.DBClient;

type
  TGestaoLoginView = class(TViewPadrao)
    dsUsuario: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure SearchBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FControlleLogin: TControllerLogin;
    FTabelaLoginTemporaria: TClientDataSet;
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
  Granjastoq.Model.Login,
  FireDAC.Comp.Client;

{$R *.dfm}

procedure TGestaoLoginView.CarregarListaDeUsuariosNoGrid();
begin
  FTabelaLoginTemporaria.FieldDefs.Add('id', ftInteger, 0, True);
  FTabelaLoginTemporaria.FieldDefs.Add('usuario', ftString, 150, True);
  FTabelaLoginTemporaria.FieldDefs.Add('nomedousuario', ftString, 350, True);
  FTabelaLoginTemporaria.FieldDefs.Add('senha', ftString, 250, True);

  FTabelaLoginTemporaria.CreateDataSet;
  FTabelaLoginTemporaria.Open;

  FControlleLogin.BuscarUsuarios(FTabelaLoginTemporaria);
  dsUsuario.DataSet := FTabelaLoginTemporaria;
  dsUsuario.DataSet.Open;
  grdBase.DataSource := dsUsuario;
end;

procedure TGestaoLoginView.FormCreate(Sender: TObject);
begin
  inherited;
  FControlleLogin := TControllerLogin.Create(nil);
  FTabelaLoginTemporaria := TClientDataSet.Create(nil);
end;

procedure TGestaoLoginView.FormDestroy(Sender: TObject);
begin
  inherited;
  FControlleLogin.Free;
  FTabelaLoginTemporaria.Free;
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
