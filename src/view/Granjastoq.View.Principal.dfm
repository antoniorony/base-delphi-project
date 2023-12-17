object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Granjastoq'
  ClientHeight = 600
  ClientWidth = 811
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenuPrincipal
  OnActivate = FormActivate
  TextHeight = 13
  object mmMenuPrincipal: TMainMenu
    Left = 40
    Top = 8
    object Menu1: TMenuItem
      Caption = 'Administra'#231#227'o'
      object Usuarios1: TMenuItem
        Caption = 'Usuarios'
        OnClick = Usuarios1Click
      end
    end
  end
end
