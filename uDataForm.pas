unit uDataForm;

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, RegExpr, uUtil, KControls,
  KGrids, Clipbrd, Math, OleCtrls, MSScriptControl_TLB, uLargeStr, Menus,
  uMainForm, uFmtTextDraw, ColoredPanel;

type
  TCalcCell = class (TKGridTextCell)
  private
    V:Extended;
    VText:string;
  public
    Caption:string;
    procedure ApplyDrawProperties; override;
    procedure DrawCell(ACol, ARow: Integer; const ARect: TRect;
      State: TKGridDrawState); override;
  end;

  TDataForm = class(TForm)
    Panel1: TPanel;
    Grid: TKGrid;
    ScriptControl1: TScriptControl;
    Button1: TButton;
    GridEditor: TEdit;
    PopupMenu1: TPopupMenu;
    Graph1: TMenuItem;
    N1: TMenuItem;
    Copyvalues1: TMenuItem;
    Copyformulas1: TMenuItem;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ColHdrEditor: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditHdrCaption: TEdit;
    EditHdrFormula: TEdit;
    BtnPasteAs: TSpeedButton;
    PasteParamsFormPanel: TPanel;
    Label3: TLabel;
    CBDelimTab: TCheckBox;
    CBDelimSpace: TCheckBox;
    CBDelimComma: TCheckBox;
    CBDelimCustom: TCheckBox;
    EditCustomDelim: TEdit;
    Button2: TButton;
    CBDelimSemicolon: TCheckBox;
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure GridChanged(Sender: TObject; ACol, ARow: Integer);
    procedure Button1Click(Sender: TObject);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridEditorCreate(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TWinControl);
    procedure GridEditorChange(Sender: TObject);
    procedure GridEditorKeyPreview(Sender: TObject; AEditor: TWinControl; ACol,
      ARow: Integer; var Key: Word; Shift: TShiftState; var IsGridKey: Boolean);
    procedure GridEditorDestroy(Sender: TObject; var AEditor: TWinControl; ACol,
      ARow: Integer);
    procedure Graph1Click(Sender: TObject);
    procedure Copyvalues1Click(Sender: TObject);
    procedure Copyformulas1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure GridEditorDataToGrid(Sender: TObject; AEditor: TWinControl; ACol,
      ARow: Integer; var AssignText: Boolean);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure GridMouseDblClickCell(Sender: TObject; ACol, ARow: Integer);
    procedure EditHdrCaptionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ColHdrEditorExit(Sender: TObject);
    procedure BtnPasteAsClick(Sender: TObject);
  private
    { Private declarations }
//    cInLargeChange:Integer;
    EditedHdrCell:TKGridCoord;
    procedure ApplyColHdrEdit();
  public
    { Public declarations }
    EditingFormula:Boolean;
    procedure PasteTable(const Buf:AnsiString; c1,r1,c2,r2:Integer);
    procedure CopySelected(Formulas:Boolean);
    procedure UpdateColRowNums();
    procedure SetF(R,C:Integer; const Text:AnsiString; Manual:Boolean=False);
    function GetF(R,C:Integer):AnsiString;
    function GetV(R,C:Integer):Extended;
    function GetVText(R,C:Integer):AnsiString;
    procedure RecalcValues();
    procedure BeginLargeChange();
    procedure EndLargeChange();
    procedure TrimEmptyRows(LeaveEmpty:Integer=0);
    procedure ClearSelectedCells();
//    procedure SaveToFile(const FileName:string);
//    procedure LoadFromFile(const FileName:string);
//    procedure SaveAutosave();
//    procedure LoadAutosave();
    function SaveData():AnsiString;
    procedure LoadData(const Buf:AnsiString);
    procedure ClearAllData();
  end;

var
  DataForm: TDataForm;

implementation

uses uChartForm, uScriptForm;

{$R *.dfm}

procedure TDataForm.ApplyColHdrEdit;
var
  Cell:TCalcCell;
