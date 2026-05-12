Program SumarLosElemDeUnArbol;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
Procedure sumar (a: arbol; var s: integer);
Begin
  If (a <> nil) then begin
    s:= s + a^.dato;
    sumar (a^.hi, s);
    sumar (a^.hd, s);
  end;
End.


{-------------------------------------------------------------------------------}

var a:arbol; s:integer;
begin
    a:=nil;
    s:=0;
end.
