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
      procedure BuscarInformacoesDoUsuario(pListaDeLogins : TList<TLogin>; pLogin: TLogin);

  end;

implementation

uses
  Granjastoq.Connection;

var
  Conexao: TDataModuleConnection;
  Query: TFDQuery;


{ TModelLogin }

procedure TModelLogin.BuscarInformacoesDoUsuario(pListaDeLogins : TList<TLogin>; pLogin: TLogin);
begin
  Conexao := TDataModuleConnection.Create(nil);
  Query := TFDQuery.Create(nil);
  try
    Conexao.connection.Connected := true;
    Query.Connection := Conexao.connection;
    Query.SQL.Text := 'Select * from login';
    Query.Open;

    while not Query.Eof do
      begin
        pLogin.Id := Query.FieldByName('id').AsInteger;
        pLogin.NomeDoUsuario := Query.FieldByName('nomedousuario').AsString;
        pLogin.Usuario := Query.FieldByName('usuario').AsString;
        pLogin.SenhaDoUsuario := Query.FieldByName('senha').AsString;
        pListaDeLogins.Add(pLogin);

        Query.Next;
      end;

  finally
    if Assigned(Conexao) then
      begin
        Conexao.connection.Close;
        Conexao.Free;
      end;
    Query.Free;
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
