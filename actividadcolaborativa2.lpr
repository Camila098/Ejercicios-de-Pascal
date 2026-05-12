Program actividadcolaborativa2;
Type
   pacientes= record
     DNI: longint;
     CP: integer;
     ciudad: string[50];
    end;

   listaP=^nodoPositivos;
   nodoPositivos=record
       dato:pacientes;
       sig:listaP;
   end;

   arbol= ^nodoArbol;
   nodoArbol= record
      CP:integer;
      ciudad:string[50];
      infectados:integer;
      hi,hd:arbol;
   end;

procedure leerPacientes (var p:pacientes; var n:longint);
  begin
    writeln(' ingrese dni del paciente; para finalizar la carga seleccione -1 ');
    read(n);
    if n<>-1 then begin
       p.dni:=n;
       writeln(' ingrese codigo Postal ');
       readln(p.cP);
       writeln(' ingrese nombre de la ciudad ');
       readln(p.ciudad);
       end;
 end;

procedure agregarALaLista(var l:listaP; p:pacientes);
Var aux:listaP;
begin
   new(aux);
      aux^.dato:=p;
      aux^.sig:=L;
      L:=aux;
end;
Procedure crearListaP (var L:listap);
Var p:pacientes;  n:longint;
  Begin
    l:=nil;
    leerPacientes(p,n);
    while  (n<> -1 ) do begin
      agregarALaLista(l,p);
      leerpacientes(p,n);
  End;
    writeln(' lista creada con exito');
    readln ();
 end;

Procedure CrearNodoArbol(var a:arbol; p:pacientes);
begin
   new(a);
   a^.ciudad:=p.ciudad;
   a^.CP:=p.cp;
   a^.infectados:=1;
   a^.hi:=nil;
   a^.hd:=nil;
end;

Procedure InsertarEnArbol(var a :arbol; p:pacientes);
 begin
   if a=nil  then
     CrearNodoArbol(a,p)
   else
      if p.CP< a^.CP then
         InsertarEnArbol(a^.Hi,p)
      else if p.CP > a^.cp then
          InsertarEnArbol(a^.Hd,p)
          else {si es repetido}
             a^.infectados:=a^.infectados+1;
 end;

procedure CargarArbol(var a:arbol; l:ListaP);
var  n:longint;
begin
 a:=nil;
 while(l<>nil) do begin
    insertarEnArbol(a,l^.dato);
    l:=l^.sig;
  end;
End;

Procedure ImprimirArbol(a:arbol);
begin
 if a<>nil then begin
   imprimirArbol(a^.hi);
   writeln( 'codigo postal: ', a^.cp ,' ciudad: ', a^.ciudad ,'  infectades : ', a^.infectados );
   writeln();
   imprimirArbol(a^.hd);
 end;
end;

Procedure verValoresEnRango(a: Arbol);
begin
  if (a <> nil) then
    if (a^.cp >= 1800) then
      if (a^.cp <=1900) then begin
        write(' para el codigo postal ',a^.cp ,' la cantidad de infectados es ', a^.infectados);
        verValoresEnRango(a^.hi);
        verValoresEnRango (a^.hd);
      end
      else
        verValoresEnRango(a^.hi)
    else
      verValoresEnRango(a^.hd);
end;

Procedure EliminarLista(var l:listaP);
  var aux:listaP;
Begin
 while (l<> NIL) do begin
    aux:=l;
    l:=l^.sig;
    dispose(aux);
 end;
end;

Procedure BorrarArbol (var a: arbol);
begin
 if (a <> nil) then
 begin
   BorrarArbol(a^.HI);
   BorrarArbol(a^.HD);
   dispose(a);
   a := nil;
 end;
end;

Var
 l:listaP;
 a:arbol;

begin

 crearListaP(l);

 CargarArbol(a,l);
 writeln('arbol : ');
 imprimirArbol(a);

 writeln(' infectados que se encunetras entre los codigos postales 1800 y 1900 ');
 verValoresEnRango(a);

 BorrarArbol(a);
 eliminarLista(l);
 readln;
end.

