unit Granjastoq.Controller.Login;

interface

uses
  Data.DB,
  System.Classes,
  Granjastoq.Model.Login, System.Generics.Collections;

type
  TControllerLogin = class

    private
      Fid: LongInt;
      FNomeDoUsuario,
      FUsuario,
      FSenhaDoUsuario: String;
      FDataSource: TDataSource;

      FLogin: TLogin;
      FListaDeLogins: TList<TLogin>;

    public
      function LogarNoSistema(): Boolean;
      function BuscarUsuarios(): TList<TLogin>;
      destructor Destroy; override;
      constructor Create(AOwner: TComponent);
      property Login: TLogin read FLogin write FLogin;
      property ListaDeLogins: TList<TLogin> read FListaDeLogins write FListaDeLogins;
      property DataSource: TDataSource read FDataSource write FDataSource;
  end;

implementation

uses
  Vcl.Dialogs,
  System.SysUtils,
  Granjastoq.Model.AllLogin;


{ TControllerLogin }

function TControllerLogin.BuscarUsuarios(): TList<TLogin>;
var
  lModelLogin: TModelLogin;
  lListaDeLogins: TList<TLogin>;
begin
  lModelLogin := TModelLogin.Create;
  try
    lListaDeLogins := lModelLogin.BuscarInformacoesDoUsuario();
    Result := lListaDeLogins;
  finally
    lModelLogin.Free;
  end;
end;

constructor TControllerLogin.Create(AOwner: TComponent);
begin
  FDataSource := TDataSource.Create(nil);
  FLogin := TLogin.Create();
end;

destructor TControllerLogin.Destroy;
begin
  if Assigned(FDataSource) then
    FDataSource.Free;

  if Assigned(FLogin) then
    FLogin.Free;

  inherited;
end;

function TControllerLogin.LogarNoSistema: Boolean;
var
  lLoginModel: TModelLogin;
  lIsLoginValido: Boolean;
begin
  lIsLoginValido := False;
  lLoginModel := TModelLogin.Create();
  try
    lIsLoginValido := lLoginModel.ValidarLogin(Login);
    Result := lIsLoginValido;
  finally
    lLoginModel.Free;
  end;

end;

{ TControllerLogin }

end.
