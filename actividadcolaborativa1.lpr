program actividadcolaborativa1;

Type
  venta = record
     codigo: integer;
     cantidad: integer;
     fecha: integer;
     numeroCliente:integer;
  end;


  arbol=^nodoArbol;      
     nodoArbol=record
       codigo:integer;
       kgVendidos:integer;
       hi:arbol;
       hd:arbol;
   end;


procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then begin
       imprimirArbol(a^.hi);
       writeln('Codigo de pasta: ',a^.codigo);
       writeln('Cantidad de kg de pasta vendida: ',a^.kgVendidos);
       imprimirArbol(a^.hd);
    end;

end;

procedure leerVenta (var v:venta);
var n:integer;
  begin
        writeln(' ingrese codigo de cliente ');
        read(n);
        v.numeroCliente:=n;
        if n<>0000 then begin
          writeln(' ingrese codigo de venta ');
          read(v.codigo);
          writeln(' ingrese fecha de venta ');
          read(v.fecha);
           writeln(' ingrese kilos comprados ');
          read(v.cantidad);
           
       end;
  end;

Procedure InsertarEnArbol(var a :arbol; v:venta);
 begin
   if a=nil  then begin
      new(a);
      a^.kgVendidos:=v.cantidad;
      a^.codigo:= v.codigo;
      a^.HD:=nil;
      a^.Hi:=nil;
    end
   else
      if (v.codigo < a^.codigo) then
         InsertarEnArbol(a^.Hi,v)
      else if (v.codigo > a^.codigo) then
          InsertarEnArbol(a^.Hd,v)
        else
          a^.kgVendidos:=a^.kgVendidos+v.cantidad;
 end;

procedure CrearArbol(var a:arbol); {no corta}
var v:venta; 
begin
 leerVenta(v);
 While (v.numeroCliente <> 0000) do begin
    writeln('LLLLLLL: ',v.numeroCliente);
    insertarEnArbol(a, v);
    leerVenta(v);
  end;
end;

procedure inicializar(var a:arbol);
begin
    a:=nil;
end;

procedure buscarMin(a:arbol; min:integer; var cod:integer);
begin
   if a<>nil then begin
     if (a^.kgVendidos < min) then begin
        min:=a^.kgVendidos;
        cod:=a^.codigo;
     end;  
     buscarMin(a^.hi,min,cod);
     buscarMin(a^.hd,min,cod);
  end;
end;

procedure imprimir10kg(a:arbol);
begin
    if(a <> nil) then begin
       if (a^.kgVendidos > 10) then begin
       writeln('Codigo de pasta: ',a^.codigo);
       writeln('Cantidad de kg de pasta vendida: ',a^.kgVendidos);
      end;
    imprimir10kg(a^.hi);
    imprimir10kg(a^.hd);
    end;
end;

procedure menu(a:arbol);
var   aux:integer; v:venta; n,min,cod:integer;
begin
     min:=9999;
     n:=88;
     
     while (n <> 0) do begin
      writeln ('1: Inicializar');
      writeln ('2: Agregar una venta');
      writeln ('3: Imprimir datos');
      writeln ('4: Codigo de la pasta menos vendido');
      writeln ('5: informar codigo con mas de 10 kg');
      writeln ('0: finalizar');
      writeln();
      read(aux);
      case aux of
      0: n:=0;
      1: inicializar(a);
      2: begin leerVenta(v); insertarEnArbol(a,v);end;
      3: imprimirArbol(a);
      4: begin buscarMin(a,min,cod); writeln('El codigo de pasta menos vendido es: ',cod); end;
      5: imprimir10kg(a);
      end;
    end;
end;

var   a:arbol; 

begin
     Randomize;
    
     CrearArbol(a);
     menu(a);

     readln;
end.