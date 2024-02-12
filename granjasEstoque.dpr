program granjasEstoque;

uses
  LeakCheck.Report,
  LeakCheck.Setup.Trace,
  LeakCheck.Report.FileLog,
  Vcl.Forms,
  Granjastoq.View.Principal in 'src\view\Granjastoq.View.Principal.pas' {ViewPrincipal},
  Granjastoq.Login.View in 'src\view\login\Granjastoq.Login.View.pas' {LoginView},
  Granjastoq.View.Images in 'src\view\imagens\Granjastoq.View.Images.pas' {ViewImages},
  Granjastoq.Connection in 'src\model\Conexao\Granjastoq.Connection.pas' {DataModuleConnection: TDataModule},
  Granjastoq.Model.AllLogin in 'src\model\Login\Granjastoq.Model.AllLogin.pas',
  Granjastoq.Controller.Conexao in 'src\controller\Granjastoq.Controller.Conexao.pas',
  Granjastoq.Controller.Login in 'src\controller\Granjastoq.Controller.Login.pas',
  Granjastoq.View.Padrao in 'src\view\Granjastoq.View.Padrao.pas' {ViewPadrao},
  Granjastoq.Gestao.Login.View in 'src\view\login\Granjastoq.Gestao.Login.View.pas' {GestaoLoginView},
  Granjastoq.Model.Login in 'src\model\Login\Granjastoq.Model.Login.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TLoginView, LoginView);
  Application.CreateForm(TViewImages, ViewImages);
  Application.CreateForm(TViewPadrao, ViewPadrao);
  Application.CreateForm(TGestaoLoginView, GestaoLoginView);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
