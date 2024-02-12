unit Granjastoq.Connection;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModuleConnection = class(TDataModule)
    connection: TFDConnection;
    driverMysql: TFDPhysMySQLDriverLink;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    transaction: TFDTransaction;
    qryGeral: TFDQuery;
  private
    { Private declarations }
  public
    destructor Destroy; override;

    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleConnection }

{ TDataModuleConnection }

{ TDataModuleConnection }

destructor TDataModuleConnection.Destroy;
begin
  if Assigned(connection) then
    connection.Free;

  if Assigned(driverMysql) then
    driverMysql.Free;

  if Assigned(fdgxwtcrsr1) then
    fdgxwtcrsr1.Free;

  if Assigned(transaction) then
    transaction.Free;

  if Assigned(qryGeral) then
    qryGeral.Free;

  inherited;
end;

end.
