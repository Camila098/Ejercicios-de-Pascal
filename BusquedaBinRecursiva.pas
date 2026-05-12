program VectorOrdenado;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

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

{---------------------------------------------------------------------------------}
function BusquedaBin (v:vector; num,pri,dimL:integer):Integer;
var medio:integer;
begin
    if (pri >= diml) then BusquedaBin:=-1
    else
    begin
       medio:=(pri + dimL) div 2;
       if (v[medio] = num) then BusquedaBin:=medio
       else if (num < v[medio]) then BusquedaBin:=BusquedaBin(v,num,pri,medio-1)      
       else
           BusquedaBin:=BusquedaBin(v,num,medio-1,dimL); 
    end;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   pri,num:integer;

begin
     pri:=1;
     cargarVectorOrdenado(v,dimL);
     writeln('Ingrese valor a buscar :'); readln(num);
     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     if (BusquedaBin(v,num,pri,dimL)=-1) then  writeln('El valor ',num,' no fue encontrado')
         else writeln('El valor ',num,' fue encontrado en la posicion ',BusquedaBin(v,num,pri,dimL));
     readln;
end.


