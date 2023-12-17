unit GranjastoqModelLogin;

interface

uses
  {FireDac}
  FireDAC.Comp.Client,

  {Projeto}
  GranjastoqControllerLogin, Data.DB;

type
  TModelLogin = class
    private
    public
      destructor Destroy; override;
      function ValidarLogin(Login: TControllerLogin): Boolean;
      procedure BuscarInformacoesDoUsuario(Login: TControllerLogin);

  end;

implementation

uses
  GranjastoqModelFactory;

var
  Conexao: TModelConexaoFactory;
  Query: TFDQuery;


{ TModelLogin }

procedure TModelLogin.BuscarInformacoesDoUsuario(Login: TControllerLogin);
begin
  Conexao := TModelConexaoFactory.Create;
  Query := TFDQuery.Create(nil);

  Conexao.DataSetMysql.connection.Connected := true;
  Query.Connection := Conexao.DataSetMysql.connection;
  Query.SQL.Text := 'Select * from login';
  Query.Open;

  Query.RecordCount;
  Login.DataSource.DataSet := Query;
end;

destructor TModelLogin.Destroy;
begin
  Query.Free;
  Conexao.Free;
  inherited;
end;

function TModelLogin.ValidarLogin(Login: TControllerLogin): Boolean;
begin
  Conexao := TModelConexaoFactory.Create;
  Query := TFDQuery.Create(nil);

  Conexao.DataSetMysql.connection.Connected := true;
  Query.Connection := Conexao.DataSetMysql.connection;
  Query.SQL.Text := 'Select * from login where usuario LIKE :pUsuario and senha LIKE :pSenha';
  Query.Params.ParamByName('pUsuario').AsString := Login.Usuario;
  Query.Params.ParamByName('pSenha').AsString := Login.SenhaDoUsuario;
  Query.Open;

  if Query.RecordCount > 0 then
    Result := true
  else
    Result := false;
end;

end.
