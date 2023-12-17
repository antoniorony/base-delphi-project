unit Granjastoq.View.Padrao;

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
  Vcl.WinXCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons;

type
  TViewPadrao = class(TForm)
    pnlPrincipal: TPanel;
    pnlTop: TPanel;
    SearchBox1: TSearchBox;
    lblHeader: TLabel;
    cbbTipoDeBusca: TComboBox;
    lblTipoFiltro: TLabel;
    pnlCentral: TPanel;
    grdBase: TDBGrid;
    btnAdicionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnRemover: TSpeedButton;
    procedure grdBaseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPadrao: TViewPadrao;

implementation

uses
  Granjastoq.View.Images;

{$R *.dfm}

procedure TViewPadrao.grdBaseDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
    begin
      if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
        (Sender as TDBGrid).Canvas.Brush.Color := clTeal
      else
        begin
          (Sender as TDBGrid).Canvas.Brush.Color := $00F1F2F3;
          (Sender as TDBGrid).Canvas.Font.Color:= clTeal;
        end;

      (Sender as TDBGrid).Canvas.FillRect(Rect);
      (Sender as TDBGrid).Canvas.TextOut(Rect.Left + 2, Rect.Top,
      Column.Field.DisplayText);
    end;
end;

end.
