object ScriptForm: TScriptForm
  Left = 0
  Top = 0
  Caption = 'Script'
  ClientHeight = 382
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    539
    382)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 321
    Width = 539
    Height = 15
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    ResizeStyle = rsUpdate
    OnMoved = Splitter1Moved
    ExplicitTop = 378
  end
  object Label1: TLabel
    Left = 8
    Top = 321
    Width = 38
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Output:'
  end
  object BtnClearLog: TSpeedButton
    Left = 56
    Top = 321
    Width = 41
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    OnClick = BtnClearLogClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 33
    Align = alTop
    TabOrder = 0
    object BtnRun: TSpeedButton
      Left = 1
      Top = 1
      Width = 56
      Height = 31
      Action = ActionRun
      Align = alLeft
      Caption = 'Run (F9)'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 539
    Height = 288
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Run'
      object MemoRunScript: TRichEdit
        Left = 0
        Top = 0
        Width = 531
        Height = 260
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        Zoom = 100
        OnChange = MemoRunScriptChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Funcs'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoFuncsScript: TRichEdit
        Left = 0
        Top = 0
        Width = 531
        Height = 260
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        Zoom = 100
      end
    end
  end
  object ScriptControl1: TScriptControl
    Left = 48
    Top = 104
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED030000D2F1594E010000002800000010270000
      01000A004A00610076006100530063007200690070007400}
  end
  object MemoLog: TRichEdit
    Left = 0
    Top = 336
    Width = 539
    Height = 46
    Align = alBottom
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
    Zoom = 100
  end
  object ActionList1: TActionList
    Left = 144
    Top = 104
    object ActionRun: TAction
      Caption = 'Run'
      ShortCut = 120
      OnExecute = ActionRunExecute
    end
    object ActionAutosave: TAction
      Caption = 'Autosave'
      ShortCut = 16467
      OnExecute = ActionAutosaveExecute
    end
  end
end
