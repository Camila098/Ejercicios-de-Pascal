Program FuncionMinimoEnArbol;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
function minimo (A :arbol): arbol;  {devuelve un puntero}
  begin
    if (a=nil) then minimo:=nil
    else 
      if (a^.izq = nil) then  minimo:= a
                        else  minimo:=minimo(a^.izq)
  end;

{-------------------------------------------------------------------------------}

var A:arbol;
begin
    A:=nil;
end.
