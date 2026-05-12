program AgregarAdelanteLista;
Type
  Lista = ^ nodo;
  nodo = record
       Datos: info; 
       Sig: Lista;
 End;
 
 {-------------------------------------------------------------------------------}
 Procedure AgregarAdelante (var L:lista; per:persona);
 Var nue:Lista;
 Begin
  New(nue);
 nue^.datos:=per;
  nue^.sig:=L;
  L:=nue;
 End;
 {-------------------------------------------------------------------------------}
 
 Var
  L : Lista;
  
 begin
   L:=nil;
 end.