unit Granjastoq.Model.AllLogin;

interface

uses
  {FireDac}
  FireDAC.Comp.Client,
  Data.DB,
  System.Generics.Collections,

  {Projeto}
  Granjastoq.Controller.Login,
  Granjastoq.Model.Login, System.Classes;


type
  TModelLogin = class
    private
    public
      function ValidarLogin(Login: TLogin): Boolean;
      function BuscarInformacoesDoUsuario(): TList<TLogin>;

  end;

implementation

uses
  Granjastoq.Connection;

var
  Conexao: TDataModuleConnection;
  Query: TFDQuery;


{ TModelLogin }

function TModelLogin.BuscarInformacoesDoUsuario(): TList<TLogin>;
var
  lListaDeLogins: TList<TLogin>;
  lLogin: TLogin;
begin
  Conexao := TDataModuleConnection.Create(nil);
  Query := TFDQuery.Create(nil);
  lListaDeLogins := TList<TLogin>.Create;
  try
    Conexao.connection.Connected := true;
    Query.Connection := Conexao.connection;
    Query.SQL.Text := 'Select * from login';
    Query.Open;

    while not Query.Eof do
      begin
        lLogin := TLogin.Create;
        try
          lLogin.Id := Query.ParamByName('id').AsInteger;
          lLogin.NomeDoUsuario := Query.ParamByName('nomedousuario').AsString;
          lLogin.Usuario := Query.ParamByName('usuario').AsString;
          lLogin.SenhaDoUsuario := Query.ParamByName('senha').AsString;
        lListaDeLogins.Add(lLogin);
        finally
          lLogin.Free;
        end;

        Query.Next;
      end;

      Result := lListaDeLogins;
  finally
    if Assigned(Conexao) then
      begin
        Conexao.connection.Close;
        Conexao.Free;
      end;
    Query.Free;
    lListaDeLogins.Free;
  end;
end;

function TModelLogin.ValidarLogin(Login: TLogin): Boolean;
begin
  Conexao := TDataModuleConnection.Create(nil);
  try
    Query := TFDQuery.Create(nil);

    Conexao.connection.Connected := true;
    Query.Connection := Conexao.connection;
    Query.SQL.Text := 'Select * from login where usuario ';
    Query.SQL.Add('LIKE :pUsuario and senha LIKE :pSenha ');
    Query.Params.ParamByName('pUsuario').AsString := Login.Usuario;
    Query.Params.ParamByName('pSenha').AsString := Login.SenhaDoUsuario;
    Query.Open;

    if Query.RecordCount > 0 then
      Result := true
    else
    Result := false;
  finally
    Conexao.Free;
    Query.Free;
  end;
end;

end.
