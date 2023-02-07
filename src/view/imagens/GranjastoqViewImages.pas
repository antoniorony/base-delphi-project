unit GranjastoqViewImages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TViewImages = class(TForm)
    ImageListaPrincipal: TImageList;
    ColecaoDeImagens: TImageCollection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewImages: TViewImages;

implementation

{$R *.dfm}

end.