begin
  Cell:=Grid.Cell[EditedHdrCell.Col,EditedHdrCell.Row] as TCalcCell;
  Cell.Caption:=EditHdrCaption.Text;
  Cell.Text:=EditHdrFormula.Text;
  ColHdrEditor.Visible:=False;
  RecalcValues();
  Grid.InvalidateCol(EditedHdrCell.Col);
end;

procedure TDataForm.BeginLargeChange;
begin
  Grid.LockUpdate();
end;

procedure TDataForm.BtnPasteAsClick(Sender: TObject);
begin
  with MakeFormWithContent(PasteParamsFormPanel, bsDialog, 'Paste as') do
    if ShowModal() <> mrOk then Exit;

  PasteTable(Clipboard.AsText, Grid.Selection.Col1,Grid.Selection.Row1,
             Grid.Selection.Col2,Grid.Selection.Row2);
end;

procedure TDataForm.Button1Click(Sender: TObject);
var
  i:Integer;
begin
  BeginLargeChange();
  for i:=1 to 1000000 do
  begin
    SetF(i,1,R2S(Sin(i/1000)*100));
  end;
  EndLargeChange();
end;

procedure TDataForm.ClearAllData;
var
  I, J: Integer;
begin
  BeginLargeChange();
  try
//    for I := 1 to Grid.ColCount - 1 do
//      for J := 1 to Grid.RowCount - 1 do
//      begin
//        Grid.Cell[J, I]:=nil;
//      end;
    Grid.ClearGrid();
  finally
    EndLargeChange();
  end;
  UpdateColRowNums();
end;

procedure TDataForm.ClearSelectedCells;
var
  c,r:Integer;
begin
  Grid.SelectionNormalize();
  BeginLargeChange();
  try
    for c:=Grid.Selection.Col1 to Grid.Selection.Col2 do
      for r:=Grid.Selection.Row1 to Grid.Selection.Row2 do
        SetF(r,c,'');
  finally
    EndLargeChange();
  end;
end;

procedure TDataForm.ColHdrEditorExit(Sender: TObject);
begin
  ApplyColHdrEdit();
end;

procedure TDataForm.Copyformulas1Click(Sender: TObject);
begin
  CopySelected(True);
end;

procedure TDataForm.CopySelected(Formulas:Boolean);
var
  c,r:Integer;
  ls:tLargeStr;
  s:AnsiString;
