program srezi_spiski_1;

var 
  arr: array of Integer;
  n, i: integer;
  
begin
  writeln('Введите размер массива');
  readln(n);
  SetLength(arr, n);
  writeln('Введите элементы массива в разные строки');
  for i:=1 to n do
    begin
    readln(arr[i-1])
    end;
  writeln(arr[::-1]);
end.
