program CalculoDeFactorial;
type
    entero=longInt;

Function factorial(x: entero): entero;
begin
  if (x <= 1) then 
    factorial:= 1
  else
    factorial := x * factorial(x-1)
end;


{PROGRAMA PRINCIPAL}
var 
  num: entero;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num));
  readln;
End.

