program Arreglos;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;



{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }
Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

{--------------------------------------------------------------------------------------------------------}
procedure NumMaximo(v:vector; dimL: integer; var max: integer);
begin
  if (dimL <> 0) then 
    if (v[dimL] > max) then begin
      max:= v[dimL];
      dimL:=dimL - 1;     
      NumMaximo(v,dimL,max);
    end;
end;

{---------------------------------------------------------------------------------------------------------}
function Suma(v:vector; dimL:Integer):Integer;
begin
  if (dimL > 0) then
    Suma:= v[dimL] +Suma(v,dimL-1)
  else
     Suma:=0;
end;


{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   max:integer;
begin
     max:=-29999; 
     cargarVector(v,dimL); 
     NumMaximo(v,dimL,max);
     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('El numero maximo es: ',max);
     writeln('La suma del vector es: ', Suma(v,dimL));
     readln;
end.