unit Cf_tbl;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  DBTables, DB, DBCtrls, Forms, Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls,
  Printers, DbiTypes, Dbiprocs;

procedure CriaForm(CFormClass: TFormClass; var CReference);
function IsShowing(formulario:TForm):Boolean;
function GetKeyValues(Table:TTable):String;
procedure SetKeyValues(Table:TTable; Values:String);
function OpenTable(Table:TTable):Boolean;
procedure CloseTable(Tabela:TTable);
procedure Abrir_Tabelas(Formulario:Tform);
procedure Fechar_Tabelas(Formulario:Tform);
function Salva(tabela:TTable):Boolean;

implementation

{***SA_TUDO***}

uses Principal,Funcoes2;

procedure CriaForm(CFormClass: TFormClass; var CReference);
var
  teste:Integer;
begin
  try
    teste:=Tform(CReference).tag;
  except
    Application.CreateForm(CFormClass, CReference);
  end;
end;

function IsShowing(formulario:TForm):Boolean;
begin
  IsShowing:=false;
  if formulario<>nil then
    IsShowing:=formulario.showing;
end;

function GetKeyValues(Table:TTable):String;
var
  cont:Byte;
  retorno:String;
begin
  retorno:='';
  for cont:=0 to Table.IndexFieldCount-1 do
    retorno:=retorno+Table.IndexFields[cont].asstring+';';
  GetKeyValues:=retorno;
end;

procedure SetKeyValues(Table:TTable; Values:String);
var
  value:String;
  cont:Byte;
  pos_ini, pos_fin:Byte;
begin
  pos_ini:=1;
  pos_fin:=pos(';',Values);
  Table.SetKey;
  for cont:=0 to Table.IndexFieldCount-1 do
  begin
    Value:=copy(Values,pos_ini, pos_fin-pos_ini);
    Table.IndexFields[cont].asstring:=Value;
    Values[pos_fin]:='#';
    pos_ini:=pos_fin+1;
    pos_fin:=pos(';',Values);
  end;
  Table.GotoKey;
end;

function get_cursor(tab:TTable):hdbicur;
var
  aux1:array[0..78] of Char;
begin
  strpcopy(aux1, Tab.TableName);
  dbigetcursorfortable(Tab.dbHandle, aux1, nil, result);
end;


function OpenTable(Table:TTable):Boolean;
var
  retorno:Boolean;
  abriu:Boolean;
  aux: HdbiCur;
begin
  retorno:=false;
  if UpperCase(Table.DataBaseName)='SAECO' then
  begin
    if (not Table.Active) and (Table.tablename<>'') then
    begin
      retorno:=true;
      if Table.MasterSource<>nil then
        if TTable(Table.MasterSource.DataSet).active=false then
          abriu:=OpenTable(TTable(Table.MasterSource.DataSet));
      if copy(UpperCase(Table.TableName),1,2)<>'SV' then
        {Sleep(Table);}
        Table.EnableControls;
      Table.Open;
      Table.EnableControls;
    end
  end
  else
  if UpperCase(Table.DataBaseName)='SAECO_LC' then
  begin
    Table.EnableControls;
    try
      Table.Open;
    except
      table.disablecontrols;
      aux:= get_cursor(table);
      DbiRegenIndexes(aux);
      Table.Close;
      Table.EnableControls;
      Table.Open;
    end;
  end;
  OpenTable:=retorno;
end;

function Salva(Tabela:TTable):Boolean;
var
  aux: HdbiCur;
begin
  try
    aux:=get_cursor(tabela);
    dbisavechanges(aux);
    salva:=true;
  except
    salva:=false;
  end;
end;

procedure CloseTable(Tabela:TTable);
var
  StackNo:Byte;
  aux:HdbiCur;
begin
  {if UpperCase(Table.DataBaseName)='SAECO' then
  begin}
    {StackNo:=GetStackNo(Tabela);}
  if (Tabela.tablename<>'') then{ and (Topo[StackNo]>0) then}
    if (Tabela.Active) then
    begin
      Tabela.Refresh;
      Tabela.DisableControls;

        {Teste- 06/05/99}
      aux:=get_cursor(tabela);
      Dbiclosecursor(aux);
      Tabela.Close;
      Tabela.DisableControls;
      if copy(UpperCase(Tabela.TableName),1,2)<>'SV' then
          {WakeUp(Tabela);}
    end;
    {else if Uppercase(Table.DataBaseName)='SAECO_LC' then
         begin
           Table.DisableControls;
           Table.Close;
           Table.DisableControls;
         end;}
end;

procedure Abrir_Tabelas(Formulario:Tform);
var
  cont:Byte;
  cpt:String;
begin
  with formulario do
  begin
    cpt:=caption;
 {   if formulario<>frm_prim then
      caption:='Carregando arquivos, aguarde...';}
    refresh;
    for cont:=0 to componentcount-1 do
      if components[cont] is TTable then
        try
          OpenTable(TTable(components[cont]));
        except
        end;
{    if formulario<>frm_prim then
      caption:=cpt;}
  end;
end;

procedure Fechar_Tabelas(Formulario:Tform);
var
  cont:Byte;
begin
  with formulario do
    for cont:=0 to componentcount-1 do
      if components[cont] is TTable then
        try
          CloseTable(TTable(components[cont]));
        except
        end;
end;

end.
