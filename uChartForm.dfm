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
  object Chart: TSLScope
    Left = 0
    Top = 33
    Width = 699
    Height = 547
    Align = alClient
    Color = clWhite
    Zooming.SelectionColor = clBlue
    Zooming.HoldOnZoom = False
    Zooming.Mode = zmXAxis
    NavigateMode = nmPan
    Title.Font.Color = clBlack
    ToolBar.ButtonColor = clSilver
    Trails.Font.Color = clBlack
    TabOrder = 0
    OnDataToolTip = ChartDataToolTip
    Highlighting.MouseHitPoint.PointLabel.Font.Color = clBlack
    YAxis.Color = clBlack
    YAxis.Font.Color = clBlack
    YAxis.ToolBar.ButtonColor = clSilver
    YAxis.AxisLabel.Font.Color = clBlack
    YAxis.DataView.Lines.Pen.Color = clGray
    YAxis.DataView.ZeroLine.Pen.Color = clGray
    XAxis.Color = clBlack
    XAxis.Font.Color = clBlack
    XAxis.ToolBar.ButtonColor = clSilver
    XAxis.AxisLabel.Font.Color = clBlack
    XAxis.OnCustomLabel = ChartXAxisCustomLabel
    XAxis.DataView.Lines.Pen.Color = clGray
    XAxis.DataView.ZeroLine.Pen.Color = clGray
    Legend.Font.Color = clBlack
    Legend.MarkerGroups.Caption.Font.Style = []
    Legend.Cursors.Caption.Font.Style = []
    Legend.CursorLinks.Caption.Font.Style = []
    Legend.Zones.Caption.Font.Style = []
    Legend.Ellipses.Caption.Font.Style = []
    Legend.Labels.Caption.Font.Style = []
    Legend.Channels.Caption.Font.Color = clBlack
    Legend.Channels.Caption.Font.Style = []
    Legend.ChannelLinks.Caption.Font.Style = []
    DataView.Border.Pen.Color = clGray
    Channels = <
      item
        Name = 'Channel0'
      end>
    OnCustomMouseHitLabel = ChartCustomMouseHitLabel
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 33
    Align = alTop
    TabOrder = 1
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
end
