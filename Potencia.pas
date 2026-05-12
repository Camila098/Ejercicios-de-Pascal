program CalculoDePotencia;

Function potencia (x,n:integer): integer;
begin
  if (n = 0) then 
    potencia:= 1
  else
    potencia := x * potencia(x,n-1)
end;


{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (n);
     write ('Ingrese exponente: ');
     Readln (x);
     writeln('Resultado: ',potencia(n,x));
     readln;
end.