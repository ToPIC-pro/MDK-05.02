program pack1_3_1;

var
  massiv: array of Integer;       // глобальная переменная - динамический массив
  index_positive, j, n: integer;  // глобальные переменные


function SearchPositive(var arr: array of Integer): Integer;  // arr - ФОРМАЛЬНЫЙ ПАРАМЕТР (передача по ссылке для массивов)
var
  i, search_index_positive: integer;  // локальные переменные функции
begin
  search_index_positive := 0;  
  for i:=0 to Length(arr)-1 do
    begin
    if arr[i] >= 0 then
      begin
      search_index_positive := i + 1; // т.к. номер, то есть каким по счету стоит
      break
      end
    end;
  SearchPositive := search_index_positive;  // возврат значения функции
end;


begin
  writeln('Сколько элементов будет в массиве?');
  readln(n);  
  SetLength(massiv, n); 
  writeln('Введите элементы в разные строки');
  for j:=0 to n-1 do
    begin
    readln(massiv[j])
    end;   
  
  index_positive := SearchPositive(massiv);  // massiv - ФАКТИЧЕСКИЙ ПАРАМЕТР (передача массива по ссылке)
  
  writeln(index_positive)
end.
  
