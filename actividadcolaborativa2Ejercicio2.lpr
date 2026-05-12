Program actividadcolaborativa2Ejercicio2;
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

   listaDNI= ^documento;
     documento=record
        dni:longint;
        sig:listaDNI;
     end;


   arbolDNI= ^nodoArbolDNI;
   nodoArbolDNI=record
     CP:integer;
     ciudad:string;
     infectados:integer;
     lDNI:listaDNI;
     hi,hd:arbolDNI;
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
    writeln();
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
        writeln();
        writeln(' para el codigo postal ',a^.cp ,' la cantidad de infectados es ', a^.infectados);
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

{------------------------------ ejercicio 2 -----------------------------------}
procedure agregarDNI(var l:listaDNI; dni:longint);
var aux:listaDNI;
 begin
      new(aux);
      aux^.dni:=dni;
      aux^.sig:=l;
      l:=aux;
 end;

Procedure CrearNodoDNI(var a:arbolDNI; p:pacientes);
begin
   new(a);
   a^.ciudad:=p.ciudad;
   a^.CP:=p.cp;
   a^.infectados:=1;
   a^.lDNI:=nil;
   a^.hi:=nil;
   a^.hd:=nil;
end;

Procedure InsertarEnArbol(var a :arbolDNI; p:pacientes);
 begin
   if a=nil  then   begin
     CrearNodoDNI(a,p);
     agregarDNI(a^.lDNI,p.DNI);
   end
   else
      if p.CP< a^.CP then
         InsertarEnArbol(a^.Hi,p)
      else if p.CP > a^.cp then
          InsertarEnArbol(a^.Hd,p)
          else {si es repetido}
             begin
                a^.infectados:=a^.infectados+1;
                agregarDNI(a^.lDNI,p.DNI);
             end;

 end;

procedure CargarArbolDNI(var a:arbolDNI; l:ListaP);
var  n:longint;
begin
 while(l<>nil) do begin
    insertarEnArbol(a,l^.dato);
    l:=l^.sig;
  end;
End;

procedure imprimirLista(l: listaDNI);
var n:integer;
begin
   n:=1;
   while (l <> nil) do begin
      writeln('infectado ',n,':  DNI: ',l^.dni,'.');
      n:=n+1;
      l:=l^.sig;
   end;
end;

Procedure verValoresDNI(a: arbolDNI);
begin
  if (a <> nil) then
    if (a^.cp >= 1800) then
      if (a^.cp <=1900) then begin
        writeln();
        writeln(' para el codigo postal ',a^.CP ,' la cantidad de infectados es ', a^.infectados);
        writeln('DNI de los infectados: ');
        imprimirLista(a^.lDNI);
        verValoresDNI(a^.hi);
        verValoresDNI(a^.hd);
      end
      else
        verValoresDNI(a^.hi)
    else
      verValoresDNI(a^.hd);
end;

procedure imprimirArbolDNI(a: arbolDNI);
begin
  if a<>nil then begin
    imprimirArbolDNI(a^.hi);
    writeln( 'codigo postal: ', a^.cp ,' ciudad: ', a^.ciudad ,'  infectades : ', a^.infectados );
    writeln('DNI de los infectados: ');
    imprimirLista(a^.lDNI);
    writeln();
    imprimirArbolDNI(a^.hd);
 end;
end;

procedure EliminarListaDNI(var l:listaDNI);
var aux:listaDNI;
begin
   while(l <> nil) do begin
      aux:=l;
      l:=l^.sig;
      dispose(aux);
   end;
  end;

procedure BorrarArbolDNI(var a:arbolDNI);
begin
   if (a <> nil) then
   begin
     BorrarArbolDNI(a^.HI);
     BorrarArbolDNI(a^.HD);
     EliminarListaDNI(a^.lDNI);
     dispose(a);
     a := nil;
   end;
end;

Var
 l:listaP;
 a:arbol;
 aDNI: arbolDNI;

begin

 crearListaP(l);

 CargarArbol(a,l);
 writeln('arbol : ');
 imprimirArbol(a);

 writeln(' infectados que se encunetras entre los codigos postales 1800 y 1900: ');
 verValoresEnRango(a);
 writeln();

 {-------------------------- ejercicio 2 --------------------------------}
 writeln('arbol con dni: ');
 aDNI:=nil;
 CargarArbolDNI(aDNI,l);

 imprimirArbolDNI(aDNI);
 writeln();

 writeln(' infectados que se encunetras entre los codigos postales 1800 y 1900: ');
 verValoresDNI(aDNI);

 BorrarArbol(a);
 BorrarArbolDNI(aDNI);
 eliminarLista(l);

 readln;
end.

