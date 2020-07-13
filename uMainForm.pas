unit uMainForm;

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Buttons, ExtCtrls, uUtil, Vcl.StdCtrls,
  SciZipFile, IniFiles, StrUtils;

type
//  IToolWnd = interface
//    ['{76484ED6-B0D8-4AC3-95BD-4BA4666473A6}']
//    procedure SaveAutosave();
//    procedure LoadAutosave();
//  end;

  TMainForm = class(TForm)
    ToolPanel: TPanel;
    BtnTileWindows: TSpeedButton;
    BtnTableForm: TSpeedButton;
    BtnGraphForm: TSpeedButton;
    BtnScriptForm: TSpeedButton;
    InitTimer: TTimer;
    Panel1: TPanel;
    BtnNewProject: TSpeedButton;
    BtnOpenProject: TSpeedButton;
    BtnSaveProject: TSpeedButton;
    BtnSaveProjectAs: TSpeedButton;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure BtnTileWindowsClick(Sender: TObject);
    procedure BtnTableFormClick(Sender: TObject);
    procedure BtnGraphFormClick(Sender: TObject);
    procedure BtnScriptFormClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InitTimerTimer(Sender: TObject);
    procedure BtnOpenProjectClick(Sender: TObject);
    procedure BtnSaveProjectClick(Sender: TObject);
    procedure BtnSaveProjectAsClick(Sender: TObject);
    procedure BtnNewProjectClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    KeepTiled:Boolean;
    ProjFileName:string;
    ProjModified:Boolean;
    AutosaveFile:string;
    procedure SaveProject(const FileName:string);
    procedure LoadProject(const FileName:string);
    procedure TileWindows();
    procedure SaveState();
    procedure LoadState();
    procedure UpdateCaption();
  end;

var
  MainForm: TMainForm;

implementation

uses uDataForm, uChartForm, uScriptForm;

{$R *.dfm}

procedure TMainForm.BtnTileWindowsClick(Sender: TObject);
begin
  TileWindows();
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  ScriptForm.Autosave();
//  DataForm.SaveAutosave();
//  ChartForm.SaveAutosave();
//  SaveProject(AutosaveFile);
  SaveState();
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  DefProjDir:string;
begin
//  KeepTiled:=True;
  DefProjDir:=ExePath+'Projects\';
  ForceDirectories(DefProjDir);
//  FileSaveDialog1.FavoriteLinks.Add.Location:=DefProjDir;
//  FileOpenDialog1.FavoriteLinks.Add.Location:=DefProjDir;
//  FileSaveDialog1.DefaultFolder:=DefProjDir;
//  FileOpenDialog1.DefaultFolder:=DefProjDir;
  SaveDialog1.InitialDir:=DefProjDir;
  OpenDialog1.InitialDir:=DefProjDir;
  AutosaveFile:=ExePath+'Autosave\Autosave.tabg';
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
//  if KeepTiled then
//  begin
//    KeepTiled:=False;
//    BtnTileWindowsClick(nil);
//  end;
end;

procedure TMainForm.InitTimerTimer(Sender: TObject);
begin
  InitTimer.Enabled:=False;
//  DataForm.LoadAutosave();
//  ChartForm.LoadAutosave();
  TileWindows();
  LoadState();
end;

procedure TMainForm.LoadProject(const FileName: string);
var
  Zip:TZipFile;
  i:Integer;
  fn:string;
  Buf:AnsiString;
begin
  ScriptForm.LoadData('');
  DataForm.LoadData('');
  ChartForm.LoadData('');

  if not FileExists(FileName) then Exit;

  Zip:=TZipFile.Create();
  Zip.LoadFromFile(FileName);

  for i:=0 to Zip.Count-1 do
  begin
    fn:=Zip.Name[i];
    Buf:=Zip.Uncompressed[i];
    if fn='Script.txt' then ScriptForm.LoadData(Buf);
    if fn='Table.txt' then DataForm.LoadData(Buf);
    if fn='Graph.txt' then ChartForm.LoadData(Buf);
  end;
  Zip.Free;
