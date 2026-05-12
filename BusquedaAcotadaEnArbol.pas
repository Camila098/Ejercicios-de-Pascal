Procedure busquedaAcotada(a: Arbol_Usuarios; inf:integer; sup:integer); 
begin
  if (a <> nil) then
    if (a^.dato.id >= inf) then
      if (a^.dato.id <= sup) then begin
        write(a^.dato.nombre);
        busquedaAcotada(a^.hi, inf, sup);
        busquedaAcotada (a^.hd, inf, sup);
      end
      else
        busquedaAcotada(a^.hi, inf, sup)
    else
      busquedaAcotada(a^.hd, inf, sup);
end;
