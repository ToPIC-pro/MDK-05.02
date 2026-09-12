program dkr2_1;
var  
  massiv: array of Integer;
  n, i, max_el, min_el, new_el, max_el_ind, min_el_ind, summa: integer;
  start_ind, end_ind: integer;

begin
  writeln('Сколько элементов будет в массиве?');
  readln(n);
  SetLength(massiv, n);
  writeln('Введите элементы массива в разные строки');
  
  for i := 0 to n - 1 do
  begin
    readln(new_el);
    massiv[i] := new_el;
  end;
  
  max_el := massiv[0];
  max_el_ind := 0;
  min_el := massiv[0];
  min_el_ind := 0;

  for i:=0 to n - 1 do
  begin
    if massiv[i] > max_el then
    begin
      max_el := massiv[i];
      max_el_ind := i;
    end;  
    if massiv[i] < min_el then
    begin
      min_el := massiv[i];
      min_el_ind := i;
    end;
  end;

  summa := 0;
  
  if max_el_ind > min_el_ind then
    begin
    start_ind := min_el_ind + 1;
    end_ind := max_el_ind - 1;
    end
  else
    begin
    start_ind := max_el_ind + 1;
    end_ind := min_el_ind - 1;
    end;
  
  if start_ind <= end_ind then
  begin
    for i := start_ind to end_ind do
    begin
      summa := summa + massiv[i];
    end;
    writeln('Сумма элементов между min и max: ', summa);
  end
  else
  begin
    writeln('Между min и max нет элементов');
  end;
end.