unit cep;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

type
  TClassCep = class(TObject)
  private
     conexao: TDatabase;
     Endereco: string;
     Bairro: string;
     Cidade: string;
     UF: string;
  public
     {Interfaces}
     constructor Create;
     function getEndereco: string;
     function getBairro: string;
     function getCidade: string;
     function getUf: string;
     procedure ConectaServidorCep;
     procedure ChamandoServidorCep(cep: string);
     procedure ChamandoF8Cep(edit_x: TObject);
     procedure DesconectaServidorCep;
  end;

implementation

uses un_exibecep,F8Cep;

constructor TClassCep.Create;
begin
     conexao := TDatabase.Create(nil);
     with (conexao) do
     begin
          AliasName    := 'CEP';
          DataBaseName := 'CEP';
          LoginPrompt  := false;
          Name         := 'servidor_cep';
     end;
end;

procedure TClassCep.ChamandoServidorCep(cep: string);
begin
     if (cep<>'') then
     begin
        try
          Application.CreateForm(Tfrm_ExibeCep,frm_ExibeCep);
          frm_ExibeCep.cep      := cep;
          Endereco := '';
          Bairro   := '';
          Cidade   := '';
          UF       := '';
          frm_ExibeCep.endereco := '';
          frm_ExibeCep.bairro   := '';
          frm_ExibeCep.cidade   := '';
          frm_ExibeCep.uf       := '';
          frm_ExibeCep.exibiu   := false;
          frm_ExibeCep.showmodal;
          Endereco := frm_ExibeCep.endereco;
          Bairro   := frm_ExibeCep.bairro;
          Cidade   := frm_ExibeCep.cidade;
          UF       := frm_ExibeCep.uf;
          frm_ExibeCep.Free;
        except
          conexao.Connected:=false;
          raise;
        end;
     end;
end;

procedure TClassCep.ChamandoF8Cep(edit_x: TObject);
begin
     try
       Application.CreateForm(Tfrm_f8Cep, frm_f8Cep);
       with (frm_f8Cep) do
       begin
           edit:=edit_x;
           ds.dataset.close;
           showmodal;
           Free;
       end;
     except
       conexao.Connected:=false;
       raise;
     end;
end;

procedure TClassCep.ConectaServidorCep;
begin
     if (not conexao.Connected) then
     begin
         conexao.params.clear;
         conexao.Connected:=false;
         TRY
           conexao.Connected:=true;
         except
           conexao.params.Add('USER NAME=');
           conexao.params.Add('PASSWORD=');
           conexao.Connected:=true;
         end;
     end;
end;

function TClassCep.getEndereco:string;
begin
     result:=Endereco;
end;

function TClassCep.getBairro:string;
begin
     result:=Bairro;
end;

function TClassCep.getCidade:string;
begin
     result:=Cidade;
end;

function TClassCep.getUF:string;
begin
     result:=UF;
end;

procedure TClassCep.DesconectaServidorCep;
begin
     conexao.connected := false;
end;

end.
