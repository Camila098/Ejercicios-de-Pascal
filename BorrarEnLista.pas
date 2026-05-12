program BorrarEnLista;
Type
  Lista = ^ nodo;
  nodo = record
       Datos: info; 
       Sig: Lista;
 End;
 
 {-------------------------------------------------------------------------------}
Procedure BorrarElemento (var pri:lista; nom:cadena50; var exito: boolean);
 var ant, act: lista;
 begin 
  exito := false;
  act := pri;
 {Recorro mientras no se termine la lista y no encuentre el elemento}
  while  (act <> NIL)  and (act^.datos.nom <> nom) do begin
      ant := act;
      act := act^.sig
  end;   
  if (act <> NIL) then 
    begin
     exito := true; 
     if (act = pri) then  pri := act^.sig;
                    else  ant^.sig:= act^.sig;
     dispose (act);
   end;
 end;
 {-------------------------------------------------------------------------------}
 
 Var
  L : Lista;
  
 begin
   L:=nil;
 end.