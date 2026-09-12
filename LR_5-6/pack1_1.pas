program pack1_1;
var
  massiv: array[1..20] of Integer;
  new_el, i: integer;
  
begin
  writeln('Введите 20 элементов в разные строки');
  for i:=1 to 20 do
    begin
    readln(new_el);
    if new_el < 0 then
      begin
      new_el := new_el * new_el;
      massiv[i] := new_el;
      end
    else
      begin
      new_el := 0;
      massiv[i] := new_el;
      end
    end;
  write(massiv);
end.