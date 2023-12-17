﻿unit Granjastoq.Gestao.Login.View;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  lDataSource: TDataSource;
  lControlleLogin: TControllerLogin;

implementation
uses
  Granjastoq.View.Images;

{$R *.dfm}

procedure TGestaoLoginView.CarregarListaDeUsuariosNoGrid();
begin
  lControlleLogin := TControllerLogin.Create();
  lDataSource := TDataSource.Create(nil);

  dsUsuario := lControlleLogin.BuscarUsuarios();
  dsUsuario.DataSet.Open;
  grdBase.DataSource := dsUsuario;

end;

procedure TGestaoLoginView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if Assigned(lDataSource) then
    lDataSource.Free;
  if Assigned(lControlleLogin) then
    lControlleLogin.Free;
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
  grdBase.DataSource.DataSet.Filter := ' ' + cbbTipoDeBusca.Text + ' Like ' + QuotedStr('%' + SearchBox1.Text + '%');
  grdBase.DataSource.DataSet.Filtered := True;
end;
end.
