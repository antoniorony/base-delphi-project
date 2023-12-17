unit Granjastoq.Model.Factory;

interface

uses
  Granjastoq.Connection;

Type
  TModelConexaoFactory = class
    private
    public
      function DataSetMysql: TDataModuleConnection;
  end;

implementation

{ TModelConexaoFactory }

function TModelConexaoFactory.DataSetMysql: TDataModuleConnection;
begin
  Result := TDataModuleConnection.Create(nil);
end;

end.
