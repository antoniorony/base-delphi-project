unit Granjastoq.View.Principal;

interface

uses
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
  Vcl.WinXCtrls,
  Vcl.Menus,
  Rtti;

type
  TViewPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    Menu1: TMenuItem;
    Usuarios1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //Enums
  TListaDeMenus = (Usuarios, Help);

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  Granjastoq.Login.View,
  Granjastoq.View.Images,
  Granjastoq.Controller.Login,
  Granjastoq.Gestao.Login.View;

{$R *.dfm}

procedure TViewPrincipal.FormActivate(Sender: TObject);
var
  LoginView: TLoginView;
begin
  LoginView:= TLoginView.create(nil);
  try
    LoginView.ShowModal();
  finally
    LoginView.Free;
  end;
end;

procedure TViewPrincipal.Usuarios1Click(Sender: TObject);
var
  lUsuarios: TGestaoLoginView;
begin
  lUsuarios := TGestaoLoginView.Create(nil);
  try
    lUsuarios.ShowModal();
  finally
    lUsuarios.Free;
  end;
end;

end.
