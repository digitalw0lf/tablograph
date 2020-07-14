object ChartForm: TChartForm
  Left = 530
  Top = 93
  Caption = 'Graph'
  ClientHeight = 580
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 33
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Ranges:'
    end
    object SpeedButton1: TSpeedButton
      Left = 280
      Top = 4
      Width = 57
      Height = 22
      Caption = 'Show'
      OnClick = SpeedButton1Click
    end
    object ComboBox1: TComboBox
      Left = 56
      Top = 6
      Width = 185
      Height = 21
      TabOrder = 0
      OnChange = ComboBox1Change
      OnKeyDown = ComboBox1KeyDown
    end
    object CBXAxisDateTime: TCheckBox
      Left = 392
      Top = 8
      Width = 97
      Height = 17
      Caption = 'X - DateTime'
      TabOrder = 1
    end
  end
  object Chart: TChart
    Left = 0
    Top = 33
    Width = 699
    Height = 547
    Legend.CheckBoxes = True
    Legend.LegendStyle = lsSeries
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Panning.MouseWheel = pmwNone
    View3D = False
    Zoom.MouseWheel = pmwNormal
    Align = alClient
    Color = clWhite
    TabOrder = 1
    ExplicitTop = 32
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
