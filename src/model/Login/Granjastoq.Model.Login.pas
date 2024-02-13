unit Granjastoq.Model.Login;

interface

type
  TLogin = class
    private
      FSenhaDoUsuario: String;
      FNomeDoUsuario: String;
      FId: Integer;
      FUsuario: String;
    public
      property Id: Integer read FId write FId;
      property NomeDoUsuario: String read FNomeDoUsuario write FNomeDoUsuario;
      property Usuario: String read FUsuario write FUsuario;
      property SenhaDoUsuario: String read FSenhaDoUsuario write FSenhaDoUsuario;
  end;

implementation

end.
