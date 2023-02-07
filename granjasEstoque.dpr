program granjasEstoque;

uses
  Vcl.Forms,
  GranjastoqViewPrincipal in 'src\view\GranjastoqViewPrincipal.pas' {ViewPrincipal},
  GranjastoqLoginView in 'src\view\login\GranjastoqLoginView.pas' {LoginView},
  GranjastoqViewImages in 'src\view\imagens\GranjastoqViewImages.pas' {ViewImages},
  GranjastoqConnection in 'src\model\Conexao\GranjastoqConnection.pas' {DataModuleConnection: TDataModule},
  GranjastoqModelFactory in 'src\model\GranjastoqModelFactory.pas',
  GranjastoqModelLogin in 'src\model\Login\GranjastoqModelLogin.pas',
  GranjastoqControllerConexao in 'src\controller\GranjastoqControllerConexao.pas',
  GranjastoqControllerLogin in 'src\controller\GranjastoqControllerLogin.pas',
  GranjastoqViewPadrao in 'src\view\GranjastoqViewPadrao.pas' {ViewPadrao},
  GranjastoqGestaoLoginView in 'src\view\login\GranjastoqGestaoLoginView.pas' {GestaoLoginView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TLoginView, LoginView);
  Application.CreateForm(TViewImages, ViewImages);
  Application.CreateForm(TViewPadrao, ViewPadrao);
  Application.CreateForm(TGestaoLoginView, GestaoLoginView);
  Application.Run;
end.
