Program RecorrerPostOrden;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
Procedure postOrden ( a : arbol );  {imprime de mayor a menor}
begin
   if ( a<> nil ) then begin
      postOrden (a^.izq)
      postOrden (a^.der)
      write (a^.dato)
   end;
end;

{-------------------------------------------------------------------------------}

var a:arbol;
begin
    a:=nil;
end.
