Program RecorrerPreOrden;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
Procedure preOrden ( a : arbol );  {orden jerarquico}
begin
   if ( a<> nil ) then begin
     write (a^.dato)
     preOrden (a^.izq)
     preOrden (a^.der)
    end;
end;

{-------------------------------------------------------------------------------}

var a:arbol;
begin
    a:=nil;
end.
