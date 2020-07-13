program Tablograph;

uses
  Forms,
  uDataForm in 'uDataForm.pas' {DataForm},
  uChartForm in 'uChartForm.pas' {ChartForm},
  uMainForm in 'uMainForm.pas' {MainForm},
  uScriptForm in 'uScriptForm.pas' {ScriptForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDataForm, DataForm);
  Application.CreateForm(TChartForm, ChartForm);
  Application.CreateForm(TScriptForm, ScriptForm);
  Application.Run;
end.
