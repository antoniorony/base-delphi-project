inherited GestaoLoginView: TGestaoLoginView
  Caption = 'Gest'#227'o de usu'#225'rios'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TPanel
    inherited pnlTop: TPanel
      inherited lblHeader: TLabel
        Width = 189
        Caption = 'GEST'#195'O DE USU'#193'RIOS'
        ExplicitWidth = 189
      end
    end
    inherited pnlCentral: TPanel
      inherited grdBase: TDBGrid
        Color = clNone
        DataSource = dsUsuario
        GradientStartColor = clTeal
        TitleFont.Style = []
        Columns = <
          item
            Color = clTeal
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Color = clTeal
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Color = clTeal
            Expanded = False
            FieldName = 'usuario'
            Width = 130
            Visible = True
          end
          item
            Color = clTeal
            Expanded = False
            FieldName = 'senha'
            ImeName = 'Portuguese (Brazilian ABNT)'
            Width = 130
            Visible = True
          end>
      end
    end
  end
  object dsUsuario: TDataSource
    Left = 193
    Top = 513
  end
end