begin
  ls:=tLargeStr.Create();
  Grid.SelectionNormalize();
  for r:=Grid.Selection.Row1 to Grid.Selection.Row2 do
  begin
    for c:=Grid.Selection.Col1 to Grid.Selection.Col2 do
    begin
      if Formulas then s:=GetF(r,c)
                  else s:=GetVText(r,c);
      ls.Add(s);
      if c<Grid.Selection.Col2 then ls.Add(#9);
    end;
    if r<Grid.Selection.Row2 then ls.Add(#13#10);
  end;
  Clipboard.AsText:=ls.GetStr();
  ls.Free;
end;

procedure TDataForm.Copyvalues1Click(Sender: TObject);
begin
  CopySelected(False);
end;

procedure TDataForm.EditHdrCaptionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
    ApplyColHdrEdit();
  if Key=VK_ESCAPE then
    ColHdrEditor.Visible:=False;
end;

procedure TDataForm.EndLargeChange;
begin
  Grid.UnlockUpdate();
  if Grid.UpdateUnlocked then
  begin
    TrimEmptyRows();
    RecalcValues();
  end;
end;

procedure TDataForm.FormCreate(Sender: TObject);
begin
  Grid.CellClass:=TCalcCell;
  Grid.RealizeCellClass;
  UpdateColRowNums();
end;

function TDataForm.GetF(R, C: Integer): AnsiString;
begin
  if (R>=1) and (R<Grid.RowCount) and (C>=1) and (C<Grid.ColCount) then
    Result:=Grid.Cells[C,R]
  else
    Result:='';
end;

function TDataForm.GetV(R, C: Integer): Extended;
begin
  if (R>=1) and (R<Grid.RowCount) and (C>=1) and (C<Grid.ColCount) then
    Result:=(Grid.Cell[C,R] as TCalcCell).V
  else
    Result:=NaN;
end;

function TDataForm.GetVText(R, C: Integer): AnsiString;
begin
  if (R>=1) and (R<Grid.RowCount) and (C>=1) and (C<Grid.ColCount) then
    Result:=(Grid.Cell[C,R] as TCalcCell).VText
  else
    Result:='';
end;

procedure TDataForm.Graph1Click(Sender: TObject);
var
  i:Integer;
  s,s1:AnsiString;
  arr:tStringArray;
begin
  s:=ChartForm.ComboBox1.Text;
  arr:=SplitStrToArr(s,[' '],True);
  Grid.SelectionNormalize;
  for i:=Grid.Selection.Col1 to Grid.Selection.Col2 do
  begin
    s1:=IntToStr(i);
    if StrIndexInArray(arr,s1,False)<0 then
      s:=s+' '+s1;
  end;
  ChartForm.ComboBox1.Text:=s;
  ChartForm.UpdateData2();
  ChartForm.BringToFront();
end;

procedure TDataForm.GridChanged(Sender: TObject; ACol, ARow: Integer);
begin
  SetF(ARow,ACol,Grid.Cells[ACol,ARow],True);
end;

procedure TDataForm.GridContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if (Grid.EditorMode) or (ColHdrEditor.Visible) then
    Handled:=True;
end;

procedure TDataForm.GridEditorChange(Sender: TObject);
var
  s:AnsiString;
begin
  s:=(Sender as TEdit).Text;
  EditingFormula:=(s<>'') and (s[1]='=');
end;

procedure TDataForm.GridEditorCreate(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TWinControl);
begin
  AEditor:=TEdit.Create(nil);
  (AEditor as TEdit).OnChange:=GridEditorChange;
end;

procedure TDataForm.GridEditorDataToGrid(Sender: TObject; AEditor: TWinControl;
  ACol, ARow: Integer; var AssignText: Boolean);
begin
  Grid.Cells[ACol,ARow]:=(AEditor as TEdit).Text;
  AssignText:=False;
end;

procedure TDataForm.GridEditorDestroy(Sender: TObject; var AEditor: TWinControl;
  ACol, ARow: Integer);
begin
  EditingFormula:=False;
end;

procedure TDataForm.GridEditorKeyPreview(Sender: TObject; AEditor: TWinControl;
  ACol, ARow: Integer; var Key: Word; Shift: TShiftState;
  var IsGridKey: Boolean);
begin
  Grid.DefaultEditorKeyPreview(AEditor,ACol,ARow,Key,Shift,IsGridKey);
//  EditingFormula:=False;
end;

procedure TDataForm.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=Ord('V')) and (ssCtrl in Shift) then
  begin
    Grid.SelectionNormalize;
    PasteTable(Clipboard.AsText, Grid.Selection.Col1,Grid.Selection.Row1,
               Grid.Selection.Col2,Grid.Selection.Row2);
    Key:=0;
  end;
  if (Key=Ord('C')) and (ssCtrl in Shift) then
  begin
    CopySelected(True);
    Key:=0;
  end;
  if (Key=Ord('X')) and (ssCtrl in Shift) then
  begin
    CopySelected(True);
    ClearSelectedCells();
    Key:=0;
  end;
  if Key=VK_DELETE then
  begin
    ClearSelectedCells();
    Key:=0;
  end;
end;

procedure TDataForm.GridMouseDblClickCell(Sender: TObject; ACol, ARow: Integer);
var
  R:TRect;
  P:TPoint;
  Cell:TCalcCell;
begin
  if (ARow=0) and (ACol<>0) then
  begin
    Cell:=Grid.Cell[ACol,ARow] as TCalcCell;
    EditHdrCaption.Text:=Cell.Caption;
    EditHdrFormula.Text:=Cell.Text;
    EditedHdrCell.Col:=ACol;
    EditedHdrCell.Row:=ARow;
    Grid.CellRect(ACol,ARow,R);
    P:=Grid.ClientToParent(Point(R.Left,R.Bottom));
    ColHdrEditor.Left:=P.X;
    ColHdrEditor.Top:=P.Y;
    ColHdrEditor.Visible:=True;
    EditHdrFormula.SetFocus();
  end;
end;

procedure TDataForm.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ACol,ARow:Integer;
  r,c:Integer;
  s1:string;

  procedure InsertText(Edit:TEdit; AText:string);
  var
    s:string;
    p:Integer;
  begin
    with Edit do
    begin
      s:=Text;
      p:=SelStart;
      Insert(AText,s,p+1);
      Text:=s;
      SelStart:=p+Length(AText);
    end;
  end;

begin
  if not Grid.MouseToCell(X,Y,ACol,ARow) then Exit;
  if (Button=mbLeft) and (Grid.GridState in [gsNormal,gsClickWaiting]) then
  begin
    if (ACol=0) and (ARow=0) then
      Grid.SelectAll()
    else
      if ACol<Grid.FixedCols then
        Grid.SelectRow(ARow)
    else
      if ARow<Grid.FixedRows then
        Grid.SelectCol(ACol);
  end;
  if Button=mbRight then
  begin
    if (Grid.EditorMode) and (Grid.Editor is TEdit) then
    begin
      r:=ARow-Grid.Row;
      c:=ACol-Grid.Col;
      s1:='v('+IntToStr(r)+','+IntToStr(c)+')';
      InsertText(Grid.Editor as TEdit,s1);
    end;
    if (ColHdrEditor.Visible) and (EditHdrFormula.Focused) then
    begin
      r:=ARow-EditedHdrCell.Row;
      c:=ACol-EditedHdrCell.Col;
      s1:='v('+IntToStr(r)+','+IntToStr(c)+')';
      InsertText(EditHdrFormula,s1);
    end;

  end;
end;

//procedure TDataForm.LoadAutosave;
//begin
//  LoadFromFile(ExePath+'Autosave\Grid.txt');
//end;

procedure TDataForm.LoadData(const Buf: AnsiString);
var
  a1,a2:tStringArray;
  p:PAnsiChar;
  c,r:Integer;
  Cell:TCalcCell;
  s:AnsiString;
begin
  BeginLargeChange();
  try
    ClearAllData();
    a1:=SplitStrToArr(Buf,[#13,#10],True);
    for r:=0 to Length(a1)-1 do
    begin
      a2:=SplitStrToArr(a1[r],[#9],False);
      for c:=1 to Length(a2) do
      begin
        if r=0 then
        begin
          Cell:=Grid.Cell[c,0] as TCalcCell;
          s:=a2[c-1];
          Cell.Caption:=GetNextStrPart(s,['|']);
          Cell.Text:=UnEscapeStr(GetNextStrPart(s,['|']));
          if s<>'' then
            Grid.ColWidths[c]:=StrToIntDef(GetNextStrPart(s,['|']),Grid.ColWidths[c]);
        end
        else
        begin
          SetF(r,c,a2[c-1]);
        end;
      end;
    end;
  finally
    EndLargeChange();
  end;
end;

//procedure TDataForm.LoadFromFile(const FileName: string);
//var
//  Buf:AnsiString;
//  a1,a2:tStringArray;
//  p:PAnsiChar;
//  c,r:Integer;
//begin
//  LoadEntireFile(FileName,Buf);
//  BeginLargeChange();
//  try
//    a1:=SplitStrToArr(Buf,[#13,#10],True);
//    for r:=1 to Length(a1) do
//    begin
//      a2:=SplitStrToArr(a1[r-1],[#9],False);
//      for c:=1 to Length(a2) do
//      begin
//        SetF(r,c,a2[c-1]);
//      end;
//    end;
//  finally
//    EndLargeChange();
//  end;
//end;

procedure TDataForm.PasteTable(const Buf:AnsiString; c1,r1,c2,r2:Integer);
var
  Delim: TCharSet;
  d: Char;
  s,s1:AnsiString;
  p,p1:PAnsiChar;
  {c1,r1,c2,r2,}c,r:Integer;
begin
  if Buf='' then Exit;

  // Read delimiters from dialog window
  Delim := [];
  if CBDelimTab.Checked then Delim := Delim + [#9];
  if CBDelimSpace.Checked then Delim := Delim + [' '];
  if CBDelimComma.Checked then Delim := Delim + [','];
  if CBDelimSemicolon.Checked then Delim := Delim + [';'];
  if CBDelimCustom.Checked then
    for d in EditCustomDelim.Text do
      Delim := Delim + [d];

  p:=@Buf[1];
  Grid.SelectionNormalize();
//  c1:=Grid.Selection.Col1;
//  r1:=Grid.Selection.Row1;
//  c2:=Grid.Selection.Col2;
//  r2:=Grid.Selection.Row2;
  c:=c1; r:=r1;
  BeginLargeChange();
  try
    while (p^<>#0) or (r<=r2) do
    begin
      if p^=#0 then p:=@Buf[1];
      s:=GetNextStrPart(p,[#13]);
      if p^=#10 then Inc(p);
      if s<>'' then
      begin
        p1:=@s[1];
        while p1^<>#0 do
        begin
          s1:=GetNextWord(p1, Delim);
          //Grid.Cells[c,r]:=s1;
          SetF(r,c,s1);
          Inc(c);
        end;
      end;
      Inc(r);
      c:=c1;
    end;
  finally
    EndLargeChange();
  end;
end;

procedure TDataForm.RecalcValues;
// ѕересчитываем значени€ €чеек по формулам
var
  r,c,x:Integer;
  s:AnsiString;
  Cell:TCalcCell;
begin
  ScriptForm.PrepareScriptEngine(ScriptControl1);
  for c:=1 to Grid.ColCount-1 do
    for r:=1 to Grid.RowCount-1 do
    begin
      Cell:=Grid.Cell[c,r] as TCalcCell;
      s:=Cell.Text;
      if s='' then
        s:=(Grid.Cell[c,0] as TCalcCell).Text;
      Cell.VText:=s;
      if s='' then
        Cell.V:=NaN
      else
      if s[1]='=' then
      begin
        Delete(s,1,1);
        ScriptForm.CurCellRow:=r;
        ScriptForm.CurCellCol:=c;
        Cell.V:=ScriptControl1.Eval(s);
        Cell.VText:=R2S(Cell.V);
      end
      else
      begin
        if s[1]='$' then
        begin
          if TryStrToInt(s,x) then Cell.V:=x
                              else Cell.V:=NaN;
        end
        else
        if StrMatchMask(s,'??:??:??.???') then
          Cell.V:=Str2DateTime(s,'','hh:nn:ss.zzz',NaN)
        else
        if StrMatchMask(s,'??:??:??') then
          Cell.V:=Str2DateTime(s,'','hh:nn:ss',NaN)
        else
        if StrMatchMask(s,'??.??.????') then
          Cell.V:=Str2DateTime(s,'dd.mm.yyyy','',NaN)
        else
        if StrMatchMask(s,'??.??.???? ??:??:??.???') then
          Cell.V:=Str2DateTime(s,'dd.mm.yyyy','hh:nn:ss.zzz',NaN)
        else
        if StrMatchMask(s,'??.??.???? ??:??:??') then
          Cell.V:=Str2DateTime(s,'dd.mm.yyyy','hh:nn:ss',NaN)
        else
          Cell.V:=S2RDef(s,NaN);
      end;
    end;
  ScriptForm.CurCellRow:=0;
  ScriptForm.CurCellCol:=0;
end;

//procedure TDataForm.SaveAutosave;
//begin
//  SaveToFile(ExePath+'Autosave\Grid.txt');
//end;

function TDataForm.SaveData: AnsiString;
var
  ls:tLargeStr;
  c,r:Integer;
  Cell:TCalcCell;
begin
  ls:=tLargeStr.Create();
  for c:=1 to Grid.ColCount-1 do
  begin
    Cell:=Grid.Cell[c,0] as TCalcCell;
    ls.Add(Cell.Caption+'|'+EscapeStr(Cell.Text,[#9,'|'])+'|'+IntToStr(Grid.ColWidths[c])+#9);
  end;
  ls.Add(#13#10);
  for r:=1 to Grid.RowCount-1 do
  begin
    for c:=1 to Grid.ColCount-1 do
      ls.Add(GetF(r,c)+#9);
    ls.Add(#13#10);
  end;
  Result:=ls.GetStr();
  ls.Free;
end;

//procedure TDataForm.SaveToFile(const FileName: string);
//var
//  ls:tLargeStr;
//  c,r:Integer;
//begin
//  ls:=tLargeStr.Create();
//  for r:=1 to Grid.RowCount-1 do
//  begin
//    for c:=1 to Grid.ColCount-1 do
//      ls.Add(GetF(r,c)+#9);
//    ls.Add(#13#10);
//  end;
//  SaveEntireFile(FileName,ls.GetStr());
//  ls.Free;
//end;

procedure TDataForm.SetF(R, C: Integer; const Text: AnsiString; Manual:Boolean=False);
// «аписать формулу в €чейку
var
  rc:Integer;
begin
  if (C<1) or (R<1) {or (C>=Grid.ColCount)} then Exit;
  if Manual then rc:=R+3
            else rc:=R+1;
  if (Grid.RowCount < rc) or (Grid.ColCount < C+1) then
  begin
    if (Grid.RowCount < rc) then
      if Grid.UpdateUnlocked then
        Grid.RowCount:=rc
      else
        Grid.RowCount:=(rc*4 div 3)+100;
    if (Grid.ColCount < C+1) then
      Grid.ColCount := C+1;
    UpdateColRowNums();
  end;
  Grid.Cells[C,R]:=Text;
  if Grid.UpdateUnlocked then
  begin
    TrimEmptyRows(IfThen(Manual,2,0));
    RecalcValues();
  end;
  MainForm.ProjModified:=True;
end;

procedure TDataForm.SpeedButton2Click(Sender: TObject);
var
  s:AnsiString;
begin
  if not OpenDialog1.Execute() then Exit;
  LoadEntireFile(OpenDialog1.FileName,s);
  PasteTable(s,1,1,1,1);
end;

procedure TDataForm.TrimEmptyRows(LeaveEmpty:Integer=0);
var
  c,r,LastUsedRow:Integer;
begin
  r:=Grid.RowCount-1;
  LastUsedRow:=0;
//  while r>10 do
  for r:=Grid.RowCount-1 downto 1 do
  begin
    for c:=1 to Grid.ColCount-1 do
      if GetF(r,c)<>'' then
      begin
        LastUsedRow:=r;
        Break;
      end;
//    if r=11 then LastUsedRow:=r;
    if LastUsedRow>0 then Break;
//    Dec(r);
  end;
  if LastUsedRow<10 then LastUsedRow:=10;
  if Grid.RowCount>LastUsedRow+LeaveEmpty+1 then
    Grid.RowCount:=LastUsedRow+LeaveEmpty+1;
end;

procedure TDataForm.UpdateColRowNums;
var
  i:Integer;
begin
//  for i:=1 to Grid.ColCount-1 do
//  with (Grid.Cell[i,0] as TCalcCell) do
//  begin
//    Text:=IntToStr(i);
//    VText:=Text;
//  end;
  for i:=1 to Grid.RowCount-1 do
  with (Grid.Cell[0,i] as TCalcCell) do
  begin
    Text:=IntToStr(i);
    VText:=Text;
  end;
end;

{ TCalcCell }

procedure TCalcCell.ApplyDrawProperties;
var
  s:string;
begin
  inherited;
  if Grid.CellPainter.Row=0 then
  begin
//    if Grid.CellPainter.Col=0 then
//      s := ''
//    else
//    begin
//      s := IntToStr(Grid.CellPainter.Col)+' '+Caption+#13#10+Text;
//    end;
    s:='';
  end
  else
    s := VText;
  Grid.CellPainter.Text := s;
end;

procedure TCalcCell.DrawCell(ACol, ARow: Integer; const ARect: TRect;
  State: TKGridDrawState);
var
  s:AnsiString;
begin
  inherited;
  if (ARow=0) and (ACol<>0) then
  begin
    s := IntToStr(ACol)+' '+Caption+#13#10+Text;
    DrawFmtText(Grid.CellPainter.Canvas,AdjustedRect(ARect,2,2,-3,-3),s,nil,[ftfNoLineBreak,ftfCurFont]);
  end;
end;

end.
