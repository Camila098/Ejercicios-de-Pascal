program AgregarAlFinal_PtrAlUltNodo_Lista;
Type
  Lista = ^ nodo;
  nodo = record
       Datos: info; 
       Sig: Lista;
 End;
 
 {-------------------------------------------------------------------------------}
procedure AgregarAlFinal2 (var pri, ult: lista; per: persona); 
var  nue:lista;
begin 
 new (nue);
 nue^.datos:= per;
 nue^.sig := NIL;
 if pri <> Nil then 
                 ult^.sig := nue
               else 
                 pri := nue;
 ult := nue;
 end;
 {-------------------------------------------------------------------------------}
 
 Var
  L : Lista;
  
 begin
   L:=nil;
 end.