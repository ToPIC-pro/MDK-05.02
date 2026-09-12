program pack3_3;
var
  i, i_insert, new_el, count: integer;
  massiv: array of Integer;
  
begin
  SetLength(massiv, 20);
  count := 0;
  writeln('Введите 20 элементов массива в разные строки');
  for i:=0 to 19 do  
  begin
    readln(new_el);
    if new_el mod 2 = 0 then
      count := count + 1;
    massiv[i] := new_el;
    end;
  if count <> 0 then
  begin
    SetLength(massiv, Length(massiv) + 1);
    for i:=0 to 19 do  
      begin
      if massiv[i] mod 2 = 0 then
        begin
        i_insert := i;
        break
        end
      end;
    for i:=19 downto i_insert+1 do
    begin
      massiv[i+1] := massiv[i];
    end;
    massiv[i_insert+1] := count;
  end;
  writeln(massiv)
end.