unit uScriptForm;

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, OleCtrls,
  MSScriptControl_TLB, uUtil, ActnList, ActiveX, System.Actions,
  Generics.Collections;

type
  tScriptEntityFunc = procedure(const EntName:string; Flags:Cardinal;
    const Args:array of Variant; var VarResult:OleVariant) of Object;

  tScriptEntity = record
    Name:string;
    GetFunc,PutFunc:tScriptEntityFunc;
  end;

  TScriptEnv = class (TInterfacedObject, IDispatch)
  private
    procedure V_Get(const EntName:string; Flags:Cardinal;
      const Args:array of Variant; var VarResult:OleVariant);
    procedure V_Put(const EntName:string; Flags:Cardinal;
      const Args:array of Variant; var VarResult:OleVariant);
    procedure Log_(const EntName:string; Flags:Cardinal;
      const Args:array of Variant; var VarResult:OleVariant);
    procedure Row_Get(const EntName:string; Flags:Cardinal;
      const Args:array of Variant; var VarResult:OleVariant);
    procedure Col_Get(const EntName:string; Flags:Cardinal;
      const Args:array of Variant; var VarResult:OleVariant);
    procedure Avg_Get(const EntName:string; Flags:Cardinal;
      const Args:array of Variant; var VarResult:OleVariant);
  public
    EntList:TList<tScriptEntity>;
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
    procedure AddEntity(const Name:string; GetFunc,PutFunc:tScriptEntityFunc);
    function log(const v: OleVariant): OleVariant;
    destructor Destroy(); override;
    constructor Create();
  published

  end;

  TScriptForm = class(TForm)
    Panel1: TPanel;
    BtnRun: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MemoRunScript: TRichEdit;
    MemoFuncsScript: TRichEdit;
    ScriptControl1: TScriptControl;
    MemoLog: TRichEdit;
    ActionList1: TActionList;
    ActionRun: TAction;
    Splitter1: TSplitter;
    ActionAutosave: TAction;
    Label1: TLabel;
    BtnClearLog: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionAutosaveExecute(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure BtnClearLogClick(Sender: TObject);
    procedure MemoRunScriptChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ScriptEnv:TScriptEnv;
    CurCellRow,CurCellCol:Integer;
    procedure PrepareScriptEngine(Script:TScriptControl);
    procedure Autosave();
    function SaveData():AnsiString;
    procedure LoadData(const Buf:AnsiString);
    procedure AddLog(const s:string);
    procedure AddLogF(const Fmt:string; const Args:array of const);
  end;

var
  ScriptForm: TScriptForm;

implementation

uses uDataForm, uMainForm;

const
  TextDiv: AnsiString = #13#10'--- next ---'#13#10;

{$R *.dfm}

procedure TScriptForm.AddLog(const s:string);
begin
  ScriptForm.MemoLog.Lines.Add(s);
  ShowMemoCaret(ScriptForm.MemoLog);
end;

procedure TScriptForm.AddLogF(const Fmt:string; const Args:array of const);
begin
  AddLog(Format(Fmt,Args));
end;

procedure TScriptForm.ActionAutosaveExecute(Sender: TObject);
begin
  Autosave();
end;

procedure TScriptForm.ActionRunExecute(Sender: TObject);
var
  v:Variant;
begin
  Autosave();
  PrepareScriptEngine(ScriptControl1);
  v:=ScriptControl1.Eval(MemoRunScript.Text);
  AddLog('Result = '+VarToStr(v));
end;

procedure TScriptForm.Autosave;
begin
  ForceDirectories(ExePath+'Autosave\');
  if MemoRunScript.Modified then
  begin
    MemoRunScript.Lines.SaveToFile(ExePath+'Autosave\ScriptRun.txt');
    MemoRunScript.Modified:=False;
  end;
  if MemoFuncsScript.Modified then
  begin
    MemoFuncsScript.Lines.SaveToFile(ExePath+'Autosave\ScriptFuncs.txt');
    MemoFuncsScript.Modified:=False;
  end;
end;

procedure TScriptForm.BtnClearLogClick(Sender: TObject);
begin
  MemoLog.Clear;
end;

procedure TScriptForm.PrepareScriptEngine(Script: TScriptControl);
begin
  Script.Reset();
  Script.AddObject('env',ScriptEnv,True);
  Script.AddCode(MemoFuncsScript.Text);
end;

function TScriptForm.SaveData: AnsiString;
begin
  Result:=MemoRunScript.Text+TextDiv+MemoFuncsScript.Text;
end;

procedure TScriptForm.Splitter1Moved(Sender: TObject);
begin
  Label1.Top:=Splitter1.Top;
  BtnClearLog.Top:=Splitter1.Top;
end;

procedure TScriptForm.FormCreate(Sender: TObject);
begin
//  if FileExists(ExePath+'Autosave\ScriptRun.txt') then
//  begin
//    MemoRunScript.Lines.LoadFromFile(ExePath+'Autosave\ScriptRun.txt');
//    MemoRunScript.Modified:=False;
//  end;
//  if FileExists(ExePath+'Autosave\ScriptFuncs.txt') then
//  begin
//    MemoFuncsScript.Lines.LoadFromFile(ExePath+'Autosave\ScriptFuncs.txt');
//    MemoRunScript.Modified:=False;
//  end;
  ScriptEnv:=TScriptEnv.Create();
  ScriptEnv._AddRef;
end;

procedure TScriptForm.FormDestroy(Sender: TObject);
begin
  ScriptEnv._Release;
end;

procedure TScriptForm.LoadData(const Buf: AnsiString);
var
  s:AnsiString;
  i:Integer;
begin
  i:=Pos(TextDiv,Buf);
  MemoRunScript.Text:=Copy(Buf,1,i-1);
  MemoFuncsScript.Text:=Copy(Buf,i+Length(TextDiv),MaxInt);
end;

procedure TScriptForm.MemoRunScriptChange(Sender: TObject);
begin
  MainForm.ProjModified:=True;
end;

{ TScriptEnv }

type
  PNamesArray = ^TNamesArray;
  TNamesArray = array[0..0] of PWideChar;
  PDispIdsArray = ^TDispIdsArray;
  TDispIdsArray = array[0..0] of Integer;

procedure TScriptEnv.AddEntity(const Name: string; GetFunc,
  PutFunc: tScriptEntityFunc);
var
  Item:tScriptEntity;
begin
  Item.Name:=Name;
  Item.GetFunc:=GetFunc;
  Item.PutFunc:=PutFunc;
  EntList.Add(Item);
end;

procedure TScriptEnv.Avg_Get(const EntName: string; Flags: Cardinal;
  const Args: array of Variant; var VarResult: OleVariant);
var
  r1,c1,r2,c2,r,c,Cnt:Integer;
  Sum:Double;
begin
  if Length(Args)=2 then
  begin
    c1:=ScriptForm.CurCellCol+Args[0];
    c2:=c1;
    r1:=ScriptForm.CurCellRow-Args[1] div 2;
    r2:=r1+Args[1]-1;
  end
  else
  if Length(Args)=4 then
  begin
    r1:=Args[0];
    c1:=Args[1];
    r2:=Args[2];
    c2:=Args[3];
  end
  else Exit;

  Sum:=0; Cnt:=0;
  for r:=r1 to r2 do
    for c:=c1 to c2 do
    begin
      Sum:=Sum+DataForm.GetV(r,c);
      Inc(Cnt);
    end;
  if (EntName='avg') and (Cnt>0) then Sum:=Sum/Cnt;
  VarResult:=Sum;
end;

procedure TScriptEnv.Col_Get(const EntName: string; Flags: Cardinal;
  const Args: array of Variant; var VarResult: OleVariant);
begin
  VarResult:=ScriptForm.CurCellCol;
end;

constructor TScriptEnv.Create;
begin
  inherited;
  EntList:=TList<tScriptEntity>.Create();

  AddEntity('v',V_Get,V_Put);
  AddEntity('V',V_Get,V_Put);
  AddEntity('log',Log_,nil);
  AddEntity('row',Row_Get,nil);
  AddEntity('col',Col_Get,nil);
  AddEntity('avg',Avg_Get,nil);
  AddEntity('sum',Avg_Get,nil);
end;

destructor TScriptEnv.Destroy;
begin

  inherited;
end;

function TScriptEnv.GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount,
  LocaleID: Integer; DispIDs: Pointer): HResult;
var
  S: WideString;
  i:Integer;
begin
  // Получаем имя функции или свойства
  S := PNamesArray(Names)[0];
  for i:=0 to EntList.Count-1 do
    if S=EntList[i].Name then
    begin
      PDispIdsArray(DispIds)[0]:=i+1;
      Exit(S_OK);
    end;
  Result:=DISP_E_UNKNOWNNAME;

//  if S='v' then
//    PDispIdsArray(DispIds)[0] := 1
//  else
//  if S='V' then
//    PDispIdsArray(DispIds)[0] := 2
//  else
//  if S='log' then
//    PDispIdsArray(DispIds)[0] := 3
//  else
//  if S='row' then
//    PDispIdsArray(DispIds)[0] := 4
//  else
//  if S='col' then
//    PDispIdsArray(DispIds)[0] := 5
//  else
//    Result:=DISP_E_UNKNOWNNAME;
end;

function TScriptEnv.GetTypeInfo(Index, LocaleID: Integer;
  out TypeInfo): HResult;
begin
  Pointer(TypeInfo) := NIL;
  Result := E_NOTIMPL;
end;

function TScriptEnv.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Count := 0;
  Result := E_NOTIMPL;
end;

function TScriptEnv.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
  Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
var
  dps:TDispParams absolute Params;
  s:string;
  i,n,r,c:Integer;
  Value:AnsiString;
  Func:tScriptEntityFunc;
  Args:array of Variant;
begin
//  s:=Format('Invoke: DispID: %d Flags: %x Args: %d NamedArgs: %d (',[DispID, Flags, dps.cArgs, dps.cNamedArgs]);
//  for i:=0 to dps.cArgs-1 do
//    s:=s+' '+VarToStr(Variant(dps.rgvarg[i]));
//  s:=s+') (';
//  for i:=0 to dps.cNamedArgs-1 do
//    s:=s+' '+IntToStr(dps.rgdispidNamedArgs[i]);
//  s:=s+')';
//  AddLog(s);



  n:=DispID-1;
  if (n>=0) and (n<EntList.Count) then
    with EntList[n] do
    begin
      if (Flags and DISPATCH_PROPERTYPUT)<>0 then Func:=PutFunc
                                             else Func:=GetFunc;
      if Assigned(Func) then
      begin
        SetLength(Args,dps.cArgs);
        for i:=0 to dps.cArgs-1 do
          Args[i]:=Variant(dps.rgvarg[dps.cArgs-1-i]);
        Func(Name,Flags,Args,OleVariant(VarResult^));
        Result:=S_OK;
      end;

    end;

//  Result := S_OK;
//
//  case DispID of
//    1,2:
//      begin
//
//      end;
//    3:
//      begin
//      end;
//    4: if (Flags and DISPATCH_PROPERTYPUT)=0 then
//         OleVariant(VarResult^):=ScriptForm.CurCellRow;
//    5: if (Flags and DISPATCH_PROPERTYPUT)=0 then
//         OleVariant(VarResult^):=ScriptForm.CurCellCol;
//  end;
end;

function TScriptEnv.log(const v: OleVariant): OleVariant;
begin
  ScriptForm.AddLog(VarToStr(v));
end;

procedure TScriptEnv.Log_(const EntName: string; Flags: Cardinal;
  const Args: array of Variant; var VarResult: OleVariant);
var
  s:string;
  i:Integer;
begin
  s:='';
  for i:=0 to Length(Args)-1 do
    s:=s+VarToStr(Variant(Args[i]))+' ';
  ScriptForm.AddLog(s);
end;

procedure TScriptEnv.Row_Get(const EntName: string; Flags: Cardinal;
  const Args: array of Variant; var VarResult: OleVariant);
begin
  VarResult:=ScriptForm.CurCellRow;
end;

procedure TScriptEnv.V_Get(const EntName: string; Flags: Cardinal;
  const Args: array of Variant; var VarResult: OleVariant);
var
  r,c:Integer;
begin
  r:=Args[0];
  c:=Args[1];
  if EntName='v' then
  begin
    r:=ScriptForm.CurCellRow+r;
    c:=ScriptForm.CurCellCol+c;
  end;
  VarResult:=DataForm.GetV(r,c);
end;

procedure TScriptEnv.V_Put(const EntName: string; Flags: Cardinal;
  const Args: array of Variant; var VarResult: OleVariant);
var
  r,c:Integer;
begin
  r:=Args[0];
  c:=Args[1];
  if EntName='v' then
  begin
    r:=ScriptForm.CurCellRow+r;
    c:=ScriptForm.CurCellCol+c;
  end;
  DataForm.SetF(r,c,Args[2]);
end;

end.
