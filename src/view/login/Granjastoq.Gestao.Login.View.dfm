inherited GestaoLoginView: TGestaoLoginView
  Caption = 'Gest'#227'o de usu'#225'rios'
  ClientHeight = 601
  ClientWidth = 800
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 639
  TextHeight = 13
  inherited pnlPrincipal: TPanel
    Width = 800
    Height = 601
    ExplicitHeight = 600
    inherited pnlTop: TPanel
      Width = 798
      inherited lblHeader: TLabel
        Width = 189
        Caption = 'GEST'#195'O DE USU'#193'RIOS'
        ExplicitWidth = 189
      end
      inherited SearchBox1: TSearchBox
        Font.Color = clTeal
        ParentFont = False
        Text = ''
        OnKeyPress = SearchBox1KeyPress
      end
      inherited cbbTipoDeBusca: TComboBox
        Font.Color = clTeal
        ItemIndex = 0
        ParentFont = False
        Text = 'nome'
        Items.Strings = (
          'nome'
          'usuario'
          'senha')
      end
    end
    inherited pnlCentral: TPanel
      Width = 798
      Height = 543
      ExplicitWidth = 794
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
            FieldName = 'idpersona'
            Title.Caption = 'Codigo Pessoal'
            Width = 120
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
