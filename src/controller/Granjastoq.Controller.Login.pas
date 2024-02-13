unit Granjastoq.Controller.Login;

interface

uses
  Data.DB,
  System.Classes,
  Datasnap.DBClient,
  Granjastoq.Model.Login,
  System.Generics.Collections;

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
      procedure BuscarUsuarios(pTabelaLoginTemporaria: TClientDataSet);
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

procedure TControllerLogin.BuscarUsuarios(pTabelaLoginTemporaria: TClientDataSet);
var
  lModelLogin: TModelLogin;
  lListaDeLogins: TList<TLogin>;
  lLogin: TLogin;
begin
  lModelLogin := TModelLogin.Create;
  lListaDeLogins := TList<TLogin>.Create;
  lLogin := TLogin.Create;

  try
    lModelLogin.BuscarInformacoesDoUsuario(lListaDeLogins, lLogin);

    var I: Integer;
    for I := 0 to lListaDeLogins.Count-1 do
      begin
        pTabelaLoginTemporaria.Edit;
        pTabelaLoginTemporaria.FieldByName('id').AsInteger := lListaDeLogins.Items[I].Id;
        pTabelaLoginTemporaria.FieldByName('usuario').AsString := lListaDeLogins.Items[I].Usuario;
        pTabelaLoginTemporaria.FieldByName('nomedousuario').AsString := lListaDeLogins.Items[I].NomeDoUsuario;
        pTabelaLoginTemporaria.FieldByName('senha').AsString := lListaDeLogins.Items[I].SenhaDoUsuario;
        pTabelaLoginTemporaria.Post;
      end;

  finally
    lModelLogin.Free;
    lListaDeLogins.Free;
    lLogin.Free;
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
