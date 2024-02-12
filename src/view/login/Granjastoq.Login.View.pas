unit Granjastoq.Login.View;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.Mask;

type
  TLoginView = class(TForm)
    pnlPrincipallogin: TPanel;
    pnlRigth: TPanel;
    btnClose: TSpeedButton;
    Usuario: TLabeledEdit;
    Senha: TLabeledEdit;
    btnEntrar: TSpeedButton;
    imgUser: TImage;
    imgPassword: TImage;
    Granjastoq: TLabel;
    img1: TImage;
    lblWarnningMensage: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginView: TLoginView;

implementation

uses
  Granjastoq.View.Images,
  Granjastoq.Controller.Login;

{$R *.dfm}

procedure TLoginView.btnCloseClick(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TLoginView.btnEntrarClick(Sender: TObject);
var
  lControlleLogin: TControllerLogin;
begin
  lControlleLogin := TControllerLogin.Create(Self);
  try
    lControlleLogin.Login.Usuario := Usuario.Text;
    lControlleLogin.Login.SenhaDoUsuario := Senha.Text;

    if lControlleLogin.LogarNoSistema() then
      Close()
    else
      lblWarnningMensage.Caption := 'Usuário ou senha incorreto.';
  finally
    lControlleLogin.Free;
  end;
end;

end.
