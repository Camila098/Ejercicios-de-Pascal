Program AgregarEnArbol;
Type
  arbol = ^nodo;
  nodo = record
    elem:integer;
    hi:arbol
    hd:arbol
  end; 
{-------------------------------------------------------------------------------}
Procedure Agregar ( Var A: arbol; elem: elemento);  
Begin
   if A = nil Then
    begin
     	New( A );           
     	A^.dato := elem;
        A^.hi  := nil;
        A^.hd  := nil;
    end
  else 
   if (dato < A^.dato) Then Agregar(A^.hi, dato)
   else  Agregar(A^.hd, dato);
End;
{-------------------------------------------------------------------------------}

var A:arbol;
begin
    A:=nil;
    Agregar(A,elem);
end.
