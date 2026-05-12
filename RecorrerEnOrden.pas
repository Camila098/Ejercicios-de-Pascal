Program RecorrerEnOrden;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
Procedure enOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
      enOrden (a^.izq)
      write (a^.dato) 
      enOrden (a^.der)
   end;
end;

{-------------------------------------------------------------------------------}

var a:arbol;
begin
    a:=nil;
end.
