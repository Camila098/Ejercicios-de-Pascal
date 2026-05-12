Program BuscarEnArbol;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
Function Buscar (a:arbol; x:elemento): arbol; 
 begin
  if (a=nil) then Buscar:=nil
     else if (x = a^.dato) then Buscar:=a
     else if (x < a^.dato) then Buscar:=Buscar(a^.izq ,x)
     else
          Buscar:=Buscar(a^.der ,x)
 end;

{-------------------------------------------------------------------------------}

var a:arbol; 
begin
    a:=nil;
end.
