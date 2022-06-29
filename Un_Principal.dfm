object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 416
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 72
    Width = 775
    Height = 336
    ColCount = 8
    RowCount = 7
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 16
    object Escalas1: TMenuItem
      Caption = 'Escalas'
      object Maior1: TMenuItem
        Caption = 'Maior'
        OnClick = Maior1Click
      end
      object Menor1: TMenuItem
        Caption = 'Menor'
        OnClick = Menor1Click
      end
    end
  end
end
