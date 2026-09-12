program srezi_spiski_5;

var 
  arr: array of Integer;
  n, i, min_el, razmer: integer;
  flag: Boolean;
  
begin
  writeln('Введите размер массива');
  readln(razmer);
  SetLength(arr, razmer);
  writeln('Введите элементы массива в разные строки');
  for i:=1 to razmer do
    begin
    readln(arr[i-1])
    end;
    
  writeln('Введите элемент n');
  readln(n);
  
  min_el := arr.IndexMin;
  
  writeln(arr[:min_el]+n+arr[min_el:]);
end.
