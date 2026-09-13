program pack2_1;
var
  massiv: array of Integer;
  new_el, i, count: integer;
  flag: boolean;
  
begin
  writeln('Введите размер массива (количество элементов)');
  readln(count);
  SetLength(massiv, count);
  writeln('Введите элементы');
  flag := True;
  for i:=0 to count-1 do
    begin
    readln(new_el);
    massiv[i] := new_el;
    if i >= 1 then
      begin
      if massiv[i] < massiv[i-1] then
        flag := False 
      end;
    end;
  if flag = True then
    writeln('Упорядочен')
  else
    writeln('Не упорядочен');
end.