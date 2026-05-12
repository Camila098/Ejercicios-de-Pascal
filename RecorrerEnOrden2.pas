Program RecorrerEnOrden2;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
Procedure enOrden ( a : arbol );  {imprime de menor a mayor}
begin
     if ( a^.izq <> nil ) then enOrden (a^.izq);
     write (a^.dato); 
     if ( a^.der <> nil ) then enOrden (a^.der);
 end;


{-------------------------------------------------------------------------------}

var a:arbol;
begin
    a:=nil;
end.
