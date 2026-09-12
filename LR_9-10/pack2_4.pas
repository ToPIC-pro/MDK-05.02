program pack2_4;

type
  TMyArray = array[0..7] of Integer;
  T2MyArray = array[0..7, 0..7] of Integer;
  
function MinArray(arr: T2MyArray): TMyArray;
var
  massiv_min: TMyArray;
  i_func, j_func, min_el: integer;
begin
  for i_func:=0 to 7 do
    begin
    min_el := arr[i_func, 0];
    for j_func:=0 to 7 do
      begin
      if arr[i_func, j_func] < min_el then
        min_el := arr[i_func, j_func] 
      end;
    massiv_min[i_func] := min_el
    end;
  MinArray := massiv_min;
end;


var
  massiv: T2MyArray;
  itog_massiv: TMyArray;
  i, j, sum: integer;
begin
  Randomize;
  for i:=0 to 7 do
    begin
    for j:=0 to 7 do
      massiv[i, j] := Random(101);
    end;
  // красивый вывод исходного массива
  write('[');
  for i:=0 to 7 do
  begin
    write('[');
    for j:=0 to 7 do
    begin
      write(massiv[i, j]);
      if j < 7 then write(',');
    end;
    write(']');
    if i < 7 then writeln(',');  
  end;
  writeln(']');
  // конец красивого вывода исходного массива
  itog_massiv := MinArray(massiv);
  writeln('Массив из минимальных элементов в каждой строке: ', itog_massiv);
  for i:=0 to 7 do
    sum += itog_massiv[i];
  if sum mod 8 = 0 then
    writeln('Массив содержит целое среднее арифметическое: ', sum div 8)
  else
    writeln('Массив не содержит целое среднее арифметическое')   
end.