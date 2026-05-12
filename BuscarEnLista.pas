program BuscarEnLista;
Type
  Lista = ^ nodo;
  nodo = record
       Datos: info; 
       Sig: Lista;
 End;
 
 {-------------------------------------------------------------------------------}
function buscar (pri: lista; x:cadena50):boolean;
 Var
   encontre : boolean;
 begin
 encontre := false;
 while (pri <> NIL) and (not encontre) do
 if (x = pri^.datos.nom)  
   then encontre:= true
 else pri:= pri^.sig;
 buscar := encontre
 End;
 {-------------------------------------------------------------------------------}
 
 Var
  L : Lista;
  
 begin
   L:=nil;
 end.