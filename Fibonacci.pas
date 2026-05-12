program FibonacciRecursivo;

function CalcularFibonacci(n: integer): integer;
begin
  if (n = 0) or (n = 1) then
    CalcularFibonacci := n
  else
    CalcularFibonacci := CalcularFibonacci(n - 1) + CalcularFibonacci(n - 2);
end;
var
  numero, i: integer;
begin
  write('Ingrese un número para generar la secuencia de Fibonacci hasta ese término: ');
  readln(numero);
  
  writeln('Secuencia de Fibonacci de ', numero, 'numeros (sin repetir):');
  for i := 0 to numero do
    write(CalcularFibonacci(i), ' ');
  writeln;
end.


