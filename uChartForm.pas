unit uChartForm;

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LPControl, SLControlCollection, LPControlDrawLayers, SLScope,
  ExtCtrls, StdCtrls, uUtil, Buttons, Math, SLDataDisplay, Mitov.VCLTypes,
  SLDataChart, SLBasicDataDisplay;

type
  TChartForm = class(TForm)
    Chart: TSLScope;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    CBXAxisDateTime: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChartCustomMouseHitLabel(Sender: TObject; XValue, YValue: Real;
      var AxisLabel: string);
    procedure ChartDataToolTip(Sender: TObject; MousePoint: TPoint;
      DataPoint: TSLRealPoint; var Text: string);
    procedure ChartXAxisCustomLabel(Sender: TObject; SampleValue: Real;
      var AxisLabel: string);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateData2();
    procedure SaveAutosave();
    procedure LoadAutosave();
    function SaveData():AnsiString;
    procedure LoadData(Buf:AnsiString);
  end;

var
  ChartForm: TChartForm;

implementation

uses uDataForm, uMainForm, uScriptForm;

{$R *.dfm}

{ TChartForm }

procedure TChartForm.ChartCustomMouseHitLabel(Sender: TObject; XValue,
  YValue: Real; var AxisLabel: string);
begin
//  ScriptForm.AddLog('CustomMouseHitLabel: '+AxisLabel);
  if CBXAxisDateTime.Checked then
    AxisLabel:=DateTime2Str(XValue,'dd.mm.yy hh:nn:ss.zzz')+' : '+R2S(YValue);
end;

procedure TChartForm.ChartDataToolTip(Sender: TObject; MousePoint: TPoint;
  DataPoint: TSLRealPoint; var Text: string);
begin
//  ScriptForm.AddLog('DataToolTip: '+Text);
  if CBXAxisDateTime.Checked then
    Text:=DateTime2Str(DataPoint.X,'hh:nn:ss.zzz');
end;

procedure TChartForm.ChartXAxisCustomLabel(Sender: TObject; SampleValue: Real;
  var AxisLabel: string);
begin
//  ScriptForm.AddLog('XAxisCustomLabel: '+AxisLabel);
end;

procedure TChartForm.ComboBox1Change(Sender: TObject);
begin
  MainForm.ProjModified:=True;
end;

procedure TChartForm.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
    SpeedButton1Click(nil);
end;

procedure TChartForm.LoadAutosave;
var
  s:AnsiString;
begin
  LoadEntireFile(ExePath+'Autosave\GraphCfg.txt',s);
  ComboBox1.Text:=s;
end;

procedure TChartForm.LoadData(Buf: AnsiString);
begin
  ComboBox1.Text:=GetNextWord(Buf,[#13,#10]);
  UpdateData2();
end;

procedure TChartForm.SaveAutosave;
begin
  SaveEntireFile(ExePath+'Autosave\GraphCfg.txt',ComboBox1.Text);
end;

function TChartForm.SaveData: AnsiString;
begin
  Result:=ComboBox1.Text;
end;

procedure TChartForm.SpeedButton1Click(Sender: TObject);
begin
  UpdateData2();
end;

const
  ContrastColors:array[0..14] of TColor = (
    $0000FF, $00FF00, $FF0000,
    $000080, $008000, $800000,
    $808000, $800080, $008080,
    $FF8000, $8000FF, $00FF80,
    $80FF00, $FF0080, $0080FF);

procedure TChartForm.UpdateData2;
var
  GrList,a:tStringArray;
  i:Integer;
  cx,cy,r:Integer;
  x,y:Extended;
  s:string;
begin
  GrList:=SplitStrToArr(ComboBox1.Text,[' '],True);

  while Chart.Channels.Count<Length(GrList) do
    with Chart.Channels.Add() do
    begin
      Width:=2;
      Color:=ContrastColors[Index mod Length(ContrastColors)];
    end;
  while Chart.Channels.Count>Length(GrList) do
  begin
    Chart.Channels.Delete(Chart.Channels.Count-1);
  end;

  for i:=0 to Length(GrList)-1 do
  begin
    Chart.Channels[i].Data.Clear();
    a:=SplitStrToArr(GrList[i],['/']);
    if Length(a)=0 then Continue;
    cy:=StrToInt(a[0]);
    if Length(a)>=2 then
      cx:=StrToInt(a[1])
    else
      cx:=0;
    s:=(DataForm.Grid.Cell[cy,0] as TCalcCell).Caption;
    Chart.Channels[i].Name:=GrList[i]+' '+s;
    with Chart.Channels[i] do
//    if cx=0 then
//    begin
//      ChannelMode:=cmLine;
//      Points.Visible:=False;
//    end
//    else
//    begin
//      ChannelMode:=cmPoint;
//      Points.Visible:=True;
//      Points.Shape:=psDiamond;
//      Points.Size:=2;
//    end;
    for r:=1 to DataForm.Grid.RowCount-1 do
    begin
      if cx=0 then
        x:=r
      else
        x:=DataForm.GetV(r,cx);
      y:=DataForm.GetV(r,cy);
      if (not IsNaN(y)) and (not IsNaN(x)) then
        Chart.Channels[i].Data.AddXYPoint(x,y);
    end;
  end;
end;

end.
