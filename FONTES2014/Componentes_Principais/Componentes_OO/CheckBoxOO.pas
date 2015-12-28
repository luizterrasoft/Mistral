unit CheckBoxOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, MaskEditOO;

type
  TCheckBoxOO = class(TCheckBox)
  private
    { Private declarations }
    edit1,edit2,edit3: TComponent;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure SetMarca(marca: boolean);
  published
    { Published declarations }
    property zEdit1MarcaOO: TComponent read edit1 write edit1;
    property zEdit2MarcaOO: TComponent read edit2 write edit2;
    property zEditFocusOO: TComponent read edit3 write edit3;
  end;

procedure Register;

implementation

constructor TCheckBoxOO.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     font.style := [fsBold];
     cursor     := crHandPoint;
end;

procedure TCheckBoxOO.SetMarca(marca: boolean);
begin
     if (marca) then
     begin
          if (edit1 is TEdit) then
          begin
               TEdit(edit1).color:=clBtnFace;
               TEdit(edit1).readonly:=true;
               TEdit(edit2).color:=clBtnFace;
               TEdit(edit2).readonly:=true;
               TEdit(edit1).text:='';
               TEdit(edit2).text:='';
          end
          else if (edit1 is TMaskEdit) then
          begin
               TMaskEdit(edit1).color:=clBtnFace;
               TMaskEdit(edit1).readonly:=true;
               TMaskEdit(edit2).color:=clBtnFace;
               TMaskEdit(edit2).readonly:=true;
               TMaskEdit(edit1).text:='';
               TMaskEdit(edit2).text:='';
          end;
          if (edit1 is TMaskEditOO) then
          begin
               TMaskEditOO(edit1).zPainelEntidadeOO.caption := '';
               TMaskEditOO(edit2).zPainelEntidadeOO.caption := '';
          end;
          if (edit3 is TEdit) then
          begin
               try
                  TEdit(edit3).setfocus;
               except
               end;
          end
          else if (edit3 is TMaskEdit) then
          begin
               try
                  TMaskEdit(edit3).setfocus;
               except
               end;
          end;
     end
     else
     begin
          if (edit1 is TEdit) then
          begin
               TEdit(edit1).color:=clWhite;
               TEdit(edit1).readonly:=false;
               TEdit(edit2).color:=clWhite;
               TEdit(edit2).readonly:=false;
               try
                  TEdit(edit1).setfocus;
               except
               end;
          end
          else if (edit1 is TMaskEdit) then
          begin
               TMaskEdit(edit1).color:=clWhite;
               TMaskEdit(edit1).readonly:=false;
               TMaskEdit(edit2).color:=clWhite;
               TMaskEdit(edit2).readonly:=false;
               try
                  TMaskEdit(edit1).setfocus;
               except
               end;
          end;
     end;
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TCheckBoxOO]);
end;

end.
