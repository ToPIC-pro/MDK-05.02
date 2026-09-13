program pack1_3_2;

var
  massiv: array of Integer;       // глобальная переменная - динамический массив
  index_negative, j, n: integer;  // глобальные переменные

function SearchLastNegative(arr: array of Integer): Integer;  // arr - ФОРМАЛЬНЫЙ ПАРАМЕТР (передача по ссылке для массивов)
var
  i, search_index_negative: integer;  // локальные переменные функции
begin
  search_index_negative := 0;
  for i:=0 to Length(arr)-1 do
    begin
    if arr[i] < 0 then
      begin
      search_index_negative := i + 1; // т.к. номер, то есть каким по счету стоит
      end
    end;
  SearchLastNegative := search_index_negative;
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
  
  index_negative := SearchLastNegative(massiv);  // massiv - ФАКТИЧЕСКИЙ ПАРАМЕТР (передача массива по ссылке)
  
  writeln(index_negative)
end.