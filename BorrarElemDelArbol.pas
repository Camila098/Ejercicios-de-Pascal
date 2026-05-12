Program BorrarElemDelArbol;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 

{-------------------------------------------------------------------------------}  
function minimo ( a:arbol): arbol;       
  begin
    if (a=nil) then minimo:=nil
    else if (a^.izq = nil) then  minimo:= a
                         else minimo:=minimo(a^.izq)
  end;

{-------------------------------------------------------------------------------}
Procedure Borrar ( var a: arbol; x:elemento; var ok:boolean);
  Var
     aux : arbol;
  Begin
    if (a=nil) then ok:=false
    else  begin
       if (x < a^.dato) then Borrar(x,a^.izq,ok)       {Busco en el subarbol   izquierdo}
       else if (x > a^.dato) then Borrar (x,a^.der,ok) {Busco en el sub.derecho}
       else begin                                      {solo hijo a derecha}
	          if (a^.izq =nil) then begin                               
			     aux:= a; 
			     a:= a^.der; 
			     dispose (aux);
              end     
       else                                            {solo hijo a izquierda}
              if (a^.der =nil) then begin
                 aux := a;
                 a := a^.izq;
                 dispose (aux);
              end                                    
       else                       {2 hijos. Reemplazo con el más pequeño de la derecha}
             begin 
              aux := minimo(a^.der)
              a^.dato := aux^.dato;
              Borrar(a^.dato,a^.der,ok);
	         end
                                                end
                             end
                End                                               
{-------------------------------------------------------------------------------}

var a:arbol; 
begin
    a:=nil;
end.
