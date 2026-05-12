program Potencia;

Function potencia2 (x,n: integer): real;
begin
  if (n = 0) then 
    potencia2 := 1
  else 
    potencia2 := x * potencia2(x,n-1);
end;


var
  n,e: integer;
begin
  writeln('Ingrese un número y un exponente: ');
  readln(n);
  readln(e);
  write(' Resultado :',potencia2(n,e):2:0, ' ');
  writeln;
end.


