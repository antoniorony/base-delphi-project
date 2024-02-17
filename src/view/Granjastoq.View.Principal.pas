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
  Rtti, VCLTee.TeCanvas, Vcl.StdCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TViewPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    Menu1: TMenuItem;
    Usuarios1: TMenuItem;
    pnlPrincipal: TPanel;
    pnlLateral: TPanel;
    il1: TImageList;
    pnl1: TPanel;
    img1: TImage;
    lblName: TLabel;
    btnHome: TSpeedButton;
    pnlAdministracao: TPanel;
    imgAdministracao: TImage;
    lblAdministracao: TLabel;
    btnAdministracao: TSpeedButton;
    pnlCentral: TPanel;
    pnlUsuario: TPanel;
    imgUsuario: TImage;
    lblUsuario: TLabel;
    btnUsuario: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnAdministracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // Enums
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

procedure TViewPrincipal.btnAdministracaoClick(Sender: TObject);
begin
  pnlCentral.Visible := True;
end;

procedure TViewPrincipal.btnHomeClick(Sender: TObject);
begin
  var
    I: Integer;

  if TSpeedButton(Sender).Width > 159 then
    begin
      I := 50;
      btnHome.Width := I;
      pnl1.Width := I;
      pnlLateral.Width := I+2;

      btnAdministracao.Width := I;
      pnlAdministracao.Width := I;
    end
  else
    begin
      I := 168;
      btnHome.Width := I;
      pnl1.Width := I;
      pnlLateral.Width := I+2;

      btnAdministracao.Width := I;
      pnlAdministracao.Width := I;
    end;
end;

procedure TViewPrincipal.FormActivate(Sender: TObject);
var
  LoginView: TLoginView;
begin
  LoginView := TLoginView.create(nil);
  try
    LoginView.ShowModal();
  finally
    LoginView.Free;
  end;
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  Self.Color := $00F1F2F3;
  pnlLateral.Color := $00F1F2F3;
end;

procedure TViewPrincipal.Usuarios1Click(Sender: TObject);
var
  lUsuarios: TGestaoLoginView;
begin
  lUsuarios := TGestaoLoginView.create(nil);
  try
    lUsuarios.ShowModal();
  finally
    lUsuarios.Free;
  end;
end;

end.
