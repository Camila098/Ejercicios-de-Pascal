program InsertarElemOrdenadoLista;
Type
  Lista = ^ nodo;
  nodo = record
       Datos: info; 
       Sig: Lista;
 End;
 
 {-------------------------------------------------------------------------------}
Procedure InsertarElemento ( var pri: lista; per: persona);
 var ant, nue, act: lista;
 begin
 new (nue);
  nue^.datos := per;
  act := pri;
  ant := pri;
 {Recorro mientras no se termine la lista y no encuentro la posición correcta}
 while (act<>NIL) and (act^.datos.nombre < per.nombre) do begin
      ant := act;
      act := act^.sig ;
  end;
 if (ant = act)  then pri := nue   
{el dato va al principio}
 else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
 end;
 {-------------------------------------------------------------------------------}
 
 Var
  L : Lista;
  
 begin
   L:=nil;
 end.