end;

procedure TMainForm.LoadState;
var
  f:TIniFile;
begin
  if (ParamCount>0) and (EndsStr('.TABG',UpperCase(ParamStr(1)))) then
  begin
    ProjFileName:=ParamStr(1);
    LoadProject(ProjFileName);
    ProjModified:=False;
  end
  else
  begin
    LoadProject(AutosaveFile);
    f:=TIniFile.Create(ExePath+'Settings.ini');
    ProjFileName:=f.ReadString('OpenProject','FileName','');
    ProjModified:=f.ReadBool('OpenProject','Modified',False);
    f.Free;
  end;
end;

procedure TMainForm.SaveProject(const FileName: string);
var
  Zip:TZipFile;
begin
  Zip:=TZipFile.Create();

  Zip.AddFile('Script.txt');
  Zip.AddFile('Table.txt');
  Zip.AddFile('Graph.txt');
  Zip.Uncompressed[0]:=ScriptForm.SaveData();
  Zip.Uncompressed[1]:=DataForm.SaveData();
  Zip.Uncompressed[2]:=ChartForm.SaveData();

  Zip.SaveToFile(FileName);
  Zip.Free;
end;

procedure TMainForm.SaveState;
var
  f:TIniFile;
begin
  SaveProject(AutosaveFile);
  f:=TIniFile.Create(ExePath+'Settings.ini');
  f.WriteString('OpenProject','FileName',ProjFileName);
  f.WriteBool('OpenProject','Modified',ProjModified);
  f.Free;
end;

procedure TMainForm.TileWindows;
var
  i:Integer;
  sx,sy:Integer;
begin
//  TileMode:=tbVertical;
  for i:=0 to MDIChildCount-1 do
    MDIChildren[i].WindowState:=wsNormal;
//  Tile;
  sx:=ClientWidth-5;
  sy:=ClientHeight-ToolPanel.Height-5;
  DataForm.SetBounds(0,0,sx div 2,sy);
  ChartForm.SetBounds(sx div 2,0,sx div 2,sy*4 div 5);
  ScriptForm.SetBounds(sx div 2,sy*4 div 5,sx div 2,sy div 5);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  UpdateCaption();
end;

procedure TMainForm.UpdateCaption;
var
  s:string;
begin
  s:='Tablograph - ';
  if ProjFileName<>'' then
    s:=s+ExtractFileName(ProjFileName)
  else
    s:=s+'<unnamed>';
  if ProjModified then
    s:=s+' *';
  Caption:=s;
end;

procedure TMainForm.BtnNewProjectClick(Sender: TObject);
begin
  ProjFileName:='';
  DataForm.LoadData('');
  ChartForm.LoadData('');
  ScriptForm.LoadData('');
  ProjModified:=False;
end;

procedure TMainForm.BtnOpenProjectClick(Sender: TObject);
begin
  if not OpenDialog1.Execute() then Exit;
  ProjFileName:=OpenDialog1.FileName;
  LoadProject(ProjFileName);
  ProjModified:=False;
end;

procedure TMainForm.BtnSaveProjectClick(Sender: TObject);
begin
  if ProjFileName<>'' then
  begin
    SaveProject(ProjFileName);
    ProjModified:=False;
  end
  else
    BtnSaveProjectAsClick(Sender);
end;

procedure TMainForm.BtnSaveProjectAsClick(Sender: TObject);
begin
  if not SaveDialog1.Execute() then Exit;
  ProjFileName:=SaveDialog1.FileName;
  SaveProject(ProjFileName);
  ProjModified:=False;
end;

procedure TMainForm.BtnTableFormClick(Sender: TObject);
begin
  DataForm.Show();
end;

procedure TMainForm.BtnGraphFormClick(Sender: TObject);
begin
  ChartForm.Show();
end;

procedure TMainForm.BtnScriptFormClick(Sender: TObject);
begin
  ScriptForm.Show();
end;

end.
