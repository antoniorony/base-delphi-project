object ViewPadrao: TViewPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Padrao'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 56
      Align = alTop
      TabOrder = 0
      object lblHeader: TLabel
        Left = 16
        Top = 12
        Width = 72
        Height = 25
        Caption = 'PADR'#195'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblTipoFiltro: TLabel
        Left = 284
        Top = 18
        Width = 61
        Height = 17
        Caption = 'Filtrar por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object SearchBox1: TSearchBox
        Left = 503
        Top = 17
        Width = 287
        Height = 23
        TabOrder = 0
        Text = 'SearchBox1'
      end
      object cbbTipoDeBusca: TComboBox
        Left = 351
        Top = 17
        Width = 146
        Height = 23
        TabOrder = 1
        Text = 'cbbTipoDeBusca'
      end
    end
    object pnlCentral: TPanel
      Left = 1
      Top = 57
      Width = 798
      Height = 542
      Align = alClient
      TabOrder = 1
      object btnAdicionar: TSpeedButton
        Left = 680
        Top = 456
        Width = 110
        Height = 49
        Caption = 'Adicionar'
        ImageIndex = 29
        Images = ViewImages.ImageListaPrincipal
        Flat = True
        Layout = blGlyphRight
      end
      object btnAtualizar: TSpeedButton
        Left = 528
        Top = 456
        Width = 110
        Height = 49
        Caption = 'Atualizar'
        ImageIndex = 69
        Images = ViewImages.ImageListaPrincipal
        Flat = True
        Layout = blGlyphRight
      end
      object btnRemover: TSpeedButton
        Left = 9
        Top = 456
        Width = 110
        Height = 49
        Caption = 'Excluir'
        ImageIndex = 70
        Images = ViewImages.ImageListaPrincipal
        Flat = True
        Layout = blGlyphRight
      end
      object grdBase: TDBGrid
        Left = 9
        Top = 6
        Width = 781
        Height = 435
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clTeal
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = grdBaseDrawColumnCell
      end
    end
  end
end
