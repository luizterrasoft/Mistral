unit drvedit;

interface



procedure Register;

implementation

uses classes,DesignEditors,DesignIntf,sysutils,vfw,videocap;

// Property Editor for driver selection   in Video-Cap
type
  TDrivereditor= class (TPropertyEditor)
    function GetAttributes:TPropertyAttributes;override;
    procedure GetValues(Proc: TGetStrProc);override;
    function GetValue:String;override;
    procedure SetValue(const Value: String);override;
  end;

function TDriverEditor.GetAttributes:TPropertyAttributes;
begin
  result :=[paRevertable,paValueList];
end;


procedure TDriverEditor.GetValues(Proc: TGetStrProc);
var
  i:Integer;
  name:array[0..80] of Char;
  ver :array[0..80] of Char;
  s:String;

begin
  for i:= 0 to 9 do
  begin
    if capGetDriverDescription( i,name,80,ver,80) then
      s:=strpas(name)
    else
      s:='' ;
    proc(s);
  end;

end;



function TDriverEditor.GetValue:String;

var
  n:array[0..80] of Char;
  ver :array[0..80] of Char;
  s:String;


begin
  with Getcomponent(0) as TVideoCap do
    if capGetDriverDescription( DriverIndex,n,80,ver,80) then
      s:=strpas(n)
    else
      s:='';
  result:= s;               //fVideoDrivername;
end;



procedure TDriverEditor.SetValue(const Value: String);
begin
  with Getcomponent(0) as TVideoCap do
    SetDrivername( value) ;
  Modified;
end;






procedure Register;
begin

  RegisterPropertyEditor(TypeInfo(String),TVideoCap,'DriverName',TDriverEditor);
end;

end.
